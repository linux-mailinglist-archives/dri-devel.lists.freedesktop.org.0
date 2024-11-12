Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDCD9C6443
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 23:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3B210E113;
	Tue, 12 Nov 2024 22:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fLzdMfoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AA010E113
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 22:29:53 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb599aac99so59952101fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 14:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731450591; x=1732055391;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMLlYAFDqKDkf0WiPqQcIBDe5t9vWTyk5bdOv0ivtJ0=;
 b=fLzdMfozSeWFQw/JNfnNv+2NCqGI6f+U7NUYnzvnd93+/+nddLeenFJHTI67e3gWSA
 PRqLUVTcuzXDqGaix5PxbAKF85eo328ndarB3NbgwUtsd32eHTdcfMvddiP/xDFzRXZ3
 M4yvgvI7tkAcS1iFK2GhugBH286qnRFVXHk+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731450591; x=1732055391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMLlYAFDqKDkf0WiPqQcIBDe5t9vWTyk5bdOv0ivtJ0=;
 b=VDlLcf6nF47UyKYWHQ9rgTfI96cYRJtrCgOAQ6ZXI7tZT5yjAefSu0Xbtfp3i2gC0B
 daYnmwAWpuPoD8rg29pNG/uJ0KKciqvD41KGMADN4ML9QGCDUV8ZKzuQkbhNjRN/0V+B
 J/z6TGSWvCZlVpHL0v+0qayjGIJf5IMSOk6B1P/7QsLCa0K4Pyun58EeJJIq8+ofvdVK
 NhrQ/xZoCD1Dszl3BN2UObWDP4XldlIevZbAiNVNJCWC5Mcx+0DFaGCJ57Y2M4vOo9pq
 Plwali2aC+/QtIdVcQeMndAEkjmpAnEq40FybwKKWqwcDHqwxVCfQ/b9AI5YhfSPABbZ
 xZ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0hMJb3TiMH5pxZkRv2T80eWdAglEYqtu3lIznHrNiUMBeWMmUHUKp35kROrKcNF5yd347CYVdjAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8TcxH7lP2NRuF17O97zuTKpeji/euvDtdo464MKYF38ouIxZQ
 37Ny/pzD2ewjPL2TwibaNcMd9gme/2QZXStjVQOfmZsPDlJHudnmUSxk0H8pGaJZuSXvi8Yvfdk
 RvQ==
X-Google-Smtp-Source: AGHT+IGdZam3vxPn4AxZ9N5IZPvhnT9Mcc0wte6wli6YQuXdCIaMv9vQC2B5qiW+QD4QAI9NR0LHuw==
X-Received: by 2002:a05:651c:988:b0:2fb:8df3:2291 with SMTP id
 38308e7fff4ca-2ff2016d246mr92221901fa.16.1731450591299; 
 Tue, 12 Nov 2024 14:29:51 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17991b49sm21458371fa.86.2024.11.12.14.29.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 14:29:51 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb559b0b00so51818371fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 14:29:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWm5pDUA7oIhcwz9BlcOuZ18fhXgkFJCd3lKmg+cwyMMBu2/m06dlN2cKXKXaveVmh5btyU291D8rk=@lists.freedesktop.org
X-Received: by 2002:a05:651c:158f:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-2ff201af817mr81726791fa.24.1731450590306; Tue, 12 Nov 2024
 14:29:50 -0800 (PST)
MIME-Version: 1.0
References: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Nov 2024 14:29:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJ=KVbopwovCvqR=WKi-pdpj3c5dZ57c+uUMh1ryk=+A@mail.gmail.com>
Message-ID: <CAD=FV=XJ=KVbopwovCvqR=WKi-pdpj3c5dZ57c+uUMh1ryk=+A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Constify struct i2c_device_id
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Tue, Nov 12, 2024 at 1:12=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct i2c_device_id' is not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   15566     987      32   16585    40c9 drivers/gpu/drm/bridge/chipone-ic=
n6211.o
>
> After:
> =3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   15630     923      32   16585    40c9 drivers/gpu/drm/bridge/chipone-ic=
n6211.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c   | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c      | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c      | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Douglas Anderson <dianders@chromium.org>
