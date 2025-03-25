Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA408A7051C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3561210E588;
	Tue, 25 Mar 2025 15:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dwhqayns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2438610E588
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:34:12 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bfc8faef9so58168841fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742916845; x=1743521645;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1Vc6gMV26ZKRmVjPbIms2/GbFw+3qC8T6sWJSOv4YE=;
 b=DwhqaynsMiAn0jPDst3w3B5vUASnwYHVGSvNi4/M0Yt//ddm5dDr6/6HE+GBND8xOJ
 e88zDWhNl0X+gnP2Nmmc3WdTSshnSVOVX7tfjE5AFPFRityPzV/kOZR7pu4cEnCiLpJn
 d+yidLsOK5TYd1JkC2v5Pwdjr7r5MA3TcGViM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742916845; x=1743521645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1Vc6gMV26ZKRmVjPbIms2/GbFw+3qC8T6sWJSOv4YE=;
 b=u7bYKXJf8LLlw0wfBtTw+apcPHlnO6+mHob1wVBxV3JQbyhK7VtNpifW5f9OW6WEEa
 PmsM40Bzq+GNc3zcAhhb/uxZVNg8OiLmptujXvUSX6kpscJ8Ff6USpnJ3dbq6glSMRti
 zrZB45R1kUiMQxMxGCw9gyEDf26UbR1uYFqBG08S5J9E6kDUxgvyVBHhISBhpCdw2/LM
 yEKsdR33QMuz6+grEfnjWs5C+bSb+BgD9LwN1w66T08DM5+CPlq9TukV5j5pySljsrkU
 TYpdLKAJBnggWwQDC8L/7+lfrWMYeremgpPlNJ6+JVgjFpthI8g0nnQbPdhm8gmZeUJc
 aO8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Iz/PK2N4U+5lESLWEkSago7XwvOKbDoM8BKQW2e4JR9RLglsWa4hzAaMwzrpeRCwy73JMfkhV0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+p9kHTD1Pj5Uu5o8m8rBxCFARlyVH1BfQGCamK4+qiXbZqJKV
 Gsqvvo2WMcaC+dbxM849vWShV0F/aIYIoMccLa5NAXV14mHe15u1SGRCvf0ScdLJ2HkKv5FnVTH
 ssy9O
X-Gm-Gg: ASbGncvCJbRdlYazpUDkFXafn/FWoVSgkIoaAssIK1nfvOrcVlRn93pSvjy+twypays
 IDygfmX8gO8PrwhOYElHf/AO1Tn7q4kq3VxWAmOgY2ZlwXqirRvtOme7W9P+HcMrreIQfLXsOpA
 9lQFDn9nKSAt5WyUSdgfhOJDsKjvvD81l7iJRTuC4+g6lKcQzbLlifzWYkFybwP6nPgd1JnFUFb
 rgPYdkday34QuHWRcAMPto9FFc8HE+J2kGBOscAL1ftp5xQEycQOQJYPpPOjQrIdSJRgyyT8Vkg
 /WUJ+6k4IezQ8JfJkGwzXjd3A6ukHHj16J/PYR1VXEH2lUuuTvV3TDmgcsFPKeytQCC7/kwH2t9
 7fOl3jqpj
X-Google-Smtp-Source: AGHT+IFdvG4LOe+6L1chNQ1eS2yau7K3mDgLJ849lOe9iRkDbsbO1T7rVqba0Ndl8DZUbqc+23bWtA==
X-Received: by 2002:a2e:3504:0:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-30d7e2f789bmr55030741fa.31.1742916845260; 
 Tue, 25 Mar 2025 08:34:05 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d7e0ebbsm18502971fa.34.2025.03.25.08.34.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 08:34:01 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54af20849bbso1791838e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:34:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNcnQ+QzsZRxh8JoQpK6566mrb5lIalCo7SYLSt4UVv65a3JMEDVhh0WcZ7iuN03NWKdTwfPyjemE=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2311:b0:549:b10b:1efe with SMTP id
 2adb3069b0e04-54ad64f586fmr6578104e87.32.1742916840580; Tue, 25 Mar 2025
 08:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be@redhat.com>
In-Reply-To: <20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Mar 2025 08:33:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXHOjpZUrb5BGSZ-OqaCdmzqwDnVx5zcnV3BEOyjuByQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpZr2gzmB5abncfLOXiL0cPD4zsNTKaXEm7_4Suw0CNS-ckPxaE1sycxXk
Message-ID: <CAD=FV=XXHOjpZUrb5BGSZ-OqaCdmzqwDnVx5zcnV3BEOyjuByQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Mon, Mar 24, 2025 at 1:31=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
> Move away from using deprecated API and use _multi
> variants if available. Use mipi_dsi_msleep()
> and mipi_dsi_usleep_range() instead of msleep()
> and usleep_range() respectively.
>
> Used Coccinelle to find the _multi variant APIs,
> replacing mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> does not have a corresponding _multi() variant. Replacing it with
> mipi_dsi_dcs_write_buffer_multi() instead. This change is manual
>
> @rule_1@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_device *dsi_var =3D dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> <+...
> (
> -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> |
> -r =3D mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
> +mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> |
> -r =3D mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
> +mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> |
> -r =3D mipi_dsi_dcs_write_buffer(dsi_var,es)@p;
> +mipi_dsi_dcs_write_buffer_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_display_off(dsi_var,es)@p;
> +mipi_dsi_dcs_set_display_off_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_compression_mode_ext(dsi_var,es)@p;
> +mipi_dsi_compression_mode_ext_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_compression_mode(dsi_var,es)@p;
> +mipi_dsi_compression_mode_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_picture_parameter_set(dsi_var,es)@p;
> +mipi_dsi_picture_parameter_set_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_display_on(dsi_var,es)@p;
> +mipi_dsi_dcs_set_display_on_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_tear_on(dsi_var)@p;
> +mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx);
> |
> -r =3D mipi_dsi_turn_on_peripheral(dsi_var)@p;
> +mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> |
> -r =3D mipi_dsi_dcs_soft_reset(dsi_var)@p;
> +mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> |
> -r =3D mipi_dsi_dcs_set_display_brightness(dsi_var,es)@p;
> +mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_pixel_format(dsi_var,es)@p;
> +mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_column_address(dsi_var,es)@p;
> +mipi_dsi_dcs_set_column_address_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_page_address(dsi_var,es)@p;
> +mipi_dsi_dcs_set_page_address_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;
> +mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,es);
> )
> -if(r < 0) {
> -...
> -}
> ...+>
> }
>
> @rule_2@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> <+...
> (
> -r =3D msleep(es)@p;
> +r =3D mipi_dsi_msleep(&dsi_ctx,es);
> |
> -msleep(es)@p;
> +mipi_dsi_msleep(&dsi_ctx,es);
> |
> -r =3D usleep_range(es)@p;
> +r =3D mipi_dsi_usleep_range(&dsi_ctx,es);
> |
> -usleep_range(es)@p;
> +mipi_dsi_usleep_range(&dsi_ctx,es);
> )
> ...+>
> }
>
> @rule_3@
> identifier dsi_var;
> identifier func;
> type t;
> position p;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> ...
> -return 0;
> +return dsi_ctx.accum_err;
> }

This is the exact same script as last time, right? Rather than
duplicate it, you can just reference the previous patch that already
landed. You'd say something like:

The Coccinelle script is the same as the one in commit c8ba07caaecc
("drm/panel/synaptics-r63353: Use _multi variants")


> v2: Use mipi_dsi_dcs_write_buffer_multi() in place of
> mipi_dsi_dcs_write(). (Dmitry)
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Changes in v2:
> - While mipi_dsi_dcs_write() does not have a corresponding _multi()
>   variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
>   APIs following _multi() usage for easier error handling
>
> - Link to v1: https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-=
1-ee38371b0ba0@redhat.com
> ---
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 42 ++++++++++---------=
------
>  1 file changed, 16 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gp=
u/drm/panel/panel-sharp-ls043t1le01.c
> index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..e3dc99ff711e388660d6d3925=
1876de8cec50dbc 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -36,60 +36,50 @@ static inline struct sharp_nt_panel *to_sharp_nt_pane=
l(struct drm_panel *panel)
>  static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
>  {
>         struct mipi_dsi_device *dsi =3D sharp_nt->dsi;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
> +       static const u8 d[] =3D { 0xae,  0x03 };
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0)
> -               return ret;
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>
> -       msleep(120);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
>         /* Novatek two-lane operation */
> -       ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
> -       if (ret < 0)
> -               return ret;
> +       mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));

Can't the above just be:

mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae, 0x03);

?


-Doug
