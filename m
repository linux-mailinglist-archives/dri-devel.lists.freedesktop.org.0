Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA971457D8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 15:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630A46F554;
	Wed, 22 Jan 2020 14:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEECC6F552;
 Wed, 22 Jan 2020 14:28:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 06:27:07 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="215922155"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 06:27:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm: support feature masks in
 drm_core_check_feature()
In-Reply-To: <4eec4b04-23ab-9c48-d27c-9679974d1dbd@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200122140259.12086-1-jani.nikula@intel.com>
 <4eec4b04-23ab-9c48-d27c-9679974d1dbd@suse.de>
Date: Wed, 22 Jan 2020 16:27:02 +0200
Message-ID: <87pnfbefd5.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMiBKYW4gMjAyMCwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOgo+IEhpIEphbmkKPgo+IEFtIDIyLjAxLjIwIHVtIDE1OjAyIHNjaHJpZWIgSmFu
aSBOaWt1bGE6Cj4+IEFsbG93IGEgbWFzayBvZiBmZWF0dXJlcyB0byBiZSBwYXNzZWQgdG8gZHJt
X2NvcmVfY2hlY2tfZmVhdHVyZSgpLiBBbGwKPj4gZmVhdHVyZXMgaW4gdGhlIG1hc2sgYXJlIHJl
cXVpcmVkLgo+PiAKPj4gdjI6Cj4+IC0gZml4IGtlcm5lbC1kb2MgKFZpbGxlKQo+PiAtIGFkZCBh
biBleHRyYSB2YXJpYWJsZSBmb3IgY2xhcml0eSAoVmlsbGUpCj4+IAo+PiBSZXZpZXdlZC1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPj4gLS0tCj4+ICBp
bmNsdWRlL2RybS9kcm1fZHJ2LmggfCAxMiArKysrKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4+IGluZGV4IGNmMTM0
NzA4MTBhNS4uZjE4ZTE5ZjNmMmQwIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHJ2
LmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4+IEBAIC04MjYsMTYgKzgyNiwyMCBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgZHJtX2Rldl9pc191bnBsdWdnZWQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKPj4gIC8qKgo+PiAgICogZHJtX2NvcmVfY2hlY2tfZmVhdHVyZSAtIGNoZWNrIGRy
aXZlciBmZWF0dXJlIGZsYWdzCj4+ICAgKiBAZGV2OiBEUk0gZGV2aWNlIHRvIGNoZWNrCj4+IC0g
KiBAZmVhdHVyZTogZmVhdHVyZSBmbGFnCj4+ICsgKiBAZmVhdHVyZXM6IGZlYXR1cmUgZmxhZyhz
KQo+PiAgICoKPj4gICAqIFRoaXMgY2hlY2tzIEBkZXYgZm9yIGRyaXZlciBmZWF0dXJlcywgc2Vl
ICZkcm1fZHJpdmVyLmRyaXZlcl9mZWF0dXJlcywKPj4gICAqICZkcm1fZGV2aWNlLmRyaXZlcl9m
ZWF0dXJlcywgYW5kIHRoZSB2YXJpb3VzICZlbnVtIGRybV9kcml2ZXJfZmVhdHVyZSBmbGFncy4K
Pj4gICAqCj4+IC0gKiBSZXR1cm5zIHRydWUgaWYgdGhlIEBmZWF0dXJlIGlzIHN1cHBvcnRlZCwg
ZmFsc2Ugb3RoZXJ3aXNlLgo+PiArICogUmV0dXJucyB0cnVlIGlmIGFsbCBmZWF0dXJlcyBpbiB0
aGUgQGZlYXR1cmVzIG1hc2sgYXJlIHN1cHBvcnRlZCwgZmFsc2UKPj4gKyAqIG90aGVyd2lzZS4K
Pj4gICAqLwo+PiAtc3RhdGljIGlubGluZSBib29sIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoY29u
c3Qgc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdTMyIGZlYXR1cmUpCj4+ICtzdGF0aWMgaW5saW5l
IGJvb2wgZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+PiArCQkJCQkgIHUzMiBmZWF0dXJlcykKPgo+IEl0J3MgbWlzbmFtZWQgbm93LiBJJ2QgYWRk
IGEgbmV3IGZ1bmN0aW9uLCBzYXkKPiBkcm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoKSwgd2hp
Y2ggbWFrZXMgdGhlIHB1cnBvc2UgY2xlYXIuCgpXZSBkb24ndCByZWFsbHkgbmVlZCBhbm90aGVy
IGZ1bmN0aW9uLiBXZSBuZWVkIHRoaXMgb25lIHRvIGNoZWNrIGFsbCB0aGUKZmVhdHVyZXMuIEJ1
dCBJJ2QgcmF0aGVyIG5vdCBkbyB0aGUgbWFzcyByZW5hbWUgb2YgYWxsIGNhbGwgc2l0ZXMgZm9y
IG5vCnJlYWwgYmVuZWZpdC4KCkJSLApKYW5pLgoKCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMK
Pgo+PiAgewo+PiAtCXJldHVybiBkZXYtPmRyaXZlci0+ZHJpdmVyX2ZlYXR1cmVzICYgZGV2LT5k
cml2ZXJfZmVhdHVyZXMgJiBmZWF0dXJlOwo+PiArCXUzMiBzdXBwb3J0ZWQgPSBkZXYtPmRyaXZl
ci0+ZHJpdmVyX2ZlYXR1cmVzICYgZGV2LT5kcml2ZXJfZmVhdHVyZXM7Cj4+ICsKPj4gKwlyZXR1
cm4gZmVhdHVyZXMgJiYgKHN1cHBvcnRlZCAmIGZlYXR1cmVzKSA9PSBmZWF0dXJlczsKPj4gIH0K
Pj4gIAo+PiAgLyoqCj4+IAoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFw
aGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
