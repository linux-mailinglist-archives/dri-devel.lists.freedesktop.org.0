Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825409B3C60
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 21:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C61810E57B;
	Mon, 28 Oct 2024 20:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gO3H7ovE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B7C10E57A;
 Mon, 28 Oct 2024 20:55:59 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-72088a79f57so95322b3a.3; 
 Mon, 28 Oct 2024 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730148959; x=1730753759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1Co9AOGY8fdKgoryciwma41R5B9YqOzlnHWDbIZnus=;
 b=gO3H7ovEY1bYqI5Mj8tCTQBiksKf5wyO5L2VqXnYLyfWfTeMNt4LL1kveATrTMAcYp
 0GN59i53a51AQmRvUgVLukegBlSzbgAUzZf44Tyq7I9xTOI1W7ExwaqMDI8KLKwZJzR0
 Er/SXjMxa5LpQ6r2Nj0/AzsV3yFHwUGVRIhk4STGQqegh9ynAWhtkFyOy34dgakF/GFK
 AU8WZoXhvN+ym19aXFDPvLYTIRBP775OfxK6ysR+FQ5fWv6m7dbiAPPNq6sCFyUEKT6d
 oK80RUBg63eK9Rl/w2Wne6dZYicBNisWJhg1oPwsiuWTaAY+rOxvt0N5sUk9pzugYFcF
 sLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730148959; x=1730753759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1Co9AOGY8fdKgoryciwma41R5B9YqOzlnHWDbIZnus=;
 b=Nt7I5FmH1XaJh0UUgEejselWPlDFjm0TwlV6Xa6EnqH695c/Sn/ApmE1NKm7FRKOeB
 gdJkZAHiYTjS9IfceS42zjm0zP342BVjrkoOIwKG6NFzPi98lpvm9h/GY6DDwqfEkjYf
 dpVGkVN+0Qism4O/SUtrRnmCKmXYVQpot3BSlaL4eJl2axcceQcvbrDWrbg/taMDlVZN
 mgh5/xsHlp63jVXFuucijkGNyn5RnQwdWd0b9CchMauzEFxWjWV7F9x6mJpKxsg99IQs
 iy7z1nAkpAK4L5Mzs3dyqcYoVyXPFmr27ocyjKGZDDwsu9q1rY7hgjxa2mr19uiNP0xb
 ezkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMJMA1dFZhxawjBbTFgm9QBMv3HKoulLyaoSms71dUIjBVqAk7d3LSYjfvAfSgE9andCn127lhoaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/aBGYJmcOK3BVl58tsoshS8oPng+I7XjXNOW39hilu7eCR2Ah
 qdZVImpSLXRbXzJblsYZ3RFKv+qKwYP4AlydyL9k/fOFksKsJZe/gs8SAnmzKrmKWVSVH0Q7mfx
 WENwGRN787826gEbg1lzNPfmboBU=
X-Google-Smtp-Source: AGHT+IFlSc2ciu0Xc58PIbp/OChRFrcPGgyTFkp7k6KlRk4Dh7Ar54n7Twps83jufbkvBW1uqmboDam/hWDyvH/TVKQ=
X-Received: by 2002:a05:6a00:4f91:b0:71e:5e9a:2db with SMTP id
 d2e1a72fcca58-72063060a1emr5883473b3a.6.1730148959173; Mon, 28 Oct 2024
 13:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241028185141.3756176-1-jani.nikula@intel.com>
In-Reply-To: <20241028185141.3756176-1-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2024 16:55:47 -0400
Message-ID: <CADnq5_Mfp+EfSToGVr8A+xXA4X_g6qz+1fgE6uTxMG2rEK=ngg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/xen: remove redundant initialization info print
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, xen-devel@lists.xenproject.org
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

On Mon, Oct 28, 2024 at 3:04=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> drm_dev_register() already prints the same information on successful
> init. Remove the redundant prints.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>
> Note: I prefer to merge this together with the next patch via
> drm-misc-next.
>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/gpu/drm/xen/xen_drm_front.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xe=
n_drm_front.c
> index aab79c5e34c2..931d855bfbe8 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -525,11 +525,6 @@ static int xen_drm_drv_init(struct xen_drm_front_inf=
o *front_info)
>         if (ret)
>                 goto fail_register;
>
> -       DRM_INFO("Initialized %s %d.%d.%d %s on minor %d\n",
> -                xen_drm_driver.name, xen_drm_driver.major,
> -                xen_drm_driver.minor, xen_drm_driver.patchlevel,
> -                xen_drm_driver.date, drm_dev->primary->index);
> -
>         return 0;
>
>  fail_register:
> --
> 2.39.5
>
