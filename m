Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B92766FD9D0
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 10:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE2710E461;
	Wed, 10 May 2023 08:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1610E461
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 08:45:01 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-24df161f84bso4932673a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683708300; x=1686300300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXEwn3jyGzbB6xYz7UmYCgugQ0Sv8yWibVgQQnQcvCg=;
 b=EwivrME5ItdF9HZICNz/8xqVqiW+sSK88CRqvpfhdTcKBbYMX0XgaQIhYZenmJDMFM
 YywlTFNk4hdbTdjOn/oeEePMuMX1ah/lhs1eqVOa9kiF37VWr3hUqMqbkNYkqVwKp2ub
 HTvz6Cu8UY01XTqUnmvgksYtz7Q9U10HRlPycwU7b6ad43neEpI7+wuhyBFasL+uUWA5
 NH2kM+n0gvA00GibwxzWTWeghn+TStnVYjX/eyPmbNvymaTIhgFv54Bj4EqV4t2vOLWt
 AfoP0839s4dfZnuccoBEAf2xyDOw2QVH1914xv/1KF+JZ6pxHzMW37sChgAdUPCHL6EN
 kzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708300; x=1686300300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXEwn3jyGzbB6xYz7UmYCgugQ0Sv8yWibVgQQnQcvCg=;
 b=LrIT+5kp8QYuXh0aA2uX3iinRUMEvhTctTMriGq4Rlu48z5G+NXixerqqpppPBEETe
 dJpX6ShY33lQL0Q3/N8HaSzN0nops40CvvpXnr6QkTDgumFyaXggV1cf99jrdC3YUm70
 IBO1CuoEBelXUrZ6vKJNZKDVEMnXV8APglhR2ReSbMMAgTt+Yuh3u6uklc9OVuO9cAd5
 c2wCD6AQU+0AAqBo0AgbhBe9b2l32N1osMdhmKFCbzebcigY241e0iPoJXp2ouLPWJF+
 7ltykUWkUjWU/WN7VLSyap+bt73mbLUTSO4N4sxNdXqAPcBk4x3Otq3fBYbvYocOaALc
 NySQ==
X-Gm-Message-State: AC+VfDxd3NLPVTmJMkjd/XJ/Dbdwtwd8D8xofUNpZaRSnNlfzvOC2fdB
 09lvUB/l9SKf4T9k+ZNe6Y10aLxWQlPbNXdPsmI=
X-Google-Smtp-Source: ACHHUZ7cb8rT49XrD2BTwj4Dqb4Av57nsKqjAj79b7XQJ9wrgPMYVRPwOi9s/ri55BOm5r3DyzlScBTqp3AXU4+c93o=
X-Received: by 2002:a17:90a:c004:b0:247:3e0a:71cd with SMTP id
 p4-20020a17090ac00400b002473e0a71cdmr16976883pjt.6.1683708300294; Wed, 10 May
 2023 01:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-6-victor.liu@nxp.com>
 <2ef8da6c-a16b-4396-1456-9a4d75ca5200@denx.de>
In-Reply-To: <2ef8da6c-a16b-4396-1456-9a4d75ca5200@denx.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Wed, 10 May 2023 16:44:48 +0800
Message-ID: <CAOcKUNXzyjK+xUp2an69ExsLhWDi8gZt0suZM88jrCc2M_BqNg@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] drm: lcdif: Add multiple encoders and first
 bridges support
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexander.stein@ew.tq-group.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 9, 2023 at 10:14=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 5/8/23 07:57, Liu Ying wrote:
> > The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> > simultaneously.  Look at LCDIF output port's remote port parents to
> > find all enabled first bridges.  Add an encoder for each found bridge
> > and attach the bridge to the encoder.  This is a preparation for
> > adding i.MX93 LCDIF support.
> >
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v4->v5:
> > * Rebase upon v6.4-rc1 and resolve a trivial conflict.
> > * Add Alexander's A-b and T-b tags.
> >
> > v3->v4:
> > * Improve warning message when ignoring invalid LCDIF OF endpoint ids.
> >    (Alexander)
> >
> > v2->v3:
> > * No change.
> >
> > v1->v2:
> > * Split from patch 2/2 in v1. (Marek, Alexander)
> > * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> > * Drop unneeded 'bridges' member from lcdif_drm_private structure.
> >
> >   drivers/gpu/drm/mxsfb/lcdif_drv.c | 68 +++++++++++++++++++++++++++---=
-
> >   drivers/gpu/drm/mxsfb/lcdif_drv.h |  4 +-
> >   drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
> >   3 files changed, 66 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/=
lcdif_drv.c
> > index e816f87828fb..cf27b63b1899 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -9,13 +9,16 @@
> >   #include <linux/dma-mapping.h>
> >   #include <linux/io.h>
> >   #include <linux/module.h>
> > +#include <linux/of.h>
> >   #include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> >
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_bridge.h>
> >   #include <drm/drm_drv.h>
> > +#include <drm/drm_encoder.h>
> >   #include <drm/drm_fbdev_dma.h>
> >   #include <drm/drm_gem_dma_helper.h>
> >   #include <drm/drm_gem_framebuffer_helper.h>
> > @@ -38,19 +41,68 @@ static const struct drm_mode_config_helper_funcs lc=
dif_mode_config_helpers =3D {
> >       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> >   };
> >
> > +static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> > +     .destroy =3D drm_encoder_cleanup,
> > +};
> > +
> >   static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> >   {
> > -     struct drm_device *drm =3D lcdif->drm;
> > +     struct device *dev =3D lcdif->drm->dev;
> > +     struct device_node *ep;
> >       struct drm_bridge *bridge;
> >       int ret;
> >
> > -     bridge =3D devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0,=
 0);
> > -     if (IS_ERR(bridge))
> > -             return PTR_ERR(bridge);
> > -
> > -     ret =3D drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> > -     if (ret)
> > -             return dev_err_probe(drm->dev, ret, "Failed to attach bri=
dge\n");
> > +     for_each_endpoint_of_node(dev->of_node, ep) {
> > +             struct device_node *remote;
> > +             struct of_endpoint of_ep;
> > +             struct drm_encoder *encoder;
> > +
> > +             remote =3D of_graph_get_remote_port_parent(ep);
> > +             if (!of_device_is_available(remote)) {
> > +                     of_node_put(remote);
> > +                     continue;
> > +             }
> > +             of_node_put(remote);
> > +
> > +             ret =3D of_graph_parse_endpoint(ep, &of_ep);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "Failed to parse endpoint %pOF\n", e=
p);
> > +                     of_node_put(ep);
> > +                     return ret;
> > +             }
> > +
> > +             if (of_ep.id >=3D MAX_DISPLAYS) {
>
> Can we make the maximum number of displays, or really bridge, specific
> to IP instance instead (1 for mx8mp, 3 for mx93) ? If so, then I think
> we need to track a list of bridges in some linked list or some such
> dynamic structure, which would allow us to get rid of MAX_DISPLAYS macro.

I don't think we need to track bridges, since bridges can be found
through connector's encoder, like  lcdif_crtc_atomic_check() does
in patch 4/6.  Instead, MAX_DISPLAYS and the encoder member
in struct lcdif_drm_private can be dropped if we call devm_kzalloc()
to allocate encoders in this function.

>
> > +                     dev_warn(dev, "ingoring invalid endpoint id %u\n"=
, of_ep.id);
>
> s@ingoring@ignoring@

Right.  But the endpoint id check is not mandatory and is better
to be dropped together with MAX_DISPLAYS.  I mean the driver
doesn't have to validate the endpoint id set in device tree.

Regards,
Liu Ying

>
> [...]
