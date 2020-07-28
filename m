Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D415C230B51
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F9B6E29A;
	Tue, 28 Jul 2020 13:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5E6E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:21:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f18so18286600wrs.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6n7DC2RwRJQwcE3VDCvW7mDTNfAGJnE5gpDIWkLHcHw=;
 b=GsITKGrgFlyLR97hy7qSX3O8Co7FNy9dMUDvmOGSRjPorVty+c45ZRw/XZ0eEDe8C0
 vWU6JQ7z1Tiym2j3xkg2UynLMNgXv79lJgFwCTrnS6Xy7cA4kXAc3VyBxKOtHioes8m2
 guw5IbXE5e1Wk/+Wor+TvQQpX6RMldYQ02Xv2Z3emyBRMvhwl1n+id0xBKBk2cW4QLlr
 BXXI5OsUgnByTZVxDqxmsZ4+qyZ1OTwX2pzEGBrNiFsZBYEe0AQZJGIp08xws/xeKqON
 pM9sUrXZPm1LmOqaNMEdfyeTz7ghhFpO3Ylzow4BQPRwD8vE9QGYgsGUrca5dBYrpPVT
 LByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6n7DC2RwRJQwcE3VDCvW7mDTNfAGJnE5gpDIWkLHcHw=;
 b=rQ+JkNgTCzzR0UlBcSoyLrpLNhKyUdCMYHl6izVO1V7nnYlLB2VS9SdHmiSmliGC73
 QCAUwKIfa7sgCRZpCdsC21a99iJUJogs1okZ6+t60v6Kt9CehE5Ibro3H2DEpm4mQkZB
 sNWKcnTJmPJBwaOUYRCMginP2Tag23UrO3juVqQX8wNy6gyl4mpFB39CSu27lsIcnxrd
 yePgpQNbalSVKGSvHOLNgxwLT+p4cA5XDcY9CxaW3urUsdmdq28/Sr8UlT6tt3e/yYdG
 FgOix39UI+q2dOnw+ff8fP9UcUiEuSGv3cq3U3S4U4EqoOJVlWfwGTNjBLtdDyuFucGQ
 R9RQ==
X-Gm-Message-State: AOAM5310atnoaY8t15+P9CQuSsKaEqdr3B+ItfwaoP4zNkyp9YR2pCVD
 UrKDc/Lx/MkP+MRMoxPT+l3tb2mmjeZcXz1qZtVVKA==
X-Google-Smtp-Source: ABdhPJyyFkEDXEXxLhznZOoaqtO4ee8p0QDWx6NpzQMmslsbVMu07smR/TO0PQQl4GG+0CnCPXsjcsJapJLgfuC53/g=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr19660461wrs.273.1595942468291; 
 Tue, 28 Jul 2020 06:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <9085677c3adf4a84c5ba5f8cdf4f3aff34e3e5a3.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <9085677c3adf4a84c5ba5f8cdf4f3aff34e3e5a3.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:20:50 +0100
Message-ID: <CAPY8ntAmDtbofNQ-V-UjWjGupN=MG03tOzVG9F1=hG5T4HTsJg@mail.gmail.com>
Subject: Re: [PATCH v4 57/78] drm/vc4: hdmi: Deal with multiple debugfs files
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
> The HDMI driver was registering a single debugfs file so far with the name
> hdmi_regs.
>
> Obviously, this is not going to work anymore when will have multiple HDMI
> controllers since we will end up trying to register two files with the same
> name.
>
> Let's use the variant to avoid that name conflict.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index c50241170d7e..ef51eedaf75a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1370,7 +1370,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 goto err_destroy_encoder;
>
> -       vc4_debugfs_add_file(drm, "hdmi_regs", vc4_hdmi_debugfs_regs, vc4_hdmi);
> +       vc4_debugfs_add_file(drm, variant->debugfs_name,
> +                            vc4_hdmi_debugfs_regs,
> +                            vc4_hdmi);
>
>         return 0;
>
> @@ -1448,6 +1450,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>
>  static const struct vc4_hdmi_variant bcm2835_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
> +       .debugfs_name           = "hdmi_regs",
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 0d529db4b3ab..794216f3228d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -30,6 +30,9 @@ struct vc4_hdmi_variant {
>         /* Encoder Type for that controller */
>         enum vc4_encoder_type encoder_type;
>
> +       /* Filename to expose the registers in debugfs */
> +       const char *debugfs_name;
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
