Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567E648E8E9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7A10E324;
	Fri, 14 Jan 2022 11:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D4F10E324
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYHifilvBFMLEAm2MzXzuuyTpzO2gFywPgyhiyvfUohreMuNfofRN5P2biCx9YlZfJ8h12cjzDjtYpWUCLF22p6xbnaRTXArgrOfjAgUZs8vQFSJ9E12F8PsDNcF58rhfm/nSBUl0NfMsFS2/CGyC4c+ZgkhlAV8sN1MaDszfVbxuEzcthHmuJRqxIvYl2cNAI9Iwjq+j4r59GIcV+Q13FkXEHesUIJo4Tm/tu1nfwMAPK/V9m8bmtdZoSZIoPxxFVWB/L/ZE++6ALqZsOaptozA5bkOkaHrBwduamRXQaymQ4V9Ec9e4e4Fqv4rT4W4hAjWOh0kkkF56N+doif/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEgK+tHVKuQ3CfeaQCOE7dWyqQeSYvZ/tPdeP7RlmX0=;
 b=gPva44IJk2sHqojdLaK1jJMES7lSw5SQkfG/bQYW0hJmNEbhwNgHfdQGHOiPxXLcM2LFfd053xGMRTv/xgnHRJoeEfuJJFs1SgBoTjAXu9yedMRem3Twh3y0smrs9HVLOsh98ew5NWMpQfBk2oQHMrEDMCq03b8TtYGJ6wiuErnzWtfcyy12stbUOwC+CIqyIHMIYdncf+lFPdapymrqKBnoXgRfQuhSTFdmxTmPiRlkW8lZqjuY262S98mmIJS6ozHuQQBFIxtCkaP5807sreXXDnmgmSNjDt0LxqlJJJwUy0tI+OyV+bfGWxsO87cbjDm/YBGwxgh8e1CQuY5q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEgK+tHVKuQ3CfeaQCOE7dWyqQeSYvZ/tPdeP7RlmX0=;
 b=cPlzd78juPRWZLNauL3mVC2xBC2LiIh7IgWe+tXdGAMthV67t6M8SVHwmQvI5APh54dXBxwjmzLpt1AM7JxbxuphzWPyejohL+de0X8lK7xj/TfREVWIA2d3jQdHuhUyRAcuvfz9Zy6lnecfAbfOkXyt0QSNrheKXVuNkEAciBQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2306.jpnprd01.prod.outlook.com (2603:1096:603:16::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 11:08:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 11:08:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Fabio Estevam
 <festevam@gmail.com>
Subject: RE: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Topic: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Index: AdgIo2084AmwtmkvSTyKeewhRhjVqAAFPAUAABnsh4AAABPrEAAExHWAAABoAuA=
Date: Fri, 14 Jan 2022 11:08:45 +0000
Message-ID: <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
In-Reply-To: <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e287013-6a7a-44f4-bdcd-08d9d74e3bc7
x-ms-traffictypediagnostic: OSAPR01MB2306:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2306DE123181DFEC58122D8686549@OSAPR01MB2306.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tBy6oVpWF+b23Zyq/WTz5zyXxJrKfgT0q8kDHcsK57UOTt3ev6p5IFBY9EjzJJkYiVyE+HyINPMyAeIbuPLOEahqIsJiypAjXp8sQkHcNpVmY8tuM7ROptY1dlwFhVwUPhak2ngz7UTKrdZz8KK/MPCcmHQMJw82+mLXSzUOJAYwuYzjytIcHUcyvpmanRcbY4bSiPoSUvVlzSfG/ivjVT2ZAr5nx4ytOtwHqfiHmqkLQqEcfafJlAgoJm4UznB2uZ8HjCZeW+9yB5PNLCOznaiQgc4B6+4MxnNjZhSON4QIdIQjGiwJ7YC83fsEbNgGTtiRPK+B6lQxPMrKokZZvGIAs72/5jgji96PjdKfJ76je4rMkNxR2DkGARDIXLonia4Ozvh6q8iye4lPVtJ//usOJXHVaivALLHyp25UPvRDJ4+KbAAYFG7QcB2wNaGCC19SPuEiRZawBTG0mEqKj3isdRuXw2/sRNcTogNIZNtrII2DcI7IZBQ4rri6Or+OhohmwFvb4yzj92Uge3al6plkvrcufE5ce4vVEppkY9jQZ/pTZbdYwaqBHFWvoDoi71GzgEcQmzEsYh3mH7O857X9Bd9dtHT7mReD/gBBuPo70hQKcxDSvbLowhUKJmbOtElQ+K8NZYxFasraOh3bY1SpOpwGQrdvk4Cw/GLrO7ekbOUeROFJ16wjZ/Hwlh6ghQJR9N3Q7h5V9aqJCYxZPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(5660300002)(33656002)(66446008)(83380400001)(66556008)(26005)(52536014)(316002)(8936002)(110136005)(66476007)(71200400001)(6506007)(55016003)(38070700005)(2906002)(53546011)(54906003)(9686003)(38100700002)(7696005)(8676002)(86362001)(186003)(122000001)(508600001)(4326008)(76116006)(7416002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjFZTXVFU3Yva3Vaam9UdHhzeHl3eDM1bUFtRjFZbmhteVoyUUQ1UVJDc3N5?=
 =?utf-8?B?WGlIY2ZQRUh1SnhWaWdQVnVhZ0tGQUZ4cWJPWDd5TlJLeUlLbDVQR0IvWTNy?=
 =?utf-8?B?dUQ0MmVOeWdvTlRWQW9wZkFrU1MzWjVGWldnSDU4SmxmZ1RCdlVTaDdYTFYr?=
 =?utf-8?B?MmRDNStiYjNGUXZ4UlIyWm9rUEFSczRacU5WM1d6YnBhbEgxVnhKT1d5QkZQ?=
 =?utf-8?B?Ulg5SE8zR0RlaVh6Tm9KQnNDeVoybVJoTGpCMkVZNzFiTjh1TlpoMHNHeFJw?=
 =?utf-8?B?dllQT2hFL2xQSWJXMXlsZnkzbkZVWHoyOTBaRHRVQ0djZ2NnNGczVENqNnNW?=
 =?utf-8?B?dVYzWi81YmFoNGZsVFhsVGxqVTVPcTBlRzZlVlhrcmo2U2cxeFVjcjkwNis1?=
 =?utf-8?B?TjFsMEtYL044MFdoRDdYZDMrRml6WW12cEtFeE8rODNyWUFRZ25hRkVLc0Rx?=
 =?utf-8?B?ZkxGVTAyL3UzQVVNdU1uWi9PMjVsdi8rWnVZendvY0FiWStNbXdTazNPazda?=
 =?utf-8?B?V0dhT3VPYmFuS25XKy9TNU9vTGsybWlMRGdyOEQ0VERXYUU1djJCS2pZQVBJ?=
 =?utf-8?B?THRpRFdTSC84SnNham5ISjdFdVB4TXhHeG1hcWdQZStiOFF5Q2RLRmdOaldU?=
 =?utf-8?B?V3crL2JhR2ZFYmhVbFRzeDRKV3JKNXJ1L1R5SUVxTDA0N2hQU2NoVG9hamhS?=
 =?utf-8?B?VVNkU1pCSGZGeUdZZllFOEtuTytOM0V6V3JWUVZYVkJoTVk1WXducGZSbUJG?=
 =?utf-8?B?cURQdWR2T3lKRjFHU0tUN0dkcEwxUmIxTmxLRUlhTWVrT1dINGwxQUhnazNW?=
 =?utf-8?B?bEtkVmUxUGVQY0pZeHRReVFLZXEyaHRuSzhUMVMzbDhlQld5RTBrNVN2RXdm?=
 =?utf-8?B?dzBTZXVna0R1TXVraEdoNm1IRCtIcTQ5Y2MrZSs0RHhvbVFKeGo0WEltQmVU?=
 =?utf-8?B?d0xZT0VsU3R3bEhEK0Z0U1RCTG15Ym9YRHhEb01HNjB1T0M3V0NlSTFabWdW?=
 =?utf-8?B?TFY0clVYU3JuVXc3MEU3SHF3VFFnTUt1SEdVRnA4bldURUZLbXNIelRTNkI2?=
 =?utf-8?B?SXdsaUh1VHVmTG93SERNNTYvRmFOS2VWNHBBNDNmNjYxdkh2dEgrMGRNa2sv?=
 =?utf-8?B?M1p2YUcyOE5SNDQ2K2tjcXd5anZ1NFBIRnBLeStqdVlYS1FPcWJ3ZUtlWmk4?=
 =?utf-8?B?TEk3c2g1dDc4SkNhUUJBNWE4dWJlaGRmUjZWZnlidFFpemNUSk9MWm0yU0Ja?=
 =?utf-8?B?NTZ4bm5Wdkx2dUY0aDd3NWdoN0NLalZ3V0QwODVoNVczejdKZXROalh4azdy?=
 =?utf-8?B?WjlweS9CbnVTbC9RZVlPTmRwZDFudmNIUzFaTGZMbDQ4VWs1U093VmpHa3lW?=
 =?utf-8?B?b2NlWW1EUHlNL3JON1ozeko4amlYWHN3d1RDOUFUREVIeFB1RWRBMno3bnJK?=
 =?utf-8?B?RHN3clNoRFRJVTB3UWRrNlpldWFMWjVKVGpsVjEzL1BrWFlSTEc4OEFmZE01?=
 =?utf-8?B?ekg1MXpUWnlQdGxoUk0wYkJoVkFjb1M5NXBGcHdjV3hQc3IyZjAzOWUvaDlQ?=
 =?utf-8?B?WmNPNEpPZ08wVUQ2S1hJVEllNTNzYnRzdEp6aVJzVStXemVIQUwzbGovUFVp?=
 =?utf-8?B?cUFhZm1MMzg0OWpacHJaMExjWlRZcXhtL1owdEhwZWV2ZHN5YkFoeHlrSUZR?=
 =?utf-8?B?SGhmdkQyKy9lbi9rZWdPUHhtZzd1SkRGaS9ucnhTR3NhaHdUZjNlSFJHVWpy?=
 =?utf-8?B?ajN1NllrM0k4WTgxc0pQSVU4ejNrMTV5emJtSmZ2MkcyVXVrS2VKbXBXNlFq?=
 =?utf-8?B?ZEd0NTgzYkN0Z1o2c1haT2JEL0tEbnBpUDRBbThLTWkzNmVteWJ3QlVTUWtY?=
 =?utf-8?B?OW9wLzFKTFRFUjRlYkJQazE5bEhQUDE1VDJNVG0xbWZZc0l5dWNtV1A3L0s2?=
 =?utf-8?B?eFZmL0FmcUZTR3NoMGZQQW93L3ZDS2lXUEJSejNOVnkwOFZKOXRoQWhyanZu?=
 =?utf-8?B?aW1oZm5CK3EzRTRreStzZ0Z5ZUhmMXVXeHh5Nk0xcllzQ29JVEt5a2NidEc5?=
 =?utf-8?B?RVNhT2x5cjhIaEl5TVZRZGdrZGI4UGphUXpDYTFwUFFjZ0VycnNDZTN6Szd1?=
 =?utf-8?B?eXlSYUxWR0g0bThSaDdqSzZBbi9uR2c5RGtKdDlSSWN2MTJEelRRMjdNNXNN?=
 =?utf-8?B?ZkxxNG5EdkNlSHBqSXA1cllucW9mU21zbS8wOWVwaFZlVng5K2VUbGRLdUlQ?=
 =?utf-8?B?OXQra1VtRnR1VjRHZ3V0R1dZYzlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e287013-6a7a-44f4-bdcd-08d9d74e3bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 11:08:45.9065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VsObQqTdy9vgdR9ncohW821/uULxP96Tt9BYXYRgGFYOu5Ssdk/WeVV5TCqZWY1d20QxDP7vIatO957PM8cV9y3HDXKPDjOexyUH3KKWlPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2306
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
Cc: "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwNCg0KPiBTdWJqZWN0OiBSZTogZHdfaGRtaSBpcyBzaG93aW5nIHdyb25nIGNvbG91
ciBhZnRlciBjb21taXQNCj4gN2NkNzA2NTZkMTI4NWI3OSgiZHJtL2JyaWRnZTogZGlzcGxheS1j
b25uZWN0b3I6IGltcGxlbWVudCBidXMgZm10cw0KPiBjYWxsYmFja3MiKQ0KPiANCj4gT24gMTQv
MDEvMjAyMiAwOToyOSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTmVpbCwNCj4gPg0KPiA+ICsg
cmVuZXNhcy1zb2MNCj4gPg0KPiA+PiBTdWJqZWN0OiBSZTogZHdfaGRtaSBpcyBzaG93aW5nIHdy
b25nIGNvbG91ciBhZnRlciBjb21taXQNCj4gPj4gN2NkNzA2NTZkMTI4NWI3OSgiZHJtL2JyaWRn
ZTogZGlzcGxheS1jb25uZWN0b3I6IGltcGxlbWVudCBidXMgZm10cw0KPiA+PiBjYWxsYmFja3Mi
KQ0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4NCj4gPj4gT24gMTMvMDEvMjAyMiAyMTowMSwgRmFiaW8g
RXN0ZXZhbSB3cm90ZToNCj4gPj4+IEhpIEJpanUsDQo+ID4+Pg0KPiA+Pj4gT24gVGh1LCBKYW4g
MTMsIDIwMjIgYXQgMjo0NSBQTSBCaWp1IERhcw0KPiA+Pj4gPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+PiB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+IEhpIEFsbCwNCj4gPj4+Pg0KPiA+
Pj4+IFJaL0cye0gsIE0sIE59IFNvQyBoYXMgZHdfaGRtaSBJUCBhbmQgaXQgd2FzIHdvcmtpbmcg
b2soY29sb3VyKQ0KPiA+Pj4+IHRpbGwgdGhlIGNvbW1pdA0KPiA+Pj4+IDdjZDcwNjU2ZDEyODVi
NzkoImRybS9icmlkZ2U6IGRpc3BsYXktY29ubmVjdG9yOiBpbXBsZW1lbnQgYnVzIGZtdHMNCj4g
Pj4gY2FsbGJhY2tzIikuDQo+ID4+Pj4NCj4gPj4+PiBBZnRlciB0aGlzIHBhdGNoLCB0aGUgc2Ny
ZWVuIGJlY29tZXMgZ3JlZW5pc2gobWF5IGJlIGl0IGlzIHNldHRpbmcNCj4gPj4+PiBpdA0KPiA+
PiBpbnRvIFlVViBmb3JtYXQ/PykuDQo+ID4+Pj4NCj4gPj4+PiBCeSBjaGVja2luZyB0aGUgY29k
ZSwgcHJldmlvdXNseSBpdCB1c2VkIHRvIGNhbGwgZ2V0X2lucHV0X2ZtdA0KPiA+Pj4+IGNhbGxi
YWNrDQo+ID4+IGFuZCBzZXQgY29sb3VyIGFzIFJHQjI0Lg0KPiA+Pj4+DQo+ID4+Pj4gQWZ0ZXIg
dGhpcyBjb21taXQsIGl0IGNhbGxzIGdldF9vdXRwdXRfZm10X2NhbGxiY2sgYW5kIHJldHVybnMg
Mw0KPiA+Pj4+IG91dHB1dGZvcm1hdHMoWVVWMTYsIFlVVjI0IGFuZCBSR0IyNCkgQW5kIGdldF9p
bnB1dF9mbXQgY2FsbGJhY2ssIEkNCj4gPj4+PiBzZWUNCj4gPj4gdGhlIG91dHB1dGZvcm1hdCBh
cyBZVVYxNiBpbnN0ZWFkIG9mIFJHQjI0Lg0KPiA+Pj4+DQo+ID4+Pj4gTm90IHN1cmUsIEkgYW0g
dGhlIG9ubHkgb25lIHNlZWluZyB0aGlzIGlzc3VlIHdpdGggZHdfSERNSSBkcml2ZXIuDQo+ID4+
DQo+ID4+IFRoaXMgcGF0Y2ggd2FzIGludHJvZHVjZWQgdG8gbWFpbnRhaW4gdGhlIGJyaWRnZSBj
b2xvciBmb3JtYXQNCj4gPj4gbmVnb3RpYXRpb24gYWZ0ZXIgdXNpbmcgRFJNX0JSSURHRV9BVFRB
Q0hfTk9fQ09OTkVDVE9SLCBidXQgaXQgc2VlbXMNCj4gPj4gaXQgYmVoYXZlcyBpbmNvcnJlY3Rs
eSBpZiB0aGUgZmlyc3QgYnJpZGdlIGRvZXNuJ3QgaW1wbGVtZW50IHRoZQ0KPiA+PiBuZWdvdGlh
dGlvbiBjYWxsYmFja3MuDQo+ID4+DQo+ID4+IExldCBtZSBjaGVjayB0aGUgY29kZSB0byBzZWUg
aG93IHRvIGZpeCB0aGF0Lg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24sIEkg
YW0gaGFwcHkgdG8gdGVzdCB0aGUgcGF0Y2gvZml4Lg0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJp
anUNCj4gPg0KPiA+Pg0KPiA+Pj4NCj4gPj4+IEkgaGF2ZSB0ZXN0ZWQgbGludXgtbmV4dCAyMDIy
MDExMiBvbiBhIGlteDZxLXNhYnJlc2QgYm9hcmQsIHdoaWNoDQo+IHNob3dzOg0KPiA+Pj4NCj4g
Pj4+IGR3aGRtaS1pbXggMTIwMDAwLmhkbWk6IERldGVjdGVkIEhETUkgVFggY29udHJvbGxlciB2
MS4zMGEgd2l0aCBIRENQDQo+ID4+PiAoRFdDIEhETUkgM0QgVFggUEhZKQ0KPiA+Pj4NCj4gPj4+
IFRoZSBjb2xvcnMgYXJlIHNob3duIGNvcnJlY3RseSBoZXJlLg0KPiA+Pj4NCj4gPj4NCj4gPj4g
VGhlIGlteCBkb2Vzbid0IHVzZSBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1Igc28gdGhl
IG5lZ290aWF0aW9uDQo+ID4+IGZhaWxzIGFuZCB1c2UgdGhlIFJHQiBmYWxsYmFjayBpbnB1dCAm
IG91dHB1dCBmb3JtYXQuDQo+ID4+DQo+ID4+IEFueXdheSB0aGFua3MgZm9yIHRlc3RpbmcNCj4g
Pj4NCj4gPj4gTmVpbA0KPiANCj4gQ2FuIHlvdSB0ZXN0IDoNCj4gDQo+ID09Pjw9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2JyaWRnZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYw0KPiBpbmRleCBjOTY4NDdm
YzBlYmMuLjcwMTlhY2QzNzcxNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9i
cmlkZ2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jDQo+IEBAIC05NTUs
NyArOTU1LDE0IEBAIGRybV9hdG9taWNfYnJpZGdlX2NoYWluX3NlbGVjdF9idXNfZm10cyhzdHJ1
Y3QNCj4gZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgICAgICAgIGxhc3RfYnJpZGdlX3N0YXRlID0g
ZHJtX2F0b21pY19nZXRfbmV3X2JyaWRnZV9zdGF0ZShjcnRjX3N0YXRlLQ0KPiA+c3RhdGUsDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxhc3RfYnJpZGdlKTsNCj4gDQo+IC0gICAgICAgaWYgKGxhc3RfYnJpZGdlLT5mdW5jcy0+
YXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMpIHsNCj4gKyAgICAgICAvKg0KPiArICAgICAgICAq
IE9ubHkgbmVnb2NpYXRlIHdpdGggcmVhbCB2YWx1ZXMgaWYgYm90aCBlbmQgb2YgdGhlIGJyaWRn
ZSBjaGFpbg0KPiArICAgICAgICAqIHN1cHBvcnQgbmVnb2NpYXRpb24gY2FsbGJhY2tzLCBvdGhl
cndpc2UgeW91IGNhbiBlbmQgaW4gYQ0KPiBzaXR1YXRpb24NCj4gKyAgICAgICAgKiB3aGVyZSB0
aGUgc2VsZWN0ZWQgb3V0cHV0IGZvcm1hdCBkb2Vzbid0IG1hdGNoIHdpdGggdGhlIGZpcnN0DQo+
IGJyaWRnZQ0KPiArICAgICAgICAqIG91dHB1dCBmb3JtYXQuDQo+ICsgICAgICAgICovDQo+ICsg
ICAgICAgaWYgKGJyaWRnZS0+ZnVuY3MtPmF0b21pY19nZXRfaW5wdXRfYnVzX2ZtdHMgJiYNCj4g
KyAgICAgICAgICAgbGFzdF9icmlkZ2UtPmZ1bmNzLT5hdG9taWNfZ2V0X291dHB1dF9idXNfZm10
cykgew0KPiAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKmZ1
bmNzID0gbGFzdF9icmlkZ2UtPmZ1bmNzOw0KPiANCj4gICAgICAgICAgICAgICAgIC8qDQo+IEBA
IC05ODAsNyArOTg3LDEyIEBAIGRybV9hdG9taWNfYnJpZGdlX2NoYWluX3NlbGVjdF9idXNfZm10
cyhzdHJ1Y3QNCj4gZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgICAgICAgICAgICAgICAgaWYgKCFv
dXRfYnVzX2ZtdHMpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0K
PiANCj4gLSAgICAgICAgICAgICAgIGlmIChjb25uLT5kaXNwbGF5X2luZm8ubnVtX2J1c19mb3Jt
YXRzICYmDQo+ICsgICAgICAgICAgICAgICAvKg0KPiArICAgICAgICAgICAgICAgICogSWYgZmly
c3QgYnJpZGdlIGRvZXNuJ3Qgc3VwcG9ydCBuZWdvY2lhdGlvbiwgdXNlDQo+IE1FRElBX0JVU19G
TVRfRklYRUQNCj4gKyAgICAgICAgICAgICAgICAqIGFzIGEgc2FmZSB2YWx1ZSBmb3IgdGhlIHdo
b2xlIGJyaWRnZSBjaGFpbg0KPiArICAgICAgICAgICAgICAgICovDQo+ICsgICAgICAgICAgICAg
ICBpZiAoYnJpZGdlLT5mdW5jcy0+YXRvbWljX2dldF9pbnB1dF9idXNfZm10cyAmJg0KPiArICAg
ICAgICAgICAgICAgICAgIGNvbm4tPmRpc3BsYXlfaW5mby5udW1fYnVzX2Zvcm1hdHMgJiYNCj4g
ICAgICAgICAgICAgICAgICAgICBjb25uLT5kaXNwbGF5X2luZm8uYnVzX2Zvcm1hdHMpDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIG91dF9idXNfZm10c1swXSA9IGNvbm4tDQo+ID5kaXNwbGF5
X2luZm8uYnVzX2Zvcm1hdHNbMF07DQo+ICAgICAgICAgICAgICAgICBlbHNlDQo+ID09Pjw9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBUaGlzIHNob3VsZCBleGNsdWRlIHlv
dXIgc2l0dWF0aW9uIHdoZXJlIHRoZSBmaXJzdCBicmlkZ2UgZG9lc24ndCBzdXBwb3J0DQo+IG5l
Z29jaWF0aW9uLg0KDQpJIGhhdmUgdGVzdGVkIHRoaXMgZml4IHdpdGggTGludXggbmV4dC0yMDIy
MDExNC4gU3RpbGwgSSBzZWUgY29sb3VyIGlzc3VlLg0KDQpJdCBpcyBzdGlsbCBuZWdvdGlhdGlu
ZyBhbmQgaXQgaXMgY2FsbGluZyBnZXRfb3V0cHV0X2ZtdF9jYWxsYmNrDQoNClsgICAgMy40NjAx
NTVdICMjIyMjIyMjZHdfaGRtaV9icmlkZ2VfYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMgTUVE
SUFfQlVTX0ZNVF9VWVZZOF8xWDE2PTAjIyMjIyMjIyMNClsgICAgMy40NjAxODBdICMjIyMjIyMj
ZHdfaGRtaV9icmlkZ2VfYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMgTUVESUFfQlVTX0ZNVF9Z
VVY4XzFYMjQ9MSMjIyMjIyMjIw0KWyAgICAzLjQ2MDIwMl0gIyMjIyMjIyNkd19oZG1pX2JyaWRn
ZV9hdG9taWNfZ2V0X291dHB1dF9idXNfZm10cyBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0PTIj
IyMjIyMjIyMNCg0KQW5kIEluIGdldF9pbnB1dF9mbXQgY2FsbGJhY2ssIEkgU2VlIHRoZSBvdXRw
dXRmb3JtYXQgYXMgWVVWMTYgaW5zdGVhZCBvZiBSR0IyNC4NCg0KWyAgICAzLjQ2MDMxOV0gIyMj
IyMjIyNkd19oZG1pX2JyaWRnZV9hdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzIE1FRElBX0JVU19G
TVRfVVlWWThfMVgxNiMjIyMjIyMjIw0KWyAgICAzLjQ3MzY0NF0gIyMjIyMjIyNoZG1pX3ZpZGVv
X3NhbXBsZSBNRURJQV9CVVNfRk1UX1VZVlk4XzFYMTYjIyMjIyMjIyMNCg0KUmVnYXJkcywNCkJp
anUNCg==
