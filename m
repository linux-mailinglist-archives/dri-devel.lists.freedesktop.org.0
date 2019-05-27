Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE42B686
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7F06E1D5;
	Mon, 27 May 2019 13:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023266E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:36:55 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVFo6-0004zD-FX; Mon, 27 May 2019 15:36:54 +0200
Message-ID: <1558964213.4039.2.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller support
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 27 May 2019 15:36:53 +0200
In-Reply-To: <20190508171827.GA21725@bogon.m.sigxcpu.org>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAwOC4wNS4yMDE5LCAxOToxOCArMDIwMCBzY2hyaWViIEd1aWRvIEfD
vG50aGVyOgo+IEhpLAo+IE9uIFRodSwgTWFyIDA3LCAyMDE5IGF0IDExOjMwOjUxQU0gKzAxMDAs
IEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+ID4gVGhpcyBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3Ig
dGhlIE5XTCBNSVBJIERTSSBIb3N0IGNvbnRyb2xsZXIgZm91bmQgb24gaS5NWDgKPiA+IFNvQ3Mu
Cj4gPiAKPiA+IEl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIGkuTVg4TVEgYnV0IHRoZSBzYW1lIElQ
IGNvcmUgY2FuIGFsc28gYmUgZm91bmQgb24gZS5nLgo+ID4gaS5NWDhRWFAuIEkgYWRkZWQgdGhl
IG5lY2Vzc2FyeSBob29rcyB0byBzdXBwb3J0IG90aGVyIGlteDggdmFyaWFudHMgYnV0IHNpbmNl
Cj4gPiBJIG9ubHkgaGF2ZSBpbXg4bXEgYm9hcmRzIHRvIHRlc3QgSSBvbWl0dGVkIHRoZSBwbGF0
Zm9ybSBkYXRhIGZvciBvdGhlciBTb0NzLgo+ID4gCj4gPiBUaGUgY29kZSBpcyBiYXNlZCBvbiBO
WFBzIEJTUCBzbyBJIGFkZGVkIFJvYmVydCBDaGlyYXMgYXMgQ28tYXV0aG9yZWQtYnkgYnV0Cj4g
PiBJJ20gaGFwcHkgdG8gc3dhcCBBdXRob3I6IGFuZCBDby1hdXRob3JlZC1ieTogaWYgdGhhdCBs
b29rcyBtb3JlIGFwcHJvcHJpYXRlLgo+ID4gVGhlIG1vc3Qgbm90YWJsZSBjaGFuZ2VzIG92ZXIg
dGhlIEJTUCBkcml2ZXIgYXJlCj4gPiDCoC0gQ2FsY3VsYXRlIEhTIG1vZGUgdGltaW5nIGZyb20g
cGh5X2NvbmZpZ3VyZV9vcHRzX21pcGlfZHBoeQo+ID4gwqAtIFBlcmZvcm0gYWxsIGNsb2NrIHNl
dHVwIHZpYSBEVAo+ID4gwqAtIE1lcmdlIG53bC1pbXggYW5kIG53bCBkcml2ZXJzCj4gPiDCoC0g
QWRkIEIwIHNpbGlvbiByZXZpc2lvbiBxdWlyawo+ID4gCj4gPiBQb3N0aW5nIHRoaXMgaXMgbGlr
ZWx5IGEgYml0IHByZW1hdHVyZSAoaGVuY2UgdjApIGJ1dCBJIHdhbnRlZCBmb3Igb25lIHNob3cg
aG93Cj4gPiB0aGlzIGhvb2tzIGludG8gdGhlIG1peGVsIGRwaHkgcG9zdGVkIGVhcmxpZXIgWzFd
IGFuZCBhdm9pZCBkdXBsaWNhdGluZyB3b3JrLgo+ID4gU28gaWYgdGhlcmUncyBvdGhlciBjb2Rl
IG91dCB0aGVyZSBkb2luZyB0aGUgc2FtZSBJJ20gYmUgaGFwcHkgdG8gbWVyZ2UKPiA+IGVmZm9y
dHMuCj4gCj4gU2luY2UgdGhpcyBpcyBsaWtlbHkgbm90IGdvaW5nIGFueXdoZXJlIHVudGlsIHdl
IGhhdmUgYSBkY3NzIGRyaXZlciBhaW1lZAo+IGZvciBtYWlubGluZSBJJ20gbm90IGdvaW5nIHNw
YW0gdGhlIGxpc3Qgd2l0aCBmdXJ0aGVyIHJldmlzaW9ucy4gSG93ZXZlcgo+IHRoZSA1LnggdmVy
c2lvbiBpcyBtYWludGFpbmVkIGhlcmU6Cj4gCj4gwqDCoMKgwqBodHRwczovL3NvdXJjZS5wdXJp
LnNtL2d1aWRvLmd1bnRoZXIvbGludXgtaW14OC90cmVlL2ZvcndhcmQtdXBzdHJlYW0vbmV4dC0y
MDE5MDUwNi9pbXgtbndsL3YxLXdpcAo+IAo+IEZlZWRiYWNrIGlzIHN0aWxsIHdlbGNvbWUuIEl0
J2xsIGV2ZW50dWFsbHkgYmUgZm9yd2FyZGVkIHRvIG5ld2VyCj4gbGludXgtbmV4dCB2ZXJzaW9u
cy4KPiAKPiBDaGFuZ2VzIG92ZXIgdGhlIHBvc3RlZCB2ZXJzaW9uIGFyZToKPiAKPiAtIEFkZCBx
dWlyayBmb3IgSU1ROE1RIHNpbGljb24gQjAgcmV2aXNpb24gdG8gbm90IG1lc3Mgd2l0aCB0aGUK
PiDCoCBzeXN0ZW0gcmVzZXQgY29udHJvbGxlciBvbiBwb3dlciBkb3duIHNpbmNlIGVuYWJsZSB3
b24ndCB3b3JrCj4gwqAgYWZ0ZXJ3YXJkcyBvdGhlcndpc2UuCj4gLSBEaXNhYmxlIHR4IGVzYyBj
bG9jayAqYWZ0ZXIqIHRoZSBwaHkgcG93ZXIgZG93biB0byB1bmJyZWFrCj4gwqAgZGlzYWJsZS9l
bmFibGUgKHVuYmxhbmsvYmxhbmspCj4gLSBEcm9wIGRldm1fZnJlZV9pcnEoKSBoYW5kbGVkIGJ5
IHRoZSBkZXZpY2UgZHJpdmVyIGNvcmUKPiAtIEFkZCBwb3J0cyB0byBkdCBiaW5kaW5nIGRvY3MK
PiAtIFNlbGVjdCBHRU5FUklDX1BIWV9NSVBJX0RQSFkgaW5zdGVhZCBvZiBHRU5FUklDX1BIWSBm
b3IKPiDCoCBwaHlfbWlwaV9kcGh5X2dldF9kZWZhdWx0X2NvbmZpZwo+IC0gSW5jbHVkZSBkcm1f
cHJpbnQuaCB0byBmaXggYnVpbGQgb24gbmV4dC0yMDE5MDQwOAo+IC0gRHJvcCBzb21lIGRlYnVn
Z2luZyBtZXNzYWdlcwo+IC0gTmV3bGluZSB0ZXJtaW5hdGUgYWxsIERSTV8gcHJpbnRvdXRzCj4g
Cj4gSWYgc29tZWJvZHkgaXMgd29ya2luZyBvbiBEQ1NTIHN1cHBvcnQgaXQnZCBiZSBjb29sIHRv
IGtub3cgc2luY2UgdGhpcwo+IGRyaXZlciBpcyBjdXJyZW50bHkgYSBjb21wb25lbnQgb2YgaW14
LWRpc3BsYXktc3Vic3lzdGVtIHdoaWNoIHdpbGwgb25seQo+IHdvcmsgb3V0IGlmIGRjc3MgaXMg
aGFuZGxlZCBsaWtlIHRoaXMgYXMgd2VsbC4KCldlIGhhdmUgYmVlbiBsb29raW5nIGF0IGhvdyB0
byBzdXBwb3J0IERDU1MgaW4gbWFpbmxpbmUgZm9yIGEgd2hpbGUsCmJ1dCBtb3N0IG9mIHRoZSBh
Y3R1YWwgd29yayBnb3QgcHVzaGVkIGJlaGluZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3RoZXIKcHJp
b3JpdGllcy4KCk9uZSB0aGluZyBJIGNhbiBjYW4gc2F5IGZvciBjZXJ0YWluIGlzIHRoYXQgRENT
UyBzaG91bGQgbm90IGJlCmludGVncmF0ZWQgaW50byBpbXgtZHJtLiBJdCdzIGEgdG90YWxseSBk
aWZmZXJlbnQgaGFyZHdhcmUgYW5kCmRvd25zdHJlYW0gY2xlYXJseSBzaG93cyB0aGF0IGl0J3Mg
bm90IGEgZ29vZCBpZGVhIHRvIGNyYW0gaXQgaW50byBpbXgtCmRybS4KCkFsc28gdGhlIGFydGlm
aWNpYWwgc3BsaXQgYmV0d2VlbiBoYXJkd2FyZSBjb250cm9sIGluCmRyaXZlcnMvZ3B1L2lteC9k
Y3NzIGFuZCB0aGUgRFJNIGRyaXZlciBpcyBqdXN0IGNhcmdvLWN1bHQgZnJvbSB0aGUKSVBVL2lt
eC1kcm0gc3BsaXQuIEZvciB0aGUgSVBVIHdlIGRpZCBpdCBhcyB0aGUgSVBVIGhhcyBsZWdzIGlu
IGJvdGgKRFJNIGZvciB0aGUgb3V0cHV0IHBhcnRzIGFuZCBWNEwyIGZvciB0aGUgaW5wdXQgcGFy
dHMuIEFzIHRoZSBEQ1NTIGhhcwpubyB2aWRlbyBpbnB1dCBjYXBhYmlsaXRpZXMgdGhlIGRyaXZl
ciBjb3VsZCBiZSBzaW1wbGlmaWVkIGEgbG90IGJ5Cm1vdmluZyBpdCBhbGwgaW50byBhIHNpbmds
ZSBEUk0gZHJpdmVyLgoKUmVnYXJkcywKTHVjYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
