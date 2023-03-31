Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60246D15D1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 05:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5BD10E30F;
	Fri, 31 Mar 2023 03:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2B10E302;
 Fri, 31 Mar 2023 03:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680231890; x=1711767890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=riMyB6opvBfwYF+nW+RZrwm9F10FyrrCZLsOlj5liu8=;
 b=nLciSVtcxdWGQC7wAWYl+hMFAB/ndpu+E1TqtEb2DSNJAfPMzMSnZ63o
 zYapThZy7j100yp8hj47K0jRRpBsBOOCowIf+UJDQudOnCgNPsUR86WDK
 IRijBVyiGW/JCNfQHvIpVn7a3mN7lTtBNQML8YvF+m7bj/bHPCoooJFzf
 tuzJhua/qjhiADcfM28bjNINFGdLx03+cJQCgoOOWOf/eGkE1UR27bP0x
 lL8+9y0T+QkDBLwD6eMII1Zh6Q68cL1nAfdaoSxV3yUG30ooTeSX5ZvVK
 7j+hcMibg5GFWd6ym3epX8zOhazAdKnPKpWlICz1Rn3zid0vXp5dbOV6C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343848362"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="343848362"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="808886594"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="808886594"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 30 Mar 2023 20:04:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 20:04:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 20:04:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 20:04:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImS2YnmBPZq/yhtD0wE8ZPpIaXwbRUMbUKB6WEpjWXbBweC1rVS5rfSosV/bOaJa98rPK8xg3TJkFqbBbNc9vvJt+IJ8kBHkwfKaMCWUHwywLdpVr9YOTWGfCKa+W/cMWsrwO78EpKffQtVytrcZnJNaq5ZJrMjiW5/jitDaGLLoC8Q/pST2O472nacA2+woXMZFkrzj3AVA02yeAGKpBWDkO72N7rA9RUcZugIGL8eB+8CNK+SlpeJOPOrhkKDwVbAsIIvQRs7EqdaIaLNOc+8y037heFxfjmbCw2E+pDJq6yLTsKZ3QDBdm9sMfs4uRd1pGOGsCLbgJbUPFq2Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjS342vmRxStqWB/hKg/rKqAeoAwiwrHW3vodNB+yU8=;
 b=I4+d+cMpERLEEBbI0pkm2RYjfMhF/FUsaGrf/rXYigRJHb1Ll9lxM6fe2toeWRpVaGhqObUH+ebpHS35Xx2pkDNOaPxf3gECj9vDc36+jfUwcKON3PlG02M5saP/WI1iN3QuVkWKZmx6AAVXe8oG8W/eYEe0iqRVcZZns7J55ynj+ZcXTQ8ERnOUC+nIygXwaMzrzf+0YCkXwDiswc96WfKDqqu5CLKFkehUHLyRsfzPgN/pbUho+3tpUY3xCxB91Yk3H2WWy9F9P5fOciIW+ICNSwu30YNPJwt26UG6wmIr6PR6TrZoWhZmUVcDLqJE2RYckEViKzFcz4+NMjJsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Fri, 31 Mar
 2023 03:04:45 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 03:04:45 +0000
Date: Thu, 30 Mar 2023 20:04:39 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/9] drm/i915: Use kmap_local_page() in
 gem/selftests/huge_pages.c
Message-ID: <64264dc74c39_375f7e2948b@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-5-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-5-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf5c2ab-23b1-4bf1-6c77-08db3194ae0d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSsYosDf4QFzW/oU16vvUaleyfbYKUKFzO1WpoO+SEwbBrDDdoi9il8k+f+YA5M4eoKK56TQDMq6tk9EXo66EcmX0T0UwBgIWvhMzWqta85aRhBe3ehIwSyZZ4hr/hQf5hWbe/JMBzqKug35cAKjE/c3q5Fspz4RQ1XrZh9dqsRRS9XVldTChJ8qRfr4OLMEBpRH8wHT8rxJazv4IVL5CBcrgXjErLpKE/HWIBhDCLhZ+KwFkrgqAJooOIX39R6zczWx1ZaHmEqbcKL4lbnhZyaBeJ4vfowy+0BwvjPWUSmaZZ3pT/brurwNAMWrkqGrRsbIoAnbLqEJoIaAbs0ovG/ZB29U5Pv3UsWge8w2XTXIncwhs7hPUnufHEyOGgnpMDhfoXrWRPv/Am3nqx2sMqS5NAhD3YluU4uwEEr5f/bgdiD0HIHtsgmaqmkPdU6ZDOQuXjGlarkFueo8A2d5ejQNeNfj7fk+zN/+7vdfG2gB6sFqDzpzjV2POJ3jpLHXIKZkKt4YPE/g0bRBos5mBNmkCyNbQV0veuoxmpKujxaFOAkrzprEcG+8V033VTgKADYyIRswgjj6xFgA7im0rExs1DV3gMMFLKYX7v8puDucV82/r8r5TgswebTMqRA2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(54906003)(6486002)(921005)(4326008)(86362001)(8676002)(966005)(66946007)(316002)(66476007)(66556008)(478600001)(110136005)(8936002)(41300700001)(5660300002)(44832011)(38100700002)(7416002)(82960400001)(6666004)(6506007)(83380400001)(9686003)(186003)(6512007)(26005)(2906002)(14583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d2wEESyzoQOnirv71+nKiYeG4Vnd33ERs6igRwxjXqmf8TIoPD+nJydC+WgR?=
 =?us-ascii?Q?B+lR/+QdSF715HS9t4lchYV0aJwSgIgbqVFI4RbCerGOKQpl6cw9gV/dYsnn?=
 =?us-ascii?Q?ZsscFmuss5ZSh7Q5MNWsx24VnsQBXjBvOmGI9z/1fhqnYlagx279AUuRcsZX?=
 =?us-ascii?Q?bFUWpoAv/5bS0fCyToTbkWHfW70rIEvb8HH2G5T7of27j7mN6eykuoMtv+VE?=
 =?us-ascii?Q?DW+SgNW6OlGFYOyZgB/59kv6c+fIZfsO4gaELb+ANpc1v18EKCXiI7lq2nVe?=
 =?us-ascii?Q?gRTnwHLART1e7cOa6VN8WtJGD0huTGvDbGsOEDiaMBZ5lF8vvk1XqgwKCNgZ?=
 =?us-ascii?Q?d4wsOKbM+z5K5cxSKH/YlpFaLMKtKMxfNP2Cwrwfy+7PEb0oDPHrrlYq+lku?=
 =?us-ascii?Q?hg4STw8ro+XiEZbwu9uzofMHBKr62Cu6rKm798mf6jw+KIRO4CGVFovxGd4Y?=
 =?us-ascii?Q?UYFmOkeaGG/iIZqdgMLI2RcmTL61X/ROesEPTzSny2toZhVv+xpj1ezBwMes?=
 =?us-ascii?Q?1m7Qapajf+FoNDKXIfuzrQZaeqZPVzvdQi6mQNUVOTq+WObak4xAMmL1+NbI?=
 =?us-ascii?Q?WWjm93V4tACSGaqidgOHEgJ2CqkZv8t85bp5v+ZYGh8fpHnH5BGIkfFCTuLI?=
 =?us-ascii?Q?unTy5WZPomC789pgwpDeKnkHQOs6KccRfLq44ROG5uholgbBoXUhCsyXUWB2?=
 =?us-ascii?Q?sapvpWCyGgQ6RBDB2zYPeJpsTkuhtPd9+Dqu2q13pR+dE6bzUSjRdvcCRx/Y?=
 =?us-ascii?Q?YGbZqisNGJ7Wz0n9MLiRK677ovRTITtHamS+9zj7jYqE0jtCDnD8qWn7llLk?=
 =?us-ascii?Q?BtApwQZigQTVXrGmECjIMfPdDn/ninvSr3JpBRIOBoXE3oSOKkDhT7Fi3l6T?=
 =?us-ascii?Q?dqWjhboNi/UtYT5saGIyO6TP0Kvqllt/lJnD62unA1tX07oc4TKj6ox/WLdr?=
 =?us-ascii?Q?G8+k99p9b3ODLa3td1wvP31j49un5qUkne+SrIbHFXs0Xb+nho4ZwOzHYr9y?=
 =?us-ascii?Q?TXW/M8ohBqU1fK74EhZBODatgJgY5OBRN6plGddMtE8HFY4v9kDkQmdxUooR?=
 =?us-ascii?Q?9Oz/DQ/VJeDd2WWm7ZvZvu9fi1bsG4cDafX+HkTXURImz92SvxGVVwfS0xx9?=
 =?us-ascii?Q?Mh0QbDxtCIDo2zk+rDvQyFGpm99z6QVYWg+BsYjUDKzMuO11FL0fTiNzpkUV?=
 =?us-ascii?Q?WQPGEUH9pXb7HijZkqBMrfI47mnMAnv94Z7rcHP1j9keJCryL1ds2FnfC9vH?=
 =?us-ascii?Q?S7SXRJiSE6xKVQ7N7yOcm257+DbzWnsIEJnyae3opf6RmLS4pjO1CLUOPdiF?=
 =?us-ascii?Q?F4JQv++SF+xqLNXvDBZJnIfaFNO6KoIZVcqxWjcG2R/DsdOQZ86zF3Y6pInF?=
 =?us-ascii?Q?JXecNoyRl9PAhct+1udCpPo0Xe9b1srVsXkcgVn9X4I5ykTKtO/IUpv2MKDX?=
 =?us-ascii?Q?5CT/biT6sUjDhIVhV2x6nO81ivWPiz0apxdTfS1ogvdcbYgCD35y0FErsGKY?=
 =?us-ascii?Q?ALrssH6YNbMGzAssu5AwIWU5bvhoNhIOe8amtuUmlIxo8nE3jS1wEzE8Rtj1?=
 =?us-ascii?Q?R6Jf9bcUG3ltHP2z4TTYt0fcNYYuVmrmLT/ZgQoQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf5c2ab-23b1-4bf1-6c77-08db3194ae0d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 03:04:45.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e0j/N6WXjyeMNfAoMWGYlNe58DXM4l0hQTfcaYh+RukmEZRg/5gLLCbNUPJ5YyCfFR9tL6t93h6mGhSOqxcUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1], and this patch converts the call from
> kmap_atomic() to kmap_local_page().
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption (the preemption is
> disabled for !PREEMPT_RT case, otherwise it only disables migration).
> 
> With kmap_local_page(), we can avoid the often unwanted side effect of
> unnecessary page faults or preemption disables.
> 
> In drm/i915/gem/selftests/huge_pages.c, function __cpu_check_shmem()
> mainly uses mapping to flush cache and check the value. There're
> 2 reasons why __cpu_check_shmem() doesn't need to disable pagefaults
> and preemption for mapping:
> 
> 1. The flush operation is safe. Function __cpu_check_shmem() calls
> drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush. Since
> CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
> drm_clflush_virt_range(), the flush operation is global.
> 
> 2. Any context switch caused by preemption or page faults (page fault
> may cause sleep) doesn't affect the validity of local mapping.
> 
> Therefore, __cpu_check_shmem() is a function where the use of
> kmap_local_page() in place of kmap_atomic() is correctly suited.
> 
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> v2:
> * Dropped hot plug related description since it has nothing to do with
>   kmap_local_page().
> * No code change since v1, and added description of the motivation of
>   using kmap_local_page().
> 
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
