Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4694EDC0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 15:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6789C93;
	Mon, 12 Aug 2024 13:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FYLvUpgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3781C89C93
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 13:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhCFnU1XcCRa/+EgV11NBJLTeKbwFDpgXJNOrDNnYd3L1eJd8oeCO3vGdPpXgimB1yNWNMflzxpZl4rbYi8Nn9g+Rfc7gePNB8DQ5p9Rw6UnhViDynXLHWyHZIu6vu7Cj5fGnAkzN2U7Bv7tYk0smGW7VMQRFegSK3s55bVX55GO6E3+ce43ZVdGMMc6lTzeaCrqza6BEWF3A9TJ2RWnlKi+qEQKK/SfGBMIoDZEo1Y2a753lvHvGrOBwhICBnpixEN5rs/Z252syR8RSl6HSwsWwRKKC+Zt6mfd6aMLWubXC5EcI9/LXDOeDcSqilr7Nsujqz42+DzOAspu1nvpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2U1q27+UAuM6u7DbjDblASpHLtsqh9c0geNbWRQN3o=;
 b=saQrb/p7JefHO1cQ7FgKVaEo6C6Fnswlj+hi9UBzPlBms8VHzldGdVCB3o6ZG1jBPiAMnvIDO2covk19Rew1pJtooR5M995cwFfp+TFWziPAZTCDUnosgsLSPH6rzo66MsF78aQjED5pPek66YpMg70czN63uz9gsA+XNcbcM91CtnMj0gZM6bVC/blzwAcRT8K6pdx/pDDuVMbl2mazO5e9qG3SpjbB4gJEUpjIHZPhD/9oO04ep+C5YOW3wKqTwKWbSDFQjxbLOhydXoXX7lyqR7XijbYpjE86obrcPxoSCSsJElsjygph6heXK8306XMjYujbFkbJaOZ2wLp0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2U1q27+UAuM6u7DbjDblASpHLtsqh9c0geNbWRQN3o=;
 b=FYLvUpgofNZfjU9ozyaaVAeRp3dLuiB0OJ1yKWFl0Go1hkRAoUcikCAPg61iiCDZ6zyvviA+yMvSExdKdn0CMutEbltPN/eBhowxLb4/xSphLLAR2WocLPMK1Jnt4oqLs0ciPf0LgFsytNJvp5YMR4jvh4du1lF2fYvJv29SdPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by DS0PR12MB9446.namprd12.prod.outlook.com (2603:10b6:8:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 13:08:27 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 13:08:27 +0000
Message-ID: <cf46ea4b-425d-4505-a029-e071b1885d8e@amd.com>
Date: Mon, 12 Aug 2024 09:08:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kerneldoc: Fix two missing newlines in drm_connector.c
To: Daniel Yang <danielyangkang@gmail.com>, skhan@linuxfoundation.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240808084058.223770-1-danielyangkang@gmail.com>
 <20240809032350.226382-1-danielyangkang@gmail.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240809032350.226382-1-danielyangkang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::22) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|DS0PR12MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 425573f6-aa50-4e95-17b1-08dcbacfdb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1I4dCt1UkdHTVJybVZhaVpBZU9aWU9QK3FmSmQwbFZVSlZ0STRCTWZqdnJC?=
 =?utf-8?B?OUNnS25BVDl5K1E2bm9qR3VIVWtxSjRvUHVKbHZneUJuQnFLbDBEVi9FQ04r?=
 =?utf-8?B?T2FvZWZvOURRSXh3dDRtamhQUGZKdm9IeUpuWDYwS0N3NmFEbWtSZWEwbGpm?=
 =?utf-8?B?UzJTZEtWb0g2TEduZlZzd3NjUXdvL0Vud0RjQTFCS01IUDg1ZmNsTkE2a2xH?=
 =?utf-8?B?QjhYalJScXMwckRibUhzNEIvcGhhWXdacWVGUzBYcVlOT21sZ2x4cUt4bGxC?=
 =?utf-8?B?L0lqblVhb0FPb1pQWFdKREx5YlhaSURTWjA3dFBhWlhrcTU0U25OM3ZoNXZH?=
 =?utf-8?B?d2tiNUUrZklMMXdXMUZkMzRqZlpoTW5Ib1c3akpIdWR5RmtzZ1piNzhxVXF2?=
 =?utf-8?B?UFF5ZUdGWUs3Vy9xYTFWVkJSSUJlRHhDb2tmUVJUNTdGdEx2bjRPQXRmUE85?=
 =?utf-8?B?MlFoRHR4dHZaVXpqM2hBRkxRUGxzeVJKVElUNkVMdzh3WjRURkNoWEZpRW5p?=
 =?utf-8?B?Q0FUMWhCQytqWXNwNVplYlBJbUJ4bG5MNnZZRHNyMXU0NXIvSWp1V25tZm9E?=
 =?utf-8?B?RDFxOHppRWlzektqanpVdzZMeHhVQks3WXRuVlYvV3o4TmEzUkFTVTlIZUxY?=
 =?utf-8?B?WDkvcmRTYUVIRW5rMDZXVUphbmozdmJyWlJLUVdOOFQrVjBqeGVxbEZZc25z?=
 =?utf-8?B?SFI2Rm9HTlBIa2hvQmtwY1FHcEE5S2psZnRHRDhmMzgwOEs2NlV0NG5FVTlV?=
 =?utf-8?B?cFM0OG1qKzJjeHppcmV2NWNybG9LZTJJRHN2djJsekhKYlZYOXg3Wm1GckJE?=
 =?utf-8?B?NkVjM2V0VkNJUHYrQU1meUYxYjA5c1kwaXJuWjlvNHdlSFMwS0MxOSsveUMw?=
 =?utf-8?B?NnVaOFB0bTlHNTAvVmlwYWtCY1FobFcxSjRRN2lTUEo4dDQzZDJjV3ErSUxj?=
 =?utf-8?B?WFV3TzBvbG9yaXZxeUd4WmVXdExLbHpES0ROWjI2YTluNlltQVdqNk9HY2lu?=
 =?utf-8?B?RitRQU5Kb3JVdmx1YXBmaTdVZk05MU9KUExHOEc5UDUrS1Q3Um95aG11ajdY?=
 =?utf-8?B?WXIwM3lsMldTU3k2MmIvK2VNb2srNHJ6ZG8zaWhLUGh3c2FtZFFPeEdsSG5L?=
 =?utf-8?B?UjVTQnkyTjMxdTJ4YmNFc0hvUzdBZ2RzSXI5TkhVdkV1dHFFcEx5akVqaWxu?=
 =?utf-8?B?TENLUkkwbFZmcXV3LzJzNU1mRXMrRnhCY0YyaFJtbjJUSWRoc1NsQXVESGFu?=
 =?utf-8?B?SllETUhJVFpBMTNxZVcwNmJYRjJwZ3c4QzlELzJ3VUV4S0xoOWpMeDkxdlBU?=
 =?utf-8?B?QU5HbTJGdHVBUUxMM0JraUdoUUVYc3J1N0NpSXovbEkwKzJUUmc4QXpJN1FI?=
 =?utf-8?B?L3YyVGc1bVpLNE5JSUR3VlZISWVEck1FaE1IR1pLVnNmcHdNbDZhWFE1TGt2?=
 =?utf-8?B?VEdyZ1ZEZFNHVUFWbkdpblQvaHlqdXFWVThPM2hjRUZFTTRPbm1zSzliaDBj?=
 =?utf-8?B?eE56QjZMdnZZYnlJb2d2aXlvTXVuT3hRSnU5dHVaaXM1TXpFTm8xdjV5SjA2?=
 =?utf-8?B?L1pjWGpZZ3RLSFZiWnBXNTQ4bjNUWWVhMjJQYW56ZjVnRWtodUd3NjM2cVp1?=
 =?utf-8?B?Y1YrV1B1Qk9zWGp3VkZZb1R1enlpSGYzd0J5aHZsNzZ5TWNBNUZYQ2oxV2xi?=
 =?utf-8?B?U0loMDM5cVBNd0s3SVUxdjE3QTdjS0Q1Mlc1aUU5QTgrS3NOTm5ac3hwbHhB?=
 =?utf-8?B?Rm14d3RlV2J6SzBlUnFPUmNWamlWb3NkSjI3MjBiNE42U1VCNjBHWXJkaUhw?=
 =?utf-8?B?dHNpVDZnM0NvMWUxWE04dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNNYlFkZ0h1c2RRc0dTKzAvdGxtREl4SU5IbVJpK3FwWXVSK28ydHdoNGV5?=
 =?utf-8?B?SnBKd1VEL1A4bVZkNk5hTndTUG5XYncyUldEWmZObDUvd3QvVEdqMnZNNDZV?=
 =?utf-8?B?OVZiNU0rbkt2Zng0aDJYZ2hMUUZiZDZnOXV4dFB3MDRaN3NsQ2dJL2NuOHRC?=
 =?utf-8?B?ZU4wTjFvazhaQlRnb3lCekhXNWFtN0cwekx6MlJaeXU1QUdDOVdwWHZYM2xu?=
 =?utf-8?B?ak9vUEMvbEVZMndMK1NRZXdjbWw0Z0dYWldtRTFtaGpvZ1FkVHRhR1FKeFU5?=
 =?utf-8?B?QUpaNXppb29ZUWsxOEgrVEVNUSs3VlJjNlNXV1NNOFRDMC9MR0tSbEVWaDUx?=
 =?utf-8?B?blVCTnp6bXhjQ3pYZFFqaVR4Z0R0U2kvd1ZUZHZkY3Era3dIL29VYTFEVmZM?=
 =?utf-8?B?QkVPZ21aeEFmN1NwcXUzdjg2MFV5UVhIUC9meW81WXh0S2FIR2l3R0w2Rk12?=
 =?utf-8?B?YW5Ua3UvWU54emcwem9BMnBVNDAwQkVodngwS0hPK2JzNVYwZnlRRFV1eHNn?=
 =?utf-8?B?RWtEZWRNWXJ6YXBjUVFsWG5zcWdJVnhPVmFpTlZTTUhzeW1YeWJIelZCQW1p?=
 =?utf-8?B?NWh1TU5LTDBUMy9PWTk4SW12cHdjdTFaSWNyWVZyWGZONTVqdFVaemtpTkFI?=
 =?utf-8?B?L0xyb2FRb0w3N1NjaGhtanV0L0hpaTFGRFZvczBOdyszR05Fb2FkTGViL1Bj?=
 =?utf-8?B?cHNLL1ByaWdHeURwMVE2V0hSUTJBUUVZVGg1bjZIcDRIcGxzNHIzMnFDUmNT?=
 =?utf-8?B?aUtZZU5JV1dPZ1c0MmpqNlMzWXpDb1dCaC9uSFlmRTZlY2xzRGM2SWxCTURG?=
 =?utf-8?B?R29Zd3I3VldSV3dxOFN6SHFZenRVNzVzby93U1pQN1dka29VYWl0bjNJelZG?=
 =?utf-8?B?OVhPRFFmUDUzZ012cW42eEdIYkpMVy9qaUk5K3lxdTdQUnU0ZU5Fd2pSSUwz?=
 =?utf-8?B?K3NTZzMwbVdtaVNWTklOV3E4bUlvQk5EWDBLVkI4RkJPTmQ0SVNRb2FLVTFv?=
 =?utf-8?B?d3h2WjBGRXRwTHp5Ni9QNldIM3JITzNaZnlvY1lDZkJZbWxVME1qQUFYVy96?=
 =?utf-8?B?SDZ5OXkzZGw0U1FuUFh4RUlyUGt1bmJYOExBc0dxNlZKYi9UYUJEdCt1YWpB?=
 =?utf-8?B?MmkzKzY3b0N0VzN6dCsvd0pSZk15K3dMVVdnVG90WEprcDJscm9kQ0FIR2VK?=
 =?utf-8?B?RTN6OWhZOVM4RytGYnZCMHljYU9pRk93cmU1Tlo0cFNPc1lZRFcwdVZEWFV5?=
 =?utf-8?B?T1RyQUg5UEVTUDhKK0JhRExCVFVRMSttdnA4d0ExL1lyRUpPTE8xZG1BZWZn?=
 =?utf-8?B?dnRMQnVBM21NU0w1WnZEODJ4MU56RzF1ckQ2ZWYrZGx5VXl3a08xb1BFQlZl?=
 =?utf-8?B?YUU0Zmw3WG1QSUlCWnJEUWVvVndzb04rTlJQY0VFa25jSFhtOS9kbUl6R28v?=
 =?utf-8?B?Uzl1VkwzRFhYTS9lMTZ5eXR2RkM3Slg4Si9yTitCMDBoOUZrNklhZmkvSVpm?=
 =?utf-8?B?SlZvRnZvT3F5ZFVGQ05SNy9ITnd2VklvMk9LR1BweVpiZ0NMYjhZMklKc2tG?=
 =?utf-8?B?YmVnNEpZSzE4V0lwSloydmVXVTZHSGxrQU5vMGp6TVFncjU2STFzUi9TeUx6?=
 =?utf-8?B?ai9GMlYwZnB4VjUyTDJna0ZYNU9HblR4LzhCWWJQbDdqVFdVY2pFb1dnZDF0?=
 =?utf-8?B?R3JHem1CaGtpQlBpNloxS24xSnVVVXk5ei9PWGdES1JkdnF2TFJ1eHY5QVlW?=
 =?utf-8?B?TzhFZjRYdzhZc3FEM2gyZFBYZjBhWFlJQS9QMW5NdGIwM0dlMngvTU80S25I?=
 =?utf-8?B?dENZaG5Sem1jcTVYeXhZQTFFZ0JhOER2VU5oN3RvMXE2RHNZUzhvc3JYd0xk?=
 =?utf-8?B?Q25DcE4wUEdEc3pOMFVqeGdER3pmaVVYVU9WL2hVNDhOWGx5SU5nMFRSSTRr?=
 =?utf-8?B?WXdxaWM0blM4WTROMjdYNEZkLzN6VjA1NXZEUjFpQnRJMmdVdkM4QU9JSHpn?=
 =?utf-8?B?OFA4amVwclNrbU1sVFRadEVDb0M5ZTdxRzdqM2hDT01ORnkzWFBCLzY4dHR6?=
 =?utf-8?B?aldpK3EwbGFvdVI4UldTNldyakNGWHNIeDF5cjJMZ2RCSnhneFExcVh1YVJP?=
 =?utf-8?Q?MyPVY6XIM1x12OScnBSaOhYl8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425573f6-aa50-4e95-17b1-08dcbacfdb06
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 13:08:27.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHqS7NP/r3Xz4HHlmKE49A/jma4XFor4HTslSkDWhmV1FtXwNwhEdEuwAQd+T6AUlZWjqCR1ml1CRfBSUly3AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9446
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

On 8/8/24 23:23, Daniel Yang wrote:
> Fix the unexpected indentation errors.
> 
> drm_connector.c has some kerneldoc comments that were missing newlines.
> This results in the following warnings when running make htmldocs:
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2344: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2346: ERROR: Unexpected indentation. [docutils]
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2368: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> ./Documentation/gpu/drm-kms:538: ./drivers/gpu/drm/drm_connector.c:2381: ERROR: Unexpected indentation. [docutils]
> 
> Signed-off-by: Daniel Yang <danielyangkang@gmail.com>

Applied, thanks!

> ---
> 
> Notes:
>      v2: added "Fix the unexpected indentation errors" line to description.
> 
>   drivers/gpu/drm/drm_connector.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 80e239a6493..fc35f47e284 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2342,7 +2342,9 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>    *
>    *	Default:
>    *		The behavior is driver-specific.
> + *
>    *	BT2020_RGB:
> + *
>    *	BT2020_YCC:
>    *		User space configures the pixel operation properties to produce
>    *		RGB content with Rec. ITU-R BT.2020 colorimetry, Rec.
> @@ -2366,6 +2368,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>    *		range.
>    *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
>    *		driver chooses between RGB and YCbCr on its own.
> + *
>    *	SMPTE_170M_YCC:
>    *	BT709_YCC:
>    *	XVYCC_601:
> @@ -2378,6 +2381,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>    *	DCI-P3_RGB_Theater:
>    *	RGB_WIDE_FIXED:
>    *	RGB_WIDE_FLOAT:
> + *
>    *	BT601_YCC:
>    *		The behavior is undefined.
>    *
-- 
Hamza

