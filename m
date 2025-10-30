Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECFC22405
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAB310EA2D;
	Thu, 30 Oct 2025 20:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AC5WRtae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C74610EA2D;
 Thu, 30 Oct 2025 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856340; x=1793392340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pbSwHRigweUGaZegW4PjipbNCR83G3MQqD8OvACZ8j8=;
 b=AC5WRtaekDAvnIvqzeE5kTb2XW+dmneUaUe0P/GMFmqtG9a4P5s5tqAD
 1fgJ0oRhbahfWWPJn2iz1uF46mSPEGI8UiInZiHhWYRjp2bcTpsHnVHsV
 1eMN6YVAfeT6igpSqLmkeNFspZA2larOktGqsdyreLIYQ4XCmNMNZv/Y3
 yNj7Qzpw8RR3Asr1dk4p44FAje378AX9CuxFVZcl3bGKJNnWAmd5r3CWy
 eGqXcpPseZl/EXwt1F/cKdAxk07sWkxesZKTniJYZ8gb1ZxRX1hz1m4b7
 zKwWzZPw2/NkOvBeYDK2M0X1eEe4eIkTw4GZKNElM93HQDh6AfTFvgk+5 A==;
X-CSE-ConnectionGUID: U9KlMKriRPamOtXYXJDQKw==
X-CSE-MsgGUID: RyDcXs1mT0Sc5ZF69qZ2ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81639937"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="81639937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:20 -0700
X-CSE-ConnectionGUID: 09JqwbO3Tl2a7g3jxQuBDA==
X-CSE-MsgGUID: 5zn8AG8FQO6OXBPYZ2iXtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186492617"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:19 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0j/oi6lQJFDZGpnUYNf+NQJxo0FulF23Z6RGoczT1TNOX1bGuBqbjt+EGot9poi3R70DnneYlD6Idk5hz5ljjEYEIrwsMvGMIu7rPHfs/Leko5BPiYlKGgtcVbwi4hfb97YTXTLvOR4h/KbZNwLchW3d0yvl59yAJIoShyH7wu38AmJOpYpp7rfQPIRqDPzsuPMAalSwIOWSS0SIZgwui2bo1R2kZ5gS5dQRANyrdTruVpQKzfo8KpgBSIWGNj8N++NAHjBKbToiSShp36RK0kzi4fruJYNL/Gubw0MFxSsO3PlrMZFolAM6d9045xBpSuGpTxgIIuQSxZUqHp1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpuLa0phE8xaGeJ7B90R+3W+JKdBY8Au7KvrkQF/GYk=;
 b=AeHxaMIs6XrVcoMU8rnw4M/STIXQIhyKqcw32htEC5DgwMLrWAyZcL0ZY3KMLBb7roDKJdbl5pRMTQVrNkG2QhCQ1TO/8hSXy6eOujhKT3s+FjUcSuOxPagfDXoQbWECsglLyKR4CVlCB6v3NvpHElxXn7sv7hYhgR47l9MWSHyHXCDcy3N5Z+ttAXVtOUXF+3BL4K3j80A5rx63YS8TAIyjeGX13omhS+0gYDS8B7JR4bLR6OLYOxPg0iWMkkcZe/FlVDB76pMcfR1/7iytiENqe0pMoF4swyMDYrJfszd+LEE/a72oMWn2aSy1UbaTkH8jJ2mes71/7VGIOHrmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:17 +0000
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH v3 03/28] drm/xe/pf: Convert control state to bitmap
Date: Thu, 30 Oct 2025 21:31:10 +0100
Message-ID: <20251030203135.337696-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e80ff71-03c9-479d-4054-08de17f36aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmpZY2w2U2JVTUlQUkJocWdmY20zZlR3aVhpcE9jOWZ3V3l6U1hlN3I5WTZu?=
 =?utf-8?B?blJZeDNXRnpKMzN1RGhQRDFBcFR3Uk04MnErVFlpclc3S0ZxdG9CU0FTSE1m?=
 =?utf-8?B?WmhsYUxPMUhldzRqZnZpY0hYRDBSTTdRUFMwN3dsYjJiTXl6bGJwRFRWUUp3?=
 =?utf-8?B?cUpCMjREaTI5QlFGRlFrMVNEUlo2Z1NOa2l1TDRtOHM0UzZFQW5VV2NBVGQ4?=
 =?utf-8?B?cEdOeXRnTVVyc093VEw4cmY2V3g3WnhDMmpOYXpVSjZoS2taTk8xeXZET1pr?=
 =?utf-8?B?Sml3VnFWVnkzeUFNMjZ3Wi9tbDU2N0Irc1FVV1dha0RaeEJTWHdGeGJma2FI?=
 =?utf-8?B?blVZT3Bob25oUnJta2ZJMnhjSW1lcVYyeFdwTktCYVpWbGdRTnVQOTF5Z3RH?=
 =?utf-8?B?WEkyQ21vdCtDMnVIVjVERWt4NmRLbFNUVE1PcWFFSGViOTliVVdablJzM2tK?=
 =?utf-8?B?My82aDFIaytZT045NEplUHR6YnpQYXlmbDlCUWxOUmlQZXhtUkFUN1VqRSty?=
 =?utf-8?B?N0JrWktKVGVDbSt4ZXhPaFhhdlVabnFNdGlrVC9HL2NlTmVyUHVlaTcwblFp?=
 =?utf-8?B?YXV3VVlBdEFGRnVVRkw2QnJwQ1RKV3hEeDFhN3plLzlVUmFOdCtuRE83OWF3?=
 =?utf-8?B?QWx6OU1YRXlXbm8vaTZHK3EyVytnWnM0WEJ1UE4vSlZBL3haejhHOHM3bHZx?=
 =?utf-8?B?MU9KMm50eVZEZXFrbGFkVFJFK21naSs0WitGS1dkM0tRaDRTZGhCVXN2b3Fa?=
 =?utf-8?B?VTdLeE1MSTFrdTUxQ3YxdFdOR0ROUDlsWDE0ZUx3RGUvdW1YdFgxR0tJNGRo?=
 =?utf-8?B?RU9NWjRMeE56NGtnTEpVYmdlbmdTSTNyaEJUUTBtaVhtSE9mRzBSOWEwbHgr?=
 =?utf-8?B?anJObURiWjRWM2dPeFd5Q2ZpditDM3VkUitRdWhTOFZOWHcwOENHM25UdWZx?=
 =?utf-8?B?c3FzRnFBQ1ppQkZHNGdiTDAvRDZBNzQ1NFJNSEdMSXA4Q21YN0lMRWR6VzI1?=
 =?utf-8?B?NFlmdWl3bFJId3lYOGthV28wRGxtT3dWbGkwdWo0UWQ0MXhOU0xLa3B0NkI0?=
 =?utf-8?B?blVoN2MzakhsQlBjNXlWUm1NakhUM0VFZ2orQ0dIeTRQV0NBRUpKbGZIWkFa?=
 =?utf-8?B?MEthRFV4VTJDZWx6YlFPNmxXYmxBU3BVajFpVnZWRlU4eUh0SGlrOFppQzFE?=
 =?utf-8?B?Q29SL2lGVXlHUXZOcGpIVXR0cUU3UzZpUjI0RWU4ZkY3b1JiTzdiT0xDOVZT?=
 =?utf-8?B?RUJiY3A1NlNrQ0JObDc2cVY4NWZKb08rUjEwdnp4Sk5TZnVPM25nWjlnS3dK?=
 =?utf-8?B?cXZWRFA2eEJyV2hyc3poVDZZTWQwbDJ6VzhqVWdhL0VQcHovTFQ2dzhmWHRM?=
 =?utf-8?B?Ri9POEJSUFZEeUFIbUdibmM4VEpCUzRRQjd1Vm9aK3hTYnZjYnJrbGpZUHJh?=
 =?utf-8?B?NGxldjM2cmJXMW1GR2NmL3I0Q0FVK2ErMTQ4QjlYZ1I0dzVQMm1HUE9rbnly?=
 =?utf-8?B?RkY4N1BFcFpFV1Vkckx3YUR2VmN1RnVwL1lyMjRVTkpNN1c0YnFrbnhPRFlt?=
 =?utf-8?B?YmlLblV0cHphelpsN0U2UEJoVlhOQmFUZk1jT1VSOFNZY2hYUTU4TUJwQXhI?=
 =?utf-8?B?QzR3NVRMMGUrK3d0N2dSbkRlRG9HVUdOVmQ0Vk9UZlp4UUFqaWc0TWFPU3Ni?=
 =?utf-8?B?YlRFeDBLdXRoMGMxUnVUMG1NR2ZkeUlkSmZQbitHbTc3WXBFSXRDdURiVnIy?=
 =?utf-8?B?NGtYcUNGNGF3RzBFazl1Z1h4TkZ6N0N2S1J3L09ZNzlnYlZwZzJ3VVk1L0NV?=
 =?utf-8?B?KzlkcXZNQ0Qvd08xdVdvRGFZOWM2RDN0T1ZmdzVNNUpOMXluVWJraGhwVTRM?=
 =?utf-8?B?NG5BRVFZc2JkVXZoeU5qdkFyTFhUMDNkcCtwelRERVNNZ2NqY3NML29yOEg2?=
 =?utf-8?B?Yjc2bDNzQW90TGs1TFVjUndqRUY0d0tIdDVwb0RKVzJPYUYwdTRhK1Mrd1hr?=
 =?utf-8?B?d2V0bzlIQVhvY3FDbEpCaXphbSs1cjAzZFRLTWJyWGRpSHZtSFUyQlVvY3Q1?=
 =?utf-8?Q?R8zYUy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVRRK3FRM1g1cmlXS3JTdnFwOXdXemUyKzBlaXJxZ1ZTajZHR1JHa0s5K3Vl?=
 =?utf-8?B?V01VcWozWVJWU3ZaTDNyREFrOFczVkRNa0xoTWpQcFBFenBlcUxja28yaUNM?=
 =?utf-8?B?bG85RFAybVZIS1hLZ3BIbGl3dEtTQ2l4VWVhNnhhOHZGaUZwU1BGMElqZWZV?=
 =?utf-8?B?TUlYMU0yOXF6cHdkdjRqdlRpdnNqQ1JVMjdQeUJ3S1d6OG1TamE1RG81cnRa?=
 =?utf-8?B?cWF1RTBiWWpvbGZFck9LQkp4SVJEOG5wNk5GTkFSYjdVWmhpNHArMDRuQ2ls?=
 =?utf-8?B?TjdWQTRDWjIvYUovZkwzU0ZmSFJBRGFacjNZRlZIdUJQQkh0alFYdnNDYlVV?=
 =?utf-8?B?V1dVUVMzUDlUbTAzbUtSRkJFd0ZxMjRWYk5UWmtnSEt2cyt0Zm1aeHRuWUVa?=
 =?utf-8?B?ZkE2TFNnK2srd2pJSk1OS2NnV2pDNlFsdDBiK2E3RktoT2Zvd1BhUXgzYkIr?=
 =?utf-8?B?dmdvd0tQK1B6YjhJOTFLZTR3dFlxeVVjc1Z1RnJob2ZJOEVyVUVKTXpUZExq?=
 =?utf-8?B?WHdCbDQxaW5QdmFpWGNCVGV2ZHhQMTI1UFQ3Mlk2ZEphN1NoRTdma2JZdzRC?=
 =?utf-8?B?QlNsbkN4bnFFcGVOOHNFUnRxWGZCcHFCekRRMmpwd0l1eC9GQVV2Q1gzeVhZ?=
 =?utf-8?B?RkxBK1JKUGNoY3dBa3VtK1hnUzVlUGpLaU9TNjM1MndMR0dBd3VxbDZXUWZT?=
 =?utf-8?B?Kzc3SzdobEtBazNWS3Btclg5TG10QXNBNW1lWUtBQU9sMUtDekw3cHRzTGxE?=
 =?utf-8?B?WjV0aFZoRFYyNFRUOEt3eUNCcHpBSEd0WWJYUGc4WHVXZXJJUjVmalpOSUQy?=
 =?utf-8?B?c3ZLeUNjampMc0hEek9Xc2V3M0JoQTVVZEh0ajVZeWlLU0lDZ3FleWdjK1Nw?=
 =?utf-8?B?YWVPbDlaNDd6RUJDMG93SE8zcjV6VmFPT0QxK3hmcmtUTnVtK044TWRSREk4?=
 =?utf-8?B?ellwWnp5V3M3TjRyUzQ2T2d4QUxNWEJVUU5PbERLdnF6WVlkWFpRbWJQcW5C?=
 =?utf-8?B?aGNYNCt6YzA1TWQ2bkNYTm94OHBKdXNwNENpM3MwNDhsMXhSUXJLUFU4Y1py?=
 =?utf-8?B?bjA4ZWdrbkE3aEdWR01JVHIzN1IxTndsZHJrTm9pMVNoSVJZek9IMmlheFd4?=
 =?utf-8?B?enM0RDFmV1c5bmdPb2pxZlN0STU5WG5iVWd6VEUxQno4dWljTmxlY2RoK1lp?=
 =?utf-8?B?M0NnNnNHWUJ4UWcyU3poeC9pYTFIVlRtWnZyY2xBempXMWR0aklSSTNqcENk?=
 =?utf-8?B?TE82S09ieFY5R2hrd3JLS1pWUXNhV01objFTZXY4Sll4ZWZZS3pwdTQzbVpq?=
 =?utf-8?B?b0FzcVhsUDhJTFptYldyd0NkWmhjU0pVZXRsU3lpdFdvQmhIMzJXMkszQ293?=
 =?utf-8?B?MWVrR2lkS3NHamJqV3hyYVhvbmNEb0hRU2RQUENjRUhnSjVMYWVjV0djb3Ju?=
 =?utf-8?B?VTVUT1p2N1J2MkFiZG9TaVhrTXc0T0dIMnhMaWc2N09YRE93MUIyS3Z4NGt4?=
 =?utf-8?B?R0sxejNzbUVTaEVXTWI4Z3NYV3NEcG1NQy9sU2Z6SUQxYTFTbjM4c2tGQUNN?=
 =?utf-8?B?czBvQTNVOUl5aWFZQ3ZsNURzSDY3WXVtdFZvdXdKNXJpL3dwNWxhSHJpRXJr?=
 =?utf-8?B?LzZ1K1lSdXM3WGkwZWtZdlBZV3pTR2hNeFU5VEgwTG1sNmIzNStWU0VjWGxt?=
 =?utf-8?B?NEpKaVlwTzdDcjJKcFdreWF2RytESEN6OHBhOVRWYnRjem42MUNuN0JKNkpG?=
 =?utf-8?B?MUpMRENTQkpQNTZmdlAvUzJobmhQSVRKNXRVblVob3lDT0F4MVVuSDM1eUtj?=
 =?utf-8?B?dUVBU2x3RzdQK0VIVjNOQUpha2JyT0NQS0ZSVEtnM3ZPZUFJOEwyeEFtY1Bz?=
 =?utf-8?B?VlJIYjFtOUtpNTNwYXZRWExoQm43WUwvZlhPMS92TVF0bENRYmVGdGhnOXdL?=
 =?utf-8?B?VG5Fck9OdElKcDE5bFZERmd2L3hDQzk5b2JEaDM3OGp0bkk4K3RrVEIzSnIv?=
 =?utf-8?B?MXluT3F2ZzNZdmd3RU1qMyttUUdjTU5ZMnpIOTE4ZkhvUzV6VkkraVpxSnla?=
 =?utf-8?B?cXhCTFJibmluc0RtdDRKb0ZWUnh1YnJWREFkZ0hkdFF1TGVsOVIvcGgyc2R0?=
 =?utf-8?B?Y2Jua0pGZG1qR29NaVZieGZON2t4OWE1TjlCVVZHTG1vRnFKM3FRVFE0aEgx?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e80ff71-03c9-479d-4054-08de17f36aa9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:16.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0Tja6ib0fMZzyUsIzopcDBVFp9ZIj47cqb/1C4uzZL7eByAhUleaEayF6tjdboXwZzIpljb5hs5Z5ezW1DHJG7wer3WL0O6Y/GKHK1mGLs=
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

In upcoming changes, the number of states will increase as a result of
introducing SAVE and RESTORE states.
This means that using unsigned long as underlying storage won't work on
32-bit architectures, as we'll run out of bits.
Use bitmap instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 9de05db1f0905..8a2577fda4198 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -225,7 +225,7 @@ static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
 
-	return &cs->state;
+	return cs->state;
 }
 
 static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c80b7e77f1ad2..3ba6ad886c939 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -73,7 +73,8 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_STOP_FAILED,
 	XE_GT_SRIOV_STATE_STOPPED,
 
-	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
+	XE_GT_SRIOV_STATE_MISMATCH,
+	XE_GT_SRIOV_STATE_MAX,
 };
 
 /**
@@ -83,7 +84,7 @@ enum xe_gt_sriov_control_bits {
  */
 struct xe_gt_sriov_control_state {
 	/** @state: VF state bits */
-	unsigned long state;
+	DECLARE_BITMAP(state, XE_GT_SRIOV_STATE_MAX);
 
 	/** @done: completion of async operations */
 	struct completion done;
-- 
2.50.1

