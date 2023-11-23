Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFC7F56EE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 04:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3185010E6C9;
	Thu, 23 Nov 2023 03:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEEE10E6C9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 03:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiM2v1zMe/BkfbH+Imbea+xJPIrL1ZhArUZvtiNW02K5VrsUYlWtis8PFrBRW5skbOKbdoaKVn9Zz9dNm0ghxlKCp6RnhUVDvnNQTqOIEK7PPHi7duI+j7LEL4rtawr6um7tNPlju/8nuEAbbQmSmeH7z6zsWB9yQvVJ9u6Tzj3zpfyqeC5S8UBIfbt0O+P5aXhSaE97/rkYOmnnfGTt+zY5SbUXdLidfuygyooyMESLltsLWy7Ck5aWt/yZFym92fVZB7ePhCz3odD0B0srn6zAgfjA+0YyxkzsuAiv6LvTaWYDjBvaiXEfu9TFukOwsTJB2oFaYFYini3RaJN3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoC4qqIHT3YlbNafTu+UOodxiLTfmUp/6qqrHZRFBa4=;
 b=gythR+dWVHrd97pyvxc/r+DURPLCHFeLbvakp0HyqV5S5QRXfpVrDPGyrAYGXTMKAjcX0rAenhRVcxGShMh92Qj+Prn1YT4tjsTt8LKDo1hUJvYw5878UuVweEsuBpEpwC7FrRiafdLNJv9CBJvAesI7uqwU6p7EJt4rbPXNYBoLIckw40+u913lZQQ5LI7tTa/yKLX1rlBzf2BmSBtgvGTK5pge/m3Ab9ABDTFmJymHMMpSXwNCpiHDp+6tng0TZCiQnbS7ZT32QGI27oQjdjZ8zWSBzVfB+4f4jrviyVIaW6se9E3/G0gDdQzSj4gqHn35n+dl/ysh9nshNP54fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoC4qqIHT3YlbNafTu+UOodxiLTfmUp/6qqrHZRFBa4=;
 b=oG7Jy8AYQGYmqmrKKvK8bfIO3EeSArOA2XcRBkrgqVRTY4puPzlLKiYEhYPyYSRObaem0FZ8KRqIrdZ/kjeYXMokNYigeDReZTil+uowE/KBboIOt7xc8BMSu61WTCe/oXX8bdJBg0Vt60wp9fpCGH/Vkk/UZ7gUyunENVitSq4=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 03:14:42 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::710e:18a9:a6af:f2d]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::710e:18a9:a6af:f2d%5]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 03:14:41 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
Thread-Topic: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
Thread-Index: AQHZyPVXeBJTD139FkmL7cmc6zCmuLB6+eEAgAikP4CAA2fnAIAAybcw
Date: Thu, 23 Nov 2023 03:14:41 +0000
Message-ID: <DB8PR04MB7051671F64456C0675B64CD398B9A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230807061115.3244501-1-victor.liu@nxp.com>
 <CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com>
 <AM7PR04MB7046863700EA909289EAC17798B4A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <CACRpkdYPDi+TYj4Y89+iLKa__oFTuMKCPDB7UrVThEGd=6H3qw@mail.gmail.com>
In-Reply-To: <CACRpkdYPDi+TYj4Y89+iLKa__oFTuMKCPDB7UrVThEGd=6H3qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|DBAPR04MB7429:EE_
x-ms-office365-filtering-correlation-id: a165187a-2575-4901-a508-08dbebd255dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9lXvReiK4orv+O5+0zCzeS/OqXGzviKSk9KwLELARtMRVR214iBX4AWNroYtO/gMjz7fV/JnuvbkrtN0A+XT6i037j4A1u6XK66ZtFK5GA5hD9gwnXerAp4sO7s3j4Rx6mtpVfyOmhOvZD7/YPkiuU057kDXFFafU7lKPM1UO1O2VcUQeglGDLIJRl0fbe5YN55d0+dqRHhOW+tIJvHR8jxrCKmbRGJCCTKjdorF9NltD2C+H9TxpDqp3+bmvp9gLHwBuXxTcjlQyO5hyGhKg4+rNC/78+vKcHcrg6MHuwEtvOw713mKxp93Ey1MMawSIEE/cgCGzYVHEb1pMxNnl6EbhQd/T4lwhBVdIInvajQOunEs/exFlj9TlJnCIrnAew895sz3PjaAMyeZQNjl9J35DP0JQ/jvZFz3f9lblmSpJkSEXYnbrAF4InPwoACoLkdhGZ+RC/vXxhOvn9nJDfr3yqoGnGvuAzxc38d5k3bVYME8Q861xE/Si5lvdnbu+ww4+FODGY0c49QHoBZDfKgdNgsotjXITnz3+6fpjgaMhWy5zCgR5egND26i7EiBFoVtnsxiPGSBF3S3GiHCuHNMur+R+iXFmgtdtPXO4DseNTgk0O3jzsyfn4jt6Wx3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(26005)(53546011)(83380400001)(6506007)(7696005)(9686003)(71200400001)(5660300002)(4326008)(8676002)(8936002)(52536014)(41300700001)(2906002)(4744005)(7416002)(478600001)(316002)(6916009)(64756008)(54906003)(66476007)(66946007)(76116006)(66446008)(66556008)(86362001)(33656002)(38100700002)(122000001)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzZJMzA5SFE4VmU2ZTd1MDJFYlZuT0JoL0lSMU03TE1wL21rOG9ycU0vMkg1?=
 =?utf-8?B?L1lmNWtjMkk3QUV2VjM4TmgxeE8yeGhwNGt2YURuYUlsZVlXV0doWk5RNFRi?=
 =?utf-8?B?RTJRTS9mRlAzMVlQdnBiR2xrTnpoM3E5V2RadXJJWUhPSjNML2VRdW5pa2VU?=
 =?utf-8?B?S2VHdEdBNFdhNVRJMVJLc1g5d3ZEOVBTZGdFeVljRjQ0Wi81SW82NlZQS2Jl?=
 =?utf-8?B?MzNCeDFPc2F6amROb2o5L0ZHUC9NcmFlMUt4RUtFTHg5VmhmcTFVRENma2Z0?=
 =?utf-8?B?M0srRzNkUVBmdnpGUFFGTXBDNjI1T1dIRnE0L3I3d3VRYUw3YXZ5bzIrOGJV?=
 =?utf-8?B?VUdVclgxOCtXdnhDcExhWjIyeFhRQ2ozMUNPWGRRcFhrSG9YU0c3bDRWeEpk?=
 =?utf-8?B?ODhNU3ZIYnJrbjR3aHVQdzR4RWw5aGVHWjJHbjEvK1FKTlU1bWNQM0U4YnJS?=
 =?utf-8?B?aHlEdk9SVUdkNjRWREREVDNVMFQ4eEQrVGpBc3FmV3IyNjUxN09SbVI3a2I0?=
 =?utf-8?B?WHo5T1lOdFlTWi9WM1A3aUQrc1RDK25GYVRvZHRqSndiWFVYcUpGSEFIQzF6?=
 =?utf-8?B?MjQxM2NuUExCUHQ2QzVPUno2VlhGcmNvaWU5TENvVnQ1QTRYQTdpT0xFZyti?=
 =?utf-8?B?bitGSUdybFlTN2M1MkR4cHRnbyt4TWRMUm8xRGRqaWg2Z3EyNFF0VUF3OURj?=
 =?utf-8?B?TnVuNkVsSkxHOXdLb0g4L1hJQVp0K2l6MmVLMXc3aHpvZGRiV2JXQWdxU29K?=
 =?utf-8?B?UXJ6VVF4NzExbjBaaytwTDhNL0hTUExNbWZRbFpvaWxqN0U2azBsbXErQVZm?=
 =?utf-8?B?TXEwYmNmYzV2NzZKV0FaRWxRWUYwT2NwSTNHKzNnSDJiVEQyeExVa0I3cU9I?=
 =?utf-8?B?YmYzNFAxMGJ4Wk9ON2tqOEVFM0tWWldDUGpLVWJJZlNqT0c4R2F0ZWczc0tv?=
 =?utf-8?B?S24vQS9rbUdKZW1zTTNhQVRXZVhhaTd6NEJuOW51SGRBOHRMTGc4eStGdmhY?=
 =?utf-8?B?Ui9RYjExcWtvbWJPOEJ1UDZjdXlZelZPQlNjNG9zcUNVdE16M0FZWDlGeEtJ?=
 =?utf-8?B?NFp1MkhDRC80eTZnSGw4UmNFS3VUUmJvMmZOa3N6L0JMbVM5dzFSaXorbmhp?=
 =?utf-8?B?OGNqYjRKcGRmb0cxOUJIa0ZUNnFEeWNSWjF0WHRGeFVjeDFqeWF0OFVlb09y?=
 =?utf-8?B?L1FnRjZiSHEwaWRrR3BaSnYvVUJNNnFrYXgyT29qSUd2YlBwWEhIT2tLTmNs?=
 =?utf-8?B?QmpMS0NieVRiKytjelhIdndZdXNpSWs4ZHdKV3drRmVYMWZBODBIY2RlaWtw?=
 =?utf-8?B?Q2p1aDBxVC9xMFgxNS84T3pwS3FLM1h1R0J2cW5xODdXamkzSjQwd0Z3RFlW?=
 =?utf-8?B?ZkJiNGZSQkZtK0hDSkZJNTRlWXBHaStnL1RUVHZibWJucXNYMC8wM3pwWEVE?=
 =?utf-8?B?czk2eTFZQmJhYW92cmZZdkFkYjJmQTBrcGxZMWJIdUhQcFlwV0Q2QTRHTlpp?=
 =?utf-8?B?a0dDbVdDTzNLZEMrUjVyclY3bG1aR2dDS2tZQ1RablFaUlh6dE1NV0l6UU1Y?=
 =?utf-8?B?YVlyRmdORE9rRWxEbWhoc0pnd3B1R0lWd1ZpQWplMEZUMXZsL0NRYUpYUWZQ?=
 =?utf-8?B?bkUzQlJYV3cyUTNLWmFTN0l0VUN1NHQwZzdvaXZRbFpaUTZQY3JIR0FHb3dL?=
 =?utf-8?B?MzhkR1RqWUdKaHdKdUJoS0lLYW9oMjRFZlhOZUdOTFc4NzRCOEJoQ01CdDlG?=
 =?utf-8?B?VUlkWExWVzJHK041V1VUbzRRalVvNmZvZEhxT1NWUVdUQXNSZjBhOGI5UDNU?=
 =?utf-8?B?N2RYWEozdjI2a3lJKzZxSi9WOElMZGZFMlA1T0VmM0UrdWwzcVViOFYvR2h2?=
 =?utf-8?B?MmpzZDlLazFTVWZLZVE3VExsNHdrTnhGbFN0RVZhTEI5MHdVWUtFTVdVd2c2?=
 =?utf-8?B?bmZ1d0RPRDZQVTdZQzU2SHdYbTFpS2xOQ3l1WUR5NFVmbTMyR3BuaVN3Vkgr?=
 =?utf-8?B?V00wU29YNHFFTDlvVVIzbExGZmJ3TTVCeWtCV3RRdjBCNVE5c1I0b0VVYnJX?=
 =?utf-8?B?ek5IYlJJcCt3c3o2OFozalRFL1pqUnJEMWpGaTY1Q21WRy90N1NNWGFVaVJI?=
 =?utf-8?Q?c9Jk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a165187a-2575-4901-a508-08dbebd255dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 03:14:41.8886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kq6wJ6/uz5LEqrdMpdCIrSYJzdZgae89/5zNvS9SwrBzt3HC5xfj5a6ph613lU/RirrERiA2P+Ozb0aYqaLoiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBOb3ZlbWJlciAyMiwgMjAyMyA5OjU5IFBNLCBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOg0KPiBIaSBZaW5nLA0KDQpIaSBMaW51cywN
Cg0KPiANCj4gT24gTW9uLCBOb3YgMjAsIDIwMjMgYXQgMTE6MDjigK9BTSBZaW5nIExpdSA8dmlj
dG9yLmxpdUBueHAuY29tPiB3cm90ZToNCj4gDQo+IFtNZV0NCj4gPiA+ID4gdjItPnYzOg0KPiA+
ID4gPiAqIEltcHJvdmUgY29tbWl0IG1lc3NhZ2Ugcy9zd2FwcGVkL3JldmVyc2VkLy4NCj4gPiA+
DQo+ID4gPiBUaGlzIHBhdGNoIGNhdXNlcyBhIHJlZ3Jlc3Npb24gaW4gdGhlIFV4NTAwIE1DREUN
Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9tY2RlLyogZHJpdmVyIHdpdGggdGhlIG50MzU1MTAgcGFu
ZWwNCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ub3ZhdGVrLW50MzU1MTAuYw0K
PiA+ID4gbXkgZG1lc2cgbG9va3MgbGlrZSB0aGlzOg0KPiAoLi4uKQ0KPiA+IFNvcnJ5IGZvciB0
aGUgYnJlYWthZ2UgYW5kIGEgYml0IGxhdGUgcmVzcG9uc2UoSSdtIGEgYml0IGJ1c3kgd2l0aCBp
bnRlcm5hbA0KPiA+IHRoaW5ncykuDQo+ID4NCj4gPiBJIHRoaW5rIGRldmljZV9saW5rX2FkZCgp
IGZhaWxzIGJlY2F1c2UgYTAzNTEwMDAuZHNpLjAgYWxyZWFkeSBkZXBlbmRzDQo+ID4gb24gYTAz
NTAwMDAubWNkZS4gIENhbiB5b3UgY29uZmlybSB0aGF0IGRldmljZV9saW5rX2FkZCgpIHJldHVy
bnMgTlVMTA0KPiA+IHJpZ2h0IGFmdGVyIGl0IGNhbGxzIGRldmljZV9pc19kZXBlbmRlbnQoKT8N
Cj4gPg0KPiA+IERvZXMgdGhpcyBwYXRjaCBmaXggdGhlIGlzc3VlPw0KPiANCj4gWWVwIGl0IHdv
cmtzIQ0KPiANCj4gWW91IG1pc3NlZCBvbmUgZGV2aWNlX2xpbmtfZGVsKCkgaW5zdGFuY2Ugb24g
dGhlIGVycm9ycGF0aC4NCg0KV2lsbCBhZGQgaXQuDQoNCj4gDQo+IFRlc3RlZC1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KDQpUaGFua3MgZm9yIHRoZSB0ZXN0
Lg0KDQo+IA0KPiBDYW4geW91IHNlbmQgaXQgYXMgYSBwcm9wZXIgcGF0Y2g/DQoNCldpbGwgZG8u
DQoNClJlZ2FyZHMsDQpMaXUgWWluZw0K
