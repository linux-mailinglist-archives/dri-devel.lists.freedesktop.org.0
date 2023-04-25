Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB996EDFED
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 12:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2724E10E04C;
	Tue, 25 Apr 2023 10:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C7B10E04C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 10:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgpndEDL/drGNVzb781XwgjO8qe4P7GFivgG5Ttm8bQu8oNni7KA+/maAqEc4hYVY7mTh3/XUCYMDaVhXOkEk+1HFxFeBBIkQB3Dnhw7OAuBbneoaV2v165V+vXpTK6ppkUbL7aPiHzHC98DkJ5GuczMoOI3RbcxN6mUzuhR5Q4P2nNBgaRcNRVEFrSTNl32shOAHrUfk8tOfBdd4/dFR1223D3k45QmAlE93sjY+5aqZSFNWafrAsuC4NIqs22piXlG5QotPv6AfYD7FILksk4Ldggg2+VkvIwQdPOMVcXokHPf36VvTE1D3BseYnclpZVb8gqx/mkaIfpxYl1e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf5/Ic8lq8bNV7pAUX6j1Sn2t2iOUCRgiakjG99vBeM=;
 b=iSQhwXofGewsKE8nwusVnRmkyNgJQsmSF+Iv7KVq8rXkAgKFLcY0HWQrCOwNth04Kt81ynhvTRWNp4APAK1dzNdQvC+7ov2duvjKwkQLVyjh2VLENEMbVZNyAafHt1264sytQlxABnTdhr1cY3mCPVCr6HXf/BMdNXZwMzbNld64H33V43h8XOMSiG7NONSEEdhfX1+001vb9+sVFRQxsMTglwlRCuLv1K3Jv4cbRxLEGvy/lLZG26A3dlboDsRf5yNDQE/7pc6+J1uspKDt/QzpXwG8bSnXb9yCmbKbg5wj2ZvKI7MrhMgfAej4Ebpdek578Gctj8uuxfk03nA9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf5/Ic8lq8bNV7pAUX6j1Sn2t2iOUCRgiakjG99vBeM=;
 b=tlvgk4Olxumg9kLc2+WsTltT6mWt2WdJGAl0hu8cnrAzv7Wipg7g8ItFeAiwI54vBd+u0FOLnDMM2GdHU6vAGVAcgyiKuHZZLKlp38oJhHSCGXb0QQFirwzW12z6luuhlqp047sqW7qCmqRUVDtvdYoYhfovNlq56LFq1V9Eqi0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10778.jpnprd01.prod.outlook.com (2603:1096:400:296::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 10:02:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 10:02:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Topic: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Index: AQHZdsdZe4oiVYtqEk2K2Fi8d4vqWK87qQeAgAAP53CAAA0KAIAABfmg
Date: Tue, 25 Apr 2023 10:02:46 +0000
Message-ID: <OS0PR01MB5922E93A2A69674F88C7B90C86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
 <OS0PR01MB59226ED2001DF994396014AD86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVdMiVSpbnSjtLZwtAj0wutrXJPOTxDyzgN8a0OSA+5Rw@mail.gmail.com>
In-Reply-To: <CAMuHMdVdMiVSpbnSjtLZwtAj0wutrXJPOTxDyzgN8a0OSA+5Rw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10778:EE_
x-ms-office365-filtering-correlation-id: da66a49d-a43f-4452-da9d-08db4574380a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aZqsC6CWEfgYM1nh3jYR6O0r7rTNAoEOgy6mYUlVklhDUJVkVEyoJ9/nJL8rRJG5Eh4lVxt6JR/E3E+4eEx9n1cLIv36p6E0G4ik+aRTlzohxm5hyteSTOWvZNSjcngnZj6Zl8ZOl+bocrriNfLBX/P9YngZW0aH7uJEFEijW32kE/6plst+o+gJZHksbIn+608LbYLikufPszTPct0RzB2m2MyfN3vwXqaNE7oJYf1f1DPRWt1dmh+OKT/jfZeUd7r0tjTSlcqTov3lWbOdKHz9/vZXlYxnGt7e8ogjYU2z+RYJBw/Rp1l+Yuhkt0FWrU3qZ9wI3Vat36m5pOTmm/3iiZxpgLbO9mpQXH2P6NErGiyg9m4Bho0sG2ptumGdRIHmcUcR9rKtI52WWEFidk+9mSy0xVqam1RezxKYlDFNsiOnfXUDKVg+31HiHskOzHBB8M9Zr5WnMiAhCNvj+mANK3odEC1/l37Dxl/hLz6D4i5e1HOvr0uJSqLR7iimtDpGCImm0t0d9rklgllkHvkNUnwOzms6nfuTXyAE0AUHY/AmMdwgprwsxWfUp3GuNTN7N9TFi8AvRUWvnxOBCFRyUGXu1sdrgtncPPyCZveygmK7jTbjuDmxCak4ky8daZ3R8s8lDBsypJJN6m7x1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(76116006)(2906002)(66446008)(66476007)(66556008)(66946007)(64756008)(6916009)(316002)(4326008)(52536014)(5660300002)(8936002)(38070700005)(8676002)(41300700001)(33656002)(86362001)(55016003)(186003)(9686003)(26005)(122000001)(71200400001)(53546011)(38100700002)(478600001)(7696005)(66574015)(83380400001)(6506007)(54906003)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2J4SCtFdENBVThXSzB4VFFXbFdSU1JhRmxMZ3pDbVJaLzRDR1pHaVg2TWxF?=
 =?utf-8?B?KzBJdkxxQmt2RVEzSmhuT0ZlVTl5VHlidXh6cXJUekVoZndTS3RoOHNwc09S?=
 =?utf-8?B?RmsrREF5c2dRVEhiNTdXTGtNQ0pOZ0dKS3NJMWt2N2llRllSUk9PTjhtMGJk?=
 =?utf-8?B?VWVJK0hEQ3JWS1R0amhacTk5bUNSejRveDlBTUIxMDl2TTlSWUpnK0pXSXZk?=
 =?utf-8?B?V0JKOENMS0lxc2xXdGE0YktISStZRXRLL09lcVZ6MG1TUXV4L0FqVTR4VGd3?=
 =?utf-8?B?c2VlY0Y5N0c4TVBNb3JNTTFzWTJjYURqZDErLyt0em5EdzMvSVE0UThxMFlq?=
 =?utf-8?B?VjU5eVZ5Mm9IT3VqT29mS0NBdU1XVUZETDVPNDlYK1J2WlhDNncwQkJFR3B3?=
 =?utf-8?B?cHpnRXFkMVFMOHRTb29lVys1WmVmU2I2aXNsTGtnT2FEU3BtL1RFdWJvM1BO?=
 =?utf-8?B?ajhsTElXWm0yMkZDbCtacktVeW45MVpyM0U0V1Y0WTQ1cTJuNFlHRi9DRWxF?=
 =?utf-8?B?UHZQSWdwcWt2VmJLd3pZellRTUtacHhVQVJOZU1MK3ArY3MrM053SGM0SDZK?=
 =?utf-8?B?emZQa3BxN1VGZWxLcjQyMyt2L0xDNm9saWpHZDBNdUFyTHV2Y3dzMFVzcUIv?=
 =?utf-8?B?dllVQjkza0QyL2lCQlRmMGdIQmx2ZHFxbjlxZ1FIbmNGSmZjTVpMc3h2OXVW?=
 =?utf-8?B?SkxlSGFtODRXNFJCd0ozb1cwRU1sbzhuNjgwWjhZcStYaU9FbzJQVUxpWjM2?=
 =?utf-8?B?NjlCWHIzVVhSS0w3bzBIUEZGUlFMRlVpN1R4WHRkcml3Nzg4cUg5UFJTTGdP?=
 =?utf-8?B?UzFmNmdYQXFaNUZjU2l0eG9kSUMwNWMrNjV3VEI0d2lVYVhTdGM3OWxWelJO?=
 =?utf-8?B?bmVVQVdYWVN5N3JsZlVjRnVIME1PZmgyZnlGYlBmczZzeUlCRGRJMVU1NXdl?=
 =?utf-8?B?eHgrZHRsRVE1WGtZOG96MXNLK2VURDNpUTZxL2l4MnhSOWhteWxibmxvOWxE?=
 =?utf-8?B?eVIwaUVTUXpTZExkZ21zWmpEd3hQU2ZFRExzekt0WnJVbHF0eHg1UWFPSzhD?=
 =?utf-8?B?aUlTSlJmakdKVXNXQ2ZKMS9NSE9RUWRXTnZGYUFZV2RjaktqTzBEeWMwWmRJ?=
 =?utf-8?B?R1MzRXVSa2hIMDNZMU11K1lJQnR5K0lDUXROTnJvYzNXRzMrWXcvTkRCZStD?=
 =?utf-8?B?TStNRVBpUGliS3dhMzEvalFRRzJ6OFkzcWkwZ2U2bGxxak92enpmM3RVZDRJ?=
 =?utf-8?B?ZjdZU1ZqU3pzTGdxY1BERm5ISG81SldBYTRDUGlXVDZMZWFVMW1GdzV1K1V1?=
 =?utf-8?B?bjRNdFJjLzZNMW90aEhlOGxMN0NyOWNWZUdrSFZINVJkS2JHaXA2ak85all3?=
 =?utf-8?B?VmV4VlM0cFhhWUNiZW9JL0RlcUtpT3ltY29nbU1DY2sxa1hmNUFsbk9ieWxJ?=
 =?utf-8?B?Mk9BSjVjb1BiSjExVUtMU3FsN3lUOFFLWmh2MDlKUjFqRkRJR2xzc29ZTVAx?=
 =?utf-8?B?MXVlSysrck94L01HTG5xalh1YktaUHFUdmZkRU9Ud2NDV3gyT0JYYkd2azl0?=
 =?utf-8?B?Z0VRTmNKNlM1MkVKTlQxbkIzTk8xU3B0WEJmYmF5aFNkNWpzWWRJVm53T1pL?=
 =?utf-8?B?NFdPbGxmYjR3Y2craWgrb21uMlNZdWtYREp4NHprcDBMN2JYY01SWFAvVHgw?=
 =?utf-8?B?OGRHdnkrVkNCcTZoN3VRUThKbk5ENy9mY2R1YXpEeWlpM1NwUk1DUzNIclJq?=
 =?utf-8?B?WGppWXBlLzBPTXFwcVFLbnJZUmpwbzZXQ3VrM0NNVFpCYmErZ2NpbW44Tkx2?=
 =?utf-8?B?dWZkdXk4clMrYlNzbE05M000aGdJZXhUeHVKSkVuVkQzZ1VQQjJydXFEUnRO?=
 =?utf-8?B?R2JDZTdiN0FhSmh4SHhjeGx6RVQ1ZUJ4aklqYWFMWWxpSy9lbThVanNFQVBu?=
 =?utf-8?B?WW9IcHJBZW8zNGE0TE4wNmdmR0dVSmJzWUJDb2JIRFFHbmErYWJDd2h1V1Fi?=
 =?utf-8?B?UlBIUlJLL3ZIN1ZnZmFnVjdDNjluM094TG1pN09BaXpPSGxMaWxvd0tmN2Zi?=
 =?utf-8?B?UW1BMHM5YTRaaEoyQUdMdThRWEZ1WUZxNllJTFJtZGhFZ1dEdGhaeERGYUFH?=
 =?utf-8?Q?XPTM8kS7sBfPZO1ApbE5WbMhF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da66a49d-a43f-4452-da9d-08db4574380a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 10:02:46.1747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCd2Cw/rpkvKDnofdU8jMLXyL//JDIEDsQiaSVd+/CmSXOZEdh5KgtkQPpGKj9esgLg+0dXv3JM0VuAl1ty41geUAZwxwA2S/FwmpVRv9yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10778
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI1LCAyMDIzIDEwOjM5IEFNDQo+IFRvOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsNCj4g
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5j
b20+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFy
by5vcmc+OyBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNv
bT47IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBi
cC5yZW5lc2FzLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LXJl
bmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCA1
LzVdIE1BSU5UQUlORVJTOiBBZGQgbWFpbnRhaW5lciBmb3IgUlogRFUgZHJpdmVycw0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDEwOjU14oCvQU0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+IE9uIE1vbiwg
QXByIDI0LCAyMDIzIGF0IDY6MTDigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPiBBZGQgbXkgc2VsZiBhcyBtYWludGFpbmVyIGZvciBS
WiBEVSBkcml2ZXJzLg0KPiA+ID4gPiBXaGlsZSBhdCBpdCwgdXBkYXRlIHRoZSBlbnRyaWVzIGZv
ciByY2FyLWR1IGFuZCBzaG1vYmlsZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gPiA+DQo+ID4gPiA+IC0tLSBhL01BSU5UQUlORVJTDQo+ID4g
PiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gPiA+IEBAIC02OTQ4LDcgKzY5NDgsNyBAQCBGOiAg
ICAgICAgZHJpdmVycy9ncHUvaG9zdDF4Lw0KPiA+ID4gPiAgRjogICAgIGluY2x1ZGUvbGludXgv
aG9zdDF4LmgNCj4gPiA+ID4gIEY6ICAgICBpbmNsdWRlL3VhcGkvZHJtL3RlZ3JhX2RybS5oDQo+
ID4gPiA+DQo+ID4gPiA+IC1EUk0gRFJJVkVSUyBGT1IgUkVORVNBUw0KPiA+ID4gPiArRFJNIERS
SVZFUlMgRk9SIFJFTkVTQVMgUkNBUiBBTkQgU0hNT0JJTEUNCj4gPiA+ID4gIE06ICAgICBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+
ICBNOiAgICAgS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gPiA+ID4gIEw6ICAgICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4gPiA+IEBAIC02OTU5LDkgKzY5NTksMTggQEAgRjoNCj4gPiA+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGRzaS1jc2kyLXR4DQo+
ID4gPiAueWFtbA0KPiA+ID4gPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LQ0KPiA+ID4gaGRtaS55YW1sDQo+ID4gPiA+
ICBGOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
cmVuZXNhcyxsdmRzLnlhbWwNCj4gPiA+ID4gIEY6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnlhbWwNCj4gPiA+ID4gLUY6ICAgICBkcml2
ZXJzL2dwdS9kcm0vcmVuZXNhcy8NCj4gPiA+ID4gK0Y6ICAgICBkcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yY2FyLWR1Lw0KPiA+ID4gPiArRjogICAgIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3No
bW9iaWxlLw0KPiA+ID4gPiAgRjogICAgIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9zaG1v
Yl9kcm0uaA0KPiA+ID4gPg0KPiA+ID4gPiArRFJNIERSSVZFUlMgRk9SIFJFTkVTQVMgUloNCj4g
PiA+ID4gK006ICAgICBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiA+ICtMOiAgICAgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gPiArTDog
ICAgIGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gPiArUzogICAgIE1h
aW50YWluZWQNCj4gPiA+ID4gK0Y6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLQ0KPiBkdS55YW1sDQo+ID4gPiA+ICtGOiAgICAgZHJp
dmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvDQo+ID4gPiA+ICsNCj4gPiA+ID4gIERSTSBEUklW
RVJTIEZPUiBST0NLQ0hJUA0KPiA+ID4gPiAgTTogICAgIFNhbmR5IEh1YW5nIDxoamNAcm9jay1j
aGlwcy5jb20+DQo+ID4gPiA+ICBNOiAgICAgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5k
ZT4NCj4gPiA+DQo+ID4gPiBXaG8ncyBnb25uYSBtYWludGFpbiB0aGUgY29tbW9uIHBhcnRzIHVu
ZGVyIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzLz8NCj4gPg0KPiA+IEF0IHRoZSBtb21lbnQsIHRo
ZXJlIGlzIG5vIGNvbW1vbiBwYXJ0cy4gQnV0IGluIGZ1dHVyZSBpZiB3ZSBhZGQNCj4gPiBjb21t
b24gcGFydHMsIFdlIG5lZWQgdG8gdXBkYXRlIHRoZSBlbnRyaWVzIGhlcmUuIEl0IHdpbGwgYmUg
ZWl0aGVyDQo+ID4gdGhlIHBlcnNvbiB3aG8gaXMgZ29pbmcgdG8gYWRkIHRoZSBjb21tb24gcGFy
dCBvciBpdCB3aWxsIGJlIGENCj4gY29sbGFib3JhdGl2ZSBlZmZvcnQuDQo+IA0KPiBPaCB0aGVy
ZSBpczoNCj4gS2NvbmZpZw0KPiBNYWtlZmlsZQ0KDQpPSywgVGhlbiB3aWxsIGFkZCBiZWxvdyBl
bnRyaWVzIGluICJEUk0gRFJJVkVSUyBGT1IgUkVORVNBUyBSQ0FSIEFORCBTSE1PQklMRSINCmZv
ciB0aGUgY29tbW9uIHBhcnQuDQoNCkY6ICAgICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9LY29u
ZmlnDQpGOiAgICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvTWFrZWZpbGUNCg0KQ2hlZXJzLA0K
QmlqdQ0K
