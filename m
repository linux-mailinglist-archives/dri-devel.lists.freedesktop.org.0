Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D315139C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 01:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF666E505;
	Tue,  4 Feb 2020 00:21:23 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EFC6E462
 for <dri-devel@freedesktop.org>; Tue,  4 Feb 2020 00:21:21 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 66so15480785otd.9
 for <dri-devel@freedesktop.org>; Mon, 03 Feb 2020 16:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LPuXmrJI40A2Un1MmFXL7OHrwiIKEbtwiS4nTQZEtlw=;
 b=Sqy4Qf7TbtVRb9AKX7R0QHMGO6MbjHFjRhrNLCVULzUn/tmym5SloAoPUq1SLwktqL
 YfDK2SvCgqu1fkHcx0lbvUks2URnH9G99ch0qldrHccgrrXWifX1cpgNKWL3di2+l5qG
 Iwa5jrVHUpE4EDrYxjMPzWGaWAWHjMLWl631queL7ztP48d4tpQc/xVcRzYnMe81w7uC
 4hxAPoC0OgBYxmSUgZWTss5WoM88w5zWJpgZGqSN5GUyK+Gqf6JeoJvJ0WVhmy55jGIu
 VOwXEJfrLuQ1xyydF5FCEOXUqw/PKDYZA6sbjwFeJXBDWoNWiF1G1cD7YnRP7AONLW+P
 e5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LPuXmrJI40A2Un1MmFXL7OHrwiIKEbtwiS4nTQZEtlw=;
 b=A2noUPWaLxLnwBcab/vBIK1ClDa49f6dnyzjWoe6Cng/tcRLHm2vOZ2GlxJ/OZla6D
 7h0Ofx2tysQrIGAjHYet8RN/a2A97en1xW5XSSu7AVPv+5xTJqN5oDrrj9xG65+SxbUL
 WBwk10viGGvmfm6lPFlztJOzR6/chERF1R3Yk4NDqLwMWiloXpLC2d/0WogK7o0BR7J5
 GKkqdzF/KNhI5TpdP/jsCwwwlAad2doIfX+wmtrcCKIqKSZMKYcR8fO7iy5gq4VKpEeg
 ADpywuoamPzW1Ot9da1DKKEBCmr8hR+zMpnXNOqT7pnEaroBoFjmXDCv2VWElXAHf7OD
 KXYw==
X-Gm-Message-State: APjAAAV4Q0JEjv7vM2ZCuWZ8ikE6LzMKyHT0UqvYhGcJTQo9Ol+w+G3R
 3J99F/eIOjL0Dyn3o6wwWsieetChqMLX4IQ2xNTPdA==
X-Google-Smtp-Source: APXvYqz/YSe/X4e5btHvwVXt9j0h9vzKao0F/dYt5ZLOc7r211EAvVVKoCb8baK3UiKvJDxzD5l048nUmNuGreHgVVI=
X-Received: by 2002:a05:6830:1094:: with SMTP id
 y20mr19728104oto.12.1580775680897; 
 Mon, 03 Feb 2020 16:21:20 -0800 (PST)
MIME-Version: 1.0
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
 <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 3 Feb 2020 16:21:09 -0800
Message-ID: <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: msm: a6xx: Add support for A618
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-arm-msm@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 11:19 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds support for enabling Graphics Bus Interface(GBIF)
> used in multiple A6xx series chipets. Also makes changes to the
> PDC/RSC sequencing specifically required for A618. This is needed
> for proper interfacing with RPMH.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index dc8ec2c..2ac9a51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> +       /*
> +        * During a previous slumber, GBIF halt is asserted to ensure
> +        * no further transaction can go through GPU before GPU
> +        * headswitch is turned off.
> +        *
> +        * This halt is deasserted once headswitch goes off but
> +        * incase headswitch doesn't goes off clear GBIF halt
> +        * here to ensure GPU wake-up doesn't fail because of
> +        * halted GPU transactions.
> +        */
> +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> +
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>

So I already brought this up on #freedreno but figured I'd follow up
on the list.

With linus/master, I'm seeing hard crashes (into usb crash mode) with
the db845c, which I isolated down to this patch, and then to the chunk
above.

Dropping the gpu_write line above gets things booting again for me.

Let me know if there are any follow on patches I can help validate.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
