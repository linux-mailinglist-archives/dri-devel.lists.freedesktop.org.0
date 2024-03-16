Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F387DB24
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 18:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB75810F8A6;
	Sat, 16 Mar 2024 17:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jA/yGjox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A74210F8A6
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 17:46:10 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-db3a09e96daso2751620276.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710611169; x=1711215969; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/jDQnfexRAaZBb4mA5SjsUMEcUJqWlLJO4zyEq1ignU=;
 b=jA/yGjoxlFdgvg2TNpWHVUjQn2PbAFFaTdbxVQsjJS5R6V8LlA5qtR3g6dVGwlQB25
 i2UPQjv5G3bOhCXmiMnAt6T6RDn8+mWl+0r3YrRFag+OkMCsA7vj4Bc99qt+MT3xvZO5
 DwDATiBnlG4TZO6ByHjDC1Wetu3dwu/y1njdz+hheZxvx028HgVG02DcEt0PpQWseAXi
 g3iCd9mJRTNGBcQXmEWVkYfVN7VljX+Cb0xypyNtbu88MwIWy83PI68ltSKIA5IeXZFi
 XOyag1ORphdehP9i3HWMqA1P/ZNGtTpue1sQr38ti6Ed/t20tZQxwQck9/+A/3cT5tsH
 KLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710611169; x=1711215969;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/jDQnfexRAaZBb4mA5SjsUMEcUJqWlLJO4zyEq1ignU=;
 b=klqC0cEN5mYW0la756xU5WqEV4QkbSzc9MhJNxZVm+jeqEmXnQ8U4ZShV/Mn0Yrcjc
 0Mc/2UiYLY54vsOwLJYfNPVma5PQVtz2+4+eWhRagIhhM+1ZbJPD1ikJkwJy9Hfl9ooJ
 /HC3XF+ZIQZHKdf864QIfBwaNUGnxoDl9GsSgC/asKlOO5VJ/mhEN3eU/mTXEEr6B8O0
 cQXREEcJhDe5+KPfEKRgyo3+MQ76g12rDv3hpe/nj+lCmHd9tOt9h4wVImeQXFBKatDh
 cwZszKUsQYNh/dwcvDkKU/pMF4Nq/wNIcldBp73PLF6HJIGdGbe2NdIrvSad+Hx4jb4D
 xkEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHRZEqnOwxCBfkRVV88aI2ASO0IJD3u1199zrnNrG+eKqbrQ7qYlWfSrSjRnCG4C+NdrrSEJceNHUTwqAN36kfIr3NjYBa3zelmHsobxHs
X-Gm-Message-State: AOJu0Yy/X5ee4tPUa85AU+BioY1ooDOYUKbKUlH7L1Oyfhcr/i6VX38e
 zMs4nLTQNSMGUkcDOTMmedvJ7ExWVdYDmflmpoX5JLcWen5gG5csU1KyjQm2dI+IkZh7L4tBdF8
 Aany8gLkA/S9OGcT1YeldcgBb+OiKVnp2ZsP+AA==
X-Google-Smtp-Source: AGHT+IGdC5E7PAsxboi42yhdSl7XjiyhZK/iuxmm2lnN7sgPMVcZcSoWPk2e/QRJOpCUBVbGokHqNfQucKWzg0H4Do0=
X-Received: by 2002:a25:8485:0:b0:dcd:a9ad:7d67 with SMTP id
 v5-20020a258485000000b00dcda9ad7d67mr7019806ybk.8.1710611169344; Sat, 16 Mar
 2024 10:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240316174419.1170460-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240316174419.1170460-1-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Mar 2024 19:45:57 +0200
Message-ID: <CAA8EJprwFdTfWYRprRL=Gt3PrnQeH-SnYAPvYEfr+=kM0G1H9w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it66121: Remove a duplicated invoke of
 of_device_is_available()
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 16 Mar 2024 at 19:44, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> The calling of of_device_is_available() in it66121_probe() is duplicated,
> as the of_graph_get_remote_node() has already do the check for us. There
> is no need to call it again, thus delete the later one.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 6 ------
>  1 file changed, 6 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
