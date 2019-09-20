Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B59B9014
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 14:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDF36E84B;
	Fri, 20 Sep 2019 12:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB196E84B;
 Fri, 20 Sep 2019 12:57:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 05:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="189927453"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by orsmga003.jf.intel.com with ESMTP; 20 Sep 2019 05:57:00 -0700
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
 IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 20 Sep 2019 13:56:59 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 IRSMSX156.ger.corp.intel.com ([169.254.3.246]) with mapi id 14.03.0439.000;
 Fri, 20 Sep 2019 13:56:59 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 03/12] drm/i915: Fix AVI infoframe
 quantization range for YCbCr output
Thread-Topic: [Intel-gfx] [PATCH 03/12] drm/i915: Fix AVI infoframe
 quantization range for YCbCr output
Thread-Index: AQHVPXhI7fbfTbn7JUq8OLg4QwDiqKc02g6A
Date: Fri, 20 Sep 2019 12:56:59 +0000
Message-ID: <62819f02275cfe1bbeefa8082ac16c6667175b6a.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-4-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.135]
Content-ID: <3449A75BEAE4924A90A361888C7CA20A@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE3OjUwICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gV2UncmUgY29uZmlndXJpbmcgdGhlIEFWSSBpbmZvZnJhbWUgcXVhbnRpemF0aW9uIHJh
bmdlIGJpdHMgYXMgaWYNCj4gd2UncmUgYWx3YXlzIHRyYW5zbWl0dGluZyBSR0IgcGl4ZWxzLiBM
ZXQncyBmaXggdGhpcyBzbyB0aGF0IHdlDQo+IGNvcnJlY3RseSBpbmRpY2F0ZSBsaW1pdGVkIHJh
bmdlIFlDQyBxdWFudGl6YXRpb24gcmFuZ2Ugd2hlbg0KPiB0cmFuc21pdHRpbmcgWUNiQ3IgaW5z
dGVhZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9oZG1pLmMgfCAxNSArKysrKysrKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMNCj4gaW5kZXggOWJmMjhkZTEwNDAxLi5iODEwMGNm
MjFkZDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
aGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5j
DQo+IEBAIC03MjQsMTEgKzcyNCwxNiBAQCBpbnRlbF9oZG1pX2NvbXB1dGVfYXZpX2luZm9mcmFt
ZShzdHJ1Y3QNCj4gaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gIA0KPiAgCWRybV9oZG1pX2F2
aV9pbmZvZnJhbWVfY29sb3JzcGFjZShmcmFtZSwgY29ubl9zdGF0ZSk7DQo+ICANCj4gLQlkcm1f
aGRtaV9hdmlfaW5mb2ZyYW1lX3F1YW50X3JhbmdlKGZyYW1lLCBjb25uZWN0b3IsDQo+IC0JCQkJ
CSAgIGFkanVzdGVkX21vZGUsDQo+IC0JCQkJCSAgIGNydGNfc3RhdGUtDQo+ID5saW1pdGVkX2Nv
bG9yX3JhbmdlID8NCj4gLQkJCQkJICAgSERNSV9RVUFOVElaQVRJT05fUkFOR0VfTElNSQ0KPiBU
RUQgOg0KPiAtCQkJCQkgICBIRE1JX1FVQU5USVpBVElPTl9SQU5HRV9GVUxMDQo+ICk7DQo+ICsJ
aWYgKGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgPT0gSU5URUxfT1VUUFVUX0ZPUk1BVF9SR0Ip
IHsNCj4gKwkJZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZShmcmFtZSwgY29ubmVj
dG9yLA0KPiArCQkJCQkJICAgYWRqdXN0ZWRfbW9kZSwNCj4gKwkJCQkJCSAgIGNydGNfc3RhdGUt
DQo+ID5saW1pdGVkX2NvbG9yX3JhbmdlID8NCj4gKwkJCQkJCSAgIEhETUlfUVVBTlRJWkFUSU9O
X1JBDQo+IE5HRV9MSU1JVEVEIDoNCj4gKwkJCQkJCSAgIEhETUlfUVVBTlRJWkFUSU9OX1JBDQo+
IE5HRV9GVUxMKTsNCj4gKwl9IGVsc2Ugew0KPiArCQlmcmFtZS0+cXVhbnRpemF0aW9uX3Jhbmdl
ID0NCj4gSERNSV9RVUFOVElaQVRJT05fUkFOR0VfREVGQVVMVDsNCj4gKwkJZnJhbWUtPnljY19x
dWFudGl6YXRpb25fcmFuZ2UgPQ0KPiBIRE1JX1lDQ19RVUFOVElaQVRJT05fUkFOR0VfTElNSVRF
RDsNCj4gKwl9DQo+ICANCj4gIAlkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2NvbnRlbnRfdHlwZShm
cmFtZSwgY29ubl9zdGF0ZSk7DQo+ICANClRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4NClJl
dmlld2VkLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
