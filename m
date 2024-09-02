Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF748968F80
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 00:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33B810E3C3;
	Mon,  2 Sep 2024 22:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZ12gnR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3959310E2A4;
 Mon,  2 Sep 2024 22:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725315721; x=1756851721;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=faKX4AKta+D2hRPbM7au6eD//wAGH6Jf+3URlJM1Oeo=;
 b=aZ12gnR9M+/fmk9+ok4xNIYs9fp5QXVMuHEBow2o+TLVEX1w9xvsLdbl
 CQIwFoX8QllYxFxkgAjICh862fgjKj4rCQ0JlXp7TrC0X50QlC8TeDn8F
 pbstCoUI2eqchZ//GEio+06S/eX22F/0NybQqRbEEicIV6Y5jaIwSBts7
 KMF+02pQV+5vacVTBjox4sPM0DB8MIJuNYlRz7NGJtAokNxKS9CFWcXYV
 MKpn4gPdMNXxTu9bDahY9U94otD/N+No+Wt+35TBAGaDKqzSnZJH28Ohl
 s+voykk3MIqbmTwLNRKMHqrpqPTVovMiDyYhtChzha3alBjBmClxz9p7o g==;
X-CSE-ConnectionGUID: YkMkHfaXRoKlp0/SCCEW7A==
X-CSE-MsgGUID: upl2d11TSRGrxYB+sEwn+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="26808657"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="26808657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 15:22:00 -0700
X-CSE-ConnectionGUID: w3aHPmdaQNKVmf3rBTWdgw==
X-CSE-MsgGUID: 1F40mayGTc27R2Ju4lqiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="69347477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 15:22:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 15:22:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 15:21:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 15:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHHuvQXdmSa/GdinEWZAaRk75UhbfmHBjV1QuR6PpV185u+FZzUBaoIQCiv4FkY/p9Yn2nOy/Q8xWHTLtcK8GeOUw3V53dyxQb+IcyUWTeFuetfK34vZP9hEdu36S/aTBYzuhyRvQWhg5nzfG+0U/Cq6NXsDaXrhqcRrA0mEjeW3VqOwKAhUjarvLYQPEgJCtMqvJiXlDnCPZSL8D/7qU4RZh+7O3ICvDFZP/thsnzDqlfpTMKt2Ktpr6DLUaCYaBDGlMMsKLnRqfSkB6s0VscSfu7ttQtMHZ3FF/lEErmJunnLgQgaZTrOyuLI/mP9NHzPLGh27BlYm8c9FIQCOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob9MGZy52GIxODemmSxIyQJEA9Yr81brGex2xU7ek6A=;
 b=wMauKEhWyJ60CHazw4fYWgxrMg/orKMPDMLHJNpM9okFl7g1nZbAv86tRDy3mVvFjUHztIZbchG1QOW9E8iSZOBj3DxW5LNSVQnCN9H7P7b9EMgYar1G64493dgxMz6B1eJn7bJiZMTO1IJETZSRazyG1TQAGhjPAHoJie8jlUImm/W0zsuRHoirlFWy0HMtykOKkYKLAIGg4mEMj5i818fHGVo+BSU2PeMUeSGf6VMIaEPBPhv84LOt0DTFqjsd8eJae0vuwXzcn0lUvgmQMqKl0lmuSEkncp6PLGHiJUrb8VM9dO4IBDSjPQC0Bd2Te/okOOHd67PMcquUQAvOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 22:21:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 22:21:52 +0000
Date: Mon, 2 Sep 2024 22:20:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <matthew.auld@intel.com>, <daniel@ffwll.ch>, "Paneer
 Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtY6F7v/zIUnG6Kx@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
 <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
 <ZtW0N_p4KtiosN4J@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtW0N_p4KtiosN4J@phenom.ffwll.local>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 8443280d-3ecf-443f-a2a4-08dccb9da509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Q/sbnPwsYd25CIPnM4dUkP1l3vFCWnjEEjZluATGlK0UA80Np7YPFUW0Mx?=
 =?iso-8859-1?Q?QD1wrQYztsrDGey4ZQH6uREa0yGwQrfJzqnh5WL+aXRrbwtv5AOzWwNBhU?=
 =?iso-8859-1?Q?XfkrMLxbldveilQPcapUo7XW13Y7hT0g2c9HCWik82tAVd5w0h3OWaXRca?=
 =?iso-8859-1?Q?M3yEBTHLjvn2yaEOzusYKr85629h4aqixLNIPaCaoxiw9f8TOpfC+FViKn?=
 =?iso-8859-1?Q?aZtUKkw5jfg0OrSGEx9lw5ptPQYiEVuIOWN0m8qOH2hiq/xiGKN99uvNaF?=
 =?iso-8859-1?Q?EjLd+ZxVqt4+/lXDskhxAejmdi4TdfW10k8VUXsF6K45hV0GxfAW+G2Auf?=
 =?iso-8859-1?Q?8dEGztkapSeffhX8buzmrMpHf+/AJMwL1NXI2UOSnPgaGNt6LZ23jB7J4g?=
 =?iso-8859-1?Q?ZtW/Rp7rIUV8eeuG8wpAGBI+SkQXNA68qyDqJF0rwaZwWdcvTJGaE9xK05?=
 =?iso-8859-1?Q?EBMvAYPbW2tYyHBxD0zTdVOPBx80DT+tuQYkpyGOXvIpaXXR1IhxxYUZUQ?=
 =?iso-8859-1?Q?5KtEDOzUJt/o0l2+JtDEzIBfWIfjpJS3PxnWSrtkh5UGUUu9r40HoyAT/U?=
 =?iso-8859-1?Q?62hJACSESBAna27IbetCs/Ppyr0Cnsw96eK3w2JQieT+fIDtL8g8ApHxRx?=
 =?iso-8859-1?Q?uX5YtUwh1OrH2PHRT62XobRtH60FGZTallfNE/pien2Cq7NMpCrA7l0ogh?=
 =?iso-8859-1?Q?/fagabEH1Z+I6G5nazIkbJaP369Q3Lz6OIXnuBzQYoeh1XETbB1+9UgSxG?=
 =?iso-8859-1?Q?nkl8QuC8kMx45ZFa2YGRHWR7Xp2m2w8kia4GPIczG3E7X7kgNTdSTuqq4Q?=
 =?iso-8859-1?Q?sEWKu77724w9JRFiwlOzvN76LYjGXPPSCHxEch+6XxxqHZmB049Z9X+2Cj?=
 =?iso-8859-1?Q?9CcAgtB63YdUyjfvPd57nXrNbUaJ/eLwUgsYq1IzPmzAXwzpAFijszHjwP?=
 =?iso-8859-1?Q?nNRnI4JEmGrmfBi3Bif0dVOQcPLCjYwF7j2j6vcpi89vlmoMBKT24LX3LD?=
 =?iso-8859-1?Q?mQ1fH/6JntCjDh5xz4hUp0yj4nMjYl4jOUrFQ9dwGNcMOCARH0qM+H71Uc?=
 =?iso-8859-1?Q?CXRqmhwjSmBMSAJlw3L7ibwLHVG89KUkb4qtTb4UgK6LblmkdDlA76Z3eN?=
 =?iso-8859-1?Q?JoMWG+MTZBehybjtCUodwlLl0e6H2JIY1CsB51xi06Bwsnc+8NtIwOL5Gv?=
 =?iso-8859-1?Q?kLOIgnfT8f0AmMsW9xRrXxu/z1EHoyxw5qusRUVndMvvCzpego56upGUR6?=
 =?iso-8859-1?Q?PkIMEprYKqOFnyTsA4LzkFon8Au87mesxmuABTeiL/h5Pe7aMiQcNHmyZ4?=
 =?iso-8859-1?Q?D2eMGNn2UNy/VbMnLGuabI6AJNcRpC31y+OdTH3XpezZz8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QR4gWVHZPKpkDAxF+VBjiVsQW0PI3PuFJHFDXrrK7M3/zB8tV8kdq7EcAM?=
 =?iso-8859-1?Q?JC01ndrkcMR7fu/Hszv/Qe9uHsoa8qBl6mSpIlk0zK+EK48M96j50f9TLs?=
 =?iso-8859-1?Q?aw/tpTCmLa1xzbl2OygE0TfTdSN/vc7sqitd7OlOUlcMuSZlIjS5E9N7w9?=
 =?iso-8859-1?Q?fK0Y4jUyiamVi4AVul9OWKP0sXdvvCAlpFQnL+vBGqC+378iQXD8fUceo6?=
 =?iso-8859-1?Q?lzjtJDJdEwULceTSRpO2zb8Ch1Wy1G8FXp3+N1lEfT/9/q3hKSaiaQpsa1?=
 =?iso-8859-1?Q?mKmy7ywPQL+LrIEjKn4/R5rBnTeoLatUYpBdMFt+WfTmz1/IJXVq2LjivK?=
 =?iso-8859-1?Q?mNpdp3sRHIACV7i4CDXXP5g/PQgGAB+KbyWpX/hnPce8dW6Akbl3WJmFFM?=
 =?iso-8859-1?Q?h8jTrEQNHAvn2xFdMZACyb5cbXA2YS/ZX5htm7QJKLHvNArCI3Q806ggAf?=
 =?iso-8859-1?Q?mb5UgWy8HgueaPjeC0pOrxfkmCsr7Ezm2LtPlN0xEtQGYLyiKpm0xRa9LA?=
 =?iso-8859-1?Q?uj2qMqL3YXHwmDI0Vr2JMy/Zu+NIGs85WmdbgWIpJ53b1jbRBKQw3cS4QI?=
 =?iso-8859-1?Q?FYRwN9SB+qXTQSK1Zvu6N3rAjOU8Ux5OoKXLKc+r9vlMgBkjtm2VD9vJln?=
 =?iso-8859-1?Q?xSaRXEtogaEMuOSTuIP83Fk7tI0NYcYT496bAcZobZf64Zg2weBHtEjuDU?=
 =?iso-8859-1?Q?MJerIdoTSyYbimOEDsjA2mo+NS8yUEVcwcYfzG0MTTa4nNvaMD4ZSMYJZx?=
 =?iso-8859-1?Q?KMif39LslrPj580z9fOWibxK7il6selHAVpEcVDyWQvq76EqDD5CTOrziz?=
 =?iso-8859-1?Q?WqF9Al6g0eDvdpAis8q2OoRwajjr3pJnr9ostsNIWYQ8AST5XY7XhKecqL?=
 =?iso-8859-1?Q?Xv3rZOrn7kfD8E47OiKZv4Ux+r8Ac7bAG2QWObp+l3iGpXsyT1sIwZuY44?=
 =?iso-8859-1?Q?zqekKpVJogr8U6Was2HVQwq4/KBWHZIPaDrvUVdVo7gh9C0hpPb27Wi6q8?=
 =?iso-8859-1?Q?pTbfMSEj0FBjkP1zUnQS1Usns8Uzw/DPY3v01PqEymRBqFEs2kLkB0anS4?=
 =?iso-8859-1?Q?3BaNs1Aqo7btLwLZLmo/6oFyZhsBeBjTq2Tfy6kv1gcjTDFtW4xAzfaN0R?=
 =?iso-8859-1?Q?CuqVZ81qda4mtUownGS4jKFFxvKJSHuds3e0nTET//FcIdHQcC2aiO/ZB8?=
 =?iso-8859-1?Q?1KOGGQCAd3s/PgYk1//1TXTsxodjkwDObOB7xSS8ATtzwpyKqnwqmurTYE?=
 =?iso-8859-1?Q?WiyEtG7Rie+jcXicUt3idDtpJPzAijBamXLiO9hMCgjPR1zoMiGpZKmOgC?=
 =?iso-8859-1?Q?1yS7cNFsLjp8QOJrDv+q1e6HnpaBidbTFwA+SdVPYCuGqtU5gIUI0sqbTl?=
 =?iso-8859-1?Q?IHnp69I7gjfthuHU83TLX4MsXjqfQAaDcIBHxHNb7JsTuKdco8mvsuWORh?=
 =?iso-8859-1?Q?FudgyKfqtwTLR5rdnA7j5zAp9ukl//Yb7Dn53mKg8D/yQMJhRTQwJu7sr/?=
 =?iso-8859-1?Q?0IsW3uyWigoAlsd4sIorK8o88JDppfl5JRmKO1COO74X1tcAf8cuayOF9z?=
 =?iso-8859-1?Q?A6lbV1FMUIkVKwXOSja4Ugd7r+OtVou2n3rkZ2AVbCcZSP7NaJ1Tg7WfNg?=
 =?iso-8859-1?Q?vGmYEVSXf1o715O3b61WaN1VQmgzFklDo4M9Md6byFIsUz6ndxAztrKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8443280d-3ecf-443f-a2a4-08dccb9da509
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 22:21:52.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2lYKG7zg0ABkUxkmPTVXud4DxJ6sH8neJADG07rZ0BhFYSzcXQIs2f1JCZYJNI/OlckmlTPSngO/n6zOyUPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
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

On Mon, Sep 02, 2024 at 02:48:55PM +0200, Daniel Vetter wrote:
> On Thu, Aug 29, 2024 at 10:12:53PM +0000, Matthew Brost wrote:
> > On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
> > > On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> > > > But as Sima pointed out in private communication, exhaustive eviction
> > > > is not really needed for faulting to make (crawling) progress.
> > > > Watermarks and VRAM trylock shrinking should suffice, since we're
> > > > strictly only required to service a single gpu page granule at a time.
> > > > 
> > > > However, ordinary bo-based jobs would still like to be able to
> > > > completely evict SVM vram. Whether that is important enough to strive
> > > > for is ofc up for discussion.
> > > 
> > > My take is that you don't win anything for exhaustive eviction by having
> > > the dma_resv somewhere in there for svm allocations. Roughly for split lru
> > > world, where svm ignores bo/dma_resv:
> > > 
> > > When evicting vram from the ttm side we'll fairly switch between selecting
> > > bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
> > > will eventually succeed in vacuuming up everything (with a few retries
> > > perhaps, if we're not yet at the head of the ww ticket queue).
> > > 
> > > svm pages we need to try to evict anyway - there's no guarantee, becaue
> > > the core mm might be holding temporary page references (which block
> > 
> > Yea, but think you can could kill the app then - not suggesting we
> > should but could. To me this is akin to a CPU fault and not being able
> > to migrate the device pages - the migration layer doc says when this
> > happens kick this to user space and segfault the app.
> > 
> > My last patch in the series adds some asserts to see if this ever
> > happens, thus far never. If it occurs we could gracefully handle it by
> > aborting the migration I guess... I think the user really needs to
> > something a bit crazy to trigger this condition - I don't think the core
> > randomly grabs refs to device pages but could be wrong.
> 
> I think it does :-/
> 
> If you read do_swap_page around ->migrate_to_ram:
> 
> 
> 	get_page(vmf->page);
> 	pte_unmap_unlock(vmf->pte, vmf->ptl);
> 	ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> 	put_page(vmf->page);
> 

Yep, I've seen this show in some of local rework getting MREMAP working.
The common case is I have test with 2M mapping which I call MREMAP on
and then immediately read from the new mapping (the one from MREMAP).
Since a MREMAP results in a UNMAP notifier event one of the possible
solutions I have just evict the VRAM via drm_gpusvm_evict_to_sram upon
the UNMAP event. This case race with fault from the user space so the
evict only moves 511 of the pages while the CPU fault moves 1 page. This
actually seems to be fine though as the entire VRAM allocation is
migrated.

> Also the migrate code itself does lock pages. So unless we toss in
> additional locking on top of what core mm does (which I think should be
> enough to cover migration), migrations will temporarily fail. And this is
> just for multiple threads trying to get the same page back to sram, which
> I think is a case we should support because the application did nothing
> wrong.

Yes, I think I've mentioned this already. Multiple CPU faults from
different threads targeting the same range / allocation can race but
again this actually seems fine too. Each thread gets a semi-random set
of VRAM pages which it migrates but again the end result the entire
VRAM allocation is migrated after all racing faults are serviced. I
think the only guarantee when CPU faults race is the faulting page per
each thread is migrated in that thread.

I have threaded test which hammers reads on a single 2M migration which
checks every 4k page's data integrity that passes reliably. Working on
updated this to fork version now too.

> 
> > > migration) or have the page locked (which also block the migration). But
> > > as long as those two steps succeed, we'll win and get the pages. There
> > > might be some thrashing against concurrent svm faults stealing them again,
> > > but they have a disadvantage since they can't steal dma_resv_locked bo.
> > > And if it's still too much we can stall them in the page allocator.
> > > 
> > > So it's not entirely reliable, but should be close enough.
> > > 
> > > Now for bo based svm the picture isn't any different, because holding
> > > dma_resv is not actually enough to migrate svm mappings. We still need to
> > > hope there's no temporary page references around, and we still need to
> > > succeed at locking the page. And the migration code only does trylocks,
> > > because that's it's deadlock prevent algorithm if different migrations
> > > needing the same set of pages, but acquiring them in a different order. So
> > > we win nothing.
> > 
> > Ok, maybe my statement above is false...
> > 
> > Wouldn't be the only time this falls is if another migration is in
> > flight (e.g. CPU fault) and they race? Then the eviction will naturally
> > happen via refcount being dropped from the other migration. I guess I
> > likely need to update my eviction code to not free the TTM resource if
> > all pages are not migrated.
> 
> Yeah. And additionally core mm relies on some amount of Good Luck here,
> plus the assumption that at least falling back to a single page/folio will
> work out. At least eventually ...
> 
> The trouble is if your design assumes you can migrate an entire block,
> because then if threads hammer that range in different orders you'll never
> make forward progress. Because the core mm code doesn't have a fancy ww
> locking scheme to get out of this, but only uses trylock, plus the
> assumption that falling back to a single page will work out eventually.
> 

Hmm, see above. I think forward progess is made unless I'm completely
missing something. 

> Wrt TTM resource refcounting, I think that all looks ok. But maybe I
> checked the wrong things.
> 
> > > Worse, if dma_resv does actually hold up svm migration and reclaim, then
> > > we potentially deadlock because that lock is for a bigger range than
> > > individual pages (or folios). And the core mm assumes that it can get out
> > > of a deadlock bind by (at least stochastically) eventually succeeding in
> > > acquiring/locking down a single page.
> > > 
> > > This means we cannot use dma_resv tricks to give the ttm world an
> > > advantage in exhaustive eviction against concurrent svm faults. Or at
> > > least not more than we can do without by just stalling svm faults that
> > > need to allocate gpu memory (but that must happen without holding locks or
> > > we're busted).
> > > 
> > 
> > I'm a little lost here on the deadlock case. Do you mean when we try to
> > evict SVM BO we trigger reclaim by allocating system pages and can
> > deadlock? Doesn't TTM already have this dependency when evicting non-SVM
> > BOs?
> 
> So you can have multiple cpu threads hammering a given svm range. And
> thanks to the lols of mremap and fork each of them can have a different
> view of that range (they are all obviously different processes from the
> one that has created the gpusvm binding). And if you try to migrate, they
> might all grab the pages in different orders, which can deadlock.
> 

Yes, grabbing locks in different orders would be bad and that could
deadlock. But I don't that that will happen, even with a range lock I
believe I have this working as the range in zdd is pointing the
originally allocated range. The MM and start / end can be wrong (with
fork / mremap) so that has to worked around which isn't ideal. If zdd or
vram allocation has the lock and we remove the range from migration view
this conceptually makes more sense which kinda where I'm trending if we
agree to roughly keep what I have in place at least initially.

Touch on this here too [1].

[1] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1112527 

> That's why there's so much retrying and also why core mm only does trylock
> on pages if it grabs an entire pile.
> 
> Now if you have a lock that nests within the page lock you need to trylock
> it, or it deadlocks. Which kinda defeats the point of having a bigger lock
> and moving the entire bo as a unit.
> 
> But if that is outside of the page lock (like amdgpu), you still have the
> issue of the elevated page reference from do_swap_page. Which also blocks
> migration.
> 

See above, it doesn't actually block migration as each thread still make
forward progress and collectively all complete the migration, at least
that is what I'm observing.

> Note that neither is a hard deadlock, as in lockdep complaints, because
> they're all retrying anyway. They're more like lifelocks, and the bigger
> your pile of pages the more likely that you'll always have a failed page
> and need to abort and retry. Which results in threads spinning forever.
> 
> > > So the only benefit I'm seeing is the unified lru, which I'm not sure is
> > > worth it. There's also a bit a lru design tension here, because for the bo
> > 
> > Well also not rewriting the world...
> 
> Yeah it's tough. I'm still at the "understanding all the tradeoffs" stage,
> just to make that clear.

That's basically where I'm at too. Trying balance between simple as
possible vs. dream solution. Wrote this series fairly quickly to what I
could get working and help me understand how all of this works. 

I've also said this a few time throughout my replies, also really want
UMD / application data to help understand how SVM will be used too. Feel
like that information will also help determine some design choices (e.g.
what to optimize for).

Matt

> -Sima
> 
> > Matt
> > 
> > > world we want objects that are locked to stay on the lru, so that the
> > > competing processes can figure out who has the winning ww ticket. The core
> > > mm design otoh does isolate pages and remove them from the lru when
> > > they're acquired, so that they don't gunk up other processes from trying
> > > to make forward progress and are better hidden. Which reduces temporary
> > > page references (from lru walk) preventing migration and stuff like that.
> > > 
> > > Cheers, Sima
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
