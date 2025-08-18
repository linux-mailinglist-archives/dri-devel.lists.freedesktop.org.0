Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6977B2B1D4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 21:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880F010E055;
	Mon, 18 Aug 2025 19:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbHT5muq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974B510E055
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755546179; x=1787082179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hfGhvh9EekHGT0fxNdGwffRPZ0/yavKKhaTN0K6ofAQ=;
 b=AbHT5muqpBOSgZ4/Vra6PSzTihHY7r13/rjIYV1hnRXDWrnLrfZWZ3R7
 KO9wNP+hNA2UlMk8iIlBpWrNW586sf7TYzyPw3jUPI+rSu/4AZfvCD82B
 Jbgdh54ZlZbzYjPz957chNYq2reomKdFi2Ylvdzbsq8hilisvaF6uhN5k
 dTrBQkPd1V+f64aChS7O233TGoZpgnaBpo5RdJF+OzkmYi1HSIP3NUTbY
 GZxplqq5ByIA3Qs3OFQJGD0qV2pSN2cFvXRBzRNxY4RcEAhBrSdGZbath
 xU8R4ANF/aDD5CXymmH0VuQhTm30WckChFsknEz3dxuggLzHJzpruau37 Q==;
X-CSE-ConnectionGUID: r5i+07FERDC+RsxXdyrzgA==
X-CSE-MsgGUID: dshho1/5TK2W6bA4IdJz9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45355051"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="45355051"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 12:42:59 -0700
X-CSE-ConnectionGUID: raskx3JCQeWwcEUrSO52ug==
X-CSE-MsgGUID: j9tREj2YRc++KnOL7k7PNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="173001742"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 12:42:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 12:42:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 12:42:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 12:42:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtobQtE4003MchxJvhSC4Tf/xAwtvS9vLnMbggVkLZ8reB+N3fix7njxr83M5qHGjRboL0CGIzYLrlK5FQyCvycKSUvBdhtdruhTJJzfmGzXp0o2lvJTG7BZrZN2zQLC89sWPyatVjBd2Y8VE70GEHPe8F3vlhx7C3AokTxb5bplEQ6YuOwnYyC2n60nunwCrdTbrhnQaear1H0mnuVVipgNfY3mmd4f5QLJerR+Zg0WBBYxYF9MCPUXbL6rTLFjiXGAjtFvJsnzs061hp9+Pdp3cLHT5ZXH6Co2Kj5XrrHlaVbzGz9XnkiEUmT/wanZtw8v8rsksPaMKTLn/grj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABV+HK79IXjLpZi74xClg2KOgw749DFjpWOQ9ty10ME=;
 b=nFMfHp/A7jBXRX0Nsu5pNpSUHrpjIE+rjCxLWtf6nshQw23JDrQQXKqeSz3op7sZQRva+pRcCJYu/KXFWGkVcyass5e/P9ooz+5LVX16/C/MFIidrzfrVW4oC47S0KzM9CTVueFf760nWKTkKKvLtaDWIL13bnDIaiUa4PiHLx2zL0HM85K2bF5Pe8hQ25Et3cupRMo0tK52cIKF/bibJnuC2QuRbId4UHivnxJjQKC/vhwCULwcjeWLUiqhxjTSDgnOIibCAScnemWGQsqvBh4L3qqcqMCEsihm+hlF8W6SFEkD8/f77ZDPw/lHQ5OGWM7oh6qAueb+O45mEJ7uTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 19:42:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 19:42:51 +0000
Message-ID: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
Date: Mon, 18 Aug 2025 21:42:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
To: Athul Raj Kollareth <krathul3152@gmail.com>, <tzimmermann@suse.de>
CC: <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel-mentees@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <simona@ffwll.ch>, 
 <skhan@linuxfoundation.org>
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250818192247.58322-1-krathul3152@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0139.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: c48a0c80-85f2-4c65-3c17-08ddde8f6b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0hEemk5dytCTldvdjhGVXFjcVo0NytLeGFpL1lZNXdubXlPYTRKb2VRTXJN?=
 =?utf-8?B?dFpXYVh5ck1ZRmRYTzdYUUlNdTVBdkQ5NUFrNnQzS0ViRnhhaGpnbzV5NmRh?=
 =?utf-8?B?ZTZ1czB1dWd6Y1FrckNZcUZPSitCNXRVWGoyTWsrL1V6V0d4MG4xekpJYXdW?=
 =?utf-8?B?T2diRDQxQUZVZzBKRExad2JydXdSdWxIV3hwbXcxZzg5UzVBamgrTlVqYTR3?=
 =?utf-8?B?SGwrYWVEK0JhcE1ldUdoR0tPZ3kyTnBRb1lOVmtFZlVMei9MWjVkRDVIRUtQ?=
 =?utf-8?B?a1FTRjBFYnZ6K2EvVDczNVpCcitoblR1eEk1TU05d0RJclExd3d1RTN6WUJG?=
 =?utf-8?B?RkhwcEhwdGdMVFBuNDYwL0ZCN3lLVytwVnpDaVVGUUIyKytnZDZnanJRUldU?=
 =?utf-8?B?c3Y2WUltRE10a1QvNElvWHdMZFVqekNwUlNOQmNPUHROVTduZjFoNVA0bEY1?=
 =?utf-8?B?UU1lcjk4c0RtQ2tEakdSMnY4WDh2ZGs3cG5KSHN1YXFzbkhNZHFyS2FiU29J?=
 =?utf-8?B?SHowYTRIRSttOUdYYXE5SDJwY0d1VUdld0ErUTJGdm9MMWRQNVVtNDBrWWVI?=
 =?utf-8?B?K2hGR25rZGl3dkhqM3BEalgvZkZrMWFHWXJiT25pMUJUZnU4NXg3Qy9vZExy?=
 =?utf-8?B?d2hMZDhucXVmZm9pVFRXazBUTldOZ00yNU1XazFKOHRkYlFTUVZLYjdUVlU1?=
 =?utf-8?B?Mmc2TVcySjJsb0NRbCswR3BDNlhlR09aT3JlOUpQS3o2ZzVrazBpSkJVNzlB?=
 =?utf-8?B?RWRlMng4dUM5bGhPTFR4VVVNbWh0UWJEeVpjQVcxVlJsc2w4TVRWR1YvcXFF?=
 =?utf-8?B?M0d3Z0svbmxlUXhEU1Fxajg4S1k3NlZ2eEVqaExtNjVFYk0zZFZzR1NIaEZa?=
 =?utf-8?B?Q3I4UUtaMW1yYjdqb3dWQ21zTUdoc3IzSHBuc1lQNkpPL2xmOVRFTUVidGF0?=
 =?utf-8?B?cUFwSFova2pRYU81Q3JGZjdNbjJkd0pNVVVaTzJoZkgxQTRoVUxQWUFwZzM5?=
 =?utf-8?B?cWZCc3BESEQ2ZWF5VGhDdXVWTFhQUzlBN0lrS2hMazBJOWIzWkF5cVRrSkZZ?=
 =?utf-8?B?RzZIWXRKY25iR012bUxDQUF0RHBEc1o3OEc1ZW4yRWRiRzJDbHRDSlo0UW5s?=
 =?utf-8?B?clNvZFJ3Rjg4djVxTXhrYjFocUZ0OW1LWDRwN1BHRXFEbzk1NWZuSm5nWFNC?=
 =?utf-8?B?eE1oSW8xNUVySjloTGJQSFVaN1p2Q08xNVRsN1kzWERzOThKVGdnaHphaVpS?=
 =?utf-8?B?aWluVzVRRDlnd3JKVVYrYUMrL0hITkhmMitPQ01sbVdNT2trRm9oTEpWQUxV?=
 =?utf-8?B?NUlPYm1TZUVXbnExd0FBN2RubWxHVlRGQkxTT2ZybFJ3RVNvL3hCR0RCc0RH?=
 =?utf-8?B?eFJmTDZ5YXlIN3NZdU9nM0RqM044T0lXTGlTNFQzQ1NDUDNkRG9LRnR0RUlQ?=
 =?utf-8?B?WjBMSFJWazFXZzV1dzhnVzlOcVhaMDBGZmNUdTN5b3pTampLZk5MSDNJeEhP?=
 =?utf-8?B?cjRTZ3ZQK0VoOHM0Zmx1OUVoK3hteWFpYmJISVhzYmpDRmsrWHhWcHRwaDBI?=
 =?utf-8?B?Y0ptbzlRSTVhUnpsYnpPZWdKUEN0NmtMR1NxVjJlQXFXL1dwMjg4S2NMK3NC?=
 =?utf-8?B?UVlsRFNHMGFWNGVwZjJrbXVCVXdzdzd5S0o4K3hsaDNESlQrOXVVR3VaYml6?=
 =?utf-8?B?K2hhWlNGVStZeFpqY3h6RURsdm9ITzFkaHRmWUU4bVg2aTE2cUg2YlhIVGxR?=
 =?utf-8?B?VWtKUE52SGJPUUNRYzkzczBnbjJQTWVpUE9mWTlEcUdnK2hsdUhPNzl1a0Fo?=
 =?utf-8?B?SUNuT3BKR1R3YVhjTkVlempzYm9IWUpkcDFhcHdibWRGbGlCK2J2RDNDWHVO?=
 =?utf-8?B?U0tLMUozd3Bhdi8wa3ZvbC9mOURMRStiZUxiNjNMQWtudVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3YraDdJb0IrbGZ5alFlRHRCQzc4MG1SQzZpcVpKbUxteFNpNnlRMG5ZTy8v?=
 =?utf-8?B?ZVFZYytDZmdUZlU4cUdRQldCT3NWSnozVFpjYm1VQVVnR0lOZDlNb3lzLzhr?=
 =?utf-8?B?Z0FXQllUeVRtVzEycjl4WXp2Q3dXc3poVmk0UysyM3RVT1Z6ZkRIMEhwSDB1?=
 =?utf-8?B?WUswU1crM1RtM3ZLcWhQd1htUGsrSmlEWWZRU2xDcDlaMjRhQWhrVktzRmJk?=
 =?utf-8?B?NjdvemJYYkxCRUlvVDZDVThrZjJ1aXptWXUxaHN1VDlENWpVT1N2bHRyVWlZ?=
 =?utf-8?B?ZmNJUktYZ3FvRTZRRWZ2Z2w1emoydjREY2NENmttYUsyYTFlSHluZ1pTWm9S?=
 =?utf-8?B?RXpOT3RURzF0U2pTbGxRM09SVjlrUnBYK2c0VXhKMG1ZbHZ1SmlKWFY1NGJv?=
 =?utf-8?B?YSthMmdYbHdzeHVtTEk2MHczNDZjVHViMVdyTmw4OXpaR21EY2VkemJ4THIx?=
 =?utf-8?B?RWdWMFlmdUZkQmxOYXRXeE9waWY5WjVkQ0p6Rzd5ZGNHUVdVS2k5QzN2NjRr?=
 =?utf-8?B?anhoUDUveVNxdVZ3ck9HY3VmV0ducHJ0QTFQV0EwTlpqTEVTck1vcjhVM3lE?=
 =?utf-8?B?ZWloTC95REsycVF4YmcwYVEwWGpmZ3prNGtFaFo2R2pWc1dVaXNjVERvMXU5?=
 =?utf-8?B?Qm9WTDlwOHlhczhSWDhmSktsL1ZkUDd6SkpUcnJIYXI2VGVQK2JTa3kxY0Np?=
 =?utf-8?B?WUtEeWhkTStTWWQrZWR6eHVleldlZUFsYlBWVEtiRmxCUjkzNnorZ0pxN3lq?=
 =?utf-8?B?OWhyc1NzUWRiMlBKSWd2VkxlWmorMHZnQlZ4RWszMVV0S3pJWWlsZFJzTVBO?=
 =?utf-8?B?VEhSUytHNnhleHBCY1AwbS9sakFLTjRZQWNQN0NscVlUY0hvczhKbThmdml5?=
 =?utf-8?B?d3l1Rk42S0xNdDM2NVMxaDlERERXWHdRYlpzM09Nc1ZiWUJwSDV3UE56Rm9h?=
 =?utf-8?B?ZUJTVitLQ0QwZTB3VFJaTGRLZ0NCVkx3WndLQjFkWGUzdmZIalYzeGxnTXFo?=
 =?utf-8?B?SEo5cFpJZjZnT3VmMFFjSlFqWjVyQ0dKWkNqN3EvejY4ZXhReWdYZSsrQjVZ?=
 =?utf-8?B?akp5OXo1SkJwb25aMGQ1MnhXOStnVXVYTlR0dU1LYTNBYlJuZlFaN1I1TW8x?=
 =?utf-8?B?VitRVCtZQ2Y2d25PdEY0MWRhY2RwelpnWVd1SDc5RktjMXlpbk1EbnIyRU52?=
 =?utf-8?B?bWEvMkJBbFZVcGxRNGhXVnloL010Q0t1RzN2RWRScWd2THRaYlBCa0J4UHJY?=
 =?utf-8?B?RldKUExHLzR3S3VxaWhVWVpQZ1l6dkFWckxteVBzM2pFNlJJRC9sSTRBbnE2?=
 =?utf-8?B?YUp0Q0tMVHJoa2tJYnZZaDRhNUdCSVcwWk9vbTRhaFM3QVQvZDhNL1BKN3ZT?=
 =?utf-8?B?TDg5MkpaZVpjWjYveWc3TGEwYU5Na1dkdmo0MHNkbmFlOXZPdStJZHIzM3o1?=
 =?utf-8?B?VWFaRDdERFM0VWxxQTA2WVZJUTlLcEV4WU51NHV3Nmc5em5HYUwzdGpXMDNZ?=
 =?utf-8?B?aGg3MElVZ1JKN3hHeUtseCtJR3ZLU3M5ODRtZGplVHNiSDhMWGF4YXhwUWti?=
 =?utf-8?B?MnNmSE5BQU1sTTBYNlRoLzJwYW1jQVp2Z3k1Q0tQc215Q2E3VTVXSHgxVk1j?=
 =?utf-8?B?ZDJBWFN3Q0d5VmI2YWdvS0pycFBNQ01vdmlsa080dlZHa1ltR09ISUg5Vk9r?=
 =?utf-8?B?NmVTQzNHK05LeUhBOTM1VThyaGoxeUhXZkhZREhaQW1aWnNxTzRoSC83dFFL?=
 =?utf-8?B?Um95d3JKcFJvMncrWGNZWEE2eXZneDV2WVZYQlVYYnRpVjhUc2tjdFhKWTBv?=
 =?utf-8?B?aXdLaEsweXBHUkNud3FjajRRTXRQYnBidW5hTzY1bVVxMlZqQ3JCTFU5dlh5?=
 =?utf-8?B?TDVOb2dib2tRZUZLK1MyTUJ3UzZKZ2g2bFkvOEZsc3RDVnZOTGxQczZGeVl0?=
 =?utf-8?B?cktnTVNBMHhHckNlN1JiUzRCc1JnWlJEOTFDT2NZR05Tb3RYRWVzYnhhMHcz?=
 =?utf-8?B?RVh5Sk9oZHhrL1dzTHVJa0ExdHlTS1dzT2F5ampTR21zeldoTysxN3hkTnU0?=
 =?utf-8?B?bkVYYk9YTDUwaVVmWVVxWnBZUUZsZG9wLzdHOVhzRVJiazRZOHJnS2ZVam1o?=
 =?utf-8?B?eC96TWVTYlpzTTV4ZnZMTTJrU0ZuME1SV1ZxWTF4UjlLVGdiQVFnTTM0dUlX?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c48a0c80-85f2-4c65-3c17-08ddde8f6b00
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 19:42:51.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwcoA6cDgAtrf1gu5d8V5182bALOs4NVnj5/hG/tlx5wnBfvLnHPjfurdr8T6pn/MaXBTh/rQjLpb1zJx7pc7Dad7FFkLSmWRbJcMVI0J2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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



On 8/18/2025 9:20 PM, Athul Raj Kollareth wrote:
> Replace the DRM_* logging macros used in gem helper files with the appropriate
> ones specified in /include/drm/drm_print.h.
> 
> Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> ---
> Changes in v2:
>     - Change drm_gem_objects_lookup() to take a drm_device* argument.
>     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> ---
>  drivers/accel/rocket/rocket_job.c       |  4 ++--
>  drivers/gpu/drm/drm_gem.c               | 12 +++++++-----
>  drivers/gpu/drm/drm_gem_dma_helper.c    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>  drivers/gpu/drm/v3d/v3d_submit.c        |  2 +-
>  drivers/gpu/drm/vc4/vc4_gem.c           |  2 +-
>  include/drm/drm_gem.h                   |  5 +++--
>  7 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 5d4afd692306..db7c50c9ab90 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>  	if (ret)
>  		goto out_cleanup_job;
>  
> -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
> +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->in_bo_handles),
>  				     job->in_bo_handle_count, &rjob->in_bos);
>  	if (ret)
>  		goto out_cleanup_job;
>  
>  	rjob->in_bo_count = job->in_bo_handle_count;
>  
> -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
> +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->out_bo_handles),
>  				     job->out_bo_handle_count, &rjob->out_bos);
>  	if (ret)
>  		goto out_cleanup_job;
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4a89b6acb6af..ee1e5ded6dd6 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
>  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
>  					  GFP_KERNEL);
>  	if (!vma_offset_manager) {
> -		DRM_ERROR("out of memory\n");
> +		drm_err(dev, "out of memory\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>  
>  /**
>   * drm_gem_objects_lookup - look up GEM objects from an array of handles
> + * @dev: corresponding drm_device
>   * @filp: DRM file private date
>   * @bo_handles: user pointer to array of userspace handle
>   * @count: size of handle array
> @@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>   * failure. 0 is returned on success.
>   *
>   */
> -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> -			   int count, struct drm_gem_object ***objs_out)
> +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> +			   void __user *bo_handles, int count,
> +			   struct drm_gem_object ***objs_out)
>  {

can't we just use:

	struct drm_device *dev = filp->minor->dev;

>  	int ret;
>  	u32 *handles;
> @@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>  
>  	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>  		ret = -EFAULT;
> -		DRM_DEBUG("Failed to copy in GEM handles\n");
> +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
>  		goto out;
>  	}
>  
> @@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>  
>  	obj = drm_gem_object_lookup(filep, handle);
>  	if (!obj) {
> -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +		drm_dbg_core(NULL, "Failed to look up GEM BO %d\n", handle);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 4f0320df858f..a507cf517015 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
>  
>  	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
>  	if (ret) {
> -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> +		drm_err(dev, "Failed to vmap PRIME buffer\n");
>  		return ERR_PTR(ret);
>  	}
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ea6c509a5d5..3ffd9d5a9056 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -188,7 +188,7 @@ panfrost_lookup_bos(struct drm_device *dev,
>  	if (!job->bo_count)
>  		return 0;
>  
> -	ret = drm_gem_objects_lookup(file_priv,
> +	ret = drm_gem_objects_lookup(dev, file_priv,
>  				     (void __user *)(uintptr_t)args->bo_handles,
>  				     job->bo_count, &job->bos);
>  	if (ret)
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 5171ffe9012d..a3ac8e6a4a72 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -79,7 +79,7 @@ v3d_lookup_bos(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	return drm_gem_objects_lookup(file_priv,
> +	return drm_gem_objects_lookup(dev, file_priv,
>  				      (void __user *)(uintptr_t)bo_handles,
>  				      job->bo_count, &job->bo);
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 255e5817618e..6ce65611231b 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -692,7 +692,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(args->bo_handles),
> +	ret = drm_gem_objects_lookup(dev, file_priv, u64_to_user_ptr(args->bo_handles),
>  				     exec->bo_count, &exec->bo);
>  
>  	if (ret)
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index d3a7b43e2c63..03cb03f46524 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -544,8 +544,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
>  int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>  void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  
> -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> -			   int count, struct drm_gem_object ***objs_out);
> +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> +			   void __user *bo_handles, int count,
> +			   struct drm_gem_object ***objs_out);
>  struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
>  long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>  				    bool wait_all, unsigned long timeout);

