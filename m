Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A61A387
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 21:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FE789B7D;
	Fri, 10 May 2019 19:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680089.outbound.protection.outlook.com [40.107.68.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9389B7D;
 Fri, 10 May 2019 19:53:23 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB3447.namprd12.prod.outlook.com (20.178.196.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 19:53:21 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.016; Fri, 10 May 2019
 19:53:21 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "jglisse@redhat.com" <jglisse@redhat.com>, "alex.deucher@amd.com"
 <alex.deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/2] Two bug-fixes for HMM
Thread-Topic: [PATCH 0/2] Two bug-fixes for HMM
Thread-Index: AQHVB2oFymYy9x0alkiQIwO1y+NKlw==
Date: Fri, 10 May 2019 19:53:21 +0000
Message-ID: <20190510195258.9930-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0810f5a6-c9f8-4ab5-48b8-08d6d58127a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3447; 
x-ms-traffictypediagnostic: BYAPR12MB3447:
x-microsoft-antispam-prvs: <BYAPR12MB34471C6608D3552CA8D78CF6920C0@BYAPR12MB3447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(110136005)(102836004)(2501003)(6512007)(86362001)(6436002)(2906002)(52116002)(2201001)(6506007)(386003)(99286004)(6486002)(66066001)(3846002)(478600001)(6116002)(14454004)(72206003)(316002)(305945005)(53936002)(66476007)(66556008)(186003)(8936002)(81166006)(7736002)(486006)(4326008)(64756008)(66446008)(256004)(25786009)(26005)(66946007)(73956011)(476003)(2616005)(71200400001)(71190400001)(8676002)(36756003)(81156014)(5660300002)(50226002)(68736007)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3447;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jxKJYtCcqhU2oO9qiZ7HOhSw2wTea3S/f07ptlsy6X9q5M9wCb31U3ZcBPK12UgUcNRhI6P8qQSfV7fdcf0tq3zy9b832Qvhu8wfqjSMV97y5qpCSny1QBc8Ks2XPc2H3nMa0gpew76vfosw/ayMPu4mon84nVkhv9o10F6IXQAoKYCs77FOhUOFjYfH7DrSDV3QhWGS/gh2Bkhn0HYrF6X6TiGAhqj1TWWvXLnDqtDvk154aCSZ47m8P1A2cJvVm+1coGWXLOs5+a0Ox/4Sj8lMZxsTahQHUojlnK8G/wjURIIorisCI+oOln4NJxESr+Sxqp3FAmRvFiUNtBX0b5jd/1wlemsiIJSmsWdf5EPL9mDe+pbslQb+WUP7g9zf5vV4bXhQ/oqq8Guiv9bD/HXu3i/6ykOI1/sY+Afequo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0810f5a6-c9f8-4ab5-48b8-08d6d58127a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 19:53:21.6748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dESb7FNYik5HDj5wOehfO9ebygS6wUs4Qt1amsabA/o=;
 b=gru1zGAFwPmzZjLJjG5OXoBinK2p6d4fZrzZ8aaX4Ah3V2cvEbUxz+meYgRkVHl1Hqs97nDK1rEkJUlvCEmUB8VJPDr4wm3vDOyF7Hn3WEMILcpACpPjYqbsC8EU9NrCpomdlypXNEDroThGY7g12GLXJofCLWJLEDTEZprBzCQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcHJvYmxlbXMgd2VyZSBmb3VuZCBpbiBBTUQtaW50ZXJuYWwgdGVzdGluZyBhcyB3ZSdy
ZSB3b3JraW5nIG9uDQphZG9wdGluZyBITU0uIFRoZXkgYXJlIHJlYmFzZWQgYWdhaW5zdCBnbGlz
c2UvaG1tLTUuMi12My4gV2UnZCBsaWtlIHRvIGdldA0KdGhlbSBhcHBsaWVkIHRvIGEgbWFpbmxp
bmUgTGludXgga2VybmVsIGFzIHdlbGwgYXMgZHJtLW5leHQgYW5kDQphbWQtc3RhZ2luZy1kcm0t
bmV4dCBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIuDQoNCkN1cnJlbnRseSB0aGUgSE1NIGluIGFt
ZC1zdGFnaW5nLWRybS1uZXh0IGlzIHF1aXRlIGZhciBiZWhpbmQgaG1tLTUuMi12MywNCmJ1dCB0
aGUgZHJpdmVyIGNoYW5nZXMgZm9yIEhNTSBhcmUgZXhwZWN0ZWQgdG8gbGFuZCBpbiA1LjIgYW5k
IHdpbGwgbmVlZCB0bw0KYmUgcmViYXNlZCBvbiB0aG9zZSBITU0gY2hhbmdlcy4NCg0KSSdkIGxp
a2UgdG8gd29yayBvdXQgYSBmbG93IGJldHdlZW4gSmVyb21lLCBEYXZlLCBBbGV4IGFuZCBteXNl
bGYgdGhhdA0KYWxsb3dzIHVzIHRvIHRlc3QgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIEhNTSBvbiBh
bWQtc3RhZ2luZy1kcm0tbmV4dCBzbw0KdGhhdCBpZGVhbGx5IGV2ZXJ5dGhpbmcgY29tZXMgdG9n
ZXRoZXIgaW4gbWFzdGVyIHdpdGhvdXQgbXVjaCBuZWVkIGZvcg0KcmViYXNpbmcgYW5kIHJldGVz
dGluZy4NCg0KTWF5YmUgaGF2aW5nIEplcm9tZSdzIGxhdGVzdCBITU0gY2hhbmdlcyBpbiBkcm0t
bmV4dC4gSG93ZXZlciwgdGhhdCBtYXkNCmNyZWF0ZSBkZXBlbmRlbmNpZXMgd2hlcmUgSmVyb21l
IGFuZCBEYXZlIG5lZWQgdG8gY29vcmRpbmF0ZSB0aGVpciBwdWxsLQ0KcmVxdWVzdHMgZm9yIG1h
c3Rlci4NCg0KRmVsaXggS3VlaGxpbmcgKDEpOg0KICBtbS9obW06IE9ubHkgc2V0IEZBVUxUX0ZM
QUdfQUxMT1dfUkVUUlkgZm9yIG5vbi1ibG9ja2luZw0KDQpQaGlsaXAgWWFuZyAoMSk6DQogIG1t
L2htbTogc3VwcG9ydCBhdXRvbWF0aWMgTlVNQSBiYWxhbmNpbmcNCg0KIG1tL2htbS5jIHwgNCAr
Ky0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0K
LS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
