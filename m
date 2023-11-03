Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0B7E0B14
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 23:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A3C10E069;
	Fri,  3 Nov 2023 22:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AF510E069
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 22:28:18 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5b35579f475so30221127b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 15:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699050498; x=1699655298; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U6NJDQoOfwFZpGBuU7rkDRLNSjQIHHtF+RL8f4bGrc0=;
 b=yr0xb0hOgmWqIrOBhPQynkmOPfVRG2lEUH54l0Z3Tjdf5yRn85vmn7n9Day/9wS69M
 lq+C1r+Nnui04MYp6X4J80zzCKd599XdYRI0palkU7ZTzqPGAo1sq6f4+2gD2fzn8PHU
 O8ObPAyVlpDr3gewdDqj/c0CMHt+Y4MX9FNLiIrJneokHDqXWvs+mUlcXJhtKKTcA+7f
 OUb+YtNQWP7AzBmtA5t6WRhvzCQxPe75l/XgyNffNKHNJaK1Dbx6LVxoUHL3tgxI/Vke
 aqMqppbpGwM2A6x8uwECvQXmwCqUZ5H2pA17FV0WLPFlrQtSt+ZNrkMOXe8JtQO9W0wD
 cEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699050498; x=1699655298;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6NJDQoOfwFZpGBuU7rkDRLNSjQIHHtF+RL8f4bGrc0=;
 b=NcqL3FRAdeNflF8ux3WLXU9R6qyNpEtArzil/eLsJQgLLLehxitRyr0NhuByO6ukrf
 7eJUrh3WaW8OCng+H/tdqie0ddMgRa+pkIJqTOuMhj1/pfhHSOvl0FChILbBvTbugBM6
 AaKqHYOzlWs+S8ozqoxz/rWHNhvUtMTP8fYjiKlUpDYyQa52Pih7dyCUBzGNMGITY0AU
 MFIn1ChwusJr1Gvaz+RBkytv/gX1CaLTNz5o7l4mGQ1eWMKTQwU+sQjm5cT12TgBJHBw
 9WoPJIeIFpqjY01ryXfsylJcG9FOudg1ExggofNhJlH+CzF7VU6gGZ0muh0XRVI/J9wC
 InEg==
X-Gm-Message-State: AOJu0YxHquCzbmApN9IqyJ2bi8B0LFD2MIEVmoq1bM4LzkthHeXyNNY7
 OxOW7su1h3yGJ5cxVU3vcVXOTAKkJ6qL5zItm+hSQQ==
X-Google-Smtp-Source: AGHT+IH9uIE9kv8jn3SKFUzesXh85fCc/ofC2quWr6gX9OUo7lLmMWVI7qi1QMYCmeYbMa5XlzHynE6CguHfbavXPtA=
X-Received: by 2002:a0d:cb09:0:b0:5a7:bc0e:193e with SMTP id
 n9-20020a0dcb09000000b005a7bc0e193emr4500736ywd.18.1699050497998; Fri, 03 Nov
 2023 15:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231102181907.10189-1-clayton@craftyguy.net>
In-Reply-To: <20231102181907.10189-1-clayton@craftyguy.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 4 Nov 2023 00:28:06 +0200
Message-ID: <CAA8EJpoobfosRMMNm2uDY3dNXgCU+LauRvg9-2MrQBwHO0q1Cg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add timings for BOE NV133WUM-N63
To: Clayton Craft <clayton@craftyguy.net>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Nov 2023 at 20:19, Clayton Craft <clayton@craftyguy.net> wrote:
>
> This panel is found on laptops e.g., variants of the Thinkpad X13s.
> Configuration was collected from the panel's EDID.
>
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>
> ---
>
> V2: renamed to "*_mode" since there is only 1 mode listed
>
>  drivers/gpu/drm/panel/panel-edp.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 95c8472d878a..e2e4d88a5159 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1204,6 +1204,29 @@ static const struct panel_desc boe_nv133fhm_n61 = {
>         },
>  };
>
> +static const struct drm_display_mode boe_nv133wum_n63_mode = {
> +       .clock = 157760,
> +       .hdisplay = 1920,
> +       .hsync_start = 1920 + 48,
> +       .hsync_end = 1920 + 48 + 32,
> +       .htotal = 1920 + 48 + 32 + 80,
> +       .vdisplay = 1200,
> +       .vsync_start = 1200 + 3,
> +       .vsync_end = 1200 + 3 + 6,
> +       .vtotal = 1200 + 3 + 6 + 31,
> +       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc boe_nv133wum_n63 = {
> +       .modes = &boe_nv133wum_n63_mode,
> +       .num_modes = 1,
> +       .bpc = 8,
> +       .size = {
> +               .width = 286,
> +               .height = 179,
> +       },
> +};
> +
>  static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
>         {
>                 .clock = 148500,
> @@ -1723,6 +1746,9 @@ static const struct of_device_id platform_of_match[] = {
>         }, {
>                 .compatible = "boe,nv133fhm-n62",
>                 .data = &boe_nv133fhm_n61,
> +       }, {
> +               .compatible = "boe,nv133wum-n63",
> +               .data = &boe_nv133wum_n63,

Just for my understanding. Why do you need to add panel mode and size?
Isn't a delay (added below) enough for your case?

>         }, {
>                 .compatible = "boe,nv140fhmn49",
>                 .data = &boe_nv140fhmn49,
> @@ -1852,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
