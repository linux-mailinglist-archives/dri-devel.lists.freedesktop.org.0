Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D424AD8FA1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657EE10E9E6;
	Fri, 13 Jun 2025 14:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0RwtgfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C841610E030;
 Fri, 13 Jun 2025 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749825297; x=1781361297;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=70rHPla6OTyLbWXy+O5zKVAdoVD5ttX5MF/K+G/rQUk=;
 b=N0RwtgfQriLFx+r0NUP2v+F3qucGr+gH14XMcO/K9etM4GsYd60FmmEH
 1aJ98IdcpjBWM3FOxdNe4rapXjtC8fRkG6QJoSZ5ZpKztEeOhe022E6As
 ilXkSg+TsidwDkvoErIkzZUh85Lvl3GUFLgjCbTe7/HuPmY4QMkL4UIyk
 b0HZ+zXe08srH/4rdtCK+zMYE7PrGkZa5e2UntUr8zGyUck5pgxB/3TI3
 NOxRB4ah32zk/z5oKTYndv8/T/e8CCeoFmbbAgwWUKIthQJEPufbHFsMM
 VNI+Mb6C1K1KqklosEnNzxwft7eb8vMd76Q0JayGVXg7NgsDg6Lef5JuX Q==;
X-CSE-ConnectionGUID: HYAEoZwCQRSkOhOORcvv/w==
X-CSE-MsgGUID: t8muE3duSJ2NXdcEoBOJEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63395236"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63395236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:34:56 -0700
X-CSE-ConnectionGUID: bKVivSiIRKOrPCZggulc1w==
X-CSE-MsgGUID: noeRWCNRS0WWtMLUeWuksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="185090023"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:34:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:34:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 07:34:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHZ9IS204gnpOZs3JJOpMNg7SGFePWHV1qWjL59p0ESqSgtd6QMRiT/GVEROc/IloDHoX1YcQbZLcBLxpDz22SxOHLbo3wqoHf7JZYkuWweDwvqRlH0AWUjP4irKniPggi3sdQg+RdCChgQj2VNds5pv9X0vm94RC47qq1vzUimL18GiCg//oZK7aOa7RK0q9MgKjCDUbtZUU7+DhuQkyXxeT0oyDQyJg8vhBkC8NkQM0NknwrFcs+EAbreKanEF2l8CvVxuhs5RluhlAe+VDYPiQct6o5tBODKqI0uta6/TB63HiQndbgaLka99Q/s+j5me0enfA+OL6xPkxAfTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXTjvhkvdllGCd5xNqHcE7TxnI4suMkiqYPLjNrKfSY=;
 b=aFr60jZ5E3SL1I9zIGa53EB8Yao3YU6CVA6h/L55CSveLTe4/Jlrn7HY2lxZbTM9cDintC2VDz2ewelRq8PCjAGPFhGJAplzzghG0bJ0VMzoOrYMO7ln5D7iHIZ0xThXevokNkAJpgbT8bf2CI08tp8MYNE4IXz/s0evDW3ywqnHun/3HKjBLnnkqYesm1gp+VCaJIRhNzsR3QbsDb01SDh/XMZp7JkT0UuW9f/LS2TzNH70yp8RIWoW/6jBCTiv9+seMYcJz6TK5wgKo97vOzdlDtSZnWR1jRLVD4l4Pl3lMaU+L0xhCH0TOkesPW/zK5iNZX8lA/pCUQRQ43P1eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF97A7CBDC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:34:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:34:52 +0000
Date: Fri, 13 Jun 2025 09:34:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Yiwei Zhang <zzyiwei@google.com>, Juston Li <justonli@chromium.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
Message-ID: <fpet5xjk7gqmqc7u4llr5v4eahfdayzcxqzp6o76l66jv4cu3w@ye2r3maxj2vh>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
 <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
 <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
 <3663ab48-6ac6-4903-aa08-f93c7b71ebf2@igalia.com>
 <yudr4466kytpf2l7jfu4oz3txismnupdlxk6fx3bxa5elweqdr@wmgeyur445pj>
 <fbc3d126-499e-4f7f-91d8-ce6bc80ae21e@igalia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc3d126-499e-4f7f-91d8-ce6bc80ae21e@igalia.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF97A7CBDC1:EE_
X-MS-Office365-Filtering-Correlation-Id: c804e1bd-530c-4abd-cc97-08ddaa877566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3lDaUpuQ2FvOEwvazNHcG1jQnZBNW4wajN6bGlYWnJmWUpFMW9RNU9xeEh4?=
 =?utf-8?B?NUVVZVoxN2E0NE5CZ2RNZnVEekhWZEhmcmVFeEVYZHVkNE55TGU2RGtleVhj?=
 =?utf-8?B?bm1xL2xJYXJFQXBLRENxRFpwUC9yRzNvaytOMUZocHpGL2J4akpYZkgwMFFV?=
 =?utf-8?B?RTQrYzJFK01DeVkvZTZNRUJRaGV3SFNZYnZTSGhIN0NtRW9GYXkxZGs5dzBD?=
 =?utf-8?B?aDhjNGorTUwrOHh0alFUVmNBbW05UkdLR0J0NjY2L05pODd4VU9zQUIxdGxW?=
 =?utf-8?B?M2ttb2hjcTVZcjJWNGlOT2gwUEtPMDhTeGVsYndDLzJHLzNyRStSY1J5Z3BN?=
 =?utf-8?B?T2htQmtCcXZGK0pXcXpxRjhiZk1yZ2VaYi9uUE16WGhkSS85OWNidDlxSUdl?=
 =?utf-8?B?RXdWU0lwd0tQWGFOTVRXKy95enpTVThNTGYxL1RNWk9hRWswVk1iQ05TcnQ1?=
 =?utf-8?B?d1ZHZDFSbk9DWWI5RFZrUzZqcTIvSFhwRnVpbDVsUkNCbGVYRU1wTVpRbFJl?=
 =?utf-8?B?R1hrRjRaVCtaMXpGZ2UvaVNxTkh3ZVBSZXJCRHduOTdhK09CeDN0VkRhbHEr?=
 =?utf-8?B?UHlobXQ3bERGRDkzVmUzR211MHhURGh1R3lSL09kb1RHeEx4UDFzd0lQVWwx?=
 =?utf-8?B?ZSt5ck5WLzRrMk11eTFiQk90Y2FKcURFWG13Qzh1TlpEWlYvU2xHQW16SzRX?=
 =?utf-8?B?amdrVTlvV0JZL3ZWdC82akVkTDBZd2NUTmU0ZytENFJxQmZwaWVwbVlHcnRj?=
 =?utf-8?B?UTcvZzVRYnNScXZqSDlJT05NZXkraWlDVjFQMUtjbndIWmppNmR4S2lBRWR5?=
 =?utf-8?B?RjIwTU1sN1dUdFFZcFhVaHNXNmV3VkpOM1pidnJROCtYS3k5cXd3a1lJckY1?=
 =?utf-8?B?emwza1ZxL0c5TWtUOW5RQjFWN1ZXMlVkNHQxR2U4eWQ4YU9CY1lYQTI2bE5I?=
 =?utf-8?B?NXdHd0ZNbzNQNDRwYUxTSzlPamxxU1pYZzhySytYdmlmczNmeG9jbmgxSHVl?=
 =?utf-8?B?WkF4d2RyZXkwN2dJOUFNTE9IajB2UDNrTytQL1VqSndod1VzNlQycGlMVHhB?=
 =?utf-8?B?bThLSlF6UGpvMDlOc3VXSXFVK3hWdkpEUjgzMTFaNFJVNkpXZUFmWVhWVWtq?=
 =?utf-8?B?VW5oTkgvUXNwZUpLUXlGbHkzV2FsL3VRYzZ2bml4NUk4R0hWa2gzaW5pa2ZI?=
 =?utf-8?B?WWx0Y0hzd3k2OW5rUUFjcWRKekthSmVsOHNMUFlNZzBjYWFNT1dMWGFiU3ha?=
 =?utf-8?B?a3pYS0thQnlHZzdkUW0xeWlQVGprcW42ZWtEa0FrekNtVXlQYUdqRWZVM3JQ?=
 =?utf-8?B?Zi9MNE1rSWhnb2VKdkc2czJkREJjdkJQTW4wTURoNG90dnRQZVBPZGMwZExX?=
 =?utf-8?B?VFVZQUhsWFp4N0dTRWFHNTBmeEdBaU5tQVRIYlkvK3VySzl5MkpJTWFTMU4v?=
 =?utf-8?B?d0w4cjY3K2ZPZVZrRUlPYjRmR3NNUmkwWndFTjFPU1hBc0NaSEU2L09QQXZj?=
 =?utf-8?B?NllteitiWXB3MHZtOG5qaWdLNkFVM2pLeE83K2FwMmFxTWFyNHB0ZlBBcXlv?=
 =?utf-8?B?MTc5WkFOY2M1ZGFXOFUwSWR1dzd3QU5mczd0TXRMd1QwaW43UU83ajc1ZUp4?=
 =?utf-8?B?YkFnNW1JT3ZMczFFYXpSOUtqOUNNOUxNNEJxOWVOMGg0WkV3a3prc1hER0Rk?=
 =?utf-8?B?eGxIYW1PQjNLZjBnelMvbzVSSmc5cnk2cWNBWE12Mjd3ZFVwZUdvWFpYQTZj?=
 =?utf-8?B?OVVzeXBxOHdqRUtQTFZmSEJwMXRPdmM2R2pPTkJYTktjbkVlSXM5VWtzenlx?=
 =?utf-8?B?cHFSRlgyQlF4ZkVVNWtnSEhDVGU0MkpxM0VQMk13Zkl5RG9iYjZhZ1JTcVlX?=
 =?utf-8?B?aUozZzZIYkFxZldwSkJVVTRNcUpacmFiNXF0U3RoUUlYWjJYTEN4bERIenZy?=
 =?utf-8?Q?cQG0YOrTRy4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm9yMnhZNU5vTjVsQVdpK3RYN1B2Vks2dzlaUnN3UTJXZGhYWTY3bmFyemZ1?=
 =?utf-8?B?S0t5ZkVhT3BheVBzVjlzNW0yaVVRdnFHbkdaY0t0bDJHSU1uVzNxb3NPTUZz?=
 =?utf-8?B?d2lIbjh2aWZtMmtuVnk4ZFlxTHk4bXlVQ1lseDZ0dEdEbndDbHFQOVRFY2tL?=
 =?utf-8?B?WlF5UTg1b0pza1krKy9yOU4xYWJXSU5nTTBjZ1ZldER4MVFjd2dpNmVtRE9T?=
 =?utf-8?B?b2JGdU1xZHdzUDMxUzZJNWFIZTdHWkY3a2hJZVp6WmxnQlE5S3JpRzVid2NO?=
 =?utf-8?B?cFRhcFQrUFlwazd5TUpYM2gyYmxWVE1tUjhzUEdhQzhXU2xEUzFUNC9YNmVm?=
 =?utf-8?B?aTBMdVMxSjRwUUQyaWZhUWJRVk5GL09ZN2ZCdDVwSU5CUHhpNlFibGsvajV4?=
 =?utf-8?B?bDM2UENpRkdkck5wWlYyTUU1QnFqaFMrQTYyczNyaEp5QlpXRXNPeG5JUW11?=
 =?utf-8?B?aXJkeWg2RUNIcW5pRHRXRkdpdmVTTVhiejZ5czdCT3BMU2pBS3JGdFVWT2xF?=
 =?utf-8?B?S0VsaXFiOG9xVGFVcWRXSXlreFIyN2NRQ0Rod0Q0MXFaK2g3Sk9LY3JaZ3pu?=
 =?utf-8?B?YUZaa0xBOWc5bWJYN3pwaUtCWkRlVk4wV2xSeGl0R0QwajE0V0IxTkRBOExL?=
 =?utf-8?B?NEhRL0o1Rk5CUi9VRlRNUjBIbUg2enlESHZXWHdaVEROR0J1WU9hNlJEc0lw?=
 =?utf-8?B?NnEwK0pTV3d3MWcydVJ6aFVBY1hLa0Rrc0g2RVBwTUgyOUlKbVpNZ2lNYVpx?=
 =?utf-8?B?NXJOSVZJOVZZTlI4WVBNczhpSnMwYjRMMWNWZ3p0akxFWHNmYmx0aXM5WE9s?=
 =?utf-8?B?ZmpyRHo5SVB2ckw5a1l1TjczUTk3bjRCSVpWcDVjNkQveVRYR1dDR1VUYTJu?=
 =?utf-8?B?RW5PUFdsV2tYTGx1SDJITjRTOUNKZTdjMjJpajd0SHIvSFBlT3RrQ2c5QXFk?=
 =?utf-8?B?b0VvRWpvR2ZLOFU3STV3RzM1TGYwU002M1ZRNE50SFFYZnlPdWdyR08vRkY5?=
 =?utf-8?B?ZTgxeWZVeXJWMlI0STJxeVM4YkhQM3NlNlV2SGNGOEVmTUs0WXZsNGNIdkxs?=
 =?utf-8?B?RW4xbE9sQm5VM01aZTFDQmVqUndtTHYrZG51YkNIcHd5MWdleVVYU08rUUtB?=
 =?utf-8?B?U080dmR2UWQveVVMd2tOenhmWm40Z00zUStTTXFxT0lNek9kZWRYcDFpOUtM?=
 =?utf-8?B?d2diSnlwSFIzWVVneDR0QXQ0SGJ1ekhuWGJUekJNdTVoNndydFFEMmM1bHV0?=
 =?utf-8?B?TlNwL3BCMzRaYk43QWdPSlQzYzNFRmNGVHlLMUlZZUNXQ2RDMWFpb2lMZ3Y1?=
 =?utf-8?B?VjVad1lldEUxYlFjQlY0clZobFl0a1lyTC8wOGtHbmlLODBRczNHc0ZVdlU2?=
 =?utf-8?B?TEZYY1ZGREpueThnWERNQmNXTWFzUmhwWVJsL0RYTCs1ZVBSMG8waitYbzFx?=
 =?utf-8?B?ZStXcG9aUFROS1JpamhsQk1GNm92TCtKVjhGL2FoZDRCeGloRjVDSHJWMkdk?=
 =?utf-8?B?ZDJPS2Rmd0RWbGRJWGRna3NoQVRjYThDSVQva1dpVFVLTHpyOEJTYXFtbHpJ?=
 =?utf-8?B?S24wWlhaZmFJUmF2eVJuNWxpdU90SndFd0xacGgrWVBmZUNIZWh2azZrdytR?=
 =?utf-8?B?aDhESzE1RU16TExuZlVWSHljeGVsWC9LbXNUL1RSNk15ak5CRW5McERRTlB4?=
 =?utf-8?B?QnNHZ2xpUjk0SWw1M0RTVnpyQWwvY1g3dDNSNzJTa0tMaFhHNXBpUmU2c0Jw?=
 =?utf-8?B?NkVYenlRc0NNdEpiR2hwUlJzeFZJVkU2OXF5V1U0RS9ENllVTCs0WHBXa2sz?=
 =?utf-8?B?MlNod1RTRHE4b1E4ZHg1RmZKVkJYMDkvZDVKVnFtTHJXaWNmeFlLSFBEeHM3?=
 =?utf-8?B?cmVVVEkxQWRDeVNwUFhUVGlKM0RYeGxXdzlCT0hySUZkTDdYUTJXNml6dVdC?=
 =?utf-8?B?eldrcy95azdqTDdvZGlyR1pkUWlBZGd0N0UyNDRFM3NmOGwwWnFoTmlpNVFP?=
 =?utf-8?B?UWplVFpzZnBnSVRIZzZHOGJjanBFdkRPVTRldStSOHJOcnRscVphZFcwenB2?=
 =?utf-8?B?bko1MHZmMzRqT0hQL2RmNForTXRtU05kUjg2NExzcGlxRDI4MWJuZ1V5QVBr?=
 =?utf-8?B?TDNOQnY4NHJzdzVHZkNBV2I2QlY3Ry8yYi9HVzdVSTZPcGhkRjhJVXFrWUtD?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c804e1bd-530c-4abd-cc97-08ddaa877566
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:34:52.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6F8kU2aIBCO7gXlKp5GGt/4kRagKOvk3U1bA7VQdzHhgZMCw0GnLqvwXC2e7LFWYNeh/jQNqbu/rHFIyte1CQ7u9PNiBxQ0JMecb/Mp9+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF97A7CBDC1
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

On Fri, Jun 13, 2025 at 03:14:24PM +0100, Tvrtko Ursulin wrote:
>
>On 13/06/2025 15:10, Lucas De Marchi wrote:
>>On Fri, Jun 13, 2025 at 09:02:27AM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 12/06/2025 19:53, Yiwei Zhang wrote:
>>>>On Thu, Jun 12, 2025 at 11:02 AM Lucas De Marchi
>>>><lucas.demarchi@intel.com> wrote:
>>>>>
>>>>>On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>>On 12/06/2025 06:40, Lucas De Marchi wrote:
>>>>>>>On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
>>>>>>>>Add TRACE_GPU_MEM tracepoints for tracking global and 
>>>>>>>>per-process GPU
>>>>>>>>memory usage.
>>>>>>>>
>>>>>>>>These are required by VSR on Android 12+ for reporting 
>>>>>>>>GPU driver memory
>>>>>>>>allocations.
>>>>>>>>
>>>>>>>>v3:
>>>>>>>>- Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>>>>>>>> per-driver Kconfig (Lucas)
>>>>>>>>
>>>>>>>>v2:
>>>>>>>>- Use u64 as preferred by checkpatch (Tvrtko)
>>>>>>>>- Fix errors in comments/Kconfig description (Tvrtko)
>>>>>>>>- drop redundant "CONFIG" in Kconfig
>>>>>>>>
>>>>>>>>Signed-off-by: Juston Li <justonli@chromium.org>
>>>>>>>>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>>---
>>>>>>>>drivers/gpu/drm/xe/xe_bo.c           | 47 
>>>>>>>>+++++++++++++++++++++++ +++++
>>>>>>>>drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>>>>>>>>2 files changed, 63 insertions(+)
>>>>>>>>
>>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>>index 4e39188a021ab..89a3d23e3b800 100644
>>>>>>>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>>@@ -19,6 +19,8 @@
>>>>>>>>
>>>>>>>>#include <kunit/static_stub.h>
>>>>>>>>
>>>>>>>>+#include <trace/events/gpu_mem.h>
>>>>>>>>+
>>>>>>>>#include "xe_device.h"
>>>>>>>>#include "xe_dma_buf.h"
>>>>>>>>#include "xe_drm_client.h"
>>>>>>>>@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct
>>>>>>>>xe_device *xe, struct ttm_tt *tt)
>>>>>>>>       xe_shrinker_mod_pages(xe->mem.shrinker, 
>>>>>>>>-(long)tt- >num_pages, 0);
>>>>>>>>}
>>>>>>>>
>>>>>>>>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>>>>>>>>+static void update_global_total_pages(struct ttm_device *ttm_dev,
>>>>>>>>long num_pages)
>>>>>>>>+{
>>>>>>>>+    struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>>>>>>>>+    u64 global_total_pages =
>>>>>>>>+        atomic64_add_return(num_pages, &xe->global_total_pages);
>>>>>>>>+
>>>>>>>>+    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>>>>>>>>+}
>>>>>>>>+
>>>>>>>>+static void update_process_mem(struct drm_file *file, ssize_t size)
>>>>>>>>+{
>>>>>>>>+    struct xe_file *xef = to_xe_file(file);
>>>>>>>>+    u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>>>>>>>>+
>>>>>>>>+    rcu_read_lock(); /* Locks file->pid! */
>>>>>>>>+    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)),
>>>>>>>>process_mem);
>>>>>>>
>>>>>>>Isn't the first arg supposed to be the gpu id? Doesn't this become
>>>>>>>invalid when I have e.g. LNL + BMG and the trace is enabled?
>>>>>>
>>>>>>Good point.
>>>>>>
>>>>>>u32 gpu_id does not seem possible to map to anything useful.
>>>>>
>>>>>maybe minor_id? although I'm not sure if the intention is to share this
>>>>>outside drm as seems the case.
>>>>
>>>>Yes, that was for render minor in the case of drm.
>>>
>>>Or to keep the field as integer we can use dev->primary->index, 
>>>which would then correlate with the /sys/class/drm/card%u, in case 
>>>it needs to be mapped back.
>>>
>>>There is prior art in various drivers to use either dev_name or 
>>>dev- >primary->index, but for this one it is probably easier to 
>>>stick with the integer so both msm can keep passing the zero and 
>>>we don't
>>
>>both msm?  In xe we'd use dev->primary->index, right?
>
>Right. I could have used some punctuation. Both as in 1) msm can keep 
>passing hardcoded zero, 2) we don't have to even start thinking about 
>Android userspace compatibility.

ah.. ok, misunderstood that. Makes sense.

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>Lucas De Marchi
>>
>>>have to think about Android userspace forward/backward compatibility.
>>>
>>>Regards,
>>>
>>>Tvrtko
>>>
>>>>
>>>>>
>>>>>>
>>>>>>Shall we replace it with a string obtained from dev_name(struct device
>>>>>>*) ? As only Android parses them I think we can get still away with
>>>>>>changing the tracepoints ABI.
>>>>>
>>>>>works for me too. Is Android actually parsing it or just ignoring?
>>>>>Because afaics it's always 0 in msm.
>>>>
>>>>Android has used it as part of the bpf map key:
>>>>https://cs.android.com/android/platform/superproject/main/+/ 
>>>>main:frameworks/native/services/gpuservice/bpfprogs/gpuMem.c
>>>>
>>>>>
>>>>>Lucas De Marchi
>>>
>
