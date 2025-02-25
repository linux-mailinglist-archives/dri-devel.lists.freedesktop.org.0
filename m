Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D487FA44E73
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7595410E7F0;
	Tue, 25 Feb 2025 21:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8HYScUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E5210E7F8;
 Tue, 25 Feb 2025 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740517855; x=1772053855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rup4N3/FE6cWjtPJWrwz3ACFoQexDoBB+TTMZMImRFI=;
 b=B8HYScUo1G6ed9WDtYNs1MgFqyAciy8/nLM3Xo3Mn0inlFB94BA8raBd
 efOuxtz5+agbWQL+42buZJwuhKvaK99K9ARY2vXk7OJ7CEzb8+lx8Mnun
 e9DGNI+JN7XmebuRSBqXh3Iv8/IjAfO6OeU8t9EOERlTvK4tHB1F5HRrF
 xT7xS4q3oQAm9fv2CyjhTfdRGw251yIzuPNLTxjf9cmsSaEZ9N9jkQ4g0
 ZQdUApYGcxPbN/z9MK7gDLuFPVzABuE0RmL55eGc6gzo1IZbLRBEGkA1v
 Um6fe4CC8BidDPChrTvuRpqYzfX6ZDsRuZwTp49gmzOInAa71h/o+POyY g==;
X-CSE-ConnectionGUID: 9jJWEZH6RSWB1Fka3B5s+w==
X-CSE-MsgGUID: kHLBogdiSbmOGRKljtr/bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41365289"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41365289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:10:54 -0800
X-CSE-ConnectionGUID: SYiYrB5WQRGc322TDg18yg==
X-CSE-MsgGUID: Rsw3NFKfRZu25WnmRRuwtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="147327581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:10:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 13:10:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 13:10:53 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 13:10:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYmfhIrwsmLEWpjHlmLkav73ZUQC22bgjyhCxS1p/9+sb0275jPHXidiO2Tn8r8TjspsI+OvN+V/mgodUTKI+ArrDK4fJeafyW+ddZIQ20Pz1XdYn6EHR4S6VYsp5NXq0mngwOxgDU5WM9Jp2sNFtCyZsZdoPbfU2Ev9BukreayodJLJgUoNYXMnbe2JGhfxojT3Q6GukFzjY4Mfq37CW/gc0r/b6s3+EfexAsJ3i/tAVTURIUZNwJPFQuJrmSwy5+IWxabZOg3zaOz3B16GrAtOAK35pTaHgHjdGeS/jNrBVff36VVE6hbIL0Ep7cWGoG4jkCahhyA/8uCanoIGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrZxPp8qhQ3ZRqLuZSjji2l5eYXJb94DloFhezD+Fio=;
 b=v80d4sbSLUgLaEnjVva0NDaEE2O8LxauLSwFkyUF3nYVImJJOGUsyCjXxpCzLTJ9sJB0K9vFId4rj68N4RFFP4pctSw4hXWePQl7It8h4UPUAw1f9apYT3As2oiVymic3pdm02d02dpKgExAzQ6ctF7I4sNyQw5OVSEJv3J2i/mdV8sPirQiokRu3Q9WQEfWSElu83ZgfXdfABbaUM7KUbp0sStP/LTLLr7FVWKv9+ss/gIG8N38paRP5nFnRtNGCp0+s8zlFE2KecYYb97HUrKtln2sc2XSdtjy37GbUFwDAYAGj6XHMquHjVuW+JipLGJ7OuReZ6U8ErQgr1pdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 21:10:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:10:18 +0000
Date: Tue, 25 Feb 2025 13:11:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@igalia.com>, <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 4/6] drm/xe/xe_drm_client: Add per drm client reset
 stats
Message-ID: <Z74x+QCrtuPhAn9n@lstrano-desk.jf.intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
 <20250220203832.130430-5-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220203832.130430-5-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de0b81e-d479-4b87-2994-08dd55e0ce52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/5qBGmxyDzqB0j1JCKMHq1fJiHf1TRlKhXZ34GKMLfuY2bBd/DJi6qQoXc+L?=
 =?us-ascii?Q?c0DrVC0zWDy8pur4ZESfWBwiaoldsa3PKr2kjvrU49t5+0QgpYcsh/1TSkeQ?=
 =?us-ascii?Q?5pDL42sTc6sp9eL7cd7Exnqc3cvEREiCZvhJMIv8rPm+q4IKDE+7dUbsSfJb?=
 =?us-ascii?Q?7pldIAwZMzs/iV0Xoo6WolTHb55Saf/qikDTC7ORRixPHvmV9hHg6xyjmbSM?=
 =?us-ascii?Q?1ccaIupK4ln/Ey9VgQvH99PLmC+SF+EbiSIfhAK2lh9+Q6HPlqALKHst2NaK?=
 =?us-ascii?Q?GmENRRZ8E6t9Tg3VWGFYFtSO9SkQh2unyvrNtnRH4X4Dlm4+XsuK59wS9yCg?=
 =?us-ascii?Q?nPBQSRzCSyMLj1FDzXjFdkmNIOfkZ2PO1VNH12liy/J2ORE6Nex1MZaRnsct?=
 =?us-ascii?Q?2eOEMSnLEcX3t9lrYfm91PrBIDZ4F+jHFhgHs+N2HrI8vrooCHG8RtBUHujb?=
 =?us-ascii?Q?nEOQBdPR+k/1506h/DA7EzoXHtGUvaINFpdhGxxkoB9dCMwcVdl1TzKfJj/k?=
 =?us-ascii?Q?Ot5fnKzfc46ZUA1aqP3Hg+BDLEV3DMtIyRSxSuOM+T+/NdSh6T3bj1FoKd80?=
 =?us-ascii?Q?5G20PvJito61+ECgyRtaR4U1rOX7pt3+iyUaDeOcOcwwZJ1FuO4rGKs1GEgS?=
 =?us-ascii?Q?yzEjYND4J5G/v5OpU25eLMwD43XawWgsWnSnr78tfAk14vHYfmtHLs8F/dAq?=
 =?us-ascii?Q?VVS/ohkmEj1O7Sdb3luUPutNQP4b9aYfowEmMYrJvoDygyTNkpGausb46hKd?=
 =?us-ascii?Q?b+a3bbkmwcPuwSCpPu7aZ3Yq9aH3baB0lu88YUgSxEv8PzGe0C/0bLcr9Nny?=
 =?us-ascii?Q?7yKd3b2v5SQGGiwfC5wfwKuhQKRQvAPAxen00RQUA2RD2dosH1IeFGYO0YDc?=
 =?us-ascii?Q?Vl5PicXySg50lEi/6OpANfWaYjO8YMZK5bPTNnn9P+s/W6jOoqBw7HYnIkM1?=
 =?us-ascii?Q?YqycgiUauwREAuCpgXrx8EYV+7LgGCC5TM6AGeBSlvCZWLlBYHV8Y5MFo9ot?=
 =?us-ascii?Q?hb410qQ+Ddh+duGvr6igBDbz4VCqrGScgtBw1t52h7VNdDM7LilekIM5iLuE?=
 =?us-ascii?Q?MEDvSjVF5zxxcZTRwumWFWQJeFAgIIk7W6S+wKtkztJuowvGj91dAmxG1BOs?=
 =?us-ascii?Q?+uOLPXsSI1JEF9QbFCPoNfhh8GKufIfH7Yxo/SN5T+Hi0EreVXt74V0J+uZl?=
 =?us-ascii?Q?mEWDY+6UfK6Tk+3AWjTXNDwgJBUJ4nMI36kjqxDP9Iba0R82Ek5pZ++575fx?=
 =?us-ascii?Q?/6wl6PrDJyzLYi/fu27C2BlL/R5kuj6hKl94pufF/dC2+0Plo1+dHEii6Bt1?=
 =?us-ascii?Q?QYFudLMer2pDCiB1l+KnRHeqcPit0gud2pZp1N21AlFShyFHWjhkiOU0R7wK?=
 =?us-ascii?Q?jE8dBcesjUmB4+wNSVANoaFAHA2C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyxfRS48kMVhgyUQE4FgCjPSObTwEIgeDHsvDVN/FztW0Z3WBUMc57j3e9SG?=
 =?us-ascii?Q?A8Ck3+qhgd08bULD+j1cpU2eieg4ik9Z0RI7cV5CNxFCKDfUZa26UwlPq0Dg?=
 =?us-ascii?Q?efYCCYlcPsBaHRp9QfCBOnBEVw1Hh09Kr4+4XvhJZPJsyABs+ufIuZhZkV5v?=
 =?us-ascii?Q?vUUMipHIhMY7BIokuTW68LpFyAQpaMgc07gcVFjfOCFmTBGxkoIZ7wcgY/7m?=
 =?us-ascii?Q?CX0NR82QJlgD3+mjouA9pddh7a3qoSe9wTEELZCtynX/aZqrcZsSE9JqUFOm?=
 =?us-ascii?Q?73A0h84pp6bTU7znUqxepdeXuBnECVK7dqJV6i2wd4l8FH2Dt8RaP09IPygj?=
 =?us-ascii?Q?8GQg3BhkoCwInzaiMc0Ar63iidxEiQBVwzafqFgH+hYkyRnw30i80+4Lxj4O?=
 =?us-ascii?Q?cALjlVy7GLgOz6W8LJa9JwzX3j/2uIW3u2hrlUY5xJlh7dNVC6yyDJ9ofBGP?=
 =?us-ascii?Q?mYH8sqL7qVWOwTdVDbr5yPhRFzL4V0htNgeTZcBY+Oq5S/7eYrKMxv8yXjum?=
 =?us-ascii?Q?ehn2hCdqmu+MwPlnZqpfXYe3ncmcTddtJsfwigE8moLFmvJ0D2SVB5lshTtM?=
 =?us-ascii?Q?56I31ODIUPxHnY4lMAM0gH18IN/9j59t93kksi9y+XOZwwFHpOngbRTvEtlj?=
 =?us-ascii?Q?MsNsB2jpSD3BljfivwIJAjax0tLiHWmTacgqn7IQrLTgQJpUx8q5yF0Pe/8S?=
 =?us-ascii?Q?ye/ZmAqixDtqQ7Xh0AgSwTgjFEPnEKcyGHFaekMzAR2H5WhID1fh3q7dH6fN?=
 =?us-ascii?Q?qnhycykmfxt/zjT3/b9ppkn90je0Dt+AOEK97tFsUKC0/53weUMbDfWAksQx?=
 =?us-ascii?Q?0AAPpaTB2RGltF4k/tt09dRDzsfsUXlEG6CbmS7NmZPw6avvuXJrNQkB6HcT?=
 =?us-ascii?Q?lVsPWtzQWK2AsfSVsWCzYnb40npssNRGpYBg5RYZKVU7lbiJ7Lp8mOn7iiAF?=
 =?us-ascii?Q?7xACdisqVtA+ShxKluJKUFUDL24JUytPtBmbt+PIyNH86CpGs8qzloc89wnI?=
 =?us-ascii?Q?DKLZsYtZOwusuvDiTYUN+WSK9ckV0li4z9LfAvtC13oRB4I309hGw/NGrLpu?=
 =?us-ascii?Q?2BXyvq5vYseOQ06YmvgstisU9qbXenIyVVYU3Iu/IijNWkxuMfNGGBKEb7ix?=
 =?us-ascii?Q?ynfbnkIqUvaVGlvXfhrWDKNPjirp7PNgW991fHe9Cm+QmIqJVx2cKWlu1+KA?=
 =?us-ascii?Q?2F6CRMdvdoIeRqjFnip1MiZ5PDGDaVW6UTse5QkoaB7cgCUFB/0pvKi7i0Xb?=
 =?us-ascii?Q?LBHl70aUVhgzwL73Deppewxp9Pvc86s4n2KXavbF3DPwswMKkuzzspBOdQk8?=
 =?us-ascii?Q?1NxDz14TGHU/4XhWMY48LGPCbv1w2Qx8kelX1GzzTPS1zSWamYrGhq/qppLd?=
 =?us-ascii?Q?KLq37F3hl7OxZ6ZG1Ecgc5kAjowbsExaTm2f1+i77PRAt0r9WRsXeHjXQKaL?=
 =?us-ascii?Q?+OCOXQzx+PHG6AWB6O0lHJYXBg58FSWDXu6JNLkOPXcrRa/5Najx1L500izu?=
 =?us-ascii?Q?Jd1R4f8G9xxdNXxKjqgRD0pP+wpKvxe2j6hGz+6KU/DZCVltcl8evd/BLdLu?=
 =?us-ascii?Q?vGSjLp1pipj2t4jusl60AjHwnHVOqVFXxfNOF5bbBiZSRtCv+UyiVOFt4vDb?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de0b81e-d479-4b87-2994-08dd55e0ce52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:10:18.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKA7wwhU2p8WcnxjEGrzx8Cbg9dCzn8mst+eMXsW+BIhypYKQCz6uA2icpDVNqfRyDeieQ1blTqvu5qYGhzy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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

On Thu, Feb 20, 2025 at 08:38:30PM +0000, Jonathan Cavitt wrote:
> Add a counter to xe_drm_client that tracks the number of times the
> engine has been reset since the drm client was created.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index b3d9b279d55f..6579c4b60ae7 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -59,6 +59,8 @@ struct xe_drm_client {
>  	 * @blame_len: length of @blame_list
>  	 */
>  	unsigned int blame_len;
> +	/** @reset_count: number of times this drm client has seen an engine reset */
> +	atomic_t reset_count;
>  #endif
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 92de926bd505..5d899de3dd83 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1988,7 +1988,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		return -EPROTO;
>  
>  	hwe = q->hwe;
> -
> +#ifdef CONFIG_PROC_FS
> +	atomic_inc(&q->xef->client->reset_count);

Make this a static inline in xe_drm_client.h which compiles out if
CONFIG_PROC_FS is not set.

Matt

> +#endif
>  	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>  		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
> -- 
> 2.43.0
> 
