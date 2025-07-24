Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7729BB10DC4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B102F10E95A;
	Thu, 24 Jul 2025 14:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXd9IWwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698F610E962;
 Thu, 24 Jul 2025 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753367856; x=1784903856;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=G+5GD9nAISRdhLg1Q/uNNRspwagHzrscl7MGDuLa944=;
 b=ZXd9IWwKTnqV/AIjRM1m55+cwy+CeqrCznauDC16MmkKnOP55Bg2oqRV
 oB8UJIZ5gN4PbNDPgODsAX5r/xrgorMwukgoysiCjEv0wp7Fbb3Hmiv6q
 8X1vx+DGdJ/ruvhVAz2Nl7EumOy8fLaxnrFIAd0i3EkNWxYovxle5+Jf7
 MLPNkNIjlLwfwTscPb8f/isOI0WfoJ4BzlGJccypMkq5R9FSWSZgw7biC
 YXDb6htecgxwZDn0b1tIVf41TSxgMS7PsnbXGZhQP5tUSB/8hAqAmdeLb
 aiFMVs0S1yuYRdW5dPXhkC1FC79eaYw0Dc8Mhw4GqxGTdELZvobttCMot A==;
X-CSE-ConnectionGUID: 5AZklgJmR/6M/OtlXuQVsQ==
X-CSE-MsgGUID: /7yPAwYZRp2YUgIqorvfPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59341473"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59341473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:37:25 -0700
X-CSE-ConnectionGUID: kVV+w806TQO1dDqsiDJm3A==
X-CSE-MsgGUID: GeQxaqOBTBWyqNVSD5e/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="161005183"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:37:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:37:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 07:37:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7cYGafqbTnq/o5f6kfi2sNJpbLY0OhIrBB775Ld+SDaa3pW8qOV8HCZp/Dcf/SeX6jIhp1yAnv8q9wGyUJ7UHiqWsineYEJSsE93aP9P0tHbpdR2j3xgUWuYUARS+IdHWyPhHqtibi4bjkRLdB0Jzob7jBOLo/EwjiN4Adczp0CQLTPi31awQznEgcFxTpG6h1A3SkirEFzErkkiLnG1cxppxtwU8YDS94kWMUK0UGalpcUbO4/RuLYVC4YRECC4HnETqVVDBr69wSPQOcWHEaDCSGwds8C/pYc5PqjLYe827pfYVtjxYJSHYloF/Q/wpUUjwojQ2pZ2Rs7aclRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vxjz4ztLG6x6eTzI/QLm7+4vzkLPiZhOWVSOaHvxY8=;
 b=XARlbD6dmPCrKrGzjXxCpnFvMvWc3fwidVq9XEOWwjQ16NVEzyLLxFDRZgo8fR6X0IYnIEAZ9UWqe72VgMTmJtekxvBf4feF/+RkZRTkMSwsZPmOVWxV+rZtCuzPXNV9Ne3GUL3BQq6ZHDeVIBOBy4el4WldPyOw6i6ZSwoAvi9IkeLbFqUocSKr4PKHaxeD9DFR7LT9T1wnQIhD7ZdMi4/uNhRnEmv+0RoAwXuUhUmqw+PB6QNrws+5jXGjQMH9lKAcnKHpcIVj/nUIUM9q66FudzF4jtLtlNodkXnpA52iyHwXxy+uZJuNLLWzeoTSLPPZZt/X5TMAVSVYJ9auGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 14:36:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:36:40 +0000
Date: Thu, 24 Jul 2025 10:36:36 -0400
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aIJE9F-PcCe35PFb@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: c71175d5-5fea-40ba-d440-08ddcabf80d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?otOv910hGfo44SzeqCAn3BoZ9qN+q1yimgRquICamg3ddYbPqYzetN8xFi?=
 =?iso-8859-1?Q?Es7+7MkdrNBpmvRBvFxwz+K2qmgi583HL2FDwB+eIrxCyA62SFWwHBAetv?=
 =?iso-8859-1?Q?05iWzZPwplmeVU+YipOoxfjDINAs7CmovZyVZRVuL0nHv7LrEAsOZJjiGE?=
 =?iso-8859-1?Q?WLBPdNr50JAZT6S+ZrgitRD60DoCsxis6SGIhb6E9e1wdYbGAf+ldGEjB9?=
 =?iso-8859-1?Q?DPswsONcCwYFSbvKErWHFwmpP116gV8TTYAAJLgYy8gnPrhak4pL/SWTVF?=
 =?iso-8859-1?Q?BFF7JDtTIbugXncmVFzw6RXahaQupK9pQVsInDbMnS4dbI6+fQPKq3anCt?=
 =?iso-8859-1?Q?nlwUFL9tXVLqP+0ysU4U0EsWJQnakEL6QDJGwQXw/E7kgZTB7Xl5jSLdKu?=
 =?iso-8859-1?Q?O/5aAwmFz2lEF/jDPFX4r8q3eD11d015tKp1eOz+iWKgRKKvJO072tbjl7?=
 =?iso-8859-1?Q?r7gWYnZQEpAxUA49gKwktX/ohKtm0vP1cSUQoCyZIq+GpRdkajpGH5qV3m?=
 =?iso-8859-1?Q?zOobX1/AY4d0eZ3BfK9+ZxXWWdD9U5rdmn5b3oZ+myR0Iyax+o7BrZiDba?=
 =?iso-8859-1?Q?svzb6BjbM60L1NJCKMi20DWOivHrdWjd08qf8HwVBc9dYgLNVB2fa1p2pQ?=
 =?iso-8859-1?Q?EGOPW8iqpgJoC3yYx7I6iyT0FlqU3SK20kBZx2VRwghHnXxr0PPPOle5RW?=
 =?iso-8859-1?Q?3zDnVFuWFdyrGLMTnQ+vyDTw8C3kIEMDkhHkbn8d8tOzTdSK3uX7VosFVi?=
 =?iso-8859-1?Q?4Py76hcAMkCyzdAypp9pLex1aNX04kXL/+itPEj7r6AhDBc416Yg8XsaCO?=
 =?iso-8859-1?Q?BE/Oe4/V5k9BoKIOvoSnJ9NpvHCgZpr4FGJ0IszLAFEcNGHpnS0ZhDIgjy?=
 =?iso-8859-1?Q?V9W2OZMXcDhB87nt5ZvpMFMUAGBlNn5UKXgh6pkvG/kAPRazXZsVL5UTcC?=
 =?iso-8859-1?Q?rML0KlN25QZUDSO0GZgHq6Q/NYdmTY4QMH5y65Xus6E0evHu09wOdKlLCV?=
 =?iso-8859-1?Q?QpnN7WZK1ToR8KL4VhaHKwW2jkUYVXoteu2GfQIEnUiGUvxyxXrVqbvAGv?=
 =?iso-8859-1?Q?0AN7leoSmhCyaXcxwBIfBuT+/lC5WhBU42TsWJJBPub2SjqaiTrNjmODeu?=
 =?iso-8859-1?Q?lHNy4qZxkHQ5dT33LRbXVpMRIamfRSj302NWaTGHJ4HufQEJYNqxigmQe5?=
 =?iso-8859-1?Q?32DqCP2jduoMRBSQEAiD6cgIi0Y17H51VXQ5OJbe12INWDDEwSnDz+j7VI?=
 =?iso-8859-1?Q?Qcv4hN3OuWBGwbeRnjILIXfQRBvOoD2qYMOg8Rv5I51ChE3YTyTWYdCkOE?=
 =?iso-8859-1?Q?H/icgsZ0bUMzIEP3uJuVI6hUBd715f5GU+fjQGx9XfxvJsNDZxG+gM/kUV?=
 =?iso-8859-1?Q?x30GlLscGQIbcEI6YC3pW2H/BfbK+1wbjHBCRvXsLiHGt6plCU3g0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zAsm7OAHUc8Ej/1qCZibPPY8Sczh2GJvMzEPgFnK+TN/+qkEaIu+Taohyd?=
 =?iso-8859-1?Q?VxLCl6yFDsYvQ3BHZmlNgOwL8yW2/r7NqkPTrnjJK2AP2WBKnxp4do5Awb?=
 =?iso-8859-1?Q?yk4RWaB04UQaIdLFSJcTHaHOSAIB+r/lYXVItHDXdxqvhFPhmYnyfbagpk?=
 =?iso-8859-1?Q?QEy+6cxM9pwnHJQpazZMlfhZZ4W2d4sWGzz9WxlLkLs5vbr3CwXanhHc9P?=
 =?iso-8859-1?Q?AeKYNP9azLRRq6GHXibI+3myOrw/TlX0RskH73N+3uv1ZbXOGTnjEeh9ZN?=
 =?iso-8859-1?Q?+HCfaT7/mR6RQ4l3Gvq/3a0apwJs8C2g6jMsRI6Mno/eH4BafHTX5UIbtE?=
 =?iso-8859-1?Q?x3V2Ad059DcmNWWrC352v6AK4Jlwq1pWf67ZRKXNinlI+KhoduLlPQ3J1k?=
 =?iso-8859-1?Q?yGVAJ0Hi4ZfFwyb8Y+1PiHh0JmRmKXDhQ5PR5cxUmhjjG2yPpo3BQ3vAMd?=
 =?iso-8859-1?Q?ArRthjbwaWuN7qLbvF4NNXY4qY5uLU+LzZKM6Hj4Wbcvn9sbc/jZaeHBGA?=
 =?iso-8859-1?Q?RnFQFlM6auPmcT7RuP2LgMpupi0sTlb2Vml4ce24BiYuimAQ1oGHUpgaO6?=
 =?iso-8859-1?Q?TQpob/ZkKcgd7aOVm113cTigjF06cBKzAhZW92r7Gakg4KHbL2//wulF39?=
 =?iso-8859-1?Q?WSTERFYb+DmuuDflFpjQ/ENerfA33z56bKOnIKUhtxkxnS+LPIIwLk6SlZ?=
 =?iso-8859-1?Q?48n7VS8WMiGZ+8abUmeA7ZzyMksoITjycN80ZHOwnxK0HdTLO0ylsUzhy6?=
 =?iso-8859-1?Q?xusuy9W4Qe/VbTSqiDTzXe1tzfSTdlfWFzSR6mkTSFxveUz1e9z/W5E3TF?=
 =?iso-8859-1?Q?5lTTfK1145uUXp9ehtcPSCVaj70THPXF9yDjz7flU2bSGRhgYIOnCNG60n?=
 =?iso-8859-1?Q?FNKZnnDRVkb1f6DrCV973E5rD9GtjBAz8jmilqW7ot8JsjUXSWMtBxAEyg?=
 =?iso-8859-1?Q?wqBq0ythx1sPiWM6Yw84bsPbZaddGc0tVy0V92ounB1cylFl+mJPaL2S7Q?=
 =?iso-8859-1?Q?AlHgLBwauUTOwQUWQXFefoqoW5Iw1dTWCwB7pxHTKfCyJRxpgkR2KW+I/Q?=
 =?iso-8859-1?Q?y+NpXcqF7EL9RmUFTX0+bUeTApIBvWI7GYmjYWDzKIxS8y51nQaIZR66By?=
 =?iso-8859-1?Q?j91yXCBF1iOVUqdr3Cg7oapg0mDAtijAShjvidEqCvRxeomQsK0k2G/RMr?=
 =?iso-8859-1?Q?8A4PkpJyyDSbP379qAPdhr+DwR076v7cN/BDLEMcxJz1e9QQYnGlYUWCsq?=
 =?iso-8859-1?Q?d6oFA4oyS7+8OLldGQYR1+yMbIuTVnyLBesErXdLbAItZW5pLddYY44Von?=
 =?iso-8859-1?Q?/b3xlvNtjqA/uUN/c5ywZmU5smFCw2eZZFtVlIUAEFrzGFZORIu4uVpKzf?=
 =?iso-8859-1?Q?sLgQyjyb9ehQwizX3Wj2o5FO2esZsUzZ78cqRL1HH4AbOmhayZyMuBmCCk?=
 =?iso-8859-1?Q?Yc8HkysCEJgqzaYToDYUdq3f8B/Qh2FHiQAzVagV4B2X3hlkyWFllBH784?=
 =?iso-8859-1?Q?u7/F4AHvAKSZtrOJJ/R+4n0cNdyyJZKExvJA8yezLHf3E3CTtLmsi6GuI7?=
 =?iso-8859-1?Q?bUOPRH4yw9vkpnwzyLF6oJ+46B0E8l/ZOMY30tGv/aeeEdXVs01iR923Ib?=
 =?iso-8859-1?Q?c2yWBjijdzSJKpg0uRZdakcy4IO0E1Zw1s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c71175d5-5fea-40ba-d440-08ddcabf80d2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 14:36:40.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xL4oQdGgDAcqdur6imIGolQitUbzyzlntz45ctJPn0/KIqL2/dVvXRhDV1cnBYdDfnWlzv3z24XIJe1vKxnvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
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

Here goes i915 fixes for this round, with only a couple of display fixes.

Thanks,
Rodrigo.

drm-intel-fixes-2025-07-24:
- Fix DP 2.7 Gbps DP_LINK_BW value on g4x (Ville)
- Fix return value on intel_atomic_commit_fence_wait (Aakash)
The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-07-24

for you to fetch changes up to fd77b2c1b6eb7c7d2087e2c2b37c671d47fd2d4f:

  drm/i915/display: Fix dma_fence_wait_timeout() return value handling (2025-07-23 09:12:22 -0400)

----------------------------------------------------------------
- Fix DP 2.7 Gbps DP_LINK_BW value on g4x (Ville)
- Fix return value on intel_atomic_commit_fence_wait (Aakash)

----------------------------------------------------------------
Aakash Deep Sarkar (1):
      drm/i915/display: Fix dma_fence_wait_timeout() return value handling

Ville Syrjälä (1):
      drm/i915/dp: Fix 2.7 Gbps DP_LINK_BW value on g4x

 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)
