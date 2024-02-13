Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F85853243
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D8710E51B;
	Tue, 13 Feb 2024 13:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DWyPsOkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761110E50A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 13:50:50 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so1441351276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707832250; x=1708437050; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EJDZaN3+N6WSLw4IYEvxsp0tQKnp1DRHMOiyVaOY74w=;
 b=DWyPsOkO0BD2olsm5xcoxgPc6s1Uj6fajT9b3fOdQFhGN354nhtAufgzAKvdvZ9tYc
 l8nMs63d5PK8oM6w0ENFVYRUgSgppUwKNX6coS/g2U6z2XlMwmLY95Cm3VQZeQ8HKcrS
 2iCbzNe61T4JeFtfC3tLp2Fsky0kVojPM3Hq/JM64IKLW+NK6pzfnW88ldffYiN+oBGp
 8bytEsGxuWAjXhWk54xs56CLoSDQK9eLVT1N9bBNxN58XS/SZGMnnIdQKkBxO/LmlZ6W
 Qq0ojBXzhFtor4s1KH9/DInLz9FJn/wK+cu8wZI00fl3OuIDGoGtOmqHTi3gEk1NeM17
 Br0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707832250; x=1708437050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJDZaN3+N6WSLw4IYEvxsp0tQKnp1DRHMOiyVaOY74w=;
 b=W6ZwmxWIO+PoDKXRsAKGpsVf0jkiJvaypGnbsnEM4ZVYcZUdMkuSE4BDQyYF3eKyrU
 ad9Sf4EO6AqgIhBWqGymHethvtpOOCMB55EW4Ngf2BYgH0s1WNA0hxLlpDSzMc6SHlUM
 yZacVxW4wWVgbcZJVFoH1ELmDSe2iUcWeeg9YUJdMWWfAsS2woxTmWi7dDjhmw6twO5r
 o+yd2tInZ8zIkn0PWk6L1xVW4UIuVRoJMj3fI5jLUCNrLNLtwpi1hMkumeKSiLazxX2T
 Z4s94os0qcO9eu/RJwYtFwlMsYqGVEw/sjpskgxWVXDCZpMVEJwuq3mdBNd0vXx2SQmm
 mcJw==
X-Gm-Message-State: AOJu0Yz+SligT6Cj7LrJv3lKEMqmBoTrkLzECJAmay6nRsEZpUx1kRwD
 vKhOgUcw04KGq7E1XCafOYiuLJqd4JMKo7onaLlj3dQv28zPgGNaO7MD19JlPJQ5rAl2UPzSKh8
 HInhSNEV4CCkMLlceQyCVR2s4FT4v1300i/0WRw==
X-Google-Smtp-Source: AGHT+IH//JrMrAcncgTbPsl96Zl5MVioD7SaPlvEvcAaeg5x1AezZYU2/UzHtnwmWGxuuLdzzWCZmu9OEPWluIHoQA8=
X-Received: by 2002:a25:dbc8:0:b0:dcc:a58:63d9 with SMTP id
 g191-20020a25dbc8000000b00dcc0a5863d9mr2949330ybf.44.1707832249951; Tue, 13
 Feb 2024 05:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20240212215534.190682-1-robdclark@gmail.com>
In-Reply-To: <20240212215534.190682-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 15:50:38 +0200
Message-ID: <CAA8EJpofXjwFG3NhwSJQadoe6eR0vkX2Y4knC55b7qGn46UA_g@mail.gmail.com>
Subject: Re: [PATCH] drm/crtc: fix uninitialized variable use even harder
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, open list <linux-kernel@vger.kernel.org>
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

On Mon, 12 Feb 2024 at 23:55, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> DRM_MODESET_LOCK_ALL_BEGIN() has a hidden trap-door (aka retry loop),
> which means we can't rely too much on variable initializers.
>
> Fixes: 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable use")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> I have mixed feelings about DRM_MODESET_LOCK_ALL_BEGIN() (and friends)
> magic.  On one hand it simplifies the deadlock/back dance.  OTOH it
> conceals a nasty sharp edge.  Maybe it is better to have the complicated
> restart path a bit more explicit, like it was originally.
>
>  drivers/gpu/drm/drm_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index cb90e70d85e8..65f9f66933bb 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -904,6 +904,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>         connector_set = NULL;
>         fb = NULL;
>         mode = NULL;
> +       num_connectors = 0;

Nit: I think we should move all this next to the
DRM_MODESET_LOCK_ALL_BEGIN() and drop initialisation from the prologue
of the function, but it's definitely a separate and more intrusive
story.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>         DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);


-- 
With best wishes
Dmitry
