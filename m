Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E94FDA5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCDB89971;
	Sun, 23 Jun 2019 18:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5476E94B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 01:55:10 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id 190so5046254vsf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 18:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJNwQ3mLV8c2DQL6zapl2FGuDETRbFo/82UxBr+AH6A=;
 b=poHoVEYJi1G7rc+EzrWTzntLJiJaoy4dj9wS7CAEOvNZMM4NEnx8bQWnQPlsFAUg2G
 ZhHT6Os3z4IgNKEamErfrYw2vXo6mXAhfvDBgkaJVOMrOswQkLk+vs94oExUQfP6JJEP
 0NripitgXSeFc46ElnFkC8aRlHJhFUzeLPh+mGCTq6pQySmqln+Jowugxvnym7q56DK7
 sKlSbStuUumVrGT+S33px/y7I/NDN6rMl9SFBT0HfC6iFhv9Mayfdd6sxWu+X/Wkn+I2
 G2XRX4+vqCTZ6WpVoCZaN8SafO8jQ16huFyfkZTWjrsjrB9eouE2Jha8ZG/9MemcHTuN
 o1dw==
X-Gm-Message-State: APjAAAUD8X4byBzYUR2khAMuSdQFTGy75Orxzw0LFrDVfto/t3Mw9Gef
 LSJyZn3UvQ9Pqo83Y2o3ZbsezJe8tOu6L0559NWFeA==
X-Google-Smtp-Source: APXvYqxIUQ4BIsLDa7mjdOr3DxZ0fEYbaLvNVTh2X5FXEq12gxCyd4wyEmkfrQB7bvfwwvie1eNDWlSCYOg/Tnvc+qM=
X-Received: by 2002:a67:7d13:: with SMTP id y19mr57281881vsc.232.1561168509102; 
 Fri, 21 Jun 2019 18:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-4-dbasehore@chromium.org>
 <20190611085722.GX21222@phenom.ffwll.local>
 <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
 <20190621091928.GA11839@ulmo>
In-Reply-To: <20190621091928.GA11839@ulmo>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Fri, 21 Jun 2019 18:54:57 -0700
Message-ID: <CAGAzgsqkJnc4jESSVMtYEQ4=DhmLVKbo_8CTk9cwH0j+55ZuTw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: Add attach/detach callbacks
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rJNwQ3mLV8c2DQL6zapl2FGuDETRbFo/82UxBr+AH6A=;
 b=dvw6+h32jWORvo7jMZPESQgSthDbn7z03u9GLjsid38O6nYq1at3dkhVnc+MFLAUfy
 XMWuL+lGSbdU4YUp+4DzaZDxDYW6Z8e8x/6ETdnfog16NJl7DmSRta5asKt5t2HKHSPo
 iLp6MEOb/l0yLyh0JhQe7+EJtudxCM2ivTJ3c=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMjoxOSBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA1OjI1
OjQ3UE0gLTA3MDAsIGRiYXNlaG9yZSAuIHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMTEsIDIwMTkg
YXQgMTo1NyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAwOTowMzo0OFBNIC0wNzAwLCBEZXJlayBCYXNl
aG9yZSB3cm90ZToKPiA+ID4gPiBUaGlzIGFkZHMgdGhlIGF0dGFjaC9kZXRhY2ggY2FsbGJhY2tz
LiBUaGVzZSBhcmUgZm9yIHNldHRpbmcgdXAKPiA+ID4gPiBpbnRlcm5hbCBzdGF0ZSBmb3IgdGhl
IGNvbm5lY3Rvci9wYW5lbCBwYWlyIHRoYXQgY2FuJ3QgYmUgZG9uZSBhdAo+ID4gPiA+IHByb2Jl
IChzaW5jZSB0aGUgY29ubmVjdG9yIGRvZXNuJ3QgZXhpc3QpIGFuZCB3aGljaCBkb24ndCBuZWVk
IHRvIGJlCj4gPiA+ID4gcmVwZWF0ZWRseSBkb25lIGZvciBldmVyeSBnZXQvbW9kZXMsIHByZXBh
cmUsIG9yIGVuYWJsZSBjYWxsYmFjay4KPiA+ID4gPiBWYWx1ZXMgc3VjaCBhcyB0aGUgcGFuZWwg
b3JpZW50YXRpb24sIGFuZCBkaXNwbGF5IHNpemUgY2FuIGJlIGZpbGxlZAo+ID4gPiA+IGluIGZv
ciB0aGUgY29ubmVjdG9yLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGVyZWsgQmFz
ZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fcGFuZWwuYyB8IDE0ICsrKysrKysrKysrKysrCj4gPiA+ID4gIGluY2x1
ZGUvZHJtL2RybV9wYW5lbC5oICAgICB8ICA0ICsrKysKPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gPiA+ID4g
aW5kZXggM2I2ODljZTRhNTFhLi43MmY2NzY3OGQ5ZDUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wYW5lbC5jCj4gPiA+ID4gQEAgLTEwNCwxMiArMTA0LDIzIEBAIEVYUE9SVF9TWU1CT0woZHJt
X3BhbmVsX3JlbW92ZSk7Cj4gPiA+ID4gICAqLwo+ID4gPiA+ICBpbnQgZHJtX3BhbmVsX2F0dGFj
aChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikKPiA+ID4gPiAgewo+ID4gPiA+ICsgICAgIGludCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICAg
ICAgIGlmIChwYW5lbC0+Y29ubmVjdG9yKQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1F
QlVTWTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIHBhbmVsLT5jb25uZWN0b3IgPSBjb25uZWN0b3I7
Cj4gPiA+ID4gICAgICAgcGFuZWwtPmRybSA9IGNvbm5lY3Rvci0+ZGV2Owo+ID4gPiA+Cj4gPiA+
ID4gKyAgICAgaWYgKHBhbmVsLT5mdW5jcy0+YXR0YWNoKSB7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICByZXQgPSBwYW5lbC0+ZnVuY3MtPmF0dGFjaChwYW5lbCk7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICBpZiAocmV0IDwgMCkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBwYW5lbC0+Y29u
bmVjdG9yID0gTlVMTDsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcGFuZWwtPmRybSA9
IE5VTEw7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4g
KyAgICAgICAgICAgICB9Cj4gPiA+ID4gKyAgICAgfQo+ID4gPgo+ID4gPiBXaHkgY2FuJ3Qgd2Ug
anVzdCBpbXBsZW1lbnQgdGhpcyBpbiB0aGUgZHJtIGhlbHBlcnMgZm9yIGV2ZXJ5b25lLCBieSBl
LmcuCj4gPiA+IHN0b3JpbmcgYSBkdCBub2RlIGluIGRybV9wYW5lbD8gRmVlbHMgYSBiaXQgb3Zl
cmtpbGwgdG8gaGF2ZSB0aGVzZSBuZXcKPiA+ID4gaG9va3MgaGVyZS4KPiA+ID4KPiA+ID4gQWxz
bywgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoaXMgZHQgc3R1ZmYgaXMgc3VwcG9zZWQgdG8g
YmUKPiA+ID4gc3RhbmRhcmRpemVkLCBzbyB0aGlzIHNob3VsZCB3b3JrLgo+ID4KPiA+IFNvIGRv
IHlvdSB3YW50IGFsbCBvZiB0aGlzIGluZm9ybWF0aW9uIGFkZGVkIHRvIHRoZSBkcm1fcGFuZWwg
c3RydWN0Pwo+ID4gSWYgd2UgZG8gdGhhdCwgd2UgZG9uJ3QgbmVjZXNzYXJpbHkgZXZlbiBuZWVk
IHRoZSBkcm0gaGVscGVyIGZ1bmN0aW9uLgo+ID4gV2UgY291bGQganVzdCBjb3B5IHRoZSB2YWx1
ZXMgb3ZlciBoZXJlIGluIHRoZSBkcm1fcGFuZWxfYXR0YWNoCj4gPiBmdW5jdGlvbiAoYW5kIGNs
ZWFyIHRoZW0gaW4gZHJtX3BhbmVsX2RldGFjaCkuCj4KPiBZZWFoLCBJIHRoaW5rIHdlIHNob3Vs
ZCBoYXZlIGFsbCB0aGlzIGV4dHJhIGluZm9ybWF0aW9uIGluIHRoZSBzdHJ1Y3QKPiBkcm1fcGFu
ZWwuIEhvd2V2ZXIsIEkgdGhpbmsgd2UgbmVlZCB0byBtb3JlIGNhcmVmdWxseSBzcGxpdCB0aGlu
Z3Mgc3VjaAo+IHRoYXQgdGhlIERUIHBhcnNpbmcgaGFwcGVucyBhdCBwYW5lbCBwcm9iZSB0aW1l
LiBUaGF0IHdheSB3ZSBjYW4gY2F0Y2gKPiBlcnJvcnMgaW4gRFQsIG9yIG1pc3NpbmcgZW50cmll
cy9yZXNvdXJjZXMgd2hlbiB3ZSBjYW4gc3RpbGwgZG8KPiBzb21ldGhpbmcgYWJvdXQgaXQuCgpG
b3Igbm93LCBJJ2xsIGp1c3QgcHV0IHdpZHRoLCBoZWlnaHQsIGJwYywgb3JpZW50YXRpb24sIGJ1
c19mbGFncywgYW5kCmJ1c19mb3JtYXRzIGluIHRoZSBkcm1fcGFuZWwgc3RydWN0LiBUaG9zZSBh
cmUgcHJldHR5IGNvbnNpc3RlbnRseSBzZXQKZnJvbSBlaXRoZXIgZ2V0X21vZGVzIG9yIHByZXBh
cmUuIFRoZSBvdGhlciB0aGluZyB0aG9zZSBhbGwgaGF2ZSBpbgpjb21tb24gaXMgdGhhdCB0aGUg
dmFsdWVzIGRvbid0IGNoYW5nZS4KCldlIGNvdWxkIGp1c3QgYWRkIGFuIGVudGlyZSBkcm1fZGlz
cGxheV9pbmZvIHN0cnVjdCBpbnNpZGUgZHJtX3BhbmVsLApidXQgSSBkb24ndCBrbm93IGlmIHdl
IGNhbiBqdXN0IGNvcHkgdGhhdCBvdmVyIG9yIHNldCBhIHBvaW50ZXIKd2l0aG91dCBicmVha2lu
ZyBzb21ldGhpbmcgZWxzZSwgc2luY2Ugc29tZSBvZiB0aGUgdmFsdWVzIGluIHRoZQpkcm1fZGlz
cGxheV9pbmZvIHN0cnVjdCBhcmUgbm90IHNldCBieSB0aGUgcGFuZWwgKGJ1dCBtYXliZSBzZXQg
YnkKc29tZXRoaW5nIGVsc2UpLgoKPgo+IElmIHdlIHN0YXJ0IHBhcnNpbmcgRFQgYW5kIGVuY291
bnRlciBmYWlsdXJlcywgaXQncyBnb2luZyB0byBiZSB2ZXJ5Cj4gY29uZnVzaW5nIGlmIHRoYXQn
cyBhdCBwYW5lbCBhdHRhY2ggdGltZSB3aGVyZSBjb2RlIHdpbGwgdXN1YWxseSBqdXN0Cj4gYXNz
dW1lIHRoYXQgZXZlcnl0aGluZyBpcyBhbHJlYWR5IHZhbGlkYXRlZCBhbmQgY2FuJ3QgZmFpbCBh
bnltb3JlLgo+Cj4gVGhpZXJyeQoKVGhhbmtzIGZvciB0aGUgcmV2aWV3Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
