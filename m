Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2E63CBC9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 00:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E0F10E27E;
	Tue, 29 Nov 2022 23:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD0310E069;
 Tue, 29 Nov 2022 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669764412; x=1701300412;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NdDoDtDhSgt8S4kyhP7Td2TeRvtbV0++Jal0BfhWNYc=;
 b=l0pWfeEs5X3etfXLwm/Zq6oNQPF/8Kggt/+YyeFWG+wD1M/acT7vi1BO
 bAlOpWmu23VwKMNqTOg6ShTf5IdybcSvd5NE0UMONv5jJt4Ez1mCk5g4l
 RcM5n0uCYdLRkqZ/IpPTNsJJ8qqOorugcsXGSeNDdsrjGL1IY0psfAeh6
 a4tF4Nfhejf7gIVwTLqRicLSsKyksn9HG8gNYh5nAx1zrBZvYJSjMkpAp
 ui2enhPmI/5cfeSpx5XOhmeVm5NVcV61AEOPbs3NM8AO1iz4kXhilRxHI
 KytkMSYpC9PaFFEMzjPpU6A3XMoue4RVs3vXNtgLIe1SfEGfH/sAp5mmZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="298621181"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="298621181"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 15:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="707420762"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="707420762"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2022 15:26:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 15:26:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 15:26:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 15:26:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ0hbC80HmuSB6QUaINu28ZnkwS0HjY0tZeh2p3oWY5ZtwHGw/NHTZ0Ryf+XqH7oav64phvioxSEU/bUZzpRRIbJhTXl99DJUyItwXl0GWHnWJQyC8vL18t/JBvlV7pWJ0dZN1TFf1bRnFTxZmmjga8sRvs6pVp91zw613bKRYEh5FhtZVy0z4ZV3ZIf5/dWKu+cX1r8gWnVB1XOYPIFksT3cbROf4iic2i5Loi9NKxZ4rac0JqTHgpnojnZ78ob78oLQ1Br7L5pb0blNwu+Yj1y9lu53TceAHYzhmPUINNqtk4LUjBKQCBpD77MkCzk0q/WtigZmWaZwYE7QFlpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg1plpV6VS5UgZx/rxWhpjQ178xtlECIQqYMlAt2Zq4=;
 b=ao8Pjiu7H6MvKJSJllT6wuQUyQPpYDZ+3jxddya1Kaer/VQ0eESa72rosOPalaru6ojpotcCJZwuDTz9Qny2Wbznh4BCIpsfvBd7a6BMNx6WBnkrHkuiHw4ppCdeTbI19ggovkqstc1y7nLAkc9hG5JCuhPOeYmirFUPHuFIqG1dk7hi02bmLdY3aItpaB5PWWXxD5zfAWi47wuneJzmQOlzBjZQtJ5UI96neyLekdyS4CxuiYrD/KOK116giI/bnkzsU+o7+IZACpvYfTjNg15zDJ//UKEEXG0Uwsq+g21AkLr763VK2jLEVLscVXf6vcapXcF35yuqUC0fFYZkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5494.namprd11.prod.outlook.com (2603:10b6:208:31d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 23:26:43 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 23:26:43 +0000
Date: Tue, 29 Nov 2022 15:26:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y4aVKskHxdNWSC4I@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
 <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
 <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
 <Y3O/a/sF21wC3EdE@nvishwa1-DESK> <Y3Qdd2aW4AHHDgq3@nvishwa1-DESK>
 <Y3QwtyKJKCKMBvjb@nvishwa1-DESK>
 <dc5a13ce-373c-995b-42a7-4b8f658e7990@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc5a13ce-373c-995b-42a7-4b8f658e7990@intel.com>
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd1e779-7f35-432e-d614-08dad2612c91
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sj/ZfNTWsvPXvDkGwQugBln08QxxZAFxTwwzHghh1PkERnG+XY3E38HdmU5Ey0ju6hK6igM4VdVXL+bAoeyzXcN13TlGLSXd6AYNCO+b0Hs+CIyliKdaEpO3qmb+KU1be1I1tfrc3jt7zmqvUmJt93f0OrI4JglgVWKIiWQIvM/AWOTF2eUmcLwlEDHaYfNefMrsUTSCEyUCGtPcSjOQ2OPnQ/xKK5sE5UizxmCffLzxaAwyAgHSlPAH17sSqbQkwsoXPkiz9U55ZrHT7D/MPsIeug1ngmhrdYZzVh9VWELBZfoMlQVDwVrW2/YrygnCsdT6GEJ6xCugXoe9jNfhtdwqCg605EDlTdOeT50pBpaedebgdqodafAjFQ3JIwUHRgqGR13YCY/8s9hF+lmjB7/OBf8F1+PsrIoZs10GB10CYBObTh8UtdPvm2zpIx/5XQzvon85o/z+lj6bCGVGIVAyxzhrWb86OQGBpRxlBHyKrroSprdEfHXV3FC/vnRNtEhuSk56SKgengMY9gsZLmn72O+J3y5CiJ6n9DtSteuKb7eYXg27dopvHmVVwSbP9FEjteufIE3j9I7cIWasy2IAJLnLrVHB+XoS0mIaGV0sTN/154dbLULafh9/sr4IfiJAwJX7cY4KQU7T89SDLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(5660300002)(82960400001)(44832011)(6636002)(6862004)(9686003)(6512007)(26005)(41300700001)(66556008)(66946007)(8676002)(66476007)(4326008)(38100700002)(33716001)(2906002)(8936002)(186003)(86362001)(316002)(6666004)(6506007)(6486002)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tlL8Uif4sLOZvvGye3FJ39+sywzk2a55XsJi+/Rg+rLVwCb1nkCOKX/hi9?=
 =?iso-8859-1?Q?aQrXhbbXWYIQbdasxFxN72WXhFNpM+b4R8St0Z36Te8d8oa7hg5FkRcAP9?=
 =?iso-8859-1?Q?0FTZfQ1PjToqD25I8vO0wkMO+uO3DNd8kVSurv6jt52/XdjUsg1pJb9Dbn?=
 =?iso-8859-1?Q?x7n1/YHkUPl/CGOpjsLnWIgRd7btgwt8PBxVr/wfPD+8a4XOnQC0HeZ/w6?=
 =?iso-8859-1?Q?OLLXFnd1aLM3bbnNcpAOUQYL4W7ZNmFU5YC14SSGg0fN663lzKDExK0bZo?=
 =?iso-8859-1?Q?LVj50xp/lr1V15X9ozVEM9N3LHiWswl2ocRwGLHyYed8a0hMxYbzLHetPn?=
 =?iso-8859-1?Q?QPVcLEaXiQw5OPr1a9oFSqvhbFViSTQWwHsOnERLNRfPe4AM3EMyiBREwF?=
 =?iso-8859-1?Q?4gVXf7NXL5LN6wNRhL+rkRfK5u4VIQGIxMfUFHdNq+yAdZyingnkODOj/4?=
 =?iso-8859-1?Q?fs8ubBd4dXUzJUpUlvKgWsxtwkbMJDeQhHgkVpweBALOzgFGUabkG5jGHq?=
 =?iso-8859-1?Q?3fZnF7Q/tdkeQaxin2e86RuzsPPGQ3NxaS2J8zT0WoMNGrKpvhJLlMfdY0?=
 =?iso-8859-1?Q?CkSlKGBCsAklb5hP0LQ6+hxxfOHDg/p70k5ZpZDahDRXyIMuYcrtSFHQwG?=
 =?iso-8859-1?Q?lN+HN4++NbRqGFVbahCY87moDlSbAbfBW+jHl9x47sA3YSAPlw6Z1l5XUL?=
 =?iso-8859-1?Q?7f8tKI4JEU8hD/v0R3cgQt8xxB/nLC+rOjmZGdKhmWP3KpXCH01tvvfZ72?=
 =?iso-8859-1?Q?mSo+iPJSyGD3Rq33TA9mTlBo4JhaShXk1UlvetIVGnZ99WobznPzr0kWyV?=
 =?iso-8859-1?Q?apr0MvSzjnGQa0+ldCjRYQc3faauWnCmiLN9VZh6u0Cw93mfY6xVoLdCx3?=
 =?iso-8859-1?Q?mpDji8RKXTAyO+qefXsfKvhfc9f+6pfIgpPVZGxQzLx+oLK90aPLqGvwCf?=
 =?iso-8859-1?Q?QvVEScvcQU9LP0VA2ueHWv6ALuyYUZ+JHi1r/hK+n2fbAKbhCe1VDy89dv?=
 =?iso-8859-1?Q?UZK8nxF7J15NiNxcKk6LU6Qxa20RGEZvN2b+vve0m0qqEf0dDof74jE2rU?=
 =?iso-8859-1?Q?SPXt0x7nKa/s+TmeqeU+ccqTqqX3W1lnD+1Cx8XumCKWsZGhq3h1RsjAPn?=
 =?iso-8859-1?Q?6uKYHemhf87OvAIFGEuSl6pSCZ371vXVa2CdMlsopTq9S/aNUvrbMccPYc?=
 =?iso-8859-1?Q?SgMHXt6V9bIMI8TLoL1tREUPMf5EVhGgp+vZA/TuiuctzjOopoc5IQ+jUX?=
 =?iso-8859-1?Q?ylqJQsA+o5T5vC74rt2ylr7xdUb4wlxwUhFlOwL0K5HyQjwiuPCgQp/vtx?=
 =?iso-8859-1?Q?V1j4ynhucp59XY1EfwpmwtzcK0E5i2xsSn3RpU4sRi4k0zmEBNxpEXDv9B?=
 =?iso-8859-1?Q?H8iOawmCckOqLKuRn+iw+4rPbxH6kKJ8ObAlqFeJL7TMNiLGD4WtRDXo6q?=
 =?iso-8859-1?Q?g91MR+f1OlM8CGZGGvdZEx3Fi0U3RoinG/0mO/W964k6OpIQCkDkIeDF2O?=
 =?iso-8859-1?Q?1oJKzDwr7Mb5323ZhqigbLEAo+OXEUKuEiCyNQc4BGIP3UxL2pTNqRTvNJ?=
 =?iso-8859-1?Q?dVKdUBygj0ul4CKuFE4eRqBsbg/sh1KdEeoZ4GZPX0Dn8pQfIH2oTiZT6j?=
 =?iso-8859-1?Q?r6+E3FZBfAluCrcYjbqss2kK/TOsWlWMwxoK/ZiyETIUQItjoxEKwicExb?=
 =?iso-8859-1?Q?3o8NAigJ+s7B8a7rOz4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd1e779-7f35-432e-d614-08dad2612c91
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 23:26:42.9011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWMYf7RezqtZy2vCCL3qz8W7qLLENnl3GhXrydgu1zYwuZPfUgtgPOUu1Okszq7v+vtFVqMkzJnl8/98yixwP9TD8gBZIvvhtWVumMwk5aT5YAXINJkycXtARSTKsWud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5494
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 11:42:58AM +0000, Matthew Auld wrote:
>On 16/11/2022 00:37, Niranjana Vishwanathapura wrote:
>>On Tue, Nov 15, 2022 at 03:15:03PM -0800, Niranjana Vishwanathapura wrote:
>>>On Tue, Nov 15, 2022 at 08:33:47AM -0800, Niranjana 
>>>Vishwanathapura wrote:
>>>>On Tue, Nov 15, 2022 at 04:20:54PM +0000, Matthew Auld wrote:
>>>>>On 15/11/2022 16:15, Niranjana Vishwanathapura wrote:
>>>>>>On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>>>>>>>On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>>>>>>>Asynchronously unbind the vma upon vm_unbind call.
>>>>>>>>Fall back to synchronous unbind if backend doesn't support
>>>>>>>>async unbind or if async unbind fails.
>>>>>>>>
>>>>>>>>No need for vm_unbind out fence support as i915 will internally
>>>>>>>>handle all sequencing and user need not try to sequence any
>>>>>>>>operation with the unbind completion.
>>>>>>>>
>>>>>>>>v2: use i915_vma_destroy_async in vm_unbind ioctl
>>>>>>>>
>>>>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>>>>><niranjana.vishwanathapura@intel.com>
>>>>>>>
>>>>>>>This only does it for non-partial vma, right? Or was that 
>>>>>>>changed somewhere?
>>>>>>>
>>>>>>
>>>>>>No, it applies to any vma (partial or non-partial).
>>>>>>It was so from the beginning.
>>>>>
>>>>>Doesn't __i915_vma_unbind_async() return an error when 
>>>>>mm.pages != vma->pages? IIRC this was discussed before. Just 
>>>>>trying to think about the consequences of this change.
>>>>
>>>>I am not seeing any such restriction. Let me probe and check if there
>>>>is any such restriction anywhere in the call chain.
>>>
>>>I checked and I am not seeing any restriction anywher in the call chain.
>>>
>>
>>Note that just like binding case, unbinding is also synchronous unless
>>there is a pending activity, in which case, it will be asynchronous.
>
>In __i915_vma_unbind_async() there is:
>
>if (i915_vma_is_pinned(vma) ||
>    &vma->obj->mm.rsgt->table != vma->resource->bi.pages)
>        return ERR_PTR(-EAGAIN);
>
>AFAICT we then also don't get any pipelined moves with such an object, 
>if there is such a binding present.

I had to remove this check as otherwise for VM_BIND (persistent) mappings,
it will alwasy be true and we will always endup with -EAGAIN.
Persistent mappings, as they support partial binding, can't have an sg
table which is just a pointer to object's sg table.

Niranjana

>
>>
>>Niranjana
>>
>>>Niranjana
>>>
>>>>
>>>>Niranjana
>>>>
>>>>>
>>>>>>
>>>>>>Niranjana
>>>>>>
>>>>>>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>
>>>>>>>>---
>>>>>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>>>>>> drivers/gpu/drm/i915/i915_vma.c               | 51 
>>>>>>>>+++++++++++++++++--
>>>>>>>> drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>>>>>>> include/uapi/drm/i915_drm.h                   |  3 +-
>>>>>>>> 4 files changed, 51 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>>diff --git 
>>>>>>>>a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>>>index d87d1210365b..36651b447966 100644
>>>>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>>>@@ -210,7 +210,7 @@ static int 
>>>>>>>>i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>>>>>>>      */
>>>>>>>>     obj = vma->obj;
>>>>>>>>     i915_gem_object_lock(obj, NULL);
>>>>>>>>-    i915_vma_destroy(vma);
>>>>>>>>+    i915_vma_destroy_async(vma);
>>>>>>>>     i915_gem_object_unlock(obj);
>>>>>>>>     i915_gem_object_put(obj);
>>>>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>>index 7cf77c67d755..483d25f2425c 100644
>>>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>>@@ -42,6 +42,8 @@
>>>>>>>> #include "i915_vma.h"
>>>>>>>> #include "i915_vma_resource.h"
>>>>>>>>+static struct dma_fence *__i915_vma_unbind_async(struct 
>>>>>>>>i915_vma *vma);
>>>>>>>>+
>>>>>>>> static inline void assert_vma_held_evict(const struct 
>>>>>>>>i915_vma *vma)
>>>>>>>> {
>>>>>>>>     /*
>>>>>>>>@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>>>>>>>     spin_unlock_irq(&gt->closed_lock);
>>>>>>>> }
>>>>>>>>-static void force_unbind(struct i915_vma *vma)
>>>>>>>>+static void force_unbind(struct i915_vma *vma, bool async)
>>>>>>>> {
>>>>>>>>     if (!drm_mm_node_allocated(&vma->node))
>>>>>>>>         return;
>>>>>>>>@@ -1727,7 +1729,21 @@ static void force_unbind(struct 
>>>>>>>>i915_vma *vma)
>>>>>>>>         i915_vma_set_purged(vma);
>>>>>>>>     atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>>>>>>>-    WARN_ON(__i915_vma_unbind(vma));
>>>>>>>>+    if (async) {
>>>>>>>>+        struct dma_fence *fence;
>>>>>>>>+
>>>>>>>>+        fence = __i915_vma_unbind_async(vma);
>>>>>>>>+        if (IS_ERR_OR_NULL(fence)) {
>>>>>>>>+            async = false;
>>>>>>>>+        } else {
>>>>>>>>+            dma_resv_add_fence(vma->obj->base.resv, fence,
>>>>>>>>+                       DMA_RESV_USAGE_READ);
>>>>>>>>+            dma_fence_put(fence);
>>>>>>>>+        }
>>>>>>>>+    }
>>>>>>>>+
>>>>>>>>+    if (!async)
>>>>>>>>+        WARN_ON(__i915_vma_unbind(vma));
>>>>>>>>     GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>>>>>>> }
>>>>>>>>@@ -1787,7 +1803,7 @@ void 
>>>>>>>>i915_vma_destroy_locked(struct i915_vma *vma)
>>>>>>>> {
>>>>>>>>     lockdep_assert_held(&vma->vm->mutex);
>>>>>>>>-    force_unbind(vma);
>>>>>>>>+    force_unbind(vma, false);
>>>>>>>>     list_del_init(&vma->vm_link);
>>>>>>>>     release_references(vma, vma->vm->gt, false);
>>>>>>>> }
>>>>>>>>@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>>>>>>>     bool vm_ddestroy;
>>>>>>>>     mutex_lock(&vma->vm->mutex);
>>>>>>>>-    force_unbind(vma);
>>>>>>>>+    force_unbind(vma, false);
>>>>>>>>+    list_del_init(&vma->vm_link);
>>>>>>>>+    vm_ddestroy = vma->vm_ddestroy;
>>>>>>>>+    vma->vm_ddestroy = false;
>>>>>>>>+
>>>>>>>>+    /* vma->vm may be freed when releasing vma->vm->mutex. */
>>>>>>>>+    gt = vma->vm->gt;
>>>>>>>>+    mutex_unlock(&vma->vm->mutex);
>>>>>>>>+    release_references(vma, gt, vm_ddestroy);
>>>>>>>>+}
>>>>>>>>+
>>>>>>>>+void i915_vma_destroy_async(struct i915_vma *vma)
>>>>>>>>+{
>>>>>>>>+    bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>>>>>>>+    struct intel_gt *gt;
>>>>>>>>+
>>>>>>>>+    if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>>>>>>>+        async = false;
>>>>>>>>+
>>>>>>>>+    mutex_lock(&vma->vm->mutex);
>>>>>>>>+    /*
>>>>>>>>+     * Ensure any asynchronous binding is complete while using
>>>>>>>>+     * async unbind as we will be releasing the vma here.
>>>>>>>>+     */
>>>>>>>>+    if (async && i915_active_wait(&vma->active))
>>>>>>>>+        async = false;
>>>>>>>>+
>>>>>>>>+    force_unbind(vma, async);
>>>>>>>>     list_del_init(&vma->vm_link);
>>>>>>>>     vm_ddestroy = vma->vm_ddestroy;
>>>>>>>>     vma->vm_ddestroy = false;
>>>>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>>>>>b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>>>index 737ef310d046..25f15965dab8 100644
>>>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>>>@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>>>>>>> void i915_vma_destroy_locked(struct i915_vma *vma);
>>>>>>>> void i915_vma_destroy(struct i915_vma *vma);
>>>>>>>>+void i915_vma_destroy_async(struct i915_vma *vma);
>>>>>>>> #define assert_vma_held(vma) 
>>>>>>>>dma_resv_assert_held((vma)->obj->base.resv)
>>>>>>>>diff --git a/include/uapi/drm/i915_drm.h 
>>>>>>>>b/include/uapi/drm/i915_drm.h
>>>>>>>>index e5600f358a15..431d40bb1dee 100644
>>>>>>>>--- a/include/uapi/drm/i915_drm.h
>>>>>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>>>>>@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>>>>>>>  * any error.
>>>>>>>>  *
>>>>>>>>  * VM_BIND/UNBIND ioctl calls executed on different CPU 
>>>>>>>>threads concurrently
>>>>>>>>- * are not ordered.
>>>>>>>>+ * are not ordered. Furthermore, parts of the VM_UNBIND 
>>>>>>>>operation can be done
>>>>>>>>+ * asynchronously.
>>>>>>>>  */
>>>>>>>> struct drm_i915_gem_vm_unbind {
>>>>>>>>     /** @vm_id: VM (address space) id to bind */
