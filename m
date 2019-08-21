Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C95097EBE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10C6E96B;
	Wed, 21 Aug 2019 15:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB116E96B;
 Wed, 21 Aug 2019 15:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2SFVj0iNPBrnhbDH0L17RxeUPtFXGKHiU9cml9oCTac5j2oWAV3pGSbtgivVnFyyEaPH+I6d8rs/cr71glyOmwBy5D7UE4bijKEgVS5LontGtV+vAHLCJmg1kCD1a7eO1eQ5GUzABbmr60H8tMT6GQambR4UOPZzVpUsTQntoztc9VmMoq4qQrFuG+7nyMaeWrtn+0Y+JL9F3AJEmrm9/YdXNrAbn1oadf1RB5H+V2ccbUxtrIfSJqaP90+jlL17jiBQBMLBfaFqs/FeAw8OHwLNnmmrHyXBb6PJOOFq3oAjeJ02kALa/FeFl7ZLVQg/zvpz4vAceyAXB6lSycjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mli6jvBjbs/d2XkF6HGpkw/0hIMaNoWefem435ahKt0=;
 b=UUpnnXisL06+gAR4pnmpSq59ixIbxLjZgmI9piVq59lRMHc7g1jwpnznBl1E73IptszJBH5jGLWiLmrsiUq6eCB3N+5rt0aF8TjBOheL3xQlzA/5hWzFUzL7s+AIIW8Dto3nJufA7rra4DCE2hbgcjs7zKi3CkjjlVhgNGe4qbgnCiyM0xOEfK2boYpc7w//JVFEj+q+X0k/3B2T/+wSD/RzB8G761aaTrR6oczMMNVLjG4Jflp69EeGtNzRwvkxES0RjXIPTjf4+1KlvQkbKnWXRsNXx167gLrom9isZRj40dC630paxZpyCkJ88wle/NNMLrRofe5dpapxC1QwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3210.namprd12.prod.outlook.com (20.179.105.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Wed, 21 Aug 2019 15:34:12 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 15:34:12 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 19 (amdgpu)
Thread-Topic: linux-next: Tree for Aug 19 (amdgpu)
Thread-Index: AQHVVvkHnhljkcO1/U2zanY7nY0Cr6cD+eWAgAHD6IA=
Date: Wed, 21 Aug 2019 15:34:12 +0000
Message-ID: <b60eb195-7263-2ba0-e8d9-8412c0de66e0@amd.com>
References: <20190819191832.03f1a579@canb.auug.org.au>
 <ba3cde82-6163-12e5-2e77-36834454113a@infradead.org>
 <20190820114554.0e522651@canb.auug.org.au>
 <20190820123637.GB29225@mellanox.com>
In-Reply-To: <20190820123637.GB29225@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21d88906-7fbb-4ac3-3961-08d7264d040d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3210; 
x-ms-traffictypediagnostic: DM6PR12MB3210:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <DM6PR12MB32100880905B708D16C1930292AA0@DM6PR12MB3210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(53754006)(189003)(199004)(256004)(486006)(2616005)(11346002)(8936002)(102836004)(7736002)(58126008)(316002)(26005)(305945005)(478600001)(110136005)(446003)(54906003)(386003)(6506007)(5024004)(36756003)(31686004)(53546011)(229853002)(52116002)(6436002)(8676002)(6486002)(186003)(6116002)(81156014)(4326008)(3846002)(86362001)(81166006)(6306002)(2906002)(71190400001)(65956001)(53936002)(99286004)(64756008)(66946007)(66556008)(25786009)(66446008)(66476007)(65806001)(5660300002)(476003)(71200400001)(14454004)(76176011)(31696002)(6246003)(66066001)(6512007)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3210;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w0FBx5HiVrYdA0ptUAvB9pLzy4CiZl8VboF7DJewlHRdPVxhjcH6+K3uoJvgkKcsxzkaeqZYHJ2V9DycKfay1sY51+fNGH6W70fuaEcPeDRcS+9l+g4ztIozzMGfnkikMhrYAFXVMxseym6dbbiz4vmZymkF1cII827X0jzoJLotCCzQIkL1AdXvULfZa4TtYJkZ8OBsvobPEf6oewm/3ZIZNF1S7K/1dmBaLFquyI+eBzw5Fca4Ud8aiIwxcEQCx2hLgxENlEcx5SrXCaQ/EDOrIvkUcXlfb06/IEkQWiAyNpc4MAQYG68QkIs2sBNcmbWnxr9WtRWtkVUyGKlKRaaeWsPnO7ja6hQRxXEhlvHyXDbPRqlY0Ju9GVIdmwxGphJbr6ibPAnyiPA6tG5N1SStykOJ3e4im7qhoq532Rw=
x-ms-exchange-transport-forked: True
Content-ID: <238BD86B5AD73E4A8AF2E505FC0AFC7D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d88906-7fbb-4ac3-3961-08d7264d040d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 15:34:12.1035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODZcz4Hws2xux1OG3YHfzkUdwDEi+9fVsMvECwKIb8i+GrdjLs1dzhErQt+VP9RHBhDfnyemmOsxR9FKfVGXBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mli6jvBjbs/d2XkF6HGpkw/0hIMaNoWefem435ahKt0=;
 b=HZeQWZtHktEqbFYjPbtrbjw5zdQtENG0mdZtX1henMhs+vhcnsTwU3CUyGuAuBJp+7M4VAqTUvigzOYl/4hKTebCkJptLUBXbmcAYZV4e29wLmS4IVwwTYzIK3cHcNMjkwgBtDqQXl1WzyC7XyKAh5E44+Te/kklXcTw05Tycaw=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA4LTIwIDg6MzYgYS5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBPbiBU
dWUsIEF1ZyAyMCwgMjAxOSBhdCAxMTo0NTo1NEFNICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdy
b3RlOg0KPj4gSGkgYWxsLA0KPj4NCj4+IE9uIE1vbiwgMTkgQXVnIDIwMTkgMTg6MzQ6NDEgLTA3
MDAgUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOg0KPj4+IE9uIDgv
MTkvMTkgMjoxOCBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCj4+Pj4gSGkgYWxsLA0KPj4+
Pg0KPj4+PiBDaGFuZ2VzIHNpbmNlIDIwMTkwODE2Og0KPj4+PiAgICANCj4+PiBvbiB4ODZfNjQ6
DQo+Pj4NCj4+PiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmM6IElu
IGZ1bmN0aW9uIOKAmGFtZGdwdV9leGl04oCZOg0KPj4+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYzoxNDcxOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiDigJhtbXVfbm90aWZpZXJfc3luY2hyb25pemXigJk7IGRpZCB5b3UgbWVhbiDi
gJhfX3N5bmNfc3luY2hyb25pemXigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQ0KPj4+ICAgIG1tdV9ub3RpZmllcl9zeW5jaHJvbml6ZSgpOw0KPj4+ICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+ICAgIF9fc3luY19zeW5jaHJvbml6ZQ0KPj4+DQo+Pj4N
Cj4+PiBGdWxsIHJhbmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4NCj4+IENhdXNlZCBieSBjb21t
aXQNCj4+DQo+PiAgICA2ODMyYzlkYzgzNTggKCJobW06IHVzZSBtbXVfbm90aWZpZXJfZ2V0L3B1
dCBmb3IgJ3N0cnVjdCBobW0nIikNCj4+DQo+PiBmcm9tIHRoZSBobW0gdHJlZS4NCj4+DQo+PiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgbmVlZCB0byBpbmNsdWRlIGxp
bnV4L21tdV9ub3RpZmllci5oDQo+IEFoIHllcywgdGhhbmtzLCBpdCBpcyBiZWNhdXNlIG9mICFD
T05GSUdfSE1NX01JUlJPUiBpbiB0aGlzDQo+IHJhbmRjb25maWcuIEkndmUgZml4ZWQgaXQgdXAu
DQoNClRoYW5rcyBKYXNvbi4gSSdtIHRyeWluZyB0byBmb2xsb3cgd2hhdCdzIGdvaW5nIG9uIGhl
cmUsIGJ1dCBJIGNhbid0IA0KZmluZCB0aGUgY29tbWl0IGhhc2ggcXVvdGVkIGFib3ZlIGluIGFu
eSBvZiB0aGUgcHVibGljIHJlcG9zaXRvcmllcyBJJ20gDQp0cmFja2luZzoNCg0KaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xp
bnV4LW5leHQuZ2l0DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9yZG1hL3JkbWEuZ2l0DQpzc2g6Ly9naXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0vZHJt
DQpzc2g6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eA0Kc3NoOi8vcGVvcGxl
LmZyZWVkZXNrdG9wLm9yZy9+Z2xpc3NlL2xpbnV4DQoNCldoZXJlIGlzIHRoaXMgd29yayBoYXBw
ZW5pbmc/DQoNClRoYW5rcywNCiDCoCBGZWxpeA0KDQoNCg0KPg0KPiBSZWdhcmRzLA0KPiBKYXNv
bg0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
