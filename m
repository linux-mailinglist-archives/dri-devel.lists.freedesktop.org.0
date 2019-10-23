Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C41E1FF2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD4E6EB38;
	Wed, 23 Oct 2019 15:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80BA6EB36;
 Wed, 23 Oct 2019 15:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE1dOe2iYb2Ptax0v1LnYY+oFybDStObk6NEw9PuIFsl+Dher/81oVoJlNCdxn8/9BRqx6x1acRMRPYGVsG0QGALtPmq4ha3PYjrgYH8jytNZhMFEZbuoI+Y/Pu1IM4WokL4KpbmqJZsdnsdW5I+T+JpKwF8zy4PrXzGkpfLo+zxXujD3Vbijb0uWQU1QtRDl6EaPIhL7buvm5WnfF6M7K2n7/W9UnC46arKPerk2jEc/CEcyQ96IUry71q7fHOLJ2TStgpZ5wQ6iaCj7JVKigFEefQv7i3UOuMN2BiWkJijSZRpjdjZsDsw/i/5Y9pPlCt4zMVE7Ip3A+hxta3tZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgDrBdaIeBpokNl1izgY0+iWdrjqxLXF4Pg8YBsW1oE=;
 b=JSfGpgB1rIZj/iHkEsqVt6YT/x/tiaIQfM8zLJscm3rOF6HIln82gOs1db13sk9L4LxuAuwt501IJb3OB7XGyjTEeV17a+VveYPUVOaOsqEAPYc1JNpbXA5bAAYTkZdq8WqzRXLihEOM4iSGmSIJUTO/ESfnNDnIPgpSzXKpilqYZKdiOpcdA4wUH9Wv+gn3I0CINFtUvTZfoaZX+gXtKv/gUWFvLace0Imb2qd6nthhfQ+0fpcqP4lT8S6YaBJD93Xx2wzq42WadRE2BhRhEHPkQWrlT0NBbNvqs2/9ju+c+nXv2h+d2vZ4UdfkLU0dv7aT9HX0/j5Lf/E1N6O0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2611.namprd12.prod.outlook.com (20.176.27.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Wed, 23 Oct 2019 15:53:48 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66%7]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 15:53:48 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: =?utf-8?B?THVrw6HFoSBLcmVqxI3DrQ==?= <lskrejci@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: Add DC feature mask to disable fractional
 pwm
Thread-Topic: [PATCH v2] drm/amdgpu: Add DC feature mask to disable fractional
 pwm
Thread-Index: AQHViEf6p6gtVzwtrEq7tq+BDs+v4KdoSUkAgAAaQQA=
Date: Wed, 23 Oct 2019 15:53:48 +0000
Message-ID: <5c7732e1-9a6a-7b27-9f26-779082d94460@amd.com>
References: <20191021193743.24339-1-sunpeng.li@amd.com>
 <20191021194414.24627-1-sunpeng.li@amd.com>
 <eb513969cc86a42a9be95e4ff7f3473eb24d6d4a.camel@gmail.com>
In-Reply-To: <eb513969cc86a42a9be95e4ff7f3473eb24d6d4a.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::46) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d376ceea-48ae-4a92-e968-08d757d13133
x-ms-traffictypediagnostic: BN7PR12MB2611:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB2611D8D6127FA66CD1405300826B0@BN7PR12MB2611.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(199004)(189003)(25786009)(486006)(36756003)(99286004)(2906002)(446003)(3846002)(11346002)(476003)(4326008)(6306002)(6512007)(5660300002)(2616005)(7736002)(76176011)(102836004)(6246003)(186003)(52116002)(6116002)(386003)(6506007)(6486002)(305945005)(53546011)(26005)(6436002)(229853002)(2201001)(478600001)(110136005)(66556008)(8676002)(966005)(71190400001)(8936002)(256004)(71200400001)(54906003)(4001150100001)(14454004)(81166006)(316002)(81156014)(64756008)(66946007)(31686004)(66446008)(66476007)(2501003)(66066001)(86362001)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2611;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 15VcRMeIl1X0zo/bSPFE2IEa3wHFxDeA2alnVkdYDJwbu9TpHIFeOYNRJV0NQYZYfKloowb0B+YENVi4GDboEAYypW6RbaKU89adC2Ev6c2evtssA54WdcXDuMloeRvxF3LzGwFwNB+mH8v7sdLytzuVzRteCmHytGb737D4ZcizT/A3BmMv10AC8cW4ucaxLLyadNv1XHNYVGMkRGeNEF0f6KT5C98k+CMDmnNjRv4BMBKlhwuLMaHVPDrfQkitMFcrFXfUKidVNmG1QaP2j0mBgXySKdQXZZNOrmW7ZfS7gKCICIOqGJFV3EOLYtslmxsX9mK3GMBd5qyt1wh5Iy1+FkTT3NVcVyG5JfBFt5VZbQB7aHNgCDjJokZoUTuq8vXzJAecuorXjXj1wWxPYiZvE9rOAXvj0WpqaHEDdkMgZSC4XnRfDTAd+Wl3KaK1/FVJFDI8OQvbi5IYi2LDk4PLfJSlfjp26i9t9KHbItY=
Content-ID: <D1F39321369B3648B71F3203E3E07F26@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d376ceea-48ae-4a92-e968-08d757d13133
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 15:53:48.3350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kw22PnUO+BDNh/GNVVdeuO7k4wT6MOKzbKbXUlcs5lFyacRGSSse37hXbp1//9sY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2611
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgDrBdaIeBpokNl1izgY0+iWdrjqxLXF4Pg8YBsW1oE=;
 b=yfFdELC6NUidjRSuqQ/ZnJXTGZeUf2Z1Bd96siMo16BK12+/Zd4JPyLjMW0CylqCMSdCHxaRU00ivFRIXoRatCOrPObb/cSJIFu+uWBGiH4UvAQuwVNJgXaVMAKdL3LneSRYSpFomL6y+kNI43U9R+MSf9/mNSjLUOqtUD7Y0+A=
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
Cc: "Koo, Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMyAxMDoxOSBhLm0uLCBMdWvDocWhIEtyZWrEjcOtIHdyb3RlOg0KPiBPbiBN
b24sIDIwMTktMTAtMjEgYXQgMTU6NDQgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToN
Cj4+IEZyb206IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPj4NCj4+IFtXaHldDQo+Pg0K
Pj4gU29tZSBMRUQgcGFuZWwgZHJpdmVycyBtaWdodCBub3QgbGlrZSBmcmFjdGlvbmFsIFBXTS4g
SW4gc3VjaCBjYXNlcywNCj4+IGJhY2tsaWdodCBmbGlja2VyaW5nIG1heSBiZSBvYnNlcnZlZC4N
Cj4+DQo+PiBbSG93XQ0KPj4NCj4+IEFkZCBhIERDIGZlYXR1cmUgbWFzayB0byBkaXNhYmxlIGZy
YWN0aW9uYWwgUFdNLCBhbmQgYXNzb2NpYXRlIGl0IHdpdGgNCj4+IHRoZSBwcmVleGlzdGluZyBk
Y19jb25maWcgZmxhZy4NCj4+DQo+PiBUaGUgZmxhZyBpcyBvbmx5IHBsdW1iZWQgdGhyb3VnaCB0
aGUgZG1jdSBmaXJtd2FyZSwgc28gcGx1bWIgaXQgdGhyb3VnaA0KPj4gdGhlIGRyaXZlciBwYXRo
IGFzIHdlbGwuDQo+Pg0KPj4gVG8gZGlzYWJsZSwgYWRkIHRoZSBmb2xsb3dpbmcgdG8gdGhlIGxp
bnV4IGNtZGxpbmU6DQo+PiBhbWRncHUuZGNmZWF0dXJlbWFzaz0weDQNCj4+DQo+PiBCdWd6aWxs
YTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ5NTcNCj4+
IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPj4gLS0tDQo+Pg0K
Pj4gdjI6IEFkZCBidWd6aWxsYSBsaW5rDQo+Pg0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzICsrKw0KPj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jICAgICAgfCA0ICsrKysNCj4+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oICAgICAgICAgIHwgMSArDQo+PiAgMyBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IFRlc3RlZCBvbiBVYnVudHUgMTkuMDQs
IHZhbmlsbGEgdjUuMy43IGtlcm5lbCB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkDQo+IGFuZCBhbWRn
cHUuZGNmZWF0dXJlbWFzaz0weDQgYWRkZWQgdG8gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUsIG5v
DQo+IGlzc3VlcyBhZnRlciA4IHJlYm9vdHMuIChUaGUgaXNzdWUgY291bGQgYmUgcmVwcm9kdWNl
ZCB3aXRob3V0DQo+IGFtZGdwdS5kY2ZlYXR1cmVtYXNrPTB4NCBvbiBmaXJzdCBib290LikNCj4g
DQo+IFRlc3RlZC1ieTogTHVrw6HFoSBLcmVqxI3DrSA8bHNrcmVqY2lAZ21haWwuY29tPg0KDQpB
cHBsaWVkLCB0aGFua3MhDQpMZW8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
