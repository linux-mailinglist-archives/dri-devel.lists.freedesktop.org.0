Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E72827658
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2F710E28A;
	Mon,  8 Jan 2024 17:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DF710E289;
 Mon,  8 Jan 2024 17:29:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55590da560dso2406907a12.0; 
 Mon, 08 Jan 2024 09:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704734956; x=1705339756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ua13rckaX6IcN2JX4lPcwQajmKp53ySSBDtbR1sUbTA=;
 b=ZtCH23/wx/ccOJZH1ffP7u4CtIXyWBPj/VEFXRUrO38lTlfzMwmexKVrmUHqtsD42v
 hRMKFXJlLqI5P3UgTxfEMCV82IGDQbeHotG+5KeV7EZRCki6+GCRU6rk8KQXXH9mLIui
 Ut54BGbDQ0qvZGUbBys0U4xoFQ+pSPkaytKRKP3HgcIhiQDIau74MRe4nAB9DpkMB8XI
 AOAeUcMElb3LGrI6Y407jvbUeNwRimHO1AjaA71cqC53Ww9EFPOHMDO7j+Erer4Tw5gG
 upog3MFLMzZBlMtM04V1n+/QdBQa1PheoY0u4VqtSSlE2zrq4ZO13DBTkn/l3CPnPNhx
 3+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704734956; x=1705339756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ua13rckaX6IcN2JX4lPcwQajmKp53ySSBDtbR1sUbTA=;
 b=EjovnM/P7GsBcea5jt5a4xiCtRfZGrKfla/tyCudQ7CqKJvAZQhhkJp3Zu5YSIGw7q
 fbx4730DzdQhvCKWmACwHAPLRbGp+zUErEktR4okIYQCkScAuxhnSR3YZxO7mYx2cPO2
 UFSCxM1mRKf4lNKNff14x/rizgQr5UbC2zqCHiLCh97ayzNI9+gTRdxHx0h0rJ3ZjV+Y
 s3c2PuKfsC7MVS4ilfKlArx268cdwZpymLW5ia7HtoeFbmlX/SRntFjNpYsGYQ6WIZdn
 lC8kpanxnbyPFkoZDn3rVgJDN6tXZ7DgXRdipl56AVej3Ja6geL68bT//0CA1zU4XlF0
 ahUw==
X-Gm-Message-State: AOJu0Yyf3IzYE5olM/LeouidCOhmCaj2wN2myQpTqmUbXu43jaUqz/8l
 N4YxSnWTJdlHPWMeUFzp//xlbmmt2mJgBdTo3VvT8lmQ
X-Google-Smtp-Source: AGHT+IGjQR33EnmQTwXgU/JBGV7A4pz8l67HVRc3mFoYW341+660YqLy1DXE/TfXDhAWZhtEhrDfLCZ8keyF+jiNWEA=
X-Received: by 2002:a05:6402:b03:b0:557:427c:1c2c with SMTP id
 bm3-20020a0564020b0300b00557427c1c2cmr2043858edb.85.1704734956129; Mon, 08
 Jan 2024 09:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-2-alexander.deucher@amd.com>
In-Reply-To: <20231207180225.439482-2-alexander.deucher@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Jan 2024 09:29:04 -0800
Message-ID: <CAF6AEGvU4Kn=oy1QOOhxOX29368H8jXXjuzUkdQCtgeths5nOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: update drm_show_memory_stats() for dma-bufs
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 7, 2023 at 10:02=E2=80=AFAM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> Show buffers as shared if they are shared via dma-buf as well
> (e.g., shared with v4l or some other subsystem).
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rob Clark <robdclark@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 5ddaffd32586..5d5f93b9c263 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -973,7 +973,7 @@ void drm_show_memory_stats(struct drm_printer *p, str=
uct drm_file *file)
>                                         DRM_GEM_OBJECT_PURGEABLE;
>                 }
>
> -               if (obj->handle_count > 1) {
> +               if ((obj->handle_count > 1) || obj->dma_buf) {
>                         status.shared +=3D obj->size;
>                 } else {
>                         status.private +=3D obj->size;
> --
> 2.42.0
>
