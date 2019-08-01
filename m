Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1287EEED
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D2C6ED21;
	Fri,  2 Aug 2019 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E132D6E52C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:43:45 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x71BhPAQ004769; Thu, 1 Aug 2019 07:43:32 -0400
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2053.outbound.protection.outlook.com [104.47.33.53])
 by mx0a-00128a01.pphosted.com with ESMTP id 2u3hrnj2nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2019 07:43:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTNf1n9252D8pyBr7oTu4xLXQlxXylcaNX+eS7rUQ6q6a51OURVMew9ZIg+WRJfdtVPeiX+iM1agTsomf3W6lDBor7kVdPo0XnkSZM7nyItACQ2Mq+ceC9uSjHpc4eI7S+611EPZrbizgLvp9U2X86PYn9aoOUc1181ipwEyx48eEVPW1qbXefRJQ4lNw9DIwKHGEkHD7Cua2I+VbNMgAW7/j7Gq2kFZjHEQ6BRO7sQx8FcUaI4l9PoPYVv4WrGxdy2p672bmLJwPKKD+3bOwBQ+UdVZyvfe8lRcQDFoaipYaEd+HhrwY5vNSioT/44JWC9KZUMo9/aMeUYuMxRwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+Bhcy+RZOAPDVSfE+/yx/7AWxFtOKpem3NUTyuqJNQ=;
 b=FqrUgjPb98mb8iw+FY1xSrSTBnkcOuzJDTfERdAPx3QrNydnZQ3HxcATYKTYqQ0rIdXPaua0tdUeUPItUDbQmhkJmJcGcYABMB5laJToQEcze4rW3orJPEx32G4YTRBIj+8pk9gzC5aVy2NC2uNPEobbX2uHsn2EuizzFMVAPmrhagvoBwMhE9kIYyzweSDTYdpAxReguLP2CPM8T8R3oOgDeTcGOcUT/f5M34N1Lz1Ts0cSyb9JIXooG4WChM25dDKapc7JHTNX+lr1/g2RTI9Ho9oXHNusB3Izhdg9b+oce/xkRbGTLs6DfKk3Ck97yR/PZsWc+T3yAGuHV8389Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=analog.com;dmarc=pass action=none
 header.from=analog.com;dkim=pass header.d=analog.com;arc=none
Received: from BN8PR03MB4770.namprd03.prod.outlook.com (20.179.64.223) by
 BN8PR03MB4881.namprd03.prod.outlook.com (20.179.64.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 1 Aug 2019 11:43:29 +0000
Received: from BN8PR03MB4770.namprd03.prod.outlook.com
 ([fe80::d096:6c2e:91ac:39bb]) by BN8PR03MB4770.namprd03.prod.outlook.com
 ([fe80::d096:6c2e:91ac:39bb%6]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 11:43:29 +0000
From: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Topic: [PATCH 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Index: AQHVRtlIY4jkERMGvEuZA9MbwGut16bkWT0AgAHVuIA=
Date: Thu, 1 Aug 2019 11:43:28 +0000
Message-ID: <6714fb6a454e8085ada559b085db2557befdeeb4.camel@analog.com>
References: <20190730131736.30187-1-bogdan.togorean@analog.com>
 <20190730131736.30187-3-bogdan.togorean@analog.com>
 <797f1c00-b76d-fef8-93d2-a2b52d266065@baylibre.com>
In-Reply-To: <797f1c00-b76d-fef8-93d2-a2b52d266065@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10143390-9f29-4d16-add0-08d7167578f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR03MB4881; 
x-ms-traffictypediagnostic: BN8PR03MB4881:
x-microsoft-antispam-prvs: <BN8PR03MB48810775022B5CE8285920559BDE0@BN8PR03MB4881.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(136003)(396003)(376002)(199004)(189003)(446003)(305945005)(5660300002)(36756003)(486006)(2616005)(25786009)(6246003)(256004)(26005)(53546011)(66066001)(71200400001)(118296001)(14444005)(53936002)(5024004)(14454004)(4326008)(7416002)(71190400001)(478600001)(11346002)(64756008)(76116006)(229853002)(7736002)(66946007)(91956017)(66556008)(66476007)(476003)(99286004)(316002)(2501003)(6486002)(8936002)(66446008)(2906002)(3846002)(6116002)(76176011)(81166006)(86362001)(102836004)(186003)(6506007)(68736007)(6512007)(6436002)(110136005)(8676002)(54906003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR03MB4881;
 H:BN8PR03MB4770.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /THtYCM2MczkFqRHR9aneTISHGJW3KDZRFsRzSclnEXCh9fOdNVMjfLGzK2Hq38O16p6NLzqIAP4wrKknx0wFELTYt7bWY+XnrIlTyX/FioebSEuy/XR652KSFXHlIBfoBWSqnf47hVi4gJIxeuLNfNP/XOFDStzSUhm1H+Q4qurYnmCZzdWX+oBjMPHLeIvMSGzCKGep037PqZ7zAmME7Lw6X657eQMvemealnQz4hkyS7ajTdExBu9U2/MI57fgHaNiz7LvEB5BgW20UR2gMARDs3gwbarbHQelw1K5HkBSXE++xD07aYKxF+jaunJf4vwAfZmWg2SinodG56Kckmxxe2lV65X4y9PK+j9V/NjpHq2JzmTR0H/10k1gKcv9OX+/Wgf6kvz2xsokOtm5LZCzTGCh6Ah8+TDLgVFLq0=
Content-ID: <B98D33588907A143A4C47A4511EA6C24@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10143390-9f29-4d16-add0-08d7167578f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 11:43:29.1127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bogdan.Togorean@analog.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4881
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010124
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+Bhcy+RZOAPDVSfE+/yx/7AWxFtOKpem3NUTyuqJNQ=;
 b=hcBl2Z1CZSx8WwmzxwNc21U9aCY32MgpsyzepB+OG6hCS754QP+n9QCC9enPygWYYqCHjT7kPqQMfahkAymdYWPYzvvfbVqfhz3C24S2CAhRgCYrPtaR69JCUiRrfXN9EMVyH83hy6fUSLLA9CLQeOMIf3GYdAunhTSHQwxhxnU=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwNCg0KVGhhbmsgeW91IGZvciByZXZpZXcuDQoNCk9uIFdlZCwgMjAxOS0wNy0zMSBh
dCAwOTo0MiArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6DQo+IFtFeHRlcm5hbF0NCj4gDQo+
IEhpIEJvZ2RhbiwNCj4gDQo+IE9uIDMwLzA3LzIwMTkgMTU6MTcsIEJvZ2RhbiBUb2dvcmVhbiB3
cm90ZToNCj4gPiBBRFY3NTM1IGlzIGEgRFNJIHRvIEhETUkgYnJpZGdlIGNoaXAgbGlrZSBBRFY3
NTMzIGJ1dCBpdCBhbGxvd3MNCj4gPiAxMDgwcEA2MEh6LiB2MXAyIGlzIGZpeGVkIHRvIDEuOFYg
b24gQURWNzUzNSBidXQgb24gQURWNzUzMyBjYW4gYmUNCj4gPiAxLjJWDQo+ID4gb3IgMS44ViBh
bmQgaXMgY29uZmlndXJhYmxlIGluIGEgcmVnaXN0ZXIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogQm9nZGFuIFRvZ29yZWFuIDxib2dkYW4udG9nb3JlYW5AYW5hbG9nLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaCAgICAgfCAgMiAr
Kw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDMx
ICsrKysrKysrKysrKysrKy0NCj4gPiAtLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+IGluZGV4IDUyYjJhZGZkYzg3Ny4uNzAyNDMy
NjE1ZWM4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUx
MS5oDQo+ID4gQEAgLTkxLDYgKzkxLDcgQEANCj4gPiAgI2RlZmluZSBBRFY3NTExX1JFR19BUkNf
Q1RSTAkJCTB4ZGYNCj4gPiAgI2RlZmluZSBBRFY3NTExX1JFR19DRUNfSTJDX0FERFIJCTB4ZTEN
Cj4gPiAgI2RlZmluZSBBRFY3NTExX1JFR19DRUNfQ1RSTAkJCTB4ZTINCj4gPiArI2RlZmluZSBB
RFY3NTExX1JFR19TVVBQTFlfU0VMRUNUCQkweGU0DQo+ID4gICNkZWZpbmUgQURWNzUxMV9SRUdf
Q0hJUF9JRF9ISUdICQkweGY1DQo+ID4gICNkZWZpbmUgQURWNzUxMV9SRUdfQ0hJUF9JRF9MT1cJ
CQkweGY2DQo+ID4gIA0KPiA+IEBAIC0zMjAsNiArMzIxLDcgQEAgc3RydWN0IGFkdjc1MTFfdmlk
ZW9fY29uZmlnIHsNCj4gPiAgZW51bSBhZHY3NTExX3R5cGUgew0KPiA+ICAJQURWNzUxMSwNCj4g
PiAgCUFEVjc1MzMsDQo+ID4gKwlBRFY3NTM1LA0KPiA+ICB9Ow0KPiA+ICANCj4gPiAgI2RlZmlu
ZSBBRFY3NTExX01BWF9BRERSUyAzDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IGluZGV4IGY2ZDI2ODFmNjkyNy4uOTQxMDcyZGVj
YjczIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMNCj4gPiBAQCAtMzY3LDcgKzM2Nyw3IEBAIHN0YXRpYyB2b2lkIGFkdjc1MTFfcG93
ZXJfb24oc3RydWN0IGFkdjc1MTENCj4gPiAqYWR2NzUxMSkNCj4gPiAgCSAqLw0KPiA+ICAJcmVn
Y2FjaGVfc3luYyhhZHY3NTExLT5yZWdtYXApOw0KPiA+ICANCj4gPiAtCWlmIChhZHY3NTExLT50
eXBlID09IEFEVjc1MzMpDQo+ID4gKwlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzIHx8IGFk
djc1MTEtPnR5cGUgPT0gQURWNzUzNSkNCj4gPiAgCQlhZHY3NTMzX2RzaV9wb3dlcl9vbihhZHY3
NTExKTsNCj4gPiAgCWFkdjc1MTEtPnBvd2VyZWQgPSB0cnVlOw0KPiA+ICB9DQo+ID4gQEAgLTM4
Nyw3ICszODcsNyBAQCBzdGF0aWMgdm9pZCBfX2Fkdjc1MTFfcG93ZXJfb2ZmKHN0cnVjdCBhZHY3
NTExDQo+ID4gKmFkdjc1MTEpDQo+ID4gIHN0YXRpYyB2b2lkIGFkdjc1MTFfcG93ZXJfb2ZmKHN0
cnVjdCBhZHY3NTExICphZHY3NTExKQ0KPiA+ICB7DQo+ID4gIAlfX2Fkdjc1MTFfcG93ZXJfb2Zm
KGFkdjc1MTEpOw0KPiA+IC0JaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMykNCj4gPiArCWlm
IChhZHY3NTExLT50eXBlID09IEFEVjc1MzMgfHwgYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTM1KQ0K
PiA+ICAJCWFkdjc1MzNfZHNpX3Bvd2VyX29mZihhZHY3NTExKTsNCj4gPiAgCWFkdjc1MTEtPnBv
d2VyZWQgPSBmYWxzZTsNCj4gPiAgfQ0KPiA+IEBAIC03NjEsNyArNzYxLDcgQEAgc3RhdGljIHZv
aWQgYWR2NzUxMV9tb2RlX3NldChzdHJ1Y3QgYWR2NzUxMQ0KPiA+ICphZHY3NTExLA0KPiA+ICAJ
cmVnbWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgMHgxNywNCj4gPiAgCQkweDYwLCAo
dnN5bmNfcG9sYXJpdHkgPDwgNikgfCAoaHN5bmNfcG9sYXJpdHkgPDwgNSkpOw0KPiA+ICANCj4g
PiAtCWlmIChhZHY3NTExLT50eXBlID09IEFEVjc1MzMpDQo+ID4gKwlpZiAoYWR2NzUxMS0+dHlw
ZSA9PSBBRFY3NTMzIHx8IGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzNSkNCj4gPiAgCQlhZHY3NTMz
X21vZGVfc2V0KGFkdjc1MTEsIGFkal9tb2RlKTsNCj4gPiAgDQo+ID4gIAlkcm1fbW9kZV9jb3B5
KCZhZHY3NTExLT5jdXJyX21vZGUsIGFkal9tb2RlKTsNCj4gPiBAQCAtODc0LDcgKzg3NCw3IEBA
IHN0YXRpYyBpbnQgYWR2NzUxMV9icmlkZ2VfYXR0YWNoKHN0cnVjdA0KPiA+IGRybV9icmlkZ2Ug
KmJyaWRnZSkNCj4gPiAgCQkJCSAmYWR2NzUxMV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsNCj4g
PiAgCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoJmFkdi0+Y29ubmVjdG9yLCBicmlkZ2Ut
PmVuY29kZXIpOw0KPiA+ICANCj4gPiAtCWlmIChhZHYtPnR5cGUgPT0gQURWNzUzMykNCj4gPiAr
CWlmIChhZHYtPnR5cGUgPT0gQURWNzUzMyB8fCBhZHYtPnR5cGUgPT0gQURWNzUzNSkNCj4gPiAg
CQlyZXQgPSBhZHY3NTMzX2F0dGFjaF9kc2koYWR2KTsNCj4gPiAgDQo+ID4gIAlpZiAoYWR2LT5p
MmNfbWFpbi0+aXJxKQ0KPiA+IEBAIC05NTIsNyArOTUyLDcgQEAgc3RhdGljIGJvb2wNCj4gPiBh
ZHY3NTExX2NlY19yZWdpc3Rlcl92b2xhdGlsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCByZWcpDQo+ID4gIAlzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjID0gdG9faTJjX2NsaWVudChk
ZXYpOw0KPiA+ICAJc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEgPSBpMmNfZ2V0X2NsaWVudGRhdGEo
aTJjKTsNCj4gPiAgDQo+ID4gLQlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzKQ0KPiA+ICsJ
aWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMyB8fCBhZHY3NTExLT50eXBlID09IEFEVjc1MzUp
DQo+ID4gIAkJcmVnIC09IEFEVjc1MzNfUkVHX0NFQ19PRkZTRVQ7DQo+ID4gIA0KPiA+ICAJc3dp
dGNoIChyZWcpIHsNCj4gPiBAQCAtOTk0LDcgKzk5NCw3IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9p
bml0X2NlY19yZWdtYXAoc3RydWN0DQo+ID4gYWR2NzUxMSAqYWR2KQ0KPiA+ICAJCWdvdG8gZXJy
Ow0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCWlmIChhZHYtPnR5cGUgPT0gQURWNzUzMykgew0KPiA+
ICsJaWYgKGFkdi0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdi0+dHlwZSA9PSBBRFY3NTM1KSB7DQo+
ID4gIAkJcmV0ID0gYWR2NzUzM19wYXRjaF9jZWNfcmVnaXN0ZXJzKGFkdik7DQo+ID4gIAkJaWYg
KHJldCkNCj4gPiAgCQkJZ290byBlcnI7DQo+ID4gQEAgLTEwOTQsOCArMTA5NCw5IEBAIHN0YXRp
YyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICppMmMsIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkICppZCkNCj4gPiAgCXN0cnVjdCBhZHY3NTExX2xpbmtfY29uZmln
IGxpbmtfY29uZmlnOw0KPiA+ICAJc3RydWN0IGFkdjc1MTEgKmFkdjc1MTE7DQo+ID4gIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmaTJjLT5kZXY7DQo+ID4gKwlzdHJ1Y3QgcmVndWxhdG9yICpyZWdf
djFwMjsNCj4gPiAgCXVuc2lnbmVkIGludCB2YWw7DQo+ID4gLQlpbnQgcmV0Ow0KPiA+ICsJaW50
IHJldCwgcmVnX3YxcDJfdVY7DQo+ID4gIA0KPiA+ICAJaWYgKCFkZXYtPm9mX25vZGUpDQo+ID4g
IAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gQEAgLTExNjMsNiArMTE2NCwxOCBAQCBzdGF0aWMgaW50
IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiAqaTJjLCBjb25zdCBzdHJ1Y3Qg
aTJjX2RldmljZV9pZCAqaWQpDQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCWdvdG8gdW5pbml0X3Jl
Z3VsYXRvcnM7DQo+ID4gIA0KPiA+ICsJaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMykgew0K
PiA+ICsJCXJldCA9IG1hdGNoX3N0cmluZyhhZHY3NTMzX3N1cHBseV9uYW1lcywgYWR2NzUxMS0N
Cj4gPiA+bnVtX3N1cHBsaWVzLA0KPiA+ICsJCQkJCQkJCQkNCj4gPiAidjFwMiIpOw0KPiA+ICsJ
CXJlZ192MXAyID0gYWR2NzUxMS0+c3VwcGxpZXNbcmV0XS5jb25zdW1lcjsNCj4gPiArCQlyZWdf
djFwMl91ViA9IHJlZ3VsYXRvcl9nZXRfdm9sdGFnZShyZWdfdjFwMik7DQo+ID4gKw0KPiA+ICsJ
CWlmIChyZWdfdjFwMl91ViA9PSAxMjAwMDAwKSB7DQo+ID4gKwkJCXJlZ21hcF91cGRhdGVfYml0
cyhhZHY3NTExLT5yZWdtYXAsDQo+ID4gKwkJCQlBRFY3NTExX1JFR19TVVBQTFlfU0VMRUNULCAw
eDgwLCAweDgwKTsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJYWR2NzUxMV9wYWNr
ZXRfZGlzYWJsZShhZHY3NTExLCAweGZmZmYpOw0KPiA+ICANCj4gPiAgCWFkdjc1MTEtPmkyY19l
ZGlkID0gaTJjX25ld19zZWNvbmRhcnlfZGV2aWNlKGkyYywgImVkaWQiLA0KPiA+IEBAIC0xMjQy
LDcgKzEyNTUsNyBAQCBzdGF0aWMgaW50IGFkdjc1MTFfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50
DQo+ID4gKmkyYykNCj4gPiAgew0KPiA+ICAJc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEgPSBpMmNf
Z2V0X2NsaWVudGRhdGEoaTJjKTsNCj4gPiAgDQo+ID4gLQlpZiAoYWR2NzUxMS0+dHlwZSA9PSBB
RFY3NTMzKQ0KPiA+ICsJaWYgKGFkdjc1MTEtPnR5cGUgPT0gQURWNzUzMyB8fCBhZHY3NTExLT50
eXBlID09IEFEVjc1MzUpDQo+ID4gIAkJYWR2NzUzM19kZXRhY2hfZHNpKGFkdjc1MTEpOw0KPiA+
ICAJaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGFkdjc1MTEtPmkyY19jZWMpOw0KPiA+ICAJaWYgKGFk
djc1MTEtPmNlY19jbGspDQo+ID4gQEAgLTEyNjgsNiArMTI4MSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaTJjX2RldmljZV9pZA0KPiA+IGFkdjc1MTFfaTJjX2lkc1tdID0gew0KPiA+ICAJeyAi
YWR2NzUxMyIsIEFEVjc1MTEgfSwNCj4gPiAgI2lmZGVmIENPTkZJR19EUk1fSTJDX0FEVjc1MzMN
Cj4gPiAgCXsgImFkdjc1MzMiLCBBRFY3NTMzIH0sDQo+ID4gKwl7ICJhZHY3NTM1IiwgQURWNzUz
NSB9LA0KPiANCj4gTWF5YmUgeW91IHNob3VsZCBhZGQgYSBuZXcgQ09ORklHX0RSTV9JMkNfQURW
NzUzNSBvciB1cGRhdGUgdGhlDQo+IGN1cnJlbnQgQ09ORklHX0RSTV9JMkNfQURWNzUzMyBkZXNj
cmlwdGlvbi4NCkknbGwgcmVuYW1lIHRoZSBjb25maWcgb3B0aW9uIGFzIExhdXJlbnQgYWxzbyBz
dWdnZXN0ZWQgdG8NCkNPTkZJR19EUk1fSTJDX0FEVjc1M1ggYW5kIHVwZGF0ZSBpdHMgZGVzY3Jp
cHRpb24uIA0KPiANCj4gPiAgI2VuZGlmDQo+ID4gIAl7IH0NCj4gPiAgfTsNCj4gPiBAQCAtMTI3
OSw2ICsxMjkzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiBhZHY3
NTExX29mX2lkc1tdID0gew0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJhZGksYWR2NzUxMyIsIC5k
YXRhID0gKHZvaWQgKilBRFY3NTExIH0sDQo+ID4gICNpZmRlZiBDT05GSUdfRFJNX0kyQ19BRFY3
NTMzDQo+ID4gIAl7IC5jb21wYXRpYmxlID0gImFkaSxhZHY3NTMzIiwgLmRhdGEgPSAodm9pZCAq
KUFEVjc1MzMgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiYWRpLGFkdjc1MzUiLCAuZGF0YSA9
ICh2b2lkICopQURWNzUzNSB9LA0KPiANCj4gRGl0dG8NCj4gDQo+IEknbSBub3QgYSBhZHY3NXh4
IGV4cGVydCBidXQgaXQgbG9va3Mgc2FuZS4NCj4gDQo+IE5laWwNCj4gDQo+ID4gICNlbmRpZg0K
PiA+ICAJeyB9DQo+ID4gIH07DQo+ID4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
