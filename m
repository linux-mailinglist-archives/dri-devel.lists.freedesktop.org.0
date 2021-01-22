Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D773230004F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 11:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AF489E65;
	Fri, 22 Jan 2021 10:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2374589E65
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:32:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id u14so3882519wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 02:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zqPi5MJbj1ms2b0Q8q7oOCrglElwMPk+QoWvn6qZ8Lg=;
 b=H6BDzO8wt0zPd6IO4WofunMxSNshx5vl4o49LxSFogf+BCn/vCC98TIqePtTm+5h1x
 yDVKOa6am8btjgY6xmYocEO3sKTXo/j5sGlKyPVb01mODw69yYenSPEmmJqreultpMc+
 pPoqPqSNIGNzoVdenVvvuZ2hF9qZQLTgm5B9ViaW6zn75oXHq5/w0AF8gehobqmXsQD9
 d/r5mCeBkE1m63az/u6sD2pg7hYzXSmMERBgwYc1aIKdD8UDD+NS9zjberNwTsJ5m3ba
 idj1NpnscvnWVUtl9Fn6mpJi5BMN+96RRV0QvmGGIo1iUMwCjFb7RRJ3fgJKdgPwTUz0
 h6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zqPi5MJbj1ms2b0Q8q7oOCrglElwMPk+QoWvn6qZ8Lg=;
 b=a53tIpJ1cXGBazv1uGr1LPCYcfXcE/AXjLdQegSh9kIgemoXLfncVuAy+1UD/J0Njp
 t/35fVOi7D4mksa7LcTOSlrkRl3RRNBCGyyewMCIdeNw5wn7bonXwXDTVXfQ6Gtn+DMe
 hbrLOLFPHMqD/wdEBuLWPq2WS64MlRLDHQG1eDuTvQkn40aWNr4f5WgtqTU0yT4KYGLs
 71bpU1nVgAn5OU82zCVA05WSs6mrZ80ufhJGRjUSFizicsF/PwLv2ow3lbZ+B6SU1IY6
 XVJjrp+5mVrkEbv0BbA2LqPT3NVNf5cvFshAgkgad/mEP9StBpzNMMfETO30Lcp9XRKX
 rqxg==
X-Gm-Message-State: AOAM531U5u1Jpj4zRo4r4yLvMX8rc/tgN0XRlRAm+3E5wmsgAh62DxNR
 cD3yFXD+ddVEWEiA7+ET/17c5haJyD8mYEoUF/mk4Q==
X-Google-Smtp-Source: ABdhPJz76UhEva/JXNulXxfAlQoMv3hOfREdUPUZ/oJbYQoDfEa5wiLS2sBJAZNWLdnfrtRz6I0qapY32xXzEYiN/Xo=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr3237293wmc.158.1611311528710; 
 Fri, 22 Jan 2021 02:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-6-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jan 2021 10:31:53 +0000
Message-ID: <CAPY8ntD=52HEwc6-3XggH4_CErjc2q9aBUc_c29L13UGuJcvqQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] drm/vc4: hdmi: Restore cec physical address on
 reconnect
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Sorry for the slow reply on these patches.

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> Currently we call cec_phys_addr_invalidate on a hotplug deassert.
> That may be due to a TV power cycling, or an AVR being switched
> on (and switching edid).
>
> This makes CEC unusable since our controller wouldn't have a physical
> address anymore.
>
> Set it back up again on the hotplug assert.
>
> Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I follow the logic, and trust Dom that it works, but I don't know if
that is the correct thing within CEC.
Ideally Hans will comment as the original author of the CEC code - I
believe he's testing the series anyway.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 7945dbcee78c..c3a301396aad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -136,20 +136,32 @@ static enum drm_connector_status
>  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>         struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> +       bool connected = false;
>
>         if (vc4_hdmi->hpd_gpio) {
>                 if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
>                     vc4_hdmi->hpd_active_low)
> -                       return connector_status_connected;
> -               cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> -               return connector_status_disconnected;
> +                       connected = true;
> +       } else if (drm_probe_ddc(vc4_hdmi->ddc)) {
> +               connected = true;
> +       } else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
> +               connected = true;
>         }
>
> -       if (drm_probe_ddc(vc4_hdmi->ddc))
> -               return connector_status_connected;
> +       if (connected) {
> +               if (connector->status != connector_status_connected) {
> +                       struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
> +
> +                       if (edid) {
> +                               cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> +                               vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
> +                               kfree(edid);
> +                       }
> +               }
>
> -       if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
>                 return connector_status_connected;
> +       }
> +
>         cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>         return connector_status_disconnected;
>  }
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
