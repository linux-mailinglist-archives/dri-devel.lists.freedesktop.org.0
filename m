Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161059D0B70
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 10:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A07B10E45B;
	Mon, 18 Nov 2024 09:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bc/LuQzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E71A10E352;
 Mon, 18 Nov 2024 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731921163; x=1763457163;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hIRL2y00RcoRXgBwC1LRo2chkxcelOABm3f6f+PhfzE=;
 b=Bc/LuQzZyPdu9pX+zEkQo99qBYR+8b8bvmjIgCUBDCX4TYfY71+PVAeQ
 CjBQFbVsbtTqwziEE938LsyJnu8QV838rYkFE8b30pEUTrjdsjh//6zU8
 L5Wmt8ZFj5ENoYqA7HwG3+ASAO8juEXCZ3Quyi3vltJmrFb1wn4aud510
 ur8zN8LhqIMPzevmtNIdX4SolHKMLbspr5CVqPReJswE6jg1aYqqVkGmt
 VQqQORejncKwu6H3BwlSbdgaQ6OTKdtK3/U0lJGB0AwX5uKTXxA74EeK+
 RpGGbDvrc+a9zvYZPqNaboqoK+q/ho20O7g6PBzpCm095j1RkFsOlpdbs w==;
X-CSE-ConnectionGUID: yCCXUKwDQUCIUYKWjsRadg==
X-CSE-MsgGUID: dEs0iorMSZynIx0mhEvcOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32104471"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="32104471"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:12:42 -0800
X-CSE-ConnectionGUID: LOOwJR0ORX6gQ9pab7DqPw==
X-CSE-MsgGUID: L1rC/bsSQ26JoLVZllKKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="93234741"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 01:12:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 01:12:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 01:12:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 01:12:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWDba/Uz2CYxb8Femnc38SMWmzG66ZWGb/SDo5N2Tetms4F3T96J+kiXekIce1Sk02bCwHVYUMI9ZAgY1qDmqoNyPqvYFGdL792PvO86BypgjSy0iH9TefoHc7a229msGE/R0YE5g0EfA+nb7klHHVKhk71tCJOleqyCl+rx3cYkie4VrgUF8oGvYGovtt44otrGABBvbHlG8nNszFaTXIr4CU8bMYBO5TwmqgqTPfcpIw4cSr4rKdwnjh9QNZpMjXv/Xi2znXwqH5a7reeO5mRQtcAIWnbcmThc03Os6/UTLnZ9RAghtcUCs2H5Yo1+8LKdmpRpxtmnJH7b5yxG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEv5gOqODjcATQ7DwI51ue0tp5pEoLwxWa+jSRSa9yY=;
 b=rLwyV0EyrqhiTEgyT71HidDexylJiUt3xQ3CpsdyqfWSHMQaGZGu8lFyavXNeiSACcz5FucjKULw3prjGH3bv07PAMQNMuXH6E4DsVhTteGv7hw4l3dDRGaywtoaoo1ZURUyfQFWrP4438kUaI9KTb7pMvmfYKGuZ0yI1nEUh7WKvpimYDex/rIi1pR72O8oFubLHRWbPgiP8KjXZ2utQc0lhi2nFQkfUve8IxfBltS4olxong36CF79XwK6FQwpJLRZCp8CrFvNc9HfjppACEFX9Nn63xTMoyeCyzMGp4OD2dqP+6yCana1n5QlAuCaXoe9CktIidMizfSlnF92+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 09:12:38 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Mon, 18 Nov 2024
 09:12:37 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv4 4/7] drm/i915/histogram: histogram interrupt handling
Thread-Topic: [PATCHv4 4/7] drm/i915/histogram: histogram interrupt handling
Thread-Index: AQHbD14hUJxS7tFASU2orQN4iW+yrbKVi7EAgCeIa5A=
Date: Mon, 18 Nov 2024 09:12:37 +0000
Message-ID: <IA0PR11MB730762B53222E442E9F1E227BA272@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
 <20240925150754.1876893-5-arun.r.murthy@intel.com>
 <SN7PR11MB6750B77A8EB237CB0E2BF374E34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750B77A8EB237CB0E2BF374E34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ2PR11MB8515:EE_
x-ms-office365-filtering-correlation-id: b2e8fb62-71c7-496a-96b6-08dd07b125ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OCBIPE4OnuDKeg4etG65NVplVw5oDYEzqXooNSZz5OZwBbzr9I6DFfgQ/4gc?=
 =?us-ascii?Q?1SbCBIVIQQtr9C4jesRNqDUW9c0iHxqiaSxha3F5UeoMAq14wx69VhHPzj71?=
 =?us-ascii?Q?HwECqV+xAV+Fm6aeIAoXNjQ+1hB/AU9uvyHVsetN1HvsY5wuHmXk5s1M4ZX3?=
 =?us-ascii?Q?AePY/F2Ls36XatRpin/GZlHT488JMCoWHDfGaP10QbYBPVB+yJfAsUxtv3Kv?=
 =?us-ascii?Q?eUI0ns61NEm0IOtlo55TpuxjQQdXRVu1mX0vgt/P6hk+NZAi5FBWBdUEWTmb?=
 =?us-ascii?Q?alTGidDCiYD14Rwqt6EzTZZ2dOvZmzkum4+aUmh3KwLSftledMAUmlfUgTpm?=
 =?us-ascii?Q?9IdRWkEsz8gIZg6rGhtx+HhfnET3ZmYHaG/T+JA6MtAwEf2cls+DA1ig2z0q?=
 =?us-ascii?Q?/aj2ziGgzLgNt59lhaSHESNbvvfl+oCuAY4mzLzl5J/3IUhZSA2RH8VNDJ6c?=
 =?us-ascii?Q?Sd/TKs249I/Mcpv+j3469s7ojrsyNSLkQNviOu7WzRsfR0u+lT6qTDHPdnIF?=
 =?us-ascii?Q?ZOwyGOwpmtmd/OAVR3Hsjt1HNRJ5oS+vkkCgBfu4vK0Uda7NNePHXpkF1DaM?=
 =?us-ascii?Q?dZtkCp4nQyPGw29pALS2HzWc77pykre9Ki0oKPms8+HpAtBEy9DZvdA7I4lm?=
 =?us-ascii?Q?ojP4iPHKJ+lowlIy9poV4sxpD9QiUN7GM7hiUjvKdHrly2JNWbZGxYBn3tRw?=
 =?us-ascii?Q?BTs1FLUAR7ObteShbLeeSTkgllaz5n8YL3vRdYJd0DKPtBmMBMRq9FLP3FMW?=
 =?us-ascii?Q?6uovz7a0pVGbzIoUdWmZ6zy2l5UIhbVwq1H/zPIf+4ZnHCAD71eEqQEk6+Qr?=
 =?us-ascii?Q?DFPFR48CT92A0TD4+LwxCnKAAYwum6k2wNJ4eS3b3cqo53JOcLvGCn4W4/BV?=
 =?us-ascii?Q?zbGLnVOVPdhZus87PnBH8zVplOqiR/Ykolll230td0MyU3EKDrdBCSd5OWgI?=
 =?us-ascii?Q?5mAugx2tSqbQyPclrZ25fz8TsMoVpeRSwrg2XNh/SgeGjwQ3Hq9Akzweas6I?=
 =?us-ascii?Q?6HlKzMURvKa65gCFkSSsFUqREflaXDYCk0xbcXEROvFeFQKeqb2L948i48q+?=
 =?us-ascii?Q?yk5fVhMJniwn7aeMmlWlC4Y8MmXtTXuGuqmYJfTHd3lNuvkoQBUX5v5aaaas?=
 =?us-ascii?Q?0z/zxq08eqNfgNw2tPwafdod1dfQkT6nTU6gkYDzBKXM+RSENODR5fsg5v5z?=
 =?us-ascii?Q?vCJFiErmP17X/iB25xDvP5/J4N7R0Ucwo2/RsYH230UsPsVB+TMA9XA1+0go?=
 =?us-ascii?Q?wnwl6QFaGSq1ql0CoOcbvf9itW07ZRY48zZycXEyMe8f5uwEvUeRHlffKHzr?=
 =?us-ascii?Q?y/022uOrC+XflIhk9qBGlFxBNvfh72DMuTLaj+k+lpM+U5tqvqXWBGHELvXc?=
 =?us-ascii?Q?9KVNyxE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fkPOLaT5hz3RRvrD9E2D5Bvfy9PUxa5vX5x09LlVU5fPFxw6N3es2+8pHV1S?=
 =?us-ascii?Q?NYGGQuIzH6SuFLdysWp7LNixhZr5T+gmvmOVtZA8dcenSZN7fROBMUmVh5he?=
 =?us-ascii?Q?UeUwrK340EvhSRPiP32sYyIDaYOMM+gBW8uzuXLo3ACHyA60cIYoUpxm4grD?=
 =?us-ascii?Q?CigcHLx7A7Auo/8G0OjK/xT3Y9BESMh9MrFJNSs4wZpz+OVGAM8vKQNOE+cH?=
 =?us-ascii?Q?vGSSaKos9i/YQS6cKnU5eWRQLUoam8RXex82M7mcZYz/SKl1LWccQmHC6fBy?=
 =?us-ascii?Q?3/pLESmYwv1Ns1O0VkVf2Xrl8onOeBXf0hIk9T7dEegXClIL1tNn0202AC2N?=
 =?us-ascii?Q?o8gi1BHGaKdg6KLtJjo4S1ABHJSPvA8VDROZRdha+R83ZGrvTQa86t+K+o1/?=
 =?us-ascii?Q?5+cV+8K0suqWonkWS7GUOtb+qzbHhHZbd9F84FTQXb7b9RUdTlmCEECD97p9?=
 =?us-ascii?Q?hladFdapnq101hRECoCE0mbD1G6O3wOW+rXTD9xkUVurag1M9RJBYGV0cDEb?=
 =?us-ascii?Q?nG9XEJcEYZmXL1xB4UDn8kyO5xBkFNAB/EYr1d95wSzkVNz0wnfAE6H9kNKk?=
 =?us-ascii?Q?zJPB3u/ttik+2cWgiC0YL4KkG29yMAkb7MqXJK2O5e3/aQoccEK2PWwOBTUA?=
 =?us-ascii?Q?Ap9E/KHugbneSaD8Jo70mgNMGxwLanoqcL4HoSrTybitZVt2M5X1umKk5R63?=
 =?us-ascii?Q?ZcEN6rlBMeFzwYRa/RH8F2BDKiNJcxzNJpKFxjVW5Oqm8xVfk44ugJoHp410?=
 =?us-ascii?Q?AlGvOos/U7lxcFpwaVqwxHnDehEFAWXnE3YZpVi91ZOIqbm5Q6X+9W72NfhR?=
 =?us-ascii?Q?sVJExCrn25qG5ui7w13SPASWDN6Y3rOxaUCKIZAGx2IABL4RfNVTqZbF+H44?=
 =?us-ascii?Q?DpBdE6OpFgUFzKtj2LKvosC7/ODviTGkNqBQq/yqVl6LPzD2fwyfwUp1VwiC?=
 =?us-ascii?Q?APUz5RfxyicesnTekcS3xE9yv6+NzhyBGcQYLI/dvZKyVDBYfIQkCNsXKNuK?=
 =?us-ascii?Q?eVNGXm5B/YaUIfP4PnduttEPlwBBOetRncgxLPBrmQEDX3mpT4TVCY2hybOo?=
 =?us-ascii?Q?vtZl1cxyrisxEkjD3V07cmFgLlSM+I5YweiOWERnqCsJH+EduQXu27ak/f4m?=
 =?us-ascii?Q?fB02Q+/Owk6UP3LLjRS+3/qtTfTzlfRMrQb9D2JsiSCQViZ/GmYMqW3eYqXK?=
 =?us-ascii?Q?yLMqHA4118nbFGZzefCgo0fGJDFEMOkldvZ9yhRbSxER2xASYV2aHxHtwNnG?=
 =?us-ascii?Q?x2rMmu29iEFrzpFBiVeRTGOvop+LNqw6N7KV8g7Ae8CfAMCcOCfzLXlukp3p?=
 =?us-ascii?Q?IgCZZX5HD79NwhLZrznXpGUfeRykFgpBJhOGMbQoenEEIhTI36mokmJUbrRX?=
 =?us-ascii?Q?Iv27izwt30MZ2tgnO/4x9yXzyRPFSByja0gmVZEAQjfwUTz1Q11Fq7eMgTPu?=
 =?us-ascii?Q?pmpf0LE4lqrxi7/pBstrcef9tA8AdnKmetLinobLWWQXFyw1JDgnYaqo4zvu?=
 =?us-ascii?Q?RHgbVEwNg0OmVdWv5LYU/yiftFCDLgEyScoPqaOEtPOMLXlTT7hzoXzRmylh?=
 =?us-ascii?Q?vfmIUDTtqZ4mcUqX38DiOrrvzS7ZdgUWMw4t5eEE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e8fb62-71c7-496a-96b6-08dd07b125ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 09:12:37.8972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Uo2kdALpRNgHZkRMFZPGE0fvLb/M85GorkUoUc6hqzzovuLGY16oQunpbdqdo53ahgJYaG9mcDDzDxarSx+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Upon enabling histogram an interrupt is trigerred after the generation
> > of the statistics. This patch registers the histogram interrupt and
> > handles the interrupt.
> >
> > v2: Added intel_crtc backpointer to intel_histogram struct (Jani)
> >     Removed histogram_wq and instead use dev_priv->unodered_eq (Jani)
> > v3: Replaced drm_i915_private with intel_display (Suraj)
> >     Refactored the histogram read code (Jani)
> > v4: Rebased after addressing comments on patch 1
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  .../gpu/drm/i915/display/intel_display_irq.c  |  6 +-
> >  .../gpu/drm/i915/display/intel_histogram.c    | 93 +++++++++++++++++++
> >  .../gpu/drm/i915/display/intel_histogram.h    |  3 +
> >  drivers/gpu/drm/i915/i915_reg.h               |  5 +-
> >  4 files changed, 104 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c
> > b/drivers/gpu/drm/i915/display/intel_display_irq.c
> > index 6878dde85031..40514966a2ea 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> > @@ -20,6 +20,7 @@
> >  #include "intel_fdi_regs.h"
> >  #include "intel_fifo_underrun.h"
> >  #include "intel_gmbus.h"
> > +#include "intel_histogram.h"
> >  #include "intel_hotplug_irq.h"
> >  #include "intel_pipe_crc_regs.h"
> >  #include "intel_pmdemand.h"
> > @@ -1190,6 +1191,9 @@ void gen8_de_irq_handler(struct
> drm_i915_private
> > *dev_priv, u32 master_ctl)
> >  		if (iir & gen8_de_pipe_underrun_mask(dev_priv))
> >  			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
> >
> > +		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
> > +			intel_histogram_irq_handler(display, pipe);
> > +
> >  		fault_errors =3D iir & gen8_de_pipe_fault_mask(dev_priv);
> >  		if (fault_errors)
> >  			drm_err_ratelimited(&dev_priv->drm,
> > @@ -1756,7 +1760,7 @@ void gen8_de_irq_postinstall(struct
> > drm_i915_private *dev_priv)
> >  	struct intel_uncore *uncore =3D &dev_priv->uncore;
> >
> >  	u32 de_pipe_masked =3D gen8_de_pipe_fault_mask(dev_priv) |
> > -		GEN8_PIPE_CDCLK_CRC_DONE;
> > +		GEN8_PIPE_CDCLK_CRC_DONE |
> > GEN9_PIPE_HISTOGRAM_EVENT;
> >  	u32 de_pipe_enables;
> >  	u32 de_port_masked =3D gen8_de_port_aux_mask(dev_priv);
> >  	u32 de_port_enables;
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index 86439636b490..ce2a5eae2784 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -18,6 +18,8 @@
> >  #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300    // 3.0% of
> > the pipe's current pixel count.
> >  #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000   // Precision
> > factor for threshold guardband.
> >  #define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
> > +#define HISTOGRAM_BIN_READ_RETRY_COUNT 5 #define
> > +HISTOGRAM_BIN_READ_DELAY 2
> >
> >  struct intel_histogram {
> >  	struct intel_crtc *crtc;
> > @@ -27,6 +29,92 @@ struct intel_histogram {
> >  	u32 bin_data[HISTOGRAM_BIN_COUNT];
> >  };
> >
> > +static bool intel_histogram_get_data(struct intel_crtc *intel_crtc) {
> > +	struct intel_display *display =3D to_intel_display(intel_crtc);
> > +	struct intel_histogram *histogram =3D intel_crtc->histogram;
> > +	u8 index, retry_count;
> > +	u32 dpstbin;
> > +
> > +	index =3D 0;
> > +	retry_count =3D 0;
> > +
> > +	while (index < HISTOGRAM_BIN_COUNT) {
> > +		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> > +		if (!(dpstbin & DPST_BIN_BUSY)) {
> > +			histogram->bin_data[index] =3D dpstbin &
> > DPST_BIN_DATA_MASK;
> > +			index++;
> > +		} else {
> > +			/*
> > +			 * If DPST_BIN busy bit is set, then set the
> > +			 * DPST_CTL bin reg index to 0 and proceed
> > +			 * from beginning.
> > +			 */
> > +			retry_count++;
> > +			if (retry_count >
> > HISTOGRAM_BIN_READ_RETRY_COUNT) {
> > +				drm_err(display->drm, "Histogram bin read
> > failed with max retry\n");
> > +				return false;
> > +			}
> > +			/* Add a delay before retrying */
> > +			fsleep(HISTOGRAM_BIN_READ_DELAY);
>=20
> Why the delay here the bspec does not mention this it does mention waitin=
g for
> a vblank After clearing DPST_CTL Register Function Select to TC which is =
what
> we should be doing
>=20
Here we are not doing anything relating to TC or IE.
We are trying to read the histogram and upon reading the busy bit, its unde=
rstood that
hardware is still busy, hence we wait for some time and then try, rather th=
an retrying
simultaneously.

> > +			index =3D 0;
> > +			intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> > +				     DPST_CTL_BIN_REG_FUNC_SEL |
> > +				     DPST_CTL_BIN_REG_MASK, 0);
>=20
> We should probably only be doing a intel_de_write here and clearing DPST_=
CTL
> DPST_CTL_BIN_REG_FUNC_TC will only clear the required bit since that all =
the
> bspec expects of us

There are other control bits and even the DPST_ENABLE, which we don't want =
to touch.
Hence using rmw.

Thanks and Regards,
Arun R Murthy
--------------------
