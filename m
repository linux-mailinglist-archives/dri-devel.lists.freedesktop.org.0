Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6906AC3B159
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B388210E2CC;
	Thu,  6 Nov 2025 13:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YapVBDbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0ED10E2CC;
 Thu,  6 Nov 2025 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762434498; x=1793970498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7GJnig9FIBIffTGo9V5hoDO/01lpDw36RetS3XSgd30=;
 b=YapVBDbjAYbClE3FHI8WAGOx8qXuEAvl5QGMQAbj2R72Yi5RdQ0h+8v2
 ADUza8AQU7jp5S3K7Zd6QiDSINdZWpoioc6iiSaLOQnmRXlRg50Rg2m2C
 2cm2+fbukqzC9u2Slx8iHXwvUg0C05rZCzagV/boaM3/SyYKAtUCe2WkC
 597nvF0YqXjk1DEbOPNQx0HX4HphnOwzFeubHcJpVFVbDbMZiyRpD0RLq
 kUVO9JloK8tKUtXTRRh2VLND6IpdGQFMFCJJMG54TOXLSLNLq6ifiUME1
 60t5PuI07eG07s7VoPTy2+38DFxEbk3AbxcjSJbxPcXSQ8idJ/dOiKkLK g==;
X-CSE-ConnectionGUID: 1yJ2DyfxQUaRaiTp25cHJA==
X-CSE-MsgGUID: aDBi4HvYSXGItD0Jl3FJJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64604376"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64604376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:08:18 -0800
X-CSE-ConnectionGUID: 0tFQIV8lTa2pz//hnSqBDw==
X-CSE-MsgGUID: mUYqqeNOT2So+X8LWhAkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="225002370"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:08:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:08:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 05:08:17 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xN5qj9ZKl2cgGdCKZ3K84A1L0vbmhJTEqDoZGMqYPi7PG1fNhbi+UvTn4qWdTJU+dczAJYz2zghyYse8xFS7iDuF+15g2wQBWufm/A++hSqt5e3jXEdi/RIoi8LzGRGsCxJJH1FUXsSwfsZdjQj8gVOPtOc/LtXkTdnuvoTxq8GZ7dsDHzH5k3P14l+oOAl4rzkK6OZOlMzVY7pOwni4VywnKdZyz+1Sup+kZDg+PHG7Y53W+P0vvrnn973pDgJqETBBC6Od87mBMvQBKKHaquCSZjAjk5SuWOID3aYk6jHPh7IOGQktdMpCDG6scNL5pcX8wXYYDneDwBAa1ygvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKLRzKrPc8pfkadFpvyP9hJxnqUCEI9mX/x0V4485HM=;
 b=fKM5wByQR8vW8+o5VMTeX4M6MKxZrenlcYM1zK9cWXXX6fjcpp0KM3A8CXxJWWmKXNx9j/b/2aizyV1J0VUWb4VkWXACRXxC7tYTtHNJIBaCyp58AYb6Bgmr+gz9YEcM2PJCH4r4v1lhH2WA++BAm1ymzd8ZaDHZDTVsmhNekxaKrzp75G9+QOFncm94zCME9czpllcHaxIN/Z2v963DloT4BFt5E/yAVDoeEBT/pRw6cC8VzkibmKPEtGF3nSG3z1S2LkIQEz3/G8x0yJ5bYtmtoXu/NehXyrdeS2I+2hYKLxSTUxaUXHomdUqpQB+0vReuJ5YVC2q4NN6giaCmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:08:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:08:14 +0000
Date: Thu, 6 Nov 2025 08:08:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukas Wunner <lukas@wunner.de>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Dave
 Airlie" <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, <netdev@vger.kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>
Subject: Re: DRM_RAS for CPER Error logging?!
Message-ID: <aQydt0uTQBzYNzy-@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com> <aQN6dqFdrXxLKWlI@intel.com>
 <aQRLccLXfgfoWaIP@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQRLccLXfgfoWaIP@wunner.de>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab66f7a-e328-4990-db06-08de1d358b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hjoAIJSRJlgbAcczXbeGKMuGEMfmBoFsFOeqXynud6ixObU9yOisFVFR4D0Z?=
 =?us-ascii?Q?eXxKUSicKTAMk4WSOEIqH+s1+BRS8c50+MMrDr3N/Wj5/p+dODTPwTlQnRwt?=
 =?us-ascii?Q?doaW2BSxflx2S7Wv/LX7bVG99LshcZJor3Y/47dz3Gqmysctsi1pw5qZAzPT?=
 =?us-ascii?Q?7SQ/UAsIfUoULIZx+q8VDD6G4Mkx7OKAmS5SMUh9yRLpBgY2RTGlW+D3lwpV?=
 =?us-ascii?Q?RarV9n0Icy9cu/QfG8RkjJV1PmdmGuhC/5B0B6bCoyWi1ypdyTkiKLJ7iQe5?=
 =?us-ascii?Q?QaKNdAkiC9MQilofbdu4MiRYQezqln8uSoewyuqXaGEwRlPjGK7vVlsTEFrF?=
 =?us-ascii?Q?q2s1U41Vchn4tIySw2d2wyI3tUOB7MWKY8AIxyoFkLjo+1SVKqRuKB0sISZb?=
 =?us-ascii?Q?8RFpZoWzDo8ptlKSyKmKcn6ACuJEEpfgpS0D4BQLejLE9en4TGfSR1Tt6i00?=
 =?us-ascii?Q?dbHuFQdP9TMo+3sx0WCiMzAf34m0rc8uYqwzGcAH+y0Ce7aaTRLCpGCaJxDf?=
 =?us-ascii?Q?PIcKbsmy2bpiQxPXX3FDg1v4vI0yrbbW6r/zNo20+7LGznpxl4PafifFFXTT?=
 =?us-ascii?Q?HDJronH02gYQv24NyP886oKQnR9nCSkGyCV6nTGjuftVbgZaqe8vFuO0/Agz?=
 =?us-ascii?Q?MEZ4C1AjV9bsqftkziKi/HkMkqOvKRT2lAPqhHnO+s9h5X8e3fxlKrm15Pdq?=
 =?us-ascii?Q?aBuVjJUcAUoLb0FBNxLz/BSJFhDYyBldYWuXW6XSwSAxIhW7DuqvFKLc1glo?=
 =?us-ascii?Q?TQOdF/pi+x8CLNfAg3aneKWdpIPEjKtuV9Q+FUrKUwNYsezfAhrnVoI2Bjf3?=
 =?us-ascii?Q?cfm/LNWJV6t5GUlwXAq3sFVDnw6awaecdozdjJo6AB3bnZPhdz5JBH2C+CIu?=
 =?us-ascii?Q?sbthYsUV7VbJNMUql8FIGXHF767PfLYkRJwuFeDWvgMwVCIbbTwf+9T/6wVa?=
 =?us-ascii?Q?8dJYdOoHwMaRVWV0yZJxDA2eLPszBN2bUH5AjkjDGLw5SpDQVhgxKJjq58Rq?=
 =?us-ascii?Q?Hq4xNE/HXC2B6CQaDbWmuzmbHtdkVqhKMUHgAOE9t9idaIzDl7ayJGBU74Cd?=
 =?us-ascii?Q?pU9/PqZyjowcF/xdnS2pAULl3pE90ZGj6hOcWWq0n8gsMgvBEjhzn8W9MIeF?=
 =?us-ascii?Q?4DP1sMiULgIutWPptCv2FHbbE6GfaRitYdKuJeLPfGwM/Ue3+E+XL//PZ4uU?=
 =?us-ascii?Q?ymwjgRZKzoK58r+lNzXr158D9J4/qAou06wE2qVosGG+wQaBAwHzTN05StIR?=
 =?us-ascii?Q?FcIz1yVBT+Kq+Zn99dYAL2pU72BECH4i7Omohm6+vpa05wHe94Y6MSW3W0cd?=
 =?us-ascii?Q?uT63TePQFc/OjFxtZXJ4fPifT2Eue+l70PNRivhOORHiJzy3aOLog73Ry6vy?=
 =?us-ascii?Q?6m2lzFzqI1XHi1uS3CzPka4cK6rGvi0/tLcO/Mt2+mqSQatMJQ49OcpLG+Kw?=
 =?us-ascii?Q?hsx/JnbaRenXptdj6TR1C6XzLDn1bE+G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QnKEPbd+Sk1yWhc9kPX1/bQl4F14aHL7lcq7c+G0smJFHrHcat9HpROxg7hA?=
 =?us-ascii?Q?PZNyVC8GfcVamaDzqDkQ8EollCb9ukpve3AX5TtAbat4ZImBwy4gfehqY/4d?=
 =?us-ascii?Q?GDA1baOefQG2ulyQHhp38+l1Mp0j6+k4DtNELlto3hsqkHC7Eojiu5Q+UwAs?=
 =?us-ascii?Q?VYxNnbkRswdDt8jany5BGYV6veFl0da2cAB+0XLsb0eiqfQXVjXVIax056EL?=
 =?us-ascii?Q?gFPeKtUvM6wdQkESCoebma733ViYzFOKLWxH3t6OPww0LqAqGZ/sUQDabuT9?=
 =?us-ascii?Q?QpjJdE749QVinb9vPLUPs9y1mMxZaP1aoLBC2oFJGeYYakwErOC05tU1Id2W?=
 =?us-ascii?Q?Nm0FS6QZBZyvrXceenOpDtG/BIkzlrWBIEZjKJC+Hp573PUPkknsRVc0S0iX?=
 =?us-ascii?Q?X96DIsEnm/WWYV7fubJd57TpPS3EFR6CdLbB3ekvEXOZhBFP3/tlgaosDCPX?=
 =?us-ascii?Q?QrUQvG6GSwRB6/2c3qjaWtsHMh6pZTM3UObLR6juN6P7zQwmua7oiGZ4lxCL?=
 =?us-ascii?Q?wN9N+lrrG1ONhgwm/nmK6a88D7ee8qAI9ywi6S8sTWiuWBYTXbvMipGuy4fQ?=
 =?us-ascii?Q?3OXHHuITbYahFljOftddiyKsfgYmHwJU+2rAwyutRw8wX0So29wkW4/PG7gN?=
 =?us-ascii?Q?rXs/yL14Y71nYwo5rnOWgGW6QKcYlig4Cd5cW/gtcE+OE5luRdJ0iI6geh7k?=
 =?us-ascii?Q?ReYoQQjjUKI01mJxnFBZeYvvVo/neEvUw3CLLdU2Upr9uGrNft++cmfrdAky?=
 =?us-ascii?Q?h7bFSDP2w0Hwv9t/TOdaddyDMEyMxzcC8+cifZ/Y16cO+uJESVqpQNoDx2Ol?=
 =?us-ascii?Q?CswT2OS9v0Zina2xdUa/bG4K+ucuxJDaYYk/V3xUw3qlQQIH6fldNpi6GxwL?=
 =?us-ascii?Q?TsPG/bDJllEG0AoqPHYO3dRAVmmw0h+PJvBP3350ibV6/wf7Y2FvOmcxQSl9?=
 =?us-ascii?Q?bU7+aduDyDsyO4PlxTjhpsoVZteywGs/Sws0PLeJPw8juMhVOI0CCx1JeWlO?=
 =?us-ascii?Q?MazkrUrHbRALSFMmhQZ2yFMfkN6ZW0zphGMcj9WwExTQuk6clzKpDV8FAU8E?=
 =?us-ascii?Q?HVb8PIa4NmeXDEUSmqqpMx+DMOHD/VXXsqcaV/jWgtDbuDmxrPUKyRyyfCX2?=
 =?us-ascii?Q?1HdLoDprcQWJU1p8NkLoI/tD2+7/z8KnVC5gKq/hwmqECn38ZsyFiwUkKO/o?=
 =?us-ascii?Q?lL+vKBaNEfE4sP0sBXB23puIRx1PJUEuXatlyBVRU5EZSmwiPuABWPsHCk+k?=
 =?us-ascii?Q?tXUXBY95eFpwBEEhmmCSMBpUXQnvCEZGsIlMnCy0gafZjmdHLUi7KOFnmF17?=
 =?us-ascii?Q?gylu57F5lYHSbEQ8/ShpYeaKyBgI241H9wJ8IxRnAB0KcQnOGZT9bnrjRMUf?=
 =?us-ascii?Q?HohloSkJs9oRIwNsGFxaCkQtw6f6iHavNu8h5zZq/E8nred6pdfOAHmpQUQr?=
 =?us-ascii?Q?6/gGFMvxnUhd50qHlHYCcQnAbkAemsYCtU7qrz2C3YqXmcZu6LOvYilPKtqS?=
 =?us-ascii?Q?xG5vLXn0NcFHfggyVpu0wmftS46SdoHwvRyxUl8WXBVRwjIs5kY2RZGJCTqt?=
 =?us-ascii?Q?XqxcOGfE5hKToOSv9Q/lOxag1Z9Jzvhap/3aQUSZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab66f7a-e328-4990-db06-08de1d358b8d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:08:14.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ch2cGf8hgZg6xtFIKbQwCpN7OGh4fxOHaZNdRG0sOaRn7l1TNSCUYeFRlr8qz2+bV29SQ4n5MoNdMK+WEVDesQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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

On Fri, Oct 31, 2025 at 06:38:57AM +0100, Lukas Wunner wrote:
> On Thu, Oct 30, 2025 at 10:47:18AM -0400, Rodrigo Vivi wrote:
> > On Tue, Oct 28, 2025 at 03:13:15PM -0400, Rodrigo Vivi wrote:
> > > On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:
> > > 
> > > Hey Dave, Sima, AMD folks, Qualcomm folks,
> > 
> > + Netlink list and maintainers to get some feedback on the netlink usage
> > proposed here.
> > 
> > Specially to check if there's any concern with CPER blob going through
> > netlink or if there's any size limitation or concern.
> 
> How large are those blobs? 

The honest answer is: I don't know!

By spec it has no limitation, but since in general CPER is made
for FW storage it is usually not really big.

From what I could see usual max seems to be around 64Kb. But
for our case we are looking to something much smaller than that.

> If the netlink message exceeds PAGE_SIZE
> because of the CPER blob, a workaround might be to attach it to the
> skb as fragments with skb_add_rx_frag().

Yeap, I imagined that there should be a way.

Thank you

> 
> Thanks,
> 
> Lukas
