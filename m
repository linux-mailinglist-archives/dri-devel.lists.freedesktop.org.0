Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F8323064F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05B789B7D;
	Tue, 28 Jul 2020 09:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A0F89B7D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:18:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z18so13985209wrm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G2DFqM7ke87WnWIe0xXphJi8abxppLjx74SlgMI0KSo=;
 b=e78L6Hpw8qV3cfih11HkD62Qxpm7qJHxgKeV9Pm+4D+6SlMP0BEmWMuGWyXsa9f8fz
 yRa+Bf6Mw5UexwHsBIiN0eCCELH+PCrhqnH/h62Yd/n3TdvrQU1rKMDkyx3NXvjJ5r+Q
 HBlusUTLO2Y0VqENKPGv6Xw3EV9TKNSNuIvxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G2DFqM7ke87WnWIe0xXphJi8abxppLjx74SlgMI0KSo=;
 b=alOMHxu/y1HbtUIHM10uNjhxYKPwRhVR976QRK4xxPsutS0741WNWbYCifZmMcNBxv
 FoJKGm9PilHNfHNav8wCsj/tjzBfTJa9AzcVqixD3gf/NCCjaqcHLUzjHO632zFyL/UV
 diPYxp/bGjP7Cxe+FGhISBe5YrHFqx7GUYPouenyW2qjzCVAn2XpS86pexobgANzNFfl
 hhmNAC4zWvEoOSZAgZ7X+1NdVB56sXedhclX4GYLp6BgHeK8YygkrkdA+LZamCvy3Cye
 DpN4eNQM+zIEpOXtgBQmmI9taNjWeI1Lh3zHjPdpic9RpmhE6BIh/xioPzHD1DQOKFin
 +Mtw==
X-Gm-Message-State: AOAM533GtbQ58iaH37XCZAkrHjIInonnFfx2akqtX8KoGNpyvJEOfKgi
 8fbWGsmrKyyo9KAEnT/8kUildw==
X-Google-Smtp-Source: ABdhPJxl/lb2e9m32NkabTzJn4jqZ3aIQdZ91FFooIETxNF7EaiPqT0OaSA66biibFuOt929ZnvISQ==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr16906796wrv.217.1595927908543; 
 Tue, 28 Jul 2020 02:18:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o7sm14822622wrv.50.2020.07.28.02.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:18:28 -0700 (PDT)
Date: Tue, 28 Jul 2020 11:18:26 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 12/13] drm/ast: Manage release of firmware backup memory
Message-ID: <20200728091826.GC6419@phenom.ffwll.local>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-13-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 09:44:24AM +0200, Thomas Zimmermann wrote:
> The ast driver keeps a backup copy of the DP501 encoder's firmware. This
> patch adds managed release of the allocated memory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

We can't really do anything with the firmware after the device is gone, so
I think this is one of the very rare exceptions where devm_kzalloc is the
right thing to do! Totally minor nit though, since either way it gets
cleaned up. But I think conceptually cleaner.
-Daniel
> ---
>  drivers/gpu/drm/ast/ast_main.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index e3b7748335a3..67e20727d82d 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_managed.h>
>  
>  #include "ast_drv.h"
>  
> @@ -231,11 +232,11 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>  			ast->tx_chip_type = AST_TX_SIL164;
>  			break;
>  		case 0x08:
> -			ast->dp501_fw_addr = kzalloc(32*1024, GFP_KERNEL);
> +			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
>  			if (ast->dp501_fw_addr) {
>  				/* backup firmware */
>  				if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024)) {
> -					kfree(ast->dp501_fw_addr);
> +					drmm_kfree(dev, ast->dp501_fw_addr);
>  					ast->dp501_fw_addr = NULL;
>  				}
>  			}
> @@ -444,6 +445,4 @@ void ast_device_destroy(struct ast_private *ast)
>  {
>  	/* enable standard VGA decode */
>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
> -
> -	kfree(ast->dp501_fw_addr);
>  }
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
