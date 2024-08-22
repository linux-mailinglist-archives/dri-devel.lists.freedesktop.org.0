Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E5A95B285
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 12:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ECE10E078;
	Thu, 22 Aug 2024 10:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Fyi0XGbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6D310E078
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 10:02:11 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2d3d58d6e08so436968a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 03:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724320931; x=1724925731;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnbOQjCg+wnSShYnMDRJ5uxlxTbiQhZfM0vBsJUAup8=;
 b=Fyi0XGbuZUjbhH/6XwAnpW4gjtwgn9pwrjrpc5M0viiEUjQCnNEFPRubhKsyzcc8pN
 19qVSrl7TlD/ZdzkxJKYoT7e7FzPx/HL4bXwKo++r0UKwGB+65OZ/CJjm2XtSI4IxGAR
 jmO94w2JF15Z9FDgXFRabX/MLmpu21ZxCwt52Oa1EPJ3l1nUrmCfrEev919uf79FuPnz
 yzRMqt5mlfEcHFcVHH2SRI0WP3euC5pHfM3zU3q9Kb0FYDNUm6EJv0jHrW9tfH2bJtYX
 37fjHqVCjnaeIrTLPK7wzTac0Mief5zEQ6upd2hVXFUTtbdg5u6puddKEOTc/rbivJJd
 UNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724320931; x=1724925731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnbOQjCg+wnSShYnMDRJ5uxlxTbiQhZfM0vBsJUAup8=;
 b=gIs8iKZojKcbOVyZQAL+bJfMijJNDThCguASdoApQW32J33WDX2X+P6x18bGMmw3Yw
 9U6ToqVryNtv+6ILpuUsAjoCbe6oX+0E0x1DBdT70WdZd7GZhgyYveQJF30ZBdHpiKxa
 rHXlSF+5Vr46wow3h5ae8IBZ9WPx/vEpUXSyfH+aWIqzKMddGN5qOFt7d5NLLQKF+a7X
 67l97iAghpbpqDGc9dbYzje7YU14Ly5jFHfkGvGkYm6r4wp7okaENGw9DQt5beLD+R3F
 0nyWsM9VzqwqwS0GRcrRU38BUnUFpy3zCbNyM8RJ1EOH1Q46KeJ8SW7ahp3IntaXkB+x
 4M4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI/cU9RHcofsKu1xrp8YgNIR9etSKA7p93xy8z90r0iibyZYsmAOh5FjE4nr3JYvE9pDnlNdZXD4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEuojRjo5QdIaX268BxybCqn/Y4iLLKwg73xwa1fnIeibnfwUJ
 Yd/hLmzV6jvc30xtRnD+IAhah+fTyTniDaaYTUdAA2LAxaH/Q3toAUVHZVeQU2YHWZQhYBTieoh
 RNorBgE8qsdXFLDat3r1mB07u4FNRiK7a6qwhqg==
X-Google-Smtp-Source: AGHT+IHFPSOd6NREw9A278ECg7mZRm4KbY500kEKTD7MayZF2O5OrCXgPgHLK0oSuFdKLdnGItooyTY+XoN1oFKjZrM=
X-Received: by 2002:a17:90a:9114:b0:2d3:bd5c:4ac8 with SMTP id
 98e67ed59e1d1-2d5ea4c61d0mr5881422a91.27.1724320931442; Thu, 22 Aug 2024
 03:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240822093442.4262-1-hanchunchao@inspur.com>
In-Reply-To: <20240822093442.4262-1-hanchunchao@inspur.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 22 Aug 2024 18:01:59 +0800
Message-ID: <CAHwB_N+1a9pWTVZmWb6tDTR0S1G5tCj7zJx9xaOL_tBTS5oTtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: fix null pointer dereference in
 hx83102_get_modes
To: Charles Han <hanchunchao@inspur.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 liuyanming@ieisystem.com, Douglas Anderson <dianders@chromium.org>
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

Charles Han <hanchunchao@inspur.com> =E4=BA=8E2024=E5=B9=B48=E6=9C=8822=E6=
=97=A5=E5=91=A8=E5=9B=9B 17:34=E5=86=99=E9=81=93=EF=BC=9A
>
> In hx83102_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a possible NULL
> pointer dereference on failure of drm_mode_duplicate(). Add a
> check to avoid npd.
>
> Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate dri=
ver")
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/dr=
m/panel/panel-himax-hx83102.c
> index 6e4b7e4644ce..7c2a5e9b7fb3 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -565,6 +565,10 @@ static int hx83102_get_modes(struct drm_panel *panel=
,
>         struct drm_display_mode *mode;
>
>         mode =3D drm_mode_duplicate(connector->dev, m);
> +       if (!mode) {
> +               dev_err(&ctx->dsi->dev, "bad mode or failed to add mode\n=
");
> +               return -EINVAL;
> +       }

 In my V2 series, Doug suggested:
"nit: no need for an error message when drm_mode_duplicate() fails.
It is incredibly unlikely that the allocation will fail and the Linux"

https://lore.kernel.org/all/CAD=3DFV=3DV2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2=
mDB+NZug@mail.gmail.com/

>
>         mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>         drm_mode_set_name(mode);
> --
> 2.31.1
>
