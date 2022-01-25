Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4FC49BB60
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 19:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70610E3FA;
	Tue, 25 Jan 2022 18:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBDD10E3FA;
 Tue, 25 Jan 2022 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643135822; x=1674671822;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CR5VbxVVRzVTjNOs3ouoP+UqofZZ16s9TIeOVcvLmGQ=;
 b=ky2V2msjdVl+V7RIOdGj0RH0oRp3rSv/Tb0/MCI6Cas1ouXYqfCb8tDP
 RkQ8AaabuDr42Vd3JNwQbOygrsK+j98Q/0R0g3AVlWFjSTEQsVIHpB+yC
 aWvxYi1MAtL87zwzKHVc0yVYZbp05qQUV7DjghT+EZvM0T1W0CYv63Gzq
 6DmuokLOo2VZIDOAaZvcqFy948HXAQLQ7PIsvRWPaTfy1V6nMiX2V9kxd
 a3zv5+KisO9593D3uGWVxtqL57BK6u2BnF+7GST1s0tdFWn2TpzNimLpH
 1yhGiHWfhBA3bU0KPJctwd0KKAmqOOeirZy2r1d16bdsbZpUUNhZDYH6m w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="243977247"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="243977247"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 10:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="674091716"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2022 10:37:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 10:37:01 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 10:37:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 25 Jan 2022 10:37:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 25 Jan 2022 10:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czBAsaKJStsuaTUS7GKFFMNTZhEkFLIRnJpZAIb/nv7NRDCdlUgiAAFDw7c3xfiKzhkruSzwRtEYdFkq2TnG4It0I/0VwBjVRVf52Cj0T2fL7Lr+c2Bz0mj7WjpeIT++GUeO0PUjj7HFlPQsKZhCGvJl0ttj+Pm2zmSnk6LdneHsNJbyVVggdAkPK7sVjsTMs9suQdO0mCf4p+FbnVrdI55h3yVOTzoOIk/uQmPAWeBsAt6FVXmIadKfDRWTYG31TrxSTN9v5bTcQjyMNZq0oVON3S395E7wdrs6NKW47uttQ5nYQdYoPuLttPPXguvKgercg5Ae+eDqPAP1yStpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH8IpyhLIaUfw8G2BN8AZitZUsiMkSKt0nMPQwBo9lo=;
 b=hDTCcLKrHS2MJehemJPjv1IiQOx4zcW8+83CuKnGmBKuG4AcH1E5aOtydz7Hks2A1HJepmjbDi3KMBOE0MtWDkAuqYFX4uq+JbWzkis4ZtZM0391TPQwYPR21as7vTAHPdeewaSri5IK6JhlyV75z5FSCJOXPsHD1kFVXQaOn7IDQ4a65xksveUs9VoF/lv31AkeCThXSEnCaiqGCKFIfCAIphV9Z0otjkccXqk8tTs0W1pS+r3qJ2dfB20iAc4rrKZGW2blJiB0RkXJmUq8y7CqN5j5jHuggMKGWzerfGLsynON9hOmR/Pr2TE7XzNMUzrUzO/JVLZ5ige+G0OAlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM6PR11MB3163.namprd11.prod.outlook.com (2603:10b6:5:c::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Tue, 25 Jan 2022 18:36:59 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::396c:391f:397f:8906]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::396c:391f:397f:8906%5]) with mapi id 15.20.4930.015; Tue, 25 Jan 2022
 18:36:58 +0000
Message-ID: <5f5b9493-bb0a-6940-3a29-8630b234cb44@intel.com>
Date: Tue, 25 Jan 2022 10:36:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/guc: Update guc shim control programming on
 newer platforms
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220120222436.3449778-1-daniele.ceraolospurio@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20220120222436.3449778-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 879ad054-6a09-4af7-bb76-08d9e031ab8f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3163:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB316325775608DF869E5F463E855F9@DM6PR11MB3163.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Ptuhx3VfrSb73y0PSI4SpDFdt2DvEVCLF/vmz4lq+ztN+dEWZ4xiCnYOOsks5ZernN1KFiHKc6+MrW8TgbtPV2d1Ca2s2pBkVM97Pl6XC4BOpO3qhpLIg0u5OnxaLgZ81rWnsBC4iVjiCV/IXB9ZvXIIGuM0mVmoFe+k7dL4+QQRNBxXHjQC/3dZE0nak96pqgqsabTKQ91Rw5NPQfXmJ/WCli2XgVVIpmCjrsv66JxAcC4J57Z1JZ28E+THgtSUzrd/kw6Z/OL0th9U6wSH5vp8N4nO0L9wl1JC2tz/1VyyyU2wu6rK+cE3DMcm/bMwzyxs3mJjoLAsu4VJ8mOv022M6cSAj4WRnNX9nanPT8Ql/DBRH0AkzoWjsMOd95JIFQxT11NzQ2j/LoD44mGEhziSjgF5hMzy7K+RnB2SJT1CKm3vlZZaiwfCtVn2DWga7Z/7Xs1ETqX9nb5i/xp48MI9Wxy4gv9cwHZsCQeT+bx3E6vpliRtA3vu8LIQjyluUlMpyKjSCtdpd0iMJEwm/4Z91nFYYVFBqxp7QtpMyIFu5WGa2wrCDXFHW+KiYcMgU760+dGwA3egCJDW0Pc6Bg+cTfsBrFrBORxd8mSlzeBNkHq/IgpKRlmowlXfFtNxhLD7nCIEz/V9V8N08wpslqeWWTQdjeidaquoKYpgrFPgHJfvw23AOgV4GrXERkquQf9UHf6rYR1BhzJc1NDvvO68vR2FRnJbllvkWm2BfLlfPMs/H8h7PK8EmlhFxU1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(4326008)(8676002)(5660300002)(53546011)(31696002)(86362001)(107886003)(2906002)(38100700002)(8936002)(82960400001)(26005)(36756003)(83380400001)(450100002)(508600001)(2616005)(66946007)(6486002)(66476007)(66556008)(186003)(316002)(31686004)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3oxcnpCSlo4dWpKdENPeld0YmQybkpWWkRIb1JmTXgvRVdYc3hIV1NLRTE5?=
 =?utf-8?B?REwyZkhMMVNaN1JKMUxCNk9xcHBFdElCdDlNOEFBU2YvN3Q2dFZEcDJuR0I1?=
 =?utf-8?B?WXhJdndZb2hFS2JTUWk0ZHRWdTcySVpLdlVoait4ZVpjT0tYaG9KSE9yNU45?=
 =?utf-8?B?WEVhb2Z3N3k3eWVRd3JJczkvL1ByaFgyd29CcU1vYitZbUl1eFI3TGlOamZL?=
 =?utf-8?B?aTdqdHdWYWlFZWRaUGUycWRyKzNBSGFkaWU0Yy9BM2dBZmo1UHpQdDFKQWZp?=
 =?utf-8?B?MkV4djRTMHBDSUlzcHFTZFN1OFZqaE5TMjgveVJGUUc2TlJCSHI1NXorQmdM?=
 =?utf-8?B?eTlXRUUvSWYyMVJVQng5cGFXNDgyWUJuUmJpZVFIZlh2Sno2T04zbkllT0s3?=
 =?utf-8?B?MFd6MCtUZThTR05HYWE3N3NoRTFyWFdSdkJFOGdlS0pReW9aQUxRZHRod3Bt?=
 =?utf-8?B?RDd1NmlzQUpjbXlpaUFrN2dTZVcyRDZLckFtR0FkZjBEc3FTZlJ3azRTdnRl?=
 =?utf-8?B?Z0JPckhpdHVKOEp6emc1M25qNndXZ0pHSUFXbktBWmJ5cXRCT0E5UjY5OXFZ?=
 =?utf-8?B?Z1JRVUtMczBlcVRIaXRjYjRxRTE3eWNuUGQyakx1S0tsYkhPVmlER0xZV2pJ?=
 =?utf-8?B?c0tOV3hHOE92ZTdLVnAvaU41MS9nZkVWVkxwMDRwcERxSDZZeEpaSHM0ZjRp?=
 =?utf-8?B?QWxBYXJLOGtDcjQ1Sy9CRnphOGh6ZDhTZWg2OFNneVhGa1RZT0lqeVdGYVVW?=
 =?utf-8?B?ZDJydHhCU0tkU0FNNHlUSzdUaE02eW1xVmhSbXl2Zm1mR2pzV0lXSkVSTVhW?=
 =?utf-8?B?dWRBYmZvNzE1d3BwOFE3Q3llRnRBMFFYWVM4MU1kQnRPekVNUlZrTkd2a1ph?=
 =?utf-8?B?T1JaUU5EMXRiTnlTNVdERzlndzQ5YW9VcGhZVWxFanJvcmFuWjRlZmVaQmxS?=
 =?utf-8?B?UkxFcFZXZnRnQVoxOVM0ZFF0OUY0MjN4RXVGaStQbS85SG50VWQxUUNiV3cx?=
 =?utf-8?B?RVU5SUN3ZW1vY1JrYU1nblR1ZS9DRk1NRFRnMm5nMXp5MnZrMEQxenhsd0RT?=
 =?utf-8?B?U2dNejFhckdaWFRUQWN6Q004YXpWQ3h6LzlEMW41RFNEWUlQc1R2YW4zZmMy?=
 =?utf-8?B?WXdrYkMyUndRRXpGSWY3VklCUkhOWTE0cU5abWw1dmVCb29QUHlKMXVDK3pZ?=
 =?utf-8?B?eUtFYVZYdmVYVDlEMDd6VDVlQllUbytwK0g0ZHY4WHI2K0xEVUM5dmFNK2xZ?=
 =?utf-8?B?bEQxaVZYTzRNY2Vwakp2c25rbTFqUlI2djhBdXBUUFQ0aXNJZkhsWGhZamVE?=
 =?utf-8?B?MmlMMzJ4amZpZ28vRFhVdGdyc21NQ1JKd3dVMk5jbXBaNFJTMERDTnJrWUZ2?=
 =?utf-8?B?YUUzSE93dGJOWjVBdG5ESnRyRk1DaDJ2WWthbExQL0NkRW1RTFJINFhXYU9v?=
 =?utf-8?B?ODc2QkJpMDVJL05DMVBtL3lEYWZ5eW9URS9FN1pReWNTT1VKRXNGaTNSNXYv?=
 =?utf-8?B?aDhaelJUZnBIUGkvMTl2d0ZvUHhVQ1o4MmVUZi9YdWc3c0xNK3kvbzAydVBS?=
 =?utf-8?B?TXNGY3VNbGR5YTZvWmozZTRVeE03Y3ZBcmR5K01QSTBqK3BxQng1Vm84U04y?=
 =?utf-8?B?c0t3M25IWVpaTjBObGNZclEvRUo5S3dEN1NSbkNEYnd5aS9Ea0dOalhTYmdH?=
 =?utf-8?B?dVdqaDFjWExuZUloZWNOa0J0eUY5d2ZDM2tNK0QxTWdNSzNoT3laeVF3cE9z?=
 =?utf-8?B?QUlmMThybnpIU0NYOExyM2FBOXpwZC9nb1J3d0NqZUJ1YngrUnMyRDd1Yzlp?=
 =?utf-8?B?UWZ0dlpiT1dPRnVFenB2WHhWM1VKWjVTbmZsTDRMVFJNR2xGRFUwTlV6ejJ6?=
 =?utf-8?B?U1BXYlo0ZmM0bGg1V3NKZjNDZnlzWTd0RGlqN3JCYUV5ZFg2TkRlU0FSQW1H?=
 =?utf-8?B?OENrNWlQVm94SEJSdmwvVTM0WFQ0aTlsd3NXaGNUMjcxWVRyNy9sdHNIZzZT?=
 =?utf-8?B?NWJVbHM1TmlYQVRQK1BYYmVIczdkcEJGcEd4MzhVUERCcGcyRlQ0aHRMTTc1?=
 =?utf-8?B?Mm5sR3ArcW1hS01xeXJ6Q0JtNEhUTEp1eUhnZG85QU5XUGovbytrVS9TRHoz?=
 =?utf-8?B?UHpDbnBUcnNibE9WeVI1Y1EwSDFoMTkrVzRLZnQ1akdGWW5VeGV0amtJendQ?=
 =?utf-8?B?RThPRDlaQUZZOGQyYzBOamhIY0JNL0kxdGdxMkhZeElxRS9uV1NQUTJtYS9y?=
 =?utf-8?Q?Xv1snvUCdRAyAzHY+Zw/2AiNR8CBzLJhgNfv+a5rmo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 879ad054-6a09-4af7-bb76-08d9e031ab8f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 18:36:58.8322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95HYaXmYZXkIPrbQrk6k4ouuA5QVsoP9qAwaROBAsgvXNKXSZ+0pBWyIX6uFrn4N2Ehi/0xcrPeGLwnkawP+r++V7pmA6M8P4wNn4lvvzt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3163
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/20/2022 2:24 PM, Daniele Ceraolo Spurio wrote:
> Starting from xehpsdv, bit 0 of of the GuC shim control register has
> been repurposed, while bit 2 is now reserved, so we need to avoid
> setting those for their old meaning on newer platforms.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index f773e7f35bc1a..40f7d4779c9ec 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -15,13 +15,15 @@
>   
>   static void guc_prepare_xfer(struct intel_uncore *uncore)
>   {
> -	u32 shim_flags = GUC_DISABLE_SRAM_INIT_TO_ZEROES |
> -			 GUC_ENABLE_READ_CACHE_LOGIC |
> -			 GUC_ENABLE_MIA_CACHING |
> +	u32 shim_flags = GUC_ENABLE_READ_CACHE_LOGIC |
>   			 GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA |
>   			 GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA |
>   			 GUC_ENABLE_MIA_CLOCK_GATING;
>   
> +	if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 50))
> +		shim_flags |= GUC_DISABLE_SRAM_INIT_TO_ZEROES |
> +			      GUC_ENABLE_MIA_CACHING;
> +

LGTM.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   	/* Must program this register before loading the ucode with DMA */
>   	intel_uncore_write(uncore, GUC_SHIM_CONTROL, shim_flags);
>   
