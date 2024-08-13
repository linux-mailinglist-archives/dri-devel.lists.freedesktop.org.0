Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2D950B58
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D110E3B3;
	Tue, 13 Aug 2024 17:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNH8f/ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58ADF10E3B3;
 Tue, 13 Aug 2024 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723569859; x=1755105859;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=cmsPKI7OL5ObHDKpqj1GlIaoiDTznA8EqkvZCaHFeDY=;
 b=ZNH8f/ai/XPNni+Jc2R3ijgtF3yvvbKUDhT+ij6xQElukBQ02c5VNKJa
 wDh9+5XTgLq0EaULDN6cPRWY0fO83QnzK3HHjouncXCzCoA+VDysNDGdO
 kjRSOUVXU/YNTBTaWBRdHzQjpS/GpgcpOKwiTyMiF+6QY3Ath2ACIR8SG
 JfT6LFDR7Z48SkOfOFDZpQYJ3Q9vGYs0q/4iA/lRJwIGDSeMK7WhofhXN
 VRQFuO006MVwnK7tz+hwzxhlQpinKcrelDodYDea6I+Wos89EYRLqNmjA
 2Ed2UA5QEnlqRMUd9sJUg7qFJBs6wg4eHavsY5xvR4Nvm+r33/S9xA+QY A==;
X-CSE-ConnectionGUID: sKQeSSgIRsuwYqIxhI/EBw==
X-CSE-MsgGUID: Pcce3rJgS+CCk9slCyPjoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="39201432"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="39201432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 10:24:18 -0700
X-CSE-ConnectionGUID: u2ROSdR9R92DnWvtU7TMaA==
X-CSE-MsgGUID: 02JtK97bRGqqSHj6vv5EdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58701745"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 10:24:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 10:24:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 10:24:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 10:24:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/WC1HziaFWlJvr6Q0oWnxKrMTNjqu44PJvozHG5SurtGJoJcWAdWu8GkttN2KATVFri9OZIjVD0psvyJVN6r5w+T9KOlMzrY4W2Efs3iP7FX3kMcf3dUAHrnKF2h6DeLFgaV4P9HcQV/sJyxvlf6QfGj/dOq66r6e9NNKJRlyioMHi0P+X0eSI7GKCoF+VfJnP92H7fT0so0SPG7s+qxSc72PSnnUXhlQL9noYGpukGxrG4fWqShSaUlUROFn2g8Ta4nJUQwLsS6ktA1nBfyJ0TdTXbQ3nvmE4C1jwim1/TCA4fRLr4qpVO575LQz7iuprbcj/egb7+/Ytv4lEl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVtuwbqUQkEsEJ3XHt7NUjhrr5q578Kvvz3KstBxuRo=;
 b=ujEnrDsaR/+cw21vJezP//mSXJ8TKP60Fy4vSpmDBH9tYrFQJrpCKQzDF7ONd3/vjmSU64Eq8MAYvHK7QOG+CLUiTT0qVzJu0AtMFOHoVx7osHvQRD1x9StP44usVb2q+u/+cI6z7p6Dv2Oj9GlH0PdnKbcVH0n8LWPg6utnoj5L3YmJSjgWBKdu4n0iSQfCN2n3cpCZmIHutkB4fHO7cUpRHiz2ZrjTP1vKM0GT/CuPC7cE6yDJ0sl6QtksQEM9IPT3wc+56H18jfyYaahEIuM2B12HGAE59hafHdhqx5FX3O1E8NBvU2wgsbK8sIrXmfVDncVh6I0wZVKU02u5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB6934.namprd11.prod.outlook.com (2603:10b6:303:229::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 13 Aug
 2024 17:24:10 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 17:24:09 +0000
Date: Tue, 13 Aug 2024 13:24:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <ZruWsyTv3nzdArDk@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a5d3a3-f15d-49a8-fd68-08dcbbbcbe10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?INwKsxZVzy8PQXwnjqzWBATcQQ+JU+UC+gPKnFVvbdHvljKbXnhXlVU4X7?=
 =?iso-8859-1?Q?+pU5jX1N07kDGHD1KbsLCl+gSHfZMD5vMz0PZ3sf/oSM3n2XPrT7oUFdQq?=
 =?iso-8859-1?Q?IU2JJVSz8egmfPqYv0opeV0O+KksJEQT/ZLDHIiR+R6KjnrFzSfESTiLZD?=
 =?iso-8859-1?Q?vf71v2USdK1Lmj8US2hQqFGukP7/yOa1MFYhGcBsi7efIQB8Ye3Qn7DKzR?=
 =?iso-8859-1?Q?PCwadKyGlyFBkOK+w4FxE94PIP8W4JkYFN2IBKP+jbpzAonyeqLt6WQ+9D?=
 =?iso-8859-1?Q?s1u8p2SOtBQMt5cNsEaf9DKeVgZ1eHDv8bjjTrmdaXJi3fJHZu7a+HVBxT?=
 =?iso-8859-1?Q?LHnTeM8m1Dxzv5TRUTGJIB75C7AvhmxaX+Ri5a6LK4Rz+ULWw995cZmLmD?=
 =?iso-8859-1?Q?RS0ipC7retcYe+79meO7TYVqxhErHpOvInDmbJU6JXDXFpprSaesDbyVkF?=
 =?iso-8859-1?Q?5yCgFtHxqJ5KnqMdEjmdiI02NpME/rEVQ79nbVdzo30IYiZ1VaOaEYWAMd?=
 =?iso-8859-1?Q?jbZ5G6Qhg+UVce29lorsNwb75DJAu5TQc1TjhnjD5CNWrMED4+42ZQFbOt?=
 =?iso-8859-1?Q?Yo8j/5NC2xbNU4CXQ3aXKMRFeb9myYUxJiwkBB96IAzHaa0TuZcONIkuIM?=
 =?iso-8859-1?Q?HJh+UEm7JZrBWtgJnyStpO4zDtVFVmaDj9D0iibTsdxFjH8jGf4oTvDotO?=
 =?iso-8859-1?Q?nJDRYWFKdcIWh4JtMaVZLtqr/vxuMNh36R/wlEx4ANfCXn+mALWUuQ2v95?=
 =?iso-8859-1?Q?VIteaVds6EatwOX23crKifMqgnJuIoxjrfaYufgxLBtEUXlKM9VNj6oKuK?=
 =?iso-8859-1?Q?xlZ/RrkRweurHqkQXr92TdjCbvS4mLQ8j/Nj1/oDece/PjD8jBPqLP6y9w?=
 =?iso-8859-1?Q?PMQvwTehatJUJnqJti1r/PkkK142lm/6Zi9ut81R7L7aamieC2qHDSn1Fx?=
 =?iso-8859-1?Q?dUmaxXKcocTUS+H0m4rox8uhGHC2C8IUTOpBdXYOajq80mG7gkLPyQPTqU?=
 =?iso-8859-1?Q?DOZK78rId2+3gTLmx4wr0UGbgspUc1KJ1wcBMxM85c+6xNbGHf53/orGDn?=
 =?iso-8859-1?Q?fo/0nOqTS8Bzpry09XQhHTSiH2OFO47rIssgzRZCkck+e3jaB738Zf39Rc?=
 =?iso-8859-1?Q?JZH5jYgok9VeShgR3ACw/RnOngxycTsslr/yAUi6ZN6841QXojACgFAo08?=
 =?iso-8859-1?Q?eemKdbYmDN1rKyq+xvcOSdp9M1iCJh2IYyypv6xB5wJQXHx6m94fXggqCZ?=
 =?iso-8859-1?Q?LvVUHFZJeN18gwT7xSwRdBp5JzCKJ5z6tad/mClBquOjMWDGgn96Fkpp6x?=
 =?iso-8859-1?Q?gVtkan4st842iyE4cPEts519F+02VMPgV1agYWFGFXCh/rk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GS95kiQ/7Us9lrj8FvtvTzpsb56/c4mrO+K0A5XOx2ojqsrGbhXbxztiiW?=
 =?iso-8859-1?Q?KzQuXFde4miAJGZ1ML3OHySa6yZy7H3zcgakNt/0f4XhPcqN973VeTG1Ze?=
 =?iso-8859-1?Q?gZrN/QYAKxCVHIMxLmzwXgpGyhrRRECp/iBSgcthRq194669PX/+fxQiLm?=
 =?iso-8859-1?Q?eWusg5VjocoremkoV9sbuYYBIiBLrU4sweGT4Wq2orLF/Yg22ZCJZVbAS5?=
 =?iso-8859-1?Q?IdXJLMfTmCBYXCGDx9uShsV51+s4o3SZscdZQZaQ1sjr+lN3/64L6ABuKJ?=
 =?iso-8859-1?Q?3TiG/YS3SCz52HsuAbaStCJAivmD1txh6OQK8ZR4HrpDXcSdUli0fkF+9K?=
 =?iso-8859-1?Q?423wUG04WSw48Ba7TWU8LX3eNUr5GWM7qLa3AFhDKdBmOgqw9zq7B+aG0K?=
 =?iso-8859-1?Q?FxqcAawgi6/mkN8UqunMHbaduROEjefELb6B3WKyowIYJXNeixP7hYmY5U?=
 =?iso-8859-1?Q?BrOe3R61j+I3qQAdu7eH/qIXIKpCSzFwbTgUH3oVVenmKcJT/spk1uBZZ7?=
 =?iso-8859-1?Q?i8vAK7iG4IoP7LVjleBgPDF4aFV3a9LGGJgdKc+3EwNVbhXztTr5KzFjWa?=
 =?iso-8859-1?Q?g5YfpofXQp6oiCrWlHMN8RHhL3eKMmSz5vcQo5KkAOumLh30aN1ppmh9ri?=
 =?iso-8859-1?Q?Z75lIahm3IHVIMg9iD18KOlsIX8fF42S+CCY1Rw0YM9rb72LDRGxA2Hol8?=
 =?iso-8859-1?Q?DY005BdeUcVGXdUluOrIIfzU3s9gBiTxb0el0td+eVNw+9J4gzuoiBmoYi?=
 =?iso-8859-1?Q?UvbX/oHfgTp8bbzLYeYBSdmftTjDSaWqtmOaAYE/q18dhxsjJ6RwAgnXe7?=
 =?iso-8859-1?Q?MWUuljeN/Ez+M+ziaRZQhVLfgMyqVyix5cTlZZispUNgHpwUcYrvLUk8fe?=
 =?iso-8859-1?Q?+s3FTg1w3qEb04KSdnoacwi/4fykURBxhiQnWjoJwAq4MJGDJM2Rsxa8a1?=
 =?iso-8859-1?Q?jIibBGWiKXTYDeIDBy5JAlky8wnPYi8yiqzNn3zFnjGPTSzpkK0YrluDMI?=
 =?iso-8859-1?Q?tBPfT6ERk+/2CSk2266+vdiXg1Xyod4OJdr+uF/xXpcXNA/nqnt9J1NdX5?=
 =?iso-8859-1?Q?Z6EUj04bke6EM1j1qQNAOw1EA+9Tpg06K/U7qdQKGscdUmAOI/ZnHesPu/?=
 =?iso-8859-1?Q?yK2n47BzFdg4gqc+QF5oUdG3it3uTr/QhR0NMK6QtrAMn1Lkd04AaUH2tj?=
 =?iso-8859-1?Q?vtRHljAsnS5aMaDnHSa9gnfkPcZ3UNrV4Ng5qn3UfKYObZkku3K3upAEq1?=
 =?iso-8859-1?Q?jxJLDO/9A6UtvkZl5ZBqTCqBpxiK4/l2YFKrBoDVpAxHpk50L76eEQKRvD?=
 =?iso-8859-1?Q?FYYwXbPemBufgYJv9ZinSIaW+VYV1VfgX6JQTHthKqTnv/ZThARGDX4JLZ?=
 =?iso-8859-1?Q?7MVG9LiZkWpcJi3B4pgaH1pk26/C3kSP21AywFtUaK26lVO+U/RH4X+pXh?=
 =?iso-8859-1?Q?Smlp0Es+IjeEWxM4zpbo3fSkKxRCyh7ABSI6DFkhQTgaykCZVYm/aEbdbk?=
 =?iso-8859-1?Q?FtoU0DA6G6oYJzkjOi5zUS0Dh5metB5GYa6xWk4uim+WZRMCraKgP1ZUoL?=
 =?iso-8859-1?Q?+WDg9nps+x5Ms5G+bY4UlQ391SahBj3CZAcKL/FV4zk/B9CDDBYIeAY/As?=
 =?iso-8859-1?Q?vgdZaVf65kxD7ynHdCn8Nq0mWEXU6iVnR4r+SCa/uW+tbS5TTR5a8pWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a5d3a3-f15d-49a8-fd68-08dcbbbcbe10
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:24:09.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/xSg+6QkLLQv8Mf22Ps7KwqC7UHIOgYNJvjmhBHR3gU8fgmU+sjGsExJ+g+NnawiXZTaAlf5V41MJRqPTlkbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6934
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

Here goes our first drm-intel-next PR towards 6.12.

drm-intel-next-2024-08-13:
- Type-C programming fix for MTL+ (Gustavo)
 - Fix display clock workaround (Mitul)
 - Fix DP LTTPR detection (Imre)
 - Calculate vblank delay more accurately (Ville)
 - Make vrr_{enabling,disabling}() usable outside intel_display.c (Ville)
 - FBC clean-up (Ville)
 - DP link-training fixes and clean-up (Imre)
 - Make I2C terminology more inclusive (Easwar)
 - Make read-only array bw_gbps static const (Colin)
 - HDCP fixes and improvements (Suraj)
 - DP VSC SDP fixes and clean-ups (Suraj, Mitul)
 - Fix opregion leak in Xe code (Lucas)
 - Fix possible int overflow in skl_ddi_calculate_wrpll (Nikita)]
 - General display clean-ups and conversion towards intel_display (Jani)
 - On DP MST, Enable LT fallback for UHBR<->non-UHBR rates (Imre)
 - Add VRR condition for DPKGC Enablement (Suraj)
 - Use backlight power constants (Zimmermann)
 - Correct dual pps handling for MTL_PCH+ (Dnyaneshwar)
 - Dump DSC HW state (Imre)
 - Replace double blank with single blank after comma (Andi)
 - Read display register timeout on BMG (Mitul)
The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-08-13

for you to fetch changes up to db639278e6217173c21bf8bd52eff2e9a0d6919e:

  drm/i915: use pdev_to_i915() instead of pci_get_drvdata() directly (2024-08-13 11:00:24 +0300)

----------------------------------------------------------------
- Type-C programming fix for MTL+ (Gustavo)
 - Fix display clock workaround (Mitul)
 - Fix DP LTTPR detection (Imre)
 - Calculate vblank delay more accurately (Ville)
 - Make vrr_{enabling,disabling}() usable outside intel_display.c (Ville)
 - FBC clean-up (Ville)
 - DP link-training fixes and clean-up (Imre)
 - Make I2C terminology more inclusive (Easwar)
 - Make read-only array bw_gbps static const (Colin)
 - HDCP fixes and improvements (Suraj)
 - DP VSC SDP fixes and clean-ups (Suraj, Mitul)
 - Fix opregion leak in Xe code (Lucas)
 - Fix possible int overflow in skl_ddi_calculate_wrpll (Nikita)]
 - General display clean-ups and conversion towards intel_display (Jani)
 - On DP MST, Enable LT fallback for UHBR<->non-UHBR rates (Imre)
 - Add VRR condition for DPKGC Enablement (Suraj)
 - Use backlight power constants (Zimmermann)
 - Correct dual pps handling for MTL_PCH+ (Dnyaneshwar)
 - Dump DSC HW state (Imre)
 - Replace double blank with single blank after comma (Andi)
 - Read display register timeout on BMG (Mitul)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915: Replace double blank with single blank after comma

Colin Ian King (1):
      drm/i915/dp: Make read-only array bw_gbps static const

Dnyaneshwar Bhadane (1):
      drm/i915/display: correct dual pps handling for MTL_PCH+

Easwar Hariharan (1):
      drm/i915: Make I2C terminology more inclusive

Gustavo Sousa (1):
      drm/i915: Skip programming FIA link enable bits for MTL+

Imre Deak (28):
      drm/i915/dp: Reset intel_dp->link_trained before retraining the link
      drm/i915/dp: Don't switch the LTTPR mode on an active link
      drm/i915/dp: Reset cached LTTPR count if number of LTTPRs is unsupported
      drm/i915/dp: Keep cached LTTPR mode up-to-date
      drm/i915/dp: Retrain SST links via a modeset commit
      drm/i915/dp: Require a valid atomic state for SST link training
      drm/i915/dp: Don't WARN on failed link-retrain modeset
      drm/dp_mst: Factor out function to queue a topology probe work
      drm/dp_mst: Add a helper to queue a topology probe
      drm/dp_mst: Simplify the condition when to enumerate path resources
      drm/i915/ddi: For an active output call the DP encoder sync_state() only for DP
      drm/i915/dp: Initialize the link parameters during HW readout
      drm/i915/dp: Send only a single modeset-retry uevent for a commit
      drm/i915/dp: Add a separate function to reduce the link parameters
      drm/i915/dp: Add helpers to set link training mode, BW parameters
      drm/i915/dp_mst: Reduce the link parameters in BW order after LT failures
      drm/i915/dp_mst: Configure MST after the link parameters are reset
      drm/i915/dp_mst: Queue modeset-retry after a failed payload BW allocation
      drm/i915/dp_mst: Reprobe the MST topology after a link parameter change
      drm/i915/dp_mst: Ensure link parameters are up-to-date for a disabled link
      drm/i915/dp_mst: Enable LT fallback between UHBR/non-UHBR link rates
      drm/i915: Replace to_bpp_x16() with fxp_q4_from_int()
      drm/i915: Replace to_bpp_int() with fxp_q4_to_int()
      drm/i915: Replace to_bpp_int_roundup() with fxp_q4_to_int_roundup()
      drm/i915: Replace to_bpp_frac() with fxp_q4_to_frac()
      drm/i915: Replace BPP_X16_FMT()/ARGS() with FXP_Q4_FMT()/ARGS()
      drm/i915: Dump DSC state to dmesg and debugfs/i915_display_info
      drm/i915: Remove DSC register dump

Jani Nikula (11):
      drm/i915/bios: remove stale and useless comments
      drm/i915: remove unused HAS_BROKEN_CS_TLB()
      Merge drm/drm-next into drm-intel-next
      drm/i915: remove a few __i915_printk() uses
      drm/i915: remove i915_report_error()
      drm/i915: remove __i915_printk()
      drm/i915/acpi: convert to struct intel_display
      drm/i915/opregion: unify intel_encoder/intel_connector naming
      drm/i915/opregion: convert to struct intel_display
      drm/i915/bios: convert to struct intel_display
      drm/i915: use pdev_to_i915() instead of pci_get_drvdata() directly

Lucas De Marchi (1):
      drm/xe: Fix opregion leak

Mitul Golani (4):
      drm/i915/display: Cache adpative sync caps to use it later
      drm/i915/display: WA for Re-initialize dispcnlunitt1 xosc clock
      drm/i915/display/dp: Compute AS SDP when vrr is also enabled
      drm/i915/bmg: Read display register timeout

Nikita Zhandarovich (1):
      drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()

Suraj Kandpal (6):
      drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
      drm/i915/hdcp: Add encoder check in hdcp2_get_capability
      drm/xe/hdcp: Check GSC structure validity
      drm/i915/dp: Clear VSC SDP during post ddi disable routine
      drm/i915/hdcp: Fix HDCP2_STREAM_STATUS macro
      drm/i915/dpkgc: Add VRR condition for DPKGC Enablement

Thomas Zimmermann (1):
      drm/i915: Use backlight power constants

Ville Syrjälä (15):
      drm/i915: Calculate vblank delay more accurately
      drm/i915: Make vrr_{enabling,disabling}() usable outside intel_display.c
      drm/i915/fbc: Extract intel_fbc_has_fences()
      drm/i915/fbc: Convert to intel_display, mostly
      drm/i915/fbc: s/_intel_fbc_cfb_stride()/intel_fbc_plane_cfb_stride()/
      drm/i915/fbc: Extract intel_fbc_max_plane_size()
      drm/i915/fbc: Extract intel_fbc_max_surface_size()
      drm/i915/fbc: s/intel_fbc_hw_tracking_covers_screen()/intel_fbc_surface_size_ok()/
      drm/i915/fbc: Adjust g4x+ platform checks
      drm/i915/fbc: Extract _intel_fbc_cfb_stride()
      drm/i915/fbc: s/lines/height/
      drm/i915/fbc: Reoder CFB max height platform checks
      drm/i915/fbc: Extract intel_fbc_max_cfb_height()
      drm/i915/fbc: Extract _intel_fbc_cfb_size()
      drm/i915/fbc: Extract intel_fbc_cfb_cpp()

 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  55 +-
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |  14 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |  18 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c            |  16 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |  18 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |  18 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |  18 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   3 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   3 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  12 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |  17 +-
 drivers/gpu/drm/i915/display/intel_acpi.h          |  18 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |  15 +-
 drivers/gpu/drm/i915/display/intel_bios.c          | 881 +++++++++++----------
 drivers/gpu/drm/i915/display/intel_bios.h          |  28 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |   8 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   3 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |   3 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  44 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  15 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   8 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |  26 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  36 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   8 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  45 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 286 ++++---
 drivers/gpu/drm/i915/display/intel_dp.h            |   3 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  13 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 132 ++-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   6 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 100 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |   1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |  14 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           | 545 +++++++------
 drivers/gpu/drm/i915/display/intel_fbc.h           |  13 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   6 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   7 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   5 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      | 320 ++++----
 drivers/gpu/drm/i915/display/intel_opregion.h      |  62 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   3 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  33 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   3 +
 drivers/gpu/drm/i915/display/intel_tv.c            |   3 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   3 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  51 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |   4 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |   3 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  24 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   5 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |  28 +-
 drivers/gpu/drm/i915/gvt/edid.h                    |   4 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |   2 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |   2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  36 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   3 -
 drivers/gpu/drm/i915/i915_pci.c                    |   6 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   2 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |   4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |  51 +-
 drivers/gpu/drm/i915/i915_utils.h                  |  16 +-
 drivers/gpu/drm/xe/display/xe_display.c            |  20 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   8 +-
 include/drm/display/drm_dp_mst_helper.h            |   2 +
 80 files changed, 1821 insertions(+), 1410 deletions(-)
