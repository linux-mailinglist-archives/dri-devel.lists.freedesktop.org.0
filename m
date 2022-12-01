Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A777063EBFE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A43210E586;
	Thu,  1 Dec 2022 09:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A5810E58A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:07:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CDBE5C015E;
 Thu,  1 Dec 2022 04:07:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 04:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1669885659; x=1669972059; bh=FFDvQf0/oCpeWjcrkp37qrKaI
 CtOpHzT0UwDmf5qNcA=; b=DGiEpIin24ErLkvXszy+qG74blRNR5J2EwUddh2Ka
 EaJZW6cqq/znvlNiJwWpFGStfk470CJNpxN9WrNS27J1Xh1IOP3tFhmnZd1yaJ84
 wfU4eIntt1aRycZ5xOh1p3sIDLZR8OK3tS3I8PdR5dtRARbKYWYUZ7ZXL1aScggV
 oxFHq0HwHhL+aNHddLcbIH49ybW+n6PBLoEl7lKZ30iL/Vq+YfMsJnf9/BJlTjyY
 TdEpO3B8gx/3KnJ2/tNgxVXa93KuAY2VTQAv6sR8SnVRVjEGq64r379PKryTux5N
 8K3Km8+eNkawj3RDj/oer5ZirJV1niZcwU7l/CmtlAUtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1669885659; x=1669972059; bh=FFDvQf0/oCpeWjcrkp37qrKaICtOpHzT0Uw
 Dmf5qNcA=; b=Qdf7ewWl5wCSQiHJpP/tu6p3JJx6PfgS5ofQ3hIdPw83jWW+dcQ
 4S+As98WWEnb2eScNxSWqmW6Ehuzvib6CBnMI/l43StcvUclZ/nbvVQXAxdh7ygX
 t06PHoy9CEjwwfdvF8d8GHizEdBUut9A0ghHCdhScouynIWbmapmKjb2te7WscZN
 ydEnirpsRIvgne8taoWxJOt+1D0G5lcZqXmmTjhQEvFXPftNWSrCmNbJQ3ORE2WN
 bU+g5+GwyDUpj7tK0uoKETwOZb1JcUu9n4Co2DJvaWgeo52ZRx99p0efjpPDLLLR
 8Iw/gzwY42DYKSh8ABr3TucS7yrq+bWzqwg==
X-ME-Sender: <xms:226IY8HAumygwjb9M9IQAQCJyhHNoS-DTCEh8exu84Xj1saSjx-ReQ>
 <xme:226IY1WUk2zxQqzlvCyd8Iwz6tKOnfdQ-1zcqRnPsdGRucDjD_ZFXhq8f1goH7pVv
 j_YLpCWl_8G1INTIyk>
X-ME-Received: <xmr:226IY2Le1j0BIoS3qDI4RWn4ujJmp_2YGZZXurKwmVPbKLkXc6JLyfxhaoABxyvBnvMDsQQlePaPavfjqXPXw08_HUH0TwxtuVnISpfcUoolJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggddufedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:226IY-EnhKMgFlenB9k9YSx6AjByAWN-AbyyDfP1bZsj4InwvR1v-w>
 <xmx:226IYyXlyHjTjs6spttw3UWEMPzZ2SV8uYJbyQSQ7DVu3rKu7FLd_A>
 <xmx:226IYxNra8C2n4mQEWMH1DNfwZt-hRIwnUHDoJ4lZmOiyjBqbhFuhg>
 <xmx:226IYzscpc75QH6fKrUrJjBttp4WGit3l_ebRKnI9UkKoEsk2cbSaQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 04:07:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/tests: probe_helper: Fix unitialized variable
Date: Thu,  1 Dec 2022 10:07:36 +0100
Message-Id: <20221201090736.290935-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The len variable is used while uninitialized. Initialize it.

Fixes: 1e4a91db109f ("drm/probe-helper: Provide a TV get_modes helper")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_probe_helper_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index 7e938258c742..211131405500 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -115,6 +115,7 @@ drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
 	ret = drm_connector_helper_tv_get_modes(connector);
 	KUNIT_EXPECT_EQ(test, ret, params->num_expected_modes);
 
+	len = 0;
 	list_for_each_entry(mode, &connector->probed_modes, head)
 		len++;
 	KUNIT_EXPECT_EQ(test, len, params->num_expected_modes);
-- 
2.38.1

