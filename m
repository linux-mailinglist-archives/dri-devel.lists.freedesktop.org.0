Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3D2BFDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 09:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08489BAF;
	Tue, 28 May 2019 07:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02489BA9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 07:03:58 +0000 (UTC)
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB5358.eurprd04.prod.outlook.com (20.178.120.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Tue, 28 May 2019 07:03:54 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c950:60e8:f04b:dacd]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::c950:60e8:f04b:dacd%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:03:54 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Thread-Topic: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Thread-Index: AQHVBcIU7Xy02YagYESRMnQx9YYbF6Z/FvmAgADJfACAAFsLgA==
Date: Tue, 28 May 2019 07:03:54 +0000
Message-ID: <20190528070353.GA14871@fsr-ub1664-121>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de> <20190528013800.GB6885@dragon>
In-Reply-To: <20190528013800.GB6885@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8854085f-e45e-4c2a-5b22-08d6e33aa5b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5358; 
x-ms-traffictypediagnostic: VI1PR04MB5358:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR04MB5358ACC9EB60143AC5FC7A9FFF1E0@VI1PR04MB5358.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(396003)(366004)(136003)(376002)(346002)(39860400002)(189003)(199004)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(71190400001)(71200400001)(1076003)(99286004)(54906003)(86362001)(14454004)(256004)(14444005)(66066001)(2906002)(6916009)(33716001)(76176011)(102836004)(7736002)(305945005)(76116006)(6116002)(53936002)(186003)(229853002)(966005)(6246003)(6486002)(8676002)(11346002)(5660300002)(4326008)(486006)(6306002)(45080400002)(44832011)(6436002)(81166006)(81156014)(9686003)(6506007)(25786009)(6512007)(8936002)(446003)(33656002)(68736007)(478600001)(476003)(3846002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5358;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EXBYxxf2anrAJR9aLMkgVGwD2h9US4OZL+Q4QtqHdWT3up+s2DlypHf2a2ec1/qmOTqp4L1x/fmvsyXO8FaK4TUy/1zQzZG7q737a+iHHvL8KwOgpEVwzGEYiaWHDr6cb8Q1oE8wvItcbOVwU7lUllVntXJ8au0D7A2oJnHAXX1f6cnnkUuH5Mk0Jst6zN8t0qLHdGZdNY68XLHiK170LVDAza5yxtjjorB0I7x1axnOLHwLiOdMND+67YCOAgM1ahYfscwa5W82pIP37SqjhqLg9IPlhHdfTzA2k9Jy5lvKp0T9CeQL9nB/98M239OmULodyPGJuYvoexmewL1eiGyh67KgqDSCTkM5oVAe4mWC6JrWlCETeluAWowhxxkc7DN1wIlJqqYZomh4LVlUfzAigE0hCPwgJH5jn+njpk4=
Content-ID: <04C6D3A419101E41A2976AB92869E89F@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8854085f-e45e-4c2a-5b22-08d6e33aa5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:03:54.5393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurentiu.palcu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF0DjxOUZOCAFeJv5k+IubyA3ThzF/KUyGPYWhEpmYk=;
 b=eEq9CSiG3MnN3FQbfLn+vkg1rzFmy+ywjdo72DHgiEfwIP8LVQQMmlIo4AFJ1P333Q8o3xYlANsMbuPHiG0d+LfmitB0upqVqEuonOAaA2BVIYoEGP+VkY3cQQza5ExHZoEeCyGgcoOidhm+joDfY2HIPZj+N/n7Tu2Qj3d2PFU=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2hhd24sIEx1Y2FzLAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDk6Mzg6MDJBTSArMDgw
MCwgU2hhd24gR3VvIHdyb3RlOgo+IENhdXRpb246IEVYVCBFbWFpbAo+IAo+IEhpIEx1Y2FzLAo+
IAo+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDAzOjM2OjUzUE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+ID4gV2UgaGF2ZSBiZWVuIGxvb2tpbmcgYXQgaG93IHRvIHN1cHBvcnQgRENTUyBp
biBtYWlubGluZSBmb3IgYSB3aGlsZSwKPiA+IGJ1dCBtb3N0IG9mIHRoZSBhY3R1YWwgd29yayBn
b3QgcHVzaGVkIGJlaGluZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3RoZXIKPiA+IHByaW9yaXRpZXMu
Cj4gCj4gSSBoYXZlIHNvbWUgdGltZSB0byBjb250cmlidXRlLiAgV291bGQgeW91IHN1Z2dlc3Qg
aG93IEkgc2hvdWxkIGhlbHAKPiBoZXJlPwo+IAo+IDEuIFlvdSBndXlzIGFscmVhZHkgaGF2ZSBz
b21ldGhpbmcgY2xvc2UgdG8gY29tcGxldGlvbiBhbmQgZG8gbm90IG5lZWQKPiAgICBtb3JlIGhh
bmRzLgo+IDIuIFlvdSBndXlzIGFscmVhZHkgaGF2ZSBzb21lIHByZWxpbWluYXJ5IGNvZGUgYW5k
IGNhbiB1c2UgaGVscCBmcm9tCj4gICAgb3RoZXJzLgo+IDMuIFlvdSBndXlzIGhhdmVuJ3QgZ290
IGFueXRoaW5nIHRvIHN0YXJ0IHdpdGgsIGJ1dCBqdXN0IHNvbWUgZGVzaWduCj4gICAgcHJpbmNp
cGxlcyB0aGF0IGFueW9uZSB3aG8gd2FudHMgdG8gd29yayBvbiBpdCBzaG91bGQgY29uc2lkZXIu
Cj4gCj4gV2hpY2ggaXMgdGhlIG9uZSB0aGF0IHlvdSB3YW50IG1lIHRvIHJlYWQ/CgpXZSdyZSBh
bHJlYWR5IHdvcmtpbmcgb24gY2xlYXJpbmcgdXAgdGhlIERDU1MgY29kZSBhbmQgcHJlcGFyaW5n
IGl0IGZvcgp1cHN0cmVhbWluZy4gSXQgc2hvdWxkIGJlIGRvbmUgaW4gdGhlIGZvbGxvd2luZyB3
ZWVrcy4gVGhlIHJlYXNvbiB3ZSd2ZQpiZWVuIGRlbGF5aW5nIHRoaXMgaXMgYmVjYXVzZSBuZWl0
aGVyIEhETUkgbm9yIE1JUEkgc3VwcG9ydCB3YXMgcHJlc2VudAphbmQsIHVudGlsIHRoZXNlIGFy
ZSB1cHN0cmVhbSwgdGVzdGluZyBEQ1NTIHdvdWxkIGJlIHF1aXRlIGltcG9zc2libGUuCgo+IAo+
ID4gT25lIHRoaW5nIEkgY2FuIGNhbiBzYXkgZm9yIGNlcnRhaW4gaXMgdGhhdCBEQ1NTIHNob3Vs
ZCBub3QgYmUKPiA+IGludGVncmF0ZWQgaW50byBpbXgtZHJtLiBJdCdzIGEgdG90YWxseSBkaWZm
ZXJlbnQgaGFyZHdhcmUgYW5kCj4gPiBkb3duc3RyZWFtIGNsZWFybHkgc2hvd3MgdGhhdCBpdCdz
IG5vdCBhIGdvb2QgaWRlYSB0byBjcmFtIGl0IGludG8gaW14LQo+ID4gZHJtLgo+IAo+IEkgaGF2
ZW4ndCBnb25lIGRlZXBlciBpbnRvIHRoZSB2ZW5kb3IgY29kZSwgYnV0IGZyb20gYSBicmllZiBs
b29raW5nIEkKPiBkaWRuJ3Qgc2VlIHNvIG1hbnkgcHJvYmxlbXMgd2l0aCBpbnRlZ3JhdGluZyBE
Q1NTIGludG8gaW14LWRybS4gIEl0J3MKPiBub3Qgc28gdW5yZWFzb25hYmxlIHRvIHRha2UgaW14
LWRybSBhcyBhbiBpbXgtZGlzcGxheS1zdWJzeXN0ZW0gd2hpY2gKPiBjYW4gaGF2ZSBtdWx0aXBs
ZSBDUlRDcy4gIFNvIGNhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBhIGJpdCBvbiB3aHkgaXQncwo+
IHJlYWxseSBhIGJhZCBpZGVhPwoKSSdkIGJlIGludGVyZXN0ZWQgdG8gaGVhciBhYm91dCB0aGlz
IGFzIHdlbGwuCgo+IAo+ID4gQWxzbyB0aGUgYXJ0aWZpY2lhbCBzcGxpdCBiZXR3ZWVuIGhhcmR3
YXJlIGNvbnRyb2wgaW4KPiA+IGRyaXZlcnMvZ3B1L2lteC9kY3NzIGFuZCB0aGUgRFJNIGRyaXZl
ciBpcyBqdXN0IGNhcmdvLWN1bHQgZnJvbSB0aGUKPiA+IElQVS9pbXgtZHJtIHNwbGl0LiBGb3Ig
dGhlIElQVSB3ZSBkaWQgaXQgYXMgdGhlIElQVSBoYXMgbGVncyBpbiBib3RoCj4gPiBEUk0gZm9y
IHRoZSBvdXRwdXQgcGFydHMgYW5kIFY0TDIgZm9yIHRoZSBpbnB1dCBwYXJ0cy4gQXMgdGhlIERD
U1MgaGFzCj4gPiBubyB2aWRlbyBpbnB1dCBjYXBhYmlsaXRpZXMgdGhlIGRyaXZlciBjb3VsZCBi
ZSBzaW1wbGlmaWVkIGEgbG90IGJ5Cj4gPiBtb3ZpbmcgaXQgYWxsIGludG8gYSBzaW5nbGUgRFJN
IGRyaXZlci4KPiAKPiBBZ3JlZWQgb24gdGhpcy4KCkkgYWxzbyBhZ3JlZSBvbiB0aGlzLiBEQ1NT
IGNvcmUgY29kZSB3aWxsIHByb2JhYmx5IGJlIG1vdmVkIGluc2lkZSB0aGUKc2FtZSBkaXJlY3Rv
cnk6IGRyaXZlcnMvZ3B1L2RybS9pbXgvZGNzcy4KClRoYW5rcywKbGF1cmVudGl1Cgo+IAo+IFNo
YXduCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRy
aS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdDbGF1cmVudGl1LnBhbGN1JTQwbnhwLmNvbSU3Q2Rh
N2U2MmM2YjY5ZjRlMGM4MDA0MDhkNmUzMGQ0ZGZjJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTlj
NWMzMDE2MzUlN0MwJTdDMCU3QzYzNjk0NjA0MzYxOTczNzEwMyZhbXA7c2RhdGE9Ym5yOUVKRzV5
NEhxciUyRlVUNVQzRWZ2V0lRS0F2a1ZDWkdoZFB3RVBKUU93JTNEJmFtcDtyZXNlcnZlZD0wCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
