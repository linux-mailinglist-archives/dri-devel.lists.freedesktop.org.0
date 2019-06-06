Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631C36DF1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20424892C8;
	Thu,  6 Jun 2019 07:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71CC892C8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 07:58:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B1A633B;
 Thu,  6 Jun 2019 09:58:04 +0200 (CEST)
Date: Thu, 6 Jun 2019 10:57:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190606075750.GE4931@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
 <20190528165052.GB17874@pendragon.ideasonboard.com>
 <20190528170242.GB10262@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528170242.GB10262@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559807884;
 bh=qw2VFwAtGsSBBTXuxyGdadIiKT5jk0BwcD44/EhsjSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vfIhxQDRMoXqE0w3DUPBKs3a7K4/PMStciTbCMswiaCMlIPmXnEBqM010sShgMvbU
 RNTiIP4sdZYRAp+Z9Li8yO5oDTRLA/4fVh09QfpXdUHOGBJ8z88ugKA1KLeYIPo0NG
 vzcv+/G6hwbUd/PLk7uBKYTdHyOVOkdZ3Aa6SuMU=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6MDI6NDJQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA3OjUwOjUyUE0gKzAzMDAs
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNjo0
MjoxM1BNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPj4gT24gVHVlLCBNYXkgMjgsIDIw
MTkgYXQgMDU6MTI6MzFQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+Pj4gSW4g
ZHVhbC1saW5rIExWRFMgbW9kZSwgdGhlIExWRFMxIGVuY29kZXIgaXMgdXNlZCBhcyBhIGNvbXBh
bmlvbiBmb3IKPiA+Pj4gTFZEUzAsIGFuZCBib3RoIGVuY29kZXJzIHRyYW5zbWl0IGRhdGEgZnJv
bSBEVTAuIFRoZSBMVkRTMSBvdXRwdXQgb2YgRFUxCj4gPj4+IGNhbid0IGJlIHVzZWQgaW4gdGhh
dCBjYXNlLCBkb24ndCBjcmVhdGUgYW4gZW5jb2RlciBhbmQgY29ubmVjdG9yIGZvcgo+ID4+PiBp
dC4KPiA+Pj4gCj4gPj4+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+ID4+PiBSZXZpZXdlZC1ieTogSmFj
b3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4+PiBUZXN0ZWQtYnk6IEph
Y29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+Pj4gLS0tCj4gPj4+IENo
YW5nZXNzIHNpbmNlIHYyOgo+ID4+PiAKPiA+Pj4gLSBSZW1vdmUgdW5uZWVkZWQgYnJpZGdlIE5V
TEwgY2hlY2sKPiA+Pj4gLS0tCj4gPj4+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2VuY29kZXIuYyB8IDEyICsrKysrKysrKysrKwo+ID4+PiAgZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9rbXMuYyAgICAgfCAgMiArLQo+ID4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+IAo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2VuY29kZXIuYwo+ID4+PiBpbmRleCA2YzkxNzUzYWY3YmMuLjBmMDBi
ZGZlMjM2NiAxMDA2NDQKPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9lbmNvZGVyLmMKPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9l
bmNvZGVyLmMKPiA+Pj4gQEAgLTE2LDYgKzE2LDcgQEAKPiA+Pj4gICNpbmNsdWRlICJyY2FyX2R1
X2Rydi5oIgo+ID4+PiAgI2luY2x1ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgo+ID4+PiAgI2luY2x1
ZGUgInJjYXJfZHVfa21zLmgiCj4gPj4+ICsjaW5jbHVkZSAicmNhcl9sdmRzLmgiCj4gPj4+ICAK
PiA+Pj4gIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4+ICAgKiBFbmNvZGVyCj4gPj4+IEBA
IC05Nyw2ICs5OCwxNyBAQCBpbnQgcmNhcl9kdV9lbmNvZGVyX2luaXQoc3RydWN0IHJjYXJfZHVf
ZGV2aWNlICpyY2R1LAo+ID4+PiAgCQl9Cj4gPj4+ICAJfQo+ID4+PiAgCj4gPj4+ICsJLyoKPiA+
Pj4gKwkgKiBPbiBHZW4zIHNraXAgdGhlIExWRFMxIG91dHB1dCBpZiB0aGUgTFZEUzEgZW5jb2Rl
ciBpcyB1c2VkIGFzIGEKPiA+Pj4gKwkgKiBjb21wYW5pb24gZm9yIExWRFMwIGluIGR1YWwtbGlu
ayBtb2RlLgo+ID4+PiArCSAqLwo+ID4+PiArCWlmIChyY2R1LT5pbmZvLT5nZW4gPj0gMyAmJiBv
dXRwdXQgPT0gUkNBUl9EVV9PVVRQVVRfTFZEUzEpIHsKPiA+PiAKPiA+PiBCb3RoIHN1YmplY3Qg
YW5kIGNvbW1lbnQgYWJvdmUgc2F5cyAiT24gR2VuMyIsIGJ1dCB0aGUgY29kZSBsb29rcyBsaWtl
Cj4gPj4gaXQgaW1wbGVtZW50cyAiT24gR2VuMyBvciBuZXdlciIgLSBkdWUgdG8gdXNlIG9mICI+
PSIuCj4gPj4gTG9va3Mgd3JvbmcgdG8gbWUuCj4gPiAKPiA+IEdlbjMgaXMgdGhlIG5ld2VzdCBn
ZW5lcmF0aW9uIDotKSBXZSB0aHVzIHVzZSA+PSB0aHJvdWdoIHRoZSBEVSBhbmQgTFZEUwo+ID4g
ZHJpdmVycyB0byBwcmVwYXJlIGZvciBzdXBwb3J0IG9mIEdlbjQsIGp1c3QgaW4gY2FzZS4KPgo+
IE9LLCBidXQgSSBndWVzcyB3ZSBhZ3JlZSB0aGF0IHRoZSBjb21tZW50IG5lZWRzIGEgc21hbGwg
dXBkYXRlIHRoZW0uCj4gCj4gQWN0dWFsbHkgSSBpbXBsaWNpdGx5IHJlYWRzIHRoYXQgaXQgaXMg
b25seSBmcm9tIEdlbjMgb253YXJkcyB0aGF0IHRoZQo+IExWRFMxIGVuY29kZXIgY2FuIGJlIHVz
ZWQgYXMgYSBjb21wYW5pb24uCj4gTXkgaW5pdGlhbCB1bmRlcnN0YW5kaW5nIHJlYWRpbmcgdGhl
IGNvbW1lbnQgd2FzIHRoYXQgdGhpcyBpbXBsbWVudGVkIGEKPiB3b3JrYXJvdW5kIGZvciBHZW4z
IC0gYnV0IGl0IGlzIGEgd29ya2Fyb3VuZiBmb3IgbWlzc2luZyBmZWF0dXJlcyBpbgo+IG9sZGVy
IHRoYW4gR2VuMy4KCkkgd291bGRuJ3Qgc2F5IHdvcmthcm91bmQsIGl0IGp1c3QgbWFrZXMgc3Vy
ZSB0aGF0IHdlIGRvbid0IHRyeSB0bwpzdXBwb3J0IExWRFMgZHVhbC1tb2RlIG9uIG9sZGVyIFNv
Q3MgYXMgdGhlIGZlYXR1cmUgd2FzIGFkZGVkIGluIEdlbjMKaGFyZHdhcmUuCgo+IFNvLCBhc3N1
bWluZyB0aGlzIGlzIGNvcnJlY3QsIHdoZW4gdHJ5aW5nIHRvIHNwZWNpZnkgYSBjb21wYW5pb24g
b24KPiBvbGRlciB0aGVuIEdlbjMgc2hvdWxkIHJlc3VsdCBpbiBzb21lIGtpbmQgb2YgZXJyb3Iv
d2FybmluZz8KPiAoTWF5YmUgaXQgZG9lcykuCgpUaGUgcHJvcGVydHkgaXMgaWdub3JlZCBpbiB0
aGF0IGNhc2UuIEkgY291bGQgYWRkIGFuIGVycm9yIG1lc3NhZ2UsIGJ1dApJJ20gbm90IHN1cmUg
SSBzaG91bGQsIGFzIHdlIGRvbid0IHVzdWFsbHkgY2hlY2sgdGhhdCBEVCBub2RlcyBkb24ndApj
b250YWluIGFueSBvdGhlciBwcm9wZXJ0eSB0aGFuIHRoZSBvbmVzIHNwZWNpZmllZCBpbiB0aGUg
RFQgYmluZGluZ3MKKGFuIGF1dG9tYXRpYyBEVCBydW50aW1lIHZhbGlkYXRvciBiYXNlZCBvbiB0
aGUgWUFNTCBiaW5kaW5ncyBjb3VsZCBiZQppbnRlcmVzdGluZyA7LSkpLgoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
