Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB614AFB
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2AD89932;
	Mon,  6 May 2019 13:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DB389932
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:36:48 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190506133647euoutp01bd75d45fac781306ff68f8620e718ef0~cG3-XJ1G00217602176euoutp01I
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:36:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190506133647euoutp01bd75d45fac781306ff68f8620e718ef0~cG3-XJ1G00217602176euoutp01I
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190506133646eucas1p1da9c632aad85f681acd4466a7eaf21ca~cG3__AKpo1913119131eucas1p1q;
 Mon,  6 May 2019 13:36:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.56.04325.E6830DC5; Mon,  6
 May 2019 14:36:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190506133645eucas1p28ec8b11ad9d2109d92029b86b1c29425~cG3_J9sMq2088420884eucas1p2j;
 Mon,  6 May 2019 13:36:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190506133645eusmtrp1e94c412f27e99463b1b2e3ba16cc394e~cG3978Zl91095910959eusmtrp1P;
 Mon,  6 May 2019 13:36:45 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-ff-5cd0386e7615
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 60.60.04140.D6830DC5; Mon,  6
 May 2019 14:36:45 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190506133645eusmtip1ddfc37e0a733b13cd9062236dd513ee0~cG39kQvWY0999109991eusmtip1V;
 Mon,  6 May 2019 13:36:45 +0000 (GMT)
Subject: Re: [PATCH 13/57] docs: fb: convert documentation to ReST format
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <ff3ed615-ba13-37d7-7c5f-583161e91adc@samsung.com>
Date: Mon, 6 May 2019 15:36:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <f282cbd57dcee9d598c13d8b1e4ea4cc1459b8ad.1555382110.git.mchehab+samsung@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djPc7p5FhdiDN7uFLZ4cqCd0eLK1/ds
 FgvblrBYnOj7wGpxedccNov3nzqZLHacWsTswO6xeYWWx6ZVnWwe97uPM3ks7pvM6vF5k1wA
 axSXTUpqTmZZapG+XQJXxpM1P9gLVjNX/Hoxka2B8QlTFyMnh4SAicS0Z73MXYxcHEICKxgl
 nv47xwbhfGGU+HR0FSOE85lRYseWiewwLf0Ni9khEssZJfZ3XILqf8so8fzoMmaQKmEBT4n/
 R5+C2SICZhInzx0Fm8ss8JJRYvmpP6wgCTYBK4mJ7SA7ODl4BewkPm84ABZnEVCRuPl3I1AD
 B4eoQIRE/xl1iBJBiZMzn7CA2JwCiRKNHXvBypkF5CW2v50DdoSEwDJ2ieOfu1khTnWRuPG8
 nQXCFpZ4dXwL1AsyEqcn97BANKxjlPjb8QKqezvQdZP/sUFUWUscPn6RFeQKZgFNifW79CHC
 jhKN1x8xg4QlBPgkbrwVhDiCT2LStulQYV6JjjYhiGo1iQ3LNrDBrO3auZIZwvaQeLmzn2UC
 o+IsJK/NQvLOLIS9CxiZVzGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgQmm9P/jn/dwbjv
 T9IhRgEORiUeXg+l8zFCrIllxZW5hxglOJiVRHgTn52LEeJNSaysSi3Kjy8qzUktPsQozcGi
 JM5bzfAgWkggPbEkNTs1tSC1CCbLxMEp1cA4j/Ptw7o/b9NmpUv1pcafORsutzvxybe+O8sy
 Y5rnKb82CnioZMq0JeCi/9OpUyzWnpy6kHEZ2zsW/o91p7LWz5ibdfIe1+85Yiv548t1N9Wt
 F1uaNHO6r/a1ksyz1vMuvjabkty1IfNfTvsR68S6Rbf9cx/LTLjCxNPPWjST6dHejMq+DVNX
 KbEUZyQaajEXFScCAMySGdgyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xu7q5FhdiDO4/lbJ4cqCd0eLK1/ds
 FgvblrBYnOj7wGpxedccNov3nzqZLHacWsTswO6xeYWWx6ZVnWwe97uPM3ks7pvM6vF5k1wA
 a5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexpM1
 P9gLVjNX/Hoxka2B8QlTFyMnh4SAiUR/w2L2LkYuDiGBpYwS3zcvBEpwACVkJI6vL4OoEZb4
 c62LDaLmNaNEV+deRpCEsICnxP+jT5lBbBEBM4mT546ygdhCAi8YJXouiYI0MAu8ZJTY2LSe
 FSTBJmAlMbF9FVgzr4CdxOcNB8DiLAIqEjf/bgRrFhWIkLj1sIMFokZQ4uTMJ2A2p0CiRGPH
 XrB6ZgF1iT/zLjFD2PIS29/OYZ7AKDgLScssJGWzkJQtYGRexSiSWlqcm55bbKRXnJhbXJqX
 rpecn7uJERhD24793LKDsetd8CFGAQ5GJR5eD6XzMUKsiWXFlbmHGCU4mJVEeBOfnYsR4k1J
 rKxKLcqPLyrNSS0+xGgK9MREZinR5HxgfOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJ
 zU5NLUgtgulj4uCUamDcvGjDgivG0zSMf0Vul1jaEd+4PcD7+t7zZy86HLu3YdGS5rXskbEz
 bq7RbdHdZKC/ZKPiAYPExNzlQnNmVYmucnVxLE+LL/93xISr5LKPYtVB3xuvT0bV79Hy7V/P
 Vehk+0x3u8C8F6zO9TtdH3xPjJ2/MnfS5lvum5nzdYt29YpGW8TMsG1RYinOSDTUYi4qTgQA
 SqZNebcCAAA=
X-CMS-MailID: 20190506133645eucas1p28ec8b11ad9d2109d92029b86b1c29425
X-Msg-Generator: CA
X-RootMTR: 20190416025636epcas4p2b3bd395b2673bffb3cc0cbdd211aa841
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190416025636epcas4p2b3bd395b2673bffb3cc0cbdd211aa841
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
 <CGME20190416025636epcas4p2b3bd395b2673bffb3cc0cbdd211aa841@epcas4p2.samsung.com>
 <f282cbd57dcee9d598c13d8b1e4ea4cc1459b8ad.1555382110.git.mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1557149807;
 bh=mpzfjPxjilDGHHTfSGCPPOE2d5TMe4FioI4bwbCKZKM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=k0jb0a3jdVNvB97ioEkUQyu2CUAewOOyuQE6gox++Os4uPaotPrJgw/+AC5tCRSi7
 MFYpPFeGGtSblbim93y8RJu1IL8ZIKfa8WGV9I77nsWIrb9/UdmMG9F+BbuG2jNJQJ
 qnCrxOWVdajf229bnzGSmgSZVOg8ojRFomL5eo3E=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzE2LzIwMTkgMDQ6NTUgQU0sIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiBD
b252ZXJ0IGFsbCBkb2N1bWVudHMgaGVyZSBmcm9tIHBsYWluIHR4dCB0byBSZVNUIGZvcm1hdCwg
aW4KPiBvcmRlciB0byBhbGxvdyBwYXJzaW5nIHRoZW0gd2l0aCB0aGUgZG9jdW1lbnRhdGlvbiBi
dWlsZAo+IHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgoKQWNrZWQtYnk6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkJlc3QgcmVnYXJkcywKLS0KQmFy
dGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1
bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
