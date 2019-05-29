Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6502E773
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 23:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AF46E111;
	Wed, 29 May 2019 21:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38CF6E111;
 Wed, 29 May 2019 21:30:00 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2619.namprd12.prod.outlook.com (20.176.116.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Wed, 29 May 2019 21:29:58 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 21:29:58 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Colin King <colin.king@canonical.com>, Oded Gabbay
 <oded.gabbay@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zeng, Oak" <Oak.Zeng@amd.com>
Subject: Re: [PATCH][next] drm/amdkfd: fix null pointer dereference on dev
Thread-Topic: [PATCH][next] drm/amdkfd: fix null pointer dereference on dev
Thread-Index: AQHVFjBCaD/NqbYM90qWqX83f23XTKaCnvEA
Date: Wed, 29 May 2019 21:29:58 +0000
Message-ID: <caa18dab-ac66-a909-1d94-3dc5604971da@amd.com>
References: <20190529150734.18120-1-colin.king@canonical.com>
In-Reply-To: <20190529150734.18120-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f05e16e4-a41c-4100-fe8a-08d6e47cccb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2619; 
x-ms-traffictypediagnostic: DM6PR12MB2619:
x-microsoft-antispam-prvs: <DM6PR12MB2619AF60555BE877914D50C9921F0@DM6PR12MB2619.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(58126008)(8676002)(6486002)(6512007)(81166006)(68736007)(73956011)(71200400001)(486006)(6246003)(54906003)(110136005)(476003)(6436002)(86362001)(71190400001)(31696002)(2201001)(66476007)(66556008)(64756008)(66446008)(4326008)(66946007)(446003)(65826007)(6636002)(316002)(53546011)(81156014)(2501003)(305945005)(6506007)(26005)(25786009)(256004)(14444005)(64126003)(31686004)(229853002)(14454004)(52116002)(5660300002)(76176011)(478600001)(99286004)(3846002)(65806001)(6116002)(65956001)(72206003)(7736002)(2616005)(11346002)(8936002)(2906002)(102836004)(53936002)(186003)(386003)(66066001)(36756003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2619;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P7mYtFDx4WcjP8s3+WcrbTEr4iHd0bHJqCOKXWekomMaa85ADTo2tQgLFksoCLYa3MG/HHe2al7ZvJxsm5YKZN6tlcmttiyPsWwZBbHeNhKsGQ8SeBH1YWbmHadBrp+V+lBYIC0gyFLKwXx09RkqzwnZuUUBhZoLT8C4jKHIS56aPdyqzJ99/CnkH90n+ZrDraCY2Y3gL67rUmPSS7Td+8Ux21b3lrDydVMPpkJACzy4Qx3kCg8phyWtBUhESSp4sKjZhdvrmiemGxg4BqCifuJS8GlhZ44nCM4gfMHwO6QaEoe5xxF2WYPdfpOscIW1aNcoqi6ghkU5mBLryZ7sKhlNdVphvHXMEVJmw4B9kdEOmHxXZz8C3Og/e7wB5mZlvDGcZre0eh9HzBoEmkzOqEeNkuzpGD+j9+agWEQZhcs=
Content-ID: <5DDDE1C51BFA0C4CA50EF3091B91A1F2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05e16e4-a41c-4100-fe8a-08d6e47cccb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 21:29:58.3261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2619
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvGgg2zOXK0CfpVwnqsUlEGhaIB8BTrOOnD28S2534g=;
 b=weCrRJGrcw19BfcL6MrzfZ5vpJnKT+xdj2+lE6+oo/XKbIghfrTRlxfwKY+C/sKEPwOdqIpbagI3BDXdP7JzF98uVKdovOkV3KtwDOJsZlBukf1RPQfTqahqMTWuAXjlwAoIbh5ERDedT2WLtUuPAzGBVNUE6xo3PowTm45C5QQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yOSAxMTowNyBhLm0uLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBGcm9tOiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPg0KPiBUaGUgcG9pbnRlciBk
ZXYgaXMgc2V0IHRvIG51bGwgeWV0IGl0IGlzIGJlaW5nIGRlcmVmZXJlbmNlZCB3aGVuDQo+IGNo
ZWNraW5nIGRldi0+ZHFtLT5zY2hlZF9wb2xpY3kuICBGaXggdGhpcyBieSBwZXJmb3JtaW5nIHRo
ZSBjaGVjaw0KPiBvbiBkZXYtPmRxbS0+c2NoZWRfcG9saWN5IGFmdGVyIGRldiBoYXMgYmVlbiBh
c3NpZ25lZCBhbmQgbnVsbA0KPiBjaGVja2VkLiAgQWxzbyByZW1vdmUgdGhlIHJlZHVuZGFudCBu
dWxsIGFzc2lnbm1lbnQgdG8gZGV2Lg0KPg0KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRXhwbGlj
aXQgbnVsbCBkZXJlZmVyZW5jZSIpDQo+IEZpeGVzOiAxYTA1OGMzMzc2NzYgKCJkcm0vYW1ka2Zk
OiBOZXcgSU9DVEwgdG8gYWxsb2NhdGUgcXVldWUgR1dTIikNCj4gU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEZl
bGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQpUaGFua3MhDQoNCiDCoCBG
ZWxpeA0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2
LmMgfCA3ICsrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMN
Cj4gaW5kZXggYWFiMmFhNmMxZGVlLi5lYTgyODI4ZmRjNzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBAQCAtMTU3MiwxMCArMTU3Miw5IEBAIHN0
YXRpYyBpbnQga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3cyhzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+
ICAgew0KPiAgIAlpbnQgcmV0dmFsOw0KPiAgIAlzdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVl
X2d3c19hcmdzICphcmdzID0gZGF0YTsNCj4gLQlzdHJ1Y3Qga2ZkX2RldiAqZGV2ID0gTlVMTDsN
Cj4gKwlzdHJ1Y3Qga2ZkX2RldiAqZGV2Ow0KPiAgIA0KPiAtCWlmICghaHdzX2d3c19zdXBwb3J0
IHx8DQo+IC0JCWRldi0+ZHFtLT5zY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19I
V1MpDQo+ICsJaWYgKCFod3NfZ3dzX3N1cHBvcnQpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4g
ICANCj4gICAJZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOw0KPiBAQCAtMTU4
Myw2ICsxNTgyLDggQEAgc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVj
dCBmaWxlICpmaWxlcCwNCj4gICAJCXByX2RlYnVnKCJDb3VsZCBub3QgZmluZCBncHUgaWQgMHgl
eFxuIiwgYXJncy0+Z3B1X2lkKTsNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIAl9DQo+ICsJ
aWYgKGRldi0+ZHFtLT5zY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpDQo+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiAgIAltdXRleF9sb2NrKCZwLT5tdXRleCk7DQo+
ICAgCXJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5wcW0sIGFyZ3MtPnF1ZXVlX2lkLCBhcmdzLT5u
dW1fZ3dzID8gZGV2LT5nd3MgOiBOVUxMKTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
