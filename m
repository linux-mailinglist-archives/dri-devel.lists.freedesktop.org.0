Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C2425165
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0626C6F3FC;
	Thu,  7 Oct 2021 10:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DAB6F3FC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 10:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbB2zjr3DSxXOk6lBre6OOJU9wNYDcUhnu8ldp6XYZw7QmcHwoXyiBR51HPXR3JbhWurCaEJ/g9sGTi/nvo0aU68Fqo55kPI7o5O/z9k3q2BMtdQf+Y746M/czQ/52ogcmyk1le78d3Q22PO8l4BFGmdyI7+KGAyNEhPYm60I6d2wXeahU54bcj0hoXd82pPl5EJHFv7gCQWHPw24rfufbV2PTjbhQkCGk8j4cV8ateF4iiq3TTBu5nu6ptR7PiOTbgmbENPC/zckZKJDInystsDZhQ8NpwAxa+R41S2aiTjM2712DTZtpFPT/zO1Bew+FHYmhRLgDfxI3q9SrMFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAro+Q+c2Aj9eEh4eCjPCo8J9JXEOE80UcAosLJalCs=;
 b=WNt//fx+iO5pbmnaopD9Rp7xzWIpdfQk6K6lRltsu5oG5fNNiuTVbPROAlkIE2FznwUtNVqjJOwDpTlS/kSSaeNRF0thUIWZaKGYihGj/ChReuBJbmPJHqPk0tizDfI/CFxJdq+yE2shxsbFnQ0LiSAT603UT7omOjgTVd7GDbZKL2HFeoZYDZ+/jDjcwHfR4G9iThdsdiKMrefCIzAAXtji9aWwMmJcgv6+3VB9ljlaBMkkJPARoB0dWisSaoELyeQRZXBcdDwhi3UNcTVXeXW77QjkT7cbqiwI1mMFy/nLQPdnNIAE0nxR3N3/jZelY/efpZLlarMs8fC+/GRznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAro+Q+c2Aj9eEh4eCjPCo8J9JXEOE80UcAosLJalCs=;
 b=GyYIVEuMNOZqo2S7hYk3sS6WGbY84vn9dvdbACFero1Aa6ao4rHinA34zVfPJtL+p6S6qTnpq3+1dGpGnkk9FFnIhW3qGO6Tm+MPC7PZ32pDQHKK0j9UE55zPHG2+dZtRqZySpGXfOlue7ew10pUPyWhXcph+8A866Rw71cu9Do=
Authentication-Results: amazon.com; dkim=none (message not signed)
 header.d=none;amazon.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0077.namprd12.prod.outlook.com
 (2603:10b6:301:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Thu, 7 Oct
 2021 10:45:11 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 10:45:11 +0000
Subject: Re: [RFC PATCH 1/2] dma-buf: Fix pin callback comment
To: Gal Pressman <galpress@amazon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, Firas Jahjah <firasj@amazon.com>
References: <20211007104301.76693-1-galpress@amazon.com>
 <20211007104301.76693-2-galpress@amazon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <747d423e-9073-9bed-778a-292e47adf0f6@amd.com>
Date: Thu, 7 Oct 2021 12:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211007104301.76693-2-galpress@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0108.eurprd02.prod.outlook.com
 (2603:10a6:208:154::49) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0108.eurprd02.prod.outlook.com (2603:10a6:208:154::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 10:45:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0a1cc96-d16a-4219-a2f5-08d9897f895b
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0077:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB007718E36125D4757CCB0E4F83B19@MWHPR1201MB0077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/4a7JLFLhpIa1MnclOzA6SfcgkcMtGLfuoIU5ZkRINv8DKd2zgbwyLuhCkeikwusTWyUyU+9fZfXGCgxlBNVKlZ5RQUm4mik9uK7/qTtzIWFIssea0pQnPjFmVMI+YDwsI4VC17tX4neqTgZ0vKn7gD3ZA+LFchNzu1VD9aq2LvPAFX2HZW0PRg6Am3x3zSTiCpQ1bQ//fxDC7pNcaHvY1NZ4Rc1HPcKSKzg9PyxSn0iFL19VxuUgRnG0ezuVrm6C53RYphPZ93lywTCWmTn0gyauTUjjBMtnxKyovsRzROe5UYXIC8HicxltV4fAcdhLnnNfK0c75gbp2lvf4LCKzvHekwzChXk0Shjbo69Yeq0y3wh9cJdo3heT8Ue9uSDrS+fZQsLwBuDQq7182vZcdO0BRx5h49YXVgJfkC4OAt9N4JOAJJYMrG5u3UqX+O6FnRFxlbNdGItSGYfdA4cOPAL7Q0o2BPQY4lzDFGvugw6VE9EsGrvD5tIUPQRf0qoJCKbMbUS6GMKgyYZF8+h0xwJtvmhLpJ/zw+bZqKqq1/FEXfVOzDzDIoR7G2iOYlI09p9fRMILoBI3U64KJjh6FJLQarSju7918rQuH5La9iDgozz0/B4gRp86wLPFIRlmDuySlbqTtFX0d7ZQpqd3U8W6D01ms+8VJOe/qUMCvhszuQwUHIygpOP5uUpkv5ZPzX5wwoIgZxJnGNXn3OMEZurxmSrcJqoWel66fIyhqScFhlc3OjcW3rbBlDAGdv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(66476007)(110136005)(54906003)(38100700002)(16576012)(66946007)(316002)(66556008)(4326008)(2906002)(956004)(26005)(8936002)(5660300002)(8676002)(508600001)(2616005)(86362001)(6486002)(83380400001)(31686004)(36756003)(6666004)(31696002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJmeXh4cVpwMitxYVJXOW9WKy9JWGQzVkZmKzFGandjSFN5TmZwNE9sNHVD?=
 =?utf-8?B?NjhKL1VsR3IwamJ3UStsNUl3NFJBemszcXRCNm9jUXBRNERyWHJNWnJPcWxu?=
 =?utf-8?B?dkQwQ1lYcGt0dnFBYUFjMUZ6SlpEVE5nZHg4NnVEQTIxQ2JrRVVKNmphNXhN?=
 =?utf-8?B?UDFVZyt5NVBlTnlkenI1OHo5aVRLcVlHQXdvZEg0cGZ4TTRBS0M4MzVDS2Rj?=
 =?utf-8?B?MmQ4NlFBVFpGWmg2bCs1cjRRcnlQdllJZC95OWttSmN5akhuYk95L1g5QkhM?=
 =?utf-8?B?QzR3UTlpRWhXb0xXY2QzRVQ5MXMrLzRTQUZ0SlBhQjRDdkU4MGNueTNIU2tn?=
 =?utf-8?B?K2NHRlUxbGJ0dklLc0V6dWdINFhZNEFtNXlFOXpWM0Yrcmwrekt1MHJiZzlG?=
 =?utf-8?B?ZlVnaTc5bjBtVjc2cEFBTERBUzBOTUJOaGJQUEhmaFJGQWpIWkhJUkwzMEF3?=
 =?utf-8?B?OE1sK1lOQk84WUlSQm9Jc1ltdjJxWVA4MG1xeWNuRnpTbSthRnFrajYxVGlj?=
 =?utf-8?B?SW5wNmJPTEE2RnJRaXdkcklhYUFYZ0svZytUR0ZHb0dveXoyTzVmYUNtV3d0?=
 =?utf-8?B?b013ejg4OHpWS1hDWDZ6Y2JPQmxrMmdNTm4vZXJYNjB4NmtlZ3ZUbU5vUlBX?=
 =?utf-8?B?dEZFb2UyeWFYejJvOEZka2ttMmpLRlNYL29FYkx6dnBqSEZGbDRqRTEzVDNp?=
 =?utf-8?B?V0NmanJraHYwZTErN3NHdVJKTTVSUDNGTnpmdXI1UVdWdXlEekpLMnFzd0ww?=
 =?utf-8?B?dmtMQXRkNW4rclFWVzFTeXNVZW9lNzh5bEJOeXVMNUorb1VpU3hXVUJTMFJz?=
 =?utf-8?B?MXVhcTg2a21ZMm41VitzSXhBTS8zampEZXh1cUxuTFE4VVV3VGlSS0hrNWJw?=
 =?utf-8?B?T3VjMHhXVDFpSXFJdXNhamRaQXU0YVJDNVhDelVCRk82QzduR3VrRFcweUFG?=
 =?utf-8?B?blJPbFBjcmRtMVA1TVhBaXNPczh6amp0bVdDMmwvRTZYQ0labnY3NEdJcVdn?=
 =?utf-8?B?ZHpvSU54TFJ4akE4Z21IYlI1Zks5RHUyU2NGL05DQlNkcU9RWkU3UGJRZ3Fq?=
 =?utf-8?B?S3Bva3p2bHpaT3g4TmpqVVQvdlc4MTdLOEtjcUc4ZjRWc0p3cnlZN1VBU0Js?=
 =?utf-8?B?V05CU1IvMjdlWWdhajRGUUxxR2Y1T2ROQlk1elRrMTRHZTJKL2R0aTh6OUhp?=
 =?utf-8?B?K3dWTThmQ3dNWmlpaTU1RHlhTHNmOThZaytQbEJvWkhJakRzenl6aGtML0tn?=
 =?utf-8?B?a25Jc2xLeS9XUEJuTnRCSU92VmRoVlFGQWxOeGx2ZzhRYThYTzQ1RkZySVNh?=
 =?utf-8?B?WmhRV3lGckp0VlJPQTE5UWFiZ1FSc0JRNGFDWGEwQlNkelV0M09RVm50NVY0?=
 =?utf-8?B?ME9lYlpvckNPbWN4NEFPRndlR1VtRnFxR09aaUM1ZzlaSWRzSWNwMUVuTlVl?=
 =?utf-8?B?UXdGRitXRndyU2dSakFlZld1QjdEeUFNQWpJTWloczV3dUVwZk4vVElxeGVC?=
 =?utf-8?B?b3ZQTkZ4VWl4M2I0YmhOUVlPWlZ0a2NQeGdBUi9iUFpUVjh3VEhEcjc4REdy?=
 =?utf-8?B?MzE2SEx1eXVaOXBsVXIyM1FDeUJvZkVZMWxseUU4dnVJQVkwZGJGb2xwd3VJ?=
 =?utf-8?B?QWFUenVjRUR2UTVVdEhnQWo0T1ZoTTBtL1lYdCtZWW52SWQwZFBHQUVEaFVL?=
 =?utf-8?B?ZWNYSTNVT205dFFYQTRRYWI5VStuUjZGVkpmUXdkR1FlRGpZaGZVVEZMTm5a?=
 =?utf-8?Q?TMKRMwYmnyBMozyiWvDPLyxIrW6HkJ/Ak7VMGbL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a1cc96-d16a-4219-a2f5-08d9897f895b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:45:11.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zv0if4Ywpe0RRHeP6UHVlB+dst3m28Bt02RojUaNWjR98ycBHKbtWCAwvWBzEqXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0077
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



Am 07.10.21 um 12:42 schrieb Gal Pressman:
> The pin callback does not necessarily have to move the memory to system
> memory, remove the sentence from the comment.
>
> Signed-off-by: Gal Pressman <galpress@amazon.com>
> ---
>   include/linux/dma-buf.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..93830731a9a3 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -86,9 +86,7 @@ struct dma_buf_ops {
>   	 * @pin:
>   	 *
>   	 * This is called by dma_buf_pin() and lets the exporter know that the
> -	 * DMA-buf can't be moved any more. The exporter should pin the buffer
> -	 * into system memory to make sure it is generally accessible by other
> -	 * devices.

Maybe change that to something like "Ideally the exporter should pin the 
buffer so that it is generally accessible by all devices".

Christian.

> +	 * DMA-buf can't be moved any more.
>   	 *
>   	 * This is called with the &dmabuf.resv object locked and is mutual
>   	 * exclusive with @cache_sgt_mapping.

