Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337AF1503A2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 10:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339366EB90;
	Mon,  3 Feb 2020 09:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCF46EB90
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 09:53:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so16142361wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mU0Lnmp2BUv1IbNrFMzbXTUqP6Vq5CFka5vaTOzUEe8=;
 b=Jejw8ilOL650CKOaY1c2nhFBBNQ4ORnYqf/eKHetKLCIiTcGFkey2rE4oVdg3XC6hV
 atSXhXIbAvx8WeENXgedFX0VQXzoTX0ZeghYtUf0w3SQX3xWXzfZxjSzMHPrtjOm9b1F
 GqpTmikr8Iygb85kaMFjJ2z2EoR0vutSkJ2/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mU0Lnmp2BUv1IbNrFMzbXTUqP6Vq5CFka5vaTOzUEe8=;
 b=MIiMGnAwCLFZEtJP5RE7uxJr50iuSOM4nurNYQ4Rx93ae9LRULWu0MUhRmKOodpVcR
 /oasmEfSTruy+Sn/lEliiDaAo6Fh+sYbjSKxBJKVGbrHoyATUnLiU2KSEh9Hg91ZH0uq
 cUNUdxZvURDCj8ESjeNp2kB2rM3ULFf8fZ/BP5d5Axt3X4NPRH+kvMXm2JfSmB/DgP34
 mO3nlU8JUjysOfRs6IS84sxx8+HeHIhI4m7UvvUxlpTysZiaC1y2oLnvq1nauxCzyssJ
 QpSdR2or75XXVnH4XvkKjmtYmI6wyvkD/oQH7eUxoex+s55yQc508mWuRZ0zqbkwTOCy
 RANw==
X-Gm-Message-State: APjAAAX4a7ihOEGLCYiNhP0LDUQ+r3Hy0D1q7UTGQce8b4CIOMR9j828
 bOnuC7LwWSz8gaROFqX+RHhZyQMuLNdFOQ==
X-Google-Smtp-Source: APXvYqyf7uLsgHB3Yp7q1tn+jEFeVIUauZtEh/VAKai6MXtkZS0ZUElqc+mxSB/g7pijFiUxvNwTJw==
X-Received: by 2002:a1c:488a:: with SMTP id
 v132mr28598702wma.153.1580723614331; 
 Mon, 03 Feb 2020 01:53:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s65sm23877577wmf.48.2020.02.03.01.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 01:53:33 -0800 (PST)
Date: Mon, 3 Feb 2020 10:53:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] drm/vboxvideo: Implement struct
 drm_mode_config_funcs.mode_valid
Message-ID: <20200203095331.GV43062@phenom.ffwll.local>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201122744.27165-5-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 01, 2020 at 01:27:44PM +0100, Thomas Zimmermann wrote:
> The implementation of struct drm_mode_config_funcs.mode_valid verifies
> that enough video memory is available for a given display mode.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 8b7f005c4d20..0883a435e62b 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -826,6 +826,7 @@ static int vbox_connector_init(struct drm_device *dev,
>  
>  static const struct drm_mode_config_funcs vbox_mode_funcs = {
>  	.fb_create = drm_gem_fb_create_with_dirty,
> +	.mode_valid = drm_vram_helper_mode_valid,
>  	.atomic_check = drm_atomic_helper_check,
>  	.atomic_commit = drm_atomic_helper_commit,
>  };
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
