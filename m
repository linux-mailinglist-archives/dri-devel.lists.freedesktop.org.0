Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29C8180B9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 05:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1F110E2DD;
	Tue, 19 Dec 2023 04:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFE210E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 04:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702961802; x=1734497802;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=Dujb6TVAR2D8zGQ8cpFndJkAFTyjqXaHFVWNE/GFAm8=;
 b=bq3q2LNq2r4kRyzix6UFm0p+wQ4QjefrEpb3eycSuzdUV2HmW8CtqjMu
 wz0XseM6YSHgKmHaJFUVP4VRPttL0abLBIYRlcmX904dcOahfXWuMaudN
 Yq2oUQBzACsCGDzBEN2ksDKFpi5ZIytZpEMT4LcjQT+POFiHfqLD8B9Pa
 HhLNle3tqzZFpj3vTajbI1A36zP6pLqn2cJw557reSz4voEyUg7fQ51FA
 G+luFAskJ9cOcFIB+QzgxMq/dMVrO1yJuGLEFfIGW+F+UJV3rtGIdvfzf
 gdozx3hb212qrV6p7ClhP42WeYwCtbn0bKD/tY4Fju3tclh+NTi2+vdC1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2821777"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="2821777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 20:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="17461907"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 20:56:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 20:56:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 20:56:40 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 20:56:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVlJ1N5MnT7CRQYWNBT072o/zW7H6WqDatglntldOb+vCsuwTINW9qpUjMo6MmnSAOC3xBI2pChul3ID/ZjP66an33BokG228m6BMRFcnxaqnYYKQlmrG4dokyPSaMZoEbgDcwrTr+/JUTQBCRzXi4XnRWaQPg2WbxJjMTz9UUuxAyNP8vqumbGnPItRSy+FH6c+b5K+uHAnrehAzB4T/tHbrIJCy3z0XumqfquCCPHo7UGYEGrmmVhM5pSndd8DvZiVSzCwQR9/kH8nYic1ispr3jj/ju9/rN7xxGncUZ4IuGQ4/ve1M7PGrSj9IBKa2HUcUv7qXdlcFwxdRXMuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kWKH91ebMcH568pEY9p9EriQc+DjcaX9fA6B8t5aaw=;
 b=GQWVxBWvZ/oRVtG2yHfNTo8lHIR1lBceXuQk+SieJPmrlO5xl8Z2lqJ1+vbX8qz7FnlrMeJCkrHvUMxcsyEXP8rYcUyP/vTS4a1oKMx3BQHDypVjeBTPryqeu6iwiFNQZlF874sp658hkrgAv9S4rSm1wVUmpNKoWFXztUlg/AyuNmG2vpXNG8IF2W28GsWde4cFOdLuyev+SlGw/5Sbyul36/b+8qaS2NKNqy+iz7xGQCbsnl43nHKcOCOGZRVeOECG0LTAIFB0CiaQ4yGwN4AK/Bl3TqbDSfWa1+J0oqHzAgZAGydCtzIldjq/gZXRlcOUKLh6jSOPfO98r2nTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 04:55:57 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 04:55:57 +0000
Date: Tue, 19 Dec 2023 12:26:45 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Message-ID: <ZYEbhadnn6+clzX9@yzhao56-desk.sh.intel.com>
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZXzx1zXfZ6GV9TgI@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZXzx1zXfZ6GV9TgI@google.com>
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: b06b8127-9199-4107-628a-08dc004ec9af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vf+rjZS7r9WOJNAgAGWAYtig7rx18RY7j22Waf+iqeA5rSS8ahA4KbXQ0T6VcNzgC4i4m38Y1elmL968sXdnSKEwIU5GvmOsuAaIuLrB4UrqpnOQLCACXtwFX1EG59blcxCuF/ZI8QPOnKbgNgVpSrs1FH/RAeKHEwNR7udUDjMVl/DCrcJFAo9A0kZ26KVboma07Vc44Bheo6kBrTLqcku50bHG4eUPocDW9qSRSghqOZnrfLAHIl5edjmgt7Qm7+wAggRYAhaMspyKUdcD7Jy+eVlLUIK5CAXCcIC95wOPwNJMKOQmcAKejdPWliNmR9it7yEiRK2dgIKr+UYVnhZo6hF8BUIsW0DGLxdpHxsau/xHNFtxm6cE0L9Re4IflvbWLCoBqMMzNeRROQAYpMYbxLYsT6bnuMMtWt7CYJj9720pRVQElR5n4kqamq9NPdkiY1ZyB7iDXOVd+J06PXKaVALTUvMsrTBd1vGnn8NmYyIaN3BFBp5pLBT8U69I8uzuEf5YjbSLL1Tf9QT3xwdj8J9R1u/BjvBjECcqhqu2J/1OXx2/sSwDAxh/gkDTccrusyeFi73YnlNXig9nwDkjaI03hl2GgTsSpujPfBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(6486002)(478600001)(6506007)(26005)(6512007)(41300700001)(83380400001)(6666004)(3450700001)(86362001)(2906002)(6916009)(316002)(66556008)(66476007)(54906003)(66946007)(7416002)(5660300002)(38100700002)(8936002)(4326008)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3ddz74dNOIIQqMsmF6VCBARE/L5/h34f4PqQDrTZPFxQCUcHLS1aHyCNPhU?=
 =?us-ascii?Q?8S695JLQ8nxhB9IJNZa7Lmo3glIgNtOjSN6rLwwp9M3cJJmHzthtZrIY/SF5?=
 =?us-ascii?Q?T0xXvoJaq7hvG8trLV00G5O5kZYIF+FSWlpDY41a7ITC9YDihDJnwPJ5zGi/?=
 =?us-ascii?Q?bW9HK0F+xm+in+c3fQH8fummXkKKE8ZKmTQyF7a/F2gqS6h8FUktm8ZI0t4W?=
 =?us-ascii?Q?wSwj5KTT/HEX7ZyEkZOtrvF/pSlPuMdbL+W5agjV8vyjV8DY5GIcGC363qlR?=
 =?us-ascii?Q?m/I5BNctt870qzKcZ8pdOimj1xYNqcsBXnzH6s1cbjwo5vwG91WymPYdOeQX?=
 =?us-ascii?Q?le32PzooL9d/6XYBQUZ1m9v5ODUfEZKGuQRj9ho4A3TY8/S/W30vSWBDJQ3C?=
 =?us-ascii?Q?lXWJuv75uUUZfJi0wor5aAOGs7MkRi2ztcZEMyCr+ZzOgLVENmQimeP93JKw?=
 =?us-ascii?Q?daxHaw3XyEoIF4NFduSAZL3LY2obZKWikSO8RqhyZK/IU2acWGfgapJp6A9L?=
 =?us-ascii?Q?vF8hOjE1F2GQIEsfzW5faBtEIwHoCbYiSvt6AOuTbUCJ+TkhVboKUw+hye4r?=
 =?us-ascii?Q?IWDghHJHWtwzX2NNyXstTF7DZRRCZpnBLvBVIWw9UV55kYq0L3BFvZDrddyU?=
 =?us-ascii?Q?MD1hEQcWraZ7t/XT1BSVkD9ygd0+/hpzb28iPFIOqDa1SOrBRk9D0AZYR496?=
 =?us-ascii?Q?hYnFhB/C1InW093HG2tk/3mewS8U6Y1feoqq+kTLU+6LoOGrbNo6YIBtiQOg?=
 =?us-ascii?Q?HfS6RAlPgoh3+WYHTsNRt7tKAeNa1pYEb9o6NFT3FpvINnuOAyUIeKGz4pi7?=
 =?us-ascii?Q?ScZfHg87Y0Ldo1+yzy0C6m4eMViK/6JbjbVu/9nYNOyAA/szch1YJcQMjhHa?=
 =?us-ascii?Q?f2UV6sL8Oqijg8sLJhLpX13jtRZ2WrL9q/Svx/NHNyyxCRjWqpC1ek/ZLwlO?=
 =?us-ascii?Q?DdvPd+fNxpkhkEB/6uWehK4i876QexGg4QR/zEciU7+c8v4cJBGaqbjvbQh6?=
 =?us-ascii?Q?4+tzM+7GGq8d7/aoInVMi/CSsSVCLq9sIdQzy83vrAXYTZQUMVS1NtLag0GT?=
 =?us-ascii?Q?w7Qjp6iV6/AEcsSBq3t6ICHmvH7CQrAkry+SOVT1TwZgQspA9F+hW3kIMh0t?=
 =?us-ascii?Q?o3LSYW4BLU3ZgPtmqDGcA+wAJA3QIbweH8lmJ7HpJ+4vYQ/lOAhjvWFgPeEU?=
 =?us-ascii?Q?rp+yZtQfO8jTgnPzWdzUF8yFlEiYfChRMZr7599c10sqW/HgvaziGlnTIzE/?=
 =?us-ascii?Q?yXYjRkn3vL7lDDesP+tNSbR3KpPp1kJXyPm4+SfC7N3hrl6ZcRPyNXTBVham?=
 =?us-ascii?Q?RuqYiHUk6vcZ2vL+h2u14JICeJG52WkL9sE27SGPbuscQ5Iui3SPcCFdgNoO?=
 =?us-ascii?Q?iH9PMv/b+oxg8P7cCMHvgFW2WH37W6EfOlCZn67IdU+3h/FiZKHshh3+INVI?=
 =?us-ascii?Q?BPaIqkL8QxuACiuScrq351q+tvNGnkjl+EXM1wQxkXM70hwTHwdcmVmSbD4m?=
 =?us-ascii?Q?SCUWq53v6hb9VP1oVwpEJNAN/HQTWcLIEMLogGfxD6TWKSRYYy0as+F8GInR?=
 =?us-ascii?Q?rCjUYctN+6PFeBkxcXNV7UTy7tkHwtoj4wrPwmvo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b06b8127-9199-4107-628a-08dc004ec9af
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 04:55:57.2225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzq1o5SSFUKJSkUSRTZKRFv3v9CPjh2ZULZpqoxzcdwoGVYFoapQ8UbvHMkUYyN8wMhHKl5qcXlQZrHd3Kke4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
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

On Mon, Dec 18, 2023 at 07:08:51AM -0800, Sean Christopherson wrote:
> > > Implementation Consideration
> > > ===
> > > There is a previous series [1] from google to serve the same purpose to
> > > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > > requires a new memslot flag, and special memslots in user space.
> > > 
> > > We don't choose to use memslot flag to request honoring guest memory
> > > type.
> > 
> > memslot flag has the potential to restrict the impact e.g. when using
> > clflush-before-read in migration?
> 
> Yep, exactly.  E.g. if KVM needs to ensure coherency when freeing memory back to
> the host kernel, then the memslot flag will allow for a much more targeted
> operation.
> 
> > Of course the implication is to honor guest type only for the selected slot
> > in KVM instead of applying to the entire guest memory as in previous series
> > (which selects this way because vmx_get_mt_mask() is in perf-critical path
> > hence not good to check memslot flag?)
> 
> Checking a memslot flag won't impact performance.  KVM already has the memslot
> when creating SPTEs, e.g. the sole caller of vmx_get_mt_mask(), make_spte(), has
> access to the memslot.
> 
> That isn't coincidental, KVM _must_ have the memslot to construct the SPTE, e.g.
> to retrieve the associated PFN, update write-tracking for shadow pages, etc.
> 
Hi Sean,
Do you prefer to introduce a memslot flag KVM_MEM_DMA or KVM_MEM_WC?
For KVM_MEM_DMA, KVM needs to
(a) search VMA for vma->vm_page_prot and convert it to page cache mode (with
    pgprot2cachemode()? ), or
(b) look up memtype of the PFN, by calling lookup_memtype(), similar to that in
    pat_pfn_immune_to_uc_mtrr().

But pgprot2cachemode() and lookup_memtype() are not exported by x86 code now.

For KVM_MEM_WC, it requires user to ensure the memory is actually mapped
to WC, right?

Then, vmx_get_mt_mask() just ignores guest PAT and programs host PAT as EPT type
for the special memslot only, as below.
Is this understanding correct?

static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
{
        if (is_mmio)                                                                           
                return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;                          
                                                                                               
        if (gfn_in_dma_slot(vcpu->kvm, gfn)) {                                                 
                u8 type = MTRR_TYPE_WRCOMB;                                      
                //u8 type = pat_pfn_memtype(pfn);                                
                return (type << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;       
        }                                                                                      
                                                                                               
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

BTW, since the special memslot must be exposed to guest as virtio GPU BAR in
order to prevent other guest drivers from access, I wonder if it's better to
include some keyword like VIRTIO_GPU_BAR in memslot flag name.
