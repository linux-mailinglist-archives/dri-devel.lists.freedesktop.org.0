Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46312A350E4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C423410E131;
	Thu, 13 Feb 2025 22:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WachkLNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E17A10E131;
 Thu, 13 Feb 2025 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739484336; x=1771020336;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VR7nhRzNFSgh2NQTIM+W4lhnzInMCoCP79VQ04H9eEQ=;
 b=WachkLNtvtcYknkAUadhZFOGq9DN4ecFsomOlsmL2hVMN1cTZmgZjbMP
 rplTEv01bHVmMNmeJ9nkotXb1UYWjxrxkZWHJZK+jCDQemdKsyLLZ5F+4
 3uPTqLkCs3fkDReAzDsfdiaBuMv49S7kR9LCdV+onUDMqr5XKZocyPCxF
 Z6INvt1AU6LFkv1jaES+4Y0XwmrKBWybfRJkXf/UHVz6dOGordLzIsjYv
 8DG8GOz5ZctAFHCL9rkkCWG2yGsMwTF3yhfMMcrrUQZnGB/rqsBe0u8EX
 9rcDmTSRx9uSO4aPRRjFvBAIBrSSpkSilmjLpIRW5PkXIRjGz39SFkP/Y Q==;
X-CSE-ConnectionGUID: cKBX3XxhRTCEx1RJf1dcfA==
X-CSE-MsgGUID: 79ytUhEgTtGqEqe6Ui9tMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39443370"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="39443370"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:05:36 -0800
X-CSE-ConnectionGUID: xCKAK2uLSpygTbLWA1G/iA==
X-CSE-MsgGUID: S4y6coQ9Ss2Ahv7GGseK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113147162"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 14:05:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 14:05:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 14:05:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 14:05:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmbBdfEgPOS1s5saBhIOnqz6F+mBb35QRbGp6fmaGkDbskkRlyYkN0JQbEEOehm0KtF3UQa7e0RFGR8Ec+g4xaEol1ENlo2GCepexklsIuSGq1qBzJkXBEegeiUsUDWQezHtFsjA2ziGUOK1Enlx2BLBdV5+6lGkO8ATKxu32PLYgtAJGUOzZpUbSajLPqEcHOwSWN2s9T8kI/WPMctkYOH+lTYoEWPAiRoyYQ7ngRTOVZU/iqJnoX1yVKTT6sYcg0jO2pqL2fONatbKwyeY7ChfSAHLlQ4qR+U2V+jmz3KnD8u11CuMAZ8hlIZv4yrPJwHZXb/M7YCofDzy7S+MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW8pFS46T6aa4zBEjWwLg65auB8v1f++hP3jRHwIyIQ=;
 b=NU/U0NiuECHvmiKIbhXWZ0v1ykj5aTF7H+BFTl0TVbuNATlVmSznw8qHU6BPfTMiiNZoCs0Qvfs0vMnGy6KykwHmYNf2ZSeg1ry0weJwl6laDYgvN810wBGs0sBC5l4UYmlTT823FqiliIfodzuprf9+yfirQHpIfGHe+3pHhHDkSdRNK29gx2ZviZDqbvmR1JL3GZk1zwVmlEccZoXqYBhQi9+4lUjPMDgis3z/aXAvY4aqjhOR1RUM8bomgIBcMbEUQHaEkc7n3uaZB4Watx22tntMgBV+tDTrQxWRQvb/Jgoehx5LJmum3eG0ygJ0bhbfkYEhj6zVRmyJly+yoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 13 Feb
 2025 22:04:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 22:04:52 +0000
Date: Thu, 13 Feb 2025 14:05:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/6] drm/sched: Add internal job peek/pop API
Message-ID: <Z65swe1XPG016e0V@lstrano-desk.jf.intel.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
 <20250207145104.60455-2-tvrtko.ursulin@igalia.com>
 <73ffd26bdd66ec25c01f820366a63f9ceedad2c8.camel@mailbox.org>
 <8ce06914-f8ec-4b28-9cc2-6ff9d9fe47db@igalia.com>
 <30be58cb90e95af0d9404082ea5c63eb8f7e9dad.camel@mailbox.org>
 <54da7c5c-a66c-4410-880c-2efebbb66214@igalia.com>
 <504eb5a31ae600b9c95dad015e7090cf0736f0a7.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504eb5a31ae600b9c95dad015e7090cf0736f0a7.camel@mailbox.org>
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbe0b59-b39c-42bb-8da6-08dd4c7a70e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0F3NVRCZG1xUWxaRHJiekJKNmNpYkRGTGpRY0s1dEZ3d21odzZJMnhUaldz?=
 =?utf-8?B?aDF6NXc5aGMrdVBzVWFOY2pHektjOEU5WWVlWUpvaFBtOUdrdGNqNUtTazF0?=
 =?utf-8?B?L3dEU1IxM3MvTnVaRW9WWkF3ekVnTTZQYXZ0VERJY1VteHdqcXpQb3FHTjVR?=
 =?utf-8?B?Mlc1VDlLejNwbDZJRVZ0bkFyQXhFRkxOLzZhczNQYnNrbm83UkdwbFNFemJh?=
 =?utf-8?B?UnNOVXhuaUU5RlMrZlpCay9URkhNMWprTndlanRYUlJsK1dycGNlMWxWVTFw?=
 =?utf-8?B?YmRIY29NQWVzVzByYUV6NzNlUEs4dXlrVU95WGt6cUhhWXUxRGwxZy9sZ3lk?=
 =?utf-8?B?L3dFS0pBQ3FGczU2MFZDZmpobFpCMXFTTHIzU3lRSzg4YUJKVjdKSzZEWno4?=
 =?utf-8?B?M2ZjMEJ5bWhHKzJNVnQvcWFTRlJjdjJWZ3ZKckNqd0ZvdjBhRVdqNDlyYjhh?=
 =?utf-8?B?enFWQlM4alhpK29EanowZlh3WTNWbjlDSWlwUmtKT2oyN0k3NEQ3MEtzQmVy?=
 =?utf-8?B?c1RLOW43VzVCanpLcWF3amJnc08xbzFkcEt3eUdCdHhWeCtLTllqY0RQU20w?=
 =?utf-8?B?QkJnRm5rb1NKVzRVaHdublFVR0Z3UDRHY0hDRTMrMC8raGwyM1BCVGxTSVNU?=
 =?utf-8?B?ekZESHVhYjBzd3VqK2QvZ1gyd1dQMDV3WXp0UHhtWmh6dGdlM1NHc3hnL3ZG?=
 =?utf-8?B?TUZMUXZSbU1KSjdDVFMrL0ZSV2ZaZUE2ckxFV2tJdGU1YWpzeUxTN1d4R3JH?=
 =?utf-8?B?WW5QRnpzWEZWS2dhK085Mk4vWEo4WW5GVzhEMTRBREpoMS9jb2ZGalM3VjBS?=
 =?utf-8?B?eHVHdVlQV0FUaEQ2b3ZKNFFXZWtmMk9MTkFSMTR6eGR5NUhzZ3pCRmt5bWNt?=
 =?utf-8?B?V1I0ODlBZHBtcjd5QXV4YW1pWGs2anFoalh5Sy9rUmJoUk9vWGwrdGVQMWd6?=
 =?utf-8?B?YzlzRWg5Wng0bXZQUDVvV2ZiVXF4N0FVR0wwVDhTaUI3UmpBZ0xMVXVrTnVu?=
 =?utf-8?B?RFhLZnNsVXhoY2NnU1RPSVJLcHQwcGY2TWRuMWsraVhWVXlMNzN3N3pPQWxP?=
 =?utf-8?B?VUZhU2pLYWk5QVlIZS8rRkdWK0IwY014ZFFnM2FIQm9FRjlGWFNXOWFnZXRK?=
 =?utf-8?B?cGxtM1JaaXVmN05yem1GRXdzTHN0MDFnYnd4eVZBWGY1OUFxa1JxL0wzTDB4?=
 =?utf-8?B?RTJUOHIvZFJGSkFGT21kTXdXb0hqeXE2S0xsU3NJQTBRU0FGZVorMmQ4N3BR?=
 =?utf-8?B?MVlRcHArMkxDUFRYTGNuaXJQUmJ4dnFNbGVqNzNMRUlkSjU4cTllTjRwMTI3?=
 =?utf-8?B?L0o4cE83SG5TNkZaVXlUN0xJVkhzdzVtbXVpSWJqeGZwcllmTnFydjJpSngw?=
 =?utf-8?B?ZVlTM3hxUGtSWVRhYXhkSENFMVBQbTU5SEpLdFZmWkdnVG93SkV1U21aeWEw?=
 =?utf-8?B?VWVHYVQ5MEJzbHRMVHpnSUtrWEx0UGRLVHl3SXBiNktTU2x5TWIybzdmZmh3?=
 =?utf-8?B?V0JwemNqaDE5YWFZWlQwbTVhOXF3ZU03cTVvNkhyVjRRb3k0d2JWWmthemJj?=
 =?utf-8?B?WVRXTEpINmtqb0FzbUVRSkhGbnBBRWcrMjY0eEFucm8rTExWZXNNY20yOE40?=
 =?utf-8?B?SlF4OEk0VlRER3VDVnUrVTJFWmdRVWhnNjBNY0tNSkhvS0VyK0tRVUhrdy95?=
 =?utf-8?B?L0g4Y0VjdStUbG1aQThWSDNubGdFOHRRbUpxZHVmTW5pOCtxUGJ4bFZ1S0dP?=
 =?utf-8?B?WU1BSzlLUlJISnRMTkdTMjV0enp2ZlNNdzNYMHNSYzdJbjFUV24yK2lLVWZM?=
 =?utf-8?B?ak9yMUtBL3FWMENoSFluZ283d0hiSmRCL2RmaEV0ak1wajg0a2hBUWl6aU1p?=
 =?utf-8?Q?6R8uzYldALxxF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZyNUtPM3ZHUE1XSWRVZ3dtTC9KMlN6QTRlZWl0VGJvTFdlOHlIZXR1TE1v?=
 =?utf-8?B?Um12aGpTbmNxdG9kVG1XWGtuM3djSzN5dk9JQlFUaStqbDdrNVVId1p5a2dS?=
 =?utf-8?B?S0NhbUVnY2JZZzI5dUlHNkx4akhWQUJXeFExNHRWZXdEQkVlZDJTVTkveTFn?=
 =?utf-8?B?UkVlTkQzL1E2NlcwOFMwemozQ21Gc3kwRDNWRmtXQ0ZNamtHVlowNndaUFpo?=
 =?utf-8?B?UkdSMnJFV2E5YUl2eWVwbVVaM0ZSbDF0RWQxMmZ3ZEJqNUdQL3Arbmk3NC9S?=
 =?utf-8?B?SXNUNVloMXlPR1FrTEJTMVhpaVdwR1R1cE15bU9pZVZ1SS9mcVljK3F2MnIw?=
 =?utf-8?B?Ynd3eUViTC9DRjhZY2ZaV0tiSTUyRndGRkJ2ekN5NzNLOTRjSmlCcDZISFlB?=
 =?utf-8?B?UjN4bm1FMlVVWlR6TE42UWtua0NUYVBTMzI3Y0FteWhMNk1UaTNGV1dYMWJD?=
 =?utf-8?B?QVNML1ppM1Z2cWZrUzJsOXhTeEhyK2trREtsMXhUd1pubzFuV0tjY2dDRVpa?=
 =?utf-8?B?WjFPYUVCY0hIN3FOVlFQMVZnYjVEczBENTVQaG5qRDJBZTlhblJXSklLTWlU?=
 =?utf-8?B?MjZIR3ZFeXpleDQ1TThCall1R0lKM1ZER3Q5MFdyZ1JnYUIvQU9YNnZQYVkz?=
 =?utf-8?B?dHdacno4NWZSV1ZQTTRCOCtmWkN5OG5MblBOUjNoUVBOYlhVSklLU0JycTBk?=
 =?utf-8?B?TGFXM2d4VjB6d2JoZjZLdWZaT094cUNYYXB1bGl2YzNqWDlWZHk0VnYyTEZ2?=
 =?utf-8?B?SlNZMVVtbDVmNEFSODdDWkh6NkRSemk3Z0l4cWdoSFlyc3BpTU03aGVzMS9a?=
 =?utf-8?B?UDl5d2RQQU5zYmN3b29YaDQxWDRkL3JjelNmbkYydFpDVWthdWJWbzBEYzRY?=
 =?utf-8?B?WDVHUmRydVpRWVRHSWd0OWh3VjcyeE96KzJodXp2ZCt6MkZvTm1TdUd2aHFQ?=
 =?utf-8?B?RlV4MkRJSm9LTE4yTjhySDlVYTM5QXlYSmxSMDhlemc3NHo1MGFjUjRYSkhC?=
 =?utf-8?B?bm00b1hmRUpGSVBzcDJ0bWdnbFRjYUtkZFdVTElFb2NMUS9uaG9oWTNBSFRi?=
 =?utf-8?B?QmJtN3RzSnJhWUx4R3NHalZid3Bxbm5ERUhZaWFPazdmQVBlR2VTRytnMkps?=
 =?utf-8?B?bW9VQXE3b3hteHZkVG1PSzJEZk1GR3RxcmUvRE9ZNXQzTXdOWUwwZVBEK2Fm?=
 =?utf-8?B?RXB6SGtmRC9pc2NoejFWZG9sQUNTUG5qa1dkK1JRVG9qeW1rbjBKbjdhQ1JU?=
 =?utf-8?B?VUlmMW1QNlRVWkNVUFZ3WkNpUktkaFlBRHlKOC8wYTFBd2EwdmlhWGM1c2Vl?=
 =?utf-8?B?b3pPeFdTWjBUSnJGQnBYWWdNS2tZc2VwYkFGSGlUaURJTy9KdldXUHI3N2pC?=
 =?utf-8?B?WkFtZmgwbzdUK1hrQndxUStEYlJmcDlybDYvQkQ0K1FlNnFNeU9qOVRmNVZj?=
 =?utf-8?B?czBRVGplM1JIQ3NaOGlpRDRFRmozZEJSeUdaVjl0ZmI0cmtMb3Vmb0tWSXNE?=
 =?utf-8?B?bUFoYm1pMWh1YzhyOXdhbSthNGt4djBJb2phZXl4OUM5alFxcjcxaVR4YjhY?=
 =?utf-8?B?OFQxM2wxNkorU2hSNVlBS3lpaFhNNktmeWR2bFBSL1VaM25GbGlBbUwvTEFK?=
 =?utf-8?B?TlpoZWozQ3NJTnJQc2FnM0dWKzF0Z3VIZ2tiblZYYmlINHpsYXB0bXk4ZmI2?=
 =?utf-8?B?VDEybTBKNnptV3lzTXdpcnpGTkJZOFhRMDV1ejlLZ1czaEFBRDJsc053MmQ4?=
 =?utf-8?B?Tkw5ekFqaE12WlVBOVJ6d2ZNREZiZnYvWDg1dVB0NnhPSW01eFlWL0dBUDU4?=
 =?utf-8?B?bEVJN3YrNTB5ZHBvRXJrTWEyOEFiTnlybElCY0lOemN2eld0VmdScXY1UkE4?=
 =?utf-8?B?T2l4ZHhmNm9QNnBwUmF4U2ZLbEJoZ2VpUWFQZFF3d0Z6M2gvdmtUZFAyZUxZ?=
 =?utf-8?B?MXB6SnJlMUdiZFVUbDFscEZhQlhiRG1aMC9rYS9XUjZIZ1N1NFJmbG1uVmt2?=
 =?utf-8?B?YW5ZdDJqUVBqV0ZpdTl6b3M1bVZiZXRyQXhoelNNWDhlSHo0c3paVjkrZ0E3?=
 =?utf-8?B?RlRHZ0NpeGNLTWNwWDZ1V000bFM2M3lOaXAwWVpQb3p1cThTcVlKeHVsYWtu?=
 =?utf-8?B?V2RXQ2hOWHZmaXRZWDVGcXBQNjh6OHRWNWtOb25tMVVQSzVqSWZVSjV3NGNp?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbe0b59-b39c-42bb-8da6-08dd4c7a70e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 22:04:52.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TijJrSQZ6BfwnHKbztGSWmXKUGoBt++IkqvDF0n7ON6YQFIRRxd5bX86D23W7Hse4r514XY951S38DalXIHHdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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

On Wed, Feb 12, 2025 at 01:36:58PM +0100, Philipp Stanner wrote:
> On Wed, 2025-02-12 at 12:30 +0000, Tvrtko Ursulin wrote:
> > 
> > On 12/02/2025 10:40, Philipp Stanner wrote:
> > > On Wed, 2025-02-12 at 09:32 +0000, Tvrtko Ursulin wrote:
> > > > 
> > > > On 12/02/2025 09:02, Philipp Stanner wrote:
> > > > > On Fri, 2025-02-07 at 14:50 +0000, Tvrtko Ursulin wrote:
> > > > > > Idea is to add helpers for peeking and popping jobs from
> > > > > > entities
> > > > > > with
> > > > > > the goal of decoupling the hidden assumption in the code that
> > > > > > queue_node
> > > > > > is the first element in struct drm_sched_job.
> > > > > > 
> > > > > > That assumption usually comes in the form of:
> > > > > > 
> > > > > >     while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
> > > > > > > job_queue))))
> > > > > > 
> > > > > > Which breaks if the queue_node is re-positioned due
> > > > > > to_drm_sched_job
> > > > > > being implemented with a container_of.
> > > > > > 
> > > > > > This also allows us to remove duplicate definitions of
> > > > > > to_drm_sched_job.
> > > > > > 
> > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > > ---
> > > > > >    drivers/gpu/drm/scheduler/sched_entity.c   | 11 +++---
> > > > > >    drivers/gpu/drm/scheduler/sched_internal.h | 46
> > > > > > ++++++++++++++++++++++
> > > > > >    drivers/gpu/drm/scheduler/sched_main.c     |  7 ++--
> > > > > >    3 files changed, 54 insertions(+), 10 deletions(-)
> > > > > >    create mode 100644
> > > > > > drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > index 69bcf0e99d57..a171f05ad761 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > @@ -28,11 +28,10 @@
> > > > > >    #include <drm/drm_print.h>
> > > > > >    #include <drm/gpu_scheduler.h>
> > > > > >    
> > > > > > +#include "sched_internal.h"
> > > > > > +
> > > > > >    #include "gpu_scheduler_trace.h"
> > > > > >    
> > > > > > -#define to_drm_sched_job(sched_job)		\
> > > > > > -		container_of((sched_job), struct
> > > > > > drm_sched_job,
> > > > > > queue_node)
> > > > > > -
> > > > > >    /**
> > > > > >     * drm_sched_entity_init - Init a context entity used by
> > > > > > scheduler
> > > > > > when
> > > > > >     * submit to HW ring.
> > > > > > @@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct
> > > > > > drm_sched_entity *entity)
> > > > > >    	/* The entity is guaranteed to not be used by the
> > > > > > scheduler
> > > > > > */
> > > > > >    	prev = rcu_dereference_check(entity->last_scheduled,
> > > > > > true);
> > > > > >    	dma_fence_get(prev);
> > > > > > -	while ((job =
> > > > > > to_drm_sched_job(spsc_queue_pop(&entity-
> > > > > > > job_queue)))) {
> > > > > > +	while ((job = drm_sched_entity_queue_pop(entity))) {
> > > > > >    		struct drm_sched_fence *s_fence = job-
> > > > > > >s_fence;
> > > > > >    
> > > > > >    		dma_fence_get(&s_fence->finished);
> > > > > > @@ -477,7 +476,7 @@ struct drm_sched_job
> > > > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > > >    {
> > > > > >    	struct drm_sched_job *sched_job;
> > > > > >    
> > > > > > -	sched_job =
> > > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > > job_queue));
> > > > > > +	sched_job = drm_sched_entity_queue_peek(entity);
> > > > > >    	if (!sched_job)
> > > > > >    		return NULL;
> > > > > >    
> > > > > > @@ -513,7 +512,7 @@ struct drm_sched_job
> > > > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > > >    	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > > > > >    		struct drm_sched_job *next;
> > > > > >    
> > > > > > -		next =
> > > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > > job_queue));
> > > > > > +		next = drm_sched_entity_queue_peek(entity);
> > > > > >    		if (next) {
> > > > > >    			struct drm_sched_rq *rq;
> > > > > >    
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..25ac62ac2bf3
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > @@ -0,0 +1,46 @@
> > > > > > +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > > > +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_sched_entity_queue_pop - Low level helper for popping
> > > > > > queued
> > > > > > jobs
> > > > > > + *
> > > > > > + * @entity: scheduler entity
> > > > > > + *
> > > > > > + * Low level helper for popping queued jobs.
> > > > > > + *
> > > > > > + * Returns the job dequeued or NULL.
> > > > > > + */
> > > > > > +static inline struct drm_sched_job *
> > > > > > +drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
> > > > > > +{
> > > > > > +	struct spsc_node *node;
> > > > > > +
> > > > > > +	node = spsc_queue_pop(&entity->job_queue);
> > > > > > +	if (!node)
> > > > > > +		return NULL;
> > > > > > +
> > > > > > +	return container_of(node, struct drm_sched_job,
> > > > > > queue_node);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_sched_entity_queue_peek - Low level helper for
> > > > > > peeking at
> > > > > > the
> > > > > > job queue
> > > > > > + *
> > > > > > + * @entity: scheduler entity
> > > > > > + *
> > > > > > + * Low level helper for peeking at the job queue
> > > > > > + *
> > > > > > + * Returns the job at the head of the queue or NULL.
> > > > > 
> > > > > I would like to (slowly) work towards a unified style regarding
> > > > > the
> > > > > docstrings. They're currently relatively inconsistent in
> > > > > drm/sched.
> > > > > 
> > > > > I think we should do it that way:
> > > > > 
> > > > > ""
> > > > > @entity: scheduler entity
> > > > > 
> > > > > Returns: the job at the head of the queue or NULL.
> > > > > 
> > > > > Low level helper for peeking at the the job queue.
> > > > > ""
> > > > 
> > > > Returns before the description would be yet another new style,
> > > > no?
> > > > I's
> > > > say that if we are churning lets follow
> > > > Documentation/doc-guide/kernel-doc.rst.
> > > 
> > > Oh yes, you are right – official guideline demands "Return:" at the
> > > end. So let's go for that for contributions.
> > 
> > So you want me to respin or are you okay with doing all scheduler
> > kernel 
> > doc in one patch afterwards?
> 
> Both's OK I guess. It's not a big deal, it's just one letter being
> replaced. If you find some other nits you'd like to address you could
> give a v5 with that change?
> 
> Rest of the series looks good to me. Having an ACK by AMD pro forma for
> merging everything together would be nice, though
> 

+1. Series looks good to me and all for moving some public DRM scheduler
functions to internal headers. Good from Xe's end too.

I would send this to the Xe list to get a CI run though ahead of
merging.

Matt 

> P.
> 
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > >   Or even consider sending a patch
> > > > which churns everything at once.
> > > > 
> > > > Regards,
> > > > 
> > > > Tvrtko
> > > > 
> > > > > > + */
> > > > > > +static inline struct drm_sched_job *
> > > > > > +drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
> > > > > > +{
> > > > > > +	struct spsc_node *node;
> > > > > > +
> > > > > > +	node = spsc_queue_peek(&entity->job_queue);
> > > > > > +	if (!node)
> > > > > > +		return NULL;
> > > > > > +
> > > > > > +	return container_of(node, struct drm_sched_job,
> > > > > > queue_node);
> > > > > > +}
> > > > > > +
> > > > > > +#endif
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index a48be16ab84f..9f614a775c49 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -78,6 +78,8 @@
> > > > > >    #include <drm/gpu_scheduler.h>
> > > > > >    #include <drm/spsc_queue.h>
> > > > > >    
> > > > > > +#include "sched_internal.h"
> > > > > > +
> > > > > >    #define CREATE_TRACE_POINTS
> > > > > >    #include "gpu_scheduler_trace.h"
> > > > > >    
> > > > > > @@ -87,9 +89,6 @@ static struct lockdep_map
> > > > > > drm_sched_lockdep_map
> > > > > > = {
> > > > > >    };
> > > > > >    #endif
> > > > > >    
> > > > > > -#define to_drm_sched_job(sched_job)		\
> > > > > > -		container_of((sched_job), struct
> > > > > > drm_sched_job,
> > > > > > queue_node)
> > > > > > -
> > > > > >    int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > > > > >    
> > > > > >    /**
> > > > > > @@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct
> > > > > > drm_gpu_scheduler *sched,
> > > > > >    {
> > > > > >    	struct drm_sched_job *s_job;
> > > > > >    
> > > > > > -	s_job = to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > > job_queue));
> > > > > > +	s_job = drm_sched_entity_queue_peek(entity);
> > > > > >    	if (!s_job)
> > > > > >    		return false;
> > > > > >    
> > > > > 
> > > > 
> > > 
> > 
> 
