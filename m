Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B86040D2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 12:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F90F10EC36;
	Wed, 19 Oct 2022 10:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 19 Oct 2022 10:23:05 UTC
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0335F10EC36
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 10:23:04 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2107.outbound.protection.outlook.com [104.47.22.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-PAEDYsIyNQ-66ctQJJjozA-1; Wed, 19 Oct 2022 12:16:33 +0200
X-MC-Unique: PAEDYsIyNQ-66ctQJJjozA-1
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 GVAP278MB0038.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:22::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Wed, 19 Oct 2022 10:16:30 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3c38:efa9:5eff:4caa]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3c38:efa9:5eff:4caa%4]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 10:16:30 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "chen.fang@nxp.com" <chen.fang@nxp.com>, "jagan@amarulasolutions.com"
 <jagan@amarulasolutions.com>, "jy0922.shim@samsung.com"
 <jy0922.shim@samsung.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, "inki.dae@samsung.com"
 <inki.dae@samsung.com>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "marex@denx.de" <marex@denx.de>,
 "tharvey@gateworks.com" <tharvey@gateworks.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "aford173@gmail.com" <aford173@gmail.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "tommaso.merciai@amarulasolutions.com"
 <tommaso.merciai@amarulasolutions.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "frieder.schrempf@kontron.de"
 <frieder.schrempf@kontron.de>, "narmstrong@linaro.org"
 <narmstrong@linaro.org>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Thread-Topic: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Thread-Index: AQHY46PbgP4YpYU1WEyvIt0HgelbwQ==
Date: Wed, 19 Oct 2022 10:16:30 +0000
Message-ID: <943a11cbe5637c706813744aeee658b66b3a1be3.camel@toradex.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0683:EE_|GVAP278MB0038:EE_
x-ms-office365-filtering-correlation-id: cae3cec9-ea4d-4e08-9959-08dab1bafda1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Bdq2cnyZDwYs6Da9dRcUn8mjl4ELd4j16o8pNl67VWzY8VzjppjgGb0bkQ8dDyl3tlEAKDJOHsVU5+//MXnT897Zp6AEMWF2k/ikvh2uOeGvuqJ+v9mOHxgCTa9DZ0hD76sCei2+vxZZT2i2/TuOeBLZbFfV73948InJejP2fgTx66JCmCYpd1xIe6MKZGRHQ7OPzVLTSOVDwfFC0XbMSBIAXwO8dS/Qlaoh9Ti/MCxXzI3pW1VeWaWp41AR80vQNHF6YhZq3a5L12OBe957+CnQr77NJfvPthdLJQ6Ji9tj4fdfyUp08AgtQ0TzNggplLe758XlUBiSN95Dm2sgCpiBbOed2Z0Yj2Zbn03Mzi8hEW4DAbQkBu9+MhdG5PqvoXwSltj3yrInjDEJ50XaIlLZFDmLJsdGP45+Uf/9h0D/I6picTCNzM43ySvXBqBivy/hJm6VrJ0r5HwHWEgy+JRVKHOXikUE2ziCLzb8Ukjalliki93zszTYmO97F1LE39ECwx5JSgFPy9sPaxrRW5jpTyYwC3V88x/EsnfsblghQAfb5BXc5yxR++QcJpZNv3kZOFxX8QZUDk6G1nmhaGDde5x5GOTQZ6y7lW9E8d3MJsw2l/PGzLpXu4d8Ab5vJPhcEWJQRc+IIfVbrlBNbrgqne0LDm3TwL39UVvJX/OlpF2GacEw8F8xgJ9DlqjZlnfd21s5m9SibNXeUnW+NY0uCswRvJHERphqPJlnLuACxEP8/chNnW9Ifw0HH250bPweJAI29um4x5UtPBGBx/isPjbjDHXnAIZFoi93jAP1Ax7SlgIyODjoQ1AkZM44
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39850400004)(376002)(396003)(366004)(451199015)(66476007)(76116006)(4326008)(64756008)(8676002)(41300700001)(66446008)(66946007)(71200400001)(316002)(2616005)(110136005)(54906003)(966005)(66556008)(36756003)(921005)(38100700002)(38070700005)(122000001)(186003)(6512007)(478600001)(6486002)(86362001)(83380400001)(6506007)(8936002)(44832011)(5660300002)(7416002)(2906002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGdQbXRqVFZkRytvMjRZT01aamRmL3A1N05kMUZ3Rlhabkg4Z3JCVGd4NkpT?=
 =?utf-8?B?Qk0rU3JUOExnLyt3b2VyalliVUgwSjh5OC9Vc2RNd1BGUzRiVTN0RFAyWWUy?=
 =?utf-8?B?K3RybythaHpzVE9uaEFqRzU0Qyt6cUxjMkl6MUxzaDdKcFErdlRXNnpDQmR0?=
 =?utf-8?B?UVNHeXZqTnJDUTl5Q2pUbUNwcUY1VTRjenN2emlIS2FjSGRweTh0YTREbGJz?=
 =?utf-8?B?SDlzUHhQMmZZak5SODZTb3dCV3ErZGFyVXFjS1RUUzZjQm9OTDMvZWpyOGFG?=
 =?utf-8?B?UWU5Y3N2Ykh0L3VURnpFTytydmNCRTZOR2VBWVd1Y2ZHbFBXQXRXRkFIVFBr?=
 =?utf-8?B?VHlCSnMrbWdRbmdQb1FHU1hpYVA0azhybnlSQzRrNjFyYWFaQll5SFF4QmFX?=
 =?utf-8?B?alVyNk91anVCSC9CbCtnYUVYdExHek1EZ3FhUnBPTUxHS0w3S3c3bEZ3VUE1?=
 =?utf-8?B?TS94cllJN0o5N1dBSlNPVzFvb2RJaFZmMkxYa3hQU0t1T0tJWHhhbjBHdkhZ?=
 =?utf-8?B?aGVUZFg0ZURjTW5BYjZCejJ3UkNXN0xqNVAvNitrMXhoUkhJQm14eFY0WGdT?=
 =?utf-8?B?R2g1NDdqNzNjM1RYMnA0dlNHZU5XOGhSdVJLOTRtRCtKNE9ENDdCTjBFUXVU?=
 =?utf-8?B?OEV3NnNFVUJSQTJnSnlhck81ajVidFQyRkxGL2Z0ME14azlVVDVkOHhrSXRC?=
 =?utf-8?B?a3hKdmtJNHg1UlNhNmZ3WjRGMmhVRldvNnFlUnNoR3dKS0xXaEg5RUM0cXky?=
 =?utf-8?B?bEdSQ25VR3M3UDNHT3YzNlphbnVIem5RcDViQ3RWdThOUHkzcG9OdkFTaDI1?=
 =?utf-8?B?anB0YmFJa25kMFZ2R1VPY2x2U2lOUExlcUxaT1kyV1N4VENqeFRsNzd5dHZP?=
 =?utf-8?B?VlZ0OHVpOHVKaHoxeUhLcENJRHFxSUc5d2thTSt2VmNGK2dHakxoa2h3WUha?=
 =?utf-8?B?akQvQ0JZd3Z6Q3RGTGxPeURNTGZXUDhlV3NBdUR4S2plWENWZGdVL3hqMERv?=
 =?utf-8?B?V1JadmZTcWxHWldWT2ZXMzFOcDNRTit6UE1mdERscTlpbmZmRGRia00yR0l4?=
 =?utf-8?B?RHFTeURkK0dDLzFtZlNjMmNyMVFUR3RQTVJzTFZPeHlTSjM4dUZqNVdFNEhm?=
 =?utf-8?B?RklyQ0FTM3prbjhlQ1JpTEJXNENUMi9Cei8yVll4QzRzWG9zcVZHb2lhZUNn?=
 =?utf-8?B?TjE2V3d3VmlhTGJXakR1RE5FUjV6cDRDYmhNQ0NhRXYwMWkxdk1YNzBKRVlK?=
 =?utf-8?B?MFo2ZjZ5dFlXckx3UTR4dkpKTm1GL2dyQTJiUXA0ZDdiRHBJWFpSUlUrT0NM?=
 =?utf-8?B?dU5JZjVELzlqbDV6c2ExSWZOMjFDRU1NZnJ5Z0RFQjNEVk9IY0ZVcjI0Z292?=
 =?utf-8?B?ZFFFeWpINkhveDJPNFBZVVlMcndGTEM1c3hRaDZZS1JTeTQ3NGU1L0ZtZ2lS?=
 =?utf-8?B?amNlQng0WU1QVzgrRXgrOTJwRWZtc25scWp5R1ZNY2RkZy9BcXU5VldZSlJR?=
 =?utf-8?B?Y0lPd3FaUjV0UE1DMEVJUnNxSy9XeVRsUkdIc09jaVRZSFE2NXVNMFB4VkZI?=
 =?utf-8?B?ckZlSTkya2pYNDFaL3ZFakFvZ3EzaEo5em9EYitYbjlGV2x2V3VsU0NndTNq?=
 =?utf-8?B?aG9BRlJzRFY1bVMwRGt2SUFKN3loYjNGa29UeGJhaUR5ekpQeGdoaEhCSXJY?=
 =?utf-8?B?SDdzVkcxSE5uVHJ3SURDUWMwalBzL2V0UWxNZUdvTDAyR1Z5V1AvUHZFemJK?=
 =?utf-8?B?N05pazJ4ajdhTWN5eDB3Z1VobFo1N0U2b0lMc0NTUkZLUGsxMlZUbHVRRHAy?=
 =?utf-8?B?bzJJaVJ6eVBFalRyRE90L1F2RzNNM01mbzVrZElZUTJuYmZnK1FBaHAwRkJq?=
 =?utf-8?B?UGk4bUxFaWhZdzl5YTZDdmVOZXRuTVRhbVZWczM1MmdJVlg0dmZRL2xGQUZX?=
 =?utf-8?B?cGNuWG55UkRjcFA0aTVMVENCVndqMFc3b2R2TGNRTGlxYjJaUWFEZHhxNnBE?=
 =?utf-8?B?c3VLbWUza2k0WlErMUJ0UGFEaUZBcmpUR3QzSHRTU3ZWU1FDTXlrcVB6aVJQ?=
 =?utf-8?B?R3ZqSU83VUZMSEtyMDh1R2RsSUVZZlBQa0ltdjJTbDN4LzdPMkFyYTV2NlMr?=
 =?utf-8?B?OHpBa1M3dmpQZ0tWcENUNm0vcWpwWXJUSEtzeTROVUVMUDlQMHlRa2ZtZk5V?=
 =?utf-8?B?aWtRcGV6QW14RTZMU3Avdmh1Q2hZaWl4N2NwVkR6N2ZQa1hldXg1VmNsUG5K?=
 =?utf-8?Q?fk6QD41HNYA4lvz16GdcOAc4R1LRjtluVQxkPmS/cU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cae3cec9-ea4d-4e08-9959-08dab1bafda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 10:16:30.2981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FkJcPXssvf+c8DDXSB5U8HeWCoFzcJR+MPL0sU4G19J/JuLI/ezaVRTijkEpe/DV/44MVP3nWAXe0XhPRU+TosizlHzC9aXFmHajmnGA2Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0038
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <40A2DC3A0723CD47949A11949E9F95D5@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "matteo.lisi@engicam.com" <matteo.lisi@engicam.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFnYW4NCg0KT24gV2VkLCAyMDIyLTEwLTA1IGF0IDIwOjQyICswNTMwLCBKYWdhbiBUZWtp
IHdyb3RlOg0KPiBUaGlzIHNlcmllcyBzdXBwb3J0cyBjb21tb24gYnJpZGdlIHN1cHBvcnQgZm9y
IFNhbXN1bmcgTUlQSSBEU0lNDQo+IHdoaWNoIGlzIHVzZWQgaW4gRXh5bm9zIGFuZCBpLk1YOE1N
IFNvQydzLg0KPiANCj4gVGhlIGZpbmFsIGJyaWRnZSBzdXBwb3J0cyBib3RoIHRoZSBFeHlub3Mg
YW5kIGkuTVg4TU0gRFNJIGRldmljZXMuDQo+IA0KPiBDaGFuZ2VzIGZvciB2NzoNCj4gKiBmaXgg
dGhlIGRybSBicmlkZ2UgYXR0YWNoIGNoYWluIGZvciBleHlub3MgZHJtIGRzaSBkcml2ZXINCj4g
KiBmaXggdGhlIGh3X3R5cGUgY2hlY2tpbmcgbG9naWMNCj4gDQo+IENoYW5nZXMgZm9yIHY2Og0K
PiAqIGhhbmRsZSBwcmV2aW91cyBicmlkZ2UgZm9yIGV4eW5vcyBkc2kgd2hpbGUgYXR0YWNoaW5n
IGJyaWRnZSANCj4gDQo+IENoYW5nZXMgZm9yIHY1Og0KPiAqIGJyaWRnZSBjaGFuZ2VzIHRvIHN1
cHBvcnQgbXVsdGktYXJjaA0KPiAqIHVwZGF0ZWQgYW5kIGNsZWFyIGNvbW1pdCBtZXNzYWdlcw0K
PiAqIGFkZCBod190eXBlIHZpYSBwbGF0IGRhdGENCj4gKiByZW1vdmVkIHVubmVlZGVkIHF1aXJr
DQo+ICogcmViYXNlZCBvbiBsaW51eC1uZXh0DQo+IA0KPiBDaGFuZ2VzIGZvciB2NDoNCj4gKiBp
bmNsdWRlIElua2kgRGFlIGluIE1BSU5UQUlORVJTDQo+ICogcmVtb3ZlIGRzaV9kcml2ZXIgcHJv
YmUgaW4gZXh5bm9zX2RybV9kcnYgdG8gc3VwcG9ydCBtdWx0aS1hcmNoIGJ1aWxkDQo+ICogdXBk
YXRlIGluaXQgaGFuZGxpbmcgdG8gZW5zdXJlIGhvc3QgaW5pdCBkb25lIG9uIGZpcnN0IGNtZCB0
cmFuc2Zlcg0KPiANCj4gQ2hhbmdlcyBmb3IgdjM6DQo+ICogZml4IHRoZSBtdWx0LWFyY2ggYnVp
bGQNCj4gKiBmaXggZHNpIGhvc3QgaW5pdA0KPiAqIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2VzDQo+
IA0KPiBDaGFuZ2VzIGZvciB2MjoNCj4gKiBmaXggYnJpZGdlIGhhbmRsaW5nDQo+ICogZml4IGRz
aSBob3N0IGluaXQNCj4gKiBjb3JyZWN0IHRoZSBjb21taXQgbWVzc2FnZXMNCj4gDQo+IFBhdGNo
IDAwMDE6wqDCoMKgwqDCoFNhbXN1bmcgRFNJTSBicmlkZ2UNCj4gDQo+IFBhdGNoIDAwMDI6wqDC
oMKgwqDCoFBIWSBvcHRpb25hbA0KPiANCj4gUGF0Y2ggMDAwMzrCoMKgwqDCoMKgT0YtZ3JhcGgg
b3IgQ2hpbGQgbm9kZSBsb29rdXANCj4gDQo+IFBhdGNoIDAwMDQ6wqDCoMKgwqDCoERTSSBob3N0
IGluaXRpYWxpemF0aW9uIA0KPiANCj4gUGF0Y2ggMDAwNTrCoMKgwqDCoMKgYXRvbWljIGNoZWNr
DQo+IA0KPiBQYXRjaCAwMDA2OsKgwqDCoMKgwqBQTVNfUCBvZmZzZXQgdmlhIHBsYXQgZGF0YQ0K
PiANCj4gUGF0Y2ggMDAwNzrCoMKgwqDCoMKgYXRvbWljX2dldF9pbnB1dF9idXNfZm10cw0KPiAN
Cj4gUGF0Y2ggMDAwODrCoMKgwqDCoMKgaW5wdXRfYnVzX2ZsYWdzDQo+IA0KPiBQYXRjaCAwMDA5
OsKgwqDCoMKgwqBkb2N1bWVudCBmc2wsaW14OG1tLW1pcGktZHNpbQ0KPiANCj4gUGF0Y2ggMDAx
MDrCoMKgwqDCoMKgYWRkIGkuTVg4TU0gRFNJTSBzdXBwb3J0DQo+IA0KPiBUZXN0ZWQgaW4gRW5n
aWNhbSBpLkNvcmUgTVg4TSBNaW5pIFNvTS4NCg0KVGhhbmtzIGZvciB0aGlzIHdvcmshDQoNClRo
aXMgYWxzbyB3b3JrcyBncmVhdCBvbiBWZXJkaW4gaU1YOE0gTWluaSB0b2dldGhlciB3aXRoIHRo
ZSBTTjY1RFNJODQtYmFzZWQgVmVyZGluIERTSSB0byBMVkRTIEFkYXB0ZXIuDQoNClRlc3RlZC1i
eTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQoNCj4gUmVw
bzoNCj4gaHR0cHM6Ly9naXRsYWIuY29tL29wZW5lZGV2L2tlcm5lbC8tL2NvbW1pdHMvaW14OG1t
LWRzaS12Nw0KPiANCj4gQW55IGlucHV0cz8NCj4gSmFnYW4uDQo+IA0KPiBKYWdhbiBUZWtpICgx
MCk6DQo+IMKgIGRybTogYnJpZGdlOiBBZGQgU2Ftc3VuZyBEU0lNIGJyaWRnZSBkcml2ZXINCj4g
wqAgZHJtOiBicmlkZ2U6IHNhbXN1bmctZHNpbTogTG9va3VwIE9GLWdyYXBoIG9yIENoaWxkIG5v
ZGUgZGV2aWNlcw0KPiDCoCBkcm06IGJyaWRnZTogc2Ftc3VuZy1kc2ltOiBNYXJrIFBIWSBhcyBv
cHRpb25hbA0KPiDCoCBkcm06IGJyaWRnZTogc2Ftc3VuZy1kc2ltOiBIYW5kbGUgcHJvcGVyIERT
SSBob3N0IGluaXRpYWxpemF0aW9uDQo+IMKgIGRybTogYnJpZGdlOiBzYW1zdW5nLWRzaW06IEFk
ZCBhdG9taWNfY2hlY2sNCj4gwqAgZHJtOiBicmlkZ2U6IHNhbXN1bmctZHNpbTogQWRkIHBsYXRm
b3JtIFBMTF9QIChQTVNfUCkgb2Zmc2V0DQo+IMKgIGRybTogYnJpZGdlOiBzYW1zdW5nLWRzaW06
IEFkZCBhdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzDQo+IMKgIGRybTogYnJpZGdlOiBzYW1zdW5n
LWRzaW06IEFkZCBpbnB1dF9idXNfZmxhZ3MNCj4gwqAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGV4
eW5vczogZHNpbTogQWRkIE5YUCBpLk1YOE1NIHN1cHBvcnQNCj4gwqAgZHJtOiBicmlkZ2U6IHNh
bXN1bmctZHNpbTogQWRkIGkuTVg4TU0gc3VwcG9ydA0KPiANCj4gwqAuLi4vYmluZGluZ3MvZGlz
cGxheS9leHlub3MvZXh5bm9zX2RzaW0udHh0wqDCoCB8wqDCoMKgIDEgKw0KPiDCoE1BSU5UQUlO
RVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqDCoCA5ICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tj
b25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTIgKw0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zYW1zdW5nLWRzaW0uY8KgwqDC
oMKgwqDCoMKgwqAgfCAxODU2ICsrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAr
DQo+IMKgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jwqDCoMKgwqDCoMKg
IHwgMTc2NiArLS0tLS0tLS0tLS0tLS0tDQo+IMKgaW5jbHVkZS9kcm0vYnJpZGdlL3NhbXN1bmct
ZHNpbS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMTUgKw0KPiDCoDggZmlsZXMgY2hh
bmdlZCwgMjEwOCBpbnNlcnRpb25zKCspLCAxNjUzIGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5jDQo+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2JyaWRnZS9zYW1zdW5nLWRzaW0uaA0KDQpDaGVl
cnMNCg0KTWFyY2VsDQo=

