Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A0A5D5EC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 07:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52EE10E6D5;
	Wed, 12 Mar 2025 06:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rm1QYHU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71AC10E6D5;
 Wed, 12 Mar 2025 06:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741760209; x=1773296209;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=41YAgD2AgEATaBjYeVjScCfboONcJHxCtF4K821+XUU=;
 b=Rm1QYHU/ywD6oWloKQ7KJCmcTi/zalPFpEorN4cvpO47Lf8gnetfSZcv
 QS8OszTN77h+ylFYkKQFzXiAcHQn2sybXAydBMsNL9ZDFYn0nN3Z6ONqC
 Vg8q7Zb+3mMiq6b3zaQLiUqpaRQ3yIMA0b0LEtVA6GZuOqP9nj4FeamEx
 uByfZGKZPJnqBomkBodd8+0ec93dsGmc7Eme2mwMzdRLe0i3bwX/udjB3
 QDU7ju0e48nboQVQU09ZBMklMdOHzP/BO8UUkW82ZjYV2GGUI1QjJNrPD
 DDmlcT3XUWxWXHnG7JaukdZ4fsuE4i9O9g/0S8eMlWHf/391Tmfyqeek6 g==;
X-CSE-ConnectionGUID: jAvHzh8dSKaYSvDta1SHKA==
X-CSE-MsgGUID: g+ROp+BXT46R6owrBRPkQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54211520"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="54211520"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:16:48 -0700
X-CSE-ConnectionGUID: 0EQ6K3dgSoSrE42TRvlLBQ==
X-CSE-MsgGUID: 5zWPsNa+SNSLTNHACoNOHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="151356759"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 23:16:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 23:16:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 23:16:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 23:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPtkIAS1Af8uiql5wOFRzUxqSXLocvC8IVp1nMN/58NMqLwO6FCAUAY1Zc/jOCyU4P5G2pFNaSZO/qw/WGAlYzw2s+0FnkZq13Vfsd8kLWvubs793iIiFCxIPoz0fPsWh8AcFlbay/SIII+WRalpTfn2pneJuG3rXfubWgtXMoi3hYmiNK3q8DjvpqEU6iRj4cR5Ke/DQG2K0EwRVwWvifYJWE5VrTPbwJd+mIQ3odTzOZn6rfvf63LnN542NUiCV8cWI3fgnNuwglG9mCM3DISdztJvoOhapnnz5bUk1pLNoGi7vfsDfvRunlwNjCjhiKXk41t2fj7TWTdwbmry9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drEmfPWH/MZ3tFnCTTxuQiAoiBHDw8L/WoqYiOWrb4Q=;
 b=g8vvIUr2tOudUphA0h/7QhAXaRsL5UX1inp+wmTw3MfxeWFjx8rWyoPmvlqjdS/S29EcyXjO5dK7FLKSRuKYgiSEWjPuHodvvPf4BeZ3mhD4RVzrB3XyijSCj6vnOLaTB1s+T2Dihpt7HNIHjUAUWELao7OrJvA9iDm6ruLkRSglmXYNII3Rh4aoTek07h5HUY7WEuBVLCCGi72KU4CL03YYRaHhL7rSNwIX7CEejUZAltBIU5FW7oa1ynA74umkcxDUQjra0o3ewWaHFajAQAlPNJt2t0m9AG63bSIGe4OMUJdSBfsEWgD1x1ecYAjF019P4cDSIXIm9OwIKKxh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 06:16:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 06:16:42 +0000
Date: Tue, 11 Mar 2025 23:17:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/xe: Fix uninitialized variable in
 xe_vm_bind_ioctl()
Message-ID: <Z9EnDulWWtrOTQak@lstrano-desk.jf.intel.com>
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
 <Z88ZzoFA5KpQTLmH@intel.com>
 <95a4da90-dfa0-4033-aba5-276b3d9a1824@stanley.mountain>
 <Z8/EVnqZoYamdjTy@lstrano-desk.jf.intel.com>
 <Z8/GLyjqHlAOMhoM@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8/GLyjqHlAOMhoM@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0317.namprd04.prod.outlook.com
 (2603:10b6:303:82::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: d564c093-5936-4236-6a35-08dd612d755d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mll6L3l4NEtpbEJZbFVjU1kwNVJ0NnlidmtBV25wM3NOTnU1aHIwbTNZMm5v?=
 =?utf-8?B?OEc5RTh6WDNBMlNZSk1oekJDaXNuVWpRRjJMWVlvMTRFUDRmYWxwa0ZYR0RU?=
 =?utf-8?B?eERObjJzVnF5bDVrNmxtVjBDNTJhMmc1NEtPSll1YURaajZkNTJOL2JKaTFo?=
 =?utf-8?B?WVMwL2VYS1lXak5YaUZqSnpHUDF2Q29yU3lPVkxiQUtvc1JmMDNpSkw5Slhs?=
 =?utf-8?B?QXdnODNScjNHeVNJbjIwNTdmdlpzd3hjcXUzaFRaVlFXaVc5VnVJRVEzcExI?=
 =?utf-8?B?bkFlNlVqbDFmTHE0Q2o3RHI5SWc3dVhFQjZjTDF1ajY2Qmd5S0UxUnFXRk9u?=
 =?utf-8?B?NmMvNEFyclhzVFgzRVcraXl1UXhTR0JCQW12UWdxQ0RqV2xqVFYyZXJuL3Js?=
 =?utf-8?B?L0JmVWFuVnpqQVZGWmhlQWFwbWp6WkpoTmpkNlFxVDJaSkp3OGprOHVUSytF?=
 =?utf-8?B?VDhpdDVpZTVieitJK0NaOFJZU1dYalZWaTR4NHlSZk9mMzNVaDBsK0ZiaGFr?=
 =?utf-8?B?c2RSTjRuWDh5TkdRdDZ6TEFJSlV5OXg1QkN2OXFlUzNibEN6bCtJdEQ4eHpB?=
 =?utf-8?B?WXVQL1M3TGRKT09MMmhsKzlXYXBiQWFIRVV6RGJ5UmJKSHAvYk1XdXpBdm9o?=
 =?utf-8?B?ZGdmYWdnM29ySUlLcGdxekRIOWFsQWw2SVlLcWxuZCtnUmVCbHl6SjhWM0JU?=
 =?utf-8?B?K2htOHJYZmd4THROUlBrVDEzR0pVOFVxZkpWaVh3VG1qRktJMjFvci9KcXFh?=
 =?utf-8?B?L3FIWEd4WjZGUFVSYkpjVHlOdXZFdXlmcXNOVjc0emtxWE1WZmFZN1E3ZkpD?=
 =?utf-8?B?RXMrajZxUWNEN2Nja1NzTXZXS3kyaWMzdXpwNWpPYnlIWVR3cGI1bnNSaTNr?=
 =?utf-8?B?NFNzS2Qxakp6eTNyRkVMdjFYYTR2V0p0aUFDdUNYc2E5NDhGeUVWK0VoREJV?=
 =?utf-8?B?RHdnbmdpNDVJWkpIbDdLSzg1NGFNOUN6NW9UdVFLOUR3ZEtlQk9vbCtNa0s4?=
 =?utf-8?B?MWQxOFI3OEhCNkNyTlhhZVZDWlhDdzRpYVRRQ0FWU0crcGtPKzVQOEU2R2J0?=
 =?utf-8?B?RElzRGF5NFVTUVllWjRPZFF5aWtHSnMvaTNKUGVzT2l5akxYTGtQS21MNG1D?=
 =?utf-8?B?ZUt3dzdHRW53VmhsOUFZNXJGUVZudExwSkJFd1lRbUVaMGxKL3ZJSko2UU10?=
 =?utf-8?B?VzRZWVMzZUdQM1NDRmxNOWptYnM2TFRGZVFRZlArbjlEZXQrd0RsU3VZQnhv?=
 =?utf-8?B?blVSb09PWkdHdjlnRDZTc2tVOFMzVjBjNWRkb2dYYyt6RXNKSk1kR0xJVXp4?=
 =?utf-8?B?RUxNOTRMVlBvMFlnTlBNUHMwek9oT3lFL2xoY3FDQmxNM1h2dHRIOXhSMDNC?=
 =?utf-8?B?N05Pc1hpZ2RMQUZmWWpsM21UcERuVVB6V0x5bm9KaFl2VjV4UjJjODg2dnEr?=
 =?utf-8?B?djc2TkJ4V2lLendOZkdleVA3UzROcXJiL2gwdnppZEFOU3RUc0Rya2pvQXBB?=
 =?utf-8?B?Sy9BRE5GOHZic1VIYmVabldGbGUrNHBtSHd6L0JRU2duSERGUm1QdWVCZXlx?=
 =?utf-8?B?NFZMNS9MWmVLektBc3J1OWdITGxzK0JJZ1c2cVNycTcxZ3lSVnFsTmdHWGpK?=
 =?utf-8?B?VXV0Q2RqMHlINXdEdFZLODJIK0FRbkh5eXdKTDV4bGZDTkp3K3p1M0xrbXpF?=
 =?utf-8?B?VjAzSHI4U1JZZVFXdm8rTXhKQWVvcGFManlhUkhISy9pTW9pNndueVdqR3lB?=
 =?utf-8?B?RjlCY3RVTEN5Tkw3eWw5bGlKUG43TVZaYzNSQWRXSnFwWUhqVFdQS3hWTVJt?=
 =?utf-8?B?MUdFRDBnYjFKdGMzSkFBNFQ5dWNkVkFDM1dBWWlpYjlvR0tESHpnK3MvMzBl?=
 =?utf-8?Q?/v6MSq9Ma0dUX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU5jajQ2Zmc2eG9tdEtrZzlwYWVkZ016NG9QRWlKeDE5Y3k2K3pWMWVoUUU1?=
 =?utf-8?B?MlZOVVBzWmFaL3NBaHVnN29Pem53amdqOStjM1pRWGg3SEYyNWY5Q3BGWjdE?=
 =?utf-8?B?SlZmZm1WRmNMazhPMDQ2ZUUxdWU4cVhrQ2tQd1ZHUS9lVWk2OXVndUNUaGMx?=
 =?utf-8?B?L2g0OUJaSkVaVHp1ZzZpdlozWElob09hbmpqVjJDeDZQMzB3VndEemlIQmtU?=
 =?utf-8?B?OHJCN3dmbDN1RkU1Q2ZoMndYcDY0QlZFcWtyMzkwanM5bmRFMDVSUUkvUldx?=
 =?utf-8?B?WWZHVnY1b0RPdWk1L3UwUXFWR1hUQ3FLcGVGdkRnd3V1ZUdHTmJZUTJ1cVcy?=
 =?utf-8?B?OEpSUnI2SjZIZlN3RExpa3N2aHlxY1hHQ3NSU0U0YXhRSUhTbWhMRThlQ3Ev?=
 =?utf-8?B?bnNIUmtJMVIySjBKemNmemQrMHBncXRIU2I3dEhTeldSbkw2WmhpcS9jaXJJ?=
 =?utf-8?B?emxPbVE5WlVpaGRVajFtTkVXc2VXcjNySnZtckhRMlMvSmVYbVcvSlhTRmQw?=
 =?utf-8?B?K2dHbkExTmZvSVBLUko5N3o3QXRvSnRYdmV3UDU5MGpsczBKRFlCQWJiYkxK?=
 =?utf-8?B?UU1pRWpEOXBxWi9aZXM5RitsRlVVSDFrTkFnczlkdmQ5bXkxTGVaRW1ob20r?=
 =?utf-8?B?L2dDbGdvY00vdmNwTlRxSmF3UlJCVkZnYmNPOWRmOWs0aStxZEI4KytOU2s5?=
 =?utf-8?B?a3NZTWdLaUtkQUQ5ekJNOTEwTUtTMlkrQWtNRjUveS9HbWhEMmVxTzBWOWQx?=
 =?utf-8?B?eGU1ekxIcytVYXRPQTJPd2dCbC9zb2Z5VUZ5L1BHLzljQ1hTQlozSmRrY1Vt?=
 =?utf-8?B?bHpIK1ZJQy9kaFF6bnBMdlhKUllza3h3N3hrdEt6S3VjeHp3aUdpajNPL2Nu?=
 =?utf-8?B?TjNyeXRFSkZHbGZ2akxUNjBUbU1iTWFGMDBTKzBGU1RqUi9ZVEIxdFREL3RR?=
 =?utf-8?B?cXFRRmR2NS9VUGl2QmxDN2ZvVzdkZnBkbVhCak1saGR6YzB6ZzJ5cDVXMkpq?=
 =?utf-8?B?STdFMExVMElOTHNMT21HN1gyTkpYcHYxQ01RaE5neFdMTTRKRWRzQ05BUGhT?=
 =?utf-8?B?VDMyemx0SVc1Y0czNzFYR3M1aTdCdFhrRllIZmFTNzY4N2J4aWF0NnMxUjVW?=
 =?utf-8?B?czNXN0R6SHVrU1NzSGpBeEhHMnlOcjlWMFRlTTdYNHpRR201em5uRzdMRGhn?=
 =?utf-8?B?YmovVXc3RjJOQVRhNHhkMzRaL01seVpCVktQV3hZdWYxMy90NnlzZ2s5Zk9R?=
 =?utf-8?B?WndLaE1JUGx5VzFSQkhpMVNSMDY4RVpzd1R3VzdxR1Y1TnNyYVNDWW5Ndm55?=
 =?utf-8?B?R0lzdDZMOVZMZFc0SWk5NStvWkxTSXppU2FpYmJCQjIvbVU1R25QYWNhSVN2?=
 =?utf-8?B?YlFkTDBUQXhkQTRUUXZScGI5VThJenhhSUM2bWQzTUtJUDlYMUhOYXRJRUZB?=
 =?utf-8?B?dDAxVkVHR2hFNkhyNGVqQWRCVDFsbjVObXFKRWdSaERZVHBoUjF2R0FYby9G?=
 =?utf-8?B?UVE5T0VveElsRjZSaWFxcXMxSHBlU0hYck14Y0JSZkc3b3pYamhxZ1FJK29z?=
 =?utf-8?B?cTBJL2podXFCdjcyQVRlUUVneFdxeWszTGdFayt2RUxpdXA0L3BYVklKdHBI?=
 =?utf-8?B?bkhmU2kzRVhJY2t2cmdGUDkwcVg2ZG9HeXUrSmtjcEgwNUkrdzJ5TUR4M1Rl?=
 =?utf-8?B?cFZyS3M1aGYyUTk4Tk1iaWNHTkw1U2RBSWRKalVjU25ZUkQ5OHlFay90UW81?=
 =?utf-8?B?aFprVFZobGxqNjAydnM1amdTOGNrQXRjYWsyeGE0MTg2MVVCK3NPeWdTTkxn?=
 =?utf-8?B?OGtodjJybUo2VHlKQkhIS2pFUVVHU21YUkhRbC9LYTJ4bWJFNzlkS3lNV3NP?=
 =?utf-8?B?QW5mOEZlS3djZEhocmd4SEhqeU0vTlhvU3FRNEZGRkRjTDF5S1BOa0lEVHJG?=
 =?utf-8?B?ZFhFcHdLR3IweEx3T0xUTm5kWTRPSWtGYm1reVRib3F3VUVJOFhvZXltVWNE?=
 =?utf-8?B?eXBUcnRZUWZyWVFXT3l2RTQzOW5aSU5paUVCL1VNenkxc250a2pIaXpRSWlT?=
 =?utf-8?B?T2hESWpMUVRqNitwRFBvN1A3YjRFeXNIZGljcG9LdWRMM0JlRld2dUNXTFdX?=
 =?utf-8?B?TjhKVlVlWnJycUYrbGpMNUcrM01DMDcvWjJjM1NUZEJTNlgrcUN0YkNXazlp?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d564c093-5936-4236-6a35-08dd612d755d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 06:16:42.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ol/ce/YD6xm9yB1vYhnoeHzkYpFbwH6WUPtM1JUQsfFujO7jVmdmLCydLh8+BtBpZSICoZZZLsgHBSjM7dkeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
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

On Mon, Mar 10, 2025 at 10:12:15PM -0700, Matthew Brost wrote:
> On Mon, Mar 10, 2025 at 10:04:22PM -0700, Matthew Brost wrote:
> > On Mon, Mar 10, 2025 at 09:22:50PM +0300, Dan Carpenter wrote:
> > > On Mon, Mar 10, 2025 at 12:56:46PM -0400, Rodrigo Vivi wrote:
> > > > On Mon, Mar 10, 2025 at 01:48:00PM +0300, Dan Carpenter wrote:
> > > > > The error handling assumes that vm_bind_ioctl_check_args() will
> > > > > initialize "bind_ops" but there are a couple early returns where that's
> > > > > not true.  Initialize "bind_ops" to NULL from the start.
> > > > 
> > > > It is not a couple, but only the one goto put_vm where this bind_ops
> > > > gets actually initialized, or not...
> > > > 
> > > 
> > > I'm on linux-next.  I'm not seeing the goto put_vm...  I think we're
> > > looking at different code.
> > > 
> > >   3063  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> > >   3064                                      struct drm_xe_vm_bind *args,
> > >   3065                                      struct drm_xe_vm_bind_op **bind_ops)
> > >   3066  {
> > >   3067          int err;
> > >   3068          int i;
> > >   3069  
> > >   3070          if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > >   3071              XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >   3072                  return -EINVAL;
> > > 
> > > One.
> > > 
> > >   3073  
> > >   3074          if (XE_IOCTL_DBG(xe, args->extensions))
> > >   3075                  return -EINVAL;
> > > 
> > > Two.
> > > 
> > >   3076  
> > >   3077          if (args->num_binds > 1) {
> > >   3078                  u64 __user *bind_user =
> > >   3079                          u64_to_user_ptr(args->vector_of_binds);
> > >   3080  
> > >   3081                  *bind_ops = kvmalloc_array(args->num_binds,
> > > 
> > > Initialized.
> > > 
> > >   3082                                             sizeof(struct drm_xe_vm_bind_op),
> > >   3083                                             GFP_KERNEL | __GFP_ACCOUNT |
> > >   3084                                             __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > >   3085                  if (!*bind_ops)
> > >   3086                          return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
> > >   3087  
> > >   3088                  err = __copy_from_user(*bind_ops, bind_user,
> > >   3089                                         sizeof(struct drm_xe_vm_bind_op) *
> > >   3090                                         args->num_binds);
> > >   3091                  if (XE_IOCTL_DBG(xe, err)) {
> > >   3092                          err = -EFAULT;
> > >   3093                          goto free_bind_ops;
> > >   3094                  }
> > >   3095          } else {
> > >   3096                  *bind_ops = &args->bind;
> > >   3097          }
> > > 
> > > > but perhaps the order in the exit is wrong and we should move the
> > > > kvfree(bind_ops) upper to the end of put_exec_queue?
> > > > 
> > > > Matt, thoughts on the order here?
> > > > 
> > 
> > Rodrigo – I think you are looking in the wrong spot in the code. Dan's
> > subsequent reply, I believe, explains the issue correctly, so I think
> > the patch is good.
> > 
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > I feel like ideally vm_bind_ioctl_check_args() would clean up after
> > > itself on failure and, yes, it should be in reverse order from how
> > > it was allocated.
> > > 
> > 
> > This is a bit of goofy error handling/convention—perhaps it could be
> > cleaned up in a follow-up.
> > 
> > That said, this patch is correct. However, the 'Fixes' tag looks
> > wrong—it has been broken for a bit longer than the tagged patch. We can
> > fix it upon merge.
> > 

Cough as I eat my hat - the fixes tag in correct - the patch tagged
moved the args check after the VM lookup which created a bug. 

> > With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> 
> Actually, we have another problem too. The 'free_bind_ops' label in
> vm_bind_ioctl_check_args() either isn't needed or it should *bind_ops to
> NULL after kvfree to avoid a double free in put_vm label in
> xe_vm_bind_ioctl().
> 
> This patch is still valid though.
> 

Posted a follow up include Dan's original change and also my suggested
change above.

Matt

> Matt
> 
> > > regards,
> > > dan carpenter
> > > 
