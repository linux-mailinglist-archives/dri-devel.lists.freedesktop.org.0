Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4D6ECB1C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 13:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ED010E499;
	Mon, 24 Apr 2023 11:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084FA10E499
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:15:15 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q4jGW3DfFzDqPd
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1682334915; bh=eXZhgxZ3gSLiN1Dk3zBmzyKLQtCuDkHTvvCzaNHb+/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=s25KcURk6oxbsVdordzuf0RVYDuCs0MCM+JwtkUFnzlsPjh5wBes8ERVyhHbOu0FR
 zPOObm8HX9/fDuTxE3WGNoBZRZhgQ6VrYaGKtqehCrpZi2MZxXLtnxejCgYuD+IjCr
 UpJVmW10GpNoOXMD1ES3We/T69/I09uMKRxnMzm8=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Q4jGV2zYkz9tJt;
 Mon, 24 Apr 2023 11:15:14 +0000 (UTC)
X-Riseup-User-ID: 97066700368D72C7421B5CE4B917102B984FF54652C96645EE0B34F119C783BA
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q4jGD14LszFqLB;
 Mon, 24 Apr 2023 11:14:59 +0000 (UTC)
Message-ID: <eecbe65c-25d9-1864-dbab-97a626a19b9f@riseup.net>
Date: Mon, 24 Apr 2023 08:14:56 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] drm/sti: Drop of_gpio header
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
References: <20220812205746.609107-1-mairacanal@riseup.net>
 <20220812205746.609107-5-mairacanal@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-5-mairacanal@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Alain Volmat <alain.volmat@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/12/22 17:57, Maíra Canal wrote:
> This driver includes the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop this include.
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>

Applied to drm/drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/sti/sti_dvo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index b6ee8a82e656..0fc7710b054a 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -8,7 +8,7 @@
>   #include <linux/component.h>
>   #include <linux/debugfs.h>
>   #include <linux/module.h>
> -#include <linux/of_gpio.h>
> +#include <linux/of.h>
>   #include <linux/platform_device.h>
>   
>   #include <drm/drm_atomic_helper.h>
