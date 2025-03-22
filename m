Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C6A6CA2C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 13:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5C510E0A6;
	Sat, 22 Mar 2025 12:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYK7Rozc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CE310E0A6;
 Sat, 22 Mar 2025 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742647894; x=1774183894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WUmytct5+22SxamonNyzUbNMXoOjrPfvcB4PzUYwkDs=;
 b=UYK7RozcBRBj8W8qmRSpdFZ/hSyfo09E+IjfmeoogntFfneFZd7kKECE
 xqVKp7BefHlIUF06XyUYZkvMO5K18SwEfvs/GE85LkXvwNtmKWkJuqNsS
 EeWprdde8waYHsMABR214Ma70OoiLNUD6dlVhGU5wC+6ySKpVekWfaR5p
 RrS1diJZxOunJidCEjcuOgdzVLaV8kMGQrTyTdqztjK4cUgYQcfpPXp8Y
 Usk53H1qOWwPtTe9m7bxzkApuR1ar+jro9tjK5Hd4ixfACpMHDP5AjDI2
 wIl0/kpk87Wlq+iqb1fL+mF3hDY9pJdzTOyfDnDJ7usVcUQHz0IqGpNva Q==;
X-CSE-ConnectionGUID: wkx6/cBETlKUdoSu05VdJw==
X-CSE-MsgGUID: NG7P4J5pRHWoy57PIEwHFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44089381"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="44089381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 05:51:33 -0700
X-CSE-ConnectionGUID: txTXgympRw2E0EtvzI/nvQ==
X-CSE-MsgGUID: nZAVJYRgQzyojge0/EEyjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="124154687"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2025 05:51:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 22 Mar 2025 05:51:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 22 Mar 2025 05:51:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 22 Mar 2025 05:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4ZX8hwITl7S+wYbDuT1rLbDhDDfxzkqtqMBgEhat2WZTIU0C42ZH+kvcjRoOOZIiTMlu7ZLQ4qPdAmtGh69VBv5l0m7rO+p0P7d+VS7wFxlJgMW3S9brhAO71vZKDCttHuVccfkUjR1t5ZczhrFnMU21AbDdzLhpgbgVARKY0SqRmL36No/fr0MLo0DVGHPQPSqJEuCH5/PxUic+8CCIcz7x5MyjOEpVx0FS8zTME1mVc5N+9avdKNW1bjL0mbDubj4MtrFvKOUmRg2Zqj7loQHNA6y7ZZ6NpZme7qUVzCid1wP27YenDCw4V/MRUYiGtPSeqdAXTdikBOMY0ZS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtAWwiRgQCP6LOAesixv9Gv3h6/rFdHD14H/yi7UfWw=;
 b=lZfYwPileU/JQtnImLabtNSev6OSCeH0A8MbYu0HPgPNU76qKtM5h2M3RJs5HOZMEH1ELsYZDInT3TGacS3HMh+O07LLdkKsxzReKhXcDubl6HVNlUrEnLQWtuIjRSMPnNB0zvyGzWSZ4SSYVgNNauCvZaFCTiEco7E2NZBqyYLkJOdAty/oPDcHT/dC/Un0+ck2XGKooHnQWMWxH/M8HgrRTUPE0Z2ECiyUSbqMIVEUFkbEqdhFKpZ6DDEHPl6pt7rGAD4f/pp1nkpMuhSUYEeaLk59yUoYjcyNB3cFQYvw+3AF+eB3Sy0q20QYjM1Vef0pSn+s1q+od1W2dcHrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Sat, 22 Mar
 2025 12:51:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.036; Sat, 22 Mar 2025
 12:51:28 +0000
Date: Sat, 22 Mar 2025 07:51:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yue Haibing <yuehaibing@huawei.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] drm/xe: Fix unmet direct dependencies warning
Message-ID: <2p7zbqflqj4khxmwofotnn5no5vo54yq5wq7z3j6etntkg3b4v@wym3efsfrx4o>
References: <20250322095521.4153684-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250322095521.4153684-1-yuehaibing@huawei.com>
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 4422b810-6540-450d-74a9-08dd694042d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?elTiY8J+ePFQPA45LQT95HPAwSEzOkY8Blj26vRw+h8K/TEKNN+GNfVuykaU?=
 =?us-ascii?Q?qPmKAU6LRWQZu6CIdAbSnVkAEFmbJwWk38bzqhtbKYkVTRWIzw902H3vVgNK?=
 =?us-ascii?Q?7nzuTLkdH9Abd/46Dp+6bzCqDsTOflzXL9c2UxMOC4Nxw8RAS0uut+AYlzqj?=
 =?us-ascii?Q?+KmkxQMHmglO/MFVsQIK7enQAdE0yGVySOGOhdjUjpw0l4gBliSZEp7O8Q+9?=
 =?us-ascii?Q?PbiZh/HVD1e68epPvYLqunuKxc4xK4G0ypobL3pG0/g+oKzxYuNo0E5UtjwT?=
 =?us-ascii?Q?wiSCPhLENIRUMk/R+VXAP31zRPH6WIQDZliyFfPBWm7JJZgbKhg07SebXd9g?=
 =?us-ascii?Q?uJAGs0TUXMlC3rTNcatcZB5OupqQNLTPl2oWGU3oKQWFGFrAtMlvXJHJLXPB?=
 =?us-ascii?Q?TSQiPjv5E8YkGGbBO/IbMtzu2Olp4/K+kKaG/E9+Paz7Oxf5DNIkn1Nd452a?=
 =?us-ascii?Q?D0IMOjOyHioBXtzuzAjlGYvRJL+hawgqiXGHfhYWe5pdHrT2sJf8foJu4Ga6?=
 =?us-ascii?Q?uqDF+6rn+F/xewGcqKUnhebAHv7DiZyLow191QnV3mmreDkjN1DgoK/qmiDT?=
 =?us-ascii?Q?1nPvqAepVc4hNXfjg0ULx1naTlJYXm5X3mZz4YJPqP06OFszgv6040GqbyoR?=
 =?us-ascii?Q?VTrddEKe14WNkwhHml8rJxqtW/nLIqFFKe+4uw6mH9QAT4oczKgO1IHa0WS1?=
 =?us-ascii?Q?/GB3iB4dXLIdu5Bk90NvmmKtHEZun/QAXKdRzPYPydlm+Fy/Ov8XfMqUC13f?=
 =?us-ascii?Q?S4nUJ3k6D0jZQTl+696LvXMWUqY3tfLK8z7sJj6MDWPWZNs+EzlPsclkx62z?=
 =?us-ascii?Q?R4fu5GDmxZNfSFsFTOC1sO6yAo8NJs85Tqz2XqeNd9sWuvK8w39LZfnRbzBR?=
 =?us-ascii?Q?8FT7wucuNTymDsHk8VT6vT0Jtb3A9g7WXeEX1RqoMR46660Xmx7kEnwCoSDG?=
 =?us-ascii?Q?d1CQ8inwwTa/KkjkCkkD2rilY+TDkTQd2Wycm/jnw+3WCgmu/zNeWqQUTFGV?=
 =?us-ascii?Q?VwyhtJ05prJ0xt8/YypqXJE1wbyMo8QlLLw3C1jL6Gu0rJ3a/LL102SW/1b8?=
 =?us-ascii?Q?ahIsDd9Guo6gHF+CoXlm65mkFzGHEqkJQbJXbt0dv7k3u2WeLTSXQkDIfelr?=
 =?us-ascii?Q?g/ipsVq/XK7iKuC9wPR7iFPq2yfqpoKlCmQaBjaMi9A8Yye4eQft1rpg8sID?=
 =?us-ascii?Q?eu7QtwVf09OMZ8zjXiyqnqPL/+BbjwaWw1MRluVJfJWBrTRD/HGAhUnceQ2h?=
 =?us-ascii?Q?Lc4FIJ/Gn3lTGkXW/GqtEVnyL6w40SoTg4xa4h/rSXOJCfVfIPTNoi+bed16?=
 =?us-ascii?Q?gTEa6Z8DcZzubDX5F4MoMfm/PxoU4x2cprXMGWst+Jp/okK+l2UXRBI8EYjv?=
 =?us-ascii?Q?K1rUAiZZKK2EvCs4ATOPY1DSysCg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GxrUUGcZnJEZIXOx7XjFWcOozelZPr7VpeZA6a9Iwe/u2IHhbnnOn3kQ2+D7?=
 =?us-ascii?Q?JRrdrC5VLWwXM6fiZ6iYrpxLitNyMT1opiP3ekdg+JCNbKfzUOwfRLkR/jtJ?=
 =?us-ascii?Q?3c0zDpKTKpyaXoA/dolmvhOMV1jNhYyY0zErNIRXprzpQYJ53OPZIlTPywB8?=
 =?us-ascii?Q?oqqqqelGpsM6tZdUk8YmKzxIK/nGU0ilz7eC1E3pcVIXBT/mONMi/wuJG3jq?=
 =?us-ascii?Q?3fhoqwDtOb36WoPPgbBmMPvVft8tZyHeDV/cxPtw/zUPCFdi0I7Au0JaUML3?=
 =?us-ascii?Q?3ORXTWudoX7LpFSHO74O7FeReBxZQ55/H7ITYtv3lv3jL73GTSHbyMRgOsTW?=
 =?us-ascii?Q?EeGCdvI/Xa0nQC9+DpLjQ2OBflqlwab6vIiBp4KRfMBwgQPsYysIhQ9gDAFP?=
 =?us-ascii?Q?gtcN7lvai42SMZnY88cmq3e+mUxeyhQjrskAYXq1NTtKmnlkrLUdKpxOf3fo?=
 =?us-ascii?Q?+9Tw1fpYXaJyo9RjzjIDPir+gkNpp6JHvFnD6gQq1/eL4Yroku3PFG2BvXMf?=
 =?us-ascii?Q?9bKscb1oIL/XxvcNstmmEYwTjbuDpoJF/Vv6GEQmhuta+3GaeLaoirclvKSG?=
 =?us-ascii?Q?NBvwfPEgIxwPwmKzUT5/b8Uk004ws3cmJH5SHXv9dWRS/17lVQutrotV6OTW?=
 =?us-ascii?Q?dM2Z9oZ56uwimWOvBDQoPhl9QmcT/8p2rNLYC2mu8J0x3stYe7rCgs0aqjKo?=
 =?us-ascii?Q?VMEKZztjGQflAgepDKQ0dRJZZgQluRTSE+h5X/IYq2EEht9iJtsBQeSAxwDh?=
 =?us-ascii?Q?7jrjNvPb3cd3dx5QWhpBQZRsGCgNrgeYBX5NfOgAzhqkARoud6YM6HDgQlr6?=
 =?us-ascii?Q?YTi/DlotPYjaAgKNztDkf5w3Wjg3zcF/WRyHsWXYhWmo23Hux886z+jptrab?=
 =?us-ascii?Q?qTnnMUwuEXmcYSRqIFR7ZMXZ73as9xx3RAGvLSNp9tlSUuZIObot5llPrHBR?=
 =?us-ascii?Q?QgclQBCSk4LDi9OwqpNoZibBV2kc0RQX5NO/VX3bsb9F4MI2KNZRmKmoBShT?=
 =?us-ascii?Q?PAz7k0jHVey+/nwGalow8Sk5+7901zTBGbp8TprXfKZdPzonWFVd2SjZXo76?=
 =?us-ascii?Q?e6PyQr10i9fypplOzM9Ap93m0iRN863OD8yCrcWJtuUxV86g3MxpIoWeYihY?=
 =?us-ascii?Q?2ThMEan8Tf2l3DxI+EBUw9aD8qAjZRWixwjmUD9uQvnnBp6gE7vIICTshPjJ?=
 =?us-ascii?Q?Tl0cv/qWPFU+4Ll4eplIuqqo5UsP7mDT1g5MlsRPSvofNtSyLek3nBC6G0wk?=
 =?us-ascii?Q?/Or5l4OuoKcYpwYNrbA00G3mVNrfeRsxttSfa2zYSn5HAc8NGzQUWG27tQb9?=
 =?us-ascii?Q?+HAtLItRMywQOsETuFHg8HVQ2qeoV15vckiACYXBJwPvX1orkQoOByvUnuWc?=
 =?us-ascii?Q?M7s8ObHcwXwQHEay1q2CHF6HHp8HQOjOaKl3eKPCrXCSP3F74aUAFagpjWdX?=
 =?us-ascii?Q?K7Uy1ivOsZT5lGyccczLV3s1lMlEenskgELAs3zl7m9AQwcfW+Y8CZ8eLUGW?=
 =?us-ascii?Q?qS8jLCyqLPyZ895s7Y4leQpMOhHFMKTPXSyYR4mMyfvDU45skRxodPGYUIhU?=
 =?us-ascii?Q?5+EVXuYrKL3L1IZSaDjdDkCEfQ1G2BQ+9l7gsbH+v3r9xjWnN6JYYaO0NbMY?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4422b810-6540-450d-74a9-08dd694042d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2025 12:51:27.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYsRhLtOHu43SV/Hj/n70mc99aoMyByAKOSUSswD/KsficI7D/cJqM5E3oHlDIhcYaZMTlkNZEvbcS31Bd35U054zIAc15wurcZA6ZAv1/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

On Sat, Mar 22, 2025 at 05:55:21PM +0800, Yue Haibing wrote:
>WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
>  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
>  Selected by [m]:
>  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
>
>FB_IOMEM_HELPERS depends on FB_CORE, Select it before FB_IOMEM_HELPERS.
>
>Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
>---
> drivers/gpu/drm/xe/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 7d7995196702..fcf324f37d2d 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -53,6 +53,7 @@ config DRM_XE
> config DRM_XE_DISPLAY
> 	bool "Enable display support"
> 	depends on DRM_XE && DRM_XE=m && HAS_IOPORT
>+	select FB_CORE

other places in drm, including i915 where this is coming from, use:

	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION

... and don't explicitly select FB_CORE. I think that is sufficient
following the chain of selects which ends up with DRM_CLIENT_LIB
selecting FB_CORE when DRM_FBDEV_EMULATION is set. Does that fixes it
for you?

Lucas De Marchi
