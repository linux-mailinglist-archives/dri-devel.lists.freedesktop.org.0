Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B318BF38
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 19:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB46EA4F;
	Thu, 19 Mar 2020 18:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1736EA4F;
 Thu, 19 Mar 2020 18:19:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b23so3954947edx.4;
 Thu, 19 Mar 2020 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUnLPRFaXYEyBMAu2KerTyrQvIYIc8Adcw0gQEvJv1g=;
 b=lgXZcIvA+kWlIoPJziys10SY+bpa92mglfzT+MBUMHhjvOu9zbr2UUe9GFdhoqCKEx
 B2NIDVBcMACw4/h86uBHZHdkFxDKlqEO3RbQHlJdpwsvDLoLyM8g0h35hwOW0kHwRTZb
 b+b40DXCqdQgTO6FtOInYhhcpCumJvr6veMoQTtS6fqGKXuIECoUzAGrPeZPke+MO8mp
 dWjl5fe5YasL/G+bdIQlOTbWyUCjDY1j2AUthyCd7vClmH+ulbx8MjbtSHCV73KXo+FK
 46rgB5WN9EfrklB/kJOGc+zwo6/WKRKM7nyRAOVOIWkNQd8JsfRECJmTIBfutDRonDsD
 aIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUnLPRFaXYEyBMAu2KerTyrQvIYIc8Adcw0gQEvJv1g=;
 b=dUFc4Z/1bJmoW1NCMx6PgrpAiPYfd37ai0RmBrs/BzpnUVlGcBVXbW9LQAQ8C+OEXE
 hWTPGImmbu0j8zQRW0JPGCAd3BBQyM+IbcYxJXWLEfUbTfOn2SSezzQhQqIBLzKhQczy
 FTAhOU0s1E0dfTcjvIpcABDiOFn5+2YjHxHHxr1+PIpv28YCytZr0GJxqJpGVzJfexvs
 3i5wqmso6XjsrM/IOqwRSi2TkZCmPKlozavmMKCpJbuFExFvauldjK7e9HT1B+k0UTO/
 49xEhpzWCY6F876WLd53fovYFhd6oWLIcrKMtmTg9FxihfHvBXi9c9j1iV7OyH0nh8jj
 y9+A==
X-Gm-Message-State: ANhLgQ1vVYYOwcw/bKtcwKKZD3JKost6t0Ra+JmOeafU1ejLdjJaxEse
 aqThq4m9x5UDH9wQrxvFGGDFDIRwj+XXJFGAn6w4ZY5bjpY=
X-Google-Smtp-Source: ADFU+vud33ZNOWzEZL7qH7qtQzJyc7BdVgN4hxJA6xo79YTL1rHt/UMu58hsnUr03cPz9Jge8sTfUNaovlby3KRdpbE=
X-Received: by 2002:a05:6402:8ca:: with SMTP id
 d10mr4157650edz.362.1584641965480; 
 Thu, 19 Mar 2020 11:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200319043741.3338842-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200319043741.3338842-1-bjorn.andersson@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 19 Mar 2020 11:19:15 -0700
Message-ID: <CAF6AEGtvSZOp48hyrBUzqQLV6+twtuy6k6MLimz6fhC-dqWEVA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't attempt to attach HDMI bridge twice
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 9:39 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> With the introduction of '3ef2f119bd3e ("drm/msm: Use
> drm_attach_bridge() to attach a bridge to an encoder")' the HDMI bridge
> is attached both in msm_hdmi_bridge_init() and later in
> msm_hdmi_modeset_init().
>
> The second attempt fails as the bridge is already attached to the
> encoder and the whole process is aborted.
>
> So instead make msm_hdmi_bridge_init() just initialize the hdmi_bridge
> object and let msm_hdmi_modeset_init() attach it later.
>
> Fixes: 3ef2f119bd3e ("drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks, I think this should also be solved by:

https://patchwork.freedesktop.org/patch/357331/?series=74611&rev=1

BR,
-R

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 6e380db9287b..0e103ee1b730 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -271,31 +271,18 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>  /* initialize bridge */
>  struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
>  {
> -       struct drm_bridge *bridge = NULL;
>         struct hdmi_bridge *hdmi_bridge;
> -       int ret;
> +       struct drm_bridge *bridge;
>
>         hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
>                         sizeof(*hdmi_bridge), GFP_KERNEL);
> -       if (!hdmi_bridge) {
> -               ret = -ENOMEM;
> -               goto fail;
> -       }
> +       if (!hdmi_bridge)
> +               return ERR_PTR(-ENOMEM);
>
>         hdmi_bridge->hdmi = hdmi;
>
>         bridge = &hdmi_bridge->base;
>         bridge->funcs = &msm_hdmi_bridge_funcs;
>
> -       ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 0);
> -       if (ret)
> -               goto fail;
> -
>         return bridge;
> -
> -fail:
> -       if (bridge)
> -               msm_hdmi_bridge_destroy(bridge);
> -
> -       return ERR_PTR(ret);
>  }
> --
> 2.24.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
