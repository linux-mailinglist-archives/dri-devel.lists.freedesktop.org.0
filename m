Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6229DAC
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 20:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC366E13C;
	Fri, 24 May 2019 18:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADF26E13C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 18:03:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 11:03:03 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost) ([10.252.46.194])
 by fmsmga001.fm.intel.com with ESMTP; 24 May 2019 11:03:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gen Zhang <blackgod016574@gmail.com>, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com
Subject: Re: [PATCH] drm_edid-load: Fix a missing-check bug in
 drm_load_edid_firmware()
In-Reply-To: <20190524023222.GA5302@zhanggen-UX430UQ>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190522123920.GB6772@zhanggen-UX430UQ>
 <87o93u7d3s.fsf@intel.com> <20190524023222.GA5302@zhanggen-UX430UQ>
Date: Fri, 24 May 2019 21:02:59 +0300
Message-ID: <87pno7n31o.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNCBNYXkgMjAxOSwgR2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+
IHdyb3RlOgo+IEluIGRybV9sb2FkX2VkaWRfZmlybXdhcmUoKSwgZndzdHIgaXMgYWxsb2NhdGVk
IGJ5IGtzdHJkdXAoKS4gQW5kIGZ3c3RyCj4gaXMgZGVyZWZlcmVuY2VkIGluIHRoZSBmb2xsb3dp
bmcgY29kZXMuIEhvd2V2ZXIsIG1lbW9yeSBhbGxvY2F0aW9uIAo+IGZ1bmN0aW9ucyBzdWNoIGFz
IGtzdHJkdXAoKSBtYXkgZmFpbCBhbmQgcmV0dXJucyBOVUxMLiBEZXJlZmVyZW5jaW5nIAo+IHRo
aXMgbnVsbCBwb2ludGVyIG1heSBjYXVzZSB0aGUga2VybmVsIGdvIHdyb25nLiBUaHVzIHdlIHNo
b3VsZCBjaGVjayAKPiB0aGlzIGtzdHJkdXAoKSBvcGVyYXRpb24uCj4gRnVydGhlciwgaWYga3N0
cmR1cCgpIHJldHVybnMgTlVMTCwgd2Ugc2hvdWxkIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pIHRv
Cj4gdGhlIGNhbGxlciBzaXRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VuIFpoYW5nIDxibGFja2dv
ZDAxNjU3NEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+CgpQdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzIGZvciB0aGUgcGF0
Y2guCgpCUiwKSmFuaS4KCj4gLS0tCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZF9sb2FkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5jCj4gaW5kZXggYTQ5
MTUwOS4uYTBlMTA3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9h
ZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYwo+IEBAIC0yOTAsNiAr
MjkwLDggQEAgc3RydWN0IGVkaWQgKmRybV9sb2FkX2VkaWRfZmlybXdhcmUoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCSAqIHRoZSBsYXN0IG9uZSBmb3VuZCBvbmUgYXMgYSBm
YWxsYmFjay4KPiAgCSAqLwo+ICAJZndzdHIgPSBrc3RyZHVwKGVkaWRfZmlybXdhcmUsIEdGUF9L
RVJORUwpOwo+ICsJaWYgKCFmd3N0cikKPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPiAg
CWVkaWRzdHIgPSBmd3N0cjsKPiAgCj4gIAl3aGlsZSAoKGVkaWRuYW1lID0gc3Ryc2VwKCZlZGlk
c3RyLCAiLCIpKSkgewo+IC0tLQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
