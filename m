Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17975FAA1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 17:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BCA10E0D2;
	Mon, 24 Jul 2023 15:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462D610E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=2Uq2Pslaml20DkLDwKIg3Bu+xRL9XU0v7guHi1TrQWo=; b=AMbbYdovmJxjBGIC8OX8ya+rO5
 g2Q7ooGVlDXvojFicjeF2yv/uglkqBe0+0mGMnHzQUcX47jvY0Zq7onOVrUGWbNoqbkQXhHVidrUD
 n8S8yhZ9ZeqjgWs6TYnvbvRei32lgFqefJrjrLvs7yaSCRmhCwPwm8CvTY/fllnbA6ABRxN4w1ftc
 FsNxaCOwHhX+0JntQD9/ROobN0RQUqtGPwarRdRrM8P/4GPWNoeNuXRacMXgP2yczoH9fmuGG6ysq
 nqa/WRgPR94l+KKbmITifk2GWyyjVVTcLvIo2Z7iStn2qNLXuKtb2O0GMGYhRolD3+bzL0O1T1KB9
 60GLtT3w==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qNxLs-004iws-1D; Mon, 24 Jul 2023 15:20:00 +0000
Message-ID: <7f92397e-a51b-0fc1-bb70-823dfe10f16d@infradead.org>
Date: Mon, 24 Jul 2023 08:19:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dma-buf/sync_file: Fix docs syntax
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org
References: <20230724145000.125880-1-robdclark@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230724145000.125880-1-robdclark@gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Greg Hackmann <ghackmann@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/24/23 07:49, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the warning:
> 
>   include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'num_fences' not described in 'sync_file_info'
> 
> Fixes: 2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  include/uapi/linux/sync_file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> index 7e42a5b7558b..ff0a931833e2 100644
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
