Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BADCA2306EE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF286E22B;
	Tue, 28 Jul 2020 09:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98026E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:51:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r12so17594199wrj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Znk80EAJWe03G2pyNc40Xve7p+xFAYQ6xUkMqBZJbRw=;
 b=i+nhUpib92cG7Dt3A5EEey478owxGiRXhqyIfM1QuUGzZn8TiA+akEqhLAZ5Eqv4zc
 yyuP77VUnuRGZToDKL7OeD98rTbEXu3aXgJqMH3TgpTxnmzsdtl2yf2ZP2XHwLyYunFt
 vXjbinN4jflyJbhHH7x5J2skDMDYjbOZ0vKjRkQibcgO0wPORWOBjJbD5hNW+4d85ijz
 xJSZFIebamoyAvtnJ37gqqZP61bF0wGTplxSyLoHzhFCQGUdTBRrtrZgbBrlkVdr34wC
 06LY0T6GQaw2cru12tQ43EYL5MN1RkE/jg7eXP/DleD6otrMesDarNDKMLAKsSNrCnVF
 /N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Znk80EAJWe03G2pyNc40Xve7p+xFAYQ6xUkMqBZJbRw=;
 b=giuoEZghPNDYfnVbF271Eb+tUTZOp/yKDUQsWGTWClXHiaEuJsKUB3Ds6aWrH4D4vj
 m69fPVth4vtUUJiRWvCQDTbE6MEiqc/2sEONl461TKRIuEKcthTBY/pQV0eFWlqsF4zc
 KrGV2H2pc1G90Z0bxpEtf0zR/2M80VhDPjTz6acoJtkR3kRIZieLZZjZCZz66Knfgc1J
 6krY7ybw5pS7t9HvaW8HcP2y7Fyssz+QqylhT63zIj2UFsOzeKAhfCiD6poRJ751u8bl
 9kLOtGX+HpR7VsiEUFNqyGsibtV8F96f9spxUk/STHLhp8u6930N5ZH9b5vDZqTKKtTB
 8prQ==
X-Gm-Message-State: AOAM5306nWs7p3yHA/8kj0+SbpAf6OYvVkR6T+TLNvvDFMRkxGLNDFSD
 14uZwlSaP45k2f5C8EfHKO22RJl+QE6HBZY38jHQXQ==
X-Google-Smtp-Source: ABdhPJz3YAjU9S+NHPtVDvPte3f9GOfaHQiDoSCKgiMmkss0RaJxXVQ9k9KgI/GbemDggIXSiz1Z354U4LyqP/tG0yU=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr6783158wrs.27.1595929859449; 
 Tue, 28 Jul 2020 02:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <0f6b7375a07b70353336dd7c9420138186d62936.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <0f6b7375a07b70353336dd7c9420138186d62936.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 10:50:42 +0100
Message-ID: <CAPY8ntC3Smw+pH6Dbyob_voO_+Huw9Mzpv+F_FHnrOERLfS1hA@mail.gmail.com>
Subject: Re: [PATCH v4 11/78] drm/vc4: crtc: Use local chan variable
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

On Wed, 8 Jul 2020 at 18:42, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4_crtc_handle_page_flip already has a local variable holding the
> value of vc4_crtc->channel, so let's use it instead.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index d3126fe04d9a..cdeaa0cd981f 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -533,7 +533,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
>                  * the CRTC and encoder already reconfigured, leading to
>                  * underruns. This can be seen when reconfiguring the CRTC.
>                  */
> -               vc4_hvs_unmask_underrun(dev, vc4_crtc->channel);
> +               vc4_hvs_unmask_underrun(dev, chan);
>         }
>         spin_unlock_irqrestore(&dev->event_lock, flags);
>  }
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
