Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936A5BD0AD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC9410E671;
	Mon, 19 Sep 2022 15:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE94D10E66F;
 Mon, 19 Sep 2022 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663600882; x=1695136882;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XEL7MmPJvHV6nUsnI3Q8mw8j9m2GmsnGNdNkU1paqGc=;
 b=m+kCZbLXkPXknSbjh9bPbsmAMI/wDBkNjPg/zmfz406OY94h+3kGiGPb
 QV6KKAS3iHWqVuh9QHjTTZLKTN3clNW5y4lvVrKBDDSdrN5PIGsq3pCor
 m0PTkn+NRjEeKG5gs4jiepcMJTEGvP1qckRc61rOu4M778i/7Rav4/74D
 XkdqqNr4cy0PCyAJjLxBjRjSPDPlEkWI87yUmrrVhiXx/Kr9qxjeIeIfI
 wnDg9MLftKwgDnUkEN8ylN7QJdVpw/AW3mpGwZ7/uQxpW/yuEyqzCGgVh
 nGf1LPJ7kxsps8/pKdY55MBwLwgSaG3SjKb/FH9chMwGU+zz6TLaJcKNw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298156375"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="298156375"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 08:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863598708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2022 08:21:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 08:21:22 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 08:21:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 08:21:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 08:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHlFKUe2TtE5B1D4cYpvA5eHbnjHXfgtvuzZV8tW0PSOgnCwZDZDF/0wZMm4BVEn1ndySLpqkuMVdnuYV0dykg/9fz/KBl1jsKo006IWGweLYZItzMvbqn/4F5a3OZX1WX99ENMi7BQ1t6Cg4Ajy9SCQxNhGSV+OMDILHBRDwKrHzn0DlQbXTZK2NwEbJWc3s9v3rvvNniJ7JPW7XVHJnfPwDp441P2wU1zRWX596GtMdNRycJjUNCoGnUpgVQkmu/e1sMk8U0Bca5CVe6CLy4hX0iYAgcl2wwdbaTDdHieLy6xgcWcxlF6O5jq/MYBkUJUC554nfur/YqSEGLAaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObXEx0EmoBkJssT1L6KntbkyBe+z7B7s3+iOKmPqFJw=;
 b=Yzo4NwbWJVJsx1IvkYoodE79WxA6kOjziYOuijY+me3Acf1tHkOglcVud6h/fCqyOVOWQROLAvlxsMImygPT5P/GOWNgrsV9129IOOGm5o2NKId6l4XGzgCi83YGUyX70qeb22nxHU+Y2u10NaI5TQ6EYcKWugbNUKw7eeCkP1atTsNcRzsGhGrldZpbkfdnHf7Vm39qlEAU9TKkMlNXF88k5y8gxjnrfiWCAByv1h5FfkKzofqhhd9JDtbXjZp+ao8Pn9TYsyBvrT51BvmTx9tRVLiW0jphzFHlKDQtoWSppXQp3+rek05hAu81eSPngM4USc/5YPsT7mBUKgPUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9)
 by DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 15:21:19 +0000
Received: from CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9]) by CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9%9]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:21:19 +0000
Message-ID: <d197b905-9851-973a-cf0a-ca2c02c1ec9a@intel.com>
Date: Mon, 19 Sep 2022 08:21:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Document and future-proof
 preemption control policy
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220907212410.22623-1-matthew.d.roper@intel.com>
Content-Language: en-US
From: Wayne Boyer <wayne.boyer@intel.com>
In-Reply-To: <20220907212410.22623-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To CO1PR11MB5108.namprd11.prod.outlook.com
 (2603:10b6:303:92::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5108:EE_|DM4PR11MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 44afa698-f7ec-4246-ec0d-08da9a529a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JSqG0FyYG6cES/xA+bV8VQyHdJPR9KTz65Jy42suz3I6o+IOPJKd7O8DFfzYjHv+JCbPo5GSRSxYr8KrjqvUmzRH817gtWsCq62FP1j65WzN3Qaid2Z0zAi1tYs8QZ58tvk/zFiR2gSke+UGu8aZdHgEQ3zqwcGspADw2aJycIS3dTyGRrWzMgTtCnjA4Mx8ac+hTR96TxQw+NN/huXodiq8Gp0aiQzfAZa+kjGey+T2MserS34mIgANdcpEeOR0+UhjgOmbLaELCssfv2wtZm0WicLwxs+mbmOe/kce+1sb30tsd6jpmsefV2eQG2DTJLyfJj2C6uzYnlU2WQCH9/1hosx0Yp5lO0edQamVDc5EYTo/qvtxNUMgdcqSDvvEqXwgJ98Z6EORo7b+Y42NHCW5Rq1f4gdDnBt4/+557Ir1qFkY8HBJUThVWng9/Y+Z2mz8/lXHvfj2ucmYkhXVTdihIHHhq0tEuiWs30VHaM8v+naO5YOs1pooXBFJCouHQqzieVTLClMUJB6+6lEtWZNpDN3Kc3IjtgcBcURb7c9fqETLa6EsQdllz9O32KGsZ3idEYs+qW5/M3khX8m3UclTqrYj4j1ARefdH2vsgO0MEpgrpxIqEPze8jTv0AnP2d/Y2Xe1G6UPdDg9LxYQKHdgjpCLnp2dd3hgFXwtYd3PJS9yoquRkQQWLnjG4AYnVTTNzJjRd3De4OWTBaj29J4ZYfuo04ZK5bIAG3ddgLKUe7uFEEKwPzz7QWN+14QxQgXSO1G6qMnmb84Wx7Z9FLXzZvRbJ32Nkffvn1MOVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5108.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(41300700001)(8936002)(2906002)(86362001)(66556008)(450100002)(8676002)(36756003)(4326008)(66476007)(66946007)(19627235002)(31686004)(31696002)(83380400001)(6506007)(26005)(6512007)(53546011)(186003)(44832011)(5660300002)(316002)(478600001)(2616005)(38100700002)(82960400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUF2QThoVWRtWVB6dUc3aEpjejJzUXBMNlJXNEJxdkFWWVFYbkdIUk5MVUto?=
 =?utf-8?B?K0Mwbm14c1JteUo2RjZGNUEwVS95K1R6cTdlK2pieFJ5c2RJSmxlQ0d0N2lS?=
 =?utf-8?B?Snh5OHRmNEc4czVWOTQwRUJBY1JGbVhZV2R0Wm1PRis3ekF0aU56Vi9QWTl3?=
 =?utf-8?B?U0lCOUlkMnVhWG9vMm8xQ24yb0NSZUwzVEFTZHhSSTIxSlJhRUw5aFQvMGdE?=
 =?utf-8?B?NDZ0RGRxUlJuYzUzbWFPMGJYVC9wMmloYTVpcEJucVN3WUM3dlZOcDdNOG5l?=
 =?utf-8?B?c0ZSUGt6NHlNWUk2V3BTOTJzK2RFNURwanExWTdZUGZFVUxMaTFYaHB6MmdW?=
 =?utf-8?B?aVlsRFFCRkJ1OXFJV3U0YkFZRVZjNHNJVXE0RTE0WjdlK0RldE0xei9IQWNN?=
 =?utf-8?B?bGYyMkU5RkpNeEd3akp1aVlDQkt2MlFGQlMxQTVHRzVMWFRwS3ppR2N2ck1m?=
 =?utf-8?B?bHFlOWwzb3VuVkljSnRZV0JFcXozS3llOVlKekh6SnlyQ043VjcwVU4yVmFK?=
 =?utf-8?B?TmNpNWFzQ1VyQjFCK0ZSeE53S2lQYVRkWFpudm1oQWFrZXhqV2I1dkxzNEty?=
 =?utf-8?B?L0pkTUdXRnhYbm9WQ2xnT0tWcVRsa1R4T2kwb3N6dGoxd09IZm1aWlhxRGVr?=
 =?utf-8?B?NUZoYXQrdEp5bStPZmpTTG5oekFzVFJBeU51dVpRMVZtSmZDTkJOMUZnUHJQ?=
 =?utf-8?B?cWdrMEswQVhlUlJ6MVJBSVl3clJIcmE0czFCbURqVWFZN29zdS8veVpGZTd4?=
 =?utf-8?B?U2xHWHhxam5Za2IxalhvMS96YlNoYmxWSjAxV2Znb1F2c213ZFhLVTJtcWRT?=
 =?utf-8?B?TE1vRllrNDEwRXZGYXZ3QXdva2ZvbUhHcTcvVFlBV3NnZkNvVlV1NUtvRFl5?=
 =?utf-8?B?c0VkbWdIL0l6S09MTENKaFcwVHFLYy9sQ0V3Mk5MMitWVVlEZktJV1B6dEdE?=
 =?utf-8?B?bnJ1NkRtVVY4YUZhR1QzV1ZMSXFpM0VROGRsV0RPN3Z3OVJHNk1hei96T2pI?=
 =?utf-8?B?N3BiNGpOYjdONTk2UE10MEdvditqNHVEUTE1WnhwM1FYWTNjbTd5OUdyMXdL?=
 =?utf-8?B?WmNQSmo4dW04VDY1Kys2N0c0Q1J0NkFIMHdSdk51YlFkeVpueVRaWmtGYmda?=
 =?utf-8?B?d0R5aW9BV0ZNNjNVelc3bEliMldveVJhU1VxeFg4bnRvQ1ZidkE2VGxSSlBz?=
 =?utf-8?B?emU4eFM3VzVDN0pZSnY1Y3pRV1pMSDVaeERGK0g1YXY5VWIvYUR2K0dUcWtH?=
 =?utf-8?B?eVJQajdBUjdsVVNBL0E5M05ybVFQSVFFWVFiWWhvZWlaWjBHM1dRdXl4eWlO?=
 =?utf-8?B?bUl6WFI3UDBLZ1ZPZTA1cm5pdTlVdCszaUVScExrRHFCVzZKWkhDeWxEeTU2?=
 =?utf-8?B?elNSSE1GVEI2K2g3eTluYmdRWWhpZkZHM3loZXZrQ041V0ZzMERjSVVwb0E1?=
 =?utf-8?B?Z0FxcXN3WUkzU2xFUERXRW5sVUYySTdLUis4QWVUOG96ZERQb0VJWGlFbHVi?=
 =?utf-8?B?ZEphVzVxVnVXcndnckh2SzM3NXVuREttTjMrSGlmeHI4Tjc4MXJNZEY3dVB4?=
 =?utf-8?B?UkUwUndkaXBFbVRCTlB5VmNRVzR1TzJJZi9EY2dqTEd0cFlDTnhCNG1DSzZj?=
 =?utf-8?B?RlJvZ09aZlFyTXphS3lnbVpwOEZDQkhzUDkzVzNHb3pWc20zbFRnWlRndTF5?=
 =?utf-8?B?cnIvblp3TVpTTzU3R054eFNhMWdBZFR5K3pWMFlGTmpuQmdBYUVCaXhzSEYz?=
 =?utf-8?B?SzFyNlp4VTl3OEp5ZFVibjlMalVKMU0wUnJxb0pGbWpwZ2dReVRpZzFMNjhu?=
 =?utf-8?B?VVpGbDlNS2pOOVBjYklvU1JjNVNXMFpwd28vaXlURFJuakNlcmw2U2RFd3ZE?=
 =?utf-8?B?bUdmQUx4ak5xYUlKYVNpNkF1UktvZmhIbHc4SUlRMmxkS2lqQVozbm5QZHI0?=
 =?utf-8?B?endtZ0dEK3hYOGlxQzhYcG1ld3k1MXRKZWlGZHVnekVVUmR4SEFja0lIWVE2?=
 =?utf-8?B?VytMb2x2Y0VWdzBhWEFtR0Vna2REWk9uT0p6cmd5TzYvOFhsMUo3R0wyYVVU?=
 =?utf-8?B?SlJpSDVUYlc5TXVObHBYUm9lNTZ2Z2pUWUVnVGZBeTJqVVR4NjQ1VFo2djVS?=
 =?utf-8?B?Q3MrMG9pRDdqQmxwOU10TUVzWTZDRVhXWVhGbEltUWUyMWxISy9xYk92cTBt?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44afa698-f7ec-4246-ec0d-08da9a529a48
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5108.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:21:19.4687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl8ynu9hDhNHITIPUpSUXtN3dSUlalfm16NKyA280suI3l7zpJKIqP/uXrW4KPcgP6egM20tBuXSLyIVySa0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/7/22 2:24 PM, Matt Roper wrote:
> Intel hardware allows some preemption settings to be controlled either
> by the kernel-mode driver exclusively, or placed under control of the
> user-mode drivers; on Linux we always select the userspace control
> option.  The various registers involved in this are not documented very
> clearly; let's add some clarifying comments to help explain how this all
> works and provide some history on why our Linux drivers take the
> approach they do (which I believe differs from the path taken by certain
> other operating systems' drivers).
> 
> While we're at it, let's also remove the graphics version 12 upper bound
> on this programming.  As described, we don't have any plans to move away
> from UMD control of preemption settings on future platforms, and there's
> currently no reason to believe that the hardware will fundamentally
> change how these registers and settings work after version 12.
> 
> Bspec: 45921, 45858, 45863
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Wayne Boyer <wayne.boyer@intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 58 +++++++++++++++++++--
>   1 file changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 6d2003d598e6..3e5a41378e81 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2389,12 +2389,64 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   			     FF_DOP_CLOCK_GATE_DISABLE);
>   	}
>   
> -	if (IS_GRAPHICS_VER(i915, 9, 12)) {
> -		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
> +	/*
> +	 * Intel platforms that support fine-grained preemption (i.e., gen9 and
> +	 * beyond) allow the kernel-mode driver to choose between two different
> +	 * options for controlling preemption granularity and behavior.
> +	 *
> +	 * Option 1 (hardware default):
> +	 *   Preemption settings are controlled in a global manner via
> +	 *   kernel-only register CS_DEBUG_MODE1 (0x20EC).  Any granularity
> +	 *   and settings chosen by the kernel-mode driver will apply to all
> +	 *   userspace clients.
> +	 *
> +	 * Option 2:
> +	 *   Preemption settings are controlled on a per-context basis via
> +	 *   register CS_CHICKEN1 (0x2580).  CS_CHICKEN1 is saved/restored on
> +	 *   context switch and is writable by userspace (e.g., via
> +	 *   MI_LOAD_REGISTER_IMMEDIATE instructions placed in a batch buffer)
> +	 *   which allows different userspace drivers/clients to select
> +	 *   different settings, or to change those settings on the fly in
> +	 *   response to runtime needs.  This option was known by name
> +	 *   "FtrPerCtxtPreemptionGranularityControl" at one time, although
> +	 *   that name is somewhat misleading as other non-granularity
> +	 *   preemption settings are also impacted by this decision.
> +	 *
> +	 * On Linux, our policy has always been to let userspace drivers
> +	 * control preemption granularity/settings (Option 2).  This was
> +	 * originally mandatory on gen9 to prevent ABI breakage (old gen9
> +	 * userspace developed before object-level preemption was enabled would
> +	 * not behave well if i915 were to go with Option 1 and enable that
> +	 * preemption in a global manner).  On gen9 each context would have
> +	 * object-level preemption disabled by default (see
> +	 * WaDisable3DMidCmdPreemption in gen9_ctx_workarounds_init), but
> +	 * userspace drivers could opt-in to object-level preemption as they
> +	 * saw fit.  For post-gen9 platforms, we continue to utilize Option 2;
> +	 * even though it is no longer necessary for ABI compatibility when
> +	 * enabling a new platform, it does ensure that userspace will be able
> +	 * to implement any workarounds that show up requiring temporary
> +	 * adjustments to preemption behavior at runtime.
> +	 *
> +	 * Notes/Workarounds:
> +	 *  - Wa_14015141709:  On DG2 and early steppings of MTL,
> +	 *      CS_CHICKEN1[0] does not disable object-level preemption as
> +	 *      it is supposed to (nor does CS_DEBUG_MODE1[0] if we had been
> +	 *      using Option 1).  Effectively this means userspace is unable
> +	 *      to disable object-level preemption on these platforms/steppings
> +	 *      despite the setting here.
> +	 *
> +	 *  - Wa_16013994831:  May require that userspace program
> +	 *      CS_CHICKEN1[10] when certain runtime conditions are true.
> +	 *      Userspace requires Option 2 to be in effect for their update of
> +	 *      CS_CHICKEN1[10] to be effective.
> +	 *
> +	 * Other workarounds may appear in the future that will also require
> +	 * Option 2 behavior to allow proper userspace implementation.
> +	 */
> +	if (GRAPHICS_VER(i915) >= 9)
>   		wa_masked_en(wal,
>   			     GEN7_FF_SLICE_CS_CHICKEN1,
>   			     GEN9_FFSC_PERCTX_PREEMPT_CTRL);
> -	}
>   
>   	if (IS_SKYLAKE(i915) ||
>   	    IS_KABYLAKE(i915) ||

-- 
--
Wayne Boyer
Graphics Software Engineer
VTT-OSGC Platform Enablement
