Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD4D6740BC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 19:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89010E03F;
	Thu, 19 Jan 2023 18:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CA910E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:19:24 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 69so3669646ybn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9+JdR4fUqo1UuhlAuqmE6I1oSW5mw2XdC5wEc6AgMY=;
 b=XULtkS2gBxQ9Mkcvtm5Zbfk9ZQ4RO2LmsuCBOU78n+Z7HI20SlNkUbyAJgaMfDDrao
 DAY3ypjuryF5UJ88hL6ILpBxk92Fg0G2f3KXLHXYPCBmMFVSkrX6513tMv6p1MxDWik0
 D58fC5zSz/rcxh6vP9t3caYi38WtTRpTFQPzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9+JdR4fUqo1UuhlAuqmE6I1oSW5mw2XdC5wEc6AgMY=;
 b=G2qSrVJpEmV5+9OdcBs2gDyxIBfvJ/l12bFNyfM9+grgeG1xuMFwhsFbTPcGWBtZZB
 qClipWdDUMSRtg2BLerLLlB7FhLPw+lFHbxLix14OHHrdr7mRNC+rBM77W+3UkUOB3eP
 3MNgXFDHqfMTje1ONcFQRK7WPpmw4Tj4A2ZuoeN+FFRUEwC5AjhlztYfFIU0nuodjo5k
 HcFu58i2eNBPfc/S6cHBZ2OgifLx5BDwaUBuSlFI9NVSX+O2r7r2NIF3Uns4c9rSAnGm
 bffp4U1/rqZdW9d6ZK9tSfLFCNUUjbpJaVMHLXT/fYBahMb3LuXBo8Gbir7jYWO1IC2I
 vThQ==
X-Gm-Message-State: AFqh2kq6LhtLyQWjlh+kQCUybTQEbbQz05VmXZDw3z2KeG+QgtJ39wKI
 /uEZBrWge6S47M6UQvuj63tsx8cngHHLTqaDog6g3w==
X-Google-Smtp-Source: AMrXdXtS0SDJC8ptil9wDc1DSnYYbOVzcGK4Sze1A+MmUjUukQPsocY72O0iss8IU+YrBgTei5f7g03dv4iK9eQ0hWI=
X-Received: by 2002:a25:b6c2:0:b0:6fc:c36a:1d06 with SMTP id
 f2-20020a25b6c2000000b006fcc36a1d06mr1050649ybm.462.1674152363966; Thu, 19
 Jan 2023 10:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <CGME20230106175722epcas1p152dacb511ee08d563c51bb8a8deb0bfe@epcas1p1.samsung.com>
 <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com>
 <000001d9262d$42bc49c0$c834dd40$@samsung.com>
In-Reply-To: <000001d9262d$42bc49c0$c834dd40$@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 19 Jan 2023 23:49:12 +0530
Message-ID: <CAMty3ZD=RDY_NH6rt+ibY_4drEenmHhxKpn=BRD551jRoK=MxQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
To: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki Dae,

On Thu, Jan 12, 2023 at 7:56 AM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen Platform =
Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Jagan Teki,
>
> Sorry for late.
>
> > -----Original Message-----
> > From: Jagan Teki <jagan@amarulasolutions.com>
> > Sent: Saturday, January 7, 2023 2:56 AM
> > To: Marek Szyprowski <m.szyprowski@samsung.com>; Inki Dae
> > <inki.dae@samsung.com>; Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmi=
n Park
> > <kyungmin.park@samsung.com>; Neil Armstrong <narmstrong@linaro.org>; Ro=
bert
> > Foss <robert.foss@linaro.org>; Andrzej Hajda <andrzej.hajda@intel.com>;=
 Sam
> > Ravnborg <sam@ravnborg.org>
> > Cc: Marek Vasut <marex@denx.de>; linux-samsung-soc@vger.kernel.org; dri=
-
> > devel@lists.freedesktop.org; linux-amarula <linux-
> > amarula@amarulasolutions.com>
> > Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
> >
> > On Mon, Dec 12, 2022 at 11:59 PM Jagan Teki <jagan@amarulasolutions.com=
> wrote:
> > >
> > > Split the Exynos DSI bridge chain update patches from Samsung DSIM
> > > bridge driver for easy to apply.
> > >
> > > Changes for v11:
> > > - enable bridge.pre_enable_prev_first
> > > Changes for v10:
> > > - collect Marek.V Review tag
> >
> > Any update on this?
> >
>
> Added Thierry Reding who is a maintainer of DRM panel drivers.
>
> I will pick this patch series - including panel and bride patches - up.
>
> Thierry and Andrzej, please let me know if any problem.

Any further update on this?

Thanks,
Jagan.
