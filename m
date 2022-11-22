Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878E634432
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF410E440;
	Tue, 22 Nov 2022 19:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C0210E440;
 Tue, 22 Nov 2022 19:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669143694; x=1700679694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lU6LWvThFJrbPR8APeED+WKBumaKmGPN/9CTHm8sqGU=;
 b=DCemErZp4I/EHSJetHauzw9i68w4VP3bPM8WlO3plj3nloURXxlyPZuI
 B75+1j5AYhEetjZvO8NxRF1V6QJbtpK+3TV4mZ7nxnoJNJ9HvuLwoRhbY
 WeWdiAoFUotDuH1qm6sC9c0PWze+Bn9V28684+XeMrVO6vfKi/F86z8jX
 FFuYvJSdekBdUzjKwG4qedBF+mSLX3mbQOc0yNF2rKjQwFI1qbSYqSyMk
 rBsxsdetrAYQ4qhTrhvMI74r4QPoYuUPggzoUxAVG7vmObrRctujp50ya
 cbqlcSKABHDR/Ez8O3DRRDMiCDByAwkIYsB8G+RpgCiiroJHSv73q4TEt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="293599636"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="293599636"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 11:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="592244266"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="592244266"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 22 Nov 2022 11:01:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 11:01:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 11:01:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 11:01:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 11:01:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBbfo31qHCYkxbdCf8JrJPHCca0G43j3VYaeSTV6Jzg/sZ95ikQ/4VavMBJFKM3BWF/I8HYhHCQfZgJ2WkK+XqHpza4KHCvZTLXRL/uQzkbxUpLscgjvaLfmsW+GYSQVpjURhdfhAOmHw+eqrBOokcDzOqym9HEhP+n2XXlnJprKkhLzfqC5v0f3ADc+q6tly0cl5z542HHALggh+fPorhwT5VsS6phQjezh/Jt+jPWiEm3hJUUYNDbbSeubsxavTX8X5yZEX/2R3R6u6NttjK/h5ic3UttwAvVRex30g0r9OucTVaI7l+qZhih0nJMSFC5vAMAvniq5TC2mltOMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+eFy6yn2yfWBcka97HgJaH0XEfdqido07wwm+nefD8=;
 b=Xq3hgjZHkjWWqQAAk/WSyCl0jM0U0hveg96f9XA+chrBBJ+6N7U01LP6/VYrrc2hnbc6dibk/ox1qbJq9jnGtNNs3apvkBpvL9W61US62Vmng+XHfTaNn0Q0w8tiihEOaAxSX8+1dB1HfVCyQQx4qfFwNUlHeobic6i2FpHxEoScbpDTUAF5RBhtx9blWBPK77J4p75LWcHRgvKDR144JBHbnHrsRBzquEoKS+sku824OOBfvUQs+xfpVXQxUuiVuZEGIjecF/AMcF0us9XDcHm754KevYrzv+Mxuik9L6ujPVrwRfCKxZVEx/CvHK5xiC489R3UUSSYJZ2qm4HvvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 19:01:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 19:01:30 +0000
Date: Tue, 22 Nov 2022 14:01:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915/gsc: GSC firmware loading
Message-ID: <Y30chrH244Go7FO2@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221121231617.1110329-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4faba8-b67c-4e90-8eff-08daccbbf6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WiJ3s1gFRyGDw7T3JrgmPF5ESlZ1aEKLCoVr2FWP1zFdGyXe+Txw+kon6HkG3argu88RfoAs3NJNeJldxsTgqnLliG0ZpFUMLUrrMEUynhcZ/hSoxsqlhcWqg+DzH8nEpF0q95i9FGzq28b2W0JHz3uc2GkbjOK9sqGNlekSxOAqflmxTL1JUmnR81op3IptHqyAVBlaOM2bXFGHS3AAAbwOCdIxFr6ChWDWX2AemxSxIKUGWtilR2M8w2sZgjfNiW50T7GftQfDWHcVVY7OmdAdXefjL/gEYE7iWMGhS8jf2KtghkSAFRv9w06bC9EW89zXGNswYhZpqa1dHuBQHMLVl9yBR7zqiG3WzwRh0PRl5CtOvmJiILxxe8gusY6d3mK96L2YNANcxNZtVGWnd7UiurZpVgHir35/pd+r51OzLcwOzGNQ6dEW3nUarDc8OsR8goApBjuPelX+zFeeCIR8T4tIcXem8i0dWv0bcsCmqKpJ3XOUko5SVtdq9JAEDnSXYuTRjXyykpH/ZKJxjM2GxjoY3VyJCaej7rpjPXAiXXguDsnut5U/luGfmS0FImfybLiXtTmfGDzlkYawycw55WJxxFQoJZq8qVcbpwhXP7+EmIwUqfpODwqdLLBCuAKunBJoDE1QYE9Eq+dSdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199015)(8676002)(36756003)(8936002)(6506007)(6512007)(26005)(66946007)(6636002)(4326008)(450100002)(66556008)(478600001)(6666004)(66476007)(316002)(5660300002)(38100700002)(37006003)(6862004)(82960400001)(86362001)(83380400001)(44832011)(6486002)(30864003)(41300700001)(2616005)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HFoC66l4west1Ft7GZealsGZR0Km6JpkmoUL7mAVVLUdg1VH6ohju4gEpf?=
 =?iso-8859-1?Q?dRtnboT3YfXi2izvb8OCrUdW4D/XMfuYIHagEMePziadMLmzXcw7PCfRvB?=
 =?iso-8859-1?Q?c+n/wCR26wbblFvIgMo5pNJZgp2AbSfDK5uB02zULuY5xhgpoDwD+8YEbT?=
 =?iso-8859-1?Q?MNn476v7bthZGs15Qn3VpZiSr0p32urIXyuX3sine+sgN5h+vYxjWEw40c?=
 =?iso-8859-1?Q?7yH/zMa50aNySl3jsuwCSeAYXJU8l07wrH+mpk/jPFf0OcUQO23lS1Bpx1?=
 =?iso-8859-1?Q?ngJQ1Cbrs0LCB9J+gsgWWwQwV+jHiZXlWa+SWBuLGXmuN38kAZNSHzmOsD?=
 =?iso-8859-1?Q?GuAgPaacmqZJLXj0a6+gK/Zfnn1EzFuyHOkRLckaYT/IIDkB4yDO4jWsZs?=
 =?iso-8859-1?Q?/dPfa+m0P/S3sMJ9O4ngHzIaEY2AlsA19HG9R2SDbXLvn+TFgGfodVoWHx?=
 =?iso-8859-1?Q?oJaLsXENcS6M518jW9ciq9bypbzRUjRsNzURmw7PhhRMFinIck15as2q8f?=
 =?iso-8859-1?Q?5M5RWIj+vSnqN+ZXZB9jj8P7Qr4k/gZXukaViKRhZ7tqMqNMdk2TyWIqjP?=
 =?iso-8859-1?Q?aAphssdlyfoN7M6o9NGLKyTlZmAkZbWWdDpX4yl5QtPoEbdOAWOnCkZhFq?=
 =?iso-8859-1?Q?Vg4lOfiLwtMbJybhZZx3iXNxObjdrOPHNbeqBFvhbparV1y+W/2rv5FqMh?=
 =?iso-8859-1?Q?nTZsTcwGJQ5Lohtwk5OGQ7TM7K0iTEe7uw7cxOk1AgrqrCmbrDkMtLNsPE?=
 =?iso-8859-1?Q?6ULeY1tdfn/3485AI/oKsRKeCIuF2KLezIqLazpBUIaODS+AlpqgMaqaYQ?=
 =?iso-8859-1?Q?kzMLy42UwbWJuNXR8vB8lo+QoPM6eb+vFq71kqp+sUaJpsZQr2puATImRQ?=
 =?iso-8859-1?Q?zDrMI7rTfH4tW4WvY0RIOSSdjGDTCDhuuDkC8rvODAfzjNhD2/AAEn/iZ3?=
 =?iso-8859-1?Q?sXJIrfbR/duMXKQpzSPHo2b3vQ1O5db/A24WvU1kgVdC1GJmC1eByluTmI?=
 =?iso-8859-1?Q?I4hGpkG7BvAY9NzbEWJ/Xm8aFz7n2GAewNFhQqQeb8W5xJIks++BKzySCx?=
 =?iso-8859-1?Q?NrRi6DtkvItZTSysagToEweG0wBKYhlyIiXuHgSZnI5/PnGZubQxc4dEc2?=
 =?iso-8859-1?Q?Dq5YwyEgIyKyDrAAjozyuX4tGtgafMakDWfI40YcAF+SwUZEr5a5Sh9JS/?=
 =?iso-8859-1?Q?A+OIKtRXWgXo+Y7hK0GYe+2z2Ij14QugahrL7JkyMBXhJgBTzbtwyEBHPf?=
 =?iso-8859-1?Q?8LvAYttC3KoUEOLsXHKnPPOypKsBSagQhm5d1nQNFUXkTHn+rr6GOcYQkg?=
 =?iso-8859-1?Q?RpUgALXUOsVxhp7t/fMfOIoB7+RwUMNawIddjZL0e2dNtTyU7aBy9UW8A1?=
 =?iso-8859-1?Q?QFO5ktam4n38z+yKuieRoR8Ivaezw7x5ZZpBqENwZt7pbZQ/NjIaspbyBv?=
 =?iso-8859-1?Q?VOFhjrGp2HQC5ufbh+ucnLwz0+oA2oXIL/Eb6RDt2KonRFCd2kxrC4e24K?=
 =?iso-8859-1?Q?nKJAYO1j9BO31yDVNS+dyL6sXIR1WmiyBvj8sJOQ0vZoTpiVPT/x52BQHP?=
 =?iso-8859-1?Q?BvALbYMZfXz+555fiDTOOAv6T2UCE/9h1dEtkHDpTv1q4gxz9mjcNf3Cpd?=
 =?iso-8859-1?Q?IS8PBOvVpBtiMXIYe8FLT2KD14N+83ojsh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4faba8-b67c-4e90-8eff-08daccbbf6f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 19:01:30.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEfNH+o3W2Qq2dEVZOtWnWEYa76GsAbrLip27bRY94kqzvtPl0zOE5cgv01aYDp4u7IvJOXzgsTcgBfBbDzbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 03:16:14PM -0800, Daniele Ceraolo Spurio wrote:
> GSC FW is loaded by submitting a dedicated command via the GSC engine.
> The memory area used for loading the FW is then re-purposed as local
> memory for the GSC itself, so we use a separate allocation instead of
> using the one where we keep the firmware stored for reload.
> 
> The GSC is not reset as part of GT reset, so we only need to load it on
> first boot and S3/S4 exit.
> 
> Note that the GSC load takes a lot of time (up to a few hundred ms).
> This patch loads it serially as part of driver init/resume, but, given
> that GSC is only required for PM and content-protection features
> (media C6, PXP, HDCP), we could move the load to a worker thread to unblock
> non-CP userspace submissions earlier. This will be done as a follow up
> step, because there are extra init steps required to actually make use of
> the GSC (including a mei component) and it will be cleaner (and easier to
> review) if we implement the async load once all the pieces we need for GSC
> to work are in place. A TODO has been added to the code to mark this
> intention.
> 
> Bspec: 63347, 65346
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                |   1 +
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c       |  14 +-
>  drivers/gpu/drm/i915/gt/intel_engine.h       |   2 +
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   7 +
>  drivers/gpu/drm/i915/gt/intel_gt.c           |  11 ++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c    | 186 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h    |  13 ++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c    |  35 +++-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h    |   7 +
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c        |  15 ++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.h        |   2 +
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     |  20 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h     |   1 +
>  13 files changed, 307 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 92d37cf71e16..1d45a6f451fa 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -206,6 +206,7 @@ i915-y += gt/uc/intel_uc.o \
>  	  gt/uc/intel_huc.o \
>  	  gt/uc/intel_huc_debugfs.o \
>  	  gt/uc/intel_huc_fw.o \
> +	  gt/uc/intel_gsc_fw.o \
>  	  gt/uc/intel_gsc_uc.o
>  
>  # graphics system controller (GSC) support
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index 0d812f4d787d..f77eb4009aba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -232,10 +232,22 @@ void i915_gem_resume(struct drm_i915_private *i915)
>  	 * guarantee that the context image is complete. So let's just reset
>  	 * it and start again.
>  	 */
> -	for_each_gt(gt, i915, i)
> +	for_each_gt(gt, i915, i) {
>  		if (intel_gt_resume(gt))
>  			goto err_wedged;
>  
> +		/*
> +		 * TODO: this is a long operation (up to ~200ms) and we don't
> +		 * need to complete it before driver load/resume is done, so it
> +		 * should be handled in a separate thread to unlock userspace
> +		 * submission. However, there are a couple of other pieces that
> +		 * are required for full GSC support that will complicate things
> +		 * a bit, and it is easier to move everything to a worker at the
> +		 * same time, so keep it here for now.
> +		 */
> +		intel_uc_init_hw_late(&gt->uc);
> +	}
> +
>  	ret = lmem_restore(i915, I915_TTM_BACKUP_ALLOW_GPU);
>  	GEM_WARN_ON(ret);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index cbc8b857d5f7..0e24af5efee9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -172,6 +172,8 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
>  #define I915_GEM_HWS_MIGRATE		(0x42 * sizeof(u32))
>  #define I915_GEM_HWS_PXP		0x60
>  #define I915_GEM_HWS_PXP_ADDR		(I915_GEM_HWS_PXP * sizeof(u32))
> +#define I915_GEM_HWS_GSC		0x62
> +#define I915_GEM_HWS_GSC_ADDR		(I915_GEM_HWS_GSC * sizeof(u32))
>  #define I915_GEM_HWS_SCRATCH		0x80
>  
>  #define I915_HWS_CSB_BUF0_INDEX		0x10
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index f50ea92910d9..49ebda141266 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -21,6 +21,7 @@
>  #define INSTR_CLIENT_SHIFT      29
>  #define   INSTR_MI_CLIENT       0x0
>  #define   INSTR_BC_CLIENT       0x2
> +#define   INSTR_GSC_CLIENT      0x2 /* MTL+ */
>  #define   INSTR_RC_CLIENT       0x3
>  #define INSTR_SUBCLIENT_SHIFT   27
>  #define INSTR_SUBCLIENT_MASK    0x18000000
> @@ -432,6 +433,12 @@
>  #define COLOR_BLT     ((0x2<<29)|(0x40<<22))
>  #define SRC_COPY_BLT  ((0x2<<29)|(0x43<<22))
>  
> +#define GSC_INSTR(opcode, data, flags) \
> +	(__INSTR(INSTR_GSC_CLIENT) | (opcode) << 22 | (data) << 9 | (flags))
> +
> +#define GSC_FW_LOAD GSC_INSTR(1, 0, 2)
> +#define   HECI1_FW_LIMIT_VALID (1<<31)
> +
>  /*
>   * Used to convert any address to canonical form.
>   * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index b5ad9caa5537..a12e74a1fe5d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -750,6 +750,17 @@ int intel_gt_init(struct intel_gt *gt)
>  
>  	intel_pxp_init(&gt->pxp);
>  
> +	/*
> +	 * TODO: this is a long operation (up to ~200ms) and we don't need
> +	 * to complete it before driver load/resume is done, so it should
> +	 * be handled in a separate thread to unlock userspace submission.

shouldn't we already add an workqueue for this?

> +	 * However, there are a couple of other pieces that are required
> +	 * for full GSC support that will complicate things a bit, and it
> +	 * is easier to move everything to a worker at the same time, so
> +	 * keep it here for now.
> +	 */
> +	intel_uc_init_hw_late(&gt->uc);
> +
>  	goto out_fw;
>  err_gt:
>  	__intel_gt_disable(gt);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> new file mode 100644
> index 000000000000..510fb47193ec
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include "gt/intel_engine_pm.h"
> +#include "gt/intel_gpu_commands.h"
> +#include "gt/intel_gt.h"
> +#include "gt/intel_ring.h"
> +#include "intel_gsc_fw.h"
> +
> +#define GSC_FW_STATUS_REG			_MMIO(0x116C40)
> +#define GSC_FW_CURRENT_STATE			GENMASK(3, 0)
> +#define   GSC_FW_CURRENT_STATE_RESET		0
> +#define GSC_FW_INIT_COMPLETE_BIT		BIT(9)

let's prefer the REG_GENMASK AND REG_BIT as documented in i915_reg.h

> +
> +static bool gsc_is_in_reset(struct intel_uncore *uncore)
> +{
> +	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +
> +	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
> +	       GSC_FW_CURRENT_STATE_RESET;
> +}
> +
> +static bool gsc_init_done(struct intel_uncore *uncore)
> +{
> +	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +
> +	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
> +}
> +
> +static int emit_gsc_fw_load(struct i915_request *rq, struct intel_gsc_uc *gsc)
> +{
> +	u32 offset = i915_ggtt_offset(gsc->local);
> +	u32 *cs;
> +
> +	cs = intel_ring_begin(rq, 4);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	*cs++ = GSC_FW_LOAD;
> +	*cs++ = lower_32_bits(offset);
> +	*cs++ = upper_32_bits(offset);
> +	*cs++ = (gsc->local->size / SZ_4K) | HECI1_FW_LIMIT_VALID;
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
> +static int gsc_fw_load(struct intel_gsc_uc *gsc)
> +{
> +	struct intel_context *ce = gsc->ce;
> +	struct i915_request *rq;
> +	int err;
> +
> +	if (!ce)
> +		return -ENODEV;
> +
> +	rq = i915_request_create(ce);
> +	if (IS_ERR(rq))
> +		return PTR_ERR(rq);
> +
> +	if (ce->engine->emit_init_breadcrumb) {
> +		err = ce->engine->emit_init_breadcrumb(rq);
> +		if (err)
> +			goto out_rq;
> +	}
> +
> +	err = emit_gsc_fw_load(rq, gsc);
> +	if (err)
> +		goto out_rq;
> +
> +	err = ce->engine->emit_flush(rq, 0);
> +
> +out_rq:
> +	i915_request_get(rq);
> +
> +	if (unlikely(err))
> +		i915_request_set_error_once(rq, err);
> +
> +	i915_request_add(rq);
> +
> +	if (!err && i915_request_wait(rq, 0, msecs_to_jiffies(500)) < 0)
> +		err = -ETIME;
> +
> +	i915_request_put(rq);
> +
> +	if (err)
> +		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
> +			"Request submission for GSC load failed (%d)\n",
> +			err);
> +
> +	return err;
> +}
> +
> +static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
> +{
> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct drm_i915_gem_object *obj;
> +	void *src, *dst;
> +
> +	if (!gsc->local)
> +		return -ENODEV;
> +
> +	obj = gsc->local->obj;
> +
> +	if (obj->base.size < gsc->fw.size)
> +		return -ENOSPC;
> +
> +	dst = i915_gem_object_pin_map_unlocked(obj,
> +					       i915_coherent_map_type(i915, obj, true));
> +	if (IS_ERR(dst))
> +		return PTR_ERR(dst);
> +
> +	src = i915_gem_object_pin_map_unlocked(gsc->fw.obj,
> +					       i915_coherent_map_type(i915, gsc->fw.obj, true));
> +	if (IS_ERR(src)) {
> +		i915_gem_object_unpin_map(obj);
> +		return PTR_ERR(src);
> +	}
> +
> +	memset(dst, 0, obj->base.size);
> +	memcpy(dst, src, gsc->fw.size);
> +
> +	i915_gem_object_unpin_map(gsc->fw.obj);
> +	i915_gem_object_unpin_map(obj);
> +
> +	return 0;
> +}
> +
> +static int gsc_fw_wait(struct intel_gt *gt)
> +{
> +	return intel_wait_for_register(gt->uncore,
> +				       GSC_FW_STATUS_REG,
> +				       GSC_FW_INIT_COMPLETE_BIT,
> +				       GSC_FW_INIT_COMPLETE_BIT,
> +				       500);
> +}
> +
> +int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
> +{
> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
> +	struct intel_uc_fw *gsc_fw = &gsc->fw;
> +	int err;
> +
> +	/* check current fw status */
> +	if (gsc_init_done(gt->uncore)) {
> +		if (GEM_WARN_ON(!intel_uc_fw_is_loaded(gsc_fw)))
> +			intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
> +		return 0;
> +	}
> +
> +	if (!intel_uc_fw_is_loadable(gsc_fw))
> +		return -ENOEXEC;
> +
> +	/* FW blob is ok, so clean the status */
> +	intel_uc_fw_sanitize(&gsc->fw);
> +
> +	if (!gsc_is_in_reset(gt->uncore))
> +		return -EIO;
> +
> +	err = gsc_fw_load_prepare(gsc);
> +	if (err)
> +		goto fail;
> +
> +	err = gsc_fw_load(gsc);
> +	if (err)
> +		goto fail;
> +
> +	err = gsc_fw_wait(gt);
> +	if (err)
> +		goto fail;
> +
> +	/* FW is not fully operational until we enable SW proxy */
> +	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
> +
> +	drm_info(&gt->i915->drm, "Loaded GSC firmware %s\n",
> +		 gsc_fw->file_selected.path);
> +
> +	return 0;
> +
> +fail:
> +	return intel_uc_fw_mark_load_failed(gsc_fw, err);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> new file mode 100644
> index 000000000000..d714e5e69a6d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GSC_FW_H_
> +#define _INTEL_GSC_FW_H_
> +
> +struct intel_gsc_uc;
> +
> +int intel_gsc_fw_upload(struct intel_gsc_uc *gsc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index 65cbf1ce9fa1..dd985a0f0613 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -45,17 +45,46 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
>  
>  int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
>  {
> -	struct drm_i915_private *i915 = gsc_uc_to_gt(gsc)->i915;
> +	static struct lock_class_key gsc_lock;
> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_engine_cs *engine = gt->engine[GSC0];
> +	struct intel_context *ce;
> +	struct i915_vma *vma;
>  	int err;
>  
>  	err = intel_uc_fw_init(&gsc->fw);
>  	if (err)
>  		goto out;
>  
> +	vma = intel_guc_allocate_vma(&gt->uc.guc, SZ_8M);
> +	if (IS_ERR(vma)) {
> +		err = PTR_ERR(vma);
> +		goto out_fw;
> +	}
> +
> +	gsc->local = vma;
> +
> +	ce = intel_engine_create_pinned_context(engine, engine->gt->vm, SZ_4K,
> +						I915_GEM_HWS_GSC_ADDR,
> +						&gsc_lock, "gsc_context");
> +	if (IS_ERR(ce)) {
> +		drm_err(&gt->i915->drm,
> +			"failed to create GSC CS ctx for FW communication\n");
> +		err =  PTR_ERR(ce);
> +		goto out_vma;
> +	}
> +
> +	gsc->ce = ce;
> +
>  	intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOADABLE);
>  
>  	return 0;
>  
> +out_vma:
> +	i915_vma_unpin_and_release(&gsc->local, 0);
> +out_fw:
> +	intel_uc_fw_fini(&gsc->fw);
>  out:
>  	i915_probe_error(i915, "failed with %d\n", err);
>  	return err;
> @@ -66,5 +95,9 @@ void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
>  	if (!intel_uc_fw_is_loadable(&gsc->fw))
>  		return;
>  
> +	if (gsc->ce)
> +		intel_engine_destroy_pinned_context(fetch_and_zero(&gsc->ce));
> +
> +	i915_vma_unpin_and_release(&gsc->local, 0);
>  	intel_uc_fw_fini(&gsc->fw);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
> index ea2b1c0713b8..6fdb54243372 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
> @@ -8,9 +8,16 @@
>  
>  #include "intel_uc_fw.h"
>  
> +struct i915_vma;
> +struct intel_context;
> +
>  struct intel_gsc_uc {
>  	/* Generic uC firmware management */
>  	struct intel_uc_fw fw;
> +
> +	/* GSC-specific additions */
> +	struct i915_vma *local; /* private memory for GSC usage */
> +	struct intel_context *ce; /* for submission to GSC FW via GSC engine */
>  };
>  
>  void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 622935770aa1..b2c2512a3391 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -7,6 +7,7 @@
>  
>  #include "gt/intel_gt.h"
>  #include "gt/intel_reset.h"
> +#include "intel_gsc_fw.h"
>  #include "intel_gsc_uc.h"
>  #include "intel_guc.h"
>  #include "intel_guc_ads.h"
> @@ -593,6 +594,19 @@ static void __uc_fini_hw(struct intel_uc *uc)
>  	__uc_sanitize(uc);
>  }
>  
> +/*
> + * Firmwares loaded via the GSC engine require the submission back-end to have
> + * been initialized, so can only be loaded late in the probe/resume process.
> + * TODO move to worker
> + */
> +static int __uc_init_hw_late(struct intel_uc *uc)
> +{
> +	if (!intel_uc_uses_gsc_uc(uc))
> +		return 0;
> +
> +	return intel_gsc_fw_upload(&uc->gsc);
> +}
> +
>  /**
>   * intel_uc_reset_prepare - Prepare for reset
>   * @uc: the intel_uc structure
> @@ -751,5 +765,6 @@ static const struct intel_uc_ops uc_ops_on = {
>  	.fini = __uc_fini,
>  
>  	.init_hw = __uc_init_hw,
> +	.init_hw_late = __uc_init_hw_late,
>  	.fini_hw = __uc_fini_hw,
>  };
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 5d0f1bcc381e..39993ba6c24e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -23,6 +23,7 @@ struct intel_uc_ops {
>  	int (*init)(struct intel_uc *uc);
>  	void (*fini)(struct intel_uc *uc);
>  	int (*init_hw)(struct intel_uc *uc);
> +	int (*init_hw_late)(struct intel_uc *uc);
>  	void (*fini_hw)(struct intel_uc *uc);
>  };
>  
> @@ -112,6 +113,7 @@ intel_uc_ops_function(cleanup_firmwares, fini_fw, void, );
>  intel_uc_ops_function(init, init, int, 0);
>  intel_uc_ops_function(fini, fini, void, );
>  intel_uc_ops_function(init_hw, init_hw, int, 0);
> +intel_uc_ops_function(init_hw_late, init_hw_late, int, 0);
>  intel_uc_ops_function(fini_hw, fini_hw, void, );
>  #undef intel_uc_ops_function
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 3df52fd59edc..dcec115209de 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -836,6 +836,20 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>  	return ret;
>  }
>  
> +int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err)
> +{
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +
> +	GEM_BUG_ON(!intel_uc_fw_is_loadable(uc_fw));
> +
> +	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> +			 err);
> +	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
> +
> +	return err;
> +}
> +
>  /**
>   * intel_uc_fw_upload - load uC firmware using custom loader
>   * @uc_fw: uC firmware
> @@ -872,11 +886,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>  	return 0;
>  
>  fail:
> -	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			 err);
> -	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
> -	return err;
> +	return intel_uc_fw_mark_load_failed(uc_fw, err);
>  }
>  
>  static inline bool uc_fw_need_rsa_in_memory(struct intel_uc_fw *uc_fw)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 5d2a8965a592..05760fb85fff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -290,6 +290,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>  int intel_uc_fw_init(struct intel_uc_fw *uc_fw);
>  void intel_uc_fw_fini(struct intel_uc_fw *uc_fw);
>  size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len);
> +int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err);
>  void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.37.3
> 
