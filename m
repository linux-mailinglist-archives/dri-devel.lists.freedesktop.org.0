Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EEE5D2E1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10D989DFD;
	Tue,  2 Jul 2019 15:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061989DE5;
 Tue,  2 Jul 2019 15:29:29 +0000 (UTC)
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3769.namprd12.prod.outlook.com (10.255.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 15:29:27 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::c6d:3ac2:8785:dd09]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::c6d:3ac2:8785:dd09%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 15:29:27 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: Colin King <colin.king@canonical.com>, Oded Gabbay
 <oded.gabbay@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix potential null pointer dereference on
 pointer peer_dev
Thread-Topic: [PATCH] drm/amdkfd: fix potential null pointer dereference on
 pointer peer_dev
Thread-Index: AQHVL93opeQz06mKNEKONaZnBlSNVqa3diCA
Date: Tue, 2 Jul 2019 15:29:27 +0000
Message-ID: <66e161b2-dc6e-f8e1-c1f4-dbd15e06040a@amd.com>
References: <20190629133114.14271-1-colin.king@canonical.com>
In-Reply-To: <20190629133114.14271-1-colin.king@canonical.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 757ecf26-e31e-4c08-738b-08d6ff0211e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3769; 
x-ms-traffictypediagnostic: DM6PR12MB3769:
x-microsoft-antispam-prvs: <DM6PR12MB37695B7E22C51F2D2EA1DC7CF4F80@DM6PR12MB3769.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(6436002)(58126008)(6506007)(316002)(229853002)(4326008)(66476007)(36756003)(6486002)(54906003)(53936002)(72206003)(110136005)(486006)(66066001)(5660300002)(6512007)(478600001)(66946007)(65806001)(65956001)(68736007)(25786009)(2906002)(64126003)(73956011)(14454004)(11346002)(3846002)(64756008)(6116002)(66556008)(2616005)(31686004)(52116002)(65826007)(476003)(66446008)(26005)(256004)(14444005)(446003)(71190400001)(71200400001)(2501003)(7736002)(2201001)(76176011)(186003)(31696002)(81156014)(99286004)(86362001)(6246003)(305945005)(8936002)(53546011)(102836004)(386003)(81166006)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3769;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WUDA4MJy6tlJpk++6X9cQxBt0NgSwKFOZWLM+wOth/UMzX2K5SOj5LiQ/z4G6Ag0wDllxZJc6kGRq+W4goLNDOlKjH/p5tTbYFoEDubO00TgGp6DGHPnrz+rKeGx/te6e4BycwjNVREY9v7xwFF2j4Xcln4xmTyZM80y00394w2cD6ldQDtS3IOVnEA1EOSL5JtaP9L72DpHZfQmAGY7PlJfOtT/FDeGgTFOcxCKauCCNcYSObN3XQPILColzD6xQOZT3baF2dP2h8uEHAYWy9ZggDDo/2kfBrEMsxlOMCTFd2xhvc0bvp3C+vnSO5BDg4+UmlYx3qmyjP1nM3YEwtDq/CNGYWuu5+1c/AAkapQWHVk8GmYR9xOzYcaOI5vZWv8KHwt1bXNVYb4PwvPnfqPlm0vizrdtPB2O8Ui15Mw=
Content-ID: <F0CB789EF2E3774883C7EE5C744DAE61@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757ecf26-e31e-4c08-738b-08d6ff0211e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 15:29:27.7444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShaoyunL@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3769
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaGLpITlyDt6F8ESbhGdAWJFbp3uniLwL7WWp3B+T8o=;
 b=dNqLerigGtU9Y/Pah0VN0McCw2dEQUwo+j+jZU0tTafYOzg9TKDxGti58RTLpSyKpiZY8ZOXVsI7nTRtU3gJ2pCImxj4hjyuevunOGr1RRfZJoLtby0Iy8RO3G1XEJ8umm9B5fwP/mw1uhBm3BIZXzw3NyKgmxo/5Va+kf/NFLo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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

IEZyb20gdGhlIGNvbW1lbnRzICwgIndlIHdpbGzCoCBsb29wIEdQVXMgdGhhdCBhbHJlYWR5IGJl
IHByb2Nlc3NlZCAod2l0aCANCmxvd2VyIHZhbHVlIG9mIHByb3hpbWl0eV9kb21haW4pICIswqAg
dGhlIGRldmljZSBzaG91bGQgYWxyZWFkeSBiZWVuIA0KYWRkZWQgaW50byB0aGXCoCB0b3BvbG9n
eV9kZXZpY2VfbGlzdC7CoCBTbyBpbiB0aGlzIGNhc2UgLCANCmtmZF90b3BvbG9neV9kZXZpY2Vf
YnlfcHJveGltaXR5X2RvbWFpbiB3aWxsIG5vdCByZXR1cm4gYSBOVUxMIHBvaW50ZXIuwqAgDQpJ
ZiB5b3UgcmVhbGx5IGdldCB0aGUgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlcyBoZXJlICwgd2Ug
bXVzdCBoYXZlwqAgDQpzb21lIGJpZ2dlciBwcm9ibGVtIGFuZMKgIGNhbiBub3Qgc29sdmVkIGJ5
IGFkZGVkIHRoZSBudWxsIGNoZWNrIGhlcmUuDQoNClJlZ2FyZHMNCg0Kc2hhb3l1bi5saXUNCg0K
T24gMjAxOS0wNi0yOSA5OjMxIGEubS4sIENvbGluIEtpbmcgd3JvdGU6DQo+IEZyb206IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+DQo+IFRoZSBjYWxsIHRvIGtm
ZF90b3BvbG9neV9kZXZpY2VfYnlfcHJveGltaXR5X2RvbWFpbiBjYW4gcmV0dXJuIGEgTlVMTA0K
PiBwb2ludGVyIHNvIGFkZCBhIG51bGwgcG9pbnRlciBjaGVjayBvbiBwZWVyX2RldiB0byB0aGUg
ZXhpc3RpbmcgbnVsbA0KPiBwb2ludGVyIGNoZWNrIG9uIHBlZXJfZGV2LT5ncHUgdG8gYXZvaWQg
YW55IHBvdGVudGlhbCBudWxsIHBvaW50ZXINCj4gZGVyZWZlcmVuY2VzLg0KPg0KPiBBZGRyZXNz
ZXMtQ292ZXJpdHk6ICgiRGVyZWZlcmVuY2Ugb24gbnVsbCByZXR1cm4gdmFsdWUiKQ0KPiBGaXhl
czogYWU5YTI1YWVhN2YzICgiZHJtL2FtZGtmZDogR2VuZXJhdGUgeEdNSSBkaXJlY3QgaW9saW5r
IikNCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYyB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jDQo+IGluZGV4IDRlM2ZjMjg0
ZjZhYy4uY2I2YjQ2Y2ZhNmMyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfY3JhdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9j
cmF0LmMNCj4gQEAgLTEyOTMsNyArMTI5Myw3IEBAIHN0YXRpYyBpbnQga2ZkX2NyZWF0ZV92Y3Jh
dF9pbWFnZV9ncHUodm9pZCAqcGNyYXRfaW1hZ2UsDQo+ICAgCWlmIChrZGV2LT5oaXZlX2lkKSB7
DQo+ICAgCQlmb3IgKG5pZCA9IDA7IG5pZCA8IHByb3hpbWl0eV9kb21haW47ICsrbmlkKSB7DQo+
ICAgCQkJcGVlcl9kZXYgPSBrZmRfdG9wb2xvZ3lfZGV2aWNlX2J5X3Byb3hpbWl0eV9kb21haW4o
bmlkKTsNCj4gLQkJCWlmICghcGVlcl9kZXYtPmdwdSkNCj4gKwkJCWlmICghcGVlcl9kZXYgfHwg
IXBlZXJfZGV2LT5ncHUpDQo+ICAgCQkJCWNvbnRpbnVlOw0KPiAgIAkJCWlmIChwZWVyX2Rldi0+
Z3B1LT5oaXZlX2lkICE9IGtkZXYtPmhpdmVfaWQpDQo+ICAgCQkJCWNvbnRpbnVlOw0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
