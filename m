Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD9965EB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 18:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC3289C21;
	Tue, 20 Aug 2019 16:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DCA89C21
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:08:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCAEB33D;
 Tue, 20 Aug 2019 18:08:33 +0200 (CEST)
Date: Tue, 20 Aug 2019 19:08:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
Message-ID: <20190820160827.GE10820@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
 <20190820103706.GB9745@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820103706.GB9745@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566317314;
 bh=3OOZ2tHkTtZbOXzKWOyIAwr2TW12+O/ggEtpcPRp8kY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbKF50P92Tpo5xGUgfFnKyUzoQ/TMOkjIez81HhCBakB+fVYf2z3j88JonFBiDoVi
 zCXYntKq3FtB48mWUqbO87vSimEQ7umyDesby9rApNDfsaMqenVjRv6XRSY+OloR9z
 w7AGpyH7+RL5ULx5gpNHEQawKrWl3F8VP5J4YoIA=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTI6Mzc6MDZQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDA0OjE2OjQ0QU0gKzAzMDAs
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBJbXBsZW1lbnQgdGhlIG5ld2x5IGFkZGVkIGJy
aWRnZSBjb25uZWN0b3Igb3BlcmF0aW9ucywgYWxsb3dpbmcgdGhlCj4gPiB1c2FnZSBvZiBkcm1f
YnJpZGdlX3BhbmVsIHdpdGggZHJtX2JyaWRnZV9jb25uZWN0b3IuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDE4ICsrKysr
KysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Bh
bmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiA+IGluZGV4IGY1YjhlNTUz
MDFhYy4uMWM3ZjViNjQ4ZjA1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9wYW5lbC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiA+IEBA
IC02MCw3ICs2MCw3IEBAIHN0YXRpYyBpbnQgcGFuZWxfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlLAo+ID4gIAlpbnQgcmV0Owo+ID4gIAo+ID4gIAlpZiAoZmxhZ3MgJiBE
Uk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IpCj4gPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiA+
ICsJCXJldHVybiAwOwo+ID4gIAo+ID4gIAlpZiAoIWJyaWRnZS0+ZW5jb2Rlcikgewo+ID4gIAkJ
RFJNX0VSUk9SKCJNaXNzaW5nIGVuY29kZXJcbiIpOwo+ID4gQEAgLTEyMyw2ICsxMjMsMTggQEAg
c3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKQo+ID4gIAlkcm1fcGFuZWxfdW5wcmVwYXJlKHBhbmVsX2JyaWRnZS0+cGFuZWwpOwo+
ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgaW50IHBhbmVsX2JyaWRnZV9nZXRfbW9kZXMoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwKPiA+ICsJCQkJICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQo+ID4gK3sKPiA+ICsJc3RydWN0IHBhbmVsX2JyaWRnZSAqcGFuZWxfYnJpZGdlID0g
ZHJtX2JyaWRnZV90b19wYW5lbF9icmlkZ2UoYnJpZGdlKTsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJ
ICogRklYTUU6IGRybV9wYW5lbF9nZXRfbW9kZXMoKSBzaG91bGQgdGFrZSB0aGUgY29ubmVjdG9y
IGFzIGFuCj4gPiArCSAqIGFyZ3VtZW50Lgo+ID4gKwkgKi8KPgo+IE5vdGVkLCBJIGhhdmUgcGF0
Y2hlcyB0byBmaXggdGhpcy4gTmVlZHMgYSBsaXR0bGUgdGVzdGluZy9wb2xpc2hpbmcKPiBiZWZv
cmUgSSBwb3N0IHRoZW0uCgpUYWtlIHlvdXIgdGltZS4gVGhhbmsgeW91IGZvciBhZGRyZXNzaW5n
IHRoaXMgaXNzdWUgOi0pCgo+ID4gKwlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2RlcyhwYW5lbF9i
cmlkZ2UtPnBhbmVsKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
YnJpZGdlX2Z1bmNzIHBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3MgPSB7Cj4gPiAgCS5hdHRhY2gg
PSBwYW5lbF9icmlkZ2VfYXR0YWNoLAo+ID4gIAkuZGV0YWNoID0gcGFuZWxfYnJpZGdlX2RldGFj
aCwKPiA+IEBAIC0xMzAsNiArMTQyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdl
X2Z1bmNzIHBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3MgPSB7Cj4gPiAgCS5lbmFibGUgPSBwYW5l
bF9icmlkZ2VfZW5hYmxlLAo+ID4gIAkuZGlzYWJsZSA9IHBhbmVsX2JyaWRnZV9kaXNhYmxlLAo+
ID4gIAkucG9zdF9kaXNhYmxlID0gcGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZSwKPiA+ICsJLmdl
dF9tb2RlcyA9IHBhbmVsX2JyaWRnZV9nZXRfbW9kZXMsCj4gPiAgfTsKPiA+ICAKPiA+ICAvKioK
PiA+IEBAIC0xNzUsNiArMTg4LDkgQEAgc3RydWN0IGRybV9icmlkZ2UgKmRybV9wYW5lbF9icmlk
Z2VfYWRkKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsLAo+ID4gICNpZmRlZiBDT05GSUdfT0YKPiA+
ICAJcGFuZWxfYnJpZGdlLT5icmlkZ2Uub2Zfbm9kZSA9IHBhbmVsLT5kZXYtPm9mX25vZGU7Cj4g
PiAgI2VuZGlmCj4gPiArCXBhbmVsX2JyaWRnZS0+YnJpZGdlLm9wcyA9IERSTV9CUklER0VfT1Bf
TU9ERVM7Cj4gPiArCS8qIEZJWE1FOiBUaGUgcGFuZWwgc2hvdWxkIHJlcG9ydCBpdHMgdHlwZS4g
Ki8KPiA+ICsJcGFuZWxfYnJpZGdlLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9E
UEk7Cj4KPiBDb25mdXNlZC4KPiBXZSBtb3ZlIHRoZSBjb25uZWN0b3IgdG8gdGhlIGRpc3BsYXkg
Y29udHJvbGxlci4KPiBTbyB0aGUgcGFuZWwgZG9lcyBub3Qga25vdyB0aGUgdHlwZS4KPiAKPiBJ
biBvdGhlcnMgd29yZHMgLSBwbGVhc2UgcHV0IGEgZmV3IG1vcmUgd29yZHMgb24gdGhpcyBGSVhN
RS4KCkkgbWVhbiB0aGUgcGFuZWwgc2hvdWxkIHJlcG9ydCBpZiBpdCdzIGEgRFBJLCBMVkRTLCBv
ciBvdGhlciB0eXBlIG9mCnBhbmVsLCBzbyB0aGF0IHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgd2ls
bCBrbm93IHdoYXQgdG8gaW5pdGlhbGlzZSB0aGUKY29ubmVjdG9yIHR5cGUgdG8uIEkgdGhpbmsg
dGhlIGRybV9wYW5lbCBzdHJ1Y3R1cmUgc2hvdWxkIGdldCBhIHR5cGUKZmllbGQsIHNpbWlsYXIg
dG8gdGhlIGJyaWRnZSB0eXBlIGZpZWxkLiBEb2VzIHRoYXQgbWFrZSBzZW5zZSB0byB5b3UgPwoK
PiA+ICAKPiA+ICAJZHJtX2JyaWRnZV9hZGQoJnBhbmVsX2JyaWRnZS0+YnJpZGdlKTsKPiA+ICAK
Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
