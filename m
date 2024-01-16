Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5738382EB0F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 09:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813D10E446;
	Tue, 16 Jan 2024 08:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2056.outbound.protection.partner.outlook.cn [139.219.146.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1622B10E446
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 08:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkkR7h980GxPqXrRS42Wt+8C1quNeNYtRsr2Tb84W6uBn/KWNmaP1OnJ27WEY//4dY6bY9QzBdf15p1ZZVPsk38zUWL2wasB5LDH5G4sKTMr2KXdN9uFV/fi0HzLHwR55tjdlXHU/PmAkduFLbjzu4OO1QfyLLU5lKzShoocmstANsozYEZkUgEjL+hpC1YGgJgxMCc3Vz+TorFpOhEkdUXh81F+dh3lMJYveUT8hEAhLWOqRRpd249NL8ozSNQjwuE1Lki/jKEwzL5tKIxYfBBnkSaHT+cpTiGMLQzWz5kFVvh0UwJYA+ZkPiNeNIac+tTB9ktR480i7zSwcjw5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPdZZAS/TeqW1LgNnFRzMzCp9PXbP/A2KZj1WqsqgYs=;
 b=E5HMGb7XeIP3+p8a6V5PoAfHrF2SHVXDVEyWreB4077YSi7sk9GdUnKdH1nJZDQ7msL29C5G0wUXA8p0H4h4mnIYEGoGAJ6ULWi+GoHO4rpRFoOyw6jK4oEp+eTlSDHxFTk3zG4r59UEWiERq3aC/JHVDj7P926uErWQ73MnUWJLGYdR4kSHxkKAnnU/Eb7szAR9AFTV39VmmxIyWW/IFmuiM9+3qJ5RY++Idye0esCCIcaeCEBg9B53jeoxRRaszrNPWCMReFPdLHcS/Aem2u2pruiL0t2+nwNWf9VUqkdqBiqS752Nht5Fd0ezAkpP50yQ9PH2LaZhSWXNguUc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB1222.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 08:46:16 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 08:46:16 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: bridge: cdns: Add properties
 to support StarFive JH7110 SoC
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: bridge: cdns: Add
 properties to support StarFive JH7110 SoC
Thread-Index: AQHaQs0D/7gAOG/yNE2Cn34GlFLGirDTjBeAgAidBsA=
Date: Tue, 16 Jan 2024 08:46:16 +0000
Message-ID: <ZQ0PR01MB10624C7322A5CF80889189A5EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
 <20240109072516.24328-2-shengyang.chen@starfivetech.com>
 <78b8400b-806d-4e8e-b7e3-582b80aff4b2@linaro.org>
In-Reply-To: <78b8400b-806d-4e8e-b7e3-582b80aff4b2@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB1222:EE_
x-ms-office365-filtering-correlation-id: 165fb787-c99f-45dd-a0ed-08dc166f9a45
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mGhOQppik29mH6M7ZU6nfh7W0OlP2L+aRK34OlkNureGKXDOtTBWVVcQLHDDpVwpd6pXaQFoJjquaRmj6flxFO1tpzeqyqIsRkTTiDo4HqXkp0q4Ka7rfpno9THcsnU8pey0XW8Jg3zx4n6gQPd6GwxspPhSKWVMmFYfHyNNVX1ykK/9FjFqHoQeoWVQcCpc9T4tuE+ZddSFr9aoWWMSpLAM/CDPZM9mVed4FwQesznOdyEdipeOymAfSdluKSXazI/mOvB33xXdhnOVubeWjl7kUH+vLysoHNwiFxkm/zpnoWkGI8zjUrhLD6TrxzfQyZFCToINlHuHQ951p2ItmautwfUpQsn4Y1ugqK/V09H++HLBNqJJMxd9XU+lc2Q9gkvD7RWRQb+XBFoFz1Lv68GWYxakLeGKxyocTMfM2mXqIvhEZRyUA97vqZ+kNO6eJm7p5xPmunaWdYvS1hlLNdLa81ITnTJwaJFXWgl73ATgMPYwXZHA7qpIr+sp60SMjnR97tooJEHeU1ZWLJubxC5claWDGhuaFXGQ9i+QyDjLkmqUEEAZGTOjLmUTYlav09KgCM32jmbP9gS4tiUgFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39830400003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(41320700001)(33656002)(2906002)(5660300002)(7416002)(122000001)(40180700001)(8936002)(8676002)(86362001)(44832011)(4326008)(54906003)(41300700001)(38070700009)(64756008)(66446008)(83380400001)(26005)(40160700002)(966005)(508600001)(66476007)(110136005)(76116006)(66946007)(66556008)(9686003)(71200400001)(53546011)(7696005)(55016003)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTNFcTNVdzE0WDZZK2h2UDVaVWsrZjBjUDFKZ0VCUmpWZnpYSzdvOXQzMjJh?=
 =?utf-8?B?MWxmK09BV3JnVzhGT3VnM002b3QybGJ1VksyM0R6OUxOU1hPRE14YUwxci9H?=
 =?utf-8?B?Z3JyT1J6SmJ6VGV4QXFCRnIzQjVNVis0bGxrVFZoVWk5eUZGZnJhQ3E3ZHl2?=
 =?utf-8?B?eVRVMG9DMXh2MGZ4WGRCZkUvcFE2c0ZZbDlRbjhIdm5YWWtLVFlkbGgvMjZI?=
 =?utf-8?B?dFZJUjh3UFVoWTU0a2Z3RWd6M05na3NMd2F0clp5U3Fic2oxL0hYZ09lc2p4?=
 =?utf-8?B?c2VkQWpzeXFaVERXem0vbHhOTEM0VDlvd0dRT0g5M0lWVVVNSWhhNUVmcC94?=
 =?utf-8?B?VGs4ckJwYTg4MWJ6bWU5L3pvcE1XbGt0NTcwWDh6RFpMTHBjR09PaGE4eXZ5?=
 =?utf-8?B?QUw3cUltYVRiM2tjclR3Z1VkNlNwR2xPbmg0NlJvWTYzOHNPZ1JyY0hVNGdh?=
 =?utf-8?B?bFV2VUVwYnZUQ2FQaWpXaXM0Q3gvOTROUFNIS3ZrUUM4ZTZBY21Gd2xNaGpW?=
 =?utf-8?B?ck44eDlmMGZsQjVacGF0NXpqM21qWDIzdFlQUjRicU5vWjFMekZQckwzQ3ZG?=
 =?utf-8?B?UnVCQmY5NEU1Q3Z3UUJPT1FlZjhyRGJuRmg4OWd6T0ZlN1BxS2xEYzNkNXZy?=
 =?utf-8?B?aGxsbDdjb2VpcVBiNU8yRGIxellDbVQ5K0V1M0liN1diRERoVTBmMUpFUElp?=
 =?utf-8?B?SWprb1Vjbk05eUVKWFVPRDU2WWl6M3pUNXpOQXcvVGR0Q1d0MjZaMWM1RnAz?=
 =?utf-8?B?cXh5NmdGN003MDUrUGFkQmpFelBuTHZXOWs4WWZzL0FydG9Lb2l4cFNzUDJI?=
 =?utf-8?B?M0dYa1hYOFpUeFlOanZYNUpvWGEyd0xGVDJWSmk3bmFyYThsRitjLzFDeERC?=
 =?utf-8?B?cnRMVERXTGUwNytJYlA2ajlyRWlIWkxJUytweWlINURaOWR2NVZEcE5CdWgy?=
 =?utf-8?B?bUF2czJKdDBQZUpmWTBBN1R1d3MwOS9IZ0V2VXBQcnk2byt4WG01VGxJTzkr?=
 =?utf-8?B?TU92bmhIN1VsVDBqMExCSmxJQVpOVGhHczZiNGpUVkx0TnNaVnB6WXVUd0Fj?=
 =?utf-8?B?Z3lINmYvRTV4SVFXSWlpZkp4eHdtZXZxRXRzL2Urdmhpb0orRVZiZkg4ajNZ?=
 =?utf-8?B?WGtZM2dXUStVb2Q4TC9yUFR2bjRVd0I2d045NlpmT2NvRUNyRGtVazZnaHY4?=
 =?utf-8?B?YXpPTWQyN2xTaUxJNE53TjlVeTdVenhBVVlFRURsWWcrTUZlL2FwMkVMSFIy?=
 =?utf-8?B?U2VQbjcrREZzbkVhVXFDMlBIR05Vbk4yUFBoM21jM08vZlBWZ3M4WE9RcStw?=
 =?utf-8?B?bnpldVc2YVdQZmo4b2djUGZEaW10VTJCNmJFTzY3ekJFYjhYNDRmZlI1RC9z?=
 =?utf-8?B?alFGWS94RUJFZCt1bkNnSzg5a3RuN3drVTJrdnQxS1lyN2t3WHhGNDYwcWFs?=
 =?utf-8?B?d2R1MlJMQ1I2QkRBR0NtTHBwRmZ0Z2FGZHJuLzNjL3FjbHJPY25YdkZqK0Zu?=
 =?utf-8?B?U1ZDOGEwY0s2QVladSttblRpakd2RE92NEtJaWdFWXBlNFhMSFA3bFdqd2NH?=
 =?utf-8?B?Z01JZkVLcmRpR2IxZk8vK2E3YjJ5Y1F5WUVndUdNZkhxK1poV3ViNTJER0l0?=
 =?utf-8?B?RlVwNnRXS2lEYlphL2k1ZlI3ZHdRMTJHUURZcUlCQytuYjRzMXdTblBQdXRn?=
 =?utf-8?B?d0ljOTVTQmxSU1lyOWZ2K1lTK2RFajI2V01qRytKcjY3WXhyOWgrVDhYV21G?=
 =?utf-8?B?UkRYZ2tSWTAzanMwSzVqdnVJUHE2ZE1SZjM5djhuMmVQZlRydkNveWdRY3Nt?=
 =?utf-8?B?eGFxbW03bTdGMFJOaXgwdXNINUZhMGhwdHY4WlV2Q2F1ckRRMUtjU1RnQlY4?=
 =?utf-8?B?M2lYUnA0cm03bXB5R2VLNkRIYW5ON1YxSUd1eVJTSVNYaDl6NzYwS1BMLzRh?=
 =?utf-8?B?Wnh4eXF6Z21RbUxHT210aFdVZ0w5L0ZqRmd5VHdRY3MrOVdtZk4zclVmck5y?=
 =?utf-8?B?MlU1UXZiRHlFRTBvTmw0V0VEbTVwM0JQT3NtV041bC8xVmxGcUxrdHZpVkdG?=
 =?utf-8?B?dmN6dFBPcXI0TmluNm1QMWtFdWFRbVZGWGVrV294NUI1MHN1ZE0rckJ2OXQy?=
 =?utf-8?B?akZlb1VtTDFPZ1VIbkF5NEZjRzdOOFkzZjBsM2FnTENxYWdmZ2hvOEx5VlNV?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 165fb787-c99f-45dd-a0ed-08dc166f9a45
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 08:46:16.4674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYOiPPw/Krq+Hc6u5nbjqocS9RafNiau2mZQC2+OhRwZAmUJwwbfz5knydMxihJki2AewuN3PPso3Fis20UpbQEixRKTRvt/T6uLsm01EYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1222
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "r-ravikumar@ti.com" <r-ravikumar@ti.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "aford173@gmail.com" <aford173@gmail.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHJldmlldyBhbmQgY29tbWVudC4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IDIwMjTlubQx5pyIMTHml6UgNTow
Ng0KPiBUbzogU2hlbmd5YW5nIENoZW4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+
Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogYW5kcnplai5oYWpkYUBpbnRlbC5jb207IG5laWwuYXJtc3Ryb25nQGxp
bmFyby5vcmc7IHJmb3NzQGtlcm5lbC5vcmc7DQo+IExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbTsgam9uYXNAa3dpYm9vLnNlOw0KPiBqZXJuZWouc2tyYWJlY0BnbWFpbC5jb207IG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsNCj4gbXJpcGFyZEBrZXJuZWwub3JnOyB0
emltbWVybWFubkBzdXNlLmRlOyBhaXJsaWVkQGdtYWlsLmNvbTsNCj4gZGFuaWVsQGZmd2xsLmNo
OyByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsN
Cj4gY29ub3IrZHRAa2VybmVsLm9yZzsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsNCj4gdG9taS52
YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbTsgci1yYXZpa3VtYXJAdGkuY29tOw0KPiBhZm9yZDE3
M0BnbWFpbC5jb207IHJkdW5sYXBAaW5mcmFkZWFkLm9yZzsNCj4gdS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlOyBiYnJlemlsbG9uQGtlcm5lbC5vcmc7IENoYW5naHVhbmcgTGlhbmcNCj4g
PGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT47IEtlaXRoIFpoYW8NCj4gPGtlaXRo
LnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT47IEphY2sgWmh1IDxqYWNrLnpodUBzdGFyZml2ZXRlY2gu
Y29tPjsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogY2RuczogQWRkIHByb3Bl
cnRpZXMgdG8NCj4gc3VwcG9ydCBTdGFyRml2ZSBKSDcxMTAgU29DDQo+IA0KPiBPbiAwOS8wMS8y
MDI0IDA4OjI1LCBTaGVuZ3lhbmcgQ2hlbiB3cm90ZToNCj4gPiBGcm9tOiBLZWl0aCBaaGFvIDxr
ZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+DQo+ID4NCj4gPiBBZGQgcHJvcGVydGllcyBpbiBD
RE5TIERTSSB5YW1sIGZpbGUgdG8gbWF0Y2ggd2l0aCBDRE5TIERTSSBtb2R1bGUgaW4NCj4gPiBT
dGFyRml2ZSBKSDcxMTAgU29DLg0KPiANCj4gUGxlYXNlIHdyYXAgY29tbWl0IG1lc3NhZ2UgYWNj
b3JkaW5nIHRvIExpbnV4IGNvZGluZyBzdHlsZSAvIHN1Ym1pc3Npb24NCj4gcHJvY2VzcyAobmVp
dGhlciB0b28gZWFybHkgbm9yIG92ZXIgdGhlIGxpbWl0KToNCj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuNC1yYzEvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJt
aQ0KPiB0dGluZy1wYXRjaGVzLnJzdCNMNTk3DQo+IA0KPiBTdWJqZWN0OiBNYWtlIGl0IGNvbmNp
c2UsIGxpa2U6ICJBZGQgU3RhckZpdmUgSkg3MTEwIFNvQyBkaXNwbGF5IGJyaWRnZSBvcg0KPiBz
b21ldGhpbmciLg0KPiANCg0Kb2ssIHdpbGwgZm9sbG93IHVwIHRoaXMgaXNzdWUuDQp0aGFua3Mg
Zm9yIHN1Z2dlc3Rpb24uDQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEtlaXRoIFpoYW8gPGtl
aXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2NkbnMsZHNpLnlhbWwgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9jZG5zLGRzaS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2Rucyxkc2kueWFtbA0KPiA+IGluZGV4IDIz
MDYwMzI0ZDE2ZS4uZGEwOTFlMTA1Nzk0IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLGRzaS55YW1sDQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMs
ZHNpLnlhbWwNCj4gPiBAQCAtMTYsNiArMTYsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBh
dGlibGU6DQo+ID4gICAgICBlbnVtOg0KPiA+ICAgICAgICAtIGNkbnMsZHNpDQo+ID4gKyAgICAg
IC0gc3RhcmZ2ZSxqaDcxMTAtZHNpDQo+ID4gICAgICAgIC0gdGksajcyMWUtZHNpDQo+ID4NCj4g
PiAgICByZWc6DQo+ID4gQEAgLTI3LDE0ICsyOCwyMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAg
ICAgICAgUmVnaXN0ZXIgYmxvY2sgZm9yIHdyYXBwZXIgc2V0dGluZ3MgcmVnaXN0ZXJzIGluIGNh
c2Ugb2YgVEkgSjcNCj4gU29Dcy4NCj4gPg0KPiA+ICAgIGNsb2NrczoNCj4gPiArICAgIG1pbkl0
ZW1zOiAyDQo+ID4gICAgICBpdGVtczoNCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogUFNNIGNs
b2NrLCB1c2VkIGJ5IHRoZSBJUA0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBzeXMgY2xvY2ss
IHVzZWQgYnkgdGhlIElQDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGFwYiBjbG9jaywgdXNl
ZCBieSB0aGUgSVANCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogdHhlc2MgY2xvY2ssIHVzZWQg
YnkgdGhlIElQDQo+ID4NCj4gPiAgICBjbG9jay1uYW1lczoNCj4gPiArICAgIG1pbkl0ZW1zOiAy
DQo+ID4gICAgICBpdGVtczoNCj4gPiAgICAgICAgLSBjb25zdDogZHNpX3BfY2xrDQo+ID4gICAg
ICAgIC0gY29uc3Q6IGRzaV9zeXNfY2xrDQo+ID4gKyAgICAgIC0gY29uc3Q6IGFwYg0KPiA+ICsg
ICAgICAtIGNvbnN0OiB0eGVzYw0KPiA+DQo+ID4gICAgcGh5czoNCj4gPiAgICAgIG1heEl0ZW1z
OiAxDQo+ID4gQEAgLTQ2LDEwICs1MywyMSBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgbWF4SXRl
bXM6IDENCj4gPg0KPiA+ICAgIHJlc2V0czoNCj4gPiAtICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAg
ICBtaW5JdGVtczogMQ0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IGRzaSBzeXMgcmVzZXQgbGluZQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBkc2kgZHBpIHJl
c2V0IGxpbmUNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogZHNpIGFwYiByZXNldCBsaW5lDQo+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGRzaSB0eGVzYyByZXNldCBsaW5lDQo+ID4gKyAgICAg
IC0gZGVzY3JpcHRpb246IGRzaSB0eGJ5dGVocyByZXNldCBsaW5lDQo+ID4NCj4gPiAgICByZXNl
dC1uYW1lczoNCj4gPiAtICAgIGNvbnN0OiBkc2lfcF9yc3QNCj4gPiArICAgIGl0ZW1zOg0KPiA+
ICsgICAgICAtIGNvbnN0OiBkc2lfcF9yc3QNCj4gPiArICAgICAgLSBjb25zdDogZHBpDQo+ID4g
KyAgICAgIC0gY29uc3Q6IGFwYg0KPiA+ICsgICAgICAtIGNvbnN0OiB0eGVzYw0KPiA+ICsgICAg
ICAtIGNvbnN0OiB0eGJ5dGVocw0KPiA+DQo+ID4gICAgcG9ydHM6DQo+ID4gICAgICAkcmVmOiAv
c2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+ID4gQEAgLTkwLDYgKzEwOCwy
OCBAQCBhbGxPZjoNCj4gPiAgICAgICAgICByZWc6DQo+ID4gICAgICAgICAgICBtYXhJdGVtczog
MQ0KPiA+DQo+ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAg
ICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAgICAgICAg
IGNvbnN0OiBzdGFyZml2ZSxqaDcxMTAtZHNpDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1z
OiA0DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogNA0KPiA+ICsgICAgICAgIHJlc2V0czoNCj4g
PiArICAgICAgICAgIG1pbkl0ZW1zOiA1DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogNQ0KPiAN
Cj4gTWlzc2luZyBjb25zdHJhaW50cyBmb3IgeHh4LW5hbWVzLg0KPiANCg0Kb2ssIHdpbGwgZml4
IGl0DQoNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSByZXNldC1uYW1lcw0K
PiA+ICsgICAgZWxzZToNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9j
a3M6DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogMg0KPiA+ICsgICAgICAgIHJlc2V0czoNCj4g
PiArICAgICAgICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBTYW1lIHByb2JsZW0uDQo+IA0KDQpvaywg
d2lsbCBmaXggaXQNCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQp0aGFua3MuDQoN
CkJlc3QgUmVnYXJkcywNClNoZW5neWFuZw0K
