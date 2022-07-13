Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42F573F4B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197142BA49;
	Wed, 13 Jul 2022 22:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1607C2AA51;
 Wed, 13 Jul 2022 22:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657749688; x=1689285688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1B0qs1fQLQN0sErzVjOwi0VqwL9fAz2cLad6tGhysIY=;
 b=Ln3bwnsFxA+hnU8E4NsZZfSiAQnEEVcH7rm2uh0Msqo/z9sJcD8BU7oL
 OZJAYtf5U92lctxDZ7Yh7uhz+Zl5pqVStalWwPe3GBhRp4IsWTU8i1QG4
 VyLx2MHtncDtL4qPWSq7W70eOdSRvyyRBJFKZzC6So47HSBw/5/QPEx0y
 Ewi5hzzp3nnFwmbVMYfSOse6IUbyHG+cJCj8QzXcfEVNmWthdteAww9/1
 ba6xcz77RJnjARVTAmduYuHgVmuiB8ga/rvvnF+2rbsCiSCoEPcUcuiYN
 H73NtVjeEtM0fk/GTlRJlXGvGFLNw9WojrQfqy0zW5GU6X2ZL76ZPoYzv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="285379502"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="285379502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="722505767"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 13 Jul 2022 15:01:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:01:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:01:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDPQVdtulI6lKhjBMHmLeKiMLHU7ghVc3N5u51NaaDV+NaeJapoARGJo95+pBfgNjkZ9e5GYG55+OFeWnKqSRdRqRyJSl8x8QY2FkKhtRajSt9v2/kNvytQ6CpVtXiBY8vvZKhFwZGD3t0WuhB+0gRpdEnp8V71kZWNvo4CpNlsKI8sgnkRtvckoAqwm/xGSgCVqCNl2QCxIJwiz1124JH6aoZ1Df4EFDmHcv/vdaJzYfO5A7JUD6STTHohAeeQJIqYcrlvHWPvuVDus0mUFlC7AYs/FgKKU+zTdQCNc4h506KOter+DGJFK/d0Th/IT9lkohvyTXsn19SuEOjIqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcmuN3HERKuDjjmYde5MVk5tZ83uvE+qzBYWyM19g0w=;
 b=bg/rgXqUHl8o0zAAQYssRKbfu7C7p1+BhjE5k+LCnEd3Y531cbn2cI3JV2EYtTP5W2T7Rj69c2N7GTtV4A5bZdt2yMcjCb/UlVKn3h4DFmvfStSvtOFwhZ72wQAkTZZIxQZwSsCBnDYGagLyox9YqKC7rXiKj2kgG9njY7WJkf+0h/Wcmp9VS7rkpPabtv1wxtg32EbduIx+LM6PhOjn63BG29gXnUs156jKSx3eCP0dulmUqiMogf6iuwPxAz4vwlTjYGNY/wxmfuXIh7io7BkpjI3EGVrUr+fG39TJfu6+n/GKjQQpDwzaXZza2AtSj5BhGG2q9M/BxozTTgQD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 22:01:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:01:05 +0000
Date: Wed, 13 Jul 2022 18:00:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/39] drm/i915/gvt: Fix kernel-doc for
 intel_gvt_switch_mmio()
Message-ID: <Ys9Am6jkPiVnA+uW@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <72db6b58c1f223e326f84978267ba064eaf67ff0.1657699522.git.mchehab@kernel.org>
 <Ys8/JP3ITMKF1aHp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Ys8/JP3ITMKF1aHp@intel.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76e0583b-0d23-4f23-a64d-08da651b2ed4
X-MS-TrafficTypeDiagnostic: PH0PR11MB4902:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xl39QSOSI10onyWubMB4GuvWNhu8bPrvzwMcSzW2bY5njfNuFx0rHN0/UrrUnzVBQ3O6dQ6Lz9Pa/DEmphWuggICA3CAy5nfDPPMl/H4/Gvg/4XDZwOkbd5pPQXtSoPVRLYCU+fw8ENfvkEBWNGl0BjOhrISdH3dDsI0Q/8W5ZPd4Q+SJihQPidc7CBHopoQMlqb54DULj1Q9A0Hr69//Ou0tsfMZ6LS0wiTrs7ANUEn5UFibUhMfGhZjMTCpHQCGlPgmyPFbA7S0blBod/yx+882kAkHZQlmfoWTPAThnaTm9htXcDl7mzHPIrs6r538jYj+JKIwqes0H0o/0x+DKG/vcbXlBo/4ZQHA+H380iN8T2vpN7Trwnm03bdyxs/jaavYgbNlaK9L5ulpgkHHZU6Nz1ZF2gcfESPJQDIDSeLD+hEV9ETkKVXU/1rf8ESVqb4JFr8tsUKgsZvKe7VBI0kHygKoBhLf7/rWIq6xOesdEoKlTqRgUtQ4fLXYD0eJ/ftfqaYF74ioo16llJ/86KPsM0HnVc5dJhAyuP+HdBVJYeUSz/uzmdh8+MyJbtBGTxAimasOUAJUTDqwuieyIcNTe+giGAF3G6Pmgy+N9lg0zUfcLCunDGMCFeERX2zn3k4wQJiQddmHpRo1OXJzEIpiQvU8AVaehyoGJruFsFscefrLDMod1Us8iT/5x+2OX0HcKYDMWje2EOhvLMA0bi2Wt+gYQLQ9AF72pYUPjNDd1IXzmvgmYq7uOLNJZP814U485Zd/4/8k8XLyOkATt41ilAQgwVHegU7RfFJaa29m1TVy/LKoEHfIlYi/tY5oQo+fJ4wJBDwsx59jU+9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(39860400002)(376002)(396003)(346002)(26005)(316002)(38100700002)(66556008)(66476007)(41300700001)(8936002)(2906002)(44832011)(4326008)(5660300002)(186003)(82960400001)(8676002)(6486002)(83380400001)(66946007)(966005)(6512007)(6666004)(54906003)(36756003)(2616005)(6506007)(478600001)(86362001)(6916009)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eyr78Tke/wez8tWDJD5psapR7vJm6B94/VePxODJaX6qY+hZoxGTiYFeNkZD?=
 =?us-ascii?Q?ubBzQ96I7jBVshSSLUpb2+QxKNsFfVJSN/Xb0ozcfAYCM/2plS7mo7tVLwTJ?=
 =?us-ascii?Q?9B+LWM2Ys7coHVROOncyHTs9mFjwCEArmULX5wdUr4akerhf7nXBoY5m+Tbr?=
 =?us-ascii?Q?4HPYQkllLspHKMvDzMFb91A158o41LHw3kGweBpzy8GSquO3OfMbupqiwgKL?=
 =?us-ascii?Q?5uBW8rz7DbvLX50K/ONh0YRueQ9AhwUma3opdgn7/k6F7IqW0jTcS4ApGRez?=
 =?us-ascii?Q?b9bE3VmmY0ds1Kqd/8b35fhv4ER3S89YV8SzKVGffsm5Q2wN3sDiXj13r819?=
 =?us-ascii?Q?YmfZbW1yoR+9dPOJjUzO20B+mPxo4RLlxafhXsJOu2FoVGqeEGjDaTFa6Sqy?=
 =?us-ascii?Q?MMn13lq0sJL8u5BKmWaPLAgUA/crz+PJG8EGj+vf+Pgu10fZrLzjqTXukiFn?=
 =?us-ascii?Q?dxpiMP/vLERo8fv9QpxcN5SfJb8s0T3SKCKO0c0joMjlwjMkzu6riOxwKYoy?=
 =?us-ascii?Q?DNhpy82pglN0oQtrjMfo9VwepgiaLdAK0bVRvR3/r1joiGkFcV8LMNn1ZOYB?=
 =?us-ascii?Q?PXzzXaeOdhOwCDiwfTg5m2pl5OAYyjp5EUc9L2dzfKzDmXkFG3Daejk/rFbL?=
 =?us-ascii?Q?hGKU03EAJPVreCat3i8IELQ+ntB8OwfX1udqXXI5+DyvJ7Uc61Rn9kA4jR8U?=
 =?us-ascii?Q?Zc4IsLpoxtYs6w6r/OERHsHeN28EOvNvqKDZlBDjJHhIiTv3R5BrY57diGZi?=
 =?us-ascii?Q?ff70DNuItDGY+L0F0Tz1DFYU/N1imo2yHGcm+8eGiGAhZKlt2V3DF0fuu0Ls?=
 =?us-ascii?Q?oYgtbQ+qqciPb9vGslhhuEmVGU3t+KgnrWlfKXIMWm4RgVY47xTrRXyhpuyX?=
 =?us-ascii?Q?yrFW5TC1xIqzYyAwf5DwBpHzyjab/Y3hxKEAKusxgBhL1V9xLIZUE6HM73nQ?=
 =?us-ascii?Q?hTGJPVP0g6f87iMp/YkDWGOBxRH7883ChPxUBvMgyPlIsMN2Rrc6OsbzJowk?=
 =?us-ascii?Q?DxII+gW3L28+XLPX/cP7fpRCFx0TsMv9ZIfYYWjShzaeedFBNuDU7PxXlMUt?=
 =?us-ascii?Q?tnUvXO263/UECIiIdNjSfG1eo/wZbjEwJ57G4cbmzxbl/1ndZ87OToRZkWoV?=
 =?us-ascii?Q?wW/vL/ABEZ7SD1EFG7BHFhr9ql/13uUnlxhaU0UiEb6f4N6bL3nFNxOMdzF4?=
 =?us-ascii?Q?hnk9fXV5cRo233STaNQnWd02aC8AvQ+zE7BSzZsagecq7rD/cIBnkkfeeeMG?=
 =?us-ascii?Q?b8waya46qMGraxZAWIVoaTejwlkaXWHV+fy+veokodiUvdNYeGhH88CGs70X?=
 =?us-ascii?Q?qUgr8MFJwkI/bk/AM0tPCrmCbcLVNTjpEwGgD/K4zW1uIgPstKtfTBJWZOG5?=
 =?us-ascii?Q?1o6k6ijftgU7mI/++3qG59dmkdHhiAX2WBkX+eZKxrenjcXkkOeHspDyD2CO?=
 =?us-ascii?Q?JqF4a73WrApD09ATEYQlwvrwBhyvoOjJ+CR3T+vdgumazlOqDWyVl2TZHO0y?=
 =?us-ascii?Q?tEY0r9KSN2vrMr34d/765wXIj6cP2ZBDOiC+jOCRjGWXY81G/g4Q8rhvCk3L?=
 =?us-ascii?Q?crThaRZBhNUWfKrtj+B9S7IBiREq7Z45lj7qSuKT6IvF6mCpADyI1vka8d3U?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e0583b-0d23-4f23-a64d-08da651b2ed4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:01:05.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgMPEpZi3qdI37MmglLOH+Lrisvd1cY3EGZvONf+blzMo2SHeN6zQr06OSnjYGuiW9pVuptuAdYW1S5XpKUZKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 05:54:44PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 13, 2022 at 09:11:49AM +0100, Mauro Carvalho Chehab wrote:
> > From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > 
> > Fix the following W=1 kernel warnings:
> > 
> > drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting
> > prototype for intel_gvt_switch_render_mmio(). Prototype was for
> > intel_gvt_switch_mmio() instead.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I actually changed my mind after seeing that in most cases you use "()"
for the functions and you didn't use for this case...

which one should we pick for consistency?

> 
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> > 
> >  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> > index c85bafe7539e..1c6e941c9666 100644
> > --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> > +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> > @@ -546,7 +546,7 @@ static void switch_mmio(struct intel_vgpu *pre,
> >  }
> >  
> >  /**
> > - * intel_gvt_switch_render_mmio - switch mmio context of specific engine
> > + * intel_gvt_switch_mmio - switch mmio context of specific engine
> >   * @pre: the last vGPU that own the engine
> >   * @next: the vGPU to switch to
> >   * @engine: the engine
> > -- 
> > 2.36.1
> > 
