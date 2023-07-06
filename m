Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BB749835
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055AC10E4A2;
	Thu,  6 Jul 2023 09:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475D910E4A3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:21:17 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5774098f16eso6346997b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688635276; x=1691227276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQWzcD3kqn8nreTy0mrng4rT6iwYUcI+uurtyt3qorY=;
 b=Y0sbKb2NnyAPxRj+0+x8JguFUZO5WFrhXwqakpgMdFRYBqlml9hkb6M3HfU0rOO33C
 U4obMaT4BDTrA1rQyROiMNr1cJ817QwlpgVVVHCrOPXN41hFH45C4gC60zzTxz+GpSGC
 cNYCIh3FMmSAlc2su56i7B0V6nAxzEfF0VSYfmJlY1CZJhnDfRZsp37E2nJquet2kxD4
 cxRjEPJaOl3J+l/2bXoi+RpNgRvboAM3SCbRV1Q9mxfBJvco/y2GDppOeDyw/tFDnwZL
 o31Ym9788Bde9XUO460KMf5i7dO84flldyPa+Jmc7r9DUe10TLIiHloxAxARO5KZWqRt
 RoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688635276; x=1691227276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQWzcD3kqn8nreTy0mrng4rT6iwYUcI+uurtyt3qorY=;
 b=GH8Lt2nGeEh3lEyNGe57n/jspchyT56EnKC/xpukKnFp3lq8MZZC5h5v8TOg7ji04O
 +Ty1vHCKOHGsseoHO8VKYA+MG1wV42EtLdWoUkqXAA+vUDffaPPiWGP94J1whGQzohil
 HO+EwNAKSILXJyuFG7Jh4GIt8HLMF/Q0aFmjbl0s2jGpc5R+H0A2tnvb/hkYVHJcDknw
 XBZG03KdEynVu78OJMdruQoJ9+ZL6l4dHgtTFDq/tlu9KVVnAmjxOrNGMNiqPmh/MmJa
 9AJDZzzxJlR5/kyTOhYGUOxCfC+WfC/GR21JmAaoG4g3XJlQF1q/ZZQUqsOHB64Cx/3O
 xgLA==
X-Gm-Message-State: ABy/qLZmpxvKfRh8J6exICp1ezKoRAd/dz02kg/WWzPFAkmfXJcWBbUS
 b9iaeER/wQiKRaK4dU3AyYi6IQKqY1bNuRaX5129og==
X-Google-Smtp-Source: APBJJlH8WWeq5kYBpRj2qTCCg6+xWryUE16/8ZT11zqW50unDPyeXAusZhm9QvDKMY3hKC+f14TX/1RciBvLo4WLwd4=
X-Received: by 2002:a0d:d409:0:b0:56d:1747:5bde with SMTP id
 w9-20020a0dd409000000b0056d17475bdemr1266852ywd.32.1688635275824; Thu, 06 Jul
 2023 02:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
In-Reply-To: <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 6 Jul 2023 14:50:39 +0530
Message-ID: <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> [Adding freedreno@ to cc list]
>
> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrot=
e:
> >
> > Hi Amit,
> >
> > On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro=
.org> wrote:
> > >
> > > Hi Marek,
> > >
> > > On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> > > >
> > > > Do not generate the HS front and back porch gaps, the HSA gap and
> > > > EOT packet, as these packets are not required. This makes the bridg=
e
> > > > work with Samsung DSIM on i.MX8MM and i.MX8MP.
> > >
> > > This patch broke display on Dragonboard 845c (SDM845) devboard runnin=
g
> > > AOSP. This is what I see
> > > https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-d=
isplay/PXL_20230704_150156326.jpg.
> > > Reverting this patch fixes this regression for me.
> >
> > Might be msm dsi host require proper handling on these updated
> > mode_flags? did they?
>
> The msm DSI host supports those flags. Also, I'd like to point out
> that the patch didn't change the rest of the driver code. So even if
> drm/msm ignored some of the flags, it should not have caused the
> issue. Most likely the issue is on the lt9611 side. I's suspect that
> additional programming is required to make it work with these flags.

I spent some time today on smoke testing these flags (individually and
in limited combination) on DB845c, to narrow down this breakage to one
or more flag(s) triggering it. Here are my observations in limited
testing done so far.

There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
alone and system boots to UI as usual.

MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
screenshot[1] shared earlier as well.

Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
display as reported.

In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
added in this commit break the display on DB845c one way or another.

Regards,
Amit Pundir
[1] https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-dis=
play/PXL_20230704_150156326.jpg

>
> --
> With best wishes
> Dmitry
