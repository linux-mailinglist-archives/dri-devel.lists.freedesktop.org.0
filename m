Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045812C3F7
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5731789BB3;
	Tue, 28 May 2019 10:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20049.outbound.protection.outlook.com [40.107.2.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20089BB3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:10:14 +0000 (UTC)
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB4541.eurprd04.prod.outlook.com (20.177.55.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Tue, 28 May 2019 10:10:11 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c950:60e8:f04b:dacd]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c950:60e8:f04b:dacd%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 10:10:11 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Thread-Topic: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Thread-Index: AQHVBcIU7Xy02YagYESRMnQx9YYbF6Z/FvmAgADJfACAAFsLgIAAKakAgAAKYwA=
Date: Tue, 28 May 2019 10:10:11 +0000
Message-ID: <20190528101010.GB15992@fsr-ub1664-121>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de> <20190528013800.GB6885@dragon>
 <20190528070353.GA14871@fsr-ub1664-121>
 <20190528093300.GA5118@bogon.m.sigxcpu.org>
In-Reply-To: <20190528093300.GA5118@bogon.m.sigxcpu.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f77fcded-c220-4698-24e5-08d6e354ab9f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4541; 
x-ms-traffictypediagnostic: VI1PR04MB4541:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <VI1PR04MB4541FE0BBA3942D325D69C4CFF1E0@VI1PR04MB4541.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(396003)(376002)(136003)(346002)(366004)(39860400002)(199004)(189003)(33656002)(5660300002)(446003)(8936002)(26005)(7736002)(2906002)(6246003)(305945005)(8676002)(66066001)(76176011)(66574012)(478600001)(11346002)(102836004)(81156014)(1076003)(316002)(6512007)(99286004)(6306002)(81166006)(6506007)(9686003)(966005)(6916009)(4326008)(6486002)(54906003)(25786009)(68736007)(14454004)(476003)(44832011)(53936002)(76116006)(66946007)(66476007)(71190400001)(71200400001)(66556008)(64756008)(66446008)(73956011)(229853002)(45080400002)(256004)(14444005)(3846002)(33716001)(6116002)(86362001)(186003)(486006)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4541;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WpVUvfA4SnAr43bVoa147DNHkVzWFebX82IsdQ74lhPS25wlnlvdTV/mwS8xkMTYvQGs01/uJnw8hbUuMwWLmMZHT32g/WcOmZxWWaI9WTdUcxlMvZyGJSJ/IN8+HHX7fpua0/7y8sNGFBgpPBHd0LcfiUf7kbCxjrszCVdOr12LbfXlfCedy4pJYTlBoV8jUy19QzmLQG19QJ8+m7ABBhd7e1+eu/1x3pMOISnXoR8ueumLbg4xUVTS6wVWvLMiOSedqFMBSdYs61rmed2shieOsov7EbbCeShpBxG+Uu3taPZakCsq3Hjhu3HgAmaoENM1LQPA2NAUNH2jQQrQIRrtR6Rdr3qSM7iNeRuHGNl9PwoEaq+y3N56XbjVHM09JbGqtTed1D+DxgjLVZPnhZXI7yWgCR2jiNrKMbyMuNw=
Content-ID: <D42F223806175E46BF20672B8783A88C@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77fcded-c220-4698-24e5-08d6e354ab9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 10:10:11.3876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurentiu.palcu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4541
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OK5RbP595D3PHzKzWTSNinqEqzVY/Dnr4jcFBPTrO6s=;
 b=EXBtRFl1XFxk9u1BUMk8tunBDsoD1Zzdfk2W94noxa8CEBE2UD7oXHZi6Ixloq/cuSBfJUv5YkHCcA8rhslEowi67sq0TMME2Fx/LQLsnNb5/zB0lPRQSafVn0w9LYtRC36BiuY2nKT93xpulKwcXaWs+9wLbWm+BF6i2aTy++A=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAxMTozMzowMEFNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiBDYXV0aW9uOiBFWFQgRW1haWwKPiAKPiBIaSBMYXVyZW50aXUs
Cj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6MDM6NTRBTSArMDAwMCwgTGF1cmVudGl1IFBh
bGN1IHdyb3RlOgo+ID4gSGkgU2hhd24sIEx1Y2FzLAo+ID4KPiA+IE9uIFR1ZSwgTWF5IDI4LCAy
MDE5IGF0IDA5OjM4OjAyQU0gKzA4MDAsIFNoYXduIEd1byB3cm90ZToKPiA+ID4gQ2F1dGlvbjog
RVhUIEVtYWlsCj4gPiA+Cj4gPiA+IEhpIEx1Y2FzLAo+ID4gPgo+ID4gPiBPbiBNb24sIE1heSAy
NywgMjAxOSBhdCAwMzozNjo1M1BNICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiA+ID4gPiBX
ZSBoYXZlIGJlZW4gbG9va2luZyBhdCBob3cgdG8gc3VwcG9ydCBEQ1NTIGluIG1haW5saW5lIGZv
ciBhIHdoaWxlLAo+ID4gPiA+IGJ1dCBtb3N0IG9mIHRoZSBhY3R1YWwgd29yayBnb3QgcHVzaGVk
IGJlaGluZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3RoZXIKPiA+ID4gPiBwcmlvcml0aWVzLgo+ID4g
Pgo+ID4gPiBJIGhhdmUgc29tZSB0aW1lIHRvIGNvbnRyaWJ1dGUuICBXb3VsZCB5b3Ugc3VnZ2Vz
dCBob3cgSSBzaG91bGQgaGVscAo+ID4gPiBoZXJlPwo+ID4gPgo+ID4gPiAxLiBZb3UgZ3V5cyBh
bHJlYWR5IGhhdmUgc29tZXRoaW5nIGNsb3NlIHRvIGNvbXBsZXRpb24gYW5kIGRvIG5vdCBuZWVk
Cj4gPiA+ICAgIG1vcmUgaGFuZHMuCj4gPiA+IDIuIFlvdSBndXlzIGFscmVhZHkgaGF2ZSBzb21l
IHByZWxpbWluYXJ5IGNvZGUgYW5kIGNhbiB1c2UgaGVscCBmcm9tCj4gPiA+ICAgIG90aGVycy4K
PiA+ID4gMy4gWW91IGd1eXMgaGF2ZW4ndCBnb3QgYW55dGhpbmcgdG8gc3RhcnQgd2l0aCwgYnV0
IGp1c3Qgc29tZSBkZXNpZ24KPiA+ID4gICAgcHJpbmNpcGxlcyB0aGF0IGFueW9uZSB3aG8gd2Fu
dHMgdG8gd29yayBvbiBpdCBzaG91bGQgY29uc2lkZXIuCj4gPiA+Cj4gPiA+IFdoaWNoIGlzIHRo
ZSBvbmUgdGhhdCB5b3Ugd2FudCBtZSB0byByZWFkPwo+ID4KPiA+IFdlJ3JlIGFscmVhZHkgd29y
a2luZyBvbiBjbGVhcmluZyB1cCB0aGUgRENTUyBjb2RlIGFuZCBwcmVwYXJpbmcgaXQgZm9yCj4g
PiB1cHN0cmVhbWluZy4gSXQgc2hvdWxkIGJlIGRvbmUgaW4gdGhlIGZvbGxvd2luZyB3ZWVrcy4g
VGhlIHJlYXNvbiB3ZSd2ZQo+ID4gYmVlbiBkZWxheWluZyB0aGlzIGlzIGJlY2F1c2UgbmVpdGhl
ciBIRE1JIG5vciBNSVBJIHN1cHBvcnQgd2FzIHByZXNlbnQKPiA+IGFuZCwgdW50aWwgdGhlc2Ug
YXJlIHVwc3RyZWFtLCB0ZXN0aW5nIERDU1Mgd291bGQgYmUgcXVpdGUgaW1wb3NzaWJsZS4KPiAK
PiBNSVBJIHN1cHBvcnQgaXMgaGVyZToKPiAKPiAgIG1peGVsOiAgaHR0cHM6Ly9ldXIwMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZyUyRnNlcmllcyUyRjU4ODE3JTJGJmFtcDtkYXRhPTAyJTdDMDElN0Ns
YXVyZW50aXUucGFsY3UlNDBueHAuY29tJTdDOTkyNGM0NjI4ZDVmNGY5OGQ4YTgwOGQ2ZTM0Zjdi
MjYlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM2OTQ2MzI3
ODM5ODI4MzY2JmFtcDtzZGF0YT1WWnZ2aGUyV2tNVkNTT0V3NW9aREpmeTdyc3FGN1lhRWlycmtM
RkM4SWN3JTNEJmFtcDtyZXNlcnZlZD0wCj4gICBud2w6ICBodHRwczovL2V1cjAxLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnJTJGc2VyaWVzJTJGNTc2ODYlMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2xhdXJl
bnRpdS5wYWxjdSU0MG54cC5jb20lN0M5OTI0YzQ2MjhkNWY0Zjk4ZDhhODA4ZDZlMzRmN2IyNiU3
QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzY5NDYzMjc4Mzk4
MzgzNTkmYW1wO3NkYXRhPVE0czZPWnExS0Vsa3RqU1hSZDJsS0JNZGcxeVBKc1dHbThVclNQcXFU
aUUlM0QmYW1wO3Jlc2VydmVkPTAKPiAKPiBUaGUgTldMIGRyaXZlciBuZWVkcyB0byBiZSBhZGp1
c3RlZCBkZXBlbmRpbmcgb24gd2hldGhlciB3ZSBob29rIGludG8KPiBpbXgtZGlzcGxheS1zdWJz
eXN0ZW0gb3Igbm90IChhbmQgdGhlbiBsaWtlbHkgbW92ZWQgdG8gdGhlIHJpZ2h0Cj4gc3ViZGly
KS4gQ2FuIHdlIHNvbWVob3cgZ2V0IHRoaXMgbW92aW5nIGluIHN5bmMgKGV2ZW4gaW4gYSBub24g
cHVibGljCj4gdHJlZSBpZiBuZWNlc3NhcnkpLgoKSSBndWVzcyB3ZSBjb3VsZCBkbyB0aGF0IGFz
IHdlbGwuIEknbGwgc3RhcnQgYWRqdXN0aW5nIHRoZSBkcml2ZXIgYW5kCnRha2UgaXQgb3V0IG9m
IGlteC1kcm0sIGFzIHN1Z2dlc3RlZCBieSBMdWNhcyBhbmQgRGFuaWVsLiBJJ2xsIHVzZSB5b3Vy
Ck1JUEkgcGF0Y2hlcyB0byB0ZXN0IHdpdGguCgp0aGFua3MsCmxhdXJlbnRpdQoKPiBDaGVlcnMs
Cj4gIC0tIEd1aWRvCj4gCj4gCj4gPiA+ID4gT25lIHRoaW5nIEkgY2FuIGNhbiBzYXkgZm9yIGNl
cnRhaW4gaXMgdGhhdCBEQ1NTIHNob3VsZCBub3QgYmUKPiA+ID4gPiBpbnRlZ3JhdGVkIGludG8g
aW14LWRybS4gSXQncyBhIHRvdGFsbHkgZGlmZmVyZW50IGhhcmR3YXJlIGFuZAo+ID4gPiA+IGRv
d25zdHJlYW0gY2xlYXJseSBzaG93cyB0aGF0IGl0J3Mgbm90IGEgZ29vZCBpZGVhIHRvIGNyYW0g
aXQgaW50byBpbXgtCj4gPiA+ID4gZHJtLgo+ID4gPgo+ID4gPiBJIGhhdmVuJ3QgZ29uZSBkZWVw
ZXIgaW50byB0aGUgdmVuZG9yIGNvZGUsIGJ1dCBmcm9tIGEgYnJpZWYgbG9va2luZyBJCj4gPiA+
IGRpZG4ndCBzZWUgc28gbWFueSBwcm9ibGVtcyB3aXRoIGludGVncmF0aW5nIERDU1MgaW50byBp
bXgtZHJtLiAgSXQncwo+ID4gPiBub3Qgc28gdW5yZWFzb25hYmxlIHRvIHRha2UgaW14LWRybSBh
cyBhbiBpbXgtZGlzcGxheS1zdWJzeXN0ZW0gd2hpY2gKPiA+ID4gY2FuIGhhdmUgbXVsdGlwbGUg
Q1JUQ3MuICBTbyBjYW4geW91IHBsZWFzZSBlbGFib3JhdGUgYSBiaXQgb24gd2h5IGl0J3MKPiA+
ID4gcmVhbGx5IGEgYmFkIGlkZWE/Cj4gPgo+ID4gSSdkIGJlIGludGVyZXN0ZWQgdG8gaGVhciBh
Ym91dCB0aGlzIGFzIHdlbGwuCj4gPgo+ID4gPgo+ID4gPiA+IEFsc28gdGhlIGFydGlmaWNpYWwg
c3BsaXQgYmV0d2VlbiBoYXJkd2FyZSBjb250cm9sIGluCj4gPiA+ID4gZHJpdmVycy9ncHUvaW14
L2Rjc3MgYW5kIHRoZSBEUk0gZHJpdmVyIGlzIGp1c3QgY2FyZ28tY3VsdCBmcm9tIHRoZQo+ID4g
PiA+IElQVS9pbXgtZHJtIHNwbGl0LiBGb3IgdGhlIElQVSB3ZSBkaWQgaXQgYXMgdGhlIElQVSBo
YXMgbGVncyBpbiBib3RoCj4gPiA+ID4gRFJNIGZvciB0aGUgb3V0cHV0IHBhcnRzIGFuZCBWNEwy
IGZvciB0aGUgaW5wdXQgcGFydHMuIEFzIHRoZSBEQ1NTIGhhcwo+ID4gPiA+IG5vIHZpZGVvIGlu
cHV0IGNhcGFiaWxpdGllcyB0aGUgZHJpdmVyIGNvdWxkIGJlIHNpbXBsaWZpZWQgYSBsb3QgYnkK
PiA+ID4gPiBtb3ZpbmcgaXQgYWxsIGludG8gYSBzaW5nbGUgRFJNIGRyaXZlci4KPiA+ID4KPiA+
ID4gQWdyZWVkIG9uIHRoaXMuCj4gPgo+ID4gSSBhbHNvIGFncmVlIG9uIHRoaXMuIERDU1MgY29y
ZSBjb2RlIHdpbGwgcHJvYmFibHkgYmUgbW92ZWQgaW5zaWRlIHRoZQo+ID4gc2FtZSBkaXJlY3Rv
cnk6IGRyaXZlcnMvZ3B1L2RybS9pbXgvZGNzcy4KPiA+Cj4gPiBUaGFua3MsCj4gPiBsYXVyZW50
aXUKPiA+Cj4gPiA+Cj4gPiA+IFNoYXduCj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRwczovL2V1cjAxLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVl
ZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDIl
N0MwMSU3Q2xhdXJlbnRpdS5wYWxjdSU0MG54cC5jb20lN0M5OTI0YzQ2MjhkNWY0Zjk4ZDhhODA4
ZDZlMzRmN2IyNiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2
MzY5NDYzMjc4Mzk4MzgzNTkmYW1wO3NkYXRhPTZJOE1DWHJ0M3k0blgyMFNucGZvU3dFWmtnJTJC
MXpQM0FGTEdIVU5hSSUyRmxzJTNEJmFtcDtyZXNlcnZlZD0wCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9ldXIwMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRh
PTAyJTdDMDElN0NsYXVyZW50aXUucGFsY3UlNDBueHAuY29tJTdDOTkyNGM0NjI4ZDVmNGY5OGQ4
YTgwOGQ2ZTM0ZjdiMjYlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0Mw
JTdDNjM2OTQ2MzI3ODM5ODM4MzU5JmFtcDtzZGF0YT02SThNQ1hydDN5NG5YMjBTbnBmb1N3RVpr
ZyUyQjF6UDNBRkxHSFVOYUklMkZscyUzRCZhbXA7cmVzZXJ2ZWQ9MApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
