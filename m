Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF057781DB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 21:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88AE10E5FC;
	Thu, 10 Aug 2023 19:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E016310E02F;
 Thu, 10 Aug 2023 19:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691697238; x=1723233238;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=fjG8HQbnpM4FwXahZm+1faiDhsEGRrml+wQfiFVKOHM=;
 b=eCtaEeOOyGiIzoHW/L1tIV8sRNx2YFJC3zAadsrmb8dI/+c/1ixRu4o9
 QH/hrzaigqTNe1/2yB/tDJnibd28xJPJYhVSUllnp1a4rgevOzKUsUkZS
 rHp/60/W3HTn8vVrNqg9J6isWLFXFMlX6v+6JD3xTpKARDqps0f9xzJwv
 fNdLFC1oBOcxyo7mNmdJxaRM4Si0BfPkFFe53iXgAJ+F8olank21YZvvW
 +jiaIwFk/oeUeYzd0IHGIIgwbnciWXRbEl7GsjrKCcGaR7hMPGuvNScyu
 9/5ZqRjVilxio8vGmhSm+i5ftNsQbLl8gs4jviAY99UucigBtlYrGNCRC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375222660"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="375222660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 12:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="846520242"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="846520242"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2023 12:53:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 12:53:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 12:53:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 12:53:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5Vyucur1Q3AsACoViNOJjZANKC5wXsK5ZtjLWneFMMptFbEiH503tlZDF48SIBDJpj1pqkKVwHF6ytQSVgWnFYejNEcfxOk67u/Fq7WEGFmLSxWLyOqpymn3NNUY1Kz94C8NksWpQ6nofEr2nLn9U3mtK+MaYKSY/n+ZsP56eFeyh/WvHBmxVxaJfMcdDMz8stD++wZ3Cuha1k83Nsh7pZZKrfL1oy6+i6MbvAW4tmaCzzGLJJUf7dAmJaj0WpaVwvBDN09C59J+nP6eZLF+6E31CpwcUZB9PgTUZ6mOk8AXhGE0yEANhO+++65wXGcPEGEKvf8X6qjoS5JV20GbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEoiyK+VrvLZQfMN15Uy+L1ZBYMoOfgtP7MW+8EKDCM=;
 b=BESnArzq0cEYKwDPTPE9ipuQ2L7RdjvAw9FTZHeyZGjcuRfw1ypRwBbyS5ygmRzLuHzqIPOys8t6HWfqAJ10+sHE3ycNnK7msCu4dAzOv86oz1d0ZF7nGiQMJw+Edvqanr//WzYJD5x0yhhgVJYgAxPo24+ftbl8K6+VFnnc/sKEMvPnUcGJcOYrS/gR1D3I3t0uSLzyztKM0NQVWjRct9xXJ0vjuSZmyt7A56oqLuf5Lw3bVa0d9YrW/+mgLDs39Q8ztAjrDKzyiZIDutXywybyHMRu2fzLh1yuqmUCEOFtgjBtgJFFK6aIyUTAlKWHtJEymXC2xL0PG3COO5UJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 19:53:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 19:53:49 +0000
Date: Thu, 10 Aug 2023 15:53:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZNVAR53jmvA1p6D5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ff0c3b-36d5-4291-712f-08db99db839b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYJook9XCmP7Yv9DPYt0isweCrnstH06q36402/3SUI+kXZ9WnX3kIpEwSEoz1WYH6KBxT6ksc/hcziPzBZCuG8H7GaSPlQw9waHgVtZwvet9+DVFe7eUjRz5NLD6ulEDdj6eLoAd2dn7ZjUkbH06rTAi1r1WzuowE0lZJ1M+aDqqw04WZrUgX/v8qbUwCylCVb/3adooybOmcWYSQrfNa9CZTxxDTO7QtndpyCQ+yq6k0T+1FM/KQ3YVPvvYjEZQ5QqiiRVa1LwO2J5eYMdQOMmzyDjfo+EQdOq4Lr7ej+YExHY53kBQpwbNn83rbLw2arihJ3zH1GsN5fSM8dSTkdlktBgKmmtX8Qd1kS4WVGUFOZaFGtTpoqFz/ft+bG7XZFzzVrQJyHi6Op4mmmDbapKZ2AKpvUk3W0tUZzfyDr96jolb9pjdjPC61W2gfoHedsdWV50hhNZkMBvabFWkw7hjchFFlAOHHaEjVbYs45aD0WDQp1hsbF0Z5YuHCS5OJ3xCGH53LjpHkEiknWKEKs1s05dT1ktL3XeRrFXbgSfZGQukUToF51J7M8ZULtW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(186006)(1800799006)(2906002)(41300700001)(8676002)(316002)(7416002)(44832011)(8936002)(5660300002)(36756003)(86362001)(110136005)(82960400001)(54906003)(38100700002)(478600001)(2616005)(26005)(6506007)(6486002)(6666004)(6512007)(4326008)(66556008)(66476007)(66946007)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ptt3lSViZCsr6nmDeky5QoKn3gqJk6IQgRUeJwe3qTMlshYGk59MHnteZR?=
 =?iso-8859-1?Q?btelrZNPyFF8ZTDykymB2RquTPgo33J0uad8nQ9immzwbQ+6mLALaqp0D7?=
 =?iso-8859-1?Q?FRF09JoQzej/al7DoWRl2oc/ptZRJD9WJ7aWqvDkKjgrooPDVp0PejyEAt?=
 =?iso-8859-1?Q?B8nQjlOtLKf+CLV/tQMAGBSNqBKJZUn6JN5qN556Wdm6Tc/QT9nP8jIBWu?=
 =?iso-8859-1?Q?m/zuuCE8m+Zy83seBRxUf1BeKwMcI8WoTZxKIsZJN2maKgENpJt16iKf/o?=
 =?iso-8859-1?Q?SQ50/lXU8mM6neNVcQDJZvnvSPzwbeu+fTJivTmbst/99w86MFKzz50z6Z?=
 =?iso-8859-1?Q?jg8werd9+vUmJfJxQqQ2VprqXOOCmnybToGGO/3vt9HyQZHua2RgqDfyWC?=
 =?iso-8859-1?Q?dufJYCd+ry767/lURDkby4D62jvqn3vhIE+tFX4Z2wAQ+93EG02OgYpeDG?=
 =?iso-8859-1?Q?TRuyidk0eZwGjdJO+9bBw9NX36lfDzQ0qD9DYll8L+CIjNrqUe1uI62zy6?=
 =?iso-8859-1?Q?nlTwbae6TDULm/EUsvsHJxztfkwnipl1LJEzvBqNVUhDfanVX7Jo8Ucs7C?=
 =?iso-8859-1?Q?ZWUArUvaziGq1qz+PcOVclHB6SaIs7vv6pN1kckNNJoaiwybQnfV2vESKW?=
 =?iso-8859-1?Q?WhOmpszijxPdqfeDWRsVM7PBjtHOd3ONossSjI30a0/5TRwyIGa2Y6XjFY?=
 =?iso-8859-1?Q?fraJzj9ix/mqCnTLT9TQQWku0C33gtArJvPzAYf41QoxTAReOF8n4khDPY?=
 =?iso-8859-1?Q?/CtkieL+f5A2sY8coeORuZeiqIBetD+qDxns6RMAdx5E+YvWZAmh+u/LD2?=
 =?iso-8859-1?Q?MPEKZu0b0fAow+s2bk/+L44Sbl7frsa6ePmWQ3lT1ESSiQTInt4dMdtj3o?=
 =?iso-8859-1?Q?TdZvcjGutg7BSnjZcGl+tcXxofD7FT9yf4m5qH1fGOdGG3kS2ZpdQorBzX?=
 =?iso-8859-1?Q?x3s39BHrJtf1hFEvQ57LK++10JAK/PsB4v4PrY6Qw0Hp1yYKH2e81/N/3e?=
 =?iso-8859-1?Q?eXnKcuzXz/AxLN4XxQNUH0Vp9Zi2LXuMBH/CQmOELYYvQGrVbx+VHBoJHB?=
 =?iso-8859-1?Q?s+PwefbWhor0eNLOsrVYpGDGQ4y5eo9/woH1jJcty1QFH+63i5pVIneZTw?=
 =?iso-8859-1?Q?MeMWkwg5EFvAm98dwq1cR5WfwQLEvoFYhBVNKJtTOrNYsEdf7z3qioQqvO?=
 =?iso-8859-1?Q?ltDcSoHLhJZSgD+VVn26vy0b1Um+uNufv+EQcc+gkhCfvnM9wgQ6lkIdO0?=
 =?iso-8859-1?Q?85mtF/COBLP6wLlSVtf9nZGknZ35wf03dbz3R/tAQT0gKacSekggLuknM4?=
 =?iso-8859-1?Q?SuOpUubr4vNv7d4FjQA9Eljs+RleaAsagV6nfRAWog2silwk0VHksKKtW8?=
 =?iso-8859-1?Q?/dd/37DpWOJTNWaLZw+OXwq05DqVLMvwXBD5Y7y3oA7d/SPN/xnlaYarfE?=
 =?iso-8859-1?Q?Q24B9mTqjPcQE66EKF+8/9ITHs+/yyDwA6Ag5yH3JgDsDMA84eUtPiIK1R?=
 =?iso-8859-1?Q?EdGR1J2XdCBkQ4dAuY3pd4GLl5btSBBoS7tA8VL4u1VH7hK83DTvWJeNKV?=
 =?iso-8859-1?Q?+TWgBzl+MSlmrQv55YHcXVGP1Fs4WkS9kGXZGCnCFd0ZAOqYTYbM/xKLMQ?=
 =?iso-8859-1?Q?H1woeXGDZAyo3IyO+7MvvmPzTrYaECqP1g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ff0c3b-36d5-4291-712f-08db99db839b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 19:53:49.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhRlKC4lExNFwDOf4RMbTZcAjCElQVVWQ9FDYPGNwjT0hi4XRrj1tD3EtaRSMwGrEv+C7U7fhqerHQUxCjoCmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

This is likely our latest PR from drm-intel-next towards 6.6

drm-intel-next-2023-08-10:

- Display SDVO fixes (Juha-Pekka, Jani)
- Taking Stolen handling out of FBC code (Jouni)
- Replace acronym with full platform name in defines (Dnyaneshwar, A\
nusha)
- Display IRQ cleanups (Jani)
- Initialize display version numbers (Luca)

Thanks,
Rodrigo.

The following changes since commit d9aa1da9a8cfb0387eb5703c15bd1f54421460ac:

  Merge tag 'drm-intel-gt-next-2023-08-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-07 13:49:25 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-08-10

for you to fetch changes up to 129ebb54f58562c17d30adf71d577aa9286e6ae4:

  drm/i915/irq: move all PCH irq postinstall calls to display code (2023-08-10 15:14:58 +0300)

----------------------------------------------------------------
- Display SDVO fixes (Juha-Pekka, Jani)
- Taking Stolen handling out of FBC code (Jouni)
- Replace acronym with full platform name in defines (Dnyaneshwar, A\
nusha)
- Display IRQ cleanups (Jani)
- Initialize display version numbers (Luca)

----------------------------------------------------------------
Anusha Srivatsa (1):
      drm/i915/adln: s/ADLP/ALDERLAKE_P in ADLN defines

Dnyaneshwar Bhadane (13):
      drm/i915/hsw: s/HSW/HASWELL for platform/subplatform defines
      drm/i915/bdw: s/BDW/BROADWELL for platform/subplatform defines
      drm/i915/skl: s/SKL/SKYLAKE for platform/subplatform defines
      drm/i915/kbl: s/KBL/KABYLAKE for platform/subplatform defines
      drm/i915/cfl: s/CFL/COFFEELAKE for platform/subplatform defines
      drm/i915/cml: s/CML/COMETLAKE for platform/subplatform defines
      drm/i915/rkl: s/RKL/ROCKETLAKE for platform/subplatform defines
      drm/i915/jsl: s/JSL/JASPERLAKE for platform/subplatform defines
      drm/i915/tgl: s/TGL/TIGERLAKE for platform/subplatform defines
      drm/i915/adlp: s/ADLP/ALDERLAKE_P for display and graphics step
      drm/i915/rplp: s/ADLP_RPLP/RAPTORLAKE_P for RPLP defines
      drm/i915/rplu: s/ADLP_RPLU/RAPTORLAKE_U in RPLU defines
      drm/i915/adls: s/ADLS_RPLS/RAPTORLAKE_S in platform and subplatform defines

Jani Nikula (7):
      drm/i915/sdvo: fix panel_type initialization
      drm/i915: fix display probe for IVB Q and IVB D GT2 server
      drm/i915: debug log when GMD ID indicates there's no display
      drm/i915/irq: add dedicated intel_display_irq_init()
      drm/i915/irq: add dg1_de_irq_postinstall()
      drm/i915/irq: add ilk_de_irq_postinstall()
      drm/i915/irq: move all PCH irq postinstall calls to display code

Jouni Högander (3):
      drm/i915: Move stolen memory handling into i915_gem_stolen
      drm/i915/fbc: Make FBC check stolen at use time
      drm/i915/fbc: Moved fence related code away from intel_fbc

Juha-Pekka Heikkila (1):
      drm/i915/sdvo: ignore returned broken edid on intel_sdvo_tmds_sink_detect

Luca Coelho (1):
      drm/i915/display: pre-initialize some values in probe_gmdid_display()

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

 drivers/gpu/drm/i915/display/icl_dsi.c             |  5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 14 ++--
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  7 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 10 +--
 drivers/gpu/drm/i915/display/intel_display.c       |  7 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 40 +++++++--
 .../gpu/drm/i915/display/intel_display_device.h    |  2 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |  2 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   | 84 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display_irq.h   |  7 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 29 ++++---
 drivers/gpu/drm/i915/display/intel_fbc.c           | 64 ++++++++-------
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  3 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 10 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  4 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         | 36 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         | 13 +++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  2 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 13 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                    | 94 ++++++++--------------
 drivers/gpu/drm/i915/i915_irq.c                    | 74 +----------------
 drivers/gpu/drm/i915/i915_vma.h                    |  5 ++
 drivers/gpu/drm/i915/intel_clock_gating.c          |  4 +-
 drivers/gpu/drm/i915/intel_step.c                  | 10 +--
 drivers/gpu/drm/i915/soc/intel_pch.c               | 18 +++--
 38 files changed, 339 insertions(+), 255 deletions(-)
