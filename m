Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51C3B72C9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE796E88F;
	Tue, 29 Jun 2021 12:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645676E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:57:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDF8B58042D;
 Tue, 29 Jun 2021 08:57:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 29 Jun 2021 08:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=kE8924Za3XqWj
 QqgJmu8PPfgfrwJSECXGlRlMUkMS4k=; b=Ma1PDSaei+rc8o2W6epu/2rSs246m
 y7KHR2VnY4tEp34mg+x2Fmdhha+YOJYacTFqPAtydC37yV5J/lWSxFkU9T0i4v3b
 9Zoxqo5e6yhf3tXJs4YObNxDjQDUq8B+0+opP+xRiJ3igh7XMOEplakJfZ4FijQp
 U/u/rRwvtV+uMpnmSuFimEuHMJbqV2R8DOKXoSZ23MoVjNHYyCugka3QPF84Wbuq
 VgpbCF/+VUx4IUFjQ4pt2CpyiVFE5QXm1xHtov5fYFTVKt7jdLzkIbxeY7rh1bbl
 eJyW80jZy6LckeVtvSat7Ue8BmYAwsYRMclbPZwIQph9o0ZZOP2yJm07Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=kE8924Za3XqWjQqgJmu8PPfgfrwJSECXGlRlMUkMS4k=; b=RHjLbJVr
 9Ij5sJaealZgB9910taRr/h5yc3vwQ/YhKxQHkaFk8MZUb89BA7KQTPE3BKV5X9q
 XglR8ha+t4h+xM4JxGtmEZWXxzzj7moERciVrCRaaWOjt7ZK3Y+NXS0yl8fwpMPn
 vYp2r3eabS57cJA6GNtHbFRJpm08P5uikgl2jFnvpWamgm8K2V/gtJpUg9RR7lw7
 AhqkHcfw8UmlSg64jcwHpWinjR5T12f1oA0Ln52+XqfhaQTXra/ck2uYPavSQBbZ
 GnfVBIwLJxvtKcHgDUsGV18mvqk+RbxOeIolquAHgqnczhuSDLEEtH794+Ip+fPl
 jhspSC/6p40k5Q==
X-ME-Sender: <xms:zhjbYC4mt7UdFDFE8q0uMYVT5qTZBf14FVjFv-qCldJQwMwmztF_UQ>
 <xme:zhjbYL6xpklbEdARV_IbgqMRRa2g5QC-ZeWSm-XtvWYSyjeVdSe8mXRNUk6n1oK4v
 KNW5yCq-yn_KNSlvE0>
X-ME-Received: <xmr:zhjbYBe6MraC9hKvEAmVEixsD619bKGPXA2Sp5iAYBJMKCNwZ6eGcYDTMLtTM9pY592d3fmy7njnEptW6cQXWAqo4xzPJB5ks2pj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zhjbYPJR4eo4a_WQW0z481cfV9zBDIIkA0LCv8gXT40_butJeRINHA>
 <xmx:zhjbYGIU6xTcY8PFsHlpce5TeXrDOMqYGOBS5YjQ_hJM6U0L4OuXWg>
 <xmx:zhjbYAxWpmOCpu4KSZYudqRHNlvjdg91UuyZpaMPlrXvM00urkAk5g>
 <xmx:zhjbYH6NgcTubeNFnBWfV4cHl8X7C382jDnltrIH6Z_vfPNcO0inrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 08:57:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 4/4] drm/vc4: hdmi: Make sure the device is powered with CEC
Date: Tue, 29 Jun 2021 14:57:36 +0200
Message-Id: <20210629125736.414467-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629125736.414467-1-maxime@cerno.tech>
References: <20210629125736.414467-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similarly to what we encountered with the detect hook with DRM, nothing
actually prevents any of the CEC callback from being run while the HDMI
output is disabled.

However, this is an issue since any register access to the controller
when it's powered down will result in a silent hang.

Let's make sure we run the runtime_pm hooks when the CEC adapter is
opened and closed by the userspace to avoid that issue.

Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3f244027eb58..20cb6e62f7a4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1741,6 +1741,11 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	u32 val = HDMI_READ(HDMI_CEC_CNTRL_5);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
+	if (ret)
+		return ret;
 
 	val &= ~(VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET |
 		 VC4_HDMI_CEC_CNT_TO_4700_US_MASK |
@@ -1784,6 +1789,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	HDMI_WRITE(HDMI_CEC_CNTRL_5, HDMI_READ(HDMI_CEC_CNTRL_5) |
 		   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
 
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
+
 	return 0;
 }
 
-- 
2.31.1

