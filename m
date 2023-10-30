Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D97DBD3D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261B28916D;
	Mon, 30 Oct 2023 15:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C998A8916D;
 Mon, 30 Oct 2023 15:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQfeXlJ5KXDUtfnQnonta2PyCs6ESKjpWYkDHDBtM2ZM9KtmFoTJkHmbjLFoV6RxgMPWTYZ6h9lAEPMHW2wWbVMN1WXMTFLxO/zsGqm33uBDPy4kF0iRGR+ePHJEMHhwBx0aqDv7ovtFRi8FbOKBEqUANVdgW1e/YMZj/qvJlAmpYUnkqRKZNMTb5Ckkf8K9xjFU12upaMtErfxC2Vh6KdzYWQ4aHS8S9ywSJ509Q9TBcl3bbJOW4Dx1pzPADpmoEA3xQSmfU/lMEF3bjw1REkm9JPrvbmjxt+4e/nkCBSLayv9sZGCrFu9YuQ7kbQ8ZBT0tJZL8pcV1COPAKOCH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wkET0b+zKP9zEWzUOjDCwVGNWa6mOth6GWfbKVsw6E=;
 b=Bfg1w/0K9M8Avk9ElIuOzJZD+LPvllCAeCZPGvjC870UCqB9sJZeLxbmCPhb+Im9skZCVqyenUt124hfCHjXNQFG2UpJY0ROpQe4GTpA8m+ki1fzn3UL+wdaKDHK8nGGy+g3AywAX2x5+rEyQyxQOcSD7/ZuXsjBJVkNfTVr1Iyk50dYqpux9dX9F/seZ9bTCb90qW0v1LDRZN4mfVmKXGkhmn4X/s+V+bsLFO8fjoD9IpXkF0P+ZxCKnuiFz52jp0PF3xKwv9Ar4XO7O/WCARftFokHGBAr/9l+FFcmXGwkn577zIvcdwdHGAUQLEEEuNOkcU9jUMmeeTpjlGbQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wkET0b+zKP9zEWzUOjDCwVGNWa6mOth6GWfbKVsw6E=;
 b=Bzh4Rc4j0w59NQq52ccEPULLT7Ig6AWOzqFVS1pvCDBqZO4O5cSgw5/LZeqJ2XDo8iEBVVo/xNtaCF8fv5VWdInTdu8qE511jfL2lsu6RCzxeXdnhcs9t0wlPhu2nj2MbcmkzJ7h0D/CboWHqA+wlgCPl/6QjDkc9sPi+/YeScM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 15:59:30 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::5f1e:bfb0:43e5:dc81]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::5f1e:bfb0:43e5:dc81%2]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 15:59:30 +0000
Message-ID: <a2aed954-6d37-4380-8234-b4da1f6a91f0@amd.com>
Date: Mon, 30 Oct 2023 09:59:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add kernel docs for
 dc_stream_forward_crc_window
Content-Language: en-US
To: Sagar Vashnav <sagarvashnav72427@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231025140419.21180-1-sagarvashnav72427@gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20231025140419.21180-1-sagarvashnav72427@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0606.namprd03.prod.outlook.com
 (2603:10b6:408:106::11) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: aedaaad6-333d-477d-1ed1-08dbd961337d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpqw0FSyyhX7Dqpqn4eqhERmyFYoCCPE0ax/+cP04IDJ7RCbnXb8XtfZuiHYHoBwrTlcQ5vTFj39BI4mXpbiFFP5HcvLTOz6PMuzlyYHZkHBH/scrctDK5h5qtVNawKM+UgqS/enfG1fX977fRsISjZdsoBv/crDgt1Uu/NlEd1csEFhWvAPJaz9I/6n+ORiOosPB+7AKeg5d8J42PEj7k53tZ1Q/4gaFi+511X0UW43CcRyzaCgCisOLbVKoI8SRVg0ys6d4x9mQKAdHgcvwsaVpHCbOTGSGXh8lNjXfbkLNv4psovTRkjrlr9SsILObPtBFVNST81meVenVM52f6RqiKMJoPA4XpbhQjG/p8klbUS39cFXGRO8y7MCmpqpcEw4g5ZQV73gkX1KbYcFXmKHpy/Nw12w+NKJzqK1W9ijrJVHwTPcx32ssjz9cr3ELOC86wSsyjIV+OqK4qzW8X1uvBWdnDo2tC235S7LSZlZ0uendr6zDzzlwxjWxqAVEWwSRjgPT4EFMkXt4Kd5E2gQdjSX7nKGjRhZE5paHMd9x4wFbLQaYZRdCBNA8cnqkiuh/0nDlJL+efIyDslrIDh0Xg32Zz2Xm71Ih4ruMgu1TaU//kLCkp4cl1j55av9f/iHSAeBnh8n0iHR66bEgXlpLUgzVWZuQp+NRYR8gKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(36756003)(26005)(5660300002)(6666004)(6506007)(53546011)(2616005)(8676002)(8936002)(66556008)(66476007)(316002)(41300700001)(31686004)(66946007)(86362001)(31696002)(478600001)(921008)(38100700002)(6486002)(2906002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDlSemJvcjNPNFI0ZVM3Mi81elJtK3dQQlFzeVNMYkpDSnFOcmc5YlJ5LzVv?=
 =?utf-8?B?eDc3Ui9hb0oxUUs3b1pXTmpNTHhMdEgwWlpvTjFoSjEyK0FzaFlWemZwYngz?=
 =?utf-8?B?d04zSWRxYlhFUThQalh6U2pMQlg5M1JzdGY1QXVtNExyZTN1enBEMmR3YlE1?=
 =?utf-8?B?ZzNmZWF4OVI4VHE5a2lQOVZKY2FiaUFLZ3VwTjdKQ204UEJaOVlDL2QzQlAr?=
 =?utf-8?B?V3YyVytidFV3azdFazB0SlhBelVxZzZJbDlVMzM2SHhoN09UL3EzWUhscDZu?=
 =?utf-8?B?YmZNd0F0bWsrT2hwRHpTaVk2U0M3Mm9RYVVHOXdxeEtDZm1nNmhuNW50dXli?=
 =?utf-8?B?M3d5M3ducWtzTUhsMU9ickV2Ri9WMWtlaWRpOFdiaEZYWCs2UnhXL3VRUFVH?=
 =?utf-8?B?bExtRWZJUkZHVUpZTERRUFBidWZHT0w3eW05VmFtNUFvdWFSK3JuT1MxY0or?=
 =?utf-8?B?K2xUSkJUbGRuTXdxdnExbGQrKzl2dnZCeDlqSXJZUEhzdUNMaU1WL1F2NTM4?=
 =?utf-8?B?Q09SMStuZjY0T3dDQjREV3BmamowemduUTRLbG9GdWFVd3BmSXNxTmFNTWZj?=
 =?utf-8?B?aWc5SnROeWVDWUIzekh1OTIvbXVIR3lGYVdqTlpXdDJxVWJwRmxnQTJTN3ky?=
 =?utf-8?B?T3Q4TWg4UFk2UU5scDJ3RzFIWHZuYkJPY0RzalJVOHcwSEZ2d0gzQmhkVTdk?=
 =?utf-8?B?RUdLWTVhdmtKWnNzazBDRC9DUEZhS3ZHZ3VuencxN1d0R29tOWZxMENCVFZX?=
 =?utf-8?B?M0x1V1pnSU0vOEl6bnZZTmRFQzIrOFUzMDNXSTBaRmw4bkhFVXYwbE55WS9G?=
 =?utf-8?B?cHVhM2hDQVpoTU9ITmxDbUMxanlDdFJvelFKdXRZRkRaTUM4RXkybElRc1lK?=
 =?utf-8?B?VU5xdDd2THlvWVRMS05QV2ptZE43dWZrNmQzN1V6UlV6eDRzMEo2QjlCdC9I?=
 =?utf-8?B?QXR6UWp0N0JLQm1rS1lUeHV3ci9YdTcxWVhBeUJEQjdQdDdQVmlmdXpQUDd1?=
 =?utf-8?B?NUNYVGtNYUpkbFpkdnh0a0k0SENCNWNJRHhLNmhmL2R0ZUFSdEd2WXhDTFJ0?=
 =?utf-8?B?c1dWcVM0cDR1K29mNmYyOFlNQ0ZtZm9iRGFSYm9TdTh6bmcvcEczWWFNOU1a?=
 =?utf-8?B?cUEwSkdRQ1VGQU5oQW96M1Z3eVc0aG42dEJxU0o2UGFMZ1pPcnVYM09tUUlU?=
 =?utf-8?B?ck4wTUNuRjR2SmZRMUV0YVRkRGhBUndRbXdwNTBlMXphMzQ5VVdZQmhRTk0y?=
 =?utf-8?B?SHJRZVRDMTJadkdIUWtGazFZNnRtTmdKV2g3NWg0a3pPV016RFIxeWxLZW45?=
 =?utf-8?B?N3lFNXhNZUh1aUJaTm5WaFZkRnd3T3ZGaXpHVk1oV2FjTTNLSmw4aHBpc3Mx?=
 =?utf-8?B?emEweWxYT0w1SUNYNzVXS1RvN0VlQ3IxMHdMWEU1OE1FOFloSXV2eFVEYlFk?=
 =?utf-8?B?SHdDcG9UMlV5SEI3YWtLbEo2cXNCRlhtZHVCa1NXemc3TFJIOC9EVmE4eGt6?=
 =?utf-8?B?RHgvdmROL1o3bnFGaGx0U2RCbFpoWFhCbThubFVxU3ZKT09PdjRRc2hBSC9p?=
 =?utf-8?B?WmFIdUJEN0x3Tm1hMEk3S251VVJCOUt3ZW9MU2t0R2Z0RFVGMm03TUtPN2Vi?=
 =?utf-8?B?YXRhL1BZV3BvZW1sTlhUUHBNMFBUSlNsVmtRRVFaUEhreWF5bWU2NHUyd3p5?=
 =?utf-8?B?Slk2UHJBQWtpWGFTSFkrRktxN05TUGVLcGIycGVaRTdLMjNLRVlnbjlCdmgy?=
 =?utf-8?B?NHJOOWNJdGNQYldGYUlsVG9KRVp3M3lLZW5GTjVkRHh2MGNRNGpBSkJCN1R1?=
 =?utf-8?B?cUUxK01CdHFTRStvaVBYNlRJMUtCalUxbzRPUml4WVpySzF5SEk1YW9PWmVF?=
 =?utf-8?B?SWdxTVF2alB2UzIyQk50bWhZYWg4OHdNMnlxNllaWEZZd2tFWlNhNk1LZmZ0?=
 =?utf-8?B?cFVaY0tYR2hvN2RqdXVYZ0dVSmlVS0IwRUZPOEM0MmhXTmNWckw4VTltbjZY?=
 =?utf-8?B?Qy9zcVNMY0wyRXJEU3ByM0RraG5MMlh4SjJROFJicHg5My9Fa0xUZTd0MGVo?=
 =?utf-8?B?SGcyNFFYSGRMWkxKZllxODJySFVWd0d6aWdkRFNsMTBWbnAreTRoV0NPRnYv?=
 =?utf-8?Q?hP0EGUS92f+nf+ZqOcrUa5STp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedaaad6-333d-477d-1ed1-08dbd961337d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:59:30.3182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsZ9cXvmyuFKw7orsWiCss97v1LQAETC6JY0kZQ1yfkC0KecZyqq24YrzMcSuxH5dA41trxTWk54xAgJEaaEBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
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

Hi Sagar,

First of all, thanks for your patch.

On 10/25/23 08:04, Sagar Vashnav wrote:
> Add kernel documentation for the dc_stream_forward_crc_window
> 
> Signed-off-by: Sagar Vashnav <sagarvashnav72427@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 1729fb727..5ab35e482 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -528,6 +528,19 @@ dc_stream_forward_dmcu_crc_window(struct dmcu *dmcu,
>   		dmcu->funcs->forward_crc_window(dmcu, rect, mux_mapping);
>   }
>   
> +/**
> + * dc_stream_forward_crc_window() - Forward CRC window configuration to DMUB or DMCU.

Add an empty comment line between the summary and the parameter description.

> + * @stream: The stream state to forward CRC window configuration for.
> + * @rect: Pointer to the rectangle defining the CRC window coordinates.
> + * @is_stop: Flag indicating whether the CRC capture should be stopped.
> +

You need to add `*` in the above line.

> + * This function is responsible for forwarding the CRC window configuration
> + * for a given stream to either the DMUB or DMCU, depending on their availability.
> +

Same as my previous comment.

> + * Return:
> + * %true if the CRC window configuration was successfully forwarded;
> + * %false if the stream was not found or CRC forwarding is not supported.

Afaik, we don't use `%` in the kernel-doc. Maybe just use 'True' and 
'False'?

Thanks
Siqueira

> + */
>   bool
>   dc_stream_forward_crc_window(struct dc_stream_state *stream,
>   		struct rect *rect, bool is_stop)

