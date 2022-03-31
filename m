Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0F4EDBCD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E83710EF39;
	Thu, 31 Mar 2022 14:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C62E10EF0F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:37:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EBA2A5C020D;
 Thu, 31 Mar 2022 10:37:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 31 Mar 2022 10:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=uifjtJK1IaaXaQlZMDyIEDSa9Pn0JH
 L+z/u3hqJx6T4=; b=IhFZfFN080eoMi7gDK6qVwQjWTznZq8iJlrEdXEd1z9pXQ
 49hvTYNHSo4wU2D041ANYL68JpHJx22bbgr++ikInYQWkTlz6AHKmvohlvWbuhu9
 9cQUM1RVGx85UFcIc2YB8baaUvK35/17EIiHGy2WlASJIpt0vAEpH/Zee3NdXf15
 Xwuq2eDnvLfuNUxhB7bKvyrequawDSPBXqsU6D0UKpbFjo1iRiB4KZFF3xndwL7y
 eDSjCLI+gMQnqlPYF0OsV5a/G+OU95/G5Td982Xv9SMYoVFSvGVc52VFgTYzvJ7Z
 4kDyqw8ErHevXDsUopNK35noYmJP5IpsbPMjaA+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uifjtJ
 K1IaaXaQlZMDyIEDSa9Pn0JHL+z/u3hqJx6T4=; b=cN6xahVFXWCNKOlfrENFxt
 maDUJU0mKoFmfCRNnIRo2zPlfJYgNqc3V8aiNZaXDrVlfbVffUaffEUDmJrRQS4B
 VpQdrZ7n5o4LE61SSoh6WXdxCeNUxIiPP5XFRdXdHcLfhbFIRWyfsum2i3x8p40m
 3ciZH7HpoUfBCzLWiODzYFjSE5NBgy7CmECk25sHe7uMWWpGNTbbEyagzyB+mAOz
 qtxNmTdwtHX6YUAONW6Yu7Q/OjCWKwY7JtWpRjfzYyACqfjW7MRQJluYqyM9yGUb
 yRCI7ooggxT/rk79kiNO7UJ/5kXHxxKJHvU7mCAecPEdRcMHPNb6dIA7wppU7d2Q
 ==
X-ME-Sender: <xms:wrxFYutrE5-DKWVX7WEX0vbKolQrmndDoc3d0XslwuL1jIfflJYQ7w>
 <xme:wrxFYjcx1Lzkt2pMbbcdYHOh62SKnKSVlEtb_BxNA0vmlu6VgwWBOI-INxn4ZWjyu
 ZnJ_PyYuRwzwd9Kq1U>
X-ME-Received: <xmr:wrxFYpy2pBLkWneyMSuzxWhNQeWkzsn2pifMlaJOc2ovzMpxAzWTB5FSN2ogGM8x9vVwXlcedTgw9-fN-waZ8yiJZ0wxii0Aq-cF7_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wrxFYpNU5dDIoajT-YxmKRlb9bPUshnyqfKCQRNbYbhJcX-i1muwlw>
 <xmx:wrxFYu_YaKm1bHx_02xWWVkeHCzH_QWne-xkVMgYnJF-3nyExhpjVA>
 <xmx:wrxFYhW0xROmU0wM0vn0dnL1s3D3yP86y_MTk7Mvpxnnt-Za1nTU7A>
 <xmx:wrxFYiYjCFBQ-7BuoCayobared0PJ5CP6b4a1F9wvd4Q2Cc2Dy6YfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:37:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/vc4: hvs: Store channel in variable
Date: Thu, 31 Mar 2022 16:37:40 +0200
Message-Id: <20220331143744.777652-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
References: <20220331143744.777652-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assigned_channel field of our vc4_crtc_state structure is accessed
multiple times in vc4_hvs_atomic_flush, so let's move it to a variable
that can be used in all those places.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c8cae10500b9..d225eea6e640 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -460,6 +460,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	unsigned int channel = vc4_state->assigned_channel;
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
@@ -500,8 +501,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		/* This sets a black background color fill, as is the case
 		 * with other DRM drivers.
 		 */
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
-			  HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel)) |
+		HVS_WRITE(SCALER_DISPBKGNDX(channel),
+			  HVS_READ(SCALER_DISPBKGNDX(channel)) |
 			  SCALER_DISPBKGND_FILL);
 
 	/* Only update DISPLIST if the CRTC was already running and is not
@@ -515,7 +516,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		vc4_hvs_update_dlist(crtc);
 
 	if (crtc->state->color_mgmt_changed) {
-		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel));
+		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
 
 		if (crtc->state->gamma_lut) {
 			vc4_hvs_update_gamma_lut(crtc);
@@ -527,7 +528,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 			 */
 			dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
 		}
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel), dispbkgndx);
+		HVS_WRITE(SCALER_DISPBKGNDX(channel), dispbkgndx);
 	}
 
 	if (debug_dump_regs) {
-- 
2.35.1

