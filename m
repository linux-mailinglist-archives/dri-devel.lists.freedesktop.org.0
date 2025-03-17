Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E16A653A7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56E310E15F;
	Mon, 17 Mar 2025 14:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S3rIuFBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D014810E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:33:25 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30bfed67e08so50279181fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742222002; x=1742826802;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDNe3093iFCHOB0BF0trzQBjwvxbWGfcsFI1fzTSQYc=;
 b=S3rIuFBkZxKNvnfL4zCHKIyZqjgxGbJQzpMkoJ/aSE0PlEhNWAG4nGXjnTHL0aIeHV
 cYv2lyMwefubS7jac0OeLvmX0jfxKWvYhSqofu6deYPMkJYbSu3Cti5Xfcag1NjWAEyi
 00sw7WB99Ex65xd4FlC9ES5mon0nXKLCRM9z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742222002; x=1742826802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDNe3093iFCHOB0BF0trzQBjwvxbWGfcsFI1fzTSQYc=;
 b=ITOnAV/yyLiZCMFjI27i64NNpE4Tjj02m/gAiVoNYPXXVbzJUJj+6MvWqfZE+40n0Y
 135wm1XbAQjlMB5y3my3Z3luF2SpTiTp41jPdGUSXrUSH0bT+UHd4j3SEWiEDnob9taP
 GGtqg5M0ppnTBil8xRNIS2v6ei+njuBQPMmPZ9UmYs5b4vzgTaRPSZ7J11Xp0okTR7jM
 q8vck53FvUIZQoQvZpZbAHZ4rDTOeeLqB93rRfaLB7IPzSZmxg2ibZzqhGPq/o0bMp+d
 9KOXMT8Q7kXW9qQ8xdKDuPwtXQAM6yCZxWwWUbtSbXiAOv4pZDseM3XfXiagmyV9wFMR
 Qv/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqfMahdtrE1sKrrsiQ+1TG2xv4zz8dLfVwmNiw40QtdCkOygRlKIXYXxYjjyUCNsnEvYMP/MDU48c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsHYkOQ2f65cVvHTx2LLPhWSTl3JwY7i6csCE8lqLvu5JAsCBp
 fLd2AfI6jULtBih6YUmqHE+Yyp2lxLTXI1rkT8H/m76NmsGlOUYpn9sEn3GnD3fsFldnk7KF0o0
 =
X-Gm-Gg: ASbGncuhv4Y6v0XbopIksOSKCbuj/iHxLZc5Xgi478jPC77eSLYpcsjYWSnSsa/sM+F
 1stnck58uT3OUxLx15WrLeA0lpO8vQt8D2BlkGN9lub0kt2ol+z4pXUx5RLlAUF+Q19jL6TD/yI
 5WMH/NorXlVSCHzSF2RmoOcnFYdLe9+9jB7nhQOiBVQTt8n8kLG3/7qksdmnf0gbcw0gK4M+w5L
 kNB/Jja9WVzLSywi3M1rMMnmBiiuwKAf1SDpd/mRtw/LNB3CW++3wn0gZAJiTt7ujmMTyZoUUb5
 bQhr2cdVNtzgVa1dB+8rYyUtQU6qpClotTyd3/yx/4oA2w3J+FDY4FlnnsWSTIPzEMXV3Q2a1WY
 1MaMmCMqo
X-Google-Smtp-Source: AGHT+IF+UqaFwgx7Txs96MFjlrOREHQBWlLAq+h91nyWI6EkTP9wacYekArWkF2+2WOX1DzVCGof2A==
X-Received: by 2002:a2e:bea2:0:b0:30b:9813:b00d with SMTP id
 38308e7fff4ca-30c4a8ca0e8mr83082611fa.23.1742222001853; 
 Mon, 17 Mar 2025 07:33:21 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f100c39sm15980821fa.48.2025.03.17.07.33.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:33:21 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5499bd3084aso4588940e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:33:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFHZe22IizmJPZi3sPbz24IHL0PJ50oBouYaixI7hl+nwk7wkh0PY3PXj1atn39JjU5ng6K/VXX74=@lists.freedesktop.org
X-Received: by 2002:a05:6512:ba9:b0:549:5b54:2c77 with SMTP id
 2adb3069b0e04-549c3924ecfmr8094901e87.32.1742221999211; Mon, 17 Mar 2025
 07:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Mar 2025 07:33:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp6NWZTpFKw-xlMJCY9hQkuIldAdH8N1R9LoiSLuWY4HBRzAz-oTXvTRMw
Message-ID: <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
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

On Sat, Mar 15, 2025 at 1:17=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Do not create a custom directory in debugfs-root, but use the
> debugfs_init callback to create a custom directory at the given place
> for the bridge. The new directory layout looks like this on a Renesas
> GrayHawk-Single with a R-Car V4M SoC:
>
>         /sys/kernel/debug/dri/feb00000.display/DP-1/1-002c
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> * remove RFT because tested on hardware
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++--------------------
>  1 file changed, 10 insertions(+), 30 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to apply this next week assuming freedesktop is back up.

-Doug
