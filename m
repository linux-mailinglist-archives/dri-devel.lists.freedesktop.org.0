Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F767A021
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC50710E097;
	Tue, 24 Jan 2023 17:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC6C10E097;
 Tue, 24 Jan 2023 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674581228; x=1706117228;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UmWSBodNCJvrDHSv1U/hPIEu4jqP8u/nVI7PFmEhxSQ=;
 b=edJVjtQSPlXZRrMQMvL1W4qTtl2nsYdgcAVW+CSQOXWbmsF5OgX2VwIP
 3UtqecStWE/ibPyxURZ6nwrilNuuAEkqIOyLiOHiyDmN01rqIPNyEEbxw
 2GJ4HqCKCQtcVUv9JvQct/m+OBxhJB4P/YBQCtWljAquhAGJLeovlC+Do
 CJLWFZJSKBxIXtT7bPzC2bl5vmB6r4V9eAGdt12Rg1ZtbA0db+fPFSOJX
 DDjsLyFem3DTuQh7J/zZPuvvPLPWct78j7yJLDw3MgmNWYh7uqeFKN89p
 5l24TTwate2caEEH48ZyvX6FKCSvrshBXxwu7qF9za5tIuZh2judtTcXR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="388697497"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="388697497"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 09:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655499241"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="655499241"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 09:27:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 09:27:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 09:27:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 09:27:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aagKoBhbtrY5RsQGhWxETYc56uMQaBOTvcbUAhfBak21oxFDtcRWpK+QG1H4hOAsC7JsLHMyL7x9owsYus5f7CpjzLa4siG2z8xXAQ230jfwgOmflgrGrnlT6rq7dW0+cUYQUy/dY9xE4ePjMwjX9Yz3g8DXG6H984Xe1x886j8VJERGMxllbP36RnM/f9HP9DiTAC66L70xa9L13RTAvdn1Dl8/a9f980yPvyQbZt9pgjaC/WLQhDpJ+gYt02GM1h+ngv5QIJBDknTepdoFUn+5amb79K0cNqQd3kCDLtEt1t4Ln+GrFoQL4hT2aj2B7sNdDv7rTwapN3QHrC0K3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNoDwHQK+sOoAIjMSy5EiT8EUwwNPA/Gyw+RMiJuBlk=;
 b=mPvmZfVU6l+vPsoPE0Er4cw99w8lkqcl7YvFRWjoaYWxBtzzsOqEQYV4cAB7Rrt/9S2G5nqS61UOUeA3MkxJrax5YRvNRCQuGgsERccQoV0umv39cqcqRad5rSV/bwZnadZ7QBaag8utJuTWnBhFX7x99HhkM0BZ1C7RJbITr6rXMCr2Z9zOupJABh2t+6LFtwk01VuSeac6l0ZC7GCj1J7a89Ma8mTxTezMbccruOWkXY4IyRcAINij9nGdNpr9vON3az3QeGUVay1HUNRnfBHGqNUpbr4WJgV1xBZ9s8t3CDve7L8JEWEypuls5S0Kl00eBRmq1FJ49EZFZdY61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 17:26:59 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::cff1:9400:d666:322e]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::cff1:9400:d666:322e%8]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 17:26:59 +0000
Date: Tue, 24 Jan 2023 09:26:51 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <Y9AU2xmJ0Mtq8iym@nvishwa1-DESK>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-4-dakr@redhat.com>
 <Y88W3ukvv/nPz8e3@nvishwa1-DESK>
 <18d28502-eb98-4322-2146-3117db9bd5b7@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18d28502-eb98-4322-2146-3117db9bd5b7@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: cff45e48-660c-4604-b450-08dafe3032f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhYIwp/4JFekfeAU0UKSYE37WLk8iu57x4vpB7PrgsnQD138hRTNaB3y6CINUI2Vfe/U4XABP9Y7cpsB8IJNP/8JZIvsWVR03EnfKqmlxAbgk76kHJWx1kWYUZqfLqoUI6aVQ0fLM6Jm+7v4SDHgYEn3+vL41m3dYgorrNg+IMFa7KECYIph8VdXfcZ7JkaIhRkYkA3yVJziGtoFR15nBAP1V44GXG4qDm2HKPRjGiw7GGamPbjcFtcaSJHVk+cEksHSOrspc1vh3wbyjb5/P8hoSzETw97LsYCiuhayPbW89JbUwqVaMJzVU2dPeE1IAfFLe6N4a9a0dEeNK1JrLbjkXOBVNG1iQ8a39moGB43YMaVOEbpqDiuIZyagVVniodPrUvT8gytgtexh0KxyibNgdTCQdYRVOf8cEhQMsXKavutxYGn5m7l7VSrsMllYr1qaPJPRThiDo9V4JjTtvkEGqF8HyUpLf4K1dwUjD/KbbdVgmimEtg5NzjgbEvV+oYtKE7b5ZbrMG9jQLpnSf83F4ogUf5UEFcYWTVnU0xWZEdJlSLRqT1hAQiEYBA+/6vDFxnKUmKAGMEw6ACO9d/Ce2ansYOKXAiV5KrC1xtkixqmaZeaQeXwuWXmIrtnGh3OlN5TiZGmV4rQlFyD+sllUC6ADX4aScMEVlazPGvzmAUSxr4a0inMW5U60N2BvSv6ivYhgtwtb1ycxuy45kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(83380400001)(38100700002)(5660300002)(86362001)(82960400001)(4326008)(2906002)(41300700001)(44832011)(8936002)(30864003)(66946007)(33716001)(9686003)(6512007)(26005)(186003)(6916009)(8676002)(6506007)(6666004)(66556008)(316002)(66476007)(6486002)(478600001)(66899015)(559001)(579004)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Bp2ADmoeh5txiMsjqD3z0sgLul6WJEzChybMZXb6ALP6eGlOrNbeah1Nsv?=
 =?iso-8859-1?Q?By2NvCXjzeB40oCoNZkoY31V55O+dqeMaYEdqTxtATstGNtxKAf/f2bimm?=
 =?iso-8859-1?Q?GDJ0cvjCi1oVmjrZzuY8X3Jq9xv7eXUtDgByPoDFc7ymzzIUq4XP8opS91?=
 =?iso-8859-1?Q?r3xi7kIesft8BlFriYptRZWTBvZYhcE2d+QEP3TV68lzreNSE/zQNWtu32?=
 =?iso-8859-1?Q?lCYxONSlougqPyfY0BNbZub5bIyYVBlWSyH0XKfbwH2fikWwsiGl1tiq62?=
 =?iso-8859-1?Q?h4Gww3TxNzO7+FKnpDzpXnGf9ReoUHqJQRUvxdSljzHF+FDh6q0dAJr8eQ?=
 =?iso-8859-1?Q?NwBqnZ9NjMD6MuSeq/OZQ6VVmSJ2dIaSGIoODOtWYSnxmDLBOPAbHCoJo4?=
 =?iso-8859-1?Q?cd55BtftBEm/BZXw2KOD7E/x9nL4EXW1sH7JJztQNgHOOkM//leMq0UQYP?=
 =?iso-8859-1?Q?FHUj58RtRC2WDOWOxNwTDQmKjXURVuG8W5jL4/UQby3B9KTHa1vlC+zHlq?=
 =?iso-8859-1?Q?doL+TeTymIn6Je9EefmENJRW/yXpqKtbhchTsh0g2x8qhOO/OYoMYAZRnl?=
 =?iso-8859-1?Q?ifrZr3yCLxANnFd5EL6NO/hinzQMb6wy1fvRP8vCLfAfv3Hh0iJavlGqzW?=
 =?iso-8859-1?Q?tVwWBZXtbmz1TmAJhj8gJyws51a8tO2IaPDYpv5ixlq0uLioeInGRu1A4f?=
 =?iso-8859-1?Q?sNeZF5KlpUfhauxlAKoP/tXVnCee6YLqU3NkKkKSHJzRlaITpU5/dRSob7?=
 =?iso-8859-1?Q?9jGwVXHJ7ILVxOYct0U+ULUChok9rgnIHb/XRAHa28qpdJGs4vSYpseLks?=
 =?iso-8859-1?Q?wrLXd2UlrC0vl2vP6fMdCIOxziA0qiNICrLg21JZVjy3Dmsqw5fmbVL80u?=
 =?iso-8859-1?Q?BonFGDjkqS55ebXePL6C+uJupaq2YBC5sjwJUMfZc7od0cliIu9NNGAEr/?=
 =?iso-8859-1?Q?sBbjVIZ15q4YZ4oUwmeo6n7Dmsb2/Y0uL1lTJWmqe89aPn3RPmzmnGLzmI?=
 =?iso-8859-1?Q?BKs3vyGksQCrcNqNLahGTmIr5WDmjTuaX0Z20R6s8+MC6mDU8AabZ6wPxg?=
 =?iso-8859-1?Q?9bmCXfNxgzt7EvbqZ1Lod4kXrF4JOiC2DUxyh5/xb5UrIvo9/FUR7HPS+x?=
 =?iso-8859-1?Q?tQLS6N8PHbWilxAhDvpgnPx2dWPknGenuUCMZdL50gwDgpKfwwuSVVpmYj?=
 =?iso-8859-1?Q?lgJkaalPfgbWrmN4KNKXRmVGjG9KqDF7cJOHTt8TE3WMIJn50vsH0LVOBp?=
 =?iso-8859-1?Q?WoF+9PjOP+FSCKzu/IHuA9hPxeLMFAAoHKPcOYxMb/tScyusuo3BGr6PNY?=
 =?iso-8859-1?Q?FhzV1Q9pDln8bSreHBC6SfsNU0AnozpcMZAtPmqAmUswFxDfKHIJuwfkdB?=
 =?iso-8859-1?Q?boWr90bf8h85igmipyV4ZLO2nWe+8NWciRiE2ux09AI67wuhggQYMMiBvn?=
 =?iso-8859-1?Q?Z+WxuPgvMWZdeafWrBJsM9SKvEJY1F0yYSfVPqJovrjLRvuHXkgkmo84oA?=
 =?iso-8859-1?Q?rloh69+Od6kGjwwD+Ye4e3m/RNnpAedSgixPO8/qJivH+rW7CRQ1fnf16Q?=
 =?iso-8859-1?Q?MYTt3K+tI4V52R5pIL3Z7z0Bet94BAF5J+dleEgkH/P/15dupkdPT2iy7O?=
 =?iso-8859-1?Q?Z6eGKTNfC6A/9CE7Gv/GKJvFAMPOENcCUbyV0SOCN14iB2QNmpUDjnNsMj?=
 =?iso-8859-1?Q?5AJHLIB2A9sL7aA3Eoc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cff45e48-660c-4604-b450-08dafe3032f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 17:26:59.5538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48hVexF3CaMPyebYEQS10gUgMh++NB/EJCS39kMP8Cj1flAbsT2ctkDc120nC/Ncuu1NIglEj6owxdwwDBi1eJ0SM7B2Gyaj5g6q//j3vUb+KcVgLmFjawe6uvE/D0VN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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
Cc: tzimmermann@suse.de, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 01:11:55AM +0100, Danilo Krummrich wrote:
>On 1/24/23 00:23, Niranjana Vishwanathapura wrote:
>>On Wed, Jan 18, 2023 at 07:12:45AM +0100, Danilo Krummrich wrote:
>>>This adds the infrastructure for a manager implementation to keep track
>>>of GPU virtual address (VA) mappings.
>>>
>>>New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
>>>start implementing, allow userspace applications to request multiple and
>>>arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
>>>intended to serve the following purposes in this context.
>>>
>>>1) Provide a dedicated range allocator to track GPU VA allocations and
>>>  mappings, making use of the drm_mm range allocator.
>>>
>>>2) Generically connect GPU VA mappings to their backing buffers, in
>>>  particular DRM GEM objects.
>>>
>>>3) Provide a common implementation to perform more complex mapping
>>>  operations on the GPU VA space. In particular splitting and merging
>>>  of GPU VA mappings, e.g. for intersecting mapping requests or partial
>>>  unmap requests.
>>>
>>>Idea-suggested-by: Dave Airlie <airlied@redhat.com>
>>>Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>---
>>>Documentation/gpu/drm-mm.rst    |   31 +
>>>drivers/gpu/drm/Makefile        |    1 +
>>>drivers/gpu/drm/drm_gem.c       |    3 +
>>>drivers/gpu/drm/drm_gpuva_mgr.c | 1323 +++++++++++++++++++++++++++++++
>>>include/drm/drm_drv.h           |    6 +
>>>include/drm/drm_gem.h           |   75 ++
>>>include/drm/drm_gpuva_mgr.h     |  527 ++++++++++++
>>>7 files changed, 1966 insertions(+)
>>>create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>>create mode 100644 include/drm/drm_gpuva_mgr.h
>>>
>>>diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>>>index a52e6f4117d6..c9f120cfe730 100644
>>>--- a/Documentation/gpu/drm-mm.rst
>>>+++ b/Documentation/gpu/drm-mm.rst
>>>@@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
>>>.. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>>   :export:
>>>
>>>+DRM GPU VA Manager
>>>+==================
>>>+
>>>+Overview
>>>+--------
>>>+
>>>+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>>>+   :doc: Overview
>>>+
>>>+Split and Merge
>>>+---------------
>>>+
>>>+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>>>+   :doc: Split and Merge
>>>+
>>>+Locking
>>>+-------
>>>+
>>>+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>>>+   :doc: Locking
>>>+
>>>+
>>>+DRM GPU VA Manager Function References
>>>+--------------------------------------
>>>+
>>>+.. kernel-doc:: include/drm/drm_gpuva_mgr.h
>>>+   :internal:
>>>+
>>>+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>>>+   :export:
>>>+
>>>DRM Buddy Allocator
>>>===================
>>>
>>>diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>>index 4fe190aee584..de2ffca3b6e4 100644
>>>--- a/drivers/gpu/drm/Makefile
>>>+++ b/drivers/gpu/drm/Makefile
>>>@@ -45,6 +45,7 @@ drm-y := \
>>>    drm_vblank.o \
>>>    drm_vblank_work.o \
>>>    drm_vma_manager.o \
>>>+    drm_gpuva_mgr.o \
>>>    drm_writeback.o
>>>drm-$(CONFIG_DRM_LEGACY) += \
>>>    drm_agpsupport.o \
>>>diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>index 59a0bb5ebd85..65115fe88627 100644
>>>--- a/drivers/gpu/drm/drm_gem.c
>>>+++ b/drivers/gpu/drm/drm_gem.c
>>>@@ -164,6 +164,9 @@ void drm_gem_private_object_init(struct 
>>>drm_device *dev,
>>>    if (!obj->resv)
>>>        obj->resv = &obj->_resv;
>>>
>>>+    if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
>>>+        drm_gem_gpuva_init(obj);
>>>+
>>>    drm_vma_node_reset(&obj->vma_node);
>>>    INIT_LIST_HEAD(&obj->lru_node);
>>>}
>>>diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c 
>>>b/drivers/gpu/drm/drm_gpuva_mgr.c
>>>new file mode 100644
>>>index 000000000000..e665f642689d
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
>>>@@ -0,0 +1,1323 @@
>>>+// SPDX-License-Identifier: GPL-2.0
>>>+/*
>>>+ * Copyright (c) 2022 Red Hat.
>>>+ *
>>>+ * Permission is hereby granted, free of charge, to any person 
>>>obtaining a
>>>+ * copy of this software and associated documentation files (the 
>>>"Software"),
>>>+ * to deal in the Software without restriction, including without 
>>>limitation
>>>+ * the rights to use, copy, modify, merge, publish, distribute, 
>>>sublicense,
>>>+ * and/or sell copies of the Software, and to permit persons to whom the
>>>+ * Software is furnished to do so, subject to the following conditions:
>>>+ *
>>>+ * The above copyright notice and this permission notice shall be 
>>>included in
>>>+ * all copies or substantial portions of the Software.
>>>+ *
>>>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>KIND, EXPRESS OR
>>>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>MERCHANTABILITY,
>>>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>>EVENT SHALL
>>>+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>DAMAGES OR
>>>+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>+ * OTHER DEALINGS IN THE SOFTWARE.
>>>+ *
>>>+ * Authors:
>>>+ *     Danilo Krummrich <dakr@redhat.com>
>>>+ *
>>>+ */
>>>+
>>>+#include <drm/drm_gem.h>
>>>+#include <drm/drm_gpuva_mgr.h>
>>>+
>>>+/**
>>>+ * DOC: Overview
>>>+ *
>>>+ * The DRM GPU VA Manager, represented by struct 
>>>drm_gpuva_manager keeps track
>>>+ * of a GPU's virtual address (VA) space and manages the 
>>>corresponding virtual
>>>+ * mappings represented by &drm_gpuva objects. It also keeps 
>>>track of the
>>>+ * mapping's backing &drm_gem_object buffers.
>>>+ *
>>>+ * &drm_gem_object buffers maintain a list (and a corresponding 
>>>list lock) of
>>>+ * &drm_gpuva objects representing all existent GPU VA mappings 
>>>using this
>>>+ * &drm_gem_object as backing buffer.
>>>+ *
>>>+ * A GPU VA mapping can only be created within a previously allocated
>>>+ * &drm_gpuva_region, which represents a reserved portion of the 
>>>GPU VA space.
>>>+ * GPU VA mappings are not allowed to span over a 
>>>&drm_gpuva_region's boundary.
>>>+ *
>>>+ * GPU VA regions can also be flagged as sparse, which allows 
>>>drivers to create
>>>+ * sparse mappings for a whole GPU VA region in order to support Vulkan
>>>+ * 'Sparse Resources'.
>>>+ *
>>
>>So, is the sparse resources the only usecase for the VA region 
>>abstraction in uapi?
>>Or are there any other potential usecases (other than kernel 
>>reserved space)?
>>

Ok thanks.

>
>It's mainly for sparse resources, though it also enables the kernel to 
>know the bounds within it is allowed to merge mappings.
>
>>>+ * The GPU VA manager internally uses the &drm_mm range allocator 
>>>to manage the
>>>+ * &drm_gpuva mappings and the &drm_gpuva_regions within a GPU's 
>>>virtual address
>>>+ * space.
>>>+ *
>>>+ * Besides the GPU VA space regions (&drm_gpuva_region) allocated 
>>>by a driver
>>>+ * the &drm_gpuva_manager contains a special region representing 
>>>the portion of
>>>+ * VA space reserved by the kernel. This node is initialized 
>>>together with the
>>>+ * GPU VA manager instance and removed when the GPU VA manager is 
>>>destroyed.
>>>+ *
>>>+ * In a typical application drivers would embed struct 
>>>drm_gpuva_manager,
>>>+ * struct drm_gpuva_region and struct drm_gpuva within their own driver
>>>+ * specific structures, there won't be any memory allocations of 
>>>it's own nor
>>>+ * memory allocations of &drm_gpuva or &drm_gpuva_region entries.
>>>+ */
>>>+
>>>+/**
>>>+ * DOC: Split and Merge
>>>+ *
>>>+ * The DRM GPU VA manager also provides an algorithm implementing 
>>>splitting and
>>>+ * merging of existent GPU VA mappings with the ones that are 
>>>requested to be
>>>+ * mapped or unmapped. This feature is required by the Vulkan API 
>>>to implement
>>>+ * Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to 
>>>this as
>>>+ * VM BIND.
>>
>>Looks like the split and merge is only based on address continuity 
>>(virtual and
>>physical).
>>How about potential page table attributes specified during VM_BIND 
>>for a mapping
>>such as readonly, caching attributes, atomicity etc?
>>
>
>In this (first) patch version the GPU VA manager generates a list of 
>(sub-)operations (or split/merge steps) for each map / unmap request, 
>which I will replace with callbacks for each split/merge step in v2.
>
>For generating those steps the GPU VA manager indeed does take in 
>consideration address continuity (virtual and physical) only.
>
>However, driver specific attributes can be taken in consideration by 
>drivers for each of those split/merge steps.
>
>E.g. for a map request the GPU VA manager generates an arbitrary 
>amount of unmap ops, a maximum of two remap ops (for splitting) and 
>exactly one map operation.
>Unmap operations carry their corresponding struct drm_gpuva being 
>embedded in it's driver specific structure. They're generated for all 
>mappings residing (and are enclosed by) the range of the new mapping 
>to map and for mappings that are direct and physically contiguous 
>neighbors and are in the same region. Unmap operations also carry a 
>flag to indicate drivers whether the mapping to unmap is physically 
>contiguous, such that drivers could only do a partial page table 
>update in case this is feasible .
>Remap operations consist out of one unmap operation and at least one, 
>but a maximum of two map operations, such that drivers can apply the 
>original driver specific attributes of the mapping to the new (split 
>up) mapping(s).
>For the single map operation we know the driver specific attributes as 
>well, since they're just the ones that were passed to the driver 
>through the original VM_BIND ioctl requesting the new mapping in the 
>first place.
>
>I hope I got your question right and the answer helps.
>

Yes, thanks, callbacks for considering driver specific attributes
sounds good.

Niranjana

>- Danilo
>
>>Thanks,
>>Niranjana
>>
>>>+ *
>>>+ * Drivers can call drm_gpuva_sm_map_ops_create() to obtain a 
>>>list of map, unmap
>>>+ * and remap operations for a given newly requested mapping. This list
>>>+ * represents the set of operations to execute in order to 
>>>integrate the new
>>>+ * mapping cleanly into the current state of the GPU VA space.
>>>+ *
>>>+ * Depending on how the new GPU VA mapping intersects with the 
>>>existent mappings
>>>+ * of the GPU VA space the &drm_gpuva_ops contain an arbitrary 
>>>amount of unmap
>>>+ * operations, a maximum of two remap operations and a single map 
>>>operation.
>>>+ * The set of operations can also be empty if no operation is 
>>>required, e.g. if
>>>+ * the requested mapping already exists in the exact same way.
>>>+ *
>>>+ * The single map operation, if existent, represents the original 
>>>map operation
>>>+ * requested by the caller. Please note that this operation might 
>>>be altered
>>>+ * comparing it with the original map operation, e.g. because it 
>>>was merged with
>>>+ * an already  existent mapping. Hence, drivers must execute this 
>>>map operation
>>>+ * instead of the original one they passed to 
>>>drm_gpuva_sm_map_ops_create().
>>>+ *
>>>+ * &drm_gpuva_op_unmap contains a 'keep' field, which indicates 
>>>whether the
>>>+ * &drm_gpuva to unmap is physically contiguous with the original 
>>>mapping
>>>+ * request. Optionally, if 'keep' is set, drivers may keep the 
>>>actual page table
>>>+ * entries for this &drm_gpuva, adding the missing page table 
>>>entries only and
>>>+ * update the &drm_gpuva_manager's view of things accordingly.
>>>+ *
>>>+ * Drivers may do the same optimization, namely delta page table 
>>>updates, also
>>>+ * for remap operations. This is possible since 
>>>&drm_gpuva_op_remap consists of
>>>+ * one unmap operation and one or two map operations, such that 
>>>drivers can
>>>+ * derive the page table update delta accordingly.
>>>+ *
>>>+ * Note that there can't be more than two existent mappings to 
>>>split up, one at
>>>+ * the beginning and one at the end of the new mapping, hence there is a
>>>+ * maximum of two remap operations.
>>>+ *
>>>+ * Generally, the DRM GPU VA manager never merges mappings across the
>>>+ * boundaries of &drm_gpuva_regions. This is the case since 
>>>merging between
>>>+ * GPU VA regions would result into unmap and map operations to 
>>>be issued for
>>>+ * both regions involved although the original mapping request 
>>>was referred to
>>>+ * one specific GPU VA region only. Since the other GPU VA 
>>>region, the one not
>>>+ * explicitly requested to be altered, might be in use by the 
>>>GPU, we are not
>>>+ * allowed to issue any map/unmap operations for this region.
>>>+ *
>>>+ * Note that before calling drm_gpuva_sm_map_ops_create() again 
>>>with another
>>>+ * mapping request it is necessary to update the 
>>>&drm_gpuva_manager's view of
>>>+ * the GPU VA space. The previously obtained operations must be 
>>>either fully
>>>+ * processed or completely abandoned.
>>>+ *
>>>+ * To update the &drm_gpuva_manager's view of the GPU VA space
>>>+ * drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
>>>+ * drm_gpuva_destroy_unlocked() should be used.
>>>+ *
>>>+ * Analogue to drm_gpuva_sm_map_ops_create() 
>>>drm_gpuva_sm_unmap_ops_create()
>>>+ * provides drivers a the list of operations to be executed in 
>>>order to unmap
>>>+ * a range of GPU VA space. The logic behind this functions is 
>>>way simpler
>>>+ * though: For all existent mappings enclosed by the given range unmap
>>>+ * operations are created. For mappings which are only partically 
>>>located within
>>>+ * the given range, remap operations are created such that those 
>>>mappings are
>>>+ * split up and re-mapped partically.
>>>+ *
>>>+ * The following paragraph depicts the basic constellations of 
>>>existent GPU VA
>>>+ * mappings, a newly requested mapping and the resulting mappings 
>>>as implemented
>>>+ * by drm_gpuva_sm_map_ops_create()  - it doesn't cover arbitrary 
>>>combinations
>>>+ * of those constellations.
>>>+ *
>>>+ * ::
>>>+ *
>>>+ *    1) Existent mapping is kept.
>>>+ *    ----------------------------
>>>+ *
>>>+ *         0     a     1
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     a     1
>>>+ *    req: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     a     1
>>>+ *    new: |-----------| (bo_offset=n)
>>>+ *
>>>+ *
>>>+ *    2) Existent mapping is replaced.
>>>+ *    --------------------------------
>>>+ *
>>>+ *         0     a     1
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     a     1
>>>+ *    req: |-----------| (bo_offset=m)
>>>+ *
>>>+ *         0     a     1
>>>+ *    new: |-----------| (bo_offset=m)
>>>+ *
>>>+ *
>>>+ *    3) Existent mapping is replaced.
>>>+ *    --------------------------------
>>>+ *
>>>+ *         0     a     1
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     b     1
>>>+ *    req: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     b     1
>>>+ *    new: |-----------| (bo_offset=n)
>>>+ *
>>>+ *
>>>+ *    4) Existent mapping is replaced.
>>>+ *    --------------------------------
>>>+ *
>>>+ *         0  a  1
>>>+ *    old: |-----|       (bo_offset=n)
>>>+ *
>>>+ *         0     a     2
>>>+ *    req: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     a     2
>>>+ *    new: |-----------| (bo_offset=n)
>>>+ *
>>>+ *    Note: We expect to see the same result for a request with a 
>>>different bo
>>>+ *          and/or bo_offset.
>>>+ *
>>>+ *
>>>+ *    5) Existent mapping is split.
>>>+ *    -----------------------------
>>>+ *
>>>+ *         0     a     2
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0  b  1
>>>+ *    req: |-----|       (bo_offset=n)
>>>+ *
>>>+ *         0  b  1  a' 2
>>>+ *    new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
>>>+ *
>>>+ *    Note: We expect to see the same result for a request with a 
>>>different bo
>>>+ *          and/or non-contiguous bo_offset.
>>>+ *
>>>+ *
>>>+ *    6) Existent mapping is kept.
>>>+ *    ----------------------------
>>>+ *
>>>+ *         0     a     2
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0  a  1
>>>+ *    req: |-----|       (bo_offset=n)
>>>+ *
>>>+ *         0     a     2
>>>+ *    new: |-----------| (bo_offset=n)
>>>+ *
>>>+ *
>>>+ *    7) Existent mapping is split.
>>>+ *    -----------------------------
>>>+ *
>>>+ *         0     a     2
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *               1  b  2
>>>+ *    req:       |-----| (bo_offset=m)
>>>+ *
>>>+ *         0  a  1  b  2
>>>+ *    new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
>>>+ *
>>>+ *
>>>+ *    8) Existent mapping is kept.
>>>+ *    ----------------------------
>>>+ *
>>>+ *          0     a     2
>>>+ *    old: |-----------| (bo_offset=n)
>>>+ *
>>>+ *               1  a  2
>>>+ *    req:       |-----| (bo_offset=n+1)
>>>+ *
>>>+ *         0     a     2
>>>+ *    new: |-----------| (bo_offset=n)
>>>+ *
>>>+ *
>>>+ *    9) Existent mapping is split.
>>>+ *    -----------------------------
>>>+ *
>>>+ *         0     a     2
>>>+ *    old: |-----------|       (bo_offset=n)
>>>+ *
>>>+ *               1     b     3
>>>+ *    req:       |-----------| (bo_offset=m)
>>>+ *
>>>+ *         0  a  1     b     3
>>>+ *    new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
>>>+ *
>>>+ *
>>>+ *    10) Existent mapping is merged.
>>>+ *    -------------------------------
>>>+ *
>>>+ *         0     a     2
>>>+ *    old: |-----------|       (bo_offset=n)
>>>+ *
>>>+ *               1     a     3
>>>+ *    req:       |-----------| (bo_offset=n+1)
>>>+ *
>>>+ *         0        a        3
>>>+ *    new: |-----------------| (bo_offset=n)
>>>+ *
>>>+ *
>>>+ *    11) Existent mapping is split.
>>>+ *    ------------------------------
>>>+ *
>>>+ *         0        a        3
>>>+ *    old: |-----------------| (bo_offset=n)
>>>+ *
>>>+ *               1  b  2
>>>+ *    req:       |-----|       (bo_offset=m)
>>>+ *
>>>+ *         0  a  1  b  2  a' 3
>>>+ *    new: |-----|-----|-----| 
>>>(a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
>>>+ *
>>>+ *
>>>+ *    12) Existent mapping is kept.
>>>+ *    -----------------------------
>>>+ *
>>>+ *         0        a        3
>>>+ *    old: |-----------------| (bo_offset=n)
>>>+ *
>>>+ *               1  a  2
>>>+ *    req:       |-----|       (bo_offset=n+1)
>>>+ *
>>>+ *         0        a        3
>>>+ *    old: |-----------------| (bo_offset=n)
>>>+ *
>>>+ *
>>>+ *    13) Existent mapping is replaced.
>>>+ *    ---------------------------------
>>>+ *
>>>+ *               1  a  2
>>>+ *    old:       |-----| (bo_offset=n)
>>>+ *
>>>+ *         0     a     2
>>>+ *    req: |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     a     2
>>>+ *    new: |-----------| (bo_offset=n)
>>>+ *
>>>+ *    Note: We expect to see the same result for a request with a 
>>>different bo
>>>+ *          and/or non-contiguous bo_offset.
>>>+ *
>>>+ *
>>>+ *    14) Existent mapping is replaced.
>>>+ *    ---------------------------------
>>>+ *
>>>+ *               1  a  2
>>>+ *    old:       |-----| (bo_offset=n)
>>>+ *
>>>+ *         0        a       3
>>>+ *    req: |----------------| (bo_offset=n)
>>>+ *
>>>+ *         0        a       3
>>>+ *    new: |----------------| (bo_offset=n)
>>>+ *
>>>+ *    Note: We expect to see the same result for a request with a 
>>>different bo
>>>+ *          and/or non-contiguous bo_offset.
>>>+ *
>>>+ *
>>>+ *    15) Existent mapping is split.
>>>+ *    ------------------------------
>>>+ *
>>>+ *               1     a     3
>>>+ *    old:       |-----------| (bo_offset=n)
>>>+ *
>>>+ *         0     b     2
>>>+ *    req: |-----------|       (bo_offset=m)
>>>+ *
>>>+ *         0     b     2  a' 3
>>>+ *    new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>>>+ *
>>>+ *
>>>+ *    16) Existent mappings are merged.
>>>+ *    ---------------------------------
>>>+ *
>>>+ *         0     a     1
>>>+ *    old: |-----------|                        (bo_offset=n)
>>>+ *
>>>+ *                                2     a     3
>>>+ *    old':                       |-----------| (bo_offset=n+2)
>>>+ *
>>>+ *                    1     a     2
>>>+ *    req:            |-----------|             (bo_offset=n+1)
>>>+ *
>>>+ *                          a
>>>+ *    new: |----------------------------------| (bo_offset=n)
>>>+ */
>>>+
>>>+/**
>>>+ * DOC: Locking
>>>+ *
>>>+ * Generally, the GPU VA manager does not take care of locking 
>>>itself, it is
>>>+ * the drivers responsibility to take care about locking. Drivers 
>>>might want to
>>>+ * protect the following operations: inserting, destroying and iterating
>>>+ * &drm_gpuva and &drm_gpuva_region objects as well as generating 
>>>split and merge
>>>+ * operations.
>>>+ *
>>>+ * The GPU VA manager does take care of the locking of the backing
>>>+ * &drm_gem_object buffers GPU VA lists though, unless the 
>>>provided functions
>>>+ * documentation claims otherwise.
>>>+ */
>>>+
>>>+/**
>>>+ * drm_gpuva_manager_init - initialize a &drm_gpuva_manager
>>>+ * @mgr: pointer to the &drm_gpuva_manager to initialize
>>>+ * @name: the name of the GPU VA space
>>>+ * @start_offset: the start offset of the GPU VA space
>>>+ * @range: the size of the GPU VA space
>>>+ * @reserve_offset: the start of the kernel reserved GPU VA area
>>>+ * @reserve_range: the size of the kernel reserved GPU VA area
>>>+ *
>>>+ * The &drm_gpuva_manager must be initialized with this function 
>>>before use.
>>>+ *
>>>+ * Note that @mgr must be cleared to 0 before calling this 
>>>function. The given
>>>+ * &name is expected to be managed by the surrounding driver structures.
>>>+ */
>>>+void
>>>+drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>>>+               const char *name,
>>>+               u64 start_offset, u64 range,
>>>+               u64 reserve_offset, u64 reserve_range)
>>>+{
>>>+    drm_mm_init(&mgr->va_mm, start_offset, range);
>>>+    drm_mm_init(&mgr->region_mm, start_offset, range);
>>>+
>>>+    mgr->mm_start = start_offset;
>>>+    mgr->mm_range = range;
>>>+
>>>+    mgr->name = name ? name : "unknown";
>>>+
>>>+    memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_mm_node));
>>>+    mgr->kernel_alloc_node.start = reserve_offset;
>>>+    mgr->kernel_alloc_node.size = reserve_range;
>>>+    drm_mm_reserve_node(&mgr->region_mm, &mgr->kernel_alloc_node);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_manager_init);
>>>+
>>>+/**
>>>+ * drm_gpuva_manager_destroy - cleanup a &drm_gpuva_manager
>>>+ * @mgr: pointer to the &drm_gpuva_manager to clean up
>>>+ *
>>>+ * Note that it is a bug to call this function on a manager that still
>>>+ * holds GPU VA mappings.
>>>+ */
>>>+void
>>>+drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
>>>+{
>>>+    mgr->name = NULL;
>>>+    drm_mm_remove_node(&mgr->kernel_alloc_node);
>>>+    drm_mm_takedown(&mgr->va_mm);
>>>+    drm_mm_takedown(&mgr->region_mm);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_manager_destroy);
>>>+
>>>+static struct drm_gpuva_region *
>>>+drm_gpuva_in_region(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
>>>+{
>>>+    struct drm_gpuva_region *reg;
>>>+
>>>+    /* Find the VA region the requested range is strictly 
>>>enclosed by. */
>>>+    drm_gpuva_for_each_region_in_range(reg, mgr, addr, addr + range) {
>>>+        if (reg->node.start <= addr &&
>>>+            reg->node.start + reg->node.size >= addr + range &&
>>>+            &reg->node != &mgr->kernel_alloc_node)
>>>+            return reg;
>>>+    }
>>>+
>>>+    return NULL;
>>>+}
>>>+
>>>+static bool
>>>+drm_gpuva_in_any_region(struct drm_gpuva_manager *mgr, u64 addr, 
>>>u64 range)
>>>+{
>>>+    return !!drm_gpuva_in_region(mgr, addr, range);
>>>+}
>>>+
>>>+/**
>>>+ * drm_gpuva_insert - insert a &drm_gpuva
>>>+ * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>>>+ * @va: the &drm_gpuva to insert
>>>+ * @addr: the start address of the GPU VA
>>>+ * @range: the range of the GPU VA
>>>+ *
>>>+ * Insert a &drm_gpuva with a given address and range into a
>>>+ * &drm_gpuva_manager.
>>>+ *
>>>+ * The function assumes the caller does not hold the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ *
>>>+ * Returns: 0 on success, negative error code on failure.
>>>+ */
>>>+int
>>>+drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>>>+         struct drm_gpuva *va,
>>>+         u64 addr, u64 range)
>>>+{
>>>+    struct drm_gpuva_region *reg;
>>>+    int ret;
>>>+
>>>+    if (!va->gem.obj)
>>>+        return -EINVAL;
>>>+
>>>+    reg = drm_gpuva_in_region(mgr, addr, range);
>>>+    if (!reg)
>>>+        return -EINVAL;
>>>+
>>>+    ret = drm_mm_insert_node_in_range(&mgr->va_mm, &va->node,
>>>+                      range, 0,
>>>+                      0, addr,
>>>+                      addr + range,
>>>+                      DRM_MM_INSERT_LOW|DRM_MM_INSERT_ONCE);
>>>+    if (ret)
>>>+        return ret;
>>>+
>>>+    va->mgr = mgr;
>>>+    va->region = reg;
>>>+
>>>+    return 0;
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_insert);
>>>+
>>>+/**
>>>+ * drm_gpuva_link_locked - link a &drm_gpuva
>>>+ * @va: the &drm_gpuva to link
>>>+ *
>>>+ * This adds the given &va to the GPU VA list of the 
>>>&drm_gem_object it is
>>>+ * associated with.
>>>+ *
>>>+ * The function assumes the caller already holds the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ */
>>>+void
>>>+drm_gpuva_link_locked(struct drm_gpuva *va)
>>>+{
>>>+    lockdep_assert_held(&va->gem.obj->gpuva.mutex);
>>>+    list_add_tail(&va->head, &va->gem.obj->gpuva.list);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_link_locked);
>>>+
>>>+/**
>>>+ * drm_gpuva_link_unlocked - unlink a &drm_gpuva
>>>+ * @va: the &drm_gpuva to unlink
>>>+ *
>>>+ * This adds the given &va to the GPU VA list of the 
>>>&drm_gem_object it is
>>>+ * associated with.
>>>+ *
>>>+ * The function assumes the caller does not hold the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ */
>>>+void
>>>+drm_gpuva_link_unlocked(struct drm_gpuva *va)
>>>+{
>>>+    drm_gem_gpuva_lock(va->gem.obj);
>>>+    drm_gpuva_link_locked(va);
>>>+    drm_gem_gpuva_unlock(va->gem.obj);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_link_unlocked);
>>>+
>>>+/**
>>>+ * drm_gpuva_unlink_locked - unlink a &drm_gpuva
>>>+ * @va: the &drm_gpuva to unlink
>>>+ *
>>>+ * This removes the given &va from the GPU VA list of the 
>>>&drm_gem_object it is
>>>+ * associated with.
>>>+ *
>>>+ * The function assumes the caller already holds the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ */
>>>+void
>>>+drm_gpuva_unlink_locked(struct drm_gpuva *va)
>>>+{
>>>+    lockdep_assert_held(&va->gem.obj->gpuva.mutex);
>>>+    list_del_init(&va->head);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_unlink_locked);
>>>+
>>>+/**
>>>+ * drm_gpuva_unlink_unlocked - unlink a &drm_gpuva
>>>+ * @va: the &drm_gpuva to unlink
>>>+ *
>>>+ * This removes the given &va from the GPU VA list of the 
>>>&drm_gem_object it is
>>>+ * associated with.
>>>+ *
>>>+ * The function assumes the caller does not hold the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ */
>>>+void
>>>+drm_gpuva_unlink_unlocked(struct drm_gpuva *va)
>>>+{
>>>+    drm_gem_gpuva_lock(va->gem.obj);
>>>+    drm_gpuva_unlink_locked(va);
>>>+    drm_gem_gpuva_unlock(va->gem.obj);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_unlink_unlocked);
>>>+
>>>+/**
>>>+ * drm_gpuva_destroy_locked - destroy a &drm_gpuva
>>>+ * @va: the &drm_gpuva to destroy
>>>+ *
>>>+ * This removes the given &va from GPU VA list of the 
>>>&drm_gem_object it is
>>>+ * associated with and removes it from the underlaying range allocator.
>>>+ *
>>>+ * The function assumes the caller already holds the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ */
>>>+void
>>>+drm_gpuva_destroy_locked(struct drm_gpuva *va)
>>>+{
>>>+    lockdep_assert_held(&va->gem.obj->gpuva.mutex);
>>>+
>>>+    list_del(&va->head);
>>>+    drm_mm_remove_node(&va->node);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_destroy_locked);
>>>+
>>>+/**
>>>+ * drm_gpuva_destroy_unlocked - destroy a &drm_gpuva
>>>+ * @va: the &drm_gpuva to destroy
>>>+ *
>>>+ * This removes the given &va from GPU VA list of the 
>>>&drm_gem_object it is
>>>+ * associated with and removes it from the underlaying range allocator.
>>>+ *
>>>+ * The function assumes the caller does not hold the &drm_gem_object's
>>>+ * GPU VA list mutex.
>>>+ */
>>>+void
>>>+drm_gpuva_destroy_unlocked(struct drm_gpuva *va)
>>>+{
>>>+    drm_gem_gpuva_lock(va->gem.obj);
>>>+    list_del(&va->head);
>>>+    drm_gem_gpuva_unlock(va->gem.obj);
>>>+
>>>+    drm_mm_remove_node(&va->node);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_destroy_unlocked);
>>>+
>>>+/**
>>>+ * drm_gpuva_find - find a &drm_gpuva
>>>+ * @mgr: the &drm_gpuva_manager to search in
>>>+ * @addr: the &drm_gpuvas address
>>>+ * @range: the &drm_gpuvas range
>>>+ *
>>>+ * Returns: the &drm_gpuva at a given &addr and with a given &range
>>>+ */
>>>+struct drm_gpuva *
>>>+drm_gpuva_find(struct drm_gpuva_manager *mgr,
>>>+           u64 addr, u64 range)
>>>+{
>>>+    struct drm_gpuva *va;
>>>+
>>>+    drm_gpuva_for_each_va_in_range(va, mgr, addr, range) {
>>>+        if (va->node.start == addr &&
>>>+            va->node.size == range)
>>>+            return va;
>>>+    }
>>>+
>>>+    return NULL;
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_find);
>>>+
>>>+/**
>>>+ * drm_gpuva_find_prev - find the &drm_gpuva before the given address
>>>+ * @mgr: the &drm_gpuva_manager to search in
>>>+ * @start: the given GPU VA's start address
>>>+ *
>>>+ * Find the adjacent &drm_gpuva before the GPU VA with given 
>>>&start address.
>>>+ *
>>>+ * Note that if there is any free space between the GPU VA 
>>>mappings no mapping
>>>+ * is returned.
>>>+ *
>>>+ * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>>>+ */
>>>+struct drm_gpuva *
>>>+drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
>>>+{
>>>+    struct drm_mm_node *node;
>>>+
>>>+    if (start <= mgr->mm_start ||
>>>+        start > (mgr->mm_start + mgr->mm_range))
>>>+        return NULL;
>>>+
>>>+    node = __drm_mm_interval_first(&mgr->va_mm, start - 1, start);
>>>+    if (node == &mgr->va_mm.head_node)
>>>+        return NULL;
>>>+
>>>+    return (struct drm_gpuva *)node;
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_find_prev);
>>>+
>>>+/**
>>>+ * drm_gpuva_find_next - find the &drm_gpuva after the given address
>>>+ * @mgr: the &drm_gpuva_manager to search in
>>>+ * @end: the given GPU VA's end address
>>>+ *
>>>+ * Find the adjacent &drm_gpuva after the GPU VA with given &end 
>>>address.
>>>+ *
>>>+ * Note that if there is any free space between the GPU VA 
>>>mappings no mapping
>>>+ * is returned.
>>>+ *
>>>+ * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>>>+ */
>>>+struct drm_gpuva *
>>>+drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
>>>+{
>>>+    struct drm_mm_node *node;
>>>+
>>>+    if (end < mgr->mm_start ||
>>>+        end >= (mgr->mm_start + mgr->mm_range))
>>>+        return NULL;
>>>+
>>>+    node = __drm_mm_interval_first(&mgr->va_mm, end, end + 1);
>>>+    if (node == &mgr->va_mm.head_node)
>>>+        return NULL;
>>>+
>>>+    return (struct drm_gpuva *)node;
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_find_next);
>>>+
>>>+/**
>>>+ * drm_gpuva_region_insert - insert a &drm_gpuva_region
>>>+ * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>>>+ * @reg: the &drm_gpuva_region to insert
>>>+ * @addr: the start address of the GPU VA
>>>+ * @range: the range of the GPU VA
>>>+ *
>>>+ * Insert a &drm_gpuva_region with a given address and range into a
>>>+ * &drm_gpuva_manager.
>>>+ *
>>>+ * Returns: 0 on success, negative error code on failure.
>>>+ */
>>>+int
>>>+drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
>>>+            struct drm_gpuva_region *reg,
>>>+            u64 addr, u64 range)
>>>+{
>>>+    int ret;
>>>+
>>>+    ret = drm_mm_insert_node_in_range(&mgr->region_mm, &reg->node,
>>>+                      range, 0,
>>>+                      0, addr,
>>>+                      addr + range,
>>>+                      DRM_MM_INSERT_LOW|
>>>+                      DRM_MM_INSERT_ONCE);
>>>+    if (ret)
>>>+        return ret;
>>>+
>>>+    reg->mgr = mgr;
>>>+
>>>+    return 0;
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_region_insert);
>>>+
>>>+/**
>>>+ * drm_gpuva_region_destroy - destroy a &drm_gpuva_region
>>>+ * @mgr: the &drm_gpuva_manager holding the region
>>>+ * @reg: the &drm_gpuva to destroy
>>>+ *
>>>+ * This removes the given &reg from the underlaying range allocator.
>>>+ */
>>>+void
>>>+drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
>>>+             struct drm_gpuva_region *reg)
>>>+{
>>>+    struct drm_gpuva *va;
>>>+
>>>+    drm_gpuva_for_each_va_in_range(va, mgr,
>>>+                       reg->node.start,
>>>+                       reg->node.size) {
>>>+        WARN(1, "GPU VA region must be empty on destroy.\n");
>>>+        return;
>>>+    }
>>>+
>>>+    if (&reg->node == &mgr->kernel_alloc_node) {
>>>+        WARN(1, "Can't destroy kernel reserved region.\n");
>>>+        return;
>>>+    }
>>>+
>>>+    drm_mm_remove_node(&reg->node);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_region_destroy);
>>>+
>>>+/**
>>>+ * drm_gpuva_region_find - find a &drm_gpuva_region
>>>+ * @mgr: the &drm_gpuva_manager to search in
>>>+ * @addr: the &drm_gpuva_regions address
>>>+ * @range: the &drm_gpuva_regions range
>>>+ *
>>>+ * Returns: the &drm_gpuva_region at a given &addr and with a 
>>>given &range
>>>+ */
>>>+struct drm_gpuva_region *
>>>+drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
>>>+              u64 addr, u64 range)
>>>+{
>>>+    struct drm_gpuva_region *reg;
>>>+
>>>+    drm_gpuva_for_each_region_in_range(reg, mgr, addr, addr + range)
>>>+        if (reg->node.start == addr &&
>>>+            reg->node.size == range)
>>>+            return reg;
>>>+
>>>+    return NULL;
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_region_find);
>>>+
>>>+static int
>>>+gpuva_op_map_new(struct drm_gpuva_op **pop,
>>>+         u64 addr, u64 range,
>>>+         struct drm_gem_object *obj, u64 offset)
>>>+{
>>>+    struct drm_gpuva_op *op;
>>>+
>>>+    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>>>+    if (!op)
>>>+        return -ENOMEM;
>>>+
>>>+    op->op = DRM_GPUVA_OP_MAP;
>>>+    op->map.va.addr = addr;
>>>+    op->map.va.range = range;
>>>+    op->map.gem.obj = obj;
>>>+    op->map.gem.offset = offset;
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>+static int
>>>+gpuva_op_remap_new(struct drm_gpuva_op **pop,
>>>+           struct drm_gpuva_op_map *prev,
>>>+           struct drm_gpuva_op_map *next,
>>>+           struct drm_gpuva_op_unmap *unmap)
>>>+{
>>>+    struct drm_gpuva_op *op;
>>>+    struct drm_gpuva_op_remap *r;
>>>+
>>>+    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>>>+    if (!op)
>>>+        return -ENOMEM;
>>>+
>>>+    op->op = DRM_GPUVA_OP_REMAP;
>>>+    r = &op->remap;
>>>+
>>>+    if (prev) {
>>>+        r->prev = kmemdup(prev, sizeof(*prev), GFP_KERNEL);
>>>+        if (!r->prev)
>>>+            goto err_free_op;
>>>+    }
>>>+
>>>+    if (next) {
>>>+        r->next = kmemdup(next, sizeof(*next), GFP_KERNEL);
>>>+        if (!r->next)
>>>+            goto err_free_prev;
>>>+    }
>>>+
>>>+    r->unmap = kmemdup(unmap, sizeof(*unmap), GFP_KERNEL);
>>>+    if (!r->unmap)
>>>+        goto err_free_next;
>>>+
>>>+    return 0;
>>>+
>>>+err_free_next:
>>>+    if (next)
>>>+        kfree(r->next);
>>>+err_free_prev:
>>>+    if (prev)
>>>+        kfree(r->prev);
>>>+err_free_op:
>>>+    kfree(op);
>>>+    *pop = NULL;
>>>+
>>>+    return -ENOMEM;
>>>+}
>>>+
>>>+static int
>>>+gpuva_op_unmap_new(struct drm_gpuva_op **pop,
>>>+           struct drm_gpuva *va, bool merge)
>>>+{
>>>+    struct drm_gpuva_op *op;
>>>+
>>>+    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>>>+    if (!op)
>>>+        return -ENOMEM;
>>>+
>>>+    op->op = DRM_GPUVA_OP_UNMAP;
>>>+    op->unmap.va = va;
>>>+    op->unmap.keep = merge;
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>+#define op_map_new_to_list(_ops, _addr, _range,        \
>>>+               _obj, _offset)        \
>>>+do {                            \
>>>+    struct drm_gpuva_op *op;            \
>>>+                            \
>>>+    ret = gpuva_op_map_new(&op, _addr, _range,    \
>>>+                   _obj, _offset);        \
>>>+    if (ret)                    \
>>>+        goto err_free_ops;            \
>>>+                            \
>>>+    list_add_tail(&op->entry, _ops);        \
>>>+} while (0)
>>>+
>>>+#define op_remap_new_to_list(_ops, _prev, _next,    \
>>>+                 _unmap)            \
>>>+do {                            \
>>>+    struct drm_gpuva_op *op;            \
>>>+                            \
>>>+    ret = gpuva_op_remap_new(&op, _prev, _next,    \
>>>+                 _unmap);        \
>>>+    if (ret)                    \
>>>+        goto err_free_ops;            \
>>>+                            \
>>>+    list_add_tail(&op->entry, _ops);        \
>>>+} while (0)
>>>+
>>>+#define op_unmap_new_to_list(_ops, _gpuva, _merge)    \
>>>+do {                            \
>>>+    struct drm_gpuva_op *op;            \
>>>+                            \
>>>+    ret = gpuva_op_unmap_new(&op, _gpuva, _merge);    \
>>>+    if (ret)                    \
>>>+        goto err_free_ops;            \
>>>+                            \
>>>+    list_add_tail(&op->entry, _ops);        \
>>>+} while (0)
>>>+
>>>+/**
>>>+ * drm_gpuva_sm_map_ops_create - creates the &drm_gpuva_ops to 
>>>split and merge
>>>+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
>>>+ * @req_addr: the start address of the new mapping
>>>+ * @req_range: the range of the new mapping
>>>+ * @req_obj: the &drm_gem_object to map
>>>+ * @req_offset: the offset within the &drm_gem_object
>>>+ *
>>>+ * This function creates a list of operations to perform 
>>>splitting and merging
>>>+ * of existent mapping(s) with the newly requested one.
>>>+ *
>>>+ * The list can be iterated with &drm_gpuva_for_each_op and must 
>>>be processed
>>>+ * in the given order. It can contain map, unmap and remap 
>>>operations, but it
>>>+ * also can be empty if no operation is required, e.g. if the 
>>>requested mapping
>>>+ * already exists is the exact same way.
>>>+ *
>>>+ * There can be an arbitrary amount of unmap operations, a 
>>>maximum of two remap
>>>+ * operations and a single map operation. The latter one, if existent,
>>>+ * represents the original map operation requested by the caller. 
>>>Please note
>>>+ * that the map operation might has been modified, e.g. if it was
>>>+ * merged with an existent mapping.
>>>+ *
>>>+ * Note that before calling this function again with another 
>>>mapping request it
>>>+ * is necessary to update the &drm_gpuva_manager's view of the 
>>>GPU VA space.
>>>+ * The previously obtained operations must be either processed or 
>>>abandoned.
>>>+ * To update the &drm_gpuva_manager's view of the GPU VA space
>>>+ * drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
>>>+ * drm_gpuva_destroy_unlocked() should be used.
>>>+ *
>>>+ * After the caller finished processing the returned 
>>>&drm_gpuva_ops, they must
>>>+ * be freed with &drm_gpuva_ops_free.
>>>+ *
>>>+ * Returns: a pointer to the &drm_gpuva_ops on success, an 
>>>ERR_PTR on failure
>>>+ */
>>>+struct drm_gpuva_ops *
>>>+drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
>>>+                u64 req_addr, u64 req_range,
>>>+                struct drm_gem_object *req_obj, u64 req_offset)
>>>+{
>>>+    struct drm_gpuva_ops *ops;
>>>+    struct drm_gpuva *va, *prev = NULL;
>>>+    u64 req_end = req_addr + req_range;
>>>+    bool skip_pmerge = false, skip_nmerge = false;
>>>+    int ret;
>>>+
>>>+    if (!drm_gpuva_in_any_region(mgr, req_addr, req_range))
>>>+        return ERR_PTR(-EINVAL);
>>>+
>>>+    ops = kzalloc(sizeof(*ops), GFP_KERNEL);
>>>+    if (!ops)
>>>+        return ERR_PTR(-ENOMEM);
>>>+
>>>+    INIT_LIST_HEAD(&ops->list);
>>>+
>>>+    drm_gpuva_for_each_va_in_range(va, mgr, req_addr, req_end) {
>>>+        struct drm_gem_object *obj = va->gem.obj;
>>>+        u64 offset = va->gem.offset;
>>>+        u64 addr = va->node.start;
>>>+        u64 range = va->node.size;
>>>+        u64 end = addr + range;
>>>+
>>>+        /* Generally, we want to skip merging with potential mappings
>>>+         * left and right of the requested one when we found a
>>>+         * collision, since merging happens in this loop already.
>>>+         *
>>>+         * However, there is one exception when the requested mapping
>>>+         * spans into a free VM area. If this is the case we might
>>>+         * still hit the boundary of another mapping before and/or
>>>+         * after the free VM area.
>>>+         */
>>>+        skip_pmerge = true;
>>>+        skip_nmerge = true;
>>>+
>>>+        if (addr == req_addr) {
>>>+            bool merge = obj == req_obj &&
>>>+                     offset == req_offset;
>>>+            if (end == req_end) {
>>>+                if (merge)
>>>+                    goto done;
>>>+
>>>+                op_unmap_new_to_list(&ops->list, va, false);
>>>+                break;
>>>+            }
>>>+
>>>+            if (end < req_end) {
>>>+                skip_nmerge = false;
>>>+                op_unmap_new_to_list(&ops->list, va, merge);
>>>+                goto next;
>>>+            }
>>>+
>>>+            if (end > req_end) {
>>>+                struct drm_gpuva_op_map n = {
>>>+                    .va.addr = req_end,
>>>+                    .va.range = range - req_range,
>>>+                    .gem.obj = obj,
>>>+                    .gem.offset = offset + req_range,
>>>+                };
>>>+                struct drm_gpuva_op_unmap u = { .va = va };
>>>+
>>>+                if (merge)
>>>+                    goto done;
>>>+
>>>+                op_remap_new_to_list(&ops->list, NULL, &n, &u);
>>>+                break;
>>>+            }
>>>+        } else if (addr < req_addr) {
>>>+            u64 ls_range = req_addr - addr;
>>>+            struct drm_gpuva_op_map p = {
>>>+                .va.addr = addr,
>>>+                .va.range = ls_range,
>>>+                .gem.obj = obj,
>>>+                .gem.offset = offset,
>>>+            };
>>>+            struct drm_gpuva_op_unmap u = { .va = va };
>>>+            bool merge = obj == req_obj &&
>>>+                     offset + ls_range == req_offset;
>>>+
>>>+            if (end == req_end) {
>>>+                if (merge)
>>>+                    goto done;
>>>+
>>>+                op_remap_new_to_list(&ops->list, &p, NULL, &u);
>>>+                break;
>>>+            }
>>>+
>>>+            if (end < req_end) {
>>>+                u64 new_addr = addr;
>>>+                u64 new_range = req_range + ls_range;
>>>+                u64 new_offset = offset;
>>>+
>>>+                /* We validated that the requested mapping is
>>>+                 * within a single VA region already.
>>>+                 * Since it overlaps the current mapping (which
>>>+                 * can't cross a VA region boundary) we can be
>>>+                 * sure that we're still within the boundaries
>>>+                 * of the same VA region after merging.
>>>+                 */
>>>+                if (merge) {
>>>+                    req_offset = new_offset;
>>>+                    req_addr = new_addr;
>>>+                    req_range = new_range;
>>>+                    op_unmap_new_to_list(&ops->list, va, true);
>>>+                    goto next;
>>>+                }
>>>+
>>>+                op_remap_new_to_list(&ops->list, &p, NULL, &u);
>>>+                goto next;
>>>+            }
>>>+
>>>+            if (end > req_end) {
>>>+                struct drm_gpuva_op_map n = {
>>>+                    .va.addr = req_end,
>>>+                    .va.range = end - req_end,
>>>+                    .gem.obj = obj,
>>>+                    .gem.offset = offset + ls_range +
>>>+                              req_range,
>>>+                };
>>>+
>>>+                if (merge)
>>>+                    goto done;
>>>+
>>>+                op_remap_new_to_list(&ops->list, &p, &n, &u);
>>>+                break;
>>>+            }
>>>+        } else if (addr > req_addr) {
>>>+            bool merge = obj == req_obj &&
>>>+                     offset == req_offset +
>>>+                           (addr - req_addr);
>>>+            if (!prev)
>>>+                skip_pmerge = false;
>>>+
>>>+            if (end == req_end) {
>>>+                op_unmap_new_to_list(&ops->list, va, merge);
>>>+                break;
>>>+            }
>>>+
>>>+            if (end < req_end) {
>>>+                skip_nmerge = false;
>>>+                op_unmap_new_to_list(&ops->list, va, merge);
>>>+                goto next;
>>>+            }
>>>+
>>>+            if (end > req_end) {
>>>+                struct drm_gpuva_op_map n = {
>>>+                    .va.addr = req_end,
>>>+                    .va.range = end - req_end,
>>>+                    .gem.obj = obj,
>>>+                    .gem.offset = offset + req_end - addr,
>>>+                };
>>>+                struct drm_gpuva_op_unmap u = { .va = va };
>>>+                u64 new_end = end;
>>>+                u64 new_range = new_end - req_addr;
>>>+
>>>+                /* We validated that the requested mapping is
>>>+                 * within a single VA region already.
>>>+                 * Since it overlaps the current mapping (which
>>>+                 * can't cross a VA region boundary) we can be
>>>+                 * sure that we're still within the boundaries
>>>+                 * of the same VA region after merging.
>>>+                 */
>>>+                if (merge) {
>>>+                    req_end = new_end;
>>>+                    req_range = new_range;
>>>+                    op_unmap_new_to_list(&ops->list, va, true);
>>>+                    break;
>>>+                }
>>>+
>>>+                op_remap_new_to_list(&ops->list, NULL, &n, &u);
>>>+                break;
>>>+            }
>>>+        }
>>>+next:
>>>+        prev = va;
>>>+    }
>>>+
>>>+    va = skip_pmerge ? NULL : drm_gpuva_find_prev(mgr, req_addr);
>>>+    if (va) {
>>>+        struct drm_gem_object *obj = va->gem.obj;
>>>+        u64 offset = va->gem.offset;
>>>+        u64 addr = va->node.start;
>>>+        u64 range = va->node.size;
>>>+        u64 new_offset = offset;
>>>+        u64 new_addr = addr;
>>>+        u64 new_range = req_range + range;
>>>+        bool merge = obj == req_obj &&
>>>+                 offset + range == req_offset;
>>>+
>>>+        /* Don't merge over VA region boundaries. */
>>>+        merge &= drm_gpuva_in_any_region(mgr, new_addr, new_range);
>>>+        if (merge) {
>>>+            op_unmap_new_to_list(&ops->list, va, true);
>>>+
>>>+            req_offset = new_offset;
>>>+            req_addr = new_addr;
>>>+            req_range = new_range;
>>>+        }
>>>+    }
>>>+
>>>+    va = skip_nmerge ? NULL : drm_gpuva_find_next(mgr, req_end);
>>>+    if (va) {
>>>+        struct drm_gem_object *obj = va->gem.obj;
>>>+        u64 offset = va->gem.offset;
>>>+        u64 addr = va->node.start;
>>>+        u64 range = va->node.size;
>>>+        u64 end = addr + range;
>>>+        u64 new_range = req_range + range;
>>>+        u64 new_end = end;
>>>+        bool merge = obj == req_obj &&
>>>+                 offset == req_offset + req_range;
>>>+
>>>+        /* Don't merge over VA region boundaries. */
>>>+        merge &= drm_gpuva_in_any_region(mgr, req_addr, new_range);
>>>+        if (merge) {
>>>+            op_unmap_new_to_list(&ops->list, va, true);
>>>+
>>>+            req_range = new_range;
>>>+            req_end = new_end;
>>>+        }
>>>+    }
>>>+
>>>+    op_map_new_to_list(&ops->list,
>>>+               req_addr, req_range,
>>>+               req_obj, req_offset);
>>>+
>>>+done:
>>>+    return ops;
>>>+
>>>+err_free_ops:
>>>+    drm_gpuva_ops_free(ops);
>>>+    return ERR_PTR(ret);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_sm_map_ops_create);
>>>+
>>>+#undef op_map_new_to_list
>>>+#undef op_remap_new_to_list
>>>+#undef op_unmap_new_to_list
>>>+
>>>+/**
>>>+ * drm_gpuva_sm_unmap_ops_create - creates the &drm_gpuva_ops to 
>>>split on unmap
>>>+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
>>>+ * @req_addr: the start address of the range to unmap
>>>+ * @req_range: the range of the mappings to unmap
>>>+ *
>>>+ * This function creates a list of operations to perform 
>>>unmapping and, if
>>>+ * required, splitting of the mappings overlapping the unmap range.
>>>+ *
>>>+ * The list can be iterated with &drm_gpuva_for_each_op and must 
>>>be processed
>>>+ * in the given order. It can contain unmap and remap operations, 
>>>depending on
>>>+ * whether there are actual overlapping mappings to split.
>>>+ *
>>>+ * There can be an arbitrary amount of unmap operations and a 
>>>maximum of two
>>>+ * remap operations.
>>>+ *
>>>+ * Note that before calling this function again with another 
>>>range to unmap it
>>>+ * is necessary to update the &drm_gpuva_manager's view of the 
>>>GPU VA space.
>>>+ * The previously obtained operations must be processed or abandoned.
>>>+ * To update the &drm_gpuva_manager's view of the GPU VA space
>>>+ * drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
>>>+ * drm_gpuva_destroy_unlocked() should be used.
>>>+ *
>>>+ * After the caller finished processing the returned 
>>>&drm_gpuva_ops, they must
>>>+ * be freed with &drm_gpuva_ops_free.
>>>+ *
>>>+ * Returns: a pointer to the &drm_gpuva_ops on success, an 
>>>ERR_PTR on failure
>>>+ */
>>>+struct drm_gpuva_ops *
>>>+drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
>>>+                  u64 req_addr, u64 req_range)
>>>+{
>>>+    struct drm_gpuva_ops *ops;
>>>+    struct drm_gpuva_op *op;
>>>+    struct drm_gpuva_op_remap *r;
>>>+    struct drm_gpuva *va;
>>>+    u64 req_end = req_addr + req_range;
>>>+    int ret;
>>>+
>>>+    ops = kzalloc(sizeof(*ops), GFP_KERNEL);
>>>+    if (!ops)
>>>+        return ERR_PTR(-ENOMEM);
>>>+
>>>+    INIT_LIST_HEAD(&ops->list);
>>>+
>>>+    drm_gpuva_for_each_va_in_range(va, mgr, req_addr, req_end) {
>>>+        struct drm_gem_object *obj = va->gem.obj;
>>>+        u64 offset = va->gem.offset;
>>>+        u64 addr = va->node.start;
>>>+        u64 range = va->node.size;
>>>+        u64 end = addr + range;
>>>+
>>>+        op = kzalloc(sizeof(*op), GFP_KERNEL);
>>>+        if (!op) {
>>>+            ret = -ENOMEM;
>>>+            goto err_free_ops;
>>>+        }
>>>+
>>>+        r = &op->remap;
>>>+
>>>+        if (addr < req_addr) {
>>>+            r->prev = kzalloc(sizeof(*r->prev), GFP_KERNEL);
>>>+            if (!r->prev) {
>>>+                ret = -ENOMEM;
>>>+                goto err_free_op;
>>>+            }
>>>+
>>>+            r->prev->va.addr = addr;
>>>+            r->prev->va.range = req_addr - addr;
>>>+            r->prev->gem.obj = obj;
>>>+            r->prev->gem.offset = offset;
>>>+        }
>>>+
>>>+        if (end > req_end) {
>>>+            r->next = kzalloc(sizeof(*r->next), GFP_KERNEL);
>>>+            if (!r->next) {
>>>+                ret = -ENOMEM;
>>>+                goto err_free_prev;
>>>+            }
>>>+
>>>+            r->next->va.addr = req_end;
>>>+            r->next->va.range = end - req_end;
>>>+            r->next->gem.obj = obj;
>>>+            r->next->gem.offset = offset + (req_end - addr);
>>>+        }
>>>+
>>>+        if (op->remap.prev || op->remap.next) {
>>>+            op->op = DRM_GPUVA_OP_REMAP;
>>>+            r->unmap = kzalloc(sizeof(*r->unmap), GFP_KERNEL);
>>>+            if (!r->unmap) {
>>>+                ret = -ENOMEM;
>>>+                goto err_free_next;
>>>+            }
>>>+
>>>+            r->unmap->va = va;
>>>+        } else {
>>>+            op->op = DRM_GPUVA_OP_UNMAP;
>>>+            op->unmap.va = va;
>>>+        }
>>>+
>>>+        list_add_tail(&op->entry, &ops->list);
>>>+    }
>>>+
>>>+    return ops;
>>>+
>>>+err_free_next:
>>>+    if (r->next)
>>>+        kfree(r->next);
>>>+err_free_prev:
>>>+    if (r->prev)
>>>+        kfree(r->prev);
>>>+err_free_op:
>>>+    kfree(op);
>>>+err_free_ops:
>>>+    drm_gpuva_ops_free(ops);
>>>+    return ERR_PTR(ret);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_sm_unmap_ops_create);
>>>+
>>>+/**
>>>+ * drm_gpuva_ops_free - free the given &drm_gpuva_ops
>>>+ * @ops: the &drm_gpuva_ops to free
>>>+ *
>>>+ * Frees the given &drm_gpuva_ops structure including all the ops 
>>>associated
>>>+ * with it.
>>>+ */
>>>+void
>>>+drm_gpuva_ops_free(struct drm_gpuva_ops *ops)
>>>+{
>>>+    struct drm_gpuva_op *op, *next;
>>>+
>>>+    drm_gpuva_for_each_op_safe(op, next, ops) {
>>>+        list_del(&op->entry);
>>>+        if (op->op == DRM_GPUVA_OP_REMAP) {
>>>+            if (op->remap.prev)
>>>+                kfree(op->remap.prev);
>>>+
>>>+            if (op->remap.next)
>>>+                kfree(op->remap.next);
>>>+
>>>+            kfree(op->remap.unmap);
>>>+        }
>>>+        kfree(op);
>>>+    }
>>>+
>>>+    kfree(ops);
>>>+}
>>>+EXPORT_SYMBOL(drm_gpuva_ops_free);
>>>diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>index d7c521e8860f..6feacd93aca6 100644
>>>--- a/include/drm/drm_drv.h
>>>+++ b/include/drm/drm_drv.h
>>>@@ -104,6 +104,12 @@ enum drm_driver_feature {
>>>     * acceleration should be handled by two drivers that are 
>>>connected using auxiliary bus.
>>>     */
>>>    DRIVER_COMPUTE_ACCEL            = BIT(7),
>>>+    /**
>>>+     * @DRIVER_GEM_GPUVA:
>>>+     *
>>>+     * Driver supports user defined GPU VA bindings for GEM objects.
>>>+     */
>>>+    DRIVER_GEM_GPUVA        = BIT(8),
>>>
>>>    /* IMPORTANT: Below are all the legacy flags, add new ones above. */
>>>
>>>diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>index 772a4adf5287..4a3679034966 100644
>>>--- a/include/drm/drm_gem.h
>>>+++ b/include/drm/drm_gem.h
>>>@@ -36,6 +36,8 @@
>>>
>>>#include <linux/kref.h>
>>>#include <linux/dma-resv.h>
>>>+#include <linux/list.h>
>>>+#include <linux/mutex.h>
>>>
>>>#include <drm/drm_vma_manager.h>
>>>
>>>@@ -337,6 +339,17 @@ struct drm_gem_object {
>>>     */
>>>    struct dma_resv _resv;
>>>
>>>+    /**
>>>+     * @gpuva:
>>>+     *
>>>+     * Provides the list and list mutex of GPU VAs attached to this
>>>+     * GEM object.
>>>+     */
>>>+    struct {
>>>+        struct list_head list;
>>>+        struct mutex mutex;
>>>+    } gpuva;
>>>+
>>>    /**
>>>     * @funcs:
>>>     *
>>>@@ -479,4 +492,66 @@ void drm_gem_lru_move_tail(struct drm_gem_lru 
>>>*lru, struct drm_gem_object *obj);
>>>unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned 
>>>nr_to_scan,
>>>                   bool (*shrink)(struct drm_gem_object *obj));
>>>
>>>+/**
>>>+ * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
>>>+ * @obj: the &drm_gem_object
>>>+ *
>>>+ * This initializes the &drm_gem_object's &drm_gpuva list and the mutex
>>>+ * protecting it.
>>>+ *
>>>+ * Calling this function is only necessary for drivers intending 
>>>to support the
>>>+ * &drm_driver_feature DRIVER_GEM_GPUVA.
>>>+ */
>>>+static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>>>+{
>>>+    INIT_LIST_HEAD(&obj->gpuva.list);
>>>+    mutex_init(&obj->gpuva.mutex);
>>>+}
>>>+
>>>+/**
>>>+ * drm_gem_gpuva_lock - lock the GEM's gpuva list mutex
>>>+ * @obj: the &drm_gem_object
>>>+ *
>>>+ * This unlocks the mutex protecting the &drm_gem_object's 
>>>&drm_gpuva list.
>>>+ */
>>>+static inline void drm_gem_gpuva_lock(struct drm_gem_object *obj)
>>>+{
>>>+    mutex_lock(&obj->gpuva.mutex);
>>>+}
>>>+
>>>+/**
>>>+ * drm_gem_gpuva_unlock - unlock the GEM's gpuva list mutex
>>>+ * @obj: the &drm_gem_object
>>>+ *
>>>+ * This unlocks the mutex protecting the &drm_gem_object's 
>>>&drm_gpuva list.
>>>+ */
>>>+static inline void drm_gem_gpuva_unlock(struct drm_gem_object *obj)
>>>+{
>>>+    mutex_unlock(&obj->gpuva.mutex);
>>>+}
>>>+
>>>+/**
>>>+ * drm_gem_for_each_gpuva - iternator to walk over a list of gpuvas
>>>+ * @entry: &drm_gpuva structure to assign to in each iteration step
>>>+ * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
>>>+ *
>>>+ * This iterator walks over all &drm_gpuva structures associated 
>>>with the
>>>+ * &drm_gpuva_manager.
>>>+ */
>>>+#define drm_gem_for_each_gpuva(entry, obj) \
>>>+    list_for_each_entry(entry, &obj->gpuva.list, head)
>>>+
>>>+/**
>>>+ * drm_gem_for_each_gpuva_safe - iternator to safely walk over a 
>>>list of gpuvas
>>>+ * @entry: &drm_gpuva structure to assign to in each iteration step
>>>+ * @next: &next &drm_gpuva to store the next step
>>>+ * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
>>>+ *
>>>+ * This iterator walks over all &drm_gpuva structures associated 
>>>with the
>>>+ * &drm_gem_object. It is implemented with 
>>>list_for_each_entry_safe(), hence
>>>+ * it is save against removal of elements.
>>>+ */
>>>+#define drm_gem_for_each_gpuva_safe(entry, next, obj) \
>>>+    list_for_each_entry_safe(entry, next, &obj->gpuva.list, head)
>>>+
>>>#endif /* __DRM_GEM_H__ */
>>>diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
>>>new file mode 100644
>>>index 000000000000..adeb0c916e91
>>>--- /dev/null
>>>+++ b/include/drm/drm_gpuva_mgr.h
>>>@@ -0,0 +1,527 @@
>>>+// SPDX-License-Identifier: GPL-2.0
>>>+
>>>+#ifndef __DRM_GPUVA_MGR_H__
>>>+#define __DRM_GPUVA_MGR_H__
>>>+
>>>+/*
>>>+ * Copyright (c) 2022 Red Hat.
>>>+ *
>>>+ * Permission is hereby granted, free of charge, to any person 
>>>obtaining a
>>>+ * copy of this software and associated documentation files (the 
>>>"Software"),
>>>+ * to deal in the Software without restriction, including without 
>>>limitation
>>>+ * the rights to use, copy, modify, merge, publish, distribute, 
>>>sublicense,
>>>+ * and/or sell copies of the Software, and to permit persons to whom the
>>>+ * Software is furnished to do so, subject to the following conditions:
>>>+ *
>>>+ * The above copyright notice and this permission notice shall be 
>>>included in
>>>+ * all copies or substantial portions of the Software.
>>>+ *
>>>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>KIND, EXPRESS OR
>>>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>MERCHANTABILITY,
>>>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>>EVENT SHALL
>>>+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>DAMAGES OR
>>>+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>+ * OTHER DEALINGS IN THE SOFTWARE.
>>>+ */
>>>+
>>>+#include <drm/drm_mm.h>
>>>+#include <linux/mm.h>
>>>+#include <linux/rbtree.h>
>>>+#include <linux/spinlock.h>
>>>+#include <linux/types.h>
>>>+
>>>+struct drm_gpuva_region;
>>>+struct drm_gpuva;
>>>+struct drm_gpuva_ops;
>>>+
>>>+/**
>>>+ * struct drm_gpuva_manager - DRM GPU VA Manager
>>>+ *
>>>+ * The DRM GPU VA Manager keeps track of a GPU's virtual address 
>>>space by using
>>>+ * the &drm_mm range allocator. Typically, this structure is 
>>>embedded in bigger
>>>+ * driver structures.
>>>+ *
>>>+ * Drivers can pass addresses and ranges in an arbitrary unit, 
>>>e.g. bytes or
>>>+ * pages.
>>>+ *
>>>+ * There should be one manager instance per GPU virtual address space.
>>>+ */
>>>+struct drm_gpuva_manager {
>>>+    /**
>>>+     * @name: the name of the DRM GPU VA space
>>>+     */
>>>+    const char *name;
>>>+
>>>+    /**
>>>+     * @mm_start: start of the VA space
>>>+     */
>>>+    u64 mm_start;
>>>+
>>>+    /**
>>>+     * @mm_range: length of the VA space
>>>+     */
>>>+    u64 mm_range;
>>>+
>>>+    /**
>>>+     * @region_mm: the &drm_mm range allocator to track GPU VA regions
>>>+     */
>>>+    struct drm_mm region_mm;
>>>+
>>>+    /**
>>>+     * @va_mm: the &drm_mm range allocator to track GPU VA mappings
>>>+     */
>>>+    struct drm_mm va_mm;
>>>+
>>>+    /**
>>>+     * @kernel_alloc_node:
>>>+     *
>>>+     * &drm_mm_node representing the address space cutout reserved for
>>>+     * the kernel
>>>+     */
>>>+    struct drm_mm_node kernel_alloc_node;
>>>+};
>>>+
>>>+void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>>>+                const char *name,
>>>+                u64 start_offset, u64 range,
>>>+                u64 reserve_offset, u64 reserve_range);
>>>+void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
>>>+
>>>+/**
>>>+ * struct drm_gpuva_region - structure to track a portion of GPU 
>>>VA space
>>>+ *
>>>+ * This structure represents a portion of a GPUs VA space and is 
>>>associated
>>>+ * with a &drm_gpuva_manager. Internally it is based on a &drm_mm_node.
>>>+ *
>>>+ * GPU VA mappings, represented by &drm_gpuva objects, are 
>>>restricted to be
>>>+ * placed within a &drm_gpuva_region.
>>>+ */
>>>+struct drm_gpuva_region {
>>>+    /**
>>>+     * @node: the &drm_mm_node to track the GPU VA region
>>>+     */
>>>+    struct drm_mm_node node;
>>>+
>>>+    /**
>>>+     * @mgr: the &drm_gpuva_manager this object is associated with
>>>+     */
>>>+    struct drm_gpuva_manager *mgr;
>>>+
>>>+    /**
>>>+     * @sparse: indicates whether this region is sparse
>>>+     */
>>>+    bool sparse;
>>>+};
>>>+
>>>+struct drm_gpuva_region *
>>>+drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
>>>+              u64 addr, u64 range);
>>>+int drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
>>>+                struct drm_gpuva_region *reg,
>>>+                u64 addr, u64 range);
>>>+void drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
>>>+                  struct drm_gpuva_region *reg);
>>>+
>>>+int drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>>>+             struct drm_gpuva *va,
>>>+             u64 addr, u64 range);
>>>+/**
>>>+ * drm_gpuva_for_each_region_in_range - iternator to walk over a 
>>>range of nodes
>>>+ * @node__: &drm_gpuva_region structure to assign to in each 
>>>iteration step
>>>+ * @gpuva__: &drm_gpuva_manager structure to walk
>>>+ * @start__: starting offset, the first node will overlap this
>>>+ * @end__: ending offset, the last node will start before this 
>>>(but may overlap)
>>>+ *
>>>+ * This iterator walks over all nodes in the range allocator that lie
>>>+ * between @start and @end. It is implemented similarly to 
>>>list_for_each(),
>>>+ * but is using &drm_mm's internal interval tree to accelerate 
>>>the search for
>>>+ * the starting node, and hence isn't safe against removal of 
>>>elements. It
>>>+ * assumes that @end is within (or is the upper limit of) the 
>>>&drm_gpuva_manager.
>>>+ * If [@start, @end] are beyond the range of the &drm_gpuva_manager, the
>>>+ * iterator may walk over the special _unallocated_ 
>>>&drm_mm.head_node of the
>>>+ * backing &drm_mm, and may even continue indefinitely.
>>>+ */
>>>+#define drm_gpuva_for_each_region_in_range(node__, gpuva__, 
>>>start__, end__) \
>>>+    for (node__ = (struct drm_gpuva_region 
>>>*)__drm_mm_interval_first(&(gpuva__)->region_mm, \
>>>+                                     (start__), (end__)-1); \
>>>+         node__->node.start < (end__); \
>>>+         node__ = (struct drm_gpuva_region 
>>>*)list_next_entry(&node__->node, node_list))
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_region - iternator to walk over a range of nodes
>>>+ * @entry: &drm_gpuva_region structure to assign to in each 
>>>iteration step
>>>+ * @gpuva: &drm_gpuva_manager structure to walk
>>>+ *
>>>+ * This iterator walks over all &drm_gpuva_region structures 
>>>associated with the
>>>+ * &drm_gpuva_manager.
>>>+ */
>>>+#define drm_gpuva_for_each_region(entry, gpuva) \
>>>+    list_for_each_entry(entry, drm_mm_nodes(&(gpuva)->region_mm), 
>>>node.node_list)
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_region_safe - iternator to safely walk over 
>>>a range of
>>>+ * nodes
>>>+ * @entry: &drm_gpuva_region structure to assign to in each 
>>>iteration step
>>>+ * @next: &next &drm_gpuva_region to store the next step
>>>+ * @gpuva: &drm_gpuva_manager structure to walk
>>>+ *
>>>+ * This iterator walks over all &drm_gpuva_region structures 
>>>associated with the
>>>+ * &drm_gpuva_manager. It is implemented with 
>>>list_for_each_safe(), so save
>>>+ * against removal of elements.
>>>+ */
>>>+#define drm_gpuva_for_each_region_safe(entry, next, gpuva) \
>>>+    list_for_each_entry_safe(entry, next, 
>>>drm_mm_nodes(&(gpuva)->region_mm), node.node_list)
>>>+
>>>+
>>>+/**
>>>+ * enum drm_gpuva_flags - flags for struct drm_gpuva
>>>+ */
>>>+enum drm_gpuva_flags {
>>>+    /**
>>>+     * @DRM_GPUVA_SWAPPED: flag indicating that the &drm_gpuva is 
>>>swapped
>>>+     */
>>>+    DRM_GPUVA_SWAPPED = (1 << 0),
>>>+};
>>>+
>>>+/**
>>>+ * struct drm_gpuva - structure to track a GPU VA mapping
>>>+ *
>>>+ * This structure represents a GPU VA mapping and is associated with a
>>>+ * &drm_gpuva_manager. Internally it is based on a &drm_mm_node.
>>>+ *
>>>+ * Typically, this structure is embedded in bigger driver structures.
>>>+ */
>>>+struct drm_gpuva {
>>>+    /**
>>>+     * @node: the &drm_mm_node to track the GPU VA mapping
>>>+     */
>>>+    struct drm_mm_node node;
>>>+
>>>+    /**
>>>+     * @mgr: the &drm_gpuva_manager this object is associated with
>>>+     */
>>>+    struct drm_gpuva_manager *mgr;
>>>+
>>>+    /**
>>>+     * @region: the &drm_gpuva_region the &drm_gpuva is mapped in
>>>+     */
>>>+    struct drm_gpuva_region *region;
>>>+
>>>+    /**
>>>+     * @head: the &list_head to attach this object to a &drm_gem_object
>>>+     */
>>>+    struct list_head head;
>>>+
>>>+    /**
>>>+     * @flags: the &drm_gpuva_flags for this mapping
>>>+     */
>>>+    enum drm_gpuva_flags flags;
>>>+
>>>+    /**
>>>+     * @gem: structure containing the &drm_gem_object and it's offset
>>>+     */
>>>+    struct {
>>>+        /**
>>>+         * @offset: the offset within the &drm_gem_object
>>>+         */
>>>+        u64 offset;
>>>+
>>>+        /**
>>>+         * @obj: the mapped &drm_gem_object
>>>+         */
>>>+        struct drm_gem_object *obj;
>>>+    } gem;
>>>+};
>>>+
>>>+void drm_gpuva_link_locked(struct drm_gpuva *va);
>>>+void drm_gpuva_link_unlocked(struct drm_gpuva *va);
>>>+void drm_gpuva_unlink_locked(struct drm_gpuva *va);
>>>+void drm_gpuva_unlink_unlocked(struct drm_gpuva *va);
>>>+
>>>+void drm_gpuva_destroy_locked(struct drm_gpuva *va);
>>>+void drm_gpuva_destroy_unlocked(struct drm_gpuva *va);
>>>+
>>>+struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
>>>+                 u64 addr, u64 range);
>>>+struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager 
>>>*mgr, u64 start);
>>>+struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager 
>>>*mgr, u64 end);
>>>+
>>>+/**
>>>+ * drm_gpuva_swap - sets whether the backing BO of this 
>>>&drm_gpuva is swapped
>>>+ * @va: the &drm_gpuva to set the swap flag of
>>>+ * @swap: indicates whether the &drm_gpuva is swapped
>>>+ */
>>>+static inline void drm_gpuva_swap(struct drm_gpuva *va, bool swap)
>>>+{
>>>+    if (swap)
>>>+        va->flags |= DRM_GPUVA_SWAPPED;
>>>+    else
>>>+        va->flags &= ~DRM_GPUVA_SWAPPED;
>>>+}
>>>+
>>>+/**
>>>+ * drm_gpuva_swapped - indicates whether the backing BO of this 
>>>&drm_gpuva
>>>+ * is swapped
>>>+ * @va: the &drm_gpuva to check
>>>+ */
>>>+static inline bool drm_gpuva_swapped(struct drm_gpuva *va)
>>>+{
>>>+    return va->flags & DRM_GPUVA_SWAPPED;
>>>+}
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_va_in_range - iternator to walk over a 
>>>range of nodes
>>>+ * @node__: &drm_gpuva structure to assign to in each iteration step
>>>+ * @gpuva__: &drm_gpuva_manager structure to walk
>>>+ * @start__: starting offset, the first node will overlap this
>>>+ * @end__: ending offset, the last node will start before this 
>>>(but may overlap)
>>>+ *
>>>+ * This iterator walks over all nodes in the range allocator that lie
>>>+ * between @start and @end. It is implemented similarly to 
>>>list_for_each(),
>>>+ * but is using &drm_mm's internal interval tree to accelerate 
>>>the search for
>>>+ * the starting node, and hence isn't safe against removal of 
>>>elements. It
>>>+ * assumes that @end is within (or is the upper limit of) the 
>>>&drm_gpuva_manager.
>>>+ * If [@start, @end] are beyond the range of the &drm_gpuva_manager, the
>>>+ * iterator may walk over the special _unallocated_ 
>>>&drm_mm.head_node of the
>>>+ * backing &drm_mm, and may even continue indefinitely.
>>>+ */
>>>+#define drm_gpuva_for_each_va_in_range(node__, gpuva__, start__, 
>>>end__) \
>>>+    for (node__ = (struct drm_gpuva 
>>>*)__drm_mm_interval_first(&(gpuva__)->va_mm, \
>>>+                                  (start__), (end__)-1); \
>>>+         node__->node.start < (end__); \
>>>+         node__ = (struct drm_gpuva 
>>>*)list_next_entry(&node__->node, node_list))
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_va - iternator to walk over a range of nodes
>>>+ * @entry: &drm_gpuva structure to assign to in each iteration step
>>>+ * @gpuva: &drm_gpuva_manager structure to walk
>>>+ *
>>>+ * This iterator walks over all &drm_gpuva structures associated 
>>>with the
>>>+ * &drm_gpuva_manager.
>>>+ */
>>>+#define drm_gpuva_for_each_va(entry, gpuva) \
>>>+    list_for_each_entry(entry, drm_mm_nodes(&(gpuva)->va_mm), 
>>>node.node_list)
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_va_safe - iternator to safely walk over a range of
>>>+ * nodes
>>>+ * @entry: &drm_gpuva structure to assign to in each iteration step
>>>+ * @next: &next &drm_gpuva to store the next step
>>>+ * @gpuva: &drm_gpuva_manager structure to walk
>>>+ *
>>>+ * This iterator walks over all &drm_gpuva structures associated 
>>>with the
>>>+ * &drm_gpuva_manager. It is implemented with 
>>>list_for_each_safe(), so save
>>>+ * against removal of elements.
>>>+ */
>>>+#define drm_gpuva_for_each_va_safe(entry, next, gpuva) \
>>>+    list_for_each_entry_safe(entry, next, 
>>>drm_mm_nodes(&(gpuva)->va_mm), node.node_list)
>>>+
>>>+/**
>>>+ * enum drm_gpuva_op_type - GPU VA operation type
>>>+ *
>>>+ * Operations to alter the GPU VA mappings tracked by the 
>>>&drm_gpuva_manager
>>>+ * can be map, remap or unmap operations.
>>>+ */
>>>+enum drm_gpuva_op_type {
>>>+    /**
>>>+     * @DRM_GPUVA_OP_MAP: the map op type
>>>+     */
>>>+    DRM_GPUVA_OP_MAP,
>>>+
>>>+    /**
>>>+     * @DRM_GPUVA_OP_REMAP: the remap op type
>>>+     */
>>>+    DRM_GPUVA_OP_REMAP,
>>>+
>>>+    /**
>>>+     * @DRM_GPUVA_OP_UNMAP: the unmap op type
>>>+     */
>>>+    DRM_GPUVA_OP_UNMAP,
>>>+};
>>>+
>>>+/**
>>>+ * struct drm_gpuva_op_map - GPU VA map operation
>>>+ *
>>>+ * This structure represents a single map operation generated by the
>>>+ * DRM GPU VA manager.
>>>+ */
>>>+struct drm_gpuva_op_map {
>>>+    /**
>>>+     * @va: structure containing address and range of a map
>>>+     * operation
>>>+     */
>>>+    struct {
>>>+        /**
>>>+         * @addr: the base address of the new mapping
>>>+         */
>>>+        u64 addr;
>>>+
>>>+        /**
>>>+         * @range: the range of the new mapping
>>>+         */
>>>+        u64 range;
>>>+    } va;
>>>+
>>>+    /**
>>>+     * @gem: structure containing the &drm_gem_object and it's offset
>>>+     */
>>>+    struct {
>>>+        /**
>>>+         * @offset: the offset within the &drm_gem_object
>>>+         */
>>>+        u64 offset;
>>>+
>>>+        /**
>>>+         * @obj: the &drm_gem_object to map
>>>+         */
>>>+        struct drm_gem_object *obj;
>>>+    } gem;
>>>+};
>>>+
>>>+/**
>>>+ * struct drm_gpuva_op_unmap - GPU VA unmap operation
>>>+ *
>>>+ * This structure represents a single unmap operation generated by the
>>>+ * DRM GPU VA manager.
>>>+ */
>>>+struct drm_gpuva_op_unmap {
>>>+    /**
>>>+     * @va: the &drm_gpuva to unmap
>>>+     */
>>>+    struct drm_gpuva *va;
>>>+
>>>+    /**
>>>+     * @keep:
>>>+     *
>>>+     * Indicates whether this &drm_gpuva is physically contiguous 
>>>with the
>>>+     * original mapping request.
>>>+     *
>>>+     * Optionally, if &keep is set, drivers may keep the actual 
>>>page table
>>>+     * mappings for this &drm_gpuva, adding the missing page 
>>>table entries
>>>+     * only and update the &drm_gpuva_manager accordingly.
>>>+     */
>>>+    bool keep;
>>>+};
>>>+
>>>+/**
>>>+ * struct drm_gpuva_op_remap - GPU VA remap operation
>>>+ *
>>>+ * This represents a single remap operation generated by the DRM 
>>>GPU VA manager.
>>>+ *
>>>+ * A remap operation is generated when an existing GPU VA 
>>>mmapping is split up
>>>+ * by inserting a new GPU VA mapping or by partially unmapping existent
>>>+ * mapping(s), hence it consists of a maximum of two map and one unmap
>>>+ * operation.
>>>+ *
>>>+ * The @unmap operation takes care of removing the original 
>>>existing mapping.
>>>+ * @prev is used to remap the preceding part, @next the subsequent part.
>>>+ *
>>>+ * If either a new mapping's start address is aligned with the 
>>>start address
>>>+ * of the old mapping or the new mapping's end address is aligned 
>>>with the
>>>+ * end address of the old mapping, either @prev or @next is NULL.
>>>+ *
>>>+ * Note, the reason for a dedicated remap operation, rather than 
>>>arbitrary
>>>+ * unmap and map operations, is to give drivers the chance of 
>>>extracting driver
>>>+ * specific data for creating the new mappings from the unmap 
>>>operations's
>>>+ * &drm_gpuva structure which typically is embedded in larger 
>>>driver specific
>>>+ * structures.
>>>+ */
>>>+struct drm_gpuva_op_remap {
>>>+    /**
>>>+     * @prev: the preceding part of a split mapping
>>>+     */
>>>+    struct drm_gpuva_op_map *prev;
>>>+
>>>+    /**
>>>+     * @next: the subsequent part of a split mapping
>>>+     */
>>>+    struct drm_gpuva_op_map *next;
>>>+
>>>+    /**
>>>+     * @unmap: the unmap operation for the original existing mapping
>>>+     */
>>>+    struct drm_gpuva_op_unmap *unmap;
>>>+};
>>>+
>>>+/**
>>>+ * struct drm_gpuva_op - GPU VA operation
>>>+ *
>>>+ * This structure represents a single generic operation, which 
>>>can be either
>>>+ * map, unmap or remap.
>>>+ *
>>>+ * The particular type of the operation is defined by @op.
>>>+ */
>>>+struct drm_gpuva_op {
>>>+    /**
>>>+     * @entry:
>>>+     *
>>>+     * The &list_head used to distribute instances of this struct within
>>>+     * &drm_gpuva_ops.
>>>+     */
>>>+    struct list_head entry;
>>>+
>>>+    /**
>>>+     * @op: the type of the operation
>>>+     */
>>>+    enum drm_gpuva_op_type op;
>>>+
>>>+    union {
>>>+        /**
>>>+         * @map: the map operation
>>>+         */
>>>+        struct drm_gpuva_op_map map;
>>>+
>>>+        /**
>>>+         * @unmap: the unmap operation
>>>+         */
>>>+        struct drm_gpuva_op_unmap unmap;
>>>+
>>>+        /**
>>>+         * @remap: the remap operation
>>>+         */
>>>+        struct drm_gpuva_op_remap remap;
>>>+    };
>>>+};
>>>+
>>>+/**
>>>+ * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
>>>+ */
>>>+struct drm_gpuva_ops {
>>>+    /**
>>>+     * @list: the &list_head
>>>+     */
>>>+    struct list_head list;
>>>+};
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_op - iterator to walk over all ops
>>>+ * @op: &drm_gpuva_op to assign in each iteration step
>>>+ * @ops: &drm_gpuva_ops to walk
>>>+ *
>>>+ * This iterator walks over all ops within a given list of operations.
>>>+ */
>>>+#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, 
>>>&(ops)->list, entry)
>>>+
>>>+/**
>>>+ * drm_gpuva_for_each_op_safe - iterator to safely walk over all ops
>>>+ * @op: &drm_gpuva_op to assign in each iteration step
>>>+ * @next: &next &drm_gpuva_op to store the next step
>>>+ * @ops: &drm_gpuva_ops to walk
>>>+ *
>>>+ * This iterator walks over all ops within a given list of 
>>>operations. It is
>>>+ * implemented with list_for_each_safe(), so save against removal 
>>>of elements.
>>>+ */
>>>+#define drm_gpuva_for_each_op_safe(op, next, ops) \
>>>+    list_for_each_entry_safe(op, next, &(ops)->list, entry)
>>>+
>>>+struct drm_gpuva_ops *
>>>+drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
>>>+                u64 addr, u64 range,
>>>+                struct drm_gem_object *obj, u64 offset);
>>>+struct drm_gpuva_ops *
>>>+drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
>>>+                  u64 addr, u64 range);
>>>+void drm_gpuva_ops_free(struct drm_gpuva_ops *ops);
>>>+
>>>+#endif /* __DRM_GPUVA_MGR_H__ */
>>>-- 
>>>2.39.0
>>>
>>
>
