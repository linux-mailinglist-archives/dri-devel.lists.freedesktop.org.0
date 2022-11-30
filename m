Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7281F63DBE8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 18:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179E10E108;
	Wed, 30 Nov 2022 17:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553E810E4AE;
 Wed, 30 Nov 2022 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669829123; x=1701365123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hhUxVIhW4AT9X0/z1xeEVosy8caRk9iT5A0Kccbdd3Y=;
 b=Vy002zSZtZnt1Y4juJ8NoQI2kSFx0lS56X5jArX1fSdks2NyHW9Pi7k7
 ltJRyanY8UZb631vs9gsr9rAohtfWOhvnWKDw4u32rN1JIqCKjsKwL3aj
 3RlQ+b71qyn89iNCaVJ8TsDp7OBeCoMditKFckvXupGNG3kNgCEyYu76o
 3Kd5uJI3V8rXYcCMnpDAwClvsDRVxlBYCZNcyQmHb4GLhvIU1sfFL11do
 dO0uH4+WlhaVJS30pntRgwDNj147VNkeuGeYzQZS8PTZR6VBAAzCtWrwE
 4Z2CdxYrN1r9lHw8cwVMCWwJRAj6nbj003X3XHBsqyOiT0itYZHREbWW7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="317308340"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="317308340"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 09:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="786545540"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="786545540"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2022 09:25:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 09:25:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 09:25:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 09:25:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 09:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii7NB4mb1lUo8A3YZLOTtaTj/3Nk7LkTkb97Qtyex/AuxbDpy97HeTDec6CXjK3P1f3Mo0rlinG/hzX3RqYWSgwV0Dbuqt9ZbOvaji1ovntmIbrAcFe12K3ZXixcxEMxXnxuxOYWXNcWYcz8ksCMktCW1yxQa8jf8tzmuFA4RNQesmqfY4le8bTVdw8jDMMYaK9R5FU2PR/ed395ps13szEvlXffqCAv15yA+8+NH3vs+iuHHCk4JX2cA3dBRSlC1hvojgxNYWHX841Z6RKEagbOYSP8EmlBcakL+EoKJUA8HcsX1Q+NUJr9Ia9DTNw0Dq3m0IQO+Vz7Zt9/FZdlcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok7kJUiPi5ObwFCzo8sV9pg+fiAw3Ne4FvHQp2wJWDc=;
 b=QV+vtUZWKdKEe+LopNxFAbY+F/+qYkIKHsRhFiWmrLNCHGI73TTMlRUcO7ItjZ9aotL/y2qECX3+of/q9aOePzuBQKvUHiP5luYrFtLYbF2SqbSVVM5uXtb3pm53/MIAtxly3y+pCIXmeJ7v3eFHu9yjSeQFBsgsPtQosgF/mQDSes0jOT25YyvEzp2Lj7xmE5dUvIeIoxKFI57b3kpjq8c1EbjGo31+RbNPI3pZOLJg7T/aFhWgvV8eXv51cTKK1IajJnQ5yCANAozC8CLrtM1l/ObxzW9dLr82UHKumP91uNHbIFiYA/6hy3HCrJyeybTz2rGMIHR735D1Wdxvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Wed, 30 Nov
 2022 17:25:12 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 17:25:12 +0000
Date: Wed, 30 Nov 2022 09:25:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Wayne Boyer <wayne.boyer@intel.com>
Subject: Re: [Intel-gfx] [linux-gfx] [PATCH] drm/i915/pvc: Implement
 recommended caching policy
Message-ID: <Y4eR9Uoc7jauA8sN@mdroper-desk1.amr.corp.intel.com>
References: <20221130170723.2460014-1-wayne.boyer@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221130170723.2460014-1-wayne.boyer@intel.com>
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b3b4c1-1155-4ced-fa3a-08dad2f7d657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfav4ppfbSzqNbhozmeP2AHID7LpA/F1FUbEg+cSv6u3jnqgbHGOwD+SrAfWRNw21l+PB/3yZQWD+pdMYl/ltzPhfViNmaJ+TnOFFb7p57UTiZyjI5RBjER0fw8SxjCvzlwLtTu+o8e7WQcvA+O4AsOIEPTzBvf6dhlmWS0Bpyfpm0LakceMA+8B+1sjX+Ku7z80tEpivH3QnfrJO3vTG1eLq5A29nmYlRFbkb2khaV/VPtxDa1FuCqRA8wPz5bFjO4TZa9mZN/ddfDdfLT5LuQfXb8ADwAa5s7lJqaMaiUSgAqTZive8KWcfQZ35IocsOhe7RjXPEDr6sKKdIBrZQWz7APBvcRBO/FqRnat8XRLvLlvI3d1sVUFwTjs1NFlnBp+agyy8ujTMk2Mej1HlvZrjZai82uBSvnpXIawVrXwA2O7WVkz4CpeBEgfXzwzvtfC/b5C1QnFucJI6ZkRV3PRGtvkN3rMYMBqZXi1+MD9UtsYYi9ecYO8KGN0M2vvVlEVtZN2i1OAwIBXxdEv8J+OlYBOdQmzgy+K6IS2gsoJ4ucNZAUhqk6RJU8VqzNI3NSof8FAmGiHY92ZwHCnWw3Fpm/CbPh+LNHQeWulWjri+TM/rKn3d5xQcTT4S8Nyymxs8PWglEdOH8aRkPGmmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199015)(82960400001)(186003)(6512007)(66476007)(66556008)(26005)(41300700001)(38100700002)(5660300002)(6506007)(8936002)(6862004)(6666004)(2906002)(4326008)(450100002)(66946007)(86362001)(316002)(6486002)(478600001)(6636002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IqLS19djIWwPW+hC4gSRH2s8d2R/eHnxeT2/3hv9WzXxUB9gGh/aK8rLYv6u?=
 =?us-ascii?Q?twVafpxaP+B5FsJNgauhNVqllVfDg9OFC8B57Bw+UL6e0OzSGh6sJimVpQAc?=
 =?us-ascii?Q?DQbnyVEQLsge8ca5O5kF8qXzxKwtAuH9wCOE5LsDs52kfPfdlbu5AlYdE7qj?=
 =?us-ascii?Q?7Gn4uAgaiJoKKPA5edGUrz4dl9yG+29aWoptunZ4z8oSC0DOwVo7UdDHhIgR?=
 =?us-ascii?Q?3P5s+zbWYqvjCCVZXLC5NnQqS2q+FRoA+Ln/lAKgI4Ics0NtKRBA8+76AccS?=
 =?us-ascii?Q?6EVkBaKXckprlJMeLoduDco2SRS2abC4hamO4lqH91esrS+VfEkdNNExsMEn?=
 =?us-ascii?Q?glk8S8uggxUK2tw00HzPFaynVeYkmmpDU4PaTTJERpKxqIbSLAqV0Wp2TJSB?=
 =?us-ascii?Q?RnHaH8RUeKBrnICckudpqcrIhLHhf+Fl6rd0pcsFQcfbZtl/IMixxA1J7F3T?=
 =?us-ascii?Q?b5VDdSYbgPwBiQJoX1TruJPl+ui2vmUTqhDhT77MH7VC6w0aL81TBdnuUAeE?=
 =?us-ascii?Q?P93i3TSIwclyBjYyGL/a6IpsIt54OBUTwx6JCQiwJf5Gb5dObK0FyQgyOEgC?=
 =?us-ascii?Q?aidCEuzL8KrA/haHbQ6/Nn8VqkadCRURFqEMbmUzd/WCv+ZbpMj5mh+NnnCS?=
 =?us-ascii?Q?THP2NVQzNrFaVMnHFPGu+XFGTbrWBxDxWNuPmXQKc8Og88XeIypf5RqRvJ9U?=
 =?us-ascii?Q?0PYE7FUka93DbNzaRvhpwCcdXVwujeEi750lYjcJfjYdAUDzgQ2lh1hKBH6Y?=
 =?us-ascii?Q?gyCJSSuMiLPWYxncXYOCWqGPBVqrltVH9z4rZRZ/mbITNKMIOAeFDqiQenjT?=
 =?us-ascii?Q?F4cFr0XMuMfivOU5s661D5E+7Zt/IP295pLppjQnDkKRzC15wQPpCTCgFnRD?=
 =?us-ascii?Q?RBLSXAfojWep2mW+OotKAjKTE45UrR67/xUAHsLlOUn6v0ZPlYUbRpCgGfLY?=
 =?us-ascii?Q?QkN6Z0F2OJaOmhp0xpNRQ+DIsQFy9rdRFX7xhdEBNPwi/DrrE1v/U7PZGXUu?=
 =?us-ascii?Q?rLZSTNJrPIsvkqeg3W6OAR9qZSqR1w2e6QGdXze2G9Fvw4F1nXnUpoi2WEx7?=
 =?us-ascii?Q?53q2HM0rBwz3NG62G/Kfk+omJkQAg1KfyFglYI9l8aKNYD+5Tn0J4J68Ovnx?=
 =?us-ascii?Q?ZV8C6G5viKSVCcaoQ3DDh/OA9/0m1seIUEh2RvWGqzZTSB+dv8SK+3zsjX0Y?=
 =?us-ascii?Q?Q0c6zw4CPsb4LgYqitvzPu2ogQawvn1ZqCLPoDYKvZVuc8sXOOhBoIisZqUV?=
 =?us-ascii?Q?Cat56FnUCJmz9UTcYpNAeGig1vOoh/2kC5YsLrt801LVmmk++TgXWHY4DNHT?=
 =?us-ascii?Q?9n1pFT/QXqyZNo5aQmzwpesH/rvb4JfGV5uWO2p/ECYSba2rQjyQzlLiHP4k?=
 =?us-ascii?Q?A4Mjk9Zphno3M0C/hODVSMLBdRyqFVozDIt2Y/lBfj68qAs1SqBh5UW9w1TZ?=
 =?us-ascii?Q?Vx9F5vAWJ7LiCBa7/gP1TiF96rWHTW40Fs1CMOTmdMNxKQpJhaS2RYJ/M1zD?=
 =?us-ascii?Q?1MNX8olR9FoYq7kGoj26ABFkEiUE49/tteT9NQSW6jpFfDUCXx8GmffqDsAD?=
 =?us-ascii?Q?jYy1Mrz+7mriUhsN5rq2iErlyPUMMw6OXh8GIoyEW0VDFDf7Wc8Hefi3qzSE?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b3b4c1-1155-4ced-fa3a-08dad2f7d657
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 17:25:12.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlqkIKdUoSOSYKYsXZoB+vByZekSknDgY3cUUebMxiKS7SsziB9uvM/BwjgJzm0u8xaJHL1Uv09MAupzy0PXEo6Fxw89L9JD+z6Gc7UYgl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 09:07:23AM -0800, Wayne Boyer wrote:
> As per the performance tuning guide, set the HOSTCACHEEN bit to
> implement the recommended caching policy on PVC.
> 
> Signed-off-by: Wayne Boyer <wayne.boyer@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 784152548472..f96570995cfc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -973,6 +973,7 @@
>  #define   GEN7_L3AGDIS				(1 << 19)
>  
>  #define XEHPC_LNCFMISCCFGREG0			_MMIO(0xb01c)
> +#define   XEHPC_HOSTCACHEEN			REG_BIT(1)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
>  #define GEN7_L3CNTLREG2				_MMIO(0xb020)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 1b0e40e68a9d..35e3f43e8b06 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2903,6 +2903,7 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  	if (IS_PONTEVECCHIO(i915)) {
>  		wa_write(wal, XEHPC_L3SCRUB,
>  			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
> +		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
>  	}
>  
>  	if (IS_DG2(i915)) {
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
