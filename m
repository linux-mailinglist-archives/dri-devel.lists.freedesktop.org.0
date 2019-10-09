Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B70D1785
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 20:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88CB6EA35;
	Wed,  9 Oct 2019 18:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730054.outbound.protection.outlook.com [40.107.73.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B236EA35;
 Wed,  9 Oct 2019 18:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqIOvW2g6ZznHweGbMyGHHZAI4EqM8YiVRs5TWRoLKiwDTHJlpLsgOFA//2W2cNY5CQL0gcN3pdo9IZPSOTophyfngA5t0DKuA8VJ27D1MmbDdPzHgOOPU5AYmSM8lihKI+dfLYQ+Cdo9dLnHYjSA+ssonpZc1iCklaC9lDZdicSzlGEnt2LoVXjV3DeEAqjsb3CoWRGYIRhuAFy0QAzPEazWxxWtr1kpI51iZ4vAcOUkSdzF+t6DlmLogVsCYOdZ62eEepimY6+Whxr9+8kYEm7RAQXOG67M9JvvsoTOmMUxjSW6qtf+heDRslSftUwF3bbsUQUDglgrIz1FRbrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO1j7/83vqEDcJ0ez1Y5RLRtPXVci2DdMOuZazIiCDc=;
 b=fd7F5+Ub5CfD1S7UGS8RT9juVP8jTkYboY+HzIx3uJmFf7XQWN8heWhTY/v9N8J/VnmY5Zj85TQWYW++t7eXv3iARJK74xR1jlG4wuPN4++FBPJVOur0DKhEUc+F+LPZVTv3NDQpavalkWtNolEdtViREG/iP0OU89UUSAOt8nJmwAKcznd4Ih2qtSpCUw5gYYhgemfmmX4C4n5U4s+DnMymFrBYsvoM4JZt5fGVFYfYggqdA2HIr3jNU8OpzkEzbf+B+7OSkV7MgABZTi3k0WkRd3OVFUNodvAZBZbHEKc8JG65OihLPB2fhEmrvTyqDa7VCRTKcYMPI8U074ykfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4236.namprd12.prod.outlook.com (10.141.184.142) by
 DM6PR12MB3516.namprd12.prod.outlook.com (20.179.106.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Wed, 9 Oct 2019 18:23:27 +0000
Received: from DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95]) by DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95%2]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 18:23:26 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Colin Ian King <colin.king@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx mailing list
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Topic: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Index: AQHVejcKxYM7N3T1jUOoIu2sebAn9adSieGAgAAe9gA=
Date: Wed, 9 Oct 2019 18:23:26 +0000
Message-ID: <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
In-Reply-To: <20191009163235.GT16989@phenom.ffwll.local>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To DM6PR12MB4236.namprd12.prod.outlook.com
 (2603:10b6:5:212::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7479d5e-69f5-43f8-8a80-08d74ce5c6ef
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3516CA423AD7C57999342138F9950@DM6PR12MB3516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(199004)(189003)(71190400001)(486006)(11346002)(229853002)(476003)(86362001)(2616005)(2201001)(6486002)(25786009)(6512007)(305945005)(71200400001)(7736002)(26005)(2906002)(31696002)(186003)(81166006)(81156014)(8676002)(446003)(6116002)(3846002)(6436002)(8936002)(478600001)(36756003)(66066001)(14444005)(110136005)(256004)(5660300002)(6246003)(14454004)(31686004)(52116002)(316002)(102836004)(2501003)(76176011)(53546011)(6506007)(386003)(66556008)(66446008)(99286004)(64756008)(66476007)(66946007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3516;
 H:DM6PR12MB4236.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cjSJSiOsFyPRw/SS/KZDSVlhkUKU0zfaDWfNpECXNpPGKyxNsK4qCcdbwqQ2P9oYG+/l5OE8EEqvuArzATVaSQUnVoxibYXxT6BH+2wsvKMWFZ578/oD9oc3tiITmgCd1rbnGdwAnihgVHadts8NXaIOAWel606wtlgTJKeiNAlZoONwG4HKqUdNHJaht8dfNqkg8yngKCSfY/WfD+0kZjz1iaYk3TgGvCMEscxtlRMdvZrot67iU26cU6S2xOaFlOrVBpk80Bi9TYRlU7+t5oCNrnRP+vq5VqGsaiJ6Ahk85e8sYyn5IyyZ/2Ix3ktqkJFAuYC7JuCrTnAIGSuXApLgJzqSdBO8EAcf9BjZ90/glD1NHCRKoERAMgjahvzcWbwo4lfOqAlrjGmwxHm5EbjtY2cowUddxHXqTpJ8RVI=
Content-ID: <F0D6969DDC7B294D8B3E2143A2776E83@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7479d5e-69f5-43f8-8a80-08d74ce5c6ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 18:23:26.8075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yonVU9L6GXB/YhaP00w8h1Im/6LK1yQJ3PRa6pPllLtEVnWqDyLkJLG4bcVwQxt3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO1j7/83vqEDcJ0ez1Y5RLRtPXVci2DdMOuZazIiCDc=;
 b=P8Y+lqobhPnO9vjABjLM48IpY+r+s+Pm7kwVV1bOm6LQvrctjkEPt9yBiA9dTtHZmR/9Q4hREhmqjOaAQvU3LCtTnHeBlBTTvHqRebo+SNRK0wWGzrloOfZ6z3jBjuUeLpjhJhcQYQ2cMzvsFuu9JNAHtOJuhT+liEapH0yE/u8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoZSByZWFzb24gd2UgZG9uJ3QgdXNlIGRybV9oZGNwIGlzIGJlY2F1c2Ugb3VyIHBv
bGljeSBpcyB0byBkbyBoZGNwIA0KdmVyaWZpY2F0aW9uIHVzaW5nIFBTUC9IVyAob25ib2FyZCBz
ZWN1cmUgcHJvY2Vzc29yKS4NCg0KQmhhd2FuDQoNCk9uIDIwMTktMTAtMDkgMTI6MzIgcC5tLiwg
RGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6MDg6MDNQ
TSArMDEwMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBTdGF0aWMgYW5h
bHlzaXMgd2l0aCBDb3Zlcml0eSBoYXMgZGV0ZWN0ZWQgYSBwb3RlbnRpYWwgaXNzdWUgd2l0aA0K
Pj4gZnVuY3Rpb24gdmFsaWRhdGVfYmtzdiBpbg0KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaGRjcC9oZGNwMV9leGVjdXRpb24uYyB3aXRoIHJlY2VudA0KPj4gY29tbWl0
Og0KPj4NCj4+IGNvbW1pdCBlZDlkOGUyYmNiMDAzZWM5NDY1OGNhZmU5YjFiYjM5NjBlMjEzOWVj
DQo+PiBBdXRob3I6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29t
Pg0KPj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6MDEgMjAxOSAtMDQwMA0KPj4NCj4+ICAgICAg
ZHJtL2FtZC9kaXNwbGF5OiBBZGQgSERDUCBtb2R1bGUNCj4gSSB0aGluayB0aGUgcmVhbCBxdWVz
dGlvbiBoZXJlIGlzIC4uLiB3aHkgaXMgdGhpcyBub3QgdXNpbmcgZHJtX2hkY3A/DQo+IC1EYW5p
ZWwNCj4NCj4+DQo+PiBUaGUgYW5hbHlzaXMgaXMgYXMgZm9sbG93czoNCj4+DQo+PiAgIDI4IHN0
YXRpYyBpbmxpbmUgZW51bSBtb2RfaGRjcF9zdGF0dXMgdmFsaWRhdGVfYmtzdihzdHJ1Y3QgbW9k
X2hkY3AgKmhkY3ApDQo+PiAgIDI5IHsNCj4+DQo+PiBDSUQgODk4NTIgKCMxIG9mIDEpOiBPdXQt
b2YtYm91bmRzIHJlYWQgKE9WRVJSVU4pDQo+Pg0KPj4gMS4gb3ZlcnJ1bi1sb2NhbDoNCj4+IE92
ZXJydW5uaW5nIGFycmF5IG9mIDUgYnl0ZXMgYXQgYnl0ZSBvZmZzZXQgNyBieSBkZXJlZmVyZW5j
aW5nIHBvaW50ZXINCj4+ICh1aW50NjRfdCAqKWhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3YuDQo+
Pg0KPj4gICAzMCAgICAgICAgdWludDY0X3QgbiA9ICoodWludDY0X3QgKiloZGNwLT5hdXRoLm1z
Zy5oZGNwMS5ia3N2Ow0KPj4gICAzMSAgICAgICAgdWludDhfdCBjb3VudCA9IDA7DQo+PiAgIDMy
DQo+PiAgIDMzICAgICAgICB3aGlsZSAobikgew0KPj4gICAzNCAgICAgICAgICAgICAgICBjb3Vu
dCsrOw0KPj4gICAzNSAgICAgICAgICAgICAgICBuICY9IChuIC0gMSk7DQo+PiAgIDM2ICAgICAg
ICB9DQo+Pg0KPj4gaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdiBpcyBhbiBhcnJheSBvZiA1IHVp
bnQ4X3QgYXMgZGVmaW5lZCBpbg0KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVs
ZXMvaGRjcC9oZGNwLmggYXMgZm9sbG93czoNCj4+DQo+PiBzdHJ1Y3QgbW9kX2hkY3BfbWVzc2Fn
ZV9oZGNwMSB7DQo+PiAgICAgICAgICB1aW50OF90ICAgICAgICAgYW5bOF07DQo+PiAgICAgICAg
ICB1aW50OF90ICAgICAgICAgYWtzdls1XTsNCj4+ICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBh
aW5mbzsNCj4+ICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBia3N2WzVdOw0KPj4gICAgICAgICAg
dWludDE2X3QgICAgICAgIHIwcDsNCj4+ICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBiY2FwczsN
Cj4+ICAgICAgICAgIHVpbnQxNl90ICAgICAgICBic3RhdHVzOw0KPj4gICAgICAgICAgdWludDhf
dCAgICAgICAgIGtzdmxpc3RbNjM1XTsNCj4+ICAgICAgICAgIHVpbnQxNl90ICAgICAgICBrc3Zs
aXN0X3NpemU7DQo+PiAgICAgICAgICB1aW50OF90ICAgICAgICAgdnBbMjBdOw0KPj4NCj4+ICAg
ICAgICAgIHVpbnQxNl90ICAgICAgICBiaW5mb19kcDsNCj4+IH07DQo+Pg0KPj4gdmFyaWFibGUg
biBpcyBnb2luZyB0byBjb250YWluIHRoZSBjb250YWlucyBvZiByMHAgYW5kIGJjYXBzLiBJJ20g
bm90DQo+PiBzdXJlIGlmIHRoYXQgaXMgaW50ZW50aW9uYWwuIElmIG5vdCwgdGhlbiB0aGUgY291
bnQgaXMgZ29pbmcgdG8gYmUNCj4+IGluY29ycmVjdCBpZiB0aGVzZSBhcmUgbm9uLXplcm8uDQo+
Pg0KPj4gQ29saW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
