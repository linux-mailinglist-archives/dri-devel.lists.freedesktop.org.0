Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D5533DF8
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CF410F660;
	Wed, 25 May 2022 13:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3BC10F660
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:36:40 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id v11so17322395qkf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Grl0Ici88Sz79dptO2NKdwHQ/Da4OTXc3PiSI2iuCc0=;
 b=a5EvdQu8GXKYLoSSQf4xu1FRP1hgPhOmTbu2FDWWbmOzV5Ntklf9Nlrv3nV6lJ7ekU
 C4qhdh1Gkmjti9yRGXzDw8ElJUJZ/SJum4YR5Uo3NqUZDhLtHJPHWqASQV7ExreaTWtV
 yJ7M/ZQarL7+2mOdB991AzntXNdtU+2AKk4hvgCgTgLjyF2OW6nfuGxaObE4LN+ruKRR
 a5FZ1ibYTUlzCTHLNd9xaqM7mIfxv4HFsfhZZbz0bk+5bC4qqVXMvkZQLnORCqz0iauu
 /sC+d/9sXN8rqezTGUE1TW/9imq5iX6i4ppYBnBPgmaf9Exgw5UfiIoor/0L0eG+L9vd
 cpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Grl0Ici88Sz79dptO2NKdwHQ/Da4OTXc3PiSI2iuCc0=;
 b=1pz0qF//BXXdSEGBVt04vqJuktyyy11ZR485qXFAXcIpxD8FM/1MTkpubrXy+FNoRm
 C/UCMWsTZpYeK5HcBylJDI6THygJZ9atSmefyJGOU2zKzQV9KUEmPseRkVj2EQeCJrit
 mpdXBP66bsYU+H3a176BsPzvLPNXLQtpKw9GsQFsfStiO3Nj5WNdG7JujmSuEd/gAi1m
 pUuAskIt//2WhiOr/iz7RtWPN4DdaeJK+YPe4HSy1V2No13tzBHfef4D7+ZC+0lZWhVT
 jPXDtXNW3C3GAT7iaAuoymuxfJ7HH7WEAyh5aoNnXkdtG2s4Y1hSt7rk9SiUU+D8S7W5
 usQA==
X-Gm-Message-State: AOAM532UVg67dog94ZND6BkeLLJCFE6FJMsqmoVdg2QtNb76q3d0bUnp
 Ha+4b9M80loOAoB4bEGlr0FQy/ZxW3XPF4XUZAXxPg==
X-Google-Smtp-Source: ABdhPJw57giukrH8SEV/1DnIMT1VYzjINsEONrnCwIvtLMWg5+DgDLaOww+wXaHsR9IN4sMCXzPgBW5H8FKR1oaCfoQ=
X-Received: by 2002:a05:620a:414e:b0:6a5:8dec:57bb with SMTP id
 k14-20020a05620a414e00b006a58dec57bbmr2717852qko.30.1653485799502; Wed, 25
 May 2022 06:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220506123246.21788-1-yuehaibing@huawei.com>
 <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
 <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
In-Reply-To: <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 May 2022 16:36:28 +0300
Message-ID: <CAA8EJpq7_V7mZbN+G5fZdK0a4kTcxROAd_bGJtQ5mhzdYr6pNQ@mail.gmail.com>
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: airlied@linux.ie, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 at 15:55, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Mon, May 23, 2022 at 2:46 PM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> > On Fri, May 6, 2022 at 2:33 PM YueHaibing <yuehaibing@huawei.com> wrote=
:
> >
> > > While CONFIG_OF is n but COMPILE_TEST is y, we got this:
> > >
> > > WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
> > >   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && OF [=3Dn]
> > >   Selected by [y]:
> > >   - DRM_MSM [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && (ARCH_QCOM ||=
 SOC_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=
=3Dy] && (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] =
|| QCOM_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3D=
n]=3Dn)
> > >
> > > Make DRM_DP_AUX_BUS depends on OF || COMPILE_TEST to fix this warning=
.
> > >
> > > Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus =
support")
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >
> > Patch applied to the DRM tree.
>
> Nope, failed:
>
> $ dim push-branch drm-misc-next
> dim: ac890b9eeb9b ("drm/display: Fix build error without CONFIG_OF"):
> Fixes: SHA1 in not pointing at an ancestor:
> dim:     f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus su=
pport")
> dim: ERROR: issues in commits detected, aborting
>
> I don't know what to do with this, sorry. The other committers are maybe =
better
> with this kind of situations. I think it is designed to stop me from
> shooting myself
> in the foot.

Linus, can we get an ack from you (or anybody else from DRM core) to
merge it through drm/msm tree?

--=20
With best wishes
Dmitry
