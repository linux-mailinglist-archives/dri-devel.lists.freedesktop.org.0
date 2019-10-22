Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D5E0627
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 16:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76966E824;
	Tue, 22 Oct 2019 14:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2786E823;
 Tue, 22 Oct 2019 14:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFcWcDgTbPtOyiQ4VJdmjLNeyDCROfF+dn3aZzdeyYjoolhVYrS3Xdmlt3IvQ6NC5lJWoPt1qVDK5iqZyGYt6PsQHGUxjW2+QzGVt5MPTzgN2qj6nKkBPYnPNFVMYnS+SmEGvcslul3MHqxOFIbT3Z6xETiDyLx+m9qeXiuQLAgINStckLvc6A9gwNX+ZHAKJjyNCuYARggNz+E2TWGnHh15OE+mIj1SULh/BmaIGrq3o8hqNoOK87bpfb5QGDpYJNQ5XRItNZzKmMMJQiB1MPiY1pjWxtDfL/7pXPGEWeqkQODYw2rL1wKEd/DlOr+vjBJMnSAaTRvqF59dws6qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfWZ82B1/h7qAo0C83WVDUb+37Sx8OIxRhAV8QxVlwQ=;
 b=DSQGrmS07AvV9E0aes2iYA/kw8S5LTFH4Cg2vo8Bfd4b2yntnLvxwMg5/q4cxiY+1uoSFjFxE9uNhFWsy4cZGIdVIKngcIF2AZ009e0x00PfAqOddz+CW/Vhs/lCgoJvgGZuJgDfip2sAS/6Lk6SPEaTSb4GwvV4cVgekEQM6Xt44vZYampAX+RPm/NNY1EOaSYawFt7fvYI8BfUFvygPx8Ze+AdBvBHN2P7IM4jbYKxo7BMKsD5M+eZQpukyBwRBFyfjtJHYt3LXIKPxmrqKz4njRDs4Vj9go5hqjs4bH0u9qeeCmzCOIYR4t/PxA7XwuIOn/5rHYWH759wy2Lcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3571.namprd12.prod.outlook.com (20.178.208.159) by
 BN8PR12MB3137.namprd12.prod.outlook.com (20.178.212.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 14:15:05 +0000
Received: from BN8PR12MB3571.namprd12.prod.outlook.com
 ([fe80::fd9f:9e4d:41f5:b68c]) by BN8PR12MB3571.namprd12.prod.outlook.com
 ([fe80::fd9f:9e4d:41f5:b68c%7]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 14:15:05 +0000
From: "Koo, Anthony" <Anthony.Koo@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lskrejci@gmail.com" <lskrejci@gmail.com>
Subject: RE: [PATCH v2] drm/amdgpu: Add DC feature mask to disable fractional
 pwm
Thread-Topic: [PATCH v2] drm/amdgpu: Add DC feature mask to disable fractional
 pwm
Thread-Index: AQHViEf6icMSnW7LfUWgiNbmQIdCZadmtR4w
Date: Tue, 22 Oct 2019 14:15:04 +0000
Message-ID: <BN8PR12MB3571786ADC94FDE9B2EA09DCF3680@BN8PR12MB3571.namprd12.prod.outlook.com>
References: <20191021193743.24339-1-sunpeng.li@amd.com>
 <20191021194414.24627-1-sunpeng.li@amd.com>
In-Reply-To: <20191021194414.24627-1-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a1e22ad-55dd-476e-47df-08d756fa3c5d
x-ms-traffictypediagnostic: BN8PR12MB3137:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB31376B4D1F6C3B4AF5EE73A4F3680@BN8PR12MB3137.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(189003)(199004)(13464003)(9686003)(74316002)(6306002)(26005)(76176011)(53546011)(7696005)(14444005)(7736002)(305945005)(2201001)(102836004)(6506007)(2906002)(4326008)(6246003)(256004)(99286004)(5660300002)(52536014)(86362001)(66066001)(81166006)(81156014)(8936002)(8676002)(66946007)(66476007)(66556008)(55016002)(966005)(229853002)(66446008)(2501003)(14454004)(3846002)(6116002)(478600001)(186003)(25786009)(71200400001)(71190400001)(446003)(486006)(11346002)(476003)(110136005)(54906003)(64756008)(76116006)(33656002)(6436002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3137;
 H:BN8PR12MB3571.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vsWpenjwgs6050+1BCYr6THO9dixuLTG/Jb1+mlB7jqC/YEkqCf76d4b0D6lVUOQGpcESxJ2mD9Fb/rSIuMAG1pew8k/tqFZPpOH5sacvSYaYR1KJlbYgQ7R1UAvIVbDemjtPmSZs924Nc0zJV1/LkVD9r99lNv4tDribGA7tDG721LBdyPV83j0we6WAdBasjU9QuUtXrPBVD01bEUuWndkloZQxze+RtuNv7mh7/8ZfNwZvqaEa/pf2cHc+nFgMW2yuqacaPyzSbnEiNtMxdzCl4MEbVJFwSme4hDO5AfMbr8XjnrldRRtkszlPgJQAoyxT2o9imgstZUivYUYkNZqJBTO6cTFHSW2Atf3Hv198nMbqRQmnoTXswKlFKz1bPcv3fu8n/yqyMBCpuCoVOwjZw4o3jGWq9JSqkOWUxkAhEhtZ6LDBZtX7nHEhrSaVuOfsFB1fi5C6rEi2SgSIRqeSsPcsQZLsNFapY4F6oM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1e22ad-55dd-476e-47df-08d756fa3c5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 14:15:04.9664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BAP78IqijiJmqzZCjn4ORomB9p9GLIP0wtnLvUm7AjMF3vQIPbtYKNWsl/2JS2X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfWZ82B1/h7qAo0C83WVDUb+37Sx8OIxRhAV8QxVlwQ=;
 b=JPHJNccUM5QRxRF5uQHQ4qfOktdwhz12EfIPSvmOgO/1/a4wQz4232F7GAjJxc3ppApCxawqPoYuLO4TqIEOaXw0bq/8asORorwy3p+Kdsv4KuHNGfHTxRe1SJIDyNAEmsm9saTW5yIYLavlB9rh7rcb5BRIGMyzlykUZSPWO98=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Anthony.Koo@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxhbnRob255Lmtvb0BhbWQuY29tPgoKLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogc3VucGVuZy5saUBhbWQuY29tIDxzdW5wZW5nLmxpQGFt
ZC5jb20+IApTZW50OiBNb25kYXksIE9jdG9iZXIgMjEsIDIwMTkgMzo0NCBQTQpUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGxza3JlamNpQGdtYWlsLmNvbQpDYzogS29vLCBBbnRob255IDxBbnRob255Lktvb0BhbWQuY29t
PjsgV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgTGksIFN1biBwZW5n
IChMZW8pIDxTdW5wZW5nLkxpQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2FtZGdw
dTogQWRkIERDIGZlYXR1cmUgbWFzayB0byBkaXNhYmxlIGZyYWN0aW9uYWwgcHdtCgpGcm9tOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KCltXaHldCgpTb21lIExFRCBwYW5lbCBkcml2ZXJz
IG1pZ2h0IG5vdCBsaWtlIGZyYWN0aW9uYWwgUFdNLiBJbiBzdWNoIGNhc2VzLCBiYWNrbGlnaHQg
ZmxpY2tlcmluZyBtYXkgYmUgb2JzZXJ2ZWQuCgpbSG93XQoKQWRkIGEgREMgZmVhdHVyZSBtYXNr
IHRvIGRpc2FibGUgZnJhY3Rpb25hbCBQV00sIGFuZCBhc3NvY2lhdGUgaXQgd2l0aCB0aGUgcHJl
ZXhpc3RpbmcgZGNfY29uZmlnIGZsYWcuCgpUaGUgZmxhZyBpcyBvbmx5IHBsdW1iZWQgdGhyb3Vn
aCB0aGUgZG1jdSBmaXJtd2FyZSwgc28gcGx1bWIgaXQgdGhyb3VnaCB0aGUgZHJpdmVyIHBhdGgg
YXMgd2VsbC4KClRvIGRpc2FibGUsIGFkZCB0aGUgZm9sbG93aW5nIHRvIHRoZSBsaW51eCBjbWRs
aW5lOgphbWRncHUuZGNmZWF0dXJlbWFzaz0weDQKCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNDk1NwpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCgp2MjogQWRkIGJ1Z3ppbGxhIGxpbmsKCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jICAgICAgfCA0ICsrKysKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggICAgICAgICAgfCAxICsKIDMg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMWNmNGJlYjc2ODM1Li43M2Y5
MTdkNGQxZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwpAQCAtNzI4LDYgKzcyOCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKGFtZGdwdV9kY19mZWF0dXJlX21h
c2sgJiBEQ19NVUxUSV9NT05fUFBfTUNMS19TV0lUQ0hfTUFTSykKIAkJaW5pdF9kYXRhLmZsYWdz
Lm11bHRpX21vbl9wcF9tY2xrX3N3aXRjaCA9IHRydWU7CiAKKwlpZiAoYW1kZ3B1X2RjX2ZlYXR1
cmVfbWFzayAmIERDX0RJU0FCTEVfRlJBQ1RJT05BTF9QV01fTUFTSykKKwkJaW5pdF9kYXRhLmZs
YWdzLmRpc2FibGVfZnJhY3Rpb25hbF9wd20gPSB0cnVlOworCiAJaW5pdF9kYXRhLmZsYWdzLnBv
d2VyX2Rvd25fZGlzcGxheV9vbl9ib290ID0gdHJ1ZTsKIAogI2lmZGVmIENPTkZJR19EUk1fQU1E
X0RDX0RDTjJfMApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfYWJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0u
YwppbmRleCBkNzU5ZmRjYTdmZGIuLmI4YTNmYzUwNWM5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMKQEAgLTQwNCw2ICs0MDQsMTAgQEAgc3RhdGlj
IGJvb2wgZGNlX2FibV9pbml0X2JhY2tsaWdodChzdHJ1Y3QgYWJtICphYm0pCiAJLyogRW5hYmxl
IHRoZSBiYWNrbGlnaHQgb3V0cHV0ICovCiAJUkVHX1VQREFURShCTF9QV01fQ05UTCwgQkxfUFdN
X0VOLCAxKTsKIAorCS8qIERpc2FibGUgZnJhY3Rpb25hbCBwd20gaWYgY29uZmlndXJlZCAqLwor
CVJFR19VUERBVEUoQkxfUFdNX0NOVEwsIEJMX1BXTV9GUkFDVElPTkFMX0VOLAorCQkgICBhYm0t
PmN0eC0+ZGMtPmNvbmZpZy5kaXNhYmxlX2ZyYWN0aW9uYWxfcHdtID8gMCA6IDEpOworCiAJLyog
VW5sb2NrIGdyb3VwIDIgYmFja2xpZ2h0IHJlZ2lzdGVycyAqLwogCVJFR19VUERBVEUoQkxfUFdN
X0dSUDFfUkVHX0xPQ0ssCiAJCQlCTF9QV01fR1JQMV9SRUdfTE9DSywgMCk7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaAppbmRleCA4ODg5YWFjZWVjNjAuLjU0NTBlZDc2
MmI3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCkBAIC0xNDMs
NiArMTQzLDcgQEAgZW51bSBQUF9GRUFUVVJFX01BU0sgeyAgZW51bSBEQ19GRUFUVVJFX01BU0sg
ewogCURDX0ZCQ19NQVNLID0gMHgxLAogCURDX01VTFRJX01PTl9QUF9NQ0xLX1NXSVRDSF9NQVNL
ID0gMHgyLAorCURDX0RJU0FCTEVfRlJBQ1RJT05BTF9QV01fTUFTSyA9IDB4NCwKIH07CiAKIGVu
dW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWw7Ci0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
