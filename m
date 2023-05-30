Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600277171B7
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373210E43F;
	Tue, 30 May 2023 23:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95F510E43D;
 Tue, 30 May 2023 23:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685489453; x=1717025453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DBh9+CFEr5vIkuxTxRESpYTsCrDnp8+9Y/g7Xkxdm60=;
 b=JTE4hAhDojP0vPWVtmzk4/xkpuaJ2pFrA37WyydmMzVh5ZNSzcExRzTG
 inS2b7cFyWDneh6rHuPX4BN/XD8Wmu0MkYv4ogKJS9TadFet85ebTHx1E
 aZKI7DfgOF8fIIobpMiAxYJOxI6+R1Js7m8Vb4ma1XQkgQF65N4ODn3oX
 8AkEjd8AWu/sw+T4p+vLVw7IjpbBcVG4SJCfXuYXyYDOYw4ETNCvxywBf
 Jj56Mrj+lGb006uD6xLD6JE8WGPPsf6xzoCNXBQ27Nm6eWrSzGVGWhnMV
 51FrpTZKZ1LU6Ozi8C9FTeA3rGO93rmtFMAa7luaNZDGuOi4iKoOg5POY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="335423119"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="335423119"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 16:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="700834882"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="700834882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 30 May 2023 16:30:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 16:30:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 16:30:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 16:30:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBsM4T5y6YW81YvcvnpvxGWoPlHLozDCAUeoSz9gjBFhFu3eOC68eh+458pw98v3UU+Tl1aUJ8OEi49KQpiUSCandhgnxR73BV+VxhKKLoe048/6QdjCbqGgbw88/PLeVNomw8R28sSC1i50EfuwsyOSA0wBCiE54Tj2pA21tai1SAju8PGxmLgJQKIoNaj4OmmlZ8QDOBNOCG5IzJfiVV9hSJnN0YJEUwpzNVzuBDzPs10URKkZ8Kw0HsrIpI3p+1SZO4PTQ/2hWfJj0Zn6bApSA6EVCh+fgzUKc+QjfS4U8v6HtR6lt+riXYfvCu5mcSdNjU45UuQ75nP6V4RTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E5w/wT+5P5c+hb4KPHKUz+TYqEYp+b6qDRtTFognvM=;
 b=BtC3rcStp3lR+h/KMrddI9n6znyMbZ52go9M4ZMWu/17FI81dl06OTz2+EgmXN+fQkwtQwVnnffzrhzfTofcPfgWd7RhJofo4t2qI7MIfs9PEbTZhOpgbQeceJoCI2gx7306xzmc9k0ZhkAXW5VDXqpPSEZNJHoZ6XbA01kC4x7rmCQGder2vxJBiIgs7UZyAj4igyFUiaq6HruQbSp5/xswP4bbrBljUGSVJqP8AotBCjH5VAHD78ODjffsIUgndGTfsy4RTlqCTYP5TSa7M15/VDWorM809u/gx/PbcZO+M4imvgZXHzBeqLrZlLnFpWO+/ANXa6LIp4mmbjpMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Tue, 30 May
 2023 23:30:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 23:30:44 +0000
Message-ID: <f4cd5240-ba88-8b7b-167c-81d90be88c52@intel.com>
Date: Tue, 30 May 2023 16:30:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/7] drm/i915/huc: Parse the GSC-enabled HuC binary
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-3-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230527005242.1346093-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b4792b-6848-449b-2b49-08db6165e3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vn02gPFkNkGVh66yxn09TVqgD4aJPjk2HiVVbyhpIDw/KvK5/Niw1aTfb+2012uvlsxVvugVCbJdJdnHWDeLKUkCEt6XxaTKdrV7ruv10k+q2tsyg2zcBgz1k1QPeG/VDO5VnlELokl0A2EWct2jTyIrkCynwPncJfEBTbMAvpg97w7jSX1KuOpB26CpW9JCUFBY/6y/hbyANX5DV1hafRfrIUfW39HCzR6v6ifZYbFywgkcGfTVl1EnOPmU3BPHQh474bZwfMLo1hSVAWZkyzOlnq1PAr4us8HTir7Hs9KzyDQIRKSV+fbdxjulVeSlTqFC8zzONQ3LZHfMr1Wym22V6NeIdlSOqrTp/TMaD1kb/BRYG1BwfHriSZUEBmKHM57P4SkJrw37jQwxMEo7UC0xtBU2ywd2Q76qyyQ1pCvTQYNsO2M/9oAQ4MqaX9skzKxxZDf4PBr8MKe+fv4MCeVgyTdWTzAoZCYPVJqeXDLqjGo18isLcmWmZGukPuB1kE1qUGfmYX+xvUKcFCWaUgs2oOdxvvSZQHnqZ8a50YOqXCZx1TJcdDs2J/LWqLkaoCfTohF9s/u2Cw3LedoaxPwQ7rkvBBz3exT+csC0hQ6gO+SeQjR1Yg71O6dJy5S2vszPZ28RfLcmwwb6LwkoJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(31696002)(6486002)(41300700001)(86362001)(4326008)(316002)(450100002)(66476007)(66946007)(66556008)(36756003)(2616005)(5660300002)(186003)(30864003)(2906002)(53546011)(6512007)(31686004)(6506007)(26005)(107886003)(38100700002)(83380400001)(8936002)(82960400001)(8676002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZExBOGxGQ2xIOVozRG94Wk45MVRaazluWTBKQkhJOEhSSFc4VGpacnR3MUpj?=
 =?utf-8?B?U0NpQ3lHZ1hKMnFJcTJ5WU02Ty9UVmRDYnFPMkJIY3ZkUllzcmZoREdTUUR2?=
 =?utf-8?B?WHczR3dqSUgxV1UvNFFBdUZtcitJQ2lpa1ZxcXBFTlFhNWlSMDBCVzU3czhS?=
 =?utf-8?B?OWUrTXE4NkpKS3I5U0ExRzNsdjZ3cit0ZFBSa3dsYnN2bkZBN3BWakgva2VZ?=
 =?utf-8?B?NzFkeHNCYktTZEE2VWxNNndZRlUzeXdSNHZQd1ppUGNIVzBtUzJxajdTVDZD?=
 =?utf-8?B?aEVkSnBTWXBHSlovckdmQ1B6ZE1FM2JuaDU0Z0VHY09BejVldnkyUzBKeXE1?=
 =?utf-8?B?eDFWSzlFejZkUXNRSzMyYjJyWDYycmcxcys0WVVxSnJZc1Z4Y1BRQ2UwU3Fo?=
 =?utf-8?B?bjc4UFo5c2JWSk9RN0I4NW44VGpsWHpQRXpYZDI1alNkQ0xJTEpNZkhjdVI5?=
 =?utf-8?B?WE5yUjJNZHJnclB0bEdFQmRIWXE1Q09wRG1PRnpQQUt4RkRXTUNJWVFJWkto?=
 =?utf-8?B?TndqTGxWMjYwdGR4VEE4S0lJYXp4ZlQwNjFyTENNbkt4TUpSUmI1RjgxbTNm?=
 =?utf-8?B?UFJmUE1DUjduQ2I2Vi9nOHVJTUxFSTM5eEVPV1Q3Wi9xZS9oSWJQS283MlNC?=
 =?utf-8?B?ZUw5M0I2NmdWajZtMDgxbXFDOElnWXMxOWgzbXAwNFVFaDdOMjFQT3FieVZL?=
 =?utf-8?B?NVFDeUNpcVA1OWh5dlM4UTZSTlFlMzcyQUdOU2tyZ2EyQlF3MVk3SUU0Ui9J?=
 =?utf-8?B?NWZmMzlOM0lrcEF0NTNiRG5NUDdqU2JWNUhZcE5pcVlQYS9ZMlZHM3A4bjhY?=
 =?utf-8?B?U0cyTGZyL1RJLzhIR2NaMEY1M1VXTWU3VGVOOVBjUW9BNGxmRUNWZ3NBTkZn?=
 =?utf-8?B?Yi8vaDV1WkI5OUZVYVpQU1VuZ0dXU2NiTUxkN2pydHA1WHRoeEdLaGFlR3ZJ?=
 =?utf-8?B?dEFMNldmSjNUbVVQZi9VVzNIOUxtWE8zZkdtUThTbmNnZHVhL1N6d1FQTGJ6?=
 =?utf-8?B?WGErRkhPTmxhc09HRDNjbzRiYmlSelI0OWhLQ2lxeE5XbU5mZmQrc1ROVUZ5?=
 =?utf-8?B?RWFmSlkvbnlvditPdWh6WVZiUytsNUoyZEtyQWlxeGpzVUVsV0o1TWh2SDRN?=
 =?utf-8?B?S29TaDI5UEVFR0xLNnBOakdVZEMrWTgrUlh3VzZEZ3RwNTQyK3Bsdk8rWEFE?=
 =?utf-8?B?NGwrYjBsOXhhY3JpQUh6VVBrdll0aWRybFFwdHg5T1FHdkVtTFl0WmdiV3BX?=
 =?utf-8?B?NDlqSkcxK09DT09zVkEwVVlnUTJpRXd1R3BqRWVpck1STk9QVzRWdGkzd0RL?=
 =?utf-8?B?V2dlOUtnalNXL3h3MDV3WDJ0VksyYU5vVWNZdk1VRDhFczBuYWZHN3E1YS9t?=
 =?utf-8?B?SUUvbVpEdFZNMmkzY01xclFaOVpvK1ZIYS96SnpKUEsxK3YweEp1OUJzSkFE?=
 =?utf-8?B?R3ZvYmc4YW03bFFEL3dCb3pVdFdYdG1UUFYyaFZicWpVQWh2aGJkbkhrT1NY?=
 =?utf-8?B?OUQxaGVXM3F5ZXBTS3Nnc3pDdGNrZU13ZlVOcmErU3Fhemp3UHlCdlIwV1hh?=
 =?utf-8?B?dngxRVJzVmhBYWI0UlozT1EyWnZHNzJRYmlSNThDUW9reFVCeHMycjJJMlpN?=
 =?utf-8?B?MHBJdUFCSXI2ZmNsYVd1UEtxTEhMSkkvQTd2MHcrVGhNMVZSZ3ZMWGV5Ryt6?=
 =?utf-8?B?aWV4N2dYTGlRUzFlRVp5Vm9jZCtaZHY3cng1K2xMYmI5ZVBjdHlmV0ZjMkF5?=
 =?utf-8?B?TFNsNTVtK3ZPektLQzZmeG55VG54amttMzRGWm95amNMUkNOZDJqd1hHcG1N?=
 =?utf-8?B?cEUvSG9NMDFaWEgrOHE3V0dyNEpObXYvRmRQc25nNkRLUWM5cFZVeEFIMWhL?=
 =?utf-8?B?RVFqeFJhNFhrcU9adDdIYkVzZVlEMCtXQjYxTkVwZmtIdUJpN01UUWRjMlIx?=
 =?utf-8?B?Ynh0WHovSDBOVlZFdmFYcStTZExVVGk2SUZaa0kxNEdFSnZHTlRPY0RhRXRk?=
 =?utf-8?B?SnR0cktJZHUzV0hSUGtPTHAweUZTN2s1eVNCOTZZMWRqbnVsejdUY2l5bXBv?=
 =?utf-8?B?bUFIRWs4NGhsTk5KVFlCcWNiOXVtY1FqVjBPaGZlcitrbE1iblVSSm0zT3g1?=
 =?utf-8?B?aisvY1Y4MGhJbVJwQ1lxMDNxVndDVWNXdkZSeDVQN044Rld2UDhoNkFHMkRw?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b4792b-6848-449b-2b49-08db6165e3b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 23:30:44.4782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBqU10mKGyilIn4xAETs17uU1wXrkSTlMFX5UHNtfzVyFdkif1oLRINdj6hPbIf2bHcvb679WRS8JcVDJPoHQbNx96IWe5i425DhPWLKKBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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
> The new binaries that support the 2-step authentication contain the
> legacy-style binary, which we can use for loading the HuC via DMA. To
> find out where this is located in the image, we need to parse the
> manifest of the GSC-enabled HuC binary. The manifest consist of a
> partition header followed by entries, one of which contains the offset
> we're looking for.
> Note that the DG2 GSC binary contains entries with the same names, but
> it doesn't contain a full legacy binary, so we need to skip assigning
> the dma offset in that case (which we can do by checking the ccs).
> Also, since we're now parsing the entries, we can extract the HuC
> version that way instead of using hardcoded offsets.
>
> Note that the GSC binary uses the same structures in its binary header,
> so they've been added in their own header file.
>
> v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
>      message, check ccs validity, drop old version location defines.
>
> v3: drop references to the MEU tool to reduce confusion, fix log (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
> ---
>   .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  74 ++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 135 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  71 +++++----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
>   8 files changed, 272 insertions(+), 53 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
> new file mode 100644
> index 000000000000..714f0c256118
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GSC_BINARY_HEADERS_H_
> +#define _INTEL_GSC_BINARY_HEADERS_H_
> +
> +#include <linux/types.h>
> +
> +/* Code partition directory (CPD) structures */
> +struct intel_gsc_cpd_header_v2 {
> +	u32 header_marker;
> +#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
> +
> +	u32 num_of_entries;
> +	u8 header_version;
> +	u8 entry_version;
> +	u8 header_length; /* in bytes */
> +	u8 flags;
> +	u32 partition_name;
> +	u32 crc32;
> +} __packed;
> +
> +struct intel_gsc_cpd_entry {
> +	u8 name[12];
> +
> +	/*
> +	 * Bits 0-24: offset from the beginning of the code partition
> +	 * Bit 25: huffman compressed
> +	 * Bits 26-31: reserved
> +	 */
> +	u32 offset;
> +#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
> +#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
> +
> +	/*
> +	 * Module/Item length, in bytes. For Huffman-compressed modules, this
> +	 * refers to the uncompressed size. For software-compressed modules,
> +	 * this refers to the compressed size.
> +	 */
> +	u32 length;
> +
> +	u8 reserved[4];
> +} __packed;
> +
> +struct intel_gsc_version {
> +	u16 major;
> +	u16 minor;
> +	u16 hotfix;
> +	u16 build;
> +} __packed;
> +
> +struct intel_gsc_manifest_header {
> +	u32 header_type; /* 0x4 for manifest type */
> +	u32 header_length; /* in dwords */
> +	u32 header_version;
> +	u32 flags;
> +	u32 vendor;
> +	u32 date;
> +	u32 size; /* In dwords, size of entire manifest (header + extensions) */
> +	u32 header_id;
> +	u32 internal_data;
> +	struct intel_gsc_version fw_version;
> +	u32 security_version;
> +	struct intel_gsc_version meu_kit_version;
> +	u32 meu_manifest_version;
> +	u8 general_data[4];
> +	u8 reserved3[56];
> +	u32 modulus_size; /* in dwords */
> +	u32 exponent_size; /* in dwords */
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 268e036f8f28..6d795438b3e4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -6,23 +6,14 @@
>   #include <linux/types.h>
>   
>   #include "gt/intel_gt.h"
> -#include "gt/intel_gt_print.h"
>   #include "intel_guc_reg.h"
>   #include "intel_huc.h"
> +#include "intel_huc_print.h"
>   #include "i915_drv.h"
>   
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
>   
> -#define huc_printk(_huc, _level, _fmt, ...) \
> -	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> -#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> -#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> -#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> -#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> -#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> -#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> -
>   /**
>    * DOC: HuC
>    *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 534b0aa43316..037d2ad4879d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -5,11 +5,146 @@
>   
>   #include "gt/intel_gsc.h"
>   #include "gt/intel_gt.h"
> +#include "intel_gsc_binary_headers.h"
>   #include "intel_huc.h"
>   #include "intel_huc_fw.h"
> +#include "intel_huc_print.h"
>   #include "i915_drv.h"
>   #include "pxp/intel_pxp_huc.h"
>   
> +static void get_version_from_gsc_manifest(struct intel_uc_fw_ver *ver, const void *data)
> +{
> +	const struct intel_gsc_manifest_header *manifest = data;
> +
> +	ver->major = manifest->fw_version.major;
> +	ver->minor = manifest->fw_version.minor;
> +	ver->patch = manifest->fw_version.hotfix;
> +}
> +
> +static bool css_valid(const void *data, size_t size)
> +{
> +	const struct uc_css_header *css = data;
> +
> +	if (unlikely(size < sizeof(struct uc_css_header)))
> +		return false;
> +
> +	if (css->module_type != 0x6)
> +		return false;
> +
> +	if (css->module_vendor != PCI_VENDOR_ID_INTEL)
> +		return false;
> +
> +	return true;
> +}
> +
> +static inline u32 entry_offset(const struct intel_gsc_cpd_entry *entry)
> +{
> +	return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
> +}
> +
> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size)
> +{
> +	struct intel_huc *huc = container_of(huc_fw, struct intel_huc, fw);
> +	const struct intel_gsc_cpd_header_v2 *header = data;
> +	const struct intel_gsc_cpd_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	int i;
> +
> +	if (!huc_fw->loaded_via_gsc) {
> +		huc_err(huc, "Invalid FW type GSC header parsing!\n");
I'm still not understanding what this error means. Is it meant to say 
'Invalid FW type *for* GSC header parsing'?

'fw->loaded_via_gsc' is set from the blob table, yes? And 
intel_huc_fw_get_binary_info() is only called from check_gsc_manifest() 
which is called from check_fw_header() iff fw->loaded_via_gsc is set. So 
it should be impossible for this test to ever fail, yes?

John.

> +		return -EINVAL;
> +	}
> +
> +	if (size < sizeof(*header)) {
> +		huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/*
> +	 * The GSC-enabled HuC binary starts with a directory header, followed
> +	 * by a series of entries. Each entry is identified by a name and
> +	 * points to a specific section of the binary containing the relevant
> +	 * data. The entries we're interested in are:
> +	 * - "HUCP.man": points to the GSC manifest header for the HuC, which
> +	 *               contains the version info.
> +	 * - "huc_fw": points to the legacy-style binary that can be used for
> +	 *             load via the DMA. This entry only contains a valid CSS
> +	 *             on binaries for platforms that support 2-step HuC load
> +	 *             via dma and auth via GSC (like MTL).
> +	 *
> +	 * --------------------------------------------------
> +	 * [  intel_gsc_cpd_header_v2                       ]
> +	 * --------------------------------------------------
> +	 * [  intel_gsc_cpd_entry[]                         ]
> +	 * [      entry1                                    ]
> +	 * [      ...                                       ]
> +	 * [      entryX                                    ]
> +	 * [          "HUCP.man"                            ]
> +	 * [           ...                                  ]
> +	 * [           offset  >----------------------------]------o
> +	 * [      ...                                       ]      |
> +	 * [      entryY                                    ]      |
> +	 * [          "huc_fw"                              ]      |
> +	 * [           ...                                  ]      |
> +	 * [           offset  >----------------------------]----------o
> +	 * --------------------------------------------------      |   |
> +	 *                                                         |   |
> +	 * --------------------------------------------------      |   |
> +	 * [ intel_gsc_manifest_header                      ]<-----o   |
> +	 * [  ...                                           ]          |
> +	 * [  intel_gsc_version fw_version                  ]          |
> +	 * [  ...                                           ]          |
> +	 * --------------------------------------------------          |
> +	 *                                                             |
> +	 * --------------------------------------------------          |
> +	 * [ data[]                                         ]<---------o
> +	 * [  ...                                           ]
> +	 * [  ...                                           ]
> +	 * --------------------------------------------------
> +	 */
> +
> +	if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
> +		huc_err(huc, "invalid marker for CPD header: 0x%08x!\n",
> +			header->header_marker);
> +		return -EINVAL;
> +	}
> +
> +	/* we only have binaries with header v2 and entry v1 for now */
> +	if (header->header_version != 2 || header->entry_version != 1) {
> +		huc_err(huc, "invalid CPD header/entry version %u:%u!\n",
> +			header->header_version, header->entry_version);
> +		return -EINVAL;
> +	}
> +
> +	if (header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
> +		huc_err(huc, "invalid CPD header length %u!\n",
> +			header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	entry = data + header->header_length;
> +
> +	for (i = 0; i < header->num_of_entries; i++, entry++) {
> +		if (strcmp(entry->name, "HUCP.man") == 0)
> +			get_version_from_gsc_manifest(&huc_fw->file_selected.ver,
> +						      data + entry_offset(entry));
> +
> +		if (strcmp(entry->name, "huc_fw") == 0) {
> +			u32 offset = entry_offset(entry);
> +			if (offset < size && css_valid(data + offset, size - offset))
> +				huc_fw->dma_start_offset = offset;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> index db42e238b45f..0999ffe6f962 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> @@ -7,8 +7,11 @@
>   #define _INTEL_HUC_FW_H_
>   
>   struct intel_huc;
> +struct intel_uc_fw;
> +
> +#include <linux/types.h>
>   
>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
>   int intel_huc_fw_upload(struct intel_huc *huc);
> -
> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size);
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
> new file mode 100644
> index 000000000000..915d310ee1df
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_HUC_PRINT__
> +#define __INTEL_HUC_PRINT__
> +
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
> +
> +#define huc_printk(_huc, _level, _fmt, ...) \
> +	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> +#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> +#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> +#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> +#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> +#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> +
> +#endif /* __INTEL_HUC_PRINT__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 31776c279f32..9ced8dbf1253 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -548,33 +548,6 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
>   	}
>   }
>   
> -static int check_gsc_manifest(struct intel_gt *gt,
> -			      const struct firmware *fw,
> -			      struct intel_uc_fw *uc_fw)
> -{
> -	u32 *dw = (u32 *)fw->data;
> -	u32 version_hi, version_lo;
> -	size_t min_size;
> -
> -	/* Check the size of the blob before examining buffer contents */
> -	min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
> -	if (unlikely(fw->size < min_size)) {
> -		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
> -			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, min_size);
> -		return -ENODATA;
> -	}
> -
> -	version_hi = dw[HUC_GSC_VERSION_HI_DW];
> -	version_lo = dw[HUC_GSC_VERSION_LO_DW];
> -
> -	uc_fw->file_selected.ver.major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.ver.minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.ver.patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
> -
> -	return 0;
> -}
> -
>   static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
>   {
>   	/* Get version numbers from the CSS header */
> @@ -631,22 +604,22 @@ static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *c
>   	uc_fw->private_data_size = css->private_data_size;
>   }
>   
> -static int check_ccs_header(struct intel_gt *gt,
> -			    const struct firmware *fw,
> -			    struct intel_uc_fw *uc_fw)
> +static int __check_ccs_header(struct intel_gt *gt,
> +			      const void *fw_data, size_t fw_size,
> +			      struct intel_uc_fw *uc_fw)
>   {
>   	struct uc_css_header *css;
>   	size_t size;
>   
>   	/* Check the size of the blob before examining buffer contents */
> -	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
> +	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>   		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, sizeof(struct uc_css_header));
> +			fw_size, sizeof(struct uc_css_header));
>   		return -ENODATA;
>   	}
>   
> -	css = (struct uc_css_header *)fw->data;
> +	css = (struct uc_css_header *)fw_data;
>   
>   	/* Check integrity of size values inside CSS header */
>   	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
> @@ -654,7 +627,7 @@ static int check_ccs_header(struct intel_gt *gt,
>   	if (unlikely(size != sizeof(struct uc_css_header))) {
>   		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, sizeof(struct uc_css_header));
> +			fw_size, sizeof(struct uc_css_header));
>   		return -EPROTO;
>   	}
>   
> @@ -666,10 +639,10 @@ static int check_ccs_header(struct intel_gt *gt,
>   
>   	/* At least, it should have header, uCode and RSA. Size of all three. */
>   	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
> -	if (unlikely(fw->size < size)) {
> +	if (unlikely(fw_size < size)) {
>   		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, size);
> +			fw_size, size);
>   		return -ENOEXEC;
>   	}
>   
> @@ -690,6 +663,32 @@ static int check_ccs_header(struct intel_gt *gt,
>   	return 0;
>   }
>   
> +static int check_gsc_manifest(struct intel_gt *gt,
> +			      const struct firmware *fw,
> +			      struct intel_uc_fw *uc_fw)
> +{
> +	if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
> +		gt_err(gt, "trying to GSC-parse a non-HuC binary");
> +		return -EINVAL;
> +	}
> +
> +	intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +
> +	if (uc_fw->dma_start_offset) {
> +		u32 delta = uc_fw->dma_start_offset;
> +		__check_ccs_header(gt, fw->data + delta, fw->size - delta, uc_fw);
> +	}
> +
> +	return 0;
> +}
> +
> +static int check_ccs_header(struct intel_gt *gt,
> +			    const struct firmware *fw,
> +			    struct intel_uc_fw *uc_fw)
> +{
> +	return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
> +}
> +
>   static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
>   {
>   	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 2be9470eb712..b3daba9526eb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -118,6 +118,8 @@ struct intel_uc_fw {
>   	u32 ucode_size;
>   	u32 private_data_size;
>   
> +	u32 dma_start_offset;
> +
>   	bool loaded_via_gsc;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index 646fa8aa6cf1..7fe405126249 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -84,10 +84,4 @@ struct uc_css_header {
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   
> -#define HUC_GSC_VERSION_HI_DW		44
> -#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
> -#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
> -#define HUC_GSC_VERSION_LO_DW		45
> -#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
> -
>   #endif /* _INTEL_UC_FW_ABI_H */

