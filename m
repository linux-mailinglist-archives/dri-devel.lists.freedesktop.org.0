Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C5AA36800
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 23:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B9110E07B;
	Fri, 14 Feb 2025 22:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo6ylftK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D8010E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 22:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739570645; x=1771106645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=101i40+Y45TkaPuZgiNzbWGQOhgleWDDUcDDQcNytEg=;
 b=jo6ylftKpwqNDJKeM4zDXC4FUVz500cPueh5A6Iup1bxCFxbty5n0ur7
 smolip6TTO1kILa/uhWjYp79chYGD0PlgVuE/a2Ms+z+V8/fyuu6POOW4
 F8lDdpDHQ3s33hD59qg6NvjtYSVs1WHT9ebTk6XXbD/ZbiTHE8t9/Rtpk
 mxWd5kZAC8y0Z6+SS/JpDwOe/fg+1CGWbomnlspe3izNldl1Lqkspx6Ct
 YYs4WvHbh2by82syXazP6Hs83pqmbQDFmtChVW1k9EneLic34O8PyqyT2
 UCPdoET+GFDk+3yUCluENSOchvzjNdqLD6SZj4SLr5TVQO3xlaL+5DQBp g==;
X-CSE-ConnectionGUID: pLEiDobFSCijVtPcW8kuBQ==
X-CSE-MsgGUID: jtl90PRiRTKrcQ1BrGs+6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51745292"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="51745292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:04:04 -0800
X-CSE-ConnectionGUID: GzM7rVMISWqONTfyomGOOw==
X-CSE-MsgGUID: AMutdJ4GQ+iIS3zuDJEnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118198490"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:04:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 14:04:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 14:04:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:03:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7EJcUhOFjuQHZCVnb/ITt1Rf9IztE2rYGkqwAVMVK3QTDkfzYZb1ur7yaVlfxnyF6KdUB3yi0LMOO/U64loiQ8nDlYmkZkLMf3JzIsK97PKIV3LZipMCVM5sLOF/dK1gAkal9zoS3Bt2UN2HgdBp3SMSJ0CLHqT7Ei3npxMVWg6DNut+OcnnkXUf5OF8MZSjjD1Uv8QRsz0VqZe+bwBbrNy6aB3oBN4x0BEZ4bWUTXeRX+Pw4BBvJ8Ozhvq/hRiYFBXq8pDzU82T+P776VEf02jpWSsCNR5fIzOfecd+S93+aRAERyDrw8Fx+SfL6x+XkLzpEV7k65BkdjcanNgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxcALKEJbyORB6OzoFXTUAjCbyu/dwAcMmOsCEitUXg=;
 b=xgrpOTs4LSaygO4p/FNCnN8fNY+P+AMNMQLekRqXKNeiR1TKDLDPTxj6OJZ/3ySpZNwlIF/j9sRseHCQt7+L27eUQT3mtDokLs68ezgIh1Jy4RQP2qfXXd0NARJB8QpdTOktIdpSMfZEgyHziFYJr49KgGQbqmtwFesAgK7dc+wbDEDIzaDj4n+hitwdU+sWTD726bvWp/8p+iZNysh8HIj+eGwiRPSqrlVEdTIzWpYrPXqdgY6NkiKfaH2sBUaL7STQPnBd9yr8lg34kxY+xB6NTFCnFL/V+vdVXMlQoB3PnCE1nfKuXua/8TTPm6X/3/GAR2XWoLyv9p7WVKh/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 22:03:29 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%5]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 22:03:29 +0000
Date: Fri, 14 Feb 2025 16:03:16 -0600
From: Ira Weiny <ira.weiny@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Ira Weiny <ira.weiny@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Stephen
 Boyd" <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich
 <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?iso-8859-1?Q?Th=E9o?= Lebrun
 <theo.lebrun@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, "Abel
 Vesa" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
Message-ID: <67afbda4d493_17db6b294bd@iweiny-mobl.notmuch>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
 <67af6c284c349_1614f3294dd@iweiny-mobl.notmuch>
 <1jr040xu9z.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1jr040xu9z.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: MW4PR04CA0304.namprd04.prod.outlook.com
 (2603:10b6:303:82::9) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MW4PR11MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8ae7b1-6a02-4084-4d48-08dd4d4369e9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N+Rz/dUMS87zTmVZ9926rQW3GAbirTeqmGlYwO9O0EeQ6AALZzQ2/44OCl0H?=
 =?us-ascii?Q?63Ph/8O5dBz6BgmuYSyJDlCZKTZG6Azs6X66/Qjs+WclDXGAvf5NXO4couCH?=
 =?us-ascii?Q?ROnUKdM47lk2nzMhF5JrieolpTsLh9Tli3uVqRiaLDIchac/G4f6ed5R0nQV?=
 =?us-ascii?Q?e8GqW5emgMdkZ/7RPTS7UVDfF9yJTdJVJ1u0NVwrNMLmwzPCXvtkk/uldlMB?=
 =?us-ascii?Q?j7iec16v8ioP8xltwYQgv5PbUjVpgpoS4hAAOwpBjV2wxmFNKIhTNsbEzEPy?=
 =?us-ascii?Q?IWNHUh0aKoak4F/g/G+vtu+Feb0guL//L7tTVaIyfZyqiqUoqx2/5tiyQBll?=
 =?us-ascii?Q?UVAlfeMl3bO1r2ZBe8gNIns8OKjsfq6T6Uraj0EgJ5r+a78o3vn+ESyDBfhu?=
 =?us-ascii?Q?zeF8pNo9Ihd9WY1POtDIVl7YIE+rP/qAKfuuLLTZxrXBb0TOATVkTo5I/ff9?=
 =?us-ascii?Q?PFJ/o2kOA8fJke+XSfmyM2uk7sM8jMkMNO34JGhbMilAT/Lb8A8/f0vVgY6d?=
 =?us-ascii?Q?t49yZMuM10gs8uj0NEhQBbkUM4U2aCwIXF27Z/mT/UF6ZLpRP2e/4rbwbTIW?=
 =?us-ascii?Q?dMtvJn7AI853s50rWS635q3iPkCZXLS1Fg1zRnRXgT5CTvYK57g6E1p4krAo?=
 =?us-ascii?Q?zOZqxSkFDZddPQOSDgoHRjsmd0IhUaFwzMrQPC0C+yw8fD8AWPqZRZIuf4vW?=
 =?us-ascii?Q?Rb0OanF/8fl7kWUNX/Gn3xohW1OvgRaGYN42QrqdGI7als3Z3NV/kJ1+Q7oZ?=
 =?us-ascii?Q?RTF5XLHPo3g1o8drpmBPUnOhDBnEKH6v6cT433iWHB4rKsds74Mpz2X6TiAI?=
 =?us-ascii?Q?FGWE4GG8e2KmJCZvdPdapml9Xlx1+0PRF0D4eOLp6Yl+Jh1OR776p1xlGaKh?=
 =?us-ascii?Q?AMVZyp8O1mr/fqlZ1SvJtE9gqeOiL+verx0U2dJZH3bnyOLT/nV3aleHDN50?=
 =?us-ascii?Q?iiO79gVN7VYfRubzhfd9cXJn0msnGwB060YjPtIHg2WGvoxPpdRrHtQ5R3FR?=
 =?us-ascii?Q?88inAZTOGeJKJo/tH91Q+h4Vf1uC6QWaMwaD6CK0M+IROqlo+o8Lm0WDkaNr?=
 =?us-ascii?Q?I7sJfy3dtVjNw4eMBSe7/vVmFzjykIgS+b/p3RnmduWR4jBlVjJErvIggVFF?=
 =?us-ascii?Q?SHtCfvxZghurotTh4TNFPnRHliS3XL4fWmVJGutavVrKdkKBazsRD7cPmX5g?=
 =?us-ascii?Q?bHvxruRu0Csmm3SU5kZXrqlxZzXvJrAE8Bu7MeOCSegrOQH1mYEEWt4YJDKV?=
 =?us-ascii?Q?fr8JSHJGGXvqZ7e5fm09QBjGFNdVdWaI1FtNf8ecspFi+PBOLoadE+Qudilq?=
 =?us-ascii?Q?PHtMPyQuuVvk/uYK/JQO5jJ0+i2QPD5LQ16onJK/UwYez3BTkclUq6Sd7I0c?=
 =?us-ascii?Q?nE+kJ3w4KbATwUsM2/YxqgzDjMSf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABH8lEBuiRpZUV7oAXibgx5IKgROS09+Kf8wrijLDfFDCD2i2SuZa/CkdtdB?=
 =?us-ascii?Q?qjW0BmrYKV9mwy7p16fxyrfaMk7qo1LDzUoAtitZDL5EMxWsrqmtHbWSdhra?=
 =?us-ascii?Q?km8Y0HI4Qz7/qufLuf1N2jsf1qn5np9cQVCEZUuxTI8vLSmRhv5qf2+NKJdu?=
 =?us-ascii?Q?pyoKCOuS9bqbzwqDI5tUZgYDHVxz/2+u+yb65IQ1CdLm1Glp0isdZhOhH8Wz?=
 =?us-ascii?Q?2GtH7KbeZMo/24w3ZGZrm99hgm5aU2t+cnPpo2zmCCBDy00XGfZDxIkk9sxx?=
 =?us-ascii?Q?ug8K/nwVajpMhbKm4ZB7OjgpDt0K8Un8mLVANVFdGljw3zn7WwO7q8Na3qqZ?=
 =?us-ascii?Q?wQZCVi65uqAa6OzwpQ3coK0uGw3xzRYT9FN3S/BP6hAFvNOIt8EOiM7mPvvl?=
 =?us-ascii?Q?BmOpF8zV1smGkGSweIqWBqE6/ru/kBZlniZs2puE5XejcF/kcLYqmtz5ZB+/?=
 =?us-ascii?Q?Pp9xGPmpM34o26fHJlaOsHItnJbX8YyOm5ppWN7vwKu51yCGtm8/Ns5Fj2ew?=
 =?us-ascii?Q?T2yJ6gJFZBpPhMiNO8KmBWvU74skOimnxjpV83/5Jcg5MgFNjnrkiep+KmBZ?=
 =?us-ascii?Q?cyElPaUwvrj2qwU8Ra2lqOsTisJ835ZlPgUJWZmvGT05EdmafMEKg4w7lWXg?=
 =?us-ascii?Q?cW+zbWPGEGg6jaNdtXxwcdmyzvx238Pdejny0r+EluczUHZ+2/kHc0o24JXT?=
 =?us-ascii?Q?aZ1T4R6l+2vH2dwktqrC5Enguu8GAlIZNczu26PE2Z+PK8n08R7OkhAYFzzB?=
 =?us-ascii?Q?SK+E/XncOuDwlzU9WUiOfwxxKxgDz1JYU4UqLkyMgURoIfRRFyFnvP9jU/V0?=
 =?us-ascii?Q?bsWOSkIEK0SK4/H9j5lLYLkH8JmfknhXlowPM1VzHyItlRG4OQ0OLjbc3r6u?=
 =?us-ascii?Q?EGeabztbO1HSEWvCpnlxmJgSQ8dlXVvTYzHi/o3+nR0oh7s4mDb3zzrPsk9b?=
 =?us-ascii?Q?HZCxLJ/EIh0UaIy+FqFW0DPiJ/QVIHwXLWhjyKSUpSKL/OSgo+ZWCWM6b4/F?=
 =?us-ascii?Q?KQ00HTQn4i+qFBi1oDsw3Ss4RjGAVSy0jEFQv1MROCMU2ReIcBdyMfVJ8XfJ?=
 =?us-ascii?Q?6gUQsqCOW/GJxrlssqeJH4lqbsXQEL7snRSvFreX5gLhDg8eM2qM9g0ui4zA?=
 =?us-ascii?Q?STbvA5qrIPGcO3OwlWXsvl9f6Pu3r46/nhndkKljsgkeSLY3yRADqcv4w2IM?=
 =?us-ascii?Q?XjSZhbGgaBzxGp+c5W88eJlbDbPllkACqzksPOMdmXI+bt3ggHkDMDoCtpa0?=
 =?us-ascii?Q?yxhFGTKF30y89jxGY8opJ6dPWgEIqwQDol0EOq4s9oG4ldHdnVaBuaITAz6d?=
 =?us-ascii?Q?wl3UZ4SbhCvzdD3vsk7hXeo3CObmL8JlvwO0v07HPHSX7wJeZv4bdRjSCf8Y?=
 =?us-ascii?Q?8DfJJfd2c7z6cdm/yNH2IyF+KOvPDa5dNC2PI8NEdoGKrwVhQOC8ScReWTzf?=
 =?us-ascii?Q?OSjYp8I0scPGZ8H6LMvzr7j8soPHs+vgmFnVZIJ6RbG3iuENO5lVwIDHHPls?=
 =?us-ascii?Q?BPJ2CApwyXG07tA/dqRz7cEdQQ6fkCqV5AJhmqVRpAENubJbBTjqUJgKJRLJ?=
 =?us-ascii?Q?XYR6b18wTJRoF3k1W//jGqRDfNNlRnrp4f9ltFVBBWYzvRa2n5VQIO2yXvfq?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8ae7b1-6a02-4084-4d48-08dd4d4369e9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 22:03:29.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGjrG0ZV6tDIF9qkHvivbOZjO7CZhft+PHWSUJ0MFAobotzmA6reeEoXUx3LTuVr9UptiJBfRXCItuFL0YD9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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

Jerome Brunet wrote:
> On Fri 14 Feb 2025 at 10:15, Ira Weiny <ira.weiny@intel.com> wrote:
> 
> > Jerome Brunet wrote:
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >> 
> >> Use it and remove some boilerplate code.
> >> 
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
> >>  1 file changed, 6 insertions(+), 50 deletions(-)
> >> 
> >> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> >> index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
> >> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> >> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> >> @@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
> >>  	struct clk_hw_onecell_data clk_data;
> >>  };
> >>  
> >> -#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
> >
> > I see the Kconfig ...
> >
> >         select AUXILIARY_BUS if RESET_CONTROLLER
> >
> > But I don't see how this code is omitted without AUXILIARY_BUS.  Is this
> > kconfig check safe to remove?
> 
> Ahhh that's what this directive was for.
> 
> I thought it was really odd to have an #if on RESET while auxialiary
> device was supposed to properly decouple the clock and reset part.
> 
> To keep things as they were I'll add an #if on CONFIG_AUXILIARY_BUS I
> wonder if this driver should select CONFIG_AUXILIARY_BUS instead ?

I wonder if .../imx/clk-imx8mp-audiomix.c should be conditionally compiled
based off of AUXILIARY_BUS?  That is what I expected to see when I dug
into the Kconfig/Makefile but it is not there AFAICS.

I think for this patch it is best to leave the kconfig as it was.  But it
seems this is a place which could be cleaned up by the folks who work on
this driver?

Ira

> 
> >
> > Ira
> >
> >> -
> >> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
> >> -{
> >> -	struct auxiliary_device *adev = _adev;
> >> -
> >> -	auxiliary_device_delete(adev);
> >> -	auxiliary_device_uninit(adev);
> >> -}
> >> -
> >> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
> >> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
> >>  {
> >> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> >> -
> >> -	kfree(adev);
> >> -}
> >> -
> >> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> >> -							 struct clk_imx8mp_audiomix_priv *priv)
> >> -{
> >> -	struct auxiliary_device *adev __free(kfree) = NULL;
> >> -	int ret;
> >> +	struct auxiliary_device *adev;
> >>  
> >>  	if (!of_property_present(dev->of_node, "#reset-cells"))
> >>  		return 0;
> >>  
> >> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> >> -	if (!adev)
> >> -		return -ENOMEM;
> >> -
> >> -	adev->name = "reset";
> >> -	adev->dev.parent = dev;
> >> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
> >> -
> >> -	ret = auxiliary_device_init(adev);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >> -	ret = auxiliary_device_add(adev);
> >> -	if (ret) {
> >> -		auxiliary_device_uninit(adev);
> >> -		return ret;
> >> -	}
> >> -
> >> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
> >> -					no_free_ptr(adev));
> >> -}
> >> -
> >> -#else /* !CONFIG_RESET_CONTROLLER */
> >> +	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
> >> +	if (IS_ERR_OR_NULL(adev))
> >> +		return PTR_ERR(adev);
> >>  
> >> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> >> -							 struct clk_imx8mp_audiomix_priv *priv)
> >> -{
> >>  	return 0;
> >>  }
> >>  
> >> -#endif /* !CONFIG_RESET_CONTROLLER */
> >> -
> >>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
> >>  {
> >>  	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
> >> @@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		goto err_clk_register;
> >>  
> >> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
> >> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
> >>  	if (ret)
> >>  		goto err_clk_register;
> >>  
> >> 
> >> -- 
> >> 2.45.2
> >> 
> 
> -- 
> Jerome


