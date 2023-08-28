Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18E78BB50
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 01:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC95010E36A;
	Mon, 28 Aug 2023 23:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBBC10E0FF;
 Mon, 28 Aug 2023 23:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693263709; x=1724799709;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Axay2CmoFLINkI4c20JNscnwvxrBmnOyCR+AGqJY64=;
 b=efORlKyjVbPIDGdkgA+hfsUtmtJD/nTq9R2s7ogg+ZkIpgb6N7zAygyZ
 fR5Je8Lf/NYetsZnqoMSd9TpUTA3YrA59me+NP7J0Nb7Z+GHoeYSZQeyU
 Nxjxd8Nbq04c43n25BK7H3F/LyzDLAb39MaOwgBmECbX2H6nYsgmGBhcq
 qrRUanEt1HbwD2gKuuwpcoEi/J6Tov/oDL5pKdnYzuVqah0Qvj9B2ydns
 r/sinHXR3MRskT8U3b8NPpiFrPm5IbQx9MLyrQKjKFNZdnkGItyPGP7uL
 IVd3qg1BNAYf7sgRH170zSzqiM4xVS9HXIrmLqVTS7E8UcY/l6TTbn7rC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439174088"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="439174088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 16:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="715303583"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="715303583"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 28 Aug 2023 16:01:49 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 16:01:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 16:01:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 16:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdM8OuApg0yYDNPqHulYFZa7/43bPApH18aJ2EoYiwrYRcLOReW8TIQ/RJd9hkoTUgFMlxhuJG+C+T3fg09f9XZFe5iSC3E01bs6t8Vu99fSIuCKNgr+TCZpiXzIQVgtE56Xk+9RRNZTXeQ5WU/kHO+9pM4fIAskssNAQ0K3dJxnkQhepatbTNekDSUyNsUggrwVvmBxVgz4jd9PeFbL31WlgDRy7zVsUO1iYIAT2Wvx61vC5CCKhnu5egWGSuW2LF4Z9ijxaI8eFgom/BtQHcmmNxrdELo0ZHpaDNVDqGioMEyy87P3yEyll92MDDQIN3HIWM9Xdpu1JqO8jhKxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ejs+Y9M7QreE6u3+uc9OhNaEgfTrd5gRgY899mxFnUc=;
 b=KAjqt30MnQf7TX5YRvaJ5cDJrA7+6Yhhg3NjAxzaV7LTeTWhWyiA5hxWDbxExnpq1r4qZU9JCAyGNcs841lrcbuzYBvUdJuQcU/+xIaFIc1hgyClYtGiTce1vIU/XdmnO4RMPHSlQvt9S2+sJ4aITIkSY636PfJc4lehwWP+gn6HUR1af1+YjjnVvuqHSLkK9NQyrCaGQzZOacEJTdG6ZPerzEcHr2q9eJJ+WZx/FPEPbGgJR6h1vYiybY68a/AbjB59KMrbpT3s6aPdawJoN/J9MNpA0HRVK4X/meSlxLYylMWWj4eTRMHZPQ5pdUaTVLG7HXaAaxdmHyQf3C/WmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Mon, 28 Aug
 2023 23:01:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 23:01:41 +0000
Message-ID: <2bd0fb41-58d5-9862-143e-34e31f6f791f@intel.com>
Date: Mon, 28 Aug 2023 16:01:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Avoid circular locking
 dependency when flush delayed work on gt reset
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
In-Reply-To: <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: acafeeb7-86f4-458a-8ed6-08dba81abde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ra+cmgAEsBMbegx2bk9PhwHCT2dDNKfVYK1KXwKFJRBmQRqw9h9Cn1b4T8bdcxzLjEXySyHHx8u/YxieeSyYCaYE7Q9VZSnwPnM0OLA4oWJy0KK8aY80PaiZiBIX83TRD8dy2Aj+waLdqc7E4PcIRP9UJbEY0hw6CI9/g0ahrn+i3MO+N6hh2ilTJCdNX9+50mWG+ThmnFnsoGnUb2rZmo5IFL/lSMc03Qu6SMuA3W1cGZYgBaFT/qeeno38qRXZyXL1ip4Sbr8RUF1Hf3gfyqlyI3AcRmjqi7Ua5nGebJ7s3VV3iXV2rhb8HaCRFXp1tIsKRvwJNcFkvPUZtg1/H0aMXX7I8ys5bh/jc84DWJxQNjkUC/iSWdvPQafbJlxDgS0b5b8JnI6LD5JmaN3A4b5FuN/XxUYW3Yeuz6AA0niVi3Pzawebkt+iPDsRxlFixTdvrCMQte4hxV6pbMcobrZaqghkhrlerimJ7pdMDT7LiUnNSMYhY3+nDNbV1be55m7+KTEhdbHu0Z/RDnYAB4nponumyjfmCLqJnPj5LddhMju7+VINJk3j/w9QGkFseMQzlllTXzX63RQX56wQGDn5oX5o5Bmx6zM2TqfYyXX9hpmg0CE94rtkvk0Dd/P3jfnewUu5donm53x1xlhhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(186009)(1800799009)(451199024)(6512007)(6506007)(6486002)(6666004)(83380400001)(53546011)(478600001)(26005)(2906002)(6916009)(2616005)(316002)(66476007)(66556008)(66946007)(5660300002)(41300700001)(8936002)(4326008)(8676002)(36756003)(82960400001)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVg3blh5S1pCSGhhNjVyYWpZeDdZc1FLY1pRallGTTFhQmpUcE13R210R2Fi?=
 =?utf-8?B?blI5MHgxRkVQUHBzL2pSTXRnNUdlZHBNaFRDRkp6Tm41M2tsYnYxVGRidzVa?=
 =?utf-8?B?dVI3b1lEUm9lL2ZxOFBsbCthdTVYb1NuNHJZV3NVYzVzcnA3OWRhakF4alBy?=
 =?utf-8?B?V0F4cUdnZHVudEFUVEtJMXR4eC9JZkR4YUN4azh1WHgraVp4eTU5blIyVGVE?=
 =?utf-8?B?UEMwdUVxbTNwb1dJdENCZW94TGNOM3lzWnBJTUdYVUNxQVh5NEUxM25MUHBi?=
 =?utf-8?B?azBzSUVuZlFXZFdHc3RHVUkyc1hqTlptajFyTFlJYkd1cUJBYTJENjdLWW1i?=
 =?utf-8?B?c1loQ01YOENFV0JodEc3VUJoTzdnUUM4WUpFSVlPcHIvcHVjVytjdlZyMDBu?=
 =?utf-8?B?ZUkwSGI2YlJBWHZhSTlrNUltSWJuMmhDYlY1Qk5Qbk5zNDJ3THhremV6RWJ4?=
 =?utf-8?B?VitOSGNhN0wxMkVhL042cHlnZkwwYVN2RndMVUREeFJ2TVdBTTZoMjk0OFFS?=
 =?utf-8?B?c0d2dGNXeTFUa1IzTGEvaFlGRTR2dDNHeW0rWTJ1c3RLZERRRDRFVlN0ZGJN?=
 =?utf-8?B?ZG1OM3ZTbFVnWmZob1ZyN1ErTms0dklmWWhJYXh1WGNGdVNUS01HUk5qemdD?=
 =?utf-8?B?SDR2RmYxZUJSaTMxWHluNEtPT1N0dTVvQlBKRHVIVnhWK3hNSVRZcTIzQmNX?=
 =?utf-8?B?VGZBaW5YZGk5SkFnallDRVVEQThzMU4xeWlKRENJY3VnRmRiZU8zQWhQZDZI?=
 =?utf-8?B?WlFRZTl1VzJPS215MTRVb05xOFpXZGNwa2VFb0dXN3JLbEJyaW9IWk45aTJJ?=
 =?utf-8?B?emJUZ0VCV1lYZnN0TE1xejM4aU9BcDlEQXBwc20zLzBJOERRMWtid2k2NVB6?=
 =?utf-8?B?S3hRN2Z2eFBuRkxIRVRjOGtMeFg0eGpibzZMUVZmWnE5UDRBTUlqNXBQRkEw?=
 =?utf-8?B?dzJuN1BqVnJFVkxUZE02cVRjMXpocjJwMVV4ZEZ6TE9haWoyZmZrTTFPMFhz?=
 =?utf-8?B?ZkhRQzlLTmtmdXg4bUFSaUF1RHRmTy9aTFFBaFp5OE5VYzlPajVLeEdlRWta?=
 =?utf-8?B?R1VEcTB1OG9PaG5zUnFybjE1c0Z6ZGprOUlPWU5aTDVxSW91QTZlaW5zOHNr?=
 =?utf-8?B?bXFwdUZQNUF0anRTUGlINFZMMXVXb011RVd3NmhDTUJtOGV4ZUpCSVBZN0Q2?=
 =?utf-8?B?aTZtcDZVMHZIMSs1cUZXRVB0T2hjbElxbFJ1ODRFR0tOaURyWTZ0MVQwU0Ny?=
 =?utf-8?B?aDRGOXBCTlJ2Q1lEQjJlUmVIMG1UZ0hudXJBUXBxa0ErZ2p5ZUxkRnpBVXA1?=
 =?utf-8?B?cDlCdFEvU2d6Wk1YbFVFMU5VTWhFN3FaRmJqRGRBSXlodjdpSEZJUlNaaVRK?=
 =?utf-8?B?T0g3Y1J6ek1rNVB0bHFJMnRtczRscHdHQ1JydFBTdEo4TnZZdzhjT2luZXpy?=
 =?utf-8?B?UWNIREFWVVF3eTBaYTFaZTR4ZmhiSVRqa2l2cUNQVFgxTU03dzVpQmk1MzFm?=
 =?utf-8?B?NHZNb3dUN2Y0TzRlV2xKelF5Mmc3dUllV28rNThGOXVxdTdickJWMDZZZDk0?=
 =?utf-8?B?UEREMEV5YTNMUHhtV2pKZW01MGRFdGI5dGRaSTFOV0V3STVBdnVqeGlUZnl4?=
 =?utf-8?B?dFZRQWlWcW93Mmsrd1drMEg0TytkYjhndnI0SG5SdHRpb0p2WGNTNC9LcTRE?=
 =?utf-8?B?NkZndnRxNHVjN3FQdlA3U0NKT1ZuQU14VEdTdVM0d1UvckVTTHZYMmtwTmxG?=
 =?utf-8?B?aXJvQ0p4UGVoekFSNGhQOEtYZlRhWUZoRHV0U0IvQ1NQRkxCQzBIZkNDUmpi?=
 =?utf-8?B?SXJjS2VSdXl1emtDWWFDSlB1WkpFVEFRcmF5OUJYUnNLNWFtcUFDbTQ1N2Zs?=
 =?utf-8?B?ZWNSZGg3cTgxaXB5MGEzbzVCYzVNVit2UUNJR2xyN0RLOHVxWW1GUHVwMkVn?=
 =?utf-8?B?U0NGV1ZvUkpqb2ZIU2oydWJBMkNERE9RNkhvUzFjSjFmUXpvY3c5ZjN3L2dt?=
 =?utf-8?B?MW9QVURaaS9GTXBoNHpGQ3hlS0JRTTVMOTRwOGJuMnV1Y0RpV29DZ0lsRHpu?=
 =?utf-8?B?SWI0SlN3ZHVmRWdkbnc3SlFOK2d3cWhaSjVvajVpVnB3eHBYOXl6bmU2RCsx?=
 =?utf-8?B?b3VneFphVUZhU3JmVWJWL3FhSWU5MlZPSXlhYzB2Z1U2VjV2MHZ4S0VuVWFv?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acafeeb7-86f4-458a-8ed6-08dba81abde2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 23:01:41.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5XJ9/wb8NJVw/0t2hOuBaauyigp95MCze3kH0IeceAPOa/+FPGAS8c4EQ+iEKt1LdM2FkeqwzBAZtR5ky+WaBqFNt3rYz0Rc9otb5BP984=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/2023 10:37, John Harrison wrote:
> On 8/23/2023 09:00, Daniel Vetter wrote:
>> On Tue, Aug 22, 2023 at 11:53:24AM -0700, John Harrison wrote:
>>> On 8/11/2023 11:20, Zhanjun Dong wrote:
>>>> This attempts to avoid circular locking dependency between flush 
>>>> delayed
>>>> work and intel_gt_reset.
>>>> When intel_gt_reset was called, task will hold a lock.
>>>> To cacel delayed work here, the _sync version will also acquire a 
>>>> lock,
>>>> which might trigger the possible cirular locking dependency warning.
>>>> When intel_gt_reset called, reset_in_progress flag will be set, add 
>>>> code
>>>> to check the flag, call async verion if reset is in progress.
>>>>
>>>> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
>>>> Cc: John Harrison<John.C.Harrison@Intel.com>
>>>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>>>> Cc: Daniel Vetter<daniel@ffwll.ch>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> index a0e3ef1c65d2..600388c849f7 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> @@ -1359,7 +1359,16 @@ static void 
>>>> guc_enable_busyness_worker(struct intel_guc *guc)
>>>>    static void guc_cancel_busyness_worker(struct intel_guc *guc)
>>>>    {
>>>> -    cancel_delayed_work_sync(&guc->timestamp.work);
>>>> +    /*
>>>> +     * When intel_gt_reset was called, task will hold a lock.
>>>> +     * To cacel delayed work here, the _sync version will also 
>>>> acquire a lock, which might
>>>> +     * trigger the possible cirular locking dependency warning.
>>>> +     * Check the reset_in_progress flag, call async verion if 
>>>> reset is in progress.
>>>> +     */
>>> This needs to explain in much more detail what is going on and why 
>>> it is not
>>> a problem. E.g.:
>>>
>>>     The busyness worker needs to be cancelled. In general that means
>>>     using the synchronous cancel version to ensure that an in-progress
>>>     worker will not keep executing beyond whatever is happening that
>>>     needs the cancel. E.g. suspend, driver unload, etc. However, in the
>>>     case of a reset, the synchronous version is not required and can
>>>     trigger a false deadlock detection warning.
>>>
>>>     The business worker takes the reset mutex to protect against resets
>>>     interfering with it. However, it does a trylock and bails out if 
>>> the
>>>     reset lock is already acquired. Thus there is no actual deadlock or
>>>     other concern with the worker running concurrently with a reset. So
>>>     an asynchronous cancel is safe in the case of a reset rather than a
>>>     driver unload or suspend type operation. On the other hand, if the
>>>     cancel_sync version is used when a reset is in progress then the
>>>     mutex deadlock detection sees the mutex being acquired through
>>>     multiple paths and complains.
>>>
>>>     So just don't bother. That keeps the detection code happy and is
>>>     safe because of the trylock code described above.
>> So why do we even need to cancel anything if it doesn't do anything 
>> while
>> the reset is in progress?
> It still needs to be cancelled. The worker only aborts if it is 
> actively executing concurrently with the reset. It might not start to 
> execute until after the reset has completed. And there is presumably a 
> reason why the cancel is being called, a reason not necessarily 
> related to resets at all. Leaving the worker to run arbitrarily after 
> the driver is expecting it to be stopped will lead to much worse 
> things than a fake lockdep splat, e.g. a use after free pointer deref.
>
> John.
@Daniel Vetter - ping? Is this explanation sufficient? Are you okay with 
this change now?

John.

>
>>
>> Just remove the cancel from the reset path as uneeded instead, and 
>> explain
>> why that's ok? Because that's defacto what the cancel_work with a
>> potential deadlock scenario for cancel_work_sync does, you either don't
>> need it at all, or the replacement creates a bug.
>> -Daniel
>>
>>>
>>> John.
>>>
>>>
>>>> +    if (guc_to_gt(guc)->uc.reset_in_progress)
>>>> +        cancel_delayed_work(&guc->timestamp.work);
>>>> +    else
>>>> + cancel_delayed_work_sync(&guc->timestamp.work);
>>>>    }
>>>>    static void __reset_guc_busyness_stats(struct intel_guc *guc)
>

