Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5097BCFB8A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0901510E18F;
	Sat, 11 Oct 2025 19:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbXYt5pM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE4810E316;
 Sat, 11 Oct 2025 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211652; x=1791747652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kIMfr8R2cJti4pRQHZ+fNhcccknFJ2MpdGggHLWRxp4=;
 b=NbXYt5pMjdJCP66STIdCV7BeBkbTGps6ORqpRpjQ8obqhvmx3iemzUGP
 l3AwZprM6znTwWhrQJ715SjAGnTx8/sM1q0k2j2o7ERlTHNVoKRbTkqDL
 6XNGeSAgQv+FIWSnEn9xdHxJqSl1AAnFOWQ0r7y/C6ugbEpyzjSuV1Q27
 CrGkPUzVAWsc4/SXpvqvkB4RvJTmgNCJZK8VaCY4b3CSzeqIBTjxD8pbS
 ul44RtAYsZ//0qhgxtGBox63aEaqBYUSQ098BYBISmM94d1LkrXqQs4ZZ
 c34+cNGsU0O/+62cgL0U0mV7MCFFB9Js4w63tBwqj7oGXb0NPw+bfztWN w==;
X-CSE-ConnectionGUID: fTcA2AbqSJ+HlsE8rjp2nQ==
X-CSE-MsgGUID: /jK4mqZFQMCzYOgV/n/i0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62342170"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62342170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:51 -0700
X-CSE-ConnectionGUID: 09DA3wgCRWuxhiYClDVfkA==
X-CSE-MsgGUID: TSJ4SuuCRMmFq/N76X0TNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181661637"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY/3VvFbuYEAJCH+nAnm78XYo5OKSTam4lg2e/24EztDP7VjxnLnIpiy5OEF7lrAA1zLr4VSspThRnowoTiGQgm6Hw+yYrEk4cxyyB6O5Q1Y3BF94yDPhb6ecBDp5VFrX2NuHjAVylSCRupK6J9xGKaJIGxRXCuqxZ1CBmo6sCu5iWMuo3E7eb7bRSPfoWd3drKXYoKvPJOufmiplSzlWpxvOmXSH41m/Inf1K9B3UZqVqEW+DJxh/87UzIgYufRDHqoDjMG2qKyiQfGUdGwa2s1mlscxD1I45fZlkd557/hX1OGQuESd0ef0UqyCBzkiwMzkPeUf0yQMTLw450Avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KptjgMjAW7mS2AoOQLXLsg+HulC1/x5SjPVIjBQ5kno=;
 b=v7BWMMaiZbQAGLciLI9Orlr7DGUc0XulcDzkzBs+Xy9TGr7IsuEOZLLYeQQ49JADvVA1BWVLQ6NJf1ykvq47aIhB3mA9h+TBLXrrSMjoLpSg0QHnKepl3RbOJE+49VW/2ct/x64Wuvj6Dtknc6pSYqv6XYLAvjOygLTUOKu5pc0plqpDIO38tt/zO8jw/hZ/Gqhk9q1tZVcw66XsTMWK6MzCBNy4jjC3zVlAie/TtaDX+/lRcpxUYK3/xvgvI2lNVqIeeDWbljC4Z1rQl5gjowVQwKOBJ/ZhwnSqhJaySoXZQ3m717YXlmFWoWA8bAV+x+hfg8QZD/zCi1zh4xc/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 07/26] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
Date: Sat, 11 Oct 2025 21:38:28 +0200
Message-ID: <20251011193847.1836454-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0119.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::48) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 13da8739-2ed5-4f31-617a-08de08fe131e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzQ5NEhWeFVxM3BGbkZOenFDM2p5UFNERkJQclNkcFJrckJBSW5zb21vQlBH?=
 =?utf-8?B?RER1bld4akhRTFlVTTArd1Fudks3bndDSjhhVFVBdkJsRERzZlptMUtJMkZq?=
 =?utf-8?B?cE13QlVtM1ZacGVtakJYVWMrU01Vd08za3RlandhNzYrdlhQZlpKS0ptODFZ?=
 =?utf-8?B?WVBxa3N0emdpemlSK2F4VDNLN1VhTGJvQit0YWF4MHp3UXhFOC83czRVWkg5?=
 =?utf-8?B?Ynk2WmxBNllZREFiQU9pR3FpMUs1MDZlclFmUzM1VUQ3U0RHaXRFYlZ3TDlJ?=
 =?utf-8?B?bWhVb0t4MnpWVUtDalpJNXBLSW8zL2ZLMzYxMExacjErUzhueWhhWDA3QVBG?=
 =?utf-8?B?RnZuQ1VBMXhsS3I0cTJzRTFYamlVTDl3ODJ3ZUMxTGZGTWhER0txdmN1a0R3?=
 =?utf-8?B?WEZLUnc4QytrUGpyMkNsYmxVdm0yQUhaUXVpdWN3bFhoSE5EVDE3Z21CWVJQ?=
 =?utf-8?B?NE9EQ00vOXlmY2lXb0tiUmNGa1NEU0cwZVJHOXdDSS9mSE1MclpCY1pZVzJ1?=
 =?utf-8?B?T3lKNFd6bEpITHBvck5yNTJ6bmZwbUpwNDFRTjc0OGtGUlJaR1hHNE9nR0pt?=
 =?utf-8?B?cUM0bmQ5VWFlMTdCSGJ6NllhTFpCOXd1c2NxeGtSRlkrL1RDL0tlTHZLWkdB?=
 =?utf-8?B?Ym5iekYxMXBQNUtFZEZDZEFzbHVEZE9Gc1U5NWpSRUhxOTBOM0NxN3NTYzNB?=
 =?utf-8?B?K21KVHR3eVF6Y1BYZDlud1FqK1BTTVJWcFZVS3RNL21YakU3Ums3NFJMWlFD?=
 =?utf-8?B?dlBqNk10UGRMOXRxV1NRRis4VVNzOU02OVlSQ2xrNzFtWkVlSEIrTVVEaTBy?=
 =?utf-8?B?b3pGR3U1L2FzUWFqYkJ1V0pJTitmeFFhSWpNSTVvdnNFNFpjaUwveVNnbURu?=
 =?utf-8?B?OXMwc0diYWllQVcyZGJMemd0d3c3RDkrVFNtdkpZY2MwRWVScVF6UXEzN0x1?=
 =?utf-8?B?U2k3R0FFUEdRUWFBYzlIU1plUUI1Z1J5ZkpRSEM0bGk3K3h3YURxQ3lyOElq?=
 =?utf-8?B?V0RmaXNka0ROQnpINElmd0t0WVZiN0x3bXZKbkQzcXF1VnpZWVRMd0R3azZj?=
 =?utf-8?B?TkNJK3V2QzB5NkdVa2Q3aWVtb2JyUmlKdFpzZkIzNTZXdXV0NTVBRkxMdGp1?=
 =?utf-8?B?QXRyR3p6K1dva2tOd3Q4TnVsc3NQNy9XeUI5OHJtL24yalpWWENXUFZuUldV?=
 =?utf-8?B?YWNRLzhlUHVNWkkyYW5aZkxnTTRGeXdLN0VBM1VlRWxKcSsvUC8ybEVsc0Na?=
 =?utf-8?B?aU45S3JMWlpXT3BqaHVNa3hZSWFhOFphdEd0NUpVYSt0SU0rU2N1UmNhWHU3?=
 =?utf-8?B?MGEzZDgvbUh6TExTdFJUeEZLRi9NYXQ0bXNxTVAyREw1WDVic3lBMlBiZTFy?=
 =?utf-8?B?UmpzdVl4bExlUGVVRHJXd3NuSDVMdHd2VEJaYml1RUxDWkVxOTQ2dDM4cDkv?=
 =?utf-8?B?S1MvQkZabW02amN4WmJlRjVMT0k2ZHpOSUJ0aDRaVWlrQ04wcWQ5TllaZkRX?=
 =?utf-8?B?Z053WkZMZWVIRGVDY0ZFQWhGTThveFRxMlN1SlRzWncyRDBOSGgrTCs0SjBP?=
 =?utf-8?B?NDNPOFI4bWFqaVVjRHN2a2hPb0JWT0pVQU9RUmUyb3lnVEtsN1BUYStjNTRR?=
 =?utf-8?B?QzFZVkNaMFo0N0RuYU9vbnZ3OEtvUDU1MDM4SHVlZ2NYdWVWWHJ1aFBFd1BM?=
 =?utf-8?B?bitqNVBCK1hlY3NCK0VoTGkwTm5CQXMveE5iVUNIanprL3dMMisvSzF4WW52?=
 =?utf-8?B?Yjl1RnhmVzRlRkJRV1Uzb1FFYjRXUXdQSTNCbGZ2NXV0R29uaVZ0WVZzb2dO?=
 =?utf-8?B?VlU3TmJUNld2Z2txV3lsc0drRmZmdzRmNXppUDhFYXVyd2hKOXNlYmluR1h6?=
 =?utf-8?B?MjF4UWU4SVkyUTZIZE1RRVg3RWZVRkRiSlNYckpKS0s3KzdYSkdOWW91bUhZ?=
 =?utf-8?B?enJ4a01nbjhPS00ya2ZzMG5TUDZXdU05WUxsUDROK0xNTllMTGZUNUNsK3do?=
 =?utf-8?Q?zwpCtl3Zl1aIWPC8d85mdd+5sNaUsM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjQ0WGk4RDdjcXlXckFZYmo1WHAwV3hEc3JNWmQzbUpDMHo1ZnVtbFYxYmFQ?=
 =?utf-8?B?emhnUVd1SDdFbllRUGJGM2ltNWVsS01kRG52SkRoc2l2R0NXRk5uRjcwRUE0?=
 =?utf-8?B?cTJZVDJRMkpqVVppZllJR2hLRHdxTlhwUDhIYzRDQlRVRHJQeGpWcGlYMjJG?=
 =?utf-8?B?QXVMdnBRMDFnUFF1b2FHTXh4cm5MZC9yK3Fsek1MQ0tiVnAydFpuZXlUdHpF?=
 =?utf-8?B?R1I4dVlGeUxzNndIa3RlYmN4elA5OVYzc3JMNDRneG12d25UYlJ3RERLNkZ1?=
 =?utf-8?B?SVc5b011OW9LZkJSSGJkTHJGNU9vSmI4cm9WdUVUOXRuWEZzOWdXaEJjcEdm?=
 =?utf-8?B?Tmo1YXpOdytuODhGOXl2YVB0QnVkQU9tbDFMbWtYaHRHKytPTWxxZmlYaEhv?=
 =?utf-8?B?anlGQzJSb2pzdzU0Y2oxVjJXblZSQmNsTFNpNmtVS1M5UFZzaUI5WXFFamNR?=
 =?utf-8?B?UHpJTjZMMTdCOFRqQXl0R0h6RnBZbzRFQ1VYeVd4UEg1RktTMWhjd1BIUXFh?=
 =?utf-8?B?T2tMQjhYeEVrWWdxb0lUYk5DZ0FZa3lrblZ0VDl1eXFXdDBYMThzcSt1ZFZK?=
 =?utf-8?B?ZkUzZGl5ckNXVXFHU0M5VDVQT215ZzNGTm1PTG1NY2ZoM2pQVkg5THE2L3FL?=
 =?utf-8?B?dEZ3b1dhNGxvcXFjcDdrTkFaSVJPVjN6a0Z1a29UNitXSUx2angvUXlNTVFm?=
 =?utf-8?B?MEJXdC9aVjV5VlhnYS94UEZRWVFRekNWVlJ1cVp4a2lQQnp0R09BajlReTRl?=
 =?utf-8?B?d2s1OVJtcWFDR2ZlZXlmeEdmcU1KTGJURm01N1FPUW00eTlrY0k0ZWlpVnND?=
 =?utf-8?B?V2VHa1dCcEduM2o4VEYydGMwWDdFSzNQN1g5bUczcG1MVDRYZXgxWHpVaWlZ?=
 =?utf-8?B?bncvTkMwdzNIMWc2OVNqYXJqV1FGWGtNekg4T1NnRUlhSThxSDNaSkI1Y0lW?=
 =?utf-8?B?RkpiR2VTTVA5SUtKVGFSSFhSQUtMVTN1WENRVU5sRVM2bWlNNUNBZ1g3R3hE?=
 =?utf-8?B?M2NqRGR3R09nZXd0Wlo5UkpxeHFaNElZSVZXYVFjMXhTWjRnV2VDUjQ1ZlFL?=
 =?utf-8?B?YWRyNGd6M0ExMkRWa3ozaW1kcC85QWRJNEpRdzByN0kxank3SkNma3V1VzNC?=
 =?utf-8?B?VkxITUFyOFVibm8wK2VWdjFRenQzdy94RWsxZStuY24yM3h3K0F0aEN2LzZE?=
 =?utf-8?B?V0lXZ001bWdpVnc2Vm5UZmpyREdHQVhJdk0wQmFua0o2RzIwbDFJMjBKcjh0?=
 =?utf-8?B?MTB5dEoxRllCcFNoSXphTHkwNWtKQ3NXb3ZYWjdUc2JhcTZrMS9GUWtDWHZC?=
 =?utf-8?B?NGM4bFVSRG5TMFJFRG1CajhsSjVhNnFoNi80dC93OGo2b01LMXY0VkRWenFz?=
 =?utf-8?B?eFVJQU5LMmR3S3V6SWhtUVZpK2kzSGJsaTF3dEJrbGErU3l5U1hOWGZaMmsw?=
 =?utf-8?B?czFsbytjMFBEZisyM2RBaWthei96bHR6dXlLQzRFRjd1MEkwRjZ1LzJ6ZU9h?=
 =?utf-8?B?dGFEN3RteGNuSzlOVDdwMUIweEZhdGFocVgrTkRrSTVPR1VNWVZpcFBUU2px?=
 =?utf-8?B?a2d1WllPZGdDY2V5bHdoMVdVdW8xeFRKek0rZWJ3b0JMTmFJcFphZElOTDds?=
 =?utf-8?B?QzRlUlJNYUlhaklic3RZTWw2RHYyL2h1MnlKb3BUTE95V1JSNzlzV3I3OEZZ?=
 =?utf-8?B?ZlJmT3laeGxza0s5UFpPNUJVOEZRYXEwOC9oSkxoMzBNMm5BR29qVjZhbVlP?=
 =?utf-8?B?bnc3dlJ5ajUyZHdhMnpiOGZjVWNOTVJDT3Z5dWlCMkZmTlR3MGlSd2IxaFFT?=
 =?utf-8?B?QkNyTmFvWUoxQ21kc0czRzducjdRMGo3ZkFMYlI5Q0FHVmZMQ0ZPK2taMjlS?=
 =?utf-8?B?b0dlOC95NjZvZkFuSjRhQzlVanJEeVRmZDdtY214amZiMHB4QSs3NEtPUmVZ?=
 =?utf-8?B?MVdoMUV2aFovQXlIU2I2WlNUVzZWdkU1K3BKei95cFFjMU01SStuekY2eXNQ?=
 =?utf-8?B?S1k1WDI5UFl2bXhUa3VBZWZ1dmgrcjFLc0FyTXp4b25sZlUzQlljWm82V1NG?=
 =?utf-8?B?di9RaXNtdW9UTlQzZ21uSUtiWWpLMDZVMzVkQ1ZxY29RS2grcnVNZXJ2R1JW?=
 =?utf-8?B?enh5cnNBRlFuOVZVSmxaM0dkTUowYWxkQ25hY3MzdzYwM2duR2xxM25JZUZr?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13da8739-2ed5-4f31-617a-08de08fe131e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:47.1283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nH2be6YI6aQnezOMqEmmmFg0kp/fQVJ8sQR5kQELgpL9SKOYxIHZ6OA5iCj38zlN5bp1ptL7/3ypzmyoT6QkD8RkfopusVAFEXFp7GzQx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  18 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  45 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  56 +++
 .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 353 ++++++++++++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |   5 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 9 files changed, 493 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 04a4e92133c2e..092d3d710bca1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -814,6 +814,23 @@ bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfi
 	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
 }
 
+/**
+ * xe_gt_sriov_pf_control_vf_data_eof() - indicate the end of SR-IOV VF migration data production
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ */
+void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
+{
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	wake_up_all(wq);
+}
+
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
@@ -840,6 +857,7 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
 		return false;
 
+	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
 	pf_exit_vf_save_wip(gt, vfid);
 	pf_enter_vf_saved(gt, vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 2e121e8132dcf..caf20dd063b1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -15,6 +15,7 @@ int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
 bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 95743c7af8050..5d115627f3f2f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -16,6 +16,7 @@
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_pf_migration_data.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index e64c7b56172c6..10e1f18aa8b11 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_migration_data.h"
 #include "xe_sriov_printk.h"
 
 /**
@@ -165,6 +166,10 @@ int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid)
 	unsigned int id;
 	int ret;
 
+	ret = xe_sriov_pf_migration_data_save_init(xe, vfid);
+	if (ret)
+		return ret;
+
 	for_each_gt(gt, xe, id) {
 		ret = xe_gt_sriov_pf_control_save_vf(gt, vfid);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 74eeabef91c57..ce780719760a6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration_data.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
 #include "xe_tile_sriov_pf_debugfs.h"
@@ -71,6 +72,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
  *      │   ├── vf1
+ *      │   │   ├── migration_data
  *      │   │   ├── pause
  *      │   │   ├── reset
  *      │   │   ├── resume
@@ -159,6 +161,48 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
 DEFINE_VF_RW_CONTROL_ATTRIBUTE(save_vf);
 DEFINE_VF_RW_CONTROL_ATTRIBUTE(restore_vf);
 
+static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *vfdentry = dent->d_parent;
+	struct dentry *migration_dentry = vfdentry->d_parent;
+	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
+	struct xe_device *xe = migration_dentry->d_inode->i_private;
+
+	xe_assert(xe, vfid);
+	xe_sriov_pf_assert_vfid(xe, vfid);
+
+	if (*pos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_data_write(xe, vfid, buf, count);
+}
+
+static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *vfdentry = dent->d_parent;
+	struct dentry *migration_dentry = vfdentry->d_parent;
+	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
+	struct xe_device *xe = migration_dentry->d_inode->i_private;
+
+	xe_assert(xe, vfid);
+	xe_sriov_pf_assert_vfid(xe, vfid);
+
+	if (*ppos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_data_read(xe, vfid, buf, count);
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
@@ -167,6 +211,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
+	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index d39cee66589b5..9cc178126cbdc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -56,6 +56,18 @@ static bool pf_check_migration_support(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
+static void pf_migration_cleanup(struct drm_device *dev, void *arg)
+{
+	struct xe_sriov_pf_migration *migration = arg;
+
+	if (!IS_ERR_OR_NULL(migration->pending))
+		xe_sriov_pf_migration_data_free(migration->pending);
+	if (!IS_ERR_OR_NULL(migration->trailer))
+		xe_sriov_pf_migration_data_free(migration->trailer);
+	if (!IS_ERR_OR_NULL(migration->descriptor))
+		xe_sriov_pf_migration_data_free(migration->descriptor);
+}
+
 /**
  * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
  * @xe: the &struct xe_device
@@ -65,6 +77,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
 	unsigned int n, totalvfs;
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
@@ -76,7 +89,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
 
+		err = drmm_mutex_init(&xe->drm, &migration->lock);
+		if (err)
+			return err;
+
 		init_waitqueue_head(&migration->wq);
+
+		err = drmm_add_action_or_reset(&xe->drm, pf_migration_cleanup, migration);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -162,6 +183,36 @@ xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
 	return data;
 }
 
+static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
+				struct xe_sriov_pf_migration_data *data)
+{
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+
+	xe_sriov_pf_migration_data_free(data);
+
+	return 0;
+}
+
+static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
+			     struct xe_sriov_pf_migration_data *data)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (data->tile != 0 || data->gt != 0)
+		return -EINVAL;
+	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
+		return -EINVAL;
+
+	xe_sriov_pf_migration_data_free(data);
+
+	for_each_gt(gt, xe, gt_id)
+		xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_migration_produce() - Produce a SR-IOV VF migration data packet for device to process
  * @xe: the &struct xe_device
@@ -180,6 +231,11 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
 	if (!IS_SRIOV_PF(xe))
 		return -ENODEV;
 
+	if (data->type == XE_SRIOV_MIG_DATA_DESCRIPTOR)
+		return pf_handle_descriptor(xe, vfid, data);
+	else if (data->type == XE_SRIOV_MIG_DATA_TRAILER)
+		return pf_handle_trailer(xe, vfid, data);
+
 	gt = xe_device_get_gt(xe, data->gt);
 	if (!gt || data->tile != gt->tile->id) {
 		xe_sriov_err_ratelimited(xe, "VF%d Unknown GT - tile_id:%d, gt_id:%d\n",
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
index cfc6b512c6674..9a2777dcf9a6b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
@@ -5,7 +5,45 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_migration_data.h"
+#include "xe_sriov_printk.h"
+
+static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	return &xe->sriov.pf.vfs[vfid].migration.lock;
+}
+
+static struct xe_sriov_pf_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.pending;
+}
+
+static struct xe_sriov_pf_migration_data **
+pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
+}
+
+static struct xe_sriov_pf_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.trailer;
+}
 
 static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
 {
@@ -133,3 +171,318 @@ int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *
 
 	return mig_data_init(data);
 }
+
+static ssize_t vf_mig_data_hdr_read(struct xe_sriov_pf_migration_data *data,
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
+static ssize_t vf_mig_data_read(struct xe_sriov_pf_migration_data *data,
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
+static ssize_t __vf_mig_data_read_single(struct xe_sriov_pf_migration_data **data,
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
+		xe_sriov_pf_migration_data_free(*data);
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+static struct xe_sriov_pf_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration_data **data;
+
+	data = pf_pick_descriptor(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_pending(xe, vfid);
+	if (*data == NULL)
+		*data = xe_sriov_pf_migration_consume(xe, vfid);
+	if (!IS_ERR_OR_NULL(*data))
+		return data;
+	else if (IS_ERR(*data) && PTR_ERR(*data) != -ENODATA)
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
+	struct xe_sriov_pf_migration_data **data = vf_mig_pick_data(xe, vfid);
+
+	if (IS_ERR_OR_NULL(data))
+		return PTR_ERR(data);
+
+	return __vf_mig_data_read_single(data, vfid, buf, len);
+}
+
+/**
+ * xe_sriov_pf_migration_data_read() - Read migration data from the device
+ * @gt: the &struct xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read
+ *	   0 if no more migration data is available
+ *	   -errno on failure
+ */
+ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
+					char __user *buf, size_t len)
+{
+	ssize_t ret, consumed = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
+	if (ret)
+		return ret;
+
+	while (consumed < len) {
+		ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
+		if (ret == -ENODATA)
+			goto out;
+		if (ret < 0) {
+			mutex_unlock(pf_migration_mutex(xe, vfid));
+			return ret;
+		}
+
+		consumed += ret;
+		buf += ret;
+	}
+
+out:
+	mutex_unlock(pf_migration_mutex(xe, vfid));
+	return consumed;
+}
+
+static ssize_t vf_mig_hdr_write(struct xe_sriov_pf_migration_data *data,
+				const char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+	int ret;
+
+	if (WARN_ON(!data->hdr_remaining))
+		return -EINVAL;
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
+		ret = xe_sriov_pf_migration_data_init_from_hdr(data);
+		if (ret)
+			return ret;
+	}
+
+	return len;
+}
+
+static ssize_t vf_mig_data_write(struct xe_sriov_pf_migration_data *data,
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
+	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
+	int ret;
+	ssize_t copied;
+
+	if (IS_ERR_OR_NULL(*data)) {
+		*data = xe_sriov_pf_migration_data_alloc(xe);
+		if (*data == NULL)
+			return -ENOMEM;
+	}
+
+	if ((*data)->hdr_remaining)
+		copied = vf_mig_hdr_write(*data, buf, len);
+	else
+		copied = vf_mig_data_write(*data, buf, len);
+
+	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
+		ret = xe_sriov_pf_migration_produce(xe, vfid, *data);
+		if (ret) {
+			xe_sriov_pf_migration_data_free(*data);
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
+ * xe_sriov_pf_migration_data_write() - Write migration data to the device
+ * @gt: the &struct xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written
+ *	   -errno on failure
+ */
+ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
+					 const char __user *buf, size_t len)
+{
+	ssize_t ret, produced = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
+	if (ret)
+		return ret;
+
+	while (produced < len) {
+		ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
+		if (ret < 0) {
+			mutex_unlock(pf_migration_mutex(xe, vfid));
+			return ret;
+		}
+
+		produced += ret;
+		buf += ret;
+	}
+
+	mutex_unlock(pf_migration_mutex(xe, vfid));
+	return produced;
+}
+
+#define MIGRATION_DESC_SIZE 4
+static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration_data **desc = pf_pick_descriptor(xe, vfid);
+	struct xe_sriov_pf_migration_data *data;
+	int ret;
+
+	data = xe_sriov_pf_migration_data_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_DESCRIPTOR,
+					      0, MIGRATION_DESC_SIZE);
+	if (ret) {
+		xe_sriov_pf_migration_data_free(data);
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
+	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
+
+	*data = NULL;
+}
+
+#define MIGRATION_TRAILER_SIZE 0
+static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_pf_migration_data **trailer = pf_pick_trailer(xe, vfid);
+	struct xe_sriov_pf_migration_data *data;
+	int ret;
+
+	data = xe_sriov_pf_migration_data_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_TRAILER,
+					      0, MIGRATION_TRAILER_SIZE);
+	if (ret) {
+		xe_sriov_pf_migration_data_free(data);
+		return ret;
+	}
+
+	*trailer = data;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_migration_data_save_init() - Initialize the pending save migration data.
+ * @gt: the &struct xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
+{
+	int ret;
+
+	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
+	if (ret)
+		return ret;
+
+	ret = pf_desc_init(xe, vfid);
+	if (ret)
+		goto out;
+
+	ret = pf_trailer_init(xe, vfid);
+	if (ret)
+		goto out;
+
+	pf_pending_init(xe, vfid);
+
+out:
+	mutex_unlock(pf_migration_mutex(xe, vfid));
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
index 1dde4cfcdbc47..5b96c7f224002 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
@@ -28,5 +28,10 @@ void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot
 int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
 				    unsigned int type, loff_t offset, size_t size);
 int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
+ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
+					char __user *buf, size_t len);
+ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
+					 const char __user *buf, size_t len);
+int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 80fdea32b884a..c5d75bb7f39c0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex_types.h>
 #include <linux/wait.h>
 
 struct xe_sriov_pf_migration_data {
@@ -32,6 +33,14 @@ struct xe_sriov_pf_migration_data {
 struct xe_sriov_pf_migration {
 	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
 	wait_queue_head_t wq;
+	/** @lock: Mutex protecting the migration data */
+	struct mutex lock;
+	/** @pending: currently processed data packet of VF resource */
+	struct xe_sriov_pf_migration_data *pending;
+	/** @trailer: data packet used to indicate the end of stream */
+	struct xe_sriov_pf_migration_data *trailer;
+	/** @descriptor: data packet containing the metadata describing the device */
+	struct xe_sriov_pf_migration_data *descriptor;
 };
 
 #endif
-- 
2.50.1

