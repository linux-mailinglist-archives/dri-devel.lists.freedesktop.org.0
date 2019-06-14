Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BC46166
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AB4893EA;
	Fri, 14 Jun 2019 14:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BF5893EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:46:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190614144635euoutp019217c77f8939d48ce2ff14249ee838cf~oF-E4vWLU3111131111euoutp01k
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:46:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190614144635euoutp019217c77f8939d48ce2ff14249ee838cf~oF-E4vWLU3111131111euoutp01k
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190614144635eucas1p28ee07a5d9cdfdaad65acfe24a5ebeead~oF-EYApa_1628416284eucas1p2D;
 Fri, 14 Jun 2019 14:46:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FB.B4.04377.A43B30D5; Fri, 14
 Jun 2019 15:46:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190614144634eucas1p1b04dcfcc040c3c886d2b33592c501d3b~oF-DiByud2594525945eucas1p1i;
 Fri, 14 Jun 2019 14:46:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190614144633eusmtrp125c1f4b0e707a8b9c37c4f82f4ea609f~oF-DShgZ32478124781eusmtrp1l;
 Fri, 14 Jun 2019 14:46:33 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-56-5d03b34aff7d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 63.7E.04140.943B30D5; Fri, 14
 Jun 2019 15:46:33 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190614144633eusmtip2c1e4bdf527f13540f414f141abcab773~oF-DDsfl72665126651eusmtip2b;
 Fri, 14 Jun 2019 14:46:33 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: s3c-fb: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <e771b89b-0e38-a712-b635-8d53cbf95a8e@samsung.com>
Date: Fri, 14 Jun 2019 16:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djP87pem5ljDX716Ftc+fqezWLFl5ns
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcxWWTkpqTWZZapG+XwJWx7VcXa8EytooP
 j04yNzCuYe1i5OSQEDCReD7zHUsXIxeHkMAKRom/y5ayQjhfGCVOne+Gcj4zSvxumsMO07Jk
 4zVmiMRyRomD8y4yQThvgVrW/2cCqWITsJKY2L6KEcQWFrCXOPfxMjOILSKQILFi+gywOLOA
 qsSu5qVgNq+AnUTjhwtgG1iA4icn/mABsUUFIiTuH9vAClEjKHFy5hMWiF5xiVtP5jNB2PIS
 29/OAbtIQuAzm8Smr8vYIE51kWi7cwHKFpZ4dXwL1AsyEqcn97BANKwD+rrjBVT3dkaJ5ZP/
 QXVYSxw+fhFoNQfQCk2J9bv0IcKOEpsmfWYDCUsI8EnceCsIcQSfxKRt05khwrwSHW1CENVq
 EhuWbWCDWdu1cyUzhO0hcfzCbdYJjIqzkLw2C8lrs5C8NgvhhgWMLKsYxVNLi3PTU4uN8lLL
 9YoTc4tL89L1kvNzNzECk8rpf8e/7GDc9SfpEKMAB6MSD++MPuZYIdbEsuLK3EOMEhzMSiK8
 86yBQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhiLpTi8
 qrir9/U7cxRcWZwjJlWimii+8M3dC4vDFpyz582uLDTcJPPI3qcjUtV7x/3qGQYnJZWCCgIy
 TBJfFJ0+nL/Lb2bBteInV5qanre9SX8n6RNb3jh5w2THWvVH55J+O/zedyJr7aLfopONA0p8
 9W1YFd8o/SjI/ZubUBFf5j5hww6HJ0osxRmJhlrMRcWJAADZtJMmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42I5/e/4PV3PzcyxBvuPW1lc+fqezWLFl5ns
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex7VcXa8EytooPj04yNzCuYe1i5OSQEDCRWLLx
 GnMXIxeHkMBSRonFEx4BORxACRmJ4+vLIGqEJf5c62KDqHnNKPFl8UEmkASbgJXExPZVjCC2
 sIC9xLmPl5lBbBGBBImnr+ezgdjMAqoSu5qXgtXwCthJNH64wA5iswDFT078wQJiiwpESJx5
 v4IFokZQ4uTMJywQveoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPALCQts5C0zELSMgtJywJG
 llWMIqmlxbnpucVGesWJucWleel6yfm5mxiBEbHt2M8tOxi73gUfYhTgYFTi4Z3RxxwrxJpY
 VlyZe4hRgoNZSYR3njVQiDclsbIqtSg/vqg0J7X4EKMp0EMTmaVEk/OB0ZpXEm9oamhuYWlo
 bmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHxclSB3XpJjtALbt42StKZha8srRab
 5jY7dHO5Cx86Fv339P+0GULvLZ+ZLPOO3SwSsHTRNnFnYaMJBpb32G9Nk78rudtYKqrmef6t
 Xy4tG1ccDfjCXuPCcPTDRBbRF0H1b1Yyv9H8GO5x0ujtyakr697t8+U85/pud8qaKzP9vuj8
 Eety/BirxFKckWioxVxUnAgA5gf4Y54CAAA=
X-CMS-MailID: 20190614144634eucas1p1b04dcfcc040c3c886d2b33592c501d3b
X-Msg-Generator: CA
X-RootMTR: 20190614144634eucas1p1b04dcfcc040c3c886d2b33592c501d3b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614144634eucas1p1b04dcfcc040c3c886d2b33592c501d3b
References: <CGME20190614144634eucas1p1b04dcfcc040c3c886d2b33592c501d3b@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560523595;
 bh=edGrKerInuyqgGn3ETDAt2iEy82hinQGhNb+6fYCtcU=;
 h=From:Subject:To:Cc:Date:References:From;
 b=TS7kM82q6hQJjJbje5WzdFCxB8dwooDceDWlvxgUuqAdll7hFzqQlGsEH0o90K3ZF
 FSlxvnha6ucuQBMK8j8rsZq8HfXmlD5V09Nkz0Ysld0g0SyegFbfJ4jML4VtoTmld0
 1CVNqt2BRG6+po6wxSUYRNDEKxwnN16F0FvqY34s=
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
Cc: Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIHMzYy1mYiBkcml2ZXIgZm9yIGJldHRlciBjb21w
aWxlCnRlc3RpbmcgY292ZXJhZ2UuCgpDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5j
b20+ClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtp
ZUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgfCAgICAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKSW5kZXg6
IGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGEvZHJpdmVycy92
aWRlby9mYmRldi9LY29uZmlnCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZwpAQCAt
MTg3Nyw3ICsxODc3LDggQEAgY29uZmlnIEZCX1RNSU9fQUNDRUxMCiAKIGNvbmZpZyBGQl9TM0MK
IAl0cmlzdGF0ZSAiU2Ftc3VuZyBTM0MgZnJhbWVidWZmZXIgc3VwcG9ydCIKLQlkZXBlbmRzIG9u
IEZCICYmIChDUFVfUzNDMjQxNiB8fCBBUkNIX1MzQzY0WFgpCisJZGVwZW5kcyBvbiBGQiAmJiBI
QVZFX0NMSyAmJiBIQVNfSU9NRU0KKwlkZXBlbmRzIG9uIChDUFVfUzNDMjQxNiB8fCBBUkNIX1Mz
QzY0WFgpIHx8IENPTVBJTEVfVEVTVAogCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QKIAlzZWxlY3Qg
RkJfQ0ZCX0NPUFlBUkVBCiAJc2VsZWN0IEZCX0NGQl9JTUFHRUJMSVQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
