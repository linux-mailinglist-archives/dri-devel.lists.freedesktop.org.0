Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6410E9D2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88DB89E26;
	Mon,  2 Dec 2019 11:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136689C1B;
 Mon,  2 Dec 2019 11:53:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 03:53:13 -0800
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="204529220"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 03:53:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] drm/i915/vlv_dsi: Control panel and backlight enable
 GPIOs on BYT
In-Reply-To: <CACRpkdbRb-LF2tNN-ueo=tKuJc+u4B7Y20+BCyqnN7wYbm8y7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191129185836.2789-1-hdegoede@redhat.com>
 <20191129185836.2789-3-hdegoede@redhat.com>
 <CACRpkdbRb-LF2tNN-ueo=tKuJc+u4B7Y20+BCyqnN7wYbm8y7Q@mail.gmail.com>
Date: Mon, 02 Dec 2019 13:53:04 +0200
Message-ID: <87wobfj65b.fsf@intel.com>
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
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMiBEZWMgMjAxOSwgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPiB3cm90ZToKPiBIaSBIYW5zLAo+Cj4gdGhhbmsgeW91IGZvciB5b3VyIHBhdGNoIQo+Cj4g
T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgNzo1OCBQTSBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+PiAtICAgICAgIC8qIEdQSU8gRGVzYyBmb3IgQ1JDIGJhc2Vk
IFBhbmVsIGNvbnRyb2wgKi8KPj4gKyAgICAgICAvKiBHUElPIERlc2MgZm9yIHBhbmVsIGFuZCBi
YWNrbGlnaHQgY29udHJvbCAqLwo+PiAgICAgICAgIHN0cnVjdCBncGlvX2Rlc2MgKmdwaW9fcGFu
ZWw7Cj4+ICsgICAgICAgc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb19iYWNrbGlnaHQ7Cj4KPiBJIHRo
aW5rIHdoYXQgaGFwcGVucyBoZXJlIGlzIHRoYXQgeW91IHJlaW1wbGVtZW50Cj4gZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+Cj4gVGhlIGV4aXN0aW5nIHBvd2VyIGNv
bnRyb2wgR1BJTyBhbHNvIHJlaW1wbGVtZW50cwo+IGRyaXZlcnMvcmVndWxhdG9yL2ZpeGVkLmMg
aW4gYSBzZW5zZSBidXQgSSBhbSB1bmRlciB0aGUKPiBpbXByZXNzaW9uIHRoYXQgeDg2IGluIGdl
bmVyYWwgYW5kIEFDUEkgaW4gcGFydGljdWxhcgo+IGhhcyBhIHByb2JsZW0gd2l0aCB0aGUgcmVn
dWxhdG9yIHN1YnN5c3RlbSBzbyBJIGFtCj4gdW5jZXJ0YWluIGFib3V0IHRoYXQgb25lLgo+Cj4g
V2hlbiBJIGxvb2sgYXQgdGhlIGNvZGUgSSBnZXQgbW9yZSBjb25mdXNlZCBiZWNhdXNlCj4gbm9t
aW5hbGx5IHBhbmVscyBzaG91bGQgaGF2ZSB0aGVpciBvd24gZHJpdmVycyBpbgo+IGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC8qIGVzcGVjaWFsbHkgRFNJIHBhbmVscywgYW5kIHRoZQo+IHBhbmVscyBj
b250cm9sIHRoZWlyIG93biBHUElPcyBvciByZWd1bGF0b3JzIGZvciBwb3dlcgo+IGFuZCBiYWNr
bGlnaHQuCj4KPiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IEhlaWtraSdzIGFuZCBE
bWl0cnkncwo+IHJlY2VudCBhZGRpdGlvbnMgdG8gc29mdHdhcmUgbm9kZXMgd291bGQgbWFrZSBp
dAo+IHBvc3NpYmxlIHRvIGFjdHVhbGx5IHNwYXduIGRldmljZXMgbGlrZSB0aGUgR1BJTyBiYWNr
bGlnaHQKPiBhbmQvb3IgZml4ZWQgcmVndWxhdG9yIGFuZCBwdXQgcmVmZXJlbmNlcyB0byB0aGVt
IHNvCj4gdGhhdCB0aGUgZHJpdmVycyBjYW4gcGljayB0aGVtIHVwIGZyb20gdGhlIHJlc3BlY3Rp
dmUKPiBmcmFtZXdvcmtzIGFuZCBtYW5hZ2UgdGhlbT8KPgo+IE1heWJlIEkgbWlzdW5kZXJzdG9v
ZCB0aGluZ3MgaGVyZSB0aG91Z2gsIEkgYW0gYSBiaXQKPiB1bmRlciB0aGUgaW1wcmVzc2lvbiB0
aGF0IGVsZGVyIERSTSBkcml2ZXJzIGFyZQo+IGNvbnNpZGVyZWQgImVsZGVyIGdvZHMiIGFuZCBk
byBub3QgbmVlZCB0byB1c2Ugc2VwYXJhdGUKPiBwYW5lbCBkcml2ZXJzLCBiYWNrbGlnaHQgYWJz
dHJhY3Rpb24gZXRjLCBhbmQgaW4gdGhhdAo+IGNhc2UganVzdCBnbyBhaGVhZCwgSSBndWVzcy4K
Pgo+IEJ1dCBJIHN1c3BlY3Qgc29tZSBzZXBhcmF0aW9uCj4gd291bGQgaGVscCB0aGUgZGF5IHRo
ZSBpOTE1IGRyaXZlciB3YW50cyB0byByZXVzZSBzb21lCj4gcmVhbGx5IGNvbXBsZXggRFNJIHBh
bmVsIGZyb20gZHJpdmVycy9ncHUvZHJtL3BhbmVsLyoKPiB0aG91Z2guCgpTYWRseSBJIGRvbid0
IHRoaW5rIHRoYXQncyBnb2luZyB0byBoYXBwZW4sIHRob3VnaC4KCkZvciBpOTE1IHRoZSBwYW5l
bHMgYXJlIGRlc2NyaWJlZCBieSBWQlQsIG9yIFZpZGVvIEJJT1MgVGFibGVzLiBXZSBkb24ndApy
ZWFsbHkga25vdyB0aGUgbWFrZSBvciBtb2RlbCBvZiB0aGUgcGFuZWxzLCB3ZSBqdXN0IGdldCB0
aGUgdGltaW5ncyBhbmQKc2VxdWVuY2VzIGV0Yy4gZnJvbSB0aGVyZS4gVGhlcmUncyBubyBpbmZv
IHRvIHByb2JlIGEgc2VwYXJhdGUgcGFuZWwKZHJpdmVyLiBTbyB3ZSBqdXN0IGhhdmUgYSAiZ2Vu
ZXJpYyIgRFNJIGRyaXZlciB0aGF0J3MgcGFydCBvZiBpOTE1IHdoaWNoCnVzZXMgdGhlIGRhdGEg
ZnJvbSB0aGUgVkJUIHRvIGRyaXZlIGFsbCB0aGUgcG9zc2libGUgcGFuZWxzLgoKV2UgZG8gdXNl
IHNvbWUgb2YgdGhlIGRybSBEU0kgZnJhbWV3b3JrIGFzIGEgbGlicmFyeSB0byBhYnN0cmFjdCB0
aGluZ3MKYSBiaXQgYmV0dGVyLCBidXQgdGhhdCdzIGFib3V0IGl0LgoKVGhlIHNlcXVlbmNlcyBz
aG91bGQgaW5jbHVkZSBkZXRhaWxzIGFib3V0IEdQSU9zIHRvIHRvZ2dsZSBhcyB3ZWxsLCBzbwpp
biB0aGF0IHNlbnNlIEkgZmVlbCBsaWtlIHRoZSBncGlvIGNhbGxzIHNob3VsZCBiZSBib2x0ZWQg
dGhlcmUuCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdy
YXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
