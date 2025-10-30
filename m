Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A404C2247A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46B110EA91;
	Thu, 30 Oct 2025 20:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHE8N5Bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280CA10EA8E;
 Thu, 30 Oct 2025 20:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856446; x=1793392446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cexv1ierQ7Lk22fjU1DOksl3mL/qEZ0RgoNXJ3aZAHQ=;
 b=AHE8N5BfL+oRCxvhP6tGYNdAJOLd61vkES7oU1GRt2qN5UNlfJarDSfQ
 6wbGBuzvwkufbw76hG2S4k2UwqRU8Y1VlFCYCs3twBoQA4m0LDqZ8myMh
 piPgp0sAG1dJq/9NsWfFFxeb03gBNaYpnW/F9xUL60txE8CI0k567d5p+
 Rwk5EdtI60GJr+AUoCZ5XaZLU8sNL6lIQbYVdVEI2xcdDzWNybz9x4vQu
 PjQJj1l+KaQ96cY89qcDpLmKZV9dIgukB/BC7TauZc45po1MSbhbMaBgP
 RIV2+mpW6AWB0qbhdPEvX3kyHaXryyaxAOxw9L+EvXrB3N3l8HSixrk+6 Q==;
X-CSE-ConnectionGUID: av/WEC11S6Of3Ai5/08STw==
X-CSE-MsgGUID: nOMaCdtjR6aRrtmoN7X3Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74688188"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74688188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:34:06 -0700
X-CSE-ConnectionGUID: bIWdZHuBTsqlTs0xV3xE6g==
X-CSE-MsgGUID: 0CbfNEhTQQyF7s9w6cFKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186791476"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:34:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:34:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:34:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMgVGsExhhSlpLL87VXy+sO20MZbGoJL0o74BCmhdBmbbzUSv0geMVBMHVBeXcgasXZoKQS/k3YajvQg3b2cjuTNFrCeKFWNRo5Nz+vitrfrQ3EfCSaUpJvTaVOAn/D3OsnaI14xk6dL041Z8RnL87YQr5Xpt5iJ/Gd2htN+7Fzc2ztNsVzZzQKcsfpk1qaZgIyK4JslZewuHM+59JHOE1szxBUU3q2BREZQt0ViXHNxFUPnxUrCimhryBWe5fMkA+CjE4P4PRzWfStXt7YthF68b0URo+86bnOuMM2lq3mNs/whkASAzhTuY2tY2r4826UTzxmE3ZEUBZ5sa8J5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFBbPKHOwcH8sMqKf8UAxWBRPrBxZ3FIdipx8RPwqJk=;
 b=LSr7QBvMkBPCe7keJ8o/p6pulONmt5LNM1kJ/XsOVgK/j/6m9smU4H5JDA3e9W0o2OvxRidTc/cfXxzaXvgx57hhJ3dwGwQbDBaUYEH8Npp8j5sQdFlSGjvvN/BmuJ+91RHknP4mtKmu6zso1hOJdUopfRNTIicmW21SCudn8NCtwcCWPJUq0L8lNAKZyKZp2/2womNwjscOytHuVlNgfrgSWmV7dOSnx8TGWFlXh08j5BTdRdRii8dnLacyUjuisIEdRLj5MM0BI+c9QxW+dHuaK0k7G1TyyO7Vw+/+HawkmHzV0wB2YqPWXWaFPcGejCciuKb3tM997ITZbalunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Thu, 30 Oct 2025 20:34:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:34:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 26/28] drm/xe/pf: Export helpers for VFIO
Date: Thu, 30 Oct 2025 21:31:33 +0100
Message-ID: <20251030203135.337696-27-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0284.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e389cc-d639-4ad2-56b8-08de17f3aa2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW5zL1ZGNjUvYTlHK0hXQjVZRElyVCs1RkxCR3cxazRMT2FybWJQZk5CbGFQ?=
 =?utf-8?B?TWZ5d1hKdk9oVktuSzZnQzNiNzNDdDEwVEtrWG1OWEtWa1lSMmxUcVd0MWxn?=
 =?utf-8?B?QTEzenk5NEVrR2U0Wm94QjBnbVlxeVExT3NJTHBKdHNYMVZzR0lQVDIxMm5Y?=
 =?utf-8?B?N0JMV0E0N3grb0crMGM4UHE1bWRwSVlIWWdTaVErakJMTWRrV1lHd1ZaOE0v?=
 =?utf-8?B?SEM3My9WOUJna0FkdHNuSTNQU3JGTmVvM2paNXg4NWU4SHhjQ2JXcEcyek5T?=
 =?utf-8?B?STlTK3lTaTJsc0UzalhUNmQ2bnRicmhBdzB1QXRORWwydDFuTGdkWEo5dDg5?=
 =?utf-8?B?eDgwZVNwVG5aMjlWWUlvOHZ0N0I3TVFnejJHNDZUdDRpNjBhZjlRTms1SThN?=
 =?utf-8?B?eEd6T1lBekxXdWVpTENDMDhETklucE9FZHljSE5VUGJuWXFQYXBQa251bE9R?=
 =?utf-8?B?aldZR1ZkSnErYnBPVXBWTzN3cExmVTFzTDBHQXRxTitVampQVkZzOU1lWFlp?=
 =?utf-8?B?MzRjSjBnNVNQTzZUNlk0OVJxVWorNkFiY1hZMVYybjdMK1BrYzIyQ2paOEJR?=
 =?utf-8?B?a3oxSFRxRkxhZkt2L250VnU1N08xWXkxaHJac1FCellZWTNwYWVaTzUzVnBO?=
 =?utf-8?B?ekVKWTZaWFRremlwZGxxYXZaeVc4Rm9GZHllcHgvdzMvY1ZRdG95eGlVR1VV?=
 =?utf-8?B?MkNOUGNiS2RETHhIdmtNOE5oSjE2Q3Y3eC9SdDdwSFpSTHNsaEYxMEkydTE1?=
 =?utf-8?B?dnVTb2hPcnJ2aE1vRG9WS3Q2YW9jenBTMUdNTEdIcFY3Vm1IR0xNTTg3V0JJ?=
 =?utf-8?B?YlpnMC8wQW9MclM0Z2QwVVNFZ3NRWEorN09YdGtqc3A0U0l3SzNKT0NLYlhD?=
 =?utf-8?B?UkgrQTJjaDFNclBoM1orS3VDcmRlZUtwc1hlVEVVWTdDbFlDbnFTQ1J3MjdG?=
 =?utf-8?B?bjhRUnk1cnU3MFEwWDdaNytCVitCdWMxUlR1cWY0ZU9Tck9tUTduVWVvSlU3?=
 =?utf-8?B?M1k1aGVwaEJ6dGltaEtEWnNES2Q3Zm5YS2ZQWGNwOE5PcUJvU0oxU3dZWVZG?=
 =?utf-8?B?cTBGMzNvWnh2c2UvR2Y0V2RZYTVXQ09uVm40VmtOdld1bi81NEVTRCtaV3ph?=
 =?utf-8?B?SlViM3g3UmJVMitPZ2hGQUhJdUFxMFJXVWxPTTNhL1NvMUdwQkJmejh4TURK?=
 =?utf-8?B?bUxWbElleWhZbXllSXVFNzZpVzlJclk0UHEra2xiQ0MzZ3JFTnhQcjNlbmxp?=
 =?utf-8?B?VElHQzRUbFNOazYyc3p2OWZrR1NYSGQxZHNPR2twczRRb0ppUWg3eWgraTFB?=
 =?utf-8?B?Y3R5WVZURHBraHJJMnZvaGtHTHlzSXhVOWVYa2hYdUEyVGZTRnVxdSt1SmxE?=
 =?utf-8?B?SHUra3V3L0xJN09LY3IzcVFwcW1Fek0yYWFua2lsN29Vc3NSVnFrNzNZQm1u?=
 =?utf-8?B?QldlTUFZeWJEaDJ2bWIwZnI2ejBjVFBXcks3Mk9iL2JWSkhtTTZUZnpYc1FZ?=
 =?utf-8?B?TGt5YjFFQjdxRXBSMFk3UHp2c09QQzVMQ1NKOGVSU2Q5cWFiejk1QWtKMjBp?=
 =?utf-8?B?V3dSUGorMmhzNCtVbDlSbk9ieVdENzFLMzR3RndRdnNwZVhnbS9IVnlyQkZ1?=
 =?utf-8?B?TWR1OGFzYUhzN2wyeWdQbURmQnBzaTlIbmM4Ymt2alFaaVNUYXl0WnJlOHg4?=
 =?utf-8?B?bjloOFgrZEJzRFV2T0VYdUU1bjVHTVpFMTZhSzJISEg3aHZNNTlUUjhYcm1B?=
 =?utf-8?B?ZnJhMStLT3JtS1g1aFdxekJ5MjlpOTVqVlR1L0grRlhXNTN5QmJQbnFOTFZR?=
 =?utf-8?B?UUJFNzlrRlZweFI2eTJqQ1krTEpPUGQ3Zi9ZSjlpNlBsZ0F4RDJacEt5QW9q?=
 =?utf-8?B?WmVsellnb21IcTVJZDhJVHBHKzNDZVViR0RtN0RDU09VSzZqby8wR2R4bDNj?=
 =?utf-8?B?cGprUE9xWjR3VkJ6U0RxazhUbFYxWHVZbEtaTzFLWVJOL0JHelRVVGtuSWdn?=
 =?utf-8?Q?pox9/jFGgXxNkucVhm1eemhRtQaJGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFpxZHdRdmN5Mlg0a2U2Y0FZYlliTVlKQmtNVHNPdHV6TjlJejNvSzQ5UGVv?=
 =?utf-8?B?L3J5RW4rSjZPbW15cnNxZnBFQkdhZkdSM09nc3V0R0ZYd0Y3R1F2bTc5QVBX?=
 =?utf-8?B?T3NPc3EyQlVpRTJ5ZS9EdjgxRkhqdEV5T05SelVVb2VPa002cG1sYkRsbUdT?=
 =?utf-8?B?cDdBWWdEcTJ2VzdaV0FnbEsvSVhCSXBJUWhMVldZMVlJcXhTdU85cmszRy9s?=
 =?utf-8?B?T2QwbHFTelg3clFmSW5hZUN5b0tNaDNMTnRWdGNpSUg1LzNXeDBWN3NVUDFS?=
 =?utf-8?B?Z1RUczY1a21waDdXMWcxbzNqbVE5b0t1OWh0U1ZhWFZvSlFGOENiLzZ0amZk?=
 =?utf-8?B?SkhrLzJleXBOcXQxY2UvcnZqTGg1QVh4Zy9Ja0ZwL1RQMDBBVXYwNWhFdURx?=
 =?utf-8?B?c05PMTJ4VmNJVi9WUzhBd0xxMU9kOUhPcWYrVEVaTWVqS1dyNWQycm8wRTFV?=
 =?utf-8?B?QlpNSm94em5qOHBRR1hxaFpMODczZnB5NE5ZaGVqRzFjNTRpdmthT3hTcWow?=
 =?utf-8?B?cmxzRWRIeEk2bzg4cDRFQ0Q4a3FEQWlwak1Ga2VTN1BBblQ1bkQzUGdqZ1NM?=
 =?utf-8?B?T1diM2xoaDNRd0YydnBDSW9tUEZ2SVVBOHhvT0FZdUpoRm5MN1ZVeWxkMHNE?=
 =?utf-8?B?cUUzM1JtYXRST0JxR1h2bFhVaE5JL240MzRqdjRoNFlsNWZ6cnBORW5xc3kw?=
 =?utf-8?B?YjdQUWVhOEl1SFhqUjc4MDc4aGFNUDBtQUtxb2xyRFBMV3ZIRHJsckdNK09D?=
 =?utf-8?B?bjlrUnhCaUF3UVliaFozUm5VdzRGdzNkOTFEa1ZZVUpzUkwrZTlheDlQQnVj?=
 =?utf-8?B?Q2NTbElsM2RSVCtnWVFreG1ZZlJwT1FwQ2hXb2pXOXMvRGhlTFcyREowVDAy?=
 =?utf-8?B?UTl1MDViWkdQTnJVZFhPbm1BSUtJQVQ3NjF1aWx6TCs2b2ZjcU9sUnpCc0VJ?=
 =?utf-8?B?NWJydjU0WElwbmh5SlZjTVNVS0tKMUxydjIyZzRSZWlzNlZGMERiblR6bnQ3?=
 =?utf-8?B?c1ovQk9ZR0JOYUxJaENHRWNTbDc4N1ZRdGxIRm53aDJmNWQyUFp6K0VXR0dT?=
 =?utf-8?B?OU5vdit6OGlTcGFFdDNHZ3k1S0syMU9Yd0FDamk3aklNSWhhVmRTMHY3WERs?=
 =?utf-8?B?VDR6ZXVNTWxtdDJCRFRSUU1acmVrSU9Gc2hLWG9vSlhVTEtCd0ZoMklUSElm?=
 =?utf-8?B?bnhuTEw0K0wxS1c4YjhlYnFIZXFpTEVDb2g1VjRvZGNrc1NUMDdKejNuQTRC?=
 =?utf-8?B?dnplb01HZkZUUjZsbDlvY1hpUEZWdldKUkcwWlRDS2VMN2pSUEFwTDVBY2NP?=
 =?utf-8?B?U0R5NU5SOHRGa1VmVkp0NisveUNSVDUzM3NVVnRVQkRUNTFBYkpDL3ljMFBK?=
 =?utf-8?B?V1IrRmI2M0dmKzY1OW12RnI4V3E0ckwrMzhxL3NPNHFQNW5sYUxBd05SNG1X?=
 =?utf-8?B?SVAyelhQQkk0U3F4U1d5TkxueUx3NGYvejB5cGEzY2FOL1l1cWVWSWpDeXBZ?=
 =?utf-8?B?aCtya2NsM3FlaDRZZEN6Z2YvSTgyRmp2T2NTQ1pBc1FmUzIyMHNUSFBKL1lk?=
 =?utf-8?B?djdPdEJqWGFURUwrdXhDOTlCY0p3SVk4NkFwY0Q3YStJY0xWMVltTWc0WkNp?=
 =?utf-8?B?azRJTzlVY2crbzh4U2JTMGpQeEJBcnlJdDBKdzJnSFYvMytEWlB3SlRTbDRZ?=
 =?utf-8?B?alorVUJ2QWVHUTcxTnFCWXRRQVVkZUFQQTh6YWtXRG4ybFBaQjBxR1RRSmMv?=
 =?utf-8?B?YTdSbmxyVjI0SVVwUCt4ckxYaitLNGtLMTdWblBZMUNGYWtTVy95Mkk0VnRq?=
 =?utf-8?B?S0dnd3ZtenpVNStpR1pBcUltRkU4S3ZVZTVmMVJsdy81dGxDSDJLWkFJaFJj?=
 =?utf-8?B?OWp2Uit4dkZiTHdCV2NtYm9JWkdPT1ZXOWZ6L2R6UVdiY2JjeFFDb2FEUUpj?=
 =?utf-8?B?VzR0eVBLTG9pVnk2TWs4OWhuY3VlS3psczhKTTQya3VTRmk5SkplZXNXcFNp?=
 =?utf-8?B?cFBxejcwVnpWU2tCVEwrbHBvb0R4RHhnTUIxSkF3MUhsVkU1UlR2ako3STRQ?=
 =?utf-8?B?M0VzZWNid0dIajZVMkVpMVpGSHJQNXh1dDBGZXhHNDVObW11YVA5a0oxemhs?=
 =?utf-8?B?NFRNVTdUdW9ZbS9zTUdNRUt5TE5pMU44Z3VGa09qVnJKL3YvMXhJWHJEYjlS?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e389cc-d639-4ad2-56b8-08de17f3aa2d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:34:03.4343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2ogY4xGuY8xnI+qGM//LqTCaLX23VBcdekzhYtmfQ+I3XXi+wsDfJS0kYeZtSbhBA+O7AEpY08jSe9owdvYuwPfdBA7usS/Dh0HgOv+Pnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
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

Vendor-specific VFIO driver for Xe will implement VF migration.
Export everything that's needed for migration ops.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   2 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 248 +++++++++++++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h  |  30 ++++
 3 files changed, 280 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3d72db9e528e4..de3778f51ce7e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -182,6 +182,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
 
+xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
new file mode 100644
index 0000000000000..9b02a86132e8b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/intel/xe_sriov_vfio.h>
+
+#include "xe_assert.h"
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_sriov_migration_data.h"
+#include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_vfio_get_xe_device() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_sriov_vfio_get_xe_device(struct pci_dev *pdev)
+{
+	return xe_pci_get_pf_xe_device(pdev);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_xe_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_migration_supported() - Check if migration is supported.
+ * @xe: the PF &xe_device
+ *
+ * Return: true if migration is supported, false otherwise.
+ */
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
+{
+	return xe_sriov_pf_migration_supported(xe);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will wait until VF FLR is processed by PF on all tiles (or
+ * until timeout occurs).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_wait_flr(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_suspend_device() - Suspend VF.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will pause VF on all tiles/GTs.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_pause_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_device() - Resume VF.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will resume VF on all tiles.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_resume_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_error() - Move VF device to error state.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Reset is needed to move it out of error state.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_stop_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_read() - Read migration data from the VF device.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_migration_data_read(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_write() - Write migration data to the VF device.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_migration_data_write(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_migration_size(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
new file mode 100644
index 0000000000000..5b02f66465ed9
--- /dev/null
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VFIO_H_
+#define _XE_SRIOV_VFIO_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct xe_device;
+
+struct xe_device *xe_sriov_vfio_get_xe_device(struct pci_dev *pdev);
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid);
+
+#endif
-- 
2.50.1

