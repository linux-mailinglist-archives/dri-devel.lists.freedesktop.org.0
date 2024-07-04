Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A3927971
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 17:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A110EB2B;
	Thu,  4 Jul 2024 15:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f3NXCj8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FC510EB2B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 15:03:00 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-643f3130ed1so6809117b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720105379; x=1720710179; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3RpEult+PpmNSByOOg7rpoXoPutAbjsE547878wS6dE=;
 b=f3NXCj8RxiBbaFcowATDt5XFvahQWtttVsuu34R/joMGX5G479BXkW+eyDDePc/x6b
 LZNQNyi8PZAZQf7GnuxISwmrnkFmOFpSC5foLCv/m7To1Gk+/x23HIYV/2YzRSJTHn1Y
 gW0HoL5ZYPQjp9w636F2FlqmRQLbTL/i8hqQlstt89ZX/Lr0tIBMc+fWHniM+kNGu7dd
 l5OU/825Jim4tqyYEtiIgfyr99LIdPcdFZpmLjPCxyn+YexbYIoOefG5sJMBLJfMD6Rs
 jLXAkdYMVjsHJRKRE9mxMksxvXzLfyUwVFUpJmz6US6Wxs2B/VSpvpdB5+LOnlVgBxMF
 w3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720105379; x=1720710179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3RpEult+PpmNSByOOg7rpoXoPutAbjsE547878wS6dE=;
 b=eJQnwNkmQcM/d7lqJko92xX4R1Vty7uDZbdGVL0vmj/EgNXM2NHHK8cVxYZ/CS1LRE
 Knu8bgQ/IFBaI87b2Rab8rThL2/6+7jtfTjzZHJtESkH53JJywXkHRFXwb5kyz2mNhvm
 0L/cDbxGi0yn60YIqxRGu+yM8p5o2DIcyfbAwOJxUQ5aFh74PovStdxkG/yWn4BqFp0C
 yzCoQZgyFljuHn/SEhulhUR+1hb++khQ09TJL5sZo5hNwrSjY5s2Ex/NevB6PIi1NMH2
 Rp4QeoT3qzdOcvZxnXzyYff39W4Y6q7g5svACnhjc7GSWHSr2YUgIPNs1I5Kvq5CitQ5
 BK3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWSMKGFLJ1cn6z7yssiCwbtFdyhNzm+o1yB3plfSa7zLvhsQHzde7QK6SDzYHy8kAd+j1yNhAQVppbY2ZT9KzwrNXfq+wkAOhcrPGqgZ+v
X-Gm-Message-State: AOJu0YzYYmrjb9VjKhcMVmmOCVFh5w1spmJzcJEouYr0BGpLdAAajXWq
 vcz7CfqAJUxJ1RXQPNn4xRY3YW1hp+fC8SKYsrYWRV2JSFZrGOHIZEcxjQ5G06EqI7gn9NJnaEi
 i5bfJ0mKOIHBxEu+t8svSmIWc+CgagDdgJhWhaw==
X-Google-Smtp-Source: AGHT+IEWiF8dmPUqO+MUVzpDwFotNDbkSv6rqQebrqrFFAWqvUWEde+EB1RkSLi4dXNcJF3GY4kgFC/uaKR3DkS8eNU=
X-Received: by 2002:a81:431f:0:b0:633:8b49:f97c with SMTP id
 00721157ae682-652d842fd27mr19039267b3.37.1720105379294; Thu, 04 Jul 2024
 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
 <20240702-drm-bridge-connector-fix-hdmi-reset-v3-4-12b0e3124ca4@linaro.org>
 <20240704-jumping-saffron-shrew-d5f3b7@houat>
In-Reply-To: <20240704-jumping-saffron-shrew-d5f3b7@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 18:02:47 +0300
Message-ID: <CAA8EJpr69SoJFu0DMN0+Sk3Ayd7VQG_hPiy3MCfPnN34sR5ADg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/bridge-connector: reset the HDMI connector
 state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

On Thu, 4 Jul 2024 at 15:56, Maxime Ripard <mripard@kernel.org> wrote:
>
> hi,
>
> On Tue, Jul 02, 2024 at 12:48:55PM GMT, Dmitry Baryshkov wrote:
> > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> > IGT chokes on the max_bpc property in several kms_properties tests due
> > to the the drm_bridge_connector failing to reset HDMI-related
> > properties.
> >
> > Call __drm_atomic_helper_connector_hdmi_reset() if the
> > drm_bridge_connector has bridge_hdmi.
> >
> > It is impossible to call this function from HDMI bridges, there is is no
> > function that corresponds to the drm_connector_funcs::reset().
> >
> > Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/Kconfig                |  1 +
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 1a192a45961b..bfd025f8c7b5 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -9,6 +9,7 @@ config DRM_DISPLAY_HELPER
> >  config DRM_BRIDGE_CONNECTOR
> >       bool
> >       depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
> > +     select DRM_DISPLAY_HDMI_STATE_HELPER
>
> Sorry, I notice it on that patch, but it's really on the previous one:
> both DRM_BRIDGE and DRM_DISPLAY_HELPER are meant to be selected, not
> depended on.

I think they are selected by the 'driver' drivers, but they are
depended upon by the sub-devices. So all bridges depend on DRM_BRIDGE
(either directly or via the menu entry).
All drm/display modules depend on DRM_DISPLAY_HELPER. I agree that it
might be worth changing the second part (most likely in a separate
series, ok), but I'm sure that the DRM_BRIDGE part is correct.


>
> Otherwise,
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>
> Maxime



-- 
With best wishes
Dmitry
