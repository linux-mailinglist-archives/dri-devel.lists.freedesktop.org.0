Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609371268
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09DB88F78;
	Tue, 23 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400138.outbound.protection.outlook.com [40.107.140.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8C289C33
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:27:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSZx81Fg272dq1z48MF++J2SLbYhWYgi67KXk/P0g0qviz9RfMvUltp6xQ8orUiA4FnNlYeohMrk2Dq1loMw6/rIVwJl4aHbmTJ/qkAHYL7lPOXnPelcdhYrBVO2CQI76ACA6ye91XR6mxCzGnY4mL3jqBMAcxWtbDCaar20GQ8sa1Rtof2azxmZdwD0WQhOum9jGuqA2xhBFrtM6raczgy5r9b3fSVdHFejVf4+GwG9dF79uG7xt3fWSDxWd7MDDs7pGE5o2pXbTkgrQunATOvKjW0ULV3hlBc4ORnsHxHcxSvDGyuQYENTk/PmwdQUHlEKaeX+zsyf8ehy3fcS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtCG8h9YDiBiANdY17xPGEtRnwU5O3ZlhJvg82hBcqc=;
 b=aKDE7NmMyTx7aTydhwG4KZg1T/VzvuyRGNyWBm5wxpgBqHEOvsVOqOkgfmH5usXa0B77U7+zKK5ytMDETAWY34NfeaP6Qcar8ooit3oDGwyXJHmDHM9I8CISHJn+yAdQEgVow2X6kIrVY61sGiZ9w2/rIGBNPF+sIzOOMttog50t03D8cWD7e4A1cGWQLjQiKy66POqFDhp8SE6NLrjExyXLnc+Ctrr6ptV2P9wqS8L6PZCKMTEoKN8koKmwTqgifkuTQ7ZkiGAjjy+/4XdMRnImefbQ+jZHwQnxF90p6zhPcF2mMxT+dg8UDcVOaOKBFQOChm4nHdwPFWxNcNdZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1564.jpnprd01.prod.outlook.com (52.133.162.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 11:27:27 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 11:27:26 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
 <jacopo+renesas@jmondi.org>
Subject: RE: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS
 dual-link operation
Thread-Topic: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS
 dual-link operation
Thread-Index: AQHVFV+LuQSI9RSCM0+gPOgQhRN8ZKbWymOQ
Date: Mon, 22 Jul 2019 11:27:26 +0000
Message-ID: <TY1PR01MB177063CF6128DB62E16FD0EBC0C40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190528141234.15425-11-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8325a959-1939-4a90-c6a1-08d70e979328
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1564; 
x-ms-traffictypediagnostic: TY1PR01MB1564:
x-microsoft-antispam-prvs: <TY1PR01MB1564A15151EEE8792CE9E812C0C40@TY1PR01MB1564.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(54094003)(199004)(189003)(52536014)(3846002)(6116002)(7736002)(305945005)(54906003)(81166006)(8676002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(5660300002)(256004)(76176011)(8936002)(86362001)(81156014)(4326008)(7696005)(71200400001)(71190400001)(44832011)(66066001)(99286004)(6246003)(74316002)(102836004)(53936002)(2906002)(9686003)(68736007)(25786009)(55016002)(476003)(229853002)(53546011)(478600001)(6506007)(14454004)(110136005)(316002)(486006)(446003)(33656002)(186003)(6436002)(11346002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1564;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bvDxIstGJav/46JnmZgTXHhnJMS+h/P7yaUg7+qUQjvrLtEbP4uBEePFj5XboZnmrFekfz5jM7RckqiK5Bb4dshEKT/+mAjAMJv29cDq2H2bPD5/3m2huJ0PWngvguYkMEtmonxpdp2uOwYAuxbK1+eObEfgLOi6bhP9cyBUV+nDa9hJ8QS+6LVDS4eLR0l2edXEEirKKOKPf6KqVfvw1k+4Hy6NGaAePPzwV2K6GbLfP57Fp6BM/wPqkAg1eqsjeVHDRste4v1f8YAXkeWWpuzuvNFarQ5CK+ADvXQ8aUryTRShQjo5xs09KDPrMDeu56UK/Wc87R2KfdOogc86ZxavRj285SMIWi7EPKjldDwj+iDq/fphrdW3FTW3v9GWMTVOgMls9ZLGtNtRAw2kupHiHOONv69HmPQcyCSY2Yw=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8325a959-1939-4a90-c6a1-08d70e979328
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 11:27:26.6748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1564
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtCG8h9YDiBiANdY17xPGEtRnwU5O3ZlhJvg82hBcqc=;
 b=aKmxY1TbXmXKBwD8R9kugVwJr09XObsiZGSrxh+D7Z/cmNjJ8846S1hihofjVhQZG6g6zTSUOLO5PQwzF+pHZ94djESVcy3EhZ3k8zschC3HFZUngU1MguOZ/OcEJCA/YuhsBSy/GlprnE3W45x5FeIw/5QvBL/lClLfRSwdE3I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gSmFjb3BvLAoKPiBGcm9tOiBsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5l
bC5vcmcgPGxpbnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxm
IE9mIExhdXJlbnQgUGluY2hhcnQKPiBTZW50OiAyOCBNYXkgMjAxOSAxNToxMwo+IFN1YmplY3Q6
IFtQQVRDSCB2MyAxMC8xMF0gW0hBQ0tdIGFybTY0OiBkdHM6IHJlbmVzYXM6IGViaXN1OiBFbmFi
bGUgTFZEUyBkdWFsLWxpbmsgb3BlcmF0aW9uCj4gCj4gRW5hYmxlIGFuZCBjb25uZWN0IHRoZSBz
ZWNvbmQgTFZEUyBlbmNvZGVyIHRvIHRoZSBzZWNvbmQgTFZEUyBpbnB1dCBvZgo+IHRoZSBUSEM2
M0xWRDEwMjQgZm9yIGR1YWwtbGluayBMVkRTIG9wZXJhdGlvbi4gVGhpcyByZXF1aXJlcyBjaGFu
Z2luZwo+IHRoZSBkZWZhdWx0IHNldHRpbmdzIG9mIFNXNDUgYW5kIFNXNDcgdG8gT0ZGIGFuZCBP
TiByZXNwZWN0aXZlbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gVGVzdGVkLWJ5OiBKYWNv
cG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpIb3cgZGlkIHlvdSB0ZXN0IHRo
aXMgcGF0Y2ggb24gRWJpc3UgKGtlcm5lbCBicmFuY2gsIGNvbmZpZ3VyYXRpb24sIHN3aXRjaGVz
LGV0Yy4pPwoKSSB0ZXN0ZWQgYm90aCBsaW51eC1uZXh0IGFuZCBkcm0vZHUvbHZkcy9kdWFsLWxp
bmsgYW5kIHRoZXkgYXJlIG5vdCB3b3JraW5nIGZvciBtZS4KVGhlIGJhc2UgY29uZmlndXJhdGlv
biBJIGFtIHVzaW5nIGlzIGNvbWluZyBmcm9tIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcg
ZnJvbSBlYWNoIHJlc3BlY3RpdmUgYnJhbmNoLCBvbiB0b3Agb2YgdGhhdCBJIGFtIGVuYWJsaW5n
IHRoZSByZW1haW5pbmcgYml0cyBhbmQgcGllY2VzLgpJIGhhdmUgdHJpZWQgdGhlIHN1Z2dlc3Rl
ZCBjb25maWd1cmF0aW9uIG9mIHRoZSBzd2l0Y2hlcyBmb3IgdGhpcyBwYXRjaCwgYmFzaWNhbGx5
IG5vdGhpbmcgaXMgaGFwcGVuaW5nLiBJIGhhdmUgYWxzbyB0cmllZCByZXZlcnRpbmcgdGhlIGNo
YW5nZXMgbWFkZSBieSB0aGlzIHBhdGNoIChvbiBib3RoIGJyYW5jaGVzKSwgYW5kIG9mIGNvdXJz
ZSBJIGhhdmUgcmV2ZXJ0ZWQgdGhlIHNlbGVjdGlvbiBmb3IgdGhlIHN3aXRjaGVzIGFzIHdlbGws
IGFuZCBldmVuIHNpbmdsZS1saW5rIGRvZXNuJ3Qgd29yayBmb3IgbWUuIFNpbmdsZS1saW5rIHN1
cHBvcnQgZnJvbSB0aGUgQlNQIHZlcnNpb24gb2YgdGhlIGtlcm5lbCAoNC4xNC43NS1sdHNpKSB3
b3JrcyBmb3IgbWUsIHRoYXQgY29uZmlybXMgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHN3aXRj
aGVzIEkgYW0gdXNpbmcgd2hlbiB0ZXN0aW5nIHNpbmdsZS1saW5rIHNob3VsZCBiZSBva2F5LgoK
SWYsIGluIHRoZSBzaW5nbGUtbGluayB1c2UgY2FzZSBmcm9tIGRybS9kdS9sdmRzL2R1YWwtbGlu
aywgSSBjb25uZWN0IGx2ZHMxIHRvIHRoZSB2Z2EtZW5jb2RlciBpbiB0aGUgRFQgKGxpa2UgZm9y
IHRoZSBCU1AgRFQsIGJ1dCBJIGNhbiBzZWUgZnJvbSB0aGUgc2NoZW1hdGljcyB0aGF0IEFEVjcx
MjMgaXMgYWN0dWFsbHkgY29ubmVjdGVkIHRvIERVLCBsaWtlIHRoZSBjb25maWd1cmF0aW9uIGlu
IHRoZSBEVCB1cHN0cmVhbSksIHRoZW4gSERNSSB3b3JrcyBhcyBleHBlY3RlZCAobW9zdCBvZiB0
aGUgdGltZSkuIAoKSSB3b25kZXIgaWYgZm9yIHNvbWUgcmVhc29uIHdlIG1heSBlbmQgdXAgdXNp
bmcgdGhlIHdyb25nIGx2ZHMgZW5jb2RlciBhdCB0aW1lcywgb3Igbm8gZW5jb2RlciBhdCBhbGw/
CgpIYXZlIHlvdSBzZWVuIHRoaXMgcHJvYmxlbT8gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyBvYnZp
b3VzIGhlcmU/CgpUaGFua3MsCkZhYgoKPiAtLS0KPiAgLi4uL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5OTAtZWJpc3UuZHRzIHwgMjQgKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC1lYmlzdS5kdHMKPiBpbmRleCBjNzI3NzI1
ODk5NTMuLjk4OGQ4MjYwOWY0MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5OTAtZWJpc3UuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTkwLWViaXN1LmR0cwo+IEBAIC05MywxMSArOTMsMTggQEAKPiAKPiAgCQkJcG9y
dEAwIHsKPiAgCQkJCXJlZyA9IDwwPjsKPiAtCQkJCXRoYzYzbHZkMTAyNF9pbjogZW5kcG9pbnQg
ewo+ICsJCQkJdGhjNjNsdmQxMDI0X2luMDogZW5kcG9pbnQgewo+ICAJCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmbHZkczBfb3V0PjsKPiAgCQkJCX07Cj4gIAkJCX07Cj4gCj4gKwkJCXBvcnRAMSB7
Cj4gKwkJCQlyZWcgPSA8MT47Cj4gKwkJCQl0aGM2M2x2ZDEwMjRfaW4xOiBlbmRwb2ludCB7Cj4g
KwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+Owo+ICsJCQkJfTsKPiArCQkJfTsK
PiArCj4gIAkJCXBvcnRAMiB7Cj4gIAkJCQlyZWcgPSA8Mj47Cj4gIAkJCQl0aGM2M2x2ZDEwMjRf
b3V0OiBlbmRwb2ludCB7Cj4gQEAgLTQ4MiwyNCArNDg5LDI3IEBACj4gIAlwb3J0cyB7Cj4gIAkJ
cG9ydEAxIHsKPiAgCQkJbHZkczBfb3V0OiBlbmRwb2ludCB7Cj4gLQkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JnRoYzYzbHZkMTAyNF9pbj47Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRoYzYz
bHZkMTAyNF9pbjA+Owo+ICAJCQl9Owo+ICAJCX07Cj4gIAl9Owo+ICB9Owo+IAo+ICAmbHZkczEg
ewo+IC0JLyoKPiAtCSAqIEV2ZW4gdGhvdWdoIHRoZSBMVkRTMSBvdXRwdXQgaXMgbm90IGNvbm5l
Y3RlZCwgdGhlIGVuY29kZXIgbXVzdCBiZQo+IC0JICogZW5hYmxlZCB0byBzdXBwbHkgYSBwaXhl
bCBjbG9jayB0byB0aGUgRFUgZm9yIHRoZSBEUEFEIG91dHB1dCB3aGVuCj4gLQkgKiBMVkRTMCBp
cyBpbiB1c2UuCj4gLQkgKi8KPiAgCXN0YXR1cyA9ICJva2F5IjsKPiAKPiAgCWNsb2NrcyA9IDwm
Y3BnIENQR19NT0QgNzI3PiwKPiAgCQkgPCZ4MTNfY2xrPiwKPiAgCQkgPCZleHRhbF9jbGs+Owo+
ICAJY2xvY2stbmFtZXMgPSAiZmNrIiwgImRjbGtpbi4wIiwgImV4dGFsIjsKPiArCj4gKwlwb3J0
cyB7Cj4gKwkJcG9ydEAxIHsKPiArCQkJbHZkczFfb3V0OiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JnRoYzYzbHZkMTAyNF9pbjE+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9
Owo+ICB9Owo+IAo+ICAmb2hjaTAgewo+IC0tCj4gUmVnYXJkcywKPiAKPiBMYXVyZW50IFBpbmNo
YXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
