Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD16F3CEE
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 07:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88CD10E2D1;
	Tue,  2 May 2023 05:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC410E13A;
 Tue,  2 May 2023 05:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683005248; x=1714541248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sAXvtBjQ8OAgcLJaGPpvE8NLgmjjtrTlRNr7A7lkhJY=;
 b=IYfL+L8Pih27l4CuDr0SLTsWriGXDBffB+ICYi5IYp+3XizvqVjJ64O2
 6z+O3I3oKPdnSWT8arVdmP966fzr/ZrPuzB/yAWWRS1QRA6KZCvvw4cj2
 fcHZNHiPTrLqXnP8AotMOduNr7DRZwX+qZuFvbmzspLxfqOPBExSHDRvF
 dQC0D4fGCF+ATNyOr/Lx+Jjp2dDF5NjxtWXau1U4o6KgUtBBXufH+ZIgy
 Ws8aMguZhjvEfo/vdHzRdE07jGkaYJAsLP4UOAAQU2TCozJEzHV4OrQBR
 NhzP/x5vw2IZedsCbdTaqKSwj9vxnPucxKb4iVUSJlwRbNQvbU1Vnlx3i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434632617"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="434632617"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 22:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="807715775"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="807715775"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 01 May 2023 22:27:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 22:27:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 22:27:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 22:27:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 22:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e42xuCAzh1xm0GnyQhfSo3Nv2+iKRgzqujjFrW/lLJXkS3TRMZNkgCRdctJJNvlRHSLwnXn5JAF3DPjp9VNfJXTr8zVPNBvbI5+6O96UWv/DVoLDvvSzpRfMiahCcWUz+KeAE0LRtFVHA49P9qPGCQFAwTxFjQBlSgtOdTO7adXNeD4s6ZLCeMte6OkWTe9OSwOp+4d66FTEUgu6igKHDvVNG3a9SLKgVPAYvXkHv9vRfdFpKekU37AAKfK6KmGbAZ0tb/zWi7yEwykhBAHPWncb/T8KHdREFA3X3rg8g9HhLzipuVgkw2zA3qFN6QSjVqsbfjCdEDROg4lpLRzJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRcy+eZdoeyu2yHRxT5MobhgzbNq2pFGah1Dzan206E=;
 b=mZ6XONUPsJ79D8PSBaSBoBNTaeybhur/vsF+i9F5BO3DWGpCKqwt8Xwdh1WS4iTH94hPDLOwXFYrYhR8BZiCGJ4M34l9B50tnvo0Z2PYNqocjw4sp9AbE7PScGpWmuUoSscCPkbsBaxWIlXxTpP93Ftdsl/i4HQ+jxffJ77O0H8CxP+5tyUQiXeL/60SyYv2Sml+4D+iWIYQxe3d7v/9tHXFihbvS9ymaSEDKJQQiCzV1PJ5Xgd7JXVic+dr98Vkwj62S/iFvVC2LLzI8yxP8PHpKplolROPqb+GkRJmeihXWVeQZY9PYtj4EiKFpeM5BU2/7HA+x/Ji6PUioc0dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 05:27:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 05:27:24 +0000
Date: Tue, 2 May 2023 05:27:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 05/14] drm/xe: Convert GuC CT print to
 snapshot capture and print.
Message-ID: <ZFCfLB9bPSLACRsO@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cb420a-f3ab-4c63-4145-08db4acde8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NDYEh6mUzMQKCS0EUg+JYHAnR+a5CBbM1a+JInaquSB0RXVuZ/Vzf9GoF+Itkiz/2iOTYeNpawAVDI6ePUjn1ba3d89YYG0V/tBbYgmp2KOiidsa/rORX/cY+EvSrqMdS2xD8zayl+NrnTkg98JaGnW8AFPvI+PhBzsfRM80E6Kms32kSL6Oafpm4GsCSfmJGNUf3/8PhTaM0SUTgYUZ1kenFtA7AaI28wg5sWsBDD7KXak5Jrk4lczu7JWz/TrKaNX04K1EnQ+5m06kIwmVckN1LN077owWjOrTXRSBQmNvioUsBXazjSNqodvlT8ZR8PL1NVeJcDskZpgortdF2qUIkn9jx/1zrciJPHtF7FnP4o+BCBCid5MjVvBbexmGGaQGo0Z5tHkCGBaCwNOJ5bkOr3JEOxsYwKvpJ/1UbYAs13/PaiTfQFvtEsy6K/kSktZNFanKS5fgw3uEbs7lFOxvUk2B5RCFfhGjf+pXjUWGQLuQTx79vc7DVo1Iz6gNt9m3pfzB45VvbQ9ITI/CWlB0DLB8hz7fSqcLebFl1QMCcFKSFNHQgTgo3rvoNglW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(83380400001)(4326008)(6636002)(450100002)(6486002)(478600001)(6666004)(6506007)(186003)(26005)(6512007)(44832011)(5660300002)(2906002)(38100700002)(66946007)(66476007)(82960400001)(66556008)(8936002)(8676002)(41300700001)(6862004)(316002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZxYBiCItSOzQYiAsqOsBsWt5GGhvqL0gJmXn/toJ48g1qvmRwKPrLMkkC55?=
 =?us-ascii?Q?UDATmoHcFAH8mVkZ+ujUEt88kPfDceGOTdVQpI8l5xPUGuG5d3Lbr0WGQ9vw?=
 =?us-ascii?Q?442a/Y7rsgAKDWVjiUtOr4jDQ+mx5wQmE4rkqKiOrvgbtlGyMRMKwsxV1FSG?=
 =?us-ascii?Q?GlKd/HUIhtkR+Jd8jGTvIke2p/kyE5SyOJYMd+DD/vx6oYEoWjVFqK+OEeY4?=
 =?us-ascii?Q?FmYsOH7UCzPSSpz7Noq+mwvYxXKm8aNGhLXIeLC1pSIHxHI2a20T90EAMNmX?=
 =?us-ascii?Q?Pe1yaOssU2OK+L0PmDyAA61r3Zyq/dmBXdrlRsRn8BiT8XwiitiRSAjZGBCQ?=
 =?us-ascii?Q?u/rs3Jc+xDxinHn2P2b9D/QexAiMpZvOrnBN1kJ/TRyQW+QmsP25xnUcSAxw?=
 =?us-ascii?Q?sm5HDW7fQCdiJOKEM9of/faFTzXlglj7guc5C6k1IZjwyMDQKWteacJ+JVvA?=
 =?us-ascii?Q?/sJeAoCmp2GrkxgIOS0RFb/OKDzoCQUBFsDbSK65VTubrhlgLcZm5aw7OZbU?=
 =?us-ascii?Q?Ggth/Vmf1grPfA40TG2/rcEqlrJn/Y4hANncEYBmNhSxpsN8Gy+gXOPKXmJA?=
 =?us-ascii?Q?lqNdOfosFcmXJqS6v/6iZgCZK+YkCjvB1C09enOeMFy1axX/f3RuVeJbqkRL?=
 =?us-ascii?Q?XI+KmxZOyLmFnqUCmh1urUgImPC9T3ySUZAAhoLZODodT0DY95zk/zepEAgD?=
 =?us-ascii?Q?9gsq1gsOP/5AjTLYa5rMZVlln6UuwFD6H6AcxjeHrbCdW7lOQO+kN8+5qUmK?=
 =?us-ascii?Q?hEl3ogMqLUX3Uf+KGxgjvJReeBGg2abV9FgfLFbDX2DiUOzYJyjb3Yxicj/W?=
 =?us-ascii?Q?XeMDMUPOm0M+a6/wXo9jp7PxvNpxcse82gGd9Os6WuTpyk1p7JlVfOzt4hex?=
 =?us-ascii?Q?ilUo5t3STc82pilnNtSj47McPHory6v8GzOkFu8EKUVpfFsx1gOPXEFgGO/v?=
 =?us-ascii?Q?VJE/jQBeSt02kDMqj8Oq7j4bDF+xwXGHys1Nm3T0+OSgPV6SZBDfj6zz/D0i?=
 =?us-ascii?Q?6xKKF8EAWRSjd+5mQy8UDsYOoxw83DE1c4MwrUDZvdEtm8xM9tfiKw3fV03j?=
 =?us-ascii?Q?Minm5MmqcbfBYWi3PBlRju9AvuQPkTFUPy6Vt66ZwEEEi9cRnjeopZJky+PM?=
 =?us-ascii?Q?BLA28B70aQ0GYZHd9voz94YESJf9DmPSvy0QVUSpXoHJeBUoV1+6xeb2tr5y?=
 =?us-ascii?Q?z/WYp6fw6LHOpVvVo4ZjPXeElcqI/2EFRZzLF9CbeJFPdj2NcCH7a7ta5QjQ?=
 =?us-ascii?Q?erqyzjrlzU3r6UIZ2hyPNkgaZXHR8OxQqrPUGbfK6wNnyIbIqFPUDPmuJOVz?=
 =?us-ascii?Q?Xd9T88uyg3oJL9ssq5VJq4nilVPg6OPFsBuN15wNt/AFdxWWV5oDZcFVKxwS?=
 =?us-ascii?Q?SRtEG0rYkiw8yX0bVTZJTSfV0IXd/gzwunTGuPeAYZh21qGkkYXuEVXoN3ri?=
 =?us-ascii?Q?0TYyCj0pGUmPOw1CvZdZhrC/E2hVtdKCvDJTXqy+6n2rh72pElOXl3C/GOAZ?=
 =?us-ascii?Q?4VPWF9xCYB2U1yBNsDvBpMSZJ05kRIS6yza/0+7bBftseYNfYKJcWhK0Gt8O?=
 =?us-ascii?Q?uc/yszqartgzxatIoJOVbc4zzhZC0mMQOkpXH0p6C6WwigWj/Q9C7gfIp6dV?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cb420a-f3ab-4c63-4145-08db4acde8cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 05:27:24.0638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aON1Nm/0+v+lTyJAtND4mGph0Gojmyp3lXF2ijDxTCEzCSjoxcIPpTUVjPreRUVguyqpY9eN/JGzJBWYePAUGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:04PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 132 +++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_ct.h       |   7 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 ++++++
>  3 files changed, 145 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e16e5fe37ed4..0b7b95dbd9be 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1095,31 +1095,26 @@ static void g2h_worker_func(struct work_struct *w)
>  	xe_device_mem_access_put(ct_to_xe(ct));
>  }
>  
> -static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
> -			     struct drm_printer *p)
> +static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> +				     struct guc_ctb_snapshot *snapshot)
>  {
>  	u32 head, tail;
>  
> -	drm_printf(p, "\tsize: %d\n", ctb->info.size);
> -	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
> -	drm_printf(p, "\thead: %d\n", ctb->info.head);
> -	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
> -	drm_printf(p, "\tspace: %d\n", ctb->info.space);
> -	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
> +	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32), GFP_ATOMIC);

So since this GFP_ATOMIC I assume this so we can call this code from the
TDR or a CTB handler (dma fence signaling paths)? Also I don't see
where you check for this allocation failing.

>  
> -	head = desc_read(xe, ctb, head);
> -	tail = desc_read(xe, ctb, tail);
> -	drm_printf(p, "\thead (memory): %d\n", head);
> -	drm_printf(p, "\ttail (memory): %d\n", tail);
> -	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
> +	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
> +			   sizeof(struct guc_ct_buffer_desc));
> +	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
> +
> +	head = snapshot->desc.head;
> +	tail = snapshot->desc.tail;
>  
>  	if (head != tail) {
>  		struct iosys_map map =
>  			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
>  
>  		while (head != tail) {
> -			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
> -				   xe_map_rd(xe, &map, 0, u32));
> +			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
>  			++head;
>  			if (head == ctb->info.size) {
>  				head = 0;
> @@ -1131,20 +1126,119 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
>  	}
>  }
>  
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> +static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
> +				   struct drm_printer *p)
> +{
> +	u32 head, tail;
> +
> +	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
> +	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
> +	drm_printf(p, "\thead: %d\n", snapshot->info.head);
> +	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
> +	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
> +	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
> +	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
> +	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
> +	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
> +
> +	head = snapshot->desc.head;
> +	tail = snapshot->desc.tail;
> +
> +	while (head != tail) {
> +		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
> +			   snapshot->cmds[head]);
> +		++head;
> +		if (head == snapshot->info.size)
> +			head = 0;
> +	}
> +}
> +
> +static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
> +{
> +	kfree(snapshot->cmds);
> +}
> +
> +/**
> + * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
> + * @ct: GuC CT object.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a GuC CT snapshot object that must be freed by the caller
> + * 	    by using `xe_guc_ct_snapshot_free`.
> + */
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>  {
> +	struct xe_guc_ct_snapshot *snapshot;
> +
> +	snapshot = kzalloc(sizeof(struct xe_guc_ct_snapshot), GFP_ATOMIC);
> +

Same here, need to check for an alloc failure.

Also maybe we should a flag to switch between GFP_ATOMIC (signaling
path) and GFP_KERNEL (debugfs). In the case above, CMDs might be huge as
deadlock workaround (like 16 MBs or something) so atomic seems risky.

Aside from these comments, I do rather like what you have done here.

Matt

>  	if (ct->enabled) {
> +		snapshot->ct_enabled = true;
> +		guc_ctb_snapshot_capture(ct_to_xe(ct), &ct->ctbs.h2g,
> +					 &snapshot->h2g);
> +		guc_ctb_snapshot_capture(ct_to_xe(ct), &ct->ctbs.g2h,
> +					 &snapshot->g2h);
> +	}
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
> + * @snapshot: GuC CT snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given GuC CT snapshot object.
> + */
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> +			      struct drm_printer *p)
> +{
> +	if (snapshot->ct_enabled) {
>  		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
> -		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
> +		guc_ctb_snapshot_print(&snapshot->h2g, p);
>  
>  		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> -		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
> -		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
> +		guc_ctb_snapshot_print(&snapshot->g2h, p);
> +
> +		drm_printf(p, "\tg2h outstanding: %d\n",
> +			   snapshot->g2h_outstanding);
>  	} else {
>  		drm_puts(p, "\nCT disabled\n");
>  	}
>  }
>  
> +/**
> + * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: GuC CT snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
> +{
> +	guc_ctb_snapshot_free(&snapshot->h2g);
> +	guc_ctb_snapshot_free(&snapshot->g2h);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_guc_ct_print - GuC CT Print.
> + * @ct: GuC CT.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> +{
> +	struct xe_guc_ct_snapshot *snapshot;
> +
> +	snapshot = xe_guc_ct_snapshot_capture(ct);
> +	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_free(snapshot);
> +}
> +
>  #ifdef XE_GUC_CT_SELFTEST
>  /*
>   * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 49fb74f91e4d..29e0dff7ad9b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,9 +13,14 @@ struct drm_printer;
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> +			      struct drm_printer *p);
> +void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
> +
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  {
>  	wake_up_all(&ct->wq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 64e3dd14d4b2..93046d95b009 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -48,6 +48,32 @@ struct guc_ctb {
>  	struct guc_ctb_info info;
>  };
>  
> +/**
> + * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
> + */
> +struct guc_ctb_snapshot {
> +	/** @desc: snapshot of the CTB descriptor */
> +	struct guc_ct_buffer_desc desc;
> +	/** @cmds: snapshot of the CTB commands */
> +	u32 *cmds;
> +	/** @info: snapshot of the CTB info */
> +	struct guc_ctb_info info;
> +};
> +
> +/**
> + * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
> + */
> +struct xe_guc_ct_snapshot {
> +	/** @ct_enabled: CT enabled info at capture time. */
> +	bool ct_enabled;
> +	/** @g2h_outstanding: G2H outstanding info at the capture time */
> +	u32 g2h_outstanding;
> +	/** @g2h: G2H CTB snapshot */
> +	struct guc_ctb_snapshot g2h;
> +	/** @h2g: H2G CTB snapshot */
> +	struct guc_ctb_snapshot h2g;
> +};
> +
>  /**
>   * struct xe_guc_ct - GuC command transport (CT) layer
>   *
> -- 
> 2.39.2
> 
