Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54657564AE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDC86E32C;
	Wed, 26 Jun 2019 08:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8236E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:34:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 01:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="170006475"
Received: from ccrisan-mobl.ger.corp.intel.com (HELO [10.249.33.85])
 ([10.249.33.85])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2019 01:34:16 -0700
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
 <8cb8c728-3ace-04e0-f6d5-215ffd7879c9@linux.intel.com>
 <20190624140321.GP12905@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <53b6572f-520e-2dcb-f761-71ee7163e286@linux.intel.com>
Date: Wed, 26 Jun 2019 10:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624140321.GP12905@phenom.ffwll.local>
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
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjQtMDYtMjAxOSBvbSAxNjowMyBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gT24gTW9uLCBK
dW4gMjQsIDIwMTkgYXQgMDM6MDc6MjZQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4+IE9wIDI0LTA2LTIwMTkgb20gMTE6MjEgc2NocmVlZiBEYW5pZWwgVmV0dGVyOgo+Pj4gRml4
ZXMgbGlua2luZyBmYWlsIHdoZW4gZmJjb24vZmJkZXYgaXMgbW9kdWxhciBhbmQgdmdhc3dpdGNo
ZXJvbyBpcwo+Pj4gZW5hYmxlZDoKPj4+Cj4+PiB4ODZfNjQtbGludXgtZ251LWxkOiBkcml2ZXJz
L2dwdS92Z2EvdmdhX3N3aXRjaGVyb28ubzogaW4gZnVuY3Rpb24gYHZnYV9zd2l0Y2h0b19zdGFn
ZTInOgo+Pj4gdmdhX3N3aXRjaGVyb28uYzooLnRleHQrMHg5OTcpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBmYmNvbl9yZW1hcF9hbGwnCj4+Pgo+Pj4gdjI6IEkgZmlyc3QgdHJpZWQgdG8gZml4
IHRoaXMgd2l0aCBhbiBFWFBPUlRfU1lNQk9MLCBidXQgdmdhX3N3aXRjaGVyb28gaXMKPj4+IG5l
dmVyIGEgbW9kdWxlLCBzbyB0aGlzIGRvZXNuJ3Qgd29yay4KPj4+Cj4+PiBSZXBvcnRlZC1ieTog
U3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4+PiBSZXBvcnRlZC1ieTog
a2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+PiBGaXhlczogMWNkNTFiNWQyMDBk
ICgidmdhc3dpdGNoZXJvbzogY2FsbCBmYmNvbl9yZW1hcF9hbGwgZGlyZWN0bHkiKQo+Pj4gQ2M6
IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+Pj4gQ2M6IEx1a2FzIFd1
bm5lciA8bHVrYXNAd3VubmVyLmRlPgo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgo+Pj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+Pj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPj4+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+PiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KPj4+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPj4+
IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+
Cj4+PiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPj4+IENjOiBZaXNo
ZW5nIFhpZSA8eXN4aWVAZm94bWFpbC5jb20+Cj4+PiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJu
ZWwub3JnCj4+PiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9y
Zz4KPj4+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+Pj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcKPj4+IC0tCj4+PiB3cnQgbWVyZ2luZyBwcm9iYWJseSBiZXN0IGlmIE1hYXJ0ZW4gYWRk
cyB0aGlzIHRvIHRoZSB0b3BpYyBicmFuY2ggd2UKPj4+IGhhdmUgYWxyZWFkeSBhbmQgc2VuZHMg
b3V0IGFuIHVwZGF0ZWQgcHVsbCByZXF1ZXN0Lgo+Pj4KPj4+IEFwb2xvZ2llcyBmb3IgdGhlIG1l
c3MuCj4+PiAtRGFuaWVsCj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS92Z2EvS2NvbmZpZyB8IDEg
Kwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS92Z2EvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnCj4+PiBp
bmRleCA4NGFiNDgyZDBkYjYuLmM4Yzc3MGIwNWVkOSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L3ZnYS9LY29uZmlnCj4+PiArKysgYi9kcml2ZXJzL2dwdS92Z2EvS2NvbmZpZwo+Pj4gQEAg
LTIzLDYgKzIzLDcgQEAgY29uZmlnIFZHQV9TV0lUQ0hFUk9PCj4+PiAgCWRlcGVuZHMgb24gWDg2
Cj4+PiAgCWRlcGVuZHMgb24gQUNQSQo+Pj4gIAlkZXBlbmRzIG9uIFBDSQo+Pj4gKwlkZXBlbmRz
IG9uIChGUkFNRUJVRkZFUl9DT05TT0xFPW4gfHwgRkI9eSkKPj4+ICAJc2VsZWN0IFZHQV9BUkIK
Pj4+ICAJaGVscAo+Pj4gIAkgIE1hbnkgbGFwdG9wcyByZWxlYXNlZCBpbiAyMDA4LzkvMTAgaGF2
ZSB0d28gR1BVcyB3aXRoIGEgbXVsdGlwbGV4ZXIKPj4gSW4gYSBkZWZhdWx0IGFsbG1vZGNvbmZp
ZyB3ZSBkaXNhYmxlIHZnYXN3aXRjaGVyb28gdGhlbi4gTm90IHN1cmUgaXQncyBhbiBpc3N1ZS4g
SnVzdCB3b3J0aCBub3RpbmcuIDopCj4gSWYgeW91IGhhdmVuJ3QgYXBwbGllZCB5ZXQsIG1pZ2h0
IGJlIGdvb2QgdG8gYWRkIHRoYXQgbm90ZSB0byB0aGUgY29tbWl0Cj4gbWVzc2FnZSB3aGVuIHlv
dSBtZXJnZS4KPgo+IFRoYW5rcywgRGFuaWVsCgpUaGFua3MsIHB1c2hlZC4gOikKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
