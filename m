Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E536674E0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 20:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542F6E315;
	Fri, 12 Jul 2019 18:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7886B6E312;
 Fri, 12 Jul 2019 18:01:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so10802847wru.13;
 Fri, 12 Jul 2019 11:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KGfkWXQEB4DpNuxrw2Ty2JDtJAoJ1RvfNqKFWK4TmA=;
 b=VaBJIAgxZH1P/Di9Lc+KTCaWsiiP6lX1QPumYW0klZOCQkNnx8nRjdd3UMOhKXUyAu
 QtB2hWCMclI7FN31X7VF1pGitOoN/Zp7IoDLOlQ6rAV7NJ/31SFp20MS1MT0iRx3wFej
 VOm6ohdpmlGt0q14eGtrTFocpv1AladXQdl0NaKMfS6cBwSEfbrwSWIG2gqmZjiSznFM
 pEPI2XhbuHxX++zuHwPHRxDO5qP5Ou9bLgXyR8ijEXAjUE51qW2rAzMdsNNPvA/RS6Il
 kSKPdz5I8Cv1psG3TJepnvAfnp6HTSlcEfBvCODVtAQyLm2vqrDRUCjHpF37FJ026Wwk
 WfSw==
X-Gm-Message-State: APjAAAUNmJX0iTupFo06d6ijX/19a4hkbFXCvNdmCcxS01DkEJiVoJbP
 J73Cp6IVMPpE0lZ1LUyffdZRYbFbKyS5TBnE91M=
X-Google-Smtp-Source: APXvYqwss/WvLjL/LGiOM8mHDUS8Lv25N53N+kxrEQ5ijpXyO7RwUkDOJ7LCTtzdDh/UYPw/K3XQuWp7G/oNIyvp/EE=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr12513676wrw.323.1562954518109; 
 Fri, 12 Jul 2019 11:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190712094118.1559434-1-arnd@arndb.de>
In-Reply-To: <20190712094118.1559434-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jul 2019 14:01:46 -0400
Message-ID: <CADnq5_McVegix-m87OwHUvk80NdsFZPQ7d0X8qQtUf84h+Fg1A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: hide #warning for missing DC config
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1KGfkWXQEB4DpNuxrw2Ty2JDtJAoJ1RvfNqKFWK4TmA=;
 b=jSqm1LtnSvPzjsEt3Vm0O1vNGwSwHmI0yx63fhSHLkuYxhZ5z9qmHWioZIgaScrqeR
 etUMH8wAhEv2dyR+4cu8JZWOlJSA69URvDJsccJpw2L2VVaI8I/CxatTLZJEFmtnDS5x
 yTx6821ZqeKE/r67dpU3wAKXBMTPmR3JGBlm6wprm6SWTyROE+2VZ72oDI/jta6aIVT3
 d0Gw+oc4kXxjL7jkNap/mPbG9qYuRLooCq8Pi0eN5guhVXbPez5ycnH9Ftm0afPSdwLK
 6TroVa8wgcDnXqi2lBHeVzOH9OykYjIamQs1F8IBh3+5cI51mJEP0flcXy1o4MD6Wfhc
 RrNQ==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNTo0MSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IEl0IGlzIGFubm95aW5nIHRvIGhhdmUgI3dhcm5pbmdzIHRoYXQgdHJp
Z2dlciBpbiByYW5kY29uZmlnCj4gYnVpbGRzIGxpa2UKPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmM6NjUzOjM6IGVycm9yOiAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZv
ciBkaXNwbGF5IHN1cHBvcnQgb24gU09DMTUuIgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmM6NDAwOjM6IGVycm9yOiAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5
IHN1cHBvcnQgb24gbmF2aS4iCj4KPiBSZW1vdmUgdGhlc2UgYW5kIHJlbHkgb24gdGhlIHVzZXJz
IHRvIHR1cm4gdGhlc2Ugb24uCgpJcyB0aGVyZSBzb21lIHNvcnQgb2YgaW5mb3JtYXRpb25hbCBt
ZXNzYWdlIHdlIGNvdWxkIHVzZSBpbnN0ZWFkPwpVbmxlc3MgeW91IGFyZSBhIHNlcnZlciB1c2Vy
LCBtb3N0IGVuZCB1c2VycyB3YW50IHRoaXMgb3B0aW9uIGVuYWJsZWQuCgpBbGV4Cgo+Cj4gU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyAgICB8IDIgLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYyB8IDQgLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKPiBpbmRleCA5MjUzYzAzZDM4N2EuLjEwZWMw
ZTgxZWU1OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwo+IEBAIC0zOTYsOCArMzk2LDYg
QEAgaW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICNp
ZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQo+ICAgICAgICAgICAgICAgICBlbHNlIGlmIChh
bWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkbV9pcF9ibG9jayk7Cj4gLSNl
bHNlCj4gLSMgICAgICB3YXJuaW5nICJFbmFibGUgQ09ORklHX0RSTV9BTURfREMgZm9yIGRpc3Bs
YXkgc3VwcG9ydCBvbiBuYXZpLiIKPiAgI2VuZGlmCj4gICAgICAgICAgICAgICAgIGFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwo+ICAgICAgICAg
ICAgICAgICBhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8wX2lwX2Js
b2NrKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiBpbmRleCA4NzE1MmQ4ZWYwZGYu
LjkwZmIwMTQ5ZmJlYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+IEBAIC02
NDksOCArNjQ5LDYgQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCj4gICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQo+ICAgICAgICAgICAg
ICAgICBlbHNlIGlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkbV9p
cF9ibG9jayk7Cj4gLSNlbHNlCj4gLSMgICAgICB3YXJuaW5nICJFbmFibGUgQ09ORklHX0RSTV9B
TURfREMgZm9yIGRpc3BsYXkgc3VwcG9ydCBvbiBTT0MxNS4iCj4gICNlbmRpZgo+ICAgICAgICAg
ICAgICAgICBpZiAoIShhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjAgJiYgYW1kZ3B1X3Ny
aW92X3ZmKGFkZXYpKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2Vf
aXBfYmxvY2tfYWRkKGFkZXYsICZ1dmRfdjdfMF9pcF9ibG9jayk7Cj4gQEAgLTY3MSw4ICs2Njks
NiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
PiAgI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMpCj4gICAgICAgICAgICAgICAgIGVsc2Ug
aWYgKGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRtX2lwX2Jsb2NrKTsK
PiAtI2Vsc2UKPiAtIyAgICAgIHdhcm5pbmcgIkVuYWJsZSBDT05GSUdfRFJNX0FNRF9EQyBmb3Ig
ZGlzcGxheSBzdXBwb3J0IG9uIFNPQzE1LiIKPiAgI2VuZGlmCj4gICAgICAgICAgICAgICAgIGFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2Y25fdjFfMF9pcF9ibG9jayk7Cj4gICAg
ICAgICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi4yMC4wCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
