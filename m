Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6511EB9B0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 12:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EEB89321;
	Tue,  2 Jun 2020 10:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CA989D57
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 10:38:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200602103819euoutp014c7edcf6d0ffc096fa0dfe0122d1eded~Us9XrTZsl0267802678euoutp01I
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 10:38:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200602103819euoutp014c7edcf6d0ffc096fa0dfe0122d1eded~Us9XrTZsl0267802678euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591094299;
 bh=srJNMlN35yPx2wBufa1+xyUmNboKPt4b/fJgTaYJwj0=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=HTQ6BOEfhJHzUPwFhSeT4t9bbPokCsqZl9PeMbsDCpRaH0Hp5L6227Uxb9m6wvwOc
 cVT2Q6IjaXJwpQdKMZgvn9K+aG6ICbrktt1HOicRKed2k56zS6ri1h6ptRbO1F9ZSJ
 TTG7cxSDiVqkw206eaksVvJeaw/54km0/uI58zdk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200602103819eucas1p1c7c078d397114df8c40cc227b64cf65a~Us9XjvqQt1569715697eucas1p1i;
 Tue,  2 Jun 2020 10:38:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E3.6D.61286.B1C26DE5; Tue,  2
 Jun 2020 11:38:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200602103819eucas1p1613484842ec2169440d9597557b1c740~Us9XTovJY1306513065eucas1p1l;
 Tue,  2 Jun 2020 10:38:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200602103819eusmtrp29f4bef2776ab5dcdb45cdb0d40edd7a5~Us9XS8WIG1507115071eusmtrp2v;
 Tue,  2 Jun 2020 10:38:19 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-b5-5ed62c1b625a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C6.49.07950.B1C26DE5; Tue,  2
 Jun 2020 11:38:19 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200602103818eusmtip1e7b600b92b20ab441ca5277343e72794~Us9W4WQcS2246822468eusmtip1f;
 Tue,  2 Jun 2020 10:38:18 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] video: fbdev: amifb: add FIXMEs about {put,get}_user()
 failures
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <a514e3bf-2e1a-ff4d-5529-3e918d067d5e@samsung.com>
Date: Tue, 2 Jun 2020 12:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djPc7rSOtfiDA6dU7S48vU9m8WzW3uZ
 LE70fWC1uLxrDpvF8idrmS3O/z3O6sDmcehwB6PH/e7jTB4nW7+xeHzeJOex6clbpgDWKC6b
 lNSczLLUIn27BK6Mle+WMBac46w42b6DrYHxCnsXIyeHhICJxI3JUxi7GLk4hARWMEpM3tPA
 DOF8YZSYP2cWVOYzo8TJL7vYYFrmfW9gArGFBJYzSvzZwwFR9JZR4t7VUywgCTYBK4mJ7asY
 QWxhgTCJBS/vgDWICDhITLkxAWw3s8ACRokth5xBbF4BO4kZc7rAelkEVCSmrG4BqxcViJD4
 9OAwK0SNoMTJmU/AajgFPCV29F5mgpgjLnHryXwoW15i+9s5YC9ICKxjl7j9aDYTxNUuEle2
 r2eBsIUlXh3fAg0AGYn/O0GawRoYJf52vIDq3s4osXzyP6ifrSXunPsFZHMArdCUWL9LHyLs
 KHHmwksmkLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyT2BUmoXktVlI
 3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECEw9p/8d/7SD8eulpEOM
 AhyMSjy8G+5fiRNiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7j
 RS9jhQTSE0tSs1NTC1KLYLJMHJxSDYyGuaY+040tyquyzDeJmS5KePluXoD382ObuNWiKy8q
 MP8QfyV27PHV7V/zmzpXeFx2+Xg9Pe34h95zu4y1Fz77Zjzjp6/vkpe3NtrX5j2JkpF+vGb1
 lAkqhSt8d97aua6Bbb8V168V6i90vQKnFRzdyFC331U7myFp4XO5Y7tOW0afS0y5/T1MiaU4
 I9FQi7moOBEAuyosQzkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xu7rSOtfiDK7c4bW48vU9m8WzW3uZ
 LE70fWC1uLxrDpvF8idrmS3O/z3O6sDmcehwB6PH/e7jTB4nW7+xeHzeJOex6clbpgDWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mle+WMBac
 46w42b6DrYHxCnsXIyeHhICJxLzvDUxdjFwcQgJLGSUWPzvJ0sXIAZSQkTi+vgyiRljiz7Uu
 Noia14wSNx7MYANJsAlYSUxsX8UIYgsLhEkseHmHCcQWEXCQmHJjAjtIA7PAAkaJs20HWSG6
 5zBK7Hh1A6yDV8BOYsacLhYQm0VARWLK6hawblGBCInDO2ZB1QhKnJz5BKyGU8BTYkfvZbAa
 ZgF1iT/zLjFD2OISt57Mh4rLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVG
 esWJucWleel6yfm5mxiB0bbt2M8tOxi73gUfYhTgYFTi4d1w/0qcEGtiWXFl7iFGCQ5mJRFe
 p7On44R4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gI8kriDU0NzS0sDc2NzY3NLJTEeTsE
 DsYICaQnlqRmp6YWpBbB9DFxcEo1MDY/tS/cLtAV9c3x8PSYtAK9eRVCL2eb/Vnz4WfbgmUz
 pWz2djyZ8qD59aliXpOkXD8x88Izs4680Vy7VeGHptPPE68zL65a+SOkvyyWdbIvoyy/lWwt
 j1jRU/Neq/7Q6Ftt16/d1tOaLaRV4hKb6C10ybrL6NEpIRbGTp7ils0WTGcWyX13VGIpzkg0
 1GIuKk4EAGB0mu3MAgAA
X-CMS-MailID: 20200602103819eucas1p1613484842ec2169440d9597557b1c740
X-Msg-Generator: CA
X-RootMTR: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we lack the hardware (or proper emulator setup) for
testing needed changes add FIXMEs to document the issues
(so at least they are not forgotten).

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/amifb.c |    2 ++
 1 file changed, 2 insertions(+)

Index: b/drivers/video/fbdev/amifb.c
===================================================================
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -1866,6 +1866,7 @@ static int ami_get_var_cursorinfo(struct
 				"clrb %0 ; swap %1 ; lslw #1,%1 ; roxlb #1,%0 ; "
 				"swap %1 ; lslw #1,%1 ; roxlb #1,%0"
 				: "=d" (color), "=d" (datawords) : "1" (datawords));
+			/* FIXME: check the return value + test the change */
 			put_user(color, data++);
 		}
 		if (bits > 0) {
@@ -1923,6 +1924,7 @@ static int ami_set_var_cursorinfo(struct
 		bits = 16; words = delta; datawords = 0;
 		for (width = (short)var->width - 1; width >= 0; width--) {
 			unsigned long tdata = 0;
+			/* FIXME: check the return value + test the change */
 			get_user(tdata, data);
 			data++;
 			asm volatile (
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
