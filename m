Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139488520D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 23:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5804E10E181;
	Mon, 12 Feb 2024 22:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="StKqSWpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1BE10E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 22:01:14 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55f0b2c79cdso5016291a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 14:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707775272; x=1708380072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1tiZLAE0IY5F+3PoaTdN93+aFAoD71GK4lBVLpIcqk=;
 b=StKqSWpLMy7g0mb5A+SpSSLVuf/YdSL0iudbxERDwjqYJJhVQjNWw3Qzd/Yo3176sB
 3wM6ItKJVb0qm5pIZjoqWt73QySMq05KMavR3gBS2rir9KoelYzoCO3VIExv9dvHdpAL
 SkM+69voJAHUMtLEU3RDtyQf+pAOQQDrrLtDdqN9fYDDhLWh/E1MUE9hcfc0GVZoa/gq
 0QXHHprFF1CN3G2pxJxJ2DFdvkGVttIZyX4h3SAYMrT5T0dnbKWcuzrCLIlgVE3hYV7V
 zacDn09WYEsZ+7RFKR3+YYBQeCNOEqopoK0BMyfhXwFzI+lfDeB7HriB6PmEHlHutq+c
 Jdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707775272; x=1708380072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1tiZLAE0IY5F+3PoaTdN93+aFAoD71GK4lBVLpIcqk=;
 b=LkWDl7EL70GfQv8XexYUJz6cUzA2kOjwZ8N8gkdNk6ZeWnaykfvS6P92N2x+j9aOf0
 h4Jj3mHDd0xegOtAXsgRyS7gDkdog64sx1bIGFJTVaA6o4rmpkwS7ksJJRMBJZNSapgv
 M1yA0a75TeQ9kO6jRgsyhWoAY/k6EJH8Q2u2fejohxUdDa1qi2iDA7Jix1pWEtJmfAUR
 4UWIHxusw9epnfpsMra7JZc9jp0cRHXBfooHJfhUVS04auyPOCeyT/F0/yXgZBmCWC3S
 lGhW3YlYYyKj6FxsUW0Y2WN4UPcNipYg8DZ9EIZTXrTbYzvmRUCKvWbnb2y+OqNT84Ib
 vmAg==
X-Gm-Message-State: AOJu0YyMfo9XWJAwpLSGOBhdIy7DrkcgTf5a4nGC+uKJs0NwP91X7Iqm
 hMdJbPICcdFw1JEFodPkC+i+IVG7I7m6b2tRe5G9ddFTFI9lHzocu8INbeYUKp1A7GVAGhstVjk
 Wtt8uCUiFdo6CSoV8BzwNVp1D8srk24B5
X-Google-Smtp-Source: AGHT+IFsX9rFK8QYcr/XSOj71uacHrWyjTcAmzahKdevH96w5Qc3YCy2ECeRVksF2j76w+Dxud+nWsyGhksLuT5ZNls=
X-Received: by 2002:aa7:c992:0:b0:561:61ca:700e with SMTP id
 c18-20020aa7c992000000b0056161ca700emr5017791edt.6.1707775271950; Mon, 12 Feb
 2024 14:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20240212215534.190682-1-robdclark@gmail.com>
In-Reply-To: <20240212215534.190682-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Feb 2024 14:00:59 -0800
Message-ID: <CAF6AEGvT-U1uDoSZyEZbZm2K2YPjsQagHT2Z6UJyCzOXEUhL7A@mail.gmail.com>
Subject: Re: [PATCH] drm/crtc: fix uninitialized variable use even harder
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, open list <linux-kernel@vger.kernel.org>
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

On Mon, Feb 12, 2024 at 1:55=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
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

I should also point out, had drm-misc-next been using gitlab MRs and
gitlab CI, we would have caught this ;-)

BR,
-R

>  drivers/gpu/drm/drm_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index cb90e70d85e8..65f9f66933bb 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -904,6 +904,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *da=
ta,
>         connector_set =3D NULL;
>         fb =3D NULL;
>         mode =3D NULL;
> +       num_connectors =3D 0;
>
>         DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>
> --
> 2.43.0
>
