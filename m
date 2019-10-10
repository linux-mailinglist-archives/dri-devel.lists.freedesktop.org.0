Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B33D2FAD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 19:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662C6E233;
	Thu, 10 Oct 2019 17:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDC46E233
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 17:36:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 10:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="200538447"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 10 Oct 2019 10:36:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2019 20:36:07 +0300
Date: Thu, 10 Oct 2019 20:36:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v4 2/3] drm/rockchip: Add optional support for CRTC gamma
 LUT
Message-ID: <20191010173607.GH1208@intel.com>
References: <20191008230038.24037-1-ezequiel@collabora.com>
 <20191008230038.24037-3-ezequiel@collabora.com>
 <20191009180136.GE85762@art_vandelay>
 <CAAEAJfDP0PsGAoRfGyDyWj7DxgP6nwwwA1_gwLQuVy-fRDa-UA@mail.gmail.com>
 <20191010160059.GJ85762@art_vandelay>
 <CAKb7UvhWWYcpmyMZgerdJiG=sZjQUBVkeEwev+PdYzBW6+xsbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvhWWYcpmyMZgerdJiG=sZjQUBVkeEwev+PdYzBW6+xsbQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTI6MjM6MDVQTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTI6MDEgUE0gU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+IHdyb3RlOgo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgdm9wX2NydGNfYXRvbWljX2No
ZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpCj4gPiA+ID4gPiAr
ewo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHZvcCAqdm9wID0gdG9fdm9wKGNydGMpOwo+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKHZvcC0+bHV0X3JlZ3MgJiYgY3J0Y19zdGF0ZS0+Y29s
b3JfbWdtdF9jaGFuZ2VkICYmCj4gPiA+ID4gPiArICAgICAgICAgY3J0Y19zdGF0ZS0+Z2FtbWFf
bHV0KSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZW47Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArICAgICAgICAgICAgIGxlbiA9IGRybV9jb2xvcl9sdXRfc2l6ZShjcnRj
X3N0YXRlLT5nYW1tYV9sdXQpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICBpZiAobGVuICE9IGNy
dGMtPmdhbW1hX3NpemUpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBEUk1fREVC
VUdfS01TKCJJbnZhbGlkIExVVCBzaXplOyBnb3QgJWQsIGV4cGVjdGVkICVkXG4iLAo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVuLCBjcnRjLT5nYW1tYV9z
aXplKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gT3ZlcmZsb3cgaXMgYXZvaWRl
ZCBpbiBkcm1fbW9kZV9nYW1tYV9zZXRfaW9jdGwoKSwgc28gSSBkb24ndCB0aGluayB5b3UgbmVl
ZAo+ID4gPiA+IHRoaXMgZnVuY3Rpb24uCj4gPiA+ID4KPiA+ID4KPiA+ID4gQnV0IHRoYXQgb25s
eSBhcHBsaWVzIHRvIHRoZSBsZWdhY3kgcGF0aC4gSXNuJ3QgdGhpcyBuZWVkZWQgdG8gZW5zdXJl
Cj4gPiA+IGEgZ2FtbWEgYmxvYgo+ID4gPiBoYXMgdGhlIHJpZ2h0IHNpemU/Cj4gPgo+ID4gWWVh
aCwgZ29vZCBwb2ludCwgd2UgY2hlY2sgdGhlIGVsZW1lbnQgc2l6ZSBpbiB0aGUgYXRvbWljIHBh
dGgsIGJ1dCBub3QgdGhlIG1heAo+ID4gc2l6ZS4gSSBoYXZlbid0IGxvb2tlZCBhdCBlbm91Z2gg
Y29sb3IgbHV0IHN0dWZmIHRvIGhhdmUgYW4gb3BpbmlvbiB3aGV0aGVyIHRoaXMKPiA+IGNoZWNr
IHdvdWxkIGJlIHVzZWZ1bCBpbiBhIGhlbHBlciBmdW5jdGlvbiBvciBub3QsIHNvbWV0aGluZyB0
byBjb25zaWRlciwgSQo+ID4gc3VwcG9zZS4KPiAKPiBTb21lIGltcGxlbWVudGF0aW9ucyBzdXBw
b3J0IG11bHRpcGxlIHNpemVzIChlLmcuIDI1NiBhbmQgMTAyNCkgYnV0Cj4gbm90IGFueXRoaW5n
IGluIGJldHdlZW4uIEl0IHdvdWxkIGJlIGRpZmZpY3VsdCB0byBleHBvc2UgdGhpcwo+IGdlbmVy
aWNhbGx5LCBJIHdvdWxkIGltYWdpbmUuCj4gVGhlIDI1NiBzaXplIGlzIGtpbmQgb2Ygc3BlY2lh
bCwgc2luY2UKPiBiYXNpY2FsbHkgYWxsIGxlZ2FjeSB1c2FnZSBhc3N1bWVzIHRoYXQgMjU2IGlz
IHRoZSBvbmUgdHJ1ZSBxdWFudGl0eQo+IG9mIExVVCBlbnRyaWVzLi4uCgpXaGF0IHdlIGRvIGN1
cnJlbnRseSBpbiBpOTE1IGlzOgpjcnRjLT5nYW1tYV9zaXplID0gMjU2CkdBTU1BX0xVVF9TSVpF
ID0gcGxhdGZvcm0gc3BlY2lmaWMgKDI1NiwgMTI5LCAyNTcsIDJeMTAsIG9yIDJeMTgrMSAobG9s
KSkKREVHQU1NQV9MVVRfU0laRSA9IHBsYXRmb3JtIHNwZWNpZmljICgwLCAzMywgNjUsIG9yIDJe
MTApCgppOTE1IHdpbGwgYWNjZXB0OgotIGdhbW1hIGx1dCBvZiBzaXplIDI1NiwgaWZmIGN0bT09
TlVMTCBhbmQgZGVnYW1tYT09TlVMTCAodGhlIHNvCiAgY2FsbGVkICJsZWdhY3kgZ2FtbWEiIG1v
ZGUpCi0gKGRlKWdhbW1hX2x1dCBvZiBzaXplIChERSlHQU1NQV9MVVRfU0laRSBpZiBpdCBwYXNz
ZXMgdGhlCiAgY2hlY2tzIGRvbmUgYnkgZHJtX2NvbG9yX2x1dF9jaGVjaygpCgpJZS4ganVzdCBv
bmUgb3IgdHdvIGdhbW1hIG1vZGVzIHBlciBwbGF0Zm9ybSBpcyBleHBvc2VkLiBBbmQgdGhhdCdz
CmFib3V0IGFsbCB3ZSBjYW4gZG8gd2l0aCB0aGUgY3VycmVudCB1YXBpIGV2ZW4gdGhvdWdoIG91
ciBoYXJkd2FyZQpzdXBwb3J0cyBtYW55IG1vcmUgbW9kZXMuCgpUaGUgcmVzdWx0aW5nIHByZWNp
c2lvbiwgaW50ZXJwb2xhdGlvbiB2cy4gdHJ1bmNhdGlvbiBiZWhhdmlvdXIsCmFuZCBoYW5kbGlu
ZyBvZiBvdXQgb2YgZ2FtdXQgdmFsdWVzIGFyZSBhbGwgdG90YWxseSB1bnNwZWNpZmllZAphbmQg
dXNlcnNwYWNlIGp1c3QgaGFzIHRvIG1ha2UgYSBndWVzcy4KCldlIGFsc28gY2hlYXQgd2l0aCB0
aGUgMl4xMCBzaXplZCBMVVRzIGEgYml0IGR1ZSB0byB0aGUgaHcgc2hhcmluZwp0aGUgc2FtZSBM
VVQgZm9yIGdhbW1hIGFuZCBkZWdhbW1hLCBhbmQgc28gaWYgeW91IGVuYWJsZSBib3RoIGF0CnRo
ZSBzYW1lIHRpbWUgd2UgdGhyb3cgYXdheSBldmVyeSBzZWNvbmQgZW50cnkgYW5kIGVhY2ggc3Rh
Z2UKb25seSBnZXRzIGEgMl45IGVudHJ5IExVVCBpbiB0aGUgZW5kLgoKT2ggYW5kIGZvciB0aGUg
Ml4xOCsxIG1vbnN0cm9zaXR5IHdlIGNoZWF0IGV2ZW4gbW9yZSBhbmQKdGhyb3cgYXdheSB+OTku
OCUgb2YgdGhlIGVudHJpZXMgOigKCgpUaGlzIGhlcmUgd2FzIG15IGlkZWEgZm9yIGV4dGVuZGlu
ZyB0aGUgdWFwaSBzbyB0aGF0IHdlCmNvdWxkIGV4cG9zZSB0aGUgZnVsbCBodyBjYXBhYmlsaXRp
ZXMgYW5kIGxldCB1c2Vyc3BhY2UKZGVjaWRlIHdoaWNoIG1vZGUgc3VpdHMgaXQgYmVzdCB3aXRo
b3V0IGhhdmluZyB0byBndWVzcwp3aGF0IGl0J2xsIGdldDoKaHR0cHM6Ly9naXRodWIuY29tL3Zz
eXJqYWxhL2xpbnV4L2NvbW1pdHMvZ2FtbWFfbW9kZV9wcm9wCgpNYXliZSBpbiBhIGZldyB5ZWFy
cyBJJ2xsIGZpbmQgdGltZSB0byBnZXQgYmFjayB0byBpdC4uLgoKLS0gClZpbGxlIFN5cmrDpGzD
pApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
