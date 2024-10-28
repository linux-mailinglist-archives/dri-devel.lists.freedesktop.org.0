Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE19B33F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 15:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1722C10E0E2;
	Mon, 28 Oct 2024 14:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLYwtYGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A0288C11;
 Mon, 28 Oct 2024 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730126938; x=1761662938;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cw6SAJA5IYUqbKzd1Cx5Vh1JBhS0enu+MZ5+d9UFrHg=;
 b=eLYwtYGPvU5kB8OBlPPdJbnlU986uiK4nQVuvIkTZ4xHtKLaja/Z3mOS
 I+iUaTmnxpCIOohhF7FUd4NNFHdVzsfAmbacnvfSbQuDuJW3c0jQ/Rb8u
 ILtIE3JQCXUJ/22qKcdYL8T2GAewIa+ztSh8/pa95nSZVQjy0xUS5UUX4
 +14OK+u9ikezj6fuzainrUau5OLi0FsemVCCtoMtztLotRGZ7t67PoIU8
 W5v7nNP8gJrSt+R3PHzWC6On3Rvw6V1XgjhtZDpeQNdJo2aCG36rK5yxX
 RCYGy5CNBZhaobvCBzBSodISuQ+rQH01UuSzS8NYhdhUI8cCZ5N5au4D1 Q==;
X-CSE-ConnectionGUID: X5HJdoDwQ7mg7Dk0MeZLGg==
X-CSE-MsgGUID: 1e5t4sspRbqnXrrl1sYFNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="40302220"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="40302220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 07:48:58 -0700
X-CSE-ConnectionGUID: m6ceXjnaRxKN2eWiYHobwg==
X-CSE-MsgGUID: 48WEsU+pQb2LiZdfX37JLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="82066961"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 07:48:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 07:48:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 07:48:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 07:48:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANJLsmv7QM6yz9R9NucbhYcg+U3WB6mHhBOHtx3ShwgX50KEbFi7waVYnJALEDCTTEqi6VBSJPlIu5zFMobDKvkCdbFUeWd+6qIxLDmZTNP8xYhBaKRTQ/rYt+Fi1TzWVL7A5VF5I4eEVKWjcNSoDiHqiKphMB4cX4CngnOhfvjnaDLG6Dt9ZLGgvzQZRuhE6aiPXYCtoxE7x8R1Y6ZsPBsh1EVp05szXvjY6chiGeaMTfXoOsjx8E7I2hRT+MfEccQM+3sieBTl6I0GmEdBvqixhEUxEAf99KEIDEABqPzOQ415Cml9sq+oJQKMdDBHqDiHOz3fsJvyGX4kfxz+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6HxlAA7tBMJLpaOwMyvKZAqTtAJIOw7TD4jbAEasYA=;
 b=cCNRe7G0giwFVzpvO09kxEKtrP3/KtnahKnkzarnE/qzZbQmhSEwTQLRA2481ObqKACdzEwPUcda1A5TxUlK3kj8YcDXqlHJEqe4YJz3M+cDk2AnKrv8477vxmnqffaF6/KtH7J0iHPukrgcthpzOYgG+86hiEJLKLV/qSv/5bipl+DIutO/Oxv6jg80Ms4t4xV7nVUbIU39Lck38P5dzwcMdcuWEb140yVHqEhdT7JIjL8r0LCkAULtKY/4nYrrRgTUVO7J9Zhq4ot8dnHf9LWwPa3m/+0kiDm/TDrMzucKjkr/4L2BBmnYLih0hAa/OCAXlEhI48aV2dAyvgJKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 14:48:53 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 14:48:53 +0000
Date: Mon, 28 Oct 2024 10:48:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/10] drm/xe/nvm: add on-die non-volatile memory device
Message-ID: <Zx-kUAlr0CVVtJXT@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-10-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241022104119.3149051-10-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR04CA0320.namprd04.prod.outlook.com
 (2603:10b6:303:82::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 811e9a82-173a-4bbf-23a8-08dcf75fa479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Olz4jBmiViYyiUWgpP22e+jvVuzXgnYXln4IJkzdijgHVaiEN4Sdn6Gp4Ket?=
 =?us-ascii?Q?N0tzOXxvksMUHyJy8DRsi9sa+449v7e6QcwovXUBVKyVgb1d6lJgcMhyWGXA?=
 =?us-ascii?Q?TuZL19Z9cObmtC9u12U/7/7eJSSzJxbFjAs/dKd+clJIVvr0c++h2ZnmV28k?=
 =?us-ascii?Q?QbNQwF9vNrzcghucVXZbhgC71M2VAONEUPxHsAEBqIeDwqWDss/uy3KLHnf6?=
 =?us-ascii?Q?9vXU+xzVF5b6GONloCjFDlb+PSU1Ao0r9JBYAmGcf4Ffama5u96wgrs0aePg?=
 =?us-ascii?Q?NczddMT0VOSFjDwqUSu7ya8ixbdd8qfHHZZeVVPu4DNb+AfmcLbe1byzd4yw?=
 =?us-ascii?Q?UneK1rJjvYmvclwT1iLDUY0fS7rwJXVMyZ5j8yi/4rQHTb+0/MyF+FCMtBq/?=
 =?us-ascii?Q?xkOmlKB1gIJEqNGVkfG946kWpCpu2kozXjlbbgQgeW4xw+5P0A/D0S853wcf?=
 =?us-ascii?Q?D+c8XNoIkEFeX+OBfBV816W0c04nqxoYlA8oN5I+Nm2fvqpE8Uj3+k1gpqTM?=
 =?us-ascii?Q?10EwTVvGphMr4rZPEUazGZBfMkrgI/Qe1MphmzpoI+A8TSDdyeiDg22PxMe+?=
 =?us-ascii?Q?/AtypgT/YXoebx+y7nCBfMNO1xY/KRVIf3n31O//poYOqyxwXS6hv2Tp2BCZ?=
 =?us-ascii?Q?8n6MwEWphMDKTTKh6Q5s0ghghNq8c02NyOfDpo7nLExpyP1sAW5OXw+eQmZj?=
 =?us-ascii?Q?6oOD7BkCnHFhFBz/A1yZ11QQM1Uwb810ZwgGL/VVI9SSVrzkX+CBVIrj3DZJ?=
 =?us-ascii?Q?/7GpBgzb3b0WsM32nj1c4cVo4T1Oi0/becPEtJZmthopw45KzVS6LoXFR2uF?=
 =?us-ascii?Q?tzQIOtNM8nO0GyzIq7zDkx+mwvaFi+soyaDiyfLrIc4AkSVsZKXAJiUk+n1S?=
 =?us-ascii?Q?zHQ1aK4RwbQ3/4EOWipOaI8m9onpPWPBPTI1F+Tp17xuheXee/jyycaJgur4?=
 =?us-ascii?Q?mJSBSNL93dG6hc1bqAih5PczzMk1nScGNHNIFp9FWv9cGUKgPVdHVH0cLcnc?=
 =?us-ascii?Q?NbRO3gCKXEy6yFJI/X68UX+Uy1wYUCzEHC4qDd8Xtsw+5tPaTJLOcGkqQp6V?=
 =?us-ascii?Q?b9wfl2aYQvpiORgA0wN/EApOmPD4fGfUCvuT+pxdTV2dLojT4BS+/wNZcggN?=
 =?us-ascii?Q?vovLWj3J4TzuT7WXLCMeekkQsDqXg2tBKAsEx2ff2BZnujONVsmm+CQbS+e1?=
 =?us-ascii?Q?dLcj2zKJOV+umeVcCNmhi+iWAR6QM+jSZZqUj3J/CNyAP5Ljzyp/99q07Ms0?=
 =?us-ascii?Q?LhECGYIF0rTWI5A77WSbD/MT1urRCExWoMwAM7Eb7FfXOBMok/RTRwmmS/Nn?=
 =?us-ascii?Q?pClfwrb3q5zHpx48g2JEzNc9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ytZJS6DDkKhqAGJupcc9TUxoLAoqLUGl2kyJ0EzWvQw+N7sflOaCM0Et0oc?=
 =?us-ascii?Q?8QuUpPVuy1LCPYak5Ot3vDB5VUkFQdgjtnFgZsSlzs2J5uxi6Mqete5sRDtj?=
 =?us-ascii?Q?h7S6P8ws1T+8aqf10mtdS3ghxBhcgnY/VEPZvglIPcV73iJc6OcwPonFmnEo?=
 =?us-ascii?Q?Ft+LRJW/oB7m7z3+AXjp4Tav1/L2qfcnwxl3dn6lwLbQIFhwX5vQXRnD8Yi+?=
 =?us-ascii?Q?oweuXp4jUO3cWaligQYkV3SLwQbPK9fkkrqwXozdZoGQ1dem53zE0g32fUdv?=
 =?us-ascii?Q?SGnTBV5o5sqVp5u0n4eq6V5FFBJVsguyHsVJ7889yX0qfkBA1w33HIEhsHNJ?=
 =?us-ascii?Q?TRVq4hvG7RoLwYq1q7aB379PS4V9LNk+/Eou29yb09QgbAsD09i2/uK/yXlE?=
 =?us-ascii?Q?W9bknSK0f2bdO1JOkYFkBzmhLTgQI1SVx6F+QipiA74Kjc29evjmVfftx/aD?=
 =?us-ascii?Q?DalgT006HZOtAo3GN0ZpSDh3QJzVcq1cRxKbtBxDIt4BcdA7Wz2S2KIQuYqx?=
 =?us-ascii?Q?iyKn3pB8/yOdGhzbYIblENm7HJJSP0Lb+KY/cCc9/Fxr6ryoLPSVGEDu5zh4?=
 =?us-ascii?Q?t99Jw44j6GTKEsXQ6/L2q7YaWARcyAcd3QVgNFSMweRcTZjU80Y2zb99TRMg?=
 =?us-ascii?Q?Rv4hN6rO1ODU2sI/AWaqdRMtpo5/5TfEyFvja07R1VNQOwjqoZuvsc5ITKuA?=
 =?us-ascii?Q?JnS+3WmL6fZrh2E73oiv8CG+bxsNC9oklxUdQdlGLpJEV4gnMF3ip3lEoBnv?=
 =?us-ascii?Q?puGSZ1RW4/Y1tG20UHrX79C7hkpqjvHXCDzcpG1h0UHuQoaeZeWKoRW2w2jh?=
 =?us-ascii?Q?3nP/4JWTUfLJohYkWA+W2xmKkVFiCIclsNmNhJYozBHMxYq/9mkL184zTRoJ?=
 =?us-ascii?Q?F3MYGWYZeQ6EPx2NLmtcfVsQsPeQxL0ox94rF9CKwNjuUTfhu4AaW4a1zb3H?=
 =?us-ascii?Q?6IdyPq9C+hCo/ilxTr2XvMl5nO7t1yctiHGCR5urhYGVuklrEb8xbnxnruOV?=
 =?us-ascii?Q?+YGmUKy1YQkPq2i1wYVVJiAPWOPUsEd6JM0nMu/MXeeEGjN/kfwzqFK9zmS7?=
 =?us-ascii?Q?7ScJQ1QMl5C02bSQEil3VsjUTyUh7VliAaxW+DArLNte5zi6ylAHGXh40OF6?=
 =?us-ascii?Q?I4ZKGXp5rNlahIBsFDMK3h3w+2EfROW5XUjTked0T/85hI3aBDNSzMnSqmM6?=
 =?us-ascii?Q?6Didj5F1N5CjEmfWSG/PobAWBvNNdNUfnRLFtitxLF7iBkly6RInN+kxLHTk?=
 =?us-ascii?Q?93HQgLcx87xuj8NIqD6Ao23gdZ6lxhpIqHHFe1lWySVHODxmlcBCJOZS2mQw?=
 =?us-ascii?Q?RzbFqCAhqqRffCNRZ8HLHMX7XUcozw0Xd5fATW2FkrZZzp7SbrUXGt639g50?=
 =?us-ascii?Q?ZHKVKxj3cs4832BRpXzzvUqrtXn3YLVnjUTgCMdfPz5VrwpNbxSYOirv2tjR?=
 =?us-ascii?Q?Pq3VMTclc9CUdGqKK0awkcCSGqlUgfm5jtTJAL86wW2QTvaFI4e/JmMyMhpv?=
 =?us-ascii?Q?7ygSpAoeyGtVzmoWNb5Rioff1VLq+liWiVsWcNKXbochKE4r97kMqjkYlYqW?=
 =?us-ascii?Q?/zoTIRzVvrm3qfq88Zq9b8TdS9Fs4XUYGndemu1oAlQbv/yiinCKeK17KHU5?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 811e9a82-173a-4bbf-23a8-08dcf75fa479
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:48:53.6077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6idXt3g8Me29VP2SRE8USP1yBhVcWMgaBE/GP3LeZR523Zt0+3MveZVKl7xVXI2S3PPOPR//zp9TjVHrpPhOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8280
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

On Tue, Oct 22, 2024 at 01:41:18PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on DGFX
> with GSC/CSC devices via a child device.
> The nvm child device is exposed via auxiliary bus.

I looked at all of the i915 and xe patches here and everything looks right.
Just a few common doubts before I put my rv-b here below...


Starting with the one from the other patch. Could you please share some doc
where I could confirm
HECI_FW_STATUS_2_NVM_ACCESS_MODE bit?

more below...

> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h |   8 +++
>  drivers/gpu/drm/xe/xe_nvm.c          | 100 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
>  drivers/gpu/drm/xe/xe_pci.c          |   5 ++
>  6 files changed, 132 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cb6c625bdef0..4225a654a937 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -94,6 +94,7 @@ xe-y += xe_bb.o \
>  	xe_ring_ops.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
> +	xe_nvm.o \
>  	xe_step.o \
>  	xe_sync.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 962751c966d1..844697f79eee 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> +#include "xe_nvm.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
> @@ -743,6 +744,7 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_fini_gt;
>  	}
>  
> +	xe_nvm_init(xe);
>  	xe_heci_gsc_init(xe);
>  
>  	err = xe_oa_init(xe);
> @@ -811,6 +813,7 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_oa_fini(xe);
>  
>  	xe_heci_gsc_fini(xe);
> +	xe_nvm_fini(xe);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 85bede4dd646..ec3d82f05519 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,8 @@
>  struct xe_ggtt;
>  struct xe_pat_ops;
>  
> +struct intel_dg_nvm_dev;
> +
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -44,6 +46,7 @@ struct xe_pat_ops;
>  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
>  #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
>  #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
> +#define HAS_GSC_NVM(xe) ((xe)->info.has_gsc_nvm)
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>  
> @@ -331,6 +334,8 @@ struct xe_device {
>  		u8 has_heci_gscfi:1;
>  		/** @info.has_heci_cscfi: device has heci cscfi */
>  		u8 has_heci_cscfi:1;
> +		/** @info.has_gsc_nvm: device has gsc non-volatile memory */
> +		u8 has_gsc_nvm:1;
>  		/** @info.skip_guc_pc: Skip GuC based PM feature init */
>  		u8 skip_guc_pc:1;
>  		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> @@ -502,6 +507,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @nvm: discrete graphics non-volatile memory */
> +	struct intel_dg_nvm_dev *nvm;
> +
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> new file mode 100644
> index 000000000000..ce56bff1268b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/intel_dg_nvm_aux.h>
> +#include <linux/pci.h>
> +#include "xe_device_types.h"
> +#include "xe_nvm.h"
> +#include "xe_sriov.h"
> +
> +#define GEN12_GUNIT_NVM_BASE 0x00102040
> +#define GEN12_GUNIT_NVM_SIZE 0x80
> +#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
> +
> +static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
> +	[0] = { .name = "DESCRIPTOR", },
> +	[2] = { .name = "GSC", },
> +	[11] = { .name = "OptionROM", },
> +	[12] = { .name = "DAM", },

Could you please give some pointers to confirm this base and these regions?

> +};
> +
> +static void xe_nvm_release_dev(struct device *dev)
> +{
> +}
> +
> +void xe_nvm_init(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	if (!HAS_GSC_NVM(xe))
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(xe->nvm))
> +		return;
> +
> +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!xe->nvm)
> +		return;
> +
> +	nvm = xe->nvm;
> +
> +	nvm->writeable_override = false;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "xe-nvm aux init failed %d\n", ret);

Since these are inside the i915 and xe and you have our drm private device,
I believe it would be better if we would use the drm_err and other drm debug
variants here, below and also in the i915 patch.

Thank you so much,
Rodrigo.

> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "xe-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}
> +
> +void xe_nvm_fini(struct xe_device *xe)
> +{
> +	struct intel_dg_nvm_dev *nvm = xe->nvm;
> +
> +	if (!HAS_GSC_NVM(xe))
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should not be NULL here */
> +	if (WARN_ON(!nvm))
> +		return;
> +
> +	auxiliary_device_delete(&nvm->aux_dev);
> +	auxiliary_device_uninit(&nvm->aux_dev);
> +	kfree(nvm);
> +	xe->nvm = NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> new file mode 100644
> index 000000000000..068695447913
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_nvm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_NVM_H__
> +#define __XE_NVM_H__
> +
> +struct xe_device;
> +
> +void xe_nvm_init(struct xe_device *xe);
> +
> +void xe_nvm_fini(struct xe_device *xe);
> +
> +#endif /* __XE_NVM_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 64a8336ca437..85c419eea710 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,6 +60,7 @@ struct xe_device_desc {
>  	u8 has_display:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
> +	u8 has_gsc_nvm:1;
>  	u8 has_llc:1;
>  	u8 has_mmio_ext:1;
>  	u8 has_sriov:1;
> @@ -282,6 +283,7 @@ static const struct xe_device_desc dg1_desc = {
>  	PLATFORM(DG1),
>  	.has_display = true,
>  	.has_heci_gscfi = 1,
> +	.has_gsc_nvm = 1,
>  	.require_force_probe = true,
>  };
>  
> @@ -293,6 +295,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
>  	DGFX_FEATURES, \
>  	PLATFORM(DG2), \
>  	.has_heci_gscfi = 1, \
> +	.has_gsc_nvm = 1, \
>  	.subplatforms = (const struct xe_subplatform_desc[]) { \
>  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
>  		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> @@ -324,6 +327,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	PLATFORM(PVC),
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
> +	.has_gsc_nvm = 1,
>  	.require_force_probe = true,
>  };
>  
> @@ -623,6 +627,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_mmio_ext = desc->has_mmio_ext;
>  	xe->info.has_sriov = desc->has_sriov;
> -- 
> 2.43.0
> 
