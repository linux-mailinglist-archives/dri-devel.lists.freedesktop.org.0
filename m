Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43024CDCFF0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 19:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458F10E0E5;
	Wed, 24 Dec 2025 18:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIAG4+b5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0E310E0E5;
 Wed, 24 Dec 2025 18:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766600898; x=1798136898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=doS7EfxIkpKYvGUDcTI+V/QVevE3owIqPsS8A2nFdrk=;
 b=oIAG4+b5hveVfvJkaxrs2FU+L8+RbfcEs5BL3/TqYL/2Snx2pSjL8avM
 BXSvK7TXE9cLi/VgqxG3I4gauR8XdGgQjyPfmevoBvy9b3v1enyUXm1KK
 b1jX67ea4NKNV2Aj58JbZxb8cozATkoXyn9MlfD1qRg4x44t6pFJzstZO
 i0+zAp19qZNtIZs8Y1+4w3eUtyzLL1MWnRRS04Bgwq3V3GzynaPs/IeS8
 SmK12LaWYWUEwnr4cPE/yceoROOt+CUtmtI324kV4o+eEojqpTHYhSR+H
 tgdwnSI+NIH2IBIXqffQHnffUnTc61GS0eGTvgYhVTmebRn6iSxe8d+kT w==;
X-CSE-ConnectionGUID: 34Bne7AFQTaqabwKQInSgQ==
X-CSE-MsgGUID: q4vL0X/aSDmgHf7SE3sg9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68317807"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="68317807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 10:28:17 -0800
X-CSE-ConnectionGUID: cowL/uvMRm22cJYR1xSjnQ==
X-CSE-MsgGUID: 5lgPz/VmT+mjtccNUFMDIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="223551136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 10:28:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:28:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:28:16 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bu+V8HnPuaclElFH7Cg2g8WMQHZ1ivriSYjvbxotUTWN0t9o6sh2cB+yiasXEhZEmk+EZVlYz7Px119/sKSl1fEgfD15QiSNOb5fwQUZ7SeDncyyoyjP0X01pN/MkYB3D/c65rVUihPD3wxP1cA8CZW0nNFPxyhWQeWljIz15DhBKh0vk4VV5h+7EjJRZ3aub4oLckc8G1M6xeL9JQvWP4vh9wweWnGiuZrbmm9O0ZobUgoS/GWz9HmTj3vzksLx2GgGtHpv83gkAea5JpzxgUJX6tuCJqBIKxDBfc0n2UVjgsGQrs8zSeQohGeic7rBVSNqUN7lZ7HtYzEWppoGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38vzcJM1pef65RZjKh83q63pVCk73o/P+Hds8PTlDVw=;
 b=sRvdhMBCoRZ0e+IBgGpy5vtB0PAk82Ri1Ao9ftK7yptfST7Bt9Mw9Iv/Gd8BGQleSJgxq5yfHzdEbduANQOwGTpdL3el9cHXkKqBOqyssK0tzjsa91a4psazA5WCUMA48WT8JGqqsR//mSfkhX9FEiMkSEv/+OWwagSROk9YXsRasIdpGn3Dj2kOK/Em89As0bivmG9U2l9oNyvrchBRIMLPOQl5hqLecLz8uBubEZszBsgo9s2fFS0zJFZ4vKE+ZzyYvgjP6LTfhAzAgBQhAyyu5rLE5SGh+/TqI5ZSocIJwphPNO/QWn8ye9DuMDSthOHQl2rg0UJRfZUMGRVyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 18:28:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 18:28:12 +0000
Date: Wed, 24 Dec 2025 10:28:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Thomas
 Hellstrom" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Replace use of system_wq with system_percpu_wq
Message-ID: <aUwwunqiFw3YdKUo@lstrano-desk.jf.intel.com>
References: <20251224160026.124106-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251224160026.124106-1-marco.crivellari@suse.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b977df-d8b2-46e6-133c-08de431a3279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bZ9QP/Z0U1p/xhIcGdwIuqnYU2Cony6Uxcnu7o/7R1gvJc1EiS+xPgaef5YA?=
 =?us-ascii?Q?CelANx0k5LMIZlHZ8xYnOlkbeud5ExMjp7kczz2PLCG0K+xd1cxpDxPwjkSR?=
 =?us-ascii?Q?s+++UQzLWuWOneMtJTsDBDZd0Z+ibcu6Wn6JXxQgCYpmLgnFxSd7Q6YYJkR1?=
 =?us-ascii?Q?WLvP1OJJdRI4/JM8xS+XW3/4c7fmx+kzAG0r3cEExThVZ1m71+d2rbWOF13H?=
 =?us-ascii?Q?66AcrLFpnQ6DhuB6UcCdbQ7Ei7tkW3bvPTVbpUb7yUG6kHKcVIgzVNBKpws4?=
 =?us-ascii?Q?swIkIHBNj9igCBUU8lswDssleYxaEqpqMbYjRSU7VauLTNN3wt7Oc1Hv856R?=
 =?us-ascii?Q?GVtKfPib/U7Zu7ia+16arnrwjdmcJ60aZ5bB0e0yaHDY/lExMzPFXcqzEvG4?=
 =?us-ascii?Q?Jmx2ZTzr36+HCQHQKfKCQ4tBkrmIZbcdb5wMKJpICAgJHV8mZpbDGiYrf0JI?=
 =?us-ascii?Q?ZFjBx3jgeQMJUVCV9pHRQvKimarBkRkQ3cM5xgvUN+ToSC2eu/pXM3vHiaZV?=
 =?us-ascii?Q?hoCSnoYDmHHV114stHt+elgD4Tzb3T0uFBIA5Y4oJ33HTFY7kwnKvkvsgPNa?=
 =?us-ascii?Q?I/95buxneNpCTHwKAxkT5TBrB7ZQCy6NTC6QPnVqwsa0yXR5wKKV0z2U/2Qq?=
 =?us-ascii?Q?k12Rlyf7X2L+H2ww/eOY2VRh9HOij3VBS8CrrlH7FQPaq0V38bsPQ0GFn/Eo?=
 =?us-ascii?Q?Rx5uV1+ELAwDyYlBhtj0NhqPxPKjFe5a7yB1FOXL5gvbzXzfG4mbhYktChia?=
 =?us-ascii?Q?BK2fkP+NY/VEv4r2pe/YuvUQJU3AdzaVsYBMmpVHjRJo0t6La0fFmzg2mbpN?=
 =?us-ascii?Q?iWGDmD0p3UTlOFM6XQPgQXA0JxPyP8CcZ/4u5dfTo31ONN40PEfNFeCjYYbI?=
 =?us-ascii?Q?ZojyHjW/nuv9DELpCzapvW5ZJ9Z6H4wLMcIZFDjVDtGKs6g+ionp45xatHvn?=
 =?us-ascii?Q?MKY8pya/xN8PTPoPX/2kG2m0/ieAxAjdGYrp2p9ihjX21nZlHEMfPmO1NDQm?=
 =?us-ascii?Q?hb+173Nov0Qaltkki3Drj1iFbXNdIlhbpPXdxQSjC66TVJnP0jvBh2ceiAes?=
 =?us-ascii?Q?eoPkfrqbhRtkagMFZyzFZllubLe41EGQU+p5TwZkSRelgSuCBVn/a0szDKaw?=
 =?us-ascii?Q?JH2n48StJvG3Mg/isouzM0HiokLe6aNaElh126lylAobfaDWqJ9Cpsol+wCN?=
 =?us-ascii?Q?Qrg74B0X2QCc2rq6WZCUZYMuLERTRV+wfvUPCdpXIwX8nhr3sGplpdwH4doO?=
 =?us-ascii?Q?yQxeiFWI0a59RvA1h682tDI79+4+LP3xZC5V15kaBOgWAjcqmn1EkWILOmKo?=
 =?us-ascii?Q?tTHrRS5Y9kvaP6MXmhUcVA2s6kbHUYgDlEZGgkSxVcfpDbrhbksSO/nJbAbV?=
 =?us-ascii?Q?tlweR9qaIVuWdW65NZeBJRF3ME/DtuPNpOWMGuRL9kCw5nqUe1HV0a+gVvcr?=
 =?us-ascii?Q?ROiIVra/Sd6ba0pwWL0ZsyoAQmvjMAoa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nGp+9kcyzW7h+CPVFRYOdQ06XF3rWD7SIx1jb7PSzAf9GL6UG7XF6bA6XYnU?=
 =?us-ascii?Q?KRPr9uWsano/nwSCreND1e3uRARsx2/hFnGvwlf3EXPUzlXcdiaa1BgKfTu5?=
 =?us-ascii?Q?sKCkXow1J/29ZsuwNBqViQnAQLZPxT1aD01yicECsbskLY5ZWF7Tgd9Xbxf3?=
 =?us-ascii?Q?ABFSY2PUrCcETS84Wssr89cFOqrVY0YZj5sxHZR9xo/iYYuiYlrgZ7/F6M5o?=
 =?us-ascii?Q?uMw0Z3Acw0rXIuXxLEtUuyVDb0qei0CRh+qh1HuzX6ZMCkj5Xu5YT1JS/QEt?=
 =?us-ascii?Q?B7chEWHX1t8I6e5zaP1PTxb/cQF0cnnPYZOFAJZMyW3uQ0N8dj+D1mk6bwWv?=
 =?us-ascii?Q?+Tziv5ukww2zp6Xf/l/mG3ie/XpYqSotahMCwQcFN74IjwIE2ju61YeTQw4t?=
 =?us-ascii?Q?dirbR5jWo3Aw1zzC+mH1bgLZizz3DHLnPFnwTpdXBEPEtK9J1mBivys6L9Om?=
 =?us-ascii?Q?DdCfU6e5zVQhMqG8OP2rRGItiOKCrbR/4jJ+u4L3XZxhH/+RCjHfj7Xd3C0J?=
 =?us-ascii?Q?bOY/W6VTMOcpjtIDVAhwh8QsIpr8A+eyeQz/N+aqUFGhwY7YKELySyQEcpzT?=
 =?us-ascii?Q?a1/V4xS6hPZ9WV5LTUW8X9XdGg6kCpDOD6afre7YUak8rKH11gPae12J/04V?=
 =?us-ascii?Q?Zrfn/WAdAD4r2SQzviwTYCF5wC9z4CyU3x1KzHx1CoPlUqfdI9UV6Gmr7eoK?=
 =?us-ascii?Q?flkLit5bGE9IPZTY62Bq/SjtJQK6KBo+GjeVO5FfdIQciY6Lom3Lx+hi/df4?=
 =?us-ascii?Q?OgcyGRl7SoBl42Oc3ZtWsPEtU2n6bjGHLdhFG7el1x8fJ79ya0GFzMFXeAAo?=
 =?us-ascii?Q?4v6jo9YDqKrTN4J4dwTvdvEjROXwyjG/yEKKj3kRJMr+uPGdEJwj3VUqLKwY?=
 =?us-ascii?Q?LxZ0HC/+16ycX5CM8tH1Y9H9j9ewV2PNEiCsPCw389atZk9A6g4KEO6tEfWK?=
 =?us-ascii?Q?EHRM1l8o0shktQjTXdGRsBdGyBEQdSO4O4Uj8ljDzBcFxPa0D0sO/5pUYFTq?=
 =?us-ascii?Q?hmibsWoivdVAxkiC91y7uOk5Oocejh5LrwU7NiuV8boCFZcsrfkoiKsvU63K?=
 =?us-ascii?Q?II4BFsgeW6XyuHHglwCw7QhNr9PpH/Jk8ADS1Y71qkoMGQwn6VGc3JJX0E/W?=
 =?us-ascii?Q?6H3NGZN6VKqof0GtR4CIANxTlGq+zw/URPHdkcNGj+HFJroQcl4gBzBrc66g?=
 =?us-ascii?Q?KJQGhs37RGtqbkrFHj4zvRoJ1Se6yKswSSq6uvmlbw/Hp7dYAPDrTiXxGkas?=
 =?us-ascii?Q?jQm4ElHwrERLEVRTS9i/QAm48X8fc+IBN0MA7sVIdOQ0v+tmia6XzW4RVsJ2?=
 =?us-ascii?Q?TJm9oTT02zrFeKu7Q2/BgSnyrYcGnVTdFPjE0xX5cpOVqF+uRJyKoqKoD3m6?=
 =?us-ascii?Q?2O8OzBjVYsN7nN1RYGn++wKWsk/Z0yHMZf5IyqK8kGK9nEqRlxe1DGhMVnuK?=
 =?us-ascii?Q?VGD2S6JhyG0/H4V7PxPn5/ebIqbCLRcUYgXc+bOu6PbkSjNf3me6o0976jAi?=
 =?us-ascii?Q?uyblSVwzmnZ+4JBmu7uWMdhyGHgtekMo2AzEv8lTTo57rwO7QI07C49cDhUg?=
 =?us-ascii?Q?iwnfhwKfUHydczyxPCge3yE/T2zPnylgEaNzxosBEsIBFBxFKOeapgOW5Nyx?=
 =?us-ascii?Q?QN1Wjj8NBchBdtqBmlk250nHIn1CGmqhVM8S2koynrFCKgfAyA3oaxULi9D3?=
 =?us-ascii?Q?sfT5uBRAezim66oV0JUDn+50f8B6h0CWHAS6taSoQnqlGgAfnuhCCcxEVS2m?=
 =?us-ascii?Q?DPYR07U4Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b977df-d8b2-46e6-133c-08de431a3279
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 18:28:12.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/gvDG7eNylqLyr/2KEHR6o2jgfSqGXdSUMzX2+Zc229D5zqVkFCRVPzEYxDgQV9Fg4vmnP9+KbZypBVA/ZiyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On Wed, Dec 24, 2025 at 05:00:26PM +0100, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen after a careful review and conversion of each individual
> case, workqueue users must be converted to the better named new workqueues with
> no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/xe/xe_tlb_inval.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..b2cf6e17fbc5 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
>  		xe_tlb_inval_fence_signal(fence);
>  	}
>  	if (!list_empty(&tlb_inval->pending_fences))
> -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +		queue_delayed_work(system_percpu_wq, &tlb_inval->fence_tdr,

Actually system_wq or system_percpu_wq doesn't work here as this is the
fence signaling path. We should use one Xe's ordered work queues which
is properly setup to be reclaim same.

Matt

>  				   timeout_delay);
>  	spin_unlock_irq(&tlb_inval->pending_lock);
>  }
> @@ -226,7 +226,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
>  	list_add_tail(&fence->link, &tlb_inval->pending_fences);
>  
>  	if (list_is_singular(&tlb_inval->pending_fences))
> -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +		queue_delayed_work(system_percpu_wq, &tlb_inval->fence_tdr,
>  				   tlb_inval->ops->timeout_delay(tlb_inval));
>  	spin_unlock_irq(&tlb_inval->pending_lock);
>  
> @@ -378,7 +378,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
>  	}
>  
>  	if (!list_empty(&tlb_inval->pending_fences))
> -		mod_delayed_work(system_wq,
> +		mod_delayed_work(system_percpu_wq,
>  				 &tlb_inval->fence_tdr,
>  				 tlb_inval->ops->timeout_delay(tlb_inval));
>  	else
> -- 
> 2.52.0
> 
