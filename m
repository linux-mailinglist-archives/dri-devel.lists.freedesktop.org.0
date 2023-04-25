Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B806EDE91
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 10:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4E610E520;
	Tue, 25 Apr 2023 08:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9810E6C3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 08:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK9S0VjSkRMAXzTuf1swExnzNknAVMO5u1u+2O6JGDJno1wjCqijRc2ovS2Ct3cbAJ5BvgDvgCOCB+KFYaWPtWxnbhZicbqlsc4hV6JIE2WulR4TJsMx/f5rieHWfqr9j9aHbFEHx5VbK1bdXSWjRM1ge/yjwe1FGDi0fSH02eq8+0qTvuJ3FOob/sKL966pT7XCIyHEkjmuhBPNBJJiSIeS/wIp6sSSvrE4XrBCfjnAQXUmvT5xms8yTWThq7VYz8ODrsn+zRv5cE+LxaZAUr3ZmRCNr47nVJWjiatd1btc9ln8tNoMrcu2rTEc3NZZV+2yhk4qbvtD1Rs+77bNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkmJF4CKQNBXqo6htc8pKD8cY7MzLenCwXiMaWWmcow=;
 b=hPLKS43Omiel2/d5O4Sz8X9QdrP0/eoproU9cPIs33aK8Vb+iuhOTlJCGjPijdLY71npLcmAPhkXAX/3sf2G94JPpNW1P8aNsjNkXivtqln0O9UcVQvapx2xvEVQIH9Iu6/vtc99iGw79/o4ZWdTVLuvakqNVJWqVWpq4julKHpXDSe+yXRTT+4uZwxea7T2PHNO+vGb6h9fWRh81tZj377L/zkn2GbQrATBURwTuUDbcZ+YLGd2X7A3+5xB0EcngpfONEh56oSGGwJNsyTFTI7JI/OjHk2BYnXlnIuXadlmCjCqcLw2da8lBAFrhWgFjPxyyf3l45uv1nQxjJc4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkmJF4CKQNBXqo6htc8pKD8cY7MzLenCwXiMaWWmcow=;
 b=dld0yAlAu7ndK3IPhc45LbPMb0RE1/GyRIVSxucSjFV71SgSGCvJyWbcL0jDJVYNAZTJMnfYDrxEWfs4x3P5lx21SZm4v6YUm8fQ03I4Rt0Z90jGxwrsuvw3Se6QD7BNElvy4kve+bTMqY8g93cGqMw9IpwiSTK95khRvgvH4oU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11017.jpnprd01.prod.outlook.com (2603:1096:400:395::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 08:55:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 08:55:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Topic: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Index: AQHZdsdZe4oiVYtqEk2K2Fi8d4vqWK87qQeAgAAP53A=
Date: Tue, 25 Apr 2023 08:55:13 +0000
Message-ID: <OS0PR01MB59226ED2001DF994396014AD86649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWR1XE3SqCwqG=81WLDc_rY8Ec_rH7mjt6_5cL7=JA=TQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11017:EE_
x-ms-office365-filtering-correlation-id: 3d21b715-fcef-4128-b740-08db456ac88a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VAjIKOICB+2/m5kB5y2o6tMqX4nz9HaiLG1wTzRsysXbW4Kuq/8A9gYWTgvTexeW3B9CKbdOm/AbpTdmEhfQCBtvReA8gdbxDS108UZ7hxtRKn0FO20x0nNSqkjppZsg+53vlJ58zwQSW0za5qra7W1Gu9gLUUQPyOgv8Wfn0pYw8XbdK0gqibwhnNI6dAIte6egRP3OvbFqHUpvfmelGwf41Wi8piP0Kn/45R5+G+81GUcxMr/rET+gDQFEprEcbRO4UXf3w4JZykBriI9qkXXWNJjQGahmMXHW20KbfZsPOVpm67Jdw7IoDshJM9QvoFqPmDWX5MPTMaXKID6Fa3f7F1FCC9E+MZ4yUFhC0HWXRsyNtn4g6Eup9itIRwdwH8WWcJhfU93mqyqzuTWagp0xpx4i+pCymTo0c5Qqs/w0Alt3H9qPLlb/Rvi//mIeet9Wxj5Nd3faJEhzkh/tq45c6Igti1Y/5smowck5f3tR25ktEptAjOOJT3M7qGAxWhujRBMKKPnfhe7E1vshuM4RRa8PhaB+Tz7xd9scwdLWUXfq6ijrUKGuV0rrFTG7x+GZ29w+M75EN6V0e7oyRQuOND7DjOgwK3gEOadYQiawHPdO+btSSaVgElIvpJUArLZM4SNFK46nteFoZsqKcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(76116006)(2906002)(66446008)(66476007)(66556008)(66946007)(64756008)(6916009)(316002)(4326008)(52536014)(5660300002)(8936002)(38070700005)(8676002)(41300700001)(33656002)(86362001)(55016003)(186003)(9686003)(26005)(122000001)(71200400001)(53546011)(38100700002)(478600001)(7696005)(66574015)(83380400001)(6506007)(54906003)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG1XVVZsdk5nbmVuN01Sa1RFVXM2TDNKWUdVSlA1ZFFFeXFIK0hJZnJCblNJ?=
 =?utf-8?B?cmhMV2s0Wi9VREYvYjBoakFwaFVuazVlcnNMWjJUa0drczdJQ3FQZThxMVEx?=
 =?utf-8?B?eWFWdkRzL3ppTktGUmN5U0s5OVdYSVluQmhmZTQwL1NIT3dwWnJna2ZUczJF?=
 =?utf-8?B?bi81ZGI0YkJlbW1GNGpLaVUxcm5ubm0zYVFEcm9tKzY4MGczamVYU3lGaHdY?=
 =?utf-8?B?M2xCYW9CQmZlSGlSLzZBQWNwbUM4U1B1MUlmbHlqcGxDWGQ1cmt6YUwreVNE?=
 =?utf-8?B?dnR5UmlDdU90T0U3NzU5OE11YS92R01CdVFjbUY3b01oTGZTWjdUaFQvZXBI?=
 =?utf-8?B?aUJrWjFlREMxQ0xxNFlySVp5MHRIdnRVVm5GVmdERXlGeW9YNnJ2T3VaZ2hC?=
 =?utf-8?B?bjdPeXBadWgySFlMZzdSQndaSktQejBlV0U2NDNlelJGTzRjOFZ3dmkzSlNz?=
 =?utf-8?B?UDF6THlJanBabkhsZVdiYUVwTVVVdlRUWDF6Z0paMjlqbkU3NXlpK2xQd0la?=
 =?utf-8?B?RHV5QkJCbzFubHlyS3pQV3dYcmgvMkR5QVR2cGlFUE5Sa1d5NWorcDc4UFFZ?=
 =?utf-8?B?QUNBek5HSi91UzlWT1I4aXJpc1FDcS82RmJrOEdWNXo1Q255Q3ExWHM4ZHUw?=
 =?utf-8?B?QWNaRTJxbFBQTDVudEFIYU9LcjRZUDZRejY2UlJJdk0yZU93R0F3TFJIRWF6?=
 =?utf-8?B?YkpRVUhScjEwaEpSTXZYazF3MlJvNzF0TU9QOVVNKzErSjVDOHBXdFRxV09T?=
 =?utf-8?B?NGxsNm55bTBqbm9Jb1lmVCtzTTZvWHpDbnZVc3Z6NG1BaFNaaVgrcHUxL2xu?=
 =?utf-8?B?SHBsZkJpazhGOEY2WFNIajFLdWNkMlN6blRsMTVzR1VGYkxmOXBjOXFHRlV6?=
 =?utf-8?B?aDdGSXpmdWlWN3dWcHJGTyt5Qm1YVHplWGltdVd5ZXNPUjJwaFhSbWxkby9L?=
 =?utf-8?B?NTFvLzIwNWFLL3h3eDVobVN3bS92QndiSG1oam9COGl3UE42bk45clpLNks0?=
 =?utf-8?B?b2xoQU5vMmtVdnhKZUxRSGh0UDhlam1QUk9FaitsaHVoRy9aVU9mUVJ5aTRr?=
 =?utf-8?B?Zm9EYlI0c0hmQ1A2dkRZTG1PWWQxbTFYUU44OTcvNWxsZXlUQlhkVWluUzZS?=
 =?utf-8?B?ZG83RnRnNHp3Wi84NjZqbVVCcGk3U0VnWkJhNHhVWUlWdHc5TFcvVjJOUzFK?=
 =?utf-8?B?VU5YdkJWalFYY3lMalo3MXRMS2JkK0FiSUJBZ25KTVNMbzVNZDVLUkVSd0Mv?=
 =?utf-8?B?dytHSnpkeGlYTlo0VlVNY1AySWJDb2hscTZFeVpCU0RFbnZpRXc2cHl6clVE?=
 =?utf-8?B?NXUrOUFhMkc1R3VyZHlpQ2FETEQybUNoajhLQjczVWF3ZGxlVW4yRnFac0NR?=
 =?utf-8?B?WjBkUmZaYXVXM0VTYmRrZ1haYmJ5UjdaMFBwVjVzSEJjTHF1SU16cmJncGN4?=
 =?utf-8?B?MlFURzBLcnVvc1YycUpBL09KR0svMkJOOWd1SEtvdG95STJabEJwYzE3SDFK?=
 =?utf-8?B?SDhiQWtwcjlacjFEY1NmdVNleDMxUE92K0VZQzYxZVp0NFFORUZvS3JzcFFq?=
 =?utf-8?B?Uzh3K1Q1TW54N0laWGRNNnpFT0svWGNUQVhQb09aWTVzdVEyam5wTEhLUUdW?=
 =?utf-8?B?bXJxVFY0SE4rV1UzM2kxN2RvdmcyQTB5ekM2Zysvekc5U3YrZHdEcFl6MjFz?=
 =?utf-8?B?SkYrRC8xVE9HelByTjF4QVJaSTJlRWI0TlB6QkUrWHFZRkZGNldyTER6U2F0?=
 =?utf-8?B?ZmlsUGt0WkEyREYvUk1OTEdaVHJTK3NPRHNmUzgrZnBCY3B5d0RaTnlzLzFs?=
 =?utf-8?B?aE81VWlSL0ZmaFRNTXVFVXdzaXFRY2VDZE43cUw5bWFqV1dXMDhvMU90K3Bq?=
 =?utf-8?B?ZHl0WURkV0JTZEdQUlBpSUNmN1dJcjJLTU8vM1lLWWIyYzBZVmxSTExZbEVB?=
 =?utf-8?B?RHlzL2cwRms0Uk9ybHBXTldkZWQreXZxNVRibk90WUxpdkxlQ2xwOWt5dlhS?=
 =?utf-8?B?eUJhaHlEaHJncEtIbzMxaVBqZlpaMVhhNjFVR2hQNE5SUGptMU9nRUl4OWI1?=
 =?utf-8?B?YTQvalkvdFoxQlNHU2h5MEFDbENvRlNjckhURE1nNXBVRHdMbTlMSmlkYk5m?=
 =?utf-8?Q?CS+6eLRod2Q2VSqCqrapjjbTY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d21b715-fcef-4128-b740-08db456ac88a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 08:55:13.6358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ji8jTjLS0w0W/QpfhgFPFKwe7Ps9ZtOmypYdYmGgICpkvI3aMejmbwrV3vpQ6x6vsWOt3QsU36DQTQ1BcSYYWbNIPS0lL3JvWVzO73UdA50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11017
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjggNS81XSBNQUlOVEFJTkVSUzogQWRkIG1haW50YWluZXIgZm9yIFJaIERVIGRyaXZl
cnMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEFwciAyNCwgMjAyMyBhdCA2OjEw4oCv
UE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQg
bXkgc2VsZiBhcyBtYWludGFpbmVyIGZvciBSWiBEVSBkcml2ZXJzLg0KPiA+IFdoaWxlIGF0IGl0
LCB1cGRhdGUgdGhlIGVudHJpZXMgZm9yIHJjYXItZHUgYW5kIHNobW9iaWxlLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+
ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAgLTY5NDgsNyArNjk0OCw3IEBAIEY6ICAgICAgICBk
cml2ZXJzL2dwdS9ob3N0MXgvDQo+ID4gIEY6ICAgICBpbmNsdWRlL2xpbnV4L2hvc3QxeC5oDQo+
ID4gIEY6ICAgICBpbmNsdWRlL3VhcGkvZHJtL3RlZ3JhX2RybS5oDQo+ID4NCj4gPiAtRFJNIERS
SVZFUlMgRk9SIFJFTkVTQVMNCj4gPiArRFJNIERSSVZFUlMgRk9SIFJFTkVTQVMgUkNBUiBBTkQg
U0hNT0JJTEUNCj4gPiAgTTogICAgIExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAgTTogICAgIEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmlu
Z2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+ID4gIEw6ICAgICBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQEAgLTY5NTksOSArNjk1OSwxOCBAQCBGOg0KPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkc2kt
Y3NpMi10eC55YW1sDQo+ID4gIEY6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkdy0NCj4gaGRtaS55YW1sDQo+ID4gIEY6ICAgICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxs
dmRzLnlhbWwNCj4gPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUueWFtbA0KPiA+IC1GOiAgICAgZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvDQo+ID4gK0Y6ICAgICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1Lw0KPiA+ICtG
OiAgICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvc2htb2JpbGUvDQo+ID4gIEY6ICAgICBpbmNs
dWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvc2htb2JfZHJtLmgNCj4gPg0KPiA+ICtEUk0gRFJJVkVS
UyBGT1IgUkVORVNBUyBSWg0KPiA+ICtNOiAgICAgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+ICtMOiAgICAgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+ICtMOiAgICAgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+ID4gK1M6ICAg
ICBNYWludGFpbmVkDQo+ID4gK0Y6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwNCj4gPiArRjogICAgIGRyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1Lw0KPiA+ICsNCj4gPiAgRFJNIERSSVZFUlMgRk9SIFJPQ0tDSElQ
DQo+ID4gIE06ICAgICBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPg0KPiA+ICBNOiAg
ICAgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4NCj4gDQo+IFdobydzIGdvbm5hIG1h
aW50YWluIHRoZSBjb21tb24gcGFydHMgdW5kZXIgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvPw0K
DQpBdCB0aGUgbW9tZW50LCB0aGVyZSBpcyBubyBjb21tb24gcGFydHMuIEJ1dCBpbiBmdXR1cmUg
aWYgd2UgYWRkIGNvbW1vbiBwYXJ0cywNCldlIG5lZWQgdG8gdXBkYXRlIHRoZSBlbnRyaWVzIGhl
cmUuIEl0IHdpbGwgYmUgZWl0aGVyIHRoZSBwZXJzb24gd2hvIGlzIGdvaW5nIHRvIGFkZA0KdGhl
IGNvbW1vbiBwYXJ0IG9yIGl0IHdpbGwgYmUgYSBjb2xsYWJvcmF0aXZlIGVmZm9ydC4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K
