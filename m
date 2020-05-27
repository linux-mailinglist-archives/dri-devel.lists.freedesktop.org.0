Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4141E59DA
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2556E47A;
	Thu, 28 May 2020 07:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1C56E339
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8257858009A;
 Wed, 27 May 2020 11:51:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+Qj40wjGsgmaT
 LoJ1huafAV93DnY5tKGivsUdYQpP8E=; b=SEwit6QJuygllCgzWThRzvX0CV0Ty
 fHPnWASTB7H3ShctxOu2ty0BnFbkHOOXdEKpxwyOU7csjEUWyvVhB54WfXog2WLM
 sFl1g2zdPuntDiSeZdpz3CL/TrcJIumSzqTItmUOGGQjKS5MgPuKMT4REBaHi1+C
 V0RUOQlKKol84U391dTqPAyCBpub8hLFWJnMjXTlPnOxkJnMyerly5OCReDwFaGq
 Mxpow1qPY/KI0fyCdoGKvd9nOCexJb8/mHCfbku25nbTYgHs6Mulpl04qTRty0au
 U0D/ltSbKDI8ZAEstb+q9htY1C0se5M+Ba6q2DIy+PqbKRjUZ7hoBHJ9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+Qj40wjGsgmaTLoJ1huafAV93DnY5tKGivsUdYQpP8E=; b=AIz+aJe+
 YzmSjM0PGvsgZEwhRYgr3+zAlLvYkZrWfV2zfFnHdGghgw9EAdHCqDbqamlqbPCM
 nuvrOVkIifEI7Vjh//MALPL/geGPm1ZSvFT+ZjaOAXyReStKip0NQgN6VnsT2Zda
 gOiKZ2LhCUHKvg0IEPbGLPho4f8Cqh2XtcpEzeVSZvC4p/Cdem4TGqnFmbnFmf9U
 WGqbAJIHX6eTFc0l5TvdPG90mHpo18MPg78VDPsOf1i1U3YTaK39TZS48Sy8zNfI
 zdN2MYfGa2eW2Vg1sh0oKzOumEmNa50iFDkNHrfa4/FWmYzjUdqnefxkcd2bStuc
 9ATWHiHJAQxOyQ==
X-ME-Sender: <xms:cozOXnKWhuyLxACSAile7I9l_qW2xUTi2WMSMKaQYGHMR8TH1aB10g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cozOXrKWhnVyl6Pg4ZvUdkdpnFaB-30zT3VmkYpWwyqcTuytC64_jQ>
 <xmx:cozOXvttKjWwVtQ5RjSyAQ33PBTYWuWadRkwhB9fb8joAc6K9Yt6qw>
 <xmx:cozOXgbCJxS-22Mbprqp3p0aEUhZo_81XsDXRRG6-5QQcWoSXFszow>
 <xmx:cozOXm4xa9-b7VYUY7zAhdrvYTOMaRKYdPyGB72pKJk7zT-nX12OLg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1FC953280064;
 Wed, 27 May 2020 11:51:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 074/105] drm/vc4: hdmi: Use local vc4_hdmi directly
Date: Wed, 27 May 2020 17:48:44 +0200
Message-Id: <ec522ca138dac025490f59a3315acb12b8286566.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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

The function vc4_hdmi_connector_detect access its vc4_hdmi struct by
dereferencing the pointer in the structure vc4_dev. This will cause some
issues when we will have multiple HDMI controllers, so let's just use the
local variable for now instead of dereferencing that pointer all the time,
and we'll fix the local variable later.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 755b3e99a7af..50c67d674331 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -125,20 +125,20 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 
-	if (vc4->hdmi->hpd_gpio) {
-		if (gpio_get_value_cansleep(vc4->hdmi->hpd_gpio) ^
-		    vc4->hdmi->hpd_active_low)
+	if (vc4_hdmi->hpd_gpio) {
+		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
+		    vc4_hdmi->hpd_active_low)
 			return connector_status_connected;
-		cec_phys_addr_invalidate(vc4->hdmi->cec_adap);
+		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return connector_status_disconnected;
 	}
 
-	if (drm_probe_ddc(vc4->hdmi->ddc))
+	if (drm_probe_ddc(vc4_hdmi->ddc))
 		return connector_status_connected;
 
 	if (HDMI_READ(VC4_HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
 		return connector_status_connected;
-	cec_phys_addr_invalidate(vc4->hdmi->cec_adap);
+	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	return connector_status_disconnected;
 }
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
