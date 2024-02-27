Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF186A38F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 00:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2046E10E9AF;
	Tue, 27 Feb 2024 23:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OsNa3m3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF6010E9AF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 23:26:31 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso4249337276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709076390; x=1709681190; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BVBbYCFm8xr3sv+kzZJvqh1w9VqUrbToySZUueJGefY=;
 b=OsNa3m3Ho1JPibEpdmVqrItoISghXuTvZs+Cdy+3d8aUClD67qAolaAeckpl6HUKzj
 gqkOAuWB08leKi2mUFljROQRuPupWbfsPWVAkCii2Kl44pXIIdX9p2PDyUMOoNtT9vip
 Vo01ba4B6wbk92yhF2usrEfsF6hw4C1BYVlpspe9Zu8GBemwi5Y2X2JfUdiCbvC91d4X
 s/MBi1E7Z3QFUkzdr0nGME8QBmJq6rymsTF4Ahz1iXnT7qXc+AVwdrWf/f1Zc1rRgOmK
 /CzHI/NNKiWtF+p+SjmI3bLuFtMd6LFXea0syoi3jWJ6irFe9Qe8i4WcKRWLk3XNSOdB
 epCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709076390; x=1709681190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVBbYCFm8xr3sv+kzZJvqh1w9VqUrbToySZUueJGefY=;
 b=KHaYXRnxvLmGpxPQzyq56RRS9JwnC2LqD2Jr/vRkLxzNsHzyBSKdTsIp+JYBtr/l+J
 LF4q1x92z+SlQTH+IfcKckifZOayMlB+3XeTEfisNXCZ9da+UR3PKMJPHwvu6Ms5soUr
 0PhVrwJ8RJW40fCvfCrAk+wIRTaR0ntDCyzfKfj9JC2xtKjJc2JhYWLWlTsXTsf2a1nZ
 8Ahn06Am5zGsZhZMzsQf8T64AIXW10ABaYQh4je0nndr6PMjaAtHiEl3vQdM4lgt8icO
 Wd5noY9DPj2U2i1fCz6P2iI1zDoiCpPMyGuyfU3NFlzYZ4yX9T/WUn7j9ky2gHb8+1Ha
 5fbg==
X-Gm-Message-State: AOJu0Yz3pz0ooPZyugOCvxxamj55X0OCwCG2ZufSeTCe41ljcQAgk2af
 UJl1Il1LgKUo32PzSXJXG3Z4/mXt0yVthy2MGHVHg/LfsXM+p3ttPqY9dF5Bxg//6aQEsONQcSC
 EDDmSj4M0ub1pF6ndwePyAA3Yyz0wy6JdFvZg8Q==
X-Google-Smtp-Source: AGHT+IENq+Z2eNW1wAYtx3jcYc0DCa1qzovnKAILy5xMkbCWx5AIdIffMtBPby/y+fF9qj55pcq7eXqn7KKIej1xoAQ=
X-Received: by 2002:a05:6902:1b88:b0:dcb:fb49:cb93 with SMTP id
 ei8-20020a0569021b8800b00dcbfb49cb93mr1087639ybb.45.1709076390718; Tue, 27
 Feb 2024 15:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
In-Reply-To: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Feb 2024 01:26:19 +0200
Message-ID: <CAA8EJppQYQCGL8UCX28JwrkX7Nb4pQStboXbyaEw=T+D6F-OAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 linux-kernel@vger.kernel.org
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

On Wed, 28 Feb 2024 at 00:19, Douglas Anderson <dianders@chromium.org> wrote:
>
> Even though the UDL driver converts to RGB565 internally (see
> pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
> compatibility. Let's add ARGB8888 to that list.
>
> This makes UDL devices work on ChromeOS again after commit
> c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
> commit things were "working" because we'd silently treat the ARGB8888
> that ChromeOS wanted as XRGB8888.
>
> Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/udl/udl_modeset.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
