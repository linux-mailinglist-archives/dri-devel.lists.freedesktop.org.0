Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E8F1ADF01
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AC16EC13;
	Fri, 17 Apr 2020 14:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7CC6EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140807euoutp0101377dc8b764cd4a7243ccaa54979b38~GoJaGAgMY1980919809euoutp01h
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200417140807euoutp0101377dc8b764cd4a7243ccaa54979b38~GoJaGAgMY1980919809euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132487;
 bh=rQFb332w/W0vE9IwL+r/49dQjXVVZeqdXoTwrmYqvUk=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=LG9mimc4wly/iYgEWIIGXjAdADAsAOJzgEMQsJziFym6ruUo0PHGXfgkXDVyo20Ac
 vKx6vktGA5aWZ/hmVSfqZkXsIxI4MCy9fWr+szXhR5JivlJQWZmWcOpgFuxwqwLLl1
 U+D3Xo5DVVXfZm/USDSeLCcDPjKB5+3vaXDMdwm0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140806eucas1p197d0cc3dd5c32cf78e85d3e8abec3bd1~GoJZ_-6o11490114901eucas1p1H;
 Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 52.FF.60679.648B99E5; Fri, 17
 Apr 2020 15:08:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140806eucas1p2f8b9146788f9d6713d758833a8e1ba88~GoJZrwpPA1570815708eucas1p2N;
 Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140806eusmtrp113e0403ba063812da1635defd08dadb3~GoJZrKlIl2264522645eusmtrp1G;
 Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-f7-5e99b846d592
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.C2.08375.648B99E5; Fri, 17
 Apr 2020 15:08:06 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140806eusmtip22d2e41fe87a4aa1ac1d362d1fdcb3be0~GoJZPHMNo2022020220eusmtip2f;
 Fri, 17 Apr 2020 14:08:06 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH -next] omapfb/dss: remove unused varible
 'venc_config_pal_bdghi'
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <ef8cf200-4bcd-1a53-abcc-65feba6c11fa@samsung.com>
Date: Fri, 17 Apr 2020 16:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415132350.33088-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djPc7puO2bGGfxdbW6x8sQ/FosrX9+z
 WZzo+8BqcXnXHDaL2Uv6WSzufH3O4sDm0XLkLavH/e7jTB4f3zxh9/i8SS6AJYrLJiU1J7Ms
 tUjfLoEr48vVPewFe0QqDk/YzdTA2CjQxcjJISFgIvGyZQYLiC0ksIJR4tkOyy5GLiD7C6NE
 77tX7BDOZ0aJP49WssN0zPi8gA0isZxRYtfkdUwQzltGiRtTfjOCVLEJWElMbF8FZgsLhEks
 W/GeDcQWEVCTaDm1hRmkgVlgMqPE5IVfmUASvAJ2Et++tIDZLAKqEld3/wM7SlQgQuLTg8Os
 EDWCEidnPgGLcwpYSxxbcB2snllAXOLWk/lQtrxE89bZYAskBJaxSzStPsEGcbeLRPPiVlYI
 W1ji1fEtUP/ISJye3MMC0bCOUeJvxwuo7u2MEssn/4Pqtpa4c+4XkM0BtEJTYv0ufRBTQsBR
 ove7GYTJJ3HjrSDEDXwSk7ZNZ4YI80p0tAlBzFCT2LBsAxvM1q6dK5knMCrNQvLZLCTfzELy
 zSyEtQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJpzT/45/2cG460/SIUYBDkYl
 Hl6DnplxQqyJZcWVuYcYJTiYlUR4D7oBhXhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQ
 nliSmp2aWpBaBJNl4uCUamAU+H/Ib/2daUWRFzOCd94tWCcSbdaTvczD/cG7B7cfvpPc5N/a
 Z2q57Jtg29tW8chIXuHrO/w4k87wX4qU3aU/+YdctnFx/JOX6Xz95kd+TpN0+fn91dN/O7Xv
 z11gwxszO9ZE9dhP9YurPpaszVpcW8z5stViS6LbX4lNbzw9c+eveLD24dRPSizFGYmGWsxF
 xYkAGKwDtTQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xe7puO2bGGZxcq2Cx8sQ/FosrX9+z
 WZzo+8BqcXnXHDaL2Uv6WSzufH3O4sDm0XLkLavH/e7jTB4f3zxh9/i8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48vVPewFe0QqDk/Y
 zdTA2CjQxcjJISFgIjHj8wK2LkYuDiGBpYwSq2YuZexi5ABKyEgcX18GUSMs8edaF1TNa0aJ
 fa/usYEk2ASsJCa2r2IEsYUFwiSWrXgPFhcRUJNoObWFGaSBWWAyo0TH/6dQ3X2MEr8ez2AF
 qeIVsJP49qWFCcRmEVCVuLr7HwuILSoQIXF4xyxGiBpBiZMzn4DFOQWsJY4tuA5WzyygLvFn
 3iVmCFtc4taT+VBxeYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtc
 mpeul5yfu4kRGGPbjv3cvIPx0sbgQ4wCHIxKPLwGPTPjhFgTy4orcw8xSnAwK4nwHnQDCvGm
 JFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MP7zSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeW
 pGanphakFsH0MXFwSjUw+nzhZncO0z8lm95o4hb9Os6z5fq7e+emT17xRJ09kts3Y+lHDaXQ
 9k+cTr9FjRRm/+O73bC+5FhJ/LSlgQe0TDg66k68jtEMWKJk9jP3HusGZtnN4s9fvAzNkT6o
 aMiced9x4nWjsBNpBkLWGR36kTw1jQv1D0ZENNhNe3Vp4nT7Zz1vDvAqsRRnJBpqMRcVJwIA
 qsVMCscCAAA=
X-CMS-MailID: 20200417140806eucas1p2f8b9146788f9d6713d758833a8e1ba88
X-Msg-Generator: CA
X-RootMTR: 20200415132418eucas1p2249e350241cee81ce200565455c31f98
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200415132418eucas1p2249e350241cee81ce200565455c31f98
References: <CGME20200415132418eucas1p2249e350241cee81ce200565455c31f98@eucas1p2.samsung.com>
 <20200415132350.33088-1-yuehaibing@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org, allison@lohutok.net,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDQvMTUvMjAgMzoyMyBQTSwgWXVlSGFpYmluZyB3cm90ZToKPiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L29tYXAyL29tYXBmYi9kc3MvdmVuYy5jOjIxMjozMzoKPiAgd2FybmluZzog4oCYdmVuY19j
b25maWdfcGFsX2JkZ2hp4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12
YXJpYWJsZT1dCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmVuY19jb25maWcgdmVuY19jb25maWdf
cGFsX2JkZ2hpID0gewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+
CgpQYXRjaCBxdWV1ZWQgZm9yIHY1LjggKHcvIHR5cG8gaW4gdGhlIHBhdGNoIHN1bW1hcnkgZml4
ZWQpLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oK
U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRl
di9vbWFwMi9vbWFwZmIvZHNzL3ZlbmMuYyB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy92ZW5jLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L29tYXAyL29tYXBmYi9kc3MvdmVuYy5jCj4gaW5kZXggZjgxZTJhNDYzNjZkLi5kNTQwNGQ1NmM5
MjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL3Zl
bmMuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy92ZW5jLmMK
PiBAQCAtMjA5LDQ5ICsyMDksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZlbmNfY29uZmlnIHZl
bmNfY29uZmlnX250c2NfdHJtID0gewo+ICAJLmdlbl9jdHJsCQkJCT0gMHgwMEY5MDAwMCwKPiAg
fTsKPiAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdmVuY19jb25maWcgdmVuY19jb25maWdfcGFs
X2JkZ2hpID0gewo+IC0JLmZfY29udHJvbAkJCQk9IDAsCj4gLQkudmlkb3V0X2N0cmwJCQkJPSAw
LAo+IC0JLnN5bmNfY3RybAkJCQk9IDAsCj4gLQkuaGZsdHJfY3RybAkJCQk9IDAsCj4gLQkueF9j
b2xvcgkJCQk9IDAsCj4gLQkubGluZTIxCQkJCQk9IDAsCj4gLQkubG5fc2VsCQkJCQk9IDIxLAo+
IC0JLmh0cmlnZ2VyX3Z0cmlnZ2VyCQkJPSAwLAo+IC0JLnR2ZGV0Z3BfaW50X3N0YXJ0X3N0b3Bf
eAkJPSAweDAwMTQwMDAxLAo+IC0JLnR2ZGV0Z3BfaW50X3N0YXJ0X3N0b3BfeQkJPSAweDAwMDEw
MDAxLAo+IC0JLmdlbl9jdHJsCQkJCT0gMHgwMEZCMDAwMCwKPiAtCj4gLQkubGxlbgkJCQkJPSA4
NjQtMSwKPiAtCS5mbGVucwkJCQkJPSA2MjUtMSwKPiAtCS5jY19jYXJyX3dzc19jYXJyCQkJPSAw
eDJGNzYyNUVELAo+IC0JLmNfcGhhc2UJCQkJPSAweERGLAo+IC0JLmdhaW5fdQkJCQkJPSAweDEx
MSwKPiAtCS5nYWluX3YJCQkJCT0gMHgxODEsCj4gLQkuZ2Fpbl95CQkJCQk9IDB4MTQwLAo+IC0J
LmJsYWNrX2xldmVsCQkJCT0gMHgzZSwKPiAtCS5ibGFua19sZXZlbAkJCQk9IDB4M2UsCj4gLQku
bV9jb250cm9sCQkJCT0gMDw8MiB8IDE8PDEsCj4gLQkuYnN0YW1wX3dzc19kYXRhCQkJPSAweDQy
LAo+IC0JLnNfY2FycgkJCQkJPSAweDJhMDk4YWNiLAo+IC0JLmwyMV9fd2NfY3RsCQkJCT0gMDw8
MTMgfCAweDE2PDw4IHwgMDw8MCwKPiAtCS5zYXZpZF9fZWF2aWQJCQkJPSAweDA2QTcwMTA4LAo+
IC0JLmZsZW5fX2ZhbAkJCQk9IDIzPDwxNiB8IDYyNDw8MCwKPiAtCS5sYWxfX3BoYXNlX3Jlc2V0
CQkJPSAyPDwxNyB8IDMxMDw8MCwKPiAtCS5oc19pbnRfc3RhcnRfc3RvcF94CQkJPSAweDAwOTIw
MzU4LAo+IC0JLmhzX2V4dF9zdGFydF9zdG9wX3gJCQk9IDB4MDAwRjAzNUYsCj4gLQkudnNfaW50
X3N0YXJ0X3gJCQkJPSAweDFhNzw8MTYsCj4gLQkudnNfaW50X3N0b3BfeF9fdnNfaW50X3N0YXJ0
X3kJCT0gMHgwMDA2MDFBNywKPiAtCS52c19pbnRfc3RvcF95X192c19leHRfc3RhcnRfeAkJPSAw
eDAxQUYwMDM2LAo+IC0JLnZzX2V4dF9zdG9wX3hfX3ZzX2V4dF9zdGFydF95CQk9IDB4MjcxMDFh
ZiwKPiAtCS52c19leHRfc3RvcF95CQkJCT0gMHgwNSwKPiAtCS5hdmlkX3N0YXJ0X3N0b3BfeAkJ
CT0gMHgwMzUzMDA4MiwKPiAtCS5hdmlkX3N0YXJ0X3N0b3BfeQkJCT0gMHgwMjcwMDAyRSwKPiAt
CS5maWRfaW50X3N0YXJ0X3hfX2ZpZF9pbnRfc3RhcnRfeQk9IDB4MDAwNTAwOEEsCj4gLQkuZmlk
X2ludF9vZmZzZXRfeV9fZmlkX2V4dF9zdGFydF94CT0gMHgwMDJFMDEzOCwKPiAtCS5maWRfZXh0
X3N0YXJ0X3lfX2ZpZF9leHRfb2Zmc2V0X3kJPSAweDAxMzgwMDA1LAo+IC19Owo+IC0KPiAgY29u
c3Qgc3RydWN0IG9tYXBfdmlkZW9fdGltaW5ncyBvbWFwX2Rzc19wYWxfdGltaW5ncyA9IHsKPiAg
CS54X3JlcwkJPSA3MjAsCj4gIAkueV9yZXMJCT0gNTc0LAo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
