Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2D5B2B14
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2192610E0F9;
	Fri,  9 Sep 2022 00:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF110E0F9;
 Fri,  9 Sep 2022 00:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682980; x=1694218980;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rpnD6L1+2BO1DQs1Mw+QjPBx2p8YmwqIhtQVbfzCZiw=;
 b=Tj01PBkjngbEGrnBIn98q2TK3ytaNRqOf+58Qo8u408pfbTWpCmzFUX+
 ww9xmeP5H5OF0RThWloq7R89I+93O593oBZ+VX/r/5vLNGcoq6AoEBhFm
 EiAtvQ8Co3yN0Q+bOa5P9OPtnVbs7qWSnynejV5Oe6a/qoOzYKe4LlqTY
 tjxaN/3e2G6zyzvZ8IZmrrKsSFrI9lyMufTGYkg1bQ7S2ULQ/XLe8uVXS
 JUQuJWpWrrUxY2QoKq8LQlv5eHzp0mNWKuPtqzx6vcRZdLmmrjgdabSIV
 E7IgEoMcEZcy86SDPuxEDTFSDBVvHp+RzBdl5k2SV3JMogNo7gQfgZbcn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277747632"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="277747632"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="676935029"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2022 17:22:55 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 17:22:54 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 17:22:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 17:22:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 17:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyTh1Bx4D1IDf/Z2qYlgHQx3rWQ7UXB9KNlW7n9R08XpKiN92ZtURjXSdLtSGC0A/bi4PknSeBjw5hsTxt8W1IL6ZQB+0GcQbP0e4UPdzHr1DFk27HxrpO7jwXng2wkdewRgf5klcdwleKcAEFSwuWJJPZGeX0etOL6ahaZDU9mQnsGoQAbHV6uOouN7FXDrGRTwUTmXLiiGixQZk8gxXSEYItHp7DQfxXby237+VJWNHFFa1zvW2xQ4zb1KlSzGJjMDRk7+2cRXSeKpnx3xnz/1smmDbzgco1JwOqerpd/Z4nQwIVoYysH2ccUDwFUYGuaFleQWgd/ltzWJhc3SFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIorT2u/aY+55dIEh4wscfHWbGdevv0a3paRlOhAfzo=;
 b=Kptd/33vkBKJXDEsoJu0nEAK2+oLybjuU+mIue2aBSj7L1rHx7ZIea7Ks0Ju5zsC6OtKDZJT9u5RKY4ZrXI9RUPWfeOwhsUKOKLq7YmRD+o/uMr3r20ZDeNAOhqgHEVn5I3HHP4HoJuLEVSGRgHnRSEIigWnfXbhnIZIrSle4/wsUy+zNSr61Hmi+JsGWDw/fHqQiavGnPg/sDRg/hjMiIQW7NT+cpKIvoVDYeQTtsGdL2olsMzfGPMVvyoe6R+Hg00sxc78gZCH5xayR0AhSvkKhDVUCuQXX1bNLyUPyQGt7MU2pjNJ8mJDFYzon//amyngy1DoOy3D1SVyYgpOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Fri, 9 Sep 2022 00:22:35 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Fri, 9 Sep 2022
 00:22:35 +0000
Message-ID: <7321e3e2-eaa8-51dc-0d15-aa234cdb056f@intel.com>
Date: Thu, 8 Sep 2022 17:22:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 15/15] HAX: drm/i915: force INTEL_MEI_GSC and
 INTEL_MEI_PXP on for CI
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-16-daniele.ceraolospurio@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220909001612.728451-16-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00042205-851f-4a14-52db-08da91f964a1
X-MS-TrafficTypeDiagnostic: PH0PR11MB4823:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifDABmKVNhXLMhs3ecl2u8oafmRifZ1mXb79b4wn4lmereZgPxeeOK4WuU7ABAoA9lzPr7J8hzmuaspZ2FsZ9OyOiKy6oQPcwT6V6Z+R3p61Aju60C4vjwXaN0BzI3Y01JyivOY26eeste/bwoM4Iw7ScgvrgtUopwyiwXYfZzsHAehodeDiuHmPBbWZB7GHoEbI3MX8xQmYPh2pd7LUF0KH9aXbcDWiVuqxtD5PlaJEQOVJtz4QquO5yUJq5ZfQj6tEPgVUb43SnobSkwfnIWv5PP0Hy5iU2dvvfhaonHwie1E/Pf4Av0PN2ZvZMqRhdAhCzdGU0U5d0CFj7p9s5/l3f2G7fMvBC6lbizvmx2477Byr7W+XjaHGNyPFOGfAci8bJfH/0OFrFenZAHlU/RB9HWKlBeR9e7P4jgFF1AlZfWHj1ie25HXiVfpNQCoYhJ3xB05R0PIDKGw6udSaaqWB3n3OIQ/ePwNCcXdz7d9FP2Gbcn8/JYDaBgNUVP4qoYF9sJXqeOuMmaONdC2jqbdEEaqscgDMCtRNtvDtW/+2UJtWrMzgTf2X0b09swS3Wr0lxXOVPj+RiIIwjiLurfJkL8jKeT7/ZJFWLyWg2sFRXSm6heDOSp6jXGDZZ/e6pza2sZirFBzgyPltLB3Oz2D8+kS5eXk7u7DpeApsZ7m9xYprRRsha0nJLZAA2Jsrje5Oc78AvYoowxGuiX+kchPW4/U3bCFMVS+JRofFEbZToVjCeyfN8ghx5M9cRsBw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(366004)(136003)(346002)(396003)(8936002)(6486002)(6506007)(41300700001)(26005)(478600001)(6666004)(966005)(2616005)(83380400001)(186003)(4744005)(2906002)(5660300002)(53546011)(6916009)(6512007)(66946007)(8676002)(316002)(66556008)(450100002)(4326008)(66476007)(31686004)(36756003)(82960400001)(38100700002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS9sanpPTHhaK2dQNFp4dEZPQWNHdThMSjYrc1JXSTNWeTUzaEdzb25OQTVi?=
 =?utf-8?B?REo5OFhXcjFNMTRhWjVkc2F3WmMxREhnMXBHVk9hcmMydjk0S0g5NkVPVTh0?=
 =?utf-8?B?Z25qSGFLendnY0Ywb3BPWThnd1NKTjRHOExTTWRCYVJ4Vi9NVDRjOTRmOW1v?=
 =?utf-8?B?Q2VKbHVyNFpqMDlySyszM0ZVUFRtbmFacDZkQjJTVEZxTk4yWmsyS2hNSmsy?=
 =?utf-8?B?WDYyMmk1WmdDUXIxcUt6bEdMckYzQjYybUhMemN2MWRIMjM4ck4wcHQxNzZl?=
 =?utf-8?B?SmRiSWozTmV2eVY4STFTTWJ2WldEckd3UCtSdEpFeVJWa2lSUThDbmplUEoz?=
 =?utf-8?B?TnZ6L25jWGxDT1BYWkZRSVYxOThzMFkyMy9SbjY3U0JqZDgxVnYwUDFzS2RE?=
 =?utf-8?B?WGxhMHo5NWJXQUx1YnJwWTVUenZXbnZZcjdYMElnSG10VUdXVi9UdG5ldDJR?=
 =?utf-8?B?cmkvUzBoWnJ3NXRRZXQydHk1Z3dBL3JQemVrUElzeklMSC9VejNFRERCQVdy?=
 =?utf-8?B?QzVpZ05TcURCMHQ2ZUpKTHRWNTBjdGdYN0F1UGhtdWlIWmtzU0VWRnlhUkJ0?=
 =?utf-8?B?QW9wR3VxNEZNQTZ1SVQrNUMzbkt0RVZNcXlMSjhKUnZ0eXBOSHN6TUZFN0pT?=
 =?utf-8?B?akI3LzJmUm5kMDc5bVcrZCtqMXRqeGhkL3JrZ1lIcjlMbDl0N3ZsTXF0ak9u?=
 =?utf-8?B?bHpsa2lQL1M5K2pIcEVyNzU0Y3dKY25RUHYrdnFGVm1zUllodmwwbmFoMWtG?=
 =?utf-8?B?WThIUWhlT1pSVUV2TXh5NWRDaEpTKzI4dU12WXZPYnNibFBKNUkxSjRiYUM4?=
 =?utf-8?B?RnptMHFsYmVucVladG1PNm45d2U1aURMYXVqcXhzU0J2dXRkVHoyTzc2Z2Vw?=
 =?utf-8?B?eDVpb2VleFVlZ1VMZ3Y0K3c1Sk5lZlRVMVRJdmhyQ09VSjJuaWdtU3VQL283?=
 =?utf-8?B?c1RPbkJzZ01qenRiRzNCbE1oTHNab0NIU2JSNkVhZ3F4TVFnS3JEMHRDQ1Ni?=
 =?utf-8?B?QU5kRGg5Z2dpVnVJRFBwQzY0bEVUb1VnS2V1amJ1L3V0YW05Si9vcEdXZHBk?=
 =?utf-8?B?YW0vcmFNSmhMRGtOUkJFMjlnYlM5VzJlY2NzbDcwdHRJMHBTOEJaWnAyWnpN?=
 =?utf-8?B?WHBZdlYzQVpXMEdHQ2pxWDN5djBuVnhWdDR4Q3VXMUpRVHBSdjNlNXpXZHhL?=
 =?utf-8?B?NVI3UjNRWU1kd1VaNHE2T0lVVVVja2tvdkttQkNOYlh6TS9BL2RIK3RuY0wz?=
 =?utf-8?B?dUZXQWt5K2hra2oxT3VGNkk1S3B6UmpDdGN3bFJaSUUzK0NNRkR4REorZURU?=
 =?utf-8?B?d2ZJekFrTmt4czBCbmhJOE8rcVVSVmRmcTNuZk0wcnczY1BSd0FSUTI0NzR0?=
 =?utf-8?B?enF2UWtpVXJibGNHSUYwMFlJdFpDTGwxYlI4TmlmV2VDR3lQUGRrQmFvS1Rz?=
 =?utf-8?B?V25vK0UwR0J2SVR5eHoxZVEyN05NZUhJeWN1YzZibXRRVENySzN4Q1Q2Wnpx?=
 =?utf-8?B?VGtpd216OHhlNi9lemJjZXh6dExsZFJKUjhqVnhMbzRITnlEUExCdkljU3dY?=
 =?utf-8?B?TVFpeDl6aVA5dFlLcEdCT3Rub0lHblh0T3BRYkpxWHJuZU5VZi8yMHRPWk5W?=
 =?utf-8?B?WUZqVzhBb2dEQWc4Y0xmME53Yi8yM3o5WVlnb2Zkb2ZXTm9STnlVdjlkazBz?=
 =?utf-8?B?OFNJQmwxNmxxcUdBRE1zQ01iN2l4L0wwOUFZQ3JlR1JjMmc4S1FxbXdodGFI?=
 =?utf-8?B?dk5uUmRuRW5DbWpWR0pzUkFtK0FJY0k2WERrK1BUU3lob21rZ3NtWnNhN0Ex?=
 =?utf-8?B?TXV5QnNBMnZqb0pZTE1NcjFIK29MNE82WGI5Y2d0R2t1b29OU1BFRVFmdVNH?=
 =?utf-8?B?ZEM4QlYzMWd0VWVnNUJBSEpHRmxCd0JJOTh4dEc1UXEvbGFFUFkxV0F2bkYr?=
 =?utf-8?B?NE9sOHJVVzErVjlVNnRvSGtMNDgvZGZjWGVsWnFxVk5yNjhhQXhtTDNycFJq?=
 =?utf-8?B?djBCdHN2cmxxVUx0dlRza1hwRHhJNGdWZlFrMVd2bjh2ZU9iUFFpK1JyMysy?=
 =?utf-8?B?RVE3ZHhLcjVOVVdjUHFPYTJXK3JOLzhqNWtmRFBZNmhjY2V1cy9pcy9hME1Y?=
 =?utf-8?B?NWptWm9qNm84dEFpZUxpYjd6ZWRPUDR3QWxwMVdKMFpYRGlNMWlmUTN3cGpZ?=
 =?utf-8?Q?jgHc8BP/Mx4HURholEwMp9g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00042205-851f-4a14-52db-08da91f964a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 00:22:34.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Na5FHulS1V6HI8XcaW/Wldflf33xWmwjg0dsAAaQOcvstsDzMYRmUqPmC+p927/etv1RszZY/rzBkOaSm8VD6nCzznviw6AybSEecRETMnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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

I've submitted a merge request to have those flags turned on by default 
in our CI builds:

https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/116

Daniele

On 9/8/2022 5:16 PM, Daniele Ceraolo Spurio wrote:
> Both are required for HuC loading.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/Kconfig.debug | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index e7fd3e76f8a2..a6576ffbc4dc 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -48,6 +48,8 @@ config DRM_I915_DEBUG
>   	select DRM_I915_DEBUG_RUNTIME_PM
>   	select DRM_I915_SW_FENCE_DEBUG_OBJECTS
>   	select DRM_I915_SELFTEST
> +	select INTEL_MEI_GSC
> +	select INTEL_MEI_PXP
>   	select BROKEN # for prototype uAPI
>   	default n
>   	help

