Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 050F7DC812
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 17:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E7F6E132;
	Fri, 18 Oct 2019 15:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9295C6E132
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 15:06:59 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iLTqC-00026Z-Vf; Fri, 18 Oct 2019 17:06:56 +0200
Message-ID: <766f258cf2874d0adb94af1c0c872cf7c8ecf563.camel@pengutronix.de>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Drew DeVault <sir@cmpwn.com>, Pekka Paalanen <ppaalanen@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 18 Oct 2019 17:06:55 +0200
In-Reply-To: <BXSQA6JW25GT.1OK4I53XFO1M5@homura>
References: <BXSQA6JW25GT.1OK4I53XFO1M5@homura>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTEwLTE4IGF0IDEwOjQzIC0wNDAwLCBEcmV3IERlVmF1bHQgd3JvdGU6Cj4g
UmVnYXJkaW5nIGhvdHBsdWdnaW5nLCB0aGUgV2F5bGFuZCBjb21wb3NpdG9yIGlzIHByb2JhYmx5
IGtlZXBpbmcgdHJhY2sKPiBvZiBob3RwbHVncyBpdHNlbGYgYW5kIHdpdGhkcmF3aW5nL29mZmVy
aW5nIGNvbm5lY3RvcnMgYXMgYXBwcm9wcmlhdGUuCj4KPiBBbHNvLCB3aGVuIHRoZSBsZWFzZSBp
cyBpc3N1ZWQsIHRoZSBjb21wb3NpdG9yIHdpdGhkcmF3cyB0aGF0IGNvbm5lY3Rvci4KPiBGb3Ig
dGhlIGNsaWVudCwgdXBvbiBob3RwbHVnIEkgaW1hZ2luZSB0aGUgRFJNIGFza3Mgc3RhcnQgdG8g
ZmFpbCwgYW5kCj4gaXQgaGFuZGxlcyB0aGF0IGFjY29yZGluZ2x5IChwcmVzdW1hYmx5IGl0J2xs
IGNsb3NlIHRoZSBsZWFzZSwgaWYgdGhlCj4gY29tcG9zaXRvciBoYXNuJ3QgYWxyZWFkeSwgYW5k
IHdhaXQgZm9yIGl0IHRvIGNvbWUgYmFjaywgb3IganVzdCBleGl0KS4KClJpZ2h0LiBXaGV0aGVy
IGl0IHdhaXRzIG9yIHF1aXRzIHNob3VsZCBiZSB0aGUgZGVjaXNpb24gb2YgdGhlIGNsaWVudCwK
YW5kIEknZCBsaWtlIHRoZXJlIHRvIGJlIGEgZ29vZCB3YXkgdG8gIndhaXQgZm9yIGl0IHRvIGNv
bWUgYmFjayIgKG9yIHRvCmFwcGVhciwgaW5pdGlhbGx5KS4KSWYgdGhlIGNvbXBvc2l0b3Igc2Vu
ZHMgYSBuZXcgendwX2RybV9sZWFzZV9tYW5hZ2VyX3YxLmNvbm5lY3RvciBldmVudAphZnRlciB0
aGUgSE1EIGNvbm5lY3RvciBiZWNvbWVzIGxlYXNhYmxlIChhZ2FpbiksIHRoYXQgc2hvdWxkIGJl
IGdvb2QKZW5vdWdoLgoKWy4uLl0KPiA+IFNvIFdheWxhbmQgZGlzcGxheSBzZXJ2ZXJzIHNob3Vs
ZCBtYWtlIHN1cmUgdGhleSBoYXZlIG1hc3RlciB0aGVtc2VsdmVzCj4gPiBiZWZvcmUgc2VuZGlu
ZyBhIHN1cHBvc2VkbHkgbm9uLW1hc3RlciBEUk0gZmQgdG8gYW55b25lIGVsc2UuIEkgd29uZGVy
Cj4gPiBpZiB0aGUgV2F5bGFuZCBwcm90b2NvbCBleHRlbnNpb24gbmVlZHMgdG8gY29uc2lkZXIg
dGhhdCB0aGUgY29tcG9zaXRvcgo+ID4gbWlnaHQgbm90IGJlIGFibGUgdG8gc2VuZCBhbnkgZmQg
c29vbi4gQmVpbmcgYWJsZSB0byBkZWZlciBzZW5kaW5nIHRoZQo+ID4gZmQgc2hvdWxkIHByb2Jh
Ymx5IGJlIG1lbnRpb25lZCBpbiB0aGUgcHJvdG9jb2wgc3BlYywgc28gdGhhdCBjbGllbnRzCj4g
PiBkbyBub3QgZXhwZWN0IGEgc2ltcGxlIHJvdW5kdHJpcCB0byBiZSBlbm91Z2ggdG8gZW5zdXJl
IHRoZSBmZCBoYXMKPiA+IGFycml2ZWQuCj4gCj4gV2hlbiB5b3UgVlQgc3dpdGNoIGF3YXksIHRo
ZSBXYXlsYW5kIGNvbXBvc2l0b3IgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyaWx5Cj4gYWJsZSB0byBs
ZWFzZSB0aG9zZSBkaXNwbGF5cyBhbnl3YXkgLSBpdCdzIG5vdCB0aGUgbWFzdGVyIGFueW1vcmUu
IFNvIGl0Cj4gc2hvdWxkIHdpdGhkcmF3IHRoZW0sIGFuZCBpbiBjYXNlIG9mIGEgcmFjZSBpdCds
bCByZWplY3QgdGhlIGxlYXNlCj4gcmVxdWVzdC4KClJpZ2h0LiBPbiBWVCBzd2l0Y2ggYXdheSwg
cmV2b2tpbmcgYWxsIGxlYXNlcyBhbmQgZGlzYWJsaW5nIHRob3NlCmNvbm5lY3RvcnMgaXMgdGhl
IG9ubHkgc2Vuc2libGUgdGhpbmcgdGhlIGNvbXBvc2l0b3IgY2FuIGRvLgoKSG93ZXZlciwgdGhh
dCBpcyBjb21wbGV0ZWx5IGluZGVwZW5kZW50IGZyb20gdGhlIHNlbmRpbmcgdGhlIGRybV9mZApl
dmVudC4gVGhlIHNwZWMgY3VycmVudGx5IHNheXM6ICJUaGUgY29tcG9zaXRvciB3aWxsIHNlbmQg
dGhpcyBldmVudAp3aGVuIHRoZSB6d3BfZHJtX2xlYXNlX21hbmFnZXJfdjEgZ2xvYmFsIGlzIGJv
dW5kLiIuIEJ1dCBpZiB0aGUgY2xpZW50CmJpbmRzIHRoZSBnbG9iYWwgd2hpbGUgdGhlIGNvbXBv
c2l0b3IgZG9lc24ndCBoYXZlIERSTSBtYXN0ZXIgcHJpdmlsZWdlLAphbmQgaWYgaXQgaXMgbm90
IHBvc3NpYmxlIHRvIHNlY3VyZWx5IHByb2R1Y2UgYSBub24tbWFzdGVyIGRybV9mZCB0bwpzZW5k
IGF0IHRoaXMgdGltZSwgbWF5YmUgdGhlIHNlbnRlbmNlIHNob3VsZCBiZSBjaGFuZ2VkIHRvICJU
aGUKY29tcG9zaXRvciB3aWxsIHNlbmQgdGhpcyBldmVudCBzb21lIHRpbWUgYWZ0ZXIgdGhlCnp3
cF9kcm1fbGVhc2VfbWFuYWdlcl92MSBnbG9iYWwgaXMgYm91bmQuIj8KCnJlZ2FyZHMKUGhpbGlw
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
