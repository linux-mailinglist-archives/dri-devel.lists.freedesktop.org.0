Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46E67ECFD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 19:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BDF10E199;
	Fri, 27 Jan 2023 18:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817810E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 18:02:35 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id fi26so5434689edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2Q86j92pQ9q2wsMYUDefPiRAUR/rCfcZ3Y/y0U02v8=;
 b=CdDAORiYi7i8Rh5tx0vLXUjR6M49l7zi6wYWbctYHIiW9d5EDVrOzpXzWHxCvweTiM
 VsRE9D8RDYs6Gc07Ig3Gv2Goti67GkR3oaCqb91zHJ/hTw59daVB1+K0ukgP5parwwp9
 GZPYuqHvTRS3J1F85pOsxMJNi9unlWXkqxle8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2Q86j92pQ9q2wsMYUDefPiRAUR/rCfcZ3Y/y0U02v8=;
 b=1CealMWHDk/mARAcWVfBH5E61odFOsUZMSjhooy32cWrnMwXfto+dwqf8qsSV4/8Zs
 4UvJeyvhgXBKLMwLiUIvS3tJdPIzSooE2xXoOK3/3KQUASewy89z8CbeLBAOKEB1nhBS
 qpykN9/MYTZUPPa2WPgJ3S5UTI97Ukkc0KQ6JXH5CB3j8EKGM2eV+JHqYZ3cVYQoTdyU
 e5EAlIrN+WBfECZmYfZE/WN23WSw7+I/H29c7oS3jQ/RF2pawAOIxAfU1GSCKKAMCPCM
 zAItv/pItWB1TQ4M7cuypB9hSuurCbEOlRcwaGiu9GXG89avrXvZ91r3E+ol9dIuwnXs
 KEYg==
X-Gm-Message-State: AFqh2koTZCScl3v2qc/VYDntoJOjJnG9OmzkiIquHh4JPlEA2/+/aLgb
 5JgxBCjQ7WrBLnMMPqkJABj8y31pX1HrsTpncR0=
X-Google-Smtp-Source: AMrXdXvMhb2MJ1M/BG92t1gJ2l/+BiLOAdarMhh9Z24oq1+5lLge9tNxfO6uLIvSAgaWmDeu3QFhlg==
X-Received: by 2002:a05:6402:401b:b0:46f:d386:117d with SMTP id
 d27-20020a056402401b00b0046fd386117dmr50189682eda.33.1674842554159; 
 Fri, 27 Jan 2023 10:02:34 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 g5-20020a50ee05000000b004835bd8dfe5sm2691560eds.35.2023.01.27.10.02.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:02:31 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id q10so5700304wrm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:02:31 -0800 (PST)
X-Received: by 2002:a5d:6b51:0:b0:2bf:c5cc:e1d6 with SMTP id
 x17-20020a5d6b51000000b002bfc5cce1d6mr164739wrw.659.1674842551177; Fri, 27
 Jan 2023 10:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20230127165409.3512501-1-robdclark@gmail.com>
In-Reply-To: <20230127165409.3512501-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Jan 2023 10:02:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XL_KKB1vbU=gZVXYJzs4pLEnACysp0Q9DxhkHGTR9AgA@mail.gmail.com>
Message-ID: <CAD=FV=XL_KKB1vbU=gZVXYJzs4pLEnACysp0Q9DxhkHGTR9AgA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove unused GEM DMA header include
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 27, 2023 at 8:54 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> No longer needed since the removal of dependency on DMA helper.
>
> Fixes: 2ea8aec56bf1 ("drm/mediatek: Remove dependency on GEM DMA helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reported-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cd5b18ef7951..7e2fad8e8444 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -20,8 +20,8 @@
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
> -#include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>

It took me a little while to realize why you needed this extra
include. I guess DEFINE_DRM_GEM_FOPS implicitly refers to drm_ioctl().
Seems like really drm_gem.h ought to be the one including drm_ioctl.h,
but maybe there's a good reason why we don't do that?

-Doug
