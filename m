Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A59CF508
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 20:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA25010E3FE;
	Fri, 15 Nov 2024 19:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRDN2Mzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C81C10E3FE;
 Fri, 15 Nov 2024 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731699518; x=1763235518;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ODjDs/QVvTQpwFG6FVE8frFADNnlKgAv5VDAxzj1dfo=;
 b=VRDN2MzzLNR3auuBOdCPYW/fQqI7tfMagpMIGuO6vK1KCIpot0IKWKAm
 CVe/ovCTXuKzI4IigrJOnuNR5871DmcAbINqE/dZ8quE9GF8WreT+IArH
 qfrhOjjUAYqjKmJeqTYTar2Z5ssjjsZus/WUuVhe3pXuf1vvU9l0bNzP1
 5xebSVGKd8BiAIyUnkPmbnbM+tJy+PfFyAgxvDfe+l4tjTzlG2ALbqDZN
 CCr2EUraYm1FFsBRNYL7NgrBxAvlUAJBARJWMkSI+t5ubII8/g4YxoXLK
 5gwo54sq2+q06lH4BfIAGiwAsCrf78nvWiq45cu1E3XR9Vh13wJ+tro4X A==;
X-CSE-ConnectionGUID: bVLUFAEFTU60Wa7r6FQpMQ==
X-CSE-MsgGUID: fk0Cmmp6R+eENyFWk93g8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="43114751"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="43114751"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:38:38 -0800
X-CSE-ConnectionGUID: 6fxADG+ZQSSP/IYuTGTvhw==
X-CSE-MsgGUID: 63BbaLXuTBuk4yKmdeWEDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88809207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 11:38:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 11:38:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 11:38:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 11:38:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BospywvY+09c0shnqSyK6jQtTI1yQKhBuKcEHND4q+2Uf6OG0sOT6tplJ/1Ao3r3YSKqvN/dk6gyeOqYec275FZg9hNzLI9L0nVWuq5qYCnxLfBRe11B2uO99LaRaEZrsVfaSjX2VJcgP57XCQZqGRA2L5CAaD66f4CdDVOQTXiJ+p5wNNK9eo9jmHho4FOolgA8Xr+cHXgmWlmJVacHjkd4a1Aq47RiE83ppNGHCzMJl+yFthgyCF5p3xTrhVOrjGHo0S98ySUG9QOzs1ENOAC9dB+ir+37ofU9OEst5vuazR+S3PH4vRhF1Ufif6foGpV8GhB6xi41fbs96G7N1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQqv2ufCr/n5pCVxpyus5KFd0KgBqKcpYQpKUmHNSE4=;
 b=LxM05toXHZ3dn5k6LWENAd1k7y1Gwwq4Ab6VwvOHaN8xMbGITt9KmHLpTREXiUiAJT8JUxlX/jllI3EtYstzj9YNiKqsLX9Csrxtm+2djVZDPgPEm6vvqOTcZGbqiKjTV5pQo5GIDajnlo0IwnR7GXhN60IlcHEZhuFas9K63e8Gn2DdP8f69yLUjxRG678uo92s+zrR6ttRR2DHNfTMXVABBd+4KrllDKDUeoBBeci7xiOZUbFHqAQv1DzjzLDDwcgmejAUPcUrr9wLM/iZfSPzkIsG0iY7+2uQFBc1eCl6coSst4ckIgYgborjjIzoZaPYMTmKPWUrWJhXz1kMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 19:38:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:38:22 +0000
Date: Fri, 15 Nov 2024 11:38:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <pstanner@redhat.com>, <boris.brezillon@collabora.com>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>, <dakr@kernel.org>, <mihail.atanassov@arm.com>,
 <steven.price@arm.com>, <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
Message-ID: <ZzejT4IOF2rp7UtY@lstrano-desk.jf.intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
 <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
 <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
 <ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com>
 <ac5b9c6e-027a-40e2-bdab-2cc5e10067d6@amd.com>
 <ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com>
 <d6da2891-f7d0-4c08-b758-f5becc7a12e0@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6da2891-f7d0-4c08-b758-f5becc7a12e0@amd.com>
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f9ba5d-b176-41fb-dfc0-08dd05ad105a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1BJQXp6OUp4RzJkZ1M2N0VmVHFJRlpNeEM1WTF2cjBSZzZDYm1QZ0xTUFNo?=
 =?utf-8?B?RlJXRjN5eVl4a0ViNlZUb0ljV2s2d1BZaCtneDYvcmtkZitlaXJVdXJhV0lY?=
 =?utf-8?B?V1h0NWRJcGxJUHNaRkdRSmJWWkMxcllkb3YzUm5nUUV2c09kaTA4L2RBcXo3?=
 =?utf-8?B?NmtpcUFFYzVEQUdYNUEyazBuQndLeC91bDMxNXpxSjJEUEMwTVhjSFhuN0xo?=
 =?utf-8?B?MkFYTWFITkdJTEpxeVg2WXcrd0hSb0psSjlWNW5zNXpmTjhaUHZNaHNSZWUw?=
 =?utf-8?B?N3A3dWN1SzV1VnhaWGhNTDNyZ0kvZnVJM0pMMUViM3dzUkg2Z2lQTVc5bFln?=
 =?utf-8?B?QmpGTVpiNmlVV0lySFlPSlZQQkpZQ2FLWXB3N2tkOXJmRDJ3NTNjM0oyZzBs?=
 =?utf-8?B?K3luejMzb0xhVThGeVVYL2prYmp3azlDSU9OTDJQUGhpVTdVVmZGbG55MVhm?=
 =?utf-8?B?WHNQMHFRNk9scGtJayswcXVjRW8yc0sraDJzWEhORFFsbVlaOUpvYXg3eHhQ?=
 =?utf-8?B?dE81NTkwUUIveDBGYzRsSXlRRkFZM0FKNVUvaXFOQ0g2L0o3WS9uL1BGNU43?=
 =?utf-8?B?VFhiL05INU85Q2VEaEpzM3VRdXR1TW1ud0JGNCtuajNhcHFNb01wRkdyV3BC?=
 =?utf-8?B?aUFEOVlQMTQwcXlGd24vWDhIWVV3a3FpTnVNKzhNS3BuVzIyWVNRdXJ4OTRR?=
 =?utf-8?B?K3JUOStWQkhEUmYrWE5IK2VOVG9RSW50TkF5YkF5NEFnZjJtbXFwc0VoTVhL?=
 =?utf-8?B?U0prbVBWZ1pYcGZ6ZElHdkNpeUNjWEhIcXlsMFU1RXZqcVRLSUsrMlFzZThD?=
 =?utf-8?B?elQ2d0w1aVZPcWJJenRKWjhvOHFaOWhLRUt2N0g4WmYxL2kyWGJzY1ZSLzJl?=
 =?utf-8?B?am14OFJCZ3RzcUlyZzB5UlpIZE1PYWZ3RVNJMkR2SDlXUjhJVXFSYU9wVjZp?=
 =?utf-8?B?S3BuZy9mL1ZudTJ2UWxsR250NDVnN2RjNDNyOVNOc1V1NHFxSUVwOEVYdHlT?=
 =?utf-8?B?MXFSdjB3MVRMQUVQNzJXcm4xRkZkSFlxa21FR2I3UmUrSW9rdXBzbndSd3Bh?=
 =?utf-8?B?YUVQVmx6RVNXaDNIeDh2UGovVWFGY3pYZkZWVWlZOXVvOW9wUmo4bzdhaGlE?=
 =?utf-8?B?UHhSRFFTZGVLV3hkR3d2UXVvZ0ZJdjR4Tjc2eEkzWWdEWEtLejNCZFJvK05Z?=
 =?utf-8?B?R29qbDNaWHZpN1RMMHNzRlFNYW9IWGtQZDJpRDh0a3dVY3RkNkdFblBLeFNz?=
 =?utf-8?B?UUU4T1FiaHN6aW1sV2xSOUhFNGVSODIzSUIzZ1hrQjJ5bWgrRGltdkZ1bDdp?=
 =?utf-8?B?Q282WW8vTDlXVUl1enRiWS9mQlRUWGZ6RU50SmkwbEcwdUNkd2M3VDZ4QUFN?=
 =?utf-8?B?ZlhtTkd6OTk5K0t5amdDVnZiU1g5OVFYcm9HQThSZzhxK2dSeU1zWmN1bWN1?=
 =?utf-8?B?NkR6aitoQ0l1WDlZekNLTVJrQUxWUjkyT0xxTUVWYVdKSm5jR0p2ak4zMFg5?=
 =?utf-8?B?MmJ2ZzRUY28yYlcyK2NXOHAyWUFVMjFVTnVUUUx2b0V5cnM2OGZkU1pvZEF2?=
 =?utf-8?B?dURHZzRtUEg4cExJejVtdFVvMWg4UWo3S1YzWFZQSFI0TzY3djZyeW1Pcm1v?=
 =?utf-8?B?Z2tFSEtXWk1ZZUlUcHptQlJ6UFEvR3loWWVQWXZ6YUJvMzFuTjRLN2pEMisr?=
 =?utf-8?B?SXJMWFpUcXRZL3luNFMwMVgvek5JUzlqd3hubStyUkFVOWFvR2d3SEZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDF6b0lMWmdhZ0xFVzQwU2JlUkNyL3FrZDV5UU5LUFZIdGY0bmNnd08xbUlB?=
 =?utf-8?B?SG56aHYzcUx2WVRkTjNqdHZ6NU82NTVWWTFIalNERWxmT2hldjRRekU2dkJl?=
 =?utf-8?B?Kzhac2tXaGRLWnViamZqQ092WHoyblo2alpwbDhnMi9tTEVhY0VaVjd5RGFk?=
 =?utf-8?B?dXhVSGQvOUVOa0xmMlQzSEYrMnJPTW5DWENDRUprKzdrTmUxSm9mb3UwTjJr?=
 =?utf-8?B?K1pIcUVORXVDUmU4U25aUTZ4cE5Wd0hPcWQwTmd1OVlvWFhxMVVVcERTeEM2?=
 =?utf-8?B?VEpwZzlWaFBkNVd5UEpZTUxNVW5vYU1ueW8yV2w5bEFFZGRhTXJUWEEzTW1M?=
 =?utf-8?B?UE1JaERQVnlUbVpvYmErdlhxODF6VVVNemJvVGhuMjFIQUNhVUE4bTN2ZHJB?=
 =?utf-8?B?ajNYb2RQb0lIMmtoVlZEMVloSkpkRHprVjFHanhLR2dYMmFvc0ZCQWpVWjNI?=
 =?utf-8?B?T25GaXdmN0I5UHlINmt6OEtTWkhmN3QzUkNCN0NoR3c2Y0xVYkFmYlNwTjFs?=
 =?utf-8?B?ZW1VSmhzZi9TNVdDTmY3SEhlSDdVWEdPTVRZQlZwYmNLOWJSV2dOTUdtM0lU?=
 =?utf-8?B?d3o5SXpkWnptcTNFRW8wVExEMTh0T1FUbnk4WCtFWFEzQVNMT0RCRkI1bzMy?=
 =?utf-8?B?Uk5YNjV4YVpCOXdYd0U0T05lT1EzTU5JdW5oYlZ0d0lhVXpTd1lVQkpYUk9E?=
 =?utf-8?B?dmZhZTFacm1IT1RlRDQ5YzZ6M0hOVVZFcW9panp0N201UEt1eW9aS3JXNW5n?=
 =?utf-8?B?V3hCK1E3MTZOdGJibVhEdWJGcmFEOEpGQ2E3LzVRNk52d3A0cXhYZktWaXVE?=
 =?utf-8?B?YVB3NmVRR3JqbkZJZXdLVWJzVTFkNlNma1BVd290cCtIYm8vYlNITm5pT2g5?=
 =?utf-8?B?RDdIVmlZVzlLcksvR2svSVhiL0pTMzNKeUx4Qk9TM1JBaWFYdURpQlVLOTJn?=
 =?utf-8?B?cktPczJKRTNQd0ZsTVJVWmZhbm5iREFTUFZ1R1EzSlQ3Yi9PVERBQ3NWalhI?=
 =?utf-8?B?LytWTHJlUkdNVyt3eEgxY0tqdzY0YWRwandkZ291dndGRE9aQ21jZkFMaU9H?=
 =?utf-8?B?ZWdIem51ekV2U2x3YUpFbTdjTlUzakVKcXN1VXExZlVydTJOcm5DMTRvMXY2?=
 =?utf-8?B?QVB2bVBtMndsUGdZcXZsRGhiRFBFa2drMkcybkx0SUFRZ1hLdXZEL2tYdGZm?=
 =?utf-8?B?TktSUUVxOGFWSWY3RmFRSHBLM25nREd6OWpzTTZIUXJ0cWtlS0dERURHODZI?=
 =?utf-8?B?OFM1NHRKVjFLai8wSEcwTnRyQStqK0IzUWtXSUY0TWdpT3F3cjFSTUZHc3Vv?=
 =?utf-8?B?V2tUOEtXN01ZTm1Fdm02eCtqZEtWbDVQOFMrZEdGU0xqY0MzWkZQd21jblJ6?=
 =?utf-8?B?WExkQTJXdmMwYnRzM281Z3AzUnp2LzVZY0drNkFGMnAvNXN5dkZQZThpOTBK?=
 =?utf-8?B?clZCLzZQY0t3aTdTT0NEUFFmOThOY2l6MGtvUi9WaVdiTjMySjB0Z2l5UHNP?=
 =?utf-8?B?dTY5L2ZIZGRqK0doMGVHRXNqODR6REE1UUZPcjI2bUd4cUhONG04VmRFMUY1?=
 =?utf-8?B?a1BvQTdldmFaWTBKYU9xblRYVVJwWm9haGkzMTU5MW1tWis2TFdHdkU5L3NG?=
 =?utf-8?B?MzVFUi9oOU9MY3BqNDd6UkpPcDFYOVhpTFZYeFVDbWRDUm1scnRpWTZIWm5R?=
 =?utf-8?B?ZjVvZGtVanZkdG4vbU5SWE1pdllvcDlSdEozZ0FTSlZPRGxHdExXVmEvbU9m?=
 =?utf-8?B?OGNUS3VJaHhsSUMwZ0NpdG80a0Jzb0I3VFdHcTdQS2ROSCtjV1dreEp1OGts?=
 =?utf-8?B?MHhGNm04MlVoeVp1cjN0NnNKUm1VUWtNSUxUYlE1OEEycmJ3dUpDa2lSbVVN?=
 =?utf-8?B?L0dNUXZaTUVnWERaRFpxTlk5a2tFelBpTFhWa3NuV1d5QlRCVEJyTDNPMTB5?=
 =?utf-8?B?SGlMY2ZOZ2pLK1VERFQ2S0p2TmRKQXF0c1VERkE1TWd5NzJGVVpZaXFoMm5o?=
 =?utf-8?B?WUZqWHlKVkhzemxPSWtzUUpmUmZld21YdnQwRkFXS25za3NnVDBmQjlOVnZr?=
 =?utf-8?B?SVBXYzVMN1E2alZjcFpEajh6R3ZXTFVtOFB4Zlo5SDlkSThTdTFHcjEzWDhh?=
 =?utf-8?B?TkEwNysrKytlcUl4aXZabk1tK1lsZnFDMlcrUFpYREM4V0U0RU9BbFp1enph?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f9ba5d-b176-41fb-dfc0-08dd05ad105a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:38:22.0637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HS6LRGaC/tQMiuB1uulaLmHCj41Dqz5Im4OhiaaTfHQiPZav+HBXyhZdbtJmuLBe2OKHhlyGPaLYE/S2jZIdbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

On Thu, Nov 14, 2024 at 09:38:43AM +0100, Christian König wrote:
> Am 13.11.24 um 16:34 schrieb Matthew Brost:
> > > > > > > Now the ordering works inherently in dma-resv and the scheduler. e.g. No
> > > > > > > need to track the last completion fences explictly in preempt fences.
> > > > > > I really don't think that this is a good approach. Explicitly keeping the
> > > > > > last completion fence in the pre-emption fence is basically a must have as
> > > > > > far as I can see.
> > > > > > 
> > > > > > The approach you take here looks like a really ugly hack to me.
> > > > > > 
> > > > > Well, I have to disagree; it seems like a pretty solid, common design.
> > > What you basically do is to move the responsibility to signal fences in the
> > > right order from the provider of the fences to the consumer of it.
> > > 
> > Are there not ordering rules already built into dma-resv? This is just
> > extending those preempt fences.
> 
> Well, the usage flags are to distinct which fences should be queried for
> which use case.
> 
> The order the fence are used and returned is completely undetermined. E.g.
> currently you can get READ, WRITE fences all mixed together.
> 

I was thinking there was an order here but yea looking now that does
appear to be an oversight on my end.

> > I can maybe buy some of this argument, as if a random yahoo enables
> > signaling a preempt fence without properly going through dma-resv or the
> > scheduler, then yes, that could break things. But don't do that. In Xe,
> > we have exactly two places where these can be triggered: in the TTM BO
> > move vfunc (which the scheduler handles) and in the MMU invalidation
> > path (dma-resv).
> 
> Yeah, but the purpose of all this is that the dma-resv object is shareable
> between device drivers.
> 

Agree.

> That one device driver comes up with a new requirement is certainly
> possible, but then we need to make sure that all others can live with that
> as well.
> 

Also agree.

> Just saying that we limit our scope to just the requirements of one driver
> because other are never supposed to see this fence is a recipe for problems.
> 
> > I would expect all drivers and users of dma-resv and the scheduler with
> > preempt fences to use the proper interfaces to signal preempt fences,
> > rather than bypassing this thus ensuring the common rules for preempt
> > fences are adhered to.
> 
> Waiting for fences in any order is part of the design and a requirement by
> some consumers.
> 
> See nouveau_fence_sync() for an example of what is usually done, radeon has
> similar requirements.
> 
> But those approaches are here to for optimization purposes only and not for
> correctness.
> 
> That a driver says "My fences must be waited on first A, then B" is
> something completely new.
> 

Ok, fair enough.

> > > Since we have tons of consumers of that stuff this is not even remotely a
> > > defensive design.
> > I can consider other designs, but I do think larger community input may
> > be required, as you mentioned there are several consumers of this code.
> 
> Each fence is an independent object without dependencies on anything else.
> Imposing some order on consumers of dma_fences is clearly going against
> that.
> 
> > > > > Anyway, I think I have this more or less working. I want to run this by
> > > > > the Mesa team a bit to ensure I haven't missed anything, and will likely
> > > > > post something shortly after.
> > > > > 
> > > > > We can discuss this more after I post and perhaps solicit other
> > > > > opinions, weighing the pros and cons of the approaches here. I do think
> > > > > they function roughly the same, so something commonly agreed upon would
> > > > > be good. Sharing a bit of code, if possible, is always a plus too.
> > > Well to make it clear that will never ever get a green light from my side as
> > > DMA-buf maintainer. What you suggest here is extremely fragile.
> > > 
> > It is unfortunate that this is your position, and I do feel it is a bit
> > premature to suggest as much. I didn’t know being a maintainer was akin
> > to being a dictator. As I’ve said multiple times, I feel this warrants a
> > bit more discussion with more stakeholders. If this is unacceptable,
> > sure, I can change it.
> 
> I'm sorry when you feel like that, it's really not my intention to dictate
> anything. I have probably over-reacted.
> 
> It's just to me suggesting this solution is so far of that I can't really
> understand how you came up with that.
> 
> I perfectly understand that you must have some reason for it, I just don't
> see it.
> 
> Maybe we should concentrate on understanding those reasoning first instead
> of discussing a possible solution.
> 
> > > Why not simply wait for the pending completion fences as dependency for
> > > signaling preemption fences?
> > > 
> > > That should work for all drivers and is trivial to implement as far as I can
> > > see.
> > Again, this is hard to understand without a clear picture of what AMD is
> > doing. I pointed out a dma-fencing problem in the code on the list, and
> > the response was, "Well, we have some magic ordering rules that make it
> > safe." That might be true, but if you annotated your code, lockdep would
> > complain. Anything that cannot be annotated is a non-starter for me.
> > This makes me nervous that, in fact, it is not as trivial as you
> > suggest, nor is the design as sound as you believe.
> 
> I'm pretty sure that the code is not even remotely bug free. The design and
> code has been under development for the last 16 month or so and is now
> published bit by bit.
> 
> We completely missed both during internal review as well as testing that
> lockdep should complain about it and I'm actually not sure why it doesn't.
> 
> The full code should land in amd-staging-drm-next in the next few
> days/weeks, I can give you a detailed date later today.
>

Please let me know when this happens. I will take a pass at reviewing.
We have had preemption fences in Xe for LR compute for 2+ years now and
can help spot if you missed something. It took us a while to get these
right.
 
> > Anyways, I'll still likely post a common solution with annotations. If
> > it is rejected, so be it, and I will rework it.
> 
> Well that sounds great. But let us discuss what this solution looks like
> instead of jumping ahead and implementing something.
> 

Sure. FWIW I changed my code to wait on last fence and it quite easy
to do so and it functioned the same. So at my reasoning that new slots
vs waiting on last was correct. While there some properties of new slots
I like, I'll just drop the new slots idea as it seems contentious.

Matt

> Regards,
> Christian.
> 
> > 
> > In spirit of open development here is my code in a public branch:
> > 
> > Kernel:https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-umd-submission/-/tree/v2-11-13-24?ref_type=heads
> > IGT:https://gitlab.freedesktop.org/mbrost/igt-gpu-tools-umd-submission/-/tree/umd_submission.v2?ref_type=heads
> > 
> > Matt
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > > Matt
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
