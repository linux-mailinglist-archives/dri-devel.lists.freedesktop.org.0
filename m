Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32058831B3A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 15:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A6710E023;
	Thu, 18 Jan 2024 14:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273810E023
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 14:18:11 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5573c79aac5so3137600a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 06:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705587430; x=1706192230; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wF4iSgPnjSMZjszaSvukPCbLZVGeSigi+LPrvVrYLe4=;
 b=HX51izeMpJXWEZMFkBwjR0AiYpeWh/QNa/++VEXtOHqYsFtGd7u3H1i8SLWQ08V03+
 2+hOijRpH2X9/VDpsr12RcBquDqAWt0gzNQIdW8woLOBJuuV5fCdfhu1FGgOBOtUUWrb
 ISJ50j5Glt9/5C0NJpMLPLfLIRwmi3qf2xppg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705587430; x=1706192230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wF4iSgPnjSMZjszaSvukPCbLZVGeSigi+LPrvVrYLe4=;
 b=UcYPmQCeNPH1SLnWsv3UqGBOV6pOwfIGrcCMGA/bLVRYP6jHLd0KTliEKnb68BMPGd
 o4Wz7sv+hJtWIYShU1EPIY8C0ZVMGa7TAfn9xB6p2XjBvpxRYh0b/gqxVaW6neinIZ50
 CWzkoB9ZoVBP2wAa1+w6jMPrKbETQ9zFUpHlWBIDrhWuNLAflrdddt6wEmU5eViHN/OK
 EOTMqtq8vVcLTFghMPNa7pxomXPVoaRo4KKpJB39w36WFiUEgHuKN+d+ZN/fClNpjCSo
 dnzH1KO5SNVZ8U+LsNTx0TsUNVi8tfn6P7JuDRDbiTzxV7rHVW5qQuUqD8dzmkWbItjX
 9k3g==
X-Gm-Message-State: AOJu0YxIRkUNmqLyCZfPb1jadYIyZ/OsckftVG5v4+D6i7Xx2O42toR1
 S+HA2F1D+56Ch9yU8dHs5qQXfuFarlmhjE/BffvNNNAMW4f4QPAxX8et2vA/DFg=
X-Google-Smtp-Source: AGHT+IGzoQ3SU0z6FJj+jiGUFdUlxq7hERImFqcv6wTD//GXqXOzJX5VAz8UujMWdI2SdWHXBbYftQ==
X-Received: by 2002:a17:906:48d2:b0:a2c:d6f7:341f with SMTP id
 d18-20020a17090648d200b00a2cd6f7341fmr1137561ejt.3.1705587430002; 
 Thu, 18 Jan 2024 06:17:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 lz3-20020a170906fb0300b00a26a061eef8sm9175423ejb.69.2024.01.18.06.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 06:17:09 -0800 (PST)
Date: Thu, 18 Jan 2024 15:17:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/3] video: Simplify Kconfig options
Message-ID: <Zaky46R04of5mPRX@phenom.ffwll.local>
References: <20240118090721.7995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118090721.7995-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 10:05:25AM +0100, Thomas Zimmermann wrote:
> Replace CONFIG_VIDEO_CMDLINE and CONFIG_VIDEO_NOMODESET by the single
> option CONFIG_VIDEO. Select the latter for DRM or fbdev. Both original
> options used to be selected in most cases, so this change simplifies
> the Kconfig rules.
> 
> Since commit ca6c080eef42 ("arch/parisc: Detect primary video device
> from device instance") architecture helpers for fbdev do not longer
> require fbdev in their implementation and could be used for non-fbdev
> code as well. Eventually guarding them with CONFIG_VIDEO will make
> them available to any subsystem.
> 
> v2:
> 	* support CONFIG_FB_CORE=m via IS_ENABLED() (kernel test robot)
> 
> Thomas Zimmermann (3):
>   video/cmdline: Introduce CONFIG_VIDEO for video= parameter
>   video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
>   video/nomodeset: Select nomodeset= parameter with CONFIG_VIDEO

On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
>  drivers/gpu/drm/Kconfig           |  3 +--
>  drivers/staging/sm750fb/Kconfig   |  1 -
>  drivers/video/Kconfig             |  5 +----
>  drivers/video/Makefile            |  3 +--
>  drivers/video/cmdline.c           |  2 ++
>  drivers/video/fbdev/Kconfig       | 37 -------------------------------
>  drivers/video/fbdev/core/Kconfig  |  2 +-
>  drivers/video/fbdev/core/fbmem.c  |  2 --
>  drivers/video/fbdev/geode/Kconfig |  3 ---
>  include/linux/fb.h                |  7 ------
>  include/video/cmdline.h           |  8 ++-----
>  11 files changed, 8 insertions(+), 65 deletions(-)
> 
> 
> base-commit: 05b317e8457c8e2bd1a797c9440ec07b7f341584
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
