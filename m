Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3BB164
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 01:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E999E890B6;
	Fri, 26 Apr 2019 23:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DC7890B6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 23:46:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (net-37-182-44-227.cust.vodafonedsl.it [37.182.44.227])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CD615F;
 Sat, 27 Apr 2019 01:46:29 +0200 (CEST)
Date: Sat, 27 Apr 2019 02:46:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 02/22] drm/bridge: tc358767: reset voltage-swing &
 pre-emphasis
Message-ID: <20190426234617.GC5054@pendragon.ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-3-tomi.valkeinen@ti.com>
 <20190420203049.GE4964@pendragon.ideasonboard.com>
 <275405d7-0538-93bb-ac06-f37fee942b7c@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <275405d7-0538-93bb-ac06-f37fee942b7c@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1556322389;
 bh=mU9vwgV1o8lIdFHgU0G5IrVCd3nwCgXAliBfP2g673w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s7JI2aBiDijXvzCEVWPBZ4jd7pxVBsHX7PVfAEjKqwQ+to5i5YYCCnCNvn0895ZJc
 xAq85SZL8cMgkAEIb+Syn1qaEY4/O8F7HK1a46pINEF9TZDuD3IW2AFNV7nfngQLGK
 j25pqq5oVXfcadU8G+Fcn+fkhrx3hY+6C1SvqTl4=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIEZyaSwgQXByIDI2LCAyMDE5IGF0IDA1OjE0OjE3UE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIwLzA0LzIwMTkgMjM6MzAsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAyNiwgMjAxOSBhdCAxMjozMToyNlBNICswMjAwLCBUb21p
IFZhbGtlaW5lbiB3cm90ZToKPiA+PiBXZSBuZWVkIHRvIHJlc2V0IERQQ0Qgdm9sdGFnZS1zd2lu
ZyAmIHByZS1lbXBoYXNpcyBiZWZvcmUgc3RhcnRpbmcgdGhlCj4gPj4gbGluayB0cmFpbmluZywg
YXMgb3RoZXJ3aXNlIHRjMzU4NzY3IHdpbGwgdXNlIHRoZSBwcmV2aW91cyB2YWx1ZXMgYXMKPiA+
PiBtaW5pbXVtcy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkB0aS5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYyB8IDYgKysrKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiA+PiBpbmRleCA3MDMxYzRm
NTJjNTcuLjExYTUwZjdiYjRiZSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMKPiA+PiBAQCAtOTU2LDYgKzk1NiwxMiBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19zZXR1
cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gPj4gIAlpZiAocmV0IDwgMCkKPiA+PiAgCQlnb3RvIGVy
cl9kcGNkX3dyaXRlOwo+ID4+ICAKPiA+PiArCS8vIFJlc2V0IHZvbHRhZ2Utc3dpbmcgJiBwcmUt
ZW1waGFzaXMKPiA+IAo+ID4gVGhlIGRyaXZlciB1c2VzIEMtc3R5bGUgY29tbWVudHMsIEkgdGhp
bmsgaXQgd291bGQgYmUgYmVzdCB0byBzdGljayB0bwo+ID4gdGhlbSB0byBhdm9pZCBhIHN0eWxl
IG1pc21hdGNoLgo+IAo+IE9vcHMuIFllcC4gSSBvZnRlbiB1c2UgYysrIGNvbW1lbnRzIHdoZW4g
aGFja2luZy9kZXZlbG9waW5nIGFzIHRoZXkncmUKPiBvZnRlbiBlYXNpZXIgdG8gdXNlLiBTb21l
dGltZXMgSSBtaXNzIGNvbnZlcnRpbmcgdGhlbSB0byBjIGNvbW1lbnRzLi4uCj4gCj4gPj4gKwl0
bXBbMF0gPSB0bXBbMV0gPSBEUF9UUkFJTl9WT0xUQUdFX1NXSU5HX0xFVkVMXzAgfCBEUF9UUkFJ
Tl9QUkVfRU1QSF9MRVZFTF8wOwo+ID4gCj4gPiBZb3UgbWF5IHdhbnQgdG8gd3JhcCB0aGUgbGlu
ZS4KPiAKPiBXZWxsLCBJIHBlcnNvbmFsbHkgZG9uJ3QgdGhpbmsgd3JhcHBpbmcgYXQgODAgaXMg
YSBnb29kIGlkZWEuIFNvbWV0aGluZwo+IGxpa2UgMTIwIGlzIG1vcmUgc2Vuc2libGUgYW5kIG1h
a2VzIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUuCj4gCj4gSSBjYW4gd3JhcCBpdCBpZiB5b3UgaW5z
aXN0ID0pCgpJIGRvbid0IG1pbmQgZ29pbmcgb3ZlciA4MCB3aGVuIGl0IG1ha2VzIHRoZSBjb2Rl
IG1vcmUgcmVhZGFibGUsIGJ1dAp3aGVuIGl0J3MgZWFzeSB0byB3cmFwLCA4MCBpcyBhIG5pY2Ug
dmFsdWUsIGFuZCBtYXRjaGVzIG1vc3Qgb2YgdGhlCmtlcm5lbCBjb2RlIDotKQoKPiA+PiArCXJl
dCA9IGRybV9kcF9kcGNkX3dyaXRlKGF1eCwgRFBfVFJBSU5JTkdfTEFORTBfU0VULCB0bXAsIDIp
Owo+ID4gCj4gPiBXaGF0IGJyYW5jaCBkb2VzIHRoaXMgc2VyaWVzIGFwcGx5IHRvID8gRFBfVFJB
SU5JTkdfTEFORTBfU0VUIGlzbid0Cj4gPiBkZWZpbmVkIGluIExpbnVzJyBvciBEYXZlJ3MgbWFz
dGVyIGJyYW5jaGVzLgo+IAo+IEl0J3MgdGhlcmUuIEF0IGxlYXN0IHY1LjAgaGFzIGl0LgoKTXkg
YmFkLCBJIHRob3VnaHQgaXQgd2FzIGEgZHJpdmVyLXNwZWNpZmljIG1hY3JvLgoKPiA+PiArCWlm
IChyZXQgPCAwKQo+ID4+ICsJCWdvdG8gZXJyX2RwY2Rfd3JpdGU7Cj4gPj4gKwo+ID4gCj4gPiBJ
IGNhbid0IGNvbW1lbnQgb24gdGhpcyBhcyBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBkZXZp
Y2UKPiA+IGRvY3VtZW50YXRpb24gOi0oCj4gCj4gSG1tLCBjb21tZW50IG9uIHdoYXQ/CgpPbiB0
aGUgb3ZlcmFsbCBjaGFuZ2UuIEJ1dCBub3cgdGhhdCBJJ3ZlIHJlYWxpemVkIHRoaXMgaXNuJ3Qg
c3BlY2lmaWMgdG8KdGhlIHRjMzU4NzY3LCB5b3VyIGNoYW5nZSBzZWVtcyBmaW5lIHRvIG1lLgoK
PiA+PiAgCXJldCA9IHRjX2xpbmtfdHJhaW5pbmcodGMsIERQX1RSQUlOSU5HX1BBVFRFUk5fMSk7
Cj4gPj4gIAlpZiAocmV0KQo+ID4+ICAJCWdvdG8gZXJyOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
