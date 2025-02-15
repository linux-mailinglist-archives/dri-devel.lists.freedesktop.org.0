Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22638A36A09
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506A810E03E;
	Sat, 15 Feb 2025 00:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Bjydhyfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9157A10E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 00:42:32 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so1039693e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739580148; x=1740184948;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5/J1cbeKvcU3X1p/IOGIvH8IpZAtkyHcUrQchvpscnI=;
 b=Bjydhyfqi4XOmpx2HlVx3B6L46yrQW9pLVxIwgog2u4rFFL4v3aKqzzkOGICsofsE/
 wBR9czJYMmT90UbK6khKyyfCAn6RM3XMxhk9G7GrHp1AQavQOLieU7MRdvahLHmbEeCQ
 /1ZU/0KYynsUSDW5Ti+9V4yS7fjlEUNohEctw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739580148; x=1740184948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5/J1cbeKvcU3X1p/IOGIvH8IpZAtkyHcUrQchvpscnI=;
 b=RrJphvIzI7atdj4F+0zEs40d6rS1Ylt4hQhSILFUXdJuigWDecRzTEXSn5EMKlhLw5
 7ur4u6EJyGgxL64GaPLP455v1B50kBX6d2BKnTS/sJ+f1ht2cManpDnUOwOT6j38gFdE
 w6wB5gjDxK+O4CiQFsmFyARlCIHP4dnFqfGdcSDrZC7RprsXNmTDTTbk1ezux9kQU4Is
 KXezzIlIIkRTgJq2cT3HPso1snJIXYlztY1M5bjwbvTeOsGWle6y+4npcZy6yaR1OCd3
 xlqfXvk3FCL3oxKzYqt/vor22t5ttNTNu0gTHKb6Lz7ZU2BaeyUt/zJRawiOVk6MkBsQ
 LHxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvJWitrnqgCo+j03qZt7hfkejh9zJBS7SfhpfuWLkkCD//kpeZl1E8+xS4RL14c/5RKhMzAP1WolE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrq5wTOcU75ZwZncnm83Mc0jWqNgsA+wNKwjrWfbJN1GMZ3Z1+
 bZfT2vbwNZn39+hRnLJ2cRU34bq2YXpb1wIP4TaD0uwGFOiIr/tipUHJZtgwcKYZCXOtvVQqPsu
 1kykV
X-Gm-Gg: ASbGncsfVE4W9iAuXGM6YIqYsNVYj6Q9/jaUeosbUz1huJm4McKXzches+vMIbAVh60
 ZNWhfzQ72p7nwSOkOGR9e8vxhboDgs+kw99Q5dk5vBKhdiJoGcwpka+GKa5sqBrH8io1vQ/CVNY
 6kfKhC0GUNjgk0L1xVANUHqN44ir3afmVh0W7cvdhxeRMsCVHTamisMsNyRNttJGBBWejVJBUMz
 ew6N45mDHfuzACI4O/zrRh53vaB5dPA9dSaExZFOrC6eBcrdv5NaLEcpsijIzTlUVnpeBcVf2ar
 rK7z9H12w3unv+3/RBTc8W1rEMo4YEiYdIsjEJD2miDdLkpD+lyL7K6mI5o=
X-Google-Smtp-Source: AGHT+IEdwmbTW6LQzDDm+rlLrvD73AqN6hEVM22ukmzN/tOd+fEFUB7KYAGYOwaNmXzQhL1UTFCH3A==
X-Received: by 2002:a05:6512:3d01:b0:545:109b:a9c7 with SMTP id
 2adb3069b0e04-5452fe6afa9mr394145e87.35.1739580148258; 
 Fri, 14 Feb 2025 16:42:28 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545308d4d6bsm88832e87.52.2025.02.14.16.42.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 16:42:27 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30762598511so27020541fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIyww2uuHpPpwi5dybUJcQwaoV3tfH8My/idOr7XS3yugWhrriBKQH9EJt0Fs9LEa6fFCAU0V6x/M=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b0d:b0:544:13e0:d5b4 with SMTP id
 2adb3069b0e04-5452fe26478mr426302e87.10.1739580146459; Fri, 14 Feb 2025
 16:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20250214172958.81258-1-tejasvipin76@gmail.com>
 <20250214172958.81258-2-tejasvipin76@gmail.com>
In-Reply-To: <20250214172958.81258-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 16:42:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=URp_SJ8RBhwgX1sW22EvscMA9y1OZUSu_F-79DrTFRXg@mail.gmail.com>
X-Gm-Features: AWEUYZlc1dsZ7mE3BumU_xd1MLx_j1s_3MrYKpaZYO9q40UxvaVtfpj_5FGNv1c
Message-ID: <CAD=FV=URp_SJ8RBhwgX1sW22EvscMA9y1OZUSu_F-79DrTFRXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: Replace mipi_dsi_dcs_set_tear_off with
 its multi version
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Fri, Feb 14, 2025 at 9:30=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> mipi_dsi_dcs_set_tear_off can heavily benefit from being converted
> to a multi style function as it is often called in the context of
> similar functions.

Given that it has one caller, the wording "heavily benefit" and "often
called" is a bit of a stretch.


> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -346,7 +346,6 @@ int mipi_dsi_dcs_set_column_address(struct mipi_dsi_d=
evice *dsi, u16 start,
>                                     u16 end);
>  int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start=
,
>                                   u16 end);
> -int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi);
>  int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
>                              enum mipi_dsi_dcs_tear_mode mode);
>  int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format=
);
> @@ -379,6 +378,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_=
dsi_multi_context *ctx,
>                                          u16 start, u16 end);
>  void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context =
*ctx,
>                                           u16 scanline);
> +void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx)=
;

This patch can't land as-is since it breaks bisection. In other words,
if someone has the first patch but not the second then it won't
compile because there will still be a user of
mipi_dsi_dcs_set_tear_off() but you've removed it. If they have the
second patch but not the first then it won't compile because
mipi_dsi_dcs_set_tear_off_multi() hasn't been introduced yet. You have
two options:

1. Turn your 2 patches into 3 patches. The first patch would need to
still provide the old function, the second patch would stay as-is, and
the third patch would remove the wrapper.

2. Just squash the two patches together.


If I were picking, I'd pick #2. While it's nice to separate out
patches, this is not a very complex case and adding code just to
delete it two patches later is a bit silly. That being said, it's a
tradeoff so if someone else has strong opinions I wouldn't object to
taking path #1.


-Doug
