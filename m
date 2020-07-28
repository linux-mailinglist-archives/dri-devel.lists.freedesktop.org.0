Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293F230CA4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 16:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6446E301;
	Tue, 28 Jul 2020 14:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA146E301
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 14:45:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y3so18563073wrl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wFSLR54AG21yXuJSgEQrikeXsmLVyETIXUBo/YY7SQI=;
 b=n+V6fb8gaxi3wvPz5q/AZLkhYBFp17gFfZqBFOk707HPWjBYa1FRt8Ltx/88IKG7qW
 6QqtyNH4gMQyQfCXhKhAzP/0HSt1ZuBRzf6T+RuL/Wzr91cYH7zl3mLYRATzYGUgG5bJ
 t3MUy688J6u6xPFQtjvcbDNyXdS5qe80q2byIpC/BLDkw4jsX4nR7TYgR6D3BmJzvzXm
 tK964nLtGTzrl9xIkcejSN0Wo7Vumd2XDIih8kw822g1+oNTLUzpWOUhZG925+s/3o81
 Ej1wF810eZTRNrJnNPdKvuImV52MbsLK/93Sc+HOessePEry5j8S2V9Rl624t9iVF5X2
 Ksew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wFSLR54AG21yXuJSgEQrikeXsmLVyETIXUBo/YY7SQI=;
 b=V4ca0zqrmui7y36yEMn3/ImCHsDk+pRvUBmLM45gLVu6J1//3bOnl+tZam8h9y0+9c
 FriRKkErwUBB7d8Y82A6Ngpfp77ULUAB7nmCm6QKSU0mBuOJ1Hla3hRMwqvmMuptavYy
 7TfiCVWL9ty8FivCQ7bOnCsm0k20+4USS3lXPrBeq3YUiPogXiHDgUZqsTV0rhIoq5r6
 jgqruLjGZtc+Rr6x2phWMUsxq7Zng8puiricR0x9XOxMY6t/P+WIxoN4a4LVpD+l7uRt
 vQg53inOlhjso5YPtxpYNhRlJIT82k0ywcUj80poaso/LmClWBEacXfHUAQWgqSk8Onr
 o+FQ==
X-Gm-Message-State: AOAM531xslwT8qywR/7w69dNRnxz+maplxo57wO70ODSycS1XMieoyVF
 PtSeERFNyYKFdGKDcRimnV2XZ3TV0q3+Y/H5erg0v5IijgM=
X-Google-Smtp-Source: ABdhPJxoae//gYKTh/KK+nGIJmSuUkxCKkLOygUv6fN0WS/O+exw/sJdg+qry+20wk4f/UqGvyE5iGiVLDilp4dPrxE=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr19963786wrs.273.1595947526232; 
 Tue, 28 Jul 2020 07:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <98c93e0a594e42e39ba77946a0c8107996495eae.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <98c93e0a594e42e39ba77946a0c8107996495eae.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 15:45:09 +0100
Message-ID: <CAPY8ntBk03NO40LtZjqgWbaC0JnJm6S60mftaJskfCXQY9WJog@mail.gmail.com>
Subject: Re: [PATCH v4 61/78] drm/vc4: hdmi: Rename drm_encoder pointer in
 mode_valid
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
> The mode_valid hook on the encoder uses a pointer to a drm_encoder called
> crtc, which is pretty confusing. Let's rename it to encoder to make it
> clear what it is.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a01562a49bf0..17797b14cde4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -556,7 +556,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  }
>
>  static enum drm_mode_status
> -vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
> +vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
>  {
>         /*
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
