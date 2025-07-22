Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50225B0DAB3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64C510E67B;
	Tue, 22 Jul 2025 13:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjIAnkHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D4710E2A4;
 Tue, 22 Jul 2025 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753190785; x=1784726785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZPF6F0nF+pD5OEVyGvEa+yKab4nyDDtqt6mpXJ4U6rw=;
 b=jjIAnkHkALRvf4DC8lBG3qld1yRJ52oDK6ujhoHE6QCzJ1ILkf2XHzOL
 cTkq7hLVhVayz0phvMAO3oY72tcoMLPs+hYm6IlbnhVjAz1knzPuyOFUg
 bgzgxREtubcXehziiG0j6a1ktC/uaE5eO/TVrfpf1xUXFbYwwB8pUCtEg
 sDFPofreINJxzeFJrPCQ2ur/bgp8NcLrm6k0Gh9p1Q8yZTHASmfEkQx5K
 TplwksnaAHHbH44OwHbRCpw+tzhWJbTll9meuRnttWOhQTjyi+YdzW0is
 BqP78Q7MtLbHhMqsCUVwa7gREtyCVwwR9aMxByOCmida4zZeClIkHDuc+ A==;
X-CSE-ConnectionGUID: GehEYBESR/6nxzXgAf+hqg==
X-CSE-MsgGUID: Bq4fsdP1RBO6PjSAWpinoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="72894704"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="72894704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:26:24 -0700
X-CSE-ConnectionGUID: ZOeMtZZwSDCc/rJOGNEMxQ==
X-CSE-MsgGUID: smXBmswsTOeUGcxxjJFkQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163697672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:26:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 06:26:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 06:26:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 06:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjPqh2buauRdiOHeXwkaqkIuZ/v8dfUnlpgt7dS4hbA1YnP8P7CRMTMmfJaTepXDsxhi+YjIG2xTY8y5AWCVX+bWMxlcgsNMLG/hDnvYxMew7F+L1V+b9YRxg5LB/IuNrjZ598OzuE5AiSGX3MpvsbnPClB8hITWjV8f/cduZfGzJ6gkzCM428YebwtDwHcnDDbx4RmzFuBbLxPZO0IGZyoq2Xp80VyXwkGpZ5H08LSMD6H7MVw537p6OFs7cPXN4lffjWEGin5H58bIusu165H1mhSIZaaWAvNVlCCYXhowYVME/FZuDDKM7Zcefv6/3tLs4bk+xvmXIWlDAP6rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShtNcgdF/Mt41Tb07T6RmOeqY3ojYasfuxENxBOVLAA=;
 b=a/tPumFkTGcMIxmb8A2mYNDEnSco1n6YIpxcUyLYZEyils2An1cBLDQRoBpA+Fd6Hamx7U89o0ayPtOTo6NaSN/WwxrvlU/CfG0mRCC1oz3bbGvFfO7Ecu2jHvbnZgSPybFRJrPoZ03uU4ihlCEtP1cKm8hiLuVY7ukuadR9GUO01rDpoqw35tUUQuDsFwTKtlFt7TgB2kL6v6k0Gt6SHBBf6xeeZHh8NO23sPshkeYTADBuISTZ1NE0msdruzAVnz5djwe2J+BtBilkUhSO14fd9Hc4eWsl6fbDlwMRQc6f80Eg+294jZvhNF+TaeYL9M1f1gfT6CWyIFoqLQpecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF7D18F34A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 13:26:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 13:26:18 +0000
Date: Tue, 22 Jul 2025 10:26:11 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>, <intel-xe@lists.freedesktop.org>, "Linux DRI
 Development" <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Jul 21 [drivers/gpu/drm/xe/xe.ko]
Message-ID: <vpdxxpbbirslnp5m2sdaz74ehdwc5tp54fp6rp2kxtt7vmr23e@lnp5lp7vzryy>
References: <20250721174126.75106f39@canb.auug.org.au>
 <70458c86-597a-4346-b18c-1fbd9a833a55@infradead.org>
 <esdm6jfdkdbaeaphyhtfsckiii2tptdpe6dffddp5sqyg2klhk@b5dtuayqqpht>
 <22f5d759-e79c-4231-bf4b-2e498543aa5b@infradead.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <22f5d759-e79c-4231-bf4b-2e498543aa5b@infradead.org>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF7D18F34A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 255108e7-1c67-41be-f591-08ddc9235742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nbJrGegOCDm31Xo/egho31e3d5vtdXQBx9S0nLZvf+3VFTzt+P+pRzpJH4g+?=
 =?us-ascii?Q?JXA4POkFDyOlLr+sZb/TsgTrX7inQXOXoDizkswrpNiY1xa6/WaDeL4D32Dp?=
 =?us-ascii?Q?yflYWi0AaaQqDOYZcJqYrgGxr8nqaz2IFZcrPVch2SZx3a83rnaev2g/IKnZ?=
 =?us-ascii?Q?UDYuDFoqJ14N7twscbebckGTKZW9vWtcmTWVISQW8YNh7JxC1Neb6EemJ1Cu?=
 =?us-ascii?Q?93R3IEcM+1wmWXMrisB5MyLWwGpVrij3uceG5Qom3HBgL62bk98Sx7ml2Au5?=
 =?us-ascii?Q?/nq9q1yQY7avp/DUgyqCrC0buCHZeZywUU1Rwg1Am07cThd/TVqtrepS8f2L?=
 =?us-ascii?Q?+p4yoGkOH0Kg20U7Ac+uyD/ObOep6pdydE9uDVLCPvPS0j4kj6alNROcSONm?=
 =?us-ascii?Q?SHOOh2D/o8yVro4g83j09coPQKjsyRMgkiTbz//5suqcBrbvJdbsJeuJbiuH?=
 =?us-ascii?Q?DG4OSbAv1x+2L1H46pJA8pQzGFIYvBbw8XMlmfSFo4Qx6H2Q75+Y7a1VbtrG?=
 =?us-ascii?Q?W0yZzYlPfBYNvF8NfBulpMWnYHMz1AscX7ILOyOlh4S05eBjkrtdVmtGPa/O?=
 =?us-ascii?Q?JVWmC8mbbzG54MkTuTjG//OXiZYUpZT73/bmoNegERCFNbsCTxySrSCEcIOE?=
 =?us-ascii?Q?3xcHIE+TYNWEYacx1T8j12r1tTor354TmlyUz/fYRNUuv7z0QtFQeHRsYPwX?=
 =?us-ascii?Q?5Leu+dHQFAF+bkYjy6nz3PhcMd0ICzy1gSRkxFjNsJNla5KV+y0S+5vkXjak?=
 =?us-ascii?Q?hMZXZesWHRo2HauHNgYzG+zveT3Rl6C1xjWmjtL6MdJrrIkPWloZXUSlMsDd?=
 =?us-ascii?Q?MhazR/FP1WMjkXI1GDcUmhs+oFDBsBjSlm8p6XyCy1Qvq3ov5KUKLxmfjxnD?=
 =?us-ascii?Q?fegrBOPl1tdZRyNTr2l+D5m9MZFA1B+eqsRLlYBdgi85NRUoYB4CiR6q4rvm?=
 =?us-ascii?Q?C97tDoeUzBldFoyGLDlepWU5sKTSQ85E7IEvKzC6dytc2jX0hz7slmRdwWGa?=
 =?us-ascii?Q?buhzk/qH3DX5eBSbbeJaDE+EXuyIlGdL8MxjIuy17X3CpHrY62QRgppq7V3Y?=
 =?us-ascii?Q?hJMdUmKnLyRbThuTf7fv7YZGw/hsO9FuUrJuJvv36aSC8CtqiDe+0KjvoNvg?=
 =?us-ascii?Q?2hGKe2Ir4yQ7U6PLi1WEP4pa/VEbXXgzhXonVw6MLtZk4oCnM5DblwBptecr?=
 =?us-ascii?Q?rT0dHTUbjwQsojOCSUyRw0TAYT9VfijIVDoW02ME43XMaSrATsvDU2zVYFS6?=
 =?us-ascii?Q?ijk6o2G3/D/YWV54yIit+LP8JWdOz7K4K64Z/WhAQDAoAvECVAZOf8nhOsf5?=
 =?us-ascii?Q?EQFMbVvDH83/V3H7kOeNEV7ZPuAFqkKqTOAqiVY0uabhlnkpEC/Y2noro6u/?=
 =?us-ascii?Q?8ImXZeEL6lg+rbiMbKAJOdzLtIdMihKOM6CsWVmte0o+1JIeRZGbAZE+vpiI?=
 =?us-ascii?Q?2JOHyrxYDJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6U35wOHLDc1sk/0C7QWdg2SOirlUgoy6ASqwYX3hYXPA8lqqJMBF4im+kfE?=
 =?us-ascii?Q?5KN8E1Cjzk8c5jeJJbHmvt/rGNDjNY84fGSrxTPeg7gx0CHDjAHKdGd0gYcE?=
 =?us-ascii?Q?9La4ce0VXBCJztRdaVg98ziaAMkxchD47wM6IReElNTqfXOoH2lHkem/BJ6U?=
 =?us-ascii?Q?PFsM4I9yd+cIrJ9FVJNtt9XOJVv72Fn3JUi4EVkyL6Qboi93bRh4eq5MlK1j?=
 =?us-ascii?Q?AUtMZ38RKA0uUi2pP7tqwDaB2rA2E+JyMzHM8c7AKfY5gAKPjNnd6bgUUo0U?=
 =?us-ascii?Q?SR2CHkTyLkdNVIotvAf0gVM2WDqRGk4AZS/65kdhonwtkLyBQZqJ3Z/AaCcG?=
 =?us-ascii?Q?uagkGj2EuNO2uwL7LwD7PVLgGmAKSUqiVlHwK1TNDXlXcbq8HFMtEAG5CXs4?=
 =?us-ascii?Q?ck1fmyKj6pecZ39Qv9sCA5TDd9c6LbIREM4dCPoJFOdfzmZS8WBLmELR+scb?=
 =?us-ascii?Q?c458pRjv0ENTIaY1XKotB59mUAJD5jZwste0JnfEnzk5tmg/2wrn7dlBQJPp?=
 =?us-ascii?Q?P9ZwbcqpbXq7ptO6XmYHjT/+ZSuywXIibQhVsQVxbJDlZ3YF9guKIjfM+PDL?=
 =?us-ascii?Q?TN5pdjM0pE6wwgyIe+3Ibs7NsTg9n/8GtIFZNu2AQQbub50/ZHABwVGCyKfM?=
 =?us-ascii?Q?gfAvaR3mBV+164gNmXpoFdL8qepdkUFWfJB+QjNmVlwQ6sZqv5kiW2q8MvE2?=
 =?us-ascii?Q?wKKNCJKRU7q8OcCM2sJYizjL84aLcfyyTQNpPnzyj8Z0ZXsNHqpNksvltRmh?=
 =?us-ascii?Q?P9Q7opLqp/VjWArBf8rX6wPmUbxKLefHX42YqnnfZlJpdYqUInnDMMNPi4oV?=
 =?us-ascii?Q?71QQBL45mNnsuCNsckEj7faAhQJgp5umw6PSobwA6X4UQR7ejsG5vwLql0IC?=
 =?us-ascii?Q?3hGsJoDqHVgGre58SE1MtXMBoyHkniOh3Ve9Mn1i8NcEJz8dDstokYA74G71?=
 =?us-ascii?Q?ykCqxPPz5DRHrwm9Qrc6H639DOhkd7vlEuWg8427TZ/l5m5WJ+Erhli7MJ6N?=
 =?us-ascii?Q?MyoF2dnsQbkOQ5d9U3W8lx/HknMlhuaM2QT63VXQFJEIr0aiXzCpIZPSoQoH?=
 =?us-ascii?Q?i9WUKltCr/LXEzacMtGmgXBB+USHMgX1UI5qryTHIf/S63K6bo1i/mPl0HRM?=
 =?us-ascii?Q?tRVGkMC+vg7t6TFIHlAxQjX7ORjw/NOfqumVA4QMbW0vPIwXGW7riAcijI3h?=
 =?us-ascii?Q?pof4zVda3lpptiCVAXNsim3wcuhtOLllpeoRheGWDkl6FFUKCJJY8B1UlJXl?=
 =?us-ascii?Q?WP+rT9WP1ZpYN7dg7VODVb6XpnfPaOw3OBWv/wGn8c68bUA5BC1j3rR10LjI?=
 =?us-ascii?Q?+BKAlhXZlrKBUQ+AqbfveFu4/363/leeTI6PF+xtQWaGgIAixfhsXitkcK4C?=
 =?us-ascii?Q?fc2IwQXXkX5pARA7X9ey5ZBDl8h3OjYOS2R+dW/H+eVimSwnZf5cymy/1zhw?=
 =?us-ascii?Q?HVEprpzpXWoQYq4JYpY2TVf4Z+EA76BBNnu6BJUwf1UjnCxf0IbQpH2q9Eve?=
 =?us-ascii?Q?msnVd0m6XJh5R/LnlWphysk7u4kDD3UtyjWsryDw/kcbJ974azPc2pmVsy9c?=
 =?us-ascii?Q?bhe5Ux8ZFtoeAo5VHPQy2xkEBaKrx0Vj25Nkv2zyAqIFF9mXVXHwmXMRg7kA?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 255108e7-1c67-41be-f591-08ddc9235742
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:26:18.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1kPGYgQgxJivqB2LMi3rjuanxb6TCu5AaRcycFAveOWw9kEUqEyYP02KqKqw157XJkaro17qLYPZlMTtGiQjKYMG0LEMj8T0sRtADFGc7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7D18F34A1
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

On Mon, Jul 21, 2025 at 10:50:29PM -0700, Randy Dunlap wrote:
>Hi,
>
>On 7/21/25 6:38 PM, Lucas De Marchi wrote:
>> On Mon, Jul 21, 2025 at 01:17:33PM -0700, Randy Dunlap wrote:
>>>
>>>
>>> On 7/21/25 12:41 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20250718:
>>>>
>>>
>>> on ARCH=um SUBARCH=i386, when
>>> # CONFIG_DEBUG_FS is not set
>>
>> can you share your entire config? I have all of the settings above, but
>> I can't reproduce it with gcc-13. Is this a regression from the previous
>> -next tag? I think the diff below should fix it, but I can't confirm on
>> my end nor I see how this would be a regression from a few days ago
>> only.
>
>It's a randconfig, attached. (#1046 is for 32-bit)
>config-um64-drmxegt is for 64-bit.
>using gcc (SUSE Linux) 15.1.1 20250714

just tried on Ubuntu with gcc 14 and still can't reproduce it. I try
again later on arch or suse.

>
>>
>> -----8<-------
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index e9ccab8aedbef..41880979f4ded 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -24,7 +24,7 @@
>>  extern struct fault_attr gt_reset_failure;
>>  static inline bool xe_fault_inject_gt_reset(void)
>>  {
>> -    return should_fail(&gt_reset_failure, 1);
>> +    return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
>>  }
>>
>>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>> -----8<-------
>
>This fixes the problem for me. Thanks.
>
>Acked-by: Randy Dunlap <rdunlap@infradead.org>
>Tested-by: Randy Dunlap <rdunlap@infradead.org>

ok, thanks for confirming.  Initially I thought we could have a
dependency on debugfs that commit ccbfd2df3018 ("drm/xe: clean up fault
injection usage") broke, but it doesn't seem so.

So... another approach, probably more correct, would be to move the
attribute off _debugfs.c, since it's availability shouldn't be tied to
debugfs.

Lucas De Marchi

>
>>
>> thanks,
>> Lucas De Marchi
>>
>>>
>>> ERROR: modpost: "gt_reset_failure" [drivers/gpu/drm/xe/xe.ko] undefined!
>
>
>-- 
>~Randy



