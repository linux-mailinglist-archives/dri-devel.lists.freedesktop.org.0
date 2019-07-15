Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283A6A058
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5CC6E06F;
	Tue, 16 Jul 2019 01:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140088.outbound.protection.outlook.com [40.107.14.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205BC89A34
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATJGn5rycD0k8Lm8+q4lAbvA0JyCH9CGM5K52guYMxmU10QgzYfY44bEOJsTZ8kIzzYKVdKjQIfupJ9fpMQOY/tg0aW2CjDsqWKm+Vbg8HtyVbknXJstUHDvExkhUhMiBD7ipmVwuZ7cTY09HPmx/O0Pk89dI1+frB2xBYydR48t978nKm8k8EEr19tZtFTJenVZXZ60NcEna3ILMY7MEWX8M1ZlqfO1CuJb8cG3ClUmsygVs1jpXmBIyRw7Gp4dttcvlN907WKO3KUn8q/AT4wlvxjXoI6JNAqlDeE0YFSzAFSpeM7ItOl7/Gj5QmBK1ucFITXNMybdiu1B/PICng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZmk1uxAVo6FKfrBs6fhFNW30XPmnCjwlpAPTH8nAxk=;
 b=FubVpF6glmrt9qF1D0nHFg6VJ7+HbVNonRCktX7vtkrlBFTqsmpVgd+6i8+n97Tr5Yf6n42RyE+cXBDMyOGMBUU4rpzTIK7W3SQ8isGz+WF/ugEOPp5QwvR9Qyf2bYqwqhfU14nmTfA7n8xTdmBZm1HGN1+M7TRFWTbm3zWIroD9dyVwTbpoGJEgCEHcQ/cQehwtF9zG7RbpXvMKkhVgukEtIuLcU6eT+jT7HVtvurfiaIWoExVFarpmkgB5OgfC2muaVkGdgU32dmaZRmVkWQAHAJGCT0bownbITgKUK2eK644ZN//HpJujtKx1FZzLPsKUNN4EEAtg4A76JYUFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4656.eurprd05.prod.outlook.com (20.176.3.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 15:04:06 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 15:04:06 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: DRM pull for v5.3-rc1
Thread-Topic: DRM pull for v5.3-rc1
Thread-Index: AQHVOwjxvOBTsCZDkEWbf47t9QeYFabLuosAgAAMdgA=
Date: Mon, 15 Jul 2019 15:04:06 +0000
Message-ID: <20190715150402.GD15202@mellanox.com>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
 <CAKMK7uHvjuQ5Dqm0LPrtQxdHh5Z6Pt2mg4AnpRRR0gWb1Wp05g@mail.gmail.com>
In-Reply-To: <CAKMK7uHvjuQ5Dqm0LPrtQxdHh5Z6Pt2mg4AnpRRR0gWb1Wp05g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::18) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c21725d2-8bd4-45ca-2423-08d70935ae51
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4656; 
x-ms-traffictypediagnostic: VI1PR05MB4656:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB46566CFEF571B95325146F9ECFCF0@VI1PR05MB4656.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(189003)(966005)(476003)(478600001)(7736002)(305945005)(486006)(68736007)(2616005)(11346002)(36756003)(446003)(5660300002)(14454004)(8936002)(64756008)(66946007)(66446008)(3846002)(66556008)(66476007)(6116002)(6306002)(8676002)(81166006)(81156014)(6512007)(26005)(186003)(256004)(14444005)(53936002)(76176011)(316002)(6436002)(99286004)(2906002)(71200400001)(71190400001)(54906003)(6486002)(229853002)(25786009)(86362001)(33656002)(66066001)(6916009)(102836004)(52116002)(4326008)(1076003)(6246003)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4656;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EbApiuLZZxJQzBUJW4gsWokwPzsLOn+6owEcsNyp1jANGfkF7mMjsKVLk8zJb2J4BpeFNFA4LzJMhIdm2RpfnJNCQ8/gi0/WGaQuk26IPFxEQ0N5Ta7gbGW5rHtT8iYlF+vE5+kxZbh6gDbyk/n+fzQiOEYOzBXGBvnvPnX3el59rPz1wbjrknSQfoVn8AplQUOPlg5ZCFdXPUToe+MMP+PAjNFoNpgNPCZddIMupp3He99qv8BIAZACAXG2EWJri8selkedWqBKyuIqGlTAybzh7yKhusp4rxtqIKJDiYLVXqyoPV4KeRcqXUlL6sWysX0/7Q+KQRGYfJN1MR+57qix2zPjNt9ocEcwoGsW1cWuCzSb/XOklh2s6TRMHAa2k4VSfus/HiLhvDip8E1y52Fm8l446TYcHKL2TueHxxc=
Content-ID: <5B7A3B0F68EBF243966782172D52DE3F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21725d2-8bd4-45ca-2423-08d70935ae51
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 15:04:06.0163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4656
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZmk1uxAVo6FKfrBs6fhFNW30XPmnCjwlpAPTH8nAxk=;
 b=K0oknNrJ8Bcyl1SXbbmShUUy0XyAFgxvt+19qVjeJglo6AD15A31LhuQqDhJTSWzLyY5UyKsC/L5HLaDj4pjKr/XLQNoWcK8WcYjYBpjrm27F1TewrkaPidlE+iJSp10FBFMDA/PMNCw1Ov7tM60s/KxjajY65wahnATJzNkHqw=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDQ6MTk6MjZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gPiBMaW51cywgZG8geW91IGhhdmUgYW55IGFkdmljZSBvbiBob3cgYmVzdCB0byBo
YW5kbGUgc2hhcmluZyBtbQo+ID4gcGF0Y2hlcz8gVGhlIGhtbS5naXQgd2FzIG1pbGRseSBwYWlu
ZnVsIGFzIGl0IHNpdHMgYmV0d2VlbiBxdWlsdCBvbgo+ID4gdGhlIC1tbSBzaWRlIGFuZCB3aGF0
IHNlZW1zIGxpa2UgJ2Egd29ybGQgb2YgaW50ZXJlc3RpbmcgZ2l0IHRoaW5ncycKPiA+IG9uIHRo
ZSBEUk0gc2lkZSAoYnV0IG1heWJlIEkganVzdCBkb24ndCBrbm93IGVub3VnaCBhYm91dCBEUk0p
Lgo+IAo+IEkgdGhpbmsgdGhlIGFwcHJvYWNoIGluIHRoaXMgbWVyZ2Ugd2luZG93IHdvcmtlZCBm
YWlybHkgd2VsbDoKPiAtIHJlZmFjdG9yL3Jld29yayBjb3JlIG1tIHN0dWZmIGluIChoKW1tLmdp
dAo+IC0gaGFuZGxlIGFsbCB0aGUgZ3B1IHN0dWZmIGluIGRybS5naXQKPiAtIG1ha2UgdGhlIGNs
YXNoZXMgd29ya2FibGUgdGhyb3VnaCBzb21lIGNsZXZlciBwcmVwIHBhdGNoZXMgbGlrZQo+ICAg
d2UndmUgZG9uZSB0aGlzIHRpbWUgYXJvdW5kCgpPa2F5LCBhcyBsb25nIGFzIHdlIGFncmVlLgoK
SSB0aGluayBwYXJ0IG9mIHRoZSBjaGFsbGVuZ2Ugd2l0aCBobW0uZ2l0IHdhcyBzZXR0aW5nIHNv
bWUKZXhwZWN0YXRpb24gZm9yIG1hbmFnaW5nIGNvbmZsaWN0cyAtIHRoZXJlIGlzIHNvbWUgaGFw
cHkgbWlkZGxlIGdyb3VuZApiZXR3ZWVuIG5vbmUgJiBzY2FyeSB3ZSBuZWVkIHRvIG5hdmlnYXRl
IHRvIG1ha2UgdGhpcyB3b3JrLgoKPiBJIHRoaW5rIExpbnVzIHdhbnRzIHRvIGJlIGFibGUgdG8g
bG9vayB0aHJvdWdoIGNvcmUgbW0gc3R1ZmYgcXVpdGUKPiBjbG9zZWx5LCBzbyBub3QgYSBnb29k
IGlkZWEgaWYgd2UgZGVlcGx5IGludGVydHdpbiBpdCB3aXRoIG9uZSBvZiB0aGUKPiBiaWdnZXN0
IHN1YnN5c3RlbXMgdGhlcmUgaXMuCgpUaGVyZSBpcyBkZWZpbmF0ZWx5IGEgYnVuY2ggb2Ygc3R1
ZmYgdGhhdCBpcyB1bmRlciB0aGUgbW0vIGRpcmVjdG9yeQpidXQgaXMgbm90IHF1aXRlICdjb3Jl
IG1tJyAtIGl0IHdvdWxkIGJlIGdvb2QgaWYgd2UgY291bGQgcmVseSBvbgptYWlsaW5nIGxpc3Qg
cmV2aWV3IG9mIHRoYXQgcGFydCBhbmQgdXNlIGEgdG9waWMgd29ya2Zsb3cgdG8gbWFuYWdlCnRo
aW5ncy4gVGhpcyB3YXMvaXMgbW9yZSBvciBsZXNzIG15IHBsYW4gd2l0aCBobW0uZ2l0CgpPdGhl
cndpc2UgeWVzLCBhcyBtdWNoIGFzIHJlYXNvbmFibGUgd2Ugc2hvdWxkIGF2b2lkIHRvcGljIG1l
cmdlcwpiZXR3ZWVuIHRoZSB0cmVlcy4KCkhvd2V2ZXIsIEkgYWdhaW4gc2VlIGNvbmZsaWN0IHJp
c2sgY29taW5nIHRoaXMgY3ljbGUgLi4KCj4gIEFuZCBJIGRvbid0IHRoaW5rIHRoZXJlIHdpbGwg
YmUgYSByZWFsIGNvbmZsaWN0IGxpa2UgdGhpcyBldmVyeQo+IG1lcmdlIHdpbmRvdywgdGhpcyBz
aG91bGQgYmUgdGhlIGV4Y2VwdGlvbi4gIFdvcnN0IGNhc2Ugd2UgaGF2ZSB0bwo+IHN0YWdlIHNv
bWUgd29yayAxIHJlbGVhc2UgY3ljbGUgYXBhcnQsIGkuZS4gIG1lcmdlIG1tIHN0dWZmIGZpcnN0
LAo+IHRoZW4gZHJtIDMgbW9udGhzIGxhdGVyLiAKCkkgcmVhbGx5IGRpc2xpa2UgdGhpcyBpZGVh
LiBOb3QgYmVpbmcgYWJsZSB0byBwcm92aWRlIHVzZXJzIGZvciBjb3JlCkFQSXMgaXMgYSBodWdl
IHByb2Nlc3MvcmV2aWV3IHByb2JsZW0uIFdvcnNlIGl0IHRlbmRzIHRvIGNyZWF0ZSBhCidsYWRk
ZXInIHdoZXJlIGluLWZsaWdodCBjaGFuZ2VzIHRvIGRyaXZlcnMgKHRvIGltcGxlbWVudCB0aGUg
bmV3CmNvcmUpIG5vdyBibG9jayBhbnkgY2hhbmdlcyB0byB0aGUgY29yZSBBUElzIG9uIGFsdGVy
bmF0aW5nIGN5Y2xlcy4gU28KJ3RoZSBiaWcgcGl0Y3R1cmUnIHN0YXJ0cyB0byBmYWxsIGEgcGFy
dCBpZiB3ZSBjYW4ndCBjby1vcmRpbmF0ZSBjcm9zcwp0cmVlIGNoYW5nZXMgaW4gc29tZSB3YXku
CgouLiBhbmQgaG9uZXN0bHksIHNwbGl0dGluZyBhIHJldmlldyBwcm9jZXNzIGFjcm9zcyBhIDkg
d2VlayBnYXAgaXMgb25lCm9mIHRoZSBiZXN0IHdheXMgSSd2ZSBzZWVuIHRvIGdldCBhIHBvb3Ig
cXVhbGl0eSByZXZpZXcgOigKCkknbSBwcmV0dHkgZmFtaWxpYXIgd2l0aCB0aGlzIHByb2JsZW0s
IHdlIGhhZCBpdCBpbiBzcGFkZXMgYmV0d2VlbiBSRE1BCmFuZCBuZXRkZXYgZm9yIGEgbG9uZyB0
aW1lLCBhbmQgaXQgaXMgZmluYWxseSBmdWxseSByZXNvbHZlZCBub3cKdGhyb3VnaCBhIGNhcmVm
dWwgdXNlIG9mIHRvcGljIGJyYW5jaGVzIGFuZCBtZXJnZXMuCgpGb3IgZXhhbXBsZSwgbmV4dCB3
ZWVrIEknbGwgcXVldWUgQ0gncyBwYXRjaGVzIHRoYXQgc2hpZnQgdGhlIGxhc3QKYmF0Y2ggb2Yg
aG1tICdjb25mbGljdCBtYW5hZ2VtZW50JyBzaGltcyBpbnRvIG5vdXZlYXUsIGFuZCB0cmllcyB0
bwpmaXggdGhlbToKCiAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1tL2xpc3QvP3Nlcmllcz0xNDE4MzUKClRoaXMgaXMgc29tZXRoaW5nIHVuY29udHJvdmVyc2lh
bCB0aGF0IHJlYWxseSBzaG91bGQgZ28gaW50byB0aGUgRFJNCndvcmxkIGFzIGEgdG9waWMgc28g
aXQgZG9lc24ndCBpbnRlcmZlcmUgd2l0aCBvbmdvaW5nIG5vdXZlYXUgZGV2LiBCdXQKSSB3YW50
IHRvIGtlZXAgdGhlIGhtbS5jLy5oIGJpdHMgaW4gdGhlIGhtbS5naXQgdG8gYXZvaWQgY29uZmxp
Y3RzLgoKU28sIEknbGwgcHV0IGl0IG9uIGEgdG9waWMgYW5kIHNlbmQgeW91IHR3byBhIG5vdGUg
bmV4dCB3ZWVrIHRvIGRlY2lkZQppZiB5b3Ugd2FudCB0byBtZXJnZSBpdCBvciBub3QuIEknbSBy
ZWFsbHkgdW5jbGVhciBob3cgbm91dmVhdSdzIGFuZApBTUQncyBwYXRjaGZsb3cgd29ya3MuLgoK
VGhhbmtzLgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
