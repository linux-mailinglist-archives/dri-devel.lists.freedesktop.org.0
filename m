Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC92739F6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 06:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477E189EAE;
	Tue, 22 Sep 2020 04:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746EC897DC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 04:56:09 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200922044623epoutp025d64827a6454bfd45df2569d3034d77d~3AaELOT7l1088710887epoutp02Z
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 04:46:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200922044623epoutp025d64827a6454bfd45df2569d3034d77d~3AaELOT7l1088710887epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600749983;
 bh=0RSMhqnSj848xzXYx0pIxG/PFraxyfEQCNsvSVhzADU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=seKWXUuAPKpzrUFDDPADVkxNVZXBdH8PbC49eNSBh7H6ciligQPzQBWJ9Nz4RC8HG
 excEqDEwp7+htNWciNM0MokFOPHtPRFO2hnwP20X4vIRSnCW7PG2/FQ3wjpoJUAY5T
 sexFgZ/5H4AG9SxxLqhepJS/bT52742I9Wu0oeyI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200922044623epcas1p4383c4c0e219c4cd8dce9fac2925904ef~3AaD3cMzL2756727567epcas1p4W;
 Tue, 22 Sep 2020 04:46:23 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BwTKS6s3gzMqYmC; Tue, 22 Sep
 2020 04:46:20 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.43.09577.791896F5; Tue, 22 Sep 2020 13:46:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200922044614epcas1p392707dcb757a6bcb03a1374d76ca1486~3AZ7xkJlp2607426074epcas1p3U;
 Tue, 22 Sep 2020 04:46:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200922044614epsmtrp22bb55d2401f2e8d0baca301e9139adba~3AZ7w55Bc1227812278epsmtrp2y;
 Tue, 22 Sep 2020 04:46:14 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-56-5f6981973f44
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C6.2F.08604.691896F5; Tue, 22 Sep 2020 13:46:14 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200922044614epsmtip1aba29b3b6e4ed34c58d94ae48283067f~3AZ7kGg8x1414614146epsmtip1L;
 Tue, 22 Sep 2020 04:46:14 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Drop local dma_parms
To: Robin Murphy <robin.murphy@arm.com>, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <356c7033-d2dd-1d04-e4d5-adf01ea6e535@samsung.com>
Date: Tue, 22 Sep 2020 13:52:55 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmru70xsx4g09P2C2ufH3PZvHi3kUW
 i7NNb9gtNj2+xmox4/w+JouDH54AWZNfsjmwe6yZt4bR4373cSaPzUvqPfq2rGL0+LxJLoA1
 KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+gKJYWy
 xJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5yfq6VoYGBkSlQYUJ2
 xolvMQVzRSruPd3N0sB4XqCLkZNDQsBEomlLD3MXIxeHkMAORokFx35BOZ8YJZbfn8YC4Xxj
 lFgz7RE7TMu+1pmsILaQwF5GiedroyDs94wSu26Fg9jCAqYSF+7dBKsRESiVaNo4iQXEZhbI
 k7j46ylYnE1AVWLiivtsIDavgJ3E43VXmEBsFqD4yTmrweKiAhESx7sns0PUCEqcnPkEbA6n
 QLTEle7zzBAzxSVuPZnPBGHLSzRvnQ32gYRAJ4fEm4/tTBBHu0hMPryJGcIWlnh1fAvUM1IS
 n9/tZYNoaGaUmDjjNBOE08EocffxdRaIKmOJ/UsnAyU4gFZoSqzfpQ8RVpTY+XsuI8RmPol3
 X3tYQUokBHglOtqEIEqUJI5dvMEIYUtIXFgykQ3C9pBYsusI4wRGxVlIfpuF5J9ZSP6ZhbB4
 ASPLKkax1ILi3PTUYsMCU+TI3sQITqBaljsYp7/9oHeIkYmD8RCjBAezkgivmlF6vBBvSmJl
 VWpRfnxRaU5q8SFGU2BoT2SWEk3OB6bwvJJ4Q1MjY2NjCxNDM1NDQyVx3oe3FOKFBNITS1Kz
 U1MLUotg+pg4OKUamEoEjC1C2ru3X7Txqjfo/viZ7+nb6wJa/0Prji+Xm3p19v3p5nu/n5z2
 TPzoDm7PHUcV7W+J1H1OnfvOo+RRxM/DBzy4HF1KAx+2evlyJrr7HZOfaxbiOVGWcfkdm8xH
 jGX6viEf2iVOLDgjdG4n9++zd0+EnyzsPPTS6/R39hbDyG/HS2MmajJMW2N+Q7r5ffRDeZkn
 8TNXnv/95emNmoUzq0RF3j5yUn1j5PV8Vtku69olvTskb+u8ub2joO9alNWtTbIOGueZXmyy
 FNec5GKw+F/Sh36Z5eq975O3bloVeFjJ7eBRqYzj2hOO6e5d2OGz2quWZ/73353N9yY/WH3e
 tfVQXtsHlfuT7Ms3XfZVYinOSDTUYi4qTgQAW+axWCkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSnO60xsx4g9Xz1SyufH3PZvHi3kUW
 i7NNb9gtNj2+xmox4/w+JouDH54AWZNfsjmwe6yZt4bR4373cSaPzUvqPfq2rGL0+LxJLoA1
 issmJTUnsyy1SN8ugSvjxLeYgrkiFfee7mZpYDwv0MXIySEhYCKxr3UmaxcjF4eQwG5Gidu3
 FjJ3MXIAJSQktmzlgDCFJQ4fLgYpFxJ4yyjx4RgPiC0sYCpx4d5NVhBbRKBU4v6GtSwgNrNA
 nsTk7QuYIOrXMUpMmVMKYrMJqEpMXHGfDcTmFbCTeLzuClgNC1D85JzVYHFRgQiJlvt/2CFq
 BCVOznwCNpNTIFriSvd5Zoj56hJ/5l2CssUlbj2ZzwRhy0s0b53NPIFRaBaS9llIWmYhaZmF
 pGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgaNHS3MG4fdUHvUOMTByMhxgl
 OJiVRHjVjNLjhXhTEiurUovy44tKc1KLDzFKc7AoifPeKFwYJySQnliSmp2aWpBaBJNl4uCU
 amByKlZ5r/13GV/gZpWbshJSt+4JyE5cd9Lz+tZ1dWqvtj9a4Hw3y/PtQaGqy9w+M67WqhaU
 XTV0N/r8Oy2y9PWkH7xJjSHelhM33L1zXf0u97P0d+olrP+zs77de7ev5d/q6E6G7Ty9vR/6
 7kkuPXDn5bMDP1jXnetdcIvXcu/So7+eP3O9ZXFaZZNf6wzpxrPTI3e8lJPPP/LwfAX/1J2y
 ttlqwVaHqs5ffSR7fprM/9hTWuktz1dvW1LDKL9Y4uiRdz9rrPtPCBa+27gmTnGRf5Vt7f9/
 D5UK3+wtZgiadUw97I/klc7/yoUC0vEvPl1f9ujK7OfcWYUrZws6PeXefDrgdKi30N/pYgvu
 iU+NM1BiKc5INNRiLipOBADcTIThBQMAAA==
X-CMS-MailID: 20200922044614epcas1p392707dcb757a6bcb03a1374d76ca1486
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200903205219epcas1p23edcf79bd4959a5307ceecf0607c3d23
References: <CGME20200903205219epcas1p23edcf79bd4959a5307ceecf0607c3d23@epcas1p2.samsung.com>
 <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iaW4sCgpBcyBNYXJlayBzYWlkLCBoZSBwb3N0ZWQgc2FtZSBwYXRjaFsxXSBiZWZvcmUg
c28gSSBtZXJnZWQgaXQgaW5zdGVhZCBvZiB5b3UuCkkgdG90YWxseSBmb3Jnb3QgdG8gbWVyZ2Ug
aXQuIDooIFNvcnJ5IGZvciBjb25mdXNpbmcuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ZHJpLWRldmVsLzIwMjAwNzA3MTEwODI3LjM3NjAtMS1tLnN6eXByb3dza2lAc2Ftc3VuZy5jb20v
CgpUaGFua3MsCklua2kgRGFlCgoyMC4gOS4gNC4g7Jik7KCEIDU6NTHsl5AgUm9iaW4gTXVycGh5
IOydtCjqsIApIOyTtCDquIA6Cj4gU2luY2UgY29tbWl0IDk0OTViN2U5MmY3MSAoImRyaXZlciBj
b3JlOiBwbGF0Zm9ybTogSW5pdGlhbGl6ZSBkbWFfcGFybXMKPiBmb3IgcGxhdGZvcm0gZGV2aWNl
cyIpLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIGFscmVhZHkgcHJvdmlkZXMgYQo+IGRtYV9wYXJt
cyBzdHJ1Y3R1cmUsIHNvIHdlIGNhbiBzYXZlIGFsbG9jYXRpbmcgYW5vdGhlciBvbmUuCj4gCj4g
QWxzbyB0aGUgRE1BIHNlZ21lbnQgc2l6ZSBpcyBzaW1wbHkgYSBzaXplLCBub3QgYSBiaXRtYXNr
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kbWEuYyB8IDI2ICst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rt
YS5jCj4gaW5kZXggNThiODllYzExYjBlLi45ZjI1YTVlYmJmN2QgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2RtYS5jCj4gQEAgLTMxLDIzICszMSw2IEBACj4gICNkZWZp
bmUgRVhZTk9TX0RFVl9BRERSX1NUQVJUCTB4MjAwMDAwMDAKPiAgI2RlZmluZSBFWFlOT1NfREVW
X0FERFJfU0laRQkweDQwMDAwMDAwCj4gIAo+IC1zdGF0aWMgaW5saW5lIGludCBjb25maWd1cmVf
ZG1hX21heF9zZWdfc2l6ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gLXsKPiAtCWlmICghZGV2LT5k
bWFfcGFybXMpCj4gLQkJZGV2LT5kbWFfcGFybXMgPSBremFsbG9jKHNpemVvZigqZGV2LT5kbWFf
cGFybXMpLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghZGV2LT5kbWFfcGFybXMpCj4gLQkJcmV0dXJu
IC1FTk9NRU07Cj4gLQo+IC0JZG1hX3NldF9tYXhfc2VnX3NpemUoZGV2LCBETUFfQklUX01BU0so
MzIpKTsKPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgY2xlYXJf
ZG1hX21heF9zZWdfc2l6ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gLXsKPiAtCWtmcmVlKGRldi0+
ZG1hX3Bhcm1zKTsKPiAtCWRldi0+ZG1hX3Bhcm1zID0gTlVMTDsKPiAtfQo+IC0KPiAgLyoKPiAg
ICogZHJtX2lvbW11X2F0dGFjaF9kZXZpY2UtIGF0dGFjaCBkZXZpY2UgdG8gaW9tbXUgbWFwcGlu
Zwo+ICAgKgo+IEBAIC02OSw5ICs1Miw3IEBAIHN0YXRpYyBpbnQgZHJtX2lvbW11X2F0dGFjaF9k
ZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4g
IAl9Cj4gIAo+IC0JcmV0ID0gY29uZmlndXJlX2RtYV9tYXhfc2VnX3NpemUoc3ViZHJ2X2Rldik7
Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwlkbWFfc2V0X21heF9zZWdfc2l6ZShz
dWJkcnZfZGV2LCBVSU5UX01BWCk7Cj4gIAo+ICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSTV9E
TUFfVVNFX0lPTU1VKSkgewo+ICAJCS8qCj4gQEAgLTg5LDkgKzcwLDYgQEAgc3RhdGljIGludCBk
cm1faW9tbXVfYXR0YWNoX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiwKPiAgCQly
ZXQgPSBpb21tdV9hdHRhY2hfZGV2aWNlKHByaXYtPm1hcHBpbmcsIHN1YmRydl9kZXYpOwo+ICAJ
fQo+ICAKPiAtCWlmIChyZXQpCj4gLQkJY2xlYXJfZG1hX21heF9zZWdfc2l6ZShzdWJkcnZfZGV2
KTsKPiAtCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IEBAIC0xMTQsOCArOTIsNiBAQCBzdGF0
aWMgdm9pZCBkcm1faW9tbXVfZGV0YWNoX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rl
diwKPiAgCQlhcm1faW9tbXVfYXR0YWNoX2RldmljZShzdWJkcnZfZGV2LCAqZG1hX3ByaXYpOwo+
ICAJfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19JT01NVV9ETUEpKQo+ICAJCWlvbW11X2Rl
dGFjaF9kZXZpY2UocHJpdi0+bWFwcGluZywgc3ViZHJ2X2Rldik7Cj4gLQo+IC0JY2xlYXJfZG1h
X21heF9zZWdfc2l6ZShzdWJkcnZfZGV2KTsKPiAgfQo+ICAKPiAgaW50IGV4eW5vc19kcm1fcmVn
aXN0ZXJfZG1hKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBkZXZpY2UgKmRldiwKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
