Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B999568
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031846EB35;
	Thu, 22 Aug 2019 13:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690044.outbound.protection.outlook.com [40.107.69.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662BB6EB35;
 Thu, 22 Aug 2019 13:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0SZ/mBuwCaAkkwlTU85QpU6wEidW0vY4siTbtY/N42xFlLFEVzquX1KLCcFg6GsNZry8PMqKLoJvef7smimXvyYpuYo7lKsSYjRsJeoCeyQ29S7wRErJHVukX1zxMpm5ebaXZvmcwlBCBwQJ3wtnlHjJJR1F1qh29Ov1kbBur3sJwNGfsl2TYw0uKvWSHfrj6Z3ooK7cpURU+obkhuEVJ77ArSVIkliqitTwlCW1wIO0LdETg09R0jN0lX5zo4Ak+NUunuI7YOpw+UFhRBgYaPENTxYsA2cObfgMVxmReABVL+vQnUV6Xu3gpgYuV2Fhv5dc5dbBJ10lcEvZXIhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cdddqpq9g0k+1vYXUY4t5x0MxARW9TAoJUmyyU2bxQ=;
 b=CZLIrzV7qwBRClWbpKaBwghxHiVsELV7YHwncSvzRtkHJtjOjdJmrpo5oBJeBbSfE5N3ci6MP4yr5EEjnSE0SCu6O7SK9TEAt4o/X+tQ9DRIRpcPID7UdPfuWh07ITA67GXEu1D8lzhcekFss50pRt1xi1o+joFt7K/EbuK25dQEHXd3w51EzEETe8BW0X5kJWESgDF/ebcnaBureLxJrj0Evv3R7hTcYr+0iKEqwA9bRWPPTv8CR7W17IdR9E1mLAeMqa8iSGTh5JwphQMt6MIzUVUCYAfe5+rT1XxpZTmMIwdyL7MSIdEeOu0Uni26EKyurMqh59YieAPWm4glog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.67.158) by
 BN8PR12MB3314.namprd12.prod.outlook.com (20.178.211.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.20; Thu, 22 Aug 2019 13:47:52 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::78ee:f1aa:4477:4b77]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::78ee:f1aa:4477:4b77%7]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 13:47:52 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 00/16] Display Stream Compression (DSC) for AMD Navi
Thread-Topic: [PATCH v3 00/16] Display Stream Compression (DSC) for AMD Navi
Thread-Index: AQHVWFs962paIqbPyUigzM/GkAVH/qcGG7WAgAELe3M=
Date: Thu, 22 Aug 2019 13:47:52 +0000
Message-ID: <BN8PR12MB32176B1868C301B1A23CB25AEFA50@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190821200129.11575-1-David.Francis@amd.com>,
 <731de9e59c86128c01ff5473a908888545f10390.camel@redhat.com>
In-Reply-To: <731de9e59c86128c01ff5473a908888545f10390.camel@redhat.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bcbb80a-09ec-420f-34cc-08d727075403
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3314; 
x-ms-traffictypediagnostic: BN8PR12MB3314:
x-microsoft-antispam-prvs: <BN8PR12MB331461E3362F753FEEE9E1B9EFA50@BN8PR12MB3314.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(71200400001)(14444005)(71190400001)(55016002)(74316002)(6436002)(8676002)(7736002)(99286004)(305945005)(229853002)(81156014)(81166006)(186003)(6246003)(5660300002)(53936002)(76116006)(256004)(8936002)(9686003)(52536014)(66556008)(66946007)(66476007)(64756008)(66446008)(2201001)(76176011)(66066001)(7696005)(478600001)(2906002)(2501003)(53546011)(6506007)(86362001)(486006)(110136005)(26005)(102836004)(316002)(446003)(11346002)(476003)(33656002)(25786009)(14454004)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3314;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O1/3tEEisxbf9NQmAOi+pmnwhG/lKPz5bAoCxoLw2bNir0EBhkKMzBLkX4ijHeLS9tpbWqv3ObVvd8l9DjN+aIMUxSGAlAJsBXvtagKBJQ17Aa1+Bj7v+dFDJalmT5fnpMOgLW5jqyy2bKkC3WiT5CH7puv7167CxXYWZ/1We2X7C8qMQ4x+Pq/6LQcLPKHAkgXI27jgKKTkcZNjkjn8oLM6ULCW5UPDK3gjL4kdJwyBbT3RdBYLUrWenIYeN1CKdiNLWcfs8goO2DBRDzRfeoYOdUYKH275cp4UmG7ytEuvd+1TS3sq7CVVl7Q/Uxa5/oOp++c6wOzSlWJpwuA4Z/yl4+FGUyWsk+jUMJ7K5H4CVm4n7MM0dDcJcdIZWNSiP8QP4uj8ZQoImZMYJ2D8EA/jYPugelE0AjO3LRhXb1Y=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcbb80a-09ec-420f-34cc-08d727075403
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 13:47:52.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7+CZrAtK1COcMLDxt3+eI13Izf8Of72NySR0z07w3EVVknxlgJ4lk0rvkAYBy7f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cdddqpq9g0k+1vYXUY4t5x0MxARW9TAoJUmyyU2bxQ=;
 b=R1h2eluh0qOtwKu5KHN5EekT3u+mqBJYTnkdgJl4dmWfZLNsM4ecmX+Cv8jeH6lumg9Nzi8SJjo1dbKVQWLYVRysowAiuGx8HEeDdnWszDeo0JMjjB6BzDc8UxYhbkMGQ379ie0BoWhptOGOqHTgF8wYUb/4bb6ABDyTpyfZQ1k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSB3YXMgYnVpbGRpbmcgYWdhaW5zdCBhbWQtc3RhZ2luZy1kcm0tbmV4dCAoY29tbWl0IGU0YTY3
ZTZjZjE0YykuCgp2NCB3aWxsIGNvbnRhaW4ganVzdCB0aGUgZHJtLW1zdCBwYXRjaGVzIGFuZCB3
aWxsIGFwcGx5IG9uIGxhdGVzdCBkcm0tdGlwL2RybS10aXAgKGNvbW1pdCAwMTg4ODZkZTQ3MjYp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+ClNlbnQ6IEF1Z3VzdCAyMSwgMjAxOSA1OjIwIFBNClRvOiBG
cmFuY2lzLCBEYXZpZDsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMC8xNl0gRGlzcGxh
eSBTdHJlYW0gQ29tcHJlc3Npb24gKERTQykgZm9yIEFNRCBOYXZpCgpXaGF0IGJyYW5jaCBkb2Vz
IHRoaXMgcGF0Y2ggc2VyaWVzIGFjdHVhbGx5IGFwcGx5IHRvPyBJJ3ZlIGJlZW4gdHJ5aW5nIHRv
CmFwcGx5IHRoaXMgbG9jYWxseSwgYnV0IGl0IGRvZXNuJ3QgYXBwZWFyIHRvIGFwcGx5IGFnYWlu
c3QgZHJtLXRpcC9kcm0tdGlwLAphbWRncHUtbmV4dC9kcm0tbmV4dCwgb3Igb3JpZ2luIChlLmcu
IGtlcm5lbC5vcmcpIC9tYXN0ZXIuIElzIHRoZXJlIGFueSBjaGFuY2UKd2UgY291bGQgaGF2ZSB0
aGlzIGdvIGFnYWluc3QgZHJtLXRpcCBpbnN0ZWFkIChhbmQgZXZlbiBiZXR0ZXIsIHNwbGl0IG91
dCB0aGUKRFJNLXNwZWNpZmljIGJpdHMgaW50byB0aGVpciBvd24gcGF0Y2ggc2VyaWVzPykKCk9u
IFdlZCwgMjAxOS0wOC0yMSBhdCAxNjowMSAtMDQwMCwgRGF2aWQgRnJhbmNpcyB3cm90ZToKPiBU
aGlzIHBhdGNoc2V0IGVuYWJsZXMgRGlzcGxheSBTdHJlYW0gQ29tcHJlc3Npb24gKERTQykgb24g
RFAKPiBjb25uZWN0b3JzIG9uIE5hdmkgQVNJQ3MsIGJvdGggU1NUIGFuZCBEU0MuCj4KPiA4azYw
IGFuZCA0azE0NCBzdXBwb3J0IHJlcXVpcmVzIE9ETSBjb21iaW5lLCBhbiBBTUQgaW50ZXJuYWwK
PiBmZWF0dXJlIHRoYXQgbWF5IGJlIGEgYml0IGJ1Z2d5IHJpZ2h0IG5vdy4KPgo+IFBhdGNoZXMg
MSB0aHJvdWdoIDUgZW5hYmxlIERTQyBmb3IgU1NULiBNb3N0IG9mIHRoZSB3b3JrIHdhcwo+IGFs
cmVhZHkgZG9uZSBpbiB0aGUgTmF2aSBwcm9tb3Rpb24gcGF0Y2hlczsgdGhpcyBqdXN0IGhvb2tz
Cj4gaXQgdXAgdG8gdGhlIGF0b21pYyBpbnRlcmZhY2UuIFRoZSBmaXJzdCB0d28gcmV2ZXJ0cyBh
cmUgb2YgdGVtcG9yYXJ5Cj4gY2hhbmdlcyB0byBibG9jayBvZmYgRFNDLiBUaGUgdGhpcmQgaXMg
b2YgYSBjb21taXQgdGhhdCB3YXMKPiBhY2NpZGVudGFsbHkgcHJvbW90ZWQgdHdpY2UuIFRoZSBm
b3VydGggYW5kIGxhc3QgcmV2ZXJ0IGZpeGVzIGEKPiBwb3RlbnRpYWwgaXNzdWUgd2l0aCBPRE0g
Y29tYmluZS4KPgo+IFBhdGNoZXMgNiwgNyBhbmQgOCBhcmUgZml4ZXMgZm9yIGJ1Z3MgdGhhdCB3
b3VsZCBiZSBleHBvc2VkIGJ5Cj4gTVNUIERTQy4gUGF0Y2hlcyA2IGFuZCA3IGFkZCBhbmQgdXNl
IGEgbmV3IERSTSBoZWxwZXIgZm9yIE1TVAo+IGNhbGN1bGF0aW9ucy4gUGF0Y2ggOCBmaXhlcyBh
IHNpbGx5IHVzZS11bmluaXRpYWxpemVkCj4KPiBQYXRjaGVzIDksIDEwLCBhbmQgMTEgYXJlIHNt
YWxsIERSTSBjaGFuZ2VzIHJlcXVpcmVkIGZvciBEU0MgTVNUOgo+IEZFQywgYSBuZXcgYml0IGlu
IHRoZSBzdGFuZGFyZDsgTVNUIERQQ0QgZnJvbSBkcml2ZXJzOyBhbmQKPiBhIHByZXZpb3VzbHkg
dW5pbml0aWFsaXplZCB2YXJpYWJsZS4KPgo+IFBhdGNoZXMgMTIgdGhyb3VnaCAxNiBhcmUgdGhl
IERTQyBNU1QgcG9saWN5IGl0c2VsZi4gUGF0Y2ggMTIKPiBhZGRzIERTQyBhdXggYWNjZXNzIGhl
bHBlcnMgdG8gRFJNLCBhbmQgcGF0Y2hlcyAxMyBhbmQgMTQgbWFrZQo+IHVzZSBvZiB0aG9zZSBo
ZWxwZXJzLiBQYXRjaCAxNSBkZWFscyB3aXRoIGRpdmlkaW5nIGJhbmR3aWR0aAo+IGZhaXJseSBi
ZXR3ZWVuIG11bHRpcGxlIHN0cmVhbXMsIGFuZCBwYXRjaCAxNiBlbnN1cmVzCj4gdGhhdCBNU1Qg
Q1JUQyB0aGF0IG1heSBjaGFuZ2UgRFNDIGNvbmZpZyBhcmUgcmVwcm9ncmFtbWVkCj4KPiB2Mjog
VXBkYXRpbmcgcGF0Y2hlcyA2IGFuZCAxNCBpbiByZXNwb2luc2UgdG8gTmljaydzIGZlZWRiYWNr
Cj4gdjM6IEFkZCByZXR1cm4gdmFsdWUgdG8gcGF0Y2ggNiBhbmQgc3BsaXQgaXQgKG5vdyBwYXRj
aGVzIDYgJiA3KQo+ICAgICBOZXcgcGF0Y2ggMTAgYWRkaW5nIE1TVCBEUENEIHJlYWQvd3JpdGUg
c3VwcG9ydAo+ICAgICBNaW5vciBmaXggKG51bV9wb3J0cy0tKSB0byBwYXRjaCAxMQo+ICAgICBB
ZGQgRFJNIGhlbHBlcnMgKHBhdGNoIDEyKQo+Cj4gRGF2aWQgRnJhbmNpcyAoMTYpOgo+ICAgUmV2
ZXJ0ICJkcm0vYW1kL2Rpc3BsYXk6IHNraXAgZHNjIGNvbmZpZyBmb3IgbmF2aTEwIGJyaW5nIHVw
Igo+ICAgUmV2ZXJ0ICJkcm0vYW1kL2Rpc3BsYXk6IG5hdmkxMCBicmluZyB1cCBza2lwIGRzYyBl
bmNvZGVyIGNvbmZpZyIKPiAgIFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBhZGQgZ2xvYmFsIG1h
c3RlciB1cGRhdGUgbG9jayBmb3IgRENOMiIKPiAgIFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBG
aXggdW5kZXJzY2FuIG5vdCB1c2luZyBwcm9wZXIgc2NhbGluZyIKPiAgIGRybS9hbWQvZGlzcGxh
eTogRW5hYmxlIFNTVCBEU0MgaW4gRE0KPiAgIGRybS9kcC1tc3Q6IEFkZCBQQk4gY2FsY3VsYXRp
b24gZm9yIERTQyBtb2Rlcwo+ICAgZHJtL2FtZC9kaXNwbGF5OiBVc2UgY29ycmVjdCBoZWxwZXJz
IHRvIGNvbXB1dGUgdGltZXNsb3RzCj4gICBkcm0vYW1kL2Rpc3BsYXk6IEluaXRpYWxpemUgRFND
IFBQUyB2YXJpYWJsZXMgdG8gMAo+ICAgZHJtL2RwLW1zdDogUGFyc2UgRkVDIGNhcGFiaWxpdHkg
b24gTVNUIHBvcnRzCj4gICBkcm0vZHAtbXN0OiBBZGQgTVNUIHN1cHBvcnQgdG8gRFAgRFBDRCBS
L1cgZnVuY3Rpb25zCj4gICBkcm0vZHAtbXN0OiBGaWxsIGJyYW5jaC0+bnVtX3BvcnRzCj4gICBk
cm0vZHAtbXN0OiBBZGQgaGVscGVycyBmb3IgcXVlcnlpbmcgYW5kIGVuYWJsaW5nIE1TVCBEU0MK
PiAgIGRybS9hbWQvZGlzcGxheTogVmFsaWRhdGUgRFNDIGNhcHMgb24gTVNUIGVuZHBvaW50cwo+
ICAgZHJtL2FtZC9kaXNwbGF5OiBXcml0ZSBEU0MgZW5hYmxlIHRvIE1TVCBEUENECj4gICBkcm0v
YW1kL2Rpc3BsYXk6IE1TVCBEU0MgY29tcHV0ZSBmYWlyIHNoYXJlCj4gICBkcm0vYW1kL2Rpc3Bs
YXk6IFRyaWdnZXIgbW9kZXNldHMgb24gTVNUIERTQyBjb25uZWN0b3JzCj4KPiAgLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTEzICsrKystCj4gIC4uLi9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8ICAzMyArLQo+ICAuLi4v
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgfCA0MDIgKysrKysrKysr
KysrKysrKystCj4gIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmgg
ICB8ICAgNCArCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAg
ICB8ICAxMiArLQo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMg
ICAgfCAgIDMgKwo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2Mu
YyAgfCAgIDMgKwo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMg
ICAgfCAgIDQgLQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRj
LmMgfCAgNzIgKy0tLQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9v
cHRjLmggfCAgIDMgLQo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMgfCAgIDcgKy0KPiAgLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5oIHwgICAxICsKPiAgLi4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfc3RyZWFtX2VuY29k
ZXIuYyAgIHwgICA4IC0KPiAgLi4uL2FtZC9kaXNwbGF5L2RjL2luYy9ody90aW1pbmdfZ2VuZXJh
dG9yLmggIHwgICAyIC0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgICAgICAg
ICAgICAgIHwgIDEyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAg
ICAgICAgICB8ICAxMCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
ICAgICAgICAgfCAyNDAgKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICAgICAgICAgIHwgICA4ICstCj4gIDE4IGZpbGVzIGNoYW5nZWQsIDgwNiBpbnNl
cnRpb25zKCspLCAxMzEgZGVsZXRpb25zKC0pCj4KLS0KQ2hlZXJzLAogICAgICAgIEx5dWRlIFBh
dWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
