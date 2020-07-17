Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39904223D60
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 15:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A656EC7A;
	Fri, 17 Jul 2020 13:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924646EC7A;
 Fri, 17 Jul 2020 13:54:43 +0000 (UTC)
IronPort-SDR: mcTztTu54ZPCyHpRd7x9dEZWHaoFq8MRQN4929vaXDB+FOr1DJPhNIc45pDU6Z2YCvbf+q5lGC
 ipb05wQvByLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="214304244"
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="214304244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 06:54:42 -0700
IronPort-SDR: 1DE6JHLS0jmQphB5rtxkSKoB918oKzEBJDeFXp4wLJs12CnZGuPKTwR4xcjDhCwdMhRP+47czv
 Qu+k97VSzQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="326848245"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 17 Jul 2020 06:54:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Jul 2020 16:54:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/todo: Plumb drm_atomic_state all over
Date: Fri, 17 Jul 2020 16:54:39 +0300
Message-Id: <20200717135439.5996-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIFRPRE8gZm9yIHBsdW1iaW5nIGRybV9hdG9taWNfc3RhdGUgYWxsIG92ZXIgdG8gZWFzZQp0
aGUgaHVyZGxlcyBvZiBhY2Nlc3NpbmcgYWRkaXRpb25hbCBvYmplY3Qgc3RhdGVzLgoKUmV2aWV3
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ICNpcmMKU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDQ2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUv
dG9kby5yc3QKaW5kZXggNzk2OWYxMDY4NzdkLi5iMGVhMTdkYThmZjYgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0
CkBAIC00MDMsNiArNDAzLDUyIEBAIENvbnRhY3Q6IEVtaWwgVmVsaWtvdiwgcmVzcGVjdGl2ZSBk
cml2ZXIgbWFpbnRhaW5lcnMKIAogTGV2ZWw6IEludGVybWVkaWF0ZQogCitQbHVtYiBkcm1fYXRv
bWljX3N0YXRlIGFsbCBvdmVyCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK0N1
cnJlbnRseSB2YXJpb3VzIGF0b21pYyBmdW5jdGlvbnMgdGFrZSBqdXN0IGEgc2luZ2xlIG9yIGEg
aGFuZGZ1bCBvZgorb2JqZWN0IHN0YXRlcyAoZWcuIHBsYW5lIHN0YXRlKS4gV2hpbGUgdGhhdCBz
aW5nbGUgb2JqZWN0IHN0YXRlIGNhbgorc3VmZmljZSBmb3Igc29tZSBzaW1wbGUgY2FzZXMsIHdl
IG9mdGVuIGhhdmUgdG8gZGlnIG91dCBhZGRpdGlvbmFsCitvYmplY3Qgc3RhdGVzIGZvciBkZWFs
aW5nIHdpdGggdmFyaW91cyBkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGUgaW5kaXZpZHVhbAorb2Jq
ZWN0cyBvciB0aGUgaGFyZHdhcmUgdGhleSByZXByZXNlbnQuIFRoZSBwcm9jZXNzIG9mIGRpZ2dp
bmcgb3V0IHRoZQorYWRkaXRpb25hbCBzdGF0ZXMgaXMgcmF0aGVyIG5vbi1pbnR1aXRpdmUgYW5k
IGVycm9yIHByb25lLgorCitUbyBmaXggdGhhdCBtb3N0IGZ1bmN0aW9ucyBzaG91bGQgcmF0aGVy
IHRha2UgdGhlIG92ZXJhbGwKK2RybV9hdG9taWNfc3RhdGUgYXMgb25lIG9mIHRoZWlyIHBhcmFt
ZXRlcnMuIFRoZSBvdGhlciBwYXJhbWV0ZXJzCit3b3VsZCBnZW5lcmFsbHkgYmUgdGhlIG9iamVj
dChzKSB3ZSBtYWlubHkgd2FudCB0byBpbnRlcmFjdCB3aXRoLgorCitGb3IgZXhhbXBsZSwgaW5z
dGVhZCBvZgorCisuLiBjb2RlLWJsb2NrOjogYworCisgICBpbnQgKCphdG9taWNfY2hlY2spKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSk7CisK
K3dlIHdvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2UKKworLi4gY29kZS1ibG9jazo6IGMKKworICAg
aW50ICgqYXRvbWljX2NoZWNrKShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlKTsKKworVGhlIGltcGxlbWVudGF0aW9uIGNhbiB0aGVuIHRyaXZp
YWxseSBnYWluIGFjY2VzcyB0byBhbnkgcmVxdWlyZWQgb2JqZWN0CitzdGF0ZShzKSB2aWEgZHJt
X2F0b21pY19nZXRfcGxhbmVfc3RhdGUoKSwgZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRl
KCksCitkcm1fYXRvbWljX2dldF9vbGRfcGxhbmVfc3RhdGUoKSwgYW5kIHRoZWlyIGVxdWl2YWxl
bnRzIGZvcgorb3RoZXIgb2JqZWN0IHR5cGVzLgorCitBZGRpdGlvbmFsbHkgbWFueSBkcml2ZXJz
IGN1cnJlbnRseSBhY2Nlc3MgdGhlIG9iamVjdC0+c3RhdGUgcG9pbnRlcgorZGlyZWN0bHkgaW4g
dGhlaXIgY29tbWl0IGZ1bmN0aW9ucy4gVGhhdCBpcyBub3QgZ29pbmcgdG8gd29yayBpZiB3ZQor
ZWcuIHdhbnQgdG8gYWxsb3cgZGVlcGVyIGNvbW1pdCBwaXBlbGluZXMgYXMgdGhvc2UgcG9pbnRl
cnMgY291bGQKK3RoZW4gcG9pbnQgdG8gdGhlIHN0YXRlcyBjb3JyZXNwb25kaW5nIHRvIGEgZnV0
dXJlIGNvbW1pdCBpbnN0ZWFkIG9mCit0aGUgY3VycmVudCBjb21taXQgd2UncmUgdHJ5aW5nIHRv
IHByb2Nlc3MuIEFsc28gbm9uLWJsb2NraW5nIGNvbW1pdHMKK2V4ZWN1dGUgbG9ja2xlc3NseSBz
byB0aGVyZSBhcmUgc2VyaW91cyBjb25jZXJucyB3aXRoIGRlcmVmZXJlbmNpbmcKK3RoZSBvYmpl
Y3QtPnN0YXRlIHBvaW50ZXJzIHdpdGhvdXQgaG9sZGluZyB0aGUgbG9ja3MgdGhhdCBwcm90ZWN0
IHRoZW0uCitVc2Ugb2YgZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKCksIGRybV9hdG9t
aWNfZ2V0X29sZF9wbGFuZV9zdGF0ZSgpLAorZXRjLiBhdm9pZHMgdGhlc2UgcHJvYmxlbXMgYXMg
d2VsbCBzaW5jZSB0aGV5IHJlbGF0ZSB0byBhIHNwZWNpZmljCitjb21taXQgdmlhIHRoZSBwYXNz
ZWQgaW4gZHJtX2F0b21pY19zdGF0ZS4KKworQ29udGFjdDogVmlsbGUgU3lyasOkbMOkLCBEYW5p
ZWwgVmV0dGVyCisKK0xldmVsOiBJbnRlcm1lZGlhdGUKKwogCiBDb3JlIHJlZmFjdG9yaW5ncwog
PT09PT09PT09PT09PT09PT0KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
