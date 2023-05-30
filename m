Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7E717100
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 00:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0549210E070;
	Tue, 30 May 2023 22:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFEA10E070;
 Tue, 30 May 2023 22:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685487185; x=1717023185;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jVfpC5hgfKduOtcMrW03+S9eM0wnXJFI/6FSSBQJ24M=;
 b=COSuYw6UcPrRmnPx8R/Pj2nfjVSAB9/nugKX62jRsEp9M0VCMLW+I06S
 R3nzkf7mY8FSQ3PrQkCwh/0yzA7fGQIa7U3oh8Rn5xuzr634h2kCsX3+5
 jqxlLEe9Bu3Q0fEt1jk1utv/SV53/13ZvM3F+kDjO37wvz1yNuKBQPZAU
 m1ELnMifxE/0zkeECjgBpcCi9hHcYX/Z3iXBJQ/qiKNTXVXktNb8lmUDY
 mLE/BB/ah2SL1IG2gaY/bfDr40tGgN+cvhun3m6s6+nZHlIDCultPBCfg
 pl2G/sEO2qFYjo7JQM1sH5xCuqtE4SmJe/2PK9E15mn4rXphS7/ErIlLb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357454354"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357454354"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 15:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="700822792"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="700822792"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 30 May 2023 15:53:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 15:53:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 15:53:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 15:53:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvaOwL+smkjBbraftQVZaboiMDLH3USGqH6KJhp0v0fSj3e3CwEIYyvo63c41xl7xmFd2f9YE720A0hYyK0dbrddzoedXV52LcxU1zYOhgy6mFUAGM4QpTp+2XhA01r6CqtK30HPYVEnb0vgZIH4YiGijyhWfXQg8umBkDcZeIYCJQVWeLO7Kzb4MHcCkf1F+SP3Ip7uhGNMPzmxsjldM0IiCIv+ctygCYzWqzivbFpD+MiFF/HhkDxCyxkTOSnxD1x3HhKEhwNY49oU+DzSTsW/GTAMnY8fTrN04dSYD1f/JacnFVQ5iraTYzYggctnw1OVUMis4LaAYwz0FG7kOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN9HZFPZZRSJ3dEYr7JwKVbpGiNt3Yw8cOYQL2c8vrI=;
 b=AxndBnrWGILUkJ3RTkwI551oysIu+icYUVs6F8KKZ71cMZdN9RbL2spLZI15VZFFWVGxnygeGQbqbPtEs7hWPNfeOb61vKBMBd4quw40UGsbbchCUNuLW9w3oDtEoBGF1vbtNYFrPpq3Qa5UCMwPfdvCxr9rZ5ghxWYihPb2PoKt3iVbbVS6sqHI4K0K9DbXV1Zo3KZ4yOg0HpCAefUbkWkOiOeZ6rYZyIMRc+vrWPjBbVCQ/ZfBlTtWS/JC2KuJwUcRMq2K6nAuT/uosh+ukMB2Db/8l4nufabGgqiasaSuu4ifWj3KrWnAWjPrechVrTHs/XDxQKJVHLSDfGmb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 22:52:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 22:52:55 +0000
Message-ID: <bec467cc-e934-4b2a-385d-84ce7e76d2a4@intel.com>
Date: Tue, 30 May 2023 15:52:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/7] drm/i915/uc: perma-pin firmwares
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-2-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230527005242.1346093-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 92560afa-351c-46e3-2ff1-08db61609b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jc3rgXyCivZMap5HrVqkJNt7CQTPOJRoMSCkBiNgR2JBy3e9KlhKT3tVXRtb2HD4FqwO8Dc32cnqvRZ1VMoVBnUjPSBJRE5Gae5yPk+mVCF99fm/QaIPW4wNK5KyZP5Qt2BdQAWOoip5pyDy6SjvZMi0jn+T9AnzNdQVR2/x8xPKLcbGQnt+vyhT3fe2S/BVWJViR3mwKtjdvgN89K6DU5Ngsi8L+N+mLSl4relKD8YxzWQnVhluO2ueHkBy+7R2CW6tRr/cSvwO46HrPIdPgiNUhLMWRCE0Be+JxNkPThDhHexma+qVHbmsurLqPqNOJ4cGAC9BnDlhcUf2XT7SQFUH+qgz9GvS3U7o/xfF94WP5RlIY+aQLqqI2MlrC8YccvGcQpDeh8icA/x5lxWrK0SbsmjOiEuDn4ZNb1IbIzsEQEQHGpTUbGzsJO0mcHX2nDGC2F4itKzJtP7+DddzwhEJc4yA9tRjA/+To14Zz4ZHCD7twBEH4OdNo3vRx4b9fGoAgkajTc1mhwgPOLd5hGOr94yxixNP6Cn/YVZcRZ47LUvsjPPD/sbzZEO0dUNZizSpLrC7PP5HI2CRgLRbIFSqYUUp4QglqSm0V/rkf8xLh5H2sG+m2byS57mVgs6pB+F9orJRR50a34VCIHQmMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(86362001)(83380400001)(36756003)(316002)(5660300002)(66556008)(6666004)(66946007)(66476007)(107886003)(450100002)(4326008)(82960400001)(31696002)(41300700001)(8936002)(8676002)(38100700002)(6486002)(30864003)(2616005)(53546011)(2906002)(6506007)(186003)(31686004)(6512007)(478600001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxuTk9jRnA0ZEp3WTlYNUFwUkgrOVRJYlpNNXFXbDlRV2xUeTlBcE5UcVZJ?=
 =?utf-8?B?ZUl0eWRJZGFvS0RtYy9VczF6bTM2aUFjN0M5VXBwWXZDaU5jL1FjNlVEMTVn?=
 =?utf-8?B?NXJaNkN4VklycHJKMW5pN1pOS2JJZTYyanVJWFFRVkY5UVZJelVWWml4K2gz?=
 =?utf-8?B?NE8zM01QRjBycTBCdkpRa3MzYzJoaFc1cVN2SUtQUnVBS2VoOWcrdjZpMU5Q?=
 =?utf-8?B?bWRMSnRMdGJSS3JVeFFxT0l0aFFqSEZvcWkrd0VheURMejVucjY3OFA1dUFW?=
 =?utf-8?B?bGRBSDlRS1JzR3pGTnpFVDdkVkFndTlVZnkzMmMzclVRc0lGbVVLSWUyRk1m?=
 =?utf-8?B?dzVJRVFFRmR0RTdTZUcwb1FnT0UyL3ZVZzRiWjdTK3o3WVkrOWp3NzBjM0NM?=
 =?utf-8?B?ZGRGZ211bTJBTlZBUktCY1oreUFkOUYrN0JleGlKWFJTcThBSGtHR1BtcEF5?=
 =?utf-8?B?WGVYNVNpa1VvenQ5VDd2Y29lQ0FDTjVJRHB6MTVSZnl4TGxNUGV4SlZoQ3k0?=
 =?utf-8?B?VVdWc3hmUHVIMlp1L2NiMWlDRzhDeE1CZld0UFRFSTRQc25kTzllUmJ3KzN2?=
 =?utf-8?B?aVl6SnZNRDV2cHhVZExOTzVwOHMxTHZXQVMxbFFmS2RJQnJJRTFGL0Q3MzRN?=
 =?utf-8?B?b24vYWg0bnFEb2ZnSWJpeGNOUENnajF3WEx2SmRlbXdVR0diTWZGNzBaeTVJ?=
 =?utf-8?B?V0lUUDU1a0VyVmFrNTRGK0J1Q1REdmY1STY1M2hLL3Ivblk0SlQ4RlExaHlF?=
 =?utf-8?B?N0NWY1R0ZXM4ZG5yMzRBVktqZnNKZkphaXV5UnNxRVdGb3FnL0J1R2JBSkNj?=
 =?utf-8?B?RDJDM3ZEdmpaRUoxUUVtbThZNENIV25tVmQ0TW5ZWUVhOWhRNVh5NithdVo3?=
 =?utf-8?B?TVIyVWZ3ZmduVzNwWlF5RGxnc20vV28wSEp4T2FGS2VhQnZYbVY4K29FMVQ1?=
 =?utf-8?B?OVBWTXd2MVdaalBIVHhCK0xWbnRYSUtyTHZxZFFzV3JJTGczOHhtSXZSWjRX?=
 =?utf-8?B?MCtLQjVhR0t4WkVDQ00yTXp4bXk5V09iVjhzLy8rQW1xL1puQjdHY3d3MUxh?=
 =?utf-8?B?dkVSK09wSUY5RXVtMHhCb2FRVGdKN016U3l3WVk0ZkpheGV3NE5ObThMQjV5?=
 =?utf-8?B?MTJaMXFRZXdqZ0dDVGhvSW1WZWo0YzVSNDhVU3hUOWRFTXVaQThYZ3VXdlMz?=
 =?utf-8?B?THQxcWtZSGxKdktKQk12Z3ZxV21Qa3dVaFVqaWhlbERoMzk4L21KelhXVkdo?=
 =?utf-8?B?eEZiTDdTU1dJZTh6WG9vZnJLdjc2bWxwRm5wcDdWQmdSZmYzYzUxM3VWd1dt?=
 =?utf-8?B?d3lleTNtSzNCOTNQTElaZ3JwYXAyTXhZOXBhWnNvVU9wZktLY1pRUmdwbE8y?=
 =?utf-8?B?bUF6S1ZHemZYRmdidkM2SFlEN24rMlBsaXVMMThoMllnQ25ldU5OMW16OSt4?=
 =?utf-8?B?YnRRbkVrZEJJYXppbzhmc1pLVVF6c2ZxSHAyWW0wNEZ5d3dsSXhUb0tFNVJi?=
 =?utf-8?B?Q1E5QS9BalRwcVNtY3JNQ3lzUCszYmJvM0FkN2dkL0N3L1pTWWxEZjFiZEdE?=
 =?utf-8?B?ZjhUa0xQY3V0ZDhrdE1uYXpqQXNHVTdTMGFvb3N2aWpvUFNUeTVOVDZ6MWt6?=
 =?utf-8?B?ZU1KWW1qcWZXS0E2Y0NSZHNONEYycTF1ZDRjK2VtNUJqL0VqMTZtS3dsVXJM?=
 =?utf-8?B?YWROQ1g4bVVsMEk0bzlOakNKRGNGbnNydTM1M1kxd3E5TXFJNm1YME5ERlF6?=
 =?utf-8?B?VnVFd1Z5dlFyaUJwS2R0dEpPR053bFBDeEdIWTN4VWdrd2lJSVQxWkRxVk9s?=
 =?utf-8?B?SmYyVW1WZDR0YkhRNFpsYXlHYmZkME8xS3JUZ210R00ycmN6bmhaOE1Gd3Jn?=
 =?utf-8?B?a1ZPNUxpTVQvWHRyUHdpTUI2SVE5OEFLRnBORFRhb0syM05zZUd2N1d5WnJq?=
 =?utf-8?B?djAyYjdhQzZPbUlSaytxZlUvZ202MEJtV3lKSkMrRVowVXJ3NmM3UE1NejNC?=
 =?utf-8?B?aTBHNG02Y29YTVZQZG41Q3ZXbVdRU1VZMHhaSzVqTzF6MURsSklVWmdkUkpk?=
 =?utf-8?B?WUFXWWxYNmFSTUd1cFdldUxsU1hUQlQxRGdvQ1JvbDQ5QWJLSFoySWZNbEkv?=
 =?utf-8?B?cU9SOEdDQ21UTkdCV0dmVzE3SDhLUTJ0MWxkVXhyTmVMMWE4U05rNVRMdFZw?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92560afa-351c-46e3-2ff1-08db61609b20
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 22:52:55.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHHx8bmRBjy5TsXDnG4s6dITXpVuXImUAZbCOm7wHQ8+XhsJzAkoNNUmpAbbZjiykok/VHHMvzi/zlYhs7BfzLrWGFXewNET9OtoqKK6HA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
> Now that each FW has its own reserved area, we can keep them always
> pinned and skip the pin/unpin dance on reset. This will make things
> easier for the 2-step HuC authentication, which requires the FW to be
> pinned in GGTT after the xfer is completed.
> Since the vma is now valid for a long time and not just for the quick
> pin-load-unpin dance, the name "dummy" is no longer appropriare and has
> been replaced with vma_res. All the functions have also been updated to
> operate on vma_res for consistency.
> Given that we pin the vma behind the allocator's back (which is ok
> because we do the pinning in an area that was previously reserved for
> thus purpose), we do need to explicitly re-pin on resume because the
> automated helper won't cover us.
>
> v2: better comments and commit message, s/dummy/vma_res/
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c      |  3 ++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c |  7 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  8 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h     |  2 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 50 ++++++++++++++++-------
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  | 22 ++++++----
>   8 files changed, 71 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 2a7942fac798..f4e8aa8246e8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -1326,6 +1326,9 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   		ggtt->vm.scratch_range(&ggtt->vm, ggtt->error_capture.start,
>   				       ggtt->error_capture.size);
>   
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_uc_resume_mappings(&gt->uc);
> +
>   	ggtt->invalidate(ggtt);
>   
>   	if (flush)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index fb0984f875f9..b26f493f86fa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -90,7 +90,12 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
>   {
>   	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>   
> -	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
> +	/*
> +	 * GSC FW needs to be copied to a dedicated memory allocations for
> +	 * loading (see gsc->local), so we don't need to GGTT map the FW image
> +	 * itself into GGTT.
> +	 */
> +	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC, false);
>   	INIT_WORK(&gsc->work, gsc_work);
>   
>   	/* we can arrive here from i915_driver_early_probe for primary
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index c9f20385f6a0..2eb891b270ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -164,7 +164,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct drm_i915_private *i915 = gt->i915;
>   
> -	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
> +	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC, true);
>   	intel_guc_ct_init_early(&guc->ct);
>   	intel_guc_log_init_early(&guc->log);
>   	intel_guc_submission_init_early(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 04724ff56ded..268e036f8f28 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -276,7 +276,7 @@ void intel_huc_init_early(struct intel_huc *huc)
>   	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>   	struct intel_gt *gt = huc_to_gt(huc);
>   
> -	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
> +	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC, true);
>   
>   	/*
>   	 * we always init the fence as already completed, even if HuC is not
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index c8b9cbb7ba3a..1e7f5cc9d550 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -700,6 +700,12 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	}
>   }
>   
> +static void __uc_resume_mappings(struct intel_uc *uc)
> +{
> +	intel_uc_fw_resume_mapping(&uc->guc.fw);
> +	intel_uc_fw_resume_mapping(&uc->huc.fw);
> +}
> +
>   static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>   {
>   	struct intel_guc *guc = &uc->guc;
> @@ -767,4 +773,6 @@ static const struct intel_uc_ops uc_ops_on = {
>   
>   	.init_hw = __uc_init_hw,
>   	.fini_hw = __uc_fini_hw,
> +
> +	.resume_mappings = __uc_resume_mappings,
>   };
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index d585524d94de..014bb7d83689 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -24,6 +24,7 @@ struct intel_uc_ops {
>   	void (*fini)(struct intel_uc *uc);
>   	int (*init_hw)(struct intel_uc *uc);
>   	void (*fini_hw)(struct intel_uc *uc);
> +	void (*resume_mappings)(struct intel_uc *uc);
>   };
>   
>   struct intel_uc {
> @@ -114,6 +115,7 @@ intel_uc_ops_function(init, init, int, 0);
>   intel_uc_ops_function(fini, fini, void, );
>   intel_uc_ops_function(init_hw, init_hw, int, 0);
>   intel_uc_ops_function(fini_hw, fini_hw, void, );
> +intel_uc_ops_function(resume_mappings, resume_mappings, void, );
>   #undef intel_uc_ops_function
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index dc5c96c503a9..31776c279f32 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -471,12 +471,14 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
>    * intel_uc_fw_init_early - initialize the uC object and select the firmware
>    * @uc_fw: uC firmware
>    * @type: type of uC
> + * @needs_ggtt_mapping: whether the FW needs to be GGTT mapped for loading
>    *
>    * Initialize the state of our uC object and relevant tracking and select the
>    * firmware to fetch and load.
>    */
>   void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
> -			    enum intel_uc_fw_type type)
> +			    enum intel_uc_fw_type type,
> +			    bool needs_ggtt_mapping)
>   {
>   	struct intel_gt *gt = ____uc_fw_to_gt(uc_fw, type);
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -490,6 +492,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   	GEM_BUG_ON(uc_fw->file_selected.path);
>   
>   	uc_fw->type = type;
> +	uc_fw->needs_ggtt_mapping = needs_ggtt_mapping;
>   
>   	if (HAS_GT_UC(i915)) {
>   		if (!validate_fw_table_type(i915, type)) {
> @@ -755,7 +758,7 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
>   	if (err)
>   		return err;
>   
> -	if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
> +	if (uc_fw->needs_ggtt_mapping && (*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
>   		gt_err(gt, "%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
>   		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
>   		       (*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
> @@ -940,29 +943,32 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   {
>   	struct drm_i915_gem_object *obj = uc_fw->obj;
>   	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> -	struct i915_vma_resource *dummy = &uc_fw->dummy;
> +	struct i915_vma_resource *vma_res = &uc_fw->vma_res;
>   	u32 pte_flags = 0;
>   
> -	dummy->start = uc_fw_ggtt_offset(uc_fw);
> -	dummy->node_size = obj->base.size;
> -	dummy->bi.pages = obj->mm.pages;
> +	if (!uc_fw->needs_ggtt_mapping)
> +		return;
> +
> +	vma_res->start = uc_fw_ggtt_offset(uc_fw);
> +	vma_res->node_size = obj->base.size;
> +	vma_res->bi.pages = obj->mm.pages;
>   
>   	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
>   
>   	/* uc_fw->obj cache domains were not controlled across suspend */
>   	if (i915_gem_object_has_struct_page(obj))
> -		drm_clflush_sg(dummy->bi.pages);
> +		drm_clflush_sg(vma_res->bi.pages);
>   
>   	if (i915_gem_object_is_lmem(obj))
>   		pte_flags |= PTE_LM;
>   
>   	if (ggtt->vm.raw_insert_entries)
> -		ggtt->vm.raw_insert_entries(&ggtt->vm, dummy,
> +		ggtt->vm.raw_insert_entries(&ggtt->vm, vma_res,
>   					    i915_gem_get_pat_index(ggtt->vm.i915,
>   								   I915_CACHE_NONE),
>   					    pte_flags);
>   	else
> -		ggtt->vm.insert_entries(&ggtt->vm, dummy,
> +		ggtt->vm.insert_entries(&ggtt->vm, vma_res,
>   					i915_gem_get_pat_index(ggtt->vm.i915,
>   							       I915_CACHE_NONE),
>   					pte_flags);
> @@ -970,11 +976,13 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   
>   static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
>   {
> -	struct drm_i915_gem_object *obj = uc_fw->obj;
>   	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> -	u64 start = uc_fw_ggtt_offset(uc_fw);
> +	struct i915_vma_resource *vma_res = &uc_fw->vma_res;
> +
> +	if (!vma_res->node_size)
> +		return;
>   
> -	ggtt->vm.clear_range(&ggtt->vm, start, obj->base.size);
> +	ggtt->vm.clear_range(&ggtt->vm, vma_res->start, vma_res->node_size);
>   }
>   
>   static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
> @@ -991,7 +999,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>   
>   	/* Set the source address for the uCode */
> -	offset = uc_fw_ggtt_offset(uc_fw);
> +	offset = uc_fw->vma_res.start;
>   	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
> @@ -1065,9 +1073,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   		return -ENOEXEC;
>   
>   	/* Call custom loader */
> -	uc_fw_bind_ggtt(uc_fw);
>   	err = uc_fw_xfer(uc_fw, dst_offset, dma_flags);
> -	uc_fw_unbind_ggtt(uc_fw);
>   	if (err)
>   		goto fail;
>   
> @@ -1171,6 +1177,8 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>   		goto out_unpin;
>   	}
>   
> +	uc_fw_bind_ggtt(uc_fw);
> +
>   	return 0;
>   
>   out_unpin:
> @@ -1181,6 +1189,7 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>   
>   void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
>   {
> +	uc_fw_unbind_ggtt(uc_fw);
>   	uc_fw_rsa_data_destroy(uc_fw);
>   
>   	if (i915_gem_object_has_pinned_pages(uc_fw->obj))
> @@ -1189,6 +1198,17 @@ void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
>   	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_AVAILABLE);
>   }
>   
> +void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw)
> +{
> +	if (!intel_uc_fw_is_available(uc_fw))
> +		return;
> +
> +	if (!i915_gem_object_has_pinned_pages(uc_fw->obj))
> +		return;
> +
> +	uc_fw_bind_ggtt(uc_fw);
> +}
> +
>   /**
>    * intel_uc_fw_cleanup_fetch - cleanup uC firmware
>    * @uc_fw: uC firmware
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 6ba00e6b3975..2be9470eb712 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -99,13 +99,19 @@ struct intel_uc_fw {
>   	struct drm_i915_gem_object *obj;
>   
>   	/**
> -	 * @dummy: A vma used in binding the uc fw to ggtt. We can't define this
> -	 * vma on the stack as it can lead to a stack overflow, so we define it
> -	 * here. Safe to have 1 copy per uc fw because the binding is single
> -	 * threaded as it done during driver load (inherently single threaded)
> -	 * or during a GT reset (mutex guarantees single threaded).
> +	 * @needs_ggtt_mapping: indicates whether the fw object needs to be
> +	 * pinned to ggtt. If true, the fw is pinned at init time and unpinned
> +	 * during driver unload.
>   	 */
> -	struct i915_vma_resource dummy;
> +	bool needs_ggtt_mapping;
> +
> +	/**
> +	 * @vma_res: A vma resource used in binding the uc fw to ggtt. The fw is
> +	 * pinned in a reserved area of the ggtt (above the maximum address
> +	 * usable by GuC); therefore, we can't use the normal vma functions to
> +	 * do the pinning and we instead use this resource to do so.
> +	 */
> +	struct i915_vma_resource vma_res;
>   	struct i915_vma *rsa_data;
>   
>   	u32 rsa_size;
> @@ -282,12 +288,14 @@ static inline u32 intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
>   }
>   
>   void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
> -			    enum intel_uc_fw_type type);
> +			    enum intel_uc_fw_type type,
> +			    bool needs_ggtt_mapping);
>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw);
>   void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw);
>   int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>   int intel_uc_fw_init(struct intel_uc_fw *uc_fw);
>   void intel_uc_fw_fini(struct intel_uc_fw *uc_fw);
> +void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw);
>   size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len);
>   int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err);
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p);

