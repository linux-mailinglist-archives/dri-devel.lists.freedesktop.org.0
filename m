Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0C54B652
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B6D112894;
	Tue, 14 Jun 2022 16:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F75112895
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:37:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kq6so18245033ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IRCBRM98IASFOMDcIP5UYM2U10Xt5egTGziWddr1Uyw=;
 b=CofHXXmu90+n9XFKSZVZZcR/FZ6ehDvd8rWXaThNGnKA3Jy9GsSjDDePWPv8alyPN4
 9iCP3817HvLiAoAJj6OAW+F2u9hFVSVNdsZcFTC5/PZYOaapDsDHgrM825A9EdmlX6mZ
 sQC7XHFT0pwf4Ba5Laqx0owiziWFsBfkTBWeKJnvaL/Sk/uJ4kWSS5gHHSd84omOi4+A
 5h5H45rY9ejkAsjfkLbSxb+Ci79SlOYfvUTcaKckz+hDYWBpdjQl2C+JuR3w7qQLrbgS
 JyNN1zT67/t8aNxtPvsH+X915uIbONMimdKq8J373avL297y/hZtmnpUq2Dgpq40GL0m
 o+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRCBRM98IASFOMDcIP5UYM2U10Xt5egTGziWddr1Uyw=;
 b=0PlCcDPvvKC5XUg0cZJjMG2HdMvVmSpU2gGrsykgfJFlU0XdIjD2Hsl1jRJg3zcFk2
 WZBZ+fgJ/6T2dj5S25iy3CD5A3xlDIFrmnORca50NMNbxJhUAX2yJYokZJXFLc9RzSwk
 JdDhPfXhf8ST3FhphLHIUO1IWiho0/r9qldbgtUcvyGxOHFq5iK6gH69evjKLDRW6dYZ
 8r3aCtEQxd96JSWvqnEGeyK2DiqUqH/deSNs9Fq7E3oIhFcuUwwMJSk3BY/MUcksL5J2
 RvIFZ2b1oRUz0/TKH/Fyvpv/5LMoNwCdDRkWrSXZmoGo8EZ0fHdiReIShkAaY+qdjLlI
 0eVA==
X-Gm-Message-State: AJIora/D8tXeY7JmRjqsTwirWFjYLBYZ+A4aj0kFPJf3kGmJzR/xTowJ
 YLVhF1f8sC6xbl/ERxPUCKbt/a+LeZGSPInKPISD0w==
X-Google-Smtp-Source: AGRyM1tWxVMSYF9DUx0wwO9Lt0umuc7K9jmsf4nXjEKR4AF417miEKv0Qa3IDbg+R1MISViFtEShqK89FnNQTT+L6cw=
X-Received: by 2002:a17:907:ea9:b0:710:9003:9b33 with SMTP id
 ho41-20020a1709070ea900b0071090039b33mr4927856ejc.175.1655224640473; Tue, 14
 Jun 2022 09:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-25-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-25-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:37:05 +0100
Message-ID: <CAPY8ntAUUxo83eWaJeE19Xa86MZg8hdgCMkqgk2unWy-5PK8Sw@mail.gmail.com>
Subject: Re: [PATCH 24/64] drm/vc4: dpi: Remove unnecessary
 drm_of_panel_bridge_remove call
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
> Since we have a managed call to create our panel_bridge instance, the call
> to drm_of_panel_bridge_remove() at unbind is both redundant and dangerous
> since it might lead to a use-after-free.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 658e0aa9e2e1..5a6cdea7bf7b 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -309,8 +309,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
>  {
>         struct vc4_dpi *dpi = dev_get_drvdata(dev);
>
> -       drm_of_panel_bridge_remove(dev->of_node, 0, 0);
> -
>         drm_encoder_cleanup(&dpi->encoder.base);
>
>         clk_disable_unprepare(dpi->core_clock);
> --
> 2.36.1
>
