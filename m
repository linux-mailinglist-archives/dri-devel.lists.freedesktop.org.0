Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0B5B132
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E43889CF6;
	Sun, 30 Jun 2019 18:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00055.outbound.protection.outlook.com [40.107.0.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752A46E993;
 Sat, 29 Jun 2019 01:26:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=dVU6EjM1E6sxjJV1Gh08uUh3hZgW2aEc3e8MWgnCa9z6NxRGFGvtE7dWjc9FxlA/7ipboaqtDXPFEFThrX4PxN5qxzddkagn8ddx1o5zIMzfdghpojVylG2Om7rg7DnxYSxLS6Xl/KfP1nZyIOEIPifQI53fHKgyz1bmOKJ+5/o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag+6jEF+F6+OokBA0HD2aBHg7vs3K7kaRFcBJ0RKsFU=;
 b=gLDGta1UziHzN+lOtMnklHQ0EMwk4eYGvLcbFeEPT5xSQi3/iPL576mUPDvv+iYx2ljTU16wD9cbdliG2Dx4BDn7CETMKLq+VUMUp0Yk0y3DlOjIz0uHLbxxx/c2p+PGR/AvgPRk549l9iF9JyuvPxQDJdXsk7R1wX0HVbxN3r8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB5448.eurprd05.prod.outlook.com (20.177.123.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sat, 29 Jun 2019 01:26:51 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::9115:7752:2368:e7ec]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::9115:7752:2368:e7ec%4]) with mapi id 15.20.2008.017; Sat, 29 Jun 2019
 01:26:51 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, "Felix.Kuehling@amd.com"
 <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v4 hmm 00/12]
Thread-Topic: [PATCH v4 hmm 00/12]
Thread-Index: AQHVKtAUPOKL68Liy0elJQpXS2vDJqax3ckA
Date: Sat, 29 Jun 2019 01:26:51 +0000
Message-ID: <20190629012642.GA22386@mellanox.com>
References: <20190624210110.5098-1-jgg@ziepe.ca>
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [207.164.2.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3cd0919-d863-4e93-f241-08d6fc30dc17
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR05MB5448; 
x-ms-traffictypediagnostic: DB7PR05MB5448:
x-microsoft-antispam-prvs: <DB7PR05MB5448226E2534D95BB92B52B0CFFF0@DB7PR05MB5448.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0083A7F08A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(39850400004)(136003)(346002)(54164003)(189003)(199004)(7416002)(11346002)(66066001)(36756003)(68736007)(25786009)(26005)(4326008)(71190400001)(446003)(6506007)(14444005)(33656002)(256004)(486006)(316002)(478600001)(2616005)(54906003)(2501003)(102836004)(110136005)(66556008)(99286004)(71200400001)(386003)(2906002)(66446008)(305945005)(73956011)(3846002)(64756008)(86362001)(476003)(8936002)(14454004)(66476007)(52116002)(6246003)(7736002)(229853002)(81156014)(6486002)(81166006)(53936002)(5660300002)(8676002)(66946007)(76176011)(6116002)(6512007)(1076003)(6436002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB5448;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uNvFoRmVGDVSHhDEFJZzAgE/XcB/C+Ez+jYnevegu9gBRMSBrlSAD+espuT54aQNqZA97MiUgQoBSQAgl7WGN2tX5rEpdQ96Is1Pz2p9HZmhKMg98vQjAcPXCmOV882cuwrIEIG7qpZ4WGaJsOQ9dSpdFtCA9ODIWadC3lwLDUR/eRWpNOcAs2DFnvz2HTONoOkTA8aXwOBQ57O5cvYS7/DoDtZR0V1eYh++iVVUHMJVh3DXAwoBEYEF3I2pbO4/nVsUK7FmvB/BWEOOOujyX1eLttwYF9w8vhgJpLgLCsB7oyBhMdFJj/UgTrgPXJUrTbfpS1uca3TgeXNSyH5QjVCYvBymRtS91AkpT5mg8T5Yivan29Dwpm5C21eA5OoKL/5HL1g9cjXhDxUmD6y1qXLKOuOQBL9gT3T60TFI02U=
Content-ID: <381E97B2C5DFB24EBF1D7DB5781C70C6@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cd0919-d863-4e93-f241-08d6fc30dc17
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2019 01:26:51.2633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB5448
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag+6jEF+F6+OokBA0HD2aBHg7vs3K7kaRFcBJ0RKsFU=;
 b=MPuo611VLENAsSCMac887wZ1q0uSeQOnghN9SEksR5gFupwSEJ2wwRL4Ls5ezorPjSn6v8AsZL/38HHQSaI4P/Gj44T0KFJMh4Ui1GYOTWBmgG7cwtOsDlMLo+i2RxpYJM6y4Hycvx1E0vcUeSwXcpmwi09TElAmHUVDagX7Afk=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDY6MDA6NThQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBU
aGlzIHBhdGNoIHNlcmllcyBhcmlzZWQgb3V0IG9mIGRpc2N1c3Npb25zIHdpdGggSmVyb21lIHdo
ZW4gbG9va2luZyBhdCB0aGUKPiBPRFAgY2hhbmdlcywgcGFydGljdWxhcmx5IGluZm9ybWVkIGJ5
IHVzZSBhZnRlciBmcmVlIHJhY2VzIHdlIGhhdmUgYWxyZWFkeQo+IGZvdW5kIGFuZCBmaXhlZCBp
biB0aGUgT0RQIGNvZGUgKHRoYW5rcyB0byBzeXprYWxsZXIpIHdvcmtpbmcgd2l0aCBtbXUKPiBu
b3RpZmllcnMsIGFuZCB0aGUgZGlzY3Vzc2lvbiB3aXRoIFJhbHBoIG9uIGhvdyB0byByZXNvbHZl
IHRoZSBsaWZldGltZSBtb2RlbC4KPiAKPiBPdmVyYWxsIHRoaXMgYnJpbmdzIGluIGEgc2ltcGxp
ZmllZCBsb2NraW5nIHNjaGVtZSBhbmQgZWFzeSB0byBleHBsYWluCj4gbGlmZXRpbWUgbW9kZWw6
Cj4gCj4gIElmIGEgaG1tX3JhbmdlIGlzIHZhbGlkLCB0aGVuIHRoZSBobW0gaXMgdmFsaWQsIGlm
IGEgaG1tIGlzIHZhbGlkIHRoZW4gdGhlIG1tCj4gIGlzIGFsbG9jYXRlZCBtZW1vcnkuCj4gCj4g
IElmIHRoZSBtbSBuZWVkcyB0byBzdGlsbCBiZSBhbGl2ZSAoaWUgdG8gbG9jayB0aGUgbW1hcF9z
ZW0sIGZpbmQgYSB2bWEsIGV0YykKPiAgdGhlbiB0aGUgbW1nZXQgbXVzdCBiZSBvYnRhaW5lZCB2
aWEgbW1nZXRfbm90X3plcm8oKS4KPiAKPiBUaGUgdXNlIG9mIHVubG9ja2VkIHJlYWRzIG9uICdo
bW0tPmRlYWQnIGFyZSBhbHNvIGVsaW1pbmF0ZWQgaW4gZmF2b3VyIG9mCj4gdXNpbmcgc3RhbmRh
cmQgbW1nZXQoKSBsb2NraW5nIHRvIHByZXZlbnQgdGhlIG1tIGZyb20gYmVpbmcgcmVsZWFzZWQu
IE1hbnkgb2YKPiB0aGUgZGVidWdnaW5nIGNoZWNrcyBvZiAhcmFuZ2UtPmhtbSBhbmQgIWhtbS0+
bW0gYXJlIGRyb3BwZWQgaW4gZmF2b3VyIG9mCj4gcG9pc29uIC0gd2hpY2ggaXMgbXVjaCBjbGVh
cmVyIGFzIHRvIHRoZSBsaWZldGltZSBpbnRlbnQuCj4gCj4gVGhlIHRyYWlsaW5nIHBhdGNoZXMg
YXJlIGp1c3Qgc29tZSByYW5kb20gY2xlYW51cHMgSSBub3RpY2VkIHdoZW4gcmV2aWV3aW5nCj4g
dGhpcyBjb2RlLgo+IAo+IEknbGwgYXBwbHkgdGhpcyBpbiB0aGUgbmV4dCBmZXcgZGF5cyAtIHRo
ZSBvbmx5IHBhdGNoIHRoYXQgZG9lc24ndCBoYXZlIGVub3VnaAo+IFJldmlld2VkLWJ5cyBpcyAn
bW0vaG1tOiBSZW1vdmUgY29uZnVzaW5nIGNvbW1lbnQgYW5kIGxvZ2ljIGZyb20gaG1tX3JlbGVh
c2UnLAo+IHdoaWNoIGhhZCBhbG90IG9mIHF1ZXN0aW9ucywgSSBzdGlsbCB0aGluayBpdCBpcyBn
b29kLiBJZiBwZW9wbGUgcmVhbGx5IGRvbid0Cj4gbGlrZSBpdCBJJ2xsIGRyb3AgaXQuCj4gCj4g
VGhhbmtzIHRvIGV2ZXJ5b25lIHdobyB0b29rIHRpbWUgdG8gbG9vayBhdCB0aGlzIQo+IAo+IEph
c29uIEd1bnRob3JwZSAoMTIpOgo+ICAgbW0vaG1tOiBmaXggdXNlIGFmdGVyIGZyZWUgd2l0aCBz
dHJ1Y3QgaG1tIGluIHRoZSBtbXUgbm90aWZpZXJzCj4gICBtbS9obW06IFVzZSBobW1fbWlycm9y
IG5vdCBtbSBhcyBhbiBhcmd1bWVudCBmb3IgaG1tX3JhbmdlX3JlZ2lzdGVyCj4gICBtbS9obW06
IEhvbGQgYSBtbWdyYWIgZnJvbSBobW0gdG8gbW0KPiAgIG1tL2htbTogU2ltcGxpZnkgaG1tX2dl
dF9vcl9jcmVhdGUgYW5kIG1ha2UgaXQgcmVsaWFibGUKPiAgIG1tL2htbTogUmVtb3ZlIGR1cGxp
Y2F0ZSBjb25kaXRpb24gdGVzdCBiZWZvcmUgd2FpdF9ldmVudF90aW1lb3V0Cj4gICBtbS9obW06
IERvIG5vdCB1c2UgbGlzdCpfcmN1KCkgZm9yIGhtbS0+cmFuZ2VzCj4gICBtbS9obW06IEhvbGQg
b24gdG8gdGhlIG1tZ2V0IGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIHJhbmdlCj4gICBtbS9obW06
IFVzZSBsb2NrZGVwIGluc3RlYWQgb2YgY29tbWVudHMKPiAgIG1tL2htbTogUmVtb3ZlIHJhY3kg
cHJvdGVjdGlvbiBhZ2FpbnN0IGRvdWJsZS11bnJlZ2lzdHJhdGlvbgo+ICAgbW0vaG1tOiBQb2lz
b24gaG1tX3JhbmdlIGR1cmluZyB1bnJlZ2lzdGVyCj4gICBtbS9obW06IFJlbW92ZSBjb25mdXNp
bmcgY29tbWVudCBhbmQgbG9naWMgZnJvbSBobW1fcmVsZWFzZQo+ICAgbW0vaG1tOiBGaXggZXJy
b3IgZmxvd3MgaW4gaG1tX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKCkkgdGhpbmsgd2UgYXJlIGRv
bmUgbm93LCBzbyBhcHBsaWVkIHRvIGhtbS5naXQsIHRoYW5rIHlvdSB0byBldmVyeW9uZS4KCkkg
ZXhwZWN0IHNvbWUgY29uZmxpY3RzIGluIGxpbnV4LW5leHQgd2l0aCB0aGUgQU1EIERSTSBkcml2
ZXIsIHdlIG5lZWQKdG8gZGVjaWRlIGhvdyB0byBoYW5kbGUgdGhlbS4KCkphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
