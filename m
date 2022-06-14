Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2554B3D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 16:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4D1122F7;
	Tue, 14 Jun 2022 14:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22DD1122F7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:51:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u12so17648613eja.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdxSribe/I/jluafOkLCF/AL/R2YoEPbIxswkmJirbQ=;
 b=hx2G/QC4I0TKYa3UCsb4hlyzoX8inouATY2zUfz18ZeN4b2rpwtVTwt2W9jZfrmy6n
 /2avUreHiT6BADpIi5BoVYHPybpPDqi5kWDYNZ0YDV93Y/rGc7X2+ChE0DMiG3LRw8fX
 ZBxSPeEMxQKuJPCbUjaaJdyDfi+IXkuJFtGLjs2qRRsOMakBBkyFtxRSnGiJoj2IxKSn
 7dMq+EsByPmGswTqDVgeFarvPe4DWO7gY9mB4nBzwLuW7Xy1Mr6mIvCNI6amuUezuXax
 +vo0uVETnHelBx+5EDLdwothKRUu8xBQNYeGSJcE/3u/iQ06p1NeBFx13XNv6f0ct7OQ
 J0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdxSribe/I/jluafOkLCF/AL/R2YoEPbIxswkmJirbQ=;
 b=V/eV7JguSVT9eEQLSnxmBr8iAe9A3AQIZVSEZMY1sPyyL1W1yexbzb1CqTwfX4bv3m
 dHJLNi3H0BvWFpaD6HdvXStrLbZ3Gwza/V4BBMIvXKZBqulrMT7yAUY9QALMs6r+XJlJ
 dQolS5+6CMbHZER5Wi1sUHB78pRFQpcusHX2pxoMCxHOFeM7rV77R+RYe+6hMHBncoQo
 7aoRACT0b5sKZ42gkpagSDbixJ17QrkrHDfIT8eKp/1g4CUXYXDHRPtt5NU29oVP8QyF
 /Ky8+y86riNEH4qtLeEDked8uD6sgx5pgOPApoYqwlLMI4G2Qqd0+hdSVhhnCVIXowpg
 fDlg==
X-Gm-Message-State: AOAM532M4EJSX1fGvv5suzFgqwV2htbNGQ7kdrclvhWPEG4wGIuavVSm
 +m0SogzZOkEhVCWplmzBcBWL+0VQdChNUcfawQP0TQ==
X-Google-Smtp-Source: ABdhPJzZyqTem0/+p1XK2G3NI+6Mx60foL8cLXZnJ/vB+xo51WG1h5F5s0BOrGCSudaAGHY1ecYDmc1ejHFOqZ9cEkc=
X-Received: by 2002:a17:906:649b:b0:711:fde7:be43 with SMTP id
 e27-20020a170906649b00b00711fde7be43mr4823465ejm.294.1655218310165; Tue, 14
 Jun 2022 07:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-15-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-15-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 15:51:34 +0100
Message-ID: <CAPY8ntA9XpcJ=DTG=0uCVXX3Fqbgi_d4vHhG5PWh_RdNGR_ejQ@mail.gmail.com>
Subject: Re: [PATCH 14/64] drm/vc4: hvs: Remove planes currently allocated
 before taking down
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> When the HVS driver is unbound, a lot of memory allocations in the LBM and
> DLIST RAM are still assigned to planes that are still allocated.
>
> Thus, we hit a warning when calling drm_mm_takedown() since the memory pool
> is not completely free of allocations.
>
> Let's free all the currently live entries before calling drm_mm_takedown().
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 483053e7b14f..b0906bb96c32 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -834,11 +834,18 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct vc4_dev *vc4 = to_vc4_dev(drm);
>         struct vc4_hvs *hvs = vc4->hvs;
> +       struct drm_mm_node *node, *next;
>
>         if (drm_mm_node_allocated(&vc4->hvs->mitchell_netravali_filter))
>                 drm_mm_remove_node(&vc4->hvs->mitchell_netravali_filter);
>
> +       drm_mm_for_each_node_safe(node, next, &vc4->hvs->dlist_mm)
> +               drm_mm_remove_node(node);
> +
>         drm_mm_takedown(&vc4->hvs->dlist_mm);
> +
> +       drm_mm_for_each_node_safe(node, next, &vc4->hvs->lbm_mm)
> +               drm_mm_remove_node(node);
>         drm_mm_takedown(&vc4->hvs->lbm_mm);
>
>         clk_disable_unprepare(hvs->core_clk);
> --
> 2.36.1
>
