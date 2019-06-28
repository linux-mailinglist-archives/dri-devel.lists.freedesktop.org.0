Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C659A15
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAB86E8F7;
	Fri, 28 Jun 2019 12:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3244D6E8F7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:10:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id D1E8C263955
Message-ID: <ee19affecdd64b1f835d193ae742b4f084335b93.camel@collabora.com>
Subject: Re: [PATCH v4 1/2] drm/vblank: warn on sending stale event
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 28 Jun 2019 13:10:14 +0100
In-Reply-To: <66e100219a2740e493a7b96ebb95d0a2e697f121.1561722822.git.bob.beckett@collabora.com>
References: <cover.1561722822.git.bob.beckett@collabora.com>
 <66e100219a2740e493a7b96ebb95d0a2e697f121.1561722822.git.bob.beckett@collabora.com>
Organization: Collabora
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmFrIC0gSSBmb3Jnb3QgdGhlIHJlcXVlc3RlZCBkb2MgY2hhbmdlcy4gSWxsIHJlLXNlbmQKCk9u
IEZyaSwgMjAxOS0wNi0yOCBhdCAxMzowNSArMDEwMCwgUm9iZXJ0IEJlY2tldHQgd3JvdGU6Cj4g
V2FybiB3aGVuIGFib3V0IHRvIHNlbmQgc3RhbGUgdmJsYW5rIGluZm8gYW5kIGFkZCBhZHZpY2Ug
dG8KPiBkb2N1bWVudGF0aW9uIG9uIGhvdyB0byBhdm9pZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgQmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBpbmRleCA2
MDNhYjEwNTEyNWQuLjdkYWJiMmJkYjczMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3ZibGFuay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IEBAIC05
MTgsNiArOTE4LDE5IEBAIEVYUE9SVF9TWU1CT0woZHJtX2NydGNfYXJtX3ZibGFua19ldmVudCk7
Cj4gICAqCj4gICAqIFNlZSBkcm1fY3J0Y19hcm1fdmJsYW5rX2V2ZW50KCkgZm9yIGEgaGVscGVy
IHdoaWNoIGNhbiBiZSB1c2VkIGluCj4gY2VydGFpbgo+ICAgKiBzaXR1YXRpb24sIGVzcGVjaWFs
bHkgdG8gc2VuZCBvdXQgZXZlbnRzIGZvciBhdG9taWMgY29tbWl0Cj4gb3BlcmF0aW9ucy4KPiAr
ICoKPiArICogQ2FyZSBzaG91bGQgYmUgdGFrZW4gdG8gYXZvaWQgc3RhbGUgdGltZXN0YW1wcy4g
SWY6Cj4gKyAqICAgLSB5b3VyIGRyaXZlciBoYXMgdmJsYW5rIHN1cHBvcnQgKGkuZS4gZGV2LT5u
dW1fY3J0Y3MgPiAwKQo+ICsgKiAgIC0gdGhlIHZibGFuayBpcnEgaXMgb2ZmIChpLmUuIG5vIG9u
ZSBjYWxsZWQKPiBkcm1fY3J0Y192YmxhbmtfZ2V0KQo+ICsgKiAgIC0gZnJvbSB0aGUgdmJsYW5r
IGNvZGUncyBwb3YgdGhlIHBpcGUgaXMgc3RpbGwgcnVubmluZyAoaS5lLgo+IG5vdAo+ICsgKiAg
ICAgaW4tYmV0d2VlbiBhIGRybV9jcnRjX3ZibGFua19vZmYoKS9vbigpIHBhaXIpCj4gKyAqIElm
IGFsbCBvZiB0aGVzZSBjb25kaXRpb25zIGhvbGQgdGhlbiBkcm1fY3J0Y19zZW5kX3ZibGFua19l
dmVudAo+IGlzCj4gKyAqIGdvaW5nIHRvIGdpdmUgeW91IGEgZ2FyYmFnZSB0aW1lc3RhbXAgYW5k
IGFuZCBzZXF1ZW5jZSBudW1iZXIKPiAodGhlIGxhc3QKPiArICogcmVjb3JkZWQgYmVmb3JlIHRo
ZSBpcnEgd2FzIGRpc2FibGVkKS4gSWYgeW91IGNhbGwKPiBkcm1fY3J0Y192YmxhbmtfZ2V0L3B1
dAo+ICsgKiBhcm91bmQgaXQsIG9yIGFmdGVyIHZibGFua19vZmYsIHRoZW4gZWl0aGVyIG9mIHRo
b3NlIHdpbGwgaGF2ZQo+IHJvbGxlZCB0aGluZ3MKPiArICogZm9yd2FyZCBmb3IgeW91Lgo+ICsg
KiBTbywgZHJpdmVycyBzaG91bGQgY2FsbCBkcm1fY3J0Y192Ymxhbmtfb2ZmKCkgYmVmb3JlIHRo
aXMKPiBmdW5jdGlvbiBpbiB0aGVpcgo+ICsgKiBjcnRjIGF0b21pY19kaXNhYmxlIGhhbmRsZXJz
Lgo+ICAgKi8KPiAgdm9pZCBkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsCj4gIAkJCQlzdHJ1Y3QgZHJtX3BlbmRpbmdfdmJsYW5rX2V2ZW50ICplKQo+IEBA
IC05MjUsOCArOTM4LDEyIEBAIHZvaWQgZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoc3RydWN0
IGRybV9jcnRjCj4gKmNydGMsCj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2
Owo+ICAJdTY0IHNlcTsKPiAgCXVuc2lnbmVkIGludCBwaXBlID0gZHJtX2NydGNfaW5kZXgoY3J0
Yyk7Cj4gKwlzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2YmxhbmsgPSAmZGV2LT52YmxhbmtbcGlw
ZV07Cj4gIAlrdGltZV90IG5vdzsKPiAgCj4gKwlXQVJOX09OQ0UoZGV2LT5udW1fY3J0Y3MgPiAw
ICYmICF2YmxhbmstPmVuYWJsZWQgJiYgIXZibGFuay0KPiA+aW5tb2Rlc2V0LAo+ICsJCSAgInNl
bmRpbmcgc3RhbGUgdmJsYW5rIGluZm9cbiIpOwo+ICsKPiAgCWlmIChkZXYtPm51bV9jcnRjcyA+
IDApIHsKPiAgCQlzZXEgPSBkcm1fdmJsYW5rX2NvdW50X2FuZF90aW1lKGRldiwgcGlwZSwgJm5v
dyk7Cj4gIAl9IGVsc2UgewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
