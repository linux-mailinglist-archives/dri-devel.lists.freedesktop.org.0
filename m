Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D54230CE0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB4B6E31D;
	Tue, 28 Jul 2020 15:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CAF6E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:01:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 9so17605346wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7U1Q9zeroE/yPznt2D4XGJyQI13I8758w9wiJAiJy0=;
 b=jqMplwp4VEt7NK46p9DKah2lRF0mHZAS3/mKudshZMy8FcXvLybfAOfggbp9fNABQB
 qdQQrywnrwpr5DVhoAhfpSeN+ncqAgJtbISGMwiO6YiTK8PCRZHkJzwpW2kB8dXRo3F6
 IBtN14ZY0oRy51onC4wkHrXX2Y1HiC/3g3u0qWtxUma2C/vqF0vc9RHpTheV1xzp2TwQ
 tGxBRYBqe4wlQ+B9ML2ck5jheJgA0cFOd86MZN4vaAJkGxaj1/EZAyKBj0Vyvq1n5HqP
 dVtkcScjBUvdltbqg66XgcZowjJlsIO05W8ARbU60uZK/a5nFMjopidVmfwmeDt4r6EX
 kRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7U1Q9zeroE/yPznt2D4XGJyQI13I8758w9wiJAiJy0=;
 b=K/utN975Dr5YsDaGxhWACj6CocDjRF/HcgebNik419s9ATAeTTe/xM1fSfBudvDDrQ
 nlt7r4AellbCnBwtgvy3xZs+llm8oFKqnv9n/s47QWdSBpdkZL+q7Z/yt0MjB1rrb5v0
 cXrQbMC5rFe5CKDQM0SMPSXJTDGvaNHyVcDvtEE4vOPdY1yEcGIq4PfeNBPTzJumGs79
 WFVwNFvbY6RKCyFEC7fVOLxNNJzIoh2yWLdGAor12iJji64keOlZv6X+siOj3wp6shPW
 SJJq5XNu0Ps27PJTYNje/sFaEoj4wrUIA5CQAknT+p4nOQ7SzoWgpG38/vyuIIyscDi/
 3YPw==
X-Gm-Message-State: AOAM530kLiEAfcpUeaKTEHx5kz5He5HWQ4B4mCcRHrykWQcPmqOWy+qd
 7lU4ba9gBX+Xnlge3qKW74pniTEKRtC2g8mRBxtacg==
X-Google-Smtp-Source: ABdhPJwtZsESR7WdQs9vZjByKfImYo4n+KjVPXTXmg/4Xny0qvN0mdHnW9DUz8VR/jWrvijgch9md6yvGN2RFYNjzxM=
X-Received: by 2002:a1c:e382:: with SMTP id a124mr4091054wmh.96.1595948465354; 
 Tue, 28 Jul 2020 08:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <7d4c17db4a1214b7665375aa83fe1f8b4f0fbdfb.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <7d4c17db4a1214b7665375aa83fe1f8b4f0fbdfb.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:00:50 +0100
Message-ID: <CAPY8ntBJriBEa4ORW5Ns0zc0ma=7HoooCPKTQb9cfiVQe02uCw@mail.gmail.com>
Subject: Re: [PATCH v4 68/78] drm/vc4: hdmi: Deal with multiple ALSA cards
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

On Wed, 8 Jul 2020 at 18:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI driver was registering a single ALSA card so far with the name
> vc4-hdmi.
>
> Obviously, this is not going to work anymore when will have multiple HDMI

s/will/we

> controllers since we will end up trying to register two files with the same
> name.
>
> Let's use the variant to avoid that name conflict.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

With that change
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1b6f51849d6c..0a9a323e03d8 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1044,7 +1044,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>
>         card->dai_link = dai_link;
>         card->num_links = 1;
> -       card->name = "vc4-hdmi";
> +       card->name = vc4_hdmi->variant->card_name;
>         card->dev = dev;
>
>         /*
> @@ -1503,6 +1503,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>  static const struct vc4_hdmi_variant bcm2835_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi_regs",
> +       .card_name              = "vc4-hdmi",
>         .max_pixel_clock        = 162000000,
>         .cec_available          = true,
>         .registers              = vc4_hdmi_fields,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 4aea5ee8a91d..34138e0dd4a6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -30,6 +30,9 @@ struct vc4_hdmi_variant {
>         /* Encoder Type for that controller */
>         enum vc4_encoder_type encoder_type;
>
> +       /* ALSA card name */
> +       const char *card_name;
> +
>         /* Filename to expose the registers in debugfs */
>         const char *debugfs_name;
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
