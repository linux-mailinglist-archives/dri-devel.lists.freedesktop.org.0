Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2756100033
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FA889ECD;
	Mon, 18 Nov 2019 08:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720068.outbound.protection.outlook.com [40.107.72.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEF089DB2;
 Mon, 18 Nov 2019 08:15:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVn4yVq76ggkGxp8M+twEsohTiQMWGZSJ8BoRAtN60CDFlE8/Ty+xyQm7lsIKprnVwtleXyNTGcapfb/rx9+ZkzzwMzn6//K0POPqhQ32jsOf4/jRg3PRLkWYUNNJxGWq+9LfrSJxf+JQpVHQoSKGYmToPs58H46lrNz5TR7RE0A4z6VSuXgbO2/WCqu80QTQFZquZ8tH10qz8hgBsK/px88v25RTNgmXFoKfPmIitlanja5jLb6PwQqADuYnPQMeJe/27At+V0BcWwkFvmkDXPltXCkE/0TaEOu5f/a7OkBXKb+4QJK3/XuyX1f33jBoZfakekrsN/UQ0irFCxFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co0kwY1itMIE46cZm8A+BywABH6YDQFWwfxCH87UxaQ=;
 b=L3bDAHbkhKlr8AC1LY9rVpS6pXNeVvCY7tGAtu3uy+zFM7soY/JxASXt8zbKsclY84q1xywqhsbgkJBu6JGe+/SqZnqGgxeZ6uIBjox22g+U1UahwkvHGwcTjhSCVNfJEjstr61ctaQwlSVyC7+118QM3exQ32pL4uHnrTt0J5jBk1Feoy5opjcCANkr8FUxuPjzzEUW2s2KqgRna+KhCOikFkgNSSum8ohX3ex5LcUhOnHVOdbuJVK0u5h1bkhD4n6qBHSXBCPqFtXQ+KI8J/v4uwYgWI82zjcR+L1kxZ3GWnCM9AnAUW4dKgfXgJaVnwB5eKiVjFE+qLHj0VL/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4206.namprd12.prod.outlook.com (52.135.49.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Mon, 18 Nov 2019 08:15:38 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 08:15:38 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Chen Wandun <chenwandun@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/powerplay: return errno code to caller when
 error occur
Thread-Topic: [PATCH v2] drm/amd/powerplay: return errno code to caller when
 error occur
Thread-Index: AQHVneW4BAJGGH03hUSa3MUMgxEJ0KeQlNEg
Date: Mon, 18 Nov 2019 08:15:38 +0000
Message-ID: <MN2PR12MB3344BBBA7F72F9625D71329EE44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1573875799-83572-1-git-send-email-chenwandun@huawei.com>
 <1574064214-109525-1-git-send-email-chenwandun@huawei.com>
In-Reply-To: <1574064214-109525-1-git-send-email-chenwandun@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc4c40a6-8c35-4659-930c-08d76bff7edf
x-ms-traffictypediagnostic: MN2PR12MB4206:|MN2PR12MB4206:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4206ADFF72893D44C227D727E44D0@MN2PR12MB4206.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(13464003)(199004)(189003)(6506007)(256004)(14444005)(478600001)(99286004)(7696005)(74316002)(9686003)(6246003)(53546011)(7736002)(26005)(305945005)(110136005)(2201001)(14454004)(76176011)(102836004)(66946007)(66446008)(64756008)(66556008)(66476007)(2501003)(8676002)(81166006)(446003)(66066001)(11346002)(86362001)(81156014)(33656002)(52536014)(6436002)(76116006)(229853002)(316002)(486006)(5660300002)(8936002)(186003)(71200400001)(6116002)(55016002)(3846002)(71190400001)(25786009)(2906002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4206;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PvBNAerKPvADkz0jJsMfNla91bLyDhfJLRlh87bI12VkHK2EU9sSmlZmrlV2NYgIDnuwBrT7tGsz/1dhk+WdeTJzlCR+CQF4KyBp1KWhNlRvjVuMA/Xu5nTUy/ZpHwpW5A21fzL1A3VBsHQlvBYW5SVjdEJScubweRKbcxJSkc5UbKbp8oYAtSbzwssvl2D43nRRwPym69HmHqBc4KJ3qfEqZKEc9VKYD90G6wcods8FmarXc18P808X2dAiVR/JI5+5Yl++0nv9IEY/ca4HH5cjpVlCW35Y+RrNwfq+cRLltUlSm9D6nOlaorI28LsiyAhdGkclf0FCv6XXOLH+qipKa4wcFwZueOPR+sYANwmLBY7elUnBqjsNHKXyjomX/MAgsuC2rj+zbznGcao4xlFbOoS8dBNgocJe4S6iG+vjFvUMJUbdug+tOGsIpjHR
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4c40a6-8c35-4659-930c-08d76bff7edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 08:15:38.4509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94lW14cC3njVn1NMFiQbxgHFYiSrx1UqowZa+VG9ON1+FOVpz5bMWNHBFJe8jTo2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co0kwY1itMIE46cZm8A+BywABH6YDQFWwfxCH87UxaQ=;
 b=jrCTvTe+p0nVGNZg60KikmBHz3VuxQ4W6RpyUL1D97bHyr9TzaIjZWKaz/mfzKS9H30hE9esqLoZ8qGQv8QgrS/3Ikis8LywZGfECOoXdRrJjxUf603VatWcD3wYQbLgh7paa3TC0uRXSIX7oDerqxEDqD2HMiuU0fAYiwVLl+E=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cgo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQ2hlbiBXYW5kdW4gPGNoZW53YW5kdW5AaHVhd2VpLmNv
bT4KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE4LCAyMDE5IDQ6MDQgUE0KPiBUbzogUXVhbiwg
RXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIKPiA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0K
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGNoZW53YW5kdW5AaHVhd2VpLmNvbQo+IFN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2Ft
ZC9wb3dlcnBsYXk6IHJldHVybiBlcnJubyBjb2RlIHRvIGNhbGxlciB3aGVuCj4gZXJyb3Igb2Nj
dXIKPiAKPiByZXR1cm4gZXJybm8gY29kZSB0byBjYWxsZXIgd2hlbiBlcnJvciBvY2N1ciwgYW5k
IG1lYW53aGlsZSByZW1vdmUgZ2NjICctCj4gV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJu
aW5nLgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9zbXVtZ3Iv
dmVnYW1fc211bWdyLmM6IEluCj4gZnVuY3Rpb24gdmVnYW1fcG9wdWxhdGVfc21jX2Jvb3RfbGV2
ZWw6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdW1nci92ZWdh
bV9zbXVtZ3IuYzoxMzY0Ogo+IDY6IHdhcm5pbmc6IHZhcmlhYmxlIHJlc3VsdCBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
ZW4gV2FuZHVuIDxjaGVud2FuZHVuQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYyB8IDUgKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYwo+IGluZGV4IDIwNjhlYjAuLjUw
ODk2ZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdy
L3ZlZ2FtX3NtdW1nci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
bWdyL3ZlZ2FtX3NtdW1nci5jCj4gQEAgLTEzNzEsMTEgKzEzNzEsMTYgQEAgc3RhdGljIGludCB2
ZWdhbV9wb3B1bGF0ZV9zbWNfYm9vdF9sZXZlbChzdHJ1Y3QKPiBwcF9od21nciAqaHdtZ3IsCj4g
IAlyZXN1bHQgPSBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLnNjbGtfdGFi
bGUpLAo+ICAJCQlkYXRhLT52Ymlvc19ib290X3N0YXRlLnNjbGtfYm9vdHVwX3ZhbHVlLAo+ICAJ
CQkodWludDMyX3QgKikmKHRhYmxlLT5HcmFwaGljc0Jvb3RMZXZlbCkpOwo+ICsJaWYgKHJlc3Vs
dCkKPiArCQlyZXR1cm4gcmVzdWx0Owo+IAo+ICAJcmVzdWx0ID0gcGhtX2ZpbmRfYm9vdF9sZXZl
bCgmKGRhdGEtPmRwbV90YWJsZS5tY2xrX3RhYmxlKSwKPiAgCQkJZGF0YS0+dmJpb3NfYm9vdF9z
dGF0ZS5tY2xrX2Jvb3R1cF92YWx1ZSwKPiAgCQkJKHVpbnQzMl90ICopJih0YWJsZS0+TWVtb3J5
Qm9vdExldmVsKSk7Cj4gCj4gKwlpZiAocmVzdWx0KQo+ICsJCXJldHVybiByZXN1bHQ7Cj4gKwo+
ICAJdGFibGUtPkJvb3RWZGRjICA9IGRhdGEtPnZiaW9zX2Jvb3Rfc3RhdGUudmRkY19ib290dXBf
dmFsdWUgKgo+ICAJCQlWT0xUQUdFX1NDQUxFOwo+ICAJdGFibGUtPkJvb3RWZGRjaSA9IGRhdGEt
PnZiaW9zX2Jvb3Rfc3RhdGUudmRkY2lfYm9vdHVwX3ZhbHVlICoKPiAtLQo+IDIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
