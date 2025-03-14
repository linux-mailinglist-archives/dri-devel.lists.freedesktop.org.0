Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE323A6138A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 15:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85610E9FA;
	Fri, 14 Mar 2025 14:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JrTkPIS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA8710EA12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 14:20:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so23395001fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741962014; x=1742566814;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfJ1nD4qQC39uy7AdzGWyBQGMKQmzTpkBSOlo3nuQF4=;
 b=JrTkPIS628qorKY+9rx9xba5Wli9Y9cV/wCIf3aMiHjRlqZlS90x0yPXTL3uF56I73
 ZKs/IdJEzo3DUa+ChXCDOseqs4vKTu5TTBZpDSnAakIpIEcuPVYMZwehet+t0/CJJ7jO
 8jZxSIbs0vUCj5IphM+qDrZlLa1Kchne0vj78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741962014; x=1742566814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfJ1nD4qQC39uy7AdzGWyBQGMKQmzTpkBSOlo3nuQF4=;
 b=OuXLoCD8TWf+L6sV4MipbPBjyhRcCNsFxYfBSp2B2DY/AclyrfFUSk6bAU8f0/LahC
 pjFgu26U7xDS/rAOEoWSAL/7vxuAgiYlpuP/S+oyXzoUaRjVq7jABiMA1Qzo49InA1RW
 pI9qNmxR5Y+iNstX1ioYAcjJQAEwyYXWmv0rLkpPljiOgiIUcrs2K6BIWwisPtPpmuAr
 Nw2ukG1YyJ8vtNCemfQ8Fw2SLUKH4k6R562B3H1gG2igcYQAyVEbdJWF4MDQ0Y6crlob
 5iaVzeEW3M1gkQAlCGSyP9HT0U6ura2qjFUm+hcbYoTm0U9kWggnvyIJQs3ZEE15AkzL
 9+zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh7RgbLl+CUlB2diTyYrb4eINf1b6w3X5vo1pB0OXUx74HePdHq/gZaLH4nWCuSs2F+nujwj19lOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywyu8m8Qq8EKQP2RbD7CgdF0iYCz+pI4pa11ouSinNwM3TrbE02
 dEOngOqCzM1AIHBH3T6X3or59GgPT3Z05dZyDhTEbMUcEccyy9l3HrR2j8FabkcyxjM9gmrFYn6
 Nq8bi
X-Gm-Gg: ASbGncsTVF+IgURIfWp3dJQKkEi/pWHgICrtr2GoDHtjespHVUGtvWj/8h2TqJ9JL4O
 A+4bVBj7zS2+DRRI+YFZsvAvz0VTXvKWITKO1yJNjrpHuBSNXtiga87XsjWEgT5yi5UszUAko+X
 aghAE+CgHZHFyxms5g5T589ewYQNhipnOG/S8gfi4u2jrwI8bai/hd2jAOcm/C7loCi5Ve5neqY
 YoBRq/BKECW1OdURGvEzTYSubxufpF/niX+Jtbh8HWNVRJU7rra25J3mYnZCMG62qFqq129bugx
 tUA7tygEWQzw1pwIfcakUMYsRfC+MFteQEBbw96VeA7JYJby7xB45Ge+YHx1eXlOw/2YGeqjGPF
 5Pmf7LfY5zmPg
X-Google-Smtp-Source: AGHT+IHRbPSfqQJsJxd4eSG4XeFAhivZlSkfLdVZYZCTfgRFwLvA6asS5yITUpPCypD+rd18IU53iA==
X-Received: by 2002:a05:6512:2245:b0:545:cc5:be90 with SMTP id
 2adb3069b0e04-549c398cf85mr1010058e87.35.1741962014058; 
 Fri, 14 Mar 2025 07:20:14 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a86e4sm549248e87.2.2025.03.14.07.20.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 07:20:13 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso20629271fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWbt8mfFadAa39arOs092lVV4Cmw/qwSbs2X8ifH3E3m9ZcYnYLZvBxaxEmGNhdg+dh3/XhiJUEPSE=@lists.freedesktop.org
X-Received: by 2002:a2e:b538:0:b0:30c:1079:7538 with SMTP id
 38308e7fff4ca-30c4a877b83mr8366601fa.21.1741962012535; Fri, 14 Mar 2025
 07:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com>
In-Reply-To: <20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 07:20:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUN7CcnjURs6xfVAFqvZ1WR86y8nQm=OMcrV_hYjq5RQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jpd9pNZVZeD6Ojnhn1MRoN3TYYAWDeFHObuLfxuTus8fvqg1YTzmRnYBBs
Message-ID: <CAD=FV=XUN7CcnjURs6xfVAFqvZ1WR86y8nQm=OMcrV_hYjq5RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
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

On Thu, Mar 13, 2025 at 9:47=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
> @@ -181,24 +162,15 @@ static int r63353_panel_prepare(struct drm_panel *p=
anel)
>  static int r63353_panel_deactivate(struct r63353_panel *rpanel)
>  {
>         struct mipi_dsi_device *dsi =3D rpanel->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display OFF (%d)\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>
> -       usleep_range(5000, 10000);
> +       mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
>
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
> -       return 0;
> +       return dsi_ctx.accum_err;

nit: the one caller of r63353_panel_deactivate() doesn't actually look
at the error code, so this could be a function that returns "void".
That was true even before your patch, though. I wouldn't mind a
followup patch that fixed this. ;-)

In any case, the patch looks reasonable to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Happy for someone else to apply it if they want. If not, I'll snooze
this for ~a week to give others a chance to comment and then plan to
push to drm-misc-next.


-Doug
