Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B280B17C3C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 06:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98510E3A4;
	Fri,  1 Aug 2025 04:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLLUz93a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C5E10E3A1;
 Fri,  1 Aug 2025 04:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754023709; x=1785559709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ty/Lhr7jZSmBEM6YS3Gwbp1FwDF4Hse6eZbMMakTNaY=;
 b=YLLUz93alhN0etHTsHTBb0+sDCzLtJFAWLC+KPTRT754gSuVQdwjGh8N
 c6GL9x/TzZsCCbWwuf1NAbrWYsdxeisJHaxrM/j+GefYP0v7D8BBFzMj2
 e65CysggukBdtI4YuNi3+wNYfU1cZVfIEALjITd+lPptEynPb3k2zUYw9
 JMGfEvyJv1x4BBizXX/pixzKJSG8nXEjlQC1KpMlU5w9+cgWstiSlMyZT
 bKlUJaSP1uUQZg1ekWId0ddcESUZVowpdZ/ew4cDp4pYvFiiw0FPXC6R+
 EeBbPueJYSJTp9847Nqun2SGuAUt5ZkMHLP5TRB44u+mCI0/3DMBbKfVh g==;
X-CSE-ConnectionGUID: 54XZx3uXQsWQJUaIwHfpKg==
X-CSE-MsgGUID: rax7Oz83QkC/H6FiNEgvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56445841"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56445841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 21:48:16 -0700
X-CSE-ConnectionGUID: BWEY5H4LTLq40pyhXzmPBg==
X-CSE-MsgGUID: VbL56QcORYKaC9CZsuz8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167937322"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 21:48:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 21:48:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 21:48:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 21:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2S1+ruS7Hmnb18th/KDUIF5pYpChNrx9oKwxLzvoh2D/tk8C9UQiLO578Sz+mpIJPT+VowjwpRFSBZkuFswtAFu2/6l/nuEUXZtKWAUjDOMLaaBj3B6Vu7iV3gagznQXX9XjZOQ9HOHlucolxhPTdwq1cuBbHFGSIzrOL1WxPqm9LT+suWyMzeLPnITxz7s9y7nIVQUQrYXXmFh8rhd9dLEbXmC21felar84jf+cgcki/gng4HGv3TrngUhrYNRW4gJOJfkzzcyHUtM1lhqzhRf21N5TC9N8P7xi3q2R9Boo3Fn8CMxSKo1nzRw34NbNeB68+xUAIZtnNvZXSiMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RkibNVGU+Rjhr7i2t0AUSq8y2g3xby8t+z4kq6ds3s=;
 b=QnpZ2xCDDPo7TGZfRO9kNY+JFk0WZyD4TEnv74A+ljuTvj4nvS+jQWBDDPN9kLEbHfT+MLYTSAKN/wHn1YiZxclG3inx5CVDdusqqP5Gk/uWCm2b9UrHtXbJqXRhUInCMQ1/q0Rib/twzUoTzhShUeWggJm0HAZfLjKnOnJYqsIQnGPGxHB82cDcv0Q5B8bG1VfRGzHI248zJ+dphvly3ZiB4nIFVRCxah8InOixauA07HSzbEbK/7WcaAGBdaAps/c2C4fMv78pBC948EzV7oOZ7t9Q+EknK5WMiY4/Klcwhxdu+iRUSG71BYEsLxdebSATb2dl/ZWTkk0jtWXXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 04:48:09 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%5]) with mapi id 15.20.8964.026; Fri, 1 Aug 2025
 04:48:09 +0000
Message-ID: <f3c9686b-a310-4960-b197-8da47e8a43c1@intel.com>
Date: Fri, 1 Aug 2025 10:18:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Xaver Hugl <xaver.hugl@kde.org>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>,
 <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
 <CAFZQkGzUjv761X+A0ctwhxvpFmqHwSMFbAEhurixo20w6Sxhvw@mail.gmail.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <CAFZQkGzUjv761X+A0ctwhxvpFmqHwSMFbAEhurixo20w6Sxhvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::16) To CH3PR11MB7300.namprd11.prod.outlook.com
 (2603:10b6:610:150::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7300:EE_|CY8PR11MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: e80b15bd-86e8-41e3-fc73-08ddd0b69cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG5Ha0I4cUduTklSWW9KTjFtSW83alRGc3YrdjRIMnVnR2ZJTy95TjdvaEtY?=
 =?utf-8?B?YndBYmlmNUxXYy9qcCsvQ0h2em5kTUtaaGkycHVlanRzR1JvMVZsTjVqOHU1?=
 =?utf-8?B?ams1V012bkVrK0FhMzJheDlFSndobGVRb2Njemd4cFp1MWR4dzEybmdMN2tT?=
 =?utf-8?B?UnM4MWo1Z2FwdWRQRysvZW1zVCsyM1FEUVI0b0plZ3ZWM2NudkJqQlZjRFJL?=
 =?utf-8?B?MGYwREVMc0IxT082OVEzaFd5cXB2ZVd0RjBLdzJCRkcwL1ByejN1MFRtQWRX?=
 =?utf-8?B?UHlGQVpJclhEeTN2UncvWnIvQnVuVUJDNmhCRTdPNjYrVUN1MzBTNWRHR0h2?=
 =?utf-8?B?UUZqdVNpOTVpcThqVjlxaFR6TW9YZGpwNTIyYkEvekpCSkhnemlkTFhmazBR?=
 =?utf-8?B?cWtEcWs0YmJtZjREaWsrK3IrWVNNMXZ4Z0FlNFhwWkdoN21UbEZDQmxiZm5J?=
 =?utf-8?B?N3VlSVh4cE10cDl0ZHRkVlFMVHY4WmMyblhkZWpUaFJzeFJzUjlMTnQvRVJ3?=
 =?utf-8?B?V2E3TFhqVjRHc0UzVG00Z3JNcVFMRWMvRWFCUzV5TzVCb285aUxxNTNwZ2tP?=
 =?utf-8?B?RjBoUE9MaTZ1czd0NVVSY3NVaitTQ1E2U1N3bWdOVnFTRkJJZ1F0MmR4WENy?=
 =?utf-8?B?MHA4cEF5YW82VEJvN0JIbk1ldldzc21GYk9tbmFVakErQmZRdG9TcGdDUU43?=
 =?utf-8?B?eW5RNDhSdUJ2TEsxa2I2UDZpV1JCS1h1VGJXMnRnUVZidXFBL2FWdG1CMEw1?=
 =?utf-8?B?Qld2c3dSWnErYUxpdDJaM0ZmK01naGtSb0tpc285SHNPYnlFMWdZTFBDZk5J?=
 =?utf-8?B?NXV3cDkyRU9HQXRkL005TnlSRUhiYUJLd3FhbWVrR0l4VFViTjdVbmtubytU?=
 =?utf-8?B?eFp5QVhjSzBuL0dXT1NReDBsZXFyL3ZqSEM3c3hHaDJ6WWtiVVRuZklvbmtq?=
 =?utf-8?B?TmZqTWpEODZtRllBc0hOWEM1VXdrN2haVytCNzI2QURuVXg3WUdYZEtXQklU?=
 =?utf-8?B?bndGOGt4UUY1NVhLR0VpMXZFTEhXTzU5Y2RYeHRXMWFwQVg5NHF6d3RHU3lv?=
 =?utf-8?B?elhDdnorTXNOSXM5aHhMSHBFaitWcjB3eUtyY2IwU25INWxyY1NQSlB3ODlQ?=
 =?utf-8?B?NmZhUFZVUzFQb2RmUWFHamZUU0t3b3lEajljK2dQUE8zNyticlo0TFN3MVlo?=
 =?utf-8?B?Uy9VWmFNeklkYldVcVdPNnl6bTU0VndkNUorUEk1ZXVuS1d1V1VKRG5LbGlF?=
 =?utf-8?B?OVg0NlpFK3doQnZETWVscXdVaVd0L2hIUXBYeEhGV09pQnp6WGZucEE0U3Bn?=
 =?utf-8?B?N2Q1L1ZlejRtZlRNQ3o0MzZZRS94SmtQYVNHay9tdW9iWWJQTTRNVnJFSUVq?=
 =?utf-8?B?NUdvSnFnekk1cVd0cGFZY1FWa3BWZ3lYN3U3UnQwbnB1OFNKTFFLNC8vQVRK?=
 =?utf-8?B?MmJZNnQ4dHI4c3NXUEpBYlhVYTNpWkp2dlIwZmZUUXhnL2I2SXhQSm92azl6?=
 =?utf-8?B?di9CQm5sVkJGbzR4V1lZNkNJYkErck9LbXFEWmhUeWRMSHAzVG1nUHMxdWFs?=
 =?utf-8?B?YlFXalFrWVJFQzlPdUFraXZ2UjZCaHpnTmlMcThJdkIwdlhlRlZoNytrSkNh?=
 =?utf-8?B?T3U0ekdSajlKWDhXK0gzL2pZYkxWY1g4cVNVcGoyM3E4clFOV3RyQUY3K0VE?=
 =?utf-8?B?YWt3WXkvcGtIRXowNElNMldYRkd4Q0lnSTF4TXRNT1NRMisveG04Rm00bDhY?=
 =?utf-8?B?a1RKdnp6NkJxa05ZK0hxa1p3ZVJCUFFGQzhFMm5jaWVVVDdtK1c5Vnl1NTls?=
 =?utf-8?B?SHhoWmQyNVhrYnFDRlBIM2VmY3J1L3gwN09xV1BQZG1VeFRnaEVZRlJVem9n?=
 =?utf-8?B?ZGJIcUFGV05QNDRwQlBkeWxoajE0VU1tRDMyMVY0ZW9nR2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmdwV0dRMGFEcTgzK2l1cGtrR1A1TzY3Q0JybUozT01rcElVdTQrM1lJdHBG?=
 =?utf-8?B?UDJjOHpFcmFMMVB5MWh2QWxTTFR1TTJ1VG1OamF6RjJjNzE1TUU4NnNWUzls?=
 =?utf-8?B?WUlhYnpNcE1Wc1pZUmRwaWlMdnc5MGI5MnVMcnBQcDdBc2F4R0dsR1VhbjRY?=
 =?utf-8?B?VVFuNU1lNUNSN3RpUWhsL3puWHRISjhIemY3bXNCZmlpSXhwUmpIQjlGOHll?=
 =?utf-8?B?SGREZXU2TnpHa0Zia2lLVnk5Rzczcnlqb1gxb3N4WFpvZ01abElSUG9lWjdh?=
 =?utf-8?B?MUJuNFB6QkpQWEp2RGdRSmZwbmwyZ0VZZEVLNXdGMjE3Y2pMcStBaGZidUt5?=
 =?utf-8?B?TFFNSmxaQ1hsUUhpNmZnZG5jZ0UvVWpIbWo0dlcyMFFIaVJGK2NqMGhXQ0o5?=
 =?utf-8?B?U0tsMWRCUHFCZVpncjhmUGhtMGpWdWRjWmthRTNLUHdqUzh1UGFuNmJob1R3?=
 =?utf-8?B?SCt6bVpoNGJUeEhpZWxKNFVmQkk0UDhqTnRvblFCNmYvMVQ0YXptVklrM0RV?=
 =?utf-8?B?YnlldTkwYXp5aXpjeUJiUk0vMjUwVlpxUFhqN0N1WDcvNW5Bai9POWpacFIw?=
 =?utf-8?B?blpZd0FKWEc2K1gwUmdNWlBGME96QUxvcDRXQ0xqZjhxSTlRRDYwUG1Rb21p?=
 =?utf-8?B?MC9RcUdCMjNYMGZoYnhZNjAyOVlXQk4xSm5PWGZXRm04b2RKcHBGMnBXbE5C?=
 =?utf-8?B?dXROUTFMcS9QcFlsOHNtTzNSL1NsZXl2QVI4Q29NTlNYZ05NZWRVS3pPN1Vn?=
 =?utf-8?B?WmtFVHdvR1YrK3BrZ1ZvZmljUDZwT1hWczVpKzkxN05pRFdEV09lQlNqd2Zo?=
 =?utf-8?B?cHlMb29uQlRmY2ZFRXlOUXZoaVFHTVBHQ0lJU0ZjaHJJOEs3cyticjV6OXNl?=
 =?utf-8?B?S2srQ2k5YTF6eFBTNTljTzZ4ZmIvL3BvR3BzZ2E4czhUWm1XaDk4QlpTNXdB?=
 =?utf-8?B?L0prRmFQai9MckR1cDB5REpjVTEweW0vU0hSeFpCTGdDNnJJTjRMMmU1YTY2?=
 =?utf-8?B?ck0xVkhtcTRMT09yKzZtd2tGUnhPOTdtN0lrUXNzOEovMkNoNHQxZ21memNx?=
 =?utf-8?B?V1pwL0xBaVVLQ2xaTk5sRnpYQnFLVWplZm1kWTRqWkJGKzZQYnNKVWxmRkw1?=
 =?utf-8?B?aGFIQkNSbyswblcvK2JLcmp6V2EzWXh2Q3ByZXV3VXU5cGJPVXJZd3NqU0ww?=
 =?utf-8?B?c3QvRFh4Z1lPSTArMzRRRm9hRHJGL3JwMmllN0FEMEhrMWZmK0NGeGw0amZz?=
 =?utf-8?B?OU0vY2FkMmZZdHdhdWpGTXZLbG9nK3BqbFpsOUVmb29VVjhCOVZydXZJaXBM?=
 =?utf-8?B?Vi9VbjdoelVEWklyc3hJUVZENDJZK0pvQ1VqYWFodkNoa0puNTBHSHVBSFlQ?=
 =?utf-8?B?amJyd0liRU10cysxM2dhWUgwckIwY2pNME95U21zOEFDT2EvTk1nR0tvaUw5?=
 =?utf-8?B?TWNWa21BZDdJTkwxOUxZOWVqTkQrWWUyak1tRFNuZFZEUkY2ekNTV1hCTGdC?=
 =?utf-8?B?V0JLUEtZVHlxQTZBY0ZlZTdGZ3pQV2VteXlRa0cwcFg2TU4yYVhndmtvU3cw?=
 =?utf-8?B?d1hoSzhQZGRUWEFoNDV4OWlwTWVNa1YrNWtyNWNXd1dZdWNaM05pR1lYU1pl?=
 =?utf-8?B?V1pURElJOFNRcnIxTkNSY01mN2FTN2h2VytYTVIxd2dMMnNGd3lqd1ZXK1Qz?=
 =?utf-8?B?UkFGVnVzTjhMS1FaUUd5OVFSc2RXTjFDTmxUVkI1OHEwK3VDeGlRWnZwbTIr?=
 =?utf-8?B?MEozL0hHWmdxTFFpVm5IYTJzdXdvRitoai9WWWRNOStDZkMwRG5jcTRvZlZu?=
 =?utf-8?B?V0tJRktFRzYxaUE0TjJpeWxrbUFXN1pIcG45N0hjcm9zNkE5Uy9WMkdhN05t?=
 =?utf-8?B?N0xIWjlhblZWbjNlbzJDMlpjWi9OSzZuQ0Y2TGVoOTlDQjhlRS91clQ5QWlF?=
 =?utf-8?B?OFhNWjAvaGppa3psUVRpWUVlMUhUenN0Z2M1NEpQei9XYkQ2OGt2b1c2MC95?=
 =?utf-8?B?enZoRHBwNDY0YVFYRHM2Yks0N2tsZ211NC9DcW9SMlc4all4NUY3WjU1MDJo?=
 =?utf-8?B?V1BrcG1EMDlURmU5eGVkTStVaVkrZFlXWmZJOW1PckJQMXVnVTh3VkM1YlYz?=
 =?utf-8?B?dERlMVAvMmovMEYrOTFKR0drM1ZpRjQwRzlwUHlkSCtuQzZDSVBOSTVKWmxU?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e80b15bd-86e8-41e3-fc73-08ddd0b69cb9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 04:48:09.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuKZaOvNweklRGYx4vDbEL+gq5kiYEE33v+7hQ6UDwf8C0FGNj46ijirefCLWeULZXAu+Q2YiZJhogFLvK/CCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
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

On 31-07-2025 17:02, Xaver Hugl wrote:
> Am Mi., 30. Juli 2025 um 12:36 Uhr schrieb Arun R Murthy
> <arun.r.murthy@intel.com>:
>> There can be multiple reasons for a failure in atomic_ioctl. Most often
>> in these error conditions -EINVAL is returned. User/Compositor would
>> have to blindly take a call on failure of this ioctl so as to use
>> ALLOW_MODESET or any. It would be good if user/compositor gets a
>> readable error code on failure so they can take proper corrections in
>> the next commit.
>> The struct drm_mode_atomic is being passed by the user/compositor which
>> holds the properties for modeset/flip. Reusing the same struct for
>> returning the error code in case of failure can save by creating a new
>> uapi/interface for returning the error code.
>> The element 'reserved' in the struct drm_mode_atomic is used for
>> returning the user readable error code.Its a 64bit variable and
>> should suffice 64 error codes that should be sufficient.
> Hi, and thanks for working on this. Harry already mentioned what we
> discussed at the hackfest, so I won't repeat that again :)
Sure, will take care of them!
>> +/* atomic not set in the drm_file */
>> +#define DRM_MODE_ATOMIC_CAP_NOT_ENABLED                        BIT(0)
>> +/* atomic flag passed not in DRM_MODE_ATOMIC_FLAGS list */
>> +#define DRM_MODE_ATOMIC_INVALID_FLAG                   BIT(1)
>> +/* DRM_MODE_PAGE_FLIP_LEGACY not supported with atomic ioctl  */
> This should be DRM_MODE_PAGE_FLIP_ASYNC I think?
Sorry my bad, it should actually be interchanged!
>> +#define DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC                        BIT(2)
>> +/* flip event with atomic check only not supported */
>> +#define DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY      BIT(3)
>> +/* atomic property change requested need full crtc modeset */
>> +#define DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET         BIT(4)
>> +/* atomic property change requested has impact on all connected crtc */
>> +#define DRM_MODE_ATOMIC_NEED_FULL_MODESET              BIT(5)
>> +/* async flip supported on only primary plane */
>> +#define DRM_MODE_ATOMIC_ASYNC_NOT_PRIMARY              BIT(6)
> This is a bit limiting when some but not all non-primary planes support async.
>> +/* modifier not supported by async flip */
>> +#define DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED   BIT(7)
>> +/* async flip with pipe joiner not allowed */
>> +#define DRM_MODE_ATOMIC_ASYNC_PIPEJOINER_NOTALLOWED    BIT(8)
> I feel like this error is a bit too specific, or at least it needs
> some more explanation - what will compositors do with it?
Sure will add more description, compositor on getting this error will 
have to either use sync flip or reduce the resolution so as to not 
enable pipejoiner feature.
> In general I want to mention that some of these errors are pretty
> specific and not actionable for compositor code. Ideally the enum
> would just be more generic things like
> - invalid API usage
> - needs modeset
> - plane can't do async
> - format/modifier can't do async (though with IN_FORMATS_ASYNC it's
> kind of just "invalid API usage")
> - scanout bandwidth
> - connector bandwidth
> - memory domain
> - scanin bandwidth
>
> which (except for "invalid API usage") compositor code can
> automatically do something about, and the string that's passed to the
> compositor can give more information for debugging and logging.

Sure will add error string as pointer by Harry as well.

Thanks and Regards,
Arun R Murthy
--------------------

