Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F319EA63
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3622899E6;
	Tue, 27 Aug 2019 14:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DBA899C4;
 Tue, 27 Aug 2019 14:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KropETEEKKQVsemQf0gCIINbtiY+qGmpLBgx5UIcNYtX5TnLd810PbeDo8TLSNtikWkomJQTVzc6AhB3rN37PsykUMRi3jffU8+IiGuwDmtIBnHdotBexv8TqvE5rmvg/8se8RBumhvIIRTTpn4QI6Oq3UIjZSJot7WyZ3zyO6VzPlOEBvOv52chHvbZDqCJbOuAbWEd8+x6bMnw3srXKkCIRsSPrK/rSzYM9pWLh2o0itDWXHIupJ9pX3zqeYtVTdN1d2n/wbm1aKoiJzPTD43jhmCFLtr6N/TXhQKA1q399Njaqitk7wqWU6mM2R1EKcKQrf5b1eJAeqstK/H6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjPokZrKnjfm26czzZwfnznszP96JXp+KZFZrp4LIl0=;
 b=fiLCbL5yyQWPzboQkpds/x2v48aFRZb42VGZut02+Keec3GE6/L5l3gBQsaZPM3h0HRDMdft30TbPMMhipXA8Zz11eh+V7uSYPgjZeGAlBqj4muD/tJqcfrw95x//GpoWTcpSwri4LLdeR9/vVCBo/SYNtx3xgKIp1f4CD6DIUnQEL5vUnFDfOEXKM4fQtnXtsskuunlXAOSSh+47YchrVSjPMNVNuFdo+xFza4eXGDqBn9KngTUc6HyZb26g/ckCrtQ32v+mJojaMdgTIwR8OrJZUaA4QAHdPmOc3GsDCxQI+Du1cBpi5tQfcrmF4pvfD4XWUWThPK2Foi9OMcfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 14:06:55 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 14:06:55 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RESEND 03/14] drm/amdgpu: Provide ddc symlink in dm
 connector's sysfs directory
Thread-Topic: [PATCH RESEND 03/14] drm/amdgpu: Provide ddc symlink in dm
 connector's sysfs directory
Thread-Index: AQHVXEQy4bdMU/E4KEWQW1YKbrvOHKcPCM4A
Date: Tue, 27 Aug 2019 14:06:55 +0000
Message-ID: <d7fa0b27-800b-9843-29cd-0e9095bfd75d@amd.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
 <40293fa4e619d1d1af213a076b1d03440e50c56c.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <40293fa4e619d1d1af213a076b1d03440e50c56c.1566845537.git.andrzej.p@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8336f750-1766-4bfa-1bf8-08d72af7d11b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0037; 
x-ms-traffictypediagnostic: CY4PR1201MB0037:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0037E9A1B0D90CF8B8C890998CA00@CY4PR1201MB0037.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(5660300002)(305945005)(256004)(6486002)(81156014)(36756003)(7736002)(31686004)(8676002)(7406005)(3846002)(99286004)(2616005)(6116002)(4326008)(26005)(76176011)(486006)(71190400001)(2906002)(71200400001)(81166006)(2501003)(102836004)(31696002)(476003)(386003)(229853002)(52116002)(53936002)(6512007)(66066001)(65806001)(65956001)(53546011)(58126008)(8936002)(110136005)(6246003)(6436002)(54906003)(66946007)(316002)(446003)(7366002)(186003)(66476007)(66446008)(66556008)(11346002)(64756008)(4744005)(25786009)(6506007)(478600001)(7416002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0037;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +7fPAfqNWZf6cZKcQxXPRsR0/BLGvw+2x58Nox1VJq8Tau6Au7BfeCEDnenbdU0n90rC5eer0gwEuYUgeV7FElSYaHT/Fn6mr1lCV6tHoXbFasab4VIfufrY1FYDFOsR+4NEzT7vdwfYHdwpdOOoXlX5CR6DKJ7k1ijAPBMknpXVrUzIbV0iDtqid4ivmxzBuQYH0CCMAoYJY3eqkWHDte+UGzrQJ9r8n+cagwYkyM9qYGp3IQAfaH08fkWu43oGvJrahhOlusJCsLDfNuA2/rKCy1Bqq+UHpjWL0h4Tbbt/EVVn0mvDjY705lLI4hspswtwLZZfPj//LrkmbksHOP2KdwaOYxU6jZUKM0OegE5oOa5juwBHSex19QySEXcM2Cm5DwPsbDylR7Wl2Oh9hBhnnf5pICFlMDAJMM4REoY=
Content-ID: <B21E8E0F36C3F84EA1BD29A6779B155F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8336f750-1766-4bfa-1bf8-08d72af7d11b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 14:06:55.3436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fb4P3l8tDYhu4SOUm5uBZKlVzF9tVZhoHDaXxNE3OUDNx01ZAtIC5OJ06PI38fHEJmiONgAra4vKAtTUR12LCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjPokZrKnjfm26czzZwfnznszP96JXp+KZFZrp4LIl0=;
 b=j8bDAKQhTXDGmwndfWUyFT3bqbXWwkE/uIKOD+x1Floox4Al9uSjhT0Z6HEsixDoVvRs4VlfeUQ9kQNZr7WCQKzVQEcDHLYDDdWFhrhv1bxLGT9R7twcEWXKlgsTGAymhQZTNzLilEtevWMVNFLCBw/M+f4+iIBD/8MASliXbnc=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "Koo,
 Anthony" <Anthony.Koo@amd.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, "Francis,
 David" <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Uma Shankar <uma.shankar@intel.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Enrico Weigelt <info@metux.net>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNiAzOjI1IHAubS4sIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToNCj4g
VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xs
YWJvcmEuY29tPg0KDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+DQoNCkhhcnJ5DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNSArKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBpbmRleCBjYjdjZmE5YjM0
ZjIuLmU4NzJhNDE1YjQwOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IEBAIC01MTQ0LDExICs1MTQ0LDEyIEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9t
YW5hZ2VyICpkbSwNCj4gIA0KPiAgCWNvbm5lY3Rvcl90eXBlID0gdG9fZHJtX2Nvbm5lY3Rvcl90
eXBlKGxpbmstPmNvbm5lY3Rvcl9zaWduYWwpOw0KPiAgDQo+IC0JcmVzID0gZHJtX2Nvbm5lY3Rv
cl9pbml0KA0KPiArCXJlcyA9IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygNCj4gIAkJCWRt
LT5kZGV2LA0KPiAgCQkJJmFjb25uZWN0b3ItPmJhc2UsDQo+ICAJCQkmYW1kZ3B1X2RtX2Nvbm5l
Y3Rvcl9mdW5jcywNCj4gLQkJCWNvbm5lY3Rvcl90eXBlKTsNCj4gKwkJCWNvbm5lY3Rvcl90eXBl
LA0KPiArCQkJJmkyYy0+YmFzZSk7DQo+ICANCj4gIAlpZiAocmVzKSB7DQo+ICAJCURSTV9FUlJP
UigiY29ubmVjdG9yX2luaXQgZmFpbGVkXG4iKTsNCj4gDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
