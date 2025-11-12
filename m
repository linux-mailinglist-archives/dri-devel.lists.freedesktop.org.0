Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A7C5274B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA2410E731;
	Wed, 12 Nov 2025 13:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/cdgrbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704F910E733;
 Wed, 12 Nov 2025 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953837; x=1794489837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jT/5scVrwvo0NsxFBixVX9PxlTUwSUNWXmAloUAtY/E=;
 b=T/cdgrbFIbtbKwQGOl3GmBDwt91Ueo/LIhDy5vmVivJTfJZJRsruRqH8
 I0Mwp+nVZTcn3FH8SZpMnZ5pB0yZgXPY9c3OIUUj4GzNGQZFr6SnisjZp
 4/G8cxEB2ErOpbO7YvxFyHnCV18sCS0itbQ5kvhlqIpcxDJY3isRqclkF
 IKOhTGgHofJbuQGWADPzyximRngcw3ROprUyhVN7Ja6u1EASbnt6iTXPS
 7sq8TxE01IJLYU2YWXsaGQn/i2ZDS5QkOQQzGwgd1TtdUceyr9ValfNxu
 IwH9VZ0ri2kjC3JfgWFa6tRIL9PE0A6ZQrVutU0B8EalTr18bcJwKyaDM Q==;
X-CSE-ConnectionGUID: Tv1S0fmrSJmgk/0bM+gtMQ==
X-CSE-MsgGUID: xZ+7a6J3TUS7IRo489x5UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322677"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:56 -0800
X-CSE-ConnectionGUID: bD4Ec3a1Q8COcyI5FwGbFQ==
X-CSE-MsgGUID: WGJSHyQIQ5iDaKPtze4NJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188858018"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:56 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuORaB1zrW0Pg8mEbDF1BJYUsylk6iO78veUtGZV1Wq1Glz1yWjncu+Jqv2RHNRktSEc1LVFW9LIyhotZ7sfdAfQ7t171tnhes218QRtyQT71RS+N2kYFNAjZBmhVcYT5gpncmV9CEucQ9RZYu6yoYYVxKLSMc6+bVU6j+Tn7E83IsbPv2yu2alRMaMlCN5epwdlvIG0+NKowqV76t2RVAlPrcq3SCYYf6gCVjiBDhvsIzW5WxCl+AxNzV49bdVGjIolIS9PU+QvTqwp8z0Dwy/YLHAZolSIBx6Kajgu89XG0EutKIzifvAKvAKw9JYY1rNHTLpJG0RM6W+X3qYTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MIzCoEp8UU6Rn0AU6LJBKkM1JCDlUaR8Alw+tvvKEQ=;
 b=Ft2p0MSy9x7iIDErsD0x4GaoY0oLKaYFkkqu1z+jpKSgLigUh/3Rw4I1YvFpjSaOhcgRxX8aaQnKxWBeSXhzDKFvm7STc/4QUYxf23+A9/Wrti7+8T8CzHk8f8OZk8Wsu0R0FZkUbkRfnkDrCSr9MNF4j7ol8desnTgqDdS5v5k9BGLeZEw0zMmzjl1UnRxFVPG6n1BJVdieDJNtvnAo+04rRW1dq8ZgqwOrPY3L7xuOO+pLj4NZwUfPdxWW676wbtsv/UUGspTCZGLLgTid4SW32LkAjk/Rlo1GGaOFwrXjPSHiLiD47uE6OeoDPDZ9djNIPpNfeEry+XG2KZmB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:23:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 15/24] drm/xe/pf: Switch VF migration GuC save/restore to
 struct migration data
Date: Wed, 12 Nov 2025 14:22:11 +0100
Message-ID: <20251112132220.516975-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: e2093c17-047f-43b3-1dd7-08de21eeb9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1VNTmFyczRqbHZjck9tV3VHaDRLUFVGakRLbm9VNm55dlNaWFk3bUVKMUVH?=
 =?utf-8?B?QmFOUjgrUll0OHp6QmNVcjN6NjhmaDJ2cDlWUzhFc04rLzNFb25TUHdGa0VM?=
 =?utf-8?B?eVMzVjFiU2crSW1NZXZObXJxNlUrWnJCeittbUJUUmtlMFFOUTdqRXFrRlpK?=
 =?utf-8?B?R0tEMmx0R2J5blFHdFF2TnQ2Y09ObGQ5WnljR3lQK3J0WDdFTlVXellGTzQ5?=
 =?utf-8?B?eDZUVVdsYXhCa1lnY2NrR29RWU85RkJrUVNEc2FpeW9sODZJUENCenhQd09W?=
 =?utf-8?B?cW9tK2dmbGN5OEZmSUozaTZZNEs1RnhoSmQ2MGRVZTgrTC9NZXRwSytxT2Yv?=
 =?utf-8?B?ODRBTzBIZFh3ZWVvakw1U0NMVVRicUN3SnhQeFYwWnkwZ1pnZGRzTUtKMStn?=
 =?utf-8?B?Ty9PcGVTYUVqckYwQUxhY3ZDRWVIcUpsRWtJUU14cG1oU1I1SzMva0t1cEx4?=
 =?utf-8?B?TUxyd2ZEbUhvSXNiWGIwaFRVeGdtYjJtbzNTR2tnWVIwRk1ISzQ0VFR2VWlR?=
 =?utf-8?B?c1U1MmJ1eDVqMDE4RkpWSE5zblR3NzhpNXEzK05PMjQvTjJjTkkzSHROd3JJ?=
 =?utf-8?B?a0s3ZENUUEpWKzNvUStkVXA5aHhGaU5TTTBJWTZVWm5HcUh3UEREYmJxa0ll?=
 =?utf-8?B?b1NIaVpQWW1TUlg1cjRZUTJQUkZuclVWUm9DYXFNL2ZlMnNqbi9ZOGgyZFVZ?=
 =?utf-8?B?V2xZd21pUThaNm1wUWhXYzVoU2JXVlJiRE9rOXNXWDJObkl6N1RGZm1OaDRN?=
 =?utf-8?B?bUZiazRFUkNhTjVSRUNtb1Z6R1hZaW4ybTkxdGlYakIrTFFPTVF1WFRlZ1lS?=
 =?utf-8?B?V1Rhcmo0VDlVSnMvYzNqL1BCZmpOZEdBSXZBR3dqZWtHeVg1dVVlbm1Cdzcw?=
 =?utf-8?B?Z29ZeWhsRTNTT2tLclFZWnBLcUJtbFBScFgzUk55c1JkbXdpOXQ3V01wZlRm?=
 =?utf-8?B?Wkh1aDhOcXBidGViL0dWNVNwOG94QndmaVI5RW5jVlhvMWhZR1NFVEx1Syt5?=
 =?utf-8?B?RXM3OXZpOHFqVlVLQitMeGFMWWNSL1J5SmFnQWRMZWMzQU14QkZxaEtIaXdU?=
 =?utf-8?B?UTBzRWNVbytYeHV1OGE4OXFNaG5GOWk5STJZWlRsL2dxQU9YWS8yUzNHcUtT?=
 =?utf-8?B?TzRlcUZzQmJQZHoxbVVicENrVlllNThkWFJBa05WNzlheGtScGdxRnZaVlhi?=
 =?utf-8?B?a1dvMHpyd3V2eUNDL0FEM2tiTkFXT1VZK0poenVpclUxeDFuZElSWTNISFVN?=
 =?utf-8?B?Q3VSNS81ZkZXMFRQVUZ3dXcvWFdSajA1VTIvUTB0VTJxcXpCWDlTNldtY0Nu?=
 =?utf-8?B?bThTVndTZEtaaE5CUUsxcTNFU1hLVWJlYktWZm5Lb1ozMi9EY0pTdDJ6dURJ?=
 =?utf-8?B?dFlxdzM0QjJoU2dlNSs3eGxaOXlmQlR4MDA0a3BMM25aN3hEM0NSUU5Nd0xZ?=
 =?utf-8?B?QWdVTVhqSytlc1NsVFRndEhOZjVXb2RCU3BhSU52QlhxT3kvbkppeWpLSWxQ?=
 =?utf-8?B?bzdUOGFTVkEvb2NIMTBaaWRjOGlzZkhMaHFaUjdGS0dLK1NHaWk0QWI5d2dO?=
 =?utf-8?B?VjFYRHQ4VDhlSHphZmFvVWd6U1F2ZDJ0bGFXYnl4TnpCazMvQ0Q4UElNMUFJ?=
 =?utf-8?B?dno4akRFUTJ6NVZ2MERBczFCcWZLaHUzZDJXL0E1R2xkOUdVcW85N2ZWbFFQ?=
 =?utf-8?B?SWpXZ2RYdFhWSHJwbUtndUx5am9uQ29UTWo3YXlkSjJ4WlBTakprc3BmcFdJ?=
 =?utf-8?B?bnAwd3BDVFJNOVNMaEJGdnFuNU1vNC9PU3J5YmZPUXdqbE5IeE0xMGN0QUV4?=
 =?utf-8?B?R3hNTG9aaGJQNkx3NkJWeEw4YWV3eGF2Q0NSK3NVSDFlZ2ZOaTN1T1oxTDJX?=
 =?utf-8?B?SFVnWEpoOWY3a1ZDODJ3cWsrWjNPYzRUN2JvbHdlallUQTl5ZFFQSU8yLzdJ?=
 =?utf-8?Q?YSkNZ5cbMZxIxccDiXZEWBB+mGVPT0mO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRkZ0ZmeGRPbm5MRXhDN21BWGN5Q1RmV2w3UFRMNjA0S3FUVG5LbWoyMFFC?=
 =?utf-8?B?WTlldCsyOGIrT29IckVFZ3E3bkJsVEJhcUp2eHZQc1U2VmN3OFVhSnZRUWRu?=
 =?utf-8?B?VlNwNHJXSmthYzg5RzdUeEZyT1pMV3piSjFMKzJlNWtteUYxRW9PNEsvbkJC?=
 =?utf-8?B?SVBnVmVvZHlXV3JUT3RCMmhJbEdXcHJiNjZPUjlOc2ZjZmlQQjR0Mm9pTVJF?=
 =?utf-8?B?Zm9XY3laWnFYeEJ4VHlzQXZyb1dQc3pDSmVhTitKT21WNjd5RldWcnlEbjFE?=
 =?utf-8?B?Z0YxQ1c3bmxLc3g1aVVGSHNWd3BhZlFqZTNQc1FwLzY0dmdsV1BQRXFQeXE3?=
 =?utf-8?B?M01zcWV3cTNRYzdoNEVEb2NOTGppT3JtSmxtNzFBYklCS0tDeFR5VXF6WTBt?=
 =?utf-8?B?bzRXU0YrTmJHYk1sVDRKR0ZlTVJ6SHVlLzNTeng5WUxMbjRRemkvbUFDb3Yy?=
 =?utf-8?B?V0x1MUNTWWFhb2FHWWkrZ0RtUUFGZ2VrbkR0Z0J2cjJFV3pwdGRwVjdvSHUx?=
 =?utf-8?B?L3lKSmxpUThpRVlUNkxSWGF3THFpRDFWaEdyTjQrK2xLUU5vSG9QZmNpVGY2?=
 =?utf-8?B?Nk9WVXdDK2NrK3lIR2NlNFBMdGh5V3pLM3dOUW83WkVLZXJmV2liVjBnbkl1?=
 =?utf-8?B?Q0tJaFZBWkQzekRhc3JGYWtMTWVpTzBJblNzWFhkR2RDREdvTHB5R1k3aUlw?=
 =?utf-8?B?ZkJZb2UxOG9XZUVBdWg1a2xnUmRDV1V2QUVDVlpmUzUvVGo1bFJZS3hMc1lT?=
 =?utf-8?B?MFF5ajFpaFJpM3BMYjAxamZxem1IcnQ3RHY4bUo5SG9vQlgwNkwwajVlemRE?=
 =?utf-8?B?RDlpU09CNEYyVE5veXJGODNvd1VHVWR2ZGQ2YWI0M3JoVW1zNVY0Z1lmNllT?=
 =?utf-8?B?czZlU0Y4RlN3SDdydXlxRXYycll4eWpaeVRCcFkyanlMc2hpVjcwams5K1JY?=
 =?utf-8?B?d3pWaVVjT3QzOFgzRFE0R1RMTWsvYVoxVjhlWlI1Ym9kZ21VcnE5UXBRZkxU?=
 =?utf-8?B?cHQzVHN4aTJSTEFhVHNXWDY4T3hhOVFQUGxiODRDYkNYSnNOYVM3dmFaVno1?=
 =?utf-8?B?MWF6UmRJaU56RG52NG5yWVN1eVpnTjFFUVBtQkQ1eXJYUm5DT3pNZi90VThn?=
 =?utf-8?B?K1pmRU5RRFlLdjRRZVFuRzBLKzhzbXA2QmNlNkRMRWtXd25URjBuSFNHU3lE?=
 =?utf-8?B?MTVJcERIOFFGQTlGOXhwQnNJQVlmTkpkcm03OU9KbEtzSnc3SzJDajd0MTZt?=
 =?utf-8?B?bkI5UnQ3bSsyb2ZLcXVzd1YyWUMwUjJwZ0dka0VGRVo0YkJYNGVLWk5zVSsx?=
 =?utf-8?B?UzVDQWNvQXJZcVBpYnJPOVlXaUZEcjFSTjE2MEJKRE8rYTVUUkpENkRBS3JC?=
 =?utf-8?B?V3prOWQvL3Awc1JGZ0s4YjZYdHRXTWxJTTlRZUY5N1RQR01UZXBQS2JUU0JU?=
 =?utf-8?B?Q05SVlNUMHBJOWwzTC9GWGlnMTMvSFplcld6ZGdjazBtV0c4STRleEZYVWg2?=
 =?utf-8?B?UEsya0owSU1JUG8waVFNZGlhZUMybHB5VEhBMFN0Yk12SkthRnVhNWNQNHhF?=
 =?utf-8?B?Yzhkd1J4bmlJUHVVNTgyS3h5cDY1blE3bHZPQkJ0bm9iMzhIdUw2VmFmVVpw?=
 =?utf-8?B?UWhYdndIRHROUGhFdGJZZGdrVDUyeVB4NHAwV3c5RXdhNXpKZW9xVFhqdVRk?=
 =?utf-8?B?eVNxSVJNSE5tZHhaWmdrOWducXd0ZnFrTExIcFhQVnNwdGdCYTBKNWwxY3VI?=
 =?utf-8?B?R0dTUUhudmwxdUEwb3h5a2xjdHExVTdUMXRDV2VtbW9aK1ExdGFGeFkrUzAy?=
 =?utf-8?B?VTAzbE5ncHR0YURrYzRuQVUvdk9xeWxrc0NLbTFaZFE2RTBoZ2grWHhMcGdE?=
 =?utf-8?B?SzFWUUdFeTlIUjcxOVJ6eXZyMVBuK3J0aW1sVE5xZ2ppeUdJbVZ3YXZqbmh6?=
 =?utf-8?B?N2laL1lUOXJyQ0xVZEpwdU9COXBianFVYXcvWmxlZDNjMFJrWTVITGtqKzV5?=
 =?utf-8?B?cm4vVWNEMkh6VlcydEw5UTQxVVFITHZlTmxIS0dMQnlSejJjUkpUYmJkQzdv?=
 =?utf-8?B?QVhjNlpZV3hROGl1ejZwNnoxVjFhSklKdmNDRmNvVUF1Q21kVzdYVkxDaUZE?=
 =?utf-8?B?ZWdjc1VUNXB2MDg3T2pIbGhRY2p0Z0VQU09oZnJFR0wzaklUbWE2YWFXSTB3?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2093c17-047f-43b3-1dd7-08de21eeb9a3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:53.5226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCwWhxLvAqaqaf5E9pgrpjR3Fz0vxXZKU+OU4XwYnSx82qB9GRGhoqluhLmhqggoal+WZIFFovgNv+l+LsV3U+4ChczNx7qrCsruNl7u/s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Now that the data is decoupled from both guc_state debugfs and PAUSE
state, we can safely remove the struct xe_gt_sriov_state_snapshot and
modify the GuC save/restore functions to operate on struct
xe_sriov_migration_data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 266 +++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  13 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  27 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   4 -
 4 files changed, 80 insertions(+), 230 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 7b5338be15065..08d4753f2b11b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -29,6 +29,19 @@ static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt,
 	return &gt->sriov.pf.vfs[vfid].migration;
 }
 
+static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
+			     struct xe_sriov_packet *data,
+			     const char *what)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		struct drm_printer p = xe_gt_dbg_printer(gt);
+
+		drm_printf(&p, "VF%u %s (%llu bytes)\n", vfid, what, data->hdr.size);
+		drm_print_hex_dump(&p, "mig_hdr:  ", (void *)&data->hdr, sizeof(data->hdr));
+		drm_print_hex_dump(&p, "mig_data: ", data->vaddr, min(SZ_64, data->hdr.size));
+	}
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -48,7 +61,7 @@ static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 }
 
 /* Return: size of the state in dwords or a negative error code on failure */
-static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
+static int pf_send_guc_query_vf_mig_data_size(struct xe_gt *gt, unsigned int vfid)
 {
 	int ret;
 
@@ -57,8 +70,8 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 }
 
 /* Return: number of state dwords saved or a negative error code on failure */
-static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *dst, size_t size)
+static int pf_send_guc_save_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -87,8 +100,8 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
-static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *src, size_t size)
+static int pf_send_guc_restore_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					   const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -116,120 +129,66 @@ static bool pf_migration_supported(struct xe_gt *gt)
 	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
-static struct mutex *pf_migration_mutex(struct xe_gt *gt)
+static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return &gt->sriov.pf.migration.snapshot_lock;
-}
-
-static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
-							      unsigned int vfid)
-{
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-	lockdep_assert_held(pf_migration_mutex(gt));
-
-	return &gt->sriov.pf.vfs[vfid].snapshot;
-}
-
-static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
-}
-
-static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drmm_kfree(&xe->drm, snapshot->guc.buff);
-	snapshot->guc.buff = NULL;
-	snapshot->guc.size = 0;
-}
-
-static int pf_alloc_guc_state(struct xe_gt *gt,
-			      struct xe_gt_sriov_state_snapshot *snapshot,
-			      size_t size)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	void *p;
-
-	pf_free_guc_state(gt, snapshot);
-
-	if (!size)
-		return -ENODATA;
-
-	if (size % sizeof(u32))
-		return -EINVAL;
-
-	if (size > SZ_2M)
-		return -EFBIG;
-
-	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-
-	snapshot->guc.buff = p;
-	snapshot->guc.size = size;
-	return 0;
-}
-
-static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		unsigned int vfid __maybe_unused = pf_snapshot_index(gt, snapshot);
-
-		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
-					vfid, snapshot->guc.size / sizeof(u32));
-		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
-				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
-	}
-}
-
-static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	struct xe_sriov_packet *data;
 	size_t size;
 	int ret;
 
-	ret = pf_send_guc_query_vf_state_size(gt, vfid);
+	ret = pf_send_guc_query_vf_mig_data_size(gt, vfid);
 	if (ret < 0)
 		goto fail;
+
 	size = ret * sizeof(u32);
-	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
 
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (ret < 0)
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data) {
+		ret = -ENOMEM;
 		goto fail;
+	}
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_GUC, 0, size);
+	if (ret)
+		goto fail_free;
 
-	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
+	ret = pf_send_guc_save_vf_mig_data(gt, vfid, data->vaddr, size);
 	if (ret < 0)
-		goto fail;
+		goto fail_free;
 	size = ret * sizeof(u32);
 	xe_gt_assert(gt, size);
-	xe_gt_assert(gt, size <= snapshot->guc.size);
-	snapshot->guc.size = size;
+	xe_gt_assert(gt, size <= data->hdr.size);
+	data->hdr.size = size;
+	data->remaining = size;
+
+	pf_dump_mig_data(gt, vfid, data, "GuC data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail_free;
 
-	pf_dump_guc_state(gt, snapshot);
 	return 0;
 
+fail_free:
+	xe_sriov_packet_free(data);
 fail:
-	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
-	pf_free_guc_state(gt, snapshot);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
+ * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
  * This function is for PF only.
  *
- * Return: 0 on success or a negative error code on failure.
+ * Return: size in bytes or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
-	int err;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
@@ -238,37 +197,15 @@ int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	err = pf_save_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
+	size = pf_send_guc_query_vf_mig_data_size(gt, vfid);
+	if (size >= 0)
+		size *= sizeof(u32);
 
-	return err;
-}
-
-static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
-	int ret;
-
-	if (!snapshot->guc.size)
-		return -ENODATA;
-
-	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
-				snapshot->guc.size / sizeof(u32), vfid);
-	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
-	if (ret < 0)
-		goto fail;
-
-	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
-	return 0;
-
-fail:
-	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
-	return ret;
+	return size;
 }
 
 /**
- * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_save() - Save VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
@@ -276,10 +213,8 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid)
 {
-	int ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -287,75 +222,43 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	ret = pf_restore_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_save_vf_guc_mig_data(gt, vfid);
 }
 
-#ifdef CONFIG_DEBUG_FS
-/**
- * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- * @buf: the user space buffer to read to
- * @count: the maximum number of bytes to read
- * @pos: the current position in the buffer
- *
- * This function is for PF only.
- *
- * This function reads up to @count bytes from the saved VF GuC state buffer
- * at offset @pos into the user space address starting at @buf.
- *
- * Return: the number of bytes read or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos)
+static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
+				   struct xe_sriov_packet *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	ssize_t ret;
+	int ret;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, data->hdr.size);
 
-	if (!pf_migration_supported(gt))
-		return -ENOPKG;
+	pf_dump_mig_data(gt, vfid, data, "GuC data restore");
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	if (snapshot->guc.size)
-		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
-					      snapshot->guc.size);
-	else
-		ret = -ENODATA;
-	mutex_unlock(pf_migration_mutex(gt));
+	ret = pf_send_guc_restore_vf_mig_data(gt, vfid, data->vaddr, data->hdr.size);
+	if (ret < 0)
+		goto fail;
+
+	return 0;
 
+fail:
+	xe_gt_sriov_err(gt, "Failed to restore VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_restore() - Restore VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
- * @buf: the user space buffer with GuC VF state
- * @size: the size of GuC VF state (in bytes)
+ * @data: the &xe_sriov_packet containing migration data
  *
  * This function is for PF only.
  *
- * This function reads @size bytes of the VF GuC state stored at user space
- * address @buf and writes it into a internal VF state buffer.
- *
- * Return: the number of bytes used or a negative error code on failure.
+ * Return: 0 on success or a negative error code on failure.
  */
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t size)
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_packet *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	loff_t pos = 0;
-	ssize_t ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -363,21 +266,8 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (!ret) {
-		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
-		if (ret < 0)
-			pf_free_guc_state(gt, snapshot);
-		else
-			pf_dump_guc_state(gt, snapshot);
-	}
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_restore_vf_guc_state(gt, vfid, data);
 }
-#endif /* CONFIG_DEBUG_FS */
 
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
@@ -619,10 +509,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (!pf_migration_supported(gt))
 		return 0;
 
-	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
-	if (err)
-		return err;
-
 	totalvfs = xe_sriov_pf_get_totalvfs(xe);
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 148ee07dd23a9..fd81942bfd7a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,8 +15,10 @@ struct xe_sriov_packet;
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
@@ -34,11 +36,4 @@ int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid
 struct xe_sriov_packet *
 xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
 
-#ifdef CONFIG_DEBUG_FS
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos);
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t count);
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 84be6fac16c8b..75d8b94cbbefb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -6,24 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
-#include <linux/mutex.h>
 #include <linux/ptr_ring.h>
-#include <linux/types.h>
-
-/**
- * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
- *
- * Used by the PF driver to maintain per-VF migration data.
- */
-struct xe_gt_sriov_state_snapshot {
-	/** @guc: GuC VF state snapshot */
-	struct {
-		/** @guc.buff: buffer with the VF state */
-		u32 *buff;
-		/** @guc.size: size of the buffer (must be dwords aligned) */
-		u32 size;
-	} guc;
-};
 
 /**
  * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
@@ -35,14 +18,4 @@ struct xe_gt_sriov_migration_data {
 	struct ptr_ring ring;
 };
 
-/**
- * struct xe_gt_sriov_pf_migration - GT-level data.
- *
- * Used by the PF driver to maintain non-VF specific per-GT data.
- */
-struct xe_gt_sriov_pf_migration {
-	/** @snapshot_lock: protects all VFs snapshots */
-	struct mutex snapshot_lock;
-};
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 812e74d3f8f80..667b8310478d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -31,9 +31,6 @@ struct xe_gt_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
 
-	/** @snapshot: snapshot of the VF state data */
-	struct xe_gt_sriov_state_snapshot snapshot;
-
 	/** @migration: per-VF migration data. */
 	struct xe_gt_sriov_migration_data migration;
 };
@@ -61,7 +58,6 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-	struct xe_gt_sriov_pf_migration migration;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
 };
-- 
2.51.2

