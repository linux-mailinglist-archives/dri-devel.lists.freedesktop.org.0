Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2AC6FC188
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 10:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9A310E358;
	Tue,  9 May 2023 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F3510E353;
 Tue,  9 May 2023 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683620159; x=1715156159;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5QB13WpsumBus3dYf10RALCKZzIFmC7aB6exO6MoV8M=;
 b=FnS0LhS8gK7acAUv+9EKCQG/6dBF1wtlPaIcxrkQhBc9lS3FNcF+eeBi
 yRW8xPPwe2M7C3KtOL0LiZtHMqFQxGygZwHJC0Vm6Xv7fV61djvp7dOzo
 MoGqdbtWe8uN9pSRPrE2vMx4kDKcEl8JYdhw/SABrfmVpTrMNk09VmDhy
 ZoBynCgv7HuTjkIkO8chdlZ0sVAe4mWu314JRBeoRaDgd7vBfZj6OYYuo
 0ylttjwbuOJnhtmI5EgbRh8jz2cXhlTTRFUbIvoOzoq2RcuTNyaRA9Cxs
 GRIkhCuxXJlS7l7KcY7XXMWmZo4IHd5dHeYSSN8XzZywCoH5a8FCmTmn4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329456853"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329456853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676354712"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="676354712"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 09 May 2023 01:15:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 01:15:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 01:15:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 01:15:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 01:15:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4zEVuoE6IrvY51qJQyiunAHQLOyxCCpBwDak+AO+QIni5Z5+QCpvSo2l0Hl/It/WKg5L8MI/vKen+qxFjOj/LRpWkw7Q9PioEio2E5ePQg8yrWYTA6k2T1FJKXrMucEX2NOtZBW7MQouaj4kvHQj7fNYx4qO9QlOwndSi6xEdhPjkHS18mIWquPTbXSUBRwZKGCcyDCzX2C3q69+EAVWeSqpAOoDlKqQUChQefjp69RWroRNeab2hmZ89XkQOqS+riCJH6JMml/4Wm/WL4d/YrnlxJEyPzSEi4S0/NO3uc1vcyqFEDwpwAJWj+HSvvHIj2uOiZqlCyx9f69uZwoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM8R5Jgqf6glW8rKRIUOFCppbY5gTkaLgUyhKbljbz4=;
 b=G9VbyO0wyQ4nC0GR6MpINy9GBUbzmZxwSIRZ13wecoOgyRZKbXujeSdmIZfoJ4cnVgR+JdrRJ83x+cZZyRFIBrQD8QtBpPA9nWiH9H1ux4PcqBMZFIdE401rGU20EVwZKBJROzdUZg6sgxBnAB2GGju1wQC1nTN+E7x/iEoKSbndGJuuQaJvX+Lso7L8BPRy81fAnsHQC5JS78/HZzxXyq7bzWi46qIYI8TDSPb0rAzU0MSEW0VxLy/UQAU/pO8GlgZsvV9R9WUcb/VzmNkhEdcGyU33K8/HWV0BNLxKwi66NTg1BWzgTC9Zb10sCmG6pOSMVVDVQMkYyF+wZLfmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 08:15:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 08:15:53 +0000
Date: Tue, 9 May 2023 01:15:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Temporary conversion to new GENMASK/BIT
 macros
Message-ID: <svwv5rvhjyrqz5fkmrmuurwib6wkyujvd27ydffwlw5py4kj77@s44hufd53etv>
X-Patchwork-Hint: comment
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-4-lucas.demarchi@intel.com>
 <87cz3andi8.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz3andi8.fsf@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f5de79-9ee0-4936-6d3f-08db50659b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9XFPfO3hhxx7NEt6MWxAmF2xfgLILAZ53hRcU/Q1vURxufPkqfwJW5Cj8gBUTBXmsveSaOAJoeejiHzUwbrJ+mvXkHyUXokSRrz5B+KIQXd/XRdXDylTHxOR5xa3obL3hS5sYsqTDfJwe6uwl2iUxPyJyNp6qdAkl5tAz0UruywzQaTzFgZK+r1pCQpmivS+6gcI2u//P4BmO05+13EEmn4Un+CTXrtBUxPGPPq93EPezmjRQw68F5Ovfh5Ad53euUlsQyRyNe2tXUY4NfTrkQ5w0MyzszOaa/gTKptSteRrAu3bxtT1sfrhNA5x48L2EoNgHoT9OATumY8sulUj6UZkIWHMrp9RNuTz6thj1jEB7/P7Wjin9MC3kCkJqUfc7KHMPwin8JfXOW4HhPdaUn6wkkWAiaebha45dMPmVqHF+0NwAiP1kdwrgbtu7JGRSF5DVls5w68l+j8eFCF993P5oLoY7FRJtiQVPP0PYOXpOetS2yps1DrMMM9Bfg8YGncTbgzoUDa/sEC6inU4vIlnkrt4Rbs8htRAORidPZJfG1h1hRS1/tu59RDAMde
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(86362001)(478600001)(316002)(54906003)(4326008)(66946007)(66556008)(66476007)(6916009)(6486002)(8676002)(186003)(5660300002)(33716001)(8936002)(2906002)(41300700001)(7416002)(82960400001)(38100700002)(6512007)(9686003)(26005)(6506007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NpZHhvNCtVYXg0UzZFeXdHd0dmSDd6Qy9iT0V5MnhxeUpOMGd2aVZNMXU3?=
 =?utf-8?B?ZERXdnFhMW9DNEsxYjlvQnhjSEFKZ0FFZnVNajE2U0JNNDQveVNjMlB3L0hL?=
 =?utf-8?B?ZGRsMG9sUUZ4Z0piSEUyK3NmeFZIQmFRZDRrV1J5NUtUdm5yYWxoVHBlbEZC?=
 =?utf-8?B?NEd2OEFvQ2R3RmRDRWdiYjMyRFB4OWkxSDNWSHNtRTRnSFlpWkR3ekdPN3R6?=
 =?utf-8?B?Q0VOWE5RUFJzUFdhQ1Y1Zjh4bnhKVnY1UkdWZXRZbFBwZ2l1UjZhKzhZZkRo?=
 =?utf-8?B?WHJTeWk5R3dJbkZhWmhERHJTby9RS1RHZEx1L255aUVTcjFUTThIMVFCOVpF?=
 =?utf-8?B?QnlmUmk3WGVuUnRFMTYwQWZ2bzg3Sk4vTmxydm0vZWU3dlNURkhsRWZvb3M5?=
 =?utf-8?B?Q0FmMll2dGJreUUza2lXN1FZVEduSEh4dVNiTnB5UzBENnNnTnlPSGIvNk84?=
 =?utf-8?B?Zm54ZjQyZ2NPTERVdzhxSkpGemd2UHhLRndnbm1SK1RtYmlHS1dmSkdDNVFv?=
 =?utf-8?B?cW13bHJxUkVnL3RKdHlOS2QzNm45MGdIZkNZMnpuTTFpM081VlNaU2xjcGh5?=
 =?utf-8?B?ZmFHdHY2bnVwWVN5ZlZ1UHhIWWZlakE5NGd5VHpqc09pUWsrQ2FuYjVNcG4w?=
 =?utf-8?B?NUZqRDlDc2ZnMlhnMlpYM3BZTjhSMm1JOWJ0UG95VjduRmE4TE5nSWR1RzEz?=
 =?utf-8?B?SEJlaUZjYzBGZXUwS2FuWUdaN1RXeWRvN21lbnJjSDh2WGFCSGt4YnR1Z0tW?=
 =?utf-8?B?bFR4NmgrS1RiUXAyaEhhRzg5ZmxoRlhvaUZQYno1aVhQNitoQ1Z4RXBORVNL?=
 =?utf-8?B?dWRVWXFTNkl0OG1xclVhRUREQXVzckdaNHo3bk5obG5iUXJsbUh2Y2Q4cWFl?=
 =?utf-8?B?enlJZ0RhWmpMbGFoZU1YZ1J4d2h1U0dMNnNSL2xBbFVHR0g5TzdaV2Z1UzNT?=
 =?utf-8?B?eExoRHQ3U3NSS1doMUVlRjk0RndFc0RPNUhVU3RER3lJdzI1amN0bzh2NHdL?=
 =?utf-8?B?d3RwQnJaZzM3ZkZkellnV05OTXJpcEZ2eGJBaU82M0M1aHgvZzM2cmdTdkZZ?=
 =?utf-8?B?WHpNNWM4L04zV2ZpZk5yUFQ4cmxMdWxGNXNEVGh6R3dLejB6MGpoVjhYK1ZQ?=
 =?utf-8?B?dWt0bk9GRk91bnl6dmNqV28yN204OEhMSDVhQXBMWGN3TXZpWm1iR0RBNzEx?=
 =?utf-8?B?djkzSWJrdjFxeHhRamJmVE1GT3lwUUtiTDY2aURRM2w1REE3Z1BYa0Fwa21J?=
 =?utf-8?B?c0Zhc1htdFhRcVdLM3Bqa2NRSWRJRENFUG12MC9NbTVLeVpQS2RFMnFGZFFm?=
 =?utf-8?B?bHRTNC9NOW5FTy9nYjJQQUI1a2RPaE12QjVKSXNCdmQrTEwyeVFEYWhkQS81?=
 =?utf-8?B?SFg3YmVZKzlDYlJHRGhxQ05mODVHckNZbUlXdFZNcDVzVCszTXhaajRLY0o0?=
 =?utf-8?B?RlltN1VIUC9EbG1ZUTJRU2F5VUlqYmlWT0hXSmtqdDRmem1DOGhZWnZydytK?=
 =?utf-8?B?K08xU0V5d3ltbFk1S254Mm95WHM2bllLdUVLM3lPQkMxMCt2NDVUVkc3TDAz?=
 =?utf-8?B?akJLbGtzMWdCc1VzU1gyUWxwMXhLSHNZMGkrRlVvT2VGTFNodno3eUFneEc3?=
 =?utf-8?B?NGp1VmNMdTNPaGVCck9nNkJDWHpLSlE3Y0w4NU9tb284clhnRWZsNjIvVFJQ?=
 =?utf-8?B?K1pwNTJpV1V0MDlOUGw1OXU5UVN0RnA3VzhKdk9NVjQ4cW9WNGNEMFdyaWk4?=
 =?utf-8?B?bU02cUpUK29oVVNweWlUNDRNWkJLQWJXMjZjOEFxTHQ1WENpVVdkczlobXc4?=
 =?utf-8?B?anBCdkp3VXdCd1hBeStlRDlUZUVrdWo5Y3U0cVllaGpIQzgxNlBLWjRIUGZz?=
 =?utf-8?B?b3p0ZEFvNll2RHM4dEVuQUtkTHdlcGZiNUl0UHhwK1h0VUFzdnpSK1VjelJR?=
 =?utf-8?B?dGVxSGloUkM0L0JhY09OaWVQVmxqR0hRTEZXTUZPSE9PRTBQaW4rNmt4TUR4?=
 =?utf-8?B?cU1wdXFNYVRRays0Q1F0Y2RMQ2ZXWjUxVjBuUUFuMnJqOGpxQVFOcCtnVmRv?=
 =?utf-8?B?N0NudExROTUreHEzYldGUEVJbVBiQVYxNFZQRFdYaSs2WGpwYlpGS2tlV3Y0?=
 =?utf-8?B?RUhHb2Y5Y2t2WnpkNTZLczQ5S1VSOEVQYzVPTFVUY1ZiOFBROVJzK0JZeDFw?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f5de79-9ee0-4936-6d3f-08db50659b7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 08:15:53.6418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZAS0Bdm5bK7Sg5S+2ZLW0ePvP+Lj8gTCGCjNrgnVkujEd8kE0de/iamfbMzNuHkUcQcHthgfu7O7n6m3t9KtWkHdr0HQWai1UdmXQg38Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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
Cc: Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 10:57:19AM +0300, Jani Nikula wrote:
>On Mon, 08 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Convert the REG_* macros from i915_reg_defs.h to use the new macros
>> defined in linux/bits.h. This is just to help on the implementation
>> of the new macros and not intended to be applied.
>
>This drops a number of build time input checks as well as casts to the
>specified types.

the explicit checks... but the checks are still there and the compiler
still gives me a warning or error for using invalid values. See test program in
the second patch. Example:

	static const u32 a2 = GENMASK_U32(32, 0);

	In file included from /tmp/genmask.c:2:                                                                                                                             
	include/linux/bits.h:47:19: warning: right shift count is negative [-Wshift-count-negative]                                                                         
	   47 |          (~U32(0) >> (32 - 1 - (h))))                                                                                                                       
	      |                   ^~                                                                                                                                        

It's a warning, not an error though.

Same warning for the other fixed-widths with numbers above the supported width.
For negative values:

	In file included from include/linux/bits.h:21,                                     
			 from /tmp/genmask.c:2:                                            
	include/linux/build_bug.h:16:51: error: negative width in bit-field ‘<anonymous>’  
	   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))     
	      |                                                   ^                        


The cast to the specified type we lose indeed. Could you give an example where
those are useful in the context they are used? I debated adding them, but couldn't find
a justified use of them.

Lucas De Marchi

>
>BR,
>Jani.
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 +++++-----------------------
>>  1 file changed, 5 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index 622d603080f9..61fbb8d62b25 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -17,10 +17,7 @@
>>   *
>>   * @return: Value with bit @__n set.
>>   */
>> -#define REG_BIT(__n)							\
>> -	((u32)(BIT(__n) +						\
>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
>> -				 ((__n) < 0 || (__n) > 31))))
>> +#define REG_BIT(__n) BIT_U32(__n)
>>
>>  /**
>>   * REG_BIT8() - Prepare a u8 bit value
>> @@ -30,10 +27,7 @@
>>   *
>>   * @return: Value with bit @__n set.
>>   */
>> -#define REG_BIT8(__n)                                                   \
>> -	((u8)(BIT(__n) +                                                \
>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
>> -				 ((__n) < 0 || (__n) > 7))))
>> +#define REG_BIT8(__n) BIT_U8(__n)
>>
>>  /**
>>   * REG_GENMASK() - Prepare a continuous u32 bitmask
>> @@ -44,11 +38,7 @@
>>   *
>>   * @return: Continuous bitmask from @__high to @__low, inclusive.
>>   */
>> -#define REG_GENMASK(__high, __low)					\
>> -	((u32)(GENMASK(__high, __low) +					\
>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&	\
>> -				 __is_constexpr(__low) &&		\
>> -				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
>> +#define REG_GENMASK(__high, __low) GENMASK_U32(__high, __low)
>>
>>  /**
>>   * REG_GENMASK64() - Prepare a continuous u64 bitmask
>> @@ -59,11 +49,7 @@
>>   *
>>   * @return: Continuous bitmask from @__high to @__low, inclusive.
>>   */
>> -#define REG_GENMASK64(__high, __low)					\
>> -	((u64)(GENMASK_ULL(__high, __low) +				\
>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&		\
>> -				 __is_constexpr(__low) &&		\
>> -				 ((__low) < 0 || (__high) > 63 || (__low) > (__high)))))
>> +#define REG_GENMASK64(__high, __low) GENMASK_ULL(__high, __low)
>>
>>  /**
>>   * REG_GENMASK8() - Prepare a continuous u8 bitmask
>> @@ -74,11 +60,7 @@
>>   *
>>   * @return: Continuous bitmask from @__high to @__low, inclusive.
>>   */
>> -#define REG_GENMASK8(__high, __low)                                     \
>> -	((u8)(GENMASK(__high, __low) +                                  \
>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
>> -				 __is_constexpr(__low) &&               \
>> -				 ((__low) < 0 || (__high) > 7 || (__low) > (__high)))))
>> +#define REG_GENMASK8(__high, __low) GENMASK_U8(__high, __low)
>>
>>  /*
>>   * Local integer constant expression version of is_power_of_2().
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
