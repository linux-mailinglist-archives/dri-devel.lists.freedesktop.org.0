Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81DBF917B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491F510E65E;
	Tue, 21 Oct 2025 22:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzGr8ah0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6115810E663;
 Tue, 21 Oct 2025 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086617; x=1792622617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=26mwwelTWd8lJtfys+Vzcu4o4OpVPbHEnBl7KcRtV6A=;
 b=jzGr8ah0aAMmCVF4HSAQpp8Q7bRl75k60M8jZhzTnllNLiz3DT0nxomm
 5XfkttnupAGvbSk1zJifvinid0hB/0pAEOhqOdInC00OsJ+X6uCrfwVyP
 NotsEvOpwc7XGLLUF/qJNZDgGKGczdTBTK2x3P4Thc76701wWZ0kgCahR
 HzASVohwGhC8vpnavCtdqa/kcFUDMF4ey5WS76Q6D8e2xCu9fvl93IlhI
 NA002EvaSjKmSAyQNZHfQ1xHfgP5nsgOqNlHFtCRqo+z1lN7ICfBfgU8f
 66pF1JehDw9BxglUmMpfPS0C4vWl303gl9d7w7s6SB9ZLU6r1tfUlUeGf Q==;
X-CSE-ConnectionGUID: 15GFifHsR1aesKntlaIUSQ==
X-CSE-MsgGUID: +cmtUofgT7uqIwDufVvKLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63135549"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63135549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:37 -0700
X-CSE-ConnectionGUID: gX+aJlB3SL2jbyidmrarcw==
X-CSE-MsgGUID: NjjFMegxTbqEbK7j5EuJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183644520"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMeQ43poejNf6yO1TwpI9hWnt6a5J+wr4IGOT/aNA+4Go6pQLgoDk7d1Poa2hLA0UpM6bxAKfrAZIb5leWmv+G/UNsZ0yvGH5Xg42LiyLIMWX7Fbkik38omf1vEDTRBqFT0I6nMocZUDsiO4EFITUh26XDeTaSCL/SZKSQvKzY2p2glY3rffJ2xxzCe3LsAkE23aPhhuklrk+fOnwVxW5K9dqVXrHHiMWl4AJ0uFovxDC0Sh6xX1v1clBocB/kyw5HrObdAYclEmXkNtpl9qaE7ll6bX5WI1IOMZBW9plG1+4Hiu5Ej2WgbR3Xjm7W81o/7BnH0+fmWlkECMaW22iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKulIOM5Mq741cNhxOe0HK9ZUN5oG4HzHTaRspecg3c=;
 b=ZMibHXyYketfFMgXu4nY11nblNvMUqdkmUeZpY8uuzJKRReMRXZnba7A7DmpTN6FowCyADwDLKx0e2fp+TdoVxdbFx2rRK8j8mbGitcdDg7aPOCceeQsHi3E4hom2w284SKLaigMqwlQ143W/RiBzMgtq59PvO9sWegXI/oxTSZ4OtiUdcgoO36jIMghyRWg3VjTf5LvrhGJgYMQ3Dzx8N83kx8YZGdEWUPPP6/dCx3hEdX8r8vJODrOcp35Iy3lvQ+pAph7e6s2IRK/StgZhx/nKYuPiKHt1lifUcH2jH79AZYcHI4ZpQZ2Ag1FvgwNjiXXv7y29wL6voi0WHoLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:43:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:34 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 18/26] drm/xe/pf: Add helpers for VF MMIO migration data
 handling
Date: Wed, 22 Oct 2025 00:41:25 +0200
Message-ID: <20251021224133.577765-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::30) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: d171fd66-a40a-4342-a45e-08de10f34463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWVnUmVGSHpmYUFDbUJjZjA2WVZiNXNOWlFWRnNZbzdWUmlxdU9FcmJIWnJT?=
 =?utf-8?B?Z2RtNzNML2ptdVlCc2p4aWg5L01ETGV3YWQwcjg4Sjk3NlZYUTBUZnVEWkpr?=
 =?utf-8?B?ZmtpTmtqS2VjaThHZitMcFNNdTBUck5aMEdiT1RGWjRxdXhramdGQVE1MW10?=
 =?utf-8?B?UlBtcnE1Y1YwYTU1OEpwMnNTbk96TDh2cUFsUWZ4VDhydmRseDJZNmU5czhm?=
 =?utf-8?B?N01kKzM2STF1L0dvWjNjcUVKSDBsZURpMk1xRTRnY09Ta1h1NmJWRlZ3cllz?=
 =?utf-8?B?RUVJeEZxQ2xqL1pWNnhYTWZ3ODFSS0lycnpkSHowT21pdVJaOGk0L3ZGOHlR?=
 =?utf-8?B?U0Z1OFYySzJPVHZsOTcyRUtxdkFPcUZWZzhqK3MvVlFxb0owQlVobDcrMDIr?=
 =?utf-8?B?SlZwd0Z6R2wrNWdoeVlaeEIzUGhvYy9tODc3S2J0ZU1QcnUyN1NPQy84eWJM?=
 =?utf-8?B?MlVlcjhYU0hUM2xHSldGdENzQVhESHllYkdCTFdUN0l4am1HQ28zalhkN29F?=
 =?utf-8?B?UkFKMGNKL0lIVHR2OTdhTTFmUGIrZUlWTEJuaG5LSHR0Q1pzYUlxNjE1N09s?=
 =?utf-8?B?eVNBNmVBSjNTMVNibldjTjBoT20rR1lGejFQVjZacUlaL0twY0xGeWc3eHpq?=
 =?utf-8?B?RGZDRkh2WVBoWHF1RHJCYTZFSXZjdUJJWXdoM1RNanNBTG1XcjdTU3FDUkV6?=
 =?utf-8?B?UzhnV2RHTDFiWG5BNFkzVi9iM3hiME5Ec2VKcVJ1eXpWTHVsNnNNK1p4ejlP?=
 =?utf-8?B?TC9QV0dmVEZ4SWlTQWY5Q3IyZ1NHUkFNU0JNVDlHR2I3d2x2QWFQK1BlUVNz?=
 =?utf-8?B?VVhlZVMvOVFXRk45N1FxWWtYcEorRmsrM1lnMlg3RHhJdnJuV0tzMDlSZENI?=
 =?utf-8?B?bHBYQXA0MW1zQmhQRkRsODJpdGRRWm5YVU5PTUZiSnQ1cCtSRXNhUisrQnQx?=
 =?utf-8?B?c0hoN2J4MDVqN1gyUDlnQVI0eFlhVlFydjB2M3hkYVJPS2cwNWFBN2RQdDBD?=
 =?utf-8?B?RWhKbEFBVTBLNFBTc2p1MWdPMjlEdzFQQjVyamJXaC9mYVJOdktZYjJvSzM2?=
 =?utf-8?B?bnp0MUVvZ1NKVFF4cytGMTQ2QVdBSkl0NFJ6OTFEUXp1VTl4Y1VmdFlYOEYx?=
 =?utf-8?B?VUo3bldsd2dXZXlOTmh4NndVTWpKNEVuRUk4VjJ1UG56ZnJaWHlhWHJaVzVt?=
 =?utf-8?B?aEU1NlFjaG1GdTM5aXhyODVIUUdVMUhxOW1BRmhra1ZSbTZ5ZTVYU00xQStD?=
 =?utf-8?B?ZUJERlpVUzdaOWlhQ2taRTJFeE1weURVVEV3WEpTUUw2SmFKcjdDeWhHd29O?=
 =?utf-8?B?WXVQdGZ2UWlZamYweG5VRXMrZUIzMjduR0p2cVFMMG8zYXgxV2w2ZjlXL21P?=
 =?utf-8?B?MGVGVms3Y1k1ZmgrQjQ4L2lPdGZaSkxBbEppL2xRK1p3ay9rUlF6N2lJVmdu?=
 =?utf-8?B?YVlVMVNWV3N2T0NOQTRBMmRUb29kVG9oMVl5ZkNKL2ZlTElrcnRRUzdsZStW?=
 =?utf-8?B?bGtHRDFRdi9BajJZMzZJM3lnZWVZT0pTaHZncjFvVDRkbGVkSEFaNm9GUDB3?=
 =?utf-8?B?djZnL3RzSXB3RXBHcVFXL3BWalMvbUlkUGVvN2ZSRmtWSzF1d1RtZ0paaXdY?=
 =?utf-8?B?YXBQV1RRUGtuWlJLVGZOMTZKQ3krdUEvVmVmcUd4MkpCUStERVhyclRQN3Bl?=
 =?utf-8?B?WlFhS2NLOUVBeFpyaGo4NTgxVUlGZWQ5QVBRZkg2YldBQlpHc0xzWVBsQ1ps?=
 =?utf-8?B?VzZIcElYNy9DNjZyVGhITEZQY3FUVEtnNXEzTWV4RDE5MU1RZjN1Q1hyT0VC?=
 =?utf-8?B?NXNGczVKb3RjdWl1eFZld2tSZ1lYSjhlRDRQbktJYmhRdEdxNHptcnI5cy9X?=
 =?utf-8?B?MUJoWXkvUURkSFBORTd6M0pyUlpGSTBoVnR0QWh4dFJFTlJ2UVZwb3R4LzNk?=
 =?utf-8?B?eUc2ZUQ3VCtQekFMKysxdU94dVJBdm8xeGc5MUswdk9HcTIvckFaMDlVQmg2?=
 =?utf-8?Q?PaKmekXaS0xb2rAqu/dxtXWYsgoHIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJML2lGSlRBVU42MTJCT0NaWnF5di9ZYm1sUkZscTU1cXRBNDdFWCtieHho?=
 =?utf-8?B?OUM3czUwMmttcDNFYkVCR0dpU2VHMVlrdnNndEtZZW9Nbk1Ia1VqWi9NYmh4?=
 =?utf-8?B?RGFxM3RQRnJZeDlYRDdVY0JYTm9JK2tmTmpUWHdZVzlHL1cyYVU3UVV3M2V3?=
 =?utf-8?B?bmd0YVh5Ung4T3VQVVdwVnFJS25JU1lYbXVxTTZWNjl3ZGVHU3AzZVNVSmFO?=
 =?utf-8?B?em9uNEI4RWJreFd5eHBzWHQxNXo5bVNIRStMY1BIQnFwblZMWWt6ZXk2aHlF?=
 =?utf-8?B?L1JRMk5nbk90RmV5OEMrYlFWc0JGekFBV01OeUJ1V2JUVm41MVk0eWE0ekti?=
 =?utf-8?B?Z09RRFNlL1g1NHVBQUFabHo2aEkvUXVkdDM1NldHQVJHN3NERFRoekpDckdH?=
 =?utf-8?B?aktnLzBKUTkzUmFYY0pPN0V6NFpJcTAwVzJYU1ZzRkk4Y0w2U3FsUThBVDhp?=
 =?utf-8?B?dE5QUFU2bWtkMVFaN24ydkw3Y01QOW9WdkJ2YVJjb1Bad0YrYmRqNDJ2WVlr?=
 =?utf-8?B?NlIyUmZpeEd3MEE1djhCcW1MOE52eEIrTVFtazhBcUJQU0llU2NsRFFoOWNS?=
 =?utf-8?B?eThIYVRHWDNLdklpN3lxZzJQOHhUSVAyR0FUN1ZFbXhRWElXVXpQa1I5Q1p0?=
 =?utf-8?B?STB4VDZycUVPcGlMbWRpdFh5c09lVkNYbjBVRjY1aG54MENvMFlLZURDQkFn?=
 =?utf-8?B?ZmZTVm5vU1hsVk45MFVMcWpPLzh5Wjl6QThzeUc0aWlrNS9wUEJCdlBrQUZo?=
 =?utf-8?B?QkdzK3k3OThtSWVBVjRXNzFONTlOTzFkZ1BpRFNYY09uNFdlcW0xR2NGc3Vo?=
 =?utf-8?B?bnRvRGNUM2dhaytLUTFrT2JrZWYwSW5WNjNGSHliaklTbXpMVDdLS3F2SGhD?=
 =?utf-8?B?VWpFT1Z4UElSNE5rZGpIeFBraitkWVBaTm9EMGYzbkhXaU9oZ3lIdWg5NmJI?=
 =?utf-8?B?OHNqL2pzNmpDTXhFY3BlVUh3RzBITGNSemR0WXJWVmd1OUpwRWFoaGlHZmxL?=
 =?utf-8?B?Qk1YSjc5UmlLd2JrdTkxN25TZXBZeDA0SnVHdCtySWpyMTJyOHhyaEU5amJB?=
 =?utf-8?B?b2YwREFpWUUzc3k4TEJHNm5LdUFTRkR4WlhKaXZBK0g1SVVCNGN0QWVSS2sr?=
 =?utf-8?B?TkJOYXc0WFlSNkZQdWVtd1dMUzdPTzF5NjBBWXlxYXhpaVJJS09ETnN0Q3R1?=
 =?utf-8?B?RkJaaW5NSm02dHNIWXlTQ051RERZUDZZcUxHcDh5emZqV1hDWCtGRWYzTTZx?=
 =?utf-8?B?ZDZodWJYcHFPbHFSSm5tY1VRRENNMHFoakJmV3hhVVZOWlovc3VzZjdRTHU0?=
 =?utf-8?B?UHU0SzVtUDUyODU4aEg5akhULzkyM3NXV1pyc0wzS25kWXJFZGxLK0E5YjhV?=
 =?utf-8?B?a2pvNXl0V25TbU16WDVWM0Y0Rkd3b3NzdUpPQlBua1I3SjZxc29DT2hWN0U3?=
 =?utf-8?B?eUp6Uk40bVIraTN4QlN5bWNQU2RxcVlMVkVtM0YvenpkM0E1K0JzaWgvM0sr?=
 =?utf-8?B?V3FZN1doVSs0R0JLLzc0N1kxNkl0MDJNaUllVk9rQmcxaU4wYnVyalJYZzRG?=
 =?utf-8?B?N3l6UjJMM3hWYzlIemlVVTZSck40WmMrTGxEYnFJQjQ0dlVNYng3S3BZOUc1?=
 =?utf-8?B?OEFrZW9nNm5SRk80MWNUc2E4R2FDb1VyYVBPZHhOY29GMFpZUGNHRHpUcjNF?=
 =?utf-8?B?aUYzMUFGa0pKem44VkZ6cUh2RzBrOXhvSW9tRnFlVkovb2pPVy9RL3RGMDha?=
 =?utf-8?B?Wkl6d2oxRFBRcGpKdEN5bzdGUjNacS9nc0Vod1d2dDA3YURsWGRyclBCYmxu?=
 =?utf-8?B?dTFaNFhnNktIbk9qRlZ0ckNBKzZaMWtSTlZPVjI4eHY2Y2tIRDhWZjA4cEcx?=
 =?utf-8?B?Q0tkdjh5YVRvbU5WZHlRVVV1VCtHc3NxYWFMWERBa25FR0J6WEVkSGkzQWEx?=
 =?utf-8?B?Z3ByU0N4YUcvcy9ORXQ4SkRFTTZVMW1YYVJUUnhBUzR3bXQ1WVA1aUlRblp5?=
 =?utf-8?B?QzZOMUZNWXVXNTcxNlRSMkhpZ1hLL1ZuVkxma2p4ekNUTGlVRHFGK1FySG4x?=
 =?utf-8?B?bFRmSzVzS01YYkh0K20ybzhXcHptd0FRUWUvc0gwTnFMYW9DOGxKRThiR0Fj?=
 =?utf-8?B?eDJFc0REa2Y1WXZsYXkzV01VaTdWcTVRMW9FVUNBcXdYRHcyaTg5aWsrUHNK?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d171fd66-a40a-4342-a45e-08de10f34463
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:34.4983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6A376BofeU1EidEGjUJoXiFQ4jXB4PhMRcrvz6FX7y2467T2wfGekE3GxeT1/Hes/+RnIJx5jELq7px4hVyyeFlBocvSGOaDobKLiCClxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

In an upcoming change, the VF MMIO migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the VF MMIO registers.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 88 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h |  6 ++
 2 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index c4dda87b47cc8..31ee86166dfd0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -194,6 +194,94 @@ static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
 	}
 }
 
+/**
+ * xe_gt_sriov_pf_mmio_vf_size - Get the size of VF MMIO register data.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier
+ *
+ * Return: size in bytes.
+ */
+size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_is_media_type(gt))
+		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
+	else
+		return VF_SW_FLAG_COUNT * sizeof(u32);
+}
+
+/**
+ * xe_gt_sriov_pf_mmio_vf_save - Save VF MMIO register values to a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier
+ * @buf: destination buffer
+ * @size: destination buffer size in bytes
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
+	struct xe_reg scratch;
+	u32 *regs = buf;
+	int n, count;
+
+	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
+		return -EINVAL;
+
+	if (xe_gt_is_media_type(gt)) {
+		count = MED_VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
+			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
+		}
+	} else {
+		count = VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
+			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_mmio_vf_restore - Restore VF MMIO register values from a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier
+ * @buf: source buffer
+ * @size: source buffer size in bytes
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
+				   const void *buf, size_t size)
+{
+	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
+	const u32 *regs = buf;
+	struct xe_reg scratch;
+	int n, count;
+
+	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
+		return -EINVAL;
+
+	if (xe_gt_is_media_type(gt)) {
+		count = MED_VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
+			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
+		}
+	} else {
+		count = VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
+			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_sanitize_hw() - Reset hardware state related to a VF.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index e7fde3f9937af..7f4f1fda5f77a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_SRIOV_PF_H_
 #define _XE_GT_SRIOV_PF_H_
 
+#include <linux/types.h>
+
 struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
@@ -16,6 +18,10 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
+size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size);
+int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
+				   const void *buf, size_t size);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 {
-- 
2.50.1

