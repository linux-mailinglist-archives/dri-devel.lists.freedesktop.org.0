Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C9ADFD57
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA0410E9A0;
	Thu, 19 Jun 2025 05:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUcZ5KBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41EF10E99E;
 Thu, 19 Jun 2025 05:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750312506; x=1781848506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TB6j5j3OPPuuT1ZtY8ASW2MyXelcuuUHPzGud0KSnno=;
 b=FUcZ5KByYPNJRcXvYpoGM6cSL0x0F5YSQS2fCg13sJaOC/jg9ayITOMM
 8Q+/AzBMnGgwzQHP/kCnGrgymxAgLwuoaAZOAG9TbSk6YlTeFKw0L5kQ8
 rZC1M7l9C/RXoNRYAPUHYF298Kg4QhmKEIilJiptVTLcIR0HDRNpzwkU1
 56FivGidJvNXzm9y8qDrgmRW0BLrH3Xvmg8XDkkw878/W7knL+6u7mD2N
 wlCosPjgZM7FdTcl0H6SPOc56tCZhlXyO248uzeSA2h/+NKsnzHE+2HxV
 sd0woxxv1k6pjfZwarHav4Dq1Yu4z7yJlqvg0VfqmiZL/Dy5dFM63uvnZ Q==;
X-CSE-ConnectionGUID: tc+0bb7kSeypPpRCW9w6MA==
X-CSE-MsgGUID: 5d0sgkhsRiiJI2jlsd0Luw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52647995"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52647995"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:55:05 -0700
X-CSE-ConnectionGUID: o5mid7NPTcmlXfUFJHbGPg==
X-CSE-MsgGUID: ridvQBbOS32eihpYKaV2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="150074418"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:55:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:55:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:55:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X64HpQKOw8udeBtMOazjrywsi5djhpSHmmgN1tlTPxw5Y08GkeAFxylJRuyqOy8BN77rbbtleN5mwVTQ3Zl2/KlTbPboER79RXCDp/IYZhp5llq0jyxmG4yK+NEat4orKFNQXco6J0Tb4CIBpgE8trZ/OOxw9Avn7EB5el2s9I6+rxOx8GkN1yF5jvZA5apzmkAQWwO0L2rnUXLAMpEVEMywnINBle1Ck/zRHHy1bJGTx2wfhVTyDG5AJf5bobwasYIa/V+dsDmO4g19BAcn0cI0B68QcqqcVJljfe288HQpMl/iRV1PD/KLCvpWHpvzYGUtppsF/6323wS4gWw5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnilDqyqe7uDprQklcRmsxCFETwvkxgrUQBh1np3BKs=;
 b=hbwxYGScPg+6JmAuucSxG5B4ziADVSnf7ZykZttgFUlP9JkibTlCqXyBQRwTARrNR/qdcMV6HYxPIwY/U2ebFco6cFmWeA861PEiBxd2wRs9NFJqGJ5NcAcmiwyvte2SO4lL1LMFHxrV/0tYsK9FXZltwsA2uwc9Mlsqr1izJ5LVKUmKe0fdIoCrpUSgZ+fZNCzpJeAnU+xGTERx1kKjKWS/Ff2GMYTtCDZQhvCkZPzFt7ykW2emTwj3mEVX/+NhvOJ6BozXlBRTPX4SbsisS7oxkssYKbaa8RUq8CBglvfdXpmoZreSx2JT+SjLqAlpmHhrsWDQkbXXF8ESx0Vn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 05:54:42 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:54:42 +0000
Message-ID: <72bba6ba-1d69-44fb-bac5-edd7f383b66f@intel.com>
Date: Thu, 19 Jun 2025 11:24:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-6-badal.nilawar@intel.com>
 <ed40e9b2-8a6b-4b7c-8c42-80b087314679@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ed40e9b2-8a6b-4b7c-8c42-80b087314679@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd23cae-6cab-4714-7c72-08ddaef5c941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0pZUTYveVVnOXFHdzhMSTRtcTIvNzFpN1BRRHRiNXVBdWd4SDUrN2NOYkdX?=
 =?utf-8?B?emYrc3RkN05uamdmRDNqTkFGOTAzT2RoS08wS0ZiN2wxMURZVkxvUUlJK1FG?=
 =?utf-8?B?Q3NadER2czdDSWlEMEViRDR2eVJTeW1qdEZ0RFVYcHdYY01MU3lSMGYvQThL?=
 =?utf-8?B?dHk3KzRlV2RTRlJQaGRkRUljSlZaZ1U1Mk1FZFdxS1gyRzN2d3ZySG1YZnNr?=
 =?utf-8?B?R0pRZjZPME90U0JWTVdTem5GMlFlSExwWHIxYlAycG9YZlZWVy82TnM1TUt5?=
 =?utf-8?B?bXpHWk94ak5GMzR4T0pVaEJ1b1BBWmpMV2MyY04wMjdxTkhIZ01scWhkY3NS?=
 =?utf-8?B?RmI1eWN2WklWZmNwWWdHYVk5MUxHZUZYVU5yeFJZcm1HSWhTaHMxNmJsb3h6?=
 =?utf-8?B?M2laTkJ0RDFzN3Z3dVorbWxPWW43eTVjTjlMMjBBWXVhSHVsT0hUc0FYdmxr?=
 =?utf-8?B?VjdDem8rSVFDeUhVTVBXV0hyYU4zQndYdDNId2VLOGpBRGhhYWQvbWVwYWdL?=
 =?utf-8?B?STdKZTkrRnY0U0RMNjZTa0sxWjVTVjdmTVhwWTFSa3dhQnVNMWhZU0NBS2RP?=
 =?utf-8?B?UnQ3QVpualV6M3c0V29YTHMrZ0M5TDRKTFpUVmI1WGllUHp5SnZvOGdVSGVG?=
 =?utf-8?B?dDk0RkZzRU5MRitHQ1pObzdndGVJcUtob2h3S3NKVzdibmlxbFJXNlpkY2cr?=
 =?utf-8?B?V0c3RGlJMFJWdDdudE9iTUNadWo2elE5MTY4TXpoYnZpc3JlaFkrUWxsa1pZ?=
 =?utf-8?B?VTdFSUVWNXg1bm92Nml3YkpBMmppTHlyTWZDYVFmS3BGbzdFN3JxY0F0dk84?=
 =?utf-8?B?ZTl1VEltYnZnbHNJakhiV3k2Z0kxMERkRVM2TU9iMkJlZS9SZ05OOHFyR25v?=
 =?utf-8?B?eFQ0bjVENTExdEJEQUtRZG1nUy9COTg2VEE5ZnU3Vmd0ODAvWDZHc2hGOVBP?=
 =?utf-8?B?VEFhRTVKNExydXptem9IN2hKTFJKRmhmZmlwaGF3dnB3bWs4SU1wWmhUbVpY?=
 =?utf-8?B?MFZCWmlPMjNZbkJwT04rdXZFZmZseTdZdXhjd09TSkErVFZOL3VYSTRqWTdM?=
 =?utf-8?B?NTZwQlZ3bzB6cUNIRlY1K0hCT0YxOE84MnZRcktvUmV3WlhaOXBmWXF1MjY4?=
 =?utf-8?B?M1ZpL2QrRHZpYlY1ZnFBUFVaMkU2MWFhc1dWUUhLSVZMZENnZGx1OENlemxX?=
 =?utf-8?B?K21pRmNONEVmckxRRlZteVFaL2xGbUdyWjRlZWRobWZTR1diSzZwWjNYQlVY?=
 =?utf-8?B?eGJzT2xMUDZJcXp0RkNHNUFQZ1YwaTdiQUlNUGE4NkFiVnorTFR4cmM5Z003?=
 =?utf-8?B?bkxLZWl4Y01vc1plZm5tYmwrY1BpbE1DTlAraCttbDN0TDQvcFVQZkk3OVpv?=
 =?utf-8?B?eGZOZHR0WTVLWkZSVWlwb1FMSFp0Wmp1Q1dTSUQ4Y2FPTnRZUFZPM3JGci9L?=
 =?utf-8?B?dHZsckhPN0dZYmxPT1h1UjNmcFFTVUlGUDhNWFNnaXRtWXVieFhXaEhvOFFH?=
 =?utf-8?B?R2RGa0VwQm5jMmdCd3NKRW9vQVh5NkZvOFhsUks2N1dCRFdFTDFncVlmcDdJ?=
 =?utf-8?B?Y1lsbUozaW0wMlVCTC9yMEVhMmMzeWRLcmVxQWZSUVhpRm9UOFBKeEVDOWVi?=
 =?utf-8?B?aTNERkNUNDZ0MU83RXUvYUFRSS85d0tKQkkwT0VDNEdHd0NEL290VlpHc0pp?=
 =?utf-8?B?Si83bTMxeDBHdGlXOGJ6eUdlNWplVjJXaXpuR3dDMXFSQitYV1VneCs1aExB?=
 =?utf-8?B?d2QyTFUyUXJJMTVNbnVSQVRyZ3NScWlFcFB2MXBTNTR1NGxjUEhSQXBHL05v?=
 =?utf-8?B?cGh6aERSdVJ0NFA5eStvaVFTWlJwcDVSNlk0NHI5MGl1Z3pDbHoxZlRFMUNx?=
 =?utf-8?B?NDZkNXUxdzEyK3QvcUMzT0pBWTdIYlRrVjZTMHpHWlF1Mmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0pLU2pVTGRVMHlqVEkwdm1Lcjc3ci9rakMwNVhQb0FGaHM0U1hmT01TejJI?=
 =?utf-8?B?M21FK2puOUpPMFBjUHdubkF1enZmdmdVMHd4WE1BL2JycW11QzNQQThPSlFi?=
 =?utf-8?B?cGl3R1BoL2ROUFV3a1E1cDg4RlVvMlZwbXFOZ1A5Smk5dURPZkZ5ZTZ4cDBi?=
 =?utf-8?B?c3JHSTJlcGhXWkNNbzQ2b1hDVzlieWh4TkUrNEdyNTZ2YmZsS2ZCOGs0eWxm?=
 =?utf-8?B?Q0N5eEluSDVOZ0JaQmp6eGdjbWlXcmx4U2hObE5XcHJsVkc3MlpYQWp0MWYx?=
 =?utf-8?B?emF2L2dXY0NOaWVXNG5HWDRqeUhJbzhtWGZ3WDJTK1Z0UG5rN21CeEprR1NG?=
 =?utf-8?B?b0NReCs1ZkVhbUNubEZDZ1pCbTF3d0dOdUdUdm85QjBiY09BaVJSS0lUeTJL?=
 =?utf-8?B?QmVISCtlQXdEQWlRTk50YTMzZEFvNmwwTWJrQUFlT1NTcHlJdmdoOE1sY3ls?=
 =?utf-8?B?VjNUN1Jnalg2Uk5Bc0FLZGhPbm9DekRBc3JjZFJNbmQwUjB5dlA5ZTVSWXow?=
 =?utf-8?B?aUtCUCtLWmdsMnJKTmlDREdtNVdSWU84VTZuY2NkaHdneEV2aEU5Y2QrZVNn?=
 =?utf-8?B?TnhNZjRGS2hkMTJYeks5ck1XaStzY1Zzeml2TXBLcnlKQ3JybDcwUURCZEVQ?=
 =?utf-8?B?ZUFMUVZCYm5Xd1FVejF5bnlITStzVkhBRWFwMjJnMDJGQWpkakxzQm5ibW1X?=
 =?utf-8?B?REJVdG42aFJGQUlXeTJwbzZEakVjZ01UQThST3FIUXVTdEt0NnhsTlJrNGRR?=
 =?utf-8?B?ZzUySWJBelBwbndkaXNYUzRVTnlGUjlRNEZrRzRHNEhHWklVYXFYRnA4bWZl?=
 =?utf-8?B?RHdJRTJ0ejd0S1RkTjdQUGI0SWI2aWJsd1BmdWRKcWhIYU9kTjdFOE5FUkFQ?=
 =?utf-8?B?aW5icC9WTFlCTjdyZFA1L092U29RaGl1NkdwMnFOaE85bTFPSUxwajNLRXFT?=
 =?utf-8?B?MTcyeEFmSGx4WUJYS1I3cDhvVTBWZXNVOWM4c082ZStmRjE0d1U5eGwzbElO?=
 =?utf-8?B?YmtKclluK2lPNEdxbU95OXFkdWJSZkdoellSRlVvQ0NwempIcU5VOFhnaGRp?=
 =?utf-8?B?RXQ0SURzd2x0NnJaUTlEd2s2SkN0NDg1eGJtTjEvdWFDdFA4dlRUelFDNVJO?=
 =?utf-8?B?cEkyL3FIbzAwUU1wYXlKTXI4MWFldzVaT09ndTg3b3MzTGN3VmdQcHdta1Rk?=
 =?utf-8?B?aTJVdGdLQU5HbjBtRWdmVUFtczRYUDBBQjJnSVNVVWJwRzEwQk4vOTg1OFAx?=
 =?utf-8?B?MUdvbUtGbVBieTc0cno0QjZBUzYrUTNsb0JHMnE2YU5kYkJ4eWxHZHFEdGU0?=
 =?utf-8?B?UHZtRE5URUZGMXZKdHI0MHo2YzFaNzcyTFBJbnZPeVc4emozRzgydWZxdEc0?=
 =?utf-8?B?eWRQTWk1OVV6VXpZck5Pd2RVNUo5Wm5KQTRvQWg2T3Ara1R0SWg3YVIvMkpm?=
 =?utf-8?B?SGRHNEU3dDFJSkF3U0VlRGlaT0VkY1k4Q2lHc3RvK29tSzZNYzhiQXhuUlBG?=
 =?utf-8?B?akRLd2Z1VUt1b1dMYTZoVlo3TWRkKytDYldsU1ppbXlhdEJXQXIrTEZpOUlu?=
 =?utf-8?B?Zm1kelBBM1p3VkVwdUxmUEVsREJyRkxDdUh2cnNadGVUcTI0czJzMUVIc2ZQ?=
 =?utf-8?B?TTY3SHM0d3NGbXNURTFTVzRCcmxDTmt1eU5VSnJkZy9vM1Rwcm1QeDU0dlIz?=
 =?utf-8?B?WFZRRXdYcFNUS2cwa2pacnY4aVJzL0ZJMmFMcm1tbTNoaHA3MEJOeTFndnJI?=
 =?utf-8?B?cGs1aENyKzhqL25KUk42MGFJZjhseml2alFlQTkwellwcU0zK2w5elZyVWlD?=
 =?utf-8?B?ZnoyMnJ0YjFMR2k1cDBseGNqaW9KS0kybzlZMUY2VS8zRnJZQVJrV3NSRnFq?=
 =?utf-8?B?dm1XdUFiNG5VdUhrdzNFY21UWUdTYXRud1pNRnJkTVVSZWtPdlFwOUNmUHV4?=
 =?utf-8?B?QUw2UnlHd2VqdWs2dXlqYWFNKzlZbTEzejI2WEVUcWNDekcwbmt3S24rYitY?=
 =?utf-8?B?T0lpM3RwUmdmQTZOOGMycVhmSjc3Q1dFQmVqYWQ3R2QxMEk0V1NHZERCQ0lh?=
 =?utf-8?B?blpMdHBrV05yNWVzNlBVVTBPNUFweHpJNktnZEJMdExDV1NwKytkYkRNU3RO?=
 =?utf-8?B?VGJFTmdLVlhGZm9sdkowL3FrVGg5TSs4MmNtcGU4UnRUdmIwdWhaVlhIc2Fa?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd23cae-6cab-4714-7c72-08ddaef5c941
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:54:42.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgMT0MNDsk2CdO666RzuCyYSgdpKcieImeX0DsBpmtccaoi/lanHxWkBACqp+jDNVFeaIjYJHAHK7+R5G6PnGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
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


On 19-06-2025 02:27, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>> Load late binding firmware
>>
>> v2:
>>   - s/EAGAIN/EBUSY/
>>   - Flush worker in suspend and driver unload (Daniele)
>> v3:
>>   - Use retry interval of 6s, in steps of 200ms, to allow
>>     other OS components release MEI CL handle (Sasha)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 113 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
>>   3 files changed, 118 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index d416d6cc1fa2..54aa08c6bdfd 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -16,6 +16,20 @@
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * The component should load quite quickly in most cases, but it 
>> could take
>> + * a bit. Using a very big timeout just to cover the worst case 
>> scenario
>> + */
>> +#define LB_INIT_TIMEOUT_MS 20000
>> +
>> +/*
>> + * Retry interval set to 6 seconds, in steps of 200 ms, to allow 
>> time for
>> + * other OS components to release the MEI CL handle
>> + */
>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
>>     static const u32 fw_id_to_type[] = {
>>           [FAN_CONTROL_FW_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
>> @@ -44,6 +58,85 @@ static int xe_late_bind_fw_num_fans(struct 
>> xe_late_bind *late_bind)
>>           return 0;
>>   }
>>   +static void xe_late_bind_wait_for_worker_completion(struct 
>> xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_late_bind_fw *lbfw;
>> +    int fw_id;
>> +
>> +    for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>> +        lbfw = &late_bind->late_bind_fw[fw_id];
>> +        if (lbfw->valid && late_bind->wq) {
>> +            drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>> +                fw_id_to_name[lbfw->id]);
>> +                flush_work(&lbfw->work);
>
> incorrect indent here for flush_work
>
>> +        }
>> +    }
>> +}
>> +
>> +static void late_bind_work(struct work_struct *work)
>> +{
>> +    struct xe_late_bind_fw *lbfw = container_of(work, struct 
>> xe_late_bind_fw, work);
>> +    struct xe_late_bind *late_bind = container_of(lbfw, struct 
>> xe_late_bind,
>> +                              late_bind_fw[lbfw->id]);
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>> +    int ret;
>> +    int slept;
>> +
>> +    /* we can queue this before the component is bound */
>> +    for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>> +        if (late_bind->component.ops)
>> +            break;
>> +        msleep(100);
>> +    }
>> +
>> +    xe_pm_runtime_get(xe);
>> +    mutex_lock(&late_bind->mutex);
>> +
>> +    if (!late_bind->component.ops) {
>> +        drm_err(&xe->drm, "Late bind component not bound\n");
>> +        goto out;
>> +    }
>> +
>> +    drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
>> +
>> +    do {
>> +        ret = 
>> late_bind->component.ops->push_config(late_bind->component.mei_dev,
>> +                                lbfw->type, lbfw->flags,
>> +                                lbfw->payload, lbfw->payload_size);
>> +        if (!ret)
>> +            break;
>> +        msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>> +    } while (--retry && ret == -EBUSY);
>> +
>> +    if (ret)
>> +        drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
>> +            fw_id_to_name[lbfw->id], ret);
>> +    else
>> +        drm_dbg(&xe->drm, "Load %s firmware successful\n",
>> +            fw_id_to_name[lbfw->id]);
>> +out:
>> +    mutex_unlock(&late_bind->mutex);
>> +    xe_pm_runtime_put(xe);
>> +}
>> +
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_late_bind_fw *lbfw;
>> +    int fw_id;
>> +
>> +    if (!late_bind->component_added)
>> +        return -EINVAL;
>
> -ENODEV instead? This should only happen if we don't support late_bind 
> or if the component was not built.

Sure.

>
>> +
>> +    for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>> +        lbfw = &late_bind->late_bind_fw[fw_id];
>> +        if (lbfw->valid)
>> +            queue_work(late_bind->wq, &lbfw->work);
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, 
>> u32 fw_id)
>>   {
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -93,6 +186,7 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>         memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>       release_firmware(fw);
>> +    INIT_WORK(&lb_fw->work, late_bind_work);
>>       lb_fw->valid = true;
>>         return 0;
>> @@ -103,11 +197,16 @@ static int xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind)
>>       int ret;
>>       int fw_id;
>>   +    late_bind->wq = 
>> alloc_ordered_workqueue("late-bind-ordered-wq", 0);
>> +    if (!late_bind->wq)
>> +        return -ENOMEM;
>> +
>>       for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>>           ret = __xe_late_bind_fw_init(late_bind, fw_id);
>>           if (ret)
>>               return ret;
>>       }
>> +
>
> nit: this newline could be moved to the patch that adds this code.
>
>>       return ret;
>>   }
>>   @@ -131,6 +230,8 @@ static void 
>> xe_late_bind_component_unbind(struct device *xe_kdev,
>>       struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>>       struct xe_late_bind *late_bind = &xe->late_bind;
>>   +    xe_late_bind_wait_for_worker_completion(late_bind);
>
> I don't see this called for full suspend (not rpm), even if follow up 
> patches. Am I just not seeing it, or is it missing?

I missed this, I will address in follow up patch.

Badal

>
> Daniele
>
>> +
>>       mutex_lock(&late_bind->mutex);
>>       late_bind->component.ops = NULL;
>>       mutex_unlock(&late_bind->mutex);
>> @@ -146,8 +247,14 @@ static void xe_late_bind_remove(void *arg)
>>       struct xe_late_bind *late_bind = arg;
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>>   +    xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>>       component_del(xe->drm.dev, &xe_late_bind_component_ops);
>>       late_bind->component_added = false;
>> +    if (late_bind->wq) {
>> +        destroy_workqueue(late_bind->wq);
>> +        late_bind->wq = NULL;
>> +    }
>>       mutex_destroy(&late_bind->mutex);
>>   }
>>   @@ -184,5 +291,9 @@ int xe_late_bind_init(struct xe_late_bind 
>> *late_bind)
>>       if (err)
>>           return err;
>>   -    return xe_late_bind_fw_init(late_bind);
>> +    err = xe_late_bind_fw_init(late_bind);
>> +    if (err)
>> +        return err;
>> +
>> +    return xe_late_bind_fw_load(late_bind);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index 4c73571c3e62..28d56ed2bfdc 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -11,5 +11,6 @@
>>   struct xe_late_bind;
>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index c6fd33fd5484..d256f53d59e6 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/iosys-map.h>
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>     #define MAX_PAYLOAD_SIZE (1024 * 4)
>>   @@ -38,6 +39,8 @@ struct xe_late_bind_fw {
>>       u8  payload[MAX_PAYLOAD_SIZE];
>>       /** @late_bind_fw.payload_size: late binding blob payload_size */
>>       size_t payload_size;
>> +    /** @late_bind_fw.work: worker to upload latebind blob */
>> +    struct work_struct work;
>>   };
>>     /**
>> @@ -66,6 +69,8 @@ struct xe_late_bind {
>>       struct mutex mutex;
>>       /** @late_bind.late_bind_fw: late binding firmware array */
>>       struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>> +    /** @late_bind.wq: workqueue to submit request to download late 
>> bind blob */
>> +    struct workqueue_struct *wq;
>>   };
>>     #endif
>
