Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427B81414E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 06:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579DB10E055;
	Fri, 15 Dec 2023 05:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC08210E055
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=VnY4Tj+dtmGl0GZ86xgXqce9hVbPF6aFLFaJDWM1z5c=; b=f2g2AoDkFOSn4ODIYzp6usCO/c
 p/dTqw5KkTy804NeQS/yjH0CKgDND1/LSaYSDDCx/WXSWgN+5ca8D4/hZd/iueGqodGbaHw9dhAI7
 VQrmCMJFmfJUzweXuoJswO+G10XyQ3qzw7vtyUxcU+wy9aVD2ZfIYC/9CTkgFWhSnPA7Swqz4GHKJ
 083nsx+B5dzYGScAema8/Fgjs2OP2T5rJBy0VP0u3dHzkVsk6cpxyErcyMxwQDmPda8KkaKEh+fB1
 3lCJwiLTJ2yJmtSQ0P8V2prcDK0B3WTb+JLH43HE89VQ6xIAqsQeHC2f7FGwvcvdniYDBe8UYDvI2
 JEzHEMQA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rE0rR-00252W-0R; Fri, 15 Dec 2023 05:35:45 +0000
Message-ID: <346d12b2-a78e-4372-880a-e522fdca7169@infradead.org>
Date: Thu, 14 Dec 2023 21:35:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: drm: vmwgfx: fixed typos
Content-Language: en-US
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
References: <20231215053016.552019-1-ghanshyam1898@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231215053016.552019-1-ghanshyam1898@gmail.com>
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



On 12/14/23 21:30, Ghanshyam Agrawal wrote:
> Fixed some typos in vmwgfx_execbuf.c
> 
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 36987ef3fc30..272141b6164c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -621,10 +621,10 @@ static int vmw_resources_reserve(struct vmw_sw_context *sw_context)
>   * @sw_context: Pointer to the software context.
>   * @res_type: Resource type.
>   * @dirty: Whether to change dirty status.
> - * @converter: User-space visisble type specific information.
> + * @converter: User-space visible type specific information.

ack.

>   * @id_loc: Pointer to the location in the command buffer currently being parsed
>   * from where the user-space resource id handle is located.
> - * @p_res: Pointer to pointer to resource validalidation node. Populated on
> + * @p_res: Pointer to pointer to resource validation node. Populated on
>   * exit.

ack.

>   */
>  static int

Please also fix this one:
vmwgfx_execbuf.c:1072: asynchronus ==> asynchronous

I suggest that you try codespell.

Thanks.
-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
