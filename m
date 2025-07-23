Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC2B0F771
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 17:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F6110E7F0;
	Wed, 23 Jul 2025 15:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyQpPOws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C5510E7F1;
 Wed, 23 Jul 2025 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753285820; x=1784821820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sztu9mpjje1QgWYBWCD3b9f5M0Bs+ur9HqxQX4w2mw8=;
 b=nyQpPOwsd2gvNLKNMpTe6liUN3enzkJ2MY6gQQQGLRBzBsDu0fB0NwSM
 ae9TaZ0b7RqkKCWwp8PVhTDeXP3l+nyqMJ0Z9CBM7EwU4c4vLVrc14ycA
 KQu636hOuCPYi7vXu4iv6MxaZkLf4kKs+d1ecVlZIdZUm+ro90evJ06l4
 cpA9IBA8mDf2OARarij+E5uqV02dxbjXJc0U4pIULnGYqhBfxsMR/I7N4
 0ZYIWE26a2lxSpISf03y0ISk/m95Wq9P7eKb4CLd8KN0Vx96QYNH09b72
 fYA2l8kk3XKsI3rmeA+JiPMfzYJMMJvBDgDK8peysII1aKuJvZ6roosNn g==;
X-CSE-ConnectionGUID: 4juemZRwQ8KxvC6SXgK2fQ==
X-CSE-MsgGUID: iH0Zd+rmR5uMhcxHQxOOQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73030664"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73030664"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:50:12 -0700
X-CSE-ConnectionGUID: j1GSNcCzQVyvH7ZCsrTdKg==
X-CSE-MsgGUID: wK46uuxASSOP49J3pxcoTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159888873"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:50:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 08:50:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 08:50:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 23 Jul 2025 08:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKsxPRxzUrFEjPie8lEq5GxgqJI0+bYNHi+0Sz7+CNrOpDFaTVgOfFTyPMQPLt8I4Ptn53OEI2w/TnSb5hEThHeveHmPDrT8O0DLdxaVSesA6dUZsfzNZXc4Vtsa53ukr/sQVyHf9y2nXyunW2SS+TjJvuJYsLRF/YR6V5AcUb+WVfq3Oi2tlJAddygV7kyp+ZPOU1BmdefMtHdWYmV7mUZPDylrx5Z3PI+/eRsGow6vjcegUDXaw06MM0Cx/D4f4WhbXz5YEfeeAAxrlWhAXhHBbjziFpqoB9D1IP9YKN2zJz/SJLqB21gRpMDfRoihI6wtAXr0b9kmo3FK5hYOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlSe85YeJdNjhtw3GYMgWOKWfWgsSet5fo5tLsjwRoo=;
 b=J6CkDcE1iGSu5MOfjlnyAiKr3Tzja7zuNHFK4RDLbAtXQCOwJAcuDWWMWR7Cyv5yGVY8GY+qLgZ2HmcN2H3STkcZUv0uHjv4/POuxXOTe88rrMhGhXjABuRabnAAplFDRu9KjfZlTiUbM4boZ7NIjTmMs7vCPg+eB5TpLNiScnzwEeViUgxu2YMdF1g2RpTfz8Ztd07nyIhzIWvfIEHa0adUFZFfB8D6DsGHd0bgm4pvYlI12pdxHjRUN7nOP9oW7MdBJMME73WA1nVWh5x8jUsrC4joUE/ndne2IlIbdR6KXMmwtqSn47a9qtVHwovasDaWtBS7igubVIWuGpoQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Wed, 23 Jul
 2025 15:50:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 15:50:07 +0000
Date: Wed, 23 Jul 2025 12:50:01 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>, <intel-xe@lists.freedesktop.org>, "Linux DRI
 Development" <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Jul 21 [drivers/gpu/drm/xe/xe.ko]
Message-ID: <di56uabghjhn6pst3byqplwkpy6oin6gjqjlvklolp7h6kz4vc@ygemqab4dj6t>
References: <20250721174126.75106f39@canb.auug.org.au>
 <70458c86-597a-4346-b18c-1fbd9a833a55@infradead.org>
 <esdm6jfdkdbaeaphyhtfsckiii2tptdpe6dffddp5sqyg2klhk@b5dtuayqqpht>
 <22f5d759-e79c-4231-bf4b-2e498543aa5b@infradead.org>
 <vpdxxpbbirslnp5m2sdaz74ehdwc5tp54fp6rp2kxtt7vmr23e@lnp5lp7vzryy>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <vpdxxpbbirslnp5m2sdaz74ehdwc5tp54fp6rp2kxtt7vmr23e@lnp5lp7vzryy>
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: f49bdae9-7d50-4c74-c524-08ddca0098b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CevDlUk7xRLh9W9XLjw84sE0FlqxJoOJp87gUE1FhlU7SvE+wRopxYJAF72n?=
 =?us-ascii?Q?DHzazNYjoGbYVr/uGbXsl30bQjhxKqVrBRwoyOYRCUdVpQhsLahdT2x7gFHH?=
 =?us-ascii?Q?cfNbQ9d9jynOU/7Vkr2vVu/U2kroMxebkKi9tzHzKqlaVcvCmTO8J2g+nb0k?=
 =?us-ascii?Q?aalVr7n18frTjV4x1NZkDnY5TgwOwBFSvMx5Xizfwb0hrtXUm+xYzI6O5/tH?=
 =?us-ascii?Q?02RSS6gpfXceU0dE7bjI4UG1x8JiS97YwNIk1aB8ezDmUpxQQmRDdbEWXdzb?=
 =?us-ascii?Q?H/fUfxvvX/YtrAkLR/aAe8vICasThfq+q8Cf37aoiAac78gfIJpHnaQnsGV7?=
 =?us-ascii?Q?/0Hl3Yw4mihOg9WRMwsiSD8Db1VVicwo3l6Y4jg/TChzmVO+pTflOa01RZbQ?=
 =?us-ascii?Q?M05RXuX9d5UtoEojuEdhfd1ynnzy+DwXKd8VW1oxUKOlrkMUdqsySyP2uY/N?=
 =?us-ascii?Q?F7PRyIfHzIL7RaClQtG66bCM+0rfeLOScm6YDlpiThVm4KCcKdiHkZM7vZpK?=
 =?us-ascii?Q?F6qgD6XlC9ldioNO/ENynZ4Lox5f4a9nkmYqUba3X3zyBPVbMYl0lAbw67qr?=
 =?us-ascii?Q?OPdIN4F0YAia1XJBf/TCmz0cHUyxgAYZYRmohhpqLetOyYDUmgrpGBLV6qWz?=
 =?us-ascii?Q?gFxmg6VDRCJehzf920kw9lFzsQtJY1DYUsuiQ0ajDZkofgXq2XIlCl877FRA?=
 =?us-ascii?Q?3LkPU90zLWgV/R8LzLAq60Rrnys/q7A5wDJDmXsfgvqE43JVNcdD+5cC9Fj0?=
 =?us-ascii?Q?4X9SjfKF8Vz7cf7Rf1Z7+eVicyO51jAicJK64nr9kwbadnBPP0ryi3s1HeyL?=
 =?us-ascii?Q?Owt6uJDzAgmE3u9sIyhjJPsw0NAGSKEqbhB9GOxR8pbi4UcqOFO+8p9yNufB?=
 =?us-ascii?Q?TeyMq7msP0S9kjkbPyTfwg0GT842abNHqB73YLO2sO1YdvBRQ6MhXRGOJEDp?=
 =?us-ascii?Q?VBvHj8lIpfN2SjH+T2+nYrlUCdjkzunrQ0rgHUvQI/xa7nYAc70p8nXpH13M?=
 =?us-ascii?Q?dm2qVwFUQeWR3gbuygq07EoY8sxvJCxq5hqiiAzwi5NfnSv7GTTodSJHMPrY?=
 =?us-ascii?Q?UESviqd63ZWMoughfVI6qpENZTCOq/CSm/1z0edEDeFwhhs5TnBfz8yHlmVp?=
 =?us-ascii?Q?K1HblNVTUnHLXUCOChGiQn2/UHfjJMFE9GpJO3+nx2ipIPS8PTHwm13SsXnu?=
 =?us-ascii?Q?glj+ZM5HgpOgEmh9YDMfeC52IPZW50nWhZ/dMqjUw4BA2KndYb3rkMIHatpG?=
 =?us-ascii?Q?m92JetTfSAMSJQlxe89Zn3fI2+md/0L//j1rGpsjnElYKH2cFB6IwCLovE6L?=
 =?us-ascii?Q?byThtK4Alt3rX2Mad3SWOdiLBsa5GAdhuDZZICXdtdxO3XjPW++XFIue4lC+?=
 =?us-ascii?Q?pU1TLssMUmreSbTzaQThDm10J8+WcGQUN8Jz5noP2AeR6O/WDzkeXmyXEC8+?=
 =?us-ascii?Q?VtUSUiFMx+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iV1+SWgzypz45rt/8youAiBhkwAe/g+ODkui8MbfU8U02lkU9OK2RY7sc4uB?=
 =?us-ascii?Q?YM7s/RXLCB05fcTsWPahs96EALamXGfB7HZAEr37iQXG9OlrisJNmXtx3Tex?=
 =?us-ascii?Q?0mpOuv+bVBa81CybE+f4LdsqKWHJiVlY//4b6UU6vx5I0NRSgFR3OwtwUPqb?=
 =?us-ascii?Q?d+TTHM4w+/UXtbdKTwElazJOpVP6FpavoULw9Wab/sjxALqoQUOLxMOOiRYl?=
 =?us-ascii?Q?EGbP56bazhSCTkPhqfU1O4xew8d3eTOWWJiIRi7DZYlu1KfLVg5awJcm6gbV?=
 =?us-ascii?Q?gJPvPKOvFXI+fS/Yiz86CwSbbkgu2+kXQfeokeznbHkTzJhcx+5I2yhiHIXo?=
 =?us-ascii?Q?z5rkUKUs2Pm+I5A9/EZmb/BbAwcTD1kua7IHYmffCrug+LIamtqLmUvEJpmT?=
 =?us-ascii?Q?2bQz4/JYybUlDMnQoxmAfF61Wel9fXoLkjUbN7nnOfYKvs8xeaPrrucPB3uu?=
 =?us-ascii?Q?yzwV1h3I7kRsYbbRgm2G7Pfhppv2O4kFETnLywTnuusCZKJ0YDMhESXnI9LH?=
 =?us-ascii?Q?JREaSN6lbQjQ3mheWt3irh1b0Aq+asHm+tfclDDnAkkQdIWR7QPuMH1WzX9I?=
 =?us-ascii?Q?tIYciROc+el3Qn0tg8tXZB3QC1l6kgE5yu956FpYg0iY9+1ZLlbQFdqYmx/t?=
 =?us-ascii?Q?jYeZSszyhFGBa6TsaKmhS1pd5009M2lo3Zy7cklcIM6RWf9PGtd3mN/8ITwt?=
 =?us-ascii?Q?p0JvxlusEfNMYqupRhiR+5rDaR8Guh/DEmXcLDPJJgzS/jNZhQA2j4bLFPw5?=
 =?us-ascii?Q?b7r1K47vw818QRWypxfZ8aGheJOo11bOpvYCR2QlGfpcV/+ROF/cdaj/eHw3?=
 =?us-ascii?Q?2YMgzmwNlBqS2RCMrjrA6Uyq+WiGJWu32CysDPS7blmZcIrvEaZUb7srdPB3?=
 =?us-ascii?Q?s1OmUF26haPlnRGoRGkgkiUNNfIx8AN3OIeiH1oFbsMUdfDEWK+f60xe8QWq?=
 =?us-ascii?Q?59tXlbsKP6I2rwMeZplBzYzzz9TgXNmocIWZo5JGFZCte527MBFFiyyKFYgv?=
 =?us-ascii?Q?Q8IMfS5FAzxJO+5oiLf70yjHsfbuf6NXQKA5yM+yqsvq2mgRfuowIT7sgo/K?=
 =?us-ascii?Q?sKmfN4zGHj0jAdlx3wMPAsTRRYBKEwK1cNcixgfn1szIzTXEO7pp+C6Whsoz?=
 =?us-ascii?Q?nfME7gICt25wEnFcJj7xZNteFZ+fh6A8R1xjLw5ruGwIXXBUnpX4qM3CZk4S?=
 =?us-ascii?Q?aHOWSkQIXlyZ51ZR6x399iAXA2Cot67aiDQBRiqikRpZ78YSZm5YcMxEciUr?=
 =?us-ascii?Q?dzHT9/pvq6Tb7bqnFquXNq/wg9dNjVWhAcK6SMHQEGNx69Q5GrCTzlqbbXSA?=
 =?us-ascii?Q?qmZxgI7g7kncURmTC1Cn4jAbyHBeB5J8oZDru4REc6ejreLv1ubvW/HflYQ9?=
 =?us-ascii?Q?PnLgn4zAlRa6cFdiKjS3qyZvex6/mQR2RSk7f7XozYNa7wXw/fTpFsuDlNjR?=
 =?us-ascii?Q?8mVzfJRPdGmlT7GKT+04gQ3APTRaAIuH9nldg/TvpUMiwyfF/ToyO98swZqy?=
 =?us-ascii?Q?qtkKrQ996peMmoDP4irx4M7ypSui/AhWD07355Bw585S4uchSjn4f8MIbitB?=
 =?us-ascii?Q?HaQ343OiNziArfsKgcAN1MRNEjjtB4pn2qTDyySFJbou1d/Q3bU24igE78PK?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f49bdae9-7d50-4c74-c524-08ddca0098b7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 15:50:07.0520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ClF3HoLubHaod3lQ4zAFkSH4GVU0BZfOpF4L6kUiBVdRPkS7iTFpISIr0blYEiCtyV4KfNMexm3V8Jn6hlZiqcEOAFZ4dOyqY8h1sUNjKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Tue, Jul 22, 2025 at 10:26:11AM -0300, Lucas De Marchi wrote:
>On Mon, Jul 21, 2025 at 10:50:29PM -0700, Randy Dunlap wrote:
>>Hi,
>>
>>On 7/21/25 6:38 PM, Lucas De Marchi wrote:
>>>On Mon, Jul 21, 2025 at 01:17:33PM -0700, Randy Dunlap wrote:
>>>>
>>>>
>>>>On 7/21/25 12:41 AM, Stephen Rothwell wrote:
>>>>>Hi all,
>>>>>
>>>>>Changes since 20250718:
>>>>>
>>>>
>>>>on ARCH=um SUBARCH=i386, when
>>>># CONFIG_DEBUG_FS is not set
>>>
>>>can you share your entire config? I have all of the settings above, but
>>>I can't reproduce it with gcc-13. Is this a regression from the previous
>>>-next tag? I think the diff below should fix it, but I can't confirm on
>>>my end nor I see how this would be a regression from a few days ago
>>>only.
>>
>>It's a randconfig, attached. (#1046 is for 32-bit)
>>config-um64-drmxegt is for 64-bit.
>>using gcc (SUSE Linux) 15.1.1 20250714
>
>just tried on Ubuntu with gcc 14 and still can't reproduce it. I try
>again later on arch or suse.
>
>>
>>>
>>>-----8<-------
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>index e9ccab8aedbef..41880979f4ded 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>>@@ -24,7 +24,7 @@
>>> extern struct fault_attr gt_reset_failure;
>>> static inline bool xe_fault_inject_gt_reset(void)
>>> {
>>>-    return should_fail(&gt_reset_failure, 1);
>>>+    return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
>>> }
>>>
>>> struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>>-----8<-------
>>
>>This fixes the problem for me. Thanks.
>>
>>Acked-by: Randy Dunlap <rdunlap@infradead.org>
>>Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
>ok, thanks for confirming.  Initially I thought we could have a
>dependency on debugfs that commit ccbfd2df3018 ("drm/xe: clean up fault
>injection usage") broke, but it doesn't seem so.
>
>So... another approach, probably more correct, would be to move the
>attribute off _debugfs.c, since it's availability shouldn't be tied to
>debugfs.

nvm, the change is correct, it is actually a debugfs attribute.

Applied to drm-xe-next:

	4d3bbe9dd28c ("drm/xe: Fix build without debugfs")

thanks,
Lucas De Marchi
