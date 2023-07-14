Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6075330E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A40810E807;
	Fri, 14 Jul 2023 07:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A010E7F8;
 Fri, 14 Jul 2023 07:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTSJ1xqefU13CJuOEQ1Qgc+H9jvw+CWPlPb0HFzVJt2QNDyZCf6U+ybEog6zigjNtjqwsdQ5XW0ESPouZH9aDqFGb6dSlTkqIA68W8UUX0l3yZWLGqacjrNDUDnCy8Ga62wLWnXbbyaBqnIyUWTQvsVHOUcfGpvXlTcCqjVNZf13SWw9hPPHu5klhRQq8rfsMQ7qwiaSxo618AUFD7hL64O6b3sHdzQTLEoKeC/AFzzRf5kK2wsrUq5WJRF3g+Ff8n//3Q2bVV2l4QvNrCdXIktq03SkOK7zZHjO7u0uNafbBSNKr+QxY7rhg+SUw5ytdOWBTbcVJSVfvah0KN10UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWKYFT0H8s3jaQ5oCLcDSEZvUEhAGiDCRFphioCjcY4=;
 b=AvbkC1OFdS79vUrJAfEMPozAJGB6+n+8t2vOYSg1ZYeC3qHVa/NwHT9Maq/UvIesP/RqNuAOkbO0Vu/yT0lvm7q35WoytPlidLyu6mE5lLnNoFalw9wCRxRHKLnV9IKdFVObXPcUptdLFfav1BzKUO2wpgD9Kb7bilh1TJA2IUH+uRO2IWpaw0dy3Ga0cujDK0znwUJ06iuRWgmQ8g40UJ2FNSF6Unm1lPaAKtkDCFQZMsAPf1eYNgW5UXF0cphj0B0Yh5LCnRW9aiiK+rAbrxaREMbkcOb+vzfb5E4ukxwUgeWmt9YoJpMuo+aLm2inDsyilb1R6NbE4HwHTZod4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWKYFT0H8s3jaQ5oCLcDSEZvUEhAGiDCRFphioCjcY4=;
 b=ZQcn5mYLX1ZAQOpygD1Q0YCXvYqj+Fwv9C9FDRld+dTa41bSjlc2TOw/kqOMe9z1NSZyYvcCu5qXIC8s3t47QeKT13rHnz1RjgFcK2b9O//hUz/7zbHf3muGVWFrVF8JzoKHxJ3fPAWpPIn0Hajz+PXMohJKXqqg9rb4H6MFqLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Fri, 14 Jul
 2023 07:21:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 07:21:23 +0000
Message-ID: <a96b79fb-3ad8-918f-d109-3da2121e4607@amd.com>
Date: Fri, 14 Jul 2023 09:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/radeon: ERROR: "(foo*)" should be "(foo *)"
Content-Language: en-US
To: shijie001@208suo.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <tencent_16FACBDCDA61595C4219E185613C85C8BF0A@qq.com>
 <26d3424f83f1f394614e2a774d1bf1e9@208suo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <26d3424f83f1f394614e2a774d1bf1e9@208suo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f3ea81-86bc-445a-2015-08db843aed64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BXNzeQwTjnmKUS8Rdi2QBONJck0tmQSmNxQH+gge01e6pI8Vqi5FE62lZSexs/VLmBnXCckTKZzpNUBEuAOoYifsb2sdvoCg7armSpZhM4isYP1U7czFm+bKHCIof7P1S1/9H5AhPjCqhQDABq/SSRSBWSQ1JN0RkQndEfw5VyBaSs+FiZQpS2wbfm39B4y38Rt7wXcTpRhJSMfOCBVkoGSgjUQCdOoDjc4jXfyCyk1cP7/4vpD618fM0EH4BlBv9MuwUxWKMfBuifblA29d/MQs2+6mpek2/gKQI0FLY1Umn2dNnidgQ4z6nGzBBf/qnE3+ve/FDOObfG+hE+MY+Ac/C4oGttk4BJE32ocNLdmzC6nH1ZmapyqEo0s5rHKkpwJ9PcUZ7x5CP5XddGDSDMmHMcOTevgNye+oagZZgDRoEUat8iwCR7ZFnI5mSTTsdFQl3LFtfKhtUWmnkXDR+n6hLAa0J8El/fi1Y+ZFbPHox5cO/FD7R6acZ/LrbT5HgOjA0UGo+lFyWJW/utDXSPGGcsLIJd34oXquuQKE6yvIXdKv6G0JjK0XKH3I7d4dexrBZxGg3Mpsb3FS4jENSRJcMfE3RDe82cLBl+b1ND9FRhitYeOO8AVFXDA5ox1B42Y+robrArMsrJYmAYwMaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(31686004)(6506007)(4326008)(6666004)(478600001)(31696002)(83380400001)(2616005)(86362001)(36756003)(6512007)(38100700002)(6486002)(186003)(2906002)(8676002)(66946007)(316002)(8936002)(66556008)(41300700001)(66476007)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFOUmpaNFlpNUVhemJZcHlKSlVxK09mSmpOcEZIYStYL3dJTmhCL3V4V1Ny?=
 =?utf-8?B?OGRrQ0xFdzA3NUU0ckpobVo2TkhGQzdoOU11dHFab3hzNW5OSWYyRnlSVURX?=
 =?utf-8?B?RUZibXdNOEkvNStiOURQSlcrN2RVM1d6K3pCVCs5QjBGcEVYWXBZSjQxRXRY?=
 =?utf-8?B?ZUtQVktRSktJOFQ2aFYvTlQrVkhxTEpUUVlKSitIam4xMUpRbXhkVTBEZUt1?=
 =?utf-8?B?ZEVJRTF1UHZ3cEtBamFjQkUwcjhrMHYxVmtnd3JtdHRFZy9zRjZ3eTRrUURV?=
 =?utf-8?B?NjUwRXNqaHJJcDM5RjlWRGR1bXAvS2R3KzZlS2lzdmNzY1oxSU5YNkZrYmRm?=
 =?utf-8?B?TzFQbFNYa3NPa0pIK210emFZWkZQa0NPb1NVNlYwYSt4VzhWRi94RTlXUzF2?=
 =?utf-8?B?SkNzeGdBMFFndE4xLzBuS1RiSFQzbVdyR0FYUm1zdFJXemNlMUtiQ1AyMHQr?=
 =?utf-8?B?NWNvWVVYMDBxY21Qa3locWVnWXkvOVBieDVEbXg0dC83UjBiSWI1SDhOa25R?=
 =?utf-8?B?Z0kycmx4TlR1MEJzY291a2tmWFYwUFIxMWdaNDhyRDEvcmlWRWxGQ0N3NUNp?=
 =?utf-8?B?T3ZhUkl6ZjhhanpuM29saXhGUEFhSTExMVhLYlBFbE44NDFmS3JqVFBPeTdH?=
 =?utf-8?B?T2NQS0x5emRDaDFNZXZRNDl1T0RwM2dWR2dXb2VqUmZjTnI4SnlmbEl5emkv?=
 =?utf-8?B?RnpHU1liM3VjMWtYSDIyYnR0RnhQZUcyT0puemZ3YlFOakdjQUNiblNpMnJS?=
 =?utf-8?B?STdFTWk4YTNRRWx5dTNZcFBxajU3R2wzS3lReXhFTUdMS2dacXdHbkdPSWpx?=
 =?utf-8?B?Y3FSbmhRWjYxZWtuNkN2b2lob2ZSWTFkbGRqOXk4Ykp3M1N3OXRiK1J3b0NP?=
 =?utf-8?B?WVBWUkdzWGxOaDNrS1UyWXVNekZjNyt0eHVNdWNnUDMwQXdwRDF6bDgyREox?=
 =?utf-8?B?blJhc3NQTElkUkpPL2tLLzBvTUFZSndTZ1hIT0JiVTRheWlZQy8wemQzemRX?=
 =?utf-8?B?NGVwalEwYzJYYmFxOGJPUEZNc0t6bDUyMVJ1MUVyYjZTQW9DMFhHN2tuZ2JJ?=
 =?utf-8?B?bnAwWEdIUFNwZHcvdHlSMXNYZTF0QkhvaVI2RTVURFpZVWJUMGRkNjlHWEt1?=
 =?utf-8?B?MGJudUx6MCsyVHlzenRwWVg1VVV4VW56ZVViOTV4cm1tejlwNHJRNkhvVEdE?=
 =?utf-8?B?djZYRHZ1RTR4aEdieU42V3d2OGh6YVNiMmxXUzNrTXp3TWJTUjVTOGtPSXgx?=
 =?utf-8?B?TEtXZnNQZW5CTWI0VXNQVWV2K2RFRUhlK2x5dVF4Q2lqN2Jza0dtQmNCVDc4?=
 =?utf-8?B?TXdtZ2FYbEV4RUttczVjbGxhdGFSU0dUQTN0c29XYXFmMEUwRXI1SjJIS0pJ?=
 =?utf-8?B?WFJkL2syc09MSisvYk1uUm8wMkdCSTlmSnpJWVVQSW1IblQ1TU00UTUzOE9R?=
 =?utf-8?B?a0NjVG5GVFdBVmJzSWRsM0d1Mmk1QlpwM0VScHEwclgxanI3eTVjalUvVHo0?=
 =?utf-8?B?cWhIK2h0enNqb0dobS9hYkdqTEQ5dkd3TUFqYXdVSllidmpRUmsvNTRHWHZ3?=
 =?utf-8?B?UmpRQ1lvK3h1ckRobVVDRktDdXR2NVk0RmVEcTBGVFl3eStBdkNYRjVPL2di?=
 =?utf-8?B?cVh5d2JZdEFQWDEyT1c3RVpEdy8xMjRsL1NZUXljcCtpK2RLZGYwd0V3dFJ5?=
 =?utf-8?B?Ni9pci8zS1JINStQMWNxSG9yeWFWTW5UZmZDWkFobWljQW12VnlMaFFnampO?=
 =?utf-8?B?MDZGUkptbS80ZkVyWk9GVkF2NFBndTdaYXdXSnZJY1NkMjk2aEV2SzRYM3pS?=
 =?utf-8?B?RlBkSUJ2ekZtVzYzNDNoT3lkT0xlVm1NMTk1TUMrQUlMR0ttMG5pazc1SzAz?=
 =?utf-8?B?ejdEZDA5MDIzRzk1a1NZQ25RcStCRzBUOW43b0VIMEdZcVVEYjZwZzFhVGUw?=
 =?utf-8?B?VzcrNFlpU0JoblN5L2VWcmFsU0RmS2Rrb2RseHNlWmJZeFY3a04zOFZFT2xB?=
 =?utf-8?B?eE1OK01LbXJTZlFzU3VDMXVzM3dvWTBtNllRMnRkc0t4WklaL1dlUE1IMnAv?=
 =?utf-8?B?eWpqTTBCMlFzbjFUeDF1ZjlNTHJoWGY1cGp2aGN1R204cEpDMlhvQjdPVEpK?=
 =?utf-8?B?VmZmNGFuRDZ4UnBrSWxITEc0V0dwKytSbG1rZFVtZXI5YjhVY1c1bkxuRW9k?=
 =?utf-8?Q?kh+hLXYI8g7BFQccugYQD9X2JOGgNMkdBAb+T5YUem50?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f3ea81-86bc-445a-2015-08db843aed64
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 07:21:23.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wve3EsJxPY9QhxDRQu8AqIgpLhJ0BJIzQCIvhae3LKpzwnLXsS66u8HfRiIrgOpz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 07:35 schrieb shijie001@208suo.com:
> Fix one occurrence of the checkpatch.pl error:
> ERROR: "(foo*)" should be "(foo *)"

It's nice to see all those little typos fixed, but I'm not sure how 
feasible it is to send patches for each type individually.

Maybe just merge them together into one patch for the whole radeon code 
base.

Additional to that I'm pretty sure that most of that stuff is already 
fixed, so what base do you use for this?

Regards,
Christian.

>
> Signed-off-by: Jie Shi <shijie001@208suo.com>
> ---
>  drivers/gpu/drm/radeon/uvd_v1_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c 
> b/drivers/gpu/drm/radeon/uvd_v1_0.c
> index 58557c2263a7..5684639d20a6 100644
> --- a/drivers/gpu/drm/radeon/uvd_v1_0.c
> +++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
> @@ -142,7 +142,7 @@ int uvd_v1_0_resume(struct radeon_device *rdev)
>      addr = (rdev->uvd.gpu_addr >> 32) & 0xFF;
>      WREG32(UVD_LMI_EXT40_ADDR, addr | (0x9 << 16) | (0x1 << 31));
>
> -    WREG32(UVD_FW_START, *((uint32_t*)rdev->uvd.cpu_addr));
> +    WREG32(UVD_FW_START, *((uint32_t *)rdev->uvd.cpu_addr));
>
>      return 0;
>  }

