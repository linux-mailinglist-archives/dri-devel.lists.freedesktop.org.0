Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B02780CB4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9787D10E51E;
	Fri, 18 Aug 2023 13:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A9C10E51E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLPhBOYyZHKoURIMthLnIG3WtBkpiQ6pE0UwNE+/89J6/E5GqnT7O0rfzzKYBsEQo+MqLl0/rC5tqrM6OsH5dzxWxNEw3BlMbbeGtJS1RlrSXMoJhqzfKrm80ohoIF8YNqRe9sav5+zulubMyy1kvq3HLFJEMsQYv9Ub7I23fZdnIsW7rbT1+QLa3CFwzNtjM1CK3VB+kkULC1cF/FZdF1OUWY9gOUg/9osX6BqyQCbpTZAjr8O7Umhl/gqaKmJTdPPxxJ38n0bE1tkY5T4v/x1dXhhp9xJfoezCV2HascuVfyMQoTIsk/aqG2KZfEt3eSipuDiz2HIW4IrSEfQMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnCVfWH4oczXJyGczqu41W1GpRfrdZi0adqt6PuXPII=;
 b=eVD19fmf9Isj9ysZBKo677g5EQ0yM9LznwtILybWK8uS1Fi3A6HQDmt8tsJuQKgzr7eUKMtigo//zyer3VrRhBedLz6LDUZf5elGwcGJ/zS1LKgLg5PM8QA+Rli66QUNcOtk9IQZEknVSnOnSviEFpnxW3O71tlk73JC300jwtuSjKQyG8jjjNe2dqEwn4Cpu5ziiPyyFLzpGscOoDM+l67xQAIVAa+WHpvjwqumEI41CgOrX4ZAUKOr9P3a28pTnbyKkLDG1PxCJIMunpnQjPABZAan1EXl4pRJnevepQyGTFnhHtevbJqMIttOc/0+gCLWAIwVpfhl16+Gy0pIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnCVfWH4oczXJyGczqu41W1GpRfrdZi0adqt6PuXPII=;
 b=U0i+4Kne41rT5Ccwm0DsnNR2LRkWoospmg65CcWepfxhE38zLDFLjehqia7AnXevAfHjPkVeTX6o6pYWvAtIYmumRBRj+OJP86YS68ziqlDCHFVGgVeVFTjDpuP6IoLRrRzSDzYLUSNnoNJepjMsQUC+nTBNjKJgsLYRg5qpYvo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY1PR01MB10784.jpnprd01.prod.outlook.com (2603:1096:400:322::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 13:44:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 13:44:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Adam Ford <aford173@gmail.com>
Subject: RE: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Thread-Topic: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
Thread-Index: AQHZzhDVVl0EoPvANkCIEcdmuUZDTa/wBo+AgAAONtCAAAFUAIAAAcEg
Date: Fri, 18 Aug 2023 13:44:14 +0000
Message-ID: <OS0PR01MB592252094B8C92A8ED4E19CE861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
 <CAHCN7xKo4Gnt+3rBgNyHq5tAAWU+nUpfJjzgb4RSPrgOgRsuyw@mail.gmail.com>
 <OS0PR01MB59226206B73CB28275EB9C3A861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHCN7xJZOSaGGQG56qmivYFAEzJayaOVF8qkhsZt5Jt_APN_nA@mail.gmail.com>
In-Reply-To: <CAHCN7xJZOSaGGQG56qmivYFAEzJayaOVF8qkhsZt5Jt_APN_nA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY1PR01MB10784:EE_
x-ms-office365-filtering-correlation-id: dff4e4a9-749b-4e50-b96b-08db9ff1362c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rj1xFji7pgMqIsrfu77opHGsiwcCL6nhSCsRuE93sjyIxSfsx05BmGQgvp71ctFRCHBRPJI7EM2J8ih6VxVPhqZ5dbP4Azpy4DYsD3y2g3DG8p/ttoc1fjnxBbfZGHW1GdBqojQPHkio/CMyKDTi8cmSI4UDcI72V7q9FWwCyTOIS+a0hph94s8pzelUImLOca/9vyAdpk6J3ZJl7CukzrIDXi/jeSMN7u0A9RklykGhl6CUG94YLYOJVfN1mYzbuFffrtGTE7s4xzu4roZoerpNyEULqTjTz4et6VLBzGZIGXCjKg95kP/P6J8HUU7F3CPWZHDH08QwsUXsddNukrrLln+vSsr9T1L3xyv/ybTlHiHW8tnoIZmSOkn6cm37MvWPTXwfa3TynLCc9SKgoJCLWD9n4Nb3hmQveDLGzPyZLYs5bADniX4bJuKtKpXaxvc0ufQLCK93aetT5R5hWUo08UPbSNtJC6rFrOCeYGiRS70WlIK/aqbwkv/Kx2H/oeFaoc9nfzXVs2AigyMXO8NSgQB+b1yznzapv4RdhjO1D6cYDPb2TL5sDMNFcM5zDAchkW/9RiSX9j2ebc34vm0U0HNUHEEiGV/pdMCN8QSKNCc2UWnEhENbKJ/dgW8+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199024)(1800799009)(186009)(26005)(71200400001)(7696005)(9686003)(53546011)(6506007)(83380400001)(4326008)(5660300002)(8936002)(52536014)(8676002)(2906002)(7416002)(478600001)(41300700001)(76116006)(54906003)(64756008)(316002)(66446008)(66476007)(66556008)(66946007)(6916009)(38070700005)(38100700002)(122000001)(55016003)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3lIWlQxZmNGVFdXd292cnJNekVKUHhmdnYzMms1WHhWTGtlS1lhV3FrbFl6?=
 =?utf-8?B?RCtTOGVpVVFSUGhIcnhIK0NWczNvcTQ1UGl5UXo3UENvVGlralVtb3JRVzh3?=
 =?utf-8?B?OU1hYjZiSlozQ2VUNHRmV21ESU9UN2svSHAxWlhIbitxQ3FZMStIcWJqTEtG?=
 =?utf-8?B?Z0F5aUpnb1pOSFZsTkZjQVU5OU5rTU5rSllvb3RYNW1QSjVnMnFyMHhMTHlJ?=
 =?utf-8?B?S3NUT0NDU0t3cGdaSUZFUG5ZOHJQeE9CZ09nOXgrSjFNQ3YvOUxJcE1QRzVw?=
 =?utf-8?B?M0NoU2FXTW5yeTJsRG1WNEdHbExHLzBGY2QzVFVZMEhzSVlKYzFBdmdiUVN6?=
 =?utf-8?B?aWJLQnVqMzUrc09mOFlHb1EwV3ZETWpNNWNaWFdxWmx1UG5YK3A0SWlPUXFK?=
 =?utf-8?B?SjMwRFpuOWxzSExkRllROGFtS1Boak1FUW5tN25hVzYvM3F0ektJZkNEU0Fo?=
 =?utf-8?B?RVUvYmhkc0lFZDArOWwzTGRYK1Z2QUxXR0Y3d3hSMWNialMrUnZHUWFNN09I?=
 =?utf-8?B?VVc3c0Z4VlR2a3hldXZYbDFxamU4czRaUUFwcnR3NTRheFRoVjVSU29xZ1ZU?=
 =?utf-8?B?eFhVazA2dkVmQ0FYeHpTUnlsZG5KQzhRbUlrSzNPRTAzQjlJSDVGU2d4Titk?=
 =?utf-8?B?cHpuNWdFR2tENWZNaTZSd3VMRWlldG4vUU4wOFh0TGNkY0FCUVBZaU5pYUNV?=
 =?utf-8?B?VjF5R2E2OEhPRGludm9qUzV3WWhUSUtZWGlHUWZIRVN0MTFBY01GekgwU1BU?=
 =?utf-8?B?SUNtbXp6MFphNWNyQ2FxRlVtT0pGVVlmRlQ3WlVPNUpPQVBFUUx0bllEWUVZ?=
 =?utf-8?B?TzBVTEZhOFFKSXc5a3A2cHJXQngzZ1h0WmxPUVF1R1pNMloyNFJqMU12Z2g0?=
 =?utf-8?B?VnloSEFxa0pzTG52emVYNVFzdm10alp2RHhBc1NZU3BrRnIvUkJzTFdFSUd4?=
 =?utf-8?B?dWlYdHNtNGN3ZDZuQXljdmtHQUJrd3h1Z2FrWDh6YzlUN2Z2d0RVR1RjSHBF?=
 =?utf-8?B?WXdKWWt0dUpVRlA5RE9Jc0JPa0VMMVhEUERXUS9MTHVZYm1TWFp4YUhqSHlR?=
 =?utf-8?B?eWdxVGxtZ2hBV0Z3bGNjcUJZWUhzSnRXUHp2RFRDd1V0RWFtZXZKSTZXQXBW?=
 =?utf-8?B?TWFSQktZM05zMTlKMTB1RlgvNU1zWWJWOTdoZEhwTS9DWS96Q0ZpcGhjbEhZ?=
 =?utf-8?B?TnQ4cDBXZ1dlLytlaTQwREJmVy9vTmU4Unc4RVp2NjJlRElmMDRmU0hxdTlz?=
 =?utf-8?B?UGY0MG9va3ZsVkkzcENPeDhYQ3Y4QWJMMHd3Ty9ESGNTUUhKQ2ZUMExKMU10?=
 =?utf-8?B?NElEdUFyUE5IcVRUNjMzR2Vna2lCS0ZTWVJqVHc0SXNBMUxiN1EvclRSbVI1?=
 =?utf-8?B?WGRDL0Fabmt4TGV1bHFINE03RmJCczRxN1ZqZ1hMU0g0ZjloenVtTEhzRDFs?=
 =?utf-8?B?T3JIRk1uVUg5S0JadlRVc0t2M0lxNjNPWHFjTjdnbkpLanBpbjJIaUN6Y0NU?=
 =?utf-8?B?TTdrc0Zwa1YyUmJsWlF4cnNjeU5sbHhDTFQ5Mkg4TE95WEZjMnoxUGZlcU1T?=
 =?utf-8?B?emZ6K3dkQTdXUmI3SnZYWkFQazFOSmN0TkJGbGh2WXlHQWlJK3FZTlhKcjl5?=
 =?utf-8?B?eTVYL2dudVFRRVJ6ZVVYV3gvaTBHc2pOQlhmVEQ4aHZxODdWVEc5YThFZDlJ?=
 =?utf-8?B?bUxDR2ZQNE1IWCtrRlN6T0VScU13Rk9TZ3ptcjhqNVJ2TXB2R0pBcXQrTnJv?=
 =?utf-8?B?MndFeFh5T2V2VDhScmJ2TUVMbXZnalBFQWVqRkdGdVlLeGtMMnFWMU5qSGI0?=
 =?utf-8?B?OWtLSVR0OXhOU0RDMTJndlVidnNqb2pkd1ByVHZ2QXpxK2dxQnVQUUc0bVN2?=
 =?utf-8?B?Z0wrcFpCMG52bEE4TlkwZEw0OE5TbThKcG4rRkVTaU5JT0hITnVEK1BsdWQ2?=
 =?utf-8?B?RTM4YU5WbVRlcnpVY0QyQy9ia1RLVlJWVE1OcjFVRmdON2g1LzdaSjFhcXFE?=
 =?utf-8?B?UVpZRUxUblhFazIyemluVjRmRHZmSGRkamtzcnY3ZTh3TDhrZjNBL1dxYjMx?=
 =?utf-8?B?RlZMeUhjWjRxeFdIWVlhQThFQTNCUkRxL1R4RlFCTTZBeVZQMzgvTitpa2Qv?=
 =?utf-8?Q?unyJG44n/amK1LDlqYgLQ76k1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff4e4a9-749b-4e50-b96b-08db9ff1362c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 13:44:14.7622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/UpCkHqIS5dRjRs3m4h2dieDzvtkfy/SvYkYcAWBRu+6zzxpegWdwvP/It1mXyY9qFdaSFIvtvsGeLC/rjLRY0p3NwkglIPHZkN2wCiqaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10784
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDcvN10gZHJtOiBhZHY3NTExOiBBZGQg
aHBkX292ZXJyaWRlX2VuYWJsZSBmZWF0dXJlIGJpdA0KPiB0byBzdHJ1Y3QgYWR2NzUxMV9jaGlw
X2luZm8NCj4gDQo+IE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDg6MzXigK9BTSBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWRhbSBG
b3JkLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4NCj4gPiA+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggNy83XSBkcm06IGFkdjc1MTE6IEFkZCBocGRfb3ZlcnJpZGVfZW5hYmxl
DQo+ID4gPiBmZWF0dXJlIGJpdCB0byBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gPiA+DQo+
ID4gPiBPbiBTdW4sIEF1ZyAxMywgMjAyMyBhdCAxOjA24oCvUE0gQmlqdSBEYXMNCj4gPiA+IDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4g
PiBBcyBwZXIgc3BlYywgaXQgaXMgYWxsb3dlZCB0byBwdWxzZSB0aGUgSFBEIHNpZ25hbCB0byBp
bmRpY2F0ZQ0KPiA+ID4gPiB0aGF0IHRoZSBFRElEIGluZm9ybWF0aW9uIGhhcyBjaGFuZ2VkLiBT
b21lIG1vbml0b3JzIGRvIHRoaXMgd2hlbg0KPiA+ID4gPiB0aGV5IHdha2UgdXAgZnJvbSBzdGFu
ZGJ5IG9yIGFyZSBlbmFibGVkLiBXaGVuIHRoZSBIUEQgZ29lcyBsb3cNCj4gPiA+ID4gdGhlIGFk
djc1MTEgaXMgcmVzZXQgYW5kIHRoZSBvdXRwdXRzIGFyZSBkaXNhYmxlZCB3aGljaCBtaWdodA0K
PiA+ID4gPiBjYXVzZSB0aGUgbW9uaXRvciB0byBnbyB0byBzdGFuZGJ5IGFnYWluLiBUbyBhdm9p
ZCB0aGlzIHdlIGlnbm9yZQ0KPiA+ID4gPiB0aGUgSFBEIHBpbiBmb3IgdGhlIGZpcnN0IGZldyBz
ZWNvbmRzIGFmdGVyIGVuYWJsaW5nIHRoZSBvdXRwdXQuDQo+ID4gPiA+IE9uIHRoZSBvdGhlciBo
YW5kLA0KPiA+ID4gPiBhZHY3NTM1IHJlcXVpcmUgdG8gZW5hYmxlIEhQRCBPdmVycmlkZSBiaXQg
Zm9yIHByb3BlciBIUEQuDQo+ID4gPiA+DQo+ID4gPiA+IEFkZCBocGRfb3ZlcnJpZGVfZW5hYmxl
IGZlYXR1cmUgYml0IHRvIHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyB0bw0KPiA+ID4gPiBoYW5k
bGUgdGhpcyBzY2VuYXJpby4NCj4gPiA+ID4NCj4gPiA+ID4gV2hpbGUgYXQgaXQsIGRyb3AgdGhl
IGVudW0gYWR2NzUxMV90eXBlIGFzIGl0IGlzIHVudXNlZC4NCj4gPiA+DQo+ID4gPiBJdCBzZWVt
cyBsaWtlIGRyb3BwaW5nIGFkdjc1MTFfdHlwZSBpcyB1bnJlbGF0ZWQgdG8gdGhlIHJlc3Qgb2Yg
dGhlDQo+ID4gPiBwYXRjaCwgYW5kIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHNwbGl0IGZyb20gdGhp
cyBpbnRvIGl0cyBvd24gcGF0Y2gNCj4gPg0KPiA+IFdpdGggdGhpcyBwYXRjaCwgdGhlcmUgaXMg
bm8gdXNlciBmb3IgYWR2NzUxMV90eXBlIHRoYXQgaXMgdGhlIHJlYXNvbg0KPiA+IGl0IGlzIGFk
ZGVkIGhlcmUuIEkgdGhvdWdodCB0aGF0IGlzIHRoZSBjb21tb24gcHJhY3RpY2UuDQo+ID4NCj4g
SSB3YXNuJ3Qgc3VyZS4NCj4gDQo+ID4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgdGhhdCBpcyBub3Qg
dGhlIGNhc2UuDQo+IA0KPiBJJ2xsIGRlZmVyIHRvIHRoZSBtYWludGFpbmVycy4gIEluIGdlbmVy
YWwgSSBsaWtlIHRoZSBzZXJpZXMgYmVjYXVzZSBpdA0KPiByZWR1Y2VzIHRoZSBudW1iZXIgb2Yg
Y29tcGFyZSBldmFsdWF0aW9ucy4gIEknbGwgdHJ5IHRvIHJ1biBzb21lIHRlc3RzIG9uIGENCj4g
Ym9hcmQgdGhhdCBJIGhhdmUgd2l0aCBhIGFkdjc1MzUgdGhpcyB3ZWVrZW5kLg0KDQpUaGFuayB5
b3UsDQpCaWp1DQoNCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+ID4NCj4gPiA+DQo+ID4g
PiBhZGFtDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oICAgICB8ICA4ICstLS0tLS0tDQo+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDEyICsrKysrLS0t
LS0tLQ0KPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExLmgNCj4gPiA+ID4gaW5kZXggNjI3NTMxZjQ4Zjg0Li5jNTIzYWM0Yzli
YzggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExLmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTEuaA0KPiA+ID4gPiBAQCAtMzI1LDIyICszMjUsMTYgQEAgc3RydWN0IGFkdjc1MTFfdmlk
ZW9fY29uZmlnIHsNCj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lIGF2
aV9pbmZvZnJhbWU7ICB9Ow0KPiA+ID4gPg0KPiA+ID4gPiAtZW51bSBhZHY3NTExX3R5cGUgew0K
PiA+ID4gPiAtICAgICAgIEFEVjc1MTEsDQo+ID4gPiA+IC0gICAgICAgQURWNzUzMywNCj4gPiA+
ID4gLSAgICAgICBBRFY3NTM1LA0KPiA+ID4gPiAtfTsNCj4gPiA+ID4gLQ0KPiA+ID4gPiAgI2Rl
ZmluZSBBRFY3NTExX01BWF9BRERSUyAzDQo+ID4gPiA+DQo+ID4gPiA+ICBzdHJ1Y3QgYWR2NzUx
MV9jaGlwX2luZm8gew0KPiA+ID4gPiAtICAgICAgIGVudW0gYWR2NzUxMV90eXBlIHR5cGU7DQo+
ID4gPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBtYXhfbW9kZV9jbG9jazsNCj4gPiA+ID4gICAg
ICAgICB1bnNpZ25lZCBsb25nIG1heF9sYW5lX2ZyZXE7DQo+ID4gPiA+ICAgICAgICAgY29uc3Qg
Y2hhciAqIGNvbnN0ICpzdXBwbHlfbmFtZXM7DQo+ID4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50
IG51bV9zdXBwbGllczsNCj4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBoYXNfZHNpOjE7DQo+ID4g
PiA+ICAgICAgICAgdW5zaWduZWQgbGlua19jb25maWc6MTsNCj4gPiA+ID4gKyAgICAgICB1bnNp
Z25lZCBocGRfb3ZlcnJpZGVfZW5hYmxlOjE7DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0KPiA+ID4g
PiAgc3RydWN0IGFkdjc1MTEgew0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+ID4gPiBpbmRleCA2OTc0YzI2N2IxZDUu
LjdiMDZhMGEyMTY4NSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+ID4gQEAgLTM1NCw3ICszNTQsNyBAQCBz
dGF0aWMgdm9pZCBfX2Fkdjc1MTFfcG93ZXJfb24oc3RydWN0IGFkdjc1MTENCj4gPiA+ICphZHY3
NTExKQ0KPiA+ID4gPiAgICAgICAgICAqIGZpcnN0IGZldyBzZWNvbmRzIGFmdGVyIGVuYWJsaW5n
IHRoZSBvdXRwdXQuIE9uIHRoZSBvdGhlcg0KPiBoYW5kDQo+ID4gPiA+ICAgICAgICAgICogYWR2
NzUzNSByZXF1aXJlIHRvIGVuYWJsZSBIUEQgT3ZlcnJpZGUgYml0IGZvciBwcm9wZXIgSFBELg0K
PiA+ID4gPiAgICAgICAgICAqLw0KPiA+ID4gPiAtICAgICAgIGlmIChhZHY3NTExLT5pbmZvLT50
eXBlID09IEFEVjc1MzUpDQo+ID4gPiA+ICsgICAgICAgaWYgKGFkdjc1MTEtPmluZm8tPmhwZF9v
dmVycmlkZV9lbmFibGUpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2Jp
dHMoYWR2NzUxMS0+cmVnbWFwLA0KPiBBRFY3NTExX1JFR19QT1dFUjIsDQo+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQURWNzUzNV9SRUdfUE9XRVIyX0hQRF9PVkVS
UklERSwNCj4gPiA+ID4NCj4gPiA+ID4gQURWNzUzNV9SRUdfUE9XRVIyX0hQRF9PVkVSUklERSk7
IEBAIC0zODEsNyArMzgxLDcgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gYWR2NzUxMV9wb3dlcl9v
bihzdHJ1Y3QgYWR2NzUxMQ0KPiA+ID4gPiAqYWR2NzUxMSkgIHN0YXRpYyB2b2lkIF9fYWR2NzUx
MV9wb3dlcl9vZmYoc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEpDQo+IHsNCj4gPiA+ID4gICAgICAg
ICAvKiBUT0RPOiBzZXR1cCBhZGRpdGlvbmFsIHBvd2VyIGRvd24gbW9kZXMgKi8NCj4gPiA+ID4g
LSAgICAgICBpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTM1KQ0KPiA+ID4gPiArICAg
ICAgIGlmIChhZHY3NTExLT5pbmZvLT5ocGRfb3ZlcnJpZGVfZW5hYmxlKQ0KPiA+ID4gPiAgICAg
ICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwNCj4gQURWNzUx
MV9SRUdfUE9XRVIyLA0KPiA+ID4gPg0KPiA+ID4gPiBBRFY3NTM1X1JFR19QT1dFUjJfSFBEX09W
RVJSSURFLCAwKTsNCj4gPiA+ID4NCj4gPiA+ID4gQEAgLTY4Miw3ICs2ODIsNyBAQCBhZHY3NTEx
X2RldGVjdChzdHJ1Y3QgYWR2NzUxMSAqYWR2NzUxMSwgc3RydWN0DQo+ID4gPiBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9
IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOw0KPiA+ID4gPiAgICAgICAgIH0gZWxzZSB7
DQo+ID4gPiA+ICAgICAgICAgICAgICAgICAvKiBSZW5hYmxlIEhQRCBzZW5zaW5nICovDQo+ID4g
PiA+IC0gICAgICAgICAgICAgICBpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTM1KQ0K
PiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKGFkdjc1MTEtPmluZm8tPmhwZF9vdmVycmlkZV9l
bmFibGUpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0
cyhhZHY3NTExLT5yZWdtYXAsDQo+ID4gPiBBRFY3NTExX1JFR19QT1dFUjIsDQo+ID4gPiA+DQo+
ID4gPiBBRFY3NTM1X1JFR19QT1dFUjJfSFBEX09WRVJSSURFLA0KPiA+ID4gPg0KPiA+ID4gPiBB
RFY3NTM1X1JFR19QT1dFUjJfSFBEX09WRVJSSURFKTsgQEAgLTEzNjAsMTQgKzEzNjAsMTIgQEAg
c3RhdGljDQo+ID4gPiA+IHZvaWQgYWR2NzUxMV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmky
YykgIH0NCj4gPiA+ID4NCj4gPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWR2NzUxMV9jaGlw
X2luZm8gYWR2NzUxMV9jaGlwX2luZm8gPSB7DQo+ID4gPiA+IC0gICAgICAgLnR5cGUgPSBBRFY3
NTExLA0KPiA+ID4gPiAgICAgICAgIC5zdXBwbHlfbmFtZXMgPSBhZHY3NTExX3N1cHBseV9uYW1l
cywNCj4gPiA+ID4gICAgICAgICAubnVtX3N1cHBsaWVzID0gQVJSQVlfU0laRShhZHY3NTExX3N1
cHBseV9uYW1lcyksDQo+ID4gPiA+ICAgICAgICAgLmxpbmtfY29uZmlnID0gMQ0KPiA+ID4gPiAg
fTsNCj4gPiA+ID4NCj4gPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2lu
Zm8gYWR2NzUzM19jaGlwX2luZm8gPSB7DQo+ID4gPiA+IC0gICAgICAgLnR5cGUgPSBBRFY3NTMz
LA0KPiA+ID4gPiAgICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDgwMDAwLA0KPiA+ID4gPiAgICAg
ICAgIC5tYXhfbGFuZV9mcmVxID0gODAwMDAwLA0KPiA+ID4gPiAgICAgICAgIC5zdXBwbHlfbmFt
ZXMgPSBhZHY3NTMzX3N1cHBseV9uYW1lcywgQEAgLTEzNzYsMTIgKzEzNzQsMTINCj4gPiA+ID4g
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBhZHY3NTMzX2NoaXBfaW5m
byA9IHsgIH07DQo+ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFf
Y2hpcF9pbmZvIGFkdjc1MzVfY2hpcF9pbmZvID0gew0KPiA+ID4gPiAtICAgICAgIC50eXBlID0g
QURWNzUzNSwNCj4gPiA+ID4gICAgICAgICAubWF4X21vZGVfY2xvY2sgPSAxNDg1MDAsDQo+ID4g
PiA+ICAgICAgICAgLm1heF9sYW5lX2ZyZXEgPSA4OTEwMDAsDQo+ID4gPiA+ICAgICAgICAgLnN1
cHBseV9uYW1lcyA9IGFkdjc1MzNfc3VwcGx5X25hbWVzLA0KPiA+ID4gPiAgICAgICAgIC5udW1f
c3VwcGxpZXMgPSBBUlJBWV9TSVpFKGFkdjc1MzNfc3VwcGx5X25hbWVzKSwNCj4gPiA+ID4gLSAg
ICAgICAuaGFzX2RzaSA9IDENCj4gPiA+ID4gKyAgICAgICAuaGFzX2RzaSA9IDEsDQo+ID4gPiA+
ICsgICAgICAgLmhwZF9vdmVycmlkZV9lbmFibGUgPSAxDQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0K
PiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGFkdjc1MTFfaTJjX2lk
c1tdID0gew0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjI1LjENCj4gPiA+ID4NCg==
