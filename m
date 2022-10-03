Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1165F3642
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 21:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FC810E4B9;
	Mon,  3 Oct 2022 19:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB7310E4B8;
 Mon,  3 Oct 2022 19:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFMpotbArjlt993kuxuFjNwuNrRTxhVL+g/x0EBKhM38+/OUrK4c88ykFK1WqYvQIrRBIa5Xj6pFdFVEzSXTdUbl8ET+YL1L4BZSJhnylsvweV422FGN1EkQyHrqYuRbotM3F3ffGYj9t50oTHCFMGgJSfot57+VegzDiemgkdfQcx2PCUPKVnZKtv/E85H2LEyiuRktCfFlVV7KVgYU5co/yKggBzfKiyBDJgSPF0karDJjw68meQo1V+u0004eNU7cfduZDB1++hgHfK6hGNydh4SNEdK/pTlGjWbZ9gdIp7jNG9dMKk2s040b7cvRn65hWcW5MYZNA9flI6iPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/afhisTO0PkXN6W1TijFmeM2+D6BnBxNpOvklgpLKJc=;
 b=VFcUnY+2z1NwvEJ6uveUTrrAQV7B1mA6j7tS1yOpNqqLMD0wUu16hMNBebXaWGB2KJW2pG57kbNtpj3bCm0AN9V4QAiQIkFA0Xkt77xpq/1+SSyUmcgDedUOcPB3GzdIzwbNR08pIVzoLnaaeELLV94aP8x+/HuE+1GlpWOveCg9TmeId3TEmI9nylUGQ8f8PhExyYGq6uU9lBJnt6TmUt+x8Yiintwrtv430/U1b+C/54tadRUd+yxvi0XeY+VvjSL9uhSsDzCzgupXe7mLvwOvs2s+8Omlp2xIVUeJgEYnna3lwKDo3ltFRFw4QoDyAkemgdUJbTbZzcTayordyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/afhisTO0PkXN6W1TijFmeM2+D6BnBxNpOvklgpLKJc=;
 b=GmLcEq631HN1fUPdLRypwiyKdP+rMcVK66hvpg+Iu+YZtLjCM6LnGRdkzOfO2EIfDOpLyLls1o1/RnSDZfAB6E/uLby5vXd6DsR0AuRiLZcbDweuWxISqxMdUEs4YlXqRVo+WB70p5j7hTD1DM8xB7z5grIg1vF0Yff/4j5Xwcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BN9PR12MB5099.namprd12.prod.outlook.com (2603:10b6:408:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 19:25:15 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 19:25:15 +0000
Message-ID: <0d0068aa-38b5-b258-36a6-98e10da9e8c4@amd.com>
Date: Mon, 3 Oct 2022 15:25:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm: amd: clean up dcn32_fpu.c kernel-doc
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221001043354.22608-1-rdunlap@infradead.org>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221001043354.22608-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:610:76::16) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|BN9PR12MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 352d85f5-2222-4dc4-015e-08daa574fff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKX0eB66DM80tHL39DcqeyRCbN288WiN/o2UCWHUGhl4kfRDyp0S3097KF2iaFFIg4Yi9R90TZYK/eTZr9PUTGxrnmZ5atLPyjGAn4PRfAUWE13nqEjAfkRtob0Put/gJLLULr5r/DefvJD50JaC4hZXAdrNqci6a7zfbaLX5QHa8Ali2pwijTFRKouIx+lki82y6ztsx4O3eSSBSTVvXkpZzYPm1NgItF22uhK8rdvuY5Xb5ZYh+QqyNSc/xnQlWzpVlxm+3ywDJYl8xx8RRO/F0SWWZaawnxGtYLGAnWf6lP4zV8nLU78TkEDatpWvDWGBgwENx+ovEARl5GqMtjzTGgv6bHiodMNN33gX6hOq54gOgsko9yXdQlMo9XlDtcL86JgOgRAj9N2BGHGsauxnK7dTagut7hbQUvCSwfegqPc42JxP7cgRzvLJDmX9sk3ZLwrmfG7s/jlz/ILUkDHOPlNbwlkUSMBmhd2gcpTdIdtHJrDr5Pn76z83tMH9Q5ondnF3lLyvIAgP/JN20MD2JZEh+aStqidQ+EBZX2TYZC6kMqStWcFmSp+QcIAz/etTIqGZp7pFRZCPbRBjtWS+BNAAvvU1jyCp1JkI8bo3APXvm9blTOrh3Y9l+xrJXq1IADuE6aJNE92Krjwq4fqQHDXcMJZ5MKhEptCHy2j6QaSu2/uXuIDRwa85eBhUcRTe5NBeFgF4NgqjedW+DySQ8d9HfR37LZ/G6ppTg/V+vk2O9e5rJ41RjXOSnZYYtzHKcyf2zL6Hwd5F4hoSYbOpyML6qQTefHP3NgYuwxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199015)(66946007)(66556008)(4326008)(8676002)(66476007)(66574015)(36756003)(316002)(6506007)(26005)(6512007)(53546011)(54906003)(2616005)(186003)(2906002)(5660300002)(8936002)(30864003)(38100700002)(41300700001)(31696002)(86362001)(83380400001)(31686004)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1VDUk0vNUsrS2twTnFHbm9KNXBLbFlLRnZHRlJVbXpUemZaQVhPdCtIRjR5?=
 =?utf-8?B?Rldwa210U0owcCszekU2ZzBPNCtzeHJkUG41ckdlZGs1TitWSlNpWFFSOGNl?=
 =?utf-8?B?MDQ2aFNoSE9uY1pycHQ1cUtEQ2d0MWtPTFRHVHVGcDhKbktnT2tZZjIxbFRG?=
 =?utf-8?B?UDBwQ09YbEQ4MmgxYmtZSXFkbDh5UEdPeDZlRnZabEVwekxxaGNYTjlhREY5?=
 =?utf-8?B?OSt6NEdmcTF2Uk4vQndxS1VmYXpsbTRiNEpFanR0OUc0OHhCeER3eUY4K3BF?=
 =?utf-8?B?Y3A5anROaUNZQjZhb0FlTHZlNHVxTUo0SkExR1J6RENMZ0Y1WjVydC9BMnhM?=
 =?utf-8?B?QzFwT1hSRkF0d3FuNzVJdGxtakR3ZXpnRHFGRzNsdlNDYkhnVDZKL3BmNVNK?=
 =?utf-8?B?Wi9iQno5Q3hwbHg5c052SWJINnc5azB5WDZreWZrNmN3NExZenZ0aDJuVTJO?=
 =?utf-8?B?Zys4SStqdG41cHE3QnV4M1JSallZSW9ZZGg2ak1XTW1aYklRekxQL056b3U4?=
 =?utf-8?B?ZHFRaXB2WTE5bzVVOUJwUGtIQ1YzakVNWlZzS29ySnd5c0VUaU0raVRTVlpP?=
 =?utf-8?B?RWZNaW1JWkNVWWhFZ3VIbmpkSmh4RDVTWUZsaHNOeVQxWklrcTJON3p5bXhS?=
 =?utf-8?B?Sm5YdDkveHZMY2w0T05OeHBQT0dCcjNKWFYzdG9pakw3WTVlL0dyVHNSSlVG?=
 =?utf-8?B?Zzg3NHFINnlzc0QrYjMrKzZwZmwyTXRpYWE0eUNvbnQyUC9QSW1KRmRHTHE0?=
 =?utf-8?B?TjhvNDZFbEwwaDJ3aHo5cXI5L3B0VlNYYjhBZ3p4WmZOL3JYcStRT0VyRlor?=
 =?utf-8?B?UEQrUlNSbG1Uc0NIZDVjelZNWHR2bCtOSUNkLzNKMmwrK204VnF2RUVZeG9v?=
 =?utf-8?B?c1ViNFZST0tNU09KTUhvYmlEWjV6Y09YVDlWN0FuRUxISEZybmFNdGR4UEM2?=
 =?utf-8?B?b2RnNmE0dGlOeGxIVUhmbk16VzUydGJScnkvbGkwVmFSeWsrMjBOeVZWcm5s?=
 =?utf-8?B?a0JPSCtod05WUFROT28vdUZxNXZXNnA4VXduMmRpemVIRnIwTUFkMzNmU3dJ?=
 =?utf-8?B?TTB1U2llRzQ0UUs0SjJQakNGK2lxSGNHUGxPNTVoSW51QzlkSjVsQm51WTZz?=
 =?utf-8?B?QXdJMGt4eCtSVVVDZmh6NmxJYTBhdDJSVk9NU28yYWp3VTBZMmhJUWFONExN?=
 =?utf-8?B?ekRpUTZXME5TME9DN1lCcDQ1Rm52TUNyUU9QYTNCQUlEY2ZCUzY4WEFDL1BI?=
 =?utf-8?B?bGZjQ2pLdXlaTXEyWFB6aXB6MmUxTWNHUWUxRFArdXZlRkdJeGJjSTh4MDdH?=
 =?utf-8?B?Z0dOUy95UkVxTUdrVXpFQkZUSTVhMTVsRVc5VFUzVFk5aExtaC9aWTlpem50?=
 =?utf-8?B?Uy9IYnVtd3FMNHZKM3JUaEIrbU9ITWNlNlg4SmpzaHJpa2s4Nk96VjdxQUhO?=
 =?utf-8?B?blFUSGdVb1k2bjZGcGhXYnJBM0lkMGNKVkV4NWJrYVBnUXVKWTllY3UrZWVJ?=
 =?utf-8?B?OEV1aXZrTUxmMCtLVzIyMUE0NXBiQUlWVDB1em9UV3Vpb00vR1VzR2tMUEVC?=
 =?utf-8?B?eGJIOS9PMFg3V0NmUFZCZWJDSW9uaTFGYkQ0NS9ieHVaU2RoanViT0NleTI3?=
 =?utf-8?B?MU5MMG84dUgrRU1GK3NvQTNDR053UXp1ampoU3dYRFhzSitpMElCN1dMZSt4?=
 =?utf-8?B?Qi9GU21DdjVteUNnNEVCeEtsVG02eDEweDVyQUR6dlk0SlMxd1owSEI3WHFD?=
 =?utf-8?B?bTdvc2V1cjZITWpIZ3c0eFZaVk0vTVdaRVNLR2xGalV0dE8xR2xPdDc1U0k2?=
 =?utf-8?B?MUF3cUs0aWVhZ2ZRS3kwUHR5TnVBdVh6ZVowOTkwckR5SExzOWphb0w5cE5x?=
 =?utf-8?B?MEVJN2d0ZjlwZUJKUDVJMG9YcmxzdFZIQU11STJtUk1oclp1MWI5YzAxNDFH?=
 =?utf-8?B?TEZLMVZSVncyanpYTjRlVDdpMEM5dC9kNjdxemY1M2dNZE5zUGJSeGZDVjFp?=
 =?utf-8?B?V25UbzNnZTNaOXdTem9hY1BDMlhpdGYwL2xIMklnYmlvQW9sbGdvWkpZYWRn?=
 =?utf-8?B?a3VJU2tLWTNleUNGNk5IWkd0NGVpUnU0T3p5cGFWc2JWQUJTTWJMeDgrbVFO?=
 =?utf-8?Q?nEgrr+7c5edo09IXijSsdx28n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352d85f5-2222-4dc4-015e-08daa574fff1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 19:25:15.6839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1DsM1kOmGc689IKapZdN2adgLtWEbUKk3DyVsvONYyCbAspZUkS/AAHTyEc+Q8cWfqMfVzBQ4CaPWnMW3po8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5099
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, Nevenko Stupar <Nevenko.Stupar@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, George Shen <george.shen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-01 00:33, Randy Dunlap wrote:
> Rectify multiple kernel-doc warnings in dcn32_fpu.c.
> E.g.:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:247: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>      * Finds dummy_latency_index when MCLK switching using firmware based
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:484: warning: Function parameter or member 'phantom_stream' not described in 'dcn32_set_phantom_stream_timing'
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:601: warning: Function parameter or member 'dc' not described in 'dcn32_assign_subvp_pipe'
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:601: warning: Function parameter or member 'context' not described in 'dcn32_assign_subvp_pipe'
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:601: warning: Function parameter or member 'index' not described in 'dcn32_assign_subvp_pipe'
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2140: warning: Function parameter or member 'dc' not described in 'dcn32_update_bw_bounding_box_fpu'
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2140: warning: Function parameter or member 'bw_params' not described in 'dcn32_update_bw_bounding_box_fpu'
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2140: warning: expecting prototype for dcn32_update_bw_bounding_box(). Prototype was for dcn32_update_bw_bounding_box_fpu() instead
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: George Shen <george.shen@amd.com>
> Cc: Alvin Lee <alvin.lee2@amd.com>
> Cc: Nevenko Stupar <Nevenko.Stupar@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c |  116 ++++------
>   1 file changed, 49 insertions(+), 67 deletions(-)
> 
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> @@ -243,7 +243,7 @@ void dcn32_build_wm_range_table_fpu(stru
>   	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
>   }
>   
> -/**
> +/*
>    * Finds dummy_latency_index when MCLK switching using firmware based
>    * vblank stretch is enabled. This function will iterate through the
>    * table of dummy pstate latencies until the lowest value that allows
> @@ -290,15 +290,14 @@ int dcn32_find_dummy_latency_index_for_f
>   /**
>    * dcn32_helper_populate_phantom_dlg_params - Get DLG params for phantom pipes
>    * and populate pipe_ctx with those params.
> - *
> - * This function must be called AFTER the phantom pipes are added to context
> - * and run through DML (so that the DLG params for the phantom pipes can be
> - * populated), and BEFORE we program the timing for the phantom pipes.
> - *
>    * @dc: [in] current dc state
>    * @context: [in] new dc state
>    * @pipes: [in] DML pipe params array
>    * @pipe_cnt: [in] DML pipe count
> + *
> + * This function must be called AFTER the phantom pipes are added to context
> + * and run through DML (so that the DLG params for the phantom pipes can be
> + * populated), and BEFORE we program the timing for the phantom pipes.
>    */
>   void dcn32_helper_populate_phantom_dlg_params(struct dc *dc,
>   					      struct dc_state *context,
> @@ -331,8 +330,9 @@ void dcn32_helper_populate_phantom_dlg_p
>   }
>   
>   /**
> - * *******************************************************************************************
> - * dcn32_predict_pipe_split: Predict if pipe split will occur for a given DML pipe
> + * dcn32_predict_pipe_split - Predict if pipe split will occur for a given DML pipe
> + * @context: [in] New DC state to be programmed
> + * @pipe_e2e: [in] DML pipe end to end context
>    *
>    * This function takes in a DML pipe (pipe_e2e) and predicts if pipe split is required (both
>    * ODM and MPC). For pipe split, ODM combine is determined by the ODM mode, and MPC combine is
> @@ -343,12 +343,7 @@ void dcn32_helper_populate_phantom_dlg_p
>    * - MPC combine is only chosen if there is no ODM combine requirements / policy in place, and
>    *   MPC is required
>    *
> - * @param [in]: context: New DC state to be programmed
> - * @param [in]: pipe_e2e: DML pipe end to end context
> - *
> - * @return: Number of splits expected (1 for 2:1 split, 3 for 4:1 split, 0 for no splits).
> - *
> - * *******************************************************************************************
> + * Return: Number of splits expected (1 for 2:1 split, 3 for 4:1 split, 0 for no splits).
>    */
>   uint8_t dcn32_predict_pipe_split(struct dc_state *context,
>   				  display_e2e_pipe_params_st *pipe_e2e)
> @@ -504,7 +499,14 @@ void insert_entry_into_table_sorted(stru
>   }
>   
>   /**
> - * dcn32_set_phantom_stream_timing: Set timing params for the phantom stream
> + * dcn32_set_phantom_stream_timing - Set timing params for the phantom stream
> + * @dc: current dc state
> + * @context: new dc state
> + * @ref_pipe: Main pipe for the phantom stream
> + * @phantom_stream: target phantom stream state
> + * @pipes: DML pipe params
> + * @pipe_cnt: number of DML pipes
> + * @dc_pipe_idx: DC pipe index for the main pipe (i.e. ref_pipe)
>    *
>    * Set timing params of the phantom stream based on calculated output from DML.
>    * This function first gets the DML pipe index using the DC pipe index, then
> @@ -517,13 +519,6 @@ void insert_entry_into_table_sorted(stru
>    * that separately.
>    *
>    * - Set phantom backporch = vstartup of main pipe
> - *
> - * @dc: current dc state
> - * @context: new dc state
> - * @ref_pipe: Main pipe for the phantom stream
> - * @pipes: DML pipe params
> - * @pipe_cnt: number of DML pipes
> - * @dc_pipe_idx: DC pipe index for the main pipe (i.e. ref_pipe)
>    */
>   void dcn32_set_phantom_stream_timing(struct dc *dc,
>   				     struct dc_state *context,
> @@ -592,16 +587,14 @@ void dcn32_set_phantom_stream_timing(str
>   }
>   
>   /**
> - * dcn32_get_num_free_pipes: Calculate number of free pipes
> + * dcn32_get_num_free_pipes - Calculate number of free pipes
> + * @dc: current dc state
> + * @context: new dc state
>    *
>    * This function assumes that a "used" pipe is a pipe that has
>    * both a stream and a plane assigned to it.
>    *
> - * @dc: current dc state
> - * @context: new dc state
> - *
> - * Return:
> - * Number of free pipes available in the context
> + * Return: Number of free pipes available in the context
>    */
>   static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *context)
>   {
> @@ -625,7 +618,10 @@ static unsigned int dcn32_get_num_free_p
>   }
>   
>   /**
> - * dcn32_assign_subvp_pipe: Function to decide which pipe will use Sub-VP.
> + * dcn32_assign_subvp_pipe - Function to decide which pipe will use Sub-VP.
> + * @dc: current dc state
> + * @context: new dc state
> + * @index: [out] dc pipe index for the pipe chosen to have phantom pipes assigned
>    *
>    * We enter this function if we are Sub-VP capable (i.e. enough pipes available)
>    * and regular P-State switching (i.e. VACTIVE/VBLANK) is not supported, or if
> @@ -639,12 +635,7 @@ static unsigned int dcn32_get_num_free_p
>    * for determining which should be the SubVP pipe (need a way to determine if a pipe / plane doesn't
>    * support MCLK switching naturally [i.e. ACTIVE or VBLANK]).
>    *
> - * @param dc: current dc state
> - * @param context: new dc state
> - * @param index: [out] dc pipe index for the pipe chosen to have phantom pipes assigned
> - *
> - * Return:
> - * True if a valid pipe assignment was found for Sub-VP. Otherwise false.
> + * Return: True if a valid pipe assignment was found for Sub-VP. Otherwise false.
>    */
>   static bool dcn32_assign_subvp_pipe(struct dc *dc,
>   				    struct dc_state *context,
> @@ -711,7 +702,9 @@ static bool dcn32_assign_subvp_pipe(stru
>   }
>   
>   /**
> - * dcn32_enough_pipes_for_subvp: Function to check if there are "enough" pipes for SubVP.
> + * dcn32_enough_pipes_for_subvp - Function to check if there are "enough" pipes for SubVP.
> + * @dc: current dc state
> + * @context: new dc state
>    *
>    * This function returns true if there are enough free pipes
>    * to create the required phantom pipes for any given stream
> @@ -723,9 +716,6 @@ static bool dcn32_assign_subvp_pipe(stru
>    * pipe which can be used as the phantom pipe for the non pipe
>    * split pipe.
>    *
> - * @dc: current dc state
> - * @context: new dc state
> - *
>    * Return:
>    * True if there are enough free pipes to assign phantom pipes to at least one
>    * stream that does not already have phantom pipes assigned. Otherwise false.
> @@ -764,7 +754,9 @@ static bool dcn32_enough_pipes_for_subvp
>   }
>   
>   /**
> - * subvp_subvp_schedulable: Determine if SubVP + SubVP config is schedulable
> + * subvp_subvp_schedulable - Determine if SubVP + SubVP config is schedulable
> + * @dc: current dc state
> + * @context: new dc state
>    *
>    * High level algorithm:
>    * 1. Find longest microschedule length (in us) between the two SubVP pipes
> @@ -772,11 +764,7 @@ static bool dcn32_enough_pipes_for_subvp
>    * pipes still allows for the maximum microschedule to fit in the active
>    * region for both pipes.
>    *
> - * @dc: current dc state
> - * @context: new dc state
> - *
> - * Return:
> - * bool - True if the SubVP + SubVP config is schedulable, false otherwise
> + * Return: True if the SubVP + SubVP config is schedulable, false otherwise
>    */
>   static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
>   {
> @@ -836,7 +824,10 @@ static bool subvp_subvp_schedulable(stru
>   }
>   
>   /**
> - * subvp_drr_schedulable: Determine if SubVP + DRR config is schedulable
> + * subvp_drr_schedulable - Determine if SubVP + DRR config is schedulable
> + * @dc: current dc state
> + * @context: new dc state
> + * @drr_pipe: DRR pipe_ctx for the SubVP + DRR config
>    *
>    * High level algorithm:
>    * 1. Get timing for SubVP pipe, phantom pipe, and DRR pipe
> @@ -845,12 +836,7 @@ static bool subvp_subvp_schedulable(stru
>    * 3.If (SubVP Active - Prefetch > Stretched DRR frame + max(MALL region, Stretched DRR frame))
>    * then report the configuration as supported
>    *
> - * @dc: current dc state
> - * @context: new dc state
> - * @drr_pipe: DRR pipe_ctx for the SubVP + DRR config
> - *
> - * Return:
> - * bool - True if the SubVP + DRR config is schedulable, false otherwise
> + * Return: True if the SubVP + DRR config is schedulable, false otherwise
>    */
>   static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struct pipe_ctx *drr_pipe)
>   {
> @@ -914,7 +900,9 @@ static bool subvp_drr_schedulable(struct
>   
>   
>   /**
> - * subvp_vblank_schedulable: Determine if SubVP + VBLANK config is schedulable
> + * subvp_vblank_schedulable - Determine if SubVP + VBLANK config is schedulable
> + * @dc: current dc state
> + * @context: new dc state
>    *
>    * High level algorithm:
>    * 1. Get timing for SubVP pipe, phantom pipe, and VBLANK pipe
> @@ -922,11 +910,7 @@ static bool subvp_drr_schedulable(struct
>    * then report the configuration as supported
>    * 3. If the VBLANK display is DRR, then take the DRR static schedulability path
>    *
> - * @dc: current dc state
> - * @context: new dc state
> - *
> - * Return:
> - * bool - True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
> + * Return: True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
>    */
>   static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
>   {
> @@ -1003,20 +987,18 @@ static bool subvp_vblank_schedulable(str
>   }
>   
>   /**
> - * subvp_validate_static_schedulability: Check which SubVP case is calculated and handle
> - * static analysis based on the case.
> + * subvp_validate_static_schedulability - Check which SubVP case is calculated
> + * and handle static analysis based on the case.
> + * @dc: current dc state
> + * @context: new dc state
> + * @vlevel: Voltage level calculated by DML
>    *
>    * Three cases:
>    * 1. SubVP + SubVP
>    * 2. SubVP + VBLANK (DRR checked internally)
>    * 3. SubVP + VACTIVE (currently unsupported)
>    *
> - * @dc: current dc state
> - * @context: new dc state
> - * @vlevel: Voltage level calculated by DML
> - *
> - * Return:
> - * bool - True if statically schedulable, false otherwise
> + * Return: True if statically schedulable, false otherwise
>    */
>   static bool subvp_validate_static_schedulability(struct dc *dc,
>   				struct dc_state *context,
> @@ -2275,7 +2257,7 @@ static int build_synthetic_soc_states(st
>   	return 0;
>   }
>   
> -/**
> +/*
>    * dcn32_update_bw_bounding_box
>    *
>    * This would override some dcn3_2 ip_or_soc initial parameters hardcoded from

First of all, thanks a lot for your patch! It lgtm.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

I already applied it to amd-staging-drm-next.

P.s.: I made a tiny change in the commit title when I merged it.

Thanks
Siqueira

