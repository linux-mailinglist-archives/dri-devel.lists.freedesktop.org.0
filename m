Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA675718
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 20:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F86E80E;
	Thu, 25 Jul 2019 18:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00476E80E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 18:39:54 +0000 (UTC)
Received: from d57e23da.static.ziggozakelijk.nl ([213.126.35.218]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hqieV-0001Vd-OO; Thu, 25 Jul 2019 20:39:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 07/11] drm/rockchip: Check for fast link training
 before enabling psr
Date: Thu, 25 Jul 2019 20:39:42 +0200
Message-ID: <3530881.Ri8gbRaMhX@phil>
In-Reply-To: <20190725180812.GO104440@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-8-sean@poorly.run>
 <20190725180812.GO104440@art_vandelay>
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2VhbiwKCkFtIERvbm5lcnN0YWcsIDI1LiBKdWxpIDIwMTksIDIwOjA4OjEyIENFU1Qgc2No
cmllYiBTZWFuIFBhdWw6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTI6MDg6MjFQTSAtMDQw
MCwgU2VhbiBQYXVsIHdyb3RlOgo+ID4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+Cj4gPiAKPiA+IE9uY2Ugd2Ugc3RhcnQgc2h1dHRpbmcgb2ZmIHRoZSBsaW5rIGR1cmlu
ZyBQU1IsIHdlJ3JlIGdvaW5nIHRvIHdhbnQgZmFzdAo+ID4gdHJhaW5pbmcgdG8gd29yay4gSWYg
dGhlIGRpc3BsYXkgZG9lc24ndCBzdXBwb3J0IGZhc3QgdHJhaW5pbmcsIGRvbid0Cj4gPiBlbmFi
bGUgcHNyLgo+ID4gCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBOb25lCj4gPiBDaGFuZ2VzIGlu
IHYzOgo+ID4gLSBOb25lCj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gLSBOb25lCj4gPiBDaGFuZ2Vz
IGluIHY1Ogo+ID4gLSBOb25lCj4gPiAKPiA+IExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDIyODIxMDkzOS44MzM4Ni0zLXNlYW5A
cG9vcmx5LnJ1bgo+ID4gTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoL21zZ2lkLzIwMTkwMzI2MjA0NTA5Ljk2NTE1LTItc2VhbkBwb29ybHkucnVuCj4g
PiBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNn
aWQvMjAxOTA1MDIxOTQ5NTYuMjE4NDQxLTktc2VhbkBwb29ybHkucnVuCj4gPiBMaW5rIHRvIHY0
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MDgx
NjA5MjAuMTQ0NzM5LTgtc2VhbkBwb29ybHkucnVuCj4gPiAKPiA+IENjOiBaYWluIFdhbmcgPHd6
ekByb2NrLWNoaXBzLmNvbT4KPiA+IENjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3Jn
Pgo+ID4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IAo+IEBI
ZWlrbywgY291bGQgeW91IHBsZWFzZSByZXZpZXcgcGF0Y2hlcyA3LTExPyBJJ20gd29ycmllZCB0
aGV5J3JlIGdvaW5nIHRvIHN0YXJ0Cj4gdG8gcm90IGFuZCB0aGUgaGVscGVycyBoYXZlIGFscmVh
ZHkgbGFuZGVkIGluIExpbnVzJyB0cmVlLgoKSSBkaWQgbG9vayB0aHJvdWdoIHRoZSBwYXRjaGVz
IGFuZCBub3RoaW5nIG91dCBvZiB0aGUgb3JkaW5hcnkgc3ByYW5nCm91dCB0byBteSAoc29tZXdo
YXQgdW50cmFpbmVkKSBleWUgYW5kIGp1ZGdpbmcgYnkgbXkgdGVzdGVkLXRhZ3MgSSBhbHNvCmdh
dmUgdGhlbSBhIHNwaW4gYXQgc29tZSBwb2ludCAtIGFsdGhvdWdoIGl0IHNlZW1zIEkgbmV2ZXIg
d2FzIGFjdHVhbGx5IG9uCmNjIGZvciB0aGVtLgoKSW4gYW55IGNhc2UgdGhleSBsb29rIGdvb2Qg
dG8gbWUsIHNvIGlmIGl0IGhlbHBzIHlvdSwgeW91IGNhbiBhZGQgbXkKCVJldmlld2VkLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgp0aG91Z2ggc2hvdWxkIHRha2UgdGhlIHRl
Y2huaWNhbCBleHBlcnRpc2Ugb24gZHJtLWludGVybmFscyB3aXRoIGEKZ3JhaW4gb2Ygc2FsdC4K
CgpIZWlrbwoKCgo+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxv
Z2l4X2RwX2NvcmUuYyB8IDkgKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiA+IGluZGV4IGQyZGU5OGQ0NDE4
NDUuLmEwN2QxOWUwOGI4MDMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiA+IEBAIC0xMDQwLDE2ICsxMDQwLDE3
IEBAIHN0YXRpYyBpbnQgYW5hbG9naXhfZHBfY29tbWl0KHN0cnVjdCBhbmFsb2dpeF9kcF9kZXZp
Y2UgKmRwKQo+ID4gIAlpZiAocmV0KQo+ID4gIAkJcmV0dXJuIHJldDsKPiA+ICAKPiA+ICsJLyog
Q2hlY2sgd2hldGhlciBwYW5lbCBzdXBwb3J0cyBmYXN0IHRyYWluaW5nICovCj4gPiArCXJldCA9
IGFuYWxvZ2l4X2RwX2Zhc3RfbGlua190cmFpbl9kZXRlY3Rpb24oZHApOwo+ID4gKwlpZiAocmV0
KQo+ID4gKwkJZHAtPnBzcl9lbmFibGUgPSBmYWxzZTsKPiA+ICsKPiA+ICAJaWYgKGRwLT5wc3Jf
ZW5hYmxlKSB7Cj4gPiAgCQlyZXQgPSBhbmFsb2dpeF9kcF9lbmFibGVfc2lua19wc3IoZHApOwo+
ID4gIAkJaWYgKHJldCkKPiA+ICAJCQlyZXR1cm4gcmV0Owo+ID4gIAl9Cj4gPiAgCj4gPiAtCS8q
IENoZWNrIHdoZXRoZXIgcGFuZWwgc3VwcG9ydHMgZmFzdCB0cmFpbmluZyAqLwo+ID4gLQlyZXQg
PSAgYW5hbG9naXhfZHBfZmFzdF9saW5rX3RyYWluX2RldGVjdGlvbihkcCk7Cj4gPiAtCWlmIChy
ZXQpCj4gPiAtCQlkcC0+cHNyX2VuYWJsZSA9IGZhbHNlOwo+ID4gIAo+ID4gIAlyZXR1cm4gcmV0
Owo+ID4gIH0KPiAKPiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
