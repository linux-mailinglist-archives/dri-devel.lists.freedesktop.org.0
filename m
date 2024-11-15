Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EE9CDC06
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFCE10E832;
	Fri, 15 Nov 2024 10:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czPwQd2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C470D10E832;
 Fri, 15 Nov 2024 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731664866; x=1763200866;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=akRc0JE1C3ccw+OkLx7R/G5oZ62ddqFEj0gVikWm/y4=;
 b=czPwQd2+l7sKscTJN4vx1AyQIkq+aggj/Vw0G/v9YJPzIr2JKTjdlyGw
 vxZxCFh1Zwv4ymUg/f5yNEae3gPB1EPDbNJ3rzFoezZIov0IuLeCDeyvl
 q0KUTvktDPcPURghQKE/nt+6fvo2AdcpMebTJeRp/BU9bfZoK2WXKp1Tb
 nGRYWXdquyR2KRhl2+cX7aRTq8gLOymq46ayQx3JjsSB7NLwWRYt9YmV5
 KteVCD9YvNVEYJTjm8VcU21P79IL7Fz51NFgsjSa5RRRAlY/HGlvuYlTp
 y59/o63OB3Gojw4j055BgoowbGSNHs8xgGK+ikGxPQCc7DwpQMGO0bQ3h g==;
X-CSE-ConnectionGUID: KNqKP4hMRUaWRLbSoGht3Q==
X-CSE-MsgGUID: TXj5/O6tTPa0RuR2/CzJXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42197124"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="42197124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:01:05 -0800
X-CSE-ConnectionGUID: 8V6CDND+QxuHHZfgID8dpQ==
X-CSE-MsgGUID: J2QOPwUSSwmrkSULsPSGHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88516484"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 02:01:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 02:01:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 02:01:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 02:01:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaTTldCVLAtIYA7CvRiokuhxDV7EK/QljMYkMR9F+QZqdjRmO0QMTZ1zIgO8T65/YTaPT3UUU0vzzKNjxoYXrAQxYIgmT9F4Y2p1wUaZjDkcSDjLPC+PN8Fv6gM5Sux2E8szZs57geWY8VKooPbnmX5R7wkTQQ6Q7otdQ8luLThnJ133DGpCPg07jc1JiZ4IAmtnhwoXTfBVje7kzB57VlcGNW3y4tul7GbvSemC95yVdUuzoEyIFxPB0sfFlRI1+Udi4/hvPurIz1kzCDX4xH2DAf69FedeeIZXBOUmWyKvR6xYNxtzO7axJ3NWbAP+3cBjicaFuwd6q31IYw4B0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yi4pU5QSn/cvkTp4mORHSIUl+pKetoKRa8i1Qtdysrk=;
 b=h9Kgf0RbH3XdWzA1UcVx0jzWLbgVal7vBkNUm0Q2VNSsHjB0LhrXNNFDiY8gv/C4hXTbOyZHT5j1GPMnQQTjqPf5ZabbdYpHHg0ExUNvv8aFepMLXiR3/jRTBUZUaqjEAmlD39OZWJd/6nbYcoPwH25BACNSD30Hwc8yjnYP8Geey+FCW16n87YSvL70e9WWug1LvBsXIQ5w4gP//PcrcfXXlNRPAFDJCIwQhaGMLIdvb94ZpO2LpT0lxQG+YhZfWksxLzMcCcVgz+obtWeyESixL2cHs5sIIFjo7mnSwcykc5hbv9XA/IwoWWeX+zRDUgYkVxOFOvskKJYXYKWE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 10:00:58 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%5]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 10:00:58 +0000
Date: Fri, 15 Nov 2024 15:30:46 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Su Hui <suhui@nfschina.com>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nathan@kernel.org>, <ndesaulniers@google.com>, <morbo@google.com>,
 <justinstitt@google.com>
CC: <matthew.brost@intel.com>, <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/xe/hw_engine_group: Fix bad free in
 xe_hw_engine_setup_groups()
Message-ID: <ZzcbzmSRy30ALtUr@bvivekan-mobl1>
References: <20241115024941.3737042-1-suhui@nfschina.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115024941.3737042-1-suhui@nfschina.com>
X-ClientProxiedBy: PN3PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d7dfb4-ebaa-4090-aaa7-08dd055c66dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlIwRVNPNGExaW1JaVBXM1F3dGFXVDB1ZkROZko2bDBEWXpYaUtOWHFHQ2dp?=
 =?utf-8?B?R1BFK3R0OHQrQ28rRG5GY1ZZVHFBbXJmQzBhOU5LSjRHeUY5OGU5QVBRanhR?=
 =?utf-8?B?Q3M1VDJGVk9MVitaSWZ3QmJnUHp0WHFvR2xvZkNlUWxrdkUyam00S1ZkcEVD?=
 =?utf-8?B?TDcxVGpyZGVOQTFhRkZmTUg1MU1rSklnUVp4V0Q1dURjU1pudHgyazBZakJI?=
 =?utf-8?B?ZmpaU0xYa1pvczcvRnJJMEQ0OW5tS094UmQveTVFTUZ3cnRnZDdndmJWeVlL?=
 =?utf-8?B?emZ0T1M5TnR1N3h3NGZFQTU5U3pGSmxiTE1wTU10QzRDZkQ0Yi8xREFwSmZI?=
 =?utf-8?B?Wlh2bEdnN0ZCR0gvWE1idE9tTEUxdlRKSkNxbmp5blNXc044T3YxaTJwNDVh?=
 =?utf-8?B?cWRNZkNVbHJsbGdMMnVHODVpeWFDdDdQczE3eDZDeWdmbXhLelkvazgxR2hK?=
 =?utf-8?B?UHdKZW5kanBwMDRPcnE2UUdUbkI1d1ZuTnpOUmZDRFNsOGVwQ3FhbjA2akgw?=
 =?utf-8?B?c3BDS2N6M00yRVdnSkpiTjgwdE1Pc3ZySm1HcHRLaEttZXBadnQ2MnBZbjFW?=
 =?utf-8?B?WHJrbHZrWG5EZldqa2JDWmphbGtHVkgrSVlodFdPOGtGZ0E3Ynd5emQ5YmVz?=
 =?utf-8?B?RGU5cXkvVHNBWVdSWkk5TzVpcVdpSjQzcld4eFJueVgrK3dUUTRha2JmSHZU?=
 =?utf-8?B?Mng2SFFmeVlHZ1gzMHh6ZE9uN3YyWDgwN1MxREh6RlF1ME9aZ3NJbXFTbkkz?=
 =?utf-8?B?QVVRZzZNQXdZYTVINWoySDV6TlkxeUlLQnU5bm1OS2dXNVBXYjFUVEhlMFF0?=
 =?utf-8?B?WjJCTDdHYVNVaDRXRHJyV2NzL1BwMzJyNHgxM3pjb1doaEdvVmMzaDNTdXdM?=
 =?utf-8?B?dXBtR0Q5RmdJT1kzcmtNNTNDNmZzY1VJMWl3L2IrYlFRNUNqb1hKcy9va2ZV?=
 =?utf-8?B?UmRsenZBdU1iOVY5Smc2di9yc0ExN2M3NXFQNytWSmk3TzhBU0FkdEE3Nzh0?=
 =?utf-8?B?OU82ZDNVSU04WlhSWFBTQWM4MzN5YVdsc0ZxVll6Ui9iWndIOEZyQ09EdnJX?=
 =?utf-8?B?Wmh6MFVYQ3Z2RFgwb2tFV2dvR3NGVUhLQ0JtZWU5dWhGNkwrdUxJbzViT2t6?=
 =?utf-8?B?ekJvSDloOSsvRUNiUVZKaGxHTHlBRElXYWxuRWJOUjgrNXBzaU5MWUltZng5?=
 =?utf-8?B?Q3BrSVV6cndoa2kwT2RJT3VCTExqaTBYQlRZeGpHL1lBcHNvV3ZJc3dqMlJr?=
 =?utf-8?B?T0lEVFZXWGYxQ0haUno3WVFwclNmb05XVlREZEczZ2ZvaE8xSnljY3VSc3RC?=
 =?utf-8?B?bG8vT0RkT1JjSDhOZXZCRGhJRVVlWWhXSmpzdGlNc3ZwNjRWUS92bG9pdGdv?=
 =?utf-8?B?WDN1Y2x2YkdOWWFGOXI0cnAwQzQ3TDhoN0lWRU4vZElyc2I1SU5kV29PZHpC?=
 =?utf-8?B?dkd6eVhGRWVrT0toMmJmL0VqdjVESUQzU3lJY0ZaUDN3dmltSURRZ3RGZmtL?=
 =?utf-8?B?aitkL3dseUtwRnRHdEgxdkpGckVqM1ZvbzhkR2NzQ2xLa1haWllxRU11WlhC?=
 =?utf-8?B?K0NDNHQ5TDdhcm1yOHNsRWtrTEYySW5lNkNBUkdjSXE0NHNtWW11K2tTeks5?=
 =?utf-8?B?cnpJeUJOTjM3a2llTHlWL3pDRFNVZTFnRDJEdngvaE5LeG5nQ014TWIzRzZ6?=
 =?utf-8?B?LzljNkRtaEJsUGxBZHBUWTB5b3hoSmJET3ZCTWhBYWUyVzBsd2VXcjJRQW1v?=
 =?utf-8?B?SGo1dndOUnZJcm9KVmFnQUVIQS9nRGFUUkxYK0I1bE5aWFJFVTBZUWpWYlBp?=
 =?utf-8?Q?Bs/tIZiG1KudWDOVUss5q0VnKV9YS88u+IDeM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHBVeWJVMU5FTk9sVlg4OGNLQThFWUFLbitsYWtTUk5mTjR2RGZ3cE1TcmRY?=
 =?utf-8?B?R2dUOWJ6K0dLaURxS01Ud2NLZUtlN2Z6WHZBbWNmanZhUWVjY2xEKzNrM3Fl?=
 =?utf-8?B?YTZkeVNFeENJam81ZWhQRmhKZCtZQ1docGc2T2hKd3E3NWpZSEh5aGl5dHYx?=
 =?utf-8?B?QU5SNlpEd3JEM2kxVzhUSjNUVnJJbDJ6dGNKbmEzUmgxMk1wNGxHTU1vSGZh?=
 =?utf-8?B?c2pZMEZVTW1lS1pWMVc0Ti9KczlvdjVobDNJUGd0MkkxMUdlRk1NZ1pUNXpu?=
 =?utf-8?B?d3RuOWM0bnRtdzkrQmFTZHJ4YTN5SHJ2THoybE90OVpvd0loMVVwbUpMVHZs?=
 =?utf-8?B?UUZucUd0MlFFSWNxRzBRSDY2aWJ5Z2w1a3U3bVB0YnhFWlN4RWtxNDRjZjJI?=
 =?utf-8?B?Zmd0SXMzY1piQlVYbm1iamxEeld3TDVLTHR5OXJ1bE1uMVFNQWdLMnZmcXg2?=
 =?utf-8?B?MUhwNCtVSDZocFZ6Yk5jQ3AzRFEzU3Z4VlU1R0U0QzRlQnc4Z09xMDh0NTBp?=
 =?utf-8?B?ZnJGSWJpcTJuWk95K2lMVmNjRjAwR1RlNk5TOFZIZHFPVzVFdGpWTWNDRUgx?=
 =?utf-8?B?b0d6eDFZL3lqNUhFYWpCRGd5aSthWjI3d1F6c2lISWhPZGZmUnE2RHNRUmN0?=
 =?utf-8?B?c3E4Q2VGdS9hWFRlOXVDaGZYKzNBOHljaWhKcGxUMkdTRXZBU09FUDFIV1Zm?=
 =?utf-8?B?Q1c4cGdEQnpqQmFxUUlrYm1ETWdLVkFGVld3dHVaTy9JNVBTVXFoRkpVekV3?=
 =?utf-8?B?d0V3bkpyS3JnVW14VTAyYWl5UUZYVEFqbVZNSjN3YytEa012M2ZYeG1ETElY?=
 =?utf-8?B?UHFSQThaUmxNajZGWjZGTmpYNWhpbUM3STJIYnZMZmUzVHJURkNwR2x6ZUls?=
 =?utf-8?B?Mkt6Q0RPM1dpcWk3V3NtZFVFelFFS1kxMWYvakJZaEFaeEVKcDRhUjBCekFV?=
 =?utf-8?B?S0x6N3MwQW9lb21aSmtyNWIwYzY0eXRZRVFKNExqL0kxeUp2dzVaM3NhQklK?=
 =?utf-8?B?cUwyUlRxQ01oRjYvN1JxSnhzeFk1VERvYzdaZXE4NXhEL2VWTWh1MnFMWHFq?=
 =?utf-8?B?c1F5MVVueW5BSGh3ZHNMQTNpOWoyakZsSmFjVk5McFhBazczNkVOdWFtNmJz?=
 =?utf-8?B?U0srNExEREFKNHAybTZRMjJDZ1J6bVVQWXNNYVljQ2psYS9SUG04SkJmREJL?=
 =?utf-8?B?K0d1MDNQU1pERVBWV2tvbmxVUDBkd2ErRFpINnJmOVNHY0ZsbkYvZlJyYVFZ?=
 =?utf-8?B?czRPM2lRTVpzdnFFZmY1TWU3ek4vQTdpVFpnV3R1LzFGelVjM3BYUSsyZFJW?=
 =?utf-8?B?dkdldFcvZnRHSldEOUhscDUxUG9SQ1NXSllCS3ZncW01ckJ0N1Y5K3VNSkps?=
 =?utf-8?B?c1hTQS9Ba2pXZ2lEa2hWOXE1YlIrU3NPcnJzUG9WM1pEYkRrcU53UnAxNjFr?=
 =?utf-8?B?c0toQThnR1pnNWhMRzVaOFhmZnZydUZrU0FkV2F4NUpLL0pTaGw4QU01KzlD?=
 =?utf-8?B?WE1hVXdmcisxUHdqRTUySlg0Wm9Fa05UamVCaDZpZXNveExzamFsZUg5bVlt?=
 =?utf-8?B?UTM3ekdCRnlrS1BkQjNVbkF6c25RRTJrekpJbXMyaW1uOXA0R2ZOM2hTbGNt?=
 =?utf-8?B?cFJscUVwejU1YXZIYzBqMzdnT0JTQjNsc3hCREtEWks0cjFGenlnUFBMaW1I?=
 =?utf-8?B?VjJiMTlTM0d4ekwvTndWU1hnb096d1p2WHV0QWdHKytjbFVhYzBHVmJGT0di?=
 =?utf-8?B?RXRrTkJUU2hzenBHd0o5OC9mTzZnU2hYNFIzaE9lKy9pYXBnZk1laEJSVU9w?=
 =?utf-8?B?b0NJenpvTnE1Z0REa2dyOVRFR0w0LzViNzZJeldodFloTGIydjY3dmE3Z2lu?=
 =?utf-8?B?cjRzSzlNeDJaYUFJQXFGaGJlTFd3WGZBSVAwRVI5NEIrNk15SlZ1cjVYUUNX?=
 =?utf-8?B?blR5U1VSNVFVZzZVeTJOVXA5a3pvSXpOYkcvcW1BNUJCTWJqZzZRQzlvS3k0?=
 =?utf-8?B?WExkU0hBWStWU29ISVFzSmlSWVVKaWgwZjFROHFzcExRejBoMXptbmlnS2x6?=
 =?utf-8?B?ZC84MFhrYlA2c0Q3UlRYZlRQZWVVdDQ2a0dmd0cxRklyRXgyZE01MWNDZjVL?=
 =?utf-8?B?Vnl5NlBwQ0NwVURnb1ZOY1c5N0hFa1l2Lzd1eWN6VUI2UVEwS1ZQK1g4b2Rh?=
 =?utf-8?Q?opWoRoWJt91HkibqzrX8/2o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d7dfb4-ebaa-4090-aaa7-08dd055c66dc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 10:00:58.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOAjmBFetGa3QvWGFBp9IAFL7LBC/kehLmSgSzR+Xxe9PsBctyOdM2u/O9zXT5C7gSV5eYtXARkjZT+7FcUHO+ML/HkDfMGasZAFMDrkQQko5P9X4zcHF/vuLHPjqFP9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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

On 15.11.2024 10:49, Su Hui wrote:
> Clang static checker(scan-build) warning：
> drivers/gpu/drm/xe/xe_hw_engine_group.c: line 134, column 2
> Argument to kfree() is a constant address (18446744073709551604), which
> is not memory allocated by malloc().
> 
> kfree() can only handle NULL pointers instead of negitave error codes.
> When hw_engine_group_alloc() failed, there is a bad kfree call for
> negitave error codes in xe_hw_engine_setup_groups().
> 
> Free 'group' when alloc_workqueue() failed in hw_engine_group_alloc(), and
> remove wrong kfree() in xe_hw_engine_setup_groups() to fix this problem.
> It's safe to remove these kfree() because drmm_add_action_or_reset()
> can free these by calling hw_engine_group_free().
> 
> Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
> Fixes: f784750c670f ("drm/xe/hw_engine_group: Introduce xe_hw_engine_group")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - remove wrong destroy_workqueue() and kfree() in v1 patch
> v1:
>  - https://lore.kernel.org/all/20241114063942.3448607-1-suhui@nfschina.com/

Looks good to me.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 32 +++++++------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 82750520a90a..3bfa002734ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -58,8 +58,10 @@ hw_engine_group_alloc(struct xe_device *xe)
>  		return ERR_PTR(-ENOMEM);
>  
>  	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
> -	if (!group->resume_wq)
> +	if (!group->resume_wq) {
> +		kfree(group);
>  		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	init_rwsem(&group->mode_sem);
>  	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
> @@ -84,25 +86,18 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	enum xe_hw_engine_id id;
>  	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
>  
>  	group_rcs_ccs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_rcs_ccs)) {
> -		err = PTR_ERR(group_rcs_ccs);
> -		goto err_group_rcs_ccs;
> -	}
> +	if (IS_ERR(group_rcs_ccs))
> +		return PTR_ERR(group_rcs_ccs);
>  
>  	group_bcs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_bcs)) {
> -		err = PTR_ERR(group_bcs);
> -		goto err_group_bcs;
> -	}
> +	if (IS_ERR(group_bcs))
> +		return PTR_ERR(group_bcs);
>  
>  	group_vcs_vecs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_vcs_vecs)) {
> -		err = PTR_ERR(group_vcs_vecs);
> -		goto err_group_vcs_vecs;
> -	}
> +	if (IS_ERR(group_vcs_vecs))
> +		return PTR_ERR(group_vcs_vecs);
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		switch (hwe->class) {
> @@ -125,15 +120,6 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	}
>  
>  	return 0;
> -
> -err_group_vcs_vecs:
> -	kfree(group_vcs_vecs);
> -err_group_bcs:
> -	kfree(group_bcs);
> -err_group_rcs_ccs:
> -	kfree(group_rcs_ccs);
> -
> -	return err;
>  }
>  
>  /**
> -- 
> 2.30.2
> 
