Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF6A0BDA1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040A410E70E;
	Mon, 13 Jan 2025 16:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EzBnIugc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EB910E70E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:34:28 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30227ccf803so36066191fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736786065; x=1737390865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VKDdKy7Nqh/MAKJF5MQL5eR+bY7QvotCQIADHv5qwOk=;
 b=EzBnIugcSOYk6+QagHyMIbnmqF36gyB2Wiq7yGqEBIfCX9GUt5neHqTno64eCM+wyG
 ycylYzE3pvHyb+EN2yew886RnjIgn1l8lfca00UvXehzflWyOHyyeYZjzXIq88xh6aWy
 X/oYyT9urfXLR5Ut1LESieFig/K/SQfFfWmvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736786065; x=1737390865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKDdKy7Nqh/MAKJF5MQL5eR+bY7QvotCQIADHv5qwOk=;
 b=ufWm/8242sPa9iYwXsP5mfXplXjx1cKTkar1NEaXY16bNgGbnCLqn93dCaHlElT425
 KTLsX3fUcS5dWG9Se4mbszT3r5y6XOzcbHGvg7Nil61PfrZMTJDhvgvs7nmU2CYgrQ8P
 36XrcoIRLA8DV6154dbLSWB+eqoF3bGsHydwBK9aNf+HErkPi+5GDr0WVTvanc0hW4t8
 SCDo7X9eHyILSRw5oJZYUO2aSEMzgdlcHRSQimmc4ahUZ5dPbKuHs0BoBAc07K30XIOf
 mCwR3zh5t/RoiRGoBE8KTo6t1OLw0q3q8ZqB6LMbnoVzQDRSJ/46FJTTXXKvqhXIx6+w
 Q+Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVazc849c0il1rUAuJNDY2FQKMI7Ur9aZyglxEiotUcK1+b6nEZf5PVqkhykp/eokMk/ljuXg8tasI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKb0st4ScnHXeoGzOW2b+Fzt8GL8FK4GNP5r8N2lUFJeeqVZ0F
 VTXAZaG1E0q7vci6ROvMarm3aqkOoFeIs+CBtE9/QS3bHBrNAvKpj19INlFk7qs8Mhlrk4It/je
 NMw==
X-Gm-Gg: ASbGncs+Y9dxBTRy36XG42f7lvpfgF6ld2u62lumQdPIsi/MMUaVtuYcqbcOp2O0nQo
 NIyZhfJdde378gm8JH37orDdYaoGJ7DeNHEtItQTgKdEQJ+PTg5KvfSfZ4dBoloQQ9D/qHR8im8
 nznJwEkefbKDSDjWXOq2z+x3ZxBe0iY2IMr9xypnsM5x7wkgi7vsMjGDKU9rP3m5fhbuPMe44oz
 1ZrsXFUXdMWtv6siOA7+BHHv1l7Wi+85jJRHsgOzFxp6Q6QjwA/fR3G3mamS/2G+LE7/gXcFGxv
 gpNSSbrE8biZtEOWCbwc9EuR
X-Google-Smtp-Source: AGHT+IHBWU5IX76ZiiFxI6c8ULDpv4DyII4OHz3dCoUhcSND820gWMD3VxwgcbOQO4Yw1FldYBTv0g==
X-Received: by 2002:a05:651c:541:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-305f45d2280mr65678821fa.33.1736786064583; 
 Mon, 13 Jan 2025 08:34:24 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7af6sm15241761fa.92.2025.01.13.08.34.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 08:34:24 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so41636901fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:34:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpsmTxGrK+vwVVjoA/BNpvgA1/57zuwGchdFmNhALt59P7JPpe49jBEuewq0C9G8iUN7csnG84gv4=@lists.freedesktop.org
X-Received: by 2002:a05:651c:1548:b0:302:1c90:58e5 with SMTP id
 38308e7fff4ca-305f4450612mr70512491fa.0.1736786062606; Mon, 13 Jan 2025
 08:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20250106041129.114867-1-tejasvipin76@gmail.com>
In-Reply-To: <20250106041129.114867-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 08:34:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V9DJ1GsuhhkBkbPy74_Aob4JMKUtyZwJph=dy=cT+5bA@mail.gmail.com>
X-Gm-Features: AbW1kvaZ_Blk5eSgAwqjAlx5yqj_RjhhgRnRrcIjj-oKKPzho3VLV4s2Uk_C5gY
Message-ID: <CAD=FV=V9DJ1GsuhhkBkbPy74_Aob4JMKUtyZwJph=dy=cT+5bA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: jo@jsfamily.in, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, Jan 5, 2025 at 8:11=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the ebbg-ft8719 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 67 ++++++-----------------
>  1 file changed, 16 insertions(+), 51 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped functions
      commit: 0d6c9edf9e5b25361bb23a151ad162878ecd81a5
