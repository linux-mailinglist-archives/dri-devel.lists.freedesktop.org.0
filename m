Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA97678C04
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C4010E5D6;
	Mon, 23 Jan 2023 23:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1310E03C;
 Mon, 23 Jan 2023 23:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674516485; x=1706052485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vmdB9xe236zjW7GZE8k9diVRnbglAk9KKhJDGxq4tqA=;
 b=UUXNBtWE8D/gPEfyP3sMIZfcjQN3tEiMPHrrmJPeR/Sag+n2xX9DY61L
 4cQf+J/pNbplgJTNaSc1gE+Ziur00j8rO1ZVA2aFN6EP0n2vScH97fq4y
 wiEEbP15ZucWpFGiTk3juph8y5u+9qby+5IEGe8MpmWETNoJLvksZwNIp
 YphxVdU6X9478QvqEePTWu3E225+G3uu0cD8RTXsyydQWHoXgKv1+GefB
 8UZOczeqyTsT0eIKGl5COsXhYlkL1HtmGqZS2CbZ/W6EwcCXZlKq5XSfj
 Cp+vlG1uysZfFMqUFqkzf7QBKqn7nyDqHgDUuQtZc87PRRQabFejvf2v8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="326220700"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="326220700"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 15:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="661910139"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="661910139"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2023 15:28:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 15:28:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 15:28:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 15:28:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 15:27:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjzo82EPKHpSzpaakNXIS20VJuiwuHzSvHzbOaMPpi8G7sT9/mlha1EMVJ4vIY5inIh1PgC2SoqqcoQbUe0s//YIKl244i8EZTwyrtTa51JsxHl3E904cOoCzgwO8sRMSGzVuq66YoDhScT/ZsSQLX7iGCyBlJY2MzVQemTAAjTdveqXFkCyprP9Ct8wl4eK7uzh6kRQy3sL/DXFgSk7EYaDt5QeVnWzVHT8sMh/BkFviVvoR6hHRsm19+ydZgjM97Aih/rOSIy7hxk3uTY1o5K48ky6qmoonLGmdg0xAMC3HziZUNMHttdhfzh0TdGPfzZrtS6MdkH80SF0IDBuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlRMfdpCc7ratKoNnpimRQXYWYGiFT2ZrRfBAPmA0/8=;
 b=IDJmde2PnlklXyXCRa6g0RIq4ZfejHZki2OunfBw5r+3CiHsYHcPKmDcBjGI/dHS69sZZdiU5QhUjBJZ48Cfw7JZ4wx77hiritXZ/Ab8bf+HDtIyRSN4RLDfMJi2NXHU5V9LUrTdqXykYf8fu+q63FPQbfW8Nag/aJ/C/cDvZEvOCbPhL7douKPV1FlO+Tnahm4jyOUVPHulEBN/vwWl2jLPI4Kte4fX9udqpfemc7icRe9vuLg1To7vYXz0PlPmPmFJVU60iCBqLChyf8Nq+xmXbIOzB3KghbXXW5uWoe4Rc28JeqdYpYbjNYMBbFxWx/mpvkU4F2gKBQ8/zKboJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:27:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:27:56 +0000
Message-ID: <a2530bef-9c49-45cd-8849-50ea9f97b0f7@intel.com>
Date: Mon, 23 Jan 2023 15:27:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 1/8] drm/i915/guc: Add GuC oriented print macros
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-2-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ead15c6-7b3b-4058-cc98-08dafd997550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: woFRY74f726di0wGVl5X2DgvRGHkxGh9BcTpT76JL8utW996xlPpz1A4KznEnKHF1M4j/CIjV8F1xT+guxvN9JPIDeqQvIONOg05lGdl4v4KM7xYBhLRjqnCB4RcWmUiDv3kC7J4pqn7m2FzYRouPB96JUsqtIyZGCVnb53vxESJwPLuIULelvHc/7w/L19NSZTAzRYAnq2vhSGfqKX7fH7zUSp0QieNkzkmkbHn2f6w/lUdKajcEXAwXR0BITm41QKpvU0LcR/F14CZOhaR+CHCUaKviio3k8IWNyklx0Ylu2fFchRAXB+yxALXplK9uTa04Xq7+9Tb/QYnqMLqjb0WdATeEhBJON5yzHEvLxYtf2jsU4CbLojH23RebPEGdJJdMhggMMFEfkLxYdMnwcjNT/2HrLJnmSikuRHmeVcCdupfR21Rrr/YLjR76k8XcXtilUjCLU4Lsk11un69ZQHq4+IONgx+pk6msTYHBz6LPjeEd91jr2H8rMXmTpiFOiXLgFADvTz4EVdOxQwcuTFdIosiwOn+8UOb4mEuxIn+aQqfqh+/ewRBQvrDila5L7VXMzORhbs9o4jT5xkwrv4GAe/xRSp9f7vTmxVv0AE5UPj9/hGg1sFWQWRWN1atBOG4eSWkDYHq74S8Y7bwTT4+y6txfj0xgmxlkZWEabhh7of6Ep57/KkuYFc1qZ4iRQ9H1BnJEQZLGpPT7hw+wbJhJTv15LquJiPEouHs4fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36756003)(86362001)(38100700002)(2906002)(82960400001)(4326008)(5660300002)(8936002)(41300700001)(83380400001)(31696002)(478600001)(6486002)(31686004)(450100002)(53546011)(8676002)(26005)(6506007)(6512007)(186003)(66946007)(66556008)(66476007)(2616005)(316002)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVJMkV3MU84aHFXdHZSRitrYkUyT0VPbnk0aEcxdzJlL0NhNmVzQkpwUTla?=
 =?utf-8?B?MmllQ1JzY1FyZEhGVURlRGZLS1ZXakFENy9LelIzcnFIckNCS1ZYTjVTK21l?=
 =?utf-8?B?M29sTCt6UVpIY1JOazVFay9jcURwZHZpRUFuMXFDMUUxUmpSNVA1U2tPL3A3?=
 =?utf-8?B?bHJOdndCdkIvY0JDTDVzK1M2OTRES3hVZ0ZFd3g3S203NVFmenA3cHZSUTFW?=
 =?utf-8?B?ajNSeER0NDltYjVJcTgyN3NnOGZETnlJdGRMOERBVzRvQVJNWkhrOHhkaGlZ?=
 =?utf-8?B?Kzk1Z0dXaXo3ckMrM09uL1EvVy90Q3ZnSjVOT0cxN3hOZ1dqK2VicXlYa2dL?=
 =?utf-8?B?T0dmRnZrem1sOTNxNHBiNVo0YU9kRG14SFI3YklHNXcweGJCQkNGTXd1dGVj?=
 =?utf-8?B?d1JZOXdyL1pMUlVtS0JhbE81YTJFL0FGdklPd2g0QmdnWGFaK3dlZ3A3WVc2?=
 =?utf-8?B?akJiVVBQYWsrOXl0UlNIM1FUWm9HV3RkNElTcHhZeFQyNFg3K3RST2JrS0dD?=
 =?utf-8?B?L1IvV2IyUW0reENycU81U3hieUQ0dXM0YldxMDkrVGdmU2twMXd5aE9vU3A0?=
 =?utf-8?B?ZUtwcWNwU2t5Q0xLVjFLTDRYNWswS0tyM0E3SW8yZWRwM1VTZldJK1FpZ2Yz?=
 =?utf-8?B?K21BRmdyN0hhRDFwa1AzTjRIUkY5ZDlvcVl2d1hRRlBxa1VDWHhiZS9RMTNk?=
 =?utf-8?B?MUtHWjRvdkwrZXhjbmtUNHZTbEJnSXEzeThPSkd0ektTTTM2Wkg5c3dRQTUy?=
 =?utf-8?B?ekdBdVRoci9sdWxwS09SV092VzhWVVlHQVdUa29razQzVVN4N1lWTitJaHVn?=
 =?utf-8?B?K2QvRVJwZXZhSTlwTktlaldFdU45dHN4TXJkTC83RTdFdXhLTWJUNVh3WWhX?=
 =?utf-8?B?Sm00REduTi9EcDgvRnkyTVl5a3ZUeit6MCsyV0hSSTJmOXlNMmdxS2RIOTJh?=
 =?utf-8?B?WjJETzlpbUc2YlJTajM0VWluVExaaGFRVUQrLzBJbExOaG5tb3FYdVd3bmtR?=
 =?utf-8?B?U3phV1ZyT09NaXFxRnZFUjAyMFBSRVowYlZtZTMwaUROV01PMHdLVDViQVpQ?=
 =?utf-8?B?VDNJZVR0WmNlNE4reExBZ29vNGltOUtrMVlzMDV4Nm9mUnFEQTFmejY4N1JQ?=
 =?utf-8?B?c3Q5ZUIzRFBCTzd3MlkzMWhuTlJtL2ppV1FFU0wwUUNSWnBnVjhKOWt5cFcz?=
 =?utf-8?B?RzBwZXpacEdaek9kL3FYNFNTTFhFVmY5WUNhR0FZbldtMStxb3BYZHMrSk9m?=
 =?utf-8?B?L2QrWmlYRDFSSUsyWUJ6NDVteXJ0Y3U3M0RBMm9yOXhydlp4djdMVVRKU0NT?=
 =?utf-8?B?cURuWmlzdHprWkJOaG5zOTdXYVlGcGNKSldTMks0T3ZCcTZ5RlpqMUJZdzdL?=
 =?utf-8?B?dDEwbGV3WlpmVk9tMHg3QmFJejVMTTNRNVlkdE0yWkhNTmtKL0p0MGhlcjhX?=
 =?utf-8?B?MHBLajE5Ly9uVzIxcFBCbm53eXpmS1NNMko3aTlTekV3MllKOUxLSjZET1px?=
 =?utf-8?B?R3JPQzBLZHFKTmp2SG1aRS9IclQwV1NsaXFXYlVJSDdvbE5GUFQwK3Y0TG5P?=
 =?utf-8?B?MnFMS1hPMVpSV2t1eno4QVdhMHNqV3MwTnRWZ1lzbXkyT3ZSZUVvbTE2enZI?=
 =?utf-8?B?K1ZnbUVHc3NSVGRCdCtjeVZkWlJjbVYzckhLVytxQjVxT0FvTjNNTVpNNlVt?=
 =?utf-8?B?cEhlVUJqUnc3bzNselFITWxkekJDUGtjUWgvdzJ6YTcwQTlHTjFndnlKVmFJ?=
 =?utf-8?B?aFoxdTV0dkF0Q001RHBxcVlLczFQTHpIWlZoMFphcENTek1HMW1DSUFTMTBz?=
 =?utf-8?B?RmVwSzJJb2FKVDE4enFDN1Fqc21WQVBya1NwRWpqRlVYMTcralI0Vk9tVGh4?=
 =?utf-8?B?aE5LVVFNSjhHcVl4bzBHelRCb1lHWW5FSnB2NTNyYlo2R2p4c0tEd0FtZVpK?=
 =?utf-8?B?QndGZG4xSlJhWDMrQ0tkb2ROT1NTWjdwMy9vRlQxaGVMYzI2aFpmQ3NaeTJR?=
 =?utf-8?B?UVc5UDk1K0k5RTRPNTM0QlkyeFNVaVVTdEx5R2dVWElxVHVmZ2F4cTFNWVkz?=
 =?utf-8?B?SmxwV0RGM2IwSU5iRzgzNFFyZG1mZTFxdEc5ZEZqM0wrN3N1SFk4azhDWHVa?=
 =?utf-8?B?TWpPWWh0UVkwNk1LajdyZzloUXFmRDZtaEpwSktFL3RpZTJsUC9SL3JDb2ps?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ead15c6-7b3b-4058-cc98-08dafd997550
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 23:27:56.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Rr5LE4eeDAgsoNZpoYcfCEp6m/W8kCgpuc+PkK+k3biu339qoYH4vecro3vuoir4YjSBDXcM0Mcp9RouXf4+5Djr1kSkpwitNGg/Kf5EAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> While we do have GT oriented print macros, add few more GuC
> specific to have common look and feel across all messages
> related to the GuC and to avoid chasing the gt pointer.
>
> We will use these macros shortly in upcoming patches.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
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
This necessary only for the guc_to_gt() accessor? Hmm. Maybe it is worth 
moving that to intel_guc.h? I know Jani for one would like to see all of 
that cleaned up. But maybe that's a follow up patch.

John.

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

