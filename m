Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B076190409F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 17:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911C510E200;
	Tue, 11 Jun 2024 15:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BMVaOGsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F8A10E200
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 15:58:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43fbbd1eb0cso29507321cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718121486; x=1718726286;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ve/uaqN0JHEkOvnOM0N3RhTwkgm+3t8w6LalScKCEEE=;
 b=BMVaOGsYC1QXGFJNwoCTt5Hvwy3YSaPWXC68+yc9mbpaJid7XexDkvpekWz6U+fR60
 TDvKSOm89YKhZcMsgJqB/Lk1L2ft3OjGatSfI8xaHPZp+vyninGQp6io1PHTzI7VAHiT
 scsdDi5gxodaGNgnXTL/VrmXsuGawgpvo0P2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718121486; x=1718726286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ve/uaqN0JHEkOvnOM0N3RhTwkgm+3t8w6LalScKCEEE=;
 b=HN/rKDz+uTZZeH68lJ3Vu5NexPezA7H+WOVaiR+xYTAEY+bjUMM3YBZ+teVBDkDN3s
 gVLBx5kL1eqAczNhsH215DdJ0xCOBiArN9ibQrpQwywSxyryOSNJZXhB//Sc5X8gzjAu
 49NKtZHeujYB//gXWVCWcvAHhv6EfzkYIojagrjmNzWyl5I5dWxqafcM7ntHHiAN/+3o
 G3J/OFgUE/hbKoVJw7lHU6PjHCXQnO5w/DIsSr2D4rp+1AE07RXMnsKbx8VWI2gm96ew
 Fg9/Bh9rRbdNZ1k+QyrRppYSS1GTKBQxQC4Ha7zZWV1mCEH0ARPQ+RJWAJ3ndCphnHuV
 fu/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Tpm/ZBMJ+kA2GBA9VYXvgKxX4WbXUn0+utgz9LvExVs+R8fO75cGb+I978bCdn6Y1nJ0pEdBL/G8dcrpCq/8mL+3PE8mIVpOkx9xAZV6
X-Gm-Message-State: AOJu0YwR4tsTGbfFghk0lN00ebNT8MeZe9F1t/SFv4d35wVShHefRtda
 nF6anEjhEhozefOVR6H+Bv5nXWwQzg3vqS5EKprSoGCmHTGz+QnDKHLkr6ZCBDthWNuH0nZYFCE
 =
X-Google-Smtp-Source: AGHT+IGlW87mJVByRVWC/wPBlQYq9gI/XfQfAAY1GS4bJGhAwruzKqCgs3FJCGMTW92nMmOuTnwaLg==
X-Received: by 2002:ac8:7955:0:b0:440:6263:6f9f with SMTP id
 d75a77b69052e-44062637052mr77335651cf.58.1718121485912; 
 Tue, 11 Jun 2024 08:58:05 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-440517524aesm36671331cf.76.2024.06.11.08.58.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 08:58:04 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4400cc0dad1so540131cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUooFmRG/x5515w+Evou6TYAPXqhGK6DCg208dtapwmBCc/vTKfKxDBzV8NuVYYLaKa82YWGU2zUOEx1PE4AGBYjTa69yNHr6EaKJCOHZfN
X-Received: by 2002:a05:622a:550d:b0:440:3996:84aa with SMTP id
 d75a77b69052e-44147988903mr3173161cf.15.1718121484095; Tue, 11 Jun 2024
 08:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <3288287d-8344-4b37-a333-722cf12fef13@gmail.com>
In-Reply-To: <3288287d-8344-4b37-a333-722cf12fef13@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Jun 2024 08:57:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRuU=eh0HzbDCwFrr5h9s-rOdB5dbANAd-BmMhiHR6Ww@mail.gmail.com>
Message-ID: <CAD=FV=XRuU=eh0HzbDCwFrr5h9s-rOdB5dbANAd-BmMhiHR6Ww@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel : truly-nt35521: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Jun 11, 2024 at 7:44=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> sony tulip truly nt35521 panel.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>
> Changes in v2:
>     - Fix patch format
>     - Fix code style
>
> v1: https://lore.kernel.org/all/485eef24-ddad-466a-a89f-f9f226801bb7@gmai=
l.com/
>
> ---
>  .../panel/panel-sony-tulip-truly-nt35521.c    | 435 +++++++++---------
>  1 file changed, 209 insertions(+), 226 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/dri=
vers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> index 6d44970dccd9..5a050352c207 100644
> --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> @@ -44,248 +44,231 @@ static void truly_nt35521_reset(struct truly_nt3552=
1 *ctx)
>  static int truly_nt35521_on(struct truly_nt35521 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };

It's not a huge deal, but normally in the kernel all the variable
declarations are cuddled together. AKA no blank line between the
declaration of "dsi" and the declaration of "dsi_ctx". It would be
awesome if you could send a v3 fixing that. When you send v3, feel
free to add this above your own Signed-off-by:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...with that, the patch will probably sit on the mailing lists for a
week or two and then get applied. Neil may want to apply it, but if
he's busy I can do it too.

I believe you were planning on tackling some more of the panels. Since
you're still getting started sending patches, maybe keep it to a
smaller batch for now and send another 10 or so? Probably best to keep
it as one panel driver per patch.

-Doug
