Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C4A517D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB75589B96;
	Mon,  2 Sep 2019 08:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C41C89B96
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:23:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A2E6303;
 Mon,  2 Sep 2019 10:23:39 +0200 (CEST)
Date: Mon, 2 Sep 2019 11:23:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Hardcode panel type to DPI
Message-ID: <20190902082333.GF4777@pendragon.ideasonboard.com>
References: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
 <1566595809.1871.0@crapouillou.net>
 <20190827050054.GA22071@ravnborg.org>
 <1567073012.1884.1@crapouillou.net>
 <20190829144650.GC5875@pendragon.ideasonboard.com>
 <1567254542.1878.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567254542.1878.0@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567412619;
 bh=lqV4fqQZcT0tEyWIMLvO4PhHFt/Mv9iPC0yyvQ7fU4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mppN2qldaATb7QT6+Fj5KkeQxooPC3pDXUi7IQ+6IFd/riU3XYCxyVufwhzDoQGsq
 /k5MVOsTGr8xij4yT6UsiOxqEMshpLIvYEjefdadwgDRp1KwIfo4x4DxNW/53IVUfF
 iejfaAp/ZAcMGWZutBF/ez6Wpkt5ImLiaOwenzKU=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bCwKCk9uIFNhdCwgQXVnIDMxLCAyMDE5IGF0IDAyOjI5OjAyUE0gKzAyMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gTGUgamV1LiAyOSBhb8O7dCAyMDE5IMOgIDE2OjQ2LCBMYXVyZW50
IFBpbmNoYXJ0IGEgw6ljcml0IDoKPiA+IE9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDEyOjAzOjMy
UE0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPj4gIExlIG1hci4gMjcgYW/Du3QgMjAx
OSDDoCA3OjAwLCBTYW0gUmF2bmJvcmcgYSDDqWNyaXQgOgo+ID4+PiBPbiBGcmksIEF1ZyAyMywg
MjAxOSBhdCAxMTozMDowOVBNICswMjAwLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+ID4+Pj4gIExl
IHZlbi4gMjMgYW/Du3QgMjAxOSDDoCAyMzoyMywgTGF1cmVudCBQaW5jaGFydCBhIMOpY3JpdCA6
Cj4gPj4+Pj4gVGhlIGluZ2VuaWMgZHJpdmVyIHN1cHBvcnRzIERQSSBwYW5lbHMgb25seSBhdCB0
aGUgbW9tZW50LCBzbyBoYXJkY29kZQo+ID4+Pj4+IHRoZWlyIHR5cGUgdG8gRFBJIGluc3RlYWQg
b2YgVW5rbm93bi4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+Pj4+PiAtLS0KPiA+Pj4+
PiBQYXVsLCBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1lcmdlZCBpbiB2NS4zLXJjMSwgdGhpcyBp
cyBhIGNhbmRpZGF0ZSBmb3IKPiA+Pj4+PiBhIHY1LjMgZml4LiBLZWVwaW5nIHRoZSBjb25uZWN0
b3IgdHlwZSBhcyB1bmtub3duIGNvdWxkIGNhdXNlIGEKPiA+Pj4+PiB1c2Vyc3BhY2UgZGVwZW5k
ZW5jeSBvbiBpdCwgcHJldmVudGluZyBpdCBmcm9tIGJlaW5nIGNoYW5nZWQgbGF0ZXIuCj4gPj4+
Pgo+ID4+Pj4gIE1ha2VzIHNlbnNlLgo+ID4+Pj4KPiA+Pj4+ICBSZXZpZXdlZC1ieTogUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPj4+Cj4gPj4+IEluIGFub3RoZXIgbWFp
bCB3ZSBkaXNjdXNzIENPTk5FQ1RPUl9QQU5FTC4gQnV0IHdlIHNob3VsZCBub3QgaG9sZCB1cAo+
ID4+PiBkdWUgdG8gdGhpcy4KPiA+Pj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiA+Pj4KPiA+Pj4gUGF1bCAtIHdpbGwgeW91IGFwcGx5IHRvIGRybS1taXNj
LWZpeGVzPwo+ID4+IAo+ID4+IEkgcHVzaGVkIHRvIGRybS1taXNjLW5leHQgKEkgaG9wZSB0aGF0
J3MgT0sgYW5kIEkgZGlkbid0IHNjcmV3IHVwKSBhbmQKPiA+PiBhbHNvIGRybS1taXNjLWZpeGVz
Lgo+ID4gCj4gPiBJICp0aGluayogeW91IG9ubHkgbmVlZGVkIHRvIHB1c2ggdG8gZHJtLW1pc2Mt
Zml4ZXMuIFB1c2hpbmcgdGhlIHNhbWUKPiA+IHBhdGNoIHRvIGJvdGggd2lsbCBnZW5lcmF0ZSBh
IGNvbmZsaWN0IHdoZW4gZHJtLW1pc2MtbmV4dCBpcyBtZXJnZWQgCj4gPiB3aXRoIGRybS1taXNj
LWZpeGVzICh3aGljaCB3aWxsIGhhcHBlbiBpbiBsaW51eC1uZXh0IGZpcnN0LCBhbmQgdGhlbiB3
aGVuCj4gPiBMaW51cyBtZXJnZXMgdGhlIGRybS1taXNjLW5leHQgYnJhbmNoIGludG8gaGlzIHRy
ZWUgZm9yIHY1LjUpLgo+IAo+IEdpdCBpcyBzbWFydCBhbmQgc2hvdWxkbid0IGNvbmZsaWN0IG9u
IHRoYXQsIGJ1dCBpZiBpdCBkb2VzIEkgYXBvbG9naXplLgoKSXQgaXMgbW9zdCBvZiB0aGUgdGlt
ZSwgYnV0IHNvbWV0aW1lcyBpdCBzdGlsbCBmYWlscy4gVGhhdCdzIHdoeSB0aGUKc2FtZSBwYXRj
aCBzaG91bGQgbm90IGJlIG1lcmdlZCB0aHJvdWdoIGRpZmZlcmVudCB0cmVlcy4gRG9uJ3Qgd29y
cnkKYWJvdXQgdGhpcyBjYXNlLCBsZXQncyBqdXN0IGtlZXAgaXQgaW4gbWluZCBmb3IgdGhlIG5l
eHQgdGltZSA6LSkgQW5kCnRoYW5rIHlvdSBmb3IgaGFuZGxpbmcgdGhpcyBwYXRjaCwgaXQncyBy
ZWFsbHkgYXBwcmVjaWF0ZWQuCgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aW5nZW5pYy9pbmdlbmljLWRybS5jCj4gPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9p
bmdlbmljLWRybS5jCj4gPj4+Pj4gaW5kZXggY2UxZmFlM2E3OGE5Li4yZTJlZDY1M2U5YzYgMTAw
NjQ0Cj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+
ID4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPiA+Pj4+
PiBAQCAtNjc1LDEwICs2NzUsOSBAQCBzdGF0aWMgaW50IGluZ2VuaWNfZHJtX3Byb2JlKHN0cnVj
dAo+ID4+Pj4gcGxhdGZvcm1fZGV2aWNlCj4gPj4+Pj4gKnBkZXYpCj4gPj4+Pj4gIAkJcmV0dXJu
IHJldDsKPiA+Pj4+PiAgCX0KPiA+Pj4+Pgo+ID4+Pj4+IC0JaWYgKHBhbmVsKSB7Cj4gPj4+Pj4g
KwlpZiAocGFuZWwpCj4gPj4+Pj4gIAkJYnJpZGdlID0gZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2Fk
ZChkZXYsIHBhbmVsLAo+ID4+Pj4+IC0JCQkJCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93
bik7Cj4gPj4+Pj4gLQl9Cj4gPj4+Pj4gKwkJCQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkp
Owo+ID4+Pj4+Cj4gPj4+Pj4gIAlwcml2LT5kbWFfaHdkZXNjID0gZG1hX2FsbG9jX2NvaGVyZW50
KGRldiwgc2l6ZW9mKCpwcml2LT5kbWFfaHdkZXNjKSwKPiA+Pj4+PiAgCQkJCQkgICAgICAmcHJp
di0+ZG1hX2h3ZGVzY19waHlzLAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
