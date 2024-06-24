Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ACB9159E8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 00:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93DE10E1EC;
	Mon, 24 Jun 2024 22:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KJaHcUSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1721210E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 22:31:49 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-63174692a02so45243827b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719268308; x=1719873108; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qIO6L8ZwDHVir4TCZfhgf68ODGhPU8MUrulhinehcl0=;
 b=KJaHcUSxnZpu/IpRnreLkJApKHUNw77ffWRf2Jj4ivFfsbr0elPSip1qhNPW3oiVv9
 UhLEgwmQ1MWw4HpAHMwTDcDFnYOYfXM80bes08jAwMglS70Ux3GjOQH9thI0llniMpwT
 2kSq3EOc08yeUBeGOgnR8mor/axSGfFJbgzg0SxdTvk0SNOGnBL+SGUCX517XUQCq0Tq
 S+D7envJj07yGqZR7izeGnjZYi17lJLbEvzCxS3iW4E+GFPVVjrfinrdsDO397o7Nzeh
 WUoofE+NDCuNnLLzogYmiXfHDjrpCCqW/wEvNAoWL0pTEuwcPW9o/aDKzb67GW31zHhL
 v55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719268308; x=1719873108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIO6L8ZwDHVir4TCZfhgf68ODGhPU8MUrulhinehcl0=;
 b=Tvv7CFn3EeQFCCwqjg5+hwNNCboqpqlxA/YkoS0ZyeoG4hHCdzKBUU00xTX/T/xRbg
 x4MpZdbsV+yuNUaK0mUnu8/Rv6NRMWVqwD2sSfDh6nxdxtOF7TJPpxnfxWgh6X0nradd
 dQfN1l6Py3cV4C+FIIHnB9904Iv/f96QgeOTM0wsex8EGHVuBZrcirUx6OiSnTZPw7sr
 9INBgosVqc7Kp8L4LelWji+b0SiZlC2fWJP8kx3JkrVIksrS/gwRvEOtuQnctlQUfLZM
 axBAmHnnBFmRLBa6t8h8Cgc/XnXFy80DZd3ilIkj+3RXc4+iasEhUlL2zHt3Ju9/wu1O
 b+kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYJ0i6SJcrmrAWKyRjeZbRiB60Dok5ftNLF8SFZVmk7EsmPMgpRWM0qN+hLnoynnI3VJsem3n+Wmuxy+WTTA0NzypwJPT0mx4koAh+Pgrf
X-Gm-Message-State: AOJu0YxHo5/nivLaNVDmfUTkWFH6pNSDiXo5rnrC0TO8WJhJoJUoj8JA
 M2n8zTQ6rqcCCkcFfPKga2jX/DfWkaWM5XIV98BDdKDuv7kOOu2SBPaMXlSmSbWLv0sk1pva1OJ
 D6CToT31zefJYeYhozHjFuCP/82qB2lN+OyoD5A==
X-Google-Smtp-Source: AGHT+IHxeTzr4PcR5ms4PmjBj1L6UTmm+uRxD7cBU4erUoCBxFr06g42k6Ip0LggYP5LsFyQTU9FM1W8fWsJyQZNlSc=
X-Received: by 2002:a05:690c:6c0d:b0:643:9a13:fae2 with SMTP id
 00721157ae682-6439a13fd13mr77354467b3.28.1719268307956; Mon, 24 Jun 2024
 15:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
 <45c25e4b-d64d-549f-6711-7b753d24e2f9@quicinc.com>
In-Reply-To: <45c25e4b-d64d-549f-6711-7b753d24e2f9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 01:31:36 +0300
Message-ID: <CAA8EJpr+fB4P=X_ufkggizqk5AW5P+HKsQO5FvjqXxg6x+m5vA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rob Clark <robdclark@gmail.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jun 2024 at 01:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> > IGT chokes on the max_bpc property in several kms_properties tests due
> > to the the drm_bridge_connector failing to reset HDMI-related
> > properties.
> >
> > Call __drm_atomic_helper_connector_hdmi_reset() if there is a
> > the drm_bridge_connector has bridge_hdmi.
> >
> > Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
> > drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
> > on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
> > call this function from HDMI bridges, there is is no function that
> > corresponds to the drm_connector_funcs::reset().
> >
> > Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
> >   drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
> >   drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
> >   include/drm/display/drm_hdmi_state_helper.h     |  3 ---
> >   include/drm/drm_atomic_state_helper.h           |  2 ++
> >   5 files changed, 35 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 2dab3ad8ce64..67f39857b0b4 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -8,27 +8,6 @@
> >   #include <drm/display/drm_hdmi_helper.h>
> >   #include <drm/display/drm_hdmi_state_helper.h>
> >
> > -/**
> > - * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
> > - * @connector: DRM connector
> > - * @new_conn_state: connector state to reset
> > - *
> > - * Initializes all HDMI resources from a @drm_connector_state without
> > - * actually allocating it. This is useful for HDMI drivers, in
> > - * combination with __drm_atomic_helper_connector_reset() or
> > - * drm_atomic_helper_connector_reset().
> > - */
> > -void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> > -                                           struct drm_connector_state *new_conn_state)
> > -{
> > -     unsigned int max_bpc = connector->max_bpc;
> > -
> > -     new_conn_state->max_bpc = max_bpc;
> > -     new_conn_state->max_requested_bpc = max_bpc;
> > -     new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
> > -}
> > -EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> > -
> >   static const struct drm_display_mode *
> >   connector_state_get_mode(const struct drm_connector_state *conn_state)
> >   {
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 519228eb1095..1518ada81b45 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -478,6 +478,27 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
> >   }
> >   EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
> >
> > +/**
> > + * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
> > + * @connector: DRM connector
> > + * @new_conn_state: connector state to reset
> > + *
> > + * Initializes all HDMI resources from a @drm_connector_state without
> > + * actually allocating it. This is useful for HDMI drivers, in
> > + * combination with __drm_atomic_helper_connector_reset() or
> > + * drm_atomic_helper_connector_reset().
> > + */
> > +void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> > +                                           struct drm_connector_state *new_conn_state)
> > +{
> > +     unsigned int max_bpc = connector->max_bpc;
> > +
> > +     new_conn_state->max_bpc = max_bpc;
> > +     new_conn_state->max_requested_bpc = max_bpc;
>
> I understand this is just code propagation but do we need a max_bpc
> local variable?
>
> We can just do
>
> new_conn_state->max_bpc = connector->max_bpc;
> new_conn_state->max_requested_bpc = connector->max_bpc;

Possible implementation, but I was really just doing code move.

>
> But apart from that nit, this LGTM.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
