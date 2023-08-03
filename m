Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4F76E8C6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B110E184;
	Thu,  3 Aug 2023 12:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4557210E203
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:49:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-268541d2947so463491a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691066948; x=1691671748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KINzkY+2pTqpgggwDRnN6ZDXxLdRP48C4+yT1alhZW0=;
 b=FLG0aNm32sS+XHN5I5Y+oBXcneb5nhWHffdSaglK04SJWjwdCruhjcCMpGRDmQKEo/
 dUNa5R5rumYhograB20KM5QQblPCxXoQ8ZGQVLvR3UoUkEic8GJvmZpmWcmiIah2dok7
 fbGqVsz9ep9aogRrBoMg9zggdj9lXDLtihA5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691066948; x=1691671748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KINzkY+2pTqpgggwDRnN6ZDXxLdRP48C4+yT1alhZW0=;
 b=KXnvvZN7mGg9gvg1OP7GejrLtALMVMyrSQIBWvgwuYmwnG8WQ46LUsnq4YqcjHccOh
 v9cjfO5n0+C0yTC8eNWCd1lNoK6O9r+yQbQAcdFTuD7KKeuFfPiqGnOSR3C8qNSVnIjT
 jerQZ6BodXywQ4x8xCg9UbFrA4lvJm27DZ4yWDFTC5TTABQ5jGibKkLe69rg0PPpvpjQ
 GV/Hll+c85sAUSrq8Lo9e7jnSfV+6+aTkV/XfDrUuuw+mayGGH9CFhuWx+0gmbjDr4lT
 +kgD2ikbSoUUh7LFcsxBkOXSvoj7MR1DoYbAkcn7k0e0MXpc7dBcHwdJ2zqVyOxtV9tz
 TrEQ==
X-Gm-Message-State: ABy/qLaY/r3VTbIg19a7dD3CQlhXcl5gr7dmy0+0M+LWnNmwLJ5YvNkM
 UFNtZa5B1b2/bVi+UcGhCRr1/VZ4Ilq75no2PyuEEA==
X-Google-Smtp-Source: APBJJlFjhCqu83YatWbs6solrrW1ZC3HnaGzLi79mqRRwPhv8z+cIO3WAE1eJpOmWss6LSTrOliZSTyEMjemBAej5JA=
X-Received: by 2002:a17:90b:4f81:b0:267:f893:d562 with SMTP id
 qe1-20020a17090b4f8100b00267f893d562mr16081750pjb.8.1691066947603; Thu, 03
 Aug 2023 05:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
In-Reply-To: <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 3 Aug 2023 08:48:56 -0400
Message-ID: <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
fb helper functions to see how this is supposed to be done.

Oh that's interesting, so does this imply that the infrastructure
automatically calls format_mod_supported() during framebuffer
creation? In that case, this entire patch might be unnecessary in the
tip of tree kernel.

On Thu, Aug 3, 2023 at 4:24=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Mon, Jul 24, 2023 at 01:58:39PM -0400, Justin Green wrote:
> > Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> > is not the AFBC mode supported by MT8195's display overlays.
> >
> > Tested by booting ChromeOS and verifying the UI works, and by running
> > the ChromeOS kms_addfb_basic binary, which has a test called
> > "addfb25-bad-modifier" that attempts to create a framebuffer with the
> > modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> > EINVAL.
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> > index cd5b18ef7951..2096e8a794ad 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
> >       if (info->num_planes !=3D 1)
> >               return ERR_PTR(-EINVAL);
> >
> > +     if (cmd->modifier[0] &&
> > +         cmd->modifier[0] !=3D DRM_FORMAT_MOD_ARM_AFBC(
> > +                                     AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> > +                                     AFBC_FORMAT_MOD_SPLIT |
> > +                                     AFBC_FORMAT_MOD_SPARSE))
> > +             return ERR_PTR(-EINVAL);
>
> If you set the modifiers/format properties correctly and use all the
> helpers then the drm core should already validate that only formats you
> can use are allowed.
>
> See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
> fb helper functions to see how this is supposed to be done. These kind of
> checks in driver code for gem drivers (which really is everyone at this
> point) should not be needed at all.
>
> Cheers, Sima
>
> > +
> >       return drm_gem_fb_create(dev, file, cmd);
> >  }
> >
> > --
> > 2.41.0.162.gfafddb0af9-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
