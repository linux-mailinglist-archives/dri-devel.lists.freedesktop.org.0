Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D361E599E
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0FB6E42E;
	Thu, 28 May 2020 07:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8786E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8427558204A;
 Wed, 27 May 2020 11:50:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nraSlgJbsb/0z
 SiZLIXgVenK3TQP78QMuAzCTOoxk9A=; b=HWbvOU3cV14XpZLhsgFbU4JmzTwr2
 t2eh+Uv86tDxtbq+msDaLU/AeuemAj/RCVzQmohicsA3Xoo3GMwK2CKlVxmltfj5
 k8/0MggVYg8smkSZsCVuGyVqs1tAEkiO/3k2JhOuNcQcDOibDvi8h71bd/u5evmQ
 TGpNpAVhZWkoPh7V3PP5xqMLvuM6SsC8pEWo0IiTMyyfLW0xfRMK4HkkrzjdxVTy
 qTv+ZYo9p9VTNALK5yTuCV5DtBNjnq3fGGN4wza87JBqlFtaOBe+sbpssk4ryW+l
 208vM+sCELf+jKU+AF8cWn7aLG8sGiqROztuDHbJPhP4/5iGyAzoSJung==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nraSlgJbsb/0zSiZLIXgVenK3TQP78QMuAzCTOoxk9A=; b=MIM5euon
 lys+3BtC83CyPOPiDZT5GxDEt4v34Q2HZh7aolEnWrmvt5RQ5hu0dbjO7U3qxrtL
 Dlc14QEyzXYQlhIXMZMz6tYLz23upTzsm7COSnliSTFw5/pKLENJTgc7T7D6vCwo
 +6zkypxE9rsDsdGx+I0nd1eF4CvLA785NUtDOIZ4MeqVXB4MBzlCPKy3TyoSYqBq
 4cObxsWWqRYSCcheMyipwokN/XO6D7QpWZ+GcDloJDzSaYnVaoLOZff+UZrDlfXo
 8JLozBArBqwC+B2tA2q3We7tHU/rVdKsxd2NwQFyPPG/6WjJgHcscisCyni372gk
 0vqBo9n+0CGQEA==
X-ME-Sender: <xms:KIzOXlwxG8Ezmqa4Mc2asPTIQzHX7PUbOw3SqxBEX7zL4SBPNYYB1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KIzOXlTIsjdPFuUhWGOfe-R61_dtzaGrUMqUuJrBvXPWv-kPhV7xmA>
 <xmx:KIzOXvUb69PUN_TTXQUTOb2e3p_1g2WMFGyWwIpnB_44nLwDAdoARA>
 <xmx:KIzOXnhx-PaHRmoshoF32hSI8LmLAq6zcqVDEg9oQaRZpqW5v4ZsZg>
 <xmx:KIzOXpAPb8LKTfCLGXBOrVOxofXNsQ8FUlWhtwIuVNgETjN7pqugMQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 240F13280064;
 Wed, 27 May 2020 11:50:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 028/105] drm/vc4: crtc: Restrict HACT_ACT setup to DSI
Date: Wed, 27 May 2020 17:47:58 +0200
Message-Id: <7a93436f97666a2aa025686ef3ff3606de4bec67.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HACT_ACT field only needs to be written to when using a DSI display.
Let's move that setup to our DSI branch to clear a bit the common path.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8dbf06cdb069..5e1d234f3c8e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -344,7 +344,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 			   (is_dsi ? PV_VCONTROL_DSI : 0));
 	}
 
-	CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
+	if (is_dsi)
+		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
 	CRTC_WRITE(PV_CONTROL,
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
