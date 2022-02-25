Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A54C4DA8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6110E7CA;
	Fri, 25 Feb 2022 18:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A6D10E7CA;
 Fri, 25 Feb 2022 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645813425; x=1677349425;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HuMYbiJGrAeoUayM0NLT0sXgwovgfQxDJaIkySR2HW4=;
 b=ePjXvKTXQU5DImua8nMQgV1Vx0Iro2s+hUgIABGfzmlc3SF7DHPfRytW
 lI0cDQGH42a0gOa8azEz1EQMC+m9XZQ6Po9njArmSV6Frf5RGVCnyM58Q
 nJEzzyVRaFmo5YQ/tdXbAeNop3XOFKFdBWSL5PXRJeccSILBFfSC1OxJS
 B+uTc/oGYQIMUTHAmiG9G7sk/cc+fUunFu4T7jJ4zus/Wlz5oHIVRNzNL
 vHUutK6ntm8gdkQY557VLfOHMhwNs4DiyCAnLRNsnE0MO2PuaG6ezPRHr
 66Uo5ORTLHxeH9J7w5GOI0H5c214cUlZ91FU/+bbpmdD8rJ/kiDH7R4ww w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338989608"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="338989608"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="509353873"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 25 Feb 2022 10:23:44 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:23:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:23:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:23:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZSo8fnQwExeAJFvKWvoy7WHldhEAOJJbsfRqqt+ALnZLTsdaH7gnPCftOnCzQs/VOx6IH6jWKcUu4+q7mjR8WhspBHj7uHfEQA0dhgwmn7tnIV7x25RGBnUB5ihQOmbp4eVLFYwfxL2Qt1SBe3BYO54EyDwt1D6UXC0ORgwzl2NfDufkmDzN5Xpy7QzDJTtcPynoQWcZnwfHiHLVwlM1ByV2uHvvWtmvfOhoB57aiTHtSkMKshGm+EuxNjJYFv2JvWN7cGSauSuO+T/rh9evRnp+TXxK6b1dZL0JIFJnxVYAEAdz+IyMkL03URNwckSfRlvswDTwbbOQR2KHVdOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVDZA1ntiZ0EP9MVjsuR8pdag3d76j5Ur+SJLidXgCw=;
 b=Gz6/X2hb8CjppuqQ1y+xUd+jyVTMe1Trb54qYh4Mnq0WuFXGjQCo39ueG+uKVdetqbntIP3b7Xm+vpiWaud45Yw1SMv7pcaMgAk2Rv657ezHDsw5lDW4v1mEEhk6Htm2KupCamdPtnVqn5SdIb0XLnmt61653UFAdGMBKgOev33zhsaxuM/kNFAOF9pZEfiyYu2GVBJ9k/XLkWOEVKx3QyXrhH1DIS/4YtSQU1Atp6PMDHC6Yw6+7dAORSbzdOVLJn43dTvvCxNyaBx/UkqgSMd6Ecfe8YHrc82ygelTOKfeqnymkmUNztgECe9xT2TcL22Soq6GXBzPW9ijsoPWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Fri, 25 Feb
 2022 18:23:41 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 18:23:40 +0000
Message-ID: <683a9a0b-4d3b-8424-cb8f-3fa198a65d06@intel.com>
Date: Fri, 25 Feb 2022 10:23:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <011a236d-7ed4-0d48-e8a6-c9bd98740d5b@linux.intel.com>
 <718c6339-4a19-0de0-2666-a32be7c56dd7@intel.com>
 <0b9dd25f-63ea-9121-6326-14087f5f8e63@linux.intel.com>
 <ce1fadfd-4ae3-8639-8b92-4666ac68da14@intel.com>
 <9f8dd83b-ded2-6a75-2857-2a6a3246fa03@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <9f8dd83b-ded2-6a75-2857-2a6a3246fa03@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR10CA0057.namprd10.prod.outlook.com
 (2603:10b6:300:2c::19) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bed976f2-cf04-4e22-065f-08d9f88bf2c2
X-MS-TrafficTypeDiagnostic: MW3PR11MB4587:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MW3PR11MB458720964D087609E54A160BE13E9@MW3PR11MB4587.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fEzTb2hohZhOUtzsKXLOoj2CaXCeQqmBusNbKZOgyT2tnBIwfmRulr7gshQnwAjd35BS0E5SzJ6MIA50yf3gxjovbtKVOQgyd8kD+HBvsHWLe8MfiW6PtyaDHccakh1CWv3eHYd1tgee93wlWyOAmbc1477k8LEnYd37XcnDNjfcX81Rsfi1eyi56+SVnxGMQ6UlOmBVeTbFOI0QcpDWcV8tpIzharxApUPNEWslwR/CXq4vn3hU03l9psE58/ACmxeQW+KOLvykSALEg70HPC2jgqj9qiV5LQlHHDy0IBizUV1rx2osCjSbKwT/FBQJjH9amMCxR7jexci0jd0lPUdF9MwLhSCLsw11w16eE2/Q8lIHnG/VwiKwocLKisVTVS6m8CyDFR50Ky4B7eAH0UzcXQYvrig7Yzp5K+pVwxrelkWNCPSxeTB5loMOrL8OQ/lnXnLyX6gZYBEcq0Od0bmdO9SQpU6wdI+MHPYzgKJN+UG/C0SfkQQ+e12bZ9cLqeeKuSO7PDjUwYlktVbNpzdDT+Lip6DV3+s1wwez/pe6T6JP2sgzttRhYNQB/zk3E5nYWFvqFDaik6A47d6O6VFhIgDAioUZ7Abqpx+I3E0ud5HRwnlp57tUJFgkfB8cCOzrJ5CMItinKcmLodOLUT+dhHhA5ZJzCDIs2D0z3c5APC0qOFn5i4Tb8WBf4RR7X2K10zIcMw9/dCR7WjvvGa3+1774ltl+g10YNxNFIJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(6486002)(2616005)(83380400001)(8936002)(86362001)(4326008)(186003)(316002)(966005)(8676002)(66476007)(66556008)(6512007)(5660300002)(508600001)(44832011)(31686004)(38100700002)(31696002)(6666004)(82960400001)(36756003)(2906002)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBjL0YxcGtzTUg1TmVkaXpTaW1tbUgvcHQzYWh4TnVEeGFZY3NOaExwdWpF?=
 =?utf-8?B?MHpTTXFSOHBSamNWNXVWVC9sd0c0YW5ycy9NQjBIUU5URUwzWEVuck5SZ1hh?=
 =?utf-8?B?K3VLU2FhZFlZekNNRFhWeW5XTDlGMGNEQVlKVjQ1YVJKZ0NUcGEwNmZJcElQ?=
 =?utf-8?B?RmdBdVpqSk9vVEZhSmRRSmFiY2Z5Mkw3Z2l4aUV0UER3SVprMDkyUS8zNUY3?=
 =?utf-8?B?WUlrVTVZMEhTWnZSQmw5RG8xQloyRWVsczVMVGdySCtxdzNFOW1hSFk3bVV3?=
 =?utf-8?B?eCsrY1JXL3BmRGdidUdqWWZMMjhFM3c1UlRYN3BRcFl1U0ZMOEJTajJlVko4?=
 =?utf-8?B?RS9aemR0VG9rdjBOV3VLdUtVN096dUN6eWgzZXoxNE5kMnNiaHhYT0ZmU0hn?=
 =?utf-8?B?b3JrbjJqQ2FkRGxNM2hIVW5KUEtJRWlFQy8vWTRKN3JNV0NyMmRzM0JhaDJT?=
 =?utf-8?B?cUUyOFgzb09Va1BZNFhmV3d1N1h6Q2I3ekxNZlhTcEhEeVhjeVdBT2NwdmtT?=
 =?utf-8?B?SnVIcU9ySFIxU3VnbFJPRWsxK1Z6TWpRanNjMFJkaE5YNFVES1puSzBKdkg1?=
 =?utf-8?B?clBOYnhHTHBlVFJEWXZ0T21oc0lBZzZBS002aGlIMTAzYnlQamhBV3RXTUY0?=
 =?utf-8?B?eExXVFNuVlRySm9yM0ZFeElDYjgwS1VWa3VVSDM3VTYzTmp0VlJmelZodEpv?=
 =?utf-8?B?Y1oxTGlhR2NPWXVxMXNQOXhOUkZXYUhEUTFtM1lyS29FMm4vdTdqditEUksw?=
 =?utf-8?B?bE40M3p3U1gvYkpOMFV4L09pZUs3Y1RSNnl1TjFORzNsZkpjazRraTM3MTd0?=
 =?utf-8?B?M3Z2eEVyOTExaTdjWmRNKzZNb2NsWFJDMTZkazZEbVh3Vi9OYkxrK2VDa3p0?=
 =?utf-8?B?cVpXV3huSXg1aUZpV3c1NmFWdmdZRTlCNEQ5WFR0WDcxK0g1NWpRenRBL3ZD?=
 =?utf-8?B?VC9mWkFKMjdrV3pVMjlnNFJTemVnZzc3MWMyeWtRWUc1VlJqM2ZucWNncWV6?=
 =?utf-8?B?dU94VFo1WXJ3alRmeEk3TWhvcC9KTDJwRE0zQkN5Vk9OcGlQQi92eWEzaDBr?=
 =?utf-8?B?RWRNaE85dk9vTTFZdGhjeS9GV25tRFBmdGp3N1NjQTZGcGsxa3B3eHVaYTht?=
 =?utf-8?B?cGJHRkdSUGxtODlsOWRmK2NYVU9CdDB0Ukw1RVhkRzE3bTJSUGhVS2FKOGtH?=
 =?utf-8?B?MXhYODE3OU4xQ0dBcm15T1RrU2JFa3RaSEdrZlRxaHUrMVQwWllPQjdQTGtR?=
 =?utf-8?B?QlVLNmlFVlIvdWFhL0QrMTF3L3NWcThWdVFVbTA1TmJ6Kzc0Tm9ROFdSTTFv?=
 =?utf-8?B?a1ZvNjBUTVBtQzU5NnhUYytiQ0k2dmM1cmVGK3J1MHJaUTU1SkY3bEZtTlhx?=
 =?utf-8?B?RGIwaHlwL1g1R0pCOEhiMlEzYThia2lMcDN5V0g1aDVLT2h2cFlNK0JFaDla?=
 =?utf-8?B?RVAydHpLb3o5WlhiRndEYkt1dUlBRGcxNnNvNkdMMmVSVVBDWWdZRkN4TWlz?=
 =?utf-8?B?V2grZWlmSGJFQ2NiUEU5bnArL3c3Y243RHBvT3E1bndFYWpkajBsOXViZStr?=
 =?utf-8?B?Yzhqc1FLWmlOaEJIcnFRTllNT1phY1BuMDRUZmhmRmt5a3I2YjJpdXphUi9s?=
 =?utf-8?B?SEE5UjBmSXF0MEw1bHhVNHdvT2psMUpkRnlCekt4dGJGNTNIaUZPdC9vU283?=
 =?utf-8?B?cHMycDd5aHMvRXl1T0xiNFo0dGNIZ0JSMmFtOG5OME80TjlVR2Zjcld4VGRF?=
 =?utf-8?B?cXcxZS9xV1ZneCtlZis1MkdBVWFnTmZXQkcwSzNxeWVtSG5iZUhTYWQvL0hS?=
 =?utf-8?B?cG9yVlJLRlFpd3A0N2hDMXpBbXVxZHMxN0RtTUlLYlZFUG56UUVBSElpMG9i?=
 =?utf-8?B?aENZUlJxNnpwb2ptdldrck5GUVVxa3J1ZThab1o4VDNzY3J0Z0oxb3ZvaFRm?=
 =?utf-8?B?N3NWT2VzbU9XV0NjTHdETVgxOGVGZk9QUDlPUkpOUzFOSURDSjBnYlp3bGEz?=
 =?utf-8?B?dTgvYWp4OHNLaUdDc0FsRGs1TkQxMTNOcUtlWUlFbWdvMzRBUW1UWjQ5NktZ?=
 =?utf-8?B?SkxWNC9iQ0ZZODFCT01XSXlKRlR2R2tNeHU4eUtQRC9nNmtyZWNxVFJMNzk0?=
 =?utf-8?B?UmRpb3paZUJ0TnF2TEc4STIzR05LREJCRnJid25XSUppS2xkNXBva3o3bWQ4?=
 =?utf-8?B?dXFqb3pKTmh0NVBqelI3WE9DMWYzY3JRd3I5L2RiNWlCUncxS3R1ZTRFaG93?=
 =?utf-8?Q?Nqcmf2i7mlqQgaYAMGZcfMQahwY+hyuzoRdhX+qC5M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bed976f2-cf04-4e22-065f-08d9f88bf2c2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:23:40.8298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuMfL5gUph2A4sdbHcSrUD0xdkA7BB4Pp66FqGJJZRLO6eF6zrWsIxkdmaJxnQUGBVzjVCUUmn8+Rkhoc60imw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These seem to be pretty old arch and are day0 warnings, please refer to 
[1] to see the warnings. Also I am not sure why my patch series didn't 
append to the old one.

[1] https://patchwork.freedesktop.org/patch/475829/?series=99450&rev=11

2022-02-25 10:19 a.m., Tvrtko Ursulin wrote:
>
> On 25/02/2022 17:40, Michael Cheng wrote:
>> Ah, thanks for pointing that out, when I do include it though, it 
>> causes a few warning other systems such as h8300 and s390.
>
> Errors look like? I haven't heard that kernel code is not allowed to 
> include something from linux/ on some arch yet.
>
>> Since it is already pulled is, would it be OK to leave it out for 
>> this case? Or we could use something like !IS_H8300 and !IS_S390
>>
>> around the header file?
>
> Unlikely, now you made me curious why it does not work.
>
> Regards,
>
> Tvrtko
>
>>
>> On 2022-02-25 9:33 a.m., Tvrtko Ursulin wrote:
>>>
>>> On 25/02/2022 16:52, Michael Cheng wrote:
>>>> Hi Tvrtko,
>>>>
>>>> It seems without cacheflush.h being included, when I build for 
>>>> arm64 or x86, it stills pulls in cacheflush.h:
>>>>
>>>> ./.drm_cache.o.cmd:838: include/linux/cacheflush.h \
>>>> ./.drm_cache.o.cmd:839: arch/x86/include/asm/cacheflush.h \
>>>> ./.drm_cache.o.cmd:920: include/asm-generic/cacheflush.h \
>>>> ./.drm_cache.o.cmd:830: include/linux/cacheflush.h \
>>>> ./.drm_cache.o.cmd:831: arch/arm64/include/asm/cacheflush.h \
>>>> ./.drm_cache.o.cmd:1085: include/asm-generic/cacheflush.h \
>>>> So it seems without including it, cacheflush.h stills get pulled in,
>>>> I think its because its a required kernel source to build the kernel
>>>> per specific architecture, but please correct if I am wrong,as I am 
>>>> still
>>>> trying to understand how things works!
>>>
>>> Probably:
>>>
>>> drm_cache.c:
>>>
>>> #include <linux/highmem.h>
>>>
>>> linux/highmem.h:
>>>
>>> #include <linux/cacheflush.h>
>>>
>>> But it is more correct to explicitly include what you use. So if 
>>> drm_cache.c uses stuff declared in cacheflush.h, it should include it.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Michael Cheng
>>>> On 2022-02-25 8:28 a.m., Tvrtko Ursulin wrote:
>>>>>
>>>>> On 25/02/2022 03:24, Michael Cheng wrote:
>>>>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>>>>>> performs a flush by first performing a clean, follow by an 
>>>>>> invalidation
>>>>>> operation.
>>>>>>
>>>>>> v2 (Michael Cheng): Use correct macro for cleaning and 
>>>>>> invalidation the
>>>>>>             dcache. Thanks Tvrtko for the suggestion.
>>>>>>
>>>>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>>>>>
>>>>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc 
>>>>>> as a
>>>>>>             symbol that could be use by other modules, thus use
>>>>>>             caches_clean_inval_pou instead. Also this version
>>>>>>                 removes include for cacheflush, since its already
>>>>>>             included base on architecture type.
>>>>>
>>>>> What does it mean that it is included based on architecture type? 
>>>>> Some of the other header already pulls it in?
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>>>>>   1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_cache.c 
>>>>>> b/drivers/gpu/drm/drm_cache.c
>>>>>> index c3e6e615bf09..81c28714f930 100644
>>>>>> --- a/drivers/gpu/drm/drm_cache.c
>>>>>> +++ b/drivers/gpu/drm/drm_cache.c
>>>>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned 
>>>>>> long length)
>>>>>>         if (wbinvd_on_all_cpus())
>>>>>>           pr_err("Timed out waiting for cache flush\n");
>>>>>> +
>>>>>> +#elif defined(CONFIG_ARM64)
>>>>>> +    void *end = addr + length;
>>>>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned 
>>>>>> long)end);
>>>>>> +
>>>>>>   #else
>>>>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>>>>   #endif
