Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4CAFFEB5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 07:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAAB89F08;
	Mon, 18 Nov 2019 06:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCED89E7C;
 Mon, 18 Nov 2019 06:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bV23dj1Ggr6ntbkdFJXnGGp3zb18PupoK9gOHd1vZqOGHB5k8DVxBXT6EBF2iLBGTQPvwDeOkrPOdIFcna11grd3JBpBPptlOtxs03Il/6YhUMKGZsvWEojP0Fay9lUYRbeUWKXIZfMQJtM1Jss+72xJdxvRcnRdmOUJ4UG+g+gIvWF8zmm4PSY3FcDGLgLq4FLJul5jJezgowCU7OiOhRK6j6/PGdGvowzn4560SHNBoxHLtI39K7jiQFM1dTWEqc8yHKS2SBBWH6HPk2rXqZygO4yMe7eJL7fo6C/iQ/qtoDH6zUpA/akNbeguhqsdXT/YrTo7+kUX/x/cFnPl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EzFrPcg+GyZUIjMtBwMcwwPeisOBWhjTTH6teWPvGw=;
 b=ekLzgbYQqg86OGjIcxJcPP1nRhytJ6UZEpGzWqCgl23Iqp+V7ujr6vRcXqxwERyKxEnTtfbLxsqDB/AI0JITEyAieEA+tu+g0KDvt4HctdKoYrSRS34WHg0v3FGaQpb4xqdJxsVu/AoF8MAbDcwf6GjOQ/Ku85bw4vR1ntO+D30p08Je9hbj3L6mhrzoTa+fFf40kQgky60i1UU7fzjWzqjgkC2TV6nuJM/pvT7gejpFKIntkkZVEMuwK81DuG/bwfagFES0qZIfm8aAIsJdb0o4YmMr6pOnKz+vzoexmwAns2kpC69KsuPhPZcn6erKc8ij/DlkPLqsAqrFAdR00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3615.namprd12.prod.outlook.com (20.178.242.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Mon, 18 Nov 2019 06:50:59 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 06:50:59 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Chen Wandun <chenwandun@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/powerplay: remove variable 'result' set but not
 used
Thread-Topic: [PATCH] drm/amd/powerplay: remove variable 'result' set but not
 used
Thread-Index: AQHVnC8Oclf/tFGPi0+u1HbEf6MU6aeQgDVw
Date: Mon, 18 Nov 2019 06:50:58 +0000
Message-ID: <MN2PR12MB3344A9DA952F41ADDAD6142AE44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1573875799-83572-1-git-send-email-chenwandun@huawei.com>
In-Reply-To: <1573875799-83572-1-git-send-email-chenwandun@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b3470124-9819-4839-1066-08d76bf3ab3c
x-ms-traffictypediagnostic: MN2PR12MB3615:|MN2PR12MB3615:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB361583EA28DF3BE59D456DCCE44D0@MN2PR12MB3615.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(13464003)(229853002)(99286004)(81166006)(316002)(6116002)(5660300002)(110136005)(52536014)(2906002)(478600001)(25786009)(305945005)(3846002)(14444005)(486006)(256004)(33656002)(74316002)(2501003)(476003)(446003)(76116006)(11346002)(66066001)(53546011)(6506007)(71200400001)(6436002)(76176011)(7696005)(71190400001)(8676002)(6246003)(26005)(2201001)(7736002)(14454004)(186003)(64756008)(66556008)(66946007)(66446008)(66476007)(86362001)(81156014)(102836004)(19627235002)(8936002)(55016002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3615;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eH1OxXICGa53dCidScnpA17a+izYkDaMQU2acCfNA48NRQ13QzGEZI7O8IUjam8Iue/Ejlj4mx3jMn66CB22aIE7Q2ZGCyBLwQOguKcoRoieKguejNF7B1sapiwNys06Vl48Ixyj1WdKUDnhT8J7vBzl3EEMMJhAJdfXKHF+1wNo0WF/Y7Yj9jS+luzPRoXAw/m3c6EBBF7KfKe6/lPHXVzEmOuaG4HzudsP+arXpVLnFxYTrQ2n/K5+zD2K1b7vYAU6DMA8WiVRC/67LyD5MI1WZvQPQHFJX4hJ9H/Yc5XOj9YlG7Nwqwefpk5fXpHc9BToslVsWv67DiimNvmHslXs4BOX03ikFG02pm6xCfVlXZ9jr7ILKdOEHWn9QA6W/FaFLAnq+3L+X5KKINdk7Hg81snw7dO9wTEWRL94aabhS61/p4wmE38ZQW25nQJT
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3470124-9819-4839-1066-08d76bf3ab3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 06:50:58.9380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSxKlKz8ZbtcqC/XEYrbWk7uRBCA/uHChUNJ8zufZTB5B1ScX+vUcPZn/47g08m5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EzFrPcg+GyZUIjMtBwMcwwPeisOBWhjTTH6teWPvGw=;
 b=ngwcYycY7J7pW6XFpkiJ8RomolIbEe7spkl4WW69NMPQEkygZ+jeLsLg5QyWpUK28lPycTTMrWZcPQbY4AOWW93ZWxP8hbTmqZYXdq7LKNawZ4N+4qGS9iiJZvb/Ob4lrMEOOKmB8BuRrJjjAg1d/Q9f0g/C5VSFqImGyoSEXqM=
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

VGhhbmtzLiBCdXQgaXQncyBiZXR0ZXIgdG8gcmV0dXJuIHRoZSAncmVzdWx0JyBvdXQgb24gJ3Jl
c3VsdCAhPSAwJy4KClJlZ2FyZHMsCkV2YW4KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJv
bTogQ2hlbiBXYW5kdW4gPGNoZW53YW5kdW5AaHVhd2VpLmNvbT4gClNlbnQ6IFNhdHVyZGF5LCBO
b3ZlbWJlciAxNiwgMjAxOSAxMTo0MyBBTQpUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogY2hlbndhbmR1bkBodWF3ZWkuY29t
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IHJlbW92ZSB2YXJpYWJsZSAncmVz
dWx0JyBzZXQgYnV0IG5vdCB1c2VkCgpGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvc211
bWdyL3ZlZ2FtX3NtdW1nci5jOiBJbiBmdW5jdGlvbiB2ZWdhbV9wb3B1bGF0ZV9zbWNfYm9vdF9s
ZXZlbDoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdW1nci92ZWdh
bV9zbXVtZ3IuYzoxMzY0OjY6IHdhcm5pbmc6IHZhcmlhYmxlIHJlc3VsdCBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5k
dW4gPGNoZW53YW5kdW5AaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAxMyArKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYwppbmRleCAyMDY4ZWIw
Li5mYWQ3OGJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVt
Z3IvdmVnYW1fc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
bWdyL3ZlZ2FtX3NtdW1nci5jCkBAIC0xMzYxLDIwICsxMzYxLDE5IEBAIHN0YXRpYyBpbnQgdmVn
YW1fcG9wdWxhdGVfc21jX3V2ZF9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogc3RhdGlj
IGludCB2ZWdhbV9wb3B1bGF0ZV9zbWNfYm9vdF9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
LAogCQlzdHJ1Y3QgU01VNzVfRGlzY3JldGVfRHBtVGFibGUgKnRhYmxlKQogewotCWludCByZXN1
bHQgPSAwOwogCXN0cnVjdCBzbXU3X2h3bWdyICpkYXRhID0gKHN0cnVjdCBzbXU3X2h3bWdyICop
KGh3bWdyLT5iYWNrZW5kKTsKIAogCXRhYmxlLT5HcmFwaGljc0Jvb3RMZXZlbCA9IDA7CiAJdGFi
bGUtPk1lbW9yeUJvb3RMZXZlbCA9IDA7CiAKIAkvKiBmaW5kIGJvb3QgbGV2ZWwgZnJvbSBkcG0g
dGFibGUgKi8KLQlyZXN1bHQgPSBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxl
LnNjbGtfdGFibGUpLAotCQkJZGF0YS0+dmJpb3NfYm9vdF9zdGF0ZS5zY2xrX2Jvb3R1cF92YWx1
ZSwKLQkJCSh1aW50MzJfdCAqKSYodGFibGUtPkdyYXBoaWNzQm9vdExldmVsKSk7CisJcGhtX2Zp
bmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5zY2xrX3RhYmxlKSwKKwkJCSAgICBkYXRh
LT52Ymlvc19ib290X3N0YXRlLnNjbGtfYm9vdHVwX3ZhbHVlLAorCQkJICAgICh1aW50MzJfdCAq
KSYodGFibGUtPkdyYXBoaWNzQm9vdExldmVsKSk7CiAKLQlyZXN1bHQgPSBwaG1fZmluZF9ib290
X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLm1jbGtfdGFibGUpLAotCQkJZGF0YS0+dmJpb3NfYm9v
dF9zdGF0ZS5tY2xrX2Jvb3R1cF92YWx1ZSwKLQkJCSh1aW50MzJfdCAqKSYodGFibGUtPk1lbW9y
eUJvb3RMZXZlbCkpOworCXBobV9maW5kX2Jvb3RfbGV2ZWwoJihkYXRhLT5kcG1fdGFibGUubWNs
a190YWJsZSksCisJCQkgICAgZGF0YS0+dmJpb3NfYm9vdF9zdGF0ZS5tY2xrX2Jvb3R1cF92YWx1
ZSwKKwkJCSAgICAodWludDMyX3QgKikmKHRhYmxlLT5NZW1vcnlCb290TGV2ZWwpKTsKIAogCXRh
YmxlLT5Cb290VmRkYyAgPSBkYXRhLT52Ymlvc19ib290X3N0YXRlLnZkZGNfYm9vdHVwX3ZhbHVl
ICoKIAkJCVZPTFRBR0VfU0NBTEU7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
