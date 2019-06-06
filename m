Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309637D02
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 21:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C428984D;
	Thu,  6 Jun 2019 19:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2F38984D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 19:12:22 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0007.namprd12.prod.outlook.com (10.172.118.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 19:12:19 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::3483:c2af:d182:555b]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::3483:c2af:d182:555b%6]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 19:12:19 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm: actually remove the newline for CRC source name.
Thread-Topic: [PATCH] drm: actually remove the newline for CRC source name.
Thread-Index: AQHVG84SBtC+yo3xkEe4GoK4uCyExqaO/7eA
Date: Thu, 6 Jun 2019 19:12:19 +0000
Message-ID: <60f94b35-1d4e-59fc-1801-c601946173a3@amd.com>
References: <20190605183556.3006-1-dingchen.zhang@amd.com>
In-Reply-To: <20190605183556.3006-1-dingchen.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ea22248-237c-4fb9-dbeb-08d6eab2e538
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0007; 
x-ms-traffictypediagnostic: CY4PR1201MB0007:
x-microsoft-antispam-prvs: <CY4PR1201MB0007E794CF21D4391F16DE9E8C170@CY4PR1201MB0007.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(366004)(396003)(346002)(199004)(189003)(51914003)(26005)(3846002)(102836004)(65806001)(6246003)(31686004)(36756003)(31696002)(71190400001)(71200400001)(65826007)(186003)(72206003)(7736002)(478600001)(64126003)(65956001)(66066001)(6116002)(99286004)(305945005)(6506007)(53546011)(386003)(52116002)(76176011)(81166006)(14444005)(2906002)(229853002)(256004)(14454004)(58126008)(8676002)(6512007)(68736007)(5660300002)(110136005)(486006)(81156014)(11346002)(446003)(25786009)(8936002)(6486002)(2616005)(476003)(6436002)(66556008)(66476007)(66446008)(316002)(73956011)(64756008)(66946007)(4326008)(53936002)(2501003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0007;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j5AhOw/ODmFGP1WRkszcrt43RyUVYmwXsYKwH1N2D3viyUAVIyQujnrjQXafyZnjtAG8uKAarfH9wT6SmnZMj/UjGBcyKwC36Rgqpk4rms8X2+BKlGl43RxU/7lr5x4+L9o13Qrt8213gyxIeScBqR7A7ONEF5mos2mWFR5NsJ+Zse/+rDJdgYaP/JLGRZvWQXhYju62tDRo7i1nF7O3j+6OOLwrp/qv7MNGt71ss/RL0csDRx1vTOyvjAe83pHkIIiLrYRF3AW4PqXQNiUx7BIYQLwOUw0HwUJswjYGZnmUluAINpttc/oJMlWEv0kyka5RoOtzFBo39RBaOFOLNqYPme+Re4/0jzoqoJ/0KwuakCBYU5DYA1WG1ZMpnjQ1gcNZl4UJiYedR1PlKEn7rsehIjsnaLnufreWprJ8uow=
Content-ID: <340148EE2EC13C4A94ECC9444F29820A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea22248-237c-4fb9-dbeb-08d6eab2e538
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 19:12:19.6365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0007
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28/iH1PaHFX9mPDBv9Cq9opjKblF/n3F5YUQDBhHSmI=;
 b=JipZ60/VNjOxc8Sb8hSf7HCda4b7MVzD17HMyoMHlFAXqdZ4zs9mH8pvl8mUvTWz1jDwIHWkynkgHz09KlDoXu2m2bfvodQm0XxNDeBV2sEBXnrZaN9rnrhuLkwK9+E20MmlSBrlOLlXUF9Cy4oa1gjFPj+sPSsvTpx0S+KCLhM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcXVpY2sgZm9sbG93LXVwIHRvIFNhbS4NCg0KRHJvcCB0aGUgd29yZCAi
YWN0dWFsbHkiIGZyb20gdGhlIHBhdGNoIHN1YmplY3QgbGluZS4NCg0KSXQncyBnZW5lcmFsbHkg
aGVscGZ1bCB0byBnZW5lcmF0ZSBhIDJuZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3aXRoICctdg0K
MicsIGFuZCB0byBsZWF2ZSBhIGRlc2NyaXB0aW9uIHdoYXQgdjIgY2hhbmdlZC4NCg0KQWxzbyBD
QyBhbnlvbmUgd2hvIHByZXZpb3VzbHkgY29tbWVudGVkLg0KDQpPbiAyMDE5LTA2LTA1IDI6MzUg
cC5tLiwgRGluZ2NoZW4gWmhhbmcgd3JvdGU6DQo+ICduLTEnIGlzIHRoZSBpbmRleCB0byByZXBs
YWNlIHRoZSBuZXdsaW5lIGNoYXJhY3RlciBvZiBDUkMgc291cmNlIG5hbWUuDQo+IA0KDQpBZGQg
aGVyZToNCnYyOiBVcGRhdGUgcGF0Y2ggc3ViamVjdCAoU2FtKQ0KDQo+IENjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4NCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kPEhhcnJ5LldlbnRsYW5kQGFt
ZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IERpbmdjaGVuIFpoYW5nIDxkaW5nY2hlbi56aGFuZ0Bh
bWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDQg
KystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMNCj4gaW5kZXggNTg1MTY5ZjBkY2M1Li5l
MjBhZGVmOWQ2MjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19j
cmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMNCj4gQEAgLTEz
MSw4ICsxMzEsOCBAQCBzdGF0aWMgc3NpemVfdCBjcmNfY29udHJvbF93cml0ZShzdHJ1Y3QgZmls
ZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKnVidWYsDQo+ICAJaWYgKElTX0VSUihzb3VyY2Up
KQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihzb3VyY2UpOw0KPiAgDQo+IC0JaWYgKHNvdXJjZVtsZW5d
ID09ICdcbicpDQo+IC0JCXNvdXJjZVtsZW5dID0gJ1wwJzsNCj4gKwlpZiAoc291cmNlW2xlbi0x
XSA9PSAnXG4nKQ0KPiArCQlzb3VyY2VbbGVuLTFdID0gJ1wwJzsNCj4gIA0KDQpBcyBTYW0gbWVu
dGlvbmVkLCB5b3UnbGwgd2FudCB0aGlzIHRvIGJlDQoNCisJaWYgKHNvdXJjZVtsZW4gLSAxXSA9
PSAnXG4nKQ0KKwkJc291cmNlW2xlbiAtIDFdID0gJ1wwJzsNCg0KSSBmb3Jnb3QgdG8gbWVudGlv
biB0aGlzIHRvIHlvdSBiZWZvcmUsIGJ1dCBwbGVhc2UgcnVuDQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCBvbiB5b3VyIHBhdGNoZXMgYmVmb3JlIHNlbmRpbmcgdGhlbSBhbmQgZml4IHVwDQphbnkg
ZXJyb3JzIG9yIHdhcm5pbmdzLg0KDQpIYXJyeQ0KDQo+ICAJcmV0ID0gY3J0Yy0+ZnVuY3MtPnZl
cmlmeV9jcmNfc291cmNlKGNydGMsIHNvdXJjZSwgJnZhbHVlc19jbnQpOw0KPiAgCWlmIChyZXQp
DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
