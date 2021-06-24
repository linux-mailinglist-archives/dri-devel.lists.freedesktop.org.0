Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E486B3B2532
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 04:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4E6E9C6;
	Thu, 24 Jun 2021 02:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2436E9C6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 02:48:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i1so7612915lfe.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 19:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5gXOkfW5QLdmxd3Wj2w+c9EViV9eI5MsnrUKf2z8FYs=;
 b=RUUtNGr5bfoevPXn+E3jhYX17ZhytUijcdcizuV5g4jQ4csAcRk/aeza4+qR2lvWm2
 nApl7i4P87KW/V3VmdWmT5rnNucE6KyVawrkZY/mYM6BrTB22om8kojGB0aoqBrGivyD
 ablP9MZHGlP/9wsmaXfsHq6WuEEMnrJMmmoJHij/4TS+w5DTgKyVWjOVbirOyDH7zKC4
 CW0N7U316rWwH6l4ydjxnV6Tes4O/Wgx6zcPcGySg2HNEfV5tFcYL5ymVYDAjIkY8+fZ
 mPEekWg9dqIadP4zouGwK4hPDmzZAQ0OO5uNK8m4HyR0np44kKJi6eE+jR92wFXrpABb
 UElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5gXOkfW5QLdmxd3Wj2w+c9EViV9eI5MsnrUKf2z8FYs=;
 b=MAUVc1uc2tJwpO/3O+43eIxEo1X1/J00zT/k4bEY6KuRv4EhFaSec6UFQUezKCsB3g
 3ildgWgfKc3RPVqbsW15X+Jte7LsyDLoBub4dojtoPiNShGqv6RqiyF52tI3/0dElANK
 LVQfjY6STU0IbgbWJLgI1/3uZJb7uerxStoWh2ecS7cMsXeWTzLGOQXhmuwiD9O6hRB9
 zTnKzdKU0EUVRwDQDOpMPfrEE8fJ4kQvHny3wpMuoDVYux7upshkB8Fx/92QBsySJFOW
 BnZn3oH75TbLZk2NqUe5kJP4h5h34sf+Kt5cEvyuVsteNZd7zQ+xvvMwgdPf0sc50MID
 gnOA==
X-Gm-Message-State: AOAM533wra+JGiG1zd+BFEQkydopx6bO/DRvWTFu9n061ikge9v+jAKJ
 YmtckXsnKCmyjXDYzYn+sNbJ7COtMnAsJ5K3lLg=
X-Google-Smtp-Source: ABdhPJx3C4pME09Z+lCozESHkQ/9SDrguEu+2in3VcwEc05cxMVQ7T7rVyGEQn/CiFUVy/CuhM/rCWbxw+m+VilD2fQ=
X-Received: by 2002:a05:6512:3b24:: with SMTP id
 f36mr1930656lfv.443.1624502923336; 
 Wed, 23 Jun 2021 19:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
In-Reply-To: <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Jun 2021 23:48:32 -0300
Message-ID: <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Tomasz Figa <t.figa@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan/Laurent,

On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> Looking at the register set, it seems to match the Exynos 5433,
> supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> that driver instead of adding a new one for the same IP core ?

Yes. there was an attempt from Michael in this direction:
https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/

Cheers
