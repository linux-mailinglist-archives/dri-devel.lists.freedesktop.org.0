Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804F5D614
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 20:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03C489FD9;
	Tue,  2 Jul 2019 18:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800081.outbound.protection.outlook.com [40.107.80.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BCB89FED;
 Tue,  2 Jul 2019 18:24:56 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3849.namprd12.prod.outlook.com (10.255.173.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 18:24:54 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 18:24:54 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, Colin King
 <colin.king@canonical.com>, Oded Gabbay <oded.gabbay@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix potential null pointer dereference on
 pointer peer_dev
Thread-Topic: [PATCH] drm/amdkfd: fix potential null pointer dereference on
 pointer peer_dev
Thread-Index: AQHVLn7w/1A+I6Iai0CeKYDxl+5Y0qa3eOCAgAAxAwA=
Date: Tue, 2 Jul 2019 18:24:54 +0000
Message-ID: <20c82f01-af9f-f1b9-ec0e-9f66e5769894@amd.com>
References: <20190629133114.14271-1-colin.king@canonical.com>
 <66e161b2-dc6e-f8e1-c1f4-dbd15e06040a@amd.com>
In-Reply-To: <66e161b2-dc6e-f8e1-c1f4-dbd15e06040a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09e9044d-d69c-4b98-21ff-08d6ff1a945a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3849; 
x-ms-traffictypediagnostic: DM6PR12MB3849:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3849CFBEA5F23003FD8337FC92F80@DM6PR12MB3849.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(446003)(2616005)(476003)(65956001)(65806001)(11346002)(66066001)(26005)(186003)(14454004)(76176011)(52116002)(81156014)(386003)(53546011)(6506007)(81166006)(102836004)(72206003)(966005)(53936002)(6512007)(31686004)(478600001)(8676002)(6486002)(64756008)(66476007)(66556008)(6436002)(2906002)(8936002)(73956011)(66946007)(66446008)(4326008)(3846002)(71190400001)(6246003)(71200400001)(486006)(229853002)(14444005)(256004)(5660300002)(6306002)(65826007)(6116002)(2501003)(2201001)(110136005)(36756003)(305945005)(58126008)(68736007)(25786009)(7736002)(64126003)(31696002)(86362001)(99286004)(54906003)(316002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3849;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V9/RGeSXAAyAF2vAXbkjtOC2j6iesNrkYdL25PtSCKi4B2fxwO2bwUpX8gT5jWAXZeb9EOE/n/fHLGiGLfzzESVqsot9B1ncqM0OlGb3Er2E4cGp6vz7E5ewHBgY3q+erd8YxQHTFswoy9eafl+r3Pu1NYAxB2iI3oq2LgzOpuukJiq6lhG1eF3cRifBpcJjMlIhsFxDrTg0S+105Gj+Vb1G/Rhgt6DqVuHcCQv4IXsmo9k1+W4+Y31q4z+YP0Z2yRtwTtXn2kXVuGcTipqHqZJecMuA3Np9JeSaJX0DYNa/jf5A6rZne+WWpts1Dfj9xgGT2I9xo013fl7AaPCrZM3bRJdp2+MXLd8Nm2pHkA7GpzgtmeJBiQxJ1z9jg8z5xxgSgN0fSE8LySukthOy6HLGqYg1nfzqmMrmfxKMi38=
Content-ID: <E7ADE144E744024F8F488F963C141A91@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e9044d-d69c-4b98-21ff-08d6ff1a945a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 18:24:54.5559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJI/PL/iSbhsETb8zQPLvnsrNHVmwMMtXVYvo7atOb8=;
 b=dHp8k7O0lAnswMlcExAEMWKPAIGeYmNzX5l6dYZ1iOjb31QMQ+cn6lnHJzj6wcjl92w5q4D3N80e200iLQ6gQi/yNPLZnYBtuYsARlsogOEuB96YCQwdb+FHt2KcrJcBAO7QRcQFdLTHanCLI4L2M3NNRAZs7AaP9kAoXpqK7ww=
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

SSB0aGluayB0aGlzIGNvdWxkIGhhcHBlbiBpZiBLRkQgaW5pdGlhbGl6YXRpb24gZmFpbHMgZm9y
IGEgZGV2aWNlLiANCkN1cnJlbnRseSB3ZSdkIGFkZCB0aGUgZGV2aWNlLCBhbmQgdGhlbiByZW1v
dmUgaXQgYWdhaW4uIFRoYXQgbWF5IGxlYXZlIA0KYSBnYXAgaW4gdGhlIHByb3hpbWl0eSBkb21h
aW5zLiBPYWsganVzdCBoYWQgYSBmaXggcmVjZW50bHkgdG8gY2xlYW4gDQp0aGF0IHVwIGJ5IG9u
bHkgYWRkaW5nIEtGRCBkZXZpY2VzIHRvIHRoZSB0b3BvbG9neSBhZnRlciBzdWNjZXNzZnVsIA0K
aW5pdGlhbGl6YXRpb24uDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNy0wMiAx
MToyOSBhLm0uLCBMaXUsIFNoYW95dW4gd3JvdGU6DQo+ICAgRnJvbSB0aGUgY29tbWVudHMgLCAi
d2Ugd2lsbMKgIGxvb3AgR1BVcyB0aGF0IGFscmVhZHkgYmUgcHJvY2Vzc2VkICh3aXRoDQo+IGxv
d2VyIHZhbHVlIG9mIHByb3hpbWl0eV9kb21haW4pICIswqAgdGhlIGRldmljZSBzaG91bGQgYWxy
ZWFkeSBiZWVuDQo+IGFkZGVkIGludG8gdGhlwqAgdG9wb2xvZ3lfZGV2aWNlX2xpc3QuwqAgU28g
aW4gdGhpcyBjYXNlICwNCj4ga2ZkX3RvcG9sb2d5X2RldmljZV9ieV9wcm94aW1pdHlfZG9tYWlu
IHdpbGwgbm90IHJldHVybiBhIE5VTEwgcG9pbnRlci4NCj4gSWYgeW91IHJlYWxseSBnZXQgdGhl
IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZXMgaGVyZSAsIHdlIG11c3QgaGF2ZQ0KPiBzb21lIGJp
Z2dlciBwcm9ibGVtIGFuZMKgIGNhbiBub3Qgc29sdmVkIGJ5IGFkZGVkIHRoZSBudWxsIGNoZWNr
IGhlcmUuDQo+DQo+IFJlZ2FyZHMNCj4NCj4gc2hhb3l1bi5saXUNCj4NCj4gT24gMjAxOS0wNi0y
OSA5OjMxIGEubS4sIENvbGluIEtpbmcgd3JvdGU6DQo+PiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8
Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPj4NCj4+IFRoZSBjYWxsIHRvIGtmZF90b3BvbG9n
eV9kZXZpY2VfYnlfcHJveGltaXR5X2RvbWFpbiBjYW4gcmV0dXJuIGEgTlVMTA0KPj4gcG9pbnRl
ciBzbyBhZGQgYSBudWxsIHBvaW50ZXIgY2hlY2sgb24gcGVlcl9kZXYgdG8gdGhlIGV4aXN0aW5n
IG51bGwNCj4+IHBvaW50ZXIgY2hlY2sgb24gcGVlcl9kZXYtPmdwdSB0byBhdm9pZCBhbnkgcG90
ZW50aWFsIG51bGwgcG9pbnRlcg0KPj4gZGVyZWZlcmVuY2VzLg0KPj4NCj4+IEFkZHJlc3Nlcy1D
b3Zlcml0eTogKCJEZXJlZmVyZW5jZSBvbiBudWxsIHJldHVybiB2YWx1ZSIpDQo+PiBGaXhlczog
YWU5YTI1YWVhN2YzICgiZHJtL2FtZGtmZDogR2VuZXJhdGUgeEdNSSBkaXJlY3QgaW9saW5rIikN
Cj4+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+DQo+PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMg
fCAyICstDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Ny
YXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMNCj4+IGluZGV4IDRl
M2ZjMjg0ZjZhYy4uY2I2YjQ2Y2ZhNmMyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2NyYXQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2NyYXQuYw0KPj4gQEAgLTEyOTMsNyArMTI5Myw3IEBAIHN0YXRpYyBpbnQga2ZkX2Ny
ZWF0ZV92Y3JhdF9pbWFnZV9ncHUodm9pZCAqcGNyYXRfaW1hZ2UsDQo+PiAgICAJaWYgKGtkZXYt
PmhpdmVfaWQpIHsNCj4+ICAgIAkJZm9yIChuaWQgPSAwOyBuaWQgPCBwcm94aW1pdHlfZG9tYWlu
OyArK25pZCkgew0KPj4gICAgCQkJcGVlcl9kZXYgPSBrZmRfdG9wb2xvZ3lfZGV2aWNlX2J5X3By
b3hpbWl0eV9kb21haW4obmlkKTsNCj4+IC0JCQlpZiAoIXBlZXJfZGV2LT5ncHUpDQo+PiArCQkJ
aWYgKCFwZWVyX2RldiB8fCAhcGVlcl9kZXYtPmdwdSkNCj4+ICAgIAkJCQljb250aW51ZTsNCj4+
ICAgIAkJCWlmIChwZWVyX2Rldi0+Z3B1LT5oaXZlX2lkICE9IGtkZXYtPmhpdmVfaWQpDQo+PiAg
ICAJCQkJY29udGludWU7DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
