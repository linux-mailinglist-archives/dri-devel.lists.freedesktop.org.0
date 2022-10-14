Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206E5FE64C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 02:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4310E060;
	Fri, 14 Oct 2022 00:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E79E10E060;
 Fri, 14 Oct 2022 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665707087; x=1697243087;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w+TZ5iGAeKdnR+JSRug0ETZw/PDAgQvdye6yDA7Y2IM=;
 b=kmq32vJoP0tF04ceMmYpL5wJlFzVDTUyEIcXExTFvAMZ/vH1vQ90ORpG
 SPFTrivxZM7HBnOeHW4xviUrxJsxU33YgEASVUqNseBZBTzcXyRw8S9AG
 RfHvO9CcQpac3tr1BcgrbkijCY6iwg4WldzG9BC1zCOkUTfupnwN4pnXG
 q43PTpS5aXC+53fzRmxnCyWM2eKCbxNyblfXy39A8TTPzCu/g4up//MTl
 PZQLuN0xcwY5e5KITp/6P0wc8TltVY9mz1S+9+BptH7r6Vl3SI2t96im+
 FGP2QTvE03m09L77cs5EFc8m296ZF8AMN3TcNTtKx/+GKnMovMDHOufPT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="305231878"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="305231878"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 17:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="578442025"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="578442025"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 13 Oct 2022 17:24:46 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 17:24:46 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 17:24:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 17:24:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 17:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDH3qPs5rH5RYUnYCxwCAjscT+z6Bj6o2qPNVVzGMBPLL9Mpt1ayueNjXjuFIJRhFN0siaKODn7HLLkZvMVkrJj+0/y55gpKg0r95SV2xIOUPhi5QsNTmvNJuHk9ahfCzrCmdtYYnCdDjBMsfwvHlBAxyUIOfUBlNDTSfm96GoAfyvFLXhsGzZYmqYe6o7VIo7Nsstulo2QOKgvuepvjB3f21HI5H5VNcfNdvSjzp7WIfhc/KRbtBCxzeEWEcXttf+lgz94yXxBP5SzcbusWEJDvRG7kzcETB1eD2m+OFGkwEXkXSWbW7rOc9MAQdb2fG6U2L1L0v+ZOGGujyufSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEoVJwj3gTDjfM+nGxo/zJJBjtHcYDOI2EjMCECL3Aw=;
 b=VaFGrWoDYuMCtx1qjKyXK8Q0AQy/WpL79JHXeg+Lu+uTzNz668gLhKm/G4zxO8USB4F92jTNTo1VzvsJk6BttH508TXSJKFNS5R62fC1Fihllgr2fiYULGUQn9PhcneDalshHlDv1W8kIXplj5iTcQMUN2rKCm+HiYI0I4irbo9UE3a3qKaiUMEwzMbmRNrS2QGrs7cpAXbcEziJirO62+cVzDUk3IC9KMpWf6qk2+q271GUcgfoSz2nRoQJdoezLQSlI6hxCrjxCD/a3dAs4OlZb8EBP9qA1wt+5D1EQb5P4ZhaXQ9Qrew0goOUjNeOEnleMBdDUG3PrbYHG6TsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 00:24:36 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5709.022; Fri, 14 Oct 2022
 00:24:38 +0000
Message-ID: <ea6fc257-d08b-fe3f-469f-3b2f41c60297@intel.com>
Date: Thu, 13 Oct 2022 17:24:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2] drm/i915/slpc: Use platform limits for min/max
 frequency
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221013155524.25886-1-vinay.belgaumkar@intel.com>
 <87h707z7cv.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87h707z7cv.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|MW4PR11MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: fadbaf0a-a861-487c-8f48-08daad7a7a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzLfp5MOYgr4NcaxipOh3VjabnQTk+P5IdAO4jkZRxRpmWZN9vSYplnOs07PbWckKknz5pOOqMcmSrVaoaV+JCAgNyn7kUChr4reXxFv1x+Pfi0QnYzwfQmuyUZcnNbEI+6bu4MytasvbIWCN5+k8+dzHVDu53vTpm6nrtEARs5Bcja/7HsylVblr+apBMizMOBN/prDnnh1xFOGWP4eOVYvAfftwo6BeWuqA+GhTuMAjgAo85wTczgfBecuK2UohcTSZxfTwP7h26pCB4ttmXHsrD+qAQZ/MUiczoPy6ZjnlIroc1JqNh1bpyIjYVnAmcoqo0IZLH0h3+591F70GgUW9LxmcydnRLM4cTloGqLtvo6VfA95Z6iOJq7iCZF6gII6phGE/U6TwKekRW76TlWQPc8IPZAhEneSlF+XDhf6MhJdFWY+XdsXT4BEzLZyhazcpeEm87lHzjxChTrlnZEPJJMVKuEt0JTZl1a9fYeZ5hTF/lEmhVkwpTCR1jz5wQzky1fs00bB7gbrSGi1buU5t7KXkJ8T72oAingBQ1V4tTKqb1TQd1BcpNqQ1htYLRv6HZYxkRB7h0z56dYZpj9X0wl/ty5AtqX+31+flqGIpppGaL9sjrPYCA/R47OhK+mPkKvO0D1Eg7vP7SUPL5FvE4ArplTmeZujHW8aFqB99B8LYcbJqb6Y0d6dlg28de0HIIbHDsW8yLrgQgtw7QIeZ+j9v1mKAD/FqyJY4PrQMGxV8oKGgycqep+YPe8jKXIhj92G/ex4FN5MEXN+s9Peb85TK7iaKWzp38GkFPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(5660300002)(2906002)(2616005)(6506007)(41300700001)(6512007)(6862004)(26005)(8936002)(186003)(38100700002)(53546011)(31696002)(86362001)(83380400001)(36756003)(82960400001)(316002)(37006003)(6636002)(54906003)(478600001)(66946007)(31686004)(450100002)(66476007)(8676002)(4326008)(66556008)(6666004)(107886003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJreDdwTDlsbVUvb3IyRnhrV0ViVFJVbzI1QUl5Q1ZiQThIZEdMR3ZUNGRL?=
 =?utf-8?B?YVZaYVZNYnY1dkJpd1VrNDFrZGFpdWQ1MkZxSmFrZWlkTDNxaDEwcy9oSUNT?=
 =?utf-8?B?Unk1TENJM3FXWG1YanVqcHJ3RGFEL0svMXJ4VDhCMWdUQkhQTmR6ckxqbEpt?=
 =?utf-8?B?ZTM3aTR1Ni9lVjBjVWJ4eEhhakFsMzkyNnJlVUlzZ00yZ2pHenRPOHpXaWpV?=
 =?utf-8?B?TDI3anV4ZUIwWlRHSW1VY1UrSFhLRmFhdjl0NGU1endNZUJJYU1JMzloVkZV?=
 =?utf-8?B?NURzaTVPaC9sUWJVb2h6U0JBYVRXZjY4TkFhcDhYcllXYVNuMGxYcTJlNWY3?=
 =?utf-8?B?Z0g1WmUzdmU0TC9lSXFaMzRFaVZ0eDc3eG9lbndqa0ZON1dvRWU2K3BhbTBT?=
 =?utf-8?B?L3dibFNZc0lvVUplVTlaN0psVHlIUHFuTzJhQ2lvR0w5MXcwU2JUa3JWdDR0?=
 =?utf-8?B?N1Y2cG1LQ1RoY1dacm0vZ24yaFhnaUt2M1ByV2szWmZMNFhHTktIQURpdmpR?=
 =?utf-8?B?TWxIZy9KYXBwWlQxRE5qU3ZtQTVkL3ExNFRCYlh5bXJoMk9rY2d4NEZ0RkZN?=
 =?utf-8?B?Y2E4cW93SmppOFRoSEowS1R2alpuY1dLTzd4c3lya2NvT0RqeDV1cVlwTTNW?=
 =?utf-8?B?S1BLYlN0U2Z5cHZTVVVXQVRtOGErNWVEZ3MwdjJqSmJ2QUxTbVBXQk1XbmVw?=
 =?utf-8?B?NGU1M0ROMllubXdmcDJtbkVBWFJkUkhIS2R6YUVDcW1nNnNGYlpHSTdVc25M?=
 =?utf-8?B?OFlEbWdDY3RSaVk3VFhlOFlPUmdEako2YjI1UUNsQlc5NFRiMjJFWFhYK0cx?=
 =?utf-8?B?V1krL2lyZDZrcWxabXdzVTNxM0pxZXVmYTNnZ0xJWk1hcGJQUmVYQjBMeDBh?=
 =?utf-8?B?N21YNUNYaTJFcmtqQ0g1OXBqM053WGZDOGcydjBnMXptQ0NBQ1BEUUkwRkFx?=
 =?utf-8?B?WjBpNTY5RHJNMVVpZzhVYmFKY0NBYTQvWnZRaXM4YnJSZFlXSjl1K3FsTy9Q?=
 =?utf-8?B?ZityZTJORi9RbnhlRTZKVjRYZnc4aFoyblQ5V1JtZW81QUd6VXVpZ3JWOUdU?=
 =?utf-8?B?RWxxNTVRajVmK09VcTN2TUJ0cjg5dVJpVGdYbTk1S2lNd2lGc2xhaEkvdkVa?=
 =?utf-8?B?TmhhZy9zc2lhNlF6NGluZzlOeFVxVTM3SnhtMXI1cWxEZm5rVEdNVUxxUGpR?=
 =?utf-8?B?SWJJRis5Rlpqbnh6L3FqenFmSk15c3BTazJ4OE0vZEx2a2lpcE9wM0dNdlEr?=
 =?utf-8?B?cjA4THNhTFYyOHEzMjNjb1JvcDQxbGlsY3plRjJSR093RDBCNFlFTzlXMkdx?=
 =?utf-8?B?SDUvbmIyc0RlUjB1T29lUUtBYnVvbVh5M1plMkdyNzI1dXZQYWpwZjFHdWRr?=
 =?utf-8?B?T3ZtWGJjSElNb1ZNdUp5N29RalMybEtaem1Sd3JMajhhQ3hKYXFZUXlUK2VL?=
 =?utf-8?B?M3h1VG9jSU4velJRTlNFcmticktvWmdLSDN6L2REajFuVWwzMWZKRFphV0lt?=
 =?utf-8?B?ck9rVzNHdkEwN2l0N2NQVEhBOXpxdzAvRHlWUDJxckZyZis3bXVZK3VmV1RO?=
 =?utf-8?B?enVSR1lMQldkbVY5TU5KK3VLc2tkUGJPRTZnL0hVenMyL0hmZ2YvNDVnR1Ba?=
 =?utf-8?B?aU56Rkhsczh2dy81ZmRkSFFheGF6MHJKeHY3THU3dVdKenRmcHlXREU5TE1i?=
 =?utf-8?B?MUhuakpEYzNXblhzNlM3Y1dCZ21QWlVscXFjOWN3M1R6dUNxb205eDIwVWk0?=
 =?utf-8?B?OG9RZnR0SUoySmFnOCtPMjRxU2lMY2pRZ09QN3FIczduTmY3ZmdzMTd5b2VK?=
 =?utf-8?B?Y2tsV2VDTlgyWFV4NG1DNWM4ZnAvbjQvdm9FTTdXM2R0QkJqclpWRGdYZlZZ?=
 =?utf-8?B?NGg1RWpJZ2lUd09Fb0x5WDZVWWczTUhzMGg2SjBabG9mUStPQnU0STFLVEEv?=
 =?utf-8?B?bkFreHVZRXdHK2hnMEV6SnFna0U2R1Q5TDlGbk9rdW9vVFp6Y0xrYStoQUxk?=
 =?utf-8?B?N3NMdENaTysyOXU2ZDVkSzFUZzFWRW03SzAwMXpVY3grcFpMNVdIQlVsZVZq?=
 =?utf-8?B?cGtzL2NFQXFHUm5MeUFycnEyNlZzT09tcXNXLzlHOTBCTUs5VUF3Y0Zld1B0?=
 =?utf-8?B?Yks1OEtUTFNkZkQ1MWV4TW9lV09MZWFTL0ZyTkFlTDJERVRvMlhqRkVmUG9l?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fadbaf0a-a861-487c-8f48-08daad7a7a88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 00:24:38.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJgBcGQigadR1uDabCMytwr4y42aOkTkcTBy1iuT2onhvJel3klvy8QeS7+gyzNns9rWM/WZs36A0iLbBkNPBsf1Bs6FhmDaEfx5u/Zqs04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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
Cc: intel-gfx@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/2022 3:28 PM, Dixit, Ashutosh wrote:
> On Thu, 13 Oct 2022 08:55:24 -0700, Vinay Belgaumkar wrote:
> Hi Vinay,
>
>> GuC will set the min/max frequencies to theoretical max on
>> ATS-M. This will break kernel ABI, so limit min/max frequency
>> to RP0(platform max) instead.
> Isn't what we are calling "theoretical max" or "RPmax" really just -1U
> (0xFFFFFFFF)? Though I have heard this is not a max value but -1U indicates
> FW default values unmodified by host SW, which would mean frequencies are
> fully controlled by FW (min == max == -1U). But if this were the case I
> don't know why this would be the case only for server, why doesn't FW set
> these for clients too to indicate it is fully in control?
FW sets max to -1U for client products(we already pull it down to RP0). 
It additionally makes min=max for server parts.
>
> So the question what does -1U actually represent? Is it the RPmax value or
> does -1U represent "FW defaults"?
>
> Also this concept of using -1U as "FW defaults" is present in Level0/OneAPI
> (and likely in firmware) but we seem to have blocked in the i915 ABI.
>
> I understand we may not be able to make such changes at present but this
> provides some context for the review comments below.
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index fdd895f73f9f..11613d373a49 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>
>> 	slpc->max_freq_softlimit = 0;
>> 	slpc->min_freq_softlimit = 0;
>> +	slpc->min_is_rpmax = false;
>>
>> 	slpc->boost_freq = 0;
>> 	atomic_set(&slpc->num_waiters, 0);
>> @@ -588,6 +589,31 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>> 	return 0;
>>   }
>>
>> +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>> +{
>> +	int slpc_min_freq;
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
>> +		return false;
>> +
>> +	if (slpc_min_freq > slpc->rp0_freq)
>> or >=.
> If what we are calling "rpmax" really -1U then why don't we just check for
> -1U here?
>
> 	u32 slpc_min_freq;
>
> 	if (slpc_min_freq == -1U)
That'll work similarly too. Only time slpc_min_freq is greater than rp0 
is for a server part.
>
>> +		return true;
>> +	else
>> +		return false;
>> +}
>> +
>> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
>> +{
>> +	/* For server parts, SLPC min will be at RPMax.
>> +	 * Use min softlimit to clamp it to RP0 instead.
>> +	 */
>> +	if (is_slpc_min_freq_rpmax(slpc) &&
>> +	    !slpc->min_freq_softlimit) {
>> +		slpc->min_is_rpmax = true;
>> +		slpc->min_freq_softlimit = slpc->rp0_freq;
> Isn't it safer to use a platform check such as IS_ATSM or IS_XEHPSDV (or
> even #define IS_SERVER()) to set min freq to RP0 rather than this -1U value
> from FW? What if -1U means "FW defaults" and FW starts setting this on
> client products tomorrow?

We are not checking for -1 specifically, but only if FW has set min > 
RP0 as an indicator. Also, might be worth having IS_SERVER at some point 
if there are other places we need this info as well.

>
> Also, we need to set gt->defaults.min_freq here.

yes, need to add that.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
>
>
>> +	}
>> +}
>> +
>>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>   {
>> 	/* Force SLPC to used platform rp0 */
>> @@ -647,6 +673,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>
>> 	slpc_get_rp_values(slpc);
>>
>> +	/* Handle the case where min=max=RPmax */
>> +	update_server_min_softlimit(slpc);
>> +
>> 	/* Set SLPC max limit to RP0 */
>> 	ret = slpc_use_fused_rp0(slpc);
>> 	if (unlikely(ret)) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index 73d208123528..a6ef53b04e04 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -19,6 +19,9 @@ struct intel_guc_slpc {
>> 	bool supported;
>> 	bool selected;
>>
>> +	/* Indicates this is a server part */
>> +	bool min_is_rpmax;
>> +
>> 	/* platform frequency limits */
>> 	u32 min_freq;
>> 	u32 rp0_freq;
>> --
>> 2.35.1
>>
