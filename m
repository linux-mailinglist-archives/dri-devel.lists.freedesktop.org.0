Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E934F954
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029866E9F6;
	Wed, 31 Mar 2021 06:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320130.outbound.protection.outlook.com [40.107.132.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BFA6E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:56:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDAt0Bi8fwp7RxFAkkLB4orpEnDZly2VXDgKYzdNbCBs8fh3BDRxZ/9/pD8lMS0R15kgC3/28vjOJ/8XxWCXl4/sY4mAGJCbFIcAkKNLt6LvYdeEJ8acdARgjSA48yLAocIrKFioYdX64cr/11GfYR0sNXLGA2sqyGN8ROavuKlxlep6VtxxI7Wb3hznKE/vV6QjaQj2EMzFHpDESDRT9GER8IAgCovn43z4UUoPnOavz2IDnBgvmrj0duTnA5BYQF8FaoY4acgoXeZlYOTXOWPpHwVYUJEk/jfwBhrD1DYkh/3c4gfTY13lZvYjWaqb7JhY50hO2iO1BBAydKdGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBpTOcbTdLBCoOeMmCznLSe5p/IEEFowv45gmfCAF6I=;
 b=kfG2+x/z67mASN9OHDnN6Qq6PsFet1smLsRpsivDnj9lDT77mvpZ3b7jMneujfEEb+Z+M4Md6iEl787fXdsAzHIbzw61elk26JlbBIYnrT6k9+XRgHWhXxlX7MHOkvQ8AgQq7nX9r5btuCzkjCTVKK8ENESDIYjkEuhgiNPU3DtuF8s1IF9ZGh2GQ4PvAMOTYU8hqa3Nw+znEHR8pACmwoBuTFlx0FrFy81WqZDYEIfS1Vwf5cAjv6UqaVyKGPnVWAiDLfKc4TJCf1KCPIJueUmMDvSo4s4FBm5EXPZQp8+wSoOydFXkG3oET9uONZvMaOOIeW+4LeYlEF5WjPHu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK2PR06MB3508.apcprd06.prod.outlook.com (2603:1096:202:34::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 31 Mar
 2021 06:56:19 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::35ef:121f:1516:19cf]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::35ef:121f:1516:19cf%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:56:19 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3] drm/ast: Disable fast reset after DRAM initial
Thread-Topic: [PATCH V3] drm/ast: Disable fast reset after DRAM initial
Thread-Index: AQHXHKGTMqr1qSOADkmauvkKtQ57EKqav2mAgAL0LJA=
Date: Wed, 31 Mar 2021 06:56:19 +0000
Message-ID: <HK2PR06MB3300FC50877DC77AF06DED8C8C7C9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <HK2PR06MB330087DBCD724A93EBACC17C8CA10@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <20210319092340.140267-1-kuohsiang_chou@aspeedtech.com>
 <b0e960ee-b987-69f7-13fd-0270c347ad5e@suse.de>
In-Reply-To: <b0e960ee-b987-69f7-13fd-0270c347ad5e@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 392323b0-02c0-4735-6f23-08d8f412167f
x-ms-traffictypediagnostic: HK2PR06MB3508:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB3508D494E41EF57BB1EFC3788C7C9@HK2PR06MB3508.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qwn+LD09z+3/ZAwO0u1H4JG2L+S0yLRXHLodfTz+Nhrd409NEYgja0LNpe3KC4njqOpqxGv+Ej50OUiySE9g2fbtL6m61553G0mZ0NgSE2NGei56LHfrlplu8LkvumkPrVxA88f+3D/CZZVzlUmZMS7BAOg+Qd75l656VJ+JVUHPy/mTLs68ApBb7WbfBVhE5GejOIF7kpW+Xlhph2qK/NeS+tyaDPB9zI5WGJn9YIbKW6otrV1bvBQI9pfLZtQnLnJZ6oOe+TdI2Rhh09/sDEFxgLZoGlyNjrHQs9biIUxC9NYTmeK0sOoitdFefYpwpga5wYONEO2969+WK0FC5Vri6yLpHCnHVQ4Vqnh3Z0O0OUSFpsw3UktHh4I5JroTGQR64l+hTdxYQZwegxrwUQFfgEDR32ZwSS1sCdLrcs2Eqwge8mrTnKEO3i5uKHJi72G6yeW+/QerkRgpGYUqqUNpymYTZ9VaXrxBkRUo0OIn1ia+PLNY1NZiiXRjrujQ/+gSg9JJc37PfPHo9AjwdXOkFUE0gRotXEW76Dw0UmEKBL/nRRa5g51r9g8ypn5GJTD7swwSMabpQ7xgwTw6rijdPY3pzXAscqvUeUMmiySDxjUynsRSSsZgcsCO1lR20XiPSWrCY61TLwTaRWxmQ4W6RCqAQo6ZsyXjTz5cumLYbdJLipUHi/mVa2ehkk5RCvjj/GVwXNusg+XHUy2fYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39850400004)(136003)(396003)(376002)(38100700001)(64756008)(66616009)(8936002)(5660300002)(4326008)(55236004)(2906002)(71200400001)(33656002)(76116006)(8676002)(66946007)(107886003)(53546011)(86362001)(54906003)(66446008)(966005)(478600001)(83380400001)(52536014)(316002)(66556008)(6506007)(55016002)(110136005)(66574015)(7696005)(9686003)(186003)(66476007)(99936003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cjdEZTJIM012RjloTkFpVy80RVg0STlZUmpXcWlYcEcvMGF4WDFUVkdLckJj?=
 =?utf-8?B?Z1BSQngxOUtwcnJScVZKa1BMTmk1ZTRla1BYc2w0djBHR09FanY2K284a2RQ?=
 =?utf-8?B?UXBCWWJrYVFKeDdwU2tzY2xzVUJiNnIrSTc1TGluTFJTQ0hJNFJ0YXYrcHdq?=
 =?utf-8?B?a2gvWlN3VTVqdWUwYnhkWGtZVkhxTEJtNGZ5MmJZYWtsczRWWXpXY3hST1hX?=
 =?utf-8?B?YXNIL0VUWW96UG84U2ZZMUEyNVRoc0hibWM4U3ZNemNuVVc2OW1QQXdNdVVF?=
 =?utf-8?B?R0Y2bTZQWjhTSVRwNE5nNEgrL1NVbW5FY3dtdmk5dXNsQVo1VVlvNStPbjBF?=
 =?utf-8?B?MGJhZk1OZVREUU9DTXZCNEY3Y0pzNmNqM1J6SFBqU0t3RjlCbjVid05hYXox?=
 =?utf-8?B?MGJJUDNBVFl4MExNUjMrenZSSE9jL0dGL2ZHMmNCNTIybGg0S2lmTU1ZaTcr?=
 =?utf-8?B?Y1JJZWl3VEMxUXIrQU9KYWh2LzNQN0FxbzNUMk5pak55Z2p1U09qRVRwN0Zo?=
 =?utf-8?B?U1BmSjZrV3YvZUlqbFd0T1lVTXBmSEx0c2pWdXEvblpUbmxzZGFKcEd6NTBC?=
 =?utf-8?B?dDVqc2FmVVhsZjJNb1ptK3dIYjJibGpRaGdrMVQrMDZaSXJrb1hKUDVGL1N0?=
 =?utf-8?B?d20rZGJ0YzYzY2pGdXZpZnhGa3lLRDBBOU5nQU1IVVZNZDA0RWRCTlBUT1lj?=
 =?utf-8?B?UTRiQkFxRkNJa3ZLaE1uc2RycFBxb0w3dWhoS0pzTUQxUm8va3lpRWlPSEhu?=
 =?utf-8?B?NitleHhiTDdNT2RWMkZWZ1l4SlNTU1dHMXVraS90QU84ZTZrT3NlMVZoRXJQ?=
 =?utf-8?B?V1kyS0d5OFpSWndSK1BmTlozTjhtSWE1YWE2ZDU5SlhZTW9heHhnNFdTYkJ4?=
 =?utf-8?B?KzloTHdvbFp0ZlVKcDRQdDFZNVVSOFRWRTdXK3RDK2VtWnNsdG42YzdpY1hn?=
 =?utf-8?B?U09kaStYSXR0a1VNRWgzU1ZvbDZSKy9TVkl1QWxURktNNzl1YURBOTl3dnNo?=
 =?utf-8?B?eENNcFdGekRwei96Z1Q2dnZscjhQUEk1Q3lVRUFXM24yRk9YMGxVZ0VkK1BB?=
 =?utf-8?B?R3hTK3ZGelVnczZCdlBjdUd1N2M3TzB0MzJocHY4SC8wNnNkeGRxMkNySkRO?=
 =?utf-8?B?NUE4MW1tUytncWhvU0ZBR1YzcENIZTYxZm02c0xDYzViVEFROU0yMXBMU0p6?=
 =?utf-8?B?OXA0OXA4ZWZQWWxUMTdjN2xiZHZQWDc2N0RUWkhTWFVONDBnSHdRZEZySExG?=
 =?utf-8?B?RW04NDVpeSs5SFVXVzhUUGxBRThvcks3YXExRERsUTJYVG1kcFFEY0xsdzlQ?=
 =?utf-8?B?bStLdWFqZ0xleGEweEIwcXlXRWYrb1hlcUpYa0lQd1JGck91dmR4cGtnaUR6?=
 =?utf-8?B?Vi8zZVVTWVYxTzY0ZXIvSkI0cFRWdHM0QWVNbW1DWU9LSHlaY2YvckN4aGEy?=
 =?utf-8?B?U1NTVUN0MHREUFU5R1AyMENiOGZMOUlUU0l6N2QrWlZHNVA3MUVzbHdLMHA2?=
 =?utf-8?B?U002aW5Ma3VId0dMazZoQUxHZWY3RUx2NVI5c2RkUVpja3pVTGRYbS9vRVBS?=
 =?utf-8?B?L20rYVMzSEJkT2IzdUhBOHhKc2dnUHJSZ2M0cDFEeTFpcEhwbFQ3bmhnOWUy?=
 =?utf-8?B?anNpQWx3Z3BiT3Ixb0xvWkJ0QWhuVDZ2T2hDSTV5ek9sK092UStqcEt1UGE0?=
 =?utf-8?B?UXNzd09ubTdyQ0dCa2xTWWVVMGJRdWxWNUE2NXBhSFFzVjFJbW5peXRjSk9u?=
 =?utf-8?Q?obPKOyh5tlkiDvAWSSqUCHlBdXFzd8C6WQf4vuz?=
Content-Type: multipart/mixed;
 boundary="_002_HK2PR06MB3300FC50877DC77AF06DED8C8C7C9HK2PR06MB3300apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392323b0-02c0-4735-6f23-08d8f412167f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 06:56:19.5924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubRs3XSToPPVgtXwANOq0JLgRWrVADRsHJ/RTUgIYevumhgxe15N+u6zKClgV5RwxnGpYz6ox0EA0jEIGpZjtTa3/bdXNMmquSaE4Geg5v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3508
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 Tommy Huang <tommy_huang@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_HK2PR06MB3300FC50877DC77AF06DED8C8C7C9HK2PR06MB3300apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWVzc2FnZS1JRDogPDIwMjAxMjI4MDMwODIzLjI5NDE0Ny0xLWt1b2hzaWFuZ19jaG91QGFzcGVl
ZHRlY2guY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVGhvbWFzIFpp
bW1lcm1hbm4gW21haWx0bzp0emltbWVybWFubkBzdXNlLmRlXSANClNlbnQ6IE1vbmRheSwgTWFy
Y2ggMjksIDIwMjEgNToxNyBQTQ0KVG86IEt1by1Ic2lhbmcgQ2hvdSA8a3VvaHNpYW5nX2Nob3VA
YXNwZWVkdGVjaC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQoNClN1YmplY3Q6IFJlOiBbUEFUQ0ggVjNdIGRybS9hc3Q6
IERpc2FibGUgZmFzdCByZXNldCBhZnRlciBEUkFNIGluaXRpYWwNCg0KSGksDQoNCkkgY2Fubm90
IGFwcGx5IHRoaXMgcGF0Y2guIFRoZSBlcnJvciBpcyBzaG93biBiZWxvdy4gV2hpY2ggdHJlZSBk
byB5b3UgdXNlPyBDYW4geW91IHBsZWFzZSBtb3ZlIHRvIGRybS1taXNjLW5leHQ/DQoNCkFwcGx5
aW5nOiBkcm0vYXN0OiBEaXNhYmxlIGZhc3QgcmVzZXQgYWZ0ZXIgRFJBTSBpbml0aWFsDQplcnJv
cjogc2hhMSBpbmZvcm1hdGlvbiBpcyBsYWNraW5nIG9yIHVzZWxlc3MgKGRyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X2Rydi5oKS4NCmVycm9yOiBjb3VsZCBub3QgYnVpbGQgZmFrZSBhbmNlc3Rvcg0K
UGF0Y2ggZmFpbGVkIGF0IDAwMDEgZHJtL2FzdDogRGlzYWJsZSBmYXN0IHJlc2V0IGFmdGVyIERS
QU0gaW5pdGlhbA0KaGludDogVXNlICdnaXQgYW0gLS1zaG93LWN1cnJlbnQtcGF0Y2g9ZGlmZicg
dG8gc2VlIHRoZSBmYWlsZWQgcGF0Y2ggV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2Js
ZW0sIHJ1biAiZ2l0IGFtIC0tY29udGludWUiLg0KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMg
cGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4NClRvIHJlc3RvcmUgdGhlIG9yaWdp
bmFsIGJyYW5jaCBhbmQgc3RvcCBwYXRjaGluZywgcnVuICJnaXQgYW0gLS1hYm9ydCIuDQpkaW06
IEVSUk9SOiBnaXQgYXBwbHktbWJveCBmYWlsZWQNCg0KSGksIFRob21hcywNCg0KVGhhbmtzIGZv
ciB0aGUgY29tbWVudHMsIEkgc3RpbGwgdXNlIGtlcm5lbF81LjkuIFllcywgSSB3aWxsIG1vdmUg
dG8gdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIGRybS1taXNjLW5leHQuDQpUaGUgZXJyb3JzIHNlZW0g
dG8gYmUgY2F1c2VkIGJ5IGEgcGVuZGluZyBwYXRjaChNZXNzYWdlLUlEOiA8MjAyMDEyMjgwMzA4
MjMuMjk0MTQ3LTEta3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVjaC5jb20+KS4gDQpBbmQgSSBzdWJt
aXR0ZWQgY3VycmVudCBwYXRjaCBiZWZvcmUgcmV2aWV3ZXIgcmVzdWx0IG9mIHBlbmRpbmcgcGF0
Y2goTWVzc2FnZS1JRDogPDIwMjAxMjI4MDMwODIzLjI5NDE0Ny0xLWt1b2hzaWFuZ19jaG91QGFz
cGVlZHRlY2guY29tPikuDQoNClBsZWFzZSBnaXZlIGFuIGluc3RydWN0aW9uIGhvdyB0byB3b3Jr
cyB0byBuZXh0IHN0ZXAuIA0KQ29udGludWUgd2FpdGluZyBmb3IgdGhlIHJldmlld2VyIHJlc3Vs
dCwgb3IgbW92ZSB0byBrZXJuZWxfNS4xMi1yYzEgYW5kIHN1Ym1pdCB0aGUgcGVuZGluZyBwYXRj
aCBhZ2Fpbj8gT3Igb3RoZXIgc3VnZ2VzdGlvbnM/DQpUaGFua3MhDQoNCkJlc3QgUmVnYXJkcywN
CglLdW8tSHNpYW5nIENob3UNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQpBbSAxOS4wMy4y
MSB1bSAxMDoyMyBzY2hyaWViIEt1b0hzaWFuZyBDaG91Og0KPiBbQnVnXVtBU1QyNTAwXQ0KPiAN
Cj4gVjE6DQo+IFdoZW4gQVNUMjUwMCBhY3RzIGFzIHN0YW5kLWFsb25lIFZHQSBzbyB0aGF0IERS
QU0gYW5kIERWTyANCj4gaW5pdGlhbGl6YXRpb24gaGF2ZSB0byBiZSBhY2hpZXZlZCBieSBWR0Eg
ZHJpdmVyIHdpdGggUDJBIChQQ0kgdG8gQUhCKSBlbmFibGluZy4NCj4gSG93ZXZlciwgSFcgc3Vn
Z2VzdHMgZGlzYWJsZSBGYXN0IHJlc2V0IG1vZGUgYWZ0ZXIgRFJBTSBpbml0aWFsaXphdG9uLCAN
Cj4gYmVjYXVzZSBmYXN0IHJlc2V0IG1vZGUgaXMgbWFpbmx5IGRlc2lnbmVkIGZvciBBUk0gSUNF
IGRlYnVnZ2VyLg0KPiBPbmNlIEZhc3QgcmVzZXQgaXMgY2hlY2tlZCBhcyBlbmFibGluZywgV0RU
IChXYXRjaCBEb2cgVGltZXIpIHNob3VsZCANCj4gYmUgZmlyc3QgZW5hYmxlZCB0byBhdm9pZCBz
eXN0ZW0gZGVhZGxvY2sgYmVmb3JlIGRpc2FibGUgZmFzdCByZXNldCBtb2RlLg0KPiANCj4gVjI6
DQo+IFVzZSB0b19wY2lfZGV2KCkgdG8gZ2V0IHJldmlzaW9uIG9mIFBDSSBjb25maWd1cmF0aW9u
Lg0KPiANCj4gVjM6DQo+IElmIFNDVTAwIGlzIG5vdCB1bmxvY2tlZCwganVzdCBlbnRlciBpdHMg
cGFzc3dvcmQgYWdhaW4uDQo+IEl0IGlzIHVubmVjZXNzYXJ5IHRvIGNsZWFyIEFIQiBsb2NrIGNv
bmRpdGlvbiBhbmQgcmVzdG9yZSBXRFQgZGVmYXVsdCANCj4gc2V0dGluZyBhZ2FpbiwgYmVmb3Jl
IEZhc3QtcmVzZXQgY2xlYXJpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLdW9Ic2lhbmcgQ2hv
dSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVjaC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X2Rydi5oICB8ICAxICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
YWluLmMgfCAgNSArKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMgfCA2OCAr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0
OCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuaCBpbmRleCBkYTZkZmI2Nzc1NDAuLmEyY2Y1ZmVmMjM5OSANCj4gMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2Rydi5oDQo+IEBAIC0zMjAsNiArMzIwLDcgQEAgYm9vbCBhc3RfaXNfdmdhX2VuYWJs
ZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgdm9pZCBhc3RfcG9zdF9ncHUoc3RydWN0
IGRybV9kZXZpY2UgKmRldik7DQo+ICAgdTMyIGFzdF9taW5kd20oc3RydWN0IGFzdF9wcml2YXRl
ICphc3QsIHUzMiByKTsNCj4gICB2b2lkIGFzdF9tb3V0ZHdtKHN0cnVjdCBhc3RfcHJpdmF0ZSAq
YXN0LCB1MzIgciwgdTMyIHYpOw0KPiArdm9pZCBhc3RfcGF0Y2hfYWhiXzI1MDAoc3RydWN0IGFz
dF9wcml2YXRlICphc3QpOw0KPiAgIC8qIGFzdCBkcDUwMSAqLw0KPiAgIHZvaWQgYXN0X3NldF9k
cDUwMV92aWRlb19vdXRwdXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdTggbW9kZSk7DQo+ICAg
Ym9vbCBhc3RfYmFja3VwX2Z3KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHU4ICphZGRyLCB1MzIg
c2l6ZSk7IGRpZmYgDQo+IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyBpbmRleCAzNzc1ZmUyNmY3OTIuLjBl
NGRmY2MyNTYyMyANCj4gMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21h
aW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gQEAgLTY5LDYg
KzY5LDcgQEAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9jb25maWdfbW9kZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB1MzIgKnNjdV9yZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gZGV2LT5wZGV2LT5kZXYub2Zfbm9kZTsNCj4gICAJc3RydWN0IGFzdF9wcml2YXRlICph
c3QgPSB0b19hc3RfcHJpdmF0ZShkZXYpOw0KPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9f
cGNpX2RldihkZXYtPmRldik7DQo+ICAgCXVpbnQzMl90IGRhdGEsIGpyZWdkMCwganJlZ2QxOw0K
PiANCj4gICAJLyogRGVmYXVsdHMgKi8NCj4gQEAgLTk2LDYgKzk3LDEwIEBAIHN0YXRpYyB2b2lk
IGFzdF9kZXRlY3RfY29uZmlnX21vZGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdTMyICpzY3Vf
cmV2KQ0KPiAgIAlqcmVnZDAgPSBhc3RfZ2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NS
VENfUE9SVCwgMHhkMCwgMHhmZik7DQo+ICAgCWpyZWdkMSA9IGFzdF9nZXRfaW5kZXhfcmVnX21h
c2soYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweGQxLCAweGZmKTsNCj4gICAJaWYgKCEoanJlZ2Qw
ICYgMHg4MCkgfHwgIShqcmVnZDEgJiAweDEwKSkgew0KPiArCQkvKiBQYXRjaCBBU1QyNTAwICov
DQo+ICsJCWlmICgoKHBkZXYtPnJldmlzaW9uICYgMHhGMCkgPT0gMHg0MCkgJiYgKChqcmVnZDAg
JiAweEMwKSA9PSAwKSkNCj4gKwkJCWFzdF9wYXRjaF9haGJfMjUwMChhc3QpOw0KPiArDQo+ICAg
CQkvKiBEb3VibGUgY2hlY2sgaXQncyBhY3R1YWxseSB3b3JraW5nICovDQo+ICAgCQlkYXRhID0g
YXN0X3JlYWQzMihhc3QsIDB4ZjAwNCk7DQo+ICAgCQlpZiAoZGF0YSAhPSAweEZGRkZGRkZGKSB7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMgDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jIGluZGV4IDg5MDJjMmY4NGJmOS4uNGYxOTRjNWZk
MmMyIA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYw0KPiBAQCAtMjAyNiw2ICsyMDI2
LDMwIEBAIHN0YXRpYyBib29sIGFzdF9kcmFtX2luaXRfMjUwMChzdHJ1Y3QgYXN0X3ByaXZhdGUg
KmFzdCkNCj4gICAJcmV0dXJuIHRydWU7DQo+ICAgfQ0KPiANCj4gK3ZvaWQgYXN0X3BhdGNoX2Fo
Yl8yNTAwKHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0KSB7DQo+ICsJdTMyCWRhdGE7DQo+ICsNCj4g
KwkvKiBDbGVhciBidXMgbG9jayBjb25kaXRpb24gKi8NCj4gKwlhc3RfbW91dGR3bShhc3QsIDB4
MWU2MDAwMDAsIDB4QUVFRDFBMDMpOw0KPiArCWFzdF9tb3V0ZHdtKGFzdCwgMHgxZTYwMDA4NCwg
MHgwMDAxMDAwMCk7DQo+ICsJYXN0X21vdXRkd20oYXN0LCAweDFlNjAwMDg4LCAweDAwMDAwMDAw
KTsNCj4gKwlhc3RfbW91dGR3bShhc3QsIDB4MWU2ZTIwMDAsIDB4MTY4OEE4QTgpOw0KPiArCWRh
dGEgPSBhc3RfbWluZHdtKGFzdCwgMHgxZTZlMjA3MCk7DQo+ICsJaWYgKGRhdGEgJiAweDA4MDAw
MDAwKSB7CQkJCQkvKiBjaGVjayBmYXN0IHJlc2V0ICovDQo+ICsNCj4gKwkJYXN0X21vdXRkd20o
YXN0LCAweDFFNzg1MDA0LCAweDAwMDAwMDEwKTsNCj4gKwkJYXN0X21vdXRkd20oYXN0LCAweDFF
Nzg1MDA4LCAweDAwMDA0NzU1KTsNCj4gKwkJYXN0X21vdXRkd20oYXN0LCAweDFFNzg1MDBjLCAw
eDAwMDAwMDMzKTsNCj4gKwkJdWRlbGF5KDEwMDApOw0KPiArCX0NCj4gKwlkbyB7DQo+ICsJCWFz
dF9tb3V0ZHdtKGFzdCwgMHgxZTZlMjAwMCwgMHgxNjg4QThBOCk7DQo+ICsJCWRhdGEgPSBhc3Rf
bWluZHdtKGFzdCwgMHgxZTZlMjAwMCk7DQo+ICsJfQl3aGlsZSAoZGF0YSAhPSAxKTsNCj4gKwlh
c3RfbW91dGR3bShhc3QsIDB4MWU2ZTIwN2MsIDB4MDgwMDAwMDApOwkvKiBjbGVhciBmYXN0IHJl
c2V0ICovDQo+ICt9DQo+ICsNCj4gICB2b2lkIGFzdF9wb3N0X2NoaXBfMjUwMChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSB0b19h
c3RfcHJpdmF0ZShkZXYpOyBAQCAtMjAzMywzOSArMjA1NywzMSANCj4gQEAgdm9pZCBhc3RfcG9z
dF9jaGlwXzI1MDAoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gICAJdTggcmVnOw0KPiANCj4g
ICAJcmVnID0gYXN0X2dldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4
ZDAsIDB4ZmYpOw0KPiAtCWlmICgocmVnICYgMHg4MCkgPT0gMCkgey8qIHZnYSBvbmx5ICovDQo+
ICsJaWYgKChyZWcgJiAweEMwKSA9PSAwKSB7LyogdmdhIG9ubHkgKi8NCj4gICAJCS8qIENsZWFy
IGJ1cyBsb2NrIGNvbmRpdGlvbiAqLw0KPiAtCQlhc3RfbW91dGR3bShhc3QsIDB4MWU2MDAwMDAs
IDB4QUVFRDFBMDMpOw0KPiAtCQlhc3RfbW91dGR3bShhc3QsIDB4MWU2MDAwODQsIDB4MDAwMTAw
MDApOw0KPiAtCQlhc3RfbW91dGR3bShhc3QsIDB4MWU2MDAwODgsIDB4MDAwMDAwMDApOw0KPiAt
CQlhc3RfbW91dGR3bShhc3QsIDB4MWU2ZTIwMDAsIDB4MTY4OEE4QTgpOw0KPiAtCQlhc3Rfd3Jp
dGUzMihhc3QsIDB4ZjAwNCwgMHgxZTZlMDAwMCk7DQo+IC0JCWFzdF93cml0ZTMyKGFzdCwgMHhm
MDAwLCAweDEpOw0KPiAtCQlhc3Rfd3JpdGUzMihhc3QsIDB4MTIwMDAsIDB4MTY4OGE4YTgpOw0K
PiAtCQl3aGlsZSAoYXN0X3JlYWQzMihhc3QsIDB4MTIwMDApICE9IDB4MSkNCj4gLQkJCTsNCj4g
LQ0KPiAtCQlhc3Rfd3JpdGUzMihhc3QsIDB4MTAwMDAsIDB4ZmM2MDAzMDkpOw0KPiAtCQl3aGls
ZSAoYXN0X3JlYWQzMihhc3QsIDB4MTAwMDApICE9IDB4MSkNCj4gLQkJCTsNCj4gKwkJYXN0X3Bh
dGNoX2FoYl8yNTAwKGFzdCk7DQo+ICsNCj4gKwkJLyogRGlzYWJsZSB3YXRjaGRvZyAqLw0KPiAr
CQlhc3RfbW91dGR3bShhc3QsIDB4MUU3ODUwMkMsIDB4MDAwMDAwMDApOw0KPiArCQlhc3RfbW91
dGR3bShhc3QsIDB4MUU3ODUwNEMsIDB4MDAwMDAwMDApOw0KPiArCQkvKiBSZXNldCBVU0IgcG9y
dCAqLw0KPiArCQlhc3RfbW91dGR3bShhc3QsIDB4MUU2RTIwOTAsIDB4MjAwMDAwMDApOw0KPiAr
CQlhc3RfbW91dGR3bShhc3QsIDB4MUU2RTIwOTQsIDB4MDAwMDQwMDApOw0KPiArCQlpZiAoYXN0
X21pbmR3bShhc3QsIDB4MUU2RTIwNzApICYgMHgwMDgwMDAwMCkgew0KPiArCQkJYXN0X21vdXRk
d20oYXN0LCAweDFFNkUyMDdDLCAweDAwODAwMDAwKTsNCj4gKwkJCW1kZWxheSgxMDApOw0KPiAr
CQkJYXN0X21vdXRkd20oYXN0LCAweDFFNkUyMDcwLCAweDAwODAwMDAwKTsNCj4gKwkJfQ0KPiAr
CQkvKiBNb2RpZnkgZVNQSSByZXNldCBwaW4gKi8NCj4gKwkJdGVtcCA9IGFzdF9taW5kd20oYXN0
LCAweDFFNkUyMDcwKTsNCj4gKwkJaWYgKHRlbXAgJiAweDAyMDAwMDAwKQ0KPiArCQkJYXN0X21v
dXRkd20oYXN0LCAweDFFNkUyMDdDLCAweDAwMDA0MDAwKTsNCj4gDQo+ICAgCQkvKiBTbG93IGRv
d24gQ1BVL0FIQiBDTEsgaW4gVkdBIG9ubHkgbW9kZSAqLw0KPiAgIAkJdGVtcCA9IGFzdF9yZWFk
MzIoYXN0LCAweDEyMDA4KTsNCj4gICAJCXRlbXAgfD0gMHg3MzsNCj4gICAJCWFzdF93cml0ZTMy
KGFzdCwgMHgxMjAwOCwgdGVtcCk7DQo+IA0KPiAtCQkvKiBSZXNldCBVU0IgcG9ydCB0byBwYXRj
aCBVU0IgdW5rbm93biBkZXZpY2UgaXNzdWUgKi8NCj4gLQkJYXN0X21vdXRkd20oYXN0LCAweDFl
NmUyMDkwLCAweDIwMDAwMDAwKTsNCj4gLQkJdGVtcCAgPSBhc3RfbWluZHdtKGFzdCwgMHgxZTZl
MjA5NCk7DQo+IC0JCXRlbXAgfD0gMHgwMDAwNDAwMDsNCj4gLQkJYXN0X21vdXRkd20oYXN0LCAw
eDFlNmUyMDk0LCB0ZW1wKTsNCj4gLQkJdGVtcCAgPSBhc3RfbWluZHdtKGFzdCwgMHgxZTZlMjA3
MCk7DQo+IC0JCWlmICh0ZW1wICYgMHgwMDgwMDAwMCkgew0KPiAtCQkJYXN0X21vdXRkd20oYXN0
LCAweDFlNmUyMDdjLCAweDAwODAwMDAwKTsNCj4gLQkJCW1kZWxheSgxMDApOw0KPiAtCQkJYXN0
X21vdXRkd20oYXN0LCAweDFlNmUyMDcwLCAweDAwODAwMDAwKTsNCj4gLQkJfQ0KPiAtDQo+ICAg
CQlpZiAoIWFzdF9kcmFtX2luaXRfMjUwMChhc3QpKQ0KPiAgIAkJCWRybV9lcnIoZGV2LCAiRFJB
TSBpbml0IGZhaWxlZCAhXG4iKTsNCj4gDQo+IC0tDQo+IDIuMTguNA0KPiANCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdA0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IA0KDQotLQ0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyDQoNCg==

--_002_HK2PR06MB3300FC50877DC77AF06DED8C8C7C9HK2PR06MB3300apcp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 31 Mar 2021 06:56:18 GMT";
	modification-date="Wed, 31 Mar 2021 06:56:18 GMT"

Received: from PS1PR0601MB2011.apcprd06.prod.outlook.com (2603:1096:803:d::20)
 by HK2PR06MB3300.apcprd06.prod.outlook.com with HTTPS; Mon, 28 Dec 2020
 03:08:33 +0000
Received: from PSXP216CA0018.KORP216.PROD.OUTLOOK.COM (2603:1096:300:4::28) by
 PS1PR0601MB2011.apcprd06.prod.outlook.com (2603:1096:803:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.29; Mon, 28 Dec
 2020 03:08:31 +0000
Received: from PU1APC01FT051.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:4:cafe::ca) by PSXP216CA0018.outlook.office365.com
 (2603:1096:300:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 03:08:31 +0000
Received: from aspeedtech.com (211.20.114.72) by
 PU1APC01FT051.mail.protection.outlook.com (10.152.253.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 03:08:30 +0000
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Dec
 2020 11:08:30 +0800
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "airlied@linux.ie"
	<airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jenmin Yuan
	<jenmin_yuan@aspeedtech.com>, Kuo-Hsiang Chou
	<kuohsiang_chou@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>, Tommy
 Huang <tommy_huang@aspeedtech.com>
Subject: [PATCH V3] drm/ast: Fixed CVE for DP501
Thread-Topic: [PATCH V3] drm/ast: Fixed CVE for DP501
Thread-Index: AQHW3Ma6ANyHYUAE/U+mdxZuhPb+Xg==
Date: Mon, 28 Dec 2020 03:08:23 +0000
Message-ID: <20201228030823.294147-1-kuohsiang_chou@aspeedtech.com>
References: <202012120256.nX6SgoRT-lkp@intel.com>
In-Reply-To: <202012120256.nX6SgoRT-lkp@intel.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 00
X-MS-Exchange-Organization-AuthSource: TWMBX02.aspeed.com
X-MS-Has-Attach: 
X-MS-Exchange-Organization-Network-Message-Id:  68d3b7ad-4851-41ef-2706-08d8aaddda93
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
received-spf: Fail (protection.outlook.com: domain of aspeedtech.com does not
 designate 211.20.114.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.114.72; helo=aspeedtech.com;
x-ms-exchange-organization-originalclientipaddress: 192.168.2.206
x-ms-exchange-organization-originalserveripaddress: 10.152.253.146
x-ms-publictraffictype: Email
x-ms-exchange-organization-submissionquotaskipped: False
x-clientproxiedby: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
x-ms-office365-filtering-correlation-id: 68d3b7ad-4851-41ef-2706-08d8aaddda93
x-ms-traffictypediagnostic: PS1PR0601MB2011:
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report:  CIP:211.20.114.72;CTRY:TW;LANG:en;SCL:-1;SRV:;IPV:NLI;SFV:SKI;H:aspeedtech.com;PTR:mail.aspeedtech.com;CAT:NONE;SFS:;DIR:INB;
x-originatororg: aspeedtech.com
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: TWMBX02.aspeed.com
x-ms-exchange-crosstenant-network-message-id:  68d3b7ad-4851-41ef-2706-08d8aaddda93
x-ms-exchange-crosstenant-originalarrivaltime: 28 Dec 2020 03:08:30.2847 (UTC)
x-ms-exchange-crosstenant-fromentityheader: HybridOnPrem
x-ms-exchange-crosstenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
x-ms-exchange-transport-crosstenantheadersstamped: PS1PR0601MB2011
authentication-results: spf=fail (sender IP is 211.20.114.72)
 smtp.mailfrom=aspeedtech.com; aspeedtechcom.mail.onmicrosoft.com; dkim=none
 (message not signed) header.d=none;aspeedtechcom.mail.onmicrosoft.com;
 dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [192.168.2.206]
x-ms-exchange-transport-endtoendlatency: 00:00:03.5040023
x-ms-exchange-processed-by-bccfoldering: 15.20.3700.031
x-eopattributedmessage: 0
x-mailer: git-send-email 2.18.4
X-Microsoft-Antispam-Mailbox-Delivery:  ucf:0;jmr:0;auth:0;dest:I;ENG:(750128)(520011016)(706158)(944506458)(944626604);
X-Microsoft-Antispam-Message-Info:  jVE5gNtCErz+bbLsGF4lD2kEA8Ivx/LZBEIdWOON/7sJo1l2nlH6zMdvoTmH3NSGXzZMto/YWN2eoAlxs2fRMpFwMAZmKR2Jx0uddbfI4MzEU1oyqUANfBjS/5/AzSFHu8/oA+rmDQ622PMp1jyiPw1SIEpCj84jJE/Up/Z/eDu3Vf5+D1upy0jJaLMyXO5RP7uR9ojqI2Mo+ahDUvQY1uUycvGSZ6cVASjpLwyUjm4pLcKR1S4ZEgCc0fKu0bVH9M9o3Wh/A4SkA2Gm4awXpSh8WwDD1R+TyC7ZWj5q72Af8iYqWse7iyz8GLqGE8yV+YcngsyYq4KLhRqV0bgge75kthVn+AfLGTNU3qa55x4IipLokZn/98prvSkjVisyKfdJS5hPDfrK6rMU08/zeCEBVyalWTbjuH18cy1WQrc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

[Bug][DP501]
If ASPEED P2A (PCI to AHB) bridge is disabled and disallowed for
CVE_2019_6260 item3, and then the monitor's EDID is unable read through
Parade DP501.
The reason is the DP501's FW is mapped to BMC addressing space rather
than Host addressing space.
The resolution is that using "pci_iomap_range()" maps to DP501's FW that
stored on the end of FB (Frame Buffer).
0In this case, FrameBuffer reserves the last 2MB used for the image of
DP501.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/ast/ast_dp501.c | 139 +++++++++++++++++++++++---------
 drivers/gpu/drm/ast/ast_drv.h   |  12 +++
 drivers/gpu/drm/ast/ast_main.c  |   8 ++
 3 files changed, 123 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp50=
1.c
index 88121c0e0d05..cd93c44f2662 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -189,6 +189,9 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u3=
2 size)
 	u32 i, data;
 	u32 boot_address;

+	if (ast->config_mode !=3D ast_use_p2a)
+		return false;
+
 	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
 	if (data) {
 		boot_address =3D get_fw_base(ast);
@@ -207,6 +210,9 @@ static bool ast_launch_m68k(struct drm_device *dev)
 	u8 *fw_addr =3D NULL;
 	u8 jreg;

+	if (ast->config_mode !=3D ast_use_p2a)
+		return false;
+
 	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
 	if (!data) {

@@ -271,25 +277,55 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
 	struct ast_private *ast =3D to_ast_private(dev);
 	u32 boot_address, offset, data;
 	u8 linkcap[4], linkrate, linklanes, maxclk =3D 0xff;
+	u32 *plinkcap;

-	boot_address =3D get_fw_base(ast);
-
-	/* validate FW version */
-	offset =3D 0xf000;
-	data =3D ast_mindwm(ast, boot_address + offset);
-	if ((data & 0xf0) !=3D 0x10) /* version: 1x */
-		return maxclk;
-
-	/* Read Link Capability */
-	offset  =3D 0xf014;
-	*(u32 *)linkcap =3D ast_mindwm(ast, boot_address + offset);
-	if (linkcap[2] =3D=3D 0) {
-		linkrate =3D linkcap[0];
-		linklanes =3D linkcap[1];
-		data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklanes);
-		if (data > 0xff)
-			data =3D 0xff;
-		maxclk =3D (u8)data;
+	if (ast->config_mode =3D=3D ast_use_p2a) {
+		boot_address =3D get_fw_base(ast);
+
+		/* validate FW version */
+		offset =3D AST_DP501_GBL_VERSION;
+		data =3D ast_mindwm(ast, boot_address + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1) /* v=
ersion: 1x */
+			return maxclk;
+
+		/* Read Link Capability */
+		offset  =3D AST_DP501_LINKRATE;
+		plinkcap =3D (u32 *)linkcap;
+		*plinkcap  =3D ast_mindwm(ast, boot_address + offset);
+		if (linkcap[2] =3D=3D 0) {
+			linkrate =3D linkcap[0];
+			linklanes =3D linkcap[1];
+			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklanes);
+			if (data > 0xff)
+				data =3D 0xff;
+			maxclk =3D (u8)data;
+		}
+	} else {
+		if (!ast->dp501_fw_buf)
+			return AST_DP501_DEFAULT_DCLK;	/* 1024x768 as default */
+
+		/* dummy read */
+		offset =3D 0x0000;
+		data =3D readl(ast->dp501_fw_buf + offset);
+
+		/* validate FW version */
+		offset =3D AST_DP501_GBL_VERSION;
+		data =3D readl(ast->dp501_fw_buf + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1) /* v=
ersion: 1x */
+			return maxclk;
+
+		/* Read Link Capability */
+		offset =3D AST_DP501_LINKRATE;
+		plinkcap =3D (u32 *)linkcap;
+		*plinkcap =3D readl(ast->dp501_fw_buf + offset);
+		if (linkcap[2] =3D=3D 0) {
+			linkrate =3D linkcap[0];
+			linklanes =3D linkcap[1];
+			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklanes);
+			if (data > 0xff)
+				data =3D 0xff;
+			maxclk =3D (u8)data;
+		}
 	}
 	return maxclk;
 }
@@ -298,26 +334,57 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *=
ediddata)
 {
 	struct ast_private *ast =3D to_ast_private(dev);
 	u32 i, boot_address, offset, data;
+	u32 *pEDIDidx;

-	boot_address =3D get_fw_base(ast);
-
-	/* validate FW version */
-	offset =3D 0xf000;
-	data =3D ast_mindwm(ast, boot_address + offset);
-	if ((data & 0xf0) !=3D 0x10)
-		return false;
-
-	/* validate PnP Monitor */
-	offset =3D 0xf010;
-	data =3D ast_mindwm(ast, boot_address + offset);
-	if (!(data & 0x01))
-		return false;
+	if (ast->config_mode =3D=3D ast_use_p2a) {
+		boot_address =3D get_fw_base(ast);

-	/* Read EDID */
-	offset =3D 0xf020;
-	for (i =3D 0; i < 128; i +=3D 4) {
-		data =3D ast_mindwm(ast, boot_address + offset + i);
-		*(u32 *)(ediddata + i) =3D data;
+		/* validate FW version */
+		offset =3D AST_DP501_GBL_VERSION;
+		data =3D ast_mindwm(ast, boot_address + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)
+			return false;
+
+		/* validate PnP Monitor */
+		offset =3D AST_DP501_PNPMONITOR;
+		data =3D ast_mindwm(ast, boot_address + offset);
+		if (!(data & AST_DP501_PNP_CONNECTED))
+			return false;
+
+		/* Read EDID */
+		offset =3D AST_DP501_EDID_DATA;
+		for (i =3D 0; i < 128; i +=3D 4) {
+			data =3D ast_mindwm(ast, boot_address + offset + i);
+			pEDIDidx =3D (u32 *)(ediddata + i);
+			*pEDIDidx =3D data;
+		}
+	} else {
+		if (!ast->dp501_fw_buf)
+			return false;
+
+		/* dummy read */
+		offset =3D 0x0000;
+		data =3D readl(ast->dp501_fw_buf + offset);
+
+		/* validate FW version */
+		offset =3D AST_DP501_GBL_VERSION;
+		data =3D readl(ast->dp501_fw_buf + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)
+			return false;
+
+		/* validate PnP Monitor */
+		offset =3D AST_DP501_PNPMONITOR;
+		data =3D readl(ast->dp501_fw_buf + offset);
+		if (!(data & AST_DP501_PNP_CONNECTED))
+			return false;
+
+		/* Read EDID */
+		offset =3D AST_DP501_EDID_DATA;
+		for (i =3D 0; i < 128; i +=3D 4) {
+			data =3D readl(ast->dp501_fw_buf + offset + i);
+			pEDIDidx =3D (u32 *)(ediddata + i);
+			*pEDIDidx =3D data;
+		}
 	}

 	return true;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 6b9e3b94a712..da6dfb677540 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -121,6 +121,7 @@ struct ast_private {

 	void __iomem *regs;
 	void __iomem *ioregs;
+	void __iomem *dp501_fw_buf;

 	enum ast_chip chip;
 	bool vga2_clone;
@@ -299,6 +300,17 @@ int ast_mode_config_init(struct ast_private *ast);
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)

+#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
+#define AST_DP501_FW_VERSION_1		BIT(4)
+#define AST_DP501_PNP_CONNECTED		BIT(1)
+
+#define AST_DP501_DEFAULT_DCLK	65
+
+#define AST_DP501_GBL_VERSION	0xf000
+#define AST_DP501_PNPMONITOR	0xf010
+#define AST_DP501_LINKRATE	0xf014
+#define AST_DP501_EDID_DATA	0xf020
+
 int ast_mm_init(struct ast_private *ast);

 /* ast post */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.=
c
index 4ec6884f6c65..3775fe26f792 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -449,6 +449,14 @@ struct ast_private *ast_device_create(struct drm_drive=
r *drv,
 	if (ret)
 		return ERR_PTR(ret);

+	/* map reserved buffer */
+	ast->dp501_fw_buf =3D NULL;
+	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
+		ast->dp501_fw_buf =3D pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_s=
ize, 0);
+		if (!ast->dp501_fw_buf)
+			drm_info(dev, "failed to map reserved buffer!\n");
+	}
+
 	ret =3D ast_mode_config_init(ast);
 	if (ret)
 		return ERR_PTR(ret);
--
2.18.4


--_002_HK2PR06MB3300FC50877DC77AF06DED8C8C7C9HK2PR06MB3300apcp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_002_HK2PR06MB3300FC50877DC77AF06DED8C8C7C9HK2PR06MB3300apcp_--
