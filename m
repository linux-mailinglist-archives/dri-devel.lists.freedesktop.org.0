Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8979455CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C24896F7;
	Fri, 14 Jun 2019 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AE588FF7;
 Thu, 13 Jun 2019 23:10:50 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5216.eurprd05.prod.outlook.com (20.178.12.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 13 Jun 2019 23:10:45 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 23:10:45 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: dev_pagemap related cleanups
Thread-Topic: dev_pagemap related cleanups
Thread-Index: AQHVIcx5DdVrUhs/HUiF5V2FmmsvzKaZ58OAgAAlLoCAAAtCgIAAHqKA
Date: Thu, 13 Jun 2019 23:10:45 +0000
Message-ID: <20190613231039.GE22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190613204043.GD22062@mellanox.com> <20190613212101.GA27174@lst.de>
In-Reply-To: <20190613212101.GA27174@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::18) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6deefc2c-1cfe-42b4-a481-08d6f0545d5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5216; 
x-ms-traffictypediagnostic: VI1PR05MB5216:
x-microsoft-antispam-prvs: <VI1PR05MB52161DFBA773BE4F896E6107CFEF0@VI1PR05MB5216.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(346002)(366004)(136003)(199004)(189003)(66446008)(64756008)(66476007)(66946007)(1076003)(7416002)(66556008)(73956011)(5660300002)(2906002)(8936002)(81156014)(26005)(8676002)(71200400001)(71190400001)(102836004)(256004)(6506007)(386003)(76176011)(86362001)(52116002)(486006)(99286004)(11346002)(446003)(4744005)(7116003)(2616005)(476003)(66066001)(6246003)(305945005)(33656002)(14454004)(25786009)(7736002)(6116002)(3846002)(4326008)(478600001)(54906003)(6916009)(36756003)(68736007)(6512007)(186003)(81166006)(6436002)(6486002)(316002)(53936002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5216;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IxerV2Ues/JSOcb8GLs2M1W5creYR/hSc2Ld7NaDx5lom/4gPQHVuDzz+iegaHaiak68YoBo1qmhTmWqPMNuSkxTUbVDMXKuD+y0MYQ+s148o+lJXY45QaReW0xTCbwj4fTWzHYpaVgpzyOI2uJGjuwe8zltTJyKEO+MbJPVH952uN+EGFGVWkIU0VwBnwdLoi/L7zVf4zyvko2537aRaFOVkWfyl2VO9zl8rGK2luIOihGZ8nCEfxFwMA3a3fs9GSSPfKJWGaMt2M06AQU/jZvaIfQtev7Y7HJI6lt7AVU7FDor+VuW5RzO0wnekKZou8W3toLRY+zBldGHKLLUUoWpjJihE6y4qwY2VvpWwKCfX/0BM5glNwMu0BPr3g1xu7K7ivPeEJiAMRgbFvD52ghJtJEYdA1bBTbY/VbQzx8=
Content-ID: <9DD504E2832E244190B09BBD35CAF05D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deefc2c-1cfe-42b4-a481-08d6f0545d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 23:10:45.6882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5216
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=739c5jQXQ0DYsV5q9yGUEJ3j5bapmAiM/he/yV381G8=;
 b=puGmflYjZFCuMlHhWT3QE5twzlouftmMldP/seG3MfaVrk/szmnlBQwflcPwHA5qHBdvpNlr0Ehq1pu9NgbvTfObVG4KcDZE5q2/IUSvXbgRf/4j6Jza9jw82Fn8p9yrYP4L3YI7cXQvUgFCt7/Je5ZOTooBYEI8LKLE7m5GxvY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6MjE6MDFQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6NDA6NDZQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBQZXJoYXBzIHdlIHNob3VsZCBwdWxsIHRob3NlIG91
dCBhbmQgcmVzZW5kIHRoZW0gdGhyb3VnaCBobW0uZ2l0Pwo+ID4gCj4gPiBJdCBjb3VsZCBiZSBk
b25lIC0gYnV0IGhvdyBiYWQgaXMgdGhlIGNvbmZsaWN0IHJlc29sdXRpb24/Cj4gCj4gVHJpdmlh
bC4gIEFsbCBidXQgb25lIHBhdGNoIGp1c3QgYXBwbHkgdXNpbmcgZ2l0LWFtLCBhbmQgdGhlIG90
aGVyIG9uZQo+IGp1c3QgaGFzIGEgZmV3IGxpbmVzIG9mIG9mZnNldHMuCgpPa2F5LCBOUCB0aGVu
LCB0cml2aWFsIG9uZXMgYXJlIE9LIHRvIHNlbmQgdG8gTGludXMuLgoKSWYgQW5kcmV3IGdldHMg
dGhlbSBpbnRvIC1yYzUgdGhlbiBJIHdpbGwgZ2V0IHJjNSBpbnRvIGhtbS5naXQgbmV4dAp3ZWVr
LgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
