Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52EA30C9C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 14:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D8B10E6B8;
	Tue, 11 Feb 2025 13:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HVHLJUsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41910E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 13:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 721AA5C177A;
 Tue, 11 Feb 2025 13:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B3EC4CEE7;
 Tue, 11 Feb 2025 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739279656;
 bh=0hGPY9Dn0mrozIEXDRSipNjISoFsEXm4sVDJ+i7qbzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVHLJUsYRb3Lt5DFRUvVPiT/b2uP6D5RhvKpXEbtj/cvF/V+VIXf0x59vF2Z0pugx
 BuTWCVoZfbMERnSQ8R+vFZqyIlUL7nRvbuG9YQbJHcQClltDtObsGNNCGPbA4ary7C
 sdl3g9AkKzqAnvk+n50YToWiNLgrYhxhDPbsYKrhUfqjz6WYgAlELA7qW3ZPiYfpbF
 AaeJhV4QFn/3oYAY9++NmpfWL/gYmhKshoGiWzCZxNSI0jvpEZk1lyGhkPgy8ZSauu
 +OrxRy3iGzXfOo5X+EpVccEIX5DaVVx4UNhUJjWdaiIbhd4hD3R/tz03PelnmkGEX3
 miaeAMUzyAj/Q==
Date: Tue, 11 Feb 2025 14:14:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <20250211-taupe-moth-of-awe-0722e1@houat>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
 <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lz7iy5sqnzxzc2f6"
Content-Disposition: inline
In-Reply-To: <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
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


--lz7iy5sqnzxzc2f6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
MIME-Version: 1.0

On Fri, Feb 07, 2025 at 05:44:38PM -0800, Doug Anderson wrote:
> On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > deprecated and shouldn't be used by atomic drivers.
> >
> > This was due to the fact that we did't have any other alternative to
> > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > in the bridge state, so we can move to atomic callbacks and drop that
> > deprecated pointer usage.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++-----=
--------
> >  1 file changed, 32 insertions(+), 18 deletions(-)
>=20
> I'm about out of time for now, but I finally managed to at least test
> this and can confirm it _doesn't_ work. If I take the rest of the
> series without this patch then things seem OK. When I add this patch
> then the splash screen on my Chromebook comes up but the browser never
> boots. :(

Thanks for testing still :)

Could you add your tested-by on the previous patches if you found that
they were working?

> > @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(str=
uct device *dev)
> >          * panel (including the aux channel) w/out any need for an inpu=
t clock
> >          * so we can do it in resume which lets us read the EDID before
> >          * pre_enable(). Without a reference clock we need the MIPI ref=
erence
> >          * clock so reading early doesn't work.
> >          */
> > -       if (pdata->refclk)
> > -               ti_sn65dsi86_enable_comms(pdata);
> > +       if (pdata->refclk) {
> > +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> > +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current=
_state(&pdata->bridge));
> > +               drm_modeset_unlock(&pdata->bridge.base.lock);
> > +       }
>=20
> I believe grabbing the locks here is the problem. Sure enough,
> commenting that out fixes things. Also, if I wait long enough:
>=20
> [  247.151951] INFO: task DrmThread:1838 blocked for more than 122 second=
s.
> [  247.158862]       Tainted: G        W
> 6.14.0-rc1-00226-g4144859f9421 #1
> [  247.166474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  247.174541] task:DrmThread       state:D stack:0     pid:1838
> tgid:1756  ppid:1      task_flags:0x400040 flags:0x00000a0d
> [  247.185904] Call trace:
> [  247.188450]  __switch_to+0x12c/0x1e0 (T)
> [  247.192520]  __schedule+0x2d0/0x4a0
> [  247.196132]  schedule_preempt_disabled+0x50/0x88
> [  247.200904]  __ww_mutex_lock+0x3d8/0xa68
> [  247.204970]  __ww_mutex_lock_slowpath+0x24/0x38
> [  247.209653]  ww_mutex_lock+0x7c/0x140
> [  247.213441]  drm_modeset_lock+0xd4/0x110
> [  247.217493]  ti_sn65dsi86_resume+0x78/0xe0
> [  247.221730]  __rpm_callback+0x84/0x148
> [  247.225619]  rpm_callback+0x34/0x98
> [  247.229232]  rpm_resume+0x320/0x488
> [  247.232842]  __pm_runtime_resume+0x54/0xa8
> [  247.237073]  ti_sn_bridge_gpio_get+0x48/0xb8
> [  247.241486]  gpiod_get_raw_value_commit+0x70/0x178
> [  247.246436]  gpiod_get_value_cansleep+0x34/0x88
> [  247.251122]  panel_edp_resume+0xf0/0x270
> [  247.255187]  __rpm_callback+0x84/0x148
> [  247.259072]  rpm_callback+0x34/0x98
> [  247.262685]  rpm_resume+0x320/0x488
> [  247.266293]  __pm_runtime_resume+0x54/0xa8
> [  247.270536]  panel_edp_prepare+0x2c/0x68
> [  247.274591]  drm_panel_prepare+0x54/0x118
> [  247.278743]  panel_bridge_atomic_pre_enable+0x60/0x78
> [  247.283965]  drm_atomic_bridge_chain_pre_enable+0x110/0x168
> [  247.289723]  drm_atomic_helper_commit_modeset_enables+0x204/0x288
> [  247.296005]  msm_atomic_commit_tail+0x1b4/0x510
> [  247.300690]  commit_tail+0xa8/0x178
> [  247.304298]  drm_atomic_helper_commit+0xec/0x180
> [  247.309066]  drm_atomic_commit+0xa8/0xf8
> [  247.313125]  drm_mode_atomic_ioctl+0x718/0xcd8
> [  247.317717]  drm_ioctl+0x1ec/0x450
> [  247.321248]  __arm64_sys_ioctl+0x3e4/0x4d8
> [  247.325494]  invoke_syscall+0x4c/0xf0
> [  247.329284]  do_el0_svc+0x70/0xf8
> [  247.332717]  el0_svc+0x38/0x68
> [  247.335886]  el0t_64_sync_handler+0x20/0x128
> [  247.340296]  el0t_64_sync+0x1b0/0x1b8
>=20
> I guess the problem is that the HPD gpio (which is given to the panel)
> is implemented by ti-sn65dsi86. It's been a long time, but probably we
> don't need to "enable comms" just to access a GPIO, but there's only
> one level of runtime PM. Maybe the fix would be to separately enable
> pm_runtime for the various sub-devices and the GPIO? ...and then the
> "aux" channel enables comms and the bridge one also grabs a PM runtime
> reference to the aux sub-device? Not sure I have time to dig into that
> myself now.

I don't know the hardware, so I can't really comment, unfortunately.
I'll drop it if it's broken.

Maxime

--lz7iy5sqnzxzc2f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6tNJQAKCRAnX84Zoj2+
dg6CAYDW8yt4QDaTu8JLclJZLl53YrJy7TLuSLPfzq3rS4S2WnyCTYh0R+NtBANw
0071AwEBf3cCZttqdv9+Fpk2XPYPSG2nKDexD08eJYQz58tViHbN4WPVAtt+29gM
VRj5A4Yazg==
=Puve
-----END PGP SIGNATURE-----

--lz7iy5sqnzxzc2f6--
