Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822EFA64C53
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 12:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61A910E3E3;
	Mon, 17 Mar 2025 11:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfGViCKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86210E3E3;
 Mon, 17 Mar 2025 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742210523; x=1773746523;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v6/3+LZgtaZBz0WqMWux26Xd5VqFQEjnvnfpwsdLnvM=;
 b=NfGViCKl0q5+io3KsFVavbiLZ4znbGdpqcXE9NAALdjmuFpGShuL5bkI
 IiCOG09+34XW9FPAQwuQNFa2KMgeDyA+vxqLSOOASHdJ2B4CQNZBKR4ju
 PKVQyRatlxX+CG0osRttWNGm6dv3ASDsILETKuwgWRP/CIcRGlg71NuYo
 ed0vyNhLo1mQSKumGpkHG0MtnyCbGbP+egthif7OnEV0lZ70vsztgfE75
 gUPsvX8whtfR0YM8nxHWqcbvarnq02sP887IWafiYp3e26dLRCwzt5ZSe
 pPCeU5IRSD9bOdSCvxn2bLRMrSvpRLsBYJTV6UPusOIXShsFgK7cPF+5i A==;
X-CSE-ConnectionGUID: XD4O6DqiQ4adjLfn9J7PGQ==
X-CSE-MsgGUID: oH8ShlvyRuuibr6lUlyU6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43403134"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43403134"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:22:03 -0700
X-CSE-ConnectionGUID: 775rzNTMRZm3Y9aruGkzJQ==
X-CSE-MsgGUID: ukPAsExZSKeKIuzUh+SAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122093593"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:22:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 04:22:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 04:22:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 04:22:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMx1aZbsA5WKcAtDjE46JTe0pZQd2gilnBJmK5SnytRFL84A1ArMWvwVeStKQ2twM7rd1x6hCq1gdTH1HrqKdn86QsiDgxsO0upLwaaYjpX/bVB4+6S8jnucR/4jsbS3U01Uh1Wu06RQYaJJ/ygDYr7Mq6epozs6GVQ1FilW8tAjQF2jfY1POPQv+kOG0GFUcFlxuaM0/AEkO7ALwjU7fHm5A9NUOddE40ZhXyAIHwhIosZ8+3FZRnEixUZXMGwOP8gjFOxDF8lfk0Bf4iZqTQpBmF4YFtj6IrcDnlCL+zq4ODMR+DsOkoXp5KVNW8Cdz7ybbepRUutrY7fuipPf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWr3CLluP/aOMdyVTV3X8knvgrCVeX+5I2twvQSz7Uw=;
 b=LcmHtlMHpsqE0ZxBFllkHmCetdhqP+VKC4YA2nf192I9SbMwa4Xz0tBQhRCKJZiP01Qc9LIfUiBdUSqn7isUr2wjBRuPLkqJ6Toy7miXUU0bvljK86uDQM4OrnYGE2L2mWCh2l3MlDxwqzkLV7EMi1x8SX+agl1xWFdr0TRIWiOvDB4grs/naOsI7VXRtzGeWkoQ6pnHPR5Q5Xr842pzw/xuovbdIT3yIHike05Rlk8/JLkHcULvXmjd4sOWP9gtJhhDV5AUk+31nO/346DpuquRIR5NwVkRubUXwEegyuil7fFqsSkz3AK1X5RkY1IwzHslxY3Ibcvv/vAvwc9zZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8579.namprd11.prod.outlook.com (2603:10b6:408:1b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 17 Mar 2025 11:22:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:22:00 +0000
Date: Mon, 17 Mar 2025 12:21:56 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Message-ID: <xbtcs6tzggmpv4icelgzhpixad23evefcf6jjsxi74qkjvxyue@mzb67hniua4o>
References: <20250312225949.969716-1-michal.winiarski@intel.com>
 <20250312225949.969716-2-michal.winiarski@intel.com>
 <d6e026ad-4dd4-2e03-6f8b-a10980fa0ce7@linux.intel.com>
 <f99f1533-2dd7-7ba8-3a5c-f68e45b1e8b6@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f99f1533-2dd7-7ba8-3a5c-f68e45b1e8b6@linux.intel.com>
X-ClientProxiedBy: VI1P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 9074a3fc-8969-4bc1-ffd3-08dd6545ef5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm1CcFByTjNwMzNIWTM4RE5HOGpDQ1lWcm5uaEgvYmZ0VGVXQmhrbkdpenpF?=
 =?utf-8?B?dlk5OTVucDliMGRFSk13TWF2OGVZcUhKam43YVdiYTJGMG1DWkdsZWtNOHBK?=
 =?utf-8?B?ZlRBTkFPR1U2Z1I0eTVCNlQ5ZGp6bWpUUGRpVXNOV0VJSUJwNmNOeVZMZjRJ?=
 =?utf-8?B?VVNIVzAyUWRkUmRJd1MwTTZtTUdROGdydk5HdkFuMW94STdTRXhKM0V1eWc4?=
 =?utf-8?B?cnhlRmZLd2laYUgyTUxXNEg5N2dlQTAwaVVOUm5ORUJ6MmZia2t5aFZqd2NE?=
 =?utf-8?B?Q1dmVElvMUw4WWlZNGM0MUs3T2tVOWFGSFYrVVZIQWt1dFNmSWp6QW9INFJB?=
 =?utf-8?B?RTl5QVdhREFFV3hIanMrVXV1ZnlaZkt2bzBwUC9Md0J3UjRiUnJMUkp4OGV4?=
 =?utf-8?B?MjlhYTNpL1pKZUNXUTh3Rm9XSVdOZm9Od0l4V1lPQ2xxSnJLNEMwa24vdCtR?=
 =?utf-8?B?SytVTEZsMEQ1ZzNNMmRMenRPV0tvWWpnalYxaFdhaUpXTW02UnA3RC9iMXl1?=
 =?utf-8?B?akZ5K0g5UzBLUkhSN0NoZzZTbjhjK0lDMmhSN2I1akxhUmtXenI5Z3d1Q21C?=
 =?utf-8?B?b2h1QUNoZno1QzBhZ3gxMm5PNmlxeXJjdVdhRml2ZW5sTnRyOUZ5aUNReUQx?=
 =?utf-8?B?a2trNUx5VCt4a2drR1NtZFVPSmhlNFJMMWtSUTRDQkpCZVdkTHB1NWpML3Jy?=
 =?utf-8?B?aE42bXJLOTFMcVdicTREQlQ0dXM0VWs4dWFaNkdYdURWREVyMDIyZ3hzSk9i?=
 =?utf-8?B?ckhmdlg2WENJZnl6a3M3ZU0zcGNZSGxPN1crS3lWcXdob1VSczNpRis1Zldi?=
 =?utf-8?B?dFArOVF3MzhDRHZPeklLQ1NKNFdGSHNSZVFyTjBPSGY5QUtYdzUzY0ZpTDZC?=
 =?utf-8?B?Tk9FUXZobWRtamZaMVc1S1NlVDUzNjlYS01HZCtwaE8vb2JxZXJDK0NGQ1hi?=
 =?utf-8?B?VzdmeFVtMFBheUdaRjk0eGlXV2FVaVlDM2dvbVlsc2pldXZZTkNtVFJEU0ZJ?=
 =?utf-8?B?bk1scFV3Q2NnbW8yZTA2VG5FalRsaWpIVlc2YnVkOGJvWk9yNGtJU0FuVFl5?=
 =?utf-8?B?QzIzRFVsMS9Od2xralR5Z1paWUx0ZFNJRTI4UmlIS1kwL0l0OHN0ejlueEtI?=
 =?utf-8?B?Q1N1UWljSjVpQkxBVml1L0tyMkJYTTBXVGFDUVgwR3hlbXdLR3dDQmx4QjFu?=
 =?utf-8?B?cEV4bTFScE8xVDJFaThkNUlQdmEvclpJby8vWHRaTkhOS3JRcy9ncHRQSlB1?=
 =?utf-8?B?dGV6K3MvYzZCcjJpMzNtOGFzWHFIWWxnK2Y5dlJJWWJFb2Uvb0FONlRJZnY4?=
 =?utf-8?B?dGk1aW5aWGZkUjZGY2hzeDVzZ0xOdEJPaFNwY1ptM1Ercng4UUF4ckQ3akFy?=
 =?utf-8?B?YzNiVEY1Ym13MldOejhmUlh5RU5DYjA5UW5iWUtVTXVpMFVVUVdnc0g5bExn?=
 =?utf-8?B?aTlJWlBxTllRelZlRkhQNkJDSmllRjFlSEJoSUE2RHZBOHpNRk83ZFQ3QUFi?=
 =?utf-8?B?TElmK2xTbEc3emJWYmxqQ25qRGsvazNENjMxQVlKSUIzMnJYaEJiUks3dTh2?=
 =?utf-8?B?alptVzlhdXZqR2x5REJ1ZlhDanowQkd3bnRjWHkvSVNoWFV4TU1FZXp4clhM?=
 =?utf-8?B?czhnVDFIY0o2SGZMaVhLMFVDNkZSOUp0b0ZpTjFJRTRCSUdTdnQ2S0xYOXEw?=
 =?utf-8?B?QXdRTktHaXBXT05YTWVMcEpvcmdIL2hlM08yeTJXeUtSbnJJdUhaVGhKc09q?=
 =?utf-8?B?NWZUSEwxakZrcHpuRlNHTWdJaDh5VXZIbUtWaGdsK3RqTllWdDRTUENITzRm?=
 =?utf-8?B?UitIVzVjNklDeUdrWjE1UFRrb1k2aEdDdzZIRGo0U3JaQjZQZWQyaHZiZnBB?=
 =?utf-8?Q?t0jxc/ZyX9l1C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzV3U2tJamJ4UENzaG8wSXEyV0lyQmJlcStZWGx3dUhTUW1qZHBtRDRDcUhM?=
 =?utf-8?B?aHJQdnRaVk1zZktmNVpEcmM5enBjRHZVOWJiTzRnd2hFdGZVSUF6Y0NhMlhW?=
 =?utf-8?B?K1UyQUthQUVvTVRIMkdtRkZEcHBiVmRLUWNURWRNVW04OXk3alluVHpqNU92?=
 =?utf-8?B?ZW91WUxqTWJoQWZEaVNxY2FDRk0zLy96UzkrS0dDZzEyYVBBQStrcmxPR0M2?=
 =?utf-8?B?QlJ2NTNMd3FhN0R4cytBM3VML1ZhOFZseFFuL3BtWnFiUU1DMmgydUI4UGJE?=
 =?utf-8?B?RHJrd0wwaVVNVXB3WVd4UjkzUThCOXFGRG1XWENZV29FZnZFeE5hdzR6WVVR?=
 =?utf-8?B?NzVBcVMxNCtzU1I5bFA4bWw1QU9ZaFhWTER0dzBLckswbWd6SmR4K2doZjBk?=
 =?utf-8?B?VXowd211RkdpYlJLTU52VldCRUFzNzBQUitudm1uRFl6ZkpTdWNZbDFIdVc0?=
 =?utf-8?B?WnpYVDAvRjd5Z0F0YlBtVmZRT0syL1lTbzJYVVorT1pLNjl2L0E4aVprR2tZ?=
 =?utf-8?B?SFh1VGREbG1nc2QyNWM0YUdYK3hBNXQ5UDRYcVVlRnA1YUFCL3FjcEM1YTRQ?=
 =?utf-8?B?Tk4xOXNUSWlVUUYyaFF3d0E5V254WUw2Nk9XcVJCNmcvc2V0djF6bUZ6YmhX?=
 =?utf-8?B?ak5qTVRtT1hYMUVPVjJaQ0dRVDgzVk12anZZRlNvR2JsQ2Y3K01GQy9pa2RN?=
 =?utf-8?B?Z0RmeXI5bFFCTFNHTGZjalFiU082Mm9aUDFGWGR0YUxoZ3pFeW9SLzlDSVht?=
 =?utf-8?B?VlNOVGl4QzhCclhTbmxSYkxzZmt2dW9YSlNpUWZCV3R2UmRqd29SYlluZkJT?=
 =?utf-8?B?ODU0ZnBYakN3RFd5aG94aDJWV3ZEVkcwQ2NURFkraTArWXJ3clVLdmd0Y0x0?=
 =?utf-8?B?K2puRVA4dFoxNlN3NmJjdlNtUk53b3lFQlU5WUxKOXpYWFh5czZIaEN3SXVu?=
 =?utf-8?B?eU5MZEF3c2ZrcUtDNlpZWDBRb1JUTkQxVi9RZldUL3A2TloySkM5WHN0RUxK?=
 =?utf-8?B?VmZ2YzVWNEdOS0QvcVZ3cUtwQUJKYkJZUWVrUlJPekZsU0I4R1NDd0VoOE1V?=
 =?utf-8?B?SUVDdldwSEM0aENseEdodHhIekFNbTVoRlRaaWVCdG5RRGpyL09OK2V4cnRC?=
 =?utf-8?B?Z2txL1pJWU84NWx3L3l0OGw0b2Ewem5OUWhHSWtpb05NT0tOaURUdHludHBX?=
 =?utf-8?B?WWRnbnplWm44TGRSY3FyMWZwWFVDeTAzbko2MVVOdGpnd1pEc25zc3AwQnFW?=
 =?utf-8?B?S2VWWDBMMUZ0QTZLWGpGekdLd3hZdm1oaUhLaGhNbVUzRnlxRnl1MmVNK1VO?=
 =?utf-8?B?bXpnbzJEa3d5S3U0MVBoanQ4NU56M3dCWG5rSTVZcWNzYVJ5RWJtN2MzUVJh?=
 =?utf-8?B?NVJnMzB5SHkzRjllY3RPZmNDT2tZS0s3emZKcDFJUkNOT3VlMWJKVmZjL2dG?=
 =?utf-8?B?QUtRcVVESEh0Q0dWYUtFRzJaTCtEZzBvZHF3ZURNa3oxUjNCUXo0cVBhWXh3?=
 =?utf-8?B?R21SeFlaWnlQb0prZUtNM2VIM09zZGVXWWFUNHhwTExUem85WHA4blhtbTdr?=
 =?utf-8?B?bUlkOEYyZDJkNFA2SXpBUE53QWMyb1hVaC9nbGtUcjNBMkpuN3dPZW1nWmts?=
 =?utf-8?B?WWZnMTBOc1ZLTU9raEFZZEVUZzNZMEg0OVM2Tnh4SFRjeW5tTHdpSGJIV1dI?=
 =?utf-8?B?bUZyVDhNd1JRRWVKVlplVk9kNHlhUXAxcitsc2NTQkRwVlFxSVZOMG4xbGV6?=
 =?utf-8?B?cnB5ckhPWC9XSlJha0dJTjIvK1BvUjg5bU8yN1p2ejVwTjZiT1pHSXFaTGV5?=
 =?utf-8?B?dFNyZmtFNEwxZzJ3a05lNGJCNzkyV2wxRnk2ODI3dzNjaDFTUUI0WktpTnRN?=
 =?utf-8?B?QXcrTU5HTnIwd3YyUjBUOVhsOEhEWWVMVm1HWmVtYXhhSXl5YUV5WDJlZzV0?=
 =?utf-8?B?Z3NacDdhVHViNGoxWVJDeUJVVXc3c0t6a09OV0dBUDc3KzlZSWQ3ZUZ4SGFL?=
 =?utf-8?B?QjZxRksxNzhtTGxEWm9waVNOVG9zQldqV3lTMDJ0TXdJRENZclJmV0N6SzZx?=
 =?utf-8?B?ZXIxVEJTUlVXU3Uvd1lPMkt4SzlsWlNLK3JDcCticVZyMnVvMCtPbmFuMG9s?=
 =?utf-8?B?Qk1mdnhiL1JBTzlyeFl0RzhDQkZEQnBWMEs2ZXZ1QzQ4NDJhTllNOEhleUh4?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9074a3fc-8969-4bc1-ffd3-08dd6545ef5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:22:00.1874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0968Vdis/ljUtQp/teMbJHxRelHsputpRm7C0bVzhtUHOpTU+Kt/0hDYhPbio97Dm1OA/TGdNZjWL887sOM/XbeDDe9/ImJa3lCPjS8uwUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8579
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

On Thu, Mar 13, 2025 at 11:50:37AM +0200, Ilpo Järvinen wrote:
> On Thu, 13 Mar 2025, Ilpo Järvinen wrote:
> 
> > On Wed, 12 Mar 2025, Michał Winiarski wrote:
> > 
> > > Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
> > > the system firmware or the PCI subsystem itself.
> > > 
> > > Add the capability ID and restore it as a part of IOV state.
> > > 
> > > See PCIe r4.0, sec 9.3.7.4.
> > > 
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >  drivers/pci/iov.c             | 29 ++++++++++++++++++++++++++++-
> > >  include/uapi/linux/pci_regs.h |  1 +
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > > index 121540f57d4bf..eb4d33eacacb8 100644
> > > --- a/drivers/pci/iov.c
> > > +++ b/drivers/pci/iov.c
> > > @@ -7,6 +7,7 @@
> > >   * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
> > >   */
> > >  
> > > +#include <linux/bitfield.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/export.h>
> > > @@ -868,6 +869,30 @@ static void sriov_release(struct pci_dev *dev)
> > >  	dev->sriov = NULL;
> > >  }
> > >  
> > > +static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
> > > +{
> > > +	unsigned int pos, nbars, i;
> > > +	u32 ctrl;
> > > +
> > > +	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
> > > +	if (!pos)
> > > +		return;
> > 
> > FYI, the commit f7c9bb759161 ("PCI: Cache offset of Resizable BAR 
> > capability") which is currently in pci/enumeration makes this simpler.
> 
> I'm sorry, I realized it's not the same capability but you should do 
> similar thing for VF rebar capability as caching the value of 
> pci_find_ext_capability() avoids some slowness during save/restore.

The series was based on pci/resource due to other dependencies.
But yeah - point taken, I'll use caching in next revision.

Thanks,
-Michał

> 
> -- 
>  i.
> 
> > > +	pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> > > +	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
> > > +
> > > +	for (i = 0; i < nbars; i++, pos += 8) {
> > > +		int bar_idx, size;
> > > +
> > > +		pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> > > +		bar_idx = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
> > > +		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
> > > +		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> > > +		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> > > +		pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
> > > +	}
> > > +}
> > > +
> > >  static void sriov_restore_state(struct pci_dev *dev)
> > >  {
> > >  	int i;
> > > @@ -1027,8 +1052,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
> > >   */
> > >  void pci_restore_iov_state(struct pci_dev *dev)
> > >  {
> > > -	if (dev->is_physfn)
> > > +	if (dev->is_physfn) {
> > > +		sriov_restore_vf_rebar_state(dev);
> > >  		sriov_restore_state(dev);
> > > +	}
> > >  }
> > >  
> > >  /**
> > > diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> > > index 3c2558b98d225..aadd483c47d6f 100644
> > > --- a/include/uapi/linux/pci_regs.h
> > > +++ b/include/uapi/linux/pci_regs.h
> > > @@ -744,6 +744,7 @@
> > >  #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
> > >  #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
> > >  #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> > > +#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
> > >  #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
> > >  #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
> > >  #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
> > > 
> > 
> > 

