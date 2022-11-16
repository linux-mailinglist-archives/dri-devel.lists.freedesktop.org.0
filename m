Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B962B636
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526BE10E44C;
	Wed, 16 Nov 2022 09:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDF010E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:17:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F6475C01C2;
 Wed, 16 Nov 2022 04:17:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Nov 2022 04:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1668590240; x=1668676640; bh=HD
 hz6dCTIBueuPkznvqt2qE8stIixuwGCQ0nLlw9PIU=; b=CyGy6fjK0kXRnSc14S
 eBPaXbZy8EaIFu77On1MjO6QNCOHCQjUYGEkH5JhKvJ3d/YmpTuG9C7v7zIJkOOS
 VCXLZvtYG5d3j6/L7DCLlJ9igoYMVnTzs60wLZc9BModVHsSXYmJZyuy94CiPup/
 kxO313LjBIQ6Xy2CxOZ+JNhSa+GFQ+1G3/d5rDS0SXhTgpkjKiQqaGZ/bA9FXokx
 wEAURRupT9mj2B6VbVkJasnkVsCzWhasGzpoGAoa0JmC/bQ6uJASKy6O6cQFjVs+
 AwrPyh1E4KB/t0qwP+ybJdsWkAOxP8rVW9eqEL975gPznBGV+Kwni7MKsm5RMqle
 AhpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668590240; x=1668676640; bh=HDhz6dCTIBueu
 Pkznvqt2qE8stIixuwGCQ0nLlw9PIU=; b=Wj23IxGXRNZSVsHbkrdfyjNuAPExy
 v+O/MHiUmN6SUFcS9P+KPieQNNu+udO39odihMK/C0IBqRn7rL+9kBs6uNlHoQOC
 nFGRjQIKYikFmQO47lzokcZ4KChl+p7Rp52FI0DRUN/M2hE1ZIZS0E1EzdgYqnwy
 3yko6OFos6svW/wUR8ziVo5nylwgLgy/pPaSSl5gLPiSrWdBoGpU+3+WvXi0I0Q0
 SmuabEqNNAn5tqykIlF8i1KkW0N2gIw/q5yPA7Mr198eqZoxaPNT6zE1FXg6FkAP
 /MOYeiBBqHG8D1nh7OIJxWaZGM4eEpT4MrEugBPxI9C13AorkFGrNsvsA==
X-ME-Sender: <xms:nqp0Y8Ij2QWcP72y47nmbFbAEGlmT7_ahVD4iyA9uWF6-i6Kq2wS7A>
 <xme:nqp0Y8KhYg6swNvL_JxZEv9nV168NQjhU70J-tqmMfVlNIGUTupcc47orG33h5Pt0
 iQ9SyEJQivY1iVyMWY>
X-ME-Received: <xmr:nqp0Y8uDiw8KUSvgokZi9_4Rn1qskTH5DFRtAFGklI4uMi6lkp4KRGu0rLz8LhT1k3HABASam3wlZHOrUHxprXm0pjgseE1weBcvP0bNu90PlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nqp0Y5br1sSNoh3Qt4jr0jGyCX8ZcGjTLdyDLjvfaS-7rE577Gk4xQ>
 <xmx:nqp0YzbXtmXZSAxY8eHUnYYiLludrW8lUWgyUFewckC7bezQeCigwQ>
 <xmx:nqp0Y1DC4k4rfPWZKYPm4nOIkJPBa0cCizmbM6Vz6hRkaezuCICEUQ>
 <xmx:oKp0YwRxxs39cYvsoDJs--P2uYoRTkw5NKb3WCRE4h1WDGRI0Oe_Pw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 04:17:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/3] drm/tests: helpers: Add module infos
Date: Wed, 16 Nov 2022 10:17:11 +0100
Message-Id: <20221116091712.1309651-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116091712.1309651-1-maxime@cerno.tech>
References: <20221116091712.1309651-1-maxime@cerno.tech>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MODULE_LICENSE macro is missing from the kunit helpers file, thus
leading to a build error.

Let's introduce it along with MODULE_AUTHOR.

Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index dbd8ec24d4be..eea450de7de8 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -64,3 +64,6 @@ struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char
 
 	return drm;
 }
+
+MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
+MODULE_LICENSE("GPL");
-- 
2.38.1

