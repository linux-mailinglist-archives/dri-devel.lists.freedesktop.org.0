Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8323064E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044306E176;
	Tue, 28 Jul 2020 09:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302786E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:17:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z18so13981541wrm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z1bQcw7LWepRbq1VziRZUacP09JIO1lYAgjefNmd5v4=;
 b=JUDil0LKrxlfGDS47OxFa/RJFKfyk7ay/fEewtA8ZRYyQR1SRQTtQub9Y8Tntv5WFk
 RBM90sR8YP9Y0IHluToIvn1/Tmjv78y0RhkMzkAz+MBXrYm4Qo9PYhxSHm1kqTgS6+fM
 WH+5VeTYbaKu+8FRncoYqVQV4FrDAaN9Ktpus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z1bQcw7LWepRbq1VziRZUacP09JIO1lYAgjefNmd5v4=;
 b=hsPUnkgtfmHoz924coxmemILB8JoTyOInSQrjcBUoC1hhoA1fiFicGa5JOHX5YzEc6
 4niX0fZlUISjZV1ablOfXKfg/5x18X9MztlnAEJFw60V78ERnRaQdkLzfOCaqbecYPNk
 rinJyVEoU/+NiXRdsgAQp3VwPlQMXXq6KBRifiabenmbjuKMwoA6tzP1djFC0l+KySqX
 t3LgY0b5+tL27OpEuMNEKbR9utedxSTJ3p8ftPDHl78J0DM8WTvDEDqbrW4ILhrOy6Ad
 QznTQjQfZIe6XCZqG8wnDcaLgN2aq7kcFTZiJiiYwce8xFfYKZJeNUTHDpVYx7sw8vwi
 MNug==
X-Gm-Message-State: AOAM531TadkRfN2T4axd/QPBdu4sEmz/ctqiaYdD8TiFq/wc+smFhkjO
 Q0cfaSS/PTCMv/OgvwHuVep+qg==
X-Google-Smtp-Source: ABdhPJyypmIgD5gqRoB48QI0E6ODDLm9eBvjuzcO8y7wzlkpLsbhTtyX6pqZ1w/LSpi3DrM3DxdEkA==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr15972521wrv.120.1595927833856; 
 Tue, 28 Jul 2020 02:17:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c10sm16756735wro.84.2020.07.28.02.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:17:13 -0700 (PDT)
Date: Tue, 28 Jul 2020 11:17:11 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 11/13] drm/ast: Managed release of ast firmware
Message-ID: <20200728091711.GB6419@phenom.ffwll.local>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-12-tzimmermann@suse.de>
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

On Tue, Jul 28, 2020 at 09:44:23AM +0200, Thomas Zimmermann wrote:
> The ast driver loads firmware for the DP501 display encoder. The
> patch replaces the removal code with a managed release function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm a devm_request_firmware which does exactly this would be nice I think.
Maybe as a follow-up refactor?
-Daniel

> ---
>  drivers/gpu/drm/ast/ast_dp501.c | 23 ++++++++++++++---------
>  drivers/gpu/drm/ast/ast_drv.h   |  1 -
>  drivers/gpu/drm/ast/ast_main.c  |  3 ---
>  3 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 4b85a504825a..88121c0e0d05 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -8,11 +8,24 @@
>  
>  MODULE_FIRMWARE("ast_dp501_fw.bin");
>  
> +static void ast_release_firmware(void *data)
> +{
> +	struct ast_private *ast = data;
> +
> +	release_firmware(ast->dp501_fw);
> +	ast->dp501_fw = NULL;
> +}
> +
>  static int ast_load_dp501_microcode(struct drm_device *dev)
>  {
>  	struct ast_private *ast = to_ast_private(dev);
> +	int ret;
> +
> +	ret = request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
> +	if (ret)
> +		return ret;
>  
> -	return request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
> +	return devm_add_action_or_reset(dev->dev, ast_release_firmware, ast);
>  }
>  
>  static void send_ack(struct ast_private *ast)
> @@ -435,11 +448,3 @@ void ast_init_3rdtx(struct drm_device *dev)
>  		}
>  	}
>  }
> -
> -void ast_release_firmware(struct drm_device *dev)
> -{
> -	struct ast_private *ast = to_ast_private(dev);
> -
> -	release_firmware(ast->dp501_fw);
> -	ast->dp501_fw = NULL;
> -}
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 86c9a7ac712b..02908d005b99 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -312,7 +312,6 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
>  bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
>  u8 ast_get_dp501_max_clk(struct drm_device *dev);
>  void ast_init_3rdtx(struct drm_device *dev);
> -void ast_release_firmware(struct drm_device *dev);
>  
>  /* ast_cursor.c */
>  int ast_cursor_init(struct ast_private *ast);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 792fb7f616ec..e3b7748335a3 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -442,11 +442,8 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
>  
>  void ast_device_destroy(struct ast_private *ast)
>  {
> -	struct drm_device *dev = &ast->base;
> -
>  	/* enable standard VGA decode */
>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
>  
> -	ast_release_firmware(dev);
>  	kfree(ast->dp501_fw_addr);
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
