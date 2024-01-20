Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109648332FB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 07:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70D10EB1D;
	Sat, 20 Jan 2024 06:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF710EB1D
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 06:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=KyVk/SOUXJl8dnnCYM6D4LOj7QVA0hhOE3Pxx0E0hBA=; b=EcD+dZah5jKikYIqbwm00byvbZ
 GKnVP5FJSKNnitaA+aLoInrWxgfIJEJcJXIPTq7KOeLXt8iA+pVVIwIl9ChEQCNVTtX2ZOf4TepsB
 ddnp2hRWH1oXabOymclFtX8aGOwMq/ML360oIdmaxdi9eIcGW5Tof2Q4XSFSNYJgM3gtnLWseuS+S
 cs9jxsJILV0yHBaChKz1IkKOIIpEevux3RZLKjkTgM11qvg2LXaRdZpIrlZ5rrDLK8RHEprPtqxZl
 2jbhzApDZgxbJ1U9M4d5WLICYB3QKRYi1Ke20ST9OIEpNp/fcoMPWOhO5P7NRz4AAhBHnwqwUtPY4
 6HrUjK5g==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rR564-007Lqr-1y; Sat, 20 Jan 2024 06:44:53 +0000
Message-ID: <a7c8ec21-adf5-4dcc-af7d-33662f864596@infradead.org>
Date: Fri, 19 Jan 2024 22:44:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display: fix typo
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
References: <20240119102215.201474-1-oleksandr@natalenko.name>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240119102215.201474-1-oleksandr@natalenko.name>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/19/24 02:22, Oleksandr Natalenko wrote:
> While studying the code I've bumped into a small typo within the
> kernel-doc for two functions, apparently, due to copy-paste.
> 
> This commit fixes "sizo" word to be "size".
> 
> Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index bd61e20770a5b..14a2a8473682b 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -52,7 +52,7 @@
>   * @adapter: I2C adapter for the DDC bus
>   * @offset: register offset
>   * @buffer: buffer for return data
> - * @size: sizo of the buffer
> + * @size: size of the buffer
>   *
>   * Reads @size bytes from the DP dual mode adaptor registers
>   * starting at @offset.
> @@ -116,7 +116,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_read);
>   * @adapter: I2C adapter for the DDC bus
>   * @offset: register offset
>   * @buffer: buffer for write data
> - * @size: sizo of the buffer
> + * @size: size of the buffer
>   *
>   * Writes @size bytes to the DP dual mode adaptor registers
>   * starting at @offset.

-- 
#Randy
