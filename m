Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B8E4503EF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E36EA88;
	Mon, 15 Nov 2021 12:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2119.outbound.protection.outlook.com [40.107.215.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCCB6EA85;
 Mon, 15 Nov 2021 12:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+58ZYyQutDBHJ8YMtDzsRXPp6zHiTHzHa+m6NY+gYkO9edIzY/eE5AjKIDHWqV4uO4XOpp3Q1oaCluT3BmA5cV1iWPvbVu3lvWF0MzJUr8D2Dd0e+Tbdx6esL+EeNiwRZlKFDc70ZaxWnN6DmuqBn5tobNOHchk6tkmC4oOhhTmTk+Yh5AEznIve+gPLKAUyf6bZZaEGey6piai5BicGmHC0UouewMDPXzm+pPwKdwQnUWW7O232Z1PMllz0QU3YX7u5G2wV/sAJtCFLzXt/U5xW4eEAIALdYiuQCc/BD6oZQOsweKAcgqRPA+abwXMTaCikNOOo8nW+IY2DrD5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/Z5dBooEqfDWZtu8UAcwraURiebcGK5sT9/nvdXKg4=;
 b=E4bWyWRNaX4rOixZSCMN8V6WaIYKyI2hqzsQHnWcsxea4CtD4BQdyD+3CP3iVQA+wDO1QJbkM2b3E3bb3Db2Z52m/7MLCIhfx3qG1Wq91vprh/cpCD3/q9BawN+dz9NSDKLSQuU4vdjnjnHX8H1JTQSysZaC0K/E1CtX8hqFNB7lgBdxO/LQ9T+4oZFhitobdklfVsShG5SkaW0fngSSUYPTQ1Xj75FjHD0DPPPm/2riC0dRr/D9o5bJ7wZL84tK57l7cccqFXJjxYt2/rSkQiXVMJOJ7xM+aLzr8wqTAEEX4KroScqDoyDvVSYeg/9Z4WYAj8L4Zm4oS1wZFfzisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/Z5dBooEqfDWZtu8UAcwraURiebcGK5sT9/nvdXKg4=;
 b=YrjyPBK2/RtqRjCKxJJfAk6gvEPuYLb22CM46qO334IVugmWAwDuy0vwxCAEi0RrZRS2ENTqlu6H04PDSRLnF8wmrCtSH7NoCdXVFFx7LNWjOND5skQE4qay8acdnSRM3PgSBjqvGns3bhHSh0wJMzsp1bCIuon+CzHn78g/6/k=
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS2PR06MB2437.apcprd06.prod.outlook.com (2603:1096:300:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 12:01:48 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 12:01:48 +0000
From: =?utf-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Jingwen Chen <Jingwen.Chen2@amd.com>, Candice Li
 <candice.li@amd.com>, John Clements <john.clements@amd.com>, Monk liu
 <monk.liu@amd.com>, Peng Ju Zhou <PengJu.Zhou@amd.com>, Jiawei Gu
 <Jiawei.Gu@amd.com>, Bokun Zhang <bokun.zhang@amd.com>, Zhigang Luo
 <zhigang.luo@amd.com>, Lee Jones <lee.jones@linaro.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGRybS9hbWQvYW1kZ3B1OiBjbGVhbnVwIHRoZSBj?=
 =?utf-8?Q?ode_style_a_bit?=
Thread-Topic: [PATCH] drm/amd/amdgpu: cleanup the code style a bit
Thread-Index: AQHX2e9xsoW/EHEIm0+zoT+4iNCeKawEebIAgAAConA=
Date: Mon, 15 Nov 2021 12:01:48 +0000
Message-ID: <PSAPR06MB4021E37D4219DEBEF58E9CA0DF989@PSAPR06MB4021.apcprd06.prod.outlook.com>
References: <20211115070714.7007-1-bernard@vivo.com>
 <AFkAWADGE4YQkIdpTO49K4pP.9.1636976948000.Hmail.bernard@vivo.com.@PGViY2Y4YjMwLTczMTEtOWQ3Ny0wN2FiLTFiOTI3NTZjMGFlMEBnbWFpbC5jb20+>
In-Reply-To: <AFkAWADGE4YQkIdpTO49K4pP.9.1636976948000.Hmail.bernard@vivo.com.@PGViY2Y4YjMwLTczMTEtOWQ3Ny0wN2FiLTFiOTI3NTZjMGFlMEBnbWFpbC5jb20+>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e766d98e-8ff5-4705-c5c9-08d9a82fb3f7
x-ms-traffictypediagnostic: PS2PR06MB2437:
x-microsoft-antispam-prvs: <PS2PR06MB243761B3EE321D6575C09103DF989@PS2PR06MB2437.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MH2v1hEgdAyawTs9yFPbDPxynwsjQdZO/XOJwSEvqdbdbARVJDURXVz1InsJIZOBsSbjZ9rnsKoizSga1yZlmYXy356+A1+7ep/bSO4h/KfTsi0NzBPq/4ZsXY0nE5IrEk1R+M3F8UCMe3H4gfo44Sorqlzzu85pwromwUcoB8QQE/hN20Kij71VN6dRD3i7eDZBwAM45FS3iSiIsCYMK9nzeLRcaF0Wejhh7IUe7WPEV0YVjb6h6VOgubsij55g/Zu8//tuKMTWsTtLC1Fa1NWRNEatOdDJJ/YxlRN53HLz6ffXx7phlQbUt7HaIyCiT9V8MX20Hd0Zv5PBFREy0UZttgnBWDUlE6VcCLsoE/L0CjfvKSd1RnlN6Jmlw1EiIeqgOSDuN/P2BuozmfDsodSQoHIJ8M852fzWtwBdUIjk/Zw0F7T4iPX9kvWHwcCX+3M00hiQ2HuFCp3rB1W8z3mZNmFpVeEiWDJ8MjcRuY8o74LnNOLPAZ0dC/lYQkgqLIETLqwl6QiLOqqIQYyH/BOPMhe/NIVRFAewOdJGG9/jkZMg0lyPfGd/fc1F4Y/Q02vWoaD10IFVyKsCaol/eHgkz94nAX1ZE3P9hDCig3MTd38+thZae/t3Hc8pxBR8QInQJcPX/2uGTH9nctGKDLaWw/w+9yQAcmsebXihLRTk+L6ncfA5IW5VC+RMui0t4BjeSy3hWmik0kwobnVdeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(7696005)(52536014)(7416002)(76116006)(186003)(122000001)(5660300002)(921005)(71200400001)(316002)(33656002)(66556008)(9686003)(85182001)(66476007)(66446008)(55016002)(66946007)(64756008)(2906002)(508600001)(26005)(6506007)(224303003)(110136005)(38070700005)(38100700002)(66574015)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWVyUUlDMk00UE1sSGN0bkYxaFo5OUxzaS95M0xHMUd4b3B3MkI5aHFLTFFQ?=
 =?utf-8?B?UURPWlQ5YW5uWlBJZURHMGFTNkFlQ1h1VlRqRkZTSUpVOUQwMGxydlpjbHJW?=
 =?utf-8?B?V2VpSnB4Y1pFRTFYV2YvMjFYMzIyQ1V3dU8zb2c2RVAzSlJ1RzBzd3o3Z2F3?=
 =?utf-8?B?S0FXZlBrcHJUZWVac0QzNTd5d1RvYksyRmFLTFJhQzcvZUxvcklzM1Ridk1k?=
 =?utf-8?B?S2c4eGlmNzZjcTRqVXg5S1pkSndtMWdnL1BnQlVNVjRLU3NBUHZvRExVUDI5?=
 =?utf-8?B?VnErZlo2T3ZVbVUvVWs0cjF3Vi9Oc0dFRVZqSnpJMUZjM0c4Z243L2VmVkhk?=
 =?utf-8?B?YnlkSmhGZVZIZFF0bStaQ0RqTGFZUnd2bWVyMS9Xd1FsNDZVaUV0aHJvdkd0?=
 =?utf-8?B?SE9QSnpTcGF0aUVCWHNLc3NHTGpjeFFGNStrVU5vRjVIaEVwLzBlS0kwNjhW?=
 =?utf-8?B?ZG5sVzQ3ZE1GZWxiMmhxbEEyZHNhRFdqUzNsZThmVDd4RjNBcVplWDI3MXl3?=
 =?utf-8?B?OE9VUWx6MU1IVURIZ1VoMWFiWkxqTU9CcVBDclJjOUNKODZISEpaMG1saUc5?=
 =?utf-8?B?V1BUaVRjSjdsZCtMNUlYS1dBOWpaaGNTMEVFR3ZSNmovdWJnVFhNeXZPSW5I?=
 =?utf-8?B?WW9uNlgzQm1HSlA4RU51djJKdVpYYlVtb2ZWbm9TNWovUEVVQzRxc1h2bDdI?=
 =?utf-8?B?NjNCVkJTRVJ3Q2ZjNEtsUFQ3Z0s2MWNaQUlvMVBxWHJjNjdUTEREdXQrVy9K?=
 =?utf-8?B?QnpHRDVXaFhUd0EyNFRjcGdvZENEanM0TVBtY3d1bEZQNEE4K1F2emRZVm5L?=
 =?utf-8?B?aEwyUk51UHFUT21rUzlycEkrclBGTmlSWUNaOElwODRRNkVzOC9uYVlReEZE?=
 =?utf-8?B?cVJ6L3llYjg2eEh6bi9iUUlDTU5MZ1AzenVXaEFZYmR2cHEyQUlMY0E5bUw2?=
 =?utf-8?B?a2FSMXBBdWRJbUJ0eGw0MjFLSFlaT1loUHRoWXR5cHBqdDJmaGc3Y1dCcUpm?=
 =?utf-8?B?WkZYcHpkMGJ0RWd6aCtDd21QczUxYUMybWY5cGtTWGNjNm1idTIyaWFuMnMy?=
 =?utf-8?B?bWxLUDhXUVB3bndZNURnMDJVdlVyZDVWVGVsTXpxOUpGcTk0UzZGR2duSlVo?=
 =?utf-8?B?QlJyUnRxVEc1bzhTVElMSlQ5Y3hRRXdycEdKQS9MNG1lbklVeTJjbXZyWkZJ?=
 =?utf-8?B?NVdaK1N0Tm9KV1RnUUpFVzY4T0JscVlkbmlmR3N4STNZS1NoaFF6R1Vzc0ZJ?=
 =?utf-8?B?alU2OTE2RVB4bUtXbXpEWmhYWkEyMk5Fa0NYcU94SElXTDBENWhaUmxyMWMw?=
 =?utf-8?B?NWZnQXZYUmM1UXNuUWd6MDlNSFV1TjFrYzBNeXRsSjZXUEg4QkFsS0xhTXhN?=
 =?utf-8?B?b0I4L2R3dEJkcmgvUHRFaHlmbXhDTHdDODR3dWV4d1lrQ282RitpWUh0UE04?=
 =?utf-8?B?Ti81dGF6M1crVXhFdkRDa2Z1OXNDQlIvZkpkQ0MrcXY3dld2a3VucjBnUVVG?=
 =?utf-8?B?cTlRdzlEVkpnZ2R1MFdTbS85ZEpqc1BNMWxPQitUaHVlUFJaM3BkRUZ0RTU0?=
 =?utf-8?B?Zk9mVFpKM3ZtanloZzU1VHpJQ2xxT0pLMXZOdW5ZUEZuMUJyQmdsV0plMkhB?=
 =?utf-8?B?WFJ4L1BSV1ZhK3VKTS9CbGRzTTBQSytnTnJRZHdmYUxwY1krRXB1amE3OWxm?=
 =?utf-8?B?UjdZN3RGVWE0SGRMUmtCL3doVDhLb0Y1ekRPRzJUcnVGSndwcGg0Y3FVaE1u?=
 =?utf-8?B?NitWRkYzNENLNzZiNkpKMzdUKzVwMkwvd2M1MzVZb3B3OHE3K2RkVFhZRkp1?=
 =?utf-8?B?RnhXdFZYOWRwRjJmNGtzdVdYeHVjOTdJY2ptNlRIa0p2cEtQMkY3ZnJsN3di?=
 =?utf-8?B?NHpsOTNCMHhSd2w4dnZGWDhvZVYwVUVSL2hISFp4dWYyYnpPZUpvaGwzMHBo?=
 =?utf-8?B?azhsTmpJVFBVV0NRQU9GVHJkdGF5QjF1UklubUFWbEx5NW5jZXdPQmJheXlS?=
 =?utf-8?B?ZmNqVy8rMzI4MWo1ZldIYlhnZW84L21sek81ZE14TFdrYXVLbjl5Ni9SK0oz?=
 =?utf-8?B?ZmhiVEpMWGRvR29KTFRZaFF0S2sreXdlNXROTzh3YWNEcjhlQnFFdkRNUUpC?=
 =?utf-8?B?QWFCV3lyL29GaXdEUEtWdUpNejBTbURHanEzMjhtZW1YclIycVB6ZjJCOWU2?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e766d98e-8ff5-4705-c5c9-08d9a82fb3f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 12:01:48.4550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZInTfP3XCaAsUumILC0AObx0lnDfR9YUE4LSmJbRro8jRQi5syCbpXHrOpRnH0io8CyWs4G6sLQzYuCjkv7g2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2437
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IGJlcm5hcmRAdml2by5jb20gPGJl
cm5hcmRAdml2by5jb20+IOS7o+ihqCBDaHJpc3RpYW4gSz9uaWcNCuWPkemAgeaXtumXtDogMjAy
MeW5tDEx5pyIMTXml6UgMTk6NDkNCuaUtuS7tuS6ujog6LW15Yab5aWOIDxiZXJuYXJkQHZpdm8u
Y29tPjsgQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPjsgQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5Q
YW5AYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD47IEppbmd3ZW4gQ2hlbiA8SmluZ3dlbi5DaGVuMkBhbWQuY29t
PjsgQ2FuZGljZSBMaSA8Y2FuZGljZS5saUBhbWQuY29tPjsgSm9obiBDbGVtZW50cyA8am9obi5j
bGVtZW50c0BhbWQuY29tPjsgTW9uayBsaXUgPG1vbmsubGl1QGFtZC5jb20+OyBQZW5nIEp1IFpo
b3UgPFBlbmdKdS5aaG91QGFtZC5jb20+OyBKaWF3ZWkgR3UgPEppYXdlaS5HdUBhbWQuY29tPjsg
Qm9rdW4gWmhhbmcgPGJva3VuLnpoYW5nQGFtZC5jb20+OyBaaGlnYW5nIEx1byA8emhpZ2FuZy5s
dW9AYW1kLmNvbT47IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K5Li76aKYOiBSZTogW1BBVENIXSBkcm0vYW1kL2Ft
ZGdwdTogY2xlYW51cCB0aGUgY29kZSBzdHlsZSBhIGJpdA0KDQpBbSAxNS4xMS4yMSB1bSAwODow
NyBzY2hyaWViIEJlcm5hcmQgWmhhbzoNCj4gVGhpcyBjaGFuZ2UgaXMgdG8gY2xlYW51cCB0aGUg
Y29kZSBzdHlsZSBhIGJpdC4NCg0KPlRvIGJlIGhvbmVzdCBJIHRoaW5rIHRoZSBvbGQgc3R5bGUg
bG9va2VkIGJldHRlci4gSXQgdG9vayBtZSBhIG1vbWVudCB0byB2YWxpZGF0ZSB0aGlzIG5vdy4N
Cg0KPldoYXQgeW91IGNvdWxkIHRvIGluc3RlYWQgaXMgdG8gaGF2ZSBnb3RvIHN0eWxlIGVycm9y
IGhhbmRsaW5nIHdoaWNoIHdvdWxkIG1ha2UgdGhpcyBhIGJpdCBtb3JlIGNsZWFuZXIgSSB0aGlu
ay4NCkhpIA0KTG9va3MgbGlrZSBhIGdvb2QgaWRlYSwgdGhhbmsgeW91IGZvciB5b3VyIGNvbW1l
bnRzIQ0KSSB3aWxsIHJlc3VibWl0IGEgdmVyc2lvbiENCkJSLy9CZXJuYXJkDQoNCj5DaHJpc3Rp
YW4uDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29t
Pg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jIHwg
MTAgKysrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmlydC5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0
LmMNCj4gaW5kZXggMDRjZjliMjA3ZTYyLi45MDA3MGI0MTEzNmEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYw0KPiBAQCAtMjg2LDEyICsyODYsMTQgQEAg
c3RhdGljIGludCBhbWRncHVfdmlydF9pbml0X3Jhc19lcnJfaGFuZGxlcl9kYXRhKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+ICAgCWJw
cyA9IGttYWxsb2NfYXJyYXkoYWxpZ25fc3BhY2UsIHNpemVvZigoKmRhdGEpLT5icHMpLCBHRlBf
S0VSTkVMKTsNCj4gKwlpZiAoIWJwcykgew0KPiArCQlrZnJlZSgqZGF0YSk7DQo+ICsJCXJldHVy
biAtRU5PTUVNOw0KPiArCX0NCj4gICAJYnBzX2JvID0ga21hbGxvY19hcnJheShhbGlnbl9zcGFj
ZSwgc2l6ZW9mKCgqZGF0YSktPmJwc19ibyksIA0KPiBHRlBfS0VSTkVMKTsNCj4gLQ0KPiAtCWlm
ICghYnBzIHx8ICFicHNfYm8pIHsNCj4gLQkJa2ZyZWUoYnBzKTsNCj4gLQkJa2ZyZWUoYnBzX2Jv
KTsNCj4gKwlpZiAoIWJwc19ibykgew0KPiAgIAkJa2ZyZWUoKmRhdGEpOw0KPiArCQlrZnJlZShi
cHMpOw0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgCX0NCj4gICANCg0K
