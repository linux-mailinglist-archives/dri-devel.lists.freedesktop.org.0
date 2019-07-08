Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BF6227E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 17:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598789D49;
	Mon,  8 Jul 2019 15:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352A189D49
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 15:26:24 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3356.namprd12.prod.outlook.com (20.178.198.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Mon, 8 Jul 2019 15:26:22 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:26:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwCAAAGdAIAGcL0AgAELGgA=
Date: Mon, 8 Jul 2019 15:26:22 +0000
Message-ID: <233ad078-50da-40ed-fb35-c636ed3a686d@amd.com>
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
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4c430c-d30c-42a5-83a6-08d703b8a1e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3356; 
x-ms-traffictypediagnostic: DM6PR12MB3356:
x-microsoft-antispam-prvs: <DM6PR12MB33569AD9C8BD472C3B89352192F60@DM6PR12MB3356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(53754006)(8676002)(31696002)(81156014)(86362001)(25786009)(305945005)(8936002)(65956001)(65806001)(66066001)(65826007)(53936002)(68736007)(6246003)(81166006)(71190400001)(7736002)(6486002)(71200400001)(66946007)(316002)(6436002)(14444005)(58126008)(186003)(26005)(110136005)(229853002)(54906003)(6512007)(76176011)(2906002)(4326008)(64126003)(52116002)(102836004)(31686004)(53546011)(6506007)(386003)(2616005)(99286004)(36756003)(478600001)(72206003)(6116002)(3846002)(486006)(446003)(11346002)(64756008)(5660300002)(66446008)(66476007)(476003)(14454004)(73956011)(66556008)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3356;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2zfszEu1NTypPaRN5GA1pxRHu1HRNazV4QVrafDH389xr3eR6Qf9z3xFUxd3RiADh/395jQzlCUo8mLMi5cwtGuvawVzwKcYDyu4PE5+eD74vxYBzv14b9jhlvpf9kbRXvpE20kahDGxk2XZIuD370LojMhLlxSm9W5//qj7oIWQ1tcYOEbDNgWTyVVhSunQCEUkOkQ5q1T9krwiMhfnl26Q/nfFQQHFBv1+/5Mdr9lDe38XncyWM7RpSl7oIdmUphlD4Fn1+r7nAzqTmiemtg0E+UGjDHDRGFDEbMqInMoYrGYUVwzzgkJSm9NZssKXmo2+UFPBL0wz/WRug6Ofxz0mGR/PwuK/v6XQxNZBVTF+fZpuAPlBm2FGq5E/sF/HV4pKwupuKI+P9HOTDaR6qQdIk+mN6L63g1tBVBzZtK0=
Content-ID: <34DD8908A6549C4B8E1C807651D738CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4c430c-d30c-42a5-83a6-08d703b8a1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:26:22.4093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivx+FkOJs0ewzdQ0Ef7cxdmZr4umwnmH6GhxJLk+euQ=;
 b=y6ClKNOXYV3OAQ2zxY+2I6qvf7rgwVb+ZA6S9nndqboA97MevE1RlAkp+Hf03MXjxUTPh72m86mPeLb0XwDzKFJsv7iIPYHfXsbyW1EN+aBSFboXMl7uq5utdhk1CylEI1RLiEJ5D2x+3P1deO325E3iZtBpB2068obn14o6jGA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wNyA3OjMwIHAubS4sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gSGkgYWxs
LAo+Cj4gT24gV2VkLCAzIEp1bCAyMDE5IDE3OjA5OjE2IC0wNDAwIEFsZXggRGV1Y2hlciA8YWxl
eGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPj4gT24gV2VkLCBKdWwgMywgMjAxOSBhdCA1OjAz
IFBNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4+PiBP
biAyMDE5LTA3LTAzIDEwOjEwIGEubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+PiBPbiBX
ZWQsIEp1bCAwMywgMjAxOSBhdCAwMTo1NTowOEFNICswMDAwLCBLdWVobGluZywgRmVsaXggd3Jv
dGU6Cj4+Pj4+IEZyb206IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+Pj4+Pgo+
Pj4+PiBJbiBvcmRlciB0byBwYXNzIG1pcnJvciBpbnN0ZWFkIG9mIG1tIHRvIGhtbV9yYW5nZV9y
ZWdpc3Rlciwgd2UgbmVlZAo+Pj4+PiBwYXNzIGJvIGluc3RlYWQgb2YgdHRtIHRvIGFtZGdwdV90
dG1fdHRfZ2V0X3VzZXJfcGFnZXMgYmVjYXVzZSBtaXJyb3IKPj4+Pj4gaXMgcGFydCBvZiBhbWRn
cHVfbW4gc3RydWN0dXJlLCB3aGljaCBpcyBhY2Nlc3NpYmxlIGZyb20gYm8uCj4+Pj4+Cj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+Pj4+PiBS
ZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+
Pj4+PiBDQzogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4+Pj4+IEND
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4+Pj4+IENDOiBEYXZlIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPj4+Pj4gQ0M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPj4+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgIDUgKystLS0KPj4+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgICAgICAgIHwgIDIgKy0KPj4+
Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgICAgICAgIHwg
IDMgKy0tCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jICAg
ICAgICAgICB8ICA4ICsrKysrKysrCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9tbi5oICAgICAgICAgICB8ICA1ICsrKysrCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgICAgICB8IDEyICsrKysrKysrKystLQo+Pj4+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmggICAgICAgICAgfCAg
NSArKystLQo+Pj4+PiAgICA4IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQo+Pj4+IFRoaXMgaXMgdG9vIGJpZyB0byB1c2UgYXMgYSBjb25mbGljdCByZXNv
bHV0aW9uLCB3aGF0IHlvdSBjb3VsZCBkbyBpcwo+Pj4+IGFwcGx5IHRoZSBtYWpvcml0eSBvZiB0
aGUgcGF0Y2ggb24gdG9wIG9mIHlvdXIgdHJlZSBhcy1pcyAoaWUga2VlcAo+Pj4+IHVzaW5nIHRo
ZSBvbGQgaG1tX3JhbmdlX3JlZ2lzdGVyKSwgdGhlbiB0aGUgY29uZmxpY3QgcmVzb2x1dGlvbiBm
b3IKPj4+PiB0aGUgdXBkYXRlZCBBTUQgR1BVIHRyZWUgY2FuIGJlIGEgc2ltcGxlIG9uZSBsaW5l
IGNoYW5nZToKPj4+Pgo+Pj4+ICAgIC0gICBobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1tLCBz
dGFydCwKPj4+PiAgICArICAgaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCBtaXJyb3IsIHN0YXJ0
LAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKyB0dG0tPm51bV9wYWdlcyAq
IFBBR0VfU0laRSwgUEFHRV9TSElGVCk7Cj4+Pj4KPj4+PiBXaGljaCBpcyB0cml2aWFsIGZvciBl
dmVyb25lIHRvIGRlYWwgd2l0aCwgYW5kIHNvbHZlcyB0aGUgcHJvYmxlbS4KPj4+IEdvb2QgaWRl
YS4KPiBXaXRoIHRoZSBjaGFuZ2VzIGFkZGVkIHRvIHRoZSBhbWRncHUgdHJlZSBvdmVyIHRoZSB3
ZWVrZW5kLCBJIHdpbGwKPiBhcHBseSB0aGUgZm9sbG93aW5nIG1lcmdlIGZpeCBwYXRjaCB0byB0
aGUgaG1tIG1lcmdlIHRvZGF5Ogo+Cj4gRnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFt
ZC5jb20+Cj4gU2liamVjdDogZHJtL2FtZGdwdTogYWRvcHQgdG8gaG1tX3JhbmdlX3JlZ2lzdGVy
IEFQSSBjaGFuZ2UKPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5i
LmF1dWcub3JnLmF1Pgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
IEBAIC03ODMsNyArNzgzLDcgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3Ry
dWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQo+ICAgCQkJCTAgOiByYW5nZS0+
ZmxhZ3NbSE1NX1BGTl9XUklURV07Cj4gICAJcmFuZ2UtPnBmbl9mbGFnc19tYXNrID0gMDsKPiAg
IAlyYW5nZS0+cGZucyA9IHBmbnM7Cj4gLQlobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1tLCBz
dGFydCwKPiArCWhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLCBzdGFydCwKPiAgIAkJ
CSAgIHN0YXJ0ICsgdHRtLT5udW1fcGFnZXMgKiBQQUdFX1NJWkUsIFBBR0VfU0hJRlQpOwo+ICAg
Cj4gICByZXRyeToKPgo+IEFuZCBzb21lb25lIGp1c3QgbmVlZHMgdG8gbWFrZSBzdXJlIExpbnVz
IGlzIGF3YXJlIG9mIHRoaXMgbmVlZGVkIG1lcmdlIGZpeC4KClRoYW5rIHlvdSEgV2hvIHdpbGwg
YmUgdGhhdCBzb21lb25lPyBJdCBzaG91bGQgcHJvYmFibHkgYmUgb25lIG9mIHRoZSAKbWFpbnRh
aW5lcnMgb2YgdGhlIHRyZWVzIExpbnV4IHB1bGxzIGZyb20gLi4uCgpSZWdhcmRzLAogwqAgRmVs
aXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
