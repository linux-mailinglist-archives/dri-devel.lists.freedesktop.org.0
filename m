Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C6C03677
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43FF10E1F3;
	Thu, 23 Oct 2025 20:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFdLSfc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E7B10E1EB;
 Thu, 23 Oct 2025 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761251962; x=1792787962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BEWTUuTTbrd61BAQ49hfV0EglmffvgIfq5sizwmqumM=;
 b=XFdLSfc08SoGjN5rA2V0CuFkVtfLotKEravaZ9pHcOnOFOvQHfIkSnSy
 sIchKT1oHiwTcxvWH1vCvLtd0ryustOaJbo3VSQ+qj2pXIGqh/j4Mv5Jc
 qApFcglSXXNkxWXzSam6oI1TeU6nRr6nbSWZajH6sW5t9QQaCelphJDgc
 9k7qroBjhM+4WBYOrKi1jwqOlv4mW766fPEB/UUsuhjDGZ+DEnG+dyDgO
 KLBT8pSq/Ps5cczptM2ju3dNvbSTMGcWeJOzOdeIyMHetsiz/uDfIywkU
 akomNnX7zsiQtVxX8uhbAaRCnb74Saf12AK49FCl7zMLDwmC3o9vK5/8A g==;
X-CSE-ConnectionGUID: RnVx+xZZS6Gi4Z1fVlcXIQ==
X-CSE-MsgGUID: a51DmuK4RwaaggjPI/2fgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63474126"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63474126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:39:22 -0700
X-CSE-ConnectionGUID: 1Ja4MsAKSqmAiAQiCIAryA==
X-CSE-MsgGUID: Rz1Jfmk/TH6ghiFMaEHdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="189506238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:39:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:39:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 13:39:21 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUXPgjLX8GcRYoob8qeTWORWTECMLBha8Gin5YgIvTQDvzv+Juvu5uoUwrHJRphpY9WOp1EZ7E58i1t5XClP7vqBofVBwIo1QHRytp4QhypVNq/MXFShGpXywTQSu57Tj2GqaykYOHTl6nYM6eKfMnPdSZZ+TIzBjCALqfYbugX0z3NGAIBLSWTCAEhCDc0bO2D8OHeAEIWueEfseGmptHII8v8mJhv/PpoGERC4w2pzRdRK8doHMQPtlDU9lt5I8Nzw3659HPxxeZjy8yjJyHxhpbhPgHrCHE/VySgpRMXE7IX0Ti3qOswo4Wx1F5c1fDV9rfY5H2WOTeEZBTHPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EvX74gIyM0XkPfFSq8+DB6U4YObWZaZsIhoVvD8pv8=;
 b=Jzv5Y3+gIZv+W1Kd0OYuLh7dOaStTvh3dVWKKdMNsGuKoC1d3Rwp4I2GSTDcI71fs1izI0GdUI2uuwbhGals7+V9dNVDUqQerG6VUo4z6cvUrShbqin7uQI3itPiMEhK3uD8X/Uny2DE7FZhf0vhm1Txc3BEzr8ZCQnYNPiOOANH36JTso1lI04Lx4xeKZh1O1hQDgj0sp+U3kBYHNPQ5GbOj9uNguNW8BtzPj4dgeyJ+A370CoEiKTxFrMvWN0FjBMXj1SWYreaQgbqKoz+hm2TC7DxVRg7GZOqOZim0y5RwZXC/1m8sTbxbeti7KJOezNTOVjdjWAoB84/xqxofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 20:39:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:39:19 +0000
Message-ID: <a8312322-8eb4-4262-b253-d598c819bc17@intel.com>
Date: Thu, 23 Oct 2025 22:39:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/26] drm/xe/pf: Handle GuC migration data as part of
 PF control
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-16-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-16-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 28391a67-b5f3-4212-511c-08de12743d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzNYVlBidUtuYWZXU01nNE10M0pkbXhaM1J3T1YyWEV5SlBMN2tUanNOMG1G?=
 =?utf-8?B?eHV3UnRTczdJR09xS1ZyU2NpeGRjQUVEaVhidzJJcVl6eDI4QnE1V1gyQjN5?=
 =?utf-8?B?L0pvbjg1bWc1dUJsRlVPUmtUSnZ2VUV1R29jSHBVdW5KOWRidlpVSERxY282?=
 =?utf-8?B?MC9MMXF0THdJdHgrUzlQckpJOWx5RlAwUFhoQ0lrWG5Ya1ovYnY4RzRGTWF2?=
 =?utf-8?B?ODFMYXNUNWUzN1Q0UFZKUk5xUDNOV050NXVXSGdFQVMvcnhZY24zK1hma1pJ?=
 =?utf-8?B?TVhEZ3N6NElweXNVVDJnK1VaSm45YWVVeWRZdTY1Zm45WEN3Y1hPTWFhZWkw?=
 =?utf-8?B?L0s3UTJtOWJORUxkUmRQZHV0L20xSXplVTFMRmhVRTcrT3dUMm5UbUV3U3Zy?=
 =?utf-8?B?dVVLbVdYV1hVemx4YTlsWUdxS1FUZC9LWXpIZ2NQdWc5Uy93V3dWaDZVYjUx?=
 =?utf-8?B?S0xiSVZXNHdWNm1PVGZTL2FqK2lVL1AwRXFzN1N3RTJwWjZVRUJRd2JzeTJI?=
 =?utf-8?B?d3ViMHNTWDRDWml1Z2RlcFFDUTZSSEtHVzkxV3l1ZzFSZk5BczBGQ2taVGE2?=
 =?utf-8?B?djF1UW56MURvazE1ajlsS0RFWE9RQTFEUzQ0YVByTm9MVm5lT0dhWlhWbUFk?=
 =?utf-8?B?RDZvV2RjQitOZEdCL3lvRjJXa00rb2k3djArRHFTOUYySVVpczQ2d1NCYnU3?=
 =?utf-8?B?aFB4Q0tyVjJ6UWYxQk1HbnhVOVRKdXhXNVRVMnJPTFNCZEV6RXBOMDhsaFRD?=
 =?utf-8?B?dzRjc2R5YUhUelhranVTa1RqZ0N4V1hKZFBCRkFKdDB5UnlxYnFwc0IxQW5D?=
 =?utf-8?B?SUVJV0RFRVd2RGtybW1tNE1hM1JHNmlhQ2wrOVpEWlFoQWk3dXVmMkZ4RUNO?=
 =?utf-8?B?ekE3amhwNWk1NnhxUS9kLzRpZUZQbkRSTk4yT3Z6S2xjSGlDZ29NSnVFZmov?=
 =?utf-8?B?eC9oczQ5RXVCbUs0LzBXcTZvV1E5TGhnak5Rb0tHTGVvSDBuN1JNWVdMMnRz?=
 =?utf-8?B?RXR5Qk54enI5M3dMT25qdlVCTzJNVWdCRHEzSklKNkRzeUJuM1huRnpXYUZG?=
 =?utf-8?B?WjIyam1HajdKOEg4SnJhbk9IZms5RDEyaUQ5ZHl6bFVpemFBcHMyN2dJMUZr?=
 =?utf-8?B?UmdSQVp1bU5UczMxaTNvYS90R1k1aktPNCtRK0dSU1FrclFHUTA4VVpSdlBH?=
 =?utf-8?B?SzB5VmQrdVVRTERWMTI2L0dKdHJGY3VxaHFoMVNaOU9abzdBZEgwS0NISlps?=
 =?utf-8?B?NXRubU5rZE5nMVZtVE11aHl3b1ljUUhBemdZK3F6eGFOSDRYR29SdTNxYzdl?=
 =?utf-8?B?dmExUnFkMlJKRWRrVHVYQWJkMmtzV0IwdndOS1VidTd4UFZlZEpqVzZleEk4?=
 =?utf-8?B?NXk4cElqak5QVGlQNDFqYkdXdm5Hb1AxNTJvbVR1eXNseFNJTzZZK2UzK0NB?=
 =?utf-8?B?eEw3OVAxSWRwTDF3SEFFbjljWkJlVXEvSUVJMjRqMklBY3IrYkJZelhhWDhE?=
 =?utf-8?B?R0hnYlpvalBJellkTGxhd1huNnp3ajJwYmxTdSsvNWt6akhpdWtHbXp4dGhJ?=
 =?utf-8?B?UW5vTzNhRWlZbm1JMGx2U2xOU2oyVHYrVlh6aDZVL2xucHJnL0g4dGpqc3ND?=
 =?utf-8?B?K2xGYlljNGhrdC94Qnk1Q0hoN0ptUlpVSEtzN0g3WksxT2wyNG05Um5BTkhz?=
 =?utf-8?B?SnUzWGpONCt3YVBlYWJVeW5iNGNaK1V5bkp6dmtlc1BvdUI3c0xnSlJkUTFH?=
 =?utf-8?B?dzZBSzc3VmZMMEluREZxNGtLekZ5b05YUDZsK05FUFc1Lzg0V1AxUmU3NGdq?=
 =?utf-8?B?K1ViV2pwNzU1MVlVTjk1LzFZeTc1aXNYL2ErelZSMXNOeXAzUFE0OGdaKy9s?=
 =?utf-8?B?RS9ZQnBPV0s4UDNDN3pZd0dNbG1KRkJNcEs4WklYbzBneUFmdHdUcFRmNHFh?=
 =?utf-8?B?c0QxQk15SU9aeWpyQnFhaDlkbmZKdEVYL3VkYnpIRmZxdlM3Q1k1ZmwvMFpt?=
 =?utf-8?Q?bVI2FpCdaJX/D+SoLXPG9/RFVg1XKQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExtRXFXRVFBd2xNUGEweVh3bXg4Tlg3TmdrOWNjdDR0blgzNEd1OTZVV2hW?=
 =?utf-8?B?QzIxV3NLdk13UnNwNmx6Wkp0OEZrV3k5eHdKZWNRSmNiZnA1UzFUUHByOERT?=
 =?utf-8?B?MnpockIyd0Qzd1hycTJTbmZjVSs1bzVnZWhpTjZGSHpBR1NzNTJhSDJsZXRj?=
 =?utf-8?B?Tmg0MGxtU2hqZDI2a0J4NXlPQkVBVXI2Q1JJZDRJYUVvWFIxbUMrOXdxODNp?=
 =?utf-8?B?WG1zQ25yN051UUh0RFJ4MnRDTmFOUSs0Y3NHdGZmbkgydUxCUGNYU3hySTdZ?=
 =?utf-8?B?d1pYeEFnSWhIQmpyOE1vc3RSQzRyeUowWVd2bXN3ODdVWWdQelJ0YWhTMmdq?=
 =?utf-8?B?aFBHR1BGc1JxUFhFL2lNODFlcXJheXl2SkJpY1RHaXc2TG5BUE5pSFZHQS9R?=
 =?utf-8?B?anRXWnFaWDcvY3IzVWNNcTFnTGgzVGZvUzRyUEhISDJ2RHhzU2lTYXhWcGZU?=
 =?utf-8?B?MEJHRUhXMWtueURYZ09qUHZGVFpIblVOTGxNR1NsbUFGaTh6ZFIwemxIL1Zq?=
 =?utf-8?B?ZzlwYWlxWTkxRzV6cVF5M3BRN2lKQ2Q3VS9nTDJUQjV6NEU2WEhsMWdLbm1D?=
 =?utf-8?B?MDlveG9wY2RsOFZNNlBCRG4ycEsrc1lLMzlIQXRmdXkxQ1g1WUIzQjNFMm56?=
 =?utf-8?B?LzUrTElTV2hGSVpQd3c3MEFwSk5rZzFXTDJUcjVSZTM4cnJNekRyL0dYRW15?=
 =?utf-8?B?ZDdkckJCK3gvdVJPNEpVQVF4Y0lJNnZXdDBBUGtER3Y5R05NVFVVTWdFcVUv?=
 =?utf-8?B?Mzk2cHJiTGZWRERyMlp1T1hmblEzUURGVHNFci83cksyUDFNdWxDY0txNitL?=
 =?utf-8?B?ZUNvRDU2ZzM2b1RhZEgybW1LaWJDMGcrNG9pLzRPMVluRVI5cDNvS3RtWno4?=
 =?utf-8?B?a0ZSWFV3N1FsbVhpaFo0Y1RxeThjUmdxclhkenFJalgrdFpoUlVTOWlqZ0dN?=
 =?utf-8?B?ZkxSSFNoVzA2cUVQNlhHV1Y3VDhVN0NZTkhKT05ubWRRNXF2YkprRlUzazZa?=
 =?utf-8?B?YmtXZitTcXIzeXdzV1R3eEt3VVJPVEhWTmZ0R3RML2d2dXFIc0FybkJKdTQ5?=
 =?utf-8?B?bW01SENNRUlnOVVDR3Q1elpPSzlrSzZ1bzB1YU9XbTloSm4zV3hBdktnNm9Q?=
 =?utf-8?B?VkxmNGhKNXI2eFhMVW9KL2dsTDg2djRVeXBVNVIxamNucE92QXV5c3FVUnBw?=
 =?utf-8?B?T0NDL0dzVlp2WTg5WTVhR2FDQUI4c25neGlWaXRsK01hdThQTEZWRm1RMGRP?=
 =?utf-8?B?V21lTG53ZUpudUZQM3NpRXlRenRBYmQzK01BRDdwRE5aakFZdXA0ei9nNU1V?=
 =?utf-8?B?TjNoR2hsTVNab29CTzhqYm91NjBuOW5LbVV1QXN4Q3FoQk5TYTEvU0lza0hx?=
 =?utf-8?B?d2haL2RJY0VSdDZJT3VUSjhFUFY0MjdYd05pMGZRTW1GS0p0YTcxZW02YXh5?=
 =?utf-8?B?dk9ab1d1cDdKeC9mN1dRQnNzKy9pZHZ5am5FaVd6UkN2cnlxUG94VEdtMy9G?=
 =?utf-8?B?RFNpYTZWL01TcU5vU1cyMHpDQUtvR3hHSis0dFRxVi9HQ3l0SzFJbVZ2NVp0?=
 =?utf-8?B?YjY4MWIrcEc4Zi9OWG85bWtzSFdja1hvL2JaUHpOWWQ2WWZNaXk5aG1LWE5C?=
 =?utf-8?B?UW80RlllcFJVQnMrZmU5aUtBb3J5WURROFhITWdQZ0ZJRkV2Q0lvbFVKYm50?=
 =?utf-8?B?RUw5bS9QeW90Qm5kL0pOK0p0QlVlSGZ0YU92RlNVeFQ0RGVpTk5CK1Z5aFhF?=
 =?utf-8?B?R25tS0ZiN1g4bWhERlVycHJ0UThzVlVtMEFsY0Jwck9sQkMxUysyQ1Qvbmp1?=
 =?utf-8?B?NlBnd0ZPVzhKaGhHM09hRkUvYXJwcXowT0JJVWQ1c2IxbEdCMFVRbE52SllV?=
 =?utf-8?B?UEtOeE94M0pmZlkyMGk5Q1QySHdjejBrekd0bVFHNFZHZkp4eWNiU2drSUFL?=
 =?utf-8?B?d3d4MkFDc1pzWXF2eG9BNmFXbnRTblFsT2JEMEQzTDVvMlM0bDREbEFzdmlI?=
 =?utf-8?B?WWNja1J6c3VBVHliTUJnY3pnWVJQLzgxR1ozSE1IeHF6RWo4a0swZFBxdnJE?=
 =?utf-8?B?RDJDeVA5ZGlWK3U4YU9nbXdvV3dXNWE1ZklsZDdoT0ZRa1JsZEJza2pTdXg2?=
 =?utf-8?B?eHVmSU05a0dxbzFYZjNuQWJhd0lzV3Y1UENERUUxeEg3a3IwVDk3NkgwckZw?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28391a67-b5f3-4212-511c-08de12743d5e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 20:39:19.0717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CImCYyQH5Y54rsE9h/9sbw3dOEmJFaaCEnOxmn3SvBO93hZi3JgwxaLFxmflQ4Rgl34KYBf6gWqXmhBhHpl9xjieWnaoEWOOy586diLVn68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> Connect the helpers to allow save and restore of GuC migration data in
> stop_copy / resume device state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 26 +++++++++++++++++--
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  9 ++++++-
>  3 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index c159f35adcbe7..18f6e3028d4f0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -188,6 +188,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(SAVE_WIP);
>  	CASE2STR(SAVE_PROCESS_DATA);
>  	CASE2STR(SAVE_WAIT_DATA);
> +	CASE2STR(SAVE_DATA_GUC);
>  	CASE2STR(SAVE_DATA_DONE);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
> @@ -343,6 +344,7 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);

this should be in one of the previous patch

>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> @@ -824,6 +826,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
>  	}
>  }
> @@ -848,6 +851,16 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
>  
>  static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
>  {
> +	int ret;
> +
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC)) {
> +		xe_gt_assert(gt, xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0);
> +
> +		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -881,6 +894,7 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
>  		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
>  		pf_enter_vf_wip(gt, vfid);
>  		pf_queue_vf(gt, vfid);
>  		return true;
> @@ -1046,14 +1060,22 @@ static int
>  pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> +	int ret = 0;
>  
>  	xe_gt_assert(gt, data);
>  
> -	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +	switch (data->type) {
> +	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> +		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> +		break;
> +	default:
> +		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +		break;
> +	}
>  
>  	xe_sriov_migration_data_free(data);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index 35ceb2ff62110..8b951ee8a24fe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -33,6 +33,7 @@
>   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
>   * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
>   * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> + * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
>   * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
>   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
>   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> @@ -76,6 +77,7 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
>  	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
>  	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,

as DATA_GUC and introduced later DATA_GGTT/MMIO/VRAM are kind of sub-states of PROCESS_DATA,
better to keep them together

	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
	XE_GT_SRIOV_STATE_SAVE_DATA_VRAM,
	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
	XE_GT_SRIOV_STATE_SAVE_WAIT_CONSUME,

and at some point you need to update state diagram to include those DATA states

>  	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 127162e8c66e8..594178fbe36d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -279,10 +279,17 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  {
>  	ssize_t total = 0;
> +	ssize_t size;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  
> -	/* Nothing to query yet - will be updated once per-GT migration data types are added */
> +	size = xe_gt_sriov_pf_migration_guc_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	else if (size > 0)

"else" not needed
> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  

