Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B62718F9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 03:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6B489E57;
	Mon, 21 Sep 2020 01:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Mon, 21 Sep 2020 01:16:09 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288689E50
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 01:16:09 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200921011030epoutp023db36b7a07a7d7798af7eef83843c059~2p0R0GpRe2165021650epoutp023
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 01:10:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200921011030epoutp023db36b7a07a7d7798af7eef83843c059~2p0R0GpRe2165021650epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600650630;
 bh=eWT7d06KWfcsVOgfahORUzj7OIiAkwi/DKjSmtEKPc0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=bNSx2TNhhuXfbU1ibmp8RkDoPwuZ90rifre6UWv1NuI/uGcQboLvrqCeCmCjun51b
 NCx5CyTrjs5gqHfz/9PGPUBQuvZXz4jGQTqnrkzS+NQsEpKFua9cbdcQyhy7Mbe7M9
 B2cItFG8qReOxvgWt8Wqo4HtLXGL07DowyMHqXt8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200921011028epcas1p2c16c19a3b8aee4bdade361606cb56fad~2p0QnlBtp0695506955epcas1p2i;
 Mon, 21 Sep 2020 01:10:28 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BvmZn4fLMzMqYkr; Mon, 21 Sep
 2020 01:10:25 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 C7.A1.10463.18DF76F5; Mon, 21 Sep 2020 10:10:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200921011024epcas1p2b26ae07e221b20cdfc80561214578938~2p0Mrry063055230552epcas1p2T;
 Mon, 21 Sep 2020 01:10:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200921011024epsmtrp244c6fc1789e40d60241758c8e549e37a~2p0MrAmWq1240512405epsmtrp2V;
 Mon, 21 Sep 2020 01:10:24 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-26-5f67fd81751f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 64.D7.08745.08DF76F5; Mon, 21 Sep 2020 10:10:24 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200921011024epsmtip22da2959353b240cf8ffde505d62bbd97~2p0Mc-Ku53034930349epsmtip2Z;
 Mon, 21 Sep 2020 01:10:24 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Drop local dma_parms
To: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <25b69abe-7fdc-24bf-e84d-fed8afe1888d@samsung.com>
Date: Mon, 21 Sep 2020 10:17:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fedadf3b-f9f8-b959-6e25-e687ad8a78f3@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmrm7j3/R4g3P7lCyufH3PZvHi3kUW
 i7NNb9gtNj2+xmox4/w+Jou1R+6yWxz88ATInfySzYHDY828NYwe97uPM3lsXlLv0bdlFaPH
 501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
 QKcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgosC/SKE3OLS/PS9ZLzc60MDQyM
 TIEKE7Iz9jw5yFLwR7Ti28HXbA2MbwW7GDk5JARMJObcecjYxcjFISSwg1Gi78QmFgjnE5Az
 5wY7hPOZUeLu8U1sMC0dZ99BVe1ilJgzeQKU855R4sOrDhaQKmEBU4kL926ygiREBJYwSry/
 1M0MkmAWyJNYsOEII4jNJqAqMXHFfbCxvAJ2EiuWNYPVsADF7y7YARYXFYiQON49mR2iRlDi
 5MwnYAs4BewlHt/6ywgxU1zi1pP5TBC2vETz1tnMIIslBCZySLxZcYoZ4m4XiV0TT7BC2MIS
 r45vYYewpSQ+v9vLBtHQzCgxccZpJginA+jrx9dZIKqMJfYvnQyU4ABaoSmxfpc+RFhRYufv
 uVBX8Em8+9rDClIiIcAr0dEmBFGiJHHs4g1GCFtC4sKSidBw9JC4NP0I0wRGxVlIfpuF5J9Z
 SP6ZhbB4ASPLKkax1ILi3PTUYsMCE+QI38QITqlaFjsY5779oHeIkYmD8RCjBAezkgivmlF6
 vBBvSmJlVWpRfnxRaU5q8SFGU2BoT2SWEk3OByb1vJJ4Q1MjY2NjCxNDM1NDQyVx3oe3FOKF
 BNITS1KzU1MLUotg+pg4OKUamDi5EvvC7kwX+cPupxlbIrDV5YyqyMHtfQ0vjxdE/zrn3n/F
 WcHt8lz3f3kiovbTJ19ktZVPYFZgPOA6LV0hbsGTvSnT/8XeNz90cWrylvfaO/pe3bn86LGw
 mmbAzqsmq/sCVJnPS4Sxb9t2d9evrxO/lR/y7r67+MfF/DsF2geuF4l8DLJs49VULbhhP+ui
 39124dV620WsjDLvquYc+Ba15Mr8h6q1RqXL1S7dFp8zT/fApJNvP9TYa1y4EL5v2Sxr28NX
 /Bd61O5xmbkr9L1QxtdIwbmVf3LXv4s7ZnRwl+5OPt/2u9Yt3mzSMk+v1K8ruqz1OqVQXN6v
 7P6RQs91Pae33prO9lmqie3zJGMlluKMREMt5qLiRAC7VTNTMgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7bCSvG7D3/R4g/434hZXvr5ns3hx7yKL
 xdmmN+wWmx5fY7WYcX4fk8XaI3fZLQ5+eALkTn7J5sDhsWbeGkaP+93HmTw2L6n36NuyitHj
 8ya5ANYoLpuU1JzMstQifbsErow9Tw6yFPwRrfh28DVbA+NbwS5GTg4JAROJjrPvWLoYuTiE
 BHYwSux6tIGpi5EDKCEhsWUrB4QpLHH4cDFIuZDAW0aJ3nN6ILawgKnEhXs3WUFaRQSWMEos
 /dDPCpJgFsiTeL/7IjtEw2NGiTkLckFsNgFViYkr7rOB2LwCdhIrljUzg9gsQPG7C3aAxUUF
 IiRa7v9hh6gRlDg58wkLiM0pYC/x+NZfRoj56hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgW
 kvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4NjR0trBuGfV
 B71DjEwcjIcYJTiYlUR41YzS44V4UxIrq1KL8uOLSnNSiw8xSnOwKInzfp21ME5IID2xJDU7
 NbUgtQgmy8TBKdXApHXdUFn/1NPkgETVV3o+hgkyrD9tl1j+lrB9colbYc6rpDnfXWsTT8wO
 zxT36XVVua3J6XqmflOJdX2oKte53i3/18YxX8svStRu/alaWpd+Z+KOjs8ntc+FzeeW/+fo
 sSQui4ntjtPx6udqlYU7FRwd1dK4y92zm9mcNxqdnn/nwdGjb2xNXR5VXth3jeGn6fW3R8rL
 DGfozfpUErKa33mG75vSxy+OvVz5VW9CenVmNVtbghjH7ECe+SybZt7WOW8XoDqZ6WnN4cea
 irxFMbtWr87x3tX2IsbsUEPxI7m0vK7IWYuVvxRt5N2fpvBxg13zxwYRHb6PRxviXMIemzXd
 bXLv45Rd1RB11UOJpTgj0VCLuag4EQAfOEK0DAMAAA==
X-CMS-MailID: 20200921011024epcas1p2b26ae07e221b20cdfc80561214578938
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b
References: <CGME20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b@eucas1p1.samsung.com>
 <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
 <fedadf3b-f9f8-b959-6e25-e687ad8a78f3@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyZWssCgoyMC4gOS4gNC4g7Jik7ZuEIDQ6Mjjsl5AgTWFyZWsgU3p5cHJvd3NraSDsnbQo
6rCAKSDsk7Qg6riAOgo+IEhpIFJvYmluLAo+IAo+IE9uIDAzLjA5LjIwMjAgMjI6NTEsIFJvYmlu
IE11cnBoeSB3cm90ZToKPj4gU2luY2UgY29tbWl0IDk0OTViN2U5MmY3MSAoImRyaXZlciBjb3Jl
OiBwbGF0Zm9ybTogSW5pdGlhbGl6ZSBkbWFfcGFybXMKPj4gZm9yIHBsYXRmb3JtIGRldmljZXMi
KSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSBhbHJlYWR5IHByb3ZpZGVzIGEKPj4gZG1hX3Bhcm1z
IHN0cnVjdHVyZSwgc28gd2UgY2FuIHNhdmUgYWxsb2NhdGluZyBhbm90aGVyIG9uZS4KPj4KPj4g
QWxzbyB0aGUgRE1BIHNlZ21lbnQgc2l6ZSBpcyBzaW1wbHkgYSBzaXplLCBub3QgYSBiaXRtYXNr
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29t
Pgo+IAo+IEkndmUgc2VudCBhIHNpbWlsYXIgcGF0Y2ggb3ZlciAyIG1vbnRocyBhZ28sIGJ1dCBp
dCBsb29rcyBpdCBnb3QgbG9zdDoKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2
ZWwvMjAyMDA3MDcxMTA4MjcuMzc2MC0xLW0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbS8KPiAKPiBJ
bmtpLCBjb3VsZCBZb3UgcXVldWUgaXQgZm9yIG1lcmdlPwoKT29wcywgc29ycnkuIFJldmlld2Vk
IGFscmVhZHkgYnV0IGZvcmdvdCB0byBtZXJnZS4KClRoYW5rcywKSW5raSBEYWUKCj4gCj4+IC0t
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kbWEuYyB8IDI2ICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDI1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rt
YS5jCj4+IGluZGV4IDU4Yjg5ZWMxMWIwZS4uOWYyNWE1ZWJiZjdkIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZG1hLmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RtYS5jCj4+IEBAIC0zMSwyMyArMzEsNiBAQAo+PiAg
ICNkZWZpbmUgRVhZTk9TX0RFVl9BRERSX1NUQVJUCTB4MjAwMDAwMDAKPj4gICAjZGVmaW5lIEVY
WU5PU19ERVZfQUREUl9TSVpFCTB4NDAwMDAwMDAKPj4gICAKPj4gLXN0YXRpYyBpbmxpbmUgaW50
IGNvbmZpZ3VyZV9kbWFfbWF4X3NlZ19zaXplKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gLXsKPj4g
LQlpZiAoIWRldi0+ZG1hX3Bhcm1zKQo+PiAtCQlkZXYtPmRtYV9wYXJtcyA9IGt6YWxsb2Moc2l6
ZW9mKCpkZXYtPmRtYV9wYXJtcyksIEdGUF9LRVJORUwpOwo+PiAtCWlmICghZGV2LT5kbWFfcGFy
bXMpCj4+IC0JCXJldHVybiAtRU5PTUVNOwo+PiAtCj4+IC0JZG1hX3NldF9tYXhfc2VnX3NpemUo
ZGV2LCBETUFfQklUX01BU0soMzIpKTsKPj4gLQlyZXR1cm4gMDsKPj4gLX0KPj4gLQo+PiAtc3Rh
dGljIGlubGluZSB2b2lkIGNsZWFyX2RtYV9tYXhfc2VnX3NpemUoc3RydWN0IGRldmljZSAqZGV2
KQo+PiAtewo+PiAtCWtmcmVlKGRldi0+ZG1hX3Bhcm1zKTsKPj4gLQlkZXYtPmRtYV9wYXJtcyA9
IE5VTEw7Cj4+IC19Cj4+IC0KPj4gICAvKgo+PiAgICAqIGRybV9pb21tdV9hdHRhY2hfZGV2aWNl
LSBhdHRhY2ggZGV2aWNlIHRvIGlvbW11IG1hcHBpbmcKPj4gICAgKgo+PiBAQCAtNjksOSArNTIs
NyBAQCBzdGF0aWMgaW50IGRybV9pb21tdV9hdHRhY2hfZGV2aWNlKHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm1fZGV2LAo+PiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAgCX0KPj4gICAKPj4gLQlyZXQg
PSBjb25maWd1cmVfZG1hX21heF9zZWdfc2l6ZShzdWJkcnZfZGV2KTsKPj4gLQlpZiAocmV0KQo+
PiAtCQlyZXR1cm4gcmV0Owo+PiArCWRtYV9zZXRfbWF4X3NlZ19zaXplKHN1YmRydl9kZXYsIFVJ
TlRfTUFYKTsKPj4gICAKPj4gICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSTV9ETUFfVVNFX0lP
TU1VKSkgewo+PiAgIAkJLyoKPj4gQEAgLTg5LDkgKzcwLDYgQEAgc3RhdGljIGludCBkcm1faW9t
bXVfYXR0YWNoX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiwKPj4gICAJCXJldCA9
IGlvbW11X2F0dGFjaF9kZXZpY2UocHJpdi0+bWFwcGluZywgc3ViZHJ2X2Rldik7Cj4+ICAgCX0K
Pj4gICAKPj4gLQlpZiAocmV0KQo+PiAtCQljbGVhcl9kbWFfbWF4X3NlZ19zaXplKHN1YmRydl9k
ZXYpOwo+PiAtCj4+ICAgCXJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiBAQCAtMTE0LDggKzky
LDYgQEAgc3RhdGljIHZvaWQgZHJtX2lvbW11X2RldGFjaF9kZXZpY2Uoc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYsCj4+ICAgCQlhcm1faW9tbXVfYXR0YWNoX2RldmljZShzdWJkcnZfZGV2LCAq
ZG1hX3ByaXYpOwo+PiAgIAl9IGVsc2UgaWYgKElTX0VOQUJMRUQoQ09ORklHX0lPTU1VX0RNQSkp
Cj4+ICAgCQlpb21tdV9kZXRhY2hfZGV2aWNlKHByaXYtPm1hcHBpbmcsIHN1YmRydl9kZXYpOwo+
PiAtCj4+IC0JY2xlYXJfZG1hX21heF9zZWdfc2l6ZShzdWJkcnZfZGV2KTsKPj4gICB9Cj4+ICAg
Cj4+ICAgaW50IGV4eW5vc19kcm1fcmVnaXN0ZXJfZG1hKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0s
IHN0cnVjdCBkZXZpY2UgKmRldiwKPiAKPiBCZXN0IHJlZ2FyZHMKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
