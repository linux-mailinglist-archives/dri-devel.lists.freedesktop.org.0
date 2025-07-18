Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A8CB0A849
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2F10EA01;
	Fri, 18 Jul 2025 16:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VA1aM7z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5808410EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:18:19 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-315c1b0623cso2234455a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752855499; x=1753460299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjMu1e4Z2kPIqjvwczTBgX85r3dXx3nHkHeoGheSPn8=;
 b=VA1aM7z5pmsOx5gW+mBaUO34Nul7dV1J/lsczNpvKCIMgB/ee/Kq2qimcusqEX6r+w
 O3ZRzLLm46HmAhRGk9GSgyUulcmug7FX/kawgyx5loqddzZ2O+RT1ChaYwuWICgz3l82
 ta3oBR1CXUW7eKzdOwujSwGWtXX2/SktCuILc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752855499; x=1753460299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjMu1e4Z2kPIqjvwczTBgX85r3dXx3nHkHeoGheSPn8=;
 b=b1AEuH0N+Q5FQu9uJJN9A/Lmtkzt3HCBUc+CKZGAPyI7kkZOsMtIJHfzo0lw7Ecqb5
 HbIdkcwMGFVHsW/8zvmKdvo2ShnpcRriUaaxy40AeipqptkpzPqX6psfebeSgnpqO/zL
 RTSZhi1y6dcR1O/b+HyPQzKmz337xRToriZwFXftEBT0ITa/OKWVV2Yli1GL59fMdgwe
 zs6du5Glppu23567so24tdqIWeoh4lJdH7MLiQLLOSywNv33rZpkJ1jf1qY72I3fraOB
 QZUnlnApn63krws9ZyeubAye3/or22i+g59ATWMu7l/BOERYeOOCtsYsR4T0D6xcdoD3
 /AGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEjif2B2XqCT5/06d4O5k3EHa1+6sMX/MCTGuVh6l78fZwU1izAH/0S9PA0nHbjqmE6wemA/7lzzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF4Veun9p1myjwUuDoO5jd4EG3PY7Rw1rhSjJPjIUjQ0DdlgJz
 rC3rjkPGtvz50WdN3r5xNHsvZSUbftwS8LLmmToZekmx4Jnn1yPCTCggO7C1KlRaCcuwXxXMFYf
 qH4A=
X-Gm-Gg: ASbGncvUB76A+0tYnmOnGiqyEwfNoyKjKSZTJ0woqX5dN0BaWCsi8m8KYleh2y3i58+
 /sYzY1rLdi4vBHERL9IoHdwJu2jfxINRsS+a2ZeBPq707JgeI4t3QE7L7ROv76zuvHECr1VefBX
 eS7bYcgtEc88cedGS1nQUEMi9mg2T2QOGBl8h/WaQbKf6z3AK4pNCY5nm0KIfBDzKw8ex+Oi9rr
 yGWDAlOuvE7yyf+Gh23vnAf6/oi/KbsyWpGeep98epXNxTbAe7vi2yzan/CVAP2dLa3xt56csmX
 VYgxkIkmfWNdHX6uSRY5HqXuxokE9PQB16kKAWvkaVen6n9i9GXqlTZh00zrQAD+W8Toyvl/8Co
 wfbVgScc+ldlGKDJC+tzvVMUITSvK5XFGI49xdRm7VSpAIXPo6riw5BRNI2dHyqLsKzp51geHd3
 kL
X-Google-Smtp-Source: AGHT+IG5P7FlMF5dsfjIMKEeeHJBnh78ft1+fJQf7BAztPXrQ8QzcCAwBv80pBMzvt/dNrsJ/LTYQA==
X-Received: by 2002:a05:6a00:3d07:b0:756:d026:10a7 with SMTP id
 d2e1a72fcca58-75725a89319mr16770649b3a.21.1752855034330; 
 Fri, 18 Jul 2025 09:10:34 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc6bf14sm1456321b3a.158.2025.07.18.09.10.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:10:34 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b3220c39cffso2203964a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0DgWu9D4fcLLN6cTszg8Ym/aVr7q+H6Pe3lsHhEWQGWtbCI6w9cQyd0mwfgZfx7E86fm9wzmWj/s=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2b4c:b0:311:eb85:96ea with SMTP id
 98e67ed59e1d1-31c9f3c5719mr16511405a91.9.1752855033213; Fri, 18 Jul 2025
 09:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 09:10:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
X-Gm-Features: Ac12FXz_prqGT_YDn81ubqDHwEClWFafCp94o67Bin1GS3o7VQCq9ZD3Qej-Cnw
Message-ID: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Thu, Jul 17, 2025 at 9:41=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dual macro for panels which are driven by two parallel
> serial interfaces. This allows for the reduction of code duplication in
> drivers for these panels.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 369b0d8830c3..03199c966ea5 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> + *
> + * This macro will send the specified MIPI DSI command twice, once per e=
ach of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * @_func: MIPI DSI function or macro to pass context and arguments into
> + * @_dsi1: First DSI interface to act as recipient of the MIPI DSI comma=
nd
> + * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI comm=
and
> + * @_ctx: Context for multiple DSI transactions
> + * @...: Arguments to pass to MIPI DSI function or macro
> + */
> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
> +
> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
> +       do {                                           \
> +               (_ctx)->dsi =3D (_dsi1);                 \
> +               _func((_ctx), ##__VA_ARGS__);          \

nit: shouldn't func be in parenthesis for safety? It's unlikely to
really matter, but just in case it's somehow a calculated value that
would make it safe from an order-of-operations point of view.


> +               (_ctx)->dsi =3D (_dsi2);                 \
> +               _func((_ctx), ##__VA_ARGS__);          \
> +       } while (0)

Can you explain why you need the extra level of indirection here (in
other words, why do you need to define _mipi_dsi_dual() and then use
it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
performing some magic trick I'm not aware of?

Reading this with a fresh set of eyes, I also realize that this macro
is probably vulnerable to issues where arguments have side effects
since we have to repeat them. I don't think there's a way around this
and I think the macro is still worthwhile, but something to go into
with open eyes. Possibly worth noting in the macro description? We
could probably at least eliminate the need to reference "_ctx" more
than once by assigning it to a local variable. I think referencing
"_func" and "__VA_ARGS__" more than once is unavoidable...

Maybe this is what you were trying to solve with the extra level of
indirection, but (at least with my knowledge of the C preprocessor), I
don't think it does.


-Doug
