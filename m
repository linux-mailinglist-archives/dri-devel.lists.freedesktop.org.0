Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45378645E41
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC41F10E3DC;
	Wed,  7 Dec 2022 16:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5123610E3DB;
 Wed,  7 Dec 2022 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670428831; x=1701964831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kG2tIKYtKyNAMfsYWgka4tNLRHyDk9aMd4jLOYTz1vQ=;
 b=cZ9g9kZWuxiWnildbN/u59sEajGhAvHCIPnpZM5B1XPPf/eXK0NggHYT
 r3Eoq0segRcHWENv/D3u2T2US1JG0GU07SzjvZ2A5F5aq+dA8uQ57nlQS
 nz0tAEUTdJWMn/PFUj36rtrGME57B0sdetwznJc3MW4FslqQOPlcu14UT
 21rK03zi7joT/Cdrq3mJqupViNMO//r/P8sPu/V1osAy/xP++nBEPFvH3
 OQSjYsYez+I8LiWBv/uskL1HtOMeaVjXA1cEeEt+R4C2T8c71YQAikxDp
 t9fhOHTAIphOFwEIzIL4M6Z8Ws1+5Mp/Ko6EnaocYS5lova03m5gJNLVA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="315637478"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="315637478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 08:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="753151709"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="753151709"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2022 08:00:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 08:00:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 08:00:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 08:00:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 08:00:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxXx9zaouG4aINcA8Rj/zupFevAZER8IGO/wWXrvr8yJFyGqc20bNRY1p78oHfMfJ2RLKbkCkxkV1NPIOKJOW+s0TQjRi3Cq/xLH4oUlO+1gFMoTfH7h9e/lsHqPelaPwoFDJvCcaappfk+J1WS3iimKDHck7TKkomUpuuXjibs6N1bkn6UI3lQreyBg3llon9BzPLI2JelCNbU6XjReE8hIfcsi3u7QJU+M77VEe86UovUUc62gqC3Iq1pa1X5CemwZkNZUlQYpJcc2aYJ7RvJcBGamUJpnfTseUevUpRi16H4VSbXk9I9/WTPih8AoRN1sgpDlPVmkGhJ4EXG8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dtx2oyMlgCMRYTmLyy8jSagZqs9PBCOL3HXseECbIg4=;
 b=UWP+z1y9pqNFc7IyGni95j8BLvhnqSqg+inw8LMe6gQzP9UaVLZim5K0vKJOYNrNt1GNOXlS8Qni045AF3U3+waSGXwP9xEzW/LI5tisJBFvJWWZ3LFiEwFOVSSfuI5L6T/DsOtWFam2mx2xxI6po5f4LIDWb7ypRPPlvcUn8gCZnonSD0NF0aTv0gGSGMIRKUfs+eimDqrgEL3GzvrH+JBlo8sEt1ESKU6VFY+tt7ZC0tZazMpX89mcvEypm03RINu0IIz+m1hYVs3oAbTX2Irk36klLPz2AM2U4uuCzqKowN/3XKc7z33Nc+HMurhmIXC0y2Zc3aUJFKIfP3rDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6878.namprd11.prod.outlook.com (2603:10b6:510:22a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 16:00:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 16:00:25 +0000
Date: Wed, 7 Dec 2022 11:00:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] drm/i915: Fix documentation for
 intel_uncore_forcewake_put__locked
Message-ID: <Y5C4lKIuMhBorik0@intel.com>
References: <20221207112909.2655251-1-linmq006@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221207112909.2655251-1-linmq006@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c93654-b041-4f8e-6dae-08dad86c26e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ad5sPsR7BaWJ72Qjnci/hije8NMpF0cBhRJTKzC2Z6rYQdPXIof/jhlmgfhmz9P4W4l5KKrt8yHNHWqf3FNjT3rI+yHnqrxnrIv30EtzxXS5jloxPAz/7uKltCfrMuroaeACG6HsI4fuGOyhHVfcg8OcqDFlUi1eyjpyxUZqd8yIYyLeFSLXgd0Xz67CJSIC9vYq+ZQGxWs71hSdHICqdRn/Dr7ahQ1WSY3zVEbpE11FJfJRenZMlcKAh8kKWsVvBVUlyA7fft+ZUXu3rY4Emc1bv0dtCEveAsOYJ/BYl0K7vFZCXTetfDuJGG1BV2SKr8wtuylvhR9mx7bW97B5mSro4hAD/MLxA0FaWHSvKm9tZEUXQA0DqbIaVzJdjaO1j6+U7kKn7v5xrVIK07gN4awukbJrEVgjpFVc4B2fo4a1KdWIfpTQnnguYSARxqNzaov6XgD8FJfVUbPngkjhK/DiKHzKXzjxflk4aokVHVk4295w41bL3LMHaI1KT8ztQOxY8xs/Qp11dqAqnb4wkPec3+qoZs7vq2kgisiwuvNOnAXgxAbEUB/gYlblCg2GOZtp2fPVy/yMgtmoxVvICOsS3wSbatgH3xiYHaJpuvaHKy05qI/3u6x6b/jCt9t1Jw8C0OUrSoje8l3MheCOclJw91egPsLI+gRrGdZuGkS5GajmJAEX6/ZaLriIPnwgyUJ1JD4GTn3ZVjXYTt2+Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(2616005)(38100700002)(6916009)(54906003)(316002)(478600001)(86362001)(6486002)(36756003)(83380400001)(82960400001)(186003)(6506007)(26005)(6512007)(6666004)(2906002)(44832011)(7416002)(5660300002)(41300700001)(8676002)(66556008)(66946007)(8936002)(66476007)(4326008)(101420200003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBt9V3wV6E8WkGIZMDtXnLA2DIKFghkRECfnm/KPXXrDhTTrnSON9sdORjBR?=
 =?us-ascii?Q?ESwJr5jeL8uP025v2MdAD865uzzEwLgqkq9MrPb6iQicReMJ/PYLbk/jh72q?=
 =?us-ascii?Q?CJRg+GzeisLTWXq6zBKRc1ghJJ1EhQfxT/ZWeeJm6Pc6jghB7P45DWzDP4nL?=
 =?us-ascii?Q?PVGMBfPG464y3LZSDRPhlM3dp7USn9kRDvEimhXv53CY6+QiOP61ZAw6qSuG?=
 =?us-ascii?Q?NQcFv2qRddE0XV6ifU5BjT8KTWFrFdsknfg9h0nxtlGVY1VrB/NiFvcJoNSV?=
 =?us-ascii?Q?gvVVNEps/Unua2FkRLpDEIP6WDFQ3pxQ+kIsYtUUUFx+pSyI7h9lO1Ax8wfO?=
 =?us-ascii?Q?ol96RR2viI5jSfkJIvw8JV10uGNKL4AtwKgipGlnkesG3QgakVf1XKi4ye3i?=
 =?us-ascii?Q?luRDRhbsg78Yf/GlsQCI1L8UjOBpO0VSTokOu0Nn/xFFsnOZ7/s6P4pqWSS0?=
 =?us-ascii?Q?bYMWJylEZQysY580s2XGB86b9eFamwpMM3QPLXOC3RcHI9Im2t4s0+5yyXK4?=
 =?us-ascii?Q?snHj95xIMUaqNCAUFfpsTIowE///qOcBtMSXzqpV2QGWqqwFgpdh8rK2Rw9b?=
 =?us-ascii?Q?Tebjec8C3Fta3Xt62YGxZT8ETDgGLWhBfROeVQXUC686vW0hu+/0V0zXUFNO?=
 =?us-ascii?Q?FpCCSJRNxfASS3Vqv7dZkdq9pykTCMZTCDHg00B29gyzNmjeZtB4oHvsR/I+?=
 =?us-ascii?Q?VyqDNAozxPTXWmA3V6bkEyGnTLhujlQlWXI9EmCbD9eoII5oj9+A9+cccL2n?=
 =?us-ascii?Q?P4qteDfYmf6STSwVh5FzlQkRInFTIIGceROeU4T/csdXRNPnOS5xWx2k9F+A?=
 =?us-ascii?Q?ofSA+r5v7FtoVihAcZXyeG6usR0vyYtUSqOi1cf2Pf6NxVqyexsZYcZYD/yj?=
 =?us-ascii?Q?Gzj5POHhTw8Ze8XyMjW2hP//e0rZcW2nzGu3jK1IP/0OK8Ear9r49duBmoo5?=
 =?us-ascii?Q?/QCc5tCUkvajwTxzDgVvlq8S0Kt8CiT3CsD93LqdIPHdiklDHPTwXpde035T?=
 =?us-ascii?Q?Vs1PAi6O32IkGvhMb8GOl0HD2fpZvqAkPFLT+P3B59stfuuAuyBqWilisNEe?=
 =?us-ascii?Q?70HcHnZeYMIqknHLXBJ6ggqoTDBr/nnTv42wS9/jhXU50VusVAuMq6p8ylh9?=
 =?us-ascii?Q?MRijacYJdrpiaYgcvpJqv4V98e/k4XHH7St1fJXoBAAg4qdTd+AcvWqliLmS?=
 =?us-ascii?Q?iWKttjJgJn1mSD1/sK5bILxwUimHrS+SZGn95PZlfZzAXkKvjfc/wXTEWQoM?=
 =?us-ascii?Q?GWdc5hJd7c2Moa0mIkS7hh0uG3aYQ482AGQCZ37rYe0aS/8DyCnP+RjrJMkg?=
 =?us-ascii?Q?a/+kzk0pZqBvPAjjRWBcqb/DDkNGIoLp/726RDYYTSDDwAACHwe6vw/H2kdC?=
 =?us-ascii?Q?bz29pv0GyOldnr3y6Z2FrOw6O77jLmiro2oFFRv4wyjlgw6ygKFjStjOtmEu?=
 =?us-ascii?Q?4YLO94WqAcxNjWUdg57B4I0KFg34irqWt5JsCKtgs8a79krW0ePoTeSYxMWs?=
 =?us-ascii?Q?A5I/doGUPtMzOPw7dkkQFQnF3gIeYZIpMzSnllVN/nvoR/sIj6dQMcxDXmYN?=
 =?us-ascii?Q?yIeUkfxYK5hCiYxXzMEhsgy2Fgoy56SdoNOo5LhDVSeSiLenR29us5b/M/hS?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c93654-b041-4f8e-6dae-08dad86c26e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 16:00:24.9614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXQwiDtgytZ1u9+bf/2T5kRAhlY0U7QFieAJkjCYLzXrH6Pk3cyItxdAjsHzujqNaszUdipW8xhXEIkb+r7EzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6878
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 07, 2022 at 03:29:09PM +0400, Miaoqian Lin wrote:
> intel_uncore_forcewake_put__locked() is used to release a reference.
> 
> Fixes: a6111f7b6604 ("drm/i915: Reduce locking in execlist command submission")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and will push this right now...

> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 5cd423c7b646..acb40543eb32 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -819,9 +819,9 @@ void intel_uncore_forcewake_flush(struct intel_uncore *uncore,
>  }
>  
>  /**
> - * intel_uncore_forcewake_put__locked - grab forcewake domain references
> + * intel_uncore_forcewake_put__locked - release forcewake domain references
>   * @uncore: the intel_uncore structure
> - * @fw_domains: forcewake domains to get reference on
> + * @fw_domains: forcewake domains to put references
>   *
>   * See intel_uncore_forcewake_put(). This variant places the onus
>   * on the caller to explicitly handle the dev_priv->uncore.lock spinlock.
> -- 
> 2.25.1
> 
