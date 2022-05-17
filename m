Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E152B31D
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D426113E2E;
	Wed, 18 May 2022 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F81E1130FF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1L4kbLeGTowPwYboCzbBPJJH4tnHvY4o/iZKMmwHGGJ86QAHeMQkZd5QisYea3V+eZqk5NBoOsZe2sSOZ1BWgJafjT1jR6AE3yRSOhk8RwBYtUOKVvzGZ4AOJhZF66MpG7ZQNDUHs6698oTt6lpANz8G1trRVtJK6OZ9z7Pjl7kHI2tpXevgfb7LJGmwwF2C960mEvZnSxE2+fAVQYdAm9eZ7URiAfUMLbxLiYuhxr1XsmP50lgB4QJwVA0LnT18/3qgaXCGK78BsJDa9rP96AwfdbQkaO80r+7RoQt5TzI0kHAEwt06gJv7XV9Kh5QFRSKz7RsUEVNOhsHLSDnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWeK5mpdxZSkAOt4Mh8IzCQ7SPu85zh2Q0gO8v6XyEE=;
 b=fH73jgXtTeVWYhEpbp3udyNthHGGbM3xuLLFC48fLmL0UlFr9UBYfR5FUJ5Qd7paJmcWJ9ZUQKWE8/Res6v5MMHlhitoWmRMKvRvL2QzGI9c+v3FBPZkom4rcdxIx2c/Y74jDI/5zqeN5JNsI5N5IPB5tKGRUDejDVkUasP0uUbe3KIRUPjFykyacYM9XaPkoEnXSrMTyDjQZSXneDBTVLQUjk85dJJSYeeo3FQ8QL5v4BE0ODKpSqPW5n/ju1DqOeyeL70mpaquy3ArQljyVKwaZlBhGzEVB/lv2Vj8nOXQyV5XPby21VCHuSr+DzshfFYzjCw/1o7NOglak+fBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWeK5mpdxZSkAOt4Mh8IzCQ7SPu85zh2Q0gO8v6XyEE=;
 b=DS/Sx2QFyNx1pXNY3RC+4z1+TLIGjWWGcLAkU1GAzpMhWa7wLtO8iQZxKpk2C8qNBmub64nQaQYPsvWkrxQFRUAwxmUbmtNBvsYOVPPtAxvSmS53rJ+9CeyeFUlMf/ub+fI4GG0Y3/grJxEA5mQ6MZTakB56PbJGJCR/2kqwYMmjjJNyKzXESbyMk6On0MTKNRvYWbYgBYWsm0Sar7s7JF3ED8As8wnwA/e1GYnA87lysUqReJNxsxcrfVsjQyRxk/DYfTZXp7U3bhHhhfO+Qyowlq+bMCfx/jpWEyI/b8TmsycDtc5d3tzA9dyDh7yNSwDKcZNKK9CdgArv3k/ecg==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SI2PR06MB4779.apcprd06.prod.outlook.com (2603:1096:4:14c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 15:32:15 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:32:15 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Thread-Topic: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
 node
Thread-Index: AQHYacfDGaMXzDQN90y+BFiyb1NEtq0i95eAgAAutxCAAAHkgIAAB2YAgAABpgCAAAGSEA==
Date: Tue, 17 May 2022 15:32:15 +0000
Message-ID: <HK0PR06MB32023F7AFBFA243CA715DF7F80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
 <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
 <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <1327ec95-f6b4-838d-f3f2-a115c2ab632b@linaro.org>
In-Reply-To: <1327ec95-f6b4-838d-f3f2-a115c2ab632b@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a314532e-54b7-44e2-1c5b-08da381a6b8a
x-ms-traffictypediagnostic: SI2PR06MB4779:EE_
x-microsoft-antispam-prvs: <SI2PR06MB4779344D6F795B5FB328A31080CE9@SI2PR06MB4779.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ++w2l6jRsheb5M8BFXnEulTmarUg5Dj85f4cRdSE7Q5002Ebx4kkRlZep9qDpc0DDpp5pTHV3BObKJUZsjWoZjlYdxWV/RjdqnGcrByEJcwkBIE84trZ69rlXyVs6KeEaIf+jZLSvfDNsnsQ1duB8PlJwAB1c2Sw30k+Vsadvz22Eft/6decAtDDjAZ6n0jI6FtEbfq40I8AGV4mgm1Wd1EEV58ATFgDfOd7VT8fLgZy50dEK0zJ3hz09cj6itjqUg8QHsfbLObQ9dKTHryHSBZCEPIVzpQpq951vqNEn612LWHJGcM1Wibp+N3WHW6lAlWaTGpzGdRBMzl96dNhnSdazbFui6g/bjrXWL3z4V+1YytAwhbDsXPB2CDAywHZ6cSLOf11RTkktM3cKwATt13c489SKakUPg7At1AkqKmorMgVfHTzeVaOcZwSGz1Qc+IPOPGStHiLo4oADbO4ubpP26c0OdUCt9xgL0BqouFtYaAZ74R6CRxt4XbcS4Chb+OH7nhCPPwDyEhi6ufHfLFECR6yEi1WRpwNbTucNagV8CWTZMPrniX6mvajbH2OvJgbSY5mM9qA3Cj4FY1EtTe5MXyz5S+wY6gpqTRH2T6ZoDslb5LR9bLJw2mFMyy8/RBzyGgn/rBhHOgbvCEUitthiYcMsK8Eus13ePfxBX3LgBBH4uybKrRkfgFAz5U+LYKsn2PsvD225PO9e4m/jfaFrkflU//fX4kF1k0uleI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39850400004)(346002)(376002)(136003)(396003)(366004)(110136005)(316002)(41300700001)(54906003)(122000001)(83380400001)(2906002)(38100700002)(186003)(64756008)(66446008)(66476007)(66574015)(66946007)(76116006)(8676002)(4326008)(66556008)(33656002)(71200400001)(52536014)(7416002)(86362001)(7696005)(5660300002)(8936002)(55016003)(921005)(38070700005)(508600001)(6506007)(53546011)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0RFZHRyejh3dlRGbzBKTEtsVmdaT25ycG9rN2NWbFlrNUhmLzVXajFTT3po?=
 =?utf-8?B?cURXOStJNEdTb21vL1dpQS9DM2tiek9LL3JwUXBRKzNmRU5jb0Foc2pFUHNW?=
 =?utf-8?B?cTk3blRLekNmbHJ3ODgwVGJqTndGYnZIZVRiQmpjN3NOYUJnWTIya2ROMHZO?=
 =?utf-8?B?WUNsbzJlOUdUMlBXdVQrUDU3WTNSb1h0a0tleUs3MUlkMkJxTU5CMjVYNU9u?=
 =?utf-8?B?NXNyMmZreERZZW5IcE5ZZkxxc2NRMnNRdjhTbTVoNFMwa2dzWG0rNW45U3o0?=
 =?utf-8?B?MDh6MmdwUTVBdS9nWTRTRGRMeFJTV2YzVnp6czJhT0Z5OUsrNU9wdyswZkdT?=
 =?utf-8?B?QjZrdk1hNWM2b0M4T3ZicGR2S2cvZWxMV21zdGQrOExSeGNncjFjQ09zbU9S?=
 =?utf-8?B?NE16aUZNSnhhV0laV1lVOTNjcnMxREZ2d2djVU1XYVBMWkFWREtISmg1Umhm?=
 =?utf-8?B?ZVhkeDFkakNEU1ZwSHdaWnFHeS80STMyY3ZHTC83VGplaUZ2YlU2dUNmcXRa?=
 =?utf-8?B?blBGSkhTZzl1VTJjdXBLamJVcis5cmgyTW1HeUNlZW1McEl5aDFxVzJBdFFi?=
 =?utf-8?B?S2JFQ3FoOTFsbitwaXA0cFFjcENJQXY1Sk95T0U1NjJySTU1L3RPRXlpWWtn?=
 =?utf-8?B?UjJuLytpTDhlWVhTZnA3eW9iUTZtSVNoUjJnV29FMk8zSm5JTzJwU2trZWtX?=
 =?utf-8?B?SXV4NDZUY0xLekFqZll5Rm1qM29tSzdBQUtTb3hqTnVTaHQ2WjJJak4zZ25T?=
 =?utf-8?B?dGlONklxYUpBVG1qS25sbThtRFJLQkNBWm9tUzIyUFduUk1qcms0aDZXRXRP?=
 =?utf-8?B?dEFPa01jOWdmTGJaNDZ1cGtnbFRzUytOQlh1Z3R0MnArTTcxVXg2TCtSbmNz?=
 =?utf-8?B?NlVGZmJnRU1TUkFSaWxCRCtwdEJ0eWVwTE5jcEdoc1FvN3MvY1h3dzNHN1hz?=
 =?utf-8?B?WGdwcis3M0ZmMzRaOVh3QnpBeTdtcUtxSmZ6VTNnYjFDek82bWlGWFVURXJ6?=
 =?utf-8?B?RCtSRTFRQksrZHZPdjVwb2ZRTUpLY2pJdTdXN0FFYTNxM0U1aEF6eUlFQm8r?=
 =?utf-8?B?cU9hOWxhOW9CdXp1S1dIS0xwamZjVDlTOFdiUUVHbG85Szk5YktPOWdBZllL?=
 =?utf-8?B?cnVCUGZzOW9rYlFzTlI5QmZhU0lQSlJ3Mkg5Mm80K2dESEhZVUgrZzlMUmVU?=
 =?utf-8?B?Y3VYTDEzL2FCajJZdU1EdVdOZTVXNFBoRWsyUHJiU1VpczFoVHVta1lEcFE5?=
 =?utf-8?B?bGJobWRpRnlJUEJBNVJORHc2TXp4K1NnUzdUandkb09DN2ZtR2hWR0JPMlRU?=
 =?utf-8?B?K1paQWpKZzh1QUFNWHlwZ0IxdUdoZ0pBYzdmbC92c1pmem0xaHhjdjZQK2ZN?=
 =?utf-8?B?OVhVWk9ySmpjMy9ERlJPUUVoSWE2WElNRllNZ1ZLRVNnbTU3YTBYZ1V1QTgw?=
 =?utf-8?B?Z1p1eUVIZGsyMHFKVHdZTCtrK0d3ZXY0eXgyRnZ6NWgwTFlwNmtjdjU3MjBK?=
 =?utf-8?B?Vjg3bVNvL0plWUY3QmtVcHFLYytWRkUyNXh4Vmdrdzd2WEZWUm94ejN0STFi?=
 =?utf-8?B?ZXVVYUZoL3czOFM4QlNpblIyeG9oSjI5RXNZKzYxT1RUOFpzc0pHVFQvcGdU?=
 =?utf-8?B?MzV1TmV1RDBWSjFSTjQ3VzUzTDlhSjlRTWNRUVRDdDBPUkt2cTA5U0JkdW1Y?=
 =?utf-8?B?M09YSVdtYjJjd1lUb1VWZDh2VkducDFCaVQ5ZlFRaTltbmNCR09PNjBXcEFk?=
 =?utf-8?B?azRWWjUzRWZ4dk1JanNudmpPYWJCNGVaaHVWWG5xUUZZK20wNHFMY2RnaExh?=
 =?utf-8?B?TnhEd1ZIMnVLdkJOa05sTktFSFpSRjZNQVgxQTRFbGw3T0wrZjZsbEQ4VXhO?=
 =?utf-8?B?U1JXY1hobWFFYmNQd1d6dUd5NndLMDVLRCttMFlqZngyTHkyT1dLNGVPVjdk?=
 =?utf-8?B?ZWNiekNSTTl4ejluY0MxTjRlYkFvU3I3MTFaZCtDUjFOQmNyMnJneUczd0hO?=
 =?utf-8?B?eVlLR21Ra1VVTnZEWUJUVy9uYk1MZGl0bVpXbk5nTkJ2TXQ3ekZoMllmVU03?=
 =?utf-8?B?c1o5UVpENlBPWXdCa0RMSzI3Smh0TG82ZjlUZTNRL2cxNmlGWTM2Vkx4QTdB?=
 =?utf-8?B?YmpndWpQTHRZVXdiODUvUFlkbEJqWmVHTlFDNUFIY0NvVCsxRXJ4OGRiYklI?=
 =?utf-8?B?ZWNaMGVxWlBvQTQ0d0N5SXpzVkppQmU2a2FZUnErZngwWWloK0gzcWlKekhR?=
 =?utf-8?B?L1dCbmJYUzczWWl0aDFDWjMwV2pXVFZRanFxZUY0QUNSQmpDbjZ6NzllYmlo?=
 =?utf-8?B?RnJzeEdlallrOHZvR08wWkgzVVh6bkM5Nkh1clFRSWMvQ0p3M05EQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a314532e-54b7-44e2-1c5b-08da381a6b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 15:32:15.0552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrF3DwXSAWoDxC684Fe7FoY4k+hFUdhoVGwvt/jvqVzol5jt5RzoGE34bBdg6A5P5+USGFUa+trPhSWjiQuMxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4779
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAx
NywgMjAyMiAxMToyNiBQTQ0KPiBUbzogTmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29t
PjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PjsNCj4gQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IEZlbGlwZSBCYWxi
aSA8YmFsYmlAa2VybmVsLm9yZz47IFN1bWl0DQo+IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPjsNCj4gTGkgWWFuZyA8bGVv
eWFuZy5saUBueHAuY29tPg0KPiBDYzogbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxp
bnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSBBUk06IGR0czogYXNwZWVkOiBBZGQgVVNCMi4wIGRl
dmljZSBjb250cm9sbGVyDQo+IG5vZGUNCj4gDQo+IE9uIDE3LzA1LzIwMjIgMTc6MjEsIE5lYWwg
TGl1IHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+PiArCQl1ZGM6IHVkY0AxZTZhMjAwMCB7DQo+ID4+
Pj4NCj4gPj4+PiBUaGUgc2FtZSBhcyBEVFMgaW4gYmluZGluZ3MgLSBnZW5lcmljIG5vZGUgbmFt
ZSwgcGxlYXNlLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gSXMgaXQgcG9zc2libGUgdG8gdXNlICJ1
ZGM6IHVzYi11ZGNAMWU2YTIwMDAiIHRvIGRpc3Rpbmd1aXNoIGl0IGJldHdlZW4NCj4gInZodWI6
DQo+ID4+IHVzYi12aHViQDFlNmEwMDAwIj8NCj4gPj4NCj4gPj4gUG9zc2libGUgeWVzIDopLCBi
dXQgbm90IHJlY29tbWVuZGVkIGFuZCBub3Qgd2FudGVkLiBOb2RlcyBzaG91bGQgYmUNCj4gPj4g
Z2VuZXJpYyBhbmQgcHJlZml4ZXMgYXJlIGFkZGVkIG9ubHkgaWYgdGhlcmUgaXMgbm8gdW5pdCBh
ZGRyZXNzLiBZb3UNCj4gPj4gY2FuIHRob3VnaCB1c2Ugc29tZSBtb3JlIGRlc2NyaXB0aXZlIGxh
YmVsLg0KPiA+Pg0KPiA+ICJ1ZGM6IHVzYkAxZTZhMjAwMCIgaXMgb2theSBmb3IgeW91Pw0KPiAN
Cj4gWWVzLCBpdCdzIHBlcmZlY3QuDQoNCkdyZWF0ICEgSSdsbCB1cGRhdGUgaXQgZm9yIG5leHQg
cGF0Y2guDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCj4gDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0K
