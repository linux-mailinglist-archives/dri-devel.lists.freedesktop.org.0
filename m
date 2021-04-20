Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5536524D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 08:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9489FE8;
	Tue, 20 Apr 2021 06:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA97889FE6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 06:22:37 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210420062235epoutp027d4141a934bdcae5f9bc1d107df6225f~3fMAcYISc2974429744epoutp02v
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 06:22:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210420062235epoutp027d4141a934bdcae5f9bc1d107df6225f~3fMAcYISc2974429744epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618899755;
 bh=GZcw++8eRqRO6mbzVQ+zFrCr+EYpEAwP4L8/DA6RlYk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Yip3TkdVqL4GPVFubMEsNf6zI/H5EhrQh1hd1T6IOggMXDAye4ncBUFjLsp41WUdp
 PWF3tpRRnWl2VKQJXOtkCEJyCfmHPJGM40m+Z+Jni/NFm9wLYgaM4QIQrAowoGGp0K
 Loa5h96HA7B3wjTXWlvHZLhCC+YW1+K2fQtvI/v8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210420062227epcas1p1ce550cf986772db68d19cb9b89fd5704~3fL5WJGmP0652906529epcas1p1E;
 Tue, 20 Apr 2021 06:22:27 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4FPYWN3Rvkz4x9Q8; Tue, 20 Apr
 2021 06:22:24 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.74.10258.B137E706; Tue, 20 Apr 2021 15:22:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210420062213epcas1p4470b2884ef68e66eb95c72500533dd60~3fLrpwNXJ2564425644epcas1p44;
 Tue, 20 Apr 2021 06:22:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210420062213epsmtrp1f2ada2d1d218497feb61a8e4b2e5039f~3fLrpAFkU0991009910epsmtrp10;
 Tue, 20 Apr 2021 06:22:13 +0000 (GMT)
X-AuditID: b6c32a38-42fff70000002812-15-607e731b6758
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.73.08163.5137E706; Tue, 20 Apr 2021 15:22:13 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210420062213epsmtip196f57bab178b9c3931cf68131d892b3c~3fLrbtZ_k2244222442epsmtip1B;
 Tue, 20 Apr 2021 06:22:12 +0000 (GMT)
Subject: Re: [PATCH 03/12] drm/exynos: Don't set allow_fb_modifiers explicitly
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <df4acc12-27da-3a81-6e2b-eee197107341@samsung.com>
Date: Tue, 20 Apr 2021 15:31:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmrq50cV2Cwcy5phYLH95ltlh+Zh2z
 xZWv79ksZk/YzGTx4t5FFovz5zewW5xtesNusenxNVaLGef3MVnMmPySzYHLY++3BSwei/e8
 ZPLYtKqTzeN+93Emj81L6j36tqxi9Pi8SS6APSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7U
 zMBQ19DSwlxJIS8xN9VWycUnQNctMwfoPCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJq
 QUpOgWWBXnFibnFpXrpecn6ulaGBgZEpUGFCdsanNQcZC/5wV1w9fJKpgbGPq4uRk0NCwERi
 6cZNzF2MXBxCAjsYJR4euMsE4XxilLjw6BYrhPOZUWJpYweQwwHW8nh1PER8F6PEgZ5WRpBR
 QgLvGSX+P2YBsYUFAiSO/TjABmKLCMRLHJ6xmh2kgVngHpPEk1V7wYrYBFQlJq64D1bEK2An
 cfD8bHYQmwUo/vrsZLAaUYEIiRfzl0PVCEqcnPkELM4JVP930kywOLOAuMStJ/OZIGx5ieat
 s8H+kRBYySHxtaOfBeJRF4mpT/cyQtjCEq+Ob2GHsKUkXva3sUM0NDNKTJxxmgnC6WCUuPv4
 OlS3scT+pZOZQP5nFtCUWL9LHyKsKLHz91xGiM18Eu++9kCDiFeio00IokRJ4tjFG1B7JSQu
 LJnIBmF7SBxYvYRpAqPiLCS/zULyzywk/8xCWLyAkWUVo1hqQXFuemqxYYEJcnRvYgSnXS2L
 HYxz337QO8TIxMF4iFGCg1lJhPd+bU2CEG9KYmVValF+fFFpTmrxIUZTYGhPZJYSTc4HJv68
 knhDUyNjY2MLE0MzU0NDJXHedOfqBCGB9MSS1OzU1ILUIpg+Jg5OqQamjv2Ljixom3b0aNzl
 C9lCQieVDH3mfLt2UbrVueNyCUf4K169PJH3sU/OucxJYr8XEr6yL6jGYO9apyb+bPdfk///
 8knr2bZ1mbZkqlPeJY/9cr1rUkrf3mi5tJnrbrHjo9jfDw/XWBs6HHjIsmVd60GTD1XzKjjf
 1Fkb9P6Z5T5lh+nOeZMNQ/j+7vP8sMjd9NaXjzscV1RF1x/aHX7UatvC2FtXp3OqqAa0teUG
 rvi+hcMsI0CNIfyW3bPeNPVMVSPhS29rzkckV80QejQ/fk7t5r+eGfa8j4oYzjV8b7rN072p
 wvhY4DH7pOXHp15Z7b5VSflpyHojZZ49jQt+/537o7fx34uQyYe7rj2oUmIpzkg01GIuKk4E
 AHyb3apEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTle0uC7B4HMbj8XCh3eZLZafWcds
 ceXrezaL2RM2M1m8uHeRxeL8+Q3sFmeb3rBbbHp8jdVixvl9TBYzJr9kc+Dy2PttAYvH4j0v
 mTw2repk87jffZzJY/OSeo++LasYPT5vkgtgj+KySUnNySxLLdK3S+DK+LTmIGPBH+6Kq4dP
 MjUw9nF1MXJwSAiYSDxeHd/FyMUhJLCDUWL5/xZmiLiExJatHBCmsMThw8UQJW8ZJbbebgcq
 4eQQFvCTuDNzAZgtIhAv0XniNCNIEbPAIyaJw71LWCE6jjJKfO59BFbFJqAqMXHFfTYQm1fA
 TuLg+dnsIDYLUPz12cksILaoQITEgskgzSA1ghInZz4Bi3MC1f+dNBOsl1lAXeLPvEvMELa4
 xK0n85kgbHmJ5q2zmScwCs1C0j4LScssJC2zkLQsYGRZxSiZWlCcm55bbFhglJdarlecmFtc
 mpeul5yfu4kRHGVaWjsY96z6oHeIkYmD8RCjBAezkgjv/dqaBCHelMTKqtSi/Pii0pzU4kOM
 0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYDnScMilX52753SmyT6snOv1xSPjbxFO7
 T0do1UyYPPXwzCTZ1wo25sU7uadLXi3OuZNgtkg4qCm8ZrkI4/S8/7d8frcyhQkaXsq+Fq9f
 G7vDfof8/fll57oc595wddg8nUv46+zTp7f7XLq7+1fFP+7FyhtCYvTbZR53CKxInJ0ndW3N
 C3e9BUbdHrfERM/sWtZvfLh6YdGCK3tWJ030amPPn7HU+Kbap6Ws7eX6jcueZYet3W8sGBh6
 9bPqxOURAW2zjpYfmhxvtbBR+3+SpJr7da2wsDL9rOdnvf7eDX9ueynby9e66b2Z3b/Lpnca
 EysvpXRaCn74U5et3XomM11qurU0r6TjP+6b1UZKLMUZiYZazEXFiQDvbGZyIQMAAA==
X-CMS-MailID: 20210420062213epcas1p4470b2884ef68e66eb95c72500533dd60
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210413094922epcas1p47e75ce008a78971af7a923aadc0b9d3b
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <CGME20210413094922epcas1p47e75ce008a78971af7a923aadc0b9d3b@epcas1p4.samsung.com>
 <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMS4gNC4gMTMuIOyYpO2bhCA2OjQ47JeQIERhbmllbCBWZXR0ZXIg7J20KOqwgCkg7JO0IOq4
gDoKPiBTaW5jZQo+IAo+IGNvbW1pdCA4OTA4ODBkZGZkYmUyNTYwODMxNzA4NjZlNDljODc2MThi
NzA2YWM3Cj4gQXV0aG9yOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9v
dGxpbi5jb20+Cj4gRGF0ZTogICBGcmkgSmFuIDQgMDk6NTY6MTAgMjAxOSArMDEwMAo+IAo+ICAg
ICBkcm06IEF1dG8tc2V0IGFsbG93X2ZiX21vZGlmaWVycyB3aGVuIGdpdmVuIG1vZGlmaWVycyBh
dCBwbGFuZSBpbml0Cj4gCj4gdGhpcyBpcyBkb25lIGF1dG9tYXRpY2FsbHkgYXMgcGFydCBvZiBw
bGFuZSBpbml0LCBpZiBkcml2ZXJzIHNldCB0aGUKPiBtb2RpZmllciBsaXN0IGNvcnJlY3RseS4g
V2hpY2ggaXMgdGhlIGNhc2UgaGVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KCkFja2VkLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVA
c2Ftc3VuZy5jb20+CgpUaGFua3MsCklua2kgRGFlCgo+IENjOiBJbmtpIERhZSA8aW5raS5kYWVA
c2Ftc3VuZy5jb20+Cj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNv
bT4KPiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KPiBDYzogS3l1
bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KPiBDYzogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYi5jIHwgMiAtLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZmIuYwo+IGluZGV4IDY0MzcwYjYzNGNjYS4uNzlmYTM2NDkxODVjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiLmMKPiBAQCAtMTc3LDcgKzE3Nyw1IEBAIHZv
aWQgZXh5bm9zX2RybV9tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4g
IAlkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmV4eW5vc19kcm1fbW9kZV9jb25maWdfZnVuY3M7
Cj4gIAlkZXYtPm1vZGVfY29uZmlnLmhlbHBlcl9wcml2YXRlID0gJmV4eW5vc19kcm1fbW9kZV9j
b25maWdfaGVscGVyczsKPiAgCj4gLQlkZXYtPm1vZGVfY29uZmlnLmFsbG93X2ZiX21vZGlmaWVy
cyA9IHRydWU7Cj4gLQo+ICAJZGV2LT5tb2RlX2NvbmZpZy5ub3JtYWxpemVfenBvcyA9IHRydWU7
Cj4gIH0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
