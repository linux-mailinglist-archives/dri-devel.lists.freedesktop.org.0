Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21EE84C91A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 12:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D18B10F01D;
	Wed,  7 Feb 2024 11:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZbEkIPjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F52B10F01D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 11:00:23 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc6c0dc50dcso332346276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707303622; x=1707908422; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e1oTkTP4QkeaUyMu3TaMQMZZ/Iz+5n4/yJ7O/hUjUWM=;
 b=ZbEkIPjMzFl/ZQSioa8gSd2E3221pNtGZTlLQvZdTQljaiGJLY0bv8XVSS5J2ggG4m
 V5hnQY2pb46K7BPjMpGQlQiLgHQoezCdMpFo/DUNfRu5F72MlXb4RM7XPsztAcc1WRP7
 MwvJG930sqdrs2uVLFiEbIYvZoYV8FAyWkacFOYIwsw2GiCoRQckmC+sDG/IXWboRwMQ
 4LlT1V0IeU4gIrn0Htx91trjM8KQa6AAgHSfMisj5ReMl3dHLntcOCFC+CQ2e95StoUI
 IL7QxS+7uVcfEcuqBf47i2Hna+YYPW/O8O6yqdmAOmORFB9GFGED3TyWC95FoNLMTVam
 omBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707303622; x=1707908422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1oTkTP4QkeaUyMu3TaMQMZZ/Iz+5n4/yJ7O/hUjUWM=;
 b=w4oM7XHw72KENSMIndLGl+/JVgtmF8FlSdulMiodk5tQ+pWdKQJco1o1WxPglWJKcM
 IhNHdYczM4f1zl6bE+UtGsFlep+79hPtO7gGAoPptGuEsvwCk+ievzjGPJbv7baPBsS1
 1nZf+aBRnJsCxKCeAKlHhMU2KFU7awUWy+ODha0tqSutIHixdJSTu2Qv+d1PSsPX7EUq
 YV00asaNT/NclP5iA2jgq+J+rH6rxUbohwoiLOnhumGadMCkhlltQ08LV9CFBfntvcE2
 ZT78I185Y1s54FDzjmC+tkxXM0/ur1HMPYQDyP/i5Rre2O6d9dy9o0BEJxtVB41fqPgH
 NURQ==
X-Gm-Message-State: AOJu0YzaKeohmIaah92kuTzQZ4IJVl7WY7lkd45TMHtOMLdeQtqbo0N3
 Nw+eDN8zgqtcPM18+Ykaqqwxx4CJkGDJ+yJbaQvxycFrMjflpb5hzKE14MYeZoDVoK//8tC9MiT
 PA9SghODrtPld9FQvTQyWtdMLUwoxIQ1cNf6Ovw==
X-Google-Smtp-Source: AGHT+IGQdKkGiez+TnRZfGQM7DgkVjmdX5toNOIRXKKSNj/a8pEzFI29tXzE1B1btGc7p72ZOLZ8rhOfOywvyz6IHmk=
X-Received: by 2002:a05:6902:4c2:b0:dbd:2b6:6cfd with SMTP id
 v2-20020a05690204c200b00dbd02b66cfdmr3769507ybs.2.1707303620647; Wed, 07 Feb
 2024 03:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20240205222556.299481-1-tjakobi@math.uni-bielefeld.de>
In-Reply-To: <20240205222556.299481-1-tjakobi@math.uni-bielefeld.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 13:00:08 +0200
Message-ID: <CAA8EJpqv2moyu6XUtCHb_EK-HLKSCgTa8CgchEVBg06PQKMM+w@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Aya Neo KUN
To: cubic2k@gmail.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
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

On Tue, 6 Feb 2024 at 01:57, <cubic2k@gmail.com> wrote:
>
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> Similar to the other Aya Neo devices this one features
> again a portrait screen, here with a native resolution
> of 1600x2560.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

As you don't seem to be the author of the patch, this needs your sign-off too.

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index d5c15292ae93..03224f8860ce 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
>                   DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
>                 },
>                 .driver_data = (void *)&lcd800x1280_rightside_up,
> +       }, {    /* AYA NEO KUN */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +                 DMI_MATCH(DMI_BOARD_NAME, "KUN"),
> +               },
> +               .driver_data = (void *)&lcd1600x2560_rightside_up,
>         }, {    /* Chuwi HiBook (CWI514) */
>                 .matches = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
