Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F019629ED9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1182F10E14B;
	Tue, 15 Nov 2022 16:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED66D10E14A;
 Tue, 15 Nov 2022 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668529214; x=1700065214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x9ku6dt5rmf89d10DQg/hI8qPaV7cKsf0cyW7CpFQBo=;
 b=N86I+jNgACCXhoeGEMvVcHCaRVSZk2nOAZXIMSJ54s1Pqseh1Fm/7SpA
 xMQKRWp6EN81MxT9QnWaIsvnEL8FGlczULSFHra67Rx8UuGg4zm677IbT
 GfBME319ErHG4DE00+KAYgzec7jHX0t7tXFjLJqpyLoEAdsOiJRQuRVGI
 jMj9jlbpKTmOfAqy/NDAkfdafWHnnLdVqBcaNEueAjHHJho5YbX/aeV27
 F8ZifVGDA3YmaS+pe9qyeVAdbMAak8qb9cXCXGqsQhJsB8NwN91+KJXny
 Afd0h4v3HwmncxmQpwK1FVjXSH+plGjBuUreuo6j0qq7gUEmKri1nnJ/H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="311001672"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="311001672"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 08:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="707791055"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="707791055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2022 08:20:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 08:20:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 08:20:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 08:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/U96ZfSquj9co+FJB3Clswu8V6D+pio0b062qTfgJS7CjpUiED9nL7bxtIivIkOmvYXJ//qMNCPmSjrvT8dAZyIGr6ZBgMqD+5YJscr/SsB3ao87q/Z3iGLrOCy5kkrvkljpXY1FZi1VkFCx/NUhJeYQTLKRc9aI/Rf94LHTD4hYO578xWzcBwjepfNRbj7ai17g2qckuUU86nrxguZBypl3SGaYnppGB7rmRlJ0OK3XYlxQxQlJHfOC8ZhpLYxjKK6FZfUlUmubfOvk2RO8ecMbmxGM50pXUgiH8yrzEBvGQtfcBv3I4nmVzBmKctqs1rZbvUphTZezF/JbOZx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KguwQ/Ow8fu5CvPfWzOKXuOTNCSZwd8/H0030MlzBqs=;
 b=TSd1AAm9nPX0Yy1o/ujRcedzdgoVaC/d42kZqJQf2W8U6ncR0IMHku6/09NgC+vq3J+BUwlXPcI2TQ7Qi2POAO4pbXI2gMJcZQyrg5EOjaPdHfnfBNIk0DFe/pK+AOhuv/c+9My8kwKdibo+qWBOPTyALn5mz5ALt2r5XutiCUvl6h9E3+WSDOICeSI5q2WK7UFMHitySYij6iyAdqEnrFfECm6bQkfPu6nGIaZWPcUEVfi5PZIPLTdOn5pk4CXoSHOf2FgdQ4HYtK1v2T9ZTuMnRnNjVM7ek7Fhw2lAdsLeExMNa485V5Kbt6E9fU81IkFvmU5/Eu1hB266TNXsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 16:20:10 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 16:20:10 +0000
Date: Tue, 15 Nov 2022 08:20:04 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y3O8NAyUXEnaNIfR@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <Y3O3Murna92s7iKL@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y3O3Murna92s7iKL@ashyti-mobl2.lan>
X-ClientProxiedBy: MN2PR19CA0053.namprd19.prod.outlook.com
 (2603:10b6:208:19b::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f5f82dc-8047-487f-d6e0-08dac725443d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyCgdUE2Y+6HnguxKZjI+D3VbzeZUdercSZdgqIDDpZqZlzIRrKit7tqLmjOCzt7DKrTL9xSkWl2qee/r2fTcX/E8oxbis48UBDjKs1FYxtyua3ro0t2EejA/qNac0HxwZAvGyl+YY4cAv5ER2OfVXUMiN9SwisHmlvEwBrh+amXkjFZWf6JutSpGtq/fBuI+spsvmeSJoRqMUe0rVCbzGuxTsscMrS0zRehZPtwjT7XV70jOTx5Kr6NSW+GH0f3t06OXO/83MQdW9gAk5x67KKn25BTjqlHCiJDWXngwPWTfm9QJNnordoFy3Qh7LA09B5AnW2jpBLuWZKPiHie5m7X7vnUGYcBa7LCA7bZSC/Rznxls2b4Prst+V1B7KJD1q27JTR6GapbkkRehPRbo0o59Gvc0pnmQGi9u40EOS6JJnTpnZMhLeoNxPnDdy/lUQf/BSfmx1wTPQo5uqANmCyRDx42HQnZT2yGsnsIrNmYTQHSz6ZXjDvMm3m72OCaSHs6jjh0VxFQ87YPy63N/9yY+/aQAh6FoMJtF84xsMyfzKcd0/6nrX5Am1KlXRkQXZqbCN/p9t1FYBGOhyxPFuXOdtFu1AawLtgaoox/i01HIS+PqPE8yQcunZo2oJ0d/zBjF3+bJxOcjbWv4uCMFEyx/3WebAmcGtyf04Fw9iNqbvEunfKdmqANO8IZl4lecE632ecPh7eb8lLBXruUOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(33716001)(6666004)(8936002)(6486002)(478600001)(83380400001)(5660300002)(6916009)(316002)(6506007)(66476007)(66556008)(4326008)(8676002)(9686003)(6512007)(82960400001)(66946007)(86362001)(38100700002)(2906002)(41300700001)(186003)(26005)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m97kvJ05vczZ7pFlg7sckwc6f0z/cOOCQqbVD8oj5DyEqfMaCOg/VzJs+T2n?=
 =?us-ascii?Q?UKIW7/1uSeqV/L8MzsGHFswcL+U41N7lRt1+z9xKplso0hsSq9Qnxv11IA2A?=
 =?us-ascii?Q?bgSnpjgSIl3gAqqKQEohcX1k/tJuuuP/qNn7u/OgitFT7wGXRXrN/aorRs7E?=
 =?us-ascii?Q?cpK8K2ti1tJDAJr7S8iUowoC846lqUQyNNcUK0Xeufkrfp2F+TUDY0LEyPX/?=
 =?us-ascii?Q?xCViowcsKt4Z1Idg71JvuBHoNssY+NB7jfQJ9iJqo6fidJrU2N2OUQfCRfsW?=
 =?us-ascii?Q?31qAn0ApBDI5XZ8iV0wagkC8ZYz+Djo+us0v4nwQvwtT8Zd4dB8995jLo47n?=
 =?us-ascii?Q?9f7L062eWENdsH3KGrfwpJxYpwwztTNHFAPIexorwLbKxzMugrcsriE0AZJO?=
 =?us-ascii?Q?Y4yjDLJFuRWsaBMTSw3+pXzrsMctmvIvRGecPJL/51XRcpntXOEN6GEptGbp?=
 =?us-ascii?Q?9kBJ/3hkNRir5NfHP2NHGNN6NDHOvsF/qZCUoV6cihELbZom9K0xJ+vtEXDF?=
 =?us-ascii?Q?uhcwYy8xFcR7ui5BCDdkRCLMnYcpb7sj8fsR00y2gmV3HM+3Bx5HhS7wLkZA?=
 =?us-ascii?Q?KsjonkJKTk+ozazX6i/FcUsQebf0EvGheZpPJmfML7GIOY95yGbF0K11wA5X?=
 =?us-ascii?Q?RwVAAmkAMzLjSzwMLo2lXoZV31IYWTbWcSuVWkBRCCRzRlGvCkGm5FiG05of?=
 =?us-ascii?Q?oKPjCcYz4iCXqNAfbXpTC9CVmGCOdmXpebWCBlw/vmSnImnpB6rxk4yeJH7x?=
 =?us-ascii?Q?PqPLrdIrTctzN7JTEY7C8kQkd7paXkbd27ggKtfcOEE24eSR0vdJtqP3I1+O?=
 =?us-ascii?Q?ly0Wl/SmewZ8w06qY8x0opqYE7ZPpKJtZG4r0Btwe6Qw0MoflYWK5DY0mZiy?=
 =?us-ascii?Q?8HOTsT/RLDMWqsqvDIYz2iFiA81O7xbkjDBhD3/qQHatlm79SwGSP74I1KuL?=
 =?us-ascii?Q?2T6syacDsRfhuxpOWeSFikxi0e7uYWUx+Wtk9VzWPVD6z64R63FWJCcFALFI?=
 =?us-ascii?Q?p/oXD+XsJObMheyWCtvmQhQ/loktTJCW5bwq41quTEIwmHoLr/vCNqcwSP8W?=
 =?us-ascii?Q?zVk5p61BWWmRrhYHnUVtwQ9KTgTV2u5xUvm/iwEw21dWlbI01+X5J1jNnxs7?=
 =?us-ascii?Q?iUKfieNvXYdXU/qdgYC1Kf+1t88FQdiPwvVRKs18kD/t6GCZGC5+lW1mh1sN?=
 =?us-ascii?Q?ZrVmIE422uS2+pxYCFzUqKzVl7Xd2PcAwxFzUYXnf1X2jqHoLZwgoPPAoZvO?=
 =?us-ascii?Q?PUmifjO0vFVDB9mEL7ckAerxgTo1kZeAc+wxSQIFeH0d962EL0ZccWvTLSEP?=
 =?us-ascii?Q?i/ShdI/uGzFcWfpnsoONDPmyac8dLP9yyRrYC8dcRvKueXRbJa4p0ueMRFgW?=
 =?us-ascii?Q?HU9OQveZ19grvoyNpTt9tfj/bmhD74PuJb7BzrOKNezYarXJiW4W7DB8a3qL?=
 =?us-ascii?Q?c5Zt/RU/ubW1z2M/T8YkVksuaxcJQZX9JIKFoZd9S+CHnhuN6jfzrlKg7ZWy?=
 =?us-ascii?Q?u4ffKLJzULg+ZnwvlwrjpHQ4UpFDMbsygtIOYoQPSDsBHczRetWTtkZLCth8?=
 =?us-ascii?Q?ullckXZUICTgxQWGxF7xjHyTmvIxBX9guF6EXzS/qnDn76qQ2EwdjshlZQEb?=
 =?us-ascii?Q?3SBkU73Jby8PH/mj/mqDzoA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5f82dc-8047-487f-d6e0-08dac725443d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:20:10.0385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kopoBvwQ5dG0yy065fwzqA9Q4AtWzGytQilBINNwkFb9/Uibfr3ekyjtYWVi1Fx1cFEoH6AqQbxCqtPRNBZP2YhS1pEqIJxL+EfTXZ+NMOLbzmtQYOk3VTEQRO9EOHTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 04:58:42PM +0100, Andi Shyti wrote:
>Hi Niranjana,
>
>On Sat, Nov 12, 2022 at 11:57:32PM -0800, Niranjana Vishwanathapura wrote:
>> Asynchronously unbind the vma upon vm_unbind call.
>> Fall back to synchronous unbind if backend doesn't support
>> async unbind or if async unbind fails.
>>
>> No need for vm_unbind out fence support as i915 will internally
>> handle all sequencing and user need not try to sequence any
>> operation with the unbind completion.
>>
>> v2: use i915_vma_destroy_async in vm_unbind ioctl
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>  drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
>>  drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>  include/uapi/drm/i915_drm.h                   |  3 +-
>>  4 files changed, 51 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> index d87d1210365b..36651b447966 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> @@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>  	 */
>>  	obj = vma->obj;
>>  	i915_gem_object_lock(obj, NULL);
>> -	i915_vma_destroy(vma);
>> +	i915_vma_destroy_async(vma);
>>  	i915_gem_object_unlock(obj);
>>
>>  	i915_gem_object_put(obj);
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 7cf77c67d755..483d25f2425c 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -42,6 +42,8 @@
>>  #include "i915_vma.h"
>>  #include "i915_vma_resource.h"
>>
>> +static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>> +
>>  static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>  {
>>  	/*
>> @@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>  	spin_unlock_irq(&gt->closed_lock);
>>  }
>>
>> -static void force_unbind(struct i915_vma *vma)
>> +static void force_unbind(struct i915_vma *vma, bool async)
>
>I still like the defines on this, they look cleaner, but it's a
>matter of taste.
>

Ok, will change.

Niranjana

>Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
>Andi
