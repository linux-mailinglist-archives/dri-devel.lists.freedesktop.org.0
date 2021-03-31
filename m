Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A4034F7C2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 06:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61A76E13C;
	Wed, 31 Mar 2021 04:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E4089B99;
 Wed, 31 Mar 2021 04:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7LY33UxZk2G4h5mRNtXFx4YgL/k0ZXuUXP44C+G1p1xxmT+4xCh8X2mje1mSa/gZULd1PMObyrkcxCQvJ1nBmfgltMVoMnDHGHilUw/CEUs58vic3BcJtu8x2tbQcsQm/xqq65f1Lh0fHsmmOXizLFFHEWAtOMocHQn4iM5TExWziooSEaZCbCer6SJwenmlYeq+RkbhIdWly7T8NmPJZ0fTpS5kbg1JtRXbUfEwHEP+vUk+jVB9w7sFVm8+3j5T4oRcsPX5wtTZL3J1tgsiakKOGVdixK6fm/s1/nHDZlQs2Vs4cEylM+9QLFfPBQvTwqUrYC9gU34vOcPiklxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXVBh3Lr2Q+llzfyoKDr9TK6PnWud4S73nyB0YZ6vv8=;
 b=apDB9U40XENpavrQIeG1KqvxqBlF6OmbsX3hW94Ae68Kz1bM/dHWkS6gMxZp12nOFPY89+g7qHFh+I9N4GtA0EZNTnBvgVs4dveWm6GTJddRd5chZZzyiAuwLvf88236DsUSC2Lzv/W1La3iY9yThksgL0zCP+zsrMK6pmnOkMlVDkh5+jpAe4PQdtM+6Vxa8b/IOtYq6nvcw860NokqSkspt1bfYZ+EyoH5iv+SMipZMQIrKJea1TkyTI1BF+vL2FHaFgrrF7KdYwNUabpGD1kX/D+WNB+0fLXBxl1EzB8pgbRW0uW7cY6WnMZf6k167I7d4s4mRXnjcgwVPYdnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXVBh3Lr2Q+llzfyoKDr9TK6PnWud4S73nyB0YZ6vv8=;
 b=X2M2KZlFz2IZlT94dARfUGChn7NEUks0gWB65t3JDcnzqJ0oOj2dIUWUJYKUHUhLg1HV5EeTXwtpvD7MILv13sPcBkObUjQSFI2mRscs/yHkR0znWLk9iTaIiRz+s+zVFAZlCOKVTnuNNRm+QBwXqi8o4AswJQd3GiktXLV3EFm2c27+C9oNYHjRE2I7CXVx50S+U89gabbPNir+dEEn3Ge3i7XcHNMYVVFdd5AmiudDF4VgaoTNNMSPOphHreFg78K4zX59t8XP1uVAbjmI8v12oTG6qLeeCcqYfR0ARHFSb1sRhBr4eSb3Ju3tU36qrUbsmGSjcPcE4gIF4QjcHA==
Received: from MW3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:303:2b::32)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Wed, 31 Mar
 2021 04:15:54 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::a3) by MW3PR05CA0027.outlook.office365.com
 (2603:10b6:303:2b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Wed, 31 Mar 2021 04:15:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 31 Mar 2021 04:15:53 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 04:15:50 +0000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Wed, 31 Mar 2021 15:15:47 +1100
Message-ID: <23784464.epyy5R1Yul@nvdebian>
In-Reply-To: <b4b11c59-975d-26c7-043a-6acddff78dfd@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <12636584.zsJ0Sx4KLp@nvdebian>
 <b4b11c59-975d-26c7-043a-6acddff78dfd@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18fdbde-10a1-4087-d612-08d8f3fbacf2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43896332354D6FE1506B56BDDF7C9@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B2jvmXp0IJmbTltM6MJzSIWqWJTDgsXRQHLr5Moi75R5EB0aPNjR+3Qva5uFugo76BDi0JB6eoRvAaiMIQFCz6rhuDKz30xLf97Ka7EDQ9yCe70v6XcLwA8mG8OmL+ToC+S+Bu6ZOhZcRkM1IXYdL4HmxQD/HR3K4tNXswGkExyJFyGAPjfgqsXBooA6oafF7+bmVNLk7ZS5oARy92z0SHYqQk1iEWtjfrcJ72UDg7QixlM6MnBNNfOFfwakM7tcxZFiTeg43tuSU4dEijkmTdFcASZiU5Z6u6ABkzxbEI4qCT0R4n5FApQPNbRVxFlah9JsUfvN0Tt06M9NXnp1vi/dN0fLWAZjgYV/a/eJ4iakJT7E8Gb0iRIZ7z/DrwQe9Semlzf4jLLK5XQDs9KfwadkCfE0Rdk98wYdW+dHSW4qe2kw4b5B9+2nJydzWBX2kF9FmE8mRr1w8Tx5lGp+E92PTHoYZjwofIHsFnLnGimcACppY7w/kbnsqpZlZkR1BtzQxCZj9exv4peze6bx0ICGHyfqwxFut6aoTGihh8f2qQFHcp0c/cY+B1MLhVdLom6TzEXGiMjnLywGgvXt3VwjmGCSznuSCiI40FuxHb/qE6cQF8FRsqpR3zXiXRCNfMmjYugh87hZ7Gvot8gLqqoBsj8QYcj5ipYoCkFEA3CcdfLZJ+kCAyLnkPW0h3M
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(82310400003)(6666004)(26005)(186003)(53546011)(16526019)(82740400003)(316002)(6862004)(54906003)(8676002)(36906005)(2906002)(9576002)(8936002)(70206006)(70586007)(33716001)(36860700001)(336012)(478600001)(47076005)(83380400001)(86362001)(4326008)(9686003)(356005)(6636002)(5660300002)(426003)(7416002)(7636003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 04:15:53.5732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18fdbde-10a1-4087-d612-08d8f3fbacf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 31 March 2021 2:56:38 PM AEDT John Hubbard wrote:
> On 3/30/21 3:56 PM, Alistair Popple wrote:
> ...
> >> +1 for renaming "munlock*" items to "mlock*", where applicable. good 
grief.
> > 
> > At least the situation was weird enough to prompt further investigation :)
> > 
> > Renaming to mlock* doesn't feel like the right solution to me either 
though. I
> > am not sure if you saw me responding to myself earlier but I am thinking
> > renaming try_to_munlock() -> page_mlocked() and try_to_munlock_one() ->
> > page_mlock_one() might be better. Thoughts?
> > 
> 
> Quite confused by this naming idea. Because: try_to_munlock() returns
> void, so a boolean-style name such as "page_mlocked()" is already not a
> good fit.
> 
> Even more important, though, is that try_to_munlock() is mlock-ing the
> page, right? Is there some subtle point I'm missing? It really is doing
> an mlock to the best of my knowledge here. Although the kerneldoc
> comment for try_to_munlock() seems questionable too:

It's mlocking the page if it turns out it still needs to be locked after 
unlocking it. But I don't think you're missing anything.

> /**
>   * try_to_munlock - try to munlock a page
>   * @page: the page to be munlocked
>   *
>   * Called from munlock code.  Checks all of the VMAs mapping the page
>   * to make sure nobody else has this page mlocked. The page will be
>   * returned with PG_mlocked cleared if no other vmas have it mlocked.
>   */
> 
> ...because I don't see where, in *this* routine, it clears PG_mlocked!
>
> Obviously we agree that a routine should be named based on what it does,
> rather than on who calls it. So I think that still leads to:
> 
>       try_to_munlock() --> try_to_mlock()
>       try_to_munlock_one() --> try_to_mlock_one()
> 
> Sorry if I'm missing something really obvious.

Nope, I confused things somewhat by blindly quoting the documentation whilst 
forgetting that try_to_munlock() returns void rather than a bool.

> > This is actually inspired from a suggestion in Documentation/vm/
unevictable-
> > lru.rst which warns about this problem:
> > 
> > try_to_munlock() Reverse Map Scan
> > ---------------------------------
> > 
> > .. warning::
> >     [!] TODO/FIXME: a better name might be page_mlocked() - analogous to 
the
> >     page_referenced() reverse map walker.
> > 
> 
> This is actually rather bad advice! page_referenced() returns an
> int-that-is-really-a-boolean, whereas try_to_munlock(), at least as it
> stands now, returns void. Usually when I'm writing a TODO item, I'm in a
> hurry, and I think that's what probably happened here, too. :)

So I think we're in agreement. The naming is bad and the advice in the 
documentation is also questionable :-)

Thanks for the thoughts, I will re-send this with naming and documentation 
updates.

> >> Although, it seems reasonable to tack such renaming patches onto the tail
> > end
> >> of this series. But whatever works.
> > 
> > Unless anyone objects strongly I will roll the rename into this patch as 
there
> > is only one caller of try_to_munlock.
> > 
> >   - Alistair
> > 
> 
> No objections here. :)
> 
> thanks,
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
