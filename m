Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9537250
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A358689471;
	Thu,  6 Jun 2019 10:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2693B8944A;
 Thu,  6 Jun 2019 10:59:53 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id e9so686788uar.9;
 Thu, 06 Jun 2019 03:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqJH7PlzG1A5+vsYCOjSOpI5UV9iiv9nER7m3tm3ysg=;
 b=oYekTiTsEkXPWuxFhbc3gattAAFwq9EHwCY1BU0Km8mguAnsjvlDlO+mrNXGOs2htW
 RslYHF7Z8dI/Y7i93fdf/zzWQuKQGVhcnOpCsAP7/8B8a5mfKLOlPkwP86Li5BUQvVEk
 SHyl5xseInyorHKh4LNxmOlKuoH27iDHW+sIfkAMvHHSAkZyfn0IbnlgSXWDlxPt7Kcl
 DMdz6jO9Pqo/v/4ZotceYYVQjdSjdepdWfNNYJqMDRLeMS0LCCoN2pwS5ao0fvRomnvZ
 q4fmQ06OjjZvPTSPMhv8tYst7INbsjIhdDjLDecdsD6ya4lFEaM2Di+H1fQ7rNBIIS/R
 jYDA==
X-Gm-Message-State: APjAAAUm7XUfBov9PyhxsAFoUEw7YQkRqOUdI48soCNkbfddvA4B1u/n
 765qQTMdXASWwUU0pQpZ2QqY20h9wLrzYmvHAi/aT1Pc
X-Google-Smtp-Source: APXvYqwPu016NDblnMH96uUC+LujcQYbObLlSUjhUHLPyTDGuoHz/zDF0QcVrgsqEMg5Yh4d5O2bQqbtJvG+VByF3gs=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr16669090uap.69.1559818792053; 
 Thu, 06 Jun 2019 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-6-emil.l.velikov@gmail.com>
In-Reply-To: <20190527081741.14235-6-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 11:58:00 +0100
Message-ID: <CACvgo528VbP-iDY9mdSQrKYjPkOr8HKax42eiHdBD1-jYWONSA@mail.gmail.com>
Subject: Re: [PATCH 06/13] drm/lima: drop DRM_AUTH usage from the driver
To: ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qqJH7PlzG1A5+vsYCOjSOpI5UV9iiv9nER7m3tm3ysg=;
 b=NSficyHhbqUhrfRBOTE9qH/xb9IXdezR/DqF36DP+mFIYajX4rBqIgCS5Vyp6CaM53
 d5iQ20GrrMpQN7RKvJbN+Iy00iINYWQw39ukDgu7Xk9dFobcUDb9xzFdolyV/eJB3maO
 CVi/SudzYWxAQLRVLNOV2CkrwuV7D/S0IL0A1EAHMjsK+mzvvmtRpiFl5g4TR+oeDcWp
 NFV+7sHpCEZFhSy9Mijo8PW9zKheYVaWGQTzpnq2Sx2ohbqB8wl3KS9ENQbFGaPMPeX2
 weGh2tOxzSNHP+rDv/2aA3IObJc4SK9mRUA7qKJWMzduLpkdNqYwX7Bw+Mk4z1D3cj9R
 3Z/w==
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
Cc: David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 lima@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNyBNYXkgMjAxOSBhdCAwOToxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4KPgo+IFRoZSBhdXRoZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVk
LCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSByZW5kZXIKPiBub2RlLgo+Cj4gRnJvbSB0aGUgZHJp
dmVyIFBPViB0aGVyZSBpcyBubyBkaXN0aW5jdGlvbiBiZXR3ZWVuIHByaW1hcnkgYW5kIHJlbmRl
cgo+IG5vZGVzLCB0aHVzIHdlIGNhbiBkcm9wIHRoZSB0b2tlbi4KPgo+IENjOiBRaWFuZyBZdSA8
eXVxODI1QGdtYWlsLmNvbT4KPiBDYzogbGltYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYyB8
IDE0ICsrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZHJ2LmMKPiBpbmRleCBiMjljMjZjZDEz
YjIuLmFlODk5MzhjNjNiMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1h
X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYwo+IEBAIC0yMzEs
MTMgKzIzMSwxMyBAQCBzdGF0aWMgdm9pZCBsaW1hX2RybV9kcml2ZXJfcG9zdGNsb3NlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZgo+ICB9Cj4KPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBsaW1hX2RybV9kcml2ZXJfaW9jdGxzW10gPSB7Cj4g
LSAgICAgICBEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFVF9QQVJBTSwgbGltYV9pb2N0bF9nZXRf
cGFyYW0sIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAo+IC0gICAgICAgRFJNX0lPQ1RMX0RF
Rl9EUlYoTElNQV9HRU1fQ1JFQVRFLCBsaW1hX2lvY3RsX2dlbV9jcmVhdGUsIERSTV9BVVRIfERS
TV9SRU5ERVJfQUxMT1cpLAo+IC0gICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9HRU1fSU5G
TywgbGltYV9pb2N0bF9nZW1faW5mbywgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCj4gLSAg
ICAgICBEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFTV9TVUJNSVQsIGxpbWFfaW9jdGxfZ2VtX3N1
Ym1pdCwgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCj4gLSAgICAgICBEUk1fSU9DVExfREVG
X0RSVihMSU1BX0dFTV9XQUlULCBsaW1hX2lvY3RsX2dlbV93YWl0LCBEUk1fQVVUSHxEUk1fUkVO
REVSX0FMTE9XKSwKPiAtICAgICAgIERSTV9JT0NUTF9ERUZfRFJWKExJTUFfQ1RYX0NSRUFURSwg
bGltYV9pb2N0bF9jdHhfY3JlYXRlLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKPiAtICAg
ICAgIERSTV9JT0NUTF9ERUZfRFJWKExJTUFfQ1RYX0ZSRUUsIGxpbWFfaW9jdGxfY3R4X2ZyZWUs
IERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAo+ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYo
TElNQV9HRVRfUEFSQU0sIGxpbWFfaW9jdGxfZ2V0X3BhcmFtLCBEUk1fUkVOREVSX0FMTE9XKSwK
PiArICAgICAgIERSTV9JT0NUTF9ERUZfRFJWKExJTUFfR0VNX0NSRUFURSwgbGltYV9pb2N0bF9n
ZW1fY3JlYXRlLCBEUk1fUkVOREVSX0FMTE9XKSwKPiArICAgICAgIERSTV9JT0NUTF9ERUZfRFJW
KExJTUFfR0VNX0lORk8sIGxpbWFfaW9jdGxfZ2VtX2luZm8sIERSTV9SRU5ERVJfQUxMT1cpLAo+
ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9HRU1fU1VCTUlULCBsaW1hX2lvY3RsX2dl
bV9zdWJtaXQsIERSTV9SRU5ERVJfQUxMT1cpLAo+ICsgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYo
TElNQV9HRU1fV0FJVCwgbGltYV9pb2N0bF9nZW1fd2FpdCwgRFJNX1JFTkRFUl9BTExPVyksCj4g
KyAgICAgICBEUk1fSU9DVExfREVGX0RSVihMSU1BX0NUWF9DUkVBVEUsIGxpbWFfaW9jdGxfY3R4
X2NyZWF0ZSwgRFJNX1JFTkRFUl9BTExPVyksCj4gKyAgICAgICBEUk1fSU9DVExfREVGX0RSVihM
SU1BX0NUWF9GUkVFLCBsaW1hX2lvY3RsX2N0eF9mcmVlLCBEUk1fUkVOREVSX0FMTE9XKSwKPiAg
fTsKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBsaW1hX2RybV9kcml2
ZXJfZm9wcyA9IHsKPiAtLQo+IDIuMjEuMAo+Ckh1bWJsZSBwb2tlPwoKVGhhbmtzLApFbWlsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
