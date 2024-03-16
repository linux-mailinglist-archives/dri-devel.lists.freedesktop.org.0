Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2887DB26
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 18:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A371D10F8C3;
	Sat, 16 Mar 2024 17:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="awusJupj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9FC10F8C3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 17:46:30 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc745927098so2728248276.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710611189; x=1711215989; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XVStdoF6Kqgdul7UWe6zXz3Om24WcbkcnMH9dz6g3wg=;
 b=awusJupjabFvDqnkB2NVxl7OG/kKZvXxqSxk4K9v80vwxuK/lAJgCm0beIaqxjH6wp
 UE6TOhLdXpb+6SZHA4GqjzlixC5V1/JpZ6PUx3F9GnWYwIMcyHPrfo5pM6lkJhU9cNsw
 z892KwKetvg+2EDkhQS1KtRZsmSybKNsWqnmQpKEFlRbjJtQtQ8U5UsvELIZPLVlGLek
 zDn5sJpFjpdqwmvaaUhu1XYZkN3rAjTbyNc1USf2YuYLiS5EFpf1XRuXRzmrKcP7RevF
 ls2tFuwvbv7YZuolOjc/Yu4/5Vn7YKO3R0mftfX5JCyDjn7GARpbkGVaiHxEAU1uj6Hi
 GIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710611189; x=1711215989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVStdoF6Kqgdul7UWe6zXz3Om24WcbkcnMH9dz6g3wg=;
 b=vp4KXP9B5aBktvsww28USyTk9xWYI1Rs8g6psbR+bASKeF9ulyY/KR2SmF5BakjXmM
 aUWiXFXg3mbF0NY8HLmB+KpOpDrgIJ+gkIteq5wl4aI9AVsR6tz7B5OMvVqFh2Z2SUQ+
 zNW/TYEP+vI91vrT3bfRIGw4tbENNnYMYjP/jWsyI5apJM39Oqppe2adXm5SrEmE+5Cc
 2XsuygD873g2i61oOzPKWJqb4Kw7aXgD6XvYKRlOSt/Fmpfdn9z7ZWI7dGdYFhkvND0r
 O0aqYqFvKjvNwC70JrxU6hnuu7/8aa0uQ8Zwd1UGuGebonOBszS5AL8Ahnd7pIfOxDiy
 gMDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgB2dzP/HLKUEY0KqNpPeztabbV/rC99Ubxs5SC1y3Ma1yilfAPU9e5DmSvLGu2gtyAa7hgQB7jMYmLwgfNOZ8b6DAVefZ8N33L3bcLKPM
X-Gm-Message-State: AOJu0Yw+PT7w92eliKLwrhtyznAWpHbIEe5JbVOeQB5RIEiT6qtfy4Tg
 RNlu+WeaFe5eOyJlPg1f5OQyhyzdD5OqJSDw4mtvmXUkG7Wv02JHcyVjbhtEw+ffzd1og0TOG4G
 TZRqaZ7z2CscQvFwBul2G1XiZjbCh8fE7T9Laww==
X-Google-Smtp-Source: AGHT+IH+FbDVsXI2MAe5r871J8YsdZsZXA8v1XklEFtC/WbQ31ONOyAwXRNZJQL5xDdmOMlI2uD0Nr+BBD8kdaNdarg=
X-Received: by 2002:a25:ad54:0:b0:dcc:d455:2abe with SMTP id
 l20-20020a25ad54000000b00dccd4552abemr5169444ybe.41.1710611189517; Sat, 16
 Mar 2024 10:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240316172800.1168390-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240316172800.1168390-1-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Mar 2024 19:46:18 +0200
Message-ID: <CAA8EJpopkcYpek5M2+KJBKnKNV1u9cxMjtMyvU3XNPB2m2z3nw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Switch to use
 of_graph_get_remote_node()
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Sat, 16 Mar 2024 at 19:28, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> To reduce boilerplate, use of_graph_get_remote_node() helper instead of
> the hand-rolling code.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
