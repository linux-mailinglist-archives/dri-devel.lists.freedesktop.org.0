Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928FA43285
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F8910E0B8;
	Tue, 25 Feb 2025 01:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cXyRHheG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DBD10E0B8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:41:06 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so56302741fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740447664; x=1741052464;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4TOCMT9A63jLoOCD33qtnm1uXyI2TNmIj6w6+0Voco=;
 b=cXyRHheGmBxVa/6iDh1cSc4+XfSZCtalOBHUrxXHMIfBHwDv3scI+D8LZ037bsDsCU
 u+tuMkd2TDt8loCYu5r66onw2uEGOSObcR6GgjLZ3/xI3Wb3YCb2RX3mKa82CYg29NJT
 v1vc7mtQYGDQ1UKqGecGaTMrCyzYKjDKYT3RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740447664; x=1741052464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4TOCMT9A63jLoOCD33qtnm1uXyI2TNmIj6w6+0Voco=;
 b=K+E8mtkDZmRY6P8r4a+vhbeiVkH9dOFx47d41YU1uQxiprgJz7gyLq0FoHsxZm8DzW
 4dOuUKEafi2BNpeLRoRKMvf3ZVkmFJAd84CVXt83XUGMQyCizvbyDekkhOyS+3rjRxZZ
 ZTQvJsSxj+Z68ABPhoZOldHqYJpm7y+ZVFj1EhcoB4Fi1LrhesHYm517QeCbB2mwwz3C
 cG19HNN0JOop7vhJToG+QCWfPzIF9OH/wG6wJjI9jkZmxU9TagVFKrLxNxev5t4JONho
 u38h28HW6CgHRkjtyFonijDrazrM4LV76qMm/H7R2xkK1BPpyo5X72RpPy/pK2jVKYhH
 Zb+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/UBmoQHoAQP3KEksnLHEoAaSQ71bPon+quAMpaIsB21OjzUroqed8K51d80qcr6vWHZdLuNVwGQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO5M9ed0DKV43756tojslDfLuln9W9du0n6I0OxJvVwNILHBzi
 wWQgA7vM7ib3gx2p50fwXUjPgfDckEak3qXPYPZiiNBpr1f7RqUhbJ2Hn3Utrj/SOv5pvHFsOf8
 +sCRPLcc=
X-Gm-Gg: ASbGncv7O8pIujZT9QmRNWlYTcITe+bDGot+p6vKdmbadPSOJj10yf36aqiPRhpILVx
 YVhxZcu6wBZJu0990GI8nJ1bxAdiXwUdnYf69zsdY6BciSbd4hfhihu30WxevRU0KbOan7axaSF
 MdiiLGUsFOXkeIgwVPnFGl6Ptp3UpzvW7BCmgqm+DYU2nz2/W8tON2/1fF8SD9Z705ctWAREih+
 N5QmwoXiU30k79yonFChYNLU84aWlzKqi00y1YmX8EyPVSGmBMK6SuOSc4/9RAKr4bHRR7rHGQ+
 DzI6N1pN5i8p1ImsSslV746kcENcnQ12J9gikb6pkKcTLL1LwBqVl+2ZDR7bWawwqQ==
X-Google-Smtp-Source: AGHT+IF1DH3Mvd1nvIytZd+fXAPxkFM4ahK329/gNXeE14VKpGk2U8Y80LwSYkEAIE761j1/QVu15g==
X-Received: by 2002:a2e:869a:0:b0:302:3e14:34c8 with SMTP id
 38308e7fff4ca-30a598f4533mr47669431fa.22.1740447664508; 
 Mon, 24 Feb 2025 17:41:04 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819ec201sm874201fa.44.2025.02.24.17.41.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 17:41:03 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5461a485aa2so4669285e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOXFTjy9Pw3QZ7+hARw5uFudKcQov7IgcSrdbYp9QBPnVzSSa75uHsOcv5UFvfWjZ0OQytRyEG5dI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:ac3:b0:545:f69:1d10 with SMTP id
 2adb3069b0e04-54838ee1c94mr5432801e87.8.1740447662279; Mon, 24 Feb 2025
 17:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-5-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-5-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:40:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7iWOyAvdfRDyFA9kdr+utU_aAaJ5F7nAsaHp2fMQgVw@mail.gmail.com>
X-Gm-Features: AWEUYZlbdiIhJLMaGbE9FR34Ygo4r4AydhTgMaLe8qb8EcM7igmYbqK2w54Qn0U
Message-ID: <CAD=FV=X7iWOyAvdfRDyFA9kdr+utU_aAaJ5F7nAsaHp2fMQgVw@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] drm/bridge: analogix_dp: Remove the unnecessary
 calls to clk_disable_unprepare() during probing
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"), the PM operations can help enable/disable the clock. The
> err_disable_clk label and clk_disable_unprepare() operations are no
> longer necessary because the analogix_dp_resume() will not be called
> during probing.
>
> Fixes: f37952339cc2 ("drm/bridge: analogix_dp: handle clock via runtime P=
M")

When possible "Fixes" should be pushed to the start of your series so
it's obvious they have no dependencies when being picked to stable
kernels. That should be possible here.

> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index e23af674d91c..d9dafb038e7a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1608,10 +1608,8 @@ analogix_dp_probe(struct device *dev, struct analo=
gix_dp_plat_data *plat_data)
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>         dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);

There is a context conflict when I apply to drm-misc-next because of
commit 43c00fb1a518 ("drm/bridge: analogix_dp: Use
devm_platform_ioremap_resource()"). You probably should rebase and
re-apply.

Aside from the context conflict, this looks great to me:

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
