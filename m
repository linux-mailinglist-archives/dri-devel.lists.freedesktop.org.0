Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DF38FB43
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BBC6E9AB;
	Tue, 25 May 2021 06:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC776E9AB;
 Tue, 25 May 2021 06:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlmXCRu8vwS5QAm+eskedBKKunjU8+XmPIcoWo37qfnc2Ll14Pc4dJIsl6EDokuaUNhBDbpc///GfCDYnasZYWP64XTIypDtB9SESnIdGEtdwzMlgRc1UQ/RAkdF3sNcR/9G0baCCaOjktU86Ff+whrQhCnZs0vBHsqZgRHgUwkT3bbmfTU080b9hg8jQ68Idn3QGPWhD7culnwjqFhUlP+sCtmcbR0VYfvPqC0l+wWq7v+VArqPwRUpTjiwh3Od6UpenGqyW1A2A6uEFDLvMdW+KPhUDatSjxlecyleu4y0Y+nVvPTCyKwvcYZR/MoTmvVGao8WXk11D4rm85Sfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM4yajRXzYSYrq0WA2JhOhA+GALoic+M0wXZsV1eJG8=;
 b=RcgtghqDhuRe6I1NdUTsAN0S1AqsqBoZTjL7fQmRPUoO6FiZq15PmTKxwlIh9YOvBI+U4oPUKKsZBCGZPyXoy9Sv5or6R9bwoOCj2Hf9RD923yyXTROmWEApjwommvVVi7pVnEOjysUg5aRfGuaHIDtV699MG9NlC+U5f+D69iP4nWN2pyk7pj4/sn3AlZpgfDoM9NMyjUys4gLUJZ+IURGO3ndBZhEpX7oHDqmNglAlzhE2a1HnwIzPywjQ1N06tvE7gG9QRxFsmHtEVFL94+in/CXsLoEkcV78XsyQKMWdfSL7t/A+MLx4wLhFzbSKjR0h/wy/gwqUr1YaJDm/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM4yajRXzYSYrq0WA2JhOhA+GALoic+M0wXZsV1eJG8=;
 b=Wh7lgZQ9HOe7G3CVcXSxMV2k3Jn5zPfmUY8PJg0gUw/tStGmpRYYY693aMniHvVJltJsM9G7I7J05IZ5+GsKKquqhYfrFDVxNKhS/RAme4WPGEewLk62Dicrm140ngTzem1jhGx3RRUzdds4wDEwrzfx8DST29nXa2kN/7+Ig/M=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 06:53:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 06:53:22 +0000
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7e330d33-b104-a006-c5a6-0bd3ada80b6e@amd.com>
Date: Tue, 25 May 2021 08:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1]
X-ClientProxiedBy: PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1]
 (2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1) by
 PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 25 May 2021 06:53:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 990018a5-9a14-4e51-594b-08d91f49c988
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353247CF0F4F9502F4AF0E083259@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cM2RdUg+kABk5HCyG2HXK6u2E5YF+PSio2yZEKJsopBPpMiEPlcx59UOuwvdGQYh3WPfn9S+ZCyi6A5hKTJ0Dw7gXACyMO610VbtjY/i3SNI/Tr/DZ6KCYwSVMc+DuKD2Sp87MMYjm1uVkMR5FFQzH6t1/5yvCzsIQCmgAPTYeY8PZNQJo8Hl879z0pbn46qVQ+9FV2+luZj7hQoqSUwexIYuwhafNa7qw1mJtkrM16WRYXIOgtiPu36qloKRUJ7KYQS3QStqsB7CW/OAYGqsuic0DE5OpBzs0avBvJit459d+kTCZlfDKLkdT1o6NvZFCTNrj/W7IExHTP6wQlP9/3dcFoZDvVEP3VIcCu/Z4LEsRTV3/1qWyTIiWN/+wWjXce08hb3TwOFLqNU5yzyNR4wKYOjnWfVxZ6FHsXnrIg/FB2RDlkX2NAmf1vRefKIWYxFJoxRYcMcUJs9ZDAXmUVybV72Iwa7vNSW8R3FBj0YaU0C90ojjcid496W2fLCVFCDWzQarD6TZ5NAcXkNh5BlAdcNtDZLnAfICHR6XC+Ai6QsFDSvh+SNHcWV6MdXV55F2O8fCVQUAUN0HYiNwaEfBBsolJxlIcyD5yVai/CVnvAtI9A+fWE6WSexLX8Agj/TqIZp7psi8va9hZ8xAtqPHsYcDAtGVGN+n9petfUMHt8EUUnt59Mh0VZWY+d6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(36756003)(31686004)(6486002)(316002)(83380400001)(478600001)(2616005)(2906002)(8936002)(16526019)(52116002)(186003)(4326008)(66556008)(66476007)(66946007)(8676002)(38100700002)(5660300002)(86362001)(31696002)(6666004)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SFdGUTNzbXlobXlMUGI2RUlOeFRveDF3cmxKZWFzM1o0VUJDVXZzb08zQWVn?=
 =?utf-8?B?dEY0N3lITE55WUdXdFE4MnZOcGIrWkVocHNTS043RitlQUp5RWxsT0ZoSUpM?=
 =?utf-8?B?c2p3bzJxeHhORkVPK0ZadkhGT2dON01nNXc1Kzd5dnN5YkphZ0JIcnBZSng2?=
 =?utf-8?B?ZVdoV0tLSTgvRWVqRmtaVEQ4S2htL0VuZ3lqWXdyVm9xV3hVMkdwakFySWhx?=
 =?utf-8?B?RGZObjRHb2FneXJUTUtvT3BrQVc0UWRyaHFLMi9UUTI3Y2ZVN0RheDNMUDdF?=
 =?utf-8?B?NEczUE01M2RMSlVQTXhZVGgrcDM2ZklpaXFpUVRGR0pwZkhMMVJITmx1WFAy?=
 =?utf-8?B?WVE5S2trK2xXVjNxdWwyZGl6MDlYOHhNeDcrY1dnRVhSYXIwTVE1NzhrN1gz?=
 =?utf-8?B?RGJBVSthTWV5aU15WGM5aVN2UHRZS0llQklLdGNrVFlxc0xjRnVTQzZCUGNk?=
 =?utf-8?B?MVphNFFuZkRtWkpvOGh6REZ2MC9Ha0k3Y01LTDVwVWNYSFVaU1pYbzVtSWJu?=
 =?utf-8?B?M1F3OE4zZnp2RVBLSlR2SnBPN0d0Nld3YTNSZlg3TmpZbWxaTU5JUzFLb3JN?=
 =?utf-8?B?dmxYcHNxMnROWW1NcVJmSU4rZnp1ZkFrTWpFVjNVRVNDUHA2RG1STkhrejBI?=
 =?utf-8?B?SFdtbkRMNWs3REg1NDVIU1RyV2x0U21lQVE5SnRjbFUzcVg3NjFWd1BsbXZp?=
 =?utf-8?B?QjU2cUhHa2szbXhsdlZWZFN2b290bDREbkduOEdhc3VPdVpYMkcwSXBhendZ?=
 =?utf-8?B?MC9xdlhvcFplcHRBWDNVQzhOcFE2dnprUVhzZ0pyNEhJcmFscFhyK1krYnVW?=
 =?utf-8?B?SkJPazJkSE14eXcvaDhyM3Z6VW9GVjRpWWcza21kMy84d0pIeHRhMDgxakVu?=
 =?utf-8?B?MHhRbnErQ0lIamFWdUtlMnIxQTdCelppR0ZibTloQmlwQlFNT3k0aUU1V2Ri?=
 =?utf-8?B?NHY3eTBYZnFzc0Z3MEh0eWR6V0V1NjhweThPa1RlNW96ZWpRd3FYbnFNOWpY?=
 =?utf-8?B?YnoyOFhubTdjR3RDTWFYckhaN3VteUdMeUpBQnAvbjV6UnFVYU0xQTQ1VjIz?=
 =?utf-8?B?NEhSSHJZaXJuMjYrbEY3T09sS2tlQ2pCRlFxcEZFeHRVc3RLd1pjWnlQM1FU?=
 =?utf-8?B?ZnR3STlVeGxLRzVobjVGT1lTZDM5ME1tckFMRkQ4bkxUSW9EbE1mOE9Db0k3?=
 =?utf-8?B?aXRYaHhuQjk0L215S2JRWHBBb0c5cDR1NVhGVVR5dVpEV0NQUm5uV1gyVU1Z?=
 =?utf-8?B?dUtPS01NbWk3TUVGWm00MkUwQTMrcVdhdGxscWYzL0lIL3pBbGV0ZnY1MGZ2?=
 =?utf-8?B?UGxWMTdIMXljcWY5SVFEL1BrZ0pOVG9jN2loV3U1dFh1T1VwNCs1YTUwVzcx?=
 =?utf-8?B?TDYrWUwzTFdmQzg3OHA2TklTcm9ESjhWOWxBNFp0M3NnRHhkaTM1emtpK2ZV?=
 =?utf-8?B?ckw5Q21ia0o0eU1mdFY4Qk5zcjVsWnliYmlqcDlVZkpZaGYwUmRkWWRlZTFn?=
 =?utf-8?B?QnBhWExZRGx0SlRJSnBWTStFT1NDc2FLTWhKVHJ2cEZnQ0VQZGo4bk5Gc29s?=
 =?utf-8?B?UHd0VVFZdlRzMTFodmVTRGhZb1BPM3k4QWZHMjdjRzh0MVd2dnRROTE0Nmdy?=
 =?utf-8?B?TmUxaXdmaEovWmNyYkVJQVZSSnNPRzV6UnYyWFAzMGVtcEJmY0lrd2dLV1dm?=
 =?utf-8?B?UUhTTUVkQW14WU4vOStPTGRvTjc5anNJbkprZlAycDByRlE3aTMycTlnSGJn?=
 =?utf-8?B?bjlHWDhyNzdJOEo1UjFBWkxVdmZ4VzE5cHRUeVBLKzVmWVUrWEJkRXBkNHBL?=
 =?utf-8?B?TXVRRnlXQjRTSGI1WWR3NHltcUFUTkREUjFianVQd0tPUkIyOFhpemxWajI5?=
 =?utf-8?Q?Isejud5kL9lLg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990018a5-9a14-4e51-594b-08d91f49c988
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 06:53:22.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPwDaB/nYSWPkkmCrfclpfQ4XVfSQIcAaKOGJFq89ZupvqDm+Svzn03dKy94jdEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.05.21 um 12:46 schrieb Jiapeng Chong:
> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> statement will have a return, so the code below the switch statement
> will not be executed.
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> ignoring unreachable code.

Mhm, that is a NAK. IIRC we explicitely added that code because some 
compiler versions complained that we don't return a value at the end of 
the function.

I suggest to drop the return from the default case and the BUG() instead.

Regards,
Christian.

>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 82f0542..375b346 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>   		return -EINVAL;
>   	}
> -	BUG();
> -	return -EINVAL;
>   }
>   
>   /**

