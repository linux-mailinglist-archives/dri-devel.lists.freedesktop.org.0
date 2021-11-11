Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0144D4BE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369E86EA50;
	Thu, 11 Nov 2021 10:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3ED6EA4E;
 Thu, 11 Nov 2021 10:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZYIG9m8XV6sB1Qq+fRwnxOaLM4o3rSJC4LB9zvIlQplINgdRZADgy1OSakJOGPUBvNPr+mV8U8f5p/uVB/zEpLaHM2fV9BC+Z97wP9ZmsIymkRFG77PEZsG2bMdU2My8Pwo+o4J1nQiynmW4j45IbJSFYKizGDcOn9fmz/d0CW/6BjgKg/o7buNwdiw//F4DBT+Yab4zb8NG20UsXycGS5urAuIBkuBzYVvrqO+0LCvmTe+cHAm6L+iT8Ywk2sxrjW/3xf7l/98zgXwkGJtI9x6atVm3rye9CBsuiq1N82Ugqaq3wrHh3QACu7iTq8U3+t8aawSEjyydj4zeTXdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDakdmS8Ns2yx01X/GkqqaFrmu8HJQI6fZ0e8Bz1j2k=;
 b=eiRERAWLlJV+fePoQTFGUV+uvEOEAI+0lI4fr4WFnQTFh+WxzpWuY+BZc/gEc/w1W603WKga+4CZrJbON1cwKc8BFe32anCA5rVSkALzvXbiVXy/MhVrI/3Uj2MHLXpcRFfSuP41D0IVwAIFSsBooCWrpMqTBqNNARYv0+J4Ovzm6m6W1XzC7ZikMYjMd2CRpA/5EVGlkjskWwHPmenFVe4+HyYKgOATEcpDsoMFUU9XA3j/qKqG6ssN6mC+tcWrutd1/YK97LS6ErGEnJENaDBJTZNIfWR442J5MIbE/+8iJbOhfWQIvQS4wklgoa5izflGuVuLaPpvjh1e4h6mlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDakdmS8Ns2yx01X/GkqqaFrmu8HJQI6fZ0e8Bz1j2k=;
 b=lC2eGXWtLFonQKNN0t0cvVckXOsKzJD8snphRA9Xy1gxxeVeQ6w16jCKafOE9d6h6eMIH5gde00xfITcuF/DJYKfsu24buC1Rm6M7oqBKrBweSRGLGzR6L9RxL1iscUE/wFvzOlaAz9Sahnkn4KQc5dF27P1e1Ez+RhDibnba60=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4586.namprd12.prod.outlook.com
 (2603:10b6:303:53::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 10:08:15 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.018; Thu, 11 Nov 2021
 10:08:15 +0000
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <1636624728-85197-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7dc5f830-36af-4d8f-4e45-03d73141db9b@amd.com>
Date: Thu, 11 Nov 2021 11:08:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1636624728-85197-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM8P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::23) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AM8P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Thu, 11 Nov 2021 10:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc449c63-d1fe-4e8c-f5c4-08d9a4fb2ca9
X-MS-TrafficTypeDiagnostic: MW3PR12MB4586:
X-Microsoft-Antispam-PRVS: <MW3PR12MB45865EC4F7EEABF97DED302983949@MW3PR12MB4586.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwfvZcO5YYIQCDWgOmZNI+pZ5b1XznE7qaeTa3+mf65TXE05j2kwSXVYBFIOylsji6rbRF1A7UmjbZP2czi9PgV6W/4rLcsj9Op1o9YtjWEhTfUH9PzXWvGIuvtBivWiejGVd1fawfawJOBITx7t5YK2QnV4j8yk+wtv770he/G7CNAi24HQynlmv3femVqqGr/4wYW5k8C28G9nxBBf3uxeoUr0h23lkZcjuLr3rpxUKiaW8LDgvfKFSi43pIhX6Yt16Xsh5HzeR8IJhbtQ9+zloXEMwTbUvKrnZ/INdmW7igYn95YOyjhgy5Yg5S/Jg6LZ2vKYaPeclkaz+FzuBRDmXAyVSIb7IW5eooiAhjUvHHe0IQQ/kiyOFWnJbhGszp1BKSpS34taTOtlcFgFa5vMkiFYTQ6ZUvzQWKEzPMg5ZoLIRvtoHyyR8eL+6hFosVD5mtbYW+Io/9v6JN7FcR3n5t5EaXM/e7y/dVIhU13r3rrpLrQRhVsqfkQvEugWGD7eICy6LyIqP5l5OCyJfLSwalacQNLy2pO7bk/1PW8bzmNPStHtZ1u7Oq40hPAvmFiXK5bDf8kSkORH+KG+vrpT+TnwaCoUdA1rJmPZ/ROPX5kGTxGf5wqQBKHEyAP/rKA/iLMLdLhtMymsEVunF9Dor48cgMluyfgb+KquZQ8TkHctamnVdVkc6CzOvlTsLlZEr1cdm/jThaL6/KjlIZlNzaMwTdh3csvCeebv0BzVhLk0TZEkZ/+glJdXAKCn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6636002)(956004)(2616005)(8936002)(4326008)(66476007)(66556008)(66946007)(316002)(6666004)(508600001)(5660300002)(31686004)(8676002)(83380400001)(6486002)(16576012)(26005)(86362001)(36756003)(31696002)(38100700002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkozMytLYjFLT2J1RWlUMisxMjFjZ3JBOFpHYjRBOTREYVJPTmRwSjNSVjJN?=
 =?utf-8?B?cExyWmI4ME9SSnNIZXZnL2p0UFFXWS9xRm5SaFMwTHc2eDA3MHVRQmUrTEtI?=
 =?utf-8?B?b0tMbUlxUHo1Y1U3Ui9BNjBaQ1pOR0N3M3UwN1M4cnJKMkdqcy9ZN1dRRHFK?=
 =?utf-8?B?T2NhYTRBbTFqOWU2dWt4bFM3M2p4ZkZtWFhUdDNRWWQ5NWE4UmpXdWhZaWVJ?=
 =?utf-8?B?c2FRQTB2V1EzRGp1ZkVzMzJhdkVXaUFEUXB2UXdSKzdESE52Qll3Y2k2SUJa?=
 =?utf-8?B?U25acUpnOENObmFBWmZ4NDY4TmZ6eFdsSmhhMVJNT250VDBTcFFPd1M3YUQ3?=
 =?utf-8?B?WVRaWUF5OVNiQTE0L1dOSGYwSlh3R1c0MEsyWDlFc28yMHc5dEFSMW51ZDNH?=
 =?utf-8?B?cWVOZ1VvSS81ekRMNXFZT3hGT3lYWUNRR0Z3WTIwSjd4QThjM2Q5Z2lIdnBO?=
 =?utf-8?B?aEd4Nnc0dVdkUmlGUng4aTN4ajNNL0JxaFJsUURXS1dwbFBmZzlBNDc1Q0FL?=
 =?utf-8?B?Vi94UGFpaGUyLzJ5NGlIbWVjc2tTR04rcGk5OG1tbkVDS3JOdG1GZ1Fmc2wx?=
 =?utf-8?B?QUYvbGdUWWx1N3N2cW1DWkZERXJYYXZkUkVTT0t3d0VWWWw4cHd3YWcyVGow?=
 =?utf-8?B?SmFzWmFUOEkrL2tyUW0wTjhPbUpVNnBUc3hUdVlUUWtER2EzdWFzS2l0by9h?=
 =?utf-8?B?VXc4YlR1K2cyRm9mZHU5Q2IrZnR1bVVmUlRuYzlmaWZTVGk5QTFUWEdhODhV?=
 =?utf-8?B?a29WOVlpMmJBK1d1dFBhUmVxMEpPR3pmbkhMeWJmK3lKVTc2QzdHK2xidVIw?=
 =?utf-8?B?RFVuVzdhNzhtQ2dUdWt0UW1hOVJySWRMTVBtaGhoM2FTdkJ2VFVtVFJ6MTF6?=
 =?utf-8?B?REx0dW9jYTMvNEQ5STZPWEk1UHFoV0doZGlUR1diOVVMS0VTZ3dOb2VtQjF1?=
 =?utf-8?B?cWJaMmQ0TS9ySVJ0ejhYTWt2V2xHZ2Y2YTRWRnlNcm11bDhNUlk5dW56emM4?=
 =?utf-8?B?N1cwRkpFRVNvcVJla3VnL3N3SGd2ajNkbEs2cDFCdWlYa3ljeXF0MlppK2VB?=
 =?utf-8?B?NGxyek1WdExLMzZBMHAzc2JwWDJra0YrdVUyU1NvdFlXRWNZOWFIekpYcmFq?=
 =?utf-8?B?ZWRtK0VwTDZVcU5EU3hqTmJGd1pnQUFSK3ptQlhjV2Y2K096Q3JWVXBCb3Rn?=
 =?utf-8?B?aDJlUzV6NGFWY0dwYlhsY3IyRk8yaWFlQzBTVHZ6YnVBeHJReHNneGVhcklr?=
 =?utf-8?B?OGNCVS9pQmRISUxqNUlQbG1veHZheEhVd01ERmg4d1k4Q3MvRWFQMDN6R2Nz?=
 =?utf-8?B?MStMYlJKRGFJYkxRbVQxYTNVZzA4R1RxN0syWnk0WGU4bXFQNlM3cHZ1QnV4?=
 =?utf-8?B?czdQRXEvMndSSnp4dlpGQWZsZk1kT1BZazAvU1EzajRpR3RIc0hUQzZjN1NL?=
 =?utf-8?B?MXQyM3VaVG9PTHpLVlVoM1A2b0VRVk15VDM1MHRhcExXbUExanQweFhQeEtI?=
 =?utf-8?B?UFlpS1cxWUs5M2s4bVRhREVpK09NYzlHMmxtTTNqcHovL3NMbkZGTVBHYVZv?=
 =?utf-8?B?MHcyeXYyMlNTcHQ3bm5WWGlMWW85b1MrYjUwQTYxSkYzOVlKR0hUUEMxN1po?=
 =?utf-8?B?TXArY2dSMi9HUXhrTEVIZHErajV5QUhyK0xCeXA5RUhwRDZtczFzSWZrc1ZE?=
 =?utf-8?B?YmtZc0wzT1RSRU10VWF5eWdTMmtEak0rVzBsSXprR2hWQ01tc29YWXBxcDFo?=
 =?utf-8?B?MHd5aWMxaWxSLzNWVTExY1hxUjgxMTZ5RmVJVSt0c1daQ0hva3U1QkwrQVph?=
 =?utf-8?B?V1FsMFBNcUErNm1ZVExoUitUS1IzbW40SFlSSWx2cjMrZllBbHV6dzExbVhB?=
 =?utf-8?B?WkRVbmVEU2pFcCtnRk9aZm5LVUptOGZRbkxTRmhpTkUzelNoREZDL09CTmNl?=
 =?utf-8?B?ckJKblhXdTRsZHJiM2JRY1dOc3ZzWWw1akdFUktvV3B1ancwWGhQeGdSWGVX?=
 =?utf-8?B?d2htUCt6ZlAzeGxaMFl2SHJsalppNHk5TWxJZVA5MVY5a2pEckx6SVVQNDBE?=
 =?utf-8?B?TGhMTXBCQ3FOcFIvcjZ2MFNSbHJNQm5yNmo5YVN3bTJDUEFYTXJ6dWRpRWN3?=
 =?utf-8?Q?C+zM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc449c63-d1fe-4e8c-f5c4-08d9a4fb2ca9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 10:08:14.9885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMZzgwXDMV3mZWK0x/Q2n0WLs7RFcdXNWmJK64dgKc1hVbITyE5GEJFFUnwCS1aG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4586
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.11.21 um 10:58 schrieb Jiapeng Chong:
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2245
> dp_dsc_slice_bpg_offset_read() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2044
> dp_dsc_pic_width_read() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2101
> dp_dsc_pic_height_read() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2173
> dp_dsc_chunk_size_read() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1868
> dp_dsc_bits_per_pixel_read() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1965
> dp_dsc_bits_per_pixel_write() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1787
> dp_dsc_slice_height_write() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1602
> dp_dsc_slice_width_write() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1687
> dp_dsc_slice_height_read() warn: inconsistent indenting.
>
> vers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1417
> dp_dsc_clock_en_write() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1502
> dp_dsc_slice_width_read() warn: inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1315
> dp_dsc_clock_en_read() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Looks like the same code was copied over and over again, maybe make this 
an even wider cleanup and add a helper function to find the pipe_ctx for 
a specific dc_link.

Regards,
Christian.

> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 72 +++++++++++-----------
>   1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 9d43ecb..50ef248 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1312,9 +1312,9 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -1414,9 +1414,9 @@ static ssize_t dp_dsc_clock_en_write(struct file *f, const char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx || !pipe_ctx->stream)
> @@ -1499,9 +1499,9 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -1599,9 +1599,9 @@ static ssize_t dp_dsc_slice_width_write(struct file *f, const char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx || !pipe_ctx->stream)
> @@ -1684,9 +1684,9 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -1784,9 +1784,9 @@ static ssize_t dp_dsc_slice_height_write(struct file *f, const char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx || !pipe_ctx->stream)
> @@ -1865,9 +1865,9 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -1962,9 +1962,9 @@ static ssize_t dp_dsc_bits_per_pixel_write(struct file *f, const char __user *bu
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx || !pipe_ctx->stream)
> @@ -2041,9 +2041,9 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -2098,9 +2098,9 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -2170,9 +2170,9 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)
> @@ -2242,9 +2242,9 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
>   		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
> -			if (pipe_ctx && pipe_ctx->stream &&
> -			    pipe_ctx->stream->link == aconnector->dc_link)
> -				break;
> +		if (pipe_ctx && pipe_ctx->stream &&
> +		    pipe_ctx->stream->link == aconnector->dc_link)
> +			break;
>   	}
>   
>   	if (!pipe_ctx)

