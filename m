Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C67F4863
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 14:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B9310E63E;
	Wed, 22 Nov 2023 13:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BAE10E63E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 13:58:42 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5cc3dd21b0cso9763727b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 05:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700661522; x=1701266322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRzdz+ULxtzYNqA4ymScV/usLl4Bsrd31iiECM6OPPo=;
 b=pvKPc8IaovlwC1pUnr1FRVtSTj/3LNCSCyy7rfvyw2rQdssKCKK1Ik4QCxInuN65ni
 5oHcGpA8Z+o6y43I8hprKkLbYSfqNGBXgyUYe1bURseh/swKF3tSS+aHYiXejf2h7Wqs
 E6jmRNjEAUapASjl6pVcfSH5ungHNe+5VXwDt1Z5kmMpv7j+VkBa5tpVS9sywVJfTMyx
 UNf0EuvRHzVRh7xahZieAY30BWAZQskCCbWGSo3TxG8RQUpXiFxOYEKJANwryizdPJuA
 T+YzBE6gHnipL9e58yY3JasFsVhNELqF9tYPjLwmeQCkBieyXaR33Blk9Rb8e+EuqKpP
 SZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700661522; x=1701266322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRzdz+ULxtzYNqA4ymScV/usLl4Bsrd31iiECM6OPPo=;
 b=fW8XJlDBOYDMNSiaLdje6asTOIl6dV3B9Tmjuq3w/3huavoojOhv0Ulvck2BIiWcIv
 LH9nmFbjaC2FxHkKNnhyvFPdYgNVl+l7wlzFE4JwiJuK6o17vHGUsrnSIcUby+k3JWp1
 0N7BBqIuwdT9QFgQXYzlO0+gxwEoUioBD1yEFs9iCt69pvdveFsRMLlfittI7keuznUu
 3sQfnCKZ6pCMFOBAuaoPKroV6RPiuKcRIRPewFYt+wQfHe3RachXqoC1vyGI77zNyY+4
 bO6taJQbXtkUcAUt8PmGXJaMz+ZxseIdGDW3GRSyvD6QI/qX1D2gdY0afuBEFgfQi3Bm
 HyXw==
X-Gm-Message-State: AOJu0YyNJwT4Ah6cpygtA+0z64mLxCih4OhDRz1YBLNab3r1N1rvqoE1
 SaU1ZtwNuTzB2pZZP2GeWFZCGudT9FiKYEZz0GuHjw==
X-Google-Smtp-Source: AGHT+IFgbL+aCpZ2yEkLH3RABDRWWhYPzT5ywvUl4rKnVtTXVwbELC/RJ30BaQTE4700g74RBAovNHoIf6eX/Zbx6kM=
X-Received: by 2002:a81:4a02:0:b0:5be:ae23:c002 with SMTP id
 x2-20020a814a02000000b005beae23c002mr2576971ywa.26.1700661522056; Wed, 22 Nov
 2023 05:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20230807061115.3244501-1-victor.liu@nxp.com>
 <CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com>
 <AM7PR04MB7046863700EA909289EAC17798B4A@AM7PR04MB7046.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7046863700EA909289EAC17798B4A@AM7PR04MB7046.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Nov 2023 14:58:30 +0100
Message-ID: <CACRpkdYPDi+TYj4Y89+iLKa__oFTuMKCPDB7UrVThEGd=6H3qw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ying,

On Mon, Nov 20, 2023 at 11:08=E2=80=AFAM Ying Liu <victor.liu@nxp.com> wrot=
e:

[Me]
> > > v2->v3:
> > > * Improve commit message s/swapped/reversed/.
> >
> > This patch causes a regression in the Ux500 MCDE
> > drivers/gpu/drm/mcde/* driver with the nt35510 panel
> > drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > my dmesg looks like this:
(...)
> Sorry for the breakage and a bit late response(I'm a bit busy with intern=
al
> things).
>
> I think device_link_add() fails because a0351000.dsi.0 already depends
> on a0350000.mcde.  Can you confirm that device_link_add() returns NULL
> right after it calls device_is_dependent()?
>
> Does this patch fix the issue?

Yep it works!

You missed one device_link_del() instance on the errorpath.

Tested-by: Linus Walleij <linus.walleij@linaro.org>

Can you send it as a proper patch?

Yours,
Linus Walleij
