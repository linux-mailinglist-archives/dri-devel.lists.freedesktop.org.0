Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F09A450ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 00:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E4610E820;
	Tue, 25 Feb 2025 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLApLRG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58B10E81B;
 Tue, 25 Feb 2025 23:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740526404; x=1772062404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PAc59BRxSBh7sc07oao8fz6uVSaAjxXIk54kAMtHjmA=;
 b=fLApLRG7zr0i2bihXC9ZINzKfjiTAAtSij5hxDdsQlXo4C/NFCXhGkJt
 gKKPAk2tbCoHxSLTB6n5FiM779U67QQZ0eg6KEpm61z5fGcN8tRRinObG
 DFSNocMNPES95h3BHhRbQVS7PGzYooDatRFjNOV3i0Z2wmgnjS61bXpyI
 UTin6uecY960X/g7q1YGJJ192UHfYSlvBoozTAuR4IeyMxX3ocFcWKETG
 01yGcGrkxdjIwVqXWI9mvhUIVplV2SdgJaS70E2nacj5Q9yqUN4z+NZdQ
 um86wec6QenxQ1cMEVQnkFINsYawYeJikLiEMGBLYtvM6osGx7Ca0uk0F g==;
X-CSE-ConnectionGUID: fm/CBTQnT3SmdDeNYECa/g==
X-CSE-MsgGUID: PsxNqnjtRreneNqEjN9/wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51990140"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51990140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 15:33:24 -0800
X-CSE-ConnectionGUID: um0QgmZxQAq76IU2HuNFtA==
X-CSE-MsgGUID: T6oHWQKFQ3u+y15IszWSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="139769265"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 15:33:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 15:33:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 15:33:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 15:33:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDeAkD/+emrQtd8sicAjcSCpzE8c28Tq9vI2pbJJzjKHINj3OIyJJiqS95F4UF6AnNdkBO1OF2McSh4lrU5BkRGVmVm+Ra3sljriqjFog5aRris7yZj4VF9o6IFUr1Jy75HgU0C9kd6Xd8YlqwAxAFbJqYxvK3lBFyOHBTzbAatp/77BJyrH7C3XCwXn4Qkckr1ZijRJ+pBKH0oBVyAsgkF9su6GZBmhkLVV+Ait1zgJDa8q2I/osfeIo3eBLXk64p2NoqUkuKZFojmpXSW2zhYK2uVF1zGRZ/bT0eHsV0s5JGgS2bnUx0JjFpMw30jPDRwo+0hJqgYmW8/mcvs3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7b2UNWM6Pmq7OyJSZoYrx1h+6Lxg6YEjO3p2hYAnv0=;
 b=TRBW/XaPCt4kWqH2yQXvRDAR1RCGXew/VJpj24gJRy2TAsizENyQg+3+DoSmOaLxPWQLp8C2ArQJG0sXWdjPCN4gLVstoTprMImdV5TCgwY+OxgFmlL8/3Nu0VorVe9JMTL0NYSvbt0YsLoM553TQRTb/DCR3j1EtqgB+11JYs4NV/W+uksok2YJJ3nnH9JSKNamCMYxemgL72r+pk2n7MsDnj0TQNC/nrWzSRGro/5BQJgD+qa4rdVl1lxBZsbG4KStIfTctxeOds53Dd1iDtoId7aST+aDn1bv/J5+i9ctiURGD3TzhNwMQfobSNBBQ7Gh1Gl/67N6zWuqLT9ITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 23:33:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 23:33:00 +0000
Date: Tue, 25 Feb 2025 15:34:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mingcong Bai <jeffbai@aosc.io>
CC: <linux-kernel@vger.kernel.org>, Kexy Biscuit <kexybiscuit@aosc.io>,
 <stable@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Pallavi Mishra
 <pallavi.mishra@intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Ilia Levi <ilia.levi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/regs: remove a duplicate definition for
 RING_CTL_SIZE(size)
Message-ID: <Z75Taxl0rTXGxNfh@lstrano-desk.jf.intel.com>
References: <20250225073104.865230-1-jeffbai@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250225073104.865230-1-jeffbai@aosc.io>
X-ClientProxiedBy: MW4PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:303:8e::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8551d2-4969-440a-0f70-08dd55f4bdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G61z1E6zFPljWQSkS2y8WCqM0lnejJzL8aKskuzGGCvm5h4emut1Fy942jBV?=
 =?us-ascii?Q?BGvCCEg0NZIH4BJL6rrsdnuCExW9aP6LRxrxpPC7HYZU1jCtSbhIi8ZVYGbU?=
 =?us-ascii?Q?odlkSZCeJSxOTjcfhK45jZyMQrk3GHjQcagtFS5ZsaFA5CSYAW1+/6MlAuY9?=
 =?us-ascii?Q?N37m3dQtqcdzPLCoVSzQv6PonS7IE+Fx7bq142jvof8ncEo4TXcS5xwPiTL2?=
 =?us-ascii?Q?5+89NwmFisIrnEHT7q6A8M2rJ2JX3//zV2SpD/I4avZFoEFs6/NmbdsDA01V?=
 =?us-ascii?Q?4JZpZD8XaMeAjccW+jnq9QwqjOvADrcirunvn6rWsA+PS2dveUtEsoJbfOv4?=
 =?us-ascii?Q?20HS36GLG8O1rR+nncyOmO83nviZRqze0AMBMidzx+NjSIFi+KNqX9aTZnat?=
 =?us-ascii?Q?QQ+wdw4DuMoPWdcxR0oJv+7trPBnjYmU6U4evzw3kSJICaFbtI3OfqVXnzBW?=
 =?us-ascii?Q?S3EekOxb0taf2/SZMS0wUcPgA0gV/AHzTQ1IiZ5KCilqlEFsXwUfb2TICYDL?=
 =?us-ascii?Q?048A2qV86Pks19HfcFmBJucV6tNLUc/lqZUaC33JiTqSuJPSp5GdEGa9yhw1?=
 =?us-ascii?Q?lwgp5w50bgxaDFu0DVrVr7FzJF9Jgb7C98VN9VoHFOYfbl+sBM/wBCvLCn5V?=
 =?us-ascii?Q?qQou7UP3xm3WhQEapeFptMm8c0GDrClo34AbmAQn50DtKadz5NkvOCnYZxwv?=
 =?us-ascii?Q?Oji6ImVNGPevjwlHVvx2sNav5tiwxzgO9t9N7AN89wh9fTtg9RTa0piQRi72?=
 =?us-ascii?Q?ry09sejxGocjjBfkNU/94eDXBgXIIvTDFZW6aVuxHY6mEqDxWYVOjaTCfgE6?=
 =?us-ascii?Q?NFOUPPHpqU9cNdlZeMsY5HBLUiAv4hba89RbV2S0r219q8Nn0XhoYMuaPcAo?=
 =?us-ascii?Q?BKjvS26UbjrVOfDW523FRjpHQBVQLd2FYtw04pQ/MxfIIagHrJM/n2ClcE7P?=
 =?us-ascii?Q?Mv0ItEip4vnnX3O/OvFsg6NRSf5Iy4h4zPpX0P/N05rpAPz9H/uGhdpqRLIj?=
 =?us-ascii?Q?kf3REZ1VZw/WL38XZP+Os44uKwjHMhFHhsvE/DGOV5mlDO44L60iDDbL3VWX?=
 =?us-ascii?Q?RJx/0Z8SJJQz7rWJnub//yk7qNnRkTpicTLldPJoHrAAgwyEjcpCNl9Ca0qD?=
 =?us-ascii?Q?IZa515jYEEC5PVLgNfIzrEgIiqH1cYpJDXs52tv39ud4rA81HA0UY7ABrHml?=
 =?us-ascii?Q?tQgKP8z/rynXMEfdsYj/rqnHVRA5l7SQS6EsINuhFlttpRPxSKJtLiBts+LQ?=
 =?us-ascii?Q?SfLsx567WQDnZxJVofBRlYKE/w5N71DPThOI4/AsN9LahAw0DqC6a9yGWH6n?=
 =?us-ascii?Q?lDDAQJrwOVWOFB5YoCHG/1cjlFJRRbMmFhoz2OCXpptkPRGOhziqG786ezwZ?=
 =?us-ascii?Q?gHNvCJEW/HCxVPpRnibuNPhtxgxH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WPJg1Jg3svlmBamAfjRpqGQgiAaQwDNggkwpNhlfQ2XiDUsNGFFOPVnP4BDZ?=
 =?us-ascii?Q?/5GlBQd5RRboUA0popfOsfdq6Jse26v8Ncn33LN9OFosEFflUViojH0erfNz?=
 =?us-ascii?Q?uUh0kudxWEjX7/oG2easFv+pyJQkzIZ9l3WQzHlSZ2nL/k26UXqD0b5aMC1O?=
 =?us-ascii?Q?ItPNYxauMAHbzYDVdP3gfMqlHb230SC2wBhvfAss0hptzeaJ/nykcHyBBfKZ?=
 =?us-ascii?Q?D/Mm776shpiDTuWmg7XnuaS7vNtyOokGmcSqq8qmEXtJc+GSDIEiidufqHR0?=
 =?us-ascii?Q?fo7ZV/NO02D9m5RC8u9A3SpqbcDgjbQ4p2H1LgRUruuI0JTRCpup9l55ZSAs?=
 =?us-ascii?Q?mSc7S8IjKerym+x1gFWR9vzKybUggq5h+puNFFNO2QE/Nk9m78CUujj+OBLs?=
 =?us-ascii?Q?S0TKqW9ge8958KufbFvqxHOpqS0FT5VxgaRpGc6aaFLqAH7Sb27tU9JnVDzN?=
 =?us-ascii?Q?Y1tsWa6PuHo7Sae7o6VVtWyWtby1pX8TaeQYIu4Xw8gLh5Upj9z8skmI+eup?=
 =?us-ascii?Q?sawJuhLh2GE+7AXeN88RlBGITx8YD4VuONAstx2onU5t2B/0Jm2tNPEkhjGm?=
 =?us-ascii?Q?30/I8x8POy0/43A2IJUEeEXC9n3NrrwlzDTyCa3p1uw9qkaFkUA0WHFR2jT1?=
 =?us-ascii?Q?weE6CoZTFWuXDx6U8vjNodZw4vcVnUdo4yystjkaltNrvu8cuVKBh9tgoDQ0?=
 =?us-ascii?Q?kGoE/qOWRfZy40vQgZ2oGIA7glNyzbomXYAf5dp+cowoDmjKES7nqXcDo1MO?=
 =?us-ascii?Q?JFF1QOc6UGoLSs54FFKBNM5BNFXtsNDXPC7IG9bGi7NVu/iU+awvicdif+7v?=
 =?us-ascii?Q?BNqH1J7XamP57lyDPfi01DDhcp+NR0GOQOd0pdqNs3v18DzV/Nl3V6ZkMvpf?=
 =?us-ascii?Q?Vu9XGrhZJuWJlRd0ceR3xXnMsVHliWd4W9JU43Jy/zYUlx4KLsGR8x0YK+HS?=
 =?us-ascii?Q?HjvL1dbEQrc4lbBFU+Hz9Yoz7K6fw1MZ+p0R1GGP8giP30QjB1oUBm5gVlmn?=
 =?us-ascii?Q?DV1CLCE6Vv5AHkT3Nmtmj0r2DIDYyvw3+QWMpwfxUcfJsvD4JRfmNgyO+GNY?=
 =?us-ascii?Q?BiM2/kQjCMMVSpvYxcYc183ezyCq49LPeu2KsvPzcFN6xXlTepdgJeZvIMNB?=
 =?us-ascii?Q?Hi5sZBtqBDHNR5sKLDMwZtWzawAf5QsKLZS99Yy3cVFG2tvsOF73pUwX2uOx?=
 =?us-ascii?Q?iIYU+uAG/NoPZf/sRrUWZq7SJj3qg2qeH44RBID6TKh7sFKncu1OjyPYhxS9?=
 =?us-ascii?Q?/s1hkns1zQPBx28MK2SiR7wtLYDHflS9RG4NDdb0zlA26hyG4xZbJbnSgN/y?=
 =?us-ascii?Q?5kOvtjncq0x/eXzT2+mX2hY//eA3UcHrJBfiAGjw/4rrqap3tDev5uB20vyt?=
 =?us-ascii?Q?40UnliqcTZ8SG1P8yZ7+OCzORvqPF86DNJhfy1/xtZcoyTU3J5S+io0KwQ0r?=
 =?us-ascii?Q?KpWDUWcpvIP2kMP7nJn7d43GyiUx+/hXI6mAXHI81AA/rkrm5/DbXPVoNdII?=
 =?us-ascii?Q?r0umIKRTutZZ5nW2QQJSwH81e54prkjVl+zEsElOSD3q56ZR6gpQHygdw0Kq?=
 =?us-ascii?Q?0zzPcwFpDbCUQZPtR+TBTncJwegdt/EFjH08YBuFvvGSKyMZlkHUlgd/WWiZ?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8551d2-4969-440a-0f70-08dd55f4bdd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 23:33:00.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJmOaCwRhfQ4rVbS92XZcl9n1vs+yvdfh7XOP8AtDtwwCCxvWrLWlF9hBvR8/Upgzx/PY5CYtMQE/Ad1Z1XFZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Tue, Feb 25, 2025 at 03:31:01PM +0800, Mingcong Bai wrote:
> Commit b79e8fd954c4 ("drm/xe: Remove dependency on intel_engine_regs.h")
> introduced an internal set of engine registers, however, as part of this
> change, it has also introduced two duplicate `define' lines for
> `RING_CTL_SIZE(size)'. This commit was introduced to the tree in v6.8-rc1.
> 
> While this is harmless as the definitions did not change, so no compiler
> warning was observed.
> 
> Drop this line anyway for the sake of correctness.
> 
> Cc: <stable@vger.kernel.org> # v6.8-rc1+
> Fixes: b79e8fd954c4 ("drm/xe: Remove dependency on intel_engine_regs.h")
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index d86219dedde2a..b732c89816dff 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -53,7 +53,6 @@
>  
>  #define RING_CTL(base)				XE_REG((base) + 0x3c)
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
> -#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
>  #define RING_START_UDW(base)			XE_REG((base) + 0x48)
>  
> -- 
> 2.48.1
> 
