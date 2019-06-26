Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85121564B7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617416E32A;
	Wed, 26 Jun 2019 08:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E706E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:37:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 01:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="170006863"
Received: from ccrisan-mobl.ger.corp.intel.com (HELO [10.249.33.85])
 ([10.249.33.85])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2019 01:37:19 -0700
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
To: Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
 <20190626083541.GJ12905@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <68ca07a2-d130-e87b-0ad8-f17c5d15163d@linux.intel.com>
Date: Wed, 26 Jun 2019 10:37:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626083541.GJ12905@phenom.ffwll.local>
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
Cc: Sean Paul <sean@poorly.run>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjYtMDYtMjAxOSBvbSAxMDozNSBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gT24gTW9uLCBK
dW4gMjQsIDIwMTkgYXQgMTE6MjE6NTNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4g
Rml4ZXMgbGlua2luZyBmYWlsIHdoZW4gZmJjb24vZmJkZXYgaXMgbW9kdWxhciBhbmQgdmdhc3dp
dGNoZXJvbyBpcwo+PiBlbmFibGVkOgo+Pgo+PiB4ODZfNjQtbGludXgtZ251LWxkOiBkcml2ZXJz
L2dwdS92Z2EvdmdhX3N3aXRjaGVyb28ubzogaW4gZnVuY3Rpb24gYHZnYV9zd2l0Y2h0b19zdGFn
ZTInOgo+PiB2Z2Ffc3dpdGNoZXJvby5jOigudGV4dCsweDk5Nyk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYGZiY29uX3JlbWFwX2FsbCcKPj4KPj4gdjI6IEkgZmlyc3QgdHJpZWQgdG8gZml4IHRo
aXMgd2l0aCBhbiBFWFBPUlRfU1lNQk9MLCBidXQgdmdhX3N3aXRjaGVyb28gaXMKPj4gbmV2ZXIg
YSBtb2R1bGUsIHNvIHRoaXMgZG9lc24ndCB3b3JrLgo+Pgo+PiBSZXBvcnRlZC1ieTogU3RlcGhl
biBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4gRml4ZXM6IDFjZDUxYjVkMjAwZCAoInZnYXN3
aXRjaGVyb286IGNhbGwgZmJjb25fcmVtYXBfYWxsIGRpcmVjdGx5IikKPj4gQ2M6IFN0ZXBoZW4g
Um90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+PiBDYzogTHVrYXMgV3VubmVyIDxsdWth
c0B3dW5uZXIuZGU+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4gQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
Pgo+PiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4+IENjOiBCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4+IENjOiBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+PiBDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1h
aWwuY29tPgo+PiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4+IENjOiBEYW5pZWwg
VGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+PiBDYzogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+Cj4+IC0tCj4+IHdydCBtZXJn
aW5nIHByb2JhYmx5IGJlc3QgaWYgTWFhcnRlbiBhZGRzIHRoaXMgdG8gdGhlIHRvcGljIGJyYW5j
aCB3ZQo+PiBoYXZlIGFscmVhZHkgYW5kIHNlbmRzIG91dCBhbiB1cGRhdGVkIHB1bGwgcmVxdWVz
dC4KPj4KPj4gQXBvbG9naWVzIGZvciB0aGUgbWVzcy4KPj4gLURhbmllbAo+PiAtLS0KPj4gIGRy
aXZlcnMvZ3B1L3ZnYS9LY29uZmlnIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnIGIvZHJpdmVy
cy9ncHUvdmdhL0tjb25maWcKPj4gaW5kZXggODRhYjQ4MmQwZGI2Li5jOGM3NzBiMDVlZDkgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L3ZnYS9LY29uZmlnCj4+IEBAIC0yMyw2ICsyMyw3IEBAIGNvbmZpZyBWR0FfU1dJVENIRVJPTwo+
PiAgCWRlcGVuZHMgb24gWDg2Cj4+ICAJZGVwZW5kcyBvbiBBQ1BJCj4+ICAJZGVwZW5kcyBvbiBQ
Q0kKPj4gKwlkZXBlbmRzIG9uIChGUkFNRUJVRkZFUl9DT05TT0xFPW4gfHwgRkI9eSkKPj4gIAlz
ZWxlY3QgVkdBX0FSQgo+PiAgCWhlbHAKPj4gIAkgIE1hbnkgbGFwdG9wcyByZWxlYXNlZCBpbiAy
MDA4LzkvMTAgaGF2ZSB0d28gR1BVcyB3aXRoIGEgbXVsdGlwbGV4ZXIKPj4gLS0gCj4+IDIuMjAu
MQo+PgpUaGFua3MsIHB1c2hlZC4gOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
