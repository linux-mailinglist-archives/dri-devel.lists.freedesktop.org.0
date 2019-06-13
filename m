Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4556455D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6329897BC;
	Fri, 14 Jun 2019 07:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136E488F93;
 Thu, 13 Jun 2019 19:44:37 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5006.eurprd05.prod.outlook.com (20.177.52.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:44:34 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:44:34 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Topic: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Index: AQHVIcyVeqgMzBs0VkumwilsEzSkhqaZ/TwA
Date: Thu, 13 Jun 2019 19:44:34 +0000
Message-ID: <20190613194430.GY22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
In-Reply-To: <20190613094326.24093-19-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR01CA0013.prod.exchangelabs.com (2603:10b6:208:10c::26)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7181fa22-98f5-48dc-e792-08d6f0378f5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5006; 
x-ms-traffictypediagnostic: VI1PR05MB5006:
x-microsoft-antispam-prvs: <VI1PR05MB500620CDF68041957CED00D4CFEF0@VI1PR05MB5006.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(366004)(39860400002)(199004)(189003)(11346002)(33656002)(52116002)(486006)(99286004)(76176011)(7416002)(386003)(229853002)(2906002)(66066001)(102836004)(6506007)(54906003)(3846002)(6512007)(6916009)(6436002)(6486002)(186003)(26005)(476003)(446003)(2616005)(6116002)(36756003)(305945005)(64756008)(316002)(66446008)(8676002)(66556008)(66476007)(25786009)(68736007)(73956011)(5660300002)(66946007)(4326008)(81166006)(86362001)(7736002)(81156014)(14454004)(6246003)(8936002)(71200400001)(53936002)(478600001)(71190400001)(256004)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5006;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8o9AX6DKSupLoEBQPmNIAeDs0XsDzxWMu1ammaJCRZ4m0UtQkAp+mB9y3YXFw/KeMRqnlGJbmEkNS4Y1L55k+k28Axlvfg0OrC4JK371fZPUrZryDeShbLSLDLA7Oc5N8TWLi5lVvi120e+sDYIcCAPG+nMAqZ6OU0JcG6hpi4WpHdKfyZGHr2AMLp6V4ujTgRGRdotEDx/rdKJ3YC3pPwR6003PEgwgxKGyhVRsc3am/dDh/AO1Sy9weZniqKAdm+jfIU1lCdDFZdZyt1n75f1xwPd0uxiB335X0DZ7IcVL5VXGr2wPd12e/cGHxrRzso9KQMQs5neAeUu0/EdtT471kVIGagmjFgO/zeNLmx4RLbLPtKJEniKqapVzgxA16XfDryJb8ZhUt+0n7Lz7IV9KbJik/jVSlbJOjAPSopg=
Content-ID: <D44695B53F740940B0050C945B58AD6F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7181fa22-98f5-48dc-e792-08d6f0378f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:44:34.1111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5006
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvLGFdjYPSk5owAJMGCDMH03XFP7/53cVwVq6hBPuFo=;
 b=Ed2cJ/+YMNQ3gMgiL3hYsSLPcHfBcQYG5pSN5f6NxLHXfl3Kshr/DJnditakIoT/ustedGYwn3//KKVkqICj+Pd0TRdwHct9MtBrzsWRsbfQawdAu8Kyy5FT+mgxeiSwElMrMLFDN0jKOqHS050xEntjV2cZiWJtmqmx4VPiS6s=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MjFBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3YXMgYWRkZWQg
dG8gdGhlIHRyZWUsIGFuZCBkb2Vzbid0Cj4gYXBwZWFyIHRvIGFjdHVhbGx5IGJlIHVzYWJsZS4g
IE1hcmsgaXQgYXMgQlJPS0VOIHVudGlsIGVpdGhlciBhIHVzZXIKPiBjb21lcyBhbG9uZyBvciB3
ZSBmaW5hbGx5IGdpdmUgdXAgb24gaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4gIG1tL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmln
Cj4gaW5kZXggMGQyYmE3ZTFmNDNlLi40MDZmYTQ1ZTllY2MgMTAwNjQ0Cj4gKysrIGIvbW0vS2Nv
bmZpZwo+IEBAIC03MjEsNiArNzIxLDcgQEAgY29uZmlnIERFVklDRV9QUklWQVRFCj4gIGNvbmZp
ZyBERVZJQ0VfUFVCTElDCj4gIAlib29sICJBZGRyZXNzYWJsZSBkZXZpY2UgbWVtb3J5IChsaWtl
IEdQVSBtZW1vcnkpIgo+ICAJZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0KPiArCWRlcGVuZHMgb24g
QlJPS0VOCj4gIAlzZWxlY3QgSE1NCj4gIAlzZWxlY3QgREVWX1BBR0VNQVBfT1BTCgpUaGlzIHNl
ZW1zIGEgYml0IGhhcnNoLCB3ZSBkbyBoYXZlIGFub3RoZXIga2NvbmZpZyB0aGF0IHNlbGVjdHMg
dGhpcwpvbmUgdG9kYXk6Cgpjb25maWcgRFJNX05PVVZFQVVfU1ZNCiAgICAgICAgYm9vbCAiKEVY
UEVSSU1FTlRBTCkgRW5hYmxlIFNWTSAoU2hhcmVkIFZpcnR1YWwgTWVtb3J5KSBzdXBwb3J0Igog
ICAgICAgIGRlcGVuZHMgb24gQVJDSF9IQVNfSE1NCiAgICAgICAgZGVwZW5kcyBvbiBEUk1fTk9V
VkVBVQogICAgICAgIGRlcGVuZHMgb24gU1RBR0lORwogICAgICAgIHNlbGVjdCBITU1fTUlSUk9S
CiAgICAgICAgc2VsZWN0IERFVklDRV9QUklWQVRFCiAgICAgICAgZGVmYXVsdCBuCiAgICAgICAg
aGVscAogICAgICAgICAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBlbmFibGUgZXhwZXJpbWVu
dGFsIHN1cHBvcnQgZm9yCiAgICAgICAgICBTaGFyZWQgVmlydHVhbCBNZW1vcnkgKFNWTSkuCgpN
YXliZSBpdCBzaG91bGQgYmUgZGVwZW5kcyBvbiBTVEFHSU5HIG5vdCBicm9rZW4/CgpvciBtYXli
ZSBub3V2ZWF1X3N2bSBkb2Vzbid0IGFjdHVhbGx5IG5lZWQgREVWSUNFX1BSSVZBVEU/CgpKYXNv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
