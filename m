Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E237720431
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 16:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582F410E0CB;
	Fri,  2 Jun 2023 14:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A5F10E0CB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 14:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUL3sj6mAQNsS1UFt5I0Lb8ksK01hkOsUHY9Rl+3nlUeDE3b2yJ6zt03e3IPJG56y+dVPORY4POH7fJjb3f9fvkM4SO/+4OqyUnJ909zZPyJ6IYab9h1IgYXvz6VkMiBEyG6nrTgD+h+bgCmbBeaI24qklRy5N8OVz8npTy0jYeue7V+fTpCyUcLR7RGZr4I/wR5THXjt89v5NYaT4XBP3j1P8mmqFkml3+ZgbFSWCQCwNVWArWKtiIAUf/1HaXekuv39px+eUOo/LwAT9iQNLjQZeLmCbch5pVYEV1j9j/2wAG7PVtX4yNAuXqo9W18R6NsQkO9ZbRCy2gv7JowPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7v6huGb/pYD3lzqcjVnnDl9qjiWm9byj3UFc+emSc6Q=;
 b=elu7vcGCXmW62i5CUm36JKtg72X41hZz9Ed3WxVcYLRqlpCPSjNbaM53xxW1g1GwBrK7SIKKu2+MbecMHPx2skf7wmUvbF+7GMw1Cf3Q69Fd+IWiz7IRvPrEDk+7jJw1iyA978OvvvcYBqScg3RDKB9MfVbs50ISPd4FSdYL+iNdEm7BhmQQJXzckSK0CFtPPs3TsPhs6Pem0DQd936x97tLnJamS0Z+y4Dp5AG+Sk7YB9EKkfccsqGRl/bHPqnQIOh3S/Ui2n/Yl38X2i9bqUwkwhJ05w1gXG0Z8p0J9G/qGz9JF1wc1PqK0hk+noD/1yuSu6SfxCFU1QOXuoAveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v6huGb/pYD3lzqcjVnnDl9qjiWm9byj3UFc+emSc6Q=;
 b=rTZzmmAFy32t7VXyv4STFyCUpgVhzAeGLExFdGi37TrArIjduwrWITOYBqIZ0cRfPOjd1jMCpCghLaue+Xqtos2gnZclXBG/mus23U1eNFOpTMya/0NZ21XmWQQQKuycbT9kYGms3qMm/aED9nGmAPfYUvK9JB9nSpHfdR2Ebk8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5757.jpnprd01.prod.outlook.com (2603:1096:400:46::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 14:20:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 14:20:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
 support
Thread-Topic: [PATCH v9 RESEND 0/5] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit
 support
Thread-Index: AQHZfN4p/b5orSrwk0ai5QpLpQqzGK9bCteAgBAjuzCABkdFgIAAARaggAAYaACABHqVQIABg1YAgAAzrsA=
Date: Fri, 2 Jun 2023 14:20:52 +0000
Message-ID: <OS0PR01MB59228371ED494C3F2968E633864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB59220E8306506F3E0B17968A86789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922CC640A93CF85033FB47086469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230529141349.GA15264@pendragon.ideasonboard.com>
 <OS0PR01MB5922B66349F301074C51018F864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230529154504.GC15264@pendragon.ideasonboard.com>
 <OS0PR01MB59222EFBB7C6549620192AAF86499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230602111510.GE26944@pendragon.ideasonboard.com>
In-Reply-To: <20230602111510.GE26944@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5757:EE_
x-ms-office365-filtering-correlation-id: 949f2a64-187f-418c-4e5b-08db63749227
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SEAFxsa7U6PPOY3fAMOrKVQmjvWRxTl2N3gnj/TfcBUorjhpJihxIAmWiBPHrjs1YukZsVG2KuYpeHh8lazvBiEspo6aolanOP7umh/qcfq3gG4SWap72nS+ucy+oWOVCoEv3NxBNJ6Fw1Usy9jn+4F96q60TJtkyiJnWrKz9jx3H8adzMamflX8+lvzqJLtNQ2H3pd4DbVJlMjGPtBdChxrwu98OpXxqbIFeCzZO+UtPFFgsxam+TMhdICMnqjp44imbAefrziCBlEboIroAu8d44mZnAPiPF2YZEaMkkh+xnDEfuOvfKmdDLWXOFKbXm3/UqrP34KS7hOtWJCc3miARojoEr1f11HE+1ivt6rKm7YGN+feXqdsYQECW740K3ZERyBiZYR7yL42XO6icYgmwglOdovByFL7shRVu5heRGk1ncbmMfTg2joB/VdGxluAnDUv5chAWTtbYZL02Qi/NFQySM8iHUpNGjIi+EhH37ZeYH3w7g4OTpyoLhMVA1M7Kbv2rg3hHqMZ/dVShSfvDPXICcZTLDsVT6my3bk0sy6OxMJuJ3kPgXjq7cltAIOys68Kcgz98JSqpnVFwi4JfTmi4EX9Xd7kT5TUEd0EK+gCZRQ5+yFvdt23E9p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(38100700002)(122000001)(7696005)(86362001)(478600001)(54906003)(66946007)(6916009)(66556008)(76116006)(66446008)(64756008)(66476007)(55016003)(38070700005)(33656002)(4326008)(71200400001)(9686003)(26005)(53546011)(186003)(6506007)(52536014)(316002)(8676002)(5660300002)(2906002)(8936002)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXJvSWkwU3hZUTNGdXhHNlFEUXB4U0xDa1NjMG84L1RuME5DcGhiUFRCZWtN?=
 =?utf-8?B?QTIxZXNjUk5MaWtWRnN1SVlGYWo5MGJBVCtyV1JYckZENCsyTWZzd2k0L08x?=
 =?utf-8?B?WjJHd1R5VVZna0tDYzZuS21NcFdKN3JCb1JlZ3IxY2g4bktmNkNVQ0pySTB0?=
 =?utf-8?B?bkloVnZ3c1haVjlIbGRZK0NtQkhQZmx5Y3JNcXE2bXZoNE0wNmV3bllrNS9L?=
 =?utf-8?B?ckFFSTc2RklNbjQ4d2czMzJKcVlBamtRL0IxcTJEYjFyMVJuNXl5QUNLelQx?=
 =?utf-8?B?TWQvamlLZGlYNzRrS3gzQUl2czlIMkhEa3Q2QTRiZC8yaFBxa3IwQ3Q2MTVV?=
 =?utf-8?B?Vm5tRVdmNGtaQXhlbjZxdG1uQ3pLWmNENnphOXQ3WEhjUW5FTnh6MHA3anQy?=
 =?utf-8?B?L1dZWklvNHo4THJOMS9NS0JEaVF6bjlKMGdMeHFIdkFRMHZGUDZRYVA1Ujla?=
 =?utf-8?B?cElyeW81VjFvNlFrdDVUNWlYSVR0dmE1emZOTHZSSXBMWW1lRDJxdXNvT1hI?=
 =?utf-8?B?QzZuT2k0L2sybEdQMy9ZaHdjK3hTZVJRb29tTVpWR1dJYkwrVVA3KzI0RnQz?=
 =?utf-8?B?MUl5QUZ1elZYQlZTZDlDeGlEYWh5ZEVGelkveHdieWI2MlpTcGtjUkpGcG9Z?=
 =?utf-8?B?eVZRSmgwcmhYUjN5WGF4d29YUE9XUHBMMEVQWmxKNXhldWhlNDJiR2Z4SFhk?=
 =?utf-8?B?b0pYUjFTZ2FmRmxsSk53ZzlWQ3RKVUN3T212dkhsVVFTcTJkcWhub1ZJNTIw?=
 =?utf-8?B?c01sWXQrQU5paEhocU1vU3hVOGYrZjNvM0FTS2E3cmxKY0ZkTXprenl2VEF6?=
 =?utf-8?B?ait6WU5SMHpTSHJ6M1dza2hRTUMwYU1pOThWSSt0R2dmemh3NFF6MkcxWWVR?=
 =?utf-8?B?ek9aMlJLSEg1Rk0wOUZlYW9YYWg0Ukgxaml3SzZ1Mm84ZXdtNUtSbEdHZDIz?=
 =?utf-8?B?VGZETmVUODFVaHh2NDFJUmpQald3bjV6WnlGM1ExMUplU3A3YmdNUGh2NHRm?=
 =?utf-8?B?T0Y5eWtqYkZVRkFGOC9JRkF6TFpJRXp5U0pvcEp5M05BSzRKUHV3ZWd5SEFX?=
 =?utf-8?B?aTdYRmNwTTJaL2VqYmdKTVR3RnFJMVZ1My82bFRmMHhDOGp3UXpmV2dtdHJs?=
 =?utf-8?B?TU1kcHJyT1dkQUE0aFNFZGFJREdEdEFMelg1TFJvYmhySERKTnV6NHV3ajcv?=
 =?utf-8?B?WlBrUDNUVUxWQnE1U3JkZE9rOVQzZ1ZFMzd1eWErUWhCYTdkOWRvRVZxTWtj?=
 =?utf-8?B?YzlpMGRGdWdoTi9qUTBUbFV6dE9pMXdzZTRMazBTZkxwQ1B5TUNYZ1BDUjEr?=
 =?utf-8?B?MDRCR3FDZkpUZ2RRQk81T2NYU2V6RWV4Y0pzMmgzL2RZNi82TFNKa2dUMWhD?=
 =?utf-8?B?NUlFb0JNd2tJbTFCMW5jcWxYd0J3VTZod0hVL2YzLzhqRXRvSzZBL0JmZGlv?=
 =?utf-8?B?Mi9UUy9NMjhtb05LQVliUlVOOEw5UzM5WDJyYWZMeFVBOHRLaGlrdHBwQlRa?=
 =?utf-8?B?THAvR1RtWEdxc3RvRkJHL3lFVGJmT3QrOFJqamwyTUtINjZYY09sQTljY1NP?=
 =?utf-8?B?NkJLSGs1NGx3cExMNmZTZ3l3NXZGckszWUU1ZU02THYxbDdaMHFUV2p6TmVi?=
 =?utf-8?B?TWhyWEljNFM0Qk9lWFpMeURwS3RvcVFzSVdZU080WUZkUVlFU1ZCcUs1S0VR?=
 =?utf-8?B?cjdWT2thUWZib3RyYzR4WW42azFtT0lkTGxLMEtVMzF1OWxXYUNEb2cvd1V0?=
 =?utf-8?B?ais2NUxjM00vUFgxZUI5am0zeG5PWWxaV0JIaWFVRG9lYzF3b0ZnNzJhQTNm?=
 =?utf-8?B?MjgvTmZBbGR6ZWc0VklpcDFhN3I3RWNJVkNucnVHTUtMRW9QbGlZT0dsQUFU?=
 =?utf-8?B?V2ZON0t6ajJLMm5yL1dFd0xVNW95SC9GNVkyODJMQVdNZlZkUkJ0Q05aZEhS?=
 =?utf-8?B?M2w3SVpSNHROdDRKcHp0YlJqNm9Hd0FuRmJ0V1pOc3BvdWh4VWFEcjk4NVFi?=
 =?utf-8?B?dFJBY0VJSkxrcEJFZndoSzc0Rm56OVI3NjlVRUIvUXlCeXB2dG1vNnhsWnBV?=
 =?utf-8?B?YzJhYWROc3hNQVJJUUp4K3Y5dGZFTlpqaTNjV2tacDRHY1BJTHV3L05OME5U?=
 =?utf-8?Q?h+DtixmeFevhx+7V6xfaU7tum?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949f2a64-187f-418c-4e5b-08db63749227
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 14:20:52.1895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6vJfzDC/TaDANO9pwopBMZ6CFw5Glu73HnNgiFhaXOSrHgtSbzAu1ZGq33Ks3EruJdNgtixHdRMzu+YEf/a64+tVTQUgwwIircoOeL8nB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5757
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgSnVuZSAyLCAyMDIzIDEyOjE1IFBNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29t
PjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsNCj4gUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+OyBLaWVyYW4gQmluZ2hhbQ0KPiA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0Bp
ZGVhc29uYm9hcmQuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxp
bnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8NCj4gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSBSRVNFTkQgMC81XSBBZGQgUlov
e0cyTCxHMkxDfSBhbmQgUlovVjJMIERpc3BsYXkNCj4gVW5pdCBzdXBwb3J0DQo+IA0KPiBIaSBC
aWp1LA0KPiANCj4gT24gVGh1LCBKdW4gMDEsIDIwMjMgYXQgMTI6MTI6NTlQTSArMDAwMCwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IFJFU0VORCAwLzVdIEFk
ZCBSWi97RzJMLEcyTEN9IGFuZCBSWi9WMkwNCj4gPiA+IERpc3BsYXkgVW5pdCBzdXBwb3J0DQo+
ID4gPg0KPiA+ID4gT24gTW9uLCBNYXkgMjksIDIwMjMgYXQgMDI6MjI6MDZQTSArMDAwMCwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSBSRVNFTkQgMC81
XSBBZGQgUlove0cyTCxHMkxDfSBhbmQgUlovVjJMDQo+ID4gPiA+ID4gRGlzcGxheSBVbml0IHN1
cHBvcnQgT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDI6MzA6MTBQTSArMDAwMCwNCj4gPiA+ID4g
PiBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIERSTSBtYWludGFpbmVycywNCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBHZW50bGUgcGluZy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNv
cnJ5LCBJIHdhcyBvbiBob2xpZGF5cyB0aGUgbGFzdCB0d28gd2Vla3MuDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IEFyZSB3ZSBoYXBweSB3aXRoIG1vdmluZyBhbGwgUmVuZXNhcyBkcm0gZHJpdmVy
cyB0byBSZW5lc2FzDQo+ID4gPiA+ID4gPiBzcGVjaWZpYyBkaXJlY3Rvcnkgb3IgcHJlZmVyZW5j
ZSBpcyBmb3Igc2VwYXJhdGUgb25lPz8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgd29ya3Mg
Zm9yIG1lLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJZiBpdCBpcyBsYXRlciwgSSBjYW4gc2Vu
ZCBSWi9HMkwgZHJtIGRyaXZlciBzZXBhcmF0ZS4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBP
dGhlcndpc2UsIEkgbmVlZCB0byByZWJhc2UgYW5kIHJlc2VuZC4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFlvdXIgc2VyaWVzIGFwcGxpZXMgY2xlYW5seSBvbiB0b3Agb2YgdGhlIGxhdGVzdCBkcm0t
bmV4dA0KPiA+ID4gPiA+IGJyYW5jaC4gSXMgdGhlcmUgYSBzcGVjaWZpYyBuZWVkIHRvIHJlYmFz
ZSBhbmQgcmVzZW5kID8NCj4gPiA+ID4NCj4gPiA+ID4gTm9wZS4gQWZ0ZXIgbXkgcGF0Y2ggc2Vy
aWVzIHRoZXJlIHdlcmUgc29tZSBwYXRjaGVzIGZyb20gR2VlcnQgZm9yDQo+ID4gPiA+IGRybS9z
aG1vYmlsZSBtZXJnZWQgdG8gZHJtLW1pc2MtbmV4dCBieSBUaG9tYXMuDQo+ID4gPiA+DQo+ID4g
PiA+IE1heWJlIGdpdCBtYW5hZ2VkIHRoaXMgYXV0b21hdGljYWxseT8/DQo+ID4gPg0KPiA+ID4g
UHJvYmFibHksIGdpdCBpcyBuaWNlIDotKQ0KPiA+ID4NCj4gPiA+ID4gPiBJIGhhdmVuJ3QgaGFk
IHRpbWUgdG8gcmV2aWV3IHBhdGNoIDQvNSAodGhlIGRyaXZlcikgeWV0LiBBbGwgdGhlDQo+ID4g
PiA+ID4gcmVzdCBsb29rcyBnb29kIHRvIG1lLiBTaG91bGQgSSBhbHJlYWR5IGluY2x1ZGUgMS81
IGluIG15IG5leHQNCj4gPiA+ID4gPiBwdWxsDQo+ID4gPiByZXF1ZXN0ID8NCj4gPiA+ID4NCj4g
PiA+ID4gWWVzLCBwbGVhc2UuDQo+ID4gPg0KPiA+ID4gT0ssIEkgd2lsbCBkbyBzby4gSSd2ZSBy
ZXZpZXdlZCA0LzUgaW4gdGhlIG1lYW50aW1lLCBidXQgY2hhbmdlcyBhcmUNCj4gPiA+IG5lZWRl
ZCwgc28gSSB3b24ndCB3YWl0IGZvciB2MTAgYmVmb3JlIGFwcGx5aW5nIDEvNS4NCj4gPg0KPiA+
IEkgaGF2ZSBpbmNvcnBvcmF0ZWQgcmV2aWV3IGNvbW1lbnRzIGZvciB2OS4gSSBuZWVkIHRvIHJl
YmFzZSBteQ0KPiBjaGFuZ2VzLg0KPiA+DQo+ID4gSXMgdGhlIHB1bGwgcmVxdWVzdCBiZWluZyBk
b25lIHRvIGRybS1taXNjLW5leHQ/DQo+IA0KPiBJJ3ZlIGp1c3Qgc2VudCB0aGUgcHVsbCByZXF1
ZXN0IGZvciBkcm0tbmV4dCwgYW5kIGhhdmUgQ0MnZWQgeW91Lg0KDQpUaGFuayB5b3UuDQoNCkNo
ZWVycywNCkJpanUNCg==
