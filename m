Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A8D76F8D4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 06:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E680A10E237;
	Fri,  4 Aug 2023 04:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BECC10E237;
 Fri,  4 Aug 2023 04:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691122386; x=1722658386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=14JiShjPOrBpAeFSFgjp9S+bnvKBBKvMVW0nxVHkqSk=;
 b=YjSvhluBC21p3N/B6is8pQ+9DmPVi/+k5pZ5vd+bajmBGvjDqMUUFmVv
 KUsHpZSZE6M8DqVuGo5NSScely7ICrJ1D0JJKQBdXNS/1RwJXkvrH+wZ6
 xO3OYoHowBa4ELgKGUH3lNy463GHGRyj4MBgkMjwGP5sIH6pihpyQ98lW
 wXWxvQ/F1fkOOVoSG+uMhIt3nBeyvCT5i553XJvA/JndP+/lqSf1ZuB3U
 oZiQW9ggCGAMkXEK0RkOJEldVt5vB50m0fUsf1yBrz3c5oI5agD8F6eIO
 c2TY+gXBnn/FZ4vh2jkeRLpYTIOZCmSJnXG1WbPkGjtOgtNbLz4wS4svN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456434443"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="456434443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 21:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759380525"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="759380525"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 03 Aug 2023 21:12:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 21:12:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 21:12:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 21:12:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 21:12:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6y9/dJeY8QVxD2GlYRjJMG4KEDLdK11iplRZj2k2tgme609uQpQU5RriYyFaZUAkAeqqBYKdJCNJ9xo0TdYIang95vKK5Zi7omfaEcU1vYtnjtyzYQS8D3/m3Ls8er1ZaM5pwvHn4BnjhijfPwQy54jz9GTKuqBU7kNaEvmFXh2jLaIxijGn54T9BAqK033TcPY/1Hy/dRlsN0/RL8HK8I0thp1fyBUtrC+JmSFE6Fg2f2uJ3bdKfF0uMaMCeSbgf0yNFfZvRmj01guDezy1JWs3M1UjjGY0N+kHCAyk/hFSQBZ36GSzSzFs913bWN7U+gxPxYBX3ikEi3eX0+uhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k86xdPWSsV5Q3hhtIj8smLQJz9EqrXOKPlqPcYwm4U0=;
 b=mA21OgBlvsv6BViB1T28BsyUADcGGtJmvnjQNgG1ogYFSJzCC8N5qY9/PkxK7ZwBXdsVBIsn8myXVnjZUkHBgPT9htY6cnSaeIjvfMFmxpaJLyRxOfnUkVSslSG0GHeNGRgE/LdXUu9RLfSk6VWm5qkUf3WtWFqoNI1kWNyr/7tjmtY5y8m3VV930hDw/X+LJ+7BY1YGZpmVoukX9I4GpuO8DIdiYRfXDiN3PPatQkmt7xnyBLAdGPT5ClaTyazevbFVf3/xMaAz0XpRaBh4ww6gYDj/is9bE++xb+f+LHXRcYiC2L8nswoZjU2U8++O0/H/I3LsNri8MN6kKWp0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB6690.namprd11.prod.outlook.com (2603:10b6:303:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 04:12:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 04:12:47 +0000
Message-ID: <ff27c5c1-51fc-af95-faf2-b7caf79b984c@intel.com>
Date: Fri, 4 Aug 2023 09:42:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/20] drm/i915/dp: Add functions to get min/max src input
 bpc with DSC
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-11-ankit.k.nautiyal@intel.com>
 <ZMpGoijz4MnEZqeY@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZMpGoijz4MnEZqeY@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 314dc4c1-424a-465d-3d98-08db94a10f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8s31+8t6ts0JV5itnLaatHEre4J3LqFe394t6snpj6Y1RmQuJHRIztkK1Av5hjNx69s1lvnx6ppaosGnhxizIopmONvxIWSnDjBTrZWbukDp4C7y3+aFjARcbM0OpOaPsIVEKCgcim2cDgH85skmzUYy1bOuOs7ZzbWudq25X6C7hkGvyGmw8vDmedWO0L3kYdxSI8DLUCLqnfF01S3orcWmLCrN7Rkq/E2vvTyhXMV5nap8NIlEKSk0uBnEGOdjlTQLkvv1TEBJkALldnhRU8XPfY8icul16ZMq1etH1B7vJsIrm4ZQO5s9FfdDZh07M0bcGVWnOyV43yzisxwnVpyoqYrZoxZTgdftVRFR3RoJGHF8hi/hJyidy0uRmVpzYwOV9PfnwCIq/0pYHuNNw0XAIQTdWEqNMECmon6dszduZvoeNugx6ZZyA7ihwWocaEqV1heAOjKM55cQf3iu8QpSzmmbibLpSWQ4gfUwStjQs+aLvoZYQA2ddg4MmicoubwMlRLUcZd5wQLxSc0R2xnHB7KiQOQ7YMGYKm7zFYH//rvIfgNqc7A3yPS6E5n6bqk5sPrGgpBy/2zzvppesXPm2OOWyB6SYZvRQX4Ps9J81k4z4CTB+PTb0v42jsayQN8k7Gk4SHLknx11Pl7LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(1800799003)(186006)(6666004)(6486002)(6512007)(86362001)(31696002)(6506007)(26005)(36756003)(2616005)(53546011)(83380400001)(55236004)(38100700002)(82960400001)(5660300002)(41300700001)(6862004)(8936002)(8676002)(31686004)(6636002)(4326008)(2906002)(66556008)(66946007)(316002)(478600001)(37006003)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elgvaDRYU2UxN2Vsd2pkalJvVVJlM0xxdzA2RTlRMHg2UWdqdlhGRmxZbjRO?=
 =?utf-8?B?T0crdms2Y1RENllBU2tuaCttblJPSXNkVFUrQW5hK3FpNnFUMS94N2QvaFBF?=
 =?utf-8?B?Q2t2SU5IeE5md1J2ais2R3UwWWRtRUJIblEzalkwTkt1YkZIWnlUczFhcFMr?=
 =?utf-8?B?QUhLR1VlN083TFpTUWYrbEQycGtWcFU1aGV3eGVYK0xhS0hncklkeUtXckts?=
 =?utf-8?B?MnR5N0ZiVmtWQlg5bXJlVFNKK21YT0FPMkt2WnZXQ1FjeTArTVFaNS9MMFkz?=
 =?utf-8?B?OEhoR1NKdExlZm9LK09xSVlrSUZ3cHBwK00wZmVaSGo1SnVnMStEbXArMTdn?=
 =?utf-8?B?a2Z4QzdpK2tJQnQzOTZkc1Y4QkIxcUk0T3UzZ1NBTnRmZm1kM2VTT1FiZDcx?=
 =?utf-8?B?L2hxVDhxRHBVeHdRMHAyWERLYUlFb1dDdVhGWFRES0tZZjBJM05zY2Z2a0pl?=
 =?utf-8?B?TE54MGRoeTljZGpVeEtPSnZrbUxZbFNaMi9BendwMUgyUmN5OVZxVDIzOWd1?=
 =?utf-8?B?WDEzMVlydTVXNGgzK1crNktkKzFNOGVuYngwUUxBei9HYzhoNXlXa2gwTGRR?=
 =?utf-8?B?MHZrcUI0VEt2NlZuY2N3MGs0Q0VTeitYNjN3M0RRVkxFODdGTlc0Y3pRUDZI?=
 =?utf-8?B?ZDlOMFV6YlRzMmVoZGw4WUZJVmlFQ1NZNHRZNTBIUlFGa0k5bEgwN3p5L3hq?=
 =?utf-8?B?UkhUUTU5TStqVHlPU1NFYnlzVmpCWStBcGFOQlpETWNvUXdDZ3VobitpeUZV?=
 =?utf-8?B?Q0dBdTUxdGQrNjVWNEhxUldLa0tVeHc1bVlRMVdFWGVHeTdiT3BKWkxFNFQv?=
 =?utf-8?B?Rkl3cGlDVTNyQUhON0xtUTVkbHA5eVFlNnlOUFpmbTk5cHBPczBZOWE4OVhn?=
 =?utf-8?B?VzBSNnpiMUZldzhZVFJBbE5oZDk0aUQ1WGQ4TlZ1TVI4UVJxdEd1dlRzTXV6?=
 =?utf-8?B?OUlOcklnNTBrZzMyZjRWSGd0RDErazdKUDgxa00zUG00eG0xZmoyUWk0OTg4?=
 =?utf-8?B?V1JDM3RoZjI3aUROVHNSbnNqSVUwSkhLTEdLR3crSzJQRnBibWRPb2x4UUhy?=
 =?utf-8?B?TTZ5QWpQbXVGd2VpV1l3WVpYaE1hN0FXUlZpQkxzR0ZjM3J6cktGMjMremIx?=
 =?utf-8?B?SWh5enhhZUpBaXhFa1F3ZVpoODdTL3l0aWFSdUorT1Bhc1dlNDVrUjdnbktQ?=
 =?utf-8?B?QTVzYWNXOE1xdjhQaVpqYTUxc3MxVDRHSXNJMVZoRzd1ZGZXRkg1TVpiL1NO?=
 =?utf-8?B?VzI3VjdyeEgxSDBIOVVXaGthYjIyMXZPM2I4Y1FCbnAvZTIySXdrSXVvelQr?=
 =?utf-8?B?U0tJNzdqZ3czWE5IbmI4VzNUb1ptVXEvVXBnZmEzZmpwTG5BaktjRENacElW?=
 =?utf-8?B?a0FHbkpBdFFEWGZmelBhTCt3eHpOTzcvZlA2VCt0SzF0c3E4RE5VeTBxeFFN?=
 =?utf-8?B?UW81VVVVYjlxcmRoekZaOWs0TlAxbzlzVUNNZ1BMd01pdlJhZ2hpM1RneWlj?=
 =?utf-8?B?T3EwUWRmaUQ1T0JRMnNKekZGNWsreVNkT2tTOHZQdmdZQXRZUXVMQzFxbXht?=
 =?utf-8?B?Q1lQZkFZM2ZOeExnekwyR3FidUtYcVBvK05zdlpqNGRrdUM1STJrVTh2bTlz?=
 =?utf-8?B?RXFnTmlsbEJ2d0pQM2ZkRDNGbXJ3YXcrZU9sZVc4RE10eUJLV3JTTys0OU0w?=
 =?utf-8?B?ME9sZTR0NHZEWmpHb0VIMW9veXBlc0JjRldEY29RbGg2UHYyd0RsS0NsOXNR?=
 =?utf-8?B?ckUwMklzNHpkeTZ4R21KK3YxVENkdm02blNxVWtuNWRhNEM1NEs4SGZ2UGlD?=
 =?utf-8?B?ZEJSYm5CWGNsZ2U2ZmZOSHNITU92L2xIU0doNk1tUlNGMXM3L0RoRys1cURQ?=
 =?utf-8?B?WlZQMkR1YzBWalJKd25jdDh6NnFtOU4wOGdzSDlpUVZYZEw0K0FmaGloczBU?=
 =?utf-8?B?SWswR1IwaTIyWDFpYmJvUmVhTEJwN2RoTE9BR2hoaG40WnRtbFdTaE9FTXpG?=
 =?utf-8?B?T2VyZENVUFZNRDY0TGh0VS9lbllyM3NLeHQxaFRkeW9tY0hXQk5TczFpUXRF?=
 =?utf-8?B?NlVDRHlzb1h2Nzd4NXlBUDVuNFd0ZS9YYXg2NTNnMll0QzdhejhVVmkzTTNx?=
 =?utf-8?B?ZGVWaW8zRHhVZjN1cVVDallrTWhuRVo0RHRSR3MxWENKZFBKZmRzaDhUN2hp?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 314dc4c1-424a-465d-3d98-08db94a10f5b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 04:12:47.5073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C142zeFp69KbzeZAEMDOVbfTm7tyC6eX1qnwqUnVK1q8G8XK+zZV7Bw4zCD1TERDxkP4K7+Kp8FSjta/ASyTk8TkjgVqfoGUAJO/b+9j81Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6690
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/2/2023 5:35 PM, Lisovskiy, Stanislav wrote:
> On Fri, Jul 28, 2023 at 09:41:40AM +0530, Ankit Nautiyal wrote:
>> Separate out functions for getting maximum and minimum input BPC based
>> on platforms, when DSC is used.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++++++------
>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 7ec8a478e000..f41de126a8d3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1535,6 +1535,18 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
>>   	return -EINVAL;
>>   }
>>   
>> +static
>> +u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
>> +{
>> +	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
>> +	if (DISPLAY_VER(i915) >= 12)
>> +		return 12;
>> +	if (DISPLAY_VER(i915) == 11)
>> +		return 10;
>> +
>> +	return 0;
>> +}
>> +
>>   int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
>>   {
>>   	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>> @@ -1542,11 +1554,12 @@ int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
>>   	u8 dsc_bpc[3] = {0};
>>   	u8 dsc_max_bpc;
>>   
>> -	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
>> -	if (DISPLAY_VER(i915) >= 12)
>> -		dsc_max_bpc = min_t(u8, 12, max_req_bpc);
>> -	else
>> -		dsc_max_bpc = min_t(u8, 10, max_req_bpc);
>> +	dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(i915);
>> +
>> +	if (!dsc_max_bpc)
>> +		return dsc_max_bpc;
>> +
>> +	dsc_max_bpc = min_t(u8, dsc_max_bpc, max_req_bpc);
>>   
>>   	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
>>   						       dsc_bpc);
>> @@ -1674,6 +1687,16 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
>>   	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
>>   }
>>   
>> +static
>> +u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
>> +{
>> +	/* Min DSC Input BPC for ICL+ is 8 */
>> +	if (DISPLAY_VER(i915) >= 11)
>> +		return 8;
>> +
>> +	return 0;
> So does it mean that for anything below gen 11, there is no limit at all?
> Also it means that the condition below will never be executed for gen <= 11.

Hmm. Bspec says min bpc is 8 for DSC, so idea is to have min bpc as 8 
when DSC is used.

This is supposed to be called only if DSC is supported, so perhaps 
HAS_DSC can be used?

return HAS_DSC(dev_priv) ? 8 : 0;


Regards,

Ankit

>
> Stan
>
>> +}
>> +
>>   int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>>   				struct intel_crtc_state *pipe_config,
>>   				struct drm_connector_state *conn_state,
>> @@ -1707,10 +1730,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>>   		pipe_bpp = pipe_config->pipe_bpp;
>>   	}
>>   
>> -	/* Min Input BPC for ICL+ is 8 */
>> -	if (pipe_bpp < 8 * 3) {
>> +	if (pipe_bpp < intel_dp_dsc_min_src_input_bpc(dev_priv) * 3) {
>>   		drm_dbg_kms(&dev_priv->drm,
>> -			    "No DSC support for less than 8bpc\n");
>> +			    "Computed BPC less than min supported by source for DSC\n");
>>   		return -EINVAL;
>>   	}
>>   
>> -- 
>> 2.40.1
>>
