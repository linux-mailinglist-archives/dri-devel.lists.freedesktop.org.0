Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7327639E52C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4116E964;
	Mon,  7 Jun 2021 17:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A296E964;
 Mon,  7 Jun 2021 17:19:50 +0000 (UTC)
IronPort-SDR: oudmvHwT5JhENi6Yd0c2VC2MLteT3jICSRhFDzY+a7+qqJseyBQX6s5L9eITInej9nP+CALPpu
 Ln9E+2i6gQaA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="201646290"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="201646290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:19:49 -0700
IronPort-SDR: 4HeXbWujpVBs9EeyLE/hMU9ZHk1aixKsKb49ysYevJCJm4X31Plui13SmScTxrr0OCHNrSIlWj
 czcClR7PvoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="484850949"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2021 10:19:49 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 10:19:48 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 22:49:46 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Mon, 7 Jun 2021 22:49:46 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: RE: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
 attributes
Thread-Topic: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
 attributes
Thread-Index: AQHXVs8hSnwv/9woJ0GcfBgiln/9M6sAGuaAgAERibCAAnTRAIAFMypw
Date: Mon, 7 Jun 2021 17:19:46 +0000
Message-ID: <64e3d50625ba420a90e68b6359cdea65@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-2-uma.shankar@intel.com>
 <20210602123335.29045e06@eldfell>
 <2015b90626a04860808eb02fa5f8a117@intel.com>
 <f51cbf2d-69c7-bd7c-379a-a74724ad6d87@amd.com>
In-Reply-To: <f51cbf2d-69c7-bd7c-379a-a74724ad6d87@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="utf-8"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem, 
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSA0LCAyMDIxIDg6
NTMgUE0NCj4gVG86IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgUGVra2Eg
UGFhbGFuZW4NCj4gPHBwYWFsYW5lbkBnbWFpbC5jb20+DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBNb2RlbSwN
Cj4gQmhhbnVwcmFrYXNoIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDAxLzIxXSBkcm06IEFkZCBFbmhhbmNlZCBHYW1tYSBhbmQgY29sb3IgbHV0
IHJhbmdlDQo+IGF0dHJpYnV0ZXMNCj4gDQo+IE9uIDIwMjEtMDYtMDIgNDoyNiBwLm0uLCBTaGFu
a2FyLCBVbWEgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVuQGdtYWlsLmNvbT4NCj4gPj4g
U2VudDogV2VkbmVzZGF5LCBKdW5lIDIsIDIwMjEgMzowNCBQTQ0KPiA+PiBUbzogU2hhbmthciwg
VW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+PiBNb2Rl
bSwgQmhhbnVwcmFrYXNoIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiA+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIDAxLzIxXSBkcm06IEFkZCBFbmhhbmNlZCBHYW1tYSBhbmQgY29sb3Ig
bHV0DQo+ID4+IHJhbmdlIGF0dHJpYnV0ZXMNCj4gPj4NCj4gPj4gT24gVHVlLCAgMSBKdW4gMjAy
MSAxNjoyMTo1OCArMDUzMA0KPiA+PiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PiB3cm90ZToNCj4gPj4NCj4gPj4+IEV4aXN0aW5nIExVVCBwcmVjaXNpb24gc3RydWN0dXJlIGlz
IGhhdmluZyBvbmx5IDE2IGJpdCBwcmVjaXNpb24uDQo+ID4+PiBUaGlzIGlzIG5vdCBlbm91Z2gg
Zm9yIHVwY29taW5nIGVuaGFuY2VkIGhhcmR3YXJlcyBhbmQgYWR2YW5jZQ0KPiA+Pj4gdXNlY2Fz
ZXMgbGlrZSBIRFIgcHJvY2Vzc2luZy4gSGVuY2UgYWRkZWQgYSBuZXcgc3RydWN0dXJlIHdpdGgg
MzINCj4gPj4+IGJpdCBwcmVjaXNpb24gdmFsdWVzLg0KPiA+Pj4NCj4gPj4+IFRoaXMgYWxzbyBk
ZWZpbmVzIGEgbmV3IHN0cnVjdHVyZSB0byBkZWZpbmUgY29sb3IgbHV0IHJhbmdlcywgYWxvbmcN
Cj4gPj4+IHdpdGggcmVsYXRlZCBtYWNybyBkZWZpbml0aW9ucyBhbmQgZW51bXMuIFRoaXMgd2ls
bCBoZWxwIGRlc2NyaWJlDQo+ID4+PiBtdWx0aSBzZWdtZW50ZWQgbHV0IHJhbmdlcyBpbiB0aGUg
aGFyZHdhcmUuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5z
aGFua2FyQGludGVsLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJt
X21vZGUuaCB8IDU4DQo+ID4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+ID4+PiBiL2luY2x1ZGUv
dWFwaS9kcm0vZHJtX21vZGUuaCBpbmRleCA5YjY3MjJkNDVmMzYuLmQwY2U0OGQyZTczMg0KPiA+
Pj4gMTAwNjQ0DQo+ID4+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPj4+
ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+Pj4gQEAgLTgxOSw2ICs4MTks
NjQgQEAgc3RydWN0IGhkcl9vdXRwdXRfbWV0YWRhdGEgew0KPiA+Pj4gIAl9Ow0KPiA+Pj4gIH07
DQo+ID4+Pg0KPiA+Pj4gKy8qDQo+ID4+PiArICogRFJNX01PREVfTFVUX0dBTU1BfERSTV9NT0RF
X0xVVF9ERUdBTU1BIGlzIGxlZ2FsIGFuZA0KPiBtZWFucw0KPiA+PiB0aGUgTFVUDQo+ID4+PiAr
ICogY2FuIGJlIHVzZWQgZm9yIGVpdGhlciBwdXJwb3NlLCBidXQgbm90IHNpbXVsdGFuZW91c2x5
LiBUbw0KPiA+Pj4gKyBleHBvc2UNCj4gPj4+ICsgKiBtb2RlcyB0aGF0IHN1cHBvcnQgZ2FtbWEg
YW5kIGRlZ2FtbWEgc2ltdWx0YW5lb3VzbHkgdGhlIGdhbW1hDQo+ID4+PiArIG1vZGUNCj4gPj4+
ICsgKiBtdXN0IGRlY2xhcmUgZGlzdGluY3QgRFJNX01PREVfTFVUX0dBTU1BIGFuZA0KPiA+PiBE
Uk1fTU9ERV9MVVRfREVHQU1NQQ0KPiA+Pj4gKyAqIHJhbmdlcy4NCj4gPj4+ICsgKi8NCj4gPj4+
ICsvKiBMVVQgaXMgZm9yIGdhbW1hIChhZnRlciBDVE0pICovDQo+ID4+PiArI2RlZmluZSBEUk1f
TU9ERV9MVVRfR0FNTUEgQklUKDApDQo+ID4+PiArLyogTFVUIGlzIGZvciBkZWdhbW1hIChiZWZv
cmUgQ1RNKSAqLyAjZGVmaW5lIERSTV9NT0RFX0xVVF9ERUdBTU1BDQo+ID4+PiArQklUKDEpDQo+
ID4+PiArLyogbGluZWFybHkgaW50ZXJwb2xhdGUgYmV0d2VlbiB0aGUgcG9pbnRzICovICNkZWZp
bmUNCj4gPj4+ICtEUk1fTU9ERV9MVVRfSU5URVJQT0xBVEUgQklUKDIpDQo+ID4+PiArLyoNCj4g
Pj4+ICsgKiB0aGUgbGFzdCB2YWx1ZSBvZiB0aGUgcHJldmlvdXMgcmFuZ2UgaXMgdGhlDQo+ID4+
PiArICogZmlyc3QgdmFsdWUgb2YgdGhlIGN1cnJlbnQgcmFuZ2UuDQo+ID4+PiArICovDQo+ID4+
PiArI2RlZmluZSBEUk1fTU9ERV9MVVRfUkVVU0VfTEFTVCBCSVQoMykNCj4gPj4+ICsvKiB0aGUg
Y3VydmUgbXVzdCBiZSBub24tZGVjcmVhc2luZyAqLyAjZGVmaW5lDQo+ID4+PiArRFJNX01PREVf
TFVUX05PTl9ERUNSRUFTSU5HIEJJVCg0KQ0KPiA+Pj4gKy8qIHRoZSBjdXJ2ZSBpcyByZWZsZWN0
ZWQgYWNyb3NzIG9yaWdpbiBmb3IgbmVnYXRpdmUgaW5wdXRzICovDQo+ID4+PiArI2RlZmluZSBE
Uk1fTU9ERV9MVVRfUkVGTEVDVF9ORUdBVElWRSBCSVQoNSkNCj4gPj4+ICsvKiB0aGUgc2FtZSBj
dXJ2ZSAocmVkKSBpcyB1c2VkIGZvciBibHVlIGFuZCBncmVlbiBjaGFubmVscyBhcyB3ZWxsDQo+
ID4+PiArKi8gI2RlZmluZSBEUk1fTU9ERV9MVVRfU0lOR0xFX0NIQU5ORUwgQklUKDYpDQo+ID4+
PiArDQo+ID4+PiArc3RydWN0IGRybV9jb2xvcl9sdXRfcmFuZ2Ugew0KPiA+Pj4gKwkvKiBEUk1f
TU9ERV9MVVRfKiAqLw0KPiA+Pj4gKwlfX3UzMiBmbGFnczsNCj4gPj4+ICsJLyogbnVtYmVyIG9m
IHBvaW50cyBvbiB0aGUgY3VydmUgKi8NCj4gPj4+ICsJX191MTYgY291bnQ7DQo+ID4+PiArCS8q
IGlucHV0L291dHB1dCBiaXRzIHBlciBjb21wb25lbnQgKi8NCj4gPj4+ICsJX191OCBpbnB1dF9i
cGMsIG91dHB1dF9icGM7DQo+ID4+PiArCS8qIGlucHV0IHN0YXJ0L2VuZCB2YWx1ZXMgKi8NCj4g
Pj4+ICsJX19zMzIgc3RhcnQsIGVuZDsNCj4gPj4+ICsJLyogb3V0cHV0IG1pbi9tYXggdmFsdWVz
ICovDQo+ID4+PiArCV9fczMyIG1pbiwgbWF4Ow0KPiA+Pj4gK307DQo+ID4+PiArDQo+ID4+PiAr
ZW51bSBsdXRfdHlwZSB7DQo+ID4+DQo+ID4+IFVucHJlZml4ZWQgdHlwZSBuYW1lIGluIFVBUEkg
aGVhZGVycyBpcyBwcm9iYWJseSBub3QgYSBnb29kIGlkZWEuDQo+ID4NCj4gPiBPaywgd2lsbCBy
ZW5hbWUgdGhlc2UuDQo+ID4NCj4gPj4+ICsJTFVUX1RZUEVfREVHQU1NQSA9IDAsDQo+ID4+PiAr
CUxVVF9UWVBFX0dBTU1BID0gMSwNCj4gPj4+ICt9Ow0KPiA+Pg0KPiA+PiBBbGwgdGhlIGFib3Zl
IHN0dWZmIHNlZW1zIHRvIGJlIHRoZSBzYW1lIGluIHlvdXIgb3RoZXIgcGF0Y2ggc2VyaWVzJw0K
PiA+PiBwYXRjaCAiW1BBVENIIDEvOV0gZHJtOiBBZGQgZ2FtbWEgbW9kZSBwcm9wZXJ0eSIuIElz
IHRoaXMgc2VyaWVzDQo+ID4+IHJlcGxhY2luZyB0aGUgc2VyaWVzICJbUEFUQ0ggMC85XSBFbmhh
bmNlIHBpcGUgY29sb3Igc3VwcG9ydCBmb3INCj4gPj4gbXVsdGkgc2VnbWVudGVkIGx1dHMiIG9y
IHdoYXQgZG9lcyB0aGlzIG1lYW4/DQo+ID4NCj4gPiBUaGUgY29uY2VwdCBhbmQgaWRlYSBpcyBz
aW1pbGFyIGFuZCB0aGUgcmFuZ2UgZGVmaW5pdGlvbiBpcyBhbHNvDQo+ID4gY29tbW9uLiBCdXQg
dGhpcyBzZXJpZXMgZm9jdXNlcyBvbiBwbGFuZSBjb2xvciBtYW5hZ2VtZW50IHdoaWxlIHRoZSBv
dGhlciBvbmUNCj4gaXMgZm9yIHBpcGUvY3J0YyBjb2xvciBmZWF0dXJlcy4NCj4gPiBIZW5jZSBz
ZXBhcmF0ZWQgYW5kIGZsb2F0ZWQgdGhlbSBhcyB1bmlxdWUgc2VyaWVzIGZvciByZXZpZXcuDQo+
ID4NCj4gDQo+IE1pZ2h0IGJlIGJldHRlciBpbiB0aGlzIGNhc2UgdG8gY29tYmluZSBib3RoIHBh
dGNoc2V0cy4gSXQgd2Fzbid0IGVudGlyZWx5IGNsZWFyIHRvIG1lDQo+IHdoZXRoZXIgSSBjb3Vs
ZCBiYXNlIG9uZSBwYXRjaHNldCBvbiB0b3Agb2YgdGhlIG90aGVyIChkb2Vzbid0IGxvb2sgbGlr
ZSBpdCkgYW5kIHdoYXQNCj4gYmFzZSB0byBhcHBseSB0aGVtIG9uLiBJIGhhZCBzdWNjZXNzIGFw
cGx5aW5nIHRoZSBwbGFuZSBzdHVmZiBvbiBkcm0tbmV4dCBhbmQgdGhlDQo+IGNydGMgc3R1ZmYg
b24gZHJtLWludGVsLg0KDQpTdXJlIEhhcnJ5LCBJIGd1ZXNzIGl0cyBiZXR0ZXIgdG8gY29tYmlu
ZSBib3RoIHRoZSBzZXJpZXMgdG8gYXZvaWQgYW55IGNvbmZ1c2lvbnMuDQpJIHdpbGwgc2VuZCBv
dXQgbmV4dCB2ZXJzaW9uIHdpdGggc29tZSBtb3JlIFVBUEkgZG9jdW1lbnRhdGlvbiBiYXNlZCBv
biB0aGUgZmVlZGJhY2sNCnJlY2VpdmVkLg0KDQpSZWdhcmRzLA0KVW1hIFNoYW5rYXINCj4gDQo+
IEhhcnJ5DQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gVW1hIFNoYW5rYXINCj4gPj4NCj4gPj4gVGhh
bmtzLA0KPiA+PiBwcQ0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKy8qDQo+ID4+PiArICogQ3JlYXRp
bmcgNjQgYml0IHBhbGV0dGUgZW50cmllcyBmb3IgYmV0dGVyIGRhdGENCj4gPj4+ICsgKiBwcmVj
aXNpb24uIFRoaXMgd2lsbCBiZSByZXF1aXJlZCBmb3IgSERSIGFuZA0KPiA+Pj4gKyAqIHNpbWls
YXIgY29sb3IgcHJvY2Vzc2luZyB1c2VjYXNlcy4NCj4gPj4+ICsgKi8NCj4gPj4+ICtzdHJ1Y3Qg
ZHJtX2NvbG9yX2x1dF9leHQgew0KPiA+Pj4gKwkvKg0KPiA+Pj4gKwkgKiBEYXRhIGlzIFUzMi4z
MiBmaXhlZCBwb2ludCBmb3JtYXQuDQo+ID4+PiArCSAqLw0KPiA+Pj4gKwlfX3U2NCByZWQ7DQo+
ID4+PiArCV9fdTY0IGdyZWVuOw0KPiA+Pj4gKwlfX3U2NCBibHVlOw0KPiA+Pj4gKwlfX3U2NCBy
ZXNlcnZlZDsNCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gICNkZWZpbmUgRFJNX01PREVfUEFH
RV9GTElQX0VWRU5UIDB4MDEgICNkZWZpbmUNCj4gPj4+IERSTV9NT0RFX1BBR0VfRkxJUF9BU1lO
QyAweDAyICAjZGVmaW5lDQo+ID4+PiBEUk1fTU9ERV9QQUdFX0ZMSVBfVEFSR0VUX0FCU09MVVRF
IDB4NA0KPiA+DQoNCg==
