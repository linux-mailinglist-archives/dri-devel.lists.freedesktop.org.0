Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686776E9811
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3251310EC83;
	Thu, 20 Apr 2023 15:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46C410EC83
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:10:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUmyUpBmgn2bZ8KBChbro3FwNweamExwfKVTvqEvjxQSwvWJe7WovVKz8FuPo5TA1fb5m095KB1BfAuh+yipxheXFJAfCnqKDlXse1R9btgfCF1YKPInAYvyGMGVmlFO3xJqSlTX5hVDpKwjrjSbgT/hSQzEhHh3s67GuGWzPWpY/0Y8U85yrQkLfs8se/g2mFRz+l2cdsKCHIiFCpk77/y75da5RstmTTfBD5cdleP/MHzCXSUevWmniij0LKEe6mjUZ2/8in5p4ETCjgDoQlbdhg4bLq5C93uXSJnQucBuSgPzJUdieS1lSzFZC1P30uexJRD2SINhivUymK5Q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvlM/Mxr8XJ9WvQIwbFngJBrIHMgAF5d/gh3keTSW+Q=;
 b=lte4mek9wn+WeptKwPIDPIGMtU3VrJ//ZsHtc74TtR0GkbBV0MVFggqWV+My5PPwbEl5S8jPzmBcy++PL3+wfB9PX8lZls1t0RW2oRTpLK2A52TRmoIRQO4KdqhUdvhEBg5k+Bn+FiH9Wpa7yk3B2W2kWirYoTyquhy0znyA2uYhd5Wj2U8w8ecxkw/F3YaS6xT1L/4PDtSLLCtatBqx2fYZHqj8CiJHubk0efDp1yOgugLAvHgBZksa7f/On7rUbZor5v+Xsb7/dICYFlfiOyY2VgVfdvWpcVHTXRvTiMlQViFOc32g8tW+mWJ/u7zhrYxWNZqFAOY1V2cOAxOcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvlM/Mxr8XJ9WvQIwbFngJBrIHMgAF5d/gh3keTSW+Q=;
 b=WzwxWs5lUiseb/5TmI35lINUp9651ko/zjQzfVrdis0BqPDzgj+rjTvAGkK2CMqlJvbq2qDaFx4WtvWjoOk2fSldnfvy79maXsOl5uhJamvIz5Bi8XeF0Fpi/90gWLltYjwN2SJmRg5KyXF1XF0ZBBjuO2pOJMOzDcaD1xuUv4U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11444.jpnprd01.prod.outlook.com (2603:1096:400:371::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 15:10:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 15:10:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v7 6/8] arm64: dts: renesas: r9a07g054: Add DU node
Thread-Topic: [PATCH v7 6/8] arm64: dts: renesas: r9a07g054: Add DU node
Thread-Index: AQHZbG5eqh8n10gLpUS2aUNU2h3daK80WhaAgAABO2A=
Date: Thu, 20 Apr 2023 15:10:00 +0000
Message-ID: <OS0PR01MB592241705ADD1BB78886CD4386639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdVuC9T35G=Dn2jCyBkJm4Eopgv9KQ-SpyVx+KiX1fe=NA@mail.gmail.com>
In-Reply-To: <CAMuHMdVuC9T35G=Dn2jCyBkJm4Eopgv9KQ-SpyVx+KiX1fe=NA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11444:EE_
x-ms-office365-filtering-correlation-id: 6ac44310-5af7-448c-6b93-08db41b14fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VVxCsUIEECh1lgfcbOieYJewHxdCxYckLUg1XxWqzZnTTrVIMl4KfwDniDN9sXmojyfIePz/1zj42pQgmSsS5ACqEyngTCSLjUhTHCHtq6CU/2uK+xUobkIVReMQuwljWfbtFxHtXudXmKim/cTUUbkTb5rSIxp72NZceKWtJzygtKCId8MIH538YgBp34P2+//Sn1f7G7SNumkIAgOKn39mWQilPq7+/+1d1/6cFh7M0N5yqdBFxtEQGen2tpZ1QvsYcvc6X/ws0IVnsm8RuHBzS3LJsodkfKxSeXQCjizcuWjnK9WUiKs0qLB+gOnU2USP6wDdDAhkJsTFdzHTTgZquEVkRVI05VoQVKgf3dpGqfogQCOinNbZxhHccnN0d/Dt0l/bTw8mOIdbp+3X2hcRQZihaz+CKitAxi4CPHteBuR++YQ/0PPbFxmKYooGXyt44NUfNsX0prb/EuDJFuboDEVEV+A5PT+Xt5Qo25QX564k/RgkiOlRcObIMOj0QRtJXD2LykNK19MOVSzi/GYyvB3zk+/tHN7JVT2wYRhb4XNrMnH0NhGn/JSrQUhg7s1btEGYzvSUego5S2pdW4KFFHPviOp1cvwpTOlYuM7eV5wko+MQ46YePC08CFbQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(186003)(6506007)(71200400001)(9686003)(53546011)(7696005)(52536014)(5660300002)(316002)(4326008)(41300700001)(66556008)(6916009)(66476007)(76116006)(66446008)(7416002)(66946007)(8936002)(8676002)(54906003)(478600001)(38070700005)(38100700002)(2906002)(64756008)(86362001)(33656002)(83380400001)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azFtTTc2UXBXMFJQU0IvdDhVVHVDZkI1YkgzbjUrVEh2c2FhUXlwRzFnNkQ0?=
 =?utf-8?B?bGg5RE1qZitpbWYraU9lM0xGYUVKbHl5MjBxdXg4ZUdXN2NDTFRmRFdTaUIx?=
 =?utf-8?B?dFNNRThLYkxVOG5VbStsc2o0K3lHaDF1ZVlUeUwwQWJLdlFZamRyYWl4TDhh?=
 =?utf-8?B?YXJhKzRCdS91UkJkWXhkamxpdEhlQkhCaEk1R0RRYm1OQ282QklCV05zTVVa?=
 =?utf-8?B?RU8yS3ljMnJRM05HNnFDUzViZXN6Qnp4Vm1JSUhORmVZUDlDY1M2VXpsVHh2?=
 =?utf-8?B?dXdyQ2xhRXpEQTRLMHY0MFlEMU1wRTdncWFUdTV0c3NTK0o0cUNrR09Hd1hj?=
 =?utf-8?B?SGtoQVM3djlPZDgxb1RtcVROTkhjUDQzNENLWXpWYjI4NjB6aW1qb3p4Nm03?=
 =?utf-8?B?eEJvS3lLMERLQXZ5YmRIUEk2eTArTnhCZyt0Vlk3TGIyR1Bid2JDajR4NVN5?=
 =?utf-8?B?OWVhbVQ2TmQzQ3Jvd3o4NXh1bEcrSVU3bzNuemJ5NzBCbzRCRUhjUFNHY1BL?=
 =?utf-8?B?MFY5dUI3cysyWXlvS0l3N3pydlpwQWtBcUFVNFJaZ1VXTzIzVnRRemt2aWtl?=
 =?utf-8?B?eEtrVXFiRnU4dTFsS3p2VVEwRFg0WFgwT3NKczZ3T1U1UHFsTFhLZnZGRklY?=
 =?utf-8?B?TWZuV3ljYmhrMk1kT0lIZ0pCQ1hPRWszNkJWK2xONkUwTjkrZkZuTzVxclA5?=
 =?utf-8?B?S3p4blFOZWQ3YWFkYXBzWDZiZ0xqZS9YNlJTYnJ4aHZMeVh1Smw4UjVZV3Zs?=
 =?utf-8?B?UXFrMGdPUE5UU1dubVNpem9jUWN2d28wZ1YzRFZNM2VUTWFzWk0rSERiT3dv?=
 =?utf-8?B?aWRWT05UKyt1dXIrMHYycWdsKzVuUkZRSEg2VDhrWmVlWTdMeUVwZ0U3MzRm?=
 =?utf-8?B?VTAvcjJrdlk2cDNFOHhsOXpQTGlaektmdVNGSlNVeFV5QVhnZXNmT1V6bjZv?=
 =?utf-8?B?WlhMdEZrUVh1aTF4R0lkYy9McG5JWTZWci9oaHFMa2JlK01tcmxuODloYUlZ?=
 =?utf-8?B?eWQxWUJaRzhqdnlObmp2TDc4NFVZR2hTVXI1Zy9sM1pkVkRrZmZraGFUQ291?=
 =?utf-8?B?MU5TeXE0MlNtN2MzdTllZEx1cjNmeXd3SkdxQjJFckNJUjg1dmZLOVN3UlBO?=
 =?utf-8?B?Z1dib2lSRGlUWVJMVnFJVDVMNXJOUVZud1RlUkcvTklGeGZSUHZ6ZDdPdDZi?=
 =?utf-8?B?aWJLVUpmZ01aWHgrS0dpQ1hZOEdYUVdCZG43WWZYam1CYlhVVTE1cnR6bU1V?=
 =?utf-8?B?dWdLNFN4cGhEYitXU1pXREl0cnE1dVFDM29Zd1ZDcVpkZVF5Tmx5eVp0b1BO?=
 =?utf-8?B?NWc1T0J3QThIT1ZlT3JEbm53NTNXejRKQklVS3BxYm9xbFhKUCs4K29EZDdr?=
 =?utf-8?B?OERxcXk3NGNyeFh0dFA3L3U2TEFPUVFUM0wzOWN1eUtDbVlSVXFsczhmUDYz?=
 =?utf-8?B?NjJVcFIvMW9RYm5oSnpNN0tvcmRPVE5TQnlWaG54bktSZ1RzTkw3eVRsUU9W?=
 =?utf-8?B?RERpKzIvVVRzUnNJbEUzZU1tbXlicERIZ3ZhT1pMOGRweXFLU2JaU2tXNEFR?=
 =?utf-8?B?UnQ3Q3d0WHJta1JoUi9FYlZURmFmTUJmQXZoWjZFTzZiaVEwSFROOStxNGY5?=
 =?utf-8?B?dUdaSnhIM0h6cGloMzZwU3VKUWp0cjdGVU11aFNBY0tpV3lxTE5RdGFmWGNp?=
 =?utf-8?B?MHdobnlCdUllTVJFMURVVUhmaklwSkkzNThESXVaTW5oVnJmNSt1dXpySFhk?=
 =?utf-8?B?NUpwZ1F2aHkvSHpnOTNaYWFYUVJPZWs4bCtHOStXWUFXanlSK1g1Qy9ZcTgx?=
 =?utf-8?B?Z0tGY2ZGMVh3bTE0RXNHanlRb0hmT1dRQ0c2MUZUdGs3NFk3ZkdRdUJXZEFr?=
 =?utf-8?B?N2FmamhvUkJUWHVmY3o5THJldFNCUGRQOU9oREQzb0ljbVhIbExOWGFCeFh2?=
 =?utf-8?B?MXNTNWRITFJRWkl0OVQvNmwwMFphcGEwVmpkdUUzMC9Ca0RaclZXWjRJbGhs?=
 =?utf-8?B?OTY4eEJDYnRRRTlaM0NqMExKelpNTGpINGtOU0U1UXFyV0FtRlZPTlp2NFhh?=
 =?utf-8?B?Yy9ZMUxuNVg2NThHaDNZc1l3WXhjd1l4SDFIY1dMeHVHMDFMYm90bnZDYSt6?=
 =?utf-8?Q?HLQA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac44310-5af7-448c-6b93-08db41b14fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 15:10:00.5504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ny7TplYC41C87oe0P4rqi8x4GPRGjPvrCaZslDqo+7++v4JuCujewVmcvWlu8xkzs7TEipi2tVLCGpaxHBBvI+IyY+O6pImwUUjiCb1ZFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11444
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjcgNi84XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNTQ6IEFkZCBEVSBub2Rl
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgMjoxMuKAr1BN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIERV
IG5vZGUgdG8gUlovVjJMIFNvQyBEVFNJLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY3Og0KPiA+ICAq
IE5ldyBwYXRjaC4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjlhMDdnMDU0LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDdnMDU0LmR0c2kNCj4gPiBAQCAtNjc3LDYgKzY3NywyMCBAQCBmY3B2ZDogZmNwQDEw
ODgwMDAwIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyBSOUEw
N0cwNTRfTENEQ19SRVNFVF9OPjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0KPiA+ICsg
ICAgICAgICAgICAgICBkdTogZGlzcGxheUAxMDg5MDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA1NC1kdSI7DQo+IA0KPiBJIHRo
aW5rIHlvdSBoYXZlIHRvIG1ha2UgeW91ciBtaW5kIHVwIGFib3V0IHVzaW5nIGEgZmFsbGJhY2sg
Y29tcGF0aWJsZQ0KPiB2YWx1ZSBvciBub3QuIEFzIHRoZSBWU1AgaGFzIG9uZSwgSSB0aGluayB0
aGUgRFUgc2hvdWxkIGhhdmUgb25lLCB0b28uDQoNCkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0K
PiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDEwODkwMDAwIDAgMHgx
MDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDE1MiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
bG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA1NF9MQ0RDX0NMS19BPiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIFI5QTA3RzA1NF9MQ0RDX0NM
S19QPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9E
IFI5QTA3RzA1NF9MQ0RDX0NMS19EPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9j
ay1uYW1lcyA9ICJhY2xrIiwgInBjbGsiLCAidmNsayI7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXNldHMgPSA8JmNwZyBSOUEwN0cwNTRfTENEQ19SRVNFVF9OPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZW5lc2FzLHZzcHMgPSA8JnZzcGQgMD47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAgfTsN
Cj4gPiArDQo+ID4gICAgICAgICAgICAgICAgIGNwZzogY2xvY2stY29udHJvbGxlckAxMTAxMDAw
MCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5
YTA3ZzA1NC1jcGciOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTEw
MTAwMDAgMCAweDEwMDAwPjsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4g
dGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cw0K
