Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A11313C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFAD6E7FA;
	Fri,  3 May 2019 15:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BAB6E7FA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:32:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x43FMhxL011092; Fri, 3 May 2019 17:32:45 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcy3sd-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 03 May 2019 17:32:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 810EF34;
 Fri,  3 May 2019 15:32:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4686F296E;
 Fri,  3 May 2019 15:32:41 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 May
 2019 17:32:40 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 3 May 2019 17:32:40 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Matt Redfearn <matt.redfearn@thinci.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Topic: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Index: AQHU/y0X85i6EeTE0U60zrEiE1o5cqZZawCA
Date: Fri, 3 May 2019 15:32:40 +0000
Message-ID: <0832ec0c-cf21-7b43-17a7-dbe54513453c@st.com>
References: <20190430081646.23845-1-matt.redfearn@thinci.com>
In-Reply-To: <20190430081646.23845-1-matt.redfearn@thinci.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <8B3A62ED59690245B8E4127488D0A9C0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-03_08:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ob0fa485sIxdsVWfa65PGWOTLmJkP8Izs011beAw168=;
 b=x/+Hn7NfCkwyWEf5fod4dsOi17uaTh9Hpr8Y82mdTj381O2vYobrj9FlWa13rpPce5N+
 pYYCE5g7goQdJ+5fmDRL9MID82LkWPOqTdkShDHI0nsN7VGE0OO+jFdu9njO3SLYHQgl
 R7iyorcLINjrpE+DF4kCqa7QNr7HjqlyF0RXfYTr3mBXUJNE+XL3ZC4K+34NfE/3JBVq
 unDhibMuwKHOz8re3x9mU+7UWErNKoS5E0I+o0mtDVePIuA1sDNPTe8t8VanxZhBgypR
 FxezOnWcFqx+t7Kk4DxawSFUXNZaPaFi85TNwzUGBbrPVlEzRweeS+H9buiP0yPygxO5 Jg== 
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
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dCwNCmFuZCBtYW55IHRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpUZXN0ZWQgc3VjY2Vz
c2Z1bGx5IGJ5IFlhbm5pY2sgb24gU1RNMzJNUDEgYm9hcmRzIDotKQ0KDQpUZXN0ZWQtYnk6IFlh
bm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQoNClRoYW5rIHlvdSwNClBoaWxpcHBl
IDotKQ0KDQoNCk9uIDQvMzAvMTkgMTA6MTcgQU0sIE1hdHQgUmVkZmVhcm4gd3JvdGU6DQo+IFRo
ZSBTeW5vcHN5cyBNSVBJIERTSSBJUCBjb250YWlucyBhIHZpZGVvIHRlc3QgcGF0dGVybiBnZW5l
cmF0b3Igd2hpY2gNCj4gaXMgaGVscGZ1bCBpbiBkZWJ1Z2dpbmcgdmlkZW8gdGltaW5nIHdpdGgg
Y29ubmVjdGVkIGRpc3BsYXlzLg0KPiBBZGQgYSBkZWJ1Z2ZzIGRpcmVjdG9yeSBjb250YWluaW5n
IGZpbGVzIHdoaWNoIGFsbG93IHRoZSBWUEcgdG8gYmUNCj4gZW5hYmxlZCBhbmQgZGlzYWJsZWQs
IGFuZCBpdHMgb3JpZW50YXRpb24gdG8gYmUgY2hhbmdlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hdHQgUmVkZmVhcm4gPG1hdHQucmVkZmVhcm5AdGhpbmNpLmNvbT4NCj4gDQo+IC0tLQ0KPiAN
Cj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBFbnN1cmUgZHdfbWlwaV9kc2lfdmlkZW9fbW9kZV9jb25m
aWcoKSBkb2Vzbid0IGJyZWFrIHdpdGhvdXQgQ09ORklHX0RFQlVHX0ZTDQo+IC0gVGlkeSB1cCBp
bml0aWFsaXNhdGlvbiAvIHRpZHkgdXAgb2YgZGVidWdmcw0KPiANCj4gICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgfCA0NyArKysrKysrKysrKysrKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMNCj4gaW5kZXggMGVlNDQwMjE2
YjguLmJmZmVlZjdhNmNjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LW1pcGktZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1taXBpLWRzaS5jDQo+IEBAIC0xMCw2ICsxMCw3IEBADQo+ICAgDQo+ICAgI2luY2x1
ZGUgPGxpbnV4L2Nsay5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0K
PiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2
aWNlLmg+DQo+IEBAIC04Niw2ICs4Nyw4IEBADQo+ICAgI2RlZmluZSBWSURfTU9ERV9UWVBFX05P
Tl9CVVJTVF9TWU5DX0VWRU5UUwkweDENCj4gICAjZGVmaW5lIFZJRF9NT0RFX1RZUEVfQlVSU1QJ
CQkweDINCj4gICAjZGVmaW5lIFZJRF9NT0RFX1RZUEVfTUFTSwkJCTB4Mw0KPiArI2RlZmluZSBW
SURfTU9ERV9WUEdfRU5BQkxFCQlCSVQoMTYpDQo+ICsjZGVmaW5lIFZJRF9NT0RFX1ZQR19IT1JJ
Wk9OVEFMCQlCSVQoMjQpDQo+ICAgDQo+ICAgI2RlZmluZSBEU0lfVklEX1BLVF9TSVpFCQkweDNj
DQo+ICAgI2RlZmluZSBWSURfUEtUX1NJWkUocCkJCQkoKHApICYgMHgzZmZmKQ0KPiBAQCAtMjM0
LDYgKzIzNywxMyBAQCBzdHJ1Y3QgZHdfbWlwaV9kc2kgew0KPiAgIAl1MzIgZm9ybWF0Ow0KPiAg
IAl1bnNpZ25lZCBsb25nIG1vZGVfZmxhZ3M7DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX0RFQlVH
X0ZTDQo+ICsJc3RydWN0IGRlbnRyeSAqZGVidWdmczsNCj4gKw0KPiArCWJvb2wgdnBnOw0KPiAr
CWJvb2wgdnBnX2hvcml6b250YWw7DQo+ICsjZW5kaWYgLyogQ09ORklHX0RFQlVHX0ZTICovDQo+
ICsNCj4gICAJc3RydWN0IGR3X21pcGlfZHNpICptYXN0ZXI7IC8qIGR1YWwtZHNpIG1hc3RlciBw
dHIgKi8NCj4gICAJc3RydWN0IGR3X21pcGlfZHNpICpzbGF2ZTsgLyogZHVhbC1kc2kgc2xhdmUg
cHRyICovDQo+ICAgDQo+IEBAIC01MjUsNiArNTM1LDEzIEBAIHN0YXRpYyB2b2lkIGR3X21pcGlf
ZHNpX3ZpZGVvX21vZGVfY29uZmlnKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQ0KPiAgIAllbHNl
DQo+ICAgCQl2YWwgfD0gVklEX01PREVfVFlQRV9OT05fQlVSU1RfU1lOQ19FVkVOVFM7DQo+ICAg
DQo+ICsjaWZkZWYgQ09ORklHX0RFQlVHX0ZTDQo+ICsJaWYgKGRzaS0+dnBnKSB7DQo+ICsJCXZh
bCB8PSBWSURfTU9ERV9WUEdfRU5BQkxFOw0KPiArCQl2YWwgfD0gZHNpLT52cGdfaG9yaXpvbnRh
bCA/IFZJRF9NT0RFX1ZQR19IT1JJWk9OVEFMIDogMDsNCj4gKwl9DQo+ICsjZW5kaWYgLyogQ09O
RklHX0RFQlVHX0ZTICovDQo+ICsNCj4gICAJZHNpX3dyaXRlKGRzaSwgRFNJX1ZJRF9NT0RFX0NG
RywgdmFsKTsNCj4gICB9DQo+ICAgDQo+IEBAIC05MzUsNiArOTUyLDMzIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBkd19taXBpX2RzaV9icmlkZ2VfZnVuY3MgPSB7DQo+
ICAgCS5hdHRhY2gJICAgICAgPSBkd19taXBpX2RzaV9icmlkZ2VfYXR0YWNoLA0KPiAgIH07DQo+
ICAgDQo+ICsjaWZkZWYgQ09ORklHX0RFQlVHX0ZTDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3X21p
cGlfZHNpX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSkNCj4gK3sNCj4gKwlk
c2ktPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZHNpLT5kZXYpLCBOVUxM
KTsNCj4gKwlpZiAoSVNfRVJSKGRzaS0+ZGVidWdmcykpIHsNCj4gKwkJZGV2X2Vycihkc2ktPmRl
diwgImZhaWxlZCB0byBjcmVhdGUgZGVidWdmcyByb290XG4iKTsNCj4gKwkJcmV0dXJuOw0KPiAr
CX0NCj4gKw0KPiArCWRlYnVnZnNfY3JlYXRlX2Jvb2woInZwZyIsIDA2NjAsIGRzaS0+ZGVidWdm
cywgJmRzaS0+dnBnKTsNCj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9ib29sKCJ2cGdfaG9yaXpvbnRhbCIs
IDA2NjAsIGRzaS0+ZGVidWdmcywNCj4gKwkJCSAgICAmZHNpLT52cGdfaG9yaXpvbnRhbCk7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2RlYnVnZnNfcmVtb3ZlKHN0cnVj
dCBkd19taXBpX2RzaSAqZHNpKQ0KPiArew0KPiArCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShk
c2ktPmRlYnVnZnMpOw0KPiArfQ0KPiArDQo+ICsjZWxzZQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBk
d19taXBpX2RzaV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpIHsgfQ0KPiAr
c3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfZGVidWdmc19yZW1vdmUoc3RydWN0IGR3X21pcGlfZHNp
ICpkc2kpIHsgfQ0KPiArDQo+ICsjZW5kaWYgLyogQ09ORklHX0RFQlVHX0ZTICovDQo+ICsNCj4g
ICBzdGF0aWMgc3RydWN0IGR3X21pcGlfZHNpICoNCj4gICBfX2R3X21pcGlfZHNpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ICAgCQkgICAgY29uc3Qgc3RydWN0IGR3X21p
cGlfZHNpX3BsYXRfZGF0YSAqcGxhdF9kYXRhKQ0KPiBAQCAtMTAwNSw2ICsxMDQ5LDcgQEAgX19k
d19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiAgIAkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGNsayk7DQo+ICAgCX0NCj4gICANCj4gKwlkd19taXBp
X2RzaV9kZWJ1Z2ZzX2luaXQoZHNpKTsNCj4gICAJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4g
ICANCj4gICAJZHNpLT5kc2lfaG9zdC5vcHMgPSAmZHdfbWlwaV9kc2lfaG9zdF9vcHM7DQo+IEBA
IC0xMDEyLDYgKzEwNTcsNyBAQCBfX2R3X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYsDQo+ICAgCXJldCA9IG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIoJmRzaS0+ZHNp
X2hvc3QpOw0KPiAgIAlpZiAocmV0KSB7DQo+ICAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBy
ZWdpc3RlciBNSVBJIGhvc3Q6ICVkXG4iLCByZXQpOw0KPiArCQlkd19taXBpX2RzaV9kZWJ1Z2Zz
X3JlbW92ZShkc2kpOw0KPiAgIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gICAJfQ0KPiAgIA0K
PiBAQCAtMTAyOSw2ICsxMDc1LDcgQEAgc3RhdGljIHZvaWQgX19kd19taXBpX2RzaV9yZW1vdmUo
c3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+ICAgCW1pcGlfZHNpX2hvc3RfdW5yZWdpc3Rlcigm
ZHNpLT5kc2lfaG9zdCk7DQo+ICAgDQo+ICAgCXBtX3J1bnRpbWVfZGlzYWJsZShkc2ktPmRldik7
DQo+ICsJZHdfbWlwaV9kc2lfZGVidWdmc19yZW1vdmUoZHNpKTsNCj4gICB9DQo+ICAgDQo+ICAg
dm9pZCBkd19taXBpX2RzaV9zZXRfc2xhdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2ksIHN0cnVj
dCBkd19taXBpX2RzaSAqc2xhdmUpDQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
