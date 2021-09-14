Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571640A4E5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 05:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77EC6E3AA;
	Tue, 14 Sep 2021 03:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6E76E3AA;
 Tue, 14 Sep 2021 03:50:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="282869199"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; 
 d="gz'50?scan'50,208,50";a="282869199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 20:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; 
 d="gz'50?scan'50,208,50";a="469901301"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 13 Sep 2021 20:49:59 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 20:49:59 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 20:49:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 20:49:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 20:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeghxEFCCebFlZ5OReM1PM3Xxrog67NOpmFGVQBJLK0sttGTKLKCpU2ZDK7C0BNuf7yW/zpW6Lwf3aCVIi7UBy7r5JoRmFY6oCbADnVfSqgoNiTmMfC1XsDmY0H+S7Byfnp+5W/Rec8L3BZ9YeRkdIiBSfe4ieZSlgsfJeRysQvtHCQLpm71NcAxqyYB4v3puv1bnxeMGn79hvxBqgZ64NBnoEtAmFFttvcAJFfIGcwTRWMcPADRSYzJTmdsUqP83rtPSzFgddY+8CoBLxQs166DQPWyM3V3z3/nw/uJtm0J2OF9kOJR1kF63Sryx1uPdLH8ru9KQxiA0P6nM65iVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G790mK/IwsEcfBwoBuCd3UBi7giS5rfjaR1itJZ+wdc=;
 b=eLSkJyg8pStERwK0C5Yf/EUqQzgCrnBI7X5B6Tx6TvxaC5Z2//2WtkyMOfUGZh0rzLrZXN2ZQfy8L/s+7YvCCSzXlYWgXz/noYvuy90w3Mz8IVkcjYEoFv9z8nUf04edT2DaN+P6i6dKNDJN2/rroMPQ1cpdnmwW5jQc0HMhDBSA4e+QFi3VQk50oWW5oFRvCurC/C2+qC7RmWSP30T+V0NEvPXLZ3qOFCV5YIkB3bUwbtJrTtcoWP1WbxPrp6oTZobkDYQxukgKhk7jRMBJ5kfGxbUtIhDGaKw27ipw1fvl+g4rpw6Pwv9ZGWaCkAxh5zP5c5Or5AzIHP312ZCu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G790mK/IwsEcfBwoBuCd3UBi7giS5rfjaR1itJZ+wdc=;
 b=roRcuqUx5P/eQdrc9dF9VPO/gHyo+zYZwsPVe8nX9ECFaALtSfnk8Z6l2F3kco3zgAFQAQJKBDDps2J4af4N7Cq70aYDcFk0HB8gpla8h8HmTtUnZsYL5bExlpV2lPP4dJG0iIfphjrccR1Vhwt5QYGtLRcgB+L1bUvZDNbsL5c=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5647.namprd11.prod.outlook.com (2603:10b6:a03:3af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 03:49:56 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f%8]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 03:49:56 +0000
Content-Type: multipart/mixed; boundary="------------yLFEH1rvnqfmkoTsJYIImcMx"
Message-ID: <3735338d-c992-59eb-df2a-e5ab56b257f7@intel.com>
Date: Tue, 14 Sep 2021 11:49:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.1.0
Subject: Re: [PATCH] kernel/locking: Add context to ww_mutex_trylock.
References: <202109091811.OVelmBhx-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202109091811.OVelmBhx-lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202109091811.OVelmBhx-lkp@intel.com>
X-ClientProxiedBy: HK0PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::28) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
Received: from [10.249.174.70] (192.198.143.8) by
 HK0PR01CA0064.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 14 Sep 2021 03:49:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 924f39c6-f719-439d-a66c-08d97732b72d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5647:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5647DB624630A39CF8F1A75CFBDA9@SJ0PR11MB5647.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSmc5yagM4w/sw6VRGj7HWo3y41uDeA9N/ZYwfAPm6QF2JGnno826l1VXa6LKkYvW4YYCoTvE6wQvmfw3rGRKcjfM5YW9NLFwinRafyMLtq4bQ75FZ6LoI6u1zHFER3iYJmp6HDNPSRzydfkJYyh1mQrzVFy+oxQtsFj/UV2HQ+OD5+HpBf3IJEABHikLlV98JdXKoRgtqwF6gUSLJa27hDh6n/v6I5E2OxEuYeJM3OI0cE22EPCpmHIYucJ4tpVXn4yGbXA924RJlPkiXT+igYQFe9rEkHdOAHFjIBcQry3IAk18W3I+17ZfX2fll+AMDqAtPgmgEv0frxJQg7KaUW5PTImONVHvosWZ3Qgr3vAhANGCST9bY5v766nhhmLDklNdXPyrmB14avUvrSWP7uVhnVkw09tBOg+/RKADDBAQU7Kv6DgUvR7PpxmpJtREck55DggQbbjm0eNsXi2rXMfLQx98YGEERj3t9dUKIwYdxKo9wPNdVM8uFPsQAaObfukwEEmQKnXd62jbngHgPnkmdUsZvON9wdsMH5UrSQZ7ivMaJKRRl8WWxIZjPNaaBSQf5RCh4sG9i7JG+XMaF34Y08Vk8unkKHzNeTBsqGz+YD+QMafni7ziJ9w75GM2L7kefCcnGriwVLg1i4wUCiPg7seGHM8ttyWzCBa33q4OwEP6mTxS1b6JZARWAFtnjhgfrf3LvEgvRNOarLBaV+J0WIt1vz/Ifo0Vb74Q7r+oCBQMjCndrAN8411s10o7Df30kbkcOu6WkA8pmbSiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5598.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(5660300002)(66576008)(7416002)(31696002)(966005)(8936002)(66476007)(66946007)(66556008)(6666004)(235185007)(86362001)(8676002)(38100700002)(36756003)(2616005)(33964004)(6486002)(186003)(478600001)(26005)(4326008)(16576012)(316002)(956004)(83380400001)(54906003)(31686004)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emw4WkcvcStBN3RweldrZmdwanVYUXdWZ0J0SnFLazhQeUNNZ2xHRWR6RUNS?=
 =?utf-8?B?UWRTaWV3NG40T3c2eC9BU3lXa0ViZ0h0SE9JcldyeEh6am9ab21Rc0Y3cndk?=
 =?utf-8?B?dkdZaEVyaytEMjlsY3RNVzcxMUFtNVdTQ0Zab3kwbWxUbFBRSDBJbVI3Z0xz?=
 =?utf-8?B?M04xaGVBTG1UcFFHRk1CUDRNWUwzeUFWVndiZVFjZnp4Y0QxUTV2K01OelFJ?=
 =?utf-8?B?S2Z1UlRnZG51TnBKR2tTcnpPT3ZOcnpNZDFBNG9ZVEdlWGFCVDJjN0dVWEJ0?=
 =?utf-8?B?V1F1YVRqQldsUVQ3L1I4YmlxK0dJdmJ4QUZOMHJ4WERZcnFtWGxndFdaWjRk?=
 =?utf-8?B?bnJLQmovVW00NjBSQ1ZHNmFBeXJkM2N6VWtURFAyZFpUMy9tVFE2cmpRUjZy?=
 =?utf-8?B?SDNpRWJFZ3JIVVRvMDl0OHVMVENmMWhxdXVVaG0rb1gwaDVNNWRMZjZkR1dz?=
 =?utf-8?B?b1FsZHRDWVVZY0FlR1I5OG9FRGxSTXoxM2ZXL1BlRlpDcDZaajVsRHZzZTZp?=
 =?utf-8?B?aDdYTHBiZlpsTE1tbGpvaTZyT1dZcUE4YWRYeUcxOVBqSkJFWDVzU2tlNWdN?=
 =?utf-8?B?WXM1VkZnMjFId0FVcUprUXlWd2hocnFlL2dlYWZYcVkxQTVnS1dlcDN2Uk1R?=
 =?utf-8?B?WXBTcXdlbWlSc3NsL3RzR2NHMWJWM2VoVTExU1RmdWpuNEkwdjFOUGtXV1Y4?=
 =?utf-8?B?cWttUnFYSGNPNnF6M0FNTXNmMHdpVzUrK1YweFdaREJiRWppRS9QTTFtUHVR?=
 =?utf-8?B?SGhJSVdIWWpGNDhweDZzcGRVQjdrSW1rWG9ZVksxcUZuWmdPZktzV3F5RlhF?=
 =?utf-8?B?bVFRQUNKSmdOcVVzWGE0QUFQM280OG15N3VXRjU1Qzh4SlFPWEg4QldCeUor?=
 =?utf-8?B?b1c0Z1o3bFR6Tkpld01TMmIxZzNsRDluQ3Bmeno4aE00Sld4SURZNk9wMlBs?=
 =?utf-8?B?N0NGWkJadDVmZDEzSm5sTWFyY1htN3lURmZJbm9EcTZBTWhkK3VmSllQVFdi?=
 =?utf-8?B?QWQ3SEF2M1MzdmxwVG9LYVpYMThCeW11TGN6dGp5dkdnUEJ3VnprSVVjbmxN?=
 =?utf-8?B?QnVqMGJOT0hFQXBiblFpdjd6L2RBd2ZpU2VsR1NnY3dZait1SFJMeDhrdEV1?=
 =?utf-8?B?RlhLQ2U2UXlMbjMveEdTNFFaeGFEbVdZQkZVSEY4a3ZUZWpBU0tmNnpjUkNh?=
 =?utf-8?B?QkV1OStIYitBcklab3NybXpJbi9ia0c3eXFRZEZOZmFGOWZFS2cvQWZYTGha?=
 =?utf-8?B?RUJEdTMyc3krWnJ3dEN2N1lSZXlPUkRPQ0hWTmZsN0VUS0RsTENkVWNEenBu?=
 =?utf-8?B?NFVlOHdQK1k5N1h3NGViM2J3R1pVRmdCMFNKUVY3VTl3SkZYVno4SC9qVmZV?=
 =?utf-8?B?N0tmbGVyNmNCWFNFMDIwaWRsMDRVU2RhTlZ0clJ5V2RNZmdYNXdTZHhqM1V1?=
 =?utf-8?B?KzhpeU5Rb0VzN0FITElEWXhEbHl1RlpaMy9WWmZJd1IxRmhudG5MY09STDB3?=
 =?utf-8?B?MHZ1QXBVWldIcm1TUVoxMUVsVTZjMVFwSE0zOS9WWHI2MHNaRldKRnIyOG8z?=
 =?utf-8?B?QUVGZXRiYzlkaW5vdTZ0dWNjaUQ1Z1VhdEdJT1Vpam5pV0ordjVIbFlFR09N?=
 =?utf-8?B?dm5SWTNZSUF3ak5rQjd6VDJ6ck9MTkd0L2djVXBSMnlzL1pKR3JuN2lGd2RW?=
 =?utf-8?B?SUloSTJmL011NExwOXpoRkhqNlRpZjlEbHlXWmdMVjloank3VndjcjBFUnVV?=
 =?utf-8?Q?fIA4tL9Ru60DN7iGvgjwU7reWEndF0yYS6oi1ej?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924f39c6-f719-439d-a66c-08d97732b72d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 03:49:55.8024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fP1a4eRFVQeV/pYsfyziRcfCVnp6aQj5+p6M/AJvxCqGNK7LyZDhipRhwpr2Rl77do9M/T805V+Juyjw4G85IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5647
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------yLFEH1rvnqfmkoTsJYIImcMx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maarten,

I love your patch! Perhaps something to improve:

[auto build test WARNING on regulator/for-next]
[also build test WARNING on tegra-drm/drm/tegra/for-next v5.14]
[cannot apply to tip/locking/core linus/master next-20210909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maarten-Lankhorst/kernel-locking-Add-context-to-ww_mutex_trylock/20210907-212220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20210908 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9c476172b93367d2cb88d7d3f4b1b5b456fa6020)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/1e66afa09b0aa7d6db3122f0312e10d36f6fa217
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Maarten-Lankhorst/kernel-locking-Add-context-to-ww_mutex_trylock/20210907-212220
         git checkout 1e66afa09b0aa7d6db3122f0312e10d36f6fa217
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> kernel/locking/test-ww_mutex.c:172:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
            return ret;
            ^
    kernel/locking/test-ww_mutex.c:639:8: note: Calling 'test_aa'
            ret = test_aa(true);
                  ^~~~~~~~~~~~~
    kernel/locking/test-ww_mutex.c:125:2: note: 'ret' declared without an initial value
            int ret;
            ^~~~~~~
    kernel/locking/test-ww_mutex.c:126:21: note: 'trylock' is true
            const char *from = trylock ? "trylock" : "lock";
                               ^~~~~~~
    kernel/locking/test-ww_mutex.c:126:21: note: '?' condition is true
    kernel/locking/test-ww_mutex.c:131:7: note: 'trylock' is true
            if (!trylock) {
                 ^~~~~~~
    kernel/locking/test-ww_mutex.c:131:2: note: Taking false branch
            if (!trylock) {
            ^
    kernel/locking/test-ww_mutex.c:138:7: note: Assuming the condition is true
                    if (!ww_mutex_trylock(&mutex, &ctx)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    kernel/locking/test-ww_mutex.c:138:3: note: Taking true branch
                    if (!ww_mutex_trylock(&mutex, &ctx)) {
                    ^
    kernel/locking/test-ww_mutex.c:140:4: note: Control jumps to line 171
                            goto out;
                            ^
    kernel/locking/test-ww_mutex.c:172:2: note: Undefined or garbage value returned to caller
            return ret;
            ^      ~~~

vim +172 kernel/locking/test-ww_mutex.c

f2a5fec17395f2 Chris Wilson      2016-12-01  120
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  121  static int test_aa(bool trylock)
c22fb3807fd0a3 Chris Wilson      2016-12-01  122  {
c22fb3807fd0a3 Chris Wilson      2016-12-01  123  	struct ww_mutex mutex;
c22fb3807fd0a3 Chris Wilson      2016-12-01  124  	struct ww_acquire_ctx ctx;
c22fb3807fd0a3 Chris Wilson      2016-12-01  125  	int ret;
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  126  	const char *from = trylock ? "trylock" : "lock";
c22fb3807fd0a3 Chris Wilson      2016-12-01  127
c22fb3807fd0a3 Chris Wilson      2016-12-01  128  	ww_mutex_init(&mutex, &ww_class);
c22fb3807fd0a3 Chris Wilson      2016-12-01  129  	ww_acquire_init(&ctx, &ww_class);
c22fb3807fd0a3 Chris Wilson      2016-12-01  130
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  131  	if (!trylock) {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  132  		ret = ww_mutex_lock(&mutex, &ctx);
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  133  		if (ret) {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  134  			pr_err("%s: initial lock failed!\n", __func__);
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  135  			goto out;
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  136  		}
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  137  	} else {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  138  		if (!ww_mutex_trylock(&mutex, &ctx)) {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  139  			pr_err("%s: initial trylock failed!\n", __func__);
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  140  			goto out;
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  141  		}
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  142  	}
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  143
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  144  	if (ww_mutex_trylock(&mutex, NULL))  {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  145  		pr_err("%s: trylocked itself without context from %s!\n", __func__, from);
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  146  		ww_mutex_unlock(&mutex);
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  147  		ret = -EINVAL;
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  148  		goto out;
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  149  	}
c22fb3807fd0a3 Chris Wilson      2016-12-01  150
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  151  	if (ww_mutex_trylock(&mutex, &ctx))  {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  152  		pr_err("%s: trylocked itself with context from %s!\n", __func__, from);
c22fb3807fd0a3 Chris Wilson      2016-12-01  153  		ww_mutex_unlock(&mutex);
c22fb3807fd0a3 Chris Wilson      2016-12-01  154  		ret = -EINVAL;
c22fb3807fd0a3 Chris Wilson      2016-12-01  155  		goto out;
c22fb3807fd0a3 Chris Wilson      2016-12-01  156  	}
c22fb3807fd0a3 Chris Wilson      2016-12-01  157
c22fb3807fd0a3 Chris Wilson      2016-12-01  158  	ret = ww_mutex_lock(&mutex, &ctx);
c22fb3807fd0a3 Chris Wilson      2016-12-01  159  	if (ret != -EALREADY) {
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  160  		pr_err("%s: missed deadlock for recursing, ret=%d from %s\n",
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  161  		       __func__, ret, from);
c22fb3807fd0a3 Chris Wilson      2016-12-01  162  		if (!ret)
c22fb3807fd0a3 Chris Wilson      2016-12-01  163  			ww_mutex_unlock(&mutex);
c22fb3807fd0a3 Chris Wilson      2016-12-01  164  		ret = -EINVAL;
c22fb3807fd0a3 Chris Wilson      2016-12-01  165  		goto out;
c22fb3807fd0a3 Chris Wilson      2016-12-01  166  	}
c22fb3807fd0a3 Chris Wilson      2016-12-01  167
1e66afa09b0aa7 Maarten Lankhorst 2021-09-07  168  	ww_mutex_unlock(&mutex);
c22fb3807fd0a3 Chris Wilson      2016-12-01  169  	ret = 0;
c22fb3807fd0a3 Chris Wilson      2016-12-01  170  out:
c22fb3807fd0a3 Chris Wilson      2016-12-01  171  	ww_acquire_fini(&ctx);
c22fb3807fd0a3 Chris Wilson      2016-12-01 @172  	return ret;
c22fb3807fd0a3 Chris Wilson      2016-12-01  173  }
c22fb3807fd0a3 Chris Wilson      2016-12-01  174

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------yLFEH1rvnqfmkoTsJYIImcMx
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--------------yLFEH1rvnqfmkoTsJYIImcMx
Content-Type: text/plain; charset=UTF-8; name="Attached Message Part"
Content-Disposition: attachment; filename="Attached Message Part"
Content-Transfer-Encoding: base64

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmtidWlsZCBt
YWlsaW5nIGxpc3QgLS0ga2J1aWxkQGxpc3RzLjAxLm9yZw0KVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBrYnVpbGQtbGVhdmVAbGlzdHMuMDEub3JnDQoNCg==

--------------yLFEH1rvnqfmkoTsJYIImcMx--
