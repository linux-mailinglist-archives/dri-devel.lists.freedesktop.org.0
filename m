Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C8388E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE3E89D49;
	Fri,  7 Jun 2019 11:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7AB89D49
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:24:57 +0000 (UTC)
Received: from AM6PR08MB4104.eurprd08.prod.outlook.com (20.179.2.31) by
 AM6PR08MB4835.eurprd08.prod.outlook.com (10.255.98.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Fri, 7 Jun 2019 11:24:55 +0000
Received: from AM6PR08MB4104.eurprd08.prod.outlook.com
 ([fe80::2dd7:c53e:ed14:2be4]) by AM6PR08MB4104.eurprd08.prod.outlook.com
 ([fe80::2dd7:c53e:ed14:2be4%7]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 11:24:55 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v5 3/5] dma-buf: heaps: Add system heap to dmabuf heaps
Thread-Topic: [PATCH v5 3/5] dma-buf: heaps: Add system heap to dmabuf heaps
Thread-Index: AQHVHN4lESVUTjaFyUes09QEE6C8/KaQDYUA
Date: Fri, 7 Jun 2019 11:24:55 +0000
Message-ID: <20190607112454.huov3jzuoqvnbkem@DESKTOP-E1NTVVP.localdomain>
References: <20190607030719.77286-1-john.stultz@linaro.org>
 <20190607030719.77286-4-john.stultz@linaro.org>
In-Reply-To: <20190607030719.77286-4-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::15) To AM6PR08MB4104.eurprd08.prod.outlook.com
 (2603:10a6:20b:a9::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12493d2c-751c-4f0d-8e7a-08d6eb3ac40d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB4835; 
x-ms-traffictypediagnostic: AM6PR08MB4835:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM6PR08MB483504E0EC39ED3A01EB7816F0100@AM6PR08MB4835.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(316002)(66476007)(81166006)(81156014)(66556008)(8676002)(66446008)(58126008)(64756008)(229853002)(99286004)(73956011)(66946007)(476003)(8936002)(54906003)(6436002)(14444005)(256004)(6486002)(6916009)(66066001)(4326008)(72206003)(2906002)(446003)(9686003)(3846002)(6116002)(25786009)(6512007)(486006)(86362001)(7416002)(52116002)(6246003)(102836004)(305945005)(7736002)(71200400001)(71190400001)(14454004)(26005)(1076003)(44832011)(478600001)(5660300002)(11346002)(186003)(386003)(68736007)(76176011)(6506007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4835;
 H:AM6PR08MB4104.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HGjUbza+LjFzlffz1cpuxOZ/B+ctTsqHHPxeeZMMzGnyK0dAi1GPLEHFwBNEp3LksjRzS7WUnZVeBThritVhdOh5ZHeWHbSJqIIiwly+1Ziu4oOhIeT9cCyeyrbTcauDgWcdlV2aqYaUMSssgjLA3xaemGJ8OC91nMsjrMhPuYethKi6B05QGaDl+wia2p0vxtMr5AivqQ9ElVMoJxm3g+twgAgEmz2o7XItMqTJuru+/dL91cA/F4m71g9lt/bnjw0HTrypVtO2ZnnZG4WH8XUaSFPJhpIRfoFm8bnb8sHQvgRGJwubaarT1jh2C3Q/dq7hLswgX18XjCQXI9WvCobR/XuPJg83CqeQIfdp20YYXNHELgiFSwD9WFMSkJ61AayPBfLXZIKUg/rbiWHPZoEfLSeQml0vdG5SL50rjv0=
Content-ID: <AF449923FEAC9944AA1A2ABABA2E2828@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12493d2c-751c-4f0d-8e7a-08d6eb3ac40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 11:24:55.1415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4835
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umDhZcjoSsMJDkAeX7yQ5LmgCgk+OoyOANwb0UD4iBs=;
 b=m2SLpGQuIRK870QNc3yKtzY9ooZ7q42Pm6EzzZq6iCPY/vQPiQG0GfFPNNOJNoc/Tf81mffWGSA7icD2ADOzISutYZm3baR05AW6RHnYLvEC26K+EXA3P7DcTvG6fJB7juge+KXIvPkBHDRJxjoKLLCny5I5E6jjT3zk6XBr/iM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
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
Cc: nd <nd@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIEp1biAwNywgMjAxOSBhdCAwMzowNzoxN0FNICswMDAwLCBKb2huIFN0dWx0
eiB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMgc3lzdGVtIGhlYXAgdG8gdGhlIGRtYS1idWYgaGVh
cHMgZnJhbWV3b3JrLgo+IAo+IFRoaXMgYWxsb3dzIGFwcGxpY2F0aW9ucyB0byBnZXQgYSBwYWdl
LWFsbG9jYXRvciBiYWNrZWQgZG1hLWJ1Zgo+IGZvciBub24tY29udGlndW91cyBtZW1vcnkuCj4g
Cj4gVGhpcyBjb2RlIGlzIGFuIGV2b2x1dGlvbiBvZiB0aGUgQW5kcm9pZCBJT04gaW1wbGVtZW50
YXRpb24sIHNvCj4gdGhhbmtzIHRvIGl0cyBvcmlnaW5hbCBhdXRob3JzIGFuZCBtYWludGFpbnRl
cnM6Cj4gICBSZWJlY2NhIFNjaHVsdHogWmF2aW4sIENvbGluIENyb3NzLCBMYXVyYSBBYmJvdHQs
IGFuZCBvdGhlcnMhCj4gCj4gQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgo+
IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KPiBD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogTGlhbSBNYXJr
IDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KPiBDYzogUHJhdGlrIFBhdGVsIDxwcmF0aWtwQGNvZGVh
dXJvcmEub3JnPgo+IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+Cj4g
Q2M6IFZpbmNlbnQgRG9ubmVmb3J0IDxWaW5jZW50LkRvbm5lZm9ydEBhcm0uY29tPgo+IENjOiBT
dWRpcHRvIFBhdWwgPFN1ZGlwdG8uUGF1bEBhcm0uY29tPgo+IENjOiBBbmRyZXcgRi4gRGF2aXMg
PGFmZEB0aS5jb20+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4K
PiBDYzogQ2hlbmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+Cj4gQ2M6IEFsaXN0YWlyIFN0cmFj
aGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFJldmlld2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4KPiBDaGFuZ2UtSWQ6IEk0ZGM1ZmY1NGNjYjFmN2NhM2FjODY3NTY2MTExNGNh
MzM4MTM2NTRiCj4gLS0tCj4gdjI6Cj4gKiBTd2l0Y2ggYWxsb2NhdGUgdG8gcmV0dXJuIGRtYWJ1
ZiBmZAo+ICogU2ltcGxpZnkgaW5pdCBjb2RlCj4gKiBDaGVja3BhdGNoIGZpeHVwcwo+ICogRHJv
cGVkIGRlYWQgc3lzdGVtLWNvbnRpZyBjb2RlCj4gdjM6Cj4gKiBXaGl0ZXNwYWNlIGZpeHVwcyBm
cm9tIEJlbmphbWluCj4gKiBNYWtlIHN1cmUgd2UncmUgemVyb2luZyB0aGUgYWxsb2NhdGVkIHBh
Z2VzIChmcm9tIExpYW0pCj4gKiBVc2UgUEFHRV9BTElHTigpIGNvbnNpc3RlbnRseSAoc3VnZ2Vz
dGVkIGJ5IEJyaWFuKQo+ICogRm9sZCBpbiBuZXcgcmVnaXN0cmF0aW9uIHN0eWxlIGZyb20gQW5k
cmV3Cj4gKiBBdm9pZCBuZWVkbGVzcyBkeW5hbWljIGFsbG9jYXRpb24gb2Ygc3lzX2hlYXAgKHN1
Z2dlc3RlZCBieQo+ICAgQ2hyaXN0b3BoKQo+ICogTWlub3IgY2xlYW51cHMKPiAqIEZvbGRlZCBp
biBjaGFuZ2VzIGZyb20gQW5kcmV3IHRvIHVzZSBzaW1wbGlmaWVkIHBhZ2UgbGlzdAo+ICAgZnJv
bSB0aGUgaGVhcCBoZWxwZXJzCj4gdjQ6Cj4gKiBPcHRpbWl6YXRpb24gdG8gYWxsb2NhdGUgcGFn
ZXMgaW4gY2h1bmtzLCBzaW1pbGFyIHRvIG9sZAo+ICAgcGFnZXBvb2wgY29kZQo+ICogVXNlIGZk
X2ZsYWdzIHdoZW4gY3JlYXRpbmcgZG1hYnVmIGZkIChTdWdnZXN0ZWQgYnkgQmVuamFtaW4pCj4g
djU6Cj4gKiBCYWNrIG91dCBsYXJnZSBvcmRlciBwYWdlIGFsbG9jYXRpb25zICh3YXMgbGVha2lu
ZyBtZW1vcnksCj4gICBhcyB0aGUgcGFnZSBhcnJheSBkaWRuJ3QgcHJvcGVybHkgdHJhY2sgb3Jk
ZXIgc2l6ZSkKPiAtLS0KPiAgZHJpdmVycy9kbWEtYnVmL0tjb25maWcgICAgICAgICAgICAgfCAg
IDIgKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyAgICAgICB8ICAgNiArKwo+ICBk
cml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgMTIzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZG1hLWJ1Zi9LY29uZmlnIGIvZHJpdmVycy9kbWEtYnVmL0tjb25maWcKPiBpbmRleCA5
YjkzZjg2ZjU5N2MuLjQzNGNmZTY0NmRhZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYv
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnCj4gQEAgLTQ3LDQgKzQ3LDYg
QEAgbWVudWNvbmZpZyBETUFCVUZfSEVBUFMKPiAgCSAgdGhpcyBhbGxvd3MgdXNlcnNwYWNlIHRv
IGFsbG9jYXRlIGRtYS1idWZzIHRoYXQgY2FuIGJlIHNoYXJlZCBiZXR3ZWVuCj4gIAkgIGRyaXZl
cnMuCj4gIAo+ICtzb3VyY2UgImRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnIgo+ICsKPiAg
ZW5kbWVudQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjIwNTA1Mjc0NDE2OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2
ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZwo+IEBAIC0wLDAgKzEsNiBAQAo+ICtjb25maWcgRE1B
QlVGX0hFQVBTX1NZU1RFTQo+ICsJYm9vbCAiRE1BLUJVRiBTeXN0ZW0gSGVhcCIKPiArCWRlcGVu
ZHMgb24gRE1BQlVGX0hFQVBTCj4gKwloZWxwCj4gKwkgIENob29zZSB0aGlzIG9wdGlvbiB0byBl
bmFibGUgdGhlIHN5c3RlbSBkbWFidWYgaGVhcC4gVGhlIHN5c3RlbSBoZWFwCj4gKwkgIGlzIGJh
Y2tlZCBieSBwYWdlcyBmcm9tIHRoZSBidWRkeSBhbGxvY2F0b3IuIElmIGluIGRvdWJ0LCBzYXkg
WS4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlIGIvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlCj4gaW5kZXggZGU0OTg5ODExMmRiLi5kMTgwOGVjYTI1
ODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlCj4gKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlCj4gQEAgLTEsMiArMSwzIEBACj4gICMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgb2JqLXkJCQkJCSs9IGhlYXAtaGVscGVy
cy5vCj4gK29iai0kKENPTkZJR19ETUFCVUZfSEVBUFNfU1lTVEVNKQkrPSBzeXN0ZW1faGVhcC5v
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIGIvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uODYzODM0NDk5Y2UxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gQEAgLTAsMCArMSwxMjMgQEAK
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogRE1BQlVG
IFN5c3RlbSBoZWFwIGV4cG9ydGVyCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoQykgMjAxMSBHb29n
bGUsIEluYy4KPiArICogQ29weXJpZ2h0IChDKSAyMDE5IExpbmFybyBMdGQuCj4gKyAqLwo+ICsK
PiArI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWhl
YXAuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICsjaW5jbHVkZSA8bGludXgvaGlnaG1l
bS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiArI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJs
aXN0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKwo+ICsjaW5jbHVkZSAiaGVhcC1o
ZWxwZXJzLmgiCj4gKwo+ICtzdHJ1Y3Qgc3lzdGVtX2hlYXAgewo+ICsJc3RydWN0IGRtYV9oZWFw
ICpoZWFwOwo+ICt9IHN5c19oZWFwOwo+ICsKPiArCgpleHRyYSBuZXdsaW5lLiBPdGhlcndpc2Us
IExHVE06CgpSZXZpZXdlZC1ieTogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
