Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FE42E74A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 05:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE906ECC7;
	Fri, 15 Oct 2021 03:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6868D6E21A;
 Fri, 15 Oct 2021 03:36:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="214778777"
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; 
 d="gz'50?scan'50,208,50";a="214778777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 20:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; 
 d="gz'50?scan'50,208,50";a="461426910"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 14 Oct 2021 20:36:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 20:36:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 20:36:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 20:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2iN8+a2XpI7Gjk+Q6SbcL4Xtflu1dbfhbA00FYNo55okxxbw30l0Puc9rg3XCRNxQJq40wHKSUEXiSlDXv9cmSmPP5V2GHSL+QymilKNklxu2uZThPufwp8nSpXWwTvDUToIGhQ0kuVJg5LN3NgzrnlSKCUNGx8LB8kjAD/NBD6tKZP482wlFh70MpRLdbjcs/ckGsQJ8YTElNlppLlL+5pDRKVZShAd+OvBi0se04aBU+v+B9Hb4rCRAFSVazqbwN9rIo8BP1BLg0u6KwEB3ykWqXQ7RJf3XnEWcOQNAOm8xLC7kWHVzdOJVCZkVj/ilHnd/Mr9fC+WxaXGcHWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfykaxyJOk4Llo4nHN3Ua1WVmwoWyGRBubsFWnooHRM=;
 b=n3yU1oV2jV7ozWdysugAF9tft6CtI485jR3jit4U8/LwGbLO0D0AtvI6KD8O9mzu07ZWizZIxpixrM+H0ATQY8whUNlZRTXymFCO/qB47mLeqsP0BdNfpK77/CpHfvaNGO8VdSd6GuE0Y7qvXAnnKEopC+VixfHYr+rW0cn/CkqZimmWdU7acPcK+z9VBnH4CjDRDM+E/35omJhkZft8F+xHRnq/5ByFkuLXyBLiok2u9Dqi8afS4kRLiF8B6OK7XshjcltJGxv9BdY4vo+n4oZtuIbGhWKyjPrNjAP8rkij0LqfponatXE0kpKXHpucDZBE+STB9kFdA3XPKMfl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfykaxyJOk4Llo4nHN3Ua1WVmwoWyGRBubsFWnooHRM=;
 b=PXeXfzgxZhLGPZyDkoT1rH3wdBk2eyhRTi/T/xiVvFL8rOat1pLGbGuK2jRD33AaTF+UYIOFbftNzZgH6A+sVNEREVeC4N/AtLpexZ/bchlRdiT/Seieb4HXDWAurs/61jQ6tponGyj5sYa8C/oqWXhmhT4nauMnvBVeObBgCcc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 03:36:06 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f%7]) with mapi id 15.20.4587.030; Fri, 15 Oct 2021
 03:36:06 +0000
Content-Type: multipart/mixed; boundary="------------XmWGCYc6wTrYT0Um1eS2oc2b"
Message-ID: <aa5b9429-865e-a292-ccca-7fa5d84282d3@intel.com>
Date: Fri, 15 Oct 2021 11:35:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: [PATCH v8 6/8] drm/i915/ttm: move shrinker management into
 adjust_lru
References: <202110131317.mfvcrC0K-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202110131317.mfvcrC0K-lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
 <dri-devel@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=c3=b6m?=
 <thomas.hellstrom@linux.intel.com>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202110131317.mfvcrC0K-lkp@intel.com>
X-ClientProxiedBy: HK2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:202:2e::31) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
Received: from [10.238.2.77] (192.198.143.18) by
 HK2PR06CA0019.apcprd06.prod.outlook.com (2603:1096:202:2e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Fri, 15 Oct 2021 03:36:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0351322b-4f3f-433f-68b3-08d98f8ceb12
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5661:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5661569E8746B5B5A942BBC7FBB99@SJ0PR11MB5661.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WHs3vPejYSrUOQJUqF4udJmzzlyH8ztrD1ej5pruvnDKa7q3dRsMkRAvkvvMvDZurVr8DZX5t6zXsfV/yHvwfa0XOp7GmZAQEZhBB/XrKtVAK3DNX8jETkIVXn+IGlvDgA4RdEkkYfIFzoNTr+M9dyUj8/ar/4tcBbihPGuCLoNb6D0bnX4Zwq0EaV6G/1u0ZE9D7z3217G/6uya385H/0Y7OSHbX7J1n4lu9qK5LnYqbnCS/WCoe1nwO2wnfjTKzAMa3/tiFdJRYyujVaC37gDlABJZ6j/hsckh6UH+eI0k9qEGjqcm2z1jU/vsdV0FDqyBj7T73PCmYS1WwDHUz0jDxMd/ufX9wwpldvimYTRA4IyIvqk8HDv3JoZ2fVwMLLVkapOLAyuEGrCPTXSZX8hM5YIpYZRNlp9LUHmImpJbdVxEglHE+etCxutC5ONDR1FB4ESsJlJZi7SrOib/KQfHOfrq2mY7n14bOCubo/JOxVSXR4vgFa4Cz+ZZP6n4rbHaP4o88jL6aBjg+llQnkr2MexbDgpk2cN8fjU/B7v+ODXqSzQOMLCxUS/vXZ4rWos3XC/OL8ONXGVf50wujVPiW+MhTrxmcfk4EoePbHo2wUkenSk3jwl10GL4garNBeYO5DmH32WKWe/zfBPrWtGebFLAs4jVWqvCfolh2x0nn+xl1+ixxcXmzGTXChN2Q66JvdAmVZy3Apwsxo3QO2W6KxaDI0Pegg33nFiBgmhMSsreeajmrh65Fd0+vYYqgMabhRRRkbxbhw4AL5OpJoCfOk+BhJeIDiMi1QIa/8bfX+h4PKw7DmpMMMm52iew
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5598.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(66574015)(6486002)(316002)(82960400001)(31696002)(4326008)(8676002)(86362001)(66556008)(36756003)(186003)(5660300002)(33964004)(31686004)(6666004)(4001150100001)(2906002)(38100700002)(83380400001)(2616005)(26005)(16576012)(8936002)(956004)(66946007)(966005)(235185007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzdKd0FDejFLMG5BVVB4a1hDRmN0czNmalZNeUhVRFk3cHZQam1HS0l0NEpR?=
 =?utf-8?B?a21SK0VRNG9SQ2dJZzZNM3BHUHFhS2d6MFhXVDJpWE1uTmFvM2h5ZE5OdUYr?=
 =?utf-8?B?MHdMWGEwQThJYU9xTnV2YksyUFJ1NVMzb0NOaE8rdG9aMmg5cmp1ZlJZQysx?=
 =?utf-8?B?WVJscll1TWxWSWdlOU8veXM0bldLTVZsSituUWJJVVM0TFhZSzIyWlhKSUF5?=
 =?utf-8?B?b1RaS0tBeVZnNmNBak5zRytHbFdEbE9pcXJ5UW9YK01zS09NY1llcmlBY21p?=
 =?utf-8?B?d2l5TlpXWmxnekVubG1RYjlrcjlEdWlkTy9EbkhHdmwwbkVIcWplaStqdU5q?=
 =?utf-8?B?TDlLSnRGLzF1cmJRWS8wUGNDMEVKUndqZ0VxWjdRQkljTGV5ZkYzcnAwNGRG?=
 =?utf-8?B?b0NMd1ZyWjF2Z2VrUGlaQ1UwMmc5cW9XZVN2WHYrYXUxZk9udXI5cUtyV09l?=
 =?utf-8?B?akRWUGZJVU9sVEpjcU00T1FEczJEYmVLQ1ROY0Fld1RHVFM3bTZrTmpUWkFY?=
 =?utf-8?B?RVBud0dUMmlmVTlBRjRNaG5XWDhkZnhmNDVueEhsSHprek1aaTY2Y0RVNlhW?=
 =?utf-8?B?NkN2SksrNXV5d0RvL28rQ1hqWVpOMnNpOVZ5TFNzbnBRZjdiK01Dbk1vZWp2?=
 =?utf-8?B?ZzYxOEtqNktiSXBNS3JnOGV4dDIvdU9XZ09tUHdLRjZQY3ZhdVVxaFNsbEh5?=
 =?utf-8?B?eGt1UHk2eGJ2VHdxVmVJaitwRjNCUTBEMXlNekJmZmJIaGpuNFgwV083T0g2?=
 =?utf-8?B?d2RSR0dwZWpsZXlydmZRM0U3L0xmcEFZRzFBYk1Od1dRU3dPSHl5TlNNOE1T?=
 =?utf-8?B?TEp2c1pvNm4vZS8rZW12NGtNbnBHWi9FOWkzRHlmejVQNUdSN0txZDNQVm1Q?=
 =?utf-8?B?ZG94cUdYVlRNdUQ3dHgzbCtMQm5wRXlHMWxWbjJHNU5WMFIvWmVUcU9Tc0dU?=
 =?utf-8?B?TjByTnJ2T1h0dmsranJLSkZ4YlFIYXBtS2pmMXFRTFBpd0FQcXcrY2trQit6?=
 =?utf-8?B?V0p1NVhweUg0Z083T3R1a3BLQzhVZWdqUjBMSGwzUVRMSWY5MSttMjlOZmdq?=
 =?utf-8?B?U2xkWUU0dnpsbGtJVGlpZmRLMTdveU9BYmE5WTRjeXZZdHlvb1UwSTVYdm9n?=
 =?utf-8?B?eGhmMU96ay9VT053UzlNazIxRGU1REdUN0RpVUhFZjRBS0diRDVrRjdoRG1R?=
 =?utf-8?B?NTN4ZTk2aC9ZWi9peGlVVzRldENzMFZrRXhKVGlKaWZ6ZS8rb25WejhXMllo?=
 =?utf-8?B?blovVFZJZk0xSDZMSUxudU1KNHpXdy9IMjd1YVdQc2RlV3NlWWZhdm01RnRU?=
 =?utf-8?B?N2E0eUNwYlk0S0s1ODZmdzNHdlRJRW4xZGJiVmo2WDdxTUxRRGlHUFVBTTc2?=
 =?utf-8?B?WnJCWmNJMlVUM3hzUStKL3I5dEhid1FZWXNhWXkyQUd3NzN0NjIyWC92amI4?=
 =?utf-8?B?QW1mSFMzZ3laL3Zycjl1NTRFdE0zbnJtWmNWekdNTG5XcDRhRVUwVHRiTHht?=
 =?utf-8?B?dFRKQllsejNTRzh0dHFZS3BBcS9tbEhwUWxCOWhDZEtXcmZRYTZJYW8yZXNQ?=
 =?utf-8?B?a1RQZWE1aFJ3YlY2MHUxaTlWNUdpYkhwMXhPRk8zenBkV3liOE5NalFlaXlQ?=
 =?utf-8?B?T3JnelF6YjU5NUNqeTJaWVFWSjJja0pqQ1VTeEsvS2F3TGtyRTVyaTk0WGYv?=
 =?utf-8?B?anBnQkYydEd6dkI0a2hJYVFrTWxEaExDQm1LMVRrL2FjVkJRa0JhT05jYUNY?=
 =?utf-8?Q?q4v3GzZ8svwZ1fuHh4Yj/Zs0Ft3AArUM48QIcb5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0351322b-4f3f-433f-68b3-08d98f8ceb12
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:36:05.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/H4x9xa3YgbCyj6zbrh25hT7RY2wWveFLfyLlj94dxWzqGjI/Og/NpJlFgC0Nare5pB/pwng6v2lemamfgNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5661
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

--------------XmWGCYc6wTrYT0Um1eS2oc2b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20211012]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Auld/drm-i915-gem-Break-out-some-shmem-backend-utils/20211011-230443
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-c001-20211012 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dcf39554dbea780d6cb7e12239451ba47a2668)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/43578548b98c603bc1bd2840b3e50bfde8bf0772
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Matthew-Auld/drm-i915-gem-Break-out-some-shmem-backend-utils/20211011-230443
         git checkout 43578548b98c603bc1bd2840b3e50bfde8bf0772
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:865:23: warning: Value stored to 'i915_tt' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                    struct i915_ttm_tt *i915_tt =
                                        ^~~~~~~

vim +/i915_tt +865 drivers/gpu/drm/i915/gem/i915_gem_ttm.c

213d5092776345a Thomas Hellström 2021-06-10  819
b6e913e19c54edd Thomas Hellström 2021-06-29  820  static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
b6e913e19c54edd Thomas Hellström 2021-06-29  821  				struct ttm_placement *placement)
213d5092776345a Thomas Hellström 2021-06-10  822  {
213d5092776345a Thomas Hellström 2021-06-10  823  	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
213d5092776345a Thomas Hellström 2021-06-10  824  	struct ttm_operation_ctx ctx = {
213d5092776345a Thomas Hellström 2021-06-10  825  		.interruptible = true,
213d5092776345a Thomas Hellström 2021-06-10  826  		.no_wait_gpu = false,
213d5092776345a Thomas Hellström 2021-06-10  827  	};
213d5092776345a Thomas Hellström 2021-06-10  828  	struct sg_table *st;
b07a6483839a838 Thomas Hellström 2021-06-18  829  	int real_num_busy;
213d5092776345a Thomas Hellström 2021-06-10  830  	int ret;
213d5092776345a Thomas Hellström 2021-06-10  831
b07a6483839a838 Thomas Hellström 2021-06-18  832  	/* First try only the requested placement. No eviction. */
b6e913e19c54edd Thomas Hellström 2021-06-29  833  	real_num_busy = fetch_and_zero(&placement->num_busy_placement);
b6e913e19c54edd Thomas Hellström 2021-06-29  834  	ret = ttm_bo_validate(bo, placement, &ctx);
b07a6483839a838 Thomas Hellström 2021-06-18  835  	if (ret) {
b07a6483839a838 Thomas Hellström 2021-06-18  836  		ret = i915_ttm_err_to_gem(ret);
b07a6483839a838 Thomas Hellström 2021-06-18  837  		/*
b07a6483839a838 Thomas Hellström 2021-06-18  838  		 * Anything that wants to restart the operation gets to
b07a6483839a838 Thomas Hellström 2021-06-18  839  		 * do that.
b07a6483839a838 Thomas Hellström 2021-06-18  840  		 */
b07a6483839a838 Thomas Hellström 2021-06-18  841  		if (ret == -EDEADLK || ret == -EINTR || ret == -ERESTARTSYS ||
b07a6483839a838 Thomas Hellström 2021-06-18  842  		    ret == -EAGAIN)
b07a6483839a838 Thomas Hellström 2021-06-18  843  			return ret;
b07a6483839a838 Thomas Hellström 2021-06-18  844
b07a6483839a838 Thomas Hellström 2021-06-18  845  		/*
b07a6483839a838 Thomas Hellström 2021-06-18  846  		 * If the initial attempt fails, allow all accepted placements,
b07a6483839a838 Thomas Hellström 2021-06-18  847  		 * evicting if necessary.
b07a6483839a838 Thomas Hellström 2021-06-18  848  		 */
b6e913e19c54edd Thomas Hellström 2021-06-29  849  		placement->num_busy_placement = real_num_busy;
b6e913e19c54edd Thomas Hellström 2021-06-29  850  		ret = ttm_bo_validate(bo, placement, &ctx);
213d5092776345a Thomas Hellström 2021-06-10  851  		if (ret)
b07a6483839a838 Thomas Hellström 2021-06-18  852  			return i915_ttm_err_to_gem(ret);
b07a6483839a838 Thomas Hellström 2021-06-18  853  	}
213d5092776345a Thomas Hellström 2021-06-10  854
3c2b8f326e7f73d Thomas Hellström 2021-06-24  855  	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
3c2b8f326e7f73d Thomas Hellström 2021-06-24  856  		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
3c2b8f326e7f73d Thomas Hellström 2021-06-24  857  		if (ret)
3c2b8f326e7f73d Thomas Hellström 2021-06-24  858  			return ret;
3c2b8f326e7f73d Thomas Hellström 2021-06-24  859
3c2b8f326e7f73d Thomas Hellström 2021-06-24  860  		i915_ttm_adjust_domains_after_move(obj);
3c2b8f326e7f73d Thomas Hellström 2021-06-24  861  		i915_ttm_adjust_gem_after_move(obj);
3c2b8f326e7f73d Thomas Hellström 2021-06-24  862  	}
3c2b8f326e7f73d Thomas Hellström 2021-06-24  863
75e382850b7ea51 Jason Ekstrand   2021-07-23  864  	if (!i915_gem_object_has_pages(obj)) {
3ffdf7a46488d57 Matthew Auld     2021-10-11 @865  		struct i915_ttm_tt *i915_tt =
3ffdf7a46488d57 Matthew Auld     2021-10-11  866  			container_of(bo->ttm, typeof(*i915_tt), ttm);
3ffdf7a46488d57 Matthew Auld     2021-10-11  867
213d5092776345a Thomas Hellström 2021-06-10  868  		/* Object either has a page vector or is an iomem object */
213d5092776345a Thomas Hellström 2021-06-10  869  		st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
213d5092776345a Thomas Hellström 2021-06-10  870  		if (IS_ERR(st))
213d5092776345a Thomas Hellström 2021-06-10  871  			return PTR_ERR(st);
213d5092776345a Thomas Hellström 2021-06-10  872
213d5092776345a Thomas Hellström 2021-06-10  873  		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
75e382850b7ea51 Jason Ekstrand   2021-07-23  874  	}
213d5092776345a Thomas Hellström 2021-06-10  875
43578548b98c603 Matthew Auld     2021-10-11  876  	i915_ttm_adjust_lru(obj);
213d5092776345a Thomas Hellström 2021-06-10  877  	return ret;
213d5092776345a Thomas Hellström 2021-06-10  878  }
213d5092776345a Thomas Hellström 2021-06-10  879

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------XmWGCYc6wTrYT0Um1eS2oc2b
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--------------XmWGCYc6wTrYT0Um1eS2oc2b--
