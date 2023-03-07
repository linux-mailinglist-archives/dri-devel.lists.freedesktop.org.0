Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F36AF510
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 20:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820010E543;
	Tue,  7 Mar 2023 19:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E6A10E273;
 Tue,  7 Mar 2023 19:21:47 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-176b48a9a05so8766268fac.0; 
 Tue, 07 Mar 2023 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678216907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhRiVT/qBtmkjy7WxqhkqSdjANQulevS1fkYVnIeB8I=;
 b=Od1ozCy+5nFpaAn16UDS5EgVldYYsLMTpa5G8VLkLZclgAPeP8UfHk2L0ntM8oJAN8
 h4KAv2HFOE2i2y5BSReAp9mO2KOun1n4OT/or29Dx92Og088SGbykzTjyDGlfgxin4E9
 kb40QGVp01EPScKCduxS58CqLUM4Gtnzmr/RY2ADMv2uQLVggPgL5H1eQtGssPEyL1KF
 G3jDosjwHNKBFiBsn4FdCppC9Bx/nKdWzmbroCQFy0kfJQkA3m4ba3cIxZzzskpYivXD
 X4IOXkyIqvMS0Mga5d1qXhOVDerHeY7w+Lo4EyKIrhgHSJ4o1kN+LNkMYIySgJG5n2kg
 u3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678216907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhRiVT/qBtmkjy7WxqhkqSdjANQulevS1fkYVnIeB8I=;
 b=Motkk0StpTO/TobtAZ7pKYbqit1R/kz2bkTujHN/cLirmYNBwZFt2dFdcbyPvDotV0
 XYu5TTB13u0ZcakqSPASVXqTAciupiYdlCtT7Pilz2+KiI/hKJB927X/c21wvN2jlBiM
 7TMRSrByLEQyt8tCKSEqOocoRlGAt8bb5i5hANMjCnNmTut9r1QQSWA4Rfq4Pct50TYR
 OJsdF3rWB/voOfo9hJsShWMtS8/xnKY4iDEaj7llKyT9AKHWzHCZkmSHuG8Tzv4XrYsC
 L2jN0MLLcfHBAUlMBYVPNAUFYjgtcIJKUi0CDr79qWqBEK87Qqil5737p6KCnY4qthBI
 p9Lw==
X-Gm-Message-State: AO0yUKUJYLPYtHnYHA88k+2m/DJDOkZp7lQO/+4QAdwt9SFVQYgQuFBz
 RB8PJepZfrzU5BNWj7GIb6LjdEBvgve3wX/Iepc=
X-Google-Smtp-Source: AK7set/z3NJWfYPgz3oGl/RPEjJKQCI8IMnZlfRg60l9fl5OgNDCuxjK5GrQrqP6rkl81nleyRQqyvXI5sxEKvhuZaI=
X-Received: by 2002:a05:6870:d346:b0:172:426c:8304 with SMTP id
 h6-20020a056870d34600b00172426c8304mr4153366oag.3.1678216907057; Tue, 07 Mar
 2023 11:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20230307174627.23787-1-rdunlap@infradead.org>
 <CAOMZO5DDH=9MMbJX3O8yU7RQjudeC-oXhoT-nu91p1arqHcBGg@mail.gmail.com>
In-Reply-To: <CAOMZO5DDH=9MMbJX3O8yU7RQjudeC-oXhoT-nu91p1arqHcBGg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Mar 2023 11:21:35 -0800
Message-ID: <CAF6AEGtgMtRbP9OLh4P+2xL4SnyhP5ROgg2Yt=ZcoAY_+=S7rg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: fix PM_DEVFREQ kconfig dependency
 warning
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, kernel test robot <lkp@intel.com>,
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 10:48=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Tue, Mar 7, 2023 at 2:46=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> >
> > Since DEVFREQ_GOV_SIMPLE_ONDEMAND depends on PM_DEVFREQ, the latter
> > should either be selected or DRM_MSM should depend on PM_DEVFREQ.
> > Since most drivers select PM_DEVFREQ instead of depending on it,
> > add a select here to satisfy kconfig.
> >
> > WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDE=
MAND
> >   Depends on [n]: PM_DEVFREQ [=3Dn]
> >   Selected by [y]:
> >   - DRM_MSM [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && (ARCH_QCOM || S=
OC_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy=
] && (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dn] || Q=
COM_LLCC [=3Dn]=3Dn) && (QCOM_COMMAND_DB [=3Dy] || QCOM_COMMAND_DB [=3Dy]=
=3Dn)
> >
> > Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: lore.kernel.org/r/202303071922.wJqDWQpe-lkp@intel.com
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Paul Gazzillo <paul@pgazz.com>
> > Cc: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> > Cc: Chia-I Wu <olvaffe@gmail.com>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: freedreno@lists.freedesktop.org
>
> This fixes the warning after running 'make imx_v6_v7_defconfig', thanks:
>
> Tested-by: Fabio Estevam <festevam@gmail.com>

https://patchwork.freedesktop.org/patch/523353 is the fix we actually
want.. I thought I'd already pulled that into msm-fixes but it seems
like it got lost somewhere.. I'll rectify that

BR,
-R
