Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A095E860C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 00:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D76310EB2D;
	Fri, 23 Sep 2022 22:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D726A10EB45;
 Fri, 23 Sep 2022 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663973337; x=1695509337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CyAiQmICsVHV0Sp6UA5hMTud/MCnWrfeOXmjIIafnKg=;
 b=f56B3gs8gU06L0945M207zHxW+mTwIT3pbGyvxPAuEuVK42ZPpS6JVUr
 2tzgd1AUVt0dXGRVcEAfM+U2fSqcLAe4QTwTgrcJUWWu+pYCXxt0xR3K7
 Uq2T0kZsaFe5NzyOl2iHyOWhkhRcVJIYZu6fag4lX/q6gaivIGMNo/P/X
 1gTq3vqUjJMTiW1vrYUsOKIka+XedknD/6bJXfFY3qkLzF5GJXFGqytBE
 dH6nABMkAuPdsStx30RGU+Jk0m37qi6qTBEnwRmCIMJODzhCALM5is8LJ
 IFi4rYGuaLdpuuSm69SFDclACImCiItm1Dxnbl1NxZPjSgueRvDkvhOVC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="283823348"
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; d="scan'208";a="283823348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 15:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; d="scan'208";a="709474857"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2022 15:48:56 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 15:48:56 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 15:48:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 15:48:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 15:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6qvXGumVyA98zNmDTLQy1eWz5LlgJgPjQgupyz4osafbwpHP94a3QkIJ/umTi43g0oNv72ucyt802/zaHo6rL0W060M3OaBBqdgUmBvcM7P6JzOl/XI4zxZVuk/fLQuNUR4mK3p1zGK02vx3bWeeHkmF6xdPLWeo6gtvMutExlS4GYBED7qVK55Z/cQjHsmMfrgbJ2fquwTp6BOciOUqqAS1p4QkIo5q5QBBitHk1FMH7sPJyLFgMwQmxoVCd5KlnANLxoVNSGoiM1bh0iJhj2Bey6A3MOuJtSNSWFq5O09rklYPg6LMp3WozWjMm6rOf6DQL9yEozdv0XOaSOlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MppIL5Luo1eqj8KL61rPE4Q+LXRCQUOETARSjm9ImQ4=;
 b=MP2l1z5WGmnn2IVf6V75hSrh87CoFAG8MoPo4LGyL/qqfhx/MLP6ko+fWzzUw5KWkRgfeSinpAUjQTtzlajexKtgtal/ydezBoJ2H4IynVrNvAlb1agQlvE+LSBI7mb5OqVITzIvsliMD7MdDcfb026uLO1mnD132BvhR3ai7wkDwX72xs6f7wY51S58qsQr3O7aGQHYQTTF9DbYRCdOgBliDH3ul2oYCBX2mzjZwiUQDbaC4+ridRshmDZrJ9YmzT3wZ2jQPc/Fc89KhWODojA3XfmPGsHFQRj9NCxHypkaKL01i99ernvwphUok1Vm4yIB6d7BJmAaOGnjr4wV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 22:48:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 22:48:53 +0000
Date: Fri, 23 Sep 2022 15:48:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/mtl: Define engine context layouts
Message-ID: <20220923224851.lqoazbs6r6fb4bjz@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
 <20220916014648.1310346-4-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220916014648.1310346-4-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: d53a18fc-5f0f-49e7-aac8-08da9db5ca54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjA2GNDR8WAaKId9oeG4nIk+KWUq7GW5sBiWS5Or/EkaI7LZJiPUF8RHEHOwhhrddCBd/MwO9D3pziI+r+h5vEYCGwVZkMQ8owDGk7p6ki29HgCicPPnSsbJzsmQeNvQDktyN4CO7jmZAgfjwbf4W1fl1W/1OeHa/QUvyDef2Y4qPOo6q8D2vgqhVv6nET12gtXmkNgesYsC+r+mhhtE3bxg1RFgTkzSB6/JHZAUFYZQmD+wbZ+Zl0tLrONjUOm35+pOUZdu5bgsHyx68b59x5JOQtuPYAsMq67KEL1HKmSvHXkNAeIuBiCmjim6Ak3H7m5BLIUtDLx8kGywoo8F2FtWTacy78Q71vYAnhA7jy/5y5ghydYjx/NyxQR82OPl3iArrOP+EhN50wKU4Ah/VQxlNoaB8pSV9MwKXFTKRC1M2+vTTZbOexZpy0quJrGYQAy1Cnp1iUnPa7ri4sXbckjB7TNsYrYI5jdZjeui2gQoBnDXyV/cK8RNVGYNElogxiW/3AfiyGkdbslxWhsDWrj9geNnROB2iOz+ngbLvp6vlJ9GcLxgI7b746gAsbiOTjsy2559/KN2MFw8tUdWtrbKoC51ysnHKki2oAl+Wjilgub2EocGF37Z64ZIv9NGcU0G0G1ko9UzV/iCTCo4ImkubCsS+vOYqGtn4L/RdIY7DzOnBB+rTQAB7LpKxGvcwfrvez6/PXVE5/JOGq7QrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(83380400001)(1076003)(186003)(6862004)(5660300002)(66556008)(66476007)(36756003)(66946007)(86362001)(2906002)(41300700001)(6486002)(478600001)(6506007)(6512007)(26005)(9686003)(8936002)(4326008)(316002)(8676002)(6636002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rBUKw/UR+7KXibjKjwdCYTGsus1ZnWk6JPqW1UyHU5rDkbn7DFgYGvM+kt5y?=
 =?us-ascii?Q?CHKon79RdUCd1fJTRuiU0VyzzUBlPwUPEJvxykZjyvgSE4AilSHQxY/F/AZT?=
 =?us-ascii?Q?WXPBLeI44NzroF3zjszL53MfYwWzw/zfwGfQHmWYXH1hGiLrRs/PdaqPWgSt?=
 =?us-ascii?Q?fRnpQA6hKYqQ4gTabSTilVH+7w7oiIMlsX4Ax0V45LjbgzjBQHpwwL14Rmdh?=
 =?us-ascii?Q?3HCxH4s7Jw8ZGra02DyeuCYgEe1YxCRQPs8jphgHNC0bH1X3WfodDtJYSh2z?=
 =?us-ascii?Q?p8oIuSnkfG9h92CTR1IZmU56ga4jDCwTfabfLEs/XePmF0LFnSC2BPuzfgUw?=
 =?us-ascii?Q?DgUTrm8UjfdcnGocqzxqWwFgqJOlh7IZh9mXkXopCv9o+D1BKmCFBuYnNm3z?=
 =?us-ascii?Q?GtwXwA4DhmTJmueFl9/btmJ8UKvnCdKhtNhfMYTs2CxzDy8CI+9GQ3PUChtv?=
 =?us-ascii?Q?zicgPbi/KrzqZwYMhRlPaKBiuzRXs2goAYTIH0hoQnIn+SJwNuCuhhHS6p+1?=
 =?us-ascii?Q?BLTRRI0MYbI8txKXk2RgAntpQI9Mbxat5JvylSdlOzYnL/KTFwukbi18dykl?=
 =?us-ascii?Q?X5nSflNA9tYF60F+XpYwSblPMqxKeC7ZjhrknIYHzvtkxZD8zbzXATLovhdo?=
 =?us-ascii?Q?AeKec/V54IvikxYC5yrXDaulDdj9E+oYZNXoEgrhys5rta193MT8u62IWJjy?=
 =?us-ascii?Q?30h15iczzbF0Y0ddbxgXJ7YyWjAz34F65SjqsZaRn7v6BiEx2ZnHXFHbPX2V?=
 =?us-ascii?Q?7yLR4euCDRkrG1xAhS6MKc0Nh0NqtsBN+Wna2vdqLSmeCpZhqX/YA0Pwk26k?=
 =?us-ascii?Q?GhS5c6szCQ3GIKpTPppR5sPoHSbGaWdCIBvM4B3PthHSbIX2SRUpt5XkdMNz?=
 =?us-ascii?Q?ScUUGdvofJRCwgd1BRuyT8enVlsTgm4ulxbXL/bfRqNjmtOFASVFPUzIy5eV?=
 =?us-ascii?Q?HFIoW/pOM83BoI288Ob9JfKe8b+TXa3c32y3GzWkCbbq5w6PvhdpWMbqdRO8?=
 =?us-ascii?Q?DnMyRZV5V0x6TNsOZGCc9/04ByEgJ1m1Yo0czQnr9JwJ1R/CltgJHtd+4NHm?=
 =?us-ascii?Q?7TTc4rWcWJkWB6OC3qBJU6ofYG69E+IvHUvXuB6hlyi7WuQSB9U2IdNwwIUX?=
 =?us-ascii?Q?bvtUGkPsjT934J556EWXud5tCKCTIr7fedIXhqSDWMPBawxla0vZhr5EoAa3?=
 =?us-ascii?Q?uUIeZ7IhhlmNGPW/UDIvdYKsD0scrLmF1pH5f5DC+d6itSvv7IfnRQ5r7NMU?=
 =?us-ascii?Q?IwWwd4CENGQ4KyjAWK3gJkitBkRzrYsue0dGPlJr6z/xCm7cYVK0IehAfSOq?=
 =?us-ascii?Q?RfvAKNpeJCoNDGtR/UCrd7a3/uj1sb4sD8kxthwaKUVvu7Z9yVKt2AJDBR27?=
 =?us-ascii?Q?uAwh0AF24One5XPCc5+J/P3Hz8vpE8mo4rjFrwKES6m00Zblank/+XbQVmHX?=
 =?us-ascii?Q?61RhqW44VSWIYBj6vdCoXLCM9xYkTmZv9PyHaG/TMgiOX59MBTK7RU5arli/?=
 =?us-ascii?Q?ZHiGCImOTI4GFSjpUFnCLuHtKodpjA3FLsLyaUgcPyhOKegDAqkS7AFSyysh?=
 =?us-ascii?Q?uRgMuef1H5E2YAEh8jJT3288iJtUJQrFkPXOJof1RwOwifKNNtoyiJNGeqGe?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d53a18fc-5f0f-49e7-aac8-08da9db5ca54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 22:48:53.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCVWf+ikmxR+93G5i44bXV2/KjtaQpmzh1a4jmOrL4xdmGyQmv8JDa6qTegFKDtNAu5FPX7tdXV0H8rrGpgRuDXHQTw0GM8GkbwYUbYYNy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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
Cc: mika.kuoppala@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 06:46:48PM -0700, Radhakrishna Sripada wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>The part of the media and blitter engine contexts that we care about for
>setting up an initial state are the same on MTL as they were on DG2
>(and PVC), so we need to update the driver conditions to re-use the DG2
>context table.

this paragraph doesn't match what you are doing in the patch. Which one
is correct?  From "v2" below it looks like the original intention was to
just reuse and now they are changed.

>
>For render/compute engines, the part of the context images are nearly
>the same, although the layout had a very slight change --- one POSH
>register was removed and the placement of some LRI/noops adjusted
>slightly to compensate.
>
>v2:
> - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
> - Add missing nop in xcs offsets(Bala)
>v3:
> - Fix the spacing for nop in xcs offset(MattR)
>v4:
> - Fix rcs register offset(MattR)
>
>Bspec: 46261, 46260, 45585
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_lrc.c | 84 ++++++++++++++++++++++++++++-
> 1 file changed, 82 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>index 3955292483a6..c7937d8d120a 100644
>--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>@@ -264,6 +264,39 @@ static const u8 dg2_xcs_offsets[] = {
> 	END
> };
>
>+static const u8 mtl_xcs_offsets[] = {
>+	NOP(1),
>+	LRI(13, POSTED),
>+	REG16(0x244),
>+	REG(0x034),
>+	REG(0x030),
>+	REG(0x038),
>+	REG(0x03c),
>+	REG(0x168),
>+	REG(0x140),
>+	REG(0x110),
>+	REG(0x1c0),
>+	REG(0x1c4),
>+	REG(0x1c8),
>+	REG(0x180),
>+	REG16(0x2b4),

are we missing 0x120 here?

>+	NOP(4),

NOP(2), but it seems this is here to
overcome the missing 0x120?

>+
>+	NOP(1),
>+	LRI(9, POSTED),
>+	REG16(0x3a8),
>+	REG16(0x28c),
>+	REG16(0x288),
>+	REG16(0x284),
>+	REG16(0x280),
>+	REG16(0x27c),
>+	REG16(0x278),
>+	REG16(0x274),
>+	REG16(0x270),
>+
>+	END
>+};
>+
> static const u8 gen8_rcs_offsets[] = {
> 	NOP(1),
> 	LRI(14, POSTED),
>@@ -606,6 +639,49 @@ static const u8 dg2_rcs_offsets[] = {
> 	END
> };
>
>+static const u8 mtl_rcs_offsets[] = {
>+	NOP(1),
>+	LRI(15, POSTED),
>+	REG16(0x244),
>+	REG(0x034),
>+	REG(0x030),
>+	REG(0x038),
>+	REG(0x03c),
>+	REG(0x168),
>+	REG(0x140),
>+	REG(0x110),
>+	REG(0x1c0),
>+	REG(0x1c4),
>+	REG(0x1c8),
>+	REG(0x180),
>+	REG16(0x2b4),
>+	REG(0x120),
>+	REG(0x124),
>+
>+	NOP(1),
>+	LRI(9, POSTED),

humn... set_offsets() is forcing MI_LRI_LRM_CS_MMIO
for ver >= 11, although here bspec shows this MI_LOAD_REGISTER_IMM
doesn't have it set.

+Mika, +Chris


Lucas De Marchi

>+	REG16(0x3a8),
>+	REG16(0x28c),
>+	REG16(0x288),
>+	REG16(0x284),
>+	REG16(0x280),
>+	REG16(0x27c),
>+	REG16(0x278),
>+	REG16(0x274),
>+	REG16(0x270),
>+
>+	NOP(2),
>+	LRI(2, POSTED),
>+	REG16(0x5a8),
>+	REG16(0x5ac),
>+
>+	NOP(6),
>+	LRI(1, 0),
>+	REG(0x0c8),
>+
>+	END
>+};
>+
> #undef END
> #undef REG16
> #undef REG
>@@ -624,7 +700,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
> 		   !intel_engine_has_relative_mmio(engine));
>
> 	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
>-		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
>+			return mtl_rcs_offsets;
>+		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> 			return dg2_rcs_offsets;
> 		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> 			return xehp_rcs_offsets;
>@@ -637,7 +715,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
> 		else
> 			return gen8_rcs_offsets;
> 	} else {
>-		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
>+			return mtl_xcs_offsets;
>+		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> 			return dg2_xcs_offsets;
> 		else if (GRAPHICS_VER(engine->i915) >= 12)
> 			return gen12_xcs_offsets;
>-- 
>2.34.1
>
