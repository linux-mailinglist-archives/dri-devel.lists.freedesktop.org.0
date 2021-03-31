Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A37C34F7A3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 05:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C8E6E12A;
	Wed, 31 Mar 2021 03:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B976E12A;
 Wed, 31 Mar 2021 03:56:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWo74krv900VkiFfqk3tJ4reqAvJiTzTjzCa5w315JVlhKNl8xIEayzx9iFEU57gLTpFrCovG2hhPyHtmj5FAVoRF7Il7X+qp2b9qh4ABGTb/qH5tt7+TEDt1wqpmL9S7vssqNPeo7sF2F/husHb5xXI4LkSGlJwJbcZinkwcEI+OmirVr46SesgNOBDnePXAg7lPCIBU4jaBIeEFeBWkGdCyz0K72UmzWc9zwZ9qgzHXAEojI7Ao9KY3PvIIrr34USJCumTwqUU2PLwXCgvHDvuJcdzfF/W3eUAfeBjx4KnYRM528kRgcrtYwwUM8K5NHVR4gVF04/t+iR+bCjAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxCUBrjh7vhjBmCnyudkgDD2gnIqHNuKSrLXyz3R8xQ=;
 b=krrvlYu2jcTJVQ7mcYnta54AbGNXzEfQunjjR9vG5yxX9JgkToKw3/aOFDOKM/I9pNqFz8DuATKP+ws8nl/Eo3qNsPCbPxSUkgwemtjf98CeHD2anEUavz77/zN7H6XzRtHExOvvA9hPkf7A1Py79Ab8zrExJb0jl+5pk3aNgN7Zi/K1K/bQ741bN66AOv0HqJ/7KB7I7sBB4OWdBOhtlWGPza6/hACvXCASFqRAbG/wjhDb28/RR9ojmVXrDfNaibmkE7jj63hHkl7gJ1OI7i6L3uTmY0Wy5GEnyNCI4Pxt9Cqi6iLZ8gL89uk+GQ/awFUrWP9U+uvfIjkV0by9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxCUBrjh7vhjBmCnyudkgDD2gnIqHNuKSrLXyz3R8xQ=;
 b=mTPHMs/YaKX2MJTW3LAHHAtFfV7g+PoLBefKx5r5zNga2WWTLt/Gg3EgjthAuoVkHNzWTj3rjnHMAiHpwZGPk7b0YUh6nP1ra/F25fgbm4cyv6QmnwXp4C+hkAs4SNgGbM/Qj6KA3j8LGKJhr9I0HmCD7zYqtS1S+yPr04AyhHwQMaHokzKKlITcrQRJ++SaFY9pAEW+0Zf0Oc+ADFDqN8gyby2a90im4ofhXU8b5YcCcambrKRxCi8xpw5pHzEcfr6tvzd9yFdbSIPBnK8ekIFaXE8fOskcnjdlIW4an5O/MDW0vM1unprtK67Fxy18NZPyi3AFWijVXhy8S6fLqQ==
Received: from MWHPR22CA0041.namprd22.prod.outlook.com (2603:10b6:300:69::27)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Wed, 31 Mar
 2021 03:56:40 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::42) by MWHPR22CA0041.outlook.office365.com
 (2603:10b6:300:69::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Wed, 31 Mar 2021 03:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux-foundation.org; dkim=none (message not
 signed) header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 31 Mar 2021 03:56:39 +0000
Received: from [10.2.63.109] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 03:56:39 +0000
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
To: Alistair Popple <apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210330222440.GC2356281@nvidia.com>
 <bce0605a-336f-99ba-5b65-a8e5a7e49e00@nvidia.com>
 <12636584.zsJ0Sx4KLp@nvdebian>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b4b11c59-975d-26c7-043a-6acddff78dfd@nvidia.com>
Date: Tue, 30 Mar 2021 20:56:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <12636584.zsJ0Sx4KLp@nvdebian>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22300cc3-3276-47cd-3300-08d8f3f8fd3e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4284:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42846FB425A16C04D8D00843A87C9@DM6PR12MB4284.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQAOxm9xGmR6U+ToleSZJBBq4vvNSUt3/l7roC3llk3Z/pe21D3+S/gcUVYtrG7qzEI/AqBamvrBqdD8WUhuc7C0VrrlxK4O8YAsV7OZi2L4UCC5A11hqxw98x+E+YDYYDFRaswwwQl89mg1bF4I/HRfURfGyi6JGdmzJ2hFRIKWEmfKMYlPjqGdNrbFIlbbjqH+WUJ8kakBtcwyn2gMwZbL7x62ucLOFaVSq5kpsCFmePuNeVfw8AiTW7vzzn5UM5XhpAT69SRA4VNQn6+esfHMXH8t52AiTeH/XPQKpWATvbi1riNd4BKs8xrHiBc41p4IRoHXQBYGC8CID31s6XDTGyOi2B9ZC5Qad17wSeD7bHPYFnGLbEsyeCpAXvDu3C7/oHaRGZgCOuzh4xAdgYU8OhoGU3tUNA0MAchyissVb7zPRYhXf87H4UJr7ry4ULFl3I4Rt2T7MO27oziIg8/bvjUOLL/qcdhZmSPeNVaZ4m604XwM+e5Sg9JRyAqvBI3+iPSpMXqsqeb/zsrzIt9mOp/EuJCEJHTd1LyS/hbwxAHiTpzYczmK0ai/8EctGvfBt0BDAL80sNxFcOfmckj2knkxYw23HK10VLtCPRTIx6zAdz9HxZVop8PhA8bbMgOctgUndt4QEEiRfh45/lCvOAIms9XgXfQCQDZjqC0oIW6Ba8ELPB/aEXHjsa5E
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(46966006)(36756003)(53546011)(8936002)(7636003)(7416002)(82740400003)(5660300002)(36860700001)(36906005)(70586007)(70206006)(86362001)(37006003)(2616005)(336012)(31686004)(83380400001)(6636002)(426003)(54906003)(478600001)(316002)(16526019)(4326008)(16576012)(82310400003)(186003)(8676002)(26005)(2906002)(6862004)(31696002)(356005)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 03:56:39.7357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22300cc3-3276-47cd-3300-08d8f3f8fd3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/21 3:56 PM, Alistair Popple wrote:
...
>> +1 for renaming "munlock*" items to "mlock*", where applicable. good grief.
> 
> At least the situation was weird enough to prompt further investigation :)
> 
> Renaming to mlock* doesn't feel like the right solution to me either though. I
> am not sure if you saw me responding to myself earlier but I am thinking
> renaming try_to_munlock() -> page_mlocked() and try_to_munlock_one() ->
> page_mlock_one() might be better. Thoughts?
> 

Quite confused by this naming idea. Because: try_to_munlock() returns
void, so a boolean-style name such as "page_mlocked()" is already not a
good fit.

Even more important, though, is that try_to_munlock() is mlock-ing the
page, right? Is there some subtle point I'm missing? It really is doing
an mlock to the best of my knowledge here. Although the kerneldoc
comment for try_to_munlock() seems questionable too:

/**
  * try_to_munlock - try to munlock a page
  * @page: the page to be munlocked
  *
  * Called from munlock code.  Checks all of the VMAs mapping the page
  * to make sure nobody else has this page mlocked. The page will be
  * returned with PG_mlocked cleared if no other vmas have it mlocked.
  */

...because I don't see where, in *this* routine, it clears PG_mlocked!

Obviously we agree that a routine should be named based on what it does,
rather than on who calls it. So I think that still leads to:

      try_to_munlock() --> try_to_mlock()
      try_to_munlock_one() --> try_to_mlock_one()

Sorry if I'm missing something really obvious.


> This is actually inspired from a suggestion in Documentation/vm/unevictable-
> lru.rst which warns about this problem:
> 
> try_to_munlock() Reverse Map Scan
> ---------------------------------
> 
> .. warning::
>     [!] TODO/FIXME: a better name might be page_mlocked() - analogous to the
>     page_referenced() reverse map walker.
> 

This is actually rather bad advice! page_referenced() returns an
int-that-is-really-a-boolean, whereas try_to_munlock(), at least as it
stands now, returns void. Usually when I'm writing a TODO item, I'm in a
hurry, and I think that's what probably happened here, too. :)


>> Although, it seems reasonable to tack such renaming patches onto the tail
> end
>> of this series. But whatever works.
> 
> Unless anyone objects strongly I will roll the rename into this patch as there
> is only one caller of try_to_munlock.
> 
>   - Alistair
> 

No objections here. :)

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
