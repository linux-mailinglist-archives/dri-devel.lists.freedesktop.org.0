Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778A32DE405
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC1D6E0EC;
	Fri, 18 Dec 2020 14:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8CB6E0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:29:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id g185so2771536wmf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQcnaVeKn76lYRwiXKR4yvTyQ/9Lgo43QJdLzaw88No=;
 b=dPH2ZMGlXf7qxs4VLNk1sqQ6DOFTn3EJphiLC07Hd/sKNpQ9O+b48p1oN5bMMLsNcw
 hUCxxdBSaWxlRLCiL9I/Tfv7Ip15ldWsKrB+y0tzx17DQZbd5X0qybJL4dS6oezkjXuL
 1YSWS2M66tLqmHYc3wFa0FqObn3OYwwVpqrlVgWf01NBCJq8VBu1OVSdI4xzZvIqedxg
 0eUb8r35JQVUXYis0AZPc+9VNUaDtE9dWc6DIn2A/6aZsBXFJBtRfvgj9tL/HyxINwoa
 hYGargZwS5AyYExBC9Pyy1MRNHD2HRaJI2tnVrHRDiAkjnG+32WYgMNbODrH25LBY6hy
 w3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQcnaVeKn76lYRwiXKR4yvTyQ/9Lgo43QJdLzaw88No=;
 b=uGhfNlfuf//qX6WDqdZXRPPLX8PjblhiACOelToOw4GQDhvu7FeKjK+0gurbrLFuwn
 NxyxT09XdOAavZ+vt8UTGsJW+g3zsFDJi22cW+0pqEjJ1w+6/Fxw8OX0sRskFNp2ImZR
 sQEWTurH0jwlOeTstDhX2Bu2IlHx+BLWTl4QtaA226u+dXwtBclvqdWZgOHemPi5hnXi
 cjoSPuCEkuc+GfW9iiavxKWsJNWThaQxcz8jKZ0+gwa+oHZ6f9PIUlJ6/t/z/TP+Xq8K
 gvcRetrvozl6WbdYDr4k+8FTRkdPYiChuVEQsb1eiZ9qPj7RMkrvw+I8hdQ0bE61Wc7w
 4ZSA==
X-Gm-Message-State: AOAM530JGPSwfvLNgtPDO/mIxe4rKUJTGin0nuYahH6y3I6Lw3o8oSb5
 Y+6sjBxEhhdeTvdMlSzvoocvpvbJjotWzaIjoI8wPtbl1kk=
X-Google-Smtp-Source: ABdhPJx1zfDnyXEmVWiw9EZm8yj56h7EPNv2EiQk8r5FgzIdRnBEqEC4Oc6xyUqbtGIHIlNzOeHBGh+HWy5KnmgE0kE=
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr4645539wmf.82.1608301771650; 
 Fri, 18 Dec 2020 06:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-13-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-13-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 14:29:14 +0000
Message-ID: <CAPY8ntCkFU47CJmDf_E1RVgprscq=BYj4o2=8ReTOfe8hd0d0Q@mail.gmail.com>
Subject: Re: [PATCH 12/15] drm/vc4: hdmi: Don't register the CEC adapter if
 there's no interrupts
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> We introduced the BCM2711 support to the vc4 HDMI controller with 5.10,
> but this was lacking any of the interrupts of the CEC controller so we
> have to deal with the backward compatibility.
>
> Do so by simply ignoring the CEC setup if the DT doesn't have the
> interrupts property.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 327638d93032..69217c68d3a4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1655,9 +1655,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>  {
>         struct cec_connector_info conn_info;
>         struct platform_device *pdev = vc4_hdmi->pdev;
> +       struct device *dev = &pdev->dev;
>         u32 value;
>         int ret;
>
> +       if (!of_find_property(dev->of_node, "interrupts", NULL)) {
> +               dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
> +               return 0;
> +       }
> +
>         vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
>                                                   vc4_hdmi, "vc4",
>                                                   CEC_CAP_DEFAULTS |
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
