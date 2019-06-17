Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE647D8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A789175;
	Mon, 17 Jun 2019 08:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D308916D;
 Mon, 17 Jun 2019 08:49:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 01:49:10 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 01:49:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 59/59] drm/doc: Document kapi doc expectations
In-Reply-To: <20190614203615.12639-60-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-60-daniel.vetter@ffwll.ch>
Date: Mon, 17 Jun 2019 11:52:00 +0300
Message-ID: <87fto8vbkf.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4gd3JvdGU6Cj4gV2UndmUgaGFkIHRoaXMgYWxyZWFkeSBmb3IgYW55dGhpbmcgbmV3LiBXaXRo
IG15IGRybV9wcmltZS5jIGNsZWFudXAgSQo+IGFsc28gdGhpbmsgZG9jdW1lbnRhdGlvbnMgZm9y
IGV2ZXJ5dGhpbmcgYWxyZWFkeSBleGlzdGluZyBpcyBjb21wbGV0ZSwKPiBhbmQgd2UgY2FuIGJh
a2UgdGhpcyBpbiBhcyBhIHJlcXVpcmVtZW50cyBzdWJzeXN0ZW0gd2lkZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENj
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0
aW9uLnJzdCB8IDEzICsrKysrKysrKysrKysKPiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3Qg
ICAgICAgICB8IDEzIC0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dw
dS9pbnRyb2R1Y3Rpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAo+
IGluZGV4IGZjY2JlMzc1MjQ0ZC4uYTk0YWQ2YWQxZjU0IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZ3B1L2ludHJvZHVjdGlvbi5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9pbnRy
b2R1Y3Rpb24ucnN0Cj4gQEAgLTUxLDYgKzUxLDE5IEBAIGFuZCAiRklYTUUiIHdoZXJlIHRoZSBp
bnRlcmZhY2UgY291bGQgYmUgY2xlYW5lZCB1cC4KPiAgCj4gIEFsc28gcmVhZCB0aGUgOnJlZjpg
Z3VpZGVsaW5lcyBmb3IgdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9uIGF0IGxhcmdlIDxkb2NfZ3Vp
ZGU+YC4KPiAgCj4gK0RvY3VtZW50YXRpb24gUmVxdWlyZW1lbnRzIGZvciBrQVBJCj4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtBbGwga2VybmVsIEFQSXMgZXhw
b3J0ZWQgdG8gb3RoZXIgbW9kdWxlcyBtdXN0IGJlIGRvY3VtZW50ZWQsIGluY2x1ZGluZyB0aGVp
cgo+ICtkYXRhc3RydWN0dXJlcyBhbmQgYXQgbGVhc3QgYSBzaG9ydCBpbnRyb2R1Y3Rvcnkgc2Vj
dGlvbiBleHBsYWluaW5nIHRoZSBvdmVyYWxsCj4gK2NvbmNlcHRzLiBEb2N1bWVudGF0aW9uIHNo
b3VsZCBiZSBwdXQgaW50byB0aGUgY29kZSBpdHNlbGYgYXMga2VybmVsZG9jIGNvbW1lbnRzCj4g
K2FzIG11Y2ggYXMgcmVhc29uYWJsZS4gRG8gbm90IGJsaW5kbHkgZG9jdW1lbnQgZXZlcnl0aGlu
ZywgYnV0IGRvY3VtZW50IG9ubHkKPiArd2hhdCdzIHJlbGV2YW50IGZvciBkcml2ZXIgYXV0aG9y
czogSW50ZXJuYWwgZnVuY3Rpb25zIG9mIGRybS5rbyBhbmQgZGVmaW5pdGVseQo+ICtzdGF0aWMg
ZnVuY3Rpb25zIHNob3VsZCBub3QgaGF2ZSBmb3JtYWwga2VybmVsZG9jIGNvbW1lbnRzLiBVc2Ug
bm9ybWFsIEMKPiArY29tbWVudHMgaWYgeW91IGZlZWwgbGlrZSBhIGNvbW1lbnQgaXMgd2FycmFu
dGVkLiBTaW1pbGFyIGZvciBkYXRhIHN0cnVjdHVyZXMsCj4gK2Fubm90YXRlIGFueXRoaW5nIGVu
dGlyZWx5IHByaXZhdGUgd2l0aCBgYC8qIHByaXZhdGU6ICovYGAgY29tbWVudHMgYXMgcGVyIHRo
ZQo+ICtkb2N1bWVudGF0aW9uIGd1aWRlLgo+ICsKPiAgR2V0dGluZyBTdGFydGVkCj4gID09PT09
PT09PT09PT09PQo+ICAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IGluZGV4IDAyNmU1NWM1MTdlMS4uMjU4Nzhk
ZDA0OGZkIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiBAQCAtMjk5LDE5ICsyOTksNiBAQCBJbiB0aGUg
ZW5kIG5vIC5jIGZpbGUgc2hvdWxkIG5lZWQgdG8gaW5jbHVkZSBgYGRybVAuaGBgIGFueW1vcmUu
Cj4gIAo+ICBDb250YWN0OiBEYW5pZWwgVmV0dGVyCj4gIAo+IC1BZGQgbWlzc2luZyBrZXJuZWxk
b2MgZm9yIGV4cG9ydGVkIGZ1bmN0aW9ucwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IC0KPiAtVGhlIERSTSByZWZlcmVuY2UgZG9jdW1lbnRhdGlvbiBp
cyBzdGlsbCBsYWNraW5nIGtlcm5lbGRvYyBpbiBhIGZldyBhcmVhcy4gVGhlCj4gLXRhc2sgd291
bGQgYmUgdG8gY2xlYW4gdXAgaW50ZXJmYWNlcyBsaWtlIG1vdmluZyBmdW5jdGlvbnMgYXJvdW5k
IGJldHdlZW4KPiAtZmlsZXMgdG8gYmV0dGVyIGdyb3VwIHRoZW0gYW5kIGltcHJvdmluZyB0aGUg
aW50ZXJmYWNlcyBsaWtlIGRyb3BwaW5nIHJldHVybgo+IC12YWx1ZXMgZm9yIGZ1bmN0aW9ucyB0
aGF0IG5ldmVyIGZhaWwuIFRoZW4gd3JpdGUga2VybmVsZG9jIGZvciBhbGwgZXhwb3J0ZWQKPiAt
ZnVuY3Rpb25zIGFuZCBhbiBvdmVydmlldyBzZWN0aW9uIGFuZCBpbnRlZ3JhdGUgaXQgYWxsIGlu
dG8gdGhlIGRybSBib29rLgo+IC0KPiAtU2VlIGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9k
b2NzL2RybS8gZm9yIHdoYXQncyB0aGVyZSBhbHJlYWR5Lgo+IC0KPiAtQ29udGFjdDogRGFuaWVs
IFZldHRlcgo+IC0KPiAgTWFrZSBwYW5pYyBoYW5kbGluZyB3b3JrCj4gIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
