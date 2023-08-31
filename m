Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41578EAE1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284410E600;
	Thu, 31 Aug 2023 10:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2BC10E600
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 10:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXI0Nw0mMKqqk52t4knQr0ezlmZl7sLVKPDpCLczl5iCiL4YZviby2k9b3eRK6avqj96OJVX0GXruAkW+ojsQmbkSpLPieNAwEWsbUBGGv12WGU6U25xcWtV5I0MU47XhZ3TlvOVzPVM2MaT6jMXu39VenXJv+zTqZYC+HP4dskn6v9mrw1iSQPNVVR38W5Ak3ZWMtb13juT+1rNl4/H4nkbXswCGu60VsAgS83YfMji+cmn/DGF1aEXjE8KSTns7Ukdhprii5u77yO3gjA3gTg0LNZdKOT1BUQBzyaRjXhG/Ao601wTae3BceCsog38mzdBMUpe9sajz+Yv7PpETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO2m/RGf8guSpVfbA87digqRBDkL7IK15dHUNU+0plg=;
 b=RH+6nfzfwG0sGasy+MHSoXyt9FjZ1QjpmokXDFr6Hu9mf96XczQ0z2pHWUaVTeASWe7kKL12IZxkXHYamTNP2kcDQGMM+t1l7jz4r4h6HfS9FM2qONaXJpNYACoAo3tUC0/dKvOVejPOMSSMNLr4FGzgJrcQ5mQbgKuMJlWHaxT/sJcn45T7TMznTiWrNKP72UsFHYa4FX411FBiWywtkJXCar2wMlxi+KDuBGcekOBVkp7DnDiVOC/f7CvoDbhrEoUv+skJfzEUGkQ76ZQh0gM2VNWlUgFEuQHowocoKzpRX6l8zP5d2ZMPzmkY7FlVCiuhIkLbkDJWk4TTzeYeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO2m/RGf8guSpVfbA87digqRBDkL7IK15dHUNU+0plg=;
 b=BMvNj11FJx4Wi5wszVWNBum/S0AQ8jj5V3W5X+4bsgkzX2dto+0s58TbiyVrPUSeWjl+B1YQLoaiNrG9SkN9S6SUF5uekHkcfVXSs870D0PRGJUsUrHEM/lNPCwfHi5/U+M7qRoW7SRbiNx/PLlWkLcqeRnKW9a3QasSFFmeBQA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5606.jpnprd01.prod.outlook.com (2603:1096:604:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 10:47:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 10:47:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional
 around  *_of_get_bridge()
Thread-Topic: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional
 around  *_of_get_bridge()
Thread-Index: AQHZ2+KQxxvZRIssj0qqGYV99NZys7AEI/gAgAAUgyA=
Date: Thu, 31 Aug 2023 10:47:24 +0000
Message-ID: <OS0PR01MB592262D3EDAF424252157D5B86E5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
 <20230831093108.GF2698@pendragon.ideasonboard.com>
In-Reply-To: <20230831093108.GF2698@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5606:EE_
x-ms-office365-filtering-correlation-id: d3a81f76-ecd8-4f33-6853-08dbaa0fa96f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcmM0wnXu+XLdoDG7kzJC15BeSszMn2TYtZiffvWAjjwP5AQH3v1uHPz0sXDoct+vl/zpV0vhmUKeg7ZXV/C85bRhuVPui+EOiQYp9vyW6QQQG5cpWBZSbV2jpRoxfpW0TPzHttNB46tSzvU76rs8rh5N/aLfBnD+XL2nZrirPQdJEiwA8LTRd4Dj/5Kye5I9mEEOjss1IDcPyJ5vC56OQwc8Yz9Dr8LT/XHLmawE913q69EZZB0XlLXhK28fvLO+MdJR+hc7ShM3K6S+unaEk+6yx7ALu+uYG8JOUhzBW3VVVtjonQCpwpMqRgYbAMqesaTrojM8Y+gEznfHf9gpoxxujE7amyOJ+G9majg4XDHGu41YX0PJscfZpVAtQuxKqfxWFfrQVsyBza2xIOW/UlRpx0eWhllWvZB3yh484OtLaDi5G/yGp1wcJ3wWkXKCJ1M1VqbPG6uBUqCS51pPzVLTpAwjrxHNhTTAG8QEvryYkRAw3t+VXit9/84VP7IxiJbkrkk+tXcyL5733TWVvpxGUaarYaFmkwA7dw/I0PCnwfYVJermKCVjlAl25gpmH4gML6EaSpswzPwgIYZTgVEfU+qhyyxadNw43l/xMw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(396003)(376002)(1800799009)(186009)(451199024)(2906002)(33656002)(38070700005)(38100700002)(122000001)(83380400001)(86362001)(55016003)(41300700001)(9686003)(6506007)(7696005)(66946007)(66446008)(64756008)(66556008)(6916009)(66476007)(54906003)(316002)(52536014)(8936002)(8676002)(4326008)(478600001)(71200400001)(76116006)(26005)(5660300002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzA1ZitYTEhGbS9iNkUvMDZIZTVXL0FoS1pZLzdSMThuRHBjWDBIN0lKbnVL?=
 =?utf-8?B?QVN6eUtpOXozbEFyd1lYenB0bUMvZk1vQmFtWG5CT3l3WmlURkF2UGhvQ05z?=
 =?utf-8?B?MU90REswVGZvYytKS0UxNStsOFlhcnFKdkFoay9qMWw2RWZHRU1La05pUUFk?=
 =?utf-8?B?aGxhYUg3MHJ3NWdHZU5GN3hTUTBWUDYwVDN2SkpnZnZ6ZWNuMVk3V0hsZVdu?=
 =?utf-8?B?Q1gxdHNmKzkwOG1BYk1JZytqQ0tMbVBwVWUzbjB6anR4a240dlZsbGV2MEVM?=
 =?utf-8?B?dmw1TFNDeDUyczB0RU5CU2hlQVJnNW9YQWhIU1F0OHFmc0wvN2p3VTl1cG9E?=
 =?utf-8?B?eWhXQnl5NEFWTkp2OElRUjlPMXJVVHVGTGIwTzBuSGY1WlpHdlBzUGtBbUlH?=
 =?utf-8?B?SGdxaHRUZXRpTWRCMVJGd3A0WU0vZDZGY0w0RnJLL2pBZUhDMk9NSS9nMDVj?=
 =?utf-8?B?SFg3a2l5R1A4bmVKSE9FUUJxQ1BuUkRtRFB3dHZKV0VBR0lJd0FSZ1VmbDdz?=
 =?utf-8?B?MURzSGlFeEJ0aTd6eHVaYnM3TktvUWFDK21CdHo1OERpWUltZUhBSE5HeG0w?=
 =?utf-8?B?OTNGditzbU9mK3lCT0NxZ0UwOWEzdzdrUk1EYnY2RFgyN0wvczBzc0JCU3JG?=
 =?utf-8?B?cnJTcDVZUDE5N3dKcmZwTkRrZTNYR2VlQXNubHRSOE5rZXF3R1pVc296TnlC?=
 =?utf-8?B?T1FQazZ2cExCRi9RNFhnZ0FuVTJEdVhISGUxY2RQZEM0cEpFRkxBUktsQTlD?=
 =?utf-8?B?THFQSU5DNkNQcmNpeE1Qam5TZkpYQ1R0YUVJWC9qM1BTT0QyWnJmSWRyZFVV?=
 =?utf-8?B?RjJqSmpVUndJVEdkVVAxczhibXJWQVR3eFdZamJnNkNoQzlRcU83eWhZcVRz?=
 =?utf-8?B?RmhtOUZXRUFuOGc5OTR4UDRwVlNWK1Z4SzN6dVE3elluVC9ISkFMamVYdERO?=
 =?utf-8?B?cWtrM3gyNVhrN29FWXBYdWMrT1pMM0p3dmh1N2pLYWR5YzhNdS9KZS9Ma1BP?=
 =?utf-8?B?UjJxQ1VaekVURnA5Q2UyVU1XN0tMRC9GR1l6REFkSE5XakJlZzc0d1hzQXV6?=
 =?utf-8?B?Y3phbWx4R1lEc3lUbTUzWHUzOThvMWxCOHY2V2cya25sRWJoNVMyMmhTUkZF?=
 =?utf-8?B?YnRZK3NqMGFGdFhkMGFWaHFpb3l3dEFFU2xOY1VwSGwvWHNHODE4YzlSdThq?=
 =?utf-8?B?bStjMjYvaUhtSmlNc2N5L0Z0WkdPS3RGUytyUzVWSDJDa0JSTCtEaXNwMjk4?=
 =?utf-8?B?RUh1NkhYbFYrdFpoT3hlN3dwd2xaZm90Z1hGelJGV2RIY2E1WHVzKzRqSUZQ?=
 =?utf-8?B?WDFKU0xKUlVkZTkyR3dLQS9xYVRXNzdUZ1Z1SVNDRnVMeUZxZnJVM040UUk5?=
 =?utf-8?B?S3ExRW8wRFZia2lHblZsU2FTWVdLdnV4bDRpeW9Yblp0MDk5ZGI5M3piVWl1?=
 =?utf-8?B?ZTduL3ZtMU5wbTdkZVdhMHBLK25xVm1rZitTWlp4UGlqcTJleE9JVkY1eWdF?=
 =?utf-8?B?U2xaQW1tZWtvUVl3S0NRRlJkdCtjdWtIaWs0THJnQ0I0NzBuc0NGbWhJeitx?=
 =?utf-8?B?QkR3OVVUelo5ckgvUTFKYmhhendYWUd1MEt6S1BrUzVYei84MXBGOXUvNFhD?=
 =?utf-8?B?Z3FSbHlPRDdOak1oM1NNVmF1cGF1NGh4ejlsU0o0TnlyTEFDdk8vY2RMRld5?=
 =?utf-8?B?NXRpbVRNUVNyb3I2cnRoalJyaHg4K0hjVUN4YnJaR2N1MkZKZjRnRnhEMlR3?=
 =?utf-8?B?SHJ0NXQyakpHZ2ZYWithVVVwTk5WdytXY2RGKytaa3hDTmluRDAxVVhQdFZV?=
 =?utf-8?B?aC9kNnJTNmdBZTd0NzA4WEtVTUFtVGQ4SC9YMU1WdXVveFNRNmhqbTNZSkdQ?=
 =?utf-8?B?dHpVZmJkNS9BMDc4end4Q3NTVGdaSGkyaEd1bVNiZDVwalZKNmxKRlFxa0pv?=
 =?utf-8?B?bzNDdTE3K1BQUy9OL1JLQzF3Vk0vOEJvdWIxbGxlYXpMVys3Um0yM0NLQWZZ?=
 =?utf-8?B?T3ArbXZvVnYxdlluU3F3SVJaTWRvMGcwaWE4QStlTEIzM3lqdlpEVGYycEVE?=
 =?utf-8?B?dVJ6Nm5sbjRWemIwbjR1RzFTeVFSTDNVdXpwS1dXKzQyNXNibnJxcUc0UVQz?=
 =?utf-8?B?TTNlMXlheU96YlVWSTZuQ09Wek9DVGQxcUloZ2JBSXRJRysxZHVhSExDV29h?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a81f76-ecd8-4f33-6853-08dbaa0fa96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 10:47:24.6581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGWmKoKQxtkG8x1qzlVDpGuUWC6651FwLUYAr/WVjMkJC77S4AVapez5xzjtOcBBExrxrmfWDQF82Hmh9aJvBa8OX2B8kgoYRJSUURQWr0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5606
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDQvNF0gZHJt
L2JyaWRnZTogcGFuZWw6IERyb3AgQ09ORklHX09GIGNvbmRpdGlvbmFsDQo+IGFyb3VuZCAqX29m
X2dldF9icmlkZ2UoKQ0KPiANCj4gT24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMDk6MDk6MzhBTSAr
MDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gRHJvcCB1bm5lY2Vzc2FyeSBDT05GSUdfT0YgY29u
ZGl0aW9uYWwgYXJvdW5kIGRldm1fZHJtX29mX2dldF9icmlkZ2UoKQ0KPiA+IGFuZA0KPiA+IGRy
bW1fb2ZfZ2V0X2JyaWRnZSgpIGFzIGl0IGlzIGd1YXJkZWQgd2l0aCAjaWYuLiNlbHNlIGJsb2Nr
cyBpbg0KPiA+IGRybV9icmlkZ2UuaC4NCj4gDQo+IFRoaXMgd2lsbCBpbmNyZWFzZSB0aGUga2Vy
bmVsIHNpemUgb24gbm9uLU9GIHN5c3RlbSwgdG8gYWRkIGZ1bmN0aW9ucyB0aGF0DQo+IGFyZSBu
b3QgdXNlZC4gSSBkb24ndCB0aGluayB0aGUgI2lmZGVmIGhlcmUgaXMgcHJvYmxlbWF0aWMuDQoN
Ck9LIGFncmVlZC4gSSBndWVzcyBmb3IgTk9OLU9GIHN5c3RlbSBpdCB3aWxsIGdpdmUgYnVpbGQg
ZXJyb3INCmZvciBmdW5jdGlvbiByZWRlZmluaXRpb24sIGlmIHRoYXQgaXMgdGhlIGNhc2UgSSB3
b3VsZCBsaWtlIHRvDQpkcm9wIHRoaXMgcGF0Y2guDQoNCnN0YXRpYyBpbmxpbmUgc3RydWN0IGRy
bV9icmlkZ2UgKmRldm1fZHJtX29mX2dldF9icmlkZ2UoKQ0KDQp2cw0KDQpzdHJ1Y3QgZHJtX2Jy
aWRnZSAqZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZSgpDQoNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPiAtLS0NCj4gPiB2NjoNCj4gPiAgKiBOZXcgcGF0Y2guDQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDMgLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvcGFuZWwuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIGluZGV4IDdm
NDE1MjVmN2E2ZS4uOTIyMGExYzIzNjk3DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9wYW5lbC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9w
YW5lbC5jDQo+ID4gQEAgLTQ4Miw3ICs0ODIsNiBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcg0KPiA+
ICpkcm1fcGFuZWxfYnJpZGdlX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKSAg
fQ0KPiA+IEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2JyaWRnZV9jb25uZWN0b3IpOw0KPiA+DQo+
ID4gLSNpZmRlZiBDT05GSUdfT0YNCj4gPiAgLyoqDQo+ID4gICAqIGRldm1fZHJtX29mX2dldF9i
cmlkZ2UgLSBSZXR1cm4gbmV4dCBicmlkZ2UgaW4gdGhlIGNoYWluDQo+ID4gICAqIEBkZXY6IGRl
dmljZSB0byB0aWUgdGhlIGJyaWRnZSBsaWZldGltZSB0byBAQCAtNTUwLDUgKzU0OSwzIEBADQo+
ID4gc3RydWN0IGRybV9icmlkZ2UgKmRybW1fb2ZfZ2V0X2JyaWRnZShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtLA0KPiA+ICAJcmV0dXJuIGJyaWRnZTsNCj4gPiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9M
KGRybW1fb2ZfZ2V0X2JyaWRnZSk7DQo+ID4gLQ0KPiA+IC0jZW5kaWYNCj4gDQo+IC0tDQo+IFJl
Z2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
