Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC7F2DE1E2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 12:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC6189F63;
	Fri, 18 Dec 2020 11:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7401C89F63
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 11:21:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 190so1984050wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z9VPuMSJSoUHqzMeVGbAE30IrKxI8APrsEWW8ZWta/c=;
 b=Jwh2WpiuqTtq8IfgRyqIkz6FNAHeEn05Ct65f/ZAFEXaiuq2+Zdo8nJKvU8sQ+RFgy
 eWyRZ/dANLyHxjixnapLeiLAXU1HtgK956k8JebGtyN2i4I3itFeBe3BFCp2M8plyLve
 3zku/R4re76JwoUX/OAUO6lrK4kaetW9UQlvSTLigUNfS7KuaJ5RCJZQzpeOo8SBYHPl
 YPfw2rlG6BnY530aQwyzK9S67fh6nG1+VdTFldGxQsN62Nik22sSQA/I4lKRjZJwuIFx
 02g/bIgrVjWKqOZjFhy6aS4iUviUj+1gh5v3E1Z0kXbFfrMeC6bG6yHan6MlY8vRAqUc
 GTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9VPuMSJSoUHqzMeVGbAE30IrKxI8APrsEWW8ZWta/c=;
 b=tXMZNd3/z0d5ZuCew3qswfII1NFO5rb3RvP3XwHiRsNfb5gotbZiplZazSWgtiRcRn
 vC3Y6GI7wGlLdiS/73noTlhffev3K8ePBorJpIfaxf2oU+lSiRHQ4izIXMVll18qOmbO
 nEatVn7UKDoa9RkRvxARk/WBWjT7kE1qSiHBhCkUagbJSf19vdbOKi7Ij3kTja94pqUO
 0jZmIGXvrjxjHoNTABwkChxDqH2n8ymY4csM6+D+FOdUxG1JmUusGyJfxvWtRlRk/0dV
 URPlsLvmIWczBA2Jauzj5TZFYlhbaMmCZZ4h+/QjZ52r8BsD9RRNq4eW8mC5Do2gVmGl
 lq5w==
X-Gm-Message-State: AOAM533tpfJ27KvbYJTF3+ldo4WIwuddyEupxs/ulHVC5WDlPVzbqy1Z
 8FNrl4v06/GFabsoHwPVTwGUxx95pUQeIwTq63HOoQ==
X-Google-Smtp-Source: ABdhPJyWiVYnVdrf2lovSlQt3Ng19j8UcjWhnRFH32AdooP4ukqD0DcGQGxUswg/ja6zIoPYyJVqTr0YkWIUx1S9T+s=
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr3780670wmn.96.1608290462078; 
 Fri, 18 Dec 2020 03:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-3-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-3-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 11:20:45 +0000
Message-ID: <CAPY8ntCuVWkZ6twBRPqDX_Vj5bP39pxLuHaEZ-FPveVt7VH=Yg@mail.gmail.com>
Subject: Re: [PATCH 02/15] drm/vc4: hdmi: Move hdmi reset to bind
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

Hi Maxime & Dom

On Thu, 10 Dec 2020 at 13:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> The hdmi reset got moved to a later point in the commit 9045e91a476b
> ("drm/vc4: hdmi: Add reset callback").
>
> However, the reset now occurs after vc4_hdmi_cec_init and so tramples
> the setup of registers like HDMI_CEC_CNTRL_1
>
> This only affects pi0-3 as on pi4 the cec registers are in a separate
> block

It does mean that this reset only happens once on bind rather than on
every pre_crtc_configure, but as this really is the big reset the
entire block I don't see it needing to be triggered on every
configure.

> Fixes: 9045e91a476b ("drm/vc4: hdmi: Add reset callback")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 8006bddc8fbb..3df1747dd917 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -773,9 +773,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                 return;
>         }
>
> -       if (vc4_hdmi->variant->reset)
> -               vc4_hdmi->variant->reset(vc4_hdmi);
> -
>         if (vc4_hdmi->variant->phy_init)
>                 vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
>
> @@ -1865,6 +1862,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi->disable_wifi_frequencies =
>                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
>
> +       if (vc4_hdmi->variant->reset)
> +               vc4_hdmi->variant->reset(vc4_hdmi);
> +
>         pm_runtime_enable(dev);
>
>         drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
