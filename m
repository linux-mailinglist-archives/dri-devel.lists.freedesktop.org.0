Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA4817A11
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2846610E3D4;
	Mon, 18 Dec 2023 18:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1083810E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702925358; x=1734461358;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=us8I9uTuTyPUvDInGNNhZhC13h8+99hPxxGRcdLpPL0=;
 b=B5Vp2T2eBXVDTSHRSv2OVUDZOvJJVMTDl5NiJZjzUCMwETczy/R5eGdO
 4uGnZKMkoBK5RpaJMNzLdtxG3zuSjAxVfLtlFYBB06T16navjGohGhnH6
 0vHXmLhhMvAdDy3XpPG3JF9EDPnYzMBQPOoBNlhRDIjP8j3K0QAM6d+Kg
 khIPg8i9aD96ktusv3dnq4Wx1H+Irt21FtpPfTulw8zLKaJWUs7FyuPfv
 8o4qb0iitZPmqKq4rZMyvcvoK2Bc7zI97jyYUZhZFzwDBLHxDqgBkOJpL
 qcrQU6PE/EGiiCQkdR7gPG6e2NqFVOESRw9JkAcyOXND8dQz3heeDgohh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="398235786"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="398235786"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 19:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="768688986"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="768688986"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2023 19:27:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 19:27:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 19:27:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 19:27:54 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 19:27:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvfqN9Wb/5bFTEJEaKX1KjC3pNkbD8W6XourR8BmVKGTp+ZLiZtKUepoVYQVJL97iXUuzSbEi90zFQS0Q6TYtACSftgct06aBcRKJrsEjlL+gAGtRuPEBMeyL+jkdKvao3cDmIaiIlc33ASc2S3nGPxxKiuSD1Fv+QQuMi+wID/pqkFRD2SJbOPvqy+wIYyZdpuzix+OzNleS/jK9c4VejXT+iAU/u+2coMjQrn9/7O8x/pt5edhVScfA7O8/YnVCeeSOyqaZ5kdPRPEvJmFZcg2Ube7M/Q3jhtBVrf+v7kboSkcipBS7j6YB0ukKme+pQAiuhzZ3gAU/kkjzdm5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg/ixd9lbT163sR2nSaisVKDVt+MIs7DaalHhE5Z1mE=;
 b=Vc+5wx0HDnz1Isb5CN6UWp7bVOriSZJz62OwKPl1mmc4MlXxMkHL23bl+ypvMbFp+yymsU45DvpPDFJCdwzD5PzqbM4mJFd7eLaIy3Hj9+UnDqVF6XiCvDyK+T7a+vDgawe7SdL1WFmQ9WjHL3jQb3kK3IMKKqRfWUzDbBWzR0DhH9sUClZKKRhorjk1/P2bPWCna3DNGdoUnpzdMP/MUkvLu4OT7ayEGDnW1axcgrfHpEQJy3Ubc3Imn6ANCOfRG5220Kfcn/0cNnAAddPBMqwWKaNl6Eu1QHwzA+94NsvmYZ9dS1Rc1mjpSULvQ2nN0smT2tgE1IkojC+8pqVgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.37; Mon, 18 Dec 2023 03:27:52 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 03:27:51 +0000
Date: Mon, 18 Dec 2023 10:58:40 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Message-ID: <ZX+1YNlgqYA/N06T@yzhao56-desk.sh.intel.com>
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: SG2PR02CA0111.apcprd02.prod.outlook.com
 (2603:1096:4:92::27) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: a763b18a-32de-4556-b7c7-08dbff794fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xp9WthWsjIhxgMdlpp3aLaRsKlsY8pfFLORA8RFSqnV9QJ0XXAJnoPceDw9dq3NJdOOZlM5gW6BhJqNo4ADfBMOdp9cIjOfz6QF39b06buobgnhzKjCtYkfO6u+W4Oux98xb/knCa1T9E54aEUAS73qNTbJAJuMyT5xWr13DGkIV4RXUXj2bvKHoiiiOMQoofr2z1tVOvxsN4kRuBw+ndlqy8VC1AfnpnPKRz/5+DrN28PV1fhFO965axwjGpfb5tFVd/oRAMRPhuLDZOUAaaUIQ+1gDOcoe55Sda3d8LtAlT4SCN0bO5mOMq0bgwa8wTJYPAYLDaPXRqalmxWrzJVmSpJuAwMJRbvcQqovMXXyyeOvBJJ6MKD7Z2/MFCCJyOjJgC1i3/LWGml5Ew4Eg+iqgAh+dAvQINNhXCPmt7Phjg32zfns+ZKCTmruASfHq8T2HvC9iHygCUw5Cfpmu3+qT6z/UwQ2mgmgd7gaLmwqkebVkVL6UvQDNPF2lt9g2wOfO30Ntd5Qnsd/ZpLDAGw6YcgE9WEdX/Q60f6kIpvFFeVx1zAD1eoI6FIN3/vAk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(6666004)(6512007)(6506007)(82960400001)(38100700002)(86362001)(8936002)(8676002)(4326008)(6862004)(3450700001)(478600001)(7416002)(2906002)(5660300002)(83380400001)(41300700001)(6486002)(316002)(66946007)(66556008)(66476007)(54906003)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUTaRuxVIvpcqgggRRvNXq5Mh5cu0yvjGtbHBsSO8iZmpNs1I7HDFaktU3dB?=
 =?us-ascii?Q?KN828I+pQi8HQLoKyyplrE4v8bce74DC7Cjyf7fuoN0fhsZXwoGNiLFDe3O4?=
 =?us-ascii?Q?MSFOTGl7RtuZnRchAX1ipSijPfuRJB6l3qBfULEQMJwzextu9seMX/V2q8XN?=
 =?us-ascii?Q?zpfXBCdCMMciPff9Jbs4TflyetjvSaqLsV5CGh0tVJ8f+Se8RDHdy2F2zjVT?=
 =?us-ascii?Q?zOU7VX5RFLjZX+dg4jydRiK6HdZAYIrjreJOg61xLxjBnofzkAj5qMwXqhsY?=
 =?us-ascii?Q?7q/28eeNlewVbKIFzoOCw2AeE6qLXnLwYhunHQFckGqiQeLpIr461/XaSEJH?=
 =?us-ascii?Q?1TnsOUIHcnuyZCLDuTbiOgcToMYfiLGGg4aXMDEdGrdByhfvl4SR1n7lbTUY?=
 =?us-ascii?Q?VK4aa3CIxQ18YjaTaDO7mzgi7fpwJ0QCxiT824wnOIjrilPQo1smltV3l/9u?=
 =?us-ascii?Q?ueu+8FKsDDzaEDlFR4VFw5Js8D/+2knbWdmVdX+Gq7sT+GyryJS0XoRDRW+O?=
 =?us-ascii?Q?4rLvKspviaLyFCx+knEYaqTNJgxAmhJr12cXkLOurqW599XLXyICed0QDzAl?=
 =?us-ascii?Q?kNxPxXB4JcyXhnYc2FO6F15uoHYrn0qldKOubem5ny5e6R8+3LOpgf8FmhI5?=
 =?us-ascii?Q?MmeNOb53LEtG8+d+xrrMIOY0p51dPRvfFbIS3nkpQ7cgXiXwbEfH8016YcHY?=
 =?us-ascii?Q?EwcxZWmuoe+UlyJConVbTFWc1FdrqTdFR/S7kMdw9so0cwbvqr1t2F+Oi71L?=
 =?us-ascii?Q?hzuRivhwokSRUs1Qf0Bfgv3DUTmuALrCvMAi3+bgIZjg6WqPIvKn5bcMGg4W?=
 =?us-ascii?Q?uU0gXvssp7qBLK/EqP+VBmHRz6QQVmGhNuNKDKb+KCFbyhQ+pdIvc9UAyvS3?=
 =?us-ascii?Q?/+ztniqkf+ksSebg5WzW4iyD2xBCaXqRjdRYhjXVLBRvBWcYjyskeZGC3wGQ?=
 =?us-ascii?Q?WBSBI/JWSZCBfqSMDTMaoBg2/1fVl53AFH9mY/Dhb8kuxhQFZSVdEBFH/VYn?=
 =?us-ascii?Q?XOegqzD1kK4CZllK3ViZQ8aDAIfdZ354udZJxmCLwVAMKfhWFJkoF7XwooxE?=
 =?us-ascii?Q?VqiQXxGFd5Bb4/PW9LSPIFw5K/52IwaeHc+mD1dBmoyr68g7ePKqltF88oBm?=
 =?us-ascii?Q?iIvkvilV46A0C22V5kZpKWO1w8Z7nUzUuYh/EBSfOyWb6b3iDyfI6a5OlFYc?=
 =?us-ascii?Q?lE3WAhy8Cvhi/lhDw4YCZ3GCAXCDanzoyTxvD5E6OcS2sNbeXwYvEg8LA1gY?=
 =?us-ascii?Q?v24W3tMFkTdErwtKl1c/r4NYRfOV2Zljfh4ge/byuYkHPwr4IUGEspl1Lcou?=
 =?us-ascii?Q?YwVKbMkLpKhFT4vnbtyqR2z0i5qZubL5A00C/VlbRl7Pl2FlxJn2vcXW45gi?=
 =?us-ascii?Q?29uz6r9bzXWV091F8joX1zlNG7xUPkuuCDamAClVoFxxxT6gzFf/TMWb9bHd?=
 =?us-ascii?Q?wic8PEJcqKxN5s+4HQ0B267iWQFCVGXBE/AQ5RGHVudyNsjibtNQ373OzhcX?=
 =?us-ascii?Q?P53lg9H/cPC8vclVEuskTQx9A6WnbOviRS1hvK1sek+QHqNt0Agp24W8h7zl?=
 =?us-ascii?Q?4E3GH21I4Mfh696+dV8fNwWiK4kN5QFHDE0ehCeg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a763b18a-32de-4556-b7c7-08dbff794fe9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 03:27:50.6286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7n9JAOGBepNPpsOLz7zMfVKsEy8YwnqMh2INhC9E8u/VahIHms11E54MkebJetoc7Q6SzSXrBFB/Pp5K+bl6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "seanjc@google.com" <seanjc@google.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>, "Ma, 
 Yongwei" <yongwei.ma@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 02:23:48PM +0800, Tian, Kevin wrote:
> > From: Zhao, Yan Y <yan.y.zhao@intel.com>
> > Sent: Thursday, December 14, 2023 6:35 PM
> > 
> > - For host non-MMIO pages,
> >   * virtio guest frontend and host backend driver should be synced to use
> >     the same memory type to map a buffer. Otherwise, there will be
> >     potential problem for incorrect memory data. But this will only impact
> >     the buggy guest alone.
> >   * for live migration,
> >     as QEMU will read all guest memory during live migration, page aliasing
> >     could happen.
> >     Current thinking is to disable live migration if a virtio device has
> >     indicated its noncoherent state.
> >     As a follow-up, we can discuss other solutions. e.g.
> >     (a) switching back to coherent path before starting live migration.
> 
> both guest/host switching to coherent or host-only?
> 
> host-only certainly is problematic if guest is still using non-coherent.
Both.

> on the other hand I'm not sure whether the host/guest gfx stack is
> capable of switching between coherent and non-coherent path in-fly
> when the buffer is right being rendered.
> 
Yes. I'm also not sure about it. But it's an option though.

> >     (b) read/write of guest memory with clflush during live migration.
> 
> write is irrelevant as it's only done in the resume path where the
> guest is not running.
Given host write is with PAT WB and hardware is in no-snoop mode, is it
better to perform cache flush after host write?
(can do more investigation to check if it's necessary).

BTW, there's also post-copy live migration, in which case the guest is
running :)

> 
> > 
> > Implementation Consideration
> > ===
> > There is a previous series [1] from google to serve the same purpose to
> > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > requires a new memslot flag, and special memslots in user space.
> > 
> > We don't choose to use memslot flag to request honoring guest memory
> > type.
> 
> memslot flag has the potential to restrict the impact e.g. when using
> clflush-before-read in migration? Of course the implication is to
> honor guest type only for the selected slot in KVM instead of applying
> to the entire guest memory as in previous series (which selects this
> way because vmx_get_mt_mask() is in perf-critical path hence not
> good to check memslot flag?)
>
I think checking memslot flag in itself is all right.
But memslot flag does not contain the memory type that host is using for
the memslot.
On the other hand, virtio GPU is not the only source of non-coherent DMAs.
Memslot flag way is not applicable to pass-through GPUs, due to lacking of
coordination between guest and host.


> > Instead we hope to make the honoring request to be explicit (not tied to a
> > memslot flag). This is because once guest memory type is honored, not only
> > memory used by guest virtio device, but all guest memory is facing page
> > aliasing issue potentially. KVM needs a generic solution to take care of
> > page aliasing issue rather than counting on memory type of a special
> > memslot being aligned in host and guest.
> > (we can discuss what a generic solution to handle page aliasing issue will
> > look like in later follow-up series).
> > 
> > On the other hand, we choose to introduce a KVM virtio device rather than
> > just provide an ioctl to wrap kvm_arch_[un]register_noncoherent_dma()
> > directly, which is based on considerations that
> 
> I wonder it's over-engineered for the purpose.
> 
> why not just introducing a KVM_CAP and allowing the VMM to enable?
As we hope to increase non-coherent DMA count on hot-plug of a non-coherent
device and decrease non-coherent DMA count on hot-unplug of the non-coherent
device, a KVM_CAP looks requiring user to maintain a ref count before turning
on/off, which is less desired. Agree?

> KVM doesn't need to know the exact source of requiring it...
Maybe we can use the source info in a way like this:
1. indicate the source is not a passthrough device
2. record relationship between GPA and memory type.

Then, if KVM knows non-coherent DMAs do not contain any passthrough 
devices, it can force a GPA's memory type (by ignoring guest PAT) to the
one specified by host (in 2), so as to avoid cache flush operations before
live migration.

If there are passthrough devices involved later, we can zap the EPT and
rebuild memory type to honor guest PAT, resorting to cache flush before
live migration to maintain coherency.



