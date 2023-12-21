Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22181AD0A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 04:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1614910E640;
	Thu, 21 Dec 2023 03:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850B010E640
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 03:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703128407; x=1734664407;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=yqGZnOsPRSanbKwFQUT3CCZ3nNCgXQ0X0q4YGNcSHbY=;
 b=MI4XujK7HrzeXAKbMXVqujtVUMgTNUxJrZjfyGlpaKQ+ymTFtQ9IxUbA
 BnKVRwNc/7E45uVSsleXpsAejHSr3nMU5MiXU5TYH15Sf2PPPWWw9/iB9
 bzbV+j2pL2AZXP09eHfo6JmI3YIB3o9yJuioBvR7VLCCog5Clq6SyEkUF
 z7LwcStCL4AuAyhZYRtaYfd/gUAecL9vkSR8z2tgqacS8Y2xBNsH1arXh
 b11pyxhhzIMCtNMFH6/NBrKZ4DRbreQltHAp6zqjHBaByvk3Ac6tsjrk7
 DoQ21aqLOxh2vXzWwERyF6kM/ISpBAwj+BOUYQOprZc1RwhxlJLt2VHke g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="14596501"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="14596501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 19:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="24817237"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 19:13:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 19:13:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 19:13:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 19:13:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 19:13:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaV7aLeQtz+hE6I61cdVr1aBEbs7mXalwRcYZJ4+q1OKQxjBq/K2/ZZzOLIhg5Q0eVkMQxYZSQMu+NKuvbP+cLQRgR2Jo+M3+jJxUuwfXzmKtkLuQ0OLy3l34Nr0APDsNH/a/bGTOpHcP/yiw2zISvMaadfvVh3QbhipygboG/iuj4lw8AywUeBMoDIqNxH+5IHlfMWXKDpk/Hem4xtaf5N942xaoj/wGqK9CyxZj1NaXya5QnflFI8G46Ud3CAB9A5CLrnmqkDau/6bN96l9xa1RtM5PbxQrngE82hzMs7aZUyE9W+PVkDQp4MkV/nwm99AQ4LzIYi82LOGjoo+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1kToOOWznFbB8IgBYVpggVSF5INMvYTpmdq+BhIlnQ=;
 b=KdhZfSVzefM/8l8x41p8JYWKGoB2NhR3xc7pHhKf79jUeREqkturYXp35LMjghbHmtW02ghmYH7Zeql+ZKcAOLqxzQrI2KZgur1ozwGm1wqjQwO5ChzXdTya+SzVwjWdt3T+TN1xpooke8DDqoBUM2CX3VOjGiYZ6GX/L18kJqlQB8wbLj3smb1PqquS3CD9O5KgG2ZNw8Znnx0MwzxyGiqEq8r+MFoO55M2/sy9En1/O0MpAToP2ZDIM413V12TJBYVVzwAigtH7V4+m8DXiDfadVK5rEwHEKzRAwbUnMzViNEtmik5zgFy8uqlU/jxe4EdWR4/NEVHL5r2sioNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.19; Thu, 21 Dec
 2023 03:13:23 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 03:13:23 +0000
Date: Thu, 21 Dec 2023 10:44:11 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Message-ID: <ZYOme3WddWOV2J5d@yzhao56-desk.sh.intel.com>
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZXzx1zXfZ6GV9TgI@google.com>
 <ZYEbhadnn6+clzX9@yzhao56-desk.sh.intel.com>
 <ZYJOTLwreD+8l4gU@yzhao56-desk.sh.intel.com>
 <ZYOfJ_QWG01aL8Hl@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZYOfJ_QWG01aL8Hl@google.com>
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: e10bacdd-12d0-449a-7e2d-08dc01d2ca3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFncHqHRldd/l0sJ69pJ1+jbjZmUeUv9C9/aJZudxnFvVRDY/CjNNqY43K98CEmkLkKmSXFjKLHmxGEuRfh9G7ST/c/hRqYMf3ZAG1O7Pdbrh9CeiQsu3xXmugUXBClwiSiGlAimklFoz/U3O3rUi7r0S/eES+HsaEMF4kAgkUGwSnwrEXE4+zNFmzqrgtSZLosdmTdO7OaPSlnBS0PugD7oYdNoLEQxXlemeSXyPpYI3exjppTx5ZCogn8mEEGPo5gAIrEjhabqVxj1W5N4V/yXnhtoW1e5m+LST/Y2M7pNmM7ixvi4JxB/gCWcMA/HLg8FkEQWh/wwkmpUZbePhnS29e9H/eUOafwcd7zA2rVZBbxK24rIzBpCp0zh0r4i8AWB1sMPSMHMLflfg7VFqID41mFO0ZeiNTAzS3EY64XqCDgLMO6X1AhuhYr1owVv51JbsF5w5+J442r9tVlS5eNdqgOCLqMEwrGGbB8iG5hfTUOB3hy6Zkt1OD6brveRs33T2aQ9zr1ak82h7D4HjTsMuvdUFyUuIaWiyLbe1xfHrf1SDFYpg0qtJL1gUJCe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(5660300002)(7416002)(3450700001)(2906002)(86362001)(82960400001)(6512007)(26005)(6506007)(66556008)(66476007)(66946007)(54906003)(6916009)(316002)(6666004)(41300700001)(6486002)(83380400001)(478600001)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JbkwAnnfnyCrLhAg83BMepMSKf7gMW2q0Tj9p+KHW+DdH9Y0uP9wis/GeTYt?=
 =?us-ascii?Q?A1iXhuUwnZqGMu91YPc/hjPRLRNypAYdER+OPI9/5qFcw+dwE8HJP4PipThf?=
 =?us-ascii?Q?sucVXTxYenKbj4t4fdFEvvMpbQs0Tgmf7ylk4cW163vzFKn0+8DZhkEf7lX5?=
 =?us-ascii?Q?KV0U2uy9+l4/ZgME5iYOB0TwzTv4MNGVLGuFy/xs9grCfOpDdQyszmIGObDX?=
 =?us-ascii?Q?Yn3L8JCmLHQltQ79uY9gVQfC2TSnpVCru70LW7NxdAuLfgxLVjn/R85oCmUR?=
 =?us-ascii?Q?Rpwx7k8dZXCdRPiPMYWhhfr37p9JA4fBRT3Sx9OCH+j+YMjP4kfSX9lF9kO/?=
 =?us-ascii?Q?+HMGlTYEOKcstGRkdK+Fk2VaeWeNmLWxg+HV9rPxCgRZgIMxAuiPM7BoFRLy?=
 =?us-ascii?Q?fvfQjvqW0V/85onf/BIxl09Yjr2Wg6YwTSw7hTcQ9Wk5BGF79vnI8C9+9SbG?=
 =?us-ascii?Q?GLwym/EnYLJAc8VEZqkO/a4UOlELNmfa6/sxmuIFj3LFtK6W9qd/lxsA07NO?=
 =?us-ascii?Q?VEB0pJ0SAxYyozydHvE00phqALPrbnMs4UgolABzGqoa9se89JKq6nR5lOnn?=
 =?us-ascii?Q?eUyer5gKbyZNwIX1qC4A6g3xRpn170/1kaLRwmRjoII00/XI6upaJkPxlk9A?=
 =?us-ascii?Q?Za+F66yhkV0M0djvFlv0y7iC4zAqgo+ni20hzokbIZ+fmnXaSuZncrvfcRol?=
 =?us-ascii?Q?jAzRYVIgexW+gzi7sF/u3cfZWdiquWdeOtGV7BupHfEWHo5kPPy4D1ZuNk+R?=
 =?us-ascii?Q?SfFCNXXAZ4whOYtL7FOx4hMKqWiSFH/JnwLguPge4+BDYDCmKM3z4sd2SwmL?=
 =?us-ascii?Q?c3lRiJomhdTyRA3ghq4mmQUNdKfdzpzAhy2WBai7Q/MYqpQRr0p98EBBjm0V?=
 =?us-ascii?Q?auxOGHEJVhw+mX5n4KqiAApTxzItDPTqPabuQn3gpQdGnvGEQNtvxOV2Jox/?=
 =?us-ascii?Q?eAvIwHWrPBZe9tbtgsVBCh2+M8SBs/yMIqzVPsXPY3zr2BGLAanai5TJyRD8?=
 =?us-ascii?Q?VZL8/+GBGVOKwdMX6tKW20hVr7knFudflqLDfKNlnJAZFfhU3HwZRIc6pNVB?=
 =?us-ascii?Q?0NtRNg0RNfwN/C4QHWcP3lES3JxdB+FlPvloaBJakt+FTHpm1Zo2h4IuyI9X?=
 =?us-ascii?Q?ZCpdDKvFHJC/6WCryY7NWuyzhkroW2vpIkdr0EVSIztZCQudBAN0dSlmPFK4?=
 =?us-ascii?Q?TBK1r7LdfL8twzDdP/MFVIe07EVYzy4zDwWL6eR0KTkPqGULNuZm2hPuZ9Mx?=
 =?us-ascii?Q?TCR/x036BE3GB5ZTWulR0Ay7GCXjgDC7DGu1cmkG9200p4PrgeB3Tr9KG1mm?=
 =?us-ascii?Q?IAq+m1z6k7k/kB7sXOCBiVtsO4TlJQOynvxf6Vl8W5GceIheGtO/mf7O39lg?=
 =?us-ascii?Q?1iEUiCipi2ddx/yTXTpMn+MTxLSNW1zTKeQvF4T8wgnt1av076HFkpFVGrrq?=
 =?us-ascii?Q?Oxx0HsNT9qOcGL7aACN+9PXR6J/z44yB3zsFPXTATSdmaA/eQxguvlhqHgX1?=
 =?us-ascii?Q?z6XgHWJ4JGBlD8PtyyZToqMl6xYI+K4vpTqbubbNV+06K4TrqxmfMvZ1/Rh1?=
 =?us-ascii?Q?Krm+BKehGySwfmEsy4PrBYbW3FXRgYKO5DGyh/Ac?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e10bacdd-12d0-449a-7e2d-08dc01d2ca3c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 03:13:22.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0dXTi6IWdCtbCyvx/YB+6EHhS39wiZCPlrTyjY/kyE7KLnUVlzp6E1LQ0dy699DJt8U1wHCLOCcuFxx9Ip2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 Zhenyu Z Wang <zhenyu.z.wang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Yiwei Zhang <zzyiwei@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 06:12:55PM -0800, Sean Christopherson wrote:
> On Wed, Dec 20, 2023, Yan Zhao wrote:
> > On Tue, Dec 19, 2023 at 12:26:45PM +0800, Yan Zhao wrote:
> > > On Mon, Dec 18, 2023 at 07:08:51AM -0800, Sean Christopherson wrote:
> > > > > > Implementation Consideration
> > > > > > ===
> > > > > > There is a previous series [1] from google to serve the same purpose to
> > > > > > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > > > > > requires a new memslot flag, and special memslots in user space.
> > > > > > 
> > > > > > We don't choose to use memslot flag to request honoring guest memory
> > > > > > type.
> > > > > 
> > > > > memslot flag has the potential to restrict the impact e.g. when using
> > > > > clflush-before-read in migration?
> > > > 
> > > > Yep, exactly.  E.g. if KVM needs to ensure coherency when freeing memory back to
> > > > the host kernel, then the memslot flag will allow for a much more targeted
> > > > operation.
> > > > 
> > > > > Of course the implication is to honor guest type only for the selected slot
> > > > > in KVM instead of applying to the entire guest memory as in previous series
> > > > > (which selects this way because vmx_get_mt_mask() is in perf-critical path
> > > > > hence not good to check memslot flag?)
> > > > 
> > > > Checking a memslot flag won't impact performance.  KVM already has the memslot
> > > > when creating SPTEs, e.g. the sole caller of vmx_get_mt_mask(), make_spte(), has
> > > > access to the memslot.
> > > > 
> > > > That isn't coincidental, KVM _must_ have the memslot to construct the SPTE, e.g.
> > > > to retrieve the associated PFN, update write-tracking for shadow pages, etc.
> > > > 
> > > Hi Sean,
> > > Do you prefer to introduce a memslot flag KVM_MEM_DMA or KVM_MEM_WC?
> > > For KVM_MEM_DMA, KVM needs to
> > > (a) search VMA for vma->vm_page_prot and convert it to page cache mode (with
> > >     pgprot2cachemode()? ), or
> > > (b) look up memtype of the PFN, by calling lookup_memtype(), similar to that in
> > >     pat_pfn_immune_to_uc_mtrr().
> > > 
> > > But pgprot2cachemode() and lookup_memtype() are not exported by x86 code now.
> > > 
> > > For KVM_MEM_WC, it requires user to ensure the memory is actually mapped
> > > to WC, right?
> > > 
> > > Then, vmx_get_mt_mask() just ignores guest PAT and programs host PAT as EPT type
> > > for the special memslot only, as below.
> > > Is this understanding correct?
> > > 
> > > static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
> > > {
> > >         if (is_mmio)                                                                           
> > >                 return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;                          
> > >                                                                                                
> > >         if (gfn_in_dma_slot(vcpu->kvm, gfn)) {                                                 
> > >                 u8 type = MTRR_TYPE_WRCOMB;                                      
> > >                 //u8 type = pat_pfn_memtype(pfn);                                
> > >                 return (type << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;       
> > >         }                                                                                      
> > >                                                                                                
> > >         if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))                            
> > >                 return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;         
> > >                                                                                                
> > >         if (kvm_read_cr0_bits(vcpu, X86_CR0_CD)) {                                             
> > >                 if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))               
> > >                         return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;                      
> > >                 else                                                                           
> > >                         return (MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT) | 
> > >                                 VMX_EPT_IPAT_BIT;                                
> > >         }                                                                        
> > >                                                                                  
> > >         return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
> > > }
> > > 
> > > BTW, since the special memslot must be exposed to guest as virtio GPU BAR in
> > > order to prevent other guest drivers from access, I wonder if it's better to
> > > include some keyword like VIRTIO_GPU_BAR in memslot flag name.
> > Another choice is to add a memslot flag KVM_MEM_HONOR_GUEST_PAT, then user
> > (e.g. QEMU) does special treatment to this kind of memslots (e.g. skipping
> > reading/writing to them in general paths).
> > 
> > @@ -7589,26 +7589,29 @@ static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
> >         if (is_mmio)
> >                 return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;
> > 
> > +       if (in_slot_honor_guest_pat(vcpu->kvm, gfn))
> > +               return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
> 
> This is more along the lines of what I was thinking, though the name should be
> something like KVM_MEM_NON_COHERENT_DMA, i.e. not x86 specific and not contradictory
> for AMD (which already honors guest PAT).
> 
> I also vote to deliberately ignore MTRRs, i.e. start us on the path of ripping
> those out.  This is a new feature, so we have the luxury of defining KVM's ABI
> for that feature, i.e. can state that on x86 it honors guest PAT, but not MTRRs.
> 
> Like so?
Yes, this looks good to me. Will refine the patch in the recommended way.
Only one remaining question from me is if we could allow user to set the flag
to every slot.
If user is allowed to set the flag to system ram slot, it may cause problem,
since guest drivers (other than the paravirt one) may have chance to get
allocated memory in this ram slot and make its PAT setting take effect, which
is not desired.

Do we need to find a way to limit the eligible slots?
e.g. check VMAs of the slot to ensure its vm_flags include VM_IO and VM_PFNMAP.

Or, just trust user?


> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index d21f55f323ea..ed527acb2bd3 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7575,7 +7575,8 @@ static int vmx_vm_init(struct kvm *kvm)
>         return 0;
>  }
>  
> -static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
> +static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio,
> +                         struct kvm_memory_slot *slot)
>  {
>         /* We wanted to honor guest CD/MTRR/PAT, but doing so could result in
>          * memory aliases with conflicting memory types and sometimes MCEs.
> @@ -7598,6 +7599,9 @@ static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
>         if (is_mmio)
>                 return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;
>  
> +       if (kvm_memslot_has_non_coherent_dma(slot))
> +               return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;
> +
>         if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))
>                 return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;
> 
> I like the idea of pulling the memtype from the host, but if we can make that
> work then I don't see the need for a special memslot flag, i.e. just do it for
> *all* SPTEs on VMX.  I don't think we need a VMA for that, e.g. we should be able
> to get the memtype from the host PTEs, just like we do the page size.
Right.
Besides, after reading host PTEs, we still need to decode the bits to memtype in
platform specific way and convert the type to EPT type.

> 
> KVM_MEM_WC is a hard "no" for me.  It's far too x86 centric, and as you alluded
> to, it requires coordination from the guest, i.e. is effectively limited to
> paravirt scenarios.
Got it!
> 
> > +
> >         if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))
> >                 return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;
> > 
> >         if (kvm_read_cr0_bits(vcpu, X86_CR0_CD)) {
> >                 if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
> >                         return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;
> >                 else
> >                         return (MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT) |
> >                                 VMX_EPT_IPAT_BIT;
> >         }
> > 
> >         return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
> >  }
