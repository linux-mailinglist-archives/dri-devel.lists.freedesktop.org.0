Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97D611966
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 19:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF3E10E887;
	Fri, 28 Oct 2022 17:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Fri, 28 Oct 2022 13:37:45 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEF110E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1666964265; x=1698500265;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YBApksLTn7y+gqO3vNjJgwg8KdCjEPbw9x496MPqxv8=;
 b=OGz1UOfvMoYEFBWzns5KwrRgCa4xYGGnps+nHTiQJ1ZOhD5RG8p1dfDN
 DctgwUP9fX1NiJJIyZK97DoQ9nCP/0Tj0q2cyfe4ymRDtNzLnqpThdTgG
 gHdAQ6r7WDO61VRFXawHo6jKfoAzzak8LQIP6aAmgWSx75+BOjUXyMoDp E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2022 06:31:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 06:31:39 -0700
Received: from [10.216.13.23] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 28 Oct
 2022 06:31:34 -0700
Message-ID: <7cdabb64-f165-03be-4121-876736174a34@quicinc.com>
Date: Fri, 28 Oct 2022 19:01:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
Content-Language: en-US
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Liam Mark <lmark@codeaurora.org>, Laura
 Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, John
 Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-Mailman-Approved-At: Fri, 28 Oct 2022 17:39:13 +0000
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
Cc: yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/28/2022 12:25 PM, Mark-PK Tsai wrote:
> Remove duplicated 'by' from comment in cma_heap_allocate().
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>   drivers/dma-buf/heaps/cma_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 28fb04eccdd0..cd386ce639f3 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
>   			kunmap_atomic(vaddr);
>   			/*
>   			 * Avoid wasting time zeroing memory if the process
> -			 * has been killed by by SIGKILL
> +			 * has been killed by SIGKILL
>   			 */
>   			if (fatal_signal_pending(current))
>   				goto free_cma;


LGTM.

Reviewed-By: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh
