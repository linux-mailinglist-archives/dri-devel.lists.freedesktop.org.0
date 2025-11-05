Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA0C355BB
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 12:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA48110E02B;
	Wed,  5 Nov 2025 11:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s91iYrsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012000.outbound.protection.outlook.com
 [40.93.195.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF73110E02B;
 Wed,  5 Nov 2025 11:28:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb6cRzpMqJAPBoL1ddvuVxSOnMPkVYbAG08r4pbbFoY+96eNA7rJQo2YvZyA4hf7Z4e77iLzhpmqi+oWVupCjRWqpL9TRxVOh3YY0cUIRfLRx+Z6k0kqS3dYd4NEmszHIRSXjQrPQ2lCXNdA6kYxCFb7PyKdacm/Z7KGG3QNQzzb+wpEKOncQ8+nyoJHlUKh70ilfPAmc0WnMHQmdh/jmfg/Q9vkRNsD7slhRoUUecqlLs/tHmH+add+LbrRMEBwrZqU7s5/zFiFbCEBH3FbOlfysAubEoIB2erW4ptEC3GQDweHyQExGf5neqG+IkPEo5diGkzJC7nUzCuECwKwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/DH1MlCeXqADQGTCJ4b9P1ATo04J8JI1iUEBfhjFmg=;
 b=BD5WCrq48uAmX+zUrSNTsHUWCQHb9oynCo6/O2noh6Oon+uh2M3DPvHuIX/BfKqzbw+3d3RUWMsl7dYUewASmxoh58GOdzAB80BPnUGZuj9Crx9wQxJg4qRdWgxRRCfOlPI/jGIsBNhp6/C851n/uiy8wq8BQpPaFz0uvPFUMtR6947+BDZBjWBtAgsuHyIa7YNJB5X1IlI76S8O4eWZxpqoUa0jytvCAW6xhBtPNWixcx9nmPIky4N07G89CNTB65koVVlJkEFYr93KYbva+TcjPN0M5T5dhkFm4jJMaegFj7doNaHA+WHXCqQ9z74KLZoqmcftUAtPnoStXpkdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/DH1MlCeXqADQGTCJ4b9P1ATo04J8JI1iUEBfhjFmg=;
 b=s91iYrsSvwjgqm3mcQcBOsu1nPH1/wE3JUQ9U7U7hpU998V77HKhx4V/eb6VIJ/QUJ29WgC4XNlj1hrGtjuur1N4NwQlYNww4HXoglTNSG+4jhwT86YMuYnSzHXM3QCRww2qRGR7uaSO6iXp0OCoBGk20tKRlyT8N/pkq1W4ZzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB7768.namprd12.prod.outlook.com (2603:10b6:8:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 11:28:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 11:28:47 +0000
Message-ID: <fe9bb350-6dc5-4911-ad32-a95911251167@amd.com>
Date: Wed, 5 Nov 2025 16:58:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Sanket Goswami <Sanket.Goswami@amd.com>
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
 <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
 <13fd3b12-03a0-457f-a5da-fe018b032211@amd.com>
 <CAGwozwGLfcYdpetwTk=QH+k29u8SdroFxfkxb-KbAXh36sr1XQ@mail.gmail.com>
 <100c2f25-d1f4-5b82-4a76-a08394ece471@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <100c2f25-d1f4-5b82-4a76-a08394ece471@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 808c154d-141f-40f4-df84-08de1c5e7c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d21UeXUrMjQ5RjU3S3FvRFdLTi9DVlMyanc2UEU2UGF4TFJqdmFoQnY0Y2ZH?=
 =?utf-8?B?c3FwanZnZlRETFB1ZGpJVk95L2xMTGplMXRpSVRpcEhIS0k5SWtLbWRFczZV?=
 =?utf-8?B?NW9mbjc0WkdsT1RuTUNteHAzYk91U2lETWxvMC9ibXJJSnAxdzFUcTRQZExx?=
 =?utf-8?B?dDJMWk9DTHg0Ri9KbWw4MlcvNjNEZDlKVkp0RUV4SG0rL3JLdS91M2ViNGM2?=
 =?utf-8?B?YTlCTm8rL3hVbmNwcTR3bWZ6NS9GcGRpdG9ucjIwVlRYcTFreXZCQmI5S0pM?=
 =?utf-8?B?WHRZeVptVE9GM0hBMzRUZXArVGQwVW4wUmVVbzJjZUs2TGg3NnZUN1VQTDYr?=
 =?utf-8?B?SXVLRjVtSjRXRk01STJURFBodHNDakN1cWJDdXFUaUpMQkZvMmFFWHV3NmNR?=
 =?utf-8?B?bEs4QUZ1VmFCbUtjaWo1OC9qaS9FU1Y0K2l0bzlneWlGNFdINlRweDRtRnI1?=
 =?utf-8?B?bVlsc0cvWVBOdzRoa1hkMEQ4Y0wrRzg1UVNSVWdsZ3AvUXVvTTRVSmVaTlJw?=
 =?utf-8?B?QmgvRVFoNWtTSzhUajI2ak9FT0JEUXVVMzNQcUhoVGpLMk0xR0JJUVhwVitH?=
 =?utf-8?B?aGl5TE5WSVVoS1ZDS1Y4bkVJcUt6d0l2T0c5TTA0em5YNzNyR0JHZWxkR0c0?=
 =?utf-8?B?a3ZhZFFBYjNQaHVrMHpzTTg1SnBjUXpFTHkxbzZtQXRKS09qTDlrRkJLajBa?=
 =?utf-8?B?QTNZanpRZEtYZVQ2cHFsajRsR2d2TXlOdmRPejJ1Rkxyb1VnaEJ6ZnkxVVl4?=
 =?utf-8?B?dXcrQXRXUFEzVkFGa1ZCanRZaEY4Ky9oOVN0ZGRPR0hWRHR0VWMreUd1c0pE?=
 =?utf-8?B?dG10dHZVS1dMb0ZKbUI2R1AxeDljY3VEdE1scFg3dkltK0poZmU5aFdzMHdi?=
 =?utf-8?B?NW4yYzUzclVXZldJUXBOWVcxWnpZRFRJM0hjVTQyYzQ4dVhaVjh3cFVuMVU0?=
 =?utf-8?B?bnJUSDRCZU11WnF0L1VBSXFFTUJqWEYwTDUyd0xFRnFEUEUwekFpbmx3NVAx?=
 =?utf-8?B?UkxIcHdlTEl2VnJaUHJTNTVmb2VXSmpNNlZhVFNJY2gyamZSWEIyd095b2I1?=
 =?utf-8?B?U0VaV2g4Z096Ni9ZUEw3WEpVL2tHOXo4ai9tdlkzbGhaOHgxWHNSUlk5Q1lz?=
 =?utf-8?B?cU5tSnlKVVIrT2RucUFBdEk3YzdSUlRtN1g3aTdrK2w5bWVLRzQ0RWxBcjlD?=
 =?utf-8?B?R2RkTUQwV3hQT1FFWlVIcHJ6eHRHTmkxaTZheGxXcEQ5cXg5Qm05VDU0NGxQ?=
 =?utf-8?B?d1A0M0l5TmF2THBsTVIvdTNRNkpPQjhpSGw2YWxpRHpqTTJGT09Iam12emh0?=
 =?utf-8?B?WEVDWmtmMCs5NkZHSVdIQnhHUjhlcEhoNlJCMEZIRnhqT1J2WmJ0cmdDR1Rn?=
 =?utf-8?B?TGVYSzFBK0xqTkk3Y3M0ZHZTWDR5ZDh5SUxrNzdTNGkrMlN0cnBXMGNOZHl3?=
 =?utf-8?B?amZpS3pZbS8rendoNDNCQmRCZkVpUmhocXVDTVc0WFJQZml4TXh5VWRSYk9k?=
 =?utf-8?B?MGpDQmhkK3FZd0ZaVm5xdCtqazdQUWUvbWxUMnhYaE9zRkhGS1FkOUhsY0sx?=
 =?utf-8?B?bzZhd1phUDFYMFQzOEtXWkdDdXY2VjQybVE3WFpVQk5MWnhaNTZQcGN4cjJH?=
 =?utf-8?B?eW92SmQxb0hyU1pxbURnb3hYOXUrdlorYms5cm4yZWdBZnVkTUNXU2o4WFhQ?=
 =?utf-8?B?bEdFczRtMCtmbzJOUEpXTEROTzl0SC84OCs0SG94R09mL1grVTVXQkE0NXdm?=
 =?utf-8?B?ZTJsVWZBNkZDUUcvcFAyQTVEb0Jmdk0vSTFmbTR6Sm5lUkFEUHVuS0ZqR0Ru?=
 =?utf-8?B?OU1jV0x0SG5YM0xDZlJHaW9YSTlralRnQ29lbnpib251KzlRUjR2bU5Na2dx?=
 =?utf-8?B?UDZmdEcwaXdhbmw4RmtwY2pBRjkyVnR0SE1lNTNZN0JOc2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjJrTVVTS25HZkxSbXZSTjlycTNkUkJMRkV3Y1B0Z0JIa2dkemtiUjlWblpv?=
 =?utf-8?B?SjE1Zk5sOU1kUEZVZUNIOUliaUFham9ndEV6akkrdTV3SjJkUlY5d0VIa09y?=
 =?utf-8?B?VWdpNTlWVlVjc2ppKytTLzBDcC9NcjBzbFRhdWI0ZVNTOGN3V05VaW5JcjJF?=
 =?utf-8?B?Yit6UFlNNHZMK0p6VkRub0dNMzliaHN3UGZHY2ZaT2o1Nkx5eWlyNGw0T2N0?=
 =?utf-8?B?ZzVMM1VZcGd6MzIyOUZaMWRBcHZLTWI1ZFhGNm4wZWFRSWZXTGR5Q3FOZHBK?=
 =?utf-8?B?QXR3RXBGSXB1Qys2SXd4eE5TdWYvcVQxdDJKeHlER3ZvTXBCeUFGOE0vODBv?=
 =?utf-8?B?YVN1aVJFMHRRNFdNS0xtTGdKVCtTTnVFelIwNUhRWEYwMGVGeFZFWFVnR05n?=
 =?utf-8?B?aksrQzR6Ni8xcXpNbVRRMHRQNDhOTFB2L01SQjMzb1pIL1BkV0F1RVR1NUVJ?=
 =?utf-8?B?NjVXMkFmeGErLzg4WTZ0U2VJRi9Td0xIQ2xkTFJpOUVvSHRpNzN6MDN4L2R0?=
 =?utf-8?B?RGhwaWdUVDVIbVVQMlVhWUw0WHNpNEh2eFhmdDY5NkhGMGVEQ0VVZTQyZjli?=
 =?utf-8?B?RVg1UTFWR2N5WlhHcXFHSGc0Q1F1VmxCQXN1SFJZRVlOZ0huMThldHFtejdI?=
 =?utf-8?B?cXV0OXJRY0dPd3B4SHM4MHpacno5bEw1S1hnZThIK2hvMm54b2JLQ25HbHVv?=
 =?utf-8?B?THBLZWlWQzVBRU9KWkpVSTVHM1A3UC9JeGlaZ2ZiQU5mWmhUeEt5QlpMS2RO?=
 =?utf-8?B?NlpXTmpXT0c0QWU1MU9wWUFLMWFqbmF2SmhLTm8wVkRsMU9iQk4rM0ovMTEy?=
 =?utf-8?B?djgyNk9hQ2VvT3cxOXZlQTJCSzlrQnB6dW1iVEU2OXR6NlNXWk50dzRBRkw5?=
 =?utf-8?B?KzB3ZlNjNG5lMTdiMFcxd1c4MFU4Tk9NOUdBS3FiSmtUOTd0ejdTVXBSYk1p?=
 =?utf-8?B?Q3NRMWttdk01NUNzbTBPWENWWENvbGN5OWc2aHU3MzI4WlhIQkRSazdVa1ha?=
 =?utf-8?B?QTVBL2xUdGVwdDdtTmQwaVE3Smk5NGVKSWt0NDI0eXhucDdtWGtGZ0dsRnhw?=
 =?utf-8?B?RXoxMU9EdzQ3eWMvOEpGRFVzQmZVYkFRQUJSd0J4dnVYc2x6dVg2YTdyQTJH?=
 =?utf-8?B?aXFFYXFJaVA0bGZreUpJTnZwL0FMV3lxSHAwUGhEY3lQN2NWL0k1aVM1cCsr?=
 =?utf-8?B?c3J6amQyRmhaZkhLaVVnSkFXYUVSd0JjcjZMYWFCQ3VHUEgwUE9zVlIyb1RV?=
 =?utf-8?B?Y1gxQlUrcEdPWk1DMmxtbkwwektTZ3ZOOVlyZC8va3VMQXVGRVJOeU1EN3dZ?=
 =?utf-8?B?YzUzMzBudXdQQklUSlg3T2hWQ28vNzB6Zng3cU1tek9ScngwRE9TeUlmKzVv?=
 =?utf-8?B?R2VoSmtDZlRoLzJGSExLNjliYmhFQlBqMG1IWUlzdnBQMUkrclpTeXRCQm1X?=
 =?utf-8?B?b0xnZWxjeHJjZzhrODJBbEkveEIxUWlZNEhuOWhqWVE4WUt0SElUaThYMlVL?=
 =?utf-8?B?enpvM2dkblpVYktQdmdWNXJDZFVUeWIyY3JDSVkwZjJyU1VtNEJhUzV3WnY0?=
 =?utf-8?B?YmFOcDNyMkdFWkRhYk1KZjNHSVQ0c0Y4N041OWlvK1FnLzhuRWZ5QUx4WE05?=
 =?utf-8?B?ZFQ3c1VML3gvbWtSRlkvUjU2UUdsLzVRS0FrZkpOMEhmMStEb2c5d0E4ZGdN?=
 =?utf-8?B?ZzgwNXBOM0NPV0RxZ29xcmd2NHdJcUgvQzR0cUhuc2lTUEw3TEoraWVsZkJ2?=
 =?utf-8?B?ODVwejl3UEZoTlBVcTVkQ2RVcmpiRk1YNWNxTkJzR1d3R3Y1MkFZVjZJWC8v?=
 =?utf-8?B?QXVpMS9UelE1QWdaS3hCSkxFR0ROajBiSmZ2QXZWZm9ldzJqaE9NVi84Q1pY?=
 =?utf-8?B?eSt4MlBDendvY1FuOVZnbWYyZFluRzJMSk1vcmNjRCtoZmhJME1ZWGRlY0d4?=
 =?utf-8?B?K0laUGMrM04vbm55ZFlrSkMwbG9FeElVbnd0ZUVobmFVMWNRNUk4N2JXdkMx?=
 =?utf-8?B?aTlweDBjM29SQU9IWXorYnZLdmhrVkY0c2t2NlQyWmZhZlhvaEc0TTJsdGIw?=
 =?utf-8?B?OVF6NVBiYno2VnFwdjgxNE9hR25nN0M2L1cxdkJ0R010MWI1ZkQ4S2ZmajBz?=
 =?utf-8?Q?YD71IG+0p/URFkeqcO9ogJA5C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808c154d-141f-40f4-df84-08de1c5e7c06
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 11:28:46.8530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuLYc3GfxNAgTDWbhDuygi0Ly8B7Myxxy+2H8tmRjXPnYa9bgXPkNWeKkjvQZuc0DP5JGCvn3/oTmkNaPjZRsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7768
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

Hi Ilpo,

On 11/5/2025 16:43, Ilpo Järvinen wrote:
> On Mon, 27 Oct 2025, Antheas Kapenekakis wrote:
> 
>> On Mon, 27 Oct 2025 at 09:36, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wrote:
>>>
>>>
>>>
>>> On 10/27/2025 13:52, Shyam Sundar S K wrote:
>>>>
>>>>
>>>> On 10/24/2025 22:02, Mario Limonciello wrote:
>>>>>
>>>>>
>>>>> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
>>>>>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>>>>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
>>>>>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
>>>>>>>> this support was dropped by the Xbox Ally which only S0ix suspend.
>>>>>>>>
>>>>>>>> Since the handler is missing here, this causes the device to not
>>>>>>>> suspend
>>>>>>>> and the AMD GPU driver to crash while trying to resume afterwards
>>>>>>>> due to
>>>>>>>> a power hang.
>>>>>>>>
>>>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>>>> ---
>>>>>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>>>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
>>>>>>>>    2 files changed, 4 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
>>>>>>>> platform/x86/amd/pmc/pmc.c
>>>>>>>> index bd318fd02ccf..cae3fcafd4d7 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
>>>>>>>> amd_pmc_dev *dev)
>>>>>>>>        switch (dev->cpu_id) {
>>>>>>>>        case AMD_CPU_ID_PCO:
>>>>>>>>        case AMD_CPU_ID_RN:
>>>>>>>> +     case AMD_CPU_ID_VG:
>>>>>>>>        case AMD_CPU_ID_YC:
>>>>>>>>        case AMD_CPU_ID_CB:
>>>>>>>>                dev->num_ips = 12;
>>>>>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
>>>>>>>> amd_pmc_dev *dev)
>>>>>>>>        case AMD_CPU_ID_PCO:
>>>>>>>>                return MSG_OS_HINT_PCO;
>>>>>>>>        case AMD_CPU_ID_RN:
>>>>>>>> +     case AMD_CPU_ID_VG:
>>>>>>>>        case AMD_CPU_ID_YC:
>>>>>>>>        case AMD_CPU_ID_CB:
>>>>>>>>        case AMD_CPU_ID_PS:
>>>>>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
>>>>>>>> pmc_pci_ids[] = {
>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>>>>>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>>>>>>>>        { }
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
>>>>>>>> platform/x86/amd/pmc/pmc.h
>>>>>>>> index 62f3e51020fd..fe3f53eb5955 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>>>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>>>>>    #define AMD_CPU_ID_RN                       0x1630
>>>>>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
>>>>>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
>>>>>>>> +#define AMD_CPU_ID_VG                        0x1645
>>>>>>>
>>>>>>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
>>>>>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
>>>>>>> though,
>>>>>>> it shouldn't use the same define as 0x1a platforms.
>>>>>>
>>>>>> It does not work. Reports 0. I also tested the other ones, but the
>>>>>> 0x1a was the same as you said. All report 0x0.
>>>>>
>>>>> It's possible the platform doesn't report an idle mask.
>>>>>
>>>>> 0xF14 is where I would have expected it to report.
>>>>>
>>>>> Shyam - can you look into this to see if it's in a different place
>>>>> than 0xF14 for Van Gogh?
>>>>
>>>> Van Gogh is before Cezzane? I am bit surprised that pmc is getting
>>>> loaded there.
>>>>
>>>> Antheas - what is the output of
>>>>
>>>> #lspci -s 00:00.0
>>>
>>> OK. I get it from the diff.
>>>
>>> +#define AMD_CPU_ID_VG                        0x1645
>>>
>>> S0 its 0x1645 that indicates SoC is 17h family and 90h model.
>>>
>>> What is the PMFW version running on your system?
>>> amd_pmc_get_smu_version() tells you that information.
>>
>> cat /sys/devices/platform/AMDI0005:00/smu_fw_version
>> 63.18.0
>> cat /sys/devices/platform/AMDI0005:00/smu_program
>> 7
>>
>>> Can you see if you put the scratch information same as Cezzane and if
>>> that works? i.e.
>>>
>>> AMD_PMC_SCRATCH_REG_CZN(0x94) instead of AMD_PMC_SCRATCH_REG_1AH(0xF14)
>>
>> I tried all idle masks and they return 0
> 
> Hi Shyam & Antheas,
> 
> This discussion seems to have died down without clear indication what's 
> the best course of action here. Should I still wait?
> 
> There's no particular hurry from my side but it seems Mario gave his 
> Reviewed-by already and there hasn't been any follow-ups between you two, 
> I'm left a bit unsure how to interpret that.
> 

The thought process to was understand how do we debug the rest 5%
failures when we do no not have idlemask concept, which got introduced
after sometime. But both the patches should work independently, so I
am ok with both patch 1/3 and 2/3.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>


> 
> In addition, is the patch 3/3 entire independent from these two PMC ones?
> (If yes, I don't know why they were submitted as a series as that just 
> manages to add a little bit of uncertainty when combined into a series.)

I see a note from Mario on the cover letter that the patch 3/3 can be
dropped from this series and a newer approach is being planned.

So, 1/3 and 2/3 of this series can be taken.

Thanks,
Shyam
> 
> Thanks in advance,
> 
> --
>  i.
> 
>> Antheas
>>
>>> Thanks,
>>> Shyam
>>>
>>>
>>>>
>>>> 0xF14 index is meant for 1Ah (i.e. Strix and above)
>>>>
>>>>>
>>>>>>
>>>>>> Any idea why the OS hint only works 90% of the time?
>>>>
>>>> What is the output of amd_pmc_dump_registers() when 10% of the time
>>>> when the OS_HINT is not working?
>>>>
>>>> What I can surmise is, though pmc driver is sending the hint PMFW is
>>>> not taking any action (since the support in FW is missing)
>>>>
>>>>>
>>>>> If we get the idle mask reporting working we would have a better idea
>>>>> if that is what is reported wrong.
>>>>>
>>>>
>>>> IIRC, The concept of idlemask came only after cezzane that too after a
>>>> certain PMFW version. So I am not sure if idlemask actually exists.
>>>>
>>>>
>>>>> If I was to guess though; maybe GFX is still active.
>>>>>
>>>>> Depending upon what's going wrong smu_fw_info might have some more
>>>>> information too.
>>>>
>>>> That's a good point to try it out.
>>>>
>>>> Thanks,
>>>> Shyam
>>>>
>>>
>>>
>>
>>
> 

