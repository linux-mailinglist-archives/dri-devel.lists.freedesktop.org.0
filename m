Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3FEC20B15
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DAE10E9C6;
	Thu, 30 Oct 2025 14:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2H3avm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FEB10E9C5;
 Thu, 30 Oct 2025 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761835648; x=1793371648;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=VZkms1i6rPZkKSriuvZ8HzRIilrBAnD6XhKEvgf2xsk=;
 b=O2H3avm6s50lx8jWRXJapkL/9J21IdkFkBsLE6STIvd/fHuaKuMx+jAH
 OYih9YScF1LA+ys8cnVVqV6JR3hKI3nlswxjD+ED0nUKlG3ZfvTBeFXVu
 TuA0nJ7NxT3Bz+jShnSTDgll5nEotwG7hIIMF3AgSnFgyOrv2VBVY47zT
 AqA1dbnNvPDtyd1IgNoA6MXg2t/R5GsKFbqLZVFZYdV99h9Or5slYkBzh
 I/zVts+Xvf34BXxuOYGw4FWYLamZHSz+4da76BmDemMOTMjg3nZFqo5WD
 bJX7T9ab3gcuGjgN2flk6fksK5cs0/S8grh1N0s1qk5mL098ABiTA5VOq w==;
X-CSE-ConnectionGUID: nq/mnIibTP6WVJNR3boaSg==
X-CSE-MsgGUID: XyNw8IPfTxiGeww0JEs9sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63001358"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63001358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:47:27 -0700
X-CSE-ConnectionGUID: e8K744auQsS+5E0E74WeEw==
X-CSE-MsgGUID: /m7DKoL6RcCeWrtArASohw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="191111619"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:47:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:47:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 07:47:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR97Z+MOutKPA6Zv9kVVf8UYEM0JEsG2HaJ/I2Nzt45aH4roBZ7UDJxkqarjSnfq8JXVA7xk1oBWFE1fTU22p/3CzIR8aLe+b+uKREKiri0eFzX80dH7NyPmqodJrV+Ike8wwhvM2oSrVVtQw1mWouK+DlIv8sJmpDkfEj2nO/T+X7HB9sbPQ2fgHImrn3+q2u+fukIPOWV1RaQkF8KyFd+54kY0Lu6HwTSi4THd9UWCjHsi2yiyn5ZGY8iuTnKnQeTFQB/LBfty2rIJuHFzdXJJ0rrBymXLtWwQ7uxdgb3sMqRwfpt6W4xVNCvpy0Jjm3SHSx1JwTlRcoKPsrmZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hi3bqlwMbwRrMSvh0ghRyHrd30NQBjzcfMNHzWGZu0=;
 b=n+vTG0cQpIpGHLm0eW3xQespl2uX7RLbuOCtRJnTQdzK4/eZCwh+GFnoaYM25jEdpbJrRptWIQnVeNJ+amA+ygsorKlFqYxhQSPizzgRRmGkumR2UOxIc914UhrD716di9OjR5vzSrosnaDcRdNiaHnfkSeVVhUlv81MpkvSzpUJ/VTRBy/d/6TzXyPkufKjRlsgQtOJ5ID1oJ2e1X7JV9a17hIA1euzZ8qDe/rZrlhFVEczPAhbrhYd1t9y+P53cR1K2ahdU2ZFj1OQzb5alrLuouB3S+jxL2bONPomibcBBPbYBbSxcOATdpyFAD6AaH6gQ9nt4lxqa41TQuAsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 14:47:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:47:23 +0000
Date: Thu, 30 Oct 2025 10:47:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Dave
 Airlie" <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>, <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>
Subject: Re: DRM_RAS for CPER Error logging?!
Message-ID: <aQN6dqFdrXxLKWlI@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQEVy1qjaDCwL_cc@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3f5edf-e540-4e86-0b01-08de17c33c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F7gOxKxeWXRG4dJKAWBKbyKnixJoh1+CWhsx53r2iRmeBEzQ3aWi+22ndJBl?=
 =?us-ascii?Q?aU19UeHrCnkL1Vk+NgdUQqjMa2L9WTa5IiJSeOoJ7Fs0rIfCYz07G0k4s1cC?=
 =?us-ascii?Q?WM6QquajY0g6e17+A9vX4Q87Xg9GLyAaWYy3rWChjn1y53QocwGjQlpIqe71?=
 =?us-ascii?Q?n+MrcDNgkqSJpBR7MSXyq0LrdZ2/cIfZlk40izwJezMkCuazbudQwCMdLK1O?=
 =?us-ascii?Q?m0zkEeJo0ffiZ69Uh0oGTYTtYoBzMp0kRchLDyhBFe4G3vfPeai8wDjPcifu?=
 =?us-ascii?Q?Md7px3IaBUQMd+43Oq/enSWRaAzP4eRt1WgKULg3nM/pWk/fzg1VBkBAaKVB?=
 =?us-ascii?Q?fE7N8i/hcMAggbO1Pyn6+GA2YEeGhp0Y0ZNAnNCYPjyM8aJ7RAYjO18AIYw6?=
 =?us-ascii?Q?is011JEGU0/LF0RTZlg79onN+YlaiwKY6QNIUJDCS2iH9Rt+yyYjEASMafHq?=
 =?us-ascii?Q?cqwt1PzNNzLiUaqgugB53OXIknGhtcG5clGru3UaX2XiTCsCyXLGYBhsS7zB?=
 =?us-ascii?Q?pE3IZ5+n0bubh+TQ77tSpdgRdi+uo+Uumh2gx+md9FNXCjq7plRgvcvvoOR5?=
 =?us-ascii?Q?6Tc/bBOxkbw2R8gJkv5aahEtiqHRJ3FcRBxec4nglEQWQT5zB67C7NJ3zYH6?=
 =?us-ascii?Q?+qmIiHbhhdtBk4MHKHdlUR5hWiHC3f43FmOw3pSX1+CgBosmqS8Nv/yhUoJ9?=
 =?us-ascii?Q?rs8bS6GHj7Yuik9SXwC/DzJIx8b/AuyKwXmQI2ixZkF99MuMjlp4QPD55PxK?=
 =?us-ascii?Q?9Yy3nn8QpSMq4xtiPZU9ZJA0VoUA09LOXmV5s9S6GPLpRvEYkmzxq0C4/sh0?=
 =?us-ascii?Q?Vzpj+9tcNDEcG6ic8ecKvGIA7oi3eWDWcx5QIs0Ktp23INvaYdOTcjKqw3eA?=
 =?us-ascii?Q?MmjLbyAZi1GSh6y6MzOiXswJAqi33mPGpaHDR27jNr8BRCkiDflB6i5xUhLC?=
 =?us-ascii?Q?WMzdBUUPA99nJyNKos21dsgZePJEz8NrD1f/CRRhV3GAAm+sxsyXNXrjpZpb?=
 =?us-ascii?Q?PnKvZ3ilkL4HfURxluVXbOcup4197jTeeJ82iJoKcr5+TmbLpOvX1Gb2Mi8M?=
 =?us-ascii?Q?LmNoJSfKt4scl94xfU9Y78M0bWWmW+8lXoECnsj8GYlTBKmNipdZYvgOY2z0?=
 =?us-ascii?Q?U/CGECddiPrbyn1XSV56Nvut3TA/2tnyzOrYJyE46aDhgjmWrMrHSIY9/5b1?=
 =?us-ascii?Q?gu4wcEUOEAFA6B+DTUJCYMbqa2PgpHOPb7D5XfocueE12HS6y9GREQj/tSk7?=
 =?us-ascii?Q?WHERnxlh7x7g6YLe1xxaC1Gnx5zN0/8QSpwP3QIusC4AH41t7orvQXcEQbuy?=
 =?us-ascii?Q?z+qGKJecas1RRqgDkQyNSHFL2lYQaADM7pi203av3o8oZFmKnyp5gTiKIr7H?=
 =?us-ascii?Q?kowAuoi4SKy/IfEV0skBR9A/3bFpDAedu6I9KMoMzmeUW0/4AdV3HEE4npze?=
 =?us-ascii?Q?OlDpKiisJijnzhMJtBCn5tW3Xyjj6Xqg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N+1Vlk3sD0rNaZpDLPPVczoyFL0RTazT/u7dBwFUqkUJXcNYmAMYaBCub6ID?=
 =?us-ascii?Q?W9UrlRJob9doWCnFfbWRDNkblpfRSqHnrPQneVfrkX0lokVA86pbv77kBBp3?=
 =?us-ascii?Q?w3aACto336i0wQlNkeITDzaK2lcer49e5qzT5q131SCVte21lGi5JbFYrrm5?=
 =?us-ascii?Q?uYlC0mUdL5OWIFYXiaA3rdI3al8D7EkB+ZLdn9xrS3UK9LJrtDHua1dNkdMY?=
 =?us-ascii?Q?atqEPXs9rsNV//l0Clf35vKOoZcWfXRjINGGkoXYC3AKHsbVhvxYqK2XTuCC?=
 =?us-ascii?Q?dHCgD207I+IO1hiBgEBnpz54pTUkDti0gkk3aXUH8C7L7Dkzlk/U2NTW7swA?=
 =?us-ascii?Q?/wdmcEiPBNQCt3540Cf9AIQ/SMQJu/6o9QawTkSidpN9XmO9RqUM5Y7mtwks?=
 =?us-ascii?Q?WPYeNJ91b5F5ADVcYOMU1T1o0X8a9V1UTc8yUqxcz01zB2Y07avM4RbT130f?=
 =?us-ascii?Q?RmGsWw9JDPsFqc9y5wcpK/rNqgcU+8VH0Ef92VMAqJPQifPkoj3l1/rJePr6?=
 =?us-ascii?Q?/2ghG7gXDW21x+eVc6vt2AWN+ClemNuypUMhIbc/3GyWY4blou/8bU4qsbk6?=
 =?us-ascii?Q?biyxYibwD6KVO2S9/jQfj65RyoN1GK+FQBlx/VH9PwjXTwcb4YjkLJYiyvye?=
 =?us-ascii?Q?KqgPk4rYf/TvASYfze2gdOj1qWsx+BR6U8j+nhzkHR0ElX3/+sYN06TQwppt?=
 =?us-ascii?Q?h6tTxLEW/61RHwcjIJaSuoJGc24wTpf3rIY9/K0Z5s+nSozPWO0F3FUd5DQ/?=
 =?us-ascii?Q?42a1YZha5pIZdBjcu219nmROYb16thGr01zCyvYJp7oSxDi8QTynkDdqoR7m?=
 =?us-ascii?Q?oJSWCbcBkPli+55o1kJJL/WXN4vVzm17tKXi8GcuPcuN90VvNu5faeJEsXws?=
 =?us-ascii?Q?oacZQUcp8zLZVqRT/+PHxV/sGQwXeYTbTzQ5t7ni4ifofTwnZ5JGC+xXdOtY?=
 =?us-ascii?Q?kUfasdl0t7X6zm8Fnyimpot8TZ7yK1jtH6SAwVZote+6vaYqfS2GApPT7Dwy?=
 =?us-ascii?Q?uPLCdS6/+dP0Idp+VDpRv49eVDjv2zZJ4EYp3Rj3PmCpMTHVmG3ULqU2pQW0?=
 =?us-ascii?Q?6Lcqd2PwJl1ujLJHUprlwTGYrvLtvaJKvGAIGG6gauHzsxALdq7p/TC1a2EG?=
 =?us-ascii?Q?JqAp/TscsecixW3g40UCU4ZKvlkdlQUFbVVbKy63ITbmKHaw6sUJSL1CDUmC?=
 =?us-ascii?Q?KIvtVmY0p9znLMYc6e1txuYxgOvh50qiOI/kk1Qv0Iug/nhkZ/ImJ//eqNxI?=
 =?us-ascii?Q?L0JImWEn+lZ9w572vV7KqRTJj2i8TI/o3rIrANNT+dJVu+Mf5ytY92eBypiB?=
 =?us-ascii?Q?zi1NRte0irb1jq7jadYH8u65OJZDlVVLNzEj+WMZa/raZgL4T7pXlf1+J5Ao?=
 =?us-ascii?Q?sEC6cIq/f3JFv4Jkv86MVz3RfJ7WMF4GVYPgjyhTOHaP8l+bwvIOLXUvUS7K?=
 =?us-ascii?Q?UznXs4TwdfrR3Hx8eRJa1RIWnve0SMcw+mtZ3zD+Syaj7Ets9et/NSjJCoiR?=
 =?us-ascii?Q?QcpoiuRLYKEh6ZqAwtH6M4Cxx7zWIupHKF0ve++iV+ybBKjDXKv7NfvJHa1a?=
 =?us-ascii?Q?1M5o0AvZEchOClXghLl6DC4b/mluj+6+seb2Ghbp1HEuXPKzN937MrQQMir+?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3f5edf-e540-4e86-0b01-08de17c33c73
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 14:47:23.5711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7yKM2c3gu8zvbOE4VGZwnLmSV4FdojxX90g9QmObOeRiqbrWzmmlwa5SE7CIJWgJhTwIav4kTM6qA5/Ya5Qnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
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

On Tue, Oct 28, 2025 at 03:13:15PM -0400, Rodrigo Vivi wrote:
> On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:
> 
> Hey Dave, Sima, AMD folks, Qualcomm folks,

+ Netlink list and maintainers to get some feedback on the netlink usage
proposed here.

Specially to check if there's any concern with CPER blob going through
netlink or if there's any size limitation or concern.

> 
> I have a key question to you below here.
> 
> > This work is a continuation of the great work started by Aravind ([1] and [2])
> > in order to fulfill the RAS requirements and proposal as previously discussed
> > and agreed in the Linux Plumbers accelerator's bof of 2022 [3].
> > 
> > [1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com/
> > [2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
> > [3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> > 
> > During the past review round, Lukas pointed out that netlink had evolved
> > in parallel during these years and that now, any new usage of netlink families
> > would require the usage of the YAML description and scripts.
> > 
> > With this new requirement in place, the family name is hardcoded in the yaml file,
> > so we are forced to have a single family name for the entire drm, and then we now
> > we are forced to have a registration.
> > 
> > So, while doing the registration, we now created the concept of drm-ras-node.
> > For now the only node type supported is the agreed error-counter. But that could
> > be expanded for other cases like telemetry, requested by Zack for the qualcomm accel
> > driver.
> > 
> > In this first version, only querying counter is supported. But also this is expandable
> > to future introduction of multicast notification and also clearing the counters.
> > 
> > This design with multiple nodes per device is already flexible enough for driver
> > to decide if it wants to handle error per device, or per IP block, or per error
> > category. I believe this fully attend to the requested AMD feedback in the earlier
> > reviews.
> > 
> > So, my proposal is to start simple with this case as is, and then iterate over
> > with the drm-ras in tree so we evolve together according to various driver's RAS
> > needs.
> > 
> > I have provided a documentation and the first Xe implementation of the counter
> > as reference.
> > 
> > Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
> > exercises this new API, hence I hope this can be the reference code for the uAPI
> > usage, while we continue with the plan of introducing IGT tests and tools for this
> > and adjusting the internal vendor tools to open with open source developments and
> > changing them to support these flows.
> > 
> > Example on MTL:
> > 
> > $ sudo ./tools/net/ynl/pyynl/cli.py \
> >   --spec Documentation/netlink/specs/drm_ras.yaml \
> >   --dump list-nodes
> > [{'device-name': '00:02.0',
> >   'node-id': 0,
> >   'node-name': 'non-fatal',
> >   'node-type': 'error-counter'},
> >  {'device-name': '00:02.0',
> >   'node-id': 1,
> >   'node-name': 'correctable',
> >   'node-type': 'error-counter'}]
> 
> As you can see on the drm-ras patch, we now have only a single family called
> 'drm-ras', with that we have to register entry points, called 'nodes'
> and for now only one type is existing: 'error-counter'
> 
> As I believe it was agreed in the Linux Plumbers accelerator's bof of 2022 [3].
> 
> Zack already indicated that for Qualcomm he doesn't need the error counters,
> but another type, perhaps telemetry.
> 
> I need your feedback and input on yet another case here that goes side
> by side with error-counters: Error logging.
> 
> One of the RAS requirements that we have is to emit CPER logs in certain
> cases. AMD is currently using debugfs for printing the CPER entries that
> accumulates in a ringbuffer. (iiuc).
> 
> Some folks are asking us to emit the CPER in the tracefs because
> debugfs might not be available in some enterprise production images.
> 
> However, there's a concern on the tracefs usage for the error-logging case.
> There is no active query path in the tracefs. If user needs to poll for
> the latest CPER records it would need to pig-back on some other API
> that would force the emit-trace(cper).
> 
> I believe that the cleanest way is to have another drm-ras node type
> named 'error-logging' with a single operation that is query-logs,
> that would be a dump of the available ring-buffer with latest known
> cper records. Is this acceptable?
> 
> AMD folks, would you consider this to replace the current debugfs you
> have?
> 
> Please let me know your thoughts.
> 
> We won't have an example for now, but it would be something like:
> 
> Thanks,
> Rodrigo.
> 
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --dump list-nodes
> [{'device-name': '00:02.0',
>   'node-id': 0,
>   'node-name': 'non-fatal',
>   'node-type': 'error-counter'},
>  {'device-name': '00:02.0',
>   'node-id': 1,
>   'node-name': 'correctable',
>   'node-type': 'error-counter'}
>  'device-name': '00:02.0',
>   'node-id': 2,
>   'node-name': 'non-fatal',
>   'node-type': 'error-logging'},
>  {'device-name': '00:02.0',
>   'node-id': 3,
>   'node-name': 'correctable',
>   'node-type': 'error-logging'}]
> 
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>    --spec Documentation/netlink/specs/drm_ras.yaml \
>    --dump get-logs --json '{"node-id":3}'
> [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> {'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> ]
> 
> Of course, details of the error-logging fields along with the CPER binary
> is yet to be defined.
> 
> Oh, and the nodes names and split is device specific. The infra is flexible
> enough. Driver can do whatever it makes sense for their device.
> 
> Any feedback or comment is really appreciated.
> 
> Thanks in advance,
> Rodrigo.
> 
> > 
> > $ sudo ./tools/net/ynl/pyynl/cli.py \
> >   --spec Documentation/netlink/specs/drm_ras.yaml \
> >   --dump get-error-counters --json '{"node-id":1}'
> > [{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},
> >  {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},
> >  {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},
> >  {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},
> >  {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},
> >  {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]
> > 
> > $ sudo ./tools/net/ynl/pyynl/cli.py \
> >   --spec Documentation/netlink/specs/drm_ras.yaml \
> >   --do query-error-counter --json '{"node-id": 0, "error-id": 12}'
> > {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}
> > 
> > $ sudo ./tools/net/ynl/pyynl/cli.py \
> >   --spec Documentation/netlink/specs/drm_ras.yaml \
> >   --do query-error-counter --json '{"node-id": 1, "error-id": 16}'
> > {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}
> > 
> > Thanks,
> > Rodrigo.
> > 
> > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Rodrigo Vivi (2):
> >   drm/ras: Introduce the DRM RAS infrastructure over generic netlink
> >   drm/xe: Introduce the usage of drm_ras with supported HW errors
> > 
> >  Documentation/gpu/drm-ras.rst              | 109 +++++++
> >  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++++
> >  drivers/gpu/drm/Kconfig                    |   9 +
> >  drivers/gpu/drm/Makefile                   |   1 +
> >  drivers/gpu/drm/drm_drv.c                  |   6 +
> >  drivers/gpu/drm/drm_ras.c                  | 357 +++++++++++++++++++++
> >  drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++
> >  drivers/gpu/drm/drm_ras_nl.c               |  54 ++++
> >  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 ++
> >  drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++-
> >  include/drm/drm_ras.h                      |  76 +++++
> >  include/drm/drm_ras_genl_family.h          |  17 +
> >  include/drm/drm_ras_nl.h                   |  24 ++
> >  include/uapi/drm/drm_ras.h                 |  49 +++
> >  14 files changed, 1049 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/gpu/drm-ras.rst
> >  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
> >  create mode 100644 drivers/gpu/drm/drm_ras.c
> >  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
> >  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
> >  create mode 100644 include/drm/drm_ras.h
> >  create mode 100644 include/drm/drm_ras_genl_family.h
> >  create mode 100644 include/drm/drm_ras_nl.h
> >  create mode 100644 include/uapi/drm/drm_ras.h
> > 
> > -- 
> > 2.51.0
> > 
