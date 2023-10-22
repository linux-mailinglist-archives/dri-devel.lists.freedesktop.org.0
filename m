Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732277D22C0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 12:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E5010E0C6;
	Sun, 22 Oct 2023 10:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7010E0B0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 10:49:53 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3b2f4a5ccebso1671274b6e.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697971792; x=1698576592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsyTofoiJdTaMgzaZy88bV2Z5IwkB35oaVbzN5yV92E=;
 b=L10r4I/iCxa01UC57iQ33WQl/zDTZWjxT5Tudd1GQ6ZziELHCi32dnUVKLaqwVxwfk
 QNM9TzsgrvBxdlfQubjN7an18GLtNTCVdbOOW0y7opNIIoJf15Usn/kBws7VxPWJcUfu
 yyw+SnudASTgiuKYxyDBNzq8eHomyXglR+1b27twHV42JawblXanNi1pvr2D31T1p9MK
 sZngXYVuI4grdsJ4DM8P8PmfWDL5rOj++XTmA2aDDkBlu+A3tsuxBa5tHpj2dUyMt5wV
 HK+TZW0wm47PPGGjW/vqFh9WeStM6jpy3947rJGI77JGF5VMJbJyJJM8yWxZjJoc+EY+
 WWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697971792; x=1698576592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zsyTofoiJdTaMgzaZy88bV2Z5IwkB35oaVbzN5yV92E=;
 b=rVQltXQn+O6y4Iz/uxYHLsHpNgGnF2b0h4e4gmZlSBXIApRiR2whIYuJKswCQMIDPM
 9EqnAciFwVvT4ggIhOgz7BbnQocriywolj75ZwkbhECCoBygMDMVGkwrOr2GgqpXqa0L
 yRo1PltHe0ik1ZaqRMCRMfXOM1X5FaOaJxXs9u8boEcFnu2ic8gowztVvoCnQTLEDsSE
 hSXaZxplFxxHYKXbUvyMtCqiW401qVMWjYymUHDeQpZYorEdwo0YO2Ljp7DmHMEa20FS
 Saq9GcnxD7buH8TtkFE58cY+FTnbuLsdRyiJZJJYauborFAhL6n0/YOFDL0Qrla7OIJZ
 kKFw==
X-Gm-Message-State: AOJu0Yz04/FWYUo1AVVM6zw8xN6jnJwmVrYu3fqptR8Fv11HgwrNj9IC
 kGCz3Ho8VvuQnmOELOhYUDh5Mrg5GBxFGZ1HMRh7xg==
X-Google-Smtp-Source: AGHT+IFYXaKkpzLl4qJI/DncbAgnwW8J71rYXJnTnU4eGIVRz0Vjuz/xbiFDBIAw8QrSlrmqpaDym7qOPLPbGVgCWY8=
X-Received: by 2002:a05:6808:c3:b0:3ae:251f:923f with SMTP id
 t3-20020a05680800c300b003ae251f923fmr6825013oic.28.1697971792253; Sun, 22 Oct
 2023 03:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <1907377.IobQ9Gjlxr@steina-w>
In-Reply-To: <1907377.IobQ9Gjlxr@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Oct 2023 13:49:41 +0300
Message-ID: <CAA8EJpoN36PHoZH=Osfn_wr7kO-dypius2ae_FuJ4Hk+gjeBtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Oct 2023 at 14:42, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Donnerstag, 19. Oktober 2023, 13:19:51 CEST schrieb Dmitry Baryshkov:
> > On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrote:
> > > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > > > The MIPI DSI links do not fully fall into the DRM callbacks model.
> > >
> > > Explaining why would help
> >
> > A kind of explanation comes afterwards, but probably I should change
> > the order of the phrases and expand it:
> >
> > The atomic_pre_enable / atomic_enable and correspondingly
> > atomic_disable / atomic_post_disable expect that the bridge links
> > follow a simple paradigm: either it is off, or it is on and streaming
> > video. Thus, it is fine to just enable the link at the enable time,
> > doing some preparations during the pre_enable.
> >
> > But then it causes several issues with DSI. First, some of the DSI
> > bridges and most of the DSI panels would like to send commands over
> > the DSI link to setup the device. Next, some of the DSI hosts have
> > limitations on sending the commands. The proverbial sunxi DSI host can
> > not send DSI commands after the video stream has started. Thus most of
> > the panels have opted to send all DSI commands from pre_enable (or
> > prepare) callback (before the video stream has started).
> >
> > However this leaves no good place for the DSI host to power up the DSI
> > link. By default the host's pre_enable callback is called after the
> > DSI bridge's pre_enable. For quite some time we were powering up the
> > DSI link from mode_set. This doesn't look fully correct. And also we
> > got into the issue with ps8640 bridge, which requires for the DSI link
> > to be quiet / unpowered at the bridge's reset time.
>
> There are also bridges (e.g. tc358767) which require DSI-LP11 upon bridge
> reset. And additionally this DSI-(e)DP bridge requires LP11 while accessi=
ng
> DP-AUX channel, e.g. reading EDID. So bridges need at least some control =
over
> DSI line state.

For sending commands in LP11 it is typical to toggle the
MIPI_DSI_MODE_LPM flag, for example see panel-=3Djdi-lt070me05000.c or
some other drives. It might be a good idea to make that more explicit.
All suggestions here would be appreciated.

>
> > Dave has come with the idea of pre_enable_prev_first /
> > prepare_prev_first flags, which attempt to solve the issue by
> > reversing the order of pre_enable callbacks. This mostly solves the
> > issue. However during this cycle it became obvious that this approach
> > is not ideal too. There is no way for the DSI host to know whether the
> > DSI panel / bridge has been updated to use this flag or not, see the
> > discussion at [1].
> >
> > Thus comes this proposal. It allows for the panels to explicitly bring
> > the link up and down at the correct time, it supports automatic use
> > case, where no special handling is required. And last, but not least,
> > it allows the DSI host to note that the bridge / panel were not
> > updated to follow new protocol and thus the link should be powered on
> > at the mode_set time. This leaves us with the possibility of dropping
> > support for this workaround once all in-kernel drivers are updated.
>
> I want to use this series to support tc358767 properly, because
> pre_enable_prev_first is not enough, see AUX channel above. I hope I'll f=
ind
> any time soon.
>
> Best regards,
> Alexander
>
> >
> > > > The drm_bridge_funcs abstraction.
> > >
> > > Is there a typo or missing words?
> >
> > missing comma in front of The
> >
> > > > Instead of having just two states (off and on) the DSI hosts have
> > > > separate LP-11 state. In this state the host is on, but the video
> > > > stream is not yet enabled.
> > > >
> > > > Introduce API that allows DSI bridges / panels to control the DSI h=
ost
> > > > power up state.
> >
> > [1]
> > https://lore.kernel.org/dri-devel/6c0dd9fd-5d8e-537c-804f-7a03d5899a07@=
lina
> > ro.org/
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/drm_mipi_dsi.c | 31 ++++++++++++++++++++++++++++++=
+
> > > >  include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
> > > >  2 files changed, 56 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> > > > b/drivers/gpu/drm/drm_mipi_dsi.c index 14201f73aab1..c467162cb7d8
> > > > 100644
> > > > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > > > @@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
> > > >
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
> > > >
> > > > +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *h=
ost)
> > > > +{
> > > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > > +
> > > > +     return ops && ops->power_up;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
> > > > +
> > > > +int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
> > > > +{
> > > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > > +
> > > > +     if (!mipi_dsi_host_power_control_available(host))
> > > > +             return -EOPNOTSUPP;
> > > > +
> > > > +     return ops->power_up ? ops->power_up(host) : 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
> > > > +
> > > > +void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
> > > > +{
> > > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > > +
> > > > +     if (!mipi_dsi_host_power_control_available(host))
> > > > +             return;
> > > > +
> > > > +     if (ops->power_down)
> > > > +             ops->power_down(host);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
> > > > +
> > >
> > > If this API is supposed to be used by DSI devices, it should probably
> > > take a mipi_dsi_device pointer as a parameter?
> >
> > Ack.
> >
> > > We should probably make sure it hasn't been powered on already too?
> >
> > Ack, I can add an atomic count there and a WARN_ON. However I don't
> > think that it is a real problem.
> >
> > > Maxime
> >
> > --
> > With best wishes
> >
> > Dmitry
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>


--=20
With best wishes
Dmitry
