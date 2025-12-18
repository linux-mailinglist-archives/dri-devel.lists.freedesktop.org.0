Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F3CCA149
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 03:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1210E2F9;
	Thu, 18 Dec 2025 02:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAujVM91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A712C10E0EF;
 Thu, 18 Dec 2025 02:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766024964; x=1797560964;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FEFFKzrbTWcIMXg4/oWLWKFfO1wv33d5vqaAHiq8bP4=;
 b=FAujVM91XZnG6Js9ZtTKeYdgO7BqHc8ZeWFfDjDLe+L3qkU5FBOWyq75
 FP7PLui5Mx/tlzQCOI7pVpe2ZgOyjP0CMsJXt4frjqmBRzxXwkDd3Mzxr
 fMowJg99APp0vj7efmAgUQ1qpkIyeDqrUnlwrSUCKh6nAnrIUQUYbw2kx
 4F6+mAVV57urm+wg8a1qiYLjbndbCXDznItYXFcZXUUmC6pEtiD14D+hN
 dtHdXpQpRR5MagVrAXoXip+TTlwf5BtADvfExwFK1ofJ8PUrC5HL73YIf
 98JP/egSkpy/7sSZo05ldwVDdL/BOPg3s2wo22LolFs2pghbh0yrSpRlj Q==;
X-CSE-ConnectionGUID: jqQSSsFaQLiwneEioMfCZQ==
X-CSE-MsgGUID: vIGPy3+kQaC5Tfmp4x0BVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78288905"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="78288905"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 18:29:23 -0800
X-CSE-ConnectionGUID: MD87N1xeTwKbNgHuzOg+Yg==
X-CSE-MsgGUID: oAmoGvnEQseTLt81PcmsHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198706274"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 18:29:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:29:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 18:29:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:29:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbmFHSjaDERQk5hDjraUGaWpepp2mxJO/wY8Y4vmRH5KFsabCqGIo505yv1Cq0WvhvBZb9oNOo3OL8gJPhWrOQaIs89CHpk95fkpQmWm1eL4XnwnPrtE+AIsp9Euv5w0+kfHc56XfH6hS+2G9snG3PDbw7qLMjOD2wxffUOV5y+HoOuGtFosffrpPhs6+cMnGeWUbjczEKeVAi7jXT+C1C//7GPKm2rFQdY6ymLQUBFepGoz39aHYu3xBtC3i4PjETSx/oyK3C1bMImzpAQ5tskb/+00sGGp6fJDqj2UDD1+WQesFakhyP0vx2kNW+iVzDOKmciEwV4ehsumTjpfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUTa+e5eK9OTsX2YbnNxYihzfNTSc7sHZ/6N/TmXt3c=;
 b=eVNKbIlVTJwr9+MH66PD1ZxnR9gPcS8kBs6uwYOI/f9ROvpOp7Vh2UUkBHKekn+DLyFnlRik9md2fF0sQwrNW8hyQNCfCfO3iEk7soeax8uTiqHTX6fXjrVwhoZiw3Rpj8Mdu3nZIrgPHDOxL0d6aF5oLI4vq9ZRWVbi/xBJh4tijQ7iQ3G4UaSgmSfWsRPWEULre6ou7gpFFEEv7dhY6Pauk0+EKV6npRhwcuAvk0lKNZQRn1CtB+bD8fQmL6UEcXYkfsYh5DZaI7xBb/+ClkPy8JaPHLc/3W3rktJkReMlwl9+gXMfOgDu/yl6x1qfGat9bsObU/RRU+OoZdJhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 02:29:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:29:10 +0000
Date: Wed, 17 Dec 2025 18:29:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4 21/22] drm/pagemap, drm/xe: Support destination
 migration over interconnect
Message-ID: <aUNm879rnea1+01Y@lstrano-desk.jf.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-22-thomas.hellstrom@linux.intel.com>
 <aUNW2nLEpgAy6qAt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUNW2nLEpgAy6qAt@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 3876b7cf-0632-491d-c0b9-08de3ddd39ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sms4RmxqWHBxWFd6aDk5VXRTb1NwenYyWXJESVJwV1JYVVFWM01MRXBpS0Fy?=
 =?utf-8?B?WHRrank0ajVzYmdyVFBSaWZYWitzUVBOUjAzRjlCS0wxRmRKVmVHU1E4ckZr?=
 =?utf-8?B?OUxLbVIwekVsaER6bWpsTlRybG9sK0dFSGtRTmNUd1JldHBNQ2pxTm5ySXIw?=
 =?utf-8?B?dnI0WjY2SE9VclF4NUFtQlN2QjlWZDZKVFNnaE9oTWVSOVp5ZEtReEg2bWI5?=
 =?utf-8?B?d1pyc3Jyb1p1eFBnU05td0lKbHR2OUlUTUV2QStpaHNJUHlrU0J2QnJyeTls?=
 =?utf-8?B?RHhvaVdTSjk2WDZGTjRxMUNUdXVaTElFS0lKWnY0SGdXTkxEQ1Q0M0NHWVhn?=
 =?utf-8?B?SGJvdmFDc3hTNXJqYjFUWXhUakVNMnJaZ0F1Q2VsQ1RhZG5qcUxtSm9yUXRE?=
 =?utf-8?B?ZHBGcnBqRWFDYWZLcHZVeDV2Snd6N3hrNjZXbTBSRmxtcDhySGJBa0ZyZENY?=
 =?utf-8?B?STVaMGo4N21CK1pZbmhoQWNUUTVGVUlydXNIT3NGMGpqdTRWWmtUbEc1a0ZY?=
 =?utf-8?B?UjF3UVRkdzNhdzVOVlR3MlZRYkJUMzI1bTRRUkhXZnZFdDJKRVk3YnFhRThQ?=
 =?utf-8?B?NjhpWWpXZ1I1LzQ0NDlhcmNkQ1l4U2xZbVUxbExZcmFLcnkxS09pbzVsUWJF?=
 =?utf-8?B?TERZc1VQZFB3S1JMUkRGU09jZ3owZllpbXd1VGZUaWFTMEpIVFluTDg3SUQ5?=
 =?utf-8?B?eVJEb0M5SkJxdjR2WlRXbWtVRy9ab0xETWczWE1VbjBZMDVwUVVLSVVsYlha?=
 =?utf-8?B?b0tWeEhWZk1MUmxtbVliSjFDeFo2U3lMd0NKQ0dGTWo3U1pJQ3pkUVpYS083?=
 =?utf-8?B?SzZCSFR5VFpFQUdJdnNZU3l1UEZXRE5GcGZXVGU3SUN0SFBWa2VNY3pSNGFt?=
 =?utf-8?B?bVphYXovTWtSbWd5YnFCS05OdEdlcWFYZDlCaGZqRmxYRGZPbEFTeFNmMGF6?=
 =?utf-8?B?YTJNUmhZZVBPRVB6UFAwVlM2SENISmtrQzhRenFJTjlHTlJ6UEhTV2w2UThl?=
 =?utf-8?B?Q3ByK0Qrc2dEODM3M1YweHAxZ0pDWU1vVVpPYzZoYmZrbWNUcFNQOFdMWmQz?=
 =?utf-8?B?NTBjY1lIMlNSQ2lTRUlReWt1L2pYN1UyZG9iNGpHMUhjamFnOXBWeU5vZlpJ?=
 =?utf-8?B?Nkl6Q29TZFY4OGR1SDdScGNjMDRtNGxGNFMzNTlqVGk4T2gvMDZRcVhqQ0ZT?=
 =?utf-8?B?TzhiZWUxUTgzaGRWeUlXaFZ6L2dzeEFaMlYvUTBSL1FWVVBjT25HVmU5WnRW?=
 =?utf-8?B?UDgzdE9QdkE1YlUrRmN2bXJWNzdBTmxDQkpWdWNQeEtCWGNVQTNuNmJRdXJu?=
 =?utf-8?B?NlYxY3JjS3hoUmxORjUreGJwVEtMV0dXcVdiMGZ6NWZPRTJDOVFkeUZ5V2pk?=
 =?utf-8?B?L21iVVphaEQ4aHF0cjIzdDZFMVJwU1E0VHo4Z0pFWlRRK2dmT3JDUDRkMFdy?=
 =?utf-8?B?Vkw0OEliZ0ZUUzBzN3NrNEFQT2xkdm9LaUxyNFl5c0ZucFUxWnlZTjNONXYz?=
 =?utf-8?B?THo2SWVSNjFINjJNWUhlTmFIS01uaU5zQThkMm5xeGUxOGZicE54N0lSL2Vl?=
 =?utf-8?B?L3VvL0ZDWFk3MG1WUUt5aTh0eU1Rc0lxMENOaTlmcXhRSmc3Y0RUd1E5YkZL?=
 =?utf-8?B?WHBsNTN2eE9rUVBEQWNEL29UWXdrQlZtZFhYeHJYVHFLRis2bTI1WTlIM0ZR?=
 =?utf-8?B?OENVdllvaE8zZWxxVGFMQVpSeW9MUnJNTUpVcGRhMllPb05XWVhQc2c1T0VO?=
 =?utf-8?B?K1V5Vm96YnI3dWZTUmFqWVZyYVlMZlEwVHlsUUpFY2RJS2JmRzFiYjk5SSs1?=
 =?utf-8?B?TFFtNzRadWZUNFA3TmtWN2hDdSs4bHFBOFkxK3RqYmdyaUt0NnV4NjFKcWRi?=
 =?utf-8?B?OE9nUFh5QzMxUVVoOXdPeUQyeTZ5cEROdm54VENzNExwakdHdUxLc0g3dUdv?=
 =?utf-8?Q?OIY/3Q8PnyCJAfA7fYwdfYnc5in6Cp5J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkFLLzAxYVFoeDRONTRndWRHVUp3SVNmazhkU2RvN3crMXlFTEtBcVdXTUo4?=
 =?utf-8?B?Z0ZkZnNwMWc2Yi9ZQ2VtZjRkNFRSVThGZHlxRkpWOTBsRTRVUzcwWTBKZk5M?=
 =?utf-8?B?SUFraEpZamV6dUtLZVNBWlhxdmZMdXMxd1plZWZLOFdWU2NaY3RuWlhJakpU?=
 =?utf-8?B?WUdvcllPVUNjUU5BR3VwQm55U2lmNzRvREZGVkxYYW9LUEVUM0JEcXJVekNM?=
 =?utf-8?B?WThvQjRqa2tFbmN4eXlVREs0d1d0SWExRjh6cnVXRG40RndFZWZ4clVMREQy?=
 =?utf-8?B?STdBay81NFVaTThDejhyc0cwOGFjREk0aXExcXFXQk9CcTVIaS9nS1BWT2Vl?=
 =?utf-8?B?S1NEOUk4WGIyRXpubTdWZUNGdTFFdVBObDFFelJQclhRRE82MlVOMmpIbmNn?=
 =?utf-8?B?bGZFZ2dhZTN2M1c2YTBhUURwR21GUXlTT2xFeGwxLzZETERVUXVNMHFDNjA1?=
 =?utf-8?B?T2ZJOXdhWWJHRDhwODg3YlQ1NnZFS1Y2eTN4R2laTVl1dldhTzRCKy9HRWZH?=
 =?utf-8?B?YWxlZUZ1bWtJeG54cE9RSkFjTmFzSzQ1aHFNd3c2NEVueHc1aXErUEZGQkth?=
 =?utf-8?B?eEVpWGQ2ZjAwZDV6Uk1TNEI3TFQ5UldKMHg1STNjejRURStDbFB2elB6SGdU?=
 =?utf-8?B?UXZXS3ZNUnlsTlNSaHBCWUxGaEZTTXBTSkZRVG9oNTBFeDczbURmcnNnU3kz?=
 =?utf-8?B?ajA3TEJCdjVQREVxZXdJSWo4Uy9TYzdNYmVLS20yemtPTWRTRUE4RVE3TndJ?=
 =?utf-8?B?anlmcGwzMXB6WVcrdHZNMnFJS2ErcGQ2MS9Na0lrOHBFejdDNmdhRGpnU2RS?=
 =?utf-8?B?UjVYVktQWkJWSytQQ1djZTd2eURLYWZwbGUzY2hBUjdBaG01Mzd3QTdKNk5L?=
 =?utf-8?B?RXZhUUhpVlgvaDdsUW5RT0k3N2lacnJIUEdDOG9xREVQdTdBRDRMS3kxbyty?=
 =?utf-8?B?L1RvRmZKaUdwVXFYM1FWTXZ6VmtjN2JhNTE5WXdydkRpNlBNNy9Bb1ZDMVN2?=
 =?utf-8?B?Zllhc2hiZHRPalBBdTcwb0I0UXZ4Rld2cjJSUGoyUkZWQlRVdktBV0NVbVFI?=
 =?utf-8?B?ZGpIdVFjZGw5RHNNMmczbnpTZVprMldKS0dzeFlzYzJmVVdYaVVTaXlRbjJq?=
 =?utf-8?B?cUJzV1pkamZXU3gyQjBLemdvNDkyN09rOUY3cXoyS1VFazEvWXhJandFd05W?=
 =?utf-8?B?YVkyQ2h3Z2UwcFdqQ2krSXM3OEVzUGFpUXVGL0xEaFlQWEJLeG9lZnQ2d2hB?=
 =?utf-8?B?dWxZN05SN1Y5T1U2UGl2ZHNXVGVMNFJicXFBRFlpMzBpMUpLaFVac1E5REJ2?=
 =?utf-8?B?R3lCLzRocVRlaFp2TnFFSWtpQnYwYk9KR0h1Mmcwc2t6QWx2TzNtK0pQQnBP?=
 =?utf-8?B?cnByT3lPYUR3TVNlRG0veGVvVDM4cjFnaE40TXlETEIzd3ptb2prcDk2Z2xi?=
 =?utf-8?B?QUxsRjlDUU52VlF0N1ZicTNVNUk2REVBdHJyOEZRR0VNWjhMYW5XUGFJelBx?=
 =?utf-8?B?OW41cnRob1RSNHU3RzRYeHFPSjg2aXB0RjB6VGtmZENLWWYyNnIzK3JUMmUw?=
 =?utf-8?B?R2lKbnZyalFxOVQzVDlwQytqUE02dURWNWtzYUZ5bnovSVAvUytjaGgvNVdk?=
 =?utf-8?B?b05rZmFDYndITnBiMURlM2JUTGVIcmRsZmxYMmhQTVhrMUF1WDA1SXE1eUtL?=
 =?utf-8?B?YXZKY1dCeVgrTmxWQzRkUDVJaGlmS2s3Qkh1cDR6dnV3ZGRVZDZkZEFzRkx4?=
 =?utf-8?B?RnhQbk4yaklyWTZxczdTUlo1djJlVzlOTVRlV3dOTjdwallaNVVqK2FGYS9m?=
 =?utf-8?B?eXRVeHZBOWJQcWxIcFlxbTN3NHhTbHZPN0VIUnpDMnJCaHBrMXVyaWg4WmhB?=
 =?utf-8?B?UFdEQjFzRkZaSzJMVDkzWlphck82UWl0Wk5mcEhhWjVJbENUVGkrWkdVSTVM?=
 =?utf-8?B?b2RCenNwNXB3Nk43OEJQVGNQdUI2SCsySWNPSEVaT0d2ODhZYlpKemJMeUNs?=
 =?utf-8?B?d01qYW5sTVpJdjl5UjZNZ3BaOGticWZvTFpBYU00RUoyWEc2d0t6NE5mQ0cv?=
 =?utf-8?B?blllOUdFZ0VncXlkeDhjejhKcC85T2oyc0g2bnFsN3o1bDFla0pFL2x5TlM1?=
 =?utf-8?B?MHJqZjZISTIvcXd5N1JlNmx4bzRMbjlHNjVWUlBMaC9sVjhvSElHc2Y1aUdW?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3876b7cf-0632-491d-c0b9-08de3ddd39ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:29:10.0643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+7cRlJyIIO4jxk7LbGy7vLArkCUL/7KRT2brLusJRFDinsjUr3GXM0pFliqu1ygHvW4Fe1/VXbUATVgPhz5fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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

On Wed, Dec 17, 2025 at 05:20:26PM -0800, Matthew Brost wrote:

One more idea.

> On Thu, Dec 11, 2025 at 05:59:08PM +0100, Thomas Hellström wrote:
> > Support destination migration over interconnect when migrating from
> > device-private pages with the same dev_pagemap owner.
> > 
> > Since we now also collect device-private pages to migrate,
> > also abort migration if the range to migrate is already
> > fully populated with pages from the desired pagemap.
> > 
> > Finally return -EBUSY from drm_pagemap_populate_mm()
> > if the migration can't be completed without first migrating all
> > pages in the range to system. It is expected that the caller
> > will perform that before retrying the call to
> > drm_pagemap_populate_mm().
> > 
> > Assume for now that the drm_pagemap implementation is *not*
> > capable of migrating data within the pagemap itself. This
> > restriction will be configurable in upcoming patches.
> > 
> > v3:
> > - Fix a bug where the p2p dma-address was never used.
> > - Postpone enabling destination interconnect migration,
> >   since xe devices require source interconnect migration to
> >   ensure the source L2 cache is flushed at migration time.
> > - Update the drm_pagemap_migrate_to_devmem() interface to
> >   pass migration details.
> > v4:
> > - Define XE_INTERCONNECT_P2P unconditionally (CI)
> > - Include a missing header (CI)
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c   | 188 +++++++++++++++++++++++---------
> >  drivers/gpu/drm/xe/xe_migrate.c |   4 +-
> >  drivers/gpu/drm/xe/xe_svm.c     |  26 +++--
> >  drivers/gpu/drm/xe/xe_svm.h     |   1 +
> >  include/drm/drm_pagemap.h       |  19 +++-
> >  5 files changed, 179 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 77f8ea5ed802..56bedb622264 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -206,10 +206,12 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> >  /**
> >   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
> >   * @dev: The device for which the pages are being mapped
> > + * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
> >   * @pagemap_addr: Array to store DMA information corresponding to mapped pages
> >   * @migrate_pfn: Array of migrate page frame numbers to map
> >   * @npages: Number of pages to map
> >   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + * @mdetails: Details governing the migration behaviour.
> >   *
> >   * This function maps pages of memory for migration usage in GPU SVM. It
> >   * iterates over each page frame number provided in @migrate_pfn, maps the
> > @@ -219,12 +221,15 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> >   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
> >   */
> >  static int drm_pagemap_migrate_map_pages(struct device *dev,
> > +					 struct drm_pagemap *local_dpagemap,
> >  					 struct drm_pagemap_addr *pagemap_addr,
> >  					 unsigned long *migrate_pfn,
> >  					 unsigned long npages,
> > -					 enum dma_data_direction dir)
> > +					 enum dma_data_direction dir,
> > +					 const struct drm_pagemap_migrate_details *mdetails)
> >  {
> >  	unsigned long i;
> > +	unsigned long num_peer_pages = 0;
> >  
> >  	for (i = 0; i < npages;) {
> >  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > @@ -235,31 +240,50 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
> >  		if (!page)
> >  			goto next;
> >  
> > -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > -			return -EFAULT;
> > -
> >  		folio = page_folio(page);
> >  		order = folio_order(folio);
> >  
> > -		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> > -		if (dma_mapping_error(dev, dma_addr))
> > -			return -EFAULT;
> > +		if (is_device_private_page(page)) {
> > +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> > +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> > +			struct drm_pagemap_addr addr;
> > +
> > +			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
> > +				goto next;
> >  
> > -		pagemap_addr[i] =
> > -			drm_pagemap_addr_encode(dma_addr,
> > -						DRM_INTERCONNECT_SYSTEM,
> > -						order, dir);
> > +			num_peer_pages += NR_PAGES(order);
> > +			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
> > +			if (dma_mapping_error(dev, addr.addr))
> > +				return -EFAULT;
> > +
> > +			pagemap_addr[i] = addr;
> > +		} else {
> > +			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> > +			if (dma_mapping_error(dev, dma_addr))
> > +				return -EFAULT;
> > +
> > +			pagemap_addr[i] =
> > +				drm_pagemap_addr_encode(dma_addr,
> > +							DRM_INTERCONNECT_SYSTEM,
> > +							order, dir);
> > +		}
> >  
> >  next:
> >  		i += NR_PAGES(order);
> >  	}
> >  
> > +	if (num_peer_pages)
> > +		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
> > +			num_peer_pages);
> > +
> >  	return 0;
> >  }
> >  
> >  /**
> >   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> >   * @dev: The device for which the pages were mapped
> > + * @migrate_pfn: Array of migrate pfns set up for the mapped pages. Used to
> > + * determine the drm_pagemap of a peer device private page.
> >   * @pagemap_addr: Array of DMA information corresponding to mapped pages
> >   * @npages: Number of pages to unmap
> >   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > @@ -270,16 +294,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
> >   */
> >  static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> >  					    struct drm_pagemap_addr *pagemap_addr,
> > +					    unsigned long *migrate_pfn,
> >  					    unsigned long npages,
> >  					    enum dma_data_direction dir)
> >  {
> >  	unsigned long i;
> >  
> >  	for (i = 0; i < npages;) {
> > -		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
> > +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > +
> > +		if (!page || !pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
> >  			goto next;
> >  
> > -		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
> > +		if (is_zone_device_page(page)) {
> > +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> > +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> > +
> > +			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
> > +		} else {
> > +			dma_unmap_page(dev, pagemap_addr[i].addr,
> > +				       PAGE_SIZE << pagemap_addr[i].order, dir);
> > +		}
> >  
> >  next:
> >  		i += NR_PAGES(pagemap_addr[i].order);
> > @@ -301,8 +336,7 @@ npages_in_range(unsigned long start, unsigned long end)
> >   * @mm: Pointer to the struct mm_struct.
> >   * @start: Start of the virtual address range to migrate.
> >   * @end: End of the virtual address range to migrate.
> > - * @timeslice_ms: The time requested for the migrated pagemap pages to
> > - * be present in @mm before being allowed to be migrated back.
> > + * @mdetails: Details to govern the migration.
> >   *
> >   * This function migrates the specified virtual address range to device memory.
> >   * It performs the necessary setup and invokes the driver-specific operations for
> > @@ -320,7 +354,7 @@ npages_in_range(unsigned long start, unsigned long end)
> 
> Update kernel doc to indicate devmem_allocation is consumed on failure?
> 
> >  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  				  struct mm_struct *mm,
> >  				  unsigned long start, unsigned long end,
> > -				  unsigned long timeslice_ms)
> > +				  const struct drm_pagemap_migrate_details *mdetails)
> >  {
> >  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> >  	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
> > @@ -329,9 +363,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  		.start		= start,
> >  		.end		= end,
> >  		.pgmap_owner	= pagemap->owner,
> > -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> > +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> > +		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
> >  	};
> >  	unsigned long i, npages = npages_in_range(start, end);
> > +	unsigned long own_pages = 0, migrated_pages = 0;
> >  	struct vm_area_struct *vas;
> >  	struct drm_pagemap_zdd *zdd = NULL;
> >  	struct page **pages;
> > @@ -373,8 +409,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  	zdd = drm_pagemap_zdd_alloc(dpagemap);
> >  	if (!zdd) {
> >  		err = -ENOMEM;
> > -		goto err_free;
> > +		kvfree(buf);
> > +		goto err_out;
> >  	}
> > +	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> >  
> >  	migrate.vma = vas;
> >  	migrate.src = buf;
> > @@ -385,55 +423,111 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  		goto err_free;
> >  
> >  	if (!migrate.cpages) {
> > -		err = -EFAULT;
> > +		/* No pages to migrate. Raced or unknown device pages. */
> > +		err = -EBUSY;
> >  		goto err_free;
> >  	}
> >  
> >  	if (migrate.cpages != npages) {
> > +		/*
> > +		 * Some pages to migrate. But we want to migrate all or
> > +		 * nothing. Raced or unknown device pages.
> > +		 */
> 
> I honestly think this is going to be an issue. Let's say two devices
> fault at the same time and both try to migrate simultaneously—neither
> side is likely to make forward progress, resulting in the migration
> failing even with a retry loop at the caller.
> 
> How about a Xe module-wide migration rwsem? The first call to
> drm_pagemap_populate_mm would take it in read mode, and subsequent
> attempts would take it in write mode. We can't control CPU-side races
> here, but we do have some level of GPU-side control via a lock like the
> one I suggested.
> 
> The other alternative is to restructure our GPU SVM range tree into a
> process-wide structure (rather than per-device VM), which locks the
> range when servicing a fault and supports multiple sets of pages
> attached to the range. This is pretty large work though, so I'd lean
> towards some Xe driver side locking first.
> 

Another possible option is pass a flag from drm_pagemap_populate_mm
which makes it to xe_drm_pagemap_populate_mm and we take the validation
guard in exclusive. This won't help say if two devices both take atomics
faults though and are trying to migrate to different pagemaps.

Matt 

> >  		err = -EBUSY;
> > -		goto err_finalize;
> > +		goto err_aborted_migration;
> > +	}
> > +
> > +	/* Count device-private pages to migrate */
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> > +
> > +		if (src_page && is_zone_device_page(src_page)) {
> > +			if (page_pgmap(src_page) == pagemap)
> > +				own_pages++;
> > +		}
> 
> In an effort to make the 2M transition easier, can this loop increment i
> and own-pages based on the folio order?
> 
> > +	}
> > +
> > +	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
> > +		npages, own_pages);
> > +	if (own_pages == npages) {
> > +		err = 0;
> > +		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
> > +		goto err_aborted_migration;
> > +	} else if (own_pages && mdetails->can_migrate_same_pagemap) {
> > +		err = -EBUSY;
> > +		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
> > +		goto err_aborted_migration;
> >  	}
> >  
> >  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> > -					    migrate.src, npages, DMA_TO_DEVICE);
> > +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> > +					    devmem_allocation->dpagemap, pagemap_addr,
> > +					    migrate.src, npages, DMA_TO_DEVICE,
> > +					    mdetails);
> > +
> > +	if (err) {
> > +		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> > +						migrate.src, npages, DMA_TO_DEVICE);
> >  
> > -	if (err)
> >  		goto err_finalize;
> > +	}
> >  
> > +	own_pages = 0;
> >  	for (i = 0; i < npages; ++i) {
> >  		struct page *page = pfn_to_page(migrate.dst[i]);
> > -
> > +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> > +
> > +		if (unlikely(src_page && is_zone_device_page(src_page) &&
> > +			     page_pgmap(src_page) == pagemap &&
> > +			     !mdetails->can_migrate_same_pagemap)) {
> > +			migrate.dst[i] = 0;
> > +			pages[i] = NULL;
> > +			own_pages++;
> > +			continue;
> > +		}
> 
> Same as above, I think logic should be based on folio order?
> 
> >  		pages[i] = page;
> >  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> >  		drm_pagemap_get_devmem_page(page, zdd);
> >  	}
> > +	drm_WARN_ON(dpagemap->drm, !!own_pages);
> >  
> >  	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> >  				  devmem_allocation->pre_migrate_fence);
> > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> > +					migrate.src, npages, DMA_TO_DEVICE);
> >  	if (err)
> >  		goto err_finalize;
> >  
> >  	/* Upon success bind devmem allocation to range and zdd */
> >  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> > -		msecs_to_jiffies(timeslice_ms);
> > -	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> > +		msecs_to_jiffies(mdetails->timeslice_ms);
> >  
> >  err_finalize:
> >  	if (err)
> >  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> > +err_aborted_migration:
> >  	migrate_vma_pages(&migrate);
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
> > +			migrated_pages++;
> 
> Again based on folio order?
> 
> > +
> > +	if (!err && migrated_pages < npages - own_pages) {
> > +		drm_dbg(dpagemap->drm, "Raced while finalizing migration.\n");
> > +		err = -EBUSY;
> > +	}
> > +
> >  	migrate_vma_finalize(&migrate);
> > -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> > -					DMA_TO_DEVICE);
> >  err_free:
> > -	if (zdd)
> > -		drm_pagemap_zdd_put(zdd);
> > +	drm_pagemap_zdd_put(zdd);
> >  	kvfree(buf);
> > +	return err;
> > +
> >  err_out:
> > +	devmem_allocation->ops->devmem_release(devmem_allocation);
> >  	return err;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> > @@ -706,6 +800,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
> >  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> >  {
> >  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> > +	struct drm_pagemap_migrate_details mdetails = {};
> >  	unsigned long npages, mpages = 0;
> >  	struct page **pages;
> >  	unsigned long *src, *dst;
> > @@ -744,8 +839,10 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> >  	if (err || !mpages)
> >  		goto err_finalize;
> >  
> > -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> > -					    dst, npages, DMA_FROM_DEVICE);
> > +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> > +					    devmem_allocation->dpagemap, pagemap_addr,
> > +					    dst, npages, DMA_FROM_DEVICE,
> > +					    &mdetails);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > @@ -761,8 +858,9 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> >  		drm_pagemap_migration_unlock_put_pages(npages, dst);
> >  	migrate_device_pages(src, dst, npages);
> >  	migrate_device_finalize(src, dst, npages);
> > -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
> >  					DMA_FROM_DEVICE);
> > +
> >  err_free:
> >  	kvfree(buf);
> >  err_out:
> > @@ -805,6 +903,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> >  		.fault_page	= page,
> >  	};
> > +	struct drm_pagemap_migrate_details mdetails = {};
> >  	struct drm_pagemap_zdd *zdd;
> >  	const struct drm_pagemap_devmem_ops *ops;
> >  	struct device *dev = NULL;
> > @@ -853,19 +952,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  	if (!migrate.cpages)
> >  		goto err_free;
> >  
> > -	if (!page) {
> > -		for (i = 0; i < npages; ++i) {
> > -			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> > -				continue;
> > -
> > -			page = migrate_pfn_to_page(migrate.src[i]);
> > -			break;
> > -		}
> > -
> > -		if (!page)
> > -			goto err_finalize;
> > -	}
> > -	zdd = page->zone_device_data;
> 
> This isn't actually related to this patch but agree this is some
> leftover dead code. You break this out into its own patch.
> 
> >  	ops = zdd->devmem_allocation->ops;
> >  	dev = zdd->devmem_allocation->dev;
> >  
> > @@ -875,8 +961,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  	if (err)
> >  		goto err_finalize;
> >  
> > -	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
> > -					    DMA_FROM_DEVICE);
> > +	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
> > +					    DMA_FROM_DEVICE, &mdetails);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > @@ -893,8 +979,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  	migrate_vma_pages(&migrate);
> >  	migrate_vma_finalize(&migrate);
> >  	if (dev)
> > -		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
> > -						DMA_FROM_DEVICE);
> > +		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
> > +						npages, DMA_FROM_DEVICE);
> >  err_free:
> >  	kvfree(buf);
> >  err_out:
> > @@ -930,9 +1016,11 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> >  	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> >  	int err;
> >  
> > +	drm_pagemap_zdd_get(zdd);
> 
> Can you explain the extra ref here? The page itself should have a ref
> owned by the drm_pagemap_migrate_to_ram caller, right?
> 
> >  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> >  					   vmf->page, vmf->address,
> >  					   zdd->devmem_allocation->size);
> > +	drm_pagemap_zdd_put(zdd);
> >  
> >  	return err ? VM_FAULT_SIGBUS : 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index f3b66b55acfb..4edb41548000 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -35,6 +35,7 @@
> >  #include "xe_sa.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_sriov_vf_ccs.h"
> > +#include "xe_svm.h"
> >  #include "xe_sync.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_validation.h"
> > @@ -2048,7 +2049,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
> >  			u64 pte;
> >  
> >  			xe_tile_assert(m->tile, sram_addr[i].proto ==
> > -				       DRM_INTERCONNECT_SYSTEM);
> > +				       DRM_INTERCONNECT_SYSTEM ||
> > +				       sram_addr[i].proto == XE_INTERCONNECT_P2P);
> >  			xe_tile_assert(m->tile, addr);
> >  			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 22281d69e26a..03cc4a24ce27 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1058,6 +1058,10 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> >  				      unsigned long timeslice_ms)
> >  {
> >  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> > +	struct drm_pagemap_migrate_details mdetails = {
> > +		.timeslice_ms = timeslice_ms,
> > +		.source_peer_migrates = 1,
> > +	};
> >  	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
> >  	struct dma_fence *pre_migrate_fence = NULL;
> >  	struct xe_device *xe = vr->xe;
> > @@ -1109,10 +1113,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> >  
> >  		/* Ensure the device has a pm ref while there are device pages active. */
> >  		xe_pm_runtime_get_noresume(xe);
> > +		/* Consumes the devmem allocation ref. */
> >  		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> > -						    start, end, timeslice_ms);
> > -		if (err)
> > -			xe_svm_devmem_release(&bo->devmem_allocation);
> > +						    start, end, &mdetails);
> >  		xe_bo_unlock(bo);
> >  		xe_bo_put(bo);
> >  	}
> > @@ -1628,6 +1631,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
> >  	struct xe_vm *vm = range_to_vm(&range->base);
> >  	enum drm_gpusvm_scan_result migration_state;
> >  	struct xe_device *xe = vm->xe;
> > +	int err, retries = 1;
> >  
> >  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
> >  	range_debug(range, "ALLOCATE VRAM");
> > @@ -1646,10 +1650,18 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
> >  		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
> >  			dpagemap->drm->unique);
> >  
> > -	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> > -				       xe_svm_range_end(range),
> > -				       range->base.gpusvm->mm,
> > -				       ctx->timeslice_ms);
> > +	do {
> > +		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> > +					      xe_svm_range_end(range),
> > +					      range->base.gpusvm->mm,
> > +					      ctx->timeslice_ms);
> > +
> > +		if (err == -EBUSY && retries)
> > +			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
> 
> With the above commit, here is where I think we need a module migration
> rwsem.
> 
> > +
> > +	} while (err == -EBUSY && retries--);
> > +
> > +	return err;
> >  }
> >  
> >  static struct drm_pagemap_addr
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 50e80bc892b6..b7b8eeacf196 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -205,6 +205,7 @@ struct xe_tile;
> >  struct xe_vram_region;
> >  
> >  #define XE_INTERCONNECT_VRAM 1
> > +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
> >  
> >  struct xe_svm_range {
> >  	struct {
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index f73afece42ba..46e9c58f09e0 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -317,10 +317,27 @@ struct drm_pagemap_devmem {
> >  	struct dma_fence *pre_migrate_fence;
> >  };
> >  
> > +/**
> > + * struct drm_pagemap_migrate_details - Details to govern migration.
> > + * @timeslice_ms: The time requested for the migrated pagemap pages to
> > + * be present in @mm before being allowed to be migrated back.
> > + * @can_migrate_same_pagemap: Whether the copy function as indicated by
> > + * the @source_peer_migrates flag, can migrate device pages within a
> > + * single drm_pagemap.
> 
> This is essentially saying 'my copy function is smart enough to skip
> pages in the correct placement' or is saying 'my copy function can copy
> pages from one position on my device to another'?
> 
> I want to make sure I'm getting this right.
> 
> Matt
> 
> > + * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
> > + * should use the copy_to_ram() callback rather than the destination
> > + * drm_pagemap should use the copy_to_devmem() callback.
> > + */
> > +struct drm_pagemap_migrate_details {
> > +	unsigned long timeslice_ms;
> > +	u32 can_migrate_same_pagemap : 1;
> > +	u32 source_peer_migrates : 1;
> > +};
> > +
> >  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  				  struct mm_struct *mm,
> >  				  unsigned long start, unsigned long end,
> > -				  unsigned long timeslice_ms);
> > +				  const struct drm_pagemap_migrate_details *mdetails);
> >  
> >  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
> >  
> > -- 
> > 2.51.1
> > 
