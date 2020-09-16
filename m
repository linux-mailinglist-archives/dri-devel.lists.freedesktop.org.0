Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B526C2D3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1576EA03;
	Wed, 16 Sep 2020 12:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9FF6EA02;
 Wed, 16 Sep 2020 12:38:36 +0000 (UTC)
IronPort-SDR: khp3QJHz0g2imH60GwMdxEVr0iCvvc114nIH+RYiRZSF2sZ6tvXYLwO59ZXID8dzI2LDxtmcqB
 1qPVbSwBytTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147203828"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="147203828"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 05:38:36 -0700
IronPort-SDR: 4TVjbfGD3Pe+livWv/9a99IT4vC4OVN2GNBzle+9qzTlAq0USoBsmFHowadGzMISwDShRX5LHF
 eutXkeAjbMvw==
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="483297350"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.213.73.60])
 ([10.213.73.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 05:38:33 -0700
Subject: Re: [PATCH v8 2/8] drm/i915: Add support for async flips in I915
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-3-karthik.b.s@intel.com>
 <20200915134828.GI6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <947c30e0-180d-d142-ca7e-b367f37119ec@intel.com>
Date: Wed, 16 Sep 2020 18:08:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915134828.GI6112@intel.com>
Content-Language: en-US
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzE1LzIwMjAgNzoxOCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIE1vbiwg
U2VwIDE0LCAyMDIwIGF0IDExOjI2OjI3QU0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBT
ZXQgdGhlIEFzeW5jIEFkZHJlc3MgVXBkYXRlIEVuYWJsZSBiaXQgaW4gcGxhbmUgY3RsCj4+IHdo
ZW4gYXN5bmMgZmxpcCBpcyByZXF1ZXN0ZWQuCj4+Cj4+IHYyOiAtTW92ZSB0aGUgQXN5bmMgZmxp
cCBlbmFibGVtZW50IHRvIGluZGl2aWR1YWwgcGF0Y2ggKFBhdWxvKQo+Pgo+PiB2MzogLVJlYmFz
ZWQuCj4+Cj4+IHY0OiAtQWRkIHNlcGFyYXRlIHBsYW5lIGhvb2sgZm9yIGFzeW5jIGZsaXAgY2Fz
ZSAoVmlsbGUpCj4+Cj4+IHY1OiAtUmViYXNlZC4KPj4KPj4gdjY6IC1Nb3ZlIHRoZSBwbGFuZSBo
b29rIHRvIHNlcGFyYXRlIHBhdGNoLiAoUGF1bG8pCj4+ICAgICAgLVJlbW92ZSB0aGUgZWFybHkg
cmV0dXJuIGluIHNrbF9wbGFuZV9jdGwuIChQYXVsbykKPj4KPj4gdjc6IC1Nb3ZlIGFzeW5jIGFk
ZHJlc3MgdXBkYXRlIGVuYWJsZSB0byBza2xfcGxhbmVfY3RsX2NydGMoKSAoVmlsbGUpCj4+Cj4+
IHY4OiAtUmViYXNlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsu
Yi5zQGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0
YS5rdWxrYXJuaUBpbnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpUaGFua3MgZm9yIHRoZSBSQi4KClRoYW5r
cywKS2FydGhpay5CLlMKPiAKPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmMgfCAzICsrKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
cmVnLmggICAgICAgICAgICAgIHwgMSArCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMKPj4gaW5kZXggNDg3MTJmYjBhMjUxLi4yOTAyZmVmZDIxN2YgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4+IEBAIC00Nzg1LDYgKzQ3
ODUsOSBAQCB1MzIgc2tsX3BsYW5lX2N0bF9jcnRjKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlKQo+PiAgIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYg
PSB0b19pOTE1KGNydGNfc3RhdGUtPnVhcGkuY3J0Yy0+ZGV2KTsKPj4gICAJdTMyIHBsYW5lX2N0
bCA9IDA7Cj4+ICAgCj4+ICsJaWYgKGNydGNfc3RhdGUtPnVhcGkuYXN5bmNfZmxpcCkKPj4gKwkJ
cGxhbmVfY3RsIHw9IFBMQU5FX0NUTF9BU1lOQ19GTElQOwo+PiArCj4+ICAgCWlmIChJTlRFTF9H
RU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpKQo+PiAgIAkJcmV0
dXJuIHBsYW5lX2N0bDsKPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfcmVnLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCj4+IGluZGV4IDkw
YTA1ZTM3YmEyZi4uMWM0ZGRkNGRlYmEwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3JlZy5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgK
Pj4gQEAgLTY5MjMsNiArNjkyMyw3IEBAIGVudW0gewo+PiAgICNkZWZpbmUgICBQTEFORV9DVExf
VElMRURfWAkJCSgxIDw8IDEwKQo+PiAgICNkZWZpbmUgICBQTEFORV9DVExfVElMRURfWQkJCSg0
IDw8IDEwKQo+PiAgICNkZWZpbmUgICBQTEFORV9DVExfVElMRURfWUYJCQkoNSA8PCAxMCkKPj4g
KyNkZWZpbmUgICBQTEFORV9DVExfQVNZTkNfRkxJUAkJCSgxIDw8IDkpCj4+ICAgI2RlZmluZSAg
IFBMQU5FX0NUTF9GTElQX0hPUklaT05UQUwJCSgxIDw8IDgpCj4+ICAgI2RlZmluZSAgIFBMQU5F
X0NUTF9NRURJQV9ERUNPTVBSRVNTSU9OX0VOQUJMRQkoMSA8PCA0KSAvKiBUR0wrICovCj4+ICAg
I2RlZmluZSAgIFBMQU5FX0NUTF9BTFBIQV9NQVNLCQkJKDB4MyA8PCA0KSAvKiBQcmUtR0xLICov
Cj4+IC0tIAo+PiAyLjIyLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
