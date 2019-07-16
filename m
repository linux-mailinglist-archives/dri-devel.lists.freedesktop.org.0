Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C726A021
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1689C16;
	Tue, 16 Jul 2019 01:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B8E89C16;
 Tue, 16 Jul 2019 01:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdI6igq3l0lpcLKOFNVU7COigYP4MC6Q6cRiAA29sh1D5hPDf6HjxN9BeiXYEXj8oWPAsPqgI8XDi8fYaG6BMtQX0jYK8W0nuQKkRIrdO6ccrt8Ofb+yWTeIPIALwvJNvU98yOy83q7ppif3zPR4OlWtbkr12am1yrahUL9RLD9WZF6LyzC2zkSpOIshEBqK5p33y2yqAekBKB472Hv7Q2cGivIsd8FyWDb+sGvDQEpeJ7WpZE/BHO/x/A5ejd8C+WX4ql759Ykkz6U5Ht3KqMEJRT5FhMwPZ2ReCJ0p7mLU6c3QqOGYDHQqXYVEgbUDWikFkybvQJl1ARiJhuxtyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ponYNR/SjVfpHOyAlaLaBWp3UZAlujOL61NwruHeF4Y=;
 b=jvmm8HOArWk2tYBgaF58Nf78bJYvUkk93uts8HfSKcsDtKQ2Ok669mY20gUGrPJuZmDEAgzg5jva7D2aosQosvryFcEXtLWtXob+ETyyqKKaLho8qWeJTZ8B//hwrOsdYIwRvLujH69GFLTUFj3DEFhbseXJhzB1JadcSIkiofkyo2er9rCji6IZqDpy8M8+rDBPPraaZKF7/4QLyHYv6PHRogtmBDm0SBwqMgmALbFK2NJCy8Vg3s93uMVVZwV1gztss3WnMkTFMTqT9TIvJ9s9JQzPJ2GwUJy0LarpLKNT90xwflaDyf+N04oOJbnSzB4mdJ4gLYJer3WHaJ62Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3726.namprd12.prod.outlook.com (10.255.236.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 01:00:02 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 01:00:02 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH 6/7] drm/amd/powerplay: Use proper enums in
 vega20_print_clk_levels
Thread-Topic: [PATCH 6/7] drm/amd/powerplay: Use proper enums in
 vega20_print_clk_levels
Thread-Index: AQHVMiy+c88EcKEMTUmwHunc6S+NV6bLeiKAgABoggCAAJxnMA==
Date: Tue, 16 Jul 2019 01:00:02 +0000
Message-ID: <MN2PR12MB3344EFEEA62F1FC0CE238F2CE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-7-natechancellor@gmail.com>
 <CAK8P3a1e4xKTZc1Fcd9KLwaGG_wpcAnSNu7mrB6zw+aBJ0e0CA@mail.gmail.com>
 <20190715153932.GA41785@archlinux-threadripper>
In-Reply-To: <20190715153932.GA41785@archlinux-threadripper>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94e8122c-e187-4f62-40f1-08d70988eedf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3726; 
x-ms-traffictypediagnostic: MN2PR12MB3726:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB37264272F71652FCB599E40FE4CE0@MN2PR12MB3726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:215;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(13464003)(5660300002)(256004)(52536014)(33656002)(3846002)(14444005)(4326008)(6116002)(53936002)(76176011)(6436002)(55016002)(229853002)(9686003)(186003)(26005)(53546011)(446003)(11346002)(6506007)(6306002)(99286004)(476003)(6246003)(102836004)(2906002)(7696005)(71190400001)(305945005)(71200400001)(486006)(7736002)(74316002)(25786009)(81156014)(81166006)(966005)(86362001)(478600001)(54906003)(8676002)(110136005)(68736007)(66066001)(8936002)(316002)(14454004)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3726;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: paO9GgWtdmuPV4MKvAqjo4zGI2CG8PHjvONcqO0S0Z9JDv9It+HWyBhgCJclbhPoSRNAKFd+fv6XVQB7kuaFRC1oHiDC9lDIXc5xOq70HEV5Z65IFkyBFcxKTRPSmSKeAuBUbE0LELJ10BXxpD98kdHsFSJY5iWUn8Df3C8SZV+uRRT9yaHvp3MDIV0Hnfk3xv+Lvs8ejSvwb9JitOuysMjZuCIkUUoPC5A/E9mvi2ydViI9y0xg4SZYZl7dL05iUmMSpIMfaut90nVHhs94bCD/FNlJLSSnhOcWl1/OmdLbDOjvZospQkg1Sr6eCg4TSMweqhory1zt+AILQtKu/4dkjQWCuNLtSFOL1XnlTBtp7gj6DVxk44lgNGDc2kodkUyrK7+C++fwHb1GDHDoqGBFe+mwkBVKBoV9RUErXyQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e8122c-e187-4f62-40f1-08d70988eedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 01:00:02.1566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ponYNR/SjVfpHOyAlaLaBWp3UZAlujOL61NwruHeF4Y=;
 b=lh8huOGOAZxTqYwMCVKUfsoriPFnCY1et7IBz499+I0BeVrtH1u1fxoEN+81ZrX+3+BimqgNVBN3wxB1GZiTXnAiAa8+2cMLMjz/fyi39xcE8SupbHH2AaY1SL3ji+48w3zoPNrUt29kAMlGlIoi+ZG0emQ8BtK0ADVBuxEmm2c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzISAgVGhpcyBpcyByZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KClJlZ2FyZHMKRXZhbgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogTmF0
aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KPiBTZW50OiBNb25kYXks
IEp1bHkgMTUsIDIwMTkgMTE6NDAgUE0KPiBUbzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
S29lbmlnLCBDaHJpc3RpYW4KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2
aWQoQ2h1bk1pbmcpCj4gPERhdmlkMS5aaG91QGFtZC5jb20+OyBXZW50bGFuZCwgSGFycnkgPEhh
cnJ5LldlbnRsYW5kQGFtZC5jb20+Owo+IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBh
bWQuY29tPjsgUmV4IFpodSA8cmV4LnpodUBhbWQuY29tPjsKPiBRdWFuLCBFdmFuIDxFdmFuLlF1
YW5AYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbAo+IFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgYW1kLWdmeCBsaXN0IDxhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz47IGRyaS0KPiBkZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LQo+IGtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+OyBjbGFuZy1idWlsdC1saW51eCA8Y2xhbmctYnVpbHQtCj4gbGludXhAZ29vZ2xlZ3Jv
dXBzLmNvbT47IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggNi83XSBkcm0vYW1kL3Bvd2VycGxheTogVXNlIHByb3BlciBlbnVtcyBp
bgo+IHZlZ2EyMF9wcmludF9jbGtfbGV2ZWxzCj4gCj4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQg
MTE6MjU6MjlBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IE9uIFRodSwgSnVsIDQs
IDIwMTkgYXQgNzo1MiBBTSBOYXRoYW4gQ2hhbmNlbGxvcgo+ID4gPG5hdGVjaGFuY2VsbG9yQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IGNsYW5nIHdhcm5zOgo+ID4gPgo+ID4gPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOjk5NTozOToK
PiB3YXJuaW5nOgo+ID4gPiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlw
ZSAnUFBDTEtfZScgdG8gZGlmZmVyZW50Cj4gPiA+IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gc211
X2Nsa190eXBlJyBbLVdlbnVtLWNvbnZlcnNpb25dCj4gPiA+ICAgICAgICAgICAgICAgICByZXQg
PSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBQUENMS19TT0NDTEssICZub3cpOwo+ID4g
Pgo+ID4gPiB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+
Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0
LmM6MTAxNjozOToKPiB3YXJuaW5nOgo+ID4gPiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51
bWVyYXRpb24gdHlwZSAnUFBDTEtfZScgdG8gZGlmZmVyZW50Cj4gPiA+IGVudW1lcmF0aW9uIHR5
cGUgJ2VudW0gc211X2Nsa190eXBlJyBbLVdlbnVtLWNvbnZlcnNpb25dCj4gPiA+ICAgICAgICAg
ICAgICAgICByZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBQUENMS19GQ0xLLCAm
bm93KTsKPiA+ID4KPiA+ID4gfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+
fn5+fn5+fn4KPiA+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3Zl
Z2EyMF9wcHQuYzoxMDMxOjM5Ogo+IHdhcm5pbmc6Cj4gPiA+IGltcGxpY2l0IGNvbnZlcnNpb24g
ZnJvbSBlbnVtZXJhdGlvbiB0eXBlICdQUENMS19lJyB0byBkaWZmZXJlbnQKPiA+ID4gZW51bWVy
YXRpb24gdHlwZSAnZW51bSBzbXVfY2xrX3R5cGUnIFstV2VudW0tY29udmVyc2lvbl0KPiA+ID4g
ICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xL
X0RDRUZDTEssICZub3cpOwo+ID4gPgo+ID4gPiB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5efn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gPgo+ID4gPiBUaGUgdmFsdWVzIGFyZSBtYXBwZWQg
b25lIHRvIG9uZSBpbiB2ZWdhMjBfZ2V0X3NtdV9jbGtfaW5kZXggc28ganVzdAo+ID4gPiB1c2Ug
dGhlIHByb3BlciBlbnVtcyBoZXJlLgo+ID4gPgo+ID4gPiBGaXhlczogMDk2NzYxMDE0MjI3ICgi
ZHJtL2FtZC9wb3dlcnBsYXk6IHN1cHBvcnQgc3lzZnMgdG8gZ2V0Cj4gPiA+IHNvY2NsaywgZmNs
aywgZGNlZmNsayIpCj4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGlu
dXgvbGludXgvaXNzdWVzLzU4Nwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxv
ciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+Cj4gPiBBZGRpbmcgS2V2
aW4gV2FuZyBmb3IgZnVydGhlciByZXZpZXcsIGFzIGhlIHNlbnQgYSByZWxhdGVkIHBhdGNoIGlu
Cj4gPiBkMzY4OTMzNjJkMjIgKCJkcm0vYW1kL3Bvd2VycGxheTogZml4IHNtdSBjbG9jayB0eXBl
IGNoYW5nZSBtaXNzCj4gPiBlcnJvciIpCj4gPgo+ID4gSSBhc3N1bWUgdGhpcyBvbmUgaXMgc3Rp
bGwgcmVxdWlyZWQgYXMgaXQgdHJpZ2dlcnMgdGhlIHNhbWUgd2FybmluZy4KPiA+IEtldmluLCBj
YW4geW91IGhhdmUgYSBsb29rPwo+ID4KPiA+ICAgICAgIEFybmQKPiAKPiBJbmRlZWQsIHRoaXMg
b25lIGFuZCBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy81
ODYKPiBhcmUgc3RpbGwgb3V0c3RhbmRpbmcuCj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzMxNTU4MS8KPiAKPiBDaGVlcnMsCj4gTmF0aGFuCj4gCj4gPgo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIHwgNiArKystLS0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0
LmMKPiA+ID4gaW5kZXggMGYxNGZlMTRlY2Q4Li5lNjJkZDY5MTliMjQgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiA+ID4gQEAgLTk5
Miw3ICs5OTIsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdAo+
IHNtdV9jb250ZXh0ICpzbXUsCj4gPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4KPiA+
ID4gICAgICAgICBjYXNlIFNNVV9TT0NDTEs6Cj4gPiA+IC0gICAgICAgICAgICAgICByZXQgPSBz
bXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBQUENMS19TT0NDTEssICZub3cpOwo+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgU01VX1NP
Q0NMSywKPiA+ID4gKyAmbm93KTsKPiA+ID4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJBdHRlbXB0IHRvIGdldCBjdXJyZW50
IHNvY2NsayBGYWlsZWQhIik7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPiA+IEBAIC0xMDEzLDcgKzEwMTMsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9wcmludF9j
bGtfbGV2ZWxzKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4gPiA+ICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ID4KPiA+ID4gICAgICAgICBjYXNlIFNNVV9GQ0xLOgo+ID4gPiAtICAgICAg
ICAgICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgUFBDTEtfRkNMSywg
Jm5vdyk7Cj4gPiA+ICsgICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2Zy
ZXEoc211LCBTTVVfRkNMSywgJm5vdyk7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAocmV0KSB7
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2VycigiQXR0ZW1wdCB0byBnZXQgY3Vy
cmVudCBmY2xrIEZhaWxlZCEiKTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ID4gQEAgLTEwMjgsNyArMTAyOCw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3ByaW50
X2Nsa19sZXZlbHMoc3RydWN0Cj4gc211X2NvbnRleHQgKnNtdSwKPiA+ID4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4gPgo+ID4gPiAgICAgICAgIGNhc2UgU01VX0RDRUZDTEs6Cj4gPiA+IC0g
ICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBQUENMS19E
Q0VGQ0xLLCAmbm93KTsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVu
dF9jbGtfZnJlcShzbXUsIFNNVV9EQ0VGQ0xLLAo+ID4gPiArICZub3cpOwo+ID4gPiAgICAgICAg
ICAgICAgICAgaWYgKHJldCkgewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIo
IkF0dGVtcHQgdG8gZ2V0IGN1cnJlbnQgZGNlZmNsayBGYWlsZWQhIik7Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
