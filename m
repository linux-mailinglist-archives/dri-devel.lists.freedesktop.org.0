Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B3439A7B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0116E0CC;
	Mon, 25 Oct 2021 15:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760946E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B44C55806D4;
 Mon, 25 Oct 2021 11:29:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 11:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=apYCseIKPEa7T
 yvpW6vrDcktfnDBwxegPWvT7BJ6R7o=; b=D+xlObxnqtG5KmvRn6mhjlRZmND2x
 3yGVLDfxIsENjOLqkFjNvGt2/CiPPmyIo7g13uE9EwikIFMu6uMPv164wypXGVN+
 Q/2LehDwKQeV9U83WMoQr43AMja1nr2RUNAxTaOgXwfj9mlSOAONboy5KuiA8a7k
 N3RxW0WiQV3BwYrBPNeJOwn6RVuLDKmgLQGBlwqCVRWeCEd3VGHbVr55KkRI5w5G
 Le643Exdj9+dmbsnOXR0DsTamlBtRheksGe9+vtOsIruIOmMH5GJ78MtJ/VVwqfD
 WUXagBHyYQDeXVxTaI4huHnT7mVjGx/nEu6oNWxeauKVSAT84f6/TDEcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=apYCseIKPEa7TyvpW6vrDcktfnDBwxegPWvT7BJ6R7o=; b=b6U++hPB
 FyMJhcR6QvSKJssGDL8QB2EGjQOcS4Bo5fO1VDMyvBClBu2LMFdbc0QtqhmzTOGJ
 mPCaNhySjKkaE4DG8b+Wf5kkxyWLXtq78PjcDiZb54V7HsPjXFZbAMZGea1YIEL9
 l8vQgbDSycx5nNggH9bRUNDBZenpTiz9a0OZjiLrLi93Qhs2K4DJir8npd7TneBm
 +vSb0ECGQzBbvAE0UQJTQ284FtFDgpY6/T77MmWjPwCf3Y/qG+oVIIDKJFnJ2A5c
 +hVrgZNRptYKXPVqEuLcRFkduEVkvsR7P3yn4hrUg6HzFbsy4YiDfSbmW2+qmKwS
 iGmr8K9coD5BRw==
X-ME-Sender: <xms:Rs12YfUfV_ew-i3CtG_cggp7oISiwDo-q_OAXWOtcyUGRmSeQEBn0A>
 <xme:Rs12YXnVoMotFg5S9jW46K3gk_RczLgIsStq1ueik1rjUc3gly2dHxxEHTDwv95_n
 W0eYouVFqDQUzKMJV0>
X-ME-Received: <xmr:Rs12YbbyMXe4gWhfvLIb2xP-JG-qiYvtlxuV96fUD_dICAFk6tVjih4XqfDTd9dpD5P89v9BPafCPJqRODJOejzN583NSGjwfhQU6CRZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R812YaVH_3j4RdIT3-tt4DQEBABacX2XGJIVJhqKJri-YDHhENls6w>
 <xmx:R812YZmDbz3a5__-WE4WcPld6NZK-CpwG3RdsP0rpe08AGe0aRJiyA>
 <xmx:R812YXcaqdiTGZAdPFVRvik3iMWJAIa3xcsMveNbcmBZZ6YzoHWczA>
 <xmx:R812Ye8sPFTDl_nZmevRdkYkd_mMnKtLQlXoFpb0IO7zLLsXE5SWlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 02/10] drm/vc4: hdmi: Fix HPD GPIO detection
Date: Mon, 25 Oct 2021 17:28:55 +0200
Message-Id: <20211025152903.1088803-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior to commit 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod"), in the
detect hook, if we had an HPD GPIO we would only rely on it and return
whatever state it was in.

However, that commit changed that by mistake to only consider the case
where we have a GPIO and it returns a logical high, and would fall back
to the other methods otherwise.

Since we can read the EDIDs when the HPD signal is low on some displays,
we changed the detection status from disconnected to connected, and we
would ignore an HPD pulse.

Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 338968275724..dde67b991ae7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -190,9 +190,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
 
-	if (vc4_hdmi->hpd_gpio &&
-	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
-		connected = true;
+	if (vc4_hdmi->hpd_gpio) {
+		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
+			connected = true;
 	} else {
 		unsigned long flags;
 		u32 hotplug;
-- 
2.31.1

