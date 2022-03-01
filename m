Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC04C9970
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE8310E877;
	Tue,  1 Mar 2022 23:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4671610E867;
 Tue,  1 Mar 2022 23:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646177892; x=1677713892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IWa8yLWWKiHKWCjHdGDzxZM3PD3AqNJSIIiG31ihl7o=;
 b=bChGXAYJYrHujMzSEogyY97+Mu8xUVsH7n7Lcrf3EsF3sJv/FDZ1pfv7
 5ZsL1+s5y/MqZNGQIIBgYnXzUZ+hbDZ9ePb4R5w5BUtlmMz0anngXkvLS
 UD0GcWdV34drs2RskQGZGQcszxOBUTxWuK/uL5LKS4i8q0J9k1G5TUo+1
 JoHgUodATVA8/EfXuIIzf7gjKHRkjMnWZfrbtD5lPe+le0jDAnFQqmXEF
 fsuzPmQP0u2o8qxXBoXKk5pZi4QSHkP5NsVDUA1cgQiPc7pTl3Jo1CiBw
 i1NfqkQvyQMhFwcVmupok502L5EXFHpnad7KybwiwQLAAtxy6LTAMS23X A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236775364"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="236775364"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="641469146"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 01 Mar 2022 15:38:11 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 15:38:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 15:38:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 15:38:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 15:38:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZZ6zwLFHvJ77ZOk22iyq8etCWvJoTrAlPU2Wjms8LR+LFrJRxa4s0yTlbf/7XMRskDPKkcROJcFLyhKma8sJzJn63iyh+CoVrKdUMr4nquj2gLALDzUS+ncGDko0CpUx1NJcDDzMPqZC97fQhjDOpNZ+htdFdtHIBJS1NHBHxGJpA7Gx7Fs4MXZMMH6kAwYM8QX48qhhJvhaosdEr59fO5nBkW+1Ha6tFlfX+3RGeemrQQbTtMo2e13aOmlHMUpNrAdw4kIaSs8Ya+Zok7gZU3aD9AiUKU2qKQKthuPksy7K4G2dS6bdMLlvNrvl5IIAuGE8ai5VkQ7pQmoupFKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVPllT9uGwi1xGHONsPu/NlF4bOS57rTaULZZD9RaME=;
 b=mlRaOjSV07odAkaDAvkepDKaL/awN5e4X5sawvIZw2hhb/8f81kA06lLVOzpUF6bh0Z4f+U/LNAW+5ISTyvFsXX13sK/Z8Wl9Dpbjaaog9ZBJRmbb194bM7FdvkYGeWaryo0jHOUiASld1e0HzpoZ88dmSKV4B8WDFHIeByl56CGftnSzmzYI+werWTy1Ip499EZrbtN4HNB7WAeKjN7AyuL7AsMRfveTzJz48LzAqs7e84sHTAsFg2EB40/dFpDxuyUlemYq4LNX3ez12O2BAtLXa41Mf8FvZ+uV3S37H5W36Z/Cqrm4NQuKnqjRhsHol2u77c5G37JdBGh5lVCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2667.namprd11.prod.outlook.com (2603:10b6:5:c1::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Tue, 1 Mar 2022 23:38:08 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 23:38:08 +0000
Message-ID: <52a150f5-8d52-4ef4-b2bb-e7e29985ed71@intel.com>
Date: Tue, 1 Mar 2022 15:38:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 09/13] drm/i915/xehp/guc: enable compute engine inside
 GuC
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
 <20220301231549.1817978-10-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220301231549.1817978-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69a23b4d-8286-4399-db04-08d9fbdc8a21
X-MS-TrafficTypeDiagnostic: DM6PR11MB2667:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB2667FE233C8ABDA7F190DA6AF4029@DM6PR11MB2667.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBH4bionV9lxAW8nGYG5pd0kHEC5wCEup5NrdoWfPTw+gbIJyFevcAb85+r+VJqzGf2gnvja2WIV1JBfu3VaRosGT1NqDyE+CE7AWmiY4GVFzSmAS7wvIcr10cBCjEzd+xC0Mr5YldWQOKXy6kyuGaavYgvMp0mFHnSpCWoAowoqROx6SOoibHH2G7ivK6TbimPeCwWF11+V5Wb5LZHyzuXKoQJwDclXyT3L3zZZ3bQ2tXayLiqlR6Yvt7ByQhIyDxIJkG5R24u/HqoZOzgc1KQsmAxo63WrJOrvrWmnLXJBgprLCHDqodrMKcS2pe07glT4hF7kgFsQayd1kJSn+/8ldrYLJbnY2KvV7lv1SwAQAiKnShqzpg4InoICT6n3ydG+CHdJPwnQj5faTU9EaOLQes0aZLXqZhXalwf4ZzaAMEdNZTH23lxVCJMdtuuIB0oZD64iP1fPMTbVa5SFQVcudQLFmGosioRpm1Ve9ixXnSwP/scxhm2eQ8um4nerGMQwQkvPz/QR3k3jB8NlJJCGDyLu/0olCEFjv2josv/WsEyNHL2imbIMogKU+s+E8uSk03Gw2l/D8RgTrhpICm0rIENIr1KN0duGWfPewsB1ncBxj0wCWFE6fszKLHFNRwjApP0kSZnluF0VwsjtMGqLdjc0ZohfjwHSFJB4puV9X3tbch+m4p9L2kn4tRRP/Vf0eJnAKdUO3YsyH8njHQaNME4myYtDayfliRuf0UsnKL87AABVGSXsSW7wAp1F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(31696002)(82960400001)(508600001)(316002)(450100002)(4326008)(66946007)(66556008)(36756003)(8676002)(66476007)(31686004)(186003)(26005)(5660300002)(53546011)(6486002)(6512007)(6506007)(8936002)(86362001)(38100700002)(107886003)(2906002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZKMlo1bEtiOTM5VWZqQUV4V1FaN0szWkJzMXlaNG8zSjVQdlAwTTZtTGR5?=
 =?utf-8?B?cWxYVk54dHhNUnVrcEJRckN3TmVyT3BiS1JBd0JjWlQ3WG41eS9WV1grb0dx?=
 =?utf-8?B?dTFIUzIxclV1UmJhYzg1K09wV3llZmJrT21hWVNVdEUyMUdnd2p4ZndMQXNS?=
 =?utf-8?B?VEwydVQ3cm9ubThJbkZneU5YYVdUWVFPUU54bjM4c2FlUGpQaGxWY210VDNY?=
 =?utf-8?B?TGdhT3l1RjlKZXJVckkwQ2x4dGg2ZlhKNDZCK2NmeTZ4eXBieU9zQzgzWGJH?=
 =?utf-8?B?d2VQZ0FNZUpXR2xKYTJ0WFJHMm4xNFdMWFFQUlFCakNON0g1dkVYTWRXUUw1?=
 =?utf-8?B?TGVkYmlkWWYzbnBpUjl0cTVTcHg5MktZWHljcHQ0UklBaHdrbnMyQktkUHEx?=
 =?utf-8?B?ZitFdkFwTDJRRWpCNEMwVUdKVmVIbDJwcGZKbzN2US9yTTZvUjZXZGZ1REpX?=
 =?utf-8?B?Smc0YnR5TXpuSUFMcTNqbUsxWXcvQUVtTWxKZ3BaWjZSNTZ1WFZVS1JvRmpY?=
 =?utf-8?B?L212TmZEb2FLVitpN3h4UFZuQk5QbXhBSHV3SUk2bytwc0ZCVmtGMzdxTkla?=
 =?utf-8?B?dWx0OC9OY0lCaVJWajYxUzBVeUlYa0hVQm1lKzZoM2FCcjRZOVcwZ1o4aDR0?=
 =?utf-8?B?blBNVkFzb0VFbWtNUDdxSjVEVkpKS29TUmdTRlBwSmhMTzkxN09yWm5yNFpS?=
 =?utf-8?B?K3FCNFdGbTF3VnRjdHhKdnpiaE1sZzVaWTRZY1psV09oT1VleU9QUGVVbWNT?=
 =?utf-8?B?RWt5cUNRK3hUVkRmbU5ONkRTT2RPZ2pZbEVvY3dWd2VnWGhmY05yMm5wVmZP?=
 =?utf-8?B?UDZWT0Z6MTVCK1J6b1hSZVFTMkFNclZjWXRKbTZZUy8rTkxZVWFINFhqbVZN?=
 =?utf-8?B?ejZTU2h6TnFxQ2dwV3VLa3V2ZHpaNXZWQkZEK29GRlV6SDJQTGtqbWJxa2JO?=
 =?utf-8?B?emd4bmV2WEdBL0lEMVF5WlM5bTEwOGx5Yk5YaDQwV3RUc3ZiMHJGMDZwb2dP?=
 =?utf-8?B?UEI2YVprY1VJM2NTZDBCVXM5bGRwNUFjVnIzOG00WlJtTHVmRkVBOGFVL1ZD?=
 =?utf-8?B?ckNWNVBSQ21rWkJiSDFzUWNuNk5zUFFTcXoybjg1S3JObXRObUpEWEptRmZE?=
 =?utf-8?B?UHFhUElRblpQZXJQVWQzeUZqVFkxWmk4TEFMM1p5NklGSmpIbXlVOVhocUZq?=
 =?utf-8?B?cS91R0VrVW02UXVBYVFLZ0M3SWpPZ1dTbllWZER2Z0lsSTErZ3NGUkRMRW9q?=
 =?utf-8?B?cFFMTUJIQ253YnVjNFJxcUN1bUVYNTNHb2VNYkFhSXBtUUo3bVF1RFY0d3Bs?=
 =?utf-8?B?TkhJVmRicWZTaDBIbnRrenl2aXk3U1U3Vjltamx3N2Rmb2lsdlZraEZqcXR3?=
 =?utf-8?B?dEk4Z3NNSGpoRE9Jcm9ad0Z6ODVGclE5STUveGE2ZmI3Q3hleDArTDN2Zytz?=
 =?utf-8?B?Sk1TMjNwOWExL1R0aG1jQjZ0SEpYODNxbHZBc1l3SHBTMUV2NWdWUjFmb3c4?=
 =?utf-8?B?SkIzOUp1b3QrUkhHWDBqVTdiQ0MyNzhZS1d1NHFWVndyZ0FwVnFwYjlDVi9F?=
 =?utf-8?B?Q2xUWSttcGx4YUJXMXRHcWI1OW16YjJsQmhHVXpmRU5jVGJ5bDNIamFFUzRn?=
 =?utf-8?B?N2lyT0ZjZk05dDFRMUJJZFN5NUp4Rkx6aEVlUTNqSVh5eHRTSks0NTlXcElx?=
 =?utf-8?B?YXpqMG1BS0VpMzYrMTFwemNsNUdJYnRYS0ZtMkZkd1cyMUtXSFNwcnpHRkx3?=
 =?utf-8?B?VURlRnVOZ2E0VlhCanUxSVR5NExtZExSeTVSNFpWd0k5dHAzQkRyM3kvNDJP?=
 =?utf-8?B?bGVVaEkvRm1OdFZCUWUvV09pWnV4N2d5NXFvcXZKU2hraUxROU1mUUpTQnVp?=
 =?utf-8?B?NWoxaEVSZ3FOdExLekVtRkpLckNSdkFsWVRyWFFlZm8wTFNrdldUQTQwQVl5?=
 =?utf-8?B?RU5EWmg3N1ZCdGtTbHFKTndCZFRDNE94ZnV6b1Z3eTYwMW9wTll6ckw2cTdV?=
 =?utf-8?B?TlBLNzVJNkhJV1U4dFhDTXdMOE9vME9XVHAvZm01WTFKQVhMNTlZY1QyanFV?=
 =?utf-8?B?OXkvbkFCMlRWQjJWSGRGQzNyTmt0RUFnQkdlVE1TZzhGSjJKS1RWTU5CVFF4?=
 =?utf-8?B?QmI4bUI5V0JSK1hHQk5uWTQrQnZrTW0wL0pNR0tvSS9zVCtyK1h5SnVQb2tQ?=
 =?utf-8?B?NzZCSlhZbFJOS0N2MW91QWQ1QzlxQmZpWEwvV3A5WTNZcCtTN3lxNDZtRzV1?=
 =?utf-8?B?eUlPL29USmI0dGlsZzVkSFMzdCtnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a23b4d-8286-4399-db04-08d9fbdc8a21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 23:38:08.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOdu2GCsIRexyX9WdLq1jtByXxriSsP/2qnBqPF+CNyTW3FfDxVbv1HWVgnnyE9yLjL7cdOaQoGvoiYg8fVexOAR1VsBBimGHoNCd9gJ94Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2667
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/1/2022 3:15 PM, Matt Roper wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Tell GuC that CCS is enabled by setting a bit in its ADS.

It's a mask, not a bit.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Original-author: Michel Thierry
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 29fbe4681ca7..9bb551b83e7a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -434,6 +434,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>   				     struct iosys_map *info_map)
>   {
>   	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
>   	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
>   	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
>   	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));

