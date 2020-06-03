Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3671ED80D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 23:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA4189830;
	Wed,  3 Jun 2020 21:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C894A89830;
 Wed,  3 Jun 2020 21:27:58 +0000 (UTC)
IronPort-SDR: iFAWE4Lgrnkouex1LrWfq9WQVpx19kI34MVnPIgg0xaKnjreQzu/yIhdqdWStWwOnw7cYXOZjO
 bsTMvGAYqfpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 14:27:58 -0700
IronPort-SDR: +0FsywpYr4PxEka/NGXLzjv7VPmnOeewvJzMgwlL7/swG5ePYIRDXJ3x2t1OR13XLIIgg4BpPJ
 rEUpHECPp5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,469,1583222400"; d="scan'208";a="471280365"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 03 Jun 2020 14:27:57 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 3 Jun 2020 14:27:57 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.9]) by
 FMSMSX113.amr.corp.intel.com ([169.254.13.180]) with mapi id 14.03.0439.000;
 Wed, 3 Jun 2020 14:27:56 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/dp_mst: Sanitize mgr->qlock locking
 in drm_dp_mst_wait_tx_reply()
Thread-Topic: [Intel-gfx] [PATCH 2/3] drm/dp_mst: Sanitize mgr->qlock
 locking in drm_dp_mst_wait_tx_reply()
Thread-Index: AQHWOet4yJe728h7YEyCqk5Hu22u3qjH3ZOA
Date: Wed, 3 Jun 2020 21:27:56 +0000
Message-ID: <e7abd54653ae305f9df136e487951dd940f07ae2.camel@intel.com>
References: <20200603211040.8190-1-imre.deak@intel.com>
 <20200603211040.8190-2-imre.deak@intel.com>
In-Reply-To: <20200603211040.8190-2-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.182.158]
Content-ID: <31A0699DFAD0544087D765F716FAD84C@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA2LTA0IGF0IDAwOjEwICswMzAwLCBJbXJlIERlYWsgd3JvdGU6DQo+IE1h
a2UgdGhlIGxvY2tpbmcgbG9vayBzeW1tZXRyaWMgd2l0aCB0aGUgdW5sb2NraW5nLg0KPiANCg0K
UmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
Pg0KDQo+IFNpZ25lZC1vZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gaW5kZXggMWJkZjNjZmVlZWJiLi41YmM3
MmU4MDBiODUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiBA
QCAtMTE4Myw3ICsxMTgzLDcgQEAgc3RhdGljIGludCBkcm1fZHBfbXN0X3dhaXRfdHhfcmVwbHko
c3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLA0KPiAgCXJldCA9IHdhaXRfZXZlbnRfdGlt
ZW91dChtZ3ItPnR4X3dhaXRxLA0KPiAgCQkJCSBjaGVja190eG1zZ19zdGF0ZShtZ3IsIHR4bXNn
KSwNCj4gIAkJCQkgKDQgKiBIWikpOw0KPiAtCW11dGV4X2xvY2soJm1zdGItPm1nci0+cWxvY2sp
Ow0KPiArCW11dGV4X2xvY2soJm1nci0+cWxvY2spOw0KPiAgCWlmIChyZXQgPiAwKSB7DQo+ICAJ
CWlmICh0eG1zZy0+c3RhdGUgPT0gRFJNX0RQX1NJREVCQU5EX1RYX1RJTUVPVVQpIHsNCj4gIAkJ
CXJldCA9IC1FSU87DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
