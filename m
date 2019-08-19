Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DD91AC0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 03:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EAA6E072;
	Mon, 19 Aug 2019 01:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E6D6E072;
 Mon, 19 Aug 2019 01:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GImIx1PMJ3OO397wFPZfyZl1XU1VnGvnv2bAP83TvmhVAzAz+PAF4r13FPLARnqW9N7RCOUZZhltYGzekcS67Mhfb2G9lDbfhrXCnyTsJWfeymR9weTBxe6ooUpo23x/Wx4p8bRm73iHdWD9hmnebVMswCly2litu8drdwKSFzaEV9yLGTWZAx/RgAD6dZkBz2n96GMCa/Rwd/Ho5eWdFSrULGUI9d6Qm370aFYx3qVCi9VfUWhpgFvROjEIXhtSqfQpl0JB7G/0549pDGDORntXVelRxmpfRkzu/KbHA7KpR050O0Qo4asNk9CI+H66LzjaEQwpW20KmoCbngdN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/ppL7v73rQT+xYBHf4r1007omuc2TvUAGtUe+N9JCo=;
 b=nFpTarouSiet/B5Z+JKiD74h0CHs5OROn1l53wmV9jiBUbJdC/vCHQaiqZMkUPF5E0Lo4hkZ9KOmmI81CTQFTce/D0qgUi+aHbdVnD3q9eGbz3mYrblAQGkvQNP66FNwZY2QGNeiTxT78IwNBvN5RLG+/3zPtaqeDXgDGcLgMbT0jwO+Qev00yOfEiTBT7U1qzWpr1MWV41Va2CrOBaQVeaNrBZUpuaFPEprZgDI3pK9BRrFwcSTwzp3PKkJs3nyXGEwlWa5APCAT5TSKtt6bmVlVRR+WLWTynY6yI40SM+eyAuT9oSlOus/SlopmFh8hQ1FzlN1Mg1pdZGIKi5qvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3571.namprd12.prod.outlook.com (20.178.208.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 01:33:47 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 01:33:47 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo in the include header guard of
 'navi12_ip_offset.h'
Thread-Topic: [PATCH] drm/amdgpu: Fix a typo in the include header guard of
 'navi12_ip_offset.h'
Thread-Index: AQHVVd4CXpOcmlL5XUyBO6i9JFghY6cBsI7S
Date: Mon, 19 Aug 2019 01:33:46 +0000
Message-ID: <81BEC287-3D11-4B5B-BF32-3E29F3266453@amd.com>
References: <20190818155957.4029-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190818155957.4029-1-christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.61.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e779f01-bbca-4e95-5470-08d7244547b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3571; 
x-ms-traffictypediagnostic: BN8PR12MB3571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB357144031500AD1BF2A811A989A80@BN8PR12MB3571.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(446003)(229853002)(6486002)(86362001)(6436002)(5660300002)(66066001)(8676002)(91956017)(76116006)(81166006)(66946007)(7736002)(6916009)(36756003)(6512007)(76176011)(256004)(14454004)(26005)(476003)(2616005)(6116002)(25786009)(66476007)(2906002)(478600001)(8936002)(3846002)(66446008)(316002)(64756008)(4326008)(186003)(66556008)(305945005)(71200400001)(71190400001)(53936002)(11346002)(81156014)(6506007)(54906003)(102836004)(6246003)(33656002)(486006)(53546011)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3571;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1k0aGq6Um63JmwteobFSZzyRFvTOF5CSjSVlx2hbpRMYKkyadlPA8PTWGyMejAWdhBv9nuRnG/Ik0vavRznk6oTAFjY+tsda3XSFKKVPD9+YMtX4VtZNEC31VDzMz6dVcbi1HRqJvuJZBg+G7E4gDtJAKjF6Ma0FAaDL8HPysf4dJPpeQMtAVNe+0IPyFvotn8qtHlsHjmT8YDdRjCx+fBxNcUXWjG9X9/661X9WmC4HEK2vRsZgBtH2y/erPvYrAdvM47U3TDT/GvRxSbut1qLS4/xB+msj+GNXAYaT2hhScRRjMndF6a4ZYEMd/idJh1ZYJHKABQ2Pp2FDgEcpiGSylUK3uHPMGG+k7TDgUwcUiugMl6bYes+sM1ib2UVcTjapGkuZ+S3/iL3SWSaUM3w5p3K//zMRQos/8Q7PaQw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e779f01-bbca-4e95-5470-08d7244547b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 01:33:46.8382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9F0JJy2ugpFhB5JteqRuG9pe1/It0hXqKcaYYGmjAUjQeuy8Z6qiG0Uw2OrDDlhq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3571
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/ppL7v73rQT+xYBHf4r1007omuc2TvUAGtUe+N9JCo=;
 b=fBVjRywAXfKcfS+IDvnU4vIDZupWbchuQFSeRhtZVEhng9pLLQGMGlOfjFJQGrxYqJ47rpLlqp7IZC/H7f0/Sybh50HGYCsci92p8dJGWQ4aufnQaHr1hfYHhxFD2e1IYIWQPgjCvLkCkNaZyZSB2c6hmcwd+Y5ESEgTkLhCUsI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpYaWFvamll
Cgo+IE9uIEF1ZyAxOSwgMjAxOSwgYXQgMTI6MDAgQU0sIENocmlzdG9waGUgSkFJTExFVCA8Y2hy
aXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlOgo+IAo+ICdfbmF2aTEwX2lwX29mZnNl
dF9IRUFERVInIGlzIGFscmVhZHkgdXNlZCBpbiAnbmF2aTEwX2lwX29mZnNldC5oJywgc28gdXNl
Cj4gJ19uYXZpMTJfaXBfb2Zmc2V0X0hFQURFUicgaW5zdGVhZCBoZXJlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+
Cj4gLS0tCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9vZmZzZXQuaCB8
IDQgKystLQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBf
b2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEyX2lwX29mZnNldC5o
Cj4gaW5kZXggMjI5ZThmZGRmY2MxLi42YzJjYzYyOTZjMDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9vZmZzZXQuaAo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0LmgKPiBAQCAtMTgsOCArMTgsOCBA
QAo+ICAqIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcg
RlJPTSwgT1VUIE9GIE9SIElOCj4gICogQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBU
SEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPiAgKi8KPiAtI2lmbmRl
ZiBfbmF2aTEwX2lwX29mZnNldF9IRUFERVIKPiAtI2RlZmluZSBfbmF2aTEwX2lwX29mZnNldF9I
RUFERVIKPiArI2lmbmRlZiBfbmF2aTEyX2lwX29mZnNldF9IRUFERVIKPiArI2RlZmluZSBfbmF2
aTEyX2lwX29mZnNldF9IRUFERVIKPiAKPiAjZGVmaW5lIE1BWF9JTlNUQU5DRSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDcKPiAjZGVmaW5lIE1BWF9TRUdNRU5UICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDUKPiAtLSAKPiAyLjIwLjEKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
