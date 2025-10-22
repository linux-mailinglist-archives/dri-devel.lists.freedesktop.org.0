Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18EBFE78D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 01:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E94610E1B8;
	Wed, 22 Oct 2025 23:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC3/yTBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBB510E1B8;
 Wed, 22 Oct 2025 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761174349; x=1792710349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VTVb88b60BNPCkePcTUu8SFZj/y0CahZ1WjowRafeVQ=;
 b=BC3/yTBK0GlMkFA78dlJGVfXXMlTy3N6RQjgfH+dpCaJWLQ7SlURqB2U
 BgcrMsOyae0vjDDYPdwKRLR6pU8o0YVItiTS62EknPRzSUJbrhxrYe57O
 +yQCkg2fOiYjTjykdeJdiVE79Ui4GAQ4Q/0Bk4PcV1FpHeQpndJjrClLs
 j4SPQ17pPZdnFO4HicrnkkE/EK7iD/9933KZz5pQeFJiHZOJVDqJpc3SA
 ZDrJrVUksxxG3eiUTu9XlAZ5H6PFet5Yv21wWttzREviRsZR6N5xnf1Yk
 hDTND7S0nGi/YsHxee79fthcytzvjaN6A05SYnIDfQ3m8kbFoDnW9+xdJ g==;
X-CSE-ConnectionGUID: DUX/ax/gQzea/nSKchuwMw==
X-CSE-MsgGUID: nEueBZ2YQbOM2s0J5K158g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62545431"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="62545431"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:05:49 -0700
X-CSE-ConnectionGUID: 2Rt+SrxVTBCdfyWQAQ2Bfg==
X-CSE-MsgGUID: nbM4NHEtSBKxF68XxraqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189122908"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:05:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:05:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 16:05:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:05:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X636IEWq71d4nQ88N1FoP+okybKaC1HlvpxagSxRFRBzM6sqA3AQnPSmZ2gqTEY5SvcdeJt5SBX4nl8eu0eCubCwqTvRvrM+b4wom0srbYF7gHycHdNwIISu5N+4ChkzsQD2QOgdUhJ6Z/wh9On8SsXkfIC8tBWXracPlXJRrCZd5tgywmbRiubnAByKO5awVC0CNxocoImklRD8moFHlYteBAqvStRNZgOEyw3w/5AuJQ/2/Z7kHK4F4c4RX41bwSoIse/TPutMyaCvOTL7Du0vyt2dvvTuOKKIvaSflk2IwgSgSXB/3hExSrV9ARPPOlpVNDejtnbZp3IVcxlVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wku7a22X2tG6JCM8yQ61upTIrBq04NyiEMkSxupfEqk=;
 b=OJHYvrGvjp3IdA1HEFBaGXKFeNGJqjPHfFZm0gPVKAWdjHqbzcngvZsgz6spvu4PaDorMDhSk4s3Aawl24bcIEVe+pKWbZATBFkS8gtq4HgwdvGda7aS9HxLmOj/ljIzOntuksXJs5/EU8iNeVL4yfS08NFowqG/WyEseWUr+Y07j4SdhvKTCFqIYdev6Q+bezazAwsInLEJYBCFioavVZ2at+yKpvStF94VuC/25gncuj5jC8bM0atLtRmISLACSfiLrQr7d86fkV4iUbIldGV1GN5KdIcabB1U0nFu4u7aPX7QwihbAx4qBv/8+3u568f1dsulDxwz+BqzaCqh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:05:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:05:40 +0000
Message-ID: <c4970fbb-5250-4c62-8e53-2ddaf357516c@intel.com>
Date: Thu, 23 Oct 2025 01:05:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] drm/xe: Add sa/guc_buf_cache sync interface
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-10-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa063ce-6ebd-4a96-441e-08de11bf84ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWpwMzRSTStMeERnN2toNHJGOVZKU3ZIRHhWMHBMUUp2NmFudG01bWZUUmFu?=
 =?utf-8?B?TloyNDZndktRUGM1ZVY1UFNYWTdpdS9veEJyOTNHVmpwRktNSGZEQVFMTnA1?=
 =?utf-8?B?VDZUclIrZHRwTlFTWURmNlM2YjJJTG9tUE95SXZkNllZdlIxS2E0Yld0RXc4?=
 =?utf-8?B?QU1kZVJXa3BVSE5TNjA5R1haQTRqMVNuUjM4ZE1WclhWWC9CZlZJSG5JQVhG?=
 =?utf-8?B?S3lFRmtMV0t0NDRRTVk5dk55cTZPeWNaOFpGcWVKc21FU3N4bERBZFAxQSsx?=
 =?utf-8?B?bXdBd2p5d01QdG5DSEk4SDZDSDltLzlEOXlsMjVWVUZTczQ3UmpVbEpNelpH?=
 =?utf-8?B?Y3B6ZWNGa2cwYjk5Q2I4VnlGQ2IrcHM5cUEwbktCQU9TUDMzNWpXdFlUYzg3?=
 =?utf-8?B?czE2cE1EMDFtUnhnZGI5SmMvOWJhVDdxYkl6VmsyZyt2K2tkMWRqMm03OFRl?=
 =?utf-8?B?cjNxTTVJY2lvd0xsU2Zyd3dIWHNtWVoxeEVoMjhNc2p6Q21ZUXJ5OGpKZEdr?=
 =?utf-8?B?ZmplNW5lYmJzWXExMy9oRHQ4OVhLb2M4anZWUzFiMFdpdFJ6bHN4SFkvaUFn?=
 =?utf-8?B?aTkyMXg4Y0hES20ycGxoRzI0VlJYczFpeGhiMmRRMk00NHFDTWRVb1pqZjQz?=
 =?utf-8?B?dnA2bHEyeWVZendLTldCckw3ZDdTUlh3RGtmTTNtNFMvR0k2cWNQTklYZnBD?=
 =?utf-8?B?eDAzWVZGdHhXOTdlTW5vcHdBcVZqZHFYRm10K1lGQ0N4OW5BaTJYMDB4M2pn?=
 =?utf-8?B?M0FUM2dmVEZ1M3dsRllJaTAxQklCTS93bkJEU0FzUDdTOVRIM010WWRwc05i?=
 =?utf-8?B?MTJTdWRUR3ZuazNSRnhPY2FoMjN6NEkxWjgvemE4clhLaXZEMnB6TFJONjRN?=
 =?utf-8?B?Z1ZmcnBXZlBvVDAyb1VzSXNsMjlJcEFFQW0yMnlSbE9RSmY1WEFHT09Zbjho?=
 =?utf-8?B?ZWtFRUExUmZXYWM1S3k1Nk1XVkU3ZFFxSzMxNU1kT0lHcTIyQjB6VEpkY2dw?=
 =?utf-8?B?UDZpUUpQZmgrYWtMaGxQeU40VmxqQzFoMTF5NG1XLzNxRCtwY21HVWt3SlR5?=
 =?utf-8?B?SUhhOGhQcm1sNUdoeGRNaDlkajNpakxiZGlTaWZDbEdNMlJsT2dIeHpRdll4?=
 =?utf-8?B?eXVtOVdKUG4vc0dxVUJ4clpaR09TYW9kSTJRQ1dUalM5OGlid2V0ZWtCZzFE?=
 =?utf-8?B?TC9sN2NlczFDVW9ROVVPT2svNjhrZkdHNnpZMC9BcTNFQlVFRHE0OEtJdGxr?=
 =?utf-8?B?d1ZTano5TjE1UmxtUjMwWG52b0ZOdlFmQnI5S3pxYXNGL3lYQ3JtTWVQenNi?=
 =?utf-8?B?cHFxZkZKbDR6K1N1VWVvSkpyL3BXQm8xSVdkdXBOOUU1NW1xeTVScHZkbTVR?=
 =?utf-8?B?bkQ4YW5ZVk5SZDRRYnorMnllRENQTm9SRU5vYjBpMFIyNFNXUS9wTWE1dVVH?=
 =?utf-8?B?SlFvMlM5dlhjRnFJcmpRaldZZ0ZLdTU4NEFLQkdHYkttWWNJZzhHLzQ2RDdU?=
 =?utf-8?B?cjlURzJiSlEydXJMWGpGM25iMDJPSkt6eU1NM3JVZ1puQ0p0OHcxZEl2TnRw?=
 =?utf-8?B?YmtUcGhqTkUzeVhTMzFpamMrcGdRUEZYM1k2aGNtTVJRNW1zbkFPdG5NeHRT?=
 =?utf-8?B?aGNwNmp6bFZ5ZjNJYkwwd24rUjY2QUt0TlB0OWRlREIyQjVoL0N5c0o2ZXdW?=
 =?utf-8?B?OGpMcWJXdkhLVXpIdkVTYUhEdjFXZGdLRkhaNEpkQWkzUmQzb2hxTzFiejI4?=
 =?utf-8?B?UzYzQ1pPMDhvalZwVzI5UHhvVnZSS3AxTnI3WTE4dTRxY2pYcDhWQW9VNmVr?=
 =?utf-8?B?eG01OUhUbkpROUtzTjJYK3Q3aGJUY3M2eXhFZDBxc0d5QkRoOUJOQ0kvSDJ0?=
 =?utf-8?B?OTI0UWZHdVh5V2orTlR5aGxkTzdhbGRnemlHaXVWdDQ0dFhpMzJwSHpVaFBw?=
 =?utf-8?B?VzJrSzhWbXo0NU1MRzZWR2docmszOEJvbjJ5UjgwVVNEYi90WHdMWWRUWUF2?=
 =?utf-8?Q?ZVPuD0uhV2PFKOT1QudsQfxXFZs/40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGNtUTFUeUxJb3hPRXZrckFBbTB0UlJ5V2xVZEhremlhTnc5enFwQ0RPd093?=
 =?utf-8?B?eHBpYWp0OUhzV2xDSzR2clBBYVo3V3VmREtzbitVS0U3Q0Vwb3NGTHA4Z3RZ?=
 =?utf-8?B?RUJ6TmR4SDlXZ3JLYmFxSEdVcVJpaFJkQVd1WnR5TTRXc3UvNnAwdjY4b1dR?=
 =?utf-8?B?K1dnUHhZcHUxVXZacW9SVngyUHlsZDhFVU9VS0hmc1ZRRC9JeEZlTVhCcEdF?=
 =?utf-8?B?WGdIZ0xXSnUrd2JVbkVCOWpESGl6c3lZVUhTQWpqZTNqQ0hIdVI4Q25LWnlZ?=
 =?utf-8?B?YVRHS1dzVjUxK09CaXBlU3hwc2kzUzN5bVdIck5BM3lZaldKK1BjS0FQOGZJ?=
 =?utf-8?B?akMrSlJXckhQY1I1Um9FYnZ1VW5oaTZWQ1VjK3ZjQjJveWVINUlFREVlTW1l?=
 =?utf-8?B?TmpGZG11SVhjNHAveXF2b1NuL0IwM1Ziem5wZXFlZGhkb3pzbE1pZEZLaXhJ?=
 =?utf-8?B?OGpSOGdNUElRMVNsV3dPalJzZkZFcGVNSUU1clNTbS9TL2dXTlZGczN6RGpH?=
 =?utf-8?B?MUVudkdvOVBzazlubXl5NnkxZUtRTHhTSDI4Z1lZa0FPUWRZaWJQTjlWaW5N?=
 =?utf-8?B?R1R4eDZhUTA2enlyQ0JTWFFhY1A5a0d2STV6TGJlSzJxaDRQalJJd01yTGta?=
 =?utf-8?B?Ym9mUVlvVGhhaU9HSmpOdUxDbGZ5QVZ3bncrT2EvMW55U0EvWXlxOUdrTEJH?=
 =?utf-8?B?Z2QrZ3NyYjB5b25hRFpFNmtGZE0vNFNyMWZCd24wU0MvTXVnOU9nZkZQdkZY?=
 =?utf-8?B?OGhEWGhqRzFtVFpjclhtOTdKL084OWVLelJJc3JpU0g4VDhpV1cyaFhLT2p4?=
 =?utf-8?B?NVFFcnRRbnJGOGFnS1BqUTRKOGdCR1BuS1JHRyt5UUxLOThmZE5FY254WTV0?=
 =?utf-8?B?ZnhDY2R6cUNDT25lOUNaLzNycysycWxPaDI4akc1TEtUWk1CWU12RklUYzZL?=
 =?utf-8?B?b0JBcFF3cmJaOVJ1VWc0ZzBNY3R1ZG4wbWtsRGFsUG5Ga2Y0Y0hVZmN1dW9W?=
 =?utf-8?B?M216VzNyTWNaZnZQanRRVEhqSEV6Yk1Nd3NZVnFUaFhMd2p0c0xLYi9XM09U?=
 =?utf-8?B?RVMzMml4NktQYVNIYXNTamdNaVFJMWZ1Y0x6NTloVWE5MWpGbDZ0YnhSNHRt?=
 =?utf-8?B?YmlYdUtib3pzRTBQQ0dTdWxIQTUrajVtZEw2K0NzR2xleTZvMlJwaTNsOUMw?=
 =?utf-8?B?ZUpXNlB6WksrUFRxM21aeXdxaUR1M0hXd2loYlRyNmVzN2VrZ0RqZFZsSFZa?=
 =?utf-8?B?Sk05L0g4cGVlbGs3N0U3Z3VDbmFMVFQxNWhrZDBkbDlSUms5RTQzK1diN2Yz?=
 =?utf-8?B?eG1qaVVFZXhqNmN1SjcwUFJQVUVIaGt4dGhVeUVqaVlkQWhMV3R5YkZMcTMv?=
 =?utf-8?B?SWJlSWNoMjZBRDg4NnozakRpcE9NZnZydHplekE2aGJld0ZrbFlhQkdLd2Uv?=
 =?utf-8?B?aE5VWlJBY3h4bW56YWFneUhGK2FFU1BTN0hlOFdYcnVIU2xBaFVtbEhBQlBx?=
 =?utf-8?B?Q0hGVHUyeGRjdEFPQVpvY1B2S0pOQTAwRGdsWjZqZUdUdDRMWXpmSS9ySmdR?=
 =?utf-8?B?STFxQ2ZhcllvQVF0aGF3VEV6ZXRjbWxWZllXa1pNQm5YeWVncE42Vkk3bjE3?=
 =?utf-8?B?NUpZL3pCaFVxZXQzb1BhSDM1T1JqZ29mRktZUnR5cDJsRHhUd2JEbXZ4djly?=
 =?utf-8?B?UmN6azB0Mjk2alJRQUg3TTV4clFHSkJBenlaazJpdHN0dHREOTlmSVdDK0VE?=
 =?utf-8?B?R1pkWUhqV0ZuUGtZNmVoWFF2UTBDSXcraFdvMVN3T0hNcWRaTklxYmZRRWJM?=
 =?utf-8?B?WWY3MjB6anBOc3BxMHBGSjNJWElCNkdzU0RmK3VkZUlZTko2d1VDbXV5Qjhr?=
 =?utf-8?B?UW0rV0M5bjhFNWNUQ1V5VkdwN0NXZUE2TlRkNWd6Q3RXaysvRmFjeHBlKzhn?=
 =?utf-8?B?OWEzdmswMDd4Y2gvQ0w4YmkvMUZkZ0FpdjNmQndzQ0JHWGVLOU1IcUYyRzRD?=
 =?utf-8?B?eDJLZlovb0xjT1VoUEsrL1ZURWt3aHVuTlhZNjdPQUxrNlZzUjF0V1Z2MEIr?=
 =?utf-8?B?UndpQUxvQ056bVRkYW1STlRzbENuNHRVTFErdmUyWm1EcHBHQytCUC95Zm1R?=
 =?utf-8?B?SW5QTk8xc0wrbExOdllJWlhUZjMzcEhuQ09ZdVE0S2l4WkZKVE1TZnJ0UitV?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa063ce-6ebd-4a96-441e-08de11bf84ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:05:40.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jCvPeEbAWMuohqZLC/3bboixPWXWd0x/hsiqmRqf7Ld4yCzcPgVVXPbZwShJmTCERjsJ2rXf//qzajW1844HWIwnfmVnekxJQaGVH2QVBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> In upcoming changes the cached buffers are going to be used to read data
> produced by the GuC. Add a counterpart to flush, which synchronizes the
> CPU-side of suballocation with the GPU data and propagate the interface
> to GuC Buffer Cache.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


