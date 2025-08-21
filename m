Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A4B2EEFF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383E810E886;
	Thu, 21 Aug 2025 07:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cKozoP+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC91810E884;
 Thu, 21 Aug 2025 07:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyw8wAQQTqqakIJXJRIOqUE1Y8L7NQTqVIbMC+O/2F0EnZi2wJ58eUWwC9a+S2szUwtM8/PrzmK107Hve9DDRYvQIisJFMVFtClua1zP/5iq9+pvLeXwsX6RUmffwtxvar0vDTU5mvj9M4hUTh8zlKjfkvnB6nlD4Vpu/BQtH52RL4yVu5KRiESSrRdQOeZtIanB1nnwiedoZq8714YVhPsIOVGdm5P0cv13SaWjUpMT0eZMiGdso6gcSon6soE1S9mi6CDAeYncP4bjbIp/Udl2a+YfQY7iasoa6tjvCfI2uDXLcXeqmvLSJZr3cVqKwQTb0c3cmfUUvIpeGgyb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmD7r3EmgeTCNmkKTfQjmnZG5DouZuUiQm4yZ6r7TS0=;
 b=nz96eCmzLm8TLgG83pVT4idVi3STPH3ndL3F+ImDGS12fMOaMWlY44y/TX54l4escPjX0WJWpcqmvcpa9qhWIyfGpWUTc+MRcrHMTo2SOVKnAuuE/bk4Acp2VaJtx7adUSogJZAnFpq1GnKAulOag28Yc937uNF+3V7QXKLlqla5L1bUe7APmSIIMBaEFKV8XXnrPkFtJpTSJB+SX4aIAghgRo3wSuKGr/q4V1tTXyoK41JFD5Ba3RHKcQlWw8JwF735S4e6BY+PifDQ/UuHAvKURxFtuTi/rGcGGrluHoumTZ60dOeFod6YCiRNJg1NIpsChQPaM+giCcsa5tXKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmD7r3EmgeTCNmkKTfQjmnZG5DouZuUiQm4yZ6r7TS0=;
 b=cKozoP+AdQnLeX8DDB2t5NFQqoVHvQFMfyDxE2JTmXYjRPT2a+iR7VIZIB8sRsaiB38ntF6g6znycUli3lcBwnNeJaDl1gdR1GnpvWvjpPQt9QMu1C4a9jG6yzac1fkOYDhkIYz0lYUyknWgVO+db1mbR5/a1CAL+b0sUoJN1fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Thu, 21 Aug
 2025 07:03:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:03:25 +0000
Message-ID: <9924d04d-179c-428a-b2f7-001e075e8f38@amd.com>
Date: Thu, 21 Aug 2025 09:03:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 alexander.deucher@amd.com, airlied@gmail.com, corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com,
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250820182259.11227-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250820182259.11227-1-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 5612de3c-9d32-4bc3-83e0-08dde080d2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wmo1N3orRGRZVzN3ekVORURQb0lqMlZaVytuQ242aDQ2QXJNTVUrVXhXNlVX?=
 =?utf-8?B?ZTFUcXRYU1ZHcnc5SXR6bGV1Znp2TXJjRE5LRmdqUjM0Rlo2SkMyMXBnRGVm?=
 =?utf-8?B?UTZ3eVNDL05XTEZsSkxYd0U4UkNFZmo1VllYWDJlRmc4RFI3K2xreGF2a3g5?=
 =?utf-8?B?WHRwZFZUUVQ2OHRSUVlDS1l6ZkJQR0VyNEdueHAvK2cwN0FPNmJIV3JXNVpW?=
 =?utf-8?B?TkJXc29PdGRUUEZBcStuWjYwRlFBNC9DWnNXTjd1eVRDODkrV29ZM1VWdnBn?=
 =?utf-8?B?dmFQcTlaMVhaSGMrbWM3SVFnSDhGYnlYUVJHWHU2Q1FYSzhhM2xkWUE5cXcv?=
 =?utf-8?B?ZmJCMGJnNkw2SmNPeXcxcllnb0lGTjFwWjlZbWlqTlpqckdVWHZHd2ZQQUtw?=
 =?utf-8?B?czVFNXc1K0Z4ZDZ0WkN3UGVoV2l5RXFld2hKTlYwYVhMdlQ2V0FGdHJ0ZTZ1?=
 =?utf-8?B?OVBLK2hORUxPaVNucEJseTJXVXFoelp0RmZXdS9RUnJPUzZIS1RkaENkbVI0?=
 =?utf-8?B?bDR1YlIrU0REZXI3SUl3Wnk0aE9hbGgzK3IyZ2ROQytyRXBxYjkxVHc2Z1NR?=
 =?utf-8?B?SFdRcnhIWkx1NUpNK0tKYjltbFo3Qk4va1pWNlR3SjdSSGU3aTAxQmJRallD?=
 =?utf-8?B?MXdKUVRiUHlEWWYxd2NQaDZGOE0wNDlRWXZRcjdJb3JtcThMYUFxbHpBa3BD?=
 =?utf-8?B?ZFJseGhaSEh4bWR3OGpMYkJMV0ovS2N6V2I3RDRya21rT3NTa1k4ZWR0Nzh6?=
 =?utf-8?B?L0dPdDB2SVV4T1pCYkpvb1VMZndQaDBCMDJ3aWJhbC9FUnBpV3JxR1hyOXdt?=
 =?utf-8?B?UDlhMXdHMUhTLzVXaVlOSXNhSmdoZi9Zd3N0WFp3NHQvckJjcXRFNjNWcFFR?=
 =?utf-8?B?NjdPSWhKaWZ1WEswcTNXd0k2U09YNnYvTk9BQ3l3SmdVOEFOek9YdnJtKytx?=
 =?utf-8?B?TjZzRGtmMW5lSHFkRVdVUkpPaE1lOGRzK0VpemZHOXFNL3c3VS92RUZrZElh?=
 =?utf-8?B?WmVQQjdLaUIrWmZBVkU4T0FYeVN0QStDL1pWSjZDQ0FkUDlWeThBSVFtaktw?=
 =?utf-8?B?VStXZzdwQVhxZUtGRlVYeE93V29qUStmaWNkbWlSTFkyMzZ5SGZxWnNOZk84?=
 =?utf-8?B?Q0VFZ0Y5eVdjQTdubXZ6SVNXankrSjZqOGYyUmJaTmlibHJYU25TV0RMYzVW?=
 =?utf-8?B?WTU1M2JMQmxZSGxkZFRCQTU2QUJBOE9sTGwrZWJyQ2NLaFg5Nm1XY01TS3BY?=
 =?utf-8?B?UkpoSExDaGNLTTRIbDg1T0xnQ2tDd2NVSS9ZcVo3aUNOUG5zNUIyd1RsZmJr?=
 =?utf-8?B?cUNMRDZjdlJuTnB3dWlTYVM5TmtIYWZUMVdSdUY3V0I0Mk51MG5GZjB6aU41?=
 =?utf-8?B?SVRIUHhMR0hkWHkyVEp1RkZuMHM1ZFVBaFZ3NnVaNTExdGxpVmJaZit4Vmlu?=
 =?utf-8?B?VVZFa3JUSVRIYUx0YUhmdXZBYVg0d1I4cEg4OEpBem5tcSt6QllnbXYrUm42?=
 =?utf-8?B?eE50VHFWeHkvcnhMd0tkbVpWcFZFYnVPcTVoWFNVVFk2NGcvWUVRbzgzMVJG?=
 =?utf-8?B?akZVZ2dCSGJ2TmZlczllU0dMOUxLbnlUS2FFZkxQNXB2bkJjc2pYdDV6Q3BT?=
 =?utf-8?B?SHVHTXZhd0RFUUllSitJYkt3RGgvRWRVSDNuVWJsb1JMTEJKOFpUMWRybjc3?=
 =?utf-8?B?Z09iVzYzUTlLdlExZStpWVlWTDhKSTlmN05NS01PS3dqVGwxY2Q5RURKMkcw?=
 =?utf-8?B?MWs2K1NaNTV1VURSRnp4Tlh5WndPSXdFNlRnTHVpaG0wSVQ5WVVCbDV6T0th?=
 =?utf-8?B?UlRjQzZOVmFNMFhCK2QxTHJkTDFURmp6R3dIOEdUeWVySTNJZDRETmZPZmRN?=
 =?utf-8?B?cEhnRWw0ejFucVJvZWNlMlg1aExFTHZPRzFBcGZKN1drQzdlSy92d3U3dTNW?=
 =?utf-8?Q?yJmjIOjjQW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFNwaFdGNThSVkZaVHlQeENkY1ovV2xKdjRXM05WUThjZmN4N0RQRW5rY3ln?=
 =?utf-8?B?eDFJcFo3OEtlbUFxUnFqK2RhT3VMMWRuNU0wM0JXUkhhaWxBYnBEeG94dkhp?=
 =?utf-8?B?T05wN21RSTY0RGlLYis0c3NGeE1sNVpuaC9sTGVnYU1hUVNoN25ueUh6ZTd6?=
 =?utf-8?B?a0U3TjdlYnhRSFQwNG80Zk1qNHlMaHR5SDIrdExHQnFvS1FBdE1ZUGplTVky?=
 =?utf-8?B?a05MVW40aFdmbmVBNlcxSTdqU1JMalVGMGs4cTZXOUpmQ1p5bCtkZ2xoRGtv?=
 =?utf-8?B?NDVOVnZ0N1F2ZnFReDF1Vm5RYklMMUI5UFNWQ1UxYnZ6SEJlTytoMWpXdlc4?=
 =?utf-8?B?S0JEbzdPUEREVks1NFUyOExTTDdMdXZJeHh6OFJWcVNWZzVycE1oaW9KNVNL?=
 =?utf-8?B?N1BYZjFDUDBqcGVsaEo0TjFPTGo0ekhCZ0xod2djNmh3SVJKWUNTdmJNTitD?=
 =?utf-8?B?TGFKeVJCdkQ1Nlp6dHZjcEpBc0dmd25halJtR0ZvSTdzNDhyL2RmNU1XOGZB?=
 =?utf-8?B?eDdEVlJ4TzE5eFc2ay9RclMyMnoxci9mWU1HbDliWVQxUlBBT0ZSekZNNUdH?=
 =?utf-8?B?Rm5rZzNCZmVxMFA3UHN0cy9QYkwxQkNRcHhBR3R6WWVTb0tRZmxoa29PeGNo?=
 =?utf-8?B?R2tJWVBGU2g4YmFCZ2tYUHZoQWdXMWkwbUFibmNNMmR2Qll0djRGVWhiUmZz?=
 =?utf-8?B?VFh5RVVDbmJhM09iNUcrbVhpYlBaT25hRmNRVTByelJMYVJFK0JSZm83TEVL?=
 =?utf-8?B?ZE5DRlRZQ0grdW9jVk1xczR5ck5odmxkK0lFRStpaDdCdmVQckMwaHVlVnBT?=
 =?utf-8?B?aTNNR29KNmRHdE40dW5VUWp6ZGN0ZGlQbmo5Y3FlWG51RGVaZnZVNE81Z1Rl?=
 =?utf-8?B?cWxIdHpjeUZ3bytGenR4ZkNYN2x4Vi8xV0U2VWs5QktYb0sxTnRWancyWDlk?=
 =?utf-8?B?cGpTTGk0WjB6T0pjMlZkTW4vZ2pnc3lpQW5jZEZnRHFub2Z5OTB4djFtSkM4?=
 =?utf-8?B?Q0J3SUhud1NZTFVXQ0lUNmJoRWlJWm5zQmFGUXE4MTFkSFF6dStub01QY3Z5?=
 =?utf-8?B?YXJPYlFocEtnRDBiajgwb3dKUUl1QnhpUWpOaFJFdGlNeWo0UDVnbWJCTEQ2?=
 =?utf-8?B?RmFWckFPa0F6M2UwaG8xb0dkRnBmOFYzYlhYVEpBQlJabEw3dHFkK3ZLZ2dl?=
 =?utf-8?B?cEJIZEpJRWs5RkRoOGFjaGJaREVoQU5sb2FFM3Q4YXNYS1dTQitzaFlsR0dI?=
 =?utf-8?B?L1VTaHZYbzQvVkl0NkVzYmpuNitIa28xVFJyVmRoUTkyRkdUZVd3OUJjUGx5?=
 =?utf-8?B?alpvY1dkdHY4VDhtYy9OSFdXVnpCY29KajY5ZWQ1emUxNSs2TFFiakFBcFJB?=
 =?utf-8?B?ZmVnQjNVdncwMmFkSkVuQTdoWXZPUHVpdzBFZWNiT2FjK0JBYVhEL1NydEZq?=
 =?utf-8?B?QjI1bkQ4ZmNJMVo3U29CYjB6Y3BSYkpXWHorMWtuU2pqVkg1OHpSTWZ5cWFT?=
 =?utf-8?B?azJEK2JVRkdWMHhNSTZiRTNIZUVBdElObldEK0hnSVlqMC9BOTBCVCtoRm42?=
 =?utf-8?B?cjY2cEtmMEN6Vm1iaVVheitYYU1UV0FPUnlVQWlMRUNINFc2VFNwZERMWFlt?=
 =?utf-8?B?UlZENGF4ai8rYmhrdHpNdFNRSkZ2VkJXZWF5QWRuV2FLc3I4RGh2N3RDVEFY?=
 =?utf-8?B?RFA2V1BaQUdRYXUwa2ZPQzd5cnZLNXhkVjJydkRKeWZCZlJuNC8zNU5wRnVr?=
 =?utf-8?B?eW5RZUhSVTl2VHVRN0xFVkVreFZkdGNMWVA4Y0xkVDB2OExSakI5UHkxeHQ0?=
 =?utf-8?B?bnNDa005blA3VTg0RDhJWmlHQk13elhTc0JYZ0s5THdOdmJpamo4bkdFSGF1?=
 =?utf-8?B?a3lzL3VTaHBtNHZ0ckpMbEQycEdwQXB1QlZNeEtLaHc5RW5Gelg4ZlZMbXE2?=
 =?utf-8?B?Zm5yOEdWK2VUbXhFak5MUmN3Q3NkWG1mejNSM040RzF0Wi9ySU1Gd3VCTnFl?=
 =?utf-8?B?MVVLVEZQMDNJWmZPME1YeithelJvUFFmeFI2YW9zSGUyMDFZQng1cWdXdEUr?=
 =?utf-8?B?SjhPSXZOQWRRa1drc3ExMml6dkluekxia293L3BaaXYwU0dMYjZleW91MHhq?=
 =?utf-8?Q?I3eSuDNtZeYkD8EDrN50BK8vN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5612de3c-9d32-4bc3-83e0-08dde080d2f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:03:25.8610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyOgf+DtX3OVG/gyrmq5x6Wt6nUzdQsXmO26HwmLRIpNQX4f5eADkZhis+8/aWKK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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

On 20.08.25 20:22, Rakuram Eswaran wrote:
> Fixed following typos reported by Codespell
> 
> 1. filp ==> flip
> In Documentation/gpu/drm-mm.rst


That is not a spelling mistake. filp is often used as acronym for "file private" and as far as I can see that is exactly what is meant here.

All others look valid to me.

Regards,
Christian.

> 
> 2. complection ==> completion
>    implementions ==> implementations
> In Documentation/gpu/todo.rst
> 
> 3. unpriviledged ==> unprivileged
> In Documentation/gpu/drm-uapi.rst
> 
> 4. propogated ==> propagated
>    aperatures ==> apertures
> In Documentation/gpu/amdgpu/debugfs.rst
> 
> 5. parition ==> partition
> In Documentation/gpu/amdgpu/process-isolation.rst
> 
> 6. conections ==> connections
> In Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> 
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
>  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
>  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
>  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
>  Documentation/gpu/drm-mm.rst                               | 2 +-
>  Documentation/gpu/drm-uapi.rst                             | 2 +-
>  Documentation/gpu/todo.rst                                 | 4 ++--
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/gpu/amdgpu/debugfs.rst b/Documentation/gpu/amdgpu/debugfs.rst
> index 5150d0a95658..151d8bfc79e2 100644
> --- a/Documentation/gpu/amdgpu/debugfs.rst
> +++ b/Documentation/gpu/amdgpu/debugfs.rst
> @@ -94,7 +94,7 @@ amdgpu_error_<name>
>  -------------------
>  
>  Provides an interface to set an error code on the dma fences associated with
> -ring <name>.  The error code specified is propogated to all fences associated
> +ring <name>.  The error code specified is propagated to all fences associated
>  with the ring.  Use this to inject a fence error into a ring.
>  
>  amdgpu_pm_info
> @@ -165,7 +165,7 @@ GTT memory.
>  amdgpu_regs_*
>  -------------
>  
> -Provides direct access to various register aperatures on the GPU.  Used
> +Provides direct access to various register apertures on the GPU.  Used
>  by tools like UMR to access GPU registers.
>  
>  amdgpu_regs2
> diff --git a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> index c1b48d49fb0b..bc7de97a746f 100644
> --- a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> +++ b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> @@ -100,7 +100,7 @@ represents the connected display.
>     For historical reasons, we used the name `dc_link`, which gives the
>     wrong impression that this abstraction only deals with physical connections
>     that the developer can easily manipulate. However, this also covers
> -   conections like eDP or cases where the output is connected to other devices.
> +   connections like eDP or cases where the output is connected to other devices.
>  
>  There are two structs that are not represented in the diagram since they were
>  elaborated in the DCN overview page  (check the DCN block diagram :ref:`Display
> diff --git a/Documentation/gpu/amdgpu/process-isolation.rst b/Documentation/gpu/amdgpu/process-isolation.rst
> index 6b6d70e357a7..c1297a9e4d09 100644
> --- a/Documentation/gpu/amdgpu/process-isolation.rst
> +++ b/Documentation/gpu/amdgpu/process-isolation.rst
> @@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
>      $ cat /sys/class/drm/card0/device/enforce_isolation
>      1 0 1 0
>  
> -The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
> +The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and fourth partition.
>  
>  For devices with a single partition or those that do not support partitions, there will be only one element:
>  
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..3496ef28b15c 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -153,7 +153,7 @@ size in bytes.
>  GEM uses shmem to allocate anonymous pageable memory.
>  drm_gem_object_init() will create an shmfs file of the
>  requested size and store it into the struct :c:type:`struct
> -drm_gem_object <drm_gem_object>` filp field. The memory is
> +drm_gem_object <drm_gem_object>` flip field. The memory is
>  used as either main storage for the object when the graphics hardware
>  uses system memory directly or as a backing store otherwise.
>  
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..7435664a1ffe 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -535,7 +535,7 @@ ENOSPC:
>  EPERM/EACCES:
>          Returned for an operation that is valid, but needs more privileges.
>          E.g. root-only or much more common, DRM master-only operations return
> -        this when called by unpriviledged clients. There's no clear
> +        this when called by unprivileged clients. There's no clear
>          difference between EACCES and EPERM.
>  
>  ENODEV:
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index be8637da3fe9..1d064e617699 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
>  
>        vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
>  
> -- Set the mkwrite and fsync callbacks with similar implementions to the core
> +- Set the mkwrite and fsync callbacks with similar implementations to the core
>    fbdev defio stuff. These should all work on plain ptes, they don't actually
>    require a struct page.  uff. These should all work on plain ptes, they don't
>    actually require a struct page.
> @@ -854,7 +854,7 @@ Querying errors from drm_syncobj
>  ================================
>  
>  The drm_syncobj container can be used by driver independent code to signal
> -complection of submission.
> +completion of submission.
>  
>  One minor feature still missing is a generic DRM IOCTL to query the error
>  status of binary and timeline drm_syncobj.

