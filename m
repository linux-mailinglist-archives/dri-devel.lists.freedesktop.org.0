Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DCC2C17C9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7486E0DD;
	Mon, 23 Nov 2020 21:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FB96E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:42:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BE4AD20051;
 Mon, 23 Nov 2020 22:42:09 +0100 (CET)
Date: Mon, 23 Nov 2020 22:42:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] via/via_irq: use __func__ to replace string function name
Message-ID: <20201123214208.GB675342@ravnborg.org>
References: <20201119072957.108941-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119072957.108941-1-bernard@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=1WtWmnkvAAAA:8 a=iPqO3eFckTJRmb16J7wA:9
 a=CjuIK1q_8ugA:10 a=-_UHfarfsM-RsASml2Jt:22
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bernard.

On Wed, Nov 18, 2020 at 11:29:55PM -0800, Bernard Zhao wrote:
> This change also fix checkpatch.pl warning:
> WARNING: Prefer using '"%s...", __func__' to using
> 'via_driver_irq_postinstall', this function's name, in a string
> +	DRM_DEBUG("via_driver_irq_postinstall\n");
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/via/via_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/via/via_irq.c b/drivers/gpu/drm/via/via_irq.c
> index 24cc445169e2..56ce5d4ee24a 100644
> --- a/drivers/gpu/drm/via/via_irq.c
> +++ b/drivers/gpu/drm/via/via_irq.c
> @@ -308,7 +308,7 @@ int via_driver_irq_postinstall(struct drm_device *dev)
>  	drm_via_private_t *dev_priv = (drm_via_private_t *) dev->dev_private;
>  	u32 status;
>  
> -	DRM_DEBUG("via_driver_irq_postinstall\n");
> +	DRM_DEBUG("fun: %s\n", __func__);

DRM_DEBUG() will print the name of the calling function so the use of
__func__ here is not relevant.


For this old driver we should try to limit patches to bug fixing and
infrastructure updates.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
