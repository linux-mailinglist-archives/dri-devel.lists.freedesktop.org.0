Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F055EBF18
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 11:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CF10E109;
	Tue, 27 Sep 2022 09:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B8610E109;
 Tue, 27 Sep 2022 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664272736; x=1695808736;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=smhD8eiDcTsNIl6NfzXOL5oBYBM7IaPU/hb0NqWRpEQ=;
 b=RKrDgQjAxf51DT9gbeqciGPpP81GCCyP/4YcM2ss9sY0fGxzUeuR7zan
 phYIvDSos4ZO5YXJIx8MzOnLWb0TitiaoOZ8dg+hDc1nlSpaOxPTAVCQt
 1YMK5t6+zFwu4OFizht1X3ZfB2WjFsfyLHvMKKbasLxYRIexJ/f8Cxcls
 gwXr1G7Ok0g3WyQd5jTFvshqDH67KUgtrd/4mr/B+VpQwLaCKq5+4tfpr
 EroCNuA7afIgFfcQUAvmGUkHrB9XZnBtR9GJl6MaO4XSXKx9kM9HQDtHB
 tyPl/GyZkchUhGWGvK3Z+BUWFhLyAIq+kA1ofm8paTb4dnSsm/gcOUZGs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="299995617"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="299995617"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 02:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654667661"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="654667661"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 27 Sep 2022 02:58:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 02:58:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 02:58:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 02:58:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 02:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4LAcO72BeMQbS2bmYKziaNaXHFg8/qObRExWAABL4+pXDkGXOWMt2AZ5EV4YCq3ctVZaHGSMaF2HAsAM8MuzvVGo3R/41+LTGV3d6PA+RWdi5nfprYbx1RFkkwL2E2i0FcxwwNFtTJvt12BBfkX+OWdi9lSVL/kLhr8HJS7TARfBbZUPhJAA/NlgK6ZrZAPbDYmC9s2BKhyHNnFxdUMBdZXB+xMjEoAHlzQp2lm7gAgkEEEssQb3b7BSMW3TdFcBxXAUdAr4v2Gz1qY/FPTVEJcNMqG6yi4fRCpfLsbUhmwOXXvPS1Bvnb+HuAytj4/byrOaixkekWijLsl8ANLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmVDmTRVBUSw8K90gt3DDeDhsw5UjmjKlD8YMsulcjU=;
 b=aPTFPzpTK1ZKeG/s7+WrZaeq20gZNZbAhWhwrsmvKgMhOfKmvBs7SwtCFQb61lKnTdKuMcYZ5lc0hCiwXu6bWWPfQAzU/iAdqwlWl0HRbeFeaH8BtMfoi7+rtC0rEJ+LFLHgl/0NjdyosdLCinFxrebD7BkbaloR9lzuGNZg7FLOZaWHnreS1OapxMfAWBCw/jaU3agl6nOhu9gODiVXqZXlPxJyUdWDmw9G9VIEL6tlmx2uLUm6QKMKFuZsVWOHRdugUaTPDaeQbX/h7n01VWGRMEVfbzNRThb7o0pRfTCNUY5+6jYUHBwR7SbHJnMB3WXwKyBIin0K1sDywwf7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:58:53 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 09:58:53 +0000
Message-ID: <ebac5b95-6fd7-2eca-c9ee-4d09f7dd904e@intel.com>
Date: Tue, 27 Sep 2022 15:28:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 1/7] drm/i915/huc: only load HuC on GTs that have VCS
 engines
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 827f8134-1c23-4be7-dfe1-08daa06ee24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRLZQ/hZJdvj+VWPrG6TQy+5KpjrPlHOSKoXdXkZ6ZhEN4WxkeB7E8kIQzjI7LcPWmeo3adGTYK6MCd4ero9KC5QDX8ecIXqvvdKE6lRYYx2CgsqyqFUyIfXQLALLpWWpTOibcLLY4uPLEZ36UPVjHQt6oEkvxIJNRM2lyBd1R4+1QqXUyQfzQ8NxpzMLqR330qZ5RnpeR+5NPo5Z4poEZR5FBfPMRYKzWRnJhB+c9M23ls8JlsOEhOJ5WWqWgZ8j9w00/kOaxU8B6Os2wQbTFI3T9arqmwgeatTT1XMj2SX+GpgoIWnjlztG0etlHAVsJZ9WCj3vSVt2ALqGF0UBRIvLWDM1pKUc3J6ixSU9zUyEjnoTiRke/iQHQ+oopsz29R9dZb0luIutVTrIm4/IK54n8ccNvA675mzlUKTukPVLJctqhv8+fdCNJ4u/VAXJliznSFID1fze/AI9cT8UxgVT5lyO7Jzy8MSjWjkbfaY8cBB4Vmrjf+CvfE04rA/xPLDTNuout4HRr61CQJBlzq4/KTclDDOdADlUvnglC0ZTfn6n3F6DMjtx2GBta8GHvaB0ZItXNNLsvN9SiogBRVhx+m+JllXCi+sjpAvvkpOxUV089uN5lTWOfhaDQ+m9lVsT3FZKLjCsFvAEB13+dHWRhyVeO+fx2m4nRFJwAS9I928C+4FDpibsgdcxmMeHdaGcLytzOsW59btMTbxp0JfGJZJFNQxvgY/fiFK7oJ8gkjdi/SfLrDK0rGax27Dt28HRwj+i4gprNyAPgO8uVQGIccwAdcTB13ObRe4zlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(478600001)(36756003)(6486002)(31686004)(5660300002)(38100700002)(2616005)(82960400001)(66556008)(31696002)(86362001)(41300700001)(6506007)(6512007)(6666004)(26005)(83380400001)(107886003)(53546011)(54906003)(4326008)(8676002)(66946007)(186003)(450100002)(2906002)(66476007)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3l5dkladUJNaTZxT2taS2hURHVsekxqR1dmRE5POHIwTThkR0lVZFgvU0dE?=
 =?utf-8?B?bE5rZy9qVHhHSmtIZ3NJb01tNHBaa1AzL0NJNHFPU0hSdFNKY3oyOC9OK0t4?=
 =?utf-8?B?R1VqVGV2SGVqdVdCaTMxTE04OU1YSnVWa1JpTXFqVXYzbGorejdYaURCTlVm?=
 =?utf-8?B?VUJod3VEcFYwZWgwSk05c3NLSytLVXg3ODViRFV6VWxEWmkvcEl6T0w3Z0Zt?=
 =?utf-8?B?bldMZFJNbkZpSjQwQlFqcGwvRmJ1KzlTSUZ3d1NVaFhrTVVjY3daa01PVjds?=
 =?utf-8?B?bXY3c3gzRTVPR3hOLzZVa1ZYdVpTZGk0TTkyN1NTTXVxWjVwc05MN0MzWnZG?=
 =?utf-8?B?d05OcWV4QzRwRFRiWXpKblAzb0hWNlpjeUNKTERkbDBuK0Q1aDBPQ0VNM3gv?=
 =?utf-8?B?TlhjS09XckpidDdvd29lRkZNbkhNRkFzTUE5VGhDUzhHeWU2MUxrdmRNSWto?=
 =?utf-8?B?UnY3RVV5Mmh3OEQyTTdiSkVoQllYRlY0VkNWVFBxdGFrK3hSdHRVSDh6RmRm?=
 =?utf-8?B?anhWZ2NlT2FERW1xRE5uS2RRbWYxY0ljbEw4TXZXQlJ4TXppc1NSU0xDOTZi?=
 =?utf-8?B?NmRWcjBBNEdZV09JNEVVWVI5b2EyUENMejEvbTZxMEEvbXJER3I4dkUyclhU?=
 =?utf-8?B?Z2NQaXdqUllNSjV1amprRi9kMDZXQ1lQbWQ4SzUvdEh3SkRkVUJMek9tWFYy?=
 =?utf-8?B?UFBoRzZFeHNNQTZUNmROTGxiUGMyMkhtaWQ1K3FxcEduYVo0ZEhGc3ZGd21X?=
 =?utf-8?B?MWhyenVIc2R1Y20yNVNvRXJHZkVsdTlEcjdYaEx2NFo5d1ovY3JWeEZsb2wz?=
 =?utf-8?B?UUFUTWNvc2U4WUk4dGRiOUdEeXN3S0xLT1Y4WGVpRXkvcWR6SlJ0aDBLQjVW?=
 =?utf-8?B?a0lPYU5NR0hmSEpRbGZIM1gvSTFQTi84UTBFajRPL1VDYVdJakZHM1VybXIw?=
 =?utf-8?B?ZUo4MnhEZ212LzcyOXJiTWdOOVBQWHhXN1h6NUJ0bVlzNHEyMVB4UWQwUHlF?=
 =?utf-8?B?MzFPTy9nanJBZE83ZW5CSjh1MXdwSm5mS2F6Ni8xdUhmNGVhbVkvL3kvMW94?=
 =?utf-8?B?clVuY2FQdVlDaGFDQVhFYmY5ZmoyRkI2NkZsYk9Cbm1YUkxtWHVOVVVtRE8z?=
 =?utf-8?B?VVh3aFNiZUNNZytrcFR5QXRXaXZlT0hIemJKMXFtR0xRRXI4TDJMdy9yZTN3?=
 =?utf-8?B?NkR5a3kyc1dyRThqcVNRb2FHRzhnV2s0NGhvSjNWS1FmTm5PaDlPTDFFR1Rz?=
 =?utf-8?B?WndMQ0dYdzBvemxub1N4RHRSMnNmek10YlRtejlrdjlhVjZxN0szSzVUVHB3?=
 =?utf-8?B?aktUVzgvUCtWanBlSVk4NUZJNUt6VCt4b3lxZzFRVzBYdXhaQVZacGRBQndF?=
 =?utf-8?B?YkFNcDAvQStCZnc1cTNoMFpQY3lid0xwYS9kZ1FEQWtUcStBS3pZaDR0NVJ6?=
 =?utf-8?B?WW1vellLU0dTZ3FsL29IbkRQVmVuQ1FoRjRLRmo5YVM5RUZGbDJJcEdyNHFL?=
 =?utf-8?B?RDI5dmZVV0puVUdkbFhsNlp4UnhqWGFrZ3d3cFE1Q2Jxem5mRFhCbmpaSnlB?=
 =?utf-8?B?U2pZT20wbUFKR2I1ci9qV2htOGV6b1ZNNlZRbzQ0VDVZSm1qRGtvVFhTYVhT?=
 =?utf-8?B?RzhDQWVFMlVLMUNwdnFxaDZhTFRmcGNhZWRDUVVnUC95NlBYRUI4a0dJMnhX?=
 =?utf-8?B?T2JOR09ORHdiYk03R0RydC9mcDlkd3FSWTVXcFo5Y2VDZXFpM3hDZSswOE8x?=
 =?utf-8?B?ZGVLMDJPRlJEUnU2QzBUQktNN3VLS0tVay9KcVhKclNuZEE3NmIrei9FNk5S?=
 =?utf-8?B?dlA4TitwcjRHcU5Md0plUjhxS1ltYm1ZbE0vUEFZb2NJdUx0NGg1TW1OSm8r?=
 =?utf-8?B?c0NpOHhJcEhRTmc1Wk9uOE9sR3hFMUpyejB5SUdJMXl0SjE1c1ErQUk4cDVa?=
 =?utf-8?B?QUlrQk9QdjRjbTRZdklhSVVocldpMWwvWEhJMFluNnBrZVRlTzc4YUVsTU9D?=
 =?utf-8?B?cnR0V3YvKzBicW91QjZNbzA0YWl0cVoxTGE4b2hRWVlmYnp0Mzk5NlYrdHBN?=
 =?utf-8?B?N1ZvZjBMdE1pMWxDSGZJMDIxRCsyUEFlTFVxckw3eUNiK0dKWTE3aGlQOFFm?=
 =?utf-8?B?UmtIN29NeFJZR0FHdUlxWHhudFNzVkQxYmV4ZUI0NFdpNTZWYXQ5cTBPVmlF?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 827f8134-1c23-4be7-dfe1-08daa06ee24a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:58:53.3031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7q3D+vmIl8uAPiImr48orN2CGXb4VDkP8ZbxXCEM03EkGRUA7umuFXdMJKdJzG2Gy42aTIPV0SvvqJFWhnwqT9e6Xc5CKgSEWIEVUiZFm1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23-09-2022 03:41, Daniele Ceraolo Spurio wrote:
> On MTL the primary GT doesn't have any media capabilities, so no video
> engines and no HuC. We must therefore skip the HuC fetch and load on
> that specific case. Given that other multi-GT platforms might have HuC
> on the primary GT, we can't just check for that and it is easier to
> instead check for the lack of VCS engines.
> 
> Based on code from Aravind Iddamsetty
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drv.h        |  9 ++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 3bb8838e325a..d4e2b252f16c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -42,12 +42,33 @@
>   * HuC-specific commands.
>   */
>  
> +static bool vcs_supported(struct intel_gt *gt)
> +{
> +	intel_engine_mask_t mask = gt->info.engine_mask;
> +
> +	/*
> +	 * we can reach here from i915_driver_early_probe for primary
> +	 * GT with it being not fully setup hence fall back to the device info's
> +	 * engine mask
> +	 */
> +	if (!mask && gt_is_root(gt))
> +		mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
> +
> +	return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
> +}
> +
>  void intel_huc_init_early(struct intel_huc *huc)
>  {
>  	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
> +	struct intel_gt *gt = huc_to_gt(huc);
>  
>  	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>  
> +	if (!vcs_supported(gt)) {
> +		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
> +		return;
> +	}
> +
>  	if (GRAPHICS_VER(i915) >= 11) {
>  		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>  		huc->status.mask = HUC_LOAD_SUCCESSFUL;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 134fc1621821..8ca575202e5d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -777,12 +777,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
>  #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
>  
> -#define ENGINE_INSTANCES_MASK(gt, first, count) ({		\
> +#define __ENGINE_INSTANCES_MASK(mask, first, count) ({			\
>  	unsigned int first__ = (first);					\
>  	unsigned int count__ = (count);					\
> -	((gt)->info.engine_mask &						\
> -	 GENMASK(first__ + count__ - 1, first__)) >> first__;		\
> +	((mask) & GENMASK(first__ + count__ - 1, first__)) >> first__;	\
>  })
> +
> +#define ENGINE_INSTANCES_MASK(gt, first, count) \
> +	__ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
> +
>  #define RCS_MASK(gt) \
>  	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
>  #define BCS_MASK(gt) \

LGTM.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
