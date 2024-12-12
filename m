Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254199EE8EB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 15:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6CE10EE01;
	Thu, 12 Dec 2024 14:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BfVXVOXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B9910EE01
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 14:33:52 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e39841c8fd6so460041276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734014031; x=1734618831;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oixWL2nrZMsUYl4DXg/df5eSVmWCM6y/4WgYjFxHm8U=;
 b=BfVXVOXjJcBnDwUDJSa03ZGrs38nHkgvL6APMM3DyTnxJOY2VkhgbDn8/Z+5/DyMRW
 4mNmiYZiiJ+LNsBtfmFOrr0+KxtSmGncXFqp1YkQDKHuHr/4ZibvMv0mzidk1ZchPHXt
 Onkjm+9TaQdUKAaWDTzbKbmtLCLabOnk5UgKNVO79Y4ocPLTlLVX9JdL43v6wf9HxBSG
 bFyMWjijsiUp21UZbXHCNkMbJMTICXObzg218HwrBMKU6XIReCrAIPQsXqJS6hoIEnCF
 JIvz/PIrak0Goazl2UhMbxPHPwcVKXIuSZLb6gDSdb2syabfE0yOh2Ho9YmWppSJRxsd
 oT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734014031; x=1734618831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oixWL2nrZMsUYl4DXg/df5eSVmWCM6y/4WgYjFxHm8U=;
 b=kkIJZ16R2ZJ1Ako0Agef5toY+C96ap3iSOyuaB3j6G06gbpe8C4RuRSf3Xl1LuY+nZ
 90VkNCQzo5eZyvP/qksk3ktYZCJnlcdIGoAS8y4Lh/qZRuCUdq9b6QwZXQImc5vDPTZU
 lOt/spK/A4KJP2iP7SwjL1GYBscnl7zyZ7sAQs1fpQoO2to84OwXxEE4Zrr9Y1kmFNLk
 NIZjByHpvp4+n70/MUKHit0m7uDZgiD4oGsMoncYW0CUaoCoevoxFEurMPUGH932EFwj
 wOObRkpxstJKWHSgvmbpzLYCxzYvpRblU6X12dLXEf4dx06Ul4m0viwAs+Db3SG4DM2D
 Mj7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKyTJBCrmzvXTwAiRPc5m008hjjlHVJwNe60RcDviUhMeyF9lPDlMclYr3iwjZA9u+w3sCa+/vNbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR4L6RrXLiG94b5mdEH3hU/zhIcY+r8Zq/ftDC3ieIt6NQ2TDJ
 paV39SBTCn5alZ6VxUtg2u6Q8F/ycYLzpZjSGomIebdF9dYzqqKxWN0YO9tElL0ERiH3E+pqIhG
 +GTrS4iGzJVZNU6fyfzPoY5NjZfG1KqrpblMkMA==
X-Gm-Gg: ASbGncu6QpYPyTA9rV9/S9BmU4Hhg2hJ3umLrMsV3CLXS65iknW0hAFz0fGtTszSprC
 dC4uIUYtCPfk5UOkZLabaAGQlTQyqDnYDIyIkRg==
X-Google-Smtp-Source: AGHT+IGDLkQcBMnIFEczxKe7BF1CvAuA2ofNG6CIH7QxnJ28sfgBPj/eIhdCC4W8Y62+oAcJWg9iNMMiz9hdeyHHgTE=
X-Received: by 2002:a05:6902:72f:b0:e39:86a0:aeba with SMTP id
 3f1490d57ef6-e41c7b58a86mr526641276.34.1734014031430; Thu, 12 Dec 2024
 06:33:51 -0800 (PST)
MIME-Version: 1.0
References: <b61a81b2-0101-43bd-a4f6-09cf3a016484@stanley.mountain>
In-Reply-To: <b61a81b2-0101-43bd-a4f6-09cf3a016484@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 14:33:33 +0000
Message-ID: <CAPY8ntBkQ9PrNx51g+W6TPTLhFjQrTC1vitbV6TVCwq8GUOLwA@mail.gmail.com>
Subject: Re: [PATCH v2 next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

On Thu, 12 Dec 2024 at 12:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The default statement is never used in real life.  However, if it were
> used for some reason then call drm_dev_exit() before returning.
>
> Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks for the update.
  Dave

> ---
> v2: style fixes
>
>  drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index b42027636c71..4811d794001f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
>                 break;
>         default:
>                 drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
> -               return 0;
> +               break;
>         }
>
>         drm_dev_exit(idx);
> --
> 2.45.2
>
