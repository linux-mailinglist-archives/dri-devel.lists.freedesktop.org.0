Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED062C241
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CB710E4C3;
	Wed, 16 Nov 2022 15:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761810E4C2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:18:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EC8F932009A2;
 Wed, 16 Nov 2022 10:18:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 16 Nov 2022 10:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668611919; x=
 1668698319; bh=H8Ev9gOgQ4Fu5Dc8bd0wALmkvi/rIEehzdnnABcJR/g=; b=D
 yIjVPw4rkIJlAoIAfgKwHWVnQX5FiU+Q3BSnaQq+rTQUwR4H1y/n2l21dDbuMQf8
 3O/C4YlAff/OtwGwXIB7E5PdBeAASZ0OaQ4CTc5a+Vj6I9fxLQ2njHhevc3x8vSW
 b5utOV84VO9oi5FNxEfrm1Fp51AY2cLhTq2+dcag6f77egEiTgua0EpU06VSS/G/
 0KJm8lAVOF84xD1jDttnBj2b1x053jtLAfbd8+uPOvpPwHq84QEgX0XJt67ttZTC
 BCIqBj/sVd3k3T5HP3u+2/Z6bV15yua6WjRiwN1nJtFcBuR3kIWKtkVe3JjtLzbP
 NHtYaodg2e4U7p0nhAMnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668611919; x=
 1668698319; bh=H8Ev9gOgQ4Fu5Dc8bd0wALmkvi/rIEehzdnnABcJR/g=; b=Z
 DRkwkHb1x/vK6zu/RskIHlRq7L2RHIFBMq/ZxOsJpecv36oGbgzEWx3a4sSnsmjf
 7uGmi84mB1Dr8hjOTYkKVrNaCORtZ9Fm7Cd52U+366BZLH3KqvLt4eIUt3PTD0JF
 sZdnRSEUjmS/+r9JSR+vYAuQ5ak3GAtiEQFkxvOVeG7dzevPDUkr5wjoil2JMpCe
 cGS4ZoSYpdnjvMeXLNsNCO3moDXkcLsB7Vou80PqtMnqsAGyODwGUFd/Yu4livad
 b4rQDXuWE6GRaHiTTgxWXh2DTOstQ/f2EwWS4iskt3MOUyuB9IYANfw9qk/+dwR7
 ToeGI1uFA/S56/R7m79og==
X-ME-Sender: <xms:T_90Y_vzwBfWjET3gsjJHZnvhZ09HO9-t3Q2_H-DuS1mPgqL7SHz3A>
 <xme:T_90YweAtVVxyCfj_3pCCxwzY4lBqoYBipnXLLTZL_NVOH1ONOpXUeYRKyV31OQnp
 RArVthuDxzuoQgSLGk>
X-ME-Received: <xmr:T_90YywlIp8SOrM6_dSEioIzfnRvV0PldqExOa13yktttics6Eno2Uwrxh_C9HczzYzcHt0Jk-YbNM9mVI38MyBAXRmPOmQ6agWXVEzctvSozQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T_90Y-PHYiBE_iJdTHFO9fvSwTAbm9bHWb-SfFs6i6pi9JA7-cUZBA>
 <xmx:T_90Y__RLOXkJJq4HGfuWiKWMSOCeNHV6SXSdhILYpqBUYj3RWL1ug>
 <xmx:T_90Y-UfuxLlls9ZZngfvAsWz55BnHj6Wx8TWaQ1L2NIF7uvSM5Q8g>
 <xmx:T_90YyX0JkGdRc4UfugTE8hFftMzoFe3iO6OZCL6nNvvZwp2RHMscA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 10:18:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/tests: helpers: Add SPDX header
Date: Wed, 16 Nov 2022 16:18:33 +0100
Message-Id: <20221116151833.1679379-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116151833.1679379-1-maxime@cerno.tech>
References: <20221116151833.1679379-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SPDX header is missing, let's add it and fix the corresponding
checkpatch warning.

Suggested-by: Maíra Canal <mairacanal@riseup.net>
Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index eea450de7de8..f1662091f250 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
-- 
2.38.1

