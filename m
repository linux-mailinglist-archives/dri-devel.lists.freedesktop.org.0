Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C658163EB6D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1B10E570;
	Thu,  1 Dec 2022 08:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165210E568
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:44:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 250A25C01A6;
 Thu,  1 Dec 2022 03:44:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 03:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669884251; x=
 1669970651; bh=Wp89GBtaW7MK+d6la9pPlll3p7zimHiYkS2UgGO+ZZU=; b=I
 t/Ddxl/vLtCzgybAsREva1LlWJApQsJKliE29BLqdBVe61HJYI7OoqakerWwRo4u
 V9QVc+YxiVwLQ/3j7w7Tuk0ErI2zm7+0LmD87C9/FD2IN1MFkU8OTH6r+yVprHeW
 pzakRrfVWVGU/CZdzSZoRrtyQovfjVCwST3FW8YDNYMU4lV7lRsdfRBpjtK5CWzT
 waCSZLyMUlEKfczyLPoA5+z+EbbLKROh3zQ/1YtZ6pY4RV1nt6oXZKqF4vaBq+20
 JwnzdvbwWpJQ5OT16wqWFEgy/lJkozQ6CzijBizQJTOW5Ub5TZstRebqkYqrNQJo
 zt5KTV4I6oFvnEavxGyXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669884251; x=
 1669970651; bh=Wp89GBtaW7MK+d6la9pPlll3p7zimHiYkS2UgGO+ZZU=; b=v
 XlGbnGod+KDIVVIUCc5vAMDAZRcfqFI6ZdnkdExsSh6FkVzL84uNaZBf7k1sQbb4
 iRhacGQZl2m6Ru3Wk+qJuqsvYhmdAejWJR1J4Li6OgwFUZlniHs22nBiVqnLOaRV
 6mca32JuqwPeYh+NPKgDGbsoRiXweovcSV+ij70C0nmi3MQI7czP6V+sXECiaQ37
 evxNCKIEZw6VNO88qB8dVzFvg2aunYO4DxPSTOhYnWmmYdlgx5BtoKsHr4lMSnVc
 2MbasUXkh4IqNXtQrWYJLGJKFL+rf7nRNDaiM1Q/uiNQrwAW8sBmYbK14uS6gfr5
 RIjMtNT4eYSgkK7Nh26rg==
X-ME-Sender: <xms:WmmIY5aoLmnicM6w9gVZz9vDecxhmK2bvMs4VesxqZIyWMCvS7iWEg>
 <xme:WmmIYwaoknqHuwwmR_oGTQDWk0XqoDC_Wlflz-AjfcXyKMZBcVL_dfa4mQvCt4EkP
 4SnMIVWp88zdcbngEY>
X-ME-Received: <xmr:WmmIY79GTwS5Iy2bhpEqeWegJD5Mzbgj73OTyYVedmrbjPFs2qIpNuEx6O2jnwWWjpdj65QvHUhS6hCbmpEyP01r1OF16YpxYXOgXaS-g5DpyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:W2mIY3olSC6b99mH-hNSTAGmSQ_jNwh3bcwTGHrw_2xegN1AJCy7HA>
 <xmx:W2mIY0pVHxu6v_OIJiDuu5T_qyTZh4i3BiR4jO2avEk2OOGbUJLCNQ>
 <xmx:W2mIY9RoFgBQw4MPPUU6ZKPwPYF7jpdYLanU32Y21Z1T473FC8PBgg>
 <xmx:W2mIY_8lZQiY-lyF3dUdqvkjYHCkCgUE8-IpyzIzpVpvUAtewQeb7g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 03:44:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 09:42:49 +0100
Subject: [PATCH v3 4/7] drm/vc4: dpi: Support RGB565 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v3-4-eb76e26a772d@cerno.tech>
References: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=frMUS74NDFOUKqROpfuyhXgF/ifuNk0VZpwfF7mFoNs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdmewylwqF7hzuDwpfyMWy+8K8G6fPz9ogP6vi9JFVKr7s
 GgtkOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARVSNGhrV3O9NYNu4OClvStai57i
 rXpcf+qc8Ypph556W251ya/orhn86yJv3vltKH+NjPpjc2WZsePesesDgq7VxbrLf+8crVbAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The RGB565 format with padding over 24 bits
(MEDIA_BUS_FMT_RGB565_1X24_CPADHI) is supported by the vc4 DPI
controller. This is what the Geekworm MZP280 DPI display uses, so let's
add support for it in the DPI controller driver.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 1f8f44b7b5a5..7da3dd1db50e 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -182,6 +182,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
 						       DPI_FORMAT);
 				break;
+			case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
+						       DPI_FORMAT);
+				break;
 			default:
 				DRM_ERROR("Unknown media bus format %d\n",
 					  bus_format);

-- 
b4 0.10.1
