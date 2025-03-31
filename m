Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07541A76C26
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D2D10E46C;
	Mon, 31 Mar 2025 16:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FGom/UKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B58510E465;
 Mon, 31 Mar 2025 16:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXRXMnE+vndjbX+Ioy+e3U/I9noU8YCfVMVWvxTi/NB5s3rInddHhQ53vjsHkUiCrbO4tvDe6YjZjRIxgtnoY+yl919DeKwWdcGxml1rStQAubTcuUi2uaCLHZ2nx7QvF7lvQy7L8Vnktd2lg2kgH0asQwTTvnbcXoT9e9Y/Uz1OuKB7ZUv0u/YA5B4tLxaWlj360eFpjSCx/2xTAWm9pdB+FciOku1QWYWz2DgPATqjRD77DfRRb66QdWvf/YON2Apmd211x/+DNlEzus+enkmkOfH28SzzxuMq8UQaZbpK94sDIU+6Axdy26NfEibeTqvSwfikUXxkKlp8J9y/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEL+zKvHEGt4xA/8P5lDcU5x8NDdi1aRli2Csq1+kgw=;
 b=G9RLR2NmX6DgdlmpPy2QanM+2oqJVSvYibfyiBGe2Ft38ZICHX3BplplYlCWHL0dX4QuZI9yUEjfo2gGm2OkFHkqmBMkiXjSNmWzXVFRF3qdSB0mbZXyeG5FtoaouIzgCJgLF0aBFqSY1HfTCCTe9u3JxGDCU2XPDLyyf6Fo9WJJftn3Jj8qpU+9+qysmfSn6eIpa+5l7O0Pvs9wMo83oxz2KNW9dQ2QSMkkoa3xuvMBkP9MNgLl3biwLqPA2OyLfPL80Y4/WxZkV0rycvAF32UXqE+VIk8uZgKB3YnUG9cF5tes8ju1JsnP1GJBLyMoebVJuIlMqJ8tFHe3yb4Q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEL+zKvHEGt4xA/8P5lDcU5x8NDdi1aRli2Csq1+kgw=;
 b=FGom/UKgNoKZDiGga3Kt6Z0ypKqgb4+YpZaONbkydWH/IiAbDVZSQwd5X7kfLyhwfP+nI/6w+hn47TzN9fq2G9N5KY5J+ihjs8fBc6dIymOkWkUEGR20aJCneZZKxNxD/KmIh5dac5zrP9Ev1KlybRc7TYN0m0/DHKwaUdxF1QE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:41:56 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:41:56 +0000
Message-ID: <a60f5a95-4efe-406f-b6a4-148296381259@amd.com>
Date: Mon, 31 Mar 2025 10:41:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 03/43] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-4-alex.hung@amd.com>
 <TYCPR01MB843733DF1AD7CA69FD9A1A0398AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB843733DF1AD7CA69FD9A1A0398AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::19)
 To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ef2c39-237a-4d0f-e925-08dd7072f2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tmx4dWZKZ2UremdSY2RnNjN1MTEzcm5EN3FXN1Z3N1UzS1FOTit3bHJYTHJK?=
 =?utf-8?B?My9UcXpTcllRektIaVdZTE5uMmVyTWVpRTdxaXpRaVdMYUZGdnoyU3NyaVVX?=
 =?utf-8?B?V1dsdXRwbktUeVdDZmNGdFFKRmpjSGJUUklnOGhISC9kZStRM0ZaZHhUbEpW?=
 =?utf-8?B?RE5uTnpDRHJ5bG1DbHExT3J0b2lxS1lSWGY4Q0FOSGNTbUdVN0lMSitDVUJZ?=
 =?utf-8?B?YlNnR3d5REpxdERINzJlOUw5Vk1VZXYzdXZMSm9wN2RaV0N0K0U2ZDdmdVRu?=
 =?utf-8?B?UTd1b056eEwxODJIYndoMVVNUWZVWWM2alhJcngraFZKOGVoOEdOT1lrYUhH?=
 =?utf-8?B?QlNvTFpNbHVzVC9XUFFPa1hVK0xVYzhoUDVtVlVKVDcwZVYzOWExYVJnSDJx?=
 =?utf-8?B?WHNtSFIxV0NyOURNVGdsRlM5Nk5xajdmdDdqTDRyMk8ydktWL0ZhamJpWEQv?=
 =?utf-8?B?aGZIeXJuNlRGaTFpUTh4ZEhNbFd2OFJzMkp2MENsaHp0MTJ3c2Fmc0l5aTBh?=
 =?utf-8?B?Szl6Z1ZIZkdCWFpaOWc5RFdVa0RLa0xkbXZYZU8rcndTbDBiVWtzSkJDUGFm?=
 =?utf-8?B?S21DSGhiQkJyMjd4RnJXaXZ1UGlHemsyTDFGWmVXaWNCUVBUQzRJMWNnUXls?=
 =?utf-8?B?emVhbHhhc1F4V1kvMHJGcU5nYTliRUZjZWxSWnd4SGNnNDJobkVlcmJaNnRa?=
 =?utf-8?B?Rms5eUNSUU5tckYvbDZkUXdyckwrZEJaZDd0c3ZLT1dSdmdoSkNsbWN2V1Z0?=
 =?utf-8?B?Y1Z2KzVlaG8zWEpkYkFhNEJBdzY5dk8wK1JiQldGY2pjL0FMZGFPamhYWU5t?=
 =?utf-8?B?bUlwSjB5Y0hmVFpkeXhGUGg3cWZ1cFhNc1lGcVBTU1lIVkNyMXJzbDhGM1Zy?=
 =?utf-8?B?OElITjZsNkxTZjdGUUVtTjBpdHdYSlVZT0R5MU5XR0NtYlJGTTNWYWNLSHZz?=
 =?utf-8?B?a3BWalFiYzd6ZVdxQzlKV0hOaDQ4MHVKRTUvcEVhYjlVU1pqSjZ1SnFnQUo3?=
 =?utf-8?B?bHJKOUtQcC9pdVhMN0JLbXlOVmNhQTVMM3lFajdITmpNaFVGcVdrejlsbUhI?=
 =?utf-8?B?elZyVGZtL0VvRlpzbVRRaTRheUw3REhvTitMekVXdEl1VVUyYXB0NnBobWlE?=
 =?utf-8?B?a3NhTi9jeEptM3pmUlNMQ092dk0zYXByZi9RSElhWVcrNjBsTjdkNTJMTDdh?=
 =?utf-8?B?NmsvRTZjRXZUMUtUY2hNaS9OaWNoa1g2cWw5Z1loVU1lT2NVWTBnTk0weEdh?=
 =?utf-8?B?Q2RYVllaWWRxSjFyL1dzUnFzYUxiVTFoWEFMWDhvUGl1MDFva1U3R2lUYVFX?=
 =?utf-8?B?Z3VUV1VzUGhlRXVXYXpLMlQrbitSK1BjK0k5N1BYV0FtZnlubUlERGhPaWNV?=
 =?utf-8?B?UXExNEhla1pkK0N0SVhyYngxY005QWd0bDYzTnMwY250ckxqU1dtdStvZ0k1?=
 =?utf-8?B?YjRZelZ0NmdPSWpUQmJvRFFJaDhiTkhDamFpNG5NNmNyMHJNZjNNVUJkNFhp?=
 =?utf-8?B?N0ZXczVJbzZQR3FhTDhnY1BCeW0xdUY0QkVjbVdXNWFoYWRtNVgyYWU3djlq?=
 =?utf-8?B?VzlUTHVhRk01WFBGSGlkdlN4ZWNLd0haR2k2VWRrTGZON216ZXROZmZHeUc1?=
 =?utf-8?B?cXhrL3JtTlVXa1FvdUxUdTZyc3BmOWFEaHpFRCsyMzdZRURwdUVrbk03WUxV?=
 =?utf-8?B?UXJjU29hK3o1eUMxa1EyTU80WFQzWUtaSG82SzBodSttL1ZkMHpZeE9qdmJX?=
 =?utf-8?B?djBYRDBpUnNjV2pVMCtyMHJpazMxYS9DRVIzRU5xeDEvZTJVTlN4UGdNSFJv?=
 =?utf-8?B?djQ0VHdWZ1M2SlZLSld4TU43cG9ld2UxZjlFYWFVZWFJR0tKTk4vVmJxd2pX?=
 =?utf-8?Q?Koqs+49hPCXmx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2Y4VXJ1VkhteklCb3FtMlpOeExudUhOOTFsK2xmZXNpYklOd0NPVUFoYzIr?=
 =?utf-8?B?STNCOEhudXc5Nk9kOWticUg5SWVIQjZXZWVubjBPK0xPeW5UNEJMNFVOMEJo?=
 =?utf-8?B?K0s0eUg5S3Q0a1RBRkxLSHpVWExmSCsvVzllU3R6Y1FrVnRUcTlQcmFLb2VU?=
 =?utf-8?B?L0Vkc1BtQ1R3VW43by9vbTdvWkxYYzVaMFZZWEpTSnVSMTZrZkFQdnZvMWxW?=
 =?utf-8?B?M0FEUWVvSWkvYXl4Q0RtZnEzV1hEeW1TT1pkK2NpN3MxMUZBMU5Ec21PMms2?=
 =?utf-8?B?eGs0Uks2eG1nMTNvc3ZTWDJZMU9QK21XYndud1FOdWJyYXdxRGhZTllYb3NN?=
 =?utf-8?B?S0lXbEI2YkEvT3lPWE9DVjZseXRlVEdzM3RGMVErb0JKZldyTEYrUTJrbEVn?=
 =?utf-8?B?OTV5eDhZQVp6eExKSWU0cEhzbnV2VXFUcGN1TEZwaFhHQUJYdlNsRlNTc3hC?=
 =?utf-8?B?bnd5eWpEMDYxR2NERVRXSWZvTW9qWTRhOXRxRG5oL2VWc1BFaU1wTFI4UEh5?=
 =?utf-8?B?bWxmN1ZGRTdnSGdEUk0ra2V4L1dQbUV4aEVqRForUFNoanJlOE1yVnBLd3Zw?=
 =?utf-8?B?TjA3UzROcW5EYzdQeS8xQk9LMGVxTzgxak0zV1lacE9UNDNvQWxFVkd3bnpS?=
 =?utf-8?B?SDhnREJ1NmFCWmhFb3RqeVFtcFhYUnpFblN2Szl1bHJjRkVjTnVDazJ0eW4r?=
 =?utf-8?B?bkVZdXNNZHVISGhiZ2NXb1VZNzRMZGhYVGhGUnM0REV3VlpKS3VFb2xmdXI4?=
 =?utf-8?B?NXBtdFVWdVZUT3VZU2RwQ1drNzBydFl4NUNQV1QrNkJlK1JUMi9SMzBSTUcr?=
 =?utf-8?B?YkFONkxjVXBlV3lrVTBJNjdyemlJNlRXK0lpMm9XT05uRFd6Z0FFakNvVjZQ?=
 =?utf-8?B?UnZjZ25sRTdXaWVtVFR3cHh0MG9xVFFHUm0vditsOG9idndxT2pEUGQrV2x0?=
 =?utf-8?B?RmMycHNHdTJGd1RQcG4rVHlyQ2ZLZ1J5YUhjd2NlY3c5bGJtMVlMU0hBS3NR?=
 =?utf-8?B?ZWhyQ2h0cUUrT01ESit0S0VCUnFKbkxYd1gwWmpXR3lDbng4dFl5TnpncmZY?=
 =?utf-8?B?ODNWN2N3U2E2c1FTTWFRZmxVc21ZcVl2NlJoQnlZZS9GR0JVcHBLcVZiM1NK?=
 =?utf-8?B?cXNNbVRDV09XWnFjN2h1VnpKQ3UreGFmM24xWGY4aFUvMUNSbHd1L294bGVw?=
 =?utf-8?B?dCtNTUQ5eGlka3IxQk54M1hDRHEyRTZYTXh5S2tQZ3dZYlNBdlZpOHVlZ255?=
 =?utf-8?B?cHJ2N0hBYzcrNDI4V0hmM2grM1VUSUQrSHh3YzQyd09abERYR1l0cWZlQ0My?=
 =?utf-8?B?TUlEZ1hMcnQ2eHZkbFFlQjlnd1diYXVmT2VpR05KcjZPc3JzT3BEbFAzTVdl?=
 =?utf-8?B?L0lHTzRudFpTWnRJalkxQVg5a0k1QjdYY3VEdHRBR0Y5Ukt5S0JxMCt2bXFJ?=
 =?utf-8?B?WVA5ck13ZTkzNGxJMlgwWU9lcUk0ekpWWVp4RDBYT0VQc0toMkJCQ1FvaTh3?=
 =?utf-8?B?Zk1oMHNRQmZ5LzFzNThXOWNGN3hHTUI4K0Qza3ZDZzg5VlN6SUlmTDVNNVpT?=
 =?utf-8?B?Ukh0OWlVYitZQjRXaVdIVkdVbVhHRFJFdzdKdG9vT3BMajNtUDlWcm9IMjlC?=
 =?utf-8?B?bDhrOGQraTdtc1dOYmJ1Q1NydUZRWVZhdkZNV3ZoRzZaRUdjQ1prK3dmdDB6?=
 =?utf-8?B?MlZHd2xoUG1tSjZpRVdZeHBIc3RPbEJMMVNEM0tDYXRqUU44NTByTGJENUpO?=
 =?utf-8?B?WVAxYk4ybUtuTm5sQ09kMnkxS1N5dXVzTUtaQmMvRGNEQW9PY1k0ZFhqZ2Z3?=
 =?utf-8?B?VGRGMjdkOHZGOHY3MktmWFU2VHJKcDhndFB2QTl1Wmwzb1Y0ZHV2Mkl0Mm9q?=
 =?utf-8?B?NDE4M2JIaWRWZktKOTF5WEdkZEFic1d2SVVHUTJqUXhCUnhMeUxFS2lxYmFy?=
 =?utf-8?B?czdNMWowNTJqeTA4dEp4eVU4L0VINmNNRmVOUFVldUYxaXdkWFdTeUU2UmRS?=
 =?utf-8?B?dHdUSmZDb2YwSHNPRExkUytzMFFFL04wZU5tbmRIZjJlaUFRVTVKSC9ZNFpi?=
 =?utf-8?B?Wko4TTNMV202bUVBSFdQYUhLbXN0UHVna0ZEOVIzNEsxaUR3VjhTd0M1VW5C?=
 =?utf-8?Q?bxFEN8P5gSBd5pURIeuaL6q/I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ef2c39-237a-4d0f-e925-08dd7072f2cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:41:56.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OroBym7tJRrqjgqZJtJY66kwPtQ9EjAOZp/JsbETXQfMv5CEhXOkl8KYqvdC22hk4ZocRVUHhY1ZTP22kkw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916
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



On 3/31/25 10:24, Shengyu Qu wrote:
> 
> 
> 在 2025/3/27 7:46, Alex Hung 写道:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Add documentation for color pipeline API.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>> v8:
>>   - Fix typo "definint" -> "defining"
>>
>> v7:
>>   - Add a commit messages
>>
>> v5:
>>   - Don't require BYPASS to succeed (Sebastian)
>>   - use DATA for 1D and 3D LUT types (Sebastian)
>>   - update 3DLUT ops to use 3DLUT_MODES and 3DLUT_MODE_INDEX
>>   - Add section on drm_colorop extensibility
>>   - Add color_pipeline.rst to RFC toc tree
>>
>> v4:
>>   - Drop IOCTL docs since we dropped the IOCTLs (Pekka)
>>   - Clarify reading and setting of COLOR_PIPELINE prop (Pekka)
>>   - Add blurb about not requiring to reject a pipeline due to
>>     incompatible ops, as long as op can be bypassed (Pekka)
>>   - Dropped informational strings (such as input CSC) as they're
>>     not actually intended to be advertised (Pekka)
>>
>> v3:
>>   - Describe DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE (Sebastian)
>>   - Ask for clear documentation of colorop behavior (Sebastian)
>>
>> v2:
>>   - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>   - Updated wording (Pekka)
>>   - Change BYPASS wording to make it non-mandatory (Sebastian)
>>   - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>     section (Pekka)
>>   - Use PQ EOTF instead of its inverse in Pipeline Programming example 
>> (Melissa)
>>   - Add "Driver Implementer's Guide" section (Pekka)
>>   - Add "Driver Forward/Backward Compatibility" section (Sebastian, 
>> Pekka)
>>
>>   Documentation/gpu/rfc/color_pipeline.rst | 378 +++++++++++++++++++++++
>>   Documentation/gpu/rfc/index.rst          |   3 +
>>   2 files changed, 381 insertions(+)
>>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>
>> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/ 
>> gpu/rfc/color_pipeline.rst
>> new file mode 100644
>> index 000000000000..58bcc2a5ffd8
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/color_pipeline.rst
>> @@ -0,0 +1,378 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +========================
>> +Linux Color Pipeline API
>> +========================
>> +
>> +What problem are we solving?
>> +============================
>> +
>> +We would like to support pre-, and post-blending complex color
>> +transformations in display controller hardware in order to allow for
>> +HW-supported HDR use-cases, as well as to provide support to
>> +color-managed applications, such as video or image editors.
>> +
>> +It is possible to support an HDR output on HW supporting the Colorspace
>> +and HDR Metadata drm_connector properties, but that requires the
>> +compositor or application to render and compose the content into one
>> +final buffer intended for display. Doing so is costly.
>> +
>> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and 
>> other
>> +operations to support color transformations. These operations are often
>> +implemented in fixed-function HW and therefore much more power 
>> efficient than
>> +performing similar operations via shaders or CPU.
>> +
>> +We would like to make use of this HW functionality to support complex 
>> color
>> +transformations with no, or minimal CPU or shader load.
>> +
>> +
>> +How are other OSes solving this problem?
>> +========================================
>> +
>> +The most widely supported use-cases regard HDR content, whether video or
>> +gaming.
>> +
>> +Most OSes will specify the source content format (color gamut, 
>> encoding transfer
>> +function, and other metadata, such as max and average light levels) 
>> to a driver.
>> +Drivers will then program their fixed-function HW accordingly to map 
>> from a
>> +source content buffer's space to a display's space.
>> +
>> +When fixed-function HW is not available the compositor will assemble 
>> a shader to
>> +ask the GPU to perform the transformation from the source content 
>> format to the
>> +display's format.
>> +
>> +A compositor's mapping function and a driver's mapping function are 
>> usually
>> +entirely separate concepts. On OSes where a HW vendor has no insight 
>> into
>> +closed-source compositor code such a vendor will tune their color 
>> management
>> +code to visually match the compositor's. On other OSes, where both 
>> mapping
>> +functions are open to an implementer they will ensure both mappings 
>> match.
>> +
>> +This results in mapping algorithm lock-in, meaning that no-one alone can
>> +experiment with or introduce new mapping algorithms and achieve
>> +consistent results regardless of which implementation path is taken.
>> +
>> +Why is Linux different?
>> +=======================
>> +
>> +Unlike other OSes, where there is one compositor for one or more 
>> drivers, on
>> +Linux we have a many-to-many relationship. Many compositors; many 
>> drivers.
>> +In addition each compositor vendor or community has their own view of 
>> how
>> +color management should be done. This is what makes Linux so beautiful.
>> +
>> +This means that a HW vendor can now no longer tune their driver to one
>> +compositor, as tuning it to one could make it look fairly different from
>> +another compositor's color mapping.
>> +
>> +We need a better solution.
>> +
>> +
>> +Descriptive API
>> +===============
>> +
>> +An API that describes the source and destination colorspaces is a 
>> descriptive
>> +API. It describes the input and output color spaces but does not 
>> describe
>> +how precisely they should be mapped. Such a mapping includes many minute
>> +design decision that can greatly affect the look of the final result.
>> +
>> +It is not feasible to describe such mapping with enough detail to 
>> ensure the
>> +same result from each implementation. In fact, these mappings are a 
>> very active
>> +research area.
>> +
>> +
>> +Prescriptive API
>> +================
>> +
>> +A prescriptive API describes not the source and destination 
>> colorspaces. It
>> +instead prescribes a recipe for how to manipulate pixel values to 
>> arrive at the
>> +desired outcome.
>> +
>> +This recipe is generally an ordered list of straight-forward operations,
>> +with clear mathematical definitions, such as 1D LUTs, 3D LUTs, matrices,
>> +or other operations that can be described in a precise manner.
>> +
>> +
>> +The Color Pipeline API
>> +======================
>> +
>> +HW color management pipelines can significantly differ between HW
>> +vendors in terms of availability, ordering, and capabilities of HW
>> +blocks. This makes a common definition of color management blocks and
>> +their ordering nigh impossible. Instead we are defining an API that
>> +allows user space to discover the HW capabilities in a generic manner,
>> +agnostic of specific drivers and hardware.
>> +
>> +
>> +drm_colorop Object
>> +==================
>> +
>> +To support the definition of color pipelines we define the DRM core
>> +object type drm_colorop. Individual drm_colorop objects will be chained
>> +via the NEXT property of a drm_colorop to constitute a color pipeline.
>> +Each drm_colorop object is unique, i.e., even if multiple color
>> +pipelines have the same operation they won't share the same drm_colorop
>> +object to describe that operation.
>> +
>> +Note that drivers are not expected to map drm_colorop objects statically
>> +to specific HW blocks. The mapping of drm_colorop objects is entirely a
>> +driver-internal detail and can be as dynamic or static as a driver needs
>> +it to be. See more in the Driver Implementation Guide section below.
>> +
>> +Each drm_colorop has three core properties:
>> +
>> +TYPE: An enumeration property, defining the type of transformation, 
>> such as
>> +* enumerated curve
>> +* custom (uniform) 1D LUT
>> +* 3x3 matrix
>> +* 3x4 matrix
>> +* 3D LUT
>> +* etc.
>> +
>> +Depending on the type of transformation other properties will describe
>> +more details.
>> +
>> +BYPASS: A boolean property that can be used to easily put a block into
>> +bypass mode. The BYPASS property is not mandatory for a colorop, as long
>> +as the entire pipeline can get bypassed by setting the COLOR_PIPELINE on
>> +a plane to '0'.
>> +
>> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
>> +drm_colorop is the last in the chain.
>> +
>> +An example of a drm_colorop object might look like one of these::
>> +
>> +    /* 1D enumerated curve */
>> +    Color operation 42
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 
>> matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, 
>> PQ inverse EOTF, …}
>> +    └─ "NEXT": immutable color operation ID = 43
>> +
>> +    /* custom 4k entry 1D LUT */
>> +    Color operation 52
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 
>> matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "SIZE": immutable range = 4096
>> +    ├─ "DATA": blob
>> +    └─ "NEXT": immutable color operation ID = 0
>> +
>> +    /* 17^3 3D LUT */
>> +    Color operation 72
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 
>> matrix, 3x4 matrix, 3D LUT, etc.} = 3D LUT
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "3DLUT_MODES": read-only blob of supported 3DLUT modes
>> +    ├─ "3DLUT_MODE_INDEX": index of selected 3DLUT mode
>> +    ├─ "DATA": blob
>> +    └─ "NEXT": immutable color operation ID = 73
>> +
>> +drm_colorop extensibility
>> +-------------------------
>> +
>> +Unlike existing DRM core objects, like &drm_plane, drm_colorop is not
>> +extensible. This simplifies implementations and keeps all functionality
>> +for managing &drm_colorop objects in the DRM core.
>> +
>> +If there is a need one may introduce a simple &drm_colorop_funcs
>> +function table in the future, for example to support an IN_FORMATS
>> +property on a &drm_colorop.
>> +
>> +If a driver requires the ability to create a driver-specific colorop
>> +object they will need to add &drm_colorop func table support with
>> +support for the usual functions, like destroy, atomic_duplicate_state,
>> +and atomic_destroy_state.
> As far as I know, there are multiple embedded SOCs(with mainline linux 
> support) that support colorops which are not exist in current func list. 
> Why don't we just make the api extensible now? It would make the API/ 
> code more simple when adding colorops.

Any vendor can create their color pipeline(s) and add new colorop 
objects accordingly. This patchset creates an AMD-specific color 
pipeline and colorop objects (for an obvious reason) as an demonstration 
and other vendors are working on their own too.

The following paragraphs should answer your questions.

> 
>> +
>> +
>> +COLOR_PIPELINE Plane Property
>> +=============================
>> +
>> +Color Pipelines are created by a driver and advertised via a new
>> +COLOR_PIPELINE enum property on each plane. Values of the property
>> +always include object id 0, which is the default and means all color
>> +processing is disabled. Additional values will be the object IDs of the
>> +first drm_colorop in a pipeline. A driver can create and advertise none,
>> +one, or more possible color pipelines. A DRM client will select a color
>> +pipeline by setting the COLOR PIPELINE to the respective value.
>> +
>> +NOTE: Many DRM clients will set enumeration properties via the string
>> +value, often hard-coding it. Since this enumeration is generated based
>> +on the colorop object IDs it is important to perform the Color Pipeline
>> +Discovery, described below, instead of hard-coding color pipeline
>> +assignment. Drivers might generate the enum strings dynamically.
>> +Hard-coded strings might only work for specific drivers on a specific
>> +pieces of HW. Color Pipeline Discovery can work universally, as long as
>> +drivers implement the required color operations.
>> +
>> +The COLOR_PIPELINE property is only exposed when the
>> +DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set. Drivers shall ignore any
>> +existing pre-blend color operations when this cap is set, such as
>> +COLOR_RANGE and COLOR_ENCODING. If drivers want to support COLOR_RANGE
>> +or COLOR_ENCODING functionality when the color pipeline client cap is
>> +set, they are expected to expose colorops in the pipeline to allow for
>> +the appropriate color transformation.
>> +
>> +Setting of the COLOR_PIPELINE plane property or drm_colorop properties
>> +is only allowed for userspace that sets this client cap.
>> +
>> +An example of a COLOR_PIPELINE property on a plane might look like 
>> this::
>> +
>> +    Plane 10
>> +    ├─ "TYPE": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    ├─ …
>> +    └─ "COLOR_PIPELINE": enum {0, 42, 52} = 0
>> +
>> +
>> +Color Pipeline Discovery
>> +========================
>> +
>> +A DRM client wanting color management on a drm_plane will:
>> +
>> +1. Get the COLOR_PIPELINE property of the plane
>> +2. iterate all COLOR_PIPELINE enum values
>> +3. for each enum value walk the color pipeline (via the NEXT pointers)
>> +   and see if the available color operations are suitable for the
>> +   desired color management operations
>> +
>> +If userspace encounters an unknown or unsuitable color operation during
>> +discovery it does not need to reject the entire color pipeline outright,
>> +as long as the unknown or unsuitable colorop has a "BYPASS" property.
>> +Drivers will ensure that a bypassed block does not have any effect.
>> +
>> +An example of chained properties to define an AMD pre-blending color
>> +pipeline might look like this::
>> +
>> +    Plane 10
>> +    ├─ "TYPE" (immutable) = Primary
>> +    └─ "COLOR_PIPELINE": enum {0, 44} = 0
>> +
>> +    Color operation 44
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
>> +    └─ "NEXT" (immutable) = 45
>> +
>> +    Color operation 45
>> +    ├─ "TYPE" (immutable) = 3x4 Matrix
>> +    ├─ "BYPASS": bool
>> +    ├─ "DATA": blob
>> +    └─ "NEXT" (immutable) = 46
>> +
>> +    Color operation 46
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = 
>> sRGB EOTF
>> +    └─ "NEXT" (immutable) = 47
>> +
>> +    Color operation 47
>> +    ├─ "TYPE" (immutable) = 1D LUT
>> +    ├─ "SIZE": immutable range = 4096
>> +    ├─ "DATA": blob
>> +    └─ "NEXT" (immutable) = 48
>> +
>> +    Color operation 48
>> +    ├─ "TYPE" (immutable) = 3D LUT
>> +    ├─ "3DLUT_MODE_INDEX": 0
>> +    ├─ "DATA": blob
>> +    └─ "NEXT" (immutable) = 49
>> +
>> +    Color operation 49
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
>> +    └─ "NEXT" (immutable) = 0
>> +
>> +
>> +Color Pipeline Programming
>> +==========================
>> +
>> +Once a DRM client has found a suitable pipeline it will:
>> +
>> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
>> +   drm_colorop object of the desired pipeline
>> +2. Set the properties for all drm_colorop objects in the pipeline to the
>> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
>> +   and false for enabled drm_colorop blocks
>> +3. Perform (TEST_ONLY or not) atomic commit with all the other KMS
>> +   states it wishes to change
>> +
>> +To configure the pipeline for an HDR10 PQ plane and blending in linear
>> +space, a compositor might perform an atomic commit with the following
>> +property values::
>> +
>> +    Plane 10
>> +    └─ "COLOR_PIPELINE" = 42
>> +
>> +    Color operation 42
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 44
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 45
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 46
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 47
>> +    ├─ "LUT_3D_DATA" = Gamut mapping + tone mapping + night mode
>> +    └─ "BYPASS" = false
>> +
>> +    Color operation 48
>> +    ├─ "CURVE_1D_TYPE" = PQ EOTF
>> +    └─ "BYPASS" = false
>> +
>> +
>> +Driver Implementer's Guide
>> +==========================
>> +
>> +What does this all mean for driver implementations? As noted above the
>> +colorops can map to HW directly but don't need to do so. Here are some
>> +suggestions on how to think about creating your color pipelines:
>> +
>> +- Try to expose pipelines that use already defined colorops, even if
>> +  your hardware pipeline is split differently. This allows existing
>> +  userspace to immediately take advantage of the hardware.
>> +
>> +- Additionally, try to expose your actual hardware blocks as colorops.
>> +  Define new colorop types where you believe it can offer significant
>> +  benefits if userspace learns to program them.
>> +
>> +- Avoid defining new colorops for compound operations with very narrow
>> +  scope. If you have a hardware block for a special operation that
>> +  cannot be split further, you can expose that as a new colorop type.
>> +  However, try to not define colorops for "use cases", especially if
>> +  they require you to combine multiple hardware blocks.
>> +
>> +- Design new colorops as prescriptive, not descriptive; by the
>> +  mathematical formula, not by the assumed input and output.
>> +
>> +A defined colorop type must be deterministic. The exact behavior of the
>> +colorop must be documented entirely, whether via a mathematical formula
>> +or some other description. Its operation can depend only on its
>> +properties and input and nothing else, allowed error tolerance
>> +notwithstanding.
>> +
>> +
>> +Driver Forward/Backward Compatibility
>> +=====================================
>> +
>> +As this is uAPI drivers can't regress color pipelines that have been
>> +introduced for a given HW generation. New HW generations are free to
>> +abandon color pipelines advertised for previous generations.
>> +Nevertheless, it can be beneficial to carry support for existing color
>> +pipelines forward as those will likely already have support in DRM
>> +clients.
>> +
>> +Introducing new colorops to a pipeline is fine, as long as they can be
>> +bypassed or are purely informational. DRM clients implementing support
>> +for the pipeline can always skip unknown properties as long as they can
>> +be confident that doing so will not cause unexpected results.
>> +
>> +If a new colorop doesn't fall into one of the above categories
>> +(bypassable or informational) the modified pipeline would be unusable
>> +for user space. In this case a new pipeline should be defined.
>> +
>> +
>> +References
>> +==========
>> +
>> +1. https://lore.kernel.org/dri-devel/ 
>> QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
>> \ No newline at end of file
>> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/ 
>> index.rst
>> index 396e535377fb..ef19b0ba2a3e 100644
>> --- a/Documentation/gpu/rfc/index.rst
>> +++ b/Documentation/gpu/rfc/index.rst
>> @@ -35,3 +35,6 @@ host such documentation:
>>   .. toctree::
>>       i915_vm_bind.rst
>> +
>> +.. toctree::
>> +    color_pipeline.rst
>> \ No newline at end of file
> 

