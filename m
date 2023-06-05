Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC187233D1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 01:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E76C10E0D0;
	Mon,  5 Jun 2023 23:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8167210E09A;
 Mon,  5 Jun 2023 23:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686009191; x=1717545191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pkU7/A2kYhCy6ufOHYYBTQXfK6PzInTbJPi0u5+CfjM=;
 b=QwQ97XpZ5D8bI/28cepTEAMEmfql7ZgrWbWp/r8GMHBvI1YLoJFZWrmf
 50xMnK4uepkRT05a4OHZi/zhSiMCp5+jF+OjmJISZIbMo/LLNqFz9qS5i
 Zk4CXFK24gniNDrH/JgGvkpBJuWrPRvqbUUje6N2nUmccX+Og3nwWPG+d
 3fFqxmVPdXsf5GhEhREwM9sV6nUubS6TcXum4KcQ7fD13FN7KHip7fdH+
 ySIZmSUknkauDSZqRJDFc+aMhOIxG/PD3In0utfAeDF7XVfDtlFqEaZhg
 dxSqR6MT8KcwQLiDUIrziigYRIPeUBYvgKAI0IEc9HwSULQiW9FrMd5nF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336136251"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336136251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 16:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798610781"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="798610781"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 16:53:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 16:53:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 16:53:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 16:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7bxBuj+8048yTfK24c15q7xW42pqSUWbKTAZqGQ0ElTqxVMt1I0VXugwg3FsWEfHn5OLEk2hiLqguWvwK0NZrB03UyYgSvIZygnJ4ppqTWAKI2voK7wKIBcJZrz/46ZSCgnlfA0wSdQKdlX0QG1VJHB9DS8IMFWGtBhhh6PcMre+/CZUusNOKL7d2dwfzWW7PHCl7aA1af0/qo+4h7nVT/j6+nsLxYde23bCxgxVhHXjfI79wzNEsZnMPh97svzyz2TOGnnqr/vpklRJJe8dBZNvnU0The3zQ8ELQwXOqbZNnEvPKzF2a01k62q8DcNZ0hqoN7E++3ptmpAq7ADLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmWEkfKSwzBe6m5PNdaAjPc06rk34iHxP02yRvM+dpg=;
 b=KIIA7Wh4V/VT7RiPYtW0HzlwcAPcx9uck2Poa3w7vB0egKs0k7N0qJN4qcG0RpkoGAjmfPckL6hMXxA0C9z74sDBb8bqN77veRaktEBupp1HtAcpDU2mW2LF6pdcJK0MeZkjAhhqsZHfgg7Sr4P12PQOOWvlRJi0iZEOtv3gPIqHV0+EZjDbKFFcaECKQR/A/JzWbecfQ48iWEfyWEkSyTZSQ/scCGtluGZ3PwUjoc8Na+qih6L1zSPuAqKjY/tB/xPCDlo2GhCdMIEqpjvjF6/gxu8XqKFUcTk25yC2jbfTZoX30vgYqJNQqXlATPQXTLRElRvV0aXwGXgHh14/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Mon, 5 Jun 2023 23:53:03 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4097:4a1e:9703:1932]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4097:4a1e:9703:1932%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 23:53:02 +0000
Message-ID: <eb6b5f2c-79f2-aacb-8df0-6fe2abd232bf@intel.com>
Date: Mon, 5 Jun 2023 16:53:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-7-daniele.ceraolospurio@intel.com>
 <63637814b7d02639de39287ec92eace9f3aff46a.camel@intel.com>
 <f370372e-42b9-17af-c553-475814c25807@intel.com>
 <0432681c0495b1616d811a902af7f1e9ff8d6274.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <0432681c0495b1616d811a902af7f1e9ff8d6274.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1885a3-0982-4c01-4731-08db661fffcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5QfLXclXjBMeBOCSZFzYx8bzsK+VpchKlBDgLGTzyuQErK3A0nCv2r0et3acmvlXe4osLCy2jq8Fd+vEbwaaFRTT7VHQuuWMaM99ysrBtid9KNE6bw0AHkDKynztSifnbhJb4WLAFjtz/l/98P9q4JseYfYmbsENawbV5yq3W5+syUoF3YCl7YZls8PDQPtpGKllXH6FIs+4fxeWe7o1Ey/yetPPTJSVtdGWVqFEg8OFK9OCplOAWVtfYPa6/r9XNbRI96Vp16F9+zF69NqnsTMLQFMRRK8ccyiMpN56McnB8fAcLjSm+1tHMKgAOiX8w4i+Hty2Qq4a42ATfbahec8HGYxueOMz9igk22b0INVsvG6qRmPsDk/b6Hd6sjgtFEgvCvPlkiElWHqwar9CSSEkp4axmd9Ib79ExBM3BGu14yDw4SEfEobXOMTJoi9StnFxwIMhwYMP7scuZ6uouWnM+abxe4P8QbtysPkFSPH3SrMrNim8F+ir4CrY3CNktG3xQcGNkJ164gmU+S4v/TavoufgwiCC904q3+N48/XdG1eN7Y5eVuI2q0RjzNBeXZXxutSItisn7aRjs2hfC1sfIhNce/VAJQOXkqWLvgIoVIZDcwvx6TzpYJftlYwj3bm2CLTSLM6leB+b2BdTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(83380400001)(38100700002)(86362001)(31696002)(82960400001)(478600001)(450100002)(41300700001)(110136005)(6486002)(54906003)(8936002)(5660300002)(8676002)(66476007)(66556008)(66946007)(4326008)(2906002)(316002)(2616005)(26005)(6512007)(53546011)(6506007)(107886003)(36756003)(31686004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M09GeW5KV0JJMmt3UXZ2c2kydi9Oazl4dmpteWwxWmErcFZVcC9ya1REQlhL?=
 =?utf-8?B?K09hdm5Qdzd0MGtyU0w4LzdpMDg4d096cHltNzdWdGhNZzJpdXdsblpJd1ZQ?=
 =?utf-8?B?dXdZWG00cm9TMXA3Z0dYbjRhNjdaZ2ZxajFFcXBoNFM5NWx4akVXeEZLWlEw?=
 =?utf-8?B?c2txUDYrY25ZTHdNSVJsYmEzVWsxWlY5bkVmSU90bmtGTmRKTHVzdDJ2aXNR?=
 =?utf-8?B?eGJqeUNNZ2JhbVJyY04rWWRGTmFOZnZpYTdIUVVyYjVlV1NISTc5OGNma2FG?=
 =?utf-8?B?NWV1VW9Tc2pDSVpMa3dxSDkvSXZoMlY4MW0zeE1BcUJsWnBIMmhMY1JKZWNt?=
 =?utf-8?B?aHdCMGlxUE96dnF2c2Q5a09oV2R0QXUybHA0VWs3Z1VsTjB4aWZndERWMEp2?=
 =?utf-8?B?bGlDWlRjOVl3aFRrQ3hIUkxvVXFIUHdnSDB4cVI1RGtmY3RycFdTQVFzQUtu?=
 =?utf-8?B?YzVPTGVYbGdGVXRJVTNKdGxBcjBpY2RlcTdsMmZyM3p1RDM2RzR4SHJxbnpS?=
 =?utf-8?B?RlhlUlRpT0NraFlua3d1Z28yTTlKRi9oTTVoZ2VSTzFJeFM0eHU1QlkvUFV4?=
 =?utf-8?B?MnpVR053MW9JbE1EL0xvZDBZUGVEdnA5OEhUYkVmSzRUMUU3M1pIWXZDMmxj?=
 =?utf-8?B?NFA4cTBoQmtiS2ozK2xDRDFTLzdPcFRmNnQ1dzFnYng1aDNuanZXSFpFbXc1?=
 =?utf-8?B?YmNxZEZTUHBYUHRJRmx0b2N3dnlueTVqeWlIRjJrdmtyQmFRQnVPODJvc3Nj?=
 =?utf-8?B?a015VmFyQm16QnlraEFJUWtPUmVmZGxKQkF2a2k2ZUtPNVVwQzNwL05VODBO?=
 =?utf-8?B?ZkZ5enJVSFp5VVQwSzR6SzdZQWxlckFMS1hyMFhUV0ZaVkp0OXBRcXhBQzZq?=
 =?utf-8?B?c1hvbnFEQnVZMTBkMHVGWjRpUXFHTnhQTG4wU0VVcHVUMTBmWWdYVGVudUN2?=
 =?utf-8?B?SCtCUXlOSVlsUWdUM1UzNFo2MTl4K2ZEU28rc1dNMVZEb01IVGN3b2tWUlIx?=
 =?utf-8?B?NnhMZDloUllhMndCeXVBanZCN1RHeFFPMkJtWlpEUVZUdlN2aElLSU1tekk0?=
 =?utf-8?B?d3lReENvNDZ5RlU4OW80M3pYcXFjMGtMaFRmUFJWWUxIUHFCSTBUT25mdGtR?=
 =?utf-8?B?U0ZDWUthMksrbzhTeDdWR2VnaWxYNnF2L2w0ODExTTVTRTd1bWNrVkNtY1Zm?=
 =?utf-8?B?YXFoSHY0ckNmVFZFKzZYSFFic05Fc1c2UGRvZFpyOFZHMjlzeEU3YVZTN3Vm?=
 =?utf-8?B?UWhHZW1tNWpGM2VmeUJCT0FNM3docE9vUnJ4RTFVWGw2aEkyd3hyQTg5QkZB?=
 =?utf-8?B?R05kc2IxYUpsSXlrcWU4YWpmUTJFYXlRaUVSclJPdHZzZGJuOENyK1NIUnB4?=
 =?utf-8?B?ZlRXcjlkSEJnMUJHZDFyYWtLcE1JV0lrNk9VZTFRTDllQnZLSjFEaWxtYmZ3?=
 =?utf-8?B?RUo5NWQ4REdvWjFmc1MybzVrVVk0R3E2VUlxcWdndW52Tk05MGdGR05RMStq?=
 =?utf-8?B?TjZvc0Qza1pyNEFiY0I5RTRvTUZ0bnN5LytQenYrUnNMTmE3b2EyRUZNaGg4?=
 =?utf-8?B?Zk1ybGJ6aUllbGJYa25JT1RLelY2Q0x6bUp3QVRJSWo0eUh5MzVud3l5WXdD?=
 =?utf-8?B?S05CYVRwUWI1OHgwTUNDenB0YkxVbVNxTVV6MXMxWkxsSENUTmlxTURZOEsz?=
 =?utf-8?B?bElZdDQzSllXWnhOV1JScUFocEYvRyttMEplU0R1UVZkQjJhTmZFMTg1eW9o?=
 =?utf-8?B?Nk13ZHVQcVNEeGhoS2VxREdIRThVS1paUVo5R1ZQSFVBZjB4Y1Jadndkd0tZ?=
 =?utf-8?B?RjYrckpCSzZCZTFabVVBTTJLYmJURmxxWWNUaUNjWCtYeExCY0pOMDFEd2Zl?=
 =?utf-8?B?bk5lSk8vZjQwT3h1cGpGT3VHYTNReUhiWXozbGEwWWo2TW11SmNiUDZ0bzRl?=
 =?utf-8?B?TmtmbXI1ZkVJNnJpZ0JhTm11SnRPYTlLdVpLMW13ZzFSOWFROStFNWlMY0Mz?=
 =?utf-8?B?MGZmUkcwZURhaXR5b09mZ0xGbnJHU2RTSnRta1NFQjd6bHkzK0YrZyt3SWk3?=
 =?utf-8?B?MFoyaW1UdHN0UjhFamlxS24yb3ErRjdzUWpselhPZGlva1haUndCQXVPZHFv?=
 =?utf-8?B?UUJPRDUwWU5IN2JZVnJjcjF5RUdzYjVOTzdyWVh6WGpOYktCU2NxZThjazNW?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1885a3-0982-4c01-4731-08db661fffcb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 23:53:02.6200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og3Y0+iR9PAQseNU/w3FzKW30u+YVWK77cSaEHh6RVTX46OcXv29mIk5hFPYCjfS4F1ypMY/4kTkdKpggnRdV6A7cKWId6UHhk5BmVRx6WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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



On 6/5/2023 4:46 PM, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-05-31 at 17:25 -0700, Ceraolo Spurio, Daniele wrote:
>> On 5/26/2023 3:57 PM, Teres Alexis, Alan Previn wrote:
>>> On Fri, 2023-05-05 at 09:04 -0700, Ceraolo Spurio, Daniele wrote:
>>>> Add a new debugfs to dump information about the GSC. This includes:
>>> alan:snip
>>> Actually everything looks good except for a couple of questions + asks - hope we can close on this patch in next rev.
>>>
>>>> - the FW path and SW tracking status;
>>>> - the release, security and compatibility versions;
>>>> - the HECI1 status registers.
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>>>> index 0b6dcd982b14..3014e982aab2 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>>>> @@ -12,36 +12,31 @@
>>>>    #include "intel_gsc_fw.h"
>>>>    #include "intel_gsc_meu_headers.h"
>>>>    #include "intel_gsc_uc_heci_cmd_submit.h"
>>>> -
>>>> -#define GSC_FW_STATUS_REG			_MMIO(0x116C40)
>>>> -#define GSC_FW_CURRENT_STATE			REG_GENMASK(3, 0)
>>>> -#define   GSC_FW_CURRENT_STATE_RESET		0
>>>> -#define   GSC_FW_PROXY_STATE_NORMAL		5
>>>> -#define GSC_FW_INIT_COMPLETE_BIT		REG_BIT(9)
>>>> +#include "i915_reg.h"
>>>>    
>>> alan:snip
>>>    
>>> alan: btw, just to be consistent with other top-level "intel_foo_is..." checking functions,
>>> why don't we take the runtime wakeref inside the following functions and make it easier for any callers?
>>> (just like what we do for "intel_huc_is_authenticated"):
>>>       static bool gsc_is_in_reset(struct intel_uncore *uncore)
>>>       bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
>>>       bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>> The idea was that we shouldn't check the FW status if we're not planning
>> to do something with it, in which case we should already have a wakeref.
>> HuC is a special case because userspace can query that when the HW is
>> idle. This said, I have nothing against adding an extra wakeref , but I
>> don't think it should be in this patch.
> alan: i believe intel_pxp_gsccs_is_ready_for_sessions is being used in a
> similar way where one of the uses it to check huc-status and gsc-proxy
> status without actually doing any operation. If u still wanna keep it
> differently then I'll have to update the PXP code. Or perhaps you could
> help me fix that on the PXP side?

Sure, but let's take this to a separate patch. This patch is not adding 
that code nor any calls to it (just updating the defines), so it isn't 
the right place to add that fix.

Daniele

>
> alna:snip
>>>> +void intel_gsc_uc_load_status(struct intel_gsc_uc *gsc, struct drm_printer *p)
>>>> +{
>>>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>>>> +	struct intel_uncore *uncore = gt->uncore;
>>>> +	intel_wakeref_t wakeref;
>>>> +
>>>> +	if (!intel_gsc_uc_is_supported(gsc)) {
>>> alan: this was already checked in caller so we'll never get here. i think we should remove the check in the caller, let below msg appear.
>> I did the same as what we do for GuC and HuC. I'd prefer to be
>> consistent in behavior with those.
> alan: okay - sounds good
>>>> +		drm_printf(p, "GSC not supported\n");
>>>> +		return;
>>>> +	}
>>> alan:snip
>>>> +			drm_printf(p, "HECI1 FWSTST%u = 0x%08x\n", i, status);
>>> alan:nit: do you we could add those additional shim regs? (seemed useful in recent offline debugs).
>> Agreed that it would be useful; I'll try to get a complete list from
>> arch and/or the GSC FW team. Are you ok if we go ahead with this in the
>> meantime?
> alan: yes sure.

