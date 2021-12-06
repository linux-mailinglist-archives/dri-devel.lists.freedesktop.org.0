Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988646A300
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40E46E504;
	Mon,  6 Dec 2021 17:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A0B6E436
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 17:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+J+LzWkF0TD+sQcJ702jesAGgWbAcqPXN50A549QktDLf5kMZ4FqCAVCKDfZSQnhmOyZmDglkm1B45dBRy3SFr9tQR84/TgbmsQSRwR716praJ4TDwEIAAl+lQ8ulqlUaB0mUV2usFmsPJ7F9IRcr40W0TAkyi6WE+0PTviqwBzX+E/YU7Uu70U34gjxiluTD/ZFYewneGllY9T6JwEL0FXNXCaqhwLOUFQL4iLpt4GRnYzn7sRrASXs/lULNHmGb8fmDLW2h3kJ0fMqGeeq9/d4TfeQF3gawiIcHQXdblhhcFPVzQKbHU+4VkXEuk15NGY9zx9MBO5nFGSidIfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szz6XhH1kUwaIUhIBYN3wlQxyT9wRQ2Bdyd5Cl2EKC8=;
 b=URd0eeZP/ZWYKKAqwCXtyXCtLvPYynarb2W7vQKSXrhK7tKv/QBu798UBQH2yVVaOea1X2T3e99hWKQoJ5XK8PYw6gaf+jsirn9IxT2JbNIQjODwFNzDAbf09u1WpR4H9f3auxZ+T9+BxgW+dU2uPOz1fqi/48WnhkPQ2z/CRf0Hzm+2Sg+WGm5Ce5rMmb+pjUlAntrsIx/AFRrodsIOX8rGhSb+Z7OB/cW8m2QK2L+3PKcd52BQqCQr+nDB+00GUFOMndmCsJNdNW7uxIGtpo5D2AHPWf6ncFSaVYLxJtCZW1YvyA5BO3ENbhLWX8Elbz7j0gi6+RUy4s5A6P5ZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szz6XhH1kUwaIUhIBYN3wlQxyT9wRQ2Bdyd5Cl2EKC8=;
 b=dJndXCM52xVtb7Q/tbSQ6V41EX0utK2jndrqH43ygzjXJkXDuFaXfrxWsq85VS3VtSk/VIJGIipj5loVNtConJ7SE7ZyH/UMIEU2oWj9TcZ4bLxA25wFQRzBB4fH7/UCWFPvRE05oORkvAoE4JH//9DMFHZtz8ysu+hAC5Mxe48=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5461.jpnprd01.prod.outlook.com (2603:1096:604:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 17:29:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 17:29:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Robin Murphy <robin.murphy@arm.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Topic: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Index: AQHX6rIF/WoeY4ClPkK1i7gsRzNw9qwlsoMAgAADEWA=
Date: Mon, 6 Dec 2021 17:29:15 +0000
Message-ID: <OS0PR01MB5922AAAF2C8575BAC436AB62866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
 <20211206150025.15703-2-biju.das.jz@bp.renesas.com>
 <3b6c454a-1572-9344-0436-2866615c3a6d@arm.com>
In-Reply-To: <3b6c454a-1572-9344-0436-2866615c3a6d@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a911fe43-81cc-4f0b-bc28-08d9b8dded8a
x-ms-traffictypediagnostic: OSYPR01MB5461:EE_
x-microsoft-antispam-prvs: <OSYPR01MB54619434E69C3B33CBAD8D40866D9@OSYPR01MB5461.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9AdvXugKJh3ITXGPNtTniqzNIGcVeW2z5Z1micxslIrqlSIpAMBUmCS294Cdwv9op+CIf3vDttFaHSXmzAwamIoP9rd9QSXA4u5IAfdXZfpjUK+ajQKs+ESGkIRNSj04pqRp/y7+Arx8L8OzTrrn/Qqv2QIIYyMeHa7ZemAQ5QTrJFxVnJrvGNocSj0gicrdCS2bQP0TT/QxZthKGKT0ymzzEunHWM6ECTeeYFojK8J9NjAvw2EO70ZgkqXSyoxq2ysNVBS2AtjiCBiahAVhMD/eZK7UAycNru1+rtKOTYhed3JqRj11avDnvZglj4gOojV24tet75VfWjbRgl+uevq4Ee5mZ7mwyeha2uGfBXI1hrg7DMmpwtLDyaE6tOnI19lMkQhg2+wrfv71CggvkA9Idg5oO4qAK7akXid01ueJ/T9u7hul8hD6evaIiBdW8fyCTFKRBlZ5qV64/UowvgsOP8iRPkwVETpmXWTl3P9sIgVX7m/d6lQAK3qdDh3sM8g+kHffNsPE8kkIPRlaK13PvT/i5mI/YFU+bHihGGICud6EUcMXV7DDKMBkLD/JRn3NPZkvfacGool41WxrP7T/azZbHZc+iots2xpIP365S3UOwOZVTAqGvfGaaHyMpcoCkI8IHl5sQGtqlLNa0vs4TVpboyxZapuOU8TjEQ9n0JHscJcZhZlvmihIx23n3YpO/6aTLe4gKGg74wiAnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(316002)(110136005)(8676002)(2906002)(71200400001)(5660300002)(54906003)(8936002)(122000001)(38100700002)(83380400001)(33656002)(7416002)(6506007)(53546011)(86362001)(26005)(7696005)(508600001)(4326008)(186003)(76116006)(66946007)(9686003)(66556008)(66476007)(64756008)(55016003)(66446008)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VGN2g2VmZSVVlrbEhLZmwrcjA0RGNPWDZVK3FQNlJlRWNSd2xkNVhwRmNT?=
 =?utf-8?B?ZGhZbnhaa2dlTmgrSW5SeTJvWkFIeEtYVDFqblRkM3lPWmdxMDhaUDF6Z0RZ?=
 =?utf-8?B?aUpCN0o2STgyaWdGQ2pXdVlBM1g1Ulc1dWhUWUR5bkdIaFhSTEZ2M2RnMHlY?=
 =?utf-8?B?QTZCUTZjM0dnMU1xMTVPMzJoLzQwRTRvN3h2bWxKSFBxdm0ydm1ybVQrQ0dB?=
 =?utf-8?B?TWkxRnVXZDB4L0FMSGJkU3dHSVE4UlFnY0RUVG1vbnN5eU5JaE9aNzBVR0Er?=
 =?utf-8?B?WnV2VHJSTWFZRG1TcERVRGtVMHlBYTFPREZxZ3ZKelBtWVFPSjZGN1lscWFt?=
 =?utf-8?B?RlpIa2ZtNGIxSUZqbGFKUUR0RU5NenRkSVRBcU81WG9MQ050Y2U3OFNWOERM?=
 =?utf-8?B?TXJsTzVPUFI3RDZEUHdnMjZXa09aRDRlWExCREZHT0hBMlNycXd4WUsyVHF0?=
 =?utf-8?B?MXB0eXNVMFA0MzNlbisrYnFnUnEvUmdWMEhZM3o0TVJwUzhRTGRtYnZzZTNF?=
 =?utf-8?B?T2c4R0VMbGFxOFExQXdleUFQZTh6dG1BYkt5bldrM1JLQ1NIeWpVbE9RZkhI?=
 =?utf-8?B?cmVYVUk1eU5RekNrc0ZTMEtoelZZZHF4eW85amI5ODN3NzVoOW9rMWl0VGIz?=
 =?utf-8?B?LzM3b0lSeW9XRThJbzA1ODBMZW9sTUE2d3d6dnZvN1VoTEJzZUxZdTBoWFU4?=
 =?utf-8?B?SnVjb0lleDVLK2dNSWVmOWU4eUZKQUtxc29ZZEFaZk8zeG0vK1RHUjJicytQ?=
 =?utf-8?B?U1RVejJtR0RrZkU1Wm5uUDNDZlk5anlGV0hXWHlvODNSU2ZmcEdzclRPb0tO?=
 =?utf-8?B?S3E3Z3dDR0duUjhNUzkvZGNXK1VCOGJ1ckNEMmZycWZjOXNXeFpYR3AxZ2Rv?=
 =?utf-8?B?TWp2UWJBMlI2RUVieitPdlNxRXlKOHp1dDhGY0lleXR6VEw1bHdDQXYzM2R5?=
 =?utf-8?B?cTZVam1UQ0JqdERIY1pMYVZIWkZVRnNzRjZUOElRR2RXbHNoQ0xVMklSNll3?=
 =?utf-8?B?azBNUGJCOTJ2WGhGOVZDZlViUDhabkdWODQvNmRtTGhlWmtOUnVSUFcyb3hS?=
 =?utf-8?B?V1FVR01uV0kwbnlaai9nWFdPMnhVTm9zTzF3QXFEUm54aG44UndvWDRHeE8x?=
 =?utf-8?B?YlZ5YzZYVlJCS09wUjB1cHFHcTBTR0sxbGs4ejdlQ2d4MzljbVllQVJ2UzJ2?=
 =?utf-8?B?Q2RONEZVVzlDbThla3lYWUF3ZWM0MXpiWnM5dWgrQjZhMmpvZDJTQzdTMjNj?=
 =?utf-8?B?Mnd2RmNJRU80MDMyT08rdjZoVkw4Vm82ekIvMnNieHlFenhCeGpveCtQZi93?=
 =?utf-8?B?Z0ZmazZqZVgyL0ROVG5zcStaWkM0KzY0NEU4WVIxMHRmLzRITktUSFZpMHBL?=
 =?utf-8?B?MlpVYmgxQUdWcjdkc0ZLU3oweG15OFNZeFBEaU5IM0pqSXpBZ0FVQkcrZmVs?=
 =?utf-8?B?bkxodFhTWXhhYTU3T0UwSU9IQVRuL3ZYMTY5dmxDTFU5NlR5QmwzZm1iYXp2?=
 =?utf-8?B?U2tibUxXQ3lzbCtBZFdwNXhRZzA4ZmxxTnAxeTNxVG1SaC8raXBlOEpsVzQx?=
 =?utf-8?B?MnJKYU9UUU1tbWN3VkgxcWtlVGpoa2FrT1RIYnNzSnFjTmU0KzQxYlUxM3ZF?=
 =?utf-8?B?cVJOajkwM1g4dndpc2JrN2taSHZneE5qWERxR2V1Z2x5cmJUbU1aUmdPcERw?=
 =?utf-8?B?UmZtdFFwdEVFMUJjWThkYTZ0allpY2hZU1RxZmk3RGtpNVJaMmpSU2ZwK3Iz?=
 =?utf-8?B?aTY4Z2JkQ3JtQkJRb0QwMVJENGt5SXd3cWJ0QTNWWmZTUnRWenA2cERJWVhq?=
 =?utf-8?B?UmxtTnFFVTFFZHVMVHAvb1ROUnRNbTJodUxaTW1aemZYdlczMUFObW1jbTNN?=
 =?utf-8?B?dFFzQm1JaWF2UUJXZ2NtUEdiTklWcFBaMS95N3Z2cGdzWjN0M3VpTDRUcEdD?=
 =?utf-8?B?OWVsalFvbEVNMlhvbjNHQzI3WnNuVTFRNVIwbXVmcTIwZkhoSEQ0V2pHTFU1?=
 =?utf-8?B?Z2NvUk1saGs3MDZPZ2lwWGdya1dQNks3VHYrUlpxUk9KNnN1ZWkyTTZ5amZ5?=
 =?utf-8?B?NVhnNXpVKzZ1OWZMcmkxM0tVTFp6eVRTei9TdHMxSUpHT3AweTVUOXNJOTlX?=
 =?utf-8?B?M1BLZXJQSllRSDE3TFJwZDBhUEQxY1hSdmdObUp5UFlXWm52YXgzblhOdkQ3?=
 =?utf-8?B?d1E1NGJDTFM0WDdaczJWNXBxeWp6a2tEWmNxUUNwRUR2OUlSMVlpQkpjNFF1?=
 =?utf-8?B?YlFXL0lueFJ6cVFFZmtTN3BmRld3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a911fe43-81cc-4f0b-bc28-08d9b8dded8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 17:29:16.0498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GGJx7GAbriaW8ine0f7mhCGWOsa3tSOYgnx0Ybd638u2Bs03p/kqT7/6taX9sBgL1mTPeQWdzpPON1rOLxggT6L/YC/aFvFTG/SnCZS8T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5461
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

SGkgUm9iaW4sDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8zXSBkdC1iaW5kaW5nczogZ3B1OiBtYWxpLWJpZnJvc3Q6IERvY3VtZW50DQo+
IFJaL0cyTCBzdXBwb3J0DQo+IA0KPiBPbiAyMDIxLTEyLTA2IDE1OjAwLCBCaWp1IERhcyB3cm90
ZToNCj4gPiBUaGUgUmVuZXNhcyBSWi9HMntMLCBMQ30gU29DIChhLmsuYSBSOUEwN0cwNDQpIGhh
cyBhIEJpZnJvc3QgTWFsaS1HMzENCj4gPiBHUFUsIGFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZv
ciBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAg
ICogVXBkYXRlZCBtaW5JdGVtcyBmb3IgcmVzZXRzIGFzIDINCj4gPiAgICogRG9jdW1lbnRlZCBv
cHRpb25hbCBwcm9wZXJ0eSByZXNldC1uYW1lcw0KPiA+ICAgKiBEb2N1bWVudGVkIHJlc2V0LW5h
bWVzIGFzIHJlcXVpcmVkIHByb3BlcnR5IGZvciBSWi9HMkwgU29DLg0KPiA+IC0tLQ0KPiA+ICAg
Li4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwgICAgICAgIHwgMzkgKysrKysr
KysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QueWFtbA0KPiA+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwNCj4g
PiBpbmRleCA2Zjk4ZGQ1NWZiNGMuLmMzYjJmNGRkZDUyMCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QueWFtbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
Ymlmcm9zdC55YW1sDQo+ID4gQEAgLTE5LDYgKzE5LDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAg
ICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1tYWxpDQo+ID4gICAgICAgICAgICAgLSBtZWRp
YXRlayxtdDgxODMtbWFsaQ0KPiA+ICAgICAgICAgICAgIC0gcmVhbHRlayxydGQxNjE5LW1hbGkN
Cj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtbWFsaQ0KPiA+ICAgICAgICAgICAg
IC0gcm9ja2NoaXAscHgzMC1tYWxpDQo+ID4gICAgICAgICAgICAgLSByb2NrY2hpcCxyazM1Njgt
bWFsaQ0KPiA+ICAgICAgICAgLSBjb25zdDogYXJtLG1hbGktYmlmcm9zdCAjIE1hbGkgQmlmcm9z
dCBHUFUgbW9kZWwvcmV2aXNpb24gaXMNCj4gPiBmdWxseSBkaXNjb3ZlcmFibGUgQEAgLTI3LDE5
ICsyOCwzMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiAg
ICAgaW50ZXJydXB0czoNCj4gPiArICAgIG1pbkl0ZW1zOiAzDQo+ID4gICAgICAgaXRlbXM6DQo+
ID4gICAgICAgICAtIGRlc2NyaXB0aW9uOiBKb2IgaW50ZXJydXB0DQo+ID4gICAgICAgICAtIGRl
c2NyaXB0aW9uOiBNTVUgaW50ZXJydXB0DQo+ID4gICAgICAgICAtIGRlc2NyaXB0aW9uOiBHUFUg
aW50ZXJydXB0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVWRU5UIGludGVycnVwdA0KPiAN
Cj4gSSBiZWxpZXZlIHdlIGhhdmVuJ3QgYm90aGVyZWQgd2l0aCB0aGUgIkV2ZW50IiBpbnRlcnJ1
cHQgc28gZmFyIHNpbmNlDQo+IHRoZXJlJ3Mgbm8gcmVhbCBtZWFuaW5nZnVsIHVzZSBmb3IgaXQg
LSBpdCBzZWVtcyB0aGUgZG93bnN0cmVhbSBiaW5kaW5nDQo+IGZvciBBcm0ncyBrYmFzZSBkcml2
ZXIgZG9lc24ndCBtZW50aW9uIGl0IGVpdGhlci4NCg0KSSBhZ3JlZS4NCkJ1dCBEVCBiaW5kaW5n
IGRlc2NyaWJlcyB0aGUgSC9XLiBPdXIgU29DLCBtZW50aW9uIGFib3V0IEV2ZW50IGludGVycnVw
dC4NClRoYXQgaXMgdGhlIHJlYXNvbiBJIGhhdmUgZG9jdW1lbnRlZCBpdC4NCg0KSSBhbSBvayBm
b3Iga2VlcGluZyBpdCBvciByZW1vdmluZyBpdC4gUGxlYXNlIGxldCBtZSBrbm93Lg0KDQo+IA0K
PiA+ICAgICBpbnRlcnJ1cHQtbmFtZXM6DQo+ID4gKyAgICBtaW5JdGVtczogMw0KPiA+ICAgICAg
IGl0ZW1zOg0KPiA+ICAgICAgICAgLSBjb25zdDogam9iDQo+ID4gICAgICAgICAtIGNvbnN0OiBt
bXUNCj4gPiAgICAgICAgIC0gY29uc3Q6IGdwdQ0KPiA+ICsgICAgICAtIGNvbnN0OiBldmVudA0K
PiA+DQo+ID4gICAgIGNsb2NrczoNCj4gPiAtICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBtaW5J
dGVtczogMQ0KPiA+ICsgICAgbWF4SXRlbXM6IDMNCj4gPiArDQo+ID4gKyAgY2xvY2stbmFtZXM6
DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogZ3B1DQo+ID4gKyAgICAgIC0g
Y29uc3Q6IGJ1cw0KPiA+ICsgICAgICAtIGNvbnN0OiBidXNfYWNlDQo+IA0KPiBOb3RlIHRoYXQg
dGhlIEJpZnJvc3QgR1BVcyB0aGVtc2VsdmVzIGFsbCBvbmx5IGhhdmUgYSBzaW5nbGUgZXh0ZXJu
YWwNCj4gY2xvY2sgYW5kIHJlc2V0ICh1bmV4Y2l0aW5nbHkgbmFtZWQgIkNMSyIgYW5kICJSRVNF
VG4iIHJlc3BlY3RpdmVseSwNCj4gRldJVykuIEkgY2FuJ3QgaGVscCBmZWVsaW5nIHdhcnkgdGhh
dCBkZWZpbmluZyBhZGRpdGlvbmFsIG5hbWVzIGZvciB2ZW5kb3INCj4gaW50ZWdyYXRpb24gZGV0
YWlscyBpbiB0aGUgY29yZSBiaW5kaW5nIG1heSBxdWlja2x5IGdyb3cgaW50byBhIG1lc3Mgb2YN
Cj4gbXV0dWFsbHktaW5jb21wYXRpYmxlIHNldHMgb2YgdmFsdWVzLCBmb3Igbm8gZ3JlYXQgYmVu
ZWZpdC4gQXQgdGhlIHZlcnkNCj4gbGVhc3QsIGl0IHdvdWxkIHNlZW0gbW9yZSBzZW5zaWJsZSB0
byBwdXQgdGhlbSBpbiB0aGUgU29DLXNwZWNpZmljDQo+IGNvbmRpdGlvbmFsIHNjaGVtYXMuDQoN
CkluaXRpYWxseSBHUFUgd2FzIG5vdCB3b3JraW5nIG9uIG91ciBwbGF0Zm9ybS4gVGhlbiBhZnRl
ciBkZWJ1Z2dpbmcgZm91bmQgdGhhdCBpdCBuZWVkcywgYnVzIGNsb2NrDQp0byBtYWtlIGl0IHdv
cmsuIFRoaXMgaW5mb3JtYXRpb24gaXMgbWlzc2luZyBpbiBkdCBiaW5kaW5nIGFuZCBJIG5lZWQg
dG8gZmluZCB0aGlzIGluZm8gZnJvbSBzb3VyY2UgY29kZS4NCg0KVGhhdCBpcyB0aGUgcmVhc29u
LCBldmVuIGlmIGl0IGlzIG9wdGlvbmFsLCBJIGhhdmUgZG9jdW1lbnRlZCB3aXRoIHNhbWUgbmFt
ZSBoZXJlLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiBSb2Jpbi4NCj4gDQo+ID4NCj4gPiAg
ICAgbWFsaS1zdXBwbHk6IHRydWUNCj4gPg0KPiA+IEBAIC01Miw3ICs2NCwxNCBAQCBwcm9wZXJ0
aWVzOg0KPiA+ICAgICAgIG1heEl0ZW1zOiAzDQo+ID4NCj4gPiAgICAgcmVzZXRzOg0KPiA+IC0g
ICAgbWF4SXRlbXM6IDINCj4gPiArICAgIG1pbkl0ZW1zOiAyDQo+ID4gKyAgICBtYXhJdGVtczog
Mw0KPiA+ICsNCj4gPiArICByZXNldC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAg
ICAtIGNvbnN0OiByc3QNCj4gPiArICAgICAgLSBjb25zdDogYXhpX3JzdA0KPiA+ICsgICAgICAt
IGNvbnN0OiBhY2VfcnN0DQo+ID4NCj4gPiAgICAgIiNjb29saW5nLWNlbGxzIjoNCj4gPiAgICAg
ICBjb25zdDogMg0KPiA+IEBAIC0xMTMsNiArMTMyLDIyIEBAIGFsbE9mOg0KPiA+ICAgICAgICAg
ICAtIHNyYW0tc3VwcGx5DQo+ID4gICAgICAgICAgIC0gcG93ZXItZG9tYWlucw0KPiA+ICAgICAg
ICAgICAtIHBvd2VyLWRvbWFpbi1uYW1lcw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3Bl
cnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5z
Og0KPiA+ICsgICAgICAgICAgICBjb25zdDogcmVuZXNhcyxyOWEwN2cwNDQtbWFsaQ0KPiA+ICsg
ICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBpbnRlcnJ1cHQt
bmFtZXM6DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczogNA0KPiA+ICsgICAgICAgIGNsb2NrLW5h
bWVzOg0KPiA+ICsgICAgICAgICAgbWluSXRlbXM6IDMNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+
ID4gKyAgICAgICAgLSBjbG9jay1uYW1lcw0KPiA+ICsgICAgICAgIC0gcG93ZXItZG9tYWlucw0K
PiA+ICsgICAgICAgIC0gcmVzZXRzDQo+ID4gKyAgICAgICAgLSByZXNldC1uYW1lcw0KPiA+ICAg
ICAgIGVsc2U6DQo+ID4gICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICBwb3dlci1k
b21haW5zOg0KPiA+DQo=
