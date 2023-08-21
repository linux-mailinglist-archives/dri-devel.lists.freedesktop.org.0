Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F27828DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D868110E096;
	Mon, 21 Aug 2023 12:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAE910E096
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQE/OWl4fb7mgyX8r54qhbgEoU+rLwuVzlztQb+VzugrzJF7wB5QtxIVeszoZHOXUAxK28fHe/nHnEr0d0BBSoSZ1ucd+cVhNZlinjXp1urDSyfFBND+lOmV+E9p6AHmEkQ8DeBFinjVlleMb8VXaFyaxhi75O0fEhau/y0B+31Se6bf2tLMdeArrLm+2ro5zT+t7orjL6NLZSfMOLbTi9/r6tq67PL66RnkTHge95Wmc/BlczZR2GYxw0tAXa//e1X950qjvQOECIqSFOCXHMdQspcrZWcJPJFICNv8R0ejl8lpKheUJzluo/RYOMAztDKlMEcNLAL1OSWFQATTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFCNuoPOz6pnq8RYPec1ONiL2Wc07StWFySohs4aMn4=;
 b=l83s5oG9DLTcB0Bju+m+Shv1e+JMrMPxY8DixOufA30ug0+SaAdgFzMnb4YUYjeFmlLLCJjIuZ5C+HKNFvmp12BCqktGGWoNxzsLrKs//arHbpxU+3UIxyXua4sRsm0gmJ1CJpxPsKjKYuDjUSvq/UGmgNoGU9FSHLu/4wyTegrsceh4mwpF2ebtvCVGeV2EZD6S3h/NPeafSbYWi2ROWfqxXBPgppOYShjbvsiOMUsbW4W4Gd8UGZC1aG0Oohfgyi9k3e0BrBjlusFmY01jrC8urpvr3vIyuCMsQEqjRGZuV32pprVWGuFX5eHucP8POPgFqzAEaLA1H1ZI5bIgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFCNuoPOz6pnq8RYPec1ONiL2Wc07StWFySohs4aMn4=;
 b=IwvhkWvypTlgxvmH+fIvvpqOIbcuXW78eC9uGr8XEiGYNypNY+GzltF9X12edUbsslXv3gbWCkNR8kB+S9qHRB0/wknnca1mc6mS0im8SQBGzOqq3WZJBVsm7iSNji96RcMFfQp7FSmDfgDiQpiwNBTBOUbBC3eXwAtYRIV6Ae8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11668.jpnprd01.prod.outlook.com (2603:1096:400:37a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 12:20:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.025; Mon, 21 Aug 2023
 12:20:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Thread-Topic: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Thread-Index: AQHZzbzsYXkuCHBFJ02/ZQuvljioB6/oe1OAgAEC58CACzfsAIAAAQgg
Date: Mon, 21 Aug 2023 12:20:39 +0000
Message-ID: <OS0PR01MB59227BFDEF59DBB5D6C96109861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
 <20230813172715.GA19398@pendragon.ideasonboard.com>
 <OS0PR01MB592291F889F1BE13981169D78617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230821121254.GC10135@pendragon.ideasonboard.com>
In-Reply-To: <20230821121254.GC10135@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11668:EE_
x-ms-office365-filtering-correlation-id: a08b5304-1a98-4e82-8435-08dba24107dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrYmmYI/ejvLnD5qamfSX72zHqRaul9dJu0cqitYrbj1UJT6ok6ht8R2yAhqVtnzmznAS5dT+SM+4Q7stBz7+7eV0RSpYZJGY4wD6YajuAeQRP3sZmoB+YdYdtB47tmp+Rvy8NzcBlN+8PfvdeWgj+vlZEq3rSdjdHlevZ1/B/0coDD5kC3ukQA+1iD7JRHfAIjHmLkRKGuiJgpXcB91zpX9uEWeWr0lr+U8/nUkQYkKOHmhPEb/BZPYc9fp8BFT5lCo1+dhQG9cp5iVwJGmZvKf7HpO6HapT8c0tBfNfJBqhEtfYp8M5hWOZgdjquSDVspLX9iParjiiX5nUjgbRhzcRJmGEhyII8gUl9iTD6BIOdgagzVyKlwRVCCJgRcTKbYTsHoajolp5uqKN3GHY2brZ0I6cKOjsR7zIuXXP9Kyrw7lwxN3cTirWf33ofMPSWIgsvJT3Q1bTaTxIjWD3/QzEP+o7quzZvKoXtXX2jZgHgdkY5bfTvUYUjQAMu/XJXm6LHVaDh6XTryr3TEPnwTIWbUWJ7Q1eom20iCubevDnuiNvw1x+UNk1Jr2OFIQZ/zayHdOj8DYzbB4C0m5Ppk1v2uiUw1sEaTLW5OS8K0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199024)(1800799009)(186009)(86362001)(76116006)(64756008)(5660300002)(41300700001)(33656002)(66476007)(6916009)(316002)(66946007)(2906002)(66556008)(66446008)(54906003)(966005)(7416002)(8676002)(52536014)(4326008)(8936002)(478600001)(71200400001)(9686003)(38070700005)(7696005)(6506007)(38100700002)(122000001)(26005)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFJGQzRjSlBVRDQvNVpLUTA3VHRwYWlkRERlWXJ5YnU4OWUwblhhOVRtcHlr?=
 =?utf-8?B?dGkwa09JelY5RTkrMkZtUHFPdmk4QXFRb0dRNXdFQkh4TlprM1kyYnJFUDZJ?=
 =?utf-8?B?akhYQmxHcFB6TGk5U0FvS0xWNGp4enhNRFhLS2g4U1JzWVQvakdxNHJTSVhZ?=
 =?utf-8?B?VFNmWTZlMGN4eEJaTENyUmQ0MTN3K2wrQU1wMkhzZkhiTDB2Q3RoejZTb0tH?=
 =?utf-8?B?SWtQT0g0UXVUTGh2TFdLZ1BwUHA2emViempadzF5K2Q0YWtMcHBRRmxRWXAv?=
 =?utf-8?B?VG9ERWlmUFFXNkNiYlNycytkSzdsKzVjcEs1V3dNQkZueHJSTWg0MTNwM3Y2?=
 =?utf-8?B?ZWxZT3ErQUdhckNkbUlJSHJnRFVNaDRwWGVxVDJyb1hVMDRJNG5YRC9mNm5U?=
 =?utf-8?B?Uk9BQTNYZHpwRmJXaWt0b2o5emcvTTBZdXVQQmZ5VHdOaldtbG5EZFN2MkZC?=
 =?utf-8?B?UWVScm44TUUrcHFYeWpvUWV1OTZzQmEreGM1OTlhSmRFK1NmMXFRYjhRaXJH?=
 =?utf-8?B?ZGZXY3ZBcjJNditJZGVyYmliMldESHhpVTgyRHloelozeklqdWQvVjJOeHhk?=
 =?utf-8?B?UzczNC9MN0JzWndFS0gxWmV5bG9lZzNSR0txUmtISEJLcEdpRXEzWDMwUU4w?=
 =?utf-8?B?Uk96QXRBMTkzYndnOEJoU1ZTZE40Zmc3MEJtdjBYNE9vMjlaeVRERTZrekYw?=
 =?utf-8?B?cUhnMkdGRVlPaXpyTFlxVnVkYnlpdmFiNnN2bW94aEgzTkM0TldtaTlidE1u?=
 =?utf-8?B?endXRVJQVWVFZzFBVnZHQXdLQWhXdlBUc0lFS2ExVmxmMit4NTYyQzNhaXl3?=
 =?utf-8?B?QjF2SkdKVEt2bytKbFFZOWRoZ3R4b3ZIMndMQXJiRVNCelZZUUMrUDI3aytC?=
 =?utf-8?B?VFc0azZYWWpmbUhyZjlIV3pZZ3RSam5iMXpteHNJRy9lcXNYSHRPckRIejNP?=
 =?utf-8?B?SG9PSVYybXQ0Z0M1ZFp4UU1HY0JkcmtvV2EwKytYZjF5SGdYck5CNjQ3MlpN?=
 =?utf-8?B?RWo0eFFzZzlTZXdEdFR5Q2oyN2dPZzl3aWpSeFd3WVc4dnY4WTN5bE1LUlhZ?=
 =?utf-8?B?a0dkbXZRUDUyLzZ5TUozSlFGdUp6RTYzaTIxK1J5d1lwbWtRUU9XaUFiRUpP?=
 =?utf-8?B?SDhPMWx5KzF3eXB1Ukg4MGpiVnk3L2hYdHZVSVBVNGtSUEFENzVoeWVBMndi?=
 =?utf-8?B?ejlzNk12N1Z3RElJUmtRM1ZjRU5Zallyc3dXazZjdE5vWUxSZDZaam9nQy9v?=
 =?utf-8?B?OTZMbndXSmg0WXFGUVY0eE9xNXNBVis0RVpOL1NWOHd0Uml6SW00OTdubTEr?=
 =?utf-8?B?aW5RVzl6a3lBOEw4WVdJYkRweGVUQjhaRW5scXQwL0xmTVF6S2VwR2NybE9F?=
 =?utf-8?B?eDkvdmhtNktqMkZEbVcrQkFibTdDSk90L0d2OFR6RlJpR0lpU3ZUMFV0YUly?=
 =?utf-8?B?TVdTbEpQbkdpWEtKZ3BRWVZMalU1OEhtMlBRRSt2NWpYdGZqZ3lnVVBmYTFp?=
 =?utf-8?B?NWtZZGRrSFNLcjM1cTdCMFE4TkY1Z0dYNGhPMzBpNjZmUXR1UDhZMXhoY2FE?=
 =?utf-8?B?NlIzYk52NnVYSGhQSmcyd1M5MllFV0VlUG1OVHF2eHdPaXRpRHcybm56c29r?=
 =?utf-8?B?ZFhnK1QyOVVrc2dDQUFndUpVTnltbWk5ZjBObjBHbFNrT29Yc0tiSTZ2MERS?=
 =?utf-8?B?Y01YMUhNRG5NbjdWaDRqN3JGQW1TdTF4Q1hxNHA1MlVkb0FzMzBWTlNyK0lq?=
 =?utf-8?B?THArMzdqeGgyUnNHTmJFb3lvS0FIYkhtb3NDVER6aTRybVQ3N0N0dE8xc2Y5?=
 =?utf-8?B?cWYwWFNIaW5aOWJybmRFYUxCc3A3c2dDeFR3Q3BmcVhPQ2tMa0oxL2kzOElx?=
 =?utf-8?B?L3BDRXpLditHa2FUSi9pcXJNK0VlZnJramwraFpJR1F5QzJ5aW5tU3NCRk9I?=
 =?utf-8?B?WnpBVHpseE5hWFhMUnZxcTZJNUFZK1JieXltaW1ZcjRBb0k1WjMwaE1NL2tD?=
 =?utf-8?B?TitCYkJmcHZIam1wOUNQUlFyRVplSHBJRGh5OTY5SGNUUWxDV21Sby9JQnlU?=
 =?utf-8?B?S0dlWjV4V3lGMGdOam10b044K3A5RVNKcy81blR0TFFxbVNkMmt5WThQNXpq?=
 =?utf-8?B?T0JGUk5IRDdwZ3dQMW1VeDFyQ0FzWUdlS2JPTHpPSDlYWHhHMlRKZHFiYmM0?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08b5304-1a98-4e82-8435-08dba24107dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 12:20:39.1354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScwbS0rKE2/525JfExS+SNZRdzA9osZJUfod6POCqkYDVjh6SH1G6mALcKdfVPA45QSWmRp9Q9hu8DJB7SHZfh/OmAhhVDduhe+fFCTS5P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11668
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
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtOiBicmlkZ2U6IGl0NjYxMjE6IEV4dGVuZCBtYXRjaCBzdXBw
b3J0IGZvciBPRg0KPiB0YWJsZXMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEF1ZyAx
NCwgMjAyMyBhdCAwOTowNjo0NkFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBMYXVy
ZW50IFBpbmNoYXJ0LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4NCj4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybTogYnJpZGdlOiBpdDY2MTIxOiBFeHRlbmQgbWF0
Y2ggc3VwcG9ydCBmb3INCj4gPiA+IE9GIHRhYmxlcw0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+
ID4gPg0KPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+ID4gPg0KPiA+ID4gT24gU3Vu
LCBBdWcgMTMsIDIwMjMgYXQgMDk6MDU6MjBBTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4g
PiA+IFRoZSBkcml2ZXIgaGFzIE9GIG1hdGNoIHRhYmxlLCBzdGlsbCBpdCB1c2VzIElEIGxvb2t1
cCB0YWJsZSBmb3INCj4gPiA+ID4gcmV0cmlldmluZyBtYXRjaCBkYXRhLiBSZXBsYWNlIElEIGxv
b2sgdXAgd2l0aA0KPiA+ID4gPiBpMmNfZ2V0X21hdGNoX2RhdGEoKSBmb3IgcmV0cmlldmluZyBP
Ri9BQ1BJL0kyQyBtYXRjaCBkYXRhIGJ5DQo+ID4gPiA+IGFkZGluZyBzaW1pbGFyIG1hdGNoIGRh
dGEgZm9yIE9GIHRhYmxlLg0KPiA+ID4NCj4gPiA+IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgKndoeSogdGhpcyBpcyBkZXNpcmVkID8NCj4gPg0KPiA+IEN1
cnJlbnRseSB0aGUgZHJpdmVyIGlzIHdvcmtpbmcgb24gdGhlIGFzc3VtcHRpb24gdGhhdCBhIEky
QyBkZXZpY2UNCj4gPiByZWdpc3RlcmVkIHZpYSBPRiB3aWxsIGFsd2F5cyBtYXRjaCBhIGxlZ2Fj
eSBJMkMgZGV2aWNlIElELiBUaGUNCj4gPiBjb3JyZWN0IGFwcHJvYWNoIGlzIHRvIGhhdmUgYW4g
T0YgZGV2aWNlIElEIHRhYmxlIHVzaW5nDQo+ID4gb2ZfZGV2aWNlX21hdGNoX2RhdGEoKS9kZXZp
Y2VfbWF0Y2hfZGF0YSgpLw0KPiA+IEkyY19nZXRfbWF0Y2hfZGF0YSgpIGlmIHRoZSBkZXZpY2Vz
IGFyZSByZWdpc3RlcmVkIHZpYSBPRi4NCj4gPg0KPiA+IEJhc2ljYWxseSwgaXQgaXMgZml4aW5n
DQo+ID4NCj4gPiBGaXhlczogOWE5ZjRhMDFiZGFlICgiZHJtOiBicmlkZ2U6IGl0NjYxMjE6IE1v
dmUgVklEL1BJRCB0byBuZXcNCj4gPiBpdDY2MTIxX2NoaXBfaW5mbyBzdHJ1Y3R1cmUiKQ0KPiA+
DQo+ID4gQnV0IGkyY19nZXRfbWF0Y2hfZGF0YSgpIGlzIHJlY2VudGx5IGludHJvZHVjZWQuDQo+
IA0KPiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gQ291bGQgeW91IHJlY29yZCB0aGlzIGlu
IHRoZSBjb21taXQgbWVzc2FnZSAoaWYNCj4gbm90IGRvbmUgYWxyZWFkeSkgPw0KPiANCj4gSXQg
d291bGQgYmUgcmVhbGx5IG5pY2UgaWYgd2UgY291bGQgZHJvcCB0aGUgaTJjX2RldmljZV9pZC4u
Lg0KDQpUaGUgYWJvdmUgc3VnZ2VzdGlvbnMgYXJlIHRha2VuIGNhcmUgaW4gc3Vic2VxdWVudCB2
ZXJzaW9uIFsxXQ0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1z
b2MvMjAyMzA4MTgxOTE4MTcuMzQwMzYwLTEtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vVC8j
dA0KDQoNCj4gDQo+ID4gTWF5YmUgb25lIHBhdGNoIHdpdGggZml4ZXMgdGFnIHVzaW5nIG9mX2Rl
dmljZV9nZXRfbWF0Y2hfZGF0YSBhbmQgSUQNCj4gPiBsb29rdXAgZm9yIHJldHJpZXZpbmcgbWF0
Y2ggZGF0YSBmcm9tIE9GL0kyQyB0YWJsZXMNCj4gPg0KPiA+IGFuZCBhbm90aGVyIHBhdGNoIHRv
IHNpbXBsaWZ5IHVzaW5nIGkyY19nZXRfbWF0Y2hfZGF0YSgpIGJ5IHJlcGxhY2luZw0KPiA+IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSBhbmQgSUQgbG9va3VwLg0KPiANCj4gSSdtIGZpbmUgd2l0
aCBhIHNpbmdsZSBwYXRjaC4NCg0KQXJlIHlvdSBvayB3aXRoIFsxXSBvciB3YW50IHRvIHNxdWFz
aCB3aXRoIHNpbmdsZSBwYXRjaD8NCg0KUGxlYXNlIGxldCBtZSBrbm93Lg0KDQpDaGVlcnMsDQpC
aWp1DQoNCj4gDQo+ID4gPiA+IFdoaWxlIGF0IGl0LCBkcm9wIHVudXNlZCBsb2NhbCB2YXJpYmFs
ZSBpZCBmcm9tIHByb2JlKCkuDQo+ID4gPg0KPiA+ID4gSSdkIGRyb3AgdGhpcyBzZW50ZW5jZSwg
dGhhdCdzIG5vdCBhICJ3aGlsZSBhdCBpdCIgY2hhbmdlIGJ1dCBhbg0KPiA+ID4gaW50ZWdyYWwg
cGFydCBvZiB0aGlzIHBhdGNoLg0KPiA+DQo+ID4gQWdyZWVkLg0KPiA+DQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4g
LS0tDQo+ID4gPiA+ICBUaGlzIHBhdGNoIGlzIG9ubHkgY29tcGlsZSB0ZXN0ZWQuDQo+ID4gPiA+
IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NjEyMS5jIHwgMTcg
KysrKysrKystLS0tLS0tLS0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY2MTIxLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2l0ZS1pdDY2MTIxLmMNCj4gPiA+ID4gaW5kZXggNDY2NjQxYzc3ZmU5Li5hODAyNDZl
ZjRmZmUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0
NjYxMjEuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY2MTIx
LmMNCj4gPiA+ID4gQEAgLTE1MDEsNyArMTUwMSw2IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3QgaXQ2NjEyMV9zdXBwbGllc1tdDQo+ID4gPiA+ID0gew0KPiA+ID4gPg0KPiA+ID4gPiAgc3Rh
dGljIGludCBpdDY2MTIxX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpICB7DQo+ID4g
PiA+IC0JY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkID0NCj4gaTJjX2NsaWVudF9nZXRf
ZGV2aWNlX2lkKGNsaWVudCk7DQo+ID4gPiA+ICAJdTMyIHJldmlzaW9uX2lkLCB2ZW5kb3JfaWRz
WzJdID0geyAwIH0sIGRldmljZV9pZHNbMl0gPSB7IDAgfTsNCj4gPiA+ID4gIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKmVwOw0KPiA+ID4gPiAgCWludCByZXQ7DQo+ID4gPiA+IEBAIC0xNTIzLDcgKzE1
MjIsNyBAQCBzdGF0aWMgaW50IGl0NjYxMjFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiA+
ID4gKmNsaWVudCkNCj4gPiA+ID4NCj4gPiA+ID4gIAljdHgtPmRldiA9IGRldjsNCj4gPiA+ID4g
IAljdHgtPmNsaWVudCA9IGNsaWVudDsNCj4gPiA+ID4gLQljdHgtPmluZm8gPSAoY29uc3Qgc3Ry
dWN0IGl0NjYxMjFfY2hpcF9pbmZvICopIGlkLQ0KPiA+ZHJpdmVyX2RhdGE7DQo+ID4gPiA+ICsJ
Y3R4LT5pbmZvID0gaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVudCk7DQo+ID4gPiA+DQo+ID4gPiA+
ICAJb2ZfcHJvcGVydHlfcmVhZF91MzIoZXAsICJidXMtd2lkdGgiLCAmY3R4LT5idXNfd2lkdGgp
Ow0KPiA+ID4gPiAgCW9mX25vZGVfcHV0KGVwKTsNCj4gPiA+ID4gQEAgLTE2MDksMTMgKzE2MDgs
NiBAQCBzdGF0aWMgdm9pZCBpdDY2MTIxX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xp
ZW50KQ0KPiA+ID4gPiAgCW11dGV4X2Rlc3Ryb3koJmN0eC0+bG9jayk7DQo+ID4gPiA+ICB9DQo+
ID4gPiA+DQo+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBpdDY2MTIx
X2R0X21hdGNoW10gPSB7DQo+ID4gPiA+IC0JeyAuY29tcGF0aWJsZSA9ICJpdGUsaXQ2NjEyMSIg
fSwNCj4gPiA+ID4gLQl7IC5jb21wYXRpYmxlID0gIml0ZSxpdDY2MTAiIH0sDQo+ID4gPiA+IC0J
eyB9DQo+ID4gPiA+IC19Ow0KPiA+ID4gPiAtTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgaXQ2NjEy
MV9kdF9tYXRjaCk7DQo+ID4gPiA+IC0NCj4gPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXQ2
NjEyMV9jaGlwX2luZm8gaXQ2NjEyMV9jaGlwX2luZm8gPSB7DQo+ID4gPiA+ICAJLmlkID0gSURf
SVQ2NjEyMSwNCj4gPiA+ID4gIAkudmlkID0gMHg0OTU0LA0KPiA+ID4gPiBAQCAtMTYyOCw2ICsx
NjIwLDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXQ2NjEyMV9jaGlwX2luZm8NCj4gaXQ2NjEw
X2NoaXBfaW5mbyA9IHsNCj4gPiA+ID4gIAkucGlkID0gMHgwNjExLA0KPiA+ID4gPiAgfTsNCj4g
PiA+ID4NCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGl0NjYxMjFf
ZHRfbWF0Y2hbXSA9IHsNCj4gPiA+ID4gKwl7IC5jb21wYXRpYmxlID0gIml0ZSxpdDY2MTIxIiwg
Jml0NjYxMjFfY2hpcF9pbmZvIH0sDQo+ID4gPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJpdGUsaXQ2
NjEwIiwgJml0NjYxMF9jaGlwX2luZm8gfSwNCj4gPiA+ID4gKwl7IH0NCj4gPiA+ID4gK307DQo+
ID4gPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBpdDY2MTIxX2R0X21hdGNoKTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGl0NjYxMjFf
aWRbXSA9IHsNCj4gPiA+ID4gIAl7ICJpdDY2MTIxIiwgKGtlcm5lbF91bG9uZ190KSAmaXQ2NjEy
MV9jaGlwX2luZm8gfSwNCj4gPiA+ID4gIAl7ICJpdDY2MTAiLCAoa2VybmVsX3Vsb25nX3QpICZp
dDY2MTBfY2hpcF9pbmZvIH0sDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQ
aW5jaGFydA0K
