Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67BC4F756
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 19:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0617810E641;
	Tue, 11 Nov 2025 18:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpZP2iDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A1E10E641;
 Tue, 11 Nov 2025 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762886211; x=1794422211;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ML0dMiiDf7gRvBbuHeuJ6Xysvd2qqm/te76js46I/pw=;
 b=bpZP2iDBVanplH6VyDDkm+SKhp8JD/waG+viLMfFrh0UlxuQg5IIe4sD
 BaBjDQYnTSmxFLse7AVuREx8epAeziUZe8oj+CGKyZQyTiz5Iy1EVZSeD
 SVkpEO/OZ6ZIlIHsE9p6iSe4zjvHwBVsgrfvmP+LCaaENjmH3T3cAdEgp
 vs/61pRx7fegwSye4kVqKDedeAVUvSnQc1Lm2BUBr5wF/RZIfRo39Lhbo
 08DONJX6P609YKVqjJ/ibcPqyKT2HVfc3iH5j2Y+6Ir9uUTJuxM3/04zJ
 sz0stuib/SWJOZdEIf5TTHJAD43VYwMJjk3+umeosLcrcg6fZIg9ExaCI A==;
X-CSE-ConnectionGUID: jkzOz7qrQb+xft5n9KTKqw==
X-CSE-MsgGUID: VC7D4uDsSMmckXiIjoBZrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76058043"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="76058043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:36:50 -0800
X-CSE-ConnectionGUID: nFVCacOKSMW1f0BvfQXlqg==
X-CSE-MsgGUID: yZW/Q3F2SfaxCFCoNree7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="226283349"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:36:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 10:36:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 10:36:46 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 10:35:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiT7Iyi6Y7RYxZx7Wje0DebrTm75mktBnWiJY4vP1YWhjqDwckM4MNoLjMxm0VZfQAGMceppiCRMy3c/xMrmO1tw7ym5kDFWMtp2ND/JVzcJqhxonGbWOVO8o+N7PiKjudmJdNWxAvOZjuy3s72wogTkq/J1ubIFxz2x80QZy7HY4dfqpOyrNGtzgBigu58QcAX9wxT4kJZoA42GeDzF2n5nFbKbhL6SgLWWxOSU24rceoAXC6enEIo4jIC0L3Kq5TFGCo0xmmoFj2GqqOxbfNayBN9Wm7Ck/k528I4skZsaQayjEZchG1eM2SOhxzTOiPhkre5Jv4gnS2kXYNvuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dk6t0QRqWzEfFAEB9Iznum3T81rHVhEthQ08rgtvYU=;
 b=li1zXOwV8tBAthOAkbAiuenxCoSsAj4HGa9IPuosFn9P+ycOLBedaPiGgyYIttAgbzsmePth1AoM34Q4v7xQxCWc5aVlYPF9f+vG915o68uEVj1FoT3tYL/uewTw8Y8nc3yb0lPs3w3c5ayu8S8x0cgdsmYNR6b/rlPf0y0V22GoVx6lvp9zt4uXZSMeJNWyDtQ1lG2szdpidnXk6tHjzL0Leqc1RjEVl6JLtCOg4njdy9ykpVHFOmgKay4XZP9SuYO4ItNFPTUYJHIL9o9BzhPBrisC1FdKmA1/LJdtUkcMmOC01Hn18fgZ7/GLIFq9XygnuOCSm7Ug8LNy6dEVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 18:35:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 18:35:41 +0000
Message-ID: <3d63dc80-73cb-4952-a61f-b07399385b10@intel.com>
Date: Tue, 11 Nov 2025 19:35:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
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
 <20251111010439.347045-6-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251111010439.347045-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae9d6d2-7f74-44bb-e404-08de21511e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzQwcTZPZlo1TFFxYjl0VG8xZUE4K0pVRGIreGhXTHRCbGRkT3l5V05ka1p3?=
 =?utf-8?B?eVllZ3M4MW5vSldPQjBLUzFKYW9ML2w3RlRQRUZGTmkxUXFLeVczc1kvWlN6?=
 =?utf-8?B?WWg3RElPTU9Zakg5T05SMXROZDR6K3VOQTVhUGFDWFlyQnRjRUVoSWhhcmYx?=
 =?utf-8?B?OWVqYXpVM3JMN0dzNk9qVUZ3Z1dMSlZuaWJYV2h2dXB4OVFNOWhHQ2lPcmln?=
 =?utf-8?B?UzRIeHFhY0ZaUVhITVNiV3J3Vy9MQjJVM3dHa1BEbUt4UUR2M1oycFRJczhR?=
 =?utf-8?B?Y3ZQd2V2ejdVMk5pbVgrRUFpOVZHRDE3bUgxazd0ZllzM0tvSU9hRzRJMzBw?=
 =?utf-8?B?bk15UkRHREJ6d2pGbGxWaVpIN0tBaGRndmZpNnpzRHpLVFhPMytlWVFHblc4?=
 =?utf-8?B?Y0ZncEc1RThLUkFHLzdIakJON2dKV0NrUXRxL2pra2NXQm12UDY1MDhSOGM5?=
 =?utf-8?B?U1haKzRjSTMxbWRPaDNTZThtZmpKdHk4enJ0U0g3TWVzMm90OEpDMkJSNnM4?=
 =?utf-8?B?L1lkQzJVbDk3U2pVVFpnRWdURFBTQlo0L1NHTlBOQ3FpQXpKM0dFSFhqWDhk?=
 =?utf-8?B?K3dNTzJyUG9hd2JydVIwYzhreU1wVnl2SS8xMkpkT2NWbnZ3VU1aYUxWcUlj?=
 =?utf-8?B?OVplNTZRMVFTWkdpQThsZXU0dzM4SnMrWHJTWVZjKy9RWHB0SkpxRWNuK1lr?=
 =?utf-8?B?TlRma2NmQk44YkE4WWIwdVVuV2MyYmgya3Z3THNBUWlhb0JUczJFWUdicmla?=
 =?utf-8?B?aXhjVGk5dnoxUHZsRVY4Y1hHRVpSdXI3Tm1sczEzd3MyQUoyR1pkTnU4dVZ0?=
 =?utf-8?B?WHZhYkNHZ3YrR3hQRTY1WU1QRXRuUTZjMW5GN2VkZ2crWG5ZMDRUS1RCRjJD?=
 =?utf-8?B?dmhTZnBpT0ZYanR5ZXpYZFlCUENwRnlkcm1BS05laS9YTHQrLzlZaGtnUzBv?=
 =?utf-8?B?QzRRazFQUVdjVmNCY050UmlSQ1VFbkJJMlRjZHo1QlZFQzNjYTZJSjZNb0ww?=
 =?utf-8?B?YVZ4U3VCUEpZUWdRSTFua2c4UzFUWlowbnR3MUtEcVphd3h5QVVhVkJ4RDRr?=
 =?utf-8?B?OFM4OHpKZjJYUGczVE5BUFJCVWwxTmNCNDE5am94NVE2ZW5NaVlxVERjVFFO?=
 =?utf-8?B?cFFSbzk2RGF6OWNjK2ExUHdjN1cyT0J6bmhFdkRQMTBxbThsWHV6bFNYVUpB?=
 =?utf-8?B?Y053bTB5REV1N3kvdUZVN1dZem9iK3BYRW1qZ25KSFVDd3BQRzBoQkhTbjB2?=
 =?utf-8?B?VHRGd1dma21FL3U5YVE2MHB2NGc4QU9GSjlVZS9qRVd5ZHM0QWluRDdFRnlo?=
 =?utf-8?B?eG1lNTRYR1VPQTJFKzREU2ExM0pqeWE3U3NrQkg1UG1mb1FUNHRCcnJWMG5V?=
 =?utf-8?B?VVQxb2dUQmk1ajRYZkZJZFhPaDNRL3pNMFRhMzRzWS9KRGozb1k5dmlsbmIw?=
 =?utf-8?B?czFhYjFwWFJNbkcyY2FyTmt6eEg3MFczYXVCZjB0dlBMdExQNllnU1dYWHNs?=
 =?utf-8?B?SUIrZHU2WjVsczVkdFRkcng4ZU9JV1NTcldNOWMrcDk1RlpFanUrSWJDK2xv?=
 =?utf-8?B?WS9hc1o2dXFmbWJRTWhWTENLYU5DOHFmd2NWZzBPVmQzaldDbXhPOE9CNUxl?=
 =?utf-8?B?aU1KOTJIakNJYjluSzZFdlJGRjFiQmZYVXF1U1QzWmlRWVFEaU1Iclhmc041?=
 =?utf-8?B?VkpWdnViMTFkYnU3YWJmL2lNaTFueGo0OVNrVVV5dzVNQ2JnQW1XVzg0UVpp?=
 =?utf-8?B?bEppa0lycXd2NGJiWE5vM1VjSUxuVGJqK3VrQWlTQnpqTTFMMXZ0VzZnYUMz?=
 =?utf-8?B?RzBuTitvU2t6RXhoODhzMS9CV25YNmQzWFVXY2R4TnROcFNEVDZHaTkwRHNB?=
 =?utf-8?B?dnpOV0hGdFU4QlByZWRLbDlXbVJHRVpoV1BBS1lvMDZXTC8xVGI3bTJpdWtj?=
 =?utf-8?B?WlVXdlJ0R3c4TVZrb25wMVFqbHdFOVYxNFJZYnFvc2wyMk00eGFHRlJpSW5F?=
 =?utf-8?Q?X41vLJe1XfUt8cerB290SJtBbfY3jk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXB0aXpWMzRCMGZudUFIb1VTUmhVYWlrK3B3Yk1Cd3ArLzQxUmpVSVF5dzlN?=
 =?utf-8?B?bHJ1YnhoVU5qbGs2a1R1SGwzL2pGVDlRTGE5Y3AxOW01d09WT0pkREdZSUdk?=
 =?utf-8?B?Qm9iQVZjQzVlazVyemZwdzBXQndhbnFiWk5zaWlRWWh6R1MxNzEzeXE0b043?=
 =?utf-8?B?RHo0WFRCSHovejQzeVV3ZWRZM3UzdnJPVmtIblJuQXVFR1ZMVVBiSFJ1U0w0?=
 =?utf-8?B?S25sNklraDM3SG12SC9vak4vZll1SDlwL1hmeEkydnUwVGJwdHNkMmJwYUVk?=
 =?utf-8?B?VUdXSENra1g5VHdUdGd5ZmtlV3VHV2UzOS9MRWxaNCtEZnpmYm1VdWl2ZGJR?=
 =?utf-8?B?Q25aWEovZ1JyMnZhK1Jkb3pEejVWSTU3Uk0xSno5TnFhdUFhTXpQbXcvMVlp?=
 =?utf-8?B?YW00OW00a1dpR1k5cnF5Nk8rSThxZUllektCaXRYUE1KbEIvQ21laHIvSGh1?=
 =?utf-8?B?NDU5V1pMcFppdnMrRWQwclpqVmljTXkySGFnZFpTSDNDNDZBN1lBaTNYT0J2?=
 =?utf-8?B?bzRxRjRJM1hvSHllVzl5U2dUb3AvSXZGaUJBZVZnRldjR0MyRHNaRlJvV21q?=
 =?utf-8?B?U1U2c1ZHaHA2YUdSWk5LM0FOZEpyRlFPdXlWQWFyYldlcFhtd1Z4QTNCcGJs?=
 =?utf-8?B?V05lVDRlZStUT2pVY2QzbHIwV0g1a0dxdllyMjcyQkkyQnRCWlovVE1aU2RJ?=
 =?utf-8?B?aXVZQmxwOUJPY29LRnowaHU4Z3IvZmxmcmVLZDM0eTFwN0h2dkZsWmN6M2NF?=
 =?utf-8?B?SEtydmMvUUJYSmNtRExNNldXa3RaaGJuWTIxbkhJeUtKZjRRR3E1RjgrL3Ry?=
 =?utf-8?B?UnZQNW5YT2RSV29SenhtSUh5OXBBTHRPNUFDMVVHWTJvOU40OUJKSnkxR1ZN?=
 =?utf-8?B?THZMTXhkcFMrOVpTNFBJVkFqcUFFeTRIamQrWlBiVGxWVHExbkxZSERNc0dj?=
 =?utf-8?B?QnQ5UllGREI4NTFnWUwweDFxbFcrMDZpZHZITWtNVXhGVFFQZmQvOXJieEV1?=
 =?utf-8?B?VC83REFkMnlleERSOXQ5TXU3K3ZVckgzRVVsUzIzMXkvTW9IOGZwaEdmdWxD?=
 =?utf-8?B?Mk9sN2tVeEpaOW5tcjR3TXJTaVhvN0ZmdW5zMmZLZ1REbmFlbmFNUVVzSmE3?=
 =?utf-8?B?UGhXN3FqeTR5T20zSnovb1BrZ2U2dnZLTDFqSHoxSk5pSUVUMGtlY2NiY1pP?=
 =?utf-8?B?YnkyMDRpaG5JRlI3ZTlPM2krOW1aNGRpYmVUMzJuT2RPUGpoR2xkMWJ0Nk0w?=
 =?utf-8?B?cEF1aTJCU0pWQ1A5RnNDcnVRejBVNCszd0xwaWFlaUJoSG1KNGUvRHA0Wmwx?=
 =?utf-8?B?b1FmTElMVkNFSUQ1bDNuS1lidFdUaTBaT2dXcUE3OGJTYldxdWVxd1dLNDFW?=
 =?utf-8?B?QUxuZUFaMHRPbjUwSmxGdTZLSWRlZERCVDFuN1hESDdKZ3l6MmV0THppSDBi?=
 =?utf-8?B?V0NyT3V0U1A4TktSYXMxdkxMVVNBdFNhWEw2WmRzOWh5NHV3VHhqUXBpRFFG?=
 =?utf-8?B?TGdUSytpaXhCK003QlV0OWlDZWkrdUk3SWxjOHBVanA0UTEzRnU2Z25TdUkx?=
 =?utf-8?B?QlRsVHBmcHVMZGFmdC9tRjdPdWdINFRWV01TcllSczZVT0l6R2pzMXpKV1BW?=
 =?utf-8?B?LzNtUUFjNC85OFRjODg5QVp1dXh0Zml0SEZxOG5SNGt2bUd6Uk9VaU9KYzFy?=
 =?utf-8?B?dUZWQ1VPbTJCeHFURlk4Wm1zM1orZmpCTDZDeEZQSTMrcnovMk5Qd25XODN1?=
 =?utf-8?B?N09iUXdIYUFRMjlIWDEva1FUMWE3WGhUeitsM0k1NWNPbEpzRU5waFd1REM2?=
 =?utf-8?B?bEQrc095c3hhYnRPRHNua2V5OFhZVy91ZFBLV2RZTHgwa241VTVTbFUweEJO?=
 =?utf-8?B?UzREMEt5Wkt0SXVsTFZPNlp4dWlnSlRVMCs0WWpRMGZXY2g5aHZVTElVbW5m?=
 =?utf-8?B?RngydFF3SmpzRkRPSGlHT0FaV20zbi9YWVBoQW1tYzhGN3VtMzdOS0hpUVJn?=
 =?utf-8?B?OXlVUmJBVnFwYmdaQ1JaNnhSRlNzL3JaMlFEbko1ZWp6ZlBmVTBlSmR5bDhM?=
 =?utf-8?B?bkJSUzVVMG0vSERDeS9ieHlTN0pZd1pHWk1SWUhoTnBHWWh6RjgyemJvQVhr?=
 =?utf-8?B?SzBsZTBVd0IwV2tMWHFrYlVaV0dpSUt3QmJXbUxyR0hQTUIrV0dobkdlUFVV?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae9d6d2-7f74-44bb-e404-08de21511e21
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 18:35:41.7448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh1YCib6M4pBvzbtLhY8/AWcWP97LcQxtBzDWzlfBvHPAN6OtLevoVtBDiJJ4cNReTV+/ZTavzvBKiPZxYOmB7wSxBgT3djzYOX9h7e2dz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6750
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
> Migration data is queued in a per-GT ptr_ring to decouple the worker
> responsible for handling the data transfer from the .read() and .write()
> syscalls.
> Add the data structures and handlers that will be used in future
> commits.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 311 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 200 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_sriov_packet_types.h    |  55 ++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 144 ++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   2 +
>  12 files changed, 761 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index a571e1c02a3b4..bea19e7a4d18e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -18,7 +18,9 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_packet_types.h"
>  #include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -185,9 +187,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSE_FAILED);
>  	CASE2STR(PAUSED);
>  	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_PROCESS_DATA);
> +	CASE2STR(SAVE_WAIT_DATA);
> +	CASE2STR(SAVE_DATA_DONE);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
>  	CASE2STR(RESTORE_WIP);
> +	CASE2STR(RESTORE_PROCESS_DATA);
> +	CASE2STR(RESTORE_WAIT_DATA);
> +	CASE2STR(RESTORE_DATA_DONE);
>  	CASE2STR(RESTORE_FAILED);
>  	CASE2STR(RESTORED);
>  	CASE2STR(RESUME_WIP);
> @@ -804,9 +812,51 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  	return -ECANCELED;
>  }
>  
> +/**
> + * DOC: The VF SAVE state machine
> + *
> + * SAVE extends the PAUSED state.
> + *
> + * The VF SAVE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    save          (SAVED)    (SAVE_FAILED)                  :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......SAVE_WIP.........  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |            no_data       /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----consume               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_full----->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> @@ -821,20 +871,58 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_wip(gt, vfid);
>  }
>  
> +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_saved(gt, vfid);
> +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		return true;
> +	}
> +
> +	ret = pf_handle_vf_save_data(gt, vfid);
> +	if (ret == -EAGAIN)
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	else if (ret)
> +		pf_enter_vf_save_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
>  
>  	return true;
>  }
>  
> +static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> +		return;
> +
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	pf_queue_vf(gt, vfid);
> +}
> +
>  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
>  		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
> @@ -842,6 +930,53 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true if all migration data was produced, false otherwise.
> + */
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_check_save_failed() - Check if save processing has failed.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true if save processing failed, false otherwise.
> + */
> +bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> +		return -EIO;
> +
> +	pf_exit_vf_save_wait_data(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
>   * @gt: the &xe_gt
> @@ -887,19 +1022,63 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> -		pf_enter_vf_mismatch(gt, vfid);
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
>  		return -EIO;
>  	}
>  
>  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	pf_enter_vf_saved(gt, vfid);
>  
>  	return 0;
>  }
>  
> +/**
> + * DOC: The VF RESTORE state machine
> + *
> + * RESTORE extends the PAUSED state.
> + *
> + * The VF RESTORE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......RESTORE_WIP......  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |           trailer        /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_empty---->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
>  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> @@ -914,20 +1093,64 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_wip(gt, vfid);
>  }
>  
> +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> +
> +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->hdr.type);
> +
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_restored(gt, vfid);
> +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
> +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
> +			pf_enter_vf_restored(gt, vfid);
> +		else
> +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +
> +		return true;
> +	}
> +
> +	ret = pf_handle_vf_restore_data(gt, vfid);
> +	if (ret)
> +		pf_enter_vf_restore_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  
>  	return true;
>  }
>  
> +static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> +		return;
> +
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +	pf_queue_vf(gt, vfid);
> +}
> +
>  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
>  		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
> @@ -935,6 +1158,58 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_restore_failed() - Check if restore processing has failed.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true if restore processing failed, false otherwise.
> + */
> +bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +		return -EIO;
> +
> +	pf_exit_vf_restore_wait_data(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
>   * @gt: the &xe_gt
> @@ -1000,11 +1275,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
>  {
>  	int ret;
>  
> -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> -		ret = pf_wait_vf_restore_done(gt, vfid);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = pf_wait_vf_restore_done(gt, vfid);
> +	if (ret)
> +		return ret;
>  
>  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
>  		pf_enter_vf_mismatch(gt, vfid);
> @@ -1705,9 +1978,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
>  	if (pf_exit_vf_pause_save_guc(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_save(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_restore(gt, vfid))
>  		return true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 0286536375d17..c36c8767f3adc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -16,8 +16,14 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index c0ce05818e24f..0bee910bdf07e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -32,9 +32,15 @@
>   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
>   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
>   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
>   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
>   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
>   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
>   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
>   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
>   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_PAUSED,
>  
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
>  
>  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
>  	XE_GT_SRIOV_STATE_RESTORED,
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index ca28f45aaf481..47f1d85341f7f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,14 +7,27 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_packet_types.h"
>  #include "xe_sriov_pf_migration.h"
>  
> +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> +
> +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return &gt->sriov.pf.vfs[vfid].migration;
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -382,6 +395,178 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is empty, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);

nit: maybe it's time to add helper:

	pf_pick_vf_migration_ring(gt, vfid)
	{
		return &pf_pick_gt_migration(gt, vfid)->ring;
	}

that could be used here and few other places below

and btw, maybe

	s/pf_pick_gt_migration/pf_pick_vf_migration

everywhere, as we look for the "VF" data ?

> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is full, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: the &xe_sriov_packet
> + *
> + * Called by the save migration data producer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the save migration data consumer (userspace), that is potentially
> + * waiting for data when the ring was empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_packet *data)
> +{
> +	int ret;
> +
> +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> +	if (ret)
> +		return ret;
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the restore migration data producer (userspace), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *	   NULL if ring is empty.
> + */
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_sriov_packet *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data)
> +		wake_up_all(wq);
> +
> +	return data;
> +}
> +
> +static bool pf_restore_data_ready(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid) ||
> +	    !ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring))
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: the &xe_sriov_packet
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the ring is full, waits until there is space.
> + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> + * is potentially waiting for data when the ring was empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_packet *data)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, data->hdr.tile_id == gt->tile->id);
> +	xe_gt_assert(gt, data->hdr.gt_id == gt->info.id);
> +
> +	for (;;) {
> +		if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid))
> +			return -EIO;
> +
> +		ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> +		if (!ret)
> +			break;
> +
> +		ret = wait_event_interruptible(*xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid),
> +					       pf_restore_data_ready(gt, vfid));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *	   NULL if ring is empty and there's no more data available,
> + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> + */
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct xe_sriov_packet *data;
> +	int ret;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data) {
> +		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		return data;
> +	}
> +
> +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +		return NULL;
> +
> +	if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid))
> +		return ERR_PTR(-EIO);
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +static void action_ring_cleanup(void *arg)
> +{
> +	struct ptr_ring *r = arg;
> +
> +	ptr_ring_cleanup(r, NULL);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -393,6 +578,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> @@ -404,5 +590,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> +
> +		err = ptr_ring_init(&migration->ring,
> +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> +		if (err)
> +			return err;
> +
> +		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
> +		if (err)
> +			return err;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddbb..b29d34a835b71 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -9,11 +9,25 @@
>  #include <linux/types.h>
>  
>  struct xe_gt;
> +struct xe_sriov_packet;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_packet *data);
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_packet *data);
> +struct xe_sriov_packet *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
>  						char __user *buf, size_t count, loff_t *pos);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 9d672feac5f04..84be6fac16c8b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/mutex.h>
> +#include <linux/ptr_ring.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
>  	} guc;
>  };
>  
> +/**
> + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> + *
> + * Used by the PF driver to maintain per-VF migration data.
> + */
> +struct xe_gt_sriov_migration_data {
> +	/** @ring: queue containing VF save / restore migration data */
> +	struct ptr_ring ring;
> +};
> +
>  /**
>   * struct xe_gt_sriov_pf_migration - GT-level data.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index a64a6835ad656..812e74d3f8f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
>  
>  	/** @snapshot: snapshot of the VF state data */
>  	struct xe_gt_sriov_state_snapshot snapshot;
> +
> +	/** @migration: per-VF migration data. */
> +	struct xe_gt_sriov_migration_data migration;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_packet_types.h b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
> new file mode 100644
> index 0000000000000..e6d097a1cd5c5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PACKET_TYPES_H_
> +#define _XE_SRIOV_PACKET_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_sriov_packet_hdr - Xe SR-IOV VF migration data packet header
> + */
> +struct xe_sriov_packet_hdr {
> +	/** @version: migration data protocol version */
> +	u8 version;
> +	/** @type: migration data type */
> +	u8 type;
> +	/** @tile_id: migration data tile id */
> +	u8 tile_id;
> +	/** @gt_id: migration data gt id */
> +	u8 gt_id;
> +	/** @flags: migration data flags */
> +	u32 flags;
> +	/**
> +	 * @offset: offset into the resource;
> +	 * used when multiple packets of given type are used for migration
> +	 */
> +	u64 offset;
> +	/** @size: migration data size  */
> +	u64 size;
> +} __packed;
> +
> +/**
> + * struct xe_sriov_packet - Xe SR-IOV VF migration data packet
> + */
> +struct xe_sriov_packet {
> +	/** @xe: the PF &xe_device this data packet belongs to */
> +	struct xe_device *xe;
> +	/** @vaddr: CPU pointer to payload data */
> +	void *vaddr;
> +	/** @remaining: payload data remaining */
> +	size_t remaining;
> +	/** @hdr_remaining: header data remaining */
> +	size_t hdr_remaining;
> +	union {
> +		/** @bo: Buffer object with migration data */
> +		struct xe_bo *bo;
> +		/** @buff: Buffer with migration data */
> +		void *buff;
> +	};

missing kernel-doc for hdr

> +	struct xe_sriov_packet_hdr hdr;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 8c523c392f98b..11bc2e33373c8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -3,8 +3,37 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_packet_types.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct xe_sriov_migration_state *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_waitqueue() - Get waitqueue for migration.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: pointer to the migration waitqueue.
> + */
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> +{
> +	return &pf_pick_migration(xe, vfid)->wq;
> +}
>  
>  /**
>   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> @@ -33,9 +62,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
>   */
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
> +	unsigned int n, totalvfs;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
>  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	if (!xe_sriov_pf_migration_supported(xe))
> +		return 0;
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
> +
> +		init_waitqueue_head(&migration->wq);
> +	}
>  
>  	return 0;
>  }
> +
> +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid) ||
> +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid) ||
> +		    !xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct xe_sriov_packet *
> +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_packet *data;
> +	bool more_data = false;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> +		if (data && PTR_ERR(data) != EAGAIN)
> +			return data;
> +		if (PTR_ERR(data) == -EAGAIN)
> +			more_data = true;
> +	}
> +
> +	if (!more_data)
> +		return NULL;
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * If there is no migration data to process, wait until more data is available.
> + *
> + * Return: Pointer to &xe_sriov_packet on success,
> + *	   NULL if ring is empty and no more migration data is expected,
> + *	   ERR_PTR value in case of error.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +struct xe_sriov_packet *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
> +	struct xe_sriov_packet *data;
> +	int ret;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for (;;) {
> +		data = pf_migration_consume(xe, vfid);
> +		if (PTR_ERR(data) != -EAGAIN)
> +			break;
> +
> +		ret = wait_event_interruptible(migration->wq,
> +					       pf_migration_data_ready(xe, vfid));
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @data: Pointer to &xe_sriov_packet
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the underlying data structure is full, wait until there is space.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_packet *data)
> +{
> +	struct xe_gt *gt;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +

shouldn't we also check hdr.version here? and abort early if hdr.type is 0?

> +	gt = xe_device_get_gt(xe, data->hdr.gt_id);
> +	if (!gt || data->hdr.tile_id != gt->tile->id) {
> +		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> +					 vfid, data->hdr.tile_id, data->hdr.gt_id);

hmm, the message will look like:

	[ ] xe 0000:00:00.0: [drm] *ERROR* PF: VF%d Invalid GT - tile:%u, GT:%u

so it could be hard to match it with the RESTORE operation, so maybe:

	"Received invalid restore packet for VF%u (tile:%u, GT:%u)"
or
	"Received invalid restore packet for VF%u (ver:%u type:%u tile:%u, GT:%u)"

> +		return -EINVAL;
> +	}
> +
> +	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index d2b4a24165438..d48ff2ecc2308 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -7,10 +7,17 @@
>  #define _XE_SRIOV_PF_MIGRATION_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  struct xe_device;
> +struct xe_sriov_packet;
>  
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_packet *data);
> +struct xe_sriov_packet *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 43ca60b8982c7..5f2062c8c0c42 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  /**
>   * struct xe_sriov_pf_migration - Xe device level VF migration data
> @@ -16,4 +17,12 @@ struct xe_sriov_pf_migration {
>  	bool supported;
>  };
>  
> +/**
> + * struct xe_sriov_migration_state - Per VF device-level migration related data
> + */
> +struct xe_sriov_migration_state {
> +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> +	wait_queue_head_t wq;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index b15d8ca2894c2..d1af2c0aef866 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -24,6 +24,8 @@ struct xe_sriov_metadata {
>  
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_sriov_pf_service_version version;
> +	/** @migration: migration state */
> +	struct xe_sriov_migration_state migration;
>  };
>  
>  /**

the rest LGTM, so with at least kernel-doc fixed/error message improved,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

