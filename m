Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C375E3332C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 17:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0CC891CD;
	Mon,  3 Jun 2019 15:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA07E891CD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:11:29 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h10so11959640edi.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 08:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=gEf9rJsyyyGoYqOpbR8M6HQWLObis8WDL9iBy6aUlmg=;
 b=c/c3azi1jCCnQP3HxkaigBlJJ7zJOozDC6yUOMkh/S/xJDJRGGGmZVDOuBkvE2ph0u
 VjSrqGpKENFzdjBWplLV3vXn4M2BZCaZzHiidshkd0v0jtFNzhJK8Xaj6yNf7o/xhPyl
 sxJGYDm0FGZ00bh3R3LorcbOiFf9BEShj1CsieziAurJ11YnP4JrdZIFsl5WIXqBfa36
 JoTTE9LDOrCV1kBpAJz8YiJczmDHJeQdV1ksc7zaP5Dzqhh/wOmgQcHB6Mx8x3y0l2h+
 KnxBKoRSqRwtD/f1MfrVv8ZWLkmnqhZ2Jk0uD+eLK59MkmBVv7CkOCraA1/Du018hWXm
 9usA==
X-Gm-Message-State: APjAAAX+3+88i6fFFU5CVge+kLZXLaAlvvKv3zKtR+kGd9xtcQsAecr6
 PDAKIZxMrLb1+rF441riBTLj+A==
X-Google-Smtp-Source: APXvYqwkt48c5UibvBT5zhJnHu+2OUBlaiky2jmOtRVsIwdkSwMbF4EIwrvmAXz6WPt9oBZZNosgqw==
X-Received: by 2002:a17:906:d193:: with SMTP id
 c19mr24578071ejz.149.1559574688412; 
 Mon, 03 Jun 2019 08:11:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i13sm141340eds.2.2019.06.03.08.11.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 08:11:27 -0700 (PDT)
Date: Mon, 3 Jun 2019 17:11:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/docs: More links for implicit/explicit fencing.
Message-ID: <20190603151125.GM21222@phenom.ffwll.local>
References: <20190603142848.26487-1-daniel.vetter@ffwll.ch>
 <20190603173411.12159113@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603173411.12159113@eldfell.localdomain>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gEf9rJsyyyGoYqOpbR8M6HQWLObis8WDL9iBy6aUlmg=;
 b=JEK7IQ5G+8Re9pEG5i5ee7a5BzN6LgnPFOL0xql37FiyQhCkznOCIv8Xc2yFwMbqJf
 cc4/OoaEmEdjhxqWBsUNiQYU31PUtWmT9Xc7HHe8Z0Ed08pNkP3QhQNJ5LYTYE4youmT
 cEyIn8bW+rteFycHDhEeHd3iVM7H+WC58kyKo=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDU6MzQ6MTFQTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gTW9uLCAgMyBKdW4gMjAxOSAxNjoyODo0OCArMDIwMAo+IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gZHJtX2F0b21pY19zZXRf
ZmVuY2VfZm9yX3BsYW5lKCkgY29udGFpbnMgdGhlIG1haW4gZGlzY3Vzc2lvbiBmcm9tIGEKPiA+
IGRyaXZlciBwb3YsIGxpbmsgdG8gdGhhdCBmcm9tIG1vcmUgcGxhY2VzLgo+ID4gCj4gPiBDYzog
UGVra2EgUGFhbGFuZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4g
Q2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jIHwgNiArKysr
KysKPiA+ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYwo+
ID4gaW5kZXggNmZkNDhlZmUyODhjLi42NzkxMjQ1OTYzYzMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKPiA+IEBAIC0yODQsNiArMjg0
LDkgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9kaXJ0eSk7Cj4g
PiAgICogVGhlcmUgaXMgbm8gbmVlZCBmb3IgJmRybV9wbGFuZV9oZWxwZXJfZnVuY3MuY2xlYW51
cF9mYiBob29rIGZvciBzaW1wbGUKPiA+ICAgKiBnZW0gYmFzZWQgZnJhbWVidWZmZXIgZHJpdmVy
cyB3aGljaCBoYXZlIHRoZWlyIGJ1ZmZlcnMgYWx3YXlzIHBpbm5lZCBpbgo+ID4gICAqIG1lbW9y
eS4KPiA+ICsgKgo+ID4gKyAqIFNlZSBkcm1fYXRvbWljX3NldF9mZW5jZV9mb3JfcGxhbmUoKSBm
b3IgYSBkaXNjdXNzaW9uIG9mIGltcGxpY2l0IGFuZAo+ID4gKyAqIGV4cGxpY2l0IGZlbmNpbmcg
aW4gYXRvbWljIG1vZGVzZXQgdXBkYXRlcy4KPiA+ICAgKi8KPiA+ICBpbnQgZHJtX2dlbV9mYl9w
cmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ID4gIAkJCSAgc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqc3RhdGUpCj4gPiBAQCAtMzE0LDYgKzMxNyw5IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKGRybV9nZW1fZmJfcHJlcGFyZV9mYik7Cj4gPiAgICogJmRtYV9idWYgYXR0YWNoZWQsIGV4
dHJhY3RzIHRoZSBleGNsdXNpdmUgZmVuY2UgYW5kIGF0dGFjaGVzIGl0IHRvIHBsYW5lCj4gPiAg
ICogc3RhdGUgZm9yIHRoZSBhdG9taWMgaGVscGVyIHRvIHdhaXQgb24uIERyaXZlcnMgY2FuIHVz
ZSB0aGlzIGFzIHRoZWlyCj4gPiAgICogJmRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzLnBy
ZXBhcmVfZmIgY2FsbGJhY2suCj4gPiArICoKPiA+ICsgKiBTZWUgZHJtX2F0b21pY19zZXRfZmVu
Y2VfZm9yX3BsYW5lKCkgZm9yIGEgZGlzY3Vzc2lvbiBvZiBpbXBsaWNpdCBhbmQKPiA+ICsgKiBl
eHBsaWNpdCBmZW5jaW5nIGluIGF0b21pYyBtb2Rlc2V0IHVwZGF0ZXMuCj4gPiAgICovCj4gPiAg
aW50IGRybV9nZW1fZmJfc2ltcGxlX2Rpc3BsYXlfcGlwZV9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1f
c2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiA+ICAJCQkJCSAgICAgIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKnBsYW5lX3N0YXRlKQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9w
bGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKPiA+IGluZGV4IDYwNzhjNzAwZDliYS4u
Y2Q1OTAzYWQzM2Y3IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKPiA+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCj4gPiBAQCAtNjksNyArNjksNyBAQCBzdHJ1
Y3QgZHJtX3BsYW5lX3N0YXRlIHsKPiA+ICAJICoKPiA+ICAJICogT3B0aW9uYWwgZmVuY2UgdG8g
d2FpdCBmb3IgYmVmb3JlIHNjYW5uaW5nIG91dCBAZmIuIFRoZSBjb3JlIGF0b21pYwo+ID4gIAkg
KiBjb2RlIHdpbGwgc2V0IHRoaXMgd2hlbiB1c2Vyc3BhY2UgaXMgdXNpbmcgZXhwbGljaXQgZmVu
Y2luZy4gRG8gbm90Cj4gPiAtCSAqIHdyaXRlIHRoaXMgZGlyZWN0bHkgZm9yIGEgZHJpdmVyJ3Mg
aW1wbGljaXQgZmVuY2UsIHVzZQo+ID4gKwkgKiB3cml0ZSB0aGlzIGZpZWxkIGRpcmVjdGx5IGZv
ciBhIGRyaXZlcidzIGltcGxpY2l0IGZlbmNlLCB1c2UKPiA+ICAJICogZHJtX2F0b21pY19zZXRf
ZmVuY2VfZm9yX3BsYW5lKCkgdG8gZW5zdXJlIHRoYXQgYW4gZXhwbGljaXQgZmVuY2UgaXMKPiA+
ICAJICogcHJlc2VydmVkLgo+ID4gIAkgKgo+IAo+IFJldmlld2VkLWJ5OiBQZWtrYSBQYWFsYW5l
biA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KPiBGV0lXCgpBbmQgYXBwbGllZCwgdGhh
bmtzIGZvciB0YWtpbmcgYSBsb29rLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
