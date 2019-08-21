Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0EB97D89
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D49A6E94D;
	Wed, 21 Aug 2019 14:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAD06E94D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:47:39 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 07:47:39 -0700
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="183554903"
Received: from ideak-desk.fi.intel.com ([10.237.68.142])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 07:47:37 -0700
Date: Wed, 21 Aug 2019 17:46:39 +0300
From: Imre Deak <imre.deak@intel.com>
To: Simon Ser <simon.ser@intel.com>
Subject: Re: [PATCH] drm/i915: add port info to debugfs
Message-ID: <20190821144639.GC1158@ideak-desk.fi.intel.com>
References: <20190821141554.18347-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821141554.18347-1-simon.ser@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDU6MTU6NTRQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkcyBhIGxpbmUgd2l0aCB0aGUgcG9ydCBuYW1lIHRvIGNvbm5lY3Rv
cnMgaW4KPiBkZWJ1Z2ZzL2k5MTZfZGlzcGxheV9pbmZvLiBBIGhpbnQgaXMgcHJpbnRlZCBpZiB0
aGUgcG9ydCBpcyB0eXBlLUMuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5z
ZXJAaW50ZWwuY29tPgo+IENjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIHwgOSArKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZGVidWdmcy5jCj4gaW5kZXggYjM5MjI2ZDdmOGQyLi43MThhMzM3YzhmMGEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwo+IEBAIC0yNTU3LDkgKzI1NTcsMTEgQEAgc3RhdGlj
IHZvaWQgaW50ZWxfbHZkc19pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwKPiAgc3RhdGljIHZvaWQg
aW50ZWxfY29ubmVjdG9yX2luZm8oc3RydWN0IHNlcV9maWxlICptLAo+ICAJCQkJIHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiArCXN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICppOTE1ID0gdG9faTkxNShjb25uZWN0b3ItPmRldik7Cj4gIAlzdHJ1Y3QgaW50ZWxfY29ubmVj
dG9yICppbnRlbF9jb25uZWN0b3IgPSB0b19pbnRlbF9jb25uZWN0b3IoY29ubmVjdG9yKTsKPiAg
CXN0cnVjdCBpbnRlbF9lbmNvZGVyICppbnRlbF9lbmNvZGVyID0gaW50ZWxfY29ubmVjdG9yLT5l
bmNvZGVyOwo+ICAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7Cj4gKwllbnVtIHRjX3Bv
cnQgdGNfcG9ydDsKPiAKPiAgCXNlcV9wcmludGYobSwgImNvbm5lY3RvciAlZDogdHlwZSAlcywg
c3RhdHVzOiAlc1xuIiwKPiAgCQkgICBjb25uZWN0b3ItPmJhc2UuaWQsIGNvbm5lY3Rvci0+bmFt
ZSwKPiBAQCAtMjU3OCw2ICsyNTgwLDEzIEBAIHN0YXRpYyB2b2lkIGludGVsX2Nvbm5lY3Rvcl9p
bmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwKPiAgCWlmICghaW50ZWxfZW5jb2RlcikKPiAgCQlyZXR1
cm47Cj4gCj4gKwlpZiAoaW50ZWxfZW5jb2Rlci0+cG9ydCAhPSBQT1JUX05PTkUpIHsKPiArCQl0
Y19wb3J0ID0gaW50ZWxfcG9ydF90b190YyhpOTE1LCBpbnRlbF9lbmNvZGVyLT5wb3J0KTsKPiAr
CQlzZXFfcHJpbnRmKG0sICJcdHBvcnQ6ICVjJXNcbiIsCj4gKwkJCSAgIHBvcnRfbmFtZShpbnRl
bF9lbmNvZGVyLT5wb3J0KSwKPiArCQkJICAgdGNfcG9ydCAhPSBQT1JUX1RDX05PTkUgPyAiICh0
eXBlLUMpIiA6ICIiKTsKCmZvciBUeXBlLUMgcG9ydHMgY291bGQgeW91IGFsc28gcHJpbnQgdGhl
IHR5cGUtQyBwb3J0IGluZGV4IGxpa2UKCglwb3J0OiBDL1RDIzEKCj8gU2VlIGludGVsX3RjX3Bv
cnRfaW5pdCgpLgoKCj4gKwl9Cj4gKwo+ICAJc3dpdGNoIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90
eXBlKSB7Cj4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDoKPiAgCWNhc2Ug
RFJNX01PREVfQ09OTkVDVE9SX2VEUDoKPiAtLQo+IDIuMjIuMQo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
