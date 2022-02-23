Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442614C069B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1A310E36A;
	Wed, 23 Feb 2022 01:04:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168B310E314;
 Wed, 23 Feb 2022 01:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645578271; x=1677114271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h5kmITMCYmEgh/gsQ83ZngQ+b93huFwn1lQ1c38jzeM=;
 b=FftY/TVVOMp98hlSv9ZHECfzESB/f6HnlP8CXfxffVIYp9T0y5lFR1+G
 YqG6l6MqYNkzfsr73ZOSSfjvaTayS+l6qUCEtiS7hopWekL65oU3HTJwE
 jQJqaiQC1tdIiENjLF8Q86vsrOL9Iq2IvKCk5ZClj3iy/IQcAyk+BzsGn
 m4jvukgjLRnMHOJ/AX0G8l2R8iWiCDiHC6GEPXVs6XLGzOLjp8hsJtIvQ
 kNr7eRRmYcF+jq1gzT4XD9R6hpjZJiORqEsbT60bAPFRT919zsFrjEA8m
 IMxsLU8hi+4ahDrlVSdVB9Ss4d4LFbYX5VHmpDv9m/Juh8v5VBXcoomzK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="249437144"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="249437144"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="508224549"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 22 Feb 2022 17:04:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:04:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 17:04:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:04:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpJTMJsrh5p0rkql0LmqfvJhLTOORKWFddVzd8OEFbWnVq4kkvN/q5a5gw90bRqIRKgMsIE/L7cviFVHWY//nkOoO+IbXQtoUMm8heVhOrRx+k04J2DlR9jPYVcZuhV0EVOV1AePO+oBuktQSiBaRY/Q9+Spp+enPN7TUrSNTTHbPBZBQcfaGu6iE9rphi8TJsewSEmhq7EB9bX+l32cjZD4bSr60wFgoMQTAZuCZXFQliauPqRqC2FjXkzab7QYpxV3aE9vwA+BLBQTSHN7Gcva2F+fkhq66Ix1mUA9GKv2OaSJI+oaXxBMn0xwHbaquQgrVCSZO1lNWAO8MtOK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zK9XY4XAj8MhuB6JUNQH1ue/KKBVPZhrRg91L3KjgA=;
 b=YHIeFNVaodWAz3dom3GBlgqbzZPIiTk/yS4feXlBKgZcBcib3IDBcGwPyjCvZ1Ssj4/YRJL+e7mH7PKjSe8e9Z9b4sXRhv5aNWIYv/ZaAttqe3HSzr15+HLC6wmjK7FFqAzyTI6le5ZAGllOA43Iml2hFpHrdgMqNVsmHQ9XdJ9Mx5WlYEv4nN7lo+cZEFES1BajhXeFyOH7W+QAyNdapmIBLxHnuKwagLIzRe8KVOUuvUctRORsVyQpHyj7SBMM7jAMcOtt8t+it0SMzdy2RArEn29xH5tBlbsrwo3yLM+y9Xe1LJxoF+Vc3igSwQuW4kFpueEFItr+n9gjH7mwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN7PR11MB2643.namprd11.prod.outlook.com (2603:10b6:406:b2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Wed, 23 Feb 2022 01:04:19 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:04:19 +0000
Message-ID: <2286d56c-577f-7c28-1398-7c1e9d96cb5b@intel.com>
Date: Tue, 22 Feb 2022 17:04:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH 4/8] drm/i915/guc: Split guc_lrc_desc_pin apart
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-5-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0108.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::49) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1aaef3-8e1d-4528-2c08-08d9f6686b7f
X-MS-TrafficTypeDiagnostic: BN7PR11MB2643:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB26437ED5B066CE9DA2D1C251F43C9@BN7PR11MB2643.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B07oTAM1VLCYiS0bEBvLuZWASlQV0A+0jQMk/R6+++EWnQT7Mnqpa/ZvCecDfZvxRFXGujFxiSVMTG9xeveu4cp4905dT++PKBKe0glUFjL1iYpRmttI1lNmQBQLX1cXlMZ/V7kd/YIn+ZbKeXOGU5Hjk60iheBkK8HByPOZGzU2HSQXNBprjA7tLFyf82FrTxlyuAg4bTh7RBwLjNgNbL3DOgWNzADAL0gtlNVS0+YUV5UI28Hn9JyOX0SbfPh5tmlygSSlCPFOKmuVmfA9HRErUmAD+qGYBhKZO+wmGKvLg1AYcFOpL9pZnTOebahUYZ3kCmulm7OzUqTve8hxHVPtmg9fObWCigSb2DklsuizacKvXTOqT3C4MgvSBUxK54nUYEmTO3byguZaVOdh9ETpVIfgmXGZSnObjGuPuMMF/fIqAWuBBsJzwrhxNJtcY6PSnKc7oU+5t2fMRhjdJsesbDTPWNksaVrh4dV3h8O+WZFinlHSdiQCVYfP8kRP3AkOdw+jbsUpod39PGF9DzkEdk2KhYp8sUEW/u250fF0D38vWAG1247VGGx7p2X8wCgBOwZHlyW/Y8BE4dH4QxJD9QuWAF0MzDBJedZzKlC+oSns8ix2YUBPouxQdFcLFSuHklP5bSkTr37BjCqyDgi4Qrbj8hElG1ecWRug7XeJilU6Aaydwoe5ry8Z7X3edfd2x+7Zs56Xzd3nXSMAdsNh8VXX6QokxExrxby6FRk3/2DSC6J0MAWoRFDO5kdkIJBRdBFMyc3cac2UQYt3Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(508600001)(6512007)(82960400001)(6486002)(31696002)(83380400001)(86362001)(316002)(5660300002)(2616005)(2906002)(4326008)(66556008)(8676002)(31686004)(186003)(38100700002)(6506007)(6666004)(26005)(36756003)(66946007)(66476007)(53546011)(450100002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVErUm5FSTdFZlpuM2tEUDdMTG1KZzFsSmVGcERUcU9TcUVGcWV4K1JCb3E1?=
 =?utf-8?B?MWY3WHNnajg3RGpoNzJwR05FcTlJWDNUN0Y4aUFEbitONS9NUDl0V3hXVG1D?=
 =?utf-8?B?UThvUHdveGRhbWgwS1U5UktwZ0FBWlhjSkFlVlZ0ZVBuSUxwUEpGU0tMMDcr?=
 =?utf-8?B?c0N0aTdvYzlFTTJvV1Bib011UnhxVW0ydGhYM1dQUzJ6Nlp4YmRBL1N4QVB6?=
 =?utf-8?B?a2lUOEppaW1xN2hPVlMzR0d4ZjVHcHF4ZGdNZUdnSHZWSDJSeVJqMUQzRUMz?=
 =?utf-8?B?UVpKekpXdWhEN1hoUzFjWTVQeFB3d1JGeGxpeXZjdzl4Z21aTlRhb0o5bVdv?=
 =?utf-8?B?cVRXam4vRkRrWkFydnk4YnV6enp2TkxoOE5wbTlWL01ramU2b3lYcVlXdW1p?=
 =?utf-8?B?RTlnclRpaDBFblF0QTEycmllZE44N1JSL3gwQzJWQlI0VlluVW1ucE5rVEVo?=
 =?utf-8?B?V2dBcGF2SzZ2WUxQeE9VK0JKcVJlcHdBcHpLcW4rdERzNi9VMnBpa0pzV0VR?=
 =?utf-8?B?SXpQbTJHcm4yMVhiNFptdFlqRjNiVGw3UEhtMm9tM05oNHF4OUlwaG1acmNQ?=
 =?utf-8?B?S08xZ0VsdHpxZnI5NldlcWJTV3BpcUkxQkUrL01iSmdHdk96MXluWHczNTdB?=
 =?utf-8?B?YjExbVBERnlHSUt1RWg3YjFvdFBWNW5wRnNqK0NiWXc3Sm94OGhaNlNMY3pK?=
 =?utf-8?B?NWVJT1N2Q3IvQTJGMkNnRi9NOGpjdEI0T09GeW1RL3pTaG0zQ2dEVk9NUkhr?=
 =?utf-8?B?dmNhbHJlSEtOOEVncWlxZHJ4SVRrOGxqNmdWQm1FWVFHZ01PMkpnY1NKYXpn?=
 =?utf-8?B?dlRuakdXN21jZTIvd1dpN3NDUGtqTVdyZVpQOU1wWEk3ckNudlorSUgweEla?=
 =?utf-8?B?SFg0bEROSVd3bUJiUU1URGZBRmlFZWJZVTZjWitVSGprWFg4SjdwRFRJMmN0?=
 =?utf-8?B?VytkMDdkQ1BaOThRSUtIMzNaSnl1WE5LUGdRZzlUUXdramJ0VlBGNTR2WGZK?=
 =?utf-8?B?b0JCWEl1QTNFVjVrNSs0N2NtVTd3NjdnMHJwRk0rSjIxNkd0VFVRaFhlVENa?=
 =?utf-8?B?TW9tYXkwVWp1eS9vSThxc3FOSmtpSS92OFFZcVZ1MkJxMG9kUXY5Y0RpNFZP?=
 =?utf-8?B?QUVQQjl2RUpVNnRhc05WenZYWEdNTDgybDRsc250QU90ejRjRkVMNnhwSnlL?=
 =?utf-8?B?ODZBRkdTRmd2STAyNXNKcVl4aG5oOXpSSFZER0NSZXJDNjlic3B5OUJzRU1O?=
 =?utf-8?B?R0JNZUxocE9ROFpMeFBGSml2cFZ5RXhaSk1pSEltMEkvRHVIc2pueWwrc21E?=
 =?utf-8?B?YWlDM2oyYkZ6cHAzUDZtby9jc1haMnZzeVJKNVBvaTlrZUlwVUJuVmZPTi9U?=
 =?utf-8?B?N3BGR3lrbHYrMDA2U3JLUTh2RzBGUEN6eVcrczNxalRZMW1nZ0laeUR4MUFn?=
 =?utf-8?B?UlIyZm9hcC9OQlNOUXdaNTlwWURSRi9FbUFMT2ZIcXo2UzREejQxR1NlSTFZ?=
 =?utf-8?B?UWZIekNSRUdQWmRpNG9ZK004TWYxRlVuWmFkZk9HRXhRQVlNYkUxWlFBK21X?=
 =?utf-8?B?VmI4RWFPMmNCZmE2aTExUmNEK2h5K3ZucC8yUWVNNmM2cy81dlZsYm9tczgv?=
 =?utf-8?B?RERNUmIwc1NsUkZWbE11emZEMlkyb3lpdUdoOGFHZG9qT0oxSDQ0UFJnRXFj?=
 =?utf-8?B?c2paTHFDTHRqaEZKOXB2alNBMEFzdi9WU2dZUWYyWkRXWitYUU5zUnozb1pN?=
 =?utf-8?B?eXh4KzdJa0Q1dFNjczVzOWs4RC9DaW9IelplTk4zZi94eCtXU2RPRmF4Vmk5?=
 =?utf-8?B?TWo0QUtsZTE5VjUyMGZIY3RpYWpDSEZ3TjgwR0xGS3dBVHUxZkdiWFQvc1Fq?=
 =?utf-8?B?MXV1eldMQ3BnUnRCZXAvbHNDMFZ1clh6dzI0UUdBRXpQZ1FXMDMyVjlnTUJh?=
 =?utf-8?B?RlNOZUdlT0lic0JocjNEZWlDRmF2YzRyYWxIdjE3TEFId1ptQyt4RFRCSHJD?=
 =?utf-8?B?S2xQZGlRaVpvWnFBTUZXYThwZ2h2SW1rbWRoNjlTMDhTWWZEQ2R5N3Y1NkQ0?=
 =?utf-8?B?RUQ1V2xOcUdmNGh4MHg1eVZGYVhpTnNoQWtXMzJjb29wTWlTUjZ0QWFaRnRt?=
 =?utf-8?B?OUpNcWphNUl0aUVRWUNQcTJyaU5XdHM2NHpvb0lLcVBKR1J4RHloU0hFZTZY?=
 =?utf-8?B?K2hjTUdvaFc3ZDk5aStUWFliTTd1UktJN3U2Nk52V1phWDJ2ZHlWZG9STGxH?=
 =?utf-8?B?RGdwZXhoT3YwTnRWWS8yRThDOWxnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1aaef3-8e1d-4528-2c08-08d9f6686b7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:04:19.2819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jBH/u0Y+ENJ9H99hSPaiYk5lta9UFtYCzAUKjjrfT6KzGAYO/Oj6E5aXTMh0MSKK/Z5TOMXZID9YjXaGl7Nd46SugFMy8VYGh7T4j9//5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2643
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



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. Further, the function that was
> populating it was also doing a bunch of logic about the context
> registration sequence. So, split that code apart into separate state
> setup and try to register functions. Note that some of those 'try to
> register' code paths actually undo the state setup and leave it to be
> redone again later (with potentially different values). This is
> inefficient. The next patch will correct this.
>
> Also, move a comment about ignoring return values to the place where
> the return values are actually ignored.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 45 ++++++++++++-------
>   1 file changed, 28 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ad784e8068c7..0ab2d1a24bf6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -634,7 +634,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   					      true, timeout);
>   }
>   
> -static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
> +static int try_context_registration(struct intel_context *ce, bool loop);
>   
>   static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
> @@ -932,7 +932,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   
>   		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
>   			     !intel_context_is_banned(ce))) {
> -			ret = guc_lrc_desc_pin(ce, false);
> +			ret = try_context_registration(ce, false);
>   			if (unlikely(ret == -EPIPE)) {
>   				goto deadlk;
>   			} else if (ret == -EBUSY) {
> @@ -2237,17 +2237,13 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }
>   
> -static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> +static void prepare_context_registration_info(struct intel_context *ce)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> -	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 desc_idx = ce->guc_id.id;
>   	struct guc_lrc_desc *desc;
> -	bool context_registered;
> -	intel_wakeref_t wakeref;
>   	struct intel_context *child;
> -	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
>   	GEM_BUG_ON(!sched_state_is_init(ce));
> @@ -2259,8 +2255,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
> -	context_registered = ctx_id_mapped(guc, desc_idx);
> -
>   	clr_ctx_id_mapping(guc, desc_idx);
>   	set_ctx_id_mapping(guc, desc_idx, ce);
>   
> @@ -2308,6 +2302,21 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   
>   		clear_children_join_go_memory(ce);
>   	}
> +}
> +
> +static int try_context_registration(struct intel_context *ce, bool loop)
> +{
> +	struct intel_engine_cs *engine = ce->engine;
> +	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	intel_wakeref_t wakeref;
> +	u32 desc_idx = ce->guc_id.id;
> +	bool context_registered;
> +	int ret = 0;
> +
> +	context_registered = ctx_id_mapped(guc, desc_idx);
> +
> +	prepare_context_registration_info(ce);
>   
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
> @@ -3145,7 +3154,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	if (unlikely(ret < 0))
>   		return ret;
>   	if (context_needs_register(ce, !!ret)) {
> -		ret = guc_lrc_desc_pin(ce, true);
> +		ret = try_context_registration(ce, true);
>   		if (unlikely(ret)) {	/* unwind */
>   			if (ret == -EPIPE) {
>   				disable_submission(guc);
> @@ -3633,9 +3642,17 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
>   static inline void guc_kernel_context_pin(struct intel_guc *guc,
>   					  struct intel_context *ce)
>   {
> +	/*
> +	 * Note: we purposefully do not check the returns below because
> +	 * the registration can only fail if a reset is just starting.
> +	 * This is called at the end of reset so presumably another reset
> +	 * isn't happening and even it did this code would be run again.
> +	 */
> +
>   	if (context_guc_id_invalid(ce))
>   		pin_guc_id(guc, ce);
> -	guc_lrc_desc_pin(ce, true);
> +
> +	try_context_registration(ce, true);
>   }
>   
>   static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> @@ -3653,13 +3670,7 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>   	 * Also, after a reset the of the GuC we want to make sure that the
>   	 * information shared with GuC is properly reset. The kernel LRCs are
>   	 * not attached to the gem_context, so they need to be added separately.
> -	 *
> -	 * Note: we purposefully do not check the return of guc_lrc_desc_pin,
> -	 * because that function can only fail if a reset is just starting. This
> -	 * is at the end of reset so presumably another reset isn't happening
> -	 * and even it did this code would be run again.
>   	 */
> -
>   	for_each_engine(engine, gt, id) {
>   		struct intel_context *ce;
>   

