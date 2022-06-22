Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5A554D5F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083A1133A4;
	Wed, 22 Jun 2022 14:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DDC1133A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EE63132009AE;
 Wed, 22 Jun 2022 10:35:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908507; x=1655994907; bh=Ni
 Lv7puPTB9QwQvI1tWk9BYLrUjc+puxcQDcMnHf57Y=; b=rlK4IFzIIVZa5KRi5l
 bQQD4w+qK8z5Vuf9O5DQjJ983iVy2m07SUC8KMDz3sMUVYHHdjMdkplwjPWHjZ1f
 HNaSKOr3bjsIds5RpoLWzkks4r/mD8/W1Vot9c2tMDFwXAh4stvOomhcH02bA+kf
 tUvEvB4ZukXqKVkX5afC3Il8BMBLH2iFaBiulaIsk3q1WXg/sepOAsyePUECqWLg
 AOVdojTePZwotQ7+2lwl/EB+HgIgZCkr8qPEv0P1V3VBSAFoja1TH8u33mwlwLM3
 ntvGSiDhUvEfcqYGqVUMs+P6gzdMmxDq5+svrC0gQbKU/c+Iq00gGvPQOxLrQV8R
 FtHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908507; x=1655994907; bh=NiLv7puPTB9Qw
 QvI1tWk9BYLrUjc+puxcQDcMnHf57Y=; b=tpEwVlBq3ntvOvHIGfldWK4nsWjMz
 rObgIAe605ZT9ElNwK+8di6zV1oEcLKZPAc0BaaszeYLUb1outFanuwLAPm3TtQJ
 wuZOKUGiSmlZ2LGa7z/XbPdMVkRBi/oQr5HcTidBGxT+PU2D2TrRoH6mm9+vC95b
 Uxb+bKCU0rOtYpVWBb1FZsOe4WdAwiTiqMp0eiqVLHazkjc0nRXf0BI7w3C9LDpu
 K+VdQy2gE3vjNBdWhXj6p57SKRJQaZrkL/yyjpJJ1gdUmq8CH6o8MYQ35rTrqChP
 WG079AlhPNx8bOSLwGzh46lp4WKZQf520nGRXr+TlYV6Qod31PyLtoM6Q==
X-ME-Sender: <xms:myizYi_7pjLXC5iKKL12gGo0x2T4avuc5o5bS0sXYr7XehUh8U-YqA>
 <xme:myizYitJDzDAwTuiRlF3TzwAutQfmUvfFrewiJ7MRlHiZG3nJQxiSFJ5HRU1CQbqd
 tUHkuPMmnyCwHgEvKY>
X-ME-Received: <xmr:myizYoAhQ-evud_vMFaFRxJnkWIOrXmAj7Dd1vVKLdH_gkPAuCad6fUQouSiWBatq8OJkqcDt24aGnBAETAA9hOf2Lekv2U3ERuK_7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:myizYqevke60B39TRFD_s0Zz9XuJNyrZDxB1gBb-tU95Z3JQI65TbQ>
 <xmx:myizYnOYD3TkIiewSqWIqqd4AI37hJ-NxUy66gkDgpxBRi9EXn9-RA>
 <xmx:myizYknXhTK-RiD6vSQdUVUUIdBB2IqCn4D0iyynodWUqxJZnmvUng>
 <xmx:myizYsrYE_tEBrOjMmLRz9jmL7QB-pgK96e1O6Hki-GLwXWRjrB4Fg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 55/68] drm/vc4: vec: Switch to drmm_kzalloc
Date: Wed, 22 Jun 2022 16:31:56 +0200
Message-Id: <20220622143209.600298-56-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2c96d5adcf49..a051b25337c0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -509,7 +509,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vec = devm_kzalloc(dev, sizeof(*vec), GFP_KERNEL);
+	vec = drmm_kzalloc(drm, sizeof(*vec), GFP_KERNEL);
 	if (!vec)
 		return -ENOMEM;
 
-- 
2.36.1

