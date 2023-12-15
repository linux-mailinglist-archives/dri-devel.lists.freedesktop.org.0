Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9F8141BF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 07:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A820D10E312;
	Fri, 15 Dec 2023 06:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F31B10E312
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=DaBm7yNqDy80Knldoq2N90xqNJQZ4RvVwAdVo/hC8ZM=; b=CDRG6j6/xIjPgvJvv8YcjQv1wg
 RJYgnUg8FHAw2xne5lp8nzMED/5RwO2cAyJg6uRZ2iR2INWXRiaK4kydsmHdeEKb8a3ZA+8dwIFwK
 iHTqepcy4yDVbl3WpjMeltbBLjVO3JzS+YBX3FEllrnUWGtSivj0Z4AcDLjhbRu5BV4pVLk6JewRa
 zLrhDwg4NWUmup7Ikyd3zxdnuQp1ySJYJ9kl/vdRCRoCws9atX7OLzmve3NuXx+KAp0e/0bA0A44W
 l8Ft4ZARKrXrZmiJAFRJcqnPuQwZrZygOuGqmvsXvCGBMq2GWqUx5hxwWdy25Ts3KLbXCVe74nbbb
 deUpjOlw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rE1ZO-002ApI-0X; Fri, 15 Dec 2023 06:21:10 +0000
Message-ID: <e9b028b3-20e6-4e74-a305-c4f18efc70e1@infradead.org>
Date: Thu, 14 Dec 2023 22:21:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drivers: gpu: drm: vmwgfx: fixed typos
Content-Language: en-US
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
References: <20231215060159.555229-1-ghanshyam1898@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231215060159.555229-1-ghanshyam1898@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 12/14/23 22:01, Ghanshyam Agrawal wrote:
> Fixed multiple typos in vmwgfx_execbuf.c
> 
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
> V2:
> Fixed some more typos suggested by codespell
> and the community.
> 
> V1:
> Fixed multiple typos
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 36987ef3fc30..76aa72e8be73 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -127,7 +127,7 @@ struct vmw_ctx_validation_info {
>   * @func: Call-back to handle the command.
>   * @user_allow: Whether allowed from the execbuf ioctl.
>   * @gb_disable: Whether disabled if guest-backed objects are available.
> - * @gb_enable: Whether enabled iff guest-backed objects are available.
> + * @gb_enable: Whether enabled if guest-backed objects are available.

"iff" normally means "if and only if" and its use in the kernel sources is
usually not a mistake. However, this one sounds dodgy to me (before your change),
so it's OK IMO. Also, the line above it uses "if" for a similar comment.

Maybe someone else knows better.

>   * @cmd_name: Name of the command.
>   */
>  struct vmw_cmd_entry {
> @@ -621,10 +621,10 @@ static int vmw_resources_reserve(struct vmw_sw_context *sw_context)
>   * @sw_context: Pointer to the software context.
>   * @res_type: Resource type.
>   * @dirty: Whether to change dirty status.
> - * @converter: User-space visisble type specific information.
> + * @converter: User-space visible type specific information.
>   * @id_loc: Pointer to the location in the command buffer currently being parsed
>   * from where the user-space resource id handle is located.
> - * @p_res: Pointer to pointer to resource validalidation node. Populated on
> + * @p_res: Pointer to pointer to resource validation node. Populated on
>   * exit.
>   */
>  static int
> @@ -1069,7 +1069,7 @@ static int vmw_query_bo_switch_prepare(struct vmw_private *dev_priv,
>   * object following that query wait has signaled, we are sure that all preceding
>   * queries have finished, and the old query buffer can be unpinned. However,
>   * since both the new query buffer and the old one are fenced with that fence,
> - * we can do an asynchronus unpin now, and be sure that the old query buffer
> + * we can do an asynchronous unpin now, and be sure that the old query buffer
>   * won't be moved until the fence has signaled.
>   *
>   * As mentioned above, both the new - and old query buffers need to be fenced

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
