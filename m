Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A221E555
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5776E3C7;
	Tue, 14 Jul 2020 01:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D42D6E3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:50:13 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200714015010epoutp0172f6c7d74683088cdeceaf8838077439~he2OdZxhc2772027720epoutp01x
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200714015010epoutp0172f6c7d74683088cdeceaf8838077439~he2OdZxhc2772027720epoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594691410;
 bh=HNyaDeR4AskBkcg0fKW9G9hZa5/3aL1Ks0nqKyfxK6E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=B+Em6PhRisNIhefk62lDa4mdVGkcfhvuolh+Be2J63oVwI21AxSwkG0h4BLTKomA2
 Q4PeKEax1mdhgshBMRNWgF0FZ9+fouADoGMpcrzA2LB/KR14+DWXyuQn8guj3OPvlD
 GP1ORR+bQ7jakyZHlLIMt7N2+weos/H02wHvpw3c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200714015009epcas1p3ec010e8e446baa273d93d2a8503b24fe~he2NbUsgl2499324993epcas1p3C;
 Tue, 14 Jul 2020 01:50:09 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4B5NkR0pqdzMqYkn; Tue, 14 Jul
 2020 01:50:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.13.28578.D4F0D0F5; Tue, 14 Jul 2020 10:50:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200714015004epcas1p2c577099e34bb7d65099672707b866e02~he2I1CzTx1414714147epcas1p2r;
 Tue, 14 Jul 2020 01:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200714015004epsmtrp20847ef4da655833f38eff2f57480999b~he2I0VIB12335223352epsmtrp2f;
 Tue, 14 Jul 2020 01:50:04 +0000 (GMT)
X-AuditID: b6c32a39-e6f5da8000006fa2-8d-5f0d0f4df05e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 98.50.08303.C4F0D0F5; Tue, 14 Jul 2020 10:50:04 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200714015004epsmtip2a9627e2cff87a138853602602023bc31~he2IqdF4L0310703107epsmtip2S;
 Tue, 14 Jul 2020 01:50:04 +0000 (GMT)
Subject: Re: [PATCH v2] drm/exynos: gem: Fix sparse warning
To: Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <5b6fc413-8850-5c23-93f4-736b310ea67f@samsung.com>
Date: Tue, 14 Jul 2020 10:56:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200713160342.GB1223330@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmrq4vP2+8wellqha31p1jtdg4Yz2r
 xZWv79ksZpzfx2Sx9shddosVP7cyWsyY/JLNgd3jfvdxJo8l066yefRtWcXo8XmTXABLVLZN
 RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtAFSgpliTml
 QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCywK94sTc4tK8dL3k/FwrQwMDI1OgwoTsjClP
 Z7EV7BeqONuQ1sB4jL+LkZNDQsBEYufsRkYQW0hgB6PEtpt8EPYnRokP/0O6GLmA7M+MEtf3
 tTPCNBxff5MFIrGLUeLkuc+MEM57RokH8+eygVQJC1hL/PxxFaxDRCBIorv3ATNIEbPAWUaJ
 vplHmUESbAKqEhNX3Adr4BWwk7hz6jhYAwtQ/EHLHHYQW1QgQuJ492R2iBpBiZMzn7CA2JxA
 Z3TOPgFmMwuIS9x6Mp8JwpaXaN46G2yZhEArh8TuzyfYIe52kbjQ18cMYQtLvDq+BSouJfH5
 3V42iIZmRomJM04zQTgdjBJ3H19ngagylti/dDJQggNohabE+l36EGFFiZ2/5zJCbOaTePe1
 hxWkREKAV6KjTQiiREni2MUb0LCTkLiwZCIbhO0hMWduB+sERsVZSH6bheSfWUj+mYWweAEj
 yypGsdSC4tz01GLDAlPk2N7ECE6dWpY7GKe//aB3iJGJg/EQowQHs5IILw8Xb7wQb0piZVVq
 UX58UWlOavEhRlNgaE9klhJNzgcm77ySeENTI2NjYwsTQzNTQ0Mlcd5/Z9njhQTSE0tSs1NT
 C1KLYPqYODilGphElI9cbq+ea1u1pXrJwxq9mwmXrjPUT5x67bObotJkg/wLlz3LovqP6rrI
 XUmy+35ok7rI6pwu3awiwVds4RtcbnpNeBHVsZivsmNTUNW0z2Ibxe9w2l7Y+0L16r0NnVu7
 sxk/rlWfuOOqj3nSd21d/zL3VSZMrc4G4XcreMpPFvff+PPv9dxv64NStr1aOP9a2NfX4SJr
 n4ZPDKj9KLcp4F9iVvs2cyF+6f7HVhO/Jxu+cjUr8XN/t+nmqzQDmTa92wmduycce3314/0J
 Tx9sVV5fynh1ZlzhrZe2fnwrjyfZLzFomvfrCdPL27Nzerx2PL/8dlHenpg+vuw/H7wnWK0L
 uWAQ2dhZx9F19NUiJZbijERDLeai4kQAHXGAOiYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWy7bCSvK4PP2+8QcMuHYtb686xWmycsZ7V
 4srX92wWM87vY7JYe+Quu8WKn1sZLWZMfsnmwO5xv/s4k8eSaVfZPPq2rGL0+LxJLoAlissm
 JTUnsyy1SN8ugStjytNZbAX7hSrONqQ1MB7j72Lk5JAQMJE4vv4mSxcjF4eQwA5GiUWPHzN3
 MXIAJSQktmzlgDCFJQ4fLoYoecsocXvrM0aQXmEBa4mfP64ygtSICARJbL1fAFLDLHCWUaLl
 2i1WkBohgd1AzvscEJtNQFVi4or7bCA2r4CdxJ1Tx8HmsADFH7TMYQexRQUiJFru/2GHqBGU
 ODnzCQuIzQl0Z+fsE2A2s4C6xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYh
 aVnAyLKKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4TrS0djDuWfVB7xAjEwfjIUYJ
 DmYlEV4eLt54Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxfZy2MExJITyxJzU5NLUgtgskycXBK
 NTAZTb1y6eue7xEn5D+wXj+g05Czrnb27ELHK8E+jDX75h/kKFUJeckRcmD38dnyxaoZ8QIc
 MXNkd5096/bA5+zbkl9WyREJy2N+d+wOVP72t3xLKmPDquf/byrXsjOG1Vl++ea0ZPdlkbUv
 Ju646rqwrbtA4LxHAPfrhJ3zu86E1O09fovP//ob5cs31BtdWd+27X0TPiUuYsHWNRoms4tC
 M+1etCbM1L+VHnKpz27dq2cWEk5cWmkaT55LdZx1Dd668HpcW5/b/dOrlzz7qRa2Vf+Rz/rE
 +beCxatd38kd9r3QfiBQnP/tSvYfBTbrqxL0Nh3l/G1SVTv3A999q9RdP1+/PvKn6HuK+E+N
 TdIflViKMxINtZiLihMBZLJ2ugIDAAA=
X-CMS-MailID: 20200714015004epcas1p2c577099e34bb7d65099672707b866e02
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c
References: <CGME20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c@eucas1p2.samsung.com>
 <20200713070708.30828-1-m.szyprowski@samsung.com>
 <20200713160342.GB1223330@ravnborg.org>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gNy4gMTQuIOyYpOyghCAxOjAz7JeQIFNhbSBSYXZuYm9yZyDsnbQo6rCAKSDsk7Qg6riA
Ogo+IE9uIE1vbiwgSnVsIDEzLCAyMDIwIGF0IDA5OjA3OjA4QU0gKzAyMDAsIE1hcmVrIFN6eXBy
b3dza2kgd3JvdGU6Cj4+IGt2YWRkciBlbGVtZW50IG9mIHRoZSBleHlub3NfZ2VtIG9iamVjdCBw
b2ludHMgdG8gYSBtZW1vcnkgYnVmZmVyLCB0aHVzCj4+IGl0IHNob3VsZCBub3QgaGF2ZSBhIF9f
aW9tZW0gYW5ub3RhdGlvbi4gVGhlbiwgdG8gYXZvaWQgYSB3YXJuaW5nIG9yCj4+IGNhc3Rpbmcg
b24gYXNzaWdubWVudCB0byBmYmkgc3RydWN0dXJlLCB0aGUgc2NyZWVuX2J1ZmZlciBlbGVtZW50
IG9mIHRoZQo+PiB1bmlvbiBzaG91bGQgYmUgdXNlZCBpbnN0ZWFkIG9mIHRoZSBzY3JlZW5fYmFz
ZS4KPj4KPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
PiBTdWdnZXN0ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+IFJl
dmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4gSSBleHBlY3Qg
b25lIG9mIHRoZSBleHlub3MgbWFpbnRpYW5lcnMgKElua2k/KSB0byBwaWNrIGl0IHVwLgoKUGlj
a2VkIGl0IHVwLgoKVGhhbmtzLApJbmtpIERhZQoKPiAKPiAJU2FtCj4gCj4+IC0tLQo+PiAgZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMgfCAyICstCj4+ICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmggICB8IDIgKy0KPj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYwo+PiBpbmRleCA1NmEyYjQ3ZTFhZjcuLjUxNDdm
NTkyOWJlNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2ZiZGV2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2
LmMKPj4gQEAgLTkyLDcgKzkyLDcgQEAgc3RhdGljIGludCBleHlub3NfZHJtX2ZiZGV2X3VwZGF0
ZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLAo+PiAgCW9mZnNldCA9IGZiaS0+dmFyLnhv
ZmZzZXQgKiBmYi0+Zm9ybWF0LT5jcHBbMF07Cj4+ICAJb2Zmc2V0ICs9IGZiaS0+dmFyLnlvZmZz
ZXQgKiBmYi0+cGl0Y2hlc1swXTsKPj4gIAo+PiAtCWZiaS0+c2NyZWVuX2Jhc2UgPSBleHlub3Nf
Z2VtLT5rdmFkZHIgKyBvZmZzZXQ7Cj4+ICsJZmJpLT5zY3JlZW5fYnVmZmVyID0gZXh5bm9zX2dl
bS0+a3ZhZGRyICsgb2Zmc2V0Owo+PiAgCWZiaS0+c2NyZWVuX3NpemUgPSBzaXplOwo+PiAgCWZi
aS0+Zml4LnNtZW1fbGVuID0gc2l6ZTsKPj4gIAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2dlbS5oCj4+IGluZGV4IDc0NDU3NDgyODhkYS4uNzRlOTI2YWJlZmYwIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmgKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oCj4+IEBAIC00MCw3ICs0MCw3
IEBAIHN0cnVjdCBleHlub3NfZHJtX2dlbSB7Cj4+ICAJdW5zaWduZWQgaW50CQlmbGFnczsKPj4g
IAl1bnNpZ25lZCBsb25nCQlzaXplOwo+PiAgCXZvaWQJCQkqY29va2llOwo+PiAtCXZvaWQgX19p
b21lbQkJKmt2YWRkcjsKPj4gKwl2b2lkCQkJKmt2YWRkcjsKPj4gIAlkbWFfYWRkcl90CQlkbWFf
YWRkcjsKPj4gIAl1bnNpZ25lZCBsb25nCQlkbWFfYXR0cnM7Cj4+ICAJc3RydWN0IHNnX3RhYmxl
CQkqc2d0Owo+PiAtLSAKPj4gMi4xNy4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29t
L3VybD9rPTMzY2M0NjkwLTZlNTJkZDdhLTMzY2RjZGRmLTBjYzQ3YTZjYmEwNC0zMjM0Mzg5Y2Y2
YWM4ZTg5JnE9MSZ1PWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1h
biUyRmxpc3RpbmZvJTJGZHJpLWRldmVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
