Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC4FC64A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 13:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340C66E267;
	Thu, 14 Nov 2019 12:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892456E24D;
 Thu, 14 Nov 2019 12:27:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 04:27:38 -0800
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="198802914"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 04:27:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH RESEND 0/8] drm/print: cleanup and new drm_device based
 logging
In-Reply-To: <20191112152134.GA25787@art_vandelay>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1572258935.git.jani.nikula@intel.com>
 <20191112152134.GA25787@art_vandelay>
Date: Thu, 14 Nov 2019 14:27:32 +0200
Message-ID: <871rua3aob.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBOb3YgMjAxOSwgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+IHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDI4LCAyMDE5IGF0IDEyOjM4OjE0UE0gKzAyMDAsIEphbmkgTmlrdWxhIHdy
b3RlOgo+PiBSZXNlbmQgb2YgWzFdOyBJIG1heSBoYXZlIHJlYmFzZWQgYnV0IEknbSBub3Qgc3Vy
ZSBhbnltb3JlLi4uCj4+IAo+PiBGb3Igc3RhcnRlcnMgc29tZSBmYWlybHkgYmVuaWduIGNsZWFu
dXAsIGFuZCBhIHByb3Bvc2FsIGZvciBuZXcgc3RydWN0Cj4+IGRybV9kZXZpY2UgYmFzZWQgZHJt
IGxvZ2dpbmcgbWFjcm9zIGFuYWxvZ3VvdXMgdG8gY29yZSBrZXJuZWwgc3RydWN0Cj4+IGRldmlj
ZSBiYXNlZCBtYWNyb3MuCj4+IAo+PiBQbGVhc2UgbGV0J3MgYXQgbGVhc3QgZ2V0IHRoZSBmaXJz
dCA3IHJldmlld2VkL2Fja2VkL21lcmdlZCwgc2hhbGwgd2U/Cj4+IAo+Cj4gQWNrZWQtYnk6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKVGhhbmtzIGZvciB0aGUgYWNrcyBhbmQgcmV2aWV3
cywgcHVzaGVkIHBhdGNoZXMgMS03LgoKSXQncyBhIGJpdCB1bmNsZWFyIHRvIG1lIHdoZXRoZXIg
dGhlIGFjayBjb3ZlcnMgcGF0Y2ggOCB0b28uIFdoYXQncyB5b3VyCnRha2Ugb24gbG9nZ2luZz8K
CkJSLApKYW5pLgoKCj4KPj4gCj4+IEJSLAo+PiBKYW5pLgo+PiAKPj4gCj4+IFsxXSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY3Nzk1Lwo+PiAKPj4gCj4+IEphbmkg
TmlrdWxhICg4KToKPj4gICBkcm0vaTkxNTogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hl
Y2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKPj4gICBkcm0vbm91dmVhdTogdXNlIGRybV9kZWJ1Z19l
bmFibGVkKCkgdG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKPj4gICBkcm0vYW1kZ3B1OiB1
c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmllcwo+PiAg
IGRybS9wcmludDogcmVuYW1lIGRybV9kZWJ1ZyB0byBfX2RybV9kZWJ1ZyB0byBkaXNjb3VyYWdl
IHVzZQo+PiAgIGRybS9wcmludDogdW5kZXJzY29yZSBwcmVmaXggZnVuY3Rpb25zIHRoYXQgc2hv
dWxkIGJlIHByaXZhdGUgdG8gcHJpbnQKPj4gICBkcm0vcHJpbnQ6IGNvbnZlcnQgZGVidWcgY2F0
ZWdvcnkgbWFjcm9zIGludG8gYW4gZW51bQo+PiAgIGRybS9wcmludDogZ3JvdXAgbG9nZ2luZyBm
dW5jdGlvbnMgYnkgcHJpbmsgb3IgZGV2aWNlIGJhc2VkCj4+ICAgZHJtL3ByaW50OiBpbnRyb2R1
Y2UgbmV3IHN0cnVjdCBkcm1fZGV2aWNlIGJhc2VkIGxvZ2dpbmcgbWFjcm9zCj4+IAo+PiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jICAgfCAgIDQgKy0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyAgICAgICAgICAgICAgICAgIHwgIDE4ICstCj4+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8ICAgNCArLQo+PiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAgIDIgKy0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICAgIHwgICAyICstCj4+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5oICAgICAgICAgICAgICB8ICAgMiArLQo+
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5jICAgICAgICAgICAgfCAgIDIgKy0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMgICAgICAgICAgICAgIHwgICAyICst
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmggICAgICB8ICAgNCAr
LQo+PiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCAgICAgICAgfCAgIDQg
Ky0KPj4gIGluY2x1ZGUvZHJtL2RybV9wcmludC5oICAgICAgICAgICAgICAgICAgICAgIHwgMzA0
ICsrKysrKysrKysrKy0tLS0tLS0KPj4gIDExIGZpbGVzIGNoYW5nZWQsIDIyNCBpbnNlcnRpb25z
KCspLCAxMjQgZGVsZXRpb25zKC0pCj4+IAo+PiAtLSAKPj4gMi4yMC4xCj4+IAo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
