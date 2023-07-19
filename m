Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF88759060
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4068310E429;
	Wed, 19 Jul 2023 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5F10E429
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maMQ4mwN0IRy+1zHfxScf/1k89a6/5gsC0jq5mCAf1YjgpTaGhNIPChVk0BDlyvQfFDZnWXMtIUKF/I9CMU6T5MH7QvjrkE+Jqb+mTpJWfO3ZrTen/99x7AV6hWap8ZNcFGm/qpQnkGTMEwkwv6s0isUjauh1dDCtFYUIESN9r4GulzQil3c5WoonliJLIfI6lZ0jTudhB209jnWzftDre++e9CRikYixuI1+76dFA0lS/ZOIAGUtnvak7vVUfUUdhjvErdXjTm2KG4XnexfE4kytd3a5DfYDbI0jWMyTiqbO5gGJMPRPaqTHRlu9qOM6qUdw6aiM65Nt8wadVgu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wgN/xhlPnT4ZfB8d5B1ySMYMQijAcCxgCLB9qkQpDM=;
 b=Qp6rLicQIm4NWvV1E9p4ay2M8Y1sDsQf4ujLjr+BuDrz8Ml5v+OmoTj5A2V06bV40mNyZu68OJplBdmf1o1OxWVuoL0Sb7cRyzFxRb4U7/mPKNxoaR08OcQNihrJKUqMJJaKqEXIMnnp4u+0EfoQJ7zM836a2FXHqbH75asx9BgCmY0pwix2lgz+1/agcE25afQF9PZHF4uGN85Wau5Iw2o7kkfT4Z1ncrcZuz1lm3UIpVsgujeVigjlQEjIfBku0Jdsx6K7vWcz2fGjJcIppv5Qu/kQe0lJX3UHHOeVcve5UTlUgM3bpt624RZGc45Bs3RpRJ4maDu7+frRdGa7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wgN/xhlPnT4ZfB8d5B1ySMYMQijAcCxgCLB9qkQpDM=;
 b=DQmQVkRRexKRkmXQeC5+oHjdm9YBJ2gBjqBIkhJHNERAVUKxqmfMZiRj6iM4QBki+1nQw2s0qYOEC7R41JGP4p9cmI6cGHIx+QFRpUOF2V/CXE84ZzJ71PzdL/phlFTABt5qfEFQqbCGum+OHTQeQ7kZOpy14LeBNxUnHIa5J8M=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 08:35:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 08:35:02 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: RE: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHX2kU9tVwb+/k68aHvm3zH4HK+9gzeAgAFOwzCAAHNXgIAAALpwgAAUdQCAAWBSkA==
Date: Wed, 19 Jul 2023 08:35:02 +0000
Message-ID: <AM7PR04MB7046B44596C4C331D01F88479839A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
 <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
 <AM7PR04MB7046BF03266ED1CE21CFC3A99838A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <CAMty3ZDy7Ty2AUV+Ab60nvgBzyLB-ejM=Yij9RFyTNvJBG_EvA@mail.gmail.com>
 <DB8PR04MB7051B5AB0D57BCEF2FBEBAE99838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
 <CAMty3ZDBSwxFZM0FE2ytvvQ0PXU9WNyWwvd_DOrKpe43HH2x+w@mail.gmail.com>
In-Reply-To: <CAMty3ZDBSwxFZM0FE2ytvvQ0PXU9WNyWwvd_DOrKpe43HH2x+w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|VE1PR04MB7421:EE_
x-ms-office365-filtering-correlation-id: 473dd86b-b4c5-4be6-4e18-08db88330bc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Wxx/3TWV/0O3zu98kZi7kQfIiWIg31pmCWokaXalglaiWOkFj3TwepZAtbPyNtThzyVSM74CrxNB1H4CZR4QMVJ7taCPbNGRTenwTg0Dh8s1zKQ+Cv627WYfEwuOlqVAILPDpsM/JSVcQp9NlgSPxMvrmYv7ZuOCELQyUj7oYajgiipJGftn9bzoxX3w/O0rMWxCXHPpLSMrRElAsPcFzO3gn0LPCPqJ4xJTBHP2F6aSBdtm2H0BXrAYyJ+5IDAMyGAgbDpDE2UjpwGI2A2AkTy9hwYBN/uYiBovZmDc6NTmI6O0fCoiexXU759L8kMDqiECe7vTwEkKVNKciN+gaWd8DQuxxuF44sdBObcHWRJ2Y2Zr5LO3bIjPZCwJxq+W1+M8JAkoS6O2fDYZyJyzQvhEdHTrLdGd976TVnYolZJdpUyKrpeKzUQvi/f3AeI+hFHxvsNj7RMmc4icvo5xLP6yNz1SD4CEjZeDVhcdlJa+6+k/f84180SVRWS+YxgyjoQqKdJaSBrUcFKoM9C05F6+872GB8i3YacEItSdrAwoKnHKUMksMNkda4Nlbv89Or9hYSSxiUBWdzwtpJzrysNrFso4J/1JEVCPfN5VYcv/lWG3u4pJnzybp+jhBJE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(53546011)(6506007)(26005)(9686003)(55016003)(54906003)(38100700002)(122000001)(38070700005)(7416002)(52536014)(76116006)(5660300002)(2906002)(86362001)(4326008)(316002)(6916009)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(33656002)(8936002)(8676002)(7696005)(71200400001)(478600001)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW9Xdk1UajdIaW4vZ1lHRzlyQ28zN3N0UVc3S0ttcnRYM2ljUWF6NVVqcTV3?=
 =?utf-8?B?TVNZcGQzMW1YZjZHU1NldUVUZ29UaERkOE1FK29DMFBXSkFSUlVVTmxSZTl2?=
 =?utf-8?B?cmJqOE91bldncHNFZ3k2bXRnMHdQUTVCR3RoU0FjbGttUHBySWZBUlNuTFM4?=
 =?utf-8?B?c3hwUVZrcFdqdldITDkrZG1xVU1sdzh1RkI4OHB4eFZTR3pWQ1FhdUtIZkRs?=
 =?utf-8?B?d0ZqcmM2NG5DLzhTREkwZDZYeXl4eWp0a3JtOHA5ZGhhYWIyTHBDckc3ZERL?=
 =?utf-8?B?VFRBZkxJMmRUWk1TREFjTGJCWHNFZVFZdEVuTS9meVJiS28rMWZ6cVgvZjNI?=
 =?utf-8?B?TngxcXBOMXdUakNJMDdjQWlZQ0RjM2lDYXg4dVZ0VThxRG1XSlNTN3VpWG1O?=
 =?utf-8?B?dDBmdzU3UmNvTkpTOW9la3J6eEFsM3lIRktudDgzZWpEZEpINWk0Q3gwUHd2?=
 =?utf-8?B?WDNtOWFyTms4UUhLZ0p2NzJBbEtQYndod004VlJLdDF3ZjNvaENTTHBUdk5k?=
 =?utf-8?B?V3d5QXlJWmtjSVhXVHdCVFV3VlN6MDVvb3hTYk4wM0FnWGluaVc0OU5uVEMr?=
 =?utf-8?B?Tzl4T1M1c2MvMDhPTXU5NnR2VmhLRDVvSUtPZlI3cmFpNHdLR1hNS1hGSE93?=
 =?utf-8?B?ZWNGc0RiMEFybmtrTHFmbG9lL3pBZ2pHMFVqVU5xQUd2SVF1Y3hNQzZVS1dU?=
 =?utf-8?B?dDNTNFZEL3MxVTFzZk5VV1p1NWJqNy9XdUQ5b091SERMZWdJTXFvVkx5Yk5w?=
 =?utf-8?B?QW1PZVNieEpDS1JTYlpZREJma0pEa2lCZDF2TlNqL0V5SXNrZ2hhNTRxSmpj?=
 =?utf-8?B?ZVMxd0J2YmhXblRXZG5CeThVSHJqc0k1bHhrM0I1TnlEaHBtYUUxc3VKSy9q?=
 =?utf-8?B?VXB1RngvME85YTNQSzgxQlZBcXJZb3d3M3doYVBpbjVOSUlPT2pBemlXaCtM?=
 =?utf-8?B?NmtQZHJqamgvMXNrdjBkb1QwaEpITi8vUFVwNm9lRTFNaGo3MG1VVjVMdlNs?=
 =?utf-8?B?Z2grc1QvOEFHcmY2WmNSek9WSFJRbG56MWpTTm5vaHZENjNVMmhsODl4RnVx?=
 =?utf-8?B?OEdCL0NnZjV2TjNkT1VzYWtIaUxyVkdqTFJXeFZwMXZTaFhhUk54V25HSGlz?=
 =?utf-8?B?L0Zsa001bTJqMkw0YjJDUy9SOHlnZVRmcjhENndiSHR6WURHWDlFanplTXZE?=
 =?utf-8?B?b2FuTlpXZzVTYlRicWdJWHRZU3B5VjlEL0l1eHJYV2tVTjd0YnoyUWlTbjRV?=
 =?utf-8?B?c1liNS8rMzB2b3k1Ui9tSlRPWmFNZCsrWEhqTGlZRmJIaGc1aUg0SlFrSWxz?=
 =?utf-8?B?RDZmR3Iva2V0amwwdmdhcWlsdUxZd2JGSForN2c4THJDUU5NMTUvZjlzNWJG?=
 =?utf-8?B?QjBaR0JsN3JiNkM3TnJLR29iQ1ZmQ2liR0cxek5mNnk5a0JxM3RGVWpQQXht?=
 =?utf-8?B?OG9vSWJzWmVBOGZyZWFncE5RZHFmZ1pRTVBUdVIxdExnV3hSZFl1Z0VONEdN?=
 =?utf-8?B?S2F4Y2NQS21ueVIxbVdtOTBSOWQwRkNsdGNVN3pDa1BzVVE2YXdTT2VxWWdJ?=
 =?utf-8?B?bFpNejh3QWNSR0plNEgxMEtzeFFZSC9lL0lJeFExRDF0czNjM1BQa0dRM2Ry?=
 =?utf-8?B?M1hLRzFjMURyNnMvalJ1TjJPM2dSampBSUdYTmxTQ2t6REY0MjR5ajBTYWZH?=
 =?utf-8?B?dk1yM3NSUlBqanBPSVRXQ3ozSXpXSGJBMzZiRHlkRW41aWpxYkpyYkpWeFZk?=
 =?utf-8?B?NzQ2UDFvRFFTQU83VzgwNFdBbUpoanpZZGhmelFyVVg5dmh5SWJhTEZBM28r?=
 =?utf-8?B?eFlZQXBsZlRSNmxGTzJJYVMzTmlIRmdVbVcrUEJGZlJKQ1pkMVVNMSs1bWY4?=
 =?utf-8?B?YUJTYXozMWtYdlhUS2lmUzNEbmJxeXFhSmpTNHlwTXVyVkdIMWV6TmpTTEVV?=
 =?utf-8?B?dTdYNktSeXlCcUVnR014ZnRCcW94OUVHVUNSR3VRdVRxYTdPbUxyN0UvZHM5?=
 =?utf-8?B?VjFMbnc5NG1wUHlvaDh5d0xzU2NQUGlPU2hCd2NlQXhZdWdTSll5aGVYWmZh?=
 =?utf-8?B?WlhXVnBaQXEvWFd6MG1nYnROenE5enNyTlgxZFBLNWZuZU9FVEVaNTZCL0Js?=
 =?utf-8?Q?FC2I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473dd86b-b4c5-4be6-4e18-08db88330bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 08:35:02.5255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZZWW6fk+rMeQ5NDK5FUil1uizV/I6ut0T5VYvFfu+wCXk0xCg6SvHqMaMKo9MhITUJBexS4iLusm0scaYzD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, dl-linux-imx <linux-imx@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgSnVseSAxOCwgMjAyMyA2OjUxIFBNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KDQpIaSwNCg0KPiANCj4gT24gVHVl
LCBKdWwgMTgsIDIwMjMgYXQgMzoxOeKAr1BNIFlpbmcgTGl1IDx2aWN0b3IubGl1QG54cC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gT24gVHVlc2RheSwgSnVseSAxOCwgMjAyMyA1OjM1IFBNIEphZ2Fu
IFRla2kNCj4gPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4g
PiA+DQo+ID4gPiA+IEhpIEphZ2FuLA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBNb25kYXksIEp1bHkg
MTcsIDIwMjMgMjo0NCBQTSBKYWdhbiBUZWtpDQo+ID4gPiA8amFnYW5AYW1hcnVsYXNvbHV0aW9u
cy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgSnVsIDE3LCAyMDIzIGF0IDExOjQ04oCv
QU0gTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gRnJlZXNjYWxlIGkuTVg5MyBTb0MgZW1iZWRzIGEgU3lub3BzeXMgRGVzaWdu
d2FyZSBNSVBJIERTSSBob3N0DQo+ID4gPiA+ID4gPiBjb250cm9sbGVyIGFuZCBhIFN5bm9wc3lz
IERlc2lnbndhcmUgTUlQSSBEUEhZLiAgU29tZQ0KPiBjb25maWd1cmF0aW9ucw0KPiA+ID4gPiA+
ID4gYW5kIGV4dGVuc2lvbnMgdG8gdGhlbSBhcmUgY29udHJvbGxlZCBieSBpLk1YOTMgbWVkaWEg
YmxrLWN0cmwuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWRkIGEgRFJNIGJyaWRnZSBmb3Ig
aS5NWDkzIE1JUEkgRFNJIGJ5IHVzaW5nIGV4aXN0aW5nIERXIE1JUEkgRFNJDQo+ID4gPiA+ID4g
PiBicmlkZ2UgaGVscGVycyBhbmQgaW1wbGVtZW50aW5nIGkuTVg5MyBNSVBJIERTSSBzcGVjaWZp
Yw0KPiBleHRlbnNpb25zLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSB0aGluayB0aGUgYmV0dGVy
IHdheSB3b3VsZCBhZGQgY29tcGF0aWJpbGl0eSB0byBiZSBwYXJ0IG9mIGV4aXN0aW5nDQo+ID4g
PiA+ID4gZHctbWlwaS1kc2kuYyB3aXRoIHNwZWNpZmljIGRyaXZlciBkYXRhLiBUaGlzIHdheSBp
dCBhdm9pZHMgYWxsIHRoZQ0KPiA+ID4gPiA+IHBsYXRmb3JtLXJlbGF0ZWQgaGVscGVycyhleHRl
bnNpb25zKSBhbmQgbWFrZXMgdGhlIGRyaXZlciBnZW5lcmljIHRvDQo+ID4gPiA+ID4gYWxsIFNv
Q3Mgd2hpY2ggdXNlIERXIERTSSBJUC4gSXQgd291bGQgYmUgYSBzdHJhaWdodGZvcndhcmQgY2hh
bmdlIGFzDQo+ID4gPiA+ID4gdGhlIGlteDkzIGRybSBwaXBlbGluZSBhbHJlYWR5IHN1cHBvcnRz
IGJyaWRnZSB0b3BvbG9neS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIHBsYXRmb3JtLXJlbGF0ZWQg
c3R1ZmYgaXMgaGFuZGVkIG92ZXIgdG8gZHctbWlwaS1kc2kuYyB2aWEgc3RydWN0DQo+ID4gPiA+
IGR3X21pcGlfZHNpX3BsYXRfZGF0YSBhcyBhbiBhcmd1bWVudCBvZiBkd19taXBpX2RzaV9wcm9i
ZSgpLiAgSXQNCj4gbG9va3MNCj4gPiA+ID4gb2sgZm9yIHZlbmRvciBkcml2ZXJzIHRvIGNhbGwg
ZHdfbWlwaV9kc2lfcHJvYmUoKSB0byBzZXQgdGhlIHBsYXRmb3JtLQ0KPiA+ID4gcmVsYXRlZA0K
PiA+ID4gPiBpbmZvcm1hdGlvbihyb2NrY2hpcCwgbWVzb24gYW5kIHN0bSBkbyB0aGF0KSwgbGlr
ZSBwZGF0YS5waHlfb3BzIGFuZA0KPiA+ID4gPiBwZGF0YS5ob3N0X29wcy4NCj4gPiA+DQo+ID4g
PiBJIHVuZGVyc3RhbmQgdGhpcyB0b3BvbG9neSBvZiBoYXZpbmcgc29jLXBsYXRmb3JtIGRyaXZl
cnMgd2l0aA0KPiA+ID4gZHctbWlwaS1kc2kgYnJpZGdlLiBXaGF0IEknbSBzdWdnZXN0aW5nIGlz
IHRvIG5vdCBhZGQgYSBzb2MtcGxhdGZvcm0NCj4gPiA+IGRyaXZlciBmb3IgaW14OTMgaW5zdGVh
ZCBhZGQgYWRkIHN1cHBvcnQgZGlyZWN0bHkgb24gZHctbWlwaS1kc2kNCj4gPiA+IGJyaWRnZS4N
Cj4gPg0KPiA+IEl0IHNlZW1zIHRoYXQgZGlyZWN0bHkgc3VwcG9ydGluZyBpLk1YOTMgTUlQSSBE
U0kgaW4gZHctbWlwaS1kc2kuYyBpcw0KPiA+IG5vdCBmZWFzaWJsZS4gIFRoZSBtYWluIHJlYXNv
biBpcyB0aGF0IHN0cnVjdCBkd19taXBpX2RzaV9wbGF0X2RhdGENCj4gPiBjb250YWlucyBwaHlf
b3BzIGFuZCBlYWNoIHZlbmRvciBkcml2ZXIgcHJvdmlkZXMgdmVyeSBkaWZmZXJlbnQNCj4gPiBt
ZXRob2RzIGZvciBwaHksIHdoaWxlLi4uDQo+IA0KPiBDYW5ub3QgdGhpcyBwaHlfb3BzIGdvZXMg
dG8gUEhZIGNvcmUgc29tZXdoZXJlIGFyb3VuZCBhbmQgZXZlbiBpdCBpcw0KPiBwb3NzaWJsZSB0
byBhZGQgdmlhIGRyaXZlciBkYXRhIGZvciBpbXg5MyBieSB1bnRvdWNoaW5nIGV4aXN0aW5nDQo+
IGhhbmRsaW5nPyBJIGtub3cgaXQgaXMgbm90IGFzIGRpcmVjdCBhcyBJIGRlc2NyaWJlIGJ1dCBp
dCBpcyB3b3J0aA0KPiBtYWludGFpbmluZyB0aGUgZHJpdmVyIHRoaXMgd2F5IHRvIGtlZXAgY29u
dHJvbCBvZiB0aGUgZnV0dXJlDQo+IHNvYy1kcml2ZXJzIHRvIGluY2x1ZGUgaW4gZHctbWlwaS1k
c2kgaW5zdGVhZCBvZiBoYW5kbGluZyBwbGF0Zm9ybQ0KPiBjb2RlIHNlcGFyYXRlbHkuDQoNCkxp
a2UgSSBzYWlkLCBlYWNoIHZlbmRvciBkcml2ZXIgcHJvdmlkZXMgdmVyeSBkaWZmZXJlbnQgbWV0
aG9kcyBmb3IgcGh5Lg0KVGhlIHJlYXNvbiBpcyB0aGF0IHBoeSBJUHMgYXJlIGRpZmZlcmVudCBh
bmQgU29DIGludGVncmF0aW9uIHRoaW5ncyBhcmUNCmhhbmRsZWQgdmlhIHN0cnVjdCBkd19taXBp
X2RzaV9waHlfb3BzLiAgTWVzb24gY2FsbHMgZGV2bV9waHlfZ2V0KCkNCnRvIGdldCBhIHBoeS4g
IFJvY2tjaGlwIGNhbGxzIGRldm1fcGh5X2NyZWF0ZSgpIHRvIGNyZWF0ZSBhIHBoeS4gIE1lc29u
LA0Kcm9ja2NoaXAgYW5kIHN0bSBoYXZlIHRoZWlyIG93biBzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5
X29wcw0KaW1wbGVtZW50YXRpb25zLCBzYW1lIHRvIGkuTVg5My4gIERpZmZlcmVudCBwaXhlbCBm
b3JtYXQgY29udHJvbCBpcw0KaW1wbGVtZW50ZWQgaW4gbWVzb24ncyBhbmQgaS5NWDkzJ3MgLT5p
bml0KCkgY2FsbGJhY2suIE1lc29uIGFkZGl0aW9uYWxseQ0KaGFuZGxlcyBjbG9ja3MgaW4gLT5p
bml0KCkgY2FsbGJhY2suDQoNCkdlbmVyYWxseSBzcGVha2luZywgaXQncyBhIG5vLWdvIHRvIHB1
dCBwaHlfb3BzIGludG8gUEhZIGNvcmUgZm9yIGFsbCB0aGUNCnZlbmRvcnMsIElNSE8uDQoNCklu
IHBhcnRpY3VsYXIsIGkuTVg5MyBNSVBJIERQSFkncyBQTEwgY2FuIGJlIGZ1bGx5IGNvbnRyb2xs
ZWQgYnkgbWVkaWENCmJsay1jdHJsKGFzIGEgc3lzY29uKSB0aHJ1IHRoZSBQTEwncyBTb0MgY29u
dHJvbCBpbnRlcmZhY2UsIHdoaWxlIFBIWQ0KcmVnaXN0ZXJzIGNhbiBiZSBjb250cm9sbGVkIGJ5
IERXIE1JUEkgRFNJIHRlc3RkaW4vb3V0IGNvbnRyb2wgaW50ZXJmYWNlDQphbHRlcm5hdGl2ZWx5
IGluY2x1ZGluZyBhIHBhcnQgb2YgdGhlIFBMTCByZWdpc3RlcnMuICBTbywgYWRkaW5nIGEgUEhZ
DQpkcml2ZXIgZm9yIGkuTVg5MyBNSVBJIERQSFkgZG9lc24ndCBtYWtlIHNlbnNlIHNpbmNlIHRo
ZSBQTEwgY29udHJvbGxlZA0KYnkgbWVkaWEgYmxrLWN0cmwgZG9lc24ndCBjb25zdGl0dXRlIGEg
UEhZLiAgSW5zdGVhZCwgZHdfbWlwaV9kc2lfcGh5X29wcw0KbWF5IGNvdmVyIGFsbCB0aGUgUEhZ
IGNvbnRyb2wgd2VsbC4NCg0KRnJvbSBteSBQb1YsIHcvd28gdGhpcyBzZXJpZXMsIGR3LW1pcGkt
ZHNpLmMgbG9va3MgZmluZSB0byBrZWVwIGJlaW5nDQpnZW5lcmljIGFuZCBlYXN5IHRvIG1haW50
YWluLiAgQWxsIHZlbmRvciBkcml2ZXJzIGRvIGlzIHRvIGhhbmRsZSBwbGF0Zm9ybQ0Kc3BlY2lm
aWMgc3R1ZmYsIHdoaWNoIGlzIGdvb2QuDQoNCj4gDQo+ID4NCj4gPiA+DQo+ID4gPiA+DQo+ID4g
PiA+IGR3LW1pcGktZHNpLmMgaXMgZ2VuZXJpYyB3L3dvIHRoaXMgcGF0Y2ggc2VyaWVzLg0KPiA+
ID4gPg0KPiA+ID4gPiBDYW4geW91IGVsYWJvcmF0ZSBtb3JlIGFib3V0IGFkZGluZyBjb21wYXRp
YmlsaXR5IHRvIGJlIHBhcnQgb2YNCj4gZXhpc3RpbmcNCj4gPiA+ID4gZHctbWlwaS1kc2kuYyB3
aXRoIHNwZWNpZmljIGRyaXZlciBkYXRhPyAgSSBkb24ndCBzZWUgY2xlYXIgYXBwcm9hY2ggdG8g
ZG8NCj4gPiA+ID4gdGhhdC4NCj4gPiA+DQo+ID4gPiBQbGVhc2UgY2hlY2sgdGhlIGFib3ZlIGNv
bW1lbnRzLCBhbiBleGFtcGxlIG9mIHNhbXN1bmctZHNpbS5jDQo+ID4NCj4gPiAuLi4gaXQgc2Vl
bXMgdGhhdCBzYW1zdW5nLWRzaW0uYyB1c2VzIHN0cnVjdCBzYW1zdW5nX2RzaW1fZHJpdmVyX2Rh
dGEgdG8NCj4gPiBkaWZmZXJlbnRpYWwgcGxhdGZvcm0gaW5mb3JtYXRpb24gYW5kIGl0IGRvZXNu
J3QgY29udGFpbiBhbnkgY2FsbGJhY2ssIHdoaWNoDQo+ID4gbWVhbnMgY29tcGFyaW5nIHRvIERX
IE1JUEkgRFNJLCBTYW1zdW5nIERTSU0gc2hvd3MgbW9yZSBjb25zaXN0ZW5jeQ0KPiA+IGFjcm9z
cyB2ZW5kb3IgU29DcyBmcm9tIEhXIElQL1NvQyBpbnRlZ3JhdGlvbiBQb1YuDQo+IA0KPiBZZXMs
IGJ1dCBpcyBpdCBwb3NzaWJsZSB0byBhZGp1c3Qgc3RydWN0IGFjY29yZGluZyB0byBEVyBNSVBJ
IERTSS4NCg0KTG9va2luZyBhdCB0aGUgdmVuZG9yIGRyaXZlcnMsIHRoZXkgc2hvdyBhIGxvdCBk
aXZlcnNpdHksIHdoaWNoIGNhbm5vdCBiZQ0KcGFyYW1ldGVyaXplZCBpbnRvIGEgc3RydWN0IGxp
a2UgdGhlIHNhbXN1bmcgZHNpbSBkcml2ZXIgZG9lcy4NCg0Kc3RydWN0IGR3X21pcGlfZHNpX3Bs
YXRfZGF0YSBoaWRlcyBhbGwgcGxhdGZvcm0gc3BlY2lmaWMgaW5mb3JtYXRpb24gZnJvbQ0KZHct
bWlwaS1kc2kuYyB3ZWxsLCBJTUhPLg0KDQpSZWdhcmRzLA0KTGl1IFlpbmcNCg0KPiANCj4gVGhh
bmtzDQo+IEphZ2FuLg0K
