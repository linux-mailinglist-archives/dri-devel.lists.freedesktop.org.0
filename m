Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B49909311
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21410EE53;
	Fri, 14 Jun 2024 19:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVWuH8CZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA4410EE4E;
 Fri, 14 Jun 2024 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718394351; x=1749930351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VDYySREaEXS/O+3fLpXfX8AYvopclGHUOZpw33cvFdg=;
 b=MVWuH8CZo00A1IABr82vz5iAp8RES7vDTGCZ0sbhGmMfNFjNJh7BDqKH
 hZT7glANG4BcYn/6T54hB5zcBauJhR1LOMlIpv9GYL39DSRQAURWy1IR/
 JGsDgfJWTEYYKBtt3OZX+kIJGAJJoH45D4v8jnmtXTLLiOp2H+6PC4+Xe
 IPGAK20hLydk4hQ/0U7T+02v2ePFE7F4ZVLm1wS64J93tx6zpbPXq14vm
 qqiHgyV3RZ13PPeJyBYIS7NLJlQAPnunEFJyEpnE6QnjRMYP+fJpPn0Fs
 h1bnyj2xvP2T7XGWGR+CZOKVgqs4chrYs/ilYCZhkIpUpA0NK2FYCpoG7 g==;
X-CSE-ConnectionGUID: RdrwPRPUSPirBz7r+ol5yw==
X-CSE-MsgGUID: OJSBJsbITdepGXV4orFiiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25978082"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25978082"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 12:45:51 -0700
X-CSE-ConnectionGUID: EUIswRslS5W2j/OKlVjd+w==
X-CSE-MsgGUID: ONcR5QTkQ7GbTcqvM2u8OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="44971309"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 12:45:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 12:45:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 12:45:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 12:45:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuY0QvuOx+/q0Ma0CruTUxbH/mSdIRaDQzosllH94I+6V3s7v0KsSXYTGfgJ0O1cHxz4gqaZvSfNCiTDjO7utsouZULu4kftFNsyim1QDL/+LfaZgVMH+4pg/KVKLJUQ7sbRMg8Zatuh1z721upj0x9yy/J4Sn4GAeJhVONdNpo8TYRWMEZQLFglb22L7v8jQrauDpv20nnlsOhwx47Heh2An0A33P5/zHTZiiA0k6A2f4B9WTzHecMP/WvlYkRWnPikXQSz//B6nXNy6mTAKQYB2ERgyMBuiUE3wM58ycfSsIgYzs81bKQJp94wWR0WgxiwtdM3CBerFVB20i0mig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3JSN/zfyitYhSsBHcvOCSMmPWwR7Bsfzb+m8cKoyOw=;
 b=P9J2ucCbnVUpw4ml8u1u+jMNVaJLGO/T4IJWBeSybdljnQ5WVknTEX4+QoMhRzjJ3V2wNjVjdulJCzs/51GeL1WU+cvoLvYMH9cqvnf5fYbJ21aM5MVXTrRIjbnnqyEKafwYJ/I5JdwRDkWjah0kQHmLlh/YEhB65Fdkp2Xg0g0vAjn2pICOO3kWrymIYVlvhu279JJV6UTpRzIHRl0esyuAdsILHsM4oB5/0NEu+uyFW4ydHxxsQDPniAs2icao2QYsueeunR7eAG84yc3Pj+uThdP7Aj7DEmxvQwsDeWEcup7ZxvJ0Z3pXB3cZW34iw4RyMJSWV1YbRFx4lQnqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 19:45:47 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 19:45:45 +0000
Date: Fri, 14 Jun 2024 15:45:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/i915/gt/uc: Fix typo in comment
Message-ID: <Zmyd5O5LJU-RvcUD@intel.com>
References: <20240613222837.552277-1-andi.shyti@linux.intel.com>
 <ZmxgEZe5ztpBzUYb@ashyti-mobl2.lan>
 <CH0PR11MB54440CF4CB01809F00A1B0D4E5C22@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54440CF4CB01809F00A1B0D4E5C22@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 831d799b-8ea1-45e1-8eaa-08dc8caa952c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LqOHUZ8EYWI3xmNikR7Uy5X4xazCi5+4pmqwx+R1QNUr+ZZhWObkj24plDU7?=
 =?us-ascii?Q?RMqNnNoX6chBzc8egS1y/kgNwOAEfSI9jSSsZZye0qYi2tIYN42xvYmJ+3se?=
 =?us-ascii?Q?nBU6epKaY3aWTqpVZzn4VLb4qIz5WlzfhGqcsMDhVRrrsy53xsYbTgXQR1KZ?=
 =?us-ascii?Q?WbyK9ZN3wA+8cbpM+55hl+UaAbgAR4h9oQs7Hw196hP1mGrnuo3BBCShPrlt?=
 =?us-ascii?Q?mCqCpDN1HtJkA8rqXLsFlYhsFTdGAPk1YGvWTl9gw4mIaXgJUFa/PaxPCDWA?=
 =?us-ascii?Q?pkdLQ2ZAIZtQxwS4n15n0uNJVnhrbSRZGowJ68F9HsGPQXImAFU25ENQVnPQ?=
 =?us-ascii?Q?DF2d8sI8bf+b9r1OqlNxuwKYjWYoLzBvCntQGrxrPUTcXveDE7tumbWSdpdo?=
 =?us-ascii?Q?v9CB3uOtE8KieskngXN3f585Y4uVa74Zl47D2s2e2PoNT5U8WOwfRuUx5wTl?=
 =?us-ascii?Q?i9DFOSF+xwo8cQThigwyO2tcRU/O9WrixrRxk7nho2Kp977g5FOPXMOiJSpG?=
 =?us-ascii?Q?cCGD1eHEnlOJJWncqw3ljjnsmUxc3KiY+ISilzmX8s4hNsezWUD+w3j1GEUY?=
 =?us-ascii?Q?A+6QV0hlQqjBhuxGLP5eOgF1i3SUobismuCfYD7Zbd4/ArVnrht9JtGcAykO?=
 =?us-ascii?Q?yRniWmI7gHF8cywQnMsvV74yf7N8hC+LtC8P1v6MYwR4cEKxT4imcfaNznXo?=
 =?us-ascii?Q?o2aXCSZBeppfNywOodh1JDm62w0P9VYGLYTJSKVSNKvVK+FFOSUkbgzVt0k9?=
 =?us-ascii?Q?tYkpwcL4IHyX2fwexMMsf9+VmTd5fovoVXNwTLv6Mq9KpA2ZyZTybUQ5pfNs?=
 =?us-ascii?Q?AaxSTXvIQyH5cBzAOnf//1U22awTXNENtyFJ56cH1zOAOYr2D3DiZorgno0L?=
 =?us-ascii?Q?T9M1pxCZn8jc+iC8nOpMdRTqjjhCVoQPcaQFclKcqJi+RlNE8MsZWT8VKilT?=
 =?us-ascii?Q?Nd+51vUaeR5bRyWjb1Qods/fErd0PUpdUjHk+iwsBoEA9Oz4NfXcZDzmiXNm?=
 =?us-ascii?Q?jNeC5vuRnZHZ+I8XshWGXR3tuvqT0OgMUv2Lz/M6SM5U8gLEjQVh/XFXWGqW?=
 =?us-ascii?Q?LtbytglFk0escHJ8YP7pYydbHAPTSE0ZnyXr6kFVdpcWMKgsPn5MWQIlROg6?=
 =?us-ascii?Q?Fk5oO4HK2ibbRaXR/LPGtPKYJYqK6Zpcjt4mn4NLrM132bWeuOIXu1rfHFvf?=
 =?us-ascii?Q?xp7jczSU0YNZRrdb9P8BjyAr2XK+y8JPZBYSKm4tHqtX0oiEQlfZB2z0RFNi?=
 =?us-ascii?Q?hbIUhxb0ea6gM2ayveAqXJUi9TQtZtzruPvkIrLNYHegdWXbnO0i45+D/Z1U?=
 =?us-ascii?Q?G1kdLrBl6Ly2OFdqR+cuZ7jS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUyNn96loWyGk4kQspWrSFeyx+Q2Kbsj8WLKl3uGg0IEG3t3Wpv1FC7UVZg/?=
 =?us-ascii?Q?+ghuC20RumP9Z9C63L+ODYU8Z+6nH6LRQV/qiT1Ic9RtakHFuKolvnvko/e0?=
 =?us-ascii?Q?4/UvXSyz99bJbE08pmQFYipgeSGnQy+e6VMFvczZ9UeshtX8S2jrgoJp/d0z?=
 =?us-ascii?Q?l+meNioVjtEfur/hRlGHfRBTPPerfe7f0BupiJatO9ZMQ7UOCnMYghntIJOF?=
 =?us-ascii?Q?12F6B/qYVUTLpwxKtE3+wIuKMKN8KQdUyLSpTCwo8SM7oIdPkU5MLNVFY71G?=
 =?us-ascii?Q?ZjZEMNO38fANof5VUGNVcE6sovJuF6TI0YMgEqwCgHK/wzTxpYTau6acPVg2?=
 =?us-ascii?Q?15BxPDFjweWt7VHTl5vBIO+omcGf49fGzsKG2W9BrZifi7vYDrmEVQtJJwQY?=
 =?us-ascii?Q?vJC7btW647WoWPRDejxHwuERX/QUsE8rvMNlYSzKtpo4ZTbbY5ip28bCjitl?=
 =?us-ascii?Q?O/vqe5DCk0hw1Q56fv27+iRfIwLrAL5oWOPbG/3s7v3kjMztwAP8JJjMuWpD?=
 =?us-ascii?Q?F6csW8Pqg93KGRI6xnw52+SZ61e+zb4LiNKNmNLp6JHnzVLSx7xgqnpxVkgy?=
 =?us-ascii?Q?9q3Bxydnt6KKdHYB+mSFAJo8iKhquF116Q9y2d9k+Bra6Acdc71cWiHoC+7j?=
 =?us-ascii?Q?9v3nuSLmEXRD5mZdeyCAj8NMlHsCZ/S9U53qrZwxWZxCrzz7Z3MLLXGHZosN?=
 =?us-ascii?Q?MRLeSeFxuT/D6azUDwx6p012gAspiaxPuqRvgp/Tdxj0TqEokLsX0eyZ9JBg?=
 =?us-ascii?Q?dIR4JEYba36o91xvs4p5b7s/FdCIZ8EGGosrheN+IVwsDVgvt8gJ2AXU/g1H?=
 =?us-ascii?Q?kPYui2wgJQpDuNtkApSDcz02lnRmuCeHCFjsU7ARkfBU1GXGRqDP0ehazlZo?=
 =?us-ascii?Q?UAZzpu3fZW01qZ/dhk393O2oBFSVBnz/BOs6i+A4tWvVbpQnuq8dPmas58zh?=
 =?us-ascii?Q?Ct+UQIhI4UJ2YshWmq3SVSDzl54vTcROtYvqkV6nFbyDipH36qIGKmU5X/bX?=
 =?us-ascii?Q?7T9PmPuUvI//9+XJQeiPDK2P1FITeXHfiIicfSUteY+0p29o4dCckqePDYzB?=
 =?us-ascii?Q?iyBMTywt3LZUppX1/ARBclhvyWQZex3e/B//l3mtUr6+CK1tJH6q6aUU6Sug?=
 =?us-ascii?Q?XsjptoH4juaCS/EMa7iJ7UlDavpysuSGYVMA/n8HRnXMqoQZv/vkrDTx66Zk?=
 =?us-ascii?Q?i3zC4NnCNRd/8TZxon0t9kGY4XgkCCvLbUiFxeDxcFEzlXJjlmNbaETT6Nq5?=
 =?us-ascii?Q?rAM8zwSV3KkH5R+Txa28G0UqVjWlwjyScNJfD/9wHzL0qQuYHtVj/07g9IEa?=
 =?us-ascii?Q?utOQmeMDbK0vKnK3vk1OxDVn5nymMUC+J4CsCnjG8gX59RzKGpHt/3etc394?=
 =?us-ascii?Q?FXzusq74bbbvQeFCn6qu/86XePWD0RKjZINMHBFbHDnMRmNnTigRZZ1dpAJL?=
 =?us-ascii?Q?SDQxAuti5eYossZhS/xbQDlgSdZS/3WDs7gzvfkpOUJuBJAO1CLvqUA6aaxA?=
 =?us-ascii?Q?uNAWSRnsP5np5NGWtGnxdnCWadrSz47XA6Hl1vSjYmqMN1wBQ3aJyIxyFDbz?=
 =?us-ascii?Q?4byJyRtqph+HT6wEJws5MKuq65hRU5eUXCNV061sqRY+gJRUEV/glqdJl9YK?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 831d799b-8ea1-45e1-8eaa-08dc8caa952c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 19:45:45.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDVNX8/Aa21FyMACFcjaxDvyhYX8MuNWBrFOvJ9IG3/qyB9/Ebmx23BVLIysylqpQryF6nAz5faUJ2Mk9XSYDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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

On Fri, Jun 14, 2024 at 03:23:54PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com> 
> Sent: Friday, June 14, 2024 8:22 AM
> To: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists.freedesktop.org>; Harrison, John C <john.c.harrison@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: Re: [PATCH] drm/i915/gt/uc: Fix typo in comment
> > 
> > I guess sparse and potential CI errors won't minimally relate to
> > this patch.
> 
> Yeah, I don't see how a change to a comment could ever be related
> to any CI errors:
> 
> Reviewed-by: Jonathan Cavitt

Please ensure you use the full line.
1. People don't have to go to the header of your email to get your email.
2. People might not be entirely sure of your choice of email. Please notice that
even on Intel many folks have @intel.com and @linux.intel.com and sometimes although
responding from one, they use the other to sign things.
3. Tooling! (b4, patchwork, etc) There are many tools that get these tags directly
 from the email response and by using partial one you can complicate things.

If you also allow one advice, try to use a terminal mail client like mutt and
open the replies in your favorite editor and add macros there to add your lines
based on shortcuts... For instance, on my case I use mutt+emacs and I just hit
Ctrl+c-rev and that adds my full rv-b tag in the response.

Thanks,
Rodrigo.

> -Jonathan Cavitt
> 
> > 
> > Adding also Jonathan in Cc :-)
> > 
> > Thanks,	
> > Andi
> > 
> > On Fri, Jun 14, 2024 at 12:28:37AM +0200, Andi Shyti wrote:
> > > Replace "dynmically" with "dynamically".
> > > 
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > index 14797e80bc92..263c9c3f6a03 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > @@ -295,7 +295,7 @@ struct guc_update_scheduling_policy_header {
> > >  } __packed;
> > >  
> > >  /*
> > > - * Can't dynmically allocate memory for the scheduling policy KLV because
> > > + * Can't dynamically allocate memory for the scheduling policy KLV because
> > >   * it will be sent from within the reset path. Need a fixed size lump on
> > >   * the stack instead :(.
> > >   *
> > > -- 
> > > 2.45.1
> > 
