Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633E1B1EEF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532B86E2A5;
	Tue, 21 Apr 2020 06:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50936E2A5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:42:51 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200421064249epoutp04d9d491b042cf9387800a45f38518f3eb~HwpwtUPKI0393303933epoutp04e
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:42:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200421064249epoutp04d9d491b042cf9387800a45f38518f3eb~HwpwtUPKI0393303933epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587451369;
 bh=ti6gy7+fppWdn9AAqbqwoO6SZ6gbjPALBm9P8FNcdSY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=I0VikbBLc6SQptRvTsW12jjM5zv3BJ+vYKlVm8SW9nmsjV2pl5x8D7Qq9svy6jJyP
 y7eD9BAwDEihjKoLsPedWhOUwdQEBZqUQ5LnWdlS1xCX5eFxwP7OglZr2WtC15huRr
 yh0CNJdKfjIuw5ei9FFKqYAyzQwUkNS/6z1xt4sI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200421064249epcas1p4b28273e1834409f7c6e285daf35c2412~HwpwSr8-B1394813948epcas1p4_;
 Tue, 21 Apr 2020 06:42:49 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 495vBt3FRVzMqYlv; Tue, 21 Apr
 2020 06:42:46 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.ED.04744.CD59E9E5; Tue, 21 Apr 2020 15:42:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200421064236epcas1p4a1e03e246b97b8e01c7923d3dd82396d~HwpkMFoIz0594905949epcas1p4n;
 Tue, 21 Apr 2020 06:42:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200421064236epsmtrp12299f2592f44a20442326e0b292a7862~HwpkKznP41349313493epsmtrp1y;
 Tue, 21 Apr 2020 06:42:36 +0000 (GMT)
X-AuditID: b6c32a38-253ff70000001288-94-5e9e95dca6c2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C3.21.04024.CD59E9E5; Tue, 21 Apr 2020 15:42:36 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200421064235epsmtip25a8e4bf1d9357f0efad5d1b8996f0ffa~Hwpj6sA7I2936729367epsmtip2s;
 Tue, 21 Apr 2020 06:42:35 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/exynos: gem: Remove dead-code
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <1412c14b-02d3-5334-8916-887f69b431c7@samsung.com>
Date: Tue, 21 Apr 2020 15:47:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200407134256.9129-2-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmru6dqfPiDN5MMre4te4cq8XGGetZ
 La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7KtslITUxJLVJIzUvO
 T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qukUJaYUwoUCkgsLlbSt7Mp
 yi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM64d/sjU0GveMWlqdPY
 GxiXC3cxcnJICJhIfFv6kxnEFhLYwSgx5WgMhP2JUeLmAt4uRi4g+xujxKPeJUwwDUuX/GWC
 SOxllHhy+ScLhPOeUWLit1MsIFXCAlYS6++9YwWxRQRKJeb+P8YOYjMLtDNKrD0eD2KzCahK
 TFxxnw3E5hWwk7g9fS6YzQIU71x9DmgDB4eoQITE6a+JECWCEidnPgEbzylgK3H7zWFGiJHi
 EreezGeCsOUlmrfOZga5R0LgDJvEjFnP2SGudpGYdWA1C4QtLPHq+BaouJTEy/42doiGZqAH
 ZpxmgnA6GCXuPr4O1WEssX/pZLCLmAU0Jdbv0ocIK0rs/D0X6go+iXdfe1hBSiQEeCU62oQg
 SpQkjl28wQhhS0hcWDKRDcL2kNjV3cY+gVFxFpLfZiH5ZxaSf2YhLF7AyLKKUSy1oDg3PbXY
 sMAEObI3MYKTpJbFDsY953wOMQpwMCrx8G4QmxcnxJpYVlyZe4hRgoNZSYTXQgsoxJuSWFmV
 WpQfX1Sak1p8iNEUGPITmaVEk/OBCTyvJN7Q1MjY2NjCxNDM1NBQSZx36vWcOCGB9MSS1OzU
 1ILUIpg+Jg5OqQbGatHZie61p1Xzizpuaa1yu+SZ4mEk8qp+BoPSlTW/+Tn8wrJNFU5bPRCx
 rjEN4yjc+3nPvPBphxfNOrb3Rqnmmn0MRhn8Td8miiucYp3IGy7FVn5t9zVGqaW39mTx5x9R
 evbWS/Ds32e/D05wF7/2dQbvYduGmSd+Rnf9C96fubv45/X2D9MdlViKMxINtZiLihMBarJ5
 z6gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvO6dqfPiDLZ2cljcWneO1WLjjPWs
 Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
 Zdy7/ZGpoFe84tLUaewNjMuFuxg5OSQETCSWLvnL1MXIxSEksJtRYs/bV4xdjBxACQmJLVs5
 IExhicOHiyFK3jJKHJj0lQmkV1jASmL9vXesILaIQKnEq/77jCBFzALtjBJH9nWwQ3QcZpS4
 c2QdO0gVm4CqxMQV99lAbF4BO4nb0+eC2SxA8c7V58CmigpESDzffoMRokZQ4uTMJywgNqeA
 rcTtN4fB4swC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ
 1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4MjQ0tzBeHlJ/CFGAQ5GJR7eDWLz4oRYE8uK
 K3MPMUpwMCuJ8FpoAYV4UxIrq1KL8uOLSnNSiw8xSnOwKInzPs07FikkkJ5YkpqdmlqQWgST
 ZeLglGpg5DhX5ZW1xbFt91Pvn36fdG8+j/1wKTrh6g/TxSs2hedM8Pywv7A97dA+qWeiac5W
 e3a9tXSI1jBamLP3sdg/3xSF84ZpX39pSTpU5Lr+NKy+9NJrW4ZaRZ3yNa60pI0uv/YbX05f
 fJ/lQPeF6sgHJd2tLSJ/rBbzLKi1CzptqL3fJrdU4nm7EktxRqKhFnNRcSIAQd6QIYgCAAA=
X-CMS-MailID: 20200421064236epcas1p4a1e03e246b97b8e01c7923d3dd82396d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
 <CGME20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335@eucas1p1.samsung.com>
 <20200407134256.9129-2-m.szyprowski@samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gNC4gNy4g7Jik7ZuEIDEwOjQy7JeQIE1hcmVrIFN6eXByb3dza2kg7J20KOqwgCkg7JO0
IOq4gDoKPiBUaGUgRXh5bm9zRFJNIHBhZ2UgZmF1bHQgaGFuZGxlciBpcyBuZXZlciB1c2VkLCBk
cm1fZ2VtX21tYXAoKQo+IGFsd2F5cyBjYWxscyBleHlub3NfZHJtX2dlbV9tbWFwKCkgZnVuY3Rp
b24sIHdoaWNoIHBlcmZvcm0KPiBjb21wbGV0ZSBtYXBwaW5nIGZvciB0aGUgZ2l2ZW4gdmlydHVh
bCBhZGRyZXNzLXNwYWNlIGFyZWEuCgpSaWdodCwgbmV2ZXIgdXNlZC4gUGlja2VkIGl0IHVwLgoK
VGhhbmtzLApJbmtpIERhZQoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxt
LnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9kcnYuYyB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2dlbS5jIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2dlbS5oIHwgIDMgLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwo+IGlu
ZGV4IDU3ZGVmZWI0NDUyMi4uZGJkODBmMWU0Yzc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kcnYuYwo+IEBAIC03Niw3ICs3Niw2IEBAIHN0YXRpYyB2b2lkIGV4eW5v
c19kcm1fcG9zdGNsb3NlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSkKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVj
dCBleHlub3NfZHJtX2dlbV92bV9vcHMgPSB7Cj4gLQkuZmF1bHQgPSBleHlub3NfZHJtX2dlbV9m
YXVsdCwKPiAgCS5vcGVuID0gZHJtX2dlbV92bV9vcGVuLAo+ICAJLmNsb3NlID0gZHJtX2dlbV92
bV9jbG9zZSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jCj4g
aW5kZXggZDczNGQ5ZDUxNzYyLi40MDUxNGQzZGNmNjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2dlbS5jCj4gQEAgLTM4MSwyNiArMzgxLDYgQEAgaW50IGV4eW5vc19k
cm1fZ2VtX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gLXZtX2ZhdWx0X3QgZXh5bm9zX2RybV9nZW1fZmF1bHQoc3RydWN0IHZt
X2ZhdWx0ICp2bWYpCj4gLXsKPiAtCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52
bWE7Cj4gLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRh
Owo+IC0Jc3RydWN0IGV4eW5vc19kcm1fZ2VtICpleHlub3NfZ2VtID0gdG9fZXh5bm9zX2dlbShv
YmopOwo+IC0JdW5zaWduZWQgbG9uZyBwZm47Cj4gLQlwZ29mZl90IHBhZ2Vfb2Zmc2V0Owo+IC0K
PiAtCXBhZ2Vfb2Zmc2V0ID0gKHZtZi0+YWRkcmVzcyAtIHZtYS0+dm1fc3RhcnQpID4+IFBBR0Vf
U0hJRlQ7Cj4gLQo+IC0JaWYgKHBhZ2Vfb2Zmc2V0ID49IChleHlub3NfZ2VtLT5zaXplID4+IFBB
R0VfU0hJRlQpKSB7Cj4gLQkJRFJNX0VSUk9SKCJpbnZhbGlkIHBhZ2Ugb2Zmc2V0XG4iKTsKPiAt
CQlyZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+IC0JfQo+IC0KPiAtCXBmbiA9IHBhZ2VfdG9fcGZu
KGV4eW5vc19nZW0tPnBhZ2VzW3BhZ2Vfb2Zmc2V0XSk7Cj4gLQlyZXR1cm4gdm1mX2luc2VydF9t
aXhlZCh2bWEsIHZtZi0+YWRkcmVzcywKPiAtCQkJX19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVW
KSk7Cj4gLX0KPiAtCj4gIHN0YXRpYyBpbnQgZXh5bm9zX2RybV9nZW1fbW1hcF9vYmooc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosCj4gIAkJCQkgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSkKPiAgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z2VtLmggYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmgKPiBpbmRleCA0
MmVjNjdiYzI2MmQuLmYwMDA0NGMwYjY4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZ2VtLmgKPiBAQCAtMTAxLDkgKzEwMSw2IEBAIGludCBleHlub3NfZHJtX2dlbV9k
dW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKPiAgCQkJICAgICAgIHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCSAgICAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1
bWIgKmFyZ3MpOwo+ICAKPiAtLyogcGFnZSBmYXVsdCBoYW5kbGVyIGFuZCBtbWFwIGZhdWx0IGFk
ZHJlc3ModmlydHVhbCkgdG8gcGh5c2ljYWwgbWVtb3J5LiAqLwo+IC12bV9mYXVsdF90IGV4eW5v
c19kcm1fZ2VtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKTsKPiAtCj4gIC8qIHNldCB2bV9m
bGFncyBhbmQgd2UgY2FuIGNoYW5nZSB0aGUgdm0gYXR0cmlidXRlIHRvIG90aGVyIG9uZSBhdCBo
ZXJlLiAqLwo+ICBpbnQgZXh5bm9zX2RybV9nZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+ICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
