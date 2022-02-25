Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4C34C4CB0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4CB10E891;
	Fri, 25 Feb 2022 17:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33CF10E891;
 Fri, 25 Feb 2022 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645810833; x=1677346833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AMsdyyE7p2sZMIe+WNEfNMNLnDa0pcI/yWP+wxo/qp8=;
 b=iJH/B4augQ8jGe88LTjFRBDZc8iPFe8607pfexR0XeFhjZ6cBmArurFJ
 PkCpC9SbslvbSgX0TcMLGQfMmNbGmTEQ2EzTP46/OmnM7cdd21HE4TReg
 ExzkQJYoJG+f46S26DWH2p8kUmrBNPip2oFDWrHNSRxqizPMU85R14Yxx
 xkKKoW0YZnDSZQl5gJKgaDvCZ2MX8QfQqp543KebIzu5xhsZC+0fl0wil
 0lnBDSM9CElK0Dz09TQJbRuiSoDdQ2byCHKfwYJ+FmsD87MCcWv7cjmD0
 w4d+FrHce/Xb3KcQqfR9mvGWwBGFo635gcCpBbEcgNKv4o8qz/hi4F6Gu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252465356"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252465356"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="777472211"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2022 09:40:27 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 09:40:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 09:40:27 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 09:40:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Omsin3x6oigRia1kyRi6eOyR9OuQfOiqfq++MwUZDTrIz2V8IcvH2dhVvUUkZOBUDz06uOmoUGcJzHyi3mBXFPcTiTdTusczxHQ3LhxmhUE9Btpab3b+nZAUbvRMOD5xd9rqlo8pPEjtpmhR/F7Z5ah0i8lQfh+NF/X219SAbS3CrLkrZ+Fms3XQ4I2nbRh3g8s8MSqM3NXs8WV1s1x04/Ypye0znLzFyV1NKAvzgFSPXz3UtFSSVXgPjcDKMAKdCPpAUYhXcJ3b/H5mklJOMZ+J7zIKkuFBG2CA+WXKwcS7LqfgMWEpRh/9o0BCMiwFilSUq8z/LpUmuvwKa3ir4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fbRuqvaCGkPUPGGwPwrAxuogAAAFNwHK+4LoalLI2E=;
 b=FXM7A0ftPX2ZGQFxAMIiMHHlzEOtxnRkGxVQHpZN6nZgSdXyin33cuU/nxFIOoMsbBoA6weE0e+tjAjSAvk4aN8Gws1oHDtB6jZmD+IoK7qvOv0QuVfC7/W/L5kvgOxcodlov+w7y6dKkZt7awub2/D4CnSN+e89oX8YfJpeN8wW1oovTZVnz+Y71E9dYBbcNYbh7hDxE/U0ct7zdx0MdJr6KnpfSIJ8zPM6A0Anr9ocWM/tP6Yv9pI5mNrycIUtr6xyaMN1u6eQkmBYa9qGnypFh2MTX1ikyQyo6PW55319fDjYFtW2vpFY+9ltZGxlYkvWxS6yB+IxTtiuxuaQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MN2PR11MB3997.namprd11.prod.outlook.com (2603:10b6:208:13b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 17:40:24 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 17:40:24 +0000
Message-ID: <ce1fadfd-4ae3-8639-8b92-4666ac68da14@intel.com>
Date: Fri, 25 Feb 2022 09:40:21 -0800
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
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <0b9dd25f-63ea-9121-6326-14087f5f8e63@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR22CA0041.namprd22.prod.outlook.com
 (2603:10b6:300:69::27) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cc1a489-35ff-4ed6-7d73-08d9f885e6a7
X-MS-TrafficTypeDiagnostic: MN2PR11MB3997:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB3997FF643F8329D865B1ABC9E13E9@MN2PR11MB3997.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BT/2mSZ451frwh3JQ2kpFA0tKngt9Mqb/t6+FJ659YAn1D6pJDylnFRyT6yjnVG7FWk6RWelJ6TdmZLGPUkN8kwOPFpPrmfbwiyss+dp+c21Uxw1ZCIpyjR7e4p1O9rgE6KvFFX6wBiBA+N+ZJq/6E539HNKueobTnSVpZ9oRaBtjVyhZTYHRy7/riHgNoUtdDgprNpqhyHQQAG6dKDjt678fxM70+2U/YfJdC/yZhxRpszUlKXlNvINb/eT4W5Tnt0+QBcJVCfHqqXPT6ZSLNGvfYgEp/VbyMAc0V7CKICgJ1gS1Ox6H8l5vgJ5UnKbP4lWbWew2UYF2XWxxKPUlb+1UHtqccGxbhpQroVcABq2WOVux6OSKmfPhPvZHxKmeVLuTbRFxkH3jbN8jhK2KGWam6ozV7yuNzsXYhcwRZrSIECDJp+6ZWjIdM+TObVmzMqHKIsjk1oCMI4Ke03aLxDLO77NMIDgaE0au5Dyi00/BmtSta850sI6yZ7g8Ar9UfPMYqlQMcSe0bgd0DoocRFdjRkcxuXpdXiZQF0UoAw+i0QMRzVNzjVPYo16pbiZ8SzrEqmldE7g9oMXoyfbyX+r36zti9hS8qKi7pz8yeKAOMSwyynVmlJDcta40W11CIhuv7oXGQrLpy5Aib4ybVuZ8d66TimITvHZ1czfHnbXf5ibZoobnAvcyGsxYEdTDc99bYf6CL+wTmXnTUg8DjadTSgtxxGLMHIjQGjv1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(31686004)(6512007)(53546011)(6506007)(6486002)(508600001)(316002)(186003)(83380400001)(36756003)(2616005)(2906002)(82960400001)(86362001)(31696002)(5660300002)(6666004)(8936002)(66476007)(66556008)(66946007)(8676002)(44832011)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZjR0pUYUNoZXFrMEo3bnFiTlVGRCtkVnBoTUJQWUtUKzFaaWNjZGd2Q0wv?=
 =?utf-8?B?VDhMM3FESENXNk9rQUY4S1dDWHdKQVZ4N2taY1hpRjBubEhKUHB1cXZnOGJU?=
 =?utf-8?B?b0JXQmR2a1NvZWVwY2ttMEVndy9oRXNJSVpqVlRCdUxPS1p1WmIvOTRTak80?=
 =?utf-8?B?ZjdBZzRjWHdxSFgwM3Z6ODFCRExqclJLWVFseW1senlmQTVGRGgvR2cxZWFo?=
 =?utf-8?B?MlJ6NWU1MDNhVzQyTmVxVzAyQXpJUk5VMHJHb3ZBWEgzM09uZzhKNnZEVFd4?=
 =?utf-8?B?T29iWXZleXIrWFpuVDkxbjNEL2VwU0tESUUrTWNrTHRsbDd5bFo1MUk2UlNi?=
 =?utf-8?B?Sy9ycHBYZU1SNk5oU1pMOXJZcGNnUEhsWlgzb2tzVHJ4MUxMazNNbElHazlW?=
 =?utf-8?B?ZGYwVkNuRnIyclgxVlZ0b0hjeDNiK2RIak5OR3dwdnliM3hUc05lcXRSSzl4?=
 =?utf-8?B?YVhlUDBEczI2ZU1BSm5GaktBYUhtMVN6bEQ5MG9jZFhIVU5QWUdKMmxoWHFx?=
 =?utf-8?B?RW0xalJEUzVlTGh5M05yWU9Eb2gzWG9lK3FJSW1VN1ZQaDJBNmVnbytROHpn?=
 =?utf-8?B?OTlrUUFlVDRBM3JKVWg4YTFkMTFnYXgyZG9nL04zYmtjTlN2UlU1Q1BJNER1?=
 =?utf-8?B?R0QrZEVFaVdlR3BvNU54dzBUb3F0WE92cG05Tk02cHVZWXBNTGVCdnNIVkhh?=
 =?utf-8?B?QmxGYzVMQVRNU1Y3UW93dUplYmJWWDVBK2NqVTBYbTlFMnpheFRqang4QktQ?=
 =?utf-8?B?aCtjbTd0R2Fvcy9leVBXU0hkS3NxRlU5NnBMdXJEVkpseEdjc3lkeTJUdWJv?=
 =?utf-8?B?b1pRTUU5bHpyOHplSytSNVh4Z3BIYTZXdjZGSzJWZUtjVmNYYjh2R3lpU3Nz?=
 =?utf-8?B?dzZGZThybXR6UmxjNVRFVWswRkxpazQwUEo5ME9jOVRDcnM0MktLTVgvNysz?=
 =?utf-8?B?R0hjWlE0QW9XMWh1YWNvWEZhN2RFQUwyaThGb0NnWENxaWFyS3JyUVlOeGhk?=
 =?utf-8?B?bzlBQm5oSFJ1NTNlbDdPNDhyK0pVdU9wTWJqNUpvOTdFdlV6MFd4NHZ0NThE?=
 =?utf-8?B?SzlQUEo0RVIvOUlhRWEwcEVsbG42VkZxbnJLNlptUlpUMGpLdmYya3FYNTBt?=
 =?utf-8?B?bE9rcDBmUTk1RE1DY3lYaGljQndST2lyYzVhM3VlS2xWSzlyZzR5RUppRERs?=
 =?utf-8?B?RWVMVW90Z3JJZUNuNm11ZmR1enJWeFBhSTdWSHpLMDdaOGhiUTlVQkNkMjN2?=
 =?utf-8?B?YVFtb0g0TVV4VGg0RXMzSkhuYmdLdFlFdVNYdC9WSEp3S2RIR1Q3Zm1PTmkv?=
 =?utf-8?B?RG14THUxR1g5TkNNRER6QWk0djF4RnJXL24wSEp1V0NuRitETUZqYnUzdlNJ?=
 =?utf-8?B?c3lXRytJZk0zRzY2YWxoWFFXNUl6cDdBQjRYT3FlNGVzdldWMXEzc1pndURx?=
 =?utf-8?B?c1hhclUyMkhBTjdha3VYSXNUMEVDS1h2ZGdwRHBLeE81TEdFZlNuc1BnMnFH?=
 =?utf-8?B?REd1TlJSTW9nb3ZjRXBOQlp2MWJXVlArYjZFZkhFS0dyNXlmTkRISFI4U1lK?=
 =?utf-8?B?L05GUG1kUlo3MG9lNFVheHBKck41RndRQ3Z6aW93eE5HbDh5bVlOOWRHMExP?=
 =?utf-8?B?UUdhWW9PVGRQKzBVY0FydW9wUDdyS2NwdDNMYUNwbTU5MnBxWjZlRGJId2tE?=
 =?utf-8?B?VFFWOTJZYnJYZ01tWTFBeWZ6V01CZDZrUCtNY3Q3Y1liNDVheWRSTkI0YXJE?=
 =?utf-8?B?VGpBVVJFQnRZNy9QbjZyYlhTS1IxVE5LZ2t0d0dFVDg2THorMGZaTGZjZUJ1?=
 =?utf-8?B?TXBpdTh1aGdPSWtySnhUcFZUdE9DejlqUmRMYllXb0E2Rk9oa3RQYjJ5Mjc0?=
 =?utf-8?B?eEdGaTQ4OGFDWFZYc1pQYUc4Mk1FdHdGTW93MzVxeWtmdnp3ZjRSMjJOWFo3?=
 =?utf-8?B?b3FUQVdnSm5UckF2V0RiUDRQWlRPQ1NRa2lXUWR3VG5HM1ZacDN5dDN2NmVy?=
 =?utf-8?B?UkYreE9HM3BySEN3MkZ2YTJWaWJFRC9MUjlDSUxMemxZTlZhQmFhOUcxT2RB?=
 =?utf-8?B?Q3dHU0psbjNYN3k3bDlhaldsYm4veTBHMjlsblZiUXV6dk1wajhWd3FoY3Zq?=
 =?utf-8?B?U3BKR1RvSlRlR0twMkRLa1NNdXFoc05uWURrVGVrVFhCallCT0IvR0o4YUNF?=
 =?utf-8?B?Mlhqcm5nd2JXMEJsdUVrWFNncEdOejV4OWZuSEtMWW8zajJsUEpNdXVzbDJD?=
 =?utf-8?Q?dOaHW2MRRypRfZhX9Br3cOcxSKszg/eaFs0/QAzr7E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc1a489-35ff-4ed6-7d73-08d9f885e6a7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 17:40:23.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AjOTVIeN19q+alVNfyf5G/5+kLEp3IkKy7wOAVZy8sDTCHXvgx0jZp+fyH0RMQEj/p8y4O4/InNSwOxHsywpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3997
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

Ah, thanks for pointing that out, when I do include it though, it causes 
a few warning other systems such as h8300 and s390.

Since it is already pulled is, would it be OK to leave it out for this 
case? Or we could use something like !IS_H8300 and !IS_S390

around the header file?

On 2022-02-25 9:33 a.m., Tvrtko Ursulin wrote:
>
> On 25/02/2022 16:52, Michael Cheng wrote:
>> Hi Tvrtko,
>>
>> It seems without cacheflush.h being included, when I build for arm64 
>> or x86, it stills pulls in cacheflush.h:
>>
>> ./.drm_cache.o.cmd:838: include/linux/cacheflush.h \
>> ./.drm_cache.o.cmd:839: arch/x86/include/asm/cacheflush.h \
>> ./.drm_cache.o.cmd:920: include/asm-generic/cacheflush.h \
>> ./.drm_cache.o.cmd:830: include/linux/cacheflush.h \
>> ./.drm_cache.o.cmd:831: arch/arm64/include/asm/cacheflush.h \
>> ./.drm_cache.o.cmd:1085: include/asm-generic/cacheflush.h \
>> So it seems without including it, cacheflush.h stills get pulled in,
>> I think its because its a required kernel source to build the kernel
>> per specific architecture, but please correct if I am wrong,as I am 
>> still
>> trying to understand how things works!
>
> Probably:
>
> drm_cache.c:
>
> #include <linux/highmem.h>
>
> linux/highmem.h:
>
> #include <linux/cacheflush.h>
>
> But it is more correct to explicitly include what you use. So if 
> drm_cache.c uses stuff declared in cacheflush.h, it should include it.
>
> Regards,
>
> Tvrtko
>
>> Michael Cheng
>> On 2022-02-25 8:28 a.m., Tvrtko Ursulin wrote:
>>>
>>> On 25/02/2022 03:24, Michael Cheng wrote:
>>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>>>> performs a flush by first performing a clean, follow by an 
>>>> invalidation
>>>> operation.
>>>>
>>>> v2 (Michael Cheng): Use correct macro for cleaning and invalidation 
>>>> the
>>>>             dcache. Thanks Tvrtko for the suggestion.
>>>>
>>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>>>
>>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
>>>>             symbol that could be use by other modules, thus use
>>>>             caches_clean_inval_pou instead. Also this version
>>>>                 removes include for cacheflush, since its already
>>>>             included base on architecture type.
>>>
>>> What does it mean that it is included based on architecture type? 
>>> Some of the other header already pulls it in?
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>>>> index c3e6e615bf09..81c28714f930 100644
>>>> --- a/drivers/gpu/drm/drm_cache.c
>>>> +++ b/drivers/gpu/drm/drm_cache.c
>>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned 
>>>> long length)
>>>>         if (wbinvd_on_all_cpus())
>>>>           pr_err("Timed out waiting for cache flush\n");
>>>> +
>>>> +#elif defined(CONFIG_ARM64)
>>>> +    void *end = addr + length;
>>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
>>>> +
>>>>   #else
>>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>>   #endif
