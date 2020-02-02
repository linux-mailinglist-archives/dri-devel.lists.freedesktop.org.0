Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811115024D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F666EB41;
	Mon,  3 Feb 2020 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F126E5D2;
 Sun,  2 Feb 2020 00:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1580603163;
 bh=f+zPvhIF10NZ+fPK3wRSAJN5xlV3fRtp56Osd4BOzFk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Hdfy0wGm1JPSD4BS9iZrP7AY7I6g9ZMqFtzzYZ5Z+mRrifHzgoTDJW6yn6NcIynVi
 vIME4efQiyOIJQ1RYPERpKyyD8Ct+XcVxnH9qFrCo68iIymeVX2B5kEp++AqgVltnf
 2wAnQDPK1RHZKT54Qu9msURBd9nbQXE4cX3WtEEo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([212.114.250.16]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUowV-1j7Dw7211l-00QmZF; Sun, 02 Feb 2020 01:20:46 +0100
From: Julian Sax <jsbc@gmx.de>
To: Joe Perches <joe@perches.com>
Subject: [PATCH v2] drm/amdkfd: Make process queues logs less verbose
Date: Sun,  2 Feb 2020 01:18:01 +0100
Message-Id: <20200202001801.2493508-1-jsbc@gmx.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <b9b671508d478469c1ad43206dd29d770bfb7818.camel@perches.com>
References: <b9b671508d478469c1ad43206dd29d770bfb7818.camel@perches.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KDqP/Jp9PNQtcCCr/i9Z9e9bWbi+49sN4qzcwl7g0/WLn2XtU+W
 5JLZZ78o5DWHvfEP5jM8gFSSQMnKhkfJWrHD+kdV/kJoky3+wJsUui1vTm7H3qu/f93qLRf
 Q+FUZTo/Ebq1DGsGDI/pqxIaKvrfh+R1r5uan9IGYfQWZrCWY/xzVa3pkGVAgmHQTV/mAWN
 chwl+u5XATv4vlseU0CDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yYfg3Dh5w3k=:ui9w4hd+uta4tA1X91rQTA
 nvFAH/553M09panAqILGA4qE5szKlqgJUhUT28aPJf29Lff8pErQgyUoLtpt988FBmg1Qa0Tp
 XAKzCeLwOOctJksac8hfujiJEPLd1NlnndppVy5EF8pyToQhB67505l1UUaOdFfGVeP60KQUR
 yGD/penNoxvSWkFV8a4cahkMpWtzd3XT1OUnGqZCrIsW4kX5kJoQnBkRJyzruFf/aEPd7yxcn
 GimQfi28oQPE2c1jI3HjQNA+YC0pBW+7zgdFsvs6scTwuKCLRq+safRptUi+MOuGLq3xse8oQ
 Le2/s1F8PVLIt4gWthOiTSJznXF47GQoIar3st/DZoKuFWpJYmqOIRLWEPLivzXRq5G7YhJ3f
 Ma0z9oO3gm1BLrYpvShnn/XYXp/XUo4ez8pdL7X/gfDnHBVxrJZdP7jijWr0JPD2rrdz63rS0
 x+8DRRJDjhYfUahm4A9yfo/Nk4nsWuKogn+/Tovj84STASU2YDmA4ScIduE3pbX/ygLURiYDq
 lG/8JX51GTjYDHWQZP+0IVXHLW+OBKKJpxaB24WDhD9HNQVsxc/UUHQ3ExkYQynPwd8A4a0+8
 lffA3RGgRmjmj5baW6BmTmWCC67HjoOfnRRxXqseIbOg0N8LBp8Y5RLwVxg+g92G/t7SeVlF4
 RbgSN6kn8Kqo9w4xtPpj3TG96MuSmELh57nEwlar2bUajvdNawkWC0uDZnfAN6uakS2d5xpSY
 rfabybIi6R/CNUx5aOz3zwdPT4ftgo1AumfL+KBaolGtC176BdPve2E5Iiz5b68LTdNnvkjl+
 4FLr9ezPJiwJUkYjzlP1qYM8p37q/AbwjnUQiXq77WiCpcmPiY1pFTYyhV2omA4BQsmvy2Li2
 /YTjgGpyF6YwayyuBI5EtkvBHKiOV1nBLgAQ1D/8fRi+UcEq6478QcJGuxiiYpRrfcF9HlCgh
 l+CA5UY2ymNfW3vauJ/6Ge+Rp3wcE8pviwMdNn+x0euo7q05PVlteL1ofQMBwXFsIv3niU/md
 xWcF9PcfLGQw5jObZ5DdaKBMDCa+07ygN4cAxIt1EybJTN3p1IAgvXSpBn5ZeuzoT/3COelca
 DQOSpPWS1tdnlNCUdLCGXwsHzJWM2jEntSlB1GFaCq/9Fzomxg4AvZabaQCfcjbkFxwoaiAC0
 dBF6CQjSmYufn7TIOFbqID2CdPdZiCliFhIPVCGYxG/H8CEGNt9ILIBCUtK/aI9p78cnE=
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Julian Sax <jsbc@gmx.de>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During normal usage, especially if jobs are started and stopped in rapid
succession, the kernel log is filled with messages like this:

[38732.522910] Restoring PASID 0x8003 queues
[38732.666767] Evicting PASID 0x8003 queues
[38732.714074] Restoring PASID 0x8003 queues
[38732.815633] Evicting PASID 0x8003 queues
[38732.834961] Restoring PASID 0x8003 queues
[38732.840536] Evicting PASID 0x8003 queues
[38732.869846] Restoring PASID 0x8003 queues
[38732.893655] Evicting PASID 0x8003 queues
[38732.927975] Restoring PASID 0x8003 queues

According to [1], these messages are expected, but they carry little
value for the end user, so turn them into debug messages.

[1] https://github.com/RadeonOpenCompute/ROCm/issues/343

Signed-off-by: Julian Sax <jsbc@gmx.de>
---
v2: fixed indenting of following lines

 .../drm/amd/amdkfd/kfd_device_queue_manager.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 2870553a2ce0..13bd588c4419 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -604,8 +604,8 @@ static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
 		goto out;

 	pdd = qpd_to_pdd(qpd);
-	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
-			    pdd->process->pasid);
+	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
+			     pdd->process->pasid);

 	/* Mark all queues as evicted. Deactivate all active queues on
 	 * the qpd.
@@ -650,8 +650,8 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 		goto out;

 	pdd = qpd_to_pdd(qpd);
-	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
-			    pdd->process->pasid);
+	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
+			     pdd->process->pasid);

 	/* Mark all queues as evicted. Deactivate all active queues on
 	 * the qpd.
@@ -696,8 +696,8 @@ static int restore_process_queues_nocpsch(struct device_queue_manager *dqm,
 		goto out;
 	}

-	pr_info_ratelimited("Restoring PASID 0x%x queues\n",
-			    pdd->process->pasid);
+	pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
+			     pdd->process->pasid);

 	/* Update PD Base in QPD */
 	qpd->page_table_base = pd_base;
@@ -772,8 +772,8 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 		goto out;
 	}

-	pr_info_ratelimited("Restoring PASID 0x%x queues\n",
-			    pdd->process->pasid);
+	pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
+			     pdd->process->pasid);

 	/* Update PD Base in QPD */
 	qpd->page_table_base = pd_base;
--
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
