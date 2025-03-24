Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162C0A6DFD5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3881210E432;
	Mon, 24 Mar 2025 16:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PrPCGIEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7337910E432
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:35:31 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bfc8faef9so47537661fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742834127; x=1743438927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EqbuE4QKSA6wina+ZlmUOPRyV7ECRhpq4syhxm86eE=;
 b=PrPCGIEjeuIgedbmKo4mPXPooWNXAHXapuiug0hCSynBb5XTYlcvrx/YTPz0dW4iii
 XfV6k2HEqg9n8WSI6tfwJWYhMxNLNzuig4k8Oz57A1fgFnkTZJpg4I+ESVs4LKTMxxlv
 DCqMu8h3Qjs5D1H+GVPMPoNylqHP9M7LfqoAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742834127; x=1743438927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EqbuE4QKSA6wina+ZlmUOPRyV7ECRhpq4syhxm86eE=;
 b=Tb8hNpJqJ0e7qXJKR5Fbn7cYF4qh33X8OHHMgzviQml9HJkIiEEYmmrhKcjqbfiSzR
 aYQ+nhOq3v2ibmPNPzm7RIe1WD+Ex2zCmmdc7OFSXAyx+/DYyTyjHAGthS3djESM7/4p
 I3QnKSMmwafEwbVuA87j0n4l0wTGnmfHpB+TRQLsICwBXtkVlGthBAEVnHujoTcq49HO
 bVBFW+uglUWLYuFVxk2Ph9WbbMcTkuGbYToB/lucqyXwxgHLe8aoRU2GhhF2KUENkg6c
 S7wMQgivWfKr7nqqsePHwugA433S6shrLlBRJP0v18z7nGT+/MFLa/TxW/mvi++Upz6k
 CY3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ+d7n2Npq0+MZ5xwgt6BAFe3Y7ULVp+z0hjtrMLyS/W5N4jsGZTUNC4aFBCUOZ9BnJgpJe1j7xBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX0sRqJqJT7uaiOIBSlkKMtrQk4toZMLueXuVibaDRpyxLz1/O
 APtTF1xLkt+fWu2R43N3YcKR3EtZR0qTAlC6KtmbC/BWh9O5TJl5J5UAsD0YlBWS4L17b0I4aFZ
 Hcg==
X-Gm-Gg: ASbGnctsJwVdZFBMnExfMuChmKuJ/ew/8v0zVp4UWAhakvQKPiQyF1oJ1/qDFDj63vZ
 W/+0LehFCFoUaKLHGfphmfObR4dC23XU9kLyEAEziWaiU+pjWKEFBeGn44C2kz/Ly7XPUIIl4UM
 CxZ/VyoVgjxC1WAgH9W2GQhK3JV4/SbyLBOVfDpaOSpvVd9oT34FHYX2wkd4hATmwi19le5CRXu
 FL5meYfEcrD1UNiL+ocM/MLhmQ5+Ri1LAs3/W/ar+WJtJEu3JYYvIwMilGH0WPYFHy8Orkbt46q
 cYJDWHpOz9JP7utO9oT7NV9AeNsZcHTQVd6hOB89pJJT304gzoNYtlNLo0tHGlOgqu/X23P+Gd9
 O24C1RcW9+xJ5
X-Google-Smtp-Source: AGHT+IFaokOG+Q5Gnad9hlUvEkwL8z3AxT7z8coizdcMwiBYhdxSiBXL0q2HISsQ/vjX643r6dKx6g==
X-Received: by 2002:a2e:a582:0:b0:308:f5f0:c415 with SMTP id
 38308e7fff4ca-30d7e208b11mr38417171fa.6.1742834126723; 
 Mon, 24 Mar 2025 09:35:26 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d557b9fsm15193391fa.0.2025.03.24.09.35.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 09:35:25 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso45146071fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:35:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdOAYtfs2PxaNeToJgcKNJDNB9sLlSYhAVSeqNKqPMcCEiK0c/LA1eu+8rdVl0mVvbLY9imdTTIbY=@lists.freedesktop.org
X-Received: by 2002:a2e:bc08:0:b0:30a:4428:dea9 with SMTP id
 38308e7fff4ca-30d7e2ba31bmr57231481fa.30.1742834124892; Mon, 24 Mar 2025
 09:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250318-synaptic-expt-v1-1-fa3831a7d883@redhat.com>
In-Reply-To: <20250318-synaptic-expt-v1-1-fa3831a7d883@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:35:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqN0XVse0HvdzeSqi+rJ0X0zoXb718+FBr_44TPbBX5A@mail.gmail.com>
X-Gm-Features: AQ5f1JqNq1lS2CtrAR4jlSIscWwBK3GQhAIHOAxkhnKx3a3XI2tYTZa6bM4a9Do
Message-ID: <CAD=FV=WqN0XVse0HvdzeSqi+rJ0X0zoXb718+FBr_44TPbBX5A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panel/synaptics-r63353: Use _multi variants
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

On Tue, Mar 18, 2025 at 7:37=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
> Move away from using deprecated API and use _multi
> variants if available. Use mipi_dsi_msleep()
> and mipi_dsi_usleep_range() instead of msleep()
> and usleep_range() respectively.
>
> Used Coccinelle to find the _multi variant APIs,
> replacing mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. Manually handled the
> reset step before returning from r63353_panel_activate()
>
> v2: Do not skip the reset in case of error during
> panel activate (Dmitry)
> - Convert all usleep_range()
>
> v3: mipi_dsi_usleep_range() is to be used only when in
> between _multi commands(Doug)
> - Check for error once in the end while using _multi
> variants (Doug)
>
> v4: Change return type of r63353_panel_deactivate() to void (Doug)
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
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Previous attempt for this change was addressed in:[1]
> The series did not handle returns properly and still
> used msleep() and usleep_range() API.
> It also collided with an Tejas's similar efforts.
>
> Will be sending the patches per driver instead of
> major haul of changes.
>
> Following [2] for reference.
>
> [1] -> https://patchwork.freedesktop.org/series/144824/
> [2] -> https://lore.kernel.org/dri-devel/20250220045721.145905-1-tejasvip=
in76@gmail.com/#iZ31drivers:gpu:drm:panel:panel-sony-td4353-jdi.c
> ---
> Changes in v4:
> - Change return type for r63353_panel_deactivate() from int to void
> - Link to v3: https://lore.kernel.org/all/20250314-b4-mipi-synaptic-v1-1-=
a64ccb5e5c66@redhat.com/
>
> Changes in v3:
> - Modify the script to handle returns and msleeps ()
> - handle reset in case of error properly
>
> - Link to v2: https://lore.kernel.org/all/20250310-mipi-synaptic-1-v2-1-2=
0ee4397c670@redhat.com/
>
> Changes in v2:
> - Handle the reset case properly
> - Handle msleep() and  usleep_range()
>
> - Link to v1: https://lore.kernel.org/r/20250305-mipi-synaptic-1-v1-1-920=
17cd19ef6@redhat.com
> ---
>  drivers/gpu/drm/panel/panel-synaptics-r63353.c | 68 +++++++-------------=
------
>  1 file changed, 19 insertions(+), 49 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel/synaptics-r63353: Use _multi variants
      commit: c8ba07caaecc622a9922cda49f24790821af8a71
