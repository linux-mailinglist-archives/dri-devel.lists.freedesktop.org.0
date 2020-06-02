Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4751EBAC0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 13:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6489D7B;
	Tue,  2 Jun 2020 11:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D14889D7B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 11:50:53 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200602115051euoutp018f8d2630eb66663d4f55f4c5064a0ac7~Ut8sv8mVA0031300313euoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 11:50:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200602115051euoutp018f8d2630eb66663d4f55f4c5064a0ac7~Ut8sv8mVA0031300313euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591098651;
 bh=I0Dn5BxzJ+CXY2oWZbgxWOBH4kPjXztDF8cgyoiRsiw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=OhqalJ2NrcZNvb6+2JQcZrmCdk210myfkPYG9ZRknXvMXqxZFdidGKXjxiqFJeaqJ
 SkfnwNvHRJzLjwl0OROCdjRM/FqxgaZ71fzfTAYRG1qZMBgmBvUKsj7BsLA8fFgIQi
 GDtPz3WTTM469UM2qAEi7cbslu5atDeBDB9AO37M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200602115051eucas1p2427ab69d905703d29b3cabf4b7b29267~Ut8skURLL3250832508eucas1p2_;
 Tue,  2 Jun 2020 11:50:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C4.09.61286.B1D36DE5; Tue,  2
 Jun 2020 12:50:51 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200602115051eucas1p235883fa1de4738974b6066f24c9351de~Ut8sSXGSp2118021180eucas1p24;
 Tue,  2 Jun 2020 11:50:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200602115051eusmtrp290e10a7da754d2a574a23a8f6bf576ef~Ut8sRyQX92574825748eusmtrp2w;
 Tue,  2 Jun 2020 11:50:51 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-66-5ed63d1b92b1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F4.14.07950.B1D36DE5; Tue,  2
 Jun 2020 12:50:51 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200602115050eusmtip267e0418b6b1a0734543180ef1c0a774e~Ut8r3Wjm20841708417eusmtip2o;
 Tue,  2 Jun 2020 11:50:50 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/2] video: fbdev: amifb: add FIXME about dead APUS support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <767d36ff-22ec-8136-7ebc-1d9d0d3ac98d@samsung.com>
Date: Tue, 2 Jun 2020 13:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87rSttfiDJpWS1hc+fqezeLZrb1M
 Fif6PrBaXN41h81i+ZO1zBbn/x5ndWDzOHS4g9HjfvdxJo+Trd9YPD5vkvPY9OQtUwBrFJdN
 SmpOZllqkb5dAlfGowNTmAsWc1dM3fCbpYFxAWcXIweHhICJxKaJ9l2MnBxCAisYJX41WXQx
 cgHZXxglLs07yQjhfGaU2PjpITtIFUjDgwcv2CESyxkleuYuZYFof8sosXsXmM0mYCUxsX0V
 I4gtLBAg8ef4S7C4iICDxJQbE8AGMQssYJTYcsgZxOYVsJP42LiJGcRmEVCR2L77EBOILSoQ
 IfHpwWFWiBpBiZMzn4DN4RTwlNjRe5kJYo64xK0n86FseYntb+cwgxwnIbCOXeL2jJVMEFe7
 SJx7u5oFwhaWeHV8C9Q3MhL/d4I0gzUwSvzteAHVvZ1RYvnkf2wQVdYSd879YgMFGLOApsT6
 XfoQYUeJMxdeMkHCkU/ixltBiCP4JCZtm84MEeaV6GgTgqhWk9iwbAMbzNqunSuZJzAqzULy
 2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBKad0/+Of9rB+PVS
 0iFGAQ5GJR5eA8NrcUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xCjNwaIk
 zmu86GWskEB6YklqdmpqQWoRTJaJg1OqgXGZsdvdVFMGJ36Puz2r63d++/dSas8vgxlZbd0K
 m5ctOLbq7OodVnfnmNvG8lw8draG7eP8ev39KjMXtf6/suWCp9Wj9n9+01jYU7NyUr/6BxYf
 eLmlk/U6w5xqpVUv+FdIRNUr9D26JTP3DdfjA3NXvTeYpTYhU/3kUd6vubVzf21cPi2urfKI
 EktxRqKhFnNRcSIAhvVaGjcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7rSttfiDGYeYLO48vU9m8WzW3uZ
 LE70fWC1uLxrDpvF8idrmS3O/z3O6sDmcehwB6PH/e7jTB4nW7+xeHzeJOex6clbpgDWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MRwemMBcs
 5q6YuuE3SwPjAs4uRk4OCQETiQcPXrCD2EICSxkl9v827mLkAIrLSBxfXwZRIizx51oXWxcj
 F1DJa0aJP8uWsIEk2ASsJCa2r2IEsYUF/CR2rL/FDGKLCDhITLkxgR2kgVlgAaPE2baDrBDd
 cxgldry6AdbBK2An8bFxE1gHi4CKxPbdh5hAbFGBCInDO2ZB1QhKnJz5hAXE5hTwlNjRexms
 hllAXeLPvEvMELa4xK0n86Hi8hLb385hnsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6x
 kV5xYm5xaV66XnJ+7iZGYKxtO/Zzyw7GrnfBhxgFOBiVeHgNDK/FCbEmlhVX5h5ilOBgVhLh
 dTp7Ok6INyWxsiq1KD++qDQntfgQoynQcxOZpUST84FpIK8k3tDU0NzC0tDc2NzYzEJJnLdD
 4GCMkEB6YklqdmpqQWoRTB8TB6dUA2P6vZzCKfN5kmwsQ/eeS1d7F6HSyMgbIzHBP+lI+hnp
 Z0u39Up4ntqz4MCRq0JFQUHhSjmH5/5/lvrhC6v/ccXjxjrZzSndFxVbq68uXHYotan448nV
 5zxfMVSH77nv3uQh/iMvNXtjbpeoRuHLgxYmN3Kv/vAVkYlafajr1qcW4y+B6ouyGpVYijMS
 DbWYi4oTAXm2VwPLAgAA
X-CMS-MailID: 20200602115051eucas1p235883fa1de4738974b6066f24c9351de
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


On 5/14/20 10:21 PM, Geert Uytterhoeven wrote:

> These #ifdefs are relics from APUS (Amiga Power-Up System), which
> added a PPC board.  APUS support was killed off a long time ago,
> when arch/ppc/ was still king, but these #ifdefs were missed, because
> they didn't test for CONFIG_APUS.

Add FIXME about using the C code variants (APUS ones) in the future.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
v2:
- added FIXME comment instead of removing the C code variants

 drivers/video/fbdev/amifb.c |    6 ++++++
 1 file changed, 6 insertions(+)

Index: b/drivers/video/fbdev/amifb.c
===================================================================
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -575,6 +575,12 @@ static u_short maxfmode, chipset;
 #define downx(x, v)	((v) & -(x))
 #define modx(x, v)	((v) & ((x) - 1))
 
+/*
+ * FIXME: Use C variants of the code marked with #ifdef __mc68000__
+ * in the driver. It shouldn't negatively affect the performance and
+ * is required for APUS support (once it is re-added to the kernel).
+ * Needs to be tested on the hardware though..
+ */
 /* if x1 is not a constant, this macro won't make real sense :-) */
 #ifdef __mc68000__
 #define DIVUL(x1, x2) ({int res; asm("divul %1,%2,%3": "=d" (res): \
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
