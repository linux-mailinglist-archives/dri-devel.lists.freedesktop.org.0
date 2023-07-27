Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE98765DB3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601210E5FC;
	Thu, 27 Jul 2023 21:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD06210E5FC;
 Thu, 27 Jul 2023 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690491898; x=1722027898;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NPCxEmAq1wgvsX73S13GkFfbCnbDuj2wxqiMYrBPK1g=;
 b=VLFPUhA2vZf25NMtzCN4BDAerarZLd/2WgMyx1EHewnwVrllXPGvsiSA
 Dzj4lSmjjr+4DZn06P3P+Vd4eyJzDdrS/hktHrKk+u+sU+/XDDiy63dTG
 H8ktacZ7zouLL0GpvIttl4UIzVZxIp7kkNCojmgG0mDf/6mEOxsVLpv6+
 kPMmxMd3oGTXxW4pYK+jY9VUZl6WISXK/XKHqg89xhq9FbO1vnMmeDC7D
 D+cCmCn/6kCFq51FKz1KTrWVBSnqMUfTrEXFK5zZDDvi+PFplRr6/ZGBn
 qNLpaK34bsR4dX+S2aMR3xaZVe9YKBcnRPf34LijJNXIYMzAElpWcPiZk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368451657"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="368451657"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 14:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900988576"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="900988576"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 14:04:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 14:04:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 14:04:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 14:04:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 14:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMaK4wgdEmMraxKhjSnH0P/90MThWE0iWT3F9zCmaJhHlgec6/TCGiUZxGhTNUrv91CkNFXHSm6oOePsNelfDYORBOo51GiBgqRac8QPZdtX1zx55a8X8cjDQx4l79npqG51aKFSZt0Qj85wHZ06hWBmlmJgkxUsGhTi0laFBOSHbDa/kuWekfGRBMSfyBQbX4eIvPl7KgmrZvgTZdzzWDRVyN0r2n7HcP3//LUrrLxJDWlpWNTT0qigyAXx2zh+P/w6dh0vkrdPIN6qK+attw0G+lKu4LYl9ww1J9arpEzG41PlwCHvchsS9qiZh/MTHwvlJ88FmObDhyEPXy2JYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJHrWXClUQY8CKFVUgf4QPvix/ovd8yh0umAk46zD44=;
 b=gP2fLLiY3VCFHm1VlEsLG1eDq4EWMZdFmaZ89tBJfdc96KwtffvRYmoZ9tRDqt+6wL52WfnSe0h8Vyajz/msariRAmq+JFTfOK7oXaqpvUChw5h6cM1++OdAkDROixXYlO/BqfAMSBpCdrex07KSo7GxSHoRCdW5aRhmzez17koNrePYBjRXl5Vgc08mF/6dvVI2ZT5UubDeMWImcBElU23Y+m2m7mCMBqVRc0xVAn+l2LtRu+BeCgGhc4JCJG3ZQHlwq0jNoMhlAqSEkZPDdZygnXVpNdH3uREzy0cpMom7lxgKMkp0j8s0iY5EUTPLR4rSZ/x8+zUcOwDwRJEBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 21:04:52 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 21:04:52 +0000
Message-ID: <5249e8ef-a756-fa5b-270a-e7e3964e6f9b@intel.com>
Date: Thu, 27 Jul 2023 14:04:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915/pxp/mtl: intel_pxp_init_hw needs runtime-pm
 inside pm-complete
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230601155917.2402415-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230601155917.2402415-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: a568be0d-f608-4b1a-7373-08db8ee51eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKndFLkmhZoj/vxoqvAzRcWJKmfEYJqKvFeFlIXf5qpjqrfhJLbxXhdC6G/FHy8YuryEmk6HMhj+kToMpzcCijQmfzCejM4DjW+d7acvCEV83rlMV//y1OLQShyGTEKYup+U+eggER36md90bm2gFjRN7SrziPfBMC8DE/h6IJ4094nksIGlr87txCTuCsNC2VqJZIDvZek3RqOCZwEI6rP/UJCXAARtjvRs9aC8SFFF+/ulkmBsIpQf9yz2t7YsW6457EAPPqP0niC/JDqWcY4+x8zrmvUyvd52jDrO+balXKMeoVCtPtxJM36X0rpNMTqnpM/eh6YmDkYO2RD49CuS+Grm49EAAX2uWp9GZ+X8vPAlVHyucIwnkqxu7ANvoqggFjNJZ3CVbR2dNBZbZnJwnund6yddUmvnJXG1kiuDXWV6h/Mu+qKDcL8S4mljUZ8o0l6tJn6ct1zEQ47YySq9ZyJmLGXXgnKwXPs9OjAnS411SMqIHjytd8mmWkBn7MMIh2UnpPVF5CThnRVp/5lgvKADzpdwBjRIdkYEV6Fsy9H1GnWgSd+4WKbiVVhTwxcr3oWRBwaaAOPMAxeC+01MytmSPeBw9ESUxNcvkzEj2RYAhaQZWCxccqQGfIOYfL4ZrFphYNmUTTX2q65A9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(5660300002)(41300700001)(26005)(53546011)(478600001)(38100700002)(6512007)(86362001)(4326008)(8936002)(8676002)(36756003)(316002)(31696002)(31686004)(66476007)(66556008)(6506007)(66946007)(186003)(450100002)(2906002)(2616005)(83380400001)(82960400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVk3UEtyMExsV1JaZk0rQldmZWdKcEdNN3dQZnIvd01MU1RmYXNuVzUvRlpG?=
 =?utf-8?B?Z09BMlFsTlZkc2RXMXpwVWVTVkNKNkFXcTBYVjljQ3FCRjlJU0RENkNvZ0NK?=
 =?utf-8?B?ZEpROVRLd2VGSEZVZTRDRFg2ajVFYUlXZjJNdVphNWttbGFBbzdjUzFZaW03?=
 =?utf-8?B?R0w1SndOSWNQbkU0bExMRVIrcVU0OFVtU2JFK0JBNFFKWW5VSUpQdENOdUEy?=
 =?utf-8?B?dkF1bTVLUnVKYkprdjRtN2p0MWowUG1nNG5YZHIrVUZwMGp3di9LR2d1cmYw?=
 =?utf-8?B?RE0wbHQ0eml0aVh3ZzBreWZzT1BPVWtnRVJMTVRKWkM0ZkNDMUhubU5BLzIz?=
 =?utf-8?B?Q2NhWUVQNEFOMW9JMEh2Rk80SXJnNU5hVC9UcHBVdkRPeVV3YW9kYzZyTU50?=
 =?utf-8?B?R0VLWTNNMnNiejRONXlQcHcvZDZweDVkeXJ5THhJVEJzak5FZkJLYmJLblZP?=
 =?utf-8?B?TFBXT0Fha2NFNVY2eEhzVXBnbklHZHB6ZHluT0Fzclp1YkZCb2FnSlNLajY5?=
 =?utf-8?B?NDloZ29CNllPZDBKR3BwN3U1ZGl4aFJ6WFpuYXNWRVlQTlRSNW5vN3VRZXZX?=
 =?utf-8?B?MFVkdWh3K3NRQ05UdkJGTFFSZFovQUN4OHNEbjRUdzZ6Y0pic1ZpMUtxWlM5?=
 =?utf-8?B?ZklBL2N6YktFQXZLQjlUU2JWTmFSSzlyZEtZcUJTSW03UmlEMXBtNVBsRytJ?=
 =?utf-8?B?Q05jYXNFSnJvSVExaUQwcTNIaVJjdHBnS29QTXBnM2cwK2FEb0dvTUFvd3d1?=
 =?utf-8?B?OWJQSEVYRzNzV2RydDA1S1paMjJuaVp2TjIyUXNVUWdYcGF6b0dDVzFpZ1dr?=
 =?utf-8?B?UGxFSkhmSGlDY2tLeHl3VGc4MXY3Zk9mRGw5U3luMktRcXNjczlVZ1dYSkJt?=
 =?utf-8?B?WWF4R1FVbWl6enNEV3RJeGk2cDBHWityTVpDYStQYjd3bGt5WGZVVGx6L3VB?=
 =?utf-8?B?Sm8wMDVnQUszYWVwTDB4dFJFZUFMOHAxSzlrYUJxQlZRRVJ4U1A1R2tNZmdp?=
 =?utf-8?B?M2lnbVdGZnhCOEQ3RXZ1Qis2MjhueWtzQjJLdEVZc2hmS2Q5WVBZaUYwUnlS?=
 =?utf-8?B?QUE0TVRmVXZNVTZKR09sYUtnRy9tNzZBbVZLYzhlVHhtZGZKVGFPZUVBSWx0?=
 =?utf-8?B?bno5ODJ0VFJHZ2pZMEJ0YWZSOXpuYzNpc0FMeS9Zd3FDeXA5OFNvZG4yRVNL?=
 =?utf-8?B?MkRJM0ZJemNEdmtqK0tjazlqZkEzVEZEeGQyY2UyT1JNSkNJWHN1emlFQ3pv?=
 =?utf-8?B?UlhQcEdyNlUzTHB2Z2RlY055dDRiZFQ1ZndRMGhYT0lyQ0JMUjhnSk9zd1k5?=
 =?utf-8?B?RUw4cXlYUUZLZTJiUDFEQ1hXZ0gxN3duY3FWWlBkQ0lmTWg3QlFMQm5kWFJV?=
 =?utf-8?B?ZWJKMFB6MVd5bkNJNjJMMitTRm9mZGIrRWplNHV6WkNLdHRxNVNWSkpKVi9B?=
 =?utf-8?B?WWdOc0toOHdyOFFSQlZqTFJZbXFIU2xsbXBwSUprQmZnSjVScll0ckhsZWor?=
 =?utf-8?B?TVIvMlNlZXZVMStRQlpIY2xsUCt2STRidzRXc2pKUkJWQ3dtVzUrdFBXaHNk?=
 =?utf-8?B?UjJQRUREeVFhTmRYN1RpekpwRnk3TGIyU0lLN3BGQ3I5bUdvQ05vUzNsVGdH?=
 =?utf-8?B?Zkk5N3llZEhBUnNZRlp6M3ZoeG5Md1B4d3VzanJJaUlrZlRQekpXNkxUb1Jk?=
 =?utf-8?B?bkIvNytwME00SW9lRDA0M3JCRU1ocVpLaWFlRWZOUEIzc1g0dG9Pa0NHald5?=
 =?utf-8?B?STNZRkNkdEMwQXkvU01lYVVxa0NHZGtBa3J1QjBIWlhQdXBjUWJtMW9vc1hV?=
 =?utf-8?B?OFVKT1Z0N0VydG9MYjdMSGM5Zzltc0krSENOc2ZiT3NuWHhFL3FBbWZvdk5v?=
 =?utf-8?B?YjRyMU1UejAyNWFmUTdrdzg2MFBXb0UvV29sZVBDSDd5RnZPSFBEV3k2aGNu?=
 =?utf-8?B?RjRQOXVjb2R6ay9CazVrdjVjaUxoVDdDZ3dVU01WdkdGSlV1TUVKZDU4NVFl?=
 =?utf-8?B?MjR4RDE4cmdKaDVxeGVva2FrUUFBY3VlQjllSng3ajdIdTZSWWtyUHZwR3Ar?=
 =?utf-8?B?OFo5czZDV2RyRVJFYkl0L3IvV0ptc09PTFNmU21LNWw1MlJ3Qnh2U1hUblY0?=
 =?utf-8?B?dytsWVoweS82RVVaVW5OWjlQV081dWFnU2pEY3pKSkpoajQxdUZwQjBjWXg2?=
 =?utf-8?Q?XWsZoLSrlG5OTjtB4O4bUeM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a568be0d-f608-4b1a-7373-08db8ee51eff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 21:04:52.2800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3C2WXvv9KHHQSDQ2vJuY78UgG9NBZiQl2jU4JJFZRiW7SGSqy6iY2WYeDZMXFcfNVCgpsd7YceSsz5fJFJsnwtuIeP0N5wQ/0/X9sLSjlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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



On 6/1/2023 8:59 AM, Alan Previn wrote:
> In the case of failed suspend flow or cases where the kernel does not go
> into full suspend but goes from suspend_prepare back to resume_complete,
> we get called for a pm_complete but without runtime_pm guaranteed.
>
> Thus, ensure we take the runtime_pm when calling intel_pxp_init_hw
> from within intel_pxp_resume_complete.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 1a04067f61fc..1d184dcd63c7 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -36,6 +36,8 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
>   
>   void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   {
> +	intel_wakeref_t wakeref;
> +
>   	if (!intel_pxp_is_enabled(pxp))
>   		return;
>   
> @@ -48,7 +50,8 @@ void intel_pxp_resume_complete()
>   	if (!HAS_ENGINE(pxp->ctrl_gt, GSC0) && !pxp->pxp_component)
>   		return;
>   
> -	intel_pxp_init_hw(pxp);
> +	with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref)

This is called from within the rpm resume path, so you can't do an rpm 
get or it will deadlock. Maybe have:

__pxp_resume_complete(struct intel_pxp *pxp, bool needs_rpm);

intel_pxp_resume_complete(..)
{
     return __pxp_resume_complete(pxp, true);
}

intel_pxp_runtime_resume(..)
{
     return __pxp_resume_complete(pxp, false);
}


or something like that.
Daniele

> +		intel_pxp_init_hw(pxp);
>   }
>   
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
>
> base-commit: a66da4c33d8ede541aea9ba6d0d73b556a072d54

