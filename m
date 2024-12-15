Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1F9F2330
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 11:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5CC10E04C;
	Sun, 15 Dec 2024 10:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SAahw5ST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258C610E04C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734259563;
 bh=5t1BNa5HQdM+3zXQLQgSHFGt7YUlUZMcFtjhuswos30=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SAahw5STK5MQY8r3hb/+muvdXAHXJSG1R4iNSAoIa7ddYEPUMTdbLGeeGWlB7GtwC
 fzWupY3zQDE8ekfFLZF3n46QhKkCMcD76VoANQqKwum1DHcBOFinTRNAMkbwWbVnPB
 5vqv2DyksLCs9Iyyf6uFhW0oD5yujw6HThc1oHicXSzBEpsTdDwoInC5QQ1yhJ3u4j
 GPaJtyaaiV4r8g8x9TwPhcfjlRYe/xf+6xG4QdChGo3IL7WJx2rli1d6aO6BGh3Ccy
 sbQ7eZ4GZ0Tyf/P98ptr5/7CCe54JX7ue223r7LywsTgHGJZMZtgY67Nvt0fHK9acJ
 LU/dLamUSvMAw==
Received: from [192.168.1.90] (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0726317E3620;
 Sun, 15 Dec 2024 11:46:02 +0100 (CET)
Message-ID: <c0eb7e53-8dd5-4ef8-b56a-c79132f04acb@collabora.com>
Date: Sun, 15 Dec 2024 12:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: synopsys: Fix Copyright Writing Style of
 dw-hdmi-qp
To: Andy Yan <andyshrk@163.com>, mripard@kernel.org, neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
References: <20241215091911.3446653-1-andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20241215091911.3446653-1-andyshrk@163.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/24 11:19 AM, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The standard writing style should be: Co., Ltd.
> This fix the mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
> index 2115b8ef0bd6..74088e0d1d87 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * Copyright (C) Rockchip Electronics Co.Ltd
> + * Copyright (c) Rockchip Electronics Co., Ltd.

Nit: For consistency with your previous copyright fixes [1], the (c) part 
could be written in uppercase.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

[1] https://lore.kernel.org/lkml/20241214071333.3325308-1-andyshrk@163.com/

