Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB85AB38E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B756E183;
	Fri,  6 Sep 2019 07:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256766E183
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 07:56:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 00:56:16 -0700
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="267289618"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 00:56:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/modes: Make the whitelist more const
In-Reply-To: <20190906074614.30608-1-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190906074614.30608-1-mripard@kernel.org>
Date: Fri, 06 Sep 2019 10:56:10 +0300
Message-ID: <87zhjh3lk5.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBTZXAgMjAxOSwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPiB3
cm90ZToKPiBUaGUgY29tbWl0IDM3NjQxMzc5MDZhNSAoImRybS9tb2RlczogSW50cm9kdWNlIGEg
d2hpdGVsaXN0IGZvciB0aGUgbmFtZWQKPiBtb2RlcyIpIGludHJvZHVjZWQgYSB3aGl0ZWxpc3Qg
aW4gdGhlIG5hbWVkIG1vZGVzIGxvb2t1cCBjb2RlIGluIG9yZGVyIHRvCj4gYmUgYSBiaXQgbW9y
ZSByb2J1c3QuCj4KPiBIb3dldmVyLCBldmVuIHRob3VnaCB0aGUgY2hhciBwb2ludGVycyB3ZXJl
IG1hZGUgY29uc3QsIHRoZSBkYXRhIHRoZXkgd2VyZQo+IHBvaW50aW5nIHdlcmUgbm90LiBMZXQn
cyBmaXggdGhhdC4KCk9yIHJhdGhlciwgdGhlIGNoYXIgcG9pbnRlcnMgd2VyZSBjb25zdCwgYW5k
IHRoZXkgcG9pbnRlZCBhdCBjb25zdApzdHJpbmcgbGl0ZXJhbHMsIGJ1dCB0aGUgYXJyYXkgb2Yg
cG9pbnRlcnMgaXRzZWxmIHdhcyBub3QgY29uc3QuCgpSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4KCj4gRml4ZXM6IDM3NjQxMzc5MDZhNSAoImRybS9tb2Rl
czogSW50cm9kdWNlIGEgd2hpdGVsaXN0IGZvciB0aGUgbmFtZWQgbW9kZXMiKQo+IFN1Z2dlc3Rl
ZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4gaW5kZXggODU4YzY3Mjgx
NTE4Li44ODIzMjY5OGQ3YTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4gQEAgLTE2NzcsNyArMTY3
Nyw3IEBAIHN0YXRpYyBpbnQgZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKGNoYXIgKnN0
ciwgc2l6ZV90IGxlbiwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3QgY2hh
ciAqZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdFtdID0gewo+ICtzdGF0aWMgY29uc3QgY2hhciAq
IGNvbnN0IGRybV9uYW1lZF9tb2Rlc193aGl0ZWxpc3RbXSA9IHsKPiAgCSJOVFNDIiwKPiAgCSJQ
QUwiLAo+ICB9OwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
