Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D02615449
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 22:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134CF10E425;
	Tue,  1 Nov 2022 21:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980BD10E41F;
 Tue,  1 Nov 2022 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667338341; x=1698874341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OgsZgjjPBxtnltA5B9QB6BcWESeb32jMyEeHZ0NZF58=;
 b=UIcqW0Pz2qN8oSLWWI2lC3hpWA78pZnjWLwhPQlc6uRMMRNQlJhPK9Be
 kFQe/hf1LQSWUdLtDkJgJ7fBpUo8uk89YmOpbQrJfmFPC/3xk94iNyofU
 aTiSxaPGwfvfKnnX4ZyX8HhSUz0z7f0F0ogbOE05/jlnu6CLXb9aU0svb
 PnDCCI+zc7I15a7tYgbXhqX8G5yEWU+wfCicINmqZ35MxLsM26BElA8p7
 WiSVT/5zQ7VYvFBE0jpN+5t+vmrZ8T5sqNe3M3BjXgAMTYoOhuwGM1yqx
 Ev7mab0zIxRd4rHr88JNXYIceB7D7kbvMqE0afhQz7Acj1bRHBPFtpPdh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="371333754"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="371333754"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 14:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="636541304"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="636541304"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2022 14:32:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 14:32:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 14:32:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 14:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2bEQFZDq5EowBWHtx5I/MRS1MGsMqSm9GH671Lh4fajrrihqIhK7YfcCcPGJ+M+RN+5yk0gdn+n3LX2iepPhtR0Rqu9l022QsKU3TxI3HdWzZcCko5dkq18RpCAUnLIEZQlyHilQLT9VYCu8oAdxMGG4Z5oPtAKhVP7CILQQdS73fUz/tJe/b5SzaWoWZxSvN55vtDNKUMyMzVKuR/8QC1cls6P5n4zsQrABcYeEOWoZwvXtmE2TBr3hIzZBfZxXSmyFQBzP/1y/Q+A0/W+Zekn2oHnT4T5HtC/w5VRLE4MpHofEMBsXWelWKKCwHyFo6w/mVJ1uoAr0ngT75o3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkcuQnj48RSUGreh+5/+JEkx0U/wSGZgVhv31q+VFBg=;
 b=mHkTTWvZgCaZztQLvAJpRxy8AW25ZwJsB5buESZCUOp0N0R3ug8rptg1+wRSwG9psNsEBs1YzmINtQpUEDB6GI9YPSFRjWwOHkMCQCz8A1DqNyhxa2tnMvwhKhLP1PuvxsdgGaTDAUgWrHnVjN+CVSe8hG2Ibe5VpO+hs+7YCTXp2gYN12hMxBV4pzrLHwNjCMJ/+Qh9nS6M6raxvRTw5Ui710xFxMz0arj86D22ni24bqRjafZiXGCQm4CzkQsmWmchamTHCnpwnh7SUZbOKcHYsbf2ZsWqzkJ78vbS67WuaBP+hLqXOAI3G5ivClOgigpwf3gubDGf3LmZRXbYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 21:32:14 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5%5]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 21:32:13 +0000
Date: Tue, 1 Nov 2022 14:32:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Wayne Boyer <wayne.boyer@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: Introduce Wa_18017747507
Message-ID: <Y2GQWxC5Ob+nC4PI@mdroper-desk1.amr.corp.intel.com>
References: <20221031131509.3411195-1-wayne.boyer@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221031131509.3411195-1-wayne.boyer@intel.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|BL1PR11MB5384:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc97e89-db3e-48e0-8ffd-08dabc508aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEHi/GDFcxLGkfTICf3g7vhN9+PnSWMz1TxDwuMpByDCegSMaPPyDEWt8DZoDTJw+pQcTYGMQ2iUDCWjdsS5CQsU1Z399x4zgbGTF4T0v37ETJmu4XNBlINoDXZqBSuTd6FmI1q7Zombpg8H0rB/Lc6g6p/GTeh+Vlx/SfNi4n9RMkj0S0dCkwIURyNyVD1tEFej9aeq5quWnKpkgPWjgx3N+04fvKuL8IVFWAJouk2yEg1uONyredvCMholhRG0BqwXrANyeDVUlrvXHH/h63/DrD2auXSbNpqqEvj2t9W9L7AM9vw7sEvH42aU+6I4s4es5xhiKLImj88amWzUTLis3I+91zq5b6AasP5AwKyo0kgiRXoDXN3xtyICbLS9kke8hrdjpbAPun2I89ferKq9oJMAevSkLDk02g6P7IHaKCSbGIwtNwc2RCjkirhQmV8FpUeABDLnKq7ez6fPvfpFEu1xRqmjrMeRW3hfqDg8k+X/8EIAtcnL6T4yZnaq844rxTPaPA3ghMOJRyvg9HEHEFgXWmxjcWbLDLb6STOuQxlfZV3wsxjr/RQr2HpaoagksUTSqIt3OmWUvjxxg/yOOsYNDXy/tVhsnE8HukzM5kVEVG5carnJkrlvIJeJMXjws8z2Gk7dRaAn/4ME5gE4qPGIs1u0g/FlRAFD073gR0o/sMVQYGgGFRWL/MCSBGYSehfQeLX92IAN+QbkShjMAV1E1z+H3Wpjwn/7WLHfjZAcorRaRNLBcg1nrgLq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(5660300002)(66556008)(66476007)(66946007)(6862004)(4326008)(450100002)(8676002)(41300700001)(8936002)(2906002)(316002)(6636002)(38100700002)(86362001)(82960400001)(6486002)(478600001)(6506007)(6512007)(26005)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzBNHmUdz+IHbD+dDtt1qht/Wxe3vDLoS2kQUA4SNWDz9m/2OueLXbPmJIpT?=
 =?us-ascii?Q?WBaZQDjFaFnk+gnUcBecQ6i0QV8lhT9Hyovtr+uYaLzZwWFMQ5kuoNo3ceQj?=
 =?us-ascii?Q?3fekbiJw+TT7knDdxkVUmHeCRKB7iUQOf4HJwNxW/iBCwwcSTYz5CgHZ7YzV?=
 =?us-ascii?Q?xQPgCu2xMLWhquS/yXHiIZzIpIumZEK+F/vSGLHpbbXEZRNXMinOMo2JLIcv?=
 =?us-ascii?Q?x8GBGpQss9hH2W88tkuAj8jzcHeFa9qEMcSyeTQa1PiYRL/xFdl5FYeBodhU?=
 =?us-ascii?Q?/0uhC6JTQfJ3lPEfdySPnWpu6bhmfc2eTCxJ2wD26KVgW+YTg85lFJmqydJr?=
 =?us-ascii?Q?Jf5feAyzSEInptrvnnr9nyU8k/Gmb/x57iMpjngs1+k6irnXNJy9cpRfInFq?=
 =?us-ascii?Q?JI2Rg85aZxBaYG93PV3AK4/koDCB4tIn5+730Fg7PVG4Y2RzZ+b7nfdobko3?=
 =?us-ascii?Q?KgRfFzOF563OVM6Lma2p9VlF/3eDcW4Q1aKFrkKBd4vXFRMDBv/vAw0YWKXp?=
 =?us-ascii?Q?nGe9IDpxMs7zdCsIvaJa9bHA+jDBizzTWLG0U/fDBJZk3HzM2VWS/zxExDQE?=
 =?us-ascii?Q?KzI9WiiqRtOtKU9R3GN/NK7kOXgIVm8RaVxyRK0KO14MDeErS+CZdlRrY0N4?=
 =?us-ascii?Q?WqzgJVZ5EZmqD1Qp1lIqxWgEozcI6/TqchFAoOCjnAewKkuffmDusYEZ4RZl?=
 =?us-ascii?Q?A3i/tetAPGbkViZtpL6dBN2+F0Jou5sUoXKLee+LcKCas7c7VYjHXKDgROK6?=
 =?us-ascii?Q?hk00SxjaANXQ5S2paJe44eHpHLcM0MjCHMyS9lwJ4vvh5m3NfFVI5owAqB2r?=
 =?us-ascii?Q?wKohTnd/CQTsW0q45HbIg3EcVw7EoVk1v9FNchLtm5KRF8HBr31X51MDReeV?=
 =?us-ascii?Q?T4jvyUWxYGfZX+i8/2GiCjtxqt8M+I9PRnlUwoOTCkhHYjTw4+IgIosDofyn?=
 =?us-ascii?Q?EIrAra1WcxEI3RqKXPt3J11KSkieEjMdnOk5mZWZQTUhAsddZcvKnTq4zdD6?=
 =?us-ascii?Q?ozVqDypUv6ui12INNTIZZraTXRRQiVnbeCvi/yLRtmuollLlig2ObXMLMnfh?=
 =?us-ascii?Q?MM/3ikgJqyFBvRbpt+t6Wg2n37nIOYtunazSkT47kqE3vcRXZgpz2nEDOHjT?=
 =?us-ascii?Q?ctKR0427gwWHlc8lwxjC8Jy4hpNqkXlPv3CjQQad3HTQtQM3h38enFSsnY6M?=
 =?us-ascii?Q?wcltAAFuta/4Us72ZYTyGDjehczjyPo1mZ8xUqheKks4ikTl1DFhr0VvXcE4?=
 =?us-ascii?Q?pWCjSf4WygSxsSG7O/hyaqUoBUqgjm/Obi9xI7q0QoKLCZxP76CDy/npx0nt?=
 =?us-ascii?Q?WgTlmei4P2AaKVto0DeHH4uiGCjgavY+kUM2/dfBEyYltmFSM7g4BZ6fDe3U?=
 =?us-ascii?Q?bV/DLNzhXuZeUWcQlfqogydZTEpBd9tuAIz6jlLNWfrks+esyBWhEKt7QgTK?=
 =?us-ascii?Q?TyCVgFxjwh/xHiRLF8I8LXHCY2/OdUTXeSZ2r41lvtUBJ/784fchLRg7abqa?=
 =?us-ascii?Q?TozhCG6OsfaDAA4rryeNbZAYVj82ZxpYdHf1Y4v1GX3bODM2lzAxt/sJp41N?=
 =?us-ascii?Q?E8PL5eUkxssv9urIur9PoM5e/ZJY5n5TxUORcR89oHgENGXpok/OW8q8C3rb?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc97e89-db3e-48e0-8ffd-08dabc508aa9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 21:32:13.8776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lfqx24D2h4Ycc+wgZ00PCYjkXyYEC/zySPpg2sLM8WkApg2m/PT3wS+KogOjJxUG8XB4Nv3125w0X86zzc4UStImgOv5wX59mT1zy5HIdag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5384
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 06:15:09AM -0700, Wayne Boyer wrote:
> WA 18017747507 applies to all DG2 skus.
> 
> BSpec: 56035, 46121, 68173
> 
> Signed-off-by: Wayne Boyer <wayne.boyer@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 3 +++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index f4624262dc81..27b2641e1a53 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -501,6 +501,9 @@
>  #define VF_PREEMPTION				_MMIO(0x83a4)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>  
> +#define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
> +#define  POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)

We need one more space here between 'define' and the register name for
consistency with the rest of the file.  But I can fix that up while
applying.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Applied to drm-intel-gt-next.  Thanks for the patch.


Matt

> +
>  #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
>  
>  #define XEHP_SQCM				MCR_REG(0x8724)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 2a35e7e66625..3cdf5c24dbc5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2975,6 +2975,9 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		 * Wa_22015475538:dg2
>  		 */
>  		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
> +
> +		/* Wa_18017747507:dg2 */
> +		wa_masked_en(wal, VFG_PREEMPTION_CHICKEN, POLYGON_TRIFAN_LINELOOP_DISABLE);
>  	}
>  }
>  
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
