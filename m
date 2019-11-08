Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE987F4DB9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 15:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1A06F9A2;
	Fri,  8 Nov 2019 14:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A970E6F9A2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 14:07:10 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iT4uS-0001Tu-Pp; Fri, 08 Nov 2019 15:06:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
Date: Fri, 08 Nov 2019 15:06:44 +0100
Message-ID: <4996186.DxzAFJqeGu@diego>
In-Reply-To: <20191108124630.GA10207@wambui>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
 <20191107133851.GF63329@art_vandelay> <20191108124630.GA10207@wambui>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpbaXQgc2VlbXMgeW91ciBSZXBseS1UbyBtYWlsIGhlYWRlciBpcyBzZXQgc3RyYW5nZWx5
IGFzClJlcGx5LVRvOiAyMDE5MTEwNzEzMzg1MS5HRjYzMzI5QGFydF92YW5kZWxheQp3aGljaCBj
b25mdXNlcyBteSBNVEFdCgpBbSBGcmVpdGFnLCA4LiBOb3ZlbWJlciAyMDE5LCAxMzo0NjozMCBD
RVQgc2NocmllYiBXYW1idWkgS2FydWdhOgo+IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDA4OjM4
OjUxQU0gLTA1MDAsIFNlYW4gUGF1bCB3cm90ZToKPiA+IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0
IDAxOjU0OjIyQU0gLTA4MDAsIEpvZSBQZXJjaGVzIHdyb3RlOgo+ID4gPiBPbiBUaHUsIDIwMTkt
MTEtMDcgYXQgMTI6MjkgKzAzMDAsIFdhbWJ1aSBLYXJ1Z2Egd3JvdGU6Cj4gPiA+ID4gUmVwbGFj
ZSB0aGUgdXNlIG9mIHRoZSBkZXZfZXJyIG1hY3JvIHdpdGggdGhlIERSTV9ERVZfRVJST1IKPiA+
ID4gPiBEUk0gaGVscGVyIG1hY3JvLgo+ID4gPiAKPiA+ID4gVGhlIGNvbW1pdCBtZXNzYWdlIHNo
b3VsZCBzaG93IHRoZSByZWFzb24gX3doeV8geW91IGFyZSBkb2luZwo+ID4gPiB0aGlzIGluc3Rl
YWQgb2YganVzdCBzdGF0aW5nIHRoYXQgeW91IGFyZSBkb2luZyB0aGlzLgo+ID4gPiAKPiA+ID4g
SXQncyBub3QgdGhhdCBkZXZfZXJyIGlzIHVuY29tbW9uIGluIGRyaXZlcnMvZ3B1L2RybS4KPiA+
ID4gCj4gPiAKPiA+IEl0IGlzIHVuY29tbW9uICh0aGlzIGlzIHRoZSBzb2xlIGluc3RhbmNlKSBp
biByb2NrY2hpcCwgaG93ZXZlci4gU28gaXQgbWFrZXMKPiA+IHNlbnNlIHRvIGNvbnZlcnQgdGhl
IGRldl8qIHByaW50cyBpbiByb2NrY2hpcCB0byBEUk1fREVWIGZvciBjb25zaXN0ZW5jeS4KPiA+
IAo+ID4gV2FtYnVpLCBjb3VsZCB5b3UgYWxzbyBwbGVhc2UgY29udmVydCB0aGUgZGV2X3dhcm4g
aW5zdGFuY2UgYXMgd2VsbD8KPiA+IAo+IEhleSwgU2Vhbi4KPiBUcnlpbmcgdG8gY29udmVydCB0
aGlzIGRldl93YXJuIGluc3RhbmNlLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcgRFJNX1dBUk4KPiBt
YWNybyBkb2VzIG5vdCB0YWtlIHRoZSBkZXYgcGFyYW1ldGVyIHdoaWNoIHNlZW1zIHRvIGJlIHVz
ZWZ1bCBpbiB0aGUKPiBvcmlnaW5hbCBvdXRwdXQuCj4gU2hvdWxkIEkgc3RpbGwgY29udmVydCBp
dCB0byBEUk1fV0FSTiB3aXRob3V0IHRoZSBoZG1pLT5kZXYgcGFyYW1ldGVyPwoKVGhlcmUgZXhp
c3RzIERSTV9ERVZfRVJST1IsIERSTV9ERVZfSU5GTyBhbmQgRFJNX0RFVl9ERUJVRyB0bwpoYW5k
bGUgYWN0dWFsIGRldmljZXMuIEludGVyZXN0aW5nbHkgdGhlcmUgaXMgbm8gRFJNX0RFVl9XQVJO
IHRob3VnaC4KClNvIGRlcGVuZGluZyBvbiB3aGF0IFNlYW4gc3VnZ2VzdCBhbm90aGVyIG9wdGlv
biB3b3VsZCBiZSB0byBhZGQgdGhlCm1pc3NpbmcgRFJNX0RFVl9XQVJOIGFuZCB0aGVuIHVzZSBp
dCB0byByZXBsYWNlIHRoZSBkZXZfd2Fybi4KCgpIZWlrbwoKCgo+IAo+IFRoYW5rcywKPiB3YW1i
dWkKPiA+IEknbGwgYXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0IGFuZCBleHBhbmQgb24gdGhl
IGNvbW1pdCBtZXNzYWdlIGEgYml0Lgo+ID4gCj4gPiBUaGFua3MsCj4gPiAKPiA+IFNlYW4KPiA+
IAo+ID4gPiAkIGdpdCBncmVwIC13IGRldl9lcnIgZHJpdmVycy9ncHUvZHJtIHwgd2MgLWwKPiA+
ID4gMTk1MAo+ID4gPiAkIGdpdCBncmVwIC13IERSTV9ERVZfRVJST1IgZHJpdmVycy9ncHUvZHJt
IHwgd2MgLWwKPiA+ID4gNzU2Cj4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCj4gPiA+IFtdCj4gPiA+ID4gQEAgLTkxNiw3
ICs5MTYsNyBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3JvY2tjaGlwX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4gIAl9Cj4gPiA+ID4gIAo+ID4gPiA+ICAJaWYg
KCFkc2ktPmNkYXRhKSB7Cj4gPiA+ID4gLQkJZGV2X2VycihkZXYsICJubyBkc2ktY29uZmlnIGZv
ciAlcyBub2RlXG4iLCBucC0+bmFtZSk7Cj4gPiA+ID4gKwkJRFJNX0RFVl9FUlJPUihkZXYsICJu
byBkc2ktY29uZmlnIGZvciAlcyBub2RlXG4iLCBucC0+bmFtZSk7Cj4gPiA+ID4gIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gPiA+ID4gIAl9Cj4gPiA+IAo+ID4gPiAKPiA+ID4gCj4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+
ID4gCj4gCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
