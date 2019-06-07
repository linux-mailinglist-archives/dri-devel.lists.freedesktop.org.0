Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD8389B8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C14898F1;
	Fri,  7 Jun 2019 12:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8C897F0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:05:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607120531euoutp02b8633a57d517423aaf18bb35943773f5~l6RcGRWE52114021140euoutp02S
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:05:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607120531euoutp02b8633a57d517423aaf18bb35943773f5~l6RcGRWE52114021140euoutp02S
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607120529eucas1p18edacacf6f19b60087a2f81430102464~l6RbAkG0l1333013330eucas1p1D;
 Fri,  7 Jun 2019 12:05:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1C.3F.04325.9035AFC5; Fri,  7
 Jun 2019 13:05:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607120528eucas1p182869712159a1c29305842fa596c5712~l6RaI-h5M1333013330eucas1p1C;
 Fri,  7 Jun 2019 12:05:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607120528eusmtrp148aefe48cfbb0f4362fc9c7897a5f755~l6RZ5HnQ22024420244eusmtrp1g;
 Fri,  7 Jun 2019 12:05:28 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-3c-5cfa53090139
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AA.95.04146.8035AFC5; Fri,  7
 Jun 2019 13:05:28 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607120527eusmtip2eee646333b640feea00b97666f02f5a6~l6RY5VO9u0977709777eusmtip2G;
 Fri,  7 Jun 2019 12:05:27 +0000 (GMT)
Subject: Re: [PATCH 3/8] drivers: (video|gpu): fix warning same module names
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Anders Roxell
 <anders.roxell@linaro.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4c9681c0-5ead-3e4c-584b-c4e98cd94480@samsung.com>
Date: Fri, 7 Jun 2019 14:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607075728.GE21222@phenom.ffwll.local>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SeUiTYRjv/a59Sluv6/DBImmVYofZQb1dUhT0RScEXUq18kPNKzZnF9SK
 qGmXZmUOyZXhRZhOcypZsUwNQcsiSlpzZGDZNFiaVsvcvkn+9+N3PL/ngYenlSVcEB+fnCpq
 ktWJKs6fqW4cap3vt+NXdITVFEw6ylpZcrn1BUU6rv+mSJvNSpMbji6O3HHYaJLXdo4hb/r7
 OPKrt0FG7vbdYom9/zkiA28MFDF/esuS5ivfWfK6Lo8jl8ofsuTb+TOIFJr/UKTRNIXYPjYz
 xG0xM6S7KpBUll2QkQJnDb0GhIKfH2mhquQ9Jdw2NjNC/YCJEWqNNplgLk3nhA9vH3GCZaCT
 FewXmyih8t5pobbGRQlX3RHClapSJLjM07cr9vqvihET49NEzYLIA/5xraaNR0oCjvW2VTN6
 ZFJkID8e8BIoGuxnM5A/r8TFCJ4MDyGPoMQ/EGTmz5YEFwK7o5gdTWRaHIwkFCGwVbb54k4E
 72qvMx7XRLwZGnr0lAdPwjuhuvKqdyyHV0DWhVLkCdA4i4G6LgvtEeQ4Eoxn7V7M4FngKnR7
 B03Gu8HeWM5KngB4kdvl5f0wgZ99PV4/jQOhoyufknAwWJx5tKcAcDcPH3odvr3Xw3BWDifh
 ifC1qUom4WnQkn2JkQJlCNyGbl/agqAo+68vsRKeNb0amcSPVITBg7oFEr0WCr47aQ8NWAHv
 nAHSEgq4Vp3jo+VgOK+U3CFQXljOjdZm1JbQmUhlHHOaccw5xjHnGP/3mhBTigJFnTYpVtQu
 ThaPhmvVSVpdcmz4oZQkMxp54Ja/Tf016PGfg1aEeaQaLxdkQ9FKVp2mPZ5kRcDTqknytJeD
 0Up5jPr4CVGTsl+jSxS1VjSVZ1SB8pPjOqOUOFadKiaI4hFRM6pSvF+QHm2qWJ2QcD93fqRL
 PvN38XD9Z5V+3Mujy/d9CV7PtJD2FKFuhrxzl6Lg8NKBvc9vdqhDsyMbp849eNu2LH966L4n
 ywbXLTz1MD4i6NuiPfE1Vl2fbv+anvT2dqwXuQ1PwwxbLlZETZiRWm+dmdugjHMbYMm1kHOn
 07cpovbMM59I2RqkYrRx6oVzaI1W/Q962XULvAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe89tZ9HquGa+SjeWZAgtj1P3GiZ9KU5QFHQh1LChp1k5Fzvb
 yL5kElqrvJBdHKtWlugKtWneMrSVty4aFqMsXZahYbbC0jKtNlfgtz/P//d74IGHxqV3yRB6
 f4aB12eo0+XUXOLx7/b+1fT2yaSIypow1FvRRaIzXZ0Y6i36haHuPieOzg0MUujqQB+OrN3H
 CfTiu4dCk58fitA1z0USub+3AjT+4gSGHO9dJOrI+0Ki541WCp2uukOiTznHACp1TGGozbYI
 9fV3EGi6zkGg4ZogVF2RK0Ilo/X4esiVTPTjXE35K4y7bOkguHvjNoJrsPSJOIf9JMW9cTVR
 XN34W5Jzn2rHuOrrR7mG+jGMy5+O4PJq7IAbcyzdNj9BEafXGQ388jSdYFgnT2RRpIKNRYrI
 qFgFq1TtWRsZLV8TH5fKp+838fo18XsVaV22TYfKAw5/7q4lsoBtvhmIachEwYK6AcIM5tJS
 5gaAltEKkRnQ3mIxbK80+ZmFcMplpvzMCIAu9wWRr1jIbIYPR7IwX5Yxu2BLoY30Q80AFnl8
 W8U0xayFhbl24CtwppCAY6UlM7aEiYeWbDfuywQT6p1PzwiBzG74xFNG+JkA2Fk8OJPFDIIT
 npEZHmfC4NTlnn85CPYOXsH8eRmsG7XiBUBqmaVbZimWWYpllmIDhB3IeKOg1WgFViGotYIx
 Q6NI0WkdwPs4tW0/q+tBz+3tTsDQQD5Psn7OzyQpqTYJmVongDQul0lMz34kSSWp6swjvF6X
 rDem84ITRHuPK8RDAlN03jfMMCSz0awKxbIqpUoZg+RBkhPM/SQpo1Eb+IM8f4jX//cwWhyS
 BTTfZItb7OPWd3EfNlxcpVFlL3m5szbm3aPpW1Xmpiji8MfzZa1VxVTwFLPt0XnJguzM3BXF
 By7FHOx1Goc6Kwu+NVo3PsC7ZFGBw2ef83k7kp1/tjS1D6FhZeJQcM5XQ9hqa4K1KBoFlrYe
 2LoyZV/4x6f5v17nN7tvfmHbTKGblXJCSFOz4bheUP8Fi3t/J04DAAA=
X-CMS-MailID: 20190607120528eucas1p182869712159a1c29305842fa596c5712
X-Msg-Generator: CA
X-RootMTR: 20190607075735epcas3p17dfbe45a2079b12f4e2268ee1b6086fe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607075735epcas3p17dfbe45a2079b12f4e2268ee1b6086fe
References: <20190606094712.23715-1-anders.roxell@linaro.org>
 <CGME20190607075735epcas3p17dfbe45a2079b12f4e2268ee1b6086fe@epcas3p1.samsung.com>
 <20190607075728.GE21222@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559909131;
 bh=COHVb0UeeGmSgkAXwTwyqkaza60Y5M9a3mjtKEoAQBs=;
 h=Subject:To:From:Cc:Date:In-Reply-To:References:From;
 b=NHSK5GZuBqssg0L8cRZDRo3h+TWLUv/+H2t9HEmFCXI8/D2lV4uXUXKLGzayHJ/Dq
 c/FsKsN7rlu2pAMJ3z233w/ubv1qrLFu4J+cleFw+gMByJJgvIewOP4OV0jCFcwbvS
 afVwvERuwarYacS8vgzOOxp9dn5DryTrc/t5z8Zs=
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org, marex@denx.de,
 f.fainelli@gmail.com, vivien.didelot@gmail.com, linux-media@vger.kernel.org,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 lgirdwood@gmail.com, shawnguo@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNy8xOSA5OjU3IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFRodSwgSnVuIDA2
LCAyMDE5IGF0IDExOjQ3OjEyQU0gKzAyMDAsIEFuZGVycyBSb3hlbGwgd3JvdGU6Cj4+IFdoZW4g
YnVpbGRpbmcgd2l0aCBDT05GSUdfRFJNX01YU0ZCIGFuZCBDT05GSUdfRkJfTVhTIGVuYWJsZWQg
YXMKPj4gbG9hZGFibGUgbW9kdWxlcywgd2Ugc2VlIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPj4K
Pj4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4+ICAgZHJpdmVycy92aWRlby9m
YmRldi9teHNmYi5rbwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYi5rbwo+Pgo+PiBS
ZXdvcmsgc28gdGhlIG5hbWVzIG1hdGNoZXMgdGhlIGNvbmZpZyBmcmFnbWVudC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgo+IAo+
IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAo+
IEknbSBhc3N1bWluZyBCYXJ0IHdpbGwgcGljayB0aGlzIG9uZSB1cCBmb3IgZmJkZXYuCgpUaGUg
RFJNIG14c2ZiIGhhcyBiZWVuIGEgZGVmYXVsdCBmb3IgYWxtb3N0IGEgeWVhciAoc2luY2UgSnVs
eQoyMDE4KSBhbmQgSSd2ZSBqdXN0IGFwcGxpZWQgIltQQVRDSF0gdmlkZW86IGZiZGV2OiBteHNm
YjogUmVtb3ZlCmRyaXZlciIgKGh0dHBzOi8vbWFyYy5pbmZvLz9sPWRyaS1kZXZlbCZtPTE1NTgz
NTc1ODExNTY4NiZ3PTIpCnNvIGl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBpcyBub3QgbmVlZGVk
IGFueSBsb25nZXIgKHNvcnJ5ISkuCgo+IC1EYW5pZWwKPiAKPj4gLS0tCj4+ICBkcml2ZXJzL2dw
dS9kcm0vbXhzZmIvTWFrZWZpbGUgfCA0ICsrLS0KPj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvTWFr
ZWZpbGUgICB8IDMgKystCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9NYWtlZmlsZQo+PiBpbmRleCBmZjZlMzU4MDg4
ZmEuLjVkNDlkNzU0OGU2NiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL01h
a2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9NYWtlZmlsZQo+PiBAQCAtMSwz
ICsxLDMgQEAKPj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiAt
bXhzZmIteSA6PSBteHNmYl9kcnYubyBteHNmYl9jcnRjLm8gbXhzZmJfb3V0Lm8KPj4gLW9iai0k
KENPTkZJR19EUk1fTVhTRkIpCSs9IG14c2ZiLm8KPj4gK2RybS1teHNmYi15IDo9IG14c2ZiX2Ry
di5vIG14c2ZiX2NydGMubyBteHNmYl9vdXQubwo+PiArb2JqLSQoQ09ORklHX0RSTV9NWFNGQikJ
Kz0gZHJtLW14c2ZiLm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZp
bGUgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlCj4+IGluZGV4IDY1NWYyNTM3Y2FjMS4u
N2VlOTY3NTI1YWYyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxl
Cj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZpbGUKPj4gQEAgLTEzMSw3ICsxMzEs
OCBAQCBvYmotJChDT05GSUdfRkJfVkdBMTYpICAgICAgICAgICAgKz0gdmdhMTZmYi5vCj4+ICBv
YmotJChDT05GSUdfRkJfT0YpICAgICAgICAgICAgICAgKz0gb2ZmYi5vCj4+ICBvYmotJChDT05G
SUdfRkJfTVgzKQkJICArPSBteDNmYi5vCj4+ICBvYmotJChDT05GSUdfRkJfREE4WFgpCQkgICs9
IGRhOHh4LWZiLm8KPj4gLW9iai0kKENPTkZJR19GQl9NWFMpCQkgICs9IG14c2ZiLm8KPj4gK29i
ai0kKENPTkZJR19GQl9NWFMpCQkgICs9IGZiLW14cy5vCj4+ICtmYi1teHMtb2JqcwkJCSAgOj0g
bXhzZmIubwo+PiAgb2JqLSQoQ09ORklHX0ZCX1NTRDEzMDcpCSAgKz0gc3NkMTMwN2ZiLm8KPj4g
IG9iai0kKENPTkZJR19GQl9TSU1QTEUpICAgICAgICAgICArPSBzaW1wbGVmYi5vCj4+ICAKPj4g
LS0gCj4+IDIuMjAuMQpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oK
U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
