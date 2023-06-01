Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90764718F7E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 02:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF50E10E1EB;
	Thu,  1 Jun 2023 00:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FB410E1EB;
 Thu,  1 Jun 2023 00:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685579171; x=1717115171;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EYErvgSZHmnfMvHsMrUUEHOwN+L7v94y+d366nWnJ+0=;
 b=GD4d+TDBUhjf12NDKifC9NZfwN5NOOW/YA4wY0+3rZWQGit2rW5Rga4/
 CCuqEVfZyOwmvdZn2vllu9bX8MhZ5n3yCoq7B6P7Q2s013mrkuYnNXL8E
 rF1gro5pcxeal0C0fYuzU8ijRwxZIK7+ZFjZDzlx5k8VjaRGnR7vUufrP
 y6yRuH5q1U4MLXQbeSYVvsV13KhhxxfRItIdZ/87rvNUFGKsZCN7tKBKt
 IXRQIYSa1oEITk3m7dmPFW17+vZvUDBnOBnIErsCqm29khBD7PTijnvbI
 QFHCKglAl/2ALlSdP8YT0JqxQ8+Aeron3JvF+ougA8oUmsI++8R23aKSn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344929099"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="344929099"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657559335"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657559335"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 31 May 2023 17:26:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 17:26:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 17:26:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 17:26:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 17:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5wAoS7EhIpKl41MLrSLr8J7zdKql4qNWf7HHnowXg7OrvCDvfvcOGwOsipZf9kSWbF9J6h9VRdl4At2qe4A9gQs15S7Hxg/zMzTYub/IoXMLfrjpd9XeYFqYcwqxz9OAnCkovP1T458ZxDNhNsHWVVc08+geHtaeCJlODZQ2n9plyDp7xNCjxmgv7plh5LowDDs6MQ7IWM43+sKqy55k6zIrcLjCcJN4U2AptY02qOo6nKgi30C81qE2VTE2FrxYEzstf/FmhDT3Kf3AZwglsIqGCNKGEb8sBj4YFnLhEHocmjFf3kVgnvMtmGiHM4YJN81zwsSwXexECqZgZCnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TiBQ+k0Nb8gNsEbh87/scThL5SapWoeGWpIiXHhJGA=;
 b=W16H26hJtJthJmenGCM9uZ7/5bmGAzZqzHHdDABPqwnshNnWVKzhvQiCvPM8Je1X917COs2wCWzODK9+EVtQ/r2j0JuZmkTq49Fp78kJ+EaUL0WYcrbVrev3E/Yb5M/msuiydnxegi38gRnMoLuWiPqpTbigC0147xduRNlQyBEljgUyvkF9qsXOXiO2PTU9qRu2hh29rEbRlEXX4yyJmbgjlrgQz0vV1R0Qp4RbufwbGrkJ262Nylt1LxF9Cy234SBG7G8CSglOdWwvFLpQrfuIasaiWokgpFgyBfU2p2zCo65VXG18n8GYVX77mQvSzhezI/AGvN3bfvNFJzUYuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 00:26:00 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 00:26:00 +0000
Message-ID: <f370372e-42b9-17af-c553-475814c25807@intel.com>
Date: Wed, 31 May 2023 17:25:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-7-daniele.ceraolospurio@intel.com>
 <63637814b7d02639de39287ec92eace9f3aff46a.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <63637814b7d02639de39287ec92eace9f3aff46a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|PH0PR11MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: e267fb71-8944-4df4-615a-08db6236c5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqLhxuzxm2bUqgjI3TkUhlZeVfDbu8bUdeWoXwjjqbDVtcBXGKS/+gdHfHbwXj0NvInj0mpny1gO/EB772lu7Fjfx50E6/phqZZG5+f1faaNWvvK+Elw6BXfH0MJ8wZpCZfZATXbfM/u4o0T+VqsAuWJsWWjERNNSukgsdTDu9qy6EIov2tYL0OWsZQ7mZgu9Ie6+Zuu/UfPTJOecZkUnIxArh7TQ/zVBWuIMtUyIpuwchxaoU/4GS1U9BoudJGbRBq04X/f6B8uU68kjnKGTS6KGLD3urkE0ZgyaYSWnchvcUDCzfEp+IN7EsqKFVImCn+TU436bVsCpG3nJJxGpxz05v/XTQ93Kz2zSaSf89hEwRU2a9hujBumhnJT+s/TUPJvEuPWczkl4dqWltiWXv2YNZna9Lbwut2bbY68fc2wcmfo5i4vrZqejb88tiSlEt+TkjPFjp2GhxiZ43RDDsqSlvsr0wi5bfy/g55458PctnruIWiliPu7agbEhE/gUQyTlXI4f+m1nI0PYWU+xKfmYxsHqOoVQNUAQnUYP0/sA6Imu1EYbrP9huKCyDKy4PAci2hXyibTLiB7W0dO4fa+mgmP68pvuBJJOgo9sJTOo1tbGLU1JhmAN908oG/bfhZ0kbe0L8BOHtJpJ17wnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(38100700002)(31686004)(54906003)(110136005)(82960400001)(36756003)(2906002)(450100002)(66476007)(66556008)(66946007)(478600001)(4326008)(6512007)(6506007)(316002)(26005)(6666004)(186003)(107886003)(6486002)(41300700001)(83380400001)(5660300002)(8936002)(8676002)(31696002)(53546011)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGxGUEJPSW9QMW0zcEJRQ2FKMlBVY0ExV1ZPNkptVjhZVmJZMW4vWGJGT3M5?=
 =?utf-8?B?NitpcEZnc3U1eG5TRnorVlJtczNrNEFlRXhaOG53ZDhvQ3JJTzIvMkVmOEI5?=
 =?utf-8?B?dm1VUWxTbFlSNW4yREdLYmxBZVZhcGtESTUvRys2RmM2aXJoSlNLWDg5aldk?=
 =?utf-8?B?UjJpMVZYS0gxanlrY20zOTBZZ2N1Qy80NkV0aDlkU1V1S0Ryd1ROYkkzbCsz?=
 =?utf-8?B?RklXMGtyMCthcEw5YVdoWWJEK293bGxuQnB4Z2VJY0FQWUVSakt6Nlk2TUZr?=
 =?utf-8?B?V0F0bmxFRFNHNHlCTVU1Tkt5UjRPYU96TDJVdXRrT0t3ZGllcUVHRVR6OGE3?=
 =?utf-8?B?K3VFTkxLSFRyZHB4TDFCQWpNVTdETTM0SlZzSGxlR1dWaldYZ2psc3ZyWFIx?=
 =?utf-8?B?c0c2UVdDZEFjZGtHbXVSZVdVOVZjMDNEMUVsV25nRU94K2ZFVHoyQmFHM3lh?=
 =?utf-8?B?dDNzdFNDVW81RVR3ZGNyT0NwNlhFbHJPR2s5MjF6bWJkc1NTVmx0cFFUeU9M?=
 =?utf-8?B?ODhORUhjWVovZFRVTmpWV2UxUEE3bjR4WW1TK2EzbW9UOTRkQmRXWDdjZEZu?=
 =?utf-8?B?MmRmUzA3bW5OYnYrTmozbVVZQTlKNmtkYWk4R2l3UnZUek5zL0JMWmtNWDlG?=
 =?utf-8?B?RnhGT1lSd2hZWTl4WmxVM0xPU25ocmhIL1pqZnVjdDNWc05oaXVGR1FmaitJ?=
 =?utf-8?B?cW8rdTdWVTdOZlB5TTJqVmxOSC96djFjSmIxQkg5bWdSaG16UGw1YkJ6TnV4?=
 =?utf-8?B?cHgwUHdvMVZralZsaTF3U1Y1c2RTdDhNbTVUMm11RUQzTGZFdmQrc1NVQlpB?=
 =?utf-8?B?a3ZuZ2d2d3VvV2I2M2hCaTJpRzcvT2drZ0FEdGxGRDYxd3FoNjFzbWJHek92?=
 =?utf-8?B?ZGduZ3J5SWdjd0hobnp5YUpiNWNqUU9xa2hjYTI1Y2pZSTJOY3p3MWNRYjdo?=
 =?utf-8?B?WWdwRzVQOVBGZW53VnJTeG5pOXRRY3FUaktYYWh3Wmtkb1VXaGdwWElob3Zi?=
 =?utf-8?B?SllTZW5jdFBWRnppTU5xQkF1aytEZUxrSmZnbzlkSzBxU2puSTV4NCtPQkZU?=
 =?utf-8?B?b255Niszb0JZcGJmUTZRZ0xzS3VUVE9MTFhGQ0YwaG5KRENVQnpORWNZMHlN?=
 =?utf-8?B?Mm1xcDNCUWo5aGpiTWg0bW9PQXhYSGs0TDBvamo5eFFoU1FLK2tzNkQ5SjEw?=
 =?utf-8?B?K0VJbFAwNUdyOXBPZTV2TDgzYmxGa1JIVmVJMlZFYVk2WVA1djMrN3JBbEVV?=
 =?utf-8?B?TDFrRDgvV2VNZUovNzQ0dGhkM0FZQlRuWmhCMkJCN29vakU0dHNwMUcrMVJs?=
 =?utf-8?B?UGxJTSt1VEo4Mmh3cWlkMXVzOUtWckRRSnV3eWV6eEhDMTVQSE9mOUNvdklo?=
 =?utf-8?B?d0d2TGdybXl2Q0h1eVc5NzE3dEZTV2ExZ1dwejJwSE1MenBMYUxyT3lWcHFr?=
 =?utf-8?B?SitDSWxrRklLMzRtWVNveXk3NUJQNDN6Y2ZHQ2tBNzdzcy9aVk15a1Q2T1Bp?=
 =?utf-8?B?YmdHdm9zdnptRm1Mc3EydlBmYVVEY0szMkFaZ0RpVDV0WncyT1JOc0JvNVV1?=
 =?utf-8?B?RHE0MERzbkYxZm1Za1pkU0lVeXNNeTVYdjRLczQzUzB0T3pVT3VuaE1mOUxy?=
 =?utf-8?B?U2VMWUpqdTNCZmQrczFuWFRnOE1MSUk0MHFHd2VzN2V5aE4rUWJ1T0dKL1FI?=
 =?utf-8?B?YUgyS2VtcG9WK09vYncxZ1FQUnZPdVFWdGtDT3l0aElBRzZmQW5nM2cyUFZr?=
 =?utf-8?B?U0htOXFBZ1RhbnVyY1kvdWl0ZUlZZDgxb215V3VDMWNwR28raFRKTUNuQStL?=
 =?utf-8?B?UEQvMkhNYzZpQzJhUWpGcDNTaE9UUVFxa0dsRHJocy9SSERnbFhiK2hkRnp4?=
 =?utf-8?B?Q0ZtVGZQa0MrQlkvZkdSV2wwbncyTUJYTlAyWTJ4ell1VEptM2lVWklNLzRP?=
 =?utf-8?B?THAzcUxLWmlYMmU1ejdsZUtaazNqTnlUa0VtQlVWbHRaOUNEM3IyOUlackRR?=
 =?utf-8?B?RHFlbDBWSXI0Y09ybGFzemlBUXcvZjEvVFFUaGRrV2ptRVRmY2txcG5WU2My?=
 =?utf-8?B?Tmt2M3dkWm9PaWxXSE1OWHdncnRzaHlwVjM2UXFaOStic2YwT1g5eTVoV0pR?=
 =?utf-8?B?YlIxVGFMcWVwMWhEZ2RONHdacGRVSUFVZ24zZVQ5KzNnQlRkWkpBSjJHL2R3?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e267fb71-8944-4df4-615a-08db6236c5fe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 00:25:59.4541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41Q8jvL1iLNErlJXiivuT0K177eh0XdbtDxZwMUQ9frwB5/XtYprOFSVt2zh42ujqT1TMXlCFlb2e50NfsFo1qZhTu2WfDQXMqD75+b7DaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/26/2023 3:57 PM, Teres Alexis, Alan Previn wrote:
> On Fri, 2023-05-05 at 09:04 -0700, Ceraolo Spurio, Daniele wrote:
>> Add a new debugfs to dump information about the GSC. This includes:
> alan:snip
> Actually everything looks good except for a couple of questions + asks - hope we can close on this patch in next rev.
>
>> - the FW path and SW tracking status;
>> - the release, security and compatibility versions;
>> - the HECI1 status registers.
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> index 0b6dcd982b14..3014e982aab2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> @@ -12,36 +12,31 @@
>>   #include "intel_gsc_fw.h"
>>   #include "intel_gsc_meu_headers.h"
>>   #include "intel_gsc_uc_heci_cmd_submit.h"
>> -
>> -#define GSC_FW_STATUS_REG			_MMIO(0x116C40)
>> -#define GSC_FW_CURRENT_STATE			REG_GENMASK(3, 0)
>> -#define   GSC_FW_CURRENT_STATE_RESET		0
>> -#define   GSC_FW_PROXY_STATE_NORMAL		5
>> -#define GSC_FW_INIT_COMPLETE_BIT		REG_BIT(9)
>> +#include "i915_reg.h"
>>   
> alan:snip
>   
> alan: btw, just to be consistent with other top-level "intel_foo_is..." checking functions,
> why don't we take the runtime wakeref inside the following functions and make it easier for any callers?
> (just like what we do for "intel_huc_is_authenticated"):
>      static bool gsc_is_in_reset(struct intel_uncore *uncore)
>      bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
>      bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)

The idea was that we shouldn't check the FW status if we're not planning 
to do something with it, in which case we should already have a wakeref. 
HuC is a special case because userspace can query that when the HW is 
idle. This said, I have nothing against adding an extra wakeref , but I 
don't think it should be in this patch.

>
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> index 2ae693b01b49..5475e95d61c6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -9,8 +9,9 @@
>>   #include "gt/intel_gt_print.h"
>>   #include "intel_gsc_uc.h"
> alan: nit: not this patch's fault, alphabetically, intel_gsc_uc.h is after intel_gsc_proxy.h

will fix

>>   #include "intel_gsc_fw.h"
>> -#include "i915_drv.h"
>>   #include "intel_gsc_proxy.h"
>> +#include "i915_drv.h"
>> +#include "i915_reg.h"
>>   
>>   static void gsc_work(struct work_struct *work)
>>   {
>> @@ -301,3 +302,46 @@ void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc)
>>    	queue_work(gsc->wq, &gsc->work);
>>   }
>> +
> alan: btw, why are we putting intel_gsc_uc_load_status in intel_gsc_uc.c if the only caller is gsc_uc's debugfs?
> why not just make it a static in there? unless u plan to call it from "err_print_uc" - then can we add that in next rev?

I do indeed plan to follow up and add this to the error state, but I'll 
do that as a separate patch as I also want to add the GSC logs to the 
error state at the same time.

>
>> +void intel_gsc_uc_load_status(struct intel_gsc_uc *gsc, struct drm_printer *p)
>> +{
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +	struct intel_uncore *uncore = gt->uncore;
>> +	intel_wakeref_t wakeref;
>> +
>> +	if (!intel_gsc_uc_is_supported(gsc)) {
> alan: this was already checked in caller so we'll never get here. i think we should remove the check in the caller, let below msg appear.

I did the same as what we do for GuC and HuC. I'd prefer to be 
consistent in behavior with those.

>> +		drm_printf(p, "GSC not supported\n");
>> +		return;
>> +	}
> alan:snip
>
>
>
>> +			drm_printf(p, "HECI1 FWSTST%u = 0x%08x\n", i, status);
> alan:nit: do you we could add those additional shim regs? (seemed useful in recent offline debugs).

Agreed that it would be useful; I'll try to get a complete list from 
arch and/or the GSC FW team. Are you ok if we go ahead with this in the 
meantime?

> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
>> new file mode 100644
>> index 000000000000..da9f96b72291
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
>> @@ -0,0 +1,38 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2020 Intel Corporation
> alan:2023?

D'oh!

Daniele

>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
>> new file mode 100644
>> index 000000000000..c405e5574253
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2020 Intel Corporation
> alan:2023?
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> alan:snip
>
>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
>> index 2f93cc4e408a..6d541c866edb 100644
> alan:snip
>
>
>

