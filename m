Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4413DE01
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67776ED6B;
	Thu, 16 Jan 2020 14:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433296ED6B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:52:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116145158euoutp024ec8fc87dc454a2ddadb5cc8d9a39ea0~qZZcIvM2o0239102391euoutp02i
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:51:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200116145158euoutp024ec8fc87dc454a2ddadb5cc8d9a39ea0~qZZcIvM2o0239102391euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579186318;
 bh=eDWEzmLtRtpacDCykwM0Ji2pPGDYcWv0YH073EOlnAs=;
 h=From:Subject:To:Cc:Date:References:From;
 b=OYICutzVSkQIm2+6AoRIux35XAEZiXnQ5fHLneq8lWjCoA9+kRZykjJc3gguXNp+R
 hBOzbfhPJ3gpYvl8pN9Yu/iAd8eWB9Oap6LdUg9L3MnJ5t511kKB+g6Tz/8Ni7VQMx
 VVh4fXCG1EXbHGMPxLzVJwGMTvCKhBhDMTkR8Lps=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116145158eucas1p190b7fcca1c9572bbbf3e05642e85327b~qZZbzUN4J1473514735eucas1p1f;
 Thu, 16 Jan 2020 14:51:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.94.61286.E88702E5; Thu, 16
 Jan 2020 14:51:58 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200116145157eucas1p2401abc6b00654d767e872edbd0338957~qZZbPOFr20103801038eucas1p2f;
 Thu, 16 Jan 2020 14:51:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200116145157eusmtrp155f3bc762c42ca794b1c4afe544e2e5b~qZZbOoV5R1166311663eusmtrp1h;
 Thu, 16 Jan 2020 14:51:57 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-e5-5e20788e3a01
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 82.06.07950.D88702E5; Thu, 16
 Jan 2020 14:51:57 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116145157eusmtip1d789207b51ef906eaf222763957d046a~qZZa460yx0309103091eusmtip1b;
 Thu, 16 Jan 2020 14:51:57 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] video: fbdev: sh_mobile_lcdcfb: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <d98fea18-b72e-6d0f-33ac-1421738bd12b@samsung.com>
Date: Thu, 16 Jan 2020 15:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djP87p9FQpxBnP3CFvcWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHMUl01Kak5mWWqRvl0CV8a8S4dZ
 C6awVRze9oilgXEOaxcjB4eEgIlEf19AFyMXh5DACkaJydNWsUE4XxglTvTfhXI+M0psWNvC
 2MXICdbx9uUkdojEckaJr6sWM0E4bxklnl3dwwRSxSZgJTGxfRVYh7CAv8T1HXPZQGwRgQSJ
 FdNngMWZBeIltjUfBbN5Bewk/r77zg5iswioSizr3wg2R1QgQuLTg8OsEDWCEidnPmGB6BWX
 uPVkPhOELS+x/e0cZpAjJAR+s0mc7Whjg3jOReJFPz/E1cISr45vYYewZSROT+5hgahfxyjx
 t+MFVPN2Ronlk/+xQVRZS9w59wtsELOApsT6XfoQYUeJ5qZ3LBDz+SRuvBWEuIFPYtK26cwQ
 YV6JjjYhiGo1iQ3LNrDBrO3auZIZwvaQ+HvlAvsERsVZSD6bheSzWUg+m4VwwwJGllWM4qml
 xbnpqcWGeanlesWJucWleel6yfm5mxiBqeX0v+OfdjB+vZR0iFGAg1GJh3dGkEKcEGtiWXFl
 7iFGCQ5mJRHekzNk44R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgST
 ZeLglGpgXDvJhGu1rMP9de3fNtew7mW4W153rSAs1Hhr2Dz/L0c+q0cXJoe6Bfrd3PQ+flGW
 Jdv6gwbHXr28xzbDfEFD997rNdccHNS3dh7fEjg96WHAqyvSnybWvfWR8pWQfJcetu3DlBbl
 pQV2m2vst5w4PUf299TX7U9sjp6bK/rbcfVqEXat0BvTbyuxFGckGmoxFxUnAgBHwyxnKQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4Xd3eCoU4g6Z9Gha31p1jtdg4Yz2r
 xZWv79ksTvR9YLW4vGsOmwOrx/3u40wefVtWMXp83iQXwBylZ1OUX1qSqpCRX1xiqxRtaGGk
 Z2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5eglzHv0mHWgilsFYe3PWJpYJzD2sXIySEh
 YCLx9uUk9i5GLg4hgaWMEstufQJKcAAlZCSOry+DqBGW+HOtiw2i5jWjxP3ff9hAEmwCVhIT
 21cxgtQLC/hKnLqXAhIWEUiQePp6PlgJs0C8ROe2BkYQm1fATuLvu+/sIDaLgKrEsv6NTCC2
 qECExOEds6BqBCVOznzCAtGrLvFn3iVmCFtc4taT+UwQtrzE9rdzmCcwCsxC0jILScssJC2z
 kLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERgZ24793LKDsetd8CFGAQ5GJR7eGUEK
 cUKsiWXFlbmHGCU4mJVEeE/OkI0T4k1JrKxKLcqPLyrNSS0+xGgK9NBEZinR5Hxg1OaVxBua
 GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBU+ZBrdOIA32SRO990NB5L
 9jdK+VpeqGFvTSp+He5laR2Udnin10Y5C9emWw+eNG5jOLhN/fWZicZW93Y7pQhvWHvbaMay
 G23389JWxU+8rbFHNvyfu/Qrp3X2Ih2bDiy67Km58vtkr+j/eVsMvkd8nzZ7h8/yiYWekwpn
 R8Xen3w8uf7IvH29SizFGYmGWsxFxYkA5KJ5iKICAAA=
X-CMS-MailID: 20200116145157eucas1p2401abc6b00654d767e872edbd0338957
X-Msg-Generator: CA
X-RootMTR: 20200116145157eucas1p2401abc6b00654d767e872edbd0338957
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145157eucas1p2401abc6b00654d767e872edbd0338957
References: <CGME20200116145157eucas1p2401abc6b00654d767e872edbd0338957@eucas1p2.samsung.com>
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

Add COMPILE_TEST support to sh_mobile_lcdcfb driver for better compile
testing coverage.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: b/drivers/video/fbdev/Kconfig
===================================================================
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1844,7 +1844,8 @@ config FB_W100
 
 config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
-	depends on FB && (SUPERH || ARCH_RENESAS) && HAVE_CLK
+	depends on FB && HAVE_CLK && HAS_IOMEM
+	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
