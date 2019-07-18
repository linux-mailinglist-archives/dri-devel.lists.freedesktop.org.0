Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760166CEAC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A8D89CFA;
	Thu, 18 Jul 2019 13:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064BA89CFA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZeheSzNe7RPXfY+mDW6U4F2iF9CVeWqLAUsPJGxxte7ddxoTFmDPDhNxFHHWe5SpibmlER5xIIzhuLr940VaPwhqmPkoShRxej7L28M2IJL7vXSRsOa89ENwCRIqIYOdnloYuIuMx3avMb0dl0GXBZl3aVkVb8XqMWmC/YY5kZYEbBGr19Odrk9Lih7Fy0Kc+w/KQswg1GMUneCVM8hgv9pwZtc3ua9eL4boBXKpLyHyTxuE40lbkgu6yfhgL1BiS7hH3WNhke7eWw7NG1GJoT+OCXgncM6lkIqp0MLrw90Hke3YpU1an1fLVe43RP6GjVyxK9GfY5lUVx+D12Vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VXwF0RayYtasJbS8qCrjL+1/4JU/LfuQsDJrNlFzfE=;
 b=Qo1kIklVVDXvVRsFRhitnkSq0TUjLByhJgBwmJ6hLVajcO/KYLwILLiPhmTwDRwvJylsvrxTGN0TPdDdMR1fR73jbJTThpUvFBZ4MzhOt9TVMKtAlfFikK7AuAUpXugmrc9nHYLvjNEbYWlCo1Aq/Ej3TEF46DIPJ08AKL7Rlwudnj3roOHKcT3RoxVVshIZHHI7ngnDwoNeOm3F/05swC7Bv5vZiD4LS55sWNwAgaFdaiJdJx7nH/VFLA4gSZ1Sz3X5vk/1SJzmhPlMNTpbqpO/tjNzwb4SAMyO43KGvYCaUt1AZ84N3PGMDfqqfKYD9HnahGXl8+ERk/ypV+kWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3646.namprd12.prod.outlook.com (20.178.241.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 13:15:49 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:15:49 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Topic: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Index: AQHVPVnoqE0gPkoYWUCt/IPkTJivbabQOm8AgAAdSYCAAAH9AIAAAUUA
Date: Thu, 18 Jul 2019 13:15:49 +0000
Message-ID: <e38b9278-21d7-d4d5-0362-0c63b9f4a6aa@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
 <8343b732-2e4b-31f0-9e68-18171977a606@amd.com>
 <156345544398.24728.3877059803253335858@skylake-alporthouse-com>
In-Reply-To: <156345544398.24728.3877059803253335858@skylake-alporthouse-com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::18) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e7e458b-380e-4e52-8c4a-08d70b820cdd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3646; 
x-ms-traffictypediagnostic: MN2PR12MB3646:
x-microsoft-antispam-prvs: <MN2PR12MB36465727132F8178CBF86FBCB4C80@MN2PR12MB3646.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(189003)(199004)(14454004)(31686004)(102836004)(99286004)(26005)(6246003)(52116002)(66066001)(36756003)(2906002)(2616005)(11346002)(2501003)(446003)(386003)(186003)(6116002)(6506007)(4744005)(6486002)(6512007)(3846002)(76176011)(229853002)(8936002)(256004)(71200400001)(71190400001)(110136005)(6436002)(478600001)(66946007)(64756008)(5660300002)(66476007)(66446008)(66556008)(316002)(53936002)(68736007)(486006)(8676002)(81156014)(305945005)(31696002)(7736002)(476003)(81166006)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3646;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zwwErrhNXOGwqgLVyLTqPY0LMlf5hqw8eyb0zNN0pY9ArlC0A0GkGFjyFdLSLT+iBoX5TgveQ8GlFeS/MPBmLojE8yeEcLEg+5H8vDLtEpDevAPQCJfoO4zHCR9MH6o3Ze+CCkyDQvVfwxste6YYPb+4tdeq6BOcfh4VHbb/PGKw8di/3NAVRBiaD0HXHi/IXxSXe4VgK29IB7kfX0dFDNBRVQJz+JrE/SJn3EqrrT1vNZI2H6wOzUPfdZSWi0I8my3pdUBCa+BucVnIMiZKWfdIS4FqUD4hJtyyP9EhUtpjtxUxZMozCLGUc31P9ssQ+rvwN9Co59U25kV4N8aG3W/spZtn8mhLNM96STqd+R1+17IcqSll1aEmIkOBKoUP6VsPwIx5mUmv5aCcye8SuVj0kcoxe/Dk+KiP71r3TAw=
Content-ID: <A0A2B4BC6EB76C46B96A0BA89C423D36@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7e458b-380e-4e52-8c4a-08d70b820cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:15:49.0521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3646
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VXwF0RayYtasJbS8qCrjL+1/4JU/LfuQsDJrNlFzfE=;
 b=G94wEG74ySjPF/FwxAetOQ+4Hgb2DSLCB0a6O1YY3aGeamCXkyolo2t4gdEzFIaPeGd0i27d4P7hbkYTo78332BkZ+eZB5gF0AnHsg1HviKQYn1S6dY7DOveDErua/1ovRHw+FIk6cq+A49qpbagMiTH6uR9PKPkWYuveoJn4zg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQrlnKggMjAxOS83LzE4IDIxOjEwLCBDaHJpcyBXaWxzb24g5YaZ6YGTOg0KPiBRdW90aW5nIENo
dW5taW5nIFpob3UgKDIwMTktMDctMTggMTQ6MDQ6MDkpDQo+PiDlnKggMjAxOS83LzE4IDE5OjE4
LCBDaHJpcyBXaWxzb24g5YaZ6YGTOg0KPj4+IFF1b3RpbmcgQ2h1bm1pbmcgWmhvdSAoMjAxOS0w
Ny0xOCAxMjoxMzozOSkNCj4+Pj4gaWYgV0FJVF9GT1JfU1VCTUlUIGlzbid0IHNldCBhbmQgaW4g
dGhlIG1lYW53aGlsZSBubyB1bmRlcmx5aW5nIGZlbmNlIG9uIHN5bmNvYmosDQo+Pj4+IHRoZW4g
cmV0dXJuIG5vbi1ibG9jayBlcnJvciBjb2RlIHRvIHVzZXIgc2FwY2UuDQo+Pj4gQmxvY2sgZGV2
aWNlIHJlcXVpcmVkPw0KPj4gWWVzLCBpZiBXQUlUX0ZPUl9TVUJNSVQgaXMgc2V0LCB0aGVuIHRo
YXQgd2lsbCBibG9jayBkZXZpY2UuDQo+IE5vLCB0aGUgZXJyb3IgbWVzc2FnZSBpcyB0aGF0IGl0
IHJlcXVpcmVzIGEgImJsb2NrIGRldmljZSIsIG5vdCB0aGF0IGl0DQo+IHdpbGwgYmxvY2sgdGhl
IGRldmljZSwgd2hpY2ggaXMgRVdPVUxEQkxPQ0suDQoNCk9LLCBJIGdvdCB5b3VyIG1lYW4uDQoN
CkFueSBvdGhlciBwb3NzaWxlIHZhbHVlIHN1Z2dlc3R0ZWQ/DQoNCi1EYXZpZA0KDQo+IC1DaHJp
cw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
