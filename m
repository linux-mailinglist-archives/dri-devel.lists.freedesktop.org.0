Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A884C842B2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 04:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBAB6E5E3;
	Wed,  7 Aug 2019 02:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690044.outbound.protection.outlook.com [40.107.69.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ECE6E5DD;
 Wed,  7 Aug 2019 02:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMtRy9bIEv7vhDZSBz1usOPfFNjsxBYYF/dUKA1eKa0wDz9VlL/VtkPfVgU9+fwLVtinDa5w6smwAy0ikRZpQu3KMYEgyM52NUXEy8Hy/loAOI+T5RPrhf0932ZGuT3QRtLB/1irU/TloVvB7/RPudbBceJKt0UgNK7wGvlPIFqTezvpncpvRGbp7fG7x7E/a397WvtXGyLkdtL47qWYFagoPlBEfTVMPfQNkfeaYAIFUb/mVDB0lxgNPnY8kllkVlB9Y3UjTmQIaDzak0flTqTjB0nK7xlmFiHQ1HfYPDm2UaoZXNVr8M4DIDC/UZivtZfrEgC4D8T80a94zHdpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SV7p2HbKqhsggjH+c6/wSuycDWDCizFjC6dGRc+Cx0=;
 b=lC0n97ouri5h0BUBgWskJk3ftUgJygfVvJm2+kNOzRSzXq36QEQNge9sh3dRLYyizTj2JfFXqL4g4n0y4JZVLMB+TAgrqLhx4bRdn30ve1vtZ6JEZ5buhVik5wpxqs1hgSc+zEtsMsUdEDf+I9+8mKkhis0Yj2ErOHLovYXQWcqjmVkLv8RBIbqeHL0dBO6tMtWC6kKle9suNvjeqwxi3W6ikC3vB1ngXhKN9IblSuNc37QeI/Xp0zSia18WEnPmo0D7grJSZydTmhJYgIKB9yFvAtu5HNONRnV0v8RvS+tsprrnTMMyMUzIpU+7BGWlOizqIkaDq8E4IGOypA3eiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3343.namprd12.prod.outlook.com (20.178.240.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 7 Aug 2019 02:57:02 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.011; Wed, 7 Aug 2019
 02:57:02 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Colin King <colin.king@canonical.com>, Rex Zhu <rex.zhu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH][drm-next] drm/amd/powerplay: remove redundant duplicated
 return check
Thread-Topic: [PATCH][drm-next] drm/amd/powerplay: remove redundant duplicated
 return check
Thread-Index: AQHVS3i06UQfxzn0xkWMQUs9QU/PAabvAHxA
Date: Wed, 7 Aug 2019 02:57:02 +0000
Message-ID: <MN2PR12MB334491A28234DD9F23CA8843E4D40@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190805102940.26024-1-colin.king@canonical.com>
In-Reply-To: <20190805102940.26024-1-colin.king@canonical.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23af2274-709a-4b0f-170f-08d71ae2ec36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3343; 
x-ms-traffictypediagnostic: MN2PR12MB3343:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3343982AEA71B307D429B2D0E4D40@MN2PR12MB3343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(189003)(199004)(13464003)(76116006)(14454004)(54906003)(66446008)(66946007)(86362001)(66556008)(66476007)(64756008)(229853002)(25786009)(2501003)(76176011)(305945005)(316002)(7736002)(5660300002)(3846002)(7696005)(52536014)(74316002)(478600001)(110136005)(99286004)(6116002)(446003)(11346002)(486006)(26005)(102836004)(186003)(33656002)(71190400001)(71200400001)(53546011)(6506007)(66066001)(6246003)(2906002)(8676002)(55016002)(68736007)(476003)(2201001)(6436002)(4326008)(81156014)(9686003)(256004)(14444005)(81166006)(8936002)(53936002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3343;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bGBapyqINqTMkZ8JCkneuGJSu1BKwedboIhjewaeEF5ToOXjdtbiXXDePfj+gagUiBwRH84jpTcugEP1PtZRSeNG3x0wSiEnUmahSVMVLaMIJCq0XVpFUzyEoqAaxoSKkzHFvA37luxyBUlIl90+PMsHuBk3wYZHicDXEvNIpt7g5BbDx5hqozQVptVUvmqUsP51RBGITNWykSV4178o4O6d3AEWzmR7ws4oMhCJfUQ2VuKOaZC+ar4BqefwlMcJcrIOc4/RlRv9CzyEeEl87mUkEtulH8bQ+lhaO7PfPziKGKhnimHQnSnvUyAMFwi/hwlOlI2yLgi9QS37ddBFZoZuRfFKlA7q8mse1Tpgkygz5oZiL5ISO6DGCHXgmLjUluPqg136jIUems/adZklVM8oVvS7Sb38/Kh0ReJP4s8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23af2274-709a-4b0f-170f-08d71ae2ec36
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:57:02.3463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9WlL1VkjJT9Qq7+aK5zJSIE+Lzeje//OWEZ312EZkPg1MMnlhkhR7FUG/acjcHD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SV7p2HbKqhsggjH+c6/wSuycDWDCizFjC6dGRc+Cx0=;
 b=ixitzC754LN94WmBDEuK0sveqWZK2wSEeHqGtLLU5qCdrWVg1rI0VSMjbTnwZyzmE1507JktuW3vScY6jZ8quatXfjXTephFebr6+K5QtkRbumONS9EDXi1KI6CFSLrgbDgUv2Hh+QXVyxf1zRavqf+Ppncb0FqWFN0ZsDZoD6c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

VGhhbmtzISBSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDb2xpbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDA1LCAyMDE5IDY6MzAgUE0N
Cj4gVG86IFJleCBaaHUgPHJleC56aHVAYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBh
bWQuY29tPjsNCj4gRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29t
PjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFpob3Us
IERhdmlkKENodW5NaW5nKQ0KPiA8RGF2aWQxLlpob3VAYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXINCj4gPGRhbmllbEBmZndsbC5jaD47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzoga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0hdW2RybS1uZXh0XSBkcm0vYW1k
L3Bvd2VycGxheTogcmVtb3ZlIHJlZHVuZGFudA0KPiBkdXBsaWNhdGVkIHJldHVybiBjaGVjaw0K
PiANCj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4g
DQo+IFRoZSBjaGVjayBvbiByZXQgaXMgZHVwbGljYXRlZCBpbiB0d28gcGxhY2VzLCBpdCBpcyBy
ZWR1bmRhbnQgY29kZS4NCj4gUmVtb3ZlIGl0Lg0KPiANCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAo
IkxvZ2ljYWxseSBkZWFkIGNvZGUiKQ0KPiBGaXhlczogYjk0YWZiNjFjZGFlICgiZHJtL2FtZC9w
b3dlcnBsYXk6IGhvbm9yIGh3IGxpbWl0IG9uIGZldGNoaW5nDQo+IG1ldHJpY3MgZGF0YSBmb3Ig
bmF2aTEwIikNCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBpbmRl
eCBkNjJjMjc4NGIxMDIuLmIyNzJjOGRjOGY3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBAQCAtOTQxLDggKzk0MSw2IEBAIHN0YXRpYyBp
bnQgbmF2aTEwX2dldF9ncHVfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0DQo+ICpzbXUsIHVpbnQz
Ml90ICp2YWx1ZSkNCj4gIAlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0
cmljcyk7DQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gLQlpZiAocmV0KQ0KPiAt
CQlyZXR1cm4gcmV0Ow0KPiANCj4gIAkqdmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VTb2NrZXRQb3dl
ciA8PCA4Ow0KPiANCj4gQEAgLTEwMDEsOCArOTk5LDYgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0
X2Zhbl9zcGVlZF9ycG0oc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUsDQo+ICAJcmV0ID0gbmF2
aTEwX2dldF9tZXRyaWNzX3RhYmxlKHNtdSwgJm1ldHJpY3MpOw0KPiAgCWlmIChyZXQpDQo+ICAJ
CXJldHVybiByZXQ7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gDQo+ICAJKnNw
ZWVkID0gbWV0cmljcy5DdXJyRmFuU3BlZWQ7DQo+IA0KPiAtLQ0KPiAyLjIwLjENCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
