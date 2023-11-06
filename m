Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F607E2FAF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 23:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EF710E44D;
	Mon,  6 Nov 2023 22:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AAA10E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 22:18:31 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a7b91faf40so59194167b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 14:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699309111; x=1699913911; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ebVVlSH5A/RaybVZDxdMNnaR50LgXmfcVpTsk4uB9cU=;
 b=N6Z28VfabSUqemQTOxtz0jOPA8AnVLrlXcm4CSsBDkzPs+J18u5Ef4HKjbCC5x7/q+
 DzhtzUR1SFXBUxfjoKqpkgQ9FwQcQ3f/10g4X9yTfgZt4QZmyjwbRmKscvyxPdxWi5Cd
 4BZXn7rOh5l41kG2ux/MfKqimj+3gsMXfvUwwwMP3dCI5msvuer4tf6x2qZRPSwd6Co1
 RsLnhwpiCpeZrvy6PxUBRWLdBVcNnndBbmXZZE6WUZbnlqgmhwZNCuQeo5lzfw3dThbh
 MF2kFIlCh8TZ+CejSmdlHiSL2hs+3UjDUK+GeA84R9K0yTjAtEPP5WMTc+bsr767o+V4
 lRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699309111; x=1699913911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ebVVlSH5A/RaybVZDxdMNnaR50LgXmfcVpTsk4uB9cU=;
 b=p8V4JmlHgG/7jPab7uDjLNrsokMEDlfHEF+RTx8Ji1R8RycpUrVSjdR/tHpuxilM5D
 KE33SlSxpKhBCY6xUEXdblDDZAFRK53dWME8Ql78S2pKjnZTYnc1XbKfoWTiE3UAzlzs
 F4FQPIcYX9DJsh30Aec5nzY2GRoySrOODvBYAGBz5SRFYhUdjiYWogswGJJZTQ9uGvze
 VUVYXq+t1m9hGVBSE0RtUnaW3VNZMvD4gqDNxCh2ryCbeuxlsF0X42OLZHrmF0DEqM43
 A2tSeipwq5rkXCXRyud9QxCS5gYhAzxkeMHCEnS5MXeMEgakSqaMqWVibFBIipwF9lh5
 TEsg==
X-Gm-Message-State: AOJu0Yw4WMFF6zozI+Ap+qUfp1j3aIWYoNLXXn+uB1nFuJMcjYa7AUmw
 K2FkuzSL6X59xFhs29dv+X8BaAf0XcgNL7nnbNgG0i7GdWZRpwE90Zo=
X-Google-Smtp-Source: AGHT+IEE1rPs7nIgHyF3nk3upXCYIZ4/+o5roe5iXE9kveqr2Kro5tZQ+AiwCx4oaqNZFA1YW/MVufenjGygsFIWnjs=
X-Received: by 2002:a0d:e809:0:b0:59f:6675:7771 with SMTP id
 r9-20020a0de809000000b0059f66757771mr11712763ywe.35.1699309110717; Mon, 06
 Nov 2023 14:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20231106210337.2900034-1-hsinyi@chromium.org>
 <20231106210337.2900034-3-hsinyi@chromium.org>
In-Reply-To: <20231106210337.2900034-3-hsinyi@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 00:18:19 +0200
Message-ID: <CAA8EJpofjpZDNZSN4X4ZRUVNk7GgWHy_mBqee1ux4ADr=4KJkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Nov 2023 at 23:03, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Generic edp gets mode from edid. However, some panels report incorrect
> mode in this way, resulting in glitches on panel. Introduce a new quirk
> additional_mode to the generic edid to pick a correct hardcoded mode.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v3->v4: no change
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 68 ++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 599a949d74d1..0fb439b5efb1 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -203,6 +203,9 @@ struct edp_panel_entry {
>
>         /** @name: Name of this panel (for printing to logs). */
>         const char *name;
> +
> +       /** @override_edid_mode: Override the mode obtained by edid. */
> +       const struct drm_display_mode *override_edid_mode;
>  };
>
>  struct panel_edp {
> @@ -301,6 +304,25 @@ static unsigned int panel_edp_get_display_modes(struct panel_edp *panel,
>         return num;
>  }
>
> +static int panel_edp_override_edid_mode(struct panel_edp *panel,
> +                                       struct drm_connector *connector,
> +                                       const struct drm_display_mode *override_mode)
> +{
> +       struct drm_display_mode *mode;
> +
> +       mode = drm_mode_duplicate(connector->dev, override_mode);
> +       if (mode) {
> +               mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +               drm_mode_set_name(mode);
> +               drm_mode_probed_add(connector, mode);
> +               return 1;
> +       }
> +
> +       dev_err(panel->base.dev, "failed to add additional mode\n");
> +
> +       return 0;

Nit:
it is more typical to handle error cases as conditionals.
This means:

if (!mode) {
    dev_err();
    return 0;
}

mode->type |= ...
drm_mode_set_name();
drm_mode_probed_add();
return 1;

> +}
> +
>  static int panel_edp_get_non_edid_modes(struct panel_edp *panel,
>                                         struct drm_connector *connector)
>  {
> @@ -568,6 +590,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>  {
>         struct panel_edp *p = to_panel_edp(panel);
>         int num = 0;
> +       bool has_override_edid_mode = p->detected_panel &&
> +                                     p->detected_panel != ERR_PTR(-EINVAL) &&
> +                                     p->detected_panel->override_edid_mode;
>
>         /* probe EDID if a DDC bus is available */
>         if (p->ddc) {
> @@ -575,9 +600,18 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>
>                 if (!p->edid)
>                         p->edid = drm_get_edid(connector, p->ddc);
> -
> -               if (p->edid)
> -                       num += drm_add_edid_modes(connector, p->edid);
> +               if (p->edid) {
> +                       if (has_override_edid_mode) {
> +                               /*
> +                                * override_edid_mode is specified. Use
> +                                * override_edid_mode instead of from edid.
> +                                */
> +                               num += panel_edp_override_edid_mode(p, connector,
> +                                               p->detected_panel->override_edid_mode);
> +                       } else {
> +                               num += drm_add_edid_modes(connector, p->edid);
> +                       }
> +               }
>
>                 pm_runtime_mark_last_busy(panel->dev);
>                 pm_runtime_put_autosuspend(panel->dev);
> @@ -950,6 +984,19 @@ static const struct panel_desc auo_b101ean01 = {
>         },
>  };
>
> +static const struct drm_display_mode auo_b116xa3_mode = {
> +       .clock = 70589,
> +       .hdisplay = 1366,
> +       .hsync_start = 1366 + 40,
> +       .hsync_end = 1366 + 40 + 40,
> +       .htotal = 1366 + 40 + 40 + 32,
> +       .vdisplay = 768,
> +       .vsync_start = 768 + 10,
> +       .vsync_end = 768 + 10 + 12,
> +       .vtotal = 768 + 10 + 12 + 6,
> +       .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
>  static const struct drm_display_mode auo_b116xak01_mode = {
>         .clock = 69300,
>         .hdisplay = 1366,
> @@ -1878,6 +1925,15 @@ static const struct panel_delay delay_200_150_e200 = {
>         .delay = _delay \
>  }
>
> +#define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _mode) \
> +{ \
> +       .name = _name, \
> +       .panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
> +                                            product_id), \
> +       .delay = _delay, \
> +       .override_edid_mode = _mode \
> +}
> +
>  /*
>   * This table is used to figure out power sequencing delays for panels that
>   * are detected by EDID. Entries here may point to entries in the
> @@ -1895,9 +1951,11 @@ static const struct edp_panel_entry edp_panels[] = {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
> +                        &auo_b116xa3_mode),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1",
> +                        &auo_b116xa3_mode),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
> --
> 2.42.0.869.gea05f2083d-goog
>


-- 
With best wishes
Dmitry
