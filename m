Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8307462A2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 20:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B9610E227;
	Mon,  3 Jul 2023 18:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1510E04F;
 Mon,  3 Jul 2023 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688409714; x=1719945714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W+ey/9uNtIpkdqZbbRXUMG0aivzyT1f8SbPoSQOHjL8=;
 b=XkfkEub6YRwTgkWAN6AELbtNvcJH5GLbP9KKv+PwXMssmiAvHxEuL+OY
 7LVWGVyQesZ+g+jxIAOfOYafFHQRQNRPut38w1SmRKLUlZqXfUdEkitkH
 177drIkblPZFrfP1Mhk22YK2nrYPn73irA41gwglntoEeJou72Yl+l8iZ
 E4XpgMy8NrAe/0t1jI93cBWfN8UseIwmBSo7y6jcVsRbaQsE8qlVzfXYe
 Hhcz/PuYl8UPiP5d5/1Xr0YwN6lqymbKosX3vT3YCLSVaVmXuWFoo5wox
 ZTf4XSwR9gp/egjPmH6AdaKyh1RXGjbZjVMWkWdqj8DqMyGx0g2fdHnQr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361808138"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="361808138"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 11:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863163310"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="863163310"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2023 11:41:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 11:41:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 11:41:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 11:41:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 11:41:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jK+qw5t5hsVnlVatNU49PrZCUC+vLHfP6qqAxchd4aqUI+7Ilv57C/Ak1tzmp1cn/zYWgcmAb+wcd3Er4PonJE2eR3KNDGYtB47dwg02q+KFPKYpK6wGANRoqwZVVNnVrIcGNVdH1XpAngTbIoFJTPt3o2mrLG6mBWpJwBfGtoIZZRKbtT0XYo4Gy4PW4O7r2y3P9sT+QssgJ01au0PcQafBP3uplonGvLgzJTxO2tIBxaXlR0PjfrtIJZbAL7AMjh7vt+8YzMJ8PGvg3DfxNH61iVpGMU0jUx8KmZhx0hKwXIrHW2VutwNU6hXRBkCCFW88H/bxvLdF+6AtSBWVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULrbjvsJHABLHOY08+DLzhWjHoWtBUzVXRMCljxGJsA=;
 b=lUmvmWYPsrHJkuT4CAUYk1nBbm1eOK1CKeROQ6I7yMeanIC8AalNnUdzBjOiXPlyqRFkgA2aCgLCkgvG4GMZ+AKiIh0iGW9/mjoFOKnU31bkUtoghaOjbeUh8yXfPe49cFRdNpPWuYfb03bp1WD7WHl5F56r8eCq7ESPWKDY7sbkc9Ff/bSXjq8zqdLEH29m9bjmO4EHSVeEvD5JAPmTCPXJ0ruufz+e/CeOn0KLXUSKCyMlzOn2g8KvHtY6s4CNKwQbK4vIqHMtRmu4MIulRGCtQYntT1Z4koJo0RNFIyO+CJjj/PUr2G1Dc7g7SqmfYo4FeEu1B3dnuutkUai5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5554.namprd11.prod.outlook.com (2603:10b6:208:31d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 18:41:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 18:41:42 +0000
Date: Mon, 3 Jul 2023 15:41:37 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kenneth Graunke <kenneth@whitecape.org>
Subject: Re: [PATCH v3 0/7] Fix ctx workarounds for non-masked regs
Message-ID: <be4oy4xait7e4tqndx2accfr6p2vrvpf34m6rrqg4wirz5obqg@boyt4plqgt2q>
X-Patchwork-Hint: comment
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
 <4528180.ln3aigfREe@mizzik>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4528180.ln3aigfREe@mizzik>
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3a1212-5924-480b-e5a4-08db7bf524d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: al42oOBC+Jd5fYV+2xO5m+TrG0yUVPO0Rpv1nog0z5HCdvWmLDRvElS0Mw2A7+QQEH3N7bEdl54WxWGLrJ1wiFalpdu2mVoa/Xuw8rocQKAJ6veEM4w6QtgJh1BLFgiP8bWTMlIuF6l85QYkFsDdu2Zt2hHzBMXHBRZmemgJp6H6YuRQTSDtMm0YbbhNrp7OKin/oZy+yTfWxAVpbjE7o4Yg4ku1r57rwQ/MvFPghBJ3C6WIv+asb6sEnCx5086khEvuPOlNb0Hums+XAhlkHszl0HsQhhWojtjvQJKRg3mAWrbK6Eock+clbimgxgeS1mevyTh9uVFt6pUFvhC1y+A/JctpucPc8Dl7ZsNtpHkw0Y9LErD964Q/XxRNzgAel28VwtJVoMiUmCXvYSruI3ozSjRXLYMtEQ9spJoHrKXYdEzIpOxtX1QUOjIAjhOHB/hUIyzdggdhdAxY69XnsWXrKFP36bKWIJ5wd/fuNJfYawVCeISAcModGgMEwPuuzY5dryK35nT7yMv25utyZ8dcA9klKxtmdOgET4Dmfq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(107886003)(26005)(82960400001)(478600001)(9686003)(6666004)(6512007)(966005)(6506007)(86362001)(186003)(38100700002)(66476007)(6916009)(66556008)(4326008)(66946007)(83380400001)(6486002)(316002)(5660300002)(8676002)(8936002)(41300700001)(2906002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYVhmy9qCN5C6omqItpBQeLE0/yVXiMzZYegiWqsTbx6oRQ7Oz/hsk9ZoYPc?=
 =?us-ascii?Q?ueOiCyFDef76yH9feYkvS/EsmNVOecemZiH4V5Jsm4InzJgweUqPW5qaM183?=
 =?us-ascii?Q?RMF+XwaNmPK6viTEywKnEKkmZtAWkCskh5dzjoYRw23SM/Onx2cCK1HlbgRE?=
 =?us-ascii?Q?W8zly/qgabDEU7X6MFz/nafA+OIvPsFf1gJ88/ucoueZ4+nzsnEC2y5oYwwd?=
 =?us-ascii?Q?hkJOFJN4BTpGUklZNNMJG/cLgr+iO3NMWGRh/FPdUNaQILFPwwzvClPuJTLH?=
 =?us-ascii?Q?M5Vkvrb3gQUdhoSIgFHp4BhvAb1NvJj0u87dJckKPTDkxPItCJ/KmweXx7YH?=
 =?us-ascii?Q?fFzc4cJKjopZQKMt7xk8JNgTxQ37bcJEpo2dS7BHrGlZPF2f0n3S9KTU3VtE?=
 =?us-ascii?Q?lyJsXxuc1fb81HlSrSKFYkknJbOgFzViGIT3bpvFec6aSyGC2DexIAPKPMGE?=
 =?us-ascii?Q?cL+yMHx8I71mvB+flrU8yWhQRcbsq1KYL6Uq5LJkeurmeoXd5ft+DzmIjLoT?=
 =?us-ascii?Q?V5N2/GUimcmghMxhMEGO1oN3CJFbgI94oUxmJ8G9Vzjf6Ycx0XCsv67gvDuB?=
 =?us-ascii?Q?ikNhmn0r4KErXwIWYf8z7DfRSe9gxzgywnwvrdJgu+/4d3wL0f509PxpXr7A?=
 =?us-ascii?Q?mPJboGLWTej+Y37WdGhyGtiwH4ByDuv0idnN5c2zumyogabT1MfYIkRo+usb?=
 =?us-ascii?Q?3Zjv+PwbwVe7YRnoor/ObISvY0VNR3l0wGaYTkBVftWPexldP9HY66YaU9bz?=
 =?us-ascii?Q?DhI7wN+ZBbLOaIgE+0cYDV+ZtfvBmiSvKyMz3PRXnSCRXzJqPeDgwBtx+Zrp?=
 =?us-ascii?Q?WmoUhB3qhmJ1oecCOkGF6q90AIt+vHQqCCZSlN1ycgEYLFFib1iY4TJT9Vhb?=
 =?us-ascii?Q?4YVVxQ+yOhRfyDoRK1fPwwNRPUJf1G9YdUz5xvsDZGwR8YkWYbyrA2wd5uTZ?=
 =?us-ascii?Q?whL9jeW7EVhlb3NABPpxUO0MZkU1jkGIKyGCRS2W4r6MIkg0v7cCWj9Hf9WF?=
 =?us-ascii?Q?AG73wnvzY7244oXFdtxkEjpwjz1DCmMzvlzCJYiFEg9C93G3vuRqJ5IOIBqn?=
 =?us-ascii?Q?Bs6XQKVTGYX5Ahx2tUOm4IK73gd+31NFeiDZpv1oGaykXWRINlTrpCQw5yNf?=
 =?us-ascii?Q?nNo8EmpvFE/hg/CnoLdGaV5jDMp5R1C+OkqkJQl8W5siI965d+NzDAzs06LK?=
 =?us-ascii?Q?TAAxJj6JCk7kmXjvOcXw8+22pN+3WTxumd968Vc+TcALa5CcBvPdyAcwI/Ed?=
 =?us-ascii?Q?uY3pP0+ABwT/1PAEjuqch2tAK0j/i5hdXD4eSQpA3OF/Ta2ODTrX6TCsFpF4?=
 =?us-ascii?Q?zWtCI9h9ZcQWDtbcDMBEs83pROSQ9MmSf8rLZzpqJ9slV+ECIqIMETDVf2pt?=
 =?us-ascii?Q?nC+pC2g9karqIgXWIVusb3BEEMtXwr0qiE578U0InpkNH1szfkY3wBWkN8dm?=
 =?us-ascii?Q?wSuV/4eqmU19tyYtkkRbUm1QvUSsrvCVNj+bRiIyoyaXjBoWqcTtow506BKk?=
 =?us-ascii?Q?00YK3zVfmUmuQKbiWoSM705jVjkzWizvBPsaGK9E6rJlPE1lCu6DBROSprB+?=
 =?us-ascii?Q?LK3PXT2WiVE4xyQF35MXRRHpOiwn+H4xaFAFpMYPpKBGS2JIKDuKer5E4yD/?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3a1212-5924-480b-e5a4-08db7bf524d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 18:41:42.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcdYnAMxzxZjwfmSCLi4T4UoLbo6ACBeJ4BEyhF6VMm/eb+tlB7GGm7UgIRNK6v6ZWqqHlAKV8wS7ZoZqxp5vg4t22DzAjW9pImtt9umQYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5554
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 05:41:21PM -0700, Kenneth Graunke wrote:
>On Friday, June 30, 2023 1:35:02 PM PDT Lucas De Marchi wrote:
>> v3 of https://patchwork.freedesktop.org/series/119766/
>>
>> Changes from v2:
>>
>> 	- Do not rmw if (clr | set) covers all bits
>> 	- Add patch to make sure the set bits are also checked on
>> 	  wa_*_clr_set() when clr is not a superset.
>>
>> Tested on DG2 with intel_reg reading 0xb158 with a busy render engine.
>> Now it's not losing the upper bit anymore.
>>
>> Lucas De Marchi (7):
>>   drm/i915/gt: Move wal_get_fw_for_rmw()
>>   drm/i915/gt: Clear all bits from GEN12_FF_MODE2
>>   drm/i915/gt: Fix context workarounds with non-masked regs
>>   drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
>>   drm/i915/gt: Enable read back on XEHP_FF_MODE2
>>   drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER
>>   drm/i915/gt: Also check set bits in clr_set()
>>
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 129 ++++++++++----------
>>  1 file changed, 66 insertions(+), 63 deletions(-)
>
>Whole series is now:
>
>Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
>
>Thanks a lot for fixing this, Lucas!

Thanks for the detailed review and help fixing this.
All patches pushed to drm-intel-gt-next branch. Later this week I will
work on getting the important fix backported to the relevant stable
trees.

Lucas De Marchi
