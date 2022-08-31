Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97115A80D5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 17:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C51A10E426;
	Wed, 31 Aug 2022 15:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257210E421
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 15:03:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a36so14968372edf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Wvt6ITeF/X4JRSxdtK92jcKPth5+KtUlEAYbOxr/jds=;
 b=PddbYj3qG05D1/L5GWquq87ECVO4EbUwFENnYFzNQL2UqGwNkl9svThio3fJoS1Xj2
 mmCGnKGnMsMVQSIqJmeBWiLM/VxF5Zuftj4L8bV4+SXaMbCBlffHpWUMtqyu+kY+/v/Q
 M9xWIbikP2nLLWQHu267ekz+EL+G1ArpvB8fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Wvt6ITeF/X4JRSxdtK92jcKPth5+KtUlEAYbOxr/jds=;
 b=dgBZlZBySrWb1w2ekcDsSgoJ4xakxmJsFK/X5CHgaZ/1SYK17LT+0uddoxTyCAmJBa
 wB3nLF6CWM86pdz/oxKb+stp00Bl9qJjh5XYeN4syXK4DUeakyBpolSjBG5wzLWL/Mhf
 0EcfSSFm5HCbTxHfuPraImCHsra1RmUpERfuEvKtTEVlyFJJNaMkAKO1qxzSl0OF7VYR
 jRcSguA9JbX0xr7PZfd+S49ZhiLujxYlrGYbDpN5cCaYBttv7zYOT71Emg2R4DGXNrI3
 68VRh88tlnalh3cHWo1hqmaJf+1vkSrZzb7iZvlCkFJh//sqOwEdsGrDDrbx8O1n61l+
 Hrng==
X-Gm-Message-State: ACgBeo18vIHp+Cd6aw9gZ8w+OnHo1JD5ETniHiCphCvobmn77dKiMtyC
 jKJWsCYs/wj9Qb/ik5VKQsNzEixkwGqUHaG0Xms=
X-Google-Smtp-Source: AA6agR7muVd7IJ/zK3EpIdFuq/kaGVCgvkJ7S1fzu9bzAjePbmLUUlH6CP8d2BoAQd+oN4Q0dVb1yA==
X-Received: by 2002:a05:6402:515:b0:447:780c:39d6 with SMTP id
 m21-20020a056402051500b00447780c39d6mr25297618edv.265.1661958204988; 
 Wed, 31 Aug 2022 08:03:24 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 kx17-20020a170907775100b00734a9503bcasm7292137ejc.135.2022.08.31.08.03.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 08:03:23 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id m16so18630499wru.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 08:03:23 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr12130960wrr.583.1661958202933; Wed, 31
 Aug 2022 08:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220720162314.1.Ieef5bc3848df40b71605b70bb571d6429e8978de@changeid>
In-Reply-To: <20220720162314.1.Ieef5bc3848df40b71605b70bb571d6429e8978de@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Aug 2022 08:03:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WC0QUaZsHQHhc+TAV2JXT64rnxDh9OvskpVrZAXzfz=Q@mail.gmail.com>
Message-ID: <CAD=FV=WC0QUaZsHQHhc+TAV2JXT64rnxDh9OvskpVrZAXzfz=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Fix typo in kerneldoc comment
 (appers=>appears)
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam,

On Wed, Jul 20, 2022 at 4:23 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Ever since I got the spell-check working in my editor this one has
> been bugging me. Fix it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index e6645d6e9b59..07a383dff548 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -53,7 +53,7 @@ struct panel_delay {
>          * before the HPD signal is reliable. Ideally this is 0 but some panels,
>          * board designs, or bad pulldown configs can cause a glitch here.
>          *
> -        * NOTE: on some old panel data this number appers to be much too big.
> +        * NOTE: on some old panel data this number appears to be much too big.
>          * Presumably some old panels simply didn't have HPD hooked up and put
>          * the hpd_absent here because this field predates the
>          * hpd_absent. While that works, it's non-ideal.

Maybe you'd be willing to give me an "Ack" for this stupid little
patch so I can land it? ;-)

-Doug
