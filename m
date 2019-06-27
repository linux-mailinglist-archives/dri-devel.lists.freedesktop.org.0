Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203A58434
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA62C6E421;
	Thu, 27 Jun 2019 14:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C296E421
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:07:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190627140706euoutp02ae409e75640b812662e247edd9d8713b~sE1TlAbIF2244322443euoutp021
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:07:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190627140706euoutp02ae409e75640b812662e247edd9d8713b~sE1TlAbIF2244322443euoutp021
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190627140705eucas1p155a7549b3a5ecad192c62eea3edb1d64~sE1TF4dfO0763807638eucas1p1j;
 Thu, 27 Jun 2019 14:07:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 66.76.04377.98DC41D5; Thu, 27
 Jun 2019 15:07:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba~sE1SboCPb0767107671eucas1p1Q;
 Thu, 27 Jun 2019 14:07:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190627140704eusmtrp29d70373c3a726d2bd680aa30fd6ab995~sE1SNb7zA0769707697eusmtrp2G;
 Thu, 27 Jun 2019 14:07:04 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-e2-5d14cd8924f7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 67.A3.04146.88DC41D5; Thu, 27
 Jun 2019 15:07:04 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190627140704eusmtip2fa88c590dce5dd666721e8beed9eb74a~sE1SAIW5X1698616986eusmtip27;
 Thu, 27 Jun 2019 14:07:04 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/3] video: fbdev: mmp: remove duplicated MMP_DISP dependency
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <eb28587c-4f8f-f044-1b8b-317a8d7967aa@samsung.com>
Date: Thu, 27 Jun 2019 16:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduzned3OsyKxBu1/RSyufH3PZnGi7wOr
 xeVdc9gcmD3udx9n8vi8SS6AKYrLJiU1J7MstUjfLoEr48SeY+wF27kqnq54wNrA+JCji5GT
 Q0LARGLpg7dMXYxcHEICKxglPu95COV8YZS4OH8fO4TzmVHiyNfvrDAtNza/Z4FILGeUOPHv
 ExuE85ZR4ty6U2BVbAJWEhPbVzGC2MIC/hI9n86wg9giAgkSK6bPAIvzCthJtM15ywZiswio
 Ssxfv4sFxBYViJC4f2wDK0SNoMTJmU/A4swC4hK3nsxngrDlJba/ncMMslhC4DabxIvbIAs4
 gBwXiakv5CAuFZZ4dXwLO4QtI/F/53wmiPp1jBJ/O15ANW9nlFg++R8bRJW1xOHjF1lBBjEL
 aEqs36UPEXaUaLh8jwliPp/EjbeCEDfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyQ9ge
 EtPPfwB7XUggVmLyql3sExgVZiH5chaSL2ch+XIWwj0LGFlWMYqnlhbnpqcWG+WllusVJ+YW
 l+al6yXn525iBKaP0/+Of9nBuOtP0iFGAQ5GJR5ehZ0isUKsiWXFlbmHGCU4mJVEePPDgEK8
 KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGanphakFsFkmTg4pRoYcytu7M80OOf6
 peMYR6GZqlJhhs8Bn0N3SyOleR9oXI/YX3F9wy33y09/fLu2T+Vp94H7ba6xcQUbOj7oVF8p
 txE6e+Ct93fTRsZlxy+mmteJRHx7k1f8+Uzp9H9sEY6uUeo+SnO2qXG9LDyq4nLviTXP4bjK
 FY7FcwWz4z0ltnEv7yqNnfdZiaU4I9FQi7moOBEA7XZ87xsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsVy+t/xe7odZ0ViDfa3qFlc+fqezeJE3wdW
 i8u75rA5MHvc7z7O5PF5k1wAU5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGp
 kr6dTUpqTmZZapG+XYJexok9x9gLtnNVPF3xgLWB8SFHFyMnh4SAicSNze9ZQGwhgaWMEsf+
 S3UxcgDFZSSOry+DKBGW+HOti62LkQuo5DWjxPaP55lBEmwCVhIT21cxgtjCAr4Sk5vus4PY
 IgIJEk9fz2cDsXkF7CTa5rwFs1kEVCXmr98FtktUIELizPsVLBA1ghInZz4Bs5kF1CX+zLvE
 DGGLS9x6Mp8JwpaX2P52DvMERv5ZSFpmIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz
 0vWS83M3MQJDfNuxn5t3MF7aGHyIUYCDUYmHV2GnSKwQa2JZcWXuIUYJDmYlEd78MKAQb0pi
 ZVVqUX58UWlOavEhRlOghyYyS4km5wPjL68k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklq
 dmpqQWoRTB8TB6dUA6PPRSbHS65xP6qfZmr+k9VYePLB3MYXvku5BU9x/TDpPZWju8rnz+/t
 J8VN/kV4vCtiXrr7jWT/j297M/J7/jQ62hslXy4/q8Gp0xwWcs6eIU//8rGlzZWzGG9HhOra
 fX65kdN7cf+v0/L8R8RnGLbpmLA1MJ0T4OthNDg9bdHCKZe/iR5weKDEUpyRaKjFXFScCAAF
 JL5nhwIAAA==
X-CMS-MailID: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
X-Msg-Generator: CA
X-RootMTR: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
References: <CGME20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561644426;
 bh=BoDR/6hDAZqWyHMh5AaexlPeGMwWtQ0BBzLpqomvxMs=;
 h=From:Subject:To:Date:References:From;
 b=kCN5M8+lWqixxYpRA5Mc3uJkoEFbf/QmVtESNgWpri0Zg5YyH7IYEsBAUSoQoFb57
 cGw7emnBTxMWgMQ6ysHOgIUUCX4k1fVXHiM7YMXbdL+tiurVumH3WjZ7gJVeA0d/kC
 y8YZ0q8aaxUWQrMmV2FlAyQmAluiQfcC1KYwj7cM=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkZXBlbmRlbmN5IGlzIGFscmVhZHkgcHJlc2VudCBpbiBoaWdoZXIgbGV2ZWwgS2NvbmZp
ZyBmaWxlCihkcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9LY29uZmlnKS4KClNpZ25lZC1vZmYtYnk6
IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0t
CiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9mYi9LY29uZmlnIHwgICAgNCAtLS0tCiBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L21tcC9ody9LY29uZmlnIHwgICAgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDggZGVsZXRpb25zKC0pCgpJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9mYi9LY29u
ZmlnCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9tbXAvZmIvS2NvbmZpZwor
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9mYi9LY29uZmlnCkBAIC0xLDYgKzEsNCBAQAog
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Ci1pZiBNTVBfRElTUAotCiBj
b25maWcgTU1QX0ZCCiAJdHJpc3RhdGUgImZiIGRyaXZlciBmb3IgTWFydmVsbCBNTVAgRGlzcGxh
eSBTdWJzeXN0ZW0iCiAJZGVwZW5kcyBvbiBGQgpAQCAtMTAsNSArOCwzIEBAIGNvbmZpZyBNTVBf
RkIKIAlkZWZhdWx0IHkKIAloZWxwCiAJCWZiIGRyaXZlciBmb3IgTWFydmVsbCBNTVAgRGlzcGxh
eSBTdWJzeXN0ZW0KLQotZW5kaWYKSW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcv
S2NvbmZpZwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25m
aWcKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvS2NvbmZpZwpAQCAtMSw2ICsxLDQg
QEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQotaWYgTU1QX0RJU1AK
LQogY29uZmlnIE1NUF9ESVNQX0NPTlRST0xMRVIKIAlib29sICJtbXAgZGlzcGxheSBjb250cm9s
bGVyIGh3IHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBDUFVfUFhBOTEwIHx8IENQVV9NTVAyCkBAIC0x
Niw1ICsxNCwzIEBAIGNvbmZpZyBNTVBfRElTUF9TUEkKIAloZWxwCiAJCU1hcnZlbGwgTU1QIGRp
c3BsYXkgaHcgY29udHJvbGxlciBzcGkgcG9ydCBzdXBwb3J0CiAJCXdpbGwgcmVnaXN0ZXIgYXMg
YSBzcGkgbWFzdGVyIGZvciBwYW5lbCB1c2FnZQotCi1lbmRpZgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
