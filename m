Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D11474C45
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E47C10E167;
	Tue, 14 Dec 2021 19:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11410E139;
 Tue, 14 Dec 2021 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639511346; x=1671047346;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SYu8qqcRjctTeQitCx9GYKfCMga1TZFh4b/xe4Xqk5Q=;
 b=nktP2pd3pHojikRl7l5pNMZdVRJGi++ZB7L7eaVf3DeK3OCEaaxsVh0w
 KmE/QegVdMHvIaEfa2VcQ+r20SgMiVKf/zZo+y4rBdXuExBiMiKaLOidQ
 clP7OuGxdyrXgoa7VtggZyFvvqUnQ159p0/Xnuni6IKM/syKhm5gL9lR/
 hZAVXJ2rP5hmF4VxzNwv76X1kDVmdZNg6k8gmhYPKXKIZN1vFqnH09/iO
 DpptjBRsuBf6ICWD0w/R51ZIWuiMbC/m6BccRy7MbMGCAdy6ghAbMNteu
 K08hpOept7P6Lleg6TMA5RYFjV2a9o0hhieixX1rzo3u1NSKV6Ombfsz/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226351297"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="226351297"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="465238303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 14 Dec 2021 11:49:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 11:49:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 11:49:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 11:48:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCy8vxgbhxTcgyd5AWAhE7QjIRt4KMo7mnYEjvQqsVFyDzSwfmvkyPW/PLrqTH2oYfEpEiiM5k1F5s/TB0kDicLcHcvTbVlOP11U0XaMDXEjwMrvoSQL9MrpYolk0IDgocWG5QMS8uQX6CmtgubuAAKpqjeoSjG1qizEduVWrKLS88Z4Sb8vsTg0tGA0XvVIM+Y5TOJHkje4XmvcNHV9RGWeQwoj54pd9nZX4bbVwxjeZklVINuTaIFdL5XpM/W7lAAFWm2vo/fbcsrbfzSAsjvSfzMGmirbSOawVT1UyqItmHAtNOHG4haYTA2qiv8ALlGUDi5cLuWtblUEYJ0GHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8YuVT2mE8C5XOVjD9Rgn4LURZf+N0Udk8F0BrVEngE=;
 b=EJW4RB78TIagfclDAPlpVHEdqDSyUA2Ydj206gf4McnCDubdmO+LTMrmtK2kyn8O2g5wUfBTmqAP/TM7Iq+/R9370rC+47w6p2+i0vSC6JaaKNse+MR/kio+yuxhUAkIoglaBZqbTNvLCaKgqDbUCHJxhd+rp4vPuZcj6jkD3am1WWJLf3I8oQM7TvLP5ZXrtHxfFMmE3y8hbybcgay/40169DK1bKSGLohggi1ruj8KeEIVXdQ1h1nzanvrlvEzBnNLQNe2awbZfqr/alyVoKycNCFmVFQLWRgQd8/0qvBNb3ab2NuoVngsuRW/dCUtbQ05zhexGaWIyfawygJA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8YuVT2mE8C5XOVjD9Rgn4LURZf+N0Udk8F0BrVEngE=;
 b=mZVCwwUa64RKJVBL8F/BD3nyByGDsrf9t0whgukJhdJVivvimgs1+mneyei3rxEWZYrt9PqNu/2wCCFRTF0Sl4LAMstBEpRGGSbLkHuQ2V3TE9ffw2Dv/U3hD8BqiSFXT4zAwehuGivXuKziUpNj89d3sCARLecnTuYdbOLD6p0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 14 Dec
 2021 19:48:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%6]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 19:48:57 +0000
Message-ID: <1cd00317-3563-61ee-9b25-9c16c8132b4a@intel.com>
Date: Tue, 14 Dec 2021 11:48:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 7/7] drm/i915/guc: Selftest for stealing of guc ids
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211214170500.28569-1-matthew.brost@intel.com>
 <20211214170500.28569-8-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211214170500.28569-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR18CA0061.namprd18.prod.outlook.com
 (2603:10b6:104:2::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa16162-213e-4584-bdf8-08d9bf3ac457
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5815:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR11MB581532A7879DFFC1425C6E00BD759@SJ0PR11MB5815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9eOm716PyDZ8DXY9rdM8kxXaIfDnfzdeGMeB7kWzm9s4svNPz1JKilpF/IzQ9ucjwV9yoiy/bVhT6XVC6QpzJOQlSoKp4/ZwJczS48kOr3x01naje+DUihXobxEZJe01tulj163puzqe/RB62tFoMGVEu2moYRzG1Z3rhzkPEQK0NynkCKqc/av0viSSXyF16Ct3PqFCcHVj2yEiixNDHdRQjrDMtPWAgS6EbvFu3n5JrReKAhGhcFD+AeI9GRUg0DierS6RKE2L1imNg5ue9tm1E+ojz9sty8kB7lLrJ6j51QFxWY9MCrp/0iz+r1aYy80H73a7LbLxL+eMyULVhmvpMCiZSGIXWDUP4YPhWgCNtX87GpdiHxEB1svgwGQgGQ2CCQnbl/fKpkJLPdlcAqis+zczLRh4s6EIX3UMHoKCEFlFxFxfhYe9BuZV+o3hrTyq+P2mU6Ea6RaK4Z+dlBT4Jn9KN6fJZjEv6NryPJDFPJUFfRmwqkSzd+hwN2Pan8a+U7HdGVuwsLCYwis8hPd7+VR+JzYoJ4iNdOdqhb4F6eUyVFGNxpy9xEtlz8D9tXyPZ+GDXzeXnq4l/2HB2A9KvgoixxGrYWVcEt9Gw+hLJ3FWX8EOw4QwAIGWUWp3sD4MQt1rsU+LgTOaIXJnTZ6t8WI7EjR29HBGEp0ec69ULqFroBC+s9cEAzpbSmmaowLMU+iM3uBYZSXPU3aSgNfZvz9g7FpmY5qg9ODpMr9mgj+2Al3daa8RqqbBvt6Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(83380400001)(6506007)(53546011)(31686004)(82960400001)(86362001)(2906002)(316002)(508600001)(31696002)(6486002)(26005)(186003)(450100002)(107886003)(8936002)(38100700002)(66476007)(8676002)(66556008)(6666004)(6512007)(36756003)(2616005)(66946007)(5660300002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3haVTZiaGxkZHpMZ2craithUDVHdWwya2xXdlhrQ084L0s0QUJKU25iYXVV?=
 =?utf-8?B?OU1LdUF6TDJqNEFJLzBKeVhkQTZmWC9SNzVxdko3alZmOUdKbWx6ZEluL2pX?=
 =?utf-8?B?bW43OW5SU21JTUJaNVZuTWdzZnNlNlY1L1ZrUzFuN20xeVZQRHlycWVTdEJI?=
 =?utf-8?B?VUQxeGZwd2dQUktCdTlLKzhwc243dERiVTZFSXBrRUdneVRUbm92T1hQYW5o?=
 =?utf-8?B?YWlDR2dMeG5VQzFKZTRPcjdMZjg1TExuNVFvZWxEREM0Vk1iN292UVFtek5v?=
 =?utf-8?B?VEp5b1hjOU9ycEt2WCtSMm9ZT1RSUGRsb2xONVMwMmJCdG8zd2RhMjNZR29q?=
 =?utf-8?B?RGl1QUJ1bjR3Q1k1TkxZOWl3cGYxYlNFejlrcGFJNDY1Yms2ODMwaCs0VWVE?=
 =?utf-8?B?OG1iU2RsS1BvRE16Z0hGNS9FeFFLL2c4VURKMC9rNTI4OEp6eHpycGN2WHdm?=
 =?utf-8?B?a2lmZlRyMGVlWC9hcnJFVnBYa210WGdHSmg1K3BkUHIyS2VOV0lrMm1SRFgx?=
 =?utf-8?B?WExtNjM5NUlYMFR3clJGSG9yakFjZkV4NEhEVmRKOE1vQWNUcFJtRm5mK2dF?=
 =?utf-8?B?WjdUUGFLcnR3RFJNV2h6V3k2bFc5YXFrb0cvbkxJREhkRjd4N1pnbUZpMEJR?=
 =?utf-8?B?TElIUjJVMTJoMGtVbktRRlo0M1BESU5uNERWTlJZd1N5blhRSW4raDhWOVYz?=
 =?utf-8?B?ZUVSYVl4NFpnVDR5Um4rdDcwd254dEZWL1ZHMzFyK0FUUnhjek54WUxsaE50?=
 =?utf-8?B?aXNvTk9LRzNjdXNhVGFSRDdvdWVPYVZNU0JEbWFTaWhIVXlYaDA4RWZVaUo0?=
 =?utf-8?B?clAwcmt0dW5pNDROWEpQeklPWWRZa3F2aUgycmFHYmtKa0h6Y1k4MGxQOC9v?=
 =?utf-8?B?dmwxcjdLUU5vbzA4elEyNWxKaUxTSnkyZEgwWG9NOEFZZWNyT1JrVk5NQXpR?=
 =?utf-8?B?Y0JFa2xlaGFsakJOY050Tnl4Rm9BeldPQURuRHN0NTZjL3BWMTZpWEM1UFF0?=
 =?utf-8?B?ZXRnR0ZGbzdxRCtvcHYvZFdid28vcGY2STQra2l1dHh5R3BUNW9WajB2NHdE?=
 =?utf-8?B?V3d0VUhlZVYwWXBTSGxqMnBuS2pvM0RGbWdCVDFkTnF2akdVM3FQbjg0TUNh?=
 =?utf-8?B?QkQ4QzBQWjFERGF2eTl3RFM3a0UzcnBDVlY4cUZMM2RFaHl5bUJTL1dId25i?=
 =?utf-8?B?OEhsa3BLVTdsZzRzUDAvM0xWQzcySndLNEZWSmtJWmoxRHNHMkl2QjNaWTIx?=
 =?utf-8?B?bjl3eGJHUllYR0wyTElBWlR2N1ROaEl0cm1IWkg0QU5xb2dDR214SWdhMGkw?=
 =?utf-8?B?WFl0Qi9UdTVpdzFLZ2NsSEM2Skk4eVptWHhja3RNUWR1Vm0xL1QrNGpVS3pM?=
 =?utf-8?B?WDVmRlR2U2RxL3hjTllqYTU2cGd5QUVtOWVWNlprRzJ3R0FnaGtPMytOdkZJ?=
 =?utf-8?B?RENJQ1BRMENxcDBDQkNuNzY4SWR2QlIycHVkRzRUSlRKdFNrWXhESncrZnI3?=
 =?utf-8?B?Y0VyZWpXOGdFdDdNeVJQcitEa2loMzNaUWRhVUJoUmxvMlhyZVNPUEs4aWIw?=
 =?utf-8?B?SkdkbVNmMXExWTh5WXpncDdCVGtYemFUMzA3b1hyanZPZHRoTEVJdldEeHpX?=
 =?utf-8?B?azFJZmNWazBTR3NiNzRKcHFrZEc1RzRmRTJXdzM4NnFZVlNmZVFzQk4wVk16?=
 =?utf-8?B?OUNiTjNhdXc5eUd2a3hpdis3bWM5UWpmODgyYnVhM1pITDVQSGV0b1FPc3hD?=
 =?utf-8?B?R1JrY1VlbnNlS0RMOFNGTzZwaVVpcnpKYnhKWnNUZmxlSUFuTlprN0lwSjBt?=
 =?utf-8?B?bjh2YlRIRVBNclMvc2J5bnhzMGI2U3dJNXgwRmpXWXJGMVAyVWw3Z3VTMnpa?=
 =?utf-8?B?cm5EL05hNkJXVTRuanpWcnNtZkw2TzZZNzFQeTBIeHFSQTZFT3JqcnFycDJG?=
 =?utf-8?B?RzdlSlFRUW1BWnI5ZWhXT3p2dUdMOVVKaXBjek82UTM4Vk1JdExUNmFFYkR4?=
 =?utf-8?B?bXdiM0FRNDdOOGRmV1d4VjVrVzlERElySkdtRVFHditrVCtadmhrR01qSWJQ?=
 =?utf-8?B?SUhIVDVzQTJqT05hdmN1ODZ3NCs0OVJHaVplMk5ubWs1RUVVemtqUXV0V1N0?=
 =?utf-8?B?MHlXcEkrOXp4OG12U0hjTG1ibENEdCt3NG9zSGtFRTFrRFdhSDFvbjJmWE92?=
 =?utf-8?B?akgzc0QrcUh0aXdPM1d3aHNiemFjeFV0Mzl0VGNpVGNjaXZoVS90cUZQMzMv?=
 =?utf-8?Q?z2rMap0xcqmcSB5Gydydr4MAFXVuVTxLEZ5G8j8dGY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efa16162-213e-4584-bdf8-08d9bf3ac457
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 19:48:57.4291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rctOWJzUThxxTrRfjGb4luoJK7T1XP09H+IAZ2qvqsmG97QOuhTEFrcassjwhQXYoGPr7cLxN/ZR3ckrqya398ixrZ/BWFNrIac1wdfIGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/14/2021 09:05, Matthew Brost wrote:
> Testing the stealing of guc ids is hard from user space as we have 64k
> guc_ids. Add a selftest, which artificially reduces the number of guc
> ids, and forces a steal.
>
> The test creates a spinner which is used to block all subsequent
> submissions until it completes. Next, a loop creates a context and a NOP
> request each iteration until the guc_ids are exhausted (request creation
> returns -EAGAIN). The spinner is ended, unblocking all requests created
> in the loop. At this point all guc_ids are exhausted but are available
> to steal. Try to create another request which should successfully steal
> a guc_id. Wait on last request to complete, idle GPU, verify a guc_id
> was stolen via a counter, and exit the test. Test also artificially
> reduces the number of guc_ids so the test runs in a timely manner.
>
> v2:
>   (John Harrison)
>    - s/stole/stolen
>    - Fix some wording in test description
>    - Rework indexing into context array
>    - Add test description to commit message
>    - Fix typo in commit message
>   (Checkpatch)
>    - s/guc/(guc) in NUMBER_MULTI_LRC_GUC_ID
> v3:
>   (John Harrison)
>    - Set array value to NULL after extracting error
>    - Fix a few typos in comments / error messages
>    - Delete redundant comment in commit message
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  16 +-
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 173 ++++++++++++++++++
>   3 files changed, 196 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 1cb46098030d..f9240d4baa69 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -94,6 +94,11 @@ struct intel_guc {
>   		 * @guc_ids: used to allocate new guc_ids, single-lrc
>   		 */
>   		struct ida guc_ids;
> +		/**
> +		 * @num_guc_ids: Number of guc_ids, selftest feature to be able
> +		 * to reduce this number while testing.
> +		 */
> +		int num_guc_ids;
>   		/**
>   		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
>   		 */
> @@ -202,6 +207,13 @@ struct intel_guc {
>   		 */
>   		struct delayed_work work;
>   	} timestamp;
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	/**
> +	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
> +	 */
> +	int number_guc_id_stolen;
> +#endif
>   };
>   
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 96fcf869e3ff..99414b49ca6d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -145,7 +145,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>    * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
>    * multi-lrc.
>    */
> -#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
> +#define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> +	((guc)->submission_state.num_guc_ids / 16)
>   
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
> @@ -1775,7 +1776,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   		  destroyed_worker_func);
>   
>   	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>   	if (!guc->submission_state.guc_ids_bitmap)
>   		return -ENOMEM;
>   
> @@ -1869,13 +1870,13 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   	if (intel_context_is_parent(ce))
>   		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> -					      NUMBER_MULTI_LRC_GUC_ID,
> +					      NUMBER_MULTI_LRC_GUC_ID(guc),
>   					      order_base_2(ce->parallel.number_children
>   							   + 1));
>   	else
>   		ret = ida_simple_get(&guc->submission_state.guc_ids,
> -				     NUMBER_MULTI_LRC_GUC_ID,
> -				     GUC_MAX_LRC_DESCRIPTORS,
> +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> +				     guc->submission_state.num_guc_ids,
>   				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
>   				     __GFP_NOWARN);
>   	if (unlikely(ret < 0))
> @@ -1941,6 +1942,10 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   		set_context_guc_id_invalid(cn);
>   
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +		guc->number_guc_id_stolen++;
> +#endif
> +
>   		return 0;
>   	} else {
>   		return -EAGAIN;
> @@ -3779,6 +3784,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index fb0e4a7bd8ca..2ae414446112 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -3,8 +3,21 @@
>    * Copyright �� 2021 Intel Corporation
>    */
>   
> +#include "selftests/igt_spinner.h"
>   #include "selftests/intel_scheduler_helpers.h"
>   
> +static int request_add_spin(struct i915_request *rq, struct igt_spinner *spin)
> +{
> +	int err = 0;
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +	if (spin && !igt_wait_for_spinner(spin, rq))
> +		err = -ETIMEDOUT;
> +
> +	return err;
> +}
> +
>   static struct i915_request *nop_user_request(struct intel_context *ce,
>   					     struct i915_request *from)
>   {
> @@ -110,10 +123,170 @@ static int intel_guc_scrub_ctbs(void *arg)
>   	return ret;
>   }
>   
> +/*
> + * intel_guc_steal_guc_ids - Test to exhaust all guc_ids and then steal one
> + *
> + * This test creates a spinner which is used to block all subsequent submissions
> + * until it completes. Next, a loop creates a context and a NOP request each
> + * iteration until the guc_ids are exhausted (request creation returns -EAGAIN).
> + * The spinner is ended, unblocking all requests created in the loop. At this
> + * point all guc_ids are exhausted but are available to steal. Try to create
> + * another request which should successfully steal a guc_id. Wait on last
> + * request to complete, idle GPU, verify a guc_id was stolen via a counter, and
> + * exit the test. Test also artificially reduces the number of guc_ids so the
> + * test runs in a timely manner.
> + */
> +static int intel_guc_steal_guc_ids(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	struct intel_guc *guc = &gt->uc.guc;
> +	int ret, sv, context_index = 0;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine;
> +	struct intel_context **ce;
> +	struct igt_spinner spin;
> +	struct i915_request *spin_rq = NULL, *rq, *last = NULL;
> +	int number_guc_id_stolen = guc->number_guc_id_stolen;
> +
> +	ce = kzalloc(sizeof(*ce) * GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL);
> +	if (!ce) {
> +		pr_err("Context array allocation failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +	engine = intel_selftest_find_any_engine(gt);
> +	sv = guc->submission_state.num_guc_ids;
> +	guc->submission_state.num_guc_ids = 4096;
> +
> +	/* Create spinner to block requests in below loop */
> +	ce[context_index] = intel_context_create(engine);
> +	if (IS_ERR(ce[context_index])) {
> +		ret = PTR_ERR(ce[context_index]);
> +		ce[context_index] = NULL;
> +		pr_err("Failed to create context: %d\n", ret);
> +		goto err_wakeref;
> +	}
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		pr_err("Failed to create spinner: %d\n", ret);
> +		goto err_contexts;
> +	}
> +	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
> +					     MI_ARB_CHECK);
> +	if (IS_ERR(spin_rq)) {
> +		ret = PTR_ERR(spin_rq);
> +		pr_err("Failed to create spinner request: %d\n", ret);
> +		goto err_contexts;
> +	}
> +	ret = request_add_spin(spin_rq, &spin);
> +	if (ret) {
> +		pr_err("Failed to add Spinner request: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Use all guc_ids */
> +	while (ret != -EAGAIN) {
> +		ce[++context_index] = intel_context_create(engine);
> +		if (IS_ERR(ce[context_index])) {
> +			ret = PTR_ERR(ce[context_index--]);
> +			ce[context_index] = NULL;
> +			pr_err("Failed to create context: %d\n", ret);
> +			goto err_spin_rq;
> +		}
> +
> +		rq = nop_user_request(ce[context_index], spin_rq);
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			rq = NULL;
> +			if (ret != -EAGAIN) {
> +				pr_err("Failed to create request, %d: %d\n",
> +				       context_index, ret);
> +				goto err_spin_rq;
> +			}
> +		} else {
> +			if (last)
> +				i915_request_put(last);
> +			last = rq;
> +		}
> +	}
> +
> +	/* Release blocked requests */
> +	igt_spinner_end(&spin);
> +	ret = intel_selftest_wait_for_rq(spin_rq);
> +	if (ret) {
> +		pr_err("Spin request failed to complete: %d\n", ret);
> +		i915_request_put(last);
> +		goto err_spin_rq;
> +	}
> +	i915_request_put(spin_rq);
> +	igt_spinner_fini(&spin);
> +	spin_rq = NULL;
> +
> +	/* Wait for last request */
> +	ret = i915_request_wait(last, 0, HZ * 30);
> +	i915_request_put(last);
> +	if (ret < 0) {
> +		pr_err("Last request failed to complete: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Try to steal guc_id */
> +	rq = nop_user_request(ce[context_index], NULL);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		pr_err("Failed to steal guc_id, %d: %d\n", context_index, ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Wait for request with stolen guc_id */
> +	ret = i915_request_wait(rq, 0, HZ);
> +	i915_request_put(rq);
> +	if (ret < 0) {
> +		pr_err("Request with stolen guc_id failed to complete: %d\n",
> +		       ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Wait for idle */
> +	ret = intel_gt_wait_for_idle(gt, HZ * 30);
> +	if (ret < 0) {
> +		pr_err("GT failed to idle: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Verify a guc_id was stolen */
> +	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
> +		pr_err("No guc_id was stolen");
> +		ret = -EINVAL;
> +	} else {
> +		ret = 0;
> +	}
> +
> +err_spin_rq:
> +	if (spin_rq) {
> +		igt_spinner_end(&spin);
> +		intel_selftest_wait_for_rq(spin_rq);
> +		i915_request_put(spin_rq);
> +		igt_spinner_fini(&spin);
> +		intel_gt_wait_for_idle(gt, HZ * 30);
> +	}
> +err_contexts:
> +	for (; context_index >= 0 && ce[context_index]; --context_index)
> +		intel_context_put(ce[context_index]);
> +err_wakeref:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	kfree(ce);
> +	guc->submission_state.num_guc_ids = sv;
> +
> +	return ret;
> +}
> +
>   int intel_guc_live_selftests(struct drm_i915_private *i915)
>   {
>   	static const struct i915_subtest tests[] = {
>   		SUBTEST(intel_guc_scrub_ctbs),
> +		SUBTEST(intel_guc_steal_guc_ids),
>   	};
>   	struct intel_gt *gt = &i915->gt;
>   

