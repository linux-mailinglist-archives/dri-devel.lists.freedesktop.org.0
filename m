Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6574BFF06
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941610E86B;
	Tue, 22 Feb 2022 16:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDD010E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 16:40:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E47C5580126;
 Tue, 22 Feb 2022 11:40:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 11:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=xTZ5w0SsVrvItd91KrQNn+7XHnrZSL
 enGS5+1dv5Z3A=; b=vSTK6g+lp0bNCJRNFOswfdk8jKvT/x0ImMmT/vhNX9edBF
 tBdxmXn4TcwlmvOsah/mITpgj24Z4e/AJ/LYhjw7Q5MDNiuZhD9arwMhwMBK6LZJ
 K7L1AR+pBO1gx/vboBT8JOdjML2AFwNyV6/cUXySA3AHQv1n6r0SvcaBcCvKC8lA
 JomH9K83Crk/pG+H6PPmBsTAptGcIVZvCDOtwPJYepDQ37WvVpGYBBCTk59R/aqh
 DTZVemJnKNzAlgpCxoKBo0/Sp6V1FZEKyGstQ9PNYjuZaF7ffjD/KU1W3zwfhViE
 aSfDFjnaaLNg08v4gIEoAQr7iEYRDl7Gw6+u72dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xTZ5w0
 SsVrvItd91KrQNn+7XHnrZSLenGS5+1dv5Z3A=; b=RH9cAiA0kOYW1Mqt23GJzn
 8qZbr9d1xe0qAiu68e3QAV4G56jbtYL6/y3ydJUY20Vid8dhLI+2FRpHq1JSKuCB
 SVcL+SGDvagCFWL7DDBI6Bp1Xo3QlWE6gWKhmtnl4mAD2vrdVlS9+m+tIe81RaMb
 kgFrnPGpDjXVS//a8HA7rqSd82LLS40yr13hfogP1P3e3VSIQU4m3tI6swmm++IH
 lsG7Haj1YGATLxFQHOSFK47BL8QFRdy0ncQPHw3U3SD7hzk90DKgEtTvOhOgVm73
 6xPesEMeCKZqgGItM8hphOyS2ZnxnXaQIsvrEzi2ZBeElqZXhWiGWr5dmRu+c+DQ
 ==
X-ME-Sender: <xms:GRIVYk7a7hGCQ8NlTDcsWELSKc5U9LMiSkLqFLfUBlQUW6KgXA15FQ>
 <xme:GRIVYl4js2Y1rweIfj1xbSZc2wkF9_xSmwtjwSK3wqswZ08H_ZeGGcvet6XSVgGDh
 ZERlxYgmGov9BC6NpM>
X-ME-Received: <xmr:GRIVYjfbFMItcTvgMbXOfKGoclUA02aifu5wFdAsSZ7hMt5pyVqSARcqwzyKb-5X--XgzTVRfPysnr4B6mf2W8ALnA1hVgvzmfDcjRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GRIVYpIsbG1Nw11SNYeVJZdAf0jXZsiDWAkThKLmJZQdegafBj2lSw>
 <xmx:GRIVYoLq9bXWrdSZ4-EeWWbLoE7p8-oY5EGSdi90pOxe42-5j8xZ1Q>
 <xmx:GRIVYqxBJNdTlspHL0_51YFTcXO4djaB2nJ0wxqu0hxMHp9-1OfCKQ>
 <xmx:GRIVYlAhlLKQVPUiuHxV1HyqNrUZvUguFjtyo_o-Sm6SrAdTpLIPfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 11:40:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v6 4/7] drm/vc4: hdmi: Take the sink maximum TMDS clock into
 account
Date: Tue, 22 Feb 2022 17:40:39 +0100
Message-Id: <20220222164042.403112-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
References: <20220222164042.403112-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function that validates that the clock isn't too high, we've only
taken our controller limitations into account so far.

However, the sink can have a limit on the maximum TMDS clock it can deal
with too which is exposed through the EDID and the drm_display_info.

Make sure we check it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e5d9d54ce20a..e8e70727b5f3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1249,12 +1249,18 @@ static enum drm_mode_status
 vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 			     unsigned long long clock)
 {
+	const struct drm_connector *connector = &vc4_hdmi->connector;
+	const struct drm_display_info *info = &connector->display_info;
+
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
 	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
+	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
-- 
2.35.1

