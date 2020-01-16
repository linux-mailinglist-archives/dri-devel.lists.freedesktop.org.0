Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B19A13DE15
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D175B6ED6F;
	Thu, 16 Jan 2020 14:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7D6ED6F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:54:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116145400euoutp024235df7f68dca63180cc3cd5ed46be44~qZbNPDBsB0280602806euoutp02x
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:54:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200116145400euoutp024235df7f68dca63180cc3cd5ed46be44~qZbNPDBsB0280602806euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579186440;
 bh=XdrI+OO75vRLBbhW+mHu3KAZTISM1ytL0ytmqWyeHDA=;
 h=From:Subject:To:Cc:Date:References:From;
 b=Z/Ki2IUPZZTozg/spYOCqkvBC8CJ9jM8Drl2s7AsjJN6ydBy4jTLrMmt0k53Tlwrc
 +dpfW/zHkbOg/ukBoz5cjxAKriDWa4UqhGLgXZo6K2LzhOFsu+DkjKs0DFUthTOzZk
 fbJIPeK1HBhkaN7ncYEv2V0vnSF7Jmt3JSK3Lfwg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116145359eucas1p106c0d8b189de26020a2abc90a011abc5~qZbNCHrD41475814758eucas1p1u;
 Thu, 16 Jan 2020 14:53:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DA.64.60679.709702E5; Thu, 16
 Jan 2020 14:53:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad~qZbMmHjku1474814748eucas1p1k;
 Thu, 16 Jan 2020 14:53:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200116145359eusmtrp193f3b8df6875d5ca4056f18d484c2f01~qZbMlkW9b1290712907eusmtrp1b;
 Thu, 16 Jan 2020 14:53:59 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-47-5e2079070f59
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5E.C5.08375.709702E5; Thu, 16
 Jan 2020 14:53:59 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200116145359eusmtip22712bacbda3ce93bb3ce246f702f9176~qZbMTpyNy0040600406eusmtip2T;
 Thu, 16 Jan 2020 14:53:59 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] video: fbdev: w100fb: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <a929db5e-d373-7b09-ae2b-efec227f7e85@samsung.com>
Date: Thu, 16 Jan 2020 15:53:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djPc7rslQpxBleeGlvcWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHMUl01Kak5mWWqRvl0CV8bqVbfY
 C7ayVqxesIypgfEkSxcjB4eEgInE6w6FLkYuDiGBFYwSq3a+ZoVwvjBKzO57wALhfGaUmNr9
 g7mLkROs4+ibdUwQieWMEt8vrmCGcN4ySjzfv5cRpIpNwEpiYvsqMFtYwFli1q3/YN0iAgkS
 K6bPAIszC8RLbGs+CmbzCthJbD26ng3EZhFQlfh44TdYXFQgQuLTg8OsEDWCEidnPmGB6BWX
 uPVkPhOELS+x/e0csCMkBH6zSUxc+J4N4lQXibkP1rFD2MISr45vgbJlJE5P7mGBaFjHKPG3
 4wVU93ZGieWT/0F1W0vcOfeLDRRMzAKaEut36UOEHSV2bd3LDgk9PokbbwUhjuCTmLRtOjNE
 mFeio00IolpNYsOyDWwwa7t2roSGoofElPmvmSYwKs5C8tosJK/NQvLaLIQbFjCyrGIUTy0t
 zk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMLqf/Hf+yg3HXn6RDjAIcjEo8vDOCFOKEWBPLiitz
 DzFKcDArifCenCEbJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgs
 EwenVANj+oPrATP73ht91zi+vTVtmchf0yn3Cn+aP703YduefyVhj1wNmbgf9bztlTkQ+V/f
 dN1k4fY77klX50zhqo/1umPXuuoHd0gyc6tFb/6ul5qab/7YR0sW+5re328UxhC3luP5yaz3
 NpUdH2O2nlsUoSj18/MxlsVL/WY8zjWM/PdoVvOSxCRrJZbijERDLeai4kQAHTrjICoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsVy+t/xe7rslQpxBru+SVncWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
 nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbqVbfYC7ayVqxesIypgfEkSxcjJ4eE
 gInE0TfrmLoYuTiEBJYySsxv28bWxcgBlJCROL6+DKJGWOLPtS42iJrXjBIPd69lBEmwCVhJ
 TGxfBWYLCzhLzLr1nxnEFhFIkHj6ej4biM0sEC/Rua0BrIZXwE5i69H1YHEWAVWJjxd+g8VF
 BSIkDu+YBVUjKHFy5hMWiF51iT/zLjFD2OISt57MZ4Kw5SW2v53DPIFRYBaSlllIWmYhaZmF
 pGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwNjYduzn5h2MlzYGH2IU4GBU4uGdEaQQ
 J8SaWFZcmXuIUYKDWUmE9+QM2Tgh3pTEyqrUovz4otKc1OJDjKZAD01klhJNzgfGbV5JvKGp
 obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsYik8aeo8ujNlRsymhb9urS
 V5/X8pPPtd0U2n98/UkTYzvJWHGuy727ek8oJlRM2xV3ojZ1opbUU3vHv1H/7b8V5bC9KBS+
 nysfvvrtjWd8r06aeD01LFk4//GMNd84M4QOvDf6ufzJtRuL7zz7baasxTkrSNx89/6Mo8b8
 sbEf+X3/KjApLxRTYinOSDTUYi4qTgQAUuJ4PqMCAAA=
X-CMS-MailID: 20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad
X-Msg-Generator: CA
X-RootMTR: 20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad
References: <CGME20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad@eucas1p1.samsung.com>
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

Add COMPILE_TEST support to w100fb driver for better compile
testing coverage.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/video/fbdev/Kconfig
===================================================================
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1827,7 +1827,7 @@ config FB_FSL_DIU
 
 config FB_W100
 	tristate "W100 frame buffer support"
-	depends on FB && ARCH_PXA
+	depends on FB && HAS_IOMEM && (ARCH_PXA || COMPILE_TEST)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
