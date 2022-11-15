Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF12629F1E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E389E01;
	Tue, 15 Nov 2022 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2591882B5;
 Tue, 15 Nov 2022 16:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668530038; x=1700066038;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1yzO3ffYKbrgWplaCXJ4MY7dIfOfChVfJO6tT8Tjg+c=;
 b=HhMU6kxtPjUqavflNF4/T+fSXyRUiCLWoFJ3DTbkkzIus5LRuy+Yue/l
 +H6GnpFSPBomnK+q9j7F+DqNBRGEhyUnbuawux4LtbJutvxTQyR49SMO4
 qmVowQIMgCwCAQi8NET/WoP+vgFC6JkKg3qI+JgyyFINeUNOw43RjV5pP
 kBSzRN0VHmqLezFCGJ9FB8d9HxRTZfglTcbHgimsj/ScTR5eMa3kUmTbu
 CNOoo5efbv3D2/+jdJCwhMza1KoSjrI3MPdFS3iVFkGnx130meoFO/jaV
 rCH7GIrxKyCM6VaVdoU5FWRoqVozWK+JVI5KnizAolhtmRQ66Schr8HYq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398587861"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="398587861"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 08:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="744656199"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="744656199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2022 08:33:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 08:33:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 08:33:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 08:33:57 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 08:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJJaS1pl1Asggg9+HqEuvlofymsyfdEjbC9psARJHsVwaQpaE7KKE4lk77zLvLq/MHit3UaYztqDwjgJabB1eb2TyKuCsaF3lntuU/INyQuMbocgZ21mGlIFTyz6RC5MsGnaxy+nb5wMcJhBI1GIibg9Ob6leFLGYoC1VyIdOoflIrWA8zKMj1LMBy61EeMOjhDIjyndDoTMhHkZum9XMCueLeVVjCIfrhlFvhzzcQ9oYTBVR1+gBOea7iHsmh/swXKYigd7puqv3eFymJwk5vkteNz/6ogI+VhZkDNvvGfqX7EGIh3bFzsmayCCG+sKPzPfSwHJtOJMghBQ4t4sZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuEva/tKrsr+e/1FN0t3XdspCDswE2lPoTISlRo2JQw=;
 b=JjPz3EM4u8k3P70LCIvqXnS9xnSzdIHhopQgr6sJU3lCZzRRNKFb3iAZVvAmQv9fEf8Cs/+y1Pt17Z6YIca4a0lXkL4VZvfFojSWKr3DzwspCgHoa5KNXfJgYrodx5aa+ednNXuYpXgfbb1ivtx0aT+Qja7dwzZckxIUU+/pIPbiLk77I6fMjB2D2/vY3MTWKADYbcoOt89hE3QFNSHfSsG3mhhx0WqUwKWjKTBogDHDvXTc6YgJV/QTCvVb2OtQVMYNtXosUfkOKUnUhqlwhyNho0HzVt0qCoCMPi85eAHuVanYKTh0rH0uiXCob1vId5w4H6T94tmU8l8yd2eGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 16:33:55 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 16:33:55 +0000
Date: Tue, 15 Nov 2022 08:33:47 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y3O/a/sF21wC3EdE@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
 <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
 <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2243ac-ba77-4f6a-f503-08dac7272ff1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TI6EuzoDTEYgfpX3RcIxM9sNBjqpJJ/eKl3gAnlGbQMURxs6a498bHnIAUqBQjjfXOQYPTuj3jYIS3y3fs6TrPMqOH4STkVDmn1j0KnC1NdY/7KcT5Xo8lQ3PPfMrk8r4aR4OYqQGMnxcb8SIOtjqqOGIoDieDi42TDBmYE2uvPFrFSafKOQOTjwkkqsVZc+FDyWBXg2RFgo0ABrIYop2WKgNIrb3PshkUrW5DjLAKUMC22snqa9sBiKCs6xkScdbWvGFWV9lCo40BLuhObhMUB8DKg9A/TrazOjto6fV46l2Cpjn4Mc6zzqKpD8OdCbIHuYz9D0t1blLEkxDSOS31bKVDmMX4mcbt90LiQy4VwjdDWtY9gBO9h7HPcPa1g2p7D9frox1h7Cx4QMprta6BEsM9w7sk9uYOQTEiMWd2xFGI2yHTD5aWF+TwG7ThDC4efh4etwgk+vJpKeD+bdl2MG/Fn/2oARtJ0m2vzt1/TGle1Z+xInKoN9YaXUOMzwcmbKnYgTgdsZ97u4i7DTTyeQsguF9qJJLeG94mbc4BJni/veNM74OvUmFG+0AumBRwpY0e4pjd38a2RZmLiJxZrdc9MfeEFd/BMHAgsfWT6P4rzSRNjGQIEiIVEh0uV4gnYZaXOYhJ+hX2cGeND6UDyymoLMfS5XyveKkZ4tugA2w2Mhd8/r7G9nnPcAkovEvDMHJO97h/YhRRrbLSl/8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(86362001)(2906002)(82960400001)(44832011)(8936002)(38100700002)(6862004)(83380400001)(186003)(478600001)(6636002)(316002)(5660300002)(6486002)(33716001)(66946007)(41300700001)(4326008)(8676002)(6666004)(66556008)(26005)(9686003)(6506007)(6512007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0hXME1CgX4de7BImyombQCQNHwDuBqWO7AM6nC2PfkPh/Tps05dHEnDZDE?=
 =?iso-8859-1?Q?79KHaQWHkkj9wsYrbnqyuNA/zAm//xyXwU6sI7ZWA0toHGoCy7ZYTaJfwA?=
 =?iso-8859-1?Q?c60Zf/B8VIJhEaUAG+wMogvFI5Oqk8VBNfaUb/dGU5O/GPH2fp9okNZary?=
 =?iso-8859-1?Q?Gb1Dj8MIn4b3GnzGwSOpdF948pRDiz57YaEJZAiH2JCMqCc62v0Qr3yhNe?=
 =?iso-8859-1?Q?MWt3Y4UI5VAhA2r7VRMMr1eLKIsDW42jvn7/y9ZS0qXr9N24rB5IFNqiEp?=
 =?iso-8859-1?Q?wGdYVQB3t8ex0DJByZlTCAvXiWS7K4drw1Kq/sNqWPoCd/HWYGAEV9HZ4e?=
 =?iso-8859-1?Q?flz7nQuTQ+pJNHyo1UTPDRvn3es20WPfWviytAtZx50cNtr+ZEvbeYO+zb?=
 =?iso-8859-1?Q?WNraSQ6jOgQhBG2BPdraGgjLIItdB6rfsnoYoJ11N9+gPp6PuVuC0abOtP?=
 =?iso-8859-1?Q?cjzPKw9fuHhWPBW6UMFE3XBEeOEU1JGra0AIMmaIeyWMwtaAyq4HieXjTH?=
 =?iso-8859-1?Q?JlINwFYXoJ72yBUOHadk/8rfTTAfCTQ2vdKwvJtAR4LABih/ZwFGmXqN7I?=
 =?iso-8859-1?Q?ETBEbpDQouVYARZlIGvZDTHmEBV5c5IS510YyljSMsnCDcVNZWgITuMgUB?=
 =?iso-8859-1?Q?XulcLbwPK82Rioh/JnPEERbDWcrihQmJBQljGglQ84D0DeSWGwUh8HLsTU?=
 =?iso-8859-1?Q?19vU7GErRAns77PCOAKUd/T28lK+lwf/NLlxj/jnnTx3OGNo8Ty1GpumEr?=
 =?iso-8859-1?Q?OBG6yqyVwSw45xFjooGjxsXlVsOsWS+tSl78T9zXhm6A0KGFw0Fa2MI+CE?=
 =?iso-8859-1?Q?RhGz0+WrTPTWl0ymHb0PsOS26ZP9gNdfsED0yhqy8yjJeUQUZdy5GFKVNv?=
 =?iso-8859-1?Q?UFauwmeuf9ppwRBVElo0Ny7vffb/84KQmWhmaxh8af6mnZallVC/uCgiff?=
 =?iso-8859-1?Q?/NPAACgLbr1n8tVhZpbOHOq3FzyLH6Se3mS1VdQ4Cjx5Ng8MDCsuqW/p+l?=
 =?iso-8859-1?Q?521aT4cyheaM6vf2gJutrXkbDXsfmYVUuNkxOneQ2nfXqZZU51ag380XEF?=
 =?iso-8859-1?Q?wqzVxswQxJ9I7vCRyxalJCPU/kTs0OCika1TPATOLrXfgCzmYM2BaNcVrc?=
 =?iso-8859-1?Q?E4+0AMC/c9NRZ4DGB+G8+l9uzIlrLi9GvHCd1FmnQC6jr7FWjx6faRDRHZ?=
 =?iso-8859-1?Q?xucpBaBARTJ85Jv9CpmkvR49pCpGrjxB0GIedWe15B8rShfFp96XLXn3Ql?=
 =?iso-8859-1?Q?fhBLVoS9mtDfOJ0Lk2mboT2Sx04cW1Ea2M/KCl9dbW0e9cT6ohiWCfQxpp?=
 =?iso-8859-1?Q?p4d7ujT+B1RfO2ZwdC6UOzSQ7AwE6WSfekUdQLKOkKV7PS1AbVREtVRaZv?=
 =?iso-8859-1?Q?NHzV6vjVU8i20H42mJphmQiC0jdgj8A9MqOKDZgvuJ0u2WB9xQbfv4W+dK?=
 =?iso-8859-1?Q?E514oH7ydBzRc6w4or0lf36KdQlPHDoEtYqK2kIl9NEQuh9u1PpObKCEG0?=
 =?iso-8859-1?Q?vgCZqaiX7aiv4mAQdZdGSIFM4zFQy35igkEFxT3w2xVNsL7Ogf4574ZvI9?=
 =?iso-8859-1?Q?8OyXIErJJZuaEU67LsXSO+In5JskvY7qHP862aHk+wuIW2FD1bhkqohHtG?=
 =?iso-8859-1?Q?TIUp4LjvJDapER0PgyIGYr1K1erU8wa2UYe0kqvBEZ8Wz2Z3UACbHcLKzj?=
 =?iso-8859-1?Q?jKcNeeylmFrO5mC069o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2243ac-ba77-4f6a-f503-08dac7272ff1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:33:54.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R2gFYdcimHhf21F7znNnwSCK43oe8kl0Wwas02R+iiTqXEx2T0PljoIKuNAHZtkPxJ+YBxVSuebP+j9oQjH9ZVIs9cEjiM5A+P08FiOT3bkjQjuW+r73LYYGfalxpRd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
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

On Tue, Nov 15, 2022 at 04:20:54PM +0000, Matthew Auld wrote:
>On 15/11/2022 16:15, Niranjana Vishwanathapura wrote:
>>On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>>>On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>>>Asynchronously unbind the vma upon vm_unbind call.
>>>>Fall back to synchronous unbind if backend doesn't support
>>>>async unbind or if async unbind fails.
>>>>
>>>>No need for vm_unbind out fence support as i915 will internally
>>>>handle all sequencing and user need not try to sequence any
>>>>operation with the unbind completion.
>>>>
>>>>v2: use i915_vma_destroy_async in vm_unbind ioctl
>>>>
>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>><niranjana.vishwanathapura@intel.com>
>>>
>>>This only does it for non-partial vma, right? Or was that changed 
>>>somewhere?
>>>
>>
>>No, it applies to any vma (partial or non-partial).
>>It was so from the beginning.
>
>Doesn't __i915_vma_unbind_async() return an error when mm.pages != 
>vma->pages? IIRC this was discussed before. Just trying to think about 
>the consequences of this change.

I am not seeing any such restriction. Let me probe and check if there
is any such restriction anywhere in the call chain.

Niranjana

>
>>
>>Niranjana
>>
>>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>
>>>>---
>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>> drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
>>>> drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>>> include/uapi/drm/i915_drm.h                   |  3 +-
>>>> 4 files changed, 51 insertions(+), 6 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>index d87d1210365b..36651b447966 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>@@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct 
>>>>i915_address_space *vm,
>>>>      */
>>>>     obj = vma->obj;
>>>>     i915_gem_object_lock(obj, NULL);
>>>>-    i915_vma_destroy(vma);
>>>>+    i915_vma_destroy_async(vma);
>>>>     i915_gem_object_unlock(obj);
>>>>     i915_gem_object_put(obj);
>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>index 7cf77c67d755..483d25f2425c 100644
>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>@@ -42,6 +42,8 @@
>>>> #include "i915_vma.h"
>>>> #include "i915_vma_resource.h"
>>>>+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>>>>+
>>>> static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>>> {
>>>>     /*
>>>>@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>>>     spin_unlock_irq(&gt->closed_lock);
>>>> }
>>>>-static void force_unbind(struct i915_vma *vma)
>>>>+static void force_unbind(struct i915_vma *vma, bool async)
>>>> {
>>>>     if (!drm_mm_node_allocated(&vma->node))
>>>>         return;
>>>>@@ -1727,7 +1729,21 @@ static void force_unbind(struct i915_vma *vma)
>>>>         i915_vma_set_purged(vma);
>>>>     atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>>>-    WARN_ON(__i915_vma_unbind(vma));
>>>>+    if (async) {
>>>>+        struct dma_fence *fence;
>>>>+
>>>>+        fence = __i915_vma_unbind_async(vma);
>>>>+        if (IS_ERR_OR_NULL(fence)) {
>>>>+            async = false;
>>>>+        } else {
>>>>+            dma_resv_add_fence(vma->obj->base.resv, fence,
>>>>+                       DMA_RESV_USAGE_READ);
>>>>+            dma_fence_put(fence);
>>>>+        }
>>>>+    }
>>>>+
>>>>+    if (!async)
>>>>+        WARN_ON(__i915_vma_unbind(vma));
>>>>     GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>>> }
>>>>@@ -1787,7 +1803,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>>> {
>>>>     lockdep_assert_held(&vma->vm->mutex);
>>>>-    force_unbind(vma);
>>>>+    force_unbind(vma, false);
>>>>     list_del_init(&vma->vm_link);
>>>>     release_references(vma, vma->vm->gt, false);
>>>> }
>>>>@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>>>     bool vm_ddestroy;
>>>>     mutex_lock(&vma->vm->mutex);
>>>>-    force_unbind(vma);
>>>>+    force_unbind(vma, false);
>>>>+    list_del_init(&vma->vm_link);
>>>>+    vm_ddestroy = vma->vm_ddestroy;
>>>>+    vma->vm_ddestroy = false;
>>>>+
>>>>+    /* vma->vm may be freed when releasing vma->vm->mutex. */
>>>>+    gt = vma->vm->gt;
>>>>+    mutex_unlock(&vma->vm->mutex);
>>>>+    release_references(vma, gt, vm_ddestroy);
>>>>+}
>>>>+
>>>>+void i915_vma_destroy_async(struct i915_vma *vma)
>>>>+{
>>>>+    bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>>>+    struct intel_gt *gt;
>>>>+
>>>>+    if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>>>+        async = false;
>>>>+
>>>>+    mutex_lock(&vma->vm->mutex);
>>>>+    /*
>>>>+     * Ensure any asynchronous binding is complete while using
>>>>+     * async unbind as we will be releasing the vma here.
>>>>+     */
>>>>+    if (async && i915_active_wait(&vma->active))
>>>>+        async = false;
>>>>+
>>>>+    force_unbind(vma, async);
>>>>     list_del_init(&vma->vm_link);
>>>>     vm_ddestroy = vma->vm_ddestroy;
>>>>     vma->vm_ddestroy = false;
>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>b/drivers/gpu/drm/i915/i915_vma.h
>>>>index 737ef310d046..25f15965dab8 100644
>>>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>>> void i915_vma_destroy_locked(struct i915_vma *vma);
>>>> void i915_vma_destroy(struct i915_vma *vma);
>>>>+void i915_vma_destroy_async(struct i915_vma *vma);
>>>> #define assert_vma_held(vma) 
>>>>dma_resv_assert_held((vma)->obj->base.resv)
>>>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>index e5600f358a15..431d40bb1dee 100644
>>>>--- a/include/uapi/drm/i915_drm.h
>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>>>  * any error.
>>>>  *
>>>>  * VM_BIND/UNBIND ioctl calls executed on different CPU threads 
>>>>concurrently
>>>>- * are not ordered.
>>>>+ * are not ordered. Furthermore, parts of the VM_UNBIND 
>>>>operation can be done
>>>>+ * asynchronously.
>>>>  */
>>>> struct drm_i915_gem_vm_unbind {
>>>>     /** @vm_id: VM (address space) id to bind */
