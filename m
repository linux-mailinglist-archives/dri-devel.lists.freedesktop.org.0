Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47F578C9D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 23:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B5510F8E4;
	Mon, 18 Jul 2022 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BEE10F804;
 Mon, 18 Jul 2022 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658179147; x=1689715147;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iqG/qC+zok4NE7i2/eUi7GN8fQyHmbO/XV+E5DKuduo=;
 b=nb1zNGpqwELKHIiMGJ0Z+EUnP9NUme55JnAYX+Vng5BkhffXN2SYILTJ
 pB0S9dhzWtPkz2xtWZaqMrrFLB/bGBam4twhYyJ0qRyKNTVdcvNirOD5s
 xt401u7uWMddF8ExgWwEd/hK8TIkMKMEorExn4bjAWbZfSk3nYHDyrPj3
 5vAs0+bGicFnc4NX3lE5sZVvu5wX2tYahtZuzage0U9c2G08h//ZHLSEv
 OQUop5FkwzhRZVHyFtl+R48223fnSloVnfcm3ayxMep6XvDui1tSYEHj9
 ikzp/UBsZF7Xv4kMRS7VYGVJ8qKS0b+POJitnaDS02BgSAxTNBxmG2WII w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="286341620"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="286341620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 14:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="601352645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2022 14:19:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 14:19:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 14:19:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 14:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F39LnZDIlAtYJ0EQVkxf+skEEO16iPv67DofLPAfzWMa+nhW5/bMkgG3fZpYE0quVzZhfHiHD/oC2Xgob0Jy+hfFPjUTKNjoNK/JCO2fVMm3TJHVewVBZEo/ARXMgyyXH+02xZbELz5XxsQ6Kt6b0rrKvGwp7WqcFphklYjQMwpbIxBNx8iGOJl+aN7tTs36W3tgkaMHeWq74dzfTfmxgnDWBoU+fO1xm3wHzfjrRTR4t1Vom4LjMkw7XTdR+qiqN/ZsFmFysem3C/hfOt78x8ChPf46hmw2V1qah3nVZCA0cuxTg5WvU7zchGPCybPMafwVIjCU88a+R68mQqHJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SOHX4HpmUFPk+Mkhf6w7RQkjX5fZhzerAHRfnh/OzM=;
 b=W0oVe7RJBDosHuocPIkg/1uE/XvZDxVz/rB1Yik3UzwhluOSAUKFWO6VPmZOgdkNuX8UBW+GAy9W2TXBOABJlJfKDnIN7NxGN6g2dSbC/lnfcUL8dmcZpWaY8zCAJ2LMfNDE1NaR1uqmqQSui8VHtLZlQZ+dMRIq6FUKuCrDXAknPsuItpQoefXwwVrp13Fo2/ED0iUIiwVupzPghDB4MYa5BFWbG2begnZvy2SofV3n8NnMx59q3ju6ixP0yro8PJ2gZw35BbLzX8CvpXi0x5j7GSHN8cso9Xqpg1MSfpqeURlscRxZ+sozsz05Phj9rLYsQBlIvcTu85CPD42SXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4208.namprd11.prod.outlook.com (2603:10b6:208:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 21:19:03 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 21:19:03 +0000
Message-ID: <5be0a5af-17bd-9790-3e02-161e5e211165@intel.com>
Date: Mon, 18 Jul 2022 14:19:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/guc: support v69 in parallel to v70
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220715225451.1294354-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220715225451.1294354-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba5aae95-3ff8-43c4-ce9a-08da690323ca
X-MS-TrafficTypeDiagnostic: MN2PR11MB4208:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibq+L/9gogkWQ6cwJpRkaClL0kGeLcCHPOJgi+R4wD0GqaQWuHdmFh8qYAqt1UfUz5oSQYfXaoPdzb/ACIappevnYoXmz02UvSlc+JJhA6on4Rk69QQxDpk+/X/irScms0Fs4qoAJDo5kntT/9Y2r4Vj+FogNpNNtGxyvcNMYSeRbOiMUJ/k4RbicOyfhiFD10pM0OZAsC/dD+TJUdzUbxpZsxEYazXTLYmpl3SaO9f22qFUmIvsaF6p2OxtINBHkR8jK+fsIwmFLnO8TQUBzXWaQobg/g7TDfYVC5QvQzDpKxvqJbIVJWgOWbP5lWferfUxuMGG9KVCZxhjpDeuwF+kWZyvEy0uR+3IujLFrPXb89ysf1L3Afj5c2/wyLK7lyO2+PbQvcnPl6MmtqDx7hcGTO2WEVdO4ISy6HxFX7ldFrRMZmZSWC0rgwrA0/hi7+Hhv/1UsWwTvbbdlK85GapEKocflvIEV/hTRhpYE/D/ZNYVnsgJXJQ8Wmte/a+jN2tqPczI4NnVkqGcvkvgMaC9pgo0ZVR8WOsu006n5be9NouT2xCpwbes+c5ETL6iNx2HjFDrn/wML/ZZ+Ykgv0K5EOlJkVYhOKZbZJl+4KPrSl3d8ACHofQF3cZGqkAYbI6IpmGaVDMXWlGozdwr0+BcpRTEhni5NsKunImfwI5aprGTQnE9L726ei2s9lHKukQ6rN2bCIsNTnXbctKKyDDb32aoHF09yV9lVFerQ1Z1UvD2eRg43qSaZJU58DtRM6+BR85oNtYMeYCLC4p4u5PmzB3QoGo8BMHcm09S+fxouUUUZjWuqo1kBxnFl6l3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39860400002)(36756003)(31686004)(316002)(86362001)(30864003)(6512007)(82960400001)(54906003)(38100700002)(26005)(66476007)(66556008)(53546011)(2906002)(8676002)(41300700001)(5660300002)(186003)(2616005)(66946007)(8936002)(31696002)(6506007)(478600001)(83380400001)(966005)(6486002)(4326008)(334744004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2Y2aXo3c3phVVFvRFlLdDJIR2RCOUFTem81bHlBL0lDWHMxS2JERTUyRmp3?=
 =?utf-8?B?NlA4THAvWktIaXNaVHpDUk01NjloYTI1RXRDVVMrVUxqZFk2VDg4bGF1cjVV?=
 =?utf-8?B?TFVxOUNickkrbWFHQnNGMHVON2Mrb3RGaEE0UERyZi9FOWh2Wi9JbklibkNi?=
 =?utf-8?B?czNic3kxN05za05YZm55NzQ3d3FxUXJCUGliZkpkWm96c2VPSDhhVGVjc0RW?=
 =?utf-8?B?UUJVd21DRDBhQjhheGxYWjNXNlZ2aEUzNlZCNjNLN08wUmVsU2toVmNEd3RM?=
 =?utf-8?B?NHZjT2wwMnNFWmdOV0RIT2tZZE5wUlMyMGtZLzltT0ZMOU94RGxlU1N4UjVk?=
 =?utf-8?B?YnJ4bG9KVFQ2VWZDaVhGcXBLcnp5bUpuZEpyQVRlMG1TSTlKb0U5cm5hYmJi?=
 =?utf-8?B?MWRvMnJjaWM3aFcyR21yblp4bXdkRno4MnhiU2ppajl1SlBTb0VFYnRVWkhX?=
 =?utf-8?B?dGxLQWl4SC9Od0F4anRtWTN0c0p1VnRLeW0yc1NLWWt1YlRMd1FDYUZ3VFdp?=
 =?utf-8?B?bnRFdmtHSUJQeXNXWmVUaW1hMDRuRG96UnNnaDNyOXFpYUREL254bFZBZzFP?=
 =?utf-8?B?QWNFNmxuajZ5TnByMmJ6WnMxbzE1Qy9YNjJBN1hlRysxby9wVldRMkJXbmky?=
 =?utf-8?B?bWlKV2pkam9BaFZuWEtzTURUTW44a2NTS0l4RGd6M3JEY0hmd3BpZ21mTE9D?=
 =?utf-8?B?ejVONDBwRVkwM2RiNXl3ejVZZlAvalBsOW8vN0JKRlhqdUcvUDNRT2VNdkx0?=
 =?utf-8?B?dU11bTZ0TlpQcDhOQ3hjZVZiR0hLbHgvbnBmNU4zUW5zVWhzTHo0K0hOeWMw?=
 =?utf-8?B?ZUt3cXpDdWt0ZkNkeTJMLzdKdEx0NVRHbU5wcHFJK3hPUWtqWW4xVWFRVjF3?=
 =?utf-8?B?MFJEZmVlOTI2UkpzOUNiaGpzZHdkSU5WSktlQWkvTVJwQkNGeExUbkUrRENI?=
 =?utf-8?B?RlExZGZLa0lEQ2dadW9lbDlxUmlWamVwT05MZStnUmUvV0lCSE1mL1RBQzhO?=
 =?utf-8?B?eTdsWFZJZUl4czFFRWJNN280TFI0SFlKQ0I0TFl2VHVLeE5QTXJBV3pjRGhS?=
 =?utf-8?B?T0N3cG05RVVqN0xVMFJtdURrT09qSHVjeGpPZEJEOEpqbW15TDZCRUNaL050?=
 =?utf-8?B?Yjc4R1cxbkhobjVFNzU0ZFNobjlrOVlUZERWdXgvTUZuTVYwUFhQdFRnVUFG?=
 =?utf-8?B?ZW5odDF3OEkxM1BlZjY5b1A1Y1IxYmd5WDVwVWIyK1hzNk5LRC9CNjBCMi9I?=
 =?utf-8?B?UWlQd2RQZDN2QTYrS1UvdGxjNEZIRmpreUovbHRwa2x5Mk1WRTdHWGVzSktQ?=
 =?utf-8?B?ZWZ3SE9vaWgzS1NlZHVkSElvRVF2NS84a1NrV0doRm1iYURBRG5MVDVxQUJa?=
 =?utf-8?B?U3V5NENOSWFZZmlXZVdBdkpYR3plcXZKeExVa1RsSnJ2SDIzT21BRzdMbGhy?=
 =?utf-8?B?NVJSRW9Mc2hQa016N2JkTU80RXhjSVNHRy9xeHRuS1l3cWlVSUg4UEo5RjJM?=
 =?utf-8?B?bCsvYWdwY2t5VGE1ejdLNlQ3N1BLRDU0TTdmRlIvc2V6Ymo2a0x1MWRWdGVr?=
 =?utf-8?B?U2p4U0haekZ1OHU2c096S1NCVHdCRDZCNkJUbjZ2VGd5YmNJTkNMUEFJVmlq?=
 =?utf-8?B?bTJ1aGlYY3YxekNtYjBnV0NpYzdQSEd1cTNMdWd0WVpqRzI5RmYrbU9EY0t0?=
 =?utf-8?B?eEtpUlFxb3hwVW5EYzJ1bkpqZzNIY3Jwa0xjWDNKN2cvd3VEbTV2cTFKN0tE?=
 =?utf-8?B?OVMyRitqRXJpTjVsejZOOTRSbWl5UjIyT2FUb1NlRXppNUhHYW1HRWxBNVpk?=
 =?utf-8?B?eE9tMk1URVBjWWhjTjRYOUl2d2dzVjN6eGlzRVk1MXRUdGRyMmtyQ0pUUlVB?=
 =?utf-8?B?WWloODh2Z3VZUk02S1E0dUVkRjRqVTFxOGFTVzdkU3B5TG1JTENzZjlKV0Yx?=
 =?utf-8?B?UGsybnZDVHJJa0RmbEIwYU9jQnlpZzFmNi9YMVA5eE9PNk5wOEJuM3ByZmhE?=
 =?utf-8?B?ZjZzM3dJK0FBUnpPaDljeUM0TGhYOXE4M1dCam1kWWJ6dVRHd3AyV0RlZXQ4?=
 =?utf-8?B?TXE2akFma1N3a0xMMTA4a3lDV3pNN2dzdCszclE4Nk1yOVRzYWs0T1RSR2Rz?=
 =?utf-8?B?THp4cU51a2hPYjkvNzdZSEVzcm9UNmFvaVB5NXFObFRxUklYeGdBWmtTQW9Y?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5aae95-3ff8-43c4-ce9a-08da690323ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 21:19:03.4689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syszs2TZXSmybyeuoveSapDeuEa/3IIxSgsVxgj/fDaf3b56eRDDRaFY2Qd8ozI6jAorL5NKIICRG/4FU7iQ7d0uPb6twxf9/bJ7YgAUpaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4208
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dave
 Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/2022 15:54, Daniele Ceraolo Spurio wrote:
> This patch re-introduces support for GuC v69 in parallel to v70. As this
> is a quick fix, v69 has been re-introduced as the single "fallback" guc
> version in case v70 is not available on disk. All v69 specific code has
> been labeled as such for easy identification, and the same was done for
> all v70 functions for which there is a separate v69 version, to avoid
> accidentally calling the wrong version via the unlabeled name.
>
> When the fallback mode kicks in, a drm_warn message is printed in dmesg
> to warn the user of the required update.
>
> The plan is to follow this up with a more complex rework to allow for
> multiple different GuC versions to be supported at the same time.
>
> Fixes: 2584b3549f4c ("drm/i915/guc: Update to GuC version 70.1.1")
> Link: https://lists.freedesktop.org/archives/intel-gfx/2022-July/301640.html
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  11 +-
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   3 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   5 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  45 +++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 348 +++++++++++++++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  57 ++-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   7 +
>   7 files changed, 419 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index d2d75d9c0c8d..04eacae1aca5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -275,10 +275,17 @@ struct intel_context {
>   		u8 child_index;
>   		/** @guc: GuC specific members for parallel submission */
>   		struct {
> -			/** @wqi_head: head pointer in work queue */
> +			/** @wqi_head: cached head pointer in work queue */
>   			u16 wqi_head;
> -			/** @wqi_tail: tail pointer in work queue */
> +			/** @wqi_tail: cached tail pointer in work queue */
>   			u16 wqi_tail;
> +			/** @wq_head: pointer to the actual head in work queue */
> +			u32 *wq_head;
> +			/** @wq_tail: pointer to the actual head in work queue */
> +			u32 *wq_tail;
> +			/** @wq_status: pointer to the status in work queue */
> +			u32 *wq_status;
> +
>   			/**
>   			 * @parent_page: page in context state (ce->state) used
>   			 * by parent for work queue, process descriptor
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 4ef9990ed7f8..29ef8afc8c2e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -122,6 +122,9 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
>   	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_SET = 0x1003,
>   	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_DONE = 0x1004,
> +	INTEL_GUC_ACTION_V69_SET_CONTEXT_PRIORITY = 0x1005,
> +	INTEL_GUC_ACTION_V69_SET_CONTEXT_EXECUTION_QUANTUM = 0x1006,
> +	INTEL_GUC_ACTION_V69_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
>   	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
>   	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>   	INTEL_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES = 0x100B,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index d0d99f178f2d..a7acffbf15d1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -170,6 +170,11 @@ struct intel_guc {
>   	/** @ads_engine_usage_size: size of engine usage in the ADS */
>   	u32 ads_engine_usage_size;
>   
> +	/** @lrc_desc_pool_v69: object allocated to hold the GuC LRC descriptor pool */
> +	struct i915_vma *lrc_desc_pool_v69;
> +	/** @lrc_desc_pool_vaddr_v69: contents of the GuC LRC descriptor pool */
> +	void *lrc_desc_pool_vaddr_v69;
> +
>   	/**
>   	 * @context_lookup: used to resolve intel_context from guc_id, if a
>   	 * context is present in this structure it is registered with the GuC
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index b3c9a9327f76..323b055e5db9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -204,6 +204,20 @@ struct guc_wq_item {
>   	u32 fence_id;
>   } __packed;
>   
> +struct guc_process_desc_v69 {
> +	u32 stage_id;
> +	u64 db_base_addr;
> +	u32 head;
> +	u32 tail;
> +	u32 error_offset;
> +	u64 wq_base_addr;
> +	u32 wq_size_bytes;
> +	u32 wq_status;
> +	u32 engine_presence;
> +	u32 priority;
> +	u32 reserved[36];
> +} __packed;
> +
>   struct guc_sched_wq_desc {
>   	u32 head;
>   	u32 tail;
> @@ -228,6 +242,37 @@ struct guc_ctxt_registration_info {
>   };
>   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
>   
> +/* Preempt to idle on quantum expiry */
> +#define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE_V69	BIT(0)
> +
> +/*
> + * GuC Context registration descriptor.
> + * FIXME: This is only required to exist during context registration.
> + * The current 1:1 between guc_lrc_desc and LRCs for the lifetime of the LRC
> + * is not required.
> + */
> +struct guc_lrc_desc_v69 {
> +	u32 hw_context_desc;
> +	u32 slpm_perf_mode_hint;	/* SPLC v1 only */
> +	u32 slpm_freq_hint;
> +	u32 engine_submit_mask;		/* In logical space */
> +	u8 engine_class;
> +	u8 reserved0[3];
> +	u32 priority;
> +	u32 process_desc;
> +	u32 wq_addr;
> +	u32 wq_size;
> +	u32 context_flags;		/* CONTEXT_REGISTRATION_* */
> +	/* Time for one workload to execute. (in micro seconds) */
> +	u32 execution_quantum;
> +	/* Time to wait for a preemption request to complete before issuing a
> +	 * reset. (in micro seconds).
> +	 */
> +	u32 preemption_timeout;
> +	u32 policy_flags;		/* CONTEXT_POLICY_* */
> +	u32 reserved1[19];
> +} __packed;
> +
>   /* 32-bit KLV structure as used by policy updates and others */
>   struct guc_klv_generic_dw_t {
>   	u32 kl;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 40f726c61e95..aa10db25cc06 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -414,12 +414,15 @@ struct sync_semaphore {
>   };
>   
>   struct parent_scratch {
> -	struct guc_sched_wq_desc wq_desc;
> +	union guc_descs {
> +		struct guc_sched_wq_desc wq_desc;
> +		struct guc_process_desc_v69 pdesc;
> +	} descs;
>   
>   	struct sync_semaphore go;
>   	struct sync_semaphore join[MAX_ENGINE_INSTANCE + 1];
>   
> -	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
> +	u8 unused[WQ_OFFSET - sizeof(union guc_descs) -
>   		sizeof(struct sync_semaphore) * (MAX_ENGINE_INSTANCE + 2)];
>   
>   	u32 wq[WQ_SIZE / sizeof(u32)];
> @@ -456,17 +459,23 @@ __get_parent_scratch(struct intel_context *ce)
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> +static struct guc_process_desc_v69 *
> +__get_process_desc_v69(struct intel_context *ce)
> +{
> +	struct parent_scratch *ps = __get_parent_scratch(ce);
> +
> +	return &ps->descs.pdesc;
> +}
> +
>   static struct guc_sched_wq_desc *
> -__get_wq_desc(struct intel_context *ce)
> +__get_wq_desc_v70(struct intel_context *ce)
>   {
>   	struct parent_scratch *ps = __get_parent_scratch(ce);
>   
> -	return &ps->wq_desc;
> +	return &ps->descs.wq_desc;
>   }
>   
> -static u32 *get_wq_pointer(struct guc_sched_wq_desc *wq_desc,
> -			   struct intel_context *ce,
> -			   u32 wqi_size)
> +static u32 *get_wq_pointer(struct intel_context *ce, u32 wqi_size)
>   {
>   	/*
>   	 * Check for space in work queue. Caching a value of head pointer in
> @@ -476,7 +485,7 @@ static u32 *get_wq_pointer(struct guc_sched_wq_desc *wq_desc,
>   #define AVAILABLE_SPACE	\
>   	CIRC_SPACE(ce->parallel.guc.wqi_tail, ce->parallel.guc.wqi_head, WQ_SIZE)
>   	if (wqi_size > AVAILABLE_SPACE) {
> -		ce->parallel.guc.wqi_head = READ_ONCE(wq_desc->head);
> +		ce->parallel.guc.wqi_head = READ_ONCE(*ce->parallel.guc.wq_head);
>   
>   		if (wqi_size > AVAILABLE_SPACE)
>   			return NULL;
> @@ -495,11 +504,55 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   	return ce;
>   }
>   
> +static struct guc_lrc_desc_v69 *__get_lrc_desc_v69(struct intel_guc *guc, u32 index)
> +{
Wondering if it is worth adding GEM_BUG_ON(correct_fw_version) to these 
v## functions? Probably overkill at this point.

> +	struct guc_lrc_desc_v69 *base = guc->lrc_desc_pool_vaddr_v69;
> +
> +	if (!base)
> +		return NULL;
> +
> +	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
> +
> +	return &base[index];
> +}
> +
> +static int guc_lrc_desc_pool_create_v69(struct intel_guc *guc)
> +{
> +	u32 size;
> +	int ret;
> +
> +	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc_v69) *
> +			  GUC_MAX_CONTEXT_ID);
> +	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool_v69,
> +					     (void **)&guc->lrc_desc_pool_vaddr_v69);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void guc_lrc_desc_pool_destroy_v69(struct intel_guc *guc)
> +{
> +	if (!guc->lrc_desc_pool_vaddr_v69)
> +		return;
> +
> +	guc->lrc_desc_pool_vaddr_v69 = NULL;
> +	i915_vma_unpin_and_release(&guc->lrc_desc_pool_v69, I915_VMA_RELEASE_MAP);
> +}
> +
>   static inline bool guc_submission_initialized(struct intel_guc *guc)
>   {
>   	return guc->submission_initialized;
>   }
>   
> +static inline void _reset_lrc_desc_v69(struct intel_guc *guc, u32 id)
> +{
> +	struct guc_lrc_desc_v69 *desc = __get_lrc_desc_v69(guc, id);
> +
> +	if (desc)
> +		memset(desc, 0, sizeof(*desc));
> +}
> +
>   static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
>   {
>   	return __get_context(guc, id);
> @@ -526,6 +579,8 @@ static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
>   	if (unlikely(!guc_submission_initialized(guc)))
>   		return;
>   
> +	_reset_lrc_desc_v69(guc, id);
> +
>   	/*
>   	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
>   	 * the lower level functions directly.
> @@ -611,7 +666,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   					      true, timeout);
>   }
>   
> -static int guc_context_policy_init(struct intel_context *ce, bool loop);
> +static int guc_context_policy_init_v70(struct intel_context *ce, bool loop);
>   static int try_context_registration(struct intel_context *ce, bool loop);
>   
>   static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> @@ -639,7 +694,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
>   	if (context_policy_required(ce)) {
> -		err = guc_context_policy_init(ce, false);
> +		err = guc_context_policy_init_v70(ce, false);
>   		if (err)
>   			return err;
>   	}
> @@ -737,9 +792,7 @@ static u32 wq_space_until_wrap(struct intel_context *ce)
>   	return (WQ_SIZE - ce->parallel.guc.wqi_tail);
>   }
>   
> -static void write_wqi(struct guc_sched_wq_desc *wq_desc,
> -		      struct intel_context *ce,
> -		      u32 wqi_size)
> +static void write_wqi(struct intel_context *ce, u32 wqi_size)
>   {
>   	BUILD_BUG_ON(!is_power_of_2(WQ_SIZE));
>   
> @@ -750,13 +803,12 @@ static void write_wqi(struct guc_sched_wq_desc *wq_desc,
>   
>   	ce->parallel.guc.wqi_tail = (ce->parallel.guc.wqi_tail + wqi_size) &
>   		(WQ_SIZE - 1);
> -	WRITE_ONCE(wq_desc->tail, ce->parallel.guc.wqi_tail);
> +	WRITE_ONCE(*ce->parallel.guc.wq_tail, ce->parallel.guc.wqi_tail);
>   }
>   
>   static int guc_wq_noop_append(struct intel_context *ce)
>   {
> -	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
> -	u32 *wqi = get_wq_pointer(wq_desc, ce, wq_space_until_wrap(ce));
> +	u32 *wqi = get_wq_pointer(ce, wq_space_until_wrap(ce));
>   	u32 len_dw = wq_space_until_wrap(ce) / sizeof(u32) - 1;
>   
>   	if (!wqi)
> @@ -775,7 +827,6 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   {
>   	struct intel_context *ce = request_to_scheduling_context(rq);
>   	struct intel_context *child;
> -	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
>   	unsigned int wqi_size = (ce->parallel.number_children + 4) *
>   		sizeof(u32);
>   	u32 *wqi;
> @@ -795,7 +846,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   			return ret;
>   	}
>   
> -	wqi = get_wq_pointer(wq_desc, ce, wqi_size);
> +	wqi = get_wq_pointer(ce, wqi_size);
>   	if (!wqi)
>   		return -EBUSY;
>   
> @@ -810,7 +861,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   	for_each_child(ce, child)
>   		*wqi++ = child->ring->tail / sizeof(u64);
>   
> -	write_wqi(wq_desc, ce, wqi_size);
> +	write_wqi(ce, wqi_size);
>   
>   	return 0;
>   }
> @@ -1812,20 +1863,34 @@ static void reset_fail_worker_func(struct work_struct *w);
>   int intel_guc_submission_init(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> +	int ret;
>   
>   	if (guc->submission_initialized)
>   		return 0;
>   
> +	if (guc->fw.major_ver_found < 70) {
> +		ret = guc_lrc_desc_pool_create_v69(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> -	if (!guc->submission_state.guc_ids_bitmap)
> -		return -ENOMEM;
> +	if (!guc->submission_state.guc_ids_bitmap) {
> +		ret = -ENOMEM;
> +		goto destroy_pool;
> +	}
>   
>   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
>   	guc->timestamp.shift = gpm_timestamp_shift(gt);
>   	guc->submission_initialized = true;
>   
>   	return 0;
> +
> +destroy_pool:
> +	guc_lrc_desc_pool_destroy_v69(guc);
> +
> +	return ret;
>   }
>   
>   void intel_guc_submission_fini(struct intel_guc *guc)
> @@ -1834,6 +1899,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   		return;
>   
>   	guc_flush_destroyed_contexts(guc);
> +	guc_lrc_desc_pool_destroy_v69(guc);
>   	i915_sched_engine_put(guc->sched_engine);
>   	bitmap_free(guc->submission_state.guc_ids_bitmap);
>   	guc->submission_initialized = false;
> @@ -2091,10 +2157,34 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
> -static int __guc_action_register_multi_lrc(struct intel_guc *guc,
> +static int __guc_action_register_multi_lrc_v69(struct intel_guc *guc,
>   					   struct intel_context *ce,
> -					   struct guc_ctxt_registration_info *info,
> +					   u32 guc_id,
> +					   u32 offset,
>   					   bool loop)
> +{
> +	struct intel_context *child;
> +	u32 action[4 + MAX_ENGINE_INSTANCE];
> +	int len = 0;
> +
> +	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
> +
> +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> +	action[len++] = guc_id;
> +	action[len++] = ce->parallel.number_children + 1;
> +	action[len++] = offset;
> +	for_each_child(ce, child) {
> +		offset += sizeof(struct guc_lrc_desc_v69);
> +		action[len++] = offset;
> +	}
> +
> +	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> +}
> +
> +static int __guc_action_register_multi_lrc_v70(struct intel_guc *guc,
> +					       struct intel_context *ce,
> +					       struct guc_ctxt_registration_info *info,
> +					       bool loop)
>   {
>   	struct intel_context *child;
>   	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
> @@ -2134,9 +2224,24 @@ static int __guc_action_register_multi_lrc(struct intel_guc *guc,
>   	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
>   }
>   
> -static int __guc_action_register_context(struct intel_guc *guc,
> -					 struct guc_ctxt_registration_info *info,
> -					 bool loop)
> +static int __guc_action_register_context_v69(struct intel_guc *guc,
> +					     u32 guc_id,
> +					     u32 offset,
> +					     bool loop)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> +		guc_id,
> +		offset,
> +	};
> +
> +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> +					     0, loop);
> +}
> +
> +static int __guc_action_register_context_v70(struct intel_guc *guc,
> +					     struct guc_ctxt_registration_info *info,
> +					     bool loop)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> @@ -2157,24 +2262,52 @@ static int __guc_action_register_context(struct intel_guc *guc,
>   					     0, loop);
>   }
>   
> -static void prepare_context_registration_info(struct intel_context *ce,
> -					      struct guc_ctxt_registration_info *info);
> +static void prepare_context_registration_info_v69(struct intel_context *ce);
> +static void prepare_context_registration_info_v70(struct intel_context *ce,
> +						  struct guc_ctxt_registration_info *info);
>   
> -static int register_context(struct intel_context *ce, bool loop)
> +static int
> +register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop)
> +{
> +	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool_v69) +
> +		ce->guc_id.id * sizeof(struct guc_lrc_desc_v69);
> +
> +	prepare_context_registration_info_v69(ce);
> +
> +	if (intel_context_is_parent(ce))
> +		return __guc_action_register_multi_lrc_v69(guc, ce, ce->guc_id.id,
> +							   offset, loop);
> +	else
> +		return __guc_action_register_context_v69(guc, ce->guc_id.id,
> +							 offset, loop);
> +}
> +
> +static int
> +register_context_v70(struct intel_guc *guc, struct intel_context *ce, bool loop)
>   {
>   	struct guc_ctxt_registration_info info;
> +
> +	prepare_context_registration_info_v70(ce, &info);
> +
> +	if (intel_context_is_parent(ce))
> +		return __guc_action_register_multi_lrc_v70(guc, ce, &info, loop);
> +	else
> +		return __guc_action_register_context_v70(guc, &info, loop);
> +}
> +
> +static int register_context(struct intel_context *ce, bool loop)
> +{
>   	struct intel_guc *guc = ce_to_guc(ce);
>   	int ret;
>   
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	prepare_context_registration_info(ce, &info);
> -
> -	if (intel_context_is_parent(ce))
> -		ret = __guc_action_register_multi_lrc(guc, ce, &info, loop);
> +	if (guc->fw.major_ver_found >= 70)
> +		ret = register_context_v70(guc, ce, loop);
>   	else
> -		ret = __guc_action_register_context(guc, &info, loop);
> +		ret = register_context_v69(guc, ce, loop);
> +
>   	if (likely(!ret)) {
>   		unsigned long flags;
>   
> @@ -2182,7 +2315,8 @@ static int register_context(struct intel_context *ce, bool loop)
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -		guc_context_policy_init(ce, loop);
> +		if (guc->fw.major_ver_found >= 70)
> +			guc_context_policy_init_v70(ce, loop);
>   	}
>   
>   	return ret;
> @@ -2279,7 +2413,7 @@ static int __guc_context_set_context_policies(struct intel_guc *guc,
>   					0, loop);
>   }
>   
> -static int guc_context_policy_init(struct intel_context *ce, bool loop)
> +static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
> @@ -2338,6 +2472,19 @@ static int guc_context_policy_init(struct intel_context *ce, bool loop)
>   	return ret;
>   }
>   
> +static void guc_context_policy_init_v69(struct intel_engine_cs *engine,
> +					struct guc_lrc_desc_v69 *desc)
> +{
> +	desc->policy_flags = 0;
> +
> +	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> +		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE_V69;
> +
> +	/* NB: For both of these, zero means disabled. */
> +	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
> +	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> +}
> +
>   static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
>   {
>   	/*
> @@ -2358,8 +2505,75 @@ static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
>   	}
>   }
>   
> -static void prepare_context_registration_info(struct intel_context *ce,
> -					      struct guc_ctxt_registration_info *info)
> +static void prepare_context_registration_info_v69(struct intel_context *ce)
> +{
> +	struct intel_engine_cs *engine = ce->engine;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	u32 ctx_id = ce->guc_id.id;
> +	struct guc_lrc_desc_v69 *desc;
> +	struct intel_context *child;
> +
> +	GEM_BUG_ON(!engine->mask);
> +
> +	/*
> +	 * Ensure LRC + CT vmas are is same region as write barrier is done
> +	 * based on CT vma region.
> +	 */
> +	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
> +		   i915_gem_object_is_lmem(ce->ring->vma->obj));
> +
> +	desc = __get_lrc_desc_v69(guc, ctx_id);
> +	desc->engine_class = engine_class_to_guc_class(engine->class);
> +	desc->engine_submit_mask = engine->logical_mask;
> +	desc->hw_context_desc = ce->lrc.lrca;
> +	desc->priority = ce->guc_state.prio;
> +	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +	guc_context_policy_init_v69(engine, desc);
> +
> +	/*
> +	 * If context is a parent, we need to register a process descriptor
> +	 * describing a work queue and register all child contexts.
> +	 */
> +	if (intel_context_is_parent(ce)) {
> +		struct guc_process_desc_v69 *pdesc;
> +
> +		ce->parallel.guc.wqi_tail = 0;
> +		ce->parallel.guc.wqi_head = 0;
> +
> +		desc->process_desc = i915_ggtt_offset(ce->state) +
> +			__get_parent_scratch_offset(ce);
> +		desc->wq_addr = i915_ggtt_offset(ce->state) +
> +			__get_wq_offset(ce);
> +		desc->wq_size = WQ_SIZE;
> +
> +		pdesc = __get_process_desc_v69(ce);
> +		memset(pdesc, 0, sizeof(*(pdesc)));
> +		pdesc->stage_id = ce->guc_id.id;
> +		pdesc->wq_base_addr = desc->wq_addr;
> +		pdesc->wq_size_bytes = desc->wq_size;
> +		pdesc->wq_status = WQ_STATUS_ACTIVE;
> +
> +		ce->parallel.guc.wq_head = &pdesc->head;
> +		ce->parallel.guc.wq_tail = &pdesc->tail;
> +		ce->parallel.guc.wq_status = &pdesc->wq_status;
> +
> +		for_each_child(ce, child) {
> +			desc = __get_lrc_desc_v69(guc, child->guc_id.id);
> +
> +			desc->engine_class =
> +				engine_class_to_guc_class(engine->class);
> +			desc->hw_context_desc = child->lrc.lrca;
> +			desc->priority = ce->guc_state.prio;
> +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +			guc_context_policy_init_v69(engine, desc);
> +		}
> +
> +		clear_children_join_go_memory(ce);
> +	}
> +}
> +
> +static void prepare_context_registration_info_v70(struct intel_context *ce,
> +						  struct guc_ctxt_registration_info *info)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
> @@ -2409,10 +2623,14 @@ static void prepare_context_registration_info(struct intel_context *ce,
>   		info->wq_base_hi = upper_32_bits(wq_base_offset);
>   		info->wq_size = WQ_SIZE;
>   
> -		wq_desc = __get_wq_desc(ce);
> +		wq_desc = __get_wq_desc_v70(ce);
>   		memset(wq_desc, 0, sizeof(*wq_desc));
>   		wq_desc->wq_status = WQ_STATUS_ACTIVE;
>   
> +		ce->parallel.guc.wq_head = &wq_desc->head;
> +		ce->parallel.guc.wq_tail = &wq_desc->tail;
> +		ce->parallel.guc.wq_status = &wq_desc->wq_status;
Not clearing these pointers down in the context de-registration makes me 
nervous. Sure, they should never be touched on a context that is not 
registered, but they would still be dangling.

> +
>   		clear_children_join_go_memory(ce);
>   	}
>   }
> @@ -2727,11 +2945,21 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	struct context_policy policy;
> +	if (guc->fw.major_ver_found >= 70) {
> +		struct context_policy policy;
>   
> -	__guc_context_policy_start_klv(&policy, guc_id);
> -	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> -	__guc_context_set_context_policies(guc, &policy, true);
> +		__guc_context_policy_start_klv(&policy, guc_id);
> +		__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> +		__guc_context_set_context_policies(guc, &policy, true);
> +	} else {
> +		u32 action[] = {
> +			INTEL_GUC_ACTION_V69_SET_CONTEXT_PREEMPTION_TIMEOUT,
> +			guc_id,
> +			preemption_timeout
> +		};
> +
> +		intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +	}
>   }
>   
>   static void
> @@ -2982,11 +3210,21 @@ static int guc_context_alloc(struct intel_context *ce)
>   static void __guc_context_set_prio(struct intel_guc *guc,
>   				   struct intel_context *ce)
>   {
> -	struct context_policy policy;
> +	if (guc->fw.major_ver_found >= 70) {
> +		struct context_policy policy;
>   
> -	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> -	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> -	__guc_context_set_context_policies(guc, &policy, true);
> +		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> +		__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> +		__guc_context_set_context_policies(guc, &policy, true);
> +	} else {
> +		u32 action[] = {
> +			INTEL_GUC_ACTION_V69_SET_CONTEXT_PRIORITY,
> +			ce->guc_id.id,
> +			ce->guc_state.prio,
> +		};
> +
> +		guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +	}
>   }
>   
>   static void guc_context_set_prio(struct intel_guc *guc,
> @@ -4496,17 +4734,19 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   		guc_log_context_priority(p, ce);
>   
>   		if (intel_context_is_parent(ce)) {
> -			struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
>   			struct intel_context *child;
>   
>   			drm_printf(p, "\t\tNumber children: %u\n",
>   				   ce->parallel.number_children);
> -			drm_printf(p, "\t\tWQI Head: %u\n",
> -				   READ_ONCE(wq_desc->head));
> -			drm_printf(p, "\t\tWQI Tail: %u\n",
> -				   READ_ONCE(wq_desc->tail));
> -			drm_printf(p, "\t\tWQI Status: %u\n\n",
> -				   READ_ONCE(wq_desc->wq_status));
> +
> +			if (ce->parallel.guc.wq_status) {
> +				drm_printf(p, "\t\tWQI Head: %u\n",
> +					   READ_ONCE(*ce->parallel.guc.wq_head));
> +				drm_printf(p, "\t\tWQI Tail: %u\n",
> +					   READ_ONCE(*ce->parallel.guc.wq_tail));
> +				drm_printf(p, "\t\tWQI Status: %u\n\n",
> +					   READ_ONCE(*ce->parallel.guc.wq_status));
> +			}
>   
>   			if (ce->engine->emit_bb_start ==
>   			    emit_bb_start_parent_no_preempt_mid_batch) {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 27363091e1af..210c84411406 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -70,6 +70,23 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
>   	fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
>   
> +#define INTEL_GUC_FIRMWARE_DEFS_FALLBACK(fw_def, guc_def) \
> +	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
> +	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
> +	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
> +	fw_def(ROCKETLAKE,   0, guc_def(tgl,  69, 0, 3)) \
> +	fw_def(TIGERLAKE,    0, guc_def(tgl,  69, 0, 3)) \
> +	fw_def(JASPERLAKE,   0, guc_def(ehl,  69, 0, 3)) \
> +	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  69, 0, 3)) \
> +	fw_def(ICELAKE,      0, guc_def(icl,  69, 0, 3)) \
> +	fw_def(COMETLAKE,    5, guc_def(cml,  69, 0, 3)) \
> +	fw_def(COMETLAKE,    0, guc_def(kbl,  69, 0, 3)) \
> +	fw_def(COFFEELAKE,   0, guc_def(kbl,  69, 0, 3)) \
> +	fw_def(GEMINILAKE,   0, guc_def(glk,  69, 0, 3)) \
> +	fw_def(KABYLAKE,     0, guc_def(kbl,  69, 0, 3)) \
> +	fw_def(BROXTON,      0, guc_def(bxt,  69, 0, 3)) \
> +	fw_def(SKYLAKE,      0, guc_def(skl,  69, 0, 3))
> +
>   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>   	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
>   	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
> @@ -105,6 +122,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	MODULE_FIRMWARE(uc_);
>   
>   INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> +INTEL_GUC_FIRMWARE_DEFS_FALLBACK(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
>   INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
>   
>   /* The below structs and macros are used to iterate across the list of blobs */
> @@ -149,6 +167,9 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	static const struct uc_fw_platform_requirement blobs_guc[] = {
>   		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
>   	};
> +	static const struct uc_fw_platform_requirement blobs_guc_fallback[] = {
> +		INTEL_GUC_FIRMWARE_DEFS_FALLBACK(MAKE_FW_LIST, GUC_FW_BLOB)
> +	};
>   	static const struct uc_fw_platform_requirement blobs_huc[] = {
>   		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
>   	};
> @@ -179,12 +200,28 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
>   			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>   			uc_fw->path = blob->path;
> +			uc_fw->wanted_path = blob->path;
>   			uc_fw->major_ver_wanted = blob->major;
>   			uc_fw->minor_ver_wanted = blob->minor;
>   			break;
>   		}
>   	}
>   
> +	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
> +		const struct uc_fw_platform_requirement *blobs = blobs_guc_fallback;
> +		u32 count = ARRAY_SIZE(blobs_guc_fallback);
> +
> +		for (i = 0; i < count && p <= blobs[i].p; i++) {
> +			if (p == blobs[i].p && rev >= blobs[i].rev) {
> +				const struct uc_fw_blob *blob = &blobs[i].blob;
> +				uc_fw->fallback.path = blob->path;
> +				uc_fw->fallback.major_ver = blob->major;
> +				uc_fw->fallback.minor_ver = blob->minor;
> +				break;
> +			}
> +		}
> +	}
> +
>   	/* make sure the list is ordered as expected */
>   	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST)) {
>   		for (i = 1; i < fw_count; i++) {
> @@ -413,6 +450,18 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	__force_fw_fetch_failures(uc_fw, -ESTALE);
>   
>   	err = request_firmware(&fw, uc_fw->path, dev);
> +	if (err && !intel_uc_fw_is_overridden(uc_fw) && uc_fw->fallback.path) {
> +		err = request_firmware(&fw, uc_fw->fallback.path, dev);
> +		if (!err) {
> +			drm_warn(&i915->drm, "%s firmware %s not found, falling back to %s\n",
> +					     intel_uc_fw_type_repr(uc_fw->type),
> +					     uc_fw->wanted_path,
> +					     uc_fw->fallback.path);
As discussed offline, this should not be a warning. Also, the 
request_firmware() call above needs to be request_firmware_nowarn().

Otherwise, it all looks plausible.

John.


> +			uc_fw->path = uc_fw->fallback.path;
> +			uc_fw->major_ver_wanted = uc_fw->fallback.major_ver;
> +			uc_fw->minor_ver_wanted = uc_fw->fallback.minor_ver;
> +		}
> +	}
>   	if (err)
>   		goto fail;
>   
> @@ -822,7 +871,13 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   {
>   	drm_printf(p, "%s firmware: %s\n",
> -		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> +		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->wanted_path);
> +	if (uc_fw->fallback.path) {
> +		drm_printf(p, "%s firmware fallback: %s\n",
> +			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->fallback.path);
> +		drm_printf(p, "fallback selected: %s\n",
> +			   str_yes_no(uc_fw->path == uc_fw->fallback.path));
> +	}
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
>   	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 4f169035f504..7aa2644400b9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -74,6 +74,7 @@ struct intel_uc_fw {
>   		const enum intel_uc_fw_status status;
>   		enum intel_uc_fw_status __status; /* no accidental overwrites */
>   	};
> +	const char *wanted_path;
>   	const char *path;
>   	bool user_overridden;
>   	size_t size;
> @@ -98,6 +99,12 @@ struct intel_uc_fw {
>   	u16 major_ver_found;
>   	u16 minor_ver_found;
>   
> +	struct {
> +		const char *path;
> +		u16 major_ver;
> +		u16 minor_ver;
> +	} fallback;
> +
>   	u32 rsa_size;
>   	u32 ucode_size;
>   

