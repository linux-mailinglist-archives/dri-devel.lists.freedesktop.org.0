Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DE7AD662
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 12:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0610E233;
	Mon, 25 Sep 2023 10:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5E10E233
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:50:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F7A7CE0F80
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EBDC433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695639022;
 bh=J7kIa1cM5bEdHS4N+xMwZ3c7Uz5zj8sAKah5rpEeCwI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hn+BbPts5Ac7rs/t0nB2iQ8+xLazfZxe5oY2zC9Vs9/mldeyPbd7Ce1czztMgQD1h
 4tPVkAVfwpGiqTBtscdGt76JGnMirT/+N9QcFaASOsY9xkMJ1tgfl2K8oUqx2YzXT0
 IrkaDteE922Lh97kZ5i/qqdbTJ0BOhBiekshZk7lO18UMvXIcs5xOfLYT3VcBs00lU
 t1trnea3pWrGKhC+UT+YQ3Qg/42DBbn8rhI2b/U83dMpgvqS27N8BKL+bZ02RnuY2N
 DSjBBOHkxih9ZyIjihgspYig5tXi21vmGq0vDaKixMr2gWIc45Gha/Z9eeaVfxDg9W
 85kC8OxRu7qjw==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2776ca9adb7so401182a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 03:50:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YwvMXYX1IfpCUzMefQeycrK4ODr9Za4uzZc5b4NW8DaBL2FQ/Ww
 WJUJNntTKpULXK5dNL1gobYjnfSGdw8WOa5YyoS+hw==
X-Google-Smtp-Source: AGHT+IGrn8safol45gEMcotPjO8/w+u1uNeKaOoYjqxt2ntm7MxjH3yv23NR6uAUTs77Cl4KNb91lYjntRsnBywifQo=
X-Received: by 2002:a17:90a:4141:b0:268:5431:f2a7 with SMTP id
 m1-20020a17090a414100b002685431f2a7mr4271368pjg.28.1695639022192; Mon, 25 Sep
 2023 03:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230920004400.81091-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230920004400.81091-1-yang.lee@linux.alibaba.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 25 Sep 2023 12:50:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi44s3h3Ox3mK2pi+Mw8pGCB9fgMcoWmJhCenHoK9=t=-w@mail.gmail.com>
Message-ID: <CAN6tsi44s3h3Ox3mK2pi+Mw8pGCB9fgMcoWmJhCenHoK9=t=-w@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: clean up some inconsistent indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NAK

Personally I value maintaining a simple to follow `git blame` history
over correcting indentation.

Ideally bad indentation should never be committed in the first place.

On Wed, Sep 20, 2023 at 2:44=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:336 dw_hdmi_cec_suspend() w=
arn: inconsistent indenting
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/=
drm/bridge/synopsys/dw-hdmi-cec.c
> index 673661160e54..fe2ff4984fc5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -333,9 +333,9 @@ static int __maybe_unused dw_hdmi_cec_suspend(struct =
device *dev)
>         struct dw_hdmi_cec *cec =3D dev_get_drvdata(dev);
>
>         /* store interrupt status/mask registers */
> -        cec->regs_polarity =3D dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> -        cec->regs_mask =3D dw_hdmi_read(cec, HDMI_CEC_MASK);
> -        cec->regs_mute_stat0 =3D dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT=
0);
> +       cec->regs_polarity =3D dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> +       cec->regs_mask =3D dw_hdmi_read(cec, HDMI_CEC_MASK);
> +       cec->regs_mute_stat0 =3D dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0=
);
>
>         return 0;
>  }
> --
> 2.20.1.7.g153144c
>
