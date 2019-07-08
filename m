Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B876318D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B068189DB4;
	Tue,  9 Jul 2019 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA0089E0D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 14:09:43 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3311.eurprd05.prod.outlook.com (10.170.238.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 14:09:40 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 14:09:40 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwCAAAGdAIAGcL0AgAD1qgA=
Date: Mon, 8 Jul 2019 14:09:40 +0000
Message-ID: <20190708140936.GD23966@mellanox.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
 <20190708093020.676f5b3f@canb.auug.org.au>
In-Reply-To: <20190708093020.676f5b3f@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0028.prod.exchangelabs.com
 (2603:10b6:207:18::41) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d33c027-b8b8-4829-58f3-08d703adeb28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3311; 
x-ms-traffictypediagnostic: VI1PR05MB3311:
x-microsoft-antispam-prvs: <VI1PR05MB33112416FE3452DBE336BC08CFF60@VI1PR05MB3311.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(53754006)(189003)(199004)(229853002)(68736007)(99286004)(305945005)(6116002)(33656002)(316002)(54906003)(386003)(3846002)(11346002)(4326008)(6916009)(1076003)(6436002)(6486002)(53936002)(102836004)(446003)(7736002)(14444005)(256004)(81156014)(476003)(14454004)(64756008)(478600001)(8676002)(66476007)(86362001)(6246003)(26005)(66946007)(81166006)(5660300002)(66556008)(73956011)(186003)(2616005)(66446008)(53546011)(486006)(66066001)(52116002)(25786009)(6506007)(36756003)(76176011)(71190400001)(6512007)(8936002)(2906002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3311;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: My4MtGaj6SQDJGP75ODjDhnPRryt3VphHK9qrPje6tzohAhhucXHsgvmUuXz381ezjD0eGJipwZcsHnWJ7DZWz7Wt1LKgFw+wr0v3MqsXEji/0HeWopoDZ0hz4xGrPdIqhDldt4HmKtdlchzv+v+n1/qtdTCTxuVW7viM2O7D86+W6A5jTYwp7kKA4sg6YHo3ls5OvCdqHuxvx1Gr764cVUhu5M8F9QZ4bOzcJHChQluf3nmq9WHiF77FIBZK88GTg16ssW45xKMw5R/hIdfAhH3O2lXSlJdMHH9nPD9Oy7yLDyfDAwNuF28bwSJUv2/EPGtq4/U7xL6V10LgLaLmaaYCGFbhZPHx7vIQAJKoN24a2a3OXOJ0ZokoMq1lvpCm4tiH54/OCfn7Gb8dXQSVu+v9KEHHWBaVJ4ovIPKrC0=
Content-ID: <913C3D0530EA7F4B93FADA01B3279D28@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d33c027-b8b8-4829-58f3-08d703adeb28
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 14:09:40.7888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3311
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9SnTdGJOzPh7PEhqpPLkWfo+Z7SasLHzoEWCLSlDVw=;
 b=BNXst4q3wUJQ7fT6nZR3ltTJdRrhzIuLGZTcemoyOsqqOsacTVtmJ7yTQpwRw9loeaZVYADq1cp7lw/EtDIEr5PGSv/n0e6fvSsJEdc/EaQrv/6hpV20StKRybnZGhioHr2Fr+cJ5qqzIf3zN0utuwb3mVMinZlgEu7u9fSHcS4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDk6MzA6MjBBTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gT24gV2VkLCAzIEp1bCAyMDE5IDE3OjA5OjE2IC0wNDAw
IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBX
ZWQsIEp1bCAzLCAyMDE5IGF0IDU6MDMgUE0gS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gMjAxOS0wNy0wMyAxMDoxMCBhLm0uLCBK
YXNvbiBHdW50aG9ycGUgd3JvdGU6ICAKPiA+ID4gPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAw
MTo1NTowOEFNICswMDAwLCBLdWVobGluZywgRmVsaXggd3JvdGU6ICAKPiA+ID4gPj4gRnJvbTog
UGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4gPiA+ID4+Cj4gPiA+ID4+IEluIG9y
ZGVyIHRvIHBhc3MgbWlycm9yIGluc3RlYWQgb2YgbW0gdG8gaG1tX3JhbmdlX3JlZ2lzdGVyLCB3
ZSBuZWVkCj4gPiA+ID4+IHBhc3MgYm8gaW5zdGVhZCBvZiB0dG0gdG8gYW1kZ3B1X3R0bV90dF9n
ZXRfdXNlcl9wYWdlcyBiZWNhdXNlIG1pcnJvcgo+ID4gPiA+PiBpcyBwYXJ0IG9mIGFtZGdwdV9t
biBzdHJ1Y3R1cmUsIHdoaWNoIGlzIGFjY2Vzc2libGUgZnJvbSBiby4KPiA+ID4gPj4KPiA+ID4g
Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4gPiA+
ID4+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4K
PiA+ID4gPj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+Cj4gPiA+ID4+IENDOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5h
dT4KPiA+ID4gPj4gQ0M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+ID4g
Pj4gQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gPiA+PiBDQzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gPiA+PiAgIGRyaXZlcnMvZ3B1
L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiA+ID4gPj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCAgNSArKy0t
LQo+ID4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgICAg
ICAgICB8ICAyICstCj4gPiA+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jICAgICAgICAgIHwgIDMgKy0tCj4gPiA+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X21uLmMgICAgICAgICAgIHwgIDggKysrKysrKysKPiA+ID4gPj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCAgICAgICAgICAgfCAgNSArKysrKwo+
ID4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgICAg
ICB8IDEyICsrKysrKysrKystLQo+ID4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uaCAgICAgICAgICB8ICA1ICsrKy0tCj4gPiA+ID4+ICAgOCBmaWxlcyBjaGFu
Z2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkgIAo+ID4gPiA+IFRoaXMgaXMg
dG9vIGJpZyB0byB1c2UgYXMgYSBjb25mbGljdCByZXNvbHV0aW9uLCB3aGF0IHlvdSBjb3VsZCBk
byBpcwo+ID4gPiA+IGFwcGx5IHRoZSBtYWpvcml0eSBvZiB0aGUgcGF0Y2ggb24gdG9wIG9mIHlv
dXIgdHJlZSBhcy1pcyAoaWUga2VlcAo+ID4gPiA+IHVzaW5nIHRoZSBvbGQgaG1tX3JhbmdlX3Jl
Z2lzdGVyKSwgdGhlbiB0aGUgY29uZmxpY3QgcmVzb2x1dGlvbiBmb3IKPiA+ID4gPiB0aGUgdXBk
YXRlZCBBTUQgR1BVIHRyZWUgY2FuIGJlIGEgc2ltcGxlIG9uZSBsaW5lIGNoYW5nZToKPiA+ID4g
Pgo+ID4gPiA+ICAgLSAgIGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbW0sIHN0YXJ0LAo+ID4g
PiA+ICAgKyAgIGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLCBzdGFydCwKPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKyB0dG0tPm51bV9wYWdlcyAqIFBBR0Vf
U0laRSwgUEFHRV9TSElGVCk7Cj4gPiA+ID4KPiA+ID4gPiBXaGljaCBpcyB0cml2aWFsIGZvciBl
dmVyb25lIHRvIGRlYWwgd2l0aCwgYW5kIHNvbHZlcyB0aGUgcHJvYmxlbS4gIAo+ID4gPgo+ID4g
PiBHb29kIGlkZWEuCj4gCj4gV2l0aCB0aGUgY2hhbmdlcyBhZGRlZCB0byB0aGUgYW1kZ3B1IHRy
ZWUgb3ZlciB0aGUgd2Vla2VuZCwgSSB3aWxsCj4gYXBwbHkgdGhlIGZvbGxvd2luZyBtZXJnZSBm
aXggcGF0Y2ggdG8gdGhlIGhtbSBtZXJnZSB0b2RheToKPiAKPiBGcm9tOiBQaGlsaXAgWWFuZyA8
UGhpbGlwLllhbmdAYW1kLmNvbT4KPiBTaWJqZWN0OiBkcm0vYW1kZ3B1OiBhZG9wdCB0byBobW1f
cmFuZ2VfcmVnaXN0ZXIgQVBJIGNoYW5nZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90
aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMKPiBAQCAtNzgzLDcgKzc4Myw3IEBAIGludCBhbWRncHVfdHRtX3R0X2dl
dF91c2VyX3BhZ2VzKHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0IHBhZ2UgKipwYWdlcykKPiAg
CQkJCTAgOiByYW5nZS0+ZmxhZ3NbSE1NX1BGTl9XUklURV07Cj4gIAlyYW5nZS0+cGZuX2ZsYWdz
X21hc2sgPSAwOwo+ICAJcmFuZ2UtPnBmbnMgPSBwZm5zOwo+IC0JaG1tX3JhbmdlX3JlZ2lzdGVy
KHJhbmdlLCBtbSwgc3RhcnQsCj4gKwlobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwg
c3RhcnQsCj4gIAkJCSAgIHN0YXJ0ICsgdHRtLT5udW1fcGFnZXMgKiBQQUdFX1NJWkUsIFBBR0Vf
U0hJRlQpOwo+ICAKPiAgcmV0cnk6Cj4gCj4gQW5kIHNvbWVvbmUganVzdCBuZWVkcyB0byBtYWtl
IHN1cmUgTGludXMgaXMgYXdhcmUgb2YgdGhpcyBuZWVkZWQgbWVyZ2UgZml4LgoKR3JlYXQsIHRo
YW5rcyBldmVyeW9uZQoKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
