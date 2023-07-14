Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D5753A74
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA24310E7F9;
	Fri, 14 Jul 2023 12:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5610E7F9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U52q9nmfqSXcjd7xBlhXkUobA617Xg3/LpjGPrHhJgAH2/PYKiIl0skkBwuZys7g+7D2EwjRYUpEV2rpCrXxGQhTyfca2oTf/c26olL8Qj6xdgezodGnfVM/MEwvYKcr3zN9nea8H7azKpaYtca0FLBIqvbqa8TmCkcWXQNLg8bkVhscIfqFj2Ezp6M6nuRjGAwvsltfHgaRjvZ8efv6OEfojPbIVomnJwYoyElar3Ax4MW2ucW4Ju0TzIGwukKpnLbq5j88SCl80LhXOChSbPZpuGrXy2C2Bo2xIx6DJIAqkPwbOccXW8srZItblcuVEUpDxaiWNsLSbpzWbNWWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl5uT8c6Isyy64UpPrN/9KJafTxCRmA0H+maf5CKk+c=;
 b=iMm0s0pFveJYyVkc+G9N8m12a8WJgxcal/Qe6vAR7RxmBH4nEX556kln84R8XYzpcntHS9shTmbiKflCEQ0ExRkplzMssM8LLnwKViUeeeqn5Nl2ZjUL54vpSjIs2OpYEq8AC2k90iJvuNlApYaGGEWGCAG+zfv82B073Su9cSihM8Tfgp1ChKllkwIVdJnIIS3TG+ATvkWG92q+T2LjmB+sSe3Z1t5OPXT7CrDAVPuFn+yGYGkxLwy2mLebENYmwtcwHCsxvKcLaM34R+2HOCS9Bv7Uf+05AIkkWBvTx3PZeg+x5q0vFSvcg5CEQPOECaWfV5ObZBnyLk9ALgM6kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl5uT8c6Isyy64UpPrN/9KJafTxCRmA0H+maf5CKk+c=;
 b=xNLpTbKgPB+OOGCsOme/AvYR+26Lm+c/5TN1bsFUqjmLq1HVQxAdfuGnBaARp9dSKJou5EoDSVZO9XZrMDmACmnqoPc3Y7WyB0YHgusnN6foc9x6ibrBi3W4oJC5clFMjLa05cs//kUVihl/gzjAQRMGQ0+9qGfGWn1eb5s/EzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by CO6PR12MB5490.namprd12.prod.outlook.com (2603:10b6:303:13d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 12:14:24 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::2007:657c:704f:4dfa]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::2007:657c:704f:4dfa%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 12:14:23 +0000
Content-Type: multipart/alternative;
 boundary="------------ne10cFRk8J45uQwL01hpbrzt"
Message-ID: <f2d216cc-8ba3-26be-87f6-364866949f23@amd.com>
Date: Fri, 14 Jul 2023 08:14:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/drv: use enum drm_minor_type when appropriate
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230714104557.518457-1-contact@emersion.fr>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20230714104557.518457-1-contact@emersion.fr>
X-ClientProxiedBy: YQZPR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::22) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|CO6PR12MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc91db9-14f0-446f-a080-08db8463dc22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EdmCcjSxN87B4ditUSDUGSnk0EPBuE4xQSIZSWoTEuZwfA7G9yLZg/QXULyHoPIeNvfn/PPyB/q5tNZlk57nlnUjtFiPpGliOn/oWcUaRSUH0E48g9AqEQBMvFt+FYZmSkl/bHD15Q+H6LNc1eeo8bujnJcfGb4DLBTz5TYjaew8rLDp8y8RPrfrhfF/qsRqVMzlumgTm6M5syAM9uML+QgNb2rMAMChSoY3Aaev9kdNb6oi1DO7pwyyxCmFKsISqGP9wg4FfThWVUVL2m6TAdZhR1ZbvI2weF0cx7Ck48jZd/fnFkhQOkuU/jdkMx9J4wvPj0Ji+LEYODwZkU0PGtELUmXtMA8fZH3VOITwKIaPY5SHBaTndreITqOCyEgG9rNW6i29SFTrFGuzjkBOeiZ4ugsB1Z/3Q9K0/o2aO910kApMMiIvffITv76WsUvGE2D3Y6PaB9rZS3rRqWdgWiaxQXcmv5Cmqr3poPq/0G/ejMcP8VCZ90M/zUfn4MYiqUgXOivxB9riPYk6Pe2GsF15dxXwE2jyZ/4JEiEj1kKNRHln5WHyqTBL3b6LdhMyxZiq+gwycPKSrodWnpN75itJUMtn2BLR8s0x79b8Hzh6NlVAlAOhRHhlFAwgvKQ04MrxU2I5LJJMIO2bIJP9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(4326008)(66476007)(66946007)(66556008)(41300700001)(2906002)(316002)(478600001)(8676002)(5660300002)(8936002)(31686004)(54906003)(6666004)(33964004)(6486002)(6512007)(36916002)(26005)(6506007)(53546011)(186003)(36756003)(83380400001)(38100700002)(31696002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXRQajlGS21UVG5mT3JhbVBPbFhLSFFwcUpYVUVYdituKzAyM2RGZi9PSWNT?=
 =?utf-8?B?eE1pTVZSRlZtR0k4MTlTV3JlZWRmNHhXdVBLZnkwNHZEa2V4ZDdEcjRrdGo4?=
 =?utf-8?B?c1FlWG1keTcwOFRBZXZONHlHcHQ2dEpmRXJOcXlUVHlMcnpTZEJRdUV5NGV4?=
 =?utf-8?B?UGM2dm4xakxqcU9MMHpKNmVmM2VDRkIwSVhHYmsrNFNGY1FQRWtXOCtUUXBI?=
 =?utf-8?B?d0pFMHA4bmFrNVI2WmtnRDFKWDB0aDZYTUxRcUkzZzJFM3FRRDgzRFdIQ1pQ?=
 =?utf-8?B?bmt6cGxwdXlJT3hZR2tvVi9hWHpnclVYL3E2MlphU05nL2xFeHhQVStGd2dh?=
 =?utf-8?B?dlhNOTZwNEZIMGIwTEtCelFjR2RENzVvdDBLM2FtM3E4V0dPR1dKTzUvZnRX?=
 =?utf-8?B?dC92RlRPMVJVRHA3NkhwaHJySkhxSnpHVlVJc01LN1VXSGhPazQwdy9kSFBU?=
 =?utf-8?B?Y0dLcjB6MnppblBPYnZ2UXBhQVJPaFZZaU9id245aVBHbHhjRkRaaHRPMTQ1?=
 =?utf-8?B?WUpiN3JvMmFZeEd4WC9pZlpUSWViLzdJNDZnUndueW1ZTXh4R21id3oxTnlm?=
 =?utf-8?B?RmFTRHZ4bXRUZEV4dUNVL041bjRyZFFvRk1JdmRaTWRWQitBY0t3SFREdERk?=
 =?utf-8?B?OW9HclY3VFhCN3F2SVhNQUdZOVAxQXoxSGdwNVo4QVltaVNyTFBrdjdoQUFv?=
 =?utf-8?B?MmltMXcvZEZPdVAwb09qaHRhZmNVTHk2Wm5yRW55ZVpDN3BLZkIrVDRsdity?=
 =?utf-8?B?OWVmYXViS3dnaDdpZVh6VkZnTFlIY0srSm91MjMyMXFYWVlUNDhrL0twWG9I?=
 =?utf-8?B?M1BzcjJNSkE1NzQzYVZwYUN3aW92enR6bVVNU253MGE3VXVWL3E1d0s5M1hp?=
 =?utf-8?B?V2U5NTVlNUhyQUIydzFIcmZSZ3oxWEc0eTg2NVBCRW92MmtUOVdSNGFnV2k0?=
 =?utf-8?B?YjB5bW04Q1Zma0VjSHhyYjBkNWJJVVd0SHhPVFJWUVlYdXRLdys0a1FmR0V3?=
 =?utf-8?B?TDJvZ1g5ZS9WeExtV0pIVDNreTlGZFRpb0FXOXE0eXczbFMyRFZQU0VMR09V?=
 =?utf-8?B?TngvODEzUnhmWm80V0RJVFhaZFc4ZGIzSFU4d2kxK2RoMzJ4WGJIS2w1V0V5?=
 =?utf-8?B?Q01vRzZUMmo5N1RRbjJqQWxzQXpzSDJwZEk1WGk2UVUrSmFjeWExREtqeml2?=
 =?utf-8?B?ZTZJN2NXY1FjcXZBVHhIYWFqTHpHWnJoMkc2Z25HdGNiL2ZUcEhlcHkxRkh3?=
 =?utf-8?B?NUJmUm5GdXZEZElTeldnMjM3dGhZZ0JXTnhWWU1IcG5TOThpdXZCUVRtMENP?=
 =?utf-8?B?TjdCUXJQaVd6c1BqZDU3QTZZa08rUWlvWGxJNXozNGptZWlXTXgzZ05hWklK?=
 =?utf-8?B?d0xvaTlSTHB3ai9CZXBKTld5R0JJR2p3TjhQdHpJb3ErM1p4T1RxR3FhTkU2?=
 =?utf-8?B?L0xacTFTcFArVmdrZm95WG1nSGtPaDBCTHlWNzRVdS9uYTRQblZjV0ppQ0U1?=
 =?utf-8?B?a0pFMzUrNnhLYVVTV0IxR0VxeFczZVhXRnVkM2hUbTlkTFEwdjFhaEpSNkRj?=
 =?utf-8?B?SjQ2OGp0M0Q1SWtMUDZmaVFMbUtlZFFRMFp1WG1IYm00ZGo4QTYyQXlKMlU0?=
 =?utf-8?B?anJiV2RIdDFaa0pPek5oWUQ1L3BoWG4wTEc4SUQ5VE5WSElWR3lFbFFKbFF0?=
 =?utf-8?B?eU1SWlNwbjY3dDFGbEtZczhPdXJaM0FONzVhUkEvOEtEN1Y4K2hPZlhhOVA4?=
 =?utf-8?B?V2xKcmphd2NsVUhKS0VHNWxwUXNOUHFHYWpSUGZGWjBNNzdOZ21rRGdsWGgw?=
 =?utf-8?B?OEUySE9nQjVNeTRiZytRRS9pZmk0RXdheGlhVVhTR3pVYllKZk1uY2NxT1R0?=
 =?utf-8?B?cFBGUGM4MUFVUnhrdFh0Z2pyWkhveUR3NENVbm9iYm9pbld2emRqZ2JoSU54?=
 =?utf-8?B?TE1pbktiOEJjS0oyM1NDL1MzMXQyeFBCOGJUaG9SSUxnMjZNblB5YVlmMkZR?=
 =?utf-8?B?UjFPR2ErTVpHRlJUVnlXSFphdnFPTXBrNXZ1Z2dXTkdIUEZGVnJsbGxUckhU?=
 =?utf-8?B?bnNlWG1HWmFmZmxGTTR1eVpzMDdzN2tjR1ZDNFpuS1gzTFMvU1R4T3RHWWdF?=
 =?utf-8?Q?0i8xmkTkCPKxXizwVjL2AJIqU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc91db9-14f0-446f-a080-08db8463dc22
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 12:14:23.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA+rP0Y311KWONmswaxB/+4pysSyuclVn1HMZGa0OPAxtqFd7JzKr+UPsd2SbQa1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5490
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------ne10cFRk8J45uQwL01hpbrzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Simon

Thanks!

Reviewed-by:JamesZhu<James.Zhu@amd.com>fortheseries.Best Regards! James Zhu

On 2023-07-14 06:46, Simon Ser wrote:
> This makes it easier to figure out what the "type" variable can be
> set to when reading the implementation of these functions.
>
> Signed-off-by: Simon Ser<contact@emersion.fr>
> Cc: Christian König<christian.koenig@amd.com>
> Cc: James Zhu<James.Zhu@amd.com>
> Cc: Marek Olšák<marek.olsak@amd.com>
> Cc: Daniel Vetter<daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/drm_drv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 12687dd9e1ac..3eda026ffac6 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -84,7 +84,7 @@ DEFINE_STATIC_SRCU(drm_unplug_srcu);
>    */
>   
>   static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> -					     unsigned int type)
> +					     enum drm_minor_type type)
>   {
>   	switch (type) {
>   	case DRM_MINOR_PRIMARY:
> @@ -116,7 +116,7 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>   	}
>   }
>   
> -static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> +static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>   {
>   	struct drm_minor *minor;
>   	unsigned long flags;
> @@ -160,7 +160,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>   	return 0;
>   }
>   
> -static int drm_minor_register(struct drm_device *dev, unsigned int type)
> +static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>   {
>   	struct drm_minor *minor;
>   	unsigned long flags;
> @@ -203,7 +203,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>   	return ret;
>   }
>   
> -static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
> +static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
>   {
>   	struct drm_minor *minor;
>   	unsigned long flags;
--------------ne10cFRk8J45uQwL01hpbrzt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Simon</p>
    <p>Thanks!
</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Reviewed-by:<span style=" color:#c0c0c0;"> </span>James<span style=" color:#c0c0c0;"> </span>Zhu<span style=" color:#c0c0c0;"> </span><a class="moz-txt-link-rfc2396E" href="mailto:James.Zhu@amd.com">&lt;James.Zhu@amd.com&gt;</a><span style=" color:#c0c0c0;"> </span><span style=" color:#ff9d04;">for</span><span style=" color:#c0c0c0;"> </span>the<span style=" color:#c0c0c0;"> </span>series.<span style=" color:#c0c0c0;"> 

<font color="#000000">Best Regards!

James Zhu</font>
</span></p>
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <div class="moz-cite-prefix">On 2023-07-14 06:46, Simon Ser wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230714104557.518457-1-contact@emersion.fr">
      <pre class="moz-quote-pre" wrap="">This makes it easier to figure out what the &quot;type&quot; variable can be
set to when reading the implementation of these functions.

Signed-off-by: Simon Ser <a class="moz-txt-link-rfc2396E" href="mailto:contact@emersion.fr">&lt;contact@emersion.fr&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: James Zhu <a class="moz-txt-link-rfc2396E" href="mailto:James.Zhu@amd.com">&lt;James.Zhu@amd.com&gt;</a>
Cc: Marek Olšák <a class="moz-txt-link-rfc2396E" href="mailto:marek.olsak@amd.com">&lt;marek.olsak@amd.com&gt;</a>
Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
---
 drivers/gpu/drm/drm_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 12687dd9e1ac..3eda026ffac6 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -84,7 +84,7 @@ DEFINE_STATIC_SRCU(drm_unplug_srcu);
  */
 
 static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
-					     unsigned int type)
+					     enum drm_minor_type type)
 {
 	switch (type) {
 	case DRM_MINOR_PRIMARY:
@@ -116,7 +116,7 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 	}
 }
 
-static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
+static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
@@ -160,7 +160,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	return 0;
 }
 
-static int drm_minor_register(struct drm_device *dev, unsigned int type)
+static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
@@ -203,7 +203,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	return ret;
 }
 
-static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
+static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
</pre>
    </blockquote>
  </body>
</html>

--------------ne10cFRk8J45uQwL01hpbrzt--
