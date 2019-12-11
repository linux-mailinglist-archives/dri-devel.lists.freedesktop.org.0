Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A711C8B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E8D6ECDB;
	Thu, 12 Dec 2019 08:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40053.outbound.protection.outlook.com [40.107.4.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1F06EC08;
 Wed, 11 Dec 2019 22:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbI8FjhSUl1AUlfrYj6SSubl8UFPoaGfDy7xfnUvKjZauRhUZvMIRFE4/qOSE5OAmplZemcsQvn2Ld54Y2d3psEaMkyZXfGe7X1SLJJaZHpTI2rQrwoPu82IjxD7yNuz8lAINPMSwVKCjn+h0bpjRQTdSuFcZjmK3Ss55vjFj7DL/fzQ9HNdVxrPWCTcRxILgkJe6QERdp0G1XxBttMXuy9CvaAJGmGgLm/rfYAitxvhvNZLtOTDIE5NqsRuMCRubu130Av61C/Cm1cGbQuVmGVulZ4NVtow/RjJWro28oTnh4b/M34mVTR0LCWd2S3yQq2BjR2T5y0Nh5UrOkIdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JSCeP37ZJyxEfjg2snOSnM6nokCTo9q9SIJAZ9QCJ4=;
 b=b3JspRaquwFZ8CzLAOUOP39qzpz6AOVI2MjlUdksvBHEane/c5uK+eXbnD6iZO6b3AJ7PoOmhgIoZZukCXhcLoLEjt0touNXeWhRNJTOUsfya2NaUWK0LLA1KsNKDeDHBl+GoGUJ6l49P/Ew4vDxviA2gB9Sd394qWDGCiVVbwz7PRVL7wa98i5mv7q+r7c34qnEp7cpHoaAU7+SI3TKjsMVUgf6okEORS4ZihzT5xcaiAaDBaSMO6iouh6jd+qInk9GP2SLpfO/atSFqDk+wCeOPy1EVl7fInKhY+Boqgytqp1mK8i3jJ2FVyfuwIdtd6gUgHWulDG3RwXlgGhkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JSCeP37ZJyxEfjg2snOSnM6nokCTo9q9SIJAZ9QCJ4=;
 b=o0hYwfnxTaZy0UoAwsSi0HIg+at9jaqmRbX1xwpo+nLpLgLjnPabEwpTtcDy05X/SCvfdNO6luZlHAKy0w4pDIOBzEgOt5FlOdP98WVbMnyK/lDw3aFlh3rgEb3kJkwSqNGx0hoxurJbNRQCemuT2KDBD5555HQxBmTOgNPFm/A=
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB4908.eurprd05.prod.outlook.com (20.176.233.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 11 Dec 2019 22:57:13 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::f9f4:95d6:71ab:7003]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::f9f4:95d6:71ab:7003%5]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 22:57:13 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVo9Dog/MtwM8aJU6I/7345tJKuKekCWkAgAAFfoCAA6/3AIAEBIsAgAnhkIA=
Date: Wed, 11 Dec 2019 22:57:13 +0000
Message-ID: <20191211225703.GE3434@mellanox.com>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com> <20191205160324.GB5819@redhat.com>
In-Reply-To: <20191205160324.GB5819@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.111.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2fbf81f5-a5ea-4237-c645-08d77e8d7644
x-ms-traffictypediagnostic: DB7PR05MB4908:
x-microsoft-antispam-prvs: <DB7PR05MB4908DB95A805FB8EE5F5A0D6CF5A0@DB7PR05MB4908.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(189003)(199004)(54906003)(4326008)(478600001)(6916009)(6506007)(2616005)(2906002)(5660300002)(1076003)(8936002)(66476007)(86362001)(6512007)(66946007)(8676002)(81166006)(7416002)(66556008)(36756003)(186003)(52116002)(81156014)(33656002)(64756008)(66446008)(6486002)(26005)(71200400001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB4908;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WNJVRO42MBAZa2BuOnnkcmtX1DyIJW7lLW/kAOIH70oJ+QaW8QTPTWMiMlllDzKIi7hWbJ4lgeef9VTD59fGurIB/B4sBO0EGlV9yXFnJbKwcWyab2zG+NvH/Umi1pYgrJLb5hB7Rot63BAynGm/9naJOQRkN9Nu54YHwZgaU4I+BddphW8zQ+YPWLgGkjc9cq/l6ewCXFzMbpaA1WkX82eF7wqkzKxzAvJ4RVs8yj4MRFY+WEZftSR7N3vKjd5X16Qkl9w79xkHNy4LM8AuGY2hNtxj3enwMmv8kgU89H0HkU0ycTpAvP9u1DR0SLVa3C9HGvO0Attbp32TYLFJC29UGvGhXEeQnBChIs836el1M2zhtGxZVZZ7SQZLrdJQjYGyYbrEJw1pMLK7AUVBnWAbTLekJPuwozubPoxb92G/euROO9LYLfJFaeOJhv2V
x-ms-exchange-transport-forked: True
Content-ID: <7D48963BDE69684698F1C710FEB0EADA@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbf81f5-a5ea-4237-c645-08d77e8d7644
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 22:57:13.7960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fn2wH02dOCkojCc2nR39rClE8tellR3RczxSTIRTVzoDG+yz86Z3NRg/a7OWwmAgBkrnFhI9CJvVvdYHcivOMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4908
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
 Dan Williams <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2019 at 11:03:24AM -0500, Jerome Glisse wrote:

> > struct mmu_notifier_mm (ie the mm->mmu_notifier_mm)
> >    -> mmn_mm
> > struct mm_struct 
> >    -> mm
> > struct mmu_notifier (ie the user subscription to the mm_struct)
> >    -> mn
> > struct mmu_interval_notifier (the other kind of user subscription)
> >    -> mni
> 
> What about "interval" the context should already tell people
> it is related to mmu notifier and thus a notifier. I would
> just remove the notifier suffix, this would match the below
> range.

Interval could be a good replacement for mni in the mm/mmu_notififer
file if we don't do the wholesale rename

> > I think it would be overall nicer with better names for the original
> > structs. Perhaps:
> > 
> >  mmn_* - MMU notifier prefix
> >  mmn_state <- struct mmu_notifier_mm
> >  mmn_subscription (mmn_sub) <- struct mmu_notifier
> >  mmn_range_subscription (mmn_range_sub) <- struct mmu_interval_notifier
> >  mmn_invalidate_desc <- struct mmu_notifier_range
> 
> This looks good.

Well, lets just bite the bullet then and switch it. Do you like
'state'? I thought that was the weakest one

We could use mmnotif as the prefix, this makes the longest:

  struct mmnotif_range_subscription

Which is reasonable enough

> Maybe we can do a semantic patch to do convertion and then Linus
> can easily apply the patch by just re-running the coccinelle.

I tried this last time I renamed everything, it was OK, but it missed
updating the comments. So it still needs some by-hand helping.

I'll make some patches next week when I get back.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
