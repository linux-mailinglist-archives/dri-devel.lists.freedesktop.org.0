Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA21C1DAE
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 21:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C777E6ED3E;
	Fri,  1 May 2020 19:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1265 seconds by postgrey-1.36 at gabe;
 Fri, 01 May 2020 19:13:06 UTC
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.146.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34966ED38
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 19:13:06 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 9EC3C3558
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 13:52:00 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UalUjWxSvSl8qUalUjvLy2; Fri, 01 May 2020 13:52:00 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FomgKemsxSQOPPsglc8VE0B4GO1rp6G2EJ9gCbZ2nas=; b=gaOuF2uzZoFMUvAVrJE2McUX34
 C/oeo/Z/GK7YoSfkM5a5Lx09qTZ7ZEnwZ6g9jiKRxGCvEi6b70xjxYisRA1xDeNQ1eJyGhCBd8tjq
 p9fIVk6rQ+hMlBPTQnf9D9uK8wiiEZaS8A7pMU7DDFvWISaMrrDwO1owbVKzXwAWw9QwMYPIvMTE7
 ay2grDRwpR+dfKjDB3IT19ouxU8ls4prbzjqbjq585YEbRuIk1M3WhUefHHjaL9GBRrzHmpniKpCH
 Kb9I7dZD5CD5dXWiB2sHdwcK9cKRdAwBRHLLBTsaqi1tk5vnsgTyJmeGQi5J5IVVTweLm8ozAanYf
 Gck1BJbg==;
Received: from [189.207.59.248] (port=52120 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jUalU-001fON-42; Fri, 01 May 2020 13:52:00 -0500
Date: Fri, 1 May 2020 13:56:21 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mukul Joshi <mukul.joshi@amd.com>
Subject: [PATCH] drm/amdkfd: Remove logically dead code in kfd_procfs_show
Message-ID: <20200501185621.GA17880@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.207.59.248
X-Source-L: No
X-Exim-ID: 1jUalU-001fON-42
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.207.59.248]:52120
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

container_of is never null, so the null check on pdd is unnecessary.

If the null check is removed, function kfd_procfs_show()
will always return before reaching "return 0", hence
such return is logically dead. So, remove it, as well.

Addresses-Coverity-ID: 1492793 ("Logically dead code")
Fixes: d4566dee849e ("drm/amdkfd: Track GPU memory utilization per process")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 598296034b43..63dcd30b2cdc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -87,14 +87,11 @@ static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
 	} else if (strncmp(attr->name, "vram_", 5) == 0) {
 		struct kfd_process_device *pdd = container_of(attr, struct kfd_process_device,
 							      attr_vram);
-		if (pdd)
-			return snprintf(buffer, PAGE_SIZE, "%llu\n", READ_ONCE(pdd->vram_usage));
+		return snprintf(buffer, PAGE_SIZE, "%llu\n", READ_ONCE(pdd->vram_usage));
 	} else {
 		pr_err("Invalid attribute");
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static void kfd_procfs_kobj_release(struct kobject *kobj)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
