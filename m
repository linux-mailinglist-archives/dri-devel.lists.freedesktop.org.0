Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217E98CD7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B276EA7D;
	Thu, 22 Aug 2019 08:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678576EA7B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:04:09 +0000 (UTC)
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4241A70E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:04:08 +0000 (UTC)
Received: by mail-ua1-f69.google.com with SMTP id w9so414110uaj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 01:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzFBQdyV48wEqdrdKeUuPrgK+h2Q4NDBr1BLdrenEes=;
 b=Q+B57IdxQGYq4KRWmQwkaHRnfHqDDfVq9JhDJyJew1I0CyISoedl7oTQZRve4T/I+Y
 XGPT/SbNiVmBb0fezv57xwAiulBKfLlLTTH6SmLGDvMHOfLGtN5vq0kYADtwdytng2iw
 CJlih6V5QmT0PKR7nfMSObaZfXVqYIN7LOTeZUCGUdgWSmEJsa/fCz+W9w21vndUvjdT
 WuqnXU6JJV7UTyh6zLVVNsamFNeU+doB0lpNLY0cfrV71CyWr0wR+bc1BtcTN/rywWjx
 oJiqJ8rflnntTSY4vJpoR8Bj7kpzXVYR0LiicACbK2Ew+bTkfKTiL2FjFDNu3jYmrQ9A
 M23g==
X-Gm-Message-State: APjAAAUo7I/h30+7zWJSWOfMh7EbA5eHLFbYyAWkk0B8wezhlVJpt2cC
 lUDTG2H8bQAN68Li933RatfI+khOlb1rwLluue/SGDmXhgScH1zxi/Dau2BVOSkRDxhqzX1QknT
 lK7gemM1PGRd8A2ZKYWDW1SwBA2qCvsrwCQvgjIo5Hp5/
X-Received: by 2002:a9f:2230:: with SMTP id 45mr4692709uad.87.1566461048151;
 Thu, 22 Aug 2019 01:04:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPwwCpRGwPMn2gvx87OpETGlKnLIE9kzz59Pc5lYRSMeeAxLU0xxBVBzEQeV0a/AvOmWaPNAw7IJFXkRpnqVA=
X-Received: by 2002:a9f:2230:: with SMTP id 45mr4692691uad.87.1566461047813;
 Thu, 22 Aug 2019 01:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190805105401.29874-1-kraxel@redhat.com>
 <20190822065905.pl6waewl43zlcv7i@sirius.home.kraxel.org>
In-Reply-To: <20190822065905.pl6waewl43zlcv7i@sirius.home.kraxel.org>
From: David Airlie <airlied@redhat.com>
Date: Thu, 22 Aug 2019 18:03:56 +1000
Message-ID: <CAMwc25qp-M4peWqRLr79X0=moJkctXiFovmss9_z1xVBo7hxoA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/qxl: get vga ioports
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Frediano Ziglio <fziglio@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpPbiBUaHUsIEF1
ZyAyMiwgMjAxOSBhdCA0OjU5IFBNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3
cm90ZToKPgo+IE9uIE1vbiwgQXVnIDA1LCAyMDE5IGF0IDEyOjU0OjAxUE0gKzAyMDAsIEdlcmQg
SG9mZm1hbm4gd3JvdGU6Cj4gPiBxeGwgaGFzIHR3byBtb2RlczogIm5hdGl2ZSIgKHVzZWQgYnkg
dGhlIGRybSBkcml2ZXIpIGFuZCAidmdhIiAodmdhCj4gPiBjb21wYXRpYmlsaXR5IG1vZGUsIHR5
cGljYWxseSB1c2VkIGZvciBib290IGRpc3BsYXkgYW5kIGZpcm13YXJlCj4gPiBmcmFtZWJ1ZmZl
cnMpLgo+ID4KPiA+IEFjY2Vzc2luZyBhbnkgdmdhIGlvcG9ydCB3aWxsIHN3aXRjaCB0aGUgcXhs
IGRldmljZSBpbnRvIHZnYSBtb2RlLgo+ID4gVGhlIHF4bCBkcml2ZXIgbmV2ZXIgZG9lcyB0aGF0
LCBidXQgb3RoZXIgZHJpdmVycyBhY2Nlc3NpbmcgdmdhIHBvcnRzCj4gPiBjYW4gdHJpZ2dlciB0
aGF0IHRvbyBhbmQgdGhlcmVmb3JlIGRpc3R1cmIgcXhsIG9wZXJhdGlvbi4gIFNvIGFxdWlyZQo+
ID4gdGhlIGxlZ2FjeSB2Z2EgaW9wb3J0cyBmcm9tIHZnYWFyYiB0byBhdm9pZCB0aGF0Lgo+ID4K
PiA+IFJlcHJvZHVjZXI6IEJvb3Qga3ZtIGd1ZXN0IHdpdGggYm90aCBxeGwgYW5kIGk5MTUgdmdw
dSwgd2l0aCBxeGwgYmVpbmcKPiA+IGZpcnN0IGluIHBjaSBzY2FuIG9yZGVyLgo+ID4KPiA+IHYy
OiBTa2lwIHRoaXMgZm9yIHNlY29uZGFyeSBxeGwgY2FyZHMgd2hpY2ggZG9uJ3QgaGF2ZSB2Z2Eg
bW9kZSBpbiB0aGUKPiA+ICAgICBmaXJzdCBwbGFjZSAoRnJlZGlhbm8pLgo+Cj4gUGluZywgYW55
IGNoYW5jZSBmb3IgYW4gYWNrPwo+Cj4gdGhhbmtzLAo+ICAgR2VyZAo+Cj4gPgo+ID4gQ2M6IEZy
ZWRpYW5vIFppZ2xpbyA8ZnppZ2xpb0ByZWRoYXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF9kcnYuYyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kcnYuYwo+ID4gaW5kZXggYjU3YTM3NTQzNjEzLi5mY2I0OGFjNjA1OTggMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3F4bC9xeGxfZHJ2LmMKPiA+IEBAIC02Myw2ICs2MywxMSBAQCBtb2R1bGVfcGFyYW1fbmFt
ZWQobnVtX2hlYWRzLCBxeGxfbnVtX2NydGMsIGludCwgMDQwMCk7Cj4gPiAgc3RhdGljIHN0cnVj
dCBkcm1fZHJpdmVyIHF4bF9kcml2ZXI7Cj4gPiAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIHF4
bF9wY2lfZHJpdmVyOwo+ID4KPiA+ICtzdGF0aWMgYm9vbCBpc192Z2Eoc3RydWN0IHBjaV9kZXYg
KnBkZXYpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHBkZXYtPmNsYXNzID09IFBDSV9DTEFTU19E
SVNQTEFZX1ZHQSA8PCA4Owo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW50Cj4gPiAgcXhsX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQg
KmVudCkKPiA+ICB7Cj4gPiBAQCAtODcsOSArOTIsMTcgQEAgcXhsX3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKPiA+ICAgICAg
IGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIGdvdG8gZGlzYWJsZV9wY2k7Cj4gPgo+ID4gKyAg
ICAgaWYgKGlzX3ZnYShwZGV2KSkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSB2Z2FfZ2V0X2lu
dGVycnVwdGlibGUocGRldiwgVkdBX1JTUkNfTEVHQUNZX0lPKTsKPiA+ICsgICAgICAgICAgICAg
aWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiY2FuJ3QgZ2V0
IGxlZ2FjeSB2Z2EgaW9wb3J0c1xuIik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byBk
aXNhYmxlX3BjaTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAg
ICAgcmV0ID0gcXhsX2RldmljZV9pbml0KHFkZXYsICZxeGxfZHJpdmVyLCBwZGV2KTsKPiA+ICAg
ICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgIGdvdG8gZGlzYWJsZV9wY2k7Cj4gPiArICAg
ICAgICAgICAgIGdvdG8gcHV0X3ZnYTsKPiA+Cj4gPiAgICAgICByZXQgPSBxeGxfbW9kZXNldF9p
bml0KHFkZXYpOwo+ID4gICAgICAgaWYgKHJldCkKPiA+IEBAIC0xMDksNiArMTIyLDkgQEAgcXhs
X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgKmVudCkKPiA+ICAgICAgIHF4bF9tb2Rlc2V0X2ZpbmkocWRldik7Cj4gPiAgdW5sb2FkOgo+
ID4gICAgICAgcXhsX2RldmljZV9maW5pKHFkZXYpOwo+ID4gK3B1dF92Z2E6Cj4gPiArICAgICBp
ZiAoaXNfdmdhKHBkZXYpKQo+ID4gKyAgICAgICAgICAgICB2Z2FfcHV0KHBkZXYsIFZHQV9SU1JD
X0xFR0FDWV9JTyk7Cj4gPiAgZGlzYWJsZV9wY2k6Cj4gPiAgICAgICBwY2lfZGlzYWJsZV9kZXZp
Y2UocGRldik7Cj4gPiAgZnJlZV9kZXY6Cj4gPiBAQCAtMTI2LDYgKzE0Miw4IEBAIHF4bF9wY2lf
cmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ID4KPiA+ICAgICAgIHF4bF9tb2Rlc2V0X2Zp
bmkocWRldik7Cj4gPiAgICAgICBxeGxfZGV2aWNlX2ZpbmkocWRldik7Cj4gPiArICAgICBpZiAo
aXNfdmdhKHBkZXYpKQo+ID4gKyAgICAgICAgICAgICB2Z2FfcHV0KHBkZXYsIFZHQV9SU1JDX0xF
R0FDWV9JTyk7Cj4gPgo+ID4gICAgICAgZGV2LT5kZXZfcHJpdmF0ZSA9IE5VTEw7Cj4gPiAgICAg
ICBrZnJlZShxZGV2KTsKPiA+IC0tCj4gPiAyLjE4LjEKPiA+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
