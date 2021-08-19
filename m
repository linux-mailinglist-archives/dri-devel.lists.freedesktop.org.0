Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FBC3F16A6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886E16E5D2;
	Thu, 19 Aug 2021 09:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EB36E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8812C580B73;
 Thu, 19 Aug 2021 05:51:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Aug 2021 05:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qLZkvbW3dWqPT
 Y5EITXLWrLb8ZkWWyHgKQdfdUSJNsY=; b=pDi+NvyNPSy9Gx3/zDKpHeDYGkXMs
 ENL8lIuyLtFBtB2CfwLwx3taUIXb3PVa0MUARenEzxX8PP2gwX0dLNdYwmiShr2S
 NQQiAVoiysWIwFY3VeaNU7JB2nSPGIIG1wStKPHWRsnTAaChAvDDgqq/XKdWn3zV
 jet2WQ5DYke1iVPsVWm2CqcGvLbZkW1VGFj5wsnvYzscgjQlWB0/pa95R3Bd6M+Z
 5zdYt8rvM5hcRkgLxeVT2UK52RKgwFnHJgPYEvFQ2aZ6yGWIcAot/0CQgh/lyipg
 /2Q/T3Ktr8msHTcQl++q4sCwSoN1Z4lpNCofGQ7ksbyqd3MahZEbXwQGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qLZkvbW3dWqPTY5EITXLWrLb8ZkWWyHgKQdfdUSJNsY=; b=T0byhRYk
 85kiErAdzN94pHzMH6UnrDhxyk9RZbUKKTr0uAJ8bLdY4w4tnkz3qS8xtA0x1Fui
 yempuFsjc/XGOwytBWqRJEUTFYmkSoJY5c6OJ5I8qI6KFzNuPF6wY3G0cmE9fnUZ
 QU+ych84lYpUgHVZdDbXzdAY3WpGYHHhu0G0i1IGwqoDslHzOiImncbmg32+7dsu
 VmTXyjNdDMXF/Ll69HGMPlN7mY5w02oYDX5wtFWB/pZTlypDXhgWG8G+sVwRgw3K
 96Vr/a9IPjJp8x9WNd/+7iyvQXVrX8wjjQloeh8wnKBW0Mi18GQxv8oqClEo686E
 8+SHx0CSnaCrgg==
X-ME-Sender: <xms:oikeYR0nI3qEIDSVjQP1H9TSkt9cjqyl9-UBTXQedmkihFz2PlDUlg>
 <xme:oikeYYHRzRLQs1GnEacFHgv9GV_pRj0eTkcRGqeAF6MnIm1lyVCHLpoHQK5vZbTaP
 1Ibnp-9oxVZbb-hBwM>
X-ME-Received: <xmr:oikeYR5yKOSQOjVE8HxSP3iDOtp4iHwdIPBhGepy5V4Tm90rYFWjrB_oktwVSKgMy_-_vrD0Us03LAdKwf6vmRAebiFoU_yySw4H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oikeYe32Svj72s2ddumti4InQgsuNJh78GrsRriYDSpcoIwhLxWmcg>
 <xmx:oikeYUHVg3YeLqIb4tydh69U-SR1jeCd1k-TB24XCQ0jOEZ9MIbydw>
 <xmx:oikeYf_OjF7RHR05lCakhjTRXvGrtImBFdMbzrKQ7haP3GkfIxTmtQ>
 <xmx:oykeYRdLHBuj7dzAyajWJMdZvKVO3-e3_U4oLNVKKAvysdZ46B6rqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 02/10] drm/vc4: hdmi: Fix HPD GPIO detection
Date: Thu, 19 Aug 2021 11:51:11 +0200
Message-Id: <20210819095119.689945-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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
index f9a672a641ab..251dfecf1d4c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -169,9 +169,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
 
-	if (vc4_hdmi->hpd_gpio &&
-	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
-		connected = true;
+	if (vc4_hdmi->hpd_gpio) {
+		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
+			connected = true;
 	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
 		connected = true;
 	}
-- 
2.31.1

