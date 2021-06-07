Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671C39D51C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 08:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088189F55;
	Mon,  7 Jun 2021 06:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329989F55;
 Mon,  7 Jun 2021 06:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7w8HGVxXtgKbcgZU48BaLGUSv+qZCJki73F76UT8nvPGELTVJy8GKVzxApTLI0Ku/8ggCSWsnY8fvltssLsS+q58+gLLsNevvnrub7YNHqoQ97DNV3XI7dh5+rG9nkpx7IPZ1pV6EB/ts57DpO+uGmOxpcXh3Ww6B0P7Y+RO+IetwsHwucXkbFlAtDZmLxYBnZ2oZxYqyzwsB6Zp357F9y2nAR+XpaSonSVO6wQieshDsZaHaFGY6U6m5/CdGrfLPQ6NLuyEW39kMbVKRiZHRdXigtRAAsmgL4TsL05FzcT3ygobJ+ERVxUoKs6nOf6oPr0+4nRcQewtM/T8zE+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1UirDCLmU/THde+MiVhO1dhwwjHBSaf2aToOCNvdAI=;
 b=VA4bFTZfp9iSXJFQuooRjNFno1t5JRjoBGhB6yHB4daLJY58N6XnfvoEPOHCj89UbzLHUgGuMMV2iThEp9M5GNHwculdK+PbbWbeIgQtmhG9ENbz7i4Y6dAZ+5lx2m832vhc5cX8rgyIbxe/PPeyRHh1n81xdbWGujC80JqS5vdNp/PkSphvzmEcSHSDgmU/vTt0BZF2+vEZub542aZS2Bzwg5v8sVj3uPT0jF23aWb3G9skBy7sKB3WEbCoHgocGp47MXAS/v9TkjCzGlZcQk3STKB+ExmwEa0pGk7Yn0ZdY974RAWVh+BwRuDVp8PXHkXA5HHxl3SO5pdrHiiX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1UirDCLmU/THde+MiVhO1dhwwjHBSaf2aToOCNvdAI=;
 b=Nq8vBfe6s//p5zV8PaD83jTLbe9bqrtpcTcsVLzHclpT8borxetZIWeE8j5elcNUcaNRzgf+lRGOGeS1ikO5rQsegKJqRmFHXZZ/xN6oTiDZMZlSPsyfpHNen+Jx81t7qbEw92jJDPXB6ENpZITvRKovYtoG5G5tXHIaHJY0SMc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4708.namprd12.prod.outlook.com (2603:10b6:208:8d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 06:39:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 06:39:09 +0000
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20210607123302.446ccbbb@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <013d9f93-e0b0-67f0-691e-5e713256d42a@amd.com>
Date: Mon, 7 Jun 2021 08:39:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210607123302.446ccbbb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ce67:4e4d:875d:ffeb]
X-ClientProxiedBy: PR3P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb]
 (2a02:908:1252:fb60:ce67:4e4d:875d:ffeb) by
 PR3P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Mon, 7 Jun 2021 06:39:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c59f518-fb43-452f-c3e1-08d9297ef426
X-MS-TrafficTypeDiagnostic: BL0PR12MB4708:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47080D6FE6AF3C775D75A9FE83389@BL0PR12MB4708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6nJzq1uID4uwIl1XEI9CxugIAlVpiv15ljoykOahKj+F7uFIrB590wgGizFlE5rmBEUUGrxXqpKpITGW0fAGWkZU+a7Ai1oxr1cWtvQdyPW3Vqyy+9rB3pNeo6p03KRI2o1OnvpWt5IVQLZzHmL8xxjSaAikG2MSK80o7ZNjobrYYva5MV++N+bdaNt8XJ1lB48mU6AjB5gDRSpqhMgt43zz118zInD3pDMYkKgAvyncLsJgK12RFqHuItvZ3+/ewdu3cMockGn1I+bZOwawEnWfgOFQU9qW6eo3pUS8JU7dV1uJeEH00q0xVsrNZoDnURJTwNH2WQMK+FNpg/9ziLHDcY5o526JOlU3EuJWODWuhm6sMm+GhNKAffqda/gCBoemv+T/PYZWaCxiRsVz9TqVD95X/tra/21TQecrsFPirKFv7vyxRjAKIAnk6krd2uPy/9WtzKDwYvmpY+z+8LFyuKkAep3gZ6mG38aOGAjSNnWLos7WnnMDQC/GiQXkqBirMwgyIY5Ws/iqVcvEKgHEKgQxMBQ5faGXdXq/lHFXKvPhF44rHLnl5QZFQ3DRO9OthPtltJWeyfV2znPiuawGoQkxcfr9cA/DijowJoL89UizxIrNhANZixBmzu9v3bFYxJK2zFgMrzri0ltzVFV2z15fU28dZxv7x1yvFP6N71W2dAWHSIZGoe1gy6p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(38100700002)(478600001)(2906002)(31686004)(5660300002)(8936002)(8676002)(2616005)(4326008)(66476007)(66556008)(66946007)(6486002)(83380400001)(16526019)(186003)(31696002)(36756003)(86362001)(6666004)(54906003)(110136005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?04WvKOT0RjowdLjJkK1V8upBqvBkAQH2E0izDgutI1g3DTLY3TtvRmdh?=
 =?Windows-1252?Q?xhZuN5CG6Qxfe0unxiRpS8spTAOjHAjdaIsXphbthu1OBlXBOsgGKpWi?=
 =?Windows-1252?Q?6g1TEWceczce9lxQWP0qwf3E4D26tEasTWSHjIKcj+TDpjV0Oc0fS6iN?=
 =?Windows-1252?Q?niU61iJpgqQR4tQvIySsyEHxXhJqw6JkA8EjsjV71SUyYm2jZAG4WClP?=
 =?Windows-1252?Q?M75Ab1/b1IJB7clPa9o7Y6tf/g9H9V7O3/waEMrlEE37Npo7EIUhmucK?=
 =?Windows-1252?Q?MvvlsDUalHOUYQTtB6BLLdKhWxVoFomBhGJJffEGZFrf82lEf3ult7Fh?=
 =?Windows-1252?Q?AdteXLC3/HPBUNr0d3/b0tVtVoMVUgtFpuZKTrHHzlHb/k9qn/SQ1GxS?=
 =?Windows-1252?Q?I1mTRHKOJ6nS9DaVZt0YVW9kZIfNPD1jrGxhQUPRH3LeColAutPtIZw8?=
 =?Windows-1252?Q?QyGrOmrVpad7VK+S19DTwUy1Kdc0mJVRRlN1DW8L6/QGOPGsbYYlj1cL?=
 =?Windows-1252?Q?Yn9TFo1I5MZPDT0ZnNwm3RHn0ZHPS28hvJ/zsa22RN3JL39QIAkJLY6Z?=
 =?Windows-1252?Q?/VJEIDLO5sz7FcHW3oH665Xy852G/8hHyBtQ66ujtz52wvx0+VGitsKE?=
 =?Windows-1252?Q?7TApZZs39uSYRbYzSYknx+l7QYVBqJtCGRw33VSDnfBrzDpuozGeB9X7?=
 =?Windows-1252?Q?bFdED32dn+qDfn64d2JpoYzWv6VlDrE4vHgpu+3EI5sIxxTGvQe5elFd?=
 =?Windows-1252?Q?DSgbf1XbJD7zRPwZI5iVUiMPmWvB4N6xJxKjO34TFbv/BCvLC9n0ycGb?=
 =?Windows-1252?Q?tOUvKFYmp8QHoU5NhW8oPNkr4+Dmc6KXggD/uRtfbmGrJ8kU2Kd7W9RK?=
 =?Windows-1252?Q?eiabKnD724XziRO/4uR8nrvW6mcVOLZvcsuGeAlBPjqAFaGT2zFhztXt?=
 =?Windows-1252?Q?vB451s+bxTuF6Pp6DvBx0tvbMUtl5UaxZFqz2tvB28O1D/OJOKEaILDm?=
 =?Windows-1252?Q?A0EuUJypBSYzknRA7C15fMeoyjGZkYIYgvHHtjY6wOlbeImqZ9p1qdan?=
 =?Windows-1252?Q?x3LMRHBWoWHJ3E7YdRQJAMuJrtK0rM20YVyb7GD4TMvfpU7ajyFi+6c4?=
 =?Windows-1252?Q?w5a46Yd4vYexQt8icxyIuybwhnvSKFEYkPqEmnbJtFGGYIC7DQkIQ2JF?=
 =?Windows-1252?Q?MlBhJEFvB4FxtwcqYgCDVs6XlcuaJ9BXPZ3L+HvfEX1OYYCVKHLuBs3x?=
 =?Windows-1252?Q?x/uzVn2JcOwrZN7158X2l11EjbvK+XqpA4Akk+SvRIT/tE0q20cJWOxN?=
 =?Windows-1252?Q?mX+lCrKIwWcZs+ZAebm0OMUdf86NYZH9mm8WCPSrQpaQUECHnpI7kzjN?=
 =?Windows-1252?Q?NY6ZdpYN2F+ZP3P5tfgJ7Kpfg+EKTJ5Iw7GmTXQcY7cvtqQIPRR0F5TZ?=
 =?Windows-1252?Q?xXqDuWpLGIgX8PLz9yTs9p+M/c/YKikJByDqnzJz16dqkM9aHWsUbFJW?=
 =?Windows-1252?Q?KVEIRn7D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c59f518-fb43-452f-c3e1-08d9297ef426
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 06:39:09.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3JbkySaJxAVEKFxkY+R8/p/ltY7n9eAoqO288yrUq7oSMzRNKWsEernaR9UMEdH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4708
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, yes. I've forgot to include the infiniband subdir in the automated 
rename. I should have done that treewide.

Going to provide a fix in a minute, sorry for the noise.

Christian.

Am 07.06.21 um 04:33 schrieb Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/infiniband/core/umem_dmabuf.c: In function 'ib_umem_dmabuf_map_pages':
> drivers/infiniband/core/umem_dmabuf.c:69:10: error: implicit declaration of function 'dma_resv_get_excl'; did you mean 'dma_resv_get_fences'? [-Werror=implicit-function-declaration]
>     69 |  fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
>        |          ^~~~~~~~~~~~~~~~~
>        |          dma_resv_get_fences
> drivers/infiniband/core/umem_dmabuf.c:69:8: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>     69 |  fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
>        |        ^
>
> Caused by commit
>
>    6edbd6abb783 ("dma-buf: rename and cleanup dma_resv_get_excl v3")
>
> I have used the drm-misc tree from next-20210604 for today.
>

