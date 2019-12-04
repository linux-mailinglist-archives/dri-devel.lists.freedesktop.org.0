Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596CE1127B3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB4D72A20;
	Wed,  4 Dec 2019 09:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028F72A33
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:36:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so7021122wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 01:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kmq2ClZSAcPwEofitenTDDFg2ItrtsBjtWyoH6SE2GI=;
 b=kpASzZRMfXRFj06qtJy9kDCzRdPNBj07SYqb4t9tmqge0wsXISnF+mitfV2Gmv0H8P
 6TiictpppMRH2xyPJPvMrbChPtxK714UKdBqjCJY4xnDxm+8yJ1xGcEQrxx8NMw7OSMM
 p8Us8tX+WuPfMEpV4dR8H4FjPbxU6G+Hr2M6lvmqyXI8NvuBBnNES2GXvHkKbQ+W4Mpk
 8WsTmBYJfNus1jaZlEaFBaN8OWp2JIKQOkAYw/lf9gY27+64MOo0OpKGtpM8cnfTK6+q
 Ou/R0WIvEl3MMW65KDNGTCnFry5OHdyGGfI+XxLJCmSQgFnciJC+TQ9KE52oxhQd26ea
 7etg==
X-Gm-Message-State: APjAAAVaIvrxTrIwxwT+wG2wKcrSJFYu0p428Oxj0bk0sBUB2KwXIbPz
 Z69gjDzl5cUZm/Pl5YPGbqs=
X-Google-Smtp-Source: APXvYqytcuABsxoaCfcsBmnhMt0dAGgnVp/7Hd08vEzUQ+vdWChbnMd0cxW7GRqeSf7gRGd8QSJvzg==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr14004457wmd.127.1575452178247; 
 Wed, 04 Dec 2019 01:36:18 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id q144sm330469wme.46.2019.12.04.01.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 01:36:16 -0800 (PST)
Date: Wed, 4 Dec 2019 10:36:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 2/2] drm/tegra: Do not implement runtime PM
Message-ID: <20191204093615.GB2784830@ulmo>
References: <20191203162733.1436800-1-thierry.reding@gmail.com>
 <20191203162733.1436800-2-thierry.reding@gmail.com>
 <61acda7c-f5c8-e7f6-0e34-c25bec489cdc@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <61acda7c-f5c8-e7f6-0e34-c25bec489cdc@kapsi.fi>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kmq2ClZSAcPwEofitenTDDFg2ItrtsBjtWyoH6SE2GI=;
 b=gqg19zvQ5vvP4dHUmn5vdbN8zxPnyVKLLJcWEFZHDfguyIhuU5bBxnGi3h7Dkqeg1+
 cnTJnQeyan1PtVQaIyY1fhaGeb9AXPmCUdvicI70k7cFck69V6DGk4616CjlXYGbzgEC
 LA/BzGUJUKn/pb6Cn7Gm1/oL8FusMfqcGOzxDKZS/acX0F/h1gNXU31KKDOt9tGyA5Tg
 tqjKqiRhyCmYXNflCUk089qN15eQWTf8sbt311OT2kGLI/5rOa8yuR/ntAkt8ffQTM9e
 JqfRVg+psoQjsyKUGG+X7SoXHlABX2vCypmtfVRr33RMTrW27xQhSzu6PTc5rr82yQ8M
 m6hA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0728737857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0728737857==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 10:37:04AM +0200, Mikko Perttunen wrote:
> Is there any specific reason non-display engines like VIC cannot continue=
 to
> use runtime PM? I know being able to do 'echo on > power/control' for VIC
> has been quite useful for debugging in the past.

Right, I think it should be feasible to let VIC use runtime PM normally.
We may need some additional code to suspend it during system sleep, but
at runtime we should be able to keep this functionality in place.

Thierry

> On 3.12.2019 18.27, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Tegra DRM driver heavily relies on the implementations for runtime
> > suspend/resume to be called at specific times. Unfortunately, there are
> > some cases where that doesn't work. One example is if the user disables
> > runtime PM for a given subdevice. Another example is that the PM core
> > acquires a reference to runtime PM during system sleep, effectively
> > preventing devices from going into low power modes. This is intentional
> > to avoid nasty race conditions, but it also causes system sleep to not
> > function properly on all Tegra systems.
> >=20
> > Fix this by not implementing runtime PM at all. Instead, a minimal,
> > reference-counted suspend/resume infrastructure is added to the host1x
> > bus. This has the benefit that it can be used regardless of the system
> > power state (or any transitions we might be in), or whether or not the
> > user allows runtime PM.
> >=20
> > Atomic modesetting guarantees that these functions will end up being
> > called at the right point in time, so the pitfalls for the more generic
> > runtime PM do not apply here.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/gpu/drm/tegra/dc.c    | 141 ++++++++++++++----------
> >   drivers/gpu/drm/tegra/dpaux.c |   2 +-
> >   drivers/gpu/drm/tegra/drm.h   |   2 +
> >   drivers/gpu/drm/tegra/dsi.c   | 175 ++++++++++++++++--------------
> >   drivers/gpu/drm/tegra/hdmi.c  | 116 +++++++++++---------
> >   drivers/gpu/drm/tegra/hub.c   | 194 ++++++++++++++++++++--------------
> >   drivers/gpu/drm/tegra/hub.h   |   2 +-
> >   drivers/gpu/drm/tegra/sor.c   | 154 +++++++++++++++------------
> >   drivers/gpu/drm/tegra/vic.c   | 131 +++++++++++------------
> >   drivers/gpu/host1x/bus.c      |  75 +++++++++++++
> >   include/linux/host1x.h        |  11 ++
> >   11 files changed, 604 insertions(+), 399 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 2983eb33f2be..871046f3f469 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1737,6 +1737,7 @@ static void tegra_crtc_atomic_disable(struct drm_=
crtc *crtc,
> >   {
> >   	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> >   	u32 value;
> > +	int err;
> >   	if (!tegra_dc_idle(dc)) {
> >   		tegra_dc_stop(dc);
> > @@ -1783,7 +1784,9 @@ static void tegra_crtc_atomic_disable(struct drm_=
crtc *crtc,
> >   	spin_unlock_irq(&crtc->dev->event_lock);
> > -	pm_runtime_put_sync(dc->dev);
> > +	err =3D host1x_client_suspend(&dc->client);
> > +	if (err < 0)
> > +		dev_err(dc->dev, "failed to suspend: %d\n", err);
> >   }
> >   static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
> > @@ -1793,8 +1796,13 @@ static void tegra_crtc_atomic_enable(struct drm_=
crtc *crtc,
> >   	struct tegra_dc_state *state =3D to_dc_state(crtc->state);
> >   	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> >   	u32 value;
> > +	int err;
> > -	pm_runtime_get_sync(dc->dev);
> > +	err =3D host1x_client_resume(&dc->client);
> > +	if (err < 0) {
> > +		dev_err(dc->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> >   	/* initialize display controller */
> >   	if (dc->syncpt) {
> > @@ -2022,6 +2030,15 @@ static int tegra_dc_init(struct host1x_client *c=
lient)
> >   	if (!tegra_dc_has_window_groups(dc))
> >   		return 0;
> > +	/*
> > +	 * Set the display hub as the host1x client parent for the display
> > +	 * controller. This is needed for the runtime reference counting that
> > +	 * ensures the display hub is always powered when any of the display
> > +	 * controllers are.
> > +	 */
> > +	if (dc->soc->has_nvdisplay)
> > +		client->parent =3D &tegra->hub->client;
> > +
> >   	dc->syncpt =3D host1x_syncpt_request(client, flags);
> >   	if (!dc->syncpt)
> >   		dev_warn(dc->dev, "failed to allocate syncpoint\n");
> > @@ -2131,9 +2148,74 @@ static int tegra_dc_exit(struct host1x_client *c=
lient)
> >   	return 0;
> >   }
> > +static int tegra_dc_runtime_suspend(struct host1x_client *client)
> > +{
> > +	struct tegra_dc *dc =3D host1x_client_to_dc(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	err =3D reset_control_assert(dc->rst);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to assert reset: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	if (dc->soc->has_powergate)
> > +		tegra_powergate_power_off(dc->powergate);
> > +
> > +	clk_disable_unprepare(dc->clk);
> > +	pm_runtime_put_sync(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_dc_runtime_resume(struct host1x_client *client)
> > +{
> > +	struct tegra_dc *dc =3D host1x_client_to_dc(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(dev);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get runtime PM: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	if (dc->soc->has_powergate) {
> > +		err =3D tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
> > +							dc->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to power partition: %d\n", err);
> > +			goto put_rpm;
> > +		}
> > +	} else {
> > +		err =3D clk_prepare_enable(dc->clk);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to enable clock: %d\n", err);
> > +			goto put_rpm;
> > +		}
> > +
> > +		err =3D reset_control_deassert(dc->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to deassert reset: %d\n", err);
> > +			goto disable_clk;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(dc->clk);
> > +put_rpm:
> > +	pm_runtime_put_sync(dev);
> > +	return err;
> > +}
> > +
> >   static const struct host1x_client_ops dc_client_ops =3D {
> >   	.init =3D tegra_dc_init,
> >   	.exit =3D tegra_dc_exit,
> > +	.suspend =3D tegra_dc_runtime_suspend,
> > +	.resume =3D tegra_dc_runtime_resume,
> >   };
> >   static const struct tegra_dc_soc_info tegra20_dc_soc_info =3D {
> > @@ -2545,65 +2627,10 @@ static int tegra_dc_remove(struct platform_devi=
ce *pdev)
> >   	return 0;
> >   }
> > -#ifdef CONFIG_PM
> > -static int tegra_dc_suspend(struct device *dev)
> > -{
> > -	struct tegra_dc *dc =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D reset_control_assert(dc->rst);
> > -	if (err < 0) {
> > -		dev_err(dev, "failed to assert reset: %d\n", err);
> > -		return err;
> > -	}
> > -
> > -	if (dc->soc->has_powergate)
> > -		tegra_powergate_power_off(dc->powergate);
> > -
> > -	clk_disable_unprepare(dc->clk);
> > -
> > -	return 0;
> > -}
> > -
> > -static int tegra_dc_resume(struct device *dev)
> > -{
> > -	struct tegra_dc *dc =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	if (dc->soc->has_powergate) {
> > -		err =3D tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
> > -							dc->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to power partition: %d\n", err);
> > -			return err;
> > -		}
> > -	} else {
> > -		err =3D clk_prepare_enable(dc->clk);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to enable clock: %d\n", err);
> > -			return err;
> > -		}
> > -
> > -		err =3D reset_control_deassert(dc->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to deassert reset: %d\n", err);
> > -			return err;
> > -		}
> > -	}
> > -
> > -	return 0;
> > -}
> > -#endif
> > -
> > -static const struct dev_pm_ops tegra_dc_pm_ops =3D {
> > -	SET_RUNTIME_PM_OPS(tegra_dc_suspend, tegra_dc_resume, NULL)
> > -};
> > -
> >   struct platform_driver tegra_dc_driver =3D {
> >   	.driver =3D {
> >   		.name =3D "tegra-dc",
> >   		.of_match_table =3D tegra_dc_of_match,
> > -		.pm =3D &tegra_dc_pm_ops,
> >   	},
> >   	.probe =3D tegra_dc_probe,
> >   	.remove =3D tegra_dc_remove,
> > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpau=
x.c
> > index 622cdf1ad246..7dfb50f65067 100644
> > --- a/drivers/gpu/drm/tegra/dpaux.c
> > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > @@ -588,7 +588,7 @@ static int tegra_dpaux_remove(struct platform_devic=
e *pdev)
> >   	/* make sure pads are powered down when not in use */
> >   	tegra_dpaux_pad_power_down(dpaux);
> > -	pm_runtime_put(&pdev->dev);
> > +	pm_runtime_put_sync(&pdev->dev);
> >   	pm_runtime_disable(&pdev->dev);
> >   	drm_dp_aux_unregister(&dpaux->aux);
> > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > index d941553f7a3d..ed99b67deb29 100644
> > --- a/drivers/gpu/drm/tegra/drm.h
> > +++ b/drivers/gpu/drm/tegra/drm.h
> > @@ -144,6 +144,8 @@ int tegra_output_init(struct drm_device *drm, struc=
t tegra_output *output);
> >   void tegra_output_exit(struct tegra_output *output);
> >   void tegra_output_find_possible_crtcs(struct tegra_output *output,
> >   				      struct drm_device *drm);
> > +int tegra_output_suspend(struct tegra_output *output);
> > +int tegra_output_resume(struct tegra_output *output);
> >   int tegra_output_connector_get_modes(struct drm_connector *connector);
> >   enum drm_connector_status
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index ec475d022fa0..88b9d64c77bf 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -840,7 +840,9 @@ static void tegra_dsi_unprepare(struct tegra_dsi *d=
si)
> >   		dev_err(dsi->dev, "failed to disable MIPI calibration: %d\n",
> >   			err);
> > -	pm_runtime_put(dsi->dev);
> > +	err =3D host1x_client_suspend(&dsi->client);
> > +	if (err < 0)
> > +		dev_err(dsi->dev, "failed to suspend: %d\n", err);
> >   }
> >   static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
> > @@ -882,11 +884,15 @@ static void tegra_dsi_encoder_disable(struct drm_=
encoder *encoder)
> >   	tegra_dsi_unprepare(dsi);
> >   }
> > -static void tegra_dsi_prepare(struct tegra_dsi *dsi)
> > +static int tegra_dsi_prepare(struct tegra_dsi *dsi)
> >   {
> >   	int err;
> > -	pm_runtime_get_sync(dsi->dev);
> > +	err =3D host1x_client_resume(&dsi->client);
> > +	if (err < 0) {
> > +		dev_err(dsi->dev, "failed to resume: %d\n", err);
> > +		return err;
> > +	}
> >   	err =3D tegra_mipi_enable(dsi->mipi);
> >   	if (err < 0)
> > @@ -899,6 +905,8 @@ static void tegra_dsi_prepare(struct tegra_dsi *dsi)
> >   	if (dsi->slave)
> >   		tegra_dsi_prepare(dsi->slave);
> > +
> > +	return 0;
> >   }
> >   static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
> > @@ -909,8 +917,13 @@ static void tegra_dsi_encoder_enable(struct drm_en=
coder *encoder)
> >   	struct tegra_dsi *dsi =3D to_dsi(output);
> >   	struct tegra_dsi_state *state;
> >   	u32 value;
> > +	int err;
> > -	tegra_dsi_prepare(dsi);
> > +	err =3D tegra_dsi_prepare(dsi);
> > +	if (err < 0) {
> > +		dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > +		return;
> > +	}
> >   	state =3D tegra_dsi_get_state(dsi);
> > @@ -1075,9 +1088,89 @@ static int tegra_dsi_exit(struct host1x_client *=
client)
> >   	return 0;
> >   }
> > +static int tegra_dsi_runtime_suspend(struct host1x_client *client)
> > +{
> > +	struct tegra_dsi *dsi =3D host1x_client_to_dsi(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	if (dsi->rst) {
> > +		err =3D reset_control_assert(dsi->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to assert reset: %d\n", err);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	clk_disable_unprepare(dsi->clk_lp);
> > +	clk_disable_unprepare(dsi->clk);
> > +
> > +	regulator_disable(dsi->vdd);
> > +	pm_runtime_put_sync(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_dsi_runtime_resume(struct host1x_client *client)
> > +{
> > +	struct tegra_dsi *dsi =3D host1x_client_to_dsi(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(dev);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get runtime PM: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D regulator_enable(dsi->vdd);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to enable VDD supply: %d\n", err);
> > +		goto put_rpm;
> > +	}
> > +
> > +	err =3D clk_prepare_enable(dsi->clk);
> > +	if (err < 0) {
> > +		dev_err(dev, "cannot enable DSI clock: %d\n", err);
> > +		goto disable_vdd;
> > +	}
> > +
> > +	err =3D clk_prepare_enable(dsi->clk_lp);
> > +	if (err < 0) {
> > +		dev_err(dev, "cannot enable low-power clock: %d\n", err);
> > +		goto disable_clk;
> > +	}
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	if (dsi->rst) {
> > +		err =3D reset_control_deassert(dsi->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "cannot assert reset: %d\n", err);
> > +			goto disable_clk_lp;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +disable_clk_lp:
> > +	clk_disable_unprepare(dsi->clk_lp);
> > +disable_clk:
> > +	clk_disable_unprepare(dsi->clk);
> > +disable_vdd:
> > +	regulator_disable(dsi->vdd);
> > +put_rpm:
> > +	pm_runtime_put_sync(dev);
> > +	return err;
> > +}
> > +
> >   static const struct host1x_client_ops dsi_client_ops =3D {
> >   	.init =3D tegra_dsi_init,
> >   	.exit =3D tegra_dsi_exit,
> > +	.suspend =3D tegra_dsi_runtime_suspend,
> > +	.resume =3D tegra_dsi_runtime_resume,
> >   };
> >   static int tegra_dsi_setup_clocks(struct tegra_dsi *dsi)
> > @@ -1596,79 +1689,6 @@ static int tegra_dsi_remove(struct platform_devi=
ce *pdev)
> >   	return 0;
> >   }
> > -#ifdef CONFIG_PM
> > -static int tegra_dsi_suspend(struct device *dev)
> > -{
> > -	struct tegra_dsi *dsi =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	if (dsi->rst) {
> > -		err =3D reset_control_assert(dsi->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to assert reset: %d\n", err);
> > -			return err;
> > -		}
> > -	}
> > -
> > -	usleep_range(1000, 2000);
> > -
> > -	clk_disable_unprepare(dsi->clk_lp);
> > -	clk_disable_unprepare(dsi->clk);
> > -
> > -	regulator_disable(dsi->vdd);
> > -
> > -	return 0;
> > -}
> > -
> > -static int tegra_dsi_resume(struct device *dev)
> > -{
> > -	struct tegra_dsi *dsi =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D regulator_enable(dsi->vdd);
> > -	if (err < 0) {
> > -		dev_err(dsi->dev, "failed to enable VDD supply: %d\n", err);
> > -		return err;
> > -	}
> > -
> > -	err =3D clk_prepare_enable(dsi->clk);
> > -	if (err < 0) {
> > -		dev_err(dev, "cannot enable DSI clock: %d\n", err);
> > -		goto disable_vdd;
> > -	}
> > -
> > -	err =3D clk_prepare_enable(dsi->clk_lp);
> > -	if (err < 0) {
> > -		dev_err(dev, "cannot enable low-power clock: %d\n", err);
> > -		goto disable_clk;
> > -	}
> > -
> > -	usleep_range(1000, 2000);
> > -
> > -	if (dsi->rst) {
> > -		err =3D reset_control_deassert(dsi->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "cannot assert reset: %d\n", err);
> > -			goto disable_clk_lp;
> > -		}
> > -	}
> > -
> > -	return 0;
> > -
> > -disable_clk_lp:
> > -	clk_disable_unprepare(dsi->clk_lp);
> > -disable_clk:
> > -	clk_disable_unprepare(dsi->clk);
> > -disable_vdd:
> > -	regulator_disable(dsi->vdd);
> > -	return err;
> > -}
> > -#endif
> > -
> > -static const struct dev_pm_ops tegra_dsi_pm_ops =3D {
> > -	SET_RUNTIME_PM_OPS(tegra_dsi_suspend, tegra_dsi_resume, NULL)
> > -};
> > -
> >   static const struct of_device_id tegra_dsi_of_match[] =3D {
> >   	{ .compatible =3D "nvidia,tegra210-dsi", },
> >   	{ .compatible =3D "nvidia,tegra132-dsi", },
> > @@ -1682,7 +1702,6 @@ struct platform_driver tegra_dsi_driver =3D {
> >   	.driver =3D {
> >   		.name =3D "tegra-dsi",
> >   		.of_match_table =3D tegra_dsi_of_match,
> > -		.pm =3D &tegra_dsi_pm_ops,
> >   	},
> >   	.probe =3D tegra_dsi_probe,
> >   	.remove =3D tegra_dsi_remove,
> > diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> > index 38bf1d16095f..cb504ec8f284 100644
> > --- a/drivers/gpu/drm/tegra/hdmi.c
> > +++ b/drivers/gpu/drm/tegra/hdmi.c
> > @@ -1146,6 +1146,7 @@ static void tegra_hdmi_encoder_disable(struct drm=
_encoder *encoder)
> >   	struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> >   	struct tegra_hdmi *hdmi =3D to_hdmi(output);
> >   	u32 value;
> > +	int err;
> >   	/*
> >   	 * The following accesses registers of the display controller, so ma=
ke
> > @@ -1171,7 +1172,9 @@ static void tegra_hdmi_encoder_disable(struct drm=
_encoder *encoder)
> >   	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_ENABLE);
> >   	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_MASK);
> > -	pm_runtime_put(hdmi->dev);
> > +	err =3D host1x_client_suspend(&hdmi->client);
> > +	if (err < 0)
> > +		dev_err(hdmi->dev, "failed to suspend: %d\n", err);
> >   }
> >   static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
> > @@ -1186,7 +1189,11 @@ static void tegra_hdmi_encoder_enable(struct drm=
_encoder *encoder)
> >   	u32 value;
> >   	int err;
> > -	pm_runtime_get_sync(hdmi->dev);
> > +	err =3D host1x_client_resume(&hdmi->client);
> > +	if (err < 0) {
> > +		dev_err(hdmi->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> >   	/*
> >   	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
> > @@ -1489,9 +1496,66 @@ static int tegra_hdmi_exit(struct host1x_client =
*client)
> >   	return 0;
> >   }
> > +static int tegra_hdmi_runtime_suspend(struct host1x_client *client)
> > +{
> > +	struct tegra_hdmi *hdmi =3D host1x_client_to_hdmi(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	err =3D reset_control_assert(hdmi->rst);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to assert reset: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	clk_disable_unprepare(hdmi->clk);
> > +	pm_runtime_put_sync(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_hdmi_runtime_resume(struct host1x_client *client)
> > +{
> > +	struct tegra_hdmi *hdmi =3D host1x_client_to_hdmi(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(dev);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get runtime PM: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D clk_prepare_enable(hdmi->clk);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to enable clock: %d\n", err);
> > +		goto put_rpm;
> > +	}
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	err =3D reset_control_deassert(hdmi->rst);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to deassert reset: %d\n", err);
> > +		goto disable_clk;
> > +	}
> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(hdmi->clk);
> > +put_rpm:
> > +	pm_runtime_put_sync(dev);
> > +	return err;
> > +}
> > +
> >   static const struct host1x_client_ops hdmi_client_ops =3D {
> >   	.init =3D tegra_hdmi_init,
> >   	.exit =3D tegra_hdmi_exit,
> > +	.suspend =3D tegra_hdmi_runtime_suspend,
> > +	.resume =3D tegra_hdmi_runtime_resume,
> >   };
> >   static const struct tegra_hdmi_config tegra20_hdmi_config =3D {
> > @@ -1699,58 +1763,10 @@ static int tegra_hdmi_remove(struct platform_de=
vice *pdev)
> >   	return 0;
> >   }
> > -#ifdef CONFIG_PM
> > -static int tegra_hdmi_suspend(struct device *dev)
> > -{
> > -	struct tegra_hdmi *hdmi =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D reset_control_assert(hdmi->rst);
> > -	if (err < 0) {
> > -		dev_err(dev, "failed to assert reset: %d\n", err);
> > -		return err;
> > -	}
> > -
> > -	usleep_range(1000, 2000);
> > -
> > -	clk_disable_unprepare(hdmi->clk);
> > -
> > -	return 0;
> > -}
> > -
> > -static int tegra_hdmi_resume(struct device *dev)
> > -{
> > -	struct tegra_hdmi *hdmi =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D clk_prepare_enable(hdmi->clk);
> > -	if (err < 0) {
> > -		dev_err(dev, "failed to enable clock: %d\n", err);
> > -		return err;
> > -	}
> > -
> > -	usleep_range(1000, 2000);
> > -
> > -	err =3D reset_control_deassert(hdmi->rst);
> > -	if (err < 0) {
> > -		dev_err(dev, "failed to deassert reset: %d\n", err);
> > -		clk_disable_unprepare(hdmi->clk);
> > -		return err;
> > -	}
> > -
> > -	return 0;
> > -}
> > -#endif
> > -
> > -static const struct dev_pm_ops tegra_hdmi_pm_ops =3D {
> > -	SET_RUNTIME_PM_OPS(tegra_hdmi_suspend, tegra_hdmi_resume, NULL)
> > -};
> > -
> >   struct platform_driver tegra_hdmi_driver =3D {
> >   	.driver =3D {
> >   		.name =3D "tegra-hdmi",
> >   		.of_match_table =3D tegra_hdmi_of_match,
> > -		.pm =3D &tegra_hdmi_pm_ops,
> >   	},
> >   	.probe =3D tegra_hdmi_probe,
> >   	.remove =3D tegra_hdmi_remove,
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 5c7545ee5a5b..73e6fe9b833d 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -105,17 +105,25 @@ static inline void tegra_plane_writel(struct tegr=
a_plane *plane, u32 value,
> >   static int tegra_windowgroup_enable(struct tegra_windowgroup *wgrp)
> >   {
> > +	int err =3D 0;
> > +
> >   	mutex_lock(&wgrp->lock);
> >   	if (wgrp->usecount =3D=3D 0) {
> > -		pm_runtime_get_sync(wgrp->parent);
> > +		err =3D host1x_client_resume(wgrp->parent);
> > +		if (err < 0) {
> > +			dev_err(wgrp->parent->dev, "failed to resume: %d\n", err);
> > +			goto unlock;
> > +		}
> > +
> >   		reset_control_deassert(wgrp->rst);
> >   	}
> >   	wgrp->usecount++;
> > -	mutex_unlock(&wgrp->lock);
> > -	return 0;
> > +unlock:
> > +	mutex_unlock(&wgrp->lock);
> > +	return err;
> >   }
> >   static void tegra_windowgroup_disable(struct tegra_windowgroup *wgrp)
> > @@ -131,7 +139,7 @@ static void tegra_windowgroup_disable(struct tegra_=
windowgroup *wgrp)
> >   			       wgrp->index);
> >   		}
> > -		pm_runtime_put(wgrp->parent);
> > +		host1x_client_suspend(wgrp->parent);
> >   	}
> >   	wgrp->usecount--;
> > @@ -389,6 +397,7 @@ static void tegra_shared_plane_atomic_disable(struc=
t drm_plane *plane,
> >   	struct tegra_plane *p =3D to_tegra_plane(plane);
> >   	struct tegra_dc *dc;
> >   	u32 value;
> > +	int err;
> >   	/* rien ne va plus */
> >   	if (!old_state || !old_state->crtc)
> > @@ -396,6 +405,12 @@ static void tegra_shared_plane_atomic_disable(stru=
ct drm_plane *plane,
> >   	dc =3D to_tegra_dc(old_state->crtc);
> > +	err =3D host1x_client_resume(&dc->client);
> > +	if (err < 0) {
> > +		dev_err(dc->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> > +
> >   	/*
> >   	 * XXX Legacy helpers seem to sometimes call ->atomic_disable() even
> >   	 * on planes that are already disabled. Make sure we fallback to the
> > @@ -404,15 +419,13 @@ static void tegra_shared_plane_atomic_disable(str=
uct drm_plane *plane,
> >   	if (WARN_ON(p->dc =3D=3D NULL))
> >   		p->dc =3D dc;
> > -	pm_runtime_get_sync(dc->dev);
> > -
> >   	value =3D tegra_plane_readl(p, DC_WIN_WIN_OPTIONS);
> >   	value &=3D ~WIN_ENABLE;
> >   	tegra_plane_writel(p, value, DC_WIN_WIN_OPTIONS);
> >   	tegra_dc_remove_shared_plane(dc, p);
> > -	pm_runtime_put(dc->dev);
> > +	host1x_client_suspend(&dc->client);
> >   }
> >   static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
> > @@ -425,6 +438,7 @@ static void tegra_shared_plane_atomic_update(struct=
 drm_plane *plane,
> >   	struct tegra_plane *p =3D to_tegra_plane(plane);
> >   	dma_addr_t base;
> >   	u32 value;
> > +	int err;
> >   	/* rien ne va plus */
> >   	if (!plane->state->crtc || !plane->state->fb)
> > @@ -435,7 +449,11 @@ static void tegra_shared_plane_atomic_update(struc=
t drm_plane *plane,
> >   		return;
> >   	}
> > -	pm_runtime_get_sync(dc->dev);
> > +	err =3D host1x_client_resume(&dc->client);
> > +	if (err < 0) {
> > +		dev_err(dc->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> >   	tegra_dc_assign_shared_plane(dc, p);
> > @@ -525,7 +543,7 @@ static void tegra_shared_plane_atomic_update(struct=
 drm_plane *plane,
> >   	value &=3D ~CONTROL_CSC_ENABLE;
> >   	tegra_plane_writel(p, value, DC_WIN_WINDOW_SET_CONTROL);
> > -	pm_runtime_put(dc->dev);
> > +	host1x_client_suspend(&dc->client);
> >   }
> >   static const struct drm_plane_helper_funcs tegra_shared_plane_helper_=
funcs =3D {
> > @@ -561,7 +579,7 @@ struct drm_plane *tegra_shared_plane_create(struct =
drm_device *drm,
> >   	plane->base.index =3D index;
> >   	plane->wgrp =3D &hub->wgrps[wgrp];
> > -	plane->wgrp->parent =3D dc->dev;
> > +	plane->wgrp->parent =3D &dc->client;
> >   	p =3D &plane->base.base;
> > @@ -666,8 +684,13 @@ int tegra_display_hub_atomic_check(struct drm_devi=
ce *drm,
> >   static void tegra_display_hub_update(struct tegra_dc *dc)
> >   {
> >   	u32 value;
> > +	int err;
> > -	pm_runtime_get_sync(dc->dev);
> > +	err =3D host1x_client_resume(&dc->client);
> > +	if (err < 0) {
> > +		dev_err(dc->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> >   	value =3D tegra_dc_readl(dc, DC_CMD_IHUB_COMMON_MISC_CTL);
> >   	value &=3D ~LATENCY_EVENT;
> > @@ -682,7 +705,7 @@ static void tegra_display_hub_update(struct tegra_d=
c *dc)
> >   	tegra_dc_writel(dc, COMMON_ACTREQ, DC_CMD_STATE_CONTROL);
> >   	tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
> > -	pm_runtime_put(dc->dev);
> > +	host1x_client_suspend(&dc->client);
> >   }
> >   void tegra_display_hub_atomic_commit(struct drm_device *drm,
> > @@ -742,9 +765,85 @@ static int tegra_display_hub_exit(struct host1x_cl=
ient *client)
> >   	return 0;
> >   }
> > +static int tegra_display_hub_runtime_suspend(struct host1x_client *cli=
ent)
> > +{
> > +	struct tegra_display_hub *hub =3D to_tegra_display_hub(client);
> > +	struct device *dev =3D client->dev;
> > +	unsigned int i =3D hub->num_heads;
> > +	int err;
> > +
> > +	err =3D reset_control_assert(hub->rst);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	while (i--)
> > +		clk_disable_unprepare(hub->clk_heads[i]);
> > +
> > +	clk_disable_unprepare(hub->clk_hub);
> > +	clk_disable_unprepare(hub->clk_dsc);
> > +	clk_disable_unprepare(hub->clk_disp);
> > +
> > +	pm_runtime_put_sync(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_display_hub_runtime_resume(struct host1x_client *clie=
nt)
> > +{
> > +	struct tegra_display_hub *hub =3D to_tegra_display_hub(client);
> > +	struct device *dev =3D client->dev;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(dev);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get runtime PM: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D clk_prepare_enable(hub->clk_disp);
> > +	if (err < 0)
> > +		goto put_rpm;
> > +
> > +	err =3D clk_prepare_enable(hub->clk_dsc);
> > +	if (err < 0)
> > +		goto disable_disp;
> > +
> > +	err =3D clk_prepare_enable(hub->clk_hub);
> > +	if (err < 0)
> > +		goto disable_dsc;
> > +
> > +	for (i =3D 0; i < hub->num_heads; i++) {
> > +		err =3D clk_prepare_enable(hub->clk_heads[i]);
> > +		if (err < 0)
> > +			goto disable_heads;
> > +	}
> > +
> > +	err =3D reset_control_deassert(hub->rst);
> > +	if (err < 0)
> > +		goto disable_heads;
> > +
> > +	return 0;
> > +
> > +disable_heads:
> > +	while (i--)
> > +		clk_disable_unprepare(hub->clk_heads[i]);
> > +
> > +	clk_disable_unprepare(hub->clk_hub);
> > +disable_dsc:
> > +	clk_disable_unprepare(hub->clk_dsc);
> > +disable_disp:
> > +	clk_disable_unprepare(hub->clk_disp);
> > +put_rpm:
> > +	pm_runtime_put_sync(dev);
> > +	return err;
> > +}
> > +
> >   static const struct host1x_client_ops tegra_display_hub_ops =3D {
> >   	.init =3D tegra_display_hub_init,
> >   	.exit =3D tegra_display_hub_exit,
> > +	.suspend =3D tegra_display_hub_runtime_suspend,
> > +	.resume =3D tegra_display_hub_runtime_resume,
> >   };
> >   static int tegra_display_hub_probe(struct platform_device *pdev)
> > @@ -861,6 +960,7 @@ static int tegra_display_hub_probe(struct platform_=
device *pdev)
> >   static int tegra_display_hub_remove(struct platform_device *pdev)
> >   {
> >   	struct tegra_display_hub *hub =3D platform_get_drvdata(pdev);
> > +	unsigned int i;
> >   	int err;
> >   	err =3D host1x_client_unregister(&hub->client);
> > @@ -869,78 +969,17 @@ static int tegra_display_hub_remove(struct platfo=
rm_device *pdev)
> >   			err);
> >   	}
> > -	pm_runtime_disable(&pdev->dev);
> > -
> > -	return err;
> > -}
> > -
> > -static int __maybe_unused tegra_display_hub_suspend(struct device *dev)
> > -{
> > -	struct tegra_display_hub *hub =3D dev_get_drvdata(dev);
> > -	unsigned int i =3D hub->num_heads;
> > -	int err;
> > -
> > -	err =3D reset_control_assert(hub->rst);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	while (i--)
> > -		clk_disable_unprepare(hub->clk_heads[i]);
> > -
> > -	clk_disable_unprepare(hub->clk_hub);
> > -	clk_disable_unprepare(hub->clk_dsc);
> > -	clk_disable_unprepare(hub->clk_disp);
> > -
> > -	return 0;
> > -}
> > -
> > -static int __maybe_unused tegra_display_hub_resume(struct device *dev)
> > -{
> > -	struct tegra_display_hub *hub =3D dev_get_drvdata(dev);
> > -	unsigned int i;
> > -	int err;
> > -
> > -	err =3D clk_prepare_enable(hub->clk_disp);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	err =3D clk_prepare_enable(hub->clk_dsc);
> > -	if (err < 0)
> > -		goto disable_disp;
> > -
> > -	err =3D clk_prepare_enable(hub->clk_hub);
> > -	if (err < 0)
> > -		goto disable_dsc;
> > +	for (i =3D 0; i < hub->soc->num_wgrps; i++) {
> > +		struct tegra_windowgroup *wgrp =3D &hub->wgrps[i];
> > -	for (i =3D 0; i < hub->num_heads; i++) {
> > -		err =3D clk_prepare_enable(hub->clk_heads[i]);
> > -		if (err < 0)
> > -			goto disable_heads;
> > +		mutex_destroy(&wgrp->lock);
> >   	}
> > -	err =3D reset_control_deassert(hub->rst);
> > -	if (err < 0)
> > -		goto disable_heads;
> > -
> > -	return 0;
> > -
> > -disable_heads:
> > -	while (i--)
> > -		clk_disable_unprepare(hub->clk_heads[i]);
> > +	pm_runtime_disable(&pdev->dev);
> > -	clk_disable_unprepare(hub->clk_hub);
> > -disable_dsc:
> > -	clk_disable_unprepare(hub->clk_dsc);
> > -disable_disp:
> > -	clk_disable_unprepare(hub->clk_disp);
> >   	return err;
> >   }
> > -static const struct dev_pm_ops tegra_display_hub_pm_ops =3D {
> > -	SET_RUNTIME_PM_OPS(tegra_display_hub_suspend,
> > -			   tegra_display_hub_resume, NULL)
> > -};
> > -
> >   static const struct tegra_display_hub_soc tegra186_display_hub =3D {
> >   	.num_wgrps =3D 6,
> >   	.supports_dsc =3D true,
> > @@ -968,7 +1007,6 @@ struct platform_driver tegra_display_hub_driver =
=3D {
> >   	.driver =3D {
> >   		.name =3D "tegra-display-hub",
> >   		.of_match_table =3D tegra_display_hub_of_match,
> > -		.pm =3D &tegra_display_hub_pm_ops,
> >   	},
> >   	.probe =3D tegra_display_hub_probe,
> >   	.remove =3D tegra_display_hub_remove,
> > diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
> > index 767a60d9313c..3efa1be07ff8 100644
> > --- a/drivers/gpu/drm/tegra/hub.h
> > +++ b/drivers/gpu/drm/tegra/hub.h
> > @@ -17,7 +17,7 @@ struct tegra_windowgroup {
> >   	struct mutex lock;
> >   	unsigned int index;
> > -	struct device *parent;
> > +	struct host1x_client *parent;
> >   	struct reset_control *rst;
> >   };
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index 956bf5d680ad..200d99e17afe 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -2255,7 +2255,7 @@ static void tegra_sor_hdmi_disable(struct drm_enc=
oder *encoder)
> >   	if (err < 0)
> >   		dev_err(sor->dev, "failed to power off I/O pad: %d\n", err);
> > -	pm_runtime_put(sor->dev);
> > +	host1x_client_suspend(&sor->client);
> >   }
> >   static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
> > @@ -2276,7 +2276,11 @@ static void tegra_sor_hdmi_enable(struct drm_enc=
oder *encoder)
> >   	mode =3D &encoder->crtc->state->adjusted_mode;
> >   	pclk =3D mode->clock * 1000;
> > -	pm_runtime_get_sync(sor->dev);
> > +	err =3D host1x_client_resume(&sor->client);
> > +	if (err < 0) {
> > +		dev_err(sor->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> >   	/* switch to safe parent clock */
> >   	err =3D tegra_sor_set_parent_clock(sor, sor->clk_safe);
> > @@ -2722,7 +2726,7 @@ static void tegra_sor_dp_disable(struct drm_encod=
er *encoder)
> >   	if (output->panel)
> >   		drm_panel_unprepare(output->panel);
> > -	pm_runtime_put(sor->dev);
> > +	host1x_client_suspend(&sor->client);
> >   }
> >   static void tegra_sor_dp_enable(struct drm_encoder *encoder)
> > @@ -2742,7 +2746,11 @@ static void tegra_sor_dp_enable(struct drm_encod=
er *encoder)
> >   	mode =3D &encoder->crtc->state->adjusted_mode;
> >   	info =3D &output->connector.display_info;
> > -	pm_runtime_get_sync(sor->dev);
> > +	err =3D host1x_client_resume(&sor->client);
> > +	if (err < 0) {
> > +		dev_err(sor->dev, "failed to resume: %d\n", err);
> > +		return;
> > +	}
> >   	/* switch to safe parent clock */
> >   	err =3D tegra_sor_set_parent_clock(sor, sor->clk_safe);
> > @@ -3189,9 +3197,80 @@ static int tegra_sor_exit(struct host1x_client *=
client)
> >   	return 0;
> >   }
> > +static int tegra_sor_runtime_suspend(struct host1x_client *client)
> > +{
> > +	struct tegra_sor *sor =3D host1x_client_to_sor(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	if (sor->rst) {
> > +		err =3D reset_control_assert(sor->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to assert reset: %d\n", err);
> > +			return err;
> > +		}
> > +
> > +		reset_control_release(sor->rst);
> > +	}
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	clk_disable_unprepare(sor->clk);
> > +	pm_runtime_put_sync(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_sor_runtime_resume(struct host1x_client *client)
> > +{
> > +	struct tegra_sor *sor =3D host1x_client_to_sor(client);
> > +	struct device *dev =3D client->dev;
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(dev);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get runtime PM: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D clk_prepare_enable(sor->clk);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to enable clock: %d\n", err);
> > +		goto put_rpm;
> > +	}
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	if (sor->rst) {
> > +		err =3D reset_control_acquire(sor->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to acquire reset: %d\n", err);
> > +			goto disable_clk;
> > +		}
> > +
> > +		err =3D reset_control_deassert(sor->rst);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to deassert reset: %d\n", err);
> > +			goto release_reset;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +release_reset:
> > +	reset_control_release(sor->rst);
> > +disable_clk:
> > +	clk_disable_unprepare(sor->clk);
> > +put_rpm:
> > +	pm_runtime_put_sync(dev);
> > +	return err;
> > +}
> > +
> >   static const struct host1x_client_ops sor_client_ops =3D {
> >   	.init =3D tegra_sor_init,
> >   	.exit =3D tegra_sor_exit,
> > +	.suspend =3D tegra_sor_runtime_suspend,
> > +	.resume =3D tegra_sor_runtime_resume,
> >   };
> >   static const u8 tegra124_sor_xbar_cfg[5] =3D {
> > @@ -3842,10 +3921,9 @@ static int tegra_sor_probe(struct platform_devic=
e *pdev)
> >   	if (!sor->clk_pad) {
> >   		char *name;
> > -		err =3D pm_runtime_get_sync(&pdev->dev);
> > +		err =3D host1x_client_resume(&sor->client);
> >   		if (err < 0) {
> > -			dev_err(&pdev->dev, "failed to get runtime PM: %d\n",
> > -				err);
> > +			dev_err(sor->dev, "failed to resume: %d\n", err);
> >   			goto remove;
> >   		}
> > @@ -3856,7 +3934,7 @@ static int tegra_sor_probe(struct platform_device=
 *pdev)
> >   		}
> >   		sor->clk_pad =3D tegra_clk_sor_pad_register(sor, name);
> > -		pm_runtime_put(&pdev->dev);
> > +		host1x_client_suspend(&sor->client);
> >   	}
> >   	if (IS_ERR(sor->clk_pad)) {
> > @@ -3912,61 +3990,6 @@ static int tegra_sor_remove(struct platform_devi=
ce *pdev)
> >   	return 0;
> >   }
> > -static int tegra_sor_runtime_suspend(struct device *dev)
> > -{
> > -	struct tegra_sor *sor =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	if (sor->rst) {
> > -		err =3D reset_control_assert(sor->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to assert reset: %d\n", err);
> > -			return err;
> > -		}
> > -
> > -		reset_control_release(sor->rst);
> > -	}
> > -
> > -	usleep_range(1000, 2000);
> > -
> > -	clk_disable_unprepare(sor->clk);
> > -
> > -	return 0;
> > -}
> > -
> > -static int tegra_sor_runtime_resume(struct device *dev)
> > -{
> > -	struct tegra_sor *sor =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D clk_prepare_enable(sor->clk);
> > -	if (err < 0) {
> > -		dev_err(dev, "failed to enable clock: %d\n", err);
> > -		return err;
> > -	}
> > -
> > -	usleep_range(1000, 2000);
> > -
> > -	if (sor->rst) {
> > -		err =3D reset_control_acquire(sor->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to acquire reset: %d\n", err);
> > -			clk_disable_unprepare(sor->clk);
> > -			return err;
> > -		}
> > -
> > -		err =3D reset_control_deassert(sor->rst);
> > -		if (err < 0) {
> > -			dev_err(dev, "failed to deassert reset: %d\n", err);
> > -			reset_control_release(sor->rst);
> > -			clk_disable_unprepare(sor->clk);
> > -			return err;
> > -		}
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >   static int tegra_sor_suspend(struct device *dev)
> >   {
> >   	struct tegra_sor *sor =3D dev_get_drvdata(dev);
> > @@ -3974,8 +3997,9 @@ static int tegra_sor_suspend(struct device *dev)
> >   	if (sor->hdmi_supply) {
> >   		err =3D regulator_disable(sor->hdmi_supply);
> > -		if (err < 0)
> > +		if (err < 0) {
> >   			return err;
> > +		}
> >   	}
> >   	return 0;
> > @@ -3996,8 +4020,6 @@ static int tegra_sor_resume(struct device *dev)
> >   }
> >   static const struct dev_pm_ops tegra_sor_pm_ops =3D {
> > -	SET_RUNTIME_PM_OPS(tegra_sor_runtime_suspend, tegra_sor_runtime_resum=
e,
> > -			   NULL)
> >   	SET_SYSTEM_SLEEP_PM_OPS(tegra_sor_suspend, tegra_sor_resume)
> >   };
> > diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> > index ade56b860cf9..678961ada17f 100644
> > --- a/drivers/gpu/drm/tegra/vic.c
> > +++ b/drivers/gpu/drm/tegra/vic.c
> > @@ -52,48 +52,6 @@ static void vic_writel(struct vic *vic, u32 value, u=
nsigned int offset)
> >   	writel(value, vic->regs + offset);
> >   }
> > -static int vic_runtime_resume(struct device *dev)
> > -{
> > -	struct vic *vic =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D clk_prepare_enable(vic->clk);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	usleep_range(10, 20);
> > -
> > -	err =3D reset_control_deassert(vic->rst);
> > -	if (err < 0)
> > -		goto disable;
> > -
> > -	usleep_range(10, 20);
> > -
> > -	return 0;
> > -
> > -disable:
> > -	clk_disable_unprepare(vic->clk);
> > -	return err;
> > -}
> > -
> > -static int vic_runtime_suspend(struct device *dev)
> > -{
> > -	struct vic *vic =3D dev_get_drvdata(dev);
> > -	int err;
> > -
> > -	err =3D reset_control_assert(vic->rst);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	usleep_range(2000, 4000);
> > -
> > -	clk_disable_unprepare(vic->clk);
> > -
> > -	vic->booted =3D false;
> > -
> > -	return 0;
> > -}
> > -
> >   static int vic_boot(struct vic *vic)
> >   {
> >   #ifdef CONFIG_IOMMU_API
> > @@ -240,9 +198,62 @@ static int vic_exit(struct host1x_client *client)
> >   	return 0;
> >   }
> > +static int vic_runtime_suspend(struct host1x_client *client)
> > +{
> > +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> > +	struct vic *vic =3D to_vic(drm);
> > +	int err;
> > +
> > +	err =3D reset_control_assert(vic->rst);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	usleep_range(2000, 4000);
> > +
> > +	clk_disable_unprepare(vic->clk);
> > +	pm_runtime_put_sync(vic->dev);
> > +
> > +	vic->booted =3D false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vic_runtime_resume(struct host1x_client *client)
> > +{
> > +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> > +	struct vic *vic =3D to_vic(drm);
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(vic->dev);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	err =3D clk_prepare_enable(vic->clk);
> > +	if (err < 0)
> > +		goto put_rpm;
> > +
> > +	usleep_range(10, 20);
> > +
> > +	err =3D reset_control_deassert(vic->rst);
> > +	if (err < 0)
> > +		goto disable;
> > +
> > +	usleep_range(10, 20);
> > +
> > +	return 0;
> > +
> > +put_rpm:
> > +	pm_runtime_put_sync(vic->dev);
> > +disable:
> > +	clk_disable_unprepare(vic->clk);
> > +	return err;
> > +}
> > +
> >   static const struct host1x_client_ops vic_client_ops =3D {
> >   	.init =3D vic_init,
> >   	.exit =3D vic_exit,
> > +	.suspend =3D vic_runtime_suspend,
> > +	.resume =3D vic_runtime_resume,
> >   };
> >   static int vic_load_firmware(struct vic *vic)
> > @@ -314,38 +325,37 @@ static int vic_open_channel(struct tegra_drm_clie=
nt *client,
> >   	struct vic *vic =3D to_vic(client);
> >   	int err;
> > -	err =3D pm_runtime_get_sync(vic->dev);
> > +	err =3D host1x_client_resume(&client->base);
> >   	if (err < 0)
> >   		return err;
> >   	err =3D vic_load_firmware(vic);
> >   	if (err < 0)
> > -		goto rpm_put;
> > +		goto suspend;
> >   	err =3D vic_boot(vic);
> >   	if (err < 0)
> > -		goto rpm_put;
> > +		goto suspend;
> >   	context->channel =3D host1x_channel_get(vic->channel);
> >   	if (!context->channel) {
> >   		err =3D -ENOMEM;
> > -		goto rpm_put;
> > +		goto suspend;
> >   	}
> >   	return 0;
> > -rpm_put:
> > -	pm_runtime_put(vic->dev);
> > +suspend:
> > +	host1x_client_suspend(&client->base);
> >   	return err;
> >   }
> >   static void vic_close_channel(struct tegra_drm_context *context)
> >   {
> > -	struct vic *vic =3D to_vic(context->client);
> > +	struct host1x_client *client =3D &context->client->base;
> >   	host1x_channel_put(context->channel);
> > -
> > -	pm_runtime_put(vic->dev);
> > +	host1x_client_suspend(client);
> >   }
> >   static const struct tegra_drm_client_ops vic_ops =3D {
> > @@ -472,16 +482,9 @@ static int vic_probe(struct platform_device *pdev)
> >   	}
> >   	pm_runtime_enable(&pdev->dev);
> > -	if (!pm_runtime_enabled(&pdev->dev)) {
> > -		err =3D vic_runtime_resume(&pdev->dev);
> > -		if (err < 0)
> > -			goto unregister_client;
> > -	}
> >   	return 0;
> > -unregister_client:
> > -	host1x_client_unregister(&vic->client.base);
> >   exit_falcon:
> >   	falcon_exit(&vic->falcon);
> > @@ -493,6 +496,8 @@ static int vic_remove(struct platform_device *pdev)
> >   	struct vic *vic =3D platform_get_drvdata(pdev);
> >   	int err;
> > +	pm_runtime_disable(&pdev->dev);
> > +
> >   	err =3D host1x_client_unregister(&vic->client.base);
> >   	if (err < 0) {
> >   		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> > @@ -500,25 +505,15 @@ static int vic_remove(struct platform_device *pde=
v)
> >   		return err;
> >   	}
> > -	if (pm_runtime_enabled(&pdev->dev))
> > -		pm_runtime_disable(&pdev->dev);
> > -	else
> > -		vic_runtime_suspend(&pdev->dev);
> > -
> >   	falcon_exit(&vic->falcon);
> >   	return 0;
> >   }
> > -static const struct dev_pm_ops vic_pm_ops =3D {
> > -	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> > -};
> > -
> >   struct platform_driver tegra_vic_driver =3D {
> >   	.driver =3D {
> >   		.name =3D "tegra-vic",
> >   		.of_match_table =3D tegra_vic_of_match,
> > -		.pm =3D &vic_pm_ops
> >   	},
> >   	.probe =3D vic_probe,
> >   	.remove =3D vic_remove,
> > diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> > index 50d500345d04..6a995db51d6d 100644
> > --- a/drivers/gpu/host1x/bus.c
> > +++ b/drivers/gpu/host1x/bus.c
> > @@ -710,6 +710,10 @@ int host1x_client_register(struct host1x_client *c=
lient)
> >   	struct host1x *host1x;
> >   	int err;
> > +	INIT_LIST_HEAD(&client->list);
> > +	mutex_init(&client->lock);
> > +	client->usecount =3D 0;
> > +
> >   	mutex_lock(&devices_lock);
> >   	list_for_each_entry(host1x, &devices, list) {
> > @@ -768,3 +772,74 @@ int host1x_client_unregister(struct host1x_client =
*client)
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(host1x_client_unregister);
> > +
> > +int host1x_client_suspend(struct host1x_client *client)
> > +{
> > +	int err =3D 0;
> > +
> > +	mutex_lock(&client->lock);
> > +
> > +	if (client->usecount =3D=3D 1) {
> > +		if (client->ops && client->ops->suspend) {
> > +			err =3D client->ops->suspend(client);
> > +			if (err < 0)
> > +				goto unlock;
> > +		}
> > +	}
> > +
> > +	client->usecount--;
> > +	dev_dbg(client->dev, "use count: %u\n", client->usecount);
> > +
> > +	if (client->parent) {
> > +		err =3D host1x_client_suspend(client->parent);
> > +		if (err < 0)
> > +			goto resume;
> > +	}
> > +
> > +	goto unlock;
> > +
> > +resume:
> > +	if (client->usecount =3D=3D 0)
> > +		if (client->ops && client->ops->resume)
> > +			client->ops->resume(client);
> > +
> > +	client->usecount++;
> > +unlock:
> > +	mutex_unlock(&client->lock);
> > +	return err;
> > +}
> > +EXPORT_SYMBOL(host1x_client_suspend);
> > +
> > +int host1x_client_resume(struct host1x_client *client)
> > +{
> > +	int err =3D 0;
> > +
> > +	mutex_lock(&client->lock);
> > +
> > +	if (client->parent) {
> > +		err =3D host1x_client_resume(client->parent);
> > +		if (err < 0)
> > +			goto unlock;
> > +	}
> > +
> > +	if (client->usecount =3D=3D 0) {
> > +		if (client->ops && client->ops->resume) {
> > +			err =3D client->ops->resume(client);
> > +			if (err < 0)
> > +				goto suspend;
> > +		}
> > +	}
> > +
> > +	client->usecount++;
> > +	dev_dbg(client->dev, "use count: %u\n", client->usecount);
> > +
> > +	goto unlock;
> > +
> > +suspend:
> > +	if (client->parent)
> > +		host1x_client_suspend(client->parent);
> > +unlock:
> > +	mutex_unlock(&client->lock);
> > +	return err;
> > +}
> > +EXPORT_SYMBOL(host1x_client_resume);
> > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > index 470a193a9fed..0254ebcdc0a7 100644
> > --- a/include/linux/host1x.h
> > +++ b/include/linux/host1x.h
> > @@ -24,10 +24,14 @@ struct iommu_group;
> >    * struct host1x_client_ops - host1x client operations
> >    * @init: host1x client initialization code
> >    * @exit: host1x client tear down code
> > + * @suspend: host1x client suspend code
> > + * @resume: host1x client resume code
> >    */
> >   struct host1x_client_ops {
> >   	int (*init)(struct host1x_client *client);
> >   	int (*exit)(struct host1x_client *client);
> > +	int (*suspend)(struct host1x_client *client);
> > +	int (*resume)(struct host1x_client *client);
> >   };
> >   /**
> > @@ -55,6 +59,10 @@ struct host1x_client {
> >   	struct host1x_syncpt **syncpts;
> >   	unsigned int num_syncpts;
> > +
> > +	struct host1x_client *parent;
> > +	unsigned int usecount;
> > +	struct mutex lock;
> >   };
> >   /*
> > @@ -309,6 +317,9 @@ int host1x_device_exit(struct host1x_device *device=
);
> >   int host1x_client_register(struct host1x_client *client);
> >   int host1x_client_unregister(struct host1x_client *client);
> > +int host1x_client_suspend(struct host1x_client *client);
> > +int host1x_client_resume(struct host1x_client *client);
> > +
> >   struct tegra_mipi_device;
> >   struct tegra_mipi_device *tegra_mipi_request(struct device *device);
> >=20

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3nfg8ACgkQ3SOs138+
s6EPXxAArwbPD6IKjifYD+I+mMW9TE1DDfC0JK3g5SoUWFuTceIqs36y5cMIDV2w
ooD5tUxNz656o0H8gt4XkbZtoFBJUKkpww6l3y4j0ZMft2A6f0EkF4Q6ZPcpgIhz
S24xVfXGu0UONseN64g/KAQ48e5kh5sepjO6AfLv/wo6Oe/OikMuEp2vzGIo37Vo
IGjqW7m3HOgLhY7+NMR6gcZyhHr9ZrKjv9BT/m3y/JaxPI0QwCGASjXuNNMBn3im
uRDD4OCxYjLGJYaSuqjy7YwgSnLsV/L2fnFvknrmMaMIxkM6jdz8YSwaGonakQkK
qqWqoPZXHrn4kgqPT6s6pPy/V0gW9e2V7R4kXn3haxCznEDLc1sid+vcLAeLAQY8
slAbMYtYuXEDxEP6IZtHxd62rWFRXEpKEPd42V+mKKFSaLOEXIC+OoFntWRv+AUT
u8rq+LXxBC7xVtbkUSZYG94o5mxYBUItdO9TD2cobau3lb1sjgqdyqho+PCrANQP
Y800GFOtTnth4OGCs31zCHM1NhGoxvwHHFNHDvfLg/BR39kCVIkY5TSPGZUtaotr
CTQiSrSlHkBqAFlkh7hsNZswAUToh9XH6Kvoks15azrabtn894AZDgCTwv5Yd4rV
atUjZI1Wzhm0rQuscQ2Dxe1+Q6PkA9xACt2cxM9Rc2xtYjJxudY=
=BK7r
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

--===============0728737857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0728737857==--
