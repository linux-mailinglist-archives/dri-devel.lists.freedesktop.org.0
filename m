Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C749BAC8BC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBC110E569;
	Tue, 30 Sep 2025 10:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hloz7TLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17E610E569
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrpxOWQkF8N9e3gP0auzJVHDco5NIw49TP370k8T9r+liH7MhMdyaeyc5eAFawM384A6K/u4KFYB1/vBGBo4lXX9xE0JGS0FJ8jcTiZSizQHzh54mF7QQz5ojsAJx1+ZxLxhnEaaHMHmWeBRfbN4pR7395mnCvjXw44z6XBnp5QU1NzVdXFbxqZceQF8A7zQ6WBus/BpbgkNYFuc9xY6N2P81BECnsUoixrpCuk8qdXY1oObrcoDiebOB9x2Kr3ZE5PMqgBnC0z+FC81WTZrQbQkXhI7sNxWBJ/u2aqpXQei1BAV9b3VhNXH/sWoLrslE7ISz1JUoXBMjosu4u1Wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVLTfjsNZDBmsmODVIzVi7PAay6NjL4L5iRITo/JInU=;
 b=K9YbX0pIryzRS3pPkXBSqxt79Ertp1rP02chK5bsykBvY4XubAoj27xWX0ou9U+OfkyhxZ2yNVigI7ABKQXl+Kzd441V5kDKIRSHVF0yWh310Lymo+g/7z39cKnpJsMMRKbukiH9jaOr6p9iYvhrymwkeymNaxdwF0LsxWJ/p4Sn2ImGYpLKXQjaZlcvPU6yjkjyKfwudsGSFIZ5HFMHnAmtmI5VW3vsmcbzt7wkD6Pb54dkrCF5dowKHk9F/oBbFax9dh6BrJnE662Yrn8v8NbBMcPx7qIycpN2JvyYcjDHVJKxdFlpsX7t6VKdH5KESlfVhw/dVqe3I7FKFBG2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVLTfjsNZDBmsmODVIzVi7PAay6NjL4L5iRITo/JInU=;
 b=Hloz7TLOWBQAQhQE9kNo1eNHtz6JbJeAC7AZTCcoYcrk6BoG2Ir2jIQVhKp3poUhW3b4TWTv7ZKpWLx5C11bjbgVkuUmKWa4o3CdkPiQ38jLpKB3n9zabGOjHFf9rtTzfTHvAIWmjR0oCwLuIDiOTzXvFdT3/IulpO355NW7UTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 10:46:29 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 10:46:29 +0000
Message-ID: <7daaa321-effe-4cd5-9fd1-7d59512950ad@amd.com>
Date: Tue, 30 Sep 2025 06:44:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/16] drm/vkms: Allow to configure connector status
 via configfs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
 <20250901122541.9983-17-jose.exposito89@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250901122541.9983-17-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0057.eurprd02.prod.outlook.com
 (2603:10a6:802:14::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: e35e2d74-7b22-4803-b712-08de000e9cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tzk1Nnh6dlJScnh4bCtWdWdaL3V5a1pmL1p3S0VQSE5OcTlQaFFENjlaZ2xS?=
 =?utf-8?B?Y3o1RGtKTFBDemZmSmZXNVVEUHVEMUpSdFJzYW44STRnUTdJL0lvd1hwaU11?=
 =?utf-8?B?U00vdzRkaTlBWUlOZVBrcXlCcS80Zm9MSE5QTEhTUXc4V0p0OFBCZktOU0gr?=
 =?utf-8?B?L1ovVlBhTHBRSjhmN1JaVExVRkxzc1FnbCsrYTUraXhpNUduLy90N0JBN0dB?=
 =?utf-8?B?TVY3T0lXUEpoVGZoWEJmSmhOT2ZNS0tIaHVXY1cvZ2V2dnhSMnJ6RnNrMFpl?=
 =?utf-8?B?Z21RWDdGdURLMFRqSXRQdmtCSDh2QVZVNGVrVDZFSXEvM2dBRGdGWnprQTBB?=
 =?utf-8?B?WkpDenRFWmlmMzdQSlNSNW5DOFdUNklKMkpmTmdNNXJTL2IzamM4U041SVRw?=
 =?utf-8?B?SHBqaXgrQkxvVHVLa1h2ck55ZWFWcmRielpGMTFONGRuTnRJSHQ4N0xFOVJI?=
 =?utf-8?B?d3BGS2UzdS9QUmV0eExnWjFxQWpwVlNZMzJGdUNxbDNrSDZLMXh0QkpJeDk3?=
 =?utf-8?B?a1lYaDIyWGRzUTFJU2dtdGpxakhYSGxOcFVpTHNKQUJsbk5CczVaQW1Nby9Q?=
 =?utf-8?B?SlgrL2M0aWFyZy95aitHbVZhb2NCMUN6b3k1b3lWdGZMcWdMYnBsWm9KbjVM?=
 =?utf-8?B?L3V2OUpmSG1MdDhScktyQmoxd3BVNnZYeTNEZlZOTldrZXZDQUVwaXEzL1cv?=
 =?utf-8?B?MXFudUc0dUZOcGhVc0ZRUzIrYWJBU1Fjb0d5bkhMZGVCOUp4U0p4RVB4OTYy?=
 =?utf-8?B?RXliQWlNaGtkcHc4TXh2Q1VPMUp4N01tb2lwaGN2em9EekdnMTY5ZW1MUVVU?=
 =?utf-8?B?Z21KNmVtN2t5ZWNhaEwrbHBHNnhqdUxVM3R3bFlNTGgxMW1kUVJVYkd6TTJ6?=
 =?utf-8?B?TjQ4MEtNV29IZDFldVFSbjIxZm9nSW1YYVMyZkFQZnp0RjZianEwNGRTL0Iv?=
 =?utf-8?B?eDh3L1IrdGF6dkVoTnR5c2liTEhYL0Jpc2dqejlqb2h6eVluSktRdWRaRlFO?=
 =?utf-8?B?U2tBVlhmTU9sSExIcUlDa1FzV3JSQ2YyMkFjcTc3U2VDT2VkZTB5RWJEODFN?=
 =?utf-8?B?eVc0YlFQNTBYL0dDSTlMNDZuSmhia3Q5RnV0MWkvanJXMGpJaXIyR0NyaGl5?=
 =?utf-8?B?cTJkUEtIQUtkVXJYY3Mybm9EOGU4aWxrSGZYc1VEcnNFUkdsUk5SV0EyanJG?=
 =?utf-8?B?U2xYTEFZc1owSGUxbTI4V3B1WGxHU1l5WGl0OHhWa2FmYk54V3lIbjdLcEMx?=
 =?utf-8?B?cXpoR2dIb0QvUXg1UFVtclBFSURIRnlOckhxZFJDSXdYOGNPVlJIWlhUSjdY?=
 =?utf-8?B?ZU9UcG9yV01MMnBKbU44bkp0TVR4STFPa0Vvd2ZVWUJnSm1jTDhXTnhraVJp?=
 =?utf-8?B?OGVOMnZ3ZWRRTTg4cVNaY3BzVzFBbXV6UEJWTE5SUWxrdUZHdHlNOGt6aWFR?=
 =?utf-8?B?Y1k3VXdwdkg1V2lOTmlCUk51ajAwV2doVkU4S3dTY1BJSEY3V2ZZcmI2TDV3?=
 =?utf-8?B?ZmFGcW1aWkFjUml6enNTSk1MeSt6WDFsaHJKeHBhb1Jaa1JQQ0RvcU5YZXYy?=
 =?utf-8?B?TnRNeW93YkczOEN6VHNGMDc3L01JSmdXMFVzKzB5YUtWZGdpQ1FlTGRxS2pk?=
 =?utf-8?B?TUZ2NUFIc1hya0lBVnN1RHFTY2JyUmxOOS9wbHViM205aG4rSVJZR2RyWnhC?=
 =?utf-8?B?b1F3YWRFelc4TGJZcGFVZHI1MStsUzBlTnFJWndSdE9mM0hXSU9qZ3hUbWJp?=
 =?utf-8?B?NGZ4Q2xkRG5FalJuN3JOL1JpYmtWWlRrSUdEcWk1V3cxTlNWT2QxaVJpRlV6?=
 =?utf-8?B?T0s1YlQ2cGEwTXJEYnhTdW1VUTJ4Z25qRUE4U091S0loWWpUb3BiNTRqb0tE?=
 =?utf-8?B?V01HbHcyckg2ODBtd1lvb0MyZGd1ang5dVZNQjNSbmZUckdzaEdiVHdFcHdX?=
 =?utf-8?Q?cTZojgUMcgMQyGlrpbPfv5lqa0eJSiUv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHlVMTVkRDZld2hUemZIZXAvQ1BrdWFYdk1QVTdseWlUSjZodDkzSm93NVl3?=
 =?utf-8?B?a2thOWpqWkxBTVR6V01OL1ZOSjJzTzF3MUxrQWRWTy92VE13WFN2TkpFZkx6?=
 =?utf-8?B?dG9Ycko3c1p4MnZZOFduU00xWXQ4Wk5ITE5XU1R1d2w4aVphdFZTZHdZOGxl?=
 =?utf-8?B?Nk9rdjhMczJieGphRXBUK1EydFludHY2bDArUExQLzZRVEYwYk1Fano2OUt1?=
 =?utf-8?B?TjI3SzBxQmZLMXZwaEl3WmxTN1NKbjAxT0tZZ2k1dW9mV2NYcGk5cHp0bzZu?=
 =?utf-8?B?L1JNVm1KV1p6K01ObG04VnBrdnErNUdHaGhoa3k3OWtxYlQzM0pXL043WWFK?=
 =?utf-8?B?YXp1UENJRVRKdENnMmFUTU92WGtodERyZ0xWVWJIY2xtanpCdlBDcGVjSVNU?=
 =?utf-8?B?ZkdrMGxRemdLdUt4NElXeEdxVDBxR212Q3hkbkNNYVJYcTF3SFJ2MkYrS2V1?=
 =?utf-8?B?TjkxKzZaV0FMUzdab0k4Q1Nsakx1YXNWZzJlNHVLU2FhNTF2L2hPRmtyaHNt?=
 =?utf-8?B?RS9COTg1WjFNWjYvNkNpTHdtbVRjTXRCeVFmeVFCM3hCQTQ5aUs0aE1WYm5C?=
 =?utf-8?B?bitCUUQ0OFVqK1JSa0NHQ1FjV1ZPVFY1UVNIZkQ4Q0tZZG1IdzdpV0l3VWlh?=
 =?utf-8?B?clBwekJZVUQzZThoR3h3cG9jRHo4VUNqSU9WUExTY2ptUGozeXJpR0VpdmU3?=
 =?utf-8?B?L3Y2QlJuMHZQYVFTRmt6eG9QcGJyYUxhcXQzZW5WaHRNMnhWeDhjVlNnYm5F?=
 =?utf-8?B?dFl0V0FBUGVrSzFUdGhkR0pvZ0NaNlB0aXZudWx4RTNaR2Z6QkhjRjRMeWFM?=
 =?utf-8?B?dVhQKzM2ZkJrYWdBNVNwRXN2cHYybVgwMFJPUm0vVE9zMms2cFdpR3F1YzFm?=
 =?utf-8?B?ZlkwQjFENHBlYVhrbHFpWWw2OEliWmIrZEhBbEUybmlicDkwS3dmaVkyUTBo?=
 =?utf-8?B?WTBnZndOdCsyaDZTWVFQUTJldU84TlRVZlIxeHMzbHBTM1Y4NmcrN3R2cnVD?=
 =?utf-8?B?dlYzVURZbGlJamZvUmtsVEl3LzlucFd1UUVocVJkRWk3aGxHVW91MnBFSGJU?=
 =?utf-8?B?VU84VkFOOWduV3dBMHlwQzlvVzZVQk5kaTR3ZVY3d1JjcWJlbk16cEhVRDVL?=
 =?utf-8?B?RzVobisvQ09sZWtBUzBidzBlK1BEU1IxVThwd3RiYUJVSmIxdVhxM0Jid3dZ?=
 =?utf-8?B?VElGNzJPa0d3VmsyZXJOMGVqbHhLS3VqOWZwMGpnUXZZREh3UUpEK1dxNE5s?=
 =?utf-8?B?RkxGd3JnZW9WTlhNYmF0WVF5dXFsR0o3VzY5ZGk4cmY3WklhdzZOdUxWOG5h?=
 =?utf-8?B?SjBCd0p0dW1hUGJQT3J6VmhZR290bmoxeUprNWtxdzJpZUd2NmdObW5veUt0?=
 =?utf-8?B?YzJKVkJBVHZBNFJ4a0xJc3lDM1BGNXkzWWhNSkx5YVhPUVhldlVLMnNpMGdF?=
 =?utf-8?B?RVhiZzZzaVdMb0s0WU9zWHVqeXNUZHFBV1Rud1duejlnb1hzNXNqeGdGN1ox?=
 =?utf-8?B?MVFTWEtvSXZNUWpkdVNOaTJEbFdFZWRkQWsvSUJncUV4TDltRVhSVWFSbjFD?=
 =?utf-8?B?ZzNlbDNsMzRpbXhxMkJIdlA1VGtWK1BZN2wzQklHMGljaHlZVjN1cWhBMGhN?=
 =?utf-8?B?M1VPaW5nb1lINkhuTGdNTkNoampCUjJCZXFCUG0xdGR5N2twaytaSmkvSHFk?=
 =?utf-8?B?OVBTa2hYM2FJazdDS2g3QnArVmplcUV4VHIvdmZ5Qk1xSERMaC9pWlp1LzZW?=
 =?utf-8?B?d3FLc0FUWEdmUWpGeVFBVkg4anVvYkhVMGR0dkV4Njd6blhPQWNzZTFWSU5n?=
 =?utf-8?B?bFE3a0ljNkVUcjdldE1yQnlYUXdBODRZL0hqL1dRZXlQVVkvMS9OK2tBWGt1?=
 =?utf-8?B?amdYZjE4czhzdkZOcjhYZkdueWlNNWsrZTUvbnlkOVpyL0NkUzBjdU9uVTk3?=
 =?utf-8?B?WmUvZVkzRDV1bTNSTWtKTDg2WlFIcjhQcUM5ZXQxYTFZeS9wQ3JEYkhpS3g5?=
 =?utf-8?B?K3VXam96d0tsVVljNHFHOFE0MWRoeW9RQ01hUm1aUm9hK1BHU2gzQ1hoNmZG?=
 =?utf-8?B?M0pCLzYyeGVHZi9OYzJ2b2dVUFNpZG53ZldseHp2cCtNWHVMYzR5bElvZWs3?=
 =?utf-8?B?QkhQVXdscmcwYTJqTlNtS1U0Wk5wdjB0dENjWEc3bld0OUlYOFhYSnNhanVC?=
 =?utf-8?Q?YWpZSxFkNXMxi57Wm9UqAVc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35e2d74-7b22-4803-b712-08de000e9cc2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 10:46:29.4454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCoJ1K4WCAa52269T+OXv1DJNohfhEC6SYoovoEobaAYP0+3aap5U2ZMZ5edzO2/sTyxy9FLO7VS9QWwOXQdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
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



On 2025-09-01 08:25, José Expósito wrote:
> When a connector is created, add a `status` file to allow to update the
> connector status to:
> 
>   - 1 connector_status_connected
>   - 2 connector_status_disconnected
>   - 3 connector_status_unknown
> 
> If the device is enabled, updating the status hot-plug or unplugs the
> connector.
> 
> Tested-by: Mark Yacoub <markyacoub@google.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   Documentation/gpu/vkms.rst            |  5 +++
>   drivers/gpu/drm/vkms/vkms_configfs.c  | 48 +++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_connector.c |  7 ++++
>   drivers/gpu/drm/vkms/vkms_connector.h |  6 ++++
>   4 files changed, 66 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 364b574a8cae..3574e01b928d 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -108,6 +108,11 @@ Last but not least, create one or more connectors::
>   
>     sudo mkdir /config/vkms/my-vkms/connectors/connector0
>   
> +Connectors have 1 configurable attribute:
> +
> +- status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
> +  as those exposed by the "status" property of a connector)
> +
>   To finish the configuration, link the different pipeline items::
>   
>     sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 8e90acbebd6a..07ab794e1052 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -7,6 +7,7 @@
>   #include "vkms_drv.h"
>   #include "vkms_config.h"
>   #include "vkms_configfs.h"
> +#include "vkms_connector.h"
>   
>   /* To avoid registering configfs more than once or unregistering on error */
>   static bool is_configfs_registered;
> @@ -512,6 +513,52 @@ static const struct config_item_type encoder_group_type = {
>   	.ct_owner	= THIS_MODULE,
>   };
>   
> +static ssize_t connector_status_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	enum drm_connector_status status;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		status = vkms_config_connector_get_status(connector->config);
> +
> +	return sprintf(page, "%u", status);
> +}
> +
> +static ssize_t connector_status_store(struct config_item *item,
> +				      const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	enum drm_connector_status status;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	if (kstrtouint(page, 10, &status))
> +		return -EINVAL;
> +
> +	if (status != connector_status_connected &&
> +	    status != connector_status_disconnected &&
> +	    status != connector_status_unknown)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		vkms_config_connector_set_status(connector->config, status);
> +
> +		if (connector->dev->enabled)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
> +CONFIGFS_ATTR(connector_, status);
> +
> +static struct configfs_attribute *connector_item_attrs[] = {
> +	&connector_attr_status,
> +	NULL,
> +};
> +
>   static void connector_release(struct config_item *item)
>   {
>   	struct vkms_configfs_connector *connector;
> @@ -531,6 +578,7 @@ static struct configfs_item_operations connector_item_operations = {
>   };
>   
>   static const struct config_item_type connector_item_type = {
> +	.ct_attrs	= connector_item_attrs,
>   	.ct_item_ops	= &connector_item_operations,
>   	.ct_owner	= THIS_MODULE,
>   };
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 89fa8d9d739b..b0a6b212d3f4 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -87,3 +87,10 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
>   
>   	return connector;
>   }
> +
> +void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
> +{
> +	struct drm_device *dev = &vkmsdev->drm;
> +
> +	drm_kms_helper_hotplug_event(dev);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index 90f835f70b3b..35f2adf97e32 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -26,4 +26,10 @@ struct vkms_connector {
>    */
>   struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
>   
> +/**
> + * struct vkms_device *vkmsdev() - Update the device's connectors status

vkms_trigger_connector_hotplug()

(or something like that)

After fixing I recommend running 'make htmldocs' and checking for 
errors/warnings in the new changes.

Harry

> + * @vkmsdev: VKMS device to update
> + */
> +void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
> +
>   #endif /* _VKMS_CONNECTOR_H_ */

