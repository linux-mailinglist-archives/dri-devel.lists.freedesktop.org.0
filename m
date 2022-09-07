Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DDD5B03E6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B623710E665;
	Wed,  7 Sep 2022 12:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5C510E665
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:27:26 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id bh13so13439443pgb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6cuL5VnEZ/yRZzjgpFNpylmzRf+vnL1tNUfqg3eDNh0=;
 b=Uo7knmfnpSGc+UHa4pKiYtM8ydw3bIkafAj/hH/xwUkpRRcDRvpbLFTvNprUIjwf+3
 hR/vOPWo74bTDdh05bpDsC11vop7NIXVPOd5IdJqoXPzj99faqVPhRyk1uBBDgGZZE5/
 Y4xp8AsEYWNa8wQaXhHA/Ce3JA2DbwaMxuLum8M3WXYZb4i3jqMXXhc86vLghDu6ycTr
 85PLjHSdXpL6iPsVsafmCaxe9gzZclOE06kITKU6l+2wbnEtFXqEVlPBhf/IZVAhrcw1
 Dhv5EnMmlh7XKuXRHMwkWVMG3HwhUR41QBSCJQVsKs0Wolo/DStN9wytERE+kn5nYvEN
 fuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6cuL5VnEZ/yRZzjgpFNpylmzRf+vnL1tNUfqg3eDNh0=;
 b=3qB3BPEzzgroiCAJ7+QVQMRw657UebCe8VzjAk5TN1+2fDXxxwkekGfJoILiFrM84g
 /itwO9ZcmoXKC9JHsQg3BQO3pQIvOR6nFmGbUylalKX69vWU5Sv8B6liRpo3EJhZue1q
 KVXO4buWPOx6aVUSw7hwVeXlw7gUrq5wJ0XKbGqmTbMXPBsnMueTqQ34N015SVZQu0Hh
 Xcqon8u+M9ZGSV/Nj9znwtmV0p5Dv/1W46RG6/ta0/9U8lWdTs3pfrtR2EQaALzLg4Ol
 Y/i3XqNhkR1qQdZmKpCLKt1JPLjFxAj2tPD5AHoPkBu27uj+dwy8zR6/mxRBJCvt8HHq
 ujmg==
X-Gm-Message-State: ACgBeo06U+36+db0CMjt9o2js+X2/tn53nFCG+h296NteYMDt2WJ19KB
 Y6TNalx1LfYg2IUbz09jVKHO9M5OizjjEqmEjoA=
X-Google-Smtp-Source: AA6agR5G+AaJAv35pzKRY03IxagEwcexQyPBpB7dTQ3tpQUaPPSM/hF0zFXIG5kdtsFtjg81/rVv0ReXqMgPbVz3Yyc=
X-Received: by 2002:a05:6a00:2999:b0:539:c397:4a5d with SMTP id
 cj25-20020a056a00299900b00539c3974a5dmr3638897pfb.13.1662553646436; Wed, 07
 Sep 2022 05:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220907113927.35305-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220907113927.35305-1-yuanjilin@cdjrlc.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 7 Sep 2022 14:27:15 +0200
Message-ID: <CAMeQTsbAsi-kQYRzWMncnvB2NAiQ3nL45YsAirROHbGJROzerA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: fix repeated words in comments
To: Jilin Yuan <yuanjilin@cdjrlc.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 1:39 PM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
>
> Delete the redundant word 'for'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Patch applied to drm-misc-next

-Patrik

> ---
>  drivers/gpu/drm/gma500/oaktrail_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> index 6004390d647a..64761f46b434 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> @@ -310,7 +310,7 @@ static void oaktrail_crtc_dpms(struct drm_crtc *crtc, int mode)
>                                                    temp & ~PIPEACONF_ENABLE, i);
>                                 REG_READ_WITH_AUX(map->conf, i);
>                         }
> -                       /* Wait for for the pipe disable to take effect. */
> +                       /* Wait for the pipe disable to take effect. */
>                         gma_wait_for_vblank(dev);
>
>                         temp = REG_READ_WITH_AUX(map->dpll, i);
> --
> 2.36.1
>
