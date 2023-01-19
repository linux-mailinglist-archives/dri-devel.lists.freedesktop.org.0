Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6F672E12
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B310E21E;
	Thu, 19 Jan 2023 01:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E429E10E87F;
 Thu, 19 Jan 2023 01:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674091715; x=1705627715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5T5bBFJ5Hsy89DxASQvQPPhdr40zimK1oPvMrJoajik=;
 b=gj0MJFyi/OLa68QL77Bu2ZAQyyloDXMuO6W90mxOb/GKdqxzcbBxQj7X
 h2A1SHcbW2dpu2Ctqye4IB8VshJaB/yTxD3+0ROZsyACrdfNbsH7dDEcO
 Hn3o4gsaoK9JWXjiFo4K88k7WT4D93Nh3iBpjOi/zvwjVEvcFxY34w8dL
 WfAIskx88IoTKFN2piZO4DupK7FMm4qiBS23sR8WqC2WSeIOCYLVlAgDu
 V0g+zHAtUdzw2rKoE8dtn9W9W5SoGGQuIW3WmjTwis0pHq0YsvoDr0ngt
 LmJhHd57Stez3RU+RG1eqb3fwnon0wZPN5/S4823i7KALEcfPqBlRbFxo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411398979"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411398979"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 17:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728468955"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="728468955"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 17:28:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 17:28:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 17:28:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 17:28:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hu1la2t6RXYY8qD0scDUsEu0Bxk0zmUW1ZD0YAN8OoPefRbTTFfyDVyqM6bVh86bk627YJu08/7Jqa8fRgKUrHufDeth77LkpMqKoxqVdnkvsgLi0JYnKoU5nJ9k8X+et5YmUFwXUVxDJDYIotXL7oXpkIq44A8blTCv5gxQ2JUi8D3IbWh4zmHkYcgTZSVsQsFP90YSHeq6t4F6fLS77imwYpk5H9gHUwP38m+igqAZa/GKDdiWgYwBjAx+7ZreQhghxLjQeEMPD1N0kTG1+IhDOIGDz7iA8Y42bqreZHIf61ZEU7R1aM5pgRjK7O21E2KvDDdt2I1vowo1FtnWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0O3dDTzaorVrFbop7qEkSPSqCN+gy/NrdDXnDp5Vjs=;
 b=bdm1Su7OvDJh+4SwFi/S13QzQMblUMlgkPNgKTJkyHcrYdYu3G8kTtsLeoG/ObVp23hgXKdXStrAGj48gqEkgcgs8R1qES7pfNqpl8yzgXRjlGE47wWJZ86cqn9AmalEKhgpE0Kd9EKPEZPHaUki1s/ofu7hZYAS+Mh3WAx8DURtHndahL7aKeDrCQLrRdDCsOea55tvYxO49y78wtAOgZPrrf7+5ruK1hGJXymtg1/aIMuMqaBmgYlhqTTFDg8INE9PJm7BdR9HHJH38QP4GltUHi3DYo3lluOPvBX54WNJ+agsveUMne9vmLo4XFOgN98p/ufRzSqj8uj1NbBQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Thu, 19 Jan 2023 01:28:32 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 01:28:32 +0000
Message-ID: <39ddb0e8-b605-66a2-e39c-c0481198cc19@intel.com>
Date: Wed, 18 Jan 2023 17:28:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/9] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-5-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 39248940-e72e-48d1-aa08-08daf9bc79eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VwsYA44aP4veENp7cQL5O6fTO7IhDXqkrOzmGKsmyf0Cir/F1SkQPCil+IDLWX0h742/OO90bTNtF/SKdrw9oj3XqhbA6emUZZs64X6/O6Arh5Ad+1NOxzg+FmzIMjXPMIWWKMv44uhBOA81nPPFZO+FX4ApOc5xr8ahoeRxWUV4GQ7IRMI8PJ5ljYi2vUU5eWmjRFjHeZj4iUvFGMzrshBD5oROUO5CbA8VJlr+720CDK+LQ9er34s2qzbJqrfbsEfrCVT2Pr1d8l6W+wfFLgiOoWbB7/CXIRQlkuE929GQ5tggXZo0jeo4eBzJq47CzqWWwByNX01gNsYL7bGckkbLd9B7vsJl2wsyX2D/kF9Wp1uX7Bu6HSbS2mdyeEyohrLo9tYWj2JEOSVKKxZVjVvUpC/LKooFX5gaJCRBvPH+0lQ+PwMgS+iBqjSgJn+F5uZj7CRNWZiywTyOQ5iMdd+Sfj/NBvSPYIgKvmRYjVodNfqXV/VfKGgX9xjXvIEpyJyBEnwZ3jXThOmj2Sg/MwZwf5IjLHEZlbV53g63MlOOzUcA9NuTdxoKtiAcfEgRiFzeJR/nd3NUphSG0cf6it3WUP19wsLGBuQMe+vHD3NANqM4ysDiPU+K0HF+Mxvx9Dgate8GccjYsIujz3ZV0/QLabOl0zfcrBxRVipAvAJN/o7bXMtYshFvQi9Q6Z+e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(31686004)(4326008)(2616005)(186003)(6512007)(66556008)(66946007)(8676002)(41300700001)(53546011)(26005)(36756003)(66476007)(86362001)(31696002)(5660300002)(82960400001)(83380400001)(8936002)(6666004)(6486002)(6506007)(478600001)(316002)(30864003)(966005)(38100700002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WThBTFE0V2tZQnJqY1hLZHorVHBBSWJiNHZRMWZsVWVDWEU3WXIzUG84dnl2?=
 =?utf-8?B?K0h4UHlXSlFkRy9ES1JpRlFoUWpCcUJaV2tYcTk0ZmxkeTFGQ2xKdGJhVkVM?=
 =?utf-8?B?bDZsblhyWVNGRDJnZjE4UTh5b3dUZ3VhVzFySXFWOTFjZitsakdrb3N2djhU?=
 =?utf-8?B?N3dMbkxTd0Mva3FWK3hFNjdia0dLdU43dzc5ZTFXVmQxakd2TDN4WnU2bnBs?=
 =?utf-8?B?MWMvWk9CNzBlVUZuUkUrNXlEZ1RJV0x2VE9YSXoyallSTjhPNzlqY3BxRkVK?=
 =?utf-8?B?U3hRVU1wSjRQR2FjeDdMQU9GTmR2UURNWXFyZTdCUFZ0ekFBVWwvRmNJazFJ?=
 =?utf-8?B?VFFTOE80VkhINzVhaEhjQWRvcUVDcjNKS1FmaXhFS1RIWDJwWE9TWGNkUUZy?=
 =?utf-8?B?VWFsNDhXY2FEY0hGckQzOGhBZzczQis5OVRQZ1FUTmFMQ041aEc1eHpSRUtz?=
 =?utf-8?B?RHZZZ0UwZ0l0cDg1K1BZamlBU29JdFpINWtNendkZVJhdnR4KzRka0NPb05s?=
 =?utf-8?B?U1U4UTM0a2FzM1RrQVk1RURSRHQzREozZTRva0VhTzFoSXNDbzhTZ1dYL3VK?=
 =?utf-8?B?WkpxRk9ldmlHdExoMGhkYzBPaGd1UlVxaGNRUFBpcW5SWitKTTRZRnJWOS8r?=
 =?utf-8?B?RU9HVm8yWWM2K1haUGJpMm1sOVdTN1lrbkwzbWJJcGVUMnJtTTJUY0JIT0h4?=
 =?utf-8?B?V21SQTdiT25ITHY1MHViTjFUbDd0b2VOM2dEa0g5a25NYURUdjBBd3JOWUNF?=
 =?utf-8?B?dmpnLzRFbFFJTE9jSnNpRVJGMlZ2MFJSSEhPaFhuTi9GcjRBa2tETXFBN0lu?=
 =?utf-8?B?VlhZRldmTlJDeTlwS05XQm94OHhhRWZNUUp4Y0FSMStnS3JVYlpaWHFKSkhn?=
 =?utf-8?B?VFlFMGFxYU9xeEFxa2NqRVg4UWw0bHlZSHlFZlNWendqU2VYMncvcWhHZ0tT?=
 =?utf-8?B?ZFMxS0FDL210NlZRQ0prY0tCOEJNbHdtVTIyUlFLR1N3OERvQzhNVWxxUE92?=
 =?utf-8?B?VzI5SjFETUdNSGl6VFhBQkcvcmpIZjhJLzNGditMd0xMNlRScWdVcFNGRGw3?=
 =?utf-8?B?QzY0Z21hQW51NGVubVZ6anJGZmE3NEE1NTVDNURzODM5c0Rzd3lTUVM2T2JY?=
 =?utf-8?B?dzJURHNHNUtOTVdJMTFXZUNIRDlSMnZaeWFnNHlMa3NBNENneWxvaXlWc25I?=
 =?utf-8?B?d1JZUk4zcmVNQS9MUVNnOHprQW9maUhNZFpGbEtnQzZuZ2diZ1F6Zmh1eFJL?=
 =?utf-8?B?aEZCdXN2WGI3dTNYRmlqN0lNRW0zenBCYzdwRjJheDVHd0pGaDdmTUxpS013?=
 =?utf-8?B?QzBtVkJBZmtiZ1RqejlzYjRCUFNaT1JZSjh4em8xQjZXanBOODlVM3VKWGRG?=
 =?utf-8?B?cG9sL05QWkN4enhpaHBhZEhZZmxPalo0a3hmem81Rm80WHdGRURseGpoekUx?=
 =?utf-8?B?NFh0bkkwY0gxVHZ0a0ZhWXIrZ0gySDErU0NRYTU2TXZTQUVzS2k3VXp6bUl6?=
 =?utf-8?B?Qm90RXVJV0Z6TTBGV0tzN3lpdU91UGkra2lHQ0VmMVYyZWdadFB3ay9xWWtK?=
 =?utf-8?B?K2xPNlJJd0lxem9WU2c0QkY3NElySU53VVpRSi9PSGZJZVdOaTdodUlrb1hK?=
 =?utf-8?B?b1FiVDZIdFNvTSsxYUFvd0tFd2ZENGI4YktqVVhxUFFwVGJGOFoxbS9Od3ZF?=
 =?utf-8?B?UXhGN3d2d3BRWWlldEZyOEF6UzNvR0M1YSs2dzh0U24rMmt4VkV4Q3liWFRr?=
 =?utf-8?B?WHozOXYwYWhab1ZpS1VnYWVHakgxWWhqSEhBNit4a3VsQTZEOHVaUnN1MDVs?=
 =?utf-8?B?Rklmb3ZKK1U2enZmRTNScFNHZDRVTEdNMUduYTJsMWhwYnVHVDZkREpnK3lE?=
 =?utf-8?B?ditJazlidVZqdk5CN1crYmR4UmROS2prc08vSjBQRTUwU2JaSjBReEpHVkNo?=
 =?utf-8?B?SDhJb3lvQ1FLZElhb1pxZ2I0dDZxNXdPbWZYWXYxTXNZd1dWTUE1K0lJNkpS?=
 =?utf-8?B?SGJ5WlNmMjBjZGJsRkRIcDJaM0oxa1phaE9HT1NIWmZQZFVYSEIzMVdkN3pS?=
 =?utf-8?B?cVJLRU5sZ1RQVkhicGVaS0JqcGZ1SlorTG1HNjVpQjQ0dENHTU1wcjhJQWJW?=
 =?utf-8?B?S2NvaEpNeVJkVTNRYUNMa1pDV0JOSUZUWnlDVHdEUlpONm1ZSTgxY0lFdGZC?=
 =?utf-8?Q?LIfrJAF8E5sOatsGwIhI9UU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39248940-e72e-48d1-aa08-08daf9bc79eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 01:28:32.3345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1w39oTBmsO8Ko/3mq4EsfO72i6hvHRW580j6ueWVRewI8y3Havnu8JK8MH+KgFIE3LnXyK8Fc+7qcNy19IMeIAxffZM0lyPa+yp1xZW5cts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> Add helper functions into (new) common heci-packet-submission files
> to handle generating the MTL GSC-CS Memory-Header and emitting of
> the Heci-Cmd-Packet instructions that gets submitted to the engine.
>
> NOTE1: This common functions for heci-packet-submission will be used by
> different i915 callers:
>       1- GSC-SW-Proxy: This is pending upstream publication awaiting
>          a few remaining opens
>       2- MTL-HDCP: An equivalent patch has also been published at:
>          https://patchwork.freedesktop.org/series/111876/. (Patch 1)
>       3- PXP: This series.
>
> NOTE2: A difference in this patch vs what is appearing is in bullet 2
> above is that HDCP (and SW-Proxy) will be using priveleged submission
> (GGTT and common gsc-uc-context) while PXP will be using non-priveleged
> PPGTT, context and batch buffer. Therefore this patch will only slightly
> overlap with the MTL-HDCP patches despite have very similar function
> names (emit_foo vs emit_nonpriv_foo). This is because HECI_CMD_PKT
> instructions require very different flows and hw-specific code when done
> via PPGTT based submission (not different from other engines). MTL-HDCP
> contains the same intel_gsc_mtl_header_t structures as this but the
> helpers there are different. Both add the same new file names.
>
> NOTE3: Additional clarity about the heci-cmd-pkt layout and where the
>         common helpers come in:
>       - When an internal subsystem needs to send a command request
>         to the security firmware on MTL onwards, it will send that
>         via the GSC-engine-command-streamer.
>       - However those commands, (lets call them "gsc_specific_fw_api"
>         calls), are not understood by the GSC command streamer hw.
>       - The command streamer DOES understand GSC_HECI_CMD_PKT but
>         requires an additional header before the "gsc_specific_fw_api"
>         is sent by the hw engine to the firmware (with additional
>         metadata).

This is slightly incorrect. The GSC CS only looks at the 
GSC_HECI_CMD_PKT instruction. The extra header is also passed on the FW 
and it is part of the FW specific API. Basically the first header tells 
the FW generic info about the message and what type of command it is, 
while the second header is instead feature-specific (PXP, HDCP, proxy, etc).

>       - Thus, the structural layout of the request submitted would
>         need to look like the diagram below (for non-priv PXP).
>       - In the diagram, the common helper for HDCP, (GSC-Sw-Proxy) and
>         PXP (i.e. new function intel_gsc_uc_heci_cmd_emit_mtl_header)
>         will populate blob (C) while additional helpers different for
>         GGTT (not in this series) vs PPGTT (this patch) will populate
>         blobs (A) and (B) below.
>        ___________________________________________________________
>   (A)  |  MI_BATCH_BUFFER_START (ppgtt, batchbuff-addr, ...)     |
>        |     |                                                   |
>        |    _|________________________________________________   |
>        | (B)| GSC_HECI_CMD_PKT (pkt-addr-in, pkt-size-in,    |   |
>        |    |                   pkt-addr-out, pkt-size-out)  |--------
>        |    | MI_BATCH_BUFFER_END                            |   |   |
>        |    |________________________________________________|   |   |
>        |                                                         |   |
>        |_________________________________________________________|   |
>                                                                      |
>              ---------------------------------------------------------
>              |
>             \|/
>        ______V___________________________________________
>        |   _________________________________________    |
>        |(C)|                                       |    |
>        |   | struct intel_gsc_mtl_header {         |    |
>        |   |   validity marker                     |    |
>        |   |   heci_clent_id                       |    |
>        |   |   ...                                 |    |
>        |   |  }                                    |    |
>        |   |_______________________________________|    |
>        |(D)|                                       |    |
>        |   | struct gsc_fw_specific_api_foobar {   |    |
>        |   |     ...                               |    |
>        |   |     For an example, see               |    |
>        |   |     'struct pxp43_create_arb_in' at   |    |
>        |   |     intel_pxp_cmd_interface_43.h      |    |
>        |   |                                       |    |
>        |   | }                                     |    |
>        |   |  Struture depends on command type     |    |
>        |   | struct gsc_fw_specific_api_foobar {   |    |
>        |   |_______________________________________|    |
>        |________________________________________________|
>
> That said, this patch provides basic helpers but leaves the
> PXP subsystem (i.e. the caller) to handle everything else from
> input/output packet size verification to handling the
> responses from security firmware (such as requiring a retry).
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 107 ++++++++++++++++++
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  69 +++++++++++
>   4 files changed, 179 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index eae4325310e8..7dc18554da10 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -194,6 +194,7 @@ i915-y += \
>   i915-y += \
>   	  gt/uc/intel_gsc_fw.o \
>   	  gt/uc/intel_gsc_uc.o \
> +	  gt/uc/intel_gsc_uc_heci_cmd_submit.o \
>   	  gt/uc/intel_guc.o \
>   	  gt/uc/intel_guc_ads.o \
>   	  gt/uc/intel_guc_capture.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 2af1ae3831df..454179884801 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -439,6 +439,8 @@
>   #define GSC_FW_LOAD GSC_INSTR(1, 0, 2)
>   #define   HECI1_FW_LIMIT_VALID (1 << 31)
>   
> +#define GSC_HECI_CMD_PKT GSC_INSTR(0, 0, 6)
> +
>   /*
>    * Used to convert any address to canonical form.
>    * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> new file mode 100644
> index 000000000000..01bb7e587b1b
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +#include "i915_drv.h"
> +#include "i915_vma.h"
> +
> +#include "gt/intel_gpu_commands.h"
> +#include "gt/intel_context.h"
> +#include "gt/intel_gt.h"
> +#include "gt/intel_ring.h"
> +
> +#include "intel_gsc_fw.h"
> +#include "intel_gsc_uc.h"
> +#include "intel_gsc_uc_heci_cmd_submit.h"
> +
> +void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
> +					   u8 heci_client_id, u32 message_size,
> +					   u64 host_session_id)
> +{
> +	host_session_id &= ~GSC_HECI_HOST_SESSION_USAGE_MASK;
> +	if (heci_client_id == GSC_HECI_MEADDRESS_PXP)
> +		host_session_id |= GSC_HECI_SESSION_PXP_SINGLE;
> +
> +	header->validity_marker = GSC_HECI_VALIDITY_MARKER;
> +	header->heci_client_id = heci_client_id;
> +	header->host_session_handle = host_session_id;
> +	header->header_version = MTL_GSC_HECI_HEADER_VERSION;
> +	header->message_size = message_size;
> +}
> +
> +static void
> +emit_gsc_heci_pkt_nonpriv(u32 *cs, struct intel_gsc_heci_non_priv_pkt *pkt)
> +{
> +	*cs++ = GSC_HECI_CMD_PKT;
> +	*cs++ = lower_32_bits(pkt->addr_in);
> +	*cs++ = upper_32_bits(pkt->addr_in);
> +	*cs++ = pkt->size_in;
> +	*cs++ = lower_32_bits(pkt->addr_out);
> +	*cs++ = upper_32_bits(pkt->addr_out);
> +	*cs++ = pkt->size_out;
> +	*cs++ = 0;
> +	*cs++ = MI_BATCH_BUFFER_END;
> +}
> +
> +int
> +intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
> +				     struct intel_context *ce,
> +				     struct intel_gsc_heci_non_priv_pkt *pkt,
> +				     u32 *cs, int timeout_ms)

"cs" is usually used for when we write directly in the ring. Maybe use 
"cmd" instead? not a blocker

> +{
> +	struct intel_engine_cs *eng;
> +	struct i915_request *rq;
> +	int err;
> +
> +	rq = intel_context_create_request(ce);
> +	if (IS_ERR(rq))
> +		return PTR_ERR(rq);
> +
> +	emit_gsc_heci_pkt_nonpriv(cs, pkt);
> +
> +	i915_vma_lock(pkt->bb_vma);
> +	err = i915_vma_move_to_active(pkt->bb_vma, rq, EXEC_OBJECT_WRITE);
> +	i915_vma_unlock(pkt->bb_vma);
> +
> +	if (!err) {
> +		i915_vma_lock(pkt->heci_pkt_vma);
> +		err = i915_vma_move_to_active(pkt->heci_pkt_vma, rq, EXEC_OBJECT_WRITE);
> +		i915_vma_unlock(pkt->heci_pkt_vma);
> +	}
> +
> +	eng = rq->context->engine;
> +	if (!err && eng->emit_init_breadcrumb)
> +		err = eng->emit_init_breadcrumb(rq);
> +
> +	if (!err)
> +		err = eng->emit_bb_start(rq, i915_vma_offset(pkt->bb_vma), PAGE_SIZE, 0);
> +
> +	if (err) {
> +		i915_request_add(rq);

You're missing a i915_request_set_error_once here. I suggest using a 
goto and running the same code for the request_add in both the passing 
and failure cases, like what we do for the pxp session termination 
submission.

> +		return err;
> +	}
> +
> +	i915_request_get(rq);
> +
> +	i915_request_add(rq);
> +	if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
> +			      msecs_to_jiffies(timeout_ms)) < 0) {
> +		i915_request_put(rq);
> +		return -ETIME;
> +	}
> +
> +	i915_request_put(rq);
> +
> +	err = ce->engine->emit_flush(rq, 0);
> +	if (err)
> +		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
> +			"Failed emit-flush for gsc-heci-non-priv-pkterr=%d\n", err);
> +
> +	if (unlikely(err))
> +		i915_request_set_error_once(rq, err);

the emit_flush and the set_error must be done before the request_add.

> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> new file mode 100644
> index 000000000000..23155bed3fee
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GSC_UC_HECI_CMD_H_
> +#define _INTEL_GSC_UC_HECI_CMD_H_
> +
> +#include <linux/types.h>
> +
> +struct i915_vma;
> +struct intel_context;
> +struct intel_gsc_uc;
> +
> +struct intel_gsc_mtl_header {
> +	u32 validity_marker;
> +#define GSC_HECI_VALIDITY_MARKER 0xA578875A
> +
> +	u8 heci_client_id;
> +#define GSC_HECI_MEADDRESS_PXP 17
> +#define GSC_HECI_MEADDRESS_HDCP 18
> +
> +	u8 reserved1;
> +
> +	u16 header_version;
> +#define MTL_GSC_HECI_HEADER_VERSION 1
> +
> +	u64 host_session_handle;
> +#define GSC_HECI_HOST_SESSION_USAGE_MASK REG_GENMASK64(63, 60)
> +#define GSC_HECI_SESSION_PXP_SINGLE BIT_ULL(60)

Are those in the specs anywhere? Otherwise, if they're i915-defined, can 
you add an explanation on how they're defined?

Daniele

> +
> +	u64 gsc_message_handle;
> +
> +	u32 message_size; /* lower 20 bits only, upper 12 are reserved */
> +
> +	/*
> +	 * Flags mask:
> +	 * Bit 0: Pending
> +	 * Bit 1: Session Cleanup;
> +	 * Bits 2-15: Flags
> +	 * Bits 16-31: Extension Size
> +	 */
> +	u32 flags;
> +#define GSC_HECI_FLAG_MSG_PENDING	BIT(0)
> +#define GSC_HECI_FLAG_MSG_CLEANUP	BIT(1)
> +
> +	u32 status;
> +} __packed;
> +
> +struct intel_gsc_heci_non_priv_pkt {
> +	u64 addr_in;
> +	u32 size_in;
> +	u64 addr_out;
> +	u32 size_out;
> +	struct i915_vma *heci_pkt_vma;
> +	struct i915_vma *bb_vma;
> +};
> +
> +void
> +intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
> +				      u8 heci_client_id, u32 msg_size,
> +				      u64 host_session_id);
> +
> +int
> +intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
> +				     struct intel_context *ce,
> +				     struct intel_gsc_heci_non_priv_pkt *pkt,
> +				     u32 *cs, int timeout_ms);
> +#endif

