Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D455ECF6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9D11B6FA;
	Tue, 28 Jun 2022 18:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4211B6FA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 18:48:21 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id e63so13035007pgc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2ZFJGLWfARwse3I0qcbyHYAl+J8ZxqGlNp9EqF8Gt/4=;
 b=GcO0xSWTb1ngfjkZ8sUq94xD+QADBUfR+xEyDAxWGq2RsJsen2Y6E7nUoeF90QyEVQ
 JcOklYDKGIn630R8J5w7kVqK1tkQh6/fCb20+xc0qKQZXlWDNMdD+C9qaU8iHreNKkhu
 Qo9hPak8Ky7gG4m367+HnTi9Pq4v2UMtDMUjhJWR8Rucp58BZSZoZe06S1yRZ1p21v7W
 Xa2xPt+7bcY7lXz4nC9ODghyGMtYFTz18MYZMcXPkmawhZMqVnSl+qnDgQrFvwmVfxOz
 dA5pPoNxD0uGWNfYD3DgZ0+vA9QCnrSboz6itLf5sY6gjykq2ukBKo+6daDQq1UT6Faq
 72sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2ZFJGLWfARwse3I0qcbyHYAl+J8ZxqGlNp9EqF8Gt/4=;
 b=b4H7vgbWhqpFkILWC5Pu4DzUgpmaRKF2BxirlWGLpWIw6JG4wqUeFACN+O3RXu+JcA
 Gjh5L5GS7ma3FPHGLeAgnINOlZH099vP/6/56Uj4cZEUk8ojclCucK4tCXN8qOeWczFC
 gXqTjv/4eZ9U7ELtxoHjdw+kIuHqY40v3wVBe4CAuTeL/ZOklm/P6oEze0DEqg1YPqFu
 U+LoprRF2ATOLD08o9ExXDx5VUlVDniffHcQQwrtQv1N3UbNzLRWgbu2D5hGpiEztKmx
 kOlA3IBcOYU/Z7soM6A8tvdbuP/xa6GAzMBF8Xp9l2oe4z3zIKhloo5azjHsrRL+fid5
 vx3g==
X-Gm-Message-State: AJIora/MtUMFPLPeWQ7N7uBcFwK4uXPgxLTb5sDlc9BfH4JfxuX2+c07
 Wrq20Ifr5HPwy3Sc1ZlHcMg6215BoxKcY6FtDhk=
X-Google-Smtp-Source: AGRyM1vl8i2+u/2GpoyflXi20qGW2LyjziGmL1IJ6Gl1HeMIS+2byGoaqomAzKOgxHlNrXYjLa3e4gBGdK9VLPJESQw=
X-Received: by 2002:a65:6aa3:0:b0:40c:889d:4f16 with SMTP id
 x3-20020a656aa3000000b0040c889d4f16mr19029190pgu.106.1656442100828; Tue, 28
 Jun 2022 11:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>
From: Tales <tales.aparecida@gmail.com>
Date: Tue, 28 Jun 2022 15:47:44 -0300
Message-ID: <CAGVoLp47kQTuMJWVGtY-KMPf=opv3ted7MkbooEbdb2UWZqevg@mail.gmail.com>
Subject: Re: [PATCH 0/4] KUnit tests for RGB565 conversion
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, dlatypov@google.com,
 javierm@redhat.com, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, isabbasso@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em seg., 27 de jun. de 2022 =C3=A0s 13:13, Jos=C3=A9 Exp=C3=B3sito
<jose.exposito89@gmail.com> escreveu:
>
> Hello everyone,
>
> This series is a follow up of the XRGB8888 to RGB332 conversion KUnit tes=
ts.
>
> The first 3 patches refactor the existing test to make them agnostic of t=
he target format and add support for "swab".
>
> The last patch adds the RGB565 conversion values, and shows how more form=
ats will be easily added in the future.
>
> Thank you very much in advance for your feedback,
> Jos=C3=A9 Exp=C3=B3sito
>
> Jos=C3=A9 Exp=C3=B3sito (4):
>   drm/format-helper: Rename test cases to make them more generic
>   drm/format-helper: Transform tests to be agnostic of target format
>   drm/format-helper: Add support for conversion functions with swab
>   drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()
>
>  .../gpu/drm/tests/drm_format_helper_test.c    | 231 +++++++++++++++---
>  1 file changed, 196 insertions(+), 35 deletions(-)
>
>
> base-commit: 6fde8eec71796f3534f0c274066862829813b21f
> prerequisite-patch-id: 8a16f4c8004d6161035eaea275c8eafaa0ac927e
> prerequisite-patch-id: 53fded2a49e6212b546db76ec52563a683752e65
> prerequisite-patch-id: 294b0ca27a6ee57096c8f097c0572336b8a2d583
> prerequisite-patch-id: 5e05bfc5287d16c207bfc616b2776ad72eb4ab29
> prerequisite-patch-id: e94560be85dffb62a5b3cf58d1f0fc3d278ad806
> prerequisite-patch-id: a471df39c7b32c69dd2b138a7d0af015ea42e00a
> --
> 2.25.1


Tested with "./tools/testing/kunit/kunit.py run
--kunitconfig=3Ddrivers/gpu/drm/tests --arch=3Dx86_64", "... --arch=3Di386"
and baremetal on x86_64 to be sure; everything looks fine, but I feel
like some patches could be squashed, though.

Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>

Inspiring work, Jos=C3=A9, keep it up!
Best regards, Tales
