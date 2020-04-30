Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F31BF167
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554F76EB4D;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4738B6EB2E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 02:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=djVWTxQYfvvGPGVFEwE2B90kkenXlbJGcD+PszmK/2M=; b=JJMEwpVhbqEyGZO1pKvJpLnxth
 l1dJJuerlo8k6yWXdJPNp+1kH1Oyo5kRouZLy3l789vCJ+vxL/gSEbyC4c3psSR8P804xeCogBX2M
 VAFy1RSfIdypQziZGq1UySM3FMVxZQNei7JFpfQLE1Igoi0iJ2NA5A2aYquBMVVgSziPXEBh0Nxzh
 ZQ1ZBIuytrhT8BzPQizoAO3nA+btm4GZ/nVBVBe4QpJL9PeIjnWfQTE2IJpOHKJIE1EEK4EtblaSf
 Iyo2WHE0ul+UFfvw7T7QfY++MM7AdS2K1LNEiNmv6greKpZ2EmZjAmuvmMfT7lQbcW/C/mvBL8fe3
 rZrXahig==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTybJ-0007Az-Jf; Thu, 30 Apr 2020 02:06:57 +0000
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
To: Vitor Massaru Iha <vitor@massaru.org>, dri-devel@lists.freedesktop.org
References: <20200430015930.32224-1-vitor@massaru.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
Date: Wed, 29 Apr 2020 19:06:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430015930.32224-1-vitor@massaru.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> Add missed ":" on kernel-doc function parameter.
> 
> This patch fixes this warnings from `make htmldocs`:
> ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  drivers/dma-buf/dma-buf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ccc9eda1bc28..0756d2155745 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functionality
>   * @dmabuf:		[in]	buffer to attach device to.
>   * @dev:		[in]	device to be attached.
> - * @importer_ops	[in]	importer operations for the attachment
> - * @importer_priv	[in]	importer private pointer for the attachment
> + * @importer_ops:	[in]	importer operations for the attachment
> + * @importer_priv:	[in]	importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>   * must be cleaned up by calling dma_buf_detach().
> 

Sumit said that he would be applying my patch from April 7:
https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
