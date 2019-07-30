Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3657BA69
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72BD6E6A2;
	Wed, 31 Jul 2019 07:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10069.outbound.protection.outlook.com [40.107.1.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF36A8970B;
 Tue, 30 Jul 2019 12:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnipSeZ1TwdqRUp/Ibef4dS5jP4UljSoyudXEEnO5tgaImHr5lHsIyRedQcyMBX4XFrMqlQiyFUI00wVe9BAzpPYSlT088BMtOdnd1SkKYI+OsrUYrqtVj7z463YpjoRkuFVlo4JMhhweqRD0o7dNbT5ZoKWqa/uncOmFLsKglUlhcJTTRsDD4pgxVaSzZ+H7ZWTfj6/zEHjwBugMFTYhuB89Luxl0Hvcybx5u34w7FxpS8RhR5yIvWgdLwuRPVeD0d7jc96nX93WBdFwjMvARTSdCUsSuY3s8XAj6xfkpLKVsN+R7oTMp+rsLJb9hHTLsGvlxNHPH4hcAgiR16qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/7vNZNyn0FFqNh/w4tptPQMmYuaBbYryJLl0cm5OSs=;
 b=GR8k4UpgU3efvLqhu8oP2HbayFELnTVwG7NIIG4dElgbsIoYa1tcvM4x6Lx1X075HaBcnh16C/BJJBVERtyA0WueBSugC+NiIy5jSz3ahY2cPKPEMZPBUo8FOdc0T1zLnz7Rgc2Z8gJAhWyiVPhUxkgmO3T1m2onejKS35fizhpwlJ4U4i71dItCrpFQm43u5is+XeMS0lM16Y6DdMraawirimrv6Pbny0quyLzBc42YqaX31CI3KPQGfKobZzlNbXdKZNK62Mj+a0dUpgRr6qUNMGMTJzoasPcPJLhLbpIVqR3Bwgo+pj7G6w3oRUtav2sfiPnIN1UOtnUAvMPCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6079.eurprd05.prod.outlook.com (20.178.204.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 12:45:22 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:45:22 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/13] mm: remove the unused vma argument to
 hmm_range_dma_unmap
Thread-Topic: [PATCH 05/13] mm: remove the unused vma argument to
 hmm_range_dma_unmap
Thread-Index: AQHVRpr6u0kOQaNySU6qr8LRJOBbn6bjHBGA
Date: Tue, 30 Jul 2019 12:45:22 +0000
Message-ID: <20190730124517.GE24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-6-hch@lst.de>
In-Reply-To: <20190730055203.28467-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::36) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55501426-92a3-498b-08b1-08d714ebc934
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6079; 
x-ms-traffictypediagnostic: VI1PR05MB6079:
x-microsoft-antispam-prvs: <VI1PR05MB60795EB36AC26291165643D4CFDC0@VI1PR05MB6079.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(36756003)(3846002)(6116002)(305945005)(7736002)(76176011)(2906002)(4326008)(102836004)(6436002)(186003)(6916009)(478600001)(7416002)(316002)(71190400001)(229853002)(71200400001)(26005)(14454004)(446003)(11346002)(52116002)(25786009)(54906003)(6506007)(6486002)(256004)(6512007)(33656002)(53936002)(6246003)(66946007)(66556008)(64756008)(81166006)(81156014)(8936002)(1076003)(8676002)(476003)(386003)(486006)(2616005)(5660300002)(4744005)(66476007)(66446008)(99286004)(68736007)(66066001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6079;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wApwXHSaZLo6Bej8GHUpHxofhQJqUdBaqEIIrGPYuB4TX/9bwFevZGwg5WoGakIPJh2DRaQCY1+1pqemO6g8GWj/tAV9n5OGoC65RJjgsVDRpPnMZH9FzvjI575dntSPJnyBeeAqfrsR6xbzD4DI+JYRT0jjZO511rYBO1tkL4YspouD3qDdhfzELBOdpYwc6vfJzQkP06xwQATk/C/D0MkCzu6cG9CP/Livzu7o6kHh85TvZoY/t55fuMCj3g5fWbKnLToGhgTcO4LfEJlJYRp5H8Grim9/eSB53A+OzJIHXP0C8BRmOGvAHJNBmvdEyChJgb2EvTzCmtrygnOPu2OJfclfnxZBR5JSRgcxEdH8V+wjL87n9hhnV4n/BM5kzUyUPwdZmIZLvA5idTQgmnk/2w+FJSehxJc1TEG0IK8=
Content-ID: <5AEF0910AD27734B9CD8F3EB448FDE35@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55501426-92a3-498b-08b1-08d714ebc934
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:45:22.3504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6079
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/7vNZNyn0FFqNh/w4tptPQMmYuaBbYryJLl0cm5OSs=;
 b=lDS1eMZ7JgJr9CBXo7YnbnVEURymCctyuXe0JKzpRumJW0NXHHTTxukdVIGpzSWATMvA0ypSfms9Q9IPzQ23oN7kLO0PZ6/cGnDzfL+wFUBX1YXHvEgE6fsN9eZ/hx8sKbKpSrzJho6j/VQIiU4YaXW4iMjJnmNaPiso+y9hQM0=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NTVBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gIGluY2x1ZGUvbGludXgvaG1tLmggfCAxIC0KPiAgbW0vaG1tLmMgICAgICAgICAgICB8IDIg
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KClVuY2xlYXIgd2hhdCB0aGlzIHdhcyBpbnRl
bmRlZCBmb3IsIGJ1dCBJIHRoaW5rIGlmIHdlIG5lZWQgdG8gY2FycnkKaW5mb3JtYXRpb24gZnJv
bSB0aGUgZG1hX21hcCB0byB1bm1hcCBpdCBzaG91bGQgYmUgZG9uZSBpbiBzb21lIG9wYXF1ZQp3
YXkuCgpUaGUgZHJpdmVyIHNob3VsZCBub3QgaGF2ZSB0byBjYXJlIGFib3V0IFZNQXMsIGJleW9u
ZCBwZXJoYXBzIHVzaW5nClZNQXMgdG8gZ3VpZGUgd2hhdCBWQSByYW5nZXMgdG8gbWlycm9yLgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
