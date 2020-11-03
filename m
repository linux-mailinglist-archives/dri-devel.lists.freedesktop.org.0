Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91762A4588
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 13:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6E66E438;
	Tue,  3 Nov 2020 12:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14826E438
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 12:48:25 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t16so871586oie.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 04:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6mb+ySw9sl1BHqn8ArWXAk1Ys4pct7bZBZWfuu/eVsc=;
 b=e0kxjZ08hzADwonO8g3SAwH8Sp13wJlTWV8AJADzyf11XzjMTlmRC8PQf4C83P0oOH
 /xIkXVp/SKlUFj5H6vHoUHZ8wwmsssoKBBfwBUHf4lcel8fcGH3gfbseJOSPVGQL3UOS
 PhYgZVllv+u5wBG8MtpR04oC9ci+24mcoh7jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6mb+ySw9sl1BHqn8ArWXAk1Ys4pct7bZBZWfuu/eVsc=;
 b=YPtSfpOQRz/SNzMfpgz8CQWIHaolyfT52i0rdO5i6b1HO5iJfb7DIc99ktrrlFhRw3
 /ftC2h0tTkZJbyMS7zK25vRH/J2C5cSo2JK2YRITXOLuNbJj7EEM5QgRSRliuGMIN1TC
 gYSPsZIf7eo/fls9bE65IrYtBsqCe1ngXmb2epP/PFNouqzYA9R59zhYG2E4RLO85Vl6
 VTm7oB1U7KKTIucGl5mhi/JmosQHh6YqRHSd2V+yfArjn5czdYfDjgvIOkBIPauGMvTN
 YacRFAuuUDrNCa5Md/jkkBUTY3t0GxyCL3WF0Nb/f8bCJwlfHzlt+pXyIRqDNW3WwKxT
 fuRg==
X-Gm-Message-State: AOAM532dqnSlX8thvVPhz2+VCC+hSMEUFnbs8eelLgPYtEiS5re0/hnM
 yZy/HiMPKhZLTZLE8YmOkN64CBIrNRzm/VCWd+dgJqk/9Vrw8Q==
X-Google-Smtp-Source: ABdhPJwZacYHHroOl9tj5zQgCH/7AYjmSRREJxoerTyLozaN4CVrHoRoIPTtubH7HtwASPGAgI0QaDEGnkXw6nQOtpo=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr1830917oia.14.1604407705094; 
 Tue, 03 Nov 2020 04:48:25 -0800 (PST)
MIME-Version: 1.0
References: <7dhjUKqlDC0IiRRON0VhWnkuoxcRDLG4EFKzyhcEA@cp7-web-043.plabs.ch>
In-Reply-To: <7dhjUKqlDC0IiRRON0VhWnkuoxcRDLG4EFKzyhcEA@cp7-web-043.plabs.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Nov 2020 13:48:14 +0100
Message-ID: <CAKMK7uHOf7B7oOF=An07Tsq-75ey6nOH2et1ghQaWcq4BzJgGA@mail.gmail.com>
Subject: Re: [PATCH] drm: unify formatting for color management documentation
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 11:31 AM Simon Ser <contact@emersion.fr> wrote:
>
> Other properties are documented with a colon character after the
> property name. Consistently using a colon character allows the docs to
> be machine-readable.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 138ff34b31db..3bcabc2f6e0e 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -97,12 +97,12 @@
>   * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
>   * are set up by calling drm_plane_create_color_properties().
>   *
> - * "COLOR_ENCODING"
> + * "COLOR_ENCODING":
>   *     Optional plane enum property to support different non RGB
>   *     color encodings. The driver can provide a subset of standard
>   *     enum values supported by the DRM plane.
>   *
> - * "COLOR_RANGE"
> + * "COLOR_RANGE":
>   *     Optional plane enum property to support different non RGB
>   *     color parameter ranges. The driver can provide a subset of
>   *     standard enum values supported by the DRM plane.
> --
> 2.29.2
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
