Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C787E4C526C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 01:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060DD10E2A9;
	Sat, 26 Feb 2022 00:12:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B23610E2A5;
 Sat, 26 Feb 2022 00:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645834339; x=1677370339;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cJalDDMg+9gl54H0rtm+EfSbkLbf8PKSmi//xGEcl7g=;
 b=B+0mL/1Y9Wjy/CIzlAPC/O+cuLLYA2buZGMrxd9oWcWlG7ShYXC6Upu0
 ylGKPDjhOgCIcy8RtKs93hZcXKJUlTNb9f+BqpWO8MBhBfMnXAo/fXRWx
 fVt3v72PRVZLqSdn0Fq6AL6jcQVBfFSXRMiL0Se6ohnyHTTb/F6gPM/hj
 t5+JDKo/h4KzrfpAogESWLMnlhG6H53Z5OC/TDgztAnGSuV2FoBYJbvt3
 yL9676EU/9HqLbjFk2X47drAM1cmWZrjKFfnTR1J8iylO4dqFF31f8HUp
 bZUyC7/dAZD1WnOBcxGF85Qc/O5As077U2cmcnrlZyijyTeJCh81ILx1d w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="232579922"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="232579922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 16:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="684809681"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2022 16:12:16 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 16:12:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 16:12:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 16:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNdbdOJKNDD5Jhc4Ozv0cYycOmh9dq4xQE5VQxtGef/xELTop8m+i8NW0+7Y3c7/QoJE6KO1OZ4PEl2nsW045roEse0jR/TUm2z5Et1vSIdzg2SX/rxVcXIECkIPr2L6pC1rhv4u2tnr1PQy7QReKwa2bdTAzgzRvZ1q4rJVoKAbVNjx/dREI6mQrHAuxioH8x+rBwE5EqJM7/SeXNHnwhNWvktTA3bHVnuLq1oZ4j9t/17NAb/XStKqf43smRpcNajmWePBtvi59Uo09OHR3XNDKRllaFeoPhFM8kTp6dLE+YxITmArG4Skw7CJxM4zJYyd5vYjsg8iWMV5du2tMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw899T8xgbCsFEMsVGolzYNtpuH8DxPZ1G7X9hRjJa0=;
 b=jeT6UbUyRY1he3A9+Q1dhmzZyr0E26ouJXb2FYbM3oxFGetd3q31eET4tvAznrc783SIL6+KiKRvfEyB5MZfKgxltxl01rLSSP0s4S1fsr+hieA+Oa6iRq4UE5LJKug6MUUQ+qNBmytEs4XEZZAsn96J4A3LoegXUfz5fnv9+dANtKsDjT2q8L7wiwh+NaL1Bg8M4pItKfraYgOnVxrmPURTPvIJ64c+XvD1Bx8wUcwxhnjcA/3HRLICV3G6uq4n35MVhcnTDNmQtu+dpkNKtcZJHspSRkc5VgZrk0bPJvQNkhm6NMPo3HcxJENawXnWtcsQHqZVL9ej1LDs9DILeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY4PR11MB1608.namprd11.prod.outlook.com (2603:10b6:910:e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Sat, 26 Feb 2022 00:12:13 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 00:12:13 +0000
Message-ID: <a749d47c-f8fc-2a45-d660-0034b9ab178b@intel.com>
Date: Fri, 25 Feb 2022 16:12:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH v2 5/8] drm/i915/guc: Move lrc desc setup to
 where it is needed
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
 <20220225000623.1934438-6-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220225000623.1934438-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a6c533-ced0-4d9b-8ddf-08d9f8bca3d4
X-MS-TrafficTypeDiagnostic: CY4PR11MB1608:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB160821DEBE2437EABA64BDA8F43F9@CY4PR11MB1608.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kxxraNql4g2ZXheLdB/R/2riXzYzgZoRlKuZXYyi1rnnzTs0VrBfZcJd7G4QKwTs8i9m78cAWiONdeYre2RPL7Lvriy+IMXJTZvFC+irOsBd0wNL53y3JQhUNyBA+yR/FyxhJSRoDD7BTllLadA/9DPNoQLS2L+n9yFHqWMgaRXXkdO6lEYPv6BKCQ3KqUIyqQuhP1kk6bmlFZ57b4MFh8pdSMrBlArhHJmQZljB2x9lC0pV+6f19htbNg+Tf5WaTqAawjqFGNUIglNiTGw2eCGbsEUhG7v+hZ1VdkwpZ3Ns5UpRdcdT8W5oPok1YMleYkdojC5ghkTMmno+ol4HYPUneO/yS1dCfawlLS/3vALzCy5tasXG3H9B1XxF49mDcK9ldLKMmrE9W8XvrmtZj81EaK2wiSmoPNG6ZUSSRScqCBdJmPqHyB1yrUMceI7LyafEYm4y/KCGPKA42CUii4L6HBcO5cEucLf635r81sRnxaq92FVLe6kPomwq+x/EQ6QFiHI7m0qTK4eZXB/2wmDIg+64zZ8PL7yI4c/XHk8UshMb1uNOoebHBLDYCib3gm/nN0J9nzMoSgr36WiAECYNj/bk1jD16HWXvh7/u51HOoPd0Y2bPP6CTxzUqtoOLTt/uw1/EJl+9V3HmETATqF/+eIVNejurdZv7ZkGpz8tR9cmATgHN+61qaUJa/NB+6X5XCu4mp5b1dd4qrIHf/t15QC4XWShwQbHoFsjsJLXsbAQ5kd1E3Y6dfM8FQTb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(6512007)(6486002)(6506007)(31696002)(82960400001)(38100700002)(26005)(316002)(36756003)(83380400001)(31686004)(186003)(2616005)(450100002)(8676002)(4326008)(86362001)(53546011)(508600001)(8936002)(66476007)(66556008)(66946007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V091TjRkMENoQ1phTjNZaEowU3NLRXBCUmp1Rkh1QUIxb0dFOEY1d2IvdHBC?=
 =?utf-8?B?bTVsdFlENzBOZnJldTV6cmlzNUR5MnhXbW1zN3YvTDdpYlVLK1ZnOG9zVzh0?=
 =?utf-8?B?Wlg5WEx1MENtYlc3cXNoUzZ3cUdDMldIOTFlTm9yREN5NHIzcjhCUkNJK1Jp?=
 =?utf-8?B?ZTRoYVI4dlE4NlBrdmdveTZXQks3ZEVRVUFtZ3VGd3NjbHYrSXgzV3lHWG41?=
 =?utf-8?B?S1dHdnJJM3lneFF6cldRQjNWSHAwZVJKNHppNGhZV3BBTnUwYnpaMUVKcnRQ?=
 =?utf-8?B?a3U5bUI3TDdma3BBRzB5djVCZGI4RnZRY3FEU1piUXl5dllFeXphRFBEK012?=
 =?utf-8?B?V1VCNC9VMnVxTHN6MTM3ZjVGL0toNHhSSUVjU0Q5RFVBWXpXVUE0ZWdDcURX?=
 =?utf-8?B?a05taHBjNFF0bC9mRXh1bW1GRXNtSDVxUTQvMUtIc2pqbTdqcVF6ZzZoc1Rp?=
 =?utf-8?B?ejcxT2hTY1g2VVBGZXBkZGdHOEZpUWFxMDlrOTdnVWtuVVpzR1RUS0RrNVpT?=
 =?utf-8?B?Z3BlcXErKzNFRW5pRzlRcU1sZ3RTTW5KRVZFYVRzUjl5NEZFVGEyaEJiRFdn?=
 =?utf-8?B?L3RoTG5wYTIvTzE1N2svelg2M0lEMWl6YmJwZHFmKytBL3pJYTRiZHBtY0Q3?=
 =?utf-8?B?bi9ReDdzZWc5cnluZExscnUxYnE5Zkl0bDJ3dG1DMXJPemVmRU02Z01XMytK?=
 =?utf-8?B?K1NMTm5jOXcwTTFYNnUrcFkzM3JkRnBxR3Z2d29CNDFHZ0VhaW1RSnBETklw?=
 =?utf-8?B?VkdNQVFKL3I3ZTRlT3Vjem1HWDZwTXMwc1hiSjdjVHZYWUF5dWdJaWpyL2xr?=
 =?utf-8?B?NzhGSXc5Z0VCNjRPL1g5ZE1zK3REK1g5eHhUWFRtT0VXYllXNEh2TWN5NHh1?=
 =?utf-8?B?c3ptb3FwbjVpbTFLYnZYb0xPT2FIOUl6cGRDK0FsUXNhOWZQM05WRnpaQ2xK?=
 =?utf-8?B?MmlmREdxc0xDRUJIK3hCaWdtNy9jREVCQTIrQkE1Y0R0WUoyVmtZYUF5UnJD?=
 =?utf-8?B?SSsweGhnWnpuRDQzKzZtYVpHUXdKekhPNUNjVFNSZW1YWndaOW9Kblk4K1VR?=
 =?utf-8?B?ZVVONEdCek9nZU15bVZ3ZlA2RCtPWVRnYVdTL3lOM3VrUXRNMzlWL2w3U3l0?=
 =?utf-8?B?akplOExBUVN5ZFZrRjdCN2FGK2VuNFFJdm9vZXNOZ3FZc1FoWHNkbUIwWCtQ?=
 =?utf-8?B?WDVtQ2NnQkJNd1M2aWtpRUhRY2J6U05Lem1oS1h2TEd6MDFXM1Y3MUx6VXIz?=
 =?utf-8?B?ZGFJRVYvazNtU0xFSjRPY0w4NWEyZ0VmVU9vRHlKdWxFV0dzVlljS3VBcHI3?=
 =?utf-8?B?eG1GWHVXUU84SlhiL1JCci95SW9pc1VnWUZOMEk1b091QitFWm02RzZ3MVht?=
 =?utf-8?B?N3pSY0tsS2pUK3BBdHpWQ0MrTnRmU1kzMGhDbjA2dlMxU0RXU3kxR0VQRnY0?=
 =?utf-8?B?Q0NjOXByaDR4TUdsVlhOZllwVW04d3RPMktqMFR4Y1pka1hzd3Bxa0VIeCtj?=
 =?utf-8?B?NldPY05Sei9ySWN0Q3ZKSWZQNkJkeDFyR3JQc3ZUazA5K0dtMFhHZ05rVlV1?=
 =?utf-8?B?WDB6UGN6NTVRMEEyVkFmVEVzNG14eGxySldKZE8zQVpNYWZsY0tPZ2hjSGZQ?=
 =?utf-8?B?MUdubFZaS01aTnl5SjZJcTZUaDZYVUJ5Z1huRjBVNmRCMitCalhkWXlFdVdF?=
 =?utf-8?B?M1NLOTJ3ZXA2Q1I1SEVFc1RWTUJQTmJKM01NTWtaK3g3c3BUcytlTHEyZHVT?=
 =?utf-8?B?NktWVnE5NFh4bm5aTEduc2ltWEs5SmZtcm1jdWZ3c0VnR0o4eGhLa2pMdU5z?=
 =?utf-8?B?dCt5Sno2L2NKTWdYRDFqWk5jMU5yL0NzbEtoM0JDUnNWV091NHJXMi8yWU9L?=
 =?utf-8?B?UkswcVJsZW1SbWV3U0dtN3pQUGhlVDhxbjdCQ1F0eGY4MVZzemxpNEh6NDVh?=
 =?utf-8?B?MjU5c3RWVlhkbnR3aVpuNThEYkZsR2h3R25iaFVRc3kzNkVIRFNMM05qdzRZ?=
 =?utf-8?B?OXptOUVkcXUxNE5BOWVJSVNWeXFTNytXbll6SVdmbDUzcjNsWE4xMHFibXRD?=
 =?utf-8?B?ZlVGV0VZRUxXSHhXWlpVUTRFK2cwVUMxK3I5UFhFY25BMm5OZVF0WGgzeERu?=
 =?utf-8?B?U1Q5Ni94anZ6WXlWTDYzbEhxMUFtaXlqOXB1YVVSbGhJUVUvKzdIZkd5dEZD?=
 =?utf-8?B?WU83WWVSbTNNcjA3NDdoM0hDZEJnVml3V3RmSHcvTXZkTUEzNHdBV3VrZWxN?=
 =?utf-8?B?WFpndVQySWx4amtaWjZESWlmSlNBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a6c533-ced0-4d9b-8ddf-08d9f8bca3d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 00:12:13.7822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V81kKjv8vbu2Mm3z4qVxKnOyL1YnMocK2UJiAk+ZlDUTsmneTmUSdl//i4BNsFKfGzMYylOuj3n7RAHsR2UaoKohyU0CwJ23CsZNkzRN4io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1608
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/24/2022 4:06 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor was being initialised early on in the context
> registration sequence. It could then be determined that the actual
> registration needs to be delayed and the descriptor would be wiped
> out. This is inefficient, so move the setup to later in the process
> after the point of no return.
>
> v2: Move some split changes into the split patch (and do them
> correctly).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e41e309b9e7e..d9e1cd3e1db2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2153,6 +2153,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
>   					     0, loop);
>   }
>   
> +static void prepare_context_registration_info(struct intel_context *ce);
> +
>   static int register_context(struct intel_context *ce, bool loop)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> @@ -2163,6 +2165,8 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> +	prepare_context_registration_info(ce);
> +
>   	if (intel_context_is_parent(ce))
>   		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
>   						      offset, loop);
> @@ -2317,8 +2321,6 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   	clr_ctx_id_mapping(guc, desc_idx);
>   	set_ctx_id_mapping(guc, desc_idx, ce);
>   
> -	prepare_context_registration_info(ce);
> -
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
>   	 * context is currently registered. There are two cases in which it

