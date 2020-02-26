Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473C16F616
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 04:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE96E0E3;
	Wed, 26 Feb 2020 03:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7D76E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 03:30:02 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g19so1937227eds.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UXofy6EkwfdL30O9+SzmICCU7Qa0hak4F21CzXTG5yo=;
 b=Z2stooSrDQFBpQXQY9WdKOQKnsHxpIEfnGRLIJF2BHEn6hdnytX9aDe+FRj3nKayBz
 RFix4xe05EDxQht0Xa9aboiCCNJcR0ST/qEW694XpDqdm5njwbBofHfYdKCRZ/CQ89C1
 QSqs1rZuJ1dZmhiuXJt81Vri+uSlQ8H2WWIoRFomy1vrRMDPDnN6v6e4eaenFSq4T9me
 bp6eDpk8cds2nGLx4WGokzqf/ed12SM0eTbVgLV6b3FwA+pNGIRSpaQ0j/qZJYcGkfSc
 8JgI2A2VlzHEl/uLjM5yLmBFxzUwyK5XUlJsIAVDNktAINzKBcKjPPCzmCrmBT60ledZ
 oIjg==
X-Gm-Message-State: APjAAAWsd18sTd8BzLJm+0kL1qts1Tx0SnT6i7hR+79FBiRiNfV1paVe
 uaEZJfRUFlR80TH1xUHke7xGWzxpbEw=
X-Google-Smtp-Source: APXvYqy+fp0XkLln5PDHhjK4VbF1mnayIq98EOVkBYUdNKB4Tn2TWx75kUji7F69MvQzrbKihSkS5Q==
X-Received: by 2002:a05:6402:30ba:: with SMTP id
 df26mr2114697edb.382.1582687801145; 
 Tue, 25 Feb 2020 19:30:01 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id q8sm18085edc.59.2020.02.25.19.30.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 19:30:00 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id a5so1388277wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:30:00 -0800 (PST)
X-Received: by 2002:a05:600c:10d2:: with SMTP id
 l18mr2582096wmd.122.1582687800441; 
 Tue, 25 Feb 2020 19:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
 <20200225083448.6upblnctjjrbarje@gilmour.lan>
 <CAGb2v64g7Q4e+ic08pA7tbamgToOjyYzuzqP0bpqBZjRuRUrPA@mail.gmail.com>
 <12462592.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <12462592.uLZWGnKmhe@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 26 Feb 2020 11:29:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v65=a3p1xrz3RuT7w9p+KqRbYMVqf7_GajEQHOpQnTAqnA@mail.gmail.com>
Message-ID: <CAGb2v65=a3p1xrz3RuT7w9p+KqRbYMVqf7_GajEQHOpQnTAqnA@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/sun4i: de2: Don't return de2_fmt_info struct
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMjo1MCBBTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQHNpb2wubmV0PiB3cm90ZToKPgo+IEhpIQo+Cj4gRG5lIHRvcmVrLCAyNS4gZmVicnVh
ciAyMDIwIG9iIDA5OjUyOjE4IENFVCBqZSBDaGVuLVl1IFRzYWkgbmFwaXNhbChhKToKPiA+IE9u
IFR1ZSwgRmViIDI1LCAyMDIwIGF0IDQ6MzUgUE0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5v
LnRlY2g+IHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gT24gTW9uLCBGZWIgMjQsIDIwMjAg
YXQgMDY6Mzk6MDBQTSArMDEwMCwgSmVybmVqIFNrcmFiZWMgd3JvdGU6Cj4gPiA+ID4gTm93IHRo
YXQgZGUyX2ZtdF9pbmZvIGNvbnRhaW5zIG9ubHkgRFJNIDwtPiBIVyBmb3JtYXQgbWFwcGluZywg
aXQKPiA+ID4gPiBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gcmV0dXJuIHBvaW50ZXIgdG8gc3RydWN0
dXJlIHdoZW4gc2VhcmNoaW5nIGJ5IERSTQo+ID4gPiA+IGZvcm1hdC4gUmV3b3JrIHRoYXQgdG8g
cmV0dXJuIG9ubHkgSFcgZm9ybWF0IGluc3RlYWQuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGRvZXNu
J3QgbWFrZSBhbnkgZnVuY3Rpb25hbCBjaGFuZ2UuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gPiA+ID4gLS0t
Cj4gPiA+ID4KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX21peGVyLmMgICAg
fCAxNSArKysrKysrKysrKy0tLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhp
X21peGVyLmggICAgfCAgNyArLS0tLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW44aV91aV9sYXllci5jIHwgMTAgKysrKystLS0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuOGlfdmlfbGF5ZXIuYyB8IDEyICsrKysrKy0tLS0tLQo+ID4gPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9taXhlci5jCj4gPiA+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfbWl4ZXIuYyBpbmRleCBlMDc4ZWM5NmRl
MmQuLjU2Y2MwMzdmZDMxMgo+ID4gPiA+IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW44aV9taXhlci5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX21peGVyLmMKPiA+ID4gPiBAQCAtMjcsNiArMjcsMTEgQEAKPiA+ID4gPgo+ID4g
PiA+ICAjaW5jbHVkZSAic3VuOGlfdmlfbGF5ZXIuaCIKPiA+ID4gPiAgI2luY2x1ZGUgInN1bnhp
X2VuZ2luZS5oIgo+ID4gPiA+Cj4gPiA+ID4gK3N0cnVjdCBkZTJfZm10X2luZm8gewo+ID4gPiA+
ICsgICAgIHUzMiAgICAgZHJtX2ZtdDsKPiA+ID4gPiArICAgICB1MzIgICAgIGRlMl9mbXQ7Cj4g
PiA+ID4gK307Cj4gPiA+ID4gKwo+ID4gPiA+Cj4gPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGUyX2ZtdF9pbmZvIGRlMl9mb3JtYXRzW10gPSB7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICB7Cj4g
PiA+ID4KPiA+ID4gPiAgICAgICAgICAgICAgIC5kcm1fZm10ID0gRFJNX0ZPUk1BVF9BUkdCODg4
OCwKPiA+ID4gPgo+ID4gPiA+IEBAIC0yMzAsMTUgKzIzNSwxNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRlMl9mbXRfaW5mbyBkZTJfZm9ybWF0c1tdID0gewo+ID4gPiA+Cj4gPiA+ID4gICAgICAg
fSwKPiA+ID4gPgo+ID4gPiA+ICB9Owo+ID4gPiA+Cj4gPiA+ID4gLWNvbnN0IHN0cnVjdCBkZTJf
Zm10X2luZm8gKnN1bjhpX21peGVyX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQpCj4gPiA+ID4gK2lu
dCBzdW44aV9taXhlcl9kcm1fZm9ybWF0X3RvX2h3KHUzMiBmb3JtYXQsIHUzMiAqaHdfZm9ybWF0
KQo+ID4gPiA+Cj4gPiA+ID4gIHsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGludCBp
Owo+ID4gPiA+Cj4gPiA+ID4gICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGUyX2Zv
cm1hdHMpOyArK2kpCj4gPiA+ID4KPiA+ID4gPiAtICAgICAgICAgICAgIGlmIChkZTJfZm9ybWF0
c1tpXS5kcm1fZm10ID09IGZvcm1hdCkKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuICZkZTJfZm9ybWF0c1tpXTsKPiA+ID4gPiArICAgICAgICAgICAgIGlmIChkZTJfZm9ybWF0
c1tpXS5kcm1fZm10ID09IGZvcm1hdCkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAq
aHdfZm9ybWF0ID0gZGUyX2Zvcm1hdHNbaV0uZGUyX2ZtdDsKPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gKyAgICAgICAgICAgICB9Cj4gPiA+ID4KPiA+ID4g
PiAtICAgICByZXR1cm4gTlVMTDsKPiA+ID4gPiArICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4g
Pgo+ID4gPiA+ICB9Cj4gPiA+Cj4gPiA+IEknbSBub3QgdG9vIHN1cmUgYWJvdXQgdGhhdCBvbmUu
IEl0IGJyZWFrcyB0aGUgY29uc2lzdGVuY3kgd2l0aCB0aGUKPiA+ID4gb3RoZXIgZnVuY3Rpb25z
LCBhbmQgSSBkb24ndCByZWFsbHkgc2VlIGEgcGFydGljdWxhciBiZW5lZml0IHRvIGl0Pwo+ID4K
Pgo+IEkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3BpbmlvbiBhYm91dCB0aGlzIHBhdGNoLiBJdCBjYW4g
YmUgZHJvcHBlZC4KPgo+ID4gSSBndWVzcyB3ZSBjb3VsZCBqdXN0IGRlZmluZSBhbiAiaW52YWxp
ZCIgdmFsdWUsIGFuZCBoYXZlIHRoZSBmdW5jdGlvbgo+ID4gcmV0dXJuIHRoYXQgaWYgY2FuJ3Qg
ZmluZCBhIG1hdGNoPyBJJ20gZ3Vlc3NpbmcgMHgwIGlzIHZhbGlkLCBzbyBtYXliZQo+ID4gMHhm
ZmZmZmZmZiBvciAweGRlYWRiZWVmID8KPiA+Cj4gPiBUaGF0IHdvdWxkIGtlZXAgY29uc2lzdGVu
Y3kgd2l0aCBldmVyeXRoaW5nIGVsc2UgYWxsIHRoZSB3aGlsZQo+ID4gcmVtb3ZpbmcgdGhlIGxl
dmVsIG9mIGluZGlyZWN0aW9uIHlvdSB3YW50ZWQgdG8uCj4KPiBJIG1vZGVsZWQgdGhpcyBhZnRl
cgo+IHN0YXRpYyBpbnQgc3VuNGlfYmFja2VuZF9kcm1fZm9ybWF0X3RvX2xheWVyKHUzMiBmb3Jt
YXQsIHUzMiAqbW9kZSk7Cj4gZnJvbSBzdW40aV9iYWNrZW5kLmMuCj4KPiBXaGF0IGNvbnNpc3Rl
bmN5IGRvIHlvdSBoYXZlIGluIG1pbmQ/CgpEaXJlY3RseSByZXR1cm5pbmcgdmFsdWVzIChvciBl
cnJvciBjb2RlcykgaW5zdGVhZCBvZiBwYXNzaW5nIGluIGEgcG9pbnRlcgpmb3IgZGF0YSB0byBi
ZSByZXR1cm5lZC4gSSBhc3N1bWVkIHRoYXQgd2FzIHdoYXQgTWF4aW1lIHdhcyByZWZlcnJpbmcg
dG8uCgpDaGVuWXUKCj4gPgo+ID4gQ2hlbll1Cj4gPgo+ID4gPiBUaGUgcmVzdCBvZiB0aGUgc2Vy
aWVzIGlzCj4gPiA+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+
Cj4KPiBUaGFua3MhCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVqCj4KPiA+ID4KPiA+ID4gTWF4
aW1lCj4KPgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
