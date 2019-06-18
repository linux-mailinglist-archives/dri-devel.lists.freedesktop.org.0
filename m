Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DC4ADC0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 00:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E7C6E25F;
	Tue, 18 Jun 2019 22:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D82A6E25F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:18:05 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hdMQS-0003J3-UP; Wed, 19 Jun 2019 00:18:00 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
Date: Wed, 19 Jun 2019 00:18:00 +0200
Message-ID: <31857290.5uKucqQp3M@diego>
In-Reply-To: <20372cd5e56d67b8e896c2d94b3d0d136cc2886e.camel@collabora.com>
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <CAKb7UvgvY0tJDV9A=4+8=iqraziyt8SGF-QrX=M8jz+R+5JC=A@mail.gmail.com>
 <20372cd5e56d67b8e896c2d94b3d0d136cc2886e.camel@collabora.com>
MIME-Version: 1.0
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
 Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIDE5LiBKdW5pIDIwMTksIDAwOjA5OjU3IENFU1Qgc2NocmllYiBFemVxdWll
bCBHYXJjaWE6Cj4gT24gVHVlLCAyMDE5LTA2LTE4IGF0IDE3OjQ3IC0wNDAwLCBJbGlhIE1pcmtp
biB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDU6NDMgUE0gRXplcXVpZWwgR2Fy
Y2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+ID4gQWRkIGFuIG9wdGlvbmFs
IENSVEMgZ2FtbWEgTFVUIHN1cHBvcnQsIGFuZCBlbmFibGUgaXQgb24gUkszMjg4Lgo+ID4gPiBU
aGlzIGlzIGN1cnJlbnRseSBlbmFibGVkIHZpYSBhIHNlcGFyYXRlIGFkZHJlc3MgcmVzb3VyY2Us
Cj4gPiA+IHdoaWNoIG5lZWRzIHRvIGJlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNldHJlZS4KPiA+
ID4gCj4gPiA+IFRoZSBhZGRyZXNzIHJlc291cmNlIGlzIHJlcXVpcmVkIGJlY2F1c2Ugb24gc29t
ZSBTb0NzLCBzdWNoIGFzCj4gPiA+IFJLMzI4OCwgdGhlIExVVCBhZGRyZXNzIGlzIGFmdGVyIHRo
ZSBNTVUgYWRkcmVzcywgYW5kIHRoZSBsYXR0ZXIKPiA+ID4gaXMgc3VwcG9ydGVkIGJ5IGEgZGlm
ZmVyZW50IGRyaXZlci4gVGhpcyBwcmV2ZW50cyB0aGUgRFJNIGRyaXZlcgo+ID4gPiBmcm9tIHJl
cXVlc3RpbmcgYW4gZW50aXJlIHJlZ2lzdGVyIHNwYWNlLgo+ID4gPiAKPiA+ID4gVGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gd29ya3MgZm9yIFJHQiAxMC1iaXQgdGFibGVzLCBhcyB0aGF0Cj4g
PiA+IGlzIHdoYXQgc2VlbXMgdG8gd29yayBvbiBSSzMyODguCj4gPiA+IAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4gPiA+IC0t
LQo+ID4gPiBDaGFuZ2VzIGZyb20gUkZDOgo+ID4gPiAqIFJlcXVlc3QgKGFuIG9wdGlvbmFsKSBh
ZGRyZXNzIHJlc291cmNlIGZvciB0aGUgTFVULgo+ID4gPiAqIERyb3Agc3VwcG9ydCBmb3IgUksz
Mzk5LCB3aGljaCBkb2Vzbid0IHNlZW0gdG8gd29yawo+ID4gPiAgIG91dCBvZiB0aGUgYm94IGFu
ZCBuZWVkcyBtb3JlIHJlc2VhcmNoLgo+ID4gPiAqIFN1cHBvcnQgcGFzcy10aHJ1IHNldHRpbmcg
d2hlbiBHQU1NQV9MVVQgaXMgTlVMTC4KPiA+ID4gKiBBZGQgYSBjaGVjayBmb3IgdGhlIGdhbW1h
IHNpemUsIGFzIHN1Z2dlc3RlZCBieSBJbGlhLgo+ID4gPiAqIE1vdmUgZ2FtbWEgc2V0dGluZyB0
byBhdG9taWNfY29tbWl0X3RhaWwsIGFzIHBvaW50ZWQKPiA+ID4gICBvdXQgYnkgSmFjb3BvL0xh
dXJlbnQsIGlzIHRoZSBjb3JyZWN0IHdheS4KPiA+ID4gLS0tCj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+ID4gPiBpbmRleCAxMmVkNTI2NWE5MGIu
LjViNmVkYmUyNjczZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV92b3AuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX3ZvcC5jCj4gPiA+ICtzdGF0aWMgdm9pZCB2b3BfY3J0Y19nYW1tYV9zZXQo
c3RydWN0IHZvcCAqdm9wLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9zdGF0ZSkKPiA+
ID4gK3sKPiA+ID4gKyAgICAgICBpbnQgaWRsZSwgcmV0LCBpOwo+ID4gPiArCj4gPiA+ICsgICAg
ICAgc3Bpbl9sb2NrKCZ2b3AtPnJlZ19sb2NrKTsKPiA+ID4gKyAgICAgICBWT1BfUkVHX1NFVCh2
b3AsIGNvbW1vbiwgZHNwX2x1dF9lbiwgMCk7Cj4gPiA+ICsgICAgICAgdm9wX2NmZ19kb25lKHZv
cCk7Cj4gPiA+ICsgICAgICAgc3Bpbl91bmxvY2soJnZvcC0+cmVnX2xvY2spOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgcmV0ID0gcmVhZHhfcG9sbF90aW1lb3V0KHZvcF9kc3BfbHV0X2lzX2VuYWJs
ZSwgdm9wLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBpZGxlLCAhaWRsZSwgNSwg
MzAgKiAxMDAwKTsKPiA+ID4gKyAgICAgICBpZiAocmV0KQo+ID4gPiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+ID4gPiArCj4gPiA+ICsgICAgICAgc3Bpbl9sb2NrKCZ2b3AtPnJlZ19sb2NrKTsK
PiA+ID4gKwo+ID4gPiArICAgICAgIGlmIChjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0KSB7Cj4gPiA+
ICsgICAgICAgICAgICAgICBpZiAoIW9sZF9zdGF0ZS0+Z2FtbWFfbHV0IHx8IChjcnRjLT5zdGF0
ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkICE9Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvbGRfc3RhdGUtPmdhbW1hX2x1dC0+YmFzZS5pZCkpCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHZvcF9jcnRjX3dyaXRlX2dhbW1hX2x1dCh2b3AsIGNy
dGMpOwo+ID4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBmb3IgKGkg
PSAwOyBpIDwgY3J0Yy0+Z2FtbWFfc2l6ZTsgaSsrKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHUzMiB3b3JkOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHdv
cmQgPSAoaSA8PCAyMCkgfCAoaSA8PCAxMCkgfCBpOwo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB3cml0ZWwod29yZCwgdm9wLT5sdXRfcmVncyArIGkgKiA0KTsKPiA+ID4gKyAgICAgICAg
ICAgICAgIH0KPiA+IAo+ID4gTm90ZSAtIEknbSBub3QgaW4gYW55IHdheSBmYW1pbGlhciB3aXRo
IHRoZSBoYXJkd2FyZSwgc28gdGFrZSB3aXRoIGEKPiA+IGdyYWluIG9mIHNhbHQgLS0KPiA+IAo+
ID4gQ291bGQgeW91IGp1c3QgbGVhdmUgZHNwX2x1dF9lbiB0dXJuZWQgb2ZmIGluIHRoaXMgY2Fz
ZT8KPiA+IAo+IAo+IFRoYXQgd2FzIHRoZSBmaXJzdCB0aGluZyBJIHRyaWVkIDotKQo+IAo+IEl0
IHNlZW1zIGRzcF9sdXRfZW4gaXMgbm90IHRvIGVuYWJsZSB0aGUgQ1JUQyBnYW1tYSBMVVQgc3Rh
Z2UsCj4gYnV0IHRvIGVuYWJsZSB3cml0aW5nIHRoZSBnYW1tYSBMVVQgdG8gdGhlIGludGVybmFs
IFJBTS4KCkkgZ3Vlc3MgdGhhdCB3YXJhbnRzIGEgY29kZSBjb21tZW50IHN0YXRpbmcgdGhpcywg
c28gd2UgZG9uJ3QgZW5kCnVwIHdpdGggd2VsbC1tZWFudCBjbGVhbnVwIHBhdGNoZXMgaW4gdGhl
IGZ1dHVyZSA6LSkgLgoKCj4gCj4gQW5kIHRoZSBzcGVjcyBsaXN0IG5vIHJlZ2lzdGVyIHRvIGVu
YWJsZS9kaXNhYmxlIHRoZSBnYW1tYSBMVVQuCj4gCj4gVGhhbmtzIQo+IEV6ZQo+IAo+IAoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
