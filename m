Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18F973A1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D45E6E938;
	Wed, 21 Aug 2019 07:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A43A89DDD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 05:34:37 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7L5WkW8014790; Wed, 21 Aug 2019 01:34:24 -0400
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2055.outbound.protection.outlook.com [104.47.45.55])
 by mx0b-00128a01.pphosted.com with ESMTP id 2ug3mab7aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 01:34:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6I9DeXQTRRyQ5iSK61PKJ1vLABreRlp41e9VQT8DFJnIuwIoNlK2/JtYwFkMX0kHY7BUylPBY0+9DDLFV7WvuuWPGi2XAk5fa10S4yydubgTKO/f+S2KwHoI+p6phNr0qONyFTDosyv7FsSL3RuDx0eJjYmNHayI+SYbC7XCFgETG+R0xfQJRMP7VOTcq/Qo4ErjjkQa/hAXmQvy2ThtaWOCJHtN22ArwbR3FMDlcEzUYNc05icf1OXaA69x8pyR/k1X2juznLOe4nmGNvB6VDmhTDN+IG9dfxD1++TRYPpwoNfrl4xqXZBc3L17NGVBQwIN+xntt/pfwTbUDp3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xirPD+rtCNe8bUBn60WGSNnSAEPRvXka5c2bYpCjF8A=;
 b=Cb1ovSu1TI/p8/LFLTf7c+su3TTlPDAUqspE54EviGcmRYvlNMQyJlFjKv1id/GkVi5tr/3ZITuX8R0rqWYc23bsEgkqssdQhwVLDfQgoLOP6d57h0nppfHJSPaXG8UG3ZWuuC1lVveCP2XKSI8QOSnbGNkH/I5Aj6tV4ntK1W+tMg/3Bl56x8ZaefXBHbAe3fAwRdEAoBaJFaljSfSfs8RlUV62y3O09oGbv0No4Y10AbXFZRSB4I/IKLnx3bE7neQMcKzt+C9sIBTrm0ZGRgAXz85tJwsiarFKIfCOmQ6PFgm+0jlueRBGWXbLGP3Fgr85cXD/TTJRjP3KflAC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4770.namprd03.prod.outlook.com (20.179.64.223) by
 BN8PR03MB4868.namprd03.prod.outlook.com (20.178.223.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 05:34:22 +0000
Received: from BN8PR03MB4770.namprd03.prod.outlook.com
 ([fe80::d096:6c2e:91ac:39bb]) by BN8PR03MB4770.namprd03.prod.outlook.com
 ([fe80::d096:6c2e:91ac:39bb%6]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 05:34:22 +0000
From: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Topic: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Index: AQHVTr0hmVnX1zVUNEq8UIbUXOMh2qby78kAgA9LnQCAAB3GAIABctKAgAGM+wA=
Date: Wed, 21 Aug 2019 05:34:22 +0000
Message-ID: <ccba9a66c6d5db8a295353b16084c6a1199f31dc.camel@analog.com>
References: <20190809141611.9927-1-bogdan.togorean@analog.com>
 <20190809141611.9927-3-bogdan.togorean@analog.com>
 <20190809152510.GA23265@ravnborg.org>
 <c99cfbd3dc45bb02618e7653c33022f3553e1cce.camel@analog.com>
 <20190819104616.GA15890@ravnborg.org>
 <20190820085329.GC11147@phenom.ffwll.local>
In-Reply-To: <20190820085329.GC11147@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f362487-0ebb-4c4e-3897-08d725f938d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR03MB4868; 
x-ms-traffictypediagnostic: BN8PR03MB4868:
x-microsoft-antispam-prvs: <BN8PR03MB4868B74300A53F9EEA69AA5A9BAA0@BN8PR03MB4868.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(476003)(446003)(11346002)(2616005)(486006)(478600001)(14454004)(6512007)(186003)(316002)(110136005)(229853002)(54906003)(99286004)(26005)(7416002)(71190400001)(71200400001)(6506007)(5660300002)(102836004)(76116006)(305945005)(6246003)(86362001)(4326008)(8676002)(36756003)(81166006)(81156014)(66066001)(118296001)(6116002)(3846002)(2501003)(91956017)(64756008)(66476007)(7736002)(66946007)(66446008)(66556008)(256004)(76176011)(6436002)(6486002)(53936002)(8936002)(25786009)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR03MB4868;
 H:BN8PR03MB4770.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MyJSq99kDTZJVqBlKWe4npJjPySNVQQpC9aDMxhIg2vM+MHM4ucW8mowSmSWnXHp0eVnSNwSXwCp2yJdyL60K6PHyGlE4DxdNACIDaY4GO44hW1S4xAyjp5ldXT10+buKPRyiP0YRd5OlEHJQspCHCS4k8ziWTlUCMmnHsHsm05RJ7etBNo5C33aat0Cso9HxhJ51iTiAjgv7R6gYPC4CWSNq2U5gi4XPMjqBtbn5jn/zDEkTNamhC0Bv0Pb/+7efB09OOqB3Nka1xS/fK4pUOCIGPiy2T8QThO6SF01BGbVVGKe0Wp3qKTMk0FNkgFNYU9HG5BZC6pdKopl4u6LotPna0Qj2upnVsUuHXCthMFOym30MJmj6h66mgPgzDTfqzRy4HC//Dh2aAetL+YJ4WIatqyssugZ/GmR6CASGMM=
x-ms-exchange-transport-forked: True
Content-ID: <98805991ABBC544694582903F3984374@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f362487-0ebb-4c4e-3897-08d725f938d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 05:34:22.3990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtkERW8I/SAbf12VW+l0wW38HszfxW5RGbylTOfZrjTj0qlFuFsqjzyBI4IhwhNJOhn0jYvB9b5liHySKjrzE1L5hbUQco+j77cK3fK9vOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4868
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210060
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xirPD+rtCNe8bUBn60WGSNnSAEPRvXka5c2bYpCjF8A=;
 b=WjjyvMXb2XQmV/c0bpDVwNXAqsAQo4cjBjmPwXMQ95cQ3eTpx5vQtQPpegmMk/V6sIoAXyhOi2S8DvE506R3GPq7QfSr+ay9gXuEh28pijw+8Rh/Yp6O30VSmyCTwK+YpNZ+I3UDh1jtzKiHOjAqJjes7hn2fHCQagQB6Lq61Tg=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTIwIGF0IDEwOjUzICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCAxMjo0NjoxNlBNICsw
MjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+ID4gSGkgQm9nZGFuLg0KPiA+IA0KPiA+ID4gPiA+
ICAJCWFkdjc1MzNfZGV0YWNoX2RzaShhZHY3NTExKTsNCj4gPiA+ID4gPiAgCWkyY191bnJlZ2lz
dGVyX2RldmljZShhZHY3NTExLT5pMmNfY2VjKTsNCj4gPiA+ID4gPiAgCWlmIChhZHY3NTExLT5j
ZWNfY2xrKQ0KPiA+ID4gPiA+IEBAIC0xMjY2LDggKzEyNzgsOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQNCj4gPiA+ID4gPiBhZHY3NTExX2kyY19pZHNbXSA9IHsNCj4gPiA+
ID4gPiAgCXsgImFkdjc1MTEiLCBBRFY3NTExIH0sDQo+ID4gPiA+ID4gIAl7ICJhZHY3NTExdyIs
IEFEVjc1MTEgfSwNCj4gPiA+ID4gPiAgCXsgImFkdjc1MTMiLCBBRFY3NTExIH0sDQo+ID4gPiA+
ID4gLSNpZmRlZiBDT05GSUdfRFJNX0kyQ19BRFY3NTMzDQo+ID4gPiA+ID4gKyNpZmRlZiBDT05G
SUdfRFJNX0kyQ19BRFY3NTN4DQo+ID4gPiA+ID4gIAl7ICJhZHY3NTMzIiwgQURWNzUzMyB9LA0K
PiA+ID4gPiA+ICsJeyAiYWR2NzUzNSIsIEFEVjc1MzUgfSwNCj4gPiA+ID4gPiAgI2VuZGlmDQo+
ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGlmZGVmIG1heSBub3QgYmUgbmVlZGVkPz8NCj4gPiA+ID4g
SWYgd2UgZGlkIG5vdCBnZXQgdGhpcyB0eXBlIHdlIHdpbGwgbm90IGxvb2sgaXQgdXAuDQo+ID4g
PiBCdXQgaWYgd2UgaGF2ZSBkZWZpbmVkIGluIERUIGFkdjc1MzMvNSBkZXZpY2UgYnV0DQo+ID4g
PiBDT05GSUdfRFJNX0kyQ19BRFY3NTN4IG5vdCBzZWxlY3RlZCBwcm9iZSB3aWxsIGZhaWwgd2l0
aCBFTk9ERVYuDQo+ID4gPiBUaGF0DQo+ID4gPiB3b3VsZCBiZSBvaz8NCj4gPiANCj4gPiBXaGF0
IGRvIHdlIGdhaW4gZnJvbSB0aGlzIGNvbXBsZXhpdHkgaW4gdGhlIGVuZC4NCj4gPiBXaHkgbm90
IGxldCB0aGUgZHJpdmVyIGFsd2F5cyBzdXBwb3J0IGFsbCB2YXJpYW50cy4NCj4gPiANCj4gPiBJ
ZiB0aGlzIHJlc3VsdCBpbiBhIHNpbXBsZXIgZHJpdmVyLCBhbmQgbGVzcyBjaG9pY2VzIGluIEtj
b25maWcNCj4gPiB0aGVuIGl0IGlzIGEgd2luLXdpbi4NCj4gDQo+IFllYWggaW4gZ2VuZXJhbCB3
ZSBkb24ndCBLY29uZmlnIHdpdGhpbiBkcml2ZXJzIGluIGRybSB0byBkaXNhYmxlDQo+IHNwZWNp
ZmljDQo+IGNvZGUtcGF0aHMuIEl0J3Mgbm90IHdvcnRoIHRoZSBwYWluLg0KQWNrLA0KVGhhbmsg
eW91IGZvciBjbGFyaWZpY2F0aW9uLiBXaWxsIHJlbW92ZSBpbiBWMy4NCj4gLURhbmllbA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
