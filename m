Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FAA4C9FF9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E66B10EE6E;
	Wed,  2 Mar 2022 08:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40072.outbound.protection.outlook.com [40.107.4.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A02110EB4A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 13:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK2uPF5kxqTAuiBAw7Bq/G0A8kAtOeL8r5JTiaLMFAUOmKpERl6B3AeASQOXsBvcN2zh7MZXRuFxVIbQpl59mIlIbNeXwiEWTQceLj2UvVKq96lfVD5Ru1fm7J3jHvPMGaoqgnzWcUbqn627nKoebXwaCcS1mloSsH4Qi9LXTNdufXDqoln/azHLKmgRTXJklOoOvp6mqhPJAV8hbDkGPyPn2huMuT+HkhSNRJTe2F84eWuc1WJ6vsbAxD6bCFfngLaso15upbb3TAxS7a2amWf6d7nYoo/P6b9NKTS2NK6m9kEyiLy+7vDhNftV4+W+OyolkCZYNSw+X1lmG239ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M+afrfZLjvHBm3Ns9j8ybCTo3xwhE02sKqRXDZ9qjk=;
 b=b5ENPaDSjBaMACbMEoyd+z+Z9burCjnKKIw86PUkcl5RM4HXjeZMAmt16hzzsfcl/XmfditjDaZkngpLYDBNDrc7UkMKslH2IPbMCwZzIXoe+8sNN/OaS0Cynbn03NlVp8nu7vPH1fl8Ue9vrMGNBEs1CGWJUZJgeH8V8b15m0vSzOd/3hAEKQj4ooUSMcxcGH51pjssE9Aor8SNv6afZfSmctQkPqTEWm3iEAPwkxvvjzdUeuwKxYMHtEebPFq8lG3gA/ThlBLCZR92BhokcomV3rKrybyscr5EL0GKrD1uO+H21Xrv1Cv0Vkn0WkqqUpuFgU22C8vNQGoMzDnQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M+afrfZLjvHBm3Ns9j8ybCTo3xwhE02sKqRXDZ9qjk=;
 b=gPrQQ1TdcrYaMCrsrlVX6/KP8FiYiq9SOu4k8EeeooU5XBfl7MSwqExntI668RK5Z7x+l9I/+Ov9Lt0GoF3aebDI0rc64cMu/DN/pkkgVidsB1z4i0h3CJJvgnAqSaiIcgPD3LIDZVu1+UpQos8MjIjx2Z+EEhzX+ZyXnGJJzL0=
Received: from VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13)
 by AM6PR04MB4599.eurprd04.prod.outlook.com (2603:10a6:20b:15::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 13:37:46 +0000
Received: from VI1PR04MB6991.eurprd04.prod.outlook.com
 ([fe80::714c:9519:48a9:bfa3]) by VI1PR04MB6991.eurprd04.prod.outlook.com
 ([fe80::714c:9519:48a9:bfa3%3]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:37:45 +0000
From: Robby Cai <robby.cai@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>
Subject: RE: [EXT] Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for
 i.MX8MP
Thread-Topic: [EXT] Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for
 i.MX8MP
Thread-Index: AQHYLRZRpDvsPWt1BUeVY4+4n78X96yqTT4AgAAEXACAAAy8gIAAIPcAgAAEOwCAAANPQA==
Date: Tue, 1 Mar 2022 13:37:45 +0000
Message-ID: <VI1PR04MB699190CC6CB1D5C37C4BB64CF2029@VI1PR04MB6991.eurprd04.prod.outlook.com>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
In-Reply-To: <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 077902a9-3a58-4881-79db-08d9fb88ab68
x-ms-traffictypediagnostic: AM6PR04MB4599:EE_
x-microsoft-antispam-prvs: <AM6PR04MB45995AAB2139DB5EF1BF1DC5F2029@AM6PR04MB4599.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xtXrsA2adY291c6oGQYOW6EfLJ31mrIZYM1hl2ioleJZEByoIDq2P95GjQIFlB0aXxcf2OQFNVSMT6tT0ZOQ8GX1h8UFZLugVZwMLAKJGznd1XBnf72al/20IJYDAgzQ6nNEOVGCArolYqZ8CkdCMY2sGA9e7h4jaP8e5DbFezWbhQl9uZTfk/zgDGFaTG53YDj5rYypey8MXqqOFLStFEgpUj2j+5jD645xp/5ag2LT/n/VKe3PJRqTnMKQ3Q0+QeKUsmjSkv82gmDBrd5uxZWz9EGwglLpz78sSbrk8hOFcKpCmaL0pnOpx0vkaMZB3ryl4OhG7kV1e8MHW0skNbcLVLf9mXjGMkyXPQwfWoqfVCs+NV6P//7pafYkjH6YiSkHttotF3GSTts3mS4gMO7kmf28OQhRiSCYyKdGBaiEyGOWPTInxJHAuGC9wE/dHiOjypwJVSI7J2vGsiF7U2oSj927JNwNg3jChrS9NSGhBjCfMKem1SL8E4Co+Rh0Ed6UqpXd87PIaqEQViwpHXkanPuq2fkmw/gAiVOXOyvhh8SGbqmccdddwNobIdMp9zXNA4E5rLGvR/gwvgCRKt5E++qA1PsRgJUC42E5EnTj0G1nNU19xfhImXUkvmobzMAVCAz81iYYL6GUxyGBen5My2N7qVc7jjTKnKwjibB5N3LgDVqsmXy5kl+EhOPMWTyQ1z6E5SMbVkxnQNZKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB6991.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(55016003)(83380400001)(66476007)(2906002)(66446008)(64756008)(122000001)(8676002)(4326008)(52536014)(5660300002)(8936002)(44832011)(33656002)(66946007)(66556008)(508600001)(86362001)(9686003)(76116006)(53546011)(26005)(186003)(38100700002)(110136005)(71200400001)(6506007)(316002)(7696005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1c4UGE2c2lURy9BOE5xVWFvQWtRMnFBMkxiM1VkOEVwWEVlZWFSN3FySWtw?=
 =?utf-8?B?VlF3RFQrN00zbFE0ODc1RDNBRzdsekp1d2E1L0RzMFllQjBmNDE0TDBwL25m?=
 =?utf-8?B?RFVEMGx4RFduWTNna1RhS3dBOXR3azZvS0xDVkxORGZ0UjF4ZmpSN3BzWnpH?=
 =?utf-8?B?WXI4ZmxzSjNzVHFRSHVwR3pab3p0RGgvdmZMZ3Z0c2dlNzlKWWtiWFFFemtD?=
 =?utf-8?B?aW93UTRkaTNaSzh6SGtHY0NhMDVtc0JKcjliU242a0lhTFNCRnA5ci9JOC9i?=
 =?utf-8?B?UDc0N0ltZTVSSTZkNHd2YytsdXpSUjZkV0N0SlRGM3ZFdTMyU2JTV1pKeW5P?=
 =?utf-8?B?Z3UvYUltc28xVkROZ0FaRjJ4RzNiTTcrTmszaThpUVFwbnhUcDJLSXBNZzRU?=
 =?utf-8?B?Z3h6R05ZOVdXTklCbERsR1FOSHlWQ2dWYjUzdDIvYmxMalkwU2NZdEVEN25Z?=
 =?utf-8?B?emljS1NMcGZqQUhKSTkxQ2Y3cExEVzJJS3ljbk9NUHh6alNLc25zdlpoT2hL?=
 =?utf-8?B?K1dYNUhmWDNDWUpSck95UUM4amJXdDJsUnpnMURnUGlEVzdxVFMxRWY0aE5L?=
 =?utf-8?B?TkdiV0MyYjhzQ0Zob2t1WXRSOWg5YnhkTFE1d0dZUmo3dTRVcUxvSnV3VXYw?=
 =?utf-8?B?bHZCT3I4MWRMOXIrQmtncXJvaHNqTnFqZFkwekgrYWFSMS9FamRzZkN0VE5m?=
 =?utf-8?B?QVJDTldMNjlVSUtSYWtyQ0d2WWdoQWNNL1I2SUlvSWpVN3Z6TVYvRFFoNGo0?=
 =?utf-8?B?OU9UaW9HdVJMbTRRMnprK0kzOVQ0THJjREQ2M29FcC83NGpPZzRDaVlwQWVz?=
 =?utf-8?B?ak56SHl2MVc2RGN4Wk9oZTNSbzlqSEpvTGdPTVhZV3ZrR1dVcHVYODc3dVM2?=
 =?utf-8?B?T3kyaEFiUXgrZnJOSjR5U1BMckhsaXRMeG02ZGFiU3JVVlJXeitSVEN3V2cx?=
 =?utf-8?B?T0R4bXJ3L01Ba09EdG52V29MTVRmUVRSM0lTQURVdks1WHovS05BYXg3RjdM?=
 =?utf-8?B?WDFTYkxSTmhqdVpiUHlySGpwemt0OEJadkNweHErU3J5RU1oWHFwbmR5U1Nn?=
 =?utf-8?B?Q1NxQXMxa3UwSGtxakRuc2E4c1VqYVJuNWMyN0hQUE5DUnl4ck0wWHlsb3BU?=
 =?utf-8?B?a1NFVCtFUFROdWcxcXJFTVcwSU5scll0Tk45aHhEL1MrdU01bWtQaEdodExl?=
 =?utf-8?B?T2U2RDVUckRrQ1NsOGVWZTNGRTR4cXp6VnhzcnVZdFBJdVdmNmxKZzRmeE90?=
 =?utf-8?B?ZUR2M2ZXTE5UdC9TUGZRajVYZU81MGtaRXFNRkJhMk5XMlRvZ25wVlovTWVR?=
 =?utf-8?B?SER1WFIvR2ZQSkhQbU1PaVRUbGdESXBoU0Y1TWdvbXBTbFlsQ01qb2tlajBW?=
 =?utf-8?B?QWZvUTBrbXdhOHJwbW1qMDgyVk5VU2luVGNOblJ4bnVPUFRqZGRZT1V1K0pr?=
 =?utf-8?B?ZkdVa2FjOFJ3M1lQT2J4ZTBxaFpOUmdRWDdPQ1BVV1ZCQkdHNWFUNFFFUVdY?=
 =?utf-8?B?cHppdHFCZUpRb1hmTnZWVjhRdy9GT3ZIc1cvM3F3WGErSzJSVm9zZzQrY1dX?=
 =?utf-8?B?bGtNRVgrTUFjR0Q5VTRGMlRSUDFvbVcxaVk2OStUV1Axa0tUWkd2ZXlCekJ4?=
 =?utf-8?B?MXA4c0VPQW4rK1lHa0VTVlVKeDdRMllxRGNQSGlaQVdka2VqVFFaMDN3cTJN?=
 =?utf-8?B?UlhJekhYeGo4ZW4wNVpTQlRYMEFwdzFmQUM4cWg0QVdsWkkzaU5RYUZwRTgx?=
 =?utf-8?B?WXEzcGw5RzhRVTFtdnpsQWxNYm9FbkdISm5zZzVPdTZqWkNoREZtUysxMGZw?=
 =?utf-8?B?RGlDRlArSWdhaDRMS1lId3V5NUlQcGFjWU0zUCtFSEdaSmt2TG01VTBJV3pS?=
 =?utf-8?B?T0dWTXpjR2RkMThvVHg0bDlSckc4cS95dDhRbDNUZVZyS1RCMUg0ZGdSUDN6?=
 =?utf-8?B?Z0FrNjRRMEk1L09qR0ZrYkFSeVIybkVjVzhsUFZWUnZ4TWNqbGlIaEo2Tzg2?=
 =?utf-8?B?bUU4OCtwcUdta3NqL0xKMHBVR2lhQW1kM1dIYTdMZ25CZ0RaOHZOZEJ4SFN5?=
 =?utf-8?B?K0NncHZ1SU51NWRJZHRhODVWYS9tYklvWVNKMkk1MkQrOEV0VEcrMXZFZTZl?=
 =?utf-8?B?aUdQTEQyVVRrNko5b0VSY3V2SnhRMWt2VnkvVmFKL0lVNjhWUHpQQ1g2NUlD?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6991.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077902a9-3a58-4881-79db-08d9fb88ab68
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 13:37:45.8573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgDQPtK/hH9fneOORgvyZdy6UxlUT+RhpRLHenuy6cG3MKooorLMSRi9hn0+KjBF4Unj8EN+lMZA6vzuEOktCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4599
X-Mailman-Approved-At: Wed, 02 Mar 2022 08:54:41 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Ying Liu \(OSS\)" <victor.liu@oss.nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEx1Y2FzIFN0YWNoIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPg0KPlNlbnQ6IDIwMjLlubQz5pyIMeaXpSAyMToxOQ0KPlRvOiBB
ZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4NCj5DYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+OyBZaW5nIExpdSAoT1NTKSA8dmljdG9yLmxpdUBvc3MubnhwLmNvbT47DQo+ZHJpLWRl
dmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgZGV2aWNldHJlZQ0KPjxkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZz47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsgQWxl
eGFuZGVyIFN0ZWluDQo+PGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+OyBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj5MYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBTYW0gUmF2bmJvcmcNCj48c2FtQHJhdm5ib3JnLm9y
Zz47IFJvYmJ5IENhaSA8cm9iYnkuY2FpQG54cC5jb20+DQo+U3ViamVjdDogW0VYVF0gUmU6IFtQ
QVRDSCAxLzldIGR0LWJpbmRpbmdzOiBteHNmYjogQWRkIGNvbXBhdGlibGUgZm9yDQo+aS5NWDhN
UA0KPg0KPkNhdXRpb246IEVYVCBFbWFpbA0KPg0KPkFtIERpZW5zdGFnLCBkZW0gMDEuMDMuMjAy
MiB1bSAwNzowMyAtMDYwMCBzY2hyaWViIEFkYW0gRm9yZDoNCj4+IE9uIFR1ZSwgTWFyIDEsIDIw
MjIgYXQgNTowNSBBTSBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4NCj53cm90
ZToNCj4+ID4NCj4+ID4gQW0gRGllbnN0YWcsIGRlbSAwMS4wMy4yMDIyIHVtIDExOjE5ICswMTAw
IHNjaHJpZWIgTWFyZWsgVmFzdXQ6DQo+PiA+ID4gT24gMy8xLzIyIDExOjA0LCBMdWNhcyBTdGFj
aCB3cm90ZToNCj4+ID4gPg0KPj4gPiA+IEhpLA0KPj4gPiA+DQo+PiA+ID4gWy4uLl0NCj4+ID4g
Pg0KPj4gPiA+ID4gPiBHaXZlbiB0aGUgdHdvIHRvdGFsbHkgZGlmZmVyZW50IElQcywgSSBkb24n
dCBzZWUgYnVncyBvZiBJUA0KPj4gPiA+ID4gPiBjb250cm9sIGxvZ2ljcyBzaG91bGQgYmUgZml4
ZWQgZm9yIGJvdGggZHJpdmVycy4gTmF0dXJhbGx5LA0KPj4gPiA+ID4gPiB0aGUgdHdvIHdvdWxk
IGRpdmVyZ2UgZHVlIHRvIGRpZmZlcmVudCBIV3MuIExvb2tpbmcgYXQgUGF0Y2gNCj4+ID4gPiA+
ID4gOS85LCBpdCBiYXNpY2FsbHkgc3F1YXNoZXMgY29kZSB0byBjb250cm9sIExDRElGdjMgaW50
byB0aGUNCj4+ID4gPiA+ID4gbXhzZmIgZHJtIGRyaXZlciB3aXRoICdpZi9lbHNlJyBjaGVja3Mo
YmFyZWx5IG5vIGNvbW1vbg0KPj4gPiA+ID4gPiBjb250cm9sIGNvZGUpLCB3aGljaCBpcyBoYXJk
IHRvIG1haW50YWluIGFuZCBub3QgYWJsZSB0byBhY2hpZXZlIGdvb2QNCj5zY2FsYWJpbGl0eSBm
b3IgYm90aCAnTENESUZ2MycNCj4+ID4gPiA+ID4gYW5kICdMQ0RJRicuDQo+PiA+ID4gPg0KPj4g
PiA+ID4gSSB0ZW5kIHRvIGFncmVlIHdpdGggTGl1IGhlcmUuIFdyaXRpbmcgYSBEUk0gZHJpdmVy
IGlzbid0IHRoYXQNCj4+ID4gPiA+IG11Y2ggYm9pbGVycGxhdGUgYW55bW9yZSB3aXRoIGFsbCB0
aGUgaGVscGVycyB3ZSBoYXZlIGF2YWlsYWJsZQ0KPj4gPiA+ID4gaW4gdGhlIGZyYW1ld29yayB0
b2RheS4NCj4+ID4gPg0KPj4gPiA+IEkgZGlkIHdyaXRlIGEgc2VwYXJhdGUgZHJpdmVyIGZvciB0
aGlzIElQIGJlZm9yZSBJIHNwZW50IHRpbWUNCj4+ID4gPiBtZXJnaW5nIHRoZW0gaW50byBzaW5n
bGUgZHJpdmVyLCB0aGF0J3Mgd2hlbiBJIHJlYWxpemVkIGEgc2luZ2xlDQo+PiA+ID4gZHJpdmVy
IGlzIG11Y2ggYmV0dGVyIGFuZCBkaXNjYXJkZWQgdGhlIHNlcGFyYXRlIGRyaXZlciBpZGVhLg0K
Pj4gPiA+DQo+PiA+ID4gPiBUaGUgSVAgaXMgc28gZGlmZmVyZW50IGZyb20gdGhlIGN1cnJlbnRs
eSBzdXBwb3J0ZWQgTENESUYNCj4+ID4gPiA+IGNvbnRyb2xsZXJzIHRoYXQgSSB0aGluayB0cnlp
bmcgdG8gc3VwcG9ydCB0aGlzIG9uZSBpbiB0aGUNCj4+ID4gPiA+IGV4aXN0aW5nIGRyaXZlciBh
Y3R1YWxseSBpbmNyZWFzZXMgdGhlIGNoYW5jZXMgdG8gYnJlYWsNCj4+ID4gPiA+IHNvbWV0aGlu
ZyB3aGVuIG1vZGlmeWluZyB0aGUgZHJpdmVyIGluIHRoZSBmdXR1cmUuIE5vdCBldmVyeW9uZQ0K
Pj4gPiA+ID4gaXMgYWJsZSB0byB0ZXN0IGFsbCBMQ0RJRiB2ZXJzaW9ucy4gTXkgdm90ZSBpcyBv
biBoYXZpbmcgYSBzZXBhcmF0ZSBkcml2ZXINCj5mb3IgdGhlIGkuTVg4TVAgTENESUYuDQo+PiA+
ID4NCj4+ID4gPiBJZiB5b3UgbG9vayBhdCBib3RoIGNvbnRyb2xsZXJzLCBpdCBpcyBjbGVhciBp
dCBpcyBzdGlsbCB0aGUgTENESUYNCj4+ID4gPiBiZWhpbmQsIGV2ZW4gdGhlIENTQyB0aGF0IGlz
IGJvbHRlZCBvbiB3b3VsZCBzdWdnZXN0IHRoYXQuDQo+PiA+DQo+PiA+IFllcywgYnV0IGZyb20g
YSBkcml2ZXIgUG9WIHdoYXQgeW91IGNhcmUgYWJvdXQgaXMgbm90IHJlYWxseSB0aGUNCj4+ID4g
aGFyZHdhcmUgYmxvY2tzIHVzZWQgdG8gaW1wbGVtZW50IHNvbWV0aGluZywgYnV0IHRoZSBwcm9n
cmFtbWluZw0KPj4gPiBtb2RlbCwgaS5lLiB0aGUgcmVnaXN0ZXIgaW50ZXJmYWNlIGV4cG9zZWQg
dG8gc29mdHdhcmUuDQo+PiA+DQo+PiA+ID4NCj4+ID4gPiBJIGFtIGFsc28gbm90IGhhcHB5IHdo
ZW4gSSBsb29rIGF0IHRoZSBhbW91bnQgb2YgZHVwbGljYXRpb24gYQ0KPj4gPiA+IHNlcGFyYXRl
IGRyaXZlciB3b3VsZCBjcmVhdGUsIGl0IHdpbGwgYmUgc29tZSA1MCUgb2YgdGhlIGNvZGUgdGhh
dA0KPj4gPiA+IHdvdWxkIGJlIGp1c3QgZHVwbGljYXRlZC4NCj4+ID4gPg0KPj4gPiBZZWEsIHRo
ZSBkdXBsaWNhdGVkIGNvZGUgaXMgc3RpbGwgc2lnbmlmaWNhbnQsIGFzIHRoZSBIVyBpdHNlbGYg
aXMNCj4+ID4gc28gc2ltcGxlLiBIb3dldmVyLCBpZiB5b3UgZmluZCB5b3Vyc2VsZiBpbiB0aGUg
c2l0dWF0aW9uIHdoZXJlDQo+PiA+IGJhc2ljYWxseSBldmVyeSBhY3R1YWwgcmVnaXN0ZXIgYWNj
ZXNzIGluIHRoZSBkcml2ZXIgZW5kcyB1cCBiZWluZw0KPj4gPiBpbiBhICJpZiAoc29tZSBIVyBy
ZXYpIC4uLiAiIGNsYXVzZSwgaSBzdGlsbCB0aGluayBpdCB3b3VsZCBiZQ0KPj4gPiBiZXR0ZXIg
dG8gaGF2ZSBhIHNlcGFyYXRlIGRyaXZlciwgYXMgdGhlIHByb2dyYW1taW5nIGludGVyZmFjZSBp
cyBqdXN0DQo+ZGlmZmVyZW50Lg0KPj4NCj4+IEkgdGVuZCB0byBhZ3JlZSB3aXRoIE1hcmVrIG9u
IHRoaXMgb25lLiAgV2UgaGF2ZSBhbiBpbnN0YW5jZSB3aGVyZSB0aGUNCj4+IGJsay1jdHJsIGFu
ZCB0aGUgR1BDIGRyaXZlciBiZXR3ZWVuIDhtLCBtaW5pLCBuYW5vLCBwbHVzIGFyZSBjbG9zZSwN
Cj4+IGJ1dCBkaWZmZXJlbnQgZW5vdWdoIHdoZXJlIGVhY2ggU29DIGhhcyBpdCdzIG93biBzZXQg
b2YgdGFibGVzIGFuZA0KPj4gc29tZSBjaGVja3MuICAgTHVjYXMgY3JlYXRlZCB0aGUgZnJhbWV3
b3JrLCBhbmQgb3RoZXJzIGFkYXB0ZWQgaXQgZm9yDQo+PiB2YXJpb3VzIFNvQydzLiAgSWYgdGhl
cmUgcmVhbGx5IGlzIG5lYXJseSA1MCUgY29tbW9uIGNvZGUgZm9yIHRoZQ0KPj4gTENESUYsIHdo
eSBub3QgZWl0aGVyIGxlYXZlIHRoZSBkcml2ZXIgYXMgb25lIG9yIHNwbGl0IHRoZSBjb21tb24g
Y29kZQ0KPj4gaW50byBpdHMgb3duIGRyaXZlciBsaWtlIGxjZGlmLWNvbW1vbiBhbmQgdGhlbiBo
YXZlIHNtYWxsZXIgZHJpdmVycw0KPj4gdGhhdCBoYW5kbGUgdGhlaXIgc3BlY2lmaWMgdmFyaWF0
aW9ucy4NCj4NCj5JIGRvbid0IGtub3cgZXhhY3RseSBob3cgdGhlIHN0YW5kYWxvbmUgZHJpdmVy
IGxvb2tzIGxpa2UsIGJ1dCBJIGd1ZXNzIHRoZQ0KPm92ZXJsYXAgaXMgbm90IHJlYWxseSBpbiBh
bnkgcmVhbCBIVyBzcGVjaWZpYyBwYXJ0cywgYnV0IHRoZSBjb21tb24gRFJNDQo+Ym9pbGVycGxh
dGUsIHNvIHRoZXJlIGlzbid0IG11Y2ggcG9pbnQgaW4gY3JlYXRpbmcgYSBjb21tb24gbGNkaWYg
ZHJpdmVyLg0KPg0KPkFzIHlvdSBicm91Z2h0IHVwIHRoZSBibGstY3RybCBhcyBhbiBleGFtcGxl
OiBJJ20gYWxsIGZvciBzdXBwb3J0aW5nIHNsaWdodGx5DQo+ZGlmZmVyZW50IGhhcmR3YXJlIGlu
IHRoZSBzYW1lIGRyaXZlciwgYXMgbG9uZyBhcyB0aGUgSFcgaW50ZXJmYWNlIGlzIGNsb3NlDQo+
ZW5vdWdoLiBCdXQgdGhlbiBJIGFsc28gb3B0ZWQgZm9yIGEgc2VwYXJhdGUgOE1QIGJsay1jdHJs
IGRyaXZlciBmb3IgdGhvc2UNCj5ibGstY3RybHMgdGhhdCBkaWZmZXIgc2lnbmlmaWNhbnRseSBm
cm9tIHRoZSBvdGhlcnMsIGFzIEkgdGhpbmsgaXQgd291bGQgbWFrZSB0aGUNCj5jb21tb24gZHJp
dmVyIHVubWFpbnRhaW5hYmxlIHRyeWluZyB0byBzdXBwb3J0IGFsbCB0aGUgZGlmZmVyZW50IHZh
cmlhbnRzIGluDQo+b25lIGRyaXZlci4NCj4NCj5SZWdhcmRzLA0KPkx1Y2FzDQoNCkxDRElGIG9u
IGkuTVg4TVAgaXMgYSBkaWZmZXJlbnQgSVAgd2hpY2ggaXMgYm9ycm93ZWQgZnJvbSBub24taU1Y
IHNlcmllcywgYWx0aG91Z2ggaXQncyBhbHNvIGNhbGxlZCAnTENESUYnLg0KV2UgcHJlZmVyIG5v
dCBtaXggdGhlc2UgdHdvIHNlcmllcyBvZiBJUHMgaW4gb25lIGRyaXZlciBmb3IgZWFzZSBvZiBt
YWludGVuYW5jZSBhbmQgZXh0ZW5zaW9uLg0KDQpSZWdhcmRzLA0KUm9iYnkgICANCg==
