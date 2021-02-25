Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA43253E0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A366ECDC;
	Thu, 25 Feb 2021 16:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C66ECD9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:47:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 7so5925992wrz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYnywbo5Vak2LSUz0aaCB9g6bHBX066R2mPfYBYRPwU=;
 b=JBm3fS6j3Aknno3t5+UyMULGvWDbHmCQtNR0iUbx8GMKiv1yPjAsvfwsoMlgEIbiKx
 0iqHTVfigbT3x9f5FUUdI9mGBcJcJuo2Mwm5h42OQgRaa/LOe1xreuJMw5FSfOZbmJbK
 Hz+Ytgp1uy+0CONMFEKg2gZYkMZKluId2dDkwzKzOrKlIGeOndOg4zAIdf4s9jMKgTV8
 rl+kb0SI4JkGFOPYemuiedg29pbzoeP0ykU8CT4T5Fr/znOjNECoP36baZzY6daUPcH8
 gTaNarxE4/g7JVlmpWhwHFHSSkfTpFdXuR/De4eGbMnh5aySdP3ZHcbnIgBHJcHnLkWB
 6JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYnywbo5Vak2LSUz0aaCB9g6bHBX066R2mPfYBYRPwU=;
 b=Kr0e3y5YX0+IAfx1Qx3TAuuxJxukI25fyK6j8vWP4Xnesf/+6imv32QY+debjH476d
 jglkoLyfNtMOrYe3J633N7GMuBCiJxmsZkVtpH37a3h3aSvmBII2lptvO/1/yzziszYc
 ftqYQ98ZimrWhOWWeJ4doyAm+Vm45e83Bp0s80ShYneoj35zzkwZM8f52ggOmXlDgKJx
 jU4wnPPAA71VTu0XSnTFphL5lMj4JOrpUYpoF001zpJ0+pz0GHHypUEAK5mu+QBl3xLu
 dgowQ7mU2Tts/liHfoE+CyRx6HYH09EEC7aOr3bcpnYFFqlW0qjcnBmv00xCk109ONBX
 nHoA==
X-Gm-Message-State: AOAM532iMiBrtgH93vKqzmmYuqpVdzHWfO0FwQeHHBQgwJNKg8SpXrny
 h6mbo0CnnJ5aMNdi8piwMRFEVXXWihaLUqnqm2khNA==
X-Google-Smtp-Source: ABdhPJwUD/uQY/I9MmK5Eut9nsqN4gXqF5Lf3s8EITEG2ZlAMQPu7S96HSYZhe6MCQ1z1I+dahFxVyJba4W7EE2Cd0s=
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr4255062wrq.27.1614271624253; 
 Thu, 25 Feb 2021 08:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-9-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-9-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 16:46:48 +0000
Message-ID: <CAPY8ntBN=Kra-j7AS_VhYpVJ8y2+=T4EKOT3YBRZzEspuiUkaQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/vc4: plane: Remove redundant assignment
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Other than no commit text body (which is hardly needed in this case)

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 5e8b7f72dc05..201831e924d9 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1131,7 +1131,6 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
>         plane->state->src_y = state->src_y;
>         plane->state->src_w = state->src_w;
>         plane->state->src_h = state->src_h;
> -       plane->state->src_h = state->src_h;
>         plane->state->alpha = state->alpha;
>         plane->state->pixel_blend_mode = state->pixel_blend_mode;
>         plane->state->rotation = state->rotation;
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
