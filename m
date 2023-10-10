Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF817C00A9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 17:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5210E3A4;
	Tue, 10 Oct 2023 15:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7610E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:47:36 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ba081173a3so616772266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696952854; x=1697557654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKkGXdScv1Oyh1OtZfwEYCK039UMnBrmGwVDK++uXz0=;
 b=GAwIsj7NE4sKuFLI5G/0vogIs8ZOQESqIA95y6kdYKZp/ErR6QfoyvfeQeuiI5S8QZ
 rFhiMa+LzFtd3FDOMx2zMB3wnSkmrp1bfNDnTw0TAVDJusLgmsWI74qJwu7SvCbCYaqZ
 7iXATiLMOWEr/Vh5rrJGlXHjC7puhRJLAYD6mXJ3todNKAB0/8Z5kfvyM/LfUyK+cka0
 LBC/yO96N8iXoo5QHmfJdQ/12wer0d6PoRgKXSR6YsgaCoqLuJBw3iIzFTJ4H2wDZs/b
 T0uDDl2qMU456L/HIAXGFC5Lj4IweM5NIXsGvMya13/pB9R6zf1T+KWCbIZ64qwzQ21e
 xgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696952854; x=1697557654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKkGXdScv1Oyh1OtZfwEYCK039UMnBrmGwVDK++uXz0=;
 b=NQtXFfbOI56V671DWHmDZNkzxApkZOi4qNUnwEZWWejltGFz4tCuv9t/M/kuaOXktD
 rrSGYew98r1BxnmRJiiitsVJUPl/n48vJQP9QBdp0Il0N+cH3O9oSxcDV2Kpm++7Qmv1
 wMpGlTfhHQWGByVZelTK41Imc6JJ4/ZpsQy3rmr/TkW85N3nD0BIyGbpn+TktDQ0rZqX
 pmrKrSgH7m2RB7RXoqI9yS4vNDFBYT44xkNp9hCiZlIAqWQn1Vp82XZYmzTVZQ8cO9nv
 2VCqRTfe3QVWA9RG8i/KYMsDyd9Zk74raF0DIYQuNhoH6xzNkvo5wWS4x8z32IqkIjg/
 Ev8g==
X-Gm-Message-State: AOJu0YxAsmazsntMmBEnpieghXd+6fumB0SjHU0h9UkGKYQ1thUb1n//
 HDENx2eTAmuH/jTQIJW031qjQaZNbZbkabNvdfioaDDGI3Y=
X-Google-Smtp-Source: AGHT+IF241DT80TkJ5sHFKC3eYt/LTp5cevbFpTG9oEYTutjLKN9gJny0Pdg8/WeLysTFf0Hej1uHeGIrIFE3+Ybifk=
X-Received: by 2002:a17:907:1dd2:b0:9ae:406c:3425 with SMTP id
 og18-20020a1709071dd200b009ae406c3425mr17287051ejc.0.1696952854189; Tue, 10
 Oct 2023 08:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <CGME20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc@eucas1p1.samsung.com>
 <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
 <fb9cd62b-6637-7bcc-e23d-37f3806f8460@samsung.com>
 <CAAQKjZNn4RTJ-SHHEugcQoS2U9fzNTOGtUpSLLM0w1V6Pb0amw@mail.gmail.com>
 <CAD=FV=V2JSHsrTfdxP4=-nU4GGZB999iAb+NU3en-4o3-rLmYQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V2JSHsrTfdxP4=-nU4GGZB999iAb+NU3en-4o3-rLmYQ@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 11 Oct 2023 00:46:58 +0900
Message-ID: <CAAQKjZNGnuJSErmn-48suoTUCM62pTXGrNux7XtCptHHXAgswA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 09/12] drm/exynos: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To: Doug Anderson <dianders@chromium.org>
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 alim.akhtar@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

2023=EB=85=84 10=EC=9B=94 6=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 10:51, =
Doug Anderson <dianders@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> On Thu, Oct 5, 2023 at 7:20=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote=
:
> >
> > Thanks for testing. :)
> >
> > Acked-by : Inki Dae <inki.dae@samsung.com>
>
> Inki: does that mean you'd like this to go through drm-misc? I'm happy
> to do that, but there are no dependencies here so this could easily go
> through your tree.

Ah, you are right. No dependency here. I will pick it up.

Thanks,
Inki Dae

>
>
> > 2023=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:0=
0, Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
> > >
> > >
> > > On 21.09.2023 21:26, Douglas Anderson wrote:
> > > > Based on grepping through the source code this driver appears to be
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown t=
ime
> > > > and at driver unbind time. Among other things, this means that if a
> > > > panel is in use that it won't be cleanly powered off at system
> > > > shutdown time.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se
> > > > of OS shutdown/restart and at driver remove (or unbind) time comes
> > > > straight out of the kernel doc "driver instance overview" in
> > > > drm_drv.c.
> > > >
> > > > A few notes about this fix:
> > > > - When adding drm_atomic_helper_shutdown() to the unbind path, I ad=
ded
> > > >    it after drm_kms_helper_poll_fini() since that's when other driv=
ers
> > > >    seemed to have it.
> > > > - Technically with a previous patch, ("drm/atomic-helper:
> > > >    drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> > > >    actually need to check to see if our "drm" pointer is NULL befor=
e
> > > >    calling drm_atomic_helper_shutdown(). We'll leave the "if" test =
in,
> > > >    though, so that this patch can land without any dependencies. It
> > > >    could potentially be removed later.
> > > > - This patch also makes sure to set the drvdata to NULL in the case=
 of
> > > >    bind errors to make sure that shutdown can't access freed data.
> > > >
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Seems to be working fine on all my test Exynos-based boards with disp=
lay.
> > >
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >
> > > Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >
> > > > ---
> > > > This commit is only compile-time tested.
> > > >
> > > > (no changes since v1)
> > > >
> > > >   drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
> > > >   1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/=
drm/exynos/exynos_drm_drv.c
> > > > index 8399256cb5c9..5380fb6c55ae 100644
> > > > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > > @@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
> > > >       drm_mode_config_cleanup(drm);
> > > >       exynos_drm_cleanup_dma(drm);
> > > >       kfree(private);
> > > > +     dev_set_drvdata(dev, NULL);
> > > >   err_free_drm:
> > > >       drm_dev_put(drm);
> > > >
> > > > @@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *de=
v)
> > > >       drm_dev_unregister(drm);
> > > >
> > > >       drm_kms_helper_poll_fini(drm);
> > > > +     drm_atomic_helper_shutdown(drm);
> > > >
> > > >       component_unbind_all(drm->dev, drm);
> > > >       drm_mode_config_cleanup(drm);
> > > > @@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct p=
latform_device *pdev)
> > > >       return 0;
> > > >   }
> > > >
> > > > +static void exynos_drm_platform_shutdown(struct platform_device *p=
dev)
> > > > +{
> > > > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > > > +
> > > > +     if (drm)
> > > > +             drm_atomic_helper_shutdown(drm);
> > > > +}
> > > > +
> > > >   static struct platform_driver exynos_drm_platform_driver =3D {
> > > >       .probe  =3D exynos_drm_platform_probe,
> > > >       .remove =3D exynos_drm_platform_remove,
> > > > +     .shutdown =3D exynos_drm_platform_shutdown,
> > > >       .driver =3D {
> > > >               .name   =3D "exynos-drm",
> > > >               .pm     =3D &exynos_drm_pm_ops,
> > >
> > > Best regards
> > > --
> > > Marek Szyprowski, PhD
> > > Samsung R&D Institute Poland
> > >
