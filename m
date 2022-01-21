Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534854957BE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 02:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8529E10E547;
	Fri, 21 Jan 2022 01:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B9910E547;
 Fri, 21 Jan 2022 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642728906; x=1674264906;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kC1bOYMBdujGJjm+UBghrO2mso+fJnb1HIi/8nsZolg=;
 b=VVSbNFHuRtNRPi5/diGkDKyzxF3xqKAPg/opL5vIsgYPSIrqsGr3Vb1j
 tPYbRhlkTmSBAs9gc8bsYI7FBtQDS+5opWUh+5QEOfKbNXiVSWx+SJIm2
 QV4LwZRAeDV51SK0QzrfD54z/79wJmvXCW1+XeM7vRQ5wF3T9/pgy0FYv
 +CjSSZ5vhRK29JEj4WH7FwvLv0AnBGK4C/zfGCA1cy6lg04q1V/mma407
 ZlmHhoWlm+kihY7geInGh11aO7/MlGmsx0rHRx/16DP5Bs+1dX3jczZhD
 0UzNo1Jg4jbZ0x9I1cyZYHGR7xUU6H3e9t/WhPJm5YyCbF9tx+3hhtAxq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="232896609"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="232896609"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 17:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="595975184"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2022 17:35:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 17:35:03 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 17:35:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 17:35:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 17:35:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJJ5cuIj2XJ9yRDFNmnbqyUumsS5DkMfz7BU9FnAu24JhFBFE3K0imd+2+NsfAroAw7wW67WYQ985GA4T72Yf9s2pErDJy9JkARejDUgwg2h2uB4rHlDEF1KvUIMZ5NJsfRr4w0Pjcn0E8I32gSjjveKX3Yki8RiifQ/p1bwyucaG0TVVKtov2RbOeHzKGYGtdnABwxyOYON1ii+osPDrT22vCZJc8jlbHs8pkJGF5tXJTnu/GHohdZqP63wWy+c10982mLp4ndel7HNigtIxZU6ki4gi0Z53EqtZg0QQEDMCfDQMAUpMfmpw8xVpA61mEe52HrNC0CKzS4VwGY3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JAKIHjFg33OihF+lats59BMgsse4Jbcd7ONIxUOuys=;
 b=Opzj6XTjcfHxA3dRIuQFKI572oyN8bObLwOSlkGccVlhA/95cbbRIBiZ/oWSKQDPuQzVNc/6/WGX6q0HTfmFufgzcZLsG3mnZsTAf7QWfCLf9NJ7ScNMWrMue/cYuyIS6YXyXdJSwAaV/T6/ywTtVKhhuUtCMwVYcDMJ8O4iI2Uvg/a5/jJt2uSncj7Gw4A6EKqsl2NM47fQSg5As74Dd3Elu5oqS/Vad9J7/1j7FO5l9LBUxTV1AgjH9ZWNHYEbaGHHMZhzV2dEaU/WAIVxwlAL9odDybyyRFmfw8uVBHDVTyVq4SSST6s04yXEanq8wReE6fn4pDT79G4lvxx05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 21 Jan
 2022 01:34:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 01:34:57 +0000
Message-ID: <4eecb7af-245c-60aa-2eed-0dbb54e65189@intel.com>
Date: Thu, 20 Jan 2022 17:34:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20220119212419.23068-1-matthew.brost@intel.com>
 <20220119212419.23068-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220119212419.23068-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:303:6a::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4f7ddeb-9073-42d3-a55c-08d9dc7e3b65
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB290194F84F21F08DD3CD9DAEBD5B9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4sY7x9HKuE+k9QsUPRlr22zAVFKRw9gHOUUb86Fkgd6NWnBrV9ZVubCNBGqTm7Jr/MbOUpu0996NHpcQ1YLF3Dx+FmjWe4C662PDdj5n7kA9Vw4HHpXMgP298TpkDteFkz5HxKWxZH1Ab/3ZPq+dPDqhkt6HzKDWWoXN0bnGttk+Jkk+DoRw2MTIF5bKmrw0GOfXq7j4UxFG+3YwgbVEuV5YdTDhW+XT8gApX5NuwD8DoEUBVX/Bhlwbekfp3trgDguwLJCDYpz9Gv6ugImNrJEGHZxRVBDw6kNtU8aNLDC9kLxu/FP8kXLerDksobfw+P8i2ekSTEBHGI2OQv+NFoyTvjLxoRK/5XLzUHTeZ721JxakZw3NcSSL3+zvzQZbKTHxVJfk4pap3KTfLBwG+k/y1iJr71Y3oDi2s/FL5iHWxmw8SgvcAAl4Brbo0TozWEixZi7u7Se1NijMrW4Rd70Ahk+I16yEpCuHTLb5QLLP6gA+7i6O8tz1wuGXBXk2J8cELt/7uoXjPSRHjN9HhTmLa38C5soflcx6SA/hm+KuWH12Q/JJe2ghOppAnRBxvwhEzN6yjM8bp6J9kJXBdYxmuqlgrUsjRdM5n9C8/eC4N1NjPdAde5KC/uG4+ZCoJWGNLDkZE3T12UZbGWnc5Wxjmsc2V7VmhEIeIjsMV72IvfJ/Kdm/XGEis/KLnDcIrJ5kviKmep/I0JpzKxBUBv1nYuTQtcjVo1GINl2upaBaN0Q+e3Eu1zBiKsLNGq7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(66476007)(6506007)(8936002)(36756003)(508600001)(186003)(66946007)(66556008)(26005)(2906002)(316002)(5660300002)(2616005)(8676002)(6486002)(38100700002)(450100002)(6512007)(31696002)(86362001)(6666004)(83380400001)(31686004)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3ZFMDlPa243cW5zbVk1SGREMmladks2K0Z4Vnc0WUNCZGlQNmVoaTVuY3Vq?=
 =?utf-8?B?VHlBZ2NaclFQb0RGbnFQaWlBdDlzc2hmWThIemhJL2ZyMkJyWDBWZ3c4S2ZN?=
 =?utf-8?B?Ky9aUTRWNkg0KzlQZmFGQnhzNlhKemZLV2Fmb3lxdURrMVQxRnBUUHFtN2hW?=
 =?utf-8?B?NmxNMEFkZHY1M1lKQUwvc1JCb1VmWEViaDh2QVV4TUhBZzRWQTJ4YTNCWWlq?=
 =?utf-8?B?WnVYUVNMRmIzaXp3NWdhL09Ja1J0VXFTaWwzaHIyQ1JTNzEyT1VLUkw0alRZ?=
 =?utf-8?B?NkdwcHdBM1orSjFMcFRDUi9FbXZOWUdkUTBscERhZnpsbWNjMXlmbTlUQWhq?=
 =?utf-8?B?RjRZQWRyZ1NHaTJYcTdQc1VQdTI2ZXcyTjZRTGRsQ0lEZ2JKOXM1RWpiZG5p?=
 =?utf-8?B?ZjgxT3l1YkJlNFN1MEFFU1UxMmZselMrUURzUWtOZ2FIYVEzenA1bnJxQUhj?=
 =?utf-8?B?amw2YWJWanZWbmt0b0pGcElhcjBLM3l0WGgyMTB0NUNSaVZSWkhWbHR0eDlG?=
 =?utf-8?B?SFhxUjlZdTNwQksyRS96cWtCTlgwNmUwOG9GRVZUaTY0bzV6UWpzM3Vqamlu?=
 =?utf-8?B?Zm5Gd1kxeVF0OEhxdjRVcGQzWWRpM2NEREJ4b0lJbmlhQit2eHBDclZiYmRq?=
 =?utf-8?B?cGtlNk5lT1h1S0N2TFdEUlRoZGxSMG13S0M0S2tzdlpoSWpQV01DYUpDb0VC?=
 =?utf-8?B?ZE1xOW5IOWd0RmhDMjBMTVRuZDAyNVVKTC9QaEJXNzBNZDl4ZUJhT3dBOFhE?=
 =?utf-8?B?ZHRyWmtxVk5nV3VlSklQNEpQa0J3aW9vZjFCTVhLNks4elVkQThYSW01Q05x?=
 =?utf-8?B?YjZNQXNSaU80TE9rNDYwMFhlMGhyalNlOHlkZG41VU9tc3VVa051VXgzSVN1?=
 =?utf-8?B?R1dUUlZFOXBYK05KQzY0MVRYTThRT0s3QXQzMGFKUHduWTBGL21JVHg0ZDBO?=
 =?utf-8?B?STBWS1pqMUZsZm1kUytOU05PTFZjK2dqMUV5LzNKRm9oblQvdlovbVRSWlI4?=
 =?utf-8?B?Rld3NXZMQzZPaGtycmFtM1ErYlh3OTNCUG1vYkJ2R3NUOXhONDE2VFlLZDFt?=
 =?utf-8?B?R2dYVGNpWTNlWEdrWE95d2cxT3NLUlZOS21ha0kvbEVkMjVSQXR2bHNZa0xC?=
 =?utf-8?B?MTVFVWIzdmlTM1plY0IyM1FOMmxkS0gxRXdYWWFBWWFiT3k2aFZXdTJvTjN5?=
 =?utf-8?B?V01BbGxqRGhFc2NsU0JnSDllYSt0QnBwRmxQVjAxNVlZL0xPNzNEQ3A2UG8w?=
 =?utf-8?B?L2dJcjlwYWxzQkYrdTFlZmVJY3JUT3AxczFzbytTZ09pRFcrVVQzQ3JZV25n?=
 =?utf-8?B?NGZqMDN1U0pFNlk1eGlYSnROMkpUVHR3SXQ0eWROemo3MXlvMkRhelhvbEt1?=
 =?utf-8?B?YmJqVTNCVm8wWkJSVU1ZTklLNUgrMlNCZllPbFdKYXhEVlhJTGpnVDMxYldK?=
 =?utf-8?B?b0NSakJwalVvRVZ3UEFlUGRZM0JrYTQ3UjV2cG0zRUdrcCtpQnZrTEJSZzF0?=
 =?utf-8?B?eUg3QmtJS2hwVytxeGY3Ymg5MXRONlMvR2g4alIxYUFtMG9wNGk2bkJFQUt6?=
 =?utf-8?B?bHZOVmVPbFhvY29PUzd1NTFBSUFPbitpYks2cDlHenlSZit0Zm1LZXIrRFZX?=
 =?utf-8?B?alFhK0FSMi9XN3NodjdFRHA0eEg0WVJpblFPKzdtZGpKK00yTUszamxhUVRL?=
 =?utf-8?B?M1pvaHBBNUlTMVBlVW5Kd05LYVpocjVpcDZpSnNIbGh6QmJybFBORk14N0hs?=
 =?utf-8?B?aXFiVXNidHI4WFVwc3BaYUovQU40SnZyNUFyRWE5YncrVUo4ZjJXMUxBQnV1?=
 =?utf-8?B?OXhvVUJmYnVpVm9mNFVMM29MYzFraUdtayt4Mmh6OXd2Mlc2enRaRm10N0Fr?=
 =?utf-8?B?M2ZwU3dhOVJwc2oxbmV6U2NqVjlxTmx5czhTb1JKVkxjQjVTYnQ4SXlKZ1Jk?=
 =?utf-8?B?VVd6eUFmenZKUk5CNGpJNzdvSVJyRmNoTEVQNUQwTFU0S2xKUlMyR1JqMFhM?=
 =?utf-8?B?NGJJeUJpOU5UMkVhaFhrazRuUndIRkYyYlpsKy9wUEc0a3JXMUMzUDhjajZs?=
 =?utf-8?B?emJlNGRLT1NiUlJJMGU1RjRjMDhYRDI4eG5EWU9TbFVmWStzR201VmhSbVE0?=
 =?utf-8?B?bjcrSzM1V09ibUdScXh2ZWdNaFp5WE5KWk1odENwNm5UMWpHaVBrbmw0Rm8w?=
 =?utf-8?B?QmpmL2VuT3liaUVsVzJMUlpLS3AzTHJzM01CL3l6ZWZMMnFnRU5xRnR1K3BD?=
 =?utf-8?Q?iE0cd/RCkdmaDj4u0lnIzD7CCJhEK4eY/OqNXLM/dQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f7ddeb-9073-42d3-a55c-08d9dc7e3b65
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 01:34:57.2018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuoHCD1WevAe+rCJQ2zEP3ZzNrhShIHeNhHhbQIStNqacYNGUZiR9KsA1E6PJ//QlDTfB/d7sjw28USMqm0ujzqLFfIFTdQcPGOtb33h6sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/2022 13:24, Matthew Brost wrote:
> The G2H handler needs to be flushed during a GT reset but a G2H
> indicating engine reset failure can trigger a GT reset. Add a worker to
> trigger the GT when an engine reset failure is received to break this
trigger the GT reset?

> circular dependency.
>
> v2:
>   (John Harrison)
>    - Store engine reset mask
>    - Fix typo in commit message
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++++--
>   2 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 9d26a86fe557..c4a9fc7dd246 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -119,6 +119,15 @@ struct intel_guc {
>   		 * function as it might be in an atomic context (no sleeping)
>   		 */
>   		struct work_struct destroyed_worker;
> +		/**
> +		 * @reset_worker: worker to trigger a GT reset after an engine
> +		 * reset fails
> +		 */
> +		struct work_struct reset_worker;
> +		/**
> +		 * @reset_mask: mask of engines that failed to reset
> +		 */
> +		intel_engine_mask_t reset_mask;
reset_fail_mask might be a less ambiguous name? Same for the worker 
struct and function.

John.

>   	} submission_state;
>   
>   	/**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3918f1be114f..514b3060b141 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1731,6 +1731,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   }
>   
>   static void destroyed_worker_func(struct work_struct *w);
> +static void reset_worker_func(struct work_struct *w);
>   
>   /*
>    * Set up the memory resources to be shared with the GuC (via the GGTT)
> @@ -1761,6 +1762,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>   	INIT_WORK(&guc->submission_state.destroyed_worker,
>   		  destroyed_worker_func);
> +	INIT_WORK(&guc->submission_state.reset_worker,
> +		  reset_worker_func);
>   
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> @@ -4026,6 +4029,26 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
>   	return gt->engine_class[engine_class][instance];
>   }
>   
> +static void reset_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc,
> +					     submission_state.reset_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	intel_engine_mask_t reset_mask;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	reset_mask = guc->submission_state.reset_mask;
> +	guc->submission_state.reset_mask = 0;
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +
> +	if (likely(reset_mask))
> +		intel_gt_handle_error(gt, reset_mask,
> +				      I915_ERROR_CAPTURE,
> +				      "GuC failed to reset engine mask=0x%x\n",
> +				      reset_mask);
> +}
> +
>   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len)
>   {
> @@ -4033,6 +4056,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	u8 guc_class, instance;
>   	u32 reason;
> +	unsigned long flags;
>   
>   	if (unlikely(len != 3)) {
>   		drm_err(&gt->i915->drm, "Invalid length %u", len);
> @@ -4057,10 +4081,15 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
>   		guc_class, instance, engine->name, reason);
>   
> -	intel_gt_handle_error(gt, engine->mask,
> -			      I915_ERROR_CAPTURE,
> -			      "GuC failed to reset %s (reason=0x%08x)\n",
> -			      engine->name, reason);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	guc->submission_state.reset_mask |= engine->mask;
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +
> +	/*
> +	 * A GT reset flushes this worker queue (G2H handler) so we must use
> +	 * another worker to trigger a GT reset.
> +	 */
> +	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
>   
>   	return 0;
>   }

