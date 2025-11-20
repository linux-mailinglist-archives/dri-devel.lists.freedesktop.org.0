Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FFC74821
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2FD10E2A6;
	Thu, 20 Nov 2025 14:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6wO5cM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBAA10E2A4;
 Thu, 20 Nov 2025 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648274; x=1795184274;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=BcUFYTTT42pt6g/nqjlxajdQbm7qlfVUa4PRVUlrfi0=;
 b=P6wO5cM6Mv1MMXqkzunNcAOji1m1wvWrpOoupUijs5xG7qG5gowDAPWC
 I8g+aCa0Qlq/+4Msy+NLzuAYkjrW0yXs0q99NjTtKxxuDUi0C/38CnABo
 XmtCkg3QAMGee4sV4CEI3wy84aOamO7FbnaKeMF1zLFFUp04UIirGXhm4
 E6N5oXjualISsaXEXUfkpLi0D2qAArB5aYzG5h9rsc1q6LLgvTj4EH4G6
 +qLB+eHyRbhc+T9eqtx/+dJGbYYViHxPDg58k0GfhvojAsexA5w9i8s33
 veGhkDOI6HlQGFL8Hr//6obFcMExC8n2Js4AIHfeIsPJS6EHdNXzFJQvq Q==;
X-CSE-ConnectionGUID: fDvogRxJQZyKmfrcqQPkSw==
X-CSE-MsgGUID: 2yrfAKJtTx2M0xoc5PZ3XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64724846"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="64724846"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:17:53 -0800
X-CSE-ConnectionGUID: LyeKT/SeTcabrP844Wf9Ew==
X-CSE-MsgGUID: cawVjJuwSn6aJWj8CdFEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="222310631"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:17:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 06:17:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 06:17:52 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 06:17:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eExzkkJBFI/iCBgkPcm+r2byEuX4Jep84VweeXdsrWSJHcOWBof2Gh8ZbF18yw1tJ1Om70yMzeICsIiR42Ras+3SVJ18dVGeAwjIFdCTUvLTguD8xf0/rZv9yvUy+pB5gVXRpxfZHqDC49DQimoNeQnjjhIO2FlwWYSWOZC9nkjfF3+bKK27KVKnDHAoHrPb2gqd3MGVr8mFL2UVB7Mckv1c+narG2FBZL8EQsj1tacpkHXRUR7T/k9/ExxgBC8QwUibGn20aJ72WGKtc3D9+BTHTBfa40HqmIWwcHmm51FiMPNbuOYk6Ld+BwunyVksJlr5/OTEBP2vQXwPEVO+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL6qZYtkf2mN3NPXt7WWnnypeQSkKHn319wApTxfpZE=;
 b=tEFprFvutAFRXG4bSdBP2WmWT4IuWv+oXo1NBlkXvg0dcFZLqCFwgv+ihklGcJNTXrYoJzX4M4mxo8KIR8UjUcQ2pevzzAyMk3Fked0KdAERx295IHRddaT+Wpk14efOLaiPX0KUySCCBlCWMjjtAL9l+Ui0a2TQkobTgJ0d19uubBXAe7h4aE1t5aXy/7MMsbIj5Ji9YJjs6R+tZ56GP/6EB2RnBZpv8uGlkcO1b3q9JVWwhrxhnRX+xre4NoI0I/4fEWK3g0hQMcv6kNfLEiy7UIPcQJgV8ORq/gaHopxEdm/Ab9aG1BxS1YdCVmQl60e7xniuoPVlyUjtEzyskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Thu, 20 Nov
 2025 14:17:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 14:17:49 +0000
Date: Thu, 20 Nov 2025 09:17:43 -0500
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
Message-ID: <aR8jByCwjIThpnpk@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: dd580f15-a872-4bfc-58e9-08de283f9581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rxlyLsU1LWlM+JQxEd5/DOoj2VANvdz2tOeOBZ0TbrqGhIH6ZgcCtHC8Jy1v?=
 =?us-ascii?Q?lCs4wP/ixZ76tfZ0xbA4aae5G4IBYeIrL/qMAWtCUS7+SV6QAM1Q/LWac5b0?=
 =?us-ascii?Q?FBuvhoh1pCGDkD0gyq8WyFZyHasV6+Klfc8kZeDG1fmTkFtnfIzg/RcXx6Yi?=
 =?us-ascii?Q?FXA8nMKQEIs10mw/zwZosQIONIYA3JMHL+TQsvtxURajeCTGEycmbPWEKlNh?=
 =?us-ascii?Q?Gs2krZDM1zX5B6nW3SpXccdF6pqvFXVAsm1ZRtdzFA//axpI38peAEeVWGU0?=
 =?us-ascii?Q?SShaG7iLYg11k704IHg6864d6DRw8K942zHGz8Qo6uyE+0Bn1Hz6GfPMPglt?=
 =?us-ascii?Q?sPQ8+jN0vpjBvVcPHpgEiebS571FnT24hA6OCcgmNOIcHMjsNd+5pKII/4d6?=
 =?us-ascii?Q?jqiy5dEuOtcPdOR+5ZOTLpM/A15BETCKVmi1H/sIm990rs9j7FKOkcTLDoKD?=
 =?us-ascii?Q?I9H8HBIdaeS9vVR9dcylm8E8mxah0asOOkFsvEkLJ+BL6Hx/4V788vmJwmWE?=
 =?us-ascii?Q?/yREMEW5jj0ApVXel5RONkW3yovMhyh7gY+0HOsf4f9NKQHe69f5ArCnYlJS?=
 =?us-ascii?Q?02lTkEeLoOYFPbiuI9Qxtv65XL+6HDjWmnUbXVW2ie3hPtXUid5mBwq7wfqG?=
 =?us-ascii?Q?wy+feUFQmMFnNThdPM81RuWNfdrXO0ouaHYODVWRlQUdjFKFAE084b6NqDL5?=
 =?us-ascii?Q?5nY2zRJj24NIaynrgnmgDSOp1cDcfPfCAPWXxc332mAOJ3HD38i8eWp3+1b7?=
 =?us-ascii?Q?jR/8nzSoxUR7PyJYebosnrMRx5fPLOBvTHgob3O8+OdK4L4rSUmsATRGDPMY?=
 =?us-ascii?Q?Fzs+whANmb9dK7stVhfAEOCO+6tKUlm4jGOd2n44Ye9GMpPDaP1Mbl/tmrOC?=
 =?us-ascii?Q?LNkTWvxFanOBK08rusrpk4QfgJoyc9Dir2aIYKZKRQMG42WEo4iDfIwWQFrv?=
 =?us-ascii?Q?cwBrK7dvefMT6yzyYSeUFDe7JbEPcp9LRVedszRj7EqGWsuscEVfu6Y/AEqL?=
 =?us-ascii?Q?nnVky14yxjkJ2h0gMzzQvj1lEg8sXnr4gPCFEoYnGXpF+KcZ07uu1xrTt8fo?=
 =?us-ascii?Q?uptozPpuCe1hF2iuc6bZuwRWa9ZEZpRF/11DQUoAkNqGIUmuFMxyFukHIhEc?=
 =?us-ascii?Q?JdwbQJyAOgJnojiLabp+5D20VlcNWjOTEzUTjp8clfY3qnw61vjRwdOBlNhz?=
 =?us-ascii?Q?mO97bwansjL7xmyespNKGb6VPVb2m017lzNs2/Rs13RRoegdIwJb4b6nz4/2?=
 =?us-ascii?Q?+jx7qRb1hvg/lEO+lK/QKXD/0WWyUqJ1UmsC/4cOJzYHjS1SsLqbIprwQCq7?=
 =?us-ascii?Q?Y3gw9Zk9yx5SIVO8LABzsIClhRFnhJEQrwF4ggC145cOqhiAhuVR9s7a89lk?=
 =?us-ascii?Q?kQpu8o5KeQh7scds2dHMvoTJZlukeMgE+DR1aoAcAFMp2P5jKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nvftKWcCPDoiNQpzcTZhvto4l5B7x0jMSvXu0jERyLFFnG/79t7ZhJAORr+Z?=
 =?us-ascii?Q?CeYWjrs+oYBgtXDHgz2OCXLbKLZAudx+GoYC2OylpUN6PeueRpovSVrM/Pj4?=
 =?us-ascii?Q?JSFccghPof+TRxKefacjIQcdvAOKYyZw8y4JC63kNjL2rHouyHQAFYrP33PB?=
 =?us-ascii?Q?HOw+rszB4KidCXoMDBL5HTAkFFhalUzBTpsLFlNVNFqwvR9DiSZJ6I0EebCL?=
 =?us-ascii?Q?+3q63X0VKy/3kIjf02G1IrOWFafGGKddRmAJytQnl8pTYmeBojGjZHpjnssi?=
 =?us-ascii?Q?q4H/tBJcJoVJQ52BMotWyhYJ3ky8AKUWWhL9I8dKRcrNyV2U7qOAgQ2XsQBV?=
 =?us-ascii?Q?z25Sk6Gykl23n5TucyEU+rN8AlPRmstmqqto3XgBUwGRbcbsY45ibEyc64ib?=
 =?us-ascii?Q?jxOoWkd65aTza61yq8YylMsz4q0+DYwvDO+6QUva7keCfN2BlcSg3/wLc3pX?=
 =?us-ascii?Q?tw5L8tFvDXGfy/ZfmvIyfMAairjWp3TyF3sX0KoJoXgdcDn19Nq+SjKTD7jc?=
 =?us-ascii?Q?hhMusvGO/jbrQL7r7U3OlXk7znVSwQts8HY1+UEcWlrwfwZ3MlwB1d+Y8/ij?=
 =?us-ascii?Q?uaDaWikZ6D+OmlIlO0xTDExDL5ESZlr4KlHKh12Z4PudS7nLf0AAIo77jnCU?=
 =?us-ascii?Q?57RmjmXplChtLDRfT8b1pqJZ5vZteHejxyR0jMKWrthsC5wuwX6iwAw8P1tk?=
 =?us-ascii?Q?gnphps4j5Q1lRjA4XRHGYGRDoeStHGQ5NprYsv+FLZtIQ+wq3aitrP+MFKA8?=
 =?us-ascii?Q?yHu/qU5k3E/ITjei5+f1oN3oaODu/MAdVPTFVFBRAWnqcoMeUX4Z8oDv5jOt?=
 =?us-ascii?Q?ccY0eEXu820o1Wfa6+nD/cMAFzfjTBREK9Ourn2/7GsSMLrjhSjZxwzaf95U?=
 =?us-ascii?Q?z6ImYNOymYkIBYC7TLEjnI0AfXMnMCD4rO5dj+qR/du6GDgHA7jRWuri9cRk?=
 =?us-ascii?Q?jkBAlwvRi9PX5hyKPr77nW4JYeL3ZyTae8XZQCVM7d2DkbbMB80+r0pAnyIB?=
 =?us-ascii?Q?EEd/tjdidNKauE6ZLVwRV/3i2NSG1l83CYeQS5UWhBy0INL6i9v5M1fNSTum?=
 =?us-ascii?Q?clDbBtIhkPc/VQRTJuthwrCUD/HsoOCPDLS1CbzrRCrG0+a5rbcx9JnsaTuo?=
 =?us-ascii?Q?nICu7oBjP8uJSzBh3+6x3Qt3o4V2pkLloYu2ZrrXzeVG3wsXCrbDuBGOgXgH?=
 =?us-ascii?Q?N1IyLbUc/l7vg9ZYWeR1f4RfnYWLNFGIOK/Oj2T6wwW9gQWy9ZSaskn0eRpJ?=
 =?us-ascii?Q?zCrLeh1wEWBnvXDXgrvWv+UjwDrui1dqgSQs0QfKnDJfUmesDwBPQccs8Djk?=
 =?us-ascii?Q?ny4qpZcCj8JDYIbg8NrvqENgVI/GkkebsHClstg/daDo7lq0uPGO+nYaLFT2?=
 =?us-ascii?Q?mk2sBQ7IbqXAvMDAC2Tlk8ifQbmE8CL7qaRbz9mA7RZyc/fIfFFAzM8k3YxA?=
 =?us-ascii?Q?1qlhfeNokn1bneZTRi46+VpJBZtVq88Dqi6RpgxQNLrAZLOmB1Y+C0+kfJrF?=
 =?us-ascii?Q?tTjZtlFI09n9xlK+caJvs3qBBMfYavjH6D1Gqjf0c30N0b7A4HXinmwmVDd4?=
 =?us-ascii?Q?7zeUVBTrX8QEgUgnRg7aQcBvWfI05cQL6Zbn5M7B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd580f15-a872-4bfc-58e9-08de283f9581
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:17:49.2193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOcC/qoWn2l2taMqZG3zH52viFAQ98LYPTPwV6EpLg/9oIOChkHhkokia/j87V873ZVfSMchN2k+m8SyjDCafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
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

Here goes our drm-intel-fixes for this round.

Basically it is only small display fixes for Wildcat Lake and
Panther Lake.

Please notice that the patches touching the PCI IDs and platform
definition are not adding anything new, but only detangling
these 2 platforms for properly driving their display properly.

Thanks,
Rodrigo.

drm-intel-fixes-2025-11-20:
- Wildcat Lake and Panther Lake detangled for display fixes (Dnyaneshwar)
The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-11-20

for you to fetch changes up to 5474560381775bc70cc90ed2acefad48ffd6ee07:

  drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A (2025-11-18 08:48:59 -0500)

----------------------------------------------------------------
- Wildcat Lake and Panther Lake detangled for display fixes (Dnyaneshwar)

----------------------------------------------------------------
Dnyaneshwar Bhadane (4):
      drm/i915/xe3lpd: Load DMC for Xe3_LPD version 30.02
      drm/pcids: Split PTL pciids group to make wcl subplatform
      drm/i915/display: Add definition for wcl as subplatform
      drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A

 drivers/gpu/drm/i915/display/intel_cx0_phy.c        | 14 ++++++--------
 drivers/gpu/drm/i915/display/intel_display_device.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h |  4 +++-
 drivers/gpu/drm/i915/display/intel_dmc.c            | 10 +++++++---
 drivers/gpu/drm/xe/xe_pci.c                         |  1 +
 include/drm/intel/pciids.h                          |  5 ++++-
 6 files changed, 34 insertions(+), 13 deletions(-)
