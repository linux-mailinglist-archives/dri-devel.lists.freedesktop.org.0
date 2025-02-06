Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B337A2AA55
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177BF10E848;
	Thu,  6 Feb 2025 13:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/IHlzio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4344C10E849;
 Thu,  6 Feb 2025 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738849718; x=1770385718;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UFMa7ey8m0EHhJrBS1JAET5/8WkxQAH5rVn5bCk49VQ=;
 b=Y/IHlzioAjl/mu/GefsejdO+mxlow/bl1W4HvGaw0Hn74XGGHJpuW2v9
 hk69x0JLMgq9ih6ZafS4slcXHRDCHcxROGwx+xw400v9kSBm4mVqCsV+0
 BE/TxYpdQ9cRshwvrpE96QflBsH+tC81zXnF0l15QsDo/VXSA5rCJTN37
 QWGqdqo2ecNdps1pcG5gyQsX8m5ODDCVJzPKdvpqaCrjNSfWi/YB5L385
 Yc7GdE12yZ4Mxm3RJi4LXpGnn2hRiosniAt0n3S+2Sh+PvzV6WZQ19i+B
 0efiLClz+UY0TMNo999PA20RVKZhHxHyt3Neu5EtMz/X/cjTL3ka+vD6w w==;
X-CSE-ConnectionGUID: wBdUkMx7RMCTgWQzwYzTOw==
X-CSE-MsgGUID: QcRaQcphSkGG8+RWbzCfHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50089969"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="50089969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:48:37 -0800
X-CSE-ConnectionGUID: WzZ4FnkUQJ6aXfIm8RUPBA==
X-CSE-MsgGUID: OAVLUB+XSoG5dVa7PLfCuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116403686"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 05:48:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 05:48:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 05:48:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 05:48:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmHfcZmHE2pdlAtUQBXHF6fcqG3XiSSqGMLtl17PNUlw6qnRpJXYgpMnGCf19NLCSBOuvMUuUhRcFvOhk3lIq3XffBBX3P3wY1z4nC2z11TI4Acil+YUFW+Dsi4DQxyl9TsIfbaGhhdlpCY2diErmuifWz39xABuEWwhO9os08ai8q3/DKYb7STeiBtsqNif20zwCb+8IamYmCusYbDwOjK5FeFxdFKVcfetSt+/FxrH/zqInPQOXyuQ+uq/G4JoPTZkqmq3yewcENfkK4lbwWIVndD0LKZLQLqKoL4MFlyAxQhtb1UAUglTQzx0kujaEkhJPc9KDFnfpuEfL6dr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18Et8Z2ZFt11gZ1rZCYvp5ny1NTdPmVnC3mhBCHpkcU=;
 b=CkwoR++EPMLhNPz4/WFZ08YcXsAJKP+bvEWmLRLCIM0mj48r2gbJb3U6cSk2AVPYcSVEurXjfSK2RF+jzgsjv0BSWNg1CjqoO0/KEf0iZO6OlYt5FWVTAFdiZYH0LbfW3F6CbDDG09iNmr9hwFiJ538ypp1vFGyYsoaKsDMQzBkVGD0y50Kc/8YRHxZMDqDydqbgxD2eHIvPOoXWMh1Eo18EaU8/by2437/gKrFvaa814Djtm6Dvw1NZQUT82YFdBVdzTMw/eUDaRxaAT8kBX47S8VVlPYS/+zIT2R5Vphk68thw8340IOciawt2YIH1U8n/PzBuHwiXKYatNLbHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by BY1PR11MB8032.namprd11.prod.outlook.com (2603:10b6:a03:524::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 13:48:34 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 13:48:34 +0000
Date: Thu, 6 Feb 2025 08:48:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <Z6S9rI1ScT_5Aw6_@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::35) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|BY1PR11MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: d10e572b-67a0-4de6-c63b-08dd46b4f2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LfAYfTnhyuJJtMsteMBgbvpgNpyhnVP3mE5rW4G6XZk1O1XLSqXqSU6L9uKF?=
 =?us-ascii?Q?0tXRqOZBl2IRuImmDYEEjyFEiBnQyZudubG8bWu+9oJg1okOxvphPsJ9sAHq?=
 =?us-ascii?Q?eQsEG5d+0W7YDGXCMNV1jMnVBJSQWQxiq9/Gw2e4JT3yWSR4m5TT6Qs04Ldl?=
 =?us-ascii?Q?+fJSQThLU+/27rtKOa+Cjr19LKdFO1To6SDGTkPS+vlEJk/o/sfRv4VDI67a?=
 =?us-ascii?Q?Va/ijGHCwmD2+Vusacoi+OJgtP6qYYhPKsp1RgX9xMRpINEiHOecTq+EOGj1?=
 =?us-ascii?Q?KPJMwqSWaNo6el95Hq38zBciuBsvYv0uFUev3ghq6B5oe+BsLCsm3fZpAi+s?=
 =?us-ascii?Q?FkR2n8Lm+xdckRIWwYcrOl5PC5INrfjFqm4Z7SC+HMB/b3ckQcfh7gWpul/K?=
 =?us-ascii?Q?WXCup5I1n5WD6FlWTdv6Uuc0ma8TcAo+MAnYfke20nDG524hpxgPqAP/989c?=
 =?us-ascii?Q?aYRZwxMGaZqXdVv3/Kn41DsEATrOwaMYGARmpQBBQOm9OgQM2Og+wkXLsl9X?=
 =?us-ascii?Q?AMEimMONvLUD1vZMLXwC1nkbE+p9spHqCwPnIaGVRybK6/tpkrtRlwZsuwYX?=
 =?us-ascii?Q?IX62oQacXLz2sHXfuDJR1B/kLVcSbHFdBNfopFr5LNrNio7bHda3BFedxjD1?=
 =?us-ascii?Q?7VsEANGQcy1e2HhFdfyixUHPmfqiNn/CF1OV4fjZ2wmbbDcbYdXGIr/8+hWR?=
 =?us-ascii?Q?xAabPXhtEN/iVCXH6b/LxMIMyU20JiocOjur/8M/jPhMjCViWBFWjXJ2I91f?=
 =?us-ascii?Q?INw6Lklnq/EydVTtxI0r9+BOOGCVL4OdggT8ArQGNcYU8xSKufYVB/LEnyB/?=
 =?us-ascii?Q?StBuvWe+8B7Cf16hKgcPqtcDWlweQQc+ovvSrvz0bQ5K8GKV2CnWaAITb4dQ?=
 =?us-ascii?Q?cUdm+5ICx01qSHlvi2kXJj7RFWuMU9aGNl9ANsBzT0x9bAw2vrwldIdF8qYA?=
 =?us-ascii?Q?y1utZhFqWEr5LDHyNz0KTuYmd9gEXB5nQij0Jr5duBVNYcMCL/sBByrUBjV0?=
 =?us-ascii?Q?1Ly+ofmQahjJGReV0TKuAleZo3YJpHVWxKF/QWw8x0zaK6ht+nlUqHc6wOVP?=
 =?us-ascii?Q?gjdtl0EyDYLjAThqth+p5pnl638fBKh7sBDt2m9rfnkmiGzorX/V2hyBfeGB?=
 =?us-ascii?Q?um46Rln+Fx5qS1/+lNzg8mL13bl780raKs2fwH/WFo9Kz6Y1b1jpe4oj8IkC?=
 =?us-ascii?Q?y/7NuL+O6jgrmo5KKuR2Rq1d9NKF1LoiY/WtK+lizAek7wuPL4vouZEhTtsc?=
 =?us-ascii?Q?dCFX+uiq1nyRj+mdh0R5L/vSYf9mstFOqjFFJ+qWePoZ4gD9P3dEthUXEDU8?=
 =?us-ascii?Q?XaRSv8RdSJFTHXKtT59OKMya?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WvjbJjBt8WnYD+gGtA85qnwqQYI9CifOV7BgOKt+JNkyplWQkK06kZrepmT6?=
 =?us-ascii?Q?vDAfJx5NPWjPBSMx4b0ygsOyvrNlns0ZMNlv0h0bFCizT8AqfchzckORJm16?=
 =?us-ascii?Q?gxaB8VzVYEodTBMsnUjypis7iNO7WUvi1Ov0lLcH+/7jyuZ/zcMdsv+YbXL5?=
 =?us-ascii?Q?Mu/5WO/LbXcfzoq7Glpwb/+e7Q5WMV3H8JfuMI4dETtzFc7NofcDBC+5V6Gu?=
 =?us-ascii?Q?Lw7ZoNljYPe+VTjsrZlK9h3n+7H3WTuvJU4FYX5cExisEwgkWJVpe3aXH8Q8?=
 =?us-ascii?Q?qcXZU/+o5L26iA3tAVC8Q1dYpj6zn3n21KXpzUTBmrcmhIl7GgJwKF3VLa17?=
 =?us-ascii?Q?6rzd/8koYOUlYPhbeG8Ht7fs6RapU1olxlG1qypF1/DZj/xNpjiUaD1ryEfC?=
 =?us-ascii?Q?q/Weudom3dT8HVfoOIeRf8zklXbwKy5MyYXGqy0QwduzVCIFTUUxd2dLY/4w?=
 =?us-ascii?Q?I83HWPPuGDD8qXKG9ddtZVlj1QTuBOwcl0rg/qs9EHpvIUSFc9L6CaL+qIo3?=
 =?us-ascii?Q?4O/NBj+uGG6hfQdsAjZh2iF9MZOqoUeO2IxIcjl3SDjCIMo3ErIEimoB4PRN?=
 =?us-ascii?Q?eS9jw5u/g0SfeOrOYu5emqfyF/LdoQ7BZXAVzIiyxScWtVz/17+1v3n8RG+R?=
 =?us-ascii?Q?Ky97nVJhhUhFrIcKeWjV8iaioCqaAWCasTA/vAYRuAw6CIy4F5Yk35Bx9MXb?=
 =?us-ascii?Q?BYGA74Z27SbHZDWQO8fHF6At2uLPKxyA6rd3mbSQ2LCKBED5PiRUaBXIP964?=
 =?us-ascii?Q?66RjEflhmfa7c9KPjHbXTLjrq7UR0FqIyVcP52XqAALI7cAxq224eIY6FYeb?=
 =?us-ascii?Q?CEkbUOPMZfsxxZoePqNf1Oiebach14cxXpAl1Swc8eXu7rybpjRjv1eCQ4XH?=
 =?us-ascii?Q?twDCQHS9TCZLOn2WAhxV5Sxj/ZoR25OTV+OL+01C5u0Ttolit++0KtBpMEJ/?=
 =?us-ascii?Q?M2mbksoGKgowJAMYNitIwW7UD92/AUF7UlO2FjeA9Gu2YWEA9q9wUvq1tsZs?=
 =?us-ascii?Q?fvCXjv/gFDIMbmp4bBpzdU0Rc9alt8Qu+BrJWunFQyW94c6gLxqkQm6FhEpl?=
 =?us-ascii?Q?VNITmM7VrP1XXHQta9N3LRN1ERxgRZHAUHbtJnM/KrqUQ4fMroLxiJwz0sd2?=
 =?us-ascii?Q?g+0ic19RCwe41osoZqBcXtr+B2OkX6wiOwg+Fbd7uPFkrsCqGhwAzV5grd9d?=
 =?us-ascii?Q?REkWFKHXzLO1JTMXdnwVaLSLWvsh5ZY6QrGEJqqNw/OY/K8ltXPNEqQxJH0V?=
 =?us-ascii?Q?Oxsus4OqB7Z9nfvGarMHFAlORYE8ECBAhJTgycGGcHg0+WynADlc+nR2i0Oz?=
 =?us-ascii?Q?wQaFnPz6Xna8ttbIsU0VRAy+pDy1sRNkXCivRSZ0bT8OJxPtJRJFqKqXdHzZ?=
 =?us-ascii?Q?jzTXsQweXqgIisOmnM8xaU0Q0k94UDYOChBGIq/tOYmIiUvnukRPDQhS+o2d?=
 =?us-ascii?Q?s+UDmdYDN2L1q/dzc55tQP6FWrLjWIIjRiNmgR+ozWptlq7qInE7iGp5Lx/4?=
 =?us-ascii?Q?sw/vhM5T0EO7ieF6V28C1tiX/VHFVoihpk1m1QxwroqRoratBitWCvgR44gn?=
 =?us-ascii?Q?nTuIgSmuYqMGW2vLogsllcan8Xb4oPf5w6Fh31sSwcERQP+/ancCRtQaaby3?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d10e572b-67a0-4de6-c63b-08dd46b4f2c2
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 13:48:33.9694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SzkRbI2vBNct9idQhB3ywK5llsxhfzgUPDE/DH+N+hfchGe54wHDw0E6rolfwZvGs5oYlJS3OhBiopm/Z19iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8032
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

Hi Dave and Sima,

Here goes our first Xe related fixes towards 6.14.

Thanks,
Rodrigo.

drm-xe-fixes-2025-02-06:
UAPI Changes:
 - OA uAPI related fixes (Ashutosh)

Driver Changes:
 - Fix SRIOV migration initialization (Michal)
 - Restore devcoredump to a sane state (Lucas)
The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-02-06

for you to fetch changes up to a9ab6591b45258b79af1cb66112fd9f83c8855da:

  drm/xe: Fix and re-enable xe_print_blob_ascii85() (2025-02-03 12:56:52 -0500)

----------------------------------------------------------------
UAPI Changes:
 - OA uAPI related fixes (Ashutosh)

Driver Changes:
 - Fix SRIOV migration initialization (Michal)
 - Restore devcoredump to a sane state (Lucas)

----------------------------------------------------------------
Ashutosh Dixit (2):
      drm/xe/oa: Preserve oa_ctrl unused bits
      drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked

Lucas De Marchi (2):
      drm/xe/devcoredump: Move exec queue snapshot to Contexts section
      drm/xe: Fix and re-enable xe_print_blob_ascii85()

Michal Wajdeczko (1):
      drm/xe/pf: Fix migration initialization

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_devcoredump.c  | 42 +++++++++++++-----------------------
 drivers/gpu/drm/xe/xe_devcoredump.h  |  2 +-
 drivers/gpu/drm/xe/xe_gt.c           |  4 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c  | 14 +++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h  |  6 ++++++
 drivers/gpu/drm/xe/xe_guc_ct.c       |  3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c      |  4 +++-
 drivers/gpu/drm/xe/xe_oa.c           | 21 +++++++++++-------
 9 files changed, 62 insertions(+), 40 deletions(-)
