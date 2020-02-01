Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9239150257
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148616EB50;
	Mon,  3 Feb 2020 08:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C906E4AB;
 Sat,  1 Feb 2020 23:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1580598770;
 bh=BN/HLePm+CCf22j9Rm1J8xkmEuscsbElFGHdHKMjYig=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Izj0Nk/OMug7Z70047HsiNQPhnxL1GVeQR8rBK4Qq5LKuMxF/bTRPB4cZp2OWYbmP
 2WQu0zQBSNpFPBvXOiAqx3dG1Mw7kQunoK6lQkYVW0moQyu7f1ZoiWLTkQqPnlzCni
 /RqBikBd8qSrLfV2fFz9Dk/IjM9yAsILPWncmkpY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([212.114.254.236]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MtOGU-1jpaZQ2ePm-00uoSk; Sun, 02 Feb 2020 00:12:50 +0100
From: Julian Sax <jsbc@gmx.de>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: Make process queues logs less verbose
Date: Sun,  2 Feb 2020 00:11:01 +0100
Message-Id: <20200201231101.2127964-1-jsbc@gmx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:IRuqZirwaJVNO4uaoYMSni2zgN+ChoMXRPkqDEbMxx8YTWuPafi
 1hMVR8j6aTwwegGKabcdRTsMdncx4BGqesGVqdVF8nK6jAzg4u2OK1XK+BCftvHUKewGsIC
 bRgfeGiXlIto8GJce6ma+tLqsMiQoJrW1gog2ottjCZlvWI6cFvxEGDPAIAhGQqsS6KoWfv
 qLMJkM4mLIgM+HHS1s8BA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0yPV4JpqnjM=:EK0NGKg8mL+WHI0v6slkbp
 S7M9cVjQbWfHyLfMq6WXxHT4rCm2eaV01zPWndJ1+FIVh8C06Gnazoizs5+KBhWKBuCM8UmNA
 KDUG1A7lZY5JEZQXR22NIc+xKwMio6CUBph3ScxYtAu2etQyaJsH9x3mBT8orVwLrUniNLKeu
 c6Zh86L2ZJ2YeBAKAt4v0pmQ+at8s3QC+tAzHvI6W/H7Mi3ZHQ8bnH+IkEXd5uf/2/O1cQGLu
 NLWEFZuS7edudrdeef7fXGJ9BUyqHEjEq3/LBAiUjaAQSwFr0UWBZqw7QzDAr46Y47BpFbeqf
 0ibRxpeSWwzPMC+oTJbx+S53u0Ww6NWSyGqv3fek4SxfBWZnhD8fXiAZUvn6lgYQmM9ABgHPx
 +SEjdQrlNd/17ruB/M60bCtrRBGoDFYyBGTQrLc3PKlHWNYCxRVFm6s8Z3on4SVL+g+e63ERp
 eUC8zWfHXVyNi92/5Mo/MidrIupBt/dvvn2cRCvFIYwBbEytSVwsdZ3pzw/wxz/mxuT7OhTL5
 pwSDpOK8kjpCdYqoPd4fJ7ksdUogqwmgXLxLSot7GBqqwg1zYW42ECi1tE5tBntKXInJ+z2DK
 XalvQvfKEUWXHIXBE8PsxHazQb3YyepJLr/DnSaaQiiXywn5IfSSscELzz1ga93DLx3zxVRMQ
 IVEIzxXz9Oo6jP6pgLNCShazRwOTc8veEse3u52Vx1sbO3bTc4aNQv1CASmmUFG1TyTCubAwV
 t2A+yjCq+MxDk6boNRzAFsk2+Lpce+EhehRmciRH4J4lHagY3zkARtRkVIkHL3uEy1n895BkA
 RrkMmyq+JaqNU3hULL5kNoAMWUyeO2a4HrlAaa+VklwkBQKJeVDpUh1lplgAebwwVmidXZvfz
 cM4XNEl3DELXeBocRc7oJDcmeCFSja5rYaZnZh7FWT0St1ZGQIaaUtvQY/dGeRV0BFlCWAjsu
 NWOemMCjU2GrtaE7i+lDngyYMbrAIl1TYZDMcwksLQ1sE/mUpa39GQLTEkKeiniqfzG2WhQcv
 +aWDjKVADDZ5FVRj9Cj9FBx69GQWJjhHshfpcnOrSKWLeT/lOjfZjjlcOwjwJXE6D06eTZ/lR
 xeifmbV4UI2uYKaacrQyJpCWcmO3XkhaF/idJuUQ5oisrzFCD4Ai1DjO0A7YgqUe7Y6DyWJUm
 /8McVk0z9l1fdXGpZqLgR7HMAFrCXi5bsMNZ/IbhiZUZLoWvp+uCcJK+2DxaRRpYirz1w=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julian Sax <jsbc@gmx.de>, Alex Deucher <alexander.deucher@amd.com>,
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
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 984c2f2b24b6..3dc0e8c3b91b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -604,7 +604,7 @@ static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
 		goto out;

 	pdd = qpd_to_pdd(qpd);
-	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
+	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
 			    pdd->process->pasid);

 	/* Mark all queues as evicted. Deactivate all active queues on
@@ -650,7 +650,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 		goto out;

 	pdd = qpd_to_pdd(qpd);
-	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
+	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
 			    pdd->process->pasid);

 	/* Mark all queues as evicted. Deactivate all active queues on
@@ -696,7 +696,7 @@ static int restore_process_queues_nocpsch(struct device_queue_manager *dqm,
 		goto out;
 	}

-	pr_info_ratelimited("Restoring PASID 0x%x queues\n",
+	pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
 			    pdd->process->pasid);

 	/* Update PD Base in QPD */
@@ -772,7 +772,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 		goto out;
 	}

-	pr_info_ratelimited("Restoring PASID 0x%x queues\n",
+	pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
 			    pdd->process->pasid);

 	/* Update PD Base in QPD */
--
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
