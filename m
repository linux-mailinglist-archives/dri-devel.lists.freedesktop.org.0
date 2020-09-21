Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89D272187
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 12:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB886E262;
	Mon, 21 Sep 2020 10:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571596E261;
 Mon, 21 Sep 2020 10:55:38 +0000 (UTC)
IronPort-SDR: BtNQrFXWkWRgZFv7mS89r2/W/6MZ7MkW6AAs3omI0YjHoNcLdQrZZep1j1jVOn38KQK1JjPXbg
 YnhFMVA2IYpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="221943897"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="221943897"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:55:30 -0700
IronPort-SDR: UUsQHus3iOILAthinmW+BKhi9MFDzKizkrv7wdwexKg6ne+0LUd8iJuRucrGdSV2Ktptrcy+dP
 qP9dcsfSoZCQ==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485393573"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.252.173.129])
 ([10.252.173.129])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:55:27 -0700
Subject: Re: [PATCH v9 7/8] Documentation/gpu: Add asynchronous flip
 documentation for i915
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
 <20200916150824.15749-8-karthik.b.s@intel.com>
 <20200918115840.GL6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <741fab03-b726-ed06-db1b-172f3ce525cd@intel.com>
Date: Mon, 21 Sep 2020 16:25:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918115840.GL6112@intel.com>
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

CgpPbiA5LzE4LzIwMjAgNToyOCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFdlZCwg
U2VwIDE2LCAyMDIwIGF0IDA4OjM4OjIzUE0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBB
ZGQgdGhlIGRldGFpbHMgb2YgdGhlIGltcGxlbWVudGF0aW9uIG9mIGFzeW5jaHJvbm91cyBmbGlw
cyBmb3IgaTkxNS4KPj4KPj4gdjc6IC1SZWJhc2VkLgo+Pgo+PiB2ODogLVJlYmFzZWQuCj4+Cj4+
IHY5OiAtUmViYXNlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsu
Yi5zQGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0
YS5rdWxrYXJuaUBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgIERvY3VtZW50YXRpb24vZ3B1L2k5MTUu
cnN0IHwgNiArKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L2k5MTUucnN0Cj4+IGluZGV4IDMzY2M2ZGRmOGY2NC4uODRlYWQ1MDhmN2FkIDEwMDY0NAo+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2dwdS9pOTE1LnJzdAo+PiBAQCAtMTE4LDYgKzExOCwxMiBAQCBBdG9taWMgUGxhbmUgSGVscGVy
cwo+PiAgIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2F0b21pY19wbGFuZS5jCj4+ICAgICAgOmludGVybmFsOgo+PiAgIAo+PiArQXN5bmNocm9ub3Vz
IFBhZ2UgRmxpcAo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiArCj4+ICsuLiBrZXJuZWwt
ZG9jOjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPj4gKyAg
IDpkb2M6IGFzeW5jaHJvbm91cyBmbGlwIGltcGxlbWVudGF0aW9uCj4gCj4gQSBiaXQgd2VpcmQg
aGF2aW5nIHRoaXMgaW4gb25lIHBhdGNoIGJ1dCB0aGUgYWN0dWFsIGRvY3MgaW4gdGhlIG90aGVy
Lgo+IEkgZ3Vlc3MganVzdCBzcXVhc2ggdGhlbSB0b2dldGhlciwgb3IgZXh0cmFjdCB0aGUgZG9j
cyBmcm9tIHRoZSBvdGhlcgo+IHBhdGNoIGludG8gdGhpcyBvbmU/Cj4gCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXcuClN1cmUsIEknbGwgbW92ZSBhbGwgdGhlIGRvYyBjaGFuZ2VzIHRvIHRoaXMgcGF0
Y2guCgo+IEVpdGhlciB3YXkKPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKClRoYW5rcywKS2FydGhpay5CLlMKPj4gKwo+PiAg
IE91dHB1dCBQcm9iaW5nCj4+ICAgLS0tLS0tLS0tLS0tLS0KPj4gICAKPj4gLS0gCj4+IDIuMjIu
MAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
