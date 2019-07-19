Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0EA6E145
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 08:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690576E584;
	Fri, 19 Jul 2019 06:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720061.outbound.protection.outlook.com [40.107.72.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D156E584;
 Fri, 19 Jul 2019 06:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrMDV5DvwmrGZsGRAQfC6GKDyX1sA7e6rJ0wnfEZweqIgDfxARjoNqGmFvZX2/h5HrTvbOOX4xGjdCvPqTvNmtTHcSg0ML6V57kXzNMdBgBpxMrEudNJZB6VLgL9PWDEw7DtO8NgkK4abksDczR9fANnBfVMKBc2/UfUCe2VIALTgTZCs9At/Z5OD5GGVgK8x3XwaBcGC2grCMv9dG9MMA9I0jDTW+vuwfjYTNlpb0B8YCXpwWYBEngjm1mJaM3x34vdGuB8xDZLxb6e1+uVKTO4VSPMUdq1rk4tyTcn0n7NOYLhSC/jWNr2J40qzA2+vfCiD//LvsAVycSy5T/0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGn16F+GcdQT+ENPfJ0DfUi9UIu3sBp1VLc8FtOyS/Y=;
 b=iEgXT3/N+suQvAB/Re34ptHkR4cURNg8Q2B2QQ9j56o772VMohKLJRiiQz+t3sIupjbNFke33VCffv4Hyzk0C3GaWKLTljSqtZLXp+5h0CrOqPHO9nhA881eGvhcKf9RJavAgG/wsLFSGAMGhZEb4b8v/6c6QAmvLApaXGxlQgfv4mgmvB6YJ/+2Jagk99pKOubAKe+bgdlTsWrSmkDBym1ch9vIACD9MG1CjmIZM3OQGd0Vqu9e8SfqSEfjkq98SPKgfyA87hJf+Kp3qtuOAe7Et4k8s9ICjcfhmHddBARSNEsJTqoMVWJDZ+w2N76NK1omy/acKQN1zfJX3b2OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1579.namprd12.prod.outlook.com (10.172.38.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 06:56:47 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Fri, 19 Jul
 2019 06:56:47 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Thread-Topic: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Thread-Index: AQHVPYQPxxf70kJH2U2mcmXD4bmlyKbRgysA
Date: Fri, 19 Jul 2019 06:56:47 +0000
Message-ID: <57ad927c-4b7f-d6e2-edda-720386190054@amd.com>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-12-sam@ravnborg.org>
In-Reply-To: <20190718161507.2047-12-sam@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::20) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 442feb6d-79de-4a0e-007a-08d70c16444e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1579; 
x-ms-traffictypediagnostic: DM5PR12MB1579:
x-microsoft-antispam-prvs: <DM5PR12MB157902555D6F8D596B130C6783CB0@DM5PR12MB1579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(189003)(199004)(66946007)(6486002)(14454004)(6512007)(53936002)(5660300002)(6116002)(229853002)(478600001)(65956001)(2501003)(58126008)(86362001)(6246003)(68736007)(6436002)(256004)(36756003)(99286004)(2906002)(81166006)(46003)(186003)(71200400001)(64126003)(8936002)(25786009)(31686004)(446003)(11346002)(65826007)(7416002)(71190400001)(81156014)(8676002)(2616005)(486006)(6506007)(7736002)(110136005)(386003)(54906003)(65806001)(4326008)(66476007)(66446008)(66556008)(31696002)(64756008)(76176011)(52116002)(476003)(316002)(102836004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1579;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y+KZ/gD9/Mvhg1n1qnZFUyTVbi7puvnNlT3yyiapTW1cXKbFu6yEKQyb7zER6mbkJvoTgbZE1GYspqc/U+JB7Tr7IAw9kUV9Ktwlot6tfaK0iZDAMlCfWdbIXy6IoySpR1j83WaS5kqCKvyHoWoWbXeLUHIPQv6Ye+zlMK03EFaC5irskFZzpMUKtTX18kb0l3XULOe5iPbemz15KWx6tHPRCcgjzr3Zt20xaYmjYCNskTJvt7FyJCuNcZqm0wPzGMpHa1XhkzAAQB3E01VjmEiMpRisDwjIlOOoOp6cgDvhooqmoUnQydALrumi9wYduroOqw0Bsv0IknFdetNu0Ofx8zUsTxwGG/SkIKDUR3neLxLvVq994V5pvDD+eKLDpspohvU33/vVB4Ot0pVYkMQDyf+dFXsjQYb60sFrmPg=
Content-ID: <FB76C18FB64AFB478EFAFE7250E3D9A2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442feb6d-79de-4a0e-007a-08d70c16444e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 06:56:47.5064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGn16F+GcdQT+ENPfJ0DfUi9UIu3sBp1VLc8FtOyS/Y=;
 b=tkrTfk0besjcpUBpoSCs7XeVydeyyOjSBrXOXles5gEfOoyTgWtvGG0g3JckCHjwa0NFLJQG9RsYwzS2wPFiIdekeMq/k0lI8L+OiZhJxtqDhalMTINBp1g54EHTJ8HnTEn2d0UFhdVXiIUaOQqhvTbh1EO9KC38DZ3Bk4qlr9c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDcuMTkgdW0gMTg6MTUgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IGRybV9maWxlIHVz
ZWQgZHJtX21hZ2ljX3QgZnJvbSB1YXBpL2RybS9kcm0uaC4NCj4gVGhpcyBpcyBhIHNpbXBsZSB1
bnNpZ25lZCBpbnQuDQo+IEp1c3Qgb3BlbmNvZGUgaXQgYXMgc3VjaCB0byBicmVhayB0aGUgZGVw
ZW5kZW5jeSBmcm9tIHRoaXMgaGVhZGVyIGZpbGUNCj4gdG8gdWFwaS4NCg0KTWhtLCB3aHkgZG8g
eW91IHdhbnQgdG8gcmVtb3ZlIFVBUEkgZGVwZW5kZW5jeSBoZXJlIGluIHRoZSBmaXJzdCBwbGFj
ZT8NCg0KSSBtZWFuIHRoZSB0eXBlIGNhbid0IGNoYW5nZSBiZWNhdXNlIGl0IGlzIFVBUEksIGJ1
dCBpdCBpcyByYXRoZXIgYmFkIA0KZm9yIGEgZG9jdW1lbnRhdGlvbiBwb2ludCBvZiB2aWV3Lg0K
DQpDaHJpc3RpYW4uDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPg0KPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+DQo+IENjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4NCj4gQ2M6
IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPg0KPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
LnJpcGFyZEBib290bGluLmNvbT4NCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0Bhbmhv
bHQubmV0Pg0KPiAtLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fZmlsZS5oIHwgNCArLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2RybV9maWxlLmgN
Cj4gaW5kZXggNjdhZjYwYmI1MjdhLi4wNDZjZDFiZjkxZWIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9maWxlLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaA0KPiBAQCAt
MzQsOCArMzQsNiBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2lkci5oPg0KPiAgIA0KPiAtI2luY2x1ZGUgPHVhcGkvZHJtL2RybS5oPg0K
PiAtDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbWUuaD4NCj4gICANCj4gICBzdHJ1Y3QgZG1h
X2ZlbmNlOw0KPiBAQCAtMjI3LDcgKzIyNSw3IEBAIHN0cnVjdCBkcm1fZmlsZSB7DQo+ICAgCXN0
cnVjdCBwaWQgKnBpZDsNCj4gICANCj4gICAJLyoqIEBtYWdpYzogQXV0aGVudGljYXRpb24gbWFn
aWMsIHNlZSBAYXV0aGVudGljYXRlZC4gKi8NCj4gLQlkcm1fbWFnaWNfdCBtYWdpYzsNCj4gKwl1
bnNpZ25lZCBpbnQgbWFnaWM7DQo+ICAgDQo+ICAgCS8qKg0KPiAgIAkgKiBAbGhlYWQ6DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
