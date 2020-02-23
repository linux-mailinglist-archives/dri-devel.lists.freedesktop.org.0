Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C61169769
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 13:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20E6893D5;
	Sun, 23 Feb 2020 12:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A16893D5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 12:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiN1iwo165IQuZ3TnKbPfCe3zl6BVhMPq+4s79BFLkhtTaxoU/ROYmrB+CRk5NObpSTP84PVJN7fi0wCQ5WFu2KV0PJt2CUVcUXUq+GucLA3MN+fwZxahyG+zbgxuiRTiQWBxXLN077ym+dER/U/iAxMegVMNeE4fhEXPJ+PX7jNKiwJa/cpVsalt4UC7OS2J/aTnO6DbS0V0QTn3zaN1Lmcag7JEoDiGMhipiZ7nqefeYyA/E2RHNL742gw70v0BpgQcq3B3/Q9Pq4aCsEhxQYzQ6jA+TnW/xOf7csM1H0JPHntpZwYS/+ZkfoeURCUPDhPeqoAwFXHdOp9+F0EtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e2SFZ8yfksAQ/03LJl04mPIkyiH4rbpNuYmCTjUhyI=;
 b=DZ/tiSitkmXFeDIvAyJe+Jyj+Nz8eCF9SNNW9aNdUI8ZhXq4iskqlAgfB3gzPY0LAxOb4aoyZeCLRob1ErS+kM02GJ+zfgygxkGeONhPkrCkJA9OMdkqLbAevvYf2wvJ+YBAlbugwMN/n8/T2WbCAAe4nJ+nB6DzajChKxe8fVt3WfST/ZOOT2U/sJfazWRk2KYIa7Gz9Z1W+/vzNM+Zt7LwET8INWs5hELamyJcx9AeWnDdtiolp2fn1YMAOzexZsC27l6s3+7dLF2fMOhVNBe8XTDw8ytYF1PZkFRQdx+wv21T5Z6xaLQAPgCQQr1U+HHvkUVCvBXKCy7MNVZpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e2SFZ8yfksAQ/03LJl04mPIkyiH4rbpNuYmCTjUhyI=;
 b=37P+ckU/pGz+MrueUoIU9Um4f4RFHv1W8oom15shT3m3h/lDW9nIbvrCm3bjPnx4sWmT5I2g/QIMZIf9p26C4/heqw+PuyNENpp29FfG30PWUI1nCH4+r8yDSg/rpNFtOtb1VFneZ9+82qCcpsPL+y4vPnWSKV3a2maNWkaqT9I=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 by SN6PR12MB2701.namprd12.prod.outlook.com (2603:10b6:805:6f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24; Sun, 23 Feb
 2020 12:00:59 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2729.033; Sun, 23 Feb 2020
 12:00:59 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
Thread-Topic: [PATCH] dma-buf: Fix missing excl fence waiting
Thread-Index: AQHV6kBAT438z6UDCka2fB4S+SGlWagorVAA
Date: Sun, 23 Feb 2020 12:00:59 +0000
Message-ID: <8DCC701F-62EE-4BAB-A986-C85D64C693F0@amd.com>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
In-Reply-To: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.215.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aa160587-e381-44c7-4363-08d7b8580bec
x-ms-traffictypediagnostic: SN6PR12MB2701:|SN6PR12MB2701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB27011F8BCF064A4611869D9587EF0@SN6PR12MB2701.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0322B4EDE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(376002)(39850400004)(189003)(199004)(2906002)(4326008)(6512007)(81166006)(54906003)(86362001)(26005)(6506007)(6486002)(91956017)(71200400001)(66946007)(316002)(76116006)(8936002)(33656002)(186003)(6862004)(37006003)(5660300002)(66476007)(81156014)(66556008)(8676002)(2616005)(66446008)(478600001)(36756003)(6200100001)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2701;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RzjPwiEUDBEX9wooK7Dd8oYMXGaZ6wfqAQsVZfzMHITyBOjLBXrHqc20ZkK2oReQja8Yvjz4/pz/p4VgrNdr8GBU74hGcM7d1PVF/ZOUiZKtyGiAJcZf5CHUCAC/GjJ8acXOpVpEtVDNJvICb7ir3otjd+kNMsR4JqXI20fduw1J+FYh6P30r8FYfDS9F6AcAHn3SXu3V9Kx95NuJCRvsDaXBd5FEOJS7fTwd+mC0t3uxf/Bm/8BLVNSb5GgtGtuDrecD0GgFU6VSSdiZM8PiHJ+0peRSeDSg/ZEIIZYX0oMUwUCzwYBba6VNvYyHmVgBYQAs5TNUQu/U0JG4YcobmhNFjnZmohTno+rmgnSDnmnHodizimiQtLM9E9nkWqy/Sxw3XRkhuCYMAs32Pt+q53Z/ERvQjpCXa6DX4YZCETpFrI/53oEVeRYvNA2NJJ8
x-ms-exchange-antispam-messagedata: 1Rc54xbtlRhiQfeC3aivodNYD7FmYmBUyYugcpwUo3xhXxiLEao+qCzf8PDl+wAvLh08rSNssk7sUpIPradCrQH2n9jVb3y9GuTr5ky9sJvT2dsePiBpf4rI1r+e/4E5VecHbztU2JvD6nNAWS5Mwg==
Content-ID: <A4F89D194858DF48A02DF1C47BABA7E3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa160587-e381-44c7-4363-08d7b8580bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2020 12:00:59.0911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiTkeTsWc7GILbzpgsZ/Rigg//YFaOUEmm2VbSdoSJad28J1B/pvTHywUjLXbbM1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2701
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c29ycnksIHBhc3RlIGEgd3JvbmcgcGF0Y2guIHdpbGwgc2VuZCBvdXQgdjIuDQoNCg0KPiAyMDIw
5bm0MuaciDIz5pelIDE5OjU277yMUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4g5YaZ
6YGT77yaDQo+IA0KPiBJZiBzaGFyZWQgZmVuY2UgbGlzdCBpcyBub3QgZW1wdHksIGV2ZW4gd2Ug
d2FudCB0byB0ZXN0IGFsbCBmZW5jZXMsIGV4Y2wgZmVuY2UgaXMgaWdub3JlZC4NCj4gVGhhdCBp
cyBhYnZpb3VzbHkgd3JvbmcsIHNvIGZpeCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IHhpbmh1
aSBwYW4gPHhpbmh1aS5wYW5AYW1kLmNvbT4NCj4gLS0tDQo+IGRyaXZlcnMvZG1hLWJ1Zi9kbWEt
cmVzdi5jIHwgOSArKysrKy0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJl
c3YuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jDQo+IGluZGV4IDQyNjRlNjQ3ODhjNC4u
NDRkYzY0YzU0N2M2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYw0K
PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYw0KPiBAQCAtNjMyLDE0ICs2MzIsMTQg
QEAgc3RhdGljIGlubGluZSBpbnQgZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9zaW5nbGUoc3RydWN0
IGRtYV9mZW5jZSAqcGFzc2VkX2ZlbmNlKQ0KPiAgKi8NCj4gYm9vbCBkbWFfcmVzdl90ZXN0X3Np
Z25hbGVkX3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwgYm9vbCB0ZXN0X2FsbCkNCj4gew0KPiAt
CXVuc2lnbmVkIHNlcSwgc2hhcmVkX2NvdW50Ow0KPiArCXVuc2lnbmVkIGludCBzZXEsIHNoYXJl
ZF9jb3VudCwgbGVmdDsNCj4gCWludCByZXQ7DQo+IA0KPiAJcmN1X3JlYWRfbG9jaygpOw0KPiBy
ZXRyeToNCj4gCXJldCA9IHRydWU7DQo+IAlzaGFyZWRfY291bnQgPSAwOw0KPiAtCXNlcSA9IHJl
YWRfc2VxY291bnRfYmVnaW4oJm9iai0+c2VxKTsNCj4gKwlsZWZ0ID0gc2VxID0gcmVhZF9zZXFj
b3VudF9iZWdpbigmb2JqLT5zZXEpOw0KPiANCj4gCWlmICh0ZXN0X2FsbCkgew0KPiAJCXVuc2ln
bmVkIGk7DQo+IEBAIC02NDcsNyArNjQ3LDcgQEAgYm9vbCBkbWFfcmVzdl90ZXN0X3NpZ25hbGVk
X3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwgYm9vbCB0ZXN0X2FsbCkNCj4gCQlzdHJ1Y3QgZG1h
X3Jlc3ZfbGlzdCAqZm9iaiA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmZlbmNlKTsNCj4gDQo+IAkJ
aWYgKGZvYmopDQo+IC0JCQlzaGFyZWRfY291bnQgPSBmb2JqLT5zaGFyZWRfY291bnQ7DQo+ICsJ
CQlsZWZ0ID0gc2hhcmVkX2NvdW50ID0gZm9iai0+c2hhcmVkX2NvdW50Ow0KPiANCj4gCQlmb3Ig
KGkgPSAwOyBpIDwgc2hhcmVkX2NvdW50OyArK2kpIHsNCj4gCQkJc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UgPSByY3VfZGVyZWZlcmVuY2UoZm9iai0+c2hhcmVkW2ldKTsNCj4gQEAgLTY1NywxMyAr
NjU3LDE0IEBAIGJvb2wgZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9yY3Uoc3RydWN0IGRtYV9yZXN2
ICpvYmosIGJvb2wgdGVzdF9hbGwpDQo+IAkJCQlnb3RvIHJldHJ5Ow0KPiAJCQllbHNlIGlmICgh
cmV0KQ0KPiAJCQkJYnJlYWs7DQo+ICsJCQlsZWZ0LS07DQo+IAkJfQ0KPiANCj4gCQlpZiAocmVh
ZF9zZXFjb3VudF9yZXRyeSgmb2JqLT5zZXEsIHNlcSkpDQo+IAkJCWdvdG8gcmV0cnk7DQo+IAl9
DQo+IA0KPiAtCWlmICghc2hhcmVkX2NvdW50KSB7DQo+ICsJaWYgKCFsZWZ0KSB7DQo+IAkJc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2VfZXhjbCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmZlbmNlX2V4
Y2wpOw0KPiANCj4gCQlpZiAoZmVuY2VfZXhjbCkgew0KPiAtLSANCj4gMi4yMS4wIChBcHBsZSBH
aXQtMTIyKQ0KPiANCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
