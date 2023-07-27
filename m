Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D8376437D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 03:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C4310E08B;
	Thu, 27 Jul 2023 01:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F29C10E08B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hp6cp7A51G4iktXiOcxoO4u7miw3X4y4lxN8UCoOFWg=; b=pm49HYnGqpGvPGwRRyIdGfVUc2
 TFYKuzsKW2So1LPZo3brH+GTA99n8QIX5QZYOJLgYu/V24erEs15gpmatnxht7iZItH9owzL7eo93
 h2hKM/IvPr5qdke5XTWavQebJhczW5N/TWUItH7co+Iy3lHHgLJXTQlUnrsVcbPlwkUpHL4h3aIl9
 HWRd8YHH8vvLj/OBR9gNlHF+P/VR69zsB7c7ZV0qhhPj/D9mwq4HUxYDF9HkBeABgR/s+EdzotJZ/
 RgsCAPEw0uKdqMJEnevaxO3y+xhvUzL4hNgzSiJLfp22HiAJZjXxARy+gM9SiabRDj/8K3Cq4Zks2
 rnjpX+3w==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qOq2j-00BszC-25; Thu, 27 Jul 2023 01:43:53 +0000
Message-ID: <d811b6c7-fe01-4f9c-be14-31defce4d864@infradead.org>
Date: Wed, 26 Jul 2023 18:43:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dma-buf/sync_file: Fix missing colon in kernel-doc for
 num_fences
Content-Language: en-US
To: David Reaver <me@davidreaver.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Clark <robdclark@gmail.com>
References: <20230727011944.327807-1-me@davidreaver.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230727011944.327807-1-me@davidreaver.com>
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
Cc: linux-doc@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 7/26/23 18:19, David Reaver wrote:
> The struct sync_fence_info member num_fences was missing a colon in the
> kernel-doc, causing this warning when running make htmldocs:
> 
> ./include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'num_fences' not described in 'sync_file_info'
> 
> num_fences was also clearly missing from
> https://docs.kernel.org/driver-api/dma-buf.html#c.sync_file_info before
> this patch.
> 
> Signed-off-by: David Reaver <me@davidreaver.com>
> ---
>  include/uapi/linux/sync_file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> index 7e42a5b7558b..b389a5495181 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -56,7 +56,7 @@ struct sync_fence_info {
>   * @name:	name of fence
>   * @status:	status of fence. 1: signaled 0:active <0:error
>   * @flags:	sync_file_info flags
> - * @num_fences	number of fences in the sync_file
> + * @num_fences: number of fences in the sync_file
>   * @pad:	padding for 64-bit alignment, should always be zero
>   * @sync_fence_info: pointer to array of struct &sync_fence_info with all
>   *		 fences in the sync_file


Same as https://lore.kernel.org/all/20230330142720.882045-1-robdclark@gmail.com/

Hopefully someone will merge/apply that one. Rob, can you make that happen?

thanks.
-- 
~Randy
