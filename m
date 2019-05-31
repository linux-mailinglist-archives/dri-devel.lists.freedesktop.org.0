Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F60315FC
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 22:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190D08996E;
	Fri, 31 May 2019 20:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69B8995F;
 Fri, 31 May 2019 20:19:06 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2487.namprd12.prod.outlook.com (10.172.116.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Fri, 31 May 2019 20:19:04 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 20:19:04 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Colin King <colin.king@canonical.com>, "Koo, Anthony"
 <Anthony.Koo@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun
 peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amd/display: remove redundant assignment to
 status
Thread-Topic: [PATCH][next] drm/amd/display: remove redundant assignment to
 status
Thread-Index: AQHVFwJ4oaGCI0RQgEeQuQaLiUBi0KaFrfoA
Date: Fri, 31 May 2019 20:19:03 +0000
Message-ID: <a190bcd5-cda8-84c6-093a-98438a605032@amd.com>
References: <20190530161219.2507-1-colin.king@canonical.com>
In-Reply-To: <20190530161219.2507-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [69.28.222.43]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BL0PR0102CA0058.prod.exchangelabs.com
 (2603:10b6:208:25::35) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4b4a011-f742-445e-6dc9-08d6e605398f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2487; 
x-ms-traffictypediagnostic: CY4PR1201MB2487:
x-microsoft-antispam-prvs: <CY4PR1201MB248701EAE4259AD02F835AF38C190@CY4PR1201MB2487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(366004)(39860400002)(136003)(199004)(189003)(305945005)(7736002)(446003)(256004)(31696002)(11346002)(6436002)(14454004)(229853002)(72206003)(36756003)(186003)(14444005)(478600001)(486006)(81166006)(8676002)(81156014)(25786009)(6486002)(71200400001)(71190400001)(476003)(2906002)(26005)(5660300002)(68736007)(6512007)(2201001)(8936002)(65826007)(3846002)(2616005)(6116002)(66556008)(66476007)(316002)(66946007)(386003)(73956011)(4326008)(6506007)(53936002)(6246003)(76176011)(52116002)(31686004)(64756008)(99286004)(102836004)(64126003)(53546011)(66446008)(58126008)(110136005)(65806001)(65956001)(2501003)(54906003)(66066001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2487;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VoNnNoDfbErvFyGcPUrjTxFfCUKgmFC0ELd6OnQqoNsxBX36jDJ7KNaHnW4eco/nknXa5NKX2hPnQ4qpnE81SpLUQX+vjM+AJY2RLS7c2u8lAENApWnqmT00dXAe1TnOS3yIPjxJ5Kk5ALn5rq/eQ3ymSvKqC16D0aFaBYpPQWnNSFc2bITssxRFkOhMi2JvldtAVYUxMTDoFsMnW2Ol5Fm/EzMFTrqEKIJJyrTBfDIJbrKS7YBV9Kn7F+hIuZrTvjodsZ2erwlQ4jOKb6aQViJgG7T8DCsSZYzDwpWGXSYYcihQkYZF6PqO0SocT7qTjgMYUG17s9BweHT86Tkpl8js0QbsRgY/vlgsMQFux/ABl8IincI2mR79QwC6Tc7+9xjY8BiS+LCTzziA9xu90qgLifi36msQMWAtftSeT8c=
Content-ID: <6B414A2346E324478E8EC5C835BA381A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b4a011-f742-445e-6dc9-08d6e605398f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 20:19:03.8453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/JAMtynybMWerw24qc2JYYegD+4aTaodV+xq/idkXY=;
 b=Ebjrt6hs2Dsq+1NDloB5iz8jHfwlZG1YWnjXDiyUw26VObNhQDl3LaeGCxZUFyjLY4SiL0q641WmwlKQn/RnjFcULIN25fCXEvGJ+T0CpTXxWWv1c1vYhLyXfCXNpwvcxGxHUu/sQ+ZDkIFpSP3TX0RWJkXu0gE3TFCRF0IXtqU=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0zMCAxMjoxMiBwLm0uLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBGcm9tOiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhlIHZhcmlhYmxl
IHN0YXR1cyBpcyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBuZXZlciByZWFkDQo+
IGFuZCBzdGF0dXMgaXMgcmVhc3NpZ25lZCBzZXZlcmFsIHN0YXRlbWVudHMgbGF0ZXIuIFRoaXMg
aW5pdGlhbGl6YXRpb24NCj4gaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4NCj4gDQo+
IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBD
b2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyB8IDIgKy0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYw0KPiBpbmRl
eCA2NWQ2Y2FlZGJkODIuLmNmNjE2NmExYmU1MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYw0KPiBAQCAtMjM2Nyw3ICsyMzY3
LDcgQEAgc3RhdGljIGJvb2wgcmV0cmlldmVfbGlua19jYXAoc3RydWN0IGRjX2xpbmsgKmxpbmsp
DQo+ICAJdW5pb24gZG93bl9zdHJlYW1fcG9ydF9jb3VudCBkb3duX3N0cm1fcG9ydF9jb3VudDsN
Cj4gIAl1bmlvbiBlZHBfY29uZmlndXJhdGlvbl9jYXAgZWRwX2NvbmZpZ19jYXA7DQo+ICAJdW5p
b24gZHBfZG93bnN0cmVhbV9wb3J0X3ByZXNlbnQgZHNfcG9ydCA9IHsgMCB9Ow0KPiAtCWVudW0g
ZGNfc3RhdHVzIHN0YXR1cyA9IERDX0VSUk9SX1VORVhQRUNURUQ7DQo+ICsJZW51bSBkY19zdGF0
dXMgc3RhdHVzOw0KDQpOb3Qgc3VyZSB0aGlzIGltcHJvdmVzIHRoZSBzaXR1YXRpb24uDQoNCkkn
ZCBwcmVmZXIgdG8gaGF2ZSBhIGRlZmF1bHQgaGVyZSBpbiBjYXNlIHNvbWVvbmUgY2hhbmdlcyB0
aGUgY29kZSBiZWxvdw0KYW5kIGZvcmdldHMgdG8gc2V0IHRoZSBzdGF0dXMuDQoNCkhhcnJ5DQoN
Cj4gIAl1aW50MzJfdCByZWFkX2RwY2RfcmV0cnlfY250ID0gMzsNCj4gIAlpbnQgaTsNCj4gIAlz
dHJ1Y3QgZHBfc2lua19od19md19yZXZpc2lvbiBkcF9od19md19yZXZpc2lvbjsNCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
