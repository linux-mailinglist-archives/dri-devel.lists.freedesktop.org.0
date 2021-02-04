Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45330EE6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B6F6ED00;
	Thu,  4 Feb 2021 08:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028AC6ECE5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 07:35:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0UNpof-u_1612424127; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UNpof-u_1612424127) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 04 Feb 2021 15:35:27 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: christian.koenig@amd.com
Subject: [PATCH] scsi: lpfc: Remove unneeded return variable
Date: Thu,  4 Feb 2021 15:35:25 +0800
Message-Id: <1612424125-91111-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: dick.kennedy@broadcom.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Yang Li <yang.lee@linux.alibaba.com>,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch removes unneeded return variables, using only
'1' instead.
It fixes the following warning detected by coccinelle:

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 95caad7..31f97f6 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -3376,7 +3376,6 @@ struct lpfc_hbq_init *lpfc_hbq_defs[] = {
 			  struct lpfc_iocbq *saveq)
 {
 	struct lpfc_iocbq *cmdiocbp;
-	int rc = 1;
 	unsigned long iflag;
 
 	cmdiocbp = lpfc_sli_iocbq_lookup(phba, pring, saveq);
@@ -3501,7 +3500,7 @@ struct lpfc_hbq_init *lpfc_hbq_defs[] = {
 		}
 	}
 
-	return rc;
+	return 1;
 }
 
 /**
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
