Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3D2747C9B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 07:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492A10E1BA;
	Wed,  5 Jul 2023 05:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B509610E1BA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 05:46:48 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5701810884aso68806227b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 22:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688536008; x=1691128008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHp+NISlF9UWnaPSw4xicRwwKLY01Ugqh6hX8JM5Vpc=;
 b=qOxxq0finticpggyrbUhb4l+cfMhrVotJ5Y2Vnnjibusl9CITtm2SqMcmGE5VbmnNv
 9mtaZfMZ5sUTznoS6W6nkH3311fBkGBAk3VXrzcIvwofWSYld2ICKNEv5f3zkbuHn4SX
 CnmVU8bO5qUK44UbP65o2I0rBlb3qeiCIqnfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688536008; x=1691128008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHp+NISlF9UWnaPSw4xicRwwKLY01Ugqh6hX8JM5Vpc=;
 b=H6V9QH8PYyWYbF/kMhN5wDIPXdof8SpMv2GSCn/p20J1P2VwPBf6QW6N2AQ0vbY88W
 pyZliyaWZNdSdQyUBT1mCfNa96iCINcJ1HKdpAQ5H1gRK9nnInWCgdXVo354OyWgvfec
 1rHLCsW+G3NAxXOVUgrdog8oNHlsufXcCsiXjCBGLtSHNSux6CwRYYF7S/cB1ahs1vGW
 yO89B0pQSSVMVPxvkgiV8hhVEwCWokkYXM5btqwhjot6WVNxJgQNeVkh3+VdZyY3CIpq
 fdRYfKaI36gpFhU7k0lsccmsmskn61TI7xbndnlqqzARNKDZ78QnnyPRcMIEnG9HBmkq
 azTA==
X-Gm-Message-State: ABy/qLYW1vOXyaX1djIEOTLgkmGJbUatoD8LpLAUNkywYLOI1NOZ6YuS
 a4QHKWqY3G2YwvLLD2IXWvgsyJIcDIpcxlnwOK9bFg==
X-Google-Smtp-Source: APBJJlFCW2vUm6L5+3eBDYD8/+/mpyVPRNEq6dZdKU7TMSYpktIQFxB9vm8VrbTzYbxgwdMbPiLeGqH8PTHrTlaAkxs=
X-Received: by 2002:a0d:ebc8:0:b0:579:e341:ab13 with SMTP id
 u191-20020a0debc8000000b00579e341ab13mr12095477ywe.34.1688536007713; Tue, 04
 Jul 2023 22:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
In-Reply-To: <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Jul 2023 11:16:36 +0530
Message-ID: <CAMty3ZBQajyg0SNz+AjQzth_O_EmrZ9cUyfM--0ptJQ5F0MRfg@mail.gmail.com>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 5, 2023 at 11:09=E2=80=AFAM Dmitry Baryshkov
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

True, But I'm not quite sure, most of these mode_flags were handled
more on the host. Maybe Marek can comment on this.

Thanks,
Jagan.
