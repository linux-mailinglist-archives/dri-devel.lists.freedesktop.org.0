Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64668773E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0943810E48E;
	Thu,  2 Feb 2023 08:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5288010E474;
 Thu,  2 Feb 2023 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675326216; x=1706862216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wnWB/tETm78d+24TVWrJA8sOh8h85UlN4oU0VEttc44=;
 b=iWOaSgrdiMagLiCAhIquLy+CryCcIAOOOn9e6n9LM4a+KpDOLbydZJGm
 3DdN7zkMbtMgwmIsR5+6Hr8uXL0/BJOCtRMnVsV8ancEwZKo63htoRWox
 /heBWNvHcLfUPtBfFE5ZfgwSQobdA6RtImdGOXFMuyW8K+1HNUqvn0l/h
 +xyKahMt3gw1PcSechMJbMcoALtaKMOCK2YejwYzAZzX8/Jlcu6NyQWcc
 3GDuBQo9mzk9iRqOzq4v6ulTLDqaQ6+t7CQkYNREnXCKPzlllBCFDr8ek
 L9HqtPVAW3fxJDUEMq/gRA/NEcMRyJT0Ra4YPY4bJleVQAE819YqT9Fkr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327039686"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="327039686"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 00:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807889446"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="807889446"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 00:23:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 00:23:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 00:23:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 00:23:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRblt2K0yBSySo+aXT/UgmA/eucz6CS3Ocs+9OleSL8UbLYIoAxxQAM21S4ISpEwvq/76eR3pWc687arF/AKkEq6a3iG9L77/qa3tfVj+DqqQFAKXm3HaTVdoMQB9WJnWSU+SXK+5eLwJNBoeGTe/qAm8+bmEgtVDtVvrKh4auKFFEb41l3GVIYXrzoVP6BC1xWG33t5ZYzP7bS8q5sJe2bKVF9ttmqo8zvTgfchyHKkCWO5/Mk+rF/U0FW+dmaXm4KDeSeKLVbrzRTzCP7RE4pABpuxLZffQTXDF6TseEB3HAiO2NmE335SGuxZnbXyyNxeJIEhMR2uvOsJhOS+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb1yDLHeynpaMKu9vPUvE7hx61eULOqV7DixNlaAXOo=;
 b=DdR4WEfH9MP+KdySHtsGlQqK/67EvRNUvFaQvHVcdEWeXAkNw1YXbkWaIORxj+hwqm/IJIiT528NpKgb3shpHm8vZOsM0FfJnz5pvGNNcvZvQn/FA+/dpv550rs3Lakd6B8fLrEqdI+CoCfE22gb3K5pM9sCZwOunuFAA/xe574GWGkgrHu6NK+ldHQjdBSM3oNy1ltr92tlEWJWFC1FpB2Ik4NeL3DgEyiVr6MvJVM2/9HCe6XGBf+MYtSBB6triiZMClL68YbWWwvA1KB2IesApABc0FOWyWWwYIWjHDfNH1M1PvmVlGHoN5c7DdVb1tPKg8Yo27AWWcb+6nT4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 08:23:30 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2%7]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 08:23:30 +0000
Message-ID: <cd3ff678-30a4-172a-fa68-d4df1636c46e@intel.com>
Date: Thu, 2 Feb 2023 10:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to
 settle
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
 <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
 <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan> <Y9fXFrJp/N0cit18@intel.com>
 <Y9fsgJd7y6aEt/sT@ashyti-mobl2.lan> <Y9fySWFQwTPC1VAM@intel.com>
 <Y9f+sGkj2/rJpaMD@intel.com> <Y9grflHnhExehDO4@ashyti-mobl2.lan>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <Y9grflHnhExehDO4@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::25) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 331fca1b-b07a-4a7b-2c90-08db04f6c3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJYo0GU3R4hdMZsjpmMzUTvAUCoOLxFLEBOSfPXfK9hpcqNz7h0fKhU0nk8FZep2+HZ3NGxsBaYKtGsMmGpKaNCvTQcbLKZ6jfY/IN4zRoviSmbWFuyXDHNRjBpu70FEM4mYJrg/K1ifpb/6MOvOIbrnghSzHUgEvUZFY4RrJyF5Wb7M/4WCkV8sFGndBGnO09S9eHiUWbwt2Rb7XwAevlDP6XRNjh56ILf/8wSnXtWwDzwALl9QI0EVlTt5cqGHgEkavBJpKqXscaEuHMvhjyP3nLvtQQJBPkhFtMkxz8h1gxMjzkTOqPQL02suK9lZ3VVEa+HzOl1ZbGjaqjDWfdu1mGwb91Mm0gP1BrhRM8C8HQXqclToPPxocRbLxr0Qg0T2r8BHzf+IHgi2A8JkDZaT2krk3xnzNGMWSIPaEyyB0Gq75nnQ8qhmzoU8QhCRvk1RbGAQNb8El7HZKsNufa8pOsy7xxsr2LeUbGyGcM65fqg0esARwynKWpWLwL1lwUIpYrCMLV2M1Hepvzf4bVrgtybvERspD4nn1Xzr+We71kPOeE6Vfj5w80NvUG4x0OShqx+2Di+TLncdKHVvh/eJrOz3O0r1OKF/mcJzi0jvzRQP0CC7p7Zh0VxMoDDFAzf1zMsBDvWqrrY3F48qIAFGbEcAMW2OBH9dj0vbANOePu/iNVUqBo9gfDYks4zrXx5KB31WcXHRpNCHFJr1RcV5meImf5JBH1BfBdegmRQvlJ6+7gkgMr2GQ1fXvsKsUP7DvjXrP5GEnf0WZXR0Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199018)(36756003)(66556008)(38100700002)(66476007)(66946007)(4326008)(83380400001)(8676002)(110136005)(54906003)(6636002)(316002)(6506007)(53546011)(26005)(186003)(6512007)(30864003)(478600001)(5660300002)(966005)(6486002)(86362001)(41300700001)(82960400001)(2616005)(8936002)(31696002)(31686004)(2906002)(226643001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmRjTEhMM0FjbXhqQy8xUmRPMnhRajZIdWRkNFZlTWRGdjk3SW5xb2dDZnNt?=
 =?utf-8?B?azdPL3A0VEpiai9JMlRTNnFTS1Y0b0JXZkk1d2dUUS9wVUVUbHNZZHpUSlhx?=
 =?utf-8?B?WVplaFNJdmtiVmFPYnRrc2FiTHZoNEw3TXBrYjFJb2N2N3U3cWxtM1M0djd3?=
 =?utf-8?B?L01zWW5MUmQxWVk3MWJmUGRiRndiVCsybU9PdDYwdEtld3hTL0ZUUDRBZGVm?=
 =?utf-8?B?TW1kU2dUYktDNVYvci9rYjNNZ29lZGpFZFdlZzlCUmFQb0d3ZGFoR2ZDMm53?=
 =?utf-8?B?TEQra3R4OWpoV1Q2WU41cDBWQU5zQ3hhR0lRSzNvdmhVb0FqT01WSEJvSFRz?=
 =?utf-8?B?dlBpRUsrQWx3Sm00OFdnOU9aMHJ3a3ZlMHhpN3c5clZodEx3RUtJNW5rWDVS?=
 =?utf-8?B?OWNiUDNVdDFVSFdaSzllT3B5MlBpRnFCUmpsN1QzRlNaeHpUc2lqZDVwc0k4?=
 =?utf-8?B?Wk1rTHI1TTZaclY1ejAxR0dYNGlpdkxBRENUTEhEd3FLbVdzY2N3Vy9lMXNk?=
 =?utf-8?B?ZlBSYk1CWkhweHpLZnNtR1EzY09rNXlDb2dPWi9sandZL1RtM0hHMU5HbjZt?=
 =?utf-8?B?WGIwb3JyNkhhejdtQnlsdjkxQ25jZHhCU1RlNDFTRkc4WU1jOWhqbjNrQmFa?=
 =?utf-8?B?ODBPQ1NHS1pFalRjUUJ0ZmtrbkEyUk1XY1Y4SDdMZVdmOHVYSlVtbmt6RDdz?=
 =?utf-8?B?NDRyQ3ZyNkp5UVErenBiM3JOaHAxNVl0Rk9oZW1jU3R0WkhyN3JLZWhjdG16?=
 =?utf-8?B?ZFJhTWNHMmtkeWE5QUVib1RxSXZkMFZabmM5MzgxaFRsTm00bHh0eDZWWTdQ?=
 =?utf-8?B?UCsrNzQ5aE04ajk4OWFTaVBIVDBQeW95elcxNjFybXpUL3dnS1JHTThlbElK?=
 =?utf-8?B?aGUvcEdhaWJTVEF2YU5sTGlveGU4VktWTng0NFhkTm5OMTBrM2dqRmFKMER3?=
 =?utf-8?B?QXNmNFhheXhWdC9DNDlIczMxc2JqWHZORXVOWC9DV0xGZUxDUFpkUjVwY2Iz?=
 =?utf-8?B?SjFLb3RLMjMwYWplWmVkV21nQnBvYzA5cExNcUM1aUN6RElObmtpeTBPZUEw?=
 =?utf-8?B?TlJneGVLVE1aY0F0bzNTRE1kaWd6azhZY1Q4TEVRM3lKUnZTalAwdER2dGZY?=
 =?utf-8?B?dUFqZHdVaUJkMnBMaStHQml4bG12QXFUY1NjdWJaU3RkSytLVzE0WEppbExF?=
 =?utf-8?B?NFE0bnAwMzMwTEl6am15eit2TzdNdzZjUUV6eFU2U3BRdGM0SkNqSmYyVFhw?=
 =?utf-8?B?c2xWcGR6T1EvZUNkZ2xQaXdLQ09zdlR0c1N4N3RScVFZbmFzSjlKK0RiNlg0?=
 =?utf-8?B?aDBTRHQzZ3dESlViSkVwVzRqeHFhZXUvREl4WmdvM0tPU2dCdEFTWE5aSGVN?=
 =?utf-8?B?d1YraGZnT1JTWktoNDJmMXh1WHBlKzVQZCtYQlhxd2RrV01zY2EvNGZHYUFC?=
 =?utf-8?B?K0JYSmw3OU1PbFU2L3QrWUdXalpzTURCVnAycWNyUjAvVXpjdFZTcERtSTlm?=
 =?utf-8?B?dnlkclBTTU9LamNqMTBHV0pDQmZQemtQdGJpT3hITitFV1F2RTFub1NNcXdw?=
 =?utf-8?B?UmpXM1VOT0tZcW5EaVRUMVBJVmpwZ25mRG05b2x1amNLcndIODV2OWUrUzY5?=
 =?utf-8?B?cFlOWHBwRUxvTlZFWUpRTEsrZ3RTWXNTSlRuMzNsZlUwT0d0dmJEaGdWOVJP?=
 =?utf-8?B?M3RNYTZKVkloNFlrOU41ZmdnL1BVVHhRZGFlUWFJQTAweDR6THd0emM4S3Ba?=
 =?utf-8?B?aHRNQlVxUHNNT1pMd3o1SmZkUFR2N3pXSmY1Zi84MDBaMXdrQ0hucGNEVTV0?=
 =?utf-8?B?cEJKelNFd2MwbkZUZ2YxdlJiYmlYdTJtZDU1K0lmMnlNdVdhalBiOTltUjA1?=
 =?utf-8?B?ditGd0Y2ekZOT0V3TVBNa3V3MSthQ2RVUHhDZjNZUnMxYnBJV05WQWlJT25u?=
 =?utf-8?B?VjBzZjZPVnpMdzdFeFptdHMwZTJNcTY3TDVoWk1NZVZrSGV2U0JiV1BWWHVn?=
 =?utf-8?B?OGQrRFNyQk5taUt3RUtaTHZoVWxyUlFUYk52NThqNEd5UFBLbEV2aDlQYzZB?=
 =?utf-8?B?QlpRSTZGNjdzemVxc3ZpZ29kOXZVUk9kQTF4RDZoQ2JScUxoeDk1VFdia1V6?=
 =?utf-8?B?TFFHaC82K1dHdnN2MU13eWxwU0U3Q05NbXlYSDFGYkM3NlNaVTQ2Vzhuc2cv?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 331fca1b-b07a-4a7b-2c90-08db04f6c3fe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:23:30.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81LAfLezENZvjcDEhkgyAC1K7JZa7ophgBI6oegVRcwxa2GQPPM8nP52C4YOnLfwA4kG0pBHkP7WHvnjsncmXKw/vFlGV1Vh1Hx2CAw4SIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

You gave a lot of explanations, and confirmed that this patch solves the 
problem, but the root cause of this problem still seems to be unclear.

In the logs where this problem was reported, the logs were output in the 
following order.

link
  : 
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1294/bat-atsm-1/igt@i915_module_load@resize-bar.html#dmesg-warnings17324

[log]
<7> [268.276586] i915 0000:4d:00.0: [drm:skl_pcode_request [i915]] PCODE 
timeout, retrying with preemption disabled
...
<4> [268.276942] WARNING: CPU: 1 PID: 1678 at 
drivers/gpu/drm/i915/intel_pcode.c:196 skl_pcode_request+0x242/0x260 [i915]
...
<3> [268.329058] i915 0000:4d:00.0: [drm] *ERROR* gt0: intel_pcode_init 
failed -11


In other words, -EAGAIN was not returned when the first 
skl_pcode_try_request() was executed in the skl_pcode_request() 
function, but the logs confirmed that the _wait_for(COND ...) of the 
skl_pcode_request() function was executed.

And, I reviewed bpsec in more detail to see if I missed anything related 
to the status and restrictions of the initial GTDRIVER_MAILBOX_INTERFACE 
(PCODE).

I've reviewed bpsec in detail for the two below where 
GTDRIVER_MAILBOX_INTERFACE is mentioned, but I haven't identified any 
additional constraints other than those described below.


Pcode Driver Mailbox Spec: 34151
Driver Initialization Programming Sequence: 33149

RUN_BUSY: SW may write to the two mailbox registers only when RUN_BUSY 
is cleared (0b)

My suggestion is that the HW should explain and analyze the root cause 
of the situation where it takes more than 180s for the Busy bit of 
GTDRIVER_MAILBOX_INTERFACE to change to 0.

And the method of the proposed patch, the newly added line 
"__intel_wait_for_register_fw(uncore, GEN6_PCODE_MAILBOX, 
GEN6_PCODE_READY, 0, 500, 10000, NULL))" succeeded, but the existing 
method of trying 180s with checking intel_uncore_read_fw(uncore, 
GEN6_PCODE_MAILBOX)&GEN6_PCODE_READY) failed. Therefore please review it 
again.
(Checking the code, it appears that both call usleep_range(wait__, 
wait__ * 2); in __wait_for().)

Br,

G.G.

int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
		      u32 reply_mask, u32 reply, int timeout_base_ms)
{
	u32 status;
	int ret;

	mutex_lock(&uncore->i915->sb_lock);

#define COND \
	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)

	/*
	 * Prime the PCODE by doing a request first. Normally it guarantees
	 * that a subsequent request, at most @timeout_base_ms later, succeeds.
	 * _wait_for() doesn't guarantee when its passed condition is evaluated
	 * first, so send the first request explicitly.
	 */
	if (COND) {
		ret = 0;
		goto out;
	}
	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
	if (!ret)
		goto out;

	/*
	 * The above can time out if the number of requests was low (2 in the
	 * worst case) _and_ PCODE was busy for some reason even after a
	 * (queued) request and @timeout_base_ms delay. As a workaround retry
	 * the poll with preemption disabled to maximize the number of
	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
	 * account for interrupts that could reduce the number of these
	 * requests, and for any quirks of the PCODE firmware that delays
	 * the request completion.
	 */
	drm_dbg_kms(&uncore->i915->drm,
		    "PCODE timeout, retrying with preemption disabled\n");
	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
	preempt_disable();
	ret = wait_for_atomic(COND, 50);
	preempt_enable();

out:
	mutex_unlock(&uncore->i915->sb_lock);
	return status ? status : ret;
#undef COND
}






On 1/30/23 10:41 PM, Andi Shyti wrote:
> Hi Rodrigo,
> 
> first of all, thanks for looking into this!
> 
>>>>>>> In the call flow invoked by intel_pcode_init(), I've added brief comments
>>>>>>> where further clarification is needed in this scenario, and a description of
>>>>>>> the suspicious scenario at the bottom.
>>>>>>>
>>>>>>> -------------------------------------------------------------------------
>>>>>>> intel_pcode_init()
>>>>>>>   |
>>>>>>>   +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
>>>>>>>                         DG1_UNCORE_GET_INIT_STATUS,
>>>>>>>                         DG1_UNCORE_INIT_STATUS_COMPLETE,
>>>>>>>                         DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>>>>>>>         |
>>>>>>>         +-> skl_pcode_try_request()
>>>>>>>               |
>>>>>>>               +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
>>>>>>>                                             500, 0, true);
>>>>>>>
>>>>>>> -------------------------------------------------------------------------
>>>>>>> static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
>>>>>>> 		          u32 *val, u32 *val1,
>>>>>>> 			  int fast_timeout_us, int slow_timeout_ms,
>>>>>>> 			  bool is_read)
>>>>>>> {
>>>>>>> ...
>>>>>>>          /* Before writing a value to the GEN6_PCODE_DATA register,
>>>>>>>             check if the bit in the GEN6_PCODE_MAILBOX register indicates
>>>>>>>             BUSY. */
>>>>>>> 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>>>>>>> 		return -EAGAIN;
>>>>>>
>>>>>> what if we fail here because the punit is still initializing and
>>>>>> will be ready, say, in 10 seconds?
>>>>>>
>>>>>> GG, without going any further, we fail here! The -EAGAIN we
>>>>>> receive from the test comes from this point. We don't fail with
>>>>>> -ETIMEDOUT, but with -EAGAIN and the reason is because the punit
>>>>>> is not ready to perform the very fist communication and we fail
>>>>>> the probing.
>>>>>>
>>>>>> It doesn't mean, though, that there is anything wrong, we just
>>>>>> need to wait a bit before "taking drastic decisions"!
>>>>>>
>>>>>> This patch is suggesting to wait up to 10s for the punit to be
>>>>>> ready and eventually try to probe again... and, indeed, it works!
>>>>>
>>>>> As GG, what I still don't understand is how this extra 10 seconds
>>>>> wait helps... have you tried to simple add the 10 to the 180 and
>>>>> make the code 190 sec instead?
>>>>
>>>> maybe I haven't been able to explain the issue properly.
>>>>
>>>> I can even set that timer to 2hrs and a half and nothing changes
>>>> because we fail before.
>>>>
>>>> Here it's not a matter of how much do I wait but when do I check
>>>> the pcode readiness (i.e. signalled by the GEN6_PCODE_READY bit
>>>> in the GEN6_PCODE_MAILBOX register).
>>>>
>>>> During a normal run we are always sure that communicating with
>>>> the punit works, because we made it sure during the previous
>>>> transaction.
>>>>
>>>> During probe there is no previous transaction and we start
>>>> communicating with the punit without making sure that it is
>>>> ready. And indeed some times it is not, so that we suppress the
>>>> probing on purpose instead of giving it another chance.
>>>>
>>>> I admit that the commit message is not written properly and
>>>> rather misleading, but here it's not at all a matter of how much
>>>> do I wait.
>>>
>>> The commit message was initially confused because it looks like
>>> we are just adding a wait, without doing anything....
>>>
>>> But looking to the code we can see that it will wait until
>>> pcode is ready with a timeout of 10 seconds.
>>>
>>> But if pcode is ready in 10 seconds, why pcode is not ready
>>> in 190 seconds. We are doing absolutely nothing more that could
>>> make pcode ready in 10 seconds that won't be in 190.
>>>
>>> This is what we are missing here... The code as is doesn't make
>>> a lot of sense to us and it looks like it is solving the issue
>>> by the 10 extra seconds and not by some special status checking.
>>
>> Okay, after an offline talk I am convinced now that we need some
>> check like this in some place.
>>
>> But the commit message needs be be fully re-written.
>>
>> It needs to be clear that underneath, the pcode communication
>> functions will do a check for ready without any wait, what will
>> make desired timeout to never really wait for the pcode done
>> and prematurely return.
>>
>> at __snb_pcode_rw():
>>
>>   if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>>                  return -EAGAIN;
>>
>> So, for this reason we need to ensure that pcode is really ready
>> before we wait.
>>
>> Other options are to handle the EAGAIN return and then wait.
>> Or even change the __snb_pcode_rw to ensure that it is ready...
>>
>> Something like:
>>
>> -       if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>> -               return -EAGAIN;
>> +       if (__intel_wait_for_register_fw(uncore, GEN6_PCODE_MAILBOX,
>> +                                        GEN6_PCODE_READY, GEN6_PCODE_READY,
>> +                                        fast_timeout_us,
>> +                                        slow_timeout_ms,
>> +                                        NULL))
>> +               return -ETIMEDOUT;
> 
> This works, but the difference is that you are putting it on any
> call to the __snb_pcode_rw(), even when not necessary.
> 
> Putting it in the schema we used in our offline chat, the
> original implementation was:
> 
>   +-----------------------+
>   | r/w -> check if ready |-> r/w -> cir -> r/w -> cir -> r/w -> ...
>   +-----------------------+
>     probe time
> 
> (where cir stands for "check if ready"). Because in the first
> r/w we didn't check the status of the punit we added:
> 
>   +-------------------+
>   | cir -> r/w -> cir |-> r/w -> cir -> r/w -> cir -> r/w -> ...
>   +-------------------+
>      probe time
> 
> So that we are sure that the first r/w works. What you are
> suggesting is:
> 
>   +-------------------+
>   | cir -> r/w -> cir |-> cir -> r/w -> cir -> cir -> r/w -> cir ->
>   --------------------+
>      probe time
> 
> As you can se we have two "check if ready" in a raw, which might
> be a bit of an overkill, it doesn't hurt much but it would look
> like:
> 
>    if (__intel_wait_for_register_fw())
>    	return -EAGAIN;
> 
>    intel_uncore_write_fw......
> 
>    if (__intel_wait_for_register_fw())
>    	return -TIMEDOUT;
> 
> and this for every single snb_pcode_r/w.
> 
> Besides some functions might need the first wait, some might not.
> Check, for example icl_tc_cold_exit() where the -EAGAIN is
> handled. With your version the retries would be quite ponderous.
> 
> I'm sorry, but I can't take your suggestion as it can have major
> consequences along i915, it requires more changes and and it
> needs to be carefully tested.
> 
> On top of that I like Ashutosh refactoring that is quite an
> elegant way to gain more flexibility at boot time without any
> further impact.
> 
>> In the best regular case it will not change anything since the wait
>> for will return 0 immediatelly... in the worst case we would double
>> the timeout value, but this would be only in this insane case of
>> 180 seconds anyway and if it goes really really nasty...
>>
>> But anyway, now the motivation and the source of the issue is pretty
>> clear, I can add my rv-b there, but I really want a better commit msg
>> at least...
> 
> I definitely need to make a better commit message :)
> 
> Thanks a lot,
> Andi
> 
>>>
>>>>
>>>> Thanks, Rodrigo!
>>>> Andi
>>>>
>>>>>>
>>>>>> Andi
>>>>>>
>>>>>>>
>>>>>>>          /* write value to GEN6_PCODE_DATA register */
>>>>>>> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
>>>>>>>
>>>>>>> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
>>>>>>>
>>>>>>>          /* In this scenario, the value
>>>>>>>             "DG1_PCODE_STATUS | GEN6_PCODE_READY"
>>>>>>>             is written to the GEN6_PCODE_MAILBOX register,
>>>>>>>             so that the Busy status of the GEN6_PCODE_MAILBOX register
>>>>>>>             can be checked later.
>>>>>>>             (When the value of the GEN6_PCODE_READY bit of the
>>>>>>>              GEN6_PCODE_MAILBOX register changes to 0, the operation can
>>>>>>>              be considered completed.) */
>>>>>>> 	intel_uncore_write_fw(uncore,
>>>>>>> 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
>>>>>>>
>>>>>>>          /* In this scenario, verify that the BUSY status bit in the
>>>>>>>             GEN6_PCODE_MAILBOX register turns off for up to 500us. */
>>>>>>> 	if (__intel_wait_for_register_fw(uncore,
>>>>>>> 					 GEN6_PCODE_MAILBOX,
>>>>>>> 					 GEN6_PCODE_READY, 0,
>>>>>>> 					 fast_timeout_us,
>>>>>>> 					 slow_timeout_ms,
>>>>>>> 					 &mbox))
>>>>>>> 		return -ETIMEDOUT;
>>>>>>>          /* If there is a failure here, it may be considered that the
>>>>>>>             "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
>>>>>>>             completed within 500us */
>>>>>>> ...
>>>>>>> }
>>>>>>>
>>>>>>> int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>>>>>>> 		      u32 reply_mask, u32 reply, int timeout_base_ms)
>>>>>>> {
>>>>>>> 	u32 status;
>>>>>>> 	int ret;
>>>>>>>
>>>>>>> 	mutex_lock(&uncore->i915->sb_lock);
>>>>>>>
>>>>>>> #define COND \
>>>>>>> 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
>>>>>>>
>>>>>>>          /* the first trial for skl_pcode_try_request() can return
>>>>>>>             -EAGAIN or -ETIMEDOUT. And the code did not check the error
>>>>>>>             code here, so we don't know how far the __snb_pcode_rw()
>>>>>>>             function went. It is not known whether the pcode_mailbox
>>>>>>>             status was busy before writing the value to the
>>>>>>>             GEN6_PCODE_DATA register or after.*/
>>>>>>> 	if (COND) {
>>>>>>> 		ret = 0;
>>>>>>> 		goto out;
>>>>>>> 	}
>>>>>>>
>>>>>>>          /* In this scenario, skl_pcode_try_request() is invoked every
>>>>>>>             10us for 180 seconds. When skl_pcode_try_request() returns
>>>>>>>             -EAGAIN and -ETIMEDOUT by _wait_for(),
>>>>>>>             -ETIMEDOUT is returned to a variable ret. */
>>>>>>>
>>>>>>> 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
>>>>>>>
>>>>>>> 	if (!ret)
>>>>>>> 		goto out;
>>>>>>>
>>>>>>> 	/*
>>>>>>> 	 * The above can time out if the number of requests was low (2 in the
>>>>>>> 	 * worst case) _and_ PCODE was busy for some reason even after a
>>>>>>> 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
>>>>>>> 	 * the poll with preemption disabled to maximize the number of
>>>>>>> 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
>>>>>>> 	 * account for interrupts that could reduce the number of these
>>>>>>> 	 * requests, and for any quirks of the PCODE firmware that delays
>>>>>>> 	 * the request completion.
>>>>>>> 	 */
>>>>>>> 	drm_dbg_kms(&uncore->i915->drm,
>>>>>>> 		    "PCODE timeout, retrying with preemption disabled\n");
>>>>>>> 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
>>>>>>> 	preempt_disable();
>>>>>>> 	ret = wait_for_atomic(COND, 50);
>>>>>>>
>>>>>>> 	preempt_enable();
>>>>>>>
>>>>>>> out:
>>>>>>> 	mutex_unlock(&uncore->i915->sb_lock);
>>>>>>> 	return status ? status : ret;
>>>>>>> #undef COND
>>>>>>> }
>>>>>>>
>>>>>>> ---------------------------------------------------------
>>>>>>>
>>>>>>> If you try skl_pcode_try_request() for 180 seconds in skl_pcode_request(),
>>>>>>> and the first "intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) &
>>>>>>> GEN6_PCODE_READY)" call in __snb_pcode_rw() that skl_pcode_try_request()
>>>>>>> invokes always fails. if then it does not make sense to me why this patch
>>>>>>> fixes it by just waiting 10 seconds.This is because if it was called with
>>>>>>> the flow described above, 180 seconds is longer than 10 seconds, so the
>>>>>>> scenario you mentioned is also covered in the existing code.
>>>>>>>
>>>>>>> To describe in more detail the second scenario I previously commented on:
>>>>>>> skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
>>>>>>>   1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is not
>>>>>>> BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
>>>>>>>   2) skl_pcode_try_request() returns -ETIMEDOUT value because the operation
>>>>>>> of 1) does not complete within 500us.
>>>>>>>   3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as BUSY
>>>>>>> and returns -EAGAIN in the last call of skl_pcode_try_request() invoked by
>>>>>>> skl_pcode_request()
>>>>>>>
>>>>>>> If the reason why this problem occurred is because of this scenario,
>>>>>>> shouldn't there be an attempt to increase fast_timeout_us used as an
>>>>>>> argument of __snb_pcode_rw() to 500us or more when skl_pcode_try_request()
>>>>>>> returns -ETIMEDOUT?
>>>>>>>
>>>>>>> Br,
>>>>>>> G.G.
