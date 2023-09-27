Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3787B083C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 17:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111C510E54D;
	Wed, 27 Sep 2023 15:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7C510E54C;
 Wed, 27 Sep 2023 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695828501; x=1727364501;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tDd3AP0y9h4gx345pHuWXCp6eF5M5RMoj/DR3sdOD/I=;
 b=Y+VS2UDM8G6z55Y4cU+uDgp6Kkow1VF8HDV4MkzJaVg4FMi0aiIA2DGA
 oJFnvb/ULAo2NeXA5cC2LBFHE+/VcAHp0MYwoLLkgWQpjyaO14iG/UWp7
 Hl7zynVurT/lQzu/6qfZ7cVuYUf2Zb0HYadfyPso9+h4ZorLo4JeOKNNm
 wW4nn63N3kaNb+qw6nxfSXhIr0RAZH28W9Vzs7bDP5OKU86L7SQcYDwbS
 YJjZ1PKT6nB40ZGD5KKNaAJLjnEZTS62btiC1MwJo/nybX61HeSLysV/j
 ponqyaHsk2O9X9wohFbHxHCv3b7Ytj4BG21JxyB/Barkp8zkzfQ//gmcF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384649235"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="384649235"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 08:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="725847125"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="725847125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 08:28:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 08:28:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 08:28:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 08:28:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 08:27:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny/3oAKP3Vi61wJDHsTTl7Wp7sO7QKdFOxMqEnwc4q1SHkPP9BJTvS9m0Pv+ZH27s5PfhQ5hXmNw4niMd883IMHiZ0Z6wSf4gyhFIzK70ueZMW8u/ldcVTczPcd4apdJNOgqmJF2uHdUVC1u6s/6hcPyT212/7ZL2vOkqpjMOWJHze2WALPR64x6gLN9y36rV5nXUjDQV0LDFjopzSFgdYbgoLjBgnW52FszdenAEtSu6DrPZJXdnkrW2o7Gu6OOIDZlE/9/9+Ya0Y+M7m7111kRo76EsC5mAbLlLN+jhRt7xmU4cGoLJ2OBy3y7rkSoedHWtjAIKyVfq+THlDV2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGFNynIbCrbQvAnaGkNoWs6P1hOD6zCSK54c9oZ+UsE=;
 b=mOEGwy6FNxQbRmlxfjw8+iKm5b0Opg8OLh+XUl9Nif9fmw1lavHI9ojZJ01mm7qFg+/kee9jo+Koj/OEmMTy1ShKXIQ397yoKQl+/i0tYgu3aEyPrpX0YTnCfgkhgJN7dIY/aoYou0gOFJlhDqxj1xzxd6M8Z0bht/Nj28QvCHT0yQ1RoUrkpH9VgTV3Q452LQzTdkR+FSdkcpgOuhSyfTON3mRUXZDADNHqf4fLHesiaaOhQsBw304kNXKuMwA6Lf8gFIIae7DgWfmQx5GY8FdgPE2MhaWbx+Xdu5OWcg/0sbzRiKkS/b953u0NA1bADU45pJhUYUwOvmKFr3zriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5483.namprd11.prod.outlook.com (2603:10b6:408:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 15:27:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 15:27:54 +0000
Date: Wed, 27 Sep 2023 08:27:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [RFC PATCH] drm/i915/gt: Apply Workaround 22016122933 to all the
 GT's
Message-ID: <20230927152751.GA2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230927151839.319008-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230927151839.319008-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd9420f-1705-4dd1-ae6d-08dbbf6e5212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6LAAPe2ur5IqicJn9+fqi1LH7PYiSfuoIfNVXy2ahZauugg2rjqf40Eo56yY/BE8B+6D/JoZzZfXb0EqsEf1mxgo8u/52e3RwSi1RWRsKdBzyW1vTxU9gz/Sl5G2kSdrq0szcbaj+iKuudirMnncJaWtA72KoWPN83j0dtrQGdXc2364qnLE9eOUIv6kLbUQO5AKSUUyZkZGuFzgcB22JMU94ugMRhyBiM8YbVlpYV6KHmxQFqYrYGc3+WlF1x9neYglVumYIGARqukhxF8THbXEcShQZmQJi4l6ErbNBTp+ri9qoUzKYCTtRi+gdiqXpNbbfKtvedt1LOJZL3d4r1JyfE8k2qFAtcXjfv/xBjMt5ld1CLORDMnRgS80GQSLZGQn5qofLKL8SZSXnbeTACF3lgQlZRwj0MiO/vaFb1WVAhVS6H0fsdhp9W9altA/G0CMQfSXRAkU4BLbp78t0epKSMGLHRqdR2yLRviMOUMRc/CbBovVdA3iOAdwuj2HsBcTZr8zMIZoUof/36Azf7FFG9X+C6KRdR9pH+w0xxz6hv5PubS96eiJYNCGBmR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(66476007)(66556008)(5660300002)(2906002)(66946007)(54906003)(478600001)(6666004)(6486002)(6506007)(6512007)(1076003)(86362001)(41300700001)(26005)(6916009)(316002)(8676002)(4326008)(83380400001)(8936002)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRETUYw0215kLY25dQbz3f15E1ranwoKxKvveMjKCDssvQh4CA5t9n4lWjt1?=
 =?us-ascii?Q?6/A/m16KStM6MapgzV5szbD08n7uz9uDluF0uM11uhlaK6bcWLdHyZwAK/Jp?=
 =?us-ascii?Q?bAIJid6ZRjO1I8JD67m5EJRxJG6N8XnNlbMZff3jN+7GjviNJ+8SDVv7GY4E?=
 =?us-ascii?Q?EvOMuAIrLxWJqGToIfVA28XJVkSSLstXX0DcGXrP+m5BFa08CqnfiBbOUjp8?=
 =?us-ascii?Q?vv6wycaFcOYN8W3IEXkNCBF3Bcks9FD9nDOwUcz7Um5sw4qlrfKdDZrAM9T4?=
 =?us-ascii?Q?XNLq/3bNlR9BI0iWBgCPmt7bBvsY0FE6Dx727+cbMwnu/fzVNd07i55nRR3v?=
 =?us-ascii?Q?lFCYs5vql1A9atdWc6K+X4tOSgi28afcKUrGixfYzh5Zts17FnqaXLM/7KTz?=
 =?us-ascii?Q?jXfW29RJ+JK2iJS1h59Ig1QmH5Bn93k0eEUYrj8zS2AiUjmuSliEsiBFSoZr?=
 =?us-ascii?Q?SGfyYh9HKXbHM9ordoZB1A5sZBELj0IrFI2P7Sm2n0GWJ+lTL2o3wojhRgoY?=
 =?us-ascii?Q?2R/Tj1GiggskG7b39yypbquALzZGh6HUnp9FgrMxEB6MdLACqiSW9qMOitKN?=
 =?us-ascii?Q?PPv/QT2bMpMJUYlkTCrJ6L4T6N/C4Nz3oKJZReWoW4mHoevH/mmzsYy4JvoT?=
 =?us-ascii?Q?MxFEGhFjexbSQAs5NZIqTnwDZPeKr5quU8LuE1/Dp3EW6ThyYt+Fqd6OUiPb?=
 =?us-ascii?Q?JhuK1xQh944EkRKpqtgMCoM8I70O+mLb8NnaEZIYH6vYnWFiGgfaYZeQQDmg?=
 =?us-ascii?Q?AG+jiZBFcMtWgfjG1hNQ3Zwm+MnwV372F/fcyL5OR1+ToCEEFg/Q1GYPGyCe?=
 =?us-ascii?Q?lyn+rXDuw7hS84+79qFVVni9csHtK8h3uOxMf5ivrwH7jptDeWlrtDfOwGnS?=
 =?us-ascii?Q?vjN60zkjj55dttwyVi1RFLzfOEcPgBD+sPS5wioEbRLeNYL9QMpBcAls9sU2?=
 =?us-ascii?Q?crjm2Zjs8oKJjq0q+WjhXwIcFRetV1IFHu+83x2Tlpl286jb9DTJkeBpOQ5z?=
 =?us-ascii?Q?p06/2HxdFcoNanC3VVphJxAHfICkzJ1dnVNwd9RIUz4eM/isITPCBYUk8fm8?=
 =?us-ascii?Q?mfPonTh1Kbjscf+QKVYY9/LhAYYW/MH5Y8huQnrTHehtc8FDZH09DNeKjxWY?=
 =?us-ascii?Q?xniVZHxqvDyBeV3+JFXQ8C1ZNdYcLvgc/xsdnaNwT6z4isTeo5qN/aqTzmBP?=
 =?us-ascii?Q?+hpLifB+/WavZsK4ilFBIpHADtufANpZ/uxDvkrPdaKiMq6cuzedtFK+Ld/6?=
 =?us-ascii?Q?LoG/kpS3s5Hhg38SzG6uiecER2IzL+YXtSITq9LfOXAavFWwyKuPx7aH9Np1?=
 =?us-ascii?Q?tA8NZEkYrazQt4uNdQ/uQp+UO8Eyp/r/eTdzJW9HIk9XgEUM0hRqHkd8nm3a?=
 =?us-ascii?Q?tbbCEUnr5FW4pkIU9c4JZnx4E5J5AXeznqpWlXg88rkF/XIly5bq+vdfmxK2?=
 =?us-ascii?Q?81LmWy6uJhpgVoJ+n41pMFpz30zyWCB/4SyYqTQ3ZQvtPh+W4yZ0Ny1w1li3?=
 =?us-ascii?Q?KDYqLW4sT7/JdYP8PTVEDP1YTzpO3LgQK5c29mIcraeiBkjgxzVd7OugzQC9?=
 =?us-ascii?Q?ZMAeGtRDRtK/xHHzq0RQpkMJrBiix9pn7DKk2BM+rb05PattTlBzkE3VjoRp?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd9420f-1705-4dd1-ae6d-08dbbf6e5212
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:27:54.8521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34dH6qtl6MDE/abMloGFZrtjgc4wPzS8JjOsFDb7cISYUYuDctvsUGH18sfsNBjrcER+tOTEsyFZ4QZs0Sq4JUKysl9loubTsqIanYlnuTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5483
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 05:18:39PM +0200, Andi Shyti wrote:
> From: Nirmoy Das <nirmoy.das@intel.com>
> 
> Commit f1530f912ed8 ("drm/i915/gt: Apply workaround 22016122933
> correctly") adds the workaround only in non media GT's, which is

This is backwards; the workaround is applied only to the media GT and
not to the primary GT.

> GT-0 in case of MTL. It turns out that we need to apply it in
> both the GT's.

The workaround database indicates this should only applied to the media
IP, not to the render IP, and the internal details further confirm that
this is not necessary on the primary GT.  Is there some other workaround
(with a different lineage number) that asks us to do the same thing on
the primary GT?


Matt

> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 93062c35e072..7f7af1d4dc10 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1022,5 +1022,5 @@ enum i915_map_type intel_gt_coherent_map_type(struct intel_gt *gt,
>  
>  bool intel_gt_needs_wa_22016122933(struct intel_gt *gt)
>  {
> -	return MEDIA_VER_FULL(gt->i915) == IP_VER(13, 0) && gt->type == GT_MEDIA;
> +	return MEDIA_VER_FULL(gt->i915) == IP_VER(13, 0);
>  }
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
