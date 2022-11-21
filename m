Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65816322E4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 13:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87C10E2CC;
	Mon, 21 Nov 2022 12:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9110E2C3;
 Mon, 21 Nov 2022 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669035551; x=1700571551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QRTZgvG2RBl7Wei8gJedRkPwnT0a7ch/Aoj/0327Pvc=;
 b=HG+Fl9RQdemBeQi9gLnh42zAKskoF7peW+RCSIyV9N+DMCnADNaPrfAA
 K+ppZpwSHI7IykiFO/EaY9BXEAtd5g3kyzpl7+g7IcrJyUInJBB7LDy3c
 MpvFR9ozuD7xUSl9heersjmoc37j4NPXXfs10IaFtjX3ifIr7Sw4hhpXP
 J0KBIvJbpZXr4NZ4fnMRWooFv21n33bfaWhIFW+O8T6zv9scMumbsCzX+
 Bv6dWyKyv6TdalGNlrrztF4nvQKXbXblE77KrJcURYfIf4JDxHvEGJ9Ik
 XJ5n6HoGD0DrXyGwh63GlRRSyAD9bB4TOlxpO9VUYu+OJcPcLU3uDUYIs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="311179072"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="311179072"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 04:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="673963688"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="673963688"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 21 Nov 2022 04:59:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 04:59:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 04:59:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 04:59:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNIuvPxgZUKFeb8sByjZJh+QjG96S+e2SSSJBhsqu3E3dWJruLmBv4f/D6rOZRBkRCOvdFx4+K7FghNK3T9irfJHQgXfU5uLSenPDBogaQDlrYYdwksO9iL36CBTdBKyZPu+sey31tzFcNbJTa2ee4rd91HTY2cLcnjYeeZT+b10QJLM7WUCt9v1h4jtNF+pkREMwGPc3AcFB90O8dWyOBFulHXK1+mVnGqMU0sIGDcxVNbvMFG+1ok6My6/9Gjjo+rP8dWBDkUOye/wU0hIpFa5fm6xI3SnpJHFVFealu9rI8xbTmEMiof1hvmQGiqTPRerp1QiI5y03p2aHyi2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aacBDN9qFn9I35+VB+WDKJvcmyFl22byAP3ebzxJIM=;
 b=Z/JNecvEqySUXE+9wnPdNZQ6d7f0h0cFubTMzTcC9f5wks50JriDNQHZ68kgB579z+QCqEKKwGn6QeNWqmg7d2K8wrsoYahJpA8TCIT5Kc+E/vi9sBBUzUm6kpyh928qCUD6cN8eHi9hcnuudKBot3ghxQ5UYgiM3XtVhCx0C+f6lHtdsVAnsroq5om5/XkaOMXHRIv6UvW8VQJiJ0mWC/tCUhM3h34qzPBwUzAuvZFGNbI7t7PlizroahmUTcJtjJTl4AGj1yESIJBioYoneUVEenE0ditm44hGZVGM23pLo0A0BsNFLv9EY0gC4AmljlIV2ofPXx/UyildAsV2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by MW4PR11MB5871.namprd11.prod.outlook.com (2603:10b6:303:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 12:59:07 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::31f0:c587:f00f:e4de]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::31f0:c587:f00f:e4de%9]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 12:59:07 +0000
Message-ID: <f4783e59-ada5-ef5b-3aae-24de3f156616@intel.com>
Date: Mon, 21 Nov 2022 18:28:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH v3] drm/i915/mtl: Media GT and Render GT share common GGTT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221115150454.2509551-1-aravind.iddamsetty@intel.com>
 <Y3gMnGqw123WEG1P@mdroper-desk1.amr.corp.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <Y3gMnGqw123WEG1P@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::22) To BL1PR11MB5480.namprd11.prod.outlook.com
 (2603:10b6:208:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5480:EE_|MW4PR11MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d2388e-c4e9-4f70-7054-08dacbc02cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5qAe45NfsuHyRWkxTGorMw/4LRzDsxvCq+eSP1NKaf4zqgrOs1IE3YMlVMkUXIyEu3UdvJ/wWyoT+Zunz4iSfw87iiuIojhC1+L+e0+qtPuM3DnXYQIEkFvFoEZ7RP/5MlgYqfLSu4IW3p2UR0KoTbQyBRq4CDRfLYGP8un/bxk0x93aXSPDx/SjaD5SQWY0y1LtASrY/pKqwK/TwMu6ynpNxolT5XZ8JpzsBr/gXSImG8HkbYHRz3pmLJFCRDNgtGL3DqMxMGLZ+ZpqR5Ox49/W+ugkJWunmp4iT4ITkmATanpy0k3NAbHL9kd9Z0v4ZHvS6Bpd3VyxNVDRU/bIFkX+b0AIKOrTPkjvEpd3TBpLFuQpKtxZSRLLMAT+PTDsTX5sFi1DYUUotphAdaMsrggQE/T/xZfHK8ZHNjxTMJw4V6Bo73kMHTLJQehxs1CdRGYvx8oIMvEMm+ZUh6/rmoj/f/XO8wIOMPF15nVDy90j50llRuqg7PlUEaM1eY0GUzlEjmoKY6sJBu6elRHzRcWKDaBEv89UwdWjFomBwvvtRIlL+xObZOdUdWtl+P0uQG+3Yteqz36U9W9gcc9pHnEvz1RPfRkMDLO16FSgzjhENOk3xSaYAolwAIqqn3SmD4GBHkvvVQ5UY05G60hpw5YzHA/IpPu+6bx14Ll1aaF/+agMX0gXM3fd5IAa/X8SW7X+nuzdt6tAvnHDF3HXISc5zY7sqU+4Rf4C0J6RTJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(83380400001)(86362001)(31696002)(38100700002)(82960400001)(2906002)(30864003)(41300700001)(5660300002)(316002)(6862004)(8936002)(53546011)(6666004)(2616005)(478600001)(6506007)(6486002)(186003)(66946007)(26005)(6636002)(66476007)(4326008)(37006003)(450100002)(8676002)(66556008)(6512007)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFCTGhoZUw3MFdTYWxPek5YQTNCY1dGMDJiLzIwTVlpVldpSjBwdFVyTHBL?=
 =?utf-8?B?VzYvVlBtUEVkcHMzYnp2V1k0TGpmK1cxNGlMdWZhbWt6MmxWbkdFQkw1SmVi?=
 =?utf-8?B?Ulc3c1JzVWJmUnZLNVU0dzZrZmlyMnduTHp3UzYxK2NIQkpqQmg2ZlNQYlhJ?=
 =?utf-8?B?VFNMemxNdXV4eUg1enFZajBvT3hrUjUxUXNnWmRkaFN4ckoxRUE5U0VJMmJm?=
 =?utf-8?B?RWVQWVgyOWY2VHhoaEpIWXhzd0dvVStHcXU5dnlUbzVpaDhTS2Fxd0srR2xx?=
 =?utf-8?B?OXVLbERxZDFFdUlTQlZoNlpKSmkyMkc5elNneDlVVHlNN1RGSE9LNkFhUnVE?=
 =?utf-8?B?VFlxRDYxQlB2TFo2c3ZPZlV2QVdHRUZ5SnlMKy9ueFhWMGJGZDRKbGwxazQ4?=
 =?utf-8?B?dFp0S3JrdXZTZGR5NDNqQ3RFUnVmWFl4bDFmblhCNHVWdUgwQjRIZ1ZYY3Zs?=
 =?utf-8?B?Wk1vSEIzTTRvektYUjRrSnY2TkJ1OFdwdzdHVTl2MmRxenNoSDVaNWhlNVZu?=
 =?utf-8?B?OUg3b3Z6dFJLcTJ5YUUvSTZ5b2M1QTJyNlpQWStpcnpGOHB3ckJCV3ZEaWlH?=
 =?utf-8?B?cEdZUHhMcklhbEF6bTl5UEwrdUR3SnN3cDk0enZKQkpUOVdMVU5vTExldVFy?=
 =?utf-8?B?MTF5ZzlnOS9kT29xdzdqYk5udHA2blgzZjgzUGg0NksvaWFSOTdKQTZzeDdu?=
 =?utf-8?B?TnM2dC9WN3hYTDdEUm5hOEdoQjY2YVVmRGxqaEI1QVRIamxCSnl3aUl4Vkxn?=
 =?utf-8?B?TmpJRk9OUEQrK251T0p2WHR1N2UrMUdTMTVxZG8ybXN2THlsc242SkZkQ3Zs?=
 =?utf-8?B?dUFlbE90dzRuWFJTc2VQZEFKZkpwUHdIY3VWL2hMSDlpNThCT0hJR0Nxd2ZX?=
 =?utf-8?B?RTFvTWwvNjZVVHVvNWQvNU5qelBkU0ZzMzhiTm9KVTV4YUFtc0o0UlNzWXlj?=
 =?utf-8?B?RW9NYXpnVnloU3ZDaFV3SHRLQVpyQ1I1N2NrclcxaEdMN0ZjcU04VTFJQ3Rv?=
 =?utf-8?B?N3NxR0hwTVJKRmhOd2NHQUlvWlVrT3kwWW01bEEvODcrVEIxWDZJWWY0cmFl?=
 =?utf-8?B?aHdzOUNGZExvbDJkcnJ4a2E0UUVMTDYrT3BqSnc0UHVnNU40aWYvT1g2RnhI?=
 =?utf-8?B?eFVsVUNYWE9oekNYU0ZsdmVMUzIxdFlwYUF4cGsyM1Zadm9ZMTcybDhyMk9R?=
 =?utf-8?B?WkJvS2hNYndNV3FZbVRwaW1Nbi82WTUyam5obHNIS0c1WXcwZGdLeTZQbkFW?=
 =?utf-8?B?RTI2K0RGaVM0a0QwT2xBaUxwQ1JISFVVWm1TbE5SQmNIbEtJczhwMWlDcElS?=
 =?utf-8?B?VEtRZ0pyTHRmSzNOS1N1TXlOQlRpWlNNcCt3MmlKMmZKUzdZVzQ5WTl2enZw?=
 =?utf-8?B?T092bk5oUzNRUURLYmc0aGZ6ek9pYm15R29EajVEQ0NmNmxGc09MVi9TeGo4?=
 =?utf-8?B?UFN5UTZwMHBLclRhZkpNYUhnMzJ4UkExTGlIand2aTUrdGNJbEROK285N1Y2?=
 =?utf-8?B?ZnluOEhYZm5xVmZZeDVPQnlKN3JZbEpHSjNQWjNEVVplQ2dJa3NIc05Sc251?=
 =?utf-8?B?b0l4dlR5ZWNHeXVkdFFTQi92a2pWMlNOQVJuUzNJMmcvdFhLWFY5YS91L2pO?=
 =?utf-8?B?SlRnMDdlSFU5bWRpTG1MajFSTFJFVklOaUZDNkYrSTZJMnBHbmViOERyL2E1?=
 =?utf-8?B?bXVEb1ora05tV2g1a1Y3SUVPemwxeHc5bHBFSjA4L0FEaWltbENacmM5SEsv?=
 =?utf-8?B?aWMzdUxBcmxaS21WUFFxKzRUd3dVNVF2M1N2Uk40anlpWGlOZnFCdWVCRkdt?=
 =?utf-8?B?YnRJSzN3Sng1blVhR3FWL0lBWjZvTUx5dWxFaVBPeDVpQ1dsQnlOWHhaTTNR?=
 =?utf-8?B?S05VMFRVY0JoQWkySUY3VG1pak5KRk1qck5uSUdhUFNxSkJVTVFDcVhZUW1F?=
 =?utf-8?B?OWtWTGhWdDU4ZlM5STVSUTNCSWcwcGV0UUsvUkw4RTJ4d0x0bytxOGtVUWVV?=
 =?utf-8?B?VjlSRlBWZ0tmRHZiYnV4SWpnenhqNmRKeHVBb29mdEkybXdvYUpZY0RiUGp1?=
 =?utf-8?B?TlVnZ0k3QnFTZWlDRHFLYmJqVWZoa3I0RmJaUHhnem40TmpONjZsR2did3JP?=
 =?utf-8?B?QkdZSVFoeFpNRnFCaHNpbDUvYWdrdlcwVzFzNFQ2OVhKUG16VE9reXZUSnRh?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d2388e-c4e9-4f70-7054-08dacbc02cde
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:59:07.7187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eq62oUbNLrmLNrPI8HE1QOu7sHzIAKw97dLb/qvoIsvhvIBTFT0+/eFTdRoT4F6DgI+AGeNAP4KWmobEd/8D3qufvAa/+dqmqPEU4wZWbAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5871
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



On 19-11-2022 04:22, Matt Roper wrote:
> On Tue, Nov 15, 2022 at 08:34:54PM +0530, Aravind Iddamsetty wrote:
>> On XE_LPM+ platforms the media engines are carved out into a separate
>> GT but have a common GGTMMADR address range which essentially makes
>> the GGTT address space to be shared between media and render GT. As a
>> result any updates in GGTT shall invalidate TLB of GTs sharing it and
>> similarly any operation on GGTT requiring an action on a GT will have to
>> involve all GTs sharing it. setup_private_pat was being done on a per
>> GGTT based as that doesn't touch any GGTT structures moved it to per GT
>> based.
>>
>> BSPEC: 63834
>>
>> v2:
>> 1. Add details to commit msg
>> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
>> by Lucas
>> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
>> it.
>> 4. setup_private_pat moved out of intel_gt_tiles_init
>>
>> v3:
>> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>  9 files changed, 111 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 8145851ad23d..7644738b9cdb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/types.h>
>>  #include <linux/stop_machine.h>
>>  
>> +#include <drm/drm_managed.h>
>>  #include <drm/i915_drm.h>
>>  #include <drm/intel-gtt.h>
>>  
>> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>>  
>>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>  {
>> +	struct intel_gt *gt;
>> +
>>  	i915_ggtt_suspend_vm(&ggtt->vm);
>>  	ggtt->invalidate(ggtt);
>>  
>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +		intel_gt_check_and_clear_faults(gt);
>>  }
>>  
>>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  
>>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  {
>> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>>  
>>  	gen8_ggtt_invalidate(ggtt);
>>  
>> -	if (GRAPHICS_VER(i915) >= 12)
>> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> -	else
>> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +	if (GRAPHICS_VER(i915) >= 12) {
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_uncore_write_fw(gt->uncore,
>> +					      GEN12_GUC_TLB_INV_CR,
>> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> +	} else {
>> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
>> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +	}
>>  }
>>  
>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>  
>>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>  
>> -	setup_private_pat(ggtt->vm.gt);
>> -
>>  	return ggtt_probe_common(ggtt, size);
>>  }
>>  
>> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>>   */
>>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>  {
>> -	int ret;
>> +	struct intel_gt *gt;
>> +	int ret, i;
>> +
>> +	for_each_gt(gt, i915, i) {
>> +		ret = intel_gt_assign_ggtt(gt);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>>  	if (ret)
>> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>  	return 0;
>>  }
>>  
>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
>> +{
>> +	struct i915_ggtt *ggtt;
>> +
>> +	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
>> +	if (!ggtt)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&ggtt->gt_list);
>> +
>> +	return ggtt;
>> +}
>> +
>>  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>>  {
>>  	if (GRAPHICS_VER(i915) < 6)
>> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>>  
>>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>  {
>> +	struct intel_gt *gt;
>>  	bool flush;
>>  
>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +		intel_gt_check_and_clear_faults(gt);
>>  
>>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>>  
>> @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>  	if (flush)
>>  		wbinvd_on_all_cpus();
>>  
>> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>> -		setup_private_pat(ggtt->vm.gt);
>> -
>>  	intel_ggtt_restore_fences(ggtt);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 0325f071046c..bd874a4edfc1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>>  
>>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>>  {
>> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>> +	/* Media GT shares primary GT's GGTT */
>> +	if (gt->type == GT_MEDIA) {
>> +		gt->ggtt = to_gt(gt->i915)->ggtt;
>> +	} else {
>> +		gt->ggtt = i915_ggtt_create(gt->i915);
>> +		if (IS_ERR(gt->ggtt))
>> +			return PTR_ERR(gt->ggtt);
>> +	}
>>  
>> -	return gt->ggtt ? 0 : -ENOMEM;
>> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>> +
>> +	return 0;
>>  }
>>  
>>  int intel_gt_init_mmio(struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index c1d9cd255e06..8d915640914b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -277,6 +277,9 @@ struct intel_gt {
>>  	struct kobject *sysfs_defaults;
>>  
>>  	struct i915_perf_gt perf;
>> +
>> +	/** link: &ggtt.gt_list */
>> +	struct list_head ggtt_link;
>>  };
>>  
>>  struct intel_gt_definition {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 4d75ba4bb41d..d1900fec6cd1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -390,6 +390,9 @@ struct i915_ggtt {
>>  	struct mutex error_mutex;
>>  	struct drm_mm_node error_capture;
>>  	struct drm_mm_node uc_fw;
>> +
>> +	/** List of GTs mapping this GGTT */
>> +	struct list_head gt_list;
>>  };
>>  
>>  struct i915_ppgtt {
>> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>>  int i915_init_ggtt(struct drm_i915_private *i915);
>>  void i915_ggtt_driver_release(struct drm_i915_private *i915);
>>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>>  
>>  static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
>>  {
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 69103ae37779..4e1bb3c23c63 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>  
>>  	i915_perf_init(dev_priv);
>>  
>> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
>> -	if (ret)
>> -		goto err_perf;
>> -
>>  	ret = i915_ggtt_probe_hw(dev_priv);
>>  	if (ret)
>>  		goto err_perf;
>> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>>  static int i915_drm_resume(struct drm_device *dev)
>>  {
>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>> -	int ret;
>> +	struct intel_gt *gt;
>> +	int ret, i;
>>  
>>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>  
>> @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device *dev)
>>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>>  
>>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
>> +
>> +	for_each_gt(gt, dev_priv, i)
>> +		if (GRAPHICS_VER(gt->i915) >= 8)
>> +			setup_private_pat(gt);
>> +
>>  	/* Must be called after GGTT is resumed. */
>>  	intel_dpt_resume(dev_priv);
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>> index 8468ca9885fd..086c4702e1bf 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>>  	for_each_gt(gt, dev_priv, i) {
>>  		intel_uc_fetch_firmwares(&gt->uc);
>>  		intel_wopcm_init(&gt->wopcm);
>> +		if (GRAPHICS_VER(dev_priv) >= 8)
>> +			setup_private_pat(gt);
>>  	}
>>  
>>  	ret = i915_init_ggtt(dev_priv);
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index f025ee4fa526..99319ef92f47 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>>  	return !kref_read(&vma->obj->base.refcount);
>>  }
>>  
>> -static int ggtt_flush(struct intel_gt *gt)
>> +static int ggtt_flush(struct i915_address_space *vm)
>>  {
>> -	/*
>> -	 * Not everything in the GGTT is tracked via vma (otherwise we
>> -	 * could evict as required with minimal stalling) so we are forced
>> -	 * to idle the GPU and explicitly retire outstanding requests in
>> -	 * the hopes that we can then remove contexts and the like only
>> -	 * bound by their active reference.
>> -	 */
>> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +	struct intel_gt *gt;
>> +	int ret = 0;
>> +
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>> +		/*
>> +		 * Not everything in the GGTT is tracked via vma (otherwise we
>> +		 * could evict as required with minimal stalling) so we are forced
>> +		 * to idle the GPU and explicitly retire outstanding requests in
>> +		 * the hopes that we can then remove contexts and the like only
>> +		 * bound by their active reference.
>> +		 */
>> +		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return ret;
>>  }
>>  
>>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
>> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  	struct drm_mm_node *node;
>>  	enum drm_mm_insert_mode mode;
>>  	struct i915_vma *active;
>> +	struct intel_gt *gt;
>>  	int ret;
>>  
>>  	lockdep_assert_held(&vm->mutex);
>> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  				    min_size, alignment, color,
>>  				    start, end, mode);
>>  
>> -	intel_gt_retire_requests(vm->gt);
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +
>> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
> 
> This isn't an RCU list is it?
> 
>> +			intel_gt_retire_requests(gt);
>> +	} else {
>> +		intel_gt_retire_requests(vm->gt);
>> +	}
>>  
>>  search_again:
>>  	active = NULL;
>> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>>  		return -EBUSY;
>>  
>> -	ret = ggtt_flush(vm->gt);
>> +	ret = ggtt_flush(vm);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>  	 * a stray pin (preventing eviction) that can only be resolved by
>>  	 * retiring.
>>  	 */
>> -	intel_gt_retire_requests(vm->gt);
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_gt_retire_requests(gt);
>> +	} else {
>> +		intel_gt_retire_requests(vm->gt);
>> +	}
>>  
>>  	if (i915_vm_has_cache_coloring(vm)) {
>>  		/* Expand search to cover neighbouring guard pages (or lack!) */
>> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>>  	 * switch otherwise is ineffective.
>>  	 */
>>  	if (i915_is_ggtt(vm)) {
>> -		ret = ggtt_flush(vm->gt);
>> +		ret = ggtt_flush(vm);
>>  		if (ret)
>>  			return ret;
>>  	}
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 3b969d679c1e..2b637f27e3b4 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  			   u32 align, unsigned int flags)
>>  {
>>  	struct i915_address_space *vm = vma->vm;
>> +	struct intel_gt *gt;
>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>  	int err;
>>  
>>  	do {
>> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  		}
>>  
>>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
>> -		flush_idle_contexts(vm->gt);
>> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
> 
> Same here.
thanks for mentioning this, will correct it.

Thanks,
Aravind.
> 
> 
> Matt
> 
>> +			flush_idle_contexts(gt);
>>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>>  			/*
>>  			 * We pass NULL ww here, as we don't want to unbind
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> index e5dd82e7e480..2535b9684bd1 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>>  	 */
>>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>  		i915_ggtt_resume(to_gt(i915)->ggtt);
>> +		if (GRAPHICS_VER(i915) >= 8)
>> +			setup_private_pat(to_gt(i915));
>>  		i915_gem_resume(i915);
>>  	}
>>  }
>> -- 
>> 2.25.1
>>
> 
