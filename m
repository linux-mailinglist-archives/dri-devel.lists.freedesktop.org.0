Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CAA4FDA0
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D789935;
	Sun, 23 Jun 2019 18:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D016E84D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:17:42 +0000 (UTC)
Date: Fri, 21 Jun 2019 11:17:34 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <1561108654.1777.1@crapouillou.net>
In-Reply-To: <20190621091343.GA12905@phenom.ffwll.local>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190603152331.23160-2-paul@crapouillou.net>
 <20190619122622.GB29084@ravnborg.org> <1561040159.1978.0@crapouillou.net>
 <20190621090411.GY12905@phenom.ffwll.local>
 <1561108050.1777.0@crapouillou.net>
 <20190621091343.GA12905@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1561108660; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GnEDnNvupRre4CH08nnBcLiK4v5p3vrEADxifZSPTDw=;
 b=v2SArrbxf+UM2hExzUQIAhwuMux2k22X2xLBcomYkHut/QLUp/KABfbgouxorSAtXc1eQd
 +tmE3zTZ3EGKfeGBQJcdFxNbUup3aGk2VXDHmlHHv8EeMCj/Dz6oxlkjLA7rA1avhbS6Dz
 QFtwhgFx0o0tncedkVFh4g7g74GuAxU=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSB2ZW4uIDIxIGp1aW4gMjAxOSDDoCAxMToxMywgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiBhIMOpY3JpdCAKOgo+IE9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDExOjA3OjMwQU0g
KzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4+IAo+PiAKPj4gIExlIHZlbi4gMjEganVpbiAy
MDE5IMOgIDExOjA0LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IGEgCj4+IMOpY3Jp
dCA6Cj4+ICA+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDA0OjE1OjU5UE0gKzAyMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4+ICA+ID4KPj4gID4gPgo+PiAgPiA+ICBMZSBtZXIuIDE5IGp1aW4g
MjAxOSDDoCAxNDoyNiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiAKPj4gYQo+PiAg
PiA+IMOpY3JpdCA6Cj4+ICA+ID4gID4gSGkgUGF1bC4KPj4gID4gPiAgPgo+PiAgPiA+ICA+IE9u
IE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA1OjIzOjMxUE0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwgCj4+
IHdyb3RlOgo+PiAgPiA+ICA+ID4gIEFkZCBhIEtNUyBkcml2ZXIgZm9yIHRoZSBJbmdlbmljIEpa
NDd4eCBmYW1pbHkgb2YgU29Dcy4KPj4gID4gPiAgPiA+ICBUaGlzIGRyaXZlciBpcyBtZWFudCB0
byByZXBsYWNlIHRoZSBhZ2luZyBqejQ3NDAtZmIgCj4+IGRyaXZlci4KPj4gID4gPiAgPiA+Cj4+
ICA+ID4gID4gPiAgVGhpcyBkcml2ZXIgZG9lcyBub3QgbWFrZSB1c2Ugb2YgdGhlIHNpbXBsZSBw
aXBlIGhlbHBlciwgCj4+IGZvcgo+PiAgPiA+IHRoZQo+PiAgPiA+ICA+ID4gcmVhc29uCj4+ICA+
ID4gID4gPiAgdGhhdCBpdCB3aWxsIHNvb24gYmUgdXBkYXRlZCB0byBzdXBwb3J0IG1vcmUgYWR2
YW5jZWQgCj4+IGZlYXR1cmVzCj4+ICA+ID4gbGlrZQo+PiAgPiA+ICA+ID4gIG11bHRpcGxlIHBs
YW5lcywgSVBVIGludGVncmF0aW9uIGZvciBjb2xvcnNwYWNlIAo+PiBjb252ZXJzaW9uIGFuZAo+
PiAgPiA+ICA+ID4gdXAvZG93bgo+PiAgPiA+ICA+ID4gIHNjYWxpbmcsIHN1cHBvcnQgZm9yIERT
SSBkaXNwbGF5cywgYW5kIFRWLW91dCBhbmQgSERNSSAKPj4gb3V0cHV0cy4KPj4gID4gPiAgPiA+
Cj4+ICA+ID4gID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+Cj4+ICA+ID4gID4gPiAgVGVzdGVkLWJ5OiBBcnR1ciBSb2playA8Y29udGFjdEBh
cnR1ci1yb2play5ldT4KPj4gID4gPiAgPiA+ICAtLS0KPj4gID4gPiAgPiA+Cj4+ICA+ID4gID4g
PiAgTm90ZXM6Cj4+ICA+ID4gID4gPiAgICAgIHYyOiAtIFJlbW92ZSBjdXN0b20gaGFuZGxpbmcg
b2YgcGFuZWwuIFRoZSBwYW5lbCBpcyAKPj4gbm93Cj4+ICA+ID4gID4gPiBkaXNjb3ZlcmVkIHVz
aW5nCj4+ICA+ID4gID4gPiAgICAgIAkgIHRoZSBzdGFuZGFyZCBBUEkuCj4+ICA+ID4gID4gPiAg
ICAgIAktIExvdHMgb2Ygc21hbGwgdHdlYWtzIHN1Z2dlc3RlZCBieSB1cHN0cmVhbQo+PiAgPiA+
ICA+ID4KPj4gID4gPiAgPiA+ICAgICAgdjM6IC0gVXNlIGRldm1fZHJtX2Rldl9pbml0KCkKPj4g
ID4gPiAgPiA+ICAgICAgCS0gVXBkYXRlIGNvbXBhdGlibGUgc3RyaW5ncyB0byAtbGNkIGluc3Rl
YWQgb2YgLWRybQo+PiAgPiA+ICA+ID4gICAgICAJLSBBZGQgZGVzdHJveSgpIGNhbGxiYWNrcyB0
byBwbGFuZSBhbmQgY3J0Ywo+PiAgPiA+ICA+ID4gICAgICAJLSBUaGUgaW5nZW5pYyxsY2QtbW9k
ZSBpcyBub3cgcmVhZCBmcm9tIHRoZSBicmlkZ2UncyAKPj4gRFQKPj4gID4gPiBub2RlCj4+ICA+
ID4gID4gPgo+PiAgPiA+ICA+ID4gICAgICB2NDogUmVtb3ZlIGluZ2VuaWMsbGNkLW1vZGUgcHJv
cGVydHkgY29tcGxldGVseS4gVGhlCj4+ICA+ID4gdmFyaW91cwo+PiAgPiA+ICA+ID4gbW9kZXMg
YXJlIG5vdwo+PiAgPiA+ICA+ID4gICAgICAJZGVkdWNlZCBmcm9tIHRoZSBjb25uZWN0b3IgdHlw
ZSwgdGhlIHBpeGVsIGZvcm1hdCBvciAKPj4gdGhlCj4+ICA+ID4gYnVzCj4+ICA+ID4gID4gPiBm
bGFncy4KPj4gID4gPiAgPiA+Cj4+ICA+ID4gID4gPiAgICAgIHY1OiAtIEZpeCBmcmFtZWJ1ZmZl
ciBzaXplIGluY29ycmVjdGx5IGNhbGN1bGF0ZWQgZm9yIAo+PiAyNGJwcAo+PiAgPiA+ICA+ID4g
ZnJhbWVidWZmZXJzCj4+ICA+ID4gID4gPiAgICAgIAktIFVzZSAzMmJwcCBmcmFtZWJ1ZmZlciBp
bnN0ZWFkIG9mIDE2YnBwLCBhcyBpdCdsbCAKPj4gd29yawo+PiAgPiA+IHdpdGgKPj4gID4gPiAg
PiA+IGJvdGgKPj4gID4gPiAgPiA+ICAgICAgCSAgMTYtYml0IGFuZCAyNC1iaXQgcGFuZWwKPj4g
ID4gPiAgPiA+ICAgICAgCS0gR2V0IHJpZCBvZiBkcm1fZm9ybWF0X3BsYW5lX2NwcCgpIHdoaWNo
IGhhcyBiZWVuIAo+PiBkcm9wcGVkCj4+ICA+ID4gID4gPiB1cHN0cmVhbQo+PiAgPiA+ICA+ID4g
ICAgICAJLSBBdm9pZCB1c2luZyBkcm1fZm9ybWF0X2luZm8tPmRlcHRoLCB3aGljaCBpcyAKPj4g
ZGVwcmVjYXRlZC4KPj4gID4gPiAgPiBJbiB0aGUgZHJtIHdvcmxkIHdlIGluY2x1ZGUgdGhlIHJl
dmlzaW9uIG5vdGVzIGluIHRoZSAKPj4gY2hhbmdlbG9nLgo+PiAgPiA+ICA+IFNvIEkgZGlkIHRo
aXMgd2hlbiBJIGFwcGxpZWQgaXQgdG8gZHJtLW1pc2MtbmV4dC4KPj4gID4gPiAgPgo+PiAgPiA+
ICA+IEZpeGVkIGEgZmV3IHRyaXZpYWwgY2hlY2twYXRjaCB3YXJuaW5ncyBhYm91dCBpbmRlbnQg
dG9vLgo+PiAgPiA+ICA+IFRoZXJlIHdhcyBhIGZldyB0b28tbG9uZy1saW5lcyB3YXJuaW5ncyB0
aGF0IEkgaWdub3JlZC4gCj4+IEZpeGluZwo+PiAgPiA+IHRoZW0KPj4gID4gPiAgPiB3b3VsZCBo
YXZlIGh1cnQgcmVhZGFiaWxpdHkuCj4+ICA+ID4KPj4gID4gPiAgVGhhbmtzLgo+PiAgPiA+Cj4+
ICA+ID4gID4gSSBhc3N1bWUgeW91IHdpbGwgbWFpbnRhaW4gdGhpcyBkcml2ZXIgb253YXJkcyBm
cm9tIG5vdy4KPj4gID4gPiAgPiBQbGVhc2UgcmVxdWVzdCBkcm0tbWlzYyBjb21taXQgcmlnaHRz
IChzZWUKPj4gID4gPiAgPiBodHRwczovL3d3dy5mcmVlZGVza3RvcC5vcmcvd2lraS9BY2NvdW50
UmVxdWVzdHMvKQo+PiAgPiA+ICA+IFlvdSB3aWxsIG5lZWQgYSBsZWdhY3kgU1NIIGFjY291bnQu
Cj4+ICA+ID4KPj4gID4gPiAgSSByZXF1ZXN0ZWQgYW4gYWNjb3VudCBoZXJlOgo+PiAgPiA+ICAK
Pj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZyZWVkZXNrdG9wL2ZyZWVkZXNrdG9w
L2lzc3Vlcy8xNjIKPj4gID4KPj4gID4gVGhpcyA0MDRzIGZvciBtZS4gRGlkIHlvdSBzZXQgdGhl
IGlzc3VlIHRvIHByaXZhdGUgYnkgYW55IGNoYW5jZT8gCj4+IE9yCj4+ICA+IGRlbGV0ZWQgYWxy
ZWFkeSBhZ2Fpbj8KPj4gID4gLURhbmllbAo+PiAKPj4gIFNvcnJ5LCB5ZXMsIEkgc2V0IGl0IHRv
IHByaXZhdGUuIEkgdGhvdWdodCBJIGhhZCB0byA6KAo+IAo+IFdlbGwgSSBjYW4ndCBhY2sgaXQg
aWYgaXRzIHByaXZhdGUsIHNvIHBsZWFzZSBjaGFuZ2UgdGhhdC4gQWxzbywKPiBldmVyeXRoaW5n
IGlzIHB1YmxpYyBhcm91bmQgaGVyZSwgb3IgYWxtb3N0IGV2ZXJ5dGhpbmcgLi4uCj4gLURhbmll
bAoKSSBjbG9zZWQgdGhlIG9sZCBvbmUgYW5kIGNyZWF0ZWQgYSBuZXcsIHB1YmxpYyBvbmU6Cmh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9mcmVlZGVza3RvcC9mcmVlZGVza3RvcC9pc3N1
ZXMvMTY1CgoKPj4gCj4+ICA+ID4KPj4gID4gPiAgPiBBbmQgeW91IHNob3VsZCBmYW1pbGlhcml6
ZSB5b3Vyc2VsZiB3aXRoIHRoZSAKPj4gbWFpbnRhaW5lci10b29sczoKPj4gID4gPiAgPiBodHRw
czovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9pbmRleC5odG1s
Cj4+ICA+ID4gID4KPj4gID4gPiAgPiBGb3IgbXkgdXNlIEkgdXNlICJkaW0gdXBkYXRlLWJyYW5j
aGVzOyBkaW0gYXBwbHk7IGRpbSBwdXNoCj4+ICA+ID4gID4gU28gb25seSBhIHNtYWxsIHN1YnNl
dCBpIG5lZWRlZCBmb3Igc2ltcGxlIHVzZS4KPj4gID4gPiAgPgo+PiAgPiA+ICA+IAlTYW0KPj4g
ID4gPgo+PiAgPiA+Cj4+ICA+Cj4+ICA+IC0tCj4+ICA+IERhbmllbCBWZXR0ZXIKPj4gID4gU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+ICA+IGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCj4+IAo+PiAKPiAKPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5jaAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
