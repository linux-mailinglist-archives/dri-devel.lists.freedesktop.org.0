Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A24346AC8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 22:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76D06E140;
	Tue, 23 Mar 2021 21:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6606E140
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 21:08:55 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 94so16102901qtc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQwheX+ZOdsLRvA7XPASIVaHFFt/8Y47I6o+aENus34=;
 b=FxoCgZ66CW4DEmPHCY36UziylrUzDCKhrdi+/rBZqANTFV3kACH/P/9Cm35U6ZrXt7
 lebhYaqTec4eHBmwZucO69qCPAaky9irljkPvIZtE4z+NPF/8o/Ua2IsC7yP+cgyJysE
 ibZdoKOJCd3A1z5FR5scNPjOAOZ/gBAEqp50k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQwheX+ZOdsLRvA7XPASIVaHFFt/8Y47I6o+aENus34=;
 b=ijBjuQoTRVynXAcFZWDj6UKRhIQOu0oMWk2qGg7XWq9iT/4fWFcHV1k7X5ar/VcOtN
 ock3DQX9dgjLC3D8uZQzZQZgxi43zKvCNC1JaXT8LX3i/y90LyQC/+MOtWJVGDvhmt5a
 pRLDziR0p322nUp8djObOV8zhvIDigzK+EfVm++XARyE5z8Ta1PI7tOprXs1LveH2HiD
 0SI498F9yn0CiMnwAIGF68jztpv80VNYop45zGkNDuk5d01dMG55kVOoxY59GVKKykSM
 HOhBFuJH8+SSvLUAAEpbq/RE1lUxfEsdypmA82sXqSSdwFI87PfogRouWhHzYwCPUueb
 rHNA==
X-Gm-Message-State: AOAM532x7LrEvZIXMDbEtOfexNVGm+HcOT9zIn3+NbT0mmzpKWAZA+cR
 dh93C+f6SvaL/yO7w0sUrpNPt/cpwHhs1g==
X-Google-Smtp-Source: ABdhPJweGrGMtuaq40RYF5UK/qNu2YmvuWNu/P4zv7Vf6tMcbQ0xQtlvllLLt/GTxSYWKajuym4eGg==
X-Received: by 2002:ac8:464c:: with SMTP id f12mr258536qto.232.1616533734128; 
 Tue, 23 Mar 2021 14:08:54 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id 17sm96968qky.7.2021.03.23.14.08.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 14:08:53 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i9so11829303ybp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:08:53 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr270728ybi.276.1616533733297; 
 Tue, 23 Mar 2021 14:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Mar 2021 14:08:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
Message-ID: <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The AUX adapter registered in probe() need to be unregistered in
> remove(). Do so.
>
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index da78a12e58b5..c45420a50e73 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>                 return -EINVAL;
>
>         kfree(pdata->edid);
> +
> +       drm_dp_aux_unregister(&pdata->aux);
> +
>         ti_sn_debugfs_remove(pdata);
>
>         of_node_put(pdata->host_node);

Good catch. One question, though. I know DRM sometimes has different
conventions than the rest of the kernel, but I always look for the
"remove" to be backwards of probe. That means that your code (and
probably most of the remove function) should come _after_ the
drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
thing in probe then drm_bridge_remove() should be the first thing in
remove?


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
