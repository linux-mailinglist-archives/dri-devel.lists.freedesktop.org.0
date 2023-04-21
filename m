Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9BD6EB0D4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69D510E274;
	Fri, 21 Apr 2023 17:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859ED10E274;
 Fri, 21 Apr 2023 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682098986; x=1713634986;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hdcIW7C3S9UVTihxYPMEC+NVHbuEc1kb1wTD1nn9G24=;
 b=VKpOVyrl1u3gy8huk8iWGpwIDhCKZ3MO+6/CPXflhT3S9RuJ+z7702J1
 Ez9UMoVxq1z/mtgBZ+AgF+KePu7b6qy5AJ/OMpUCb8TeZFEtLDACQFeZP
 9R2aOb45rHGpYE5u3iOLVrIT0l2TFGYzwv0+1apGtDxYkp7DTiGWwc6xx
 Apw+Ewss2MZwEmH3lHWJpOIbR5kWZpPpvUVAwW9QOKHO+O/TWVGrLVA6I
 fJLX6SXDvdtq8lR/3RUURxBI4JrnfqgF1Ilqljv05iitDHhVhKuzk2G8W
 kgffYHmNR/S+6CGn8q9nNP5p1e/o7Uvyf1vPFG0pBpRD99xEVfruOBkea Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432318870"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432318870"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1021993499"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="1021993499"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 10:42:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 10:42:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 10:42:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 10:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUV9qccx1c1VgE7AqCZL8eP4caiFAtdgtoTqHeoXDuJ9N/kkrCVQK4wTV1WayzuEevLNWd+AxR5G+oBMGQJG+v56X4L1V0eJK+/HVAlqpih6TAPOyyygnTXy0ic7WyRLxWAi0v/ifmop1QrK6uuy9ty2jK1oyvnNVQoC13tKEVYpQzqP2wcbxtiOVwooATUyraROT5pbZh7t2aearCma08Xic1QTgHVItSs08AS/y1gNRUVuXrYkQx2MIfqW0AEG8ekVGC2Xsar6KJEWYZ+iCoAlEM9ANhWzujRekbnCS5zEAFipuGjXMRcy1C+omA05W/21pmcKC/DP7YIw2sUb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbdWcYqSttppDRm8u8c4YQebtFG5xGT1OwFa0ZEohlY=;
 b=CdLYBsTYfJErlJeQ9WS3ekTsE64NvYviMmRfy7Nb5eIdvfLncUqSAfhugJubCrdIJ0WsWxIn0bwJnhrvQJCVsRmLP0c/mydext5HkcNwtZ3+1WB5Xk+KBosMJyNBr+Fi3gKyGjiOxyELPAY2DTrBkJqG9knIW43072OJ8xvs5F0veZ+Focd/Y8PvTadqXc3yMYER4iYiM/iGsN6i3qLe9x2SDjmHv8W5lk+Q2oeEIzTkMkHRPlstwlkDeafmVlmrEV4wTqyoXpTjnn3TrtMLuJ0dyMeXogRCC/d35jYxpaZ2lr0SBul9ZlNkps4SsxB845RxhdHTXLJ2LuD9s4L0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Fri, 21 Apr 2023 17:42:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 17:42:55 +0000
Date: Fri, 21 Apr 2023 10:42:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Message-ID: <20230421174252.GO4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-4-fei.yang@intel.com>
 <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567042124B3E0D09E1696489A609@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB2567042124B3E0D09E1696489A609@BYAPR11MB2567.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f878ce7-f1cf-4017-9804-08db428fd6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8U4UUxybkMDmJiqI11phDFXuOfNJXCaAJjS2mrctUNSytWZfMpHrq8nmFPNLAAcA+njgCXzF4OfRgE9ksdnAf125RpOo5tG3sldlJc1YB21LKx+fEpe7Jkl6Bh+yY7unNuTPqKDNOYGolGqt0KYb/yhVOxBO9yHrVPIwdN7ZirBAAMV1rlQ1QxQuIYk0ocAvsI9HzpSKNcFyiAMrU2FYMVD96wUDVdP+DyRtCfegqSRySJB8R9eJmgby20KsXoBYYT8lJ4WdiXMZUeC5HdAK9EZjkeBVStdoEZE7uklmIUyo0Wgpt5qUDmbT7Adv2sDzFJLsY8aB1Zc3Qb940AklgYa74lVL3o9+Hd1oNj97XWsoi8r+7wboTVtmvuIPpryTwkHURp6BIxfTWdEApd99q5RA2w3xja4exTjykqW2f+/S8d2Hnq/9UxUFRO9Ohqa4POIb/Am+dexI3g5qbak367CrlpR+SFWe6cgeJu8mxkR9+W+1ZA8m8PClglp9PSmXU8fHGFyFTcfdLodMoZ4nMVcX5OBpAOIA07jErst6XIdzJn64CYVs/ZabwnovRrM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(6636002)(316002)(54906003)(66556008)(66476007)(450100002)(66946007)(4326008)(33656002)(1076003)(6506007)(26005)(38100700002)(6486002)(186003)(6512007)(83380400001)(82960400001)(5660300002)(8936002)(6666004)(478600001)(8676002)(41300700001)(86362001)(2906002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CwDx+zzzH62E/og+ZdRKd4fyyUuf+HObj7PaZoWMDZBu/r3E3x4obNFWIW?=
 =?iso-8859-1?Q?tUmeQyKybKCNX08VcTR/bt3EZRkw+/dpWiXv+og905JRPSuDhg+VwXT+6D?=
 =?iso-8859-1?Q?yvwXoYH8MWiD1bE+H94/GEcHai8KRvmbKOfXPxyDhxBu1ElZJ4jHSvVZ4Y?=
 =?iso-8859-1?Q?YCZh7sDptAHoHeWG69Pe/yYVXf0YP6RIaXe15T7t5xYwYmPB7TBQtF6ejl?=
 =?iso-8859-1?Q?VuatqtY3CRSE/IKN75kzsxC8rjmWN7DyzSGnBREyejoiRoIHBvOdo0pBFG?=
 =?iso-8859-1?Q?mtM98Mgc6NJYtyccwvtGYOTW6lfDdthaztpprFiRINFEp5j6mPmm1jer/M?=
 =?iso-8859-1?Q?K8PJV7ogIcSbz3TRS22hsHvjUB4ghbacjchzJjjkF8GtS78QjuOs4LYRen?=
 =?iso-8859-1?Q?WweMYh7xeaQSL90irW681wu+3TJCrt3ALj5gPl6UJKtpdXsYXUWuHbej6e?=
 =?iso-8859-1?Q?nqKZVVq9xcll/F7zr04SCerjKz5vltogN4xiRai2BDsnChFn4w9IAG3aS8?=
 =?iso-8859-1?Q?7s1B3dXwpcZ9uV8gtDBKK8R5Xodi6whdrYkZVrXQobhdINKaFiaEZSficW?=
 =?iso-8859-1?Q?f6ImAqRzYS6QjLqsxX/RNyPENZ6arGmPkgsb98B9RA4Pqt4M82C3XF+a22?=
 =?iso-8859-1?Q?xjLkYVDG8cCs6345kyHNb+eBgau1YIiez/kM46Xu3F6ocX7Bb2LJOUglyV?=
 =?iso-8859-1?Q?L4XhpGcFmwpD+qkH6oWy7cwl79rs/zS7nXSXGBt4S4SkgBQ3CDJx8UZtw5?=
 =?iso-8859-1?Q?udukLNaR9QJfktA/BQ1Al+WlbW72l/3xNMZ52fBFBf7ealFM1Nnu3WBA5q?=
 =?iso-8859-1?Q?+Er1PDgTS7OFscbbbS7gxi8z2owrIEf5FjEheeTbcDyANFYyWeDQoDIkUi?=
 =?iso-8859-1?Q?LcupuTuXgCqLvOFM39D5loPjdpaXCN05QZQUg5Ji/ehP4dHBEseSFdStWA?=
 =?iso-8859-1?Q?vFu6ZKnQzRWZow1lnjuafX3FjHvdR1ZLnpdQ5W5M5f13bqIKlvFMrY3tSz?=
 =?iso-8859-1?Q?uJgRSRrWSSVaSGYrf+0X59EGCX9d9FOpbYO4UFaC3audAa6yUHAkCjyJpa?=
 =?iso-8859-1?Q?9+edBe97L3nzE+ukRiHBTtEqya8AxeF0F3bXr6y/Ai2pfWT2o7mWP719S+?=
 =?iso-8859-1?Q?43QMjKgmdnSnQzidZYxvmuF5liErucaMsJfR47E0QILMaI/cfgtnyX7NLT?=
 =?iso-8859-1?Q?LJEd50Wiyy4Aw9vUYg4dQkTyADTkLs9WOLKhQTyTj+LFqNkVwvx9s/pA3Z?=
 =?iso-8859-1?Q?/ueMH0mKa+RXH15n3whxqF8RkBYR1PjRREt6JhMSp4EcBnNDRT1sm2ZuzX?=
 =?iso-8859-1?Q?4l8+OfjIQ46OQQizYbDTqxNSiPfmd6E5WmY7YvKoUbsWeZ9zJ91hwHVYLY?=
 =?iso-8859-1?Q?ZLuleQ6IqG//MxNCiilGb3xQ/cvEgS6ohQci3KHm+sbDwJu8kjURz11+m/?=
 =?iso-8859-1?Q?fu0Rv2MCiBRcuzmca0nnx7YwF/6B+6XTMV4Vj3Gw6G+baW5iUn7CX1BP8N?=
 =?iso-8859-1?Q?dX3EjhNlSzRzawbh7xSVtacZHyYOHo0SSD5HuN2TJbNec82TQJShu1ww3p?=
 =?iso-8859-1?Q?67+udT9TrPHByGgpHtxKGrLG4iAI+fg3rVLgIhkt0RwKM+gXKueC+gAlqt?=
 =?iso-8859-1?Q?vKuQVxmtziXQPKRfK+DDS7nZ9K9pgYkFpVnjTTpZxTpAy1kQH1uA5Irw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f878ce7-f1cf-4017-9804-08db428fd6a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 17:42:55.3881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+Q3c4mGuFrZVpldIsw6lp7DRTWpcFBvcDVUGDWcOyS8maDXCGRoqqahoLr76WFFEOB+o7/Ru2hYECY7aKVhuWmr08aGOzEkhfo7o6X7ER8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 10:27:22AM -0700, Yang, Fei wrote:
>    > On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
>    >> From: Fei Yang <fei.yang@intel.com>
>    >>
>    >> PTE encode functions are platform dependent. This patch implements
>    >> PTE functions for MTL, and ensures the correct PTE encode function
>    >> is used by calling pte_encode function pointer instead of the
>    >> hardcoded gen8 version of PTE encode.
>    >>
>    >> Signed-off-by: Fei Yang <fei.yang@intel.com>
>    >> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>    >> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>    >> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>    >
>    > Bspec: 45015, 45040
>    >
>    >> ---
>    >>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>    >>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++----
>    >>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
>    >>  3 files changed, 72 insertions(+), 11 deletions(-)
>    >>
>    >> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c
>    b/drivers/gpu/drm/i915/display/intel_dpt.c
>    >> index b8027392144d..c5eacfdba1a5 100644
>    >> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>    >> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>    >> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>    >>        vm->vma_ops.bind_vma    = dpt_bind_vma;
>    >>        vm->vma_ops.unbind_vma  = dpt_unbind_vma;
>    >>
>    >> -     vm->pte_encode = gen8_ggtt_pte_encode;
>    >> +     vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
>    >>
>    >>        dpt->obj = dpt_obj;
>    >>        dpt->obj->is_dpt = true;
>    >> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>    b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>    >> index 4daaa6f55668..11b91e0453c8 100644
>    >> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>    >> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>    >> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>    >>        return pte;
>    >>  }
>    >>
>    >> +static u64 mtl_pte_encode(dma_addr_t addr,
>    >> +                       enum i915_cache_level level,
>    >> +                       u32 flags)
>    >> +{
>    >> +     gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>    >> +
>    >> +     if (unlikely(flags & PTE_READ_ONLY))
>    >> +             pte &= ~GEN8_PAGE_RW;
>    >> +
>    >> +     if (flags & PTE_LM)
>    >> +             pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>    >
>    > GEN12_PPGTT_PTE_NC got defined in the previous patch as BIT(5).  But
>    > according to bspec 45040, bit 5 is ignored in the PTE encoding.  What is
>    > this trying to do?
>    This takes effect only for PTE_LM, doesn't affect MTL.
>    PTE_NC is needed for PVC (use of access counter).
>    I believe this function was writen based on the one for PVC. And this
>    function
>    did get extended to cover all gen12 in a later patch.

Even though MTL doesn't have local memory, PTE_LM is supposed to be used
on MTL for access to BAR2 stolen memory.


Matt

>    -Fei
>    > Matt
>    >
>    >> +
>    >> +     switch (level) {
>    >> +     case I915_CACHE_NONE:
>    >> +             pte |= GEN12_PPGTT_PTE_PAT1;
>    >> +             break;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
