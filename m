Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6C52F45D
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 22:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330D610F56C;
	Fri, 20 May 2022 20:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B5C10F4C6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 20:27:39 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jx22so4142689ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/W5Amkj7ZY4RSpu5Emv9DEEKFEY7HPKddkjE1BLIVo=;
 b=A97QoE/yONP/9WLQzD+5uujl9gs6LncY7kXoqdZTcS8CvSag2jhDf5peXlijQFFM89
 7xxU/K8CVotJr/JrPHhf3V1IVK5i6qclaIg2lVvyrBzNyCzxgCe5fp56nccGtG2ce6QZ
 by/Khy+qBy6khUe1wfEiGwRSeC3+QOAgMnb+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/W5Amkj7ZY4RSpu5Emv9DEEKFEY7HPKddkjE1BLIVo=;
 b=gLDCXrl7KcuYtqY8tk7AD3qWRJdp2yhySB50wqIl7CtsKhCIkNeK5h88alcJsqfPZP
 R9zfn0AAKrgKzNzDIHFbTzspByhI+yuSL3cRNzby2T0g1SAGiqjXY30Ek6qTGZjbXa0Q
 vkO+v0ihthaofkD9KV6LSeBKV3o+5+npOSKYGHeQaHF7hMKS9TKmSDObKzDSrefP9ejh
 mvQlsTllGrlRHdSV68IwBsCAj5Q5p5IXLmubja8p8HHqGAdCPGyANmy+mih9VrXm9ULy
 ezuVmGK18fzYUc0P7n7gXAVJvBubrf6ykiOy8X2M6X/KBvvENAaQJqICTd1Zig/Tm2DL
 wR7g==
X-Gm-Message-State: AOAM531dhiP/YP6tNk46+crnYhXuVm89UbZYG7S1jf9urNytm0j38Ass
 mp7SvKEVkVbZspw9QKdfbn4CiX8/5eHNcbXiGMs=
X-Google-Smtp-Source: ABdhPJyX7JvZuGo0YX1vvNsLVKpXhv1+7DDoFwEo2hdg9pIasGIJ7nnN5TSlZw+mBBNuGvdRoe/DdQ==
X-Received: by 2002:a17:906:58c3:b0:6fe:7d3:a6c3 with SMTP id
 e3-20020a17090658c300b006fe07d3a6c3mr9713443ejs.317.1653078457960; 
 Fri, 20 May 2022 13:27:37 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 7-20020a508e07000000b0042617ba63c3sm4906700edw.77.2022.05.20.13.27.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 13:27:35 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id k126so5105255wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:27:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr10021915wmb.29.1653078454242; Fri, 20
 May 2022 13:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
In-Reply-To: <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 May 2022 13:27:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui8c4EY3Yc8JaXfkhho0HxEiOVbHfA=Szt3U-KGe-4HA@mail.gmail.com>
Message-ID: <CAD=FV=Ui8c4EY3Yc8JaXfkhho0HxEiOVbHfA=Szt3U-KGe-4HA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Export symbol / kerneldoc fixes for DP AUX
 bus
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 12:30 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> While working on the DP AUX bus code I found a few small things that
> should be fixed. Namely the non-devm version of
> of_dp_aux_populate_ep_devices() was missing an export. There was also
> an extra blank line in a kerneldoc and a kerneldoc that incorrectly
> documented a return value. Fix these.
>
> Fixes: aeb33699fc2c ("drm: Introduce the DP AUX bus")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> None of these seem critical, so my plan is to land this in
> drm-misc-next and not drm-misc-fixes. This will avoid merge conflicts
> with future patches.
>
> Changes in v3:
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
>
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I landed this one in drm-misc-next:

39c28cdfb719 drm/dp: Export symbol / kerneldoc fixes for DP AUX bus

I chose "drm-misc-next" instead of a "fixes" branch because:
* It's not super urgent.
* I'm still hoping to get review for the other patches in this series
and it would be nice to avoid the conflicts when landing.

-Doug





>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index dccf3e2ea323..552f949cff59 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -66,7 +66,6 @@ static int dp_aux_ep_probe(struct device *dev)
>   * @dev: The device to remove.
>   *
>   * Calls through to the endpoint driver remove.
> - *
>   */
>  static void dp_aux_ep_remove(struct device *dev)
>  {
> @@ -120,8 +119,6 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
>  /**
>   * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
>   * @dev: The device to free.
> - *
> - * Return: 0 if no error or negative error code.
>   */
>  static void dp_aux_ep_dev_release(struct device *dev)
>  {
> @@ -256,6 +253,7 @@ int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
>
>  static void of_dp_aux_depopulate_ep_devices_void(void *data)
>  {
> --
> 2.36.0.550.gb090851708-goog
>
