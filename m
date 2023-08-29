Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BA78C83D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C6F10E38B;
	Tue, 29 Aug 2023 15:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B034310E38B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 15:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1V99MZp71bvVs02dcL5kNNMRRm67s5rrKJaSdls1D+uoCenPxP/x18v1MAxSDx2EZySgJxoJ3xDPATAyxldvr9LUV0SS5w4GxsFGc5zGC1aJyP0ULOw4Nq3u5SfL19iiLTvQ349Ut8OAQC5Yg3l1dJ3qhmjiNG8IX8ENnAb/kbl7AfV2t2mWdRpnXBmVZY1aBM3vyGmy+7odUroCFEeIVC+/h1yS7dC+nZjGQaKdm51UQ/6J3diRMFR+VU3Op+u6N10zO2w4qyggu6IU//owL/W0DI5M1wtJ9uUKvUkzxfPkp4bYVhn8Ofed9pLfHWKzxICmfgrchVo00bW5GSAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knj1+vGRgUnX4HLtUD1ULGbGvqa802A5B/bXDlYn72g=;
 b=I3x3msFwm3136bNJUdso4YR9kvJZI4UdFtxtUrMYsr4sP60jrLi9BbNeq+f2NzdLUMkFO5f/Pkaky+072cVeF3YhlRb7GOhVxASIQ1Fv04rCT3jfF5dZDAQDPnET13RqqrHhK27xbVoQg7g+phcwMtHevB7DOlsSdmKX0JCaljzk83sMYiI4Yp63GhEr2HKKQvjyvL+zMJgHV7WloSR4ujE9tCHhtO2RAK65RhZP/WDWPPFHVxkj0mIlRh9LoBfiNtPhaJuKZAXubsBaZvByZD3SaMrko8Fvv9a7EsCr+L9IomeywUnc8Rgyz5Reae/Bv7UrxXsmA3sM240omwwPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knj1+vGRgUnX4HLtUD1ULGbGvqa802A5B/bXDlYn72g=;
 b=VflZ8HX7/rBszMUifYCtPi5pPDNVxNzUVY9Ha6NchSc207n06qQAeHGdObFg+iDSUDRWIYVQTeN2stPAUsrlnL63DHv1om8/eUCrttK2VkSrJAbQum1nOCr1P+K/QkD3RC0O9SbJ50GG4xFFx1Iop2QerDZefp3HznM/EFBJcig=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11636.jpnprd01.prod.outlook.com (2603:1096:400:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 15:03:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 15:03:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Thread-Topic: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Thread-Index: AQHZ1+2kyFVGgHROc0yoLQTHF3HZpK//lTMAgAHOxLA=
Date: Tue, 29 Aug 2023 15:03:54 +0000
Message-ID: <OS0PR01MB59222DD0D71ECA25FA45A70086E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
 <20230828112646.GI14596@pendragon.ideasonboard.com>
In-Reply-To: <20230828112646.GI14596@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11636:EE_
x-ms-office365-filtering-correlation-id: 3528f8b7-23cf-4189-0afe-08dba8a129c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YMACSBCge/sriPmQ6mnthZVe5V6msCjvKMIFvOQPSlSThUJwSjQ1OqKr4YhWs3hLT5F67SrYlGhtFlKzh3/+H3dxHyr82z7GwyJpwtwiVXYYVZ+LnEolV8AeCw1e+AoEwzezT1SHnN3OJ8VQZ1JrmiYmTZPbhetGDcwwWYiLwGH5G3dhcWjSIIO4nT6/6u+ypt2nRg71gFMR8Qc9ShSY7ts1lBMCvJnby15JhCAT5Il0RkmQnEHrALN6pcnEV9xXzI5DTLeZlY79FFm0KU+ojrMbAk8XM8oz7EP15keFX/20SdGaYl3uhYs9Jd7/H7iZb0T6uJ8Sn08zpdN3ly6IL+8uybSqMwajCnT+DfZSwENx262J+pF4iJa+5bGczXkjmdZ3nrNSzI8PAS+Bno0oHWKw1ZqQknXAY52j3KoYgD6ME1mq0BkgkSv5T9Ph9ADX5q8Cp84mPKyQ0hi6A4ftMU4inMdjwWIkuIG7P8cLs5XMNF2kFQy7JYOQhobeSoDwUwheToWQabnTK7QhCeG5mRR++ZZzZ/jymuptKNB1FopmcFcj1AlJYJhu0IQSGOoZGk6h0B+Rt1Axgi3UOXeBw4PRYoBlJIC88TSEHR+wdRolOygwQllFiyo1t6jUPJak
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(186009)(1800799009)(451199024)(9686003)(6506007)(7696005)(71200400001)(83380400001)(478600001)(76116006)(2906002)(7416002)(66446008)(54906003)(6916009)(64756008)(316002)(66946007)(66476007)(66556008)(52536014)(8936002)(41300700001)(5660300002)(8676002)(4326008)(33656002)(38070700005)(38100700002)(86362001)(55016003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG9aTGFQdUp2amNPVGl1VHBsK1RjY1lIRE9mVGZYcVlHaVRUeW5TcWRzSWls?=
 =?utf-8?B?bCtBY3Z4bGNydTlmRDRJQWNNS3l1cTB0MnlYT3lVcVFnREFIRUQ4TUVnem81?=
 =?utf-8?B?ZHcrL291ZWdGQVBRc0ZCY0ZjalpCSzdpenRta0V0NGdWVWFSSWpIWDlCK2s2?=
 =?utf-8?B?TVJSNWgyOHBlZFMwRWt1bHV6Ulc5QlRqREdjSHVieXowL2piSVRkcDljUE9S?=
 =?utf-8?B?d1docGFmTFVqb2V6blM5bmFPNXljSy9Rb1pNWk9WNkpQeExidkpSejJKdm9V?=
 =?utf-8?B?L2RyTUg2R0ZqcVlKRXBPNXY0K0RSS0VJeHE5NDR0d2xHamg1cWtLa21CUnp0?=
 =?utf-8?B?bGRtb09GTkp0b0NyVlNhUGNpRE0yUnNpWTZaam1BN1hjQm4wNHBnWEl0RVEy?=
 =?utf-8?B?TVFxMEROTEdGNjgzaUVxNjlmeElhSnl0Z3JDSldnSDVIRVR4TXZCS2lZMklv?=
 =?utf-8?B?RUhuOEtocm1LSDhKN1AySitCNFcxSEYyNnlwV25ZeWZUdGt4b1BpY2Z3b3Uy?=
 =?utf-8?B?bll4MXhsYjU3SmdCNnB2aHRneTJpZVhHZWw2NkpwWTRqNXhJcjV4ajNPT3Rj?=
 =?utf-8?B?QlVLdDJ3OFd6aWRXRndyNWNPNTdPSnVqOWdhQit0T0tJU2gzdzUxdERJaExT?=
 =?utf-8?B?RWU0MXBOVTlCLy83aWcxczY4VitrVmxTN29mTXRZYnZnd29mVWI2RHdHaUF3?=
 =?utf-8?B?dm5wbUdRRDVKSWJZY2lydXhvcGdwQ1IvRUMwei9zSzl5OFlXMmVkTnhrNUF0?=
 =?utf-8?B?QjZ1cUNzZzhZRVhzVTJ4RURjSU5QM2RlUlpWdThMbVRPMjc3Mm9kNGhKa21Z?=
 =?utf-8?B?ZE55Z2RQTFdVSHVsOFc1V3VVeFkwZVphOXlhc3RBbjBoSlhiQ24wVHpid1lW?=
 =?utf-8?B?bUxTUm42TkhFVnYreGlyZ0IySWt2ZklCL2hDcFAzTkc2aWp3b2FvdGR5VVJh?=
 =?utf-8?B?dXJCWldRMys0T0pZbW9vOFlGUk0vcEQ4T01LQkh3eTVhYS9KdGtOS2F1akNx?=
 =?utf-8?B?b2RBK20wd2daQjUvOVBtRm9KM2pLZittVmhuK2VoT05FNTR1NFFMTWVRSEpj?=
 =?utf-8?B?SkQxMzNSb2xHM1Nsenl0VlNWcUo3MFptSXZ0SUtNSlIwMkxZUzFsMWdCVllL?=
 =?utf-8?B?bk96aktKTDdtNnIzaEI0TitJd2V5eFhUL21acXFhNVRJZ3U3WkhZU2NRNGZK?=
 =?utf-8?B?b3hoUHc4N0pWMEpwc244TFJDd0tyMlJYNHN1Rmd6aXlkQ1YvY1hUZ3pkUmdy?=
 =?utf-8?B?eUUwcklmZzliYVVOS1NKMTVTc1RuS210cU5HZW9WT3JGNm9WcE54NDl5TTRw?=
 =?utf-8?B?d2UwNm1BVWtoOUU0QmFvR1F3M2VYU1JXeWVYZ3RUTlNXOVp6d1hwWWhjTUtM?=
 =?utf-8?B?ODhXdnBma2VnTVhocU1YUEVtZzZxc21rUStBUDYrUWxZQUY5dUFGcS9ZM25K?=
 =?utf-8?B?MXRZVXNFeWR1eTh5NEJCM3pqTkJVVTQ2NDM2NksxR09HYUNrZkpSd1Q2cGxU?=
 =?utf-8?B?dHJCSjU3VW9QODR4dDlTWTFyL1JwRVhIZUo2ZjRQbDFzQkY1WUdDTXlaL3Jo?=
 =?utf-8?B?ZDBwdUNMVFhYcER5aDN5MXYyVTFBdFFKYmwvd0FWWmdXR2k2eU1yQTFvRllz?=
 =?utf-8?B?SzFMR1dIUVJSaGVQc2ZiaVc5MzRma2RpUFlITVFpeGJWU2ZOQWFBdi9WTjVZ?=
 =?utf-8?B?bHNmOFhsUmp2Y2dCOUZZNG01eWMvLytzV0pianlQRDlnMmo2VkVxcTBkaVFH?=
 =?utf-8?B?WUViUmN6TEdjR3p5YnNWcFBNYjU3NVlHUGxHMithT1g4RnpGTDVyRDJYTFBC?=
 =?utf-8?B?QVFucEZUMzVZUUozbHV2M0NHa0xFOGVSRzZ2V3lKNDNpNExEM1IxR3BFVE9k?=
 =?utf-8?B?QVg1M0VERXFWWlNsVEdpZ1dPOHpvakt0SE1MV0NrenNYQW02SFN0VkpnRVBM?=
 =?utf-8?B?QkFzbExadzZSNWpwRUZGUHlYMDNESENUc1VNUlZ6c2t6eWZzNStYanFnN3Y3?=
 =?utf-8?B?SEpmNkx3KzhoTnNrWHFpN3loMVF2UXA2NXVzU1FUNHgzYlJqQmJEMlNCQjdu?=
 =?utf-8?B?bW1TZ0tzWm1CbFYyYnFBQ1RYdWs5Ymw4aHIyMVphaWp1VlZNMGVFaWZtODZJ?=
 =?utf-8?Q?fLtE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3528f8b7-23cf-4189-0afe-08dba8a129c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 15:03:54.6666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWp82qDjlrbDS+zZCSFTG8lIPAHbemaqVZ1hSwPcy+e+9qygdrWzQIVmqJskaY1gFela6XdzF3iRkNi7Q65tX1DIfIWiBtc+/tlyWcTk6t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11636
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDIvMl0gZHJt
L2JyaWRnZTogRHJvcCBjb25kaXRpb25hbHMgYXJvdW5kIG9mX25vZGUNCj4gcG9pbnRlcnMNCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFNh
dCwgQXVnIDI2LCAyMDIzIGF0IDA4OjE5OjAxQU0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+
IEhhdmluZyBjb25kaXRpb25hbCBhcm91bmQgdGhlIG9mX25vZGUgcG9pbnRlcnMgdHVybnMgb3V0
IHRvIG1ha2UNCj4gPiBkcml2ZXIgY29kZSB1c2UgdWdseSAjaWZkZWYgYW5kICNpZiBibG9ja3Mu
IFNvIGRyb3AgdGhlIGNvbmRpdGlvbmFscy4NCj4gPg0KPiA+IFN1Z2dlc3RlZC1ieTogRG91Z2xh
cyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NDoNCj4g
PiAgKiBOZXcgcGF0Y2gNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeC1hbng3OHh4LmMgfCAyIC0tDQo+ID4gIGluY2x1ZGUvZHJtL2RybV9icmlk
Z2UuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAtLQ0KPiANCj4gVGhpcyBzaG91bGQg
YmUgc3BsaXQgaW4gdHdvIHBhdGNoZXMsIG9uZSBhZGRyZXNzaW5nIGRybV9icmlkZ2UuaCAoYW5k
DQo+IGxpa2VseSByZWZlcmVuY2luZyB0aGUgY29tbWl0IHRoYXQgZHJvcHBlZCB0aGUgY29uZGl0
aW9uYWxzIGluIHN0cnVjdA0KPiBkZXZpY2UsIGFzIG1lbnRpb25lZCBieSBEb3VnKSwgYW5kIG9u
ZSBmb3IgdGhlIGRyaXZlcnMuDQoNCk9LLCB3aWxsIGNyZWF0ZSAyIHBhdGNoZXMuDQoNCkNoZWVy
cywNCkJpanUNCg0KPiANCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXgtYW54Nzh4eC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxv
Z2l4LWFueDc4eHguYw0KPiA+IGluZGV4IDYxNjlkYjczZDJmZS4uYWQ4MjQxNzU4ODk2IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54
Nzh4eC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eC1hbng3OHh4LmMNCj4gPiBAQCAtMTIzMSw5ICsxMjMxLDcgQEAgc3RhdGljIGludCBhbng3OHh4
X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpDQo+ID4NCj4gPiAgCW11
dGV4X2luaXQoJmFueDc4eHgtPmxvY2spOw0KPiA+DQo+ID4gLSNpZiBJU19FTkFCTEVEKENPTkZJ
R19PRikNCj4gPiAgCWFueDc4eHgtPmJyaWRnZS5vZl9ub2RlID0gY2xpZW50LT5kZXYub2Zfbm9k
ZTsgLSNlbmRpZg0KPiA+DQo+ID4gIAlhbng3OHh4LT5jbGllbnQgPSBjbGllbnQ7DQo+ID4gIAlp
MmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBhbng3OHh4KTsgZGlmZiAtLWdpdA0KPiA+IGEvaW5j
bHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGluZGV4DQo+
ID4gYzMzOWZjODVmZDA3Li5kNDlkNWMwM2RmM2UgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2JyaWRnZS5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oDQo+ID4g
QEAgLTcxNiwxMCArNzE2LDggQEAgc3RydWN0IGRybV9icmlkZ2Ugew0KPiA+ICAJc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyOw0KPiA+ICAJLyoqIEBjaGFpbl9ub2RlOiB1c2VkIHRvIGZvcm0g
YSBicmlkZ2UgY2hhaW4gKi8NCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQgY2hhaW5fbm9kZTsNCj4g
PiAtI2lmZGVmIENPTkZJR19PRg0KPiA+ICAJLyoqIEBvZl9ub2RlOiBkZXZpY2Ugbm9kZSBwb2lu
dGVyIHRvIHRoZSBicmlkZ2UgKi8NCj4gPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZTsN
Cj4gPiAtI2VuZGlmDQo+ID4gIAkvKiogQGxpc3Q6IHRvIGtlZXAgdHJhY2sgb2YgYWxsIGFkZGVk
IGJyaWRnZXMgKi8NCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4gPiAgCS8qKg0KPiAN
Cj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
