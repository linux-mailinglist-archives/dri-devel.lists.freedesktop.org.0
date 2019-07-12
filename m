Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671A66B08
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 12:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FC86E347;
	Fri, 12 Jul 2019 10:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA966E347
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:45:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190712104549euoutp01c4f70bc3929a0f192dc8afe981276f8b~wow2n-eFP3211832118euoutp01B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:45:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190712104549euoutp01c4f70bc3929a0f192dc8afe981276f8b~wow2n-eFP3211832118euoutp01B
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190712104548eucas1p116308d1f3328809effaf08d7718ed583~wow1s_joc2269022690eucas1p1J;
 Fri, 12 Jul 2019 10:45:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 29.93.04377.CD4682D5; Fri, 12
 Jul 2019 11:45:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190712104547eucas1p145220086debe94a8605502a235450e4d~wow02UqiW2083120831eucas1p1G;
 Fri, 12 Jul 2019 10:45:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190712104547eusmtrp1bd1ba82f311f3346eb57a2dbed5f63e0~wow0oDhAS2846228462eusmtrp12;
 Fri, 12 Jul 2019 10:45:47 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-1b-5d2864dc2612
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.C4.04140.BD4682D5; Fri, 12
 Jul 2019 11:45:47 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190712104546eusmtip105110336ffc7dc8226bfe3c32e7d0337~wowz7tU-b2407824078eusmtip1L;
 Fri, 12 Jul 2019 10:45:46 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/bridge: sii902x: make audio mclk optional
To: Olivier Moysan <olivier.moysan@st.com>, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@st.com,
 alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jsarha@ti.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <beef9917-1e8b-1ddb-740b-5b2ca8cd379c@samsung.com>
Date: Fri, 12 Jul 2019 12:45:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRiGe/eeczwuJ8dl+ZQf0SisIK3wxxuGfRBxog+iH0GF1SkPa+RH
 bVlZiFFpc2Z+YTYXaaBpy9BmaplGW9GSlWSlzig1nIjZ8IdmCpltnkX+u9/7ee6H64aXxcos
 ZgmrST4japOFRBUjpxpfT7Wv+ZKwMn7t795QktveJiOPXA5EbpS5aDLTWIBJ2at2mnz6OcqQ
 zl/DmLT96KRITraeJtkFFX7EMtBFk4/Ntxli6PIkKrs7ZMR24xApajExJLP1ld/mIL7mTg3i
 R52ZfnzrRDnFm/RGmreYsxn+Tf4HGd800U/zfTl2GV9fkcG/yC2ieOvzdfzgZCvm7c4mGT9m
 idgbeFC+MUFM1JwVtdFxR+UnCkvK8al7Yec7fvVRl9DoIgPyZ4GLgboH7xgDkrNKrhpBxYQD
 S49xBGbjE1p6jCEoLuxl/kVqO01IGlQhGH445dtyI6gdqZAZEMsu4LbD28ZwbyCY68JQ4ua9
 muFWwXR9z+whBRcHTr0VezXFrYAW5xTl1Qu5/TBVnu3bCYI2o2vW9/ecHB/pnvUxtxSuNJiw
 pEPgs6tM5mUA7j4LP6wfkES6DYbMIz7qBfDd/thP0mHgKLpOSToD+qqvYimsR9BQ9xRLg1h4
 ae+gvWWwh7q2OVqyt4D77SPKawMXCE53kMQQCIWNJViyFaDPUkrby6DvXYPvYAhUvv/po+Hh
 Vvcok4+Wlc5pWTqnWemcZqX/GcoRZUYhYqouSS3q1ieL56J0QpIuNVkddTwlyYI8v9Pxxz7+
 BDX/PmZDHItUAQrnhsh4JS2c1aUl2RCwWBWsMM94LEWCkHZB1KYc0aYmijobCmUpVYji4rz+
 Q0pOLZwRT4riKVH7bypj/ZdcQjGawxm21ysFLFxYcS1sYKe1ekzdEqCJykvpmewduDl0qyq+
 LDhvMryq0Lr52dfEkcg9GsO3x8un04vYO9WB+4lm/qJiuBtxX6CbrbvqHxTsWxiUtmswZ+n6
 gHb3jmddJ9vk0Qm711rUxkjX5cVqh/pAf1zsaWNTZIRpa2XPpnRGRelOCOtWY61O+AvWDzUk
 mQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4Xd3bKRqxBh/aFSx6z51kstj45DSj
 Rd/8J6wW/7dNZLaYf+Qcq8WVr+/ZLK5+f8lscfLNVRaL7s4OVovOiUvYLTY9vsZqcXnXHDaL
 rmtAHUuvX2SyONQXbTF5z2w2i9a9R9gdBD3WzFvD6PH+Riu7x95vC1g8ZnfMZPXYtKqTzePE
 hEtMHtu/PWD1uN99nMlj85J6jwO9k1k8Du4z9Hj6Yy+zx/Eb25k8Pm+SC+CL0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MuYNH0Bc8EymYqL3++z
 NDC+F+ti5OSQEDCRWH91NmMXIxeHkMBSRok5W+4yQiTEJXbPf8sMYQtL/LnWxQZR9JpRYllv
 I3sXIweHsICbxJltsiBxEYFrzBK/dnaxQBRdZZT4suYCWDebgKbE38032UBsXgE7iRsdB8Hi
 LAKqEntu/GQBGSQqECZx9EQeRImgxMmZT1hAbE6g+V9eXwdrZRZQl/gz7xIzhC0v0bx1NpQt
 LnHryXymCYyCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEJoVt
 x35u2cHY9S74EKMAB6MSD+8NS/VYIdbEsuLK3EOMEhzMSiK8q/4DhXhTEiurUovy44tKc1KL
 DzGaAv02kVlKNDkfmLDySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFw
 SjUwMs9WytnMlb5UQ3G+zLZFjBdrTYs2Jv1LdJvrkmU15dkL26jEl9+9WPaxbnwVGb+cZbX6
 uxzmWhv+j8f0hBZf4Vq+i/fXL5ckmdbce8v+PplyNnC2jaPigQfb9useeK8n/sf4oEqJl5Dz
 nl/2MUlZjbo7n8jH57Lrza48OMd5WsLW8MgJn9IvKbEUZyQaajEXFScCAFW8Xj8gAwAA
X-CMS-MailID: 20190712104547eucas1p145220086debe94a8605502a235450e4d
X-Msg-Generator: CA
X-RootMTR: 20190702154808epcas2p263688e1a3f29a656a86f5feda73aa6ab
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154808epcas2p263688e1a3f29a656a86f5feda73aa6ab
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <CGME20190702154808epcas2p263688e1a3f29a656a86f5feda73aa6ab@epcas2p2.samsung.com>
 <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562928349;
 bh=aCo4dkE6rEOyv2yvT87ApQTTuybWLW9vtX/jlJ54q9g=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=YwewwX0Mp+Mem3KgBtsDUdLL2+1hcKtgRwbpppRtPJ/CrVdHjgsz/cTY331Zy58o5
 hVjNuuNcmP5CB0Maubw/LblidIuJIOfTrGRFMPQe6w5h27a0mhdnjwBCIuK20Lzi9A
 zZgnDgs+93b/SWwjkFZriXgs7cTS/1L3IhnEAfeU=
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

T24gMDIuMDcuMjAxOSAxNzo0NywgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gVGhlIG1hc3RlciBj
bG9jayBvbiBpMnMgYnVzIGlzIG5vdCBtYW5kYXRvcnksCj4gYXMgc2lpOTAyWCBpbnRlcm5hbCBQ
TEwgY2FuIGJlIHVzZWQgaW5zdGVhZC4KPiBNYWtlIHVzZSBvZiBtY2xrIG9wdGlvbmFsLgo+Cj4g
Rml4ZXM6IGZmNTc4MTYzNGM0MSAoImRybS9icmlkZ2U6IHNpaTkwMng6IEltcGxlbWVudCBIRE1J
IGF1ZGlvIHN1cHBvcnQiKQo+Cj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZp
ZXIubW95c2FuQHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zaWk5MDJ4LmMKPiBpbmRleCAzNmFjYzI1NmU2N2UuLmEwOGJkOWZkYzA0NiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gQEAgLTU2MiwxOSArNTYyLDIxIEBAIHN0YXRpYyBp
bnQgc2lpOTAyeF9hdWRpb19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRh
LAo+ICAJCX0KPiAgCX0KPiAgCj4gLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoc2lpOTAyeC0+
YXVkaW8ubWNsayk7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJZGV2X2VycihkZXYsICJFbmFibGluZyBt
Y2xrIGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiArCWlmIChz
aWk5MDJ4LT5hdWRpby5tY2xrKSB7Cj4gKwkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHNpaTkw
MngtPmF1ZGlvLm1jbGspOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJZGV2X2VycihkZXYsICJFbmFi
bGluZyBtY2xrIGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gKwkJCXJldHVybiByZXQ7Cj4gKwkJfQo+
ICAKPiAtCW1jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiAr
CQltY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoc2lpOTAyeC0+YXVkaW8ubWNsayk7Cj4gIAo+IC0J
cmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNsa19kaXYoJmkyc19jb25maWdfcmVnLCBwYXJhbXMtPnNh
bXBsZV9yYXRlLAo+IC0JCQkJICAgICAgbWNsa19yYXRlKTsKPiAtCWlmIChtY2xrX3JhdGUgIT0g
cmV0ICogcGFyYW1zLT5zYW1wbGVfcmF0ZSkKPiAtCQlkZXZfZGJnKGRldiwgIkluYWNjdXJhdGUg
cmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0gJXUpXG4iLAo+IC0JCQltY2xrX3JhdGUsIHJldCwg
cGFyYW1zLT5zYW1wbGVfcmF0ZSk7Cj4gKwkJcmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNsa19kaXYo
Jmkyc19jb25maWdfcmVnLAo+ICsJCQkJCSAgICAgIHBhcmFtcy0+c2FtcGxlX3JhdGUsIG1jbGtf
cmF0ZSk7Cj4gKwkJaWYgKG1jbGtfcmF0ZSAhPSByZXQgKiBwYXJhbXMtPnNhbXBsZV9yYXRlKQo+
ICsJCQlkZXZfZGJnKGRldiwgIkluYWNjdXJhdGUgcmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0g
JXUpXG4iLAo+ICsJCQkJbWNsa19yYXRlLCByZXQsIHBhcmFtcy0+c2FtcGxlX3JhdGUpOwo+ICsJ
fQo+ICAKPiAgCW11dGV4X2xvY2soJnNpaTkwMngtPm11dGV4KTsKPiAgCj4gQEAgLTY0MCw3ICs2
NDIsOCBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKPiAgCW11dGV4X3VubG9jaygmc2lpOTAyeC0+bXV0ZXgpOwo+ICAK
PiAgCWlmIChyZXQpIHsKPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUoc2lpOTAyeC0+YXVkaW8u
bWNsayk7Cj4gKwkJaWYgKHNpaTkwMngtPmF1ZGlvLm1jbGspCj4gKwkJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKCgoiaWYiIGNsYXVzZSBpcyBub3QgbmVjZXNz
YXJ5CgoKPiAgCQlkZXZfZXJyKGRldiwgIiVzOiBoZG1pIGF1ZGlvIGVuYWJsZSBmYWlsZWQ6ICVk
XG4iLCBfX2Z1bmNfXywKPiAgCQkJcmV0KTsKPiAgCX0KPiBAQCAtNjU5LDcgKzY2Miw4IEBAIHN0
YXRpYyB2b2lkIHNpaTkwMnhfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lk
ICpkYXRhKQo+ICAKPiAgCW11dGV4X3VubG9jaygmc2lpOTAyeC0+bXV0ZXgpOwo+ICAKPiAtCWNs
a19kaXNhYmxlX3VucHJlcGFyZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiArCWlmIChzaWk5MDJ4
LT5hdWRpby5tY2xrKQoKZGl0dG8KCj4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNpaTkwMngt
PmF1ZGlvLm1jbGspOwo+ICB9Cj4gIAo+ICBpbnQgc2lpOTAyeF9hdWRpb19kaWdpdGFsX211dGUo
c3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLCBib29sIGVuYWJsZSkKPiBAQCAtNzUyLDkg
Kzc1NiwxMiBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3Qgc2lp
OTAyeCAqc2lpOTAyeCwKPiAgCj4gIAlzaWk5MDJ4LT5hdWRpby5tY2xrID0gZGV2bV9jbGtfZ2V0
KGRldiwgIm1jbGsiKTsKPiAgCWlmIChJU19FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpIHsKPiAt
CQlkZXZfZXJyKGRldiwgIiVzOiBObyBjbG9jayAoYXVkaW8gbWNsaykgZm91bmQ6ICVsZFxuIiwK
PiAtCQkJX19mdW5jX18sIFBUUl9FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpOwo+IC0JCXJldHVy
biAwOwo+ICsJCWlmIChQVFJfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspICE9IC1FTk9FTlQpIHsK
PiArCQkJZGV2X2VycihkZXYsICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZvdW5kOiAlbGRc
biIsCj4gKwkJCQlfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7Cj4gKwkJ
CXJldHVybiBQVFJfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspOwo+ICsJCX0KPiArCQlzaWk5MDJ4
LT5hdWRpby5tY2xrID0gTlVMTDsKCgpkZXZtX2Nsa19nZXRfb3B0aW9uYWwgc2hvdWxkIGJlIHVz
ZWQgaGVyZS4KClN1bW1hcml6aW5nLCBjbGsgZnJhbWV3b3JrIHN1cHBvcnRzIE5VTEwgY2xvY2tz
IHNvIHlvdSBjYW4gYWRqdXN0IGNvZGUKdG8gYmVuZWZpdCBmcm9tIGl0OiBubyBuZWVkIHRvIGNo
ZWNrcyAiaWYgKHNpaTkwMngtPmF1ZGlvLm1jbGspIi4gVGhlCm9ubHkgcGxhY2UgeW91IHNob3Vs
ZCBjYXJlIGlzIG5lYXIgY2xrX2dldF9yYXRlLCBmb3IgbnVsbCBjbG9jayBpdCB3aWxsCnJldHVy
biAwLCBzbyB5b3Ugc2hvdWxkIHJlYWN0IGFwcHJvcHJpYXRlbHkuCgpXaXRoIHRoYXQgY2hhbmdl
ZDoKClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAt
LQpSZWdhcmRzCkFuZHJ6ZWoKCgo+ICAJfQo+ICAKPiAgCXNpaTkwMngtPmF1ZGlvLnBkZXYgPSBw
bGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0YSgKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
