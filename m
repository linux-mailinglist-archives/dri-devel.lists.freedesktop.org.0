Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82FB2DD47
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3944D10E071;
	Wed, 20 Aug 2025 13:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRSa0tRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2718A10E071;
 Wed, 20 Aug 2025 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755695069; x=1787231069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fj5iImXqUIye4WtduSx4UGJ2S4TEWpkB2tZcuhRMb2Q=;
 b=KRSa0tRLas+NsHmaUfMiYBdpHiu7ZbZuwm6+h7apDeUUmOEUx5jBAtew
 A6oCR5P7KlbKXqlvDGcUtxJQjnhJdxRnBiUpHpYWZ6dgBa68mCzJb5hjQ
 qa2H1peG6fAxLyteUMwGCBbW36vE/VCQrMa77KZfs9J3qwnE2BlT+NsGt
 jULpXhOhDJBDxkWECXSDC9y1C6fAN/iYE3dqxmrTUShKmkX4ti68F39g8
 XXDeYcHbrY5BKN8gx8r1nOeKUz5KsFMbidnWnta2T9hresmHKFD8eijRx
 lAKkmCVyCwWxWITzCYt2MNApGG6troWQ28zUwVixV8dQOJIJqhyZcVzz3 A==;
X-CSE-ConnectionGUID: 6GR0V2YgSTKXcE4ON53IBg==
X-CSE-MsgGUID: PwOUMM0dSBiRniXrHHRZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68230645"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68230645"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:04:19 -0700
X-CSE-ConnectionGUID: 6iSpmNuAQ8K7r9HPWZxBog==
X-CSE-MsgGUID: VRE0cxdyR/qHaFByKQ/YRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167630149"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:04:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 06:04:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 06:04:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.41)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 06:04:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJxZrA/aabY8pu5MiUQv1PqtPvKWeHkkoiPQcxVPT3xZfmcbIB3kROB2pkkOrqTOfuJGcbCosoMYHVjEZBi7Uq/gnmUdGD6Anke4xjT0xIayz6KghHZKYDYcC2deaFoljikREWjYiA6buHzyott9h1DJerr1muFBWC3ikaFjrqcpM7rCG/mXp2XgaIZCPOZL/5FApF/KWUbNkhOfFAyxRcGktmmCt32jeGfLu5/oVPlce0IMYfMqWlJViGJsNp0ejZcTJOCrwjmr9bP9deT3VKjGf73S3aDkDv1bJEKMJMY8x4dOfRzimeUlyynMsdfhw3Pjk4+6aesEgIREodtaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYzaKC+R8mwPjdMF/b66mmngkxWv0kqAutnJ63kS3uc=;
 b=Ua2u6J7nGnA8Wm2GPzIhwCxPOj3AK1HFz0RyX6lOUa2EVOb6o9So8JOyEF5txJFEe+/8V5pHmdptoIX+TXpSx/rjImIdmtv9Lp8iqen9crls43TIIz/W7HIBTp5DI7NubellxKBB1hKCRz5GAzOWhjpIOURcF8IqYjCE49aqepYLX4miST6j6aZpHrN8AMNSWWPXINQgxBaWLLHyTP0FNxyeeIhZvJbL0xbBA8gdNcQ2ne9f3iRGLfunWrxJxR4orkF3VZRl8aafSkZRTFyhW8d5FH2JGflOmsx6DTbLe4VzprvECqmNhcI3dsD9qX74P+FCC34hHMgCedvU9mnIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA3PR11MB7415.namprd11.prod.outlook.com
 (2603:10b6:806:318::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 13:04:13 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 13:04:13 +0000
Message-ID: <c1e58abf-fe9e-4a80-b742-aa35f0683db7@intel.com>
Date: Wed, 20 Aug 2025 18:34:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
To: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Brendan King <Brendan.King@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
 <20250820135657.19a6bcbc@fedora> <DC78OWRRDWEB.2Y6NDT6UGEJ9H@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC78OWRRDWEB.2Y6NDT6UGEJ9H@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 985cf129-f338-403a-f944-08dddfea0f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXFRcFFpeXBrK0JTNkxlbzhLTU5mRGFWOTVyTjJPNUhCOVg4Mm1yY3FrTG9B?=
 =?utf-8?B?ZXVVZGFYd05yUksxdDluRmdIdEoraE9FbXJvYThhWC9WL0NFVzcvV3l3SWJ5?=
 =?utf-8?B?SnAvYXJNWUtyTmhOL0V0RS9YS0t2akUrTTNKR2NGbGtObFVwNWhHVXFyREZ3?=
 =?utf-8?B?T0tNWVp6cHdDZTd1enl6NkduNFhZWjBJbGFKaVordE9KUHZGdmt2bm1Fc1hp?=
 =?utf-8?B?OVhyZndxaEliQ2hWdXBNUXNBaTQzM25GcXNJSlZ2Szk0TU9Zc3dVek50RVJT?=
 =?utf-8?B?NXF2SlJaYVp5eUlrNFRzMmxSTEZNcytsYkFqNWdUU20zbUE2MXNHcW1HcnFq?=
 =?utf-8?B?alNVWHo3VEh6dXM1bzM3b1pBZzRkS1dwMStjS29TR1ZuQWxLQTY3UTB2R0Iz?=
 =?utf-8?B?MWFwbWpMbEk3ZDNZeThESWxYaE5ncmRqSHlsRWpKT1dMcWZJaTBHQ2hWZ2lI?=
 =?utf-8?B?MGNzTEdqREpoMURjRzBSUVQxdGRNUzFHSlNYZ3JnTUpwV3Bva0FUTmhFdzFv?=
 =?utf-8?B?MlhvOXdFeHNXSjF6M01kR0VwTDN4KzkvSmZpaFV4YlAxTlFNWGw1UTRJdUM3?=
 =?utf-8?B?REppM3lxTjFtYlFVYVQ0RDlkQmM4QjRSM21yRi9UQXN6aEordGNwV0ozVGF4?=
 =?utf-8?B?ME10Vjc3RGhyckszVjJIUnEzWjJsbFNtZTJvTyt5YkhMQ1R1RTdEUlFteEpQ?=
 =?utf-8?B?am5TZllnK1pzZ2o5dTZDRGJTN1BHTmlTb05WZTlUZEhmUmdocDB5T2picnlo?=
 =?utf-8?B?RitkSlhqa0lSaWlucm5wVW4vOG1udXRlWVEyL3ZPcEpsc24vRC8yd3VlTmxi?=
 =?utf-8?B?dTdqd3FGN3RWcnQvSFhudTl0SXltMzVoK2t2MHZKdjNZNUFUVWs1bkRuVFRn?=
 =?utf-8?B?eVhKbEExNmc2bC9OWTBHTS9oMHV4RnNWZHZPODRveGxBK2RSb2pBdzhqcFdx?=
 =?utf-8?B?RVBBRi9VNk1ocGJLcDFWMjVBN3JUbmlTZnR2QW81blBmZ2Y1SW1VMmo5ZlF5?=
 =?utf-8?B?MFZwVTN2SmVhNDFRb1pzaHlweDJtR3psbko1aDdiWGxpVlc5eUx5RnF5MHFv?=
 =?utf-8?B?TjA0VFRzRzhRMC9YVzl0UmRoSGNTRUVZVU02ZWF1ZW9LYTVDV010cVY1b3RZ?=
 =?utf-8?B?NTRqcWxYa2w3M1pRVGNvdXh0cDNsakU2LzVQV1hIVmhJVC95RUU2ak1laHNN?=
 =?utf-8?B?NEgwMHUxVWlzZC9xWmFFc0YyUVgzR0lLZy9pYXI5REtrQXJWWFkxeitZMjZk?=
 =?utf-8?B?bjZLajh1UDZQMnpBSjVQMWZnWVQzTGpQNks5RW5KUVRaSTFYSzdPaGxqSnZo?=
 =?utf-8?B?MVRhcDBpZ1FKUEhQNm5uWXI2dWVmcDhMNjF3RnQvd0dPSEc2OHZjVzJ3L1dR?=
 =?utf-8?B?VVowWTJBeGMxMDNjRkJjeDlNOG54V0FzaUd0MDI3RFN2Mnd5ZEh6VmdqSEl0?=
 =?utf-8?B?MWZCMzhSVk5DSzlvT0Vva1BOWWNBOWQvRnY1d3ZGbFJ3RzFPMjE5cXFhWjY0?=
 =?utf-8?B?ZFpOVGRPQWg3bEVzTkZUSmJiVHh6eHdjMzBIZlg0N21BY1d2Mk1LNVhLSVdF?=
 =?utf-8?B?QW9FSWxjU3V3QmQrdlM3VTJLRjJnRXhMYVlwbHVTWTRNcExhbTdRbVlXZ01q?=
 =?utf-8?B?Y2o2STZ5MlkvZWlKMjFOV3pDdnVGYmlRQWRmeFNsR2RiY1JUTjV5a3VlUkY2?=
 =?utf-8?B?MVlncTh5NmFWdUFvbUtCdFM4RDJaTjZ6QWowa3hpcUt3YVRYQXZHT2lBY0lP?=
 =?utf-8?B?U0c4SUlyRmVTZTFBUmhaSHZmNXVWRzUvbXIzOXdadjFtemlzNHVrRVpnZ0hn?=
 =?utf-8?B?cC9obGRkOU5LT1JuWjhvZk1HOFl0TklTdnA5aDdCOVlabU0wUXc3SFg4Um5S?=
 =?utf-8?B?NldoTzJsUUpzdDQ5Q3ltbXg2QVB5REZ3bGNzMStWU2RKaXFmdW9xZmZic05M?=
 =?utf-8?Q?LrbF7eBsT9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnl2cGVYOE1ueG9XOE1jTU1XWjlqYzdvNFo5ajRFRGFLOGMrYTlaR04wM1g3?=
 =?utf-8?B?alNMSVEyMVpnYXVuR0VoaDAyQ2Fid2xCR0JsK0p3ajdBSDVkSUVjTWJBeTNB?=
 =?utf-8?B?SGR1OUdKZE44U2tMMDJ3eU1jOXhWOWtUVTA5OHV6aVkrYXY5VE04UExqUysr?=
 =?utf-8?B?b1ArTW9abmZLNytLaGtyZ1I0NG92ZFdEU3d4cGxwSVlrblcrUzlCdzVwM0Fi?=
 =?utf-8?B?elpJUXJydFRNeHpSL0ZjdHY3UE1uVy9hTGxROGdjTzZTSmtWOW1WVHNRUFdM?=
 =?utf-8?B?bmk5WHJvYjNjY3puaG5vTFhMNWdDMW1DOWRhUGZNRDlvZ3M5UG13SGdtTi9n?=
 =?utf-8?B?RThxRFg2aXdOR3ZUZC9MTllDQzFvOFl6dXA2VjVOZEdaN3FOQnhWNGlYYkJV?=
 =?utf-8?B?dkNTM05mZ3Y2T1Iwd2VFd0psVlBGOWkzR0U4dzVPQ2pQRm9ndXEvYVpCdUxy?=
 =?utf-8?B?L2Jqa1NRc1BMQ3JwbE5QRU5FUGRrRG90WG92NXhRSzNyc0V2QzV1UTlyWTdp?=
 =?utf-8?B?ekk2VTdvUXZnTjBjRkNDNWIvY2h1VWdKRFUvWFZGNGZNcmFNNXA3MGtoMmtT?=
 =?utf-8?B?VFQwL1FvSk9JUFpEdlBtVHV4YXpJdnUvTldBakEyN2ttTEhqQUhxaC8wUnE4?=
 =?utf-8?B?Z3FiQllXcnpsOURUMTdrTzduTlozVVlrazhMNlpMMnA5Qjg5ZktCMFExbnVO?=
 =?utf-8?B?KytCOUNDZzh2dHBFdFlHdG9zNVN2WlhjR1lmNnRhMldsUDAxZS9ROGhtZG5N?=
 =?utf-8?B?NVBYTjdXS2hLUkwxeUdTYU1qZ1gvS3pPMTVrSXJtMDlWc2RqMVVrMWg3Zkts?=
 =?utf-8?B?WjRJMVZISjRLWTJLNkdZVmo5K1BMcWJsNVR6OFMrTUlvbDdHNTQ3cXAzY3JF?=
 =?utf-8?B?SUE1Mit4bnlMaEFVdlZHaStuOWtzRWs0QVdqNHd0alZ1MVJoODMzU3pUaUlL?=
 =?utf-8?B?Y3h3MFBMQ0d4Y21HeU83RmJDcU56dzAyY1FEQUxnZ0F0U2NweTBKeWlHVnN4?=
 =?utf-8?B?WmZaSmplRU5sbkdoMjR6bDYxaUNFdHA4S05zOFZvY2xCZlo3RVZ2aFNOVzIx?=
 =?utf-8?B?bmhqalROR3JNL09oZnRUMENQNmZpbnlRU21tVWcvdzNNa3hBWGMrTTdqTG1I?=
 =?utf-8?B?ZllrVXVTeXBEWStoUzhBRjMrcTU3d1p1eVdCSFhwVmhEK1pNeWE4NTRBRkxl?=
 =?utf-8?B?bjhJKzhFTUlGd212WHlzMlRjQzkxWThNdlNxOERLMWZhR0dVRWJGTFBRZThs?=
 =?utf-8?B?ZitSazJUUFloTTRybmlUV1FCcEpVd3IyOGhua1JwUFZyQldYK0FCZm9xd2tC?=
 =?utf-8?B?MzBuYjUvWnFUd2ZkdGdUTnJjQVcxSVJ4TkU5Vm9CcGhneGVLNW02UVhWZTZV?=
 =?utf-8?B?akxqUUp5bkcrVXFpKy9Ud0ovUFRjRVQzaHNrLzlMU1NWVm90NlFVOUhhM0tR?=
 =?utf-8?B?bXpmMU9KeElKZXNoREk3TWJzYmxBNWJlR25ZLzhWdFlpZ3daQUFORHdqaEFV?=
 =?utf-8?B?K3VUbXIxbzBDUzdtUW5uRnFZemY5N0NLNVdLcHhCamRUNmlyL0NlL3FUcXFi?=
 =?utf-8?B?U3I5YTNQUUZvQ21TQmZ4ZGIySTRLNEVLODlhTHUvektnY0d5MVVMSnpLb1Nw?=
 =?utf-8?B?U3hVbnJyRm9iOGlQNkY4eldRTGdNRkdNUWwrWDlTc1lMV2hEeDk1MGU5bUY3?=
 =?utf-8?B?aW9lTklKelZuUGxhZEJlWDJqRkpaYnM1anYyMHV1Sml2R1krT2Z2KzFOS1NR?=
 =?utf-8?B?VjhhZGpXR2Q0MXdaaWtuL0U0T0dnWnpOVWxoelpuL3FyZUtFZURKQkdaOE8y?=
 =?utf-8?B?MUhrY0VlS2h3cEVzQ2krOFd0djlNbUtUeTFJTS81OTB2eS9XUmlUTnQ5T2Jk?=
 =?utf-8?B?bkJWN05kcmo5WTZHOGVVbTdETlZpdklrclY1QXh2Tm5hcDFnNmRzMHJlVkRQ?=
 =?utf-8?B?SHgyTEhTeUd3K29wNGlNSDk1c0w3T21ZQmFDZXJXLzVrN3hpWmNacDIzK1cw?=
 =?utf-8?B?RGpkVTU3bzlVSm5Wa25JTlBVTmsySlJnZVlwdDBxNC9wVXFzQ3UzMmsxVDZl?=
 =?utf-8?B?LzMrV05RditLOWVrTlFkS0EvL1VxZFhCSjNXTXEwbUpoellWeXFpWW1yblpF?=
 =?utf-8?B?R0RUWnl6enhsa0xRWHVUVVZtMTlFd2ZocUV0U1RwUk1wdjYrN2F5aWwzU0Nj?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 985cf129-f338-403a-f944-08dddfea0f74
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:04:13.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcO3MaF8xcfxYxrP0MLNhzI+0n3k5FOgjBes3EAgM/HiEzwLn6VdrxGqwlG1L4dNsaDcurNBnDWXTY/jTbzTAYe73GIx/Fas94JkGc+AzXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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



On 20-08-2025 17:34, Danilo Krummrich wrote:
> On Wed Aug 20, 2025 at 1:56 PM CEST, Boris Brezillon wrote:
>> On Tue, 19 Aug 2025 03:27:30 +0530
>> Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
>>> +/**
>>> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
>>> + */
>>> +struct drm_gpuvm_map_req {
>>> +	/**
>>> +	 * @op_map: struct drm_gpuva_op_map
>>
>> Doc name doesn't match the field name.
>>
>>> +	 */
>>> +	struct drm_gpuva_op_map map;
>>
>> Nit: not convinced map is a good name for that field, given this is a
>> map_req, so we now those are map-related arguments. I would probably
>> go for 'op'.
> 
> Indeed, thanks for catching this! I thought I was suggesting this name in a
> previous version too.

True, somehow I misread your comment and changed it from op_map to map 
instead of op. Will fix it.

Thanks


