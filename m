Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37A7F5008
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 19:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D780D10E0BC;
	Wed, 22 Nov 2023 18:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F1210E0BC;
 Wed, 22 Nov 2023 18:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYA0m8RAFYrlEi2KSJQwcLcnbJvWhV0quu2Na8SIqSQHxkLGYc2cMxCH+js9Jm29FeHCHTk3lisrJg0MD0WGoUSKe73HnFEhVI+5vxaUMNcGyfsyDK70AfZydOCswtxRaUcu4BIpnwEwfSuqVZyJQiKFPGqhHI6Ie5A3pjqg3UUZdtUavtf2n9OWGedcKjs0bw2FMtMC4skYR9MK2jLU82NvC0Bf+khWi2R6mWmrZ3RI6oknTZ0e9R8e+s6OpluY9kvjhPeZuDOzdKvTmMCwYFSAfd5Q99Gf9L5EpS4RzjNFa42T8vM08suA4E/D2RGNMX/PVqgvA6ffYviIutUcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG62bpOSXNPnq8W0MEokfLx+N7IK/57iX9YjTdYeHNs=;
 b=igHJuk3KynjIQFw64RGfJdbE+jNsBCHAaC1lJHrqDj6KI4sNOgEiZ+b5EBd+pqcwfbgJEHi6IoaTl5tLywrHzw0QhHrNSt0jz3krwKWW5pwy6ZGTxgJajyL/EG4UusJcwDysnF/6E9RUmowHyPG+iZnGQE6mDtjWM0PjKui7Qp5qTuNFbnKpkfC2yDQhmNkLkhoWRkuLwa+vYRDeI3+4Yw9oDqtxNLSBmmtJjga830c1Xcr6Jt6sXYOG5YJ+Sk4KadswS2ycYfYL55/4TskVEwXhTdfAM1I1PTWOmiQ2l1AVj6bOawftTJSwq6qGzmXb8w1rOIVDBTjdO2xYa17NJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG62bpOSXNPnq8W0MEokfLx+N7IK/57iX9YjTdYeHNs=;
 b=SfmhPXUWrHt3b76uO2RKE/Y9AacYTy2EfzVSQ7ha53Ukk7FwxUPIeLhYqi/MdKjKWAF8dwVWG3944p7Xi2Xubajs5YoxuJE8RJxc+WQQOLeuXwnMxRnieb9p9TuWUo8t4bZEAyy0tP8fXJ6w9mENHCZcs+wvIzcdRqxTat89SqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Wed, 22 Nov
 2023 18:58:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 18:58:05 +0000
Message-ID: <c5ae3f32-0779-4583-8fe6-92f5dea5ede6@amd.com>
Date: Wed, 22 Nov 2023 19:58:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Correct the documentation of name and exp_name
 symbols
Content-Language: en-US
To: Ramesh Errabolu <Ramesh.Errabolu@amd.com>, amd-gfx@lists.freedesktop.org, 
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20231122160556.24948-1-Ramesh.Errabolu@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231122160556.24948-1-Ramesh.Errabolu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: a901da26-9356-4525-8f9f-08dbeb8cf5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FumYCVb9oDKeqwSysGFDRIk9NdaErTRHq+37S3Q5Xs4D5Uc3ZE414SDwCoOOeCzmt7cUEAxEsPYlbatZV1l9jzC9dr+heCcVYRD0UmIPnICYWNhmgXmN03zeDE8EyOPqwV63/mQaucHLyT9Cs5vybwuGuuJzqWFEVlaR6USYiILouGimPv0WjmYnKOX/V0WXx6y0f7wzWrYkE/PwEYxtoB8Rpw5jP1zH1V2UeJbbI763yXn21HBP9stMDm03DyMHyJuaxiW+hWm/c0hNgBTViBocT7quqjLZE5RlC9MSdJfjjUdPFfC4DrS8OAX1BJfnHn0dzEg3JZxI8BG/zBePOfGZpoKeLTFFqeEkDcLtLePX0tr2TBrU+asKpOelXqmejDGWVxuSZZlq10EjKEtMQwUqeNxROHnX+QYwL0+E0+C4IhdZZ20W+WgU7dg7mRq3ibG1G0xc4HAL5RkQ9Ex3ujt7Sz/xaQ5m5iAiIFdocuoWHWsw1aT26JEMRB6ny7R9Z54vRnXpwTYQTwu+BWuVsALM5qBJzTzrDXiEeY5s2JDM3olIbTuNJ1ajzQ4/MIeMhNd6b3hC4qHV5mJSL2wyDG9RLr+mEZoTaBnjkP70OYnsdLXzgsIrVAvrJIWiU+/Y5wDc3ffRQO1IpXjwU/y5nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66574015)(2906002)(6506007)(26005)(5660300002)(41300700001)(6512007)(83380400001)(2616005)(38100700002)(8676002)(8936002)(478600001)(6486002)(36756003)(66476007)(66556008)(66946007)(316002)(6666004)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXppNUhLY29wNVRqVEtHVjJhVy9OVitLdjgxWGxiM2t5Q2RwWEVCRDZSeVVN?=
 =?utf-8?B?NW9USGhyRjV1UWVoYXNiT1ZzdkpRSmUwYUVSNmxHVEN6d1NFb3IxaUtIeUxx?=
 =?utf-8?B?aVVLZWtPTWI2YXh1aUg4RGZpN2MrakpyMGhweUtKWE5lTjJaK0xodXNTZXNK?=
 =?utf-8?B?aVllL1NaUFZtZHNkWTRHVEZlTGI4eUtrc3A4cEREaHlKRTF1dS9qckptL2hO?=
 =?utf-8?B?THhxRmJwQ2MxZ3FSa3FBaXBQK1Vmbjk3ZlBMQk1XbkYyRWNya0tDcWZzSU1C?=
 =?utf-8?B?OEJGenp3aTE0dzZBS05sV1YyRWdWN1hRbFl1aHB3SFdFZXdjUGgybUFIekJZ?=
 =?utf-8?B?VGxUdmhQSzliUk45TkFNeEhnWjN3dXJncGxKZitETDZJRzlwTlZSeHR5akRv?=
 =?utf-8?B?VTBkVFRxMkRTMEkxMGY1cytHY0xwOUtLZG1EeWlrcmNnSm9ydSt2WmkwUFNL?=
 =?utf-8?B?bVJCMmNseGJyb1ZkU0ovZCtFVWRNakhrQUpGV1dsMitNMTY4bDFCbDlXeTVU?=
 =?utf-8?B?YnhXbCtQM3UyWmRHWGRZQzUyK05nbjI4dGJEaWFYeGtDNjVmYnVZc1A3NDh5?=
 =?utf-8?B?ei8zbUEzdTNmTC9ZQlFacm8wMVJmbkRTMnZLcGJoZk9GbEVIdy9zaVRNcjR0?=
 =?utf-8?B?ZlJOdjJMSXVQTnMwcCsvK25ZOXh4M1d4SHlVblJ2aG9iUXE0b2t4SWFtZ1pm?=
 =?utf-8?B?VGo4TkJkTFAzWmttRWlSK0tkSDBzeExYRUszNzZPZGdJNis0RDNmbmJBRHY0?=
 =?utf-8?B?ZkNiaHo4MkNVV2ZRK1dxc0xyT3Vqb1FCSDQ5ZjczMmFaWlF3eEFEUVliT1lU?=
 =?utf-8?B?WGJsWUJSdEJZVlVpWDM4alNSVmlFZnBDRzlldi9uR2Z6elYvY0xJY0Zpb2w0?=
 =?utf-8?B?YnVFRDB1NjVGNGEvU21MMm91SWU0Z2UvdjB6NVN4QlExR0J4MSs0bWphQVNa?=
 =?utf-8?B?dkNzRnA1QTFjSEliMWlwckhFOG9HMENkb0hTdG5pRXNUVlY0ZXhpSWsvbngy?=
 =?utf-8?B?T1dYMUs2dXE3bW1uZ3lZVmZCMWU5a2k5Q05wN2YyOUtVbjNCS0V0TWh0cGda?=
 =?utf-8?B?b2MwVGZlaVorNnZCTzlER0R6bEU0NDljeGtTVkM1VDB6b1VNR3JuMnNJeTds?=
 =?utf-8?B?blQ3MG10RVZzaTBrekJwcEpRMTJSZFBDQjZzZWV6bFQ4c2lqbFh6R2thYnNm?=
 =?utf-8?B?T21SNWdvZER3WGt3azExa0xmWDRXVlgrYjJYRCtvU054YkJtZk1qREJmdVZY?=
 =?utf-8?B?QnhMVGhwYTZ4bGdtaWFnWGNCVW5sUmRpSTlGelliQitraVdhdWFKQU1HaVl4?=
 =?utf-8?B?azFNMFdmckcvemlZRXpud2h1MldPWjJndnhHT3FuTTNLRWNxalRDZ3ZaSmxH?=
 =?utf-8?B?Z3RDN0VDcHFEbmJzT3dXbGU4T1AyZjhSMHB6Ly9rUldOd1UvbEhybWRGeDlU?=
 =?utf-8?B?SWlvb1FYVzcvTm9MajB6TGdDK2dGWGVPdUwzREQyVVY2T1RxbjREd1orb09l?=
 =?utf-8?B?QUxrTjY4U2VpUzFoZTBGbEkvZk44MzNiU3dERW4waG9VUnpydElHOEZpQUt3?=
 =?utf-8?B?QlpOOEpBUDNsMlZVS3RPU3NLMWx5a3JKZENwRGkvODdmSVRpTzE4WGNGWjdD?=
 =?utf-8?B?QW5MK2M3VGtEa2JLNmQvRTlPa0JNdUFTK09Sc1dQQUFyd3pZa1JPL0s4WnNk?=
 =?utf-8?B?SnJtWmNwUmRmY1BET2VrY1BiZkMxYTlHWWEwTkF4MWJXUkplUkczY2dEMHY5?=
 =?utf-8?B?QlRDTGtCeURtM0hnN2x0dlRLUXVlMW41VHZRdE1XYUxUZytnZWZiaW4wVnZT?=
 =?utf-8?B?QXZSY0xURWpmQWxkY0kyQm44VlNYcGd2RVVMMVpaNGwzV0RLdkRKREN1TG82?=
 =?utf-8?B?dVd0c0RUWUM4RzNtbFluNGpYYXlIMllkbFd0T3hzQVlrQTYrdGx6blJ1bTM4?=
 =?utf-8?B?a3ZQY1dpTVg4QWM5WDlOOFdPZHlLNEhYbm9xaFhQRG1lUFNJMGRlU1BJRWwy?=
 =?utf-8?B?K0w3WnY2azNSSGllRUV2c2dRTDFhRHZjb3ZnWWxnQ2lqMDhxVk0xWmRqeklL?=
 =?utf-8?B?M3RPemd2eEVWbnhVK3AvWVQrNkVqTzcvT3BPemlWZnNPU1Y3RHNXNDBRYm1C?=
 =?utf-8?Q?YbzhoflzHUJjkoysGYd6g0+md?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a901da26-9356-4525-8f9f-08dbeb8cf5a6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:58:05.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKK1XNzlh9WuZiAvNf2luWdmMv6j+jc3urnvhCRG7Szt3hszuEZ4DzCRt7bLpMrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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

Am 22.11.23 um 17:05 schrieb Ramesh Errabolu:
> Fix the documentation of struct dma_buf members name and exp_name
> as to how these members are to be used and accessed.
>
> Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/linux/dma-buf.h | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 3f31baa3293f..8ff4add71f88 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -343,16 +343,19 @@ struct dma_buf {
>   	/**
>   	 * @exp_name:
>   	 *
> -	 * Name of the exporter; useful for debugging. See the
> -	 * DMA_BUF_SET_NAME IOCTL.
> +	 * Name of the exporter; useful for debugging. Must not be NULL
>   	 */
>   	const char *exp_name;
>   
>   	/**
>   	 * @name:
>   	 *
> -	 * Userspace-provided name; useful for accounting and debugging,
> -	 * protected by dma_resv_lock() on @resv and @name_lock for read access.
> +	 * Userspace-provided name. Default value is NULL. If not NULL,
> +	 * length cannot be longer than DMA_BUF_NAME_LEN, including NIL
> +	 * char. Useful for accounting and debugging. Read/Write accesses
> +	 * are protected by @name_lock
> +	 *
> +	 * See the IOCTLs DMA_BUF_SET_NAME or DMA_BUF_SET_NAME_A/B
>   	 */
>   	const char *name;
>   

