Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35C8C4550
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E54B10E87D;
	Mon, 13 May 2024 16:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B0F0/V78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2A910E87D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:50:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8866260E65
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACEAC4AF08
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715619013;
 bh=kVSNLmMVb3ishC+4udHKioz5ZxxHmqDWUUUuuA8nWc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B0F0/V78joq/yEbhD0tf92fIRwmf60l5/p80nc+aV20iAs3E6+rXxrkcb6OakynYA
 DY12ZdC+uJNi2gz0XEKapwThxCA+nX7OmtJrD0/fejcce5672zFYPXlFfFtMpDV/JC
 lEI8Fv1zgWo9eSQO08Lam0LNMQXaIeBhEuzXmCzsJ7wjRPfn/skTXVBOSqUgzdGTpJ
 dwaxCOFE0NvKt6TTqYHw9yg6utRaXGrOgXHi0Ec9DcQiLcn1aB/0/l/kNPinWAIi7+
 taqDQruFTtl7XlVeVNND/EQHCEvM2Hz7mgB4a0gqnT9TzDYzpGH5ZNvXi6a0CPtBUR
 F05CKP2vwYK9A==
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-2450441dd16so292467fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlBcc5m2sAtFPz1274g0Cmf9jJ5E3Tu38TMui9HEiEx3pVLEUQNRFTsWZ4tohsq27WJjcVa+XlEWO1zODPaQ5maYh823Wk7KfrC8ke+zI6
X-Gm-Message-State: AOJu0Yy59o7L60pgsuKT6sq380wGuSOq6qkKY9eTbzUWmKmkGhZFf5dm
 3JNSRPOkmH4CyGlLADFybT2zZJPSoGlEY0NA8k7wSALZ6KV33UCTWkrMr0TcBG2cvefqhrGK4Em
 ewG+rEJH8nZypaZhXQTp2NLdnDowhx7+9151xww==
X-Google-Smtp-Source: AGHT+IG9etvbYxYHR0fWxJzpfBkuEGL2PwOBWLMig6t/Z5/hSFgr76RJXGAeEjvXkZP26WGn9lBOmLwbuqRzLnLTm6Q=
X-Received: by 2002:a05:6870:4191:b0:23c:6cb5:24f6 with SMTP id
 586e51a60fabf-241728f480cmr13074398fac.7.1715619012605; Mon, 13 May 2024
 09:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240513080243.3952292-1-victor.liu@nxp.com>
 <4b6e49ee-d2fd-4e54-88d5-ab06d8ebf644@bosc.ac.cn>
In-Reply-To: <4b6e49ee-d2fd-4e54-88d5-ab06d8ebf644@bosc.ac.cn>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 18:49:59 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5uZf57G26PmSiUZMCCPAV1dhWGDWT35HPmpVDevVJoxA@mail.gmail.com>
Message-ID: <CAN6tsi5uZf57G26PmSiUZMCCPAV1dhWGDWT35HPmpVDevVJoxA@mail.gmail.com>
Subject: Re: drm/bridge: adv7511: Attach next bridge without creating connector
To: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dmitry.baryshkov@linaro.org, biju.das.jz@bp.renesas.com, aford173@gmail.com, 
 bli@bang-olufsen.dk, robh@kernel.org, jani.nikula@intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 13, 2024 at 6:30=E2=80=AFPM Sui Jingfeng <suijingfeng@bosc.ac.c=
n> wrote:
>
> Hi,
>
>
> On 5/13/24 16:02, Liu Ying wrote:
> > The connector is created by either this ADV7511 bridge driver or
> > any DRM device driver/previous bridge driver, so this ADV7511
> > bridge driver should not let the next bridge driver create connector.
> >
> > If the next bridge is a HDMI connector, the next bridge driver
> > would fail to attach bridge from display_connector_attach() without
> > the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> >
> > Add that flag to drm_bridge_attach() function call in
> > adv7511_bridge_attach() to fix the issue.
> >
> > This fixes the issue where the HDMI connector bridge fails to attach
> > to the previous ADV7535 bridge on i.MX8MP EVK platform:
> >
> > [    2.216442] [drm:drm_bridge_attach] *ERROR* failed to attach bridge =
/hdmi-connector to encoder None-37: -22
> > [    2.220675] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] us=
ing ADMA
> > [    2.226262] [drm:drm_bridge_attach] *ERROR* failed to attach bridge =
/soc@0/bus@30800000/i2c@30a30000/hdmi@3d to encoder None-37: -22
> > [    2.245204] [drm:drm_bridge_attach] *ERROR* failed to attach bridge =
/soc@0/bus@32c00000/dsi@32e60000 to encoder None-37: -22
> > [    2.256445] imx-lcdif 32e80000.display-controller: error -EINVAL: Fa=
iled to attach bridge for endpoint0
> > [    2.265850] imx-lcdif 32e80000.display-controller: error -EINVAL: Ca=
nnot connect bridge
> > [    2.274009] imx-lcdif 32e80000.display-controller: probe with driver=
 imx-lcdif failed with error -22
> >
> > Fixes: 14b3cdbd0e5b ("drm/bridge: adv7511: make it honour next bridge i=
n DT")
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index dd21b81bd28f..66ccb61e2a66 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -953,7 +953,8 @@ static int adv7511_bridge_attach(struct drm_bridge =
*bridge,
> >       int ret =3D 0;
> >
> >       if (adv->next_bridge) {
> > -             ret =3D drm_bridge_attach(bridge->encoder, adv->next_brid=
ge, bridge, flags);
> > +             ret =3D drm_bridge_attach(bridge->encoder, adv->next_brid=
ge, bridge,
> > +                                     flags | DRM_BRIDGE_ATTACH_NO_CONN=
ECTOR);
>
> As a side note, I think, maybe you could do better in the future.
>
> If we know that the KMS display driver side has the HDMI connector
> already created for us, we should pass DRM_BRIDGE_ATTACH_NO_CONNECTOR
> from the root KMS driver side. Which is to forbidden all potential
> drm bridge drivers to create a connector in the middle.
>
> The KMS display driver side could parse the DT to know if there is
> a hdmi connector, or merely just hdmi connector device node, or
> something else.
>
> However, other maintainer and/or reviewer's opinion are of cause
> more valuable. I send a A-b because I thought the bug is urgency
> and it's probably more important to solve this bug first. And
> maybe you can Cc: <stable@vger.kernel.org> if you like.
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
