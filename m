Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B450B75
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A8189354;
	Mon, 24 Jun 2019 13:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BED089354
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:07:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 06:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,412,1557212400"; d="scan'208";a="155156773"
Received: from agusev-mobl1.ger.corp.intel.com (HELO [10.252.34.77])
 ([10.252.34.77])
 by orsmga008.jf.intel.com with ESMTP; 24 Jun 2019 06:07:27 -0700
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <8cb8c728-3ace-04e0-f6d5-215ffd7879c9@linux.intel.com>
Date: Mon, 24 Jun 2019 15:07:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-fbdev@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjQtMDYtMjAxOSBvbSAxMToyMSBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gRml4ZXMgbGlu
a2luZyBmYWlsIHdoZW4gZmJjb24vZmJkZXYgaXMgbW9kdWxhciBhbmQgdmdhc3dpdGNoZXJvbyBp
cwo+IGVuYWJsZWQ6Cj4KPiB4ODZfNjQtbGludXgtZ251LWxkOiBkcml2ZXJzL2dwdS92Z2Evdmdh
X3N3aXRjaGVyb28ubzogaW4gZnVuY3Rpb24gYHZnYV9zd2l0Y2h0b19zdGFnZTInOgo+IHZnYV9z
d2l0Y2hlcm9vLmM6KC50ZXh0KzB4OTk3KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZmJjb25f
cmVtYXBfYWxsJwo+Cj4gdjI6IEkgZmlyc3QgdHJpZWQgdG8gZml4IHRoaXMgd2l0aCBhbiBFWFBP
UlRfU1lNQk9MLCBidXQgdmdhX3N3aXRjaGVyb28gaXMKPiBuZXZlciBhIG1vZHVsZSwgc28gdGhp
cyBkb2Vzbid0IHdvcmsuCj4KPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+Cj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPgo+IEZpeGVzOiAxY2Q1MWI1ZDIwMGQgKCJ2Z2Fzd2l0Y2hlcm9vOiBjYWxsIGZiY29u
X3JlbWFwX2FsbCBkaXJlY3RseSIpCj4gQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1
dWcub3JnLmF1Pgo+IENjOiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgo+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ft
c3VuZy5jb20+Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gQ2M6
IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4KPiBDYzogbGludXgtZmJkZXZAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5v
cmc+Cj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3Jn
Cj4gLS0KPiB3cnQgbWVyZ2luZyBwcm9iYWJseSBiZXN0IGlmIE1hYXJ0ZW4gYWRkcyB0aGlzIHRv
IHRoZSB0b3BpYyBicmFuY2ggd2UKPiBoYXZlIGFscmVhZHkgYW5kIHNlbmRzIG91dCBhbiB1cGRh
dGVkIHB1bGwgcmVxdWVzdC4KPgo+IEFwb2xvZ2llcyBmb3IgdGhlIG1lc3MuCj4gLURhbmllbAo+
IC0tLQo+ICBkcml2ZXJzL2dwdS92Z2EvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS92Z2EvS2NvbmZpZyBi
L2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnCj4gaW5kZXggODRhYjQ4MmQwZGI2Li5jOGM3NzBiMDVl
ZDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvdmdhL0tjb25maWcKPiArKysgYi9kcml2ZXJz
L2dwdS92Z2EvS2NvbmZpZwo+IEBAIC0yMyw2ICsyMyw3IEBAIGNvbmZpZyBWR0FfU1dJVENIRVJP
Two+ICAJZGVwZW5kcyBvbiBYODYKPiAgCWRlcGVuZHMgb24gQUNQSQo+ICAJZGVwZW5kcyBvbiBQ
Q0kKPiArCWRlcGVuZHMgb24gKEZSQU1FQlVGRkVSX0NPTlNPTEU9biB8fCBGQj15KQo+ICAJc2Vs
ZWN0IFZHQV9BUkIKPiAgCWhlbHAKPiAgCSAgTWFueSBsYXB0b3BzIHJlbGVhc2VkIGluIDIwMDgv
OS8xMCBoYXZlIHR3byBHUFVzIHdpdGggYSBtdWx0aXBsZXhlcgoKSW4gYSBkZWZhdWx0IGFsbG1v
ZGNvbmZpZyB3ZSBkaXNhYmxlIHZnYXN3aXRjaGVyb28gdGhlbi4gTm90IHN1cmUgaXQncyBhbiBp
c3N1ZS4gSnVzdCB3b3J0aCBub3RpbmcuIDopCgp+TWFhcnRlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
