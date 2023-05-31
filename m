Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7844717265
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ABA10E456;
	Wed, 31 May 2023 00:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A0610E44F;
 Wed, 31 May 2023 00:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685492817; x=1717028817;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ko/26SkOIGbxjVZZNjo872HleXG+FYPxB6M10HmsHGE=;
 b=bOFZFuCxVepQxQvBI3e8FThZShWtEFG0YjQ7UqglC675ZjZHoYAr2f9N
 +6pAv6FWL3Xw3/v6KNs9kTkqNWgULTetm6xrYwmbf9auWo8JLxc46K8HC
 W2/ytZRzrSBCn6LM0tfS8oBCLHXVf3LdBr68Wofm03Nm5I7psC0J5dn3v
 Qg4jQO2LWYq4sVz+TH19ew6FaYoXxje9akvz8MMUitOT5GeLmoQxvE/MT
 aKv7CCTNuOGp+oxnj3v50uXjkrzwKorfgLVqpQo9LXLxTIYcSCB1qnOqA
 GRPXYgWpjGnBUklaYP8HdGguLUzRPaeid6D0EjGzBPIZAYLtpaOOum43K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="418574331"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="418574331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771777801"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="771777801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 30 May 2023 17:26:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:26:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:26:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:26:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaDqa8KFHKI8/G5cA6srxdc2dHB4ly/PsoiBjRO5/mGSVEGXeQjDiB2uhYN2SoTl6GB3hDBP9O06SaC78VFvzmL9x2EB77qr/epL/76f30SmHsBzJQ6KO1fht43hcpDcEfGJ2v5McB/TjXwc9LtE3G3mbtnrlugYu3IGNPj7KA9uE8pnPSS15soQnl9YKkJrP94AftmiaiZvkTJqtWcegGQ1ghR0Bean/Rkc11x7zD9oLOuXFUATaNrhumNUN/0y4mvxtFEzXci+fq4Sv90cEVFcCJqCPE6i5RGaKOTqZHiLn2LrPj5RmgIklfRjf5SNNbwYGl4/FE4qS6dEgz7fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwAxWfPaAfNC6Jjsnv/BsjZGtMM+OimLHHCD1EuprQs=;
 b=PzvL056nH8PX/17v7e7kJlXF0Q3QpVsybSYgmACygD4Bv8lBl63QWUGXglL3VmdGzv/4ITlmF8mrpgqqJjP0R+nu5O6WvGBPrb5iC4KV4nPhzAHc6gGTQrDLIO1icCzFtB0aZEOjckGiakDPss5q3wHaNPGYfvENOIYY4KZyXb3gAOYn7yjKLfkD6wA4JsS9plrNhIozdN7XWUnjz20KjqMvaJkXeAF3bV8srqv8Z11GgDP8tXLDqbYKRvA1i4BIVTACqnpqYp5pdhm25yyPuoSjzD8YRs2FXOkj8Rz0lgeZJeORPtpia8OlZghk/BrEd045AgajbROafjWc8jvl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Wed, 31 May
 2023 00:26:48 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:26:48 +0000
Message-ID: <f7ebea92-889a-37b2-9fe7-6d64790efe81@intel.com>
Date: Tue, 30 May 2023 17:26:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if
 the fuse says so
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-4-daniele.ceraolospurio@intel.com>
 <2dffc6ef-5981-8b6d-c580-44671d396c98@intel.com>
 <37ba47dc-b796-5ae0-b098-43b30ed5e4dd@intel.com>
 <25098541-912d-a699-5c73-b3c9bb621214@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <25098541-912d-a699-5c73-b3c9bb621214@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1680c7-a651-47a2-1a76-08db616db875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAeQXUB390j/12Pzzm72ZZdFlU7kggyeTnOtJPv+15d0t/keMzOlZfkMXC8GWmXuotC3kw2k7u0wg1wc9A9I9zUTMtWY2EQSX03UwSXxwZWw5kOs4UI0kma2VExfaG+pZ8sXxGOmIA7hr0GtuPRHFJzwEu2JDs66SMdhTFtMRnS8Jw4eWwUjLPMlUCCIc4ywJj+EGY5g+1BHA4QIuQpOHipub72IbGWLXIvURzrrnL3l4hRhlkkTk2hRn3K+GeBE7wKlsSd7jeQ/DhktFwuRuIKnpqYRmuMXbjnwJhF4h3shVo8IXH87Pz9j/GJpQs8mQ3ho8F8TsYm1zciGtUHIN2mtLv2/L5sGw5rZ9rhmFplryIEay5odmjNk8ncrppQeD3yLOKSdzEh7Xb/sKDMLrx6Y28qMCHO//NQzEDfE9DvKiYzKsu7dqh7pVv98fAMnE3aihbIIAE7l7UKiTFh5aIAzySAsvD9/OG03l4OEyR1QYDbW6qcLj0Odu7uVthl6D+lfQM+hh3Asi/pq9rYx+MTuxYExe52PNUwyCxEmotlVXLF2CjR6FhaE/2qfCRSxgnBB18Ry2uHSLRARDLicwOmsubEGOW0Sh8X9h+CgZhG5UNyj2lBcRC1sQyg73+i0YSM/RT5eshPvoQAYK8+YpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(2906002)(186003)(31686004)(6506007)(6512007)(53546011)(2616005)(5660300002)(8676002)(478600001)(82960400001)(8936002)(26005)(83380400001)(107886003)(38100700002)(31696002)(6486002)(86362001)(41300700001)(316002)(450100002)(6666004)(36756003)(66476007)(66946007)(66556008)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmtIcTNJMzdlTjJZbTAwQTFrajRqZW9NU2l2K0pLTFFRRUxNa0ovRDk4em5U?=
 =?utf-8?B?WlFFbXN0OXlScldyVW1zOHYwYlJua0d2R0xqWjdGUldOTE8ySktPMnJ4emM3?=
 =?utf-8?B?cUxEZ1dTcGtYaW5mbWk1NW5ySDJ6YllLY29HSDJvc0Z5S1dzRE1Fbmx3UHhN?=
 =?utf-8?B?bWtvcVA5STZ4UTZkemNHamZVbXNuU2tlZGVpdHlYRzBjRi85UWc5Q2s3R1Nu?=
 =?utf-8?B?Qll2aXJUdXZrYXBxUVVUUmMycGl5Y0Zrb1FsSkFPYWNvdXZXd2pNbmpLZm9q?=
 =?utf-8?B?Mkd2Vkw4SlFNM0VrcGlicW80aFpQYlF3OXJtWkswTG5SWEVISHFrdXlxb0dH?=
 =?utf-8?B?WHNudkZDOVhpT1dFdEZHVWFFTG5vWHF0YzMyZXdyUitsclJNQzVOSXF5TzRY?=
 =?utf-8?B?cXhud3E2V2UwajltR0tvaUxBNVh1NHJkSlZXeGNrS2lGU1BWOXlidko0eDNr?=
 =?utf-8?B?bTBnMnZsMnpsS1ppNUlXVXhoTVM2WnFOWER0WjF3ZUpGbHVrWDVJbFdTYith?=
 =?utf-8?B?TWp5OW03VXpQSHNqcGN2R3p3TzRiam14c2FmZnJNSXdxSzRpb1RNM09uajNM?=
 =?utf-8?B?RGwwMmJUcVNBWjJDVFNuRkl6L2JWNTg5NlVrU0VOU3NNMm1ibC95ZUh4WVZy?=
 =?utf-8?B?WFBteG4rT3NNK2pUa1RFWmUvR1p1Mkh6alNKZnBVaWpVcHltRS9XSzVxK2Vp?=
 =?utf-8?B?bjZsWTFOdWFVdDlsLzd4KzhzdHNaOWUzSE9wenhhaVdUOFRHNjhWTjlpQ2ZB?=
 =?utf-8?B?c0l6aVJNNHVjOHdpQ2FtWk13UEt1enlENWdVRjdXTlArVm5DVE04NGE3N2du?=
 =?utf-8?B?NUtuVDJUM2FqcnFEUGtrd1JlMnVYSnJFK3JYaU95ZGppdFdVanROR3BYdGMx?=
 =?utf-8?B?ckM5ZDZlWkV5OFZ1bnh1SmFBRnFXdmtxVjdMM08wdVFHbzBnem1oTFpXeWlL?=
 =?utf-8?B?ZEpGdXNCc2dFaU0yTWQrckk2UGpxTEhrUk9GZEpERVVpUVdiMnl5Z0xrdnFH?=
 =?utf-8?B?VktZVlFleG4xUXBsZDR2QkwzTGhpbVFGdU5CVmNCSllQcURZK3NOY0pXbGla?=
 =?utf-8?B?SGwwT2tuZTU1WFQ4MldnaFpQNXRYWU1uWk9Ta2R0bVFscHBBOUZFSUN3alpK?=
 =?utf-8?B?ZDI3dkpFWTUzMGdROVFJdW9wWFE4UE1LdGRySzlHcER3U2RaTjFoT1d2MlJS?=
 =?utf-8?B?ZDl4Ym8xTzJvUFhKU215MUNOMUIxT3F2ZEhWSjQycXNSa0NYalRGdnpmYnFk?=
 =?utf-8?B?UUlGVEkxK3c5ZlgyN2cyTFlsN2tJVE1rcytNeXFNem9zVE5Vdi9YQW04ek5W?=
 =?utf-8?B?OG04UDhta2pzcEFSYThBUEhzWEs4U1poOXFzeE82azJyOEdiR0UzcXhEeGpx?=
 =?utf-8?B?MnBGSHNNbmprQzNEeTZuODZBTE0xVHVjOVlkZ0N6YWtsVUtxVzgvZVFBZ0gz?=
 =?utf-8?B?VUI5OUYvTVF2eUpYOWFLWlE1Y0huNEF0d2pWSnZndkR4bFFHV2ZrcFp2ZVRn?=
 =?utf-8?B?VVh1Q0QxRzF5SHNNNmRGSHlwQjN1bzFlYnR4ek1jdGh6VHM3QnBGcldPTmtu?=
 =?utf-8?B?cEFOVHBYS3dGT00zUTdxTUhVVHUyQWRsVmptci8wMFVXem56bGpIREc4Y1pj?=
 =?utf-8?B?VHhVQmhJR255UFkxOFlSMDE0TE5qOU1LVitrNlI1MHkwbU9MQUZ1NVhaOGxv?=
 =?utf-8?B?eEZ5QUlpcmx0TisrT1hFSUxXaW1UTjNaMVJ6Qlkwa2RzRGZhTXV5N09xQlpt?=
 =?utf-8?B?WE5kTmJCNmhwQzVSdndVQkFDYkoxdUJQWWd6T21LeDVOTjUwRDdDM3o2MlEz?=
 =?utf-8?B?QWRBV2JQSmZPUHhZRERZOTRqRU51SDRDcUU2RzFWeHpvZ2Nrc1RJY3p4SEh6?=
 =?utf-8?B?d1Z6UzdVMitWeHMveXZudnVySnpHRDBGUG5HcUM5MHRqRmlzQ3hGY1VRYml1?=
 =?utf-8?B?YWFMUGl0ZG5HeHMvb2NlYklEdjMyVlhET2dxcmtvZytlZTRXUUV2dk5IWWVM?=
 =?utf-8?B?NTVxdDBFc0NmOUtsZmZxWUZyMFNCS2NZYlpCdEtGYWVKR1M1b1kwcjByRE1M?=
 =?utf-8?B?a0hjNnU0SnBDZ2RtUjRDcVdrQVIvKzFYODFlSE1pcDJoalUxd2gyOVFSUHpu?=
 =?utf-8?B?dnI3WHh4TUE0WnZ6SUhtNi9EVURSaXpiejk2Tm9KZ25hRG9kZ0VJd2gvbUN1?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1680c7-a651-47a2-1a76-08db616db875
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:26:47.8727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sq9soejEgz3WJErI5V1Xfihp6qC2jkNhuoQisCoU32f6vXdjJVCrZP/Q/EdFy2qW86oKlmgOWvM9NIlV3Mgd+h5xVRcv1MMUnJHnztB/Wkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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



On 5/30/2023 5:20 PM, John Harrison wrote:
> On 5/30/2023 17:11, Ceraolo Spurio, Daniele wrote:
>> On 5/30/2023 4:51 PM, John Harrison wrote:
>>> On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
>>>> In the previous patch we extracted the offset of the legacy-style HuC
>>>> binary located within the GSC-enabled blob, so now we can use that to
>>>> load the HuC via DMA if the fuse is set that way.
>>>> Note that we now need to differentiate between "GSC-enabled binary" 
>>>> and
>>>> "loaded by GSC", so the former case has been renamed to "has GSC 
>>>> headers"
>>>> for clarity, while the latter is now based on the fuse instead of the
>>>> binary format. This way, all the legacy load paths are automatically
>>>> taken (including the auth by GuC) without having to implement further
>>>> code changes.
>>>>
>>>> v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 29 
>>>> ++++++++++++++---------
>>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++++-----
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>>>>   5 files changed, 29 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>> index 6d795438b3e4..37c6a8ca5c71 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>> @@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
>>>>   static int check_huc_loading_mode(struct intel_huc *huc)
>>>>   {
>>>>       struct intel_gt *gt = huc_to_gt(huc);
>>>> -    bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
>>>> -    bool hw_uses_gsc = false;
>>>> +    bool gsc_enabled = huc->fw.has_gsc_headers;
>>>>         /*
>>>>        * The fuse for HuC load via GSC is only valid on platforms 
>>>> that have
>>>>        * GuC deprivilege.
>>>>        */
>>>>       if (HAS_GUC_DEPRIVILEGE(gt->i915))
>>>> -        hw_uses_gsc = intel_uncore_read(gt->uncore, 
>>>> GUC_SHIM_CONTROL2) &
>>>> -                  GSC_LOADS_HUC;
>>>> +        huc->loaded_via_gsc = intel_uncore_read(gt->uncore, 
>>>> GUC_SHIM_CONTROL2) &
>>>> +                      GSC_LOADS_HUC;
>>>>   -    if (fw_needs_gsc != hw_uses_gsc) {
>>>> -        huc_err(huc, "mismatch between FW (%s) and HW (%s) load 
>>>> modes\n",
>>>> -            HUC_LOAD_MODE_STRING(fw_needs_gsc), 
>>>> HUC_LOAD_MODE_STRING(hw_uses_gsc));
>>>> +    if (huc->loaded_via_gsc && !gsc_enabled) {
>>>> +        huc_err(huc, "HW requires a GSC-enabled blob, but we found 
>>>> a legacy one\n");
>>>>           return -ENOEXEC;
>>>>       }
>>>>   -    /* make sure we can access the GSC via the mei driver if we 
>>>> need it */
>>>> +    /*
>>>> +     * Newer GSC_enabled blobs contain the old FW structure 
>>>> inside. If we
>>>> +     * found that, we can use it to load the legacy way.
>>>> +     */
>>>> +    if (!huc->loaded_via_gsc && gsc_enabled && 
>>>> !huc->fw.dma_start_offset) {
>>>> +        huc_err(huc,"HW in DMA mode, but we have an incompatible 
>>>> GSC-enabled blob\n");
>>>> +        return -ENOEXEC;
>>>> +    }
>>> The comment above doesn't seem to match the check. The comment says 
>>> 'we can load the old way if possible' whereas the check is more 'can 
>>> we load the old way if we need to'.
>>
>> I'll reword it.
>>
>>>
>>>> +
>>>> +    /* make sure we can access the GSC if we need it */
>>>>       if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && 
>>>> IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>>>> -        fw_needs_gsc) {
>>>> -        huc_info(huc, "can't load due to missing MEI modules\n");
>>>> +        !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
>>> This test still looks wrong when you read it. I think it needs a 
>>> more detailed comment. Some kind of explanation that the modules 
>>> only apply to one platform and the engine to a different platform. 
>>> Or even breaking into two separate tests with an 'if(DG2)' between 
>>> them? It certainly confuses me every time I look at it.
>>
>> Is it clearer if I split it like this?
>>
>> /*
>>  * if the FW is loaded via GSC and we're not on a platform that
>>  * has the GSC CS, we need the mei modules to access the GSC.
>>  */
>> if (huc->loaded_via_gsc && !HAS_ENGINE(gt, GSC0)) {
>>         if (!IS_ENABLED(MEI_PXP) || !IS_ENABLED(MEI_GSC)
>>                 // error
>> }
>>
> It is guaranteed that if the GSC engine is present then no modules are 
> required? And that if the GSC engine is not present, then the modules 
> are all that is required?
>
> What happens if the GSC engine has been fused off? Or disabled by some 
> future module override, workaround, etc.?
>
> I thinking it would be both clearer and safer to say 'if (DG2) {check 
> DG2 specific stuff} else {check other stuff}'.

ok, will do.

Daniele

>
> John.
>
>
>> Daniele
>>
>>>
>>> John.
>>>
>>>> +        huc_info(huc, "can't load due to missing mei modules or 
>>>> GSCCS\n");
>>>>           return -EIO;
>>>>       }
>>>>   -    huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
>>>> +    huc_dbg(huc, "loaded by GSC = %s\n", 
>>>> str_yes_no(huc->loaded_via_gsc));
>>>>         return 0;
>>>>   }
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>>> index 0789184d81a2..112f0dce4702 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>>> @@ -39,6 +39,8 @@ struct intel_huc {
>>>>           struct notifier_block nb;
>>>>           enum intel_huc_delayed_load_status status;
>>>>       } delayed_load;
>>>> +
>>>> +    bool loaded_via_gsc;
>>>>   };
>>>>     int intel_huc_sanitize(struct intel_huc *huc);
>>>> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct 
>>>> intel_huc *huc)
>>>>     static inline bool intel_huc_is_loaded_by_gsc(const struct 
>>>> intel_huc *huc)
>>>>   {
>>>> -    return huc->fw.loaded_via_gsc;
>>>> +    return huc->loaded_via_gsc;
>>>>   }
>>>>     static inline bool intel_huc_wait_required(struct intel_huc *huc)
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>>> index 037d2ad4879d..3355dc1e2bc6 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>>> @@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct 
>>>> intel_uc_fw *huc_fw, const void *data, s
>>>>       size_t min_size = sizeof(*header);
>>>>       int i;
>>>>   -    if (!huc_fw->loaded_via_gsc) {
>>>> +    if (!huc_fw->has_gsc_headers) {
>>>>           huc_err(huc, "Invalid FW type GSC header parsing!\n");
>>>>           return -EINVAL;
>>>>       }
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> index 9ced8dbf1253..b752a7f1ed99 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> @@ -186,7 +186,7 @@ struct __packed uc_fw_blob {
>>>>       u8 major;
>>>>       u8 minor;
>>>>       u8 patch;
>>>> -    bool loaded_via_gsc;
>>>> +    bool has_gsc_headers;
>>>>   };
>>>>     #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>>> @@ -197,7 +197,7 @@ struct __packed uc_fw_blob {
>>>>     #define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>>>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>>> -      .legacy = false, .loaded_via_gsc = gsc_ }
>>>> +      .legacy = false, .has_gsc_headers = gsc_ }
>>>>     #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>>>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>>> @@ -310,7 +310,7 @@ __uc_fw_auto_select(struct drm_i915_private 
>>>> *i915, struct intel_uc_fw *uc_fw)
>>>>           uc_fw->file_wanted.ver.major = blob->major;
>>>>           uc_fw->file_wanted.ver.minor = blob->minor;
>>>>           uc_fw->file_wanted.ver.patch = blob->patch;
>>>> -        uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>>>> +        uc_fw->has_gsc_headers = blob->has_gsc_headers;
>>>>           found = true;
>>>>           break;
>>>>       }
>>>> @@ -736,7 +736,7 @@ static int check_fw_header(struct intel_gt *gt,
>>>>       if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>>>>           return 0;
>>>>   -    if (uc_fw->loaded_via_gsc)
>>>> +    if (uc_fw->has_gsc_headers)
>>>>           err = check_gsc_manifest(gt, fw, uc_fw);
>>>>       else
>>>>           err = check_ccs_header(gt, fw, uc_fw);
>>>> @@ -998,7 +998,7 @@ static int uc_fw_xfer(struct intel_uc_fw 
>>>> *uc_fw, u32 dst_offset, u32 dma_flags)
>>>>       intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>>>         /* Set the source address for the uCode */
>>>> -    offset = uc_fw->vma_res.start;
>>>> +    offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
>>>>       GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>>>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, 
>>>> lower_32_bits(offset));
>>>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, 
>>>> upper_32_bits(offset));
>>>> @@ -1237,7 +1237,7 @@ size_t intel_uc_fw_copy_rsa(struct 
>>>> intel_uc_fw *uc_fw, void *dst, u32 max_len)
>>>>   {
>>>>       struct intel_memory_region *mr = uc_fw->obj->mm.region;
>>>>       u32 size = min_t(u32, uc_fw->rsa_size, max_len);
>>>> -    u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
>>>> +    u32 offset = uc_fw->dma_start_offset + sizeof(struct 
>>>> uc_css_header) + uc_fw->ucode_size;
>>>>       struct sgt_iter iter;
>>>>       size_t count = 0;
>>>>       int idx;
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>>> index b3daba9526eb..054f02811971 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>>> @@ -120,7 +120,7 @@ struct intel_uc_fw {
>>>>         u32 dma_start_offset;
>>>>   -    bool loaded_via_gsc;
>>>> +    bool has_gsc_headers;
>>>>   };
>>>>     /*
>>>
>>
>

