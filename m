Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F9CCD2F5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A033010E37D;
	Thu, 18 Dec 2025 18:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3hyR2OI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3312510E2A0;
 Thu, 18 Dec 2025 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766082826; x=1797618826;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sOLK1VK6Cey+1vN2f0vro+Alw29qmkq2ialBNSm+8tY=;
 b=j3hyR2OIusQj84ziYqd4Rr9NRbkhrnKI/z57BtsjgsfYUe3oUuqZAxCq
 5KA/OX+Lq7HI8YRyOtnclS0Ar154nVJzxerd1LUrL8j5koVy4VE1ShC3o
 +/32sNwE3ehV/kUM7u8/LhfxPGojTuiTeJRvnBsxiBUzGTi+ben70vjFJ
 0L2FwqyX5oyEWgKTiK5ictdvd0cQudNvZAkPwdp8kNPgd38Ijq8kGZJpe
 IuwKkBgnNevyB8zs4GpY62p2Hxk1lioFsJUECIXWudZc7iN+S3OhNUENa
 Ggkd2eGAok9JWe3ce+cvAUM5hJaoS8zbQVL3a8eYMeD+A5Av1959igGLS Q==;
X-CSE-ConnectionGUID: 0D+EWmfeTS6kGjHb/u8aGQ==
X-CSE-MsgGUID: HKXpjF+jQEicqyPQgZr2Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67797276"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67797276"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:33:46 -0800
X-CSE-ConnectionGUID: 8RxbanSNRZSKe06WqF29ZQ==
X-CSE-MsgGUID: MMSqmr6QRzCdv3yABBLNjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229327186"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:33:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:33:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 10:33:45 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:33:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwbAwieghpCl/EOQ4drHYtbyhXv+nckj3qVKeUgLg8R2y8bQVtToNXYHxyyFQVOCmGPHxeAstby+J1jP8LnPgQKzc99KQs0B8dHUGSOUY0R2Tiy2oBvSGdxyFVkIqiGxo+F4uMYYRDeB18adFESpbh/b0qg29sQZlLCahIbiggcYIjwdcbnsyYt/IVKDr16d2Ah08BI+/58MvpLOdGEnQWINF0cArUFAQfRbRT6HeyH2G/G71cBjgh2JZW7HchzpTMXl7lDduSpSrnpzn7cxvPs+DNN4pw3XbiVdWJzn2y1tEVHDzkq9PMWNwtcF2XRulmEe3NenTYFuHps2OroDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKkjgmFib1tFjjOMfs6s+6q5BtBT5IZv1xovAo3VxbE=;
 b=hK4F4RlFVuO1BW6TvC7P3Oi3NxqQaHtk+aFXMe5rHCjR1VO9TLL5V6TXIUhMncEe+vfQCjG6pL8HlWzvvch++ycQy7h+CUMnjrg4VZ8EMaXtVIY7PFxkG4JRO8KbjsZmeFuEXe3eXmh/NLnxq9Lh0zAGAR53JD77kvpsMkmkis1uh9sqMwNJxRviLjHZLmUZc264j43YhcID4UThLzvFFcEPnCuBrVTwp/zqICZ8KO2C9VD3V80As5PJEkQXtkjLa1mWx7O9mNCaP630Ub7A+Yoqisl6Zb6cgx4oJXNAPe2zfQz82+PCe4o6ys1ogKIY3xTJdz62Yh8R2z2NV13HwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:33:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:33:36 +0000
Date: Thu, 18 Dec 2025 10:33:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 03/24] drm/pagemap, drm/xe: Ensure that the devmem
 allocation is idle before use
Message-ID: <aURI/tEMA6GInnCh@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218162101.605379-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d0a353-1c7d-4950-bdbf-08de3e63f509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Iq4D2DJZZF/3kJD6bQjB8tviiRVkczjJKpKybNQfwhArBIwEt72dwrUYNf?=
 =?iso-8859-1?Q?MwkEJ9S6UQcmuP0AkaXptXpQLVKuefFBJF485ODqo1t5N7rxhkugBxCj3g?=
 =?iso-8859-1?Q?JofHwHggLK0sI6vuYnGy9Vj9/Je09FjYibFZlVtO01smTssBCm8TI5IE5J?=
 =?iso-8859-1?Q?WmCWGRVvQT28jsjithabDqcJwrnd6mv3uK4+9OQ7LYm6Xw+ezOaW3h45n/?=
 =?iso-8859-1?Q?0z+AfysTRKR4deiod8fgf7Is9VJ+QVSlNwFUFEmhAvkhnCKDgaMo/uGH0m?=
 =?iso-8859-1?Q?i5mDaup4N/gP3nS+ajRfm3SScQr/UznNV05a+EYbML+2nyg+8ggQFyPOuN?=
 =?iso-8859-1?Q?m4cg8D4cwr8yNU3ie5uSqZVjzbaKqExMh1+hWhnCDmB9XiMn3q7hz2Pi/D?=
 =?iso-8859-1?Q?cVP8Fs9FYQ2JpY8o+XuEoYEZKDUTdjCtdKte7BB5ZDdUUY6jIGgpvxKyhs?=
 =?iso-8859-1?Q?+46CJgnyiw3tMhCuFVqVuicFPOq+Kpt9JdRtLAUNXA4PDcn8bd21wWnDdE?=
 =?iso-8859-1?Q?Tv87uS2sCp6eP9v0Ra2n7JX/no3CWpmaeb/BE9FJ5VzyjowB8X8xDjqq/F?=
 =?iso-8859-1?Q?LXeMp7DC9TCe8hTlPjpklmgoQXu3DuOU3mGjWUYQQqnPR3LNR65VJ5SZuj?=
 =?iso-8859-1?Q?pdn6BZCXbP0zWsgSnQDW8DqOjtn1SCXas/ds4RaWs3QaVt4uXHYhEB6L3x?=
 =?iso-8859-1?Q?LaEOHgbntrTA8ZU6AhZwIMQiv1r5xvktSnnlke/xd9IUt0JRDFiPuA5g2e?=
 =?iso-8859-1?Q?NyrpXj5Xx4IKH76u8AOPK5C3lskgTsD76kyyCh3XLXgOrcwBo3+bYhEzWp?=
 =?iso-8859-1?Q?QlW8Nu8Q0G/59KKmLMtumyN090BoFAbM7KEx8CLg2htfGRS3HWfZbfeuZE?=
 =?iso-8859-1?Q?im1N3/1gQ/g8zvyrSFZ1m7jexKADmnudBsjofj6TFfjYpb4aRFy/Kfscs0?=
 =?iso-8859-1?Q?FRzpVqA57AhRw+PyqrQlWQDuguehdzLhHuf2lHQXap7qHEF+TtnJ8dAqou?=
 =?iso-8859-1?Q?1poc6Lz9oZXU2JE766MiB88U5QGNwDsJ/04xPgvOgFS9IjDTFC44F1YOUP?=
 =?iso-8859-1?Q?d2I0jYH0VgEgtD3aN/jeAHs9KJh38zjkQ2aezndA6Q/iqoXY8E9YEKKEd8?=
 =?iso-8859-1?Q?MB/VOp4LI2aVeWyLRviLDQwHpohvztsVGLy6TQn8UIwgY1k1lQWGRHkxpR?=
 =?iso-8859-1?Q?ZXPTnpbTF0W1iSCvJ53//NDBf+4AeCTx3IaZRIjNCBj7UCiupsRNDoFH6M?=
 =?iso-8859-1?Q?SpGoGprDOWdyCuIviuVSQrbuCN8tP37QVN8xsQ/ewHqpIBivWfOACLIrCJ?=
 =?iso-8859-1?Q?M4Z5pXsbS20Cvv6w8fGfcmws1yzHWhwUouX0zWACGqAnJ8a2M5KqMLf1z6?=
 =?iso-8859-1?Q?jttcQa48pShXfmV+qosTap3yKkuW41dFYa9D5khiG1W06qp/TWW0Dc7hVn?=
 =?iso-8859-1?Q?pDNAzvy2fUhzVavAjdzswm2E8KT8IfJ48WkZFBrdy+mBjY/BJxlCmRo974?=
 =?iso-8859-1?Q?PRHTdfdNfpKl9oui7j/+Gl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HqTXlcxRh7wRKsVD+qWpknfl6NRRDqS4KNmFPM14fiJ1/KhfydGZZ4NJkU?=
 =?iso-8859-1?Q?dFzobm0+hbNnZ7RofM1QNHdUq1zR7pqyJBfTmiLg/x/S9GIl5zsgE01kLr?=
 =?iso-8859-1?Q?mxDzTec2x6zcjo/xpiq4Ln/FR/gAWdDDtI4hcYxdeNZm//n61kD0ZAncaa?=
 =?iso-8859-1?Q?r15LqVBzGGDSOIhkmqJUguNGK4Juzx2r+Vn5BrQyFFIDoabcF9EhidGgeT?=
 =?iso-8859-1?Q?PINpVXk2nAfdA0iSlbOM9JJTL9sp4a4E9gNjNYv0nzG2Uzud1xlgxjb8gQ?=
 =?iso-8859-1?Q?yc1ZzAONrRcrwcreLtZNiBfdk9CvcFGp6NA4cNrGRAfknOxNafQOYCtpoH?=
 =?iso-8859-1?Q?8UURPQSFKxloaBIhjRG6Nq+wAl9vUXxmAEK5KRJBq2To2/28xK3aFtUNuB?=
 =?iso-8859-1?Q?Ws/nR6kteCDOuo+gH548qqkIMxAB2pcpJKEfu3Ze0w04uezpF7XnKxEC/M?=
 =?iso-8859-1?Q?Lm+w28kWI9wU0HdwcqeAUn7IICoYCyidYLkA1yt/VjZQx4ezuLYigEJb8y?=
 =?iso-8859-1?Q?Jt6CZxGiQzdntayZYBut+TAEok6s4JTOcgixUDOV1s5KhGccGBGD4BvaE8?=
 =?iso-8859-1?Q?ymSJFXFz5FZ8npkSAHF0MIHzE0H2jlAtg/MH3MqPFVg8MkPrtlp9V+YSKd?=
 =?iso-8859-1?Q?eZbTBOHKfeE2LTiioYuOQosW9Bq61E9f2sBwy7T2HWlD7PZETJC5/3IeyB?=
 =?iso-8859-1?Q?d61CwFNLqWaADuDsehMiBNz/NRya2OVpMpBoeRGVa0H3+5u4IjMQjxcJRv?=
 =?iso-8859-1?Q?fFR9kGVWX/bpu2pK5+6QkjMrvhh7LYbWS8lKVdAxxXR3j8C6yfN+7Pll5N?=
 =?iso-8859-1?Q?BiITTEmCI6QQ1gGC0olIAZVSWdBawZez14WlIvRm6ahSs4Hk5byq42SsRM?=
 =?iso-8859-1?Q?17k1NKOz57W/w6b19ZQYKy1XlibcXEC9eZkm/xQR8HJTIPKxFHEXvuI4qJ?=
 =?iso-8859-1?Q?ui67viW3LnEg+HbWdikAbsOWvNMggbJvxFdqP4EQq3ld5Cdk1sY39Fs4eF?=
 =?iso-8859-1?Q?HhocCBe5s6ceBw5yvTWiT/3nnar9AFL8w4M4VNKvTIJScjMuaocbMEAhLh?=
 =?iso-8859-1?Q?ZDKblD1alowiPmNX6qmp8QpPFZV8fZOR1GW1evwo0GR68///I849tIm0Ry?=
 =?iso-8859-1?Q?4gJ+klj3Mn7oYvvAR7c97kAqK28phQWoRS9SKvQs2uoFxS6Kz2Hoj+L2yX?=
 =?iso-8859-1?Q?2ysVhOVP9zUXfK7dXj9uHE/AAFlkjYs5mIdaJMwaJs99YJezr+nrimGd3u?=
 =?iso-8859-1?Q?0qfuyOVDSCzvHZqyxsBvO26tNFlbBOnTbs4kLkn7a2M4TDlLLBz4lLkj0C?=
 =?iso-8859-1?Q?+4IafcaU8K25Wa9mHNDKPTuGU46oIfBwuKS6h9SeYcB8+FswVUNH8WMvX4?=
 =?iso-8859-1?Q?SJxsZxGZCy3plx+/psECvCrLv4n/gCumuBXx2yBS44zezyzbAJ2VGzTill?=
 =?iso-8859-1?Q?7UJgp/phgfnlg4Q/SPQafdOu89Y62rsT0h3d33SrKQioRYJUiDefpgv+ot?=
 =?iso-8859-1?Q?PU4WrQJUS1fmsgVEFaRm35oPf63Puhax8Du98tJGMGVg39Vh/RyWU/8GJP?=
 =?iso-8859-1?Q?pMiVPBCOAPZABU+XiyH5qi6jzhNkO/YDk1wGEIpA+Fu+E+329oLdk5oBhr?=
 =?iso-8859-1?Q?p/zfFIsGPPj8mrfUP6jOAkPBcHbOIsl1NXkj2anv1/AwVquxShvl7gNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d0a353-1c7d-4950-bdbf-08de3e63f509
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:33:36.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oP8B46RkkYx37MQJPGPI/az6YIfIReSj22E+TbaVuiL1FzEqEkhbQYTJEAJGZ02Msref06soD7Y+yj2RrExsxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 18, 2025 at 05:20:40PM +0100, Thomas Hellström wrote:
> In situations where no system memory is migrated to devmem, and in
> upcoming patches where another GPU is performing the migration to
> the newly allocated devmem buffer, there is nothing to ensure any
> ongoing clear to the devmem allocation or async eviction from the
> devmem allocation is complete.
> 
> Address that by passing a struct dma_fence down to the copy
> functions, and ensure it is waited for before migration is marked
> complete.
> 
> v3:
> - New patch.
> v4:
> - Update the logic used for determining when to wait for the
>   pre_migrate_fence.
> - Update the logic used for determining when to warn for the
>   pre_migrate_fence since the scheduler fences apparently
>   can signal out-of-order.
> v5:
> - Fix a UAF (CI)
> - Remove references to source P2P migration (Himal)
> - Put the pre_migrate_fence after migration.
> 
> Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 17 ++++++---
>  drivers/gpu/drm/xe/xe_svm.c   | 65 ++++++++++++++++++++++++++++++-----
>  include/drm/drm_pagemap.h     | 17 +++++++--
>  3 files changed, 83 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 4cf8f54e5a27..ac3832f85190 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2024-2025 Intel Corporation
>   */
>  
> +#include <linux/dma-fence.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/migrate.h>
>  #include <linux/pagemap.h>
> @@ -408,10 +409,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
>  
> -	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
> +	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> +				  devmem_allocation->pre_migrate_fence);
>  	if (err)
>  		goto err_finalize;
>  
> +	dma_fence_put(devmem_allocation->pre_migrate_fence);
> +	devmem_allocation->pre_migrate_fence = NULL;
> +
>  	/* Upon success bind devmem allocation to range and zdd */
>  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
>  		msecs_to_jiffies(timeslice_ms);
> @@ -596,7 +601,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(src[i]);
>  
> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -719,7 +724,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	for (i = 0; i < npages; ++i)
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>  
> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -800,11 +805,14 @@ EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
>   * @ops: Pointer to the operations structure for GPU SVM device memory
>   * @dpagemap: The struct drm_pagemap we're allocating from.
>   * @size: Size of device memory allocation
> + * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
> + * (May be NULL).
>   */
>  void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     struct device *dev, struct mm_struct *mm,
>  			     const struct drm_pagemap_devmem_ops *ops,
> -			     struct drm_pagemap *dpagemap, size_t size)
> +			     struct drm_pagemap *dpagemap, size_t size,
> +			     struct dma_fence *pre_migrate_fence)
>  {
>  	init_completion(&devmem_allocation->detached);
>  	devmem_allocation->dev = dev;
> @@ -812,6 +820,7 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  	devmem_allocation->ops = ops;
>  	devmem_allocation->dpagemap = dpagemap;
>  	devmem_allocation->size = size;
> +	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index bab8e6cbe53d..b806a1fce188 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -472,11 +472,12 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
>  
>  static int xe_svm_copy(struct page **pages,
>  		       struct drm_pagemap_addr *pagemap_addr,
> -		       unsigned long npages, const enum xe_svm_copy_dir dir)
> +		       unsigned long npages, const enum xe_svm_copy_dir dir,
> +		       struct dma_fence *pre_migrate_fence)
>  {
>  	struct xe_vram_region *vr = NULL;
>  	struct xe_gt *gt = NULL;
> -	struct xe_device *xe;
> +	struct xe_device *xe = NULL;
>  	struct dma_fence *fence = NULL;
>  	unsigned long i;
>  #define XE_VRAM_ADDR_INVALID	~0x0ull
> @@ -485,6 +486,16 @@ static int xe_svm_copy(struct page **pages,
>  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
>  	ktime_t start = xe_gt_stats_ktime_get();
>  
> +	if (pre_migrate_fence && dma_fence_is_container(pre_migrate_fence)) {
> +		/*
> +		 * This would typically be a composite fence operation on the destination memory.
> +		 * Ensure that the other GPU operation on the destination is complete.
> +		 */
> +		err = dma_fence_wait(pre_migrate_fence, true);
> +		if (err)
> +			return err;
> +	}
> +

I'm not fully convienced this code works. Consider the case where we
allocate memory a device A and we copying from device B. In this case
device A issues the clear but device B issues the copy. The
pre_migrate_fence is not going be a container and I believe our ordering
breaks.

Would it be simplier to pass in the pre_migrate_fence fence a dependency
to the first copy job issued, then set it to NULL. The drm scheduler is
smart enough to squash the input fence into a NOP if a copy / clear are
from the same devices queues.

>  	/*
>  	 * This flow is complex: it locates physically contiguous device pages,
>  	 * derives the starting physical address, and performs a single GPU copy
> @@ -621,10 +632,28 @@ static int xe_svm_copy(struct page **pages,
>  
>  err_out:
>  	/* Wait for all copies to complete */
> -	if (fence) {
> +	if (fence)
>  		dma_fence_wait(fence, false);
> -		dma_fence_put(fence);
> +

Then here...

	if (pre_migrate_fence)
		dma_fence_wait(pre_migrate_fence, false);

Matt

> +	/*
> +	 * If migrating to devmem, we should have pipelined the migration behind
> +	 * the pre_migrate_fence. Verify that this is indeed likely. If we
> +	 * didn't perform any copying, just wait for the pre_migrate_fence.
> +	 */
> +	if (pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
> +		if (xe && fence &&
> +		    (pre_migrate_fence->context != fence->context ||
> +		     dma_fence_is_later(pre_migrate_fence, fence))) {
> +			drm_WARN(&xe->drm, true, "Unsignaled pre-migrate fence");
> +			drm_warn(&xe->drm, "fence contexts: %llu %llu. container %d\n",
> +				 (unsigned long long)fence->context,
> +				 (unsigned long long)pre_migrate_fence->context,
> +				 dma_fence_is_container(pre_migrate_fence));
> +		}
> +
> +		dma_fence_wait(pre_migrate_fence, false);
>  	}
> +	dma_fence_put(fence);
>  
>  	/*
>  	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> @@ -641,16 +670,20 @@ static int xe_svm_copy(struct page **pages,
>  
>  static int xe_svm_copy_to_devmem(struct page **pages,
>  				 struct drm_pagemap_addr *pagemap_addr,
> -				 unsigned long npages)
> +				 unsigned long npages,
> +				 struct dma_fence *pre_migrate_fence)
>  {
> -	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM,
> +			   pre_migrate_fence);
>  }
>  
>  static int xe_svm_copy_to_ram(struct page **pages,
>  			      struct drm_pagemap_addr *pagemap_addr,
> -			      unsigned long npages)
> +			      unsigned long npages,
> +			      struct dma_fence *pre_migrate_fence)
>  {
> -	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM,
> +			   pre_migrate_fence);
>  }
>  
>  static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
> @@ -663,6 +696,7 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> +	dma_fence_put(devmem_allocation->pre_migrate_fence);
>  	xe_bo_put_async(bo);
>  	xe_pm_runtime_put(xe);
>  }
> @@ -857,6 +891,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      unsigned long timeslice_ms)
>  {
>  	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct dma_fence *pre_migrate_fence = NULL;
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> @@ -883,8 +918,20 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			break;
>  		}
>  
> +		/* Ensure that any clearing or async eviction will complete before migration. */
> +		if (!dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL)) {
> +			err = dma_resv_get_singleton(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +						     &pre_migrate_fence);
> +			if (err)
> +				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +						      false, MAX_SCHEDULE_TIMEOUT);
> +			else if (pre_migrate_fence)
> +				dma_fence_enable_sw_signaling(pre_migrate_fence);
> +		}
> +
>  		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> -					&dpagemap_devmem_ops, dpagemap, end - start);
> +					&dpagemap_devmem_ops, dpagemap, end - start,
> +					pre_migrate_fence);
>  
>  		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>  		list_for_each_entry(block, blocks, link)
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..70a7991f784f 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -8,6 +8,7 @@
>  
>  #define NR_PAGES(order) (1U << (order))
>  
> +struct dma_fence;
>  struct drm_pagemap;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -174,6 +175,8 @@ struct drm_pagemap_devmem_ops {
>  	 * @pages: Pointer to array of device memory pages (destination)
>  	 * @pagemap_addr: Pointer to array of DMA information (source)
>  	 * @npages: Number of pages to copy
> +	 * @pre_migrate_fence: dma-fence to wait for before migration start.
> +	 * May be NULL.
>  	 *
>  	 * Copy pages to device memory. If the order of a @pagemap_addr entry
>  	 * is greater than 0, the entry is populated but subsequent entries
> @@ -183,13 +186,16 @@ struct drm_pagemap_devmem_ops {
>  	 */
>  	int (*copy_to_devmem)(struct page **pages,
>  			      struct drm_pagemap_addr *pagemap_addr,
> -			      unsigned long npages);
> +			      unsigned long npages,
> +			      struct dma_fence *pre_migrate_fence);
>  
>  	/**
>  	 * @copy_to_ram: Copy to system RAM (required for migration)
>  	 * @pages: Pointer to array of device memory pages (source)
>  	 * @pagemap_addr: Pointer to array of DMA information (destination)
>  	 * @npages: Number of pages to copy
> +	 * @pre_migrate_fence: dma-fence to wait for before migration start.
> +	 * May be NULL.
>  	 *
>  	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
>  	 * is greater than 0, the entry is populated but subsequent entries
> @@ -199,7 +205,8 @@ struct drm_pagemap_devmem_ops {
>  	 */
>  	int (*copy_to_ram)(struct page **pages,
>  			   struct drm_pagemap_addr *pagemap_addr,
> -			   unsigned long npages);
> +			   unsigned long npages,
> +			   struct dma_fence *pre_migrate_fence);
>  };
>  
>  /**
> @@ -212,6 +219,8 @@ struct drm_pagemap_devmem_ops {
>   * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
>   * @size: Size of device memory allocation
>   * @timeslice_expiration: Timeslice expiration in jiffies
> + * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
> + * (May be NULL).
>   */
>  struct drm_pagemap_devmem {
>  	struct device *dev;
> @@ -221,6 +230,7 @@ struct drm_pagemap_devmem {
>  	struct drm_pagemap *dpagemap;
>  	size_t size;
>  	u64 timeslice_expiration;
> +	struct dma_fence *pre_migrate_fence;
>  };
>  
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> @@ -238,7 +248,8 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
>  void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     struct device *dev, struct mm_struct *mm,
>  			     const struct drm_pagemap_devmem_ops *ops,
> -			     struct drm_pagemap *dpagemap, size_t size);
> +			     struct drm_pagemap *dpagemap, size_t size,
> +			     struct dma_fence *pre_migrate_fence);
>  
>  int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    unsigned long start, unsigned long end,
> -- 
> 2.51.1
> 
