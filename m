Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B45176D2
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7E10E02A;
	Mon,  2 May 2022 18:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808CD10F231;
 Mon,  2 May 2022 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651517299; x=1683053299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OS7wVN6FsZIpsdrb+pPc8ueVcajbbqorQEJRrZbTxew=;
 b=emyLdKZGDRBNKpI/+MI7H256H0K6u7hTL91Si0d4UbYDRxFFZ1EXYt3v
 eqQyyUCNK8AHjt2md/Jh1jboqlQaFwAzsp2UD3px3OtO6rJ2CfgxTz7LO
 WE9vgiDXu9u77fHSBryK0KvBlYjo7RJxJ9IbzoXJW2t6MrkdOr3N9IOF2
 ECgNAzmZb0CSe5VJGREaQthWlN9+j2mEXMGNOxEYHFksoVi09lGuAbMB0
 oYnbz1O7r19gx1vypxt6au6VTF/KiPci8g7rO+ixTMH4mh07VgCkQu8kr
 4fYj+bnIDcg3wt2SG5UgVO39TkeF5wS31tL6d+6TMTPvXO1XSWmpbYEbG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="327845411"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="327845411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="707733560"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 02 May 2022 11:48:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 11:48:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 11:48:17 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Mon, 2 May 2022 11:48:17 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 11/11] drm/i915/pvc: read fuses for link copy engines
Thread-Topic: [PATCH 11/11] drm/i915/pvc: read fuses for link copy engines
Thread-Index: AQHYXkKNdF4XsRFkbUmhmbjmGjSyjK0MY26A
Date: Mon, 2 May 2022 18:48:17 +0000
Message-ID: <4b3ccda4494a6b467297d95f148666860068b760.camel@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-12-matthew.d.roper@intel.com>
In-Reply-To: <20220502163417.2635462-12-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <63750D2CC3C7394EB8F1862974047D1A@intel.com>
Content-Transfer-Encoding: base64
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA1LTAyIGF0IDA5OjM0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBG
cm9tOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gDQo+IFRo
ZSBuZXcgTGluayBDb3B5IGVuZ2luZXMgaW4gUFZDIG1heSBiZSBmdXNlZCBvZmYgYWNjb3JkaW5n
IHRvIHRoZQ0KPiBtc2xpY2VfbWFzay4gRWFjaCBiaXQgb2YgdGhlIE1FTUwzX0VOX01BU0sgd2Ug
cmVhZCBmcm9tIHRoZQ0KPiBHRU4xMF9NSVJST1JfRlVTRTMgcmVnaXN0ZXIgZGlzYWJsZXMgYSBw
YWlyIG9mIGxpbmsgY29weSBlbmdpbmVzLg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IEJzcGVjOiA0NDQ4Mw0KPiBD
YzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jDQo+IGluZGV4IGM2ZTkz
ZGIxMzRiMS4uZDEwY2RlZmY1MDcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC9pbnRlbF9lbmdpbmVfY3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9lbmdpbmVfY3MuYw0KPiBAQCAtNjg2LDYgKzY4NiwzMyBAQCBzdGF0aWMgdm9pZCBlbmdp
bmVfbWFza19hcHBseV9jb21wdXRlX2Z1c2VzKHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ICAJfQ0K
PiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCBlbmdpbmVfbWFza19hcHBseV9jb3B5X2Z1c2VzKHN0
cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5
MTUgPSBndC0+aTkxNTsNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3RfaW5mbyAqaW5mbyA9ICZndC0+aW5m
bzsNCj4gKwl1bnNpZ25lZCBsb25nIG1lbWwzX21hc2s7DQo+ICsJdTggcXVhZDsNCj4gKw0KPiAr
CW1lbWwzX21hc2sgPSBpbnRlbF91bmNvcmVfcmVhZChndC0+dW5jb3JlLCBHRU4xMF9NSVJST1Jf
RlVTRTMpOw0KPiArCW1lbWwzX21hc2sgPSBSRUdfRklFTERfR0VUKEdFTjEyX01FTUwzX0VOX01B
U0ssIG1lbWwzX21hc2spOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBMaW5rIENvcHkgZW5naW5lcyBt
YXkgYmUgZnVzZWQgb2ZmIGFjY29yZGluZyB0byBtZW1sM19tYXNrLiBFYWNoDQo+ICsJICogYml0
IGlzIGEgcXVhZCB0aGF0IGhvdXNlcyAyIExpbmsgQ29weSBhbmQgdHdvIFN1YiBDb3B5IGVuZ2lu
ZXMuDQo+ICsJICovDQo+ICsJZm9yX2VhY2hfY2xlYXJfYml0KHF1YWQsICZtZW1sM19tYXNrLCBH
RU4xMl9NQVhfTVNMSUNFUykgew0KPiArCQlpbnRlbF9lbmdpbmVfbWFza190IG1hc2sgPSBHRU5N
QVNLKEJDUzEgKyBxdWFkICogMiArIDEsDQo+ICsJCQkJCQkgICBCQ1MxICsgcXVhZCAqIDIpOw0K
PiArDQo+ICsJCWlmIChtYXNrICYgaW5mby0+ZW5naW5lX21hc2spIHsNCj4gKwkJCWRybV9kYmco
Jmk5MTUtPmRybSwgImJjcyV1IGZ1c2VkIG9mZlxuIiwgcXVhZCAqIDIgKyAxKTsNCj4gKwkJCWRy
bV9kYmcoJmk5MTUtPmRybSwgImJjcyV1IGZ1c2VkIG9mZlxuIiwgcXVhZCAqIDIgKyAyKTsNCj4g
Kw0KPiArCQkJaW5mby0+ZW5naW5lX21hc2sgJj0gfm1hc2s7DQo+ICsJCX0NCj4gKwl9DQo+ICt9
DQo+ICsNCj4gIC8qDQo+ICAgKiBEZXRlcm1pbmUgd2hpY2ggZW5naW5lcyBhcmUgZnVzZWQgb2Zm
IGluIG91ciBwYXJ0aWN1bGFyIGhhcmR3YXJlLg0KPiAgICogTm90ZSB0aGF0IHdlIGhhdmUgYSBj
YXRjaC0yMiBzaXR1YXRpb24gd2hlcmUgd2UgbmVlZCB0byBiZSBhYmxlIHRvIGFjY2Vzcw0KPiBA
QCAtNzY4LDYgKzc5NSw3IEBAIHN0YXRpYyBpbnRlbF9lbmdpbmVfbWFza190IGluaXRfZW5naW5l
X21hc2soc3RydWN0IGludGVsX2d0ICpndCkNCj4gIAlHRU1fQlVHX09OKHZlYm94X21hc2sgIT0g
VkVCT1hfTUFTSyhndCkpOw0KPiAgDQo+ICAJZW5naW5lX21hc2tfYXBwbHlfY29tcHV0ZV9mdXNl
cyhndCk7DQo+ICsJZW5naW5lX21hc2tfYXBwbHlfY29weV9mdXNlcyhndCk7DQo+ICANCj4gIAly
ZXR1cm4gaW5mby0+ZW5naW5lX21hc2s7DQo+ICB9DQoNCg==
