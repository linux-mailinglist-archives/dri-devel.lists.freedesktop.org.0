Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE687DC39
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 03:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2288110E1E8;
	Sun, 17 Mar 2024 02:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rm1H1fFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726A10E224
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 02:03:34 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcc6fc978ddso2733399276.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 19:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710641013; x=1711245813; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fDawv7n/Hl1MA12W63Wi04iWswIJUMGvTr6PyC7EIoE=;
 b=Rm1H1fFTy53jVUNjJ+v6pevg2rDSwPZPxF0JnIdGYs5CHiPbKUSPraLkWEtXBg6tUk
 DDSFG7R2J5VuNcGgYXhPHXNvX9N8MES3cS7+yzDt1675V2EDW20Db0NaseBD5IZ2v5+j
 rHyvDroRGLAjhfxQmDbfhi0Q4VVPHYj5MzRITOh3fBtsFNpI+Nk/CdqjDvABtZkmFVyr
 yDUOUd4gA8IyhnzaMQMB3iLR9wHLRw40U7Mep3KP8tb3ba3ctJRWKOf+jF+Kn4Mdwc5p
 CBlvn5NmxwEz7dA6KkqMR103K/ALbJYwZ0s5L8zRNuYIchaVZN9GZTlDWQE248qWR9Mj
 XL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710641013; x=1711245813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDawv7n/Hl1MA12W63Wi04iWswIJUMGvTr6PyC7EIoE=;
 b=oTJk1rd91RVrWFGH+SGeRvtf3p2tVp7e5saP0fok5b8Y+x/rHLgLOi1Slv7oLV0NQn
 u0PkNOfa239xTdKeLygbBocMTAQKxyc4oU13CGsJgoa763PItwcNNyRU8R/jJ9/9jLd4
 Sn8rFGUqsZAfmqbJMrCwMhKwaevYN7hf1d7Ig4lOFdhkzCn5duMuz/X3puc3gNw7537K
 PPFm3Y7ygoolpIJ7ujAg6YUj0EzMF7RS6ew1gS8LhM/d3ynXo5BYH/S7BrGL49alqOcX
 jCLv0rKR3hU5DeYwogpjBUt9Wd9WoJDw3jTqaRLTuA512hkH/VOOwawp0F8zHLkK2y7k
 Baew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR2wDipB0ewtuDUaMGlCzBw9zPO5+kQNGNuuIUFS1I+vTrCspfKBU/87dRHRujozy08OXRXpI9uPr+HN4pHSF4u1JXy6/TAuFmyua4cHOS
X-Gm-Message-State: AOJu0Yw0v32SuoNfFCrBruqVjnnLX1pl2nt1cqONIDxO353/VbJutBpO
 WxA+vaJ4cVhD+1ZWLek9Q5Pmx1HInuiapoPmIsDNJ1N2IM5d+2xe4dwfzWPyfSW4j4ctDdGy0Cw
 Vo2UIxWblvkKkgKDDb5xJcszApSLSX5IBQcrCnA==
X-Google-Smtp-Source: AGHT+IGKP5/QVTFeKJWp0LE2bmqx8+bXO7FoyJVOXlQK9kdHfeZzWq2GYg6yprxmFWn55gcVROku92p+nT0HUkQ0/Ik=
X-Received: by 2002:a05:6902:1348:b0:dcf:ecce:b2da with SMTP id
 g8-20020a056902134800b00dcfecceb2damr6226829ybu.19.1710641013131; Sat, 16 Mar
 2024 19:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 17 Mar 2024 04:03:21 +0200
Message-ID: <CAA8EJppcODOQPaP1=0hfb72egS=Nca82OZV1SH1gw9XDubYaSg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Fix an error handling path in
 lt9611uxc_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sat, 16 Mar 2024 at 21:51, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If lt9611uxc_audio_init() fails, some resources still need to be released
> before returning the error code.
>
> Use the existing error handling path.
>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
