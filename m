Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB414AD8B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 23:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1A6E261;
	Tue, 18 Jun 2019 21:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50A66E261
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:47:34 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id j8so7623900uan.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0RWfX7/brWCQJZlmTP4b1pf0cVwk5bUjTnCrdF8UAY=;
 b=h2uE475fkMys00APUUwsNOOkhD7Na9pf9ct6FXksBjZr+o3mU7pyP+cLqEoHi0YN1G
 +0skAi/6KJ74jAZyqFFKyl4Dcyh4mLLUlOMntbyROq1ek9ZAjhVj4L4t/k+Jdnr7xMrq
 yn68bdcH9v1i3/AnpcgS76tC0qiuq5/nfjxwmkrlBBoez96wvnxxE98QJ4S6u89RI4Fv
 0BnxvpDZDzbNEYYQPp+UAXDfdJUZtA8oFMXo9ON+tOnferN12rOlfNGZspxv6MtTMPj0
 8ngV4y0kMFZUTmzzGzOoQebiSeIibno4wZ8TWAqh4hrycPeq/yhcO17OBScgoW0PTQ7D
 /z+A==
X-Gm-Message-State: APjAAAUvO6GeCzvEiWzpeNSAgBJBvMwWk3TbZ5rUF1W1MAD6w8sRDI8E
 xHMbbSJH/tB9MWcJ9Ba7CLmZvAMoxGpyLgsvULsDeg==
X-Google-Smtp-Source: APXvYqxuHJvBUgcTAIF7H6uuKf/TgeRQI8Gc97Xr2WBYZISyfbVN7S7r7p3sI20JELN7OjPaH4dM5N25VHb2Dddyzm8=
X-Received: by 2002:a9f:31a2:: with SMTP id v31mr12191937uad.15.1560894453845; 
 Tue, 18 Jun 2019 14:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <20190618213406.7667-3-ezequiel@collabora.com>
In-Reply-To: <20190618213406.7667-3-ezequiel@collabora.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 18 Jun 2019 17:47:22 -0400
Message-ID: <CAKb7UvgvY0tJDV9A=4+8=iqraziyt8SGF-QrX=M8jz+R+5JC=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
To: Ezequiel Garcia <ezequiel@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgNTo0MyBQTSBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVs
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gQWRkIGFuIG9wdGlvbmFsIENSVEMgZ2FtbWEgTFVU
IHN1cHBvcnQsIGFuZCBlbmFibGUgaXQgb24gUkszMjg4Lgo+IFRoaXMgaXMgY3VycmVudGx5IGVu
YWJsZWQgdmlhIGEgc2VwYXJhdGUgYWRkcmVzcyByZXNvdXJjZSwKPiB3aGljaCBuZWVkcyB0byBi
ZSBzcGVjaWZpZWQgaW4gdGhlIGRldmljZXRyZWUuCj4KPiBUaGUgYWRkcmVzcyByZXNvdXJjZSBp
cyByZXF1aXJlZCBiZWNhdXNlIG9uIHNvbWUgU29Dcywgc3VjaCBhcwo+IFJLMzI4OCwgdGhlIExV
VCBhZGRyZXNzIGlzIGFmdGVyIHRoZSBNTVUgYWRkcmVzcywgYW5kIHRoZSBsYXR0ZXIKPiBpcyBz
dXBwb3J0ZWQgYnkgYSBkaWZmZXJlbnQgZHJpdmVyLiBUaGlzIHByZXZlbnRzIHRoZSBEUk0gZHJp
dmVyCj4gZnJvbSByZXF1ZXN0aW5nIGFuIGVudGlyZSByZWdpc3RlciBzcGFjZS4KPgo+IFRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uIHdvcmtzIGZvciBSR0IgMTAtYml0IHRhYmxlcywgYXMgdGhh
dAo+IGlzIHdoYXQgc2VlbXMgdG8gd29yayBvbiBSSzMyODguCj4KPiBTaWduZWQtb2ZmLWJ5OiBF
emVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBm
cm9tIFJGQzoKPiAqIFJlcXVlc3QgKGFuIG9wdGlvbmFsKSBhZGRyZXNzIHJlc291cmNlIGZvciB0
aGUgTFVULgo+ICogRHJvcCBzdXBwb3J0IGZvciBSSzMzOTksIHdoaWNoIGRvZXNuJ3Qgc2VlbSB0
byB3b3JrCj4gICBvdXQgb2YgdGhlIGJveCBhbmQgbmVlZHMgbW9yZSByZXNlYXJjaC4KPiAqIFN1
cHBvcnQgcGFzcy10aHJ1IHNldHRpbmcgd2hlbiBHQU1NQV9MVVQgaXMgTlVMTC4KPiAqIEFkZCBh
IGNoZWNrIGZvciB0aGUgZ2FtbWEgc2l6ZSwgYXMgc3VnZ2VzdGVkIGJ5IElsaWEuCj4gKiBNb3Zl
IGdhbW1hIHNldHRpbmcgdG8gYXRvbWljX2NvbW1pdF90YWlsLCBhcyBwb2ludGVkCj4gICBvdXQg
YnkgSmFjb3BvL0xhdXJlbnQsIGlzIHRoZSBjb3JyZWN0IHdheS4KPiAtLS0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPiBpbmRleCAxMmVkNTI2NWE5MGIu
LjViNmVkYmUyNjczZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2RybV92b3AuYwo+ICtzdGF0aWMgdm9pZCB2b3BfY3J0Y19nYW1tYV9zZXQoc3RydWN0IHZvcCAq
dm9wLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlKQo+ICt7Cj4gKyAgICAgICBpbnQg
aWRsZSwgcmV0LCBpOwo+ICsKPiArICAgICAgIHNwaW5fbG9jaygmdm9wLT5yZWdfbG9jayk7Cj4g
KyAgICAgICBWT1BfUkVHX1NFVCh2b3AsIGNvbW1vbiwgZHNwX2x1dF9lbiwgMCk7Cj4gKyAgICAg
ICB2b3BfY2ZnX2RvbmUodm9wKTsKPiArICAgICAgIHNwaW5fdW5sb2NrKCZ2b3AtPnJlZ19sb2Nr
KTsKPiArCj4gKyAgICAgICByZXQgPSByZWFkeF9wb2xsX3RpbWVvdXQodm9wX2RzcF9sdXRfaXNf
ZW5hYmxlLCB2b3AsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgaWRsZSwgIWlkbGUsIDUs
IDMwICogMTAwMCk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICByZXR1cm47
Cj4gKwo+ICsgICAgICAgc3Bpbl9sb2NrKCZ2b3AtPnJlZ19sb2NrKTsKPiArCj4gKyAgICAgICBp
ZiAoY3J0Yy0+c3RhdGUtPmdhbW1hX2x1dCkgewo+ICsgICAgICAgICAgICAgICBpZiAoIW9sZF9z
dGF0ZS0+Z2FtbWFfbHV0IHx8IChjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkICE9Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZF9zdGF0ZS0+
Z2FtbWFfbHV0LT5iYXNlLmlkKSkKPiArICAgICAgICAgICAgICAgICAgICAgICB2b3BfY3J0Y193
cml0ZV9nYW1tYV9sdXQodm9wLCBjcnRjKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBjcnRjLT5nYW1tYV9zaXplOyBpKyspIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICB1MzIgd29yZDsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
d29yZCA9IChpIDw8IDIwKSB8IChpIDw8IDEwKSB8IGk7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgd3JpdGVsKHdvcmQsIHZvcC0+bHV0X3JlZ3MgKyBpICogNCk7Cj4gKyAgICAgICAgICAgICAg
IH0KCk5vdGUgLSBJJ20gbm90IGluIGFueSB3YXkgZmFtaWxpYXIgd2l0aCB0aGUgaGFyZHdhcmUs
IHNvIHRha2Ugd2l0aCBhCmdyYWluIG9mIHNhbHQgLS0KCkNvdWxkIHlvdSBqdXN0IGxlYXZlIGRz
cF9sdXRfZW4gdHVybmVkIG9mZiBpbiB0aGlzIGNhc2U/CgpDaGVlcnMsCgogIC1pbGlhCgo+ICsg
ICAgICAgfQo+ICsKPiArICAgICAgIFZPUF9SRUdfU0VUKHZvcCwgY29tbW9uLCBkc3BfbHV0X2Vu
LCAxKTsKPiArICAgICAgIHZvcF9jZmdfZG9uZSh2b3ApOwo+ICsgICAgICAgc3Bpbl91bmxvY2so
JnZvcC0+cmVnX2xvY2spOwo+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
