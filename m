Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3148EA17
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 13:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BD610E268;
	Fri, 14 Jan 2022 12:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBFD10E268
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJwt8j/JQRSW5PNtycfDIRxJ0XH4EHCEv1cyThSBxjS3VNdLgXB33RdEtbR0KtATOZ//CPWlmHCwESf+RtegXUl54u+hPi5wB4/vQS8+FpguKws6yPCitfjYCYgRWUXBHDFpsnbi9+RGCzH6/dUF50ewkaf+w0IYyrLbOzQS4hN5Y8n2xOmuOxs4ySmA7SQXdp0tyzkEmJIaAqAW6lTgCJo+bGJwlEzKV12cipbxue5TLXb8fvdJ+bR6U7t9ZYeKPTs8CTkkHZeDvT5ppOKHuBIcpFwrIhBdorbda+7dRrvyVrSUfYtX3HBPQ7o0Mmh8q/z8Dd5P9C6wjkdMQ+tiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9ko/XBoAeMaTmyAQXNPUz+iOWsZQpWUEJ3bpvuoejU=;
 b=Blft4pcrqBSfJYciA7W+nB3fXYL3YmHLXX7RQZlmoN4GpXaeWanaRQEEXlSgyDyVYkkHWueCt82ipTuyCb22/YAKd0VG/4yfLS3upoT/Prsn/rLMfANMiC9mWYLR7RHpLdmyWmWzkN/I6Rz6VhZsUeaHAtoZ4vF87ZkmTQZoO5DLqYacCKBQKlbLGPgpNLgFQ1DjQVgt/IY8wl9zv/pPjjKIvbTB7TmsbNdtvMKQWOUd0Bbzh9TJ/yQXt9XlgER/R7JwPWRZe+PGQX6oQ0Z60x5nLmzMF3wmmZAKnjBMF/hgFgqn5etIkFEV6kPr7/vw1hfa6o+5+JPTcvQ0Va1PpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9ko/XBoAeMaTmyAQXNPUz+iOWsZQpWUEJ3bpvuoejU=;
 b=ozGNWKjX2L7+ysmBHyNX59OEfpCaR+q2aYOrcJM2eo8HvueomExmvrnmOg/2xqoLpjoKx9s/ReG59G+bVu+Ui2BynqiyK81q8SE8G88rY3xtJBrRlX+AwDG1kKTgloIh4cPV5e26IDRgkc99l3KBanQDeFcu62a8uQhHCumV4Mg=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB1997.jpnprd01.prod.outlook.com (2603:1096:404:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 12:49:35 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f57b:c0dc:5495:2354]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f57b:c0dc:5495:2354%8]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 12:49:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYB9xy08Stwm8odEmNMsyDe+bnR6xiUyCAgAAnQrA=
Date: Fri, 14 Jan 2022 12:49:35 +0000
Message-ID: <TYCPR01MB593333E38B26A6A015BEF7FF86549@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
 <936f9c0c1de0fcf485b8f5e7a9e1a07b04d0b040.camel@pengutronix.de>
In-Reply-To: <936f9c0c1de0fcf485b8f5e7a9e1a07b04d0b040.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3e9e04f-71dc-4c34-0c63-08d9d75c51c5
x-ms-traffictypediagnostic: TYAPR01MB1997:EE_
x-microsoft-antispam-prvs: <TYAPR01MB199720B05B4188DFDEB58FAC86549@TYAPR01MB1997.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vxSbn11z0OFAFCa84Pm15V3+cYAFSu2j5+4+PB6Ux2KramWf+YpIx0W04T3l0CHj4dDZ/1uAyxkYj7wcqreo7eJzXSkdJEM+1pcljj1bVZwJX407gEtFsCPe0dmY1AQMNM7wLPxi+Ji200XlplN2MpfyUOJi8fX3bRvoiJzl7r/mIH1uW94edvBZBTbi/dt9jhObsb6MfqiQvbPzf3MSyuaCFWv2D8VDflwbkYL8Gy9c5LcYh+hY6cLm44sIgDR/N9NqGFrEcX6Om2+1rK2ESjV33ij0n/7Su/Vlw5xi76nxd4japTu6tubyjSEa5P3+2akeQPdZegNiYABW/T/mfeiqX5XQGl36FwUbjHzFzdw5oWjzdvjj2gHfhZrZHDg0Ccw4N8T9gXDLvGuYgMsujR/o60SVEvU6lDDKx6RIjPhDW5uJ22WibIO2dC5dEI7hs4q2XvqHsMAezAQJaJIhF2KTmrzSDPDZ/wNOLThq4MyTaNm8P2qdEWnxaOMZcHN6aN3RbGM5lDEsXaHLRgr3k6H6lT4eRQIsXW6ofgeDDmlbI9a7bfFf1k7/TW3Zg3H4Zf+52BDhZBRazmaYUAKNbPGj9qWLGpwpcp1zjILy1EWwySlPc9YZJQyuxLDDpKEbuxwiQxRW7ou6zHooBqbcrYhrvgWi1fas7xAQXirnlTWhOSUlW1PzNcIvAGWWcwHH7hL5k7etshA0Tc1iTn9Lhg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(66446008)(66556008)(66946007)(66476007)(38100700002)(7696005)(55016003)(76116006)(2906002)(26005)(9686003)(86362001)(8936002)(5660300002)(107886003)(8676002)(316002)(508600001)(110136005)(4744005)(122000001)(54906003)(6506007)(33656002)(4326008)(71200400001)(38070700005)(52536014)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1VvZkwreXZvZnFKSVFqTlZTQi9sUEhISlFvZk91L2x5eDJFODBTdnNsT0JQ?=
 =?utf-8?B?dU1PNFNUMmRQM1FPU1BkU005R21xVGwrcDFTeVBQNk1jdG5yMkRMck1QY2Vq?=
 =?utf-8?B?eWNFdmoxTnBmR0dVZmNSbFNiL3AxWFdNNW16WFFoRnF0cmVpMGZMQWdKbjgw?=
 =?utf-8?B?NVhJaFBYYlVSNHArcEowbWNaaUtpdEhmcC90NEJkVmlsaENESDlveG1BU2J1?=
 =?utf-8?B?cXNiWWYvYmFmbFNNTS9yb05kcVh3YTFiRkYvVFBsV1ZHR2ZMZGYwODhVdHhY?=
 =?utf-8?B?U0Q2OS9VZWRuWWVOeWxyMGk4Ykl2U21ZUDZVWG5KbFdKck53ZFBoRUhaOUtP?=
 =?utf-8?B?cnlKQ0RSdThEQ0lTaG9UeG5Vd0NNdklLeFAyVDcvbVZDYzhLNFNTb0NsNWpu?=
 =?utf-8?B?b0s4WXB2OW42cHc1RFNSYWd0RDluMmpaUy9CeEJsc0ZWajBBM2FJUFZ3NGF2?=
 =?utf-8?B?VDBOcnpDbE9mb3RsSnErK0ludm9qbGRIK2JZVWlJV0hYZDQybVJWUXcxaC9F?=
 =?utf-8?B?ZHVsYkZpTnYxRjJ0QWRkaTRGU0hxK2xvN3pFQ1oxdS81bENmRGRkMEhvcWk0?=
 =?utf-8?B?K3FOdWZoVTZzUVVGd2VXcFlPZ2NUd0hQdFNsbWZJZmtETjRjdGJ4MlNWSGpC?=
 =?utf-8?B?a2V5eDdSdEJ1cCt2eXhzNFYvVDV3cjFFYXEreHFKQWRBb2J3ZytlWlhKK0Vs?=
 =?utf-8?B?WUYzbFRZdHpESFRZd3RZUENHRWg4d2V5WDlxNzZWWktlb0lhNHFaYTJqcFNI?=
 =?utf-8?B?QmxDTkV2SzdQT3JtY21ISmFTVFpOS3N2dmlEMWpqM3VRUDF6QldsTG0yK1Mw?=
 =?utf-8?B?SG0zNTU5UXdyRXAzTitYTE90Vk02ZDRqMkFJWXFGSVRLT2I2UmZ2SG1FUUFo?=
 =?utf-8?B?U3pNS0tOcm1ET3Y1KzYrVTVkNDFzTmJaTDVPQ2F1Q0NKOWVLbW9NQVRLTjd2?=
 =?utf-8?B?S0k0L2I2NnV0U05YU3gyNGNWQ3JzckpvZUFVbHUyVEltWWJsRVJ4TVFoS1ZL?=
 =?utf-8?B?dDJzcmsxeEg2SE9XeldjQi8rVklWRnVNYjJXVjl1blIvVjd3RmkrLyt0c1Rs?=
 =?utf-8?B?VmhhZE51eDN6aFRjYlpBeWc1TUVJVTBwNi82OUV0RG84WTc4SE5DYm9raVhT?=
 =?utf-8?B?YkRSMjEza0l2ejdoSW9KUWQzUkc0VXNFWjJwRG5iUWxJZWRVOWpRWFAzeTBN?=
 =?utf-8?B?RDYraTMzcmFJVGNucG56YnU3b0hmQmRmdkg3MVJyRGFDSk5RNHpCM1lJbkhT?=
 =?utf-8?B?ZG5EYndxcTgwOUtwaXNyK0FQdThDSWw2bVBIWG8xSzlVQllnd0lGbEtlNTBq?=
 =?utf-8?B?UkZabVZma09FdVJ2RDhUYXNoVU9aaWhZTmVydFhNMkV4WlgyWHlhbXlOa2pi?=
 =?utf-8?B?TlV3RWk1YnRIR2tQeXl2amtsVkgvMmZBUnhMYldiM2ZLNVpYWmNyTzBQN0JQ?=
 =?utf-8?B?THBIN2tsSHozWlVoSkQxbHpNMDZHS2R5RFRHbEZtRWxHVGNkcVZ0T2dnSVBo?=
 =?utf-8?B?NTVpQ1RHakw1M0xkK2JZNFJ4b0NYa2xyNEZRUElOVDd2TEdRQjFOWURSa1dP?=
 =?utf-8?B?TEJZS2xOQnFZOWhsQm1jVXowS1FEcjg0SEVlNnJXZURQRmR6NVV3VFNlUXB2?=
 =?utf-8?B?SExoMnlxdzJZQVA2S2dxN3ROdm5MeFNnL21IK0pLT3FMYlBscDZiQ0RjS3Y5?=
 =?utf-8?B?OUhYWHZiV3NBZ21XYi9jSEZpQ3YzdVowOVk4TVNCMEpjUUNUcjBhQ2tsN0Zp?=
 =?utf-8?B?aGpucVBDdVdwWHJwa0tWZ0R4MDk0alFqMnpvWUppeTc2cUdvTUl4MlRFeWcv?=
 =?utf-8?B?QnRteUdJUFoxZitwYUJvb1p0Ym9Qd05TYWJsUEgxLys2eEJMWEQxSTlaRVV2?=
 =?utf-8?B?MjZNdGJpbzBXQ2JxS05KbzIrOVRYZkZQYVlWZHpmS2QyUUVDa3BxL3o4L3RW?=
 =?utf-8?B?TmduK3krM1hZN2dhT1NPRWZ4amMvYkNSSy9KVkIzaDY4aklkL2sxanE5Rnc1?=
 =?utf-8?B?SU82VWpldGdPQ0syT3orV09QZW1QZnpod1YyQmJjNGRFLzlZU2VUMkZPK1pR?=
 =?utf-8?B?eldPZ2dNYTJCRytkUW9MZm1Tc2ZQaWxyLzNBYzF6clJnZlpPczY4VUhKRGIz?=
 =?utf-8?B?LzBJelZSVkdaUDB6Wi9ycGZBS1owRWxTOVZXOUYrQ2ZtR24vOGRqbHlDaldF?=
 =?utf-8?B?K1Qwam03UmtXYjFZcnd0NFJVanFWL2hKbmNwdS9SNFc4OFFBaTVveVZpV2lj?=
 =?utf-8?B?c2R3SUViang5b05xZnB6RC9wQjNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e9e04f-71dc-4c34-0c63-08d9d75c51c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 12:49:35.7998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u632J8bb/qBUJ+6vdBgWlrILGtWqF8PZu4zIbvUBiZ9t+PDZbX6WHLI/v95YmP0ASqpC8zsSZK881THVAjFo3Te3nx6BoawRqhN4B5rToXE=
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtSRkMgMjIvMjhdIGRybTogcmNhci1kdTogQWRkIFJaL0cyTCBEU0kgZHJpdmVyDQo+IA0KPiBI
aSBCaWp1LA0KPiANCj4gT24gV2VkLCAyMDIyLTAxLTEyIGF0IDE3OjQ2ICswMDAwLCBCaWp1IERh
cyB3cm90ZToNCj4gWy4uLl0NCj4gPiArc3RhdGljIGludCByemcybF9taXBpX2RzaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+IFsuLi5dDQo+ID4gKwlkc2ktPnJzdGMg
PSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KGRzaS0+ZGV2LCAicnN0Iik7DQo+IFsuLi5dDQo+ID4g
Kwlkc2ktPmFyc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldChkc2ktPmRldiwgImFyc3QiKTsN
Cj4gWy4uLl0NCj4gPiArCWRzaS0+cHJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KGRzaS0+
ZGV2LCAicHJzdCIpOw0KPiANCj4gUGxlYXNlIHVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4
Y2x1c2l2ZSgpIGluc3RlYWQuDQoNCldpbGwgZG8uDQoNClJlZ2FyZHMsDQpCaWp1DQo=
