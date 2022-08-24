Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134165A0AD9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336110E328;
	Thu, 25 Aug 2022 07:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042F910E2D5;
 Thu, 25 Aug 2022 07:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEhjLVdlYAKaInMm6bDKYJqJkHFSouNANtxMwPNL2XyFDEGwiqiyrqREMsSmm4ELld8OHrEQtK3VLY4fR4c5qmBdEHR5SjuNx60o+kjFtY/NEFfdN47UulmVu9LrZ7CT9hmRMRIq3vBEWyesh+KtniW+9wRZ2TfGqyj3r4DC9dZQV+R22FLy3pZBHraEH0GRr7311Z0Zzr6xeZGrvIc52RAXmkGxpRdJfj8rLB/2h5AEMKTCEFMD6JBAFQ8Ppu/ikopZsACEQGFjUMimsxhBpsklX3FS/lUps+bEF0VeZZz3Ohah87ijA0Brx7BCfctVn8EAqHUMwpMyElTT2B2SvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kobkWjyNfqgeGhRPJPngFMSHtbwaFt6QgTENLMXXy/Y=;
 b=JHEYdyzMaCukA4fUMHmbYXPPpc/bg7yckvhqzJKCGDt0Cp8xKUGBXxQdXPn5ExkW2am93TCob45PDRQVnnfuI8PIpFSaiuOz5b59pJye/iICNCSLIwW7o9fA3YftPEaBsB6gowkFHyxGo/JY6/ZMhnLJaepsv0O9kEMgKiB/1XwPsEJg2h5BrBkFHQwRXYMLB+JO226tW3Qv5269qmCdPpunF7+jtrSQXX08c+cT7z6118N7xjLVJEF4XH0eg8d6PEHm71ora84Hd4fzfMsHDjE9AwICEqTLK5cM6BM0YTxfrfNdjwg4cR2cQBXvL0USfKZ+xrPLAWB+1gpJmVmyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kobkWjyNfqgeGhRPJPngFMSHtbwaFt6QgTENLMXXy/Y=;
 b=RmndNc8wLoicT6h6iCT3mbMDlpeEBALfBRIP0AII2W5y6KFZwZ5FZi1Y7mtkNIBzsAjtP3HKDosLOFJxUPXIQ2b8Jq6YrmWBeZmiFbml5y9czsrkJ0K8/mcpj9+o65q9GFdazole79ezw2F2LRd7rjjnYHSB0coLtMTnMgtqSvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MWHPR1201MB0159.namprd12.prod.outlook.com (2603:10b6:301:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 20:25:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::e00a:1f8c:dcd1:afc3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::e00a:1f8c:dcd1:afc3%5]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 20:25:06 +0000
Message-ID: <8cb42207-b04c-7222-08fa-60c8eb0b3521@amd.com>
Date: Wed, 24 Aug 2022 15:25:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm: amd: amdgpu: ACPI: Add comment about
 ACPI_FADT_LOW_POWER_S0
Content-Language: en-US
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Alex Deucher <alexander.deucher@amd.com>
References: <1831630.tdWV9SEqCh@kreacher>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <1831630.tdWV9SEqCh@kreacher>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:610:b0::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c37054-fc80-49cd-156f-08da860ebb73
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0159:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvmxcgOV8j5YlrWMhOgIx9otVrxcUCBbSvOpZcQcNESv3Vbwp0DFjMvmTPgieciPNH7AXY0aeP5yf/7117BAI5tgYhs8V1q8BI9MXFGRy/jr2mjwpV7MkYiRnGMHIhBcRctE8uNHqzZzJT8CpIZJmMl/q3E/r2mBz+H6deQDvLY0I9XESA7UJMMlEm0ZxSbJcICgwIjgpjNeRWLfGGbMZM8slKdE+PAxYvlMHsvs6MN/8j3GJPLHqg/RB5IS2xAGpD2vn38n1eqh1Jb5gIGbzXjYzXT/PqfgpCmVIok5lwBVZnpxABzf6oj5xvs/N1PeUbafp3a5UYOqnA4zZQdj/cj4fzdNQ8wJmfguLTmr/ejHm2xz8KPNPXWeq2vFRKQFP5hQEOoUSMEwKr/JeJzIDda/+irVdXs4KhADBVYV8JM+Tit7DbIwswL+OF88c2Ve+8v6bZ4FTaDnZbXlIpdyM4UIniBUZMD6k/ejhufE1ACl1DUEZN9YodIqlptBQvJTRZ3xRAYJu4I1Q2eZQcOHfZZ3ZWOmVkYunjvAeuvj0+Fq4caCx44Drg0Y7YHQzDGz+X+OBUnkcbrikDL84xsLOh1IEfQ5Jsfrrkqo0MuCnyxniL6Jeo86x55qQYVdqwzqHo+HB0weOgFkAogi1bVnChOOCCDtRzpBJY1Z2jPXu5WtHv2TTBbj9qcONGgoQBXXEIZCSHInnYDaINBQQNATrsrpC5HqAQW2h1s1rzrvE8YdaLpSHtcS9QtzjsnzS6CwBSzGym3f/tINxQvBuz3M97ltC+olCZzA5FMIgPrO7vpjXNE3jEtdMPbKGsJSm38fOrs7eu7XREIeVvZp7/b3MVNAwC8kF0niJ5Xln7cSSXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(2616005)(186003)(86362001)(53546011)(2906002)(26005)(6506007)(6512007)(31696002)(84970400001)(38100700002)(83380400001)(8936002)(36756003)(110136005)(6636002)(54906003)(41300700001)(316002)(8676002)(4326008)(66476007)(31686004)(478600001)(5660300002)(66556008)(6666004)(966005)(6486002)(45080400002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTBRT0w3REFLOTFiK1NIejhrOEVhaE5PU1dXSmgyeVhYOEFWNGFZbVhKY2NN?=
 =?utf-8?B?UzVTMHRDSGFpREZ5blVwbExWQnFOdDVUVlhJM2paQXVRRUEvZVhNNXdaS291?=
 =?utf-8?B?VTJrbGJrQnlKYVdlajhZY3ZxYzdUekV6WUFZTjlmUEdYMWpnVk1aRkJCQU1X?=
 =?utf-8?B?UXlXd2lUOTZvTTVWVDA4dW9WNlZvV2ZSZjRNZ1lJU3JaT3hpZ2sxSFBsS2M0?=
 =?utf-8?B?a2VWZXN1L0J6ZTc4d2hkalRNd3dCVk9SSFBqSG1RTFdUNStTY1FNaENKT3kz?=
 =?utf-8?B?RVZpNm9rV1hCdk9TZ203TWdjb05JYSsyZVAzbmhiaDlLdnl4WDVTdWV0eGZH?=
 =?utf-8?B?eThEOUh3RTc0RWxTTjZzNHpGZXUvUGIwbXc0R005TEx4MUtZdU0vakRMR3Yz?=
 =?utf-8?B?b2pzNHkwR1ByL2VIVVpFckdSWGxWTEwzYlUwSGtMQU1UbHFzVldienBtdG43?=
 =?utf-8?B?UElidURuR29FYUFkSzVtU3k4VDcrSHhUM05OaTZQZncxdG1qMkk0YURkdUtV?=
 =?utf-8?B?d01xZElDdTBRdDQ3Y0xKZDJXRGtjSXpRU1lhYjk3WkhLTzY5MGMwejlHdEhv?=
 =?utf-8?B?bVR5RXo1dHhkVmx0dVNTc1M2cnljRlh2UTB4eFRJMWZRZk1xMEc4SFVrS1Fk?=
 =?utf-8?B?MzFmcUV3bmRQemNUNndEY3JiZFIzTWVlcUhqRndNRzhxUFdFYXBiTGVFV3hH?=
 =?utf-8?B?bnVyQThLNzAvbkZuRVAxNmw0U2tPdGw2bTVVOHdPZDF2ZjlKdWRJSlBwRUlL?=
 =?utf-8?B?cWs2ZUdzbUdxTkxEakFiYWE4OXlsOXM2RlVsbnNwRG1BWUJjWE1lMHdVVnA0?=
 =?utf-8?B?ZHBBKzE5a3RzbmdiZW9mOWo5bTRaMktXemFtRWRXQjFpWFRmYUpkazZROXFh?=
 =?utf-8?B?MGpRcU51UFZEN2xjTlRURVRtemZsQ2JVdzJ1enNFOTdpZXUwc044UTd2cjA3?=
 =?utf-8?B?LzRxVTFpQXZTbFRXdE5DUDlMOWgzTk5FVVltaTEvZzVqM0xDbUJSa0hxTlcx?=
 =?utf-8?B?VC94L0wvN3ZTSGxreHdzdCtkVVpPQU4remVjd2NaNEdXdlIyK21Ec0lBTmFL?=
 =?utf-8?B?RG1IVUVkSEhJS2NSZkxhQ0xmZkJHVXRWbWFnUEx3aXFHeE1KS1B4dHdWenZi?=
 =?utf-8?B?ZGhWUVJJRVNaTDJhS0lURjJ4dTlaWkVJRWVJWDJjMUZLc3ZHVUlhOCs4Y1NK?=
 =?utf-8?B?UmpDRjBrcm9DSlBMVUZJQjVLUmR2dzhrWGQyYkg3UGx4SytiYUhqanRReDdB?=
 =?utf-8?B?Ny8yaDIzSWhtb25rYmlRNFJmMEtVejhWNFFhSk5yV3FVTU83RXNuWDlTNy9Z?=
 =?utf-8?B?a0FRTVZLUHk0V1Azc3FDcnp2Z20rZVhXcmR4b2tqYmRzWFMyV0k0cFdZTTRI?=
 =?utf-8?B?dUFIVnNibFpHMXAwQzkzRlI2b1pXZzVua1FpMnlqUWg2LzZtVjgydGliUFJH?=
 =?utf-8?B?TC9VYmczV0lDZnNUVzZzOEZwWExRRXorQ1VoYUYwNGN5bGVwa1RVR2ErWUNZ?=
 =?utf-8?B?SXVlMUlNVTFrOHRjbk0vQVZ2NWMwMHNjWDRUSlFJUVRUODNQRXc1R2syck9U?=
 =?utf-8?B?Sm1iQzBDeW85T3g0aVU3SzluOHNwUWhqUmN0SnFEdDUzdDkrcUlMSEZGK0Jp?=
 =?utf-8?B?S1pNVk5wNWhRTWdFb3dZaHpTaVdNckd0YUs5Z2l0bk4yMGV6bDl5MFlRYjZO?=
 =?utf-8?B?WHA0dU9tekhJSEo3NjFCYjVkVStacXhvbzk3UFJmUC9oRzlaVXNyeDM3anZr?=
 =?utf-8?B?Z2hKdkIxQTFReVRTVjAzblhYb3FzUzVFUTk2c09kREdydkMwMlVxWjI2Myty?=
 =?utf-8?B?dFBTODNKR2NDRGtkNkJBMGppaWlhTElJeUN4MHJWTVdDMGxVRVorb1BNc1pm?=
 =?utf-8?B?R0p5SUFDZG9Jck9EZVlQa0ZiQ2lqT1BvOVM4Y0d3dkwzYkZMNWdZOFZNdjBy?=
 =?utf-8?B?UGJORTU5YUJRai90WVk1NHdBaTRhcTRQNHpUTUJGQUN2Nk0rTlc3c0hPMGdJ?=
 =?utf-8?B?bjNYbHE2QlpFckp0ejhMTDgwbjhLek5KaUdCOXA5d2UyTmZ5ajE5ZVVJcVdk?=
 =?utf-8?B?ZkNCWjNuZmFDZFpIM01MVnpwd1k2cytpZmR5WmV2MW5XQkJjN2EvdmRvclUw?=
 =?utf-8?Q?GXN8Iw0pD0JqN10p1fkTXLWEh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c37054-fc80-49cd-156f-08da860ebb73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 20:25:06.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yByvOSGAjGxYMXjroejoJNYHSzVkgghx7+AjKQ+pd3jSa8kWYKkttdu6l06jgCif68whKXCQE7iiHuJGmKwmQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0159
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
Cc: Linux PM <linux-pm@vger.kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Linux ACPI <linux-acpi@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/2022 12:32, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> According to the ACPI specification [1], the ACPI_FADT_LOW_POWER_S0
> flag merely means that it is better to use low-power S0 idle on the
> given platform than S3 (provided that the latter is supported) and it
> doesn't preclude using either of them (which of them will be used
> depends on the choices made by user space).
> 
> However, on some systems that flag is used to indicate whether or not
> to enable special firmware mechanics allowing the system to save more
> energy when suspended to idle.  If that flag is unset, doing so is
> generally risky.
> 
> Accordingly, add a comment to explain the ACPI_FADT_LOW_POWER_S0 check
> in amdgpu_acpi_is_s0ix_active(), the purpose of which is otherwise
> somewhat unclear.
> 
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fuefi.org%2Fspecs%2FACPI%2F6.4%2F05_ACPI_Software_Programming_Model%2FACPI_Software_Programming_Model.html%23fixed-acpi-description-table-fadt&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7Cf43320dda5114deeb16908da85f69d3b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637969591512297179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=xp8pNzsXCkLcIJOJFY77yaLkMrvz5he3S%2Bi%2FwaxTwwg%3D&amp;reserved=0 # [1]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |    6 ++++++
>   1 file changed, 6 insertions(+)
> 
> Index: linux-pm/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> ===================================================================
> --- linux-pm.orig/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ linux-pm/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1066,6 +1066,12 @@ bool amdgpu_acpi_is_s0ix_active(struct a
>   	    (pm_suspend_target_state != PM_SUSPEND_TO_IDLE))
>   		return false;
>   
> +	/*
> +	 * If ACPI_FADT_LOW_POWER_S0 is not set in the FADT, it is generally
> +	 * risky to do any special firmware-related preparations for entering
> +	 * S0ix even though the system is suspending to idle, so return false
> +	 * in that case.
> +	 */
>   	if (!(acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)) {
>   		dev_warn_once(adev->dev,
>   			      "Power consumption will be higher as BIOS has not been configured for suspend-to-idle.\n"
> 
> 
> 

