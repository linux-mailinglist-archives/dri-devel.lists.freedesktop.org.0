Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68A2038F1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D3F6E111;
	Mon, 22 Jun 2020 14:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF066E111
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 14:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDYhJWePYdKspUALCBtwtB6m1oj2TyCTbuTSXaQd//QzOv7gN6NAfpAeAOWsKDg51vq+zd++ND2RB1JQrPoDPXWmvqJXOhIzoh7rc73nVyFixcYi20elk7+c9nuhn78MkH+1kZmzh++p81JiquCWSimy8xQubE0AzC9ygdIxPu7f3YFoKJhw+WYdgmFhNPft7AxvgKEGjibTepBvGSlbeR6lKGru9N3dBPNN0m6W/7vF19AzBHzGJIA/9cjoCuTv4nR/oJDDyr1x8sw0mg1OvbGQqcr5uSUwCwafclv+aWJaCkfqeSMo/C93yfull3pMXupBpu4jDgn9KsUd1hp9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jSpkyxTHS8OHwOsNFHrzlGVsXOPSi7cD0JHjML/TII=;
 b=EnAXuq57qkO9bkq/3pCO32riDWRapvOmFtf/THDBCiTv50rSIWcyh6eC1F+poSQlvsiNHVEwZQcDmJXk7p+HaNkLahJYmywi4l72un6jmQUrltBXQd2Sl+yON5v7DTckQhnJvQkFq587gROZ83b4aJPclXsrpOg1GPYEkZGJ/zmX7wAIaUA8pvWWRP/GQ3PjXfVMPXRlHzSYhNF3hRzEFJNLBHtXua80piMZIiIq7nU9fK/5DuQ0daieuIT3eaQfov7svc8Q0av7cvQVgi+k0M7CU8cAvN2OUS79duR+T1f6JR9bWaN0VKZxH/o5GLUBz5Ud8jlI0cyRN++rXi3/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jSpkyxTHS8OHwOsNFHrzlGVsXOPSi7cD0JHjML/TII=;
 b=PrATdJWK/5+Oem5wjSGOg1GXW5TxnQ7Nq679/1zgVLAwb3iX+n65bo29DGCtKCntSJm5vR2qO8PzR5mkWkANFUrBcjnv23+eyRr9RZ3GJGRIJbfOGaO9/Sc3H93J3etviYtCQBFlBUAv86r/DDnKvlrFjiKG3q3ECLPL6uZ9Aho=
Received: from CY4PR02MB2790.namprd02.prod.outlook.com (2603:10b6:903:11c::8)
 by CY4PR02MB2550.namprd02.prod.outlook.com (2603:10b6:903:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 14:19:23 +0000
Received: from CY4PR02MB2790.namprd02.prod.outlook.com
 ([fe80::8478:4f5d:d9e9:8979]) by CY4PR02MB2790.namprd02.prod.outlook.com
 ([fe80::8478:4f5d:d9e9:8979%11]) with mapi id 15.20.3109.021; Mon, 22 Jun
 2020 14:19:22 +0000
From: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Thread-Topic: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Thread-Index: AQHWF1mglRaPzdyDqkWAZse0zugWnqiYWTEAgB5pO4CAC+/AsIAKBOUAgAMovACADED5AIAI7qBA
Date: Mon, 22 Jun 2020 14:19:22 +0000
Message-ID: <CY4PR02MB27908FE1FBB9ADA2F3395E16B1970@CY4PR02MB2790.namprd02.prod.outlook.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200504184348.GA3095@smtp.xilinx.com>
 <20200524030813.GF6026@pendragon.ideasonboard.com>
 <CY4PR02MB2790B791578160F257049FEAB18D0@CY4PR02MB2790.namprd02.prod.outlook.com>
 <20200607022518.GA7339@pendragon.ideasonboard.com>
 <CY4PR02MB27908C70E9D66DA91868FF35B1820@CY4PR02MB2790.namprd02.prod.outlook.com>
 <20200616214732.GH913@pendragon.ideasonboard.com>
In-Reply-To: <20200616214732.GH913@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=xilinx.com;
x-originating-ip: [106.212.238.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 47cf818c-5027-4583-8ac4-08d816b742d2
x-ms-traffictypediagnostic: CY4PR02MB2550:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR02MB2550D8F26D12086DF56378BEB1970@CY4PR02MB2550.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w8y5TVClBYM/qgsuCEU78YWhJ6ck1j+F428eoPjSMxAKZ+beJCBwsY8P4/cZ/qw8R3ANAaQpBR/KcHsaiJofHIkzUjl2PSzBvgqUgJoaM7wqhAdhhgR3GyDyD0FAP2Twqs6379IDMEMtygZSowFYvbEisDBpwbA8FAWT8KrYxVbjKlX1BaYiOiEJThyBhR0dVRPirzZxp1way+AOCN8NGTQHRPHV5xgkZYvSEz2+nUx29fmsgVqCiFlTJse0Ar8BfKs6K3/PbUhUnl2BcSNo4mD5QZMSEd3hW553GnQ42Mcs6P8akWTQsb52VnccULf5s0x8Sj3gWizgUAzsxeLRD11UbZjOFmTfI7JCiKu+WQuBvfx3N/x6cth7NGtXPUUuW1JDB6uEk/sLvpIJEmMaMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR02MB2790.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(376002)(366004)(346002)(39860400002)(186003)(26005)(33656002)(54906003)(966005)(66476007)(66556008)(64756008)(4326008)(66446008)(76116006)(2906002)(6506007)(53546011)(7696005)(66946007)(86362001)(5660300002)(83380400001)(316002)(478600001)(52536014)(55016002)(9686003)(8676002)(8936002)(71200400001)(107886003)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: L6NFCYeaRUUF5zmmAia4ca9VbsLXf5AafEp7XFqe7GkdIodSxnKARLQG/uOWPCnsnzlrQ+5NCCk65x4UxduB8+uZ03Nff3pdr718Pqyk0OE4xRySk1wX6EgyEnsDi3T7mJO7zxtI3gi5XuweAfKFvO4VWv0UNEUUHxhAfyjjIBnh7kH2QeKkH2FnqUQVxMcbOuO6OjEQI4fYEOSyMM0nc3Kw0qPq+/zLmEq6oTTeVlzPOBeVz8FUHYQEWbXdrMjxdVRZj985qAbCm9i739mFRJFwZ0KB55oLVme+UPOuYA4O0EMKGKPtpW1JcZrq8ubiSKYoRXmcQTShZ/XrImBctYS6UPPEGaLNcqYVXpYJYnblYtD1nuP7D6eKglWwaiWJxqclkoMyxw2Dt6PkQMN1eWx6v5zgHXcX+fLlQBIUeUskpWd7ifwECS68C/46/5wk7kWzDBlsfeD7VFZ8eHeeckXZ+gEo/XlEJopEIuRhPkJXmPxseMHi2/X5O4k3+Ls1
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cf818c-5027-4583-8ac4-08d816b742d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 14:19:22.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zR6OKagYE9Mezz44GOfBTqIn16GYybcEKCjNqQFGV3cZNLwTERipTslKSqGv1QmyRhcFAZ+U824zzcG4nrerg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2550
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
Cc: Sandip Kothari <sandipk@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vishal Sagar <vsagar@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgY29tbWVudC4NCg0KPi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+RnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPg0KPlNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNywgMjAyMCAzOjE4IEFN
DQo+VG86IFZlbmthdGVzaHdhciBSYW8gR2FubmF2YXJhcHUgPFZHQU5OQVZBQHhpbGlueC5jb20+
DQo+Q2M6IEh5dW4gS3dvbiA8aHl1bmtAeGlsaW54LmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7DQo+YWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBTYW5kaXAgS290aGFyaQ0KPjxzYW5kaXBrQHhpbGlueC5j
b20+OyBWaXNoYWwgU2FnYXIgPHZzYWdhckB4aWxpbnguY29tPg0KPlN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDIvMl0gZHJtOiB4bG54OiBkcml2ZXIgZm9yIFhpbGlueCBEU0kgVFggU3Vic3lzdGVt
DQo+DQo+SGkgR1ZSYW8sDQo+DQo+U29ycnkgZm9yIHRoZSBkZWxheWVkIHJlcGx5Lg0KPg0KPk9u
IFR1ZSwgSnVuIDA5LCAyMDIwIGF0IDAyOjQ4OjI1QU0gKzAwMDAsIFZlbmthdGVzaHdhciBSYW8g
R2FubmF2YXJhcHUNCj53cm90ZToNCj4+IEhpIExhdXJlbnQsDQo+Pg0KPj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3Lg0KPj4gUGxlYXNlIHNlZSBteSBjb21tZW50cyBhYm91dCBELVBIWSBhbmQgYnJp
ZGdlIGRyaXZlciBpbXBsZW1lbnRhdGlvbi4NCj4+DQo+PiBPbiBTdW5kYXksIEp1bmUgNywgMjAy
MCA3OjU1IEFNLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPj4gPiBPbiBTdW4sIE1heSAzMSwg
MjAyMCBhdCAwNTo0MTo1MFBNICswMDAwLCBWZW5rYXRlc2h3YXIgUmFvDQo+R2FubmF2YXJhcHUg
d3JvdGU6DQo+PiA+PiBPbiBTdW5kYXksIE1heSAyNCwgMjAyMCA4OjM4IEFNLCBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOg0KPj4gPj4+IE9uIE1vbiwgTWF5IDA0LCAyMDIwIGF0IDExOjQzOjQ4QU0g
LTA3MDAsIEh5dW4gS3dvbiB3cm90ZToNCj4+ID4+Pj4gT24gTW9uLCAyMDIwLTA0LTIwIGF0IDE0
OjIwOjU2IC0wNzAwLCBWZW5rYXRlc2h3YXIgUmFvIEdhbm5hdmFyYXB1DQo+d3JvdGU6DQo+PiA+
Pj4+PiBUaGUgWGlsaW54IE1JUEkgRFNJIFR4IFN1YnN5c3RlbSBzb2Z0IElQIGlzIHVzZWQgdG8g
ZGlzcGxheQ0KPj4gPj4+Pj4gdmlkZW8gZGF0YSBmcm9tIEFYSS00IHN0cmVhbSBpbnRlcmZhY2Uu
DQo+PiA+Pj4+Pg0KPj4gPj4+Pj4gSXQgc3VwcG9ydHMgdXB0byA0IGxhbmVzLCBvcHRpb25hbCBy
ZWdpc3RlciBpbnRlcmZhY2UgZm9yIHRoZQ0KPj4gPj4+Pj4gRFBIWSwNCj4+ID4+Pj4NCj4+ID4+
Pj4gSSBkb24ndCBzZWUgdGhlIHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgZHBoeSBzdXBwb3J0Lg0K
Pj4gPj4+DQo+PiA+Pj4gSSB0aGluayB0aGUgRC1QSFkgc2hvdWxkIGJlIHN1cHBvcnRlZCB0aHJv
dWdoIGEgUEhZIGRyaXZlciwgYXMgaXQNCj4+ID4+PiBzZWVtcyB0byBiZSBzaGFyZWQgYmV0d2Vl
biBkaWZmZXJlbnQgc3Vic3lzdGVtcy4NCj4+ID4+DQo+PiA+PiBJUCBoYXMgdGhlIHByb3Zpc2lv
biB0byByZWFkIERQSFkgcmVnaXN0ZXIgZm9yIGRlYnVnIHB1cnBvc2Ugb25seS4NCj4+ID4+IE5v
IHByb2dyYW1taW5nIG9mIERQSFkgaXMgcmVxdWlyZWQgaW4gc3Vic3lzdGVtLg0KPj4gPg0KPj4g
PiBEbyB5b3Uga25vdyBpZiB0aGlzIGlzIHRoZSBzYW1lIEQtUEhZIGFzIHVzZWQgaW4gdGhlIENT
STItUlggc3Vic3lzdGVtID8NCj4+DQo+PiBTYW1lIEQtUEhZIGNvcmUgaGFzIGJlZW4gdXNlZCBp
biBNSVBJIENTSTIgUlhTUywgYnV0IHdpdGggZGlmZmVyZW50DQo+Y29uZmlndXJhdGlvbi4NCj4+
DQo+PiA+Pj4+PiBtdWx0aXBsZSBSR0IgY29sb3IgZm9ybWF0cywgY29tbWFuZCBtb2RlIGFuZCB2
aWRlbyBtb2RlLg0KPj4gPj4+Pj4gVGhpcyBpcyBhIE1JUEktRFNJIGhvc3QgZHJpdmVyIGFuZCBw
cm92aWRlcyBEU0kgYnVzIGZvciBwYW5lbHMuDQo+PiA+Pj4+PiBUaGlzIGRyaXZlciBhbHNvIGhl
bHBzIHRvIGNvbW11bmljYXRlIHdpdGggaXRzIHBhbmVsIHVzaW5nIHBhbmVsDQo+PiA+Pj4+PiBm
cmFtZXdvcmsuDQo+PiA+Pj4+Pg0KPj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogVmVua2F0ZXNod2Fy
IFJhbyBHYW5uYXZhcmFwdQ0KPj4gPj4+Pj4gPHZlbmthdGVzaHdhci5yYW8uZ2FubmF2YXJhcHVA
eGlsaW54LmNvbT4NCj4+ID4+Pj4+IC0tLQ0KPj4gPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS94bG54
L0tjb25maWcgICAgfCAgMTEgKw0KPj4gPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS94bG54L01ha2Vm
aWxlICAgfCAgIDIgKw0KPj4gPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS94bG54L3hsbnhfZHNpLmMg
fCA3NTUNCj4+ID4+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4+ID4+Pg0KPj4gPj4+IERhbmllbCBWZXR0ZXIgaGFzIHJlY2VudGx5IGV4cHJlc3NlZCBoaXMg
b3BpaW9uIHRoYXQgYnJpZGdlDQo+PiA+Pj4gZHJpdmVycyBzaG91bGQgZ28gdG8gZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS8uIEl0IHdvdWxkIHRoZW4gYmUNCj4+ID4+PiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3hsbngvLiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBteXNlbGYuDQo+Pg0K
Pj4gVGhlIERTSS1UWCBzdWJzeXN0ZW0gSVAgYmxvY2sgaXMgbm90IGEgYnJpZGdlIGRyaXZlci4N
Cj4+IFRoZSBEU0ktVFggc3Vic3lzdGVtIElQIGJsb2NrIGl0c2VsZiBjb250YWlucyBhbGwgdGhl
IGRybQ0KPj4gZW5jb2Rlci9jb25uZWN0b3IgZnVuY3Rpb25hbGl0eSBhbmQgaXTigJlzIHRoZSBs
YXN0IG5vZGUgaW4gZGlzcGxheSBwaXBlIGxpbmUuDQo+DQo+VGhlIERTSS1UWCBzdWJzeXN0ZW0g
SVAgYmxvY2sgaXMgaW5kZWVkIGFuIGVuY29kZXIgZnJvbSBhIGhhcmR3YXJlIHBvaW50IG9mDQo+
dmlldywgYnV0IGl0J3Mgbm90IG5lY2Vzc2FyaWx5IHRoZSBsYXN0IGJsb2NrIGluIHRoZSBkaXNw
bGF5IHBpcGVsaW5lLiBXaGlsZSB0aGUNCj5vdXRwdXQgb2YgdGhlIElQIGNvcmUgZ29lcyBvZiB0
aGUgdGhlIFNvQywgdHQgd291bGQgYmUgZW50aXJlbHkgZmVhc2libGUgdG8NCj5jb25uZWN0IGl0
IHRvIGEgRFAgdG8gSERNSSBicmlkZ2Ugb24gdGhlIGJvYXJkLCBzdWNoIGFzIHRoZSBBTlg3NzM3
IChbMV0pIGZvcg0KPmluc3RhbmNlLiBUaGlzIGlzIHdoeSB3ZSdyZSBwdXNoaW5nIGZvciBhbGwg
ZW5jb2RlciAoZnJvbSBhIGhhcmR3YXJlIHBvaW50IG9mDQo+dmlldykgZHJpdmVycyB0byBiZSBp
bXBsZW1lbnRlZCBhcyBEUk0gYnJpZGdlLCBpbiBvcmRlciB0byBtYWtlIHRoZW0gdXNhYmxlDQo+
aW4gZGlmZmVyZW50IGRpc3BsYXkgcGlwZWxpbmVzLCB3aXRob3V0IGhhcmRjb2RpbmcgdGhlIGFz
c3VtcHRpb24gdGhleSB3aWxsIGJlDQo+dGhlIGxhc3QgZW5jb2RlciBpbiB0aGUgcGlwZWxpbmUu
DQoNClRoYW5rcyBmb3IgdGhlIGRldGFpbHMuDQpJIGNhbiB1bmRlcnN0YW5kIGl0IGFzIFNvQyBy
ZXF1aXJlbWVudCB3aGVyZSBjcnRjIGlzIGZpeGVkLCBidXQgYXMgYSBGUEdBIHByb2R1Y3QNCmVu
Y29kZXIgZHJpdmVyIHNob3VsZCB3b3JrIHdpdGggYW55IG9mIGNydGMgZHJpdmVyLiAgQW5kIEkg
c3RpbGwgbm90IHNlZSBicmlkZ2UgaW1wbGVtZW50YXRpb24gYXMgaGFyZCByZXF1aXJlbWVudC4N
CkNvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aGF0IHByb2JsZW0gd2UgZmFjZSwgaWYgaW1wbGVt
ZW50ZWQgYXMgZW5jb2RlciBkcml2ZXIuDQo+DQo+PiBJIGRpZG4ndCBzZWUgYW55IGhhcmQNCj4+
IHJlcXVpcmVtZW50IHRvIGltcGxlbWVudCBpdCBpbnRvIGJyaWRnZSBkcml2ZXIgYW5kIEkgc2Vl
IG1hbnkgRFNJDQo+PiBkcml2ZXJzIGFyZSBpbXBsZW1lbnRlZCBhcyBlbmNvZGVyIGRyaXZlcnMu
DQo+PiBYaWxpbnggUEwgRFJNIGVuY29kZXIgZHJpdmVycyBhcmUgaW1wbGVtZW50ZWQgaW4gbW9k
dWxhciBhcHByb2FjaCBzbw0KPj4gdGhhdCB0aGV5IGNhbiB3b3JrIHdpdGggYW55IENSVEMgZHJp
dmVyIHdoaWNoIGhhbmRsZXMgdGhlIERNQSBjYWxscy4NCj4+IFNvLCBhdCB0aGlzIHN0YWdlIHdl
IHdhbnQgdG8gdXBzdHJlYW0gYXMgZW5jb2RlciBkcml2ZXIgb25seS4NCj4+DQo+PiA+Pj4+PiAg
MyBmaWxlcyBjaGFuZ2VkLCA3NjggaW5zZXJ0aW9ucygrKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
PiA+Pj4+PiBkcml2ZXJzL2dwdS9kcm0veGxueC94bG54X2RzaS5jDQo+DQo+WzFdIGh0dHBzOi8v
d3d3LmFuYWxvZ2l4LmNvbS9lbi9wcm9kdWN0cy9jb252ZXJ0ZXJzYnJpZGdlcy9hbng3NzM3DQo+
DQo+LS0NCj5SZWdhcmRzLA0KPg0KPkxhdXJlbnQgUGluY2hhcnQNCg0KUmVnYXJkcywNCkdWUmFv
DQogDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
