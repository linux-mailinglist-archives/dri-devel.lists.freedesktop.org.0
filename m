Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810024903F2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29E410E139;
	Mon, 17 Jan 2022 08:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2D10E1BE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 01:40:43 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id m196so212780ybf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4xj65T8RWG0+hHEFyJGBp3+1b5O20fwk4wK5S2rZsA4=;
 b=n2Fh3NmLz2d6sp4Qmlto1f3BVHmjGrIadTEingnWHR7GDNCbwVjQlMWThWgGyU4E28
 DHT0TPnsTlAYOCFfOoCNnU50H/VW2qNhGLXPC7jccvtejQ1Mfxqpg7uyfTCoI6WB75ab
 YhvIdMMkOfR2anZ0T9NbNFyMZDuuqOZwAkPVVZh+dpsIXyKvoYSkCIvGZaT8BvzmwKDI
 dukFPcnQaFXpI08r5yvgeNXNwe7J/yH6NkCEf6z16WLPxI8Pwf7e4y1mc0PUspJ9LMla
 4hqQWOrlMzLMSL1pCG0sbRumBRZnogxzE7MLtCtm0KO4eiVvkShN9qc8vgYPvWFHzWra
 VomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4xj65T8RWG0+hHEFyJGBp3+1b5O20fwk4wK5S2rZsA4=;
 b=S4Jxot/EW/5wXC+CllPOToqud3Cx0450xav00ANzFSHDtCnlRHwOrbkDL36o/8ZRHN
 ByGH2xZLHquSnakzZGybFb1976JlgXeM5PqnR1J0Condeut9MgCMcPIYdqlJgb2z4jVK
 ywqYI/W4HhoXqgbWd76ONKjC4OxrJd8LPTjzB4KPBugunfCJUOzQS2YeUNMKWrAid6VT
 GpPsVYwF5ddBSvRH3cFCvbwIF5IQoDleWm39l8N9w4Eb2ah58kKA+7IJL4aw9u6PCLf+
 ANr/WtPaRGBswGAm7+Tah9nc1taft4KtdyohxT8k48xd1DVc/bmkbsi9LM9soeKYD8kU
 CVtg==
X-Gm-Message-State: AOAM531xdT2bRAP8oSC5Dmz7z8JkVWkgH88z9O7p/GyQ6b60cSaSEFdy
 fzt+rU2z5duvF6tMTiYsEjyT6vOTtajqN+/YLxg=
X-Google-Smtp-Source: ABdhPJyZ+AMZzLKscGwgxAMno4/ugfReYdipnFkyZDavVf7WNx1MJDQkydIChF1IHAyV1XcTbxz3zozXhGWeu5tfH9I=
X-Received: by 2002:a25:2cc7:: with SMTP id s190mr9088772ybs.186.1642210842195; 
 Fri, 14 Jan 2022 17:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CGME20211222190203epcas1p2a7647eb2c09c29587b70982744c1a912@epcas1p2.samsung.com>
 <20211222190134.24866-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a95b74fd-7118-b0fe-26b9-4665c719f1a0@samsung.com>
In-Reply-To: <a95b74fd-7118-b0fe-26b9-4665c719f1a0@samsung.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 15 Jan 2022 01:40:16 +0000
Message-ID: <CA+V-a8tDqLWQXtZbjh=XwKaen1T-iXy=pP-Rn8GF9j_YA-8wdQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/exynos: mixer: Use platform_get_irq() to get the
 interrupt
To: Inki Dae <inki.dae@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:34:35 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

On Fri, Jan 14, 2022 at 11:08 AM Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Lad Prabhakar,
>
> 21. 12. 23. =EC=98=A4=EC=A0=84 4:01=EC=97=90 Lad Prabhakar =EC=9D=B4(=EA=
=B0=80) =EC=93=B4 =EA=B8=80:
> > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > allocation of IRQ resources in DT core code, this causes an issue
> > when using hierarchical interrupt domains using "interrupts" property
> > in the node as this bypassed the hierarchical setup and messed up the
> > irq chaining.
> >
> > In preparation for removal of static setup of IRQ resource from DT core
> > code use platform_get_irq().
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Hi,
> >
> > Ideally I would expect the mixer_resources_init() to be called from pro=
be
> > instead from the bind callback. If platform_get_irq() returns -EPROBE_D=
EFER
> > the bind callback will fail :(
>
> If the bind callback failed then probe function of exynos drm driver will=
 call -EPROBE_DEFER like below so it must be no problem :),
> --------------------------------------------
> in exynos_drm_platform_probe function
>     component_master_add_with_match()
>
> in component_master_add_with_match function
>     try_to_bring_up_master()
>
Thank you for the clarification.

Cheers,
Prabhakar
