Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894467B654
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620DD10E0F4;
	Wed, 25 Jan 2023 15:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FB810E0F4;
 Wed, 25 Jan 2023 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674662009; x=1706198009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+axRdLeXvBeKYCqVEt4M/Wy/WI4n6IXrorxKxuTqCB8=;
 b=CNYoj2LqScCbZ6Aiz6QxY9bPWa9Jo964+yQDzP73ipkTA2ANlC75FR9H
 wN0h548ZjjhNyEtuvSWTWFNQd8kkRMn/seXNMH78izy9m25ZpP+/mXh46
 jZrL65EwPRh9tZNh7RKYGkdrh5q/22UCZZX+JI3OshNzuqjI5o+uX5s9K
 Pt/aaDwXvTcBmDSVA7UFaGFdE/m2r5ItnTK/icF+pPJC/SFQyYwnCMh4q
 QIJBccGyapedygNz4+tA1fy5y1K0ZPA7vMiZvBdxrRRzXqcD3a62m0YyP
 eHiYlUH4mnhruueiEdwAYrz2tk9CgULc7Mssk4ICxQMPKB3WUHslgx1o1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="391095686"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="391095686"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="639976885"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="639976885"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 25 Jan 2023 07:53:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 07:53:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 07:53:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 07:53:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 07:53:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcmGS8sZouQnXfvBz26IQalsVfRFlrO2BL+0hbqNOc15BxZBQPsTFe3orWIMPqYG8VrWo8QF7s9sgBvk3BAPgZ2lbw/wH27Dq9cGnVe9Icg/V8jX658vOv0j8Uo0TPoX112z25gcd3/JYnxeN39TFed7ZgCmfmT8sYsPDsnhS6vd1oeXWVsCSSJ/aBEJZm4vPcWoat5h4H+Go9g5M8gO20j/2YLmXppQrHW/6jXlKTGUpFJwxCL48iKQHoVJYS7IaHVz7aLFQ1fC7KsjeoLgCugsOavh4LnZAVrV8+ClxRg1XpCl0qmYT3BRoNbAf4TtzcCqj/Hpza1S6FVQmQgXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mY2Qx8BTGbKZ2p26uHujdHo8pz9Pid7kVVv+eSI3qk=;
 b=Y1w0c/rcjP03VDGd6Pb2fjqRzI+1LxwxnlzIDNT6HGHVJh8zbVhLjNQXMw14dA7hOPoBTf4AckHk7SBqd0i3iBFA4OkIwCIXa/1WJ6/MFAL8HACm3yUOyvtw8yxVSNOjofl3vFAZeQS+lbxIO273tu8cl1hNiQkCLGWXK0fZZE2WJSUV5Vk13y5pFnvr/h/Pn7kbYMtZYZFT4jInfwwJPgiL7gYT/CXGBq2n5ki7JYGuK60hJWUYFcoIHc0DfJGmZB0g/nYUYBrsZigNkmSZexiXCb9zdwTi6C9p/ocCMnZG80rcm4wHYwFhPE45PEzb8vPeUOa3gDRWni6+gIUIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:53:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:53:26 +0000
Date: Wed, 25 Jan 2023 10:53:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Message-ID: <Y9FQcS6jyHCB2YMt@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
 <20230125082637.118970-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125082637.118970-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: PH0PR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:510:e::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 886ba4c2-4519-4131-7ad3-08dafeec4b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+r2OT/Qgdzsozz8MIZbNiVLHoxTObaLS6W2VR8oWf+4IFpR99dawk5ONMJLocPOq8nKqH4F3cqOIzKXBkKWdfMoc3KNJjbKz6zR5uLJgaAi1moAnOTBWXHtEgjZDdG0D1pbFzCD9AoXVzjpXFRqKM4QYAs2od2H8lY5lBLxT5UkxflyNTKPtgJhYD7dhS9QdlCSJsmJ35BH9X667Z5dvtwVH0+yxrwQPvymCkk3r0SazRT+/gvR1FuK1YqHR38KC/yqLBc/8WKEC6GxXfNSei750MVSG0qNBafuxKP1BJRHtyGhxnl9tAcvRLxt95DHIY59vfSQtm0XI9c1/hjiaHWSzXWrSWCCkV+Ri888cpb94NYqvP5893S3rCtfInrH3GaIcoARsUGDkN0hzph4RUuGcnMgxNj3E9QpI6M94E8SnOUSE49JJ1y47HURSIBpPclKe/G6A/AqMfQiuNSCPT18te7x+MT22AntZBs23qsNEHYcrKVhAwjBpU4YujUotzDYsKL7Xp5eeR/zlJGnePKCOyLvUtWtHKTdusfnuwnnqYWjnN7hzcizFizlalMj5Viy675CjgM168hK/eUDYdmt7JwSDmNNp4dLwAn08MMKsp0JqqaHiuNTphvYBLv0ETjQbe4Z4Q6e58TxwLhMlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199018)(2616005)(82960400001)(41300700001)(8936002)(38100700002)(54906003)(44832011)(6862004)(37006003)(2906002)(5660300002)(8676002)(6506007)(4326008)(316002)(6636002)(6486002)(83380400001)(66556008)(107886003)(66946007)(86362001)(36756003)(66476007)(6512007)(6666004)(478600001)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkiF8+1imJY98Z3DwsrXGbIz1i3VXpYapd0cWAlCouMhTGIZ7/4BRQOsngqK?=
 =?us-ascii?Q?AOl2wqMn++hASPKtDeETlVOZNL0eEPQhhyATls76+mbkPqqIyW77nbWv6IeJ?=
 =?us-ascii?Q?JtP/6oe1z+5/vclRKpXudNpBOWGNakftTMECZX/S6IMyfjQC+VqW720knJ9a?=
 =?us-ascii?Q?ljRSifv339XGWCbn93Kt0NrNmqXUSIllg8lcEWwSFd9F0q7WBguC/VnDQbpj?=
 =?us-ascii?Q?DiUkP2ylh07lCPwVq0iEgfxrkcRRpI2TbTmwgwcamNrJgh8FkN2dL+LWbfyF?=
 =?us-ascii?Q?ryb9Sjo2wva2fhYEMsSCr/o+AvhS1LyU883CDyqjJdRyjYTrzaemT7/8carB?=
 =?us-ascii?Q?MbckhVtEVp07VXBWBXCdd986MZ66GpnA2sFdzG4WYDOHCMuMMSqiPzlirFp3?=
 =?us-ascii?Q?4gCap7LD2AlQKVIprtHXnr653/cNKEDi3ZkN1uN7zY/FaYqMj+hKjHw0DM7X?=
 =?us-ascii?Q?+GQF9ODsUmQEeQrE803ptnVRNoJIWo7tIj8wfKZuw0A1Lfu1YPww8MyoY+dg?=
 =?us-ascii?Q?CeDjZmaNe1GkjbNIidGHhbMlKwl+GZXLVaLzQwp+Qc6BVyP0CMDpSLAhdXNf?=
 =?us-ascii?Q?Dh0UfXo3d+y2YInHcPBJkMo6qxQWgj8H5K/WOYm6cTawCtAsaY8eFxNxg9vc?=
 =?us-ascii?Q?dvOumOotzNSGEyaylRSQu1prsagvYSiMu1+8ZLC9TvTVaKGolZHL5DHeXFBL?=
 =?us-ascii?Q?/13oQcZaMTsqSXmtVexmv9TcqrKfBzRbaBNBkjgqR03t6DS31v/vE17ZPV71?=
 =?us-ascii?Q?6wUCoKmctnNAZNgxZ1INFglWQJH5ORkL5idxqDEOvSXKmKTi51kBs37Ok5py?=
 =?us-ascii?Q?r8Rb9d5VwWpBA2gS5/jkc7A76veylXGu/tdQ/F246JGA8uScdVXeq8bcl4Sq?=
 =?us-ascii?Q?CaCD2YeKbVYKgpyC+oDc2MnWs+9qoZ70vaHW5hT7IfMKvdlQx7erQF1LpOua?=
 =?us-ascii?Q?x8JuASKLU9s2F9lbOauazEc8qzQsDP5fo0zXubQwDX+PErefsATIyUuZxc8O?=
 =?us-ascii?Q?yi5waFBIOnmbrXUh9AVqBt8ti5xPl030wcFLGM+J3pbz0d633zMgSov4bC8q?=
 =?us-ascii?Q?MvFQRPKrLoIIX8KhZKdXm3XcBbZAlMc/ZMIYAWoZ8weIkcO72meduOEkl6Ev?=
 =?us-ascii?Q?EmRgiAb1MU9m1zs+IxR6DHOzn1hwUPgvqponAQsFbtPu6pwwl3ptZNOKgDtm?=
 =?us-ascii?Q?+DeUDht8PqQkc2j7DaNl0h73qStctS19gbpshZdbhXtLCWMGf/UDpLIEoH5F?=
 =?us-ascii?Q?kyZrZDQCXZVcR6Dy/2M2VkUpGolx1U/KZTSQ7303Bzs6eHtfdUgj1CgQPYhy?=
 =?us-ascii?Q?SwvM1+yb7FBbRX8HKjrujFdfTrAX1J7I4kpCWvQd4ks00FmEkMu1oxVbbfIy?=
 =?us-ascii?Q?dsJShN3hYFExPeQ7Vt1u4f+NhI8xeBIwNk2+SPKjDtAbOuuq0YXF61YJJ2n+?=
 =?us-ascii?Q?KXil2GoReu/37e4oTdL7c90xgrjdudxI4LJTzSLgr5hOieNeIp3sEISS8Hgr?=
 =?us-ascii?Q?5NqBQuq8PUg6Q6WHshgJ2djW+1k1zgVIqrArqflW8PE0Krv8W/xTr85UtAgF?=
 =?us-ascii?Q?9kd5IdKQ9f2QNrf89E4ZAdbmuSe+WFtznQx4SRtfl8YD0Wowl2UYvppeIpkQ?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886ba4c2-4519-4131-7ad3-08dafeec4b3f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:53:25.9533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnQh/1Ck+6zE981P6ao7bVSVIsu4hQyqLQmm7DO+/esjvJoDOJYRMUXu1J1kDcsHwys+HsP3N15R7NWRMRKtAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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
Cc: Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas
 Winkler <tomas.winkler@intel.com>, Vivi@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 12:26:33AM -0800, Alan Previn wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Add device link with i915 as consumer and mei_pxp as supplier
> to ensure proper ordering of power flows.
> 
> V2: condition on absence of heci_pxp to filter out DG
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 11 +++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 73aa8015f828..b5bc0b87a1d0 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -127,6 +127,12 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>  	intel_wakeref_t wakeref;
>  	int ret = 0;
>  
> +	if (!HAS_HECI_PXP(i915)) {
> +		pxp->dev_link = device_link_add(i915_kdev, tee_kdev, DL_FLAG_STATELESS);
> +		if (drm_WARN_ON(&i915->drm, !pxp->dev_link))
> +			return -ENODEV;
> +	}
> +
>  	mutex_lock(&pxp->tee_mutex);
>  	pxp->pxp_component = data;
>  	pxp->pxp_component->tee_dev = tee_kdev;
> @@ -169,6 +175,11 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>  	mutex_lock(&pxp->tee_mutex);
>  	pxp->pxp_component = NULL;
>  	mutex_unlock(&pxp->tee_mutex);
> +
> +	if (pxp->dev_link) {
> +		device_link_del(pxp->dev_link);
> +		pxp->dev_link = NULL;

since no one else is doing the null assignment I thought this was taken care
by the core function, but it doesn't do that indeed.
Maybe in the most used case, folks are sure that this won't be hit without
having running the device_link_add previously, what may or may not be our case.

Anyway better safe than sorry, so let's keep it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	}
>  }
>  
>  static const struct component_ops i915_pxp_tee_component_ops = {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 7dc5f08d1583..007de49e1ea4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -32,6 +32,9 @@ struct intel_pxp {
>  	 * which are protected by &tee_mutex.
>  	 */
>  	struct i915_pxp_component *pxp_component;
> +
> +	/* @dev_link: Enforce module relationship for power management ordering. */
> +	struct device_link *dev_link;
>  	/**
>  	 * @pxp_component_added: track if the pxp component has been added.
>  	 * Set and cleared in tee init and fini functions respectively.
> -- 
> 2.39.0
> 
