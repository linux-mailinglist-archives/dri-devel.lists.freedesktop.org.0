Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB184CC5B0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 20:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0590E10EED3;
	Thu,  3 Mar 2022 19:09:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3389610EE45;
 Thu,  3 Mar 2022 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646334573; x=1677870573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s/Ku+/KwFBwnIqFpZPkwplqqS0Mco/JIyMaYfcQy708=;
 b=BgPQ4+EJpPpQMfR4JghokrEZYhJ9Ai/sW0zNGB8HXzhhfSkfihV6K6R7
 pUA9ShTlUTU6br7Y9GnHgQqyg/iA5XaImKdDXAb7oYo4HG671DIldSM3v
 hDE32xGP5EVxSP1PSftyonw2epqxngeXbbE4EJ/UsQmlnw6BR0DikT9YU
 odxzoMYrigkctz2X2/+bJOzSafFJqc7f9U4soGNTWi04PF2KoI8Nk1PQf
 BAHJ3Th1S0vF+bw37K6f+sgEe1NRfVvo4SaQhd4jeRmRziLp05xX7eWoQ
 GgFMZx6YBnvPJG2NmrQbSanP8yhehSET0N0IgA+RfMyuvVK5VUFRQ+JBg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="317007102"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="317007102"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 11:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="609688879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2022 11:09:31 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 11:09:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 11:09:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 11:09:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9R+MeGmxqi4Yqf3t5gFqMbLUlWRkzDZsJZjVi0i/NJEKWEONeL330DsDsIMJcYKLbTAEowJA3tEiB/Fnh7exEt0cqNfhurxTiDalt2iSI1V7AqVdhL6/6tpoKWiQogVx+A4/J9ctxAjw+p3v1Rzq9Aj1tIOQgTSDRlO8qEmid/TLwR+oHCBma3od72QaEqFulRmALU3RXIVNh/2PItbCkBURZT7XRtWsWFn81tCYQIFnFF6L6O9cMG2ArFQ69155EvN+sVmBSFaiGvmlFRHH6juVV9LZG9M+rBZVHeIBrEbFdOKegCpoUw9zl5H5CHPS+NZtOvgqB7yRALSxar3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fydyyDw6LcLliNhDlMEc0VAk5HSwMuejFmsyhQBre2o=;
 b=INzLA8oxw3/OEETahmmvyf5VODDd9pwzcaWb1TrKymeSlRszHTU4EVpEbwlNMRE94XDCY0CLPVxd+VOQgpJae5afyG0k5FsXeMyni5nUIVFI0jPsAFQOneC881ISN57osOfVkoCNjfxF3113HitTItLgmCMNC8eghG33ild61v7gQkZaWIfnLjUOvpc41kHLOSYiXA9i6ICgMcZBtZezvruMtmEY6zw2b6a9L0/mpMlP/UuS94dbZ0banaaW2uiaZxeotL9pHPxMDSFsQGyD6KUoOY6MfNpccXgLztagA2rHpvslU2PG7+D0jOUVxKnjKzTdoMAKmCrrZ9ipm1Meqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN8PR11MB3681.namprd11.prod.outlook.com (2603:10b6:408:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 19:09:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:09:25 +0000
Message-ID: <711fbb74-e6fd-c78b-5c01-9cb1d1b6d624@intel.com>
Date: Thu, 3 Mar 2022 11:09:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>, "Bloomfield, Jon"
 <jon.bloomfield@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
 <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
 <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
 <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
 <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
 <8fb0a3a7-7968-79cb-9ea1-e31b0593acaa@intel.com>
 <42b114a7-04ea-71eb-7cd6-507fb4fb1655@linux.intel.com>
 <389c16df-f579-81df-8405-376fcf8ce613@intel.com>
 <f9daab55-6bda-b359-352d-8e585bce899c@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f9daab55-6bda-b359-352d-8e585bce899c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8726561a-fc50-4d34-e6e9-08d9fd495527
X-MS-TrafficTypeDiagnostic: BN8PR11MB3681:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN8PR11MB3681EED91574B5F43E053E21BD049@BN8PR11MB3681.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxYDNOWI8s4wWxPvPR8nRM6NTRDus2LIRC9oiZ5nGUYWUmMr/wInaAA1rb/uryeC+UK/6TqYQzKROWjoH+FAfxQGA3ulRrNl1VY96ojcAcc4OZz4s/Mn3rgCJ4V86yzlbpJ7qhwF15dvYavyWKq8PZqSbX9BTNBA4o14jHkmXodOIYgJNnYYthCtnmYVPm76KlrL4pnoC8dIxPJuHSLE4bdVnPfV74wDbz+aSIClcHJ+qavvy2Azs7AZgiWk5q4zjTiPemeckIOFEyShjVzBNwlDdmqsuCiVKZuEYTGd9vvuWAXWCmphpo9pvNReTyUiytNlgLJygE3VwbQ3vt21BdE5nFCmY2f4Ewi29IYJHI2yA5AijRDxbGGj+pOyrrM1IccSnRr5EHnBjx5b+OfWOKNLS8gexwbBrJHx9vnK+KnTwX03Jf37XFq7cctSoE9Eo9ADToGPgy5kfA33SY0A9nBeg5Xb/IS/RK+W7h1bnUSm1Ab7XDVz6CipOK3brgQOkG7ErK0DrkVY2UyqbcVPcuxLgrUUxV/xquW5GYE53IeG/Ntrgk1wPe+0t25ANNWc9rAJo8EXJfYpGnGJSlzIIGtq19EFDu501g1KEAG6zr+Zo4EN6E5z39LLzg7jTgNvQqNPERq4ubJARizQJnROh3LpNeRgkC1sG+7UwsyADDvR6uSpWbcvUzYDmnyCrfYWkFsG+MykgbfSchUdzY40nOPXIHpdxDU8RC15FNofuHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(36756003)(8936002)(8676002)(4326008)(66476007)(66556008)(66946007)(31686004)(2906002)(6486002)(508600001)(31696002)(5660300002)(6636002)(110136005)(38100700002)(316002)(6666004)(6506007)(53546011)(82960400001)(83380400001)(6512007)(2616005)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBEdGVlTGNweDhJbW1qTGpab0RHU0tmd3hCaGttWVg4VXJhUEtNa3FtMHJv?=
 =?utf-8?B?S2FZcGZJTFo5NzBWc3p4U0lTbUd5UE5nMzAwMmNFaS9CYVlGMTZxUkFWc1gw?=
 =?utf-8?B?Z1lZNHRNVXA3QmZWT0tHd09sT2VtbDdnbW8wM3drSVNWMWRMV1ppSjNZNWV6?=
 =?utf-8?B?OUEyVlhuLzJmVXVEWDVjRGQ4T1F5NklUaWNBUkh4SGVScmlpMERMZU9lV2ZX?=
 =?utf-8?B?YS9scGlPUTBGZVB5OHpiQnRnUUtZdi9RTjd2QWhHdi9DbHRhY1Bob1ZwUWh1?=
 =?utf-8?B?WTdNL2grVkZJcjJLdDI4Qmh4TUU3TnovWlpJWFE5UjZ4dFNzanNUTTFlNjZx?=
 =?utf-8?B?T3VmdzZWOXZPdm9oU3FKL3hUWkNuL0lIYkpIZ3pUbHlJc3NNYTFnU25nNVdK?=
 =?utf-8?B?enc2ZjVTR3FVdktsbU5ndWQ1aUtvTTlnT3dZNitnQllXMGcyNnVXblhHM2E4?=
 =?utf-8?B?Wmh0WGtKNjNlVzFKSktPdmtCRFVueTl6QUUxNCtwajFZTUtmc2U5cjM5eldt?=
 =?utf-8?B?MG01VlVndXIxS3dDaGlMYmVmMHlmRXdYUlhKV1ZJdGhTL3F2eTBEQVF3UzBm?=
 =?utf-8?B?WG1iUDBtTFJ4YXhiaW55LzNseWlIcGc5T21ZQ2J3S0FRU2huOU9lRnF0eXBG?=
 =?utf-8?B?OE1OMUdoeVRRanFGZW1wT2E0T1pkMi9ZYzZOTGJ2cmVjWm1XMkRXcnJkTFFs?=
 =?utf-8?B?YmNzeS9mL2grR2p5eUkrWlhqakxaTm0wYS9Tdnd0RlRKWStzT3V4ZEd5YTd2?=
 =?utf-8?B?Tkd4Snp1OHpFcFBjQ1dyd3JGVHAwK1JhckVVNDZaZFpKM1ZlVTYyMWtPOTlJ?=
 =?utf-8?B?V3F0S2RJbWs2V3lRODdQYUtCZ1QvbTRYTGtTSmtpTHhqRTgvY252OEUxejZ5?=
 =?utf-8?B?blNRZGpZb09HZnltT3R0Q3RHWHY1V2gxUnRwYTc0MU5SMU9OeXVDUWhBNUR0?=
 =?utf-8?B?OUtLcjlLTk52MFF2cjZDZWlVcXpjQlhQa3JvVzhoL3pLdFlNMWRKM2tUV0ll?=
 =?utf-8?B?NkdQYk56THdFRUhSYjM4U1JNVUVrbWQxSy91RXRtWkNGcHFzckFGM29lYUJV?=
 =?utf-8?B?R1dHL1Rkd3FQWWw3NTNRdFZZMnpYakxVaVdiWHJ4Y1dHb0hjanRlK1ZQbHBs?=
 =?utf-8?B?WnpRanZiNDZMVGdJSFZxd1djRVlmdy9MbGdzb003N2I3WjJIUklucU1vbzkx?=
 =?utf-8?B?YlZzdGJId0tmODlvMTFkUXJtUFgyN05nYXVIbDBBdXN4WklidFhYaHkrZkJQ?=
 =?utf-8?B?VktsSnlCR1l2cTArVDVSaWJIRzVhT3JURkZqYjdwSVczVXJQb2NyT2JIVXNq?=
 =?utf-8?B?dlFzZXR6bDhaSnVlc0ttZC92VDdHdHliS2F3Q3NMZ254SFlDRXlwdTZLMnAv?=
 =?utf-8?B?QmNTT1Q5K0diVUJ3bW5iQ3ZyTTlMT1JpcG1SbVZ2Z2k0OWw2UmJGTEF1N2FM?=
 =?utf-8?B?cEZiZVZ6UlQ0OEFZMzBtOFkrTjBYOS9STGYrMFlZUm9sWFNGbGxmWE9HcFNX?=
 =?utf-8?B?NHJOcE1IdjUxbldObExhMmVkTnFPNit6SktpZFNEUmlXeDZHQ3R5MU1GVlhy?=
 =?utf-8?B?WlpCTFE0SWsxRlRLS05saUZoaW5oU09SWDhBMnBTSXBYTUVJVEo0QW5DQkZX?=
 =?utf-8?B?K0s2TTVFdU1iL2VLeGlMa0EwR2gzMlFxYUhHQ2RpVmt4ZWtPT2g4UmZjRGJ0?=
 =?utf-8?B?NWoyWGpkR1Z2dEdxem5TMjA1OW1TM25xMGMrWFdBdytQK0ZwNHhtMEttSEhT?=
 =?utf-8?B?OUhudkZsUFo1TyszZWRFOTRxbXNFY0JKOE5GTjluY2tZbS9XTEQxT3FXMkEx?=
 =?utf-8?B?UnZlU1FNRXV3Q01pYXBTV05sNFE1VndUVE5iMHJhK2dXUkV3b05TRXlxQWhL?=
 =?utf-8?B?SFNjTG5iWjdOV0I3dG1MMUlldld1S1FVc1Y3cTVScjZITGM0WHlEK1ZVcDE5?=
 =?utf-8?B?WTdoSzdacVBwb2tXdjNCYjhqSHBHcEtQNmdFaFh3MlYrQ1VJc3hvdjlwcE1B?=
 =?utf-8?B?ajZJa1FKSmp6Nmd5T3NnbDVkS0ZJa0hvMEpDZ28ybkJFbnBqMHZzNHpaYjdx?=
 =?utf-8?B?aTNhS0JBRGQ1a29RN1NkNDRsaXcweTdiM016eHVjS1lvYXA3K2VLaWt3TkVC?=
 =?utf-8?B?SkovT2crS0NOL1pQYmVXZ3JiM0IxOHJTSEtzNFFDVHBNUENvSGw0TGZvcGxZ?=
 =?utf-8?B?bWl2ZGxqenhLelllcitZa1YrRmw0dDI2czhyYjRTSGp0YWl3OG9FZ2hOK1Y3?=
 =?utf-8?B?Z0hEcktvdGVZdHlwWE5vOUh3K0RBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8726561a-fc50-4d34-e6e9-08d9fd495527
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:09:25.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vj691xK9ydqyFBxi1Cd8az0garWLZ3o2n3c7IWbTU3X6CzkovycYdfIzub7Vi4OA6o23LyFor2+grmN6/HUdJMcDwAdk4ZZL/Zt11Hg90nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3681
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

On 3/3/2022 01:55, Tvrtko Ursulin wrote:
> On 02/03/2022 17:55, John Harrison wrote:
>
>>> I was assuming 2.5s tP is enough and basing all calculation on that. 
>>> Heartbeat or timeslicing regardless. I thought we established 
>>> neither of us knows how long is enough.
>>>
>>> Are you now saying 2.5s is definitely not enough? How is that usable 
>>> for a default out of the box desktop?
>> Show me your proof that 2.5s is enough.
>>
>> 7.5s is what we have been using internally for a very long time. It 
>> has approval from all relevant parties. If you wish to pick a new 
>> random number then please provide data to back it up along with buy 
>> in from all UMD teams and project management.
>
> And upstream disabled preemption has acks from compute. "Internally" 
> is as far away from out of the box desktop experiences we have been 
> arguing about. In fact you have argued compute disables the hearbeat 
> anyway.
>
> Lets jump to the end of this reply please for actions.
>
>>> And I don't have a problem with extending the last pulse. It is 
>>> fundamentally correct to do regardless of the backend. I just raised 
>>> the question of whether to extend all heartbeats to account for 
>>> preemption (and scheduling delays). (What is the point of bumping 
>>> their priority and re-scheduling if we didn't give enough time to 
>>> the engine to react? So opposite of the question you raise.)
>> The point is that it we are giving enough time to react. Raising the 
>> priority of a pre-emption that has already been triggered will have 
>> no effect. So as long as the total time from when the pre-emption is 
>> triggered (prio becomes sufficiently high) to the point when the 
>> reset is decided is longer than the pre-emption timeout then it 
>> works. Given that, it is unnecessary to increase the intermediate 
>> periods. It has no advantage and has the disadvantage of making the 
>> total time unreasonably long.
>>
>> So again, what is the point of making every period longer? What 
>> benefit does it *actually* give?
>
> Less special casing and pointless prio bumps ahead of giving time to 
> engine to even react. You wouldn't have to have the last pulse 2 * tP 
> but normal tH + tP. So again, it is nicer for me to derive all 
> heartbeat pulses from the same input parameters.
>
> The whole "it is very long" argument is IMO moot because now proposed 
> 7.5s preempt period is I suspect wholly impractical for desktop. 
> Combined with the argument that real compute disables heartbeats 
> anyway even extra so.
The whole thing is totally fubar already. Right now pre-emption is 
totally disabled. So you are currently waiting for the entire heartbeat 
sequence to complete and then nuking the entire machine. So arguing that 
7.5s is too long is pointless. 7.5s is a big improvement over what is 
currently enabled.

And 'nice' would be having hardware that worked in a sensible manner. 
There is no nice here. There is only 'what is the least worst option'. 
And the least worst option for an end user is a long pre-emption timeout 
with a not massively long heartbeat. If that means a very slight 
complication in the heartbeat code, that is a trivial concern.


>
>> Fine. "tP(RCS) = 7500;" can I merge the patch now?
> I could live with setting preempt timeout to 7.5s. The downside is 
> slower time to restoring frozen desktops. Worst case today 5 * 2.5s, 
> with changes 4 * 2.5s + 2 * 7.5s; so from 12.5s to 25s, doubling..
But that is worst case scenario (when something much more severe than an 
application hang has occurred). Regular case would be second heartbeat 
period + pre-emption timeout and an engine only reset not a full GT 
reset. So it's still better than what we have at present.

>
> Actions:
>
> 1)
> Get a number from compute/OpenCL people for what they say is minimum 
> preempt timeout for default out of the box Linux desktop experience.
That would be the one that has been agreed upon by both linux software 
arch and all UMD teams and has been in use for the past year or more in 
the internal tree.

>
> This does not mean them running some tests and can't be bothered to 
> setup up the machine for the extreme use cases, but workloads average 
> users can realistically be expected to run.
>
> Say for instance some image manipulation software which is OpenCL 
> accelerated or similar. How long unpreemptable sections are expected 
> there. Or similar. I am not familiar what all OpenCL accelerated use 
> cases there are on Linux.
>
> And this number should be purely about minimum preempt timeout, not 
> considering heartbeats. This is because preempt timeout may kick in 
> sooner than stopped heartbeat if the user workload is low priority.
>
And driver is simply hosed in the intervening six months or more that it 
takes for the right people to find the time to do this.

Right now, it is broken. This patch set improves things. Actual numbers 
can be refined later as/when some random use case that we hadn't 
previously thought of pops up. But not fixing the basic problem at all 
until we have an absolutely perfect for all parties solution is 
pointless. Not least because there is no perfect solution. No matter 
what number you pick it is going to be wrong for someone.

2.5s, 7.5s, X.Ys, I really don't care. 2.5s is a number you seem to have 
picked out of the air totally at random, or maybe based on it being the 
heartbeat period (except that you keep arguing that basing tP on tH is 
wrong). 7.5s is a number that has been in active use for a lot of 
testing for quite some time - KMD CI, UMD CI, E2E, etc. But either way, 
the initial number is almost irrelevant as long as it is not zero. So 
can we please just get something merged now as a starting point?


> 2)
> Commit message should explain the effect on the worst case time until 
> engine reset.
>
> 3)
> OpenCL/compute should ack the change publicly as well since they acked 
> the disabling of preemption.
This patch set has already been publicly acked by the compute team. See 
the 'acked-by' tag.


>
> 4)
> I really want overflows_type in the first patch.
In the final GuC assignment? Only if it is a BUG_ON. If we get a failure 
there it is an internal driver error and cannot be corrected for. It is 
too late for any plausible range check action.

And if you mean in the the actual helper function with the rest of the 
clamping then you are bleeding internal GuC API structure details into 
non-GuC code. Plus the test would be right next to the 'if (size < 
OFFICIAL_GUC_RANGE_LIMIT)' test which just looks dumb as well as being 
redundant duplication - "if ((value < GUC_LIMIT) && (value < 
NO_WE_REALLY_MEAN_IT_GUC_LIMIT))". And putting it inside the GuC limit 
definition looks even worse "#define LIMIT min(MAX_U32, 100*1000) /* 
because the developer doesn't know how big a u32 is */".

John.

>
> My position is that with the above satisfied it is okay to merge.
>
> Regards,
>
> Tvrtko

