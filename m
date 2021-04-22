Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A2367F29
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 13:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F106E093;
	Thu, 22 Apr 2021 11:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916AE6E086;
 Thu, 22 Apr 2021 11:00:04 +0000 (UTC)
IronPort-SDR: rXRu+7U1yvb5YlXHJpkFQUW4JCe+wFIzYPtm7jKLgTZQ62Np+3IlusVdSIRWmX9DGekOR5TSvD
 OcENmyBN9wkA==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="175351481"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="175351481"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 04:00:04 -0700
IronPort-SDR: QcsPnFVxMOMfczltbOOo0tKpCqLtt8s+MajEzlZ7otc3p2wxrwTJqtYkGOY5OCjXFqRYhQ5ReS
 U3W21G6d8WPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="535170792"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga004.jf.intel.com with ESMTP; 22 Apr 2021 04:00:03 -0700
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 12:00:02 +0100
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.2106.013;
 Thu, 22 Apr 2021 12:00:02 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach
 eDP spec
Thread-Topic: [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach
 eDP spec
Thread-Index: AQHXNvmmM+/kB8eJT0OdPEH4OLLO8KrATpGA
Date: Thu, 22 Apr 2021 11:00:02 +0000
Message-ID: <c59186be4be98826c8fe5e88e0032cdf6a16025b.camel@intel.com>
References: <20210421220224.200729-1-jose.souza@intel.com>
In-Reply-To: <20210421220224.200729-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-ID: <7581C2160260B1438D71FDDBD0E04150@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZWQgbmFtZSBsb29rcyBtb3JlIGFjY3VyYXRlIHRvIHRoZSBlZHAgMS40YiBzcGVj
Lg0KTG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dh
bi1neWVvbmcubXVuQGludGVsLmNvbT4NCg0KT24gV2VkLCAyMDIxLTA0LTIxIGF0IDE1OjAyIC0w
NzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIHdyb3RlOg0KPiBEUF9QU1JfRU5fQ0ZHIGJpdCA1
IGFrYSAiU2VsZWN0aXZlIFVwZGF0ZSBSZWdpb24gU2NhbiBMaW5lIENhcHR1cmUNCj4gSW5kaWNh
dGlvbiIgaW4gZURQIHNwZWMgaGFzIGEgYW1iaWd1b3VzIG5hbWUsIHNvIHJlbmFtaW5nIHRvIGJl
dHRlcg0KPiBtYXRjaCBzcGVjaWZpY2F0aW9uLg0KPiANCj4gV2hpbGUgYXQgaXQsIHJlcGxhY2lu
ZyBiaXQgc2hpdCBieSBCSVQoKSBtYWNybyBhbmQgYWRkaW5nIHRoZSB2ZXJzaW9uDQo+IHNvbWUg
cmVnaXN0ZXJzIHdlcmUgYWRkZWQgdG8gZURQIHNwZWNpZmljYXRpb24uDQo+IA0KPiBDYzogPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwu
Y29tPg0KPiBDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4NCj4gLS0tDQo+IMKgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgMTYgKysrKysr
KystLS0tLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+IGluZGV4IDFlODVjMjAyMWYyZi4uZDZmNmEw
ODRhMTkwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+IEBAIC02ODcsMTQgKzY4NywxNCBAQCBz
dHJ1Y3QgZHJtX2RldmljZTsNCj4gwqAjZGVmaW5lIERQX0RTQ19FTkFCTEXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE2MMKgwqAgLyogRFAgMS40ICovDQo+
IMKgIyBkZWZpbmUgRFBfREVDT01QUkVTU0lPTl9FTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoMSA8PCAwKQ0KPiDCoA0KPiAtI2RlZmluZSBEUF9QU1JfRU5fQ0ZHwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTcwwqDCoCAvKiBYWFggMS4yPyAqLw0K
PiAtIyBkZWZpbmUgRFBfUFNSX0VOQUJMRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKDEgPDwgMCkNCj4gLSMgZGVmaW5lIERQX1BTUl9NQUlOX0xJTktfQUNUSVZFwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMSkNCj4gLSMgZGVmaW5lIERQX1BTUl9DUkNfVkVSSUZJ
Q0FUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMikNCj4gLSMgZGVmaW5lIERQX1BTUl9G
UkFNRV9DQVBUVVJFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMykNCj4gLSMgZGVm
aW5lIERQX1BTUl9TRUxFQ1RJVkVfVVBEQVRFwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgNCkN
Cj4gLSMgZGVmaW5lIERQX1BTUl9JUlFfSFBEX1dJVEhfQ1JDX0VSUk9SU8KgwqDCoMKgICgxIDw8
IDUpDQo+IC0jIGRlZmluZSBEUF9QU1JfRU5BQkxFX1BTUjLCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKDEgPDwgNikgLyogZURQIDEuNGEgKi8NCj4gKyNkZWZpbmUgRFBfUFNSX0VOX0NG
R8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDE3
MMKgwqAgLyogWFhYIDEuMj8gKi8NCj4gKyMgZGVmaW5lIERQX1BTUl9FTkFCTEXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgwKQ0KPiArIyBkZWZp
bmUgRFBfUFNSX01BSU5fTElOS19BQ1RJVkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBC
SVQoMSkNCj4gKyMgZGVmaW5lIERQX1BTUl9DUkNfVkVSSUZJQ0FUSU9OwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgQklUKDIpDQo+ICsjIGRlZmluZSBEUF9QU1JfRlJBTUVfQ0FQVFVSRcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgzKQ0KPiArIyBkZWZpbmUgRFBf
UFNSX1NVX1JFR0lPTl9TQ0FOTElORV9DQVBUVVJFwqDCoMKgwqDCoEJJVCg0KSAvKiBlRFAgMS40
YSAqLw0KPiArIyBkZWZpbmUgRFBfUFNSX0lSUV9IUERfV0lUSF9DUkNfRVJST1JTwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoNSkgLyogZURQDQo+IDEuNGEgKi8NCj4gKyMgZGVm
aW5lIERQX1BTUl9FTkFCTEVfUFNSMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBCSVQoNikgLyogZURQIDEuNGEgKi8NCj4gwqANCj4gwqAjZGVmaW5lIERQX0FEQVBURVJf
Q1RSTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDFhMA0KPiDCoCMgZGVmaW5lIERQX0FEQVBURVJfQ1RSTF9GT1JDRV9MT0FEX1NFTlNFwqDC
oCAoMSA8PCAwKQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
