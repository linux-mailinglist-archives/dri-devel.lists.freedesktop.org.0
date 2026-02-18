Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFMXIgOHlWnZSAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:31:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B567154BAF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2410E599;
	Wed, 18 Feb 2026 09:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vpxzYaSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F148A10E033;
 Wed, 18 Feb 2026 09:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eom8+Wx6A/3sV09GxrYGHVOW8jZ78BrFwWVG0QxykfHEuOCXWFafP18Bx/KmRYWhAkRbUc4x73YGviedgiO+Eio75Zg61PwjWom9VoLtYlDaFaRDOEAil3EY9D3/Xz4uYXOJQS5PcrcPcIpuxAKk4W5MnbrICW42yAmW2fg4TDxxPJMRH03Cnun+YJBU1+X7+y3PJJZIOWML5xzPiKH4v3O2cfzFE5/BWHvi5Jt8kMRYDVuv8xtXXKYWDg2xhul/nKc3sor8/RT+zQQC+apvPCxs84GgQ1sctB/2tHIfRScquoL16nuYwK05mzhKsy17ngazI1+HzrnJCnk3YUeBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOZ3HOuit8rMk5BOlsLtkIcHXjzNQa6Hla9xVuGdAuE=;
 b=Hrxf1oNO5JOkThki0b1ksPwM+8HEVWCDztcWfWnT0jlAuRFuFfdTygB8mR5m1qopytK+pHigMQBWXptKKZxVf8nkqg7sdAwvIPSH3qhdKOnOGwyKwaigLTGfV81ski+F2hG9yMczulTIKnvSGeZlq8xP4QOmvvKaZe3xmWwNulAurTNG0UAJpW7s/M2C/H2BgOtoe0BtGl4O52hhbs3Ph4rJR6nEVarYx8OJMbmIBf7FLb6RQvxEmpkeJrKRW3nyJcJ9xkWvwe9KHwtF90MQRlObc0ZT+Jk5amv/GLwPhDfHVF99Gp4lS3ay29GUFbPvohega576Py15sa8ZwgdTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOZ3HOuit8rMk5BOlsLtkIcHXjzNQa6Hla9xVuGdAuE=;
 b=vpxzYaSojapobXjB13CgXIprkf4oAFlDdeo5RCMHPaqVPfB8GcwXp6D0YVIe69vhde31DVTKPtrZMg3n77NLVp+BG11mcPlcY8BDbSOIUoYBjrKrzrIcWFZhmQnxSRSACTErS7XAcQLqEcJrKObpoxbyc1E6K1fhs31lEJ4+huo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 09:31:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Wed, 18 Feb 2026
 09:31:35 +0000
Message-ID: <27b9da4f-bd6f-4426-a5fe-94e0afdbae70@amd.com>
Date: Wed, 18 Feb 2026 10:31:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm: introduce KMS recovery mechanism
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Alex Hung
 <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260212230905.688006-1-someguy@effective-light.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260212230905.688006-1-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LV3P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 80943873-a18e-4f8a-8a4c-08de6ed08234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWEzd0VqS1hJYTdON0hmd2xrcko2WUQ5aGtmYWZXYlJ4SmZlNFJQSWRZZUc4?=
 =?utf-8?B?dU5ENlhRU1FBWlFzUDJlbDlVbjZ3alg4dWorbi92QUJIMEpsNnl0cXM0bHRq?=
 =?utf-8?B?ODRnM3BJc1laY2Y5aGEra2dwTmJYMitCdTZSVWhUQWprVTlBVk1VYWozcVh4?=
 =?utf-8?B?MDhGYjdKWFVjMzB3cEtXSllXVHNYQkFhMk5iT1AzcjYyc2FCd0FGMHZ6c3Ft?=
 =?utf-8?B?WEliM05GdUpYMk55dkxDSzhOUGkvWE9PVzQrdkRRWHV6bU53NVV0TXplanVV?=
 =?utf-8?B?WWVZM3ZGZEhETjZLZVZOOEJ5ZkxWNk50ZEtWaVdwbWIxRC9vTnRtc2xpaEh6?=
 =?utf-8?B?cTBzMXNnN1kyMmpGeEFRUkhHTVlHUFpYWHdEa3FzSlpZNEp5SllxRGFCMXBX?=
 =?utf-8?B?cFptN2IwcEVBTWdJR0ZNb0cvMkphdUlBb3Y0cVJYeHRvTWt6VE9LSkJqaVEv?=
 =?utf-8?B?ckp5dHNNeWh1QXdPSXp6UzcwSWhRcks5N3AzaTJNdlVPUk5zSktZWkdUZ2VL?=
 =?utf-8?B?U1VpSXlsOFc4QjdOaEVBL05BZWJPdkxFbmxqREhPTHhZRVNES2NnQjhQMDVL?=
 =?utf-8?B?aSt5Sjg4ZXh1SFJNeWRtUUFIUCtTOWJGTGp4dExrMVZaT0lXbE9tcFVKdWZM?=
 =?utf-8?B?dUpRcWtkWSt2bXhockdsVjlaTUZVWFBtMTduZENPeFJvWnVFU1huVVRXckFH?=
 =?utf-8?B?ZGZpdlVUMkpaQmNUK092RjZ5a3BzUVNUYm9GWTUxSDZiWXdtdGxtWmlVL2pL?=
 =?utf-8?B?UW53VTFLNVJDaEVmdDEvb2JmYnlaZVFYYzZyQm02cEhsRVU0RU51YXBkbWMv?=
 =?utf-8?B?MVM1bDN0TFFFUlhjSnJtRkhjZjhydEhxL0JKQzBvQmNwZVpRbWVDYS9ONXNk?=
 =?utf-8?B?dGF0cEdGME9scTI3NU4xZm5LNjdpVG5lN09Fc0xYNzFJS2NVV1QrQ052Qld0?=
 =?utf-8?B?dUZHKzdreUR5ZVJWbG9IcVJQWHQ5Y0ZVYTErTmRKQ2ZxVVEvOHhFSXczeDY4?=
 =?utf-8?B?WndzYzFiMTZyNXYrSmxBUW0wcGYwbnFRNk9hQ2lGTDFkMnRMdjh2ZVhqN0oy?=
 =?utf-8?B?N1kwQk9YNG1LTG0vcExEYnpBSXBpRjA0OG4yM0V3VTJpOE5qd3JNLzhIc1Fo?=
 =?utf-8?B?Z1ZIVFk3OWtGMFhlN1l3bk10YkRHVkd0Nk5UQnBkT1hSbE9wZFZRYjlXNS9y?=
 =?utf-8?B?dG1HMFRRUURwTURTR280ZjlCa2NWUmMzbUJyR3NaTXErWjIrVks5OXZkTkRX?=
 =?utf-8?B?bkZ2S3NJUmVhUmpBZmFnc2J5MDNrMTlDdnA4U3c3bU11L3lNTGE0WnE1V0k4?=
 =?utf-8?B?VUF6ZkIvSG9XclpQaC9VRVQrQ3RHZHo1cjhqZWxnTVd2VWR6dGx0ekFHTHNQ?=
 =?utf-8?B?bzRCeWEyNU9zZEs2K1hZUDVYQkRnTVhFVEhDR3RVR1I0UkZ4Umg2aVF4MjUx?=
 =?utf-8?B?UmtLY2NRSm04ZXppWjBxc1dYeXR0R1BBMzBXdUQ4OCtaVlFPZ1hpOHhUdmpH?=
 =?utf-8?B?NXFuYldEOC92aEtIeVZJQUdPR0JvZjAyZzU3MlhwbGxWbjFJRGRFb2UrNitC?=
 =?utf-8?B?Y0RkZXJ6bXdoV0VqazV4UjlpVER6aTc3VkJTcTQydDFZNFF5aE4wSFRIS0ZX?=
 =?utf-8?B?SnlCUFZ2d0lsT2pwOXN5TDdpeWlKTW5YUWJLM0FqZWlBSUJEQ3ZJdHNnTnky?=
 =?utf-8?B?L1cyS0tydFh4QVA1a1BWZWJFWmxsK2ZSZm1RN2ZiTVlINHZUWGlLbnVzWFhu?=
 =?utf-8?B?QVlxT0Q1ZUJORDlvSi9HMXk2VHdSM0xSRjlmUXk1eVZtRmgvTlB1OHZEaXhJ?=
 =?utf-8?B?WUFKZUlOZjFkSm5wdUlFTTdrL3NpZ3F1ZDQyWnBzN0dpRG11ZFpnVkFiT1BB?=
 =?utf-8?B?djdiZ3laVU5reXc5Qy8zSFBJOFNkK2xmWWRTVndNdU9lY3FWR044YjB0eWxY?=
 =?utf-8?B?MlZEZG1EZ0JkbkFWK0FHR2RERTEyT0xSU0cyV0UwNU1UVXdUTjg3ZlRmekVL?=
 =?utf-8?B?M1V5djNJS2QyMjZMY2hPQ2w0OHMyMmppVWNCN2dPZFJnY3NLbEkvR3FFWEZs?=
 =?utf-8?B?OWN4YzB1Q1VyZzdXK295cFBZOTQzZDZ0NzV3T1dLU1VINnhtTzNTckNTVWdD?=
 =?utf-8?Q?TU1E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG5XU3JDRWlhRDNZOW9Sdk5yWUhnSVJzUFgwTXVscmtidTBzOHdoaTY3ZzFr?=
 =?utf-8?B?UndlOVVJc0VZbkpuWXJyeTlING1QNjVQYzVldzFhQXBiNktVVTZ6Mm44a2ps?=
 =?utf-8?B?RFRpaDYxUmFibUlOUHpDSVAzV3lDLytiV1cxSUxZM3JnUTlqb2dBYlNFU3dH?=
 =?utf-8?B?Z1J4YWpYWWd5VHBHT1BWN2xkNXAwajNsd0ZwTE1PZFBWN2Q3cXovdEVyeVhr?=
 =?utf-8?B?dk83Rm9nYy9wT1ptQVJUanVLSW5rSkhyZlMzRWVFQUJQR1B4RXF4M3BWd1FS?=
 =?utf-8?B?cUt0cXFQQVdNWGR2RGc5Tzdva3lzN0xBc3BUMy9Jdnk4RUpFZ2ZLdm9QVUJU?=
 =?utf-8?B?TDN2OVBtMWNkakh6OUNtNHJZMXE1bmEvay9jWkl2YnJWa1d5NmMwUTFFTEN4?=
 =?utf-8?B?NituWHo3cE1yaVRaSlFUNFhHSW1UeWIrTFJFQlZGTkZjQjIwenlUQ2lWMldq?=
 =?utf-8?B?cWsrYVM5ZS9pSk01ajg2OWFDdGxscE5lWng2bGNDQ0Z5NTEweGdSSWpiSnVJ?=
 =?utf-8?B?ZUZTeThLK1ZYZTdaemZTV0FySDFKTjByOEczSm5wU0ZmbUU5UHA3VzFOdG44?=
 =?utf-8?B?a1U0WWloTmhyRTJlSTJuSENDMnhMakJxbHo0L2lNYmxoVlAzMzZtbkNWaWht?=
 =?utf-8?B?c25lZCswL3FMWWIwVlFMOXdLMnVnaTdTL1N2YVhEZzZ4ZW5RWlRzN0YxdUJr?=
 =?utf-8?B?eStvQncrK1ZCVkpsa0xwWmdlWFJ6NWFnY1l5NUwwV3FPWnY5TTlzZG54aEQy?=
 =?utf-8?B?UFVSckliTExDaEMyWHduTGE0NFdzSkJ1bi8wbVh5RGhoakxiS3BqL0d4V3d3?=
 =?utf-8?B?czZsa08rbEZ2cUFtc3RPSUh4TStrTDFEYU5qWG00eFZkNXQ0NHVaM0VyL0tB?=
 =?utf-8?B?ZlUxRUpSQlVUT0JDTnF5SmVmTThnYzhCTmdlb2lpTFFlNGpld2hJQzFiaXBX?=
 =?utf-8?B?RnZkMm4wbVNiL25vT29GNHFDOExyRGNXYWVVdUZwd2tSZzd2L0VVdjhjd3VC?=
 =?utf-8?B?S3NqVjdoMUtNem9Ld3o5cjMxSXZ4Qzd5VG1ac3lnRFI3eEVBTmRoZDA3S0w5?=
 =?utf-8?B?TFBSNzJ6R1ExT3pLUmFOOUxjcSt6UFZyRlVtYmRhNEMwYXMvN1ExWVh2WUtR?=
 =?utf-8?B?Njl0N0t1U1dvVzRPaTdVQ0JmWW1sZWUwcVovVVpSVnRkTEFnRm44WnlacDd1?=
 =?utf-8?B?aFNPUkppejVNVjhudWRUb1M5RFc0U1docjRuV0Z5OVJ0VzBVdGFIeGxpRTBY?=
 =?utf-8?B?RTRYMGY4Z0tETzJUeFp1b2ZvMnUvNFB5NlozdFNLV09KWVhKMUxhMk9JQ2FL?=
 =?utf-8?B?UG5KVzVaL0I1bW1KOFBPalQwalROcXBtZHZPU2pITzdBUG9Ca3ZlTFpOdldh?=
 =?utf-8?B?ZVY5a3pjNHdsdkFiZllYanQ2cERvS1dheUtIVmJkNzhOc0l4QnFBdnREY0Ns?=
 =?utf-8?B?a0ZDa3VVNGZMOTcxRXBDeWhjV1JEUEJVcmlBdEpYc05zZzVnZ3hNc2YvcDRo?=
 =?utf-8?B?dCtnaWNHRERMOXFpSmV6b1ovdEFydzVMRG40RGVBdXZrelJ6YW1DQUpkakJp?=
 =?utf-8?B?S1RhcXFRMmRBMjhSeDdCUGpYWlV4ZkZiUmxYOUExOTNtMWRnUGdITzlCbHFS?=
 =?utf-8?B?UURya3luRzFmR21NbzJJQzgzdVdTMnI3RHJlSEJ1WUZrbkJKTlhSdk1mWDAx?=
 =?utf-8?B?ZUtmL3JzZjBTeHh2RzNaWTNYeVdZTmNLY0RndEs3MEpkS0lvTDRhVmVSNnF6?=
 =?utf-8?B?elpEZkVsdFQxbk5lRFAwWXllcExsbDF0QkJ1Z0MybmlvNVVSU2dQdVZZcE5k?=
 =?utf-8?B?UnVxOE51OTFlajNFejVjTzVZV25LdC9BZVk4ancwd0VQZ2dhekpNYXk2QWN3?=
 =?utf-8?B?YmRrZ0VhTVp2Y2ltSmdyYkRnN1huNEZKSDJsTys1MStmZHZYZ3BGaHZhSUQr?=
 =?utf-8?B?ZFNnUTc0SFplZFh2NkJXbzdvWjdqUEN4NHpmTkZpN205WkdyYVFOU3FIY3p3?=
 =?utf-8?B?U3BpbStkSHJiUEk4eWJwTVRmVVNvSVNvaWhVdSt4bzdVNC8vaVNsazFsRkpk?=
 =?utf-8?B?RWxEalpxZmlvZE5oVnV2Y1VsQjVSYVpKbjBGcXMwQndGQ0RzZ3VSdGFsTTlH?=
 =?utf-8?B?QUtlcTNPWVpwNHhEL1VESjc0N0drcXpPb05kbmZCbVJpWnR0NE12MHFhQk1h?=
 =?utf-8?B?anJ2SE5DOGQ0bmlNYjlneFB4cWhZd0RKc0VFbzBhLzZCVzR2WlZYQVUzRjlF?=
 =?utf-8?B?THQ1WE5KQm9BZWhDMXhrY0o5YjNzbzdlQi90a3NqOXZML3I0QWIvRUUvSDJi?=
 =?utf-8?Q?RgdpAUo2gwQINRQNK/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80943873-a18e-4f8a-8a4c-08de6ed08234
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:31:35.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6etiqS09F5sHr4SuEw0r0wWOCzOiliXi6QQEJTNQQhHSqCpvZP4AgrPGd3m2lMw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 9B567154BAF
X-Rspamd-Action: no action

On 2/13/26 00:08, Hamza Mahfooz wrote:
> There should be a mechanism for drivers to respond to flip_done
> timeouts. Since, as it stands it is possible for the display to stall
> indefinitely, necessitating a hard reset. So, introduce a new mechanism
> that tries various methods of recovery with increasing aggression, in
> the following order:
> 
> 1. Force a full modeset (have the compositor reprogram the state from
>    scratch).
> 2. As a last resort, have the driver attempt a vendor specific reset
>    (which they can do by reading the return value of
>    drm_atomic_helper_wait_for_flip_done()).
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: new to the series
> v3: get rid of page_flip_timeout() and have
>     drm_atomic_helper_wait_for_flip_done() return a error.
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 45 +++++++++++++++++++++++++----
>  include/drm/drm_atomic_helper.h     |  4 +--
>  include/drm/drm_device.h            | 24 +++++++++++++++
>  3 files changed, 66 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5840e9cc6f66..6ae1234b9e20 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_self_refresh_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_writeback.h>
> @@ -1864,11 +1865,15 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
>   *
>   * This requires that drivers use the nonblocking commit tracking support
>   * initialized using drm_atomic_helper_setup_commit().
> + *
> + * Returns:
> + * -ETIMEDOUT to indicate that drivers can attempt a vendor reset, 0 otherwise.
>   */
> -void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> -					  struct drm_atomic_state *state)
> +int drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> +					 struct drm_atomic_state *state)
>  {
>  	struct drm_crtc *crtc;
> +	int ret = 0;
>  	int i;
>  
>  	for (i = 0; i < dev->mode_config.num_crtc; i++) {
> @@ -1881,13 +1886,43 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>  			continue;
>  
>  		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> -		if (ret == 0)
> -			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> -				crtc->base.id, crtc->name);
> +		if (!ret) {
> +			switch (dev->reset_phase) {
> +			case DRM_KMS_RESET_NONE:

That state machine is driver specific and so doesn't belong into DRM.

So please completely nuke that and just return the error code to the driver.

Regards,
Christian.

> +				drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_FORCE_MODESET;
> +				drm_kms_helper_hotplug_event(dev);
> +				break;
> +			case DRM_KMS_RESET_FORCE_MODESET:
> +				drm_err(dev, "[CRTC:%d:%s] force full modeset failed\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_VENDOR;
> +				ret = -ETIMEDOUT;
> +				break;
> +			case DRM_KMS_RESET_VENDOR:
> +				drm_err(dev, "[CRTC:%d:%s] KMS recovery failed!\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_GIVE_UP;
> +				break;
> +			default:
> +				break;
> +			}
> +
> +			goto exit;
> +		}
> +	}
> +
> +	if (dev->reset_phase) {
> +		drm_info(dev, "KMS recovery succeeded!\n");
> +		dev->reset_phase = DRM_KMS_RESET_NONE;
>  	}
>  
> +exit:
>  	if (state->fake_commit)
>  		complete_all(&state->fake_commit->flip_done);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
>  
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 53382fe93537..298c8dff3993 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -79,8 +79,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  void drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>  					struct drm_atomic_state *old_state);
>  
> -void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> -					  struct drm_atomic_state *old_state);
> +int drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> +					 struct drm_atomic_state *old_state);
>  
>  void
>  drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bc78fb77cc27..1244d7527e7b 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -66,6 +66,23 @@ enum switch_power_state {
>  	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>  };
>  
> +/**
> + * enum drm_kms_reset_phase - reset phase of drm device
> + */
> +enum drm_kms_reset_phase {
> +	/** @DRM_KMS_RESET_NONE: Not currently attempting recovery */
> +	DRM_KMS_RESET_NONE,
> +
> +	/** @DRM_KMS_RESET_FORCE_MODESET: Force a full modeset */
> +	DRM_KMS_RESET_FORCE_MODESET,
> +
> +	/** @DRM_KMS_RESET_VENDOR: Attempt a vendor reset */
> +	DRM_KMS_RESET_VENDOR,
> +
> +	/** @DRM_KMS_RESET_GIVE_UP: All recovery methods failed */
> +	DRM_KMS_RESET_GIVE_UP,
> +};
> +
>  /**
>   * struct drm_device - DRM device structure
>   *
> @@ -375,6 +392,13 @@ struct drm_device {
>  	 * Root directory for debugfs files.
>  	 */
>  	struct dentry *debugfs_root;
> +
> +	/**
> +	 * @reset_phase:
> +	 *
> +	 * Reset phase that the device is in.
> +	 */
> +	enum drm_kms_reset_phase reset_phase;
>  };
>  
>  void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);

