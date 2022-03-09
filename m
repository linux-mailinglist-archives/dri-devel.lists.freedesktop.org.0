Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8914D3875
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 19:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C08810E3CC;
	Wed,  9 Mar 2022 18:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB3989F2E;
 Wed,  9 Mar 2022 18:09:11 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so3828112ooa.10; 
 Wed, 09 Mar 2022 10:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkDWW9U7DMlW8mlewgl7J3b86SIG4tg6kP9Xs14nOvI=;
 b=DyE5XqBCPwsyuT5pdmDd/G4gHoRryBiGLNLB9Elb9D2FrnDE9B+70gUp6LGjcy26I6
 cmpc5jyKGpQReWk3RubNKR92iCFudMIDYZLIxgI9WG7wQXjqCDBisXPWZ5yZDvOnajMo
 euswE0OG88QTNZz4Y8KXgkY2Kfs0niKcu+/mihmS0lbfzntAT5Vx/fkNIix2MzYLcadr
 DbADWQX6klNT8AqeBWZsHasYWmfz0xqheF2xEy2e0Zbv8rLAl6RwFdG3lk2WzozVfwBO
 iPraMftB+FWgntSdu1AjQhu60qYxzeRXOCjtTYWlfCuG2gfqafm+TMMYnq3gkfY1noAe
 WDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkDWW9U7DMlW8mlewgl7J3b86SIG4tg6kP9Xs14nOvI=;
 b=kpECmBS52kTmTwMtYueUzH3DDcvo3VXUOi38E0w0IwNBaltQz/ON+IBNcBb8nMTxP/
 Ht5GMYdUNjSQBf9ZtjDsDP0o+MvKfIkvFbEa3gtQa7W2s3GOz2vWy8hpJ8u2p6kWYwdd
 HdaGtG5E5bcjCm5Wl0w7fJCoFQmaf86Nb5A3h2AQvkwuewXoEjdIJtuZJ6ao7ZkvIv6f
 KTNcvcHxjNnehxXLfg2c6nbODnsjxRqwFQybo6w45BRK26cxqSMXIspNZU4o4z7bsmpK
 PlxoSB+UXud03WcKFRnPRAnrTAkwIKUg4JPkq1DJqDbN/Zd4pTYwMGfQAVrCSBcnBheY
 M4Fw==
X-Gm-Message-State: AOAM5321oOC1ez64Pt1ssZm5QHHYg+3zbDztSX9Tg2Kh+ZznfPO2P7jR
 BsWlgsXW8PRTWCIOPw9siUiwXcaQ7F5WQPO6GumWMZRz
X-Google-Smtp-Source: ABdhPJymyK9YDH2ZKXUJo10z3eC5npfp2eFelcbxL6tES5H8LHLiHZ5EnTlMZCYSf79CygZ0RMlHh+jMZsgbVxYkVbE=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:2b29 with SMTP id
 h16-20020a056870d25000b000da0b3f2b29mr5777139oac.200.1646849350753; Wed, 09
 Mar 2022 10:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20220309150606.1877288-1-sean@poorly.run>
 <CACK8Z6GsZd5E74ZB9hRHWVov_cE0AfDNFcEvWeJHmtQAf_vz4A@mail.gmail.com>
In-Reply-To: <CACK8Z6GsZd5E74ZB9hRHWVov_cE0AfDNFcEvWeJHmtQAf_vz4A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Mar 2022 13:08:58 -0500
Message-ID: <CADnq5_O0+GcVSWRK4YtVxSmU2s57Hnc18c9Ss7pZDsMBe0TMiQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Add support for drm_privacy_screen
To: Rajat Jain <rajatja@google.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 9, 2022 at 12:54 PM Rajat Jain <rajatja@google.com> wrote:
>
> On Wed, Mar 9, 2022 at 7:06 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch adds the necessary hooks to make amdgpu aware of privacy
> > screens. On devices with privacy screen drivers (such as thinkpad-acpi),
> > the amdgpu driver will defer probe until it's ready and then sync the sw
> > and hw state on each commit the connector is involved and enabled.
> >
> > Changes in v2:
> > -Tweaked the drm_privacy_screen_get() error check to avoid logging
> >  errors when privacy screen is absent (Hans)
> >
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/477640/ #v1
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 2ab675123ae3..e2cfae56c020 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_aperture.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_gem.h>
> > +#include <drm/drm_privacy_screen_consumer.h>
> >  #include <drm/drm_vblank.h>
> >  #include <drm/drm_managed.h>
> >  #include "amdgpu_drv.h"
> > @@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >  {
> >         struct drm_device *ddev;
> >         struct amdgpu_device *adev;
> > +       struct drm_privacy_screen *privacy_screen;
> >         unsigned long flags = ent->driver_data;
> >         int ret, retry = 0, i;
> >         bool supports_atomic = false;
> > @@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >         size = pci_resource_len(pdev, 0);
> >         is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
> >
> > +       /* If the LCD panel has a privacy screen, defer probe until its ready */
> > +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> > +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
> > +               return -EPROBE_DEFER;
> > +
> > +       drm_privacy_screen_put(privacy_screen);
> > +
> >         /* Get rid of things like offb */
> >         ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
> >         if (ret)
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index e1d3db3fe8de..9e2bb6523add 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
> >                 if (acrtc) {
> >                         new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
> >                         old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
> > +
> > +                       /* Sync the privacy screen state between hw and sw */
> > +                       drm_connector_update_privacy_screen(new_con_state);
> >                 }
> >
> >                 /* Skip any modesets/resets */
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 740435ae3997..594a8002975a 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -27,6 +27,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/dp/drm_dp_mst_helper.h>
> >  #include <drm/dp/drm_dp_helper.h>
> > +#include <drm/drm_privacy_screen_consumer.h>
> >  #include "dm_services.h"
> >  #include "amdgpu.h"
> >  #include "amdgpu_dm.h"
> > @@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> >                                        struct amdgpu_dm_connector *aconnector,
> >                                        int link_index)
> >  {
> > +       struct drm_device *dev = dm->ddev;
> >         struct dc_link_settings max_link_enc_cap = {0};
> >
> >         aconnector->dm_dp_aux.aux.name =
> > @@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> >         drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> >                                       &aconnector->base);
> >
> > -       if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
> > +       if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
> > +               struct drm_privacy_screen *privacy_screen)
> > +
> > +               /* Reference given up in drm_connector_cleanup() */
> > +               privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>
> Can we try to be more specific when looking up for privacy screen, e.g.:
>
> privacy_screen = drm_privacy_screen_get(dev->dev,  "eDP-1");
> (and then also making the corresponding change in arch_init_data[] in
> drm_privacy_screen_x86.c"
>
> My comment applies to this driver as well as to i915. The reason being
> today there is only 1 internal display with privacy screen so we can
> just assume that there shall be only 1 privacy-screen and that shall
> apply to eDP-1/internal display. But dual display systems are not far
> enough out, and perhaps external monitors with inbuilt
> privacy-screens?
>
> Essentially the gap today is that today on Chromeos ACPI side, the
> device GOOG0010 represents the privacy-screen attached to the internal
> display/eDP-1, but there isn't a way to make it clear in the i915 and
> now amdgpu code.

I was wondering the same thing.  There are devices out there today
that have multiple eDP panels already.  I don't know that there are
any platforms today with privacy screens and multiple panels, but as
you say, I suppose it is only a matter of time.  Additionally what if
you have several eDP panels and only one has a privacy screen?  How do
you map to the appropriate display?

Alex

>
> Thanks,
>
> Rajat
>
>
> > +               if (!IS_ERR(privacy_screen)) {
> > +                       drm_connector_attach_privacy_screen_provider(&aconnector->base,
> > +                                                                    privacy_screen);
> > +               } else if (PTR_ERR(privacy_screen) != -ENODEV) {
> > +                       drm_err(dev, "Error getting privacy screen, ret=%d\n",
> > +                               PTR_ERR(privacy_screen));
> > +               }
> >                 return;
> > +       }
> >
> >         dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
> >         aconnector->mst_mgr.cbs = &dm_mst_cbs;
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
