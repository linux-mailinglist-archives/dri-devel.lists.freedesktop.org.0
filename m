Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B070F46170
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81092899A3;
	Fri, 14 Jun 2019 14:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40083899A3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:47:38 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190614144736euoutp02a1ed89abc83e1a05ddcd36fbd03f68ec~oF-9xjHWN0963909639euoutp02u
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:47:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190614144736euoutp02a1ed89abc83e1a05ddcd36fbd03f68ec~oF-9xjHWN0963909639euoutp02u
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190614144736eucas1p1ebd03828cac1313ee6e22643239db5b8~oF-9aNJpH0266602666eucas1p1j;
 Fri, 14 Jun 2019 14:47:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 52.86.04325.883B30D5; Fri, 14
 Jun 2019 15:47:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f~oF-8OTpdS2290822908eucas1p2k;
 Fri, 14 Jun 2019 14:47:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190614144734eusmtrp1a401b19e4b67fc9ef5457d24e0ff6682~oF-7_0lfM2548325483eusmtrp1E;
 Fri, 14 Jun 2019 14:47:34 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-66-5d03b3889aec
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.8E.04140.683B30D5; Fri, 14
 Jun 2019 15:47:34 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190614144734eusmtip2c8392ac0206644617e2e70c76871a259~oF-7tv3032993929939eusmtip2L;
 Fri, 14 Jun 2019 14:47:34 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/3] video: fbdev: s3c-fb: return -ENOMEM on
 framebuffer_alloc() failure
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <bbf32fbc-b4bc-39fc-e8dd-db9f0cd0d83f@samsung.com>
Date: Fri, 14 Jun 2019 16:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG++9cdhxOjlPxxS7SKKEgrQwaGVIRNPCLHxSjMDfzMJduyua8
 ZKAk6FpDM1PntJyBOVe0ecHLCsMlHktUIrFIRDMpzWbBFBHU8niU/PZ7n/d9+D8P/ClMUkmE
 UWptDqPTKjOlpAjvGlwbPWHswJJPvvGRsvGV36TMvlwnlA2V/yFkH90N5AVc3mudEsqn77MC
 ua/9UDx2TXQ+jclU5zK6qFiFKN3Y3SrM7iPyBx6zeDEawU3IjwL6DLTUWAQmJKIktB1BrbNs
 Z1hG8KmexfjBh6B5cZXYtVQ8txD8ogXB+JBXwC0ktBfBWE04xyR9DirLHMiEKCqIvgauhQxO
 DqYVYK+1II4x+ii4S5q3WUzHgmd2UsgxvqU/Wq3GOA6hr8L0oIvgbwLhXd0czntD4ctco4Dn
 cOj2NmwHBdpHQuNs5063y1Be3yTkOQh+sp07fACGq8w4b3iJYMM4v+PuRtBStUnyVzHwlv1A
 cA0w+hg43VG8fBGWNqeEnAx0AHz2BvIhAuBhVy3Gy2Iwlkr46whwPXORu8+aelsxnuXQMe/E
 H6DD1j3VrHuqWfdUs/7PYEO4A4UyBr1GxeijtUxepF6p0Ru0qsibWZp2tPVRhjfZlR7Ut57q
 QTSFpP5iSzmWLCGUufoCjQcBhUmDxU9itiRxmrLgNqPLStEZMhm9B+2ncGmouHDfzHUJrVLm
 MBkMk83odrcCyi+sGJ0eYWxrE4ljVRG5hTaz/BtbNGUH/2F5/UycOUTnmPAZ7rgX816bl1S3
 nCn9P0ZLD4YUxh1JHWhKYBon4zHN35LWpwsJN5IS2QrrWXVPwK/qpOT8MUaxflc87pPP9H9v
 iO63NSM6o9IX9X6jbbXI+1Vhv/LK0fZitq1UfemeFNenK08dx3R65T+PgPCNJAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4Pd22zcyxBtPW6Vtc+fqezWLFl5ns
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfRsX0le8E+1oojc4+zNDCeZeli5OSQEDCR6F89
 g7WLkYtDSGApo0TDqXfMXYwcQAkZiePryyBqhCX+XOtig6h5zShxovk5K0iCTcBKYmL7KkaQ
 emGBKIkNL7NBwiICCRJPX89nA7GZBVQldjUvZQSxeQXsJA49us0OYrMAxad8n8oMYosKREic
 eb+CBaJGUOLkzCcsEL3qEn/mXWKGsMUlbj2ZzwRhy0tsfzuHeQKjwCwkLbOQtMxC0jILScsC
 RpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgfGw7djPLTsYu94FH2IU4GBU4uGd0cccK8Sa
 WFZcmXuIUYKDWUmEd541UIg3JbGyKrUoP76oNCe1+BCjKdBDE5mlRJPzgbGaVxJvaGpobmFp
 aG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB8eSMKcIh3GHvioXm78zy3cx5+VdY
 2gaN9MJN5w/zpr8QTrouWqFqbO5dXjmn9Nw+9tXablUT1sulONcs6C791fB9k8rrL4eljr5q
 kNI4Pz1Wb0e95vZrjq+DD13VnHh5vlbEGTWzpZ8r3HbvsLvY7rec/8aVjhd+62pYe+ZkiN9V
 e1y85I9brhJLcUaioRZzUXEiABylbRydAgAA
X-CMS-MailID: 20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f
X-Msg-Generator: CA
X-RootMTR: 20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f
References: <CGME20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560523656;
 bh=vg+p7zFanCSl59yGXY1FnQrt4BBpQ9tRwbXks+s9a6E=;
 h=From:Subject:To:Cc:Date:References:From;
 b=UNVz0eKIrTACreITW2rj3dlOXmVE6+9N+ayNEIL0zRXBtVbdUBuzNrCCHzpnIwb4l
 MR+y/J9htxNEAxZBb5Gb+vIesBrGxX0FxXMHQYlvEYLKuiJl+IYO+aa7ia8UUoCGr7
 KXdd8DCT2axob+TE/2EsHP5MT9wcgHIqQxarqHXA=
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

Rml4IGVycm9yIGNvZGUgZnJvbSAtRU5PRU5UIHRvIC1FTk9NRU0uCgpDYzogSmluZ29vIEhhbiA8
amluZ29vaGFuMUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtp
ZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3MzYy1mYi5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jCj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3MzYy1mYi5jCkBAIC0xMTkxLDcgKzExOTEsNyBAQCBzdGF0aWMgaW50IHMzY19mYl9w
cm9iZV93aW4oc3RydWN0IHMzY19mCiAJCQkJICAgcGFsZXR0ZV9zaXplICogc2l6ZW9mKHUzMiks
IHNmYi0+ZGV2KTsKIAlpZiAoIWZiaW5mbykgewogCQlkZXZfZXJyKHNmYi0+ZGV2LCAiZmFpbGVk
IHRvIGFsbG9jYXRlIGZyYW1lYnVmZmVyXG4iKTsKLQkJcmV0dXJuIC1FTk9FTlQ7CisJCXJldHVy
biAtRU5PTUVNOwogCX0KIAogCXdpbmRhdGEgPSBzZmItPnBkYXRhLT53aW5bd2luX25vXTsKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
