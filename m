Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA216A43B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 11:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980D96E427;
	Mon, 24 Feb 2020 10:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E4A6E427
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 10:44:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 18C1568AFE; Mon, 24 Feb 2020 11:44:53 +0100 (CET)
Date: Mon, 24 Feb 2020 11:44:52 +0100
From: Torsten Duwe <duwe@lst.de>
To: Icenowy Zheng <icenowy@aosc.io>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
Message-ID: <20200224104452.GA31184@lst.de>
References: <20200221165127.813325-1-icenowy@aosc.io>
 <20200221171328.GC6928@lst.de> <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBGZWIgMjIsIDIwMjAgYXQgMTA6NDM6MDJBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiAKPiAKPiDkuo4gMjAyMOW5tDLmnIgyMuaXpSBHTVQrMDg6MDAg5LiK5Y2IMToxMzoy
OCwgVG9yc3RlbiBEdXdlIDxkdXdlQGxzdC5kZT4g5YaZ5YiwOgo+ID5PbiBTYXQsIEZlYiAyMiwg
MjAyMCBhdCAxMjo1MToyN0FNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4+IEN1cnJl
bnQgY29kZSB0cmllcyB0byBzdG9yZSB0aGUgbGluayByYXRlIChpbiBicHMsIHdoaWNoIGlzIGEg
YmlnCj4gPj4gbnVtYmVyKSBpbiBhIHU4LCB3aGljaCBzdXJlbHkgb3ZlcmZsb3cuIFRoZW4gaXQn
cyBjb252ZXJ0ZWQgYmFjayB0bwo+ID4+IGJhbmR3aWR0aCBjb2RlICh3aGljaCBpcyB0aHVzIDAp
IGFuZCB3cml0dGVuIHRvIHRoZSBjaGlwLgo+ID4+IAo+ID4+IFRoZSBjb2RlIHNvbWV0aW1lcyB3
b3JrcyBiZWNhdXNlIHRoZSBjaGlwIHdpbGwgYXV0b21hdGljYWxseSBmYWxsYmFjawo+ID50bwo+
ID4+IHRoZSBsb3dlc3QgcG9zc2libGUgRFAgbGluayByYXRlICgxLjYyR2Jwcykgd2hlbiBnZXQg
dGhlIGludmFsaWQKPiA+dmFsdWUuCj4gPj4gSG93ZXZlciwgb24gdGhlIGVEUCBwYW5lbCBvZiBP
bGltZXggVEVSRVMtSSwgd2hpY2ggd2FudHMgMi43R2Jwcwo+ID5saW5rLAo+ID4+IGl0IGZhaWxl
ZC4KPiA+PiAKPiA+PiBBcyB3ZSBoYWQgYWxyZWFkeSByZWFkIHRoZSBsaW5rIGJhbmR3aWR0aCBh
cyBiYW5kd2lkdGggY29kZSBpbgo+ID5lYXJsaWVyCj4gPj4gY29kZSAodG8gY2hlY2sgd2hldGhl
ciBpdCBpcyBzdXBwb3J0ZWQpLCB1c2UgaXQgd2hlbiBzZXR0aW5nCj4gPmJhbmR3aWR0aCwKPiA+
PiBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgaXQgdG8gbGluayByYXRlIGFuZCB0aGVuIGNvbnZlcnRp
bmcgYmFjay4KPiA+PiAKPiA+PiBGaXhlczogZTFjZmY4MmMxMDk3ICgiZHJtL2JyaWRnZTogZml4
IGFueDYzNDUgY29tcGlsYXRpb24gZm9yIHY1LjUiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IEljZW5v
d3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgfCAzICstLQo+ID4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPj4gCj4gPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5j
Cj4gPmIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMK
PiA+PiBpbmRleCA1NmY1NWM1M2FiZmQuLjJkZmEyZmQyYTIzYiAxMDA2NDQKPiA+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYwo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj4g
Pj4gQEAgLTIxMCw4ICsyMTAsNyBAQCBzdGF0aWMgaW50IGFueDYzNDVfZHBfbGlua190cmFpbmlu
ZyhzdHJ1Y3QKPiA+YW54NjM0NSAqYW54NjM0NSkKPiA+PiAgCWlmIChlcnIpCj4gPj4gIAkJcmV0
dXJuIGVycjsKPiA+PiAgCj4gPj4gLQlkcGNkWzBdID0gZHJtX2RwX21heF9saW5rX3JhdGUoYW54
NjM0NS0+ZHBjZCk7Cj4gPj4gLQlkcGNkWzBdID0gZHJtX2RwX2xpbmtfcmF0ZV90b19id19jb2Rl
KGRwY2RbMF0pOwo+ID4+ICsJZHBjZFswXSA9IGRwX2J3Owo+ID4KPiA+V2h5IGRvIHlvdSBtYWtl
IHRoaXMgYXNzaWdubWVudCBhbmQgbm90IHVzZSBkcF9idyBkaXJlY3RseSBpbiB0aGUgY2FsbD8K
PiAKPiBCZWNhdXNlIHRoZSBkcGNkIGFycmF5IGlzIHRoZW4gd3JpdHRlbiBhcyBhIGNvbnRpbm91
cyBhcnJheQo+IGJhY2sgdG8gRFBDRC4KCkJ1dCB0aGUgY3VycmVudCBjb2RlIG5ldmVyIGNoYW5n
ZXMgdGhpcyB2YWx1ZT8KQW55d2F5LCBhcyB0aGlzIG1pZ2h0IGNoYW5nZSBpbiB0aGUgZnV0dXJl
LCBJIHN1cHBvcnQgeW91ciB2ZXJzaW9uOwpJIHdhbnQgdG8gc2VlIHRoaXMgZml4ZWQuCgpSZXZp
ZXdlZC1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+CkZpeGVzOiBlMWNmZjgyYzEwOTcg
KCJkcm0vYnJpZGdlOiBmaXggYW54NjM0NSBjb21waWxhdGlvbiBmb3IgdjUuNSIpCkNjOiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KQ2M6IFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBsc3Qu
ZGU+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KQ2M6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KQ2M6IFN0
ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgoKPiA+Cj4gPj4gIAllcnIgPSBy
ZWdtYXBfd3JpdGUoYW54NjM0NS0+bWFwW0kyQ19JRFhfRFBUWF0sCj4gPj4gIAkJCSAgIFNQX0RQ
X01BSU5fTElOS19CV19TRVRfUkVHLCBkcGNkWzBdKTsKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXgo+ID4+ICAJaWYgKGVycikK
PiA+PiAtLSAKPiA+PiAyLjI0LjEKPiA+Cj4gPkJUVywgbXkgdmVyc2lvbiBpcyBvbmx5IGEgYml0
IG1vcmUgdmVyYm9zZToKPiA+Cj4gPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC8zNTQzNDQvCj4gPgo+ID4JVG9yc3Rlbgo+IAo+IC0tIAo+IOS9v+eUqCBLLTkgTWFpbCDl
j5HpgIHoh6rmiJHnmoRBbmRyb2lk6K6+5aSH44CCCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
