Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8A55FFE9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F0B12AFC9;
	Wed, 29 Jun 2022 12:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21CC11BE40
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B73383200952;
 Wed, 29 Jun 2022 08:35:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506118; x=1656592518; bh=ym
 BhDJF4q6mehOBaWADfPA4QyEuYhC+KMn24ivptCcs=; b=i6IQRj+0JE8N0b5xAu
 uJAhsEIxOVm2hsVQ3TqtS3K98DaqiXNu4jZOuT/czBlTDLGp/ZvOa6AT0e1HlJWc
 BUF4iN1WfXx00pRMbEtadUVjKjt/WYruIEJ7LMEaPRq6tZDZ/yAhs2W4bmhjDfYG
 eyd6e52DoelGYgtQgMvxTwsFcD3/r4sIpD8vZ4NGPdNihP4ErMCU2jTY26Z2fvQp
 iR6cYTDwVxqs76oHASqNiWOSsRDLuiNQRuMRWd4NaTOtd++5en7FFn4FQI+KpBvh
 mOaJZznbgYeWOyjNpGCEFGMjH6i8X3afHvRRettkuIfTs00sdv/OSvtCjRODNCTO
 GwoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506118; x=1656592518; bh=ymBhDJF4q6meh
 OBaWADfPA4QyEuYhC+KMn24ivptCcs=; b=JLamMu3mh3zOtUIuZ6Z/ts6dJN9EY
 9IQJxZ/ZyfbG3y7OsigCXi+EgjsUl5riNDeK47kQskXNfAjvcI+a63kI8pY6QYvg
 jnvqW2mqfNrjEOibglJ4cRV4DZt0i6Y9QDZ+hm9aJb4v9LT8lnFpCh//I2y0MSL1
 NM1T4CgR6AyhjtvqvUZkDUMiY5OvYDeOGCg4AQDu5ZPg/y5Q0awd2rLFHbDKTwhg
 BIoFViU4aLU8O73LeDEczELb01jrLIj47GS+hMHBZx5hkHZmg2HBXhDaGq3kzI1p
 6dceJSfAQaj4zdDUSJVS9GwZLNwyj71qBNI8mQLPhOXy/s7oOgPNGK6ZA==
X-ME-Sender: <xms:BUe8YtoXnNEi7ZF1ZkshBhTPfbbG3jUQUxuc7Yr2P7jzq9podHioOg>
 <xme:BUe8Yvof0s3bGlKYySTVCOx5O5giSerAcQW82SB821KR66thVn4yHr-p0usTSysRR
 lO3elspRa5qubrqXjE>
X-ME-Received: <xmr:BUe8YqORCqmgV2k0Z5tzBzbSNzv-WK5GxsrOQ3WpkXw6abkXUJldMs0PW06KigK1CcoYjocU2mdATc-JeD7OGJ2bEMQgpyzZrOnxOQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BUe8Yo7gf1kA0Me_UGDDxSGGD9THUsxDmLHrFki4lnVSIHMadmf8gQ>
 <xmx:BUe8Ys70XWLTBPtTBlvowZjQxl02qvT2wMnVBUEHeF3j-dT6wwHUbw>
 <xmx:BUe8YgjswB6dVr_AhS73gEXVTZ53Vv4AGL7ghUrlhzx-TKEahhi4fg>
 <xmx:Bke8Yn2_BE0KIREG3QfCGA_yeeBuNmmmf28Z72DGTAFW_q5iTt5WUw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 01/71] drm/mipi-dsi: Detach devices when removing the host
Date: Wed, 29 Jun 2022 14:34:00 +0200
Message-Id: <20220629123510.1915022-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever the MIPI-DSI host is unregistered, the code of
mipi_dsi_host_unregister() loops over every device currently found on that
bus and will unregister it.

However, it doesn't detach it from the bus first, which leads to all kind
of resource leaks if the host wants to perform some clean up whenever a
device is detached.

Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..c317ee9fa445 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -346,6 +346,7 @@ static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
+	mipi_dsi_detach(dsi);
 	mipi_dsi_device_unregister(dsi);
 
 	return 0;
-- 
2.36.1

