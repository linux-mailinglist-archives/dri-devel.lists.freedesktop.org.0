Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB609BA52D1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 23:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B29210E50B;
	Fri, 26 Sep 2025 21:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5+LJPfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB4110E167;
 Fri, 26 Sep 2025 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758921198; x=1790457198;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=R99wWwUovm+ZSdo4ScvosuxTNXkigvwHaqlP7POkJ94=;
 b=K5+LJPfVeZbm38TggStPaz0T6xboOXpyeyYxNqYjqqdsCwcyMLuPEhUX
 fhgt8tp1GB8wtVScOjn/E7OiNqpt0LwY8iQNdnNPVK2p2aV65Tr2QkETy
 5tAMKG/tiFrSF3qN9m1+MQA9ESEgvX/KThoUrML/h6zCyaWQ999VPw2/i
 7GNDQElkx7z6w95C/xUIClSPlJw1ec4PV6rTi5UuxPCnTN7GsV/L9Wok8
 bt+QRz98mS79DnoVh3y1yPLJmzmdyoHOjsE1YXfnMxr7ozUO7L5UhlH1d
 BhHY0I7+rOTfrijzuxRagBzBxwU90iwm6Fv/UtrFWeyW1xTjNoG4WHEfV A==;
X-CSE-ConnectionGUID: 4NLTHxFgSkmsNbs1CyG7SQ==
X-CSE-MsgGUID: 6AbQRnaTSemhkvZvcVTC0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61310392"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61310392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:13:17 -0700
X-CSE-ConnectionGUID: 8V4Ozp+iTRKIlDG7vFHKZw==
X-CSE-MsgGUID: xuqlixpYQd6isNr6TDAaKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="177763701"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:13:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 14:13:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 14:13:16 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 14:13:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHW64e+qazW6nxaHnTlsicNM8UsLSSFGoNhBfkjuXBmhTL8Lv1+DkkT7gmkjhLt6DugFZBD0Eq8Z5YO+Z5XGNTBj3zggdd5IqC4m1TqLlT/SWEghiES46mwbhY/UEHiJBpPityh8mLE7klueh1HndJ/lk4Ro5WEMh4GCqKs3uhAVD93uX9WwR2lpLYMQu/w6XBtGixJJdiAC2TCcz52tQKEEbYvR2kgKgThUGnnBNl9+7LiWDqZAbAlzAs/GL17Eyuc9SEx9geYeY6RgU8wWdHa6hzADdt3OKetMyUFWY0DRSVMQnDVJ0QzL50YxqH376064qPCwtv3ssS3BK/5uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1GcHceA4jXtJakY83Ay+xGB4DL25V4d4bR8KRE3rjY=;
 b=sKWurMQz9+vQqD2KDIp63c6f5Uy4pVbHQT5gaj8vCnfIZtr7ipiMm4vtOQ6Ja7GhvZK+iwYl/PmyccBBr1+ECT6G0z6/SaAPLYhee1ku/jFf28IQuhmrOHvhDbKkv24wVEoxW+7MhUwReSRp2Am74ZXwhwsVzH21kmaBTXZS1k7q7cA0Nnhp4Dt0au9xY+qdB2nvB5qeybvZhvc8ANoDH6HEdfDbihlGdPUclAOjh10Q1LpsYGrNB3lsToWUGspUaeahFmTD7rYNF4mjer0YpzGS/gDE3oA03QeshIupLxBW2pmJZS+n/PKF4qSPE64RW/8pi2uO2ELab3Alkz2pdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 21:13:08 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 21:13:08 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Vidya Srinivas <vidya.srinivas@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/6] drm/i915/dp: Work around a DSC pixel throughput issue
Date: Sat, 27 Sep 2025 00:12:30 +0300
Message-ID: <20250926211236.474043-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: b16b9876-f229-4052-c9d5-08ddfd417e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjMyMngrWWsxSDBSTW5XRjNPNTFQeE5DMVFpM3Z3M0p2OC9mUUxpQXhlQVlK?=
 =?utf-8?B?bkxmS1NzRlBrekllMTc4T1lWVGErb04zeGhBT0lUdTFOOXpYQjdBNHJMd2s1?=
 =?utf-8?B?bWIxQVA2OVlmSENodE5tZGxjdXNNNmJ6a0lPeFVHVXB1Uy9FNVRkZ1JHcjdl?=
 =?utf-8?B?WCs0UHJmS3JaK3pFYSszYkxjeXNrRUEzNmxuMm4ycjdBMm80eXlYbHRDQ3hv?=
 =?utf-8?B?ek5RY2Q0em9DaWNOTG5BdE9KNTlHL1hzUjZiUEZxeU5ZemRXa0krQU9TQzc1?=
 =?utf-8?B?NHMxOFVPS0g4UUlUK3lTcFhOSUcyRU5kYnRsZHVOUysydk5ta0kwMEViUnB4?=
 =?utf-8?B?QjA1NG56cHFyeFNteVcvTVJyRlBtNHhKMkV0R05xNjhlRFlsSE1TMmNST3ph?=
 =?utf-8?B?K1lqTDNxSlF4cHZFdDNvRDhKUkw0TFJNY0ZKZnF6NENPYlZRd3h6RmUvU3Vw?=
 =?utf-8?B?Z3o4N3dkMk1BYUlyT1VFRnhrNnIwTHNQbklUYlpCbEo4WlVraDBHODNYb1Jm?=
 =?utf-8?B?M2I2ak5CYlFpTzNhbE4wS3VCSGp5WnNFcSt0QUkyQ2M2blpJT3VTakdRY3Ns?=
 =?utf-8?B?Nm9reTM3aHVqbEgvN04rTmxZNmFaYS9lT1NjY1VIZitWbVFsa01PYUFZMG1v?=
 =?utf-8?B?YU9pN3M1Vk8rQ3BQSUVPMFpzSVI1UyttVURhZFRUSDZBeUNVYzVBMjRqOEcv?=
 =?utf-8?B?d1VybEgrQjBwZlBLVHpnWVVqRmx2ZzVlbnNXUW1BRzUvemFjdGU5QndsN0JQ?=
 =?utf-8?B?K0VzTlU1bHJuM2JPRG4xNk5LdDhWaloyZHhoeEVTYkk3SEtXNXBCNnRJV3ZD?=
 =?utf-8?B?Z2VsYnRZdmRoaW9xdXJsUTdmVUZTWnp4MzY1anNQamRVNzdHaUxXdVlpYXp2?=
 =?utf-8?B?Tm4yUXI3MnU5ZGtTMDZYMG5jOElPR0xxUXNyMGRMTkpBeFVrRktockN3NDI3?=
 =?utf-8?B?dHBDc0JidnVEcmlMUnhSREkvZUo4eTNyWHdLT25VTWZvMDdyMllEK2hHYXlh?=
 =?utf-8?B?SkhHUjlZRENGaXUreGVsb0gzZlMrRUdMaDVSUDNtMDZCWlU2Y3B2Yi9JTitT?=
 =?utf-8?B?T3lsSjh2UmdjNHJtK3IzWkQ5alAvbklaRXYzSXlzUFNJVDUvTnRHeW5CUmNS?=
 =?utf-8?B?OHZldnVVMUJ5L0ZzSzB5bTlFYVlTWjcrV0ltNlZMcHhJcU1ZTDArK2FSY3BI?=
 =?utf-8?B?cGY5eXFPNzdpTHFaenlrV0pwZ1dyZ3F1Z08vSkpPa2JhQUNlbTBGN2lQcnlR?=
 =?utf-8?B?NkpxbkkyTHVJbkNkOW9UWWZqZzJjSnlRR3ZjNFp1OW8rVXFFMFpUdkloL25j?=
 =?utf-8?B?TEdIajlFSVFuWktidnJKYk5aRzduYzNYUmRJMG4wSG0vZ0hYUnFiL0Zqb211?=
 =?utf-8?B?SndZZVEvak5uS2U4am5iQVlKNWtPcGRzOFhwQmRVVWN6ZEJ6OFhCYjNrRGxR?=
 =?utf-8?B?bERKZ1FtYmVISnlyRHord3lVVENDUy9BT0E2LzZHWkg3RXFnc2IrYk9Nb28x?=
 =?utf-8?B?UU1SU05ZWFdyVCtTREVOUnNWS1RQaVZrVkpWVzdWOTN1VTlycytzM2lKTkhU?=
 =?utf-8?B?VVZ5Z3NmME8wQjIwZEdMY1o4UUxGSW8va1JlWHYxTjRuYUZ2bmthb0hnZkRo?=
 =?utf-8?B?SExtZ21iOFlNRlJ1QlBkUytuNDI2RnIvREprQVZwSFlqTzhDWnZxZXkwQlo3?=
 =?utf-8?B?MUFxZjk4VzJLVUZ4TDI2YnphSDFGRlRuVjBUK0NjWkVYWEMwVXNYb0h0a3dF?=
 =?utf-8?B?UHpMMHVwYjkxdGpTTzd6QzlEcXZCeE5hMnY4Q1piS0xqOG9uWEtzNW5KVGtK?=
 =?utf-8?B?dk5HT1dBOTRLdDRiTFp1ZS8xQWNyVTlISTlqNXNkeXBsdmxwZkJ2U2NhZlhj?=
 =?utf-8?B?ZG5wVGIyOGovRURmVjdDQ28vSm9XVlVlclpGV2tmZjFXRmVnZDgwemxBMDQ4?=
 =?utf-8?B?dkN3MWs5VUtNWjNSd2NQa0psR0I3N1BCb0JzUFRZMjZ2WlhiU2tUTVdWelA5?=
 =?utf-8?B?NllCa0RmclVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWFpUlYweDlEWnJ3eDZ6aU9jbXEyQlRNbnVMT0JhTUlRMmNKMU9BclN5ZG5Y?=
 =?utf-8?B?Z210NGlPaFFrQkxQSEFjVUFYaUwycHJUeTZoL043REdXOGxGUnZFVUtuUmhM?=
 =?utf-8?B?cThkSDZHMjgwL1ZkVjZzemMzUU4waDUwT1VNaXZXczhwWngrZUdOUTVaNzNj?=
 =?utf-8?B?blZMVFBSY2t4VmpqUHNwM2kvRlFUOWlNYXpoZDhZYiswNW1nY3Q3bzJCNklj?=
 =?utf-8?B?ZWZyYlZvNVZ0UTNSUnArM2g5bmh6RjdYekRoZjRTL0VVN0tuKzFHNUhMUEpj?=
 =?utf-8?B?K0tEZUpCWEhVQWsvZGZWdVl4RmcrK2JRNzlZdlMzZklybkY0eHFCVy9QQ2p4?=
 =?utf-8?B?YkVWa0ZKZlJSaHdEaWRZS3paNzFPWVE4MVBoRmhBa3lvNDRWM1krYlo3dUlw?=
 =?utf-8?B?VTFlL29vQW4xTDJEaHVFMGxmVmlPNzJhelFpUmtRSTViOWRiVkZIOXUvNEpy?=
 =?utf-8?B?Ymx5VlRra1ZxV09Lc2c5VTZpM2JHVW1ZVnZLaFRlMFpFTUQ3OTN1T2Z3bkx0?=
 =?utf-8?B?QWNsaTdURUwvOTJLYlZvSlN5Q2haMFBMRDUrZ1B5c1BrNHBwWWxveFhsOFhY?=
 =?utf-8?B?bjNUNDNhdlROOVVOL25qQ2l1ZGIxNU1LSzkycUx2bzdsY3k4ZTVYdmNDQzRJ?=
 =?utf-8?B?V29leGFLUDRJeFRCM3FqckI2M25vYUxkS0h2c3JHMWo2MkVoUnVEUW5KQzJw?=
 =?utf-8?B?Y0V6MWhLMFpDa1BhWnNCV0pzMzlGRStEUzZjUThEa21YMS9RVDF0UmlyL2xl?=
 =?utf-8?B?L2FlbVk2SmcwNUNMaDI0SmNabTVzYVAwbVYwWmkwMU41ZUNzMmZRRGhobG0r?=
 =?utf-8?B?b2VzTkhnTjQ3eXpBeVhzRHZjVWw4OXpmT3NES3FibGRSQlJxSTRld0NZY1Yz?=
 =?utf-8?B?am1jQXl3ekdGaXB0WG10TWVXQUZib1cxbzIvY0FrNXZjVzNNMlU2TGNJZVlU?=
 =?utf-8?B?RFRrM0JNdFQrNHZZeERnWWE4VUZUSVRuZHJzV0gzYkI3OVNpTXEvN24xc1RJ?=
 =?utf-8?B?ZVAyVjh5M2ZHdEFVOXlRd1F1L282NHNvV3RkT2VtYUxuNExPQTV1eEdGMm4v?=
 =?utf-8?B?TUptWGw0bStEZzQyNkhWWURNamRLQjZNYThSK1JMOWs5VW1CWVVmSEtENmVa?=
 =?utf-8?B?WEIyd3FhNWVvUXhUVmRTb2dSd2hkVkQ4eTNOQ3FuZEdzV3dLWGRtUTlwbXBR?=
 =?utf-8?B?QnJWbDE0bDFjT2dOcXNzdE1sejVra0t0V05SMGMvSVJFdEZ2QmptOVdPNWYw?=
 =?utf-8?B?UlpQS2czQWpOV3FRaTMwQ0hQMU0raW84eFFDUFVNR2xhYk5hcWFmU3RmWjBB?=
 =?utf-8?B?YW5DUDBDd2JlVmtVY3hIQkRmSnRtb1o0VG9YZm1lY2VZRWhNdU5PWUVGY0oz?=
 =?utf-8?B?cFR1cUthRWU5ZnNhVks5U1ZWeTV3MnpSSHJvaTV1TmlMSVlPTUtvTG9rRmgz?=
 =?utf-8?B?MjRpL1dvbGR2dVVjUEJxZDdVaCsrUDRheEpIcnA0cnZ6aGdjVGZ4ZlBWdHV6?=
 =?utf-8?B?aUh6Mytsa2NZV1RNVWJXNXJrVzZibk5waEhCa1ExaTNUYVdTaG1zWnNUTVpo?=
 =?utf-8?B?QUx6bG5rQ2NJUitDR2Z2amk5QnkxZkg2c2NyaHhKbmJDT2tSZGo0dlYySjI0?=
 =?utf-8?B?S2piOHRlYTZ1YVhnTEtFMkU4OU9xd0QyQ2tSbU9OY2ZZSGptQ2lBbTlmQUx4?=
 =?utf-8?B?SGtEVUpvVk1iSzc0b2YxR1VqaGNPRXFIWlk3NDZnSGlSZUp4R3JYeDlDMmhM?=
 =?utf-8?B?V2didTFXQlE2V2JVZVRIeldqWjQ2WmRlUnNORndKRHAxdmZZNktldzdIeTZy?=
 =?utf-8?B?SFZ6Q0pYVi9ZMkdYWnAxcnlrTHBaTUNsYndtQ1l5VHB1QjZsekNmcHpySkxQ?=
 =?utf-8?B?VldTTlBsZy9VYjNFc1hGbDMzdk5yYkU5eFJ4ZU1WMC9EMXdHVDkvUjRvMmpC?=
 =?utf-8?B?SUNUQ1pFV1RlZFVEb2FBUWVOSTFTVVZiRDgvcXc2aUkvRjBsOERyRGVRYWdp?=
 =?utf-8?B?b09EZWRLZVlORm9oSzAzV3BWVjhKeHBzdEZIT0l2SnpLMGdZKzdpYWI4ZDdy?=
 =?utf-8?B?U1FQVkpESTNKMlVwdmhPZDFURzc4Qkc4VkNXZUtEcG90dzVqcDl6aWhLRFdF?=
 =?utf-8?B?QzhXNWkvdUViRVV6UGJJYmp0ektJL3huUmNROTdSSXFsUmNIYlZ3S3c1RkNY?=
 =?utf-8?Q?01CLCDs2gxcpY/tpLwJr6FCA3+Z+NrXnepwrxY4RX/8W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16b9876-f229-4052-c9d5-08ddfd417e12
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 21:13:08.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7YHxdkJSOCR8ZrG/uNjeJLosXGB7qQNYFM0rla1+6TJ+5O8M6IIup1UsUVijejV2gJ2Hq+auAcmRHVq7eZWWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

This is v4 of [1], with the following changes:

- Fix drm_dp_dsc_sink_max_slice_throughput()'s name.
- Use the clearer peak_pixel_rate vs. pixel_clock as the above
  function's parameter.
- Clarify the meaning of peak_pixel_rate for MST tiled displays.
- Fix return value from dsc_throughput_quirk_max_bpp_x16(), in case it's
  not required to limit the BPP.

[1] https://lore.kernel.org/all/20250924152332.359768-1-imre.deak@intel.com

Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org

Imre Deak (6):
  drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
  drm/dp: Add helpers to query the branch DSC max throughput/line-width
  drm/i915/dp: Calculate DSC slice count based on per-slice peak
    throughput
  drm/i915/dp: Pass DPCD device descriptor to
    intel_dp_get_dsc_sink_cap()
  drm/i915/dp: Verify branch devices' overall pixel throughput/line
    width
  drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk

 drivers/gpu/drm/display/drm_dp_helper.c       | 146 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   9 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 146 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
 include/drm/display/drm_dp.h                  |   1 +
 include/drm/display/drm_dp_helper.h           |  14 ++
 7 files changed, 316 insertions(+), 14 deletions(-)

-- 
2.49.1

