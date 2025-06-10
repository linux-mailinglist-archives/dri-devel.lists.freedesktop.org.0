Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F11AD3F12
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33B310E320;
	Tue, 10 Jun 2025 16:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hU9Bzano";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E910E320
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:35:28 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6facba680a1so61006676d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749573327; x=1750178127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRKty4r5poxGqV6J4DOkHwQy0EnjswzgP31JT1/VNiE=;
 b=hU9Bzanott5d8qmt9xA5u4w50nYXKwGlEsdUC5WMcXWY73nFYYp19rrPFITvbHHBsQ
 QWnOyc4fgeLm0H5rCyRcDoN8g+y5kD+Gq00ufGSnzVzg6dNrHzARfNrUwXEB8DT3LbwE
 FbOmiUUEZxdX7LaKTZlz8n6NUgUEK4JcK67CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749573327; x=1750178127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sRKty4r5poxGqV6J4DOkHwQy0EnjswzgP31JT1/VNiE=;
 b=KGJAHHCeFeR0fC49l3UUIkENwqeyuuN462xWgRJhRKXSOW66FRQrBtdVVsMaB6YDTo
 K0V44IpeEltLCqeodJ4FO/0K6orxqLnYyJzD7WvvMbdI7LO2Jc/QaswYqY5+LWwA7rqs
 EqWuMP56OK7Xl6ZpdXY4OmjkmQSOex9I7r2BfzkoVG/EA2awajHxC6CYM3WZFwXKGNE6
 gnVIKOEEqyiTIK+sou2MzLPDT/lu8R8rJqQ4Y4qcrCEnhj6lL/s5R8PxFcNG7/uw4iRa
 u+YpmotZYSArUNxKlHSIXsQDO0SW1R/Fm3GWX5T51CWNAZnyfLbq5/YFv8Y0lSWDlFPJ
 YNvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLbhcU9J7i/V4BGY5n7wI9UePBtug4OjTSYWqO1mPYeMYPmZEZhgqfkQ96O4w8F4S+Qb0tPfchJW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+I9SKlVwCM1HnnRwyM13f+w2/hiEuRdBczh9B563lRY1Z/QwC
 jX5Rr/W5XyEuz2Rh/6Sd1Oz5IGr01p31gP1E209RhqWfKJfNWwU8pEZDApx3I5go7DDehBtdVyt
 Bn+6Ybg==
X-Gm-Gg: ASbGncvyDqkZ3Wk2mlRFzPMnlPGSpS/d/WqZcOxyhBQ04mathjVtRpllQsHC6UTmlAl
 XJqDFbRvLPUwr4NvqA7c7CnMN7AlycDrhggIanGT1TFVgaPn21z9sDtjzg52zgODGUoL/vGcfTs
 8PnnJaSjexDYw/p8o7d3nj03B2nSV8FB1rxZK6d4UK0G7WnZRtfyAYhHohI13nIYRjSuvAIu4Ur
 BmyFFJJ5T8gPMLzbsTpDv04FzaT3+5JCyNWKOk9BCA4kHsU7yWf38mv1CRNN+38habwhTa/BI2G
 Us93WHHGBXt/qZR0LqqeIKI+0wHrbTuZexIpfM2GO4BDCGnmWGB07ngvxamdXfsaPg96u/4ZYzY
 NwzsK8LFaTkXVktms2CyEyD0IZ2Hf+A==
X-Google-Smtp-Source: AGHT+IH4RFwkTtFrWMbbzKZapnFI9n8qSpwmU01ZZNhs+6rQPAIaKK0uO2zqo5QXatyQ+2bG2wGUyA==
X-Received: by 2002:a05:6214:29c6:b0:6fa:c6e6:11f9 with SMTP id
 6a1803df08f44-6fb2c325883mr1636706d6.11.1749573327309; 
 Tue, 10 Jun 2025 09:35:27 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com.
 [209.85.222.171]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb09ab95d7sm68535476d6.9.2025.06.10.09.35.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 09:35:27 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7d38d562a55so319545085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8MGPQlwLySnij8CzDw/pWAZTcflCRvZ30xytGBdiBtEMiQ+uFAhQWZbzBrUHiEbCxFE42DTUvdHY=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3949:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-313af21cf49mr214070a91.22.1749572858943; Tue, 10 Jun 2025
 09:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 09:27:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
X-Gm-Features: AX0GCFvetYujnkiaHWr_4-CoTJH6_0-yjm9ImscbNd_BInX3tRbNZVj0ki_sWAE
Message-ID: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Jun 10, 2025 at 5:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Looks like this should be fine to go through drm-misc. I'll plan to
apply it next week unless I get overly distracted.

-Doug
