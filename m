Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA85A0AC7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5634B10E096;
	Thu, 25 Aug 2022 07:53:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E336310E063;
 Thu, 25 Aug 2022 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661414006; x=1692950006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d2SJ1u5LgosWgswSAUTr75T54/FJyGWfJLvnmdrcZ4A=;
 b=hrvwrMIigmvHSTwI1PbegtFQYzzkTCi24Og8LLDyWNmjq1JnU43DUoZR
 /LHFKBXyPbNrTCI6fwCk/dVDgkg+yvDLno7se+8bclgoAyw5eUrBdBLKW
 8EJP82VlGvtv7q1oKcT1+zvu0KPht9x59DcvZQov2ZBNFHU5rk1I4VTQ4
 DJ98prTVcttZqVe07Lt4rPxlNwENu++UGfdaYXO/HqFwc8G/dBIrUOY8s
 vsCw5zieXRC2/CRAzDgnRNwJgK8w6efKEBFX/WU3pP0mLrahVB9C+ChRY
 4wb0EEOwgKBIkB0nxvLaF3wc1Ysv/vKKRMzhk2F/ni300XETUIbf3lnxy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="294923653"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="294923653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 21:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="938178863"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2022 21:50:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 21:50:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 21:50:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 24 Aug 2022 21:50:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 24 Aug 2022 21:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9eWotVihRK6jphXvObMJapZL6F5/p0i9Mg42zPxzqizZutzBHU8sdPd/qYAe7ZirAXcb3fQsk1gEToFWHUuxfH74Y3/0QjwhNakDbVjMW3WNgYTBDrr//4XTCEhSro2vb0nC7l1nRB0a3DrdauI4SWjD9uK5RkbGPooE3ta/s8XsOOU8Egm/KTu1hOwM/d38QQi+6X63XKbwXWSE8JDBd+DrautucMZsjZ6FaZhxr/M9yiShOki3WDipqhSuRYEGslGSQO12ToODsI30pIdPYuk4kx1lYgUkxlUVryAqyrb5GYNz/lTNnIHW6MVyrla7JJWGo37iV6iXC7gyy7rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1EKt02kseI49mVkVoPXO6SDlCkkJ1aPxGN5UAZ4Kyw=;
 b=PHovcVOGGq9AbbwKfKUFH6/PNjP47fIP1Rmk7Ld+pV+UomBchd/RSLsuy7TTjfk8migrPHZS8R3nNE21NGz9otsrpbAx9fCC/Qm0vOJysAG7ryj3YiiVPpobW2MveZmG7IgDTpXtoBazFEAlpAlKXNX+MiF+e2jocfObUQNdbzgfhdOxp1xc4RIiPfgbewMM3MweHHhKYV61NkkRMlL0NBA1fJx6liecGvvbB+qg/CaVHhrEPFt8GLA5qZ6f9pn/4vEJf/DOaTPwQ5JVEakYbqMLQjZ7xN6A+RgseYiD5xISinWP1SjdVS48Z83AI9zhkDMAWJdDC0u6CFQc6dj5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Thu, 25 Aug 2022 04:50:00 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%8]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 04:50:00 +0000
Message-ID: <7e1ae824-b262-91c3-3254-79e2dbef6575@intel.com>
Date: Wed, 24 Aug 2022 21:49:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/uc: Support for version reduced
 and multiple firmware files
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220816202837.1778495-1-John.C.Harrison@Intel.com>
 <20220816202837.1778495-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220816202837.1778495-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d8e275-3ce9-4796-02d3-08da86554405
X-MS-TrafficTypeDiagnostic: PH0PR11MB4823:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSOzLooUBfDRPvMEaU3M7aX6p+7Fi+9Eqdjy8zVFFaHSZ9bb7wnKeEkrPrYUIDe72N0/b4p4fQ8oAhzmjrinQ2NmBiN3KpMhKqbsX10hzowUpRgyWhiCqyPx7NdbgpMuqzq9oweipokm1Hqml57zP2uY3Le5Kq4Z3379xyU9raSbfFEJbgYyDtV+umybnER7ixQuCGdXWQ5gWDRNoPbzf+BK+A/A+BapOLW+VSExJS54aWtCMUSIkyjd63cpKFcmSGEgMJtvItgx4nqtoRetwT8BwkmdxICAn16p7NT8+FQXCCSVjMcKi2WSbvu5+4c/noRXQyfTPmUiWfODk922ATsvrLGI8bUiLPbWAIkSuhyJuuI/xwN/0JyfeYoRHNy8EoXbFeRh9pyWLy/4PJdZ82juG5YZpTjuG3Do2dEelWEIWxUb7bCZ86JvOoLvYgI3dedhZTqxfiZHA3a58CZz73mGN1qce6OOuVnVc5tKF6+9/zodS0udYaWutJtEHfIj9vfc7eUK8+yMDSd235BDNRcwI8cmsK9VDtmEnkeyhG37qQzBP6gcPlUjLtwyUPzfpJN7s0uZITJcSDvszP+gDnAODEQty/YiF3EaJ8ip2o/YdKXW9yn6kGEwe4JkoR8Yb7ho07nuEE61r4+eMhQ8LL+72bSQ6qu2Wqs/ZNZu6UHSuaS3gz6NZw4sneNzaUH8IIusmPLi1cNsK1SPB+fdMhiKqYIyE5E5D6kztDsGri4Ye2TJfhbPLEg9/Rnvg7/Q4eC7wpivF5OMTd2cChPy2cWJCg9QZLAHKr4Oqp3ycPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(136003)(39860400002)(366004)(83380400001)(6512007)(2906002)(53546011)(26005)(2616005)(186003)(6506007)(31696002)(86362001)(82960400001)(36756003)(38100700002)(8936002)(6486002)(5660300002)(41300700001)(30864003)(66946007)(450100002)(316002)(66556008)(66476007)(31686004)(478600001)(6666004)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnptbVdrZ2dEbmFVY09uUEplY1ppcTN3bWM2ajNjVng0MTliTHBBNWZibHZp?=
 =?utf-8?B?dDlranhqTTJ0L1phR2M2MWN2eXhVS0dvS2wvVWNvMWZHUldiaG5vMDlRaFFx?=
 =?utf-8?B?RENkd2RTNDRNb1hJZzJna2QrTjdsUzM0YTdSWWlnY2M2NC9hWDZWenV1Qi9I?=
 =?utf-8?B?RFN2dis5c3dqbkVEM0FvcUZreWVOL25lRmIxdW1UNUQ3eUViaElldWFJWkgy?=
 =?utf-8?B?MWdDUmNSU3FMUTBrdFlaV1NrQ1J6cDdDZk5UVkVyZTJ0aHExTk1uSUJXTjFS?=
 =?utf-8?B?U3g2VlRUSkx5Mzk2cWpEOXIrMnBRY0h3TmxPZEs5K2VuR1ljZTM4SkJhWFJn?=
 =?utf-8?B?ZjJJZmRvWWg0RUdMYjUwdjl5bTlub3JMcVpDT0k4VVc0c05ZL25ZcnE3REhL?=
 =?utf-8?B?RURCbEtRWjBYVFN4OHVkS3ZJd25KV2FlbjMrUG9la0NDYjJOdEtwbmJXQkhv?=
 =?utf-8?B?S0hJczZhakRsaWdXSGdJYVJtREZXQVJuRGhNRDJ2V0R6N0ZXRUNNYkI5VUZQ?=
 =?utf-8?B?U1Y3dGZXVUxsdTZMOEE0aHM2Ymc5UFVHQlNkN2t0T1UxTExYL0RIOHFQcGlk?=
 =?utf-8?B?RFFpaU9oMEFrSm1NajhHVTFXMmtxK0U3WHVOZ3FlYjVvMUFNZ2l3VXVQSnY3?=
 =?utf-8?B?R3dxWTFhdVBEUXNHd2xPUmpKSVVXOW1rTkVlSEhwaW9JT1F6aWdqMEJsS3Br?=
 =?utf-8?B?ZDVrR2xIcUl1Sk1vSWFkcERBOSs1OFp0d0NlclpSL25Hb1NBeUFCc0dCU3Vv?=
 =?utf-8?B?R0xCbjJ1MVZXZHgvS25vT2c2NDJ1OXdYVTF5Sy83NWg1UjBTb2VpanlOUkFO?=
 =?utf-8?B?S2lmQVh3a2ZTeENib3hEbDZ2RGtzRVdXc1FKZ21pYnMwK0QvUjZmcWJ3VVJy?=
 =?utf-8?B?YVlZbDBHK2ZCZ2xaa1BCQ3dTcnJ1QlpPWUxxQVZEVlFuSTk3TTk3SlkzK1ZL?=
 =?utf-8?B?Ni81NzFtSldtTXF6MzIremd6b2ZUQzN1SUd3S3c0ZUlBTUx5czMyclpnaFhh?=
 =?utf-8?B?QUZraHBQQ3ZMaFZYV2FmbmNIYktUbFU2eUhmL1YyMVo2WWxYaGJvaXBhMGtM?=
 =?utf-8?B?MWkzbWpyRSsydDBPL0tFaVNVNXV2bXFMT1R6cEJyUVlUOEx2eUtqNUppaHBl?=
 =?utf-8?B?R2haTmpvSGNCVEJhcGVhSjRwU1BLQ20vUGtOeFVnK01QT0p4WW1DL1NqKzFL?=
 =?utf-8?B?Nk85ajVaQjNxQUR2UWlZbWhnd2Y3UkU5VHNodTZEOEQwWGZVUTVGMFZtTGRT?=
 =?utf-8?B?b0dLU0hoSktuNUtRMzFyV2dpc0xwZC83Zlh2S3F2YWR4RGRxY0VUYWtFODFh?=
 =?utf-8?B?eTJxSWhoaHU0cEhxNWIrRVNRbThxV08rZFkwTnM0VlNGMXNBalEyYTh6V200?=
 =?utf-8?B?Y2tGNkMreC9rWXJJN2FKSGRhRCtvKzFuRTd1UnJ5c0NxSGYxNkU0dTFmdDRl?=
 =?utf-8?B?VWlPRVRobjdPNzJhWFZhaE1EaE11aGF0UnJyQVc1SnF2enR4TGlSREg4cWhE?=
 =?utf-8?B?QVVCOG0xeDM3RUswblV5TUk5T25oUHBHN3pmd2dXeWQwM2llMXgzekNJMFAw?=
 =?utf-8?B?WVRUQ0J6SERBS1JuMER0RjJuTFk3SThRMkN2cTU2dnBzeFdZM2NWTkhrQ3Zi?=
 =?utf-8?B?eUVRR0xOMzJCMDQ4emMzOWJJU2gxbjhRL3hyaTNBejFxV1RmS1dlQ1dQUW9z?=
 =?utf-8?B?aVNpQ2NMendWQXZLQnVaNjdFdExnTCtFaVNQOVV5S3lLSTJUSUhxemJZZys2?=
 =?utf-8?B?QmtmWCtaaTE4NEJKYU1GeHdNNWJ2VXZLc2JRVE5EaDVMYitOd3NlZGU4OW5v?=
 =?utf-8?B?Zm9xR2IrOGxONTN2QWQ5cHJUT2d3WWlVVkxOVnhKMFhUL05scFFzSzlCTGJG?=
 =?utf-8?B?Q2pLZ0NzdXZuV3M0cDlJT2hxckRCaEFid24zdWFZUEJ3UWlmbDFjb2hQSm5z?=
 =?utf-8?B?bUN1K0QzbW1jcExVMmFPQ1Z0MWFzRUk2Y0x1cXFXemxsN2MrcVpXaCt5MEZB?=
 =?utf-8?B?VUJZWXNibFMycGZHa1VRRFBRRk1lZjJlMUZzNlUxNXNqaVNJRmhpOEQrRzc2?=
 =?utf-8?B?eW9jQ09Gd095NGpObGc0d2FGTis2OVVpek92TW1JT29XZUR4SmhFQWRFaUdU?=
 =?utf-8?B?MUZ2WnV6eTJCZUQyUlNDTFdpblhXbVJEWHNmYVNrSndlalBGU0pjYjZIdzNn?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d8e275-3ce9-4796-02d3-08da86554405
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 04:49:59.9289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ntYsgH4xDukXtVVyHEdhzJULGJ1XOYuWQSeI/31eRsXaS1xgwSYwIeRDJwIOynAAEIPum6j/4YGxltJS3eD8RjuEF4D2MqKhLSkBhyIago=
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/16/2022 1:28 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There was a misunderstanding in how firmware file compatibility should
> be managed within i915. This has been clarified as:
>    i915 must support all existing firmware releases forever
>    new minor firmware releases should replace prior versions
>    only backwards compatibility breaking releases should be a new file
>
> Hence this patch cleans up the single fallback file support that was
> added as a quick fix emergency effort. That is now removed in
> preference to supporting arbitrary numbers of firmware files per
> platform as normal.
>
> The patch also adds support for having GuC firmwrae files that are
> named by major version only (because the major version indicates
> backwards breaking changes that affect the KMD) and for having HuC
> firmware files with no version number at all (because the KMD has no
> interface requirements with the HuC).
>
> For GuC, the driver will report via dmesg if the found file is older than
> expected. For HuC, the KMD will no longer require updating for any new
> HuC release so will not be able to report what the latest expected
> version is.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  10 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 396 +++++++++++-------
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  33 +-
>   drivers/gpu/drm/i915/i915_gpu_error.c         |  16 +-
>   5 files changed, 275 insertions(+), 184 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0d17da77e7872..d1715971fdd79 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	if (guc->submission_initialized)
>   		return 0;
>   
> -	if (guc->fw.major_ver_found < 70) {
> +	if (guc->fw.file_found.major_ver < 70) {
>   		ret = guc_lrc_desc_pool_create_v69(guc);
>   		if (ret)
>   			return ret;
> @@ -2303,7 +2303,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	if (guc->fw.major_ver_found >= 70)
> +	if (guc->fw.file_found.major_ver >= 70)
>   		ret = register_context_v70(guc, ce, loop);
>   	else
>   		ret = register_context_v69(guc, ce, loop);
> @@ -2315,7 +2315,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -		if (guc->fw.major_ver_found >= 70)
> +		if (guc->fw.file_found.major_ver >= 70)
>   			guc_context_policy_init_v70(ce, loop);
>   	}
>   
> @@ -2921,7 +2921,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	if (guc->fw.major_ver_found >= 70) {
> +	if (guc->fw.file_found.major_ver >= 70) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, guc_id);
> @@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct intel_context *ce)
>   static void __guc_context_set_prio(struct intel_guc *guc,
>   				   struct intel_context *ce)
>   {
> -	if (guc->fw.major_ver_found >= 70) {
> +	if (guc->fw.file_found.major_ver >= 70) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index f2e7c82985efd..0697128cc3362 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -436,8 +436,8 @@ static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
>   	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   
>   	drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
> -		 intel_uc_fw_type_repr(fw->type), fw->path,
> -		 fw->major_ver_found, fw->minor_ver_found);
> +		 intel_uc_fw_type_repr(fw->type), fw->file_found.path,
> +		 fw->file_found.major_ver, fw->file_found.minor_ver);
>   }
>   
>   static int __uc_init_hw(struct intel_uc *uc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 58547292efa0a..eb3a15f0fa479 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -41,7 +41,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   		"%s firmware -> %s\n",
>   		intel_uc_fw_type_repr(uc_fw->type),
>   		status == INTEL_UC_FIRMWARE_SELECTED ?
> -		uc_fw->path : intel_uc_fw_status_repr(status));
> +		uc_fw->file_found.path : intel_uc_fw_status_repr(status));
>   }
>   #endif
>   
> @@ -52,83 +52,113 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * Note that RKL and ADL-S have the same GuC/HuC device ID's and use the same
>    * firmware as TGL.
>    */
> -#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> -	fw_def(DG2,          0, guc_def(dg2,  70, 4, 1)) \
> -	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
> -	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
> -	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
> -	fw_def(ROCKETLAKE,   0, guc_def(tgl,  70, 1, 1)) \
> -	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 1, 1)) \
> -	fw_def(JASPERLAKE,   0, guc_def(ehl,  70, 1, 1)) \
> -	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  70, 1, 1)) \
> -	fw_def(ICELAKE,      0, guc_def(icl,  70, 1, 1)) \
> -	fw_def(COMETLAKE,    5, guc_def(cml,  70, 1, 1)) \
> -	fw_def(COMETLAKE,    0, guc_def(kbl,  70, 1, 1)) \
> -	fw_def(COFFEELAKE,   0, guc_def(kbl,  70, 1, 1)) \
> -	fw_def(GEMINILAKE,   0, guc_def(glk,  70, 1, 1)) \
> -	fw_def(KABYLAKE,     0, guc_def(kbl,  70, 1, 1)) \
> -	fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
> -	fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
> -
> -#define INTEL_GUC_FIRMWARE_DEFS_FALLBACK(fw_def, guc_def) \
> -	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
> -	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3))
> -
> -#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> -	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
> -	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
> -	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
> -	fw_def(ROCKETLAKE,   0, huc_def(tgl,  7, 9, 3)) \
> -	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3)) \
> -	fw_def(JASPERLAKE,   0, huc_def(ehl,  9, 0, 0)) \
> -	fw_def(ELKHARTLAKE,  0, huc_def(ehl,  9, 0, 0)) \
> -	fw_def(ICELAKE,      0, huc_def(icl,  9, 0, 0)) \
> -	fw_def(COMETLAKE,    5, huc_def(cml,  4, 0, 0)) \
> -	fw_def(COMETLAKE,    0, huc_def(kbl,  4, 0, 0)) \
> -	fw_def(COFFEELAKE,   0, huc_def(kbl,  4, 0, 0)) \
> -	fw_def(GEMINILAKE,   0, huc_def(glk,  4, 0, 0)) \
> -	fw_def(KABYLAKE,     0, huc_def(kbl,  4, 0, 0)) \
> -	fw_def(BROXTON,      0, huc_def(bxt,  2, 0, 0)) \
> -	fw_def(SKYLAKE,      0, huc_def(skl,  2, 0, 0))
> -
> -#define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
> +#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> +	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
> +	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> +	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
> +	fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
> +	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
> +	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
> +	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
> +	fw_def(ELKHARTLAKE,  0, guc_mmp(ehl,  70, 1, 1)) \
> +	fw_def(ICELAKE,      0, guc_mmp(icl,  70, 1, 1)) \
> +	fw_def(COMETLAKE,    5, guc_mmp(cml,  70, 1, 1)) \
> +	fw_def(COMETLAKE,    0, guc_mmp(kbl,  70, 1, 1)) \
> +	fw_def(COFFEELAKE,   0, guc_mmp(kbl,  70, 1, 1)) \
> +	fw_def(GEMINILAKE,   0, guc_mmp(glk,  70, 1, 1)) \
> +	fw_def(KABYLAKE,     0, guc_mmp(kbl,  70, 1, 1)) \
> +	fw_def(BROXTON,      0, guc_mmp(bxt,  70, 1, 1)) \
> +	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
> +
> +#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
> +	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
> +	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \
> +	fw_def(ELKHARTLAKE,  0, huc_mmp(ehl,  9, 0, 0)) \
> +	fw_def(ICELAKE,      0, huc_mmp(icl,  9, 0, 0)) \
> +	fw_def(COMETLAKE,    5, huc_mmp(cml,  4, 0, 0)) \
> +	fw_def(COMETLAKE,    0, huc_mmp(kbl,  4, 0, 0)) \
> +	fw_def(COFFEELAKE,   0, huc_mmp(kbl,  4, 0, 0)) \
> +	fw_def(GEMINILAKE,   0, huc_mmp(glk,  4, 0, 0)) \
> +	fw_def(KABYLAKE,     0, huc_mmp(kbl,  4, 0, 0)) \
> +	fw_def(BROXTON,      0, huc_mmp(bxt,  2, 0, 0)) \
> +	fw_def(SKYLAKE,      0, huc_mmp(skl,  2, 0, 0))
> +
> +#define __MAKE_UC_FW_PATH_BLANK(prefix_, name_) \
> +	"i915/" \
> +	__stringify(prefix_) name_ ".bin"
> +
> +#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
> +	"i915/" \
> +	__stringify(prefix_) name_ \
> +	__stringify(major_) ".bin"
> +
> +#define __MAKE_UC_FW_PATH_MMP(prefix_, name_, major_, minor_, patch_) \
>   	"i915/" \
>   	__stringify(prefix_) name_ \
>   	__stringify(major_) "." \
>   	__stringify(minor_) "." \
>   	__stringify(patch_) ".bin"

This needs a comment to explain all these different path types, 
something like: "Following the Linux Firmware Guidelines (see relevant 
documentation for details), we expect GuC binaries to be identified only 
by platform+major version, while HuC binaries don't have an interface 
with i915 so they're only identified by platform. However, for backward 
compatibility reasons, we also need to keep supporting older firmwares 
using the full platform_major.minor.patch nomenclature." .

>   
> -#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
> -	__MAKE_UC_FW_PATH(prefix_, "_guc_", major_, minor_, patch_)
> +#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
> +	__MAKE_UC_FW_PATH_MAJOR(prefix_, "_guc_", major_)
> +
> +#define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
> +	__MAKE_UC_FW_PATH_MMP(prefix_, "_guc_", major_, minor_, patch_)
>   
> -#define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
> -	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
> +#define MAKE_HUC_FW_PATH_BLANK(prefix_) \
> +	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc")
> +
> +#define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
> +	__MAKE_UC_FW_PATH_MMP(prefix_, "_huc_", major_, minor_, patch_)
>   
>   /* All blobs need to be declared via MODULE_FIRMWARE() */
>   #define INTEL_UC_MODULE_FW(platform_, revid_, uc_) \
>   	MODULE_FIRMWARE(uc_);
>   
> -INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> -INTEL_GUC_FIRMWARE_DEFS_FALLBACK(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> -INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
> +INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH_MAJOR, MAKE_GUC_FW_PATH_MMP)
> +INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, MAKE_HUC_FW_PATH_MMP)
>   
>   /* The below structs and macros are used to iterate across the list of blobs */
>   struct __packed uc_fw_blob {
> +	const char *path;
> +	bool legacy;
>   	u8 major;
>   	u8 minor;
> -	const char *path;
> +	u8 patch;
>   };
>   
> -#define UC_FW_BLOB(major_, minor_, path_) \
> -	{ .major = major_, .minor = minor_, .path = path_ }
> +#define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> +	.major = major_, \
> +	.minor = minor_, \
> +	.patch = patch_, \
> +	.path = path_,
> +
> +#define UC_FW_BLOB_NEW(major_, minor_, patch_, path_) \
> +	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> +	  .legacy = false }
> +
> +#define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
> +	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> +	  .legacy = true }
>   
> -#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
> -	UC_FW_BLOB(major_, minor_, \
> -		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
> +#define GUC_FW_BLOB(prefix_, major_, minor_) \
> +	UC_FW_BLOB_NEW(major_, minor_, 0, \
> +		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))

All these macros are a bit confusing, but AFAIU you want to record the 
expected minor on the i915 side but not encode it in the fetch path and 
only use it for logging purposes. Maybe add a comment to explain this? 
otherwise it is just confusing that we say we only want major on one 
side and we include the minor on the other.

>   
> -#define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
> -	UC_FW_BLOB(major_, minor_, \
> -		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
> +#define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
> +	UC_FW_BLOB_OLD(major_, minor_, patch_, \
> +		       MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
> +
> +#define HUC_FW_BLOB(prefix_) \
> +	UC_FW_BLOB_NEW(0, 0, 0, MAKE_HUC_FW_PATH_BLANK(prefix_))
> +
> +#define HUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
> +	UC_FW_BLOB_OLD(major_, minor_, patch_, \
> +		       MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>   
>   struct __packed uc_fw_platform_requirement {
>   	enum intel_platform p;
> @@ -152,13 +182,10 @@ static void
>   __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   {
>   	static const struct uc_fw_platform_requirement blobs_guc[] = {
> -		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> -	};
> -	static const struct uc_fw_platform_requirement blobs_guc_fallback[] = {
> -		INTEL_GUC_FIRMWARE_DEFS_FALLBACK(MAKE_FW_LIST, GUC_FW_BLOB)
> +		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
>   	};
>   	static const struct uc_fw_platform_requirement blobs_huc[] = {
> -		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
> +		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP)
>   	};
>   	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>   		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> @@ -184,49 +211,89 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	fw_count = blobs_all[uc_fw->type].count;
>   
>   	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
> -		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> -			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
> -			uc_fw->path = blob->path;
> -			uc_fw->wanted_path = blob->path;
> -			uc_fw->major_ver_wanted = blob->major;
> -			uc_fw->minor_ver_wanted = blob->minor;
> -			break;
> -		}
> -	}
> +		const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>   
> -	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
> -		const struct uc_fw_platform_requirement *blobs = blobs_guc_fallback;
> -		u32 count = ARRAY_SIZE(blobs_guc_fallback);
> +		if (p != fw_blobs[i].p)
> +			continue;
>   
> -		for (i = 0; i < count && p <= blobs[i].p; i++) {
> -			if (p == blobs[i].p && rev >= blobs[i].rev) {
> -				const struct uc_fw_blob *blob = &blobs[i].blob;
> +		if (rev < fw_blobs[i].rev)
> +			continue;
>   
> -				uc_fw->fallback.path = blob->path;
> -				uc_fw->fallback.major_ver = blob->major;
> -				uc_fw->fallback.minor_ver = blob->minor;
> -				break;
> -			}
> -		}
> +		if (uc_fw->file_wanted.path &&
> +		    uc_fw->file_wanted.major_ver == blob->major)
> +			continue;

This needs a comment to explain that this function can be called 
multiple times if the first fw we look for is not found on disk. Also, 
how does this work with new vs legacy blob with the same version? e.g. 
if new style dg2_guc_70.bin is not on disk, but old style dg2_guc_70.4.1 
is, the major is 70 in both cases. Or am I missing something?

> +
> +		uc_fw->file_found.path = blob->path;
> +		uc_fw->file_wanted.path = blob->path;
> +		uc_fw->file_wanted.major_ver = blob->major;
> +		uc_fw->file_wanted.minor_ver = blob->minor;

The naming of "wanted" vs "found" here is a bit misleading, because 
found is assigned here before we even attempt the fetch, so  we haven't 
actually found it. Looks like you're before the fetch you're using this 
mainly for printing, so can't you use file_wanted instead and only 
assign file_found after the fetch?

> +		break;
>   	}
>   
>   	/* make sure the list is ordered as expected */
>   	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST)) {
>   		for (i = 1; i < fw_count; i++) {
> +			/* Next platform is good: */
>   			if (fw_blobs[i].p < fw_blobs[i - 1].p)
>   				continue;
>   
> +			/* Next platform revision is good: */
>   			if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>   			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
>   				continue;
>   
> -			drm_err(&i915->drm, "Invalid FW blob order: %s r%u comes before %s r%u\n",
> -				intel_platform_name(fw_blobs[i - 1].p),
> -				fw_blobs[i - 1].rev,
> -				intel_platform_name(fw_blobs[i].p),
> -				fw_blobs[i].rev);
> +			/* Platform/revision must be in order: */
> +			if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> +			    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> +				goto bad;
>   
> -			uc_fw->path = NULL;
> +			/* Next major version is good: */
> +			if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> +				continue;
> +
> +			/* New must be before leggacy: */

typo legacy

> +			if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> +				goto bad;
> +
> +			/* New to legacy also means 0.0 to X.Y, or X.0 to X.Y */
> +			if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> +				if (!fw_blobs[i - 1].blob.major)

I'd add a comment here to remind that we don't track the versions with HuC

> +					continue;
> +
> +				if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
> +					continue;
> +			}
> +
> +			/* Major versions must be in order: */
> +			if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> +				goto bad;
> +
> +			/* Next minor version is good: */
> +			if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +				continue;
> +
> +			/* Minor versions must be in order: */
> +			if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> +				goto bad;
> +
> +			/* Patch versions must be in order: */
> +			if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +				continue;
> +
> +bad:
> +			drm_err(&i915->drm, "\x1B[35;1mInvalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> +				fw_blobs[i - 1].blob.legacy ? "L" : "v",
> +				fw_blobs[i - 1].blob.major,
> +				fw_blobs[i - 1].blob.minor,
> +				fw_blobs[i - 1].blob.patch,
> +				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> +				fw_blobs[i].blob.legacy ? "L" : "v",
> +				fw_blobs[i].blob.major,
> +				fw_blobs[i].blob.minor,
> +				fw_blobs[i].blob.patch);
> +
> +			uc_fw->file_found.path = NULL;
>   		}

This has grown big enough that it should probably be moved to a mock 
selftest. Can be done as a follow up.

>   	}
>   }
> @@ -259,7 +326,7 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
>   	}
>   
>   	if (unlikely(path)) {
> -		uc_fw->path = path;
> +		uc_fw->file_found.path = path;
>   		uc_fw->user_overridden = true;
>   	}
>   }
> @@ -283,7 +350,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   	 */
>   	BUILD_BUG_ON(INTEL_UC_FIRMWARE_UNINITIALIZED);
>   	GEM_BUG_ON(uc_fw->status);
> -	GEM_BUG_ON(uc_fw->path);
> +	GEM_BUG_ON(uc_fw->file_found.path);
>   
>   	uc_fw->type = type;
>   
> @@ -292,7 +359,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   		__uc_fw_user_override(i915, uc_fw);
>   	}
>   
> -	intel_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
> +	intel_uc_fw_change_status(uc_fw, uc_fw->file_found.path ? *uc_fw->file_found.path ?
>   				  INTEL_UC_FIRMWARE_SELECTED :
>   				  INTEL_UC_FIRMWARE_DISABLED :
>   				  INTEL_UC_FIRMWARE_NOT_SUPPORTED);
> @@ -305,32 +372,32 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
>   
>   	if (i915_inject_probe_error(i915, e)) {
>   		/* non-existing blob */
> -		uc_fw->path = "<invalid>";
> +		uc_fw->file_found.path = "<invalid>";
>   		uc_fw->user_overridden = user;
>   	} else if (i915_inject_probe_error(i915, e)) {
>   		/* require next major version */
> -		uc_fw->major_ver_wanted += 1;
> -		uc_fw->minor_ver_wanted = 0;
> +		uc_fw->file_wanted.major_ver += 1;
> +		uc_fw->file_wanted.minor_ver = 0;
>   		uc_fw->user_overridden = user;
>   	} else if (i915_inject_probe_error(i915, e)) {
>   		/* require next minor version */
> -		uc_fw->minor_ver_wanted += 1;
> +		uc_fw->file_wanted.minor_ver += 1;
>   		uc_fw->user_overridden = user;
> -	} else if (uc_fw->major_ver_wanted &&
> +	} else if (uc_fw->file_wanted.major_ver &&
>   		   i915_inject_probe_error(i915, e)) {
>   		/* require prev major version */
> -		uc_fw->major_ver_wanted -= 1;
> -		uc_fw->minor_ver_wanted = 0;
> +		uc_fw->file_wanted.major_ver -= 1;
> +		uc_fw->file_wanted.minor_ver = 0;
>   		uc_fw->user_overridden = user;
> -	} else if (uc_fw->minor_ver_wanted &&
> +	} else if (uc_fw->file_wanted.minor_ver &&
>   		   i915_inject_probe_error(i915, e)) {
>   		/* require prev minor version - hey, this should work! */
> -		uc_fw->minor_ver_wanted -= 1;
> +		uc_fw->file_wanted.minor_ver -= 1;
>   		uc_fw->user_overridden = user;
>   	} else if (user && i915_inject_probe_error(i915, e)) {
>   		/* officially unsupported platform */
> -		uc_fw->major_ver_wanted = 0;
> -		uc_fw->minor_ver_wanted = 0;
> +		uc_fw->file_wanted.major_ver = 0;
> +		uc_fw->file_wanted.minor_ver = 0;
>   		uc_fw->user_overridden = true;
>   	}
>   }
> @@ -341,8 +408,8 @@ static int check_gsc_manifest(const struct firmware *fw,
>   	u32 *dw = (u32 *)fw->data;
>   	u32 version = dw[HUC_GSC_VERSION_DW];
>   
> -	uc_fw->major_ver_found = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
> -	uc_fw->minor_ver_found = FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
> +	uc_fw->file_found.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
> +	uc_fw->file_found.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
>   
>   	return 0;
>   }
> @@ -357,7 +424,7 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   	/* Check the size of the blob before examining buffer contents */
>   	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path,
>   			 fw->size, sizeof(struct uc_css_header));
>   		return -ENODATA;
>   	}
> @@ -370,7 +437,7 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   	if (unlikely(size != sizeof(struct uc_css_header))) {
>   		drm_warn(&i915->drm,
>   			 "%s firmware %s: unexpected header size: %zu != %zu\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path,
>   			 fw->size, sizeof(struct uc_css_header));
>   		return -EPROTO;
>   	}
> @@ -385,7 +452,7 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
>   	if (unlikely(fw->size < size)) {
>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path,
>   			 fw->size, size);
>   		return -ENOEXEC;
>   	}
> @@ -394,16 +461,16 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   	size = __intel_uc_fw_get_upload_size(uc_fw);
>   	if (unlikely(size >= i915->wopcm.size)) {
>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path,
>   			 size, (size_t)i915->wopcm.size);
>   		return -E2BIG;
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -					   css->sw_version);
> -	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -					   css->sw_version);
> +	uc_fw->file_found.major_ver = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> +						css->sw_version);
> +	uc_fw->file_found.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> +						css->sw_version);
>   
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>   		uc_fw->private_data_size = css->private_data_size;
> @@ -422,9 +489,11 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   {
>   	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
> +	struct intel_uc_fw_file file_ideal;
>   	struct device *dev = i915->drm.dev;
>   	struct drm_i915_gem_object *obj;
>   	const struct firmware *fw = NULL;
> +	bool old_ver = false;
>   	int err;
>   
>   	GEM_BUG_ON(!i915->wopcm.size);
> @@ -437,27 +506,30 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	__force_fw_fetch_failures(uc_fw, -EINVAL);
>   	__force_fw_fetch_failures(uc_fw, -ESTALE);
>   
> -	err = firmware_request_nowarn(&fw, uc_fw->path, dev);
> -	if (err && !intel_uc_fw_is_overridden(uc_fw) && uc_fw->fallback.path) {
> -		err = firmware_request_nowarn(&fw, uc_fw->fallback.path, dev);
> -		if (!err) {
> -			drm_notice(&i915->drm,
> -				   "%s firmware %s is recommended, but only %s was found\n",
> -				   intel_uc_fw_type_repr(uc_fw->type),
> -				   uc_fw->wanted_path,
> -				   uc_fw->fallback.path);
> -			drm_info(&i915->drm,
> -				 "Consider updating your linux-firmware pkg or downloading from %s\n",
> -				 INTEL_UC_FIRMWARE_URL);
> -
> -			uc_fw->path = uc_fw->fallback.path;
> -			uc_fw->major_ver_wanted = uc_fw->fallback.major_ver;
> -			uc_fw->minor_ver_wanted = uc_fw->fallback.minor_ver;
> +	err = firmware_request_nowarn(&fw, uc_fw->file_found.path, dev);
> +	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
> +	if (!err || intel_uc_fw_is_overridden(uc_fw))
> +		goto done;
> +
> +	while (err == -ENOENT) {
> +		__uc_fw_auto_select(i915, uc_fw);
> +		if (!uc_fw->file_found.path) {
> +			/*
> +			 * No more options! But set path back to something
> +			 * valid just in case it gets dereferenced.
> +			 */
> +			uc_fw->file_found.path = file_ideal.path;
> +			break;
>   		}
> +
> +		err = firmware_request_nowarn(&fw, uc_fw->file_found.path, dev);
>   	}
> +
>   	if (err)
>   		goto fail;
>   
> +	old_ver = true;
> +done:
>   	if (uc_fw->loaded_via_gsc)
>   		err = check_gsc_manifest(fw, uc_fw);
>   	else
> @@ -465,18 +537,41 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> -	if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
> -	    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
> -		drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
> -			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
> -		if (!intel_uc_fw_is_overridden(uc_fw)) {
> -			err = -ENOEXEC;
> -			goto fail;
> +	if (uc_fw->file_wanted.major_ver) {
> +		/* Check the file's major version was as it claimed */
> +		if (uc_fw->file_found.major_ver != uc_fw->file_wanted.major_ver) {
> +			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
> +				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path,
> +				   uc_fw->file_found.major_ver, uc_fw->file_found.minor_ver,
> +				   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
> +			if (!intel_uc_fw_is_overridden(uc_fw)) {
> +				err = -ENOEXEC;
> +				goto fail;
> +			}
> +		} else {
> +			if (uc_fw->file_found.minor_ver < uc_fw->file_wanted.minor_ver)
> +				old_ver = true;
>   		}
>   	}
>   
> +	if (old_ver) {
> +		/* Preserve the version that was really wanted */
> +		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
> +
> +		drm_notice(&i915->drm,
> +			   "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",

This is going to be a weird message if we were looking for new style 
guc_70.0 and found old style guc_70.4 instead. Can we limit this log to 
when the found version is smaller than the wanted one?

> +			   intel_uc_fw_type_repr(uc_fw->type),
> +			   uc_fw->file_wanted.path,
> +			   uc_fw->file_wanted.major_ver,
> +			   uc_fw->file_wanted.minor_ver,
> +			   uc_fw->file_found.path,
> +			   uc_fw->file_found.major_ver,
> +			   uc_fw->file_found.minor_ver);
> +		drm_info(&i915->drm,
> +			 "Consider updating your linux-firmware pkg or downloading from %s\n",
> +			 INTEL_UC_FIRMWARE_URL);
> +	}
> +
>   	if (HAS_LMEM(i915)) {
>   		obj = i915_gem_object_create_lmem_from_data(i915, fw->data, fw->size);
>   		if (!IS_ERR(obj))
> @@ -503,7 +598,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   				  INTEL_UC_FIRMWARE_ERROR);
>   
>   	i915_probe_error(i915, "%s firmware %s: fetch failed with error %d\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path, err);
>   	drm_info(&i915->drm, "%s firmware(s) can be downloaded from %s\n",
>   		 intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
>   
> @@ -645,7 +740,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   
>   fail:
>   	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
> -			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path,
>   			 err);
>   	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>   	return err;
> @@ -864,18 +959,19 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   {
>   	drm_printf(p, "%s firmware: %s\n",
> -		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->wanted_path);
> -	if (uc_fw->fallback.path) {
> -		drm_printf(p, "%s firmware fallback: %s\n",
> -			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->fallback.path);
> -		drm_printf(p, "fallback selected: %s\n",
> -			   str_yes_no(uc_fw->path == uc_fw->fallback.path));
> -	}
> +		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_found.path);
> +	if (uc_fw->file_found.path == uc_fw->file_wanted.path)

Was this meant to be a != check? otherwise it's the same print twice

Daniele

> +		drm_printf(p, "%s firmware wanted: %s\n",
> +			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
> -	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> -		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
> +	if (uc_fw->file_wanted.major_ver)
> +		drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> +			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
> +			   uc_fw->file_found.major_ver, uc_fw->file_found.minor_ver);
> +	else
> +		drm_printf(p, "\tversion: found %u.%u\n",
> +			   uc_fw->file_found.major_ver, uc_fw->file_found.minor_ver);
>   	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>   	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 7aa2644400b98..5c1751773c756 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -64,6 +64,17 @@ enum intel_uc_fw_type {
>   };
>   #define INTEL_UC_FW_NUM_TYPES 2
>   
> +/*
> + * The firmware build process will generate a version header file with major and
> + * minor version defined. The versions are built into CSS header of firmware.
> + * i915 kernel driver set the minimal firmware version required per platform.
> + */
> +struct intel_uc_fw_file {
> +	const char *path;
> +	u16 major_ver;
> +	u16 minor_ver;
> +};
> +
>   /*
>    * This structure encapsulates all the data needed during the process
>    * of fetching, caching, and loading the firmware image into the uC.
> @@ -74,11 +85,12 @@ struct intel_uc_fw {
>   		const enum intel_uc_fw_status status;
>   		enum intel_uc_fw_status __status; /* no accidental overwrites */
>   	};
> -	const char *wanted_path;
> -	const char *path;
> +	struct intel_uc_fw_file file_wanted;
> +	struct intel_uc_fw_file file_found;
>   	bool user_overridden;
>   	size_t size;
>   	struct drm_i915_gem_object *obj;
> +
>   	/**
>   	 * @dummy: A vma used in binding the uc fw to ggtt. We can't define this
>   	 * vma on the stack as it can lead to a stack overflow, so we define it
> @@ -89,25 +101,8 @@ struct intel_uc_fw {
>   	struct i915_vma_resource dummy;
>   	struct i915_vma *rsa_data;
>   
> -	/*
> -	 * The firmware build process will generate a version header file with major and
> -	 * minor version defined. The versions are built into CSS header of firmware.
> -	 * i915 kernel driver set the minimal firmware version required per platform.
> -	 */
> -	u16 major_ver_wanted;
> -	u16 minor_ver_wanted;
> -	u16 major_ver_found;
> -	u16 minor_ver_found;
> -
> -	struct {
> -		const char *path;
> -		u16 major_ver;
> -		u16 minor_ver;
> -	} fallback;
> -
>   	u32 rsa_size;
>   	u32 ucode_size;
> -
>   	u32 private_data_size;
>   
>   	bool loaded_via_gsc;
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 32e92651ef7c2..83cbb3589c9be 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1004,8 +1004,10 @@ static void cleanup_params(struct i915_gpu_coredump *error)
>   
>   static void cleanup_uc(struct intel_uc_coredump *uc)
>   {
> -	kfree(uc->guc_fw.path);
> -	kfree(uc->huc_fw.path);
> +	kfree(uc->guc_fw.file_found.path);
> +	kfree(uc->huc_fw.file_found.path);
> +	kfree(uc->guc_fw.file_wanted.path);
> +	kfree(uc->huc_fw.file_wanted.path);
>   	i915_vma_coredump_free(uc->guc_log);
>   
>   	kfree(uc);
> @@ -1669,12 +1671,10 @@ gt_record_uc(struct intel_gt_coredump *gt,
>   	memcpy(&error_uc->guc_fw, &uc->guc.fw, sizeof(uc->guc.fw));
>   	memcpy(&error_uc->huc_fw, &uc->huc.fw, sizeof(uc->huc.fw));
>   
> -	/* Non-default firmware paths will be specified by the modparam.
> -	 * As modparams are generally accesible from the userspace make
> -	 * explicit copies of the firmware paths.
> -	 */
> -	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
> -	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
> +	error_uc->guc_fw.file_found.path = kstrdup(uc->guc.fw.file_found.path, ALLOW_FAIL);
> +	error_uc->huc_fw.file_found.path = kstrdup(uc->huc.fw.file_found.path, ALLOW_FAIL);
> +	error_uc->guc_fw.file_wanted.path = kstrdup(uc->guc.fw.file_wanted.path, ALLOW_FAIL);
> +	error_uc->huc_fw.file_wanted.path = kstrdup(uc->huc.fw.file_wanted.path, ALLOW_FAIL);
>   	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>   						"GuC log buffer", compress);
>   

