Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810927E2FA3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 23:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F7F10E279;
	Mon,  6 Nov 2023 22:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C3E10E279
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 22:13:56 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5afbdbf3a19so58650917b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 14:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699308836; x=1699913636; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uUpUpyCuMj5XPYdHc/EmQkzHInZezJx7st9D4tF+occ=;
 b=xybjpcuYsgDsQlHO5gYyqv4ypUMmBi4Z0pYix7fQhv5+BxjBitdGSedvccbwJU4tAh
 FbH83TnUOT3o4ocG0Qo5b7J0yGL1EObk1owpvsf5D4AFcFDD2sL1SEAUW4qQ8KxAOd+R
 rRy2JqBTFQNEguDkk3g4ErePbf+4mFBVO6TWtf2Raf/8sDmaqd+CV8bQSkb7lzlzxdkb
 E6z+LgKUqbp82rFe7dsYl4bl+K6YIJNW1MVjbQaS2yRWTTo/HAKgs7F5/+/qZvmV0LHJ
 NMOsVRwMZ4LOAXhsnE/9NtkjjkJTuVCp/kVu0GQu21SFmjUb4INX3IiA92DEbw5KlQYG
 pdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699308836; x=1699913636;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUpUpyCuMj5XPYdHc/EmQkzHInZezJx7st9D4tF+occ=;
 b=gYKFnQ829dj+k5u5VERn+vBwZphedfsnY83XB7Ir2DUvgllAW4C9dAD5YqoYmp8yqx
 76F8BW0DGhSwGDfZkq2lKM8lCZZgHlDk3cpSGqimDln0BrfYydRL54gBm248nreXrMZk
 PH9RfmHoFC+m3FTpdWrz3XA6JdmE1ajYQ2ONdYWAwedICJSISYPyBTxm9VE8N8P7R/Mc
 h3h2LC0rHVEZZjCSetVsbHUeN0QfOuFGyI0c534NCYmzTLOtDzhFenz9+wSiiVfvaKvj
 6+Pad4wcfE7zpPARCz8YfUVYtyK1vCOl1VE2bnNb2bd0lOUA5tBochdYMvoABFgFblEL
 3Abg==
X-Gm-Message-State: AOJu0YwW2sS85JLRZSOvU9AeLp8GwWWhXPG0Alv6slK6Spt7Z1PCh0AF
 WZ8rjeFCCBKWk2qMRejsYo7M1LIEU+cpr8BALNEcKt8HYGtaM2xq8y8=
X-Google-Smtp-Source: AGHT+IGPRtzS//FmK2dd7WNojwmlg0EaE4cvip0q4wSgdkOGB7hCwyKiis6HciBftK5gJ0ee+0kaXvnE9UP/Or0XSK0=
X-Received: by 2002:a81:4849:0:b0:5b3:5732:bc59 with SMTP id
 v70-20020a814849000000b005b35732bc59mr12363679ywa.18.1699308835691; Mon, 06
 Nov 2023 14:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20231106202718.2770821-1-hsinyi@chromium.org>
 <20231106202718.2770821-2-hsinyi@chromium.org>
In-Reply-To: <20231106202718.2770821-2-hsinyi@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 00:13:44 +0200
Message-ID: <CAA8EJppmW-D+OAMC0VwNCFz9rEcgN5DxSpiTAwHqkt4AF5o50Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/panel-edp: drm/panel-edp: Add several generic
 edp panels
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

On Mon, 6 Nov 2023 at 22:27, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Add a few generic edp panels used by mt8186 chromebooks.
> Besides, modify the following panel:
> - AUO 0x235c B116XTN02 renamed to B116XTN02.3.
> - AUO 0x405c B116XAK01 adjust the timing of auo_b116xak01. According
> to the datasheet: T3=200, T12=500, T7_max = 50.

Generally speaking, these two chunks can go into a separate patch,
which has Fixes tag and cc:stable to get it backported to earlier
kernels.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v2->v3: fix title
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 57 +++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 9dce4c702414..599a949d74d1 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -973,6 +973,8 @@ static const struct panel_desc auo_b116xak01 = {
>         },
>         .delay = {
>                 .hpd_absent = 200,
> +               .unprepare = 500,
> +               .enable = 50,
>         },
>  };
>
> @@ -1830,6 +1832,12 @@ static const struct panel_delay delay_200_500_e50 = {
>         .enable = 50,
>  };
>
> +static const struct panel_delay delay_200_500_e80 = {
> +       .hpd_absent = 200,
> +       .unprepare = 500,
> +       .enable = 80,
> +};
> +
>  static const struct panel_delay delay_200_500_e80_d50 = {
>         .hpd_absent = 200,
>         .unprepare = 500,
> @@ -1849,6 +1857,19 @@ static const struct panel_delay delay_200_500_e200 = {
>         .enable = 200,
>  };
>
> +static const struct panel_delay delay_200_500_e200_d10 = {
> +       .hpd_absent = 200,
> +       .unprepare = 500,
> +       .enable = 200,
> +       .disable = 10,
> +};
> +
> +static const struct panel_delay delay_200_150_e200 = {
> +       .hpd_absent = 200,
> +       .unprepare = 150,
> +       .enable = 200,
> +};
> +
>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
>  { \
>         .name = _name, \
> @@ -1869,37 +1890,69 @@ static const struct edp_panel_entry edp_panels[] = {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B140HTN02.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
>
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0715, &delay_200_150_e200, "NT116WHM-N21"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0731, &delay_200_500_e80, "NT116WHM-N42"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0741, &delay_200_500_e200, "NT116WHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f6, &delay_200_500_e200, "NT140FHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x08b2, &delay_200_500_e200, "NT140WHM-N49"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x09ae, &delay_200_500_e200, "NT140FHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
>
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.delay, "N116BCA-EA1-RC4"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, "N116BGE-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1145, &delay_200_500_e80_d50, "N116BCN-EB1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N116BCN-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, "N116BGE-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140HGA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
> +
> +       EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
>
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x048e, &delay_200_500_e200_d10, "M116NWR6 R5"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M133NW4J"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R140NWFM R1"),
>
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
> +       EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
>
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
> --
> 2.42.0.869.gea05f2083d-goog
>


-- 
With best wishes
Dmitry
