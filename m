Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042F3AC99
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 02:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FD2891CC;
	Mon, 10 Jun 2019 00:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6D4891CC;
 Mon, 10 Jun 2019 00:57:10 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id v193so9243763itc.0;
 Sun, 09 Jun 2019 17:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5QmAOWsPthSHjf1zCLnQs+1oB2l+CbergmiRFl06hK4=;
 b=iNPSFchLuNkMDbh/mpwo+jaKj5uEhUMuzpGpYtf4pEV4dRqLlmJEYkqrczPgM8cydN
 2cNqPmLP+8b2O1mSulkYSGov0j6aJ/kQwS/v09SbLVTfObXfZBMk9ArBxORAvEx64ExU
 BDMsztC8fDU6BIsGDpFkexSjM3c5pzeNgNjTRJ1ibswPg+h9tlaMwF/ur8TEwET2xpZH
 2eQRYz9wjBDpnsJzo2d/XJOoRbsObIqGETyFULvO52UvemQ9ulrquJZH7liJtw/y2f0F
 Ggq+rOsIQ8hZcmnD3oyh+UnP4ABXI9jfOFaOWfL+6hGpIcqjo3BjbIqV4E3XqfXJJOPP
 glcw==
X-Gm-Message-State: APjAAAWBAYRxn9gBs+87c9E5C7TBc4YKv2vWpP5jDSFFXQ0JcmJtq2NP
 4yYioaYVr947nOBBQLJA6LGM3ri0Tl2st+fQmrk=
X-Google-Smtp-Source: APXvYqxEtRc8NOiVSmDPXEqpjlOF5DJUg8NbaRpO6FoLem64jqDY/N39u+J/j7a3odA19uncFifiO/EtowEMb6Dh2Qc=
X-Received: by 2002:a24:eb12:: with SMTP id h18mr11938575itj.147.1560128230368; 
 Sun, 09 Jun 2019 17:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-6-emil.l.velikov@gmail.com>
 <CACvgo528VbP-iDY9mdSQrKYjPkOr8HKax42eiHdBD1-jYWONSA@mail.gmail.com>
In-Reply-To: <CACvgo528VbP-iDY9mdSQrKYjPkOr8HKax42eiHdBD1-jYWONSA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 10 Jun 2019 08:56:59 +0800
Message-ID: <CAKGbVbuN7rQg+WHOhc5fLwi4=-XHJpdQTLAin_CzVj3GU7dtpQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] drm/lima: drop DRM_AUTH usage from the driver
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5QmAOWsPthSHjf1zCLnQs+1oB2l+CbergmiRFl06hK4=;
 b=Fk7AnAjD6tw7iKb7BF/Ou9Yfy+LZMJsHXoPGelb4SSHZ/k+iIGIJmWCeY62RbWKkID
 A7+bxSwgp0QyAf8rk52zxuYWUVLyKMTl2KoWPcuCYScKGTFy5wQnIPSIvncgh7Mmkxi5
 77vVqw2syxuRrJF0Jfdd7pNCTwEYbfEjABt1qNKUajcBD8AqdSD3YdB3GwQoz1CGkL7o
 dxfJgvuEZUCQpFeEcw8jOC2jw8MLsprHrZwzyU7SbzfYJ/xSd1lVVfTrawBsDw17QMPj
 Bfx/ZPvnaTHSeDekPIUUVLPS4llrFtJyl2HdBtkYEoCQ3muJcs5k+O4c0IJJrru2a+jh
 uQHA==
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
Cc: David Airlie <airlied@linux.ie>, lima@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCBmb3IgbWU6ClJldmlld2VkLWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNv
bT4KClJlZ2FyZHMsClFpYW5nCgoKT24gVGh1LCBKdW4gNiwgMjAxOSBhdCA2OjU5IFBNIEVtaWwg
VmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjcg
TWF5IDIwMTkgYXQgMDk6MTksIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgo+ID4KPiA+IFRoZSBhdXRoZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBi
eSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSByZW5kZXIKPiA+IG5vZGUuCj4gPgo+ID4gRnJvbSB0aGUg
ZHJpdmVyIFBPViB0aGVyZSBpcyBubyBkaXN0aW5jdGlvbiBiZXR3ZWVuIHByaW1hcnkgYW5kIHJl
bmRlcgo+ID4gbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRva2VuLgo+ID4KPiA+IENjOiBR
aWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KPiA+IENjOiBsaW1hQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlr
b3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2xpbWEvbGltYV9kcnYuYyB8IDE0ICsrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xp
bWFfZHJ2LmMKPiA+IGluZGV4IGIyOWMyNmNkMTNiMi4uYWU4OTkzOGM2M2IxIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9kcnYuYwo+ID4gQEAgLTIzMSwxMyArMjMxLDEzIEBAIHN0YXRpYyB2
b2lkIGxpbWFfZHJtX2RyaXZlcl9wb3N0Y2xvc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IGRybV9maWxlICpmCj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9p
b2N0bF9kZXNjIGxpbWFfZHJtX2RyaXZlcl9pb2N0bHNbXSA9IHsKPiA+IC0gICAgICAgRFJNX0lP
Q1RMX0RFRl9EUlYoTElNQV9HRVRfUEFSQU0sIGxpbWFfaW9jdGxfZ2V0X3BhcmFtLCBEUk1fQVVU
SHxEUk1fUkVOREVSX0FMTE9XKSwKPiA+IC0gICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9H
RU1fQ1JFQVRFLCBsaW1hX2lvY3RsX2dlbV9jcmVhdGUsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxM
T1cpLAo+ID4gLSAgICAgICBEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFTV9JTkZPLCBsaW1hX2lv
Y3RsX2dlbV9pbmZvLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKPiA+IC0gICAgICAgRFJN
X0lPQ1RMX0RFRl9EUlYoTElNQV9HRU1fU1VCTUlULCBsaW1hX2lvY3RsX2dlbV9zdWJtaXQsIERS
TV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAo+ID4gLSAgICAgICBEUk1fSU9DVExfREVGX0RSVihM
SU1BX0dFTV9XQUlULCBsaW1hX2lvY3RsX2dlbV93YWl0LCBEUk1fQVVUSHxEUk1fUkVOREVSX0FM
TE9XKSwKPiA+IC0gICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9DVFhfQ1JFQVRFLCBsaW1h
X2lvY3RsX2N0eF9jcmVhdGUsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAo+ID4gLSAgICAg
ICBEUk1fSU9DVExfREVGX0RSVihMSU1BX0NUWF9GUkVFLCBsaW1hX2lvY3RsX2N0eF9mcmVlLCBE
Uk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKPiA+ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYo
TElNQV9HRVRfUEFSQU0sIGxpbWFfaW9jdGxfZ2V0X3BhcmFtLCBEUk1fUkVOREVSX0FMTE9XKSwK
PiA+ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9HRU1fQ1JFQVRFLCBsaW1hX2lvY3Rs
X2dlbV9jcmVhdGUsIERSTV9SRU5ERVJfQUxMT1cpLAo+ID4gKyAgICAgICBEUk1fSU9DVExfREVG
X0RSVihMSU1BX0dFTV9JTkZPLCBsaW1hX2lvY3RsX2dlbV9pbmZvLCBEUk1fUkVOREVSX0FMTE9X
KSwKPiA+ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9HRU1fU1VCTUlULCBsaW1hX2lv
Y3RsX2dlbV9zdWJtaXQsIERSTV9SRU5ERVJfQUxMT1cpLAo+ID4gKyAgICAgICBEUk1fSU9DVExf
REVGX0RSVihMSU1BX0dFTV9XQUlULCBsaW1hX2lvY3RsX2dlbV93YWl0LCBEUk1fUkVOREVSX0FM
TE9XKSwKPiA+ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9DVFhfQ1JFQVRFLCBsaW1h
X2lvY3RsX2N0eF9jcmVhdGUsIERSTV9SRU5ERVJfQUxMT1cpLAo+ID4gKyAgICAgICBEUk1fSU9D
VExfREVGX0RSVihMSU1BX0NUWF9GUkVFLCBsaW1hX2lvY3RsX2N0eF9mcmVlLCBEUk1fUkVOREVS
X0FMTE9XKSwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0
aW9ucyBsaW1hX2RybV9kcml2ZXJfZm9wcyA9IHsKPiA+IC0tCj4gPiAyLjIxLjAKPiA+Cj4gSHVt
YmxlIHBva2U/Cj4KPiBUaGFua3MsCj4gRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
