Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E83573F35
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121619B474;
	Wed, 13 Jul 2022 21:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AB09A5F6;
 Wed, 13 Jul 2022 21:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657749292; x=1689285292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sBAkPnhZb6fINHhue2+7k7PtvKHnt/YvWsZKlK64SYc=;
 b=NgCYqfG9H/HakX63DSwTRdDsQVtftE10qE+jpSZpn0YOPBXz3DvrGp+c
 P0J0EgEpzD2sdYxU72v7Ab1xkY40117JvGvQZ0GR8fJerN8jsf2CnW5aY
 LnEuTCAR0n5frmuVPGLyEoeLCOvLXlgOMkEFXKfVooxtmp8F6u4ZEJ4pH
 d6BsQi9WK4pEp1s6ydjsXnchUc5A5ikTNPAUUFQdNM01LtQ6C7BmBox1v
 o7/66376hMS2e5TvCO29QZ310EIzRQ5dNnu44NS+NZV0yvn9CwRvLIe5p
 hG8CnLLb4V3eBHxGeEBQaO5p3HqvjmxSMXLZfUACnApIFA/8g7DFkSkbW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310999592"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="310999592"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 14:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="922812808"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2022 14:54:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 14:54:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 14:54:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 14:54:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrgYyGIHV4VEh6lxT58ebl1k1zczyOz+fgc+dT/ApXKC+FtUknk12Xq37Ps/UaBM0RULEGK57azFGM/ovWEwwd7ryZqaoXytQHn+6Oj5t2Xs7YkExHm9pct9YjuRSi+e5rt9Q18nYCbyt5AjkNnCfdCfjubUqxgphG/R8yaWiZaqq0IjSWsowlBJC38Pf6TVbQi6WRB1DVrdEyblJgq4jCk2BMI7ZW/tsDYWvaK3hY4qrPf2IGh0UqcrTTkBOHTsMCkaXUPfqNnRi6Zmw0f2it1rblC+3Z1qI7jdEiM4tAng6E9mXsMu6fnU6RSlHEHswTyRwlj/KWAG7TvY4j8DiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNHCdssa3TEBoqBXMrhZUA+F/Duqzyug8Rom+RmYPyw=;
 b=nzcoer2L2pkzLVmfCv4hMzrMHxAce35msC0xQ+gvjxaec8nypRVjB25DAXVWf/YQJuaaCtRQF/Ua6jz3dLwselawaDv/POZ6yEJ07Zb0hMsjO+rEZXQbhPZljUiAa7iUlf+8XAEhGcJ3Bdfluxt74Nbr8rIAkKTgcDTygZQPo7IlL+PSsCq0SSQUt1ybRg0O5dIIPToh9K7BO2lnaUlR/wHjaVsybT0FGBCuJ+SBk5jH0o4gmzpCnkbO1e5a8BnIC7GyHC7vsY3fWK7nI5J8/AR+SFFmCEedCHbtPoE8SEPFjQpcVfT06wKe795QQ3nuap0eoDng32LaBGEb+XM5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3947.namprd11.prod.outlook.com (2603:10b6:5:19f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 21:54:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:54:49 +0000
Date: Wed, 13 Jul 2022 17:54:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/39] drm/i915/gvt: Fix kernel-doc for
 intel_gvt_switch_mmio()
Message-ID: <Ys8/JP3ITMKF1aHp@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <72db6b58c1f223e326f84978267ba064eaf67ff0.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72db6b58c1f223e326f84978267ba064eaf67ff0.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0259215c-e397-45fa-6400-08da651a4ee3
X-MS-TrafficTypeDiagnostic: DM6PR11MB3947:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qS+k+Ae0BiW0gvPCmQ5MKaaz9v9AMImVzKbkWdrIvGDvy30VkQUsE9AeyaqZzdNjJxo4yCa6smitL37mQIfCkFdmmRt06/jC3azoTQXUxFw1IB/4MoVRgvRq9Y1LOc0AA9QjsFoSId9rhCdYJqKJra791OByZ2fqhM2hIV28hxOiJjzeh7C8GuJi4EHgVT7A0h3dhoFOKdc4wH1S6VtGiFcoC8JitWF8v0qxYT73ZfEzxKb5HsPFPli6huoy+1v/OCt3TGYzxPqLzXvEvXqcLBZtXKZNW2PsQ+tmPh+4xCRZ99ijzLi9dSe9lSRJRmMwKLcZHg/ftWnAnjnPRxX2uePV6mWsCOZTJy6p7Gm9HWfJ+8e00ULnF/72NWr82Pv4SpDnXPPrcza0+clZuRdUlI6zrbR9yN5Up8slOm04MZ2F4p/ISjdjO56uBjprCJuxYSzXAS7eFb8DBTKEBrXWFO6x9yHfsO5teF2NDo9HRfzEYRiXuFrs5LGlT+b34A0kebemU+QRaMosQvMXfMdrEBTa3X0XEg/7CFcSH5QWVMJk4SpqTjel7742PIQzSwvTPMXjmpAhS6308LU+eIf8wpbWCc/i8V4IDPGApnM0XJNFZy63C+38zNmN+5cVXKzqAoevONERqw1w8fGJhifFCA8onx36Bx09xJO5LSr2fRtrYab9CDsII1ig2R+R+4WIUG28Ny0P/kwTJAInzx7q/dpwrMOeIVS7fw4xy+qKQvBXiHCIIMmT8pu4skFbhgvQ3v39LcFnP0rly6wBloQfd/rrRI5N6Xlp6KtD73wuyDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(376002)(136003)(396003)(366004)(186003)(66476007)(6506007)(86362001)(6512007)(4326008)(8676002)(2906002)(26005)(6486002)(478600001)(6666004)(54906003)(966005)(66946007)(6916009)(82960400001)(66556008)(2616005)(316002)(5660300002)(41300700001)(44832011)(38100700002)(36756003)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rTQHczcB94KOXpf22sMw4uHjlXm4h7UlNOvtr/c8PbDdYplEOQ9y6f5Qf57X?=
 =?us-ascii?Q?FuzUJqloIuYlEoxaLo9kbRGf37PIfX5fZWi4/2zy9wVpHzXtxfWLl+QpIo2N?=
 =?us-ascii?Q?sT0Qgczg6vdeVDgHjo2daJkLgZOXvDSaHcVUxP5Qf/6MMRZpdF7I68LY6nbS?=
 =?us-ascii?Q?ZgSuDtPsaWQdw8i8ip/Vz7hK8miUw6gGr/zQl4Qek6+ICFccsQ9Q7G/uuZDM?=
 =?us-ascii?Q?dHJeWgLOR0gNCd8R9NSltKmD61k+YvnpAeZiD9+cz1tMK9qPb/L5RSvfPlQN?=
 =?us-ascii?Q?JL1yUR3OGuQyOXej56FoiCiKzmf1bm2XNWZOQpw+XLff2Fyrdv2o1r7dQMTi?=
 =?us-ascii?Q?6rvZLnPS4ZuMAKkgpzjnwtLOdr8C/41AsiZlDyqi5rbJLhU+wQD8YIz8AaT/?=
 =?us-ascii?Q?CHjZSu0C8I3dlW23HshfgGZvGs8jqrsSWBGLOuCxl0Rx/+Wqz1CpN5c3jviS?=
 =?us-ascii?Q?y7F7BVGXMbo8sRUOdBQpEaRXjNXx+m+xS8lgWLPziOYQheI2fAiKO5TreuvQ?=
 =?us-ascii?Q?22JSE/F+qTo0p6SF836QJPiXRJ2FgV0Hc5AN+eiOgbo46HT70uKDCqUCTCqE?=
 =?us-ascii?Q?g2SyyHiOiLXoOjVeJO+e7FalXJoWRYcKFsHjth6EGnGidQK5BRpOTqw8CWXk?=
 =?us-ascii?Q?5F6y2RLM1gfZtZ1BNaxAERDvhjsnCQ3OPxOUB6/QbAUtjX+z0tndRqzJyqrT?=
 =?us-ascii?Q?ERSU2NofPuiiPx8TR+lfSTuwHWs2fiIQwAKIEqIIr+Nopd8fDfjZPDbWWbhK?=
 =?us-ascii?Q?3HArD3c5B1frL0JtWWdxYZvRGi+ulanVrC5BL55R1c7g2kkCyrIg+jYyd7TM?=
 =?us-ascii?Q?4Rtxxd2nWQR9ySuubxJF8dEDzjzNw09MfI6Xc/ro9RJckdG50gxIb/Ns27hh?=
 =?us-ascii?Q?+R9GNzU1aiqaN5cMZ8Hx9lJ7uN5gf+H+7t5b3cNjlmihzXKwf2DmNG8WJAnM?=
 =?us-ascii?Q?NyNhSNL1SPDNFJuhlVTOwqBmEstEDbzxNsClKstE0cA5bhbwMIi4eIbPNAIB?=
 =?us-ascii?Q?XPYIKDRXrd6fa8uPEab1cXoy7d4M6WPu2hfRM+ZuZF8g1jExEfgyExVg3ycu?=
 =?us-ascii?Q?pJ80mKxZZGX2w0xb0y1SplGhjlXluZxvM886gmBZTDwxz9Evjq0VA5sgNJHw?=
 =?us-ascii?Q?Nv44n+lKXbjgDmjVzLXjrUBMVnZPnrVK1kuco62fEsFDzljgiUk4rmzomsZ3?=
 =?us-ascii?Q?WEuGyM9YQlkUAo/PeSXUcHErHw9tRtQix6tz0pv2c/bsynjOgfFhHabahRId?=
 =?us-ascii?Q?/afCHiV39ofxS8W6OW6k/QZRWO2dZfV+jq0HAb/d5c3iz8IDxL+4HuQB8p+H?=
 =?us-ascii?Q?X2qIzo38PCWSMHfIP0weAcIV7w/kjQ+CH5bq0CcEy2r8bOJohHBdzYFEE1k4?=
 =?us-ascii?Q?PP5oVp8/o17E+pJx0fzDfHcp8raH6KZ0ox4uDDDVdn2f8di29hxyL6FLCL4l?=
 =?us-ascii?Q?c5X639GtcDfaLPE5OQ5XdoAPSQf6EdxCCK8h6z0NuEjVx1RVbykyiZSnR5Tj?=
 =?us-ascii?Q?ltElhySAvNEHlltBNI+9kmq6073YgRbnFJWSfupikuiKn2Lrkx3zc/8LUhto?=
 =?us-ascii?Q?m2saRUC3vyF+mukHkT86/Mrk7Ac12cI4K7gFsaQQOL9KNF4wCWgBmBdmWZsp?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0259215c-e397-45fa-6400-08da651a4ee3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:54:49.8894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fry43E7kHjmJaguwVCR1bxCIgNl82HrFTa8iZUuLnmQ1V1iAIRE5Pcpb+QyXw7sWak+ZX9sqyTo0gGQ/QD8Bmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3947
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

On Wed, Jul 13, 2022 at 09:11:49AM +0100, Mauro Carvalho Chehab wrote:
> From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> Fix the following W=1 kernel warnings:
> 
> drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting
> prototype for intel_gvt_switch_render_mmio(). Prototype was for
> intel_gvt_switch_mmio() instead.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> index c85bafe7539e..1c6e941c9666 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -546,7 +546,7 @@ static void switch_mmio(struct intel_vgpu *pre,
>  }
>  
>  /**
> - * intel_gvt_switch_render_mmio - switch mmio context of specific engine
> + * intel_gvt_switch_mmio - switch mmio context of specific engine
>   * @pre: the last vGPU that own the engine
>   * @next: the vGPU to switch to
>   * @engine: the engine
> -- 
> 2.36.1
> 
