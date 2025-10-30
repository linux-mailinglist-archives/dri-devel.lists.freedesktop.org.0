Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1EC2241D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEFF10EA43;
	Thu, 30 Oct 2025 20:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHC3rDri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D49510EA41;
 Thu, 30 Oct 2025 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856359; x=1793392359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zfTnY9H2PGnyeRboOfo9gmNqKI2KPV5vRS5F94K79lM=;
 b=dHC3rDri5MqqmR18kP7x6PbEItbDwDMVvx+V5jg9Twjsl7To2WRAGx8Z
 uc2UWWGEkxtzhiikN48oG3TF9NaO0fdHpoosGAcQFjj+LZNolODwTAaov
 Ms9vI4dxHT50ZUrRkhjNFQsXv/Lfauum1m+ZYgaRXRJTY3SiANG6WY0Ra
 LMcgJN7asCCVA8tOVibmPtwEdNQkBUEtKGdrS3tqt2uvNxns6/RGqZ93h
 GNV0L2YFxYzXu+fUHzT6QWKAX+rYLPXvubdE7chxC+LCR/k1sIdMAgFMf
 udBUEmuk98MxaAH+P+F0BOChtB+SRSl0ix+nNHZJ2Sy6rv0SC6ji7cMht Q==;
X-CSE-ConnectionGUID: hCMpafiEQhS5GeugcH3a8Q==
X-CSE-MsgGUID: 7MHTCnlVS1avV2hRRUQDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67847721"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67847721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:39 -0700
X-CSE-ConnectionGUID: KRHkkr6uR5WRlvgnhRwyjQ==
X-CSE-MsgGUID: CtvaNLxAQ/CMxQjkxyIXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223284185"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGV+3pzP+1o1cTxgenwV2159BFc2DnEFf8KBnwrbmCiNRUTE6ydwTapxGi89MN8nuo2LQxJ4T9fbUKNmqNtw4FGzjyq9qzyTbp9vQavcRWEC9M5wvIeRfStWPdpzIBFn6J5gH8WIYWClQQA8FgZCTGm27p5KwW9NDTfEcIpdCWzmEMFCwVVzVbTyJVqAkW96UtPlIT+t7hGxj7o3HtFgE6GGxRwXNmekEDRmnzcTu1AvFrNS3xen4DD8/9jd9d2H+abtxPYqlAKhUa6pObXhfeVg1CAr02jQJQSA9F97MQrS0sGyo/9gwDqA7PhK2BTsk4ufB2e7VuVtjpUzsiwcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHXD1oKOpTowW3tNAkLG+HbBUFXbBLRjj08VrrkZs4s=;
 b=gJM0DacZ8Ur47G4vdmh9B2087cRdkDoJVdDaLqJslpB2lt6oxccoi1QH3xNgvGms4GiP9cKCkfdl/RbW53eGgFyk8pfEooRwSWS+ukbuBMRaQXDIKxIHAhq6RElkXEPAuzr6T2K6ZVVV3RzRO/pAXdan9bQBPIrOq8HbvpdwpkFleF13zq4vPR6xFUqwzn00AHInxykkFfXLFbykojkEd/uPwrOvPNH6p9sP1LPIslmJAFVjI7rb5vEaCoQlqScdq1F77xIxmJFDZ428ZoOiMhSD9aPKgnYk2K0LdHCQdkn23bp1RKuKi0yiobP0znis7cJYHTLO0tV4CdyMQzKPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:35 +0000
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
Subject: [PATCH v3 07/28] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
Date: Thu, 30 Oct 2025 21:31:14 +0100
Message-ID: <20251030203135.337696-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: f763cb2a-9e21-4342-24ed-08de17f37594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R29Sa24zTys3d09LZXZmeEN0WGtHSFlDNzA3cFlRMXRyRUFhVzRyeU9tMHlH?=
 =?utf-8?B?MEdyU0V4SmVqdXplekJMaFJrSXI5ZWlmd3k3VTByZDFSVkRHVlY1bi9NRS9S?=
 =?utf-8?B?dE5aVjJzQkZ6Q2hSM3MvYVlXcDd2WW9tWVgrekgweXZLSDJRUFdYUDZXU2Jm?=
 =?utf-8?B?NzVBQjdCalpXZGxwZDA4ZzBpdVV4RGxLZlhPL3RsU0EwcTA2UmhDemhHRlZ5?=
 =?utf-8?B?Q2IweFd0TTdzVVZLQmovUGJ0VjFJMENOUzFud2VOeEVwczh5emIwdDdtZ2lH?=
 =?utf-8?B?MEFBSmNoM21qb2dGMTQrOW9pbVhzNm5wcFZSVk5ucmVMWExuQ3F3a2cvY2ZG?=
 =?utf-8?B?YWFUN2tzUmlOZk1SVXVlUHJaZU1ubmxJdTJMNVNSNUR3V1Z5SzZiRnQxSFhQ?=
 =?utf-8?B?TWQzRW5abWpJMUxIOFlsV0Y0QThKUVFLT0tWQzVwaW1WajhNblc5QlE5ZERk?=
 =?utf-8?B?V3F5ZEV3R1N5cERwd0FTb2gyN3htOHBwTkg5UXdISkM3UmdMcGdwNUhSREIy?=
 =?utf-8?B?c3l6aEZsVWtNbTlURWRPU3Q2VGkyWFRnZXoyZ3dDVHFkOEVsUXlqSTRtNDJX?=
 =?utf-8?B?UEE5TUQwaC9ZSUtPajc2dTBWL1JKd0YyZHlqVHByQzRBbkFiTUMrdGhRU1dW?=
 =?utf-8?B?SmNCd3U4M0ZRT3VlUHNRNWllSlp3OUM1TG9Wc2FHZEFNR3RXNmg4TUp2aTJ1?=
 =?utf-8?B?N3dzMUY0V0lmNmx1UWFsNHBWQk0wY2w0OEZUSnNXUU9Ed0xaN1N4U0ptVTZp?=
 =?utf-8?B?VGVuNE1VZVF3MFNmc1RTQUg3Z0pKWVpvZkRRb28rT2RWTlFZMXJrdTJxOEZF?=
 =?utf-8?B?NVgrNVp2bUVaUDZuQyttZkNLNmlJVGlTQnZqenl5QUFVSG44d09YSytyN2VJ?=
 =?utf-8?B?UjRoNkx2L0tPOXFycTliUkxwbWZ3SVJUMEhZNDE1UlFTL0NKelNrTVl4eHFP?=
 =?utf-8?B?UVlPSkpaOTNIeE9zd0p5TnNpMTVqdFRNZWdUYUlIL0VmV0djR1dFWUtFU3lQ?=
 =?utf-8?B?RFcvcTRkSFI0NTdqeFFWNW5EWkhTYzBPSVFJbjBRQnIwdFJ2NTgvY2t2dXhk?=
 =?utf-8?B?U3gveiswajU0a1hUbVNDNnc5cjdEc3czVUlmeGhHUVltT090bmp0T0VrT3Ba?=
 =?utf-8?B?TmZQeEJ0TkxBKzhKTS9JVTZJaGhDYm1DZFhQNlBDaUcyWUM1QXpaa0tpSlpm?=
 =?utf-8?B?OTZJRTlpR04rVjZmdFd4cFNiYXUzVDVwV2ZhenBzTFZzYzJiclNqaWFYNk0r?=
 =?utf-8?B?UHc0Q0hDdzNIQzREdDhhZmpaUE1RaFFtMFh0WkJkYXo1cEFjc09xdGc1VDRk?=
 =?utf-8?B?OGpoYlhXVXc2L0MzWFJ4TnBPT0Q0clpDaFppMHdoK0dqeEtkNTE4NCs3YlhI?=
 =?utf-8?B?Mi9kZDgvejFkbzdOUUx0K0RsM1FUdkVJR3JsQjd5Q3plbnp5QWcvSGpYMEI0?=
 =?utf-8?B?dW1IMjlrWmNtZmN1dEhBZ0VqaGJDajFrYklqblFWU3NWdmNSRFdicHZXL28w?=
 =?utf-8?B?NTJ2ZUNuNDJHcUNKTVJoc3ltNitMdG93cFBKWTRLVFNLSGpQRWd0b3dOd1N6?=
 =?utf-8?B?LzVIMTVFcXhrRTk4Y1BQNzhqanVUVTlQTXU4aU9PNW9aUTlUTzVjZU1DMTl3?=
 =?utf-8?B?by95UE5zZWcvVXBpRGdOd0lWb2xZMVF0Szg3UU5ObFlhaE9LVE1sTnN0N2FI?=
 =?utf-8?B?c2NiOVFlTngwcHRGREFYYlplUHlOQTM3NDlFd2Z4QmZncFBCbWVYMjNDWGhQ?=
 =?utf-8?B?ZXNjd3ZKYnluUlgvMUJOdHZlYm44bzdwMjBLUVBHWFUvNkhSR2tBZDZOczhE?=
 =?utf-8?B?RnE3MUVib0xUVnl6aUtCeGUvNkpibXJxTWQ5djAwY2hGMXZZR3ZoMlIyR0lh?=
 =?utf-8?B?NEhkaXZkbmRWSE41V2NVTG9iZnJGeTBnNEl1b3Npa3hOS1VvSnFWbVpmcDla?=
 =?utf-8?B?dldOZGxaVE1mWEZiZW5rYTJBWkJTS0lxU25yeGdBSnVya0czY05rRDlnOEx4?=
 =?utf-8?Q?l6SGfA1cfxV7wyeM8zCn+jc6QYBQvQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0EzVTBybE0renFTbm1sRVRtWlloQmdJdnZrUGh4SzFRY2dmYk1mNzFvV21U?=
 =?utf-8?B?ZjJjdXlHZWFnNVNOUlAyZlhDWktzL0oyNGRvMjcvMXpCdUovV25MVjFGbGUx?=
 =?utf-8?B?SlpFNi81WUgrQzE5VTNzalhtS0ZxVC9MTGV6UEhqbWdWanF2N0dDZno0bjI0?=
 =?utf-8?B?R2o2dUg4bHFPL2Q0cmRvR3RzeU1EeVI3Q3dWVEk1N3YxNUxZVWVEcnlIN0tH?=
 =?utf-8?B?dXNOdFg5dWUzaWw1TnVhL1pRQkFvVy9ES2lMQzFmb2FTZTRpaDl5OWVGMXJy?=
 =?utf-8?B?M1Zud1dHNWNOTFlSb0x5Qms3M2Z2OXhKbm9tV1l3VmRJRHlCcjZkcndkYzF0?=
 =?utf-8?B?UE84Tlh3ci95ZVRVaVV4YlVnQyszRmE3VDM0Y3ZmeHB5RGtwQzB6dk1acDdj?=
 =?utf-8?B?aitaYWZMS29yMGJPZCtHSXV5VUJOSEZ3d1F3dzluSmhOYUh0U00wWmVvbmJh?=
 =?utf-8?B?d2pJOFVyeTBEdGxPVFJSL0tKb0RpWHFZcm1tNHU5RnljWkdtdHRaekhHZ2hJ?=
 =?utf-8?B?WFFLWkc1dGpLc3hHUlpIR0ZqUUtlZHdYZXpPR2NDd25iVThGN2hXVU1NTVl1?=
 =?utf-8?B?YzdFODluWmx2ZjJJTnFMMFJsQ2VQOUNtaFZrU3dWSEcrd2d2MGFGeW53OTAv?=
 =?utf-8?B?bExtSm45RGhTRkVYQlpkcHFyWXpUTU9UL201bUdwNm1hZ1R3K0l1WUh0cU00?=
 =?utf-8?B?UlFXRmF0YjVPN1AxK0FSTU5oT3ZPTmk0VWhUWk9ZVi9hZDhmS3gzNVJpTVBW?=
 =?utf-8?B?VURBY29NbGdzUXhiQm00VjhRQTNUbmdOczZWL0lETm1Ucnp2WTlTOTBmQVpk?=
 =?utf-8?B?bmd2RVlkN2ltWG8zYmtRcDQ2ditKZWc2U0FYeDl4MnBNT3p5citabGZFeGRs?=
 =?utf-8?B?ZjZWRWRzT2NiOHFocEVnOStBcVpkbkluVm1NamNZWitiZnBleEdEMEdoeGZY?=
 =?utf-8?B?YytMellGVFhENGhTSS9DVC9hZld1SG1aM1czQWxGeUJ6VDlXVUJKUGtxOTJH?=
 =?utf-8?B?RTEwQkhXZHMxNkYrY0lENW9TZThHMm9kVzJQRWVHQ2JnWUdaMTJtRDZQQ2xK?=
 =?utf-8?B?bjJVUXVxRkJSUG85VUZqMk5tVWVxS1FHcEpQelRwakFFUzMxbkNkRkFhSnpL?=
 =?utf-8?B?NUZvM1VOaGxoOWZKV3NzSkV4Ynd4TGdKczJmVnNSTkhGNFRnK3lpRE9VbDhm?=
 =?utf-8?B?UEJMdVRoOTU1Q0FveXhHV1BmQUxjNmorQzF4aHNkTFBheURiYlBqa3ZLUGFo?=
 =?utf-8?B?dEIrQWNuMlFYdnJuRnc3VEhQSEh4T3FoRUZhTVdZbFlWeVU1amwwYWtLM1NW?=
 =?utf-8?B?MHJWbFhFR0tQSXFBYWV3bjlOeWl3TFN4YzJVb0R3b0ZabU4rQklSNnYzQTJ4?=
 =?utf-8?B?ZVViZUlDemkyQnJWRis0UlBueW1ubmZmeU5PRHg3RFpKcmV4Sk9pejdoTjA3?=
 =?utf-8?B?dFZPaUJ0NGkxdCs2ZGU1TVRETVoySmNlcVQwSzBZZWtod3o5N0tIcW4xamVz?=
 =?utf-8?B?MlgxTGhVemYwczhvQldmZ1YxQWtvUmovM0ZjSHVXWXl5WENyREtzQkNFVGRv?=
 =?utf-8?B?dXBUUVdOTWI3Rk10MGwzTjB0R1JhL3gycFVBK2h4cURrcnhRVDVaRWNVUzlB?=
 =?utf-8?B?U3RpQzNtRWtXemVXUWRrS0V5Y1pPTDAwVFhDaGFxd0pndG1kMU4waGtqTWZu?=
 =?utf-8?B?alJUSzk2dm1KSlNFN29mczRnbHREdTRzT0VnUDRobWcycUM2WVhwOWpxQmtI?=
 =?utf-8?B?UUpwMmpma1A4YkVCd1BGdndlYWhuSkFPOWFWRE43TkNHNFVESkIyOWJKaldq?=
 =?utf-8?B?Ni9JZjd1cUJBMHBkYjhkUEJSVG9za1FMSlRjVDRza1c5bHQyalFnbllTKzlv?=
 =?utf-8?B?YkxLK0xSYU11SWEzSWdhWWpydnlzY3hvbVVSNWh0R1VXbDdmZm5JL21DY2Iz?=
 =?utf-8?B?ZzdPTExqWmtvRlFPU0NVd1F4Y2srb1Z6ZkRqWi9Ud05aSjIrdkE3ZFRrVTJ4?=
 =?utf-8?B?MzNtclFuSjlPZjRVa3R5WGhZYmM5UUFnTHg3RFdlbjlBVWtvdzRPRklxMlAy?=
 =?utf-8?B?eGFMTjRLQ3Z3ZmY3bU1ZZFB1RkdEOG1ZLzdVcjhMUkoyYVpoWnpxdlNiNnNv?=
 =?utf-8?B?b0VGVk9KNnVIaWsrQmpUZW81eGRUTWlIL0tCT3g0bVU0OEVNelVuVi9RNG85?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f763cb2a-9e21-4342-24ed-08de17f37594
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:35.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzlCuiJaDMA3idskBapMJ9NbYzmZm5CUWBHJvMCwpT8ucvjh0+7aQ/0o7VQ9iV+unTVQKtYKLYVCS8YUy+CI2xhj+Dyic2x5Z22ZTfl7Kuo=
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

Add debugfs handlers for migration state and handle bitstream
.read()/.write() to convert from bitstream to/from migration data
packets.
As descriptor/trailer are handled at this layer - add handling for both
save and restore side.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 337 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_migration_data.h  |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  54 +++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 6 files changed, 445 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
index 2371ca3e6b9a9..a3f50836adc81 100644
--- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
@@ -6,6 +6,45 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_sriov_migration_data.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration.lock;
+}
+
+static struct xe_sriov_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.pending;
+}
+
+static struct xe_sriov_migration_data **
+pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
+}
+
+static struct xe_sriov_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.trailer;
+}
 
 static bool data_needs_bo(struct xe_sriov_migration_data *data)
 {
@@ -42,6 +81,9 @@ struct xe_sriov_migration_data *xe_sriov_migration_data_alloc(struct xe_device *
  */
 void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
 {
+	if (IS_ERR_OR_NULL(data))
+		return;
+
 	if (data_needs_bo(data))
 		xe_bo_unpin_map_no_vm(data->bo);
 	else
@@ -124,3 +166,298 @@ int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
 
 	return mig_data_init(data);
 }
+
+static ssize_t vf_mig_data_hdr_read(struct xe_sriov_migration_data *data,
+				    char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+
+	if (!data->hdr_remaining)
+		return -EINVAL;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	return len;
+}
+
+static ssize_t vf_mig_data_read(struct xe_sriov_migration_data *data,
+				char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t __vf_mig_data_read_single(struct xe_sriov_migration_data **data,
+					 unsigned int vfid, char __user *buf, size_t len)
+{
+	ssize_t copied = 0;
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_data_hdr_read(*data, buf, len);
+	else
+		copied = vf_mig_data_read(*data, buf, len);
+
+	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
+		xe_sriov_migration_data_free(*data);
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+static struct xe_sriov_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **data;
+
+	data = pf_pick_descriptor(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_pending(xe, vfid);
+	if (!*data)
+		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_trailer(xe, vfid);
+	if (*data)
+		return data;
+
+	return ERR_PTR(-ENODATA);
+}
+
+static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
+				       char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_data **data = vf_mig_pick_data(xe, vfid);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return __vf_mig_data_read_single(data, vfid, buf, len);
+}
+
+/**
+ * xe_sriov_migration_data_read() - Read migration data from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
+				     char __user *buf, size_t len)
+{
+	ssize_t ret, consumed = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		while (consumed < len) {
+			ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
+			if (ret == -ENODATA)
+				break;
+			if (ret < 0)
+				return ret;
+
+			consumed += ret;
+			buf += ret;
+		}
+	}
+
+	return consumed;
+}
+
+static ssize_t vf_mig_hdr_write(struct xe_sriov_migration_data *data,
+				const char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+	int ret;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_from_user((void *)&data->hdr + offset, buf, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	if (!data->hdr_remaining) {
+		ret = xe_sriov_migration_data_init_from_hdr(data);
+		if (ret)
+			return ret;
+	}
+
+	return len;
+}
+
+static ssize_t vf_mig_data_write(struct xe_sriov_migration_data *data,
+				 const char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
+					const char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
+	int ret;
+	ssize_t copied;
+
+	if (IS_ERR_OR_NULL(*data)) {
+		*data = xe_sriov_migration_data_alloc(xe);
+		if (!*data)
+			return -ENOMEM;
+	}
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_hdr_write(*data, buf, len);
+	else
+		copied = vf_mig_data_write(*data, buf, len);
+
+	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
+		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
+		if (ret) {
+			xe_sriov_migration_data_free(*data);
+			return ret;
+		}
+
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+/**
+ * xe_sriov_migration_data_write() - Write migration data to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
+				      const char __user *buf, size_t len)
+{
+	ssize_t ret, produced = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		while (produced < len) {
+			ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
+			if (ret < 0)
+				return ret;
+
+			produced += ret;
+			buf += ret;
+		}
+	}
+
+	return produced;
+}
+
+#define MIGRATION_DESCRIPTOR_DWORDS 0
+static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
+	struct xe_sriov_migration_data *data;
+	int ret;
+
+	data = xe_sriov_migration_data_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR,
+					   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
+	if (ret) {
+		xe_sriov_migration_data_free(data);
+		return ret;
+	}
+
+	*desc = data;
+
+	return 0;
+}
+
+static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
+
+	*data = NULL;
+}
+
+#define MIGRATION_TRAILER_SIZE 0
+static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_data **trailer = pf_pick_trailer(xe, vfid);
+	struct xe_sriov_migration_data *data;
+	int ret;
+
+	data = xe_sriov_migration_data_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
+					   0, MIGRATION_TRAILER_SIZE);
+	if (ret) {
+		xe_sriov_migration_data_free(data);
+		return ret;
+	}
+
+	*trailer = data;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_migration_data_save_init() - Initialize the pending save migration data.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
+{
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		ret = pf_descriptor_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		ret = pf_trailer_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		pf_pending_init(xe, vfid);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
index 3958f58a170f5..7ec489c3f28d2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
@@ -26,5 +26,10 @@ void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
 int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
 				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
 int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
+ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
+				     char __user *buf, size_t len);
+ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
+				      const char __user *buf, size_t len);
+int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 8d8a01faf5291..c2768848daba1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
 
@@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 	unsigned int id;
 	int ret;
 
+	ret = xe_sriov_migration_data_save_init(xe, vfid);
+	if (ret)
+		return ret;
+
 	for_each_gt(gt, xe, id) {
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e0e6340c49106..a9a28aec22421 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_pm.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
@@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
  *      │   ├── vf1
+ *      │   │   ├── migration_data
  *      │   │   ├── pause
  *      │   │   ├── reset
  *      │   │   ├── resume
@@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
+static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*pos)
+		return -ESPIPE;
+
+	return xe_sriov_migration_data_write(xe, vfid, buf, count);
+}
+
+static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*ppos)
+		return -ESPIPE;
+
+	return xe_sriov_migration_data_read(xe, vfid, buf, count);
+}
+
+static const struct file_operations data_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.write		= data_write,
+	.read		= data_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
+	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 7be9f026d80e8..8ea531d36f53b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -10,6 +10,7 @@
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_printk.h"
@@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
+static void pf_migration_cleanup(void *arg)
+{
+	struct xe_sriov_pf_migration *migration = arg;
+
+	xe_sriov_migration_data_free(migration->pending);
+	xe_sriov_migration_data_free(migration->trailer);
+	xe_sriov_migration_data_free(migration->descriptor);
+}
+
 /**
  * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
  * @xe: the &xe_device
@@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
 	unsigned int n, totalvfs;
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
@@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
 
+		err = devm_mutex_init(xe->drm.dev, &migration->lock);
+		if (err)
+			return err;
+
 		init_waitqueue_head(&migration->wq);
+
+		err = devm_add_action_or_reset(xe->drm.dev, pf_migration_cleanup, migration);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -153,6 +172,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 	return data;
 }
 
+static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
+				struct xe_sriov_migration_data *data)
+{
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+
+	xe_sriov_migration_data_free(data);
+
+	return 0;
+}
+
+static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
+			     struct xe_sriov_migration_data *data)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
+		return -EINVAL;
+
+	xe_sriov_migration_data_free(data);
+
+	for_each_gt(gt, xe, gt_id)
+		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
  * @xe: the &xe_device
@@ -172,6 +221,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR)
+		return pf_handle_descriptor(xe, vfid, data);
+	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER)
+		return pf_handle_trailer(xe, vfid, data);
+
 	gt = xe_device_get_gt(xe, data->gt);
 	if (!gt || data->tile != gt->tile->id) {
 		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 2a45ee4e3ece8..8468e5eeb6d66 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex_types.h>
 #include <linux/wait.h>
 
 /**
@@ -53,6 +54,14 @@ struct xe_sriov_migration_data {
 struct xe_sriov_pf_migration {
 	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
 	wait_queue_head_t wq;
+	/** @lock: Mutex protecting the migration data */
+	struct mutex lock;
+	/** @pending: currently processed data packet of VF resource */
+	struct xe_sriov_migration_data *pending;
+	/** @trailer: data packet used to indicate the end of stream */
+	struct xe_sriov_migration_data *trailer;
+	/** @descriptor: data packet containing the metadata describing the device */
+	struct xe_sriov_migration_data *descriptor;
 };
 
 #endif
-- 
2.50.1

