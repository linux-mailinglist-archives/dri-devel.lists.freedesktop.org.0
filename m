Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E94BF34D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A7610F31E;
	Tue, 22 Feb 2022 08:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CE510F31E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:15:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s1so1815936edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bf6c0GrdK5cIPGS+LxnxvSbfeSFCIcjmEMMSuVayD7Y=;
 b=DL/nKWrH8pDwxPVjOI9kQIrzGprE7VsqJwF3O4ds23wtL9cqCVQs8dvK97jr5N1/au
 yaRL7/LEbpazxPcFpGa9Qc03EvephU547DKfPpMFewozRTaQ+85m7+XrDaOq+GJ9WKvd
 ahEJ1Tr35gQ4KJYoYY7yhzVJSG3tmdoeOfo1P/s9MRqtvgmm5GEm2a8IlDV4x8EOrz1x
 1JEv5KmfDi3W8pg1NMCzqe5qEWt7vj6kPATa1cdgG9JAh7g8Jm860u3cuzaCdkWLJ42e
 REPzhzhcxkV8xjKI/dIWmZLnjMXrH7qZP9yW7gj+qSVXK6Koq7YQbSL/OaOPbUukudN9
 yF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bf6c0GrdK5cIPGS+LxnxvSbfeSFCIcjmEMMSuVayD7Y=;
 b=AfNJyM+m/+/NHJ6iVeRVaUx1S3RUBxInc8u0pLPrCi3P0TTOuygnVsRDZRAaAwWd7X
 Ft6gMCeJ6UMwF8mgDDMlChF/13fkVqpuRVYaVAkauRhuBJ7ruHIZNt+37EVMWJjiYi23
 ZU/h7CTvkkW3J7aTla4PluZcxAjalcgH3UM3AaQgzDFAYmwQTACQ0rG4nI1KLT7pqc2G
 6i1if5in9lTqynKd4RUQfDyd0vggsIujyeAc2ftQnlAxjlQ5bZu0GzeqCExBV4/yz+Pf
 +nHOId4KJQz+KFqQ6SgrV4xU1ztlr7lWXtnNOSXQDUvX2F0DIqAs81xhy5bNy4Guw1oa
 3HSA==
X-Gm-Message-State: AOAM5312x1YgmeyGQx14Nb1UowiUYqsHPLfxjpKzg9tKGwgTy2IIFxdG
 c9mbCq1XwgPlHfy6CGofAOJ1uqsEfkircBGFjXcC1Q==
X-Google-Smtp-Source: ABdhPJxLQnZoqBnmnc+lLRPc4HAzYt80c12W8LCnxd3kP8j0PTG0D7VeymHSydwiLD9D+z3qPvGpMqPhGiB2I3ju0wc=
X-Received: by 2002:aa7:c3d5:0:b0:40f:b885:8051 with SMTP id
 l21-20020aa7c3d5000000b0040fb8858051mr25295788edr.395.1645517721067; Tue, 22
 Feb 2022 00:15:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <85d0a4dbbe6c8ad7bc3fdd8ce719f6d418ce095e.1645029005.git.dave.stevenson@raspberrypi.com>
 <YhSBC13+3DM3FyQ+@pendragon.ideasonboard.com>
In-Reply-To: <YhSBC13+3DM3FyQ+@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 22 Feb 2022 08:15:05 +0000
Message-ID: <CAPY8ntAE8k8nbLpsr1Sd7QAgXPzrCP83CcFzYopVbbOCzzkTtw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: Document the expected behaviour of DSI
 host controllers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Tue, 22 Feb 2022 at 06:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the patch.
>
>
> On Wed, Feb 16, 2022 at 04:59:44PM +0000, Dave Stevenson wrote:
> > The exact behaviour of DSI host controllers is not specified,
> > therefore define it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  Documentation/gpu/drm-kms-helpers.rst |  7 +++++++
> >  drivers/gpu/drm/drm_bridge.c          | 38 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> > index c3ce91eecbc1..362afdb867c6 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -185,6 +185,13 @@ Bridge Helper Reference
> >  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >     :export:
> >
> > +MIPI-DSI bridge operation
> > +-------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > +   :doc: dsi bridge operations
> > +
> > +
> >  Bridge Connector Helper Reference
> >  ---------------------------------
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 7c24e8340efa..14c2ee9e0328 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -152,6 +152,44 @@
> >   * situation when probing.
> >   */
> >
> > +/**
> > + * DOC: dsi bridge operations
> > + *
> > + * DSI host interfaces are expected to be implemented as bridges rather than
> > + * encoders, however there are a few aspects of their operation that need to
> > + * be defined in order to provide a consistent interface.
> > + *
> > + * A DSI host should keep the PHY powered down until the pre_enable op is
>
> I'd write "operation" in full everywhere to avoid mixing the two.

Ack on this and the other minor changes.

> > + * called. All lanes should be in an idle state (not LP-11) up to this point.
>
> Is the idle state LP-00 ? If so I'd state that explicitly.

I'd avoided specifying LP-00 as that is a specific state in the
transition from LP to HS (LP-11 -> LP-01 -> LP-00 -> HS).
LP-00 also implies that the line is being actively driven, whereas
this is "powered down" so potentially just has passive pull resistors
on the line.
Looking at the D-PHY spec (I happen to have 1.1 to hand), "Figure 25
Clock Lane Module State Diagram" and we're looking at the "Init
Master" state.

This would also be a point where ULPS might be implemented.

Perhaps replace with "All lanes are in an undefined idle state up to
this point" to allow for differences in hardware implementation?

  Dave

> "[...] in an idle state (LP-00, not LP-11) [...]"
>
> > + * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
> > + * clock lane to either LP-11 or HS dependent on the mode_flag
>
> s/dependent/depending/ ?
>
> > + * MIPI_DSI_CLOCK_NON_CONTINUOUS.
> > + *
> > + * Ordinarily the downstream bridge DSI peripheral pre_enable will have been
> > + * called before the DSI host. If the DSI peripheral requires LP-11 and/or
> > + * the clock lane to be in HS mode prior to pre_enable, then it can set the
> > + * DRM_BRIDGE_OP_UPSTREAM_FIRST flag to request the pre_enable (and
> > + * post_disable) order to be altered to enable the DSI host first.
> > + *
> > + * Either the CRTC being enabled, or the DSI host enable op should switch the
> > + * host to actively transmitting video on the data lanes.
> > + *
> > + * The reverse also applies. The DSI host disable op or stopping the CRTC should
> > + * stop transmitting video, and the data lanes should return to the LP-11 state.
> > + * The DSI host post_disable op should disable the PHY.
> > + * If the DRM_BRIDGE_OP_UPSTREAM_FIRST flag is set, then the DSI peripheral's
> > + * bridge post_disable will be called before the DSI host's post_disable.
> > + *
> > + * Whilst it is valid to call host_transfer prior to pre_enable or after
> > + * post_disable, the exact state of the lanes is undefined at this point. The
> > + * DSI host should initialise the interface, transmit the data, and then disable
> > + * the interface again.
> > + *
> > + * Ultra Low Power State (ULPS) is not explicitly supported by DRM. If
> > + * implemented, it therefore needs to be either handled entirely within the DSI
>
> s/either // (or you need an "or ..." :-))
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > + * Host driver.
> > + */
> > +
> >  static DEFINE_MUTEX(bridge_lock);
> >  static LIST_HEAD(bridge_list);
> >
>
> --
> Regards,
>
> Laurent Pinchart
