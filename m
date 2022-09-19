Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABA5BD38C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662ED10E04F;
	Mon, 19 Sep 2022 17:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023010E129;
 Mon, 19 Sep 2022 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663608110; x=1695144110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v9TTwU5yGadd3mtBP6D/zs5PqSYZE1RQBckEiMC5d/0=;
 b=hN+43Xy4r99ha4jn9LoQ6VD80ksmZQV8lH+ngJGqIH5foOFHvvYAR6ij
 UoUGwCSYKmv0WYbNYjW8PGSZrTnAhBQu0x9chEfTNY/WM4/xaZ8FPaJnA
 4TaAb3txuCQsvowgrHmjDu6JYWDBJRvUGjx9wPtj4/1yKZp0C6mpUE2xv
 fuy8nn1I6FQIMD1feFZo03AOexhpJiuEho9/6Vgxz6gNwpBQed8HIj0G8
 FneRjeucc7NYzhkAz5mzLdMbY81pzWpCZyNlGkFg1cpNKPRx+w6bcRhRP
 uaZIWY55cCpl4vlwPRam+nOCxuTVXWZhwSPOl96HwyMoQtuef6jWjTbOE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279193244"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="279193244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="620933880"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2022 10:21:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 10:21:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 10:21:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 10:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogXtDMJ735Y8nqgUtXY/IXORTAEaw9EBWj0wmpkDPrWLD8aXf3XfeUsGTLxv6Gx8lEFV+Gfi1s0pL2vpFO4Ywf3KzWABwvlLazl+jXIFr03rUxwoGRMmBelfKOTFIv2SEXCpu6S6vBjSI1u8ygJhWucCYbeRVXTEqpWghoSPfRS48cZAWHCAOdg/iEa2udlytQpcvl8ffOBJ10M+ruPf7Tghqy3Rbfzdc3BUHdf3pZD4NVcxOYsc9LBj2lqNAaHBbplSlAzx5W3/T2781elAHNZUJa4AgzsbV5CGKpnOga2rHEKpVqh+/OeEiktET7ui3QUp0r9kdonv9n8JYe73Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66WW+8qgyWPvFGuIyNswkliHVCX/xJ7i+5XAXaNHbbc=;
 b=ew9HftybLZ2sLVB3O+6L7xmus45zud+t9mE/25QOnrKOviON4vLxfwAvmRevbfASPnZyQC7YYWf+jNhBP9zcqoDpbI9ZoPodOUK6MT96oqfS8os7CMLqgUpP2wb9SoiupzveH5Ml4iLReX1PN0SaTwbfOPLgzGKUd4h9d/hC0B2C4YHWEiXAV9xrkLcsCQh9a6wJm373ilEKearLLgTD8UrBAZOw0EI0KkodVKoh9WfgdeDW889a1urIXAsFAT86K1YUg/swKO10MLJOJqguazGJLNjv4/V9KTumEjV7gOSLv5HT+FtpUz6/I/eLZ3cgdusQoPTCNr9vDq5E+hp/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 17:21:47 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b8f7:e789:58d6:f0ee%8]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 17:21:47 +0000
Message-ID: <2743efaf-47e2-0df2-26a0-14e4658fc88f@intel.com>
Date: Mon, 19 Sep 2022 22:51:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/mtl: Modify CAGF functions for
 MTL
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20220919115906.1264041-1-badal.nilawar@intel.com>
 <20220919115906.1264041-2-badal.nilawar@intel.com>
 <YyidgzOwS5CT+RVN@alfio.lan>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <YyidgzOwS5CT+RVN@alfio.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe79e69-4cbf-480a-11cd-08da9a636e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3FncZhJpgYgBbYKfuwf7Fkj+TJmwpW9FYtk3sAuS7bo+dEvvrzP2t6oq/S2c7XCCwsnbZo6iIgB/VgzYL0qf+HyvLQxvmjt2VNs9JDkln4wjNLuWZyya54NohpR40DzkNHGWICPXrKb/mVdIwdczpBQv0XLXumDF1mMgeqq0hWmYM+RT9MPeWmfDtsIZPVgaUUKionvsTVKF8BHNDsnC5Nx6ZA2oDoAbnUO+dmGSB3u8LrVaXVFf+joy4j1ftYwGAjM5paiXrwn7xk0rhV7/y9Wzer/gkWKShLsEAgtSygu/2aXLg2ftYRn9SadE1yjr+JWMzyjOyyY/zdUVVwTsgsYgllA6RFvcW4M1PkpCOSOwhE+dngeJYVFd0r4ek8MMYWRtFtkqmh+hERYpKiUCBsFAig6h3sg6LaTAMTtvdBT5kohy2lEfqUFsGlh/p612LIOrRcJYCriQBZ6U5w8zp6Klcu0dbyvNuNmIZn+TNGhO0OHW7kFTmWASmoN76LwZ85j34yrHOWQ6UbEQSMXcLQchnyqswXMFbp3ZJnZHYMWE0VyLgVRFi5zNS06onCyYV0JJFZfhfGNnt+BVdxpBdEx4gc5JUK79dprm+Y/SyM3q6T6WaLNb7KSvDd/xjouxCMleXl31MKLS3pTV5JGx6Cjyb4MWqArRwYWTlFHFvN6ZnsZ2JkH/lVQTsl+eozaXjxIrX/0kW9rOVNpIkd77bbeGh2llKfclji9u5y/6sF37Y+5KjW2wg/Y+jDO+GDc9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(6506007)(82960400001)(53546011)(186003)(2906002)(6512007)(2616005)(26005)(86362001)(31696002)(966005)(6486002)(316002)(6916009)(4326008)(41300700001)(8676002)(66946007)(66556008)(66476007)(478600001)(6666004)(36756003)(31686004)(8936002)(5660300002)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUQwTjN3bVFqVEU5TFZTb01hTUphN283Q24xeU1oejlmZElNS3VxbzBmRU1B?=
 =?utf-8?B?eDVMMHNvbk5UemJUdHJjNzcvZURUb2duc21aUkRpQ2ZodmRPK0g0dkxXYUJW?=
 =?utf-8?B?QzRCRktlanY5Qng4dkRGOWlNQ2pXUnl2YmR5aDQwalJlWmlKeVNiRmd3OE9m?=
 =?utf-8?B?S3E2cUtuY2pRczJJYWdNbDNUWGo1YWlyVHoxV0VidW9qdUg4SjFCYUV3bzRv?=
 =?utf-8?B?bG5FdXh6U0d1S0IydWFwaVR4RGYyK3ZFMlQrOEdXUFI2bDdMOXRqd1ovcUFo?=
 =?utf-8?B?MFdseStMaDBpY092dnQ1bjRXMVB2Y3ErYmc1NC9jVzNTUVY3US90dnRWWlZL?=
 =?utf-8?B?aFRQeXFTcHBBZjBySUxpRUowN1lkZTNhYThGSTlpYlBQZ0xRTEhzdWxLUE5q?=
 =?utf-8?B?SjFXSEM3a3d4aElHTHBGazYxNytLeXdJVnY0cEcvSVNRR3lFQ3RJR3RpOHBq?=
 =?utf-8?B?cjhUUU93ZDJhSkpySmpTS2NjRG9wdnhFekZaTitOanFDRFlmT0FPL3dlWE1u?=
 =?utf-8?B?SXcwSUlSbGhNNmZva3ZwcjdKY3daNmtPeXlEZEVoMXUwU3JBbUU4ZzluNzhK?=
 =?utf-8?B?Tm9acm9RU2lERWYvZVRWQlE1eiticU9CMGZiWUN6UkJsWUxjWGpBdXkzSjZp?=
 =?utf-8?B?b1JqZnVDRTZnMjlvWENjQXU3aE9ROXNmbndOKzJqM01qNzhXWUIzQ2t1cHlp?=
 =?utf-8?B?dmZRVEZRbitzM1h0cW1JSmg1TkR6Sit6Vk9maFd5N2Y4MThrVjIrZHVMdkwr?=
 =?utf-8?B?TmNPcHAxZ0pYYUtHdVpvcHBmbDZKcnBvYnNRSVhJdGxhZzNnRU9FTkw4c00x?=
 =?utf-8?B?azBDNW9LZ1pRR1NjaUM3Y1FITW00UWhQS3QxUEltQ0p3RDZlQUwvQ1dRVzdu?=
 =?utf-8?B?Wjh5QWVQTUdTTHplR2NKVHlPRzFiT3NZVW56d1lDYWI0d1NabUtNd2dsRVpq?=
 =?utf-8?B?TTZZRVdCOXM1bEVCa2svOFh5QkFTRzNTL1pZRVYxbTVCS1FGL0dDcW82ejZj?=
 =?utf-8?B?bTFEM2FaWndzNkNselRwN3htQlU4N2FzUHlDQW52TUxMZ3F4NUhoK3FuZHc1?=
 =?utf-8?B?S2xuQnRYTy8wVW9KVjhNQ09FeldyTlJHdElvTHRZVEc3Y2FoKzBFN3JnMGE5?=
 =?utf-8?B?UlNWbzBEeklJanFQUlFKN0xMNm1nZnp3WmJxNlhZMW9VQTFtNE5yMGgxeUR3?=
 =?utf-8?B?b1UvQWFEMDVmWXdsTk9JU3UwSzh1RUJOb0xpdGhlMG03bVZCZHExcFFqWEFD?=
 =?utf-8?B?MzhLa1ZGbmZsZnZIaDQvZlM4SlU0SWxiQnpQRmhsOWd0aFBGV2x0RTV4Zm5x?=
 =?utf-8?B?WkRaU0o4cmVrV3pVUTBCb0F4UEVVUSt5M1pZMnBRZ0d1aUdWditRWm9OeEpj?=
 =?utf-8?B?THZvelh6Zmd0MHRsczE5V29PREV0aWQ1N3JVNnh3RFVyZ2FiZ1pyU3pBNDFW?=
 =?utf-8?B?NFFjSWVJdlB0dStSRmlpKzVqUEQ2QXZQSEJ0MzY2SzRCYU9ZdzNRS2tBdSth?=
 =?utf-8?B?N3FYZ2VweFRsa1hld293cFExNEJYcGkzRkpoNlZ3N2wvT1RaZEJyMGxKbXZI?=
 =?utf-8?B?WngzaVRqK2puemF1Z1RPczV1OHd1bVAyaGNRdTdOSktJU2RVVEJkYWQzcTc5?=
 =?utf-8?B?eXY2YzF4bnJGclNkU0RCSkNPR0dSd2hBajJ0SVh5N205SUpuaGpMb0VRYUxR?=
 =?utf-8?B?Q2UreUtwOFBFYVBUajZBdExLckhqcXR3MCt5amkwdXJhb0lORWdCQWd1N284?=
 =?utf-8?B?ZGdHT0w0VWdXaGI5Y0lVQzBGb1hIWFh3bUFRRjNJRU5sbVJrb2t0TFVuc2J3?=
 =?utf-8?B?VVVncUVqTHNTU0w5RmxFRG5nQlBNYU42ZnhRdkNkVUp4SjVJRTFaVEVFR3Jw?=
 =?utf-8?B?YW1BSXV4ZTIvNmVJVFRPSXdJMzl3RmJPaDI0MWxSSHFWWWVjZkpOUnRUdEcy?=
 =?utf-8?B?QjNoVVovMThxM0R0VStlQ1l4QnVxYkZyTDhaWDJsOUFxUkI0RWNlVWlpZ2o3?=
 =?utf-8?B?dWpUOXpuaitOWHQ0WDVUalkySVVpQ3JjUy9ac2R4UFc4cHZqR0hXTVhrWGMw?=
 =?utf-8?B?MzRNYVpLN3lORG53UHpOZk9WSmVoYk1Bc0JsRFlHVU5UVG9weEUxQTlia2lL?=
 =?utf-8?B?dnVSODZyNXMzUzUrVmxOMmRIcUVDbHlnY2t4Snp4WTBKRno1ZHViV3lvY2Rv?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe79e69-4cbf-480a-11cd-08da9a636e63
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 17:21:47.4053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHg7+eAQy9oIu/QKa45Kcxczic6caqchZj3OVcL1+CY0NbHgGWv0oqxE4aCyB3l0SGmQZQuRqC7i+hs/rHf+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19-09-2022 22:19, Andi Shyti wrote:
> Hi Badal,
> 
> On Mon, Sep 19, 2022 at 05:29:05PM +0530, Badal Nilawar wrote:
>> Updated the CAGF functions to get actual resolved frequency of
>> 3D and SAMedia
> 
> can you please use the imperative form? "Update" and not
> "Updated".
Ok.
> 
> Besides I don't really understand what you did from the
> commit, can you please bea  bit more descriptive?
Sure I will describe more.
For MTL Current Actual GFX frequency (CAGF) can be obtained from regs 
0xc60 (GT0) and 0x380c60 (GT1). So to support MTL I modified functions 
read_cagf and intel_rps_get_cagf.
> 
>> Bspec: 66300
>>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h | 8 ++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.c     | 6 +++++-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 2275ee47da95..7819d32db956 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -1510,6 +1510,14 @@
>>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>>   
>> +/*
>> + * MTL: Workpoint reg to get Core C state and act freq of 3D, SAMedia/
>> + * 3D - 0x0C60 , SAMedia - 0x380C60
>> + * Intel uncore handler redirects transactions for SAMedia to MTL_MEDIA_GSI_BASE
>> + */
> 
> This comment is not understandable... we don't have limits in
> space, you can be a bit more explicit :)
Below I defined only 0x0C60, so I am trying to say that 
intel_uncore_read/write functions takes care of adding GSI offset i.e. 
0x38000 if the access is for Gt1 (SAMEDIA).
This patch gives more clarity about GSI offset 
https://patchwork.freedesktop.org/patch/502004/?series=107908&rev=5

Regards,
Badal
> 
> Andi
> 
>> +#define MTL_MIRROR_TARGET_WP1          _MMIO(0x0C60)
>> +#define   MTL_CAGF_MASK                REG_GENMASK(8, 0)
>> +
>>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>>   #define   GEN11_CSME				(31)
>>   #define   GEN11_GUNIT				(28)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 17b40b625e31..c2349949ebae 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2075,6 +2075,8 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>>   
>>   	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>>   		cagf = (rpstat >> 8) & 0xff;
>> +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>> +		cagf = rpstat & MTL_CAGF_MASK;
>>   	else if (GRAPHICS_VER(i915) >= 9)
>>   		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
>>   	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
>> @@ -2098,7 +2100,9 @@ static u32 read_cagf(struct intel_rps *rps)
>>   		vlv_punit_get(i915);
>>   		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
>>   		vlv_punit_put(i915);
>> -	} else if (GRAPHICS_VER(i915) >= 6) {
>> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>> +		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);
>> +	else if (GRAPHICS_VER(i915) >= 6) {
>>   		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
>>   	} else {
>>   		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
>> -- 
>> 2.25.1
