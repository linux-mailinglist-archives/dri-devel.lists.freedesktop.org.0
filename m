Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED626C44C0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3F10E398;
	Wed, 22 Mar 2023 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2050.outbound.protection.outlook.com [40.107.8.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ED010E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWEPleXoT+1w3rHDPkvR/A/9GD2NcY9xaDDO9Lxwsxi7L2x3H7a7UoupQsQoeZ0Ju8dI0bSLwjVweGEjp70ziARdY0c/rsk8nvXbyxBGDxtC5kPp0jN/mrFmLKPjDOya9O73WMC9j+bMUEc+FVVv4+TaieqkupOvmQzmtmMN0ATyU123Wv/8OEKa1cd6wD4jBfdqQwuav9sLPn+bUH8q1E8mPYZpxDjRm299WY2yZVtc5T+86Ya5uxsw4ITOhHC6UkD617Lb8xvFzMeczIHGn5bKJfqw110e5xdhx1k985cl5UiXwEPfknXGo8UT/2zJOUV+pezKoNES/iVU1EKjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+nqK9Vi9AZ8CrXdXTDXQ/NMgTDRr4zOpuatyoXa/eE=;
 b=NncQHow5fX0aXs8sfmvCblltUXOF0bClLiGwCxbWztvazskTuHw2ytpvw753+ToPCrtanZujJwhvcA3JMB1yEtrgN23zOcnH46T06Yg+KiyKwc6Io5RFbsg2rJVAGbtxSn+z+AQ+N2Gqgev1hryh26Bsepg46BDm8lem4YPscWbes2gh+yhNUsxqGUinRWoAwXGE6xM5m0dSzB23j/T7SO85O9lmcFe1TsRiuUjbUw437jx+X9ZWpJbZAwIjDQVI4ICE5p5aRLnbSzx6TZD+ty7+sA7qyYc9khYJ/cPlsi5CE+XTSBWUnCmoHCBprtPFF4HRU3ywOdsOOg0b10+wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+nqK9Vi9AZ8CrXdXTDXQ/NMgTDRr4zOpuatyoXa/eE=;
 b=Ij+zxRMEpKOCZfphNcz7h5Pfus1EyWYXuR8Lyvb8wrwyN5r4/J6AJNn70G48dnT2XQODs57fxIBcIYmMGqu/RN44BO1Ch4pvdoVXCTEfZw/jwVZKGCONShlPXTlXPRuJ7eI4GF3oBlFZycE486O07tsKB8qozfdwSofAMJjyuVc=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by VE1PR04MB7488.eurprd04.prod.outlook.com (2603:10a6:800:1b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:10:54 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::3d8f:f805:bf35:b33]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::3d8f:f805:bf35:b33%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:10:54 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: RE: Regression in deaeeda2051f ("backlight: pwm_bl: Don't rely on a
 disabled PWM emiting inactive state")
Thread-Topic: Regression in deaeeda2051f ("backlight: pwm_bl: Don't rely on a
 disabled PWM emiting inactive state")
Thread-Index: AQHZXIx5mkVAO8vRJ0yXdS7zAJWtdK8GYplQ
Date: Wed, 22 Mar 2023 08:10:54 +0000
Message-ID: <DB9PR04MB8477FD24740251860648786380869@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322070352.xfwmnqyrao3mifuu@pengutronix.de>
In-Reply-To: <20230322070352.xfwmnqyrao3mifuu@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8477:EE_|VE1PR04MB7488:EE_
x-ms-office365-filtering-correlation-id: 55886055-5d4a-4b94-c384-08db2aacf582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vgOTwc5VS02uEGIsuzw6dvV05rG8Iy/qAaANgpFg94NfpwPZ4YrP7QM2wTpsf6QgFRzKso/FdoEUWyv6uTq7+zYFieIKDHdAavPZZA1s7p518uIO8COKTZPVRwwGZF0EIVn1OJ+ZWWvFzzGaCMD+ZpDEhAQFHnxziax/kXmyuIPZhD73qOSx7v2CffFtbm/JBT+/aTfKNGS9eCaRY/OKd9KMWFjCri9UaAR+eVcYqXCwe6VSEqI8wiPmnhPwqMxv4luyGPzMf8UFhaotMJbbtCLszuajYWpOBAL/5Dv562lJyaFytF59yX829AKf2y0j9nFZp9PExfag7Qjass/SPa3N2o2+bYRf14e69fhHQ5PMB5saG2nrH+q354tUAIVVjNcdT+9AIRYVQZcFOK3YpbPjYBHo0XsE71CxLQ1IAwh8kSeptKLC4BKIl+uuhOISvDed0e+80AXErt7n66ddO1o/W8vlVvzSjJ8lz6ag5sn6SMvDFeMTNni1ZcSuZ5Pxq3KnzjWN/z6gsfAvzDzKCAEBRQ3YMGQPj4NXpWGiKKS43ykySQXD/pjGiF4MeeVZEKAWQTeePiunR5WVkZR3DQMS42cMCP42krTjwHXteRnvPf6RhK7G1IAuB/oWLu1LcA3614OcuyObm+Y9DZkYy/LVMudTRvpgju4t0yDxSeZUXOv2BzYE4YhTLEpPJ+Or
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB8477.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199018)(66574015)(83380400001)(86362001)(122000001)(44832011)(38100700002)(55016003)(38070700005)(66556008)(76116006)(66446008)(52536014)(64756008)(4326008)(5660300002)(2906002)(66476007)(8936002)(66946007)(8676002)(41300700001)(6916009)(478600001)(26005)(7696005)(33656002)(186003)(54906003)(966005)(9686003)(6506007)(316002)(7416002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0k3S2VGMmt4SHloVEFWRHF3N1RwMjhjN2xFVUFjSFBBMlh6c29BZk9ldnJS?=
 =?utf-8?B?QklJVlZON0w2bUc4OWdhS0dJMW1FQzJ2WXFLeUhiMEpLZnc4ak5ESW90MGtX?=
 =?utf-8?B?Z0NlemQrYWJEeXlOc3NxK1BLZkwxYWV0QmV1a0VtamVmZWtqN25DVjhYTnZ3?=
 =?utf-8?B?TU5xS0Foajg0N3F6QVVOTW1XazFqR0ZadVltcGxkR1h5VmR6ajcxR3dJQzUx?=
 =?utf-8?B?Vnd2dHFRaTg3QjJrRDhUSGlLckl4MVQrckV1VkpLdjVycE5Kb24zb0hVWkdm?=
 =?utf-8?B?ZXVpOXllQ2I0OTR0OUNOOENuU0VzL1ozYmFwU1NWN0pCb1dSblJIUzA1aEVu?=
 =?utf-8?B?WkxuTlVYaWlJUGY1UFBBVVkzZjdhZXdaMTIreWZyRWVkTm1jUGFuOHhsbFJa?=
 =?utf-8?B?ZG5pTnRtdjZGVkFhK0plKzVtR3NFbUFDcCtDRVo4cldHYVVDMnRJUEF0aVNh?=
 =?utf-8?B?OXFXVW5NeU1odlRFTVI3aVFXdnJXeVBoWW1YRy9KTnRMSDR4V3g1cGwycGVJ?=
 =?utf-8?B?a0orUmRLdDhmV2tZY3I0SkRpamV5ZFRGWmpLOU9YdGljY3Ivd2hWdnpOUGFv?=
 =?utf-8?B?QjBhengxWmNOWTN4M2d5YUs1VnQ4em4wS2xwYXptQzlQM1NGK2FDb1N4RVVN?=
 =?utf-8?B?Q001WUE2SlB3VnpPMVp0ODh5WU5jTi84TVZKdHdCNzRWSXNhcWQwd0o4QXNJ?=
 =?utf-8?B?dmY0Y25haWU2MDlUMndYVWlRVmRjbEp3US9TbFlrWDBuU1BEQTRMZzNzMWxn?=
 =?utf-8?B?d0dXeGoxLytKSVVLOG04aUt3SkJDZHBZNWdTc1NuVFFJMW5udi9zSFR5RS9v?=
 =?utf-8?B?TGJBMGdDZGsyWHRFOU1uNVBycnNHVW42ZEIxclhEb3V5ZFhiQnZhS1I0VFpT?=
 =?utf-8?B?Q0MzOS9Qd3krUnVrZ2J2ZmNlcDdmc2ova0RsNW9jYTVoOXlpWmV0T2hDeC9i?=
 =?utf-8?B?L1pnOHNZMkpKclFVOGZzRVMrS2pEOXVxUnN6UHlYbnZBT2hGUFExbWxHRVlq?=
 =?utf-8?B?aWdpRURKQWFBclZaSElxUTZGeW02VStDamgzT0dnN0RCcUVhYS9qWEh1MDBQ?=
 =?utf-8?B?RkZuVzEyczdVNHVsVWFpWjk3eW1YOXU4MlB0N0NDcXJvNkJzSHR5M3lCbzls?=
 =?utf-8?B?NmdZaHJhY05kOERMak04MXRnVDdqZDRGcXBlYk1yenlrN0hTWFhQaEhnSkFy?=
 =?utf-8?B?NXA3U2tpa2Myd2dLTmNjcXh1TE5CS1lPZ1VhTHlmdStQYXhUM0FkWG52N3Bt?=
 =?utf-8?B?TTR6djhydlpRUEdlR2tiVXU2alZqeFRmdyt1dzI5UUtaZzlEdU1Sa1hqZDlZ?=
 =?utf-8?B?Y2ZWNzVuRlY2RXIvbDJXQUhqNE5nSmNVUWpxeS9OSnE1MTgrZWpSUkNVNW5r?=
 =?utf-8?B?OHZOb3poVytlWHNic0wrTHdibzZlaGY1Z1JDYk1BOWFHempuYjlMdW85b3hX?=
 =?utf-8?B?YXBTR1dpMEFhZEo3UlhvWHZpV0dlVlVMdVBGSnFSN2hJeGhnVWdQMUlKS0hK?=
 =?utf-8?B?QThSanR6OEc1R0NHNlVyQ1R3cUswTDJud2xpdHhld2Z0cGoyOWNNNkpIYm16?=
 =?utf-8?B?aWFpeWFpOFNpcm9EZ25pd0ttdi9aU2x3SFdidmZ1aUZ1OWdpZ21KTDNsWk8x?=
 =?utf-8?B?YTk1bS95emtEeWQ4UGZBc1kxdHlqYkVCSVA4bzNXRzFzMGlTVEV2YUFlN2Er?=
 =?utf-8?B?dFgxWTZmQ0V4ZjM2bzYwaXJFdUZMOGI1NFBXemxJSEhLeU5ERSt6TnVNakZl?=
 =?utf-8?B?eFpFUlRKc29aMTBPVFZuOFlpZUV6OE45UVRjUG54ZTdOYkY0bGJVSGh5ZlJt?=
 =?utf-8?B?S0hvaFE4ZXliM3AySWMrRmJRbG5lY0Vjc01ZU1loUVpWSnRwa21oc3BtUWxC?=
 =?utf-8?B?M2p0MUZUeTZzYk5RdXd3WG5sdlJXOGJXYnNObHVKTk51czdUbE5FcXJqMEF2?=
 =?utf-8?B?MEZrNGphQmpNKzA1cWFnNkpybkRaVE1HUFVZUjdyTFRmSWo2aU1JSmppWVpS?=
 =?utf-8?B?QWl3VmRSYnpLb2d5WVlLZS9pRGVNeGsvMElMZUI2RnFVdTZISkdSUmlybktD?=
 =?utf-8?B?d2FVbFJBVmRSd01qbWwrVkJpV3B0MWIvQ3FPd3FZd1l6M3l0MkxhVWNJT3hL?=
 =?utf-8?Q?ykWHCuFPLQxc3AEXgdEPCXEO1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55886055-5d4a-4b94-c384-08db2aacf582
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 08:10:54.4473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIP22ptKSOOzuJFi1uSdyfrhtTjy8/hnmbi+zrEt5uVMX2WtE90/e3rHf55+vhmr0Aby3E/9Sek7Qv9EH1CR6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7488
X-Mailman-Approved-At: Wed, 22 Mar 2023 08:20:06 +0000
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVXdlLA0KDQo+IEZyb206IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IFNlbnQ6IDIwMjPlubQz5pyIMjLml6UgMTU6MDQNCj4gDQo+IEhlbGxv
LA0KPiANCj4gaG1tLCB0aGUgc3ViamVjdCBpcyB3cm9uZywgdGhpcyBpcyBhYm91dCBjb21taXQg
ZGVhZWVkYTIwNTFmDQo+ICgiYmFja2xpZ2h0OiBwd21fYmw6IERvbid0IHJlbHkgb24gYSBkaXNh
YmxlZCBQV00gZW1pdGluZyBpbmFjdGl2ZQ0KPiBzdGF0ZSIpIGFuZCBub3QgMDBlN2U2OThiZmYx
ICgiYmFja2xpZ2h0OiBwd21fYmw6IENvbmZpZ3VyZSBwd20gb25seSBvbmNlDQo+IHBlciBiYWNr
bGlnaHQgdG9nZ2xlIikuIEkgZml4ZWQgaXQgYWNjb3JkaW5nbHkuDQoNCkkganVzdCBkb3VibGUg
Y2hlY2tlZCB0aGF0IG9ubHkgcmV2ZXJ0IGRlYWVlZGEyMDUxZiBjYW4ndCBmaXggdGhlIGlzc3Vl
Lg0KSSBoYXZlIHRvIHJldmVydCAwMGU3ZTY5OGJmZjEgYXMgd2VsbC4NCkJlbG93IGFyZSBteSB0
b3AgY29tbWl0czoNCjJjOGIwOTg1NTkzYSAoSEVBRCAtPiBuZXh0LTIwMjMwMzE1KSBSZXZlcnQg
ImJhY2tsaWdodDogcHdtX2JsOiBDb25maWd1cmUgcHdtIG9ubHkgb25jZSBwZXIgYmFja2xpZ2h0
IHRvZ2dsZSINCmU2ZDBhYmEzNjZhNyBSZXZlcnQgImJhY2tsaWdodDogcHdtX2JsOiBEb24ndCBy
ZWx5IG9uIGEgZGlzYWJsZWQgUFdNIGVtaXRpbmcgaW5hY3RpdmUgc3RhdGUiDQoyMjViNmI4MWFm
ZTYgKHRhZzogbmV4dC0yMDIzMDMxNSwgbGludXgtbmV4dC1jdS9tYXN0ZXIpIEFkZCBsaW51eC1u
ZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDIzMDMxNQ0KLi4uDQoNCj4gDQo+IE9uIFdlZCwgTWFy
IDIyLCAyMDIzIGF0IDA1OjEzOjI0QU0gKzAwMDAsIEFpc2hlbmcgRG9uZyB3cm90ZToNCj4gPiBJ
dCBzZWVtcyB0aGlzIHBhdGNoIGNoYW5nZWQgdGhlIGJlaGF2aW9yIG9mIHB3bV9iYWNrbGlnaHRf
c3VzcGVuZCBhDQo+ID4gbGl0dGxlIGJpdCBpbg0KPiA+IHB3bV9iYWNrbGlnaHRfcG93ZXJfb2Zm
KCkgdGhhdCBwd20gc3RhdGUga2VlcCB1bmNoYW5nZWQgZHVyaW5nDQo+IHN1c3BlbmQuDQo+ID4g
VGhlbiBwd21faW14X3RwbV9zdXNwZW5kKCkgd2lsbCByZXR1cm4gLUVidXN5IGR1ZSB0bw0KPiB0
cG0tPmVuYWJsZV9jb3VudCA+IDAuDQo+ID4gV2FzIHRoaXMgaW50ZW5kZWQgYmVoYXZpb3I/IFNo
b3VsZCB3ZSBmaXggcHdtIGNvcmUgb3IgdGhlIGRyaXZlcj8NCj4gDQo+IEEgSSBzZWUuIFRoZSBw
cm9ibGVtIGlzIHRoZSBjb21iaW5hdGlvbiBvZiB0aGUgZm9sbG93aW5nIGZhY3RzOg0KPiANCj4g
IC0gU29tZSBQV01zIGRvbid0IGVtaXQgYSBjb25zdGFudCBpbmFjdGl2ZSBzaWduYWwgd2hlbiBk
aXNhYmxlZCwgc28gYQ0KPiAgICBjb25zdW1lciB3aG8gd2FudHMgYSBjb25zdGFudCBpbmFjdGl2
ZSBzaWduYWwgbXVzdCBub3QgZGlzYWJsZSB0aGUNCj4gICAgUFdNLg0KPiANCj4gIC0gQSB1c2Vk
IFBXTSBpcyBzdXBwb3NlZCB0byBiZSBkaXNhYmxlZCBieSBpdHMgY29uc3VtZXIgb24gc3VzcGVu
ZC4NCj4gICAgKFRoaXMgaXMgcmlnaHQgSU1ITyBiZWNhdXNlIG9uIHN1c3BlbmQgdGhlIFBXTSBp
cyBsaWtlbHkgdG8gc3RvcA0KPiAgICBvc2NpbGxhdGluZyBhbmQgaWYgdGhlIGNvbnN1bWVyIHJl
cXVlc3RlZCBzb21lIG91dHB1dCB3YXZlIGZvcm0gYQ0KPiAgICBzdXNwZW5kIHVzdWFsbHkgc3Rv
cHMgdG8gYWRoZXJlIHRvIHRoZSBjb25zdW1lcidzIHJlcXVlc3QuKQ0KPiANCj4gU28gdGhlIG9w
dGlvbnMgdG8gZml4IHRoaXMgYXJlIChpbiBvcmRlciBvZiBteSBwcmVmZXJlbmNlKToNCj4gDQo+
ICBhKSBJbXByb3ZlIHRoZSBjaGVjayBpbiB0aGUgcHdtX2JsIGRyaXZlciB3aGVuIGl0J3Mgc2Fm
ZSB0byBkaXNhYmxlIHRoZQ0KPiAgICAgUFdNLg0KPiANCj4gIGIpIERpc2FibGUgdGhlIFBXTSBv
biBzdXNwZW5kIGluIHRoZSBwd21fYmwgZHJpdmVyLg0KPiANCj4gIGMpIElmIHRoZSBwd20taW14
LXRwbSdzIFBXTSBvdXRwdXQgaXMgY29uZmlndXJlZCB3aXRoIGR1dHlfY3ljbGUgPSAwIGFuZA0K
PiAgICAgaXMga25vd24gbm90IHRvIGNvbnRpbnVlIGRyaXZpbmcgYSBjb25zdGFudCBpbmFjdGl2
ZSBzaWduYWwgb24NCj4gICAgIHN1c3BlbmQsIGl0IG1pZ2h0IGNvbnRpbnVlIHRvIHN1c3BlbmQu
DQo+IA0KPiBJIHRoaW5rIGEpIGlzIG5vdCBwb3NzaWJsZSBpbiBnZW5lcmFsLiBUbyBkZXRlcm1p
bmUgdGhhdDogV2hpY2ggbWFjaGluZSBkbyB5b3UNCj4gZXhwZXJpZW5jZSB0aGlzIHJlZ3Jlc3Np
b24gb24/DQoNCklteDd1bHAgZXZrLg0KDQo+IA0KPiBiKSBpcyB0aGUgcmlnaHQgb25lIGZyb20g
dGhlIFBXTSBmcmFtZXdvcmsncyBQT1YuIElmIHlvdSBoYXZlIGEgUFdNIGxpa2UNCj4gcHdtLWlt
eDI3IHRoYXQgbWlnaHQgcmVzdWx0IGluIHRoZSBiYWNrbGlnaHQgZ29pbmcgb24gb24gc3VzcGVu
ZC4gVGhhdCdzIGJhZCwNCj4gYnV0IGNvbXBhcmVkIHRvIHRoZSBwcmUtZGVhZWVkYTIwNTFmIHN0
YXRlIGl0J3Mgc3RpbGwgYW4gaW1wcm92ZW1lbnQgKGFzDQo+IHRoZXJlIHRoZSBiYWNrbGlnaHQg
d2VudCBvbiBvbiBkaXNhYmxlICphbmQqIHN1c3BlbmQpLg0KPiBEZXBlbmRpbmcgb24gdGhlIG1h
Y2hpbmUgdGhlIGJhY2tsaWdodCBtaWdodCBvciBtaWdodCBub3QgZ28gb2ZmIGFnYWluIGxhdGVy
DQo+IHdoZW4gc3VzcGVuZCBwcm9ncmVzc2VzLg0KPiANCg0KVGhpcyBzZWVtcyBsaWtlIHRoZSBw
cmV2aW91cyB3b3JraW5nIGJlaGF2aW9yIG9uIG14N3VscCB3aXRob3V0IHRoaXMgcGF0Y2guDQpX
b3VsZCB5b3UgaGVscCBtYWtlIGEgcGF0Y2ggdG8gZml4IGl0Pw0KDQpSZWdhcmRzDQpBaXNoZW5n
DQoNCj4gYykgaXNuJ3QgdGhhdCBuaWNlIGJlY2F1c2UgdGhhdCdzIGFuIGEgYml0IHNwZWNpYWwg
YmVoYXZpb3VyIGFuZCBwZW9wbGUgd2hvDQo+IGludGVuZCB0byB3cml0ZSBjb2RlIHRoYXQgaXMg
Y29ycmVjdCBmb3IgYWxsIFBXTXMgYnV0IG9ubHkgaGF2ZSBhbg0KPiBwd20taW14LXRwbSB0byB0
ZXN0IG1pZ2h0IGZhaWwgdG8gZG8gc28uDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVXdlDQo+IA0K
PiAtLQ0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2Ug
S2xlaW5lLUvDtm5pZw0KPiB8DQo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAg
ICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8DQo=
