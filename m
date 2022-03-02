Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A64CA9B4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B06D10E4C7;
	Wed,  2 Mar 2022 15:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6FB10E4C7;
 Wed,  2 Mar 2022 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646236537; x=1677772537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UnJMuGAzinfJ94XnEahCj9hLgtroscF5+M10T57X00w=;
 b=hqvEo+mr3HWxiWMk9qkk/DAXTbWFHSM0G0Y63tbu4f7h5dNwoDKkUtMK
 UxQzsvuPFDf1JnLNJv+Ql7vWHfrjsqh+160V6VDlqKFlrk9RnCG65IlYP
 YA6YN84n5l0S2+i7GZYUcBIkyEZu50F0aSE3N9MxiiPG0zjD3aYrEfJGi
 46HDoSMmCCM3DwMKfizBhh1EUFmESOgKQSzp4ErxB+yu3GQwlQ611Bgk4
 xPgKOdILiCTlkDSxLvQYbmNB9pw2Fc7Uv90qIvFfUq3x4ZCOU2VdudIFZ
 cEhzcbXmXrwi0vpTpoU+J9rwSNuFihJu8W1GPRK3H6S4OGWtsmsx38c7R Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="236942458"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="236942458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 07:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="639820246"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2022 07:55:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 07:55:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 07:55:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 07:55:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Mar 2022 07:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBQ/WLOKrUaYVzloBRnm802ot0lFcBuSJ/WLclpVQLiL2EpuGo+sdTDU4ga+f8onUVxae2O1lyY7QzuX5xUPq7A8PbkSPqq8j7ahstowtZyCAmZl01IyKJygEN/dOlz472OyhP09ATYGqxCOZnFHsl/hMlbvSjUxG5cns7QCrbwvVRdu525mAbziiIqe0bQ5Cu93xhSpizH3qp41SmQXvekzF+lUuHHrwkMniWZccWBxBv+nRrI1FxYWRgaTPWeD3Co2/WCg2iRR6axHYmmyxSIEYxMxcO8anKpwN3UrKIEUHZxNHLGRXQuiqAULpGwagN/JNaVWYubQfrAHiZGoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEdL08xiFRwt2Tp2IeqvZiHPv/qzjv3/R3MHWGSQXQk=;
 b=QWt6iATQNGx4O7pgCQbJoeroz4AECr+hvW60mhJuNBXESlHF+4+Le3IRlpsXcPWWubbL/YRfXiua0DoOXUBzyOt8GD63Um+r1T9RjIzrlcPfvNCRtEqIxCXviU+SwujkURHSBdm3i9uedwwKdHeDN9rxAHrykRv0unHfmFkXxqDTQheJV34xx/b3ZKhKNnuVE8z0+14qcDcXEQmHTaoRzZAldKLo2Px5DFp5yhJwGP5+aD7eMwWpXOzB12rUlZ0rKWC5Hj29c0cqJQNTh2VlEIeSjzQDGP6C78zvzJBnuuVKRU4fLDKoBYbEU7+gB7A4pU+qxpxQePkK1We8fxDNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 15:55:32 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 15:55:32 +0000
Message-ID: <49e4a740-c127-0d5d-e2e8-3ff482fdce3c@intel.com>
Date: Wed, 2 Mar 2022 07:55:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, <intel-gfx@lists.freedesktop.org>
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <5c254623-98d2-75f3-52cb-209b8de304b6@arm.com>
 <3750c398-e8fb-c4e1-ba31-e6ac5fbc01d0@intel.com>
 <2f82d150-47c4-d7c3-50da-eaf4aa4a24af@arm.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <2f82d150-47c4-d7c3-50da-eaf4aa4a24af@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:303:83::21) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc1e73c-661f-464d-a92e-08d9fc651506
X-MS-TrafficTypeDiagnostic: PH0PR11MB5096:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5096C443B6641C3E1EDE47E3E1039@PH0PR11MB5096.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sl5kBP4lfyK1Wdl7ssKzBNKWH+GgjPYMTnp3teMG/qSj0Hz4hPz1VYe5/wDhW/OjKXkOiWX53NXh2v5sPWJqm1XSmgt7I+4n5wmWoaX4BMEyz4g64/y7pCXhTKvBc06LrC5YTGgfSNZYw9nMUuSrB+FX5/cWzl2pEuhsJRS+lcQCtbbL325X4QVVWpNbfHUMr37QWRXEfurxK+tfTpjTz51h4TEFr8kX5KYHfO2sodSzCvnL1T+eNVzZxBCP6tj00QZi+QWaeqH1w3rNujH3zTPON4r0QTNotwEvBh8LI1HnofoQf6p6Nwc4PFg9NAYCEpVsiKu2EYp2Kqcv5iS0cWBqkNiw2jE7VyNEsSegq5NQlNafWfpsE6iNpCZWjkMl2Jtc3OfvgJoDcg2eQiWw2pVIJ1sUwznPvYMk0P/DoLiVNOw4kZRGVpBep/ikNXyPNPg8+5qcwAVwfuk5btAG9dQcktCgY5dhijIlfJdsCSSKT+YBEW4959iOcLMmkQBkwX2RhZG4TeDxzE7AegW0A9HJFeu/jWhnLD+r7zLTuQDH5MmTS9jR42fP9RL98MnMO6WDsJWfqQz1igHe3u5WkF0j4aon+pPfH2WeB9/CkmdqU9cklZrlGuKGAil0KnDgaatmWHx+OCb6YYDs2LvV9E5yCPJ0YvEqzw56d001cn+7zxH/N6hAU8yuuBRBywirTN/KcwUv8QWrq6PnFsA1XikFyofVBAvJqnsO913csoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(6512007)(53546011)(2906002)(6506007)(2616005)(86362001)(38100700002)(31696002)(83380400001)(82960400001)(54906003)(44832011)(6666004)(5660300002)(4326008)(31686004)(8936002)(508600001)(6486002)(66556008)(66946007)(66476007)(36756003)(316002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxISjQ4azZkM3FuNXdRazF0enBZeVBuei8wV2NLU1N5VzJpdUZEcGhZUkVM?=
 =?utf-8?B?ZnRYMTF1eDNudWdzN1RpUXBDSy96MFpUSTk1NUh4ZG9OL054NnExZS9NMEcy?=
 =?utf-8?B?SGxNTUhwTWx0eTlaTHM4cERLVHp6c1p2dG1LcnhDUXJCR2MwODdkTHVqRGJL?=
 =?utf-8?B?cGlvSzAvbE1JdGY1bHZRYk5Rd3NwRG5rWk5KS2tNZmE0VFRTQ3JhbnRTc3pi?=
 =?utf-8?B?emRQaXhUT05lbnZBdHF1eTgvbUVsZkczdHVPVVY5cDBNcFF3dDdwVVlkd1pL?=
 =?utf-8?B?VUtiRjhiMDRpMjJ6aVpMTHU4TTRZd3pHS3phRXpsVGtqcEQ5VnQvWUU2YkpQ?=
 =?utf-8?B?N0ZnbzhyZnFNbGJEeGFpSW5JZ2M0UW9Pemd3ZUtsVi9ZSHJSeWFyWG1hVDJW?=
 =?utf-8?B?ME8yT292a0l5WXNEeEVzREttZTluOFZERDdBQ1pPMjZodUZ5cDZtZjFJeC9M?=
 =?utf-8?B?SVFnRFpGOWNFMlVvMi85RlN3U2lBU2RaTHd1clhkWTJRRUQwY0pSdTRSM0t3?=
 =?utf-8?B?UTN6TDd0MjlLYm54eGNNYWp1M1RVK2lLd2RwcVpkM3VTZkN2NjBFZ1Judmlv?=
 =?utf-8?B?RENlTG1QRnVYeUFSVGVxcDJjNEEycjVhRDBtSkJtOW5DL3hvTVBFVkhtTUtt?=
 =?utf-8?B?clZTZ3paOVF2TE12cng2UDcybjYrMVlZNmZCdlVjcDR5WG9YMjZHajVGTGRE?=
 =?utf-8?B?ODg1Ykt0dkNRYUxoZVlpWHI3ZVBRUlRHdjZYc05vNG1HalFJc1FwN2x1RlJW?=
 =?utf-8?B?TU5TSkxWZjI0emhFVFg0NWtRc25FNVdMMXRIUlp0OXI3UXQ4RjhoM1FQNlpw?=
 =?utf-8?B?UU5GTE5XZkQzYzViNVdpb0xEYi95amI2dXlpbzFsc3QzS3I2WHlvOGdNakk5?=
 =?utf-8?B?aW5NZ3FuaE5ueWkyVEpQZkxSdE43emJHSjR6U3BIMU0wUzh2cjNkcDFDemxD?=
 =?utf-8?B?dlhnU1IvWWtxakd3Rk0wakM3L0VFZjRNZE9JcUxtaThianRYdDAwWDkrMFJV?=
 =?utf-8?B?OTVzay83MWtXL2ZtcXIwd3M0dUh4MVp6Z3JuV0VodnUyUGhWTTVzSGloSElk?=
 =?utf-8?B?ZTdwb3AyYTBnL3crZFBSQ2d6VkZoRE5GcHBiQldQNVRmaXgrdDB5YkN5U21a?=
 =?utf-8?B?bTVIR2dZbXN4bU9nVGY1VEx4dThXWk1abnc4OVhkeGdxdU0rU1NHR2lMN2VU?=
 =?utf-8?B?K1FrbEtnMmNwbTBaYkZsZ0YzQUw0RHNBbk1IUXNtbHV5ZXQ5cEJ2d0RKYTY2?=
 =?utf-8?B?SWxyZEM1bmUzYmNXWExLSldvL3ZaQmZhaHh1dDhNNE1GdDNXMG9uNVFic2Uw?=
 =?utf-8?B?SEVrUmxRMWRGdU14UndmSkE2dnVod1VyUnhuaWptSWRSMm5RRE9ZdU1LQUlz?=
 =?utf-8?B?Y3BZaVZNbUxjTVpBdGlJQm91S0VLL1BJbEJHeVhNS3J0bFF5R29saEpzcmJx?=
 =?utf-8?B?UHpmaVAxNXRHZzFaVnI5N2FKdUl2c2g4ZFZLMENEZEJNVU9JbEsxRC9oWXph?=
 =?utf-8?B?QlpwY3krNUp1TlhwSHVjVWlCaFN5WnE1ZWtGZTg0TjducXk5UUFudzZnSzFE?=
 =?utf-8?B?SGo2RzBNVzNlNzBWOVZsdDUwSzcydXVuT284MlY4QmxCNWp0UE9BcmFMVG9M?=
 =?utf-8?B?WTlkZTFPbHJQTENGbmRCSFM3cmszNmZvZ2VVZkdBejNQdFBIeGJMYW9hSkdN?=
 =?utf-8?B?UWlrMkx4OXdMb3JiSDBQUWY0ekNMbVJydWIzVTltZ2hMaXcwc3BqSlRpM054?=
 =?utf-8?B?MVQzRW9FM0I5MVltTDgyd3RXSDR1LzFFNWJkMmxKZFhsbmxKS085Z1NoKytS?=
 =?utf-8?B?NlRuNTBFa28wb0paUlBSelZLM0E4cWhPVURmUVRkM3ZWdG9GMG1wKzc5N0pC?=
 =?utf-8?B?UHcxT3VmNDQ0c2FqNlp1cHc0UHlmZ2ZHZUVneHMvd2x6WEJZSHhCSXpwR2lH?=
 =?utf-8?B?cEFEMWdhL1I2SkpXeW8wVXI5YWFXc1oyVGZaQXMrYUtmcUFiNFpmNFVtMGN6?=
 =?utf-8?B?bHJYajJiejBnNm1TdFREalVYTnA0OFhNT0pLaWpPY1FuV002NXhyQSs1bUw3?=
 =?utf-8?B?MFBZSzJaSW4xbjIzOFJjeHQveDBkOWRYYlRtV21taEF3TmpKNSsyZ04reDZE?=
 =?utf-8?B?cG0zVHZTalBoVExmWDJPdVFZQVM1RTFlN3dTWDc0OU5mdkJDVWRkQWt6TEho?=
 =?utf-8?B?TkRKS2h6RUowRWJRdm43T0NFRXlxOHJHYzdQaEZoRGVoVDlWYkNLZ0JLVVZS?=
 =?utf-8?Q?vq9ZE+k//Ty6ihyw0akktsOXqFks0itFXFNgiuNTCs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc1e73c-661f-464d-a92e-08d9fc651506
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 15:55:32.6790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB4jWS8WQ3creROxpM2SKYzhUBeqTSiQsB8VPDBXTWbY3okgydQTuK9M+BeRP0GUoRZDgJMwB3VzuHK6jhCgxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the feedback Robin!

Sorry my choices of word weren't that great, but what I meant is to 
understand how ARM flushes a range of dcache for device drivers, and not 
an equal to x86 clflush.

I believe the concern is if the CPU writes an update, that update might 
only be sitting in the CPU cache and never make it to device memory 
where the device can see it; there are specific places that we are 
supposed to flush the CPU caches to make sure our updates are visible to 
the hardware.

+Matt Roper

Matt, Lucas, any feed back here?

On 2022-03-02 4:49 a.m., Robin Murphy wrote:
> On 2022-02-25 19:27, Michael Cheng wrote:
>> Hi Robin,
>>
>> [ +arm64 maintainers for their awareness, which would have been a 
>> good thing to do from the start ]
>>
>>   * Thanks for adding the arm64 maintainer and sorry I didn't rope them
>>     in sooner.
>>
>> Why does i915 need to ensure the CPU's instruction cache is coherent 
>> with its data cache? Is it a self-modifying driver?
>>
>>   * Also thanks for pointing this out. Initially I was using
>>     dcache_clean_inval_poc, which seem to be the equivalently to what
>>     x86 is doing for dcache flushing, but it was giving me build errors
>>     since its not on the global list of kernel symbols. And after
>>     revisiting the documentation for caches_clean_inval_pou, it won't
>>     fly for what we are trying to do. Moving forward, what would you (or
>>     someone in the ARM community) suggest we do? Could it be possible to
>>     export dcache_clean_inval_poc as a global symbol?
>
> Unlikely, unless something with a legitimate need for CPU-centric 
> cache maintenance like kexec or CPU hotplug ever becomes modular.
>
> In the case of a device driver, it's not even the basic issues of 
> assuming to find direct equivalents to x86 semantics in other CPU 
> architectures, or effectively reinventing parts of the DMA API, it's 
> even bigger than that. Once you move from being integrated in a single 
> vendor's system architecture to being on a discrete card, you 
> fundamentally *no longer have any control over cache coherency*. 
> Whether the host CPU architecture happens to be AArch64, RISC-V, or 
> whatever doesn't really matter, you're at the mercy of 3rd-party PCIe 
> and interconnect IP vendors, and SoC integrators. You'll find yourself 
> in systems where PCIe simply cannot snoop any caches, where you'd 
> better have the correct DMA API calls in place to have any hope of 
> even the most basic functionality working properly; you'll find 
> yourself in systems where even if the PCIe root complex claims to 
> support No Snoop, your uncached traffic will still end up snooping 
> stale data that got prefetched back into caches you thought you'd 
> invalidated; you'll find yourself in systems where your memory 
> attributes may or may not get forcibly rewritten by an IOMMU depending 
> on the kernel config and/or command line.
>
> It's not about simply finding a substitute for clflush, it's that the 
> reasons you have for using clflush in the first place can no longer be 
> assumed to be valid.
>
> Robin.
>
>> On 2022-02-25 10:24 a.m., Robin Murphy wrote:
>>> [ +arm64 maintainers for their awareness, which would have been a 
>>> good thing to do from the start ]
>>>
>>> On 2022-02-25 03:24, Michael Cheng wrote:
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
>>>>
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
>>>
>>> Why does i915 need to ensure the CPU's instruction cache is coherent 
>>> with its data cache? Is it a self-modifying driver?
>>>
>>> Robin.
>>>
>>> (Note that the above is somewhat of a loaded question, and I do 
>>> actually have half an idea of what you're trying to do here and why 
>>> it won't fly, but I'd like to at least assume you've read the 
>>> documentation of the function you decided was OK to use)
>>>
>>>> +
>>>>   #else
>>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>>   #endif
