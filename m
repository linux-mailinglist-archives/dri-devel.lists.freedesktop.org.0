Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4E5B2375
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5155010EB52;
	Thu,  8 Sep 2022 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2F810EB4F;
 Thu,  8 Sep 2022 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662653956; x=1694189956;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nvJLLczrwnxH3pdg28NNHdXVG0Vs+2B7XiaZq+EAyqk=;
 b=nBSpUg1L7ZpFiJ5Xob8T7CTno8LEsvN2R0rJqMD8SCAjm3Vvu0rwMrDC
 6WgHR8zUI0EjrfE3h9hYh1oKGntd2VBDIwOMkP5a9bPtK2XVYzCU8/LuX
 pEPdZYSqQKYHgMolWAh01FxN1u8tHqmIBIzHaayIx1YrDMGhmWVEooBcR
 X1p0J5ywaL074bbHem1KCOLKG53Ta+k0EqZkTtx+MdbZ6hUPoPAur1lRc
 dx4U98Dn0SmjhKgVnhtc9bSldkmNCYZE4wuT9modm1QgKy5j6WeNhUqSC
 EEyRsRa6HDUGXfO37rznREuI/bprJd4UKzPRhdRZcTQ+pyaTQrADg0yp4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361203038"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="361203038"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 09:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="592241863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 09:19:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 09:19:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 09:19:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 09:19:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyDCMeTNXKqSgqz0qpHZectO89JeqfmDnoteT/Qfb/rYIaH9JcepoZG8HOxOuCp76/DVstVH7Hq4konl/lih+KZXezhryxNDwX7wtdDxtaB14vXdXdxN/8Z4ZL3MVWFnwxm2yp6PZ6Rqad+T1frnSTfsFUOe6Ik4hG1xHoeakSk46UR4YPeJ3q9LqKQ1gPz4Yg2T4c7ju+Eq8uF/s4YA6vnLRyA1F7aQYdeCvxEKvWE9/hq8GjhTu9rJ07hiOBnnKTkKjLNi8hfGIKybyDGyhgv5BiDmGnSI9Gj6d5eQoKvEEkBVcorGyossS7z9CNi1YZiOChroo+G1VmXb5T1mXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmOz5YUUQDzH/yuyv42xGy+v5Qghbuly4SDidB1aTZ0=;
 b=le5cufnrY9HuiL5KDTb+4i8Y3iuKLx+M168NIkUqZCivBiqcZJAGw1WLOohU6HXfLl36uJCd7ZhP+xG9QUDWouXIH9bE4Ay8qkhJJpn4myf2TWek6/ra00cchnB59ee7clz/Lpzais1Xi8kjj5aC6Jj+bmd58WBcCRC+CPeRF77pbTakgT0cT7rUkjLiPFWVzRT5K5LJKx1gg9vlX4KgL1QeQNTpoZoweT21PIBCGXEsTRb9DZ1rsxgnUfHsUEcs9fRSvchpMcIgw/dLY1OAx2tumrz/NIBnYikBKP/iUufPw79NfUgcIEEYVDoGdwy9XvMCuehYECRudh6vYdOSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 8 Sep
 2022 16:19:12 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%7]) with mapi id 15.20.5612.019; Thu, 8 Sep 2022
 16:19:12 +0000
Message-ID: <7c216705-db63-82d7-18bf-6598042f69a6@intel.com>
Date: Thu, 8 Sep 2022 21:49:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v3 05/14] drm/i915: Prepare more multi-GT initialization
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-6-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220906234934.3655440-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::28) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: f15ddcb0-23a6-4593-d202-08da91b5dd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yz/0aBY0S9hhFmAgjkK02sci4zx8McnqoezngGOf86Acsv/ll1mkdLPC26jZWbD7v70ST85tTcvYVLO/C6ZTp0iyvvlCRrppEfLw1MQPcaejzDFBJhekJJb1PP071OevFqZatHa6YoK4x8byypESAeSW4tJcrIBBZheatgLQUM6jR5rNGI3YC6y/IFrBkQHymeSe+A5zfWXm6FMaVoLD2YNLNImCEWyabcjmKnQSs54D87tLWkkvG8OYQWmuvxUgMXSEi5EkLLDeKy0khZ0azoS31Um5t+MvvyPNNnbG9xbk9HvVYCc0kxstKEsTK4EJpqWfQbEXD2CFTGIp88uCMdtORJEp9pHC9RGCEUh24gN5MbDC0l+UHBtX2c7tFJ0KRpwGlYsCV5eNsmFl5FAcEy3WKhSMeazB6wbG/GxNCZ07nECBJI9LLw1pdnRSFzdGNMAR362A6ktsC3iHtPl2oGcuhPm6L11+GMXfkox9Ecib2gsYHGyPuOsMaOjJnH+IznjMmiDVLl7uYa829ZvTySk47bwOGxDX2+AsMfCPS341MYZ9ORSez2AkUSmbUHJL52BKc6dIJTvk120RbXgEqXXJSvgJ9lngTaKJRCI1ae7LYN6bwYKCoit0qLPyWXDSCDaRSaTaGfrD3dRDpAtvCVX9ZoqQtfOwIIby3JJuVu4gG4CxgC58J2pznm75hRubbuD3Q5IGEn9hA+ssdhqO0lfPPQucqy/xqjpHjlFXKhnS756bHhFfr5hChHxKlIsnqTCxZEUkwg/0G73RewRHNmnZFNZMIgBdSYOqH+tB4hE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(396003)(346002)(39860400002)(41300700001)(2616005)(31696002)(83380400001)(316002)(36756003)(31686004)(2906002)(86362001)(82960400001)(54906003)(4326008)(8676002)(8936002)(38100700002)(53546011)(26005)(6512007)(478600001)(6666004)(6486002)(66476007)(66556008)(66946007)(5660300002)(6506007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmVYZm0zL01nZzROTFZra2QzRTRMVDZTU0hXcEhjOXlYU1Awd3ZVcy85QWx5?=
 =?utf-8?B?RHgrYkZvOTZHNE1BQm83TjgxSVVJQzFVNWxOM0s2dThXWVZVSGJIQ1NlbUFW?=
 =?utf-8?B?dzZja0podjZSOE9PVGhGdFJRV1NKb0N5ajl2UmVpaGlFWWpzbmpieHk3Vkhq?=
 =?utf-8?B?eTd5NUN4L3d5OW01TEoyNmVOdm5yQUVENHhsK2tpUXpENFBtYWFqdEQraWdX?=
 =?utf-8?B?ZExvbUdpc3c5UTVKU3ZWQ1dLT0RDVGgzLzNOeXkyN0R5UUs0eEdMVDFWUjY2?=
 =?utf-8?B?NktaRjA5dnJZOWQrTmdINWxvNzhZczJFVmxla2U2cTA3cDZOYXY4OTZoS0hC?=
 =?utf-8?B?alhpYlNFcWhqayt3dGx4dVdzbyt1OENBUDYzMlhON0tXR1ViRllhVWkzZjQ3?=
 =?utf-8?B?NXFLZjNjd0ZWaHQ5eDBCd1YrMks0YlpxMExEYXdpR0MrRFFzWFp2OU1sc1RW?=
 =?utf-8?B?WXlHTzFTMjI2dHkvSDdacHJRY0hURzhNOUMzcmVieVl0MHNCcXJjbklVd0VI?=
 =?utf-8?B?U3JxM1d4WFRiMzFOUTJ0RUN1N2xKQ1NHbUFOeEdZSkxzS2lwT3J4Tm9FNXFG?=
 =?utf-8?B?NFQzYjAwbDhPdldWaTVZZWZuNndFT2pkbGxIeVFxc0dHdjV6b2J0K3dYMDN6?=
 =?utf-8?B?QmQ5YnNRVUVwaVdFaHgrYlNoQkFGZ3lZZ3Ftc29uL0tUZnJ4WG5XMXg4dGEv?=
 =?utf-8?B?UW1qTTFWZm5Ub3NiODFLTEdSWEVmcVVGNnhma2N2QWlkWHZGV1h5UGZTTkZv?=
 =?utf-8?B?Z3M3WTdBMGpoazR6QmJoREtqSUxKcWlwcEoyVkZpUlhEdXgzRmZSOTRUUENH?=
 =?utf-8?B?VDF3dlNSMEt3Q3loNHlHdDB4bTdlTklGWEdLcWFWVlpWVkYrTzVzbFY2M204?=
 =?utf-8?B?Rk1OcCtjOEJNN1ZQT3VMUGZXUzlhMlhzcURvemFyVjZ5OGhDdTVGYmtMS1Ax?=
 =?utf-8?B?Tm85eXh5dEh1Mm9acnFDd3YwRzZRN3VBWnc3b3pYdEt6YmVQM0REVDZ2V1BH?=
 =?utf-8?B?MHU4MncxWVpodkZiMlZZL2t5R2FwYzhLN1BvY2psUWdVN3B2aFdlOU9HbFBR?=
 =?utf-8?B?Q0JDVDdTanhWa2RrS2duNzJUR3FSTzBZZGFOQ1VCaTljWUI1SlF5L201a0gr?=
 =?utf-8?B?OEROM2FVeFlwc1hhWFR2bGJQaElka3VSS0V1UUF3c1Y4aHp3Mm1ZVDh6RHV1?=
 =?utf-8?B?TEtLb3FyRG1SdUlKS1hMY3dwYWFOWGwzY0JJcFQwaktvbTZiRlhQeXJ1WFNQ?=
 =?utf-8?B?V2pHTU5aZmF2ZGkyVzZ4cnNaR0xsOXhWNXdxVG4rdVZSYXd0THFEYTNjeHZ0?=
 =?utf-8?B?bUdPVlA1US9wanNZRXR6dVowUUlFa2JIb1B3ZVR2aVFSbFkxTXYrMmpLN0VX?=
 =?utf-8?B?UnZxOXJBb3JGNG8zVjNhcmNLT0V6eCt4ZVpNa2NpeS9rSXlZNEM0Mko2VWVF?=
 =?utf-8?B?d0dzQytoNXZYVFo4UmlHMHpnekI4OTFSRi9FTndnUWt0WEtTRlpqWFcwYmo1?=
 =?utf-8?B?VFlDMGJJRm5SS04wTTFGbTRRRWNmU0ZuSFB4OEs4eWlxVDVucTF1SHRVbkNV?=
 =?utf-8?B?VUNVZmJ1cy9JTVNiajdUbUhCZWJSc2RTdld1d1lKdzlGbTZsUm9QcXdWcGdO?=
 =?utf-8?B?S1pQeCtTNFpMRHEwbWpZczZGK2NLcHdBUndlVFI5NXRmVXhZZE5IaVQ2a2J1?=
 =?utf-8?B?bktMaStIKzZsaUNlVXlnSnRNZlVlTUFvYlE3b2s4bElBNm56TzFMVHBVWTRt?=
 =?utf-8?B?Z3NpL1VjdjVYQ0g4TDd3ZlN3ZjdmTFIvQ2h3bDFxU21EOXJ6Uzg4bzlWQm96?=
 =?utf-8?B?TzNpT0hQNUJJNXZlcnA0a0crRkkrZWhqMmFEbWFaVTVpZHBNK0EyR0luMmlu?=
 =?utf-8?B?U0hER3ZhTWk0TmpUSHVNVlp4dzd5VHJCaFN5UUpjdExBb09PdnRzUlptam9i?=
 =?utf-8?B?RkN1NlUzZzEwc1hKWUYzekFyY01lSEJBRld5Y2kwWC9CWm5UM2pxSHA2MUJj?=
 =?utf-8?B?V0pLLzQ4UzJyZmx1QXhaNWw5RFdVY2NUcDc2T1lLS2NjM1VUcFpBcTJuZVBI?=
 =?utf-8?B?c05wa1hNU053bElZcDdPdjhBanlEVzhSbzVubjRsN0RSVGtJYUhWVjI3cWR4?=
 =?utf-8?B?bzQ3cFgvVzBlVDBna0ZQU3ZDV2NRZkRGbzByb1pjWjBxUnRzZ25zcFVhOGdu?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f15ddcb0-23a6-4593-d202-08da91b5dd81
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 16:19:12.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVXuvuPC4FEKWvZF/yRcS1rOsngT/vYK4UWOhcePrVfFi4Wg1czwHhHfEBzoaTQdEOypbsvKFWbm+ysGBn8PYsmMHmdufQpPreRky4M4wLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07-09-2022 05:19, Matt Roper wrote:
> We're going to introduce an additional intel_gt for MTL's media unit
> soon.  Let's provide a bit more multi-GT initialization framework in
> preparation for that.  The initialization will pull the list of GTs for
> a platform from the device info structure.  Although necessary for the
> immediate MTL media enabling, this same framework will also be used
> farther down the road when we enable remote tiles on xehpsdv and pvc.
> 
> v2:
>  - Re-add missing test for !HAS_EXTRA_GT_LIST in intel_gt_probe_all().
> 
> v3:
>  - Move intel_gt_definition struct to intel_gt_types.h.  (Jani)
>  - Drop gtdef->setup().  For now we'll just use a switch() based on GT
>    type since we don't have too many different handlers for the
>    forseeable future.  (Jani)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c            | 59 ++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  1 -
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      | 15 +++++
>  drivers/gpu/drm/i915/i915_drv.h               |  2 +
>  drivers/gpu/drm/i915/intel_device_info.h      |  3 +
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
>  7 files changed, 80 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 275ad72940c1..41acc285e8bf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -736,7 +736,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>  	u16 vdbox_mask;
>  	u16 vebox_mask;
>  
> -	info->engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
> +	GEM_BUG_ON(!info->engine_mask);
>  
>  	if (GRAPHICS_VER(i915) < 11)
>  		return info->engine_mask;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 663a4798fb2e..85c75375391c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -807,8 +807,10 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  {
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>  	struct intel_gt *gt = &i915->gt0;
> +	const struct intel_gt_definition *gtdef;
>  	phys_addr_t phys_addr;
>  	unsigned int mmio_bar;
> +	unsigned int i;
>  	int ret;
>  
>  	mmio_bar = GRAPHICS_VER(i915) == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
> @@ -819,14 +821,69 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  	 * and it has been already initialized early during probe
>  	 * in i915_driver_probe()
>  	 */
> +	gt->i915 = i915;
> +	gt->name = "Primary GT";
> +	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
> +
> +	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
>  	ret = intel_gt_tile_setup(gt, phys_addr);
>  	if (ret)
>  		return ret;
>  
>  	i915->gt[0] = gt;
>  
> -	/* TODO: add more tiles */
> +	if (!HAS_EXTRA_GT_LIST(i915))
> +		return 0;
> +
> +	for (i = 1, gtdef = &INTEL_INFO(i915)->extra_gt_list[i - 1];
> +	     gtdef->name != NULL;
> +	     i++, gtdef = &INTEL_INFO(i915)->extra_gt_list[i - 1]) {
> +		gt = drmm_kzalloc(&i915->drm, sizeof(*gt), GFP_KERNEL);
> +		if (!gt) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		gt->i915 = i915;
> +		gt->name = gtdef->name;
> +		gt->type = gtdef->type;
> +		gt->info.engine_mask = gtdef->engine_mask;
> +		gt->info.id = i;
> +
> +		drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> +		if (GEM_WARN_ON(range_overflows_t(resource_size_t,
> +						  gtdef->mapping_base,
> +						  SZ_16M,
> +						  pci_resource_len(pdev, mmio_bar)))) {
> +			ret = -ENODEV;
> +			goto err;
> +		}
> +
> +		switch (gtdef->type) {
> +		case GT_TILE:
> +			ret = intel_gt_tile_setup(gt, phys_addr + gtdef->mapping_base);
> +			break;
> +
> +		case GT_PRIMARY:
> +			/* Primary GT should not appear in extra GT list */
> +		default:
> +			MISSING_CASE(gtdef->type);
> +			ret = -ENODEV;
> +		}
> +
> +		if (ret)
> +			goto err;
> +
> +		i915->gt[i] = gt;
> +	}
> +
>  	return 0;
> +
> +err:
> +	i915_probe_error(i915, "Failed to initialize %s! (%d)\n", gtdef->name, ret);
> +	intel_gt_release_all(i915);
> +
> +	return ret;
>  }
>  
>  int intel_gt_tiles_init(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 40b06adf509a..4d8779529cc2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -54,7 +54,6 @@ void intel_gt_driver_register(struct intel_gt *gt);
>  void intel_gt_driver_unregister(struct intel_gt *gt);
>  void intel_gt_driver_remove(struct intel_gt *gt);
>  void intel_gt_driver_release(struct intel_gt *gt);
> -
>  void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
>  
>  int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 4d56f7d5a3be..0e139f7d75ed 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -81,8 +81,16 @@ struct gt_defaults {
>  	u32 max_freq;
>  };
>  
> +enum intel_gt_type {
> +	GT_PRIMARY,
> +	GT_TILE,
> +};
> +
>  struct intel_gt {
>  	struct drm_i915_private *i915;
> +	const char *name;
> +	enum intel_gt_type type;
> +
>  	struct intel_uncore *uncore;
>  	struct i915_ggtt *ggtt;
>  
> @@ -262,6 +270,13 @@ struct intel_gt {
>  	struct kobject *sysfs_defaults;
>  };
>  
> +struct intel_gt_definition {
> +	enum intel_gt_type type;
> +	char *name;
> +	u32 mapping_base;
> +	intel_engine_mask_t engine_mask;
> +};
> +
>  enum intel_gt_scratch_field {
>  	/* 8 bytes */
>  	INTEL_GT_SCRATCH_FIELD_DEFAULT = 0,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index befb167b3c49..f010be8df851 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -916,6 +916,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_REGION(i915, i) (RUNTIME_INFO(i915)->memory_regions & (i))
>  #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
>  
> +#define HAS_EXTRA_GT_LIST(dev_priv)   (INTEL_INFO(dev_priv)->extra_gt_list)
> +
>  /*
>   * Platform has the dedicated compression control state for each lmem surfaces
>   * stored in lmem to support the 3D and media compression formats.
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 6904ad03ca19..deaa07d8df2c 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -37,6 +37,7 @@
>  
>  struct drm_printer;
>  struct drm_i915_private;
> +struct intel_gt_definition;
>  
>  /* Keep in gen based order, and chronological order within a gen */
>  enum intel_platform {
> @@ -252,6 +253,8 @@ struct intel_device_info {
>  
>  	unsigned int dma_mask_size; /* available DMA address bits */
>  
> +	const struct intel_gt_definition *extra_gt_list;
> +
>  	u8 gt; /* GT number, 0 if undefined */
>  
>  #define DEFINE_FLAG(name) u8 name:1
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f5904e659ef2..915d58ba383e 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -115,6 +115,7 @@ static struct dev_pm_domain pm_domain = {
>  static void mock_gt_probe(struct drm_i915_private *i915)
>  {
>  	i915->gt[0] = &i915->gt0;
> +	i915->gt[0]->name = "Mock GT";
>  }
>  
>  struct drm_i915_private *mock_gem_device(void)
LGTM.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Aravind.
