Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A74B2BE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B756E2D7;
	Wed, 19 Jun 2019 07:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4FE88A3E;
 Tue, 18 Jun 2019 20:44:27 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u13so33122085iop.0;
 Tue, 18 Jun 2019 13:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a72KOM/txntfmB99IxHWW0QKe5DAoHdDFqzs/tLeZAU=;
 b=OASi4HdL2Dpo9NJKrTIMdyuNSdjCaFMiY0vXziVZddpcQhXu7PmTME50R6hz7dtxnh
 RTkCfQ1MfSrRnRdRBVQo9fkyfD1dXe+/wjXXUTSfX3jkNXRrlehR2ezdKKYoEefrjWDq
 /MkOL+wH8NUmJv74VDQe3Y+jIlWXUuwQfFodScOwCm0dRLYxOCxUzXP53/T4iPpAa1uT
 2W4KaGE38NSSgQwCXGtVfshDraxUmH6+RxH66H0Jr6pvJwfRVtVSox+LKTsDXCKFY3Ki
 Cg0XUsH9FzTlOaCu+i7i45m5k2Y/vMlRldSf+g9cOYN1U75fyBUDhYUuKP7hkMmjrHGm
 EEew==
X-Gm-Message-State: APjAAAWBRP2Q+9QTHmPgYfDamhhIxgvqOZtjckDtEqihtN7tJzw+UUDC
 tVh0PFxMVzVrbBT6az3BoTAfu8zVX+iFSfZHfrQ=
X-Google-Smtp-Source: APXvYqxbySU81wsAKNVUl0cXCPZBOmJuLDgdov2SODjSSaCWp2BuHkbnaOEoYGJRizW6ZpyupRoe52WDZcTefI/O2N8=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr5142549jah.140.1560890666538; 
 Tue, 18 Jun 2019 13:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202425.15259-1-robdclark@gmail.com>
 <20190618202425.15259-6-robdclark@gmail.com>
In-Reply-To: <20190618202425.15259-6-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 18 Jun 2019 14:44:16 -0600
Message-ID: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a72KOM/txntfmB99IxHWW0QKe5DAoHdDFqzs/tLeZAU=;
 b=GxA/N9uny+NZFEUb7AtULKqb8Ajxz7iTbt3Ei3hBq0QRSOsoa7MU9rulCbQ0m8EReR
 dE2Lia0ULFg65uPitn7uvoXu3kv2jNZj37vxH9z7Wy2VppPKwYNLOvC5HC4f15t0hkIr
 GgQwJUFn7jX5RDOfFmOLENjcrrN1jwtmyxXNyIRqDDCY0VY0wQnNLQYm8Iy0Y/ZljoJE
 LuVEsXfIZyHANdv1Nu5XFr/iprpqTLNwf0ncamYOJIj7l7jiGRLie6cyk8k08J1v7DPj
 1ae3KpyY0HvRyGdIL3DXert/tCJbNpMQd5lYjgI8AgW9fklGrvJqFu6/5C58kfdJu+zS
 7agQ==
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
Cc: Rob Clark <robdclark@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMjoyNSBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5h
cm8ub3JnPgo+Cj4gVGhlIGludGVyY29ubmVjdCBBUEkgcHJvdmlkZXMgYW4gaW50ZXJmYWNlIGZv
ciBjb25zdW1lciBkcml2ZXJzIHRvCj4gZXhwcmVzcyB0aGVpciBiYW5kd2lkdGggbmVlZHMgaW4g
dGhlIFNvQy4gVGhpcyBkYXRhIGlzIGFnZ3JlZ2F0ZWQKPiBhbmQgdGhlIG9uLWNoaXAgaW50ZXJj
b25uZWN0IGhhcmR3YXJlIGlzIGNvbmZpZ3VyZWQgdG8gdGhlIG1vc3QKPiBhcHByb3ByaWF0ZSBw
b3dlci9wZXJmb3JtYW5jZSBwcm9maWxlLgo+Cj4gVXNlIHRoZSBBUEkgdG8gY29uZmlndXJlIHRo
ZSBpbnRlcmNvbm5lY3RzIGFuZCByZXF1ZXN0IGJhbmR3aWR0aAo+IGJldHdlZW4gRERSIGFuZCB0
aGUgZGlzcGxheSBoYXJkd2FyZSAoTURQIHBvcnQocykgYW5kIHJvdGF0b3IKPiBkb3duc2NhbGVy
KS4KPgo+IHYyOiB1cGRhdGUgdGhlIHBhdGggbmFtZXMgdG8gYmUgY29uc2lzdGVudCB3aXRoIGRw
dSwgaGFuZGxlIHRoZSBOVUxMCj4gICAgIHBhdGggY2FzZSwgdXBkYXRlZCBjb21taXQgbXNnIGZy
b20gR2VvcmdpLgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtv
dkBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9t
aXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMu
YyB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCA5NzE3
OWJlYzg5MDIuLmVlYWM0MjlhY2Y0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYwo+IEBAIC0xNiw2ICsxNiw3IEBACj4gICAqIHRoaXMgcHJvZ3JhbS4gIElm
IG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPiAgICovCj4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2ludGVyY29ubmVjdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+
Cj4KPiAgI2luY2x1ZGUgIm1zbV9kcnYuaCIKPiBAQCAtMTA1MCw2ICsxMDUxLDE5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgY29tcG9uZW50X29wcyBtZHA1X29wcyA9IHsKPgo+ICBzdGF0aWMgaW50
IG1kcDVfZGV2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiArICAg
ICAgIHN0cnVjdCBpY2NfcGF0aCAqcGF0aDAgPSBvZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJtZHAw
LW1lbSIpOwo+ICsgICAgICAgc3RydWN0IGljY19wYXRoICpwYXRoMSA9IG9mX2ljY19nZXQoJnBk
ZXYtPmRldiwgIm1kcDEtbWVtIik7Cj4gKyAgICAgICBzdHJ1Y3QgaWNjX3BhdGggKnBhdGhfcm90
ID0gb2ZfaWNjX2dldCgmcGRldi0+ZGV2LCAicm90YXRvci1tZW0iKTsKPiArCj4gKyAgICAgICBp
ZiAoSVNfRVJSX09SX05VTEwocGF0aDApKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VS
Ul9PUl9aRVJPKHBhdGgwKTsKClVtbSwgYW0gSSBtaXN1bmRlcnN0YW5kaW5nIHNvbWV0aGluZz8g
IEl0IHNlZW1zIGxpa2Ugb2ZfaWNjX2dldCgpCnJldHVybnMgTlVMTCBpZiB0aGUgcHJvcGVydHkg
ZG9lc24ndCBleGlzdC4gIFdvbid0IHRoaXMgYmUgYmFja3dhcmRzCmluY29tcGF0aWJsZT8gIEV4
aXN0aW5nIERUcyB3b24ndCBzcGVjaWZ5IHRoZSBwcm9wZXJ0eSwgYW5kIEkgZG9uJ3QKYmVsaWV2
ZSB0aGUgcHJvcGVydHkgaXMgc3VwcG9ydGVkIG9uIGFsbCB0YXJnZXRzLiAgU2VlbXMgbGlrZSB3
ZSdsbApicmVhayB0aGluZ3MgYnkgbm90IGNhbGxpbmcgdGhlIGJlbG93IGNvbXBvbmVudF9hZGQo
KSBpZiB0aGUKaW50ZXJjb25uZWN0IGlzIG5vdCBzdXBwb3J0ZWQsIHNwZWNpZmllZCwgb3IgdGhl
IGludGVyY29ubmVjdCBkcml2ZXIKaXMgbm90IGNvbXBpbGVkLgoKPiArICAgICAgIGljY19zZXRf
YncocGF0aDAsIDAsIE1CcHNfdG9faWNjKDY0MDApKTsKPiArCj4gKyAgICAgICBpZiAoIUlTX0VS
Ul9PUl9OVUxMKHBhdGgxKSkKPiArICAgICAgICAgICAgICAgaWNjX3NldF9idyhwYXRoMSwgMCwg
TUJwc190b19pY2MoNjQwMCkpOwo+ICsgICAgICAgaWYgKCFJU19FUlJfT1JfTlVMTChwYXRoX3Jv
dCkpCj4gKyAgICAgICAgICAgICAgIGljY19zZXRfYncocGF0aF9yb3QsIDAsIE1CcHNfdG9faWNj
KDY0MDApKTsKPiArCj4gICAgICAgICBEQkcoIiIpOwo+ICAgICAgICAgcmV0dXJuIGNvbXBvbmVu
dF9hZGQoJnBkZXYtPmRldiwgJm1kcDVfb3BzKTsKPiAgfQo+IC0tCj4gMi4yMC4xCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKPiBGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
