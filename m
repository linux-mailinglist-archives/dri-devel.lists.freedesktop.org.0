Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9D8346A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 16:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5D36E3B4;
	Tue,  6 Aug 2019 14:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC5589FE6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 14:55:27 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id r6so93164871oti.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 07:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1wQqVstczFn++5DzOIT2o7argRTfdt2L2xsiHbx79GM=;
 b=oNl/lRLqrTEFXHcBM4gbrBS4Hq7youwcirGBgDqZ5bmriabWg76Fx67asr6uDB+58L
 seZ5VS0R8l+zgFF9RRoc5lp5lL/3nC1tRB6JZK2Hiv33jk2zEuDOyh6kfPPkM6RNtsFx
 FC4BYXXRVgpWNVFdZ2Jl02nWwcQxs+mYP3eBqjfko52C7bQ6SEF2tITH9GkKx3ccGxAe
 2+G9WQC/Insskkf5h7zNDvLVXkGkBI/hGLPuQNNqb6R7jmRiXdQ0Myw5zciBjXsdUZ+i
 zucrb7yeThF2RhcahZPMoXrMzTM4xutldg0fjrJ3AG/L7A1rWIXQg5mGMrKqvolInWvE
 4isg==
X-Gm-Message-State: APjAAAUZTRcypn0uyphsoB47tZxxEjFLnAiJ5fFFgQUN9VFSTf8nawW7
 wp8NxPcUF4ODW0xbf0nVsLuwznYa1RFrdHgVYdJrjg==
X-Google-Smtp-Source: APXvYqzS/bC25EeK7aZEtWci7VR8JAi9iFnkZaNIEPuJvjfDL5wFsg7vnonFJviTwtSGK2EERu2dyQ+2qVC2MVZnQn8=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr3751004oth.281.1565103326439; 
 Tue, 06 Aug 2019 07:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
 <CAL_Jsq+h9m9yjSOQ-q6PVmzzjLL=2h6m8WxMhgSfYNdp-bZm7Q@mail.gmail.com>
In-Reply-To: <CAL_Jsq+h9m9yjSOQ-q6PVmzzjLL=2h6m8WxMhgSfYNdp-bZm7Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Aug 2019 16:55:14 +0200
Message-ID: <CAKMK7uFFO=pg-8wv64F4Or8xKL-768LcDVue3MuDjTCO2cGh3w@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1wQqVstczFn++5DzOIT2o7argRTfdt2L2xsiHbx79GM=;
 b=KzkO5ge5ufV8QuxKJ7LzsTwn9hlcvgnb60ai2R6YIcVFd28PfFXFgXqe+vGDcC58VP
 fLl43STB8SbtnHTLybmMn8GhGIxzt5LdB92lOmxp1E0LQrPmdkvDMdP0g7IVO8hxIU5S
 ETR3JwmmiTsNQG2WxVwzVmJjA7hLalnc6MXUM=
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA0OjI1IFBNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjM0IEFNIERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDYs
IDIwMTkgYXQgMjozNCBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBTYXQsIDMgQXVnIDIwMTkgYXQgMjA6NDcsIE1heGltZSBSaXBhcmQgPG1h
eGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgRGFuaWVs
LCBEYXZlLAo+ID4gPiA+Cj4gPiA+ID4gSGVyZSBpcyB0aGUgZmlyc3QgKGFuZCBwcmV0dHkgbGF0
ZSkgZHJtLW1pc2MtbmV4dCBQUi4KPiA+ID4gPgo+ID4gPiA+IEl0J3MgcHJldHR5IGJpZyBkdWUg
dG8gdGhlIGxhdGVuZXNzLCBidXQgdGhlcmUncyBub3RoaW5nIHJlYWxseSBtYWpvcgo+ID4gPiA+
IHNob3dpbmcgdXAuIEl0J3MgcHJldHR5IG11Y2ggdGhlIHVzdWFsIGJ1bmNoIG9mIHJld29ya3Ms
IGZpeGVzLCBhbmQKPiA+ID4gPiBuZXcgaGVscGVycyBiZWluZyBpbnRyb2R1Y2VkLgo+ID4gPiA+
Cj4gPiA+Cj4gPiA+IGRpbTogNDE1ZDJlOWUwNzU3ICgiUmV2ZXJ0ICJkcm0vZ2VtOiBSZW5hbWUg
ZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKQo+ID4gPiB0byBkcm1fZ2VtX21hcF9vZmZzZXQoKSIi
KTogbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4gPiBkaW06IGJlODU1MzgyYmFjYiAoIlJl
dmVydCAiZHJtL3BhbmZyb3N0OiBVc2UgZHJtX2dlbV9tYXBfb2Zmc2V0KCkiIik6Cj4gPiA+IG1h
bmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gZGltOiBlNGVlZTkzZDI1NzcgKCJkcm0vdmdl
bTogZHJvcCBEUk1fQVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiKToKPiA+ID4gbWFuZGF0b3J5
IHJldmlldyBtaXNzaW5nLgo+ID4gPiBkaW06IDg4MjA5ZDJjNTAzNSAoImRybS9tc206IGRyb3Ag
RFJNX0FVVEggdXNhZ2UgZnJvbSB0aGUgZHJpdmVyIik6Cj4gPiA+IG1hbmRhdG9yeSByZXZpZXcg
bWlzc2luZy4KPiA+ID4gZGltOiBjY2RhZTQyNTc1NjkgKCJkcm0vbm91dmVhdTogcmVtb3ZlIG9w
ZW4tY29kZWQgZHJtX2ludmFsaWRfb3AoKSIpOgo+ID4gPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3Np
bmcuCj4gPiA+Cj4gPiA+IFByZXR0eSBzdXJlIHJldmlldyBpbiBkcm0tbWlzYy1uZXh0IGlzIGEg
cnVsZS4gSSBkb24ndCBldmVuIHNlZSBhY2tzCj4gPiA+IG9uIG1vc3Qgb2YgdGhlc2UuCj4gPgo+
ID4gWWVzLiBJIGd1ZXNzIGZvciByZXZlcnRzIGl0J3Mgbm90IGNvb2wsIGJ1dCBhbHNvIG5vdCB0
aGUgd29yc3QuIFN0aWxsCj4gPiBiZXR0ZXIgdG8gZ2V0IHNvbWVvbmUgdG8gYWNrLCBoZWNrIEkg
Y2FuIHB1bGwgdGhhdCBvZmYgZm9yIGVtZXJnZW5jeQo+ID4gcmV2ZXJ0cyB3aXRoIGEgZmV3IHBp
bmdzIG9uIGlyYywgYW5kIHRoZSAyIHJldmVydHMgbGFuZGVkIG11Y2ggbGF0ZXIuCj4gPiBCdXQg
Zm9yIG5vcm1hbCBwYXRjaGVzIGl0J3MgZGVmaW5pdGVseSBub3Qgb2sgYXQgYWxsLiBBbHNvIG9u
bHkKPiA+IHBvc3NpYmxlIGlmIHBlb3BsZSBieXBhc3MgdGhlIHRvb2xpbmcsIG9yIG92ZXJyaWRl
IHRoZSB0b29saW5nIHdpdGgKPiA+IHRoZSAtZiBmbGFnIHRvIGZvcmNlIGEgcHVzaC4KPiA+Cj4g
PiBSb2IsIEVtaWwsIHdoYXQncyB1cCBoZXJlPwo+Cj4gSSBjb21taXR0ZWQgdGhlIGNoYW5nZXMs
IHRoZXkgdHVybmVkIG91dCB0byBjbGVhcmx5IGJyZWFrIHRoaW5ncyBhbmQKPiBub3QgYmUgZml4
YWJsZSBpbiBhbnkgd2F5LiBJIHNhaWQgSSB3YXMgZ29pbmcgdG8gcmV2ZXJ0IHRoZW1bMV0gaW4K
PiByZXBseSB0byB0aGUgb3JpZ2luYWwsIGdvdCBubyByZXBseSwgYW5kIHNvIEkgcmV2ZXJ0ZWQg
dGhlbS4gU2VlbWVkCj4gc3VmZmljaWVudCB0byBtZSwgYnV0IG5leHQgdGltZSBJJ2xsIGtlZXAg
dGhlIHRvb2wgaGFwcHkuCgpHZW5lcmFsbHkgc3VibWl0dGluZyB0aGUgZnVsbCByZXZlcnQgYW5k
IHRoZW4gZ29pbmcgYWNrLXNob3BwaW5nIG9uCmlyYyB5b3UgY2FuIGxhbmQgcmV2ZXJ0cyB3aXRo
aW4gYSBmZXcgaG91cnMgdG9wcy4gU2VlaW5nIGEgcGF0Y2ggd2l0aAp0aGUgZHJlYWRlZCAiUmV2
ZXJ0IiBzdWJqZWN0IGdldHMgcGVvcGxlIGdvaW5nIGEgbG90IG1vcmUgdGhhbiBhIHJlcGx5Cmlu
IHNvbWUgb2xkIHRocmVhZCBzb21ld2hlcmUsIHdoaWNoIGlzIGVhc2lseSBvdmVybG9va2VkLgot
RGFuaWVsCgo+Cj4gUm9iCj4KPiBbMV0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJj
aGl2ZXMvZHJpLWRldmVsLzIwMTktSnVseS8yMjUwOTIuaHRtbAoKCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcg
NDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
