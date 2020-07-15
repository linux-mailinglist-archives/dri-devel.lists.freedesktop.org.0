Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4D2205B3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EA46E455;
	Wed, 15 Jul 2020 07:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617946E39C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jatY69qSBEdSfoP6T/nc+TThcdoyEXqNhA+mZsMH4ko=; b=TAZz7skhHTyLYoWE5V1RZqv5bD
 9SOCQlYXsEjRpoeASre0wUlSlYgjzj0NiDshHbR2q5LB9REvaaJRtbehC3FgNBOiPXSPfPe7LUzRO
 xEuiAKK+EtQNKE7Sgy/LdW75yhw3YNiCHZxBVCOJ3beb0k7yT1dwRUo/3yZTN5C+M3aIdItbuREGW
 n0u9/vETQLJ1mDVZHak3UD7pSYImtXXUt2zUcdDNIn6V8y/kgmvjVdbsIQjFNVA8V+jn2Mhxp8J/Z
 sc/IxmOg3sPGdJS+JiM6e/OyMarg5lpacfy5rqMTNBTHmhpdw+RtToFmWmRi99nveHwmkmezPVQ0/
 fXgZfzBA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvZtg-0006Vd-Rp; Wed, 15 Jul 2020 05:24:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] drm: msm_drm.h: delete duplicated words in comments
Date: Tue, 14 Jul 2020 22:23:48 -0700
Message-Id: <20200715052349.23319-6-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715052349.23319-1-rdunlap@infradead.org>
References: <20200715052349.23319-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the doubled word "to" in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/uapi/drm/msm_drm.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200714.orig/include/uapi/drm/msm_drm.h
+++ linux-next-20200714/include/uapi/drm/msm_drm.h
@@ -252,8 +252,8 @@ struct drm_msm_gem_submit {
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
-	__u64 in_syncobjs;    /* in, ptr to to array of drm_msm_gem_submit_syncobj */
-	__u64 out_syncobjs;   /* in, ptr to to array of drm_msm_gem_submit_syncobj */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
