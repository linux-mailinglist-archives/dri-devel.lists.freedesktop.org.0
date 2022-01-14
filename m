Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17748EA14
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 13:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE810E284;
	Fri, 14 Jan 2022 12:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490B410E284
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:48:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVnbFWT7YZ0gDq3CgCgies3Uyf6yj7BXIISqpa3eFV6PjxHeR2IhXg/x3bnYWTpbNhZwjEP0aqicofsClJPTVEE+8H61j+OcjavG5DSZAxyH5y3yNsBcZ9d5y3z4ouL8F/0p/Z3abuGxKLbDq9I3qeLhSlOpcw/+A67n11mC0zSPDuFmafkk99BmqvGRU/HJifgZDm1c4NIcPM1+FmdcfaWcz+ucWtEVkuB0v3WUD+Ef3/7ZMI3oqi0Jq3rmDPFxxFpA1El12QRH0EqZ9mf5/uDVgHUA62PsszhXaf7+7QqmKrcio3DR8Z9pjD+Yd9BXHFKnzq1VAWxuc7e4BlOVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWIRdi8wsHVpACyzxJY+9dDaZg1vE2SZQWMEcpM+ASA=;
 b=eiHley04yzrWZJ515XY/D8bjBVIK1yfpUpOSK1JhQg0kcBQVC1B3c7CScYOBZV9vWP+FTtOP2uhGwRmV6fYX3g8PBaGCiWz/4OLtTmIx6hzKjaEpaT8ypZ/3ZZ76hUF0f77jJixHi3EozCWVHhB7ISD0K0uw6enuHrnBXfZgdedWta2XSvL00bN0qGRz5cAPG8ML0s+sRWESFab83y8P/B4WZbAHEPHAAntlKnof8sdrTS6G9WATb+ZEZ00aI2PMvj9Vu0yyls39B+1jyoxtRNjqJPfI2NHYU2qtUJ9KRHZSUtMC6HUTPGpqchR3XjJQxMLJ02Wih6rwblyZZvP58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWIRdi8wsHVpACyzxJY+9dDaZg1vE2SZQWMEcpM+ASA=;
 b=qWt7zJh2CB77IeO0XKjL8SQRXrSnbmnb4Ov5Ttv8NCKJ/TcByIvgKAm3UvhqK7NeUNue1VNEGBpc73sQVmMeDR4lnC7QoTX9b1lmZBv0bqlgi9kUBxTB9N5ZEOAPwUF2Loy+CUvA+g7hYw5wgg5txgZCoLJjPyHEmJ9TEX56Y1Q=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB1997.jpnprd01.prod.outlook.com (2603:1096:404:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 12:48:36 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f57b:c0dc:5495:2354]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f57b:c0dc:5495:2354%8]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 12:48:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYB9xy08Stwm8odEmNMsyDe+bnR6xiUf2AgAAn/tA=
Date: Fri, 14 Jan 2022 12:48:35 +0000
Message-ID: <TYCPR01MB59338D2B06235334268720C186549@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
 <CAMuHMdUf7DDPemUjrWTuy7y4G-mJcHoje5EvNqEzZZTPYeUbuw@mail.gmail.com>
In-Reply-To: <CAMuHMdUf7DDPemUjrWTuy7y4G-mJcHoje5EvNqEzZZTPYeUbuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4adf721b-0ccf-41af-dd19-08d9d75c2e03
x-ms-traffictypediagnostic: TYAPR01MB1997:EE_
x-microsoft-antispam-prvs: <TYAPR01MB19975887DFB6924AACC9C0D586549@TYAPR01MB1997.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2q35xHQqi3HepKqnTLQwR8dyevV3sEjcyi1ZjLBWzaTbOSesjNadjQst4fUJV1n4KLWLBAVdo9H/hNM8KWzbIPVD9MoXVUGKjoGEOZGO6aknluF0e4zlFo0RCYt2e4iXA4e9sD4LaR9llrS2anvSOSp0SA+k8Ewl2ksCXmQCvvveKT/HotzMGUd3RPvdUumSgUsf5XYYn/rFFQ6Eh/wEvI0VJ4frm158NscgoNsFtCIL+1QLnUTE0UqXOnXRMB0dlSTcwmNnCu4/rl9ajgRUZJlKbYC5PLWIrac/9npAGMGtQZqZXjEB3KNsvfU43jTBCOvsZyFfjwQiCZxfLuyZNItZjp2FLpM1L+G7twJO+Tw2j/j01kRjpdpwmgrNNQoeDxoq7gwpXxHIMoJP94of2avygRDtDQ4PFV2JS1GlwgZIxGOL4mL3N1UU1RY/6slAzBdS9kOcnoMTArLHz1qwMXgCeS4CtR0iesUmGMqpRgzH7ywy0bnG1oaS7GHGgKELb7eCzOLyY1+OjmmYK8DWUNdjA/zhRkNUghLDZqLYxsozH2LQWYJaLCB8e+HIw4Q+i5Raw73uLxStJfW7ggvWvndnEP733vHbx8LRZlTQczLtJ3AtlWaE9owZfJNSDf9r1cl4Aurg7F2u9RQSoqAFxMACOZu7qPQGn8XbgdrbptUIvpG0DFg2dyafY4PwvZzv7pcp3Q1ZmnUCPPocjlcIVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(66446008)(66556008)(66946007)(66476007)(38100700002)(7696005)(55016003)(76116006)(2906002)(26005)(9686003)(86362001)(8936002)(5660300002)(107886003)(6916009)(8676002)(316002)(508600001)(122000001)(54906003)(6506007)(53546011)(33656002)(4326008)(71200400001)(38070700005)(52536014)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2JHaDd0NlQwUGpzdzVyTVJmWTVndDZVYUVLZmRsaVlHSjhxS3FJNXg0VVVv?=
 =?utf-8?B?TXNwSTl1T2NScWVJRS85dkQ4WjNFSUpZYTFmeGRZMmxQcngwVDNDYko5a0V0?=
 =?utf-8?B?eGxLcUNTUmdNNHBCRm9lTTJLeXFZeG1NZlhDSHBjb1paTURFcVJaR3l3UWVj?=
 =?utf-8?B?NnR6SE45SnliemxDeDlpM0VxTDZVTWY2UjQ1aEovSnlSN3IxdUM1UUpXR1VI?=
 =?utf-8?B?ME5jeDkvVFdiV2w1cU9hM0NZR1hjN1lVcTVUOGxVc2MvQmQ1bjhUMVRIM2ZE?=
 =?utf-8?B?amFjblJvMnNreXBIMEhaM3lvd2dxTFg5ZzRqV1lxNFJMamdGNHh2aDFtajVL?=
 =?utf-8?B?NVg3MFlNblZqbWMydVFWQUhNdjU4aEVZZ0dva2lPdWlHcFZleCtZQk0wcUhv?=
 =?utf-8?B?UWo4YVF3NTk1WXZtMHo1YXY0eGFFeVIxMlJTR2Q0QWtmNGVQVVhkcUR0KzhG?=
 =?utf-8?B?M2QrTGY0dkxwSlpVRjV2QkxRTWRIdVpNcVZzUXJRZ25BWndPU0kvWUNWU281?=
 =?utf-8?B?eGhudnBFYStKTlNRS3lmSkxQSTRtelg1YWVNSXVYMURiRkl1TGpBYUNka0hG?=
 =?utf-8?B?RXhIZ3FIT2pxb2lkSEhyWDY1elhQYmY1ci9EdFNDTHpscDNZc09tdjZKWjhu?=
 =?utf-8?B?ZlZNekEzbmRkK3VNcEI1YXVjaXhUSDMrMFdnQ1NSM0k4YzNpRVdqTjEwczNC?=
 =?utf-8?B?RWdESUtlOW8zTm5uNkl2bzJIU1VjTFk3MXlrWkR6clFBL1c4bFNtaXJ4c0ti?=
 =?utf-8?B?OWJGTldQc0xoaXg1S2dNSzNRbmE0SElPaE95SFM3Njl5eDJHU2FFNlM4amZS?=
 =?utf-8?B?eHZWZE1vMmlXZ2VOMnVnancraTJpWW43eW4vSXlYRFZBK043aHkzamY2dHBR?=
 =?utf-8?B?ei9heGZoQS9MdEFVN05oS3NSNVl6Z25hZVNmSm9NdGtyTGRZRnRkSDcxNVlp?=
 =?utf-8?B?M0tJc0RyR2E2MGJSd2FMWDlYRmUvQ0ljNFRvcGsvOHhScEN5Uk9JY3lKOTFT?=
 =?utf-8?B?aHljYU5nbzJCandKZEtCU3JEa1RUbG1iei9jblpFcTJSMmJOOGNEY3N4QWRF?=
 =?utf-8?B?V0ticVNpcy9PbUF2dWc2ZDBrNitVY0pJR0pDN0t6b3NIejJXeFFYcDZGQ3NE?=
 =?utf-8?B?b283NlFlWFZoaE1oWjBLcUV6NEp4RVR3RjVyRThJS2pJSHdpbkJPTFd6TGdV?=
 =?utf-8?B?SWVodDVuVEFaeFB2ditOVWdweVVsNW9hREg0MngwUk5PMld4STRkUEE1aFFN?=
 =?utf-8?B?dWVITXVCZDVITWFodzhDNk5LTlhBb01mSXE5ZUw0TUhTWFZiU01JL0NBZk11?=
 =?utf-8?B?NXJKbUhabW9GTU9icVNlV3JwUEpIN0Z4cnphdDUycEZWUEp0WklmRFVqN05r?=
 =?utf-8?B?Nm5US3EveGZhMlB0c0hkc3RoL1NuWjhJRDRFa2hTTWNUWlpJNXVOLzBsbkRX?=
 =?utf-8?B?REVtbGd4WThGNkRhajJsZnFWci9NOXVKLzVQMmxsRHRJc0Rsc2pKaE5mT1M4?=
 =?utf-8?B?alBFR1VDQnNIaGFySEJvN3Y5amJGdDRxNUtZMElua05VTUQ0ZmpNaFNmTnk4?=
 =?utf-8?B?c2VJTCtscHQ1RjBETFhmM0lGK1AvMW5qSDgrOEV2T0dBNmtuVThzaTgrUTVi?=
 =?utf-8?B?bnBCdHFXYjYrbnMyaHBlWUlDVnRHZm1MbGtEamdady85RU50SUVVMEZBTVlS?=
 =?utf-8?B?RGdrR3NNSVdpTEthVFFiZUxQSm8xc2VzYWJBcEIxdy9hejVsS3lVWTNLVmpE?=
 =?utf-8?B?SU9JSzVKNC8xeURZMG1sd2hIRDJKWjdNVzhvamY1MXB0ZWFUV1Nnczh2aGR3?=
 =?utf-8?B?NHVpWTlmSElUM0dHbG1OSUpib0pKL0FjRWl0Wk5NNUhLNTFqSER3aDFpZk1v?=
 =?utf-8?B?SHVMYU0rd054bGpWdFFXTkR6aXNXL1dpUE8zQWIza3VMdDhaOEY0M051OVJh?=
 =?utf-8?B?bWtKb0xTK3hDa216L1JOWjIxTHdGcU9tdnNsMnNTc2xtT1RRYldEUGg2ajRP?=
 =?utf-8?B?QjBERGJWRzltczMyY01kMmpzOWdpZ29McXVHZjNGamdrNUhCSE9kc3hmSmQv?=
 =?utf-8?B?VWtDOCtOZEtTM2dOWlg0R29OR3RpblV2UDBJcUgzdGhoYk9NYkh0aDRtVFVm?=
 =?utf-8?B?R3FqTVlJb2hGUFkrc1dmaGdxTnoyR3l0b09jRktERUxrNnpITkp5dTkxN1c4?=
 =?utf-8?B?c00xSzJOWHRMY05telRZU3lpKzY3d0cxN0dKeVE1RkVoMjRnZ0lNcHh4UFlM?=
 =?utf-8?B?WE1qN09iZnAzWEhnN05Ua0M0TWVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adf721b-0ccf-41af-dd19-08d9d75c2e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 12:48:35.7979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otj4IMsQBBXjX72uZhG2t64J70hj8zNpyQlxNHx5/PSO1ZDrtIIMHrk2qLh4IlcRPxCLHeNzCvVKj0LgMGdTEH+1lR8t02LPSSlZ6ocwVbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1997
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UkZDIDIyLzI4XSBkcm06IHJjYXItZHU6IEFkZCBSWi9HMkwgRFNJIGRyaXZlcg0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIFdlZCwgSmFuIDEyLCAyMDIyIGF0IDY6NDcgUE0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGlzIGRyaXZlciBzdXBw
b3J0cyB0aGUgTUlQSSBEU0kgZW5jb2RlciBmb3VuZCBpbiB0aGUgUlovRzJMIFNvQy4gSXQNCj4g
PiBjdXJyZW50bHkgc3VwcG9ydHMgRFNJIG1vZGUgb25seS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2Nv
bmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tjb25maWcNCj4gPiBAQCAt
NTEsNiArNTEsMTMgQEAgY29uZmlnIERSTV9SQ0FSX01JUElfRFNJDQo+ID4gICAgICAgICBoZWxw
DQo+ID4gICAgICAgICAgIEVuYWJsZSBzdXBwb3J0IGZvciB0aGUgUi1DYXIgRGlzcGxheSBVbml0
IGVtYmVkZGVkIE1JUEkgRFNJDQo+IGVuY29kZXJzLg0KPiA+DQo+ID4gK2NvbmZpZyBEUk1fUlpH
MkxfTUlQSV9EU0kNCj4gPiArICAgICAgIHRyaXN0YXRlICJSWi9HMkwgTUlQSSBEU0kgRW5jb2Rl
ciBTdXBwb3J0Ig0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBEUk0gJiYgRFJNX0JSSURHRSAmJiBP
Rg0KPiANCj4gSSBndWVzcyB0aGUgZGVwZW5kZW5jeSBvbiBEUk0gY2FuIGJlIGRyb3BwZWQsIGFz
IGl0IGlzIGltcGxpZWQgYnkNCj4gRFJNX0JSSURHRT8NCg0KWWVzIERSTV9CUklER0UgZGVwZW5k
cyBvbiBEUk0sIHNvIERSTSBjYW4gYmUgZHJvcHBlZCBoZXJlLg0KDQo+IA0KPiBQbGVhc2UgYWRk
ICJkZXBlbmRzIG9uIEFSQ0hfUkVORVNBUyB8fCBDT01QSUxFX1RFU1QiLg0KDQpPSw0KDQpDaGVl
cnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICBzZWxlY3QgRFJNX01JUElfRFNJDQo+ID4gKyAg
ICAgICBoZWxwDQo+ID4gKyAgICAgICAgIEVuYWJsZSBzdXBwb3J0IGZvciB0aGUgUlovRzJMIERp
c3BsYXkgVW5pdCBlbWJlZGRlZCBNSVBJIERTSQ0KPiBlbmNvZGVycy4NCj4gPiArDQo+ID4gIGNv
bmZpZyBEUk1fUkNBUl9WU1ANCj4gPiAgICAgICAgIGJvb2wgIlItQ2FyIERVIFZTUCBDb21wb3Np
dG9yIFN1cHBvcnQiIGlmIEFSTQ0KPiA+ICAgICAgICAgZGVmYXVsdCB5IGlmIEFSTTY0DQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
