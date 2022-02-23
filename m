Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7904C07A6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 03:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FA910E58C;
	Wed, 23 Feb 2022 02:11:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D172410E56F;
 Wed, 23 Feb 2022 02:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645582291; x=1677118291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zqr8n0xLQ9tjB/OR4r2UFr3dSnTNlVO4lfYAD1unwnk=;
 b=Yf9riJkc1dMe0GVjyaaAzr/D2HzJwqtVGoGeVHfcVYO6OwWtejbxeUKm
 WMOB1LDXZZgsXlLYfjsISseZUEZo4RbXatavD1MJH0F4Djk0oAbtchLBQ
 irhqH8FAQyeBwAanRz00NL1LqFObx+THu4HHdzv17tOv97NCl0676Pm2Q
 n9ydEADxqsrAXnKiRkOaaPkKn/pFz5+bQ6e1mjXXgb2s++SxawSnYihRI
 ZTjlC1tq05Zy3TVY9DmxBoYmYcClQT9OxdFL2+F75XjapSDCMJrKlsR9d
 JgZGPbCQB56RhY/6weCMEuLywgmRYRmO87ZKE2qlHZh5eJ6x95IEJrs4g Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239252751"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="239252751"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 18:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="491021386"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 22 Feb 2022 18:11:29 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 18:11:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 18:11:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 18:11:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV1tC1HrllL0dJ+mpCQP4WO405EOSunroD7eYHTOx8E80wDNxZErOjbRSJpJJegopFeWVM4ys2IdWTitIR05iQbITMjxFA6RmvzeKoBxHll7JGNWbGzSkxmzWr6t9NHt7jrxkuHg9HA8sAXEgre53+pfgRVo7FMt03fIn05Mp5jWN4ZqczxIWn+rexMW/uLd90PRNrPEI15PzvLa3R+MK7dHOqyHiFOOFQiE4aPJD/yApCXHp8xENrGIS3mfOb296cUd4Cv/Zlo8mbEmphopNv1Xg2fbfTbYVJKjl1ECsL5t8HjVoQ1NVXEUJiN8B55Hy5ZLqrKfUVndQpSaQJEb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMBoWfQC7RNKufv7P0gF3CvlRcPEnz3IUKHjOcV6lSk=;
 b=naIFligeh4KVskIHzg+DnEidcyH/f2UkZNArQcEA1iKNAlGoieoLcAg5w3919E3O2cWTO2S9aDbJ1XnUiSwvGhYOPs5Z2/I7LDD0ndiktn5ukfUuLgf7Y0mn9A1Tr1oFMp5chawyimGA/mm6aErQbcVIaGxebA+yG64oIFNOLzkCoT5H2ZHkYJ6gcM698j16BPiHDnk39/Ayza5CxzVKet4HxOXzepF/bsxoVkJ9m8Q8/muR160sxEsAKZ8soGNa80M6cKS/dq9+J6FxGtrDftnBUCaSEIyKUy91qeAU3qOXeQlBXEZrMReNLhXa7Kw/0kpdBXiGW8pXEZ1nA+guDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM5PR11MB2043.namprd11.prod.outlook.com (2603:10b6:3:e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.17; Wed, 23 Feb 2022 02:11:26 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 02:11:26 +0000
Message-ID: <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
Date: Tue, 22 Feb 2022 18:11:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:300:ed::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e57b9f-a3fa-4e4f-8066-08d9f671cba8
X-MS-TrafficTypeDiagnostic: DM5PR11MB2043:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB2043D22756262B00BD492D77BD3C9@DM5PR11MB2043.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xgb2zT8+6cWBRLd9Hdbeebn+U90QH++gfc+jD772AEHDnovTrNxQJg0CLIlbv/CFxziQ6M+g6sCzetXMeQR9JKowE3bJtzZy5U2Nn3k4QAhPqqPWb7PLyb19WhopiekzeTMUkrrUqvV5Q2/boWiym1opREwulTw54U3DC+qL/mkjU4XzEmRiZnLmr7vSISGw1j1+Zh2W2Khb+bQkG4UqpEZ1pz4mFoGySZz3N051B+amo1Vc2p/Apv47ZcmbHRGMIP1vgS4rdTH9pn6vsNoQnTQw5QMyIVccy0Sqj6j+0x6Hwr1Y2DM3H0W5nGch5FvDt9klk1b2MiGR8hignAY+2n9XgPE+afIEWpfaKenAcdKJP8CyPvQm1thUnYTuE3LOI60Exqck1ESr7rvGx0ZlF+u66kQgs3FoaIK6UsqlSass4PfrgUjS9+7bkb1XVtjo7WiiQ4kAYFu1d3NPSpIIpw1gIEBOyeu0VDZilnpECKvxkIY4fKqNPrlZCj9uzpSjljuOY3n6h+rGW29nrrGAHLRJV2HID1xMfMJnTNMsye92fXx/DOg5fwrLG9x2xvZ7k3yakVn/xkYXEsqQQFIaZp5n/s+f9F+3/8Zwv/7WDix8cL1zjFWahvnpN/vMKhvRC1eCXg5To2BFs7oUczNLq7trf8ZIgYh3bDruo2N/YrsqZooE/kHwZLAo3libQ0aA1LovrYSxjm0KDnfYQREbHlcC9hdHYzNyNOG7qyWXN+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(38100700002)(83380400001)(36756003)(5660300002)(2906002)(8936002)(31686004)(6506007)(2616005)(53546011)(6486002)(186003)(26005)(6512007)(66946007)(66556008)(82960400001)(66476007)(31696002)(6666004)(86362001)(8676002)(508600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZGNitYSFU1UDVTOXJROEtRejhCUThyZUZEQVlxb3JQM2NqcDJjcE80YzNw?=
 =?utf-8?B?OStTUEI3ZUplUDZScHVJMlRNYVNqWjBxNCszbGQwc1hhcGRVTFFMYkRNZWUx?=
 =?utf-8?B?R1E3OFNjYy9PRllkSjVpZHExM3ZwbVkxTzdRVStpeDdRVWNJNGJ3L3hwT3Jz?=
 =?utf-8?B?KzkxQjFaZEVkelpvamk5U0VOTkJOY3owaUs5OStXN1E1VXdiZ3R0OE5mTTRw?=
 =?utf-8?B?S0FjMkpHVGtuc0pqWXJwRG5wYkZQczF5Q2dwNVlha2Z3MEZMQmFXdENmdHhn?=
 =?utf-8?B?eERoalNyK2d2OEt2QXVTMmxpZ3Rhd3dFT25aMWpHNmVoV1RlRW5ieDE3RHpn?=
 =?utf-8?B?SCtjZWszVmozS1NDVVp0S1MwTHYrTVh5ZGs5YUQ2SlN0MFdxYldMYWxObzFR?=
 =?utf-8?B?NTlZRnZHL3BiclFLSUpyRS8xeGdFWUh1WHllQVBTSXJvOHZoYlZCdGV5Z2sv?=
 =?utf-8?B?WjBkVDZmcHVmRFlQRW5YNEZSQSs4NE5tNHpxT2JUa3B2dmV2RldjY3phcDIr?=
 =?utf-8?B?TEFOTER1TG96azAySkF5dTd4S3F5eUZVWG9xZ3JuZWFUaThvTVIwTXFaSzg0?=
 =?utf-8?B?NWpkWFUxQmM5ZGlqdmhxOXd5d1NlZ2o0SmtUeGhybmllV0NLK3dIMnorYlFK?=
 =?utf-8?B?QmFrb2cvb09aVXk3WUpyNjBta2F3OG5xUVpzeWlZeEhyakNNUXpmQ0hCVVU4?=
 =?utf-8?B?ZU5tcVAybUlOODNqdWFxUXpVN05MaVhzbm1tUC9GZHp6a2xnSVFrV25vcUMr?=
 =?utf-8?B?WGROb2Mxdi90UFBHaFgxdlZGY09tUVRSV0VFT21jSjVSTFBnaEJBUm03Tldi?=
 =?utf-8?B?ME1RdTFKY1JjTE9VVWovN1F5K3hiRk9pN3FsYVdHaWlrbXh1bllPRUhVdzlh?=
 =?utf-8?B?VkNWa3BxcXJOTU13VlBwblF3TmVBcksvc2N6V0lCdnRqN09KbExiTFVWQnlO?=
 =?utf-8?B?c2JFRm9wK3RRR2dXcUp6TXJydlNHazBHUW1lMFRDYnQ4Yk1mRjc0NlQ3SjNV?=
 =?utf-8?B?MHIxM0d2ejdmR1A1dWpnbW5UeFY0UDNtdHZJRE1YbnUrT0Q5TTBxS0JMY29u?=
 =?utf-8?B?WWV6NUNxd1ZhUVB5dko0aTNoM3UvWmNYRW5uMHZxYlFVdG1mTUZPT1lDVjZU?=
 =?utf-8?B?UGRwZ0NUbnBhb3M3RFd5NTVRYmpWMUN4VGVoczBERVNIMEpjTG4zNitFVjdX?=
 =?utf-8?B?SU8vQjR4OFJqMU41blZKTHNGcVlWRGMvOVU2allpQUV5NDhTL2NDS1pteFpJ?=
 =?utf-8?B?ZVlUT0lRSWdPcFJpRlFmNjM5emdCZlhaVzdtbHVGbm1sYWZoaU9jMHhDenhw?=
 =?utf-8?B?N2N5dDVHalBmMElSSlVocklQc3NFUExWbHFNNmRhdnRMenFpbVNPZG9zR2FD?=
 =?utf-8?B?M0srS2Z2dUNmdHhycTNJeWdHNGNDbGdOYXJuRk9nQ3Q2a2I4cENYMzF4YVE3?=
 =?utf-8?B?RzF4ZVZ3bUUvVjFLaW90SEVISVNnMVVLKzdibmkxSVM3eGlIZVJZU25ZbDRq?=
 =?utf-8?B?a0VrRi9jVjFZWWpFSmJpajErMWVqY3loTkxsS2phTEVsS3JtMXhHWmcvU1hx?=
 =?utf-8?B?a0NjNkNhaU44bkZDcWFOMXo2WWtFRjZ2dzFTTVVsUjM4RHZqK0V1L0hJYTFq?=
 =?utf-8?B?M1VmbTNpQ3RYc1duM3JTL0RRL0pITk91RlhjRVFQbkkzUXRYVi91MFFkVHlS?=
 =?utf-8?B?dW1FVmFIbE9FdUV4TzZUVGgyaE0yUFRJNTB3dW42MG5CZmNkbU9oM3VmeGFN?=
 =?utf-8?B?NGJtTXFnc2lpUmNPbUQ2Q2k0N1NTZStic1hZdi9qNUU4NnpNNnZoNDFveHEy?=
 =?utf-8?B?WlJlMTk3SFEyM2hWb1ZBV3V5NlNicGJldDFpdmZXOUpHTlhPR242dkowY2lt?=
 =?utf-8?B?c2x4Y2k4aFAzQlFnclpRRUF1ODdxTXV3emxid2szQmc4U3NCRWprUXV3N2w3?=
 =?utf-8?B?RnZpSVFlWHUwVVAxdGFWKzJzTDcrUll4aWRic3c3MWlySzBPcFJuclVLVDZw?=
 =?utf-8?B?c2MycEhRVkdVV2p3Zjc3elFOODdka1BIbTFpaXhDd0NwVy9YcWlRYUUyR1FM?=
 =?utf-8?B?NDdacHBhdnczeWo4aHBQaFNScER3RWNZaGt3SG9CUHJDRE1TMkN6RHZZT0hn?=
 =?utf-8?B?a3FXQVZQRjNWUWs4Mk96U3JoMVJmU1VqR0syUWNNVDJiN2lpM1ZJbVprR1VL?=
 =?utf-8?B?dnBpcWxidDRsK09Wc3EzWWxxMy9zZUUwejVjSDUxMXNxdGYrYlR0Y2NaSngy?=
 =?utf-8?Q?l1eppr8guao7wPRDek6NQraGzRJ9NG5TVy9w0grHO4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e57b9f-a3fa-4e4f-8066-08d9f671cba8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 02:11:25.9440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGygH3rMK6gCpXtqbz4psujIZ2tTz4gJPyshf/Cx5tiXFCccC/zfCzVFHUF61SeybcjRnVlYTC91V4FipgZxH76txTT4NCWLlnbeQmauTj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2043
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

On 2/22/2022 01:52, Tvrtko Ursulin wrote:
> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC converts the pre-emption timeout and timeslice quantum values into
>> clock ticks internally. That significantly reduces the point of 32bit
>> overflow. On current platforms, worst case scenario is approximately
>
> Where does 32-bit come from, the GuC side? We already use 64-bits so 
> that something to fix to start with. Yep...
Yes, the GuC API is defined as 32bits only and then does a straight 
multiply by the clock speed with no range checking. We have requested 
64bit support but there was push back on the grounds that it is not 
something the GuC timer hardware supports and such long timeouts are not 
real world usable anyway.


>
> ./gt/uc/intel_guc_fwif.h:       u32 execution_quantum;
>
> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
> engine->props.timeslice_duration_ms * 1000;
>
> ./gt/intel_engine_types.h:              unsigned long 
> timeslice_duration_ms;
>
> timeslice_store/preempt_timeout_store:
> err = kstrtoull(buf, 0, &duration);
>
> So both kconfig and sysfs can already overflow GuC, not only because 
> of tick conversion internally but because at backend level nothing was 
> done for assigning 64-bit into 32-bit. Or I failed to find where it is 
> handled.
That's why I'm adding this range check to make sure we don't allow 
overflows.

>
>> 110 seconds. Rather than allowing the user to set higher values and
>> then get confused by early timeouts, add limits when setting these
>> values.
>
> Btw who is reviewing GuC patches these days - things have somehow 
> gotten pretty quiet in activity and I don't think that's due absence 
> of stuff to improve or fix? Asking since I think I noticed a few 
> already which you posted and then crickets on the mailing list.
Too much work to do and not enough engineers to do it all :(.


>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>   3 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index e53008b4dd05..2a1e9f36e6f5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>           engine->props.preempt_timeout_ms = 0;
>>   +    /* Cap timeouts to prevent overflow inside GuC */
>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>> +        if (engine->props.timeslice_duration_ms > 
>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>
> Hm "wanted".. There's been too much back and forth on the GuC load 
> options over the years to keep track.. intel_engine_uses_guc work 
> sounds like would work and read nicer.
I'm not adding a new feature check here. I'm just using the existing 
one. If we want to rename it yet again then that would be a different 
patch set.

>
> And limit to class instead of applying to all engines looks like a miss.
As per follow up email, the class limit is not applied here.

>
>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice duration 
>> to %d to prevent possibly overflow\n",
>> +                 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>> +            engine->props.timeslice_duration_ms = 
>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>
> I am not sure logging such message during driver load is useful. 
> Sounds more like a confused driver which starts with one value and 
> then overrides itself. I'd just silently set the value appropriate for 
> the active backend. Preemption timeout kconfig text already documents 
> the fact timeouts can get overriden at runtime depending on 
> platform+engine. So maybe just add same text to timeslice kconfig.
The point is to make people aware if they compile with unsupported 
config options. As far as I know, there is no way to apply range 
checking or other limits to config defines. Which means that a user 
would silently get unwanted behaviour. That seems like a bad thing to 
me. If the driver is confused because the user built it in a confused 
manner then we should let them know.


>
>> +        }
>> +
>> +        if (engine->props.preempt_timeout_ms > 
>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>> pre-emption timeout to %d to prevent possibly overflow\n",
>> +                 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>> +            engine->props.preempt_timeout_ms = 
>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>> +        }
>> +    }
>> +
>>       engine->defaults = engine->props; /* never to change again */
>>         engine->context_size = intel_engine_context_size(gt, 
>> engine->class);
>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> index 967031056202..f57efe026474 100644
>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>           return -EINVAL;
>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>> +        duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>> +        duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>> +        drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>> duration to %lld to prevent possibly overflow\n",
>> +             duration);
>> +    }
>
> I would suggest to avoid duplicated clamping logic. Maybe hide the all 
> backend logic into the helpers then, like maybe:
>
>   d = intel_engine_validate_timeslice/preempt_timeout(engine, duration);
>   if (d != duration)
>     return -EINVAL:
>
> Returning -EINVAL would be equivalent to existing behaviour:
>
>     if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>         return -EINVAL;
>
> That way userspace has explicit notification and read-back is 
> identical to written in value. From engine setup you can just call the 
> helper silently.
Sure, EINVAL rather than clamping works as well. And can certainly add 
helper wrappers. But as above, I don't like the idea of silently 
disregarding a user specified config option.

>
>> +
>>       WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>         if (execlists_active(&engine->execlists))
>> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>       if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>           return -EINVAL;
>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>> +        timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>> +        timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>> +        drm_info(&engine->i915->drm, "Warning, clamping pre-emption 
>> timeout to %lld to prevent possibly overflow\n",
>> +             timeout);
>> +    }
>> +
>>       WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>         if (READ_ONCE(engine->execlists.pending[0]))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index 6a4612a852e2..ad131092f8df 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>   +/*
>> + * GuC converts the timeout to clock ticks internally. Different 
>> platforms have
>> + * different GuC clocks. Thus, the maximum value before overflow is 
>> platform
>> + * dependent. Current worst case scenario is about 110s. So, limit 
>> to 100s to be
>> + * safe.
>> + */
>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>
> Most important question -
> how will we know/notice if/when new GuC arrives where these timeouts 
> would still overflow? Can this be queried somehow at runtime or where 
> does the limit comes from? How is GuC told about it? Set in some field 
> and it just allows too large values silently break things?
Currently, we don't notice except by debugging peculiar test failures :(.

These limits are not in any GuC spec. Indeed, it took a while to 
actually work out why increasing the value actually caused shorter 
timeouts to occur! As above, there is no range checking inside GuC 
itself. It does a truncated multiply which results in an effectively 
random number and just happily uses it.

John.



>
> Regards,
>
> Tvrtko
>
>> +
>>   struct guc_policies {
>>       u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>>       /* In micro seconds. How much time to allow before DPC 
>> processing is

