Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DF10A138
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DE66E424;
	Tue, 26 Nov 2019 15:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F030D6E422;
 Tue, 26 Nov 2019 15:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOll8paCBejnNPhyI0OqrHftBoHIh71HBXFa5Qw+L2SkuoPvt2vzoM04K0bhBP2A1Xea1QALpCOZIEIwdwqa0UvDhNZsMmNHAGLQWWp5U+OqDBdZaw+OWVwuRJDlhsPqpt/AvnZy+h3/RSdV2iK63ENKzr8/3wZm1i37Ilu3BLsBuoaGu5YsLXMacT/1XXLHgo9fXX6mROkJoqyTWVpNYu4O8YmLctoHGeBjcst9NQkPsuuKGr8Pow8dc4ZdF4joci7GXPUCtAUDSnEvXiQaDRqhVmWmmtJYYbyuXgjhcCwHWtpVP8/pM76xRz5Ifa1pwp9uOdhYoRcK8D5AfKf6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDnBJ09v1EtQoEjKn/An66DdBr3oA32Qb0Pd/IA/z9E=;
 b=Lku9CKeRQx9oGqwZ39gj4TrdfeFK74/7NbW6uSRdx6zFTVjFZg1yGCrZ3TukZtscnlFNG/nFQL1k6xFA79FVsYnrnW5duKxHvetdvcusLQ4uZDoK+wP8LC/IcLHnzwr26oO6/TM910T12iDGblnmIUFrT3+AjhHy9TQFILslXP6C/NCqFKRNbOmSWmxkkru2trI3tOcqgo28fl1j+kSn+I4WQNm8PPmLXggf+sKGhZrGxxcC4tJYV6AiwSTY1qaW498is8+Zo6scrmORTXf3GNYv5SxoACq2No1Riuu/0XY77Fz5J60uNiE2RpJiC0MenVCbGiS7mfT3ogsHpCjmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3945.namprd12.prod.outlook.com (10.255.172.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 15:31:50 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:31:50 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Jules Irenge
 <jbi.octave@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm: radeon: replace 0 with NULL
Thread-Topic: [PATCH] drm: radeon: replace 0 with NULL
Thread-Index: AQHVpDGuiIGYb9FDoEeIk+mDGEp8l6edOuKAgABZ7RA=
Date: Tue, 26 Nov 2019 15:31:50 +0000
Message-ID: <DM6PR12MB346679C0E1B515E450D0B2C29E450@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <20191126003514.133692-1-jbi.octave@gmail.com>
 <9a585a20-b885-680f-d561-8713afe53fa1@amd.com>
In-Reply-To: <9a585a20-b885-680f-d561-8713afe53fa1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91245abb-9193-4193-8755-08d77285c1f5
x-ms-traffictypediagnostic: DM6PR12MB3945:|DM6PR12MB3945:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3945463BA4E385BE3355799C9E450@DM6PR12MB3945.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(199004)(189003)(13464003)(99286004)(5660300002)(305945005)(71200400001)(256004)(71190400001)(66574012)(64756008)(3846002)(33656002)(6116002)(102836004)(66446008)(7736002)(25786009)(74316002)(81156014)(2906002)(8936002)(446003)(76176011)(14444005)(66476007)(6506007)(53546011)(478600001)(11346002)(26005)(8676002)(86362001)(7696005)(6306002)(9686003)(6246003)(81166006)(55016002)(52536014)(14454004)(6636002)(66066001)(45080400002)(76116006)(110136005)(66556008)(316002)(186003)(6436002)(54906003)(229853002)(66946007)(4326008)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3945;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DjsG5UiUr6uLUfFQrLeZl+6rGiCrBzlXsYo51I7iTS5TRtONmeFVN5FRzvYrHoc43McOhkYJUUVwIK0eIo7b/SeDuNbqdp4N2kKzaznCKnUuGl9s9VIRpFxpwD6MdAmzp6tItR+iDJdMWko0D7ZTRNJedOYo68d2fNlX2sfrs4lsj2Ql5wJ/Yy3JMnO62kWhFvqDG83QgnZ6oFnKuMx8lHmaDXmR26XR7RX7yH6k07N8VWB28WXLIW6mhbZ+2hNQRJaMnTRq/Jexpvo8nJiYjjTQTWHpAChoHIPZxjTUy7f1f13/XUtTyv0KI+XhlINFhp7NqIdS8S4/v5wUjlgsaNCDChneMxnbNxWQTLX6/5ZgK2lFA2xIjRLkwGc/UjhI2AqtLRzxz/+uKOYqKMOWk/Lvd5Q9GuCsuvmi7JP4wUPhs3NTclknIus6vKNqVWOJ
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91245abb-9193-4193-8755-08d77285c1f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 15:31:50.4016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MC0Wn+R3HNAWp1ZFcuWLovgXqpqbqC3qVTBxU2J9jkGqChrrh6RZInb6pk4T1x4Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3945
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDnBJ09v1EtQoEjKn/An66DdBr3oA32Qb0Pd/IA/z9E=;
 b=MGfCjqEluh9posL8K8qnLSuidOIxZ8pcIctHwUCBOB/MdpHKgxPdo75rpUq7eOHUHPydHXkgXA1CiY2ZYBPJDKMT1xrZsq+TpDR0d1h9UoFf6mpAooz2/GZb7w6YxB31oSCvmVDACTza9IZ66zttxIKKWZdWb+RTlf8fU7OEDQk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IENocmlzdGlh
biBLw7ZuaWcNCj4gU2VudDogMjAxOS9Ob3ZlbWJlci8yNiwgVHVlc2RheSA1OjEwIEFNDQo+IFRv
OiBKdWxlcyBJcmVuZ2UgPGpiaS5vY3RhdmVAZ21haWwuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVy
DQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzogWmhvdSwgRGF2aWQoQ2h1bk1p
bmcpIDxEYXZpZDEuWmhvdUBhbWQuY29tPjsgYWlybGllZEBsaW51eC5pZTsNCj4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0N
Cj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkYW5pZWxAZmZ3bGwuY2gNCj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gZHJtOiByYWRlb246IHJlcGxhY2UgMCB3aXRoIE5VTEwNCj4gDQo+IEFt
IDI2LjExLjE5IHVtIDAxOjM1IHNjaHJpZWIgSnVsZXMgSXJlbmdlOg0KPiA+IFJlcGxhY2UgMCB3
aXRoIE5VTEwgdG8gZml4IHNwYXJzZSB0b29sICB3YXJuaW5nDQo+ID4gICB3YXJuaW5nOiBVc2lu
ZyBwbGFpbiBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRlcg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
SnVsZXMgSXJlbmdlIDxqYmkub2N0YXZlQGdtYWlsLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBa
aGFuIExpdSA8emhhbi5saXVAYW1kLmNvbT4NCg0KPiANCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMgfCAyICstDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fYXVkaW8uYw0KPiA+IGluZGV4IGI5YWVhNTc3NmQzZC4uMjI2OWNmY2Vk
Nzg4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlv
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jDQo+ID4g
QEAgLTI4OCw3ICsyODgsNyBAQCBzdGF0aWMgdm9pZCByYWRlb25fYXVkaW9faW50ZXJmYWNlX2lu
aXQoc3RydWN0DQo+IHJhZGVvbl9kZXZpY2UgKnJkZXYpDQo+ID4gICAJfSBlbHNlIHsNCj4gPiAg
IAkJcmRldi0+YXVkaW8uZnVuY3MgPSAmcjYwMF9mdW5jczsNCj4gPiAgIAkJcmRldi0+YXVkaW8u
aGRtaV9mdW5jcyA9ICZyNjAwX2hkbWlfZnVuY3M7DQo+ID4gLQkJcmRldi0+YXVkaW8uZHBfZnVu
Y3MgPSAwOw0KPiA+ICsJCXJkZXYtPmF1ZGlvLmRwX2Z1bmNzID0gTlVMTDsNCj4gPiAgIAl9DQo+
ID4gICB9DQo+ID4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLg0KPiBmcmVlZGVza3RvcC5vcmclMkZtYWlsbWFu
JTJGbGlzdGluZm8lMkZhbWQtDQo+IGdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDemhhbi5saXUlNDBh
bWQuY29tJTdDMzU4MzJhMjg5NDg5NGM0NDgxN2QNCj4gMDhkNzcyNThjOWVhJTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMSU3QzYzNzEwDQo+IDM1OTc5ODE4NTA4NzIm
YW1wO3NkYXRhPUZkb3VJczdQcmF3eDNVaEs0ejhBRWdWMG5ZSkpjeXJHTnA1Nkcwdw0KPiBoTlpV
JTNEJmFtcDtyZXNlcnZlZD0wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
