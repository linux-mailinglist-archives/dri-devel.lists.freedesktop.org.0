Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2067F3B5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A464010E2E9;
	Sat, 28 Jan 2023 01:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FE510E2E9;
 Sat, 28 Jan 2023 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674869235; x=1706405235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3WlmgZW1cxxeZs9IOHdX39h2GuH/CYnqSxSrE13/cCM=;
 b=iWKoeghDb9HU+VDtwqSpXwzxnN4vEm0WxUMv441RRxO4dh2ffNdVJSNz
 G8L5xYo3leFtnC/T/gb04DH1Tz+1+YwnAPloIrfpuAOpJfoOwuV8hDRVq
 gyboj89kQzG8HB9SvBwthc8UQNxMPk7yjoOw1Tnl+oUe2/aBMoCDwk6D0
 hTUb5cLo9bEEq5rSO+zX+Xf3LIavM/m8GIQIbZtzgea+Ga4lLq1WAL1df
 GCrC3UX5MOkSa/5PwxdRZ+i87t9luz6QtIA4EdNqd/C314ZdkAT5+yHrN
 Qk3OyJBspGOt2UIi9xA61bXl2lOxwoPDO4H57R4ZG9cZL53We/ZZJHOie A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324938552"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="324938552"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 17:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="752181405"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="752181405"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2023 17:27:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:27:14 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:27:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 17:27:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 17:27:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRac0D5SVpHlkqN88MgRdJSNeawaQLn6nzkuW/NBJ2it7jGPsIAnezFws7sk6r9PuXNTtEkYeBQu6Rj9KZq0/iIa8dPXru8hdbbzZ7NoY9RReP4djTTWIIilxEmIsYmSKbi39Ezgs+Eb9KvzhtrWjhWje8jpAtA2IXi1EFXOvzmeTSFh1V6Hk/rjMIqOyuf0DZCS1TL35o4eawUyOoctgUpxhHB2XeGi5H2gwWyQ+Q9WS58DDEReH/ASK3j3nJGf721eGWnoHPoX9y37ONtH+AdR3ZQfFx31HF+j0eAowDhh47M6zB5Z4W1Bkw/NIbkfhxQyw1qYNdgbAO9ySG+S4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg4zXga5fJKPgCKJNZOQHDw3m0KdYaoDJue+Pzr2YSY=;
 b=M1PvNFBponSR58TBzIV6LJkRUxBkY78pmoRyikUTw6pBaxQiIZ3w0t8jQIoubtRu3H140+UZXC/9+1XDlCzOeWfddMH4cPOeSSubVv9Wkvhwn97OXbwERk27w6xYkBuMEzAUvGPS8wc+gVXaCIFYxn9/9y6Gcfu+t/IBgW6PHkC1LL4hT9YJLwLPr9+yznHVdN5TuD2EmudA3xHSDWwOinJjsMRLaIA1ygGv2MkBOk/T0O7eBC3H8OIsHrFJ0ROMvAcxvh8lK15/4YWk5gPtWhY5JvI8qviODFlGyaFNoIDMWZBbTEeHssfBygPU2/kt6QVt3EgcC1Pm9XOexZn17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Sat, 28 Jan
 2023 01:27:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 01:27:12 +0000
Message-ID: <b88a5858-83b9-48be-6701-28f024ea395a@intel.com>
Date: Fri, 27 Jan 2023 17:27:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915/guc: Add GuC oriented print
 macros
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
 <20230124170522.1808-2-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124170522.1808-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DS0PR11MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 82136044-475b-4c81-fb9d-08db00cec831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+djew4FOXQC+jsPuKlDYj5nUEp4xMFr58jxnzPnbtij6vT7e5hksjhjgA4ZWSvAxBkvwaR3h9K+lylR2vzHecyh0OuJQXJbxkndyz0BHfNmT+C5ztL7VNtbUTNGSt8Oe3mQPsYb/J/OJfp8mRxd8urBmQBF3kmEdRNMV94AvGiT5wn5XHIGh8CPeu3BfZsVThtrtO68G26DUMPRQSPWzKcisORF/jx0qzhRLvOIEhB+/oz1vxkeopv+YfM77HMXUeKKHx5wNfVmjJ9IPp42FZmUq9a1PLKJXlVFs5tarqL9XVzkra99GEeYnCk5oqRnXayMYMyhVrrYI4UGlPI7FBjQVPFFcFCFLoOSND49J3Yz4RJ31aTon5f+y6tQe88QMMcDX2qv7FUbiq7RNVs05dlHowRZHheIwNgkRGKTNyOGCU+ZjFifPIiEFaCTCjVa5JGqHEWSIAgob54MsHYIfF54r4v8a20ICBtBnBMBIA/z8LVRewnT9pwofM/Xm5K3PZrEI0MBNetZHEptnRrEWpJC7gADTTMxyhfWIa5PrvXx7P3JVKg0tF2NtYO6nKHSFC+WvjSkO126KoeijbhYoXW7QOnDAwJ/NHIagzKu70yL64hYlDVPJNSzptbaYx51C7Zzy1utfm3n1b2xQPnxsJN4xejV7E5kCR3tpEIGltu42mGaLfY6DAhH4zOIbKKXT1EIeVGFKiGRd4Vy5fvkCKaX6/MvEr3DySTfo/B0Ljo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199018)(5660300002)(6512007)(66476007)(2906002)(186003)(66556008)(66946007)(4326008)(8936002)(41300700001)(31686004)(450100002)(8676002)(83380400001)(478600001)(53546011)(6506007)(2616005)(26005)(6486002)(316002)(38100700002)(31696002)(82960400001)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmFIb1g1T0ZjeHgvcHUyRWJxUTVXNWFGY0dzeEJST0loTUVmM1Y4MDhtc3Qw?=
 =?utf-8?B?eE1JbGpFMFdGdktYdnBtOWFxenZ6ZHJRT0FOU1lsOXowRy9rdmZIOVZBbjA3?=
 =?utf-8?B?MGdwQUZYcGd4N2NlQlBGY3Z4Zm80TmFyMERVYmppRWxvSis1cmNDamxMTzk5?=
 =?utf-8?B?Q00rTzRyaXZZaWx1OXRHb0xFWSt3SEI3TVM5SDlZd0t0Wmd3RFNZVHFkcEJx?=
 =?utf-8?B?VGI4YjFyV05HWlhPTFNva1BaRlVpT0NiOUtrWTNQLzhGQ2hlQjc0TkdGdzZO?=
 =?utf-8?B?VmdHZTFUVUpkTzFRM1I5M3hlNFFFNGxTcUdSQy9Fdld1QWRaYlBtZW9RUVlH?=
 =?utf-8?B?cUU1MXBsWi9rRms5NVhVSVllSTF0clNCQW9mR3k2YTdrNGhua2VFMldVbjBs?=
 =?utf-8?B?TDkxU0N4K04zTDVxdnF2MnYzRmhkemJoRTdGMW1LS3A1aUdzUlZFMEtEekh5?=
 =?utf-8?B?eTFTQmdNd0xlMzJHYmVtS1IzRzJlZWpHS003bk8zcC81YnFIcnpvOTRXeVFO?=
 =?utf-8?B?VHIyVkdud3BEaWF0TmF5QUhyU05WeGFONmZGVWVaSmZBQ1JKeisrbHlFUHlE?=
 =?utf-8?B?a3F4ckJRR2V5TVBxL3lWSUcyMWlaSVJFZlNyYmxaVXczK3dXRkZTeDFTK1RW?=
 =?utf-8?B?RG1NRFFub3kzMDJWYmpZOEd5KzMwTXRiWEVaamxGRFdiN3BiSnJIYnlUQlRt?=
 =?utf-8?B?N01LVjk4QUEyUGJqWjVqVlNiVjZkMThFZDc1Vy9wVFA4QkQ2b21hZ0VaWjV4?=
 =?utf-8?B?dXdKQmdDSzV2WEtmTDBBYmJmNzh1aHFrR245VTZIb3IvY05LUWhYYmx3QlN5?=
 =?utf-8?B?VS9HWVJHRTZJYjltQkxOU0hjM2NVd0pCMWMzS1BENmEzWnNMZUFlbmxCbExU?=
 =?utf-8?B?NzMyb3BqeUFlcEdRS3c1c0NleklhZHJVK0dEZTBxazJqNWRuUTlrd0lqTENy?=
 =?utf-8?B?TTducWk2NENCYW5ER0RIZ0haTDBjOFdMdUZnbzhzM2VxSldTOEp6SEtiQUZm?=
 =?utf-8?B?UzVrY1U0a1E1aEVoSHkrbnFlZUdML090Rk92TWRFWmpmNGJvUkdXaW10M1Av?=
 =?utf-8?B?VzBreGUrdTFUV1VEMC9oZzd2MmxxWld4U2JCMFRha3R6RGZ3b1RpcnVUM0I0?=
 =?utf-8?B?VE8wbTROUDhrbXlJVXM3UmFmSFNFVnhGT0hJVkZMR3orTWJ5bWtqNCt3blda?=
 =?utf-8?B?SjdqMG90UkJGczNlQVFVRk95QXB4NGRHRUpqb1NzSDNxai9QekVOZjNoelNN?=
 =?utf-8?B?L3Buelg4dDY0dFZSNE5iN3MrVWRvb1hlUFdJSTI1ejlTem1BNW9RKzdCNUFq?=
 =?utf-8?B?SjZCZFJ6cjdLUU1UbkVtU1UzNmhhVlMrY3hlZGJYZlg5d29WNDFFUlJYWDNF?=
 =?utf-8?B?SFFEQU1nNGkwYWtReDc0MVhIR3V3UzRjai9sRW11dXlIVTEwSFE0Y25mVzNv?=
 =?utf-8?B?cDZobzdNdmVsM1JOTTB5aitPTHJqaFpYZU9FTEdSWlM2L0xVc0RpMzJxTGpL?=
 =?utf-8?B?cVYyU2Q5dk9qZTBwNWlSMEx0STZGTTRTRUtrYlJqSjROQlUzTnBEODRMbXky?=
 =?utf-8?B?YU9URFJCY0ZTaXdUcmVLY1JOaFBPQ3dqczdseVNFMUYra1puelRiOC9rVHVX?=
 =?utf-8?B?bHJmWTdTUjlud0FycHM5dUN4LzRsSU96SDVPNDZNdXNtK1hvZ0FydHU2ZGxa?=
 =?utf-8?B?SWFUb1FkNlBWb2wwRHhSTDZSdU56Tlh5bDVDdWRueU1pQjFpY0JtQitOWVVS?=
 =?utf-8?B?QWU2N2NvV2wrMGluRlMzVkQ2SXo5cE1SRFhIclFLNHVPTC9UYjBoT3Q0cVpU?=
 =?utf-8?B?OVBRYmtkYnVYMTZFZE9UMUNjODQ3NEJSdXl2S093dDhEcml3Tmx4V0Y5cVJB?=
 =?utf-8?B?b2NqRFptSnJsM1JjWVhwRlFnMXAwMFFBaStWZkRoempPVTBOK2Z2eFkxazBN?=
 =?utf-8?B?YmJZT0Z2VVg3ME1WSHdmTUFxYU9QS1JHb2x3b1gwT3FVNWhZN0c1L3E5K0R6?=
 =?utf-8?B?ZDlDQ0hQb2dlSnFtVWVKMXJpeGs1TllQM25NNVdLVGFCQ1Q4SHd0MWVMQkMx?=
 =?utf-8?B?eEFQYnJHYjVJMW9lVkxuZmhCelgwQURtLzF0T2kyOXlhTTk4T05iOURWRFRB?=
 =?utf-8?B?SzFwRmJ5cmhEUDA2YStmYXFpWVB1bjcrR0ZobDlQSEFUZFdkeXlxUjdjQm0w?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82136044-475b-4c81-fb9d-08db00cec831
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:27:12.6445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cdg6daLFaWINIdmAB+4Pb44pQIcJw3OVDpq1lzt0SPHJOF+HZXDevsfLGe/egejzqyZV0KLxnzCBDoRBXET6SEdnqRGp0/N29PP0YrkxnUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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

On 1/24/2023 09:05, Michal Wajdeczko wrote:
> While we do have GT oriented print macros, add few more GuC
> specific to have common look and feel across all messages
> related to the GuC and to avoid chasing the gt pointer.
>
> We will use these macros shortly in upcoming patches.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_print.h | 48 ++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
> new file mode 100644
> index 000000000000..e75989d4ba06
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_GUC_PRINT__
> +#define __INTEL_GUC_PRINT__
> +
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
> +
> +#define guc_printk(_guc, _level, _fmt, ...) \
> +	gt_##_level(guc_to_gt(_guc), "GUC: " _fmt, ##__VA_ARGS__)
> +
> +#define guc_err(_guc, _fmt, ...) \
> +	guc_printk((_guc), err, _fmt, ##__VA_ARGS__)
> +
> +#define guc_warn(_guc, _fmt, ...) \
> +	guc_printk((_guc), warn, _fmt, ##__VA_ARGS__)
> +
> +#define guc_notice(_guc, _fmt, ...) \
> +	guc_printk((_guc), notice, _fmt, ##__VA_ARGS__)
> +
> +#define guc_info(_guc, _fmt, ...) \
> +	guc_printk((_guc), info, _fmt, ##__VA_ARGS__)
> +
> +#define guc_dbg(_guc, _fmt, ...) \
> +	guc_printk((_guc), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define guc_err_ratelimited(_guc, _fmt, ...) \
> +	guc_printk((_guc), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define guc_probe_error(_guc, _fmt, ...) \
> +	guc_printk((_guc), probe_error, _fmt, ##__VA_ARGS__)
> +
> +#define guc_WARN(_guc, _cond, _fmt, ...) \
> +	gt_WARN(guc_to_gt(_guc), _cond, "GUC: " _fmt, ##__VA_ARGS__)
> +
> +#define guc_WARN_ONCE(_guc, _cond, _fmt, ...) \
> +	gt_WARN_ONCE(guc_to_gt(_guc), _cond, "GUC: " _fmt, ##__VA_ARGS__)
> +
> +#define guc_WARN_ON(_guc, _cond) \
> +	gt_WARN(guc_to_gt(_guc), _cond, "%s(%s)", "guc_WARN_ON", __stringify(_cond))
> +
> +#define guc_WARN_ON_ONCE(_guc, _cond) \
> +	gt_WARN_ONCE(guc_to_gt(_guc), _cond, "%s(%s)", "guc_WARN_ON_ONCE", __stringify(_cond))
> +
> +#endif /* __INTEL_GUC_PRINT__ */

