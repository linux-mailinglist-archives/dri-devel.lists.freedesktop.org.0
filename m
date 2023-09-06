Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9F7942ED
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3EF10E6F1;
	Wed,  6 Sep 2023 18:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBDC10E6F1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 18:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTpotGiztZRPykVc4Y5aS0zOoYNe5JityyPWfNXB3dVUXMuM8ju8Ez/iGV1IVuh3n7nUhMe0TmPpIr5v3FXSyTrfg/cviYYvrL8rg1Qpc18FtW2oqbNXe4pgn2pAhHjpVmJjvaOUiuKnaNEqLhoD3v9fN3/NeSZLPyidK74YfGFSXgH6e//8qBMSxb1xderOFRq9OjSlYXF1/TUJ1q0fIzRLkAv+QjwS3KL+UWbbSS3iLyI4FBoTaS2UwgG5DVFP9Ssb2tujjhTNFqH1ffnP6GIVuHDSBU1B7AYKKimBexEdjHSlE0BfXAuUDp2/kA+sLdw7C0MvsEB1tuM/wjAV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCVdmmXi7PEsezVeFoxam+VhmO6Et8xO9nCv8E7VA7U=;
 b=oMGf9QGsRCkFsK5aMpVlz0DCCsZBIRaGjXzVU8XuSsGtFxULHOi2BUtXWB+Xa8WpPszdFY+LG7hwXANyiA9q569wFdarZoFdBe7FItb0UmngS7LQ8Di7bwV0ztdCR01mJ7W1xLQczur1qff2X5/cpndtif0G58d7NUecc26VcBKW+/5AbzkWGNZEQ1m2W6erFg3ehAx0Gwppxdt9o0w5rW7BghaEHB9q3XWjOajbiDUMC9NcbDfPeQ4EJE9tPziVAMFJYdt/d91mYlm6R/bRUTWvt7/uEf0eOEbl6RlnwNdTOBT+tYZLPprZZ9x+1LrOaV+zojyF55TdPopkk4R2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCVdmmXi7PEsezVeFoxam+VhmO6Et8xO9nCv8E7VA7U=;
 b=rYqSVKZeHtXnPwLhXjcVJTQpoaUPW6cO9Oq3UPCjIKJ4/VmioQt2t4V08Pcb/BQrCuegT4wg8YGEy/J876aYx+vv3cf3m/APdD/rs0LlZJZ0hPlYec6pRpXjp2YTRR3nbbr3dhpZLhCoptHXNLZ1ansTMNfKPXBwvCPpMEglb/4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9867.jpnprd01.prod.outlook.com (2603:1096:604:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.37; Wed, 6 Sep
 2023 18:15:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.035; Wed, 6 Sep 2023
 18:15:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Doug Anderson <dianders@chromium.org>
Subject: RE: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional
 around *_of_get_bridge()
Thread-Topic: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional
 around *_of_get_bridge()
Thread-Index: AQHZ4NjJrboJYt2k+0mV4e+gbCj57LAOGnNA
Date: Wed, 6 Sep 2023 18:15:49 +0000
Message-ID: <OS0PR01MB59225D7B9D78DA6F216E378B86EFA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
 <CAD=FV=UFuTion7w4maxVVWZmzoRGXcoUjp9NV9xE3_Kf2ZCvTA@mail.gmail.com>
In-Reply-To: <CAD=FV=UFuTion7w4maxVVWZmzoRGXcoUjp9NV9xE3_Kf2ZCvTA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9867:EE_
x-ms-office365-filtering-correlation-id: fd9b92c8-d903-4949-ba9a-08dbaf054c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3JC13qsJjbHhcUQHnGhTEBd3EVO1jCy65hDNv/1aZKJsbfACw+weCk2+gWnuYmx1GHe9qfLD7AS2yrdzUothmaagQpmm9KNAwT2//3VvfgeQBgxXmUZbQznX0g7+7SjdfaYzwTb0nIwcK0ai2DmzCGPHoOY7+wX1mrgaOaeJ2WJjCtS7GY+r4B+piH5u0SXLkDLwzB17c+Y7GJ/OE+s02vqqzUoqp21w/K775CriJ6nSZ1rGkBTwjnQyw1dEHJzDEJcshP1o154UYgLu+E49j8a602oC1g1klS7ko0WOFGvFNUm0Q4HziTRQl/wgU9w9cR1iFl4Er/i+HBnJp7mg/m4db22u0YOCYmMxyWlnIEsf3mpofUJ8h46UUo1ZNRE+VHvwUoa8WxLjGHyFzULujUAdgheaRyEt8m87wNFuA53vSyeqLubBXqlXOsmNRKiuLUq4irMy0J4galeckF/ho4gt5m5aOVn4UkTR880QkdkCLZxdbnQLm3/9MNX0IEkqmxcp3jr5lJXHop+EvcZHt6rolWuUR3LtbqcRbonSUSCBBhjE+EapwfO/ZGcGenaQxdM+aBej01ClUpMWct0e+paWJTn0cLcFgEJhm4zA5/dcQ2ILWLSZTLKlLvWX6QZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(1800799009)(186009)(451199024)(9686003)(53546011)(7696005)(6506007)(38070700005)(38100700002)(122000001)(71200400001)(86362001)(478600001)(26005)(83380400001)(76116006)(52536014)(8676002)(8936002)(5660300002)(4326008)(55016003)(316002)(6916009)(54906003)(64756008)(66556008)(66446008)(66946007)(66476007)(41300700001)(33656002)(4744005)(2906002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEVxRCswSEtSejBBK2RRU1ZGZVRqWHNTVTJtRlk0UEpOVEJxeWtjMnhQemtR?=
 =?utf-8?B?b25TTk1Lc1JGbENQZ3FValluV1BjV21jZDJ0ZFBoMVRLb05nS0xLUDcwNXVD?=
 =?utf-8?B?K0dkK3ZZOUZidW5tQ3czVHRpSis5bS9PRTNhekFFK0dBRlZWZjU4ZjVBTmVE?=
 =?utf-8?B?dGRxZkNwR25JM3dIaloxUlc3ZXNjYU12cWxIVkd1bVpTaXdxK3VEci9lUEcr?=
 =?utf-8?B?WXZMWTEyWURQSGhQbGR5eXRVeFpzWDE0cUZERGlISTVyOUN3U1lqOFdaVCsx?=
 =?utf-8?B?cHcwWk9NQnZEVGVrMyt4OTBPUW5JSVBJYkMwckRWa3RTNW52WVJHTld4RGZs?=
 =?utf-8?B?byt3a21PdU5JTHI1dXBxeXhMdE5HZ0phTnZRWkZ4Y0JoWDEvbjZxZGFOaEJX?=
 =?utf-8?B?cGlxMG1tNEhpclRvRGtFRW9UcFVDck5sVFNweWRleEJZSERQWHF3TU9HdHM3?=
 =?utf-8?B?UjlHWkh2bGltOFRnS29YcVBIQ3d1ZTliSldqNVFVTjQvV0tTbklzR3VpT1Mv?=
 =?utf-8?B?UUNtZjZGeUpvd2dLRGZvZXlUSzJVRWF1enNtK1VMVzdOZ2lUdlNqU2xXY0ZU?=
 =?utf-8?B?eXdWVWU1R0pRLzBCYWJrQXhDbXQxSGs1b2R2Y2pZclhQSm5kbkVZdUpRSmxU?=
 =?utf-8?B?T1hSRTZzTXZVWnJRdnNXU3F3VHpKL1VyRFI4K2crcVBhL1k0UVF5SjVkalVX?=
 =?utf-8?B?NHZZbnhjbmV2RDdJYjhrTW5FUUdTQlFlM3lvYXdwNkZURHZvSGNXQS8yRHRD?=
 =?utf-8?B?cjNtTDAyWmNSdjdjWEE3Tm9BQkFOWFpIaGQzWnBSdFZWeG94NzhPSERvTUV2?=
 =?utf-8?B?eml1UTZ4dG1LNmVXbjBiY1NCbzYvUmtXM1NndlRKeUpZSVovSUZ5N1IxZlVh?=
 =?utf-8?B?bnJCTCtmeFh1WWFBdkxsMnB6TzRlaWVuYVNYbVppdVJJb3Znbmh5akdxZmlF?=
 =?utf-8?B?SVZBSjd3UWdxdmtmZmlEdHBYaGhucCtQU09MVGhXU092SU96NjZ2TmZNRmR2?=
 =?utf-8?B?Vng1ZUdDVzBjeTZsSEROMUdsSjNJTEsxVDFaQWxCcWo1TWJGWThNVlNpYWVG?=
 =?utf-8?B?UERKYXJmWm5SVnkzc1RhMWZhdmxOVmROeDRyQTZrQ0ExQ1dLMDRiMmZ1RHcv?=
 =?utf-8?B?Qm14azgrUkFtVlhwcGlvMjhCejFSSmRHNjZSS0wwVlR0emNaYzlJaWFwWXI5?=
 =?utf-8?B?UTRERWlUTHhWNmFtTm11MHpzdm1RVmZQcWdMc1RLd2VFMXE2emN3VmN5bFVD?=
 =?utf-8?B?UjNkeVVUODRQb09HVmQ1VU5acksraXZYUVdEcXgwcG9HaHhEUjFNUEx4UWNh?=
 =?utf-8?B?aFJscHRiNEZNRENLQmlsa1NHdDdJbm1waFpSdC80MG5qUFRVcFNYZFRSa0xy?=
 =?utf-8?B?WU1URlhPaU45WEVuVWlYYnhPQmNKcEg0QTdZdHp0YzhocTBVdTIzd1J5YzVU?=
 =?utf-8?B?VjM0dThsT25NcVdZbGFtZ003eVVHN2VLRE9lcjhCYzdIQXhEZDhoNHBGeVVF?=
 =?utf-8?B?bGtWclp2T3QwWStoSWRRYTN3NDlDUGczbkkxUUdqc2JOdnJHMHpPWlNtdlJ2?=
 =?utf-8?B?R3UwOC9ZemZWVWxUMVhsa0ZQc3dmeHE0bHVqbUlqWUdTdDJrbHppTHFHK0Ji?=
 =?utf-8?B?RTArK1g3TW5JUlNKVmtJdjBHeHhuTUlEQ2tTWUMxcVNPK2lFT202Mmd0bUJt?=
 =?utf-8?B?QlZneUZET0UxMmlqWmRiVHVFWGJFM0tVQzZ1SW9TeExPMHVrRW1NOEZwZFY0?=
 =?utf-8?B?SlByZUErc0Vpd2tWa1oxVy9QdDJYYnFVdiszQUNIT0lwYnBUYW8rUmx5WlBo?=
 =?utf-8?B?dDJ1RmQ3OU9ZeW9vdWI3cTlxckQremFUN0E0Z3NiU0QrVEpmaUN2Z1BtbDhO?=
 =?utf-8?B?dkUzaVZibTAycGltM3pkU21NY2hmbEVZOE14ei91T3FrejdYb2U2bEpPZDVj?=
 =?utf-8?B?dDdlaWhER210Sm5BSDVrUXdRbnhIOXpNSVJTOStEbDArcFkzU0x2c2xlM1BK?=
 =?utf-8?B?UXhKT3BKUVhsWmhuZ1dOb0lENzRxVDNRRHVqbDhYYlZkekJDQXU0aDZGb3hY?=
 =?utf-8?B?SmZuYnlzRElmQ2pZOHRwcHgwKzMrL1QwNXpueGVUZjkvUk9vaTkzRnE3Qmw0?=
 =?utf-8?B?eGd2N0xoQ1RNRFFCRUZuaDduQXd4cmxnbnk2NHdFM0IwT295YzI0QUt5Mklu?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9b92c8-d903-4949-ba9a-08dbaf054c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 18:15:49.3289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deAdHBIytZDGUblte3FLgwQWErLxK43FWHK9wyc90yZcUJcoVGhvn5v/uy67RpGtahTy2VlYzVtzUtNHKET3TZi4bKqlxrznTgxGDjkZyNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9867
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZyBBbmRlcnNvbiwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDQvNF0gZHJtL2Jy
aWRnZTogcGFuZWw6IERyb3AgQ09ORklHX09GIGNvbmRpdGlvbmFsDQo+IGFyb3VuZCAqX29mX2dl
dF9icmlkZ2UoKQ0KPiANCj4gSGksDQo+IA0KPiBPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAxOjEw
4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4g
Pg0KPiA+IERyb3AgdW5uZWNlc3NhcnkgQ09ORklHX09GIGNvbmRpdGlvbmFsIGFyb3VuZCBkZXZt
X2RybV9vZl9nZXRfYnJpZGdlKCkNCj4gPiBhbmQNCj4gPiBkcm1tX29mX2dldF9icmlkZ2UoKSBh
cyBpdCBpcyBndWFyZGVkIHdpdGggI2lmLi4jZWxzZSBibG9ja3MgaW4NCj4gPiBkcm1fYnJpZGdl
LmguDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjY6DQo+ID4gICogTmV3IHBhdGNoLg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgfCAzIC0tLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IEp1c3QgdG8gYmUgZXhwbGljaXQsIEknbSBf
bm90XyBsYW5kaW5nIHRoaXMgcGF0Y2ggdGhvdWdoIEkndmUgbGFuZGVkDQo+IHBhdGNoZXMgIzEg
LSAjMyBmcm9tIHRoaXMgc2VyaWVzLg0KDQpUaGFuayB5b3UuDQoNCkNoZWVycywNCkJpanUNCg==
