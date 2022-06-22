Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089215543BA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 10:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE275113328;
	Wed, 22 Jun 2022 08:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D52711336C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 08:02:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EC1C05C0098;
 Wed, 22 Jun 2022 04:02:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 04:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1655884966; x=1655971366; bh=m6VbtjLogQKKTnCK7C2fqtV9D
 nn1FSlwGunOQhDeUoM=; b=tkPWSp0YC0hgvLK9KEOCw1C/nL0FpgM2Sp7SV3pzf
 PeeI5cIZogS0m7Ogfoc24wFMzA50Ih9dcus33ToM9ktorsFKUbkmJMcM9L3btsZk
 HJ6BmuXJhD++UFayNQTXtWcrxO6qy9Bw/q9ZII9Gyx3HeGZEiJSmqwkdvKo1zi8N
 GBJkGBBMUEkSVMy/npLno3uThCIkIDFMoLB3+iSTf6JFHISMtSNASA58Bf93c0AL
 SPSdkx0We7r0okpRAtJ8rpw95UJauZSzt91kNkvLzPyA2l9jEvkz0ID2hP458ay7
 H2QO4avuRwQT9cPhnf7pxIU4Um9MjgcpTXovNC8GqOAEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655884966; x=1655971366; bh=m6VbtjLogQKKTnCK7C2fqtV9Dnn1FSlwGun
 OQhDeUoM=; b=wJL9zOwvh6Uw8cdrF8bFKSWO4WsboM2kXs+u9gDURqQx+JAMLZ9
 BysnJa7E9aMvFz9F2Eh3Thy9KQX9IuSjRWxQNhrxUQ6NPZIM8ZMaylP/TLyxEmHw
 YufAz0kztPT9Aa8g0du6MEBI7+a0CTDIAjfiN2GtJ946o5uXWP4GJx/m3UM88Up6
 630W7q3yUHJWLgAEeX5J9qOgAi9Ie0PKPjtNBuIIJS1nPFuSo2HwGAAW1nc4WInv
 jMIE+JgDRc4i3Uyfx7/ln+1R22KHr+ZFB4LgVRbsJ8goHpuJepLPpM3i1YOHp7oR
 VerWvodMKWRjokhPd+bH35be27lj5NqvbpA==
X-ME-Sender: <xms:pcyyYq8atGed-v8SiGeW5hGzrhTq4n7pgM_obJcx8BFIAl6LxGleeQ>
 <xme:pcyyYquy8prss5umaBmcaqtR10s2kZAieK6bxMsJ47Hc4Qvfa2ZYQWLCziuiq_FIg
 Dd5P3ZBhk2H5ocQ5Xk>
X-ME-Received: <xmr:pcyyYgAN4PwMViwOqB0zbnyEOYctKjEl0su4Z6opsLZ8LLBO40y_AknrYB6kRLZxTcA2WfRnkHBlh0X_unw6RS6nkl7H1VF1a_QilNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkeetudejieejfefhjeeutddugedtjeffffdvtedtieegkeffieelleegvefg
 vddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pcyyYif19jdOAQ3Wqw4jI21cjcQ_DVE_NCTYV6ndZuGZervv-oJmRw>
 <xmx:pcyyYvMvn8LvIGmLmbixCUI7nKty9rEY-Z4mx5c2tfdZ1frGtMHjAw>
 <xmx:pcyyYslYxlFnd0SPZ33az6JriuMGOprjADsqeQeaw9XZYRWLsgJyyg>
 <xmx:psyyYrCJqR8wGdK2Fd_nWw41_5clqR5XHSdyt73-tuZg033SGwErrg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 04:02:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: perfmon: Fix variable dereferenced before check
Date: Wed, 22 Jun 2022 10:02:43 +0200
Message-Id: <20220622080243.22119-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 30f8c74ca9b7 ("drm/vc4: Warn if some v3d code is run on BCM2711")
introduced a check in vc4_perfmon_get() that dereferences a pointer before
we checked whether that pointer is valid or not.

Let's rework that function a bit to do things in the proper order.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 30f8c74ca9b7 ("drm/vc4: Warn if some v3d code is run on BCM2711")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index c7f5adb6bcf8..79a74184d732 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -17,13 +17,16 @@
 
 void vc4_perfmon_get(struct vc4_perfmon *perfmon)
 {
-	struct vc4_dev *vc4 = perfmon->dev;
+	struct vc4_dev *vc4;
 
+	if (!perfmon)
+		return;
+
+	vc4 = perfmon->dev;
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return;
 
-	if (perfmon)
-		refcount_inc(&perfmon->refcnt);
+	refcount_inc(&perfmon->refcnt);
 }
 
 void vc4_perfmon_put(struct vc4_perfmon *perfmon)
-- 
2.36.1

