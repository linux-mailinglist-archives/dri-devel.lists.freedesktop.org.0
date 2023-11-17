Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D97EECFF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 08:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6328110E71B;
	Fri, 17 Nov 2023 07:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E753610E71B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 07:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocYTUtVynQCZIipU0rpn90l1aiY5qqPh7aAcAis/l8iemw8Tp/cgtt5NFqOyKK7H341iQ+UgGW/8lMCBvukUvwLYEbcreEuy2XcHjwNCvRHuLn55Z4TxotTUsd7ylq0nxJUolkJdS+Xugle3iuEXVHh96FwXgJknD0y/2R+U87pp9ptKCYgA22KRGdpsZ0V33gbjJrfC7t4eRZwEJKsNSQD9nwSwg1nKq+E4CgxajJmSgBC88Y+QblyK45270HeSvUiaRTHPxjqUkOP6kjYZbXRgjWJdH0xdVzfSBRj+g0K3JrftwRwHqqzmoN0Jl5vVzOhwNvN4KUnZ9sEn32JlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VzNRtyQgZrZk9/zl7cLpzyoh7H7FDbKl2u1oLwNm2k=;
 b=QobQMqocAwRyel1ZR3aAhVbKfnm/vq+fXZZ/osNm1bK5pWxWhYHrXHibQW6g0ISpIlTNg6Koo1tQjH2c2bmXAi2WtQhQrmrKGfct0cOVMZCHT3HBiyuXbFi51hwtmZDJcWuUcocutg/I5MdnAg93nqwz8rxgIPs0mR2oKeBPhdrN6FtXQxk7c8dpbm4/yrspGXCQGrMqQLWUfisn5ULcwZthD5icoY6d9osNHChcmlxmOAiusA8NTfvvYxOXn4zbGHIimPCv1XKuP65dheGINdidxusxnaw+QGNL0ovFeYWTfh7rQdagfZaLaTEJUbKORAm7/usxt8aez6Vof0uAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VzNRtyQgZrZk9/zl7cLpzyoh7H7FDbKl2u1oLwNm2k=;
 b=d5CnxxEAAwR90Q7XOm5jSsf9KVYfuGihNcR20ZJc/GRHnGSlXYOkGYcrB8fiPmukAhZk4d7mCX9x0RheJssN0beT34YeSFI5ubETzN3lKQ68sV5Msoi7g6gIJ11GzHI+eH9HVxhlTsjbtR13iecvwGZa2ASGNqEF+/owB8MIlQE=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5907.jpnprd01.prod.outlook.com
 (2603:1096:604:bd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 07:55:00 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 07:54:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: RE: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Thread-Topic: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Thread-Index: AQHaGJeGZUEV+z0MqkWlcaHmYB1Kk7B9GjcAgAABo4CAAB/2gIAA50lA
Date: Fri, 17 Nov 2023 07:54:57 +0000
Message-ID: <TYCPR01MB112699CAF62DF1AC8F862253D86B7A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
 <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
 <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
 <gqbxdb2un7s2hqttzb4ryhcwpwvsxj244ubaifzpugryioj6bg@6dleflere7oo>
In-Reply-To: <gqbxdb2un7s2hqttzb4ryhcwpwvsxj244ubaifzpugryioj6bg@6dleflere7oo>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5907:EE_
x-ms-office365-filtering-correlation-id: 39f8ff55-93a7-4ae1-6094-08dbe7427e55
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fg+6HZbGa5wLWP4+fIcmjyDjNGVsFDJ7wMbok/X7zC36xC/QQgXhbBwxhtJSSaN1oLx3wSOTtSl7VMXKgEWUH6KY7WmR0DgcBHpddt4t0Y2Lz4uucNh/TiRr61EFohYVNWY9+MaiUW8BGKSoNVtDmQZ2uJ0B/OBJo2g1gy1aNdCjsoLHMhwCO7/eMyvSyghrxU4Dqw/RU74+QZobN23OZvAXAxbcCMRFZBS/D8xeAYfb9/8Seqe0iZxmWA4ShDwfElLdrjKrTagQz1p3siMHrSZrYRGrqtBbDYyg5DNyqP9GGHycPgb23cQxTxfHsTRx9fBiU2nKyKcunujHXUS7e4hKoZwxHdcS9huTj4JlCFZ/darwhcLhJ4YNaxF62qtoq4uL/iHhw8dlXUrPbK686W/4oTyd+fD42m5s/zEHowDAHCa0ktlJAqmGH/ylzSMt1CcOymSXFMVVPzr5nYuJguNUlbXCUbLdQTu6xhDpcmXudj1SlwL2EfuDGxAHnHiGTmKM7cPDhwSQiqL1VmWAxKy/yfktv5n9i979a7reRCkmfyY6HobxN/I/36ib+8cfIAtvldBEjJwlHhy7LU8mQ/FO8Uo3jKsLGQ9BIHaU7jc70K1hm2oOkEX3xWmUdofz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(55016003)(86362001)(33656002)(478600001)(66556008)(66946007)(38070700009)(76116006)(110136005)(66446008)(66476007)(64756008)(316002)(6506007)(7696005)(9686003)(53546011)(4326008)(8676002)(8936002)(52536014)(71200400001)(26005)(54906003)(5660300002)(122000001)(83380400001)(7416002)(2906002)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHBmQm1DTHlmWHhkTlJVNzArNS9IY2tqUzllOTZISXQ4elVCK09yRGdNRmxz?=
 =?utf-8?B?Zm5pck1WWVN4azRybzE3RGV5aXVPRmZxL2lxY0pOWkY4THhHNGQ0dFhsSHFN?=
 =?utf-8?B?TjJEVld6YjBGcTdYcEJNcVpQazB1SStRL20xdE16R282c1ZLSzJCSklEa0V3?=
 =?utf-8?B?aGhIaWhhU0w3ZEJ2MTdReUgwb21JN3BSK1VhbmUzYXU3aStRT3lCODI4TVBz?=
 =?utf-8?B?dlBsdGxDTTVwL1E0dmx3ZWt4eWovNmtNbVVtQk5FM0lCN0ljS0ZoWGc4V0h5?=
 =?utf-8?B?Z3d5ME1FMHgyOFJZTWg1REUrR3pXeTBvQ1pibStjbnQvc0R5UDVGeStweWEz?=
 =?utf-8?B?bFZTZ21oaXNwQnpOSFBINHI2SW15UURBaXoxWVlpMFJCdGtDd2ppazVMbUxB?=
 =?utf-8?B?TDJqaThTdHpwZXNremNLMkREVHFKUW94SE44TFBCQ3lxbW5wL3RHRi9hZDhO?=
 =?utf-8?B?UFQvcXV5V0Y2MGN4bVVyU2hLTGhyZG1DdnFpVWlubWFMQWpTSzE5eVcxaFZh?=
 =?utf-8?B?aUgvQ21jaURSS3p4OEhhd296ZHZ0bjVwRXp2MEhlR3IrM3pNMkpLSkMxTCto?=
 =?utf-8?B?TkNuUTJ0ZDE4R1UzVmIxbjMwYUlLVUswaHR5UThuQkx5VDBObVRpUmlaSUV2?=
 =?utf-8?B?V2NjWEQ1d0V0QW8yMm8xanV1d0xOdkpWZzFKaUFydGsza3psWS9KMFFacEFx?=
 =?utf-8?B?WWJwRTB3RFNBRG9aWU5xYW1kREJQb3l3Y3p6Z1UyMHlNNk1DVFFIUFAxMGZm?=
 =?utf-8?B?eWE4K1d2MVA5VGdWM1JmMElLa0w1bkhEUmRPVUZMcVJ1b0RPRVdNQm9Bbm0x?=
 =?utf-8?B?SGJ6Q1M1SUdPRUQxTVphUnFodFg1NStRbGZBc0lmVVl0cEEvNjBGeXpQcG95?=
 =?utf-8?B?RHJIa1kxZ3I0eGZzS2dIaVJNUm0xQ3J6SXoxNE83Z1NvRGpqR1VNa3prRElr?=
 =?utf-8?B?ZEJzS1doY0E2RWxtdmhBQnIxMW5VSHZLWHFtWDV3cjFZSkVEbUhvMUVMSVQ4?=
 =?utf-8?B?Mm5EaktLOEkyRTNKN085dVNkVzFtSEVWaDdNQjZwcGcvRDlaalJ0M2lRalBw?=
 =?utf-8?B?UVBHZ1NXZ2cySURiaGJ2dEVqZTBzZ25lWFBqd0ZhcHV4QTg3Q2xLUnRnWFlT?=
 =?utf-8?B?M2JxaWhZWXVRWW1RNEhuVkRFZDN0U0xJcnZ4Mk10RmRkSG1HejFXNHhTM3RQ?=
 =?utf-8?B?QlFlWkg1OWQ5bEVOYmVqbFlQZCtJYi8vWWV6cU56QmtDNE5oeUdiYm13cU9Y?=
 =?utf-8?B?ZWVyalBHM2RFQ3BjQThDOXRyQnR4SWFteW40d21ZWll3STlJV09Fc3IvY2R1?=
 =?utf-8?B?V3Y3MlBEZW8xREloZ2ROWU5mK3p6Z1pOTjZXYTlHb3BYK3pFcm12b3djVGNC?=
 =?utf-8?B?NEZydllXREV5azNtT0NvRWJUWDh0dGRqSXhLaWtiUHJWOU5vUWNFYmtyQllI?=
 =?utf-8?B?RG9WQnlaVDlGQzZVdDlyVFd2K29kZkVZNDVlSEE0OWx5eUxaTnlQRmZNQ3RU?=
 =?utf-8?B?VTlZR1NhVXdyYmttT3dzOGVPQ1FUSzRSeUg0cjRTVTZkb2QzWUJ2RVdEa2JO?=
 =?utf-8?B?dlAyWENhUEJJamszbis1d0d1WXdpdU4vRGFBeGJKdEF5ZjRVVHQyYlRCc2pu?=
 =?utf-8?B?aEVFNkIvdmxhN2NPd1F4MHFIREVKSFRhQUc3aWQzV2R0L3drZFNKa3NJMzFz?=
 =?utf-8?B?anEzR29vSitoK0dLQ2tiSXYvcGgvaGluOUFvL0RqQmZpaG01OXNYZG83MWc2?=
 =?utf-8?B?Q2s2bzh0WmNvK0VlOFVXZEFrK0x1bEloSjczbFYwVkNWTHZFSnBCN3lHOUFa?=
 =?utf-8?B?SzRWTkh0V0JmTkdPRGdhN3owVEI5ZDhldjhuTm54RXZUdDVKZWZaY3JMSE4z?=
 =?utf-8?B?WW5rcHNQMldVd1pvNGY2bThPaGVGUVNNODZneXVpNUx4bWNrZGdxeC9BMGFV?=
 =?utf-8?B?Vkl2QXFaWU5Eb3prOTl2em5qL2pKQ0F3NEM3dlVWOFpESW5FQ0I2VmM4RzNj?=
 =?utf-8?B?Z3RhT1dwbTJIUUd5dEVHYU1nQXpRSDhuVlBneEppaFhwVS9qR3ZPTHA1RXJX?=
 =?utf-8?B?YTZCZE1lNDdlUmwxN3lzczV0ZHA1ZmNCL3pIRnlqRVRtbEFUb0NHQkMwbDFu?=
 =?utf-8?B?MEJhUGlWN3hTU0U3Ukh6RGcwblBQVjBaUk1FTEwyTEw4MVJmOWttM2k3elFP?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f8ff55-93a7-4ae1-6094-08dbe7427e55
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 07:54:57.6390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ByqwiGv1IplamoUNzEIcyOGThop1yilKb3r8lSDnK7yxqF5HYPXJYuA9dxT8AoTKShMSlOaz2digziUrLBzSv6WxeBeeKptvUyQxNRXBm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5907
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lIFJpcGFyZCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTYsIDIwMjMgNTo1OCBQTQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYxNCA0LzRdIE1BSU5UQUlORVJTOiBDcmVhdGUgZW50cnkgZm9y
IFJlbmVzYXMgUlogRFJNDQo+IGRyaXZlcnMNCj4gDQo+IEhpLA0KPiANCj4gT24gVGh1LCBOb3Yg
MTYsIDIwMjMgYXQgMDU6MDQ6MDNQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
PiA+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDQ6NTjigK9QTSBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQg
MDI6MTY6MDhQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+IENyZWF0ZSBlbnRyeSBm
b3IgUmVuZXNhcyBSWiBEUk0gZHJpdmVycyBhbmQgYWRkIG15IHNlbGYgYXMgYQ0KPiBtYWludGFp
bmVyLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
DQo+ID4gPiA+IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4g
PiA+ID4gLS0tDQo+ID4gPiA+IHYxMy0+djE0Og0KPiA+ID4gPiAgKiBOb3cgU0hNT0JJTEUgaGFz
IG1haW50YWluZXIgZW50cmllcy4gU28gZHJvcHBlZCB1cGRhdGluZw0KPiA+ID4gPiAgICBEUk0g
RFJJVkVSUyBGT1IgUkVORVNBUyBSQ0FSIEFORCBTSE1PQklMRS4NCj4gPiA+ID4gICogVXBkYXRl
ZCBjb21tZW50IGhlYWRlciBhbmQgZGVzY3JpcHRpb24uDQo+ID4gPiA+ICAqIFRoZSBhYm92ZSBj
aGFuZ2VzIGFyZSB0cml2aWFsLCBzbyBrZXB0IHRoZSBSYiB0YWcgZnJvbSBMYXVyZW50Lg0KPiA+
DQo+ID4gPiA+IC0tLSBhL01BSU5UQUlORVJTDQo+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+
ID4gPiA+IEBAIC03MTU0LDYgKzcxNTQsMTQgQEAgRjoNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxzaG1vYmlsZS1sY2RjLnlhbWwNCj4gPiA+ID4g
IEY6ICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvc2htb2JpbGUvDQo+ID4gPiA+ICBGOiAgIGlu
Y2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9zaG1vYl9kcm0uaA0KPiA+ID4gPg0KPiA+ID4gPiAr
RFJNIERSSVZFUlMgRk9SIFJFTkVTQVMgUloNCj4gPiA+ID4gK006ICAgQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiArTDogICBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+ID4gPiA+ICtMOiAgIGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVs
Lm9yZw0KPiA+ID4gPiArUzogICBNYWludGFpbmVkDQo+ID4gPiA+ICtGOiAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtDQo+IGR1LnlhbWwN
Cj4gPiA+ID4gK0Y6ICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvDQo+ID4gPg0KPiA+
ID4gQW55IHBhcnRpY3VsYXIgcmVhc29uIHlvdSB3YW50IHRvIG9wdC1vdXQgb2YgZHJtLW1pc2M/
DQo+ID4NCj4gPiBJSVJDLCB5b3Ugb3B0ZWQgYWxsIFJlbmVzYXMgZHJpdmVycyBvdXQgaW4gY29t
bWl0IDVhNDRkNTBmMDA3MjVmMzENCj4gPiAoIk1BSU5UQUlORVJTOiBVcGRhdGUgZHJtLW1pc2Mg
ZW50cnkgdG8gbWF0Y2ggYWxsIGRyaXZlcnMiKT8NCj4gDQo+IFRoYXQncyBub3QgZXhhY3RseSB3
aGF0IGhhcHBlbmVkLiBJIGV4Y2x1ZGVkIGl0IGZyb20gdGhhdCBsaXN0IGJlY2F1c2UNCj4gcmNh
ci1kdSBoYXMgbmV2ZXIgYmVlbiBtYWludGFpbmVkIGluIGRybS1taXNjLg0KPiANCj4gPiBQcm9i
YWJseSB0aGF0IHNob3VsZCBiZSByZXN0cmljdGVkIHRvIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2Fz
L3JjYXItZHUvPw0KPiANCj4gU3VyZSwgZWl0aGVyIHdpdGhpbiB0aGF0IHBhdGNoIGlmIHRoZXJl
J3MgYSBuZXcgdmVyc2lvbiwgb3IgYXMgYSBmb2xsb3ctdXANCg0KDQpJIHdpbGwgc2VuZCBhIHBh
dGNoIGZvciBvcHQtb3V0IGRybS1taXNjIG9ubHkgZm9yIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2Fz
L3JjYXItZHUvDQphbmQgYWRkaW5nICdUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5v
cmcvZHJtL2RybS1taXNjIGVudHJ5JyBpbiBzaF9tb2JpbGUNCmVudHJ5IGFzIHBhcnQgb2YgbmV4
dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMuDQoNCkFsc28sIEkgbmVlZCB0byBzb3J0IHRo
ZSBlbnRyeSBhbHBoYWJldGljYWxseSBmb3IgbmV4dCB2ZXJzaW9uLiBTSF9NT0JJTEUgc2hvdWxk
IGNvbWUgYWZ0ZXIgUloNCmFuZCBuZWVkIHRvIGFkZCBlbnRyeSAnVDpnaXQgZ2l0Oi8vYW5vbmdp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjJyBmb3IgUlogRFJNIGRyaXZlci4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K
