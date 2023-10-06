Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4791B7BB03B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 04:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466C10E4B1;
	Fri,  6 Oct 2023 02:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD610E4B1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 02:20:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so1589679f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 19:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696558832; x=1697163632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7A6svaZ5NLBPCdvLBtrQYDjuifxfenalJYib+EmtrBE=;
 b=LedytlNFBC/5DOViSteufXDoZZ+TWJQo/8ZvLvUD31lU/lbuEXZnhXQgxXDtO8FrQL
 nhTRnVD24MueeMGPE06ovhQxF2tJbxDLOmOHBrTYv9Rafid/3zX8DLjIMPuA+JQmGpp8
 aGlW5h05aGwFIYoxXSH95L9902PjxrqtmCYtES4UPvgW6Sbi/rADsXelziD8l6DsI3Le
 Zj+f0h9LskKnufM7UCqDEQAGN9HTBytq538eh4qjpirmr2j7L4h7gavhu9ki2pG25tMZ
 kWENOSFM2geaa9n/CxYevOUoZV4bsJ4PWegDBTVAj3NsazhTL2rIJU5x7aoDqN+jb7+2
 6pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696558832; x=1697163632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7A6svaZ5NLBPCdvLBtrQYDjuifxfenalJYib+EmtrBE=;
 b=dk18UTaSgohqFzSaOKC9a/PCv4RSG7Nvkvd8zuhCFmyoeSV4JWmH9y6DQmfKPSWBdP
 DV/IFmhUN+BTuDvg6ZUlNIgmGjacZyjp3jwIr0SqESM5A7cnJV9gStKfB3u1LzDkWwKa
 YBR47naFFx1OKQPPfUu+/dZ52cw2a01qDb/1qbK57QKoxiYI4E770+WuxbUlqfGyxFUZ
 gyBHVLN72faJqOoLJo+WBJGr38ELPAavnlLd45OfiKF4QQCzKXl+WjYlDxGreBewhZRl
 bSKdvZPTJnVk0uPsiqMyBpY45Zy6R3+G0nfcV/DaO6N01r3TCQ9M/1klgKhRzVXhVQG0
 ckVQ==
X-Gm-Message-State: AOJu0Yz0IrXWEitwd9W4bdtnZJxLhEcJYtiYoE9DZZqj2eKzNelVEIKL
 rNBWUpsA+zziRHSPIKioWWSPahcG6+RlGCDK+HY=
X-Google-Smtp-Source: AGHT+IEiTyzp02X3Gv5QGee69SJTznrbwBrw/DOEGtGOalihMEdXuCrKaMq/kTK3AF19NS06vrJBgOIphrRfedf5MxU=
X-Received: by 2002:adf:f546:0:b0:323:3421:9a9 with SMTP id
 j6-20020adff546000000b00323342109a9mr6326854wrp.60.1696558831882; Thu, 05 Oct
 2023 19:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <CGME20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc@eucas1p1.samsung.com>
 <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
 <fb9cd62b-6637-7bcc-e23d-37f3806f8460@samsung.com>
In-Reply-To: <fb9cd62b-6637-7bcc-e23d-37f3806f8460@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Oct 2023 11:19:54 +0900
Message-ID: <CAAQKjZNn4RTJ-SHHEugcQoS2U9fzNTOGtUpSLLM0w1V6Pb0amw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 09/12] drm/exynos: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, alim.akhtar@samsung.com,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for testing. :)

Acked-by : Inki Dae <inki.dae@samsung.com>

2023=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:00, M=
arek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
>
> On 21.09.2023 21:26, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown time
> > and at driver unbind time. Among other things, this means that if a
> > panel is in use that it won't be cleanly powered off at system
> > shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart and at driver remove (or unbind) time comes
> > straight out of the kernel doc "driver instance overview" in
> > drm_drv.c.
> >
> > A few notes about this fix:
> > - When adding drm_atomic_helper_shutdown() to the unbind path, I added
> >    it after drm_kms_helper_poll_fini() since that's when other drivers
> >    seemed to have it.
> > - Technically with a previous patch, ("drm/atomic-helper:
> >    drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> >    actually need to check to see if our "drm" pointer is NULL before
> >    calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
> >    though, so that this patch can land without any dependencies. It
> >    could potentially be removed later.
> > - This patch also makes sure to set the drvdata to NULL in the case of
> >    bind errors to make sure that shutdown can't access freed data.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Seems to be working fine on all my test Exynos-based boards with display.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> > ---
> > This commit is only compile-time tested.
> >
> > (no changes since v1)
> >
> >   drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/=
exynos/exynos_drm_drv.c
> > index 8399256cb5c9..5380fb6c55ae 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > @@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
> >       drm_mode_config_cleanup(drm);
> >       exynos_drm_cleanup_dma(drm);
> >       kfree(private);
> > +     dev_set_drvdata(dev, NULL);
> >   err_free_drm:
> >       drm_dev_put(drm);
> >
> > @@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *dev)
> >       drm_dev_unregister(drm);
> >
> >       drm_kms_helper_poll_fini(drm);
> > +     drm_atomic_helper_shutdown(drm);
> >
> >       component_unbind_all(drm->dev, drm);
> >       drm_mode_config_cleanup(drm);
> > @@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct platf=
orm_device *pdev)
> >       return 0;
> >   }
> >
> > +static void exynos_drm_platform_shutdown(struct platform_device *pdev)
> > +{
> > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > +
> > +     if (drm)
> > +             drm_atomic_helper_shutdown(drm);
> > +}
> > +
> >   static struct platform_driver exynos_drm_platform_driver =3D {
> >       .probe  =3D exynos_drm_platform_probe,
> >       .remove =3D exynos_drm_platform_remove,
> > +     .shutdown =3D exynos_drm_platform_shutdown,
> >       .driver =3D {
> >               .name   =3D "exynos-drm",
> >               .pm     =3D &exynos_drm_pm_ops,
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
