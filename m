Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB765F810
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 01:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9977010E2A9;
	Fri,  6 Jan 2023 00:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAF510E2A6;
 Fri,  6 Jan 2023 00:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672964357; x=1704500357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LZ8K7IhG0HTz11EDvwip9stmo33kjk/5xFVtCYK5AZs=;
 b=UDH8vbxxk8FVKkWralZnWB/mOJKTyPLa86EPDk8kjSQun4qX+wCMlzCR
 5LNPbERbB77/ZHc0r8FMI7WSucYiOSjDrGthdGDj+LBvdtYd/ZzcUszYQ
 gUafj4f6Pp4icADAeLV0fxMTN0zYRrdmCujjGPi7gp6BUq1GpIyILCo+6
 vE/rtedSzrIjYQihz0vgWOy0rajuYU05Ukhfyi2ghkYju+HEhnNUzD9ZU
 hCVgiz+XAheaOGVoH4WIIkAgCx4r8IZM73Ps94zEzqJxkyJ6RMY708psm
 5QBBNa4hLfHFZn4WlJGxf0slAnTuNZiMp5nJYY9tQOqfdpaaL4DG2uNgK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="321068973"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="321068973"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 16:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="633335778"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="633335778"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 05 Jan 2023 16:19:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 16:19:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 16:19:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 16:19:15 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 16:19:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTIZ7w5AQyw2Bam9ycXOKVe2qIraJDQ5/pmzecAnGOuO5l/0PcbQM6R8sPUEbVtkGdXLqEu1oGqE12vWaZCPCCF0Wm9CY0P8ZLs9Qo2M+zabKvDbUUSjkGcHZCP5exqbizby0eXD7q0eRQIywUML3PU5PPU5OhK1hWq7zBoC/PMZsec+Uq7YJMRBzENEGsNn+7efR1N8E6PQz8uwXq3N/k8cUakx+NXBzUCmDH1os6yGrFTVsU2LQ3zTAENEHwp8vdd/v70vbpEvkkb/duA+voF+4IaJT0ZyA5ruE1tVc2+sxkriUPSJPj45tj7CTH580omERizkbVs9ntiydYlekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUt2kmbdhnoeWeb4km6HPNryh20Yvmp/5qE8JK2kLms=;
 b=C9WiyR0hAgQV904O/zRcz9SGs87IdftHCw1YLgEJumvf+C86+mTbg7sKYkaC6Jk86+ir9NT7y0pUFUgCBt8NOItRBzNlOvNQoz3u7S+LZjW84AFwYY27wbtZEtksxKNCnELIwqAD59fizNQLlQ20sZAg9pOCHwi3Jyozc++EDJkcEmadZvMP0MdPof89i2qB5DCvcO+JQPrVoYwUIE3ZcMpj8GNQZkKXV1CoYjAC+77wuo7vhdGVN+aHOYJMOStSmr2bQmpavYtsXjRZdbZlmnh54tqvA4mg9ozjWXb6J0DANAN2oqopZ+PiykIRbFV24c9wl6AJmTQFA7PJG+c/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 00:19:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 00:19:13 +0000
Date: Thu, 5 Jan 2023 16:19:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Consolidate TLB invalidation
 flow
Message-ID: <Y7do/liwu7JARoJl@mdroper-desk1.amr.corp.intel.com>
References: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
 <20221219101316.168129-3-tvrtko.ursulin@linux.intel.com>
 <083b4424-d984-a2d2-1f58-035e4c1c82bd@intel.com>
 <Y7SIwogJwS2teOgy@mdroper-desk1.amr.corp.intel.com>
 <210966b7-d736-48cd-15f4-3451d96914b6@linux.intel.com>
 <Y7W6Y6S9xg37wc42@mdroper-desk1.amr.corp.intel.com>
 <defbc0fe-f588-6631-59f9-578264551378@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <defbc0fe-f588-6631-59f9-578264551378@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6c5ff3-bfd4-4d04-68fb-08daef7ba36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlef7Tig04sLlQO3Z311MFfRKrEJEmhjhhB/XLQQZfe8rPMVWyZN/VmX+puW5EUufJWdTGR+tgsYZfQzYLHkpOw6B+JYRdxYW0v02jcoX2W7SRgIs6ORvZ5BsPz1a6UdbUGrXZhDgmw/qOIULv/MC3oeBhQVIB7x88RCVVVJMhJz6WsyCJOwSSASOIxrLnlrADibOon1YObhgUugeiK1k6GjTj2uBgn5I3XNxNcVb6lNloWdqiUwEox5rGe6hGREuK9mX5J9EH83TscJuuHs4R91dpxKiaCeubLDXEEUcLuGhW4p7GPQgFS2sew3ev4XknnFMQSiCX0RJqaLdm+9iPS9KRVtzE/RkMmbibKyX2tWhy3nWi6HOTErK6uJL8xxAzfctf20WbH1319dVVuglqqaj2lf0sK8CSEC0Wu1eCDOqfeSWyBZS1aiE9qbKDZHn/zrZ3rh+AjVsbNOxaBRBnPXpPJSt8bHwRu+x/SGW5bbhFgq/lo8hHt8hG6zJQ941rgoFQXxetFVGoiHbQEigfJxoKReWHaEikLFCEcTEJzIWZz4heaUiB/koiGyb+KMiVl2Z2Xymi25jBocDPS8f4aLSXMZC0JUgqqgGtbT54UhlAY+b9KzuzTBBr2d4ZlvKfiCIrMEWMTtdk1yD/nPCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(66556008)(66946007)(4326008)(41300700001)(66476007)(6506007)(53546011)(8676002)(6916009)(186003)(2906002)(83380400001)(26005)(316002)(86362001)(478600001)(6512007)(82960400001)(6486002)(30864003)(38100700002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6sjnCFxgWViypU5C+nMSTokoBDwTbZANKTArWgDXS50F4uwGz3NfCSdYD3OZ?=
 =?us-ascii?Q?kygV92MjmcLPAoAL0ToHfSelHI7ITcK3NWj/UlA4gKCm6+osqvkaTDCai7Mm?=
 =?us-ascii?Q?Q5t0YivCUahP/a3ezjE/UiB7g3aJtBEasFKNOOEHz+hvpoTV7a51H0WxXaYV?=
 =?us-ascii?Q?bDBFmaYSDxCvzwYBftJM67RRN6wpjmDtpQ/WBG71d31FTL51yjZghKPXtdST?=
 =?us-ascii?Q?rEm6jY8Nl+bOAjyPY3INH3NIxQlEDE3ScGeqmmGPcXVves08Tr5KtN9oKIL3?=
 =?us-ascii?Q?UTKX6jy+d6rnqLCH7bvQnHM9v6cflGu8W+7F1w98/KHeouFylhM9Jn03hAKJ?=
 =?us-ascii?Q?oWzLvagvN3z465w4WD5Dc1EnU3tNayzh8LwBJzY8kz6MMBjVqewn6WhGI7qA?=
 =?us-ascii?Q?QpYaSQQjlVf/jjVDKRt5369tXWWr9aArXOmdof8j2i32c3AlwYSuUR3Mbm7Q?=
 =?us-ascii?Q?nUcxp3J13Y1PiDDqB+iCLtt+cf+gBcvqRLYEyI69672X8nyyw/aLDGoUJwI8?=
 =?us-ascii?Q?wJW6K+VHkiuHIO6ncSVxZ/K+1FESnnCoMqZWinSQGN7F7qdjXhsgG99A99VI?=
 =?us-ascii?Q?9gWAia8S0CbYtmRRnrA87muJpzPRDOiNCmQ7l7BjvaKKM2OgT3s1Vz7vm2I3?=
 =?us-ascii?Q?m/UVbzu++3PCRmdjxOYGyi3xMo9d5hYYDiQ2/BgkACJSgR/lh25hsQU/xIlQ?=
 =?us-ascii?Q?vbbWBOADQ50Fdkwb0SADZOM6Xwka0B7PstqDynUSD375eA47PzSBmhGeGMyD?=
 =?us-ascii?Q?o6Pk2re4GK14qdzpGoI/LW4BT8ScJqFg0Uc4pbzdwD3lhCZYvZi+p3NcTsOv?=
 =?us-ascii?Q?yuNQEv+kQiXlnG8CbHCzS5/FZG/CIyEVsXxENFa1DXOqcQyKwpYZIWzFOezA?=
 =?us-ascii?Q?/gR30shkNUwuY67RQo1IIanr9r+bzvQdgXBDnRLuVUZfFZzU1DimX0J/SfJB?=
 =?us-ascii?Q?MHgcba+5BJ9iyR2woLv9qCyabdgPJSJ6C04+hc13pmdkdm+G8EUHMtAVSCFs?=
 =?us-ascii?Q?bJbQkw5s5ej3ra9anBLdPoBo0KQBeEjslircoXKADJSTOujFuk/b+Wrt+KnH?=
 =?us-ascii?Q?hS8rxAc0YNeRLcrJTEQrIf3diDsoZhLM/je97dzCo5o7XX4BQeJogsSU4tlZ?=
 =?us-ascii?Q?jAFVW+W32cxlrA7p/uVejPTSuz3srFCeSBXp3xjsMvi3KnRtTKrEAWlXES1s?=
 =?us-ascii?Q?l5J21XnAUxvGiN0F1FWGjqYR2CagEJBQzHh+eX92fOhV4Fqtg0e0hPfohj9E?=
 =?us-ascii?Q?/ymZtjQTAuuIxMgXn3t9Px8YRYXJQGGCpmOaFC4p/S45DSWbT2lUMFQqo+Tu?=
 =?us-ascii?Q?/fjUZmBLbOrAP5iWa/dgpLTXEKk7lhsNE6d3tL2A2WidmXqthNWcGnltdUG/?=
 =?us-ascii?Q?m9mP5v0/Bkk/wOsvMH1RYNyWW79KgfYJlwSjHzmyBT+GfhWNgyeMX/MquVrc?=
 =?us-ascii?Q?9epr3cDgqI3nF36gy2R6nkCg1OKVyO3KusSDUh8pxrVMBzZPtdGHwdvXoRBm?=
 =?us-ascii?Q?btMNDQMbJyAAC2+GvqQeOH2KKhVgRq4yzKyAhqVXty8jtjklCVL8PaIN8/xN?=
 =?us-ascii?Q?BdFtweybyqgAC66rZKKcrfGlDGmEyaNIdlYi7eDRLd0eL42zzhM6bYqcQhIT?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6c5ff3-bfd4-4d04-68fb-08daef7ba36c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 00:19:12.9715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2TjEmx5EvezL+2eWoSQnw71/10VIApQi8R/YZs7q1D6GTmuBT9MNU1U+QAd5RZ596QmiupmtA8UR5rOp4bZz8XZZ6gP4XhvJC3Se/VH4NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 01:06:37PM +0000, Tvrtko Ursulin wrote:
> 
> On 04/01/2023 17:41, Matt Roper wrote:
> > On Wed, Jan 04, 2023 at 10:08:29AM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 03/01/2023 19:57, Matt Roper wrote:
> > > > On Mon, Dec 19, 2022 at 05:10:02PM +0100, Andrzej Hajda wrote:
> > > > > On 19.12.2022 11:13, Tvrtko Ursulin wrote:
> > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > 
> > > > > > As the logic for selecting the register and corresponsing values grew, the
> > > > > 
> > > > > corresponding
> > > > > 
> > > > > > code become a bit unsightly. Consolidate by storing the required values at
> > > > > > engine init time in the engine itself, and by doing so minimise the amount
> > > > > > of invariant platform and engine checks during each and every TLB
> > > > > > invalidation.
> > > > > > 
> > > > > > v2:
> > > > > >     * Fail engine probe if TLB invlidations registers are unknown.
> > > > > > 
> > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> > > > > > ---
> > > > > >     drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  93 +++++++++++++
> > > > > >     drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 +++
> > > > > >     drivers/gpu/drm/i915/gt/intel_gt.c           | 135 +++----------------
> > > > > >     3 files changed, 128 insertions(+), 115 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > > > index 99c4b866addd..d47dadfc25c8 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > > > > @@ -1143,12 +1143,105 @@ static int init_status_page(struct intel_engine_cs *engine)
> > > > > >     	return ret;
> > > > > >     }
> > > > > > +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> > > > > > +{
> > > > > > +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
> > > > > > +		[RENDER_CLASS].reg		= GEN8_RTCR,
> > > > > > +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
> > > > > > +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
> > > > > > +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
> > > > > > +	};
> > > > > > +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
> > > > > > +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
> > > > > > +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
> > > > > > +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
> > > > > > +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
> > > > > > +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
> > > > > > +	};
> > > > > > +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
> > > > > > +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
> > > > > > +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
> > > > > > +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
> > > > > > +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> > > > > > +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> > > > > > +	};
> > > > > > +	struct drm_i915_private *i915 = engine->i915;
> > > > > > +	const union intel_engine_tlb_inv_reg *regs;
> > > > > > +	union intel_engine_tlb_inv_reg reg;
> > > > > > +	unsigned int class = engine->class;
> > > > > > +	unsigned int num = 0;
> > > > > > +	u32 val;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * New platforms should not be added with catch-all-newer (>=)
> > > > > > +	 * condition so that any later platform added triggers the below warning
> > > > > > +	 * and in turn mandates a human cross-check of whether the invalidation
> > > > > > +	 * flows have compatible semantics.
> > > > > > +	 *
> > > > > > +	 * For instance with the 11.00 -> 12.00 transition three out of five
> > > > > > +	 * respective engine registers were moved to masked type. Then after the
> > > > > > +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> > > > > > +	 */
> > > > > > +
> > > > > > +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
> > > > 
> > > > This is bad...it only captures XEHPSDV and breaks the handling of DG2
> > > > (12.55), PVC (12.60), and MTL (12.70, 12.71, and 12.72).  You're not
> > > > hitting the warning as expected since those are all now being captured
> > > > by the next case of the if/else ladder.  With the way GMD_ID works, we
> > > > may also get new version numbers that silently show up in hardware too
> > > > at some point (e.g., 12.73, 12.74, etc.)
> > > 
> > > Great (on multiple counts) ...
> > > 
> > > > 
> > > > > > +		regs = xehp_regs;
> > > > > > +		num = ARRAY_SIZE(xehp_regs);
> > > > > > +	} else if (GRAPHICS_VER(i915) == 12) {
> > > > 
> > > > You'd want to change this to
> > > > 
> > > >           GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)
> > > > 
> > > > to get the behavior you expected.
> > > 
> > > Okay, that, and then to be as safe as I intended, ie. warn on every new
> > > platforms so developers *must* check registers are still compatible during
> > > platform enablement, we would need a full ver range check something like:
> > > 
> > > 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> > > 	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
> > > 		regs = xehp_regs;
> > > 		num = ARRAY_SIZE(xehp_regs);
> > > 	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)) {
> > > 		regs = gen12_regs;
> > > 		num = ARRAY_SIZE(gen12_regs);
> > > 
> > > What do you think about that?
> > 
> > What about just keeping the code the way it is now, but adding a new
> > error condition at the *top* of the ladder?
> > 
> >          if (GRAPHICS_VER_FULL(i915) > IP_VER(12, 72)) {
> >                  /* Error, something new we haven't considered */
> >          } else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> >                  ...
> > 
> > I guess that won't catch cases where they go back and insert a new
> > version or IP refresh that's older than the latest version number, but
> > usually refresh platforms aren't going to be adding the kind of
> > architectural changes that require a new if/else arm anyway.
> > 
> > Also, as Andrzej pointed out on a different reply, we classified DG1 as
> > 12.10 (because of the interrupt handling changes), so I guess we'd need
> > a further adjustment to the "gen12" branch to cover that one too.
> > 
> > Honestly, I'm not super wild about the general plan of intentionally
> > breaking inheritance here; that runs counter to how we usually try to do
> > things in i915.  In most places we always try to assume that future
> > platforms will behave the same way as the latest one, and then we update
> > those assumptions as part of the initial bringup when a future platform
> > comes along that breaks them.  Most of the places where we do specific
> > checks and a MISSING_CASE warning are where we have a strong reason to
> > believe that each platform will always need a new implementation (e.g.,
> > stuff like workaround lists).  I don't see a reason to expect major
> > changes in MMIO-based invalidation for a platform n+1, n+2, etc.  The
> > change that I _do_ expect to show up (even for some of these current
> > platforms) is that a GuC-based TLB invalidation path will be added since
> > that's mandatory for a lot of modern features, but that will be a
> > parallel codepath, not part of the if/else ladder we're editing here.
> 
> The strong reason you mention is currently the lack of _any_ test coverage
> for this. In other words you'd never know a new platform does not work
> properly (imaging one more register becomes masked, like three have become
> from Gen11 to Gen12). Or if refactoring this area of the code broke an
> existing platform. And both cases lead to CVEs so IMO safety trumps our
> usual patterns.
> 
> As I said earlier, I am not going to merge anything in this area, apart that
> I want "drm/i915: Do not cover all future platforms in TLB invalidation" in,
> until test coverage materialises.
> 
> Once we have test coverage I am okay with catch all future platforms.
> 
> So regarding "drm/i915: Do not cover all future platforms in TLB
> invalidation".. minimal change is then to have it like:
> 
>   if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&) {
>       GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)
> 	...
>   } else if (GRAPHICS_VER(i915) == 12) {
> 	...
>   ...
> 
> Is this agreeable? That covers XEHPSDV and DG2. PVC and MTL, if they are
> intended to be supported, someone (not exclusing myself here) needs to check
> bspec before extending the condition with an explicit patch.

Yeah, that's probably fine (although it does put a hard stop to any hope
of getting preliminary/partial CI coverage of some platforms that are
still in the process of being enabled).

PVC needs the GuC-based invalidation handling (which hasn't been posted
yet); I don't think it even has MMIO invalidation registers like these
so it will never enter this function once the platform is fully enabled.
For MTL I already noted during review of Daniele's GSC series that we'd
need some kind of an update here to include the invalidation register
for the GSC engine (which is of class 'other'), but the change for that
is still coming as well.  So in general I think we do already know when
updates like this are needed for a platform and we should be able to
make sure we have those updates in place before force_probe is removed,
but your concern about being extra paranoid on areas of the code that
can lead to CVEs makes sense as well, so your proposal sounds okay to
me.

> 
> Otherwise 77fa9efc16a9 ("drm/i915/xehp: Create separate reg definitions for
> new MCR registers") was about Xe_HP, already wrong and Andrzej fixed it in
> 4d5cf7b1680a ("drm/i915: fix TLB invalidation for Gen12.50 video and compute
> engines").

I think the problem there was more an artifact of the original fix
04aa64375f48a ("drm/i915: fix TLB invalidation for Gen12 video and
compute engines") silently landing through a non-gfx tree.  That fix was
good on a mainline kernel release at that point in time, but was no
longer a complete solution once the pending DRM tree pull request
landed.  A follow-up after the merge was necessary to bring the second
half of the fix.


Matt

> 
> Further work can happen once test coverage appears.
> 
> Regards,
> 
> Tvrtko
> 
> > > 
> > > Or you are saying new GMD IDs may appear in the field without first having
> > > passed the new platform enablemend process? That would be horrible so I hope
> > > not.
> > 
> > They won't just show up in the wild, we'll know they're coming.  But
> > they'll be used for stuff like how DG2-G12 showed up after we'd already
> > enabled DG2-G10 and DG2-G11.  Or how we picked up a couple more ADL
> > variants that our driver treats as "ADL-P," even though there are
> > technically other SKU letters associated with them.  So they're things
> > that we wouldn't consider to be a whole new platform, just a new
> > subplatform at best.
> > 
> > 
> > Matt
> > 
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > > > +		regs = gen12_regs;
> > > > > > +		num = ARRAY_SIZE(gen12_regs);
> > > > > > +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > > > > > +		regs = gen8_regs;
> > > > > > +		num = ARRAY_SIZE(gen8_regs);
> > > > > > +	} else if (GRAPHICS_VER(i915) < 8) {
> > > > > > +		return 0;
> > > > > > +	} > +
> > > > > > +	if (drm_WARN_ONCE(&i915->drm, !num,
> > > > > > +			  "Platform does not implement TLB invalidation!"))
> > > > > > +		return -ENODEV;
> > > > > > +
> > > > > > +	if (drm_WARN_ON_ONCE(&i915->drm,
> > > > > > +			     class >= num ||
> > > > > > +			     (!regs[class].reg.reg &&
> > > > > > +			      !regs[class].mcr_reg.reg)))
> > > > > > +		return -ERANGE;
> > > > > 
> > > > > I hope the propagation of -ERANGE to device probe is OK.
> > > > > 
> > > > > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > 
> > > > > Regards
> > > > > Andrzej
> > > > > 
> > > > > > +
> > > > > > +	reg = regs[class];
> > > > > > +
> > > > > > +	if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {
> > > > > > +		reg.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> > > > > > +		val = 0;
> > > > > > +	} else {
> > > > > > +		val = engine->instance;
> > > > > > +	}
> > > > > > +
> > > > > > +	val = BIT(val);
> > > > > > +
> > > > > > +	engine->tlb_inv.mcr = regs == xehp_regs;
> > > > > > +	engine->tlb_inv.reg = reg;
> > > > > > +	engine->tlb_inv.done = val;
> > > > > > +
> > > > > > +	if (GRAPHICS_VER(i915) >= 12 &&
> > > > > > +	    (engine->class == VIDEO_DECODE_CLASS ||
> > > > > > +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > > > > > +	     engine->class == COMPUTE_CLASS))
> > > > > > +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> > > > > > +	else
> > > > > > +		engine->tlb_inv.request = val;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >     static int engine_setup_common(struct intel_engine_cs *engine)
> > > > > >     {
> > > > > >     	int err;
> > > > > >     	init_llist_head(&engine->barrier_tasks);
> > > > > > +	err = intel_engine_init_tlb_invalidation(engine);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > >     	err = init_status_page(engine);
> > > > > >     	if (err)
> > > > > >     		return err;
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > > > index 4fd54fb8810f..8c661fe89314 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > > > > @@ -341,6 +341,19 @@ struct intel_engine_guc_stats {
> > > > > >     	u64 start_gt_clk;
> > > > > >     };
> > > > > > +union intel_engine_tlb_inv_reg {
> > > > > > +	i915_reg_t	reg;
> > > > > > +	i915_mcr_reg_t	mcr_reg;
> > > > > > +};
> > > > > > +
> > > > > > +struct intel_engine_tlb_inv
> > > > > > +{
> > > > > > +	bool mcr;
> > > > > > +	union intel_engine_tlb_inv_reg reg;
> > > > > > +	u32 request;
> > > > > > +	u32 done;
> > > > > > +};
> > > > > > +
> > > > > >     struct intel_engine_cs {
> > > > > >     	struct drm_i915_private *i915;
> > > > > >     	struct intel_gt *gt;
> > > > > > @@ -372,6 +385,8 @@ struct intel_engine_cs {
> > > > > >     	u32 context_size;
> > > > > >     	u32 mmio_base;
> > > > > > +	struct intel_engine_tlb_inv tlb_inv;
> > > > > > +
> > > > > >     	/*
> > > > > >     	 * Some w/a require forcewake to be held (which prevents RC6) while
> > > > > >     	 * a particular engine is active. If so, we set fw_domain to which
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > > index 854841a731cb..9fb0ac03f51a 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > > @@ -983,36 +983,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
> > > > > >     	intel_sseu_dump(&info->sseu, p);
> > > > > >     }
> > > > > > -struct reg_and_bit {
> > > > > > -	union {
> > > > > > -		i915_reg_t reg;
> > > > > > -		i915_mcr_reg_t mcr_reg;
> > > > > > -	};
> > > > > > -	u32 bit;
> > > > > > -};
> > > > > > -
> > > > > > -static struct reg_and_bit
> > > > > > -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> > > > > > -		const i915_reg_t *regs, const unsigned int num)
> > > > > > -{
> > > > > > -	const unsigned int class = engine->class;
> > > > > > -	struct reg_and_bit rb = { };
> > > > > > -
> > > > > > -	if (drm_WARN_ON_ONCE(&engine->i915->drm,
> > > > > > -			     class >= num || !regs[class].reg))
> > > > > > -		return rb;
> > > > > > -
> > > > > > -	rb.reg = regs[class];
> > > > > > -	if (gen8 && class == VIDEO_DECODE_CLASS)
> > > > > > -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> > > > > > -	else
> > > > > > -		rb.bit = engine->instance;
> > > > > > -
> > > > > > -	rb.bit = BIT(rb.bit);
> > > > > > -
> > > > > > -	return rb;
> > > > > > -}
> > > > > > -
> > > > > >     /*
> > > > > >      * HW architecture suggest typical invalidation time at 40us,
> > > > > >      * with pessimistic cases up to 100us and a recommendation to
> > > > > > @@ -1026,14 +996,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> > > > > >      * but are now considered MCR registers.  Since they exist within a GAM range,
> > > > > >      * the primary instance of the register rolls up the status from each unit.
> > > > > >      */
> > > > > > -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> > > > > > +static int wait_for_invalidate(struct intel_engine_cs *engine)
> > > > > >     {
> > > > > > -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> > > > > > -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
> > > > > > +	if (engine->tlb_inv.mcr)
> > > > > > +		return intel_gt_mcr_wait_for_reg(engine->gt,
> > > > > > +						 engine->tlb_inv.reg.mcr_reg,
> > > > > > +						 engine->tlb_inv.done,
> > > > > > +						 0,
> > > > > >     						 TLB_INVAL_TIMEOUT_US,
> > > > > >     						 TLB_INVAL_TIMEOUT_MS);
> > > > > >     	else
> > > > > > -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> > > > > > +		return __intel_wait_for_register_fw(engine->gt->uncore,
> > > > > > +						    engine->tlb_inv.reg.reg,
> > > > > > +						    engine->tlb_inv.done,
> > > > > > +						    0,
> > > > > >     						    TLB_INVAL_TIMEOUT_US,
> > > > > >     						    TLB_INVAL_TIMEOUT_MS,
> > > > > >     						    NULL);
> > > > > > @@ -1041,61 +1017,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> > > > > >     static void mmio_invalidate_full(struct intel_gt *gt)
> > > > > >     {
> > > > > > -	static const i915_reg_t gen8_regs[] = {
> > > > > > -		[RENDER_CLASS]			= GEN8_RTCR,
> > > > > > -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
> > > > > > -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
> > > > > > -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
> > > > > > -	};
> > > > > > -	static const i915_reg_t gen12_regs[] = {
> > > > > > -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
> > > > > > -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> > > > > > -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> > > > > > -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> > > > > > -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
> > > > > > -	};
> > > > > > -	static const i915_mcr_reg_t xehp_regs[] = {
> > > > > > -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
> > > > > > -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
> > > > > > -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> > > > > > -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
> > > > > > -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
> > > > > > -	};
> > > > > >     	struct drm_i915_private *i915 = gt->i915;
> > > > > >     	struct intel_uncore *uncore = gt->uncore;
> > > > > >     	struct intel_engine_cs *engine;
> > > > > >     	intel_engine_mask_t awake, tmp;
> > > > > >     	enum intel_engine_id id;
> > > > > > -	const i915_reg_t *regs;
> > > > > > -	unsigned int num = 0;
> > > > > >     	unsigned long flags;
> > > > > > -	/*
> > > > > > -	 * New platforms should not be added with catch-all-newer (>=)
> > > > > > -	 * condition so that any later platform added triggers the below warning
> > > > > > -	 * and in turn mandates a human cross-check of whether the invalidation
> > > > > > -	 * flows have compatible semantics.
> > > > > > -	 *
> > > > > > -	 * For instance with the 11.00 -> 12.00 transition three out of five
> > > > > > -	 * respective engine registers were moved to masked type. Then after the
> > > > > > -	 * 12.00 -> 12.50 transition multi cast handling is required too.
> > > > > > -	 */
> > > > > > -
> > > > > > -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
> > > > > > -		regs = NULL;
> > > > > > -		num = ARRAY_SIZE(xehp_regs);
> > > > > > -	} else if (GRAPHICS_VER(i915) == 12) {
> > > > > > -		regs = gen12_regs;
> > > > > > -		num = ARRAY_SIZE(gen12_regs);
> > > > > > -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > > > > > -		regs = gen8_regs;
> > > > > > -		num = ARRAY_SIZE(gen8_regs);
> > > > > > -	} else if (GRAPHICS_VER(i915) < 8) {
> > > > > > -		return;
> > > > > > -	}
> > > > > > -
> > > > > > -	if (drm_WARN_ONCE(&i915->drm, !num,
> > > > > > -			  "Platform does not implement TLB invalidation!"))
> > > > > > +	if (GRAPHICS_VER(i915) < 8)
> > > > > >     		return;
> > > > > >     	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> > > > > > @@ -1105,33 +1034,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > > > > >     	awake = 0;
> > > > > >     	for_each_engine(engine, gt, id) {
> > > > > > -		struct reg_and_bit rb;
> > > > > > -
> > > > > >     		if (!intel_engine_pm_is_awake(engine))
> > > > > >     			continue;
> > > > > > -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> > > > > > -			u32 val = BIT(engine->instance);
> > > > > > -
> > > > > > -			if (engine->class == VIDEO_DECODE_CLASS ||
> > > > > > -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > > > > > -			    engine->class == COMPUTE_CLASS)
> > > > > > -				val = _MASKED_BIT_ENABLE(val);
> > > > > > +		if (engine->tlb_inv.mcr)
> > > > > >     			intel_gt_mcr_multicast_write_fw(gt,
> > > > > > -							xehp_regs[engine->class],
> > > > > > -							val);
> > > > > > -		} else {
> > > > > > -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> > > > > > -			if (!i915_mmio_reg_offset(rb.reg))
> > > > > > -				continue;
> > > > > > -
> > > > > > -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
> > > > > > -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > > > > > -			    engine->class == COMPUTE_CLASS))
> > > > > > -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
> > > > > > -
> > > > > > -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> > > > > > -		}
> > > > > > +							engine->tlb_inv.reg.mcr_reg,
> > > > > > +							engine->tlb_inv.request);
> > > > > > +		else
> > > > > > +			intel_uncore_write_fw(uncore,
> > > > > > +					      engine->tlb_inv.reg.reg,
> > > > > > +					      engine->tlb_inv.request);
> > > > > > +
> > > > > >     		awake |= engine->mask;
> > > > > >     	}
> > > > > > @@ -1150,16 +1064,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > > > > >     	intel_gt_mcr_unlock(gt, flags);
> > > > > >     	for_each_engine_masked(engine, gt, awake, tmp) {
> > > > > > -		struct reg_and_bit rb;
> > > > > > -
> > > > > > -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> > > > > > -			rb.mcr_reg = xehp_regs[engine->class];
> > > > > > -			rb.bit = BIT(engine->instance);
> > > > > > -		} else {
> > > > > > -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> > > > > > -		}
> > > > > > -
> > > > > > -		if (wait_for_invalidate(gt, rb))
> > > > > > +		if (wait_for_invalidate(engine))
> > > > > >     			drm_err_ratelimited(&gt->i915->drm,
> > > > > >     					    "%s TLB invalidation did not complete in %ums!\n",
> > > > > >     					    engine->name, TLB_INVAL_TIMEOUT_MS);
> > > > > 
> > > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
