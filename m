Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DE829D009
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 14:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134916E517;
	Wed, 28 Oct 2020 13:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8726E517
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 13:30:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a9so1889319wrg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W5Ax3LBB3MaDs1VNveAhKnujcR2I/QqmbY5PUOksVSA=;
 b=Xz5lJP9PVYMJ839Z2eQD9nTSk0WPo+iALxRWVFigznIBGNnByN/6iqN320/zj1PXPQ
 z7RER+qgqoSL/vo7XEmcphpXxn7hC3BupY4Y3zgZI+pGNVDb9/3jShXX6o80V6RVAM3N
 ULDFZZSQdnUTDEVMVZ8bThWmpmb5U+auqe+KLAlZfwZvk+Q1EjHmc7G75WtJpvfqwHDs
 FqXkL63XAAyo7Apu63htaS/tx6QPq1bbbfLZ0+EscwdH1qzElqYnK17zevFXMKfnh8+4
 O2ZieHwP/le7hRcz06i8uIsQDecXa6eGpqFGoVMB08I7olh6x/TEMi9knVGWeXP1ol3p
 52mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W5Ax3LBB3MaDs1VNveAhKnujcR2I/QqmbY5PUOksVSA=;
 b=nXaq3ZvLO8n1DLbO8ay9ucDcMpnUBTqK/Ib9y/mZ00aStEK774EPdJlumDN24yWfDY
 FWbm/eSEr2tMvqKXj4ow/EVFgV2Rr75qb8Be20jKTN0UBj8ybqdAkWmVKw1gJ7jDtM4/
 ++01EIOnrRRqZiGa/Sr35MezSe9QQ8G4SQbfIh3Qet/9iT1lg4n5EVbtC/VEHXDgo2DQ
 sLHhwW7SF9Q9mse/BR2N3vceUQCi8x3l3cF/pGQmr0D5tmCUd6XXpfW+CrOQJfctR+3m
 Pr8ddC770RYCtegkms2Fr3Msht+b1LeObav/XOId45SEQWI315TgqSSx6jjqCM28j2pP
 O8wQ==
X-Gm-Message-State: AOAM530nt5xMaCM3Ja+9kf/tHRyKmh7bh/clu4cRRAkoWEd3m2Et0Uru
 IaFdK7jNjvpoBaDjqF1FcQ1+LV6/+3OADWMFZu4UwQ==
X-Google-Smtp-Source: ABdhPJyy6IXth0grY9TvlAj7pXiRysD/Em+vWPKSc1toQZQ/d5rOI+hnXAj2R8TNHM730gGC1A/Uv4jxb3aQ0WsiQ7U=
X-Received: by 2002:a05:6000:1185:: with SMTP id
 g5mr3552473wrx.42.1603891850012; 
 Wed, 28 Oct 2020 06:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200708144555.718404-1-maxime@cerno.tech>
In-Reply-To: <20200708144555.718404-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2020 13:30:32 +0000
Message-ID: <CAPY8ntDgx67bba2NtNVToEZaLrX5cmrdTB51=0L7qV5F5UOJiw@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Add a name to the codec DAI component
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

On Wed, 8 Jul 2020 at 15:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Since the components for a given device in ASoC are identified by their
> name, it makes sense to add one even though it's not strictly necessary.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 15a11cd4de25..a057db0d9baa 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -983,6 +983,7 @@ static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
>  };
>
>  static const struct snd_soc_component_driver vc4_hdmi_audio_component_drv = {
> +       .name                   = "vc4-hdmi-codec-dai-component",
>         .controls               = vc4_hdmi_audio_controls,
>         .num_controls           = ARRAY_SIZE(vc4_hdmi_audio_controls),
>         .dapm_widgets           = vc4_hdmi_audio_widgets,
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
