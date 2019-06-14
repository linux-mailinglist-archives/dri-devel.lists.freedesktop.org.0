Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA745CC3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857F0897EB;
	Fri, 14 Jun 2019 12:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF599897EB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:26:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 05:26:04 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2019 05:26:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v4 02/12] drm/client: Restrict the plane_state scope
In-Reply-To: <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
Date: Fri, 14 Jun 2019 15:28:59 +0300
Message-ID: <87wohouz90.fsf@intel.com>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, eben@raspberrypi.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSwgTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gVGhlIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfYXRvbWljIGZ1bmN0
aW9uIHVzZXMgdHdvIHRpbWVzIHRoZQo+IHBsYW5lX3N0YXRlIHZhcmlhYmxlIGluIGlubmVyIGJs
b2NrcyBvZiBjb2RlLCBidXQgdGhlIHZhcmlhYmxlIGhhcyBhIHNjb3BlCj4gZ2xvYmFsIHRvIHRo
aXMgZnVuY3Rpb24uCj4KPiBUaGlzIHdpbGwgbGVhZCB0byBpbmFkdmVydGVudCBkZXZzIHRvIHJl
dXNlIHRoZSB2YXJpYWJsZSBpbiB0aGUgc2Vjb25kCj4gYmxvY2sgd2l0aCB0aGUgdmFsdWUgbGVm
dCBieSB0aGUgZmlyc3QsIHdpdGhvdXQgYW55IHdhcm5pbmcgZnJvbSB0aGUKPiBjb21waWxlciBz
aW5jZSB2YWx1ZSB3b3VsZCBoYXZlIGJlZW4gaW5pdGlhbGl6ZWQuCj4KPiBGaXggdGhpcyBieSBt
b3ZpbmcgdGhlIHZhcmlhYmxlIGRlY2xhcmF0aW9uIHRvIHRoZSBwcm9wZXIgc2NvcGUuCgpUaGlz
IGlzIGFuIGltcHJvdmVtZW50LCBidXQgSSdkIGNvbnNpZGVyIHJlbmFtaW5nIGFsc28gdG8gbm90
IHNoYWRvdwp2YXJpYWJsZXMuCgpCUiwKSmFuaS4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rl
c2V0LmMKPiBpbmRleCAwMDZiZjczOTBlN2QuLjgyNjRjM2E3MzJiMCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKPiBAQCAtODYxLDcgKzg2MSw2IEBAIEVYUE9SVF9TWU1C
T0woZHJtX2NsaWVudF9wYW5lbF9yb3RhdGlvbik7Cj4gIHN0YXRpYyBpbnQgZHJtX2NsaWVudF9t
b2Rlc2V0X2NvbW1pdF9hdG9taWMoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIGJvb2wg
YWN0aXZlKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY2xpZW50LT5kZXY7Cj4g
LQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPiAgCXN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lOwo+ICAJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlOwo+ICAJc3RydWN0
IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsKPiBAQCAtODc5LDYgKzg3OCw4IEBAIHN0YXRp
YyBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMoc3RydWN0IGRybV9jbGllbnRf
ZGV2ICpjbGllbnQsIGJvb2wgCj4gIAlzdGF0ZS0+YWNxdWlyZV9jdHggPSAmY3R4Owo+ICByZXRy
eToKPiAgCWRybV9mb3JfZWFjaF9wbGFuZShwbGFuZSwgZGV2KSB7Cj4gKwkJc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGU7Cj4gKwo+ICAJCXBsYW5lX3N0YXRlID0gZHJtX2F0b21p
Y19nZXRfcGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsKPiAgCQlpZiAoSVNfRVJSKHBsYW5lX3N0
YXRlKSkgewo+ICAJCQlyZXQgPSBQVFJfRVJSKHBsYW5lX3N0YXRlKTsKPiBAQCAtOTAxLDYgKzkw
Miw4IEBAIHN0YXRpYyBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMoc3RydWN0
IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIGJvb2wgCj4gIAkJdW5zaWduZWQgaW50IHJvdGF0aW9u
Owo+ICAKPiAgCQlpZiAoZHJtX2NsaWVudF9wYW5lbF9yb3RhdGlvbihtb2RlX3NldCwgJnJvdGF0
aW9uKSkgewo+ICsJCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPiArCj4g
IAkJCS8qIENhbm5vdCBmYWlsIGFzIHdlJ3ZlIGFscmVhZHkgZ290dGVuIHRoZSBwbGFuZSBzdGF0
ZSBhYm92ZSAqLwo+ICAJCQlwbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9z
dGF0ZShzdGF0ZSwgcHJpbWFyeSk7Cj4gIAkJCXBsYW5lX3N0YXRlLT5yb3RhdGlvbiA9IHJvdGF0
aW9uOwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
