Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996FB59AB4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 16:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B4410E0FF;
	Tue, 16 Sep 2025 14:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ISrma7zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6EF10E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:46:25 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7761b83fd01so3846735b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1758033977; x=1758638777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inmx6dNf4InTlZUGwu0BdN5CX9UhUArnuNUQoDKHWD0=;
 b=ISrma7ziS8HJOzKX5RNkovDeOHfcXwrqAf4Z/VnS9G3XubfMAnMxQN4Sx5TS/RuhCR
 lgdiQxhYvj+nHiaT7w72F90UrHC2Vlp2u/rn+bK+GKH6gnUTPnC+1wa9C1Geb6OUojM5
 iPKxFPr9kc/k8dZrK+c7QSvDqg5tAialeFKrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758033977; x=1758638777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inmx6dNf4InTlZUGwu0BdN5CX9UhUArnuNUQoDKHWD0=;
 b=VF/uLYlYJnF1xRRWhDPSGD1lzgN0O6rE+JGg6vjf/JquLZ+labyKkEuXQbJrj2UBOk
 Acwg/oIclARJYMLYqX9hz7TjthcwRdBOzh0lCsvq8Fr5jQt59d9lFr6A7OTBm5IIb12S
 0OkC++X1l21GzJxtfwWmYx2f/O9lcKZw4NeWOn063xVBC1PVYxpfsV0IGfy4shQXwLkQ
 AfXqibWTvJ2Yt0xF+4ChUwl38RDyjDQFic+IWrC9MCXM2zNzsMU984ZShQHAsu2Xl3wf
 6H5hIfCE86c/rvPj8iKKo49w0ri+/eiUa+MqhFdIswcSG8mEb97i/MNaw4fXqds9+Hzt
 o4vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrrrZpMEZZH8nIm8nVUtnA4pUJvv6K/SsPuIItQeZuGZxrhrxb3Uq59cXDbiWx9HQyQs00eWcacC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Onkv7Yy1oVXER9qhX9v0dEnv50cNtwT3dNJMVROLmONIHSWo
 qlnKqMN9rD2iMLUMMgq3HycI4iIyAFcnY+b80phf7BsHGcImPZLXYbjEHh8jQVJ5zuKfdkNvNdv
 EWtU=
X-Gm-Gg: ASbGncuaoFtfR+YuVI+yiLuBUeA5kQjBgX2LCa1yGTgQPsbtgoHkCbpNVyJdrWAOZjE
 j1Oiy1J6NE09vQN6jJvpgl1EWEcIdVEtT7nFYvReHnfZMOoYNXXKjCP65sM+edqqMLgsH5GYTDP
 5AUX4BCecrXgjy5coD4RtLTe3lzvlCrdByXVzlSVQiIq28v+U8Ow1GDK1ENirj1sBz3UZzwng+w
 OxPSmpp7oCKMgAGA1ajmMIL7k/Gha39FSnOmTyy3y1ZSmAYdPjX3jpvwM2i0EtFj4PM23NM3MRN
 qaJNXIjWYh3rJmk2DT5TFW0Z0Dmcm/Bq98VAhFFPwjpk4/DaR5fKysgd7CSTUuxTaLIhV+XLZeR
 kz2HlO/4MhsutEECFQ+D5gSWk/Rhw6mi7PVpwz5eMVkL0v2PDyOpeDUSvU33PaR8y+A==
X-Google-Smtp-Source: AGHT+IFdHNErDYQ8S/nsv7U4gEAowOOvWOV1yRZaHeQ5Bz+j0qTHkeqCbgSMm7dL8+CHhTj4K7gDvA==
X-Received: by 2002:a05:6a20:3d84:b0:263:2d52:cc96 with SMTP id
 adf61e73a8af0-2632d52d2dbmr13710309637.56.1758033977454; 
 Tue, 16 Sep 2025 07:46:17 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a399081dsm14641358a12.43.2025.09.16.07.46.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 07:46:16 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b4d4881897cso3642904a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:46:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8XKKVaNiIA9rBqXvEyuvJoy5U1eZZJzzvPBrEc7UOuaTfAr3KbY1G32aONzgiXTKXW5rVuZVWPPE=@lists.freedesktop.org
X-Received: by 2002:a17:903:1b66:b0:249:37ad:ad03 with SMTP id
 d9443c01a7336-25d26079287mr167604515ad.34.1758033971727; Tue, 16 Sep 2025
 07:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142047.3582018-1-ghidoliemanuele@gmail.com>
In-Reply-To: <20250916142047.3582018-1-ghidoliemanuele@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Sep 2025 07:45:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uftrv=x6CuG7edLCSAi16Kv=ka7qxPViuLM=BEG8pC3Q@mail.gmail.com>
X-Gm-Features: AS18NWCjwmqu4t22vUwtzmrXP4GFZo312uz90IvKcUJ0ZtK-nxts3dyYnOQvG3c
Message-ID: <CAD=FV=Uftrv=x6CuG7edLCSAi16Kv=ka7qxPViuLM=BEG8pC3Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Transition to LP mode on
 every video line
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org, 
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

On Tue, Sep 16, 2025 at 7:22=E2=80=AFAM Emanuele Ghidoli
<ghidoliemanuele@gmail.com> wrote:
>
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>
> The component datasheet recommends, to reduce power consumption,
> transitioning to LP mode on every video line.
>
> Enable the MIPI_DSI_MODE_VIDEO_NO_HFP and MIPI_DSI_MODE_VIDEO_NO_HBP
> flags so that the bridge can enter LP mode during the horizontal front
> porch and back porch periods.
>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> ---
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Jayesh Choudhary <j-choudhary@ti.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <linux-kernel@vger.kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I put this on a sc7180-trogdor based Chromebook and the display no
longer comes up. I don't personally know the MIPI side of the spec too
well so I have no idea why that would be.

-Doug
