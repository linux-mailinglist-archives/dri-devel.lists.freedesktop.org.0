Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23DB09022
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 17:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633FF10E2FA;
	Thu, 17 Jul 2025 15:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFz7by6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EC710E2FA;
 Thu, 17 Jul 2025 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752764614; x=1784300614;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s3ALS1UeCSxHyv7nx3ta8PEM0q1dDkbgmLIe9T84kAE=;
 b=GFz7by6uEfm/UWUYIrQa79lfdpEoB+h/CRdSQPHY/txMq5sOZBbUrOIp
 UEOB4omKg7wk/b9Nl27wm7qQQrn/gqYuQpeE3CCcx1bd05YY7v1++fBkp
 AVuw72AtQRg49nu8PCHQmNc9nxmvYJy20OHWLiELTJ+aBC6vy39iZArCr
 TgFI+Sp7x9xPoKFTnlfIWEwo/ocTJeB4OgTD4cjuUv5i5qUmLhc4A1EZ4
 CkrcCnp8GyEAV1bvTocpsybMgWk9rnTt/gPqccI4au5yqILXelCpiJCXz
 DZhCKwwSl1SShTQFpcWV8yzCyqSGaGCcZlmTt82Qq59UvOBgAw3NLVB4t g==;
X-CSE-ConnectionGUID: 0aV9+jZLSheZHC7ve1F6JQ==
X-CSE-MsgGUID: 0dT2ytLOQ+CQcU1nBJU3ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65302417"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="65302417"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 08:03:07 -0700
X-CSE-ConnectionGUID: PRjMSLYBS9y1+1m7T2XPuA==
X-CSE-MsgGUID: tP3v9EarS6mwc0GTLif4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="157891396"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 08:03:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 08:03:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 08:03:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 08:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHJthC4hasaYsieY88rpyEnO088x220++SMO0GF1V8atcgZFMNisKdRVTpfBMQoNcwg/tCG7X7lUDSYleIRhcX2pY3eoFichCfk+W/qMq2oE6PalNOXsOFkTfpgnwBC6Y49zeeSvjeoiABRaJNB82oKyXRUdWoVbLseGpJ/UNQMv3q7nEIJ/7ROnRoDkOrMciSxlnih0LqigE82ijac9nlEaIfFASC203rx+BguhPp5gvI6hUULfNCOO4MoAMfhR/3mTiVdoxFpA404SP9GI5qQF3wXCPWwb/yPr5Wj6bDaSSij1vkbSlUZnoixi/YkjwVvhGIRGjRShDP4y+VJBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bibdvedQph7Q/g2MXxvYUIvmgdpdmJW7wD8pkGC6DCo=;
 b=lQzUjnv9tXpEsLiaEtt4bSmid2p/I6zsZ2eo6hCdml1ZVqjeffSwWOyJ8QM8QJLQlSCZhPGTctVu/Wqjxdkdmj+tYqJQi06teKAAis7LEA2jtgIP2OUiBMfJnp9XmmU8+DiYg6JbSG/UQiQdTGHZ2pU2rWK+JWi2/d26nfw/llD0d2CxrCWVp77AS+hEwNa3TTP4UDLeJOTjzcyy4zalnikyL+qt5sv+vYfPLeiRX6RQeTq7h25Ikr/Kr27f0EoQgYVOXPB5SbBc1i+ALN1p4GcAd+5kVI6gEZ9pdulKv3Qozkfei6BrQwjPls1ydl81tREheKAJ/S539rn0pTt7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6823.namprd11.prod.outlook.com (2603:10b6:806:2b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Thu, 17 Jul
 2025 15:02:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 15:02:53 +0000
Date: Thu, 17 Jul 2025 11:02:49 -0400
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
Message-ID: <aHkQmRhelb4Fzqau@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aeaf782-ed4e-4a36-f543-08ddc5430165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NQlACEjkmlto5Sfzx1viQEbj52UgRCpxNpvyCS4uMeXEvgn4dFWVAiBV3Qe3?=
 =?us-ascii?Q?M1grYNr1YsIEyK/py/BY1v6xypl5Cy5Rgl59r0UZ/1hcnU4TCZoWSMNgYDr8?=
 =?us-ascii?Q?yil+rDHY41tnbZ2NfYpC+udXpef20dxWLraZzZbd/L+LFUcCZazhlxd0jQDO?=
 =?us-ascii?Q?sqm0m2YXjPERR/L+ru/3RmuJGNGi21XemTb0kq92z6KOYcoGOEQcX94ayDzZ?=
 =?us-ascii?Q?to4ohOEHYYROe2a5D/0yAjGA2uycqONzNKemAkr7XTpDEK00jDekJTOOLRcg?=
 =?us-ascii?Q?xu5yv36M+PBriduAwsljrdfBlp6MpJ0/uUTxyGUCvrCzWur93gkUsfgVNeTM?=
 =?us-ascii?Q?8o88RDG0CuXf8r4xi022UTT0zZteQ6Km8RJUpdiCA10v8C6CsTSGsKvx70rn?=
 =?us-ascii?Q?i8sjZ6Zej2WecUMt/ZQRIXcQYIfPSMgaqXs9mYq93sZIOCVbhVSUYdOz86E9?=
 =?us-ascii?Q?5NJ1bJAoLHGTkBCaqYhIKiOj6NOrFivxjND2SttgBVktu/ZxGMbIZl8Knijv?=
 =?us-ascii?Q?L8CSg6UjJDl+WuOajaTcT9P3MoebxRqBpTD3Z+ZvoqAb+oQy1GJkLU7+lWDt?=
 =?us-ascii?Q?7wtPt7izAPRNB1gdOWkBILhoeS+JEi+Zct2c9hJDmrjUtDD+44egV2ahEJK4?=
 =?us-ascii?Q?tX4AWFjLWYYkM/oOUJOjWUC5tLZniMp6/U0ju1rAD2itWtCszKUNuustir2c?=
 =?us-ascii?Q?7zHR8iyEF0EUdHXPIvjlQSUbG3UOhMcYbECA3Y83w9L1e4JtKg7hkJQsTXr8?=
 =?us-ascii?Q?jUkAX7TV5GgdHNNzpITAixVXz4C+i6SUNd8HytcLNQ/TOguRXh+vDPdKwElP?=
 =?us-ascii?Q?J4tgaithqBdLep4zZsYvJY5HmTMSDww3v7cNfxvBEicfcKUNgqjLEtwoK0Kq?=
 =?us-ascii?Q?uuU0sbzq/KoB6DXwdLEuUMXM7K0cFOlM2Avve+CN6dKcSu1FTBV1+iXW6rKW?=
 =?us-ascii?Q?SGjEx2Z+mFtMVVsI0hLz2Ie07/fuSAvXdISJin2epXDRUY/iZnIya6Jkn0rP?=
 =?us-ascii?Q?GneojaaIrc7LJITUwvVdCCxo/x7WYSulqJPB2IDea1inIO59rdH8TjeLdyVI?=
 =?us-ascii?Q?FY8C/iR5hEYYvidZpWnT1p4GYpbFi/J1+we5rK7PaJfTOYtNutmmoA3gR8yC?=
 =?us-ascii?Q?mJbroBXKatUGW6yxuQDiD30P+r3U4t1du9wEk6nVrFjeZvoca/5yg/6UNEMD?=
 =?us-ascii?Q?iNKLYSdQjJxJh11lQVIzZI66Bg+/ExfZaRRLaPwavVzI0f/11COYY6w+NyHf?=
 =?us-ascii?Q?EZMBPtcL/VIZGVDK89gjqPxcLmM9HH2ebpXcFGKwN4ct2QRIsvZpxf3Ic/jl?=
 =?us-ascii?Q?3Etz8JPtWPGNhRkMqGFpsBYkR2CiPe/UN+vvyqyI+hLxFxJXy8By0AfbbyPn?=
 =?us-ascii?Q?cibiEfQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hG1rb07bLxubfv2/fxs+DtMW+TxKuc5e2J0JhtiB8ItT4tCo3uI2UBB8KfLA?=
 =?us-ascii?Q?/I7TnTB6URV8SoKDnRqbzduAlIB+DeDjgFJ4/SbsMi8B3rDuN018eyFECb7J?=
 =?us-ascii?Q?qsvt8svQcGKHjyp+4/WIwfQaVTHQJ535C7U8YtsaFq9zGEbTyopOniiZw3AI?=
 =?us-ascii?Q?VhZbvW0wmshyLKSFL1f6X4yXLvXNahdLPJiSCaaZZyZUBZI8NQRr4U6i/yIo?=
 =?us-ascii?Q?NPkgHPU3wn1XGh4ajYh0kj2X2ehESRSoVyzP+VlaeBtYy0zE1C/a+gwUgYVP?=
 =?us-ascii?Q?vMTmEOfqp9IYuS9HmyUtlcrNUhte9Ape68YMGCi1UOQgjdqStssB/8otzWDF?=
 =?us-ascii?Q?gS93o12GWPxOQUlRsRyhZ9jeX20HRxZtYmOJbSI6z9hPti4yb54HD7bP4nZa?=
 =?us-ascii?Q?Sz0CSceTCxt7imeih91YEzCs2lnqRUJXe2qNT7SNHe8ClJWhQcEOUxPgvTk0?=
 =?us-ascii?Q?/RRihhC8jrWraaienllTcR9ihVLQNL0WqbpILhkt+kB1HdRA7d8rHhoPpneY?=
 =?us-ascii?Q?0f7kThaXeO5vAohnx4CTzfozksy3AdAlLjp1LYa34NVpuruRY2YBAwyVq9f5?=
 =?us-ascii?Q?PHOZA56yOxzN1KW1ydbX8fEn86pHXHZGNaixIso/GgjxBN909aUyXAehPLz7?=
 =?us-ascii?Q?feGDRcAxEHDgKMJRJXwr8QLLTLYBDsShtwVuBCu8eAzM73Md1VW39KxCYBDC?=
 =?us-ascii?Q?zUx54vCuCbsbDfRFbzoktw98X734b492ThBazbrb/GF4NDTc0Ca4uORtx3d0?=
 =?us-ascii?Q?Kfsgcaj4RiD5CJuu0ias6kz5aDo42wDCMt9HzUF4I284qRBDrFb7S7ToUqeU?=
 =?us-ascii?Q?s9AZGx3kN2kL5wIP2iTDXupXEhjawkruLKh60AXXyS1OdzxlMoS2YNzAbo9r?=
 =?us-ascii?Q?CU2rR8s5lTOXnDDJMIEbWj2J5smJmhZdo3cLspoXvpuADD+9y400Y3EndmX0?=
 =?us-ascii?Q?fSK2wDX2q/+AcObtC2SuV1+AKWK2dmcJ3Fl5x0Xm0XqahqW0OoBQyeKTHtqw?=
 =?us-ascii?Q?O1xXT/aUImF/pgfaKbQW9ipvSwyhJZUr8frdfga9lfwkyZp9olLyXb4aEhh1?=
 =?us-ascii?Q?6VZ8wOUKnuGkgKyR/kWwd+OyMHffUIit6gOpYOicvbTD8FNv3/96lzr/j9J8?=
 =?us-ascii?Q?4GEmF3vM6JAwM5NwQs41S2GVslYpWg9BT+Gc4gEfITTDGkE2WFQ2mb4Rq3BI?=
 =?us-ascii?Q?ApAKzlJCC4PjCViYgciyAANRWypV3cbqrAEWThzq3QRaFaZiVugdpIcjq3fM?=
 =?us-ascii?Q?oaUUgthXoR/+lUDD9b1ANrKPPmh3FPiPwB0l5ktp07oVz1PsOdmqiQaAPWOl?=
 =?us-ascii?Q?Fp3Ur59e6VsQN85g/uVgwXP0LkikWJ1D+s1hzNyY6B26SYlRY7cqNtYf2VV+?=
 =?us-ascii?Q?DIFhst2O/1U1JhQp2Nk6kBjyD3UrI44O6W6T3XD9DT8Hl0F7y9dKT9p87iOf?=
 =?us-ascii?Q?xLCZomQBa8437kBZGJd18nfFiKfUiz56RrQK5qeKG+AUx+o2SVF7NOqPHhKl?=
 =?us-ascii?Q?HVcAlaC744fbVlUnHvdB6zCgROp//xiS6sS69CC+q1m+aE5TxBgXdaermvK7?=
 =?us-ascii?Q?K+9xtwVeZLeg/olw5ifdbudPi2AwbsV6EkvdD9bA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeaf782-ed4e-4a36-f543-08ddc5430165
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:02:53.5754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIw3z22T32yUwnGlzRWCqTocLwV2ZARQs6D0Tr8R7K8CZDF9D1sXyVatQV3TFCLvREQYDo9ECd4MZqrQECtlgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
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

Here goes the drm-intel-fixes of this week
with a single display fix.

This might conflict when getting merged, but the
solution is trivial to go what is already in the -next trees.

Thanks,
Rodrigo.

drm-intel-fixes-2025-07-17:
- DP AUX DPCD address fix (Imre)
The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-07-17

for you to fetch changes up to d34d6feaf4a76833effcec0b148b65946b04cde8:

  drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET (2025-07-15 09:37:57 -0400)

----------------------------------------------------------------
- DP AUX DPCD address fix (Imre)

----------------------------------------------------------------
Imre Deak (1):
      drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET

 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
