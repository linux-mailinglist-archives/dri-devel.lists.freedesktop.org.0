Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB16713DD07
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5866ED25;
	Thu, 16 Jan 2020 14:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75E6ED21
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116140915euoutp02e03a7a50563c520833821974d3dd881e~qY0JFRyu70752307523euoutp02j
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200116140915euoutp02e03a7a50563c520833821974d3dd881e~qY0JFRyu70752307523euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579183755;
 bh=1y4h/ckmlOOn04vcRlmb2VBW9p/7FoCZ6c8TpaKL8tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z731CrGPShUqh9yDDlngj5FvZWyMn3L9zpMcRWVWNFB6CtzcVmdGf9vZUGOaEgW+N
 6UFO1bqwRkX23WmSFbfuwEQ2u3cbrhSLIUHR5qFkQk7uYW9AIub4nd3/AWAFQCEo4d
 Vs1IqkysSCHwdDAIgga5YvtBG1KANxUVqrvNhDUU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116140915eucas1p17f3346592c483649c006baef8015e1b8~qY0I6NrO20528405284eucas1p1s;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A8.7E.61286.B8E602E5; Thu, 16
 Jan 2020 14:09:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200116140915eucas1p2d6a2c654a66a78b6c3c1fc710f8a65b8~qY0Irp7it2447024470eucas1p2_;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200116140915eusmtrp2e91f74de4673ee1a69a0c3648d3b53d1~qY0InRigJ0965509655eusmtrp2A;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-46-5e206e8b10f7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.80.07950.B8E602E5; Thu, 16
 Jan 2020 14:09:15 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140914eusmtip10bfaf836e2919005c52838620cab6bc2~qY0ITO-Ea0711307113eusmtip1A;
 Thu, 16 Jan 2020 14:09:14 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] video: fbdev: controlfb: fix sparse warning about using
 incorrect type
Date: Thu, 16 Jan 2020 15:08:55 +0100
Message-Id: <20200116140900.26363-2-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116140900.26363-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduzned3uPIU4g8PzJS1urTvHarFxxnpW
 iytf37NZnOj7wGpxedccNgdWj/vdx5k8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK+P7im6m
 gj6uiiM3rjI3MB7l6GLk5JAQMJF41LyHqYuRi0NIYAWjxNeOLlaQhJDAF0aJdx8qIBKfGSXa
 Nv5ihun4u2MtC0RiOaPE2Y6pbBAOUMe2jXvZQKrYBKwkJravYgSxRQQSJFZMnwFkc3AwCzhK
 NPfzgZjCArESHUcVQCpYBFQlvu/tZgKxeQVsJZ5ObmWD2CUvsfXbJ7CDOAXsJOaduscIUSMo
 cXLmExYQmxmopnnrbGaQEyQEPrNJPGhcwQjR7CKxbdFEVghbWOLV8S3sELaMxP+d85kgGtYx
 SvzteAHVvZ1RYvnkf1CrrSXunPvFBnG0psT6XfoQYUeJeW/+sYKEJQT4JG68FYQ4gk9i0rbp
 zBBhXomONiGIajWJDcs2sMGs7dq5EhqGHhKf2tYxT2BUnIXknVlI3pmFsHcBI/MqRvHU0uLc
 9NRiw7zUcr3ixNzi0rx0veT83E2MwARy+t/xTzsYv15KOsQowMGoxMM7I0ghTog1say4MvcQ
 owQHs5II78kZsnFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJx
 cEo1MOr0LL3GGOHY3Zr5pmteuGH7heXe+WdqCjecPvYgIKKjktFosohy6hzrcB4x6f2pvOej
 J9+WlnvCyz27qt1s3g0nI7Ge36Xml5y26eh3FOtE3anfVHIrUlWUXVWz7uKCfa/Zimx9/yuI
 iC3I03WwXNsukXpx9ZGDydLvazdNj95WkcYpW6ajxFKckWioxVxUnAgATmGlDBwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsVy+t/xu7rdeQpxBs2NLBa31p1jtdg4Yz2r
 xZWv79ksTvR9YLW4vGsOmwOrx/3u40wefVtWMXp83iQXwBylZ1OUX1qSqpCRX1xiqxRtaGGk
 Z2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/F9RTdTQR9XxZEbV5kbGI9ydDFyckgI
 mEj83bGWpYuRi0NIYCmjxLVJ/4AcDqCEjMTx9WUQNcISf651sYHYQgKfGCV+L1IAsdkErCQm
 tq9iBLFFBJIkOhtOMoPYzALOErNuPWICsYUFoiW+bJjMDmKzCKhKfN/bDRbnFbCVeDq5lQ1i
 vrzE1m+fWEFsTgE7iXmn7jGCnCAEVHNomhREuaDEyZlPWCDGy0s0b53NPIFRYBaS1CwkqQWM
 TKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECw3zbsZ9bdjB2vQs+xCjAwajEwzsjSCFOiDWx
 rLgy9xCjBAezkgjvyRmycUK8KYmVValF+fFFpTmpxYcYTYF+mMgsJZqcD4zBvJJ4Q1NDcwtL
 Q3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjL5m3UKF1/e/VDp3x0HqYvWx2bf9
 HaVT/L6em+U8TfNrfKDY3FCWx2bOTx+57FBhz3tc7no75n3AxoMLNp5ruu97LCpUf/Zx5rLT
 +6NlFLkfZZY0v2aVU+ue37WU79uVq1FVSXP+n37DeYjf48M2eZYLIXY2oismXVXZHFa8YuVD
 7q0NHNbK1UosxRmJhlrMRcWJAOEsIpGJAgAA
X-CMS-MailID: 20200116140915eucas1p2d6a2c654a66a78b6c3c1fc710f8a65b8
X-Msg-Generator: CA
X-RootMTR: 20200116140915eucas1p2d6a2c654a66a78b6c3c1fc710f8a65b8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116140915eucas1p2d6a2c654a66a78b6c3c1fc710f8a65b8
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140915eucas1p2d6a2c654a66a78b6c3c1fc710f8a65b8@eucas1p2.samsung.com>
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
Cc: b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force le32_to_cpup() argument to be of proper type (const __le32 *).

Also add missing inline keyword to control_par_to_var() definition
(to match function prototype).

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 38b61cdb5ca4..d7e53520a24c 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -313,7 +313,7 @@ static int controlfb_blank(int blank_mode, struct fb_info *info)
 		container_of(info, struct fb_info_control, info);
 	unsigned ctrl;
 
-	ctrl = le32_to_cpup(CNTRL_REG(p,ctrl));
+	ctrl = le32_to_cpup((const __force __le32 *)CNTRL_REG(p, ctrl));
 	if (blank_mode > 0)
 		switch (blank_mode) {
 		case FB_BLANK_VSYNC_SUSPEND:
@@ -952,7 +952,8 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
  * Convert hardware data in par to an fb_var_screeninfo
  */
 
-static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
+static inline void control_par_to_var(struct fb_par_control *par,
+	struct fb_var_screeninfo *var)
 {
 	struct control_regints *rv;
 	
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
