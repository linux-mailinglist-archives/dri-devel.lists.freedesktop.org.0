Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03721B30C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 12:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1126EBC9;
	Fri, 10 Jul 2020 10:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F26EBC9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:17:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710101701euoutp02fa1026c9fee4c545ab76c15a010b7248~gXLnKqek31196411964euoutp02I
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:17:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200710101701euoutp02fa1026c9fee4c545ab76c15a010b7248~gXLnKqek31196411964euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594376221;
 bh=zuImCTUG8KB0maKe8qkWKgOT1mxGOgJZkICKt5oGbeI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=plnuMrsuGMEkycrAG8jAYl+NYTqyivgLb9gVuse4XXicaMM9PDEyMfw5nB5QoSfJm
 P1aQT6TW0KjabHQlpjLuvOfJMNx0eAQjIwyi7eBAgZXTdBaZyXsq6PVX9p622yLKya
 6tgQ+p2keFGMAmWTZwwfp05CEFWjmdO4ZfAR6TnY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710101701eucas1p2b25fdf4c5eb5debe392ff1ff0530324e~gXLnD4l0R0954409544eucas1p2H;
 Fri, 10 Jul 2020 10:17:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B5.6D.06318.C10480F5; Fri, 10
 Jul 2020 11:17:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200710101700eucas1p27a9b4f0c67d6b5af361ad3085c830d39~gXLmrr0ra0940409404eucas1p23;
 Fri, 10 Jul 2020 10:17:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200710101700eusmtrp20bdf7cf974e4798332791a5c06de0237~gXLmq972P2032920329eusmtrp2m;
 Fri, 10 Jul 2020 10:17:00 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-fc-5f08401c4f46
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F2.C0.06314.C10480F5; Fri, 10
 Jul 2020 11:17:00 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200710101700eusmtip20235ca730843f772b9729ddb9037521d~gXLmM2BMQ2026820268eusmtip2O;
 Fri, 10 Jul 2020 10:17:00 +0000 (GMT)
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
Date: Fri, 10 Jul 2020 12:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUYRjG+XZmx3Fx5XM1fHGlYjEhI80UGUzESmrznyL6I+3QNSePPHe8
 KzDMI8uwJMxVWNsgS0HNPNI8QMuzNPNITUjzlszFEyMtZ0fJ/57vfd4f3/PASxOyCrEVHRwe
 zarDVaEKSkJWtax3Hbb2oH2PNPa4MuvLC4jpW1mgmPyho0zq2DBi2h7qxUxvbT7FZDwbNGLW
 KrJFHrSyvOgepfx+v1WkbNb3kcqFhn5KWVrRTyqXyveeo3wkbgFsaHAsq3Zw95METXWsiiPL
 TOP1uTlUEnpgkoGMacDOMPttgMxAElqGXyJY0BSTvCHDywjG33sLxhKC1cWP1A7RkdlBCEYh
 glJtOxIe8whKJuoNuDn2hNXiJBGvLbALzC1lGvFLBP6BoLhx3LBEYVd4lFa0RdO0FLtDn/YC
 PybxAShImSN4vQdfhMXRZjGvpdgM2nMnDKgxdoPxJ3WI1wS2hOEJrUjQ+yC5Ms+QDnCLETTO
 lm3H9oSprDEjQZvDXGvFtraGvzU8zAMlCDbSZ7bpagSF2Zvb9DEY6fpN8UkJfBBKax2E8XH4
 UJ1sKADYFAbnzYQQpvC4KocQxlJIT5UJ27ZQ9mInjjVk1LwispBCs6uaZlcdza46mv//FiCy
 CFmyMVxYIMs5hbNx9pwqjIsJD7S/FhFWjrZuqXOzdeUtavjj34QwjRQmUr8NylcmVsVyCWFN
 CGhCYSE98anzqkwaoEpIZNURvuqYUJZrQnKaVFhKnXSzV2Q4UBXN3mDZSFa944poY6sk9LUu
 1Gf1zc8v85cHCup69mfapMTrrp91jopZ0TGFcSaH9FG3ck9falv08u093xCy0p3f6lhf7yS/
 wznOhLSfqdv4dXugyNiuPOBUopP3kLQwOE3u9U5fEhdyT+v//GSSfHptWj5qox3pUz59nSUp
 q/zsZ4vEkzqXie6beXfdHNcnFSQXpHK0I9Sc6h+lhHiIRwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xe7oyDhzxBru/yFr8/PKe0eLK1/ds
 FnNuGlm0PbzFaHGi7wOrxeVdc9gsuhbeYLf4vmUykwOHx6ZVnWwe97uPM3kc/nCFxeP9vqts
 Huu3XGXx+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS/j2alvrAUb+Co+zJzO1sDYw9PFyMkhIWAicar3FHMXIxeHkMBSRokZK5sYuxg5
 gBIyEsfXl0HUCEv8udbFBlHzmlHi3KpLjCAJYQEXiW+rG5hAbBEBM4lXn3vZQYqYBR4xSnT9
 XcYE0fEGaGrbYRaQKjYBK4mJ7avANvAK2ElcmR8CEmYRUJVY0PqKGcQWFYiQOLxjFtgCXgFB
 iZMzn4C1cgrYSDyeugcsziygLvFn3iVmCFtc4taT+UwQtrxE89bZzBMYhWYhaZ+FpGUWkpZZ
 SFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzDbcd+bt7BeGlj8CFGAQ5GJR7eHf/Z
 4oVYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAFJFXEm9o
 amhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHRb92WuV5/fNYZH7OQEeEs
 1LlrHL9SQy3SLE5/7zqVJ3U7H7R+CBFw2V8k+vr8M7WoDfpMocp+seJ/ulZHKGX1RXi+6mxK
 zPFR5rM/eOm+c0dOIEc8s5DCc4N9Vx5tjO+d5SjyKl4j/cnF36cMtp2Kazo3hV89ec6JO1/9
 r2/4L9h6P5nBuU+JpTgj0VCLuag4EQDuYox+2QIAAA==
X-CMS-MailID: 20200710101700eucas1p27a9b4f0c67d6b5af361ad3085c830d39
X-Msg-Generator: CA
X-RootMTR: 20200709091750eucas1p18003b0c8127600369485c62c1e587c22
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200709091750eucas1p18003b0c8127600369485c62c1e587c22
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClsgYWRkZWQgRUZJIE1haW50YWluZXIgJiBNTCB0byBDYzogXQoKSGksCgpPbiA3LzkvMjAgMTE6
MTcgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMjguMDYuMjAgMTA6NTAsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+IFBpbmc/Cj4+Cj4+IE9uIDEwLjA2LjIwIDE2OjEwLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gZWZpZmJfcHJvYmUoKSB3aWxsIGlzc3VlIGFuIGVycm9yIG1lc3NhZ2Ug
aW4gY2FzZSB0aGUga2VybmVsIGlzIGJvb3RlZAo+Pj4gYXMgWGVuIGRvbTAgZnJvbSBVRUZJIGFz
IEVGSV9NRU1NQVAgd29uJ3QgYmUgc2V0IGluIHRoaXMgY2FzZS4gQXZvaWQKPj4+IHRoYXQgbWVz
c2FnZSBieSBjYWxsaW5nIGVmaV9tZW1fZGVzY19sb29rdXAoKSBvbmx5IGlmIEVGSV9QQVJBVklS
VAo+Pj4gaXNuJ3Qgc2V0Lgo+Pj4KPj4+IEZpeGVzOiAzOGFjMDI4N2I3ZjQgKCJmYmRldi9lZmlm
YjogSG9ub3VyIFVFRkkgbWVtb3J5IG1hcCBhdHRyaWJ1dGVzIHdoZW4gbWFwcGluZyB0aGUgRkIi
KQo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4g
LS0tCj4+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMgfCAyICstCj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9l
ZmlmYi5jCj4+PiBpbmRleCA2NTQ5MWFlNzQ4MDguLmY1ZWNjZDEzNzNlOSAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYwo+Pj4gKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9lZmlmYi5jCj4+PiBAQCAtNDUzLDcgKzQ1Myw3IEBAIHN0YXRpYyBpbnQgZWZpZmJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+Pj4gwqDCoMKgwqDCoCBpbmZvLT5hcGVy
dHVyZXMtPnJhbmdlc1swXS5iYXNlID0gZWZpZmJfZml4LnNtZW1fc3RhcnQ7Cj4+PiDCoMKgwqDC
oMKgIGluZm8tPmFwZXJ0dXJlcy0+cmFuZ2VzWzBdLnNpemUgPSBzaXplX3JlbWFwOwo+Pj4gLcKg
wqDCoCBpZiAoZWZpX2VuYWJsZWQoRUZJX0JPT1QpICYmCj4+PiArwqDCoMKgIGlmIChlZmlfZW5h
YmxlZChFRklfQk9PVCkgJiYgIWVmaV9lbmFibGVkKEVGSV9QQVJBVklSVCkgJiYKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAhZWZpX21lbV9kZXNjX2xvb2t1cChlZmlmYl9maXguc21lbV9zdGFydCwg
Jm1kKSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgoZWZpZmJfZml4LnNtZW1fc3RhcnQg
KyBlZmlmYl9maXguc21lbV9sZW4pID4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICht
ZC5waHlzX2FkZHIgKyAobWQubnVtX3BhZ2VzIDw8IEVGSV9QQUdFX1NISUZUKSkpIHsKPj4+Cj4+
Cj4gCj4gSW4gY2FzZSBJIHNlZSBubyByZWFjdGlvbiBmcm9tIHRoZSBtYWludGFpbmVyIGZvciBh
bm90aGVyIHdlZWsgSSdsbCB0YWtlCj4gdGhpcyBwYXRjaCB0aHJvdWdoIHRoZSBYZW4gdHJlZS4K
CkZyb20gZmJkZXYgUE9WIHRoaXMgY2hhbmdlIGxvb2tzIGZpbmUgdG8gbWUgYW5kIEknbSBPSyB3
aXRoIG1lcmdpbmcgaXQKdGhyb3VnaCBYZW4gb3IgRUZJIHRyZWU6CgpBY2tlZC1ieTogQmFydGxv
bWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKQmVzdCByZWdh
cmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQ
b2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
