Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0DC98B3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D7A6E221;
	Thu,  3 Oct 2019 06:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DB06E221
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:56:02 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h33so1367428edh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1O/m2RHGnuqku3yr69v1puhEpk9yyZ7Bn2a9zyF0W0s=;
 b=sRqRqel2ohEXySSrqsgxkjKYRYgC85dJsTVluUTALHqBjhB+m4Gbp09cgGGAqUWtr1
 89FSO4gHupoff+LOzpNXSCY6PeJMqpmDLWLwWdpmIfuLPwvoA4ob9RlQI48owCpKqBCb
 z9wRECMOwhtlEs41IQDhksAV2gU0xu4ibdABPqFxa87dB0Ymnoq5zLub0ofBZPSZ7PwR
 7s5wqrC6ZHg8Xbb7tR/tdkErjc8F+lAm9iESK9c8YcDlxqWXaSrNdO6GtZfzpA768dEo
 wBH/+1PHEUIVujgJAmN0aEsiESp1nEtn8b+9nXy+rMH+Ats/yDjudHQkGHIYVg035hNz
 duYw==
X-Gm-Message-State: APjAAAVl+iMJJZq2+mL1li2ygzs4EtU6V/5xipMJw8i/y9ytdd0PPKYY
 KNx8IbX5H/VEb/U2O/7DaOAZCKOcQ1k=
X-Google-Smtp-Source: APXvYqyKoNJlThdIXNaN7+vNplP0rdzi6SRhmvu7G3EoKAqJ9TpdTFiSgkWNlNhNMWMUGik7z8+Kfg==
X-Received: by 2002:a50:b685:: with SMTP id d5mr7943159ede.258.1570085760417; 
 Wed, 02 Oct 2019 23:56:00 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id c32sm297726eda.97.2019.10.02.23.55.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 23:56:00 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id r3so1637666wrj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:55:59 -0700 (PDT)
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr858936wrw.142.1570085759470;
 Wed, 02 Oct 2019 23:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-6-jagan@amarulasolutions.com>
In-Reply-To: <20191003064527.15128-6-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 3 Oct 2019 14:55:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
Message-ID: <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator
 support
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAyOjQ2IFBNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPiB3cm90ZToKPgo+IEFsbHdpbm5lciBNSVBJIERTSSBjb250cm9sbGVycyBh
cmUgc3VwcGxpZWQgd2l0aCBTb0MKPiBEU0kgcG93ZXIgcmFpbHMgdmlhIFZDQy1EU0kgcGluLgo+
Cj4gQWRkIHN1cHBvcnQgZm9yIHRoaXMgc3VwcGx5IHBpbiBieSBhZGRpbmcgdm9sdGFnZQo+IHJl
Z3VsYXRvciBoYW5kbGluZyBjb2RlIHRvIE1JUEkgRFNJIGRyaXZlci4KPgo+IFRlc3RlZC1ieTog
TWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEphZ2Fu
IFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyB8IDE0ICsrKysrKysrKysrKysrCj4gIGRyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oIHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjZpX21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2ku
Ywo+IGluZGV4IDQ0NmRjNTZjYzQ0Yi4uZmU5YTM2NjdmM2ExIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiBAQCAtMTExMCw2ICsxMTEwLDEyIEBAIHN0YXRpYyBp
bnQgc3VuNmlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBQVFJfRVJSKGJhc2UpOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBk
c2ktPnJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJ2Y2MtZHNpIik7Cj4gKyAg
ICAgICBpZiAoSVNfRVJSKGRzaS0+cmVndWxhdG9yKSkgewo+ICsgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIkNvdWxkbid0IGdldCBWQ0MtRFNJIHN1cHBseVxuIik7Cj4gKyAgICAgICAgICAg
ICAgIHJldHVybiBQVFJfRVJSKGRzaS0+cmVndWxhdG9yKTsKPiArICAgICAgIH0KPiArCj4gICAg
ICAgICBkc2ktPnJlZ3MgPSBkZXZtX3JlZ21hcF9pbml0X21taW9fY2xrKGRldiwgImJ1cyIsIGJh
c2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdW42
aV9kc2lfcmVnbWFwX2NvbmZpZyk7Cj4gICAgICAgICBpZiAoSVNfRVJSKGRzaS0+cmVncykpIHsK
PiBAQCAtMTE4Myw2ICsxMTg5LDEzIEBAIHN0YXRpYyBpbnQgc3VuNmlfZHNpX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN1
bjZpX2RzaV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBzdW42aV9kc2kgKmRzaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICsgICAgICAg
aW50IGVycjsKPiArCj4gKyAgICAgICBlcnIgPSByZWd1bGF0b3JfZW5hYmxlKGRzaS0+cmVndWxh
dG9yKTsKPiArICAgICAgIGlmIChlcnIpIHsKPiArICAgICAgICAgICAgICAgZGV2X2Vycihkc2kt
PmRldiwgImZhaWxlZCB0byBlbmFibGUgVkNDLURTSSBzdXBwbHk6ICVkXG4iLCBlcnIpOwo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICByZXNldF9j
b250cm9sX2RlYXNzZXJ0KGRzaS0+cmVzZXQpOwo+ICAgICAgICAgY2xrX3ByZXBhcmVfZW5hYmxl
KGRzaS0+bW9kX2Nsayk7Cj4gQEAgLTEyMTUsNiArMTIyOCw3IEBAIHN0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgc3VuNmlfZHNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4K
PiAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPm1vZF9jbGspOwo+ICAgICAgICAg
cmVzZXRfY29udHJvbF9hc3NlcnQoZHNpLT5yZXNldCk7Cj4gKyAgICAgICByZWd1bGF0b3JfZGlz
YWJsZShkc2ktPnJlZ3VsYXRvcik7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKPiBpbmRleCA1YzNhZDViZTA2OTAuLmEwMWQ0
NGU5ZTQ2MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9k
c2kuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oCj4gQEAg
LTEyLDYgKzEyLDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fY29ubmVjdG9yLmg+Cj4gICNpbmNs
dWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgoKWW91IGRvbid0IG5lZWQg
dG8gaW5jbHVkZSB0aGUgaGVhZGVyIGZpbGUgc2luY2UgeW91IGFyZSBvbmx5CmluY2x1ZGluZyBh
IHBvaW50ZXIgdG8gdGhlIHN0cnVjdCwgYW5kIG5vdGhpbmcgZWxzZS4KCk90aGVyd2lzZSwKClJl
dmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cgo+Cj4gICNkZWZpbmUgU1VO
NklfRFNJX1RDT05fRElWICAgICA0Cj4KPiBAQCAtMjMsNiArMjQsNyBAQCBzdHJ1Y3Qgc3VuNmlf
ZHNpIHsKPiAgICAgICAgIHN0cnVjdCBjbGsgICAgICAgICAgICAgICpidXNfY2xrOwo+ICAgICAg
ICAgc3RydWN0IGNsayAgICAgICAgICAgICAgKm1vZF9jbGs7Cj4gICAgICAgICBzdHJ1Y3QgcmVn
bWFwICAgICAgICAgICAqcmVnczsKPiArICAgICAgIHN0cnVjdCByZWd1bGF0b3IgICAgICAgICpy
ZWd1bGF0b3I7Cj4gICAgICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbCAgICAqcmVzZXQ7Cj4gICAg
ICAgICBzdHJ1Y3QgcGh5ICAgICAgICAgICAgICAqZHBoeTsKPgo+IC0tCj4gMi4xOC4wLjMyMS5n
ZmZjNmZhMGUzCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
