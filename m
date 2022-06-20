Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4B550E7F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 04:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C5910E307;
	Mon, 20 Jun 2022 02:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE8D10E307
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 02:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655690754; x=1687226754;
 h=message-id:date:subject:references:in-reply-to:to:cc:
 from:content-transfer-encoding:mime-version;
 bh=2VDxW4TIGNV3COjzyQ4g+0efaQd561UpOQNHTe5I5OE=;
 b=XbaFK+48YOUdnp4B5lR/RsOlHGTrwSzpEP3/tnPQsePjg4+lk9JlY/JU
 0UWDFhxD6v6wIgo+Js57Pl+H6S8ZYZ3GzxoGsoCP9EoJb4xWD8XJYGMLQ
 xlAEzf+4vsapHxEBVviMEuetBUIkxGDzuB7Xre1JBCfTXIBqwRnc0sS2O
 FB1AhxYxTMHntngoQYbfUlMNHiJwQR40fU4mmOUd1k0TZSgJklR48Yzo7
 aHVFVWSdBIa0FBGRSFkyHWsYS5X4B8zdFL/+ZbJUidniZBmt2iJfNQXhx
 jXTkbYP7pTOB5SvlEeuE4l/ckigOSA1AiWaqP3GU77a0rqUyZho/8MgFI w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366108466"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366108466"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2022 19:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="676319348"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jun 2022 19:05:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 19 Jun 2022 19:05:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 19 Jun 2022 19:05:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 19 Jun 2022 19:05:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 19 Jun 2022 19:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhyHuFtB/43ZA9lp4yWILPFhXQ8KO5eGnvLhKvWcNYOZsXN6H28dv+Ago0m/uhdFZlGr0dlO+tUEabN+PI5imE7mguPVLP9htjDQrh09AKQdZUicXjGoB6efraSeADJC1l7tSUvWCNk/xbDGAPBHSy9D5+qf/ko99A6WSkfv+6xJBiviaAVpE0VCAjA8BL/bc454L2g7BGtC1stH5swrJ/yCudIqT74/UfAnRCdKDgrnh63shAILVG7Ifuf2vGc6pSpwfZaavDhPWAJ/4t0/nOiRDR62emvrhxOUvjKsgGu3tgjpqc5R4kot+Y7FR/jolElKjlh4XLjRZtKcCh4cWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw8aB71zekwNZTOEFEK3pzPZBuobqhSQbzfFSmAK12k=;
 b=fG/hDs6GHah1mcrAh4a5dXIWiUYPxS9YBJIO+wWbz7loAoiueCz/VNyiWGIQxXxgbTb06haM4fikRVC6FCVIhzryJBDjeCwWoq5a8JpqIxoCuueZr1DrJTxBTNlGGYQt8ilCgQSNiIACuYLRkXdeHRG9JOP1jRHD8O2ozlbnNrN5Ovz7/yXFLXhbtV6topwoeYUFENlgC2DO7o1S7xvd+KKhfkKbGs7w3VbYihkrCnyB9e3Jiv9cou2oi6UJCV4fC76xwDS1mlwl+YrW6nJcZes9Q75x35Wr3fOprNEuGPWv3qZtjZTLi430fvo15uLuAzrOAcohLBOHhLF5MI2zSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Mon, 20 Jun
 2022 02:05:47 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::1169:fc9:c1ef:248e]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::1169:fc9:c1ef:248e%9]) with mapi id 15.20.5332.022; Mon, 20 Jun 2022
 02:05:46 +0000
Message-ID: <4b2b9330-6bcc-d404-0fe7-42e695905292@intel.com>
Date: Mon, 20 Jun 2022 10:05:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH V2 2/2] drm: xlnx: dsi: Add Xilinx MIPI DSI-Tx subsystem
 driver
References: <202206191404.Z1X0BOIH-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202206191404.Z1X0BOIH-lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202206191404.Z1X0BOIH-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:4:91::18) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02b227b2-1871-48b0-77d7-08da52616374
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4925:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR11MB4925094E546EABAF14FD9785FBB09@SJ0PR11MB4925.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XezWRZ5dSQl4Ql0Y8aE/q+w36AAz0SLuaCrLuX+PRzdNNeKBD2EQdC2+LH1eON9hTV3WGow4M6ibj86WcgP1prPMiAgJd7+DkEhtHrQPvl9suPT7U8g6po31WenbawOEBDTwVbwBhFYsl1HMrGQO+L4rez4SrGdxq6dqZE4jWWOIGfSZPVSLY1h5qIHhoJJ6CH49AdbVS4ENFmZ8hduFzAJcEWNWAooT6ov5ppAINt6Ku5caCtWhj3Gt8FkICoGNKXArbQKNsywR/wKdAs1KJVL3xHyUWODOOTaejS81iRuWn1VBl/Eh61pZax08an9FYfX5Rt3sRbTIu+X8tGuFYOiPhDVkA+Vhpv242A1I06grtOyjqXmJK210hFbNmHFLXAVwsK4RJsA2HAK4koyh4VAZU4gl+LnKHEHKypvDdTPyHWRgGjjjIkl/BlibLBwZ/d+0M9/oOBODx/ULP2gzxwbYKRd3ltqPs+NNSfYEKQ3oQfplVcjXMCg9h4LVtn52xLlTASZVb6/jcGaUFO+qTYhL52NA28T8hf8Co58/qmPMn67SVUi2SB64hUr/KmcQktBSJbSc5Liaw4kHDg/L63GWlf6WgnK/sFjTyLJftpsU0JKHYWC3prHwi/g7Rp+749eL6D3+XFzKTrWXROYXCAGHY0p9nnsuu9utKf58J9w3gv/LcLuRHSPZ5ltSf0zbN/dlS4luE8c34viD6+haBuXfn1vjmLn+SK19KrKdVB+4NefuQE5PQhxCDu7TJIHK2b2DTmoC+3I0o4r3P/TqmIHSUA/sQCJVvn9OWGK6IaOQmSfr7EWaQJQ/6Sc5LNFb44CdRueVJfjmPHFI/cEhVLM2noYn/oHC4PgeCwPV0/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5933.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(396003)(136003)(346002)(376002)(54906003)(6916009)(6666004)(31686004)(31696002)(186003)(66556008)(6486002)(966005)(8936002)(6506007)(66946007)(4326008)(5660300002)(2616005)(66476007)(36756003)(316002)(38100700002)(6512007)(8676002)(82960400001)(26005)(2906002)(83380400001)(86362001)(478600001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmFTZHdQSjdRVjJ1YjhKV1ZsMlVmREh1dFk5NFZnNzVZM2wvcWJ6RnlEaXhx?=
 =?utf-8?B?cVVxcXhrU3hqY2VTa25MZWtNcDlJSk0yR3E2K2Z6R3EwU3BlYkVZMzMwU1Vr?=
 =?utf-8?B?VWRVTUZCVzl0WWM4RTBsbUR6alZrNkxCZ29KK3lrcmZpcm1nVGdaTXdtM2Vx?=
 =?utf-8?B?R215OFdnYXJIWlgvYkd0Zm44MFgwSGhJb2s0U0d2YTVsMnNTYUszSG5xTjFs?=
 =?utf-8?B?bEppc080eFRsQ0hscGtwVHVsd0RSTEZWWERIcllUNG5VN1B2TGhNUmhSZmJQ?=
 =?utf-8?B?MlhuYjBHM3Jza1hDbTFtaUFqNUdBSDZCOTZveGM0cnFtYkUrd3RMQm85UkJo?=
 =?utf-8?B?NHhpUTc5K0g1eEgrTklYZUJSajcyZllScXJjUkVIMEpnOVFHVHhJRnJaVUpL?=
 =?utf-8?B?OU9sSkRXYmpPNStaZEt5TENoVVlUV1FyeW5qZHJFbWQvL250dFIrMDk2TW4r?=
 =?utf-8?B?K0N4WTVvcXFXTVpnTFZFRnN1cWZsb1Zsc254ZmtuT0F2UGJQclBEOXlZYk41?=
 =?utf-8?B?eHNwckJlajd3bWZWdXExTUhwaGZucU95WnlpVVpXdG5yTXRob1BFTzdNL3h2?=
 =?utf-8?B?UTE1K1pnSEhhcmJ5dDBLb1lMQ09SajFUdnV4Rkk1d0pkaFkvZ2ZwR2xYUTMr?=
 =?utf-8?B?U09iZ2JuUXNjOWtkYkZCZ2pSa2Z1STNnekRjWExlRHZNUEdyUW1Mc0V5MXRh?=
 =?utf-8?B?VkRTWG5rbmhZMkpnM2QyM0hxY2gwOXhzd2EzUVVvVy95Z1lhRHVpNSsrQlVC?=
 =?utf-8?B?aW5hQjRJRUt1cFl0U1ZaZ2dwWGEvWlk4Nlhvbm43cGRxNSthbjE5bTVhOER0?=
 =?utf-8?B?bjBXY0hOUWk5TmYyOXgraklLT3hqSnE5QkF6VGw1enliTERWUGVvem1hZmhs?=
 =?utf-8?B?NEZrcy9zbC9KN1k0ZUxhTFU0aTJiSFFlM3FuaExsdDVBT1hBZGdWYjhOR2xz?=
 =?utf-8?B?dzhoVnk4U3JqbGRrWDMyZEVtTjR6ekhadGgvb1UyN1poMXhneEhTV3JJV3lG?=
 =?utf-8?B?Y2JyMkVkdjhOcy80UXAzdVVaMXl2UjRvRzh3eCs4VHU3cDhUaE1nemlwbXdn?=
 =?utf-8?B?dlNOTk1jUk0wNEVETkI3WDVZanJpdG5PQUNWeFc5dW5HTGIrYjg2WjBGK3hP?=
 =?utf-8?B?QytydUsyY3h4SzFVT2VURVJSckJjZUwvL0ZubjBDRHE5MlMrY2ttOWVwU0xP?=
 =?utf-8?B?YzM5cHBuRmtRVGRSSVBZWUJnclJkUENTWVJZM1dyTXZnSEp4YUxYMk9uNjB1?=
 =?utf-8?B?YUN5bnFUdzl6eGhGS0k2SDZoZjFZYzkyMGx2UTlxdmY3Tmc3QTM2RFk2eS9E?=
 =?utf-8?B?VnFyY0gwWkhkakJUcDlRRFU5T2Q4N09tTWlBNVVFb0xCRXJ1UWxzU2Rwdk1L?=
 =?utf-8?B?V01FWENlMGt2M3BoNjJSTCtwQ3VaMFlJZXBsdkVXMDAyWVJzSUhRakV4TU9h?=
 =?utf-8?B?RWdxQUNoRjZzVmhjY2dpY3JLOThDOE81VkZqMnIxOFlXbkJxaXBpQ3FDNElt?=
 =?utf-8?B?NmQ4RStCUGNvN1lXdzdNbFc3dk1lL3cvZ0I4SkpvTUw3T2k2c1hVWTJMUFJO?=
 =?utf-8?B?eWhJdXMxQks3c0RjaDlhTVdUM1hnRG1HWWhpWWV5N1dzTGhGODFnOEJ6TVFk?=
 =?utf-8?B?S0hScjdUbDFFcCtCVTFPNkVlOUZxTU01ZGFqUmVWbXFRYXNXVXhQSmNHSXN6?=
 =?utf-8?B?ZmV3NlcyNU9QaFNDNUtTRmZraDVvb1NjempKS2Zkcmt5WHlJRm5WVFNkUFRy?=
 =?utf-8?B?OTk2b205R3g2Mk5PaTNkUVJqeHNYcjU2NUpRcytHc3ZUZ2w3K25Zd1lRMVpR?=
 =?utf-8?B?dWVXa1NpeER6d0tBRHZra2tqZjVDSDJFNVJXRnRpcmxMcklLUWdPdUtLajZp?=
 =?utf-8?B?U1hWamVQNjNsV1ViYmRLR0xZckNsOU5VVTgrMmxPMmx0WitJTUErVHE1ZGJj?=
 =?utf-8?B?cEJ2QktJYy9oZzBhaG1aa0R6cjgrdlFFbHB5SFpuUTdiUTRWZmhoSXVqOExj?=
 =?utf-8?B?UmhkTVFEODJJWmNOTjlFMlNBM0JOdnNvRE9leDYvR2FoS3B2UnpUOVBwTnBE?=
 =?utf-8?B?U1JQeWdScUV0RnI5cXVsenMrVFdXc1hrU3ljNmRhU0s4QVIxRCtKY3RXYVk0?=
 =?utf-8?B?MFRmVFArbUVobk1sQzRlSTRQbmo3OXJLVzk2ejlpSlhZVG1OSjVsZjluSUlR?=
 =?utf-8?B?R2wyTHFydEhYR3ZkYStWRVRrWWJ2YURUa0Eyd1BJTHZ6ZFNPOE9MT1RFeUxm?=
 =?utf-8?B?YVRFZndYV01SZFFPZ0FqOG9rL0RpazZvUU1jUnVYdTBNL205ZG92K1hNcVNU?=
 =?utf-8?B?b1hqQ0FqNmlzOGVTc3ZRZnMwZXFCRVVIM0djRS90dUIvMW9sUENFZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b227b2-1871-48b0-77d7-08da52616374
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 02:05:46.2572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAOPDo9aI5Ryc3B1d1AsvRGdYt8CM+0LkF86PlmXbTrhacf2nAVcef2vZqrbsavCaIs20M7qEiCTZ/EUstff+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
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
Cc: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 kbuild-all@lists.01.org, airlied@linux.ie,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, vgannava@xilinx.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Venkateshwar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Venkateshwar-Rao-Gannavarapu/Add-Xilinx-DSI-Tx-subsystem-DRM-driver/20220616-222008
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-s031-20220619 (https://download.01.org/0day-ci/archive/20220619/202206191404.Z1X0BOIH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce:
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # apt-get install sparse
         # sparse version: v0.6.4-30-g92122700-dirty
         # https://github.com/intel-lab-lkp/linux/commit/28aa62ffdc1901029bf75961166f4ebba948b9b7
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review Venkateshwar-Rao-Gannavarapu/Add-Xilinx-DSI-Tx-subsystem-DRM-driver/20220616-222008
         git checkout 28aa62ffdc1901029bf75961166f4ebba948b9b7
         # save the config file
         mkdir build_dir && cp config build_dir/.config
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <yujie.liu@intel.com>


sparse warnings: (new ones prefixed by >>)

 >> drivers/gpu/drm/xlnx/xlnx_dsi.c:218:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct xlnx_dsi *dsi @@     got void [noderef] __iomem *iomem @@
    drivers/gpu/drm/xlnx/xlnx_dsi.c:218:27: sparse:     expected struct xlnx_dsi *dsi
    drivers/gpu/drm/xlnx/xlnx_dsi.c:218:27: sparse:     got void [noderef] __iomem *iomem

 >> drivers/gpu/drm/xlnx/xlnx_dsi.c:256:9: sparse: sparse: statement expected after case label

vim +256 drivers/gpu/drm/xlnx/xlnx_dsi.c

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  179
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  180  static void
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  181  xlnx_dsi_bridge_enable(struct drm_bridge *bridge,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  182  		       struct drm_bridge_state *old_bridge_state)
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  183  {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  184  	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  185  	struct drm_atomic_state *state = old_bridge_state->base.state;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  186  	struct drm_connector *connector;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  187  	struct drm_crtc *crtc;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  188  	const struct drm_crtc_state *crtc_state;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  189  	const struct drm_display_mode *mode;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  190  	u32 reg, video_mode;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  191
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  192  	connector = drm_atomic_get_new_connector_for_encoder(state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  193  							     bridge->encoder);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  194  	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  195  	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  196  	mode = &crtc_state->adjusted_mode;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  197
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  198  	reg = xlnx_dsi_read(dsi, XDSI_PCR);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  199  	video_mode = (reg & XDSI_PCR_VIDEOMODE_MASK) >> XDSI_PCR_VIDEOMODE_SHIFT;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  200
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  201  	if (!video_mode && (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)) {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  202  		reg = XDSI_TIME1_HSA(mode->hsync_end -
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  203  				     mode->hsync_start);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  204  		xlnx_dsi_write(dsi, XDSI_TIME1, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  205  	}
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  206
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  207  	reg = XDSI_TIME4_VFP(mode->vsync_start - mode->vdisplay) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  208  		XDSI_TIME4_VBP(mode->vtotal - mode->vsync_end) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  209  		XDSI_TIME4_VSA(mode->vsync_end - mode->vsync_start);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  210  	xlnx_dsi_write(dsi, XDSI_TIME4, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  211
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  212  	reg = XDSI_TIME3_HFP(mode->hsync_start - mode->hdisplay) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  213  		XDSI_TIME3_HBP(mode->htotal - mode->hsync_end);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  214  	xlnx_dsi_write(dsi, XDSI_TIME3, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  215
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  216  	reg = XDSI_TIME2_HACT(mode->hdisplay * dsi->mul_factor / 100) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  217  		XDSI_TIME2_VACT(mode->vdisplay);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16 @218  	xlnx_dsi_write(dsi->iomem, XDSI_TIME2, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  219
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  220  	xlnx_dsi_write(dsi, XDSI_PCR, XDSI_PCR_VIDEOMODE(BIT(0)));
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  221
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  222  	/* Enable Core */
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  223  	reg = xlnx_dsi_read(dsi, XDSI_CCR);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  224  	reg |= XDSI_CCR_COREENB;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  225  	xlnx_dsi_write(dsi, XDSI_CCR, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  226  }
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  227
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  228  #define MAX_INPUT_SEL_FORMATS   3
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  229  static u32
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  230  *xlnx_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  231  					   struct drm_bridge_state *bridge_state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  232  					   struct drm_crtc_state *crtc_state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  233  					   struct drm_connector_state *conn_state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  234  					   u32 output_fmt,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  235  					   unsigned int *num_input_fmts)
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  236  {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  237  	u32 *input_fmts;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  238  	unsigned int i = 0;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  239
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  240  	*num_input_fmts = 0;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  241  	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  242  	if (!input_fmts)
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  243  		return NULL;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  244
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  245  	switch (output_fmt) {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  246  	case MEDIA_BUS_FMT_FIXED:
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  247  		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  248  		break;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  249  	case MEDIA_BUS_FMT_RGB666_1X18:
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  250  		input_fmts[i++] = MEDIA_BUS_FMT_RGB666_1X18;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  251  		break;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  252  	case MEDIA_BUS_FMT_RGB565_1X16:
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  253  		input_fmts[i++] = MEDIA_BUS_FMT_RGB565_1X16;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  254  		break;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  255  	default: /* define */
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16 @256  	}
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  257
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  258  	*num_input_fmts = i;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  259  	if (*num_input_fmts == 0) {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  260  		kfree(input_fmts);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  261  		input_fmts = NULL;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  262  	}
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  263
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  264  	return input_fmts;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  265  }
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  266

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
