Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6B9FD15
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3C6893AB;
	Wed, 28 Aug 2019 08:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740130.outbound.protection.outlook.com [40.107.74.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36DD89AAD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 00:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5+Z+3MIJzHE70M9ocnH9pXqtQMVKAX6ZNug9KxTGMFrlDUN/z/RlL9kx1rt2hO+dr0qpOzPHgs2P0vC7iqCtPp4Dibex20v2l616U+yWKrPdhtgDUuNPWyccuOo8NtLy0+ILFmVMITkUYz9+yASbPy5asljMUF5I0Jj6YUKAy7bzBxuu1c1tDJ/skXjRciQCuxgwWQOcTWFzoTvYSyr1BFPMavH8TcaqkJranWdC+yqWEc9JKHIpZaGA6B/mtG523G88/bJoBDEJTlSS+H+M4fEdLsRXsUNIlqGAYNgagJquDH5twKfmOU8Mgesy2KqLeTZ4dvvAip4B9bjItmY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2iX+rK5E1wYIf01Pl2R/6XP61dLrx3AZivaxIRkgFs=;
 b=Qu3DCSzQIDHe+WKj8ajbbku+0IqFDIZlIrAdCiv1yab5a7S4eqS8KSiiYshjZ06Kjn85XV1nO9FfOM/Lql8p+zU6j020ofNxpL9aVLa8lvqZFavb6z8CbDXimQABA1z7EH5BVwEOAgVhuoA1mCmMZbI80TwAyqgSWYhCw6CQM2QXIhqxEZVgU0KjOgFuOV+dYajQNvGkv0fI7VCXTGCK8L+Hv5hMuYWdLrNjhL1hJTGHUvQ9AvY2zTj0ijC55ItWrcDf4xRaOFHvmgyMhcN5fZFe31S2tM/2rRFXgSjcMG7+wwH0lCMnASFyAmxT14tFy594NlsJL12OMyAoIC6Tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0473.namprd21.prod.outlook.com (10.172.92.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.1; Wed, 28 Aug 2019 00:07:21 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a%7]) with mapi id 15.20.2241.000; Wed, 28 Aug 2019
 00:07:21 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "rdunlap@infradead.org"
 <rdunlap@infradead.org>, "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>, "info@metux.net"
 <info@metux.net>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>
Subject: RE: [PATHC v2] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATHC v2] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVXMoQkghsJmF5GU+6GBoMEWqB8KcPrJWw
Date: Wed, 28 Aug 2019 00:07:20 +0000
Message-ID: <DM5PR21MB0137969B8EB3146160C86A2DD7A30@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190827112421.2770-1-weh@microsoft.com>
In-Reply-To: <20190827112421.2770-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-28T00:07:19.1202362Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=87e41fa5-44a0-4c5f-8eea-bba2bafd67f3;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2001:4898:80e8:7:d0b9:e2d7:362d:146a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f10f638c-9f15-4bd8-5f18-08d72b4bb258
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR21MB0473; 
x-ms-traffictypediagnostic: DM5PR21MB0473:|DM5PR21MB0473:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB0473C2E862874362998B3516D7A30@DM5PR21MB0473.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(53936002)(46003)(7696005)(102836004)(74316002)(81156014)(81166006)(10290500003)(186003)(8676002)(6636002)(6246003)(2501003)(478600001)(1250700005)(446003)(11346002)(55016002)(476003)(6436002)(486006)(8936002)(9686003)(99286004)(7736002)(86362001)(76176011)(6506007)(1511001)(25786009)(305945005)(14454004)(2201001)(8990500004)(14444005)(6116002)(110136005)(256004)(229853002)(2906002)(66446008)(66556008)(76116006)(66946007)(64756008)(66476007)(10090500001)(5660300002)(22452003)(33656002)(316002)(7416002)(71200400001)(71190400001)(52536014)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0473;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JSlO/3GYY/FrniiwRzlDHfmber/pLkN3aOr82qxGJSxY1tFaO/s6HRtzy3iKg2MDUMfkH3NOXwsdzSS6TN0ssp6WQXp2aSfoMWoDDaMRpaqn9eSr6LkKEO45pxUZEIV9oi2iaVZhOTBy1LHjZKBT2a1dBcq+RrGzXS39LJQ2rXSwf5S5HsWHIv34ksxu3RF3HRZ3yPZouOGHYyVFdS3KwtvwvFjG8sVPkokJGSEGH5RjODBX02OPFtMpNbMunYWwjcGJDzpV/ZhmYReaLqokoXDof7+Ygl7hSwoUMpuZmKTN7PjyzX3C9eFB4KUqZNHppKABKFWSAeOsOuAum9T+dvz3Hbw6GzXljQ6vT95yoilZ9dmULdFXv95glH78nz5yz53r9snrr/HBzG72PFLUuaZO47I25zvi8IRz+YtW7NE=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10f638c-9f15-4bd8-5f18-08d72b4bb258
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 00:07:20.8653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNLVrm5H4skYrkxc4MPLKxhMCxhKfa/HIImynzcBsC8+u7pJSdkXkaFLjXXmTgzpQWtZl5hM8DYjfHyVXoTxNptJEpt8S9kwWt+4iLyNXp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0473
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2iX+rK5E1wYIf01Pl2R/6XP61dLrx3AZivaxIRkgFs=;
 b=nhyxTCM2LGmwkA/6EEgWu2GwHz7g0vUdVR7lJFg3Sc9w7QaEpnyu9L79McAvQcwJ+p0tc8M59clUsmNmPk0wBSLxcErjovSZNy8rHM6iy2y4vhJLQbhJiRCcoxWe7wyc4knNYGxzUUML1PSIlS3RoXBAByedmjQ7c125C0A+SKg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
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

RnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4gIFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAy
NywgMjAxOSA0OjI1IEFNCj4gCj4gV2l0aG91dCBkZWZlcnJlZCBJTyBzdXBwb3J0LCBoeXBlcnZf
ZmIgZHJpdmVyIGluZm9ybXMgdGhlIGhvc3QgdG8gcmVmcmVzaAo+IHRoZSBlbnRpcmUgZ3Vlc3Qg
ZnJhbWUgYnVmZmVyIGF0IGZpeGVkIHJhdGUsIGUuZy4gYXQgMjBIeiwgbm8gbWF0dGVyIHRoZXJl
Cj4gaXMgc2NyZWVuIHVwZGF0ZSBvciBub3QuIFRoaXMgcGF0Y2ggc3VwcG9ydHMgZGVmZXJyZWQg
SU8gZm9yIHNjcmVlbnMgaW4KPiBncmFwaGljcyBtb2RlIGFuZCBhbHNvIGVuYWJsZXMgdGhlIGZy
YW1lIGJ1ZmZlciBvbi1kZW1hbmQgcmVmcmVzaC4gVGhlCj4gaGlnaGVzdCByZWZyZXNoIHJhdGUg
aXMgc3RpbGwgc2V0IGF0IDIwSHouCj4gCj4gQ3VycmVudGx5IEh5cGVyLVYgb25seSB0YWtlcyBh
IHBoeXNpY2FsIGFkZHJlc3MgZnJvbSBndWVzdCBhcyB0aGUgc3RhcnRpbmcKPiBhZGRyZXNzIG9m
IGZyYW1lIGJ1ZmZlci4gVGhpcyBpbXBsaWVzIHRoZSBndWVzdCBtdXN0IGFsbG9jYXRlIGNvbnRp
Z3VvdXMKPiBwaHlzaWNhbCBtZW1vcnkgZm9yIGZyYW1lIGJ1ZmZlci4gSW4gYWRkaXRpb24sIEh5
cGVyLVYgR2VuIDIgVk1zIG9ubHkKPiBhY2NlcHQgYWRkcmVzcyBmcm9tIE1NSU8gcmVnaW9uIGFz
IGZyYW1lIGJ1ZmZlciBhZGRyZXNzLiBEdWUgdG8gdGhlc2UKPiBsaW1pdGF0aW9ucyBvbiBIeXBl
ci1WIGhvc3QsIHdlIGtlZXAgYSBzaGFkb3cgY29weSBvZiBmcmFtZSBidWZmZXIKPiBpbiB0aGUg
Z3Vlc3QuIFRoaXMgbWVhbnMgb25lIG1vcmUgY29weSBvZiB0aGUgZGlydHkgcmVjdGFuZ2xlIGlu
c2lkZQo+IGd1ZXN0IHdoZW4gZG9pbmcgdGhlIG9uLWRlbWFuZCByZWZyZXNoLiBUaGlzIGNhbiBi
ZSBvcHRpbWl6ZWQgaW4gdGhlCj4gZnV0dXJlIHdpdGggaGVscCBmcm9tIGhvc3QuIEZvciBub3cg
dGhlIGhvc3QgcGVyZm9ybWFuY2UgZ2FpbiBmcm9tIGRlZmVycmVkCj4gSU8gb3V0d2VpZ2hzIHRo
ZSBzaGFkb3cgY29weSBpbXBhY3QgaW4gdGhlIGd1ZXN0Lgo+IAo+IHYyOiBJbmNvcnBvcmF0ZWQg
cmV2aWV3IGNvbW1lbnRzIGZyb20gTWljaGFlbCBLZWxsZXkKPiAtIEluY3JlYXNlZCBkaXJ0eSBy
ZWN0YW5nbGUgYnkgb25lIHJvdyBpbiBkZWZlcnJlZCBJTyBjYXNlIHdoZW4gc2VuZGluZwo+IHRv
IEh5cGVyLVYuCj4gLSBDb3JyZWN0ZWQgdGhlIGRpcnR5IHJlY3RhbmdsZSBzaXplIGluIHRoZSB0
ZXh0IG1vZGUuCj4gLSBBZGRlZCBtb3JlIGNvbW1lbnRzLgo+IC0gT3RoZXIgbWlub3IgY29kZSBj
bGVhbnVwcy4KClZlcnNpb24gaGlzdG9yeSBzaG91bGQgZ28gYWZ0ZXIgdGhlICItLS0iIGJlbG93
IHNvIGl0IGlzIG5vdCBpbmNsdWRlZCBpbgp0aGUgY29tbWl0IG1lc3NhZ2UuCgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvS2NvbmZpZyAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVy
dl9mYi5jIHwgMjIxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjAyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+ICsvKiBEZWZl
cnJlZCBJTyBjYWxsYmFjayAqLwo+ICtzdGF0aWMgdm9pZCBzeW50aHZpZF9kZWZlcnJlZF9pbyhz
dHJ1Y3QgZmJfaW5mbyAqcCwKPiArCQkJCSBzdHJ1Y3QgbGlzdF9oZWFkICpwYWdlbGlzdCkKPiAr
ewo+ICsJc3RydWN0IGh2ZmJfcGFyICpwYXIgPSBwLT5wYXI7Cj4gKwlzdHJ1Y3QgcGFnZSAqcGFn
ZTsKPiArCXVuc2lnbmVkIGxvbmcgc3RhcnQsIGVuZDsKPiArCWludCB5MSwgeTIsIG1pbnksIG1h
eHk7Cj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsKPiArCW1pbnkgPSBJTlRfTUFYOwo+ICsJ
bWF4eSA9IDA7Cj4gKwo+ICsJLyoKPiArCSAqIE1lcmdlIGRpcnR5IHBhZ2VzLiBJdCBpcyBwb3Nz
aWJsZSB0aGF0IGxhc3QgcGFnZSBjcm9zcwo+ICsJICogb3ZlciB0aGUgZW5kIG9mIGZyYW1lIGJ1
ZmZlciByb3cgeXJlcy4gVGhpcyBpcyB0YWtlbiBjYXJlIG9mCj4gKwkgKiBpbiBzeW50aHZpZF91
cGRhdGUgZnVuY3Rpb24gYnkgY2xhbXBpbmcgdGhlIHkyCj4gKwkgKiB2YWx1ZSB0byB5cmVzLgo+
ICsJICovCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHBhZ2UsIHBhZ2VsaXN0LCBscnUpIHsKPiAr
CQlzdGFydCA9IHBhZ2UtPmluZGV4IDw8IFBBR0VfU0hJRlQ7Cj4gKwkJZW5kID0gc3RhcnQgKyBQ
QUdFX1NJWkUgLSAxOwo+ICsJCXkxID0gc3RhcnQgLyBwLT5maXgubGluZV9sZW5ndGg7Cj4gKwkJ
eTIgPSBlbmQgLyBwLT5maXgubGluZV9sZW5ndGg7Cj4gKwkJaWYgKHkyID4gcC0+dmFyLnlyZXMp
Cj4gKwkJCXkyID0gcC0+dmFyLnlyZXM7CgpUaGUgYWJvdmUgdGVzdCBzZWVtcyBjb250cmFkaWN0
b3J5IHRvIHRoZSBjb21tZW50IHRoYXQKc2F5cyB0aGUgY2xhbXBpbmcgaXMgZG9uZSBpbiBzeW50
aHZpZF91cGRhdGUoKS4gIEFsc28sIHNpbmNlCnRoZSBhYm92ZSBjYWxjdWxhdGlvbiBvZiB5MiBp
cyAiaW5jbHVzaXZlIiwgdGhlIGNsYW1waW5nIHNob3VsZApiZSBkb25lIHRvIHlyZXMgLSAxIGlu
IG9yZGVyIHRvIGNvbnRpbnVlIHRvIGJlIGluY2x1c2l2ZS4gIFRoZW4Kd2hlbiBtYXh5ICsgMSBp
cyBwYXNzZWQgdG8gc3ludGh2aWRfdXBkYXRlKCkgZXZlcnl0aGluZyB3b3JrcwpvdXQgY29ycmVj
dGx5LgoKPiArCQltaW55ID0gbWluX3QoaW50LCBtaW55LCB5MSk7Cj4gKwkJbWF4eSA9IG1heF90
KGludCwgbWF4eSwgeTIpOwo+ICsKPiArCQkvKiBDb3B5IGZyb20gZGlvIHNwYWNlIHRvIG1taW8g
YWRkcmVzcyAqLwo+ICsJCWlmIChwYXItPmZiX3JlYWR5KSB7Cj4gKwkJCXNwaW5fbG9ja19pcnFz
YXZlKCZwYXItPmRvY29weV9sb2NrLCBmbGFncyk7Cj4gKwkJCWh2ZmJfZG9jb3B5KHBhciwgc3Rh
cnQsIFBBR0VfU0laRSk7Cj4gKwkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBhci0+ZG9jb3B5
X2xvY2ssIGZsYWdzKTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJaWYgKHBhci0+ZmJfcmVhZHkpCj4g
KwkJc3ludGh2aWRfdXBkYXRlKHAsIDAsIG1pbnksIHAtPnZhci54cmVzLCBtYXh5ICsgMSk7Cj4g
K30KPiArCj4gK3N0YXRpYyBzdHJ1Y3QgZmJfZGVmZXJyZWRfaW8gc3ludGh2aWRfZGVmaW8gPSB7
Cj4gKwkuZGVsYXkJCT0gSFogLyAyMCwKPiArCS5kZWZlcnJlZF9pbwk9IHN5bnRodmlkX2RlZmVy
cmVkX2lvLAo+ICt9Owo+IAo+ICAvKgo+ICAgKiBBY3Rpb25zIG9uIHJlY2VpdmVkIG1lc3NhZ2Vz
IGZyb20gaG9zdDoKPiBAQCAtNjA0LDcgKzY4Myw3IEBAIHN0YXRpYyBpbnQgc3ludGh2aWRfc2Vu
ZF9jb25maWcoc3RydWN0IGh2X2RldmljZSAqaGRldikKPiAgCW1zZy0+dmlkX2hkci50eXBlID0g
U1lOVEhWSURfVlJBTV9MT0NBVElPTjsKPiAgCW1zZy0+dmlkX2hkci5zaXplID0gc2l6ZW9mKHN0
cnVjdCBzeW50aHZpZF9tc2dfaGRyKSArCj4gIAkJc2l6ZW9mKHN0cnVjdCBzeW50aHZpZF92cmFt
X2xvY2F0aW9uKTsKPiAtCW1zZy0+dnJhbS51c2VyX2N0eCA9IG1zZy0+dnJhbS52cmFtX2dwYSA9
IGluZm8tPmZpeC5zbWVtX3N0YXJ0Owo+ICsJbXNnLT52cmFtLnVzZXJfY3R4ID0gbXNnLT52cmFt
LnZyYW1fZ3BhID0gcGFyLT5tbWlvX3BwOwo+ICAJbXNnLT52cmFtLmlzX3ZyYW1fZ3BhX3NwZWNp
ZmllZCA9IDE7Cj4gIAlzeW50aHZpZF9zZW5kKGhkZXYsIG1zZyk7Cj4gCj4gQEAgLTYxNCw3ICs2
OTMsNyBAQCBzdGF0aWMgaW50IHN5bnRodmlkX3NlbmRfY29uZmlnKHN0cnVjdCBodl9kZXZpY2Ug
KmhkZXYpCj4gIAkJcmV0ID0gLUVUSU1FRE9VVDsKPiAgCQlnb3RvIG91dDsKPiAgCX0KPiAtCWlm
IChtc2ctPnZyYW1fYWNrLnVzZXJfY3R4ICE9IGluZm8tPmZpeC5zbWVtX3N0YXJ0KSB7Cj4gKwlp
ZiAobXNnLT52cmFtX2Fjay51c2VyX2N0eCAhPSBwYXItPm1taW9fcHApIHsKPiAgCQlwcl9lcnIo
IlVuYWJsZSB0byBzZXQgVlJBTSBsb2NhdGlvblxuIik7Cj4gIAkJcmV0ID0gLUVOT0RFVjsKPiAg
CQlnb3RvIG91dDsKPiBAQCAtNjMxLDE5ICs3MTAsODIgQEAgc3RhdGljIGludCBzeW50aHZpZF9z
ZW5kX2NvbmZpZyhzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2KQo+IAo+ICAvKgo+ICAgKiBEZWxheWVk
IHdvcmsgY2FsbGJhY2s6Cj4gLSAqIEl0IGlzIGNhbGxlZCBhdCBIVkZCX1VQREFURV9ERUxBWSBv
ciBsb25nZXIgdGltZSBpbnRlcnZhbCB0byBwcm9jZXNzCj4gLSAqIHNjcmVlbiB1cGRhdGVzLiBJ
dCBpcyByZS1zY2hlZHVsZWQgaWYgZnVydGhlciB1cGRhdGUgaXMgbmVjZXNzYXJ5Lgo+ICsgKiBJ
dCBpcyBzY2hlZHVsZWQgdG8gY2FsbCB3aGVuZXZlciB1cGRhdGUgcmVxdWVzdCBpcyByZWNlaXZl
ZCBhbmQgaXQgaGFzCj4gKyAqIG5vdCBiZWVuIGNhbGxlZCBpbiBsYXN0IEhWRkJfT05ERU1BTkRf
VEhST1RUTEUgdGltZSBpbnRlcnZhbC4KPiAgICovCj4gIHN0YXRpYyB2b2lkIGh2ZmJfdXBkYXRl
X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3KQo+ICB7Cj4gIAlzdHJ1Y3QgaHZmYl9wYXIgKnBh
ciA9IGNvbnRhaW5lcl9vZih3LCBzdHJ1Y3QgaHZmYl9wYXIsIGR3b3JrLndvcmspOwo+ICAJc3Ry
dWN0IGZiX2luZm8gKmluZm8gPSBwYXItPmluZm87Cj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ICsJaW50IHgxLCB4MiwgeTEsIHkyOwo+ICsJaW50IGo7Cj4gKwo+ICsJc3Bpbl9sb2NrX2lycXNh
dmUoJnBhci0+ZGVsYXllZF9yZWZyZXNoX2xvY2ssIGZsYWdzKTsKPiArCS8qIFJlc2V0IHRoZSBy
ZXF1ZXN0IGZsYWcgKi8KPiArCXBhci0+ZGVsYXllZF9yZWZyZXNoID0gZmFsc2U7Cj4gKwo+ICsJ
LyogU3RvcmUgdGhlIGRpcnR5IHJlY3RhbmdsZSB0byBsb2NhbCB2YXJpYWJsZXMgKi8KPiArCXgx
ID0gcGFyLT54MTsKPiArCXgyID0gcGFyLT54MjsKPiArCXkxID0gcGFyLT55MTsKPiArCXkyID0g
cGFyLT55MjsKPiArCj4gKwkvKiBDbGVhciBkaXJ0eSByZWN0YW5nbGUgKi8KPiArCXBhci0+eDEg
PSBwYXItPnkxID0gSU5UX01BWDsKPiArCXBhci0+eDIgPSBwYXItPnkyID0gMDsKPiArCj4gKwlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZwYXItPmRlbGF5ZWRfcmVmcmVzaF9sb2NrLCBmbGFncyk7
Cj4gCj4gKwlpZiAoeDEgPCAwIHx8IHgxID4gaW5mby0+dmFyLnhyZXMgfHwgeDIgPCAwIHx8Cj4g
KwkgICAgeDIgPiBpbmZvLT52YXIueHJlcyB8fCB5MSA8IDAgfHwgeTEgPiBpbmZvLT52YXIueXJl
cyB8fAo+ICsJICAgIHkyIDwgMCB8fCB5MiA+IGluZm8tPnZhci55cmVzIHx8IHgyIDw9IHgxKQo+
ICsJCXJldHVybjsKCkFyZSB0aGUgdGVzdHMgZm9yIGxlc3MgdGhhbiAwIG5lZWRlZD8gIEkgdGhp
bmsgYWxsIHBvc3NpYmlsaXR5IG9mCm5lZ2F0aXZlIHZhbHVlcyBoYXMgYmVlbiBlbGltaW5hdGVk
LgoKPiArCj4gKwkvKiBDb3B5IHRoZSBkaXJ0eSByZWN0YW5nbGUgdG8gZnJhbWUgYnVmZmVyIG1l
bW9yeSAqLwo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJnBhci0+ZG9jb3B5X2xvY2ssIGZsYWdzKTsK
PiArCWZvciAoaiA9IHkxOyBqIDwgeTI7IGorKykgewo+ICsJCWlmIChqID09IGluZm8tPnZhci55
cmVzKQo+ICsJCQlicmVhazsKClRoZSBhYm92ZSB0ZXN0IGlzbid0IG5lZWRlZC4gIFRoZSBtYXhp
bXVtIHZhbHVlIHRoYXQgeTIgY2FuIGJlCmlzIHlyZXMgKHRoYXQgaXMgY2hlY2tlZCBhIGZldyBs
aW5lcyBhYm92ZSBpbiB0aGUgYmlnICJpZiIgc3RhdGVtZW50KS4KU2luY2UgaiBpcyBhbHdheXMg
bGVzcyB0aGFuIHkyLCBqIGNhbiBuZXZlciBiZSBlcXVhbCB0byB5cmVzLgoKPiArCQlodmZiX2Rv
Y29weShwYXIsCj4gKwkJCSAgICBqICogaW5mby0+Zml4LmxpbmVfbGVuZ3RoICsKPiArCQkJICAg
ICh4MSAqIHNjcmVlbl9kZXB0aCAvIDgpLAo+ICsJCQkgICAgKHgyIC0geDEpICogc2NyZWVuX2Rl
cHRoIC8gOCk7Cj4gKwl9Cj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwYXItPmRvY29weV9s
b2NrLCBmbGFncyk7Cj4gKwo+ICsJLyogUmVmcmVzaCAqLwo+ICAJaWYgKHBhci0+ZmJfcmVhZHkp
Cj4gLQkJc3ludGh2aWRfdXBkYXRlKGluZm8pOwo+ICsJCXN5bnRodmlkX3VwZGF0ZShpbmZvLCB4
MSwgeTEsIHgyLCB5Mik7Cj4gK30KPiArCgpNaWNoYWVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
