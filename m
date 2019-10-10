Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48218D2BAD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD766EB49;
	Thu, 10 Oct 2019 13:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259466EB49
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:49:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 06:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="184419444"
Received: from pashteka-mobl.ger.corp.intel.com (HELO [10.252.41.207])
 ([10.252.41.207])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 06:49:48 -0700
Subject: Re: [PATCH] drm/plane: Clarify our expectations for src/dst rectangles
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191010112918.15724-1-maarten.lankhorst@linux.intel.com>
 <20191010123624.GD1208@intel.com>
 <8c14f6fc-d6d6-9bad-9fe7-cab119e2fec2@linux.intel.com>
 <20191010130726.GF1208@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <e8e2321f-aa9f-f84c-c6e3-40a87c967c25@linux.intel.com>
Date: Thu, 10 Oct 2019 15:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010130726.GF1208@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMTAtMTAtMjAxOSBvbSAxNTowNyBzY2hyZWVmIFZpbGxlIFN5cmrDpGzDpDoKPiBPbiBUaHUs
IE9jdCAxMCwgMjAxOSBhdCAwMjo0NjoyNlBNICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPj4gT3AgMTAtMTAtMjAxOSBvbSAxNDozNiBzY2hyZWVmIFZpbGxlIFN5cmrDpGzDpDoKPj4+
IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDAxOjI5OjE3UE0gKzAyMDAsIE1hYXJ0ZW4gTGFua2hv
cnN0IHdyb3RlOgo+Pj4+IFRoZSByZWN0YW5nbGVzIGFyZSB1c3VhbGx5IGNsaXBwZWQsIGJ1dCBp
dCBjYW4gYmUgdXNlZnVsIHRvIGhhdmUKPj4+PiB0aGVtIHVuY2xpcHBlZCwgZm9yIGV4YW1wbGUg
Zm9yIGN1cnNvciBwbGFuZXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICBp
bmNsdWRlL2RybS9kcm1fcGxhbmUuaCB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0KPj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggYi9pbmNsdWRlL2RybS9kcm1f
cGxhbmUuaAo+Pj4+IGluZGV4IGNkNTkwM2FkMzNmNy4uOTRiYmJmMjE1MTAwIDEwMDY0NAo+Pj4+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCj4+Pj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X3BsYW5lLmgKPj4+PiBAQCAtMTgzLDggKzE4MywyNiBAQCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
IHsKPj4+PiAgCSAqLwo+Pj4+ICAJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpmYl9kYW1hZ2Vf
Y2xpcHM7Cj4+Pj4gIAo+Pj4+IC0JLyoqIEBzcmM6IGNsaXBwZWQgc291cmNlIGNvb3JkaW5hdGVz
IG9mIHRoZSBwbGFuZSAoaW4gMTYuMTYpICovCj4+Pj4gLQkvKiogQGRzdDogY2xpcHBlZCBkZXN0
aW5hdGlvbiBjb29yZGluYXRlcyBvZiB0aGUgcGxhbmUgKi8KPj4+PiArCS8qKgo+Pj4+ICsJICog
QHNyYzoKPj4+PiArCSAqCj4+Pj4gKwkgKiBzb3VyY2UgY29vcmRpbmF0ZXMgb2YgdGhlIHBsYW5l
IChpbiAxNi4xNikuCj4+Pj4gKwkgKgo+Pj4+ICsJICogV2hlbiB1c2luZyBkcm1fYXRvbWljX2hl
bHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpLAo+Pj4+ICsJICogdGhlIGNvb3JkaW5hdGVzIGFyZSBj
bGlwcGVkLCBidXQgdGhlIGRyaXZlciBtYXkgY2hvb3NlCj4+Pj4gKwkgKiB0byB1c2UgdW5jbGlw
cGVkIGNvb3JkaW5hdGVzIGluc3RlYWQuCj4+Pj4gKwkgKgo+Pj4+ICsJICogVGhpcyBjYW4gYmUg
dXNlZnVsIHdoZW4gdXNpbmcgYSBoYXJkY29kZWQgc2l6ZSBpbiBhIGN1cnNvciBwbGFuZS4KPj4+
IEkgd291bGQgaW5zdGVhZCBzYXkgc29tZXRoaW5nIGxpa2UgIndoZW4gdGhlIGhhcmR3YXJlIHBl
cmZvcm1zCj4+PiB0aGUgY2xpcHBpbmcgYXV0b21hZ2ljYWxseSIuCj4+Cj4+IFdpdGggdGhhdCBm
aXhlZCwgci1iPwo+IEF5ZQo+Cj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KTm90aWNlZCBJIGRyb3BwZWQgdGhlIGV4cGxhbmF0
aW9uIGZvciBkc3Qgd2hlbiBjaGVja2luZyBkb2Nib29rIG91dHB1dCwgZml4ZWQgYW5kIHB1c2hl
ZC4gOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
