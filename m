Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC9D11DF55
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52DD6E2B6;
	Fri, 13 Dec 2019 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494D96ED58
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 13:32:54 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x18so1546681vsq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M7C9aSlUgpqfw4mgxFme/7RU5prrTA31Rw7GFww5H1c=;
 b=SrdgTv44+PFehOkA6eZHndfj3W1huu+84jgIbDTRiNyhtz6u6fShhtOenjOsjqqRCR
 Ny2FAAi6CUfG5MJU45PfKm+50hiRyICHLmVhnnaCO1sAQmw0RRxTK/ys7YXL7X7c8gj3
 Osd3387WPenBTYLS9nFAhE0dcz03wmrzfaSF2q3/SfKaUjqHzWPfKEWS13LqXTbNgBoc
 PKaLE5ZmrO0+v8sAMMglQSnvJobmKXNqKg1O1m8WFjXbls0OAqnP/WG3INzUU7S5kcVd
 kHp+WDUZA/kTwZciOSkLqjz0cK7eOsjECzVfDLSghjUyZvbw05ruv6uztiiregzxuR5R
 w4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M7C9aSlUgpqfw4mgxFme/7RU5prrTA31Rw7GFww5H1c=;
 b=M0Ga/bv7BnAz5uBVuciKm2gnT7yuoGksuK3lRFwho+wXFqYtk7kTxm2scZ7zacWn25
 FX2temKOL91bwN8B9UJ+l72RbTrwaIRh5oa9quHqYRIyJQRE8idz4TG4/QcGCGSOlz4s
 K/kRtmkk+3Y6PkeKBl1hl91qLWAzGQYSayGeCvOt68+uYYi7iszoOW7kccgjFo2tSP9Y
 DXRV7gewq23szWLWB8oJvEwmmOJSPlJGvt1rYCKNnzoSJA1NpAdlFMhQ8B+br6427LTr
 scWKRgJahasDpl/b2Jf9GEAAKSi5PYPg+YiSrdMHBWb0W/U5ckbuYrU9TjvbvPZmb6AO
 8VoQ==
X-Gm-Message-State: APjAAAWv+CoHzgRtewKd3f0eOa5wKqoJEtZulimM/2jSWAUc9I4x4e7B
 av2BVSeeGsOb0l92ASxe1AxB45iMAk/ntpjTNJzBKw==
X-Google-Smtp-Source: APXvYqy9VeEQYE74RhSGJEjk8msNqkhICxkU8FqTw78sW/FOrqw+Bm9kd9d3Ubw8htZG0/OigPeuVkY32jOPMgRph1M=
X-Received: by 2002:a05:6102:1270:: with SMTP id
 q16mr2006507vsg.191.1576157572184; 
 Thu, 12 Dec 2019 05:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20191209130336.2257506-1-thierry.reding@gmail.com>
 <20191209130336.2257506-2-thierry.reding@gmail.com>
 <CAPDyKFp6cnpn4yFaEBDPBdHc1siQvJbmwedbhRNCdDBVAc2qUA@mail.gmail.com>
 <20191212123352.GA3322354@ulmo>
In-Reply-To: <20191212123352.GA3322354@ulmo>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Dec 2019 14:32:15 +0100
Message-ID: <CAPDyKFodOjta0JnEEMrC0j5=XeB-wLjTNvPFtmDtUBZBMTJvQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/tegra: Do not implement runtime PM
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Dec 2019 at 13:33, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Dec 12, 2019 at 09:52:22AM +0100, Ulf Hansson wrote:
> > On Mon, 9 Dec 2019 at 14:03, Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The Tegra DRM driver heavily relies on the implementations for runtime
> > > suspend/resume to be called at specific times. Unfortunately, there are
> > > some cases where that doesn't work. One example is if the user disables
> > > runtime PM for a given subdevice. Another example is that the PM core
> > > acquires a reference to runtime PM during system sleep, effectively
> > > preventing devices from going into low power modes. This is intentional
> > > to avoid nasty race conditions, but it also causes system sleep to not
> > > function properly on all Tegra systems.
> >
> > Are the problems you refer to above, solely for system suspend/resume?
>
> No, this patch also fixes potential issues with regular operation of the
> display driver. The problem is that parts of the driver rely on being
> able to shut down the hardware during runtime operations, such as
> disabling an output. Under some circumstances part of this shutdown will
> imply a reset and, at least on some platforms, we rely on that reset to
> put the device into a known good state.
>
> So if a user decides to prevent the device from runtime suspending, we
> can potentially run into a situation where we can't properly set a
> display mode at runtime since we weren't allowed to reset the device.

Thanks for clarifying!

We have very similar issues for SDIO functional drivers (WiFi
drivers). Typically, at some point there needs to be a guarantee that
the power has been cut in between a "put" and "get", as to be able to
re-program a FW.

My worry in regards to this, is that we may reinvent the wheel over
and over again, just because runtime PM today isn't a good fit.

In principle, if you could, somehow forbid user-space from preventing
the device from being runtime suspended, that would do the trick,
wouldn't it?

When it comes to system suspend/resume I am less concerned, as we have
a couple of different methods to address this problem.

>
> > > Fix this by not implementing runtime PM at all. Instead, a minimal,
> > > reference-counted suspend/resume infrastructure is added to the host1x
> > > bus. This has the benefit that it can be used regardless of the system
> > > power state (or any transitions we might be in), or whether or not the
> > > user allows runtime PM.
> > >
> > > Atomic modesetting guarantees that these functions will end up being
> > > called at the right point in time, so the pitfalls for the more generic
> > > runtime PM do not apply here.
> >
> > Before I go on a look more closely to the code...
> >
> > How do these changes affect the control of the power-rails for the
> > related devices? We should strive towards using PM domain(s), that
> > gets attached to the device.
> >
> > Is that still the case or are these changes causing more calls to
> > shortcut that path, which means more calls into SoC specific code
> > directly from the drivers?
>
> This shouldn't change anything with regards to power domains. We still
> attach to those and use generic PM domains if they are available. If you
> look at the implementations for these "runtime" suspend/resume
> operations, they will in fact release/acquire a runtime PM reference,
> respectively. This is done to make sure that generic PM domain
> references are properly balanced, so that the power domains get turned
> off when none of the devices are using them anymore.
>
> The only calls to SoC specific code is the same that we used to have
> before, which we need for backwards-compatibility with old device trees.
> In practice we never hit those code paths anymore because all Tegra
> devices allow updating the DTB at the same time as the kernel. But users
> could technically be running a really old device tree against a recent
> kernel and then they'd need those legacy code paths to ensure the
> devices are powered on.

Great, this makes me comfortable with this approach!

Kind regards
Uffe

>
> Thierry
>
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - keep runtime PM for VIC
> > >
> > >  drivers/gpu/drm/tegra/dc.c    | 141 ++++++++++++++----------
> > >  drivers/gpu/drm/tegra/dpaux.c |   2 +-
> > >  drivers/gpu/drm/tegra/drm.h   |   2 +
> > >  drivers/gpu/drm/tegra/dsi.c   | 175 ++++++++++++++++--------------
> > >  drivers/gpu/drm/tegra/hdmi.c  | 116 +++++++++++---------
> > >  drivers/gpu/drm/tegra/hub.c   | 194 ++++++++++++++++++++--------------
> > >  drivers/gpu/drm/tegra/hub.h   |   2 +-
> > >  drivers/gpu/drm/tegra/sor.c   | 154 +++++++++++++++------------
> > >  drivers/gpu/host1x/bus.c      |  75 +++++++++++++
> > >  include/linux/host1x.h        |  11 ++
> > >  10 files changed, 541 insertions(+), 331 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > > index 2983eb33f2be..871046f3f469 100644
> > > --- a/drivers/gpu/drm/tegra/dc.c
> > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > @@ -1737,6 +1737,7 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
> > >  {
> > >         struct tegra_dc *dc = to_tegra_dc(crtc);
> > >         u32 value;
> > > +       int err;
> > >
> > >         if (!tegra_dc_idle(dc)) {
> > >                 tegra_dc_stop(dc);
> > > @@ -1783,7 +1784,9 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
> > >
> > >         spin_unlock_irq(&crtc->dev->event_lock);
> > >
> > > -       pm_runtime_put_sync(dc->dev);
> > > +       err = host1x_client_suspend(&dc->client);
> > > +       if (err < 0)
> > > +               dev_err(dc->dev, "failed to suspend: %d\n", err);
> > >  }
> > >
> > >  static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
> > > @@ -1793,8 +1796,13 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
> > >         struct tegra_dc_state *state = to_dc_state(crtc->state);
> > >         struct tegra_dc *dc = to_tegra_dc(crtc);
> > >         u32 value;
> > > +       int err;
> > >
> > > -       pm_runtime_get_sync(dc->dev);
> > > +       err = host1x_client_resume(&dc->client);
> > > +       if (err < 0) {
> > > +               dev_err(dc->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         /* initialize display controller */
> > >         if (dc->syncpt) {
> > > @@ -2022,6 +2030,15 @@ static int tegra_dc_init(struct host1x_client *client)
> > >         if (!tegra_dc_has_window_groups(dc))
> > >                 return 0;
> > >
> > > +       /*
> > > +        * Set the display hub as the host1x client parent for the display
> > > +        * controller. This is needed for the runtime reference counting that
> > > +        * ensures the display hub is always powered when any of the display
> > > +        * controllers are.
> > > +        */
> > > +       if (dc->soc->has_nvdisplay)
> > > +               client->parent = &tegra->hub->client;
> > > +
> > >         dc->syncpt = host1x_syncpt_request(client, flags);
> > >         if (!dc->syncpt)
> > >                 dev_warn(dc->dev, "failed to allocate syncpoint\n");
> > > @@ -2131,9 +2148,74 @@ static int tegra_dc_exit(struct host1x_client *client)
> > >         return 0;
> > >  }
> > >
> > > +static int tegra_dc_runtime_suspend(struct host1x_client *client)
> > > +{
> > > +       struct tegra_dc *dc = host1x_client_to_dc(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       err = reset_control_assert(dc->rst);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to assert reset: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       if (dc->soc->has_powergate)
> > > +               tegra_powergate_power_off(dc->powergate);
> > > +
> > > +       clk_disable_unprepare(dc->clk);
> > > +       pm_runtime_put_sync(dev);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int tegra_dc_runtime_resume(struct host1x_client *client)
> > > +{
> > > +       struct tegra_dc *dc = host1x_client_to_dc(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       err = pm_runtime_get_sync(dev);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to get runtime PM: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       if (dc->soc->has_powergate) {
> > > +               err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
> > > +                                                       dc->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to power partition: %d\n", err);
> > > +                       goto put_rpm;
> > > +               }
> > > +       } else {
> > > +               err = clk_prepare_enable(dc->clk);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to enable clock: %d\n", err);
> > > +                       goto put_rpm;
> > > +               }
> > > +
> > > +               err = reset_control_deassert(dc->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to deassert reset: %d\n", err);
> > > +                       goto disable_clk;
> > > +               }
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +disable_clk:
> > > +       clk_disable_unprepare(dc->clk);
> > > +put_rpm:
> > > +       pm_runtime_put_sync(dev);
> > > +       return err;
> > > +}
> > > +
> > >  static const struct host1x_client_ops dc_client_ops = {
> > >         .init = tegra_dc_init,
> > >         .exit = tegra_dc_exit,
> > > +       .suspend = tegra_dc_runtime_suspend,
> > > +       .resume = tegra_dc_runtime_resume,
> > >  };
> > >
> > >  static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
> > > @@ -2545,65 +2627,10 @@ static int tegra_dc_remove(struct platform_device *pdev)
> > >         return 0;
> > >  }
> > >
> > > -#ifdef CONFIG_PM
> > > -static int tegra_dc_suspend(struct device *dev)
> > > -{
> > > -       struct tegra_dc *dc = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       err = reset_control_assert(dc->rst);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "failed to assert reset: %d\n", err);
> > > -               return err;
> > > -       }
> > > -
> > > -       if (dc->soc->has_powergate)
> > > -               tegra_powergate_power_off(dc->powergate);
> > > -
> > > -       clk_disable_unprepare(dc->clk);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -static int tegra_dc_resume(struct device *dev)
> > > -{
> > > -       struct tegra_dc *dc = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       if (dc->soc->has_powergate) {
> > > -               err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
> > > -                                                       dc->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to power partition: %d\n", err);
> > > -                       return err;
> > > -               }
> > > -       } else {
> > > -               err = clk_prepare_enable(dc->clk);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to enable clock: %d\n", err);
> > > -                       return err;
> > > -               }
> > > -
> > > -               err = reset_control_deassert(dc->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to deassert reset: %d\n", err);
> > > -                       return err;
> > > -               }
> > > -       }
> > > -
> > > -       return 0;
> > > -}
> > > -#endif
> > > -
> > > -static const struct dev_pm_ops tegra_dc_pm_ops = {
> > > -       SET_RUNTIME_PM_OPS(tegra_dc_suspend, tegra_dc_resume, NULL)
> > > -};
> > > -
> > >  struct platform_driver tegra_dc_driver = {
> > >         .driver = {
> > >                 .name = "tegra-dc",
> > >                 .of_match_table = tegra_dc_of_match,
> > > -               .pm = &tegra_dc_pm_ops,
> > >         },
> > >         .probe = tegra_dc_probe,
> > >         .remove = tegra_dc_remove,
> > > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> > > index 622cdf1ad246..7dfb50f65067 100644
> > > --- a/drivers/gpu/drm/tegra/dpaux.c
> > > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > > @@ -588,7 +588,7 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
> > >         /* make sure pads are powered down when not in use */
> > >         tegra_dpaux_pad_power_down(dpaux);
> > >
> > > -       pm_runtime_put(&pdev->dev);
> > > +       pm_runtime_put_sync(&pdev->dev);
> > >         pm_runtime_disable(&pdev->dev);
> > >
> > >         drm_dp_aux_unregister(&dpaux->aux);
> > > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > > index d941553f7a3d..ed99b67deb29 100644
> > > --- a/drivers/gpu/drm/tegra/drm.h
> > > +++ b/drivers/gpu/drm/tegra/drm.h
> > > @@ -144,6 +144,8 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output);
> > >  void tegra_output_exit(struct tegra_output *output);
> > >  void tegra_output_find_possible_crtcs(struct tegra_output *output,
> > >                                       struct drm_device *drm);
> > > +int tegra_output_suspend(struct tegra_output *output);
> > > +int tegra_output_resume(struct tegra_output *output);
> > >
> > >  int tegra_output_connector_get_modes(struct drm_connector *connector);
> > >  enum drm_connector_status
> > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > > index ec475d022fa0..88b9d64c77bf 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > @@ -840,7 +840,9 @@ static void tegra_dsi_unprepare(struct tegra_dsi *dsi)
> > >                 dev_err(dsi->dev, "failed to disable MIPI calibration: %d\n",
> > >                         err);
> > >
> > > -       pm_runtime_put(dsi->dev);
> > > +       err = host1x_client_suspend(&dsi->client);
> > > +       if (err < 0)
> > > +               dev_err(dsi->dev, "failed to suspend: %d\n", err);
> > >  }
> > >
> > >  static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
> > > @@ -882,11 +884,15 @@ static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
> > >         tegra_dsi_unprepare(dsi);
> > >  }
> > >
> > > -static void tegra_dsi_prepare(struct tegra_dsi *dsi)
> > > +static int tegra_dsi_prepare(struct tegra_dsi *dsi)
> > >  {
> > >         int err;
> > >
> > > -       pm_runtime_get_sync(dsi->dev);
> > > +       err = host1x_client_resume(&dsi->client);
> > > +       if (err < 0) {
> > > +               dev_err(dsi->dev, "failed to resume: %d\n", err);
> > > +               return err;
> > > +       }
> > >
> > >         err = tegra_mipi_enable(dsi->mipi);
> > >         if (err < 0)
> > > @@ -899,6 +905,8 @@ static void tegra_dsi_prepare(struct tegra_dsi *dsi)
> > >
> > >         if (dsi->slave)
> > >                 tegra_dsi_prepare(dsi->slave);
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
> > > @@ -909,8 +917,13 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
> > >         struct tegra_dsi *dsi = to_dsi(output);
> > >         struct tegra_dsi_state *state;
> > >         u32 value;
> > > +       int err;
> > >
> > > -       tegra_dsi_prepare(dsi);
> > > +       err = tegra_dsi_prepare(dsi);
> > > +       if (err < 0) {
> > > +               dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         state = tegra_dsi_get_state(dsi);
> > >
> > > @@ -1075,9 +1088,89 @@ static int tegra_dsi_exit(struct host1x_client *client)
> > >         return 0;
> > >  }
> > >
> > > +static int tegra_dsi_runtime_suspend(struct host1x_client *client)
> > > +{
> > > +       struct tegra_dsi *dsi = host1x_client_to_dsi(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       if (dsi->rst) {
> > > +               err = reset_control_assert(dsi->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to assert reset: %d\n", err);
> > > +                       return err;
> > > +               }
> > > +       }
> > > +
> > > +       usleep_range(1000, 2000);
> > > +
> > > +       clk_disable_unprepare(dsi->clk_lp);
> > > +       clk_disable_unprepare(dsi->clk);
> > > +
> > > +       regulator_disable(dsi->vdd);
> > > +       pm_runtime_put_sync(dev);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int tegra_dsi_runtime_resume(struct host1x_client *client)
> > > +{
> > > +       struct tegra_dsi *dsi = host1x_client_to_dsi(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       err = pm_runtime_get_sync(dev);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to get runtime PM: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       err = regulator_enable(dsi->vdd);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to enable VDD supply: %d\n", err);
> > > +               goto put_rpm;
> > > +       }
> > > +
> > > +       err = clk_prepare_enable(dsi->clk);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "cannot enable DSI clock: %d\n", err);
> > > +               goto disable_vdd;
> > > +       }
> > > +
> > > +       err = clk_prepare_enable(dsi->clk_lp);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "cannot enable low-power clock: %d\n", err);
> > > +               goto disable_clk;
> > > +       }
> > > +
> > > +       usleep_range(1000, 2000);
> > > +
> > > +       if (dsi->rst) {
> > > +               err = reset_control_deassert(dsi->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "cannot assert reset: %d\n", err);
> > > +                       goto disable_clk_lp;
> > > +               }
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +disable_clk_lp:
> > > +       clk_disable_unprepare(dsi->clk_lp);
> > > +disable_clk:
> > > +       clk_disable_unprepare(dsi->clk);
> > > +disable_vdd:
> > > +       regulator_disable(dsi->vdd);
> > > +put_rpm:
> > > +       pm_runtime_put_sync(dev);
> > > +       return err;
> > > +}
> > > +
> > >  static const struct host1x_client_ops dsi_client_ops = {
> > >         .init = tegra_dsi_init,
> > >         .exit = tegra_dsi_exit,
> > > +       .suspend = tegra_dsi_runtime_suspend,
> > > +       .resume = tegra_dsi_runtime_resume,
> > >  };
> > >
> > >  static int tegra_dsi_setup_clocks(struct tegra_dsi *dsi)
> > > @@ -1596,79 +1689,6 @@ static int tegra_dsi_remove(struct platform_device *pdev)
> > >         return 0;
> > >  }
> > >
> > > -#ifdef CONFIG_PM
> > > -static int tegra_dsi_suspend(struct device *dev)
> > > -{
> > > -       struct tegra_dsi *dsi = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       if (dsi->rst) {
> > > -               err = reset_control_assert(dsi->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to assert reset: %d\n", err);
> > > -                       return err;
> > > -               }
> > > -       }
> > > -
> > > -       usleep_range(1000, 2000);
> > > -
> > > -       clk_disable_unprepare(dsi->clk_lp);
> > > -       clk_disable_unprepare(dsi->clk);
> > > -
> > > -       regulator_disable(dsi->vdd);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -static int tegra_dsi_resume(struct device *dev)
> > > -{
> > > -       struct tegra_dsi *dsi = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       err = regulator_enable(dsi->vdd);
> > > -       if (err < 0) {
> > > -               dev_err(dsi->dev, "failed to enable VDD supply: %d\n", err);
> > > -               return err;
> > > -       }
> > > -
> > > -       err = clk_prepare_enable(dsi->clk);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "cannot enable DSI clock: %d\n", err);
> > > -               goto disable_vdd;
> > > -       }
> > > -
> > > -       err = clk_prepare_enable(dsi->clk_lp);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "cannot enable low-power clock: %d\n", err);
> > > -               goto disable_clk;
> > > -       }
> > > -
> > > -       usleep_range(1000, 2000);
> > > -
> > > -       if (dsi->rst) {
> > > -               err = reset_control_deassert(dsi->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "cannot assert reset: %d\n", err);
> > > -                       goto disable_clk_lp;
> > > -               }
> > > -       }
> > > -
> > > -       return 0;
> > > -
> > > -disable_clk_lp:
> > > -       clk_disable_unprepare(dsi->clk_lp);
> > > -disable_clk:
> > > -       clk_disable_unprepare(dsi->clk);
> > > -disable_vdd:
> > > -       regulator_disable(dsi->vdd);
> > > -       return err;
> > > -}
> > > -#endif
> > > -
> > > -static const struct dev_pm_ops tegra_dsi_pm_ops = {
> > > -       SET_RUNTIME_PM_OPS(tegra_dsi_suspend, tegra_dsi_resume, NULL)
> > > -};
> > > -
> > >  static const struct of_device_id tegra_dsi_of_match[] = {
> > >         { .compatible = "nvidia,tegra210-dsi", },
> > >         { .compatible = "nvidia,tegra132-dsi", },
> > > @@ -1682,7 +1702,6 @@ struct platform_driver tegra_dsi_driver = {
> > >         .driver = {
> > >                 .name = "tegra-dsi",
> > >                 .of_match_table = tegra_dsi_of_match,
> > > -               .pm = &tegra_dsi_pm_ops,
> > >         },
> > >         .probe = tegra_dsi_probe,
> > >         .remove = tegra_dsi_remove,
> > > diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> > > index 38bf1d16095f..cb504ec8f284 100644
> > > --- a/drivers/gpu/drm/tegra/hdmi.c
> > > +++ b/drivers/gpu/drm/tegra/hdmi.c
> > > @@ -1146,6 +1146,7 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
> > >         struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
> > >         struct tegra_hdmi *hdmi = to_hdmi(output);
> > >         u32 value;
> > > +       int err;
> > >
> > >         /*
> > >          * The following accesses registers of the display controller, so make
> > > @@ -1171,7 +1172,9 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
> > >         tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_ENABLE);
> > >         tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_MASK);
> > >
> > > -       pm_runtime_put(hdmi->dev);
> > > +       err = host1x_client_suspend(&hdmi->client);
> > > +       if (err < 0)
> > > +               dev_err(hdmi->dev, "failed to suspend: %d\n", err);
> > >  }
> > >
> > >  static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
> > > @@ -1186,7 +1189,11 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
> > >         u32 value;
> > >         int err;
> > >
> > > -       pm_runtime_get_sync(hdmi->dev);
> > > +       err = host1x_client_resume(&hdmi->client);
> > > +       if (err < 0) {
> > > +               dev_err(hdmi->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         /*
> > >          * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
> > > @@ -1489,9 +1496,66 @@ static int tegra_hdmi_exit(struct host1x_client *client)
> > >         return 0;
> > >  }
> > >
> > > +static int tegra_hdmi_runtime_suspend(struct host1x_client *client)
> > > +{
> > > +       struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       err = reset_control_assert(hdmi->rst);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to assert reset: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       usleep_range(1000, 2000);
> > > +
> > > +       clk_disable_unprepare(hdmi->clk);
> > > +       pm_runtime_put_sync(dev);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int tegra_hdmi_runtime_resume(struct host1x_client *client)
> > > +{
> > > +       struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       err = pm_runtime_get_sync(dev);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to get runtime PM: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       err = clk_prepare_enable(hdmi->clk);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to enable clock: %d\n", err);
> > > +               goto put_rpm;
> > > +       }
> > > +
> > > +       usleep_range(1000, 2000);
> > > +
> > > +       err = reset_control_deassert(hdmi->rst);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to deassert reset: %d\n", err);
> > > +               goto disable_clk;
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +disable_clk:
> > > +       clk_disable_unprepare(hdmi->clk);
> > > +put_rpm:
> > > +       pm_runtime_put_sync(dev);
> > > +       return err;
> > > +}
> > > +
> > >  static const struct host1x_client_ops hdmi_client_ops = {
> > >         .init = tegra_hdmi_init,
> > >         .exit = tegra_hdmi_exit,
> > > +       .suspend = tegra_hdmi_runtime_suspend,
> > > +       .resume = tegra_hdmi_runtime_resume,
> > >  };
> > >
> > >  static const struct tegra_hdmi_config tegra20_hdmi_config = {
> > > @@ -1699,58 +1763,10 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
> > >         return 0;
> > >  }
> > >
> > > -#ifdef CONFIG_PM
> > > -static int tegra_hdmi_suspend(struct device *dev)
> > > -{
> > > -       struct tegra_hdmi *hdmi = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       err = reset_control_assert(hdmi->rst);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "failed to assert reset: %d\n", err);
> > > -               return err;
> > > -       }
> > > -
> > > -       usleep_range(1000, 2000);
> > > -
> > > -       clk_disable_unprepare(hdmi->clk);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -static int tegra_hdmi_resume(struct device *dev)
> > > -{
> > > -       struct tegra_hdmi *hdmi = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       err = clk_prepare_enable(hdmi->clk);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "failed to enable clock: %d\n", err);
> > > -               return err;
> > > -       }
> > > -
> > > -       usleep_range(1000, 2000);
> > > -
> > > -       err = reset_control_deassert(hdmi->rst);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "failed to deassert reset: %d\n", err);
> > > -               clk_disable_unprepare(hdmi->clk);
> > > -               return err;
> > > -       }
> > > -
> > > -       return 0;
> > > -}
> > > -#endif
> > > -
> > > -static const struct dev_pm_ops tegra_hdmi_pm_ops = {
> > > -       SET_RUNTIME_PM_OPS(tegra_hdmi_suspend, tegra_hdmi_resume, NULL)
> > > -};
> > > -
> > >  struct platform_driver tegra_hdmi_driver = {
> > >         .driver = {
> > >                 .name = "tegra-hdmi",
> > >                 .of_match_table = tegra_hdmi_of_match,
> > > -               .pm = &tegra_hdmi_pm_ops,
> > >         },
> > >         .probe = tegra_hdmi_probe,
> > >         .remove = tegra_hdmi_remove,
> > > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > > index 5c7545ee5a5b..73e6fe9b833d 100644
> > > --- a/drivers/gpu/drm/tegra/hub.c
> > > +++ b/drivers/gpu/drm/tegra/hub.c
> > > @@ -105,17 +105,25 @@ static inline void tegra_plane_writel(struct tegra_plane *plane, u32 value,
> > >
> > >  static int tegra_windowgroup_enable(struct tegra_windowgroup *wgrp)
> > >  {
> > > +       int err = 0;
> > > +
> > >         mutex_lock(&wgrp->lock);
> > >
> > >         if (wgrp->usecount == 0) {
> > > -               pm_runtime_get_sync(wgrp->parent);
> > > +               err = host1x_client_resume(wgrp->parent);
> > > +               if (err < 0) {
> > > +                       dev_err(wgrp->parent->dev, "failed to resume: %d\n", err);
> > > +                       goto unlock;
> > > +               }
> > > +
> > >                 reset_control_deassert(wgrp->rst);
> > >         }
> > >
> > >         wgrp->usecount++;
> > > -       mutex_unlock(&wgrp->lock);
> > >
> > > -       return 0;
> > > +unlock:
> > > +       mutex_unlock(&wgrp->lock);
> > > +       return err;
> > >  }
> > >
> > >  static void tegra_windowgroup_disable(struct tegra_windowgroup *wgrp)
> > > @@ -131,7 +139,7 @@ static void tegra_windowgroup_disable(struct tegra_windowgroup *wgrp)
> > >                                wgrp->index);
> > >                 }
> > >
> > > -               pm_runtime_put(wgrp->parent);
> > > +               host1x_client_suspend(wgrp->parent);
> > >         }
> > >
> > >         wgrp->usecount--;
> > > @@ -389,6 +397,7 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
> > >         struct tegra_plane *p = to_tegra_plane(plane);
> > >         struct tegra_dc *dc;
> > >         u32 value;
> > > +       int err;
> > >
> > >         /* rien ne va plus */
> > >         if (!old_state || !old_state->crtc)
> > > @@ -396,6 +405,12 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
> > >
> > >         dc = to_tegra_dc(old_state->crtc);
> > >
> > > +       err = host1x_client_resume(&dc->client);
> > > +       if (err < 0) {
> > > +               dev_err(dc->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > > +
> > >         /*
> > >          * XXX Legacy helpers seem to sometimes call ->atomic_disable() even
> > >          * on planes that are already disabled. Make sure we fallback to the
> > > @@ -404,15 +419,13 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
> > >         if (WARN_ON(p->dc == NULL))
> > >                 p->dc = dc;
> > >
> > > -       pm_runtime_get_sync(dc->dev);
> > > -
> > >         value = tegra_plane_readl(p, DC_WIN_WIN_OPTIONS);
> > >         value &= ~WIN_ENABLE;
> > >         tegra_plane_writel(p, value, DC_WIN_WIN_OPTIONS);
> > >
> > >         tegra_dc_remove_shared_plane(dc, p);
> > >
> > > -       pm_runtime_put(dc->dev);
> > > +       host1x_client_suspend(&dc->client);
> > >  }
> > >
> > >  static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
> > > @@ -425,6 +438,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
> > >         struct tegra_plane *p = to_tegra_plane(plane);
> > >         dma_addr_t base;
> > >         u32 value;
> > > +       int err;
> > >
> > >         /* rien ne va plus */
> > >         if (!plane->state->crtc || !plane->state->fb)
> > > @@ -435,7 +449,11 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
> > >                 return;
> > >         }
> > >
> > > -       pm_runtime_get_sync(dc->dev);
> > > +       err = host1x_client_resume(&dc->client);
> > > +       if (err < 0) {
> > > +               dev_err(dc->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         tegra_dc_assign_shared_plane(dc, p);
> > >
> > > @@ -525,7 +543,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
> > >         value &= ~CONTROL_CSC_ENABLE;
> > >         tegra_plane_writel(p, value, DC_WIN_WINDOW_SET_CONTROL);
> > >
> > > -       pm_runtime_put(dc->dev);
> > > +       host1x_client_suspend(&dc->client);
> > >  }
> > >
> > >  static const struct drm_plane_helper_funcs tegra_shared_plane_helper_funcs = {
> > > @@ -561,7 +579,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
> > >         plane->base.index = index;
> > >
> > >         plane->wgrp = &hub->wgrps[wgrp];
> > > -       plane->wgrp->parent = dc->dev;
> > > +       plane->wgrp->parent = &dc->client;
> > >
> > >         p = &plane->base.base;
> > >
> > > @@ -666,8 +684,13 @@ int tegra_display_hub_atomic_check(struct drm_device *drm,
> > >  static void tegra_display_hub_update(struct tegra_dc *dc)
> > >  {
> > >         u32 value;
> > > +       int err;
> > >
> > > -       pm_runtime_get_sync(dc->dev);
> > > +       err = host1x_client_resume(&dc->client);
> > > +       if (err < 0) {
> > > +               dev_err(dc->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         value = tegra_dc_readl(dc, DC_CMD_IHUB_COMMON_MISC_CTL);
> > >         value &= ~LATENCY_EVENT;
> > > @@ -682,7 +705,7 @@ static void tegra_display_hub_update(struct tegra_dc *dc)
> > >         tegra_dc_writel(dc, COMMON_ACTREQ, DC_CMD_STATE_CONTROL);
> > >         tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
> > >
> > > -       pm_runtime_put(dc->dev);
> > > +       host1x_client_suspend(&dc->client);
> > >  }
> > >
> > >  void tegra_display_hub_atomic_commit(struct drm_device *drm,
> > > @@ -742,9 +765,85 @@ static int tegra_display_hub_exit(struct host1x_client *client)
> > >         return 0;
> > >  }
> > >
> > > +static int tegra_display_hub_runtime_suspend(struct host1x_client *client)
> > > +{
> > > +       struct tegra_display_hub *hub = to_tegra_display_hub(client);
> > > +       struct device *dev = client->dev;
> > > +       unsigned int i = hub->num_heads;
> > > +       int err;
> > > +
> > > +       err = reset_control_assert(hub->rst);
> > > +       if (err < 0)
> > > +               return err;
> > > +
> > > +       while (i--)
> > > +               clk_disable_unprepare(hub->clk_heads[i]);
> > > +
> > > +       clk_disable_unprepare(hub->clk_hub);
> > > +       clk_disable_unprepare(hub->clk_dsc);
> > > +       clk_disable_unprepare(hub->clk_disp);
> > > +
> > > +       pm_runtime_put_sync(dev);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int tegra_display_hub_runtime_resume(struct host1x_client *client)
> > > +{
> > > +       struct tegra_display_hub *hub = to_tegra_display_hub(client);
> > > +       struct device *dev = client->dev;
> > > +       unsigned int i;
> > > +       int err;
> > > +
> > > +       err = pm_runtime_get_sync(dev);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to get runtime PM: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       err = clk_prepare_enable(hub->clk_disp);
> > > +       if (err < 0)
> > > +               goto put_rpm;
> > > +
> > > +       err = clk_prepare_enable(hub->clk_dsc);
> > > +       if (err < 0)
> > > +               goto disable_disp;
> > > +
> > > +       err = clk_prepare_enable(hub->clk_hub);
> > > +       if (err < 0)
> > > +               goto disable_dsc;
> > > +
> > > +       for (i = 0; i < hub->num_heads; i++) {
> > > +               err = clk_prepare_enable(hub->clk_heads[i]);
> > > +               if (err < 0)
> > > +                       goto disable_heads;
> > > +       }
> > > +
> > > +       err = reset_control_deassert(hub->rst);
> > > +       if (err < 0)
> > > +               goto disable_heads;
> > > +
> > > +       return 0;
> > > +
> > > +disable_heads:
> > > +       while (i--)
> > > +               clk_disable_unprepare(hub->clk_heads[i]);
> > > +
> > > +       clk_disable_unprepare(hub->clk_hub);
> > > +disable_dsc:
> > > +       clk_disable_unprepare(hub->clk_dsc);
> > > +disable_disp:
> > > +       clk_disable_unprepare(hub->clk_disp);
> > > +put_rpm:
> > > +       pm_runtime_put_sync(dev);
> > > +       return err;
> > > +}
> > > +
> > >  static const struct host1x_client_ops tegra_display_hub_ops = {
> > >         .init = tegra_display_hub_init,
> > >         .exit = tegra_display_hub_exit,
> > > +       .suspend = tegra_display_hub_runtime_suspend,
> > > +       .resume = tegra_display_hub_runtime_resume,
> > >  };
> > >
> > >  static int tegra_display_hub_probe(struct platform_device *pdev)
> > > @@ -861,6 +960,7 @@ static int tegra_display_hub_probe(struct platform_device *pdev)
> > >  static int tegra_display_hub_remove(struct platform_device *pdev)
> > >  {
> > >         struct tegra_display_hub *hub = platform_get_drvdata(pdev);
> > > +       unsigned int i;
> > >         int err;
> > >
> > >         err = host1x_client_unregister(&hub->client);
> > > @@ -869,78 +969,17 @@ static int tegra_display_hub_remove(struct platform_device *pdev)
> > >                         err);
> > >         }
> > >
> > > -       pm_runtime_disable(&pdev->dev);
> > > -
> > > -       return err;
> > > -}
> > > -
> > > -static int __maybe_unused tegra_display_hub_suspend(struct device *dev)
> > > -{
> > > -       struct tegra_display_hub *hub = dev_get_drvdata(dev);
> > > -       unsigned int i = hub->num_heads;
> > > -       int err;
> > > -
> > > -       err = reset_control_assert(hub->rst);
> > > -       if (err < 0)
> > > -               return err;
> > > -
> > > -       while (i--)
> > > -               clk_disable_unprepare(hub->clk_heads[i]);
> > > -
> > > -       clk_disable_unprepare(hub->clk_hub);
> > > -       clk_disable_unprepare(hub->clk_dsc);
> > > -       clk_disable_unprepare(hub->clk_disp);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -static int __maybe_unused tegra_display_hub_resume(struct device *dev)
> > > -{
> > > -       struct tegra_display_hub *hub = dev_get_drvdata(dev);
> > > -       unsigned int i;
> > > -       int err;
> > > -
> > > -       err = clk_prepare_enable(hub->clk_disp);
> > > -       if (err < 0)
> > > -               return err;
> > > -
> > > -       err = clk_prepare_enable(hub->clk_dsc);
> > > -       if (err < 0)
> > > -               goto disable_disp;
> > > -
> > > -       err = clk_prepare_enable(hub->clk_hub);
> > > -       if (err < 0)
> > > -               goto disable_dsc;
> > > +       for (i = 0; i < hub->soc->num_wgrps; i++) {
> > > +               struct tegra_windowgroup *wgrp = &hub->wgrps[i];
> > >
> > > -       for (i = 0; i < hub->num_heads; i++) {
> > > -               err = clk_prepare_enable(hub->clk_heads[i]);
> > > -               if (err < 0)
> > > -                       goto disable_heads;
> > > +               mutex_destroy(&wgrp->lock);
> > >         }
> > >
> > > -       err = reset_control_deassert(hub->rst);
> > > -       if (err < 0)
> > > -               goto disable_heads;
> > > -
> > > -       return 0;
> > > -
> > > -disable_heads:
> > > -       while (i--)
> > > -               clk_disable_unprepare(hub->clk_heads[i]);
> > > +       pm_runtime_disable(&pdev->dev);
> > >
> > > -       clk_disable_unprepare(hub->clk_hub);
> > > -disable_dsc:
> > > -       clk_disable_unprepare(hub->clk_dsc);
> > > -disable_disp:
> > > -       clk_disable_unprepare(hub->clk_disp);
> > >         return err;
> > >  }
> > >
> > > -static const struct dev_pm_ops tegra_display_hub_pm_ops = {
> > > -       SET_RUNTIME_PM_OPS(tegra_display_hub_suspend,
> > > -                          tegra_display_hub_resume, NULL)
> > > -};
> > > -
> > >  static const struct tegra_display_hub_soc tegra186_display_hub = {
> > >         .num_wgrps = 6,
> > >         .supports_dsc = true,
> > > @@ -968,7 +1007,6 @@ struct platform_driver tegra_display_hub_driver = {
> > >         .driver = {
> > >                 .name = "tegra-display-hub",
> > >                 .of_match_table = tegra_display_hub_of_match,
> > > -               .pm = &tegra_display_hub_pm_ops,
> > >         },
> > >         .probe = tegra_display_hub_probe,
> > >         .remove = tegra_display_hub_remove,
> > > diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
> > > index 767a60d9313c..3efa1be07ff8 100644
> > > --- a/drivers/gpu/drm/tegra/hub.h
> > > +++ b/drivers/gpu/drm/tegra/hub.h
> > > @@ -17,7 +17,7 @@ struct tegra_windowgroup {
> > >         struct mutex lock;
> > >
> > >         unsigned int index;
> > > -       struct device *parent;
> > > +       struct host1x_client *parent;
> > >         struct reset_control *rst;
> > >  };
> > >
> > > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > > index 956bf5d680ad..200d99e17afe 100644
> > > --- a/drivers/gpu/drm/tegra/sor.c
> > > +++ b/drivers/gpu/drm/tegra/sor.c
> > > @@ -2255,7 +2255,7 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
> > >         if (err < 0)
> > >                 dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
> > >
> > > -       pm_runtime_put(sor->dev);
> > > +       host1x_client_suspend(&sor->client);
> > >  }
> > >
> > >  static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
> > > @@ -2276,7 +2276,11 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
> > >         mode = &encoder->crtc->state->adjusted_mode;
> > >         pclk = mode->clock * 1000;
> > >
> > > -       pm_runtime_get_sync(sor->dev);
> > > +       err = host1x_client_resume(&sor->client);
> > > +       if (err < 0) {
> > > +               dev_err(sor->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         /* switch to safe parent clock */
> > >         err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
> > > @@ -2722,7 +2726,7 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
> > >         if (output->panel)
> > >                 drm_panel_unprepare(output->panel);
> > >
> > > -       pm_runtime_put(sor->dev);
> > > +       host1x_client_suspend(&sor->client);
> > >  }
> > >
> > >  static void tegra_sor_dp_enable(struct drm_encoder *encoder)
> > > @@ -2742,7 +2746,11 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
> > >         mode = &encoder->crtc->state->adjusted_mode;
> > >         info = &output->connector.display_info;
> > >
> > > -       pm_runtime_get_sync(sor->dev);
> > > +       err = host1x_client_resume(&sor->client);
> > > +       if (err < 0) {
> > > +               dev_err(sor->dev, "failed to resume: %d\n", err);
> > > +               return;
> > > +       }
> > >
> > >         /* switch to safe parent clock */
> > >         err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
> > > @@ -3189,9 +3197,80 @@ static int tegra_sor_exit(struct host1x_client *client)
> > >         return 0;
> > >  }
> > >
> > > +static int tegra_sor_runtime_suspend(struct host1x_client *client)
> > > +{
> > > +       struct tegra_sor *sor = host1x_client_to_sor(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       if (sor->rst) {
> > > +               err = reset_control_assert(sor->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to assert reset: %d\n", err);
> > > +                       return err;
> > > +               }
> > > +
> > > +               reset_control_release(sor->rst);
> > > +       }
> > > +
> > > +       usleep_range(1000, 2000);
> > > +
> > > +       clk_disable_unprepare(sor->clk);
> > > +       pm_runtime_put_sync(dev);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int tegra_sor_runtime_resume(struct host1x_client *client)
> > > +{
> > > +       struct tegra_sor *sor = host1x_client_to_sor(client);
> > > +       struct device *dev = client->dev;
> > > +       int err;
> > > +
> > > +       err = pm_runtime_get_sync(dev);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to get runtime PM: %d\n", err);
> > > +               return err;
> > > +       }
> > > +
> > > +       err = clk_prepare_enable(sor->clk);
> > > +       if (err < 0) {
> > > +               dev_err(dev, "failed to enable clock: %d\n", err);
> > > +               goto put_rpm;
> > > +       }
> > > +
> > > +       usleep_range(1000, 2000);
> > > +
> > > +       if (sor->rst) {
> > > +               err = reset_control_acquire(sor->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to acquire reset: %d\n", err);
> > > +                       goto disable_clk;
> > > +               }
> > > +
> > > +               err = reset_control_deassert(sor->rst);
> > > +               if (err < 0) {
> > > +                       dev_err(dev, "failed to deassert reset: %d\n", err);
> > > +                       goto release_reset;
> > > +               }
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +release_reset:
> > > +       reset_control_release(sor->rst);
> > > +disable_clk:
> > > +       clk_disable_unprepare(sor->clk);
> > > +put_rpm:
> > > +       pm_runtime_put_sync(dev);
> > > +       return err;
> > > +}
> > > +
> > >  static const struct host1x_client_ops sor_client_ops = {
> > >         .init = tegra_sor_init,
> > >         .exit = tegra_sor_exit,
> > > +       .suspend = tegra_sor_runtime_suspend,
> > > +       .resume = tegra_sor_runtime_resume,
> > >  };
> > >
> > >  static const u8 tegra124_sor_xbar_cfg[5] = {
> > > @@ -3842,10 +3921,9 @@ static int tegra_sor_probe(struct platform_device *pdev)
> > >         if (!sor->clk_pad) {
> > >                 char *name;
> > >
> > > -               err = pm_runtime_get_sync(&pdev->dev);
> > > +               err = host1x_client_resume(&sor->client);
> > >                 if (err < 0) {
> > > -                       dev_err(&pdev->dev, "failed to get runtime PM: %d\n",
> > > -                               err);
> > > +                       dev_err(sor->dev, "failed to resume: %d\n", err);
> > >                         goto remove;
> > >                 }
> > >
> > > @@ -3856,7 +3934,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
> > >                 }
> > >
> > >                 sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
> > > -               pm_runtime_put(&pdev->dev);
> > > +               host1x_client_suspend(&sor->client);
> > >         }
> > >
> > >         if (IS_ERR(sor->clk_pad)) {
> > > @@ -3912,61 +3990,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
> > >         return 0;
> > >  }
> > >
> > > -static int tegra_sor_runtime_suspend(struct device *dev)
> > > -{
> > > -       struct tegra_sor *sor = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       if (sor->rst) {
> > > -               err = reset_control_assert(sor->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to assert reset: %d\n", err);
> > > -                       return err;
> > > -               }
> > > -
> > > -               reset_control_release(sor->rst);
> > > -       }
> > > -
> > > -       usleep_range(1000, 2000);
> > > -
> > > -       clk_disable_unprepare(sor->clk);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -static int tegra_sor_runtime_resume(struct device *dev)
> > > -{
> > > -       struct tegra_sor *sor = dev_get_drvdata(dev);
> > > -       int err;
> > > -
> > > -       err = clk_prepare_enable(sor->clk);
> > > -       if (err < 0) {
> > > -               dev_err(dev, "failed to enable clock: %d\n", err);
> > > -               return err;
> > > -       }
> > > -
> > > -       usleep_range(1000, 2000);
> > > -
> > > -       if (sor->rst) {
> > > -               err = reset_control_acquire(sor->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to acquire reset: %d\n", err);
> > > -                       clk_disable_unprepare(sor->clk);
> > > -                       return err;
> > > -               }
> > > -
> > > -               err = reset_control_deassert(sor->rst);
> > > -               if (err < 0) {
> > > -                       dev_err(dev, "failed to deassert reset: %d\n", err);
> > > -                       reset_control_release(sor->rst);
> > > -                       clk_disable_unprepare(sor->clk);
> > > -                       return err;
> > > -               }
> > > -       }
> > > -
> > > -       return 0;
> > > -}
> > > -
> > >  static int tegra_sor_suspend(struct device *dev)
> > >  {
> > >         struct tegra_sor *sor = dev_get_drvdata(dev);
> > > @@ -3974,8 +3997,9 @@ static int tegra_sor_suspend(struct device *dev)
> > >
> > >         if (sor->hdmi_supply) {
> > >                 err = regulator_disable(sor->hdmi_supply);
> > > -               if (err < 0)
> > > +               if (err < 0) {
> > >                         return err;
> > > +               }
> > >         }
> > >
> > >         return 0;
> > > @@ -3996,8 +4020,6 @@ static int tegra_sor_resume(struct device *dev)
> > >  }
> > >
> > >  static const struct dev_pm_ops tegra_sor_pm_ops = {
> > > -       SET_RUNTIME_PM_OPS(tegra_sor_runtime_suspend, tegra_sor_runtime_resume,
> > > -                          NULL)
> > >         SET_SYSTEM_SLEEP_PM_OPS(tegra_sor_suspend, tegra_sor_resume)
> > >  };
> > >
> > > diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> > > index 50d500345d04..6a995db51d6d 100644
> > > --- a/drivers/gpu/host1x/bus.c
> > > +++ b/drivers/gpu/host1x/bus.c
> > > @@ -710,6 +710,10 @@ int host1x_client_register(struct host1x_client *client)
> > >         struct host1x *host1x;
> > >         int err;
> > >
> > > +       INIT_LIST_HEAD(&client->list);
> > > +       mutex_init(&client->lock);
> > > +       client->usecount = 0;
> > > +
> > >         mutex_lock(&devices_lock);
> > >
> > >         list_for_each_entry(host1x, &devices, list) {
> > > @@ -768,3 +772,74 @@ int host1x_client_unregister(struct host1x_client *client)
> > >         return 0;
> > >  }
> > >  EXPORT_SYMBOL(host1x_client_unregister);
> > > +
> > > +int host1x_client_suspend(struct host1x_client *client)
> > > +{
> > > +       int err = 0;
> > > +
> > > +       mutex_lock(&client->lock);
> > > +
> > > +       if (client->usecount == 1) {
> > > +               if (client->ops && client->ops->suspend) {
> > > +                       err = client->ops->suspend(client);
> > > +                       if (err < 0)
> > > +                               goto unlock;
> > > +               }
> > > +       }
> > > +
> > > +       client->usecount--;
> > > +       dev_dbg(client->dev, "use count: %u\n", client->usecount);
> > > +
> > > +       if (client->parent) {
> > > +               err = host1x_client_suspend(client->parent);
> > > +               if (err < 0)
> > > +                       goto resume;
> > > +       }
> > > +
> > > +       goto unlock;
> > > +
> > > +resume:
> > > +       if (client->usecount == 0)
> > > +               if (client->ops && client->ops->resume)
> > > +                       client->ops->resume(client);
> > > +
> > > +       client->usecount++;
> > > +unlock:
> > > +       mutex_unlock(&client->lock);
> > > +       return err;
> > > +}
> > > +EXPORT_SYMBOL(host1x_client_suspend);
> > > +
> > > +int host1x_client_resume(struct host1x_client *client)
> > > +{
> > > +       int err = 0;
> > > +
> > > +       mutex_lock(&client->lock);
> > > +
> > > +       if (client->parent) {
> > > +               err = host1x_client_resume(client->parent);
> > > +               if (err < 0)
> > > +                       goto unlock;
> > > +       }
> > > +
> > > +       if (client->usecount == 0) {
> > > +               if (client->ops && client->ops->resume) {
> > > +                       err = client->ops->resume(client);
> > > +                       if (err < 0)
> > > +                               goto suspend;
> > > +               }
> > > +       }
> > > +
> > > +       client->usecount++;
> > > +       dev_dbg(client->dev, "use count: %u\n", client->usecount);
> > > +
> > > +       goto unlock;
> > > +
> > > +suspend:
> > > +       if (client->parent)
> > > +               host1x_client_suspend(client->parent);
> > > +unlock:
> > > +       mutex_unlock(&client->lock);
> > > +       return err;
> > > +}
> > > +EXPORT_SYMBOL(host1x_client_resume);
> > > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > > index 470a193a9fed..0254ebcdc0a7 100644
> > > --- a/include/linux/host1x.h
> > > +++ b/include/linux/host1x.h
> > > @@ -24,10 +24,14 @@ struct iommu_group;
> > >   * struct host1x_client_ops - host1x client operations
> > >   * @init: host1x client initialization code
> > >   * @exit: host1x client tear down code
> > > + * @suspend: host1x client suspend code
> > > + * @resume: host1x client resume code
> > >   */
> > >  struct host1x_client_ops {
> > >         int (*init)(struct host1x_client *client);
> > >         int (*exit)(struct host1x_client *client);
> > > +       int (*suspend)(struct host1x_client *client);
> > > +       int (*resume)(struct host1x_client *client);
> > >  };
> > >
> > >  /**
> > > @@ -55,6 +59,10 @@ struct host1x_client {
> > >
> > >         struct host1x_syncpt **syncpts;
> > >         unsigned int num_syncpts;
> > > +
> > > +       struct host1x_client *parent;
> > > +       unsigned int usecount;
> > > +       struct mutex lock;
> > >  };
> > >
> > >  /*
> > > @@ -309,6 +317,9 @@ int host1x_device_exit(struct host1x_device *device);
> > >  int host1x_client_register(struct host1x_client *client);
> > >  int host1x_client_unregister(struct host1x_client *client);
> > >
> > > +int host1x_client_suspend(struct host1x_client *client);
> > > +int host1x_client_resume(struct host1x_client *client);
> > > +
> > >  struct tegra_mipi_device;
> > >
> > >  struct tegra_mipi_device *tegra_mipi_request(struct device *device);
> > > --
> > > 2.23.0
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
