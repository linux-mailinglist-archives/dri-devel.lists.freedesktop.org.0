Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65448C34856
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA71010E6D8;
	Wed,  5 Nov 2025 08:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjasIVx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A5810E173;
 Wed,  5 Nov 2025 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762332129; x=1793868129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KCpHpNWDsdkbqgu4FIIf9uei7J4XbHtgGPzQNi1drrI=;
 b=TjasIVx12pQYNWmHeHdcejPTZ3DUyqVOPESi19nmNPhltfE9x7I7WHfV
 2vYq7CpyfXXKkVR88jMXSaZNnMzX1cxlU12X/3+F15lnqKdoFFu5IcRxm
 cRuoNIpajtJN/pOt5vbVAWskjv7tf6MGe0AQOD4T7Xgw4xmhxBwH6Ixbl
 +Ev4RC80MoDNuGmW0F8x1fAngJayLHuimB675TNi01L9pJwNIdMfof6Kj
 OlC8jNuQgqlaYVHACCaPoirrhzECNSVi6Xgx+4Nr73Y0M0SN8PqSfKDVs
 PfAl2bJo65aGcTyc9dN2FyW0lY7wwpklQ8RbqkrlReafWizbKLAK1wA5a Q==;
X-CSE-ConnectionGUID: j0KZgZufTDm/h4YLsCLgqw==
X-CSE-MsgGUID: y+eipTaFSwqhyvlpY0qtXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64471520"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64471520"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:42:08 -0800
X-CSE-ConnectionGUID: cAecrHmLRZireU1WYb2D7A==
X-CSE-MsgGUID: Pwz7ZfzuT9yr2sCVCm3JlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187695667"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:42:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 00:42:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 00:42:07 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 00:42:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzlREtGOcBSDjisO6LN/FIYm6ID2pMP8Wswc/+a5T5fp7Ubk4DmoO0VjbEE98ZiyHI487P66Wyj5QrJdgFHfh++hTWlLQKNGrPoorkZbeEFr+BJwXCOsxHYPZfIMrmXkEKMWx9grjftn2rRzcNmXqIrbPTuNynvJb912XIqHKPAeCROwiEOaBFykL0EnGmnWQGX2J12RVS9B6c73Fsx5+EsWWaejfiWIkKGHN2nEN+2GnbB1TFxRR+LWRSKxdS2y6yYsWV35nZ+OLUwB4YQdPo6IpfCCt3hfv2BrovRYK+lI9bm50dPs4qjLETYBFcI2t92RJbFzeRDff10pPAZrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzhykCCI5nvEY6hkTSy3XOAqp+dVtrOvP+1zUz1ofUM=;
 b=aKMVkjokFVFaZdDYjGit9B+IVvS9QsNIkNnocXhC8WEihGSnxj4Hm9/Dc6E6ck81j1XfkvprmvL9Ywx756BQeTVy6UKbpaniMS7RP/zXglQgVzdruR4XBcmAa9ZV+no7ThSLgaJ8lwn6Vm7L+CW2ivUmCJhspF6SC3t2jtXQ5BHyREakv4hYF8t9kdKgLNUz66KSuYqTtUKaeYrsdvwzZPXrkW8173jAjpSfxE/TMMz48tcaOg3H+BNcN9axnYf3mukGlZALgrcmNNrXxmERt8JDjc+qT2LJRV8eGEG556s09YvI5wYYjOg+XMhXiJZ28dUZ+OuuXSwJTp6DrBNQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB6986.namprd11.prod.outlook.com (2603:10b6:930:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 08:42:06 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 08:42:05 +0000
Date: Wed, 5 Nov 2025 08:41:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
Message-ID: <34ozsv3e6ujs4rn6c2r4nrjcjifgazddy5jecwur6atfcop6vp@bunf3uyofmb4>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251104100032.61525-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251104100032.61525-1-marco.crivellari@suse.com>
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd40125-b25c-49b1-bcc6-08de1c4732ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUF5UExNdFpUb3FlYzJXalB0UmhObnVwOWlDaktZWkg2TWQxMFpJMm94SERY?=
 =?utf-8?B?bGlWay8xVmVscGJiZnlNS0Z0M1lzUEhvazFVSkY2RkovUWE1U3FZT3MzRi9s?=
 =?utf-8?B?Y0dlczZNcHk0WjN3UkdoTHYxeGxncmliNGkvRzVYeFM3QXlPUHoxaW5pRkdL?=
 =?utf-8?B?REhqWDl6Y3FFa3I2SmdrMlNxZ1dKcTVod3dHb1A1VDVDWXBQd1JrcjNaeGVK?=
 =?utf-8?B?aUxpandxdlBQTDNQMjV6M2NtYlJ6N05pMXBUaW1YRFEzR2VQd1NnUFJ4VnhP?=
 =?utf-8?B?RmtEUTE1NDRJUTViRWV4TTM4MS92bE5pRHRROHB0dW54b2hRVHNpK29KRnhN?=
 =?utf-8?B?TC8yUWg5V3pFTUwzdXlFVG1CYm9rTFo1eHlKYXNqdGlnWS9WL1ZQWlF1N2kr?=
 =?utf-8?B?UDFkRVNiUW9WaW8rc3pZNjRGdWNmd1MxbXdhR1E1MlpDTm9kZTY2TVkrME9w?=
 =?utf-8?B?ZUJuNmZmRXFIb2ZHcjZKRnJtTGEzQ2g5RU83TmlidVJyUFI3NnJoM0tIOXAy?=
 =?utf-8?B?WGR2OVJrdmNiWUd1bWR6ZHllU041bXRYaVdNS3MrcDBkaWUzVmQ0Smoxekg2?=
 =?utf-8?B?L25Za2ZLQm4xbnB6QUo4ZGxxUGsySllDRElKRnR1RnVFM3dCS1BzNU9lczRY?=
 =?utf-8?B?Q2RaNE1mY3dEQktsTXZ3eno5VHovSVNlK2EwbXVwdHdoci9NWnFLMDBWTUds?=
 =?utf-8?B?TjlBWHhCem9KL1QxaEdjakVtbjJ0ZmdzdWgzOVdkM0dXaFEzZk9YMUYwUHVa?=
 =?utf-8?B?QnliZzFOSmZEV3ozdnU4a25vcW9IZlkzUllqL1liTGxjeXlxMU4xUURnNkR5?=
 =?utf-8?B?cGJKM21MVklRR1owL0NIQ2FSQzk3SWFEOFFFRzExRFZqV1NzRE0yU2RZdHNB?=
 =?utf-8?B?NjFPdDdPc0ZEWTJHdnRmV0FxVTRyRzFzRmltN2kxbEYyTzM1SjBXSEtnNWIz?=
 =?utf-8?B?c3VUOXp3TmthN1BPVEcxc25FdnM2Ry93U014VWg3cUFIZS9mRmNnQ1pvTzhl?=
 =?utf-8?B?OExkam5wbWdRUkQvVndwVkJudmcxK3ZSbkNIYVpJbmh4UU5jQjlxc3pldDN3?=
 =?utf-8?B?UDltS3oyRmJyTmxuck9DeDBCVk80dFRTVE5SRjdKUTBKelpkSVpVbjM3ZDY5?=
 =?utf-8?B?cEtidm4zTkV6a201WEJZY0Z5aGNsZWNoTEd6ZFNYUCs0NlltUlBsY3RwK01q?=
 =?utf-8?B?bjFRQkJCL3h1c0o1TEZXb0RZVCtJcERMLzhYWmVvbms2RXBOcW0xOFpJR01L?=
 =?utf-8?B?R2x6SUwvYW50M3hXdVpyUE1uUFB6YkQxS0tNZ0RDSlhzMURKOVZ2TWN6UDZo?=
 =?utf-8?B?b2lOdkhER3lVcHQvdURBdFdOWUF1czBkMENwdjZOYzNFVFpPeWtqOTdnTTJY?=
 =?utf-8?B?Sk1ScVl0djZqTkhiSHFnMlNxd0dUd1FMLzFOSEJ3VFVFZnZUWHhCaGxFaHhl?=
 =?utf-8?B?QXk3R0xKUFBBMWRKK3BMQjQybEZvVDNjQ0hVanVudU44dEdIaDg3NGFLWC93?=
 =?utf-8?B?WU9sa3dpNnBXM1JoMTRYekluQXlpWWV2UU4wYUM1dFUybEp6VUp0SXI2UU9z?=
 =?utf-8?B?OHRGRFVkdUthanF2dUhsbHdZOHdCdHRMQWQxU2dUcTg2WHhCYnI2UzdGK3VH?=
 =?utf-8?B?aklyQm51b2lvVk5kV0xiYU5kNEpvaFJmNVBhL3BwNGhIRFFNWHNuLy9BZTJ5?=
 =?utf-8?B?K05tZWhHT2RhRUd1MnNQTXMxSjFqZUZGWHkrSjFQQ29MQTl2VXVOeFR6TjJa?=
 =?utf-8?B?NUM3aDc5NTVZaXlWbExvMkIzODFtTUN1TlhpZHdMWEthVndpeTJaV3ErN2xl?=
 =?utf-8?B?ODh3YzBuRGtZOFp6Zi95aGRqcVZuVEsxSjBNVi9CSU5jZjhtN0NYNU9qMFFk?=
 =?utf-8?B?NzBjYnNtcVdOU0toS3kzZ1MybWZacEFpamNkQlRUWWNKdzZIeGljVnlZajZU?=
 =?utf-8?Q?5PK2zaf7IrOqG65GphEZj3gy86v9rRD2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUhFeXpGY1A3eEdscVN0VERqTklQYWZWT0FMVWwzd2RDWnFSbnZpdnd0VXJR?=
 =?utf-8?B?RnJUVkdSdC9yNm9RcGR5T2VPaFRjMDl5OWdxVmpTK1NEQVFVQ1lUYUJLYm9E?=
 =?utf-8?B?Wng0Wk9wWkVFMExNQVpRUTA1OHA3K2R6Ry9DU2h4dDZjSzU2bnU4QTBrMWhx?=
 =?utf-8?B?WS84NEhwWmV5aFZGSHMrbm9hL0NrSU5LOFYwNkU4aEpiNVNRVVNiYldiUDF2?=
 =?utf-8?B?UU1lSFhKbEVpVXdEMEcrWUJ6ZjJOYmxWTG1pUmFCdkZxNEpKZ3pxZWxoTXRn?=
 =?utf-8?B?b1hRa3JBalZHT1ozaGU0NXZKUHE4UUhuVzc3YVhhb0xiVEZzVnBUZFc2OVpw?=
 =?utf-8?B?UnNsQjAvSk5kYVFXdFhMcW1yVk9ZQi9taXhVNTNvcWF6R3NPdnFUSmkxWFlT?=
 =?utf-8?B?QVl0bUJsZTZqa1l4elhTZE5CL3VnK05ZVUlVbHZ6NWx2NlRTMFRZbGJ2amsz?=
 =?utf-8?B?TGhnTG5SeGgyZ3BwQmczL0FyUXpCdThXcm5QUXJzQXJEU3M3akFsNHZZbkh5?=
 =?utf-8?B?a08zZnBWcjFOVDJBUUFwd1MyblNybDQwbzZaNmt4Wm1wejFaUVVodUFZOHhV?=
 =?utf-8?B?TTEvdXdHRUI0TjlHTUMxTVhPTldxc054SGJGeklISE5JSFpPeUhLMkZWWVZX?=
 =?utf-8?B?Nkx4aDAvYnlrMU9meEt0N21QaWt0MDc1d1ZrQ0dnVVNlbWozUEhMcEVBVUp2?=
 =?utf-8?B?QVFEOGNid1Q3cndSNmZPelE3eHhLZitUc0NHdUwxdlYyWXhTUWtMZk5QZDMw?=
 =?utf-8?B?dTIvb0VxMXRua1NWSncwKzJyemNFRTZiNlFrMWcyOG1aWDdvK1VKNjZMT2JT?=
 =?utf-8?B?b2J3MFY4Smdsc2VMNzRxN2lGV3VGcnBjdjJncmFBMDQ4R2E1U0lMdE9rU0wv?=
 =?utf-8?B?SjlhaGRsWk85a1Jna3UvWlBFQnZBa2RidkNKNys0VyswQ3oyRVU4dnd1OW1o?=
 =?utf-8?B?K055b1ZnU1VvQThNSHFueHBHakVXYTEwWlJwbnJKUkRzV1BvOGdwUjJMNFUz?=
 =?utf-8?B?d0RmV1lqaDdsYmNVSkxEYm5nWHgveEZYL1F0MjdwL1R1eENmdEszN25kWFdJ?=
 =?utf-8?B?U3VmZk13TUxVUHV2Y3hMV2tCUlpUaDd2eGZjRE9lTVQ4MlBHTDVOeWNNSjNQ?=
 =?utf-8?B?OVNzUnhiU0NkcDJXZnhQY3pObTlJc29xb1hQc1U2T0VkdVNjbWVUOFBMVEN5?=
 =?utf-8?B?cXlsUFovMnNhTmRiUTFFQ25TdHdIRXF6cGk0NDU5M1ZoKzdqT0YyQ2VBeldT?=
 =?utf-8?B?ZFdZQTY4VzAxc0J6V081bDkrZUlVUnQwZ3dweFVwQk1ONnVGUDVNdVY1WVNB?=
 =?utf-8?B?amcxTG1pVU01MzFUTk9mSk5RN0I3UjVLOWk5YWRSckRUS3NLU1Z5cjBwU2Ft?=
 =?utf-8?B?S2lrdldlMzRRcVl5Wk1Ma1J0WGx4ZTBJTzZ2dzUwSWppdDRPaVAwbVRXWTJa?=
 =?utf-8?B?Y3V3TUQ5NWZnMkg1UHRYdGlCVEwvQnk2TEN2S3BuOTZZYzhUd2ZhVkhFOUM3?=
 =?utf-8?B?Nm1JdlgvWkY5YTVxRk9OMm9pZXpDNm5kN2R2RWxYaWVvV2l5SUQzM3ZERUli?=
 =?utf-8?B?dXFyNW1XZVY5MGtBVU9od1pLbVRybDErRzZYTHorL1VoWjhncFg3bEtPNFZE?=
 =?utf-8?B?VG5oeWtjUmtmZjNzZXVKUmlJa3VYazBJZEZtS01lcTQ5UGtRanhucHRLeDIy?=
 =?utf-8?B?T2g3NDBTemovY0lxUFNSRVFTZlR4bEV3MjgxVWtLdmNEYVJWUmJId2w1clBJ?=
 =?utf-8?B?MEk3aHB0dk9XRUZKZDdwdXAxTUhpYW1rL0hVNVdHK2ZVZVVkSDNEeFB0NVRN?=
 =?utf-8?B?Z2FtYWJIL0tIc1NGcHNqRHl4TzRmUlBobkUzc2swbDc4RngvL2k4MkF5US9C?=
 =?utf-8?B?RXF4ZFRTRW9PQnE4VXdueEtHY0t6ZU9GQTc1ZEhyd0tyV2JCUXJ2UmpZZktm?=
 =?utf-8?B?a094WmtEUUZ3RnJIQjJnRUpkZVJ1QTdkbWVnSTV5YnpsOWlsTTNFYU42ZXNt?=
 =?utf-8?B?TU9FY2lVV01hM1FQZ1RjbjIvSzN2Q0d2Rjl0TEdqS0pMMGl2RUJnUytlWVYy?=
 =?utf-8?B?aGdOT2xuRUlHQkl3TDI3dFJhWFVUUC9GUDRHWXdzUjVNOFkvNmZLWUV2ZnRi?=
 =?utf-8?B?VHZIbDhIWGFSYkw4R25VWUt0cUZEUktETnpEVnpYa1p2NCs4S3dpWFI4T1A0?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd40125-b25c-49b1-bcc6-08de1c4732ed
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:42:05.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBbioRpewevDGesZNWPD18rE6RD4d5Ta/0N5Ht3zO8uhEgZtByjdhB9rspKPLU107gzL5jfSgdg5iYE8wkcTyUyzgc/iIwgWHqzqOotNjRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6986
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

Hi Marco,

thanks for addressing my comments!

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
on the whole series.
 
Best Regards,
Krzysztof

On 2025-11-04 at 11:00:29 +0100, Marco Crivellari wrote:
> Hi,
> 
> === Current situation: problems ===
> 
> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
> 
> This leads to different scenarios if a work item is scheduled on an
> isolated CPU where "delay" value is 0 or greater then 0:
>         schedule_delayed_work(, 0);
> 
> This will be handled by __queue_work() that will queue the work item on the
> current local (isolated) CPU, while:
> 
>         schedule_delayed_work(, 1);
> 
> Will move the timer on an housekeeping CPU, and schedule the work there.
> 
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> === Recent changes to the WQ API ===
> 
> The following, address the recent changes in the Workqueue API:
> 
> - commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> - commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The old workqueues will be removed in a future release cycle.
> 
> === Introduced Changes by this series ===
> 
> 1) [P 1-2]  Replace uses of system_wq and system_unbound_wq
> 
>     system_wq is a per-CPU workqueue, but his name is not clear.
>     system_unbound_wq is to be used when locality is not required.
> 
>     Because of that, system_wq has been replaced with system_percpu_wq, and
>     system_unbound_wq has been replaced with system_dfl_wq.
> 
> 2) [P 3] WQ_PERCPU added to alloc_workqueue()
> 
>     This change adds a new WQ_PERCPU flag to explicitly request
>     alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> 
> Thanks!
> 
> ---
> Changes in 3:
> - Improved commit logs
> 
> Changes in v2:
> - fix typo in patch subject (add instead of added).
> 
> - in every patch is also present the specific commit hash about the
>   workqueue API change.
> 
> - fixed commit log of P1 (removed "Adding system_dfl_wq...").
> 
> - P2: subject changed reflecting the effective change.
> 
> - rebased to v6.18-rc4.
> 
> 
> Marco Crivellari (3):
>   drm/i915: replace use of system_unbound_wq with system_dfl_wq
>   drm/i915: replace use of system_wq with system_percpu_wq in the
>     documentation
>   drm/i915: add WQ_PERCPU to alloc_workqueue users
> 
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 4 ++--
>  drivers/gpu/drm/i915/display/intel_display_power.c  | 2 +-
>  drivers/gpu/drm/i915/display/intel_tc.c             | 4 ++--
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c        | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c              | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c           | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c   | 6 +++---
>  drivers/gpu/drm/i915/i915_active.c                  | 2 +-
>  drivers/gpu/drm/i915/i915_driver.c                  | 5 +++--
>  drivers/gpu/drm/i915/i915_drv.h                     | 2 +-
>  drivers/gpu/drm/i915/i915_sw_fence_work.c           | 2 +-
>  drivers/gpu/drm/i915/i915_vma_resource.c            | 2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp.c                | 2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_irq.c            | 2 +-
>  drivers/gpu/drm/i915/selftests/i915_sw_fence.c      | 2 +-
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 2 +-
>  16 files changed, 24 insertions(+), 23 deletions(-)
> 
> -- 
> 2.51.1
> 

