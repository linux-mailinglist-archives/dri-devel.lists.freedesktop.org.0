Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AEC61854D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 17:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6820510E713;
	Thu,  3 Nov 2022 16:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A864210E713;
 Thu,  3 Nov 2022 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667494296; x=1699030296;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LcRHvyCgj8yDx3uTZiRA8/6UAE558PudbBYVx2V45uk=;
 b=Hdy8kCFBD7Ssp0Cs1xEjnRx8sVWbV8fyc4Dx4nq8Ju09P6l33qFITk4T
 m3TS6yj+a17OYhsyL47y00cyozfRx3lkpxCPcdxTO4kV2J4iCozt3uk4M
 RahB1kzNjgJDWnT7YTiMFX9v6i+Okte32SXekgJNFH7g4wYG/vx2CCeM/
 vQ8ZuSxk58kgQ2o7FqX6OFZuVp/8t9EnHS7EyIgYEQY5uZp7hQkBKZZro
 aoj7pVU8WE7vueGZF8utuc3EV6eJJY0tMbYq3bzSQXY6pXtXnjM+1pttu
 3gI5DuP1QhU2DaNHND7uEEqyj1J/yQKa6u0vBn+QCwskr0KqjaxPCX7Cx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309734244"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="309734244"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 09:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724015515"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="724015515"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 09:51:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 09:51:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 09:51:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 09:51:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSpB3ja9NqiSdzkG2GTMd/71dt13sDKolaYNjIqarvkXXhnHFt41gYMdLaWgEEAQzk70R6V5lN1OQ0JjRB5MhWMpFJR2TpymPiURfVb+7JL2FdkiYngf8z2MkvWdOkNhx7g3QnOmrUssxi4ngKjZuV2LD7HE7Kh5PiIzD9c4nWJFbyoLjFE5/I7aA+WK4Ld5GjK4/oKbgYSVqt4z+nXyAZJt4T/R5fQfKRK3Qfsknrhd7tNyTMr7WnrypfXAb227IXt2wiQ49hwCUloHSMLsSw8gyeXq8CeF5bgE6joxtOd/0oBEis9BBWbv3rsxpNYfo6yqX9aZbtpCatmwNoAjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXTgnya4TT5ZFp7s8wYY/rGs4oqL5V/mzogwUwiTHyE=;
 b=PEPWNWItU2iruEj1st42OKylepqruQl7oktnYhVRgl33lkFYQp59zDMB5YGn1ttY9QIu06e0NlrSYin66HD05/pKxgTA2ALSXu/YARzaSvMWKxb8s3J7EUJTjMwRpZ7TouO3MUawofn9bb1IM5HN4/SJK5VJEfkUit526hbnNIaiukBxHwf3T8K3uEmjiYHx6h2DSRsmnkGnHnNd85mnrZpv7CpCtXLgbdv2KZJuCi6yxpYoAqXnq+XHNejanzcKft1X2uP3v+D1wPyrOVzIDTnTxxMrGOkznEB6FLRcXNRiVK9uOQpd88VL1hBUV4DUCqKwpnlCIPgPJvu5B8OlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 3 Nov
 2022 16:51:28 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::5236:c530:cc10:68f]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::5236:c530:cc10:68f%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 16:51:28 +0000
Date: Thu, 3 Nov 2022 09:51:23 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Message-ID: <Y2Pxi9FsdeULhHKI@iweiny-desk3>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-2-zhao1.liu@linux.intel.com>
 <2541717.Lt9SDvczpP@suse>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2541717.Lt9SDvczpP@suse>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 723167a9-a3ef-4a33-1381-08dabdbba6f6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HOloFvorANQquvDY/wIzGa3MdxX+2mJ9T26cR4PuusA3b1KQvww4mDOM/+I+mRnki2YPbxmkI4jBIHMG0odqtJav35VypYll4hXo6iiseOHqEZP2QfyWdTgxyeLw+BydcCzOZeLxJL335ELHiXybcmXAPDnpm2oXdTk2XTfROkKd+BteZBnNIZ1fBQFAAUBG0J1JJvcQ3SoO5Xml6EKmWFebqhiGQ1/kL7cACTEf0mzJjtb5r5DMBzD+P03m1JNTrWUAGRA5bMMGByPchoTpkgbHg/TwafLo4bURFfa3HJLxlcrl9zG0Iby6iY1sskyKWOwhwA5pjst1QXXtX7FxXHua9B4DvgLpGxGI58VwDe8DvYT5n6pjX51IKwxF6G8sVES6aAEDsgl3moCMQjYuAfGAcVwa5+95+Eh5PTAB1/4Cn8slSHfEwSVWtuGIUrD+551JheUvvl8ulel/b7AHsny1Ox1+F431TZnvZ1nrckvjIqSFOZb1590kfXjQNRMce1HSpEyJHpixjnREf34NrHtCm3TKC5381oU2B4t2IFKls8hPHBB56S0epkPD568wn/++OOruu5oxhb9rdL3B9i1dYOeZnn/QWOuhVrWip/x4fogLYzAPRq1pZj2u0Ta4+KaC8N61q9GZE4BL+zypN/IWnXvmcivFhuUexUVqht+foBX0UbhB5SpE6tNT/333dp1mrasNbH+VUJ9+gjKSxNb/ijoQ23K6Q8b15Q0zkQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199015)(38100700002)(82960400001)(86362001)(7416002)(5660300002)(186003)(9686003)(6512007)(8936002)(6506007)(26005)(44832011)(83380400001)(6666004)(66556008)(2906002)(33716001)(6486002)(8676002)(478600001)(54906003)(966005)(6916009)(41300700001)(316002)(66946007)(66476007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HrhMyXggiUoHTc5ZRlv1jn2Jwa4M40uiEBA7qFGqe7TYsRb2WJTK1o9zww?=
 =?iso-8859-1?Q?Tg2WM/ueJ5I206SWSN7fMB86oaYyBaZORLod9gzSU8HXEG4u3bRHkpCCmb?=
 =?iso-8859-1?Q?NwMQS6uPTypC8MOsKXsTBPd33lry3Rb1tASlF7Eh+lKivANhthPW6lc2Vz?=
 =?iso-8859-1?Q?6NVqJYoCYoiSNsFANR0c0MYl/CjV10Xg4bMkoXLsXGBLyuEQFMJj0mtnud?=
 =?iso-8859-1?Q?e2CamhQA/Cif1nQ2LDbWrqs0SXsNrnrVPHW3vu2uN8fauYnDa6V8VHQl0c?=
 =?iso-8859-1?Q?HJHpTYg2xlwXfwKjoOY4x9BfDI7ZDr/kXhnUdpe5KRcapM/EuaDQXH5fqG?=
 =?iso-8859-1?Q?X2rADvWezD7P8KxfsICnWqKnmluYdnUOTC0Gqp+74hKy2tN0KMOOQBIF9m?=
 =?iso-8859-1?Q?Yz4iLUJVp+S1YKrEB9bAJyTtXIPZZzTODUO8TvNx6FnCROpgC+JylSZcTe?=
 =?iso-8859-1?Q?eKMg3grq4RuwyL0yk58tH5SyRiWnUPv6X/pq486gNqmU7AY8Kzo8DwM81f?=
 =?iso-8859-1?Q?xNTLl8ScRXGQt7rYX32VjvEhf0NoUmVyYUrJSP8Hre4RmMx5wsRDbPJ2jf?=
 =?iso-8859-1?Q?HUCetYvfa4dmsZ9nvSDkp1mqXcAWYkcWfohilgnRGUDjbbdude3WhXBAUX?=
 =?iso-8859-1?Q?tELwpQ1tuugzmbC1gNhH1stUFZO1iOi6NsBV4742YWFOrUX9KbaMeChiCQ?=
 =?iso-8859-1?Q?qZPhRjxlIMiui5fB9RiqFqoAMiABMogzGQmhVey9xeq3eOHUHLn7t5h2oS?=
 =?iso-8859-1?Q?n9/Gs4ns6mjT8m78arGy7begGqdeM7TQqwRDfX6CO9ITuhhZTH7ayKhNNt?=
 =?iso-8859-1?Q?YJ6CwVOKmZAh1yTth0EbaFzhHs8A/N9T6cJ0RMroWmRu2ZFuLIoc3LWRdy?=
 =?iso-8859-1?Q?i4Ltx/WbL6Py0C2AeDnefHGq4TXL304qZwWsZoJ15vYkBsziduezLUerI3?=
 =?iso-8859-1?Q?qFSOIB3WNGz6OTK2M43GZB7vnTCcOJS7G7TiN0nUZJOs0jDyf92LC9WBxT?=
 =?iso-8859-1?Q?VI5DauzniBMPXx8YGLAV2Ji2Jj2pGjLGb4f4Z5xqHdbd1LR1RXMQ/9Izfd?=
 =?iso-8859-1?Q?iF7VMTORT73JodH7oSJQi9JhK7sVDSncF+NKDvU8V1ihFWLohczJzR62ps?=
 =?iso-8859-1?Q?9wXyaIsDQGYTiAEXUCcPX4x1ZUDD6E+blKUdTHzyXmSwQXaQ0Q4BBjo6BO?=
 =?iso-8859-1?Q?MDkyRwUtjXI1icra+eheSEcHLeXXCALam+FKqJEcKOdFYsoE7GI6DTvt4G?=
 =?iso-8859-1?Q?ZanS61ybs1CYxX5f2AXjW77xvAbO1TSjoTKwoiT7/CIhvpX8zsEdbuJYin?=
 =?iso-8859-1?Q?1f0euRrKaoBnqeP/3SJrT7Dreh93XeoepmZyYjf55J3jH+Ewuymb04fmAR?=
 =?iso-8859-1?Q?xAviu3QYag/IqWxFXuz7KHyUEaW/V6DjBihbe0VisdIzJC8elW5+LSsCsu?=
 =?iso-8859-1?Q?bR03xv1bjKDlo5nPNSmZN0KbD6rf1enEH9VuurfqMAK3n3XLH1R8g/RAwW?=
 =?iso-8859-1?Q?c2g/iRzyd/cL+ajV8bdfslSsrksPUnaEXmEAUP3lk7d7EBV8c2u1JBi3ny?=
 =?iso-8859-1?Q?ET82kUP75PbyUytiDnNcY0u0Q6C8PfjEl/fgPlhdHCJWieSTe8O7aHcdD6?=
 =?iso-8859-1?Q?CsAfnTdbzv3x4Cb9a+DaYR/nNY/7gUZdBR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 723167a9-a3ef-4a33-1381-08dabdbba6f6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:51:28.5744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hK1R9/I/s4ZOo8j8JGCNsZmlle+kDWlU/W8+sMTeOBCiMQv8RpCZ1e2G4BIG3verG4AHmF6hjfPIS5xux1v1cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Dave Hansen <dave.hansen@intel.com>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 01:17:03PM +0200, Fabio M. De Francesco wrote:
> On lunedì 17 ottobre 2022 11:37:17 CEST Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > The use of kmap_atomic() is being deprecated in favor of
> > kmap_local_page()[1].
> > 
> > The main difference between atomic and local mappings is that local
> > mappings doesn't disable page faults or preemption.
> 
> You are right about about page faults which are never disabled by 
> kmap_local_page(). However kmap_atomic might not disable preemption. It 
> depends on CONFIG_PREEMPT_RT.
> 
> Please refer to how kmap_atomic_prot() works (this function is called by 
> kmap_atomic() when kernels have HIGHMEM enabled).
> 
> > 
> > There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
> > need to disable pagefaults and preemption for mapping:
> > 
> > 1. The flush operation is safe for CPU hotplug when preemption is not
> > disabled. 
> 
> I'm confused here. Why are you talking about CPU hotplug?

I agree with Fabio here.  I'm not making the connection between cpu hotplug and
this code path.

Ira

> In any case, developers should never rely on implicit calls of 
> preempt_disable() for the reasons said above. Therefore, flush operations 
> should be allowed regardless that kmap_atomic() potential side effect.
> 
> > In drm/i915/gem/i915_gem_object.c, the function
> > i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range()
> 
> If I recall correctly, drm_clflush_virt_range() can always be called with page 
> faults and preemption enabled. If so, this is enough to say that the 
> conversion is safe. 
> 
> Is this code explicitly related to flushing the cache lines before removing / 
> adding CPUs? If I recall correctly, there are several other reasons behind the 
> need to issue cache lines flushes. Am I wrong about this?
> 
> Can you please say more about what I'm missing here?
> 
> > to
> > use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
> > and WBINVD is called on each cpu in drm_clflush_virt_range(), the flush
> > operation is global and any issue with cpu's being added or removed
> > can be handled safely.
> 
> Again your main concern is about CPU hotplug.
> 
> Even if I'm missing something, do we really need all these details about the 
> inner workings of drm_clflush_virt_range()? 
> 
> I'm not an expert, so may be that I'm wrong about all I wrote above.
> 
> Therefore, can you please elaborate a little more for readers with very little 
> knowledge of these kinds of things (like me and perhaps others)?
>  
> > 2. Any context switch caused by preemption or sleep (pagefault may
> > cause sleep) doesn't affect the validity of local mapping.
> 
> I'd replace "preemption or sleep" with "preemption and page faults" since 
> yourself then added that page faults lead to tasks being put to sleep.  
> 
> > Therefore, i915_gem_object_read_from_page_kmap() is a function where
> > the use of kmap_local_page() in place of kmap_atomic() is correctly
> > suited.
> > 
> > Convert the calls of kmap_atomic() / kunmap_atomic() to
> > kmap_local_page() / kunmap_local().
> > 
> > And remove the redundant variable that stores the address of the mapped
> > page since kunmap_local() can accept any pointer within the page.
> > 
> > [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> > 
> > Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > Suggested-by: Ira Weiny <ira.weiny@intel.com>
> > Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> > Suggested by credits:
> >   Dave: Referred to his explanation about cache flush.
> >   Ira: Referred to his task document, review comments and explanation about
> >        cache flush.
> >   Fabio: Referred to his boiler plate commit message.
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_object.c index 
> 369006c5317f..a0072abed75e 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > @@ -413,17 +413,15 @@ void __i915_gem_object_invalidate_frontbuffer(struct
> > drm_i915_gem_object *obj, static void
> >  i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 
> offset, void
> > *dst, int size) {
> > -	void *src_map;
> >  	void *src_ptr;
> > 
> > -	src_map = kmap_atomic(i915_gem_object_get_page(obj, offset >> 
> PAGE_SHIFT));
> > -
> > -	src_ptr = src_map + offset_in_page(offset);
> > +	src_ptr = kmap_local_page(i915_gem_object_get_page(obj, offset >> 
> PAGE_SHIFT))
> > +	          + offset_in_page(offset);
> >  	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
> >  		drm_clflush_virt_range(src_ptr, size);
> >  	memcpy(dst, src_ptr, size);
> > 
> > -	kunmap_atomic(src_map);
> > +	kunmap_local(src_ptr);
> >  }
> > 
> >  static void
> 
> The changes look good, but I'd like to better understand the commit message.
> 
> Thanks,
> 
> Fabio 
> 
> 
