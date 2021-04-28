Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54236E035
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 22:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA636EC2F;
	Wed, 28 Apr 2021 20:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894D76EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 20:21:33 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id c3so2619056ils.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3FlfJuCO/i0lHXz9Yi8JuX0LHEp/FCSt5EvXf/XQhbw=;
 b=Twe/v+kPHslIBdnujIpFoTmjqKiXz3Qw86igYBt6JKw9MRVlLASnJezyH+2HX0D5/y
 1S+ZoIf/DhA5jzqOmWyOdNWhi372TPnKzo2U1odOVbpIh9peetD1cWRUTXNOuHiur8RF
 CTAf8QNFFktBK+T6i7jMTFhiGslZ/9XyFimZ73V5HSutx9tH2bKP85o42syoYOj9MinU
 N7vUUXLASROmijnkzZEYDKhs1CIZcc88YyxWOpDVZ46m4dn3JJAqyEJPLohCA9ebVbju
 OYL1e2aCMN1Gi1lP9HTfavKkJuXnOqd3N6Tdd5CHP0iPUiI120LMpSdC1aXMgJjhs6dD
 oW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3FlfJuCO/i0lHXz9Yi8JuX0LHEp/FCSt5EvXf/XQhbw=;
 b=PngA26GmydaOjQbFF6KNcV8ixds1Do1696niX/7ykw7tW9RNVyTHXMwPZ4dDQhsn28
 aVgO9Xelf0RlwWehfAmc7Y6gpIejQIerL5drKkbQt3sGvPi/UrkSrn92t6J9T7n0Df3V
 oIKbIgQTAl6lwAF9o+weAMQf6d8glfg9Ph/Kheca7jA1/h0pKu3jsD+1tV1jQOHfJee9
 431BzaN42tKmDr2QQtfTgQXw+DIb6WrlvWRNS9YKVF4Ap9tLzxa2WE+GyoDYVghemP+l
 1xtmrYaX3bAdA6/wmjhLu1BB633unk4R5TzC6usEpXwuliHw2YTWq+Q85EevA5nG9lys
 2TXQ==
X-Gm-Message-State: AOAM533dDvRSqhWQX7fdeOcCm1c2mkgAGnSa8Jcy5fwLjx9TdfjJL51K
 doxrI3xXlEGwMsKiY0aoykN3Xd/A9olhlVJXekSlCA==
X-Google-Smtp-Source: ABdhPJxW0HbA94ewF7F3weEGbYhyR1USNUWGh56KyTn6uWBkUkN9dCEH3OgkE9YeiRwCBSERhbC4leLYiC4JNncqOlo=
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr24290849ila.165.1619641292908; 
 Wed, 28 Apr 2021 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210428170416.1027484-1-hsinyi@chromium.org>
 <20210428170416.1027484-3-hsinyi@chromium.org>
In-Reply-To: <20210428170416.1027484-3-hsinyi@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Wed, 28 Apr 2021 16:20:56 -0400
Message-ID: <CAMavQK+RJATzOVfgRhpU5i3kGsYM2-y4whgZMTdwNnK=z63nYA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] drm/i915: init panel orientation property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 1:04 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Creating the panel orientation property first since we separate the
> property creating and value setting.

This should probably be included in patch 1 so you don't regress i915
in between patches.

Sean

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c  | 1 +
>  drivers/gpu/drm/i915/display/intel_dp.c | 1 +
>  drivers/gpu/drm/i915/display/vlv_dsi.c  | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index 9282978060b0..162fb3cf0f5a 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1903,6 +1903,7 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
>
>         connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>
> +       drm_connector_attach_scaling_mode_property(&connector->base);
>         drm_connector_set_panel_orientation_with_quirk(&connector->base,
>                                 intel_dsi_get_panel_orientation(connector),
>                                 connector->panel.fixed_mode->hdisplay,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a5231ac3443a..f1d664e5abb2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5263,6 +5263,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>         intel_panel_setup_backlight(connector, pipe);
>
>         if (fixed_mode) {
> +               drm_connector_init_panel_orientation_property(connector);
>                 drm_connector_set_panel_orientation_with_quirk(connector,
>                                 dev_priv->vbt.orientation,
>                                 fixed_mode->hdisplay, fixed_mode->vdisplay);
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 9bee99fe5495..853855482af1 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1632,6 +1632,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
>
>                 connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>
> +               drm_connector_init_panel_orientation_property(&connector->base);
>                 drm_connector_set_panel_orientation_with_quirk(
>                                 &connector->base,
>                                 intel_dsi_get_panel_orientation(connector),
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
