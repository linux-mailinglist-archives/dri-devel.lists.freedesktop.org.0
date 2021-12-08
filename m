Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492A46D00D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 10:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766D46E125;
	Wed,  8 Dec 2021 09:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2E6E125
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 09:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITYA6ncjsIvt7ZmEwU/i7aEq1WLm/DZ0p3z4FhQAsIjkyS/1HDPLuJVfBblGR1OF1BSDKYabeiPXM3Vtrmu68GBD77ugJK3R70sr+OhnOnhhOUw6mOqZBhT9Sbw1AJJJTpC5UQa8pD6qzRGVSSFoA6TvndJVd/eaVB2ZoT5JZZ712egBar0T+PBQWOsmMZ4LBx6Zka8uEAsCQIxf5yyaLMqQt4XiRHjM2LGpyQByvWuHVhlsIFdINc8hDS/AL1cK2ISORlqziYVMrJMYRzGkfGsiXntE0kRBaxy6h2FcrpbMSEFNbCBZ8KIB2M1RhlQiIkXA87zjmx2lMT32f8fRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLG2ur67UpbEBESszNkJXjBGq4UURhx5OwJJ8SofmUI=;
 b=AjI7dCr9OEHNazWDjHF/ATE9q1+xc9awHShcqFnGaHA8U0vn7aMWK6U+dCiGPRIF5RRpZcFJ11baLF36pdcOOf7FDt8KF0iTT/miqEhA618EN5WZwUYHxxuKclNjQTJC3ROB1drXJQgiVjm/RiUt4qylG2NrYHbbO+FouNoA0bjfi2+BvV6Gmky5Sj9QjRcd5I9HjOBN/xbjlC0V40f50jIHrD/0B6NzPmQyKComxf6kpt6LYV9WlY8Uip60cQOFs/WhF4gb1Tf6xTuUFnBZAcMIjXbcr6I6Lfd08naetqFLm2uay9o7rXyzyAKSNZQB92lLhMOPvAqM1piO2Jh2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLG2ur67UpbEBESszNkJXjBGq4UURhx5OwJJ8SofmUI=;
 b=an0mgaDcMaqMY0r5OJgY/EV2L/1qK/i3N8wOuYgfCEdwryw8rYtVifDqprxrSoLJO2YD4pr87T3t0bnYNZblc86huoOBiCtC9duSg9yRGyoYqJS/LK9s6H3a7MeoSzyK8wsSpSxh7eYoygjXFomf/GIi/XIkhPBzFvFEF3ogCKU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4450.jpnprd01.prod.outlook.com (2603:1096:604:63::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 09:26:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 09:26:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Robin Murphy <robin.murphy@arm.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Topic: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Index: AQHX6rIF/WoeY4ClPkK1i7gsRzNw9qwlsoMAgAADEWCAApaC4A==
Date: Wed, 8 Dec 2021 09:26:03 +0000
Message-ID: <OS0PR01MB5922F88E6562B0233CEEA343866F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
 <20211206150025.15703-2-biju.das.jz@bp.renesas.com>
 <3b6c454a-1572-9344-0436-2866615c3a6d@arm.com>
 <OS0PR01MB5922AAAF2C8575BAC436AB62866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922AAAF2C8575BAC436AB62866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13bbe643-546d-404b-efe6-08d9ba2cc17a
x-ms-traffictypediagnostic: OSAPR01MB4450:EE_
x-microsoft-antispam-prvs: <OSAPR01MB44509531F2E9E22B1A84AEC7866F9@OSAPR01MB4450.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aCapUmjLpQEGH0BBTuU8jAEMZN5jKZ0zHS/Po+Hbz2CnXK5w7J626Y25uzfwAgTokDTGlqQbzTLtTSq8ROUttW+5bJ5yYuP4iwjd8B4xybLLiGMslC6aOq0Dt4J96uItsQMpzjZuLXTtN2m2bzjdg91uAeAWzYWVmIOF7pY22dkjV2RoVl97ynIEeugJs4LFrPEiHqHYa2Rux8mwVR4ofvin9ZDYPXLs6fyfpawaFWZXgC4BIlhb4CBgnlweuBT8iBngE0sVnp9x2c+zM5ZSh+Ma/9v8ekUmt/ahTgyhHT8zytni56Jeonjcw2RUposlGT+WjpYaViJdook38UwkvYCkgmxp+xrPJ2nBRZNDOcQ+dPHu5B9gJF/e1jcuP6Gdo9ukJbHt+x2buf8urhnF9Ki34tgHP3SQSntcB1uxAahYs93q3sdX4CHKotPPnezgSKNAPzbj1GtSbMub/tGBG0RLUu1gWzV+phcaudxXR5bDo35AJIEEAKd5e9xWVRkawWs2WGxU3UaOcsvHXGYELh62T2Nkf7h6ypA59pP4LY7B++5ccN/1S9xb1md9ZKpCXT/X6l4g4AQhQ4YjddvJISJRXgBYGPwBse1HiFt91FVf+rbwPVOK0HnNdT4vCZiFPR6FyXbjo8sTiXiHHZLxGkEOPdsF+I8tbB3CiUahIK1VZQNYYrDFtGbuG6ZDNKuU8AJ+M67zNdWAGf1vn054oA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(76116006)(64756008)(66446008)(54906003)(66946007)(316002)(26005)(66476007)(66556008)(7416002)(110136005)(52536014)(86362001)(4326008)(186003)(83380400001)(38070700005)(2906002)(38100700002)(33656002)(55016003)(8936002)(508600001)(6506007)(9686003)(8676002)(53546011)(122000001)(7696005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWROWUFSbm0xMmdKbUJmdlJDVHZYZ2tuaTJQVzhmY0lqcW90SVhUWGhNQlBY?=
 =?utf-8?B?clFKa21IRVV4ZnhLVHZabHExTXZsRmplMUYrbUtrMW00cXVaYmdNSjZSOUN2?=
 =?utf-8?B?N2NKcnFOcW9UOUtPdExVTi9KbHVMU29kNzFVMXltREl3YmQ3K0k2ZUNrWHdN?=
 =?utf-8?B?aWFUYisxL0xWcjNxcUFwUldMS1J4QlNCd2dWdG5EcDJKWGpEU2VoSlR4emxi?=
 =?utf-8?B?OGJmcjgxNlNMRVhsWWRhQkp1aCtSbUx3bWFLUGpweEFDZHJGcUVLSmVJVnhi?=
 =?utf-8?B?d1ppczdMTkhTTGFoYjY4WUUyd0R5Rzk5bXp6bGtmaGxvVzExNEdCSVhMUWN5?=
 =?utf-8?B?OWVPb1JHTjhuSGV0QS9vQzA2VklEZXJ5d3ByWkd6dnl6YllIclN2VlhMcHhU?=
 =?utf-8?B?bGVFclFUeG8vaTg0eVRFZUkxRm56d0EwOHppNHA2c2pmQmttQ2w4MGVqbFJt?=
 =?utf-8?B?ZHJGR1AwOEIwZFhyR3RjOUV2K1kvV3JVTWRmelVSOHNVbVp2UnZJdGk1V01F?=
 =?utf-8?B?TkdhdHg0ZUFJcTlzWllnVVdqQVBmcTdzNUVkNkpOd01QaXpHbitKbWllbEZq?=
 =?utf-8?B?V1k5ZzBaWmdNcXFjSlRZRmdzUy92R2YvVDJybi9YdXIrNkVoY2ZJd0NjRito?=
 =?utf-8?B?eHA0QWhzd1FzTjE0SnNEQ1FXcFVHcU9sSC81a3BCSUhZYUtGVTJHaUJWOHQr?=
 =?utf-8?B?UFZ6Y2xiUlJRZEQ3MlVYOHVkNE0rejFmb2hJb1ZjeUJ6K1Y0WHJKWWxzMndE?=
 =?utf-8?B?WkhNY3RuVFdLNVZMb1VqdFV6RERWYnZ5ZTVNQ3pxdVhEMzB0WTZiY29Mc2tM?=
 =?utf-8?B?bjZrVnE1ckxtSS9idGpKTGFZNVZEYnAwa3FESC9HZlhRblFJTkV5WjI5Mmcr?=
 =?utf-8?B?cjNpY1ptdE41MUxncld5MTNqQjZVRU5vaWFDcUFCTnd5bVpGT1FrZnBYaldx?=
 =?utf-8?B?NkUwMzRVanNVdllzMmU2cGpyd2VOak9zUmlUUER0aGVjQjRkSVhaUDJqRkVY?=
 =?utf-8?B?WW5hbm52aWNGMFV1MjRmV1cyT1dXTWsxTjFGakF4VkcrZDYxMSt1TWU0cTV6?=
 =?utf-8?B?ditoWWgvUE82TmdNTnJ4UUx2bkdFK3dNWHNBVmVzcVM0VUNGSDdWL25jbHp1?=
 =?utf-8?B?MmpSdEMyR3hqcE8wUWhqTDR6STRkNUJBc01sWGxSSGJiMHBoK3FiUEVZVExp?=
 =?utf-8?B?THY4aTk2dXdSRjdLRmpXVXp4aTQrd1NCWUVoY0VqUHVzSVJHVWp3OFI4QkNW?=
 =?utf-8?B?UkNmY2lSS2hiQWhkOEo2QkFNSWNuZ0IxWlRjWU5ZZVFqWStMSEJDTUEvamFq?=
 =?utf-8?B?UjEzNU5XVndiMEU3U0JXS0o3aU1zQlJiY2h0eTI5RGg4L0lhVnRHbzlNWlcr?=
 =?utf-8?B?K01xWEpFSGtXZFFlN25zblFmQ0lIZ2pPYkNNMWd5RVE5RXdZeHFUNWlhc3Zv?=
 =?utf-8?B?VHBkVkFJV05zWm02cWVCd0lzMWFnNXd2aTM0K1NVRkVOQzI4clplRHRVSWpW?=
 =?utf-8?B?NzFHVXJjZzRrQjlxcG82L0k5b1FDd0Yzdk5tUUU2Z3AxL1hBNG1UV2Q4SFIx?=
 =?utf-8?B?cThxSFhpTE9PcnM2ekpmbHB5N3UxQ1BTL3BYbGNmUEE5dkpqSnhOYW4yZHd5?=
 =?utf-8?B?Sm5Bb0d1a3JzU0Y3Z3ZJMXhkKzlwaFhoNXdMbDl6dmxwZkp0T2V5VnFnT2R1?=
 =?utf-8?B?YUpwQWtiM2NleUxiSTBIaWRyWmhtRFZIaXZFRWVkaDRRamRUQnVsR1VOMkhz?=
 =?utf-8?B?Y2txM2ZYWk9pWjJFeEc3V0w2a0pxUFVhZG53SXhZWnUrS3kwNHFrWktFcURl?=
 =?utf-8?B?RWNpa1NJTTFXUjM3REppZnNueDNyQTdlNHI5T292U0xJZVAvakdGM3B4VCt0?=
 =?utf-8?B?WVJGNXJBUmVOZzN1UFRyaGtVRWhOZWNzK25kMmJzK3VJc3UyRmVYejA1Q3Rq?=
 =?utf-8?B?MG5semNId2Q3SWpVbFcrazhOMjlFNzJrM2NhTFhnNEdLRXlsQnA2T0NQeGM3?=
 =?utf-8?B?eU5NYnRjeUtMMXRPSVNWaXA5aExXbCtsMm4xWWV5MWRodnpSaWdUME1wdE41?=
 =?utf-8?B?djBNcFo2WWc1QWhRMjVST2tmVENpSVBLSXNJcXFHVWxqY2x6RVhkTjJDRHo3?=
 =?utf-8?B?Vlk3S2JnMmlvbEVOL1FCSjZaWW9IUlBOZ1NqTWwwblZzNGpTLzBPVk5VcXh4?=
 =?utf-8?B?QUFCNDdSR2JucTZGd0Yvd1hVUURUelVuTm1odTUzbHZXSjQya0lDQkl6NExM?=
 =?utf-8?B?dlo2V05Sa1E1QUpQK3poZkhNV1dRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bbe643-546d-404b-efe6-08d9ba2cc17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 09:26:03.5479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2PqxILdgphnkdMuFchvAMcspPrZOl2n2cZL9s2Wq9RINiQNEYVZQEffWoXi1IWtdlTXV5cf7ALB4WhwMxcHzGfgoBInYgnN1GnTPc0O6Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4450
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
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiAxLzNdIGR0LWJpbmRpbmdzOiBncHU6IG1h
bGktYmlmcm9zdDogRG9jdW1lbnQNCj4gUlovRzJMIHN1cHBvcnQNCj4gDQo+IEhpIFJvYmluLA0K
PiANCj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+IA0KPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMS8zXSBkdC1iaW5kaW5nczogZ3B1OiBtYWxpLWJpZnJvc3Q6IERvY3VtZW50DQo+ID4g
UlovRzJMIHN1cHBvcnQNCj4gPg0KPiA+IE9uIDIwMjEtMTItMDYgMTU6MDAsIEJpanUgRGFzIHdy
b3RlOg0KPiA+ID4gVGhlIFJlbmVzYXMgUlovRzJ7TCwgTEN9IFNvQyAoYS5rLmEgUjlBMDdHMDQ0
KSBoYXMgYSBCaWZyb3N0DQo+ID4gPiBNYWxpLUczMSBHUFUsIGFkZCBhIGNvbXBhdGlibGUgc3Ry
aW5nIGZvciBpdC4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiB2MS0+djI6DQo+ID4gPiAgICogVXBkYXRlZCBtaW5JdGVtcyBmb3IgcmVzZXRzIGFzIDINCj4g
PiA+ICAgKiBEb2N1bWVudGVkIG9wdGlvbmFsIHByb3BlcnR5IHJlc2V0LW5hbWVzDQo+ID4gPiAg
ICogRG9jdW1lbnRlZCByZXNldC1uYW1lcyBhcyByZXF1aXJlZCBwcm9wZXJ0eSBmb3IgUlovRzJM
IFNvQy4NCj4gPiA+IC0tLQ0KPiA+ID4gICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJv
c3QueWFtbCAgICAgICAgfCAzOQ0KPiArKysrKysrKysrKysrKysrKystDQo+ID4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQNCj4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwNCj4gPiA+IGluZGV4IDZmOThkZDU1
ZmI0Yy4uYzNiMmY0ZGRkNTIwIDEwMDY0NA0KPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwNCj4gPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1s
DQo+ID4gPiBAQCAtMTksNiArMTksNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgICAgICAg
LSBhbWxvZ2ljLG1lc29uLWcxMmEtbWFsaQ0KPiA+ID4gICAgICAgICAgICAgLSBtZWRpYXRlayxt
dDgxODMtbWFsaQ0KPiA+ID4gICAgICAgICAgICAgLSByZWFsdGVrLHJ0ZDE2MTktbWFsaQ0KPiA+
ID4gKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LW1hbGkNCj4gPiA+ICAgICAgICAgICAg
IC0gcm9ja2NoaXAscHgzMC1tYWxpDQo+ID4gPiAgICAgICAgICAgICAtIHJvY2tjaGlwLHJrMzU2
OC1tYWxpDQo+ID4gPiAgICAgICAgIC0gY29uc3Q6IGFybSxtYWxpLWJpZnJvc3QgIyBNYWxpIEJp
ZnJvc3QgR1BVIG1vZGVsL3JldmlzaW9uDQo+ID4gPiBpcyBmdWxseSBkaXNjb3ZlcmFibGUgQEAg
LTI3LDE5ICsyOCwzMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgbWF4SXRlbXM6IDENCj4g
PiA+DQo+ID4gPiAgICAgaW50ZXJydXB0czoNCj4gPiA+ICsgICAgbWluSXRlbXM6IDMNCj4gPiA+
ICAgICAgIGl0ZW1zOg0KPiA+ID4gICAgICAgICAtIGRlc2NyaXB0aW9uOiBKb2IgaW50ZXJydXB0
DQo+ID4gPiAgICAgICAgIC0gZGVzY3JpcHRpb246IE1NVSBpbnRlcnJ1cHQNCj4gPiA+ICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogR1BVIGludGVycnVwdA0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IEVWRU5UIGludGVycnVwdA0KPiA+DQo+ID4gSSBiZWxpZXZlIHdlIGhhdmVuJ3QgYm90aGVy
ZWQgd2l0aCB0aGUgIkV2ZW50IiBpbnRlcnJ1cHQgc28gZmFyIHNpbmNlDQo+ID4gdGhlcmUncyBu
byByZWFsIG1lYW5pbmdmdWwgdXNlIGZvciBpdCAtIGl0IHNlZW1zIHRoZSBkb3duc3RyZWFtDQo+
ID4gYmluZGluZyBmb3IgQXJtJ3Mga2Jhc2UgZHJpdmVyIGRvZXNuJ3QgbWVudGlvbiBpdCBlaXRo
ZXIuDQo+IA0KPiBJIGFncmVlLg0KPiBCdXQgRFQgYmluZGluZyBkZXNjcmliZXMgdGhlIEgvVy4g
T3VyIFNvQywgbWVudGlvbiBhYm91dCBFdmVudCBpbnRlcnJ1cHQuDQo+IFRoYXQgaXMgdGhlIHJl
YXNvbiBJIGhhdmUgZG9jdW1lbnRlZCBpdC4NCg0KPiA+DQo+ID4gPiAgICAgaW50ZXJydXB0LW5h
bWVzOg0KPiA+ID4gKyAgICBtaW5JdGVtczogMw0KPiA+ID4gICAgICAgaXRlbXM6DQo+ID4gPiAg
ICAgICAgIC0gY29uc3Q6IGpvYg0KPiA+ID4gICAgICAgICAtIGNvbnN0OiBtbXUNCj4gPiA+ICAg
ICAgICAgLSBjb25zdDogZ3B1DQo+ID4gPiArICAgICAgLSBjb25zdDogZXZlbnQNCj4gPiA+DQo+
ID4gPiAgICAgY2xvY2tzOg0KPiA+ID4gLSAgICBtYXhJdGVtczogMQ0KPiA+ID4gKyAgICBtaW5J
dGVtczogMQ0KPiA+ID4gKyAgICBtYXhJdGVtczogMw0KPiA+ID4gKw0KPiA+ID4gKyAgY2xvY2st
bmFtZXM6DQo+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAgIC0gY29uc3Q6IGdwdQ0KPiA+
ID4gKyAgICAgIC0gY29uc3Q6IGJ1cw0KPiA+ID4gKyAgICAgIC0gY29uc3Q6IGJ1c19hY2UNCj4g
Pg0KPiA+IE5vdGUgdGhhdCB0aGUgQmlmcm9zdCBHUFVzIHRoZW1zZWx2ZXMgYWxsIG9ubHkgaGF2
ZSBhIHNpbmdsZSBleHRlcm5hbA0KPiA+IGNsb2NrIGFuZCByZXNldCAodW5leGNpdGluZ2x5IG5h
bWVkICJDTEsiIGFuZCAiUkVTRVRuIiByZXNwZWN0aXZlbHksDQo+ID4gRldJVykuIEkgY2FuJ3Qg
aGVscCBmZWVsaW5nIHdhcnkgdGhhdCBkZWZpbmluZyBhZGRpdGlvbmFsIG5hbWVzIGZvcg0KPiA+
IHZlbmRvciBpbnRlZ3JhdGlvbiBkZXRhaWxzIGluIHRoZSBjb3JlIGJpbmRpbmcgbWF5IHF1aWNr
bHkgZ3JvdyBpbnRvIGENCj4gPiBtZXNzIG9mIG11dHVhbGx5LWluY29tcGF0aWJsZSBzZXRzIG9m
IHZhbHVlcywgZm9yIG5vIGdyZWF0IGJlbmVmaXQuIEF0DQo+ID4gdGhlIHZlcnkgbGVhc3QsIGl0
IHdvdWxkIHNlZW0gbW9yZSBzZW5zaWJsZSB0byBwdXQgdGhlbSBpbiB0aGUNCj4gPiBTb0Mtc3Bl
Y2lmaWMgY29uZGl0aW9uYWwgc2NoZW1hcy4NCj4gDQoNCkkgYWdyZWUsIEFsbCBvcHRpb25hbCBw
cm9wZXJ0aWVzIGxpa2UgY2xvY2stbmFtZXMgYW5kIHJlc2V0LW5hbWVzIHNob3VsZCBnbyBpbiB0
aGUgU29DLXNwZWNpZmljIGNvbmRpdGlvbmFsIHNjaGVtYXMuDQpJIHdpbGwgbWFrZSBjbG9jay1u
YW1lcyBhbmQgcmVzZXQtbmFtZXMgdG8gdHJ1ZSBhbmQgaGFuZGxlIGl0IGluIHRoZSBTb0Mtc3Bl
Y2lmaWMgY29uZGl0aW9uYWwgc2NoZW1hcy4NCg0KSSB3aWxsIHNlbmQgVjMsIGluY29ycG9yYXRp
bmcgdGhlIGFib3ZlLiANCg0KUmVnYXJkcywNCkJpanUNCg0KIA0KDQo+IA0KPiA+DQo+ID4gUm9i
aW4uDQo+ID4NCj4gPiA+DQo+ID4gPiAgICAgbWFsaS1zdXBwbHk6IHRydWUNCj4gPiA+DQo+ID4g
PiBAQCAtNTIsNyArNjQsMTQgQEAgcHJvcGVydGllczoNCj4gPiA+ICAgICAgIG1heEl0ZW1zOiAz
DQo+ID4gPg0KPiA+ID4gICAgIHJlc2V0czoNCj4gPiA+IC0gICAgbWF4SXRlbXM6IDINCj4gPiA+
ICsgICAgbWluSXRlbXM6IDINCj4gPiA+ICsgICAgbWF4SXRlbXM6IDMNCj4gPiA+ICsNCj4gPiA+
ICsgIHJlc2V0LW5hbWVzOg0KPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ICsgICAgICAtIGNvbnN0
OiByc3QNCj4gPiA+ICsgICAgICAtIGNvbnN0OiBheGlfcnN0DQo+ID4gPiArICAgICAgLSBjb25z
dDogYWNlX3JzdA0KPiA+ID4NCj4gPiA+ICAgICAiI2Nvb2xpbmctY2VsbHMiOg0KPiA+ID4gICAg
ICAgY29uc3Q6IDINCj4gPiA+IEBAIC0xMTMsNiArMTMyLDIyIEBAIGFsbE9mOg0KPiA+ID4gICAg
ICAgICAgIC0gc3JhbS1zdXBwbHkNCj4gPiA+ICAgICAgICAgICAtIHBvd2VyLWRvbWFpbnMNCj4g
PiA+ICAgICAgICAgICAtIHBvd2VyLWRvbWFpbi1uYW1lcw0KPiA+ID4gKyAgLSBpZjoNCj4gPiA+
ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiA+ICsg
ICAgICAgICAgY29udGFpbnM6DQo+ID4gPiArICAgICAgICAgICAgY29uc3Q6IHJlbmVzYXMscjlh
MDdnMDQ0LW1hbGkNCj4gPiA+ICsgICAgdGhlbjoNCj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0K
PiA+ID4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzOg0KPiA+ID4gKyAgICAgICAgICBtaW5JdGVt
czogNA0KPiA+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gPiArICAgICAgICAgIG1pbkl0
ZW1zOiAzDQo+ID4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gPiArICAgICAgICAtIGNsb2NrLW5h
bWVzDQo+ID4gPiArICAgICAgICAtIHBvd2VyLWRvbWFpbnMNCj4gPiA+ICsgICAgICAgIC0gcmVz
ZXRzDQo+ID4gPiArICAgICAgICAtIHJlc2V0LW5hbWVzDQo+ID4gPiAgICAgICBlbHNlOg0KPiA+
ID4gICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgICAgIHBvd2VyLWRvbWFpbnM6DQo+
ID4gPg0K
