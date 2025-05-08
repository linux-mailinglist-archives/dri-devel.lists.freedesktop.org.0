Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AAAAF3B5
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 08:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3D010E32E;
	Thu,  8 May 2025 06:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GStO2Ssb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E671B10E32E;
 Thu,  8 May 2025 06:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746685690; x=1778221690;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bIwBNCg4nnhSkA8FO3msteZQ0hApza6mtpn68GTEF44=;
 b=GStO2SsbuoyRuURRp+CQPnxYDGt1H49vRexwdH1eYY0Hr/9i3w+YGQYd
 qb64XPENfj6egV5fOFL5dUQ0cytLVqH+JuebQCiugOYvfi+T4U5CAQI9a
 2AM9D6v4urHMVejllGSVXZlGNH3P85lrttBCdhBdAxyjo/eaLKJ+blTR2
 e0/6C/utPlisVo63FuspWB6HMpbtSXho+T3hGmCA/d0QbVMkKou4KUUI5
 QTCOzWMuxDwlRKyiG8We9pkrmKzgs0KKIh+z9S88ASvzr9RK6b1eEPF7X
 52A6eOOoSWYtN1igEeWhU/k6Mnal4x4tqg3EZYlioJ/U0aqFvxcGsg4ii A==;
X-CSE-ConnectionGUID: 7O/+pbGSRNSXa6MvxeswpQ==
X-CSE-MsgGUID: BMUoxsQkRsi1X6C2ht7dmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48533103"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48533103"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:28:09 -0700
X-CSE-ConnectionGUID: SP2WYN6qSw2q4ejQTBGE5g==
X-CSE-MsgGUID: 0KY3RRrCRpGDmoCuJAIAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="141153448"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:28:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:28:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:28:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXgxEmaK7RhVuUA2Jcmp2jmh6S0Tx8iH+cFL8UWx2kVDEpKSJJm9I6eNE6OwadvOl/ZM5fqzeUysQ0BTFdK5sajk2gsSsATSWbY65Z2ztuE412LklatXcwh1pnJkw3aPpb8muKcl87Z4OXRbFdmTjp06Zpo0Kfmzey6VUG3yyrCgX7zJpXqi2MkFdDBGW+PhgHtZJXdA8UA9KoMhxNbAGwrNoM4aFG74sdP/2moBhuP5K9oBT225vNrVrWKyzfZWG38CiazW61KH/6ftyrDMqSELHQBwCAU+h5VSLiSQ0VFuNoT1kYm9UxaZReHALQPRXQg3h1KKSBPCE33XG24Tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lD5bS7+0ULavFXF2HaBgQbKb04ys957OZklMw7cI80=;
 b=gIOPjGC813Se8Bwos9nCgyChBY9jvRNm4GfRzlnoo7S1s/alSB7rV2vrKZyWjnod/ozn0pG1uskMhgI5/kkxoP46qnem3CwJdiCA13BiIWn2VSNBlWfkmuvjn1SS+s+OJJWIGxARTZLZb4RZO85LGXJSdpFWxgNNTUOYdU37FHMPktK2BI/27HxJdq+syFs6sYsLLx7proFbEJ6Ex8nYbDioQLqL9wQVMSft2hjWAhAiRb+FbNkBX0qQZfO4MU8IkIi/iqf53LV1Uw8p0/rItS7r69+U/XXI2Tp4LO14M3raA9XVhdT95/PW/MQ18ZsXhoMIY5Klg+wyLIDxSxYblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7687.namprd11.prod.outlook.com (2603:10b6:930:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 06:28:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 06:28:00 +0000
Date: Wed, 7 May 2025 23:29:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Leo Liu
 <Leo.Liu@amd.com>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Michal
 =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, Michel
 =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, Philipp Stanner
 <phasta@kernel.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Rob Clark <robdclark@gmail.com>, "Tejun
 Heo" <tj@kernel.org>
Subject: Re: [RFC v7 00/23] DRM scheduling cgroup controller
Message-ID: <aBxPReU5lHjx2w6n@lstrano-desk.jf.intel.com>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0366.namprd04.prod.outlook.com
 (2603:10b6:303:81::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: f2925c55-0df2-4cd8-7150-08dd8df97af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEFBZ0hCVnR2NkRQbVArRTBFTnRYaHdVZTFUUEFIcXg3amcrK250Z2lKOUNq?=
 =?utf-8?B?bkZEWHNIK1Y1ZjhlRVVQMFdVRWplZjRFUzQwSDFYbHhlVEkybkU2NU1tOWZF?=
 =?utf-8?B?RGJHVzJ0Y1ZoeDR5aXNwcnNMckV4eUFmRnR4Y1Q5bjAyZlZxMGFxZWQ5VzBa?=
 =?utf-8?B?dzJqb1A4WUhrSnRVREdVNGgwblBONlY0c1BENHV0QjdYeTFqM3A4NUJicXpD?=
 =?utf-8?B?cHZhSTZsZjgwK0ZyMi9lbkpKbm5yUjhVMFBJcjhCekEwMnVaNHM5WTZ6K01T?=
 =?utf-8?B?MzBBaE0xWW93RFJORFptNkgyMzliQWhqbW9kQnUvUkFYQVliMU1xR2U4cUNZ?=
 =?utf-8?B?NzNaRVBhSjJFL0VWUnRGOGd3M0o5WmFMSkhOSUIzeWNhL1VXVWp3Qis0bWVq?=
 =?utf-8?B?eEZxOGQ3VktvVWhaYkZOY1ZXS0J0MnlJQUN5R0YvNVpLQmNOaCtTSjBJMlNK?=
 =?utf-8?B?d3JhZWpiRG53ajQ0RlpsZkpDVms3OUlVaTBXZnlxYnB4RUFCaC9ybHpBd29m?=
 =?utf-8?B?ZGgwT1V5MGdmUEtjOGlVdnExVnIxVjdtbUNSN0VOUDdqT3d3TWVZNnArT0hU?=
 =?utf-8?B?cUt5cU1Ua24rNmJZWVp0NzJmT3NWcnFYRWV0TGpaT0M1OUxoc2R2TW9BTG9C?=
 =?utf-8?B?S0FoUVU3UHFsTTFldzRMdXJSVHpxS2Y3a28rdWFoTS96d3VSNkFhSXJnMUVX?=
 =?utf-8?B?NmJRaFlRcEM0S1VSNmVEMXdHczNWWm53S0R1aGtubWZnRXBQTllaY1phRkx0?=
 =?utf-8?B?eWtUTzJhUnNzdDAwMXIvOW9nU0xjZGNmeVNMeVhmVnVKejl1UG1MV2JhTGlq?=
 =?utf-8?B?anFGT2xZcm1mL0k3eHNnWGdOeHMzZTIzbEpmb3V6NE5VSy94NVlKNzVGQzZv?=
 =?utf-8?B?MS9BVDVPVjBEYVYwd0pVSm4zRW02clVENGM2WE84Sm1nYWpSUGFwV1pKcVVQ?=
 =?utf-8?B?Q255UFI2K0ZZcjNMWHo1OXFiejVEa2ttaGNOajNjdnluVjJ2SGY5L2I0SFBE?=
 =?utf-8?B?KzBJU21kREN2RDFqSldUYzA0amJBTlhLaHRvdGdpS2srUllTVHhBMEYxMjM0?=
 =?utf-8?B?WlNZbTFNWU1RV2MyOHBnaEh3SnFNUm9LTUk3a0NsNi9JZ2dFNTNkc3lTWnhq?=
 =?utf-8?B?K3ZhSTNPMFJGc2pmb0FLYUZaSXJId3ZSMlFYSWg0L3IreUlvU29mYWtjelpa?=
 =?utf-8?B?aFM3RHBYOHVMMlNjQUtFeGdCcnF4VWRIV2xraElwZ05hbTFFdzZjMmFmMStO?=
 =?utf-8?B?S01KMGQ0ZWYyamxUeXFqTjYrM2NVL1EwTFJ6Wk9weEZpY1cvQzZGbExzOTJ5?=
 =?utf-8?B?UE9oU3Q4RXF4WG9LKzZzTnNDNmdja1ZteUpRczhGZU5RVENGZnREVk9KSy9v?=
 =?utf-8?B?WG9kYUtTOEtzME11a0psaHZ2QWdEWGlkZEVLcEJDSUp1TTVWdzBmU096bG9O?=
 =?utf-8?B?T0dvQkMxSk9KMmhHcTdPRFdpSks1cGNMRzA2c0s4S2ExVlBuQ1hMMkdsUUNn?=
 =?utf-8?B?UlU0dWRPeHUyL2lrR2pOVjhyaXM5dWxIcUtrVXlOV2J2cjlnL04wL0Y0MTR3?=
 =?utf-8?B?NGlTTUFLU2JnQmMzQ1MxLzcvK0JpcGFrYkJCYW5IZFVkVnV3MEZVUDNnck1X?=
 =?utf-8?B?R3I1NWdWckh1L1Q5dW9vZ0MvZFFNWVJhOWVqZGhQZ1NoV3lXRDVGeldFVkdK?=
 =?utf-8?B?YnUrdGhwb0ZDUkRiSWZONjVpeWJuUmxDY2UxWFhDKzFvTmYzcnB2K2YvSldm?=
 =?utf-8?B?bmFnaFp1N2drSTBsMVh3RGtZQkorK2s5enJzNVgrNXlBNUxOQmFXLzBla2x0?=
 =?utf-8?B?Rmh4NnUvbVhRWDNNYy94VWZJcndoVUZMT2lNeDRVbi9yeS9HQ3V5UE1qc2xY?=
 =?utf-8?Q?V5eyQVeN3WkZG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhxWEZ4L2lBL05UZDY2Rms5VHNCeWZnNWU0cTBQOHRibzJrNjhXWUZTMkkz?=
 =?utf-8?B?dVFINGVRWE1RNU1WdmZrUkFkU1hVNkFuR28xd2xQeVZRRWVPU1ltQU9Va2N1?=
 =?utf-8?B?b1dJbFpkOTFDeklIckFDOFQySURqT2ROeG9DWGorVG9SSzBVaThmZmtoTC9U?=
 =?utf-8?B?VTJNQ0lFSURzRi83cFBGNE02SGVJUzkrbzF1ZG1jamlpcXNoTE5sd045dkp4?=
 =?utf-8?B?VlpkQ2RHV0dxTjZDcTRvNG8vdGUrMGdIVmtNSUtRQ1laaHdBdDRhbkczVUph?=
 =?utf-8?B?UFRDT1BjTDZ4ZWdPK05aa2p6RTRlK081RkViTXE1ZFpZajZMUEl3amVEWThI?=
 =?utf-8?B?WFUvRzgrL0Y5U2lQQmFsbm5hMyt4N01wbHlQQ0N5K1RlcTlsZ0pUUFZRa05j?=
 =?utf-8?B?QkNwZ2FsNERUaDI0WVhLSllkZkZuZWpCQzhwMjEyZXBYRkorRVoxRldtZzBl?=
 =?utf-8?B?RHpzN0praHRJTHZ4WVJjLzE4NDJQR2Rxemo3K1hhczh2ODhrZ0lKRTJZSmND?=
 =?utf-8?B?bG50aUhxc3JvT2NqL1Jya1RhSWVpR1NhbHlSNEFGdE5Ud2ZhL3J6NElHeWVG?=
 =?utf-8?B?amlobjhXNkRyV2Ird2RIbEt0WVY5QVpTY0hUcS9mekhxSWdVMFByRGJCdnR3?=
 =?utf-8?B?U3ltRnl4Rk0rcFVYd2EwMmtkS0lSWkxwMjRnNG5UQ29qT0Yvd3J4elFSaEZT?=
 =?utf-8?B?L3dycFhFSTNsRkxWT2I0c0FVRzc5aGQvaGxyZ1V6OXd0SGlBcEE5Tm1KOFgy?=
 =?utf-8?B?MHZvVEoyY3dDa3NKU09FZ0xDSGlPd1JJNVl4Q211QTFLVWhMQ2s5NmlrdFlm?=
 =?utf-8?B?TlpWSGZ6MnF4UFZneU9PRnBzVXF5NGd2NGYyK3hoMjdyV1N1QzB3c0Y4SHFZ?=
 =?utf-8?B?R1NCM2NaK0dkMjlGN3pKcWRRdXoxeThlSEFjQks0Q20rZmZtZ2JiVVJ0T21l?=
 =?utf-8?B?NU9WRkNycDRsUEZUcXZFQUZ1QUlhckZLZU1mcjVMeExsMGFBbXhSTXFpUWdO?=
 =?utf-8?B?OFg0NTBSM1RQQmtKa01MZEVWREtiRzNxUDNKZW1SMmxxSmNQejRMMHF3MGhI?=
 =?utf-8?B?WmlWQktTUjNkUG9nUWtLZnFmcXJTSnF1WFlnRmtOdHVGczJzS25uMjRXZkww?=
 =?utf-8?B?THB6cFZyUWJhWnRRanVvcE56dEw3TVlMWEZDbFc4YnMrT1dibUh5Z2Q1Y3M3?=
 =?utf-8?B?bkxhQ3BZRHArWTFRYVVtNFhYNXFPQ1VnQlRZTndGWmI0L1JHYUhoeGQ2MUpk?=
 =?utf-8?B?a3Uxc3pDVlpZM1R1Q0JQejhjQmZ1elhXY3Jla2lxY1pXamxnSGo4QXUwNFNp?=
 =?utf-8?B?TVUzbkM1Vkt5eVV2b3pkZS94dXIzWkh6RUw5Y2hUS1FyZXoyOThVOUxkcU8x?=
 =?utf-8?B?WkoxSlJEbDNueElKZklHa0EzVElqQU0xa3JycnpMcC9VaEdzZDRjZzN6V1Nw?=
 =?utf-8?B?YkxzemJMakRSQXFEQk03RTM5REVzbTVBbEluSkszV1U4UytLNHAvczFCM1pv?=
 =?utf-8?B?TnBpaDdhbXpKMzhHUUF2NkUvemR1WkcxOXlaeE5jamFzS1BQaTZUK3R1OGto?=
 =?utf-8?B?OGZ4RHpaWWpLdzBvLyswQUJ1UXhuQnlmTnc1SFlLL29mRHNXeFE5MWFFYmVm?=
 =?utf-8?B?VElRQy9zSnd5K0NIZm5LcmhSSXk4YndEdXJISXY1QmNrRVZOMXhyM1hVU0JN?=
 =?utf-8?B?ZDVYSHgzTTBhQllZZTlKTXVmUHo3R1BFV1VUemZaY2MwOVdJaWxUbDJmNEF0?=
 =?utf-8?B?VTY4QXpXS3ZudmQxWkl1bEt2bUpNalM3aFhoSVZDTlhaM0JUa3NTL1IvVmNF?=
 =?utf-8?B?QW1pQkZPUTF4dDFqcEFXcnBmUEpESHZ5TCsyV24xSVlmUURBeFVtOWZDT0Qx?=
 =?utf-8?B?VU1yZ3VjaVZYeG5KTEhZeDdDKzVLSlNyb1ZMQ1FOc3Bnc216TTV6SWk0RUR4?=
 =?utf-8?B?bmlCTURFRGtndGtpOWJlZFR6YmRUZkRLRk9iVlZUMGNSSWdQUFdMancrcDly?=
 =?utf-8?B?WnV2YU5Kd3d4Zis2R1Q5TWw1eE0wNDFXZnhZYWNOOEtkNTV4dnRmUmhZa0tD?=
 =?utf-8?B?VDdtelVOZng0SzF2TkYxcFZ6UDNHRTVET2ZlNlVkdXE2S0hic0s3WVpLQmR2?=
 =?utf-8?B?a2NTRWlIVlJlUzNyMUllck1Vb1JLWlJJaHFKSXV4akVNaTFocDFUcVNuZnky?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2925c55-0df2-4cd8-7150-08dd8df97af3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:28:00.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HS4WVPdLTDIVbbXXdl0UDxht1pe8VEGEan1x95hm4O5d8LW23Arc2U9hGJqtlOr+jHlYF3vhGsSLfXxkEVE+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7687
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

On Fri, May 02, 2025 at 01:32:33PM +0100, Tvrtko Ursulin wrote:
> Hi all,
> 
> This is another respin of this old work^1 but this version is a total rewrite
> and completely changes how the control is done.
> 
> This time round the work builds upon the "fair" DRM scheduler work I have posted
> recently^2. I am including those patches for completeness and because there were
> some tweaks there.
> 
> -> It also means people only interested into the cgroup portion probably only
>    need to look at the last seven patches.
> 
>    And of those seven the last one is an example how a DRM scheduler based DRM
>    driver can be wired up with the cgroup controller. So it is quite simple.
> 
> To illustrate the runtime effects I ran the Unigine Heaven benchmark in
> parallel with the deferredmultisampling Vulkan demo, each in its own cgroup.
> First the scheduling weights were the default 100 and 100 respectively, and we
> look at the GPU utilisation:
> 
>   https://people.igalia.com/tursulin/drmcgroup-100-100.png
> 
> It is about equal or therabout since it oscillates at runtime as the benchmark
> scenes change.
> 
> Then we change drm.weight of the deferredmultisampling cgroup to 1:
> 
>   https://people.igalia.com/tursulin/drmcgroup-100-1.png
> 
> There we see around 75:25 in favour of Unigine Heaven. (Although it also
> oscillates as explained above).
> 
> Important to note is that with GPUs the control is still not nowhere as precise
> and accurate as with the CPU controller and that the fair scheduler is work in
> progress. But it works and looks useful.
> 
> Going into the implementation, in this version it is much simpler than before
> since the mechanism of time budgets and over-budget singalling is completely
> gone and replaced with notifying clients directly about their assigned relative
> scheduling weights.
> 
> This connects really nicely with the fair DRM scheduler RFC since we can simply
> mix in the scheduling weight with the existing scheduling entity priority based
> runtime to vruntime scaling factors.
> 
> It also means there is much less code in the controller itself.
> 
> Another advantage is that it is really easy to wire up individual drivers which
> use the DRM scheduler in the hardware scheduling mode (ie. not 1:1 firmware
> scheduling).
> 

Admittedly, I just scanned the series—so it might be easier for you to
elaborate on the above point.

With hardware scheduling mode, the DRM scheduler is essentially just a
dependency tracker that hands off scheduling to the hardware. Are you
suggesting that this series doesn't affect that mode, or does it have
some impact on hardware scheduling (e.g., holding back jobs with
resolved dependencies in the KMD)?

Follow-up question: aren't most modern drivers and hardware trending
toward hardware scheduling mode? If so, what is the motivation for
making such large changes?

Matt

> On the userspace interface side of things it is the same as before. We have
> drm.weight as an interface, taking integers from 1 to 10000, the same as CPU and
> IO cgroup controllers.
> 
> About the use cases, it is the same as before. With this we would be able to run
> a workload in the background and make it compete less with the foreground load.
> Be it explicitly or when integrating with Desktop Environments some of which
> already have cgroup support for tracking foreground vs background windows or
> similar.
> 
> I would be really interested if people would attempt to try this out, either
> directly the amdgpu support as provided in the series, or by wiring up other
> drivers.
> 
> P.S.
> About the CC list. It's a large series so I will put most people on Cc only in
> the cover letter as a ping of a sort. Whoever is interested can for now find the
> series in the archives.
> 
> 1)
> https://lore.kernel.org/dri-devel/20231024160727.282960-1-tvrtko.ursulin@linux.intel.com/
> 
> 2)
> https://lore.kernel.org/dri-devel/20250425102034.85133-1-tvrtko.ursulin@igalia.com/
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> CC: Leo Liu <Leo.Liu@amd.com>
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Koutný <mkoutny@suse.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> 
> Tvrtko Ursulin (23):
>   drm/sched: Add some scheduling quality unit tests
>   drm/sched: Add some more scheduling quality unit tests
>   drm/sched: De-clutter drm_sched_init
>   drm/sched: Avoid double re-lock on the job free path
>   drm/sched: Consolidate drm_sched_job_timedout
>   drm/sched: Consolidate drm_sched_rq_select_entity_rr
>   drm/sched: Implement RR via FIFO
>   drm/sched: Consolidate entity run queue management
>   drm/sched: Move run queue related code into a separate file
>   drm/sched: Free all finished jobs at once
>   drm/sched: Account entity GPU time
>   drm/sched: Remove idle entity from tree
>   drm/sched: Add fair scheduling policy
>   drm/sched: Remove FIFO and RR and simplify to a single run queue
>   drm/sched: Queue all free credits in one worker invocation
>   drm/sched: Embed run queue singleton into the scheduler
>   cgroup: Add the DRM cgroup controller
>   cgroup/drm: Track DRM clients per cgroup
>   cgroup/drm: Add scheduling weight callback
>   cgroup/drm: Introduce weight based scheduling control
>   drm/sched: Add helper for tracking entities per client
>   drm/sched: Add helper for DRM cgroup controller weight notifications
>   drm/amdgpu: Register with the DRM scheduling cgroup controller
> 
>  Documentation/admin-guide/cgroup-v2.rst       |  22 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   9 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
>  drivers/gpu/drm/drm_file.c                    |  11 +
>  drivers/gpu/drm/scheduler/Makefile            |   2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      | 158 ++--
>  drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_internal.h    | 126 ++-
>  drivers/gpu/drm/scheduler/sched_main.c        | 570 +++---------
>  drivers/gpu/drm/scheduler/sched_rq.c          | 214 +++++
>  drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>  .../gpu/drm/scheduler/tests/tests_scheduler.c | 815 ++++++++++++++++++
>  include/drm/drm_drv.h                         |  26 +
>  include/drm/drm_file.h                        |  11 +
>  include/drm/gpu_scheduler.h                   |  68 +-
>  include/linux/cgroup_drm.h                    |  29 +
>  include/linux/cgroup_subsys.h                 |   4 +
>  init/Kconfig                                  |   5 +
>  kernel/cgroup/Makefile                        |   1 +
>  kernel/cgroup/drm.c                           | 446 ++++++++++
>  27 files changed, 2024 insertions(+), 574 deletions(-)
>  create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>  create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>  create mode 100644 include/linux/cgroup_drm.h
>  create mode 100644 kernel/cgroup/drm.c
> 
> -- 
> 2.48.0
> 
