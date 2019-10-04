Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1949ACBA54
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9F36EB63;
	Fri,  4 Oct 2019 12:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43406EB62
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 12:24:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 05:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="196652711"
Received: from bolinth-mobl.ger.corp.intel.com (HELO [10.252.38.74])
 ([10.252.38.74])
 by orsmga006.jf.intel.com with ESMTP; 04 Oct 2019 05:24:54 -0700
Subject: Re: [PATCH] drm/drm_syncobj: Dead code removal
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20191004121652.5940-1-zbigniew.kempczynski@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <a1b85bc1-46a8-9978-995f-f081c52594e5@intel.com>
Date: Fri, 4 Oct 2019 15:25:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004121652.5940-1-zbigniew.kempczynski@intel.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQvMTAvMjAxOSAxNToxNiwgWmJpZ25pZXcgS2VtcGN6ecWEc2tpIHdyb3RlOgo+IFJlbW92
ZSBkZWFkIGNvZGUsIGxpa2VseSBvdmVyc2VlbmVkIGR1cmluZyByZXZpZXcgcHJvY2Vzcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5z
a2lAaW50ZWwuY29tPgo+IENjOiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEphc29uIEVrc3RyYW5k
IDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jIHwgNCAtLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3luY29iai5jCj4gaW5kZXggNGI1YzdiMGVkNzE0Li4yMWEyMmUzOWM5ZmEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYwo+IEBAIC0xOTIsOCArMTkyLDYgQEAgc3RhdGljIHZvaWQgZHJt
X3N5bmNvYmpfZmVuY2VfYWRkX3dhaXQoc3RydWN0IGRybV9zeW5jb2JqICpzeW5jb2JqLAo+ICAg
CWlmICghZmVuY2UgfHwgZG1hX2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8oJmZlbmNlLCB3YWl0LT5w
b2ludCkpIHsKPiAgIAkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gICAJCWxpc3RfYWRkX3RhaWwo
JndhaXQtPm5vZGUsICZzeW5jb2JqLT5jYl9saXN0KTsKPiAtCX0gZWxzZSBpZiAoIWZlbmNlKSB7
Cj4gLQkJd2FpdC0+ZmVuY2UgPSBkbWFfZmVuY2VfZ2V0X3N0dWIoKTsKPiAgIAl9IGVsc2Ugewo+
ICAgCQl3YWl0LT5mZW5jZSA9IGZlbmNlOwo+ICAgCX0KPiBAQCAtODU2LDggKzg1NCw2IEBAIHN0
YXRpYyB2b2lkIHN5bmNvYmpfd2FpdF9zeW5jb2JqX2Z1bmMoc3RydWN0IGRybV9zeW5jb2JqICpz
eW5jb2JqLAo+ICAgCWlmICghZmVuY2UgfHwgZG1hX2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8oJmZl
bmNlLCB3YWl0LT5wb2ludCkpIHsKPiAgIAkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gICAJCXJl
dHVybjsKPiAtCX0gZWxzZSBpZiAoIWZlbmNlKSB7Cj4gLQkJd2FpdC0+ZmVuY2UgPSBkbWFfZmVu
Y2VfZ2V0X3N0dWIoKTsKPiAgIAl9IGVsc2Ugewo+ICAgCQl3YWl0LT5mZW5jZSA9IGZlbmNlOwo+
ICAgCX0KCkxpa2UgQ2hyaXMgc2FpZCwgZG1hX2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8oKSB3aWxs
IHVwZGF0ZSB0aGUgZmVuY2UgCnBvaW50ZXIsIHNvIGEgc3Vic2VxdWVudCBjaGVjayBtaWdodCBu
b3QgYmUgZGVhbGluZyB3aXRoIHRoZSBzYW1lIHZhbHVlLgoKQSBiaXQgY2hlZWt5LCBidXQuLi4K
CgotTGlvbmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
