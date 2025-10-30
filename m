Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C72C22438
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72FA10EA5B;
	Thu, 30 Oct 2025 20:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nf9Z0wHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A83C10EA5A;
 Thu, 30 Oct 2025 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856392; x=1793392392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1L1rhFqxScJB67SPq4akSvYOwqLWLRjtQOYSK51u+jY=;
 b=nf9Z0wHpoj5itRsmHalpdzPZxJf37iQ+COW8cFRxNXTQ2BXSbfkKrgwN
 r6RJMIbcqu5UlFJi0JpQ+fFZg/asdpPdruo3pU/dY26FKD9LxJs0p0hUm
 n/R1AyXoHiSnikyD2x0o20ERUeDL6+lYyyRLT5KMYT3zpAIcoaqsGdo2D
 UBV0qooeqcTtUheKN+A7AAu4jmttyaJdq0DIouVtO4/evB79H+XKdGErS
 DOh8LIaTSsm0PTB3Kxwb4xEwOvXxKsHH8eW71IQg4yUKcNmTCNP0ZJy1z
 CeXr8YUfLBsSzRaUeY/XMfNtpJXFhuoLokrtfP3ukHomspsAMJiCNwVQ6 A==;
X-CSE-ConnectionGUID: z5wNqaBLTU+pmjPqTC0QrA==
X-CSE-MsgGUID: gDAIYVxDQ8ig4WRnLaPeZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75130093"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75130093"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:12 -0700
X-CSE-ConnectionGUID: 10/K0NQUTv24KJ/AfbKziQ==
X-CSE-MsgGUID: EXn8QFvrSIKqtpFhCG0cIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262651"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:10 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN/Koxx9aHCk28I9yoalFB0YHjGIDRlaTOhHfCYLXItwD1EwxImGRwrgO83/pD2hwiiN1Lfehw6TwTy7i9xcczYFtXOr1HSOI4bp+i7uvlDfD8QZqrPziylOQen1/0lE7XGJSnlK+1e0qDePwb4oqUjbSOQ4pMNtk3bdzhXfLSOWe5bSWBiUhQLL8g7xQlfg8cHZCGhPQSK1SaVL6hEXrdNTZeu/0Z6UTMDOXk5+IdP5aUKxLdhtzzmH+ySLdCp+6S2J9myp1xV20fwwnfTdlE26uqn+JIodlN/zW3KpvIZJIR3WLMtTgjkVT6v618oROzmeTQvAhTfQs4rphaIZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFOjQcUN92k8NAbFk5nGQRo/G2mTq5dY1xvSeWDvxYI=;
 b=sqvgC9ENarY+Prm45b6V+CRvEIorRe0Sul5uFaCB1Dienv3jhrhGgavkf6oQduUCwLf+2ZknX/8wKa9JWEWGAfTJ+qMMa6D7C5dAZchKEbsTst+LF042Xgn5Pq724tdXe6ra59gyQxkKisKCoHEsz+ahxlcNQ16abpENtnkTedK7446PrhsHV/cauywkgnIVjXIY2vRRWtdNg8pWkAgPIuz3kHMajgql1e77/ZQLA3DUlVxLGOH/QuTD+Ic75KOO1M4wAkr+p84dDxi96zJ1Nlj0el8U3ufPaNhApi2EfLvUhMVicfc+xthCfuk2rJZNSktSoQOhKmrxwacPPlrEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:07 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:07 +0000
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
Subject: [PATCH v3 14/28] drm/xe/pf: Don't save GuC VF migration data on pause
Date: Thu, 30 Oct 2025 21:31:21 +0100
Message-ID: <20251030203135.337696-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: d4272e6c-9715-4349-7142-08de17f388b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWJTdFA1Z3ZXWlk1OWtzR0VRdnZmNEZFd0xwaEJrQXpDKzZrb3lXYUJPODJZ?=
 =?utf-8?B?azZnNDBwYVRycUVUSGlzMVp5N2I3TnlNNFdDWVBWYTZJNzlNQjBXVG1qVWha?=
 =?utf-8?B?d0lkcEg3d0lpTVVMYUl1V3haMEdRU3lDektVb08xVnhqS2JaUmJKVk9zQjhu?=
 =?utf-8?B?VTZ3NFVGNHpuNDNoZmdncG5kMmo2T3dDYnV0YUlZVWJ1cFZPaTN6QjJyTlA5?=
 =?utf-8?B?ckZzcVdKbjhycThyak9MWXllU2VSU1p1SXJMNExEcXpnZHFoWldOY1VIKzBo?=
 =?utf-8?B?TGVGM294UUpncEZhT2gzY2pCZEhRTWtDbDI4VmtjUXR4Qit6U1J2bTIxSnB2?=
 =?utf-8?B?OS9LL3h3TWx1UVVWWVlNL2I4R0Q5dWR6VGtaWG9mNzliWTl6MlczRW1ReVov?=
 =?utf-8?B?Q21PL2tnc1Z3R1ZIYVJoaCtSZ2hDSEpKN2hycWsrR1dndGlmRjdmT1hGTzZB?=
 =?utf-8?B?RWtQeXZaVXphUVNCS1N6cjdKVmJPaTFEdjJPK1pZOFZqOHU3Z0pXaHRVOTh0?=
 =?utf-8?B?OTlhL0hyR2l2QlJteVgxZzRtWDZxZUxYNmRaZ1BUd05IazdnQ2g2SzBkTWVZ?=
 =?utf-8?B?dUtDVmx2VTR1bGluc1M1Rllsd3RpWW9DM3lFbXlkbnVxYzVNV2dOWi96Um4x?=
 =?utf-8?B?Y2N0cTV3WXZqdkJWZEJSSGJTbzFlRlpCajFyN24vMDhCTUtSTHhJUEtwMi9Q?=
 =?utf-8?B?V2tDUCtxS1puekNHRHlxZXBmK1ZBZDdBcFJOWnV1QkcyU2FXZjhSZ3hTdmE5?=
 =?utf-8?B?WnVoZXFPTHd6ZDd0NDR5YU9DVFdnWksvdDN5eFRHOEFTZXd2L3pOeGp0R1BF?=
 =?utf-8?B?aGwyb2JBREVFTXpCbzJVQ3plNWd3N1ZnWm5IZXdVVWliOE9JUDRPTVByZFRt?=
 =?utf-8?B?U0xmZkdnRm15bWgwclZkSVd2cy9lVHZPNkpMZ1VUK1lpdDZKdUZ0QzRwRVpX?=
 =?utf-8?B?NXE5K2hVenlETkU0QVpTd2pSZXZlU2hsUVk3OTJrcTM0dmh2T0ZXTXVad21o?=
 =?utf-8?B?T3grL2JWc2E2dk9KWHVtYmorM0FWNXhydGZEcnRFWnB2ZFBQcVdwZkpsdHli?=
 =?utf-8?B?RncrTitSTFYwdVlvdW9ZSnZCd2VEWkNTcG14cFh1OWk0UUFaNGg4emRUUklQ?=
 =?utf-8?B?YVV2YlhSRDQ5VnRVZkc1ZzdrNnFuMVFKaWdjczZlRDI3RmtlTGY4UHFNaDJO?=
 =?utf-8?B?eE8zLzlsaXVodXo2MlFIdkF5TTA3U3NnYVo1MllRdHFNVUpFYUZlOUZxdTMr?=
 =?utf-8?B?cWJZL3dJT2NTN3lUd1dmYTNJMDg0bmlSeW9hTWZzOVdUS3BLMmZ5ZnRQQTQ0?=
 =?utf-8?B?eFlmVHpOamhnWm5QOGgwV1lsWWp2Y0syQXFJaEdBbGxTVmFXYXc3dUIzd3VF?=
 =?utf-8?B?aG9pOXp1V2hYb1VtS0Y2bUdjS0JhY2t1VzJRNHhHSEw0RFZvRjZSc0oybGd3?=
 =?utf-8?B?Sm5Sb1A4TThidkpqVVM2V0tMR1FrVzZJN1p0NXRSMWx2MDZwclFUT2gwUGJj?=
 =?utf-8?B?c1E3Z0E0N0RtOUlQM0lURjcwK2tvRWtvV2lDWjNLdGhJaEFyTmRVSkxBTXc1?=
 =?utf-8?B?Y0h5ZytKOGZ4OVBXc3JORUVzSEVnRFlHRjk4OHNFOWVvanlzTWh4YlVuN3Zu?=
 =?utf-8?B?QkQ1aXV0Sk5YanFoMTFzVCtHZ3kxQ09GOWhwcGU4N1ZkcU9XVEh0Y0prOFg4?=
 =?utf-8?B?UVo1bU5ETlp2a1JlNVJVcGhnOHl3ZStZUHhiM2hQT2ViMUczdkJJMmhIK0Qr?=
 =?utf-8?B?Z1E5eFF3bHFMQ3pkUWM5NEpOaWhEZk00MksyTmxQRkxVMFVjYVFGM0MyVjRa?=
 =?utf-8?B?VzhEa1orWkhNVVhwY29xeTkwei9OYzEydzl0ZnU5MlVPbng0Q3c1RjNQQkxM?=
 =?utf-8?B?Zmc5emdxcFNWSnptY0N3RFRZR2RzdXhNcmxRaDRwbHpaQkZKdWpIK0ZYTWlD?=
 =?utf-8?B?dkJWYTBaZEhCSk9sQzA0RUpyN0h2d3ZVM0FBZUNEbWl0Ujk0UVg2MS9GWGNT?=
 =?utf-8?Q?xgLx7D8S8pJchMCKL/zBh4JJtJ6hqQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpFMDl4ZjRBNzdqRkN5QTJOWU81NHQvazRlaXdVY0FOWDFZeVNlcGZoZm96?=
 =?utf-8?B?VjlOQkZ2V3czMzFIY3Rldm85SSthWDJDVUtEY0tSeUE2VEYxMlU3bjNwalBX?=
 =?utf-8?B?M2NDZFFTaytZbWlCdkFkRUEvcDU4dmhPQWlpbENZbEFlTGsxTGJ3M3I2ZEdM?=
 =?utf-8?B?UmZOY1kyMTNEcEdGOFhOMTVKVUw5VUpPUWRNMjgvN2JlbGlVZDlNaVRjcm9N?=
 =?utf-8?B?dGxuMDAzcVRRRk9wZnBSOHR2dkhCc3A3M2JWK2FUOCtxS0xGeDFrYnduNFVD?=
 =?utf-8?B?U0pxVE10ZFZGS2xHRkRvK3RKam0rSDI2bGd4dWI5UnphaFFYUEJHbjhwNG5Y?=
 =?utf-8?B?bERpYm1YRU9hMDhLM3JsWTBtaUswOTViTEQ5Mllla3ZvVWwrRjRrcE1HMkhO?=
 =?utf-8?B?WUR3TVFDTmhqcUh3UzcvcHlHS1VQZGpsVkVMRTZjRjIyeGMzUTdZWDAyV1h2?=
 =?utf-8?B?bEhLSWpoR0xFWTBEKzVscitOcTRmK1N0bmNjUllna29UQjNvKzdLdmFFOEhM?=
 =?utf-8?B?cHR0MGc3Tk9WZHBWaVp5VlN0WlpLOXhPb1NSSnFscjAwN0xWMlZuSW14SkhH?=
 =?utf-8?B?eTdnMXlaV2R1RVhsL3BiaWFCaVYrNTcvQllMZ0JSQ3F4MEpvSExLL3NBZGNO?=
 =?utf-8?B?SGhySUNUQ2s1RDZ2c0VRRURaeWY2ZHQ5OCtpM0s3NHFSTC9CdFNZQXIxOHcy?=
 =?utf-8?B?aVJYUnAwRHEwVlpvVWM2Rkd6ZVFWQnRUcnEyWjF0UnR5S2J4Z1RlQU5QT0ZD?=
 =?utf-8?B?SFdYN0dpMHpVcjZGUllBQmpMa3NkTUsxK2NJeEtYUld5dDNRWlNhRTN3aWcw?=
 =?utf-8?B?TjcxTEtCVzdFbmg5RXN0SlY5YWhOSUR6bTFhY1AzcE9xM2JJcHRQUXJhblhw?=
 =?utf-8?B?OEFjM3JqMndyMTQ1KytMdXhSMUFCR3NZZWoyN3FOb2N2MHFYazZSeWZQbFRq?=
 =?utf-8?B?MEF4RGk2MHVDQXRzSTlreUlNazM4bG1wYlNGSENaWUZBS05yUjZFNHBtbU8y?=
 =?utf-8?B?OGMxbm81OVR1dUlVNHFZdVVvaFZNeU5pWFhOQ2FCWXN5VGJNNEJ1cW5RTVZT?=
 =?utf-8?B?ZDkzam40bjlOdUFISzdHTU5PSG5lRDJjQUFtYnU5VS9RemNpY3k0SmpieXNh?=
 =?utf-8?B?bEM0MCt6NDR0VStHTWVoMk9VNjhZOFFhbGQvYU90RXN2SzhldTZyOFVmQ2p6?=
 =?utf-8?B?Y0tuamtGL1lNOE1tUmhvUWswU01za1ltaE5pVWlZY3o2YjNTdnRvZ015bFJv?=
 =?utf-8?B?MzlpZXNLTlpSRmREN05uczFyZDROVFByZDM5cWE4eG9JWFlKQkozcGRDMWpk?=
 =?utf-8?B?TmdRYm04cVk0OEt4TGVsMzR2TkhVRE0xd3M2NzFNWUNJNXBNa0hnSG9Dcmg5?=
 =?utf-8?B?VDJ2Y2ZkVnBTT1A5WWludlY2dHlESlFkdEkyL0tZdURlMkFoWCtubHBSSTQy?=
 =?utf-8?B?MTdMaEU1ZDBQOWhxclhJbExJbHlhaHVZWGJWcW1GYzE1ZG45Z1lCRGp6RFN0?=
 =?utf-8?B?S1Bram1wZkNUQjhGTVN3UlNJeklNRFZ0bUgrWDYwMWVXaUxWMXByMmhhb3pV?=
 =?utf-8?B?V0Y1SWlqUWZIbWE1SFFjaGNlUDhyVWdQOVdYd2U5ZDVJTzIrR0hZS3A4bnFn?=
 =?utf-8?B?ZUU3ZjkwWHB5OFJCUlBucC8xNVVYa0xONlF0bTc5ejU4ekpzYzQralFKZDdt?=
 =?utf-8?B?bW1KQzllR1BsYzkyWWdQeHluQUsvNXp5Z3JGeWYvOUlFSzN0c3lnNEdTOTFo?=
 =?utf-8?B?U29NV0hPTHpnYzFtcHZPZjBrelZsWTdQd2U5TFVqTFBOenhwb1F5WDdwRGJE?=
 =?utf-8?B?aFl2ZXNhQVhRUnJ5Q1AyajdqTzJ6TG9YMk9LS3Zaa1dlTW5xYmlYVUR2N21h?=
 =?utf-8?B?RFpLS24zRTNZdk1GZVNoeGNlMGdvdkxqWGx2VmQrbm1IRVpnUVBXemxjUDVD?=
 =?utf-8?B?WGgxQkdLazRVTGpERVRDYkluRkJDMlEwTkxuUFRDM0VVcURUNWhxeEp0Q0NI?=
 =?utf-8?B?ZGc2OGxYc1pHcVJlZXh2Z2lQVmF3VWtzZUN0U0RiaWpvQ0JiL1hMRC90ZXdw?=
 =?utf-8?B?cWswOWQzZ0xzTnU1Qi9aSkNhUTErdTErTlkyc0E5QWVsRWU5WjFhZ3BtRGtL?=
 =?utf-8?B?OER4ZkV3NlVNU0thUUhJTmxCSitOSm1Qc2lubnVUakdaa2JGR3VuQTFwK0Fw?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4272e6c-9715-4349-7142-08de17f388b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:07.2268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3A5Yc6v+5lS6j85Qo4EVSjC8ONcVF4bMjq4IPxm2h98IY0McTVOuJbwnAw0Ton+m4GdqQhnMGNu9aVkjG2veCLrh5r5i1yiGL2CXDc+H5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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
Remove it from PAUSE state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 39 +------------------
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 -
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 02019b646389c..203ba1fbeefcd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -183,7 +183,6 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
-	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
@@ -453,8 +452,7 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:       PAUSE_GUC_DONE                          o-----restart
  *	:        |                                      :
  *	:        |   o---<--busy                        :
- *	:        v  /         /                         :
- *	:       PAUSE_SAVE_GUC                          :
+ *	:       /                                       :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -474,7 +472,6 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
-		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -505,41 +502,12 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
-static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		pf_enter_vf_state_machine_bug(gt, vfid);
-}
-
-static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	int err;
-
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		return false;
-
-	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
-	if (err) {
-		/* retry if busy */
-		if (err == -EBUSY) {
-			pf_enter_vf_pause_save_guc(gt, vfid);
-			return true;
-		}
-		/* give up on error */
-		if (err == -EIO)
-			pf_enter_vf_mismatch(gt, vfid);
-	}
-
-	pf_enter_vf_pause_completed(gt, vfid);
-	return true;
-}
-
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_save_guc(gt, vfid);
+	pf_enter_vf_pause_completed(gt, vfid);
 	return true;
 }
 
@@ -1942,9 +1910,6 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
-	if (pf_exit_vf_pause_save_guc(gt, vfid))
-		return true;
-
 	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
 		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
 					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index a14c738581ae2..c2ec0403b2be7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -28,7 +28,6 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
- * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
@@ -71,7 +70,6 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
-	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.50.1

