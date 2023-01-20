Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D357A67492C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 03:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F2C10EA0C;
	Fri, 20 Jan 2023 02:06:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9B310EA06;
 Fri, 20 Jan 2023 02:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674180390; x=1705716390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HyqD73z5VJW9DqPuMNaYy60XiLtlOTcZXRvmgz9BbPM=;
 b=noO5ZbOVfaZdjUSxmRo+KH1RFeVqJLFErCpI7cNVGDfXJNjqLryR8n/B
 9W1DfT1se8E3x6zIAU2Iba2zD1JPI5DIfbf1GE51zVbg7xmPEooDl3SSm
 EXPUMFiGdeJ+ddYIeH93MFc7SZ4UVk07KrvV6GJHPt9aRVpLCYPOppkxk
 qCdhWqRkZclndGjCl/zXImII4x4v34XeTI60b7+UY1G6sdl5A2pUUGygY
 SL5kTg31MP0/cCrLYV+qlpoJiecZRWQ78z4iqTDQq38hZsu3RpM4x1aqj
 kzrKIVZ65bmDpJ1kxp8vMP4iUf2+YSWg1lPSRTZgjyRYrl2wRvKVxzjqH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390005693"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="390005693"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 18:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653636929"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="653636929"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2023 18:06:30 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 18:06:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 18:06:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 18:06:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMqW/gVp6uOLp4aJMz4SJt7Gl58BOCEVEfTr9IZit25k+qf1TmMLPRTk/tLHw6fs1U1+zVXcGpr+cZuBbp5nHkcJ4XQPOUj+treDu+G/JR+3IbkQqyX8ADLC2D1l+71opMYln9NDfqw0UyNCIAUgtKKvfML2u16wVh6eqXyZpiFBShkE5ND6g7Wk22uCHEF0S8ZTeBhv9U0JDOW8wzF8Ws6jAHzHq3yNvPBEjLgrcebMvc5HzhHH11cYBvwL4EKHbojt0VDSWiHSbIDi3Zg1uJfcdlQw/yWmL/OTsRAvucLIHrhDOljFrSxIRjP+2mnnlmrqHYQBxEP7CInYopV5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz4ulZ/nUFrp+uKDN1qld1KEybwoVjHiRod0wdWtq1k=;
 b=mwIbiFn84xu6w7b0BvGaER4S2aOQ7kiIQwDVJQlXyTOYw3s25Yy7octs1xvBh9wMvcfIh6Olp8jXwoR82Dp8mmuw7yp7Z2t9VfQpUY7C8c+qkTS1GBaAZ2R2p5Vb3NP8xSny51Fk564zYlDqTs2YDZOVY/E5I8JocQjnPMcXCS0Di3B3RQuF2UhSwKW2/XvrwMETcKYG+f/U0jdtqbr4YH21kBcPH0SdIg+BiMRTaWFPy+0BF/5mA8ILj77kwGth4r74uAnrPkdgKbXQDXNfTJudV8/BvrPMdJ3GK+FX8iuRh0lp/8aa2PvMEtsVpytnqPqg99ds6o1qzu2JSKawig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7840.namprd11.prod.outlook.com (2603:10b6:208:403::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 02:06:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 02:06:27 +0000
Message-ID: <7396d7e4-4b17-0047-99b4-e30b881d72e4@intel.com>
Date: Thu, 19 Jan 2023 18:06:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/6] drm/i915/guc: Look for a guilty context when an
 engine reset fails
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-6-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230119065000.1661857-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 45963bab-c20f-432e-caeb-08dafa8aefe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ja6tLColIZIIVnWfUfQfEsYkW2PyB3Qi1UMKFyy5dCSGf6pMkj4Qojw/yIgkUOd7oZUfeDnQYULgodHqs1A0YWtvv6H9CK0mxaYW5BE5PYMqNumTgC23CGFSlkPi4WPu0EtktBDR+FZpjn87TbyEyO0MFTCzcj90VfXe4dbiTk3CpARwNwoo+Wi4rCu/ACz0XVUH++lt1kyOYGsFROFiY0EsZO8xVLF3eyEDiLTmmZie6PRFBsIrLiRgY4LW1Yk1GZAHsXHzMGfCZA18M3cPKnl2aG1xqV6E1wq0ubHDJV2MLvTwPAdJ6Lr3FlbFkhnAT1z7LvsCxkSFBxX/u428EMe4AldeuAmjnNql81FX2CPXWkdtBr9ZRpMwZkEDcNYRzixMvsLaDOgNg4baKOLPiJw7RkTMC5anNWgj4Mu0+nfT5IMg9Zg8fS5xByRWdUe+FyGhlX0RPprktVEDIa3UPYDmiu2wP72yDDqAanGYEJ/39oS5fgWMzn9hbnC6wZOaJk1sDtOBkYKRgPsaVLS7uI9lr21KSmMohvywgGIdJTKMSQuCvaD7VnEY0uXyzGlD4VAYvZrN43zMzQlmq0BtTC5cedSOZuLKKNiRdVmUylJ7uKa0c1DCyWLKDw5O6AcbuF1ZzgiG4FM7IWXSBrEC7By6Rnu9ZM3SvuvgR9jp7sR1SZNjh3ijlAyjpjmpjlhR7/MzmPxrLI8Cg3rjUWmEZbjGG6fjJJmr/o12tw0B2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(38100700002)(6506007)(36756003)(31686004)(86362001)(31696002)(2616005)(450100002)(316002)(478600001)(26005)(6512007)(6486002)(186003)(6666004)(107886003)(53546011)(82960400001)(8936002)(2906002)(41300700001)(8676002)(5660300002)(66556008)(66946007)(4326008)(66476007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9ORmJsQU5qREt3Zzd4RkxsQndvcDUxV0M4ODN4OUNMWUxIcHM2SXpxcUJX?=
 =?utf-8?B?ZXltQzRqakhIMC9ubWZYdWhTWk9zS295aGk3ZVBrSGxySmdsS0htTnVBUll3?=
 =?utf-8?B?eEpQQjgranczMmNiL0ZpS0lLV09mdXFYYk5PQ3NYZ1RTRjV0S1N6eXQ2Vzl1?=
 =?utf-8?B?dTFBT3AyaXhWQnhnWWRSRWZySmtpanhkZTdYOVVXcUJEZUY5LytqQVFqWmpO?=
 =?utf-8?B?N3BkQmo5VXh3V1FzUm1lcC9yM1ZNUHprQzA5eVZqVHNLR2lNekZOWjJmZkhN?=
 =?utf-8?B?RklkMGJENU85Vm9JTXVCNzN3RHhlNVJwcFpSNE1ueUNnYzBwSEc4dGV6YUlh?=
 =?utf-8?B?NnNJS1ZTNGErUWQxbzl0REtxU0NRVmZVcUlBOG02cUxWOExGZzQ5eFZPcGJQ?=
 =?utf-8?B?YzAzZmJuVDFsU29yVkU5S3Jwa1ZBeDBCNHdnR3A3QW10YWI5blN0dFRlR0Vo?=
 =?utf-8?B?NDFlUDFtN0EyazIvbEkva1d3OWpUUWQ1QWEwT1pLcUNaT3JEOHpjTER6dm0y?=
 =?utf-8?B?TVlncWJoMlhHVHFwNE00azBRaldtTVQyeVFDK0ZaSlROMUp2YnhFK0F5Ympn?=
 =?utf-8?B?K0NNcTZVN0wvRUZTT0MxNjVhaWlLU0lsaDNlSXJSRjJHT2MrdVh3OThtVlB2?=
 =?utf-8?B?ZWVRMWF1TXllamh5VGVRRmROOXJON3UzVEpoVGJRZy9mUzZicmdWUmxKNENw?=
 =?utf-8?B?cW9QcmpOUlVSVnZxN2JhTlVzUXlqNHJwc0VHRnJaQVVZMy81OXVjVVhjcTVJ?=
 =?utf-8?B?ZzhmRGpTL0xFSWFabmFuajEwOHJZaGNBSllTbFROblpYYzlZNTY0SFMrVEty?=
 =?utf-8?B?Q2VxYjI3OVJOQzhkeFUrTklYamdEaFpsa2pEelFPZWZLQzFSOXE4V2JFamJH?=
 =?utf-8?B?eElOZURib2IwUWN5bG5MOW11dDRGb0lSb2J2ekprbkE3MkNQQ1UrWlRiSlRh?=
 =?utf-8?B?UEtqZ3VWZ2NJV24yUkVYMHV1TVJrNkk5a3FRbVE0TmVWajMzMmhQU2I3a2J5?=
 =?utf-8?B?ai8xT3Z3TlE1ZEpEMlRrRTNmaGYrbTc4amhXSDkzcStQVHdtdEdXT2Y2Rzg1?=
 =?utf-8?B?Y1Nta0NidTgxUnduZUZ4QW5QaUZ4YjNpNXliYlVvc3l3eWVWMGJsUFI5Kyt1?=
 =?utf-8?B?bXNuVUU2czZRd2E4Zk1ZRFpYMDd3RSszUkFQcUFjYkFTbTZmSDhrZVZzOEZG?=
 =?utf-8?B?alV5MlRNVlBRSjh5TWRuK1MvdjVNSkZERktIOGJaVXlONlQ5YUl2WUxvRWVP?=
 =?utf-8?B?MHdlN213Zm1FZXZNaDBuYXBZaVRKNjZRUmVabzhXVWpSL3A5ZFVWMkVldHNm?=
 =?utf-8?B?TVpiY2FhSnFoU1g2YzU2Zi9JcUxEb09ZTEtMckpYeWdIMDN3aG13YmhldTFk?=
 =?utf-8?B?aW9ZSWpxeUxvUGFWUGs4R0ZzUEwxUHhXaDlMWUtCZGxaQklVaWZBQWpmaTQ1?=
 =?utf-8?B?d1A0R1M1b1VQdmM5QjN5S3NhOWVMSzlEV0xrTDNwKzFZQVJMY1VNMmhMY3pw?=
 =?utf-8?B?Y1F4dG9hRkZSSE8yMUlhbkw0ZGxRbkF2R3dnVno1dGJGbWQ3SlpZdkpXbVBS?=
 =?utf-8?B?SzNNbVYxQVVkcjJ0VjEwUVZWb0tLRUJMVWYyMTlMZVVQNUpFbE0rUG1obHUv?=
 =?utf-8?B?YzVDcHUreEh0bG9UbSs0TU5NSG1jeXNCbE1sVm5OTERlVU1XVWx3SGlpbSsz?=
 =?utf-8?B?S0QrY1lRL1JBYU56SVl5cHpIWE1WVlBOOEluQm1CZWQvZWFHK3hmSHVNSm1F?=
 =?utf-8?B?NElqSHZSSWtEalVNamI0UUxON1Y4SUtySm5leFdVa1VRQVRtLzYzZUZLNU9N?=
 =?utf-8?B?OVVLZ3NGVWRRWXZQTFQ0VG5uYXZIVjlXbTlWa0ZyUnZjKzY5WjFCTEFYVW9x?=
 =?utf-8?B?bmFheHZFSXZLTEl1MVE1aTZKancwNDZ1ZjhobUVaVnl0dS8xYTRISXBja0pj?=
 =?utf-8?B?Wkg4TVpsUllBNFh5MmNSNDVCUlIvMGlUMTcwbzhCUjQwKzRsNjQ0RFkrS28z?=
 =?utf-8?B?Qkl0SnBMUkRtZ2VFSWs1UEhvVElWaTRKTldUL0RIaG5iTmhrZkdVU3oweVpk?=
 =?utf-8?B?MXVFa3NJZStRTlE3WWFFTEdSS3d5OFMvSVByZVhFZ0FEYVV0dEV1OTNKQlov?=
 =?utf-8?B?blVaRlBjdkYvb2hxSmlxazRuTUE5VXJrZHc3MCtZeEVpT3pleWVjaWdpSTVz?=
 =?utf-8?Q?+nQpTkXhb9FQuvb49GoYY6A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45963bab-c20f-432e-caeb-08dafa8aefe4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 02:06:26.8525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUExx0VG6K76AcnEHowJ2Y1MRBJ2vXesDidbnxK/pUstnBNpQ9KmuAnIlaPMkmUgFO2+op5KvdAFCZ72LPDqpwp5VWV5Zpk4FYEFt/srvW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7840
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/2023 10:49 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Engine resets are supposed to never fail. But in the case when one
> does (due to unknown reasons that normally come down to a missing
> w/a), it is useful to get as much information out of the system as
> possible. Given that the GuC intentionally dies on such a situation,
> it is not possible to get a guilty context notification back. So do a
> manual search instead. Given that GuC is dead, this is safe because
> GuC won't be changing the engine state asynchronously.
>
> v2: Change comment to be less alarming (Tvrtko)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d123cbd90a919..7c5ea66218443 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4756,11 +4756,24 @@ static void reset_fail_worker_func(struct work_struct *w)
>   	guc->submission_state.reset_fail_mask = 0;
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
> -	if (likely(reset_fail_mask))
> +	if (likely(reset_fail_mask)) {
> +		struct intel_engine_cs *engine;
> +		enum intel_engine_id id;
> +
> +		/*
> +		 * GuC is toast at this point - it dead loops after sending the failed
> +		 * reset notification. So need to manually determine the guilty context.
> +		 * Note that it should be reliable to do this here because the GuC is
> +		 * toast and will not be scheduling behind the KMD's back.
> +		 */
> +		for_each_engine_masked(engine, gt, reset_fail_mask, id)
> +			intel_guc_find_hung_context(engine);


I double checked and AFAICS this behavior applies to all our supported 
GuC versions, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   		intel_gt_handle_error(gt, reset_fail_mask,
>   				      I915_ERROR_CAPTURE,
> -				      "GuC failed to reset engine mask=0x%x\n",
> +				      "GuC failed to reset engine mask=0x%x",
>   				      reset_fail_mask);
> +	}
>   }
>   
>   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,

