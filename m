Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D9ABEB0D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37410E5DF;
	Wed, 21 May 2025 04:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+0BbN7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9458310E0D3;
 Wed, 21 May 2025 04:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747803045; x=1779339045;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=06J8am85JBPPNFtTZDXg7DEkizkZPo5xUgFufrzsKmk=;
 b=S+0BbN7ggNsEwYQ3HSkhvx1yUiWzwInDYwy90pNjup6XnmzTSTZWk6pk
 yLSHd6dQ0M5J8yQc2fOKTnhoGfgFVsz1xJkpY7UePZRLyOG0Ja6Sv1jiv
 6BJZkn1TDX/1yi7X/ZRxSoKK26hE+um7Zj+QBDDwfARcoJXZpz5OVa5oR
 Xge51wFgHolXkKIC8SFLDg/KfPTtk6WEKI9oluo0sf4sStoZFgHguzzs+
 aheGUJwCuoXfUzOZVFyCf5xQ48mR1BzcRAxhKPhNx3RvdS1A50Wx8TzFv
 Dhn1OurUvtp0ZfD38vT5VPERbrpISEs/zWyCUzx/Ggi80RGsQwpAnUMIE w==;
X-CSE-ConnectionGUID: gBChc4ewTOijFX70yxCfAA==
X-CSE-MsgGUID: Fh458feoQyCUUePoaTounw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60800849"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="60800849"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:50:44 -0700
X-CSE-ConnectionGUID: Kz6WqtK8RP+TP3i7p4kwMw==
X-CSE-MsgGUID: zB1hoWVmRtSx92e3wZTzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140433215"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:50:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 21:50:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 21:50:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 21:50:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9BgrqFIAbUgLbQk+IQjqqNQBJ+WWUi0PCRmFgDViU3e0gxAPPu5sq5wC07xoTO7ot1VVe+JJlMFsGUjmEobsgizJ2dqkR/xHUFjKP237yBGhbgL8llrGNxuGbDWOLeAHiU4dYrmu4ROp0+eIKaI4u5U9uf9yPTlJIxuU2/wb6ZL3OHOzenAxWHAI8Zgp91twhbmmUKwIig5kQDoo6k1T7PTb4v3/QRC4DkRVBujI0nsQBAG7Fn4wYQi50vhVQ09KM2zyptEl/ul/eM+TE1qEyd/VKN69prXbHf8hnzJ1Hhtoo44YVtZUpOudo8WwunJTOtaK08d0zVn4X89L4QisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++659j9UEJo5q3K4P5/TLZ2gwYNU77suGUSD6rRY9QM=;
 b=cPZmkF2U5/X6OjpaZnN+xRYrIfii9xDMjIEqFN1MWhgftmCBRjSESbbVf+KmIhK/bbizmdYmrDA/i9ZeligWwGio2D4T+tT9TRCUvHbzBlfyGvmTdVPH3gzawkj+ezBAT8qH0M5UolQtT3jMdOq3JiIf21uBmInwuazjHKznM8jjZUrrKr1nXP1CXbInADmNnB5Ar6I9zx76fp0E14Eyk7U4RNYFQDI3xvsC46F3vpd7vpY5g74LopWVshEVM6cQN25Iv5ZwpYBtiFMFgO8UZ5zugFe+vJnle61Unf1UXE0QwEvV+VBhDAS+PO4pjcsLLtxPdL33A92klXCgnFknoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 04:50:35 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 04:50:35 +0000
Message-ID: <d26c7cc4-ead3-477f-a24e-cc9d31d81063@intel.com>
Date: Wed, 21 May 2025 10:20:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/panelreplay: Panel Replay capability DPCD
 register definitions
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-2-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520165326.1631330-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 48aa87bf-4bce-4bb4-32cb-08dd9823066c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU12bXQxVVRlWHN1Rlo0dnBsaTkrMWliUzdpTFJqV25kOFdIZHNVN0Y0UUlT?=
 =?utf-8?B?ZnZ3eDZzS3U5aEw1UFd5OENUcDZMYUxCdm1NN1I4aVVNYitaa05xSFlTWUNX?=
 =?utf-8?B?R3NzRktGWkRVQ25IZk5PQ054YzZKMi9lUm96eU1aVzF3aTZNRWNSVlZyTk1t?=
 =?utf-8?B?Mm4rNWlWWW5Ua2lsMUYxaW9pOW9HUWhRV1Y3Z1VMSVVRaVhvUTN3RVlPY3ZT?=
 =?utf-8?B?Y3hZQ1VhQ0NROTNaS0RNeUgwN2RIVjVseVNVeE54NUJSc0E0QklpUGxtVmFO?=
 =?utf-8?B?VnAxYWJBL1dRV1lsNTIzYnl6NGt0TG5lcHo2Si94TzlkTGxseU1EczA5QjV5?=
 =?utf-8?B?bXBzT1VmSWdjSExIVnNNWldvcG5XZVE3bmtVWENlRS9kbTlhODFTb3NBT0Np?=
 =?utf-8?B?dTl0YVB6ejJycU9tSVhZMjYySmJhVVozY1R1b0hkK00wRzlKZC82OXhHQTRF?=
 =?utf-8?B?K3Buem85ZUZwYWdKcVVpcGNGQ1YyeDlwdUdIZDFNSWtJcTVJd2d2S242Q01F?=
 =?utf-8?B?Z2kweHdaUzNuUHpzVWszc2lUcVZQd0FHd0FyQTFQcS9nSldZaCsxMllZVFhH?=
 =?utf-8?B?eWNqazRYVlhLdk1ydWpSV2VVdjkxN2p0L2gzaytXbWQ1VEM3SEpJVnhlZDdQ?=
 =?utf-8?B?dGRsT3F4NFp1NkJnUkhuNlovV2RNK1U5d1hGY2w0SENsRElRMTc5ay9MMWtT?=
 =?utf-8?B?SXAraWZzTW5Yc0xINFpla01NL1YvdnNNU3dTQ3dsckZpUzk3US9CVVV5WEt0?=
 =?utf-8?B?OGlGdTFpbWg2RGNwNFBQZFN4R1E5L0Y2c09LbGtjME82eHFiOENMc1l1OHQr?=
 =?utf-8?B?MUZyanl4WmFlR2MrU1BWck1ieW5aWjBNdC91UE5CeTkwYytPZisyOVdRdC9Y?=
 =?utf-8?B?SEFuSG51cFpWaTBQdXl0WXRwaklhVno3QmZ2Ums4S3ZyNkxWM0ptKzUvakcv?=
 =?utf-8?B?cW90US9CRkU0MzB2MXNnVXMvS2oydVJjOHpIbW9lQnlEemxaTXErY1d5QmhY?=
 =?utf-8?B?Ylh5QXEyaEJYaldjS1RPZ1JCMjAzbDNZdVY5ekFhSllGTEdBcnJqV1JjdnpF?=
 =?utf-8?B?M3ZCbEpnMFpSUnFxNVBrVjJaUnBKS0V0blNIZFZqdkZ2N3NSWnE4OW5wQnZn?=
 =?utf-8?B?VWtYaytRNjloeXJ0eUMwcEE3ZHZXQklmUURJaWtPMElZQ2hVYmsyZWxBRW15?=
 =?utf-8?B?UU8vWEZneDlEUGhQcGYxMEdsckhUNmJBSzJKMW1aNjNDSFQ4K2FMbnJwTXJU?=
 =?utf-8?B?N3BSazBSeWpXTU81a2tSMWJ4UVU1VVlTcllNS1J3cnhhT3RoeHBtT1N6dFR6?=
 =?utf-8?B?UTVvZHppT2pWQjhtSnJNemZjdUsxS0IxMkJuSGFWUTV2aG9YQUpOVERmaU1u?=
 =?utf-8?B?NHdxK3BnSjNmTVB6VUllUTVtbmhXZ083eXNwVjNGNVA1SGs0akxvMHRZMGlu?=
 =?utf-8?B?a2FPNFRBbVNPZkQ2ZXVUeWthV2dNY3c3Ni9XbUIrZTk0YzU0Q2lGV3ZZalFK?=
 =?utf-8?B?cGluemFoOXR0NnRBeFpiNTMrWjhQTS9PU0VxZWE5S1djNkFuMnpXektueGRz?=
 =?utf-8?B?c1VSUTRRQWFaRWhVM3NDbHFjMTFvQ1lLMWZzcm1iek1RNCtydEN4UkVwU0tF?=
 =?utf-8?B?YVRCemFOY2g1bStXT3BpTWxBZXhNVkE0QVk1MmRMelRxcXpNdzRmUFRkVzJh?=
 =?utf-8?B?TDRldTBTSVBRVzNnTWVSQndHVm9JOFhlU2hJUXAyZjVBblZHWEYyckV1cWFa?=
 =?utf-8?B?MjdtWXpRYTJ6dTMxWlVTVURWMGdXTVpGUnR6ZlJ0L1F2cWtKcndxTGc1TWhD?=
 =?utf-8?B?bUpyaVRSMk1tU3lvbWdFaVJDK2pabTVQT1IxWTAyOGZoL1JHeHlueFZ5bjNN?=
 =?utf-8?B?UDU3OGF0NzZMRlYwYU44RCt3OE8wQVhQZ3JzZW9aeGd5ZjJCYnF4c3o1WkVX?=
 =?utf-8?Q?/6y/gMe7fbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGNNQW5GYUcwN3ZEODdGMThOTW8rc3NRZ0t5c0hma3lxQyt5Y3QwdXI1M3M2?=
 =?utf-8?B?WjVkY2VEUTIwbWJlY0FNWDZPWWtON3VqNDdKRk9CWnd6anhKMnI3em1SREZG?=
 =?utf-8?B?NjIvSVp5NVNLVHBmQjVEbkpLN1Y2OFhHZ0FwcmszenVyZ202RnhiT3l2MTV4?=
 =?utf-8?B?dDlTRlZTcEZrclRwS3BmL3J2d2JCenpPckQ2T3VEVHF6ZEtNc1lsZmwxcHBm?=
 =?utf-8?B?RllTNXh6R0hJbUgrUGg0Z0dPandJbG9zZmJDMytnN2t4Mm5tRVpZVkdnWHNK?=
 =?utf-8?B?OE9ycWtnNFJVTzVPKzFiQ2RZa21oeElBRHJtbnhzdElWQUhXejJ4ZnlxTFNU?=
 =?utf-8?B?ZzhBdlR3V3RvWnRZNlJLc2hqZXNCZzNKRU1KSVVtTFNqSEVXdzdLVk4wYzhF?=
 =?utf-8?B?VUlKaUs4TEpCc1lMWVNwSDEzUHZVbmtKMjd3YzlrTjVKUXdueVVUckVqemFE?=
 =?utf-8?B?d2tBZ0ZwTkoxQUM5RC9nbGs4dk0raXgzSWpXRmZ2dklwN3JrVDdCaUxaWFMz?=
 =?utf-8?B?cElkRlBlSldtdDFoMHNsTUs5K0NEVFBHamJoU1FzQzF0ZWZyUzZYakJ4QjBw?=
 =?utf-8?B?bFpua0JPYjZVZm1EZXFKTXh3ZjB0OU51V1A4a0lvRXFoN3BtTUJoamtQU1V6?=
 =?utf-8?B?L3UyakZtSmtJTkVHT2xVZlpUMGhsUm9UTVBiY2hHTVp2NXdkMWJwRll1M0Ro?=
 =?utf-8?B?VXF1dlpXZHdaajZsM1ZJVFFSaTczMi9oOGp3cy9IUGZuUngwaDhQY3NtUHc3?=
 =?utf-8?B?SVFlR2Jtc28reG9sT3Z6QkVEY0RnL0xwQ011QjFaeDV0eDhLcTF5OG5CYk9n?=
 =?utf-8?B?Nkk0akZIQ01DNlVONjZwVmxQV0xPSVFGcTFFYXIyT2hCd2dTeTROM0tubFlH?=
 =?utf-8?B?b0NkSW5Zb1YvK0VSeTRuR1ZYVnRySStsNHNId2tFYzh4aXJKVHdGdlRvTXpS?=
 =?utf-8?B?a0pwem1IeERIdXpSeUo2cjhZektpaURUcGd2RnFrTHQ1bE5saWpFNStHbVhz?=
 =?utf-8?B?Y3BlWE9XZjNUaFc4V1RBU2FHWWdNVW5DN0lYb2VpczA0eEFJczhrY21FLzhD?=
 =?utf-8?B?b3Fla0ZiNTFpQ1pjQmJ1WEhqWktZd2prdGMwQi9hN2o2VEtsOEhTajRvM2Ri?=
 =?utf-8?B?ODBKcjNWY29xTVpHbEswTW1KaERGcjZNR2JVTllWSTh2c1gzVUlxakN6djN3?=
 =?utf-8?B?enIyUkp0MUtvR3RTMVIyWDVxc2tXOHpuQ0hDT09QeDdzS2VMWG5kcmFmaCsy?=
 =?utf-8?B?MzFLbEtRd1RuNTQ2NHM2K3EwTG95ZW9CTVhsV3ZRUVhnS1paRE9jai9qTWlI?=
 =?utf-8?B?cHZiMG1DTVZ5UDdhV0RZR2FOd3ZBalV3TndLOExrcU91dGlTNXUvcUNQcGNx?=
 =?utf-8?B?SS9neFV3Z0Y2bGtRaFZOWXR1RGRqa3pEWk0zbmFic3k5QjYzYUZ4eWR4L3Jv?=
 =?utf-8?B?N0RKVzNwd0ZidTRSOUxyLzZXK1FoRkhUamxYQlZ2eHpOWFFDT0FRWkFtZlhO?=
 =?utf-8?B?QTJ3UWpSbjFZZHFLM05EWG4yNlNxQ01NT0dDRHM0STRDajlhNGN1UXY2N05x?=
 =?utf-8?B?S3BrVzRUclg4RE9BUDVSbS9uaUtnRWoxaXV3cWpYWlp1WldtMFl2WGZuSm56?=
 =?utf-8?B?YkhEazhpR2FKeFpGRjdtS3REVDFoR2ZwK3I4REtiTFkrNGJPS0R1Tyt4TUtn?=
 =?utf-8?B?S3JIcWdQWEluQksvcEdzeVNiYUhvcVBvU3JjUDFLeXczUHVTVmFOQjlUT2Vi?=
 =?utf-8?B?cHFPSGVSbXFvMmtobTRSSjJsQmN3VHJrVVRvbktOczhkNkFTZnh3NjBQeHov?=
 =?utf-8?B?UUdEeE1yV2RqY3lJMmtCU3N5bEE4aVk1K3M0RjlBUFNJN0VMTTZSZkVFdmEw?=
 =?utf-8?B?eVZDcWxDNXp1MHFYYW1XOUp5ZzUwZi9zUFpWR2pWaG9ROE1DenV2MisrZWll?=
 =?utf-8?B?cTVXMDlseFd1L3NPZ3NGTDZITHgydVNPSDdEMFYzV21zQWtRSWNhclFGLzg4?=
 =?utf-8?B?VHRxbmkya1ZXNWNUdzVHVC8wN0k5MnFaRm03SXkvTzluekpReUovbngrNE1I?=
 =?utf-8?B?NGMzWi9XMHRNakd6ZzQxSjhPTWxVamY0ZzRCbFA4VGhqUFc3bDhoS29aUnF6?=
 =?utf-8?B?aDVaWkJJbFIvTnVkbVo5WWdJNWNuM1F2cVVLdnNVdXRBZjdrOURLY3pUQmZz?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48aa87bf-4bce-4bb4-32cb-08dd9823066c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 04:50:35.8800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7bpHpHQxlpkvidXZZeXLswxS8qQm/Rcil1qWHM+lxYAwn/x+9XN2I642cDkNcl+owPCAjIyWdvmY3SkP+sq2XOJmdosIBRbPpJwVgctu2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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


On 5/20/2025 10:23 PM, Jouni Högander wrote:
> Add new definition for size of Panel Replay DPCD capability registers
> area. Rename existing definitions to group capability registers together.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_psr.c |  8 ++++----
>   include/drm/display/drm_dp.h             | 12 +++++++-----
>   2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index cd833b63ea6b..0cfdeff268f9 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -516,7 +516,7 @@ static u8 intel_dp_get_su_capability(struct intel_dp *intel_dp)
>   
>   	if (intel_dp->psr.sink_panel_replay_su_support)
>   		drm_dp_dpcd_readb(&intel_dp->aux,
> -				  DP_PANEL_PANEL_REPLAY_CAPABILITY,
> +				  DP_PANEL_REPLAY_CAP_CAPABILITY,
>   				  &su_capability);
>   	else
>   		su_capability = intel_dp->psr_dpcd[1];
> @@ -528,7 +528,7 @@ static unsigned int
>   intel_dp_get_su_x_granularity_offset(struct intel_dp *intel_dp)
>   {
>   	return intel_dp->psr.sink_panel_replay_su_support ?
> -		DP_PANEL_PANEL_REPLAY_X_GRANULARITY :
> +		DP_PANEL_REPLAY_CAP_X_GRANULARITY :
>   		DP_PSR2_SU_X_GRANULARITY;
>   }
>   
> @@ -536,7 +536,7 @@ static unsigned int
>   intel_dp_get_su_y_granularity_offset(struct intel_dp *intel_dp)
>   {
>   	return intel_dp->psr.sink_panel_replay_su_support ?
> -		DP_PANEL_PANEL_REPLAY_Y_GRANULARITY :
> +		DP_PANEL_REPLAY_CAP_Y_GRANULARITY :
>   		DP_PSR2_SU_Y_GRANULARITY;
>   }
>   
> @@ -676,7 +676,7 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
>   {
>   	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
>   			 sizeof(intel_dp->psr_dpcd));
> -	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP,
> +	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
>   			  &intel_dp->pr_dpcd);
>   
>   	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SUPPORT)
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 3001c0b6e7bb..3371e2edd9e9 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -547,16 +547,18 @@
>   /* DFP Capability Extension */
>   #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
>   
> -#define DP_PANEL_REPLAY_CAP				0x0b0  /* DP 2.0 */
> +#define DP_PANEL_REPLAY_CAP_SUPPORT			0x0b0  /* DP 2.0 */
>   # define DP_PANEL_REPLAY_SUPPORT			(1 << 0)
>   # define DP_PANEL_REPLAY_SU_SUPPORT			(1 << 1)
>   # define DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT	(1 << 2) /* eDP 1.5 */
>   
> -#define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
> -# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
> +#define DP_PANEL_REPLAY_CAP_SIZE	7
>   
> -#define DP_PANEL_PANEL_REPLAY_X_GRANULARITY		0xb2
> -#define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY		0xb4
> +#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
> +# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
> +
> +#define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
> +#define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
>   
>   /* Link Configuration */
>   #define	DP_LINK_BW_SET		            0x100
