Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B19437C7A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 20:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA466E7E2;
	Fri, 22 Oct 2021 18:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ABF6E7E2;
 Fri, 22 Oct 2021 18:09:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="209459182"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="209459182"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 11:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="553414671"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 22 Oct 2021 11:09:37 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 22 Oct 2021 11:09:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 22 Oct 2021 11:09:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 22 Oct 2021 11:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZuIi+CIXDRd/3ydWoEqnpIc9BNkYYXU5daUhutbQtpLrpU5oIk8Ew/It8n8lQSWLpGA2ZpcFT8QtDpvNnsIwBZqUGASdoLzdDz793u+/o7vutZ+5t2lvkRaEm5XVWUYHdC4j3sQ4wDNqZ6n7zgcRrwR26Q8MJiNOrAF5nZcsg6xY5THJPjuRjRYyGl4dBizh9+GBNtuNQsrvNvYldka/WyqCfym2Z0vzbC2WfXn4qBYNZzEuySY9yA2OhhCvTPaqmwERVdQe9bo+1SUJd+EzleiFYk9kca/ijRM3pFonzz+KfQm3rpcuGfeuOdxPH8LdYJJPX5/VNr/Nk/LA9kuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93+SEoAKzMLhZDSQppXVgCoLGuuFZQLHkFPOQ0WkMS8=;
 b=KxskMOnse8jQpG9mK3gkQ2xDKrAk90vRtrLiX8LFRqHZ5Ej85crOvgBjAcgeweKJVVWHh+SyeXKrERRW3uX5JyCp7iBPy2QQbhxWkopkcKDnuUoWHt0TFPHKiaNdvSxDiw8qoyQkFGcEG6fExaDk55snOrhbCtj1ebPY/16hi1tiQSZsZbTOZbre/GILqpONvkLE4OylHFMvNncvwdizfGAg34Tj2MiLBgoqYWo16G6cqi9bVIRM+gsleYz4hKEwao1O05DGLIMaf60Nopf8PqocWL4rFm6KptMiiH12nKasaWtwTxF+xsqyqVxqhJY/4LxzSksBEInTL6RYAfMsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93+SEoAKzMLhZDSQppXVgCoLGuuFZQLHkFPOQ0WkMS8=;
 b=KSnUufMzHO5iFJS56AbEiHl7nQSIT7Ao2N/VFprRpKAweHMHmlsSgVRNHLcXqFoYMFeHf7T0LLkTf1D/yN5xGx5jO7SBRkH9Be3mYnvp5zmXVMBm2B3+rjvTUMUlxwRA8lU5aeQYaJCTqj0JQQ3390RhuhgY0FSY6vg8dYeO4So=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5612.namprd11.prod.outlook.com (2603:10b6:510:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 18:09:35 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 18:09:35 +0000
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
To: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=c3=b6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <20211022170356.GA23182@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <070ab480-6306-653c-514a-6648ac495253@intel.com>
Date: Fri, 22 Oct 2021 11:09:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211022170356.GA23182@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0329.namprd03.prod.outlook.com (2603:10b6:303:dd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Fri, 22 Oct 2021 18:09:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 483981a7-2fde-4d71-b534-08d995871ab4
X-MS-TrafficTypeDiagnostic: PH0PR11MB5612:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5612EFC9B4D06FA2087C761FBD809@PH0PR11MB5612.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MVfzVNMPhS87iXJt9Q6BPeZspNkmBN/AXKXj0GVfm5uCk7bVgUt0DSj7v8myXdjpPwJDUQnRvk4bs8KH5jzkis+ZuFDhEXxtM2XdRcBN1KKE7vVjp9TK5ChwtutY7vRyR9znSZLRxvRTbSfFK8lCdPXLcs7rzZGvp2KD6I8JIL5fLMlyafxnw2Bquj5V2+oFAk3jHMYzo2viD5gh/qWUJao68b/9AaJSADnLkvcEpvTwtDnFnNki+NRZ7knibL87eJqENOFqn2NxiGwHMFxqJPQBRPBs0NNM/5xrc3NTme8s3idVW1rhB62sHJxmVBST7X0QPFX4qTJ8z+Gz/OUe9EAGWRGEzdVkO0DajCJwLgDEdcfDq+WP80G1LYIZxdMOYryl5RdDeCGezV3jNrHG/TyXYEZfCZ3vskfKDG0+QlgBs2xThwZl21Wz6Vy0dE7iMep3qT4/QYSZRc6sATNA3sV84yKwYdtDlx63CSkBMCbWKkZlumUpLGkc+3H7AAhMz6ixSji57AOHUyn9J1Grby+ukgtgt3k7ZjyzDpVvmfx3HZkyd22nRgSMlslYeCeHtBE5nYmV5+0bH18MvUs0wpY9oXC4zb5spCkhnBdM47s2eeo1WRuratX3lMwhpG7xZBIyw5DcDVGnMnBOqEOwfD9mw4/vHJknsvSSYIO5Il74baLLv5btymK+Ug/kxxvtj05IIulzNfdZq4sR6yjcG4ejePYxCfIcKPUlqswX3v52IAB/23r7vxKuaIErGNg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(53546011)(5660300002)(8936002)(16576012)(86362001)(508600001)(316002)(66946007)(26005)(31686004)(36756003)(6486002)(956004)(2616005)(66574015)(4001150100001)(38100700002)(82960400001)(186003)(31696002)(110136005)(8676002)(4326008)(66556008)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdNeHNRRjFlTDI0ZE1SYk1LRWM2K3N0eHhlN3FDUmdnQVNLYktOOHMyTUJF?=
 =?utf-8?B?THZzY2xNWWI1Y0tnWVJrc3U4cnIxUG42UWZZaE5TUlRvbWI2R29vVzJURDNu?=
 =?utf-8?B?SVF6NkQ2QXNWTTBzcmZuanZ4NzJRYjkvSFNndlZZWlFDL2lpcW51R1JyazRi?=
 =?utf-8?B?amkreFpGVlNRNTJUUHNEQzZxTGF0QWtzb29zelduNjhRRUwwWHVGTUFPNjAw?=
 =?utf-8?B?a1ljRnprSGRneWc1dU5FUzhkL1VNRWlIaVRaenNKZkN5TmJCSFI0MU5oUkRT?=
 =?utf-8?B?dDZLdHorcmdxd01hUXQ0KzJoY2lEdHFpZkVMVS96RVA2SWJKeHUyRmsva1N2?=
 =?utf-8?B?S3NhRVlqUlBnMmZDVDNZeENwZ1U1dXFmYmNtb0JRWklGbWpVUjBWUW40NXUw?=
 =?utf-8?B?QVRSdGk3bktNaTFkOHlqb29DWjc3dW04M01FU3JQVHRHeVluL2NheFR0d2VQ?=
 =?utf-8?B?bHVZWlJ3STlHL2FFaXFMa3dhYzNoQTA0Zm9DZnJPRC84K2R2NVdMYzNKM2Zx?=
 =?utf-8?B?QjhDbjFIdHA2dTBoeFU5NUVZQWZpZkRLQ1JPcFl4ZHdyWGJwK0FTT1htRmpP?=
 =?utf-8?B?RTFxY2V0enZCWmdLRjNCc3BDY0VQVzRsdFZkZWlkcGE1UFMvQ0piNVpXbWw5?=
 =?utf-8?B?aDhYZC8zNWVYOUtDaW1PY29lK0JXWEVXMUN2WUtrRTAvZGRJaldBR2dnK2Vn?=
 =?utf-8?B?b0E1MDR5dkhNTXhJdnhlbGxDbTczNWMyR0w3dFhscTN0c0JDNmxsemRlWEtC?=
 =?utf-8?B?c3gzMTY3SWR0dGx5cVVwNllWS214a2c5VFd2eGZJRk14dHJTVVdLUmhBT1g5?=
 =?utf-8?B?WXp6L0ZIZjYwOGxMc0F6S0pZTUtFNXVMQW02RngrMFhBUTd3K1krUnhadWdG?=
 =?utf-8?B?WkpPUk9IK29kK2VSOTdoSkViajlwN2lyMlVHQ0NSU1Zva1FrRHRqeFFRckVL?=
 =?utf-8?B?L2xxL2JiVW1qd2d0QnJWaVhmbDRrTjRkd2h5V0dUT1p3YUZ3b3NUUS95YWVF?=
 =?utf-8?B?dXlHcXlKb2JoSG5qRjNNcDErbnVqWmpBSnlrb3RBdDdWYk5IKzdVYU1Tc0lx?=
 =?utf-8?B?YVVpT281ZnlpSFhZaVQ5Wm41SFN2Y2dQSURoM0tQbmpYR25tV0U4bmNjckVk?=
 =?utf-8?B?N3c3Nlhma05PSFJ0aFhMMWhXMWhzejZwL1p2dzBuMitxaGxpSk1mRFZxcG1Q?=
 =?utf-8?B?RTdVRzhlYmpkYzRtN2F4VUlTTlh3L0tGQ2JyU3phRDVJS1RZY3E4VjVpaGll?=
 =?utf-8?B?Zjh6Sm9wWHR1aFJ0ZEIwY2EwdnlrL3lwK1JqWWduK2dzZ1pxTHNUMGZ4WGUz?=
 =?utf-8?B?dU15U3UzNWZMdVQ3YnZYcTdzY2NjVTAzcTRDNi9KeVk3a0t3R3pCYzR0R1hU?=
 =?utf-8?B?emI3eCt3TjNhR0xwa1lySjRBN3RGV25sMG0vTTlqNy9kYU5mMVRGTllCTkRP?=
 =?utf-8?B?U1hvWldJOGdBdWlMd1hPWVBlUGNVSGg5QmU4cXN4UDBsQklvakN4cGJCckhE?=
 =?utf-8?B?WlhvTmJqOHoxait4eUEvWU45NGZMR3kvZjhMWFB6Tnp5NlhyUDZLY0pDS3c1?=
 =?utf-8?B?cGNqcUhQbEJ3VzFGMDkyYXFsaG5PV0VaTldmNFZnL3F2ZFZIVFRqRWk0eGMr?=
 =?utf-8?B?ZVpPckVObVlzMCtmczZxeHo2YTRtOWRMaGh4eHZIY2h4VHF1akJ1NzJRM2xE?=
 =?utf-8?B?M0pTMFI1U053K2RiSjlMUHU2c2lxWlU3UGV1V0RGRFBLQlU3UEZPSFk0SDRk?=
 =?utf-8?B?aytlalBvbDg5WUdxWnFzb3ZBbXRTZktNdG5qWnFTano3MzZ1V1Eya2swQWcx?=
 =?utf-8?B?cWo1VUVVS1lPOFBNZlVsYUpFNFVCdzU5WElHUkI2clU3Y1FKdXVrQWQrWk9Q?=
 =?utf-8?B?Z2k5Q1ZNUE5JUGhOUFhiVnBEODNoZ20rcFF4WHY3dHhzN3JyUkFHdDZNaFd0?=
 =?utf-8?Q?/YgsmqhVcTQhjBvfIhXA2Bc4nLtVk+Hg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 483981a7-2fde-4d71-b534-08d995871ab4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 18:09:35.1845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: john.c.harrison@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5612
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/22/2021 10:03, Matthew Brost wrote:
> On Fri, Oct 22, 2021 at 08:23:55AM +0200, Thomas Hellström wrote:
>> On 10/21/21 22:37, Matthew Brost wrote:
>>> On Thu, Oct 21, 2021 at 08:15:49AM +0200, Thomas Hellström wrote:
>>>> Hi, Matthew,
>>>>
>>>> On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
>>>>> The hangcheck selftest blocks per engine resets by setting magic bits
>>>>> in
>>>>> the reset flags. This is incorrect for GuC submission because if the
>>>>> GuC
>>>>> fails to reset an engine we would like to do a full GT reset. Do no
>>>>> set
>>>>> these magic bits when using GuC submission.
>>>>>
>>>>> Side note this lockless algorithm with magic bits to block resets
>>>>> really
>>>>> should be ripped out.
>>>>>
>>>> Lockless algorithm aside, from a quick look at the code in
>>>> intel_reset.c it appears to me like the interface that falls back to a
>>>> full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
>>>> is explicitly intended to not do that, so is there a discrepancy
>>>> between GuC and non-GuC here?
>>>>
>>> With GuC submission when an engine reset fails, we get an engine reset
>>> failure notification which triggers a full GT reset
>>> (intel_guc_engine_failure_process_msg in intel_guc_submission.c). That
>>> reset is blocking by setting these magic bits. Clearing the bits in this
>>> function doesn't seem to unblock that reset either, the driver tries to
>>> unload with a worker blocked, and results in the blow up. Something with
>>> this lockless algorithm could be wrong as clear of the bit should
>>> unlblock the reset but it is doesn't. We can look into that but in the
>>> meantime we need to fix this test to be able to fail gracefully and not
>>> crash CI.
>> Yeah, for that lockless algorithm if needed, we might want to use a ww_mutex
>> per engine or something,
> Do ww_mutex sleep? From what I can tell this lockless algorithm was
> added because even though resets are protected by mutex, there are some
> places in the IRQ context where we need to prevent resets from
> happening, hence the lockless protection + the mutex - what a mess. Long
> term this needs to rethought.
>
>> but point was that AFAICT at least one of the tests that set those flags
>> explicitly tested the functionality that no other engines than the intended
>> one was reset when the intel_engine_reset() function was used, and then if
>> GuC submission doesn't honor that, wouldn't a better approach be to make a
> No. In execlists this test explictly calls the engine reset function and
> explictly prevents other parts of the i915 from calling the engine reset
> function - this is why it sets that bit.
>
> In GuC submission the i915 can't do engine resets, the GuC does. In this
> case the engine reset fails which triggers a G2H message which tells the
> i915 to do a GT reset. If this bit is set the worker blocks on this bit
> in the GT reset and the driver blows up on unload as this worker isn't
> complete (believe it has a PM ref or something).
>
>> code comment around intel_engine_reset() to explain the differences and
> intel_engine_reset() return -ENODEV in GuC submission as the i915 isn't
> allowed to engine resets.
>
>> disable that particular test for GuC?. Also wouldn't we for example we see a
>> duplicated full GT reset with GuC if intel_engine_reset() fails as part of
>> the intel_gt_handle_error() function?
>>
> Yes, but the GT reset in this test is done after clearing the bits by
> the test. In the case of the GuC the GT reset is async operation done by
> a worker that receives the G2H message saying the engine reset failed.
>
>> I guess we could live with the hangcheck test being disabled for guc
>> submission until this is sorted out?
>>
> Wouldn't help. See above this an async operation from G2H message. We
> can't disable the async G2H handler as without other G2H messages the
> world breaks. The only other possible fix would be add an IGT only
> variable that if set skips the handling this G2H only.
And to be clear, the engine reset is not supposed to fail. Whether 
issued by GuC or i915, the GDRST register is supposed to self clear 
according to the bspec. If we are being sent the G2H notification for an 
engine reset failure then the assumption is that the hardware is broken. 
This is not a situation that is ever intended to occur in a production 
system. Therefore, it is not something we should spend huge amounts of 
effort on making a perfect selftest for.

The current theory is that the timeout in GuC is not quite long enough 
for DG1. Given that the bspec does not specify any kind of timeout, it 
is only a best guess anyway! Once that has been tuned correctly, we 
should never hit this case again. Not ever, Not in a selftest, not in an 
end user use case, just not ever.

John.


>
> I can assure with this patch, if the test fails, it fails gracefully
> which is what we want.
>
> Matt
>
>> /Thomas
>>
>>
>>> Matt
>>>
>>>> /Thomas
>>>>
>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 ++++++++----
>>>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>> index 7e2d99dd012d..90a03c60c80c 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>> @@ -734,7 +734,8 @@ static int __igt_reset_engine(struct intel_gt
>>>>> *gt, bool active)
>>>>>                   reset_engine_count = i915_reset_engine_count(global,
>>>>> engine);
>>>>>                   st_engine_heartbeat_disable(engine);
>>>>> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>>> +               if (!using_guc)
>>>>> +                       set_bit(I915_RESET_ENGINE + id, &gt-
>>>>>> reset.flags);
>>>>>                   count = 0;
>>>>>                   do {
>>>>>                           struct i915_request *rq = NULL;
>>>>> @@ -824,7 +825,8 @@ static int __igt_reset_engine(struct intel_gt
>>>>> *gt, bool active)
>>>>>                           if (err)
>>>>>                                   break;
>>>>>                   } while (time_before(jiffies, end_time));
>>>>> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>>> +               if (!using_guc)
>>>>> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
>>>>>> reset.flags);
>>>>>                   st_engine_heartbeat_enable(engine);
>>>>>                   pr_info("%s: Completed %lu %s resets\n",
>>>>>                           engine->name, count, active ? "active" :
>>>>> "idle");
>>>>> @@ -1042,7 +1044,8 @@ static int __igt_reset_engines(struct intel_gt
>>>>> *gt,
>>>>>                   yield(); /* start all threads before we begin */
>>>>>                   st_engine_heartbeat_disable_no_pm(engine);
>>>>> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>>> +               if (!using_guc)
>>>>> +                       set_bit(I915_RESET_ENGINE + id, &gt-
>>>>>> reset.flags);
>>>>>                   do {
>>>>>                           struct i915_request *rq = NULL;
>>>>>                           struct intel_selftest_saved_policy saved;
>>>>> @@ -1165,7 +1168,8 @@ static int __igt_reset_engines(struct intel_gt
>>>>> *gt,
>>>>>                           if (err)
>>>>>                                   break;
>>>>>                   } while (time_before(jiffies, end_time));
>>>>> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>>> +               if (!using_guc)
>>>>> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
>>>>>> reset.flags);
>>>>>                   st_engine_heartbeat_enable_no_pm(engine);
>>>>>                   pr_info("i915_reset_engine(%s:%s): %lu resets\n",

