Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E1XNQlAlGlhBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:16:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748C14AC16
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6798F10E1AC;
	Tue, 17 Feb 2026 10:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OGAhQO1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013010.outbound.protection.outlook.com
 [40.93.196.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D77410E1A9;
 Tue, 17 Feb 2026 10:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec8YdMmZqWcx8k87AF3GLA/am3ww74YLE2e3/13eeWdQJw2vnNjlLwo9CwyMSDziwqxbCGvhmVGwfC0tdgAC/3lUwfUfN+gPnBajsQhQrID5sfKiJOreHJXVw1rg3ikM/XecXpgn/s1nQjmL2bDleVn4vj9fTGB53vPBs9p9E3Bki70WAu6k6DiTkEeDhjHuvjcJHD8xY/wS7VMhu7TYkwpf5XuGkV0FfpC/BBOU+8V8O112vICRtQKlkNsfeO7u+FsbFUi70m2SzUPjzuKpkYvIaejQSSVBidUXFKkgjGjbLLZ3Ez+5xir2zNltkq1B+8ZU4sctLqhSVprnXwN6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1X9ZBLnsWYNKF8elF8e5Fy8oYgeDJ8Wssqto4psahU=;
 b=dojYEhy3yXB6SjDZno4SFyYsQRr/v49UvOE48J6PHlJWmvc6FWNIQUkPnTRIQ6zWQB9H0bKs0TWqJbA5Bg8N/S7EQkDNQrhtrPw2PcoI+WNxI7z8LzrDddpa+U/JkhRRsCyTLPwGi9GZjC8bxVEIZjdqHR0mtGRHTaIlHR20C8T69tV7yqXLJrDH5/3UZDT0RGq8K77zF/ob97LXIUTOSDFdfF+rEZ4mr1kUfRe127iNyb13KqVFS04nVLxPOUcaVtdgj8YxFKSzo69BfeI1pZ2fz+1EC/5MAPSNdPImI1S7YP2FOGqZkft9fFMwGDjHCiBoByORFBy7LnP1oBrNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1X9ZBLnsWYNKF8elF8e5Fy8oYgeDJ8Wssqto4psahU=;
 b=OGAhQO1X1SFy9Lsum7rUTZ4e2IwigP522PRDrERg7OOqGqLvX/If/YUFGDLPPfZ9/yMnM+8i+u9fF35n5ylaoI62FivWiwQI05UF5VAu2xGNH7dvbCfcheUkQP9BzHxhSOLWIAHNA64IPYrf2m70l3jAkS2JV9yfDA2QrLlDucM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CYXPR12MB9441.namprd12.prod.outlook.com (2603:10b6:930:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 10:16:34 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 10:16:34 +0000
Message-ID: <7060e2d5-b99e-4dbb-8d8a-f2b6a80df922@amd.com>
Date: Tue, 17 Feb 2026 15:46:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Improve offset-aligned allocation
 handling
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
 <ce9833ef-8cfa-4b1a-b4d5-eda0158cb19d@intel.com>
 <08987287-ce6a-452f-a1aa-080562afe7bd@amd.com>
 <1c753753-ced2-41c9-bad1-c9a172003d2f@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <1c753753-ced2-41c9-bad1-c9a172003d2f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CYXPR12MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcafaeb-4dda-45a9-54f3-08de6e0da08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|19052099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ti8yV2RaalV6OWprdlV4UXhUOTRHQmVLOWZkcnJCR0JTSE9UeCt6cStFSzcr?=
 =?utf-8?B?NWVkSTVHZU9wSXdKM3BPelNUSitNTUFZR0d4eWh1dWtGaE1abnhQcURnZHk2?=
 =?utf-8?B?Q1hoUjlrNmw3blhJT3dvcDVhNFB2QlVSQlVUQ1BrWnZMcWh1TXRsU2RNNG03?=
 =?utf-8?B?UHN6UDlOVjhUSkRJQ3JnS3lJWEo5bENXMFU2QVpZUUc3SC9jNXFZY3NRVHh1?=
 =?utf-8?B?WG1lK3BJcDRqaTRXZUZTWTIxbzRGSTRkdzBQejlUSW55dXlVRno2Zk9ZT3Uy?=
 =?utf-8?B?d296cFgrM2JiMDl2QXVIWHZienRSaW1MMkIzNzRHRk4vc1NmVHFwNFlUNlNS?=
 =?utf-8?B?NzdjOW5tYW5adzk5aTJmcThZNUlNVGRJOVhaNVJSdm9pZEdtM2xBWWFTcGRa?=
 =?utf-8?B?c3E3V0R4MWZuVk40Z0pldTFqMTZGN0hOOUM2YnJKVWFlVzExZkZPR2RiRkxL?=
 =?utf-8?B?OGRKY0ZQZEo4emhHdEUzY0hpMEhIa1FGS2VtLzlUU3ZVMnBnMmsySEFyM01V?=
 =?utf-8?B?c2M1QmhnKzY1SXVhREc3VjIxWnhYZUZKQTNjSWQybVJWM2VEQkcyb1dlV1di?=
 =?utf-8?B?aGE5S01ORUUvMGZKSWZwNCtjRUlLMk5vQlZYUjJRcUtOREJHZHQ1VWlBUWRl?=
 =?utf-8?B?aU1iUXVFeGplaExMR3k4TDNyd1VBUmxwM0RoWWpHQmdBVURBK3V0dHlHSTJO?=
 =?utf-8?B?N3Qrc3BIMUdzbEI5Vml2cm4vNGhHNTY4V2d6VDdFYmFYZW9pbkJpclJxU3JR?=
 =?utf-8?B?cFNMdkZPRlFnY0JidGdnT1ZBWWdkRkJsQUZnU0J3OEExVFBrdGdpV0VpZFdR?=
 =?utf-8?B?NzYzVm94REZvVm1WNDBreUgrQ0tKVTh4RE1hQ295TnBVRUVGZ0dqOG5GZHZC?=
 =?utf-8?B?SVFmSlIrSDdxY0k0cjRvdzMxVlpvWUhIUmQwK0JiRXozeWZkUmVhaGY5N200?=
 =?utf-8?B?Z3ZrYmIxWFBCN0c4dHJEaXgwdkFsMjZpbEIwcVMzZGZiTU0rYVRPc1lOWjQ4?=
 =?utf-8?B?L2xsUGpaazdwdStDM0ZoQy95WlZUWlZ2UE9VR0RTRlYwbUttYisvelBybXI2?=
 =?utf-8?B?Njh5MG52alNNbktmK3MxUXY2UjZrYTh3ZWZYRitRc0JHQzJPV3pLL0tENFNR?=
 =?utf-8?B?c1NxYkM2c25aOVFOT0JKMWxSeWJ3NitkZTYwWVpZa3V3KzB0QmhINUZLRFh4?=
 =?utf-8?B?TEZDUGpoUnk3QUxFK0ZSTFg3WlA2czdHN29TYnc4YWM5T2oyb2dkcXZQTXM4?=
 =?utf-8?B?em1sbzdOd0dRVWpJVDVrMFEwU0c5MWVucDlOTFY2aGpLY1AyUUtvRkdYSGZZ?=
 =?utf-8?B?a2lyZzRaM25Ia1VXdTBOaHNKRmRpeXVjanV1NTBTaDF2azg2OERPV0l2cjZx?=
 =?utf-8?B?dDhIV0pMZGRPcjFvTWJLWXZTN2crOVlZaklzeTc1bWpaZDh4UEhuUjk3UjZ0?=
 =?utf-8?B?NDcyMDE2MW5VcTgxZTNqOTlOdit6SGNzNmpObkFsZE9SZjl1K1JTTmErUTNY?=
 =?utf-8?B?Z25OWS9WNWZYYnpDY3JuMHIzbEtDVy92dVVMOGs5cHE4VGZGeHRrMzl3YnFm?=
 =?utf-8?B?MmlYNDBMaFNMS241R3QrV0w5Skp0a29oVHIxaEJrZm1kaXlWMnZpaDcxRE5x?=
 =?utf-8?B?SjN0ZUgvMjg3MFFtKzVJb0FEOGVTNGFRenBPa01CU1VzN0NNaXlXUjdrR25o?=
 =?utf-8?B?R0tDc2dvS2JmRmRnVWphM1pBRkFDd1dBUEIrVWEwMDhXenM2RjJ1R1BoaC9m?=
 =?utf-8?B?VzlnMk1YVWM4ditGbXlNUE8vTXRBRlFQemw4dVJ5L2JTKzdxbjVHVE93OFNj?=
 =?utf-8?B?WVVLT2tlcTlsNVFHaGQ3NDF1d1NhQTVBMkxsd1VPTjFSREhhUHRLdnVHbkk1?=
 =?utf-8?B?emFCY2c1dnE3cWxtQThPYTc3SWxRS1FQcGhTWkdaNi9mNVNhY1ZrRSszcEs0?=
 =?utf-8?B?dlFPSGRCaG9YUTI0YXdTVVpSTEJxcFhMT0cxb1ZiRW1qY0haN1p4b09mVFBJ?=
 =?utf-8?B?NER6MTF1MVNKV0JGaEY2blN2ZHRwRWk2enAya1JjRWsrOFZ1OVBUdXhDOTMr?=
 =?utf-8?B?R2NJRHV6VUtWRlhKMER1VktMZDhlSlJVUnR5NDcrcEE5S1Nld2pBaVJHN0Fl?=
 =?utf-8?Q?wWJE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(19052099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWN3WThXOE0yc1FmZTc4YXhMRHNUblNUT3pjWldKckJEYkZhakdzRjVTU1py?=
 =?utf-8?B?VjdRUTI3NnlweWQvSEpQQW1JZGhJM2NCYXQxQVlTajN4Nk1UcDd2SkZIZVdV?=
 =?utf-8?B?cXhkK2l2NUI3cFlwMzlzT0FFamVKbXpLdjVBKzdRZDY1ZDl4aDFlOGhnTXVW?=
 =?utf-8?B?VlJYaDBHclQwVW9oL0Z1VmZCOG1uZDNuSnlGejdNUUJ0cWRCb2NiWllzWE9J?=
 =?utf-8?B?VzRPdUYyNVBCbGFIMHBLeWVCYnNMaFdhTjF1LzNGSzlIRVhpL29NemFXbVp6?=
 =?utf-8?B?SUtOZ0RHZHRJbzU5ekE0V01EcE5HZll6NnZpaGxVLy84OFpPM2JWVzZSRDNw?=
 =?utf-8?B?bnMxcExvRjNYNjZUS01ZdUh2RWthd0dERStzQVZRMHp0dU1rQ3hMWERpSXlq?=
 =?utf-8?B?MC8yTWhiemw3YWx5blBqbXZYYm1jTVNCejYwSHpReXhEckhQOVVoNTlyTWVq?=
 =?utf-8?B?U3Q2QlhEWVJQUFVrMVRyM1Y0RVE0bC9kTnA5bDdLbnZYUXVXakptbnpHalE3?=
 =?utf-8?B?b3NEVlIwRXhhd01KNXlRTEFrRy9NNEFvWjhwMGFiMExaYkNsd1JxMkFXVEpG?=
 =?utf-8?B?QUIwWWtDbEFaa1pHY3kvc0JLNGhaQ2t5RkMyRVR1TXBsRHhva0w5Q2lOSXFl?=
 =?utf-8?B?aWdWRGc0N0xybFJ1T3ZEQU5Ib0VVY3ZSNjY2M0p1THFDZzh5SUhDTjlzVzBT?=
 =?utf-8?B?cXRFY0ZPbDQ3ei9tQUVjMVRCNkRVZ0p6YXhWWVpabVM5YlZvYUFtcVRlNlFZ?=
 =?utf-8?B?eG1pdy9JMkVkYTRWN3NnVEJiS0EzNGVUK0h3UTVLS3VuMzJRYk4vekg3ZEgr?=
 =?utf-8?B?Z2dQbUN2SmFrRi9XYjRuQlNlYVdaV3hXS2R2ODNldkU4QWY3ZzRmaERBRGxJ?=
 =?utf-8?B?NUtZOXluK2pQZXZYREpqTXE4cTg5NWpFN1QzZjlTaEg3OFdIRVJ2M1pMQ3Zq?=
 =?utf-8?B?K2hxbWd2VVQxNEU2bjNYYVA5MVNlbzdCM1UwMmg2UjRPMTgvWkg3cjV0YitE?=
 =?utf-8?B?anRBd0QvNG5KejdtOGtOU1YzUVNjb0txcDFSS2NIUE5IVHJDMmhacFNQN3Vl?=
 =?utf-8?B?R1Y2OXhtaWxTNkJGdnNFY0wyQitBbmxlUlJFc3orcHpTT3FBN0dCU0dyUWZq?=
 =?utf-8?B?WFdVSGp4QmdHSjdXSy95d1JPRURwVThJdk8yV3JTWUp6Mlg5UURZUjNSU0Yy?=
 =?utf-8?B?WlFNUkZ5WTMwTFljOGlsRklaQnpzVEhHMncvSGxZS2V4cTZoOFhyNnJjbVg3?=
 =?utf-8?B?eGpMaUxVZ3BzcXNTZElPM2ZubTloZE9ZNnQzY211QXVMM3MvQmZwaTVBc3JU?=
 =?utf-8?B?WDJldEJvMXVaVVkwYWtFNlRTUWdoeUw3Y0w5SU5ISDFnZXFrVTlkWk9UOXV1?=
 =?utf-8?B?blpSa1pRM2QvajRtUHpZN2cwdFlTRTZoL3E2aktqM0tBM2JKUk1jZExVWDh2?=
 =?utf-8?B?M1V5MFhMYWpPYkVXM1dBUG9wR1lCSkh1ZDJLRTV1Sy84TjlXOE9iWDY2UlhW?=
 =?utf-8?B?cUZjNmQvcGJrbVFpWHVDWjF3RzhIWGRrYWMxV29CUE1QdkgrSDlPdmczTSs4?=
 =?utf-8?B?UExkZEROUVhhRlp4d0xGc2hJRVhIYnJPL1ZpakY2VTJvMFRYdzJodk5pQ2xs?=
 =?utf-8?B?R0tMSWtxRzkwZEIxOTZaMjN4dldOY0FVY25CUDFmTVc2emZ1YTRiZzRpakRi?=
 =?utf-8?B?ZDlQdThPR2NkRTl0dE4rTVNwRDBZeE1UNmorVXVxVlZIRVd2ZVU0V3RyMU1H?=
 =?utf-8?B?TlNhVStHTE90RGNReGFKVlM2ekttbHQ5d2kwa2RhdXo2UDZ6QVh6VnZwT1px?=
 =?utf-8?B?Qm91V3h1M0l0N1M4VjVnakFuTXNFVGhRZzNjMW00bDVuOFVyMWJMMGpLcHJs?=
 =?utf-8?B?TjlUQ0J0cU5aL0IxYitYTHZ5R1VuUktNL2FKVUVJWkE0TFZ4UEsrbm1pekkr?=
 =?utf-8?B?UWdjOE8vYUZoZzRDcWVrQmh0NkRRam1FZUpkbGx0RVhTYXJSbkkrN0ZBUHNj?=
 =?utf-8?B?dHc2eGVjcEM1NmxQZmdheVg3NTlVY2NlTEE3THRJbXdMQmpUOHh0TnNDKzl6?=
 =?utf-8?B?M0dCcE5rQWgvYzBYeldMMVhlM3JrZjBkRTBtcENTWlVCdmVCSS9jYVBwdmhk?=
 =?utf-8?B?cXR2eXFGbkw2b3JncmdBM1dpZ1hPVVZYVW1VOTJnWHNPT0x0ellFVGFFdmRU?=
 =?utf-8?B?eUt0czNydmZWQWg3dGVMb2F3aWhyUFhXRTJvRTQ2UHk1V3grbDhJTVhQa3or?=
 =?utf-8?B?V0JnRUU5YW5wVUFDUkUvRHFFaGIrL050YTJpNGRxSFliVEttTU9neFMrU1Az?=
 =?utf-8?B?alh5RTZhUDZTZGtKdU95SnBmMVAxeVphZ0VBQkpqaEVRcWRuQmpYdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcafaeb-4dda-45a9-54f3-08de6e0da08b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:16:34.4097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4D+ztQMMTDG9opj1xFvK5oB/RCh4qUb3KzUMf72Vz5SLcVrnT2BVUN80UAD9+zBGdXuQ9VoZCj6DWWsFjFzOww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 8748C14AC16
X-Rspamd-Action: no action



On 2/17/2026 3:31 PM, Matthew Auld wrote:
> On 17/02/2026 06:03, Arunpravin Paneer Selvam wrote:
>> Hi Matthew,
>>
>> On 2/10/2026 9:56 PM, Matthew Auld wrote:
>>> On 09/02/2026 08:30, Arunpravin Paneer Selvam wrote:
>>>> Large alignment requests previously forced the buddy allocator to 
>>>> search by
>>>> alignment order, which often caused higher-order free blocks to be 
>>>> split even
>>>> when a suitably aligned smaller region already existed within them. 
>>>> This led
>>>> to excessive fragmentation, especially for workloads requesting 
>>>> small sizes
>>>> with large alignment constraints.
>>>>
>>>> This change prioritizes the requested allocation size during the 
>>>> search and
>>>> uses an augmented RB-tree field (subtree_max_alignment) to 
>>>> efficiently locate
>>>> free blocks that satisfy both size and offset-alignment 
>>>> requirements. As a
>>>> result, the allocator can directly select an aligned sub-region 
>>>> without
>>>> splitting larger blocks unnecessarily.
>>>>
>>>> A practical example is the VKCTS test
>>>> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which 
>>>> repeatedly
>>>> allocates 8 KiB buffers with a 256 KiB alignment. Previously, such 
>>>> allocations
>>>> caused large blocks to be split aggressively, despite smaller 
>>>> aligned regions
>>>> being sufficient. With this change, those aligned regions are 
>>>> reused directly,
>>>> significantly reducing fragmentation.
>>>>
>>>> This improvement is visible in the amdgpu VRAM buddy allocator state
>>>> (/sys/kernel/debug/dri/1/amdgpu_vram_mm). After the change, higher- 
>>>> order blocks
>>>> are preserved and the number of low-order fragments is 
>>>> substantially reduced.
>>>>
>>>> Before:
>>>>    order- 5 free: 1936 MiB, blocks: 15490
>>>>    order- 4 free:  967 MiB, blocks: 15486
>>>>    order- 3 free:  483 MiB, blocks: 15485
>>>>    order- 2 free:  241 MiB, blocks: 15486
>>>>    order- 1 free:  241 MiB, blocks: 30948
>>>>
>>>> After:
>>>>    order- 5 free:  493 MiB, blocks:  3941
>>>>    order- 4 free:  246 MiB, blocks:  3943
>>>>    order- 3 free:  123 MiB, blocks:  4101
>>>>    order- 2 free:   61 MiB, blocks:  4101
>>>>    order- 1 free:   61 MiB, blocks:  8018
>>>>
>>>> By avoiding unnecessary splits, this change improves allocator 
>>>> efficiency and
>>>> helps maintain larger contiguous free regions under heavy 
>>>> offset-aligned
>>>> allocation workloads.
>>>>
>>>> v2:(Matthew)
>>>>    - Update augmented information along the path to the inserted node.
>>>>
>>>> v3:
>>>>    - Move the patch to gpu/buddy.c file.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/buddy.c       | 271 
>>>> +++++++++++++++++++++++++++++++-------
>>>>   include/linux/gpu_buddy.h |   2 +
>>>>   2 files changed, 228 insertions(+), 45 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
>>>> index 603c59a2013a..3a25eed050ba 100644
>>>> --- a/drivers/gpu/buddy.c
>>>> +++ b/drivers/gpu/buddy.c
>>>> @@ -14,6 +14,16 @@
>>>>     static struct kmem_cache *slab_blocks;
>>>>   +static unsigned int gpu_buddy_block_offset_alignment(struct 
>>>> gpu_buddy_block *block)
>>>> +{
>>>> +    return __ffs(gpu_buddy_block_offset(block));
>>>
>>> __ffs() will be undefined for offset zero it seems, so might blow up 
>>> in some strange way. I guess just return the max possible alignment 
>>> here if offset is zero? Also are we meant to use __ffs64() here?
>> Yes, I had the same concern about __ffs() being undefined when the 
>> offset is zero. My initial thought was to derive the maximum possible 
>> alignment from the allocator size using ilog2(mm->size) and return 
>> that value for the zero-offset case.
>>
>> But, RB_DECLARE_CALLBACKS_MAX() requires the compute callback 
>> (gpu_buddy_block_offset_alignment()) to accept only a single struct 
>> gpu_buddy_block * argument. It does not provide a mechanism to pass 
>> additional context such as the associated struct gpu_buddy *mm. As a 
>> result, deriving the alignment from allocator state (e.g., via 
>> ilog2(mm-  >size)) is not directly feasible within this callback. 
>> When I tested the zero-offset case locally, __ffs() returned 64, 
>> which effectively corresponds to the maximum alignment for a u64 
>> offset. Based on that observation, I initially left the __ffs() call 
>> unchanged for the zero case as well.
>>
>> One possible alternative would be to store a pointer to struct 
>> gpu_buddy inside each gpu_buddy_block.
>>
>> All other review comments have been addressed, and I will send a v4 
>> once this point is clarified.
>
> Yeah, I was thinking we just return the max theoretical value, so 64, 
> or perhaps 64+1. It just needs to be a value that will be larger than 
> any other possible alignment, since zero is special. It shouldn't 
> matter if that is larger than the actual real max for the region, I 
> think.
>
> if (!offset)
>     return 64 + 1;
>
> return __ffs64(offset);
>
> ?
Yes, that should work. I will update the helper accordingly in v4.

Regards,
Arun.
>
>>
>> Regards,
>> Arun.
>>>
>>>> +}
>>>> +
>>>> +RB_DECLARE_CALLBACKS_MAX(static, gpu_buddy_augment_cb,
>>>> +             struct gpu_buddy_block, rb,
>>>> +             unsigned int, subtree_max_alignment,
>>>> +             gpu_buddy_block_offset_alignment);
>>>> +
>>>>   static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
>>>>                              struct gpu_buddy_block *parent,
>>>>                              unsigned int order,
>>>> @@ -31,6 +41,9 @@ static struct gpu_buddy_block 
>>>> *gpu_block_alloc(struct gpu_buddy *mm,
>>>>       block->header |= order;
>>>>       block->parent = parent;
>>>>   +    block->subtree_max_alignment =
>>>> +        gpu_buddy_block_offset_alignment(block);
>>>> +
>>>>       RB_CLEAR_NODE(&block->rb);
>>>>         BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);
>>>> @@ -67,26 +80,42 @@ static bool rbtree_is_empty(struct rb_root *root)
>>>>       return RB_EMPTY_ROOT(root);
>>>>   }
>>>>   -static bool gpu_buddy_block_offset_less(const struct 
>>>> gpu_buddy_block *block,
>>>> -                    const struct gpu_buddy_block *node)
>>>> -{
>>>> -    return gpu_buddy_block_offset(block) < 
>>>> gpu_buddy_block_offset(node);
>>>> -}
>>>> -
>>>> -static bool rbtree_block_offset_less(struct rb_node *block,
>>>> -                     const struct rb_node *node)
>>>> -{
>>>> -    return gpu_buddy_block_offset_less(rbtree_get_free_block(block),
>>>> -                       rbtree_get_free_block(node));
>>>> -}
>>>> -
>>>>   static void rbtree_insert(struct gpu_buddy *mm,
>>>>                 struct gpu_buddy_block *block,
>>>>                 enum gpu_buddy_free_tree tree)
>>>>   {
>>>> -    rb_add(&block->rb,
>>>> - &mm->free_trees[tree][gpu_buddy_block_order(block)],
>>>> -           rbtree_block_offset_less);
>>>> +    struct rb_node **link, *parent = NULL;
>>>> +    unsigned int block_alignment, order;
>>>> +    struct gpu_buddy_block *node;
>>>> +    struct rb_root *root;
>>>> +
>>>> +    order = gpu_buddy_block_order(block);
>>>> +    block_alignment = gpu_buddy_block_offset_alignment(block);
>>>> +
>>>> +    root = &mm->free_trees[tree][order];
>>>> +    link = &root->rb_node;
>>>> +
>>>> +    while (*link) {
>>>> +        parent = *link;
>>>> +        node = rbtree_get_free_block(parent);
>>>> +        /*
>>>> +         * Manual augmentation update during insertion traversal. 
>>>> Required
>>>> +         * because rb_insert_augmented() only calls rotate 
>>>> callback during
>>>> +         * rotations. This ensures all ancestors on the insertion 
>>>> path have
>>>> +         * correct subtree_max_alignment values.
>>>> +         */
>>>> +        if (node->subtree_max_alignment < block_alignment)
>>>> +            node->subtree_max_alignment = block_alignment;
>>>> +
>>>> +        if (gpu_buddy_block_offset(block) < 
>>>> gpu_buddy_block_offset(node))
>>>> +            link = &parent->rb_left;
>>>> +        else
>>>> +            link = &parent->rb_right;
>>>> +    }
>>>> +
>>>> +    block->subtree_max_alignment = block_alignment;
>>>> +    rb_link_node(&block->rb, parent, link);
>>>> +    rb_insert_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>>>>   }
>>>>     static void rbtree_remove(struct gpu_buddy *mm,
>>>> @@ -99,7 +128,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
>>>>       tree = get_block_tree(block);
>>>>       root = &mm->free_trees[tree][order];
>>>>   -    rb_erase(&block->rb, root);
>>>> +    rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>>>>       RB_CLEAR_NODE(&block->rb);
>>>>   }
>>>>   @@ -790,6 +819,132 @@ alloc_from_freetree(struct gpu_buddy *mm,
>>>>       return ERR_PTR(err);
>>>>   }
>>>>   +static bool
>>>> +gpu_buddy_can_offset_align(u64 size, u64 min_block_size)
>>>> +{
>>>> +    return size < min_block_size && is_power_of_2(size);
>>>> +}
>>>> +
>>>> +static bool gpu_buddy_subtree_can_satisfy(struct rb_node *node,
>>>> +                      unsigned int alignment)
>>>> +{
>>>> +    struct gpu_buddy_block *block;
>>>> +
>>>> +    if (!node)
>>>> +        return false;
>>>
>>> All callers seem to handle null case already, so could potentially 
>>> drop this?
>>>
>>>> +
>>>> +    block = rbtree_get_free_block(node);
>>>> +    return block->subtree_max_alignment >= alignment;
>>>> +}
>>>> +
>>>> +static struct gpu_buddy_block *
>>>> +gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
>>>> +                 enum gpu_buddy_free_tree tree,
>>>> +                 unsigned int order,
>>>> +                 unsigned int tmp,
>>>> +                 unsigned int alignment,
>>>> +                 unsigned long flags)
>>>> +{
>>>> +    struct rb_root *root = &mm->free_trees[tree][tmp];
>>>> +    struct rb_node *rb = root->rb_node;
>>>> +
>>>> +    while (rb) {
>>>> +        struct gpu_buddy_block *block = rbtree_get_free_block(rb);
>>>> +        struct rb_node *left_node = rb->rb_left, *right_node = rb- 
>>>> >rb_right;
>>>> +
>>>> +        if (right_node) {
>>>> +            if (gpu_buddy_subtree_can_satisfy(right_node, 
>>>> alignment)) {
>>>> +                rb = right_node;
>>>> +                continue;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        if (gpu_buddy_block_order(block) >= order &&
>>>
>>> Is this not always true? With that we can drop order, or better yet 
>>> s/ tmp/order/ ?
>>>
>>>> + __ffs(gpu_buddy_block_offset(block)) >= alignment)
>>>
>>> Same here with undefined offset zero case. I guess also use the helper.
>>>
>>>> +            return block;
>>>> +
>>>> +        if (left_node) {
>>>> +            if (gpu_buddy_subtree_can_satisfy(left_node, 
>>>> alignment)) {
>>>> +                rb = left_node;
>>>> +                continue;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return NULL;
>>>> +}
>>>> +
>>>> +static struct gpu_buddy_block *
>>>> +gpu_buddy_offset_aligned_allocation(struct gpu_buddy *mm,
>>>> +                    u64 size,
>>>> +                    u64 min_block_size,
>>>> +                    unsigned long flags)
>>>> +{
>>>> +    struct gpu_buddy_block *block = NULL;
>>>> +    unsigned int order, tmp, alignment;
>>>> +    struct gpu_buddy_block *buddy;
>>>> +    enum gpu_buddy_free_tree tree;
>>>> +    unsigned long pages;
>>>> +    int err;
>>>> +
>>>> +    alignment = ilog2(min_block_size);
>>>> +    pages = size >> ilog2(mm->chunk_size);
>>>> +    order = fls(pages) - 1;
>>>> +
>>>> +    tree = (flags & GPU_BUDDY_CLEAR_ALLOCATION) ?
>>>> +        GPU_BUDDY_CLEAR_TREE : GPU_BUDDY_DIRTY_TREE;
>>>> +
>>>> +    for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>> +        block = gpu_buddy_find_block_aligned(mm, tree, order,
>>>> +                             tmp, alignment, flags);
>>>> +        if (!block) {
>>>> +            tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
>>>> +                GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
>>>> +            block = gpu_buddy_find_block_aligned(mm, tree, order,
>>>> +                                 tmp, alignment, flags);
>>>> +        }
>>>> +
>>>> +        if (block)
>>>> +            break;
>>>> +    }
>>>> +
>>>> +    if (!block)
>>>> +        return ERR_PTR(-ENOSPC);
>>>> +
>>>> +    while (gpu_buddy_block_order(block) > order) {
>>>> +        struct gpu_buddy_block *left, *right;
>>>> +
>>>> +        err = split_block(mm, block);
>>>> +        if (unlikely(err))
>>>> +            goto err_undo;
>>>> +
>>>> +        left  = block->left;
>>>> +        right = block->right;
>>>> +
>>>> +        if (__ffs(gpu_buddy_block_offset(right)) >= alignment)
>>>
>>> Might be better to use the helper for this?
>>>
>>>> +            block = right;
>>>> +        else
>>>> +            block = left;
>>>> +    }
>>>> +
>>>> +    return block;
>>>> +
>>>> +err_undo:
>>>> +    /*
>>>> +     * We really don't want to leave around a bunch of split 
>>>> blocks, since
>>>> +     * bigger is better, so make sure we merge everything back 
>>>> before we
>>>> +     * free the allocated blocks.
>>>> +     */
>>>> +    buddy = __get_buddy(block);
>>>> +    if (buddy &&
>>>> +        (gpu_buddy_block_is_free(block) &&
>>>> +         gpu_buddy_block_is_free(buddy)))
>>>> +        __gpu_buddy_free(mm, block, false);
>>>> +    return ERR_PTR(err);
>>>> +}
>>>> +
>>>>   static int __alloc_range(struct gpu_buddy *mm,
>>>>                struct list_head *dfs,
>>>>                u64 start, u64 size,
>>>> @@ -1059,6 +1214,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
>>>>   static struct gpu_buddy_block *
>>>>   __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>>>                u64 start, u64 end,
>>>> +             u64 size, u64 min_block_size,
>>>>                unsigned int order,
>>>>                unsigned long flags)
>>>>   {
>>>> @@ -1066,6 +1222,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>>>           /* Allocate traversing within the range */
>>>>           return  __gpu_buddy_alloc_range_bias(mm, start, end,
>>>>                                order, flags);
>>>> +    else if (size < min_block_size)
>>>> +        /* Allocate from an offset-aligned region without size 
>>>> rounding */
>>>> +        return gpu_buddy_offset_aligned_allocation(mm, size,
>>>> +                               min_block_size,
>>>> +                               flags);
>>>>       else
>>>>           /* Allocate from freetree */
>>>>           return alloc_from_freetree(mm, order, flags);
>>>> @@ -1137,8 +1298,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy 
>>>> *mm,
>>>>       if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
>>>>           size = roundup_pow_of_two(size);
>>>>           min_block_size = size;
>>>> -    /* Align size value to min_block_size */
>>>> -    } else if (!IS_ALIGNED(size, min_block_size)) {
>>>> +        /*
>>>> +         * Normalize the requested size to min_block_size for 
>>>> regular allocations.
>>>> +         * Offset-aligned allocations intentionally skip size 
>>>> rounding.
>>>> +         */
>>>> +    } else if (!gpu_buddy_can_offset_align(size, min_block_size)) {
>>>>           size = round_up(size, min_block_size);
>>>>       }
>>>>   @@ -1158,43 +1322,60 @@ int gpu_buddy_alloc_blocks(struct 
>>>> gpu_buddy *mm,
>>>>       do {
>>>>           order = min(order, (unsigned int)fls(pages) - 1);
>>>>           BUG_ON(order > mm->max_order);
>>>> -        BUG_ON(order < min_order);
>>>> +        /*
>>>> +         * Regular allocations must not allocate blocks smaller 
>>>> than min_block_size.
>>>> +         * Offset-aligned allocations deliberately bypass this 
>>>> constraint.
>>>> +         */
>>>> +        BUG_ON(size >= min_block_size && order < min_order);
>>>>             do {
>>>> +            unsigned int fallback_order;
>>>> +
>>>>               block = __gpu_buddy_alloc_blocks(mm, start,
>>>>                                end,
>>>> +                             size,
>>>> +                             min_block_size,
>>>>                                order,
>>>>                                flags);
>>>>               if (!IS_ERR(block))
>>>>                   break;
>>>>   -            if (order-- == min_order) {
>>>> -                /* Try allocation through force merge method */
>>>> -                if (mm->clear_avail &&
>>>> -                    !__force_merge(mm, start, end, min_order)) {
>>>> -                    block = __gpu_buddy_alloc_blocks(mm, start,
>>>> -                                     end,
>>>> -                                     min_order,
>>>> -                                     flags);
>>>> -                    if (!IS_ERR(block)) {
>>>> -                        order = min_order;
>>>> -                        break;
>>>> -                    }
>>>> -                }
>>>> +            if (size < min_block_size) {
>>>> +                fallback_order = order;
>>>> +            } else if (order == min_order) {
>>>> +                fallback_order = min_order;
>>>> +            } else {
>>>> +                order--;
>>>> +                continue;
>>>> +            }
>>>>   -                /*
>>>> -                 * Try contiguous block allocation through
>>>> -                 * try harder method.
>>>> -                 */
>>>> -                if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
>>>> -                    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
>>>> -                    return __alloc_contig_try_harder(mm,
>>>> -                                     original_size,
>>>> -                                     original_min_size,
>>>> -                                     blocks);
>>>> -                err = -ENOSPC;
>>>> -                goto err_free;
>>>> +            /* Try allocation through force merge method */
>>>> +            if (mm->clear_avail &&
>>>> +                !__force_merge(mm, start, end, fallback_order)) {
>>>> +                block = __gpu_buddy_alloc_blocks(mm, start,
>>>> +                                 end,
>>>> +                                 size,
>>>> +                                 min_block_size,
>>>> +                                 fallback_order,
>>>> +                                 flags);
>>>> +                if (!IS_ERR(block)) {
>>>> +                    order = fallback_order;
>>>> +                    break;
>>>> +                }
>>>>               }
>>>> +
>>>> +            /*
>>>> +             * Try contiguous block allocation through
>>>> +             * try harder method.
>>>> +             */
>>>> +            if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
>>>> +                !(flags & GPU_BUDDY_RANGE_ALLOCATION))
>>>> +                return __alloc_contig_try_harder(mm,
>>>> +                                 original_size,
>>>> +                                 original_min_size,
>>>> +                                 blocks);
>>>> +            err = -ENOSPC;
>>>> +            goto err_free;
>>>>           } while (1);
>>>>             mark_allocated(mm, block);
>>>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>>>> index 07ac65db6d2e..7ad817c69ec6 100644
>>>> --- a/include/linux/gpu_buddy.h
>>>> +++ b/include/linux/gpu_buddy.h
>>>> @@ -11,6 +11,7 @@
>>>>   #include <linux/slab.h>
>>>>   #include <linux/sched.h>
>>>>   #include <linux/rbtree.h>
>>>> +#include <linux/rbtree_augmented.h>
>>>>     #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>>>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>>> @@ -58,6 +59,7 @@ struct gpu_buddy_block {
>>>>       };
>>>>         struct list_head tmp_link;
>>>> +    unsigned int subtree_max_alignment;
>>>>   };
>>>>     /* Order-zero must be at least SZ_4K */
>>>>
>>>> base-commit: 9d757669b2b22cd224c334924f798393ffca537c
>>>
>>
>

