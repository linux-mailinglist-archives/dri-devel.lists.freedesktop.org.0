Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB171961A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 03:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3171789BFE;
	Fri, 10 May 2019 01:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4C589BB2;
 Fri, 10 May 2019 01:13:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 18:13:45 -0700
X-ExtLoop1: 1
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by FMSMGA003.fm.intel.com with ESMTP; 09 May 2019 18:13:44 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.235]) by
 IRSMSX103.ger.corp.intel.com ([169.254.3.30]) with mapi id 14.03.0415.000;
 Fri, 10 May 2019 02:13:43 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 2/6] drm: Add a VSC structure for handling Pixel
 Encoding/Colorimetry Formats
Thread-Topic: [PATCH v6 2/6] drm: Add a VSC structure for handling Pixel
 Encoding/Colorimetry Formats
Thread-Index: AQHVBcP+9qkxcZP28kmbJ3fL1d5wfKZjfuoA
Date: Fri, 10 May 2019 01:13:42 +0000
Message-ID: <71b15677b86c5652ce01cb929c55e8c2a0f6775f.camel@intel.com>
References: <20190508081757.28042-1-gwan-gyeong.mun@intel.com>
 <20190508081757.28042-3-gwan-gyeong.mun@intel.com>
 <20190508173206.GW24299@intel.com>
In-Reply-To: <20190508173206.GW24299@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.174]
Content-ID: <3A093A350180564B9DCD21BE7224E1A6@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTA4IGF0IDIwOjMyICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDExOjE3OjUzQU0gKzAzMDAsIEd3YW4tZ3llb25n
IE11biB3cm90ZToNCj4gPiBTRFAgVlNDIEhlYWRlciBhbmQgRGF0YSBCbG9jayBmb2xsb3cgRFAg
MS40YSBzcGVjLCBzZWN0aW9uDQo+ID4gMi4yLjUuNy41LA0KPiA+IGNoYXB0ZXIgIlZTQyBTRFAg
UGF5bG9hZCBmb3IgUGl4ZWwgRW5jb2RpbmcvQ29sb3JpbWV0cnkgRm9ybWF0Ii4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5j
b20+DQo+ID4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaCB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaA0KPiA+IGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+ID4gaW5kZXggOTdjZTc5
MGE1YjVhLi4zNzkzYmVhN2I3ZmUgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+ID4gQEAg
LTEwOTYsNiArMTA5NiwyMyBAQCBzdHJ1Y3QgZWRwX3ZzY19wc3Igew0KPiA+ICAJdTggREI4XzMx
WzI0XTsgLyogUmVzZXJ2ZWQgKi8NCj4gPiAgfSBfX3BhY2tlZDsNCj4gPiAgDQo+ID4gK3N0cnVj
dCBkcF92c2Nfc2RwIHsNCj4gPiArCXN0cnVjdCBkcF9zZHBfaGVhZGVyIHNkcF9oZWFkZXI7DQo+
ID4gKwl1OCBEQjA7IC8qIFN0ZXJlbyBJbnRlcmZhY2UgKi8NCj4gPiArCXU4IERCMTsgLyogMCAt
IFBTUiBTdGF0ZTsgMSAtIFVwZGF0ZSBSRkI7IDIgLSBDUkMgVmFsaWQgKi8NCj4gPiArCXU4IERC
MjsgLyogQ1JDIHZhbHVlIGJpdHMgNzowIG9mIHRoZSBSIG9yIENyIGNvbXBvbmVudCAqLw0KPiA+
ICsJdTggREIzOyAvKiBDUkMgdmFsdWUgYml0cyAxNTo4IG9mIHRoZSBSIG9yIENyIGNvbXBvbmVu
dCAqLw0KPiA+ICsJdTggREI0OyAvKiBDUkMgdmFsdWUgYml0cyA3OjAgb2YgdGhlIEcgb3IgWSBj
b21wb25lbnQgKi8NCj4gPiArCXU4IERCNTsgLyogQ1JDIHZhbHVlIGJpdHMgMTU6OCBvZiB0aGUg
RyBvciBZIGNvbXBvbmVudCAqLw0KPiA+ICsJdTggREI2OyAvKiBDUkMgdmFsdWUgYml0cyA3OjAg
b2YgdGhlIEIgb3IgQ2IgY29tcG9uZW50ICovDQo+ID4gKwl1OCBEQjc7IC8qIENSQyB2YWx1ZSBi
aXRzIDE1Ojggb2YgdGhlIEIgb3IgQ2IgY29tcG9uZW50ICovDQo+ID4gKwl1OCBEQjhfMTVbOF07
ICAvKiBSZXNlcnZlZCAqLw0KPiA+ICsJdTggREIxNjsgLyogUGl4ZWwgRW5jb2RpbmcgYW5kIENv
bG9yaW1ldHJ5IEZvcm1hdHMgKi8NCj4gPiArCXU4IERCMTc7IC8qIER5bmFtaWMgUmFuZ2UgYW5k
IENvbXBvbmVudCBCaXQgRGVwdGggKi8NCj4gPiArCXU4IERCMTg7IC8qIENvbnRlbnQgVHlwZSAq
Lw0KPiA+ICsJdTggREIxOV8zMVsxM107IC8qIFJlc2VydmVkICovDQo+ID4gK30gX19wYWNrZWQ7
DQo+IA0KPiBJc24ndCB0aGlzIHRoZSBzYW1lIHRoaW5nIHdlIGhhdmUgZm9yIGVkcCBhbHJlYWR5
PyBKdXN0IHJlbmFtZSB0aGUNCj4gZWRwDQo+IHN0cnVjdCBhbmQgYWRkIHRoZSBtaXNzaW5nIHN0
dWZmPw0KPiANCk9rYXksIEknbGwgcmVuYW1lIHN0cnVjdCBlZHBfdnNjX3BzciB0byBnZW5lcmFs
IG5hbWUgb2YgZHBfc2RwIGFuZCB3aWxsDQphZGQgbWlzc2luZyBzdHVmZi4NCj4gPiArDQo+ID4g
ICNkZWZpbmUgRURQX1ZTQ19QU1JfU1RBVEVfQUNUSVZFCSgxPDwwKQ0KPiA+ICAjZGVmaW5lIEVE
UF9WU0NfUFNSX1VQREFURV9SRkIJCSgxPDwxKQ0KPiA+ICAjZGVmaW5lIEVEUF9WU0NfUFNSX0NS
Q19WQUxVRVNfVkFMSUQJKDE8PDIpDQo+ID4gLS0gDQo+ID4gMi4yMS4wDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
