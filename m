Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B95F1049
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 18:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6278C10E1E1;
	Fri, 30 Sep 2022 16:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F02E10E1E1;
 Fri, 30 Sep 2022 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664556760; x=1696092760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gknX0ZbOsInPV0PHWOourmEhPsUAXtfc35xJEgfCtsA=;
 b=gaJLCBvuykSh/MSSoxJBXggFNliG5lPn/OrbtzS8gqeBVN7UI/vZl7ns
 H3jjMAMLixOhH4nHZv+gHqvFQUbvi8/8UQgimzFVEcqACYAxPq3kHBXSE
 O+7IVxWFqEA5Lobm8kFCGS/J7JmlYyssK/yTeV6Q+FNOsDCKVa/Pc61DS
 25aTq6Xc/1JDI/t/UCDR+gA+6/38x78nguf6IHHFO5xEP7bFKEqLElDgt
 lvFUN40oIqW+oBh07WrAGdKcWkIZsNM2S7x/8HH8fxmaPMf5XITN+NTYy
 yAx5IA6zs2Its2Luc3/apP3XOq7NYvGVCj5LeR1WHKHXaDjgMI8c0qAum Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="303722552"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303722552"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="573921865"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="573921865"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 30 Sep 2022 09:52:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:52:38 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:52:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 09:52:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 09:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjS30vKRktB5q9fkCeSuHPnAt4216YGPRMFQQA4cVUUUMSrIKre6j2B3c8DEKrSPJIE/mVJwo83dWTptee/CYcBUr+cBVO6CgMcgz4OsJ6sj/8sAwsvDEExTA7/qwljiYVqsHjJbV87aEYGWFRd+JOBYA4vGuOLhY5lSY4xdpeWC8dledQzHoaDSaSYhnmPX1E41mHMg4gb4p6bhHvDGS1ZgaGsJJk1ZwUucGbpZ1OqTuigyG1i+9EQWYM1rlqjTMvCDgdgKXCq8FlT1vxy9VieCkcxcS16e3TBLTiKqyqzBQBWZ0mw7+A9JkpVekRSJ4xoBUVoq4XFbDVDwglpZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUy830CO4zw4YfCb81o5hSDqX72IuMW25TOWi3faDzI=;
 b=SsWABLGEzV6eEbSA3a68A3d5zUaiMQWOwugSsGE1qd73t2v8b4ApMMsqR5++JSQ2HfSNZg6u+iU2esdyeGOVpQTeO5xVQvC5OmQHNNde6BMH+bt6LfWiTKBmUQjVbnrWIqxbmw6jVDYbau0FRthLXSeV+jJ6GdcOOfmzdiMKqVcR6hszMfqwKQgEpetRV9fii1nV4AWVgJCm4mO4QSFql106vDoFkp8zTnjvJVhV14wxnH+1fKdM1VvdeEQ+wLiXp+sjfO69aqDhE8UvFmIhFEuFaQVJ+uXZlIU7q9pb5JFwW36mtDNGB7vU5Kh9JZVMz/z6DjthUODaMuIAOtbpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:163::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 16:52:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 16:52:35 +0000
Date: Fri, 30 Sep 2022 12:52:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 4/7] drm/i915/hwmon: Show device level energy usage
Message-ID: <YzcezNGdRJnyXS3N@intel.com>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-5-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN0PR11MB5695:EE_
X-MS-Office365-Filtering-Correlation-Id: 6530888f-9153-4516-dc59-08daa3042ca8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+4syEBJ1EQP5a7LNuqNTAgOeW8NSdtpDF3cF14sFknSsJWYxqdOGEIt5lSTK8KZgn3egswYuogwGv78Kvrj+2/Qu/Nlkf3T4jo5G9utP9b7JSOX9BWWb2W7x/0itPbp1PlMLgIrvFk+EWEvI8nz9oTtkAzu1i1ux+0GAdD02XFCXiDK6I04f0vCU2Yy8g2Scaq/EYbbs4MPE96h5HEPRfuqmSH8gInPHn+1r5OGrhBZLbzDiEtQny3ga8+Idk7sRGIjl4ss3ih5tteLXZ5ZhZwgebNeVCaAEjB/iQBCx1+E9q8zJ5ZEk7S4p3eu+lcpcEEiS2aWUVtyrFx2RK6L9Izl/mZpIZMceNHlzBqGpmhiKj4KUE3xONQm95YMyI/SfyafvW/Qlvrp/A/2l3m/ACaEer/EWH7g8E5QLbMbhTcHa6bK/4OToJS9BMH4FCGmiN3KgB4asNB0FffwhMttc9wBux99HrSO0POcGcxo1sOr6MaY+++A/eeYmfD92AuL1IXdGnBs8jnyd3mRlpn5pjP829qvH3oHon/kcL9bneGkf/LjalMgMPj2+bEFWaqII0PzNDy/ahL29gzTF0o5917jAu45Cwxwv1LTFUh0FpLMwtLR60sGq4W2gGPlH/QME2mx8QLzup/htUN7t3LHtblZaE71nRO5BXzlRT9R6v5HPBhOZz4/RGLUZurycwel/edSrgtp4K4rX6L+6h/wPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(66476007)(66556008)(186003)(83380400001)(2616005)(82960400001)(38100700002)(44832011)(6636002)(6506007)(5660300002)(41300700001)(2906002)(6862004)(8936002)(6512007)(478600001)(6486002)(26005)(6666004)(8676002)(66946007)(4326008)(316002)(37006003)(54906003)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dQsQtHbLuN6ykKHuPdP2Pc/blDKX/x3/SFDFy365elY4p7H/AqlewnLOaMtp?=
 =?us-ascii?Q?iWfMXpo4Q/Z+5GDreGjUctasTHwu3MRh8SFNwWQi6Cke4MVvRQ6LWq2wNqmE?=
 =?us-ascii?Q?yADaEuRV7ORs/DP9cfDC3RPFzjxpf044DBA9wMGv3MuLes7U33pcdA6dru1y?=
 =?us-ascii?Q?sOngqGLOMPyJMnIpTvj8RWnflbUpdJUfvCxFzw47wYcrzAtXvBc814xhFzuj?=
 =?us-ascii?Q?BhCTxiZ5zHGBjqggaQ9AhC6SrMk29BpAVrhUtLdMr3MQURHvip51OKVwKp/1?=
 =?us-ascii?Q?ZIjLWUH61Ai6IXnsFZNBvZKst8zyLbwkMTcrQO9j+LOVRKnoaytRrpxfKd2/?=
 =?us-ascii?Q?N7bf0cHsOUmU2svQDaT63MrrPP+TenQ9tpGn29cYHySrQbKCtswldXC4TGt3?=
 =?us-ascii?Q?25aUCH1DMypFN/U727fvqgHXFF27NQM4+yN/YxGb3WTal5FXiKevWClsiG8W?=
 =?us-ascii?Q?fi3GxutJeraXtzYSucXnJcqWhcxx5txE2z69B80+7p65dnS8WMUZVoeemXOp?=
 =?us-ascii?Q?j1cbpLYta5lJYiXg44KuKKAIQtXEiKAoP+UR2RiFzeLb7RKOmCTW9qlFqWMT?=
 =?us-ascii?Q?O5HOB0rqHNfV+o3NV+NshQSezGWD2p4KZpwZ1TFQ/hDLDdpMwv3VbP6xX/O7?=
 =?us-ascii?Q?FovN+98ICXD+JQTN3ncCziRwT4vse6axAAoworYYhLtqCbbvsSDwP03X+1NE?=
 =?us-ascii?Q?p7XUdfioMJoEmiQpr+dlBPyspVYiq3Hi20mzi9dsAGfMaHc4Nt0LFeb6ytVa?=
 =?us-ascii?Q?Ce28gM/FScBeqEqOXvrTDvEgUuVrSU6UQ+SHrFzRqnqXjpgGDtWSBDEc+bmC?=
 =?us-ascii?Q?Nw/lnjgitS3IAriEa3FBhfWb0wdWGbtINnWYXFK7q371D61GDizr+YoGfyAe?=
 =?us-ascii?Q?hjqQC+p5O+eRe7uTIH6HjmiRpUl2eDOpSsN5yR2s8ohPmrXcZcqA1OXClnNR?=
 =?us-ascii?Q?Opa9Dqx1vYgKozyCaXS+2DibXaHUjAdONJn9aXdNLrJkjzv7362/mB5Fls74?=
 =?us-ascii?Q?dGOkuT4Hl5Nsf5ilirYiuvIqdcqJSGNqUuEoXxeSTT8yikLGjid1n44vQSAG?=
 =?us-ascii?Q?cg5u00lMtr0VteNc+e2hPpwB0octX+dxIXV+kpaALo7RTbEqUPW23szK4cVL?=
 =?us-ascii?Q?XYQ5Xs89i5Dd2ce7s0nz28wj8IiIyAuQQB1qMgu0WVIUdq3o2Qd6I8iEFaeT?=
 =?us-ascii?Q?ZQSVypynTDUOHd1mIBv3lC1UIvHeW7ioCuZolGgJ2KFvkGRVzMMuFnpE/Lmi?=
 =?us-ascii?Q?iWk2HPegXhAbbD7AxYI6pODW8disId4h2bjblKKJtIUlFWvvr3Z0Bes6XgxD?=
 =?us-ascii?Q?dW6ROPLv26+PB2c4ukixc3v4H7V6Xc7MQ83t6jXy94IDNRfZVu8tQQA/yWTx?=
 =?us-ascii?Q?ytYiEDKyL6K+3NeBcD3egnqC8r8/sAaTuNZ70IySpnkkeKBz8jOJ+uMhHh9y?=
 =?us-ascii?Q?r48LcCZQ7VKHW7guAq5tilv1sn9AegizA8Up+fsSdSFQnbzQu7CuGfEKsrAE?=
 =?us-ascii?Q?9nE2cjtKWJY7v0LpZwBl9533hvtwqvHUcgLq/rIcsPGbVkh2IvxTVH5og76y?=
 =?us-ascii?Q?KuXuD8qPwsr6xf32wkychG0bhKaiASJBGtB0YvLVyTpe39V4qQ6mnj/OfmJi?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6530888f-9153-4516-dc59-08daa3042ca8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 16:52:35.6118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYEfR33bxIha4y8Q9aw87ggj4DWHnrfoVcA+W1e/tCR+3K2BkmO+r1eggwP9TxXGROSNyv9tDobkiU6WfMJLiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 Jani Nikula <jani.nikula@intel.com>, anshuman.gupta@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 11:20:17AM +0530, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Use i915 HWMON to display device level energy input.
> 
> v2: Updated the date and kernel version in feature description
> v3:
>   - Cleaned up hwm_energy function and removed unused function
>     i915_hwmon_energy_status_get (Ashutosh)
> v4: KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> 
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-i915-hwmon |   8 ++
>  drivers/gpu/drm/i915/i915_hwmon.c             | 107 +++++++++++++++++-
>  drivers/gpu/drm/i915/intel_mchbar_regs.h      |   2 +
>  3 files changed, 115 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 16e697b1db3d..7525db243d74 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
>  Description:	RO. Card default power limit (default TDP setting).
>  
>  		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org

I'm sorry for being late on the review here, and I know that others
already looked at the date and other details here in this doc.
So I'm curious why we have decided for the dri-devel mailing list
and not for the intel-gfx since intel-gfx is the only one we have
listed for i915 dir in the MAINTAINERS file:
L:      intel-gfx@lists.freedesktop.org

> +Description:	RO. Energy input of device in microjoules.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 53d34a7a86f7..9a49521b358a 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -17,21 +17,30 @@
>   * SF_* - scale factors for particular quantities according to hwmon spec.
>   * - voltage  - millivolts
>   * - power  - microwatts
> + * - energy - microjoules
>   */
>  #define SF_VOLTAGE	1000
>  #define SF_POWER	1000000
> +#define SF_ENERGY	1000000
>  
>  struct hwm_reg {
>  	i915_reg_t gt_perf_status;
>  	i915_reg_t pkg_power_sku_unit;
>  	i915_reg_t pkg_power_sku;
>  	i915_reg_t pkg_rapl_limit;
> +	i915_reg_t energy_status_all;
> +};
> +
> +struct hwm_energy_info {
> +	u32 reg_val_prev;
> +	long accum_energy;			/* Accumulated energy for energy1_input */
>  };
>  
>  struct hwm_drvdata {
>  	struct i915_hwmon *hwmon;
>  	struct intel_uncore *uncore;
>  	struct device *hwmon_dev;
> +	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
>  	char name[12];
>  };
>  
> @@ -40,6 +49,7 @@ struct i915_hwmon {
>  	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>  	struct hwm_reg rg;
>  	int scl_shift_power;
> +	int scl_shift_energy;
>  };
>  
>  static void
> @@ -98,9 +108,60 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>  					    bits_to_clear, bits_to_set);
>  }
>  
> +/*
> + * hwm_energy - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static int
> +hwm_energy(struct hwm_drvdata *ddat, long *energy)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_energy_info *ei = &ddat->ei;
> +	intel_wakeref_t wakeref;
> +	i915_reg_t rgaddr;
> +	u32 reg_val;
> +
> +	rgaddr = hwmon->rg.energy_status_all;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_val = intel_uncore_read(uncore, rgaddr);
> +
> +	if (reg_val >= ei->reg_val_prev)
> +		ei->accum_energy += reg_val - ei->reg_val_prev;
> +	else
> +		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
> +	ei->reg_val_prev = reg_val;
> +
> +	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
> +				  hwmon->scl_shift_energy);
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return 0;
> +}
> +
>  static const struct hwmon_channel_info *hwm_info[] = {
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>  	NULL
>  };
>  
> @@ -192,6 +253,32 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>  	}
>  }
>  
> +static umode_t
> +hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	i915_reg_t rgaddr;
> +
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		rgaddr = hwmon->rg.energy_status_all;
> +		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		return hwm_energy(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  static umode_t
>  hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  	       u32 attr, int channel)
> @@ -203,6 +290,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  		return hwm_in_is_visible(ddat, attr);
>  	case hwmon_power:
>  		return hwm_power_is_visible(ddat, attr, channel);
> +	case hwmon_energy:
> +		return hwm_energy_is_visible(ddat, attr);
>  	default:
>  		return 0;
>  	}
> @@ -219,6 +308,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  		return hwm_in_read(ddat, attr, val);
>  	case hwmon_power:
>  		return hwm_power_read(ddat, attr, channel, val);
> +	case hwmon_energy:
> +		return hwm_energy_read(ddat, attr, val);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -254,19 +345,23 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>  {
>  	struct i915_hwmon *hwmon = i915->hwmon;
>  	struct intel_uncore *uncore = &i915->uncore;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
>  	intel_wakeref_t wakeref;
>  	u32 val_sku_unit;
> +	long energy;
>  
>  	if (IS_DG1(i915) || IS_DG2(i915)) {
>  		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
>  		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
>  		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
>  		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>  	} else {
>  		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>  		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>  		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>  		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>  	}
>  
>  	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -280,9 +375,17 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>  		} else {
>  			val_sku_unit = 0;
>  		}
> -
> -		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>  	}
> +
> +	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +
> +	/*
> +	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> +	 * first value of the energy register read
> +	 */
> +	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
> +		hwm_energy(ddat, &energy);
>  }
>  
>  void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index d7e2e4711792..bd42fb66e297 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -197,7 +197,9 @@
>  
>  #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>  #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_ENERGY_UNIT                      REG_GENMASK(12, 8)
>  #define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +#define PCU_PACKAGE_ENERGY_STATUS              _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>  
>  #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
>  #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
> -- 
> 2.25.1
> 
