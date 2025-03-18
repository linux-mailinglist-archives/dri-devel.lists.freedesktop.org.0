Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81364A67B70
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3191A10E214;
	Tue, 18 Mar 2025 17:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BOvQEXi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBE910E214
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 17:56:39 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30bf3f3539dso59128811fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 10:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742320595; x=1742925395;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ptw41iPQYR6728ZX8PJ0GiZO8H5LJxzZSU14XuXmLA=;
 b=BOvQEXi4N3bLNNGbKwB4DWORmKO5riGyL5LJ441vLqHnt2R9NvkzXK9R2oqz+dmPwC
 +Ht9zk/oyyt20fotOJwjI8RP0he62c8PYgxYi29uHmjzcUN7wgH2aeaYv5dlY2t+JGb/
 xH1SJC9BbvRDAXSlREZPWGvpFbzqmpOyI5PRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742320595; x=1742925395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ptw41iPQYR6728ZX8PJ0GiZO8H5LJxzZSU14XuXmLA=;
 b=H7YBEAzySUU0GoATNPaMlQnpYC+aj/BCcF5yPSr07drazQvXyw28PU/K66S659UIy5
 MNcO61XVwCceAcrFTFdwwypNuJWzZ4C7kaShnktWGTjmIifHG5Jaq3utwtRj9mErx18j
 QnlTJIyNlaRZGYC1txGdcES2RpoDwsfzgRr3AgWTxke5kl4mGUQezKWM67dbZOlN3Pu4
 edd+IYOdK6uD1MVr9H5gqoPYAyPE51sHri+IIfnO0eq8OkrR2I6bW/InVnBLN3UJIIqH
 8vmvcCrfmlRuFY16OGpalIga1TMUqaW+Vv6/ZnuLCB1NVGHz3ge9Dqh3B9/WnTHBPEoX
 AXVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV06y58YCT3kIMQZixp+lNEhCfoFXPiucTQlNN3BPM55CsI0e/cShfUnWwUtj8Na1kxGAt5uXgois=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtKXtQeq8FAxtcLoOZQCs6cMPWmHSY9koEZSsYE0YG+mH+wDFw
 /zo0bN2wpwwEdlbh7WdgvbNj5qwfVnfwtxl0rz+zHe0xH0QtSIzRhm3MFAEqmkzSwZbo8X6GMXh
 eqQ==
X-Gm-Gg: ASbGncveiCMPl+2jgA+AFgH5kyqA+tN5/FZJFXIVS81hOHQZDotEkMskt1J2wBNGoIh
 VE3SEr++Dkx0zk3fb04ZsQ+QZU2GV8EY9ETMMWzSg98chOoTfZBxmDhbkKfTBossMISXREpoxPl
 9Ke927wMdEeKT46f+AUyCwKUKcTxIjqyp5l3xyRRuQgJ330v+LQiqz/iK4+lZWzf+T8FCCMlYHk
 T3CIsvh2oMMpj9HAQ8uiLtbGOxqFaGgRcFsygEHEow3K3LgcYIdzeTzA8+xk26U0r/GwXYsH4Xq
 rFY/MfJoee0BTVIVfaydDvpVTfQWtK2t367UQr0XQzJo6LH6oqPKPllE6nwXggp/Z7U3n0LWXwo
 qplK5YBbL
X-Google-Smtp-Source: AGHT+IF8UnhZTN10SDCx3smtAoIZXyjLg9IbodklE9WoacUbG1ju34tJYiA3i0KDtNM3tqOwQohNPQ==
X-Received: by 2002:a2e:ab18:0:b0:30b:9af5:9549 with SMTP id
 38308e7fff4ca-30cd958732amr38425701fa.2.1742320595143; 
 Tue, 18 Mar 2025 10:56:35 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d6340ef71sm2415261fa.23.2025.03.18.10.56.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 10:56:34 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5499da759e8so7808330e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 10:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0kEaz2OGkrXVHGcJClCx/lLegfqQav9TpnnJNiew2jjuEeY+FAbJPNKRljwk7KAVmKonVHfn1cP0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:10d6:b0:549:74a7:12ce with SMTP id
 2adb3069b0e04-54a30486a73mr2802359e87.14.1742320593086; Tue, 18 Mar 2025
 10:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Mar 2025 10:56:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
X-Gm-Features: AQ5f1JovMX3_JB9V8QSJq3W_8Y9VFCM5iRqj4YkpDH-gdoHjWKF2FDKzoiar_Ok
Message-ID: <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Tue, Mar 18, 2025 at 8:56=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Read out and check the ID registers, so we can bail out if I2C
> communication does not work or if the device is unknown. Tested on a
> Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> not enabling RuntimePM for the device.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * switched to a new approach suggested by Doug (Thanks!). We add a
>   dedicated read instead of using the first read. This prevents creating
>   the aux devices. As a side-gain, we check now if the chip at the addres=
s
>   is really the one we want to support.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
