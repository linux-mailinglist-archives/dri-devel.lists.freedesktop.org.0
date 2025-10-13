Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C60BD2BA0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499A10E42D;
	Mon, 13 Oct 2025 11:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADFy2p4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6999C10E0EA;
 Mon, 13 Oct 2025 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760353731; x=1791889731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nhwjC1od4c/JZO+WGbBA6d+Ebmw2PmEXah66Muw8cbU=;
 b=ADFy2p4jJ2/uI7armJJTnBKPAvCUZxEtgjqTJvIXLoPdSpXaxefavLfo
 G7kFkuIB8c1ck95nwABTCEcFv+kDH95WmBmxrTXewfaiCBVpXx21TNAJT
 ficKzhA/nEg5vdT0WdVLb2g3CZMsaMXH/ohr28rczz5gOVj5my5pXECim
 8VuZ+9YTvci1EkNEgd6n0c5TB14AbrYtK+CR9GqErN9eOJPW0BKbAvbF/
 qjNc7liMLpxT/qSsyC4ogWcFdVsH2wz/zqc3ydZtojnWIG38ykNgYBvP7
 H/izj9zIR307ZC5ELSQ+18O3FsmgAAxe4PG7vc68hOxRcmezkbye3/30h w==;
X-CSE-ConnectionGUID: 4uw4s0oBTAiwqJpDYKjlNw==
X-CSE-MsgGUID: nmmPqluxTP+xqQB+q6rn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="66144003"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66144003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:08:51 -0700
X-CSE-ConnectionGUID: UY9mRJdtRZWbCXMa4vxKYA==
X-CSE-MsgGUID: Af3QGrrCTL6woa1zyRRvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182332403"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:08:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:08:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 04:08:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:08:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apwlT3KR8gjEmFmFU6G1RRFKrJjSdq1HAhMIlYSuEqj+WUj/lpWp+ie+7x3mwTDK4s74xbyp9gDoeTRlkSDf3ofA6DyAUarcCWiUAaUxxVUP//JHAE+/c10Gr5sOODFQd8F1dAfY7f2LNE1wUBxlQMF5L7U5dZo9dijgPniZ8UQ3LbVlisGJrgaxszSfMjTDoROKVi++Sa0llvNHKwd5wZ6B4ntN4N9ygVUZdVyMYFbA+KXUwThSYiueReQlFkk9BVOxGj1rAelJp1HCXCKIGL6lNcGdVMK7xlaNSa4TaQTX7BfrMsZGbYfVOvcL6cKQHOx930/SyaoodfYLBouAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYxZV06sTi6x1T1/Qzm+gyF2T0K1tcvAABUjCvF2tO4=;
 b=ijm3EbDwBl9JZ6SiRWz/lehI97LArqUlzruUoRQ+MPm5qlnP1goYyMNbiytZL2KydX+qYWwNnpccz908ST/y6uMdNiRZ77XKCLNjp74Thf3rccDHy2NGZ1H0zVwn2dtoT2WOTcfsLeln5Blr13xrtfyaPwP7nM4NWM4KhvvNeYIqdALyNO4MpxECOGXrAhhDeReIlagqm552KhutYvNCUPQP+81AhfbHHYAwgUMkBUw3opc52hbsuaIosHpfFOpc2PuJtNOBI06vi1Us99MWXpqpACjUI+IaX1PY1w3G0SKtazHjLmgRKMUsIwbjS16/Z9WItGWRejmakeH7bnB8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 11:08:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:08:46 +0000
Message-ID: <12627457-669a-4bc7-a020-3bad4dd0ce25@intel.com>
Date: Mon, 13 Oct 2025 13:08:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/26] drm/xe: Allow the caller to pass guc_buf_cache size
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-12-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-12-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb41a4b-56bc-47ff-30dc-08de0a48e0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0dmTGl1bUZzbmlVQU52bUhHQ3Z2eTk0V01MTGpHNGVac2p5eXE4VHc4ZjhS?=
 =?utf-8?B?ZjVESFlPbUZSbytrakhTSGRJWDBLR3UyTmxCSHZDWndZbjNIMWtBUUJlN0pD?=
 =?utf-8?B?TEZpTlNnTWJUZXZwL0E3WXF2TWhMdUVuZUErNHdMU1AvVDFXTGRxK0lnUWd0?=
 =?utf-8?B?Z2dDQUlONHdmZk92SHZrQm9NcHJocjZXTWlwL2labjYwdkpyR0hIbzJhbHBU?=
 =?utf-8?B?ZUZOaW5Nb0VYcHQ3SVhOdGNVdFVoMzkwSTJPZ2U0MExVdnp3RFVTQjZlOWh5?=
 =?utf-8?B?dVNiWnpTQll2ZVpuZTNKT2RScDg1Y2RGSnFCZ2U5ODVkcUJXSjYrNUlTTkJU?=
 =?utf-8?B?ZGl5NTZBem0xUy9leEtrajByVzVieXN1amNRN3ZLUnN0T09neWFaWVJ4TEp5?=
 =?utf-8?B?TFpLWlR0VEJrS2hNa2JVV0VxdEdHRnhLRnBpQWRlWWEzRW9tOE03WU5CajBr?=
 =?utf-8?B?U0owZ2NZeGJsOUpyK21ia0tES0RRQlFPRnQwVlN0QjN1c29GZVc2cEJSb2tr?=
 =?utf-8?B?aVROT0dCOEJqdzZOeHhPRW5uQ01DZ0llUE9zL05lRHRIbHBFa1AxZnlsMTdQ?=
 =?utf-8?B?cC9oY2pYTFh1TGduRmVNcURjeDVMNkpDK0wwMTN0K081dnNaMUNvdFVRTmxs?=
 =?utf-8?B?c2VBQzZ1aFJ6aEpBZTBtT045YVhJbFVuY3RCNFArQmwrVUl2TFU2T0k4ai9z?=
 =?utf-8?B?K2dUQmpybXNXY0VyU2VLNWpsTE14d0FUeDN0aWdXWW5maHJHanFpemMwY1dk?=
 =?utf-8?B?TngyME94QXBhMjA5ekJVNFpJOXh0aGl1WHVid1hjYWN0T2JSejUvTTd4OVdV?=
 =?utf-8?B?L3cwRTY5aldMcTVKNW9HSmxIeitEeS8rZDJSMERDNTVFZE1ydnEvbTYwRnBJ?=
 =?utf-8?B?aEY3N2w4NEd6UUVwSlNpL2JmTHN0RXN2a1VZdnM0WVdoN3NsQW9PTnoxWkVn?=
 =?utf-8?B?WFFsOFZaY2xvQzJKMDMwaXNHRUszTjRqcjhCTlVCSy90ak5vSWVzZHVHOXlj?=
 =?utf-8?B?N0xiK2J4MmxpT3BDcXlQalM0Z0lwV0gyUFVEVnR3Sytiam5Xalh2MlpUOE41?=
 =?utf-8?B?aVJXVGwzSk9MSExiT0dWWkN2Z0l1UGlSNXZaNGV4akpkSlIwV3hWRlBudDY5?=
 =?utf-8?B?OFhQTUd6ZVZmSW9hYmRxUG9NbVBIMDdXUDRNNWV6OGFQdW82S1RFZlpPWFB0?=
 =?utf-8?B?bWhsRUxUOERYNGxKRXdITVEzMWxsZGIxcUxta1BvSHRBdE5URXpDWkxSTXpZ?=
 =?utf-8?B?aWZFcDNDKzFZbDhodFAwaVVlRkovci9PemV2aElPclRBNk5QbVhuOTJvRU1E?=
 =?utf-8?B?NkhRV21DM3RWYW11dUJ5UHgrZEZncUZOV1IxeVk1Y3J5UFU1UDlnSG5talUv?=
 =?utf-8?B?MVRUK2RkVzhqMC9qNi8rWEtIaVUwMnJ3eHVsQUJPWXh3WkdwMlBTdWpqQ0Y5?=
 =?utf-8?B?MjhUYmRHQnZhaWhzdnV5bEVqQkZ2cEk4dmU0ZnNoclk3c1k0bTltNlQwRlQ1?=
 =?utf-8?B?RFRqY2hWbnAxVzVqUzh1OUQzVnFUZU5IVi9KUktxVlZPemlLZEJabWdXWldq?=
 =?utf-8?B?OWJyc09XWGI4QTNtcWJ4OTJYSU1QQUFHb2s0d0NGUDFIaEtSV05DcVBIbzl4?=
 =?utf-8?B?WUlVUFBNd3l6UkN4ZVcyQkdINEgrTDRCWllXUE9SM1R6ZktJcXNOVXMzUndU?=
 =?utf-8?B?eURYeE5vclk3VmtiMXM2Y3p2M0dyTzJNamk1UkNNamlmM01Mc0xWd0prczFq?=
 =?utf-8?B?REpVeWlKQStIOGNtYUVaekJGUWd5QkNYQkVIcnk1cDdvZ0orMmVodnVxR0wz?=
 =?utf-8?B?K0JxelpBYjlNTm0zUXhwTWl6c2Jhejc4cmRaOElYQTlqQkd3b0JBL0Fsa2JI?=
 =?utf-8?B?d05waTkxRnZ4ejl1Yzl1RXhBd041K2xxWmNBV0JRTEZHZzYvcVhFWm5qZE4y?=
 =?utf-8?B?MmtQOHhNeWZ3cnlTejlTQTVtRENiVi91U0dGc3RhanFWM2MyYjVkdXJZNHpX?=
 =?utf-8?Q?zNIVU7N7zmZ8GO7iUSgO1DRk3MUHPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0N2Sm16Z1k0WXp2Z0hIMytycnhpSWlNWXgvRU1HK2tTa0ExTVVKMW9NR0M1?=
 =?utf-8?B?NVdpS3ZLYm9rOE4vTHlHNDV1K3pmVy9RVW55M0NmcW92TWtyS1NYOXBpUy9l?=
 =?utf-8?B?Nm40RHZOYUFJZENPUWZ6T04yUXlVa2c1OTYzRGdiOUhkdFJGb1JoVXpBRnN3?=
 =?utf-8?B?YzBaMTVPUUEzY2JMODUzN01sZGoxYzRwY0gyZ280MjFuZEJVM2VyMEJRTC9x?=
 =?utf-8?B?dW13MU5OUHBWV0xVQXhrK1cvNGNTcW16Qm5sTHRKNUdaOHhTT0tjTDMvUFVU?=
 =?utf-8?B?SGNXNUdjUTRQNzZWYURGZjhiWUtLZzVuVWVOTHlxbmsxdWdhdmRzeHlOOGhC?=
 =?utf-8?B?Rm9TdFgvR0NSSFowTit4cllTakZaWU9UajVST1lJMDBlblBCZDdhZXc2cERw?=
 =?utf-8?B?M2xLdGFnNDJGQnBGMkVwV29LMjJBbDlra3c4eWZmYmxoK1FPTHVrV2YvYVl6?=
 =?utf-8?B?M3BnSFI5eWJXbDJSVEJ3blZ1RGNQOHVHRFRYUkZlL0xzbjZOZG5RK0dBTFE0?=
 =?utf-8?B?Mmo3RkVKZ3cxOUtsQStUYnlDZDlsNW1jUTRjVUw0SXR1TnlEYkFPUTEwSFFM?=
 =?utf-8?B?cnRWcXNweWxHN09VY2taSzFsaTdTdkY0ZDRXcTgwL2JrRjlQQ0dnUGJkTnhp?=
 =?utf-8?B?dUJxYU1TcG5kVTJxbWprbUtrN3g2NmlGQ1YzNm1tR2M4STJqZXBjODBKbnVD?=
 =?utf-8?B?OEZHZEdHQ3pPcTREd2kwUXZDbGVNbFZJU2FRc3BnM01ybUJSMWRCY0FVN3hx?=
 =?utf-8?B?Q1AyS3drUUNrdlBNUWQ2YzJHY2hwckFIeEVrZ0VuaENSVmNkK2Vaa1pTQm9E?=
 =?utf-8?B?OE1nTStuOFg1VTBvOUh4MThHZW95OC9WVjUrSDV6ZXE5OEp1SlNrYXFxQlV5?=
 =?utf-8?B?MmNCRGgyYUlYdm1kUEhXMklXUHRoMFlHcFlIOENqUjBDMXcvTDdwcHFHRm5B?=
 =?utf-8?B?RG1uZzVvV0M3Zy9ER1pBZ1VZQUZVOTVrRUpHY0lpWENOdGRvaUo4RjNmYTFv?=
 =?utf-8?B?RVFLUnRlMFFYV29hMmV2TVJvQTdaRkxaMkozLytLQ1JHMmdGaDBQQkhyVkhw?=
 =?utf-8?B?WnpOOUFFbWE4dTg4SmJHT3Irbit4MFdUaHhmS28vUFNSY05IcGtMZVhYbEd0?=
 =?utf-8?B?VjNBYy8wU0c4ZE9WWHF6SHhhWXY0MHJaWGNoMFBhc3hrZitEWkdlMEsyVjl1?=
 =?utf-8?B?cENKaHRuOG9ERGdPWVR0ZmZIeHpIbTlTMVNha090bVRjSW5FWURMN1VobGpH?=
 =?utf-8?B?bHVyOUVpc1YxamNJV09ET3ovQUFjVGpMdUpGWWlJOUFuSlRWZ0didlF4TThl?=
 =?utf-8?B?d0x5bDZCTFg2VFZWZFpHOFJCVlc0UmhxcndvcXFZdi9FRHB3ME9jRDZqbVJC?=
 =?utf-8?B?MUYvYXZEcFlNVDZVeFJVc2YzUTMyMGJjK3NkKzQ5d0tWRVIyUG5mU3FqVTNj?=
 =?utf-8?B?Z2tLOGhPQ3BjcFJsS1JBTEpwaDNyb3ladVFjR21rdGtjempvOG52K3JHalpl?=
 =?utf-8?B?a3Q0bk1tRnBZaEtrRjdLM2Zua1ZYR1d1YmR3UXhnbDh3TkpVUWQ3YWNwTWxZ?=
 =?utf-8?B?eXJvZDB6bkJJWWlBMEdlMkFOSHl2N1JqcXhaK0xXQ281SlBnZS8welFRcjk3?=
 =?utf-8?B?MUhpZ1ZGN1ZsZ1FVRU9DYytQS2RLbU1wc3VGOXNDYXNxdUNpYUZuZG1DRVIr?=
 =?utf-8?B?L3JXTkZqYnhoQmQyNDM2SktjY0JJZTFGK0ZUaFh5WEFRMjd1ZGRpOWNUSEJQ?=
 =?utf-8?B?NTlPTy9Kc3BSOTh6UWZiRDZHeHlVbXJSaGtGNXZ4OGx6ZHM3QXZlakhDYVRN?=
 =?utf-8?B?MTI5b0VtTDBqNnAyOUxTelRrWGRWaTJhM2FhOVhoYjV6SkMvQkhiN015T3cy?=
 =?utf-8?B?dEU3SHBpUi9HV3crZVlVcGY0NmFTZ1JkVEJ3WTFlbkZzRlA1NTJtZmxjcHFo?=
 =?utf-8?B?dDFqRDZ6aTdxR0RDV1gzamJFdmhFS1dyKzh2UXYyR0RFWU4ralEvcXIybE1K?=
 =?utf-8?B?U2czLzV5UkhGSXBNNDhzd3BaK3g5Qkw4bGg0bDZuOVN1VlFERHp1QVJHczB0?=
 =?utf-8?B?S3d3QXZMaE9LaVdJV0wxMXlCaG9mS3ZSQ1FXeXlUd0pIYVlVRzJmWjBGclVO?=
 =?utf-8?B?Tyt4S1ZpTG5MTjZrRlo1V3FuSTFFV0F4a2ljWGZlQm1lUHhFMUxJMEQ4SUNS?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb41a4b-56bc-47ff-30dc-08de0a48e0c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 11:08:46.0471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTLedoWZFke9TZvwwk6IJRUXiXPEAkZw2FyAvcnhoo9JjMIEW8Am0s7e7o4P+ZUKwfzDvcTWaXAwoCSK55wXUNlveVUG0EHCPJVwhGoafxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> An upcoming change will use GuC buffer cache as a place where GuC
> migration data will be stored, and the memory requirement for that is
> larger than indirect data.
> Allow the caller to pass the size based on the intended usecase.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_buf.c             | 6 +++---
>  drivers/gpu/drm/xe/xe_guc_buf.h             | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index d266882adc0e0..c273ce8087f56 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -72,7 +72,7 @@ static int guc_buf_test_init(struct kunit *test)
>  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
>  				   replacement_xe_managed_bo_create_pin_map);
>  
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf), SZ_8K);

SZ_8K added to wrong place ;)
>  
>  	test->priv = &guc->buf;
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc0..ccc7c60ae9b77 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -809,7 +809,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> -	err = xe_guc_buf_cache_init(&guc->buf);
> +	err = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
>  	if (err)
>  		return err;
>  
> @@ -857,7 +857,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_buf_cache_init(&guc->buf);
> +	ret = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 1be26145f0b98..418ada00b99e3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -28,16 +28,16 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
>   * @cache: the &xe_guc_buf_cache to initialize
>   *
>   * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
> - * indirect H2G data to GuC without a need to create a ad-hoc allocation.
> + * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>  {
>  	struct xe_gt *gt = cache_to_gt(cache);
>  	struct xe_sa_manager *sam;
>  
> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));

maybe we should promote this magic SZ_8K as 

#define XE_GUC_BUF_CACHE_DEFAULT_SIZE SZ_8K

> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
>  	if (IS_ERR(sam))
>  		return PTR_ERR(sam);
>  	cache->sam = sam;
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> index fe6b5ffe0d6eb..fe5cf3b183497 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -11,7 +11,7 @@
>  
>  #include "xe_guc_buf_types.h"
>  
> -int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size);
>  u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
>  struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
>  struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,

