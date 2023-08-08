Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B1774DED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1E310E113;
	Tue,  8 Aug 2023 22:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C258110E104;
 Tue,  8 Aug 2023 22:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691532370; x=1723068370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mzpgTZ1utfN6tZLi6alGCw71jny43wPQKIGvuX7bi4Q=;
 b=oB7fLvy34IE4SAzoQ3lxnlVZcnaoG7II+nLcgth68Hpyd/5hys4fXCka
 2ovyllXLwQxMcVWZ489dCUkw1JfYed2re+YfjQRGp6dp8ZX+t4LJI9p4n
 GQT4jmNeAXif0ypUNS/jRahJsnq4n78ETr/6ghFhd5JChLtr4W3Q/V3e5
 RM1trLWuA7kQd3tV7hgsEQ2vLW9mZS9NNpEp141/A/0OPr5KINPb61+tT
 29PSHjon3WqppzWdz1vNeLAAxgPI8mjGjZuBt6HHVJnJksL6XywGR0c6n
 hTl/f+SYk3meEziqQoBj1ELaER80xGCpEVPByR4mU/FpY8smhsYRxwy3k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373745606"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="373745606"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 15:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062195036"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="1062195036"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2023 15:05:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 15:05:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 15:05:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 15:05:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 15:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0ozZpXma1cwAAAjnTMil8VDsQr7pndjMDSmRUUkNmlluHjZz+3/RKu9/AfjSirdNRKN49zT0MAxdA7hbXxq5y5WTi7gdakhxGNVLpd68I70kkCUc1MEnwgYSH3cP+X/oGu5iZxMYF37FtJBdyXWLQRox95VC1WPYplnFl+uXFD8IRQLoBh98DqijBWGpyCLPUSYiRsijYvq/SA5odRjfF8SRZtuUDmGG84xi9379IM1BWSo6Qgrmz0gUtpVEEye/ZQc8RdHsbEqiYW588s1NsoREHVa+ec8U+rh/UM1wCefGqap2zVGlx+No7A41UVlwuq6bwNDKNnMg2+yo48rtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mla+PoTb/puh1PuJEJqC1D22Oh1hwnjAHKmV5erDxM=;
 b=cstSWrcpTq814JEFecRaVQW798hDT2NdriwKO7GOoY2QfmrDqV8K/oheH95WlCtkW0weVZFGtA/UoY859irDXaVFW2nEVd3yMJzhGd2AsRmH6SnTZMkOQsZNjhEcQA+zK7pZstamQM9fjkVJ+zgnSIBBXd6lQBNHKFcUGWZEjAvSq88qR6BJ+xAZS0a4eohmgwvDkgd/VUI4u5nSUDL0Zsm796OAV8gzo1H9VehDr5KjAXMaoscYT2X+14VV/qmomSKO72JMaXiq6ejFNht0imQbZ3LrMPamRskXv8ApM647/MEwZsGkOBvfo6amZftrj47fqIZQX+DRjX/NqSUGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 22:05:11 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 22:05:11 +0000
Message-ID: <91c676fc-8bb3-1be6-91b4-e00b57f17df0@intel.com>
Date: Tue, 8 Aug 2023 18:05:07 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH v4] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230727201323.62637-1-zhanjun.dong@intel.com>
 <CAKMK7uH+NjZYRrkT-E-m2DiRvGagugC6F8XjizS_9=6mL4=5mA@mail.gmail.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CAKMK7uH+NjZYRrkT-E-m2DiRvGagugC6F8XjizS_9=6mL4=5mA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To SN6PR11MB2622.namprd11.prod.outlook.com
 (2603:10b6:805:57::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2622:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: b7fca1c9-c2c6-43bb-9a64-08db985b8901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqnskGq0+4iAg4ZSTdJmC9HuL5/FPJxER5DvpZZH05q72KK5tggASOq5r8smDw9Hm5zM5G4QfNzDY70qj8rp62T+yNUxtfzd7+ZIeDiVpIanl0pKCtVADZ2hBx7fjYIlVcL3dfm+glKveS9lHbj4hiuu1jXB0nMrDFPGEzlcsbnTczgk4/qMk6Gy1hvKrRZkpdAA3CEMoKiVnet/tq3qh6vVkA/H1HitBRCVCLtsgUOlrPPVC58oLwnX0+vChTPYGHwlofrmIr0NSp0VNifCaZgxuyZzcnu6cHS3Ob1wwTzQ1tOd4r6UomPOucB4z54IjZIrQE8DWREdexhSKlZuqW70a2h4lc6LTnQtrL8VHO0j6DQ4meO4INCXUEFGhVEqlNAIuS0y7yvuCxsSJ0P5KAKXwZx6fvWPCf886vZX6cE1khpHrNhSWfcFJYIUUPc4/+sibZs4WZ7lB+lWdRvg1IurkxWZNEKc5dFq6jQOL+9rCDpnZ1tIcIiEpb3htiCzfyPrB2dg6u+1dQYeNewa/ubd3hM4NBy9/Elu+pgFAogNYJZlw6kiaX0/VvKkmyR9eF/0eMIduR9eb15uC9fCn33ompI0eLe6j7L4YCiR66aVhjMMyvjt49daoWhGhpvPg8JMeJlOxXZVmY670xci3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(376002)(396003)(346002)(186006)(1800799003)(451199021)(83380400001)(31686004)(2616005)(54906003)(6916009)(4326008)(8676002)(316002)(5660300002)(8936002)(66946007)(66556008)(66476007)(38100700002)(6512007)(31696002)(82960400001)(6666004)(478600001)(86362001)(6486002)(2906002)(41300700001)(36756003)(53546011)(26005)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SENDcEFFQkZyYkRVc2YvbXF3SGVlVm8wckMwVnFtb3lBMlhKQ0huVEZ5T0Vk?=
 =?utf-8?B?OXp5QUxGL3hOY3c4YnpNS0pyY3lqZDdnQytIU2R3RnVsZC95dmZFdDAydnB0?=
 =?utf-8?B?dDVuRTdpR3JoNHhVOUt1L2NqWlM4RmRMRzdPRXd0ZE9zL09XS1k1NlB3dFBE?=
 =?utf-8?B?amZwUWc4R3JNMnc3TXZ4d2F5REFmSDFteVJQcFpQYWt6YmJualpsYmc0VktE?=
 =?utf-8?B?T0dOWEptNklqY1hhZzBKZjZEOEJleTB6blc0R0t3ZzUyMHp0QWpiRG55ZWlX?=
 =?utf-8?B?OUxlcHJsbEVOdlV2NU1VcjhuOEt1WUdjaXpxZHM2azdteDh0alVUZ3pWR0o1?=
 =?utf-8?B?WFRLR050cG9KYVpraml4SFR2UlowTkg0QXJFMjgwd1cwV2hkTWpUMCtIVDk2?=
 =?utf-8?B?dU81TFlxdlYyRGVzOEFjbVZocDhZQ09PRC8vRHVKc0lUUjNjeFExVmFmaDcr?=
 =?utf-8?B?eGFDYXZ5Ymg3eVMwZWNxRlRQckh3ckp1T2JMUTJ0Z3BzNVNwcWx1djczblFW?=
 =?utf-8?B?YXZsR3pnR3Bmam15aUhOZWdGeDFla1FhdjRXaUd5RTBKQXQ3SXM1ME9ING9F?=
 =?utf-8?B?YzRVNWNBblEzNXcwTmxwb1dJeFFBTjY4Myt6S1MzRFcwbktML3ZPNEhORVlH?=
 =?utf-8?B?L0RvWG5NNUswT0dDeThUM2dTaDRyUE9HUU04RmtaanE0T25mVFNLaUN5bVRO?=
 =?utf-8?B?eUNZbXFUT1paRHBXSndZUEcrTGhjZjM3cHp1bkt3VHRDTXBGQktCR3hDSTMr?=
 =?utf-8?B?eWtNUlFGbzVNNFlWSXFsaEJxUFAra3Nxb0h0bEMvOXlyYlV4ZUZjVHNLb3pp?=
 =?utf-8?B?Uy9Yc3JXUXdKZDdyZklPUk9iTXVzZm9yN1BmSEpTQWE2dzJFZ1ZMbGc2MUEr?=
 =?utf-8?B?UVR4WFoxS0JDdlJzOHdxYXBaZC9BN3J3R3dYVFlySVVxcHpWNHBZam1ML0Jq?=
 =?utf-8?B?OUVucHJyVHZPcktNcnJZT3FhbStzbnRUd3puc3NwZDF1SFNVTDB2TzJIZkRh?=
 =?utf-8?B?WWpLSDQwa1NlQU9wc3FXTjlJQmZ3ZjQvVFBuQ1BrTzJlNW1XYU1MRVRqOXNI?=
 =?utf-8?B?eEgrYzVBNC8zWFg4QWV1MXVGVFJrY3ZNWkNWd3VNZTBpdjNiSGdIdFNnMm15?=
 =?utf-8?B?cklKUnpEYWYxdUUrZ2k0QXdxTzJiYk96Z3RyMHJ0K3VVQmlXVFNaM0VxTStw?=
 =?utf-8?B?OE85T0xJa2h3QlNXV3RySzlFaGJheDF1WG92RDU3NHBwU2toNFoycGF5RDN5?=
 =?utf-8?B?TkFGL2JsSEpLRWlRTk5kazQ3Vmk1UllVQWg1VndYZ1NMRVpSQWRIbVlORjJ4?=
 =?utf-8?B?K1dwYnJRTFBBdlRwQmxOeDQwZXBNekpjdFA4am92L1dZUUxuS3VQeXdhdlpr?=
 =?utf-8?B?MnVBOVVjMCtBaVhzcDI2Rm1IN0U2dkdsRzZlSmkrN2tXSWxSeFBDNUhaWVJm?=
 =?utf-8?B?MS83dkw4YVVIc0lmV2ZWaDJkSndqTE1GNklrUkV5ZlplMWJkeDBHMmJLL01K?=
 =?utf-8?B?VE5FUVFlL0Q5MmkzdFMwa0hmemlBU3BiNEI1eWg0SWlOMUxXZExDK29DY3V0?=
 =?utf-8?B?RHI2Mzc4WVpKc09HZkZIcUpHS3VqS3RHZHQxSXFPeXNFWStmek13S1YwdFUz?=
 =?utf-8?B?OUpCNWQ5ODdCTGd0M2o4S0NDQzdTMkZOdk05Qk12dVJuUW56Vy8zUlk1ZDBn?=
 =?utf-8?B?ME90TGp6SjhnSXdUdjMrUE9tU3FndXE3cFM4NWowZTBuYytvUzB3YlNROU4w?=
 =?utf-8?B?cmNma0dBa2tPbXYwa1VGVU9uM01icFVha3lLN2cxZHpkeEZleEtmL28xb1Mw?=
 =?utf-8?B?c0NqQStjempTK0V2ZDZ2RjJkekxSOUN1aGp2UVc3SXcxNXJXNHNSQmpLT3Fz?=
 =?utf-8?B?NzhmbGwrTWQ4aTVlcnNTMGsyMjJnUWl1eDRPaFhySEdFVklVdk8rc1NkTDNZ?=
 =?utf-8?B?Y0UwZU9LOFc3WnlZamJ1WEZEWi80Z21mdU9Yd3lCd0hoUEsydW1QS0UwTzhh?=
 =?utf-8?B?aWFaZGlaa3MyTE1iTTl2RUlVelNRQWtNRHM3dkw5UW8zZ05pbzY5Zi9zSWs3?=
 =?utf-8?B?Zi9mdFg2aDdhVWtHellyZHJ1WTNxZi80cTVkdFB1SWhKRm5mOE0wRXA1bmtu?=
 =?utf-8?Q?aSnD7DwOWTzw6NGgMrpLLmp01?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fca1c9-c2c6-43bb-9a64-08db985b8901
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:05:11.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umcYkjypNcRBhx06gLRydvFHC7tV02LEk1NFeD201J9cLa39DoFzI7A45w5yfd0CR26OusYONk16ZHx2UTWfqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,


On 2023-08-03 9:03 a.m., Daniel Vetter wrote:
> On Thu, 27 Jul 2023 at 22:13, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
>>
>> This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
>> Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.
>>
>> WARNING: possible circular locking dependency detected
>> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
>> ------------------------------------------------------
>> kms_pipe_crc_ba/6415 is trying to acquire lock:
>> ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530
>>
>> but task is already holding lock:
>> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>>
>> which lock already depends on the new lock.
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>>          lock_acquire+0xd8/0x2d0
>>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>>          intel_gt_init_reset+0x65/0x80 [i915]
>>          intel_gt_common_init_early+0xe1/0x170 [i915]
>>          intel_root_gt_init_early+0x48/0x60 [i915]
>>          i915_driver_probe+0x671/0xcb0 [i915]
>>          i915_pci_probe+0xdc/0x210 [i915]
>>          pci_device_probe+0x95/0x120
>>          really_probe+0x164/0x3c0
>>          __driver_probe_device+0x73/0x160
>>          driver_probe_device+0x19/0xa0
>>          __driver_attach+0xb6/0x180
>>          bus_for_each_dev+0x77/0xd0
>>          bus_add_driver+0x114/0x210
>>          driver_register+0x5b/0x110
>>          __pfx_vgem_open+0x3/0x10 [vgem]
>>          do_one_initcall+0x57/0x270
>>          do_init_module+0x5f/0x220
>>          load_module+0x1ca4/0x1f00
>>          __do_sys_finit_module+0xb4/0x130
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> -> #2 (fs_reclaim){+.+.}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          fs_reclaim_acquire+0xac/0xe0
>>          kmem_cache_alloc+0x32/0x260
>>          i915_vma_instance+0xb2/0xc60 [i915]
>>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>>          vm_fault_gtt+0x22d/0xf60 [i915]
>>          __do_fault+0x2f/0x1d0
>>          do_pte_missing+0x4a/0xd20
>>          __handle_mm_fault+0x5b0/0x790
>>          handle_mm_fault+0xa2/0x230
>>          do_user_addr_fault+0x3ea/0xa10
>>          exc_page_fault+0x68/0x1a0
>>          asm_exc_page_fault+0x26/0x30
>>
>> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          _intel_gt_reset_lock+0x57/0x330 [i915]
>>          guc_timestamp_ping+0x35/0x130 [i915]
>>          process_one_work+0x250/0x510
>>          worker_thread+0x4f/0x3a0
>>          kthread+0xff/0x130
>>          ret_from_fork+0x29/0x50
>>
>> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>>          check_prev_add+0x90/0xc60
>>          __lock_acquire+0x1998/0x2590
>>          lock_acquire+0xd8/0x2d0
>>          __flush_work+0x74/0x530
>>          __cancel_work_timer+0x14f/0x1f0
>>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>>          reset_prepare+0x21/0x60 [i915]
>>          intel_gt_reset+0x1dd/0x470 [i915]
>>          intel_gt_reset_global+0xfb/0x170 [i915]
>>          intel_gt_handle_error+0x368/0x420 [i915]
>>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>>          i915_wedged_set+0x29/0x40 [i915]
>>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>>          full_proxy_write+0x52/0x80
>>          vfs_write+0xc5/0x4f0
>>          ksys_write+0x64/0xe0
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> other info that might help us debug this:
>>   Chain exists of:
>>    (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>>    Possible unsafe locking scenario:
>>          CPU0                    CPU1
>>          ----                    ----
>>     lock(&gt->reset.mutex);
>>                                  lock(fs_reclaim);
>>                                  lock(&gt->reset.mutex);
>>     lock((work_completion)(&(&guc->timestamp.work)->work));
>>
>>   *** DEADLOCK ***
>>   3 locks held by kms_pipe_crc_ba/6415:
>>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>>
>> v2: Add sync flag to guc_cancel_busyness_worker to ensure reset path calls asynchronous cancel.
>> v3: Add sync flag to intel_guc_submission_disable to ensure reset path calls asynchronous cancel.
>> v4: Set to always sync from __uc_fini_hw path.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++-------
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h   |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c           |  4 ++--
>>   3 files changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index a0e3ef1c65d2..ef4300246ce1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1357,9 +1357,12 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>>          mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
>>   }
>>
>> -static void guc_cancel_busyness_worker(struct intel_guc *guc)
>> +static void guc_cancel_busyness_worker(struct intel_guc *guc, bool sync)
>>   {
>> -       cancel_delayed_work_sync(&guc->timestamp.work);
>> +       if (sync)
>> +               cancel_delayed_work_sync(&guc->timestamp.work);
>> +       else
>> +               cancel_delayed_work(&guc->timestamp.work);
>>   }
>>
>>   static void __reset_guc_busyness_stats(struct intel_guc *guc)
>> @@ -1370,7 +1373,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
>>          unsigned long flags;
>>          ktime_t unused;
>>
>> -       guc_cancel_busyness_worker(guc);
>> +       guc_cancel_busyness_worker(guc, false);
> 
> This needs an absolutely giantic explainer of why this is correct, and
> why it's needed. I suspect this one of these "shut up lockdep, break
> the code" kind of patches.
> -Daniel

Thanks for comments. Will add more code comments in next revision.

Regards,
Zhanjun
> 
>>
>>          spin_lock_irqsave(&guc->timestamp.lock, flags);
>>
>> @@ -1485,7 +1488,7 @@ static int guc_init_engine_stats(struct intel_guc *guc)
>>
>>   static void guc_fini_engine_stats(struct intel_guc *guc)
>>   {
>> -       guc_cancel_busyness_worker(guc);
>> +       guc_cancel_busyness_worker(guc, true);
>>   }
>>
>>   void intel_guc_busyness_park(struct intel_gt *gt)
>> @@ -1500,7 +1503,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>>           * and causes an unclaimed register access warning. Cancel the worker
>>           * synchronously here.
>>           */
>> -       guc_cancel_busyness_worker(guc);
>> +       guc_cancel_busyness_worker(guc, true);
>>
>>          /*
>>           * Before parking, we should sample engine busyness stats if we need to.
>> @@ -4501,9 +4504,9 @@ int intel_guc_submission_enable(struct intel_guc *guc)
>>   }
>>
>>   /* Note: By the time we're here, GuC may have already been reset */
>> -void intel_guc_submission_disable(struct intel_guc *guc)
>> +void intel_guc_submission_disable(struct intel_guc *guc, bool sync)
>>   {
>> -       guc_cancel_busyness_worker(guc);
>> +       guc_cancel_busyness_worker(guc, sync);
>>
>>          /* Semaphore interrupt disable and route to host */
>>          guc_route_semaphores(guc, false);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> index c57b29cdb1a6..a77de0d6ed58 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> @@ -16,7 +16,7 @@ struct intel_engine_cs;
>>   void intel_guc_submission_init_early(struct intel_guc *guc);
>>   int intel_guc_submission_init(struct intel_guc *guc);
>>   int intel_guc_submission_enable(struct intel_guc *guc);
>> -void intel_guc_submission_disable(struct intel_guc *guc);
>> +void intel_guc_submission_disable(struct intel_guc *guc, bool sync);
>>   void intel_guc_submission_fini(struct intel_guc *guc);
>>   int intel_guc_preempt_work_create(struct intel_guc *guc);
>>   void intel_guc_preempt_work_destroy(struct intel_guc *guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 18250fb64bd8..5b76f0d4d2a6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -566,7 +566,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>>           * We've failed to load the firmware :(
>>           */
>>   err_submission:
>> -       intel_guc_submission_disable(guc);
>> +       intel_guc_submission_disable(guc, true);
>>   err_log_capture:
>>          __uc_capture_load_err_log(uc);
>>   err_rps:
>> @@ -597,7 +597,7 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>                  return;
>>
>>          if (intel_uc_uses_guc_submission(uc))
>> -               intel_guc_submission_disable(guc);
>> +               intel_guc_submission_disable(guc, true);
>>
>>          __uc_sanitize(uc);
>>   }
>> --
>> 2.34.1
>>
> 
> 
