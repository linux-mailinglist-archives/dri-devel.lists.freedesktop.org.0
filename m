Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28366689948
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1163D10E21B;
	Fri,  3 Feb 2023 12:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C1C10E78B;
 Fri,  3 Feb 2023 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675429178; x=1706965178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d/VOZRyF+yCZ79eNJY9VgkBS5WPCsNF6ZpxyRlnccUk=;
 b=B4KaUlD+I/0CqHRwuRI/YPxO8629p2DGm0X08bSY4Au4OkjY50TQM76w
 ddUIAqzTv2cTOtWiAc5I8lkqfYFkKID3Gmq/CvfBHq86vgo9HJ9HG6T9r
 3BhyBUvuwGUyhINVIwe8JaBlX9qujinmq7ImZdicgAUskdTAW8266amc4
 ZxwJ4uKe295zsghvqBpGyJ/l0S66D/ChJMxCCLG0k8r1vQl0P2KxiMtcq
 YhzJq0+3f5SDcWN2YB0u8BCUxnDyix6qRw5kOKehaowY9SW0lRupBtgmd
 khRYT/NCHxwfAwTTbmvZHsDlWa0VnEmYTbW1c+3HD8kMX1AWFI6j6azuj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330872932"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330872932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754483996"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="754483996"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2023 04:59:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 04:59:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 04:59:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 04:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAgrft0SXNBwRJcLyka+i64xce+231w9wAB54Jgx4jkJ20RYuT4nBLoUmHhS4XwtrdcG0/rDf0eRPffVnG19co/OpCV358PUrNf9Eiuc4bG4Hm45AaHUkY/+YP1qSnvIbuT1nkSRhi42GUobwAQ50mxMHNGa6wT+fF89DKJeT6r741+2xAgOM3PafbyYaFHoWYTjJWH3WUYlgoF0cZ6AUnIjth/LX4qc517jeU99NzzL3MwXyN9LAI8g8jxuLw72RIu5SaJgDbeSccMOy2g5fNclZlADrjD8ySH5T9eLaydoG9tZ2sxoqxNbBAI4pZGMiCjrlQCWdxqZwavMOYH3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmWB7JJdNKeDPY74qsYRi4cX2yZPtvIawvcB1SNsmcc=;
 b=CrwkZffE05ytN9o9jNLY9u3bxK7HreRiZpgQP8aILL3QHom2pIyotpfqAiyZutOpJaq4aRLyAYmWYcaPQJKLxxhZa0sjI3LXnQsFHRyIyeS18bYuU/usA0ehZUtkRnRlftfmujS0OsoxhF4IaL7FS4E4ZTYDs2tK6Fu1mGDERDVEaCYI7RkPuCZaZcyACwBv7vBB/oSAp0QhB5QAVGemYJAiZ19zM2fnMV0xDezin10HYkR1zkMZIoJ5NEH2pLKEqJobEAUVtSfOdqMVtPc5UFUfwA6smBPRhc3kB6kOXuEWGimW2P3NVcAA7APi6V92+4rW68Y5hV/qRvOhWcGFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 12:59:36 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::b4c4:d01f:9658:5371]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::b4c4:d01f:9658:5371%9]) with mapi id 15.20.6064.024; Fri, 3 Feb 2023
 12:59:35 +0000
Message-ID: <39b909c1-42dc-b762-7af6-a66fc6732f56@intel.com>
Date: Fri, 3 Feb 2023 18:29:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] Initialize the obj flags for shmem objects
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
 <f0dc490d-756a-d0fe-a519-3730be0707d2@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <f0dc490d-756a-d0fe-a519-3730be0707d2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA0PR11MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d5dc4b-272b-42b8-b344-08db05e68032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bY/srn8NZ/7WOVGQpQaGmgg8syW/OnbOPa5pb9rciUEDdIT/Tr1vLZHpKZag9EJHBWVdtKDTRugi505MTvhHRKPEVSzeYq1W5VDV+2xpbLmV4cfBdxaTzl7Cl0KC4zVt33jNSHANZnZJ/j0opHp0QSzOK3610ozyhNVfEUt2JrgZVl/BzQrTkB2jI0mH2lujzAxRJZimddaFWi0J55M7vT/YJKuYQeihrXEfQm32RYOU2vCfCC/HrmwlOkjEegUxlseF+VkIHKjlRIt7txFz2HjMw+sD7ZwYgeoMikp29RnQThtkQ0SWXS9fphofLRsl81pSQ0GlN2RUe9F7ysw6Lvw4WzxI6kkCadkS/9OiyhH8hhQ7B0UJYcZCTeG9V5qltTr3V6E9AG6YH+vYp8QIPV6bODPDia2kBROlgfW4TgB291q8Lpy0iwLXr44hm9IfODS06RwGZ9MPfVR1uEZNL6Nc7CZEgVzpHCXKFlve6dVnQoGsS4jI9u4RgHDvapoETV6QGsXNAS+iGnoI92vwLZ6daJJ6wOppPWMf+7oc0Ycp0R86OGvmlxNHH7CQKt7zDXJxZRts5SDcCKbY1GvmI9ZB1CV+Q+CMrCdrMXhr/OcwrduJSJnvZ0MZnMrZp3H1KwbjkU7P23tH2LKNK4jhUbB0wwLLXuPXNkt5nSI1Gl0UTLk8GC3t6JwW9uXdM2XeTY5hzapE692Dbqr5s889ueMiWqv6IHovMG8UvrJIB/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199018)(31686004)(2906002)(36756003)(5660300002)(478600001)(6666004)(186003)(6512007)(26005)(6486002)(31696002)(8936002)(53546011)(86362001)(6506007)(41300700001)(66556008)(2616005)(83380400001)(450100002)(38100700002)(8676002)(66476007)(66946007)(4326008)(82960400001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THV5ZEZidTVkb0xtaHRUdkRyWlkzYkZWOFY3S3htVWlOdERncGV5ZkYvSm02?=
 =?utf-8?B?OTJtV01OdFZDSFVYYW45KzJoSDdqZCtTakZpcFdVVjNFYVVjU29TT0RPTTdi?=
 =?utf-8?B?bGlIYjRkMlMwTXVSNEdWM0FMS3hxTGdra1pRNzRudS9Kb05UR3hGSVZOMkd3?=
 =?utf-8?B?V0R6YWhXajhqOXh1dy8xMTltS0ZycG5yaDJnYjdTT1loN3NUaFRHc1pDNElH?=
 =?utf-8?B?dE5ITGROME9HSEZtVmJMd3FwNzh2dGFWdFV0S0l6SHVMOWM2RWFMYmxNMytm?=
 =?utf-8?B?QWxJM1FoazJtR1gvMXJDTW1jZWhrSXJnc1lXZzVmSzM5OTZoUnoxaUIxMEZp?=
 =?utf-8?B?cVVtT2Q2VDBKWTJQR2lIRFgxVGZ5eHl5eXpBM3Q4RWcyN0dNNEZOZVc2OXVF?=
 =?utf-8?B?NVEyTGRpYVVHWUJ0dkx4YTBwSUhmVkcwL21UOFRvSzI0K2NmR0ZTY2NHVTlC?=
 =?utf-8?B?V2VYNFhhWmN4ZVZCclMzUW5tdTlhUzF5R0lpd1BBcWZnRnc5ZVFabmdDaDJQ?=
 =?utf-8?B?Q3RlM3M1d1JCYklxUk1nT1l0ZE5ENkh3aEpjUjBCLzFLUkdwTjY5OS9BaTJL?=
 =?utf-8?B?T2NVRlhpaG9JNXBiZnIrb0UzeThMSzVNcVpvelpWaVduUS9pdVdCeUw2aGFD?=
 =?utf-8?B?bFhaNEVUSEhRbTNBMTkvbVhZbCthTFZ0aGM1am54UGdTY0tFajM4L0ljekZr?=
 =?utf-8?B?ZE5IYVVKOWlmNFMwR3NqSndSbFVQeXVvS2NCeFFnRU4yTWxvRExRbVVxQm52?=
 =?utf-8?B?QmVEVVJMUVZFd2NDZ3dnZ3hQMDRNK2dva2FJTC93S3c1NVllU0FZSERZSHV6?=
 =?utf-8?B?dlB5UGRpRUhCUHFpZ05xd2JFZVE4OFA0elNYaVlhbkRFUmkxUjhYdUt0YS80?=
 =?utf-8?B?dXZ6OE5QNWZpWlFPYTJaV2RlVjVoNzlIb0w5RDNGenFVc1FhZUJOdDBTVmpj?=
 =?utf-8?B?blFhQ0RrMzUvWkFCTEtKenhqd1JmbXBKSDVKRGt2aWVpcTFScWx4UjUyK3B3?=
 =?utf-8?B?aTZ6V0p4WVMxQlNFUUI5VzhLZUV0eWxIYXFYSWdLbmZOTVpjTnBrc05hanZh?=
 =?utf-8?B?b0M0MEF1U1YwRmdyYnM2K2FRcVpLNUpjak9CQkM2MEdXOHZiY29hYjhVS2JT?=
 =?utf-8?B?UlB5clhhS0QwR29qUHQxb2lOTkdPRUg0K0dyck9HU0tYbHJYaGZMaWRLVVAx?=
 =?utf-8?B?RjRYZDVnZThrbnBwb1dSVmUySHVoOS8wQ0pEWFA5VXFEVlVlUTFxaFN0RVhu?=
 =?utf-8?B?RThERGVvaTFnd2Vra212WDFncjRxY1ppSEJtUEdweGdOckZpOHdWSEtpUHRq?=
 =?utf-8?B?N2NxSWdrNVBCcERmMTFheEZXNUhHWUVNWXZjMlluRlp5ZkFMaGFBd0RnSlRV?=
 =?utf-8?B?QnFsLzdZZjd6dFE1UkhnckJicXl3MjB6YmxCb3ZBak1ha3RUOVZ3REZ0VmU4?=
 =?utf-8?B?Qk5RTng1cHo2VnpvNVR4b0xNM0c2M0NHNk9NNVJ3SjJyT2xQVTZYUjB2ay9C?=
 =?utf-8?B?bmhWVHIzbzlFNlE2MEFoWG53MTVaaGVFZkJsUEE3MHNscmRNdkx1b2t4Uzh3?=
 =?utf-8?B?bzNvTTY1SThQRldFQmVDRk5HbmlSS0w2NzA5RG4vRWM5Z01nZmcvSWlvaUQ5?=
 =?utf-8?B?YTRDL0o4VU0yd3hnTFZ0VHFDWkF1Z2p6S2RxRzZPbnJIb1JEaWtNbHFZYmVM?=
 =?utf-8?B?ZDRpbktqdU9xZ0JQcS9PWUs4ZzRSYzZnSm5wcjczTldubFh6clA0WE8zTTEr?=
 =?utf-8?B?eUlic0xrTS9ENUgrT0VUTVMrTS8xL1J5ejRCTDlWOUxMR0VZNW1YUGo3UHVE?=
 =?utf-8?B?WVljYlQ4RXJiQjNNbUNENmxPRW9nTElzQmgxMzczVlE2R3pBNVl5MWl2bnZH?=
 =?utf-8?B?blhENVVpOS9QWVNRMHN4elNnaVYyWDhiVFJtS0dHU05FVG9yT0ZZNStRYjdE?=
 =?utf-8?B?NXB2ZE54VnorTmRJMFdUTEJOUWVrN0lDWTJ5S0g5MzR5VGJTSDh1R3JRY1g1?=
 =?utf-8?B?L3ZaZ1MzeCtKb2s4NDZ5TTR4a1BCaURTTWlFZUZpVG52N1dUaENvMUFTbmsx?=
 =?utf-8?B?NHF2NmVJcDl3UTlWVVlSN2R0NHVlT2UyTERJdlJCTENSU29ZdmpKMzF1NGJB?=
 =?utf-8?B?U2poa2laNTJCclBkVkJ4bWlqNzRuZU5CbU9pVWwvWFdnZWxhamlzSnp5cFVy?=
 =?utf-8?Q?vjBFGLYMGBq2dHLOrb/cuhQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d5dc4b-272b-42b8-b344-08db05e68032
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 12:59:35.8386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgpzn2vs8vz81po8DIxFukgAJBI11HHBV5njE7U+4rSDnoW5hjc7MT3asHUwlPsZrcb4SOejR9cAVbyYpXIKsef7r5DoMpIrU5bSSQgrYho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03-02-2023 17:42, Matthew Auld wrote:
> On 03/02/2023 11:57, Aravind Iddamsetty wrote:
>> Obj flags for shmem objects is not being set correctly.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Subject should have "drm/i915:" prefix.
My bad missed that.
> 
> This is also a bug fix due to not setting BO_ALLOC_USER (the other flags
> don't seem to matter for shmem), which is quite important, so we need to
> figure out the "Fixes" tag. Maybe mention in the commit message that
> this fixes setting ALLOC_USER which is needed even for shmem.
> 
> Looking at the git history, ALLOC_USER looks to be first introduced in
> 213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend"),
> but the users of ALLOC_USER at this stage are only interesting for the
> ttm backend, and that already passes the flags due to using its own
> object_init() vfunc for all normal object types.
> 
> So the first real user impacted by this bug appears to be in:
> 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on acquire").
> 
> So I think needs:
> 
> Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on
> acquire")
> Cc: <stable@vger.kernel.org> # v5.15+
> 
> With that,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Thank you will resend the patch.

Regards,
Aravind.
> 
> 
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 114443096841..37d1efcd3ca6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -596,7 +596,7 @@ static int shmem_object_init(struct
>> intel_memory_region *mem,
>>       mapping_set_gfp_mask(mapping, mask);
>>       GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>>   -    i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
>> +    i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
>>       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>       obj->write_domain = I915_GEM_DOMAIN_CPU;
>>       obj->read_domains = I915_GEM_DOMAIN_CPU;
