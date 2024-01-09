Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07846827CF2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 03:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB33E10E2E4;
	Tue,  9 Jan 2024 02:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BD210E2E4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704768060; x=1736304060;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=GHTecaLpdk9OVDkmLPXmggX17M3snVaYsf1yUsItfjk=;
 b=bKPt/u8jN9L5M4MH3DyvCGGMTYX3oEjtBsMEH78UUHdGVT/RxNwwK8v8
 TGZO/IcPmG/tfiujPPpZivBrP2t+fa1bmpIPqgovur9dUKEWAk7DbHLFo
 Mcy+YmSLhErkG0mec4HeJr4QfdKNvvRLkBiGypFnn0vs8BGZXBwkupCyD
 FslY5EkgCNY0rkRNoA/aHkzk4UHL31yzoY1rQSW0TFdjCaQ1z286/dbh4
 2Mix93eIezwPXC/6WKTZb5X/utRfwWjhVY2yDsCIbdmxaA/GiG6nxfqox
 Rg99GM5eg00yalWfGEOjxwUhkON8LKUgjdJ5bdEtFcfJFv/Fan6JsUvA0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5431596"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="5431596"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 18:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781624725"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="781624725"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 18:40:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 18:40:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 18:40:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 18:40:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 18:40:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7GxL7i1dBKKV8BjEzJpK9AioehEI0tso/+odpnAdy0CDCGu0FreqZ4aadxY1ztvk6RsS+AbcF3pKM5K1Ghp7kJJW2Y5e5b6R2p5rZHhLa763rZmbj/ZWuuoFdys2zm9drGRUJFRe6/xOqW4ElmkpHTq4E4fmQ68Z/6ybDVjBJRvJ4hxFuzqfGgALzLWgBblaNM2pkn0AFFLQUYWPIFrOxUJDeWGdpapozPetSq2wu68pfRqZs28+7E6vD+lQAuaQp5He4wQ1tDAkGkG3P3f/RT8DoI7xXfeuA3OjSKIZXBrmoXEgNvLIodrje/y8oqUp7RF3wDJRGHV2hfkbF0QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3S0fKhWgTJDQNFuWp38f/oJfpnrwr7fPtaAA7eWs2A=;
 b=AcjuSPdjZpMolU9+jnQ42wqo3Y4bW/A6fDkS9N9Xw0VHLiO/FX6BbSqWmjzaBxnQBlIMjZt1TWLoWaLVEvuEQH1kpL/Wg2SvDrek6M4hfjGu0U/QXg7BtS/RG1PokEDSg4IN4mYOpMK890EvqlJqyIHzn90k3KMVjcblbWpOqN9JQTIpHmKbe5KlaapERCxjKXAnlWpt5Kzpq0opbnNTMSirlNuJC6yWRtxEFE952IIZnAvaEpJYGdGTgSDJ7ng+9Dw/kjDMGVgf+oYGR/yhbYV0OvJlCUGBMGfdVnmmQFo4FzR3QyidFidbfYrKK/goq6NgGcu2WSfliHOsqcD3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.21; Tue, 9 Jan 2024 02:40:47 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 02:40:47 +0000
Date: Tue, 9 Jan 2024 10:11:23 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <ZZyrS4RiHvktDZXb@yzhao56-desk.sh.intel.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
 <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
 <20240109002220.GA439767@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240109002220.GA439767@nvidia.com>
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1662fe-0b7c-4a60-0cd5-08dc10bc6299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJWAWZGHaw4NgzAECMAWEQcjw3JkkaWJMpxEUuNevttsmO/a1yv41Z72Y+yTq/Cg+EQzgNsY5pa7RMiFNf6ikt7wr4qf2Txv0LZCzoGqHqi2AZvFzDrD4kQAYsQcVuSPGj/oeopzp+wrYrv1jaITdo/NjIGl+Tb12Ilx7stf1tZor3Keiw6rCSc1DOsq3mKTNjjL2paX9YwFvVSevbANyS2JP1bsrPp+V6qdjjc16VJO6uRfcasZmTh0wjJswNTPwwHzlrVruJKt7OAH05sDAOaeIxOzKzf8L/TakpUXrzT8ai8JxBKUmlHGjh9yhZzGEypEWyZ92Axg+THsOpqpGG1jIHfS0sUdFEK1PC+p70eX+NvTThGKM3sEVBv7Jv3viUG1Hp+Kien6VLuBkcBVzCDZqEbcoieEMCWA0HO6GXj7SuDUuPqCMmoGlV3mElaPCpa+/3gzAK77L3t5/kMZ7pMkoiFvw9USmgoHfEmyq/5BgbvG707TVUm0wFNs2UzH65lFL6TuJWaKD9lCM/7hMguga5Y09zhrLJNxBFPnhq6Xyac8dIzIwfXYDJf7ooYJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(6486002)(478600001)(26005)(6666004)(6512007)(66476007)(7416002)(83380400001)(316002)(41300700001)(2906002)(66946007)(4326008)(6916009)(3450700001)(5660300002)(8936002)(66556008)(8676002)(54906003)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Pioqf2uu4CepzEf4O7slo2VONoKY/9xQ7lA41L9WJXuKqwKHp0u4UnVLkI6?=
 =?us-ascii?Q?aLqP180irJhaNjdCI9v4vyJbREu0frF2Dv3WHRXBMTJh1+WJVO5FReFgbvpu?=
 =?us-ascii?Q?Q9i0FoqCKRud517snv+7Tqrh91+tWgJtZ3pVcW9KWphysf/LbZIhFxTyLEy+?=
 =?us-ascii?Q?pwLvWUSwo47N5Ml2a+fjFO2CvQhPsOe0zJGIe5x0Z7ykrH2fXbl2qX49+HA3?=
 =?us-ascii?Q?DMxmWqckZoLXdpi2C10uTAPkaLRRgJQXc+rvWiqUoqNHe+ueye5SrkCyQUS/?=
 =?us-ascii?Q?ss/DWbGOhFaDGigqQAZVEvQsQZd7Tp1zvX9VwK2tIsDsrILhYFYCC4z/f3pn?=
 =?us-ascii?Q?0AYr8adfKRlxNnSgxxlorsf1TLKQ+fclQCH3gz1KMn30Bzk9p7d40E7AEFaQ?=
 =?us-ascii?Q?qWHYJmOmO7GXJcwMeoRuJ4lHaToQwHdiI43UCJViQKbXe1qLJh0f1ob8IRAy?=
 =?us-ascii?Q?/ivG/YcD7vWqg1IxeHnzWy8rivcdUo4ngTy9s2Tkmy6/0ldrxyehvc+ancoP?=
 =?us-ascii?Q?vXeQ9ubB9/okJsKLg4ecNDUtQpN4QmhIpV9qKvK6pjFwLC5FlkyOOhrRb1Sm?=
 =?us-ascii?Q?KOuSXqB4oxH0rMii5Absya6B166OCCGrBlukwcbs4YgfsUgXjZVGP4EUO4Cy?=
 =?us-ascii?Q?RyX6F9Mtv2iTOVNCcDdKDzvjcm7XWDl8K3ZVg2QVYg6gijTcKrUmJP6Nvd6Q?=
 =?us-ascii?Q?weHUtAhnip1SrOtQhbv/CEsZzRQgEJOdmHHQdB/C85mj+NGZ0rTCIdxU2beK?=
 =?us-ascii?Q?im5vevGNFTibLA+EoBsuN3GNVGg8+TuMcIiryEo9wRSCuJrKCkrst8u76iP5?=
 =?us-ascii?Q?/Su4hAX8Ta9SJ/caVk0+kwodhXkBBoDIz1Z8N6IPOkcyAH4cDiFIZHxN6yM9?=
 =?us-ascii?Q?/B4Z91FeaHsOem2pttr0DcTQm8G8VNRE5yEoJpaGrSWWz0DeGaXnhmMaVffo?=
 =?us-ascii?Q?ecJy3WS/5KcSVnaelKRT499U5N1+uznDKXyC3sMWgto7flmPINF4O2OeGHCy?=
 =?us-ascii?Q?eBLDPViVDn3u+lI7bo0KgcUS1iDmY30IHyMKJrAxPSkUb/4y9v6rFpWaYhE0?=
 =?us-ascii?Q?5VrSfIUUkOpxkM6bTrBHTGrgJjiRPsKksmLKDM2nd2PaOXQhSUtxmZasmFPX?=
 =?us-ascii?Q?+sy3L5ZViQC642juFuzvWCFh5YBZhqWnwdtSAvv/qW5DdlkbD8k+mnekbuDJ?=
 =?us-ascii?Q?ahn8oqQF9trpsDtCYWiJV4T7e/Zd/tqC8UP4AoyF+wPVp/vwqS1wHa2tEHme?=
 =?us-ascii?Q?+15mC2IA3Kb90xx1WmWvW8FSUt+t7gVYBZjDyd7CMMWmZfb1N9JAlraksGeI?=
 =?us-ascii?Q?Di5yvTd93rablVhGAPKkb2nXyBcgMn8Ds1v1j+68w7RkyPFWKPJ11t2d4PWM?=
 =?us-ascii?Q?yLdVO9jZ2liLiLLMNzrFsWpXSZ5vxjl6Zl8338wD9OCI6IJndziRDCZ7x2Wr?=
 =?us-ascii?Q?GJvcMywBkA2mtA9gDxshV8+RWoA/QQ3DH/cjEVQs5wPobfGHIr74AK7+l/4O?=
 =?us-ascii?Q?UCjXEpdMrp9SWnb+2OOPVES93cvampvtmXAogdv4D7827AF/zuJ+n42GSkGp?=
 =?us-ascii?Q?jnW1+/eVQF3nLa5rBOnxjTj/M4kj192z2/x/duhK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1662fe-0b7c-4a60-0cd5-08dc10bc6299
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 02:40:47.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFOd29LTDWGmxYZnqpFmlRl36FHBVDVXwSaZTiN0CpwENhfGA5qHHc2FptP97UkzN2YeTUDL4m+2gjB6WbJ2Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com, olvaffe@gmail.com,
 kevin.tian@intel.com, suzuki.poulose@arm.com, alex.williamson@redhat.com,
 yongwei.ma@intel.com, zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 08:22:20PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 09, 2024 at 07:36:22AM +0800, Yan Zhao wrote:
> > On Mon, Jan 08, 2024 at 10:02:50AM -0400, Jason Gunthorpe wrote:
> > > On Mon, Jan 08, 2024 at 02:02:57PM +0800, Yan Zhao wrote:
> > > > On Fri, Jan 05, 2024 at 03:55:51PM -0400, Jason Gunthorpe wrote:
> > > > > On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> > > > > > This series allow user space to notify KVM of noncoherent DMA status so as
> > > > > > to let KVM honor guest memory types in specified memory slot ranges.
> > > > > > 
> > > > > > Motivation
> > > > > > ===
> > > > > > A virtio GPU device may want to configure GPU hardware to work in
> > > > > > noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
> > > > > 
> > > > > Does this mean some DMA reads do not snoop the caches or does it
> > > > > include DMA writes not synchronizing the caches too?
> > > > Both DMA reads and writes are not snooped.
> > > 
> > > Oh that sounds really dangerous.
> > >
> > But the IOMMU for Intel GPU does not do force-snoop, no matter KVM
> > honors guest memory type or not.
> 
> Yes, I know. Sounds dangerous!
> 
> > > Not just migration. Any point where KVM revokes the page from the
> > > VM. Ie just tearing down the VM still has to make the cache coherent
> > > with physical or there may be problems.
> > Not sure what's the mentioned problem during KVM revoking.
> > In host,
> > - If the memory type is WB, as the case in intel GPU passthrough,
> >   the mismatch can only happen when guest memory type is UC/WC/WT/WP, all
> >   stronger than WB.
> >   So, even after KVM revoking the page, the host will not get delayed
> >   data from cache.
> > - If the memory type is WC, as the case in virtio GPU, after KVM revoking
> >   the page, the page is still hold in the virtio host side.
> >   Even though a incooperative guest can cause wrong data in the page,
> >   the guest can achieve the purpose in a more straight-forward way, i.e.
> >   writing a wrong data directly to the page.
> >   So, I don't see the problem in this case too.
> 
> You can't let cache incoherent memory leak back into the hypervisor
> for other uses or who knows what can happen. In many cases something
> will zero the page and you can probably reliably argue that will make
> the cache coherent, but there are still all sorts of cases where pages
> are write protected and then used in the hypervisor context. Eg page
> out or something where the incoherence is a big problem.
> 
> eg RAID parity and mirror calculations become at-rist of
> malfunction. Storage CRCs stop working reliably, etc, etc.
> 
> It is certainly a big enough problem that a generic KVM switch to
> allow incoherence should be trated with alot of skepticism. You can't
> argue that the only use of the generic switch will be with GPUs that
> exclude all the troublesome cases!
>
You are right. It's more safe with only one view of memory.
But even something will zero the page, if it happens before returning
the page to host, looks the impact is constrained in VM scope? e.g.
for the write protected page, hypervisor cannot rely on the page content
is correct or expected.

For virtio GPU's use case, do you think a better way for KVM is to pull
the memory type from host page table in the specified memslot?

But for noncoherent DMA device passthrough, we can't pull host memory
type, because we rely on guest device driver to do cache flush
properly, and if the guest device driver thinks a memory is uncached
while it's effectively cached, the device cannot work properly.

> > > > In this case, will this security attack impact other guests?
> > > 
> > > It impacts the hypervisor potentially. It depends..
> > Could you elaborate more on how it will impact hypervisor?
> > We can try to fix it if it's really a case.
> 
> Well, for instance, when you install pages into the KVM the hypervisor
> will have taken kernel memory, then zero'd it with cachable writes,
> however the VM can read it incoherently with DMA and access the
> pre-zero'd data since the zero'd writes potentially hasn't left the
> cache. That is an information leakage exploit.
This makes sense.
How about KVM doing cache flush before installing/revoking the
page if guest memory type is honored?

> Who knows what else you can get up to if you are creative. The whole
> security model assumes there is only one view of memory, not two.
> 
