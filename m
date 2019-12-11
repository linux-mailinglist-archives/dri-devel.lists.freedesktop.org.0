Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499EE11C8A4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372816ECCF;
	Thu, 12 Dec 2019 08:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30065.outbound.protection.outlook.com [40.107.3.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C26EC0E;
 Wed, 11 Dec 2019 22:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naoQvCM4DLbWx2sse9mSlmACWgFiOuL+IDt60zRa1xBsgpiMwliOIvHoqwbmdHwmu86rqQrf+OON7RCWxenWkb5i8hqvI4iatydDukChRJ6Jt5iXIMTAH7i+YI892SCkfGVi/ObRRBXr7j57ufVLArtUjqbvwlbqG+3cUWvFniAnhoVRGMvytQ7RKK9UFbhBlShIYHokH1SWuJJMal1Teaf9whF53IiShHpJZZjJtjnhuBCwcYjJ775+OwdEZy8+qTA92FcS+GWmaNQwHtPAYa615mJPFauteVd68025UAXtPIX6t2wlqz4k0V3dBH4yhH53Va2sWA6scr08y785CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4GrQ0KYd0WF77SVfF3S7xy8QY3oTjYsGP9aRTBifCs=;
 b=napW0/vqL8u5HAVwOayvAmNqKOP+RNJRZKc+rp9eZsMZ636zNPLmsAFUSnsWp2RNenbdRlaCCV5fonjCUm+ihalUKALXzJpLqxYCjWHc8f13ljge8uAqwGXSwSCPUfsJvXahCaioAN8seRxynU8Ezfjek9qsqBX/HrSQIJZepLSnNmChll0HYmdpqRKrVUaAhUyxc/K8w+N5Ras8ymf0rjFjjgp0nHBDzJYHsCI91FmodN4LaQH8KhGCBWI/70AZ5sx5744Njau0DvVQq3eL0jMy22+nBRXAfAuwkxXKTmbQ71kYfdchMXizbcuh/IiUENmL8s8rU/cLq7yvkEuI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4GrQ0KYd0WF77SVfF3S7xy8QY3oTjYsGP9aRTBifCs=;
 b=LvEBfMDT3uGuLQztJaEzq1mGCZjMhu5LNgDRZONlLWyHWzY80AMpvTVkOSGhzyUaBo7W3lXBTZnBb1oTdFhO29e3/Kmmw9Zt5RbKYggTlrf+pPjpmZmurRNW8Ueo/8CtA4MsD1BO8vfH3MYwOif83/QkJh+hoXj+4ZsjxdjbASI=
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB4507.eurprd05.prod.outlook.com (52.134.107.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Wed, 11 Dec 2019 22:47:52 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::f9f4:95d6:71ab:7003]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::f9f4:95d6:71ab:7003%5]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 22:47:52 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVo9Dog/MtwM8aJU6I/7345tJKuKekCWkAgAAFfoCAA6/3AIAEegoAgAlpcIA=
Date: Wed, 11 Dec 2019 22:47:52 +0000
Message-ID: <20191211224739.GD3434@mellanox.com>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com>
 <2f915b2d-ad97-a314-40f0-d0e571f896ba@nvidia.com>
In-Reply-To: <2f915b2d-ad97-a314-40f0-d0e571f896ba@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:805:66::21) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.111.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af5299c9-7354-4373-f0d9-08d77e8c27d5
x-ms-traffictypediagnostic: DB7PR05MB4507:
x-microsoft-antispam-prvs: <DB7PR05MB45078F9CF64337BB48841706CF5A0@DB7PR05MB4507.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(1076003)(478600001)(4744005)(54906003)(36756003)(4326008)(71200400001)(5660300002)(2906002)(66946007)(64756008)(66446008)(66556008)(316002)(7416002)(66476007)(52116002)(81166006)(81156014)(8676002)(186003)(6512007)(2616005)(26005)(6486002)(6916009)(6506007)(86362001)(33656002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB4507;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 76ZpDlWXbWjA3EbwOZDfTK131Pc6FNHnHjmm5FOMsUCDEKBB51+4bMJXwHH/+0jA0+tfptEogwqujA6XYq4/ThVSKu/Vs9/RRSl4vSo7l3NESndToqyFmzhYdVy9zP6lVFl1LhoDwmokOFHb6iyyLbzhy6R6r8OAzGznaZo2kXjupzY7wC+Y3p7XqbrCSBI1HSU94J7mlkQMfMg2QKtHoZ+KS/kHsKDEZqQtDSKw2PlNvZtDIHzK7b+D7FlLux7WDMcNbCBWasGGw0N0UqfIRCewbOmRyqJfiL6+UPqLIjifScqriUX57mER9dcAT9IS6P65QO4NzctyQBtqFNs2tKVeK/mOwtTFGlf+4UBCN9R1iACEcVu4Q/ZAisOZLCNtCLyzPWsinvJazwMQrHrGSXaVhJ1IkAYjH4wQSoiEY2Qfp170q2I/kFN3HQTQXxIQ
x-ms-exchange-transport-forked: True
Content-ID: <69DD12A675BE064CB70D2FA97742766F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5299c9-7354-4373-f0d9-08d77e8c27d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 22:47:52.7726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLMutBqllesWIAGWtCMfTh12KOWbw8538uPcHkoxigZt1pX889SDHtg2CcHW0OH1Rk8XAh90Y/qxIXjaWz6L1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4507
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2019 at 03:03:56PM -0800, John Hubbard wrote:

> No advice, just a naming idea similar in spirit to Jerome's suggestion
> (use a longer descriptive word, and don't try to capture the entire phrase):
> use "notif" in place of the unloved "mmn". So partially, approximately like 
> this:
> 
> notif_*                                    <- MMU notifier prefix
> notif_state                                <- struct mmu_notifier_mm
> notif_subscription (notif_sub)             <- struct mmu_notifier
> notif_invalidate_desc                      <- struct mmu_notifier_range*
> notif_range_subscription (notif_range_sub) <- struct mmu_interval_notifier

To me 'notif' suggests this belongs to the stuff in notifier.h - ie
the naked word notififer is already taken

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
