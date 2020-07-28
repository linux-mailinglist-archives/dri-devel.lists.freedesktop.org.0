Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDB230B46
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E9689C54;
	Tue, 28 Jul 2020 13:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943EA897C5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:19:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y3so18266934wrl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WWdZpdgjdgvXjLWPPue7If3nshivPXisw0K+933QvvQ=;
 b=i5qek+mODnmUnqV7JmR63SRMMOaIcB7jB7y59U0zxMQc7FUocN/SI7k4RvV2BxbEVu
 lPpJGp4TRbNauLdxSBJ791ROggTWFdev110Tweyvwex0UJmTlBJOJLoOslMU4TrZgJAn
 A+FIo2p2NK/vWCWAvK/mcQAqx/UwuPVPc2Ee5CNZTg9pd4nLluBcsb1ipySPEmYacC7y
 5Wx+aMXyuCAuZ7XR0y0Md1VISQFVSm1WfGt7QK80idI/6rt/WEGRgC9fg3Ei27jKBX6C
 mQ5J2HbeAp4F36kbhfyppx9ps/GzyPwvDfBaYFoCpxqNppwGgrTi7eyA701s1SvnFsZz
 f9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWdZpdgjdgvXjLWPPue7If3nshivPXisw0K+933QvvQ=;
 b=caEd/33LAWzkTD5hK4p1U9ruCAz0tb3ns+qzlsVGnCBi7zv75pJO5QsKId26hA9d8g
 ItROw8h7x62op1gRwdLJ4ZPSTiOWaR7A59EP7yzEQm3h025Bbv76tX45DGbZGYtuT2cZ
 qW9j6V+6fs26yudaP1dQlxhPP4/NR0PEOH9W4u2Uf3SMmAehiDOmJfTry5md/375Yqtd
 w91fANi2RwGC816nKphAAtTZrCiuRP+9zsgqMRyewiFB6gVTvrnC7uIlzTw8Uux+l7W0
 DSV3O6Hr5hXQvFbgyd4FCEdzNO0rSkAtPIBXjIWaX54tXGaZcxNKNQdwtzgJTVlOIZe4
 A/UQ==
X-Gm-Message-State: AOAM530JZjF6XpKZyS4Fur98RQ96tOQn6AR3PQS90N3JuyS2sAgbzvcS
 nwaiQzXgufwf85Sjdad3FeV7hFDyJrfyDRs5atpeXw==
X-Google-Smtp-Source: ABdhPJxPPlAWGdiN54g5hjhBbtmVCRQfL2EWludJ6TPd30HoCJpLCxU85oDLeJ+AWNIH1EXZ2GCeJwZbFo5davhpXvw=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr7588899wrs.27.1595942342223; 
 Tue, 28 Jul 2020 06:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <08b5c574e128bc7c42387867aee11978068c2aa5.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <08b5c574e128bc7c42387867aee11978068c2aa5.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:18:46 +0100
Message-ID: <CAPY8ntCb9j7QpK8aqSryOCbhKc3D6SW-xszOvh4oOCeA5071xA@mail.gmail.com>
Subject: Re: [PATCH v4 56/78] drm/vc4: hdmi: Store the encoder type in the
 variant structure
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4 CRTC will use the encoder type to control its output clock
> muxing. However, this will be different from HDMI0 to HDMI1, so let's
> store our type in the variant structure so that we can support multiple
> controllers later on.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a50220bfd5dd..c50241170d7e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1268,7 +1268,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>
>         dev_set_drvdata(dev, vc4_hdmi);
>         encoder = &vc4_hdmi->encoder.base.base;
> -       vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
> +       vc4_hdmi->encoder.base.type = variant->encoder_type;
>         vc4_hdmi->pdev = pdev;
>         vc4_hdmi->variant = variant;
>
> @@ -1447,6 +1447,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>  }
>
>  static const struct vc4_hdmi_variant bcm2835_variant = {
> +       .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 0c32dc46d289..0d529db4b3ab 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -27,6 +27,9 @@ struct vc4_hdmi;
>  struct vc4_hdmi_register;
>
>  struct vc4_hdmi_variant {
> +       /* Encoder Type for that controller */
> +       enum vc4_encoder_type encoder_type;
> +
>         /* List of the registers available on that variant */
>         const struct vc4_hdmi_register *registers;
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
