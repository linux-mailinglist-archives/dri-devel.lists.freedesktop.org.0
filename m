Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E58DD3A12
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 09:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7BA6EBBC;
	Fri, 11 Oct 2019 07:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201DA6EBBC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:33:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191011073356euoutp0210adf7913a0f6991e9bd34310108a70e~Mh2SwvjaL0964709647euoutp02N
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:33:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191011073356euoutp0210adf7913a0f6991e9bd34310108a70e~Mh2SwvjaL0964709647euoutp02N
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191011073356eucas1p29466f4daa169253abfc64700e8ace83f~Mh2SiP1jS2249122491eucas1p2z;
 Fri, 11 Oct 2019 07:33:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BD.92.04469.46030AD5; Fri, 11
 Oct 2019 08:33:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191011073355eucas1p1b0986792eed078f66c9711b844c5e48b~Mh2SLH-tD2821628216eucas1p1V;
 Fri, 11 Oct 2019 07:33:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191011073355eusmtrp17151d3307fceb5f0072a8cfd149aa988~Mh2SKV3DD0118301183eusmtrp1C;
 Fri, 11 Oct 2019 07:33:55 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-6c-5da03064d2d0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 71.DE.04166.36030AD5; Fri, 11
 Oct 2019 08:33:55 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191011073355eusmtip1237d7101a2ecb708f649650105fb8614~Mh2Rm0jpK0683006830eusmtip1O;
 Fri, 11 Oct 2019 07:33:55 +0000 (GMT)
Subject: Re: [PATCH v2] drm: bridge: adv7511: Enable SPDIF DAI
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <b3ab3f90-6657-a58b-e022-c23d0e412d27@samsung.com>
Date: Fri, 11 Oct 2019 09:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191007100641.25599-1-bogdan.togorean@analog.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju23d2dlxbns1qHxZFq34YlQpBBxMpuh36Fd0oReqUJxOdyo6X
 7EJRGjrb8JK3aWmWpmVo3pWU0kjFHJWOdJFTdEVrZmazG2rbziT/Pe/7PM/3Pg98BJRbhN5E
 RHQcq45mopS4GGt8+duwJcyvJNTvb5WM0hp6BFRl9xxGXUu5Ban5xkxIDdgnccr48zOkemxG
 jErLvC+i+luLcKpDF0I9HauGVF1tDtwpoa3GXfTkYIqIbpspwejC1AIh3Z3xVkB/NRhEdNPM
 iJA2p3cJ6CnbuIiebDfi9DNtNkZP1645KAkWB4axUREJrNo36JT4XFX5KIy9ITv/XKPDrwKr
 VAM8CERuQ7deaDENEBNysgKg6pwinB9+AJSX3ORmph3DtzbBguVu2wDkiQcAFVc9d6smABod
 aIROlRcZhDJ1LS7HcvIwsk9lu0TQKbL0TrgInPRBs3VDuBNLHYac1nsujJEbUe6wRagBBLGC
 PI567QwvkaGegnHMiT3IneiXKdMlh+RadL2hEPJYgUzjxQLnLUSmEei28bo79h6kmW8HPPZC
 1q56EY9Xo97smxiPryBzRTLkzakANdS0QJ7YgTq73rgCQUfo6lZffr0LmVI6oXONyGVocELG
 Z1iGshrz3GspSr0h59XrkLmvwf2gApW9tuMZQKlf1Ey/qI1+URv9/7slAHsIFGw8pwpnOf9o
 NnErx6i4+OjwrWdiVLXA8fl657q+NwP729MdgCSAUiLNX1scKhcyCVySqgMgAiqXS0v1RaFy
 aRiTdIFVx5xUx0exXAdYRWBKhfTikpEQORnOxLGRLBvLqhdYAeHhfRXg+3+ceLz33W8/GGwb
 zo8aMq9f2v/ZJJa1z3AbAx71zfpXXrQeOQxRgGrln9JhW6AgYUXNt7HIfQrPYxZa9zEx/ax+
 83v7ZMQTQ9aBL20hPpakDXe+x+7WZ6w5WnZo7pOkXru9EGuS+F76UJ4bp/NhL3e+qvnb7NnU
 3T4V6Ls9NFiJcecY/01QzTH/ADiF8PF4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsVy+t/xu7rJBgtiDZaeNrfoPXeSyWLliX8s
 Fk2tU5gt/m+byGxx5et7Nour318yW5x8c5XFonPiEnaLy7vmsFkc6ou22PN4PbPF5k1TmR14
 PF5ddfR4f6OV3WPvtwUsHrM7ZrJ6nJhwicnj3blz7B7bvz1g9bjffZzJ4+ObJ+we7/ddZfM4
 0DuZxePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy
 1CJ9uwS9jDXLHjIXtAlWHOzqY2tgfMXbxcjJISFgIrFw7xVmEFtIYCmjxIaZMRBxcYnd898y
 Q9jCEn+udbF1MXIB1bxmlHgyaxFYQljATmJi304mEFtEIFji498b7CBFzAJvGSUeHWllguiY
 zChx4dBcNpAqNgFNib+bb4LZvEDdU3ctBrNZBFQlpt17ygpiiwpESDzffoMRokZQ4uTMJywg
 NqeAg8SPWxPB6pkF1CX+zLvEDGHLSzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZV
 jCKppcW56bnFhnrFibnFpXnpesn5uZsYgbG+7djPzTsYL20MPsQowMGoxMP7QXF+rBBrYllx
 Ze4hRgkOZiUR3kWz5sQK8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wDeWVxBuaGppbWBqa
 G5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamDs7VLo6FI8W/uXIVH19dsDUstn7lWM
 tuRUueT/tobhwr4ej7WT9p+qfW/0Uj44ivO33/rVASfznk+/lfG2f+eLK+dX9Sbnbpju2Plv
 S5LZ1n2ej6tr+VjMvp9nmz2p23d70zH7fQbPn79fzJLJHbFt/Ubu7xrZc3zc5gb5e0dEuEg/
 Pr7nhfw2JZbijERDLeai4kQAxHwoKgsDAAA=
X-CMS-MailID: 20191011073355eucas1p1b0986792eed078f66c9711b844c5e48b
X-Msg-Generator: CA
X-RootMTR: 20191007100945epcas2p15319b2e323c67b9ed8a5a4f56f5f7e7a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191007100945epcas2p15319b2e323c67b9ed8a5a4f56f5f7e7a
References: <CGME20191007100945epcas2p15319b2e323c67b9ed8a5a4f56f5f7e7a@epcas2p1.samsung.com>
 <20191007100641.25599-1-bogdan.togorean@analog.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1570779236;
 bh=0cRp63auWCMeQJ0hBCZd2uWeAtjJbMYTxVjcpcdjMRs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FkciRwiuU4wRzf9qxvWF8EMo05i0be65xgB1zeHW/Zy01elllAEzAevEDcwGgwhA7
 XLUfPvguAfSUkU+DcRxK1vjQLlSG6VQ8GPkCJg0J49LnrHQl+V5ZnDWwTF6KChfHAx
 UJBUpp7wFlM431P2M3e/0pr7+zsItTOlLlgesQoY=
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, rfontana@redhat.com,
 Laurent.pinchart@ideasonboard.com, tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMTAuMjAxOSAxMjowNiwgQm9nZGFuIFRvZ29yZWFuIHdyb3RlOgo+IEFEVjc1MTEgc3Vw
cG9ydCBJMlMgb3IgU1BESUYgYXMgYXVkaW8gaW5wdXQgaW50ZXJmYWNlcy4gVGhpcyBjb21taXQK
PiBlbmFibGUgc3VwcG9ydCBmb3IgU1BESUYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCb2dkYW4gVG9n
b3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgoKClJldmlld2VkLWJ5OiBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKCkxldCdzIHdhaXQgZmV3IGRheXMgd2l0aCBx
dWV1aW5nLCB3aXRoIGhvcGUgc29tZWJvZHkgd2lsbCB0ZXN0IGl0LgoKCsKgLS0KUmVnYXJkcwpB
bmRyemVqCgoKPiAtLS0KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBhZGQgZm9yZ290dGVuIGJyZWFr
IHN0YXRlbWVudAo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1
ZGlvLmMgfCAxNCArKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExX2F1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRp
by5jCj4gaW5kZXggYTQyODE4NWJlMmMxLi4xZTliMTI4ZDIyOWIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMKPiBAQCAtMTE5LDYgKzEx
OSw5IEBAIGludCBhZHY3NTExX2hkbWlfaHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKPiAgCQlhdWRpb19zb3VyY2UgPSBBRFY3NTExX0FVRElPX1NPVVJDRV9JMlM7Cj4g
IAkJaTJzX2Zvcm1hdCA9IEFEVjc1MTFfSTJTX0ZPUk1BVF9MRUZUX0o7Cj4gIAkJYnJlYWs7Cj4g
KwljYXNlIEhETUlfU1BESUY6Cj4gKwkJYXVkaW9fc291cmNlID0gQURWNzUxMV9BVURJT19TT1VS
Q0VfU1BESUY7Cj4gKwkJYnJlYWs7Cj4gIAlkZWZhdWx0Ogo+ICAJCXJldHVybiAtRUlOVkFMOwo+
ICAJfQo+IEBAIC0xNzUsMTEgKzE3OCwyMSBAQCBzdGF0aWMgaW50IGF1ZGlvX3N0YXJ0dXAoc3Ry
dWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+ICAJLyogdXNlIEF1ZGlvIGluZm9mcmFtZSB1
cGRhdGVkIGluZm8gKi8KPiAgCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIEFE
Vjc1MTFfUkVHX0dDKDEpLAo+ICAJCQkJQklUKDUpLCAwKTsKPiArCS8qIGVuYWJsZSBTUERJRiBy
ZWNlaXZlciAqLwo+ICsJaWYgKGFkdjc1MTEtPmF1ZGlvX3NvdXJjZSA9PSBBRFY3NTExX0FVRElP
X1NPVVJDRV9TUERJRikKPiArCQlyZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLCBB
RFY3NTExX1JFR19BVURJT19DT05GSUcsCj4gKwkJCQkgICBCSVQoNyksIEJJVCg3KSk7Cj4gKwo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGF1ZGlvX3NodXRkb3duKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKPiAgewo+ICsJc3RydWN0IGFkdjc1MTEgKmFkdjc1
MTEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4gKwlpZiAoYWR2NzUxMS0+YXVkaW9fc291
cmNlID09IEFEVjc1MTFfQVVESU9fU09VUkNFX1NQRElGKQo+ICsJCXJlZ21hcF91cGRhdGVfYml0
cyhhZHY3NTExLT5yZWdtYXAsIEFEVjc1MTFfUkVHX0FVRElPX0NPTkZJRywKPiArCQkJCSAgIEJJ
VCg3KSwgMCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgYWR2NzUxMV9oZG1pX2kyc19nZXRfZGFp
X2lkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LAo+IEBAIC0yMTMsNiArMjI2
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZG1pX2NvZGVjX3BkYXRhIGNvZGVjX2RhdGEgPSB7
Cj4gIAkub3BzID0gJmFkdjc1MTFfY29kZWNfb3BzLAo+ICAJLm1heF9pMnNfY2hhbm5lbHMgPSAy
LAo+ICAJLmkycyA9IDEsCj4gKwkuc3BkaWYgPSAxLAo+ICB9Owo+ICAKPiAgaW50IGFkdjc1MTFf
YXVkaW9faW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBhZHY3NTExICphZHY3NTExKQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
