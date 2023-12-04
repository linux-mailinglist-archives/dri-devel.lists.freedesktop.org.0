Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9988803AAF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021B310E361;
	Mon,  4 Dec 2023 16:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2791810E361
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:47:06 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54ca339ae7aso2157584a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 08:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701708422; x=1702313222;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FveOruljDBZv6z+kbcKooVAiVbTn3vv2Y/JHOYB/pNg=;
 b=QQzuEjo8vT+ubsRlUXUohG1NBkyUQAhXidWvL0hOdP6FXJuDmZ2e89n3ANW+5sXQuN
 pOC6EAE8D23Vdms+Ri+WjMG69G3k54gKmpgmpBsEkLrlfi2qqfwSL2lcUMMiMrUyQXoU
 Ahmf1lgwexAWEg67q/ll1M2kKDQGPRAKgAdGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701708422; x=1702313222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FveOruljDBZv6z+kbcKooVAiVbTn3vv2Y/JHOYB/pNg=;
 b=Buq6ElyXS3SFC9WYoMM5VOhXpiweAgWGzeIV6W3vOTAf+VcJl/pUATbAcL3q68j7oS
 nucsq1z/ANxa9OxkrV+6bkxYXFP8YBlBjHiq9RkHK1xkYjSe6dJ735pdtITNbf644rAg
 g+UVT6WYuIZ6PHkvF8O6rVdoPPFqi4kM0puj++MM0YaZdvVeGI87OXQ6RS+xqQeyvf/R
 J/CfhdS4cYVWc1aDufN5q4+p2JReylSAiixJlIeu1Yg3sbkhvbbP1C/IVyK8GDB9RU8x
 TGiSbch82tgbigMSeVBI2QR3+0Tn7Y2VTniRXl1psBMER1jMv6M92ETrT5vc8tKgVJhF
 C+1g==
X-Gm-Message-State: AOJu0Yy+UwpV8ezT2jQVGSX7rREHhG3yLXBGHE85FBZJ40m3/1oX/rib
 p09uZJrE0Usl7Yvw4jPUOGOy7OpO/lr6bSjNl4g6g7cS
X-Google-Smtp-Source: AGHT+IEPur5hmq1OkD0HKioMdCysEaILGxq5CRfu5OMJVpcICBh0sEuhvs2XNBAN6GRnKnnhmDVu4A==
X-Received: by 2002:a50:8d41:0:b0:54c:4837:a641 with SMTP id
 t1-20020a508d41000000b0054c4837a641mr3633558edt.46.1701708422394; 
 Mon, 04 Dec 2023 08:47:02 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056402070f00b0054c7dfc63b4sm227edx.43.2023.12.04.08.47.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 08:47:00 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so100645e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 08:47:00 -0800 (PST)
X-Received: by 2002:a05:600c:257:b0:40b:4228:ee9a with SMTP id
 23-20020a05600c025700b0040b4228ee9amr482510wmj.0.1701708419762; Mon, 04 Dec
 2023 08:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20231201-x1e80100-drm-panel-edp-v2-1-b0173484631a@linaro.org>
In-Reply-To: <20231201-x1e80100-drm-panel-edp-v2-1-b0173484631a@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:46:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wx_W-Jspx4S4k-Jze8eBm5zGanzqt0-fWjYZhHB_=1qQ@mail.gmail.com>
Message-ID: <CAD=FV=Wx_W-Jspx4S4k-Jze8eBm5zGanzqt0-fWjYZhHB_=1qQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add SDC ATNA45AF01
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 4, 2023 at 12:54=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> Add support for the SDC ATNA45AF01 panel.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - moved the panel entry in the proper place, as suggested by Doug
> - Link to v1: https://lore.kernel.org/r/20231201-x1e80100-drm-panel-edp-v=
1-1-ef9def711d8a@linaro.org
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 825fa2a0d8a5..78565c99b54d 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1983,6 +1983,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116=
N2930A15"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "1=
16N29-30NK-C007"),
>
> +       EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA=
45AF01"),
> +

Looks fine to me now. I will note that e200 is pretty long and I
wonder if you've got this because of a requirement of T3+T4+T5+T6+T8
being more than 200ms. If so, I wonder if Pin-yen's patch [1] would
help you optimize things?

In any case, this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...I'll wait a day in case you say this would be better atop Pin-yen's
patch and want me to wait, but I also have no objections to landing
this now and later optimizing the delays.

[1] https://crrev.com/c/5052150
