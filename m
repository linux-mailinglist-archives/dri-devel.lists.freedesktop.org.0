Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA162B01B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 01:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F21D10E0F9;
	Wed, 16 Nov 2022 00:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4510E0F9;
 Wed, 16 Nov 2022 00:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668559039; x=1700095039;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8z+BfachCN/DdiCuv0tjgHpSgDL6MkhU6rE0jpE4avw=;
 b=ZRME4T4nN3Rie/yL2PukVL9aUlymGcMA8gTd/BS+zDEx96fUKNchrmdU
 VtfM/7Z3r65ORlJtN22V8cfzHVMYGeSblftjk8JNcOVGNRqF1fj49zLKM
 95Akera1f3ArbSFCwi3Cys+WD3DgA649sBmufB88s6pCAN8LILaeRJElp
 SRnQlhPr/PAWzhCDUz7qh/KyL1YWVTLNRgXgmqv3hmUbR6XdqvVMfyV1w
 vzl7aKmWn5baigV/i+bs5i5eGY/ZNAfE9EwCKR0FDsvWaPYzxw6OuD4ha
 TpkRiCv3J4dpuFegUdoaFrJgneUn7EAORIol7kIsBxv5XJ2m5oZos2at3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="299934211"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="299934211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 16:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="641419637"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="641419637"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2022 16:37:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 16:37:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 16:37:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 16:37:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 16:37:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbTddw+hvrff6sSi7zMi2oUmmLW6H8Pjttk9i8fWd0DE5r8WAA69lUW31XL7TWy1AF3NW/QdTiyyWQM1EyYqk5bcER9HubkzExcVIvRiXkA/oP3w3cd6OB8sRqArysDFZ2SOCNUXWNIyq4YsqggMtiQtAz6jznJsj9D0m2PT95SoaSFfHok87NOpg5HgHnDs/ht5EG4AwnO4zKa7PAjlEvPm+syDYw+CJfxyHCNR7hXexefrM7fPvCXxIpxMoVcW3Ci4Munukrdcynv2wAdeKQUT4HWAMp+J0cc9SNipbm8lLHpXiLXcQ53AGzpE3iWN3TnARgQb7I3chZyMWlcK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HmS9McXWOgMVgvjoTDMWrFKQWYNART00nRo+a7x2Wk=;
 b=gykjcQ12Pi/kEPBMwBEniy0djjtLGI4Nq3ywgRTNEAEvbY9+zjfP4bWSWLsBRQlzyjjQR+C0WPy1icDj+K6rZyan3nIYHxQD082b9/m1SkzK2ZV2/0yt7KaSnjNpI63vLApel69ICwz/RCrpLPGxUri8ZWM7nbM0lAliwnv8M7D9/RDMJhvRJSUewCAg041P6R50jYZkkDGK2kLJELjwNbh3HCqG7z/qwSa73haSR6P2C6nk088HrzRKJvYNWxUO0puDog3WlRGP+9LGfYLc08WwmALcUXz6juHgjSMWB1ktjwo1hPXabghduNCde/0BsgPT2eVFxFNIemDH+gQYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 00:37:15 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 00:37:14 +0000
Date: Tue, 15 Nov 2022 16:37:11 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y3QwtyKJKCKMBvjb@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
 <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
 <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
 <Y3O/a/sF21wC3EdE@nvishwa1-DESK> <Y3Qdd2aW4AHHDgq3@nvishwa1-DESK>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3Qdd2aW4AHHDgq3@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a371e9-3e1b-44f4-0a92-08dac76ab4fd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8l0BAy5LoEbNaG7d3e2i7C2NWPETJvHIHyQR55D4TLCHS520kcvGnlvrAX5UEch8QEPF8C+n08MNNQK+JK0nEPan2/jPMdlmoq8zk9kFnpQiW0h2zvydbg5RoJeob7etQyNsJGePDdo1NyVI/l2WBidnR3d5BYeKwkT/YsLuToMY8qis6vlprIc7+JEruXQBI3BVhwKjp1gBVh3zeaFQc0w/6jbdfy6sG3S6SzeGHMb1LD5NHThXsX+R7IW1hJ47fCi786cwhNAm+FK2a5bbfxrt8/+zepkfxJiysJDfk8/LRdaCDz9hsyDqDh5171ZevlMmYovjjEwBU9kNZZmudGSFVdJZnNXmTRccTFtluSXh2OWKlbx7KrL69pvYBrvYflI5Sh838MOccmNUm9G9GrEeQrHNdxz1Is2Tz9NdI67Y8FpbusO7q5gC5mJKecRvJvoJVkW70MUF3rAaBfaSLBeABlpnFxdw6K4ZEkhXDZ05IeJvLYxCUHfowDPnerG1ncOcSQCsxg/Ug4VpYiXrtvd0amHAq1lIKnouxInaoMv4icwQzYKFkvFne1gLGofB13Xl/KIN9UwVE4QvrwPLWZ2Naw6chomjrFvJ7HyR3R52v94wVyDE+E9OSJZponemTTPCVEa76oOW0uxMUsH0IbsG8vQMJfL4Pcg3kffw8R2RSuIsukBo6A18p9K1ueCDrhLlW8JNXdnpBKhJ/ZMfLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(6666004)(478600001)(6636002)(6486002)(66556008)(5660300002)(8936002)(66476007)(6506007)(41300700001)(9686003)(44832011)(4326008)(2906002)(26005)(316002)(6512007)(8676002)(66946007)(6862004)(186003)(83380400001)(33716001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Exk00g92WfOTi2CTNMCKLIoErolOVz2QAkEE3z2X8D5d+8HtdLNlRx6Kfx?=
 =?iso-8859-1?Q?ohpGOticMaTEvGZwEww5TgShy9po4wAWnPmNonh7miVU/LabD6HuS5nM38?=
 =?iso-8859-1?Q?uDgPYRxYNH5dHDbUBBHbUmUx9MM2bP8OBQE9dk1m2H0AmB1Io5PhqNIUFy?=
 =?iso-8859-1?Q?oKtH3hrLKRkAbHwDI7aLwLAHaioQzVmUm7cb9wXSwFaQYfq5L3Q8A0trvG?=
 =?iso-8859-1?Q?NWonrEIe4vrtgqwvHK9oHtm0fAlXKKY4mezmwpJlqGpfU5qYwJtzHQOV75?=
 =?iso-8859-1?Q?d5fLBAJ014InOTKJVGrxm4Am4WcMWhTY230wnEFyCVsdKJGgQdD9qZZHdc?=
 =?iso-8859-1?Q?xp12aBhCluvgbeQqdP0LBQpRGElAgh4h90mjSR//2dn/W7qjE81aQrCyqr?=
 =?iso-8859-1?Q?VePXblCW4d5MvnaKNn0YSoU32Ob+hedlpFr+MPkqLn1pzaJ1mpeFP1pqYP?=
 =?iso-8859-1?Q?0pb33YbRM5cqitloVWr4IIwIa83c85XMn7FLMrM7wezu+5xGtVodGcarjW?=
 =?iso-8859-1?Q?h+MyxD5/Zhe9qnpFf0IZQfOgiHEVidZsOriQyyZSsf1gtv+5c6VHsM/0JO?=
 =?iso-8859-1?Q?t1XJcHgImAnBtBLf5h2jPmip2MPsVGBrAQdGBjB7n3i7RZ8sm4j/QI4G90?=
 =?iso-8859-1?Q?qDBeqMqeSliGRmQrD5ntfa4/Dn8HI3+Y5QncL/uNbEp9H9OhaXskvQD67d?=
 =?iso-8859-1?Q?J5uflmeebOy6Q5SQg9phIzGx4wqJp5/VC1Ej+U0zh/x6HYdujldMo8k07u?=
 =?iso-8859-1?Q?wiW2nJkYVOENF0KwoJ49StfJgp9BnSj9ZFXrZemZ/NvrfxSwLdHkm7jMoT?=
 =?iso-8859-1?Q?rrgaFII91iiYgskjedNGxby9bQNcRvXtaOsnjeYm4XTukIumUhqx/hf0K4?=
 =?iso-8859-1?Q?pPNkDfl4b4jV8aLDOlf9rXC5zgOi3Uu7Eqllv4klThTn05TD6uSZUC52P8?=
 =?iso-8859-1?Q?WSZhoMSMjNcjK32apqMxsZZAUCotiPAXccjay4jpsbwd/Qt78+gBXMfT8U?=
 =?iso-8859-1?Q?0VzZ0AsRK84vhkX0/0rO+i4oWni2r4U+jtcIbd10s7SzH9CbO5e5VHXrEn?=
 =?iso-8859-1?Q?DQ5mnv83WLyleo4029egs2m8x6N5uH4tQuClJEZ/zZOXA1/gotd23zMl/I?=
 =?iso-8859-1?Q?tvAf0Uh41ex/Cz7mkjrj4/r52ZXcf3xXfadErrG/uRWfeIojS6sKY5WQG7?=
 =?iso-8859-1?Q?/x+vJ3fsjxME87cKh2VN/3TIscu7Jq4UYX9lgzcQvvmghplpPEWaSkVUC3?=
 =?iso-8859-1?Q?UffijmI7ufk2XUG0/uezfqaVxLfuGr4JWLdpO9LCs99PVdorllgDJ1KpxZ?=
 =?iso-8859-1?Q?laXRUQeQIcr6V7zeDlQzbYyPwceUnfyhVLIX3Tod4kk6yMD+gkzDS7z6Zf?=
 =?iso-8859-1?Q?3Pdo7/IkD4Cnal0yEWAFkakf88AXx7klaQC60OMKHXk2TGwpt555ttq5ge?=
 =?iso-8859-1?Q?Z7ZEL0k7vTEG/EfFEDdaD0zSczw84UETyEBgInYLlju43DmxdIE5h5FqUu?=
 =?iso-8859-1?Q?C8/8Hc2ZH+8DZiO0ADORRfPrCU7x3ZeJgDSIYCzEROIKD1G+3EZfQ3p/23?=
 =?iso-8859-1?Q?Pl96rLAWO2wGgCURZu15mzZ/35PAuvreAc3evNglR1sLUE6k90CR4jseMH?=
 =?iso-8859-1?Q?hGIIw/Zf1OK2PfysxYQMm/mEnRaXlWdLVOjqODf5dAvMMGKiIykicsiAFz?=
 =?iso-8859-1?Q?y4hd5W/v8ZTbTOf7bMo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a371e9-3e1b-44f4-0a92-08dac76ab4fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 00:37:14.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aoxu3gR2Uu6CASNmwEBESpjhMLj3jw/wGhoZQxI9TiE/3Fenny/iC4+PAE7zUvWW0+1/VqZ+U8LVyWJEkqk6dJ5GdcSHPFa8Q49z1JAxaekeEtKnE6AWRQYpc77WFD6a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Tue, Nov 15, 2022 at 03:15:03PM -0800, Niranjana Vishwanathapura wrote:
>On Tue, Nov 15, 2022 at 08:33:47AM -0800, Niranjana Vishwanathapura wrote:
>>On Tue, Nov 15, 2022 at 04:20:54PM +0000, Matthew Auld wrote:
>>>On 15/11/2022 16:15, Niranjana Vishwanathapura wrote:
>>>>On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>>>>>On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>>>>>Asynchronously unbind the vma upon vm_unbind call.
>>>>>>Fall back to synchronous unbind if backend doesn't support
>>>>>>async unbind or if async unbind fails.
>>>>>>
>>>>>>No need for vm_unbind out fence support as i915 will internally
>>>>>>handle all sequencing and user need not try to sequence any
>>>>>>operation with the unbind completion.
>>>>>>
>>>>>>v2: use i915_vma_destroy_async in vm_unbind ioctl
>>>>>>
>>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>>><niranjana.vishwanathapura@intel.com>
>>>>>
>>>>>This only does it for non-partial vma, right? Or was that 
>>>>>changed somewhere?
>>>>>
>>>>
>>>>No, it applies to any vma (partial or non-partial).
>>>>It was so from the beginning.
>>>
>>>Doesn't __i915_vma_unbind_async() return an error when mm.pages != 
>>>vma->pages? IIRC this was discussed before. Just trying to think 
>>>about the consequences of this change.
>>
>>I am not seeing any such restriction. Let me probe and check if there
>>is any such restriction anywhere in the call chain.
>
>I checked and I am not seeing any restriction anywher in the call chain.
>

Note that just like binding case, unbinding is also synchronous unless
there is a pending activity, in which case, it will be asynchronous.

Niranjana

>Niranjana
>
>>
>>Niranjana
>>
>>>
>>>>
>>>>Niranjana
>>>>
>>>>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>
>>>>>>---
>>>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>>>> drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
>>>>>> drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>>>>> include/uapi/drm/i915_drm.h                   |  3 +-
>>>>>> 4 files changed, 51 insertions(+), 6 deletions(-)
>>>>>>
>>>>>>diff --git 
>>>>>>a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>index d87d1210365b..36651b447966 100644
>>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>@@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct 
>>>>>>i915_address_space *vm,
>>>>>>      */
>>>>>>     obj = vma->obj;
>>>>>>     i915_gem_object_lock(obj, NULL);
>>>>>>-    i915_vma_destroy(vma);
>>>>>>+    i915_vma_destroy_async(vma);
>>>>>>     i915_gem_object_unlock(obj);
>>>>>>     i915_gem_object_put(obj);
>>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>index 7cf77c67d755..483d25f2425c 100644
>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>@@ -42,6 +42,8 @@
>>>>>> #include "i915_vma.h"
>>>>>> #include "i915_vma_resource.h"
>>>>>>+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>>>>>>+
>>>>>> static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>>>>> {
>>>>>>     /*
>>>>>>@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>>>>>     spin_unlock_irq(&gt->closed_lock);
>>>>>> }
>>>>>>-static void force_unbind(struct i915_vma *vma)
>>>>>>+static void force_unbind(struct i915_vma *vma, bool async)
>>>>>> {
>>>>>>     if (!drm_mm_node_allocated(&vma->node))
>>>>>>         return;
>>>>>>@@ -1727,7 +1729,21 @@ static void force_unbind(struct i915_vma *vma)
>>>>>>         i915_vma_set_purged(vma);
>>>>>>     atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>>>>>-    WARN_ON(__i915_vma_unbind(vma));
>>>>>>+    if (async) {
>>>>>>+        struct dma_fence *fence;
>>>>>>+
>>>>>>+        fence = __i915_vma_unbind_async(vma);
>>>>>>+        if (IS_ERR_OR_NULL(fence)) {
>>>>>>+            async = false;
>>>>>>+        } else {
>>>>>>+            dma_resv_add_fence(vma->obj->base.resv, fence,
>>>>>>+                       DMA_RESV_USAGE_READ);
>>>>>>+            dma_fence_put(fence);
>>>>>>+        }
>>>>>>+    }
>>>>>>+
>>>>>>+    if (!async)
>>>>>>+        WARN_ON(__i915_vma_unbind(vma));
>>>>>>     GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>>>>> }
>>>>>>@@ -1787,7 +1803,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>>>>> {
>>>>>>     lockdep_assert_held(&vma->vm->mutex);
>>>>>>-    force_unbind(vma);
>>>>>>+    force_unbind(vma, false);
>>>>>>     list_del_init(&vma->vm_link);
>>>>>>     release_references(vma, vma->vm->gt, false);
>>>>>> }
>>>>>>@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>>>>>     bool vm_ddestroy;
>>>>>>     mutex_lock(&vma->vm->mutex);
>>>>>>-    force_unbind(vma);
>>>>>>+    force_unbind(vma, false);
>>>>>>+    list_del_init(&vma->vm_link);
>>>>>>+    vm_ddestroy = vma->vm_ddestroy;
>>>>>>+    vma->vm_ddestroy = false;
>>>>>>+
>>>>>>+    /* vma->vm may be freed when releasing vma->vm->mutex. */
>>>>>>+    gt = vma->vm->gt;
>>>>>>+    mutex_unlock(&vma->vm->mutex);
>>>>>>+    release_references(vma, gt, vm_ddestroy);
>>>>>>+}
>>>>>>+
>>>>>>+void i915_vma_destroy_async(struct i915_vma *vma)
>>>>>>+{
>>>>>>+    bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>>>>>+    struct intel_gt *gt;
>>>>>>+
>>>>>>+    if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>>>>>+        async = false;
>>>>>>+
>>>>>>+    mutex_lock(&vma->vm->mutex);
>>>>>>+    /*
>>>>>>+     * Ensure any asynchronous binding is complete while using
>>>>>>+     * async unbind as we will be releasing the vma here.
>>>>>>+     */
>>>>>>+    if (async && i915_active_wait(&vma->active))
>>>>>>+        async = false;
>>>>>>+
>>>>>>+    force_unbind(vma, async);
>>>>>>     list_del_init(&vma->vm_link);
>>>>>>     vm_ddestroy = vma->vm_ddestroy;
>>>>>>     vma->vm_ddestroy = false;
>>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>>>b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>index 737ef310d046..25f15965dab8 100644
>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>>>>> void i915_vma_destroy_locked(struct i915_vma *vma);
>>>>>> void i915_vma_destroy(struct i915_vma *vma);
>>>>>>+void i915_vma_destroy_async(struct i915_vma *vma);
>>>>>> #define assert_vma_held(vma) 
>>>>>>dma_resv_assert_held((vma)->obj->base.resv)
>>>>>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>>>index e5600f358a15..431d40bb1dee 100644
>>>>>>--- a/include/uapi/drm/i915_drm.h
>>>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>>>@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>>>>>  * any error.
>>>>>>  *
>>>>>>  * VM_BIND/UNBIND ioctl calls executed on different CPU 
>>>>>>threads concurrently
>>>>>>- * are not ordered.
>>>>>>+ * are not ordered. Furthermore, parts of the VM_UNBIND 
>>>>>>operation can be done
>>>>>>+ * asynchronously.
>>>>>>  */
>>>>>> struct drm_i915_gem_vm_unbind {
>>>>>>     /** @vm_id: VM (address space) id to bind */
