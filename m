Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C4873D4F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 18:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27710E919;
	Wed,  6 Mar 2024 17:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BLOnoBpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176A110E648;
 Wed,  6 Mar 2024 17:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiXU5o9RQ5mdYjnF675GbO8XfrLYK9IRwgTZH+9HUYg/6XYjWrZokDTe1OGkfbP1hHdCsa79GyrzmJToHfW57eM5JirVe5U1rZ/PYDwepghD2PgHXF7y97LnvwchHCpaYIVtJ1Vz8wcwgq4w/1TySYEF5n7S8HhDs8JHitHpz7J66Von62fV6vs0XhWEs6A3NIIuN+q6B158HJkDkUJEO/az46nHum5WgfSsOgt5ehmuc6gcuzNj3VNksYl9E5Un8CmtEYjrOi1LutxqzCpsPWIldNp1L0//a+kqx1MaWxIjJTTkTTOcpUCU9JUwjQg5GNkzLNWlvoZpyvUkmcxJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmKWRrP9v9bf9daW5LBeG0+JVrfQo2v+V/9ZFjTOHB4=;
 b=SmTGUYeCrEY93myZTPnQkr73Euu4BY9gP07JYUkEocgvP+znxmZC8AFX9p/TBg8ncAUc0VpWaBdiE8vV5G6DXy5I+FZ1w/t5g+WY5qm0r3TzAlqHy+F3GzNX9W6LnU7UvbxwSQCl5hSLbQgc25Nx6AH2kX83PjRrBu0aVFTmse3JXPFMEa1Sbm8oA0Rri7vx6Hs5+74RHzvSMlX16w58fnyRAMzYdVljCtEg0C+djYIWo+gO+3Wyzx0ZddcBMg5hJCFsPOc824zXkOR8khQu/TCxOMbJFqKEUsts6aKR2uYsaMswmna/iegDZ2MbHRQ5QZ2JfpYV5Un56d2abRRi5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmKWRrP9v9bf9daW5LBeG0+JVrfQo2v+V/9ZFjTOHB4=;
 b=BLOnoBpbdT4QqWe+UXz4h8QTyhxbTTKBGqNxDv4HQ+iApi3d1fq+PzeVVYpvBV2d7tmzWz9rfopypBMlFrfOLQGT+XhmcSMLT1LcEIc4xT8UN1O2+vhdnhXAcAYSROFwA0iW3Mu7RnQnVcDu6AEsiFS5VKrbB5Px1ibWIIfHKWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 17:19:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 17:19:08 +0000
Message-ID: <e046ff23-8dd8-43ce-8249-c42d0bff7f5f@amd.com>
Date: Wed, 6 Mar 2024 11:19:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Content-Language: en-US
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Hamza.Mahfooz@amd.com, Harry.Wentland@amd.com, Sunpeng.Li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <2333702.irdbgypaU6@xavers-framework>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2333702.irdbgypaU6@xavers-framework>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:805:f2::46) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: e8dddcd7-21fc-4ead-0bd7-08dc3e01887b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+FNx4NpVcbup1JOBGjwhUuxS1z/oS0oEmvmReOn2FWDjCBCFNh6lAr88xllRcqdffNqlvFGcI3D9wpRNV9B3bAS2FwQZv7U6rXFvBG7mZSz0/ybaZEYl5ubJKbhqvL4whRwpw/1ZKRQoSi3a3E+GZ8AEvZ61o7FB71khCs0nF02/9TqCG48Q/L+KB8/THIAjxW/GEtvKhGMFppew2a5zgn3J3OWzl2DyWZX1LmhWtArmhQIg6tcfQIQeDUBsunm6kTdzSphwcW2SOtgDIh4sSIz6odL1QcgSkmXDPErSYX3dKaB6URyHqthgLA7LKyr6i4x25k6bz7fl0ZAiCLi6n1u6wuajc6gSicNQOXD90amwxlVib1idoUkPN3gS4kRB0gyVIhy0tTMsHWfJGCyoNUixAfrINpaKpPAUfmaZzaa29yZ5M8tip/ysG+Jr1Ugn3HhM0Le9oN8SnBXvL6FzGkv24sGR9g7ZDCPOON355DKYG+ncG1Pv99XsgBx/NQWqJpWESFnUmzzG/Dhilgdzgzc+466MXuHeKB3DNl5jM3Xqbnf0ZTm/gCu3/Bn1Zh615psD4xJqJL6guVTDtuVSsef5+/0cevCMtNdXtFMhve83B+X1s91I1wGxR0WG6U8ZHkecgblkKrQ8Zp9ZIjxTy2CpNmR1hL7Nezv66Pgy8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtROVZJanA5VFJsZVhIZGR2VWFlaWtaTHQrQUxGbEduTldaVGJVbld1Nzd5?=
 =?utf-8?B?dFhhKzlkOHkwbEpGOHg5bHNoUU5KVFZoeHFnU1FJbktmb05WNkwxRU5tdktt?=
 =?utf-8?B?THV1NzM3SEh1TjJKemRMOWl3VU93SGZMOE4veEJkaEpuZWM2ZFdDdU14NURE?=
 =?utf-8?B?Y0szQUxadHVKYkFJTmluSDNsR3RLSzBVaE0ydnhtOFVTeUxpYkRBQWdyRVJl?=
 =?utf-8?B?YUhiQmlKeXY3T3RUM1pYUC9Eeng4WEsydmJrajlVM2psLytwWVc1OHpLYTcr?=
 =?utf-8?B?d292bFpKNitJdmxFcnBNdEJnempqZm9VTnQ2M01Bb1BUaDFRT1BuVWVhcnVG?=
 =?utf-8?B?eUNOVDR1d2dIRVFLRDhxZVVHOHhLcGkyK3YxR1FPVU5LbTVsQ3JlR09UZmlj?=
 =?utf-8?B?VEgvUUIrVVgzVkhucFhxRE1WWGVkMHY1RnJLWDFQVnU2UDBUTSt4TE9nT3Iw?=
 =?utf-8?B?YVMvaXVRMlZLNmZsTkVweThIZnVCWi9aSlF4bmJFdVBjNDJLSkVZbzdaUEw3?=
 =?utf-8?B?OUtVcm5GM284WExvcmFnTDVUTFZjNXB1NmdEbGFiOTFELzlNNVMxZWRrWS8y?=
 =?utf-8?B?TktSb1Vnb3RrT21RMUU5MDJNOXJEWGhQeXRMc0hTajZ3cUkwM3NFTGgyTURX?=
 =?utf-8?B?a0RHdHJMYVlHOUZ3K1pyRms3OUtiakN5blFpUVJUNm9zUXdqTTB4UEI3QUZZ?=
 =?utf-8?B?QkhRNFIvUUJLOU94a0ZINkJsZDVlaEtadXNCNW1RcFFJcFpVak5vU3NCUDVH?=
 =?utf-8?B?Z1dVdVduSnlHa29YTFFrWXQ4NlJKWVNQZE14SHNVbThzQzZlMUFQK0IyUDNt?=
 =?utf-8?B?eDlDTExEN3h4MnFtMVJzTWlWS3ovWkc5cXNOL2JGcEVOWGcwQk8rTnV5c1ZR?=
 =?utf-8?B?R0Zwd3MxcTRodTRFd3NXZU12MzVhSGpBVWhMaWlwUmVkcUVRY3JpdmRPK0Jv?=
 =?utf-8?B?NUNieWJRUjdrSHBwR0JhTzBDcysrRk9kbUtQc0VNbU9zUlBKdEJmbmJTMy9t?=
 =?utf-8?B?ZUdhRUR5YjV0UjYzYm5JR2kydlc5M3RpNGtPVFBoN3FmM0tUL1BKU0hjRXZK?=
 =?utf-8?B?MjdXY3JtZDRSQWZPdUJYYTZvVzdLK3NYUVo5dTRRL3U5WEdFV3F5cnBGNzFt?=
 =?utf-8?B?ZDYwclVZNzFPOEEwYXIyaG5VdU1OS3l3MzllVlhtMlBwTHM3UkJJSllTM0d2?=
 =?utf-8?B?K1JqSitpcGNEZGdZQVRpN1F5MS9ET3BaREpnQlBwYkN0SlpwT2ZuVEJnZ0Qw?=
 =?utf-8?B?OFBZQlJPenRYN3UyN1FLczQ1aWtTK3VJYVhNYVdYdHhJaVdZNkNFM2NCdWEr?=
 =?utf-8?B?SkgzV2Niam5sZjZxcnlZa1M5TlZIRkhDYUVsSHhDU1crTlJTMjRqNFdYdVcw?=
 =?utf-8?B?czFtQ05IWG55RU9DTjFqZERYVkc1S25iVnVoMjIwenBYdWMvVGlMUHI2Wjc2?=
 =?utf-8?B?dXQrVmM3bXQvWGRYaXBNRHhzcnZGLy9XeHA1MTd3ZmFJczVQU0thOWtsTy9r?=
 =?utf-8?B?Q3QreFNhWTBFbzFnVEtXM0UxK0F4Y0JmK0xUQ1kzSVp0ZnRjWE9XMm84NWNW?=
 =?utf-8?B?QXh1aDhmUllHeStEWlhKUWl2ZTRwSDdwdlZDOFNaL1NDcm9GMzhKYXE3QUlJ?=
 =?utf-8?B?a2VLdHhGbUlSZEFtNVV3bE01aURVNTZkdDJEMjhEamFzNm1NVzhGR3ZoUHpo?=
 =?utf-8?B?Tm84TWMxR0xackRFTzZRQjFEVENiY3gyd3VBRFB0bTV1SXd2TGNKRG93dElK?=
 =?utf-8?B?Q3dZSUdKYjFubm5LZ0Vtb1Q4d0lZNkNvZVVpSlJubmhDSjBiY2FlK3gyTlRw?=
 =?utf-8?B?TldMRXh6L3hzK1NUbXU1aVhoSWJUZUg4a2xIUy9DQzUwQlM3eGFKL2JCS0dj?=
 =?utf-8?B?Q0NIdzBIeXNrV01QcEhzOG05MG5Md2FQM0poc3FiTlVFKzhBZXphcndDTTB3?=
 =?utf-8?B?VTlncG1wZXFFSUZsalM1MC9rQjNSVmhtc2wzbklpRjM5OG90Y0FuTVpRMmRn?=
 =?utf-8?B?NWdra2hhNXVVUTFRcEZOSmxjVVJvekVpVUxWa0J5S0hLeU81YmtyajVqcS9F?=
 =?utf-8?B?dGlPZjRJMnNjM0JUTEphWGZjUkRoaDljNVJROWpKVHdwelZFUnpTWHRYUDds?=
 =?utf-8?Q?j6rP6nZlFzI/0fBr57lZIrY4p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dddcd7-21fc-4ead-0bd7-08dc3e01887b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:19:08.7122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ARHt6E1j5rMW43qCx9YzoGjBElVadzNoCXLCjgjwEIS+JMPPBj2w/Rz+u8gqz5N5whfWfxPn+cHK43y2/l7lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
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

On 3/6/2024 11:08, Xaver Hugl wrote:
> Like already mentioned in the power profiles daemon repository, I don't think
> this makes sense. This is a display setting, which compositors have interest
> in controlling, for example to:
> - disable it in a bright environment, because afaiu it reduces the maximum
> screen brightness
> - disable it when it shows color critical content
> - disable it while profiling the display
> - enable it when it shows content that's definitely not color critical (based
> on the content-type property of Wayland surfaces)
> - enable it as a first step before properly dimming the screen on idle
> 

This specific topic is on the agenda to discuss at 2024 Display Next 
Hackfest.

> If the primary concern here is that this hasn't been used by compositors and
> potential power savings aren't being realized, that could be solved by
> providing documentation about what the feature does in the kernel, and by
> sending a mail to wayland-devel describing why it should be used.
> 
> If the goal is to implement it in power profiles daemon and not get conflicts, I
> think disabling the property by default and instead enable it + disable the
> sysfs file when a CAP for it is set would make more sense than making the
> listed features impossible.
> 
> 

So the idea being if the compositor isn't using it we let 
power-profiles-daemon (or any other software) take control via sysfs and 
if the compositor does want to control it then it then it writes a DRM 
cap and we destroy the sysfs file?

