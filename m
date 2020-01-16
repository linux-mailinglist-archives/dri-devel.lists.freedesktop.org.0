Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4B13DDF5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5E46ED65;
	Thu, 16 Jan 2020 14:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3FC6ED67
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:49:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116144910euoutp0124a19a6ac1e1119e8b46b1e916ad3aae~qZW-KeDEx0621106211euoutp01a
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:49:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200116144910euoutp0124a19a6ac1e1119e8b46b1e916ad3aae~qZW-KeDEx0621106211euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579186150;
 bh=5z+EA0+AvXuwxUQKzh/8qQSatvOShkqzcgYqau+xnSE=;
 h=To:Cc:From:Subject:Date:References:From;
 b=DDIe3U6JBSA6KlAsZHaaKYN6rMDei5clQ7oEUlxFE4xn5+CarUuxGeU1KqlsF8uxJ
 27Gi9jmpwu8TZookH68EXl8jZ6a2TV8PXn1Zqkhm8QffWDpbuA5Dkq+V4YtpKq2E61
 2dFjdXVGFAiq3Ff7KNpSs5j2dONcAmZuVw6MkJnE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200116144909eucas1p269ec4b4c4e5572f9a85efd96b3d77f04~qZW_s57FO0038900389eucas1p2U;
 Thu, 16 Jan 2020 14:49:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CF.34.61286.5E7702E5; Thu, 16
 Jan 2020 14:49:09 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200116144909eucas1p1b247368aded82dad3ca8da852deaca1a~qZW_GmgFX3193331933eucas1p1f;
 Thu, 16 Jan 2020 14:49:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200116144909eusmtrp2bb0d677eae675ac93160d567dcaeb23f~qZW_FwysQ0199001990eusmtrp2U;
 Thu, 16 Jan 2020 14:49:09 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-05-5e2077e52aaf
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EE.A5.07950.4E7702E5; Thu, 16
 Jan 2020 14:49:08 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200116144908eusmtip29cb56798e109445012d2e882883204ea~qZW918RDk2936329363eusmtip2m;
 Thu, 16 Jan 2020 14:49:08 +0000 (GMT)
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: arcfb: add COMPILE_TEST support
Message-ID: <acf2cc2e-614d-f0fb-ce40-cee62bfcde4c@samsung.com>
Date: Thu, 16 Jan 2020 15:49:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djPc7pPyxXiDHqPqlncWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHMUl01Kak5mWWqRvl0CV8aCyzuY
 CuayVsxpfsXUwLiJpYuRk0NCwETi4trrzF2MXBxCAisYJX5232CHcL4wSrydvRfK+cwocfPp
 KUaYlkWLN0MlljNKXLp9Esp5yyixs+Mi2GARgQSJFdNngHUwC8RLbGs+CmazCVhJTGxfBWYL
 C9hJbL8Bso+TgxfIvrzpEiuIzSKgKtF57R8TiC0qECHx6cFhVogaQYmTM5+wQMwUl7j1ZD4T
 hC0vsf3tHLAnJAR+s0l8fbcPqIgDyHGRePGeH+JqYYlXx7ewQ9gyEv93gvSC1K9jlPjb8QKq
 eTujxPLJ/9ggqqwl7pz7xQYyiFlAU2L9Ln2IsKPExKuLmCDm80nceCsIcQOfxKRt05khwrwS
 HW1CENVqEhuWbWCDWdu1cyUzhO0hcWjCU6YJjIqzkHw2C8lns5B8NgvhhgWMLKsYxVNLi3PT
 U4sN81LL9YoTc4tL89L1kvNzNzECk8vpf8c/7WD8einpEKMAB6MSD++MIIU4IdbEsuLK3EOM
 EhzMSiK8J2fIxgnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TB
 KdXAuN5my53Xxc2XottexsmnRbXNtfWYJiocZOe9Q4XVVSr2/E+x+BJDzwXPZ60ryN0pPal6
 f2UTzwspzZcPVH5ulpbxD52fp8Ya6iO2cs7pP9U7j8xkvVMsW580bcoGpV9rVn3mXNjRuoyF
 N6v2bmyR9Xrd/M0KDrsOPKjZ7HFat+VPpu6cnIP1SizFGYmGWsxFxYkA59gdHioDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsVy+t/xe7pPyhXiDLactbG4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2BxYPe53H2fy6NuyitHj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
 PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwFl3cwFcxlrZjT/IqpgXETSxcjJ4eE
 gInEosWb2bsYuTiEBJYySqyftJyxi5EDKCEjcXx9GUSNsMSfa11sEDWvGSW+rPwF1iwikCDx
 9PV8NhCbWSBeonNbAyOIzSZgJTGxfRWYLSxgJ7H9xg12EJsXyL686RIriM0ioCrRee0fE4gt
 KhAhcXjHLEaIGkGJkzOfsEDMVJf4M+8SM4QtLnHryXwmCFteYvvbOcwTGAVmIWmZhaRlFpKW
 WUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMjW3Hfm7Zwdj1LvgQowAHoxIP74wg
 hTgh1sSy4srcQ4wSHMxKIrwnZ8jGCfGmJFZWpRblxxeV5qQWH2I0BXpoIrOUaHI+MG7zSuIN
 TQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwTjzhYryYN5Td9vhqtYfc
 Zzr0Nr+8/3/xZob5IvoRzz9z3npROFHE+GRdfJDmg8PHXi/fpcp5TE7fZUZhzI9GD4mnt7Nu
 6+vK+f5Qaqq44fjV7TRT3pYFJ3tUTHu/RRu8Pr+NQTHE6fHPYz0xmZcsIq0ev2T+bte9pvj/
 g6d1pSxipzJOa2rfUmIpzkg01GIuKk4EABHBc4OjAgAA
X-CMS-MailID: 20200116144909eucas1p1b247368aded82dad3ca8da852deaca1a
X-Msg-Generator: CA
X-RootMTR: 20200116144909eucas1p1b247368aded82dad3ca8da852deaca1a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116144909eucas1p1b247368aded82dad3ca8da852deaca1a
References: <CGME20200116144909eucas1p1b247368aded82dad3ca8da852deaca1a@eucas1p1.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add COMPILE_TEST support to arcfb driver for better compile
testing coverage.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/video/fbdev/Kconfig
===================================================================
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -435,7 +435,7 @@ config FB_FM2
 
 config FB_ARC
 	tristate "Arc Monochrome LCD board support"
-	depends on FB && X86
+	depends on FB && (X86 || COMPILE_TEST)
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
