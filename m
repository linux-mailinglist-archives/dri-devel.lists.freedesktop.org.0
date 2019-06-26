Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC783566C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC2B6E366;
	Wed, 26 Jun 2019 10:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9BE6E365;
 Wed, 26 Jun 2019 10:29:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 03:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="183112701"
Received: from ccrisan-mobl.ger.corp.intel.com (HELO [10.249.33.85])
 ([10.249.33.85])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2019 03:29:00 -0700
Subject: Re: [PULL] topic/remove-fbcon-notifiers for v5.3, fixes
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20190626084849epcas1p4d2f498599681bfe62d370c7bb48d4f74@epcas1p4.samsung.com>
 <7dd06ccb-7f8d-943b-bbc0-f4e58e041a23@linux.intel.com>
 <368e0db7-f970-aebb-6b17-88a646b4bbba@samsung.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <94640b12-edd5-4444-6a3f-c34d4d895457@linux.intel.com>
Date: Wed, 26 Jun 2019 12:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <368e0db7-f970-aebb-6b17-88a646b4bbba@samsung.com>
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
Cc: Sean Paul <sean@poorly.run>, dim-tools@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjYtMDYtMjAxOSBvbSAxMjowMyBzY2hyZWVmIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3o6
Cj4gSGksCj4KPiBPbiA2LzI2LzE5IDEwOjQ4IEFNLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToK
Pj4gSGkgYWxsLAo+Pgo+PiBUaGlzIGlzIHRoZSBmb2xsb3d1cCBwdWxsIHJlcXVlc3QgZm9yIHRo
ZSByZW1vdmUtZmJjb24tbm90aWZpZXJzIHRvcGljIGJyYW5jaC4KPj4gTm8gbWFqb3IgY2hhbmdl
cywganVzdCBhIGZldyBjb21waWxlIGZpeGVzLgo+Pgo+PiBUaGlzIHdpbGwgYmUgcHVsbGVkIGlu
dG8gZHJtLW1pc2MtbmV4dCwgYnV0IGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3IgdGhlIGZiZGV2IGFu
ZCBiYWNrbGlnaHQgdHJlZXMgdG9vLgo+IFB1bGxlZCBpbnRvIGZiZGV2LWZvci1uZXh0LCB0aGFu
a3MhCk5wLCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQtZml4ZXMgYXMgd2VsbC4KPj4gQ2hlZXJz
LAo+PiBNYWFydGVuCj4+Cj4+IHRvcGljL3JlbW92ZS1mYmNvbi1ub3RpZmllcnMtMjAxOS0wNi0y
NjoKPj4gLSBFeHBvcnQgZmJjb25fdXBkYXRlX3ZjcyB0byBmaXggc2hfbW9iaWxlX2xjZGNmYi5j
IGNvbXBpbGF0aW9uLgo+PiAtIFJlbHkgb24gZmJjb24gYmVpbmcgYnVpbHRpbiB3aGVuIHZnYXN3
aXRjaGVyb28gaXMgYnVpbHRpbi4KPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCAxZGNmZjRhZTY1MTg1ZThjMDMwMDk3MmY2ZDhkMzlkOWE5ZGIyYmRhOgo+Pgo+PiAgIGJhY2ts
aWdodDogc2ltcGxpZnkgbGNkIG5vdGlmaWVyICgyMDE5LTA1LTI4IDExOjAzOjA0ICswMjAwKQo+
Pgo+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4KPj4gICBnaXQ6
Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy90b3BpYy9yZW1vdmUt
ZmJjb24tbm90aWZpZXJzLTIwMTktMDYtMjYKPj4KPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDYxMTZiODkyYmQ0ZmQwZGRjNWYzMDU2NmE1NTYyMThiYjJlMWE5YjY6Cj4+Cj4+ICAg
dmdhX3N3aXRjaGVyb286IERlcGVuZCB1cG9uIGZiY29uIGJlaW5nIGJ1aWx0LWluLCBpZiBlbmFi
bGVkICgyMDE5LTA2LTI2IDEwOjM2OjQ5ICswMjAwKQo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IHRvcGljL3Jl
bW92ZS1mYmNvbi1ub3RpZmllcnM6Cj4+IC0gRXhwb3J0IGZiY29uX3VwZGF0ZV92Y3MgdG8gZml4
IHNoX21vYmlsZV9sY2RjZmIuYyBjb21waWxhdGlvbi4KPj4gLSBSZWx5IG9uIGZiY29uIGJlaW5n
IGJ1aWx0aW4gd2hlbiB2Z2Fzd2l0Y2hlcm9vIGlzIGJ1aWx0aW4uCj4+Cj4+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
RGFuaWVsIFZldHRlciAoMik6Cj4+ICAgICAgIGZiY29uOiBFeHBvcnQgZmJjb25fdXBkYXRlX3Zj
cwo+PiAgICAgICB2Z2Ffc3dpdGNoZXJvbzogRGVwZW5kIHVwb24gZmJjb24gYmVpbmcgYnVpbHQt
aW4sIGlmIGVuYWJsZWQKPj4KPj4gIGRyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnICAgICAgICAgIHwg
MSArCj4+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyB8IDEgKwo+PiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6Cj4gU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAo+IFNhbXN1
bmcgRWxlY3Ryb25pY3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
