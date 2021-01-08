Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAAC2EF015
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 10:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3496E7EA;
	Fri,  8 Jan 2021 09:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE0C6E7DD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:53:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m5so8354845wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NVijV9kjYtZixSo+bMIMrjGnd5OL7MvE3LxxyANLHaQ=;
 b=AUfE3uPHl2xXpEaMLbzd9CCCxzbdF+KwM4KrPIVN5SgctfYHKUtpiQOABPZolL5D+w
 zdYS4tSaxWjwwqxE5syWIdUX89EecPohYTb+Xi1FO/q+gerEn4V99ND8drumtD+QLZJe
 jOhLv2qSXZ7yr70EhMiOZ/7wVeXrutx9a5nqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NVijV9kjYtZixSo+bMIMrjGnd5OL7MvE3LxxyANLHaQ=;
 b=TdhpWsf9yFNAcRuJccwxI7KDOvGtlmZdU8FCBlJFK8XimLGA0yQ+zSEoELHA1ttNLj
 t6eNRCEHWhxdaYKyRG5u/mGsrleEM0V1Tw6bVjahGbCzzAq1+99N1yxgxXv02n173Mtu
 XkG8vLBOa2ed6RKNzDCkXKtv5RmlOm2HQhG0RGqiuNpVqjpIGlJtrcg0bzUNe8Rsz99f
 5NT8nRRNR21y+qRHErNz+duzewP8qDLDZCON0XJXDiwZAhGMvG6xXpYbTEMDyX7mnkEE
 5Q7LARUkDF64OvtXbHL4oOtMn03FGN0d1NOvH0I1XzeQJpvHSE+9/d1DyDcRgb2qQInD
 b92Q==
X-Gm-Message-State: AOAM531ZoEMnrin4EBJ3qZazMLJ7CVvgmSMaDG/kmmuVCTI9F9tWTb8F
 T84o5xpQR5ZC23fTL/vcppLEoQ==
X-Google-Smtp-Source: ABdhPJx6N0leHlAbHgFIjjgNEvLchchHyHzuqzB+ZaQXeJ8UcVHbbrUEPbKkQZ+UjoqZxDVaNSZ6WA==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr2745272wrj.339.1610099595570; 
 Fri, 08 Jan 2021 01:53:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 125sm11914658wmc.27.2021.01.08.01.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 01:53:14 -0800 (PST)
Date: Fri, 8 Jan 2021 10:53:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <X/griCbZHfyYt6cH@phenom.ffwll.local>
References: <X/gnKs52t8xUuAlE@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/gnKs52t8xUuAlE@linux-uq9g>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 10:34:34AM +0100, Thomas Zimmermann wrote:
> Hi Dave and Daniel,
> =

> sorry for being a bit late. Here's this week's PR for drm-misc-fixes.

No worries, Dave's out anyway so this is all in time for me to do the pull
:-)

> =

> Best regards
> Thomas
> =

> drm-misc-fixes-2021-01-08:
> * dma-buf: fix a use-after-free
> * radeon: don't init the TTM page pool manually
> * ttm: unexport ttm_pool_{init,fini}()
> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a=
62:
> =

>   Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)
> =

> are available in the Git repository at:
> =

>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-01-=
08

Pulled, thanks.
-Daniel

> =

> for you to fetch changes up to a73858ef4d5e1d425e171f0f6a52864176a6a979:
> =

>   drm/ttm: unexport ttm_pool_init/fini (2021-01-07 14:25:43 +0100)
> =

> ----------------------------------------------------------------
> * dma-buf: fix a use-after-free
> * radeon: don't init the TTM page pool manually
> * ttm: unexport ttm_pool_{init,fini}()
> =

> ----------------------------------------------------------------
> Charan Teja Reddy (1):
>       dmabuf: fix use-after-free of dmabuf's file->f_inode
> =

> Christian K=F6nig (2):
>       drm/radeon: stop re-init the TTM page pool
>       drm/ttm: unexport ttm_pool_init/fini
> =

>  drivers/dma-buf/dma-buf.c           | 21 +++++++++++++++++----
>  drivers/gpu/drm/radeon/radeon_ttm.c |  3 ---
>  drivers/gpu/drm/ttm/ttm_pool.c      |  2 --
>  3 files changed, 17 insertions(+), 9 deletions(-)
> =

> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
