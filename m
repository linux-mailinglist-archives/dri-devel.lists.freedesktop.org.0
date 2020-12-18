Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83C2DE3EC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117F16E03F;
	Fri, 18 Dec 2020 14:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8558D6E03F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:21:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id e25so2766110wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yg/DSJRdrLy0HhUNnHE4yMYxJ8sJyjH42WoCIL2vO8M=;
 b=avagjLPPM/4TenYe+5NFwMYfDv5mkadG3/FGaqQJLbxamQObpsp1s2ti8eQdTXtaon
 heMFa1Ff+s1WmQ5BcoX6PZE51lm02DR21bsPKye3xLeNIpzlKnjBTOsTlOX1gQGLyb3W
 jIosaRHbAPDeU7U6WTAJ/yewyQo84s5nju4Jc5A8OK+PsfIfgcE60gmTN9Q2kDYxR92d
 uLTno9x8L4yrdnyVTAZ9RD7dpCqW/8Gpam/AhLRr3e1hVqNm/6Zn7TJMigJnLdUJeBJ0
 goVEXQyOJ3gnNQTFRAoYuaIdcsEMbvjvhcnJC+6HST790kZh+omIAfT9GDznlD7avlSd
 HBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yg/DSJRdrLy0HhUNnHE4yMYxJ8sJyjH42WoCIL2vO8M=;
 b=Hp87rd1pibGwLNG7oJuGZY3SgErgUFgBwQlkrRFr1BZufzT/pQSzbk05Q3Ubkswkrj
 HCW3nC0dhe1ONquX4OZOeVoXLwg7GCotyB1xI5POLH+L54vv3mpnofkPlt2XnXRx0iKE
 MLBf2kCnHIDYoMVK+HFlrJJdeXGw0V0ijqPWABzYNoGaGJIVUqWgGH7sv/cSuBkwFTT5
 7K6X3CTVvVxVfBANrgoReoB+oOeclN55EwAucmbCRb1TAaHU4rb3TS/hjmuSSAOSDES2
 i7gjdl2r8vtf0NV56p4Hl7CsvnUfXOPKssj5++fZcytK0MboIUpCznuMbwm/36ZsM8jH
 yy5Q==
X-Gm-Message-State: AOAM530nVCDGJND1iHxrRaW39f3om9Z/oKRE6n50qSsp+WOpKCGl8jbg
 d6omLquk7K3RVC0sFmEyYz4zaxnlLNL70wHkmb3Lfw==
X-Google-Smtp-Source: ABdhPJyt9fDcXOzHI8EKkCqBDVJFYeA5WQWNbsZGass3dzm1SJFYCDEWIUPq84vwnQjLtV5mIEeDN0G9jubDadFmIHE=
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr4418480wmc.158.1608301296016; 
 Fri, 18 Dec 2020 06:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-6-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 14:21:18 +0000
Message-ID: <CAPY8ntDXJWR-vssSLsRbh7RTd-40SQApOxWGwt2LkeoyxCdYMw@mail.gmail.com>
Subject: Re: [PATCH 05/15] drm/vc4: hdmi: Restore cec physical address on
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
Cc: Jason Cooper <jason@lakedaemon.net>, David Airlie <airlied@linux.ie>,
 Marc Zyngier <maz@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi  Maxime & Dom

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
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
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 28b78ea885ea..eff3bac562c6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -136,20 +136,29 @@ static enum drm_connector_status
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
> -       }
> -
> -       if (drm_probe_ddc(vc4_hdmi->ddc))
> -               return connector_status_connected;
> -
> +                       connected = true;
> +       } else if (drm_probe_ddc(vc4_hdmi->ddc))
> +               connected = true;
>         if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)

This needs to become an "else if(...".
It used to be that all the other paths would return, so were mutually
exclusive to this. Now they set a thing and keep going we need to
avoid reading the register should there be a HPD gpio or the ddc probe
succeeds.
Memory says that otherwise Pi3 always reports connected.

I fixed this in a downstream patch already -
https://github.com/raspberrypi/linux/commit/d345caec1e9b2317b9cd7eb5b92ae453a0d3e98c

Otherwise fine.

  Dave

> +               connected = true;
> +       if (connected) {
> +               if (connector->status != connector_status_connected) {
> +                       struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
> +
> +                       if (edid) {
> +                               cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> +                               vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
> +                               drm_connector_update_edid_property(connector, edid);
> +                               kfree(edid);
> +                       }
> +               }
>                 return connector_status_connected;
> +       }
>         cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>         return connector_status_disconnected;
>  }
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
