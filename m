Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191067BA6F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5686E6E69C;
	Wed, 31 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00082.outbound.protection.outlook.com [40.107.0.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B456E4AD;
 Tue, 30 Jul 2019 11:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc8o/Yooyf+Fy5LKnRl1Q0XcxHidnxtz+lMj2KtHxnjqhVsUr95WcbfWNVwhqnJf79bfhWflXFWoL8XG7qXJFtMuJ67f6mRH4gynMI6pbd2yMI+3kfqoLEJGRdgWffFsDRgK1Uzue56PoCOHq8EK3G+VYJyVOXTf/SmxvWJdLybhWQIO5gYCwwT8LKjbEIrKyqn87++TjyzkwFbaL3jJK3PeprU5YxSOqNqvGm01F3Z8LpudxrbHJA54pkSyIQ3T1O40adB0DhnKgfL+/R1n5DkUt/WsrjmN9n/iaGZiHpdmZ6kq9KN29PMEfY2qd9srciO+LYFnOjfw/bWg66Sr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+33JPkMeNqyLpIkArR+07OT/1Uc18dPOVsUqjAcecF0=;
 b=iGk7bvIkg/GNugY0L0VxDrVeuuAamrfuGgpnx0hvCiMUdsWStVYn7Pwy+3jd3G3mep0LnT1Qaz6y0YsCKGR3LBe9+c6PNHOZKjdShaidgDXsIgPGFlYOM2JYmdN+epxZe7V+YWyeA2wbIl52BR06T7rOPktUQZsS+wIEJuP5UZb+rD9BmyS2uL3+1F+OnGNMMS1cQ5569/DBlInyxqYAtNn+QR9tM2na/O/ymR+oOkSllxoLI55iJdZFO2eCF4HSuSjlqkwVl+cRz/BwG9YR0waPI4J+jBWtLTHcvTSRl7OG1mRsm/vc3gBsZpYb6QeFCXa5jlzhxIqMxcXuXuW+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6063.eurprd05.prod.outlook.com (20.178.204.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 11:58:37 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 11:58:37 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVRs4epyeD1jwmWUi/iXXZo7asug==
Date: Tue, 30 Jul 2019 11:58:37 +0000
Message-ID: <20190730115831.GA15720@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6f9997d-b133-407b-5779-08d714e5413a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:VI1PR05MB6063; 
x-ms-traffictypediagnostic: VI1PR05MB6063:
x-microsoft-antispam-prvs: <VI1PR05MB6063117D58AB82D9BBD5CD20CFDC0@VI1PR05MB6063.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(199004)(189003)(66446008)(99286004)(4326008)(54906003)(8936002)(53936002)(33656002)(68736007)(81156014)(81166006)(2906002)(316002)(486006)(66066001)(110136005)(99936001)(186003)(386003)(6506007)(102836004)(71200400001)(71190400001)(26005)(8676002)(476003)(52116002)(7416002)(478600001)(256004)(14454004)(305945005)(6512007)(6486002)(14444005)(7736002)(36756003)(6436002)(9686003)(1076003)(25786009)(5660300002)(66946007)(6116002)(66476007)(66616009)(86362001)(66556008)(64756008)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6063;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5lwbL/YVtpY1+D5llxcTNXTbawvmeQQKNRaFB7wOLtBFTVGXipPPkgJryzHiWHG/XZWScZv9oJYdOB3qYtDOHbWHDqRo8PWrd3Ev498c5T2DQEBKlamgQpSB905/FbcjUoj49aH/xVj5DrtIGh3ljuSdo8DIywKp+wn2saqRHoQOn3Qm847USGFdAZC+mQw9wbx+VQyKQQOo11AgcqeNaLt4C6EiYyHHM9zM4N0LOoMC5i6XUC8f5bo4nWiCchaoqkJz0b32ALq51NclJz1zWpgqdGSqgb6a386gTi8WHJF9u5KFzHdOkr439yGB7m5x5LvKlZL4doaItYPvle6GOAtpKoonSl3I23Tg7RwKSOxs8bXkieWDWyJiPdNFtoDdPlXkkOaxFJm3bRcce9f4aoKoYtiH8U14x2yZfwDBxfE=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f9997d-b133-407b-5779-08d714e5413a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 11:58:37.2602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6063
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+33JPkMeNqyLpIkArR+07OT/1Uc18dPOVsUqjAcecF0=;
 b=pTAUOFHFWfescS2ALdSMnHR93xaow9VsWlzsAk8JjASyGaYs4pWcwCVu6CuTbDVgQfBSypFOugHWALdYbxjv7Vxd/pSUo6emmDdLH8+vBD/Su7SlYf/6FeOJQ8mjNbb6PbQ5Qt+xmsYlY/wjA4Pewlm5aTiJo45RVexpLp6yyNo=
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
Cc: David Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============0859530519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0859530519==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Locking fix for nouveau's use of HMM

This small series was posted by Christoph before the merge window, but didn't
make it in time for the PR. It fixes various locking errors in the nouveau
driver's use of the hmm_range_* functions.

The diffstat is a bit big as Christoph did a comprehensive job to move the
obsolete API from the core header and into the driver before fixing its flow,
but the risk of regression from this code motion is low.

I don't intend to often send -rc patches for hmm, but this is entangled with
other changes already, so it is simpler to keep it on the hmm git branch.

Thanks,
Jason

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git tags/for-linus-hmm

for you to fetch changes up to de4ee728465f7c0c29241550e083139b2ce9159c:

  nouveau: unlock mmap_sem on all errors from nouveau_range_fault (2019-07-25 16:14:40 -0300)

----------------------------------------------------------------
HMM patches for 5.3-rc

Fix the locking around nouveau's use of the hmm_range_* APIs. It works
correctly in the success case, but many of the the edge cases have missing
unlocks or double unlocks.

----------------------------------------------------------------
Christoph Hellwig (4):
      mm/hmm: always return EBUSY for invalid ranges in hmm_range_{fault,snapshot}
      mm/hmm: move hmm_vma_range_done and hmm_vma_fault to nouveau
      nouveau: remove the block parameter to nouveau_range_fault
      nouveau: unlock mmap_sem on all errors from nouveau_range_fault

 Documentation/vm/hmm.rst              |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c | 47 ++++++++++++++++++++++++++++--
 include/linux/hmm.h                   | 54 -----------------------------------
 mm/hmm.c                              | 10 +++----
 4 files changed, 49 insertions(+), 64 deletions(-)

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfB7FMLh+8QxL+6i3OG33FX4gmxoFAl1AMOIACgkQOG33FX4g
mxoQ2g//RnLjfumNrH3tMwS8UkYgAoWVh6NGyQ7EjUPT2fvHlfo3dMqzUNK9h+wN
k2MKDTSZbFVhJQ5scU9KbhzGBXih4+DLnW1bpN1k/6nfZ6EXxRJakmcEz+LE53Pn
ylcuBXU9SLf733j+uwy42BQhkL7/Ykk+vt/aToWEyuTIXsR7zkTPVd7XH4JcHKi6
Lsf+zGtBCsIsh27T7uyyyOI52XwcY8Zm6LvfIKdOLczPRB8SzQ3yyMHjG42L7/ui
VGDvoU+4pMGQmBg2anE49/xsxDrGWeVYgkcsQcw2PhlthXw3VwmWBj83chLU9+qt
Vc1jofLj4Srgv+mXgFjmu0j1yJ84qoJaBb1YPzxDWoJGHpXyhLWKc7U55lvvotDD
EJCOV6nE+VMGo/Zu96O+LI4IW05afPxJstNj3XQg72lF4WaRGOS8q3OhmGqntaNh
ajQNYrcUDODmwepiOpDPf28K2cybwdINqrNKFw2e9eybnBxE4VEoF5vjUIlQmYoj
BNZAORxOyrnNHr8w3q46pK5OPinjXhNnKXJFrcqldZKKonhRCTIb+vu22CLD0QCC
DjmflIaGbHx8Q8yB+9B5pFt3j/a9lMzYgfN61Kh1qCOAiDWDXBjJ/c/mA6++iwgL
08F+Xltp9NoE46VUbpij+5xq6eaXrHWb7v8QyRZJt04KHziebmM=
=6E82
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--

--===============0859530519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0859530519==--
