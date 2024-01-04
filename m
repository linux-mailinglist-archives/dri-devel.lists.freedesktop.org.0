Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F7824013
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6EB10E429;
	Thu,  4 Jan 2024 11:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DBF10E429
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OitPDXMy+QzmIBZCaoCXQFiLlO+VsBQeQtmdDNgsaMu3aeJRrYySKryfldOu/lhernnLVaAGX/z2CCByNaTNL6EiAoMk41QJXZUaDbOwrEyzlDibIOvf9/4wTnK3chT9eI1YPo3w4dUktiyvjkwXMYrdTm4SNCcfZ3Zb6shUQctauQBmWSLRtAu2CNevmB6pzdzoVxRl21iyQ4vqfn5CBa2tpVqWvtmnn0oC3lu7jwIA++WRkZZGvcNc5rQqNPncqePa/B4tJAOxAuPynXVAcMEYuzWYXh30PgMXgq0nE/4i1lCL4/gNjcQn4JPDMa7Xyerb+On02iUKA/OWAtP22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJqbSmkOUktXfVIy+49JeNAfyllj9CLtwQLYEdTGvjg=;
 b=ccPCOpsiP3ATiD+eSEafSDJ7pR+h+faSOoFSKkpqnQJ7GR06JK7wswydpDgkaDiloc6EDnOo0K9WxoMLLEX+RAky1eGEjessNnNlng3a4YAiNNHVfl7TNy4OK5qAmmiNWksk0dP+3nHQPUK272clnGVJkjd6oU05PpJws+lRkAWGfCpt1Uj8gfozxKHbDIOu5w9I2AVPYmGNGu58QlQdxMGisEQe97PeaO40Ga7MrFIM7x8Ah5HNmi1kw40zRVBBv7fZyR/+6e1JMovlHjQg6tm6c4eCTvzcORLJNr9T2v+8E/DVfimxNy1atTk0u+LaZ77Gw09wNgNozQSEp7bUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJqbSmkOUktXfVIy+49JeNAfyllj9CLtwQLYEdTGvjg=;
 b=a3s46+bS80T60WL2F6a96L3H/JqehrKk8P8IWJPJLKlPLhxJtsR95n+aRTnfYZ1szoXX+X/jU0V0JqweG73EUC8cirh8D5jXD3XF5L00/VGQSz9IgGgivWmSIwm+Y7DVD7CaaIKoiZTZRh/T8XsbPIKJ/RoteWwRjEpZdv9KCUs=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5530.jpnprd01.prod.outlook.com
 (2603:1096:404:803b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 11:01:35 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Thu, 4 Jan 2024
 11:01:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment
 in rzg2l_mipi_dsi_start_video()
Thread-Topic: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the
 comment in rzg2l_mipi_dsi_start_video()
Thread-Index: AQHZ4KanEtWnGVO/fU6nMuPRdmyQgbB9NW1QgAACZACATQF48A==
Date: Thu, 4 Jan 2024 11:01:32 +0000
Message-ID: <TYCPR01MB112692C32FDD5A0EB383AE9CA86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB1126962629C0E20D78BDE8C8386B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20231116110342.GB20846@pendragon.ideasonboard.com>
In-Reply-To: <20231116110342.GB20846@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5530:EE_
x-ms-office365-filtering-correlation-id: 03727349-2c59-4c50-8da4-08dc0d1482fb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pkZ9fm787OJe0+CRAqqsZjaDal5vC4tTy4Rt2aKYPazfqY9600qWfM07RwOEVbRjsxIvVTQB38rgeo3aX0sVkSGAs59owYAIOYq/JXcd8y0pOOB54yiD2O4oEjX/fIqMMUG1rN3z8EBaaqYKWkZENhzySZu7vZ3iObBu9ZuxnfsKw5WR/MQhGTrDBy56fPRFy1RXZxHBtpqEiLAxY7lib0Q3tBpxVBanvvpKPwbgRqRwPxkMkXYhnhMCXm/IUcEiKceiDxYRlTFdU8/JNAgvzv1RGv7oeglOSe7TCg0dtDtbzUXutqOenYM0LPuqEwOGqpaj+M4xmMAEcdg1zS0m39JzQeABuipg1FeWqf5ntVfBciJNWuyY/3YxGPnx/eoluz83ewhfJETLv+b5FdlgT8qo+O4GLQMGG329fv0Ip1poGa2n00sOY3O7sQGcxKEK5H18co/0yaMwgTCWAz6gruIh/NfU82LBzmXJXuoKCrTOWx1EkmMrNsT1rBgHiDqd1PP4Tp93nSkqYgvdB9npC/uyLF/DpPvpdDnI4vKtCPwuWPtSuQ2TUDOKDqIEsfpMo0DOnTTdHZcuvCDYKla6ZqoZ3X59KMNEPRZ4VU+NKo5b+Js9UoDK93+sP1gs5faH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(122000001)(38070700009)(55016003)(86362001)(4326008)(53546011)(9686003)(6506007)(6916009)(76116006)(66476007)(64756008)(66946007)(71200400001)(66446008)(66556008)(8676002)(478600001)(8936002)(52536014)(7696005)(316002)(54906003)(33656002)(83380400001)(41300700001)(15650500001)(7416002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rkg4ZlE3c3BNYUlqTUpnMWQrUWdLWElzT1BkR1RMbi93aHp4SkJYRUdDOHR5?=
 =?utf-8?B?YjRkU2VEcFkySGp3T2M3YVpaZVNISStleFprR1pTZWJsL0Q0WEdiRUk5ZGhI?=
 =?utf-8?B?REJyVDM2S0xPelFsb292R2djZVljOS82SzZUT1dRRDRIaGd5VmcyRUgxSjdz?=
 =?utf-8?B?TEkrczQyNGZYelNyR0EzNlNaUE85djkwQVN2YjVMRy9iWEpRN3FUYnQ2YU9M?=
 =?utf-8?B?NjFCSVBNZG11cHpTSElOcGtZMnBmcVFhL0kxOEVSMUlBaUdMcTJ3a1NNSnhn?=
 =?utf-8?B?Y1JVSEZYdFQzUVVvdm9hSzdRcW5DMkIwUDJrOWh4RnZQc2FtYTNBTU4rOEQ2?=
 =?utf-8?B?NmF3WWNDSzd1YjREMVp2V3dyWDN6T3ZnWDJoNVd3aUJJNE82ejhZcCtaM2p0?=
 =?utf-8?B?R0hKaExNejh3alNJdWtYK0xtUlhLWkd4M1ZWVGZOaC9BOTM3QTI0eUN0YkJs?=
 =?utf-8?B?MDliL05qNFJlSGN4ZnpWeGtxRGJQQmxyWGlqcDdKWmp0OEthT1RUbEtSbW5s?=
 =?utf-8?B?eExEYlJoWU8wd2llaEN6VFgvUEYyd2NPamZicms5Mis3cmxUVWVyTGNvdXBL?=
 =?utf-8?B?b2tZTkNOUDJVZzVKdllrYkxIbUpJZ3JpNEtVa2ZKTUJmK3JYbFo2eHpaOXVo?=
 =?utf-8?B?dk1pckZCeGMrYzRYdFRiNS9DY2RpdWFIR3hMVVNicnp5TzR0clV2bVJySVNE?=
 =?utf-8?B?WTZLUTRPeE5tN3dJNzRQbS8yalRET2M2SHZwMFZSbWRoS0swSDVDR1UzK1Ux?=
 =?utf-8?B?eGo4NE5Mb3ByblE4ZmVkQ09KREgvKzMwWU5mUnhjY3NkWkZXUGc4T0h0TUp6?=
 =?utf-8?B?QW1heEhDYkRqK2hoTjZZSE1zME9aelZXSENkdnQ0Q1hMZ0RrNTFtQVNxcWNH?=
 =?utf-8?B?dGxuaXArWXh4dDRUa1pJZnlEODY4T1hpdFVFVkZpbWdnM3pPRXRqUklGMitF?=
 =?utf-8?B?MmhjbklTdHYxVlk4MGVFei9JeFdSOWgrZjczRitsK0FTWmc5b2NMaTJlbUNT?=
 =?utf-8?B?NlJYeDRmV3F1YklDMXlrb2liWk5Cd2VsQ1FGOGRlL2duVHpORGJ2SG9aWmpT?=
 =?utf-8?B?T0V6L2VYQ000VjlZc0xNK2dQbzEzUFhTL3RhZDEwYVNtOW0yTzZ2MkROSzhy?=
 =?utf-8?B?WFdNNElKYkRaOU1TM1RGRGlsUTk3ZDZwRWpmYVpQSXFHcG00VUNxUTBkS1RI?=
 =?utf-8?B?ZnVJUmlSVUlvQ3diMitqa2JFdGhhTy9uWkZDV1lKdTZsbU1Rd0IxMERVUEFa?=
 =?utf-8?B?VW11TUlVREZSOGx5SU1udFVzT29hb1g0bzE1NXkvOWp0VUN1VlRPQ0UyT28x?=
 =?utf-8?B?a2dmKzRIZTFVZ1MyYVJtQmhZQUVReDNWT3k4bnNPV1VyRHlvTTRGVytRUGdF?=
 =?utf-8?B?MDVvYnZ5eFd3OURJc1M1Y3dnOHY4dndRdEZwamZxaTFQNXI0TDE4cjhpNmc5?=
 =?utf-8?B?TjJDcHJmalRVVUFVa08xaHJ5L1RMSlh1ekdVa3MxanpSQ3BSR1JPOG8wSnJ4?=
 =?utf-8?B?U1hCS2ZoV2lmVjhzVjJXR2JUemtsN2Q4aWNzWnJ0K2NzS1gzcEFBemhGaFM0?=
 =?utf-8?B?OG00aHhzbnJaTlFMcnEwNnprRmcxVHo4cHFjbXFkdGEweVA2REVpaHd0V1dw?=
 =?utf-8?B?emFvSW5DYmRLVWFpVU5CU29YS3ZRWlZmeTkzcEU1OVk1eW0vYVdEaHBOdW04?=
 =?utf-8?B?UUdyUDhyTUd5YXVIQ29VSVVMdkRGNjNZOUYzL3hqYzJ5cGltTjQrbGN1VUl3?=
 =?utf-8?B?MzhTZmJvN1BGVy9UbVk1UHplT1BNM3Ayako0RFlsUGtHeitQbVpUcStUMzRn?=
 =?utf-8?B?WmlIUUdZLzhqMlN1VndwSVFRSHBOVFY0cjJ4LzYwQXlEOFNmVFdESlBBWVhG?=
 =?utf-8?B?OURSc1M1MTh6eWwxSjZ4SFZPUWhGQlM1RE8xeERBTnkwRk8xNnNCYzZzQTRh?=
 =?utf-8?B?ODgvQzhFN2h5ay9LcnMwUVVYOXRsWUg2ZzE2Nml1R1crTEZyV1B1bXRiZWow?=
 =?utf-8?B?SkJpN1FtZyttRGtMUStKQ25FOHJJU01NMldZTnBlUUdhc09FWENsbUJXTHF2?=
 =?utf-8?B?aEZuT3htcWxCKzlwcEkrY24rWUUyc3IwdVdFV3gyalM1eUE1MVpiTWRYcXRB?=
 =?utf-8?Q?mNn4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03727349-2c59-4c50-8da4-08dc0d1482fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:01:32.7652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRK5bCr2adSkxB2gwpRIE7A/8xkzquxHms3Fw+GI0X/RlV22ye/6nC0/LTfLZnSzMF9I9M2WDeWNIJ2WldOI3467BAA0cKoeiwi5eOZ/dU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5530
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pavel Machek <pavel@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IHJlbmVzYXM6IHJjYXIt
ZHU6IHJ6ZzJsX21pcGlfZHNpOiBVcGRhdGUgdGhlDQo+IGNvbW1lbnQgaW4gcnpnMmxfbWlwaV9k
c2lfc3RhcnRfdmlkZW8oKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgTm92IDE2LCAy
MDIzIGF0IDEwOjU4OjU2QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4g
Pg0KPiA+IEdlbnRsZSBwaW5nLiBJdCBpcyByZXZpZXdlZCBieSBib3RoIExhdXJlbnQgYW5kIEdl
ZXJ0Lg0KPiA+DQo+ID4gQ2FuIGl0IGJlIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgaWYgZXZl
cnlvbmUgaXMgaGFwcHkgd2l0aCB0aGlzDQo+IHBhdGNoPw0KPiANCj4gWWVzLCBub3cgdGhhdCB2
Ni43LXJjMSBpcyBvdXQgSSdsbCBzZW5kIHB1bGwgcmVxdWVzdHMgc2hvcnRseS4NCg0KTG9va3Mg
bGlrZSB5b3UgbWlzc2VkIHRoaXMgcGF0Y2guDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiA+
IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IFNlbnQ6
IFdlZG5lc2RheSwgU2VwdGVtYmVyIDYsIDIwMjMgMTA6NDQgQU0NCj4gPiA+IFN1YmplY3Q6IFtQ
QVRDSF0gZHJtOiByZW5lc2FzOiByY2FyLWR1OiByemcybF9taXBpX2RzaTogVXBkYXRlIHRoZQ0K
PiA+ID4gY29tbWVudCBpbiByemcybF9taXBpX2RzaV9zdGFydF92aWRlbygpDQo+ID4gPg0KPiA+
ID4gQWRkIG1pc3Npbmcgc3BhY2UgaW4gdGhlIGNvbW1lbnQgaW4gcnpnMmxfbWlwaV9kc2lfc3Rh
cnRfdmlkZW8oKS4NCj4gPiA+DQo+ID4gPiBSZXBvcnRlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZl
bEBkZW54LmRlPg0KPiA+ID4gQ2xvc2VzOg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiBUaGlzIGlzc3Vl
IGlzIG5vdGljZWQgd2hpbGUgYmFja3BvcnRpbmcgdGhpcyBkcml2ZXIgdG8gNi4xLnktY2lwIFsx
XS4NCj4gPiA+DQo+ID4gPiBbMV0NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9y
ZW5lc2FzL3JjYXItZHUvcnpnMmxfbWlwaV9kc2kuYyB8IDIgKy0NCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yemcybF9taXBpX2RzaS5jDQo+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcnpnMmxfbWlwaV9kc2kuYw0K
PiA+ID4gaW5kZXggMTBmZWJlYTQ3M2NkLi45YjVjZmRkM2UxYzUgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcnpnMmxfbWlwaV9kc2kuYw0K
PiA+ID4gQEAgLTQ3OSw3ICs0NzksNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0
X3ZpZGVvKHN0cnVjdA0KPiA+ID4gcnpnMmxfbWlwaV9kc2kgKmRzaSkNCj4gPiA+ICAJdTMyIHN0
YXR1czsNCj4gPiA+ICAJaW50IHJldDsNCj4gPiA+DQo+ID4gPiAtCS8qIENvbmZpZ3VyYXRpb24g
Zm9yIEJsYW5raW5nIHNlcXVlbmNlIGFuZCBzdGFydCB2aWRlbyBpbnB1dCovDQo+ID4gPiArCS8q
IENvbmZpZ3VyYXRpb24gZm9yIEJsYW5raW5nIHNlcXVlbmNlIGFuZCBzdGFydCB2aWRlbyBpbnB1
dCAqLw0KPiA+ID4gIAl2aWNoMXNldDByID0gVklDSDFTRVQwUl9IRlBOT0xQIHwgVklDSDFTRVQw
Ul9IQlBOT0xQIHwNCj4gPiA+ICAJCSAgICAgVklDSDFTRVQwUl9IU0FOT0xQIHwgVklDSDFTRVQw
Ul9WU1RBUlQ7DQo+ID4gPiAgCXJ6ZzJsX21pcGlfZHNpX2xpbmtfd3JpdGUoZHNpLCBWSUNIMVNF
VDBSLCB2aWNoMXNldDByKTsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBp
bmNoYXJ0DQo=
