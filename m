Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534BAA8D8D
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2010E308;
	Mon,  5 May 2025 07:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3oXSO3Ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3E510E305;
 Mon,  5 May 2025 07:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eal5MgpvqtCtHcyWpb9ChSc3ytJqnTrIAhKmCXchSC7vNN4Xca5NxQgpG+nL/LjrSThMKLdo65wp4gmPU7euABDpkWN1c4mBkn7s/myjfsbpA74Nr4XTEkQ+8q6xGHijlWPLLR8NwZunvtuhHgxJ8FZ+IS2+nJI2/BBy3hrLGnWUlYtLvHt8ILVOQF2uyY0o8tAEloAAA89jMGHuaboxaLTAU3T48gmIVn6raMFNIHIBqF6MJDPQ9Im2jKeTVA/JuN54N8P3kebg5fzODplATq0ULGji495Nw1y6+xKBxvtt+r+xbX0VKKmAGP0rtgqphWWt6aUObLFApMDQ+x/E3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAHSRDBCcU/SeKNSReP17tgFKU3Xusfb8akTeAiDb0U=;
 b=LFGzIRkw0SCZASgdHwcNK0Nq1Hs20HWWYidgxEqpsPzt7PcfgjUQ0cJXa8oF0aE0GPb6ST9wbQqREKBx9QhCfAt+dsKd7puL9EGP1RdoDGu1S2pxD95jlGhEfirmRP9hhFLXxlVHOkkWL70Rxu9Ey3v1qLFKuRS3ayPJJKd6LmKTGZY1ra7OVjdwPT7ryyO4rKCCglBrk79Z6GW3OIEIBvEHSPODsZvtWoj++O77FUSnwDOAVD1k7/4LT6Ao798Ktyu+1n+g3DCX31Jjuh8sDp8Fpeh9HOvYjpLf9WRAGbxF1W7k+5MLaLQikTOIKz+NZkKBTBnnfnlqG2qr2r71uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAHSRDBCcU/SeKNSReP17tgFKU3Xusfb8akTeAiDb0U=;
 b=3oXSO3IbAKvMXmRmxSTmYHIxtDS9W25d93jaI15cqDtwxcpuuKIX/IKu17sRLfnDqeGZ/ytyAxslFlpfdFwyh1j0VmW6ZhpQfUVi+b+JpOUBnesb9/hyquNf24YsGh6a8u7gAamwHBWY9StBbR4qdE3KZHtstDZ8KBI4HcBAXWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 07:54:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 07:54:51 +0000
Message-ID: <3a4297fd-4554-4727-ab05-feaddaf63ea5@amd.com>
Date: Mon, 5 May 2025 09:54:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/33] drm/msm: Add _NO_SHARE flag
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250502165831.44850-1-robdclark@gmail.com>
 <20250502165831.44850-22-robdclark@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250502165831.44850-22-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: a52dd317-7807-48ea-c071-08dd8baa1d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWNKVE1yRmc1N2tFdDJmM284ODhLNVlwL3J3NTVYZ09vR00wSXBMVVVXaVBC?=
 =?utf-8?B?YnlVYUlhcytFUFZoNXBLNWNIWXRKSnVHeStMcHp3SS96MXRjejBhR2htM3I2?=
 =?utf-8?B?THd4SkoxRExVNFdnT08zbEp3dG9KbGxMcS9aeXBVWWQ4RFZodkFrK1pLa3Az?=
 =?utf-8?B?dk1oeGlwMDdHeFhaakg5dlc1RFljdCtMWlpZSUFsaU9NQlF3SVVDc3VrVWpi?=
 =?utf-8?B?c2dRRHpxV0JxSWh2K1Y5UmVxVmxzZldtc0lWeVdkYWkwdC9UWGEwRzhxTGhH?=
 =?utf-8?B?TXpUbENoQnlCOW5TUnZMa2JFc0VoTVJiakx4ZCsySlU0bWtpRjNZM3BnSExY?=
 =?utf-8?B?ajFzRmdVeUQ5WDBQTDNJS1huTzQ3V2l4Q3g0WlFRaG13WTQwOU9RK2F6RUNH?=
 =?utf-8?B?RU5WNm1PZ1ptcWQ3R09VQ3V6Tmp2eThRbHNVVzNSd1FIR3NNTzdycE5JN1Vh?=
 =?utf-8?B?eDNMcXhiQ3VBQ0JvUTF5V2Q5V2xrZEhJa3BFZHVuL2ZRWHcxRUhoRkswbmZD?=
 =?utf-8?B?aG9CSnd6bjhyT0pzSitlWmdXZitPUkw2enRab3JQakZ4OFlPWnRTMlZwdlZV?=
 =?utf-8?B?Yk94TElPYjRCU2dIa2NKNCtWYzVKOWVxcXhqMWN1cDl4R3YrQ09kWmJxazFK?=
 =?utf-8?B?VTEwQVM1bWtCemZqS3FONTBUZHBzcU9rblNqcldIdExtWXNDb2dSK1FyWnhD?=
 =?utf-8?B?NGh2VElkdm5CanRkZnRxL01DYlI0MDNLMUZQOFlMUHZKRHc5U2dpYzdzYmdW?=
 =?utf-8?B?SXl5WHR3RmtZT3YzL29ocVVLZ2sxQzMxVXVQa3hHdXo3czNQeHhqUXQ0QlhK?=
 =?utf-8?B?bU9iYWNQeFc5Vk5ST1N4NnFqWE9ORnpGTSs4cklPNzhXMElDVmluVVVMR0hW?=
 =?utf-8?B?c3Nrcm96M1lvdld1K0JkUVVYSTVEM3A3RjJNcDIrZE03TEtBbDNpK2o1S3Bh?=
 =?utf-8?B?cFBmcm96YVBHVEM3OWpMdVJjQkFuT09Hbzltb295TkVLYTFFZkFVSU9YOXc0?=
 =?utf-8?B?bTRWTTdpRU1ZVmhlZG9HSDVJblNqVzkyUHMrS29TV0xPWDc4ZzM1cERHT3k5?=
 =?utf-8?B?aDU2L0ZSektXU1hwazdLNlRPQ1ZjVE1ITkVudmtJUExMT2c4bkl3Y3liN3l6?=
 =?utf-8?B?dDk4Y25aSG9wQWlhaG9IRzhrWW1XdG16Z0lqR2NKSjJNL3Z5UFVoMC9SZGZw?=
 =?utf-8?B?ZTlSamNXcHJwT0RVdWNBOHphekJPWThObzlVcmM0YUFraEF6WnI0K0poVzkw?=
 =?utf-8?B?YzJZRG1kOVBNRXlaVi92SGtvMDVncUFiYkFTT1IyRjVnZTVkT2NYVEpmWG1C?=
 =?utf-8?B?MWpFY3M1VnpqTjJTUVA2MkpNWkdZWkxQSGFYb1poMHhnakc4bHFoT20zQ25u?=
 =?utf-8?B?S3JKdktSN0JGYnBHVk9MbGwwRDlIcFZucFJDQTErZDhrb3RkM3M2NjBTeGNN?=
 =?utf-8?B?OVFhVFpSNi9GVmVybXJxd2N4ZTFqSkNCZXBxQ05uZEMrczkvMXBYUko1UUtM?=
 =?utf-8?B?Smo4MDdsMmZmNUlhbzBYb3k1c3BMdlNqZDNkRWtHRFhZSS92c05WMDIycGta?=
 =?utf-8?B?N0RCeFAyTDUzanBPYWdBeEp6TWdjZGtjNWg0YnlYWTIva1Q2TTRUbkZoT0FF?=
 =?utf-8?B?UmhraE9CUk0zMk5EQkhWL0dkRENTTS9TS1R1WDFUVjQvZ29qL20rTExwaWVj?=
 =?utf-8?B?Q2xIeEhzcnVZdmpMckpUTUNoVEJPanZnb2RVSTJwK1oyN3duUjhGeUJTakRr?=
 =?utf-8?B?dklSM2g5MUI4ZjBQTjV3NXBPQ2xiWTBwdG1OQkhkLzgyVUQvd1JYVVdqeVFT?=
 =?utf-8?B?NDNhSTlSZmhMaWYxaFhjNDlZdmRlUC95MkV6WDNJWVRkY0pjTms3Mkd4eE9P?=
 =?utf-8?B?aVk3MzF5Kzd1aWRHcEZPdDF3ZXIrLzNlSmM3RVhqa1VlbUE5WE9OTlFjVmdC?=
 =?utf-8?Q?vQBN5D1egrk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjgzZ25kNE9zMU81VTlkekhaL1doUVVXaDl0YVFVRTh3K3dqb1dPQllUMk8r?=
 =?utf-8?B?bUVneEJBeWk0UkdtZWozb0xrMEk5Mkl6dkhRNXMramZncWFSbEFtaUxOR2NT?=
 =?utf-8?B?VWZmYUQ3VDQzbHMxSE11UmEvUllXVHpWbUJ0cFhRZVNPUEgwejBaS0lZL2ZF?=
 =?utf-8?B?eWxibWJsMER2WGdKWWFYZERrckY1RUduOG5xcFc4U0lhSGo2WmxSSkh0M2Rm?=
 =?utf-8?B?aEFEbjJ2ZURBMzhZVWtETDRENTRERmIrWUNoTmF2SUJsV0E0cVNzeWdoRlBi?=
 =?utf-8?B?d1RWZFRVakZUdkhTbC9hLzNsZmVCSWp4Z3k1c1h4b3BXUXJNKy9meGFuNUlH?=
 =?utf-8?B?SnM2a3VuWVRiN0JXVzN6MUVDVmhzQi9QaFppYksxcVlabzJLdzQwZnM0N2tB?=
 =?utf-8?B?K0hmdnRnTkE2cmZWSFAvUGNDenVwMDdINmpONmYzSmpwWVBTM3ZlcXpWcXdY?=
 =?utf-8?B?b1lTbHNEYUt4OFNUNkRVeVZqN0F6aGdZK3NoZnA2eVMrTGhFQ1QyNXlndHdt?=
 =?utf-8?B?MTI0d25rUHVoYm9FMFh4NUZkOFB5NmRvUWpOemVXeEJ4Q3RSQ0F5U3pYdnZG?=
 =?utf-8?B?dzJCZnRObEptSi9BcXBYYUhMTkRzajhIMkh2L2lSN3VoZEJ2TXNvWlZTbC9B?=
 =?utf-8?B?MmxCZmhjRUFVdFovOUZUQ0RiZzFVL3IybDFWb0VXOFB5d0RYYXFmaWZnOXhk?=
 =?utf-8?B?QTE1YjZ3SThzZmtRRklUOEFNRWg3ZGd1ZFNQWDZPRlBJQjczNXVlSDBRU3Fz?=
 =?utf-8?B?KzVhbkU1VVE0dGNUZ0FyeE5VT1VHbWRYQjBpT3ljQmhZZEVzUGJiSGhFUzB0?=
 =?utf-8?B?UVN4NThyTGowTVdaTmZRVGN5b1FTVFZSemxCbmxVSjJKWG5KcW8zeFBab2p5?=
 =?utf-8?B?K0tHZXFOUzlPeWxoSXQzeHB0cjgxaTVRdG1oQktHeW1nOWpOQ2RlbzZnbVFX?=
 =?utf-8?B?OHpZUjhYUHZaOHFVd0pjTk8vR2JjN0VEam16Qm9kK2w1RDJKL3g2Zk05eExk?=
 =?utf-8?B?ZzdvaVFGS3psL3ZVUTJFdGhvcXBtM0IxOXB1bHF6LzN0cHF3THR0ckFCWXcr?=
 =?utf-8?B?UUVydHliWGhGdnJzQ0MrYmRZNmM4bGViQjVvN2paMWllK0RnUzlCQmlrS3hw?=
 =?utf-8?B?am40WTlwS1ZSYkNOTStuTFh0TjhzVVdONjJuSGFUK3lENHFnT3l1U05vZlUz?=
 =?utf-8?B?R2xqQU5VNHRLOXpzSkJnZnh0Z1J3TUV0ckFlakFZbzZoZjAxK1kxOGtJSVpx?=
 =?utf-8?B?clh6ek1ReS96NE9OQnpGNHdUQkRHcGgwbENSMVpiMXJZSXI2NmFDN0p5NHpS?=
 =?utf-8?B?RmtMMXlDdzhycHM1b3FkUmFsMzE3ZWF0dWpPWnBDcmVqNkF2U3JUOUlvSy85?=
 =?utf-8?B?TG9pZ1h6d1lhVUp1R283amxLcjFmQW5PU0VhZXlwWURCQ3hVL2tBaXZaOXMz?=
 =?utf-8?B?L05tYXpqVWhjSXBYQjg3RU1qcXpidnF5L0t3Vzg4UlFkN0lHQmV1ZDBXd0RQ?=
 =?utf-8?B?dzdBTnFCQm1qRisrV0FjK2k4TkNXK3VONk5UV3o5KzJWL2VkNEprQmJ2cHVE?=
 =?utf-8?B?REk0SFFFV1R4UG9xU3N4UThTc0g2WXRPelltYXBlZ1ZBam1kU05yU25MbWRY?=
 =?utf-8?B?N1FJK2VhK01FZFJFNXRVYk5URUxiUzg0SnJmTlp0T3RZVlVzR0dZT0xKQ1E3?=
 =?utf-8?B?TEtvRldGODlZL1BkQ2tIUzMyWUJmVXpPb09WVytxWlFKS01HcEsveVVoT3cz?=
 =?utf-8?B?eHl2eC91SlJyN2I3K2dlTWxmdm5ZNXRyYjBHczh6SUR1MmpydWhDV3ZYMHZG?=
 =?utf-8?B?SksyNHEzdnIrYjk0M2tweUIwcGNqK2N3dm1KdUEzaGUxb2JPa010RVh1T2Fi?=
 =?utf-8?B?Zm95TVlpdWdYeWdyTWIvRjVCVWllQ3RPQmUwUVlOYk41SDI0KzJHMHgremNU?=
 =?utf-8?B?bXYzaUIxb3dHbUwxbTN5bHdWR2FYQ2pjOVYrcU5Jb3BSSENjb1JKemlZdWYx?=
 =?utf-8?B?L1Nvb1hzaDN6ZWpWSEJxTUVBVEE1UlJBeU1TSStBS2w4cUFxTG1HV0tmK0tw?=
 =?utf-8?B?dnE1UHVucCtkK3dDUW9ldlNqZ2trU2p6NmRVRUtLbDNKa2pqUlR3eCtFZ1hr?=
 =?utf-8?Q?80hU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52dd317-7807-48ea-c071-08dd8baa1d5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 07:54:51.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ho7mH2VqWTTgxWY8PbIA9mCv0Pd3u8EeSKiWjIggAQFst/hXQvl764GpPbRjvDVR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195
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

On 5/2/25 18:56, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Buffers that are not shared between contexts can share a single resv
> object.  This way drm_gpuvm will not track them as external objects, and
> submit-time validating overhead will be O(1) for all N non-shared BOs,
> instead of O(n).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h       |  1 +
>  drivers/gpu/drm/msm/msm_gem.c       | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
>  include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b77fd2c531c3..b0add236cbb3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>  		struct dma_buf_attachment *attach, struct sg_table *sg);
> +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
>  int msm_gem_prime_pin(struct drm_gem_object *obj);
>  void msm_gem_prime_unpin(struct drm_gem_object *obj);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 3708d4579203..d0f44c981351 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -532,6 +532,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
>  
>  	msm_gem_assert_locked(obj);
>  
> +	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> +		return -EINVAL;
> +
>  	vma = get_vma_locked(obj, vm, range_start, range_end);
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
> @@ -1060,6 +1063,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>  		put_pages(obj);
>  	}
>  
> +	if (msm_obj->flags & MSM_BO_NO_SHARE) {
> +		struct drm_gem_object *r_obj =
> +			container_of(obj->resv, struct drm_gem_object, _resv);
> +
> +		BUG_ON(obj->resv == &obj->_resv);
> +
> +		/* Drop reference we hold to shared resv obj: */
> +		drm_gem_object_put(r_obj);
> +	}
> +
>  	drm_gem_object_release(obj);
>  
>  	kfree(msm_obj->metadata);
> @@ -1092,6 +1105,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>  	if (name)
>  		msm_gem_object_set_name(obj, "%s", name);
>  
> +	if (flags & MSM_BO_NO_SHARE) {
> +		struct msm_context *ctx = file->driver_priv;
> +		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
> +
> +		drm_gem_object_get(r_obj);
> +
> +		obj->resv = r_obj->resv;
> +	}
> +
>  	ret = drm_gem_handle_create(file, obj, handle);
>  
>  	/* drop reference from allocate - handle holds it now */
> @@ -1124,6 +1146,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
>  	.free = msm_gem_free_object,
>  	.open = msm_gem_open,
>  	.close = msm_gem_close,
> +	.export = msm_gem_prime_export,
>  	.pin = msm_gem_prime_pin,
>  	.unpin = msm_gem_prime_unpin,
>  	.get_sg_table = msm_gem_prime_get_sg_table,
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index ee267490c935..1a6d8099196a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	int npages = obj->size >> PAGE_SHIFT;
>  
> +	if (msm_obj->flags & MSM_BO_NO_SHARE)
> +		return ERR_PTR(-EINVAL);
> +
>  	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>  	return msm_gem_import(dev, attach->dmabuf, sg);
>  }
>  
> +
> +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
> +{
> +	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> +		return ERR_PTR(-EPERM);
> +
> +	return drm_gem_prime_export(obj, flags);
> +}
> +
>  int msm_gem_prime_pin(struct drm_gem_object *obj)
>  {
>  	struct page **pages;
> @@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
>  	if (obj->import_attach)
>  		return 0;
>  
> +	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> +		return -EINVAL;
> +
>  	pages = msm_gem_pin_pages_locked(obj);
>  	if (IS_ERR(pages))
>  		ret = PTR_ERR(pages);
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index b974f5a24dbc..1bccc347945c 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -140,6 +140,19 @@ struct drm_msm_param {
>  
>  #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
>  #define MSM_BO_GPU_READONLY  0x00000002
> +/* Private buffers do not need to be explicitly listed in the SUBMIT
> + * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
> + * buffers may NOT be imported/exported or used for scanout (or any
> + * other situation where buffers can be indefinitely pinned, but
> + * cases other than scanout are all kernel owned BOs which are not
> + * visible to userspace).

Why is pinning for scanout a problem with those?

Maybe I missed something but for other drivers that doesn't seem to be a problem.

Regards,
Christian.


> + *
> + * In exchange for those constraints, all private BOs associated with
> + * a single context (drm_file) share a single dma_resv, and if there
> + * has been no eviction since the last submit, there are no per-BO
> + * bookeeping to do, significantly cutting the SUBMIT overhead.
> + */
> +#define MSM_BO_NO_SHARE      0x00000004
>  #define MSM_BO_CACHE_MASK    0x000f0000
>  /* cache modes */
>  #define MSM_BO_CACHED        0x00010000
> @@ -149,6 +162,7 @@ struct drm_msm_param {
>  
>  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
>                                MSM_BO_GPU_READONLY | \
> +                              MSM_BO_NO_SHARE | \
>                                MSM_BO_CACHE_MASK)
>  
>  struct drm_msm_gem_new {

