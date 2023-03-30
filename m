Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E66D1190
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7418E10F080;
	Thu, 30 Mar 2023 21:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175FE10F052;
 Thu, 30 Mar 2023 21:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680213399; x=1711749399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LIntMjXKFhjTOcwysHd9g85CFgzPudVfHw9XTd6z9Fo=;
 b=kuVHHiaI1zH45Bexcwh1jTrqgk3ki7NiLNPN+heZInumMcykb3Vwjk8G
 89rPtYGNSDsGwL/Ny7EkQ9RKb+AQzJFYg/+CLT1GpRUMzMpo55paX18vN
 owkwmgyuT5cQ3UBf7dnOobS8miGFN/ElZTUqLrePj6mXnf1kKyBlNvx2q
 LAqPTq9g8yBSgyBk9oumvn2te7Azf9n9pA+SKhz5fJfpPHocTIicOy5eJ
 7U8MarkerNFf5cQzERp82BJRGR7klmzLw9rBuPNx+ZLkHqW9qlKLbJSb2
 WTKDa/XaUjhnz2fPNFg00zFxAqaHj11DucfRTZauE8joik7uLuofIUU2m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="403993323"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="403993323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 14:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="717485971"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="717485971"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 14:56:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 14:56:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 14:56:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 14:56:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 14:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQuhcdb0Uu4uxAt3GILSE6qJOOP7KLARXTkEoaWs+GVnaz3gPBA6Pbs0O5YfEhdtqB6DlM5AeeM6qAFCrp+iWiSxYG3pA3oIfBDAK3G7y+ZN20Oe6YFlyfToDNVvZPnx/sZroSNSvFXGJjmU3pEfxDCPOY+GJbVqFkzMQUF0mYhG1mMknrZQGh1J1G49ppmuB/FJ/uGhQ/jwRoKPxchoMh16PG8CLnabk57ImL4zSXe4pbUyMgsQetvt3U4yufq0cK1RF/CEimZoQh7dJQmsbm7E9HHM1hzF5fWMh5JG1PhGecvElSo0nMZ926bGydKrPj/IKlnfpr7gI+iNylDRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMR3lVKMHn2tX+Sy7TQm0taUWtkN5fNSImMTz3DkhwI=;
 b=fhflau0Gm54tSkv2PAXT31CqRl4/cEWzvHNjNVp8easTI1PS1DgxHKVEUAsVu0BSNZBLW1ZyBSqe9x0h1i5jF1BPNXZ0MQ7ApN9pymruUz/Sb/XQgHcj1CfQHYWY14I5HV2MO558Ni8iWEO1Y+8jtTdkPeJdJgrmJRBcmmCsr+y/nXXmf6NxYUJMJbqGu6uW4vOhdy2uwGtp/k6x0Vc9Ls3Xx43wofOejddXUBTQBONBvzL9MXSOe3cR2/cKowzPU5mPdG9nLSZXyk2V8b1+8/h5xbPNxNni/h//w4MLWUZep5cWC8IbFO0IjOflxXTCbDZYsjUcPAQI4luAa5Wn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 21:56:33 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 21:56:33 +0000
Date: Thu, 30 Mar 2023 14:56:28 -0700
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
Subject: Re: [PATCH v2 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Message-ID: <6426058c566b7_375f7e294d9@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-2-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-2-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f6de1b-aac3-4251-0a57-08db3169a047
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NI52zESR1Dzi5OxBaoinlMEflohPP4NV9Bp/5tokPzNzSkHez1xq3OWe6qR67nQdsy8LHJAcC9avGSASUXoSYyFntTQXHQOuy7jls5ZwJn2cv+IzJbuQccVs1PgyqQO+jAu0jpLtgYu0yhXk8tww7gKoHJSdwTJU8RsK78cjuz/xB3iHF55rlfdTaltRhcvcZ8D4fzLraLqYDwRwKv28i9E0rbg3laMZhUuJBH6n24F6vF2ioQojwlXcAyGav4yjKPWvTfXru0oaXSZbuvwbdRzUEwmG2H8OsSh2UU4iKPV5Em4oCEaBEf7R0eMP/prBx6LDSGDb4s+hH+bB69c5Rwhw7jM3hQd1sy8GJK6dc/4t+fZ0wod9jXfTy6kg+oA7crBKtrStUJKtMkwwh+4cNHrA/rngjBvVF04s3b9390LYBNwR9on+4PtsLrViUjSJDq+4SSmWcNFtnLkXQ5lGusyv+5VkCRUAj76WpEi5Xawjf0GJfx1OApxBreUvmFdN3mKaIBgOdjfAWS9XN+1OZWzRgwyqlIGCD7fl/3P+tbuWlgf3oGJoWMAPHH/o9vJdejsJYB2NWjYaJFnL9yWIgszKTSSgmGuElKct3zs2xiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(966005)(6486002)(4326008)(316002)(6666004)(478600001)(110136005)(66946007)(66476007)(41300700001)(86362001)(54906003)(66556008)(83380400001)(7416002)(186003)(2906002)(8676002)(8936002)(44832011)(5660300002)(82960400001)(9686003)(921005)(6506007)(6512007)(26005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SyQkSn62Twd1f3EjB32whDdDBW7kBQ/UImKaMVRmWB4tedw3O/xG1CDDbeEV?=
 =?us-ascii?Q?GHXg/b7IQbmmFsAqz35S+fFahxc5wN2ySufAPSWjOGPESOr80MQ7DQN7RCxn?=
 =?us-ascii?Q?aZO02PMDOmDc56UydEsvo9UOWgYbGLhibWb/RppXkjNOTglFsUssnkqM2zfh?=
 =?us-ascii?Q?9nwe8KUSIVtKkGiRaNJk3kDzD1N23l3pmFeMFcOHd/GBrr9KKMAsY9HB3t+/?=
 =?us-ascii?Q?3oVYfwOA1XzTxYpiEet+9McciJPDnAlk/H8VD59KTs6Izx/RpdkVToEpLUfw?=
 =?us-ascii?Q?ANosL7TGLVuqXHI0n47R0JyyEEQHcZdo7EmrEW4VlVH15hCWCdm6dIOJD6c9?=
 =?us-ascii?Q?CI3Dp+tIMLxYp2ZkAv9gnghdUzSt2q+pu9r/sSV0BKEO9lIk2uSvayXUJp/q?=
 =?us-ascii?Q?zKi3vvK3VH60749VtzmI46NwLWOhh65FL32z4tHo9COfI3dZm3F9qYbJpjmP?=
 =?us-ascii?Q?gjUpSSTI0tpyr+y00+A4mbuyXo3xW+QYezUBt8wnOo6gYregFME68pCfKREz?=
 =?us-ascii?Q?07IXmjGIcveaD5S1P6cd34I97PLUkNlY9D4FZgLQNCmvrMZiCuMmJxli+TZd?=
 =?us-ascii?Q?p/ib+dm6ppY6+BJXdKAsmelBRhG/KLozM8d8pk/X69moHlaZnendXnsFKY/s?=
 =?us-ascii?Q?yONa5gudDn3E0as4lfByCpuoX16fTr78cjOhF6v3XWqZJOtVETIQMw42XyzT?=
 =?us-ascii?Q?4leGDYgkeACO74DNUypj3DgEWshxbW44V4Xdplsev2d8sqWQ7HkcsgUOyjw+?=
 =?us-ascii?Q?xhOhC5KOXiXmKQTyi4cLSWYelxAY98Lg+xJC31KSSGT4i59UoqlkoCVcCEjr?=
 =?us-ascii?Q?dUvBWBX+zw+yWVadFoFdYh5+ArWssrskBQKH4rKAzTNjGOn75ECK7UQVq9zZ?=
 =?us-ascii?Q?nEuaiLhzGbHv3gHBED0Thmf6u0gHalaMJpG23yBmzS9ugVWoCbUzvAK6xnyv?=
 =?us-ascii?Q?cmiGvKfQAa4dW7d5SZvh5ezXUzlElLq/5rjByU6UlEdRaJTw05sKu2G/L5zi?=
 =?us-ascii?Q?reEx7cMkfudwIWJUx7+kLMUymXewvLI+gYbetcB7ZQv0ZK73PHLUq5Az82wQ?=
 =?us-ascii?Q?R7AWJmQlFNjIT6uEWkFrH7HQecyLCECecK0tBc3RE038QN/83l6mTU9D9XgF?=
 =?us-ascii?Q?4c82Sg+PBTU8kQ75T088wRa7XK9bDa5q9fKiMy+f0sLB3mKFwV+VrNnIq+p3?=
 =?us-ascii?Q?Y30YYqVj5FbeIV3yygy/2dDn+HhlS3OGqmebl0zz0XfT7LoAqcgrL51do6bt?=
 =?us-ascii?Q?xa8rfBaUyR4nkCywii13QmTDjPEho+bP21MfE0vSJGlB70iTdYBdFPr2pZA9?=
 =?us-ascii?Q?2R4/IlgwmAyRLUJTqM98CVV3rfxECO6Pdc28Mk/BeUfffYbjxNfU+sMIZbVq?=
 =?us-ascii?Q?qVal3KFwLABmmbmxzTKoDSwTr28eBRkznXRzl9lnn3nrABTGNU5kY3Sg+d0F?=
 =?us-ascii?Q?79m9Qi4vyPHuIvE3cPWyNvpF/mSztPDUW1c3GkfzgnM0DToOqcAM84MZUDtD?=
 =?us-ascii?Q?tVBorGdKTqxC9mYVAeh5yo03Rfx3J0ffnSEY4E8ybnwWCLnOm19xJmXGOywW?=
 =?us-ascii?Q?vhHczSG5CsQznkXlkaj7CznB+uPOoHoIXrXPSuFf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f6de1b-aac3-4251-0a57-08db3169a047
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 21:56:33.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoHgXG6P4lzISz4iEejcNjhu8n1WUaWHvLfSlc5Jp1MI0p6BsFFgbdN8L2tnkUCZWT6PPw319UDSWZEN+ACTaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
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
> unnecessary page faults and preemption disables.
> 
> There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
> need to disable pagefaults and preemption for mapping:
> 
> 1. The flush operation is safe. In drm/i915/gem/i915_gem_object.c,
> i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range() to
> use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
> and WBINVD is called on each cpu in drm_clflush_virt_range(), the flush
> operation is global.
> 
> 2. Any context switch caused by preemption or page faults (page fault
> may cause sleep) doesn't affect the validity of local mapping.
> 
> Therefore, i915_gem_object_read_from_page_kmap() is a function where
> the use of kmap_local_page() in place of kmap_atomic() is correctly
> suited.
> 
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
> 
> And remove the redundant variable that stores the address of the mapped
> page since kunmap_local() can accept any pointer within the page.
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> v2:
> * Dropped hot plug related description since it has nothing to do with
>   kmap_local_page().
> * Rebased on f47e630 (drm/i915/gem: Typecheck page lookups) to keep
>   the "idx" variable of type pgoff_t here.
> * Added description of the motivation of using kmap_local_page().
> 
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
