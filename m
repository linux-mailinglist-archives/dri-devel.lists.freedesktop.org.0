Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97844289FC6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6A56EE9B;
	Sat, 10 Oct 2020 10:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E766EC6C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:50:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EE235C00F9;
 Fri,  9 Oct 2020 03:50:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 09 Oct 2020 03:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=2IJ3o5pAvQFWg/IMdAqvwJEiJL
 zTl9Ec7RLsvL4x+28=; b=HnErhS9U+dY/NgP6u07sOw3As8FpKX0i3Aio9RSB4b
 f4DE2+0TpeFDiBgCaJJ9/h6+dxXSlz/N98pdR8B7IsvKLDCZEd2Z3vEWjivM2Rb0
 1WWfRQlObyI09MTRPFzRHmbWmWvjfJ+DhdD10BIRjFNYjMH1kXeGHK1FHcJ62Wnl
 xYHYRbwsv6aa0j7u5bPVqPkM4Ctzn+Dhv25LyqE26EQcKGCdsHajUrUP45eYyuPG
 2ob71JAp/As286jYfFQ7So7tujIYC7vZomIHqv1r4QAc2tWVFo3wDgB+sllPt5hP
 EXQ8oPhHiPAetDy7/0Lz7pLQlQ50W/xKiVOMuv81ZnYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2IJ3o5pAvQFWg/IMd
 AqvwJEiJLzTl9Ec7RLsvL4x+28=; b=dr1bRTnCg0+H/W8jtW/c2tJdugIKTYe6H
 NizY9R1GrWu8jBB8zuJF6yi3ENioy55peAxWqba99PkzgGzikR/QhQoujxGorwxs
 lExZHnUErxqGD+zjNcIdngeRNMZwg1yxit9cDm/FgggazxWshBjLIUTvf5bU4Qbl
 dKCm0VCUIoTVknhxzWyoM2GoUxSwTnXjg3x1JKyOD15dkwHiSqdMTmEkJXbEhfKy
 l/WeOIX1k8YpXwIbBUWg+PnbKICOwaP87bLf8spfv7NGhq9Wnv45JOi32swCd5Qq
 jtODW8sSJLeo9yShBgMx3bpyVHR0dmhnFpWt7kmqEjcT3IlNj8fKg==
X-ME-Sender: <xms:LhaAXw46_c5nKQCcz5ld_kG3Ms5vNvlUAf8CzQ2s9wRanO3uLu9mBQ>
 <xme:LhaAXx5o2JQoGi_GVhhQlfGQnyKWFYqQ-gBMw08E79_SRY9eSiiQYwEfZRS-n5fbP
 HMft1xmL1t9RJ9X5ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedtgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
 gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
 hmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeffffejvedvieelveei
 hfffleegtdeivddtudetkeelgeeivdejffdvhfdvhedvleenucffohhmrghinhepghhith
 hhuhgsrdgtohhmpdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrdei
 kedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LhaAX_egt8TARzEAL_ppd8J8uxKKz8S0R5TkhzN6bgw1TDsvN_KTEg>
 <xmx:LhaAX1LfZJfw-Y-WYGXgnpgVP-WM62jvxkXMoihhBIUpplS_D7P8oA>
 <xmx:LhaAX0KGck5dSnG69fLiCkaQS5svHo5HX9h8CGFkkHltI6-heCCiwA>
 <xmx:MBaAX-jPSLMGiDcBGCaNh4n5WqwHEaCjLzzEVwvJrGYMtoSdbH3kkA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDC123280065;
 Fri,  9 Oct 2020 03:50:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH] MAINTAINERS: Add myself as a maintainer for vc4
Date: Fri,  9 Oct 2020 09:49:52 +0200
Message-Id: <20201009074952.11345-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eric isn't working on vc4 anymore and I've been working on it, as well as
merging patches for it, recently so let's make it official so I don't miss
patches.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 91d46806e511..a248e3a2b537 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5957,6 +5957,7 @@ F:	include/uapi/drm/v3d_drm.h
 
 DRM DRIVERS FOR VC4
 M:	Eric Anholt <eric@anholt.net>
+M:	Maxime Ripard <mripard@kernel.org>
 S:	Supported
 T:	git git://github.com/anholt/linux
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
