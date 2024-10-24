Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B59AEA52
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171610E96B;
	Thu, 24 Oct 2024 15:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nM8E+1JY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0A10E964;
 Thu, 24 Oct 2024 15:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729783372; x=1761319372;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ACKpMydnHY4kuAqFyfHn6oRhm1dA5qgC9FLWiKVxp9M=;
 b=nM8E+1JYp2tX75xEQ2pGPI2E+Q9MdvbIHq77ovdIYmIT/7RS2B35O/17
 lMx4mM77lJbFypNfsokAvnrA7rIYITqOfABg/jGQIA0EZaXe0C5NJna15
 lYtpG3qkuawenWeJlD2JJ1++M0kpQAhxW2jaXMJ+eNOsS/h/8xVjE5cCE
 3OEpNhowKdFxDGJGUzTtM83mxXpO2B6Y0sne7JBgT6bEGO1hjq2RHg1aV
 OqBRBpaW4RDb3ffMOS7+Z5jZqlNeUyR6C0OJAuQ+1KCh97OMQAICoDQNO
 ZDEcnyb2EuRK4bS+ld6wdUpE3Jkn3Nl10MpCETLTxhmjE8ZwEwpymLfuM g==;
X-CSE-ConnectionGUID: ZAFtByX1QHOcY4cNhTNQBA==
X-CSE-MsgGUID: yoyvMyC0TUCIgVok++Eg2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40031099"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="40031099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 08:22:51 -0700
X-CSE-ConnectionGUID: I31c7EcDTqGLTplYVqMuXg==
X-CSE-MsgGUID: 66e99YtbSuuxfMFCTtNNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80272370"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 08:22:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 08:22:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 08:22:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 08:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwpncz4ONepJF3bJNtkiXViNT+BUAqPSdekFG6LqN2eoUrcHqVD8De9vxL1xq9bs7Z7SxvEvwUcol8Edy61N73JQQR0U+O6viBA0bCITX6NBXLcC3mxhoz2D7CcMuk4E2Ngdz4jlKd5yWpmaZ9UxppWHODGd3fiPewgvLqCI2mUGZrNfqOEdFyHZJE+kkbYB0YPTdtK6y0jtXZj3DkhvMfMfLu3Z6mcyAYrzSzYSEf7lbxnrVMonBRbq8QLtaMvbw3mZVB+ixrOhwWYlaKlznysz85PoWP+UDevQiVfta3gyBeG3NxaxMIrl+L8J4vlje9ji4YsJx7gXFTBljRwuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5v/z9rggxTmamcwhPi+rxYN/9I+njAwwCxkleJGtew=;
 b=Yhm3QlF0wdiNbsg9+5ddbmTjxp/lLBlh7qJ1YHN6S17YjDvPnRKiDRA6dh4x8UG0KL0XIQDqfoEZJnXWAMq1/3dc+SJ4/Nfu+MaI1eojCxbfYw7aGfyjyQpuk88QcDvJBML6WZpctVSNcwyEwkNc1q8qO5g3GsZAaBvjGP9r/32ZarlRgiDoSV1zU1cga2azBt1x9uGEPzIkbFyNb33MKIq0jprQUbKF9T7bVYnUtimFZ1KtNj14FnhEGSRQBCXC6jnF+0RjLVqw7dwGnAojp2pKK2r4i/u5jBXiy8XKHxc+mQOeP2PuSaX0ddTVD4rQpTfOru/XfDzGJjvZeDfx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 15:22:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 15:22:42 +0000
Date: Thu, 24 Oct 2024 15:22:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <pstanner@redhat.com>, <ltuikov89@gmail.com>
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
Message-ID: <ZxpmLXH/R45GrVbC@DUT025-TGLU.fm.intel.com>
References: <20241023235917.1836428-1-matthew.brost@intel.com>
 <74f7344a-dd8e-4b20-a980-daf9b188df7b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74f7344a-dd8e-4b20-a980-daf9b188df7b@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 6228c1da-820b-452b-e183-08dcf43fb42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gRnXJ2TeytZp+XpiwQUp7+5gl48Mm666oLRkXnS4rcEfNQp3SMv+LVg3vT?=
 =?iso-8859-1?Q?PvfqQQ5JpaTGtNSSyWEleW2tJC9Bnnt2MUBcMOmonJ4bxzx2RkObvL96Nm?=
 =?iso-8859-1?Q?qC/Vr9Ige+B9VeeDukmhJy65ZrfOnkOwrp+8U0f55J0O5yvUAbGjY8RCc2?=
 =?iso-8859-1?Q?H64Yz51eAfJPCgePn+RDIULr9GUGwy/LxZTBPQG92ojBuG2xYCnHlQ5dL9?=
 =?iso-8859-1?Q?IVaAb4DcjCzRQma4G7yCL35KkYXNXhPTgvThrQTGvWblp9D4hhUHs7tXVs?=
 =?iso-8859-1?Q?2X9imRPHAS8fHHWRbiaY+wLjx6V2/7ZkfvkjiegVPppTtRlourjJlj5M4m?=
 =?iso-8859-1?Q?IGFHog8s5/zNlE39iy2HOXKemwgyiCdW3qj/KD7aaGm5iTNVJR92glmXAM?=
 =?iso-8859-1?Q?VGlqA3vuI4A/1JNYENMq69OYdyIbUEJ2bfO0FY2o2u0rAHeOK8zkQ66FUC?=
 =?iso-8859-1?Q?XHeVhxrfPMWePwXnYC/WKCo0m4aJNNvN6RbVnlyTQ0qE84ZF0Ne3jeCDjT?=
 =?iso-8859-1?Q?RUvE7SvuICbVucEkbMViPdkZwqaFXDksC8gHKnHaD3iHiOkU0vEK/RYbQs?=
 =?iso-8859-1?Q?njEEzadJs53Rmpbg52Xx3wgCAZ7gwqAH/zxYSqvrHmB8tJWN1NwBtFU2lh?=
 =?iso-8859-1?Q?uifiZkDfosayeEPc5gtumim9OHX85Ak4gHFrfepYwSjfHqQ84cQw55DJB+?=
 =?iso-8859-1?Q?gTIPi5UGz/9Z3C7wGJuyp4SLlX28Y92wwILVAJzQ3UfplJqFViYjaoX37x?=
 =?iso-8859-1?Q?vXOJuBNCjjxv0cghTem7ymmxQx0YSwZzkQET8P1z8j1JJu6PxCKEnnJq4J?=
 =?iso-8859-1?Q?KNG1xNioWD5i5yrkBJdhyqliX4IVRMiodC7z5lpqrwy98wsqGtOoN3VxT7?=
 =?iso-8859-1?Q?HwgfJPqGJdWsQUnNcOy7g/w9zEzkrgrmZ64eg3I4QSjhyesw6JZ+WdCewQ?=
 =?iso-8859-1?Q?KZwXNYChqD2R2I//ytfeWQwWisiPiZ1hBhKuHgjvJulKoCg64LjAm/w4+v?=
 =?iso-8859-1?Q?aAn2yKNckC3cfPlSHk9iFRlH8whvPJ3ZjX077yd822NnIt4SRo7hIB9jTY?=
 =?iso-8859-1?Q?4tJruJgWAk/k8ZT688huG/Wzug9bQBZoW7r5voQuTWxNhBqExmk+xI7Jp/?=
 =?iso-8859-1?Q?y6zgFujSRnKKDCQ0yLxBARlJ8G7spdBNf7Plxg85wpBZj1yGOKEEwfppem?=
 =?iso-8859-1?Q?TigGp7EzhluDVpDWor5NRU0vT+7uCZANlBKl9EsztPpilW1cVrTGL+e3f1?=
 =?iso-8859-1?Q?OG9xXJW7n2BU8jwXVf8rnFRAUWOvrm3VfcXDptvwY/YHI0fW1m37G1yxsz?=
 =?iso-8859-1?Q?kvZnUZRidc6EduQ6t05aP/Gdv9BJtwJtbh8X3XAwg92TNSK53agrOC3LTv?=
 =?iso-8859-1?Q?5hvCbEb/f/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DaTSEw1MME9VZ+tpNp9dwMtdp06VlcAHXx00WggmipgM6H05+4A8SH4oME?=
 =?iso-8859-1?Q?tgdA+BR+Cq2GuuYFQmglg5boElTg6Sz/yVM3oqF07+QPzWzxjo65yrhTg1?=
 =?iso-8859-1?Q?Y1vLJF19ZdaFM+l1DIFV8t+9xFBh1baCy52Of4X1x3Qs6koRFkBL4WXwR/?=
 =?iso-8859-1?Q?ZOxmj+ncqbAoDnozVW+NHsKqwm6pDuj0uAblLdrk7CZRHCKJxq6VKlReLL?=
 =?iso-8859-1?Q?8h8Ce01OD7i5IFuRTlSI1FUCsVlCE5g6OayNWDbEKE2yDupQZWAZZDubGN?=
 =?iso-8859-1?Q?Lz4gW9J6R/Pb6hjtnAhXPH/eMHsqf1RCb5Tkyn4f3nOzMouHFi3S9czzbc?=
 =?iso-8859-1?Q?ET1sdeNExsgo2D0Pqw7Ln1zncNTabdGwiOZ04U+hmBDOMeIoZYGeqB0Vg5?=
 =?iso-8859-1?Q?fLFYYD/Zj+x2a3jEZoZIhBv7d5nEzN5NfwyzZp0hfo9x2JCzILDmvsg8VR?=
 =?iso-8859-1?Q?NqVBbaoNrvA0RXLrmgNVDmFu8w3vXHLqZ0+GmTIuQMPtPc2BZT890KAvRR?=
 =?iso-8859-1?Q?ONVHRlDmu6M+glJkwdBZkKAni9ucZdUiioRToL6keKM5L/ChuvtbZ8wixC?=
 =?iso-8859-1?Q?36tEcWNH1Z6K54bRT24TEFQ9Ulq7+Jww7ArCIfkEbZnsrLIvzesVkDi0Hw?=
 =?iso-8859-1?Q?opxzdeqz4U/0IrLGtfpOzAHc+gUVNdcXXU2+L1pJ2E4SsYOgTv2ncYvs1K?=
 =?iso-8859-1?Q?UcXCFnAZarVyZCuK3Fpm38aEWseg3ZNmsVyUhU2z3zvrVYWxYKEDt/t/3a?=
 =?iso-8859-1?Q?oyw2vZbb3RJCOMs655PD7SUqoQj/bD67FwDaPFHnoqomqtBXHxbHYMNZdc?=
 =?iso-8859-1?Q?ezseSfn8GDI9R40E9++dtrwys7N3RB3vj7LVJ44Tgh1RdNKgsybF/hifdJ?=
 =?iso-8859-1?Q?LgsZO05x00qyE8lYOSJRlQpnsBRrer49Wb5ircKHE8VeUC3LbFN/DiahlJ?=
 =?iso-8859-1?Q?nL1ZMPfw+ZA0dxwkShf1DhqtPaOoL/UbZNfjOe4YAXpgVSZxE1fSOfnX2r?=
 =?iso-8859-1?Q?ZJ27tVjtJOlM18HlRFs//uAIRQeDDc6CeHqo8mUhl58PBZcQTaeVaKrStO?=
 =?iso-8859-1?Q?qVPfdE78szn0GUKF9uWFu5PQwktVAkzY7TlmVbLpPrp+oOKWAGUDvsq8Ye?=
 =?iso-8859-1?Q?AedZR+Rx3bh8JY1Yv+G0al0MXyGUNenwosirBrKhkYfihS3qfQCpQHk03V?=
 =?iso-8859-1?Q?R7LOFDcPxBstHFxrPs7sggRBgDa8wMIWflxxCZyEZVxMLgTk1PbRZyc/66?=
 =?iso-8859-1?Q?nT5FlUm3yks0UEnKYAnqAsLBllMT+EIDsb251kb50AmGYC/Rt41AGseVO2?=
 =?iso-8859-1?Q?fFcpHAPwBaB2OfT9N9NioNlBDp1BglskExxvtSOmaVQiRZyopa65axbjAn?=
 =?iso-8859-1?Q?Mlph+DsM5v0EaIfNzhzkOK7d7slth4Q93Fb1YBVmYkzodue7epl3FHs5ho?=
 =?iso-8859-1?Q?998g3v81ZA4VsRORIHrehkdGwJGI7lD86OBmwc8kl4nu2J2haajANxCMxs?=
 =?iso-8859-1?Q?iwmJ61simr6lPNT1kcoZItdoRl3klyrTi2o8rd31jQe9okT7h6YhrXw7Jt?=
 =?iso-8859-1?Q?9ARWqvM+tjum5J9ELc7HY5OOG0HJXjqVMOj98EtO+P39TWk0/5MHyISD2O?=
 =?iso-8859-1?Q?S3pDnZuJBqFNG+bkBq0YbROPQtuNuntGGEJXZvDXlzeqwucbxtXyuVjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6228c1da-820b-452b-e183-08dcf43fb42c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 15:22:42.4303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfnWoTzZeMPyPp7kddBgZdRAnZhaO//l7M1NC6h0T92Rrrt2A4c2gk7xlO3iLEsiM9HBe7E4rR33LHJPTdKd7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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

On Thu, Oct 24, 2024 at 01:44:41PM +0200, Nirmoy Das wrote:
> 
> On 10/24/2024 1:59 AM, Matthew Brost wrote:
> > drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the path
> > of dma-fences, and dma-fences are in the path of reclaim. Mark scheduler
> > work queue with WQ_MEM_RECLAIM to ensure forward progress during
> > reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> > progress during reclaim.
> >
> > v2:
> >  - Fixes tags (Philipp)
> >  - Reword commit message (Philipp)
> >
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > Cc: stable@vger.kernel.org
> > Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for submit_wq")
> > Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> Looks like Xe has a dependency on this now that xe->ordered_wq is allocated with  WQ_MEM_RECLAIM flag:
> 

Thanks for pointing this out.

I merged the Xe patches first not realizing this was going to break CI.
Hopefully I can merge this scheduler patch soon.

Matt

> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 540231e6bac6..df0a5abb1400 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1283,10 +1283,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		sched->own_submit_wq = false;
> >  	} else {
> >  #ifdef CONFIG_LOCKDEP
> > -		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> > +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
> > +								       WQ_MEM_RECLAIM,
> >  								       &drm_sched_lockdep_map);
> >  #else
> > -		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > +		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> >  #endif
> >  		if (!sched->submit_wq)
> >  			return -ENOMEM;
