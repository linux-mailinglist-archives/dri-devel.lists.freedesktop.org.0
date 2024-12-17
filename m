Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605CD9F56F6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 20:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379A210E64F;
	Tue, 17 Dec 2024 19:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0O2YNEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CC810E64F;
 Tue, 17 Dec 2024 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734464419; x=1766000419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IyzMuZUSXaLyr4EZb0y/gIomTwGsAPdFV+oCrUDTtsY=;
 b=H0O2YNEzkwggmJv+g8UuQdmn0N1An2LA4G1MzL1k+EjH5kWvJKN4l1nd
 i2vw4RvAcZC5ElDgen2qBWQxq9wpw53rl6PTnactOTRmm1iJqL2JLhrut
 f6sJlGSthhBH26rLFVzHOHZMhim3epc3tDKDz82mGgH3C6OnGeXj9qKCg
 uyKS16Pp/evgPrR9bVaB+LGlkYXOXMsrsbHPL9P1F0RLdv1QIf3yDXXuw
 LQpJIxJfFL6KDnc9Inl20ker3TgUCISqc1ChpOED+9kn3ImIvyLtQF2RF
 Izpfzr5oQkdKH1JQNexGSdGaNupnNaCvBiPFxR9offu1R7R/rx+3qI06K A==;
X-CSE-ConnectionGUID: KdcJ5ILLQDyAigFP9KdVCQ==
X-CSE-MsgGUID: DJ8J5YyZQSKjGjzGMKq7eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46318264"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="46318264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:40:19 -0800
X-CSE-ConnectionGUID: 6yKwWf1qSfyjPdLqcU33Mg==
X-CSE-MsgGUID: F7GZx2zPS8mCzO7j8lR7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102704516"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 11:40:19 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 11:40:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 11:40:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 11:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB5DIiFTHRb1K5WinU/s7St8tgvcA682mhbp70Q3wy0JiCCd6uKnT3aHNarufarihPibpqhkCAB4FSW/57Ke+TjJTIcNZy4o//gvflcE5KLq4WAPwLRDYvuPgDje8Eez+k9/CNENsObVy1lwR1EOj7r1LagrLIW8DA0OM7oKm6QdHvt8ommov6um6BBneC7eVnPBLxadqWzG3qz4vYwa7/Yw7V6zTlJEf6xZEVkAC1tWDPbWM9PknHBktsSuliaZbxkb8iRmW6hmUR2sboZl5XWiGIAYRd+uc7Q92bw4j4Dit6FFzpdSx5x3IPadVKWUI80tMobP50opPkrlmd8KMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnTwaMXDZ+UADFDwSpp6wuULpFYZ8jEOAG4goRu7mTU=;
 b=hTwNDeCwLQuheBwyQ0N3Itz4UTES6RSwIGCByOBlZdp+Hb+tVvarIun6VaG8wSrQwYHRnVny743xYvwmL1MlzSSf5zWJCzb6Fqo2tIy90CJNn2IHLK8KAJBL4bX7pDFi1SNZB8yg663z3WEamYuuvLFSc6PvMJlADcLm1RquWJvRtiW0DFGf0CbiYi1NKToNFiAzWXmvB8G8llDX2At3va9UsAfJQuYCYXX++ScRKYogf8BbowINGBn5vGbcLuWgxma4/GIkEY46Tyfv/tNy28txJqkhsqUiscAdfOAXkuPP+TkZKR4AGuOyvBGKd9uIZzLB797WVu2TKT8rynr6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 19:40:15 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 19:40:15 +0000
Date: Tue, 17 Dec 2024 14:40:10 -0500
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
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Tomas
 Winkler" <tomasw@gmail.com>
Subject: Re: [PATCH v3 02/10] mtd: intel-dg: implement region enumeration
Message-ID: <Z2HTmlrLp0uDeMwc@intel.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-3-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241119140112.790720-3-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR04CA0383.namprd04.prod.outlook.com
 (2603:10b6:303:81::28) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f338715-6ab7-4c29-7b9a-08dd1ed2a132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/+IGs7Pxh7ZY01EJQA14W5WCpcEOy+twnI0LJHrKrnCAH6XypO6JZZszZVd8?=
 =?us-ascii?Q?EijpQZ6ptZqbMe79VQkwiPYTPjwjoPhUKOgl699hLWZRR6f45DZggalpFtGO?=
 =?us-ascii?Q?gfdZ9JJ7fpMSeK/+1ICZ+kZRn5/qmcyYwGWaap3sqaTk+RYMlLFAcVe4UJvX?=
 =?us-ascii?Q?VYcq/Q5yJN1eygPcxLPmxaAc8uCibGgL8dszDkU3GdKt9mceng9SkMFk0F1q?=
 =?us-ascii?Q?LsyBK967ylQs8mLsNQrUFYkJlirZMjrYqS5sJ5GSuLydZ4d/61S79ufuaziz?=
 =?us-ascii?Q?TQWoEvlZ7pUHa2BerAAPWmUiP7rpgVcU+4KSEg9CoVOGyMkEmlUhatDDne7a?=
 =?us-ascii?Q?OQNmYhvzLdeQ/29MnjFHce1isgOmZS1C9Lo2znAqfj3kjV2V4rYqYuaKdtBs?=
 =?us-ascii?Q?JL28IL5rk/x2BGFS6AHLgzkXwHq+6VkPS/LThEssB1QaYpKuSSWmLTVttCBh?=
 =?us-ascii?Q?uhC9EkOLEly7OtBSqkcffAwbLmBJ0We2LuRH6SBLpkVilvRI3kg4E4d1b30N?=
 =?us-ascii?Q?JfYJl/Xhx2TwFW0se8r2OcGde5Vtjm0F7lFYRdg+B6zjK11cTkeiYTaoP+kz?=
 =?us-ascii?Q?tQoFjeT4jtKQCDaUBvXqCpULmy6B375ig1DDwQJtsvfHpN0gyeQgNBWcp9Yc?=
 =?us-ascii?Q?tfJRKOBqah8S3e5CL17f8U2DMAvRLqR0VKvMfmLDn/IfTdqyanWtR6+41cnZ?=
 =?us-ascii?Q?aKud32/pnkIxvNk1h2jmW0l/Q9oTWH99OUlmU9f0SJC6cUXi9kHekaiOWC8X?=
 =?us-ascii?Q?0e4VfHTQVAmcixvHOaBXNoOCL91CxEkKRNaRR+XjAwiOYJ8jeaI5QE4y3+vH?=
 =?us-ascii?Q?cOd+Q5c6ONDtU6sHI7iZD0A9Mwe/3JWV89I7aL3mJWCNmBOIVzFzvQFsdlbr?=
 =?us-ascii?Q?Rd5DWSQ2+77RORQfxV+tb7gA95Tp/hKgaWan+g8C6bccgdASJWc1fwRmwaVc?=
 =?us-ascii?Q?08Ekp8uJ74Kib1d4MYHG+EbbxF+3xaqSgNxQX+sy9zbI3h6iHCK+5YFpOk3T?=
 =?us-ascii?Q?EMd2v5FLWifIjplC2mbKeHGU2HpsGEwCYEkbJ+i9XngiB92ekAtjxTqrxerv?=
 =?us-ascii?Q?M37DHleDJYENEFmWKqT2WrIXtekDRfrJOUfiFixg/+oqfx5XoCnnKSa49tjH?=
 =?us-ascii?Q?5ZKgfdSm6Iu/tilSxHFeHKYftgTbiX06++K+zgg3oXTzLmhPqe0+UauxVdgq?=
 =?us-ascii?Q?lBbTnusfkC3kfE0SJkWygh/UIfbGvx595kgNDq/8uNlF55ph3iIqTcAPAaOc?=
 =?us-ascii?Q?U83hVrf5CbxaJYZyD0/q3ddLKqtPVLtcC3LUFrnMqR8opr5XSc8mZtkuN9rP?=
 =?us-ascii?Q?+8Tz1mULoR2GQiveguQX0L8idvZbzzQ75kWA5R1s90UURGfv2t56O7mfiGWc?=
 =?us-ascii?Q?grZWC4tqb/foTTLq0Tj90jnQWCrn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eUoGd3qmZi2shirzfEebSyA+pWjOSl2BRN5DVV2bcXbdJD8lDoLt1u1E3gkI?=
 =?us-ascii?Q?FShTm6m15ut3H6zmnHWGU40X72MCQpSmwQW2/Ae+U3Rr8hbT/VfJIsmVcaol?=
 =?us-ascii?Q?pSr32NMtxC1GXJVOKV4toJ8zLebNmdVybthcmL7ZnsjXl4Pi5QS0qQ6aNIRm?=
 =?us-ascii?Q?Y3Qr7e3GbGb/ik2Xozkse/Q1zaSv6vdS20ThPiHauDYD15fDTzyI/7NGmPWr?=
 =?us-ascii?Q?0ojpNma3Bre+0QpHsigPJjoWfYSqZ+giAXxQFib2pyyprEek/leott8K6nl7?=
 =?us-ascii?Q?JJVuDkCHZYTGDhXGqe7kpGsAZ8G9zGrNNMBb+7IaeKJXTQGolvV7pfgglueQ?=
 =?us-ascii?Q?NBQEKxSysRtpRfs3IBPUFC/l4Cijw7dm7paflCuXdJVt3AP0JkCO60RJxv8x?=
 =?us-ascii?Q?rcr3b7Lc3/dBIqrOQ10IFLcZhsbko1O+DNVG2lNk+BHaIiBz7/7kYf4KNYYI?=
 =?us-ascii?Q?VGWw2PJfAtJ6Xl1nzkTB+2ywAJKM9OecQ1blWrGwEdhtxtp/9bvOxMqz/kB+?=
 =?us-ascii?Q?aKnPamumbJu2jdbPLL+dexNws6uuKFnqdBLmCD/xhDEHoJK1OrFG3rOgIM3L?=
 =?us-ascii?Q?CJriIz8q1NZR20FsIQMvQCaO6/dDZO9qyulN5KE5u5qEXTV+UfLqGf35kM/9?=
 =?us-ascii?Q?GFGrgDtBKEiufFeCf+EU2fgARZalbxU+oX/FJcy0yJNj5ru3QOLmohHI8ghB?=
 =?us-ascii?Q?ErVx1IQjMr83vqjeOz22ZULYV2PaPJJCyiXRg3/U8JDFV+Js27XZW3jneOwt?=
 =?us-ascii?Q?iI1hjgpKws06CmCQW0GywjZhRMKatWd8caAyt+H8GN69yuF4zguyT+ewIRPS?=
 =?us-ascii?Q?/HjYxyeCQdZCHDmLNwHK3WdOG2sd1CDAQ8zJqqIVepVOOfdcRySJR6n0dYO9?=
 =?us-ascii?Q?lvdt5iKkGQ6tX4iHfmTSsuW7EaOpXsdxQYDWH503BIdOuzDeAsluQzePd9ed?=
 =?us-ascii?Q?Gm3Bk8w33lL71OXyV07R4UjMc297RJ41qiTh7nEpDjhWBsNRIcT6/atW4ewF?=
 =?us-ascii?Q?1SGl3hdwvIZqrGnPKGwaQZ/xZ3SM4zFNkpnFfB1CHE3HXJhAZfs1bJinhsqk?=
 =?us-ascii?Q?UWMKT3mVJkqjtI2cGX/mZPzMPNkV3FSnbUUksjy5ZB+RNcZ+iMHr4Ln1U3QO?=
 =?us-ascii?Q?y+vY/QApLmz7O6BePHuUBm/IfgCSOaHhrKaKkIJp+yb3OHgGpe883hXpid50?=
 =?us-ascii?Q?Iihz/hBxQpO3+a/KkkWIBXjxZz/ysrx7fmGRZUayeF+rY2loaWrTkXKuXMwB?=
 =?us-ascii?Q?FpeTmhKaU0mCzcHaFZSCmyPsPuDtsKOc4ITqt9pd6scqGvzIS4f1Z3XfCiOL?=
 =?us-ascii?Q?+W1sL0gqbsot0MakC4PKKSM7Tuc3EHOmvmJRh0TpBFcLeIrauFuFW2ElzOsq?=
 =?us-ascii?Q?fl+ooUzaQg7WcmLt0zh2LCs4JU23rjPLTL8IR6zPTa7lI3QnmTb14PPktGXf?=
 =?us-ascii?Q?dk108mSTmhmO0WDlT+fS4mwHQY41ihQYaO8o7fqUqSOiCm/JYEIOOsvA3idF?=
 =?us-ascii?Q?Xu7774rTx6AyF3rrds7+X7oEL49CoTlxgsmrK2IhMaxIl96kGcux4KSG8wSz?=
 =?us-ascii?Q?zt7toGyOKxzIznCELXDtYpxYlyq/viUq3X5UWCzMtKkLA8MxbIVXWlESHX/F?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f338715-6ab7-4c29-7b9a-08dd1ed2a132
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 19:40:15.5625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3ziASMjl4vFMbxZWf37zUp2k/Icut4ijNJhu4SKVsW6covBA9Q2jmwZJU+AgbfmOcc2bz9IXzYopzfCX3wwoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
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

On Tue, Nov 19, 2024 at 04:01:04PM +0200, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Thank you for providing all information I needed and answering all
my questions offline.
I'm sorry for the delay here.

Everything looks good to me here

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 199 +++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 746c963ea540..05e333771be0 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -3,6 +3,8 @@
>   * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/device.h>
>  #include <linux/intel_dg_nvm_aux.h>
>  #include <linux/io.h>
> @@ -22,9 +24,199 @@ struct intel_dg_nvm {
>  		u8 id;
>  		u64 offset;
>  		u64 size;
> +		unsigned int is_readable:1;
> +		unsigned int is_writable:1;
>  	} regions[];
>  };
>  
> +#define NVM_TRIGGER_REG       0x00000000
> +#define NVM_VALSIG_REG        0x00000010
> +#define NVM_ADDRESS_REG       0x00000040
> +#define NVM_REGION_ID_REG     0x00000044
> +/*
> + * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
> + * [23:16]-Reserved
> + * [31:24]-Erase MEM RegionID
> + */
> +#define NVM_ERASE_REG         0x00000048
> +#define NVM_ACCESS_ERROR_REG  0x00000070
> +#define NVM_ADDRESS_ERROR_REG 0x00000074
> +
> +/* Flash Valid Signature */
> +#define NVM_FLVALSIG          0x0FF0A55A
> +
> +#define NVM_MAP_ADDR_MASK     GENMASK(7, 0)
> +#define NVM_MAP_ADDR_SHIFT    0x00000004
> +
> +#define NVM_REGION_ID_DESCRIPTOR  0
> +/* Flash Region Base Address */
> +#define NVM_FRBA      0x40
> +/* Flash Region __n - Flash Descriptor Record */
> +#define NVM_FLREG(__n) (NVM_FRBA + ((__n) * 4))
> +/*  Flash Map 1 Register */
> +#define NVM_FLMAP1_REG  0x18
> +#define NVM_FLMSTR4_OFFSET 0x00C
> +
> +#define NVM_ACCESS_ERROR_PCIE_MASK 0x7
> +
> +#define NVM_FREG_BASE_MASK GENMASK(15, 0)
> +#define NVM_FREG_ADDR_MASK GENMASK(31, 16)
> +#define NVM_FREG_ADDR_SHIFT 12
> +#define NVM_FREG_MIN_REGION_SIZE 0xFFF
> +
> +static inline void idg_nvm_set_region_id(struct intel_dg_nvm *nvm, u8 region)
> +{
> +	iowrite32((u32)region, nvm->base + NVM_REGION_ID_REG);
> +}
> +
> +static inline u32 idg_nvm_error(struct intel_dg_nvm *nvm)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	u32 reg = ioread32(base + NVM_ACCESS_ERROR_REG) & NVM_ACCESS_ERROR_PCIE_MASK;
> +
> +	/* reset error bits */
> +	if (reg)
> +		iowrite32(reg, base + NVM_ACCESS_ERROR_REG);
> +
> +	return reg;
> +}
> +
> +static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	iowrite32(address, base + NVM_ADDRESS_REG);
> +
> +	return ioread32(base + NVM_TRIGGER_REG);
> +}
> +
> +static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32 *access_map)
> +{
> +	u32 flmap1;
> +	u32 fmba;
> +	u32 fmstr4;
> +	u32 fmstr4_addr;
> +
> +	idg_nvm_set_region_id(nvm, NVM_REGION_ID_DESCRIPTOR);
> +
> +	flmap1 = idg_nvm_read32(nvm, NVM_FLMAP1_REG);
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +	/* Get Flash Master Baser Address (FMBA) */
> +	fmba = (FIELD_GET(NVM_MAP_ADDR_MASK, flmap1) << NVM_MAP_ADDR_SHIFT);
> +	fmstr4_addr = fmba + NVM_FLMSTR4_OFFSET;
> +
> +	fmstr4 = idg_nvm_read32(nvm, fmstr4_addr);
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +
> +	*access_map = fmstr4;
> +	return 0;
> +}
> +
> +static bool idg_nvm_region_readable(u32 access_map, u8 region)
> +{
> +	if (region < 12)
> +		return access_map & BIT(region + 8); /* [19:8] */
> +	else
> +		return access_map & BIT(region - 12); /* [3:0] */
> +}
> +
> +static bool idg_nvm_region_writeable(u32 access_map, u8 region)
> +{
> +	if (region < 12)
> +		return access_map & BIT(region + 20); /* [31:20] */
> +	else
> +		return access_map & BIT(region - 8); /* [7:4] */
> +}
> +
> +static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
> +{
> +	u32 is_valid;
> +
> +	idg_nvm_set_region_id(nvm, NVM_REGION_ID_DESCRIPTOR);
> +
> +	is_valid = idg_nvm_read32(nvm, NVM_VALSIG_REG);
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +
> +	if (is_valid != NVM_FLVALSIG)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
> +{
> +	int ret;
> +	unsigned int i, n;
> +	u32 access_map = 0;
> +
> +	/* clean error register, previous errors are ignored */
> +	idg_nvm_error(nvm);
> +
> +	ret = idg_nvm_is_valid(nvm);
> +	if (ret) {
> +		dev_err(device, "The MEM is not valid %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (idg_nvm_get_access_map(nvm, &access_map))
> +		return -EIO;
> +
> +	for (i = 0, n = 0; i < nvm->nregions; i++) {
> +		u32 address, base, limit, region;
> +		u8 id = nvm->regions[i].id;
> +
> +		address = NVM_FLREG(id);
> +		region = idg_nvm_read32(nvm, address);
> +
> +		base = FIELD_GET(NVM_FREG_BASE_MASK, region) << NVM_FREG_ADDR_SHIFT;
> +		limit = (FIELD_GET(NVM_FREG_ADDR_MASK, region) << NVM_FREG_ADDR_SHIFT) |
> +			NVM_FREG_MIN_REGION_SIZE;
> +
> +		dev_dbg(device, "[%d] %s: region: 0x%08X base: 0x%08x limit: 0x%08x\n",
> +			id, nvm->regions[i].name, region, base, limit);
> +
> +		if (base >= limit || (i > 0 && limit == 0)) {
> +			dev_dbg(device, "[%d] %s: disabled\n",
> +				id, nvm->regions[i].name);
> +			nvm->regions[i].is_readable = 0;
> +			continue;
> +		}
> +
> +		if (nvm->size < limit)
> +			nvm->size = limit;
> +
> +		nvm->regions[i].offset = base;
> +		nvm->regions[i].size = limit - base + 1;
> +		/* No write access to descriptor; mask it out*/
> +		nvm->regions[i].is_writable = idg_nvm_region_writeable(access_map, id);
> +
> +		nvm->regions[i].is_readable = idg_nvm_region_readable(access_map, id);
> +		dev_dbg(device, "Registered, %s id=%d offset=%lld size=%lld rd=%d wr=%d\n",
> +			nvm->regions[i].name,
> +			nvm->regions[i].id,
> +			nvm->regions[i].offset,
> +			nvm->regions[i].size,
> +			nvm->regions[i].is_readable,
> +			nvm->regions[i].is_writable);
> +
> +		if (nvm->regions[i].is_readable)
> +			n++;
> +	}
> +
> +	dev_dbg(device, "Registered %d regions\n", n);
> +
> +	/* Need to add 1 to the amount of memory
> +	 * so it is reported as an even block
> +	 */
> +	nvm->size += 1;
> +
> +	return n;
> +}
> +
>  static void intel_dg_nvm_release(struct kref *kref)
>  {
>  	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
> @@ -89,6 +281,13 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		goto err;
>  	}
>  
> +	ret = intel_dg_nvm_init(nvm, device);
> +	if (ret < 0) {
> +		dev_err(device, "cannot initialize nvm\n");
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
>  	dev_set_drvdata(&aux_dev->dev, nvm);
>  
>  	return 0;
> -- 
> 2.43.0
> 
