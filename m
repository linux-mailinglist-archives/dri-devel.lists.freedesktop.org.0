Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9F560032
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38DF14A651;
	Wed, 29 Jun 2022 12:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307F714A651
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F39A2320096D;
 Wed, 29 Jun 2022 08:38:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506286; x=1656592686; bh=Ni
 Lv7puPTB9QwQvI1tWk9BYLrUjc+puxcQDcMnHf57Y=; b=dVsjOWRQSbHjeh1kXv
 hCQ0aujSFKT0Gw8y6UoXmYoVMquGnarEULu06OhfR8XyJSY5wgCMN8ZV9QrZAFtM
 ZDltSpqE/bhQQl/+5WNns44vSO59ke+apHq402ytcH9nFkc7guJzBxqoiIZ2JTSe
 hUdxn1Ar7CoxdyiMwfoaxGFDfchmVoHElFNC26vHm7kakm2sZWNfnB7JqCpeKDot
 aFLCvJ/gWGB7rwI+DKdt3QJmzOjLj2lNar5P836nRNnmLJAdTerWTTQMUXcpr017
 m05TMfrsf/A+ROG9wVAQYlNKJX+0xJ/3DcRHoFyhLRF0eAcRM8U/kywDoTma94wI
 QIQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506286; x=1656592686; bh=NiLv7puPTB9Qw
 QvI1tWk9BYLrUjc+puxcQDcMnHf57Y=; b=GfKF/oioZT7+NUjJNiyDriD+4yklk
 r4+HMqhTwo4+se18ZEnG9Ahy0YlYetvHSHsRKyt6tqUBGeQIlMlfE7GU1P7jycIG
 BLlWQXJ9g8+l3DQiBpPB6a08piWj+ohvgGCcv8N1hg64QtVuDGwGXRZB8+E3t5Q6
 uig/kHd8whsCC7txjBFq7JT/8BjRJpsgdDMd5CUdaRUahtnvv5QoExGGwNYrPugi
 NuaNHvvOuUzvILDAFHinoylOVcfx7ARrbBc/KH8bO9VpTRKq3vI9b3V85r8JI9GK
 UCSrTZrXM9bRT5eORi0xC4t7hWtb6oOYiGWWZncAXRne7fs+cANaoxQ5w==
X-ME-Sender: <xms:rke8Ytg7KjuTCl81VrD2ensXPWP5dhtSaTunJU4lh469EussFFPufw>
 <xme:rke8YiCn1eXO4pOgWBoWTTgi9Td2h8Lrq5K1GP7Yih0gQq5n0TjURadPF7WDq95KS
 pQEAZEyAhvvR-epw94>
X-ME-Received: <xmr:rke8YtFA_5gsWnX7JqFK2D4xlcMHMX51CihX2rY7AKEc1tTj0oTB0oESVUlEjOO-ezCi35CeNXmFHJ-mN1DN83lBzoMsLbA-aA0D1Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rke8YiTLebw0qA_Tw54GW_Aa2kY5NUjWh5e7uRPWy60bsm3o5zsmmQ>
 <xmx:rke8Yqya0WXfkXqzBnOCJHkCnaRg1Z9RSqJfVumgehLMZToLLeUggQ>
 <xmx:rke8Yo7_q-q8ymVlMHAHepKV0YsML83tVI-I9-JMI6sv0CEqESxNYg>
 <xmx:rke8YkunP2t_jT_hkOB2WWt0xClEkTNgwMn6tpv7oK4VYLyLtPKbYw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 58/71] drm/vc4: vec: Switch to drmm_kzalloc
Date: Wed, 29 Jun 2022 14:34:57 +0200
Message-Id: <20220629123510.1915022-59-maxime@cerno.tech>
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

