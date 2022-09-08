Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF95B2547
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C5010EB8B;
	Thu,  8 Sep 2022 18:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4152510E98D;
 Thu,  8 Sep 2022 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662660146; x=1694196146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oOObGCadV5Fq2xM8XGjofcdp5kHgJsSsPjU26VoICo0=;
 b=ihjVFAqElcNElrUmhSBzOGmvmhYEEMs7IRK4uTSoOxO/sMg/8flyFYYc
 9BYLnXFO4veUglan1IYqvI8Mrtee4839tVzp+QguFylUgRYTpZJVSIo9D
 Pmfnu1b5AzLmjYgepWhPXc9O/A6ImsluxANAfbxtFzjroHxA+IfQB1KbX
 VNBEhCYXDheOGZDtCF4a4o2bnpLx4foRlTVIlYbH24wF5k94ztHoWpGc5
 KDw+pMrDMADQjJOMkKM/iVcALNdXiOUR3yubtFkBkr80zbhDYe11N2MYY
 KpZgXf1GIVrvyBCBtU2hz4bWHLQSVy2BJNGM+M3Kbfbho52jQyQA7LrqA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323479310"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="323479310"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 11:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="704104529"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2022 11:02:13 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:02:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 11:02:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 11:02:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEq+ef04rcxGADwJdRtbqEIpnAxLZrNg2ASGzr8Xvy100IZEAKjdzmDNXOcRIJ24YcCPTcViHc/cq+tjD3U1sf+hmHOxUb7S8GYIjuWgxVXXMXp6qssE9AaWNrIuBNdXHijj44VfAB3MsNc9OoWH2+hg0G2gu5o7lhyAaCWx4J/OtHQVyjybuwQj6e2jbdjws8lwPodW9EtoihOFS75Is1jrwDBcQV1zwjcpbqq+KgBTckCWO5ka46hClhy4MsL4o8VRMfi+aU9IgM3UMYUiT4ESRdwhhGQG3/58EA4Ski8OefMfRIfHO2pnE+ojoZ+nLCQeYdLLh0LOBORyF7+dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2Z5YSL3tMkgHRZS6RanJjZe2GLO/AMJ9eD96DfjbL0=;
 b=UNUwcjR93/KhauJeEAFFI71uH0oyCDXO6k8mnOq8XLkF0TcjTkleiy55DB53Vs6tvnKyH9drFHrv81HhbV0mNrSwf4iDWBZtKFSelOjkyDdJ33Qn19h4bLX+Twstz0fgBd1Fg/RdOZnOVrUtEAwZiYLoYRqqYBt+1rFWIgvuIjXQB9bWqMOTamqQMYA3S/FZ03wwaxkvn/qeaQrTBweSoPnY5pwCIw6LOb0hf9993Dei2TRSRsgjNrZjy/iL79yqFVjKdOgox4pmkCPA7dizyQek/TLBTDlnFtNhHureqQfOPntxJ+B6Iy04HOlk1TrqYf9Wy0e80XqmHG9CG4kIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BN6PR1101MB2195.namprd11.prod.outlook.com (2603:10b6:405:5a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 18:02:09 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 18:02:09 +0000
Date: Thu, 8 Sep 2022 11:02:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 05/11] drm/i915/mtl: Add gmbus and gpio
 support
Message-ID: <YxouH9NnTeJPh/GP@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-6-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-6-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 180232ad-fd6c-414a-78b3-08da91c43fa3
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2195:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMhzW4vTFSkROmzZEA4DHDG2mAJNtG6uKrapS+7Qv/SVMeuCqCfNkINE5hdxg5zaHn76+6yQE3JnqcTYRI0AhvgMgwT3CShWDxtbEeZF/Rr2f//Mb0r36B6ZEl141disK/j3/NYxkzPdjqmU8LKDovAjxeQFiSDnxAwVt1O1sxPQE3VVvZxAJGZ5J3QfzfxKQeg0Aw8WibjWezMKGVLn0gbaOv58eAappnicMhiTG7pZy18EGmFCtk+FYhLZgwRJVJwlRqtDHxYT0rnFGfssOVPdQQrJc9nDftoYid6tTSnfUGt+E2+wl6QKxljHuYiqYJ46POQOx80tLxNdFVF0Z4bgbSBEnlXwNFRf6Uac+XihCFW1UaORk5IZF9sQXdVjA4jc1leEKmOimnO37+BHkB4OmWJhQrFLtZ8IxdIV/ceMNjrFLIc9tWCja1YRiI5nBfPVjT5HtMT4rlhi183SPVg/BggLbtCTFl8rcHusAMrX4Fj0dFjB7ajKMjiyx+xFfHqaZ02GEswCBVR3Ral+T15ltNDan7GXzsISMKuY8+i1Nlb5qru/SwaQnWLI+Q1XuBQz0bvzyeIPz3JkHR8qdrkpU18TwqDj10pyMtf0GuRuXoy8CkEHUX72zfbWJFF75s09dymjvUWpYFCUtfvCjhXowbWoE1cYy9C+s+WlVxaregPLnzZYsyi33fQ7mFOUv0oSwBQwd/dudAy0iVpQRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(39860400002)(366004)(396003)(86362001)(6506007)(8676002)(316002)(6636002)(478600001)(41300700001)(6486002)(186003)(6512007)(26005)(82960400001)(5660300002)(2906002)(6862004)(450100002)(66946007)(38100700002)(66476007)(66556008)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g62aX626F6E8Ly0wPd8A/Dmc3gbJYZKt1Nqlg8hjEq1QaDaXhdICERb55re0?=
 =?us-ascii?Q?EMTSGzfrr4mPU+nY6Ku11ZvVqNB5XxToZFES1zSP02CvIa/6+aDAS83ET4xo?=
 =?us-ascii?Q?FpDhIoWmInJt9I9uaqXRRFJLs9Yi3qqzUMCv/Ej0noCR3jOcI55iNB11blPM?=
 =?us-ascii?Q?sDZAi0Evy+ZNdZG7L/gkNyap2iY39gYO/xSfiXm/0NYBNKlM4AuuYZtyHO8B?=
 =?us-ascii?Q?KXEBrSm1TRBdkTT4Hxi5dREEQrr4MQeycEmWO1IOSAwa/+8vxu+SsmiiKlxB?=
 =?us-ascii?Q?PsIabTnZ22oH9KUgrkzuCxhvxJ+HePQrj8oq4PL3iEwiwyad5calOnh9tsWQ?=
 =?us-ascii?Q?Ut/Kexp2cOAMz6UhmwGrbswb3IKV4Hb6K5hRtAf6XLed0gTFjsOJxyDCVdC3?=
 =?us-ascii?Q?sZDqOKY9IqpinywjcSKOeGAWz5nQ+oCxc14KkujWeioz4I2Q8MfvyM89lD/H?=
 =?us-ascii?Q?/AR/PQwFuwIrmD/FpkxkDIMXrtHBOz6VntTOGcDJ6plMicvAnv+r+UnD/pze?=
 =?us-ascii?Q?6R52B/z1jx+1WaMIJyMCbVR/31uG2qoB/Jz5Yla5EEUfx2efrYyWJGHgUjDf?=
 =?us-ascii?Q?mQBr4RVl8I5Tm9oBabVHJ9kOjr5uPXWWpV59tU5JTHsggyLyWeZxvj7MeXio?=
 =?us-ascii?Q?7krh3nO4EQtgaMMsWlozxKLJWXur7I6P1mIpjXSjHJQkOvhmTjCHPYpnSq3X?=
 =?us-ascii?Q?cr5jegtMjbxcWJ0V0uyOOdNfns+KUN42zo2nL0vhkhNycbamKX5fr5dXAn/2?=
 =?us-ascii?Q?UZE64ozbaR49s4KlswinS89cluMVE5is6pfFEZWWqmy7h9RXeCHpmUSbQCi9?=
 =?us-ascii?Q?vbxS9JrCYQ/oo+rC7U1ujaH/ZjTfWvShQHL364+tQ5XgYuen8Wemyb/RIbmq?=
 =?us-ascii?Q?bSTcP8AuOVlevFF1Y4ADeTl6nnMbr9zvjU+jl6OYkzDxuQkuMNoxs5glErfD?=
 =?us-ascii?Q?alXvs+g+YwSST5USfPmV86nQ66GEPWxtK7IVnIvYe1KHiZYMBQeXP3TBae6X?=
 =?us-ascii?Q?QDyKnlx/h/E6JhxirN24KQw8N4stcj50iWsMhpc669RugPTkQY7lCA2pqll+?=
 =?us-ascii?Q?4x4ETwdvlgwl7rGDUtZdfh+IP501qbkYgD1u3+1qtozU9akTVGe4s7B2nBNv?=
 =?us-ascii?Q?lFIxCHFCADxU88R13Ee3vZw++Zzp+C3tvPSY5H9LLPfJGOShHBy6cUZn0rRm?=
 =?us-ascii?Q?Dbe192+lmS0NkPHmvmlL+3r4wTXYqf7izChXGO8gS52ADZufHaI20NgQx6H0?=
 =?us-ascii?Q?KC+XbgqMbC4Q35O4KB+BnNsdhH0j8sI1R7dtDbHhGMbRBtGxnXeIL4FXh8pw?=
 =?us-ascii?Q?vTVEq4Cb6clo+ftnMu68LJg0sB9rQ1z/N2RLAwBQKB8H7+KtDtYYIV5QHUi6?=
 =?us-ascii?Q?FCvovOM1AnE+/eCy3K7HkZSfl7BPr5fHBEhFltNmPSsNC3YYdHBoS0tvyaMV?=
 =?us-ascii?Q?rpQ8HMme9V2G2g43A9GBRdicONM3ynQSHrQQtjlX+YqTDk3cJgl4cZFIjjnZ?=
 =?us-ascii?Q?+IkXbCCeebflobegs3dinabuy6izwz3KWr0PHr3nvf5GzPNPEL1W/aSSKjmr?=
 =?us-ascii?Q?GYVxqZ8Gc5ctS6gpl8t4dSjHNoCTbL59z5KGxfMWuaRZQiwPGCVMyZYWOiE4?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 180232ad-fd6c-414a-78b3-08da91c43fa3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:02:09.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWU0tJT1A3uroALV00/+xPhb+VEZ36vrHAUPsDW/VHCXNSqZTeHxdegvtd+28q7NIvxxSzcF3IRIU/5TmS6Q+oppdpbVAD/O5uQxzW12POw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2195
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

On Thu, Sep 01, 2022 at 11:03:36PM -0700, Radhakrishna Sripada wrote:
> Add tables to map the GMBUS pin pairs to GPIO registers and port to DDC.
> From spec we have registers GPIO_CTL[1-5] mapped to native display phys and
> GPIO_CTL[9-12] are mapped to TC ports.
> 
> v2:
>  - Drop unused GPIO pins(MattR)
> 
> BSpec: 49306
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Brian J Lovin
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 15 +++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gmbus.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 6f6cfccad477..74443f57f62d 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -117,6 +117,18 @@ static const struct gmbus_pin gmbus_pins_dg2[] = {
>  	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
>  };
>  
> +static const struct gmbus_pin gmbus_pins_mtp[] = {
> +	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
> +	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
> +	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
> +	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
> +	[GMBUS_PIN_5_MTP] = { "dpe", GPIOF },
> +	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
> +	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOK },
> +	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOL },
> +	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOM },
> +};
> +
>  static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *i915,
>  					     unsigned int pin)
>  {
> @@ -129,6 +141,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *i915,
>  	} else if (INTEL_PCH_TYPE(i915) >= PCH_DG1) {
>  		pins = gmbus_pins_dg1;
>  		size = ARRAY_SIZE(gmbus_pins_dg1);
> +	} else if (INTEL_PCH_TYPE(i915) >= PCH_MTP) {
> +		pins = gmbus_pins_mtp;
> +		size = ARRAY_SIZE(gmbus_pins_mtp);
>  	} else if (INTEL_PCH_TYPE(i915) >= PCH_ICP) {
>  		pins = gmbus_pins_icp;
>  		size = ARRAY_SIZE(gmbus_pins_icp);
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
> index 8edc2e99cf53..20f704bd4e70 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
> @@ -24,6 +24,7 @@ struct i2c_adapter;
>  #define GMBUS_PIN_2_BXT		2
>  #define GMBUS_PIN_3_BXT		3
>  #define GMBUS_PIN_4_CNP		4
> +#define GMBUS_PIN_5_MTP		5
>  #define GMBUS_PIN_9_TC1_ICP	9
>  #define GMBUS_PIN_10_TC2_ICP	10
>  #define GMBUS_PIN_11_TC3_ICP	11
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
