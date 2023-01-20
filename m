Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21B675D27
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C110E036;
	Fri, 20 Jan 2023 18:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD9A10E036
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 18:54:25 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-4d59d518505so85919277b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 10:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rHCw+jdQ+RwMyHJTKZZA6HBeTDpYJqecnOo4nlATkG0=;
 b=dqkuZKJe44Kp7grbAyJDy65BbqS7X/1+IOQSz09NVaDW/BR7V76Ab3VueI0E6penfO
 pM1aQgHim8cCUXaOpXhJ2V2CPT0tqnltGIaUL1SvrEwTARSt+QowJ1FZiSO+e8kkMcH+
 j1cPssuGq0f5kBWScYY+sJeIk+M6Z1c36ftf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rHCw+jdQ+RwMyHJTKZZA6HBeTDpYJqecnOo4nlATkG0=;
 b=XVzIqZIXbAt+BIZHWT06TbKVe37ARB4pKm3rAP5OoqkOYF8SaJU8/yrbuK4wno+1s3
 8aGwOMyJ3U8jpkV9IcTIBxW6u5QvLBaTI4MhI4VtCkJ+wvrIiXiHBs+c9AemhEagw8Mx
 SBAeMh+5r0NX+5opN9AET3LMXohbwDUZ0mM3Pk8mN9tGMnRPEueLL6FRPbCjrZeRnhTn
 vbSYp1Rinku/ddiBCLcRxi5agAmKoLlZRP4+dcdfFewjk4oyq+5Vu6rTpjT3ltuSuyNp
 7eVEN6jmdfFwRhbyw/ZAHr0vQVDE3QuBVNE22g3+ulaZ59a6eBtsXxKOswJccwxsOTgi
 goSQ==
X-Gm-Message-State: AFqh2kq4mNIEiJFWvrn8vxfpywHFT5XKlNbzAnnNe6FEJLbMF229ydaH
 VdRbC6Q/DEX5gJk0M2YGHj+wDqH20PJNx6EYzmrX0Q==
X-Google-Smtp-Source: AMrXdXuASJUoeRhn+a30lvvkLjD73slswxVrAoEEvYxTG3RHOaVnLvNm7JiLc274TLhoFaGzQmaXUFl+N2zqvC5IQAY=
X-Received: by 2002:a81:a146:0:b0:4ed:916b:d3e4 with SMTP id
 y67-20020a81a146000000b004ed916bd3e4mr1956512ywg.487.1674240865117; Fri, 20
 Jan 2023 10:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
 <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
In-Reply-To: <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 21 Jan 2023 00:24:13 +0530
Message-ID: <CAMty3ZA6SBA4XAvSTgCTq_WC1Uq6jPXD5oP9MZisj3YdActoYw@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Maxime Ripard <maxime@cerno.tech>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 8:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/23 15:41, Jagan Teki wrote:
> > Hi Fabio,
>
> Hello all,
>
> > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> There are two patch series prior to this need to apply.
> >>>
> >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> >>
> >> Would it make sense to re-submit these two patches as part of your series?
> >
> > The previous version's comment was to separate them from the DSIM series.
>
> Hmmmmm, seems like those first two patches got stuck. I fixed up the
> malformed Fixes: line (it was split across two lines and had angular
> brackets around it) and picked the first series via drm-misc-next .

Thanks.

We have another series for Exynos, prior to DSIM
https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/

>
> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> macro , since checkpatch --strict complains about it ?

Okay.

>
> For the second series, you likely want a RB from Maxime Ripard and Dave
> Stevenson first about the probe order handling.

Do you mean for 01/18 and 02/18 patches?

Jagan.
