Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BBC7D534
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 19:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86610E052;
	Sat, 22 Nov 2025 18:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZK3RvkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EB410E04F;
 Sat, 22 Nov 2025 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763835030; x=1795371030;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TRqLAQznrwEpcKj+qy1xXMQwNEJeIPdkotviO+oORAo=;
 b=bZK3RvkBwnX2e1bGLrEjH6/HPDgWa/TrH1k1oUriYLgk0JkLyu4J7Mbk
 FkMx9PSjOohkbYFfLJgnpTrkRAAU+sgMpmrCNl0gJbKJBBxk+A3Pp5X4s
 /lHeWoA8sZMuiUir4XTcwWxWOXE/jIYU9SZG64KXemDSYaNYmhnpNwEEr
 ImnDM915swOzrqVLW9OdkHWCSShJRlzZtD6c6OiUaTi+0EGm0VjLhqRIX
 ABvs7JlB9ppqgoNtxPtCwj+x53xYMQBeJ0PLeEcn6qgVFkevgOhKqzWJt
 cWKLa0CyTuPcBkcahflEesuztZ6v45hvvsStgittTfZhk2TxtWs1xN9Do A==;
X-CSE-ConnectionGUID: JFAAFD1lS4Gg+gh1LxG4Zw==
X-CSE-MsgGUID: R1alCQ1eRIGWj6tofTwTHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65086827"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="65086827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:10:30 -0800
X-CSE-ConnectionGUID: RsWSzJ4yS+qf2272zjFDHw==
X-CSE-MsgGUID: /Wu6fThKRsutaUa12lg7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="191248496"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:10:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:10:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:10:28 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:10:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHX2AsFNC5jBSaMhrkbf/B+y9xjpPJ0urG4U9TZY6kkDBz44WjSUbrdla+cdwJuBjLzurIQO6JhEFWrqrrwmKP0Z3+2Esq7ZWohBaKa4a1xfGj+Pk8ah0d2KkSFx2EZ6zqzBkQ1crMo8qWFjp/oe/JxRJ3+TU0HuaCn1gkcsV5HAock/fdU4u2f7mvLA/R33jY4Anue13l7kepD4T9wIIT9Tr0bu4pJA7rLppBufZxdDYzPaju9676xFGWeTfFILIu+iRVQyBCAyc0eKzoGfdjAeKrK6OczZ558XxuI7gS409o25osftBjxks19YUVNCwhtKsd0KgTld3xkjMWOEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPDpNT23I42ahBFupxXfAkQZfylXOJVP5rvwL01Od8A=;
 b=C7/cv5GEhXgBWlA8++PXq0IdiDkNsPyC6TIWXU8TLHG++20lvvRU0o5o8S1Ec7FtCOag5cZ3zcAud+qCROtFuQn1bWjgwbyWcwTuVFo3M4gfUJT9UCyZQWIMOSeDneONLMnZDBQMSKPBm+Q61nYoAb6xOX345dyt8jRXHdbzbiXdm/izojd9oo8yIh59vmhfkGmc+id32NwHahCEGqdYeEVSuRTzaAE/ABEbE10TPRaaK7IXoW4KvbDwZfY0aG1tS9ilLJxP9HbO4v+tm6hcA3n4PfcnxtZFBDfBmEKr9lkmpywiyO83spciXmZDz8EVJeLMx7zEj+91EVyJdueVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 18:10:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:10:20 +0000
Message-ID: <ced3b341-cecc-45e6-bed1-04f5dfdc93d8@intel.com>
Date: Sat, 22 Nov 2025 19:10:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/28] drm/xe/pf: Enable SR-IOV VF migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-25-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251111010439.347045-25-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0310.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: ee94a2b4-adcd-4b1e-bb21-08de29f265a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitCUjlsRTlSN3BkMzk2OXdEcWNhZlR0V3lWeTZNOGRLVEVYRXJTbHh3QVhB?=
 =?utf-8?B?RFQ5WkdyQmxSQk14amozWVNqSis2VFVvYlR1Y09CcDUzV1EyeVZJenlMTDI0?=
 =?utf-8?B?S2tMckV4WFdrWldqazFiU3BQNXYvbXlURkNhL01BcC9sOGd3bzBNSEpodzdr?=
 =?utf-8?B?aXQ0L3BjcmdLNzZPZHdUWTNGTmxyQk1HWGs3QXJudE1BbkR1dlRUdkpOb3kw?=
 =?utf-8?B?WW1qUnF1bUJSU0NLSzZ6VVFKTGgwSyt4TmRaNHlPVWxCTlh0TzU4SHJwdExv?=
 =?utf-8?B?Nkc0aVdRWk5uQ0tBL1pGdHZvN1Q1MGRvMUEvYWd1Mm1HT1ArNlZkZ21YVVVl?=
 =?utf-8?B?a0ZZa2V2NXpWMmxBSGtyaDI2dGF1cm9XT2xUeVZKbmpCSnJvMjhvZjRoSlRr?=
 =?utf-8?B?QjVseUlBMDN5emlJNnBoaVBlY0Q0ZWhsaEVadUsveFN5dzRqdFBndmV4cUYr?=
 =?utf-8?B?d05xaW9odlc4VUZZSVNhcTBqSUxac3AycXI4Rm1MaHBsSzcrSXkzN1ZzVEJI?=
 =?utf-8?B?L3NUeFR6TXV0VkR1UVU1Zldtbkk4QlhmN20yeVlGVWF3MTRSWHlMa2lQLzBC?=
 =?utf-8?B?ZlN0ODN2MDBMTG1BSmRuTXlzYWgxeDlWdW9UVDFjN2tNckwxYjZrcmJlS3gz?=
 =?utf-8?B?UDB0VGRFYzNkSDhjZEhpZnRyTlVtbUZVL0J4aEE0VlR0L3ZSYXZXY0NPdDBz?=
 =?utf-8?B?c1BOdmFlQnhqYkgyWFlURFdXZ25jbzdjV3lLZHhuYlpIZHhncEZnb1U0Wmhy?=
 =?utf-8?B?a2RQb05LMXFJYisyRGZmeVN1cGRzT3JXYzhXZGtvelZsakZJUEdBc2dNNUJp?=
 =?utf-8?B?YnpBRE5jQTFEcmhwZ3FoS3N6M3I1alBQS0d0MUZVTDdta0FZV3Y4eGNUektp?=
 =?utf-8?B?WDB5eVFXaGlSRjhOZUVKRDcvc21hY1dESkZKanNZdnpVSFdKdVhuV3FuTy91?=
 =?utf-8?B?WHJYNFRVVWpNRVEvY0NGcXpsYXZ1eFRwajJDbEdNTzZKcXVaR2Y3eWpQNkxH?=
 =?utf-8?B?eDNnTXBMZktpT25mSHlXTG56TEdBN3pGbnV2OTYxMFdxVXJacXJlaSs4VmhE?=
 =?utf-8?B?bHhjTXhHdkxFdWRkOE94QmN0Q0YrWVhvSlpIU1BmbHdvL2szQy9zR2NuZklr?=
 =?utf-8?B?QjRUdVRFOHg5L3Q5TkJUdmdZSDd0ZDA0M3RFZDFIYVYyZGZlTjJWR0xxVjlB?=
 =?utf-8?B?azhydFplQUQ2MDRHS1IzUnA0TG5BaDhLOStRMldDVGpRY0tWZjZtVytKUUs3?=
 =?utf-8?B?YWh5ei9QMWVsbWE0aG55NUJCSnI0d04waDN3V3BKQyt2eC9zTFU5VGxOU2J6?=
 =?utf-8?B?RHZjYk8rbTlsMDJzMHMrOGF1M2RQV0ozYXdXWHdxZkgwRWRKNENFbVQ5cHVi?=
 =?utf-8?B?ZjBudEdLVW9HSXZRYmVNbU1BSERSdUthZ0VKMVgwNXBPbUdqdytPTU9TR0ZM?=
 =?utf-8?B?Y1dyb1Yxclc4TStqaEoxRlR0ejAvdmo1OVdjSitKR3lzZGtkeU90OXlhVUVI?=
 =?utf-8?B?MXdXK2RCckpST2RMVEthUDFtYmhzVVlUMTVZMndaY3dyY1RvV2VWQS9wajB4?=
 =?utf-8?B?RTdvNUlJMFJYMFFhQXFhbmNmUUh6VDNkQ3ZZZHQwQ3E3NEYxUnNyYnVpTE5z?=
 =?utf-8?B?NkxwSjVxSVh3K0U3aGJRR2N4UUNTSGpBdGhJbWRSejF0UC8wRnVIeSs4dXUw?=
 =?utf-8?B?YlBwaXRrdjVYUzFtV3RUWkhjYVdrZUxUTXFQMWthbk14QzFmSlZvS0xwc0d1?=
 =?utf-8?B?bkYzZ2JLY2FCdTNiZmYwRVUyYTFXL3c5VUlhTlByclZaYmM3VmQ0VW1VdDFr?=
 =?utf-8?B?L2t6dnBpNCtOQW1KNVRPR3p6QlB6YzU4TUFxRVN6MzdkeldCbElSYmYwQjJD?=
 =?utf-8?B?UUU1ZXA3L3RMQk1Sd1c4c2NDeUdReHVtblpBODRWU2lZZDczY1ltbU1naHp3?=
 =?utf-8?B?UzdmQ1hGOHdNSU1iUWpCclpUcmV3NmNJWlNQM0doM1RrZjVqeXJBVGZWelJr?=
 =?utf-8?Q?HK86RyNI4xDL/ExaORKiBHjwL9YBxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFRWk1hYUVXcWdnYmhpdWprOTVNcDN4VWVlQXUyMGpoZG1OUjFYTCtuVkVm?=
 =?utf-8?B?dmk5Y2dpN3R6SzcrY0FXVU5KclIycnpsMUtJZkdERkJ1MUlkZXZ2b2RVOUhM?=
 =?utf-8?B?SnAxZmZmMUVVVHo5eWdzSjd3UnVmQW1KejlBOGYvR0xwTGphN0oxQ3ZMOFNY?=
 =?utf-8?B?VzN1TldHZE14SmN1Vi9UOTlGeG91dVIzalBJZ2xhVFBBVkhuZDBRUElKSExm?=
 =?utf-8?B?R0JiYWZnazFabFF2aTNWWnVIcWRaZzZPcEhYMjExNzJaSjZpL2VlYUxWMlQ5?=
 =?utf-8?B?RnJhblBFOUNCRm9UdjBpYU1OcXRRQWhvT3M5THVwVDNsVU9LbDkzNnFMV3p4?=
 =?utf-8?B?MlpMZkJBMENPbHVKMjVkNUJsR240TlhkYk9rRy80Z3Z0eENrUDBmcG1aWG0z?=
 =?utf-8?B?cHltMEF3b2htUEdqYXdHby9talRuNFVFakNCUkU1cE4raWtrMUdTK1Jza1BM?=
 =?utf-8?B?aC9OTXczeFFTOUZEVFAzenZPRDhHVVlidWpDUE1IdVkrbE1NNjh6Yyt2NHJN?=
 =?utf-8?B?d3d6ZWZVc21wRXduQ3dJMUFqVVVwMC9RaE9FNmRUcklBTHBLNmI2SURuLzBv?=
 =?utf-8?B?cEdUczhYMm5GZzhhbnF6ZnB5ekJLd1F4UDRka2d6MTdmTlhJZ1lMU2FEaUNh?=
 =?utf-8?B?M3VrY2hCNDFhbFBJZVA2ZjJlRmVza05UdHN3NUVtcnJXRzFwaXpRRHlERFo1?=
 =?utf-8?B?bDZjMUcrT2JuNnlucm96SUZJTUNmWksrRGdvclNQSU5MOTBMTWlCKzJDcEJZ?=
 =?utf-8?B?RU5MeWliVnBxcnhCMlBKbjFzZ2pTSER5Z2h0eU1VbWpDRlJoQ0tsUkRuWkpQ?=
 =?utf-8?B?YmpNZUJVYWJHNHRCbXFHQlh6RTFYUUNrTmpnR3NFQW9LaUx6Y1NwWlcvc0li?=
 =?utf-8?B?TDVUQkF0bm5HL3RXS3hlbnBKb21La2NEQzdqWjlJano2dGdCYWJDNVI3Y3I2?=
 =?utf-8?B?UHpxRTZSQUFTZGhCbFdOUlFBOEtNaUdRcVlCTm1TTWR3ZnErN0gxV012Nkhp?=
 =?utf-8?B?bEovdUkxVnVMMmdDODAxRmdEUTBXdHZQc2tZTmVnWUw1N2ZsUUhGUjdNTldr?=
 =?utf-8?B?UW1RbmVxaWxyaVVtUWI0NUt3YnlDMVkrNUpUS3FONUFKaVZjOU1MUm1jTk4w?=
 =?utf-8?B?MkpQck1CYzNpdnNGTjVmbVhNVmNHWXJYZ2cvc0RBeStQazRjeU9ReXpoT2xB?=
 =?utf-8?B?ZWtkWStKdFp0bDMvTk13cEljUWdQUTRnUnFUSGp1TEdCNFkxRlpyY1VJSFVx?=
 =?utf-8?B?dThzTXRETlphemE4a1hhU3lDQU9USXo0QWJqalNETnJDNDVrWGl1YnpoNlNw?=
 =?utf-8?B?Zk5VQ3d2N0IybTJ2a3lhSzNBREJlWFlsc1RtVGNjZTc1L1JIZjBlT0NMZlI1?=
 =?utf-8?B?c3N5T1ZIUWRsSytrYUprczMwVWo1TUZ1aktTOHdYeE9SenhNamZHeENrZlhO?=
 =?utf-8?B?WXhPQzNiT0grRTludUxFajJ5c052enN0a1dKWTd2a0ZOdDVZb2p2UkovWnpC?=
 =?utf-8?B?NVJtbXVQeDl6MExieGRwQmNBQ3NZSXdLR0JWSE04UW9HOUZSb3JPQkRYejBk?=
 =?utf-8?B?VDNmYXN0K2luOVJRblZDcUdtWlRaTC9zemxWSVJoeTVwancvNUM3SUx6dWNy?=
 =?utf-8?B?RUx3QWxUdmNEWHkwZG9RbWhRcU5tTnZKVFNJTkc0Z2hxMGxCMzhXZkZnM1B0?=
 =?utf-8?B?aGhpZ0ZXWUhlZFV2S0NEa2U4cmRxVGRvdTdRaWtpblhFNytmRlZoeEEyS1FN?=
 =?utf-8?B?amZtcDY3RXdhQnN5NEFNcmR6VStWbUNUZER6YWh5clgxZ2s5VUlXYzF6TGlX?=
 =?utf-8?B?YnBockU1ZDhjZ1ZJNGJ2dm1oRnUwb3E1dlRRcHQzSjdyclB1Q3FZdFk2USta?=
 =?utf-8?B?QkJUVDF0dGY4N2w0MUVaSHdwUFhXVXdRUFRZYTF0SXJqYXQveFRUVTJHZ2ky?=
 =?utf-8?B?R1R4aTA5V09sSk9Eei9oMjhMQ3dYdFpwdmZOc0dsRFlWb3Vra3JvSXlhYUxt?=
 =?utf-8?B?ejNuMzNjY3greWdvbnUxbFdnZU43WGRBYlRmOWRYVytJd0NOeHVZbVFsaTNK?=
 =?utf-8?B?V1dvY0J6ejlMWE8va1ZVRlRwR3B5NmV3UHRqUXRRa3ZNd1AvcS9TSFRhZDBE?=
 =?utf-8?B?S2JTblAwOGNKcnBKa29aRkpXUzlxMm0vMHBWMnJjM0g4bjNGYjF0a050T3E5?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee94a2b4-adcd-4b1e-bb21-08de29f265a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:10:19.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikehDrbXquAN43GJOGgw25iPmPuimL4Wa47p6940eg3VijpXBDQE/M5C1tSER9UUKkbnboaEfgjbwQMreFdQ/RkY70zabdGJKub5jQPDzBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
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



On 11/11/2025 2:04 AM, Michał Winiarski wrote:
> All of the necessary building blocks are now in place to support SR-IOV
> VF migration.
> Flip the enable/disable logic to match VF code and disable the feature
> only for platforms that don't meet the necessary pre-requisites.

typo: prerequisites

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 32 ++++++++++++++++---
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  4 +--
>  4 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 6ad948e96fd45..0a0c3145e1274 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_migrate.h"
> @@ -1008,6 +1009,15 @@ static void action_ring_cleanup(void *arg)
>  	ptr_ring_cleanup(r, destroy_pf_packet);
>  }
>  
> +static void pf_gt_migration_check_support(struct xe_gt *gt)
> +{
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return;

maybe instead of blindly ignoring all checks in the debug mode, let them go
and just in xe_sriov_pf_migration_disable() don't set disabled=true or
ignore .disabled flag in xe_sriov_pf_migration_supported() ?

then we could still experiment in debug mode without any restrictions,
but have some logs about missing official prerequisites 

> +
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> +		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -1024,6 +1034,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>  
> +	pf_gt_migration_check_support(gt);
> +
>  	if (!pf_migration_supported(gt))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index d6c24bea759af..7dd7625e5aeed 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -46,13 +46,34 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> -	return xe->sriov.pf.migration.supported;
> +	return !xe->sriov.pf.migration.disabled;

	return IS_ENABLED(CONFIG_DRM_XE_DEBUG) || !xe->sriov.pf.migration.disabled;

>  }
>  
> -static bool pf_check_migration_support(struct xe_device *xe)
> +/**
> + * xe_sriov_pf_migration_disable - Turn off SR-IOV VF migration support on PF.

    * xe_sriov_pf_migration_disable() - ...

> + * @xe: the &xe_device instance.
> + * @fmt: format string for the log message, to be combined with following VAs.
> + */
> +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);

	"migration %s: %pV\n",
		IS_ENABLED(CONFIG_DRM_XE_DEBUG) ?
		"missing prerequisite" : "disabled"

> +	va_end(va_args);
> +
> +	xe->sriov.pf.migration.disabled = true;
> +}
> +
> +static void pf_migration_check_support(struct xe_device *xe)
>  {
> -	/* XXX: for now this is for feature enabling only */
> -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> +	if (!xe_device_has_memirq(xe))
> +		xe_sriov_pf_migration_disable(xe, "requires memory-based IRQ support");
>  }
>  
>  static void pf_migration_cleanup(void *arg)
> @@ -77,7 +98,8 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> -	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	pf_migration_check_support(xe);
> +
>  	if (!xe_sriov_pf_migration_supported(xe))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index b806298a0bb62..f8f408df84813 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -14,6 +14,7 @@ struct xe_sriov_packet;
>  
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>  int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
>  					  struct xe_sriov_packet *data);
>  struct xe_sriov_packet *
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 363d673ee1dd5..7d9a8a278d915 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -14,8 +14,8 @@
>   * struct xe_sriov_pf_migration - Xe device level VF migration data
>   */
>  struct xe_sriov_pf_migration {
> -	/** @supported: indicates whether VF migration feature is supported */
> -	bool supported;
> +	/** @disabled: indicates whether VF migration feature is disabled */
> +	bool disabled;
>  };
>  
>  /**

