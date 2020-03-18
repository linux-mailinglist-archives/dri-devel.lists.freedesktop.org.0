Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187A189F96
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD796E911;
	Wed, 18 Mar 2020 15:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7801A6E911
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:26:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h6so10596149wrs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ftZVbPmZ/Gi9bDEF3JRvvSJu2bSq6nHdWYvLq6k9FmI=;
 b=S9NtfciVJ5bawZR3kAnkkFc5MIDh22w8czXEdYUVH+Ml18A1q85ppVb3OT2Es6LnCX
 RrMY3G1JWRQdJWRAgeGtrH6hWiklfkmnHHuKTeApabEV5N3te/UN9ZX7meKjiIGTTlu4
 fxIxAuHu/4tkaqlGy4JwO1nOyyR5okFtQHMJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ftZVbPmZ/Gi9bDEF3JRvvSJu2bSq6nHdWYvLq6k9FmI=;
 b=SypcY0YHCZL8MsvWlmG3rvsW4PwkKx01KbMjNO9Efkyah0LNc6+VX4jPhd1xcEcCK3
 PhjrUd+1ENkyeChLJGmpX6l2VXYe3nBpjhDpUOtJsCssdOQmS5cnEUyfHVAAvrABnkOR
 nDcXYGnTev5NAQm/Ohw6b6sXhI2mZP0ykbY8fpzXGtJIeJ5JoVE5zQizsUfWjvmPsPrt
 QaQJaROCsvbXx8f2C1OizLlbqj+Hajsj0nRZMz8sIbSzToiQYKqi9DYEF1THYc5Po2XC
 szvbQRv9q4/rjZvPdhBtklUMnQM+0lrpMlbJdFb+kjElAkzwgzcdtlQKrhSf8qNoMdcP
 fnBg==
X-Gm-Message-State: ANhLgQ3QOmQqxdqNqJiAzFM3OOZ85wbJLkoJ+xMvfJ5QkHSyfOFr4Ram
 yz7JhBEVeZ7c9A6rAZ+n8h9gbw==
X-Google-Smtp-Source: ADFU+vs5nybEV7YJKuEwNm72dGWDm3pOnNTUz+tO14T/TeYa/T21zlqvpFrC0y8hF5JboKD7/evrKg==
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr5976823wrw.289.1584545191105; 
 Wed, 18 Mar 2020 08:26:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f207sm4543994wme.9.2020.03.18.08.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 08:26:29 -0700 (PDT)
Date: Wed, 18 Mar 2020 16:26:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make
 drm_vram_mm_debugfs_init() return 0
Message-ID: <20200318152627.GY2363188@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310133121.27913-11-wambui.karugax@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
> Since 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
> fails and should return void. Therefore, remove its use as the
> return value of drm_vram_mm_debugfs_init(), and have the function
> return 0 directly.
> 
> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
> introducing build issues and build breakage.
> 
> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 92a11bb42365..c8bcc8609650 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
>   */
>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
>  {
> -	int ret = 0;
> -
>  #if defined(CONFIG_DEBUG_FS)

Just noticed that this #if here is not needed, we already have a dummy
function for that case. Care to write a quick patch to remove it? On top
of this patch series here ofc, I'm in the processing of merging the entire
pile.

Thanks, Daniel
> -	ret = drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> -				       ARRAY_SIZE(drm_vram_mm_debugfs_list),
> -				       minor->debugfs_root, minor);
> +	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> +				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
> +				 minor->debugfs_root, minor);
>  #endif
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
