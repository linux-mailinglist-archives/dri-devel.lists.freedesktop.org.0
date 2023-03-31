Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5B6D160C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 05:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A2910E009;
	Fri, 31 Mar 2023 03:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBFD10E009;
 Fri, 31 Mar 2023 03:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680233817; x=1711769817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ITeIKSCZb2ML9jNy4q96p8GX9m674UHPjhUZb6Aif/g=;
 b=Rso0WoKugcSh6DG5hEZSpglAxb7HdkpVEya13K31GELWdXAqtjCCVOuk
 EsgJ2PQZcJdJTv/QESQI2/73ygtw4BLtLclOB5zIYUxIW4v80rtHAuhzp
 siEK1yQ1mHE+M2M4ifdKLqfag+UXItMMttB52Lvz3u/ouEDrixNIuuA+j
 wCKeOnp3zo3lgw5YDPmS/M+x7sR9ywsnrjQwo1mwyn2TUkHTX+D9JkLDb
 cVuVBLjxXL4Rn6jLdDYLNg6SKnkmq0Om9jKqO+n83W9lrEzexsaT8dGmF
 fzkogIyzBU7lNBM7SivW5KU68CwDunwtXJXBkQBxtWTaUpqQOWHq/B/uf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="369132307"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="369132307"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795945664"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="795945664"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 20:36:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 20:36:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 20:36:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 20:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKjZneCUOCxJa4V/aOpc8BpV2FEvRrZbcL3x8h5Tvgejcj4oD0ZxMUqSh1HlVLug/oofYGpAvgoIZfKScYZjcvvTpGZuPsLcVwNJ8DHZBZ9H1x/FFvM7Zm8aNSIKsuw7fADwIaHA45+vC2jsZ7tbDVTUtgM0D3UPH10fm9Ddrg4TjrTkELDhdzh8z7gDRQcqSBJzUMyF3DoGVLoTrkO6cq3+7EUD+84wvyP73wDJOFkfhR/Svkn68rgX5edhaFcWkNCmSXpiYSEZ/E2cAEVEPxF3t8PPMpQAEvZ2HMXbNaPkkxuEq6FJxTNs1Eg3A5QlmukI2Ib0aqeBbvMOvYcv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9rVXGSjG479BtmK2inO00NUHDmZ08YV+7vJmpcFYbE=;
 b=FGdjZXyXUEijsd6uBtC7snvQ9P8wz3I5SbMMfdu/IrREec2ro/1eMmysYebHtdmIbkv2aKZ0O+UsIa/am7rOTe9pTJ6PIcq+V4AQyfAA9MIPRY1h6XVBDcEi43iDRP6BRowrc5WP1L6X21ZtoQp1evMIPgueB9pZtoIRivQ1V6Mu1HToU+zLEuxD0ZJ4Q/jyvJACAo1vPG9BFh0lvEXYlhZjnXRM1WDk+IcLMxqpvnpWoQhg0pPQb3lkvTiMvxDEhHD0PYZwkdI2E6bcEZckzH2976eZaY5qB0urfIFXubh5zxie0356jb5aE+TPXE9MNKOSTQI6lgkMNx7+CfIkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 31 Mar
 2023 03:36:49 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 03:36:49 +0000
Date: Thu, 30 Mar 2023 20:36:44 -0700
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
Subject: Re: [PATCH v2 8/9] drm/i915: Use kmap_local_page() in
 i915_cmd_parser.c
Message-ID: <6426554c3db9a_375f7e294af@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-9-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-9-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: b01cc12b-6b1c-44c3-1924-08db319928a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBmPN+WeAn4Zv8MRV7jcdeT62dWFoNSYUjiCqou/sp7ua2x7MOPxn019h/oaXLQoPkyWklu7ENpnlUCXp+pXKNXqCTkFvxtvUn6SR655G8Gkr9gCwG9061pjE+lgyPc14gE1GvlbqvhmEmkH6U9Q9pvU8XyEPj3LhSG9cW6GFTXelWVCSJtaOkEPSyYMY8kB8tXHzVXvpIyQsNTAuvAhDMFm+STJvShWy9UjtauYnsP4WcPrMz/Sbntm+qhPblb438LLe6ZbHxKI/b56aJDuTHK4ap8MvYA6gAyzgqWSJj1BZCiKIS7JXlNJqpFP6JvOht7Py45J3FkC6inoicKQm7swo9HluKqY9MjYjWKiOjaYl9XmqicC76rfy1jV+LoTMnMAJLGm/QoFCSD0IAFLX8wV2tebRCsUAFOdCql7NtpBop7PBWdeditnKc4cBc1nsmDDhNPbsT8ROxle9BiEWO5I3HuCRv3JDzhA4Z+7UjXi6gaPd4bLvAwEAMPQ89J6Ak9K9at8qTuQ0PaLr+yEQBQkxFmhAjpF4jh7WnxGGw5d0vSnwkiLAsQF+Jt87gwx4rSxtkR4N1p9oA8XWbZ0MEHSdroOFMZoGJ6hcPiL5rs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(26005)(66946007)(9686003)(921005)(7416002)(8936002)(6486002)(83380400001)(6506007)(41300700001)(66476007)(316002)(2906002)(38100700002)(54906003)(5660300002)(6512007)(478600001)(86362001)(186003)(44832011)(6666004)(66556008)(966005)(82960400001)(8676002)(110136005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zNVHNJctuHkkDWe0lKDFm+AZSt8f/aSe0WfX0bYsKsRiAbdE/PkKZTrBH55B?=
 =?us-ascii?Q?boBsCG9WVAry6apmf6mMhUYv5SGg02673HMsF6tDs8UBz60b09EFFgjxv9d6?=
 =?us-ascii?Q?i1WFao+YwqqFoWZgpayKV0NR0tnVRUVyn0Olt1KZnoL6Z16gN+FXjoEpHV3E?=
 =?us-ascii?Q?0EWy3wzpSMDdzOOraZhartchuKLG6IEbPIcyONLGfp47Hi1v3tSjsJRUXBek?=
 =?us-ascii?Q?4+8mNEhe3IWx3wo6HDompUuPCbSSP6kFB+URng3sS3kWdbMxLeuj5n1coNP8?=
 =?us-ascii?Q?r1LsgDw+VE8gsOY/WT8IJz8OeIaDW6ZdWgMAkdSaHyEoGAYumRFZvKGidB/1?=
 =?us-ascii?Q?kZloObge0/PczNrsNrcZk01b/0sA9/U1foDy8Y5n5LQfmdQERNhzF74ZY/VW?=
 =?us-ascii?Q?TtJ+ZPzMUr3saIy/LFqsGtjLJWUH77mdIUwqxvGj/1TWLXXqQDDb8tztsMiI?=
 =?us-ascii?Q?Udxltf7tQ8ueXEBGaVtftJCP9bRzmnVde1XbGlHMKLQbLkuT5YMP64T4uM26?=
 =?us-ascii?Q?L0Oxu/gTWozADlG+pJ61hTO0cafhdM2jbJNBrzBsF0XRboI65GUCUL6k/842?=
 =?us-ascii?Q?zty4hcnzeQksrFt2BgHtWmLXXAtEAgi0uVhITkzcK9rFrgonewqjWQilH3Th?=
 =?us-ascii?Q?SEEJGPZA1x21cQEDFYssDN83TBC1Ze+RgOmOZqn3JiwlGz67nsnHHAu2DDNk?=
 =?us-ascii?Q?zg1XlGZifB77lbEuicLFc6XRs0GkTEtuUMUYKZt6QCE14zM0BcbuoB6vYl6P?=
 =?us-ascii?Q?T1WAr7YQRZ150H0SCEhEDhACZdBQsRCJXfOHbBt0TlrKeQ16EFJE5LC10/uy?=
 =?us-ascii?Q?uRZsx8uSlTJXDKBb5BEytWwMz9bPgOvF/CF+bCzCFlVUEGUf35EqT3Vzv0+I?=
 =?us-ascii?Q?F8se9QYGVszfnLhBm0g8lYbBDJ5hC2IoanWZ2pqT8uVywjGgqnIKxjIYD1f0?=
 =?us-ascii?Q?3ope22w2AbQlchu29CK0DH9Pmi8vFxQ9qOYZb3k24EFsX0L05R44hIFplfyJ?=
 =?us-ascii?Q?Uaq7l8LxVI3ORjKtzLr9oyxM53PhBw/xJS9atwKeetZEVyFJcLJZrwZbaA0s?=
 =?us-ascii?Q?kqnoIT8J+zfOvLFIhSFQsGyNmtbHln8VhNvJFp3lHfZj67ON0BAryEZujXFm?=
 =?us-ascii?Q?jcAW9GdEJKC3JdUCdiCsTirsmZAP9uhafZPJujFk4BBO5B5MSS7V3oZPLDHp?=
 =?us-ascii?Q?GRgIZM6PH/V3oRRAZG7dnHryCchp9TEkxMOCJ+k1MySRAoG55aJQ1pl92EoQ?=
 =?us-ascii?Q?BlzbPslAJYsCLLNfnquJa333xC4HQMGHEp2mnqB/uQabaP6k9rTRdmZy+/PA?=
 =?us-ascii?Q?+QlEKS4lkTWVElHmbCOc8hyhT3UTlrMVH9/FxzdLXXNHL4o0/NGjJvi5ip4v?=
 =?us-ascii?Q?P16PCQpbF++WceYxMlBq53dorh2vsQoORT5rkPnQ3MZEPMTkymYMutR35+7K?=
 =?us-ascii?Q?UnG0ozJAmc/4Nt7cokEVoly7KKMyx3z4pO3siMvvp4YB9ku41IMJuJ0aoRGz?=
 =?us-ascii?Q?2leGSVeLg4l+4r4LCPsicE3q1n2Ut/jE1GuCeKvO84N9o11VCsvR2ZOthT1M?=
 =?us-ascii?Q?5iTKjzn9X9vQMx0nu2QK3/8zabAIBWdDhElUhZJQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b01cc12b-6b1c-44c3-1924-08db319928a5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 03:36:48.7428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3zBTSqK0GlvSmDc3ftQ11OuHn5dizsrMvIEgF0N8NGH3D2Uo3sKH2O4EZvu3uCgehIR0U8j1PfjEE9i/+Ll9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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
> There're 2 reasons why function copy_batch() doesn't need to disable
> pagefaults and preemption for mapping:
> 
> 1. The flush operation is safe. In i915_cmd_parser.c, copy_batch() calls
> drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
> Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu
> in drm_clflush_virt_range(), the flush operation is global.
> 
> 2. Any context switch caused by preemption or page faults (page fault
> may cause sleep) doesn't affect the validity of local mapping.
> 
> Therefore, copy_batch() is a function where the use of
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
