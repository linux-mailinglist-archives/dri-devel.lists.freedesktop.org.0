Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E65AD7566
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48910E896;
	Thu, 12 Jun 2025 15:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h55Yrfpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6141410E41F;
 Thu, 12 Jun 2025 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749741131; x=1781277131;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=MH56iqS6CMMkHKlRH2i77LuaJPrzyWmoyYdIBtcqjzg=;
 b=h55YrfpoKWqw+LtwfW1IQkoU7X9Ozfvmm+3w4whue0YuVvHlmKQlimMY
 pmUofF1ADIGxpaoinE3oMz6+z0rCxfHW1UgzCGIryFTgRNI1qt4+tj6FB
 g2SEkdsrwh3X00N1nwMGLTFZ+aGm6r4Y+992kywMYYCrAt1ywGTJUUoNG
 292bgRa8VrUVjMYeukKmW1fPvvQgEiQQQ+hiHb73v4lKZcFZdsQUh16h0
 70Cq66FLis8octu0UY5Eauc6IYJJRTbJ3goyk4EPBqNCoPPKPhNcFspqY
 jo7yAPPGsPS7mwLWTab1C1YQDTvAIBu/UEwCn9fu/RUntU234MMip2QlU g==;
X-CSE-ConnectionGUID: n+iu6d1XQGufEddcwnhjsA==
X-CSE-MsgGUID: BcG2Se2gRGmcLHMLIDXcnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54556230"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208,217";a="54556230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 08:12:05 -0700
X-CSE-ConnectionGUID: VaZqRkbsRfWiL+SO463unA==
X-CSE-MsgGUID: WtAa6tUJQS23gUit5KTsUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
 d="scan'208,217";a="147393466"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 08:11:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 08:11:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 08:11:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 08:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2lSmBi9y1A6648+MozpTICCDPArXcoqw7sPt5l9HTS8+6TeWNjrNMsz8stmZ9Dh0/H26ezDd0V8blRjutTSp898AditFG/i2o6Xztqld7YXSKGFmPYY3GYDtu00CmLMJpm3HteMzF4aTm3JGgcXNO8AU3QBODKUB25JBTX6s+AjqwMJ/cgvDCcsqIIjqgM6sVkIT73EYmpvYP1ciF/mzB1dWagF6ftgyaD5e4Vvc4Uv0Qj0kE4QgRhgWkLD/Y6jec1J2u9/mtDIUs92hmHd9Y7cWZXUvk/w6FEacx3Nm+ed4OIo9uzWa3MpFQmLd0foZYMJeQlGeLw7ukF2dsFC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dt5dEkocsvqk200wZUAyszdOfIUGobn6pp7UNmPvfJg=;
 b=O1QAQ89iJvgnmL+anI3yhtYcFCabhYczzq+O0tincr27ktgvk+EPB4QuL8AXt+v6au/WCUz+BwW8rJAuQXXEIWNY/narUNeurlFY6N+okvd7kvZzoOC6Es5619lAZj2317+oBtxu4H+DKVa0egBvvBEN0bbFU+Sn//cDWGx0EMCZZE5U5IQ8Ul4MDPAqY8jFf+jm7lSd2mpj4rwlKorPwSZukga/JiwdqKcPxz4lqsFEvHQCMUn4bEhRUF0HDHz2mhYOA9qJ9gZ48avqa32gs/MsocOVamrzurfl7pMzYYzez6zFlIq3gYsQ6CLpRgyoR48Kv1JCL5tQAExusgFf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 12 Jun
 2025 15:11:31 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 15:11:30 +0000
Content-Type: multipart/alternative;
 boundary="------------OmqmnxHyfubsaSaACC1nADtO"
Message-ID: <4b7e9d3c-90a4-40fa-abda-b90d7107a2d0@intel.com>
Date: Thu, 12 Jun 2025 20:41:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-5-badal.nilawar@intel.com>
 <18e1fbea-497a-4a54-94f5-57174ca58119@intel.com>
 <d4497be8-3536-47a4-99b9-58b5f1468172@intel.com>
Content-Language: en-US
In-Reply-To: <d4497be8-3536-47a4-99b9-58b5f1468172@intel.com>
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: fcce252e-cb38-43a2-ff73-08dda9c36915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K01SQ0IxWXRiM0M3azhtRVVBVkVPeGsyZUZidUVQRU0zRDYrQzJYZ1c3WExw?=
 =?utf-8?B?QU9jUnFsbzY4L1pYWjRlRmNMVDY4dFQwaHhhaFFqczYxQkVCY0pOUldBWTBu?=
 =?utf-8?B?Q2pxM05MVEdNWHcwbGp0bVZqQ0dTRkdoZ2ZqNlk1Z0UxK3lwWUlCMUZWaTND?=
 =?utf-8?B?RVloQzZDQmJocjVxaytDek8yU00wd1pTZ1Y5ZkpNK25paHlNbE9OYTJ3YVFL?=
 =?utf-8?B?Vm8wdFlQKzZSemlNT2JYVVFEOEJ1akNTTmhRNUM0US96MVdRSks5Q2E4STNN?=
 =?utf-8?B?aHBkTnZ6MmN5bDRRVVo0c0x4NkJtbStvajJVK24rM0NXbExjS01qeXVCWWNL?=
 =?utf-8?B?WjBLdkpGNlUwakdUVW00aEh3MVpyRjlkeFFNaDJFMnhJS2h3OEhXV3FOTnhG?=
 =?utf-8?B?VFV5bmFkVmNkNUZ2THBQZ0tHVEh0QWVhT3llYW10Zno4aER1RUtxbVFQSU9O?=
 =?utf-8?B?TXdZMjVlSWZ4cWgyYTZaUGlEb2NUUUcxT0I0SjRCOEZKQkRjdGd4eHJuVWNZ?=
 =?utf-8?B?OWtpQTZEMUx3ZEl5SUNyMUdIckR4Z21hci8zVWozeTc3dmNwcWpLMGJ2L0hy?=
 =?utf-8?B?c2MzdC90QlpGZXQxdFNDeUNMTDZxbXdqcUdrVnp2N2Y4MUpXZ21SYnVCZ0RG?=
 =?utf-8?B?anFteGVnWG1mQ2o4V3JhQUY5bGY0ZjY5S3VaYUtsUUJlaDJFbWdUbktZVXox?=
 =?utf-8?B?bTB6Vks5THBnak4zcGROMi9UbjdXZDF6MitGQ3hXcGhndkoxZ1FLYmV4Z0JC?=
 =?utf-8?B?K3NHOVRHRFhiUzlKS216TVByZlVlTStrSytoZy91WmZweUxHUFNrTDJiSDVx?=
 =?utf-8?B?VDFNOFdwRE5tZWh2WGxrSVJnbStPN0I0YS9TTHFuQjlxRUJRZXFyTy9URW52?=
 =?utf-8?B?UlBMeWlXbFJVUnRud3Z5aGpjRklXTmxXYmRIV21QcnNSTmlwbXJ2MTIyRUla?=
 =?utf-8?B?d0VmU1lBa0Mva1FWZUVKcm5ZTzZwMEFsZTdtMlhxNXNMc1JoejJLQm00d3c3?=
 =?utf-8?B?eEdBOGRxSVBLNWVZeWJQM1luTEsycjFKSVZ3V2xlUGdadUFqcnRiaU9meXZF?=
 =?utf-8?B?ZjFVTTc0S2o4d3N3amhCVTRRL0Q5NDYwcjByb0dDc2llZFBMOEJqellhYVow?=
 =?utf-8?B?THFiVXllZ1dYZ0IxaERONCt6RVd4M2lGaCt4ejVYd2h1VGFZWTlDSUZuR2xX?=
 =?utf-8?B?T2UvYndWaUpSRTZKNWhnZnV6VVJ3ZjZJMTlhMXp3U2RLeUlFbGZ3b0l0THJi?=
 =?utf-8?B?UE5RanpFTE5zMDd2RktrQkNZcUpQQ2wxL2Zkc2o2MXpRVjdLdnVQVklZVUJk?=
 =?utf-8?B?KzdmZVMwTHFKVzhMMmZwSVo0Sy9BK2VKd1kzOS9WcUs5MjlLakF5WjRINVBH?=
 =?utf-8?B?ajA3enNVL1REd0ZTTStwQnRkaTlBRm45QnloUnRDQXR5RlpZQmpmQlBURk5B?=
 =?utf-8?B?bHlIMmhoUnFVd0lmNzl1bXpiZmhXeWg2SFByR0NBQndSVUJqNSt6ODBoWVB2?=
 =?utf-8?B?eEtzbDZtNlNmbEppelJYYktVaEoxazA3V0pWN1RnTzRieTJTUWdtYWI1dFJz?=
 =?utf-8?B?SXFHRXNseGVmZkZTRmkwdm0xSDNwUnY1amhhS2tzNmV3Rk8xQ0lGTkJWKzZa?=
 =?utf-8?B?bm1ZbDhyWGowY1ZsdTNyZmI4K3JTR3Z1NGs2ajUzM0FvZTl2c3U5QU5PT3Zn?=
 =?utf-8?B?WkE5cVpabXVDNnhPQ3U4dWR0bmh4NHF3cERKQVBYMlAxb01Xd0RWdmQ1cUVE?=
 =?utf-8?B?S2k4SzFJTEgvdlJGRUhSQ29GVVFydllJVjEveUt6NUJEQ1pPbEpmS0djYkVL?=
 =?utf-8?B?RXk0TWIvaFhzaDVFN0RpcXJ6bDQwdHlzRDdMUzZIV1hFTndVQjJ6T1VlQ2FX?=
 =?utf-8?B?UTU4L09wTU9IUktFS3g4RU5jKytlbzVKeHBRSFB5UFV5cFNNN21PRklzSjJP?=
 =?utf-8?Q?65oJGot+94w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3RuVTBJdktMdmxDRzRDSzVvSWlhVDMyaUJXZ0dHS1lqd0NDbTErRHlHVU41?=
 =?utf-8?B?Wi9ieHRqTEdkYytVaXh3QVdtN0xFM081VmxHN0d0V1JldXFlWHFFZGN0OUds?=
 =?utf-8?B?M1ltTFJJeTZWck16dUVLSDZET0NBUmcrSDdHNHFrNzJSdGtia3Q0SjBwQWE2?=
 =?utf-8?B?QmlzRWFLdjhYUkJRQis4TzVIanJnMzlkYjhaOU41VmQxYmVndDhZT3lqbWR0?=
 =?utf-8?B?Und3cXJwR2RGMU5YSnVoNW9HQlRpZ1FoWmttd21CUnFWUitHWkw2NjZqVW1P?=
 =?utf-8?B?TzN4SVBJT3NvS2YwMEVOUko3RmZCZE9kN3h6cEk0OTUwb0x3aTI5WjMwMFM2?=
 =?utf-8?B?aWhOeUo1VytzTnl4Nk44T0J2cks2cGpPQk9BcVpHRjhYZUUvQTNJUHdWZmxp?=
 =?utf-8?B?YnIrMXcyczNDM1o1aEJhbXpWZUJLOXVwUndTZkc1OHZjNXExU0NFSy9VcjNr?=
 =?utf-8?B?ejhjUUVJR2lGUkd0Y1V0UHhIYXNSR0JqL2xRUVdrNHZFa1JQMnhaUE5JM3o5?=
 =?utf-8?B?Qm5oNDJzV2pLdi9iU0xwcytib2J2UkRzNmUxeXlNWSsvVmJRWUZGajEzWDN6?=
 =?utf-8?B?M0hrZXJNTlVDejY0UTVETHJwOHk4Z0xpY3ZIL2E4ZThoRXllSVRNRlpoakV2?=
 =?utf-8?B?L1ZPYk1lNjRDZ0RtbWgrWlBmcTY1TGJLS3EzRlZ1NU1lMTdPbnVGdXpwSjdY?=
 =?utf-8?B?SzRlb3NUbk9sNFQweUJXRXRrK0xHNi93Qnh0QnlwTmkwVGlTZy9wZ2txNitN?=
 =?utf-8?B?bFNuSWhkR1dPY3QzR1FTWWtya3ozdnNITnJUbTAyRG45dUdFcWtDMTVHYW1Z?=
 =?utf-8?B?S0NwOW9ESEQ5VDVlWEt5ODlKMmoraUxKUk1OOU5qWEU5RFduc3lDeGhscjhU?=
 =?utf-8?B?WS9uZW9mVTB0MDI2anlKV2NJK0xTWmtzRnZ1Qjd3cHRkUWQ0dkJrRVFnSko2?=
 =?utf-8?B?V1pSZzVrMkRKMWMySkN2SXIyK2FSVkRoUWlJVi9IL0ZLQTdMeVNFZkZsMzV2?=
 =?utf-8?B?N0ZHdUx4MjZObzg5YnN6dUF4UlVWVVlhb3VJRCtCQ0xhYWVkZld2em9SVE1M?=
 =?utf-8?B?czg1WHhKRXhtcjYyRkFJVzJkWE5GMkdVUmdXRXhIVHZicnhhZEQ5emEvVCtG?=
 =?utf-8?B?T3NIUW1MWUFTK1ZlRkFzUGdubGdDOVVKZjJSTXQ2K25LbWduY0JaZFg2NTEx?=
 =?utf-8?B?OURNNlZjNVZoY1UybXJkakpFZ0ZHQ0tCV1ZyRUMxUTZPRkl1SWZyZXpUTkpY?=
 =?utf-8?B?QmZ4ZnBIeTU4aU9udjlYdlBjYW5wMGlBTTcrd3ZVZ1BkM1FRK0NqVFdmZElr?=
 =?utf-8?B?TnpkWU9WZHk2eUhmOHJvUUNaOTB2M1FrTU5ERzFRSEs1VXNDRVFBRE56SUls?=
 =?utf-8?B?NEN2VUovQ3BZLzQ1TGUzcmFrdW1QOXdRenhXeUVKZWRIZmxEK2J5ODd4NVcx?=
 =?utf-8?B?Ty9ocjFhOS9QSkxudjhqTFZFTU4yTVpoTitpUEd2SWFKdEZZbjJmczVnMEFz?=
 =?utf-8?B?VnRWQVo4SHViTWZkalFmUUFBallUUTJuK3p4UmpkZERRaCtQMFdHN0d2anFm?=
 =?utf-8?B?alY4RHlLUEh2eDBSSmJMdStMV1ZoR2FpZVZ2aGV2SVUzcit1cjNLb04rZEJu?=
 =?utf-8?B?STd6ZGZVRmtxTDF0eWV5RGdGelgralNiTGtmZkpndWtmV1lNTndyZEo4K2E3?=
 =?utf-8?B?L0J1eXgzSEFKSWVZSlpUc3JhSVhhc2czdzBRT0FYUWJPVmUvMys2T0pjK0Jk?=
 =?utf-8?B?QWJ6dzJrT3JTMm5NNzdZWkNIWWw0Vk1jQmlwTTE0ZlNteG1adU9tMjR3V0J4?=
 =?utf-8?B?bis4MjZvNllaOXFXdy96b1cxbXE1akU4cmZaVnpMSnRteEtPL2h3MFcwcGsv?=
 =?utf-8?B?Qkc5MlFBN3BGRDF1Ykk3eEg4d2pSQkxBY0J3bk5NVk5YN0VKQk4rR3RvZlJX?=
 =?utf-8?B?dHRkdklvWXU5RkhvQm02MWNIdGorNFJjMFp0YVVnaHlSZTBtSm4xYjQ5Nm9v?=
 =?utf-8?B?MGZXbWM3S2NtN2krN0dTQmNLbXJrZEpPL2JXVGMzSWhvZVMvZy84MnhKdFZm?=
 =?utf-8?B?QnFvZTBWZnNUMzFEcWNyempSUDZ6TGhUTVdlYTBsQ2d6U2VXMXRqdUlXQmpo?=
 =?utf-8?B?L1F6Sk1GZGM5Tys0UWFTMmxEL1M2YnIvV2U2OFVzQm11NjF3ZXZpZEJXTXpT?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcce252e-cb38-43a2-ff73-08dda9c36915
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 15:11:30.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI3Yh/KKgXqpan/7l32PoN8Ls4aqxvmPjPwfCeusFkzaKPH5Gp7iMfe0zglxnVZQydn8HhNwPo+c01iJmItMPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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

--------------OmqmnxHyfubsaSaACC1nADtO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12-06-2025 16:05, Nilawar, Badal wrote:
>>> +static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>>> +{
>>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> +    struct xe_late_bind_fw *lb_fw;
>>> +    const struct firmware *fw;
>>> +    u32 num_fans;
>>> +    int ret;
>>> +
>>> +    if (!late_bind->component_added)
>>> +        return 0;
>>> +
>>> +    lb_fw = &late_bind->late_bind_fw;
>>> +
>>> +    lb_fw->type = type;
>>
>> Should we validate that "type" is sane?
> You mean if type is not max supported type. Sure, I will add.
IMO we don't need to validate type, CSC will return -4 i.e. invalid 
parameter error.
--------------OmqmnxHyfubsaSaACC1nADtO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-06-2025 16:05, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d4497be8-3536-47a4-99b9-58b5f1468172@intel.com">
      <blockquote type="cite" style="color: #007cff;">
        <blockquote type="cite" style="color: #007cff;">+static int
          late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
          <br>
          +{
          <br>
          +&nbsp;&nbsp;&nbsp; struct xe_device *xe = late_bind_to_xe(late_bind);
          <br>
          +&nbsp;&nbsp;&nbsp; struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
          <br>
          +&nbsp;&nbsp;&nbsp; struct xe_late_bind_fw *lb_fw;
          <br>
          +&nbsp;&nbsp;&nbsp; const struct firmware *fw;
          <br>
          +&nbsp;&nbsp;&nbsp; u32 num_fans;
          <br>
          +&nbsp;&nbsp;&nbsp; int ret;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; if (!late_bind-&gt;component_added)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; lb_fw = &amp;late_bind-&gt;late_bind_fw;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; lb_fw-&gt;type = type;
          <br>
        </blockquote>
        <br>
        Should we validate that &quot;type&quot; is sane?
        <br>
      </blockquote>
      You mean if type is not max supported type. Sure, I will add.</blockquote>
    IMO we don't need to validate type, CSC will return -4 i.e. invalid
    parameter error.&nbsp;
  </body>
</html>

--------------OmqmnxHyfubsaSaACC1nADtO--
