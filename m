Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807BEC64E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 17:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36316F834;
	Fri,  1 Nov 2019 16:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EDA6F834
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 16:00:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 09:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="351986851"
Received: from cepartan-mobl3.ger.corp.intel.com (HELO [10.249.40.248])
 ([10.249.40.248])
 by orsmga004.jf.intel.com with ESMTP; 01 Nov 2019 09:00:34 -0700
Subject: Re: [PATCH] drm/atomic: swap_state should stall on cleanup_done
To: Rob Clark <robdclark@gmail.com>
References: <20191031223641.19208-1-robdclark@gmail.com>
 <7b97af56-be9b-ed2e-f692-36433a889d6e@linux.intel.com>
 <CAF6AEGs9CwDLv7O4ymvTsK1+Bjopy8Q+DzOqqfeW9jM=n5beUQ@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <21c3ce89-6920-d801-f6d4-a22a963cdc7b@linux.intel.com>
Date: Fri, 1 Nov 2019 17:00:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGs9CwDLv7O4ymvTsK1+Bjopy8Q+DzOqqfeW9jM=n5beUQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMDEtMTEtMjAxOSBvbSAxNTo1OSBzY2hyZWVmIFJvYiBDbGFyazoKPiBPbiBGcmksIE5vdiAx
LCAyMDE5IGF0IDc6NDcgQU0gTWFhcnRlbiBMYW5raG9yc3QKPiA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPj4gT3AgMzEtMTAtMjAxOSBvbSAyMzozNiBzY2hyZWVm
IFJvYiBDbGFyazoKPj4+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
Pj4+Cj4+PiBTdGFsbGluZyBvbiBjbGVhbnVwX2RvbmUgZW5zdXJlcyB0aGF0IGFueSBhdG9taWMg
c3RhdGUgcmVsYXRlZCB0byBhCj4+PiBub25ibG9jayBjb21taXQgbm8gbG9uZ2VyIGhhcyBkYW5n
bGluZyByZWZlcmVuY2VzIHRvIHBlci1vYmplY3Qgc3RhdGUKPj4+IHRoYXQgY2FuIGJlIGZyZWVk
Lgo+Pj4KPj4+IE90aGVyd2lzZSwgaWYgYSAhbm9uYmxvY2sgY29tbWl0IGNvbXBsZXRlcyBhZnRl
ciBhIG5vbmJsb2NrIGNvbW1pdCBoYXMKPj4+IHN3YXBwZWQgc3RhdGUgKGllLiB0aGUgc3luY2hy
b25vdXMgcGFydCBvZiB0aGUgbm9uYmxvY2sgY29tbWl0IGNvbWVzCj4+PiBiZWZvcmUgdGhlICFu
b25ibG9jayBjb21taXQpLCBidXQgYmVmb3JlIHRoZSBhc3luY2hyb25vdXMgcGFydCBvZiB0aGUK
Pj4+IG5vbmJsb2NrIGNvbW1pdCBjb21wbGV0ZXMsIHdoYXQgd2FzIHRoZSBuZXcgcGVyLW9iamVj
dCBzdGF0ZSBpbiB0aGUKPj4+IG5vbmJsb2NrIGNvbW1pdCBjYW4gYmUgZnJlZWQuCj4+Pgo+Pj4g
VGhpcyBzaG93cyB1cCB3aXRoIHRoZSBuZXcgc2VsZi1yZWZyZXNoIGhlbHBlciwgYXMgX3VwZGF0
ZV9hdmdfdGltZXMoKQo+Pj4gZGVyZWZlcmVuY2VzIHRoZSBvcmlnaW5hbCBvbGQgYW5kIG5ldyBj
cnRjX3N0YXRlLgo+Pj4KPj4+IEZpeGVzOiBkNGRhNGUzMzM0MWMgKCJkcm06IE1lYXN1cmUgU2Vs
ZiBSZWZyZXNoIEVudHJ5L0V4aXQgdGltZXMgdG8gYXZvaWQgdGhyYXNoaW5nIikKPj4+IENjOiBT
ZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IFJvYiBD
bGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPj4+IC0tLQo+Pj4gT3RoZXIgcG9zc2liaWxp
dGllczoKPj4+IDEpIG1heWJlIGJsb2NrIGxhdGVyIGJlZm9yZSBmcmVlaW5nIGF0b21pYyBzdGF0
ZT8KPj4+IDIpIHJlZmNvdW50IGluZGl2aWR1YWwgcGVyLW9iamVjdCBzdGF0ZQo+Pj4KPj4+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDYgKysrLS0tCj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYwo+Pj4gaW5kZXggM2VmMmFjNTJjZTk0Li5hNWQ5NTQyOWY5
MWIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPj4+IEBAIC0yNzEx
LDcgKzI3MTEsNyBAQCBpbnQgZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0ZShzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqc3RhdGUsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFjb21t
aXQpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+Cj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl9pbnRlcnJ1cHRp
YmxlKCZjb21taXQtPmh3X2RvbmUpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IHdh
aXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZSgmY29tbWl0LT5jbGVhbnVwX2RvbmUpOwo+
Pj4gICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gICAgICAgICAgICAgICB9Cj4+PiBAQCAtMjcyMiw3
ICsyNzIyLDcgQEAgaW50IGRybV9hdG9taWNfaGVscGVyX3N3YXBfc3RhdGUoc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGlmICghY29tbWl0
KQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+Pgo+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJs
ZSgmY29tbWl0LT5od19kb25lKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSB3YWl0
X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUoJmNvbW1pdC0+Y2xlYW51cF9kb25lKTsKPj4+
ICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPj4+ICAgICAgICAgICAgICAgfQo+Pj4gQEAgLTI3MzMsNyAr
MjczMyw3IEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9zd2FwX3N0YXRlKHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSwKPj4+ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNvbW1pdCkK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4KPj4+IC0gICAg
ICAgICAgICAgICAgICAgICByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUo
JmNvbW1pdC0+aHdfZG9uZSk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gd2FpdF9m
b3JfY29tcGxldGlvbl9pbnRlcnJ1cHRpYmxlKCZjb21taXQtPmNsZWFudXBfZG9uZSk7Cj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4+PiAgICAgICAgICAgICAgIH0KPj4gTmFjaywgaHdfZG9uZSBt
ZWFucyBhbGwgbmV3X2NydGNfc3RhdGUgKGZyb20gdGhlIG9sZCBjb21taXQgcG92KSBkZXJlZmVy
ZW5jZXMgYXJlIGRvbmUuCj4+Cj4gaG1tLCBpdCB3b3VsZCBiZSBuaWNlIGlmIHRoZSBmb3JfZWFj
aF9ibGFoX2luX3N0YXRlKCkgaXRlcmF0b3JzIHdvdWxkCj4gc3BsYXQgb24gaW5jb3JyZWN0IHVz
YWdlLCB0aGVuLi4gIGl0IHRvb2wgYSB3aGlsZSB0byB0cmFjayBkb3duIHdoYXQKPiB3YXMgZ29p
bmcgd3JvbmcuICBBbmQgU2VhbiBjbGFpbWVkIHRoZSBzZWxmIHJlZnJlc2ggaGVscGVycyB3b3Jr
ZWQgZm9yCj4gaGltIG9uIHJvY2tjaGlwL2k5MTUgKGFsdGhvdWdoIEknbSBzdGFydGluZyB0byBz
dXNwZWN0IG1heWJlIGhlIGp1c3QKPiBkaWRuJ3QgaGF2ZSBlbm91Z2ggZGVidWcgb3B0aW9ucyBl
bmFibGVkIHRvIHBvaXNvbiBmcmVlZCBtZW1vcnk/KQpDb3VsZCBkbyBhIG1lbXNldCBvbiB0aGUg
bmV3IGFycmF5cyBhZnRlciBod19kb25lPwo+PiBTZWxmIHJlZnJlc2ggaGVscGVycyBzaG91bGQg
YmUgZml4ZWQuIDopCj4gTG9va3MgbGlrZSB3aGF0IHRoZXkgbmVlZCBvdXQgb2YgY3J0Y19zdGF0
ZSBpcyBwcmV0dHkgbWluaW1hbCwgbWF5YmUKPiB0aGV5IGNvdWxkIGV4dHJhY3Qgb3V0IGNydGNf
c3RhdGUtPnNlbGZfcmVmcmVzaF9hY3RpdmUgZWFybGllci4uCgpZZWFoLCBzb21ldGhpbmcgbGlr
ZSB0aGF0IHdvdWxkIHdvcmsuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
