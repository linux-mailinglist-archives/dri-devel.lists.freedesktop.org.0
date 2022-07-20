Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071C57BF2E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 22:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE710F34B;
	Wed, 20 Jul 2022 20:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDAB10EFA9;
 Wed, 20 Jul 2022 20:26:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a5so27676671wrx.12;
 Wed, 20 Jul 2022 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHuW9J2qFnOFuq2DHP+vSS0Cz7nU1OQDb7da5IMfnOY=;
 b=OP3ijZgr3m1YypUunAaAZvBcPYM6PoPO9/BwOeXOGygzE/XFCsO+3jD7VFmpwQqf1p
 4tT0C9QFpdHDV5Z9MaRHDV1PG6dwz4Mg5jBYHUCw+VunO41ZIxSToPnTWLuah3MPWawC
 laZkQBRYyknDMnrk4jtqwi2U6VeZY8MLMT1JGqw8n3CF+MqnGCj8F74FRT12j0fHd8FK
 7gU8nXRrYgCmi51iAhjKKH3sDsYtPMcwhQbCYDgLnfe0KWoxglq37Adersj+faDel+oK
 JRhvBRCV5wh+HfCqkCpWV8lh7HoipzqpfuYZB2up65DK5f/NcaEm9FaJqvsMDwE4mjAR
 AQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHuW9J2qFnOFuq2DHP+vSS0Cz7nU1OQDb7da5IMfnOY=;
 b=5tV4zU0V0mW5a3ymFYhPrTp7bo6lfl5FPjSSl/r5RVjSHxZnXL5DgfXz7ShrN5r+xL
 fNoaFR0o01em18YnvYGazmb89tu0h0JLDgjgcNqf/HE+WS6Es9cXfHBMgFquhZv71QUg
 K7daGUtRop3gaRBEec+pqayWQVzRnlVUMUBDxT5bc7d28ixjDz2w+n6aGn08I6QxKLSP
 fOCCPgSlBj1s4yCUa0Sl1LRqbOAhjFe7YEAzrIGHWXODrK+r9xGkUd+hkFNOQI3eRkxG
 4F+I2KCwe62hovoR5mbZTGFr5WtZpAjczxCvwxP83ppA0gDpWSE2t/9QW/2hhVhdIrXX
 nifg==
X-Gm-Message-State: AJIora8Trnhyip99KNQ+NDxg8k+zkcivM4e/U8AyyfA+o5mZoOy1ZD3r
 A7lzuDPcRU6///W33Eitkaze+9n7vR5GXPv+05I=
X-Google-Smtp-Source: AGRyM1sdLUJP82vh50JIHwPklZ9I0/mLdHrsUJSla84fT90654SJWPhZraE+OgsdUrXsMwy/r0IjyfAE96rS9TC4SJ0=
X-Received: by 2002:adf:e187:0:b0:21d:64c6:74f0 with SMTP id
 az7-20020adfe187000000b0021d64c674f0mr31084766wrb.221.1658348803961; Wed, 20
 Jul 2022 13:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
 <1655802387-15275-2-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJponMDAXDAZ9zpkYEZvONDAztuXhjwZ6y7rgo1HtQOMtfQ@mail.gmail.com>
 <BN0PR02MB81426CB90870085223C308A496B99@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB81426CB90870085223C308A496B99@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Jul 2022 13:26:31 -0700
Message-ID: <CAF6AEGssKD-ZnAb05isb+h9t29AQp5fOHD4johbyMWHRQq530g@mail.gmail.com>
Subject: Re: [v1 2/2] drm/msm/disp/dpu1: enable crtc color management based on
 encoder topology
To: Kalyan Thota <kalyant@qti.qualcomm.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 4:56 AM Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
> Thanks for the comments, Dmitry. I haven't noticed mode->hdisplay being used. My idea was to run thru the topology and tie up the encoders with dspp to the CRTCs.
> Since mode is available only in the commit, we cannot use the dpu_encoder_get_topology during initialization sequence.
>
> The requirement here is that when we initialize the crtc, we need to enable drm_crtc_enable_color_mgmt only for the crtcs that support it. As I understand from Rob, chrome framework will check for the enablement in order to exercise the feature.
>
> Do you have any ideas on how to handle this requirement ? Since we will reserve the dspp's only when a commit is issued, I guess it will be too late to enable color management by then.
>
> @robdclark@gmail.com
> Is it okay, if we disable color management for all the crtcs during initialization and enable it when we have dspps available during modeset. Can we framework code query for the property before issuing a commit for the frame after modeset ?
>

So, I suppose it would work out, because the splashscreen/frecon is
doing the first modeset before chrome even starts.  But that seems a
bit... delicate.

BR,
-R

> Thanks,
> Kalyan
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Tuesday, June 21, 2022 4:43 PM
> > To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
> > Cc: y@qualcomm.com; dri-devel@lists.freedesktop.org; linux-arm-
> > msm@vger.kernel.org; freedreno@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > robdclark@gmail.com; dianders@chromium.org; swboyd@chromium.org;
> > Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; Abhinav Kumar (QUIC)
> > <quic_abhinavk@quicinc.com>
> > Subject: Re: [v1 2/2] drm/msm/disp/dpu1: enable crtc color management based
> > on encoder topology
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.
> >
> > Generic comment: y@qualcomm.com address bounces. Please remove it from
> > the cc list. If you need to send a patch for the internal reasons, please use Bcc.
> >
> > On Tue, 21 Jun 2022 at 12:06, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
> > >
> > > Crtc color management needs to be registered only for the crtc which
> > > has the capability to handle it. Since topology decides which encoder
> > > will get the dspp hw block, tie up the crtc and the encoder together
> > > (encoder->possible_crtcs)
> > >
> > > Change-Id: If5a0f33547b6f527ca4b8fbb78424b141dbbd711
> >
> > No change-id's please. This is not the gerrit.
> >
> > > Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  8 ++++++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++++++++++----
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  5 +++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 22 ++++++++++++++++++----
> > >  5 files changed, 46 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 7763558..2913acb 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1511,7 +1511,7 @@ static const struct drm_crtc_helper_funcs
> > > dpu_crtc_helper_funcs = {
> > >
> > >  /* initialize crtc */
> > >  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane
> > *plane,
> > > -                               struct drm_plane *cursor)
> > > +                               struct drm_plane *cursor, unsigned int
> > > + enc_mask)
> > >  {
> > >         struct drm_crtc *crtc = NULL;
> > >         struct dpu_crtc *dpu_crtc = NULL; @@ -1544,7 +1544,11 @@
> > > struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct
> > > drm_plane *plane,
> > >
> > >         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
> > >
> > > -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> > > +       /* Register crtc color management if the encoder has dspp, use the
> > > +        * crtc to mark it as possible_crtcs for that encoder.
> > > +        */
> > > +       if(BIT(crtc->index) & enc_mask)
> >
> > So, we are checking CRTC's index against the encoder's mask? This is
> > counterintuitive.
> >
> > > +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> > >
> > >         /* save user friendly CRTC name for later */
> > >         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u",
> > > crtc->base.id); diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > index b8785c3..0a6458e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -269,7 +269,7 @@ void dpu_crtc_complete_commit(struct drm_crtc
> > *crtc);
> > >   * @Return: new crtc object or error
> > >   */
> > >  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane
> > *plane,
> > > -                              struct drm_plane *cursor);
> > > +                              struct drm_plane *cursor, unsigned int
> > > + enc_mask);
> > >
> > >  /**
> > >   * dpu_crtc_register_custom_event - api for enabling/disabling crtc
> > > event diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index f2cb497..893ce68 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -13,6 +13,8 @@
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_file.h>
> > >  #include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_bridge_connector.h>
> > >
> > >  #include "msm_drv.h"
> > >  #include "dpu_kms.h"
> > > @@ -511,13 +513,18 @@ void dpu_encoder_helper_split_config(
> > >         }
> > >  }
> > >
> > > -static struct msm_display_topology dpu_encoder_get_topology(
> > > -                       struct dpu_encoder_virt *dpu_enc,
> > > +struct msm_display_topology dpu_encoder_get_topology(
> > > +                       struct drm_encoder *drm_enc,
> > >                         struct dpu_kms *dpu_kms,
> > >                         struct drm_display_mode *mode)  {
> > >         struct msm_display_topology topology = {0};
> > > +       struct dpu_encoder_virt *dpu_enc;
> > > +       struct drm_bridge *bridge;
> > >         int i, intf_count = 0;
> > > +       bool primary_display = false;
> > > +
> > > +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> > >
> > >         for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > >                 if (dpu_enc->phys_encs[i]) @@ -542,7 +549,12 @@ static
> > > struct msm_display_topology dpu_encoder_get_topology(
> > >         else
> > >                 topology.num_lm = (mode->hdisplay >
> > > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> > >
> > > -       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> > > +       drm_for_each_bridge_in_chain(drm_enc, bridge) {
> > > +               if (bridge->type != DRM_MODE_CONNECTOR_DisplayPort)
> > > +                       primary_display = true;
> > > +       }
> >
> > I must admit, I never actually liked the original (intf_type == DSI) check. However
> > the new one is even worse. We are checking the whole bridge chain in an
> > attempt to rule out the DP ports for whatever reason. What about the HDMI
> > ports? Should they be also frowned upon?
> > The ugly part is that we are making the decision for the user, which displays are
> > "primary" for him. Can we let the user make this setting?
> >
> > > +
> > > +       if (primary_display) {
> > >                 if (dpu_kms->catalog->dspp &&
> > >                         (dpu_kms->catalog->dspp_count >= topology.num_lm))
> > >                         topology.num_dspp = topology.num_lm; @@ -601,7
> > > +613,7 @@ static int dpu_encoder_virt_atomic_check(
> > >                 }
> > >         }
> > >
> > > -       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> > > +       topology = dpu_encoder_get_topology(drm_enc, dpu_kms,
> > > + adj_mode);
> >
> > extra whitespace change. Please drop.
> >
> > >
> > >         /* Reserve dynamic resources now. */
> > >         if (!ret) {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > index 1f39327..c4daf7c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > @@ -172,4 +172,9 @@ int dpu_encoder_get_vsync_count(struct
> > drm_encoder
> > > *drm_enc);
> > >
> > >  bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> > > *drm_enc);
> > >
> > > +struct msm_display_topology dpu_encoder_get_topology(
> > > +                       struct drm_encoder *drm_enc,
> > > +                       struct dpu_kms *dpu_kms,
> > > +                       struct drm_display_mode *mode);
> > > +
> > >  #endif /* __DPU_ENCODER_H__ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > index 3a4da0d..486ff9d 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -687,9 +687,12 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms
> > *dpu_kms)
> > >         unsigned cursor_idx = 0;
> > >         unsigned primary_idx = 0;
> > >         bool pin_overlays;
> > > +       unsigned int max_dspp_count = 0;
> > > +       unsigned int enc_mask = 0;
> > >
> > >         struct msm_drm_private *priv;
> > >         struct dpu_mdss_cfg *catalog;
> > > +       struct msm_display_topology topology = {0};
> > >
> > >         int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
> > >         int max_crtc_count;
> > > @@ -754,10 +757,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms
> > *dpu_kms)
> > >         }
> > >
> > >         max_crtc_count = min(max_crtc_count, primary_planes_idx);
> > > +       max_dspp_count = catalog->dspp_count;
> > > +
> > > +       drm_for_each_encoder(encoder, dev) {
> > > +               topology = dpu_encoder_get_topology(encoder, dpu_kms,
> > > + NULL);
> >
> > This can crash dpu_encoder_get_topology() because it checks mode->hdisplay.
> > And the check anyway is futile here. We do not know if the encoder is going to
> > use 1 or 2 LMs (since we do not know the resolution), so we do not know
> > whether it will use 1 or 2 DSPP blocks.
> >
> > > +               if (topology.num_dspp > 0 && (topology.num_dspp <=
> > max_dspp_count)) {
> > > +                       enc_mask |= BIT(encoder->index);
> > > +                       max_dspp_count -= topology.num_dspp;
> > > +               }
> > > +       }
> > >
> > >         /* Create one CRTC per encoder */
> > >         for (i = 0; i < max_crtc_count; i++) {
> > > -               crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> > > +               crtc = dpu_crtc_init(dev, primary_planes[i],
> > > + cursor_planes[i], enc_mask);
> > >                 if (IS_ERR(crtc)) {
> > >                         ret = PTR_ERR(crtc);
> > >                         return ret;
> > > @@ -765,9 +777,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms
> > *dpu_kms)
> > >                 priv->crtcs[priv->num_crtcs++] = crtc;
> > >         }
> > >
> > > -       /* All CRTCs are compatible with all encoders */
> > > -       drm_for_each_encoder(encoder, dev)
> > > -               encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
> > > +       /* Attach CRTC's to compatiable encoders */
> >
> > compatible
> >
> >
> > > +       drm_for_each_encoder(encoder, dev) {
> > > +               encoder->possible_crtcs = (enc_mask & BIT(encoder->index)) ?
> > > +                               BIT(encoder->index) : (((1 << priv->num_crtcs) - 1) &
> > ~enc_mask);
> > > +       }
> > >
> > >         return 0;
> > >  }
> > > --
> > > 2.7.4
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
