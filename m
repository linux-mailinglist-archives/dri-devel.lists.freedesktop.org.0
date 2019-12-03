Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29B10FDDC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242B76E4AF;
	Tue,  3 Dec 2019 12:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C7E6E4AF;
 Tue,  3 Dec 2019 12:41:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 04:41:49 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="200986464"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 04:41:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/i915: Auto detect DPCD backlight support by
 default
In-Reply-To: <20191122231616.2574-5-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191122231616.2574-1-lyude@redhat.com>
 <20191122231616.2574-5-lyude@redhat.com>
Date: Tue, 03 Dec 2019 14:41:44 +0200
Message-ID: <87o8wpinsn.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMiBOb3YgMjAxOSwgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gVHVybnMgb3V0IHdlIGFjdHVhbGx5IGFscmVhZHkgaGF2ZSBzb21lIGNvbXBhbmllcywgc3Vj
aCBhcyBMZW5vdm8sCj4gc2hpcHBpbmcgbWFjaGluZXMgd2l0aCBBTU9MRUQgc2NyZWVucyB0aGF0
IGRvbid0IGFsbG93IGNvbnRyb2xsaW5nIHRoZQo+IGJhY2tsaWdodCB0aHJvdWdoIHRoZSB1c3Vh
bCBQV00gaW50ZXJmYWNlIGFuZCBvbmx5IGFsbG93IGNvbnRyb2xsaW5nIGl0Cj4gdGhyb3VnaCB0
aGUgc3RhbmRhcmQgRURQIERQQ0QgaW50ZXJmYWNlLiBPbmUgZXhhbXBsZSBvZiBvbmUgb2YgdGhl
c2UKPiBsYXB0b3BzIGlzIHRoZSBYMSBFeHRyZW1lIDJuZCBHZW5lcmF0aW9uLgo+Cj4gU2luY2Ug
d2UndmUgZ290IHN5c3RlbXMgdGhhdCBuZWVkIHRoaXMgdHVybmVkIG9uIGJ5IGRlZmF1bHQgbm93
IHRvIGhhdmUKPiBiYWNrbGlnaHQgY29udHJvbHMgd29ya2luZyBvdXQgb2YgdGhlIGJveCwgbGV0
J3Mgc3RhcnQgYXV0by1kZXRlY3RpbmcgaXQKPiBmb3Igc3lzdGVtcyBieSBkZWZhdWx0IGJhc2Vk
IG9uIHdoYXQgdGhlIFZCVCB0ZWxscyB1cy4gV2UgZG8gdGhpcyBieQo+IGNoYW5naW5nIHRoZSBk
ZWZhdWx0IHZhbHVlIGZvciB0aGUgZW5hYmxlX2RwY2RfYmFja2xpZ2h0IG1vZHVsZSBwYXJhbQo+
IGZyb20gMCB0byAtMS4KPgo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+CgpSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMgfCAyICstCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmggfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X3BhcmFtcy5jCj4gaW5kZXggMWRkMWYzNjUyNzk1Li4zMWVlZDYwYzE2N2UgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMKPiBAQCAtMTcyLDcgKzE3Miw3IEBAIGk5MTVfcGFyYW1f
bmFtZWRfdW5zYWZlKGluamVjdF9wcm9iZV9mYWlsdXJlLCB1aW50LCAwNDAwLAo+ICAKPiAgaTkx
NV9wYXJhbV9uYW1lZChlbmFibGVfZHBjZF9iYWNrbGlnaHQsIGludCwgMDYwMCwKPiAgCSJFbmFi
bGUgc3VwcG9ydCBmb3IgRFBDRCBiYWNrbGlnaHQgY29udHJvbCIKPiAtCSIoLTE9dXNlIHBlci1W
QlQgTEZQIGJhY2tsaWdodCB0eXBlIHNldHRpbmcsIDA9ZGlzYWJsZWQgW2RlZmF1bHRdLCAxPWVu
YWJsZWQpIik7Cj4gKwkiKC0xPXVzZSBwZXItVkJUIExGUCBiYWNrbGlnaHQgdHlwZSBzZXR0aW5n
IFtkZWZhdWx0XSwgMD1kaXNhYmxlZCwgMT1lbmFibGVkKSIpOwo+ICAKPiAgI2lmIElTX0VOQUJM
RUQoQ09ORklHX0RSTV9JOTE1X0dWVCkKPiAgaTkxNV9wYXJhbV9uYW1lZChlbmFibGVfZ3Z0LCBi
b29sLCAwNDAwLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFt
cy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaAo+IGluZGV4IDMxYjg4ZjI5
N2ZiYy4uYTc5ZDA4NjdmNzdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcGFyYW1zLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5oCj4g
QEAgLTY0LDcgKzY0LDcgQEAgc3RydWN0IGRybV9wcmludGVyOwo+ICAJcGFyYW0oaW50LCByZXNl
dCwgMykgXAo+ICAJcGFyYW0odW5zaWduZWQgaW50LCBpbmplY3RfcHJvYmVfZmFpbHVyZSwgMCkg
XAo+ICAJcGFyYW0oaW50LCBmYXN0Ym9vdCwgLTEpIFwKPiAtCXBhcmFtKGludCwgZW5hYmxlX2Rw
Y2RfYmFja2xpZ2h0LCAwKSBcCj4gKwlwYXJhbShpbnQsIGVuYWJsZV9kcGNkX2JhY2tsaWdodCwg
LTEpIFwKPiAgCXBhcmFtKGNoYXIgKiwgZm9yY2VfcHJvYmUsIENPTkZJR19EUk1fSTkxNV9GT1JD
RV9QUk9CRSkgXAo+ICAJcGFyYW0odW5zaWduZWQgbG9uZywgZmFrZV9sbWVtX3N0YXJ0LCAwKSBc
Cj4gIAkvKiBsZWF2ZSBib29scyBhdCB0aGUgZW5kIHRvIG5vdCBjcmVhdGUgaG9sZXMgKi8gXAoK
LS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
