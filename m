Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C0C20596
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752010E995;
	Thu, 30 Oct 2025 13:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld9DqKw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32D010E98F;
 Thu, 30 Oct 2025 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761832283; x=1793368283;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=xn7a2S4Rw6VVvSXhQ52hLWwfkrFMLdI3vwIwxgu+aBQ=;
 b=Ld9DqKw2jWSkdoOV/b0okx0DPxXP/MMAmfP0ZqMTR9Gl02EHoRaVb/vQ
 L4LL2wUKBqF6zpRMTc8FDTNiGdkqT8xRfY0XA201qwO1ro1V3yX0ftorf
 tLnCpg+VDZI4l8kKVtmKghkWie5CNysPP1zq6hANlhCRiaE3slKdYHQYL
 owz1zqjeB+VLtuKC/ltd7JewOfdS7KiW6AOQ7YwCXwacUzdMAFTzP4Iz7
 ZJOcHgN3/zoj13ndgPytBCBo+molVom6ZJ8brnxJWM/9jHz3SiuJzYxDi
 8SR//Eiqmyr5yztnfuiDZxaR6i73DpIr4oa8b7RLdrazljkjiouLrOUdk w==;
X-CSE-ConnectionGUID: yweWzjGVQL63Ya5f7W/VOA==
X-CSE-MsgGUID: lh/5ejjsSG+o63cMAlAbTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64069996"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64069996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:51:22 -0700
X-CSE-ConnectionGUID: lr4sAoHaTZSuVcrARcjhbQ==
X-CSE-MsgGUID: kxK/MbhTQAC0AHziocHX8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185220171"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:51:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:51:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:51:16 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qemRDTwZqBYyLG27fDrjd37LxOXpiQF05ravOPMcZQB3hfMvd8qOoJo6IIr0QkNa3hGQkpNpr0pRIxAsiyt8Q3z9BJCfbjQI+SaEbsiUCDLvPptpGMnqJYEh9kvLrlZVt2JdGOSqxJOYng5G1xeyJ6f+aSvQj3o92U5IFBQjZE+UQpcldLm+XljyAu91NdU6iTlXqyGhS38q7bXTOiyNWQ2tJTghPwshbBQKHfpPDQ9k1J/1sFWN1Exp1dos03sE2+hdULcXvjxrhHTGB4iVoavW4UMYqYY0ToTN7noQjeU3B8yVrNpFZ7tTzYiFsPBa58Ts9MHTrYEuUHA97+uk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQWrwaEXjyMA1v6D9yhyotoKLV9ziBq3hfLDWyi/TYU=;
 b=MzSu6As1qis4d5Ci4qaflAukVV+H1xHn0bgfFDG1PavOO0IIi2q0FtIQw7/n/nf98kCAwsG8b4pmGrQh/fcqtO1lu9iMOcnZuA6QnYTxS9pQMWOgEto5pEUGbOML2kMKNl4Zz7oWOUvxZ5nJ+y9YYJMlv7KzaKezTxvsLqtB3IV4GarWOh/t7GhiMAAuCF7fXEUyvZji49KyVEGY7R1qFxk6tEYYNM6qHhJYXnthTqbp87P9J0121vwX2wi7h+t0QJmjz6vVpbWX3Hexa7AVmnKadkPE3uK+et/es8+Av9Xbei/j9N/iYLA1tSYN7u7P3OFJABiplcUKyC6jRaKeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 30 Oct
 2025 13:51:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 13:51:14 +0000
Date: Thu, 30 Oct 2025 09:51:09 -0400
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
Message-ID: <aQNtTV75vPaDhnXh@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 488583f1-b346-4899-c8ef-08de17bb6449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Fyff0KCc9p5xF9zNKx9p5TeYXD0dxFsTmMPida1P8LFF/1y6wcxSKUetDT?=
 =?iso-8859-1?Q?LL2ek7si57p7GrSkNs+oksBZvVbPQVeYiGbkdtTudjQMevhszcgeBybbwv?=
 =?iso-8859-1?Q?bIQLNgWgtrvs5stMK59nWKsMPKji1KaWIua/eUS/ZJH8dCea8I10WHBODQ?=
 =?iso-8859-1?Q?1tjndv5y+CouT1Q/t2ihX23pbEk0uOEDkPsknZbolmuFuTMMvNsRRSt06W?=
 =?iso-8859-1?Q?VaU2eH5+5HG19CddrnBWMXNQFcUk+57jReNQs/eilfd/uR0HETjYbZZLD6?=
 =?iso-8859-1?Q?CXXAueWOMpelaow4IUt8aNJPji05vSqHJqVuMMEy6RKcZ/SGe3A8wnulVc?=
 =?iso-8859-1?Q?ztrzJVyQbiVZtLDv5lU71Dax7XxhkZYLCut58/2X6vbYNFj0Rh6bG5XWFz?=
 =?iso-8859-1?Q?1HoN5mtQYMd7cJs+Sd63NdsUYd/ecTH3WJahKJgfdmSx0Gnyb8vIdqNh55?=
 =?iso-8859-1?Q?qrXM+WkDUDyeHEhizacQWk+ehjUzkb0lFRkpRltFGtHGoa6N73VXXdAVxV?=
 =?iso-8859-1?Q?Nka6hIjGe9AZKm7sxUEEjaB1HUTaBOpsuv/2TcdCt1YT5xmJLfokIV4q9c?=
 =?iso-8859-1?Q?YR6OacQCEEDwUwLFIf7gGg9ylI3e2J0mXt8+sdgykAyDUuGQa5uBaJyb+r?=
 =?iso-8859-1?Q?aheBzWRa45fcFXvqW0RBWl5HUbSaOSO5ZNjjPl026ZhVFohsyqc2m/fOMG?=
 =?iso-8859-1?Q?p0YCnFc9jwfH9ftHa44937xTrg9R/BMish0mpbX/9wERkrUUxZBu2rdHgR?=
 =?iso-8859-1?Q?9hR1vb1pRRIgIFMD3GwWOpK/mkqq6/PJUbFunh0oT3GQ/rfS/pt646C71/?=
 =?iso-8859-1?Q?sc2QibDH2qyerZoDPveq9idkG5SRGXdAYUF4ii3zJghX/gC7vyc+onm8eV?=
 =?iso-8859-1?Q?gZTWGT/yXn7ahZmqBa4rQ9roXxUzveeVYfZf4FDis6JIKgV57MUgwUalOs?=
 =?iso-8859-1?Q?BGvoUf0kIl8KMLyKSxfFOEIloRoNj0LYsBNr3oXvxpC3qICn7XV/Miuuv+?=
 =?iso-8859-1?Q?XnxkETgRtkdzVg+1pHM9ilJ2xVThq07nTX6AK6RruKTkhdeKOjDF56UHQq?=
 =?iso-8859-1?Q?s0RPhyCNjYXwl6nmNZbcNQw+tjFsEJDn0AhpAk4QvMsBQTbfEEUymtZe25?=
 =?iso-8859-1?Q?GRlaWQ3ePHRH7Bj1zMqimQE8lmqDtsIDiwa8q7OPrcHxNDwAE+cluIHxfn?=
 =?iso-8859-1?Q?jsGHq5y1lzIVS0v1f0DuNOUjg/mgpfymrYpBvBSKWyokoBqOEDlQNmB7fw?=
 =?iso-8859-1?Q?QV75TF2iZW9B5LAP31Z1OFvnAXQSUIJGTOlZrAG3cmdoAxUcAus4TtFAJg?=
 =?iso-8859-1?Q?JOrYAr3oXwM3LALxuzWIRnnsWo5Rp2u2MuwD7MGEX7HPOfOUZ6LeY/lmrV?=
 =?iso-8859-1?Q?IKRyBN15G2QLxlSYkH/1ynUQ8ts6uI/mEYZPmP33mGRgfU/OY1z2ysGlJD?=
 =?iso-8859-1?Q?jPDziC4wlcyWvDsa6n7griiWkXJJG1pmbaqYSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u67HO78uUS+c1xjCoJDFmw2Ur2KW+jpNSzQsJmy0/+MUH1zMs/AhAEKCJJ?=
 =?iso-8859-1?Q?TIuZIKwEiwur+1Dp0S6sysq2KHwENxhMyZOtzZbrYADlM3y5X/AK/nhhCG?=
 =?iso-8859-1?Q?HR6KyWkiCMbxQItApa8YajWU8evtam90YjqebiEFLD0tG5H024pp1M/cJu?=
 =?iso-8859-1?Q?tw4L90BbakR/uxvqXeTbCvigDMYbfg1ZU92HqDDrBIDu97cr1c/HgCDQIG?=
 =?iso-8859-1?Q?yRpg4eivxGMpFBcBpc7VrdOVmJWSiAzdtuf+0OL7Ww1/cDPoUpU4S/Cwov?=
 =?iso-8859-1?Q?7A93JrKoFZOomjT96DW3v4ldRyyTr3rRjw+U6A3Xhmg4IwF1F1fxpdlLHs?=
 =?iso-8859-1?Q?EItoXa7KUflBLufwRhPrITXRKvyC7HAHR8hHlX+T4yE81vFkWBq0tqeXJf?=
 =?iso-8859-1?Q?tdRAmgR/000tatfR9HyipORfuN40RjxpYcQ1kfx2Y+u4zwRDT5NcifaBBy?=
 =?iso-8859-1?Q?sDK9cAQT+ueCLrzVRmXuXxMmUQoGGJlKdI5MU+elRtJA+so3xA6N+WKIYS?=
 =?iso-8859-1?Q?OIj/gpdcLEiHgmgtbiRlzat4LI1psEFB54ypa+S/DzTUvbZWz0QMMMrcYo?=
 =?iso-8859-1?Q?sPfiEQ88fURTnlAPLv0jfNW9Npz7qSjApzoX/AOGAvwohc8LXtq3QgUcbz?=
 =?iso-8859-1?Q?T/VX8iCH0tfeg498e/LJYUETwGjmc18ln6n5jr+FcZ6qMdqCdB+ygF4zHY?=
 =?iso-8859-1?Q?9v/2XSwhWW6O2kLR2FXMlSpKFYk8bAv9/acGRcYarqecUVURBhlEjINDtk?=
 =?iso-8859-1?Q?zeLdr9oT4S1HPiDAnkNz5/AgNbSCtylP8JK1GtNCYRkKmflACLprlDELqz?=
 =?iso-8859-1?Q?rBbMjt9tuXRa0rgqdjn+jxM21jd8c4WYnG+sAFcusfBiXHWOH46rtd0XYs?=
 =?iso-8859-1?Q?VhRH8IQh4XOvd2F/2/ccYINo3TTiv01OUtqlslsLqYXZlmU7YsU5q7ueru?=
 =?iso-8859-1?Q?I4hMmmQuJgWg83b6ZSuIlb02+q/S2Y7y4RtLsnb2zpN/fNhMUuZ0ftNZLO?=
 =?iso-8859-1?Q?RJL1K2VRNuPDID8pLGWzaskB0/MGh/zLyumfUjQQGMQuZjoX8ZMRMF28Bs?=
 =?iso-8859-1?Q?W16CxglZWvKqfdl2Vpmq05+2vKWTdDSCwdWINoAuMqNLBX8Si1U4VV0XcG?=
 =?iso-8859-1?Q?HWHj5or4wg40E7fVE8knggfyk3qx/VOC5EGiGEPpK0N5oYxYyzKxUJV12Q?=
 =?iso-8859-1?Q?+GtowzPAPrdF3NX0ZffZ31aHJK6Ggrh+x/TzOCZJvyZvtVCgO8GuG+sZqR?=
 =?iso-8859-1?Q?xjSQVxFwqz1ySH4RS5EccFXcLdP4pxjeyAIFi74TYAw9wKhxJgfIqueFxU?=
 =?iso-8859-1?Q?eU/sExQun5V+YhXvJaNXXfljPirche7VzK0DYVu6uY5hVxpFOuqaNTOgGG?=
 =?iso-8859-1?Q?ojaM9SwkmUktvNOC2JXvP+ib8PCD3+4bXYPOGujfB8BimpD1aZsh+1XIOc?=
 =?iso-8859-1?Q?IQ0tcYuTTqxnC5crILqBhCAXWzEwnuGrlJKXqbdH3/uJ9MTC52e6aITKI8?=
 =?iso-8859-1?Q?uAorIJYzcZd+kwXQF0zDMHhsbunRrRDChioGDHKRj3Nvg3cB4GVMIIetrw?=
 =?iso-8859-1?Q?rar6737PPPkivM0K2SHY1ctMmOw3+eyvHSW0jwfK/txR/DmBKQx9nnw68d?=
 =?iso-8859-1?Q?FRXJ93QWec99WhjM3J7D873C0S0h7qY20AzmTMrD4i5MaDKgir6mYI5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 488583f1-b346-4899-c8ef-08de17bb6449
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:51:14.4021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nNhFuNZGoByTsCZeHBRpPSIM05rsMacQLF8IIB0DGE9JfP4Pos35eMf/kdF92dPZdjmXo1zdKhcra97QnaeaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
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

Here goes our only fix for intel-display for this
round.

Thanks,
Rodrigo.

drm-intel-fixes-2025-10-30:
- Fix DMC/DC6 asserts on ADL-S (Ville)
The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-30

for you to fetch changes up to dc8aa0cb87a7836b59422cc02d969c8df849ee39:

  drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S (2025-10-28 16:00:19 -0400)

----------------------------------------------------------------
- Fix DMC/DC6 asserts on ADL-S (Ville)

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S

 drivers/gpu/drm/i915/display/intel_dmc.c | 55 +++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)
