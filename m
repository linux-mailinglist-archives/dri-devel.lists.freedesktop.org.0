Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4E5B91D5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969E10E229;
	Thu, 15 Sep 2022 00:39:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B9E10E1D7;
 Thu, 15 Sep 2022 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663202343; x=1694738343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rVMMifxsjlmYa3zAE+/LwD9XX92Qh4tCeL6pWsg6RdU=;
 b=DsH3imAkqgy2xwYtB9VJNMKnI2Bwt/dMchwzcTW3mO50I3kGJF4oKGh9
 jj3HRo3Wjg80PFy9eRZyir80aaZBIe8H+f/BoOze75UYi3wGVY2on1Fit
 LD0rU3Z07MTaXIU5iu2yTLMOdL8ohSewnsk/YlB291KD2kYAAeHBt82cO
 mQBFl45fpPV8J0IODzNsaOa0m9mSCVVxIiivQ9SlrBM6XypTSffuuaun7
 F7uDlD92TEyWnDL3j58xBK3qGxBCDfIjrgyYFUmCld+KVdAKBfEJQkgIo
 QCJ9UOt1JoJdZ7qY/ER3r0QZvHJLaagg4ggyYVUFnYDds0K0aEbadGLI5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="298573781"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="298573781"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 17:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="706147396"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 17:38:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 17:38:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 17:38:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 17:38:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 17:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe9f4TdAnWehxnR2N81xFo1VAyum3BS2Aar3xukWbxA9WDKPHBekWd+1EfVKinXMMFWRQVczJNnADLk1EArEVoAfUhBXuTo0mxnGbYHpYvqet+zXl1Ec8nWNLNGr8kfNUBd7YlP7wKEg9Vi2jeBkcYHrqY9vM+YR9jVhhPXI3eprMxNvbdfGo+EElfNHoxHYpEi0mU93aqmOc1VHwIvU5LJuHL+7AuqVuRNL7Yy67DrcaMlZct3prtxh6PcPfZ4gGUwopZWggw1FTYUyb7M8l8CU37bqXkdUpz11UuBmtfCA43D5VcgIkb6wDLyWc81p+80tMU9tzPda2ZrjGkfmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKYK51NWllqAa/WBytzZmNNPpvyQSu03um9qd2hCAIQ=;
 b=O0eApxWCKJghZSHb8jSmzIMLwR1nny6hNQBtaaX8wCcw7/FMCQMBGDEAowBj61O+RoGxquWZ0Z1JSYACG3TXTjcQKHgPt8jDeHomWJkrbfwavJIaf2qSZ1ynrYS7OrJ0tzF5+MmoAmm7gr1zI3JG5N3hNOh8IIF6KddWAx/TPfJADZviaLFzZ+0K54K6dycM5yyu+PUt1x6hloK5Gtzw67pyPE8oBOBdbaMGLvabTww/roKvvF209pHBcuF/dzilqNL9b8pt1ED58N4zEHrdY2hVKoNRHrnW5V3Lwjh2mVvO0sQe3cZ5170SQtiqwze+VQ1PlAAkZOsSxpO/xQ13VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 15 Sep
 2022 00:38:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::c057:13f9:7c74:62b4]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::c057:13f9:7c74:62b4%4]) with mapi id 15.20.5632.014; Thu, 15 Sep 2022
 00:38:31 +0000
Message-ID: <f0b03995-d0ea-1701-7fbd-948ff65f5078@intel.com>
Date: Wed, 14 Sep 2022 17:38:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Update to latest GuC and use
 new-format GuC/HuC names
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220914234605.622342-1-John.C.Harrison@Intel.com>
 <20220914234605.622342-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220914234605.622342-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: da47a230-75f6-42e5-816b-08da96b29d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjcHBcr2Ks0PhVe2X9CME8N+S/R5pk/ANlI3X2I5e1OVhDsFsvL9JSF3sO9qw8onJl2yIqIVLjRpuErbAmKfCGn9TkPY3ED4c6TUhIkhC4tYqP6s60GYXw0Y0vKwrw2qx76AK0bqAHF3DYYKUqRyaN/A99Wnq9KLGal049oHbLc60ifd5Ycag9dYxiofgi9v52G6EHNln3OpuvF68yeXFS7x4bpVEEmmttMN/B/wjaji0inQ5DKHg2bOHw7uw0gGOxVKmqBa03gSX4z1YpeqoCQV40/mkB5Dp+d64Y8+rt4nsLddowtqcIPkVqfEXVskueps4KGMEcg6vOZEn1Vyxk6QqjgUNDGET7Bxw17lA46fDCsXoTexWZjvTBV7H0RysJLts50v/ga57siGNmwAEhnCLhv4dmek7uNc4LpgF0+NMwFKj9PD4yk5TsssicpAjsaQE6Ol8tknJRBxx83o+ey18WEViQcEEyXMjw3pD2SGDSnh9YVTL9phQ0hMniegoIbq1ng92XOpd9ri+rbZVWkGIP88qygVX2Ml6QM1k7PEzpCuPxpPr/X2HC+pMjrC/sW53tbcbCchP30N3uhCYEg47cxff5vvWrsj4cmJAlAseLhXDMrV7Z4uz1z4v6fvf9hpsAQkWrV+X2jEM2+WPiyDOwOIeIsxchhCIyc2oEgLRxdMC255eATjhLgcuDUrn4wPvJ86malCnVa8/kVrDzWsHjY9N+rCv/v3dgb1GIJD5+prAeSWmMnwpM763RymBM8zrQRYy0uuqGczxN+vugHvtawZyxPZ6wZFHa3ZrHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(5660300002)(82960400001)(6506007)(31686004)(41300700001)(53546011)(2906002)(66556008)(66476007)(6486002)(6666004)(66946007)(83380400001)(8936002)(38100700002)(15650500001)(8676002)(86362001)(316002)(4326008)(36756003)(478600001)(186003)(450100002)(31696002)(6512007)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkNBWEVvSUp2clZUcGpaVFdvTE5lWjFKNlF3WWk3NGJhUEQxQUZXNEt5T1JT?=
 =?utf-8?B?RVN1dzUxaXAyUjhPZTd3N1dUMVo3akV6VGFhR3lKZ2t0MFZLeFJtZ2dmNEsx?=
 =?utf-8?B?WGxTakg0dzdVemV2ZG41MzIwMzdBYm5PTkRoNjlyQlZQc251MUtGMEFidEtM?=
 =?utf-8?B?QWNsZnM2WmtySFVTbFZ4Yjd3SkpYVHd5QkZWelpmcG1rWEZwckU3OHJQdzd3?=
 =?utf-8?B?V21jbUI2bzNzS1JMV0g5M2hYaTZDNFRJSHpvRU1CWHM0TC9zTy9sTUtQSkJs?=
 =?utf-8?B?aWJoMTRWY1hIKzFoMUkvZCt3VzRFSnVaZmFxS0JpNUNhUGQxV0trdXlIS3J5?=
 =?utf-8?B?czdmam9CRkR6ZzBOT2JOcWRmOGs5UytSOXdxNWhVUVVXN0F2K1JNb05VTWpX?=
 =?utf-8?B?YVh2WG5Gck9BVWl4YkxUbXYwN1NKd3dsM1BtNEdsUUNPTS85RC84MWdONk9M?=
 =?utf-8?B?REk3U0lwWndzL0I1YTV1TDJERkNrK3Z3M0NrZzVHcHVZVXZ6VlBSYzFtVjVE?=
 =?utf-8?B?M3NtZmszSXlnbGtDVmc4WTZkU0pTY0JYd0k1OGpLdkJyRnB2Y0pKNVBZY3ZR?=
 =?utf-8?B?RFN0SkxUd09GZTFJa0FPdXhLako3QjUrY1pzVTJiazBXU05ZWUliUUtwZkJK?=
 =?utf-8?B?STBGNjJtaUdVSDQyemZVQkpIOTlXWTFRS1JqVDkyRTJFTGY4SUNKdjV0NHRX?=
 =?utf-8?B?ZzNTc2FiRVhqT2Vzc1hGeG5GWnR0Ulg3ODBrTnhxSEJOb1g4SVFEVTY5TXph?=
 =?utf-8?B?a0ZOdjlBQTZtNnZ6K2duUDlqZk9XMUtGdEFUN29Oa2tDMFI5akdHdllKT1pR?=
 =?utf-8?B?UWJRQkVqdjdWYmtLNDRuVnVEZlpsK0RDMXIvQm5WaXVQeEhkMWJnWENiTGJy?=
 =?utf-8?B?dXpaMUhTVkFWcmxTbkRpVVVFZGFqTFZTMWVQTHBnaExXc0FyU01wTnlSMXJK?=
 =?utf-8?B?OU9tUFBKSWtBQzQ3K0hkYTY4SEdqZXFpbExiL2pkb25qZVJCUW51Qk5OeWV2?=
 =?utf-8?B?QUdwMUNaZUxLZ1RzTTdWU0o0dHJPS09tSURiSzNDdC8yUWcxZkpBQTZZSUZU?=
 =?utf-8?B?M2pORndLZFErcHdGV1lCY2JiTFhkYjBYSkxSRlpCcUZMOU1vQmg0dzdOSFht?=
 =?utf-8?B?T0l4ckIzN2N2Q0ZFTzEwK0EwN3NrSWhaV3VBS3BETGZmcU1YVVA3c2pvTkQ4?=
 =?utf-8?B?UjM3aCt1aXZqanBYNUdNYWxuaVFFc0JLS1piekxqc09hdzRQNWMrRHVwMGEr?=
 =?utf-8?B?cWJwenNMMENLVnZSV1BGKzUvcEdWTVBPbTA5QlV5Z04wQU9Ob1oxaXJTVGhh?=
 =?utf-8?B?d0IySmI3Y2ptS0NyTnY5b2dRUktTMm1MeGpXUnN6dUl4UE9UNks2ZWViTmZE?=
 =?utf-8?B?Y2MvalVHS2Nna0JaNlEvVExOVUdLbGp0blRWSzFuMzdIdDY0M1ZLSTRzMTZv?=
 =?utf-8?B?LzBpTlVGWnI0Y29WNEd5Z0NBMHVEUTVrYWR5bmcxNXJMN0hDbzdQYUFWNkN2?=
 =?utf-8?B?ZGc4c3FTQnRLZlAwYXI1Z1ZKMEJyaTZ5dXRXUWU1OWl6dytwWVoxZm4wUVA1?=
 =?utf-8?B?Zkh1cHFNT2N6cDVSY0QvUEljZkh5bVgvcnN1OXppTjNCeUtWWS9QUGVzU1F2?=
 =?utf-8?B?OTY0aTQrdmRlZzkzcm9jd0tBNkRPTjFVQ3JHQUxONzZOVlZ6WXNLMC83ajMv?=
 =?utf-8?B?am83V1F6SDJTSWVOVnRsclZvWkRXaEFTMENFUkhWMXdqdlNRMjhRNlFOaUJr?=
 =?utf-8?B?NnB6ZVRZTkQ2cDRNVTIwQ2ZlcTBmQ0gvQzZJL3BjZ2VrVVY3blBEa3E4WDNN?=
 =?utf-8?B?RkxGT2ROMVJLQzNoU2lQWTcwU2ZIQllRaDF4cEJrckNOSFdIYVNjRStLS2g5?=
 =?utf-8?B?a3UxOVNYZU9GVFpvc0ZsZ0hPV0RHeUdlMXd0djMxKzF6R2tqTXduVzBwSmJz?=
 =?utf-8?B?QVA0TTVhWW9SYXIyMkVPazluUDhyQlFkLzArNll3Um9Vc1UxUDM1Y0tJTFdi?=
 =?utf-8?B?ZmVOSDl3SFhXNTBmOExCSExTMzBjajUwTVQzaGMrblJpeWVRelRqdlhDOW9I?=
 =?utf-8?B?aVlYbEtENGdhajdaWUxjeVlHYlcvdWcvK0NqUjlkdzVQaHJrOXNyM250RlFq?=
 =?utf-8?B?VW9TR0h4THpyRUlzQ21jZWlSSkZSaXNseVlheW1MeFNPQnZja0VOZVpKMEFT?=
 =?utf-8?Q?acDyBEv9VH/xyMPQiSsIBQ0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da47a230-75f6-42e5-816b-08da96b29d16
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 00:38:31.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyA3ZlE7PLbZBkmCeMDMSHDvMXoLsMAfhF1jnT/tairW22psalVUwL/u4aG+mcMWqFzuOOU02qV4ZsRA+ckOwsN0IZrL77/cjNoBI9FbPy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
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



On 9/14/2022 4:46 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Going forwards, the intention is for GuC firmware files to be named
> for their major version only and HuC firmware files to have no version
> number in the name at all. This patch adds those entries for all
> platforms that are officially GuC/HuC enabled.
>
> Also, update the expected GuC version numbers to the latest firmware
> release for those platforms.

You didn't record that this is a v2 (the patch name is different but it 
is the same patch ;) ).
The changes LGTM:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele


> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 1169e2a09da24..b91ad4aede1f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -72,12 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * security fixes, etc. to be enabled.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> -	fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
> +	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
> +	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> +	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
> -	fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
> +	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
>   	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
> @@ -92,9 +94,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>   
>   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
> +	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
> -	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
> +	fw_def(DG1,          0, huc_raw(dg1)) \
>   	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \

