Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1A73CC55
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 20:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3FB10E059;
	Sat, 24 Jun 2023 18:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4C10E059;
 Sat, 24 Jun 2023 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687630364; x=1719166364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4seqizfYTwrvcToGxqutCQOUmjEHwtjic2dhzY4cvFo=;
 b=jdM5K4UpeINvwryW8cwMOgQf4QXJJLiqoO7jUkV6ygRqcFK7BSdnKqPq
 iOYq+YMwjgPMSAAJr05AJoI2tBtFKQdWMxM1fx0c7ae8Vqnv2dacBDxd+
 fE3myrjDqQyChhppPEA38AWnn3aofulu7IJVfV8dJwL3HU9ooQUY3F9/I
 yxLNK8YrZodJ1m2jkPDZ2Xxw61lJAtkoWikNDoV+hJhNfeKkSKOAl/xvU
 f01X3RF6fJQmCfpfexvXx0exTJNhs2p8tpR/HLXD/TCTQdHp2Y9ss0gnY
 9T5xac+8keWxl3WSSdwPp+nxJ+DSr3zS1L//WUNpb0fwrGUJyjGsKJj6F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="361006447"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="361006447"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 11:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="780932443"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="780932443"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jun 2023 11:12:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 24 Jun 2023 11:12:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 24 Jun 2023 11:12:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 24 Jun 2023 11:12:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 24 Jun 2023 11:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZSAMos68Mu5Sjo7PcIVKa+MUQI5tHHbqxKieixuFwnDhnKF31oODmvfoGyxYPeg0Hh3EXMAzVmHdEKmBRTcn9vZC9rmjvzpS4utRnfjKhcklb6Te3ZxLrW31NJhc8dOR4gea2oA/lDy3D6fBMcqg8sgZNNLHLdm3IYtuJVtGg1pc6tuuvMD2pc3n18+x+WnZO0AbNgm1Nhl+0znbrEI4MiB4OCix+9S80MXUuzNBJN0Puk+Yt91Y13sDV35Fb0GmohYoA4jTDFucxtXGGrG+mObhr6kMrhMtRAd8/kYlMVXkXwOzwAv2b6OhJTEh6FfcVG5Ho8Qe+0hP2thn7BLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHOi9/sHS4TJsZc195cMPR6iYGdtJNekFDYCp0J/imk=;
 b=hXZs5z7EDKNFRnd3TIRS11fweGujQZBtivLBu7FhtbQU4LY8QYOQ0Lfzz1EyDyW+RGiGIrMr4G7l7fpYs32mMeVY44G7q3JeVhybG+g8EOZjnmqy8z/1o8mpJhNIkWL0n9HAqp5RdqOPrtqo0hFCzc8X3vyS4WFIE7A/8Utvbz5kqT887YZTDRURa3x9GiAq0dZssNBuOTPJaTq07T8Y2bI/Nhmn04/eyHLUvQt9O7jjZGlmpHd8w59KCtMbT8DA608crZy9sWSqJNuE4/WMzbDds6FMo/MROujWy1ytZiP0omm5ja9F2MHWpIlgVEqIqeG+zBK2zLMMF91Q8+oUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Sat, 24 Jun
 2023 18:12:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Sat, 24 Jun 2023
 18:12:40 +0000
Date: Sat, 24 Jun 2023 11:12:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Fix context workarounds
 with non-masked regs
Message-ID: <6uzutmfcihbvqpglrvdty7v6nxswn7k4yibugd3hwkrpnocuac@pbhsizmyahpy>
X-Patchwork-Hint: comment
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
 <3337022.2OMYdDKdcH@mizzik>
 <ehp36knxqfilobajjyk54oamk3n43s3cja5webx3q4jzm6xrlm@idrattdnr3fa>
 <2063427.kFxYfkjxrY@mizzik>
 <aet7uj3ldnjk5rdgc2fwsn42uqgx5kbxau3efvdgmnhq473s2m@d6uyzwskmfaf>
 <20230623215646.GJ5433@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230623215646.GJ5433@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0368.namprd04.prod.outlook.com
 (2603:10b6:303:81::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9172a2a0-234e-4fb5-e2d2-08db74de9889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0A/pkfE8hUAwY1z3WL6bdSia9HaDwJEnioLcZ0E+2SFO9W1KkdtriUuILBxAAn5AKZaE4FOO7AaevMC6ZxTQgdCKuo3sp8SlIHthLJWczR7OKsQ2ZPnNGmtr+esVniWi5C4B32TLa53TpDCmwWnqcF5S9u4bHwiJT4ueW8nMdoPcBY4uPKeelZiLsFsCnFfIQeTWsT/ww13zuWwig1kKCG9PMF41SnueoP0ntMzBygwIOT+AVyvMxwC8YlotjP3owEgBRHZOUV4Ua5x7ZxCD8K95tpOH3gvBr1YX1SbbnuPilX/MSxzEaTFrquqQh3Vu5dq8/G7NV8TdRkRqGXUigenYaxId0jl3fDFE0WBEORFKmKu8CORekyACPEFnEVTUwydBQOXUa/xEC71BM0yQsGzVgLUu6iYlfcohctAEjjq6vTwvSH9wMcj1vQKCHZSQ6LTzkrDGGhsponukDLjny2RV4hO/RHsOp4etUGe8q3up0fk2BoUrZ7w+0jlwyt3mq5lzrUKZ1YPlcRaalXX4PpEtlbRAcx57zR5r8KpuMDpx+s+KYDBS+1Iyy6c+QQYwSJCZ7hbVcsl42dO51O/Bh1K9uqMS4sDNWPsLDmGV7hdVQA8y02S1nNxthuOR/jK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(86362001)(33716001)(82960400001)(38100700002)(8676002)(83380400001)(6862004)(6512007)(26005)(186003)(9686003)(2906002)(53546011)(6506007)(478600001)(6666004)(4326008)(6486002)(6636002)(66946007)(66476007)(66556008)(5660300002)(41300700001)(8936002)(316002)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NF1wFH8QTmEic8Q0W5ILHGmSTyHAjr95QbSvPuOozFPmbGgfA7Vvv+UXBlKb?=
 =?us-ascii?Q?a71LobG9Ac8dQ3QWwXt2ZIvL9rWgiVzcaomAKH3a4C/p2pIg/zigUbv5GOur?=
 =?us-ascii?Q?Prt5IaAyo9d2PobpVpKlJmhJGdbDDjuMxGA1rGUsk108YobHTD8OtJWI5x+H?=
 =?us-ascii?Q?asoRYB0R3z3mNwOau0oA5jQC9La9z4FH4HzIPZ0zswm1Nho/2h30sr8Ykz5F?=
 =?us-ascii?Q?LQvylgyVKsYgu9SQJv9klquNxtTOP6ESNZh7IAd3LhvR8VpKk0Ra7Pe9ZOQT?=
 =?us-ascii?Q?sI5ZTtfBjptZaJzaYp/jkZmT63/k6f7wl+QRMxIrmayG/hregq0VJuUSjs0Q?=
 =?us-ascii?Q?2QvxBJkkQPy7albf0yAatuwTr80YwcBkGg3p8f2C21tb2whC/5i5fXfczASo?=
 =?us-ascii?Q?BBNa5Gm9UnUGqAekzQFm1IoJIUF5Y+dbsm8VQfQakdF+qnX4INZhpp7AREkd?=
 =?us-ascii?Q?minizUOChIsZTfPQUa42xkba4zOhnsaqboML8z2HH4RVJkXpxu5zHktNru/n?=
 =?us-ascii?Q?MGg/AgWb4lo9RDfFpchN+NM8cNV2Ux5p/ceAoPHtpIVc8+YhpKzWTuyTtZap?=
 =?us-ascii?Q?41VN+VmdKLSex/tbKEnW0n1fOdypEF/nqsyKFEo7wxyxerYPB4lnb2LmID/5?=
 =?us-ascii?Q?TLfMvSEp/jDsblVEE+Au7eCqposWhNmlj9ixqRMn/R4HfC39T1bS8x6Xis++?=
 =?us-ascii?Q?xFt2IRcCn19xS0mo/BwKzW4YMKDg80L+z/mmj2x1jfTZqZnsIfwBiCzh/THU?=
 =?us-ascii?Q?9yOrPur4zvyJ5edUZ/bhkcObkPtIwWuqIyGhJVFAJ+NX5mZ/aKmnr1zy5XHs?=
 =?us-ascii?Q?Lmo8Czo636IXRkpoIey9IP70xMDVxlhWJcpud5byk8NgAPK7oKG1ay0qflG2?=
 =?us-ascii?Q?A+27XbjfxuPYgG1sPu0kxI70y5zFG+vIe893oKeFvRzMvU3mbzA/WBgkaZmf?=
 =?us-ascii?Q?TJP9epcoszm4JSz3NuDu3dMXfApKnFxTAXlxCafaARXwRjwbAEHL7oU76XO4?=
 =?us-ascii?Q?qzYIn2A1n3TrTpFLQE7prJNTYMxEbFjNZSHTEL3AzhtJk7Wn8HFjO2weKbRh?=
 =?us-ascii?Q?LnOL7hYw8dNxuEswxLkzrd6FJ0PAkpMRKu5EZgqi3IjVEk01t8fUJu7aad2N?=
 =?us-ascii?Q?3pwNCECDBX6+0y26PMc7O/21Yqa0xOTWm9y9YqBpAmJeJEy6LeFTWdxb/zSf?=
 =?us-ascii?Q?XUxmGCxdwaDqd6cD6E+RwtjR25e5ObkKeup1n2MN8z5ReWQ0aCLMDaOL3LkY?=
 =?us-ascii?Q?Dsb23oA0LQhxM6qe0eFZGu1jnqFw2QfCNw4ydCap6ZG+f3SAcSHdJvtYu2i6?=
 =?us-ascii?Q?o3X8en+A81a7ryoNvxPgKLfWsPmnpu5BC6sIz0ZxUFD936THMe/TZFXwGfPR?=
 =?us-ascii?Q?WolRwbZupXWrUyHUdSN7F6+cOp3iXAuELD7Fn1KpIX8rvVH+6kiKBct/Bpdu?=
 =?us-ascii?Q?rPX8O04u+EZzOHdeFXA9hKXqD1F0K2s9aS6MRn8iiCa85h+pK0LGvd+xb+hj?=
 =?us-ascii?Q?afEMD1sToP9qM7gFnXS806iCLN/JCSGrUwesri7Fybw55W1gUoKteDJpo4+W?=
 =?us-ascii?Q?2VkLtEZRco8d6PBYPBK22lvsrC4l6emS5kRbzpiddasWcVnxZ6CoXtLaGDRl?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9172a2a0-234e-4fb5-e2d2-08db74de9889
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2023 18:12:39.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4CKyuBZjytcb8JTMwxb/tWC9yafIoixS0kwYSG69MiWY066t1Kzmwlnc8q2w1HJiF3M12ZdWz1g4TDp9Df9OFFD5gokYLdk3REeqPPYN5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
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
Cc: dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 02:56:46PM -0700, Matt Roper wrote:
>On Fri, Jun 23, 2023 at 02:05:20PM -0700, Lucas De Marchi wrote:
>> On Fri, Jun 23, 2023 at 12:48:13PM -0700, Kenneth Graunke wrote:
>> > On Friday, June 23, 2023 8:49:05 AM PDT Lucas De Marchi wrote:
>> > > On Thu, Jun 22, 2023 at 04:37:21PM -0700, Kenneth Graunke wrote:
>> > > >On Thursday, June 22, 2023 11:27:30 AM PDT Lucas De Marchi wrote:
>> > > >> Most of the context workarounds tweak masked registers, but not all. For
>> > > >> masked registers, when writing the value it's sufficient to just write
>> > > >> the wa->set_bits since that will take care of both the clr and set bits
>> > > >> as well as not overwriting other bits.
>> > > >>
>> > > >> However there are some workarounds, the registers are non-masked. Up
>> > > >> until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
>> > > >> set_bits to program the register via the GPU in the WA bb. This has the
>> > > >> side effect of overwriting the content of the register outside of bits
>> > > >> that should be set and also doesn't handle the bits that should be
>> > > >> cleared.
>> > > >>
>> > > >> Kenneth reported that on DG2, mesa was seeing a weird behavior due to
>> > > >> the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
>> > > >> the GPU idle, that register could be read via intel_reg as 0x00e001ff,
>> > > >> but during a 3D workload it would change to 0x0000007f. So the
>> > > >> programming of that tuning was affecting more than the bits in
>> > > >> L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
>> > > >> context workarounds due to the use of MI_LOAD_REGISTER_IMM.
>> > > >>
>> > > >> So, for registers that are not masked, read its value via mmio, modify
>> > > >> and then set it in the buffer to be written by the GPU. This should take
>> > > >> care in a simple way of programming just the bits required by the
>> > > >> tuning/workaround. If in future there are registers that involved that
>> > > >> can't be read by the CPU, a more complex approach may be required like
>> > > >> a) issuing additional instructions to read and modify; or b) scan the
>> > > >> golden context and patch it in place before saving it; or something
>> > > >> else. But for now this should suffice.
>> > > >>
>> > > >> Scanning the context workarounds for all platforms, these are the
>> > > >> impacted ones with the respective registers
>> > > >>
>> > > >> 	mtl: DRAW_WATERMARK
>> > > >> 	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
>> > > >> 	gen12: GEN12_FF_MODE2
>> > > >
>> > > >Speaking of GEN12_FF_MODE2...there's a big scary comment above that
>> > > >workaround write which says that register "will return the wrong value
>> > > >when read."  I think with this patch, we'll start doing a RMW cycle for
>> > > >the register, which could mix in some of this "wrong value".  The
>> > > >comment mentions that the intention is to write the whole register,
>> > > >as the default value is 0 for all fields.
>> > >
>> > > Good point. That also means we don't need to backport this patch to
>> > > stable kernel to any gen12, since overwritting the other bits is
>> > > actually the intended behavior.
>> > >
>> > > >
>> > > >Maybe what we want to do is change gen12_ctx_gt_tuning_init to do
>> > > >
>> > > >    wa_write(wal, GEN12_FF_MODE2, FF_MODE2_TDS_TIMER_128);
>> > > >
>> > > >so it has a clear mask of ~0 instead of FF_MODE2_TDS_TIMER_MASK, and
>> > >
>> > > In order to ignore read back when verifying, we would still need to use
>> > > wa_add(), but changing the mask. We don't have a wa_write() that ends up
>> > > with { .clr = ~0, .read_mask = 0 }.
>> > >
>> > > 	wa_add(wal,
>> > > 	       GEN12_FF_MODE2,
>> > > 	       ~0, FF_MODE2_TDS_TIMER_128,
>> > > 	       0, false);
>> >
>> > Good point!  Though, I just noticed another bug here:
>> >
>> > gen12_ctx_workarounds_init sets FF_MODE2_GS_TIMER_224 to avoid hangs
>> > in the HS/DS unit, after gen12_ctx_gt_tuning_init set TDS_TIMER_128
>> > for performance.  One of those is going to clobber the other; we're
>> > likely losing the TDS tuning today.  Combining those workarounds into
>>
>> we are not losing it today. As long as the wa list is the same, we do detect collisions when
>> adding workarounds and they are coallesced before applying. However,
>> indeed if we change this to make clear be ~0, then they will collide and
>> we will see a warning.
>>
>> Applying them together in a single operation would indeed solve it
>> with a side-effect of moving this back to the workarounds. Either that
>> or
>>
>> a) we handle the read_back == 0 && clear == U32_MAX specially when
>>    adding WAs. If that is true, then the check for collisions can
>>    be adjusted to allow that.
>>
>> b) we give up on this approach and proceed with one of
>>
>> 	1) scan the ctx wa list. If it has any non-masked register,
>> 	   we submit a job to read it from the GPU side. MCR will
>> 	   make this harder as the steering from the GPU side is
>> 	   different than the CPU
>>
>> 	2) emit additional commands to read and modify the register from
>> 	   the GPU side
>>
>> 	3) find the register in the golden context and patch it in place
>>
>>
>>
>>
>> > one place seems like an easy way to fix that.
>>
>> I'm leaning towards this option in the hope we don't have have
>> another GEN12_FF_MODE2 in future.
>>
>> Matt, we've been pushing towards separating the tuning from the WAs, but
>> here we'd go the other way. Anything against doing this for now?
>
>That's probably fine as long as we leave a comment behind in the tuning
>section explaining why that specific setting is found in a different
>spot.

alright, just submitted a new version with a few more changes.

thanks
Lucas De Marchi
