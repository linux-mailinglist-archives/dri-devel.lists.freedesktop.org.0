Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A999CDB60
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 10:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BF510E829;
	Fri, 15 Nov 2024 09:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="We7VZZqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E7B10E3F4;
 Fri, 15 Nov 2024 09:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf7ekMMAlY9lPAGAmzxm8eFGUee1LoVMG8We7TglS36bpLyVAE7iiSoVIU0LUC1CZ+cWnTGs90RoS/LhPBxh2YikER1TTUhDdyZvM/naYwkR1Dlt8T/DTE9MFBQPsk/EGX01XK1Lj/wBfAdrLJRkrk4RLnKw+NTzgHEHDx4/K/VmgdNb64kQq6zgRhVvqQA8JSThcFKCZA3BEOzVOB/x/EmaFRpFFedUzOoWbI91L8vt5FwpgRBlru8mJCe6UwQ2qG+J3h8OSh8jjwaac+JO4/h+XXGMEFcSLYsXoKX4ncY9rVze44GVTkKabVZLPMNWsOw8WdSRo7STAHgq1o7DJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnAy94aAmPfF2Lxr2+TCKvCMlQ/C5kh3fiCUoHB0AIg=;
 b=oGlJBW99feWsO7EPHIyfs0ZkV87mP4RxjxSRboSo+KOVsOY79hP+i8aaqnyhQFXgG5wJVSfnC5613sxYZdMo5VakoElby2wIDY8kBxL33a9TWV+E9uDk0NiXLDot3LYD9an+P/tEtHpYlfsiLEdIvGP9HBb7Hf4u4QG0wg72CEfms7xpXGE3VDks8gb/SBOn6xzNELJhBhoyRqgO/IeIcLNgxpw3DIj/PjKMTBVRL7z7WZsLtgiX/6HU3+n25eGdcAXN43TcMV1QKg2Zd8NnzihNjZBiymK/s6cA56JR6L9XH7AElIeTcIK8Px4LO0+PGe/4+gOTQ8FwJKSJ7vZOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnAy94aAmPfF2Lxr2+TCKvCMlQ/C5kh3fiCUoHB0AIg=;
 b=We7VZZqrlAcXiLvlRLVfLEgmb33LKkZfBUWB4lhTxiYvP7jyr1sZVXEOGFg9/LD58g6F9c6+jmDC+DqCm+pgV6lrcVUJ2MfV5Sq/yBwzRQbNMRBO2gdIbWoYNN6wr41p/lEYwht2PmAB2VH8wBnxGQnJU33GziJIvN368FhgxXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Fri, 15 Nov
 2024 09:19:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 09:19:50 +0000
Message-ID: <b5798f03-51d2-4517-8866-8e3368e4531d@amd.com>
Date: Fri, 15 Nov 2024 10:19:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] drm/doc: Document device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-3-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241115050733.806934-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: e859be3f-3d03-4121-fc55-08dd0556a82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGNFeWJkenNFdS9MLzB4WmpTUE9oRE5HeWd6TTFHMW5OR1lubDczZTBuT1R4?=
 =?utf-8?B?NUNUaXB0N2Z3YjdvSkV3bExyTmRSVnlHY09qdmQ2NjFwNXRvMW92bGVwMjdX?=
 =?utf-8?B?bDdRS0xTSVZFSTdZZ2RXblhweWhIN01MaWNPbUFWVkR3eU9SZGlNOHhNckxF?=
 =?utf-8?B?eVFZcUord3pFOWZTVmxTRDNsN1dUTDZyTHpvclRWYzQweUhPYkN2NWlDYXNN?=
 =?utf-8?B?MlZXWThOU0JROEh4aUwzcTJTV1pDdmZON0E5K25jVDJRbng2eDhRTXhQRmFZ?=
 =?utf-8?B?U3g2eVBsRkNJOFl0NWxCME85Ny9zRklqQTBoL3ExdC9LdjBmRkFMSGNGRkor?=
 =?utf-8?B?Zm52THBvUjZNSit4dEVBK1gycmNZcWU5Z1NscnVNblZPaGJBaDJCVHZXZFF2?=
 =?utf-8?B?NURQN0h0ZEx4NExKSHBXRnRJalc0NVQzOTVxakpuVlQ2bnUrMHpJSWkzV1RX?=
 =?utf-8?B?eU9ZeXh5WG9mRVBpWnp3QUpSN1VRcjNSbWJ5QjNWMWs5dVExZXdxQURyd0Jr?=
 =?utf-8?B?aW52VUllNDMwMlIvYTJyZW5iUUpWMzdzVWVSaWY4K05GMlpVQlc1SzFxK0pr?=
 =?utf-8?B?ZHZyMFdwZWphU1J1NEMzc1BoVWJZTkIwM2d1OWhpcGVHajI3SFVBRmFpV09s?=
 =?utf-8?B?QUk3bFdoOWQ2S2RtSHRKWitIM2lxMXRjTVdUVlRHTGdtNEtQc3VkZ3VOMWJ2?=
 =?utf-8?B?Ull5eXNkVjhRTnlIQ2RySU0rVUhLbko1bjZkUVhaZUNsWnl5SVVGOHBhZC9i?=
 =?utf-8?B?VXV2N3U0SkxtWXZsOVFjd2RpUTZqL0VBaG5qcUJlVTNrek5admEyZ0tSUkgy?=
 =?utf-8?B?RW1EQS9iTjNOMDVMZG9uTDcvWDIxQlJMTkFZZTBoeVI3SzFZYlZGNUk1Q0hL?=
 =?utf-8?B?YXJJdVZ1TFQ4TTRBNDc1YS93amU0VUg3Wk92cUZvdGplZUtpSDlJRkdwcFp2?=
 =?utf-8?B?a3k2eWpHcVhKS3c1aFIvVDl6bDZjRkdGb0RrTTIzWWtZNE9tUlkvQm11R3A2?=
 =?utf-8?B?b3VtRmtuazlkU2k2TDlGenJtMnFrZW10S3R3azBpTHRTOHhqZ0VYY3RPa2JT?=
 =?utf-8?B?QXRhV09PbTdhTHpuZ0Y1RWI1RmJ3U3hlYVhDcVhWcmNhdnZHQ1puejlSOVJF?=
 =?utf-8?B?T2ZwRkl5Q2VQQ2NNOGpWOGZyZko3MmU4Z0NDb1VpaWYvZmZPeHdCNDFSYVNM?=
 =?utf-8?B?YS9MTUhyUXVqTzFuQmJ5K0FGYTZRb2V5V25xZTFGaFo2eGpqLzNESjl0WjU3?=
 =?utf-8?B?S3p5YXF5NjZzc242SzkxSFQzbDBLTXlaaUFZY1NhRVFWWHgrVnF6UjdqRlRX?=
 =?utf-8?B?VHdzZWJkZkpxMEloZW5VallGRmwzM0ZxUC9lRzdRMFR3RnhvQWhxNFVvaTFH?=
 =?utf-8?B?Tlczdzl6Rzl1YmthZFE1RkptZUU3ZkVqeVk5d0NzUUZrTk5WTlJ1a0NXREhj?=
 =?utf-8?B?NjcvUkxJaTVjSkd0b0ZxMlFVTG1sdDdGV2VUeVFLbHAyK3lYUHFjRGxONU5n?=
 =?utf-8?B?bFEyVFdDTGI0WGYyOExUMEhIQVJxQVBIM1pOSUNPTU5leUtuZlBXM3loQmll?=
 =?utf-8?B?bkg4Y2k0UDh0TGRBZWJZVkZvc0ZEclBuMUdheWxJZnVmUWllYlkrV3RiMG1J?=
 =?utf-8?B?d01WUTlJV3p3VlFxSjRDSEoyZEN4cFkrejVpa1JrRk5qbUxGNGtBMHJ0WHU5?=
 =?utf-8?B?bTNWbXVGQ2dhVzdPTlBCYzh1N1ZIc3A3OTlzTkNPQmhycEJQVndJRE1MRFZ2?=
 =?utf-8?Q?gBCogjQ24WMg+g57Jp8xjlOP2TLqiGof/fn0rYi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTdKL2huL1FTVTIxWVIydUpkZGdDZ2kzemlTU3hHeERYSVNabEs1MzM1SFd1?=
 =?utf-8?B?UGdJMVd1NzBGWm1sRXhnczRRRFFoS29oRkY0Yk52Sm5ReVZBWnpXTElZa1lj?=
 =?utf-8?B?MktVc2Y5ZmtYckllSGpmanJwS3dQRDNWYXgyVUtBY3JtV003cElyRVlUd3Rx?=
 =?utf-8?B?cjJ4NlRjQXBrMHVqZG1NK0txMjE4S093OE4rV1pvNjBvcDVTMk5PU01nM0pv?=
 =?utf-8?B?M1NGYlFxRFFJT3ZaV1M3ZnNoNjc0L3lpL2EwM3ZDMDBBZHZMbFdxYnpqZnJD?=
 =?utf-8?B?YlFlcmtlM1FMb1liLzdKdmt6MEdwOXgxVE1RRmlzQWJYMEtkN3p2dkgvVjNZ?=
 =?utf-8?B?UjRUb1dGRFVja3RORUNSYW1vZnEyaUhvVDVDenp2eThyNmxPWGpyMVlSMGRm?=
 =?utf-8?B?SFNlMlN5NkxRV0JMNUxzbVl3dnY5MVNDdEJFQXRxZ1BVRHYyamZDWUw0dHFs?=
 =?utf-8?B?eHpoenBoUFdOazBZOWxmMTVMUENlMjJrRGlyRGtRdy9MUktVa1c4RzJWbjI5?=
 =?utf-8?B?WmVJRnN6RE4yTi9JTjk2alpBVGVIWWFjN283THpTb1BURGpwL0dYNkI4UlZI?=
 =?utf-8?B?S0llMnJPNkhGVm9HZCt1UGNNb3Baa0ZQaFFYd2F2b2RjT3JxeXVTdlVORHBT?=
 =?utf-8?B?ckt4djBDTnRONkQxSEhpcjRiaGtVZ2xtZzRhZktybGVXQjlacVVoZlVadVBq?=
 =?utf-8?B?UzdMY1RIVzR6QmFVajVEcWlEZGN6VEZlSXMwNEFUT0ZzcWhJakl5VjhQeDVp?=
 =?utf-8?B?cVNobGRUNkE0WktOSm8zaXZnVlFETHJBWkNabW1sUERodldmWlB2Qk42aEJL?=
 =?utf-8?B?RS9Fa0ZmRE96STdEVFRnZ2RWYzFlbTJyQTBXMmxFYXp2eG1paGxENzFKRk5F?=
 =?utf-8?B?TTl5YThFQWswM2R0aDJaWlQ5bVR1MXVWL3ZlSVZ5WHhQNXJicGxYK0VmNzBm?=
 =?utf-8?B?NFZ2SzdyRWZYcEZDU2xDb3hwSWxoU0cxWXdHT1YzNlBNaElOcEJtZlFpejIv?=
 =?utf-8?B?STlLNkpFalVUY0tnMHB5RjdvRG9ySUtKY2FUQ0VXQUF3aUhMbDFIMTUzMlM3?=
 =?utf-8?B?WmdJMzg0RitERlJIeFgyZTcyVXVaZmUwNUE1UkczMzFTK0xqWCtyRVlKcXhs?=
 =?utf-8?B?QXBqaTgwOFFZY1ZXQk9rS1BHakk5U3FWVk4xbWZnZ3IxMVFmZnNNdkdXNjQ3?=
 =?utf-8?B?YjNmbUNya3YyNW1JNS9xL01HTzl2ZnlSQ05vY3VVUjRWV01IZ0hrMmJUQmxB?=
 =?utf-8?B?WUFXVFNvdjlMbjVYUmwzaE56ekhRYWY2MTd6V1Rib2E5NWRYTDJlMnp4YmhX?=
 =?utf-8?B?dWd1d0F5WDlzTFI5dWVVeFQrVjBXNVJlSmpRYllxV2JMMy82NnBSdnl2WWdC?=
 =?utf-8?B?WHZXNm5GQjZWS0ZEa21xTFVBWmJNak1wTzd6Mzl3K0VaMHBEd2p1REZvQldh?=
 =?utf-8?B?OU95RGxDM1BmYXhTUjZxQ0ZEU3pJc05ZNU1PeUIvYzNMVFBMVWdpTllaL0RY?=
 =?utf-8?B?UVpsc0xFeFN1WElMTWJOM2hRazVpcnlnU1hhZjBBNFI5ZnB0WnhaZVZ6SW5q?=
 =?utf-8?B?dFhERjFXVWhPMnRpSldLdW4rU0twa01rM2FMYmFZWDNXaGNXTmxzaDVjVzdJ?=
 =?utf-8?B?YlZLeDgwMHJhWlBxcVB2NEIyOW9IcVh1MW9QUGJaTG9sM2o3RWI2VitXblBW?=
 =?utf-8?B?dEIwOVgzTHBEUnJ0MXJ4MHEwOVZLOFZzTXQzc1pHc1pYWkxidGl5U041UkVq?=
 =?utf-8?B?SGtBbUxSRHJhcnF0bG4xOXpzMFIxRmJ5WlJKcHhDVGRRZVJxQXJTNU45UHpG?=
 =?utf-8?B?YVRnSnB6cnNaMU83UW9GcVVsdzI1V2IycXJIRVBJalNOYWtUN2xzWEhTcFlV?=
 =?utf-8?B?eHJzVG0vQkFWNVJuclBSWEdxNUUvZkpCLytiZ0VtOWNyTmFKRW5jVlR0ZERF?=
 =?utf-8?B?NWpnSWlzUCs3NUN1a2FLcCthSWN0S0IvUFBqUE51bmVHekFTaUxiU240ZjI5?=
 =?utf-8?B?Q0U2SDNTKzZqSnZCWnY3dUFqYjBWaXBmQTZjQTJCMzZJT1VBWnBXTVkxdVhk?=
 =?utf-8?B?dE1sVHc4cS93b0lqSWgyOUJDQ2gvOUpJc0kwSXdaYXllZk5MUGMrY3RweXE3?=
 =?utf-8?Q?3m2k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e859be3f-3d03-4121-fc55-08dd0556a82a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 09:19:50.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbmxX4yAyejz2PoPwvmRw5dbIKxsCU24JZ7XoTLidOqsTxJTqTN9LzvuudCq3MDO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
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

Am 15.11.24 um 06:07 schrieb Raag Jadav:
> Add documentation for device wedged event in a new 'Device wedging'
> chapter. The describes basic definitions and consumer expectations
> along with an example.
>
> v8: Improve documentation (Christian, Rodrigo)
> v9: Add prerequisites section (Christian)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Sounds totally sane to me, but I'm not a native speaker of English so 
other should probably look at it as well.

Anyway feel free to add Reviewed-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   Documentation/gpu/drm-uapi.rst | 102 ++++++++++++++++++++++++++++++++-
>   1 file changed, 99 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index b75cc9a70d1f..33d9c253d4d6 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -371,9 +371,105 @@ Reporting causes of resets
>   
>   Apart from propagating the reset through the stack so apps can recover, it's
>   really useful for driver developers to learn more about what caused the reset in
> -the first place. DRM devices should make use of devcoredump to store relevant
> -information about the reset, so this information can be added to user bug
> -reports.
> +the first place. For this, drivers can make use of devcoredump to store relevant
> +information about the reset and send device wedged event without recovery method
> +(as explained in next chapter) to notify userspace, so this information can be
> +collected and added to user bug reports.
> +
> +Device wedging
> +==============
> +
> +Drivers can optionally make use of device wedged event (implemented as
> +drm_dev_wedged_event() in DRM subsystem), which notifies userspace of 'wedged'
> +(hanged/unusable) state of the DRM device through a uevent. This is useful
> +especially in cases where the device is no longer operating as expected and
> +has become unrecoverable from driver context. Purpose of this implementation
> +is to provide drivers a generic way to recover with the help of userspace
> +intervention without taking any drastic measures in the driver.
> +
> +A 'wedged' device is basically a dead device that needs attention. The
> +uevent is the notification that is sent to userspace along with a hint about
> +what could possibly be attempted to recover the device and bring it back to
> +usable state. Different drivers may have different ideas of a 'wedged' device
> +depending on their hardware implementation, and hence the vendor agnostic
> +nature of the event. It is up to the drivers to decide when they see the need
> +for recovery and how they want to recover from the available methods.
> +
> +Prerequisites
> +-------------
> +
> +The driver, before opting for recovery, needs to make sure that the 'wedged'
> +device doesn't harm the system as a whole by taking care of the prerequisites.
> +Necessary actions must include disabling DMA to system memory as well as any
> +communication channels with other devices. Further, the driver must ensure
> +that all dma_fences are signalled and any device state that the core kernel
> +might depend on are cleaned up. Once the event is sent, the device must be
> +kept in 'wedged' state until the recovery is performed. New accesses to the
> +device (IOCTLs) should be blocked, preferably with an error code that
> +resembles the type of failure the device has encountered. This will signify
> +the reason for wegeding which can be reported to the application if needed.
> +
> +Recovery
> +--------
> +
> +Current implementation defines three recovery methods, out of which, drivers
> +can use any one, multiple or none. Method(s) of choice will be sent in the
> +uevent environment as ``WEDGED=<method1>[,<method2>]`` in order of less to
> +more side-effects. If driver is unsure about recovery or method is unknown
> +(like soft/hard reboot, firmware flashing, hardware replacement or any other
> +procedure which can't be attempted on the fly), ``WEDGED=unknown`` will be
> +sent instead.
> +
> +Userspace consumers can parse this event and attempt recovery as per the
> +following expectations.
> +
> +    =============== ================================
> +    Recovery method Consumer expectations
> +    =============== ================================
> +    none            optional telemetry collection
> +    rebind          unbind + bind driver
> +    bus-reset       unbind + reset bus device + bind
> +    unknown         admin/user policy
> +    =============== ================================
> +
> +The only exception to this is ``WEDGED=none``, which signifies that the
> +device was temporarily 'wedged' at some point but was able to recover using
> +device specific methods like reset. No explicit action is expected from
> +userspace consumers in this case, but they can still take additional steps
> +like gathering telemetry information (devcoredump, syslog). This is useful
> +because the first hang is usually the most critical one which can result in
> +consequential hangs or complete wedging.
> +
> +Example
> +-------
> +
> +Udev rule::
> +
> +    SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
> +    RUN+="/path/to/rebind.sh $env{DEVPATH}"
> +
> +Recovery script::
> +
> +    #!/bin/sh
> +
> +    DEVPATH=$(readlink -f /sys/$1/device)
> +    DEVICE=$(basename $DEVPATH)
> +    DRIVER=$(readlink -f $DEVPATH/driver)
> +
> +    echo -n $DEVICE > $DRIVER/unbind
> +    sleep 1
> +    echo -n $DEVICE > $DRIVER/bind
> +
> +Customization
> +-------------
> +
> +Although basic recovery is possible with a simple script, admin/users can
> +define custom policies around recovery action. For example, if the driver
> +supports multiple recovery methods, consumers can opt for the suitable one
> +based on policy definition. Consumers can also choose to have the device
> +available for debugging or additional data collection before performing the
> +recovery. This is useful especially when the driver is unsure about recovery
> +or method is unknown.
>   
>   .. _drm_driver_ioctl:
>   

