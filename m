Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060494FD95
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B79E89885;
	Sun, 23 Jun 2019 18:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13B96E832
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:07:40 +0000 (UTC)
Date: Fri, 21 Jun 2019 11:07:30 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <1561108050.1777.0@crapouillou.net>
In-Reply-To: <20190621090411.GY12905@phenom.ffwll.local>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190603152331.23160-2-paul@crapouillou.net>
 <20190619122622.GB29084@ravnborg.org> <1561040159.1978.0@crapouillou.net>
 <20190621090411.GY12905@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1561108058; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hmNXNpfLXB/81EAq7J6wicDteIao7+vjXFAj9FSVA4=;
 b=o6cpdXWDkPBz1kMBgJ3nUoQc8y1XLQgy/0vEsbf+f0AeDnjVUvg+9Dk14VgdGX0Rr9HTOT
 DoGjrVfLFOH72xmc1UVRmuyP3K49pDeqL+fJtFJhu2uJiTtbsL/RK/vVwbaQTzUVlCHjlR
 AKXm6m4MNJEtuek94uG0vl2qXtIkCCQ=
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

CgpMZSB2ZW4uIDIxIGp1aW4gMjAxOSDDoCAxMTowNCwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiBhIMOpY3JpdCAKOgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDA0OjE1OjU5UE0g
KzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4+IAo+PiAKPj4gIExlIG1lci4gMTkganVpbiAy
MDE5IMOgIDE0OjI2LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IGEgCj4+IMOpY3Jp
dCA6Cj4+ICA+IEhpIFBhdWwuCj4+ICA+Cj4+ICA+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA1
OjIzOjMxUE0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4+ICA+ID4gIEFkZCBhIEtNUyBk
cml2ZXIgZm9yIHRoZSBJbmdlbmljIEpaNDd4eCBmYW1pbHkgb2YgU29Dcy4KPj4gID4gPiAgVGhp
cyBkcml2ZXIgaXMgbWVhbnQgdG8gcmVwbGFjZSB0aGUgYWdpbmcgano0NzQwLWZiIGRyaXZlci4K
Pj4gID4gPgo+PiAgPiA+ICBUaGlzIGRyaXZlciBkb2VzIG5vdCBtYWtlIHVzZSBvZiB0aGUgc2lt
cGxlIHBpcGUgaGVscGVyLCBmb3IgCj4+IHRoZQo+PiAgPiA+IHJlYXNvbgo+PiAgPiA+ICB0aGF0
IGl0IHdpbGwgc29vbiBiZSB1cGRhdGVkIHRvIHN1cHBvcnQgbW9yZSBhZHZhbmNlZCBmZWF0dXJl
cyAKPj4gbGlrZQo+PiAgPiA+ICBtdWx0aXBsZSBwbGFuZXMsIElQVSBpbnRlZ3JhdGlvbiBmb3Ig
Y29sb3JzcGFjZSBjb252ZXJzaW9uIGFuZAo+PiAgPiA+IHVwL2Rvd24KPj4gID4gPiAgc2NhbGlu
Zywgc3VwcG9ydCBmb3IgRFNJIGRpc3BsYXlzLCBhbmQgVFYtb3V0IGFuZCBIRE1JIG91dHB1dHMu
Cj4+ICA+ID4KPj4gID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+Cj4+ICA+ID4gIFRlc3RlZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0
dXItcm9qZWsuZXU+Cj4+ICA+ID4gIC0tLQo+PiAgPiA+Cj4+ICA+ID4gIE5vdGVzOgo+PiAgPiA+
ICAgICAgdjI6IC0gUmVtb3ZlIGN1c3RvbSBoYW5kbGluZyBvZiBwYW5lbC4gVGhlIHBhbmVsIGlz
IG5vdwo+PiAgPiA+IGRpc2NvdmVyZWQgdXNpbmcKPj4gID4gPiAgICAgIAkgIHRoZSBzdGFuZGFy
ZCBBUEkuCj4+ICA+ID4gICAgICAJLSBMb3RzIG9mIHNtYWxsIHR3ZWFrcyBzdWdnZXN0ZWQgYnkg
dXBzdHJlYW0KPj4gID4gPgo+PiAgPiA+ICAgICAgdjM6IC0gVXNlIGRldm1fZHJtX2Rldl9pbml0
KCkKPj4gID4gPiAgICAgIAktIFVwZGF0ZSBjb21wYXRpYmxlIHN0cmluZ3MgdG8gLWxjZCBpbnN0
ZWFkIG9mIC1kcm0KPj4gID4gPiAgICAgIAktIEFkZCBkZXN0cm95KCkgY2FsbGJhY2tzIHRvIHBs
YW5lIGFuZCBjcnRjCj4+ICA+ID4gICAgICAJLSBUaGUgaW5nZW5pYyxsY2QtbW9kZSBpcyBub3cg
cmVhZCBmcm9tIHRoZSBicmlkZ2UncyBEVCAKPj4gbm9kZQo+PiAgPiA+Cj4+ICA+ID4gICAgICB2
NDogUmVtb3ZlIGluZ2VuaWMsbGNkLW1vZGUgcHJvcGVydHkgY29tcGxldGVseS4gVGhlIAo+PiB2
YXJpb3VzCj4+ICA+ID4gbW9kZXMgYXJlIG5vdwo+PiAgPiA+ICAgICAgCWRlZHVjZWQgZnJvbSB0
aGUgY29ubmVjdG9yIHR5cGUsIHRoZSBwaXhlbCBmb3JtYXQgb3IgdGhlIAo+PiBidXMKPj4gID4g
PiBmbGFncy4KPj4gID4gPgo+PiAgPiA+ICAgICAgdjU6IC0gRml4IGZyYW1lYnVmZmVyIHNpemUg
aW5jb3JyZWN0bHkgY2FsY3VsYXRlZCBmb3IgMjRicHAKPj4gID4gPiBmcmFtZWJ1ZmZlcnMKPj4g
ID4gPiAgICAgIAktIFVzZSAzMmJwcCBmcmFtZWJ1ZmZlciBpbnN0ZWFkIG9mIDE2YnBwLCBhcyBp
dCdsbCB3b3JrIAo+PiB3aXRoCj4+ICA+ID4gYm90aAo+PiAgPiA+ICAgICAgCSAgMTYtYml0IGFu
ZCAyNC1iaXQgcGFuZWwKPj4gID4gPiAgICAgIAktIEdldCByaWQgb2YgZHJtX2Zvcm1hdF9wbGFu
ZV9jcHAoKSB3aGljaCBoYXMgYmVlbiBkcm9wcGVkCj4+ICA+ID4gdXBzdHJlYW0KPj4gID4gPiAg
ICAgIAktIEF2b2lkIHVzaW5nIGRybV9mb3JtYXRfaW5mby0+ZGVwdGgsIHdoaWNoIGlzIGRlcHJl
Y2F0ZWQuCj4+ICA+IEluIHRoZSBkcm0gd29ybGQgd2UgaW5jbHVkZSB0aGUgcmV2aXNpb24gbm90
ZXMgaW4gdGhlIGNoYW5nZWxvZy4KPj4gID4gU28gSSBkaWQgdGhpcyB3aGVuIEkgYXBwbGllZCBp
dCB0byBkcm0tbWlzYy1uZXh0Lgo+PiAgPgo+PiAgPiBGaXhlZCBhIGZldyB0cml2aWFsIGNoZWNr
cGF0Y2ggd2FybmluZ3MgYWJvdXQgaW5kZW50IHRvby4KPj4gID4gVGhlcmUgd2FzIGEgZmV3IHRv
by1sb25nLWxpbmVzIHdhcm5pbmdzIHRoYXQgSSBpZ25vcmVkLiBGaXhpbmcgCj4+IHRoZW0KPj4g
ID4gd291bGQgaGF2ZSBodXJ0IHJlYWRhYmlsaXR5Lgo+PiAKPj4gIFRoYW5rcy4KPj4gCj4+ICA+
IEkgYXNzdW1lIHlvdSB3aWxsIG1haW50YWluIHRoaXMgZHJpdmVyIG9ud2FyZHMgZnJvbSBub3cu
Cj4+ICA+IFBsZWFzZSByZXF1ZXN0IGRybS1taXNjIGNvbW1pdCByaWdodHMgKHNlZQo+PiAgPiBo
dHRwczovL3d3dy5mcmVlZGVza3RvcC5vcmcvd2lraS9BY2NvdW50UmVxdWVzdHMvKQo+PiAgPiBZ
b3Ugd2lsbCBuZWVkIGEgbGVnYWN5IFNTSCBhY2NvdW50Lgo+PiAKPj4gIEkgcmVxdWVzdGVkIGFu
IGFjY291bnQgaGVyZToKPj4gIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9mcmVlZGVz
a3RvcC9mcmVlZGVza3RvcC9pc3N1ZXMvMTYyCj4gCj4gVGhpcyA0MDRzIGZvciBtZS4gRGlkIHlv
dSBzZXQgdGhlIGlzc3VlIHRvIHByaXZhdGUgYnkgYW55IGNoYW5jZT8gT3IKPiBkZWxldGVkIGFs
cmVhZHkgYWdhaW4/Cj4gLURhbmllbAoKU29ycnksIHllcywgSSBzZXQgaXQgdG8gcHJpdmF0ZS4g
SSB0aG91Z2h0IEkgaGFkIHRvIDooCgotUGF1bAoKCj4+IAo+PiAgPiBBbmQgeW91IHNob3VsZCBm
YW1pbGlhcml6ZSB5b3Vyc2VsZiB3aXRoIHRoZSBtYWludGFpbmVyLXRvb2xzOgo+PiAgPiBodHRw
czovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9pbmRleC5odG1s
Cj4+ICA+Cj4+ICA+IEZvciBteSB1c2UgSSB1c2UgImRpbSB1cGRhdGUtYnJhbmNoZXM7IGRpbSBh
cHBseTsgZGltIHB1c2gKPj4gID4gU28gb25seSBhIHNtYWxsIHN1YnNldCBpIG5lZWRlZCBmb3Ig
c2ltcGxlIHVzZS4KPj4gID4KPj4gID4gCVNhbQo+PiAKPj4gCj4gCj4gLS0KPiBEYW5pZWwgVmV0
dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
