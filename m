Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA1B5F821
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 14:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10DC6E33A;
	Thu,  4 Jul 2019 12:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30926E33A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:31:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190704123126euoutp02c710c42af403c736a31bbb40f2114d60~uNCyNLWeh1577515775euoutp021
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:31:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190704123126euoutp02c710c42af403c736a31bbb40f2114d60~uNCyNLWeh1577515775euoutp021
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190704123126eucas1p2f3d92d64a5de5ae76968af4d6b880232~uNCx0eZ351668316683eucas1p2U;
 Thu,  4 Jul 2019 12:31:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E6.AE.04377.D91FD1D5; Thu,  4
 Jul 2019 13:31:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190704123125eucas1p2a54dc6e43044794ff7f4a5800e89f90c~uNCxBT1Os1685416854eucas1p2V;
 Thu,  4 Jul 2019 12:31:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190704123125eusmtrp1ab013178c6ac82143443d39cfc197edf~uNCwzOR4A1291112911eusmtrp1p;
 Thu,  4 Jul 2019 12:31:25 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-d0-5d1df19d169a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.E7.04146.D91FD1D5; Thu,  4
 Jul 2019 13:31:25 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190704123124eusmtip2e4dd94386d783826831f38fafa3ff19a~uNCwPgulL1170711707eusmtip2S;
 Thu,  4 Jul 2019 12:31:24 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
Date: Thu, 4 Jul 2019 14:31:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702154419.20812-3-robdclark@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87rzPsrGGnw/wGjRe+4kk8X/bROZ
 La58fc9m0TlxCbvFxP1n2S0u75rDZnHt52Nmi+cLfzBb3N1wltGB02N2w0UWj73fFrB47Jx1
 l91jdsdMVo/t3x6wetzvPs7k8XmTXAB7FJdNSmpOZllqkb5dAlfGthvTmQvmilU0LrzK2sD4
 WbCLkYNDQsBE4m07RxcjJ4eQwApGiclbAiDsL4wSxxvSuhi5gOzPjBIrG+6wgSRA6nd92cwM
 kVjOKHF70xdGiI63jBLz7muA2MICdhLtlz+zgtgiAi4SJy79BrOZBVqYJDZurQWx2QQ0Jf5u
 vgk2lBeofv+LU+wgNouAisTOD6/A6kUFIiQub9nFCFEjKHFy5hMWEJtTwFKi/d8/NoiZ8hLN
 W2czQ9jiEreezGcCOU5C4By7xNZTs9kgvnSROHPZEeIBYYlXx7ewQ9gyEqcn97BA2PUS91e0
 MEP0djBKbN2wkxkiYS1x+PhFVpA5zEBHr9+lDxF2lDj2eR0rxHg+iRtvBSFO4JOYtG06M0SY
 V6KjTQiiWlHi/tmtUAPFJZZe+Mo2gVFpFpLHZiF5ZhaSZ2Yh7F3AyLKKUTy1tDg3PbXYKC+1
 XK84Mbe4NC9dLzk/dxMjMEWd/nf8yw7GXX+SDjEKcDAq8fA+2CITK8SaWFZcmXuIUYKDWUmE
 9/tvoBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQZGNtbs
 /ppjvh78yZm/o2smb6mrt/Py598Q0WLp5LPg0JMfN2unb84xDzkf+HmxQkyo9eFMAbfUnOtf
 brdMDt3VyppbPdlb2/HcvUTf/R18nZq+W5kiRA7y/N5809DzZGXdiSplOV/nKcr2J/t3ue9b
 zJofWNu8YluTL1eB3v+jveX/ProK71FiKc5INNRiLipOBAD3PibKTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7pzP8rGGuz8zGnRe+4kk8X/bROZ
 La58fc9m0TlxCbvFxP1n2S0u75rDZnHt52Nmi+cLfzBb3N1wltGB02N2w0UWj73fFrB47Jx1
 l91jdsdMVo/t3x6wetzvPs7k8XmTXAB7lJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGx
 eayVkamSvp1NSmpOZllqkb5dgl7GthvTmQvmilU0LrzK2sD4WbCLkZNDQsBEYteXzcxdjFwc
 QgJLGSX2nvzNBJEQl9g9/y0zhC0s8edaFxtE0WtGiaZjl8GKhAXsJNovf2YFsUUEXCROXPrN
 ClLELNDGJHFxbxsrRMduoI6d81hAqtgENCX+br7JBmLzAnXvf3GKHcRmEVCR2PnhFdgkUYEI
 ib622VA1ghInZz4B6+UUsJRo//cPLM4soC7xZ94lZghbXqJ562woW1zi1pP5TBMYhWYhaZ+F
 pGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzQbcd+bt7BeGlj8CFGAQ5G
 JR7eB1tkYoVYE8uKK3MPMUpwMCuJ8H7/DRTiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGDy
 yCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwGh1y/N55p8Ah9x5
 2+uPlbxKztp04PDU2Yce8QZ99PA78uzm3ucrZOUr+z9JXWjpYeSt2HvoTL7Je0Ot6btnnZru
 F6OZoaLJmXrOcDqj97TZ66UPZh57ljJdQV1B9bnE67eGqQ69GbzGy171n2flD43QuHGlbEmo
 u+Z/20PHnBLqFpQeCPN6ukmJpTgj0VCLuag4EQDMShTl5gIAAA==
X-CMS-MailID: 20190704123125eucas1p2a54dc6e43044794ff7f4a5800e89f90c
X-Msg-Generator: CA
X-RootMTR: 20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03
References: <20190702154419.20812-1-robdclark@gmail.com>
 <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
 <20190702154419.20812-3-robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562243486;
 bh=2UbtQD8qfJhaojQj3snazROYVj3M0EWBwEnOMikNX2U=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pgGHgcl/kvQcsglLc0Gio74zo4CYkFU+NLSZgE1+NRF/SIwpor71PvyGudhDxJazn
 hipOsu4FqAClVIFawMBC3kEnnOXqF7r/Yy27k/tdlxc+EgaHb9LXXxHdBtL3P9/Ofv
 NLIvU/c9I2MRkOCdDFliPzKoVXU9DOtSWlgQBGEM=
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIuMDcuMjAxOSAxNzo0NCwgUm9iIENsYXJrIHdyb3RlOgo+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPgo+IEFkZCBhIGRlYnVnZnMgZmlsZSB0byBzaG93IHN0
YXR1cyByZWdpc3RlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bj
aHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2
LmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+IGlu
ZGV4IGYxYTI0OTNiODZkOS4uYTZmMjc2NDhjMDE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpLXNuNjVkc2k4Ni5jCj4gQEAgLTUsNiArNSw3IEBACj4gICAqLwo+ICAKPiAgI2luY2x1ZGUg
PGxpbnV4L2Nsay5oPgo+ICsjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgo+ICAjaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9pb3BvbGwuaD4KPiBAQCAtMTA5LDYgKzExMCw3IEBAIHN0cnVjdCB0aV9zbl9i
cmlkZ2Ugewo+ICAJc3RydWN0IGRybV9kcF9hdXgJCWF1eDsKPiAgCXN0cnVjdCBkcm1fYnJpZGdl
CQlicmlkZ2U7Cj4gIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvcgkJY29ubmVjdG9yOwo+ICsJc3RydWN0
IGRlbnRyeQkJCSpkZWJ1Z2ZzOwo+ICAJc3RydWN0IGRldmljZV9ub2RlCQkqaG9zdF9ub2RlOwo+
ICAJc3RydWN0IG1pcGlfZHNpX2RldmljZQkJKmRzaTsKPiAgCXN0cnVjdCBjbGsJCQkqcmVmY2xr
Owo+IEBAIC0xNzgsNiArMTgwLDQyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0
aV9zbl9icmlkZ2VfcG1fb3BzID0gewo+ICAJU0VUX1JVTlRJTUVfUE1fT1BTKHRpX3NuX2JyaWRn
ZV9zdXNwZW5kLCB0aV9zbl9icmlkZ2VfcmVzdW1lLCBOVUxMKQo+ICB9Owo+ICAKPiArc3RhdGlj
IGludCBzdGF0dXNfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKmRhdGEpCj4gK3sKPiAr
CXN0cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhID0gcy0+cHJpdmF0ZTsKPiArCXVuc2lnbmVkIGlu
dCByZWcsIHZhbDsKPiArCj4gKwlzZXFfcHV0cyhzLCAiU1RBVFVTIFJFR0lTVEVSUzpcbiIpOwo+
ICsKPiArCXBtX3J1bnRpbWVfZ2V0X3N5bmMocGRhdGEtPmRldik7Cj4gKwo+ICsJLyogSVJRIFN0
YXR1cyBSZWdpc3RlcnMsIHNlZSBUYWJsZSAzMSBpbiBkYXRhc2hlZXQgKi8KPiArCWZvciAocmVn
ID0gMHhmMDsgcmVnIDw9IDB4Zjg7IHJlZysrKSB7Cj4gKwkJcmVnbWFwX3JlYWQocGRhdGEtPnJl
Z21hcCwgcmVnLCAmdmFsKTsKPiArCQlzZXFfcHJpbnRmKHMsICJbMHglMDJ4XSA9IDB4JTA4eFxu
IiwgcmVnLCB2YWwpOwo+ICsJfQo+ICsKPiArCXBtX3J1bnRpbWVfcHV0KHBkYXRhLT5kZXYpOwo+
ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtERUZJTkVfU0hPV19BVFRSSUJVVEUoc3RhdHVz
KTsKPiArCj4gK3N0YXRpYyB2b2lkIHRpX3NuX2RlYnVnZnNfaW5pdChzdHJ1Y3QgdGlfc25fYnJp
ZGdlICpwZGF0YSkKPiArewo+ICsJcGRhdGEtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIo
InRpX3NuNjVkc2k4NiIsIE5VTEwpOwoKCklmIHNvbWUgZGF5IHdlIHdpbGwgaGF2ZSBib2FyZCB3
aXRoIHR3byBzdWNoIGJyaWRnZXMgdGhlcmUgd2lsbCBiZSBhCnByb2JsZW0uCgpBbnl3YXk6CgpS
ZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVn
YXJkcwpBbmRyemVqCgoKCj4gKwo+ICsJZGVidWdmc19jcmVhdGVfZmlsZSgic3RhdHVzIiwgMDYw
MCwgcGRhdGEtPmRlYnVnZnMsIHBkYXRhLAo+ICsJCQkmc3RhdHVzX2ZvcHMpOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgdm9pZCB0aV9zbl9kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3QgdGlfc25fYnJpZGdlICpw
ZGF0YSkKPiArewo+ICsJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKHBkYXRhLT5kZWJ1Z2ZzKTsK
PiArCXBkYXRhLT5kZWJ1Z2ZzID0gTlVMTDsKPiArfQo+ICsKPiAgLyogQ29ubmVjdG9yIGZ1bmNz
ICovCj4gIHN0YXRpYyBzdHJ1Y3QgdGlfc25fYnJpZGdlICoKPiAgY29ubmVjdG9yX3RvX3RpX3Nu
X2JyaWRnZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+IEBAIC04NjksNiArOTA3
LDggQEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCwKPiAgCj4gIAlkcm1fYnJpZGdlX2FkZCgmcGRhdGEtPmJyaWRnZSk7Cj4gIAo+ICsJdGlf
c25fZGVidWdmc19pbml0KHBkYXRhKTsKPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiBAQCAt
ODc5LDYgKzkxOSw4IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX3JlbW92ZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQo+ICAJaWYgKCFwZGF0YSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
Cj4gKwl0aV9zbl9kZWJ1Z2ZzX3JlbW92ZShwZGF0YSk7Cj4gKwo+ICAJb2Zfbm9kZV9wdXQocGRh
dGEtPmhvc3Rfbm9kZSk7Cj4gIAo+ICAJcG1fcnVudGltZV9kaXNhYmxlKHBkYXRhLT5kZXYpOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
