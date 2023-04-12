Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790AB6E0249
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 01:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748E910E9D7;
	Wed, 12 Apr 2023 23:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52C510E9D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=7HhdItHAdBJmzHTfScdmkqFlRVS7ZJYIvKVZxWllbFs=; b=c/bWin99hoForEDgQPu1N4UZ4Y
 hBduKaO0LsfpESU/IMcijRkepfGBTxWY0HBPfNVbAPlAw0shj6Ib6g4cbFeq0yy4EoM+ZNoYkZpDs
 CjtxHuNMmmRCL4caf7ZxJNp1rEonD/fyg6gPaeJ0Pagjl226Si0kLPJCi3wHtCctWaw78BSY/lBe9
 59cVGuJ565MxSAt2wHXfjSNsOSjCQyY8uPp+KdHghPELTPPeEulhX4YLCKDsJhxSV8QX+gln5NQHn
 vuk8ILybfVXDjzJhz6RkScRdV/CR675gkW8KRDGTfjwTbTNDIkN7iWLzcK016chE2K2//+sZA9/p+
 c2vvkq3Q==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pmjYc-004bMr-2J; Wed, 12 Apr 2023 23:07:18 +0000
Message-ID: <2ecbfefe-10bc-4abc-eb07-e0f14229eb1a@infradead.org>
Date: Wed, 12 Apr 2023 16:07:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dma-buf/sync_file: Fix doc build warning
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230330142720.882045-1-robdclark@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230330142720.882045-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Padovan <gustavo@padovan.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/30/23 07:27, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes warning:
> 
>   include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'num_fences' not described in 'sync_file_info'
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/uapi/linux/sync_file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> index d61752dca4c6..ff1f38889dcf 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -56,7 +56,7 @@ struct sync_fence_info {
>   * @name:	name of fence
>   * @status:	status of fence. 1: signaled 0:active <0:error
>   * @flags:	sync_file_info flags
> - * @num_fences	number of fences in the sync_file
> + * @num_fences:	number of fences in the sync_file
>   * @pad:	padding for 64-bit alignment, should always be zero
>   * @sync_fence_info: pointer to array of struct &sync_fence_info with all
>   *		 fences in the sync_file

-- 
~Randy
