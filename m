Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21585356D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2A10E84D;
	Tue, 13 Feb 2024 15:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EmRORnYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43610E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 15:58:11 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so3225365276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707839890; x=1708444690; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbboQjtqJl0kRKVmT9324agg2n3TuIJm0CfegMAaP2Q=;
 b=EmRORnYqgNYO0bPNNgMLf4hemT43t4nO9oMAaDavvWf3I30x25QBNqtvbDhV2rTBdJ
 g8ERPF9wPKzhKE1OiH/jrP3oFzLK/KB+IuA63neFRmy6lcbdoT8d8YhV7D8oujx/enUI
 B+YyBwYLrLQoQo2y/lraBTUPrkr2L5lXeOFfTdiB2Tbhqd3d+0iA6n/O1n79UfzfcTMa
 e0DXAYIiXy+3OIR728NaXB0THRVJTDQ/wc/+KvrYTsY7HrCOFqyg14hRGyeGfWkNa7P5
 i4fXP40onaUDmslFEZfeuoEsjBy9Wwq7b9W1l9/Sb60jTI7eiKLYXj0iaN8cxy6rk6bJ
 if6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839890; x=1708444690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbboQjtqJl0kRKVmT9324agg2n3TuIJm0CfegMAaP2Q=;
 b=liHjRjwYi0GRHud5u5owzz2CS8+AwZnxgOMqSbnaP/LyaJVzFe90LftlB8VzQOZ4LC
 pHA1sHu2VxjnbX3MlOVcwjJM8mF0Ml7z7XLlIFbaOpvzkd+DTk7gwEmsmh0Oh2S/QP1y
 e3nRQce92JwgrIY+/qwcCVh9gVttSzDjpqQtnninQfchDdnWQAlho59EGwsJUjJVs56w
 4nvQQnSYJDj4S2bgw7UMrj67RGLH+PJlXUwf5phCGSx93cPVnaLy/YWVGypLGyzutxfo
 sfPBfblUaH9BP4DhYXvXErKJSUwoy2RTjZQEyeVj2fNmEg2ETWagjDsx9eaTGPgqONYK
 t6ug==
X-Gm-Message-State: AOJu0YzGhX0it78Y/m8M2IPgtsLAWdZ+TlCU0gkJX+EBbyPxjy8Mmw4H
 eYh0glMyKZ0kYJl0oS8rkcX2W4tWLc+yvyZnSAXngANOqSItS6zR+qHDJRnIUUdayeCFlaf8zMd
 7Yp3tNlrqglo/McsWh+v55P/oH5N4UqnLdYz6Tg==
X-Google-Smtp-Source: AGHT+IFmnTkXNu4JoaaOCNlItjkMQBcNvs9jrCwoCXuPdjvF/qGzXg3CtaGd1xcEuKgEnfJ2PjsPUbYu9BbM9Oi6unI=
X-Received: by 2002:a5b:c4a:0:b0:dc6:e75d:d828 with SMTP id
 d10-20020a5b0c4a000000b00dc6e75dd828mr6861944ybr.18.1707839890663; Tue, 13
 Feb 2024 07:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20240212215534.190682-1-robdclark@gmail.com>
 <CAA8EJpofXjwFG3NhwSJQadoe6eR0vkX2Y4knC55b7qGn46UA_g@mail.gmail.com>
In-Reply-To: <CAA8EJpofXjwFG3NhwSJQadoe6eR0vkX2Y4knC55b7qGn46UA_g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 17:57:59 +0200
Message-ID: <CAA8EJppJhfbctBE_mdsPikpsLQ-6o2oXGO7bFpUXD8q3YxSSeg@mail.gmail.com>
Subject: Re: [PATCH] drm/crtc: fix uninitialized variable use even harder
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Feb 2024 at 15:50, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 12 Feb 2024 at 23:55, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > DRM_MODESET_LOCK_ALL_BEGIN() has a hidden trap-door (aka retry loop),
> > which means we can't rely too much on variable initializers.
> >
> > Fixes: 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable use")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > I have mixed feelings about DRM_MODESET_LOCK_ALL_BEGIN() (and friends)
> > magic.  On one hand it simplifies the deadlock/back dance.  OTOH it
> > conceals a nasty sharp edge.  Maybe it is better to have the complicated
> > restart path a bit more explicit, like it was originally.
> >
> >  drivers/gpu/drm/drm_crtc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index cb90e70d85e8..65f9f66933bb 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -904,6 +904,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
> >         connector_set = NULL;
> >         fb = NULL;
> >         mode = NULL;
> > +       num_connectors = 0;
>
> Nit: I think we should move all this next to the
> DRM_MODESET_LOCK_ALL_BEGIN() and drop initialisation from the prologue
> of the function, but it's definitely a separate and more intrusive
> story.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After running this through CI:

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #sc7180, sdm845

> >         DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
