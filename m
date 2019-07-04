Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C2F5F977
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 15:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791B76E34C;
	Thu,  4 Jul 2019 13:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2A46E34C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 13:57:13 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so5505387eds.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 06:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFyR56GUnLHy2geI3ziIJleBntP257KjNAIucLrVbto=;
 b=GM2j9ZdeZxNbODQjRW7nf4EwPOAjsgnzq4YwgnNMT2ODSIwyQrk0bzN2f6LFstzeK3
 EAqQFHtlEQoOVLIue/W7zcnXNTT0EHqd59v+gbUmx5jJDcLL4dsx0tkSCYQYfsQRIzGp
 5RCIr6bSQKcKiEgS0CfECgaUMOg4ThHcsXX1WbmzNS6FrbymVnxxSNRK+ixhT0VjCETg
 jVD65ouHuvWoSLAEf7dCBP1CJ/m8DYgZRX2kvd5U7sbJA+QPjCzJsvN/Cqs/htS3Z0eo
 SqSOYzRhg2uzhJCJHCJRlO4KnYWyTydDSyAIzQT85E5dt2vRRt344GQtaviapop9TEw6
 erdQ==
X-Gm-Message-State: APjAAAW/Exb5+ktLVAfIvhp/Hpb+0S+jBqiYvECokVkDf6GYOAsXgnrP
 GWr/AP9n08JDzljRbiJWQZqr+BkX1MG5I9TEhlA=
X-Google-Smtp-Source: APXvYqxCy5T2qYf8AtD/5du5tJyhwcoh7sEdY75fT+3dvw6D36Axv5jy7pbWYHuZwdh4ciPM2RDUPV1BkT6JF3v8oSI=
X-Received: by 2002:a17:906:e241:: with SMTP id
 gq1mr39043190ejb.265.1562248632457; 
 Thu, 04 Jul 2019 06:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com>
 <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
 <20190702154419.20812-3-robdclark@gmail.com>
 <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
 <20190704123511.GG6569@pendragon.ideasonboard.com>
In-Reply-To: <20190704123511.GG6569@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jul 2019 06:56:56 -0700
Message-ID: <CAF6AEGvYJ6iA5B+thJuBC=pFStuhsn87xrrcWAZyroWj5xKMZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FFyR56GUnLHy2geI3ziIJleBntP257KjNAIucLrVbto=;
 b=sSMe3KUnCE/9cEqVz610EGJodOlNiM7nWzbx1zZ79RtpzxbcLa33M2jDifYqiexG0+
 vAZ5VR8pdueSNKBYIlI9C2zj7yyaHLKqycY6QbNU5Caqk1xm0PFg28WJr+StMyTPC2tG
 KtltdHgdepdP1B+TgssB4nk3tZIaXH2SZtfn173dD5iaP5NJLzhrd8Y/YGXG0g1FhGt6
 mmmiJ7M+4sNbgyTNadHtLZz3XXN23H5PQ1+aHa635fHwO6L802KYN4412D7UeT43pOuF
 /o+CMaU/9P57X0KNIgp9sJcaBMYHt/QfKjNSuIFP5slziNmx+Ia3Z3AwMwFXVhaMZETS
 g5Ag==
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA1OjM1IEFNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIFRodSwg
SnVsIDA0LCAyMDE5IGF0IDAyOjMxOjIwUE0gKzAyMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4g
PiBPbiAwMi4wNy4yMDE5IDE3OjQ0LCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiA+IEZyb206IFJvYiBD
bGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+ID4KPiA+ID4gQWRkIGEgZGVidWdmcyBm
aWxlIHRvIHNob3cgc3RhdHVzIHJlZ2lzdGVycy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ID4gPiBpbmRleCBmMWEyNDkz
Yjg2ZDkuLmE2ZjI3NjQ4YzAxNSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS1zbjY1ZHNpODYuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jCj4gPiA+IEBAIC01LDYgKzUsNyBAQAo+ID4gPiAgICovCj4gPiA+Cj4gPiA+
ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvZGVidWdmcy5o
Pgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9pMmMuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPiA+ID4gQEAg
LTEwOSw2ICsxMTAsNyBAQCBzdHJ1Y3QgdGlfc25fYnJpZGdlIHsKPiA+ID4gICAgIHN0cnVjdCBk
cm1fZHBfYXV4ICAgICAgICAgICAgICAgYXV4Owo+ID4gPiAgICAgc3RydWN0IGRybV9icmlkZ2Ug
ICAgICAgICAgICAgICBicmlkZ2U7Cj4gPiA+ICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAgICAg
ICAgICAgIGNvbm5lY3RvcjsKPiA+ID4gKyAgIHN0cnVjdCBkZW50cnkgICAgICAgICAgICAgICAg
ICAgKmRlYnVnZnM7Cj4gPiA+ICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgICAgICAgICAgICAgICpo
b3N0X25vZGU7Cj4gPiA+ICAgICBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICAgICAgICAgICpkc2k7
Cj4gPiA+ICAgICBzdHJ1Y3QgY2xrICAgICAgICAgICAgICAgICAgICAgICpyZWZjbGs7Cj4gPiA+
IEBAIC0xNzgsNiArMTgwLDQyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0aV9z
bl9icmlkZ2VfcG1fb3BzID0gewo+ID4gPiAgICAgU0VUX1JVTlRJTUVfUE1fT1BTKHRpX3NuX2Jy
aWRnZV9zdXNwZW5kLCB0aV9zbl9icmlkZ2VfcmVzdW1lLCBOVUxMKQo+ID4gPiAgfTsKPiA+ID4K
PiA+ID4gK3N0YXRpYyBpbnQgc3RhdHVzX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpk
YXRhKQo+ID4gPiArewo+ID4gPiArICAgc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGEgPSBzLT5w
cml2YXRlOwo+ID4gPiArICAgdW5zaWduZWQgaW50IHJlZywgdmFsOwo+ID4gPiArCj4gPiA+ICsg
ICBzZXFfcHV0cyhzLCAiU1RBVFVTIFJFR0lTVEVSUzpcbiIpOwo+Cj4gTk8gTkVFRCBUTyBTSE9V
VCA6LSkKPgo+ID4gPiArCj4gPiA+ICsgICBwbV9ydW50aW1lX2dldF9zeW5jKHBkYXRhLT5kZXYp
Owo+ID4gPiArCj4gPiA+ICsgICAvKiBJUlEgU3RhdHVzIFJlZ2lzdGVycywgc2VlIFRhYmxlIDMx
IGluIGRhdGFzaGVldCAqLwo+ID4gPiArICAgZm9yIChyZWcgPSAweGYwOyByZWcgPD0gMHhmODsg
cmVnKyspIHsKPiA+ID4gKyAgICAgICAgICAgcmVnbWFwX3JlYWQocGRhdGEtPnJlZ21hcCwgcmVn
LCAmdmFsKTsKPiA+ID4gKyAgICAgICAgICAgc2VxX3ByaW50ZihzLCAiWzB4JTAyeF0gPSAweCUw
OHhcbiIsIHJlZywgdmFsKTsKPiA+ID4gKyAgIH0KPiA+ID4gKwo+ID4gPiArICAgcG1fcnVudGlt
ZV9wdXQocGRhdGEtPmRldik7Cj4gPiA+ICsKPiA+ID4gKyAgIHJldHVybiAwOwo+ID4gPiArfQo+
ID4gPiArCj4gPiA+ICtERUZJTkVfU0hPV19BVFRSSUJVVEUoc3RhdHVzKTsKPiA+ID4gKwo+ID4g
PiArc3RhdGljIHZvaWQgdGlfc25fZGVidWdmc19pbml0KHN0cnVjdCB0aV9zbl9icmlkZ2UgKnBk
YXRhKQo+ID4gPiArewo+ID4gPiArICAgcGRhdGEtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9k
aXIoInRpX3NuNjVkc2k4NiIsIE5VTEwpOwo+ID4KPiA+IElmIHNvbWUgZGF5IHdlIHdpbGwgaGF2
ZSBib2FyZCB3aXRoIHR3byBzdWNoIGJyaWRnZXMgdGhlcmUgd2lsbCBiZSBhCj4gPiBwcm9ibGVt
Lgo+Cj4gQ291bGQgd2UgdXNlIHRoZSBwbGF0Zm9ybSBkZXZpY2UgbmFtZSBmb3IgdGhpcyA/Cgpo
bW0sIHllYWgsIHRoYXQgd291bGQgc29sdmUgdGhlIDJ4IGJyaWRnZXMgaXNzdWUKCj4gPiBBbnl3
YXk6Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+Cj4gPgo+ID4gPiArCj4gPiA+ICsgICBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJzdGF0dXMiLCAw
NjAwLCBwZGF0YS0+ZGVidWdmcywgcGRhdGEsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgJnN0
YXR1c19mb3BzKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIHZvaWQgdGlfc25fZGVi
dWdmc19yZW1vdmUoc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGEpCj4gPiA+ICt7Cj4gPiA+ICsg
ICBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUocGRhdGEtPmRlYnVnZnMpOwo+ID4gPiArICAgcGRh
dGEtPmRlYnVnZnMgPSBOVUxMOwo+ID4gPiArfQo+ID4gPiArCj4KPiBZb3UgbmVlZCB0byBjb25k
aXRpb25hbGx5LWNvbXBpbGUgdGhpcyBiYXNlZCBvbiBDT05GSUdfREVCVUdfRlMuCgpIbW0sIGlz
IHRoYXQgcmVhbGx5IHRydWU/ICBEZWJ1Z2ZzIGFwcGVhcnMgdG8gYmUgc3VmZmljZW50bHkgc3R1
YidkIHcvCmlubGluZSBuby1vcHMgaW4gdGhlICFDT05GSUdfREVCVUdfRlMgY2FzZQoKQlIsCi1S
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
