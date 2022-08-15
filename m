Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8759FFDF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8516FBC6CA;
	Wed, 24 Aug 2022 16:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4505C8B57B;
 Mon, 15 Aug 2022 14:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nz/zSYvkhQuJSl3pnbSxE8UO1KI7Swqw8NjPLe00J+fPfFnGSC09n89czxvQBDlVbwdaR5iDxBdTAFKGBLTkoRLZG7UmhK/taaBMD2eODU9YDhrakglmE+3op3wfRQim/a/5ZrEpTs+ImdIXAq6F9KsZZU/MkOsG4r8IhYzu+Q6nKJd4ouRC30QSOwF+mdTVZ4/sZiN9A2+fuGwIEgOz0t+xTO09+jweF2Q/QJpzCSArMICd+Im40Iab5Zk7Psjx+5YXFz7iSdfQLzvlUHGOUYhvFz02RJ6QsQ3Z9kXPOJaCAPiDRwDqVyFTK1KEpuW5os1I7aLE4R21HfTc5SWY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUpBy66JAtqF8GoXjy5DrLL6hMPyV0F//b8U8BIeK2A=;
 b=Zc7W27v/KVyJVaOOuvHBkSmzgL6so/gpa2pGLF5DLwhs19p4qcM4yqGe6MhSSuVpJUuznMExh6mSYhkAbDn7fHCcoG2alZEGis0YIFqZPzBPPzUo24iaHL4I8wLkfGIpxIK3J01F04cMEoWaHa0A6PxSF4eSdvS/zoTpNxvSC6yJyUnaEd3xfe9I7t0YaSDQdk6KMtWHBs0ko7P7FVqiPMGuEZpHgUM7LiznJ7qgsdx+2/q+s6VCE4GIjj9e7CeJ0n03AaLpm7O94/O0xw8sE48x8hKXKpWSsjOh4Ig1e1IPHn/5IZBngVLB9GqBcjVsWrJ/tuWZXj80/mJFkn0yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUpBy66JAtqF8GoXjy5DrLL6hMPyV0F//b8U8BIeK2A=;
 b=oim0cUY/ci31zDPCyhNiVsjA1IgmbcRlBTdmx5ebiuUSx+CijX/5M89FsVzcc3hvuX88tJAHTKDVW2NedFDiIhE6oD1ACfkeHlYGsRsQTQTgAg4BNmXn/rkbx0n5naj2pTdbzFgSGcJIwPia6ynFIPQ5lkNRs9wO9QgU/s+pfuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB3801.namprd12.prod.outlook.com (2603:10b6:5:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 14:07:07 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::41d6:e904:8340:1570]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::41d6:e904:8340:1570%3]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 14:07:07 +0000
Content-Type: multipart/alternative;
 boundary="------------h83oWwEiZhOcjMJE0MQy1JIG"
Message-ID: <aaad4922-48a8-e360-4176-d8ed30b123df@amd.com>
Date: Mon, 15 Aug 2022 10:07:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Content-Language: en-CA
To: Khalid Masum <khalid.masum.92@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
From: James Zhu <jamesz@amd.com>
In-Reply-To: <20220815070056.10816-1-khalid.masum.92@gmail.com>
X-ClientProxiedBy: CH0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:610:cd::14) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22d75adf-b722-4324-1e1d-08da7ec7704c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3801:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42ML1rdJKokKH8ifHIVNjHVgYeaelnWsyO4m+89mgbpKhhTfgi+2yd1r7EZvu/QLhKCinxY/cx/QXDoAu7M6sHIsevxZ8EMWk6VI6JlDfchZRctxMOCmBnMGwse7wSX99k6LVWn1jbSkj0GN0CsewHm4ROEra7J8HwNrVaS5GPdIGL+IT35C+fNx4vgGO7nxFwkcEl5TthBsvciXEu7cWBgi/SuUwJATb1kWxpx8kt46rlMl8SbuiLFY5M646CnqFh38rimLC8rw9cW2KyxJ5VIlogZKhuB49CH6INRtad2X1eZi/9GAQ9gV4l5W+UZV5o+42efWR66+qzS75hmy6g8RkdGX96cdJsd7WwB+oKgRlsK5h3B0Y1QKOTzGY+/Sc3c9hbshM2WIDt1yVj9kb155uMVBdrBTCOBdY+pntfu74rA74LjInNwmrcbPN7iduzJICJzwbIrt2zfEUcUFDvA+W96QJpPIlvIZe4aA/o4SuwBUFjmZltpYECGm6tSHKssgoTnOWHb4dJ9576uwhly0q6HVmwFR1C+3I0RPgCwq44s7fauyddVWoaVBRaEnmoIte9JB86FzqUx2nkogCeY0nAclv0Up5BqS3XW5ii6miO+OnM+uWds9ogxw7GfTHO6BtuoB5kT6/ZQ8oR1o6YOS0M1yqXRZTpyZnUmybGRBtEDMPtY9k5mq55nsXhPq33icK1XBr5CMUmrji0Cr4FW28v8C2x3WI34sic2uMdIfufrynEQDekT/UG6dkQgTXT7sAv1Tjnt6+ge0fGVDT5lYikUR0Ze141/WygCGwDw0I1V/IBqugOGNp9MHgMwG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(5660300002)(2906002)(33964004)(41300700001)(6506007)(31696002)(53546011)(38100700002)(83380400001)(2616005)(478600001)(186003)(6486002)(26005)(6512007)(54906003)(316002)(36756003)(66946007)(31686004)(8676002)(4326008)(66556008)(66476007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBrTHM2VHNNRUx6U0JERzJreGprV3plQTNRV2syMURGTUgyc1d2NlFleldz?=
 =?utf-8?B?bmFaNzJJKys0SkhnM1JSMXdobEZXdnJ1dUpvYWdlY2hMV2l2RXNSMExFSmJi?=
 =?utf-8?B?cS9hbTg2Z2swVTNIZTVMNm1MTW9HMG1BVmFyeWM0Z3R5c0xZcUkrckpsZkNC?=
 =?utf-8?B?ZTNJMFUzNEQwNGZ6eUR4TFJzLytES1NibmQwZDJhaXZYUUZWRGV1cU1CaklN?=
 =?utf-8?B?REhsVUl2MyttSGluTXcwa2pOYUJhd3BFd1Q1N2x4b3pKNXFHbG1YczNqTmwz?=
 =?utf-8?B?S1QrM2w2R1dZTDJuTDlCek5xVmVmb3M4UHZvdytRSy9oSHcxYi9QWE9MUk5U?=
 =?utf-8?B?eDBsbWxmbTB1YVplbXMzUmRkVzhxb0lxVXB0UURsYlh2SVcxTUtoWGxLUnBm?=
 =?utf-8?B?aGVCSDNMM3JUc3lDZmNWdmw5aFZOS3hIQUZGNG5PUXcrQWM5Q0hTUkw5cWxn?=
 =?utf-8?B?WkRRaUxDTm90b2VtRFlSV1Juc3Q2WTFheEliRTQvY256c1hyS2R3c3BoRURx?=
 =?utf-8?B?di9GZk0yb2RLdHl3Nm9RY2xFd1QxOEo3eDJUTENjTEZtdHBrYmxFNUZrVVFY?=
 =?utf-8?B?bTlYVlE2OGZsVzh1TXFWNUNEa2hGb3VtNkhtOGpheHFpd0h4VVc5aTR2TTlZ?=
 =?utf-8?B?ckFOdlpuVTJjdFJoYUZqRkRLdkUvSWppZDFDYThVT3VQbXJJWE8rdldTOWJu?=
 =?utf-8?B?eGQvUUZJN25zRHhpOFo2UUJza2tFSytWS2wySkwrK212RVNFZUs1YTdVVzBa?=
 =?utf-8?B?Qi9zYXBJcWtua0FnVTVhWVNtN0ZrbVpFVzg3bUVscktHeGJGQjFiYVZucE1l?=
 =?utf-8?B?N0t1YU5zN09wdVFGZzVob1dvdXlNM2FFekQzZUtaN2ViTlZ1bHpBWjFveG95?=
 =?utf-8?B?YVVsWE5PSFcxNGNpaE1xcENGU0RRUGhETlljdTh0R29Rb0M1MFd0WFFXM3hs?=
 =?utf-8?B?VzUyM0RrdC9KditQVHJnUkFIWlUrQUxxT2RqL25paWJWWDRDREdiNUdDQlNM?=
 =?utf-8?B?dmIxSmdoVXJiM2RjbGxyVmF2L3N3eS95dEd2MWx0dXRGMlo1VnBTckplMzE2?=
 =?utf-8?B?VkJuTTBxYWNwNkdSb3ZaaDZ4a3hZbVlXeFhCN25SckhVL3NKNURISmF2eEJ5?=
 =?utf-8?B?dXlwNzMvd0MwTnFaaUJ2M1h5WHhFK1ZQMGNVbmNCNStaM2hWY2xHS0VSTmhn?=
 =?utf-8?B?K1pYRzZnelRYMkxOYkFnUmk1allDWWhLdy8rQlhQU2MwY0g1bXRhRS9kNEtp?=
 =?utf-8?B?ZnhhTVFuOW9pZ1IrZzZmNnFETW5HbjlMYTlkdUU3V09zVFRKaFdYVGJOdFlS?=
 =?utf-8?B?RW5rNC9YbzJDQ2ZKeWR0c1VvT2VycitOaml4S21QY2NIb1lCY2I0ZGJ5ZHlP?=
 =?utf-8?B?bm1GR0pPcTc5QnNXTHp1cWpSc0pOeTk0Z2pmcndXTTRMVXh1Nmh4ZFBxbERY?=
 =?utf-8?B?VkJCakgxVnBWZVBsNGF4cFpucHEzcHUyZ25pVEdUOWVLTy9XWDl6NHZ1M0NB?=
 =?utf-8?B?MTNBb1dlbldLZ0MrbEt2enlKSUxQRi9XSEt1T2lnNXZINUVZeHViSmdKQ20z?=
 =?utf-8?B?VklyWXI5OUVmT1FiejU3Nm5vVGlrTDNUdGlKS2ZYRjA2dVVTOGZxYUk4bzEy?=
 =?utf-8?B?TGF6U0laQ3RpUGp1WHJDZGJ3SUExcVlKY05pd3lOdERwM1RJZk5tZUF2cEFE?=
 =?utf-8?B?Y3BTWDhwNjEra3U0elNwT3MrK0hwbGdYNmxFc3FYUUdwMm03emhTOTkwbXFu?=
 =?utf-8?B?R0tkK0dVVVlPYzVpS3hWTFo0UHRMY1M5NjlIOGdPdHREL2VLZ015VDZBQ3NY?=
 =?utf-8?B?cHlCbGQxMkJXYnZQYm45OXEvTzB1ZWIvZ2xyQTFuVGRGOFgydldaTTVIdzFN?=
 =?utf-8?B?TjF4ejh2eFBobXF5YmEvaElEdm9wVWxwT0NUOGFNVkxyUmp3WnA2YU92ckwz?=
 =?utf-8?B?Wmhkc1R0M3FMeXFxR29CMFlTSEN3VXNhdGVaakorclB0blpWblQ0Z0M0SGFR?=
 =?utf-8?B?Rkx6K3VSNlFJeW02N3JraVF3cUc3QmhXa0JpWWdMeVIwZXJHQ2YwN2tqWmtK?=
 =?utf-8?B?T1FTdFpLTVBsREhzenUrdDVodmNTeGV4c1h5TlN5Vi9EOVZJVWdaemF0RTVw?=
 =?utf-8?Q?cVq/wMyV1NMYkkgXjA3eHfVzx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d75adf-b722-4324-1e1d-08da7ec7704c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 14:07:07.5693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5/SXUwDITbQkMpJACpSuCjqNsfQtZ/Ow4ajYZ9dJK3hvvyNNA9UWzC0rBLaagvI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3801
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Sonny Jiang <sonny.jiang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Ruijing Dong <ruijing.dong@amd.com>,
 James Zhu <James.Zhu@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------h83oWwEiZhOcjMJE0MQy1JIG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ThispatchisReviewed-by:JamesZhu<James.Zhu@amd.com>

On 2022-08-15 3:00 a.m., Khalid Masum wrote:
> The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten
> before it can be used. Remove this assignment.
>
> Addresses-Coverity: 1504988 ("Unused value")
> Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
> Signed-off-by: Khalid Masum<khalid.masum.92@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index ca14c3ef742e..80b8a2c66b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
>   		fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
>   
>   		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
> -			r = vcn_v4_0_stop_dpg_mode(adev, i);
> +			vcn_v4_0_stop_dpg_mode(adev, i);
>   			continue;
>   		}
>   
--------------h83oWwEiZhOcjMJE0MQy1JIG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>
</p>
    <pre style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">This<span style=" color:#c0c0c0;"> </span>patch<span style=" color:#c0c0c0;"> </span>is<span style=" color:#c0c0c0;"> </span>Reviewed-by:<span style=" color:#c0c0c0;"> </span>James<span style=" color:#c0c0c0;"> </span>Zhu<span style=" color:#c0c0c0;"> </span><a class="moz-txt-link-rfc2396E" href="mailto:James.Zhu@amd.com">&lt;James.Zhu@amd.com&gt;</a></pre>
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <div class="moz-cite-prefix">On 2022-08-15 3:00 a.m., Khalid Masum
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220815070056.10816-1-khalid.masum.92@gmail.com">
      <pre class="moz-quote-pre" wrap="">The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten
before it can be used. Remove this assignment.

Addresses-Coverity: 1504988 (&quot;Unused value&quot;)
Fixes: 8da1170a16e4 (&quot;drm/amdgpu: add VCN4 ip block support&quot;)
Signed-off-by: Khalid Masum <a class="moz-txt-link-rfc2396E" href="mailto:khalid.masum.92@gmail.com">&lt;khalid.masum.92@gmail.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ca14c3ef742e..80b8a2c66b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
 		fw_shared-&gt;sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
 
 		if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG) {
-			r = vcn_v4_0_stop_dpg_mode(adev, i);
+			vcn_v4_0_stop_dpg_mode(adev, i);
 			continue;
 		}
 
</pre>
    </blockquote>
  </body>
</html>

--------------h83oWwEiZhOcjMJE0MQy1JIG--
