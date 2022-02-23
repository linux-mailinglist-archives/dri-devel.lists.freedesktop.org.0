Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E294C07BC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 03:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB1A10E51D;
	Wed, 23 Feb 2022 02:22:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13F710E4FE;
 Wed, 23 Feb 2022 02:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645582953; x=1677118953;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t/DRNNsdeAds9HknaxClX0pNLCuRFoszDToSESkRvpE=;
 b=PqjTv37mx2cR7qcChFCp02wY8+QFtMKTV647i3UivK/WLmgi8k7UMtPx
 2TzTrSea57LTU6HmHym/UUIaxQDBOKhvBCV3zabOeX2ocvcW+BcwbTN/x
 Q+Ds7uBZBC1QtPjvfZT5ghXf10uz8wJMFfBbLczRY73vjBS1Asskz1CZL
 PyVM9RuV5aFuhWDHerJXtpKusGT9MbPycZ9hbe0dkaJG5u0lcK4Eu0fIG
 TyiyDCg2OXFdVdLph4phNBRDTc+zXQnzYwAaM+ZbBsu87S6j048hqVQQj
 l40BNyS2yTLHwn4vu56WToDC7bq2f6cG8IeCr8nlLW2MtZ5pZpVpvTuou w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="250690824"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="250690824"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 18:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="776520701"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2022 18:22:33 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 18:22:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 18:22:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 18:22:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 18:22:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgcMIUse7lZSj8710irFjmusPX3JwZwnCPdM4ND67mSbOYvkNRC7BEB+y68l3IE0c8OIpoKPf4apBCIdBYQAM5PyL06l1EkTFVo1V6sm5HWIX4DTiChHJZgrfsMEb+ysgLFPUop01OT48Gzz8nPChj81tffu75Bkf1AXwNR9Ev8SCWbkRi33MBR+4b6WIAkECv38kMic5lhfN5kNjkjngrmFwqL/dN2npfCOG+UbjFqpDMYhrrhXUV1hI9HVofU4mwEQIU5bNjWO7j53ZRgdR7hKBuHTTh3BH4K6B5KgQ7P85JHtobshwZKNSFBgJmRNRa5xZku4uredXRAkybcGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NtsoxPLGVCnfb9onYiWhn51grV3XfNQhiOgn3oOaks=;
 b=F6uBq+W4HSsH1uuKk9ZPw2qfmWM1t5GWu10a9svJ9t7kPE3uU2ddsmdJCRSF7Tb+beK6rC4iesRLvusRViSjt6FxdEzU0WjWqGXqrOAk3prA0Yx4FIbiUuU5ZjkmcMnbR2dIDfPs3AKNft6dsrSAtB5FUgYuHiymkOABOl+Ym+xEnCmqROF4U5DtKOxyNV9GWf8iTNFplqk/jhZSwXxhsBzb3tbbu1COVuzIrUwbcpwQ38o4UId5NQgLzYnaUdClS5z6kr184qGD3BFRysZ62zzo65cKbtlWw0vu0Xg1lL7hI0n7jb782Sn7fBafTx6aGbJUeLd4EgJieQcwQW5wKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN6PR11MB4114.namprd11.prod.outlook.com (2603:10b6:405:84::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.19; Wed, 23 Feb
 2022 02:22:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 02:22:30 +0000
Message-ID: <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
Date: Tue, 22 Feb 2022 18:22:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR19CA0059.namprd19.prod.outlook.com
 (2603:10b6:300:94::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15db71e-06dc-4733-f3ce-08d9f67357f0
X-MS-TrafficTypeDiagnostic: BN6PR11MB4114:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB411487D4B578C41D10BB5323BD3C9@BN6PR11MB4114.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YDlZpn3MFGzhoYl1PuyX6jcrxVdCJjY425Tlog/nIsBLGl4n7u78jSeG2gUAdkp45Gr76fLFKCxJl9iO/AHLlriIBG+k3oGHlxqGOOIrdvpdQQv/nXTuyXiRi/TbkKnBEcg2ThN772WD6TA7qiCf3BKfRYxLNV+gm51eh4Uvn7qH7Xvdc93nTn86MlCJ71KNzZ7WHuCORmA5OKswjftm7GZZJWaUdYEqVQ1ZdEsEKP6mhGQpDXijlkkicgl0XdVEOnDimjTmr0TTxrqZ17WWr+4WIyYXN7zGxf2esmwRGIo2AB04bEBwczKnu3NpaK4VAApLNVfCmuzyC8Z24DvpTf1Kp/I2oBPImj79g1HbjLxPTNBq54EGxuotkBu2a1Zb4UkRO1IlmBP+TDxehbZY0tVw4A3naQ15NMbyY1LKNDASe0gnOuhcJ7VbHpqrAAqdIdqGnDoNsP0bKvk85Ot/1pt5gQXC/NcRH8JTgBsE4FIUhV1BzPJCbKbF7cTc0wDawqUiqMss6fjz7i8Y7fPI9p/RVLFHZ8p5MrMQcMfuKFFPc/e8rpVQXBsJqdoQCnVxb/zHDdv3STYVimubAFX44E6xDQ5SYeQxtSMhsHKXYnQcTQMc2dDQEFOjofb9sX8oP4iK1YF9BwIwfLK1sOAyB+1FDgWfv2KHmB3/QXvExNPcsRyQCKubofbcIhsW4vwop0mMcpbiQeFJtCpwBofWXbPUZqEXz8arFgq4FxzMXuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2906002)(5660300002)(53546011)(31686004)(8936002)(36756003)(6506007)(6486002)(2616005)(4326008)(8676002)(66476007)(66556008)(38100700002)(6512007)(31696002)(82960400001)(86362001)(186003)(26005)(508600001)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXE5ell3RytHTGFiOEhxelBrbXo3cmkwWWFMRmYzcDhFb3dRci9CMmlpc05h?=
 =?utf-8?B?eUhzSktKVWpYWTlSMytReW4vc013TGZ2Q05ZYmppYmNRTnhQTlJVMklHRlFU?=
 =?utf-8?B?MjJSanBZMlBOaThhVFdZV2pVQ2RqM21BRzNua29CZ3htM1kxeWhJdXlXdGJC?=
 =?utf-8?B?ZDY4OHdMYTREYlk2UDVOcHJEamZwcGNBSU15UTM3dk5EeUpaSHNhclo3UVhW?=
 =?utf-8?B?d2VSdFBlZWloS2I0RkNWNDRtb21OdGorSDFGdEI2TUNpQzZ4SWU4a3UwRk9k?=
 =?utf-8?B?dkZwaTVnRTIwNWtxeCtEejE0L3kzNDZzZTIxYlk1cythOHBmV2tLRHhLQ3BW?=
 =?utf-8?B?ZEtQTG45R0dtdTh0c2hCTTFCOG5GNkpZbnR4UVVtUlN1TCtmdGQzNzVLNnQr?=
 =?utf-8?B?OWlXZEhjbHA0Z0Ftek96Ukk4NW1lM0JMLzVnTzc0bzBoL0o5Wm5xTzFMNVVm?=
 =?utf-8?B?N1JPYk1XNkxpTHAxOEp2YjRza0gzbjE5RVp5U1RPK3htTTVTSWJVWnVYcjNo?=
 =?utf-8?B?a2tKdXFwNVViK0FjZU5HUHZrOFRNUTRVeWlIekVjS3gxNW1FcXBZcWZYSFVU?=
 =?utf-8?B?RVl6bGZXZ3F4Z2g1TlAxd0NRZjhmTHlBRUdyWmNCNzhLTlAzRkY2UkFzVkhD?=
 =?utf-8?B?cEJnOFZwWnNWeVJDVVhTSlBRcTZnT3NqWlk0OGViV0NuRFoxQ2RJdEhMM0pV?=
 =?utf-8?B?Q21KK0tQd1hYVVd4eXNiSUtjd09OelJQbUgwbEpESElENjVyd3ZXTXZtU0Jz?=
 =?utf-8?B?NVZFd2RTblN0c1hIcmxoTFRyOXl2RkQ0eS9RTGZuZVpMNGZ1cDdvQWpQeFVG?=
 =?utf-8?B?azg5S2U0OVNub0VnekZ5VlJNN1lzSEFhMDA4Q0FCZVlzZmM3cVpLQm4rZThT?=
 =?utf-8?B?YXhlTHRnS3pPUjE0YmpwaVB0bDB1anpZRzNuVjc0THRpdkx2Q3AveU4rRjJt?=
 =?utf-8?B?aW16cGtkeWdXK2xKSHVIY0p6cjAzUGR1UFZORUltSDdwTHYvOFYwMHRzTS9i?=
 =?utf-8?B?RkNTWElMUVJCOEtrT3AyTFB2VWdGY1RKY2xCOVFUbmpHM3R4UWVERFFoOXNj?=
 =?utf-8?B?SlpHT1VtTHdIZnJ0WDBzbDJERmR6U0FzS2txallYb1A5TjV1R2htK1VsaE16?=
 =?utf-8?B?SFJ1Z1ZsNlRNTWZMd3BoZG1YeUlEVWthVlgzdExNbXBuUlYzTVpBUlNEUUZH?=
 =?utf-8?B?cVVoWkwyODF6V2h5NERrdE1JZXpKRkpRQjlxb1lOVG5FWUVFaE1VTzJ0aFhx?=
 =?utf-8?B?VUtqNGtEWWlseFliUTZIaE93Ty9YL0k0TmdQaDJ4WHN6NTRuMURvcFpVM0FY?=
 =?utf-8?B?RzJpcGIxdFpBOFR4dWl1MkxVMjMvaTJOdkd3STNpM2tmb21IczArbnRZa1Ar?=
 =?utf-8?B?Y0QrelFTdlcxNk1EbE1Sd2lRY01OcGh4YzNWeUFQOXR0NGIrWTZLVDJ0UEUx?=
 =?utf-8?B?d05Bc2huK0s1RmwvbTM3b2JIak4yaEtoZGZmLy9ORVdUdHpkcWxjSzBjcVkz?=
 =?utf-8?B?UjhQYkpteDBOelZQa3B3aXRQcS9EbmVja1ZERUk2T2g2a3lWa1dSOStNcUsx?=
 =?utf-8?B?YWNkd3FiRWJhdXFXZWVtRVNCSmh5Rjk5MGYxRTRLSXJReXFyWGlLZURreXVX?=
 =?utf-8?B?bXZpQ25qYmdmZDVlcTIvak52cE1tQnBwS3VMazlwanBxTTFpbmZ4ZmZMVk9h?=
 =?utf-8?B?NDNtQ3BaV3diSWVpVjdFcmZkbldYQkk2amloOW1uZ2ZuRGF1SVdlL1hTc1pD?=
 =?utf-8?B?NmxuYllrTTlKM0pPaDlleXR1SW82Qi9wbzB0dnlQUGpLTS9ZQWpSUm5KYWdR?=
 =?utf-8?B?bU5sOFliWld6T1FuczV0cDdpMEk5YUtrSjVianFYWjl0eXNGMjRxTy9SS2k4?=
 =?utf-8?B?YTlpOWxZZHdYbG1SV3FJazUwYUJYTExQbWhyek52ZFZIa0gxREViNTRkYTNY?=
 =?utf-8?B?QUZiLzJYN3pjV0hSaTdRT3kxdHRjY3MzUzFnT0V4THBzWnNSYzFtVnpqM0NU?=
 =?utf-8?B?aEZleGEzT3ZBT0t0TzRJKys1bENRN3lqZlRMTkQxTGFRZlFqM3NROWUwaUgx?=
 =?utf-8?B?cVZZUzRjZzNQSUJnVGRCSUZBVmJZZ0d5VktydHlFNE4xVFFydlpKYlZZYStr?=
 =?utf-8?B?UnNSWnp2cDY4K01Mc0k1Q2JhUGFEMUFKV0M1ZHhyajFTQmJvSW5icTR5M1hN?=
 =?utf-8?B?TzdoRXEvSlRIMFU0RWdXS2VEVmNtU2YxSElYeHBXU1VHNEJqV1ZJK0NyVFVw?=
 =?utf-8?Q?+1uMODSM5ON7/GOBJzj3+aDvsAvsLqS0uM6boIHWsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b15db71e-06dc-4733-f3ce-08d9f67357f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 02:22:30.7810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5kCLxjVKF2AaJc4cG+H35pM0lmTvD89sYUwyFTeQ1+VWYJH7xXnxY+u5iqzZ6dI4mfi7lOe0P//GzKxpT3AsSY00TuLqfiFfqPDX63A88w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4114
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

On 2/22/2022 01:53, Tvrtko Ursulin wrote:
> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Compute workloads are inherently not pre-emptible on current hardware.
>> Thus the pre-emption timeout was disabled as a workaround to prevent
>> unwanted resets. Instead, the hang detection was left to the heartbeat
>> and its (longer) timeout. This is undesirable with GuC submission as
>> the heartbeat is a full GT reset rather than a per engine reset and so
>> is much more destructive. Instead, just bump the pre-emption timeout
>
> Can we have a feature request to allow asking GuC for an engine reset?
For what purpose?

GuC manages the scheduling of contexts across engines. With virtual 
engines, the KMD has no knowledge of which engine a context might be 
executing on. Even without virtual engines, the KMD still has no 
knowledge of which context is currently executing on any given engine at 
any given time.

There is a reason why hang detection should be left to the entity that 
is doing the scheduling. Any other entity is second guessing at best.

The reason for keeping the heartbeat around even when GuC submission is 
enabled is for the case where the KMD/GuC have got out of sync with 
either other somehow or GuC itself has just crashed. I.e. when no 
submission at all is working and we need to reset the GuC itself and 
start over.

John.


>
> Regards,
>
> Tvrtko
>
>> to a big value. Also, update the heartbeat to allow such a long
>> pre-emption delay in the final heartbeat period.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>> John Harrison (3):
>>    drm/i915/guc: Limit scheduling properties to avoid overflow
>>    drm/i915/gt: Make the heartbeat play nice with long pre-emption
>>      timeouts
>>    drm/i915: Improve long running OCL w/a for GuC submission
>>
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 37 +++++++++++++++++--
>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 16 ++++++++
>>   drivers/gpu/drm/i915/gt/sysfs_engines.c       | 14 +++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  9 +++++
>>   4 files changed, 73 insertions(+), 3 deletions(-)
>>

