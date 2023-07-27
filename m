Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F543765B25
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 20:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C89310E5DA;
	Thu, 27 Jul 2023 18:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FBC10E5DA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 18:05:14 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-55fcc15e109so691539a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690481114; x=1691085914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2xqEhMxycEjBhjY+SW2f/ptZbLRut2nqnKv7AhHTsU=;
 b=BZzGlAWaLN5HzAW0XQoq28j6w1Sd0mVR9E9rCB2BXq81DJU+6GNDieYgwG95A4pu7n
 7cl2TKUTvki8cFM+SlUQsUCHau7L/gkOluxxHfWkkcT8WTaR3BMpfRd+deNpSbp+NODQ
 tnQMd1rUlE/o3Ac2n3M+u7r8fOsiqwRagjNk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690481114; x=1691085914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2xqEhMxycEjBhjY+SW2f/ptZbLRut2nqnKv7AhHTsU=;
 b=j1PQ9G8RakYQU4ce8wqnGXWJQaIBeVrWn+vFQkiqoGRf+BX3gFnBBOYo/E4vfn7wLq
 uMzgq7WISi62vO341X6L+ocgAeYvisho9g2oj/miTS7rxkzENR22solUdR87z91ZQynM
 3TvpNbibTiuigORKIRpsVf/L8HwC3ocO30GnrzwFLIakEeZbjOuNufx3do9MEzVvFkqp
 9D4JAxhsrYllqXuzESikG4b3HTlbyJ8eZYk/2r1XBBIsPlI0dgVVNSEPVbBCIMhpc7/Y
 pVeMcnJ3zLiuCo/siEqT1jTyoJWdKVeiUeI4CXW9mmXyC8yt8OTXU+KWRrPWl4LbiAfE
 ONOA==
X-Gm-Message-State: ABy/qLaGtjFndNiygYLjD0waVheGHApbl+8pBxlFUQ96AVj6s7HA5H+B
 kGW0kG/rhm1yE71lL3hKN/sFKgYcSeC+MWT5jV8uKQ==
X-Google-Smtp-Source: APBJJlFSUn/RnNcmP9TXTR68kfhrUCVXTDkYGL9u4XackksJVuYb2XSWoOopMg0tUC6R36Q4frWhes8VXFfDFC0nTq4=
X-Received: by 2002:a17:90a:3e4f:b0:25e:ad19:5f46 with SMTP id
 t15-20020a17090a3e4f00b0025ead195f46mr44833pjm.12.1690481114187; Thu, 27 Jul
 2023 11:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
 <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
 <9334a56f-77d1-f062-08d9-33a6c6136fdc@collabora.com>
In-Reply-To: <9334a56f-77d1-f062-08d9-33a6c6136fdc@collabora.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 27 Jul 2023 14:05:03 -0400
Message-ID: <CAHC42ReCBe0Anz+cZ+0_GD01R_qBQhQ3tmB=GGg0g1Yz96M+HA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 wenst@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> ...so that a per-plane logic in mtk_drm_plane can be easily added, becaus=
e...
I think my concern is more that if we need to validate the format and
the modifier differently because of the plane data, then this method
would provide limited value. For example, on my MT8195, plane ID 38
supports AR30 and BA30, but plane ID 50 does not support any 10-bit
pixel formats.

On Thu, Jul 27, 2023 at 5:37=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/07/23 21:44, Justin Green ha scritto:
> >> Would it make more sense to commmonize function mtk_plane_format_mod_s=
upported()
> >> and call that one here instead?
> > I had considered that, but mtk_plane_format_mod_supported() is
> > required to take a drm_plane as a parameter in order to conform to the
> > type signature defined in drm_plane_funcs, but
> > mtk_drm_mode_fb_create() does not have a drm_plane to provide, since
> > the framebuffer is created later in the function. Technically we don't
> > actually use the drm_plane in the implementation of
> > mtk_plane_format_mod_supported() today, so we could just use a null
> > pointer, but I figured we may one day need to add per-plane logic.
> >
>
> My suggestion was not to use that function as-is, but rather to add a hel=
per like
>
> bool mtk_format_modifier_supported(u32 format, u32 modifier) { ... }
>
> ...so that a per-plane logic in mtk_drm_plane can be easily added, becaus=
e...
>
> static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
>                                            u32 format, u32 modifier)
> {
>         return mtk_format_modifier_supported(format, modifier);
> }
>
> so apart from that, is there any other reason to not do that? :-)
>
> Regards,
> Angelo
>
> >> This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare a=
gainst INVALID if that's what you meant, or against LINEAR if that's what y=
ou meant, or both.
> > Ack, I meant to use LINEAR. Will update for the next version of the pat=
ch.
>
>
