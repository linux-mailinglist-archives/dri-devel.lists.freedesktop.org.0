Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899524E434D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 16:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA9810E569;
	Tue, 22 Mar 2022 15:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF6C10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 15:46:43 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so3238302pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEJnqRu8DvO6AoU0cJM4rIVffz3rkRR5HXl1ShYlvQ8=;
 b=VRTEGXpSHiNNt9P0SFL+bh/T2V9coeIJtShLc999qTAmiQaVfSPEOHUIBsduve9TOy
 gUo0YhZ4cn/0L1ez4Efq0BLjXHTlI3gpAyd/VOhL3wl09rnaajpSUpUFz8H6TSS6i5/w
 dHeounRRMJ7jDlvfBi8SLsyojlenmQmJ66OCZ3r+Bfm2YyM95je6vOXC09qlkL/NF1Fl
 hZMi+dMxKa42peG69jugtK/hR8nIZRqM4TI9oyJEjDXCpAG6ytA77I3IYkzaxJHakHzD
 EzHcaV5KDUi3ike9GOHDc576sjJm5ZU7dy/Ddtd+Ni0ZEDDNQ7gXnn7UTe3KkTt8TF+B
 7KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEJnqRu8DvO6AoU0cJM4rIVffz3rkRR5HXl1ShYlvQ8=;
 b=t2jWrpsAkQ0zXZP6V8rLZcS3uMkipE24TLIOINjJjgT2l1vcse8tmvYdd6WuCRm8PW
 K4SN9XXc1e7ArYrur8rz6uSPh5WQrsLwAb84ugOYBqLcVjaggWp0B2RsL4A0kS0c/vBd
 3zKQEXXOL7x7CKJzRQLn6wYVWl2aBqGzAaM4NjJ3W4Tin/iYbElfoQwtthiZ25ZGqkum
 Cb6gr3Sw2ePFKlet+tSlv3gccB2lZhWejoV5CyubJm3D+W1K7aXvsN+CZHOSY+zTET4+
 PLSEwtrRvF12mN9yIoqkKKbo1qgv0+v48U1DO3HDun6sglyHtRUEE4BkqPn/Y1/mqo53
 Y+/g==
X-Gm-Message-State: AOAM533L9N4GNWL8Z4VwsTaNAof+QMbGOApInToTle9a/BmLaC2kAxyj
 Fca7dXMaXfP70y5yO8sdZ6kJ9jx+j2yM6w4pLnA=
X-Google-Smtp-Source: ABdhPJwHnvoJSNtYMR3EbggYoU67hQqkMPrZALyBwDbG8BhxOXZtqn5b2QM1ghdDiwP0J/ofOOahrcziZAcOaUZdXSE=
X-Received: by 2002:a17:90b:3850:b0:1c6:572e:f39a with SMTP id
 nl16-20020a17090b385000b001c6572ef39amr5760111pjb.233.1647964002897; Tue, 22
 Mar 2022 08:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <20220322131742.11566-3-patrik.r.jakobsson@gmail.com>
 <Yjnfi1h8tKRgL0Kl@phenom.ffwll.local>
In-Reply-To: <Yjnfi1h8tKRgL0Kl@phenom.ffwll.local>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 22 Mar 2022 16:46:31 +0100
Message-ID: <CAMeQTsbOgGV4z88fQH-GXH+eg9TWHPOLJDg_c8r1Pj8pKXKUPw@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/gma500: Make use of the drm connector iterator
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 3:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Mar 22, 2022 at 02:17:38PM +0100, Patrik Jakobsson wrote:
> > This makes sure we're using proper locking when iterating the list of
> > connectors.
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>
> Note that this is only needed if your driver deals with hotpluggable
> connectors. Since gma500 doesn't, not really a need to convert this over,
> but it also doesn't hurt.

Good point. Not sure but I think there is a slight possibility that
Cedarview can support DP MST. If someone adds support for DP MST then
this code would make sense. I was never able to exercise the DP code
because I couldn't find an eDP cable that fits the Intel DN2800MT (my
only device with DP). Do you happen to know what the 40-pin connector
is called? Perhaps Intel has some standard for eDP connectors?

>
> If the kerneldoc doesn't explain this, maybe we should add it? Care for a
> patch.

I didn't see it being mentioned anywhere. I'll send a patch.

>
> Either way on the entire series:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for having a look.

>
> I'll leave it up to you whether you want to push this one too or not.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/gma500/cdv_device.c        | 10 ++++++--
> >  drivers/gpu/drm/gma500/cdv_intel_display.c |  9 +++++--
> >  drivers/gpu/drm/gma500/framebuffer.c       |  6 +++--
> >  drivers/gpu/drm/gma500/gma_display.c       | 16 ++++++++-----
> >  drivers/gpu/drm/gma500/oaktrail_crtc.c     | 17 ++++++++-----
> >  drivers/gpu/drm/gma500/oaktrail_lvds.c     | 15 ++++++------
> >  drivers/gpu/drm/gma500/psb_device.c        | 28 +++++++++++++++-------
> >  drivers/gpu/drm/gma500/psb_drv.c           | 10 ++++----
> >  drivers/gpu/drm/gma500/psb_intel_display.c | 15 ++++++++----
> >  9 files changed, 84 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
> > index f854f58bcbb3..dd32b484dd82 100644
> > --- a/drivers/gpu/drm/gma500/cdv_device.c
> > +++ b/drivers/gpu/drm/gma500/cdv_device.c
> > @@ -262,6 +262,7 @@ static int cdv_save_display_registers(struct drm_device *dev)
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       struct pci_dev *pdev = to_pci_dev(dev->dev);
> >       struct psb_save_area *regs = &dev_priv->regs;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >
> >       dev_dbg(dev->dev, "Saving GPU registers.\n");
> > @@ -298,8 +299,10 @@ static int cdv_save_display_registers(struct drm_device *dev)
> >       regs->cdv.saveIER = REG_READ(PSB_INT_ENABLE_R);
> >       regs->cdv.saveIMR = REG_READ(PSB_INT_MASK_R);
> >
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list, head)
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter)
> >               connector->funcs->dpms(connector, DRM_MODE_DPMS_OFF);
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       return 0;
> >  }
> > @@ -317,6 +320,7 @@ static int cdv_restore_display_registers(struct drm_device *dev)
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       struct pci_dev *pdev = to_pci_dev(dev->dev);
> >       struct psb_save_area *regs = &dev_priv->regs;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >       u32 temp;
> >
> > @@ -373,8 +377,10 @@ static int cdv_restore_display_registers(struct drm_device *dev)
> >
> >       drm_mode_config_reset(dev);
> >
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list, head)
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter)
> >               connector->funcs->dpms(connector, DRM_MODE_DPMS_ON);
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       /* Resume the modeset for every activated CRTC */
> >       drm_helper_resume_force_mode(dev);
> > diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
> > index 94ebc48a4349..0c3ddcdc29dc 100644
> > --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> > +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> > @@ -584,13 +584,14 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
> >       bool ok;
> >       bool is_lvds = false;
> >       bool is_dp = false;
> > -     struct drm_mode_config *mode_config = &dev->mode_config;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >       const struct gma_limit_t *limit;
> >       u32 ddi_select = 0;
> >       bool is_edp = false;
> >
> > -     list_for_each_entry(connector, &mode_config->connector_list, head) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               struct gma_encoder *gma_encoder =
> >                                       gma_attached_encoder(connector);
> >
> > @@ -613,10 +614,14 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
> >                       is_edp = true;
> >                       break;
> >               default:
> > +                     drm_connector_list_iter_end(&conn_iter);
> >                       DRM_ERROR("invalid output type.\n");
> >                       return 0;
> >               }
> > +
> > +             break;
> >       }
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       if (dev_priv->dplla_96mhz)
> >               /* low-end sku, 96/100 mhz */
> > diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> > index 2b99c996fdc2..0ac6ea5fd3a1 100644
> > --- a/drivers/gpu/drm/gma500/framebuffer.c
> > +++ b/drivers/gpu/drm/gma500/framebuffer.c
> > @@ -451,6 +451,7 @@ static const struct drm_mode_config_funcs psb_mode_funcs = {
> >  static void psb_setup_outputs(struct drm_device *dev)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >
> >       drm_mode_create_scaling_mode_property(dev);
> > @@ -461,8 +462,8 @@ static void psb_setup_outputs(struct drm_device *dev)
> >                                                       "backlight", 0, 100);
> >       dev_priv->ops->output_init(dev);
> >
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list,
> > -                         head) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
> >               struct drm_encoder *encoder = &gma_encoder->base;
> >               int crtc_mask = 0, clone_mask = 0;
> > @@ -505,6 +506,7 @@ static void psb_setup_outputs(struct drm_device *dev)
> >               encoder->possible_clones =
> >                   gma_connector_clones(dev, clone_mask);
> >       }
> > +     drm_connector_list_iter_end(&conn_iter);
> >  }
> >
> >  void psb_modeset_init(struct drm_device *dev)
> > diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> > index 1d7964c339f4..e8157464d9eb 100644
> > --- a/drivers/gpu/drm/gma500/gma_display.c
> > +++ b/drivers/gpu/drm/gma500/gma_display.c
> > @@ -27,17 +27,21 @@
> >  bool gma_pipe_has_type(struct drm_crtc *crtc, int type)
> >  {
> >       struct drm_device *dev = crtc->dev;
> > -     struct drm_mode_config *mode_config = &dev->mode_config;
> > -     struct drm_connector *l_entry;
> > +     struct drm_connector_list_iter conn_iter;
> > +     struct drm_connector *connector;
> >
> > -     list_for_each_entry(l_entry, &mode_config->connector_list, head) {
> > -             if (l_entry->encoder && l_entry->encoder->crtc == crtc) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             if (connector->encoder && connector->encoder->crtc == crtc) {
> >                       struct gma_encoder *gma_encoder =
> > -                                             gma_attached_encoder(l_entry);
> > -                     if (gma_encoder->type == type)
> > +                                             gma_attached_encoder(connector);
> > +                     if (gma_encoder->type == type) {
> > +                             drm_connector_list_iter_end(&conn_iter);
> >                               return true;
> > +                     }
> >               }
> >       }
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       return false;
> >  }
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > index 36c7c2686c90..873c17cf8fb4 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > @@ -372,9 +372,9 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
> >       bool ok, is_sdvo = false;
> >       bool is_lvds = false;
> >       bool is_mipi = false;
> > -     struct drm_mode_config *mode_config = &dev->mode_config;
> >       struct gma_encoder *gma_encoder = NULL;
> >       uint64_t scalingType = DRM_MODE_SCALE_FULLSCREEN;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >       int i;
> >       int need_aux = gma_pipe_has_type(crtc, INTEL_OUTPUT_SDVO) ? 1 : 0;
> > @@ -392,7 +392,8 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
> >               adjusted_mode,
> >               sizeof(struct drm_display_mode));
> >
> > -     list_for_each_entry(connector, &mode_config->connector_list, head) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               if (!connector->encoder || connector->encoder->crtc != crtc)
> >                       continue;
> >
> > @@ -409,8 +410,16 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
> >                       is_mipi = true;
> >                       break;
> >               }
> > +
> > +             break;
> >       }
> >
> > +     if (gma_encoder)
> > +             drm_object_property_get_value(&connector->base,
> > +                     dev->mode_config.scaling_mode_property, &scalingType);
> > +
> > +     drm_connector_list_iter_end(&conn_iter);
> > +
> >       /* Disable the VGA plane that we never use */
> >       for (i = 0; i <= need_aux; i++)
> >               REG_WRITE_WITH_AUX(VGACNTRL, VGA_DISP_DISABLE, i);
> > @@ -424,10 +433,6 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
> >                                            (mode->crtc_vdisplay - 1), i);
> >       }
> >
> > -     if (gma_encoder)
> > -             drm_object_property_get_value(&connector->base,
> > -                     dev->mode_config.scaling_mode_property, &scalingType);
> > -
> >       if (scalingType == DRM_MODE_SCALE_NO_SCALE) {
> >               /* Moorestown doesn't have register support for centering so
> >                * we need to mess with the h/vblank and h/vsync start and
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > index 28b995ef2844..04852dbc7fb3 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > @@ -85,7 +85,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
> >       struct drm_device *dev = encoder->dev;
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
> > -     struct drm_mode_config *mode_config = &dev->mode_config;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector = NULL;
> >       struct drm_crtc *crtc = encoder->crtc;
> >       u32 lvds_port;
> > @@ -112,21 +112,22 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
> >       REG_WRITE(LVDS, lvds_port);
> >
> >       /* Find the connector we're trying to set up */
> > -     list_for_each_entry(connector, &mode_config->connector_list, head) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               if (connector->encoder && connector->encoder->crtc == crtc)
> >                       break;
> >       }
> >
> > -     if (list_entry_is_head(connector, &mode_config->connector_list, head)) {
> > +     if (!connector) {
> > +             drm_connector_list_iter_end(&conn_iter);
> >               DRM_ERROR("Couldn't find connector when setting mode");
> >               gma_power_end(dev);
> >               return;
> >       }
> >
> > -     drm_object_property_get_value(
> > -             &connector->base,
> > -             dev->mode_config.scaling_mode_property,
> > -             &v);
> > +     drm_object_property_get_value( &connector->base,
> > +             dev->mode_config.scaling_mode_property, &v);
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       if (v == DRM_MODE_SCALE_NO_SCALE)
> >               REG_WRITE(PFIT_CONTROL, 0);
> > diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
> > index 59f325165667..71534f4ca834 100644
> > --- a/drivers/gpu/drm/gma500/psb_device.c
> > +++ b/drivers/gpu/drm/gma500/psb_device.c
> > @@ -168,8 +168,10 @@ static void psb_init_pm(struct drm_device *dev)
> >  static int psb_save_display_registers(struct drm_device *dev)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> > +     struct gma_connector *gma_connector;
> >       struct drm_crtc *crtc;
> > -     struct gma_connector *connector;
> > +     struct drm_connector_list_iter conn_iter;
> > +     struct drm_connector *connector;
> >       struct psb_state *regs = &dev_priv->regs.psb;
> >
> >       /* Display arbitration control + watermarks */
> > @@ -189,9 +191,13 @@ static int psb_save_display_registers(struct drm_device *dev)
> >                       dev_priv->ops->save_crtc(crtc);
> >       }
> >
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list, base.head)
> > -             if (connector->save)
> > -                     connector->save(&connector->base);
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             gma_connector = to_gma_connector(connector);
> > +             if (gma_connector->save)
> > +                     gma_connector->save(connector);
> > +     }
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       drm_modeset_unlock_all(dev);
> >       return 0;
> > @@ -206,8 +212,10 @@ static int psb_save_display_registers(struct drm_device *dev)
> >  static int psb_restore_display_registers(struct drm_device *dev)
> >  {
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> > +     struct gma_connector *gma_connector;
> >       struct drm_crtc *crtc;
> > -     struct gma_connector *connector;
> > +     struct drm_connector_list_iter conn_iter;
> > +     struct drm_connector *connector;
> >       struct psb_state *regs = &dev_priv->regs.psb;
> >
> >       /* Display arbitration + watermarks */
> > @@ -228,9 +236,13 @@ static int psb_restore_display_registers(struct drm_device *dev)
> >               if (drm_helper_crtc_in_use(crtc))
> >                       dev_priv->ops->restore_crtc(crtc);
> >
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list, base.head)
> > -             if (connector->restore)
> > -                     connector->restore(&connector->base);
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             gma_connector = to_gma_connector(connector);
> > +             if (gma_connector->restore)
> > +                     gma_connector->restore(connector);
> > +     }
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       drm_modeset_unlock_all(dev);
> >       return 0;
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> > index b231fddb8817..bb0e3288e35b 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -236,10 +236,11 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >       unsigned long resource_start, resource_len;
> >       unsigned long irqflags;
> > -     int ret = -ENOMEM;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >       struct gma_encoder *gma_encoder;
> >       struct psb_gtt *pg;
> > +     int ret = -ENOMEM;
> >
> >       /* initializing driver private data */
> >
> > @@ -390,9 +391,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >       psb_fbdev_init(dev);
> >       drm_kms_helper_poll_init(dev);
> >
> > -     /* Only add backlight support if we have LVDS output */
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list,
> > -                         head) {
> > +     /* Only add backlight support if we have LVDS or MIPI output */
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               gma_encoder = gma_attached_encoder(connector);
> >
> >               switch (gma_encoder->type) {
> > @@ -402,6 +403,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >                       break;
> >               }
> >       }
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       if (ret)
> >               return ret;
> > diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> > index a99859b5b13a..fb8234f4d128 100644
> > --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> > +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> > @@ -106,7 +106,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
> >       u32 dpll = 0, fp = 0, dspcntr, pipeconf;
> >       bool ok, is_sdvo = false;
> >       bool is_lvds = false, is_tv = false;
> > -     struct drm_mode_config *mode_config = &dev->mode_config;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> >       const struct gma_limit_t *limit;
> >
> > @@ -116,7 +116,8 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
> >               return 0;
> >       }
> >
> > -     list_for_each_entry(connector, &mode_config->connector_list, head) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
> >
> >               if (!connector->encoder
> > @@ -135,6 +136,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
> >                       break;
> >               }
> >       }
> > +     drm_connector_list_iter_end(&conn_iter);
> >
> >       refclk = 96000;
> >
> > @@ -534,16 +536,19 @@ struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev, int pipe)
> >
> >  int gma_connector_clones(struct drm_device *dev, int type_mask)
> >  {
> > -     int index_mask = 0;
> > +     struct drm_connector_list_iter conn_iter;
> >       struct drm_connector *connector;
> > +     int index_mask = 0;
> >       int entry = 0;
> >
> > -     list_for_each_entry(connector, &dev->mode_config.connector_list,
> > -                         head) {
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> >               struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
> >               if (type_mask & (1 << gma_encoder->type))
> >                       index_mask |= (1 << entry);
> >               entry++;
> >       }
> > +     drm_connector_list_iter_end(&conn_iter);
> > +
> >       return index_mask;
> >  }
> > --
> > 2.35.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
