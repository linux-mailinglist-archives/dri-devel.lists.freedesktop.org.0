Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18DA4C06AF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED24C10E30E;
	Wed, 23 Feb 2022 01:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF1610E30E;
 Wed, 23 Feb 2022 01:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645578831; x=1677114831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p2ntPaopDBV0Z5Gd16B6xTAE4PponLEH5NgOLvh8jFU=;
 b=ll31QjmGSov6Fu//OAapy/hVmA1rTlXFetOmRNVMLIQZG5hQ4pEUFltb
 t5M0JFBrxyrwU3ZUYrYbXo0ySszboCGMU5ONxjnR02pT1bCNTATAA3Mqp
 A6HrqlxVKKsL+Htde3zRlwFWhNNPU4WWeZ1QQ3jPiTdLArxBYFl03RmWs
 oyo5/ltxN2xz5iYpD/jesbQ5hYqCiNbkyYdj0Svs0FyFeZLAY5LKtSIxy
 VrvocaCfH/Vai+chV9qDAbJ7i1PJyk7l0YGOkNTN9SRZ0KRs0PW8r0yfy
 kn1cczK9KPPcQbSVE/deiCha4nZuX7EH2ZL5mWY+YecnLryWbuBmFYPoC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239243926"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="239243926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="532471303"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 17:13:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:13:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 17:13:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:13:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsGdl5nxZNQOgNtfKI35XYX9tX0OpfSV0rD/byOQc8V9f+qBcRU0D6fwCA34xJqRMAIDJ8pOGdsEElxbssl/60BHC5pizqtY0YcKbSrazIETlSbkfLU+JRMBvUuBD7QcwC2RjmvJo/OuoVwakf4wEiOxqh2bRGFUKGfiySSyWuxux9C/jgp8D3mF2ryeRSEbFAHcn4cW2EddvCBnmPHE0whbtqI9YwsGiIEQfQamwBBkx/Vhgys3L/+C18r0LY39XUWDVKLlVs+bx4+rTSawCAl1mM+9mzBd3V7sRMt+iFAeAOG/ba4ELVbUL+ihV2SokPZR+4xuNMl05qLbbXHdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ140EqNaLn6VBC6ZMvQUGrKZdZQ6/sQEX2ENyfgPMU=;
 b=aJpO5QI64jGeYSpgd4SMayz1rQo5TkGGxBrNKsM80q6JSGI/Dg0m4+e74pYfqH71oKZMQXer7Cj91UJPrAkVcsfqiI5EIJLdRRrhqX7m5y0hz7rz6bRUiVlaWwu/moP7OZN05IHzABXrl9ajMU+JW59w3rZXsy6KnX4s0j+7uR7Fyn4/zYbSGKLuwbbCU69WUzkuqcsDYCY0IJkrXYLPEFElbVlex6li1QafK0zm0+F9yfumyKP817zZj+DPheWEUN/IyNrxI3NFUHPqbUo9C1P2+8vgk2d6Sum+7HhjcQldY/GcRar0sEQcGQ5rEW+inChm7YQS0hV6RLEFgrjB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by CH2PR11MB4455.namprd11.prod.outlook.com (2603:10b6:610:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 01:13:47 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.4995.026; Wed, 23 Feb 2022
 01:13:46 +0000
Message-ID: <dd6418a4-97ba-528f-9687-db408491961d@intel.com>
Date: Tue, 22 Feb 2022 17:13:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gem: Remove logic for
 wbinvd_on_all_cpus
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 <intel-gfx@lists.freedesktop.org>
References: <20220222172649.331661-1-michael.cheng@intel.com>
 <20220222172649.331661-3-michael.cheng@intel.com>
 <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:303:8c::31) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e38105d-c23e-455d-f805-08d9f669bdc7
X-MS-TrafficTypeDiagnostic: CH2PR11MB4455:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB4455098DA46BBAA8E858B7E9E13C9@CH2PR11MB4455.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKun06xGafGcmmjEK6Id/9zAJHmBLbyrXyd7ZbKto6NMBxB7Gs0iiaxiXRnnHAU7eZj7lRdEVJRDaU1SAJ6sXAgL+0Sj0u1p2hUREF9z9Dn/eNFAzvcs0qfxrJIFEAD2XHD+ihtzQdKF8ui4RtpPwUMhDea1gZDJ3wecXxojpa4pvVQofnH/Vyf8XK1u+KNlMyQjJndeJxr0dyc75jIqRTIBBGtte0H3iNfQCQYfydmRpfacgCJgNTEdxvy+B4AqTQMxeAtKz3VINpXVDRjFE7rqct5CGg1JppYT/7xJLfUzKucQqjfpT40nwSPJMfbFeqbfNMwyE7yU1MPkJI2G+fUFVdZMsiVYqht+OYC5DsPfza5eMGSekIb/2QZga8zHKh8dsdjIEsEmNHXM9xaapBR/TOJUK0of5GBg+Ql3p1Vhz19f4A/64wQQmeTR/UB3URJgMURUm90moJXeV18SrvGqZaoHJJt0EBf4y3ShYEIbgVI+EurL2QQRZYzoQm4YRKD6un4ha7pJDl1vQ/YU3ztjRwWm5uEWxZHV9T3eOrN1mCg3V6e8z+NYAw27UqZEGF1yNFayc5M07LLdHsNONUvdBGAUBi1rFDYRKOlzytyNfapZPEn4ti21Pbd6y0xE/0NzA/9fSWHcKeHRGsXqXaoWnTC6tUDESMqxaUJWMygW9MRoVSsiK+vKv10+MSN4S/DXDxZ85YE3kbKiAt64y1oOq+uGzywq5OKoHWUhDME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(53546011)(8936002)(508600001)(6506007)(5660300002)(38100700002)(31686004)(186003)(316002)(36756003)(6486002)(66946007)(2616005)(66556008)(66476007)(4326008)(4744005)(86362001)(44832011)(8676002)(6512007)(66574015)(31696002)(83380400001)(82960400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRueUdiRGdNMzBtR2ZPSEJJMlkvSWdwak12cU80aFozQ1dPTHIxY3Zib1dE?=
 =?utf-8?B?WlR3QmdkMkRhdmJGYmQrTXF6R1NsQXZ3bXUyQ283R0pHaGlHTnZqQStiV2hz?=
 =?utf-8?B?anZEUXFIcENPT0JnaVNKZnRDY2xLY3RiUWJEaE1SSzhPK3ZaMUdJRkw5TU5t?=
 =?utf-8?B?ZFhHd1B3dWxNTGNkN1FUQjhIdHBzQVZ1bFRLU0ZBMVlob2xDNFk3YWljNFpI?=
 =?utf-8?B?eGFuaENDMDdtbGRWaUM0Q0pZbDZFckxzOCtmWUpBNUhvUUdYWFE4ZDloNVR0?=
 =?utf-8?B?RWpMb2hkTTJkVlJkTHpaWU40MjJUVjdzdDhVS1pTcWN5K1RIWEhDSTcyZitE?=
 =?utf-8?B?dW1pRUJneVBDM2J1TjZNZkhiMkFOL0w3RktSMjN4dW15cHFFWTR1bHRGbHZz?=
 =?utf-8?B?ZytkT28veWZTMnRVdllwaGg1Q0pkZ0JlUnJiTmZyZjV6ZVBMWS9RSlRvVk5V?=
 =?utf-8?B?TGliV0dQU24vM2J2TXp4QWRWL2ZhS1hZQ2dKS3Q2bTFzeGxWM0ZTMlJTUWU5?=
 =?utf-8?B?RzBnV2FFM2dZTmk4WjVNZllLYVd1RU8vMEN2UDl3QXNzZzA2R0FKZXA3U3hY?=
 =?utf-8?B?M1NFVVV4anlJaGViOGV0Q3VWT0F2OTlLUStLS05wcVZqZ2QzeHhaK09HSWg0?=
 =?utf-8?B?V2xwZ3grakRieDJycGNranpJSWlFcElxbFByajNFV0Q1enFSUk9pY1ozZ1lP?=
 =?utf-8?B?MjNmNGVrWnhxeVVRU2VmRXBaRys0ZVJmTFc1Z3lIaUtEcFRtVVVERDllajBI?=
 =?utf-8?B?VEVrZWZzMkdkQ0hvbHNENVBoYk5qQmJQLzdJaElIRE9IR1packxDSFVsZVJ1?=
 =?utf-8?B?UFhKMkFmMXFHVUl3L3R1TitDUWZnVTZLdWdtQXB0Y0tMRHZTR3VYYWtYSyth?=
 =?utf-8?B?aW0rV2hRRHhPZEkrcFNyc3d2TTlxNGMzSm52RFNoQitjeW44WkJqVTFyU1Uz?=
 =?utf-8?B?c2lUck5HZ2hETk51VWorcEpnbHN4REhHUGEyb01GY2gxN0w3T211bWliWWhZ?=
 =?utf-8?B?aCtaMDk3UTNpVm1ZZU5nSC9KeGZTblhqeFBhU0RvVDFFZldqbytMWFdyWDEy?=
 =?utf-8?B?QzNwR2VkVXRoNTlKV2lKZmxhSEQ4cjU3d0lFU0d1bjJsY3FSWG9tV0tnZlJP?=
 =?utf-8?B?bnEweUlBdXVudlNBSVFlZUxDRXpMbU5uMjRCODJVZFlIUCtnZ2REcFRuejdP?=
 =?utf-8?B?QytoV2JKZ1FHbzdaZm5MNTVEVzlDWTkvUkFEZzFVSHNJTmt1OU14alZDNVhV?=
 =?utf-8?B?akprTWpqeHNJQytxYU51aVlNZ1BPK21LWXhUc0JzZHVKU0xiY0U1SUlHdHZm?=
 =?utf-8?B?QlZ6bVNCd2hFSE91YmdyQlpaMFlWQ1hydlgvclMxczJGaHpRS2poeS9EMnly?=
 =?utf-8?B?bmJrTlVUYWcvMG45WEdmdHY2WTR6SzN1U2RaMkFPVFAyU2hsTFczaTY0VEdV?=
 =?utf-8?B?ZkpqMHNrc0UydnRPV2paeElHV2xkS2VtbGx5YXk1YTE0OVlTUHdocXN0blVa?=
 =?utf-8?B?YzdkTEpSazlxTlJDRGNOeDhNczBCYjVtNlhITCtCbXdvcG4rLzJXRDUxTlZS?=
 =?utf-8?B?VCt6NjZpUmN5T0hUOG5pQU9VUDg2K0NuUDhoa0prcHFuNW9jRzhVQ0huV2o2?=
 =?utf-8?B?L0lzOVhJeVMvdHhuUmU5Y3k0Q1R6OFJDaUFZdWoxd2hUWDBsbnUxaTM1TWF3?=
 =?utf-8?B?UEh6SDk1ZGhIRllqakhjQitKSUhLRFdJUWhNRzJHVGtlZmhpZ0s2aks1S0FU?=
 =?utf-8?B?QUVLcExrSDl5d0pxN01ZK1dYdGpaTnplMDB4VE5SQVB3cFJza041WjR0ckdQ?=
 =?utf-8?B?b0lGSm5nM2UwTm5lL3lSeGV4eHRJMThmSGVhOFZERnA1UFBKYi9hbEhjM09l?=
 =?utf-8?B?S1d6Q21mRVlqZXh6QVFIL05qa2dHK2JrcW1rUy9YN3BuSWdmcWdBck82Y2pS?=
 =?utf-8?B?ZzhEYnU2TS85YmFxYzFjMjlHaDB4MmVvUVNDRDlsc3J2YTcyMUVWbDNFYWxC?=
 =?utf-8?B?UkV3UFhHTTBWcDJDWW9uNXNzTDFKNnFoT1B6d3hkVlNQWFFaOHdTbEt3d2Nr?=
 =?utf-8?B?bVJheitIdnYrOTlJbUQrRk0xbTJsSkQ5YWhxQ3dOc1J0Q2lRenE2cFpHMEJt?=
 =?utf-8?B?Wno5RnBzWndYTWZsVzFmTk13OWliQkU2blFsSllDckQ5Y0FqUGkzbmowQjJN?=
 =?utf-8?B?WG9FZjRFY2JZSE0yYzVwbms0TVRJbW4rZjBhblQxNlVmQ0ZaSFlIaXdRNENB?=
 =?utf-8?Q?rRHPTpJ8SiYAWeOawiFJj6gbdoJv8n7r4ArBKPDBGA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e38105d-c23e-455d-f805-08d9f669bdc7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:13:46.7977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYBmgYhFFLBV0r6vL2lb9foe2TxJ+YbFJmaPnIo241ulPhlBTCOFofedQxOtzbi0z632lH/WRboVG5zK3tKUJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4455
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for letting me know! I will try for a different solution.

On 2022-02-22 11:24 a.m., Thomas Hellström (Intel) wrote:
> Hi, Michael,
>
> On 2/22/22 18:26, Michael Cheng wrote:
>> This patch removes logic for wbinvd_on_all_cpus and brings in
>> drm_cache.h. This header has the logic that outputs a warning
>> when wbinvd_on_all_cpus when its being used on a non-x86 platform.
>>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>
> Linus has been pretty clear that he won't accept patches that add 
> macros that works on one arch and warns on others anymore in i915 and 
> I figure even less so in drm code.
>
> So we shouldn't try to move this out to drm. Instead we should 
> restrict the wbinvd() inside our driver to integrated and X86 only. 
> For discrete on all architectures we should be coherent and hence not 
> be needing wbinvd().
>
> Thanks,
>
> /Thomas
>
>
