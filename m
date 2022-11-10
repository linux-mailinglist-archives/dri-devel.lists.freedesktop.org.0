Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FD62471B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34F910E14C;
	Thu, 10 Nov 2022 16:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AB410E002;
 Thu, 10 Nov 2022 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668097981; x=1699633981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q1xZA4dDm5ppcCI8U+sf8dZLHgBvGb4tsbpr+je4OT4=;
 b=fXac08qbU1Ebsz8HfWsOD8TficIgqjyuhkJWZzYltQXkEAuv4hIFQ/FU
 MbL7Iz2zKOlxFDSBNLbCBCP+OPTdv/F3M76ck0uLkc24errUVee0Q8Uir
 HnNsy696mFQx48bAyjahDVeti8aRfbM/dH+1yi2Sl3ukNrnktPHooeZ6J
 XUviP3ehOVcifWypAsJAW4DwwJIYFc++tYDSDIeHXY/tBgmIfItuyduts
 Ikey3FrELcvpz22NhLJ49yNemkn2qLXg842Yoq2KsWuM01z7PjPV/YXkB
 kqZXN3XO5NrtICyZvrCfbzDuUz11ezHd5GqiQDwrsplf16Vh5qYHJEggm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="375606932"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="375606932"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="631712112"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="631712112"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 10 Nov 2022 08:33:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:32:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 08:32:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 08:32:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtN7++14nXWiPhJAy54lZoYsDg2wu01s65w7AOQ63Y2cBNBuIT8k4GCQ30+MR49I1tmMPTAGtwmxj4D8d1l0qlHZMsnw8rGqDqRHRCLCuaN4oZiCFpLWwvIpGD1ouguTgsq35o32eGjP0mRnIkHwKqoZt9xt2OKGpXaU46yZqVDYe1lAKeTlO1oD3Z6EvDkc8B7KPIHT6Tqye1bwGMSKJ42Jj70QyzXVXgiwpYPy6LPWeHTRXSiYeajPGC9gKpS0wFPVE/zBXf9Un1sHXx+K3NhAyweWEzAnD35Br2i2hEKaxu3PuztAY9yDRlick9ZA+0ihW1WU8rghDfuLx4zk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvj5DEVrg5u33jVGqWl8rXVkDbebB5yTxY01fACdZfY=;
 b=DAoxx0FuKTIpJLsD6lB/xw9XdqG5pMtK8LOm8Hlcz6BmXHIzsfoqElzPXUgHhZfB80TdlLlRfgF3FBDSIbwaPD9x47En1ZuZAj4YpDZ8mfGlz9txZ2j9BddDkYXvkQ3Y5QmELEsrL0qyx9gXyeB8sMIZU/OMpwKj/JE2Xj0u983BUBfZ6jS9Y2zRlUTLiec/WLlxe6YJWTA1IunlHbNG9VdLfosg+aypbtz6imTj/BSgMS+YfmSppcwLoJ9nEP8TZt1NtYn+Pi/1MRCKTgzoo0nfhxWLZnC3eUtu8Qg/geM0fi/izbXDsdwaB8+akuikRLBBD+lq/54FMsjkIbq1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 16:32:57 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68%3]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 16:32:57 +0000
Date: Thu, 10 Nov 2022 08:32:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v6 05/20] drm/i915/vm_bind: Implement bind and unbind of
 object
Message-ID: <Y20nsKZSiOCReGyd@nvishwa1-DESK>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-6-niranjana.vishwanathapura@intel.com>
 <e3b3919a223f59ac5df18a8f13998ad8944c5041.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3b3919a223f59ac5df18a8f13998ad8944c5041.camel@intel.com>
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 083f7065-9d4f-40b0-1a3d-08dac3393979
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHRylnslIhdBcUWISOjbacNKYk1kCEQyiNiOpthfSrU8ELgbKnXR1E83J8dkxvux579cD/UWf1PPMtFSO642ZIF1nX8X9uOuVbvhhr4XhY2wiHCIerq4at1cHPLMvkCZS77Ti33p21HbaiwY37eUoyq0CV1n5Jn1dxtRORgJSx4ilORzT+P0VfZ33riAY2ZmGWExhtnBc45uyv9YyCAXgDvejTa/NPvpUeRfEcBq/EKUz2hkQMbKbGR2eBDt+cXM6qW1usYiDCymmrwilnoU4eDZNCTenF5CA9ci7KwiEfI/q+pKCWkh0pXLWz2j8sTUIivtJr1gTfpcq1+hEB3/YrKBha82KAfwxfsu6vsqs7cvxy+oAW1igH7K8w72TU/l2JIIbE7iZOy/IsQTG8YgZAQ5ubBNkFPrCbPrNs2maral/asTVA5hTYDucY+cakQvF9zZ6JS7x3PjfuMWyzgZVL7NrzoyGwBLpRZl6mye0Z4UfDfvuHoW37zSNTM6lMtIf6/gTYZtBgLGM2ztKCdOqF8qeg6ZCwmOHipid0XiVzoHOIJTGmf00FoSdI3mLzyeysfdzJ1kf0CRMJUC86QZSyePpvXS16J38O9M6iKXx2XOWNFYTMZTXvz7GkFM47Bbt+KYHP5iYo8k/EZvwAyjCEvkk6SKLYUfA3gmO9zCsFG1uxFg3FsVWkToBZRVMQa0hZ3YoaKE5vBSnoK19C4ttw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(86362001)(66556008)(6506007)(2906002)(44832011)(5660300002)(30864003)(186003)(9686003)(6512007)(26005)(83380400001)(82960400001)(38100700002)(8676002)(66946007)(66476007)(316002)(33716001)(8936002)(6636002)(6486002)(41300700001)(54906003)(6862004)(4326008)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vCtpDLgia6B3MohehdE0TeYBw5Ncozg/rVbvnwJc3+QPI5eR3c0+7mHTun?=
 =?iso-8859-1?Q?MIrtqrJ2VI1mfaP+lYcjc28hRSFy0PCVs8gTEWWOsp0RVhXmdt71dwJTtd?=
 =?iso-8859-1?Q?+Cg93vi/qv15/kGrnelrj+msbRb+EJG/vB+W4BkCS1t81ykxuUCk/dJaeV?=
 =?iso-8859-1?Q?U1JgNbDMYm4UNf2+Oy2X1Mwi/jKVAEdsAKDawSMTozLYeekynIYhaDGFsD?=
 =?iso-8859-1?Q?VhVgPka8640Dc10F+CR/bZqnuloLrEE3utZzxiMuqcSTqysLRoKCcIBmLi?=
 =?iso-8859-1?Q?WQJ6+cu/MwEbK1yIMTf4NmsOoY/KCLVmW1Rt+uBYl++imlQexVBJkd7imK?=
 =?iso-8859-1?Q?Rzn8DYbRFHxpvzPcc1/fjt8hPR1+BstISTcf3HyhWvTn+1IkHkJOi+jw1k?=
 =?iso-8859-1?Q?MqEEeBmaLVrux0QcxFmhoiMdn2f92tRoOdj5erzo7mJTW95yjaf2735cHZ?=
 =?iso-8859-1?Q?hNMrs/aXlOgXwcBqbnoKh7vZqJ03GqjedOeX3iIt0qmTJA7LTQIjyGKv1b?=
 =?iso-8859-1?Q?k03HT5UY85lVhsCcvFdpBgV6Dh1CBWPlV3OMvepMpCKkXskv/w48EgqSKi?=
 =?iso-8859-1?Q?eBEBluJ2x/rKSGRmVDMG9rn/WvNr3WQGueGHeSlvhzmRAdnwKs+Zb2D1Oi?=
 =?iso-8859-1?Q?cqwOvVfHbWQyOuXPi/NW3vWbLEgBxI2V8ZF1d/UaMBmRvZhMfZr5TknRyS?=
 =?iso-8859-1?Q?nJAJYdm5tm66fHWKc/WNWztNQp1Npd9zWaslUlQctCeBK9quXWjgGKr9xf?=
 =?iso-8859-1?Q?LFP1wCS0/BbcBecK8PewYYtYzBrRPa2WIvOuow4amYNbbxxBEda3BT1lf9?=
 =?iso-8859-1?Q?Z5E9u4nz2NsTzwJf0amBrngJFcw98jb2SM00wTE3y2etwytw14Yc+dUPDm?=
 =?iso-8859-1?Q?NeyOyRz9qcyhUOVtcd0+RkrQm6aJuRgcVcoclQQJi3ngnfPTXTCjCL2ABb?=
 =?iso-8859-1?Q?euXyUP2csYDXp1BwvYfPyO/XqRu1b31+wm4fIrNpCyGUFAqMESga0sUAQf?=
 =?iso-8859-1?Q?SKw4p9r3zbvrxfa4wqIzTnLkrz+BoHHa+65xegvIfoVAFH2qsC6ak0S8fa?=
 =?iso-8859-1?Q?cbAXPi/K3WeOAd/om885YyJzJ7Yh5z+3X26WKhwa8vuQs2TBeHTjmGVKV1?=
 =?iso-8859-1?Q?NwZeuDDzxDGvqmsH26YPbX+/3m7l0zNus2CAnMMG9fG5dVnGdGEk7t6ZJ3?=
 =?iso-8859-1?Q?AmxsZ3Bf7jR029ajyPHSq8hKmTuFgWiG7i2LhFr4bPgwwh9wxcWUgGbdYX?=
 =?iso-8859-1?Q?PCRInEsZ/j9rw3oj6nP17cFy7HgNomHLMOusCodsK6CPyroT/eXrAvSo1+?=
 =?iso-8859-1?Q?YxQ/JIh6RfBaE5yiV4QsblLBSeeoOBhO0916a5+R1QhuiGLf/09JkgaKLg?=
 =?iso-8859-1?Q?HhdDRz++OU66SjHJd8kzfKdPaKL9IEaq/Gr6mkEgFqqReGMVNUKNJ6zW3C?=
 =?iso-8859-1?Q?MhpxfDMVWLVaP1UgqPT9UkOmnEYgBQrTHRdDnh4BYM0CTg9ohcsvwoZ1wC?=
 =?iso-8859-1?Q?o2CjltVxo4AhzrYEFamMHNPYtcd5s87khgktXjy7nFI7yk5HdT961JN1UG?=
 =?iso-8859-1?Q?+YeGb6O+BAn27lCiOUovQJXX4A/dMKSOTeThNzQVO0rlJ843h5q2dmtJ5m?=
 =?iso-8859-1?Q?wdwTkG+aDYZ+zK2VnYknyMrDI9yO7L5Znmye5xw+agQE6bGiK+U/74q1MY?=
 =?iso-8859-1?Q?pGoPz6IFMyAB3LgB8I0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 083f7065-9d4f-40b0-1a3d-08dac3393979
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 16:32:57.2398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Zqs4dq2BE4mCs4o/iCyUublz5z51tHauD5K6DoxeM2sECtI3vKqxjEWv1oyN/ndedbhO7dSDINiVQBOGCo7pKN1Q2uTATR50JboSN2JyAblQdtg9pgNH7GIsO+CGGuf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 05:28:59PM -0800, Zanoni, Paulo R wrote:
>On Mon, 2022-11-07 at 00:51 -0800, Niranjana Vishwanathapura wrote:
>> Add uapi and implement support for bind and unbind of an
>> object at the specified GPU virtual addresses.
>>
>> The vm_bind mode is not supported in legacy execbuf2 ioctl.
>> It will be supported only in the newer execbuf3 ioctl.
>>
>> v2: On older platforms ctx->vm is not set, check for it.
>>     In vm_bind call, add vma to vm_bind_list.
>>     Add more input validity checks.
>>     Update some documentation.
>> v3: In vm_bind call, add vma to vm_bound_list as user can
>>     request a fence and pass to execbuf3 as input fence.
>>     Remove short term pinning with PIN_VALIDATE flag.
>> v4: Replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode().
>> v5: Ensure all reserved fields are 0, use PIN_NOEVICT.
>> v6: Add reserved fields to drm_i915_gem_vm_bind.
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  drivers/gpu/drm/i915/gem/i915_gem_context.h   |  15 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   5 +
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  26 ++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 324 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   3 +
>>  drivers/gpu/drm/i915/i915_vma.c               |   1 +
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
>>  include/uapi/drm/i915_drm.h                   |  99 ++++++
>>  11 files changed, 507 insertions(+)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 51704b54317c..b731f3ac80da 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -166,6 +166,7 @@ gem-y += \
>>  	gem/i915_gem_ttm_move.o \
>>  	gem/i915_gem_ttm_pm.o \
>>  	gem/i915_gem_userptr.o \
>> +	gem/i915_gem_vm_bind_object.o \
>>  	gem/i915_gem_wait.o \
>>  	gem/i915_gemfs.o
>>  i915-y += \
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
>> index 899fa8f1e0fe..e8b41aa8f8c4 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
>> @@ -139,6 +139,21 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
>>  int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
>>  				       struct drm_file *file);
>>  
>>
>>
>>
>> +/**
>> + * i915_gem_vm_is_vm_bind_mode() - Check if address space is in vm_bind mode
>> + * @vm: the address space
>> + *
>> + * Returns:
>> + * true: @vm is in vm_bind mode; allows only vm_bind method of binding.
>> + * false: @vm is not in vm_bind mode; allows only legacy execbuff method
>> + *        of binding.
>> + */
>> +static inline bool i915_gem_vm_is_vm_bind_mode(struct i915_address_space *vm)
>> +{
>> +	/* No support to enable vm_bind mode yet */
>> +	return false;
>> +}
>> +
>>  struct i915_address_space *
>>  i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id);
>>  
>>
>>
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 1160723c9d2d..c5bc9f6e887f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -781,6 +781,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
>>  	if (unlikely(IS_ERR(ctx)))
>>  		return PTR_ERR(ctx);
>>  
>>
>>
>>
>> +	if (ctx->vm && i915_gem_vm_is_vm_bind_mode(ctx->vm)) {
>> +		i915_gem_context_put(ctx);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>>  	eb->gem_context = ctx;
>>  	if (i915_gem_context_has_full_ppgtt(ctx))
>>  		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> new file mode 100644
>> index 000000000000..36262a6357b5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#ifndef __I915_GEM_VM_BIND_H
>> +#define __I915_GEM_VM_BIND_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_device;
>> +struct drm_file;
>> +struct i915_address_space;
>> +struct i915_vma;
>> +
>> +struct i915_vma *
>> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>> +
>> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
>> +			   struct drm_file *file);
>> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>> +			     struct drm_file *file);
>> +
>> +void i915_gem_vm_unbind_all(struct i915_address_space *vm);
>> +
>> +#endif /* __I915_GEM_VM_BIND_H */
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> new file mode 100644
>> index 000000000000..6f299806bee1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> @@ -0,0 +1,324 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#include <uapi/drm/i915_drm.h>
>> +
>> +#include <linux/interval_tree_generic.h>
>> +
>> +#include "gem/i915_gem_context.h"
>> +#include "gem/i915_gem_vm_bind.h"
>> +
>> +#include "gt/intel_gpu_commands.h"
>> +
>> +#define START(node) ((node)->start)
>> +#define LAST(node) ((node)->last)
>> +
>> +/* Not all defined functions are used, hence use __maybe_unused */
>> +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
>> +		     START, LAST, __maybe_unused static inline, i915_vm_bind_it)
>> +
>> +#undef START
>> +#undef LAST
>> +
>> +/**
>> + * DOC: VM_BIND/UNBIND ioctls
>> + *
>> + * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
>> + * objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
>> + * specified address space (VM). Multiple mappings can map to the same physical
>> + * pages of an object (aliasing). These mappings (also referred to as persistent
>> + * mappings) will be persistent across multiple GPU submissions (execbuf calls)
>> + * issued by the UMD, without user having to provide a list of all required
>> + * mappings during each submission (as required by older execbuf mode).
>> + *
>> + * The VM_BIND/UNBIND calls allow UMDs to request a timeline out fence for
>> + * signaling the completion of bind/unbind operation.
>> + *
>> + * VM_BIND feature is advertised to user via I915_PARAM_VM_BIND_VERSION.
>> + * User has to opt-in for VM_BIND mode of binding for an address space (VM)
>> + * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
>> + *
>> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>> + * are not ordered. Furthermore, parts of the VM_BIND/UNBIND operations can be
>> + * done asynchronously, when valid out fence is specified.
>> + *
>> + * VM_BIND locking order is as below.
>> + *
>> + * 1) vm_bind_lock mutex will protect vm_bind lists. This lock is taken in
>> + *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
>> + *    mapping.
>> + *
>> + *    In future, when GPU page faults are supported, we can potentially use a
>> + *    rwsem instead, so that multiple page fault handlers can take the read
>> + *    side lock to lookup the mapping and hence can run in parallel.
>> + *    The older execbuf mode of binding do not need this lock.
>> + *
>> + * 2) The object's dma-resv lock will protect i915_vma state and needs
>> + *    to be held while binding/unbinding a vma in the async worker and while
>> + *    updating dma-resv fence list of an object. Note that private BOs of a VM
>> + *    will all share a dma-resv object.
>> + *
>> + * 3) Spinlock/s to protect some of the VM's lists like the list of
>> + *    invalidated vmas (due to eviction and userptr invalidation) etc.
>> + */
>> +
>> +/**
>> + * i915_gem_vm_bind_lookup_vma() - lookup for persistent vma mapped at a
>> + * specified address
>> + * @vm: virtual address space to look for persistent vma
>> + * @va: starting address where vma is mapped
>> + *
>> + * Retrieves the persistent vma mapped address @va from the @vm's vma tree.
>> + *
>> + * Returns vma pointer on success, NULL on failure.
>> + */
>> +struct i915_vma *
>> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
>> +{
>> +	lockdep_assert_held(&vm->vm_bind_lock);
>> +
>> +	return i915_vm_bind_it_iter_first(&vm->va, va, va);
>> +}
>> +
>> +static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>> +{
>> +	lockdep_assert_held(&vma->vm->vm_bind_lock);
>> +
>> +	list_del_init(&vma->vm_bind_link);
>> +	i915_vm_bind_it_remove(vma, &vma->vm->va);
>> +
>> +	/* Release object */
>> +	if (release_obj)
>> +		i915_gem_object_put(vma->obj);
>> +}
>> +
>> +static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>> +				  struct drm_i915_gem_vm_unbind *va)
>> +{
>> +	struct drm_i915_gem_object *obj;
>> +	struct i915_vma *vma;
>> +	int ret;
>> +
>> +	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	va->start = gen8_noncanonical_addr(va->start);
>> +	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>> +
>> +	if (!vma)
>> +		ret = -ENOENT;
>> +	else if (vma->size != va->length)
>> +		ret = -EINVAL;
>> +
>> +	if (ret) {
>> +		mutex_unlock(&vm->vm_bind_lock);
>> +		return ret;
>> +	}
>> +
>> +	i915_gem_vm_bind_remove(vma, false);
>> +
>> +	mutex_unlock(&vm->vm_bind_lock);
>> +
>> +	/*
>> +	 * Destroy the vma and then release the object.
>> +	 * As persistent vma holds object reference, it can only be destroyed
>> +	 * either by vm_unbind ioctl or when VM is being released. As we are
>> +	 * holding VM reference here, it is safe accessing the vma here.
>> +	 */
>> +	obj = vma->obj;
>> +	i915_gem_object_lock(obj, NULL);
>> +	i915_vma_destroy(vma);
>> +	i915_gem_object_unlock(obj);
>> +
>> +	i915_gem_object_put(obj);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * i915_gem_vm_unbind_all() - unbind all persistent mappings from an
>> + * address space
>> + * @vm: Address spece to remove persistent mappings from
>> + *
>> + * Unbind all userspace requested vm_bind mappings from @vm.
>> + */
>> +void i915_gem_vm_unbind_all(struct i915_address_space *vm)
>> +{
>> +	struct i915_vma *vma, *t;
>> +
>> +	mutex_lock(&vm->vm_bind_lock);
>> +	list_for_each_entry_safe(vma, t, &vm->vm_bind_list, vm_bind_link)
>> +		i915_gem_vm_bind_remove(vma, true);
>> +	list_for_each_entry_safe(vma, t, &vm->vm_bound_list, vm_bind_link)
>> +		i915_gem_vm_bind_remove(vma, true);
>> +	mutex_unlock(&vm->vm_bind_lock);
>> +}
>> +
>> +static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
>> +					struct drm_i915_gem_object *obj,
>> +					struct drm_i915_gem_vm_bind *va)
>> +{
>> +	struct i915_gtt_view view;
>> +	struct i915_vma *vma;
>> +
>> +	va->start = gen8_noncanonical_addr(va->start);
>> +	vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>> +	if (vma)
>> +		return ERR_PTR(-EEXIST);
>> +
>> +	view.type = I915_GTT_VIEW_PARTIAL;
>> +	view.partial.offset = va->offset >> PAGE_SHIFT;
>> +	view.partial.size = va->length >> PAGE_SHIFT;
>> +	vma = i915_vma_create_persistent(obj, vm, &view);
>> +	if (IS_ERR(vma))
>> +		return vma;
>> +
>> +	vma->start = va->start;
>> +	vma->last = va->start + va->length - 1;
>> +
>> +	return vma;
>> +}
>> +
>> +static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>> +				struct drm_i915_gem_vm_bind *va,
>> +				struct drm_file *file)
>> +{
>> +	struct drm_i915_gem_object *obj;
>> +	struct i915_vma *vma = NULL;
>> +	struct i915_gem_ww_ctx ww;
>> +	u64 pin_flags;
>> +	int ret = 0;
>> +
>> +	if (!i915_gem_vm_is_vm_bind_mode(vm))
>> +		return -EOPNOTSUPP;
>> +
>> +	/* Ensure start and length fields are valid */
>> +	if (!va->length || !IS_ALIGNED(va->start, I915_GTT_PAGE_SIZE))
>> +		ret = -EINVAL;
>> +
>> +	obj = i915_gem_object_lookup(file, va->handle);
>> +	if (!obj)
>> +		return -ENOENT;
>> +
>> +	/* Ensure offset and length are aligned to object's max page size */
>> +	if (!IS_ALIGNED(va->offset | va->length,
>> +			i915_gem_object_max_page_size(obj->mm.placements,
>> +						      obj->mm.n_placements)))
>> +		ret = -EINVAL;
>> +
>> +	/* Check for mapping range overflow */
>> +	if (range_overflows_t(u64, va->offset, va->length, obj->base.size))
>> +		ret = -EINVAL;
>> +
>> +	if (ret)
>> +		goto put_obj;
>> +
>> +	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
>> +	if (ret)
>> +		goto put_obj;
>> +
>> +	vma = vm_bind_get_vma(vm, obj, va);
>> +	if (IS_ERR(vma)) {
>> +		ret = PTR_ERR(vma);
>> +		goto unlock_vm;
>> +	}
>> +
>> +	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER |
>> +		    PIN_VALIDATE | PIN_NOEVICT;
>> +
>> +	for_i915_gem_ww(&ww, ret, true) {
>> +		ret = i915_gem_object_lock(vma->obj, &ww);
>> +		if (ret)
>> +			continue;
>> +
>> +		ret = i915_vma_pin_ww(vma, &ww, 0, 0, pin_flags);
>> +		if (ret)
>> +			continue;
>> +
>> +		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>> +		i915_vm_bind_it_insert(vma, &vm->va);
>> +
>> +		/* Hold object reference until vm_unbind */
>> +		i915_gem_object_get(vma->obj);
>> +	}
>> +
>> +	if (ret)
>> +		i915_vma_destroy(vma);
>> +unlock_vm:
>> +	mutex_unlock(&vm->vm_bind_lock);
>> +put_obj:
>> +	i915_gem_object_put(obj);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * i915_gem_vm_bind_ioctl() - ioctl function for binding a section of object
>> + * at a specified virtual address
>> + * @dev: drm_device pointer
>> + * @data: ioctl data structure
>> + * @file: drm_file pointer
>> + *
>> + * Adds the specified persistent mapping (virtual address to a section of an
>> + * object) and binds it in the device page table.
>> + *
>> + * Returns 0 on success, error code on failure.
>> + */
>> +int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
>> +			   struct drm_file *file)
>> +{
>> +	struct drm_i915_gem_vm_bind *args = data;
>> +	struct i915_address_space *vm;
>> +	int ret;
>> +
>> +	/* Reserved fields must be 0 */
>> +	if (args->rsvd[0] || args->rsvd[1] || args->rsvd[2] || args->extensions)
>> +		return -EINVAL;
>> +
>> +	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>> +	if (unlikely(!vm))
>> +		return -ENOENT;
>> +
>> +	ret = i915_gem_vm_bind_obj(vm, args, file);
>> +
>> +	i915_vm_put(vm);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * i915_gem_vm_unbind_ioctl() - ioctl function for unbinding a mapping at a
>> + * specified virtual address
>> + * @dev: drm_device pointer
>> + * @data: ioctl data structure
>> + * @file: drm_file pointer
>> + *
>> + * Removes the persistent mapping at the specified address and unbinds it
>> + * from the device page table.
>> + *
>> + * Returns 0 on success, error code on failure. -ENOENT is returned if the
>> + * specified mapping is not found.
>> + */
>> +int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>> +			     struct drm_file *file)
>> +{
>> +	struct drm_i915_gem_vm_unbind *args = data;
>> +	struct i915_address_space *vm;
>> +	int ret;
>> +
>> +	/* Reserved fields must be 0 */
>> +	if (args->rsvd || args->rsvd2[0] || args->rsvd2[1] ||
>> +	    args->rsvd2[2] || args->extensions)
>> +		return -EINVAL;
>> +
>> +	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
>> +	if (unlikely(!vm))
>> +		return -ENOENT;
>> +
>> +	ret = i915_gem_vm_unbind_vma(vm, args);
>> +
>> +	i915_vm_put(vm);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index e82a9d763e57..412368c67c46 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -12,6 +12,7 @@
>>  
>>
>>
>>
>>  #include "gem/i915_gem_internal.h"
>>  #include "gem/i915_gem_lmem.h"
>> +#include "gem/i915_gem_vm_bind.h"
>>  #include "i915_trace.h"
>>  #include "i915_utils.h"
>>  #include "intel_gt.h"
>> @@ -177,6 +178,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>>  void i915_address_space_fini(struct i915_address_space *vm)
>>  {
>>  	drm_mm_takedown(&vm->mm);
>> +	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>> +	mutex_destroy(&vm->vm_bind_lock);
>>  }
>>  
>>
>>
>>
>>  /**
>> @@ -203,6 +206,8 @@ static void __i915_vm_release(struct work_struct *work)
>>  	struct i915_address_space *vm =
>>  		container_of(work, struct i915_address_space, release_work);
>>  
>>
>>
>>
>> +	i915_gem_vm_unbind_all(vm);
>> +
>>  	__i915_vm_close(vm);
>>  
>>
>>
>>
>>  	/* Synchronize async unbinds. */
>> @@ -279,6 +284,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>>  
>>
>>
>>
>>  	INIT_LIST_HEAD(&vm->bound_list);
>>  	INIT_LIST_HEAD(&vm->unbound_list);
>> +
>> +	vm->va = RB_ROOT_CACHED;
>> +	INIT_LIST_HEAD(&vm->vm_bind_list);
>> +	INIT_LIST_HEAD(&vm->vm_bound_list);
>> +	mutex_init(&vm->vm_bind_lock);
>>  }
>>  
>>
>>
>>
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 4d75ba4bb41d..3a9bee1b9d03 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -260,6 +260,15 @@ struct i915_address_space {
>>  	 */
>>  	struct list_head unbound_list;
>>  
>>
>>
>>
>> +	/** @vm_bind_lock: Mutex to protect @vm_bind_list and @vm_bound_list */
>> +	struct mutex vm_bind_lock;
>> +	/** @vm_bind_list: List of vm_binding in process */
>> +	struct list_head vm_bind_list;
>> +	/** @vm_bound_list: List of vm_binding completed */
>> +	struct list_head vm_bound_list;
>> +	/** @va: tree of persistent vmas */
>> +	struct rb_root_cached va;
>> +
>>  	/* Global GTT */
>>  	bool is_ggtt:1;
>>  
>>
>>
>>
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index c3d43f9b1e45..cf41b96ac485 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -69,6 +69,7 @@
>>  #include "gem/i915_gem_ioctls.h"
>>  #include "gem/i915_gem_mman.h"
>>  #include "gem/i915_gem_pm.h"
>> +#include "gem/i915_gem_vm_bind.h"
>>  #include "gt/intel_gt.h"
>>  #include "gt/intel_gt_pm.h"
>>  #include "gt/intel_rc6.h"
>> @@ -1892,6 +1893,8 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl, DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_vm_create_ioctl, DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm_bind_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(I915_GEM_VM_UNBIND, i915_gem_vm_unbind_ioctl, DRM_RENDER_ALLOW),
>>  };
>>  
>>
>>
>>
>>  /*
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 529d97318f00..6a64a130dbcd 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -239,6 +239,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>  	spin_unlock(&obj->vma.lock);
>>  	mutex_unlock(&vm->mutex);
>>  
>>
>>
>>
>> +	INIT_LIST_HEAD(&vma->vm_bind_link);
>>  	return vma;
>>  
>>
>>
>>
>>  err_unlock:
>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>> index 3144d71a0c3e..db786d2d1530 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -295,6 +295,20 @@ struct i915_vma {
>>  	/** This object's place on the active/inactive lists */
>>  	struct list_head vm_link;
>>  
>>
>>
>>
>> +	/** @vm_bind_link: node for the vm_bind related lists of vm */
>> +	struct list_head vm_bind_link;
>> +
>> +	/** Interval tree structures for persistent vma */
>> +
>> +	/** @rb: node for the interval tree of vm for persistent vmas */
>> +	struct rb_node rb;
>> +	/** @start: start endpoint of the rb node */
>> +	u64 start;
>> +	/** @last: Last endpoint of the rb node */
>> +	u64 last;
>> +	/** @__subtree_last: last in subtree */
>> +	u64 __subtree_last;
>> +
>>  	struct list_head obj_link; /* Link in the object's VMA list */
>>  	struct rb_node obj_node;
>>  	struct hlist_node obj_hash;
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 8df261c5ab9b..f06a09f1db2d 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -470,6 +470,8 @@ typedef struct _drm_i915_sarea {
>>  #define DRM_I915_GEM_VM_CREATE		0x3a
>>  #define DRM_I915_GEM_VM_DESTROY		0x3b
>>  #define DRM_I915_GEM_CREATE_EXT		0x3c
>> +#define DRM_I915_GEM_VM_BIND		0x3d
>> +#define DRM_I915_GEM_VM_UNBIND		0x3e
>>  /* Must be kept compact -- no holes */
>>  
>>
>>
>>
>>  #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
>> @@ -534,6 +536,8 @@ typedef struct _drm_i915_sarea {
>>  #define DRM_IOCTL_I915_QUERY			DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
>>  #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
>>  #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
>> +#define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>> +#define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
>>  
>>
>>
>>
>>  /* Allow drivers to submit batchbuffers directly to hardware, relying
>>   * on the security mechanisms provided by hardware.
>> @@ -3727,6 +3731,101 @@ struct drm_i915_gem_create_ext_protected_content {
>>  /* ID of the protected content session managed by i915 when PXP is active */
>>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>  
>>
>>
>>
>> +/**
>> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>> + *
>> + * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
>> + * virtual address (VA) range to the section of an object that should be bound
>> + * in the device page table of the specified address space (VM).
>> + * The VA range specified must be unique (ie., not currently bound) and can
>> + * be mapped to whole object or a section of the object (partial binding).
>> + * Multiple VA mappings can be created to the same section of the object
>> + * (aliasing).
>> + *
>> + * The @start, @offset and @length must be 4K page aligned. However the DG2
>> + * and XEHPSDV has 64K page size for device local memory and has compact page
>> + * table. On those platforms, for binding device local-memory objects, the
>> + * @start, @offset and @length must be 64K aligned.
>> + *
>> + * Error code -EINVAL will be returned if @start, @offset and @length are not
>> + * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
>> + * -ENOSPC will be returned if the VA range specified can't be reserved.
>> + *
>> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>> + * are not ordered. Furthermore, parts of the VM_BIND operation can be done
>> + * asynchronously, if valid @fence is specified.
>> + */
>> +struct drm_i915_gem_vm_bind {
>> +	/** @vm_id: VM (address space) id to bind */
>> +	__u32 vm_id;
>> +
>> +	/** @handle: Object handle */
>> +	__u32 handle;
>> +
>> +	/** @start: Virtual Address start to bind */
>> +	__u64 start;
>> +
>> +	/** @offset: Offset in object to bind */
>> +	__u64 offset;
>> +
>> +	/** @length: Length of mapping to bind */
>> +	__u64 length;
>> +
>> +	/** @rsvd: Reserved, MBZ */
>> +	__u64 rsvd[3];
>
>In a brand new ioctl with even extensions support, why do we need this?
>If we have a plan to add something here in the future, can you please
>tell us what it may be? Perhaps having that field already but accepting
>only a default value/flag would be better.
>

1 quad word is for flags and other 2 are reseved. I had the flag defined
previously, but changed it to reserved based on review comments.
Yes, we have extension, but I think it is OK to have some reserved fields
(I see other examples here). There are some future expansion plans (like
PAT setting support etc) anyhow. Is that fine?

>I see in previous versions we had 'flags' here. Having 'flags', even if
>MBZ for the initial version, seems like a nice thing to have for future
>extensibility. Also, you're going to add back the flag to make the page
>read-only at some point, right?

Yah, I can separte out the flags here and in vm_unbind. Matt, hope that is
fine.

>
>> +
>> +	/** @rsvd2: Reserved for timeline fence */
>> +	__u64 rsvd2[2];
>
>I see this one gets changed in the middle of the series.
>

Yah we reserve it for timeline fence here in this patch,
timeline fence support is added in a later patch in this series.

>> +
>> +	/**
>> +	 * @extensions: Zero-terminated chain of extensions.
>> +	 *
>> +	 * For future extensions. See struct i915_user_extension.
>> +	 */
>> +	__u64 extensions;
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>> + *
>> + * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
>> + * address (VA) range that should be unbound from the device page table of the
>> + * specified address space (VM). VM_UNBIND will force unbind the specified
>> + * range from device page table without waiting for any GPU job to complete.
>> + * It is UMDs responsibility to ensure the mapping is no longer in use before
>> + * calling VM_UNBIND.
>> + *
>> + * If the specified mapping is not found, the ioctl will simply return without
>> + * any error.
>> + *
>> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>> + * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
>> + * asynchronously, if valid @fence is specified.
>
>What @fence? There's no way to specify one.
>

Yah, will remove "if valid @fence is specified".

>> + */
>> +struct drm_i915_gem_vm_unbind {
>> +	/** @vm_id: VM (address space) id to bind */
>> +	__u32 vm_id;
>> +
>> +	/** @rsvd: Reserved, MBZ */
>> +	__u32 rsvd;
>
>Again here, same question. Perhaps we could name it 'pad' or 'pad0' if
>that's the specific goal of having this?
>

Yah, pad is appropriate here.

>> +
>> +	/** @start: Virtual Address start to unbind */
>> +	__u64 start;
>> +
>> +	/** @length: Length of mapping to unbind */
>> +	__u64 length;
>> +
>> +	/** @rsvd2: Reserved, MBZ */
>> +	__u64 rsvd2[3];
>
>And here, but this is definitely not just padding.
>

It is for 'flags' and 'timeline fence' in case we need them later on.

Niranjana

>> +
>> +	/**
>> +	 * @extensions: Zero-terminated chain of extensions.
>> +	 *
>> +	 * For future extensions. See struct i915_user_extension.
>> +	 */
>> +	__u64 extensions;
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>
