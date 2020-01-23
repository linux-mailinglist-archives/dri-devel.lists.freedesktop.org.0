Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C314689E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 14:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4896FC85;
	Thu, 23 Jan 2020 13:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782FD6FC83;
 Thu, 23 Jan 2020 13:01:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:01:43 -0800
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="220658166"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:01:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/debugfs: also take per device
 driver features into account
In-Reply-To: <a71522fa-780d-1c09-17dc-46230967223f@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200122155030.29304-1-jani.nikula@intel.com>
 <20200122155030.29304-2-jani.nikula@intel.com>
 <a71522fa-780d-1c09-17dc-46230967223f@suse.de>
Date: Thu, 23 Jan 2020 15:01:38 +0200
Message-ID: <875zh2e37x.fsf@intel.com>
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
ZGU+IHdyb3RlOgo+IEhpCj4KPiBBbSAyMi4wMS4yMCB1bSAxNjo1MCBzY2hyaWViIEphbmkgTmlr
dWxhOgo+PiBVc2UgZHJtX2NvcmVfY2hlY2tfYWxsX2ZlYXR1cmVzKCkgdG8gZW5zdXJlIGJvdGgg
dGhlIGRyaXZlciBmZWF0dXJlcyBhbmQKPj4gdGhlIHBlci1kZXZpY2UgZHJpdmVyIGZlYXR1cmVz
IGFyZSB0YWtlbiBpbnRvIGFjY291bnQgd2hlbiByZWdpc3RlcmluZwo+PiBkZWJ1Z2ZzIGZpbGVz
Lgo+PiAKPj4gdjI6Cj4+IC0gdXNlIGRybV9jb3JlX2NoZWNrX2FsbF9mZWF0dXJlcygpCj4+IAo+
PiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPj4g
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+Cj4+IC0tLQo+PiAgZHJp
dmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMgfCA1ICstLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwo+
PiBpbmRleCBlYWIwZjI2ODdjZDYuLjBjNzBiNGIyMmM4YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzLmMKPj4gQEAgLTE4MCwxMCArMTgwLDcgQEAgaW50IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxl
cyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmlsZXMsIGludCBjb3VudCwKPj4gIAlpbnQg
aTsKPj4gIAo+PiAgCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Cj4+IC0JCXUzMiBmZWF0
dXJlcyA9IGZpbGVzW2ldLmRyaXZlcl9mZWF0dXJlczsKPj4gLQo+PiAtCQlpZiAoZmVhdHVyZXMg
IT0gMCAmJgo+PiAtCQkgICAgKGRldi0+ZHJpdmVyLT5kcml2ZXJfZmVhdHVyZXMgJiBmZWF0dXJl
cykgIT0gZmVhdHVyZXMpCj4+ICsJCWlmICghZHJtX2NvcmVfY2hlY2tfYWxsX2ZlYXR1cmVzKGRl
diwgZmlsZXNbaV0uZHJpdmVyX2ZlYXR1cmVzKSkKPj4gIAkJCWNvbnRpbnVlOwoKVGhhbmtzIGZv
ciB0aGUgcmV2aWV3LCBidXQgYWN0dWFsbHkgZmlsZXNbaV0uZHJpdmVyX2ZlYXR1cmVzID09IDAg
bWVhbnMKImRvbid0IGNhcmUgYWJvdXQgZmVhdHVyZXMiLCBhbmQgdGhlIHdheSBkcm1fY29yZV9j
aGVja19hbGxfZmVhdHVyZXMoKQppcyBkZWZpbmVkIGZlYXR1cmVzID09IDAgbGVhZHMgdG8gZmFs
c2UuIFNvIHdlIGZhaWwgdG8gcmVnaXN0ZXIgbW9zdApkZWJ1Z2ZzIGZpbGVzLiAqYmx1c2gqCgpO
ZXcgdmVyc2lvbiBvbiB0aGUgbGlzdC4KCkJSLApKYW5pLgoKCj4+ICAKPj4gIAkJdG1wID0ga21h
bGxvYyhzaXplb2Yoc3RydWN0IGRybV9pbmZvX25vZGUpLCBHRlBfS0VSTkVMKTsKPj4gCgotLSAK
SmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
