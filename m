Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0578196E8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 03:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9F910E2FC;
	Wed, 20 Dec 2023 02:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F1110E2FC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703040380; x=1734576380;
 h=date:from:to:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=CGSo2J67jciP10mMhqA/wEPICQ8MuhtB7YFbhyl67JY=;
 b=glewaWFbLm7RCafpJXWXMRjWitMLTY/9qLDVtwm6807yK6JR6MF0OK78
 b/+edbyKm6c6i6YeH7ZGU3ibZmOMKJE8y2HBw3O+jIND3yTijiyA6ljNf
 MkhpG29fSE0qoVYefPu961AwX7Vkah6hdNdOiSJvP+oag9ftFOafSlC8f
 s/MyDcjYL8lnGrt2CoPqBBL/7F5iIELzczg5pOdIZAl5LGCKRmP/QZW/I
 1sBa3FhYROEyew4R+NMik1UKsTTsGc5gpw3beWPPvWlwek0sxSQDjUmzM
 TFPhMjEex8c9WqI2HDe16IjLcQe6pEd/+a1hHbGGnBT40GQV6HinD0s+G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="395476551"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="395476551"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 18:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="1107577879"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="1107577879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 18:45:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 18:44:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 18:44:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 18:44:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIk/SuTA6+HfupD/rxaU2cgtr/2XlmY7gTUGqOC6Jh/Cmpva9XUFRVw/8cKIVcfmeFXOlQAa58utY7zpOVPLiUcRa3CTvoYVrsrz49Uk8vHKa7jFE4A2bnQR5lellOA+YPTzBAMIwOmQAa9+xdvIDFqDp8aAR6eoDvyueyRgReaCi5q9D0un+3q3HP+hdTUy807rRq6i1tyKcPfOIuZYBwChVt1hJfEMF4kMYsAOgnvQR/dpK3yqEs33bYgfe7CAinqgnVst1JOnWO53ry9sEGMhLdbpSMFCp59wc6xFUw1nV5UYOE4ys2/AaTCHzBXL9Ga2Hb82u8uO1NHf4y6TVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRQBzuIGQwz8mgocw1fbVIkQRQkXY8gh7J/kiia1r2w=;
 b=KR63Wf6wy97m4sOZ8/kq/6ddT1OO22uJ5g1dCoJjZWLIhMfOACakVhcYcFZAtscNRLJR2MGSaPWXyRIlapzxfdh7GVUcGXU4Qpduzo6xVF4+IAej70TgCtu19JraywC25o70WKBPvLnd5sPOIhJXgs2ZbbCDpOVa6AztY+IcP9vn9veNz6Va9dXWa2XSzeFwGOt/CiuSmsE9dvERgNVI7ECwOJ5ti+YDX62P5MhQhmDVF+B/6/5AXalKfx0xg3Zg/QI3Wq8j61BTyRnOfFojfcahN3j0fR618oEjJKUtwYaJaHKbsBpREu3RI2MmnlpdtfEPgi3H1NghrvMRjGbYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Wed, 20 Dec 2023 02:44:52 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 02:44:52 +0000
Date: Wed, 20 Dec 2023 10:15:40 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>, Kevin Tian
 <kevin.tian@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "olvaffe@gmail.com"
 <olvaffe@gmail.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>, Zhenyu Z Wang
 <zhenyu.z.wang@intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>, "wanpengli@tencent.com"
 <wanpengli@tencent.com>, "jmattson@google.com" <jmattson@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "Yiwei Zhang" <zzyiwei@google.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Message-ID: <ZYJOTLwreD+8l4gU@yzhao56-desk.sh.intel.com>
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZXzx1zXfZ6GV9TgI@google.com>
 <ZYEbhadnn6+clzX9@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZYEbhadnn6+clzX9@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|PH0PR11MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 177ed5d8-4e3d-4ca4-05bb-08dc0105a452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgNxGCvY3elerW1DKu2OZYpMWZns5aTvo02bfzh2HztUr3Q/St2FO8LctsKvj1QgE10/Y0ZxsemGiA47L94emAvMqYUsIMjv4d5EkmZMv/E2a6wR+JuUialiucTrngEtlKxpxPCHFcAiRaGglAIBmRrpBE1pfTphxBx1YHbzmDPZpahPqNMoR/qxGZcNzZx4FRsf5RzodKgM4PrtVN5ItCU/6U+6pijL1RT5rqGg3+ZIlBqqwgbZ2FPaBgMK15pKDTsAMnC3f5g+692XLUoMsy49Q5sFk2geuLRCvhJt8DKppYH0D40cqP+LFn39pxtOpdhxS5VkEXQVrz2tRTn6O94l7G7p9jM1cBm6QyqC9br0pPPAFFaIv6qSOW9ltihTfopG6TOa0lgMLOZ/wPqP0r+wY0vDtTTPtmVUd8wEnhzqIHOWafoD5Wbeb3M+IKKiUJ/wyxWDLzRLi7IlS+hxDPpohwIEYzOeFsBCFS9ocx8XIadmZFQXQh8O4lL1JsYclRNRpBxaqPCGSWYDq/OU+FGsvA9FcRgVyKhzFdfepSe4K1QUtotwasXkIANVeDEqKGco8lA//G6xDqEreeARJd5UZT8xSk9q3jVCepTw//N2LdZRYWblC+YaGh+TvWVm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(3450700001)(86362001)(2906002)(6666004)(8936002)(8676002)(110136005)(66946007)(66476007)(5660300002)(66556008)(316002)(38100700002)(7416002)(82960400001)(478600001)(6486002)(41300700001)(26005)(921008)(6512007)(83380400001)(6506007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ob6Uy95xtxFD/NsbpaLB3q74ZlQrEtvdI2wIihFieef03+L6BiPx1clxym1?=
 =?us-ascii?Q?i9+IDH+ezHc/x7DtvlU4HIaiYwr+UcviSo/DWBHYW9wnwFO0IODEYxgtQLtR?=
 =?us-ascii?Q?7XumH8gEkOV2xgauuH4ojtrjZtWBg04kpnuJRFCavStzc/4OJ4lhupvZYV37?=
 =?us-ascii?Q?XMdZrR/luT4GwrK48CBMSUhB8Qagt48M27OwKrhM5MXdLJn4RnM10SGroGtq?=
 =?us-ascii?Q?piQZy7S+xBKYDbmAoAQroAH3DGehy41d53Udq6sc2M7s2Qe7H9fd0zE1FT57?=
 =?us-ascii?Q?knO9WwI74u1rKvAvuFE4RB3G+EEPl1alXSy49mOb9ZozUO52GbYioKma5dcO?=
 =?us-ascii?Q?bqOvuOwEIBdFtQVx0F8fNgF2Pf0WBoxbFtyEFgYAKoqbOqYoLa/jx+EZdYd9?=
 =?us-ascii?Q?uMheFsLTFsR1gIZ0C3prPVrGhUd/aX3DzTy30Ous29qis3jYC7WqRiTuNuM8?=
 =?us-ascii?Q?KaMxCnpYylWavEEsAfOq16YXqSRdBGd+wQoeIous8qe8Ke8dHsrLiU42lqVu?=
 =?us-ascii?Q?/Ny3hQqDWwHIkf292d08ZhDEtpcS05nUjCeDfCUmU/nrtLCChm3fRiXUO0R4?=
 =?us-ascii?Q?oghrOwbl4IEta6s5ZjQLxi7ZD7cmaPyE55xU88Yl4wQ34c7jr6+fo6d4Fcs/?=
 =?us-ascii?Q?OBWCTlWcOXYml7SmoLksqSVwGYyIh6RdZ7q48dHS+sCvE2gzEYwnGs56W5vJ?=
 =?us-ascii?Q?Gj8f6kfRitPLakc3n/eTOGt4fArAAfXgnw7bFZmEa8KcqNC2Mtb5E+rmfe5g?=
 =?us-ascii?Q?nssB015qyiDHKMct6S7VXKoAv36KpSYPfsTKYsVVfKI6THk1kD8U9eeHHNVU?=
 =?us-ascii?Q?uhu7X5O+yvi4Q42qqHjalNU243ruUgpt25PjP/685SwZF8cZJx4rQVQ08SYM?=
 =?us-ascii?Q?AlVNkWdhrY4ADNXyZwcH/8D33/U44FgLZilPRNyvKiS17Cp7qrcL6XpSDdhI?=
 =?us-ascii?Q?025Ak6rDh45gmwAUlHdRXL7MeOZ3hDLhDzP1eJI7ckKrChU/tB5Jxhd7x9Ax?=
 =?us-ascii?Q?/A0NLj90dZQ5rM15FvbRxaqHl5RcYOXxdV68YNCsuP9fYjhTO+6wNKJNxC8p?=
 =?us-ascii?Q?ETB4u/Qx3Uvzm77F9vlcFane/2mvdCSknc/8lJOJm47GJAYYMQW3eJefv7Ol?=
 =?us-ascii?Q?a03IL+xqxPtc+xGWUjB08F2x8ZodH6hrvI7vbMgN2kF7tjs0gEPUjt1pIBdm?=
 =?us-ascii?Q?ek1nPlim0xuDyl68/SqkG8ODuDVaSg4c7w16n5VrgUv9Tpz8OR9WCku4tiIZ?=
 =?us-ascii?Q?iLpHvBK2MXp6JWLHFbKyUPDyU0EyvDh80IkdMIDvsFKK5EufA6hfRO7If/8U?=
 =?us-ascii?Q?ej7jcFfGTntG8cmg/mm0LMuSN2TdPHskjqiTiLlu0TBKNSHhhPaQ7PHiVD5w?=
 =?us-ascii?Q?jOWN0Fyv8xosYFv6U0Q0pzrlGplmglAA6EfZQfwQtW3yZd9fDt8F9Ne9R8zi?=
 =?us-ascii?Q?Ls+WOekQltV0RaIz99qyNhfoE5T5lQA6iuAVZxQ0Zfl1F84UH2qmDNOcmbZo?=
 =?us-ascii?Q?/nq9F7QRBiQ5h30z6/l0D5ZhtpYqIe5k2KoSVQ7PXIMcaTzlskIkdN+ABDHW?=
 =?us-ascii?Q?4eYeXSLh3xHZ4LiBPP9A7CbXFSKuhP6Gh1NEHkjt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 177ed5d8-4e3d-4ca4-05bb-08dc0105a452
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 02:44:52.4767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLJBZ6Sg7ohQg8JDBw8IvO/4F3dObpMORd+WjjXjr8Ec0lFpL/olhmZcXm6Q2CQ1SP5lfWlzqCaXcJvt0cWe7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 12:26:45PM +0800, Yan Zhao wrote:
> On Mon, Dec 18, 2023 at 07:08:51AM -0800, Sean Christopherson wrote:
> > > > Implementation Consideration
> > > > ===
> > > > There is a previous series [1] from google to serve the same purpose to
> > > > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > > > requires a new memslot flag, and special memslots in user space.
> > > > 
> > > > We don't choose to use memslot flag to request honoring guest memory
> > > > type.
> > > 
> > > memslot flag has the potential to restrict the impact e.g. when using
> > > clflush-before-read in migration?
> > 
> > Yep, exactly.  E.g. if KVM needs to ensure coherency when freeing memory back to
> > the host kernel, then the memslot flag will allow for a much more targeted
> > operation.
> > 
> > > Of course the implication is to honor guest type only for the selected slot
> > > in KVM instead of applying to the entire guest memory as in previous series
> > > (which selects this way because vmx_get_mt_mask() is in perf-critical path
> > > hence not good to check memslot flag?)
> > 
> > Checking a memslot flag won't impact performance.  KVM already has the memslot
> > when creating SPTEs, e.g. the sole caller of vmx_get_mt_mask(), make_spte(), has
> > access to the memslot.
> > 
> > That isn't coincidental, KVM _must_ have the memslot to construct the SPTE, e.g.
> > to retrieve the associated PFN, update write-tracking for shadow pages, etc.
> > 
> Hi Sean,
> Do you prefer to introduce a memslot flag KVM_MEM_DMA or KVM_MEM_WC?
> For KVM_MEM_DMA, KVM needs to
> (a) search VMA for vma->vm_page_prot and convert it to page cache mode (with
>     pgprot2cachemode()? ), or
> (b) look up memtype of the PFN, by calling lookup_memtype(), similar to that in
>     pat_pfn_immune_to_uc_mtrr().
> 
> But pgprot2cachemode() and lookup_memtype() are not exported by x86 code now.
> 
> For KVM_MEM_WC, it requires user to ensure the memory is actually mapped
> to WC, right?
> 
> Then, vmx_get_mt_mask() just ignores guest PAT and programs host PAT as EPT type
> for the special memslot only, as below.
> Is this understanding correct?
> 
> static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
> {
>         if (is_mmio)                                                                           
>                 return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;                          
>                                                                                                
>         if (gfn_in_dma_slot(vcpu->kvm, gfn)) {                                                 
>                 u8 type = MTRR_TYPE_WRCOMB;                                      
>                 //u8 type = pat_pfn_memtype(pfn);                                
>                 return (type << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;       
>         }                                                                                      
>                                                                                                
>         if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))                            
>                 return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;         
>                                                                                                
>         if (kvm_read_cr0_bits(vcpu, X86_CR0_CD)) {                                             
>                 if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))               
>                         return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;                      
>                 else                                                                           
>                         return (MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT) | 
>                                 VMX_EPT_IPAT_BIT;                                
>         }                                                                        
>                                                                                  
>         return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
> }
> 
> BTW, since the special memslot must be exposed to guest as virtio GPU BAR in
> order to prevent other guest drivers from access, I wonder if it's better to
> include some keyword like VIRTIO_GPU_BAR in memslot flag name.
Another choice is to add a memslot flag KVM_MEM_HONOR_GUEST_PAT, then user
(e.g. QEMU) does special treatment to this kind of memslots (e.g. skipping
reading/writing to them in general paths).

@@ -7589,26 +7589,29 @@ static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
        if (is_mmio)
                return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;

+       if (in_slot_honor_guest_pat(vcpu->kvm, gfn))
+               return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
+
        if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))
                return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;

        if (kvm_read_cr0_bits(vcpu, X86_CR0_CD)) {
                if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
                        return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;
                else
                        return (MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT) |
                                VMX_EPT_IPAT_BIT;
        }

        return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
 }
