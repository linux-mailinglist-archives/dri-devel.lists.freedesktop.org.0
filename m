Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA7455D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F9897BB;
	Fri, 14 Jun 2019 07:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888CB89944;
 Thu, 13 Jun 2019 19:37:30 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4703.eurprd05.prod.outlook.com (20.176.4.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:37:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:37:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/22] memremap: remove the data field in struct
 dev_pagemap
Thread-Topic: [PATCH 11/22] memremap: remove the data field in struct
 dev_pagemap
Thread-Index: AQHVIcyJQUnvCVRSIE2bb/Jw4XNupaaZ+z0A
Date: Thu, 13 Jun 2019 19:37:27 +0000
Message-ID: <20190613193722.GV22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-12-hch@lst.de>
In-Reply-To: <20190613094326.24093-12-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0026.prod.exchangelabs.com
 (2603:10b6:207:18::39) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 907cdff8-e256-466c-f3e4-08d6f036912d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4703; 
x-ms-traffictypediagnostic: VI1PR05MB4703:
x-microsoft-antispam-prvs: <VI1PR05MB4703809C46130FB7F4861F17CFEF0@VI1PR05MB4703.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:281;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(7736002)(81156014)(305945005)(8936002)(81166006)(478600001)(73956011)(6486002)(14454004)(86362001)(4744005)(4326008)(36756003)(6512007)(8676002)(33656002)(186003)(7416002)(5660300002)(1076003)(229853002)(99286004)(52116002)(386003)(76176011)(316002)(256004)(25786009)(2616005)(71190400001)(11346002)(476003)(26005)(446003)(68736007)(71200400001)(6436002)(66446008)(54906003)(66476007)(64756008)(486006)(66556008)(3846002)(53936002)(6116002)(66946007)(66066001)(6246003)(102836004)(6916009)(2906002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4703;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z4vP3UlC5xby6GoAzbIvFJnRyDvBvzto7/5u8I8QrQHRW7bdV+01Dd935kVu3GmRGelDhVwrMBg70UAGFS/gR5pOQFYjBuVg9zORQBnONNsY5Ed64myCE/K4zNNawxbPXaoR83hcA/qd5GfI/ddoc2pF66qJuOjG51b4kBZFlZxgM5Odjo6ThEfmyeJ3+cmXbeinYqi9sdVyHzfCSx2aESLdIhexmxRamCfh7QcCxb+5B99JEQ3uCfpuTFKJrX198C1qPTGkNdE41GmkK64PzqyRkbEDkQWbkEgIOdsT+EjY2wBdKBmM5u0MpztvNnpX0Ge2f1QdgEihksR3fcM2GkiTWOXSACyconHTTioeGVBx2vbReMo+Tarxm8YqRkbspisO33CqZRHJ9DW2ZYDScE4OFCrtlfnbbqtKm7AAg9M=
Content-ID: <9EE56540715B244EBE0C89B76768CFAF@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907cdff8-e256-466c-f3e4-08d6f036912d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:37:27.9159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4703
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqVMVbmuBMLCfrrJsLkvyOSYFtdu1jpJ2fCQlvBuFnA=;
 b=Qt3C9kNsuyNWRihe9lrn0qa7iUaXO6uzsV2nd+cx8JBB3gZ8ywF0zBRH3FE4lXFypy0IjTL9mpTH1w68WFIFh+xz9C38mH757ZYFqq2/8D+NmDYALJr1cUVuFcAuMw385iVa4sGMFGLCpmliyoBT1GqpGsQQLsApOFG576vtKZc=
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MTRBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gc3RydWN0IGRldl9wYWdlbWFwIGlzIGFsd2F5cyBlbWJlZGRlZCBpbnRvIGEg
Y29udGFpbmluZyBzdHJ1Y3R1cmUsIHNvCj4gdGhlcmUgaXMgbm8gbmVlZCB0byBhbiBhZGRpdGlv
bmFsIHByaXZhdGUgZGF0YSBmaWVsZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgZHJpdmVycy9udmRpbW0vcG1lbS5jICAgIHwgMiAr
LQo+ICBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggfCAzICstLQo+ICBrZXJuZWwvbWVtcmVtYXAu
YyAgICAgICAgfCAyICstCj4gIG1tL2htbS5jICAgICAgICAgICAgICAgICB8IDkgKysrKystLS0t
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKUmV2
aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KCkphc29uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
