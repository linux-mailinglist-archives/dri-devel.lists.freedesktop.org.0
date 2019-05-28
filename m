Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233D2C10E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9A789C49;
	Tue, 28 May 2019 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22B289C55
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:19:59 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVXKv-0003MS-PB; Tue, 28 May 2019 10:19:57 +0200
Message-ID: <1559031596.4039.8.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller support
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Date: Tue, 28 May 2019 10:19:56 +0200
In-Reply-To: <20190528013800.GB6885@dragon>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de> <20190528013800.GB6885@dragon>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2hhd24sCgpBbSBEaWVuc3RhZywgZGVuIDI4LjA1LjIwMTksIDA5OjM4ICswODAwIHNjaHJp
ZWIgU2hhd24gR3VvOgo+IEhpIEx1Y2FzLAo+IAo+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDAz
OjM2OjUzUE0gKzAyMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4gV2UgaGF2ZSBiZWVuIGxvb2tp
bmcgYXQgaG93IHRvIHN1cHBvcnQgRENTUyBpbiBtYWlubGluZSBmb3IgYSB3aGlsZSwKPiA+IGJ1
dCBtb3N0IG9mIHRoZSBhY3R1YWwgd29yayBnb3QgcHVzaGVkIGJlaGluZCBpbiBzY2hlZHVsZSBk
dWUgdG8gb3RoZXIKPiA+IHByaW9yaXRpZXMuCj4gCj4gSSBoYXZlIHNvbWUgdGltZSB0byBjb250
cmlidXRlLsKgwqBXb3VsZCB5b3Ugc3VnZ2VzdCBob3cgSSBzaG91bGQgaGVscAo+IGhlcmU/Cj4g
Cj4gMS4gWW91IGd1eXMgYWxyZWFkeSBoYXZlIHNvbWV0aGluZyBjbG9zZSB0byBjb21wbGV0aW9u
IGFuZCBkbyBub3QgbmVlZAo+IMKgwqDCoG1vcmUgaGFuZHMuCj4gMi4gWW91IGd1eXMgYWxyZWFk
eSBoYXZlIHNvbWUgcHJlbGltaW5hcnkgY29kZSBhbmQgY2FuIHVzZSBoZWxwIGZyb20KPiDCoMKg
wqBvdGhlcnMuCj4gMy4gWW91IGd1eXMgaGF2ZW4ndCBnb3QgYW55dGhpbmcgdG8gc3RhcnQgd2l0
aCwgYnV0IGp1c3Qgc29tZSBkZXNpZ24KPiDCoMKgwqBwcmluY2lwbGVzIHRoYXQgYW55b25lIHdo
byB3YW50cyB0byB3b3JrIG9uIGl0IHNob3VsZCBjb25zaWRlci4KPiAKPiBXaGljaCBpcyB0aGUg
b25lIHRoYXQgeW91IHdhbnQgbWUgdG8gcmVhZD8KCk1vc3RseSB0aGUgM3JkLiBXZSBzcGVudCBz
b21lIHRpbWUgb24gZ2V0dGluZyB0aGUgRENTUyBkcml2ZXIgdG8gd29yawpvbiB1cHN0cmVhbSBr
ZXJuZWwgYW5kIGZhbWlsaWFyaXplIHdpdGggdGhlIGhhcmR3YXJlLCBidXQgd2UgZG9uJ3QgaGF2
ZQphbnkgY2xvc2UgdG8gbWFpbmxpbmUgcXVhbGl0eSBjb2RlLgoKPiA+IE9uZSB0aGluZyBJIGNh
biBjYW4gc2F5IGZvciBjZXJ0YWluIGlzIHRoYXQgRENTUyBzaG91bGQgbm90IGJlCj4gPiBpbnRl
Z3JhdGVkIGludG8gaW14LWRybS4gSXQncyBhIHRvdGFsbHkgZGlmZmVyZW50IGhhcmR3YXJlIGFu
ZAo+ID4gZG93bnN0cmVhbSBjbGVhcmx5IHNob3dzIHRoYXQgaXQncyBub3QgYSBnb29kIGlkZWEg
dG8gY3JhbSBpdCBpbnRvIGlteC0KPiA+IGRybS4KPiAKPiBJIGhhdmVuJ3QgZ29uZSBkZWVwZXIg
aW50byB0aGUgdmVuZG9yIGNvZGUsIGJ1dCBmcm9tIGEgYnJpZWYgbG9va2luZyBJCj4gZGlkbid0
IHNlZSBzbyBtYW55IHByb2JsZW1zIHdpdGggaW50ZWdyYXRpbmcgRENTUyBpbnRvIGlteC1kcm0u
wqDCoEl0J3MKPiBub3Qgc28gdW5yZWFzb25hYmxlIHRvIHRha2UgaW14LWRybSBhcyBhbiBpbXgt
ZGlzcGxheS1zdWJzeXN0ZW0gd2hpY2gKPiBjYW4gaGF2ZSBtdWx0aXBsZSBDUlRDcy7CoMKgU28g
Y2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlIGEgYml0IG9uIHdoeSBpdCdzCj4gcmVhbGx5IGEgYmFk
IGlkZWE/CgpJdCdzIGEgdG90YWxseSBkaWZmZXJlbnQgaGFyZHdhcmUsIHdpdGggdmVyeSBkaWZm
ZXJlbnQgYmVoYXZpb3IsIHNvCnRoZXJlIGlzIGJhc2ljYWxseSBubyBwb3RlbnRpYWwgZm9yIGFu
eSBjb2RlIHNoYXJpbmcuIFRoZSBkb3duc3RyZWFtCmRyaXZlciBpcyBhIGhlbGwgb2YgIm9oLCB0
aGluZ3MgYXJlIGRpZmZlcmVudCBoZXJlLCBsZXQncyBpbnRyb2R1Y2UgeWV0CmFub3RoZXIgZnVu
Y3Rpb24gcG9pbnRlciB0byBtYWtlIHRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHRoZSBIVyIuIEl0
CmNvbXBsaWNhdGVzIHRoZSBpbXgtZHJtIGZvciBubyBnb29kIHJlYXNvbi4gT3VyIGV4cGVyaWVu
Y2Ugd2l0aCBpbXgtZHJtIAppcyB0aGF0IGl0IGlzIGFscmVhZHkgYXQgYSBjb21wbGV4aXR5IGxl
dmVsIHRoYXQgbWFrZXMgaXQgaGFyZCB0bwpyZWFzb24gYWJvdXQgdGhpbmdzIHdoZW4gaHVudGlu
ZyBidWdzLgoKVGhlIGJvaWxlciBwbGF0ZSByZXF1aXJlZCB0byB3cml0ZSBhIGF0b21pYyBLTVMg
ZHJpdmVyIGlzIG5vdCB0aGF0Cm11Y2gsIHNvIEkgd291bGQgcmF0aGVyIGhhdmUgYSBjbGVhbiBz
cGxpdCBiZXR3ZWVuIHRoZSB0d28gaGFyZHdhcmUKZHJpdmVycy4gRnJhbmtseSB0aGV5IGRvbid0
IHNoYXJlIGFueXRoaW5nIGV4Y2VwdCBib3RoIGJlaW5nIGEgYXRvbWljCktNUyBkcml2ZXIgYW5k
IHJ1bm5pbmcgb24gYSBTb0MgY2FsbGVkIGkuTVguCgo+ID4gQWxzbyB0aGUgYXJ0aWZpY2lhbCBz
cGxpdCBiZXR3ZWVuIGhhcmR3YXJlIGNvbnRyb2wgaW4KPiA+IGRyaXZlcnMvZ3B1L2lteC9kY3Nz
IGFuZCB0aGUgRFJNIGRyaXZlciBpcyBqdXN0IGNhcmdvLWN1bHQgZnJvbSB0aGUKPiA+IElQVS9p
bXgtZHJtIHNwbGl0LiBGb3IgdGhlIElQVSB3ZSBkaWQgaXQgYXMgdGhlIElQVSBoYXMgbGVncyBp
biBib3RoCj4gPiBEUk0gZm9yIHRoZSBvdXRwdXQgcGFydHMgYW5kIFY0TDIgZm9yIHRoZSBpbnB1
dCBwYXJ0cy4gQXMgdGhlIERDU1MgaGFzCj4gPiBubyB2aWRlbyBpbnB1dCBjYXBhYmlsaXRpZXMg
dGhlIGRyaXZlciBjb3VsZCBiZSBzaW1wbGlmaWVkIGEgbG90IGJ5Cj4gPiBtb3ZpbmcgaXQgYWxs
IGludG8gYSBzaW5nbGUgRFJNIGRyaXZlci4KPiAKPiBBZ3JlZWQgb24gdGhpcy4KClJlZ2FyZHMs
Ckx1Y2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
