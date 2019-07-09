Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48A63BB7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C77F6E090;
	Tue,  9 Jul 2019 19:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690063.outbound.protection.outlook.com [40.107.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AA56E079;
 Tue,  9 Jul 2019 19:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZW7zoNtnVSapxjW4tZu6+/m2riKHQb13RzP121DV6OyNK7HIPuFDKqD35oALJTwK8ez2ogsNAxyWvaFGyR2hYte1xvD8aBfP3slOgHOI5PDtZF65An/I1TdylwPpCUP4Nt9BRrRbj8eaLkR1Sn1BiQgiKcl+IKGb0y5hA7CZ00gsOW2TUz7o9P38mhHtHSw2STDFMESu+o9wUIs692C7DrQjvAMkrqhgEQTkXGK3wo5KDrJyLPCjdwDsT8lZg3r9ShXtidsPPuNQ1v1FSh784ae5oa47ui2ouqFob21ok1YHiJ+QnOqmo08DGEY519zfON58OhQmNFAC7unaGGY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbiuvTeOZKYD0jDWyUuZaIUZjtss/aYLFF8JUyTbFD4=;
 b=MpyU/HK9tKcrTG+Sy+/mSWQjNjfOKAlPcjy7Y0Cg+ievZvUMwvsRWXEqFC0ZQk1bKDv5vI+IFoA7KQNSapo7FlvXQMegDLusDti+xEm9LHFKDc73rwC2ycaHTdaLRZGPSg9zBUDNsLLXrEHvQXRC0MzQ1O+jNN0AvxcZJOHzrjtfW5z64XTtYjOoBO7JgWOFvX8vw9+ZztoEtzLeFnABQcVL9JbwborxIh3sq8u5YMvI/8gq30M9xjpnfHrTLE/R82iF6E1ouVjtT6+EPii4v8NIQhA9n2j3yxSOqzyxws1/FVXT+MxXLYC3GNux2cs0/pF3fw3oien6Hm3QLvnyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2789.namprd12.prod.outlook.com (20.177.126.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 19:10:56 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69%3]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 19:10:56 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 00/10] Enable MST Aux devices (v2)
Thread-Topic: [PATCH 00/10] Enable MST Aux devices (v2)
Thread-Index: AQHVMpuUgatf9EHhe0Sm3Z1iR8yYrabCrteA
Date: Tue, 9 Jul 2019 19:10:56 +0000
Message-ID: <75484f00-80ad-2beb-a96e-85c4b3b2a7fd@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::31) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5e63525-119f-411b-eda7-08d704a12b4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2789; 
x-ms-traffictypediagnostic: BYAPR12MB2789:
x-microsoft-antispam-prvs: <BYAPR12MB278981EAD2E1416DE6C4A61782F10@BYAPR12MB2789.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(199004)(189003)(53754006)(6512007)(386003)(6506007)(66066001)(476003)(2616005)(2906002)(186003)(99286004)(53936002)(86362001)(53546011)(11346002)(68736007)(6436002)(72206003)(14454004)(446003)(31696002)(2501003)(6246003)(6486002)(36756003)(229853002)(54906003)(25786009)(81156014)(76176011)(26005)(52116002)(81166006)(110136005)(4326008)(8936002)(8676002)(66556008)(66946007)(7736002)(3846002)(64756008)(66446008)(66476007)(102836004)(478600001)(6116002)(31686004)(73956011)(305945005)(486006)(71200400001)(316002)(256004)(71190400001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2789;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U0bX3Szwe32H2hBvpsQETfGxPXA8x+cmK8opIIA/+e/bwYsEAAHQKGmRgV1i0HVjzMPFKf50epCGCXVdR2b+56hTC/9P/zY2iZGGkzuDZ48m+owSOEXwmot9o6qt7loUirk1+3e9ayDTVUNSRKteln8fTDijA/SCQ8fvg4ZsCTAcNvZns4/lRuO+iMXfFb+KtlzWPoDUcq61GCpgFPaS7T68bFLSlvsObktH8NZo6KUteVue+AdGv+GqinFp9gj40p77eKx3aVW4fDrFJozaWSo80dX8vQjCizMyhnH9iKbUxeDsoeLRGC33dwqaYK8qwkrTEjeSjhw/23Ther/IV8AMou/hnBZ9iCd99FmkP8rp8QCMJDBJcj/LOnyx8i2m+aCKRm8gR9IfKMMi82+cwtcS4zDrA2jXQ5gpovmpEBw=
Content-ID: <9BAE3970AF72AA4D8E9F579C1AFA5D0C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e63525-119f-411b-eda7-08d704a12b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 19:10:56.4420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2789
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbiuvTeOZKYD0jDWyUuZaIUZjtss/aYLFF8JUyTbFD4=;
 b=zImP4MPq3Yv0R6UAxMQpuA4Vw2mjM91iRohitU2cZICz7kprmt65k1tn/YtHA62DLwwzE8yY/AmUO4fmoBhOgNcSMUGlr334+NFDx+W6hLM0rIscF7URCxUmCd/zwDnco5y2eW+wEWZ6yOAHzSyZuAAEVQLW1/nsiIWcj1CRPe0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpIaSBMeXVkZSwgc29ycnkgLSBqdXN0IHJlYWxpemVkIEkgZm9yZ290IHRvIENDIHlvdSBvbiB0
aGlzIHNlcmllcyEgTGV0DQptZSBrbm93IGlmIEkgc2hvdWxkIHJlc2VuZCB0aGVtLg0KDQpBZGRp
bmcgc29tZSBhZGRpdGlvbmFsIHJldmlld2VycyBhcyB3ZWxsLg0KDQpUaGFua3MsDQpMZW8NCg0K
T24gMjAxOS0wNy0wNCAzOjA1IHAubS4sIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToNCj4gRnJv
bTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IA0KPiBIaSBhbGwsDQo+IA0KPiBIZXJl
J3MgdGhlIHNlY29uZCByZXZpc2lvbiBvZiBwYXRjaGVzIHRvIGVuYWJsZSBtc3QgYXV4IGRldmlj
ZXMuDQo+IA0KPiB2MiBmaXhlcyBhbiBhdXggZGV2aWNlIHVucmVnaXN0cmF0aW9uIGlzc3VlIGR1
cmluZyBkcml2ZXIgdW5sb2FkLiBTZWUNCj4gcGF0Y2ggMi8xMCBmb3IgZGV0YWlscy4gQ29uc2Vx
dWVudGx5LCBkcml2ZXJzIHN1cHBvcnRpbmcgbXN0IGFyZQ0KPiBtb2RpZmllZCB0byB1c2UgdGhl
IG5ldyBtc3QgY29ubmVjdG9yIGxhdGUgcmVnaXN0ZXIgYW5kIGVhcmx5IHVucmVnaXN0ZXINCj4g
aGVscGVycy4NCj4gDQo+IFRoYW5rcywNCj4gTGVvDQo+IA0KPiBMZW8gTGkgKDkpOg0KPiAgIGRy
bS9kcDogVXNlIG5vbi1jeWNsaWMgaWRyDQo+ICAgZHJtL3N5c2ZzOiBBZGQgbXN0cGF0aCBhdHRy
aWJ1dGUgdG8gY29ubmVjdG9yIGRldmljZXMNCj4gICBkcm0vbm91dmVhdTogVXNlIGNvbm5lY3Rv
ciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50DQo+ICAgZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3
OHh4OiBVc2UgY29ubmVjdG9yIGtkZXYgYXMgYXV4IGRldmljZSBwYXJlbnQNCj4gICBkcm0vYW1k
L2Rpc3BsYXk6IFVzZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudA0KPiAgIGRy
bS9pOTE1OiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0aW9uDQo+ICAgZHJtL25v
dXZlYXUva21zL252NTA6IEltcGxlbWVudCBNU1QgQXV4IGRldmljZSByZWdpc3RyYXRpb24NCj4g
ICBkcm0vcmFkZW9uOiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0aW9uDQo+ICAg
ZHJtL2FtZC9kaXNwbGF5OiBJbXBsZW1lbnQgTVNUIEF1eCBkZXZpY2UgcmVnaXN0cmF0aW9uDQo+
IA0KPiBWaWxsZSBTeXJqw6Rsw6QgKDEpOg0KPiAgIGRybS9kcF9tc3Q6IEVuYWJsZSByZWdpc3Ry
YXRpb24gb2YgQVVYIGRldmljZXMgZm9yIE1TVCBwb3J0cw0KPiANCj4gIC4uLi9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8ICAyNiArKystDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyAgICAgfCAgMjIgKy0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAgICAgICAgICAgfCAgMTkgKystDQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgfCAxMzcgKysrKysrKysr
KysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgICAgICAgICAgICAgICAg
ICAgfCAgMjMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jICAgfCAgMjkgKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlz
cC5jICAgICAgIHwgIDIwICsrKw0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9j
b25uZWN0b3IuYyAgIHwgICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cF9tc3QuYyAgICAgICAgfCAgMjIgKysrDQo+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICAgICAgICAgIHwgIDExICsrDQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAyODUgaW5z
ZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
