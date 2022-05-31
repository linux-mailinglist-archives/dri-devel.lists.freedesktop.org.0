Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B690F53982C
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EF110E44A;
	Tue, 31 May 2022 20:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9E910E42B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:42:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id wh22so28973045ejb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fCWWt9NpzsBTceHg7wJgmyAh2h0yT9EdXCCTllStCtg=;
 b=MkEbHZFZ0NblSs3QWDSw8yOZv5ORx1gmf/KDKGn6K5nkQxKKOjIR7us0wQHilrzRX9
 grHVLJaT/od38Kt5I5Cb9WmJgxRb+wKWa4TEUD+2i+E2IkvN1cgvQVyXBEohFGNBaNRM
 pB5I0rZJd44GHQTSU8vlaivXM+ETC6D0dkS6lOUSRe1KyTNLHUFvzH7Q6fSWruFE0bqs
 4W/bnwx8LfVENwmcUSE7X9RMDrCPrhBzFbk2n0huORQstBAlr0Pu3XZgw9p8F1rlQZjb
 vBD0vsG5065kj7hHL3znTmC9z2bgIzWiYcEf14ljM/XodCuH6l3f6xCkT1MtBBzCOVsO
 w+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fCWWt9NpzsBTceHg7wJgmyAh2h0yT9EdXCCTllStCtg=;
 b=DYo6bJ7Xutb0yGEa4PPJvVJk09uIJkvCZTGYJqRML9CmJm2i/v8DZwfSsloXF2y9x5
 iF8krxOOnLrAw2nR3A/QseUZ2M4ciDEBQUS+vctngCMLgHfThZLhC4U7LMlnHKk+zlXK
 T8PT3aBPhPIg+mUZw1P5HnpE3/Obpq2tdpDy9Bi5jvmEj9OmOmOYCCpxgFQcnUpOdL3K
 Bh+G1IQk6ov2qhIWOputAtW581NCyFlKJm0LhA9/gu7C9v02TfzhNIRxoUohvR5cahNS
 362qX21Ur0ef2It5GoyAUtM5+yIcMTnAMwMLg/+UlPsd6flMYez7SP3VzZMjXh540tpU
 jzRg==
X-Gm-Message-State: AOAM531rqsrLlXsqMDPe6ryR1CVHaW/0tbcGQakENyz6vG1a1jKtNxGy
 u5KljWuT79NGoZpTJRRuTdtMBy1/n8TgW1L2zIKLqQ==
X-Google-Smtp-Source: ABdhPJx+3GZDgCxy/32q1dZuv7jmnDJRmuqzUZT0z+QaQEW56wRTTMSPz1xgCSYUF0gqRtMIcV6JYVOYxerltPLSBlI=
X-Received: by 2002:a17:907:1c8c:b0:6ff:144d:e7da with SMTP id
 nb12-20020a1709071c8c00b006ff144de7damr27188397ejc.542.1654029767912; Tue, 31
 May 2022 13:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <20220530131158.kqq2mohxoh52xpeg@penduick>
 <20220530162903.GA6546@elementary>
 <CAGS_qxpV2SsihEdgXZ6+7N0dxLmdRANq+qE4iUZ2aNrf6vuLYg@mail.gmail.com>
 <20220531184454.GA237621@elementary>
In-Reply-To: <20220531184454.GA237621@elementary>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 31 May 2022 13:42:36 -0700
Message-ID: <CAGS_qxoWTo+TqAMOaoD=XEQhFp0K0QN4LS4XRQxFR9aTv=XmfA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 11:45 AM Jos=C3=A9 Exp=C3=B3sito
<jose.exposito89@gmail.com> wrote:
> >
> > From above, a)
> > Specifically here, it'd be encouraged to instead do
> >   depends on DRM && KUNIT=3Dy && DRM_KMS_HELPER
>
> My first attempt was to go with:
>
>         depends on KUNIT=3Dy && DRM && DRM_KMS_HELPER
>
> However, when I try to run the tests I get this error:
>
>         $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/=
drm --arch=3Dx86_64
>         Regenerating .config ...
>         Populating config with:
>         $ make ARCH=3Dx86_64 olddefconfig O=3D.kunit
>         ERROR:root:Not all Kconfig options selected in kunitconfig were i=
n the generated .config.
>         This is probably due to unsatisfied dependencies.
>         Missing: CONFIG_DRM_KMS_HELPER=3Dy, CONFIG_DRM_FORMAR_HELPER_TEST=
=3Dy
>
> I wasn't able to figure out why that was happening, so I decided to use
> "select", which seems to solve the problem.
>
> Do you know why this could be happening?

Ah, you should probably ignore my suggestion then.

Looking at the Kconfig file, it's defined as
  config DRM_KMS_HELPER
  tristate
  depends on DRM
  help
    CRTC helpers for KMS drivers.

Notably, the config lacks a description string.
IIUC, this makes it a "hidden" kconfig option, i.e. you can't directly
select it yourself in a .config, it must be selected by another
kconfig option.

E.g. you can try selecting it manually and see it fail via:
$ ./tools/testing/kunit/kunit.py config --arch=3Dx86_64
--kconfig_add=3DCONFIG_DRM=3Dy --kconfig_add=3DCONFIG_DRM_KMS_HELPER=3Dy
...
Missing: CONFIG_DRM_KMS_HELPER=3Dy

So having the test select it makes the most sense, unless there's a
better kconfig option to automatically select it (I have no idea,
someone with knowledge of the DRM code might though).

Daniel
