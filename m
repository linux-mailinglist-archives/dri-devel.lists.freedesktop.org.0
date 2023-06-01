Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597771F406
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 22:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94EE10E5CB;
	Thu,  1 Jun 2023 20:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1578210E5CA;
 Thu,  1 Jun 2023 20:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685652140; x=1717188140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBhL3R4CV4Aazm2FbEP/4nB52DcU+0SZUyVfiJUVFJo=;
 b=f7ONxgz/0wN08byMpYZ9h+TEYsTzBBSN7kXcDFeVFW2ExFHpDAeaY5HY
 9Y4ZS2F8/07BVEvtr7MLURefbyt0C5fvVATBkT+g8yLi9NkMzYuIUKz8h
 O9NkURXStGSIiU1i1Tu7qV2dAeXggreDrmI26KEodnrR3IthzlnR+g8/v
 S6N2VAbAorFScHpQ9Gc9DA7LTH++g82jw94x3a0JyGiYOyZtktfyJuaLx
 KKgmKh4QgtaCBUQrtqnvj5xrjNVuyc+tTkTIUyGLI9ZYUbxCAAwE1sJ0t
 x+ODQ5THW3ZSTblonlh8os54clLL0FjT+RDlLDemtymYNOZEtrIIDl0BY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335298156"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335298156"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037642104"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="1037642104"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2023 13:42:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:42:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:42:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 13:42:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 13:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWpEOdBLCEoi+QqQ4J9uTQo2RP4oMUNNGIU3cm87YlBn+IBz7oU8UL60aOzX0BhBopl76TaDT9XnAs4yX1BqWI+xTY77DHskmLIG66IjU8UkNXxLiPKaUfgomMyhD7IE7udZp02IE8Hv+Dql33418KRznrvpAi6ZOeCKWpMVTEzKpJsk92gJRJdHmpdv+/raxAuPWVTQNpoOC0eowlZa9oNfave2A7nLt+WQf3qlTCe6XnmBsFN/P5EBwAKZgw534h5V/fAF3SMQ6U32O9ziJ1dS6mhC7VGdi6O/Zpqu9m/iRRv3zOxowgetCfhGUtmknLhpbdfbBrN0SW6bREf8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG/M2pT/xnwWm+6LNqAHtS6XQAyg5OfqrYwWb5AKFVo=;
 b=CqxgnjizqLI3BUDmdNoJhzhU4CQeTigTBOqR2fQbFeE30EY6jrQ+jz/XKY6aRojFYep2sekBJHjgSIGdDtWhiRpFWTzhIJOYfN2n0CEqfh6nsjzIfClFP9cnwQXxcKEuuwnRD5vPnlNCeW9c0aZNvTcpchL/2Nourhin1SeUCEysnzNSce3JwkmZZn8B43QRw4eBlDeJ+1zIDJS23uxdAtINDsOYOg7a1q9cRIF7c3nLkpbA357ER14w7YykkIhMGmFuEv0CXo68Tphr06gUWesOf3uAK2wPZYo5iY/ZqS2SD4yzzTok/Eag74r/8+h3OeS1RO5bVPR1dnilb2FoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Thu, 1 Jun 2023 20:42:16 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 20:42:16 +0000
Message-ID: <5acacf14-2785-963a-91c4-47e9487e9e4d@intel.com>
Date: Thu, 1 Jun 2023 13:42:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v5 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if
 the fuse says so
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
 <20230531235415.1467475-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230531235415.1467475-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:217::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM8PR11MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a692f4-7643-4f10-8d7e-08db62e0af79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8L3uBETFtpIv3oLk6omZsESN5O6fvstpulEBZrXtt5Y1Fpge26MeAyxYT7TdXLOhZktlJpNWzjNl1kdcIsTc9hHxWUInTY9UlgtJbkDeiZd8Ehq3e+19V+0i9gw5kwvkJsxPBIHUK4Xyl6TWcNjxDku2wyrST5UiNHd991ZEUAKgBiA3+baz2QoUZxrqZNubbq8eXJlNJTVkLopPPLJqerWyg7WA83t8PkaZG6etPZshLn/usVOPJeHFCk90hiQ0gTcDSNPxQs4yexEkybJmNr/54SSPkrq89y1bDaNqyWzIBLnE4+H8AExk0DP5Hz3fybO7wen/FUzf2VSoCLp6iffHBZDD4aMZjeTpDZd3oTN7IyGDmgCbgXApL/pMkpA2VPjGvRLcVpXjKxgHd/GrCnrEwTudUHbmFi1/xWQ4S8O1M/RPldKaBmyRlx/Bha5HfmfimMu1PN31/sFUoxNHHQtGFiEGqzh+uhuNPnUDBE84X799h6RVEv0FGn+x2KzeBG5KPP8gb3E/1MAGsRt+Iz/vsxYZKHLjbaD5ZyEHnZlxKa9LjOOL7hg46dPc3hQjsTTpU5876sf5nuKnv+jdYwcglSMbaAcNi9lVK5ZLFVNz2fVrzvCCSW/2Ng+nKLkd25b68bOB0guz9cz8b9f4RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(53546011)(86362001)(31696002)(5660300002)(8676002)(31686004)(8936002)(2906002)(4326008)(38100700002)(82960400001)(66946007)(316002)(66556008)(66476007)(450100002)(478600001)(41300700001)(107886003)(26005)(6512007)(6506007)(186003)(2616005)(36756003)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTFnNGY1VkhPSmRRdVJYNVN2bVBnOEVVdHBmWk5pUnJjRUhxWU5SeW05VkpR?=
 =?utf-8?B?aVJzbWhRcTc3OEtURHQ2VGpERHJCcWpPLzgweFdwRU5xbk1EMC84RWdON1F5?=
 =?utf-8?B?aXcwMit5YlB1bkNYVGkxWGNoN1V2Smc5OFpRRThiNVZsVHcwOHdzYUZ0V2pm?=
 =?utf-8?B?RUxpaEcwakNKTVJxSjY5OU9wVDJvZU14MWR2UytJb0JQSjBaMjQrcUZzL0Zy?=
 =?utf-8?B?eEVCWURwclNVZ2RpSTh3MURvQWd1MDQrc2JxVTFyVmtBcm0zckZwSktYaHhG?=
 =?utf-8?B?T2J3QVV3VmlKUXg4QUdUUC95RTQvWjVRWjErNTRFQTQrVHM2Vi9IVEplU2JR?=
 =?utf-8?B?QWJjZTBQMUU2UUQwVkd5R3l0UTRMZ1AzalY2WnVENXdFMllwZlM1RnR2MGRX?=
 =?utf-8?B?WmJ6OG5HbU5uNng0bERVUHFSY3A3d2VoMTl5Y3AxQXV2aGRMSzdHK0NhMXVQ?=
 =?utf-8?B?eGRBZ3h5S05ZNDRFdzRUeEVNcFo3VDVPMy8vc05ya3VTQXJvL2hLWUhWUmd5?=
 =?utf-8?B?akI1dmNhUDFxSUh3RDF6THlienBsaG4xNHl6K0hhMWhJdlpJMUFMMXlaVWVR?=
 =?utf-8?B?OVhWOTFaYnAveVF3c2FiQk1US0dEdWRVZXpncjg0dUdFK2xsVG9UYUFwRmht?=
 =?utf-8?B?LzkyZ2FOR3VSMFhmem95TDc1MUhYSFFic2xsY1I4aE5FaDQ2YkJTL2JXczhp?=
 =?utf-8?B?aW5GTDh1VkwzWUVmQ3FFOW05TFBvVG9RT1ZsTlUrdFJQSFNhNG1GMlFBRm1E?=
 =?utf-8?B?T1Vab3hSc0tDRURsUE1xcjNPOEUyZEFjZXVpRmVtZVhVdlpnYmR5Qk8yQ2lD?=
 =?utf-8?B?eVhmUk50SldWWGdFdUQ0WndWbC9kcWpyOXBNZ0h6bGdjVVVYNTBlSkVlYm1p?=
 =?utf-8?B?TTl1cEJyYVVoU1hjZ0dwNU02ZURFc2RIWGVMRkxKVVVzanBXUnQ2QUdtYytB?=
 =?utf-8?B?eXliZ1lxdzFiNHJnN0JOdTY1eWo5cVpLREIrY0FvVEN5Qy80QmJwMi9RdUxz?=
 =?utf-8?B?NlpuRjVlT3J2YlJEN2oxY0pOU1czdHRKakpYTXFrZ2J6aDFsYlpCT2NjTzk3?=
 =?utf-8?B?RVlYaGpZZnlReUVGTGxGN0w2OTJxai82ME1EOTRiaVZtOHh4cnZWTnBJSVdI?=
 =?utf-8?B?UjRpZi9KNHRCalVWbm5VKzJZME5rUk84TmMzeTJZZWdGaHBISkNnSUgwdktq?=
 =?utf-8?B?STlnRTRFYU1Sd2FRYmZQblNna0I4WmpzQUhsVWtackU3K29YODF2bzZ2NVVL?=
 =?utf-8?B?L0ZGczhhU3dtUEVxRjlaLzA1bVlhNk84YnV0SGJ4RUs0S3NWYUJEVG4rMTFR?=
 =?utf-8?B?Unk5RDR1eGZBNmMybnBxSHJsWkpPeFA1eFZkSkNpMjRhTmlNaEt1dzJCUzBV?=
 =?utf-8?B?M2ZmSGl0RkcxUStjQ2J1Sk9Ua1lGTDJVcWxZYllWVUVjaCt4WFRocVFERVBy?=
 =?utf-8?B?d1VxRTVGOWFkbysxb2lxSFlNWkh1NjVwWklTOXNWZklQc3djdnBCN2NlVTQz?=
 =?utf-8?B?UGduU3NyZXBEOTZIVVpMemx0aysralVwRXRBdUtBQVRBZ1U2L0F4YnlqTG83?=
 =?utf-8?B?c1kwT21WUlN6RU9XVHZ6UFpZdWNZa3loaWVmMmh3WlJObnl2d3V5T0doaFR6?=
 =?utf-8?B?NFJzVFlzK0JMdVRFV0l0aVMzdlJKWGdtUW93UE5uNkpnZzRqNCs5UDBBZ3lx?=
 =?utf-8?B?V0ZXbDZVZ3UvNFFqV0lPRExvYyt2UlIrSUV2WVMxN29OVUsvV3RSWmVMTEJU?=
 =?utf-8?B?SVR3eVZFWU56d0x0MEpjaWFTUGFBT213VGNzcGhjejUrNmQxalUwejZaMUN2?=
 =?utf-8?B?L2haTjZKR3RhMDVPZG8yOW9KR0V0TDhrVjFmMDU0LzMydlNTYjdVV3BJQVB5?=
 =?utf-8?B?NTlwcy8vVHVESG9IN0xtMlRFUTRTVmZuVmJsTHovYnF5TUcvZUswY3ZlVWpz?=
 =?utf-8?B?MUZmSkNtRDN5RmlEV1ZneW5PeEl4eWhqSS84cXpNclFEZENrUjR4c0pmaFJB?=
 =?utf-8?B?bUZ5b0V5RStZdDV4UkxjS0VFZzAvMDNMN2toQXNENEUvWHg0d3VtTXFkdmM4?=
 =?utf-8?B?NTk5SHhXSVVJSzJJcm03bnVnK2JpMlMzMWZoeG5QSjVZdE1xSGZvbzRmcGV4?=
 =?utf-8?B?NFg5TW83bVpNTnA5bUU3K2tHckNsR3QwN2M5LzNLSjNZYmFNUk0wWU5TRmNX?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a692f4-7643-4f10-8d7e-08db62e0af79
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:42:16.0938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRcRGDgKueBF/xWJKhgusXb8L1IrSqRXzU0io+feWh04lVb6ygYYFM5drVGqmHsaQiNJYtNubFldGcHLuv28xLSMi2su2/zrs1nxmo9sNfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5703
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

On 5/31/2023 16:54, Daniele Ceraolo Spurio wrote:
> In the previous patch we extracted the offset of the legacy-style HuC
> binary located within the GSC-enabled blob, so now we can use that to
> load the HuC via DMA if the fuse is set that way.
> Note that we now need to differentiate between "GSC-enabled binary" and
> "loaded by GSC", so the former case has been renamed to "has GSC headers"
> for clarity, while the latter is now based on the fuse instead of the
> binary format. This way, all the legacy load paths are automatically
> taken (including the auth by GuC) without having to implement further
> code changes.
>
> v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)
>
> v3: split check for GSC access, better comments (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 49 +++++++++++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>   5 files changed, 47 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 6d795438b3e4..27c5e41fa84c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -298,31 +298,54 @@ void intel_huc_init_early(struct intel_huc *huc)
>   static int check_huc_loading_mode(struct intel_huc *huc)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
> -	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
> -	bool hw_uses_gsc = false;
> +	bool gsc_enabled = huc->fw.has_gsc_headers;
>   
>   	/*
>   	 * The fuse for HuC load via GSC is only valid on platforms that have
>   	 * GuC deprivilege.
>   	 */
>   	if (HAS_GUC_DEPRIVILEGE(gt->i915))
> -		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> -			      GSC_LOADS_HUC;
> +		huc->loaded_via_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> +				      GSC_LOADS_HUC;
>   
> -	if (fw_needs_gsc != hw_uses_gsc) {
> -		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
> -			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
> +	if (huc->loaded_via_gsc && !gsc_enabled) {
> +		huc_err(huc, "HW requires a GSC-enabled blob, but we found a legacy one\n");
>   		return -ENOEXEC;
>   	}
>   
> -	/* make sure we can access the GSC via the mei driver if we need it */
> -	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
> -	    fw_needs_gsc) {
> -		huc_info(huc, "can't load due to missing MEI modules\n");
> -		return -EIO;
> +	/*
> +	 * On newer platforms we have GSC-enabled binaries but we load the HuC
> +	 * via DMA. To do so we need to find the location of the legacy-style
> +	 * binary inside the GSC-enabled one, which we do at fetch time. Make
> +	 * sure that we were able to do so if the fuse says we need to load via
> +	 * DMA and the binary is GSC-enabled.
> +	 */
> +	if (!huc->loaded_via_gsc && gsc_enabled && !huc->fw.dma_start_offset) {
> +		huc_err(huc, "HW in DMA mode, but we have an incompatible GSC-enabled blob\n");
> +		return -ENOEXEC;
> +	}
> +
> +	/*
> +	 * If the HuC is loaded via GSC, we need to be able to access the GSC.
> +	 * On DG2 this is done via the mei components, while on newer platforms
> +	 * it is done via the GSCCS,
> +	 */
> +	if (huc->loaded_via_gsc) {
> +		if (IS_DG2(gt->i915)) {
> +			if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP) ||
> +			    !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> +				huc_info(huc, "can't load due to missing mei modules\n");
> +				return -EIO;
> +			}
> +		} else {
> +			if (!HAS_ENGINE(gt, GSC0)){
Checkpatch is complaining about lack of a space here. Maybe fix on merge 
rather than repost if that is the only issue?

John.

