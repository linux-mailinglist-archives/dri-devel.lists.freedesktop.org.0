Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E89B21705
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FD910E546;
	Mon, 11 Aug 2025 21:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iDNtXC3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A8910E30F;
 Mon, 11 Aug 2025 21:08:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcqXm6nxssgMNsBqOei0k1Xd7wIWnBM/Yz6fMS7XT3XvG5icCAQXNyAd2ew87PuEdTMkJWmZUxDgQz35bHvVU3Y32l6WfZslvCMg/eYnAKGf4f2ebjXZgCAzw5kT0MvjYlQhZuaY2dASsSKCsqmEgoMkUz6Nbc1hWPlK1bGzM9q2Xu9aj4zr/qkaPK8sgT18RB4Jn0wC7o+9wkIfaOHJN2e5UZRYw2IAosfSCZKaImfxGv1K/8gz8jfKuCmxCjXpazsRAb7BlsYcc1GlMuQchnm4ZEmONMt8TV8eBsoEv//i1IxfHKocgzT7LdKUL0XCLLWfBpL/JbB84+EJH746jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7JldhjUKRBOLtG4z8EhPT5iiAsMEia4z5M84bm591A=;
 b=jCXOpCFjI0VVNzindWXO7tiqFVYnZvGuITisKknAOnQcnMjaBoHvXNZOWibgM4Xk80xcqU/C7A0Pj/JQtsfRxAvJARhzAz4kYTQGVzNAKZ/d/lly/hizyVljty/hpza+67hjjmC7LPvHEDkJDYri/GLRVRVBjhy5Lm/hxt1OKvcII+IMujHcMUq2+b9iRYxmUsSiufa1d4TSriq1eJioB//Wji+Wx9lxCyEfFCkOqW9GQeuRx94ieOX3XbFNkEcUviCsMnndMzKEkWXmkAYfI96ICNF+xobZRs2CEAHq0XofqpmuImvnaXi4nDhnwT9d5rTC9ePIACfROp0gpcDQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7JldhjUKRBOLtG4z8EhPT5iiAsMEia4z5M84bm591A=;
 b=iDNtXC3lsIyUKpct3IUoHWPKpp3bkwV7HbAEJCLI4hcVN1zg2TOo9nmt9KXTcB5LGRJxl9/LfoUScjXfLhLOItiYmafMMl1ARu+Dzt1ShdZZKRbixmuTbhr5GZvPxIOjRRuDvGlJDzM6+Y/H+7NT9Wh+NKzfjvZK9YYrFn9LUiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by BN7PPF683A477A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:08:11 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:08:10 +0000
Message-ID: <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
Date: Mon, 11 Aug 2025 15:08:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
To: Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250726003816.435227-1-mwen@igalia.com>
 <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
 <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0333.namprd04.prod.outlook.com
 (2603:10b6:303:8a::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|BN7PPF683A477A9:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c82b74-21a0-492d-4d47-08ddd91b2cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHp5Qms0TjBVVXkxRkR5WEo4RUVNcmJXYU9FeXZpcysxbWp3QjlqWGlNTEc1?=
 =?utf-8?B?K3RMdGhSaE9QbHVRUG5KdUtHNnU3Mk84MWZtVzI0VHRVQjgwK2VkK0dRdHlk?=
 =?utf-8?B?djE4Z1MvY2JEb0t6SVJBL0NldjBkWlZ3Tk9NUnpIMHlZS3hVUytFa2JrV2Vt?=
 =?utf-8?B?cGhoY0hYTUhvZGpvbDdCRWZSWll0amc3Wm4zcW9LaFplelpVYUprTCs2TWNr?=
 =?utf-8?B?MC9IR2V3NUpQc1J5dDVQOUM4Z2VvTndwdlBkTlNPVDRkZGdwSWI3dmtEbHBG?=
 =?utf-8?B?YW9tRnRjL2hlaWlNUFF6aDk0UnVoZ1dhTjc3TXhvdzRoamFIQTZvdnNPMEh2?=
 =?utf-8?B?M1g5czVqVWRRZG53RlhoU3R6OEpYbWhjd0szZzRQSTFTaDIraUhYTzFqc2x2?=
 =?utf-8?B?VEZNc2c0S21OR21zQkY5cFU0TjZUbUZJRk1lRy9xY1hJdzVTTk1NRmlvRjZF?=
 =?utf-8?B?dW1aNnJJS2NzT09aNUJoVllaMGtuMnNzRDJGcGVSVkNUUmphSllVTFdReDFM?=
 =?utf-8?B?a21Paldoc1hkV1c5RWd0RTdTOEc4T3NGQ3dSM2xETmw1UXBtT0YxSnFTZS9D?=
 =?utf-8?B?M2lxSXpNNGVPQUhsU3kvLzlXTjFpRGYxWlRHVmFZSGZXd0tJd2M1L2xMR2NZ?=
 =?utf-8?B?RDhDWG54MWIwbGNzdnVFUnpEZkEwK0FQNlFFTnhoRTc5Z1E2cWh0Zk1Md29F?=
 =?utf-8?B?cmI0UXNWZm5tZFdFSmU1Y2NCVllWWThJRFhLM2tCQ2EyZUQ3Z0RXaTBJdDVG?=
 =?utf-8?B?Tzk2OXFMbVFkb2xWU1dBKzRRUy9LazVWMlhEQ0lTYVEwaDBINUFHK3lVakJq?=
 =?utf-8?B?TUFWSUFxYWpXd1ZQNUpoUU1jQ0owWStIR0E1ckVrRTBTRVZkMzZNaTgvSkNq?=
 =?utf-8?B?amhYSndLK084SXUxTXhDRmg1VWNOMldhQ01EZEF2YzBkVTVMd0lPM3hoSlNn?=
 =?utf-8?B?V0tlZ1FsK1lsNFhGT3NvNjJqVmJtNWhaeEs5YUx6ejNRb1loMDh4TGp2NHI4?=
 =?utf-8?B?L0t1V1BSb1ZJQ3NEVDlXT213dlQ3QjllaEY5TWplK2lFcnk0YkEwNmp3Yk5o?=
 =?utf-8?B?bkl0eGdKRFR6NlcybVpla1ZmQmRuQm56em1KSFU1VUFUV2FobTEzSVlLem9M?=
 =?utf-8?B?UGUvcmFMTUY0OFN3VTZrNTZYSVpEU3ZReXVYcGpFV29Ua3hwTm9CWm5OU0VF?=
 =?utf-8?B?VDZGQXM4Qlo2ZlU1R2tubjRiOHdScDNzYWIyZ2F0VlNyNE9NVzVENHExQXpR?=
 =?utf-8?B?OWY2bnF5NFVIOVByUUpZOVUxR3hCV2ZEWDJzcFdGVUJlU0pOTjQxTzE4UGFS?=
 =?utf-8?B?SVlnTzM4NTNXWnNSMWZITFpGUExSdC90N3FLdE9iYm5lUFFBZytIL1RxWVla?=
 =?utf-8?B?cW9Ucjh6bUNMRFRwNzlsMm5vYzVkaEIzTVB3dGgzZkNBWWt5N2t2K1E3YkZp?=
 =?utf-8?B?amkyNitDa25tVlViVDFKTVRPVG45cW9PcmM2YW5lSEdxRTdQT2lQdUEzdGg2?=
 =?utf-8?B?dmU0dGtPQjNMYnpFdUsvMHdxcnp4WEIxTW16NmVLWDZlajk3bmFPaHdGZXRn?=
 =?utf-8?B?YVJkZVpEQkN4SXo1WlBEb3E5RytlcjQya1NkQnJFVGo5M0kxNEhBL3M0Yml6?=
 =?utf-8?B?WWJQUDlsbFh2YWxKL0h5VmUrOFhwWk1ZSFZ3WFFhZW4vR0hrd0ZINloxR0xt?=
 =?utf-8?B?MkhLSW5nMWJsUyswRXlGd2ZUdk1ybWtWVWpjS0xVWS9YaUdhYitEeFloT3JP?=
 =?utf-8?B?KzBuZUo2bnh3dHV4TVZNWWF0aVpjaUZKZWtFREsyVFpGWFMzSHdYV2lSOWxX?=
 =?utf-8?B?L240aVNrMUZ5SytMMkJhU0MrMEVNR0EzTUNxUWluM1g2dExQZktWMWpWOUNv?=
 =?utf-8?B?NVllUWxPWUtlZGRDSzJEOHh5SGFLWk5HYlQ2WVJGTkF0ZlEwZlBZNGsyNy8w?=
 =?utf-8?B?TElaM1p4QWVDWTVSWGY0V3JGSk5zc3phendyR3I0TnRBMWlIRHBjRTdqZXBx?=
 =?utf-8?B?UE81UXdiSUdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0cxSHVCL2VJTmJmRUJFbHMvMnJrenIxVjJoRmUrYkN0ZDBsd0lvUitjSkg2?=
 =?utf-8?B?ZE91bjFMbE9LMiszREU3SkZtclUwTjVBR3JrS2cxQS9sUTF0QzRkUWlmMzJl?=
 =?utf-8?B?a01Rb3FYRHV6aEZsdDh4U2lGRHZuS3pZT0N1Y3FxYXF4NzVnTW93Y0dTZFFz?=
 =?utf-8?B?dStudHZMMGVsTjhPZnMrZm4yeStYT3FNcWx6dzI3NzF6UnJHV2t0aWFTVmVt?=
 =?utf-8?B?em5xOXFyWGJpWUtQQWdoYytaWVBXK3dOVXB6L2dNVEczM2tTUXFHT0dFMzhX?=
 =?utf-8?B?Mjl2RTBvMG5Ja3B2RG13Wk1RS3YzT0lBbWgwdEQ5cXJkSG5IRFFncTN3Zm5O?=
 =?utf-8?B?QTZmUXo1bVpwcFlrVkpSRldkWU5XNzBRT0dzaGJEQ2hjeVJTczVBY1NxSG9o?=
 =?utf-8?B?dnFLQjlSdWJza25qeklHMzdFTTlzSnJZL1pMMFVudUxPbTdUWDJMNzJ5U0V5?=
 =?utf-8?B?TEFnKzh3dmYwQkR0TGpQSEJkUjBNN1loR3hmaUZReFQ3NEdMY2RmejZIK1Ar?=
 =?utf-8?B?bXZNN0RYMWZYbUNRUXpTVzMrU0RJVVo3VUdnYjJBMW5jNjlwZjdKcTl0YVFh?=
 =?utf-8?B?cnBpd0ttZzRwQnJwNnpKSWlVaHkwaE82elFVQUE5QmRQVThuTFZkS2Z6NmlM?=
 =?utf-8?B?YkcvNFh1dDRTYU1TcUdYWmJIZXZnRFVuZHM2N3lMREFodHZqWkhjMnllNVRs?=
 =?utf-8?B?V1F1NHVVb0RocDRMZGtxZ2tidXptdjkrcmFjMk8wK2xYK3ZVNjlkTVNTRzRz?=
 =?utf-8?B?ZjV5ckZwMGJZbTE3MTNMbTVIalpPek8vTGJmdmdPbTV4Z2d3cFFHalBWQ3ZK?=
 =?utf-8?B?V1NPREFQNDdvcmFsNXNkYXhhc3Vla0FtcG55a1NDUHlSa0RNWmk0dmxsa3BR?=
 =?utf-8?B?cDFjeXM5UVhRVC9sMFRxNXo1ZCtMUzJnUjA3NDN1RHZ2RmFTT2tLclA3TUJP?=
 =?utf-8?B?dERoK1pMdmpESTZid1lBQi9wb2N6dWdFL0ZnN29BeWlvTFF0cVZEaHNRUWFQ?=
 =?utf-8?B?YjgzdThHdWRUdjJKTXUySWhWVkxyVWRXMkZUQ201NW5uZ29wR2hSTVRtTjVK?=
 =?utf-8?B?cHlQVzh1eFB2MWxiVlE1bW9odDY2QnBSNVRIUC8ycnBkbnl1SERFOWNOanNt?=
 =?utf-8?B?T01mVTVBNlZ4ZHB6Qklpa3ZNemd4MEV3WkRPM2ViT1lNRTl6ZmZlUUwrWXV3?=
 =?utf-8?B?RHVKTEVYb3ozT0RWNlE4Zm8yWGpOOGxONm9PRFdkRXo0Zlg2YStjMXVpVmFr?=
 =?utf-8?B?eC93MkcvVmFsenBOYVo2T0llUXFWa1lubDZIT0NmSEdlM0xrSHZab0YyTEd6?=
 =?utf-8?B?MERCdEJUU1R3aGc1cTRETW1iUzJwam40NU02bDNrdnNoMjdPWi9QNnlVS3lz?=
 =?utf-8?B?UDBEaHV1dWlDL1cxWmV5V1A5VW0rblhVTjNONFRrbVlERUc1TjNseUlsMGsw?=
 =?utf-8?B?TDVxNTVNdE5TSkRQVUs2UFJ3bHhCOWVXRHIyODhuSkVlVFB6bmk3UVRFelFV?=
 =?utf-8?B?aXdHQjh3OHZJZXVjQy9yL1BqL1lGaGg0VVZnYkdRNXc2MWJJQXp1aDNWNXVk?=
 =?utf-8?B?QU1tKzFDSGVkNytQNThTZmk2ek9KYjV3cHJxVHNXMGJzOXVCWTNDR0FlMXdF?=
 =?utf-8?B?WFJQU0dGR2hIZ1AyR0syVXJvWVpRQ0oycCtka29QRWZMN1ROS0hVOHhkYm1R?=
 =?utf-8?B?RXdESkMrYzNjV1RrTVIzandydjhHN2pXZXdIcitkeENYNGdKWHBqSUlaeVZO?=
 =?utf-8?B?czFzNXVDRS90elNKUjVnZTlRQ09sVjZnZm5SZmV0N3N1Y0hoOXA5VGJ5elM0?=
 =?utf-8?B?cDRCRlBHZFBTMDZpSTJlNGJjMEczZXNveGlUN0ZQZW5jc1lvZnd5T3JYSUxI?=
 =?utf-8?B?NjNHMmtZSWUwY21CNTZKZXRSbjRWaWJxWldmNHZzYm1qVW9jc2ZqZG9iTWxk?=
 =?utf-8?B?Q3ZyYk1jaStrL1ZpQmw4Y2Y2OCsvV3RQL0Nac3BDZnA5YkFTMytMK1hPNE5R?=
 =?utf-8?B?RnlQU2pXTkhvQUduc0RNWmNnTkRwRnhnOHpmcVFWZFprY2ZLL28ybVVweWhZ?=
 =?utf-8?B?cXBXak53TDB5b1hINzB4MFR5cnl3RjI3SG9DdHhOVkRZNmt3ckc2TUFqNjNq?=
 =?utf-8?Q?XHC2XuvSZdAcP0Tn5ClBMklyh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c82b74-21a0-492d-4d47-08ddd91b2cf4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:08:10.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rQtkGlYELv+lTLIO65ltvTBel0QCUx7XxyYQb1xN85vj4aWS0ev2KWDHiZJgmlgg0E8DNqD4P9GM8zcj5FbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF683A477A9
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

Melissa,

The patchset passed promotion and CI.

However, since our DC code is shared with the other OS, calling drm_* 
functions in DC won't work for us. For example, calling 
dc_edid_copy_edid_to_sink from dc/link/link_detection.c in patch 14.

I don't have a good way to handle it. Does it make sense not to touch DC 
code for now?

On 8/11/25 13:40, Melissa Wen wrote:
> 
> 
> On 28/07/2025 20:29, Alex Hung wrote:
>> Thanks. I will send v6 to promotion test.
> Hi Alex,
> 
> Any news about this round of tests?
> 
> BR,
> 
> Melissa
> 
>>
>> On 7/25/25 18:33, Melissa Wen wrote:
>>> Hi,
>>>
>>> Siqueira and I have been working on a solution to reduce the usage of
>>> drm_edid_raw in the AMD display driver, since the current guideline in
>>> the DRM subsystem is to stop handling raw edid data in driver-specific
>>> implementation and use opaque `drm_edid` object with common-code
>>> helpers.
>>>
>>> To keep DC as an OS-agnostic component, we create a mid layer that
>>> isolates `drm_edid` helpers called in the DC code, while allowing other
>>> OSes to implement their specific implementation.
>>>
>>> This work is an extension of [1].
>>>
>>> - Patch 1 addresses a possible leak added by previous migration to
>>>    drm_edid.
>>> - Patch 2 allocates a temporary drm_edid from raw edid for parsing.
>>> - Patches 3-7 use common-code, drm_edid helpers to parse edid
>>>    capabilities instead of driver-specific solutions. For this, patch 4
>>>    introduces a new helper that gets monitor name from drm_edid.
>>> - Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
>>>    code in the DC shared code
>>> - Patch 10 creates a mid layer to make DC embraces different ways of
>>>    handling EDID by platforms.
>>> - Patch 11 move open-coded management of raw EDID data to the mid
>>>    layer created before.
>>> - Patch 12 introduces a helper that compares EDIDs from two drm_edids.
>>> - Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
>>>    free `drm_edid`.
>>> - Patch 14 switch dc_edid to drm_edid across the driver in a way that
>>>    the DC shared code is little affected by Linux specific stuff.
>>>
>>> [v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1- 
>>> mwen@igalia.com/
>>> Changes:
>>> - fix broken approach to get monitor name from eld (Jani)
>>>    - I introduced a new helper that gets monitor name from drm_edid
>>> - rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
>>> - add NULL edid checks (Jani)
>>> - fix mishandling of product_id.manufacturer_name (Michel)
>>>    - I directly set it to manufacturer_id since sparse didn't complain.
>>> - add Mario's r-b in the first fix patch and fix commit msg typo.
>>>
>>> [v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1- 
>>> mwen@igalia.com/
>>> Changes:
>>> - kernel-doc and commit msg fixes (Jani)
>>> - use drm_edid_legacy_init instead of open coded (Jani)
>>> - place drm_edid new func into the right section (Jani)
>>> - paramenter names fix (Jani)
>>> - add Jani's r-b to the patch 12
>>> - remove unnecessary include (Jani)
>>> - call dc_edid_sink_edid_free in link_detection, instead of 
>>> drm_edid_free
>>> - rebase on top of asdn
>>>
>>> [v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1- 
>>> mwen@igalia.com/
>>> Changes:
>>> - rebase to asdn
>>> - some kernel-doc fixes
>>> - move some changes to the right commit
>>>
>>> [v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1- 
>>> mwen@igalia.com/
>>> Changes:
>>> - fix comments and commit messages (Mario)
>>> - remove unnecessary drm_edid dup and fix mem leak (Mario)
>>> - add Mario's rb to patches 5-7
>>>
>>> [v5] https://lore.kernel.org/amd-gfx/20250618152216.948406-1- 
>>> mwen@igalia.com/
>>> Changes:
>>> - fix NULL pointer dereference (Alex H.) with the same approach proposed
>>>    by 7c3be3ce3dfae
>>>
>> > --->
>>> There are three specific points where we still use drm_edid_raw() in the
>>> driver:
>>> 1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
>>>     drm_dp_dpcd_write(), that AFAIK there is no common code solution 
>>> yet;
>>> 2. open-coded connectivity log for dc link detection, that maybe can be
>>>     moved to drm (?);
>>> 3. open-coded parser that I suspect is a lot of duplicated code, but
>>>     needs careful examining.
>>>
>>> I suggest to address those points in a next phase for regression 
>>> control.
>>>
>>> [1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1- 
>>> mwen@igalia.com/
>>>
>>> Let me know yours thoughts!
>>>
>>> Melissa
>>>
>>> Melissa Wen (12):
>>>    drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
>>>    drm/amd/display: start using drm_edid helpers to parse EDID caps
>>>    drm/amd/display: use drm_edid_product_id for parsing EDID product 
>>> info
>>>    drm/edid: introduce a helper that gets monitor name from drm_edid
>>>    drm/amd/display: get panel id with drm_edid helper
>>>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>>>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>>>    drm/amd/display: simplify dm_helpers_parse_edid_caps signature
>>>    drm/amd/display: change DC functions to accept private types for edid
>>>    drm/edid: introduce a helper that compares edid data from two 
>>> drm_edid
>>>    drm/amd/display: add drm_edid to dc_sink
>>>    drm/amd/display: move dc_sink from dc_edid to drm_edid
>>>
>>> Rodrigo Siqueira (2):
>>>    drm/amd/display: add a mid-layer file to handle EDID in DC
>>>    drm/amd/display: create a function to fill dc_sink with edid data
>>>
>>>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 109 +++++++-----------
>>>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
>>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  39 +++++++
>>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
>>>   .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
>>>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
>>>   drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
>>>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
>>>   drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
>>>   .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
>>>   .../drm/amd/display/dc/link/link_detection.h  |   9 +-
>>>   drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
>>>   drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>>>   drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
>>>   include/drm/drm_edid.h                        |  10 +-
>>>   17 files changed, 199 insertions(+), 164 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>>
>>
> 

