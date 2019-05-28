Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6E2C3E2
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5894A89BF1;
	Tue, 28 May 2019 10:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62C689BF1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:04:53 +0000 (UTC)
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB4719.eurprd04.prod.outlook.com (20.177.48.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 10:04:50 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c950:60e8:f04b:dacd]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c950:60e8:f04b:dacd%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 10:04:50 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Thread-Topic: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Thread-Index: AQHVBcIU7Xy02YagYESRMnQx9YYbF6Z/FvmAgADJfACAAHBKAIAABLGAgAAYnYA=
Date: Tue, 28 May 2019 10:04:50 +0000
Message-ID: <20190528100449.GA15992@fsr-ub1664-121>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de> <20190528013800.GB6885@dragon>
 <1559031596.4039.8.camel@pengutronix.de>
 <CAKMK7uFTrBTxOH-nFTJqu88BWzGC5BE49MJT3iREL4+AwCAZuw@mail.gmail.com>
In-Reply-To: <CAKMK7uFTrBTxOH-nFTJqu88BWzGC5BE49MJT3iREL4+AwCAZuw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0027e6fd-ecea-4da4-82cf-08d6e353ec2b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR04MB4719; 
x-ms-traffictypediagnostic: VI1PR04MB4719:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <VI1PR04MB47196D78082A355386E79F86FF1E0@VI1PR04MB4719.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(33656002)(1076003)(68736007)(305945005)(6116002)(3846002)(54906003)(966005)(478600001)(6246003)(14454004)(11346002)(45080400002)(6486002)(44832011)(2906002)(486006)(7736002)(86362001)(5660300002)(53936002)(446003)(476003)(316002)(33716001)(4326008)(186003)(66066001)(26005)(8676002)(66446008)(64756008)(66556008)(66476007)(76176011)(25786009)(6512007)(9686003)(6506007)(102836004)(6306002)(81166006)(81156014)(53546011)(73956011)(99286004)(76116006)(6436002)(8936002)(14444005)(6916009)(71190400001)(66946007)(256004)(229853002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4719;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WxSQDb/8uJJuhcq6ur5Ot4NOe24GI50abv//Bhs63jFDznBidHXo6VgvdJ2P6XB5WT3dbmbtkUCrzpVHLLty35vu0roWB80R01H9T96xi9bSdeb8ZTxVd3TxY8lsVe13p2hKhZZ6NWVUinRakHQ55tW6nMz4IboVXNxdP27nzXUdG4pMUlhtUpRQCI3SPJcq6ewSsmr3aH5b2XReid76ovyIyBzvpuHYQoGSYdP4au5am6M50WiBoaQUQ68RjT8FYtsDZ2YBM6pVDtKcadnb+dk6BjXBxinNJkl3jHa3nveloW4tCDHVdLTFVlrUjfKYvy/1tX37pxd58Y18NrvJynjU3j/WgMG0/dpExJ8XSzZ0h0h4TC8iWRv0GCaQd91yq/Tr4jngdkWnspFsMuNtY7r4g3+8z55tFvGwAiZy3Jg=
Content-ID: <D1CAB815B9EF114D863A2F740EA7BA42@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0027e6fd-ecea-4da4-82cf-08d6e353ec2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 10:04:50.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurentiu.palcu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hksEGHaJv71JaIMaFa6AGSvoxGgribkT7Ms4RHLlhw0=;
 b=iAdHa4N02CJ1RVRR3nQxa/DkYHfP5ne13Ds43POAZcPj0bqP8AJXsJDMB5j62v1QTyX69c5/H+pCfiAnSX2R4sgKYp6FKZfAoK9A62AyamIcw1jqnxuOpPr8lytX00dWp3wAW8BXh4A6DzfIBWwrzxrX90VS09EIkAOqqWflCis=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@nxp.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

THVjYXMgYW5kIERhbmllbCwKCk9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDEwOjM2OjQzQU0gKzAy
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gQ2F1dGlvbjogRVhUIEVtYWlsCj4gCj4gT24gVHVl
LCBNYXkgMjgsIDIwMTkgYXQgMTA6MjAgQU0gTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+IHdyb3RlOgo+ID4KPiA+IEhpIFNoYXduLAo+ID4KPiA+IEFtIERpZW5zdGFnLCBkZW4g
MjguMDUuMjAxOSwgMDk6MzggKzA4MDAgc2NocmllYiBTaGF3biBHdW86Cj4gPiA+IEhpIEx1Y2Fz
LAo+ID4gPgo+ID4gPiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwMzozNjo1M1BNICswMjAwLCBM
dWNhcyBTdGFjaCB3cm90ZToKPiA+ID4gPiBXZSBoYXZlIGJlZW4gbG9va2luZyBhdCBob3cgdG8g
c3VwcG9ydCBEQ1NTIGluIG1haW5saW5lIGZvciBhIHdoaWxlLAo+ID4gPiA+IGJ1dCBtb3N0IG9m
IHRoZSBhY3R1YWwgd29yayBnb3QgcHVzaGVkIGJlaGluZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3Ro
ZXIKPiA+ID4gPiBwcmlvcml0aWVzLgo+ID4gPgo+ID4gPiBJIGhhdmUgc29tZSB0aW1lIHRvIGNv
bnRyaWJ1dGUuICBXb3VsZCB5b3Ugc3VnZ2VzdCBob3cgSSBzaG91bGQgaGVscAo+ID4gPiBoZXJl
Pwo+ID4gPgo+ID4gPiAxLiBZb3UgZ3V5cyBhbHJlYWR5IGhhdmUgc29tZXRoaW5nIGNsb3NlIHRv
IGNvbXBsZXRpb24gYW5kIGRvIG5vdCBuZWVkCj4gPiA+ICAgIG1vcmUgaGFuZHMuCj4gPiA+IDIu
IFlvdSBndXlzIGFscmVhZHkgaGF2ZSBzb21lIHByZWxpbWluYXJ5IGNvZGUgYW5kIGNhbiB1c2Ug
aGVscCBmcm9tCj4gPiA+ICAgIG90aGVycy4KPiA+ID4gMy4gWW91IGd1eXMgaGF2ZW4ndCBnb3Qg
YW55dGhpbmcgdG8gc3RhcnQgd2l0aCwgYnV0IGp1c3Qgc29tZSBkZXNpZ24KPiA+ID4gICAgcHJp
bmNpcGxlcyB0aGF0IGFueW9uZSB3aG8gd2FudHMgdG8gd29yayBvbiBpdCBzaG91bGQgY29uc2lk
ZXIuCj4gPiA+Cj4gPiA+IFdoaWNoIGlzIHRoZSBvbmUgdGhhdCB5b3Ugd2FudCBtZSB0byByZWFk
Pwo+ID4KPiA+IE1vc3RseSB0aGUgM3JkLiBXZSBzcGVudCBzb21lIHRpbWUgb24gZ2V0dGluZyB0
aGUgRENTUyBkcml2ZXIgdG8gd29yawo+ID4gb24gdXBzdHJlYW0ga2VybmVsIGFuZCBmYW1pbGlh
cml6ZSB3aXRoIHRoZSBoYXJkd2FyZSwgYnV0IHdlIGRvbid0IGhhdmUKPiA+IGFueSBjbG9zZSB0
byBtYWlubGluZSBxdWFsaXR5IGNvZGUuCj4gPgo+ID4gPiA+IE9uZSB0aGluZyBJIGNhbiBjYW4g
c2F5IGZvciBjZXJ0YWluIGlzIHRoYXQgRENTUyBzaG91bGQgbm90IGJlCj4gPiA+ID4gaW50ZWdy
YXRlZCBpbnRvIGlteC1kcm0uIEl0J3MgYSB0b3RhbGx5IGRpZmZlcmVudCBoYXJkd2FyZSBhbmQK
PiA+ID4gPiBkb3duc3RyZWFtIGNsZWFybHkgc2hvd3MgdGhhdCBpdCdzIG5vdCBhIGdvb2QgaWRl
YSB0byBjcmFtIGl0IGludG8gaW14LQo+ID4gPiA+IGRybS4KPiA+ID4KPiA+ID4gSSBoYXZlbid0
IGdvbmUgZGVlcGVyIGludG8gdGhlIHZlbmRvciBjb2RlLCBidXQgZnJvbSBhIGJyaWVmIGxvb2tp
bmcgSQo+ID4gPiBkaWRuJ3Qgc2VlIHNvIG1hbnkgcHJvYmxlbXMgd2l0aCBpbnRlZ3JhdGluZyBE
Q1NTIGludG8gaW14LWRybS4gIEl0J3MKPiA+ID4gbm90IHNvIHVucmVhc29uYWJsZSB0byB0YWtl
IGlteC1kcm0gYXMgYW4gaW14LWRpc3BsYXktc3Vic3lzdGVtIHdoaWNoCj4gPiA+IGNhbiBoYXZl
IG11bHRpcGxlIENSVENzLiAgU28gY2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlIGEgYml0IG9uIHdo
eSBpdCdzCj4gPiA+IHJlYWxseSBhIGJhZCBpZGVhPwo+ID4KPiA+IEl0J3MgYSB0b3RhbGx5IGRp
ZmZlcmVudCBoYXJkd2FyZSwgd2l0aCB2ZXJ5IGRpZmZlcmVudCBiZWhhdmlvciwgc28KPiA+IHRo
ZXJlIGlzIGJhc2ljYWxseSBubyBwb3RlbnRpYWwgZm9yIGFueSBjb2RlIHNoYXJpbmcuIFRoZSBk
b3duc3RyZWFtCj4gPiBkcml2ZXIgaXMgYSBoZWxsIG9mICJvaCwgdGhpbmdzIGFyZSBkaWZmZXJl
bnQgaGVyZSwgbGV0J3MgaW50cm9kdWNlIHlldAo+ID4gYW5vdGhlciBmdW5jdGlvbiBwb2ludGVy
IHRvIG1ha2UgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gdGhlIEhXIi4gSXQKPiA+IGNvbXBsaWNh
dGVzIHRoZSBpbXgtZHJtIGZvciBubyBnb29kIHJlYXNvbi4gT3VyIGV4cGVyaWVuY2Ugd2l0aCBp
bXgtZHJtCj4gPiBpcyB0aGF0IGl0IGlzIGFscmVhZHkgYXQgYSBjb21wbGV4aXR5IGxldmVsIHRo
YXQgbWFrZXMgaXQgaGFyZCB0bwo+ID4gcmVhc29uIGFib3V0IHRoaW5ncyB3aGVuIGh1bnRpbmcg
YnVncy4KPiA+Cj4gPiBUaGUgYm9pbGVyIHBsYXRlIHJlcXVpcmVkIHRvIHdyaXRlIGEgYXRvbWlj
IEtNUyBkcml2ZXIgaXMgbm90IHRoYXQKPiA+IG11Y2gsIHNvIEkgd291bGQgcmF0aGVyIGhhdmUg
YSBjbGVhbiBzcGxpdCBiZXR3ZWVuIHRoZSB0d28gaGFyZHdhcmUKPiA+IGRyaXZlcnMuIEZyYW5r
bHkgdGhleSBkb24ndCBzaGFyZSBhbnl0aGluZyBleGNlcHQgYm90aCBiZWluZyBhIGF0b21pYwo+
ID4gS01TIGRyaXZlciBhbmQgcnVubmluZyBvbiBhIFNvQyBjYWxsZWQgaS5NWC4KPiAKPiBXZSd2
ZSBhbHNvIG1hZGUgbG90cyBvZiBpbXByb3ZlbWVudHMgaW4gdGhlIGhlbHBlcnMsIEkgdGhpbmsg
YSBjbGVhbgo+IGRyaXZlciB3aWxsIGJlIHF1aWV0IGEgYml0IHNtYWxsZXIgdGhhbiBhbiBpbXgg
YmFzZWQgb25lLiBBUk0gaXMgZG9pbmcKPiB0aGUgc2FtZSB3aXRoIGtvbWVkYSBhbmQgdGhlIG1h
bGlkcCBkcml2ZXIgYnR3LiBBbm90aGVyIG9wdGlvbiB3b3VsZAo+IGJlIDIga21zIGRyaXZlcnMg
aW4gb25lIC5rbywgd2hpY2ggaXMgd2hhdCBub3V2ZWF1IGRvZXMgd2l0aCBwcmUtbnY1MAo+IGFu
ZCBwb3N0LW52NTAuIEJ1dCB0aGF0IG9ubHkgbWFrZXMgc2Vuc2UgaWYgeW91IGhhdmUgYWxzbyB0
aGUgcmVuZGVyCj4gc2lkZSBpbiB0aGUgc2FtZSBkcml2ZXIgYmVjYXVzZSBpdCdzIGFsbCBmcm9t
IHRoZSBzYW1lIHZlbmRvci4gbXNtIGlzCj4gc2ltaWxhciwgd2l0aCBtc200IHZzIG1zbTUuCj4g
Cj4gQnV0IGZvciBzb2MgZGlzcGxheS1vbmx5IEkgdGhpbmsgdHdvIHNlcGFyYXRlIGRyaXZlcnMs
IGlmIHRoZSBodwo+IHJlYWxseSBjaGFuZ2VkIGVub3VnaCwgaXMgdGhlIGJlc3Qgb3B0aW9uLiBZ
b3UgY2FuIHN0aWxsIHN0dWZmIHRoZW0KPiBpbnRvIHRoZSBzYW1lIHN1YmRpciBvZmMuCgpTb3Vu
ZHMgZ29vZCB0byBtZS4gSSdsbCByZXdyaXRlIHRoZSBEQ1NTIGRyaXZlciBhbmQgbWFrZSBpdCBz
ZXBhcmF0ZQpmcm9tIGlteC1kcm0uIFRob3VnaCwgdG8gYmUgaG9uZXN0LCB0aGlzIGRlZmVhdHMg
dGhlIHdob2xlIHB1cnBvc2Ugb2YKaW14LWRybSBpbiB0aGUgZmlyc3QgcGxhY2UuLi4gV2Fzbid0
IHRoaXMgc3VwcG9zZWQgdG8gYWN0IGxpa2UgYSBnbHVlCmFuZCBnYXRoZXIgYWxsIGkuTVggcmVs
YXRlZCBkaXNwbGF5IGNvbnRyb2xsZXJzIHVuZGVyIHRoZSBpbXgtZHJtCnVtYnJlbGxhPwoKQnV0
LCBvbiB0aGUgb3RoZXIgaGFuZCwgSSBhZ3JlZSBpdCB3b3VsZCBiZSBiZXN0LCBnb2luZyBmb3J3
YXJkLCB0byBoYXZlCml0IHNlcGFyYXRlLiBFYXNpZXIgdG8gbWFpbnRhaW4gYW5kLCBtb3N0IGxp
a2VseSwgc2ltcGxlci4KCnRoYW5rcywKbGF1cmVudGl1Cgo+IAo+IENoZWVycywgRGFuaWVsCj4g
Cj4gPiA+ID4gQWxzbyB0aGUgYXJ0aWZpY2lhbCBzcGxpdCBiZXR3ZWVuIGhhcmR3YXJlIGNvbnRy
b2wgaW4KPiA+ID4gPiBkcml2ZXJzL2dwdS9pbXgvZGNzcyBhbmQgdGhlIERSTSBkcml2ZXIgaXMg
anVzdCBjYXJnby1jdWx0IGZyb20gdGhlCj4gPiA+ID4gSVBVL2lteC1kcm0gc3BsaXQuIEZvciB0
aGUgSVBVIHdlIGRpZCBpdCBhcyB0aGUgSVBVIGhhcyBsZWdzIGluIGJvdGgKPiA+ID4gPiBEUk0g
Zm9yIHRoZSBvdXRwdXQgcGFydHMgYW5kIFY0TDIgZm9yIHRoZSBpbnB1dCBwYXJ0cy4gQXMgdGhl
IERDU1MgaGFzCj4gPiA+ID4gbm8gdmlkZW8gaW5wdXQgY2FwYWJpbGl0aWVzIHRoZSBkcml2ZXIg
Y291bGQgYmUgc2ltcGxpZmllZCBhIGxvdCBieQo+ID4gPiA+IG1vdmluZyBpdCBhbGwgaW50byBh
IHNpbmdsZSBEUk0gZHJpdmVyLgo+ID4gPgo+ID4gPiBBZ3JlZWQgb24gdGhpcy4KPiA+Cj4gPiBS
ZWdhcmRzLAo+ID4gTHVjYXMKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZt
YWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2xhdXJlbnRp
dS5wYWxjdSU0MG54cC5jb20lN0M4ZGNhMTk0MTljN2U0OWJkMTBmNjA4ZDZlMzQ3YTZlOSU3QzY4
NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzY5NDYyOTQyNDA5NTU2
OTkmYW1wO3NkYXRhPWphU2dKc2syTGlucWFDYlV4ZTZhSXZrTTZvYXNXRmdlemZUWk1FTW81VW8l
M0QmYW1wO3Jlc2VydmVkPTAKPiAKPiAKPiAKPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNB
JTJGJTJGYmxvZy5mZndsbC5jaCZhbXA7ZGF0YT0wMiU3QzAxJTdDbGF1cmVudGl1LnBhbGN1JTQw
bnhwLmNvbSU3QzhkY2ExOTQxOWM3ZTQ5YmQxMGY2MDhkNmUzNDdhNmU5JTdDNjg2ZWExZDNiYzJi
NGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNjk0NjI5NDI0MDk2NTY5MSZhbXA7c2Rh
dGE9T2JDVGhkVE5zVFl2Sjc1bm5MUWU0RzdIVG9pSUZzZVFnSm9hZWxqWm42TSUzRCZhbXA7cmVz
ZXJ2ZWQ9MAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8l
MkZkcmktZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2xhdXJlbnRpdS5wYWxjdSU0MG54cC5jb20l
N0M4ZGNhMTk0MTljN2U0OWJkMTBmNjA4ZDZlMzQ3YTZlOSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJj
ZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzY5NDYyOTQyNDA5NjU2OTEmYW1wO3NkYXRhPW45YTg2
bWgxYXBpeURndjNyU0o3RzNmejFrMjJ4JTJCJTJCdTMxdXhaQUk5TjBRJTNEJmFtcDtyZXNlcnZl
ZD0wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
