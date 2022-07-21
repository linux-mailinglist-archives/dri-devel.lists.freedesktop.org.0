Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1557C5D5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 10:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DB12A57D;
	Thu, 21 Jul 2022 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4FF2A5E7;
 Thu, 21 Jul 2022 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658390941; x=1689926941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UkjNhK+n9HBVy/4C7z/d06s5bZz9y8AZt8Z7AJjGcIo=;
 b=lq2fnFv8FUPPmtBN/ibwzYcO1YIEC7ZWD/Rpotb90s9hCxAqtP7OGUr9
 +ElblqBg7YQDSRhtlpoazXJ+kt04+99ynB2EO36olhvNX85UDibPoOOA4
 66I1skYQtF+O/aQvWAor9fnzj+MVxOf1nAvSzEiqmKzQ9L5b1dCPqBQye
 3FyXqtJWwBt4Ww84WgEytrA06szSVX6yw70cxAN871H3GF2z95BBpznFL
 Y1PF350vIhu1QybJ3Pl2wUaIbVTjkU7B774FeZM8+OJp2tv+/joB6sAI7
 zqtsqpQmSyDg3NEtK+EJEWS5grcNC1WuERm81nKF+6LEsGrJxFnCg5C2F w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="348677972"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="348677972"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 01:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="598377264"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 21 Jul 2022 01:09:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 01:09:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 21 Jul 2022 01:09:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Jul 2022 01:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5IzqvUQpTzIbfQHGk53iRcz4Y361TKe1Sv3GUkPiSfPekX2rOBYej6I3Ii1aKPCCbMmZ1wGCKKmkqfVc4JpkKiY6bvEJ15VAk0cQ3lYvkThp301NVkSPw0otRnEjEs+gqMyRGcu/AJyghbmbeBxKilnzFD1G0TBnVodlXCvjsa+qgs+f7z9WZIiDqVJ65rrgKhiSE5VBPTmtpP1UfAEmuBb/42aNyp6aV4sXU2AV/PBU+qsBx1PgmaxBQCa3ngu/pPEkDK4tsp/pIp9zYlN1XjO+P/8Ihe43PBD/tjsQAVHyf5USnOlRAtSpnTiTtkCLAO26MYUpAQ3SrFxJKHj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkAQB47a0OZREHwZQNRVP700pB5tYnZfGr+p7ofQ0TY=;
 b=k3KpqdXkz1hVC+zZJFqKhrhE6GFjN2DSS8G3Gl9/keOBWIdhwW5HG6A/rUE42k/6FokPUTjCx4At/QJ0w8RVQyaYEwiyHypLWk8EtcqfrD4yB0Qm36PBuFS4Tqru9lWhcLmRqwaSKpf7Q1gSRqccsd6wUAO+vNOu5251yH/LJkzrAaJlWpZ+Nmklag4w1cXk0VybEbmaak4QkI9cvHS+TpdJ03vAFxDm3y+VzXAxNCR4dLFC7qGkWVgxbTyOOf5sTMoM4pvlSnZE04SiQfMBJwFNvtyTgzE6aeW+Y/X5haT7Hfb1ShsYIKYMBQmIuzIzPUeb/Pvd/pYTLCMvJGadeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 08:08:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%5]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 08:08:59 +0000
Date: Thu, 21 Jul 2022 04:08:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Fix comment typo
Message-ID: <YtkJloZH8kndzKnZ@intel.com>
References: <20220716040520.31676-1-wangborong@cdjrlc.com>
 <d8e59a7f-5eab-3c1b-c8d0-f16e07d63f18@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d8e59a7f-5eab-3c1b-c8d0-f16e07d63f18@intel.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81426009-4ce3-45f6-0c81-08da6af04418
X-MS-TrafficTypeDiagnostic: DM6PR11MB4626:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uh54IfVc02MO5A7FejGS0Ur4KZUv0n0ABha6LVU+TxUffUC3KpIbgZuNq+jh2x8r5uzpoU+kbPsjHEHCqgISQpuAPRLwP/0vlwT29GCIiuS3PGCBG/l9k5vH+F3/9xDiFPqMV4jNdNm3EzYszW9G3n/wcFHcEWBwzCAMuurrHwsJzm8yliymRQSVK465ZwhJwGq66miAwR+Uli6RP8oGzCkxOFfAFUzrUOlhwx3JwShnyL5tYSWKcNAmqiqzGW1sjI8gSbzzpWLx+21y2Tf8PdQrlaFhS45PVSf8GM9DYzRsr7Bb4AOjYuTUbqy9lvRrs2KRtAzqDFMTBaOyEtYzDKur78oIYRd3H0mJ8fcwvVaQ4HwYupnnKt5wmbdQYeNTolWOnRg2MAud/xa3/bLyoz94P0H8/RNAnRDtlFvUZ72S1Ut7RDoFJ6P6ioG/9D8zjSxGgdncMQFPF3tCmHKCcFqSzOHPu9GNzjfCNW8l6tRJfSdy55cEbc/tZu+8TfdxYxOeaYRqNvsmHfXjqo6PahCCf671pcoXi7RIQ2KxZ0nVekmeB0lHRDlebrKeT08FT2Ey1M1+zI+4ChvvLDXnFpErs1e5v5VmjkE5Va5krhXHEhzNV7+xp6jQoC9DljU4W4im1XTwqfBUoP2HzyTNgnnOExAtwbRsjvU2FAxItKFQqRYyOTvwb+a4IRwKEzW9Vg2U/gfKrtc5pvVuZ6P/4Yd6289x7RUIJw0+y4QMTPtpZnc0ShjV1eGnR8Ea8pkO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(136003)(366004)(346002)(83380400001)(186003)(2616005)(6666004)(36756003)(82960400001)(38100700002)(6486002)(4326008)(26005)(6512007)(8676002)(6862004)(6506007)(66476007)(53546011)(66556008)(66946007)(478600001)(316002)(41300700001)(86362001)(5660300002)(2906002)(37006003)(8936002)(6636002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xggr3kzN1LTpRnXM0Ty3KgVqdw1wvG5+Y/dGVO6XQvBqFSk6r7z70pG2f9CH?=
 =?us-ascii?Q?7oQ4opUD1dokOZq0KFyswMd0bXrVOZTCFe57VfVXIJ9Cp8p19YncUbcV7UGe?=
 =?us-ascii?Q?JbDo59BLxA6mJbAbJpkBlLMp0gLkw50/xfxcyoE7gz+HIFjKDRmspe4KypCG?=
 =?us-ascii?Q?Vjo9CmqQfOYahUMQ5yEAlP6j0gFgZUaSWSsdEWb/IAPHrt9/zOD31rk4o1Wk?=
 =?us-ascii?Q?cLDs6ubsUx7DxyeBZJnc8MW0uIMbZHOP/8Nw2fyLLwJ0JiFv4SfWRtBxBzYE?=
 =?us-ascii?Q?2Hb999O1RWU7TO9giROyvu4eCTWelJofjG9rG6GM9dw2t/CMFRgpcZq+UWlS?=
 =?us-ascii?Q?237n0BC1LBYuNzcuLVzvUd67sj72SPXbhZMi3/3r5W/IV0xC/Y4PdY9rHoVl?=
 =?us-ascii?Q?X3YjZBIQz5llQD0ghq+ArHXlHLh3TM4/d+fY/prfyMp8UoLTEEczCQe125tY?=
 =?us-ascii?Q?ZShuQPZDW8DbfFr5q6olU4xiPX4qbr8xKXh95YR3s88lu1QmpHVF76F7OuFh?=
 =?us-ascii?Q?qw28EOsOzBGI/kaLrEc7rG4OsDIRvXhsz4A/WlJ2u570lQdDyvrqzeAFMY0v?=
 =?us-ascii?Q?++HKrX5EoUAzeL/ESiOpMVeSyE2k+aDYqbQFHBwX45eVEBBiu0RETQy4fYjk?=
 =?us-ascii?Q?WyXSjkX7TdSd7KXK7smy8ch53mHmZ427I+84D5zUBCZRgiXXsot0gKJ5tTf6?=
 =?us-ascii?Q?zj7b/IMWHfumcjUF26GFT4BY1Gt9rM2juf/RWBQvIAPmV1hC2GSBcxsND2Xw?=
 =?us-ascii?Q?ijyvzlJzz4kKWY/l/yPYKSr6cisD5NOhxwCJTLHYKVCsmC2VFlidgVDTnBdm?=
 =?us-ascii?Q?j7/kN4NUDMdTqCHxl+3g+Mgme5a6w026hnlDRwWDlxj3Kbd+PbW7rFLjhijq?=
 =?us-ascii?Q?YJpJXKZ6N2bQiKvPsHwoct4BiQnV36tAiSkXh0BL/kVJ/f4+feiz2JENNg5u?=
 =?us-ascii?Q?TwMMje8Eo/dAqb+wYwOrWm0qNLj05nXcpUYR1D4VHZ3qbf6lOTvnfGW6aVbW?=
 =?us-ascii?Q?aHiW3qdxVKnow2sjPVWfD1bAhXKywQE2BWu9sINakOqZzS9rruyXNz2JYP7w?=
 =?us-ascii?Q?nmjLKGimWqhyt1oYg6wXaeS1jGH8NtFjccCuLI29FDJxai0n9fz/HZfDbBIA?=
 =?us-ascii?Q?VM3X1ManJY+Y9IMJEr1hlO+T5bmhKvRFxLkTpEtn1igsz9WsZManAqCPGPS2?=
 =?us-ascii?Q?a60kB6MUrj4fUK1bKSwAW4UgezLhUjqxjO8N0+Fri/Ub7B3T4zx4A6euVZHs?=
 =?us-ascii?Q?UxrGMDIN5KwPwFJnp2vNv9VLfCGxR7k+yHqh4J46S3r1HJfZvw43qKMQKSVp?=
 =?us-ascii?Q?1P5O1906wWonwSB1eL5KY5+c2fjIaWI9Ubf5jH9KVBAcLLEHLZI54PoyX0AQ?=
 =?us-ascii?Q?kNnJdsA8wsCCVi+eArsKJec/4Z6e6Kdqe4ZPSThT1dMHrkAKI01cy4nwrkSM?=
 =?us-ascii?Q?GmMEJbVfWZjmpUSW1boIluCJcFme4mjsg9FC7CYPbXSWJa1JgtVhy6xvCWka?=
 =?us-ascii?Q?EiKAmi7VoRL6MZQvCF20VC1/4APlzDJeAUaZDZh30ca9RJVx5/Um/NBOguXm?=
 =?us-ascii?Q?WQThle93xijlH/PQ3r7hrY2NKt7ksQaHCbu3ykRQ6Ne7bZr9JaoGSa8TcnEI?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81426009-4ce3-45f6-0c81-08da6af04418
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:08:59.6280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjtXNBdrQ9MpDD/LOWbXAQduPjgGPkL1csdoDNlBMSLxV4HcWXXLbIEu7+RIDO+M0tipSjinzBtC6TwAnJE+RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
X-OriginatorOrg: intel.com
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
Cc: michal.winiarski@intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jason Wang <wangborong@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 zhou1615@umn.edu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 06:56:16PM +0200, Andrzej Hajda wrote:
> On 16.07.2022 06:05, Jason Wang wrote:
> > Fix the double `wait' typo in comment.
> > 
> > Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> > ---
> >   drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> > index c56a0c2cd2f7..ec05f578a698 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -971,7 +971,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
> >   	if (err)
> >   		goto err;
> > -	/* Force the wait wait now to avoid including it in the benchmark */
> > +	/* Force the wait now to avoid including it in the benchmark */
> >   	err = i915_vma_sync(vma);
> >   	if (err)
> >   		goto err_pin;
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks for the patch and review. Pushed to drm-intel-gt-next.

> 
> Regards
> Andrzej
