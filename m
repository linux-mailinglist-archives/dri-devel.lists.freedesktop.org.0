Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BC6293F10
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 16:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D09F6ECE9;
	Tue, 20 Oct 2020 14:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89D86ECDF;
 Tue, 20 Oct 2020 14:55:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DF15AD52;
 Tue, 20 Oct 2020 14:55:30 +0000 (UTC)
Subject: Re: [PATCH] drm/doc: Document legacy_cursor_update better
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201020143936.1089259-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <aaa69018-95eb-29d6-02f7-f3a53d6fadda@suse.de>
Date: Tue, 20 Oct 2020 16:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201020143936.1089259-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIwLjEwLjIwIDE2OjM5LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IEl0J3MgdGhlIGhv
cnJvciBhbmQgc2hvdWxkbid0IGJlIHVzZWQuIFJlYWxpemVkIHdlJ3JlIG5vdCBjbGVhciBvbgo+
IHRoaXMgaW4gYSBkaXNjdXNzaW9uIHdpdGggUm9iIGFib3V0IHdoYXQgbXNtIGlzIGRvaW5nIHRv
IGJldHRlcgo+IHN1cHBvcnQgYXN5bmMgY29tbWl0cy4KPiAKPiBDYzogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+Cj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIHwgMTIgKysrKysr
KysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaCBiL2luY2x1ZGUvZHJt
L2RybV9hdG9taWMuaAo+IGluZGV4IGQwN2M4NTFkMjU1Yi4uNDEzZmQwY2E1NmE4IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9h
dG9taWMuaAo+IEBAIC0zMDgsNyArMzA4LDYgQEAgc3RydWN0IF9fZHJtX3ByaXZhdGVfb2Jqc19z
dGF0ZSB7Cj4gICAqIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlIC0gdGhlIGdsb2JhbCBzdGF0ZSBv
YmplY3QgZm9yIGF0b21pYyB1cGRhdGVzCj4gICAqIEByZWY6IGNvdW50IG9mIGFsbCByZWZlcmVu
Y2VzIHRvIHRoaXMgc3RhdGUgKHdpbGwgbm90IGJlIGZyZWVkIHVudGlsIHplcm8pCj4gICAqIEBk
ZXY6IHBhcmVudCBEUk0gZGV2aWNlCj4gLSAqIEBsZWdhY3lfY3Vyc29yX3VwZGF0ZTogaGludCB0
byBlbmZvcmNlIGxlZ2FjeSBjdXJzb3IgSU9DVEwgc2VtYW50aWNzCj4gICAqIEBhc3luY191cGRh
dGU6IGhpbnQgZm9yIGFzeW5jaHJvbm91cyBwbGFuZSB1cGRhdGUKPiAgICogQHBsYW5lczogcG9p
bnRlciB0byBhcnJheSBvZiBzdHJ1Y3R1cmVzIHdpdGggcGVyLXBsYW5lIGRhdGEKPiAgICogQGNy
dGNzOiBwb2ludGVyIHRvIGFycmF5IG9mIENSVEMgcG9pbnRlcnMKPiBAQCAtMzM2LDYgKzMzNSwx
NyBAQCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSB7Cj4gIAkgKiBkcm1fYXRvbWljX2NydGNfbmVl
ZHNfbW9kZXNldCgpLgo+ICAJICovCj4gIAlib29sIGFsbG93X21vZGVzZXQgOiAxOwo+ICsJLyoq
Cj4gKwkgKiBAbGVnYWN5X2N1cnNvcl91cGRhdGU6Cj4gKwkgKgo+ICsJICogSGludCB0byBlbmZv
cmNlIGxlZ2FjeSBjdXJzb3IgSU9DVEwgc2VtYW50aWNzLgo+ICsJICoKPiArCSAqIFdBUk5JTkc6
IFRoaXMgaXMgdGhvcm91Z2hseSBicm9rZW4gYW5kIHByZXR0eSBtdWNoIGltcG9zc2libGUgdG8K
PiArCSAqIGltcGxlbWVudCBjb3JyZWN0bHkuIERyaXZlcnMgbXVzdCBpZ25vcmUgdGhpcyBhbmQg
c2hvdWxkIGluc3RlYWQKPiArCSAqIGltcGxlbWVudCAmZHJtX3BsYW5lX2hlbHBlcl9mdW5jcy5h
dG9taWNfYXN5bmNfY2hlY2sgYW5kCj4gKwkgKiAmZHJtX3BsYW5lX2hlbHBlcl9mdW5jcy5hdG9t
aWNfYXN5bmNfY29tbWl0IGhvb2tzLiBOZXcgdXNlcnMgb2YgdGhpcwo+ICsJICogZmxhZyBhcmUg
bm90IGFsbG93ZWQuCj4gKwkgKi8KPiAgCWJvb2wgbGVnYWN5X2N1cnNvcl91cGRhdGUgOiAxOwoK
VGhlIHRleHQgY291bGQgYWxzbyBzYXkgd2h5IHRoZSBmaWVsZCBleGlzdHMgaW4gdGhlIGZpcnN0
IHBsYWNlLiBJZiBpdCdzCnN1cHBvc2VkIHRvIGdvIGF3YXksIHlvdSBjb3VsZCBhZGQgYW4gaXRl
bSB0byB0aGUgVE9ETyBsaXN0LgoKQmVzdCByZWdhcmRzClRob21hcwoKPiAgCWJvb2wgYXN5bmNf
dXBkYXRlIDogMTsKPiAgCS8qKgo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
