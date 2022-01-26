Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4549D229
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 19:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D215210E48A;
	Wed, 26 Jan 2022 18:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285AA10E2CD;
 Wed, 26 Jan 2022 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643223544; x=1674759544;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Z04dDYlpFROYH8qHuISg4ATrtkQX/Hda306x5QPCq4=;
 b=OyVt/yt0xJXyuz+a4u5lIDud9WEdIACAphNUG3ocFhCFTygpp7P22GEw
 yxxvLl/VTmiYklSGvz2qBjlBuMGQ0qWQo9gcT3HY1SItWboUqfUS3P7jr
 YbOJl4HOsWu81p0vkqmyoCE+C4lrrBkTDhc3vzrBUjHKRF8mVKQAuZPwu
 84JZUFdS9xj+axXsWzoCdPcVjBQY0fQtYQ9LvEv8RCZEOM8KaDnDzUagR
 PW5w4p9ad4p63Ig2OUTyK9XvaFwJ+qAC6DL5m5ezI689g+KeCNy2mHjp+
 T1/cRyp9YW8eauQOrz0KlXGxbs8PNUlDC3pFZ/vaqLVYjPbJu6fqdgUwA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230198543"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="230198543"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 10:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="581196716"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jan 2022 10:59:03 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 26 Jan 2022 10:58:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 26 Jan 2022 10:58:52 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 26 Jan 2022 10:58:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuDjnwTo6xjFBDxZL6LB0PEav28zgWf8UI2RgG+wmHD87r5zfLE3fbUU2vnlLHBamDFWzlACEG2e/SSvaX+Z9yfaav6jv1ZEoXdJoPRClix270pIxhD53pu1RBuQ95DMWuYSrIQbpH9CXREv+6H0jPc09Hrw23Z8AgZ9xXoZ0f2Tv2bUevLdSEBBm86ryM/3CJrjF1V+ed+RR/yYuqQ6Gm7VmrSB8W+YFGkeLp23Viw/CY+XRtC2DGJ34/cj7UvKhfhrBmHE82gxUNEpMvSNsxB5wXU5Quc4jNRuDtuZyDnTJ42WVNvMtfVTotS+qE6mnooGx84cVSqElcm6SEKKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT5EbyZykKRJR8MtagEoLdW76KsRaOOqJqSztwZRfBA=;
 b=CrbfwZNA7QK2XNCbF5eDwFmQ087A2rSMbSUIsnrM6AwQnYSHg+x0CfO3BjE5TFVsjif5inUfXstkDIvxMpREKIFpyvwrBuxiSeIlIo1Npm5mV74+OQhkQCh63Zef5d/T5qYNsFdNvSqWxFmgry+CMAFUAWhxAnrVS66gMLDakigSPITb4+JSAX3Ry6SMu4b10/yQqSSuFTEqY+69lQ4iq44NepUZYkfqYNfNNvAqTKuuY5O/wFMubK30FDG8MBW8EM8iRcYpsPxUyq1tKfnPlLmm3XsEZpiEIYog9mDwo/+Xi7XH4oP2JnrlGJM5/fejj0MkaUYRGjEE77/cOuEXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5544.namprd11.prod.outlook.com (2603:10b6:208:314::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 18:58:49 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 18:58:49 +0000
Message-ID: <5c436bf7-0ed6-83b6-6061-fdc73d4cc081@intel.com>
Date: Wed, 26 Jan 2022 10:58:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] drm/i915/guc: Cancel requests immediately
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220124150157.15758-1-matthew.brost@intel.com>
 <20220124150157.15758-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220124150157.15758-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR19CA0054.namprd19.prod.outlook.com
 (2603:10b6:300:94::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be42199f-e3c1-44be-c4fe-08d9e0fde319
X-MS-TrafficTypeDiagnostic: BL1PR11MB5544:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL1PR11MB5544305DA82CD2CB20D23A6ABD209@BL1PR11MB5544.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjdxgOLqoqoC8iWFlHSozOP5G8kqWS0HX5On1mmNpyl9Y7XMR6aualmfSrhG4+M8HHtZFERk9ZUkSuFkXI7Nfl9HR4h8mcqfXk57zC65CYY/tJXJEBiHkpygseJPxeE5UDbIhKTBw/z6SunFs+6z42vG3fLVJQoBXuQTQXrKiRAy1RmlWuWc0S5JFTfDW6wPULrXPyAE2YPhsipoYhHKHt1zV4UwQQX+cv46nXgqF6jsDHIXllIoamHpqX4b60yCGuIcoEi/wpxXGc8B2WQPNLThGKlsB3j22uS+zEOYn2cR9PCftLytXc6GGE+3aOPRgJVTZXYqMGo4MMpgwXLMLxQEuPbmraOF9Rt3KJSxBB/bFhrZPerk60VS66kC8poQkfi7zjmQfusKWP/zk1vGjLrj+k0gMW6K9EPgIdWs1tWH7hIGg00e5sJYW+RZtvJl8TLBbhTXGjK7w7rvP6A1qaIzfUeOaeKeV9R0C7z3vKYZJyZbcPDEThX/XnsZ2nf+j9GnJ5CPCpZRmHqIN3oJ6vh7Ch6kJLS1o7fDRmDRcWtQr3+o62+ymlrBNPR2afYPrzAonfGIRmCwGUBrIWeGEK6KkHlV5Lmw6CFqmprfhFFeZOoiS6MH4YO6L+VAFPn6G/Pvmo28ltnn/eZmr+9WzXM3Dr3Le19NfRrdmbEh//XJoZKzMPeIW+wE4/rRcPTg/JMx86h7mAVNS/cEDgQNB/XgAF5gjJItgSxrJXlh1Lcj05pbP5h3339nyOc+qA7oiBFOUYc3cug3QhWmofk0xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(2616005)(66556008)(107886003)(66476007)(8936002)(66946007)(6506007)(450100002)(8676002)(316002)(2906002)(83380400001)(86362001)(31696002)(38100700002)(36756003)(31686004)(6486002)(966005)(82960400001)(5660300002)(508600001)(6512007)(6666004)(53546011)(4326008)(14773001)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmpTZ3NWbjYvSmdmQmYzRVpkM3MwS0M3cjFUMVhFaUJlc2dSVDRPekR6WllZ?=
 =?utf-8?B?ZXdWcnJ4ZGNwOVV6ZmhNb1NqZHV0bGpkVzEvV1ZzbDJ4MzA0ZWNNZ1Q2UHVL?=
 =?utf-8?B?c2FzQnp0cmF6R2RWL28zM3p6TSs5YTY5ekRJeUdZeHlhTG1zWXltaUM5NFRT?=
 =?utf-8?B?cVRkTEhQYUloRC8rTGQvQjEwam5NenZGcmZOSUpIQ1dRejUvY3RQMjV0Vi80?=
 =?utf-8?B?Q1J1dHJXU1RIK1pQdFdtR2NPUEpRblcrWlRBOGF6YXcxYmJPOVREcDVIempw?=
 =?utf-8?B?cjUzMDdpcE85OUhFZi9SV0EyZjd2dE5JRHZYbzJvS2hRb3lnWjg1WTVPRUZE?=
 =?utf-8?B?OWJDb0RGa2Y2Sk0wZWYxcE5hc2V2Qmt2cmtydlkrUzJVT01CbVkyWGEyRkVy?=
 =?utf-8?B?UGtWa1Q1MjR0MTZtbUFHamxWdkFqREx0bUgyZVVjUGt1bElrdFVRU3VHUzBm?=
 =?utf-8?B?V3JlMjJwdDNSLzh5MGV1VFcraTlCQUl3TmJURnJpeksrZXNCYWJqUGZEaGdF?=
 =?utf-8?B?UnZxa3lQQU5rKzZJTEVnaGVoNUo5eWNuNklUK3VrYjhWaGN6bmI3OTJVRTk2?=
 =?utf-8?B?UG45a1g0UXZ6TTAvdkNrYkJjSG4rM1lPZnRXcmtiNEJnUXNJb1N4UzVuZmEy?=
 =?utf-8?B?RVBwSVZOTFoxL0RESVpjZTczSXhFdGx6YUJFL0tvcTdRdWhKaEJGTDVhakIy?=
 =?utf-8?B?QXJJdndFcHEvZ0VJME52SThaaFZuOEV1L2U3RHlVeHVTZGVEbkpwa3ovRGU3?=
 =?utf-8?B?cm8vc0dSd2trNFY1VGdwaUxQK1A1MnArSUY0Q3pjeEhObkUrTC9VOXR1V0ZS?=
 =?utf-8?B?RUk0RE5hczBkRWpnNHdCTWFPQ0V3YVB1Mlp0UmdRc2FabFdVVXFGbjdlbnpT?=
 =?utf-8?B?enI1U1BQWWlFYm8venltbXpPWHNOUTJZWVc2c3pPMFlhR1FEUExuMURnMy9R?=
 =?utf-8?B?dFJ6YkpVcVRqRzVYVmtrV3dlTlVMSGRPQVBPaW5nNGduYzkxNmpra2NwOVpP?=
 =?utf-8?B?dndVOXl4WXBkNXpMZFIwK004a3NLcjJVZERIWWRuNnR3Tm9OeUw3WHVaNmZK?=
 =?utf-8?B?ZTBuSlI5UStiNjJhVHVHZGNRVGFWc0haWWpGcUZXVlFpLzNSelpWcWQvZGJq?=
 =?utf-8?B?d3Z0ZHZQYTBGWWREbUhJU1JmMFZuUzE2aUs5bVF2eCttT0tPb1hadmFXaVVD?=
 =?utf-8?B?TGNJa0NBWlN5NVZMQjhkVlFPUEZKeVZSd2lWbGFldWJEUjNob1FYMkVjd0RZ?=
 =?utf-8?B?U1cyNmpyYVM1anR0TFV1V1hZZHVVSEFnQkFZUHdoUXdlVER6SGJCdWphNHRo?=
 =?utf-8?B?RENyMG1HY1NoSzVRTUZlRmZaMnlIK281eTBSOFV1WEpTcGo3Z3o1SitnWk41?=
 =?utf-8?B?cWhSMi9qczl0U0dHdS9ONmRCa3VVY1NnZmdGam9tbUlSWTZ5MWtndG5Sb0xs?=
 =?utf-8?B?ZTF6bFdQMkdJZWE5cVhwaFM2amhETFk2dGZGVW9aRlJwcjVacFRYbkgvS2RY?=
 =?utf-8?B?OUl1cEg4enRCcjA4N2lhcTdjdGRyMEpiMG5IZ2dvN3ZmNXdReXpDMnRHRnJO?=
 =?utf-8?B?SU1rOVpZWnBmK0QzR2tNU2tYWmhuUlRtUkVMQUpZaDZwczdTak85NFluMnhm?=
 =?utf-8?B?eXdOUFZVQzMyZWFqazRpUVlRRSthNDVNVG1hay9nUFNlbFE0eG1JekgrbGt4?=
 =?utf-8?B?eDhWc0pTbTRWTXZrL3BxTTZ1VEU4bE14aVVFYTZXTHVNMmYxcHVRa3lqZHVU?=
 =?utf-8?B?bmJRUHNSU09lY1RTTkF5RFk4MHpEemQ1WGtMTTR4Uy9qdWpQZ0xueE9nMXZh?=
 =?utf-8?B?V3NZNHd1eE14RnRIUVBtdUpteWlsRmVmWExIMnRKb3paOU1TUWMyMlloUlUw?=
 =?utf-8?B?ZlhBMUw4YlMySHVKS0pSMStRWDRKRXNCc3VRa0tqcDFlN0NycFozaWo0Mk1L?=
 =?utf-8?B?SHl2MEJwYU5mMFhRSzFwYUd5MGNqcGphWGZ1Y25NMGdabTBoZ1dROWdnaDRm?=
 =?utf-8?B?SEY5Ym9nbGREYURNNHRuc3VHSVJFaGppUUdUWmV2Qmt5ZnhObmJjZzF3dGRK?=
 =?utf-8?B?dFBXZm9iNjBHcmgwL1FQWkYwcW1GNnZvdUYzVXRDRTZ3OEsvR0tkTVViV2Vj?=
 =?utf-8?B?Q29UVmNnc1p1WXl4U0l6UlJsYTlxT1UwVkdDL0xhd2NBajRLOGVvTlkvYTQ1?=
 =?utf-8?B?d0NUT1ZGOTVEYm1TZjM4OWxVbkg3c0pMVGRaUmU5SEVBWUdiV1doOFUvdmcx?=
 =?utf-8?Q?/fz5+P7V1r5qo909GdCQS4MyKrPd4mlh/CYWUKApMM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be42199f-e3c1-44be-c4fe-08d9e0fde319
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 18:58:49.2975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEyjApFUOpXxPamOyOuIkcKh77vxrgh+K3FQaXm18v6+P/g5HbREJkR+8rFZ/fQOA475zbauNN9xAebW0p8FEQ+TgwT0ero6VGGJ4pIEjXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5544
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
Cc: daniele.ceraolospurio@intel.com, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2022 07:01, Matthew Brost wrote:
> Change the preemption timeout to the smallest possible value (1 us) when
> disabling scheduling to cancel a request and restore it after
> cancellation. This not only cancels the request as fast as possible, it
> fixes a bug where the preemption timeout is 0 which results in the
> schedule disable hanging forever.
Shouldn't there be an 'if' in the above statement? The pre-emption 
timeout is not normally zero.

>
> Reported-by: Jani Saarinen <jani.saarinen@intel.com>
> Fixes: 62eaf0ae217d4 ("drm/i915/guc: Support request cancellation")
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/4960
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  5 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 46 +++++++++++--------
>   2 files changed, 31 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 30cd81ad8911a..730998823dbea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -198,6 +198,11 @@ struct intel_context {
>   		 * each priority bucket
>   		 */
>   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
> +		/**
> +		 * @preemption_timeout: preemption timeout of the context, used
> +		 * to restore this value after request cancellation
> +		 */
> +		u32 preemption_timeout;
>   	} guc_state;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3918f1be114fa..966947c450253 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2147,7 +2147,8 @@ static inline u32 get_children_join_value(struct intel_context *ce,
>   	return __get_parent_scratch(ce)->join[child_index].semaphore;
>   }
>   
> -static void guc_context_policy_init(struct intel_engine_cs *engine,
> +static void guc_context_policy_init(struct intel_context *ce,
> +				    struct intel_engine_cs *engine,
>   				    struct guc_lrc_desc *desc)
Shouldn't engine be before ce? The more general structure usually goes 
first.

John.

>   {
>   	desc->policy_flags = 0;
> @@ -2157,7 +2158,8 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   
>   	/* NB: For both of these, zero means disabled. */
>   	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
> -	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> +	ce->guc_state.preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> +	desc->preemption_timeout = ce->guc_state.preemption_timeout;
>   }
>   
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> @@ -2193,7 +2195,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->hw_context_desc = ce->lrc.lrca;
>   	desc->priority = ce->guc_state.prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -	guc_context_policy_init(engine, desc);
> +	guc_context_policy_init(ce, engine, desc);
>   
>   	/*
>   	 * If context is a parent, we need to register a process descriptor
> @@ -2226,7 +2228,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   			desc->hw_context_desc = child->lrc.lrca;
>   			desc->priority = ce->guc_state.prio;
>   			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -			guc_context_policy_init(engine, desc);
> +			guc_context_policy_init(child, engine, desc);
>   		}
>   
>   		clear_children_join_go_memory(ce);
> @@ -2409,6 +2411,19 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
>   	return ce->guc_id.id;
>   }
>   
> +static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> +						 u16 guc_id,
> +						 u32 preemption_timeout)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> +		guc_id,
> +		preemption_timeout
> +	};
> +
> +	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +}
> +
>   static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> @@ -2442,8 +2457,10 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -	with_intel_runtime_pm(runtime_pm, wakeref)
> +	with_intel_runtime_pm(runtime_pm, wakeref) {
> +		__guc_context_set_preemption_timeout(guc, guc_id, 1);
>   		__guc_context_sched_disable(guc, ce, guc_id);
> +	}
>   
>   	return &ce->guc_state.blocked;
>   }
> @@ -2492,8 +2509,10 @@ static void guc_context_unblock(struct intel_context *ce)
>   
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -	if (enable) {
> -		with_intel_runtime_pm(runtime_pm, wakeref)
> +	with_intel_runtime_pm(runtime_pm, wakeref) {
> +		__guc_context_set_preemption_timeout(guc, ce->guc_id.id,
> +						     ce->guc_state.preemption_timeout);
> +		if (enable)
>   			__guc_context_sched_enable(guc, ce);
>   	}
>   }
> @@ -2521,19 +2540,6 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   	}
>   }
>   
> -static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> -						 u16 guc_id,
> -						 u32 preemption_timeout)
> -{
> -	u32 action[] = {
> -		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> -		guc_id,
> -		preemption_timeout
> -	};
> -
> -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> -}
> -
>   static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);

