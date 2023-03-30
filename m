Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD36D12BC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880D910F097;
	Thu, 30 Mar 2023 23:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400E810F084;
 Thu, 30 Mar 2023 23:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680217318; x=1711753318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4hOLgA+Dh5f9VPqlNLF9fSGTJwnl3alcZAymeCg0snA=;
 b=ZGfUDkhqHu+fedXKlibtMda+blAEMW8PbOsI+TdMVgkMXx+Yfb9YPkne
 wlSXkTCzGyDrDl5h0QN1R+Veqw/EQWliuJZLt1lB3JOV4fXZ3AWjguGwp
 fWFBDUb65jyq0ys/FdW6+DECtNxvGJCQCv9jXZFgDEkqeYAQZy2ZX/SQr
 TfGDtDQPDedyRJdqhg2BFd/ys9KaB3chWVgT78Wdpc6kJ1KwT3DlLePk4
 UKrhM6eEtnGpiS2xj5G8SO49+hr5qrx1u9PNusam3pEtrvehON/SKByGr
 ohWAa18TS+66sfxbU2FwmjnUt60nvOtET4ij93aVVy/tvzg0HrELkJACf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427581167"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="427581167"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 16:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795863344"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="795863344"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 16:01:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 16:01:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 16:01:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 16:01:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 16:01:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm0/P9Uec3wNaW1WkXpwxsb0VHXvXfqnojmrCNRFlrMkyg2MCoikgllCyZjHc8sajNJWeHa06eARRZwTlL9NpivRkQLkn0L+zPSntD7ujH1TjwpFraarA2l+J4N6jNvv4Oy48trLIOvDaDT+x2aPqE23+Lawwsi3w9oNsyepPA3whb2XfqxmU1k1F+eo+QBbEikRg3AlD6SN4Vx0NQS+VA58cfMGx5a0CyJHnoCBxd+u8D0X1yL2dOoylk5WL2Rkzcd/70LV2lkJ/D3tOLJWsYRQl41yaq3juxHBiJFbekTFOmFYiKawizqEb66anhuiECmG5L3nnFRvHLTWX76XMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tls4RWxAdWT9FuT2t+XBhhorUIaHoYp/tcf6Ad9qOvI=;
 b=Q1+3m0U3g2Z/+APa64iuSBYd61Y/lDA20qmSl2mUUr8Xl2bY6HFFp7H0T5xjOak70H5daqDpcU7uXyR32K2lXZoIG8zQcJXBjv32YGKtBU7tOlK8wznLUNRhV/ancQcrlJetkzShxd1wjtDEYLjo6g6k86Jjl2XwwWZsP/NzEC1qojb/Jb7Guz+bXuUf8+0ZgSfu9FQj1eiuQeD964yWFTC/lDSC8ZZ3crRSYLj7CKEzXG7aorDmkw7bhCoKEPRq8PbuMEoLQ7SeVj2t10jxcQf9Sym1zH7Kl6+9MmQQejEuayqS4EYw7wROVD0jWCWHzS38PeH+/1X6c6/7ZYXpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by BL1PR11MB5415.namprd11.prod.outlook.com (2603:10b6:208:315::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Thu, 30 Mar
 2023 23:01:50 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 23:01:50 +0000
Date: Thu, 30 Mar 2023 16:01:44 -0700
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
Subject: Re: [PATCH v2 2/9] drm/i915: Use memcpy_[from/to]_page() in
 gem/i915_gem_pyhs.c
Message-ID: <642614d888783_375f7e294a5@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-3-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-3-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|BL1PR11MB5415:EE_
X-MS-Office365-Filtering-Correlation-Id: 484c729f-78cf-47b5-8f62-08db3172bea7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMT2BsLRPAUl6zsL9LpzetC1w8gRZ6VuFiVnWCFnmbm5F0s8qR3mDb+4Zukyax/XNifMJB/vgyt15OZjDkYjC4IMomsXWmxYKVEDdKeZCejGrwK07Pi2zBxmZ3nPk4uZcBkVEiSVZU3zz9AxnN86cZOyOfDcE1o2DFGKErJtT28PPOy/dGQXri+IPwQc7gXvnioHpOumu4j+KbqKPtuqBjL44vP+URhckEpHVEddlteUhO8ymcoz/h/44X7KdpoIQ8J0KCR1T8Adai10z4ojq8GlMdmtghGh0pMeiDBF6stcnHfZ2kfEPkAxulQGm4ZRHAtlXMhaOBmsUAvPSElagAIMAUukogA6WATkXBBzmIoQDgOdNiJ+2SGXs+dvkY60RElhmejBzEDjMNMT9XaoVdtziaDqio5LGfj2E5fPkgPr1MV4IljWmwWN0kSzVth724lr2zt7tNrJOJ+7xOVU9onJ+fOk8tij0J2JbyFWg+67KsuppWNAs5TfQxOgKtuDF7+FRO1ef129zfyn/t6W+EeIz78Ra9a2cp/NGFNlIxyGC3zsKXp5G4x86mswY1KbO0wHjaRtDXOOGDcr3QS1Lu+Sl5WeKL6qdJN+4lFEDH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(110136005)(54906003)(478600001)(316002)(6666004)(83380400001)(186003)(82960400001)(921005)(5660300002)(966005)(9686003)(26005)(6512007)(6486002)(7416002)(38100700002)(6506007)(8936002)(2906002)(44832011)(66556008)(41300700001)(66476007)(66946007)(8676002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+OMcWCILWKeu+jLzkezLNyJInJfIao9P+LKlNeNgfB+1qBoO1H84+fc06gjI?=
 =?us-ascii?Q?Fwum+O2LqPH3uOVdIueRPwq7GB7yS95cpCT6r0bMW/cB+/LHuSRYCnGI+rii?=
 =?us-ascii?Q?jgSJq53oLejbQfhHqTGlSw9RUf8fgh4JCAro62oS21BJkUxdIQ96o9eZ/+xS?=
 =?us-ascii?Q?VTxEJgUaWrI4UZ3ukPVXyGGNJFBp5eZY7bymwz+SdwLDVrE1X40FetpUy5Uo?=
 =?us-ascii?Q?X0btZeNVeCYhXvn2wrhLzOT56rkgUKc+CEKl11cPsRy7Az0UUEs7Kzd+RbN8?=
 =?us-ascii?Q?/7J3/DdNPPHcoRs9s/ZxoJmv2pexxe5gUj3cDMJifFMqsuAB5hCtYUL7x10l?=
 =?us-ascii?Q?kJj28kZUwEobr0xOglPQvENGyvINuIfy4F12VhJU6ChsaYCdI4zVxCKAbgon?=
 =?us-ascii?Q?jtQ8HuPB54gR7PnJ+/6HOi18uxwJH7XhKlXsJMzbfAopce2Ky6n2NnsfT2U3?=
 =?us-ascii?Q?xhnsjh83KZGVa3T971TOTKAkr8G5VhfxD70Ci+X2FOskGV8HaaSZFFXP/3mb?=
 =?us-ascii?Q?6VkBei5qm0Kb4CnhrricZEOpNc8Tr/TcPtf6gjWCA4iko+YgLGfdlx3stiuE?=
 =?us-ascii?Q?IY1n1uVe5roYhxhkat5PNPBvu0f+8zmJfb8Z51v7UD2ykUq0YbpgqWm4lLxg?=
 =?us-ascii?Q?tiJZgFu3KlFxtsj6zMnjBqv9zoOcLcepEYSTMsPiS+tG91LJgJeJ56vCpBXR?=
 =?us-ascii?Q?6LCnvnku4bEc9GPp4V3X05LLLPc6PPVSBa9GVZRxXSVnTNOT8ZU5ceUtfv23?=
 =?us-ascii?Q?6w/Za6NR/blpp1P+YwQqGBSJhMpXTCp0RjSxIA5BlZo5bMURMttaPc+h3QWw?=
 =?us-ascii?Q?g3yozdJNbVOs6DdPYYvAPkiXBRCrW0KeyNdrvxw1IqA4Xil76jlmTOZhmhU9?=
 =?us-ascii?Q?nPaiyOpIox4DqzJ8jyIoii7k/NEXgLKZtczDMoN6S8/+VhGprRVBHZiePyQe?=
 =?us-ascii?Q?pHv9okLxwQQhqFIdTgcN7tsqvKdpMpaXDa+996tY/hkaJnlCjdB52sgjsOK7?=
 =?us-ascii?Q?ds5MjHNUmqrPQh49jdWl4I6EP1lLYaB8uUznNE6rGTQ+zJWJzusXAcq6U+NM?=
 =?us-ascii?Q?4Aa/O6c9zoTVCJL7EQFp2LO7I2h1qPCzRLMULaeE9xAa/ZnZ8Em0fw//QXww?=
 =?us-ascii?Q?cCio1xTTx4HeB9AjS8sBXStaDsj6OyvS2hp3pIvAlenfSoMI7VZoQ0cVg9lU?=
 =?us-ascii?Q?qBudqDurCtovAzPPC3Vl5BYR8IV+cpvXoWZ7VO27uxXaeEvtAXkm2e4vWEYa?=
 =?us-ascii?Q?HW0BqEqRDsZZxbl5l5JglmOlCobTDmrWeJC5dvES1HTwQCqsq0Dphs7tEHkw?=
 =?us-ascii?Q?EC9WycJcTIjKWHZdWQ4Uozqi3spgq6mXezn3+57DsYV8DtcPtmVPNBXKkgiK?=
 =?us-ascii?Q?+eAwcot5y6VE8n++N08EZMMPy9JYa3D1tuLpJZGrjES/v/9fiLF/WAvUbxG6?=
 =?us-ascii?Q?EFm8l0QsZy5agc5pZAp2jOSiDJLYfNtXcrL/cuJjdoKxRyXcbbzOnuilZXdP?=
 =?us-ascii?Q?UB0dPzL1U1IrHbr954CKnU6Q8sl6IjI9gmVJjOYiG2pM+D+0dQRDmjIC/myg?=
 =?us-ascii?Q?S5S0I/tqH5pYuQltaKMNcnnXIBCZ4bgbmoTPpYKN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 484c729f-78cf-47b5-8f62-08db3172bea7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 23:01:50.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEP5LmMAkugoC/nTtWufwR9kz7RVb/hjTnC27vsDGM7UglfsfSYnTLLJa9fOuWevIJe4nAztmAYYPAPYFNUZPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5415
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
> kmap_local_page()[1],  and this patch converts the call from
> kmap_atomic() + memcpy() to memcpy_[from/to]_page(), which use
> kmap_local_page() to build local mapping and then do memcpy().
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption (the preemption is
> disabled for !PREEMPT_RT case, otherwise it only disables migration).
> 
> With kmap_local_page(), we can avoid the often unwanted side effect of
> unnecessary page faults and preemption disables.
> 
> In drm/i915/gem/i915_gem_phys.c, the functions
> i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
> don't need to disable pagefaults and preemption for mapping because of
> 2 reasons:
> 
> 1. The flush operation is safe. In drm/i915/gem/i915_gem_object.c,
> i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
> calls drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
> Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
> drm_clflush_virt_range(), the flush operation is global.
> 
> 2. Any context switch caused by preemption or page faults (page fault
> may cause sleep) doesn't affect the validity of local mapping.
> 
> Therefore, i915_gem_object_get_pages_phys() and
> i915_gem_object_put_pages_phys() are two functions where the uses of
> local mappings in place of atomic mappings are correctly suited.
> 
> Convert the calls of kmap_atomic() / kunmap_atomic() + memcpy() to
> memcpy_from_page() and memcpy_to_page().
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> v2:
> * Used memcpy_from_page() and memcpy_to_page() to replace
>   kmap_local_page() + memcpy().
> * Dropped hot plug related description since it has nothing to do with
>   kmap_local_page().
> * Added description of the motivation of using kmap_local_page().
> 
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
