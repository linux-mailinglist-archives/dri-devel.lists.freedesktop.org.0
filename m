Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F2B69C371
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 00:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814E10E02B;
	Sun, 19 Feb 2023 23:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC6E10E02B;
 Sun, 19 Feb 2023 23:56:04 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-171dead5804so1560102fac.8; 
 Sun, 19 Feb 2023 15:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RC6aVqKrLzD33x45uoZ7a3CktqmJcQ/IxPDaR/VQw4g=;
 b=De6Qr1LZH4+TfC/gmnhiltof1tAlRfIAIhkRAmVSq8E4Azeqd4rjEUAqX6judBCaJq
 VR14GGF8cq5a022N/pk+1aCCP9kPBWJdIJSIY1UmWfQqyxpeQnPIjcBPqWqWEoe2pPQC
 tsgLS8FiuTbWkUoxxRGyopNRAED1NBwklTPIZxzjEofB9fah733zdTTDRDQBacb1Zb8m
 dgjJo9dAc6kubVnmPJaqMuxl/pMMy/nZPoX6UwPZrx7oYZV9CnvoQ25yPyTBqt1PRC1a
 AZ52G8Tij+TbaNG05Y2bT7CxDOAQ0Nf+wVnd1HabhiJV1Wqv+sDxthhb4IqFFuq8VIqA
 VFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RC6aVqKrLzD33x45uoZ7a3CktqmJcQ/IxPDaR/VQw4g=;
 b=2b6ZNd8J+52EWM9N1tFk839rwof/HlyTgW3iL+J4C6LTkOsLNLHUTitG/c1Q5jaHtf
 xb0g+GLDYFcRi9kIBsxbjjmjkaBhWypDYb7c+4PK3G0o61HPoYy+lKWOB0L1mDvYQoEp
 M6/g9xFwxk5+PYq3Ve7FgA4yANbAvDdnNiAybv435ZqLVYLQ1etHkImcS7jrlokN579u
 PJLeFuDu8NzwCgRrgYBRIpd89ii45UNn7uQL/EUQz9OUJe7jvgXYRcFMvZ/ulL2eMeHp
 LTFWG1GB0jNd9d67sUzUrblt9xgWpunNha51BE7CTLsu8gG0no6yWJqgTncOlIHlD1iI
 tFVQ==
X-Gm-Message-State: AO0yUKUsQTxps9PLkwQqgNHWR2k/G4PMCi3sb10vFFk9excT6jYjXuiw
 0y/uuwQvf5s90EWwbqsZQ+s1unxhTPtwZGiXj9A=
X-Google-Smtp-Source: AK7set9WTZ82dxivrETnVY64xFK9P7XrJ894qguvydR411g1XCPs9htBO48ENAuaz6iUY1lT9pGcUOgN4dN/L3j9LSs=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr1017498oac.58.1676850963555; Sun, 19
 Feb 2023 15:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20230219185401.10479-1-rdunlap@infradead.org>
 <CAF6AEGv7xU2vhSi95MbsjzpRv4ANQ-vOOrchjJ=-uwW9f2q6Eg@mail.gmail.com>
 <c10c0003-fd36-96f8-73d1-1a975330eb53@infradead.org>
In-Reply-To: <c10c0003-fd36-96f8-73d1-1a975330eb53@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 19 Feb 2023 15:55:53 -0800
Message-ID: <CAF6AEGv3d2vk2WdLp8CQhbR3gvWvT890NzKikO2i5++r4snYcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix new Konfig dependency warning
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 19, 2023 at 3:12 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 2/19/23 15:09, Rob Clark wrote:
> > On Sun, Feb 19, 2023 at 10:54 AM Randy Dunlap <rdunlap@infradead.org> w=
rote:
> >>
> >> DEVFREQ_GOV_SIMPLE_ONDEMAND depends on PM_DEVFREQ, so in order to
> >> select the former safely, this symbol should also depend on
> >> PM_DEVFREQ to avoid a Kconfig dependency warning.
> >>
> >> WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_OND=
EMAND
> >>   Depends on [n]: PM_DEVFREQ [=3Dn]
> >>   Selected by [m]:
> >>   - DRM_MSM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && (ARCH_QCOM || =
SOC_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3D=
y] && (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] || =
QCOM_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3Dn]=
=3Dn)
> >>
> >
> > Actually, I fixed devfreq[1] so that we no longer depend on
> > DEVFREQ_GOV_SIMPLE_ONDEMAND .. probably we should just drop
> > DEVFREQ_GOV_SIMPLE_ONDEMAND from the kconfig instead, sorry I forgot
> > to do that already
>
> OK, I'll resend the patch with that change, unless you want to handle it.=
..

Go for it, thx

BR,
-R

> Thanks.
>
> > BR,
> > -R
> >
> > [1] https://patchwork.freedesktop.org/series/113232/
> >
> >> Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Cc: Sean Paul <sean@poorly.run>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: freedreno@lists.freedesktop.org
> >> ---
> >>  drivers/gpu/drm/msm/Kconfig |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff -- a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> >> --- a/drivers/gpu/drm/msm/Kconfig
> >> +++ b/drivers/gpu/drm/msm/Kconfig
> >> @@ -9,6 +9,7 @@ config DRM_MSM
> >>         depends on QCOM_OCMEM || QCOM_OCMEM=3Dn
> >>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
> >>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
> >> +       depends on PM_DEVFREQ
> >>         select IOMMU_IO_PGTABLE
> >>         select QCOM_MDT_LOADER if ARCH_QCOM
> >>         select REGULATOR
>
> --
> ~Randy
