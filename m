Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A97CA030
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 09:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083E10E11F;
	Mon, 16 Oct 2023 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F210E12B;
 Mon, 16 Oct 2023 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697440413; x=1728976413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lJeUCKVVO423Ot0lyn1tgA5pM+qnp5KriipCqHjbnQg=;
 b=jclejdD9dNR7usdAwE9+y+3hy+x2mSGikKlKpam1SxCDoCFXM8Fx1+yg
 Xeeo8K47YXzuErmnVcnXWvrHUUWWf61QTTV1eynNUknnDvcZyMfHLqFJ7
 fvtN9ZnJaiTwRrnA8uEk3q9uV5mjzoe+FBYlpXXAqecCDr8ycs0sqjdcy
 z3bQgR0AJrUo+8HrkUUlSZmbFF5I+GJeK7RiudaHT1DlpK1mEW415xXbn
 CgVZBDhZws/EwUpfror9snp0DDXeeWT0LEEXHFjTa7VS2DEj43nfcxtl4
 p6hCAD8V/XwpUeNxGmlIMOglEGDhO70/z3AftRzth5IYSLm03G5UVAQWR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382686249"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="382686249"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 00:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846295989"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="846295989"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 00:13:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:13:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 00:13:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 00:13:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxZKHBN2Ku1Wld+r29DNLWXcL3Rg7WnrEdfwBilrng8NHMYPcjdG2uCN/WLaiR+Hh7s9Zm+tqiAhRWSuWylDmSKynTeFdv8ItvZB6FFNkHN2zkN8HI4cFggkt8X/Y52ok7SiY5Q477pCgfaww1riaPxukrjN8DwmSq3uZTuQaL6n2Mkv9xmdLS/+iX8s+gaXus9W6A8Kf0Vb0VTHuRxUzdmzkCMOKLV9ZR68457/fDFZFGY4CxEL63qa3HsDUAoJwJE4evadnGpVhFxFq+BsT/RqB2Q5uHpCfgMVSZ1UZ8/0XwkQZf72M3M4gqXFwNb8zEXlMxBa+TabNf8V9x6H7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ykmpzp0nZqidnRZKZapekQ3CoziEkIrje8FNqtW3Aw=;
 b=aLf4QVvmZ5S4aGKC0+2eI98AgAmDQESbURXYeUR0ICAueUM6m5VTOFs+O9asEqhREjLypL15yqwtV0fV5W80ViHdEAGqZCoZx0/0IFwFv6ImckzxmO8AtyqzcR/HmdZfF+UfcWsZ85jvFq1b+IQ9UPHH00KiQuyVzrxX7H81z1EjU6ejzVBKQICslITtVNmaugep4CKFXLaP7gc8qCl/By9ZfD3p7lUAzZcBiL9v+hD5RJil5g5CGMydZMGQHcl7GEQyluNiKaUlx6ZBIS1w+6MiUv0jGoMb5IoWEFQNTpSJD67b1niw/isL/hE1St7KoShIsvp2Wgq48gFEE7J5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH0PR11MB5904.namprd11.prod.outlook.com (2603:10b6:510:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 07:12:59 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::ad61:1cc1:ea00:54e5]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::ad61:1cc1:ea00:54e5%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 07:12:58 +0000
Message-ID: <e0373b7e-b114-0d03-f6dc-f62c699f3578@intel.com>
Date: Mon, 16 Oct 2023 09:12:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
To: Daniel Vetter <daniel@ffwll.ch>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
 <ZSkg47slZ25rSQK4@intel.com> <ae8d62c9-ddfb-8913-6b67-681d9cf70978@intel.com>
 <ZSltNRk0vaPdSxI2@phenom.ffwll.local>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZSltNRk0vaPdSxI2@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0301CA0100.eurprd03.prod.outlook.com
 (2603:10a6:6:30::47) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH0PR11MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: d459d570-d024-4b96-2f26-08dbce17538e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMd8Klh5ZbXplgDaUSdJIB95agAWyphczXc5Ql2+M0pt+JpaOa6zOphSj542tXR5LvdhGhaWrPgJmn0MaOKPQTQLFDPb+UNIbRWQla/pprbVFhfuZynnsyQ0TFe6NvuhbHHDcNkiqaWWQUcrFOaqPsUsT3asiBhdR/FLIkI5TurXGCSuNsD8+l6VxUK3XMi5JnZ21BXP9xUBkkjVkVCQtm4tM+1CYQ/ofj+clRpbrwa8RPu6yp3LdpHu+9/gPhlKJY+WNnJ8vZxLrZez7WgEBgI9maHAudmW76FahXHIApmLkndsHjcjyVwphzk0Ikz2aPDuiBri35rfwc7UF+jnAOClLro6zaSzajvFGX1FEHoon20rtqvcR5cpuCQEdvHAaLJoc/BZFuFnNQz/CXINCtbFXr6Qi01eJNQ6G6fQ62leF5VE5QaIAnYDFFz1ZXbD2Z/XoI7zzwJ4RUtM67fmkQP2Iet8GK5vxTnCDPak2vGrG8z+aEkCfbrOjf79cH2i6h8+SC9PVvb0ESJsjgX7JiMxVpYxhjQvMHM4LamAvOT2Kde53W5kxupMzVjowE6wIjAf+/sPgvD8Fu8IFV/heL/y/t1LMznTWeLEofOcrmNmz9tsKHG1/kF+A2KjPCuJuG5b9zdJsrDTzx+nWNJtqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(316002)(6916009)(2616005)(66574015)(26005)(6506007)(53546011)(6666004)(6512007)(4326008)(8676002)(8936002)(5660300002)(2906002)(41300700001)(44832011)(31696002)(86362001)(36756003)(82960400001)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi9xek1CNFVNbUtSWGIxZ2diR1kyQXhIZG4zYkdMZkNXTFkyVTJyNUx4NWtY?=
 =?utf-8?B?a3Y4MEx6RHYzaUxDTlJVMjRaZVNTRkg4Z3Y5RzZSZHBlS3VYczNSOFZCVy9u?=
 =?utf-8?B?YTRIYng0MVh6amVsS3B4S0pKK0dJaWJ0bjhWZGJ5Rlc4Nm45ZHZoL0VQamV3?=
 =?utf-8?B?dW5CaklBbUJlcHc1NFJPK2Z0YmROKytNUXF1RmFKRXc4M3ZZTUF0WEFjNE9V?=
 =?utf-8?B?N3lQdWgvUXgzaEdqQk0yVzR1ZWN2UTRnYnFhNkR6eVQ2ME5QNWFTQm1BWGVz?=
 =?utf-8?B?Smp6SzBuR3hiZ1RwaUxTMTdwYnhlL0FrR3FvbkZyQWU4aFhmVXV0bHRvelNY?=
 =?utf-8?B?b0hQZFAwU2R2aWdERjMzRVp6WThGNks4NmN1WHFDdmhPa3A5ZWJYN3ptRjRt?=
 =?utf-8?B?dWU2eFZqRmZUckVkNjZHZkswSWx1c1F3NnB6bUp3Y2VhUmZpYXhyaExXODhP?=
 =?utf-8?B?STVXRlFuNjFBSlo1bVBWT1hFWXZ5djFrcG5HZkQrakVEUElySUFram9OUmU2?=
 =?utf-8?B?NXdWRDI1aHFQVEo5aEYweXRTYVQ2M0YzU2I0amN0Y1ViQkg2RXhyMkgrYzRK?=
 =?utf-8?B?Zkd0Vm5WZFE2VEJOM2JQcE1hWlJkdHl4NXJIcEZXUmxtNVJIWHJlTzhhZ3V6?=
 =?utf-8?B?c3Yva29oYlRlazNkUkRoRlJqMFhMSnhyTm9haHcvSCswb3Q4RkFaNy9abXhs?=
 =?utf-8?B?SUZ1Rit4RHV2TGRNL2lvTytaUkxsMTVyUnNCRFpXQjVoQW9kVnFTRDhwdE4z?=
 =?utf-8?B?OFVmcXB5V0R5VENQeTdJbDhaWlZlS0h5U1Y0RmJKckJUdDZWNWs2WFYvRkMy?=
 =?utf-8?B?WmVoRXI2RVpISkpSY2I3aHBSd3dJY1ZOWEtrUGl0Tm0vbXc1RzhiWGd5Snls?=
 =?utf-8?B?aGczRVZFNXlSWTdGbVFJak5ZNFQwQ2pCSEp1YmhqTFNrUkRGYVh2WGxXd0FT?=
 =?utf-8?B?TXBjenRZN29aYVhFUHFoKzI1MURvUHRZNHdsZEpoVFZsbERXUk1MYWxPU0JW?=
 =?utf-8?B?NnRJS2hNZVBUNUErOFRlWTgybTRZcFdHbEM3cTFOenJqbGxEaVN4a3h0VU8r?=
 =?utf-8?B?Zkcza1lQNHRod0tVVyt1cnFjYnVRckIrWGhlK01uSjNocTI5cHhwSWNkZldr?=
 =?utf-8?B?VFZUMTFxV3d1TlpocTREK2w1MXQ5L2t6SjM0cjlFTnR0dDBJQ2hya1A1ckhm?=
 =?utf-8?B?MExUUStMMWVpbnlPQXo3eC9MUkg4WDdxdjgyZlJzRXdLZEhhNk9FSURiSm8x?=
 =?utf-8?B?czlQUlphaHFQeUErNGxmV242cHNsL1FKTEJPUVZHdWk1bmNpZ0haMXJoNEFn?=
 =?utf-8?B?Z1RnaFUzVWQ5K1dTeG1FL2VhOEVNMjVLOGhOYmUzUWVZa3RMSHV4ejJZdWg0?=
 =?utf-8?B?M2RnUlRHaCtBUFJMYzl2WHNCVXVlck10R3FCL0pheEhha3hrVWJKTCtwK3JK?=
 =?utf-8?B?dXFLK2oxSE5FZVlOa25naTViMUdCOE5YNHYwV3BqOUVBajFpMy9oM01uRHgx?=
 =?utf-8?B?MTBISEdjVmJ2L2RiMFNCYTBnWDR6UVFaSVBTRE9NSTFRZ2RkV0J1ZGVVZjY5?=
 =?utf-8?B?TjB4akFSamp2d1pOeHNKUGFONnNkOEZ0OGtUSjhxcWlNTkVEWDRhMDRESDdE?=
 =?utf-8?B?ZlY2OUdmWExUN3A1UTFhR0FWMkZZOVFHOWszRXNvc1Jhc2ZuQ1d5UFVicHJw?=
 =?utf-8?B?NlBSZ1YzRHpmSGtNYXlOTmFiY2VxUlVqWHpZWHBSZkpqV0ZGZUNGRkNMaTVT?=
 =?utf-8?B?Wm1rZTJYdDdEay9wdFh0amRUaFUvNVdkckZuc1FGTjNvQjg0Vk9JMVZMYVM3?=
 =?utf-8?B?YUpvVlkvanYwa0R2ajlNeGRKazZLZ2kxOEg3NTNacUhBeHJUdnBucEhjTzZY?=
 =?utf-8?B?V3JRQ3cybTM4UFJwc1FvZnVOOEN0SFp3WHF4Z25GdC9BemVqWW1HUndXRDRJ?=
 =?utf-8?B?VW1qWmd5NVRVbnNjMFgwZ2QyVGxNZjJMOXBaTUVBUjZpRHR1bzZXSTNSeVdv?=
 =?utf-8?B?NTNsa01oVlhEYncyNUhubFNOMWR0Lzc3b3RqSnQwMXdxQTcyM2JIakt2dTNu?=
 =?utf-8?B?cjdsMHNjMjlaSlRIM3RvY2tmTWl0cmFzSEJHdUUrQVJPeGo3NEhRcXJzTUcv?=
 =?utf-8?Q?B5ielGkfn+uRHR4ruF2hqq3Xt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d459d570-d024-4b96-2f26-08dbce17538e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 07:12:58.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEYACT2FY6GUfvun2sokz3N2xbkK6AI+P2txMA7fPRvf4KZJJOKe/gXTi5MPLPZOrj7hn6vA7X4qfClZ47pdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5904
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
Cc: Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt
 Roper <matthew.d.roper@intel.com>, John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/2023 6:15 PM, Daniel Vetter wrote:
> On Fri, Oct 13, 2023 at 02:28:21PM +0200, Nirmoy Das wrote:
>> Hi Ville,
>>
>> On 10/13/2023 12:50 PM, Ville Syrjälä wrote:
>>> On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
>>>> gen8_ggtt_invalidate() is only needed for limitted set of platforms
>>>> where GGTT is mapped as WC
>>> I know there is supposed to be some kind hw snooping of the ggtt
>>> pte writes to invalidate the tlb, but are we sure GFX_FLSH_CNTL
>>> has no other side effects we depend on?
>> I spent some time searching through the gfxspec. This GFX_FLSH_CNTL register
>> only seems to be for
>>
>> invalidating TLB for GUnit  and (from git log ) we started to do that to
>> enable WC based GGTT updates.
> Might be good to cite the relevant git commits in the commit message to
> make this clear.

Yes, I should. It took me a while to find it. Going to add that and 
resend the patch.


Thanks,

Nirmoy

> -Sima
>
>>
>> So if I am not missing anything obvious then this should be safe.
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>> otherwise this can cause unwanted
>>>> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
>>>> valid.
>>>>
>>>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: <stable@vger.kernel.org> # v6.2+
>>>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_ggtt.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> index 4d7d88b92632..c2858d434bce 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> @@ -197,13 +197,17 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>    static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>    {
>>>> +	struct drm_i915_private *i915 = ggtt->vm.i915;
>>>>    	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>>>    	/*
>>>>    	 * Note that as an uncached mmio write, this will flush the
>>>>    	 * WCB of the writes into the GGTT before it triggers the invalidate.
>>>> +	 *
>>>> +	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
>>>>    	 */
>>>> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>>>> +	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
>>>> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>>>>    }
>>>>    static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>> -- 
>>>> 2.41.0
