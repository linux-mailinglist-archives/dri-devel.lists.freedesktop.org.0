Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E6455B5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC2E89483;
	Fri, 14 Jun 2019 07:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50068.outbound.protection.outlook.com [40.107.5.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3589725;
 Thu, 13 Jun 2019 18:30:31 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5584.eurprd05.prod.outlook.com (20.177.203.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 18:30:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 18:30:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/22] mm: remove the unused ARCH_HAS_HMM_DEVICE Kconfig
 option
Thread-Topic: [PATCH 01/22] mm: remove the unused ARCH_HAS_HMM_DEVICE Kconfig
 option
Thread-Index: AQHVIcx6m7GApB2g2EOjqyqCTmZIFaaZ6IgA
Date: Thu, 13 Jun 2019 18:30:28 +0000
Message-ID: <20190613183024.GN22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-2-hch@lst.de>
In-Reply-To: <20190613094326.24093-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:208:fc::45) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1ee3c6a-1509-419a-74b4-08d6f02d35ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5584; 
x-ms-traffictypediagnostic: VI1PR05MB5584:
x-microsoft-antispam-prvs: <VI1PR05MB558425A8B5EAF3873BF93F5BCFEF0@VI1PR05MB5584.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(366004)(189003)(199004)(11346002)(26005)(4326008)(8676002)(2906002)(446003)(73956011)(81166006)(81156014)(68736007)(316002)(8936002)(229853002)(66446008)(6512007)(6436002)(64756008)(25786009)(66946007)(66556008)(6486002)(66476007)(2616005)(476003)(7736002)(305945005)(186003)(53936002)(256004)(3846002)(1076003)(6116002)(6506007)(6246003)(33656002)(66066001)(386003)(14454004)(102836004)(4744005)(71190400001)(54906003)(86362001)(6916009)(71200400001)(36756003)(478600001)(486006)(5660300002)(99286004)(76176011)(7416002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5584;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eb3KNKd+VDg3aMK8Xechk52gl84tRX+UWpHdsOLNOQzeiT28ESmFj2R4yKBmX+NPNaW6nZgyRfR3xgOTcaQ1b4lRWF6pQAbCHEkPttsEIW1r8cu28CXaD45UV36dQZIooipJbaFiZTzELlXICo9wDON3UG7aNvg+R+cWUXcYJie9pdMNgKX5v3lkEcBent4N1kyPRMafc480EDdxGF4aAAmP5ip0yM9nDnluL/fQCgq8GXOGX7b3kOgug3OKimrxKxX837QgZlGE2fpggJ/ZDicu4ctD5be9CWPG3TpqcjUCqzn1BV4UmOojvh+hKxZkl1v7Z0lpZ+RXvTN9QxS06jX1iWzwcH93SIz/BXEzE46Prkw1Id4bz6tQ0K79DZqnttQrzX5GmktcE0O6ji7z3ox0jb5Tt89CDTzrmvMVFN0=
Content-ID: <1C3FD7879859344FA6C6020F72EC479A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ee3c6a-1509-419a-74b4-08d6f02d35ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 18:30:28.7061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5584
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0d+YLFD8dGkAwiCYZAtPwS2G6Ds7zR/M3jKY4RPVuk=;
 b=monCWH28lJ8KutFgYrbunH4n71O0rCyBxc5YAFfMijiC+36DWBjgRugr2jES4xlF5XZW4obgenyjgDDc9/IxSVr5yzCoI5cH1QauGF4qKClZYCrLY15EznN0ic2/4wRlPBtniXJKWIQFSIlRR23+0rxITpaOtgBm7uBPIcTdrA8=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MDRBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIG1tL0tjb25maWcgfCAxMCAtLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBkZWxldGlvbnMoLSkKClNvIGxvbmcgYXMgd2UgYXJlIHdpbGxpbmcgdG8gcnVuIGEgaG1tLmdp
dCB3ZSBjYW4gbWVyZ2Ugb25seSBjb21wbGV0ZQpmZWF0dXJlcyBnb2luZyBmb3J3YXJkLgoKVGh1
cyB3ZSBkb24ndCBuZWVkIHRoZSBjcmF6eSBwcm9jZXNzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UKdGhhdCAoZGVsaWJlcmF0ZWx5KSBpbnRyb2R1Y2VkIHRoaXMgdW51c2VkIGtjb25m
aWcuCgpJIGFsc28gdHJpZWQgdG8gZmluZCBzb21ldGhpbmcgaW4tZmxpZ2h0IGZvciA1LjMgdGhh
dCB3b3VsZCBuZWVkIHRoaXMKYW5kIGZvdW5kIG5vdGhpbmcKClJldmlld2VkLWJ5OiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
