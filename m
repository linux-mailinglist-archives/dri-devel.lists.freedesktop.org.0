Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7FB36DD51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E976E14D;
	Wed, 28 Apr 2021 16:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD8B6E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:45:31 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id d19so28502659qkk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rrj3UlBlJ91qMWs4IlTPGuw8X2L/oNKhyyRLTCh8fWE=;
 b=lf++hd/X6bQjKPClgG4WlPiLlx0SEPhHDHsu8w5ZyHb/uz+XduZNY+A0zluRDDQxjc
 L2fOBYoKdVMfh8CB6Dxs6hGNXdaO+l98nAg/bwFcadAUV1wPG3qXuF3ERBWSvSCt0Zrg
 UiDRc/2MnqpGGBT99Roig9k+c6ycmYY0gP8j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rrj3UlBlJ91qMWs4IlTPGuw8X2L/oNKhyyRLTCh8fWE=;
 b=n+m4aLb3m0N7xbiaCeDPJcpBNbLrQHf4GT6Cosy3mASRFSVuR/6hRgL4NVP3piutMt
 5WRp6B52bJqv+s47dfXO6zQFQI64bt8OfJPFOFOQd0jl5dXrafCufsg2XVqsOnBgvPd2
 OE4SJMAgRLM3iICFP850hsMt2jj/XecJvdITzXBxGe4AUMMCmB+AxNNmjFWDF3XFr4nb
 I4S5tQVIalEyMwr6D1Yrbbg1jBlERkek4NWnfMOd9/DWJbLfqTRmdJvKL5hCXRQ0/xkw
 y8LZwOsqY++jb/blToyns/RpBkUme7rnG6tLmzTOEbH1OAgCU+9aNJtf9rNvHL/Flpry
 Zwwg==
X-Gm-Message-State: AOAM5306y3gHx78FwTKLQpsOT17b5ScF9X9zxDmywG4jasgcNaxJA7R+
 nvie7+n7qvGvq9vEqArFr5aj+6K427a8Fw==
X-Google-Smtp-Source: ABdhPJzufiaq5uB3C0Qpl/ehW/BSZXMetzL0e1FefY0VBqAhT2xVjuLtcjtzJGPHnZ9golFHjk3zMA==
X-Received: by 2002:a37:70c6:: with SMTP id
 l189mr29616321qkc.277.1619628330074; 
 Wed, 28 Apr 2021 09:45:30 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id x19sm161049qkx.107.2021.04.28.09.45.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:45:28 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id i4so37157377ybe.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:45:26 -0700 (PDT)
X-Received: by 2002:a25:7157:: with SMTP id m84mr42521872ybc.175.1619628324558; 
 Wed, 28 Apr 2021 09:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
In-Reply-To: <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 28 Apr 2021 12:44:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLqDgqhXH8pUZqfhKCZk68SfzLf76Z4au3g83=Uw_8z2Q@mail.gmail.com>
Message-ID: <CAOw6vbLqDgqhXH8pUZqfhKCZk68SfzLf76Z4au3g83=Uw_8z2Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] drm/panel: panel-simple: Power the panel when
 reading the EDID
To: Douglas Anderson <dianders@chromium.org>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> I don't believe that it ever makes sense to read the EDID when a panel
> is not powered and the powering on of the panel is the job of
> prepare(). Let's make sure that this happens before we try to read the
> EDID. We use the pm_runtime functions directly rather than directly
> calling the normal prepare() function because the pm_runtime functions
> are definitely refcounted whereas it's less clear if the prepare() one
> is.
>
> NOTE: I'm not 100% sure how EDID reading was working for folks in the
> past, but I can only assume that it was failing on the initial attempt
> and then working only later. This patch, presumably, will fix that. If
> some panel out there really can read the EDID without powering up and
> it's a big advantage to preserve the old behavior we can add a
> per-panel flag. It appears that providing the DDC bus to the panel in
> the past was somewhat uncommon in any case.
>

Maybe some combination of drivers caching the EDID for panels while
they're already powered and overly broad pm runtime references?

At any rate, this makes sense to me,

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4de33c929a59..a12dfe8b8d90 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>
>         /* probe EDID if a DDC bus is available */
>         if (p->ddc) {
> -               struct edid *edid = drm_get_edid(connector, p->ddc);
> +               struct edid *edid;
>
> +               pm_runtime_get_sync(panel->dev);
> +
> +               edid = drm_get_edid(connector, p->ddc);
>                 if (edid) {
>                         num += drm_add_edid_modes(connector, edid);
>                         kfree(edid);
>                 }
> +
> +               pm_runtime_mark_last_busy(panel->dev);
> +               pm_runtime_put_autosuspend(panel->dev);
>         }
>
>         /* add hard-coded panel modes */
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
