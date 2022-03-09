Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0784D2FDC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A6E10EAF7;
	Wed,  9 Mar 2022 13:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741C910EAF3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:24:03 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n15so1946564plh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oRZXC1BJWU5wHBAMKvr18W/wUSl+kSjeSXIhLz/2sU=;
 b=DPR3zH9WhDgp67OFBrXbywIYtj2eZKwfu4g+rxaQCZ1w925pDwdZomMek8ZYOf4IHT
 hyJSoj5YpW2KK/n4/cnYUOh3xKOE64v2u65le43o/E7vtXZS+phCqAKsJyAmAOF9f00z
 9VSopSF0UdM1BKdhSy+pzPQDR2WQ13NzsnHYfjuF6PV2ibawnnrOOaWmmPAb7Sf2R++Q
 VUZeVGnwEsjwmk7z8SqP3fUnnbQPrqbPFdOu97dI0b0LgBZlP/H81jvy47EZmh+q4KP8
 mSiCeyQHggeLkG1bDpisnGtm0uvUwsXI8XdcB9wzVJ5cRxwgWHHT9VjMd3chIpetf7Mo
 C5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oRZXC1BJWU5wHBAMKvr18W/wUSl+kSjeSXIhLz/2sU=;
 b=EgXtZXfIpQlySp5vxvL8MRQPo3uHx85k8H8CSZhd71tL5mQ5mN2YiiOptXcZfpo7wp
 vqkfevoiU0oLEgZIFV5pPTUDmbBfE6n/u33+1TGQOHOvBhKUSEGPAM+O0R2wQ4IZbZml
 TWtz05ZFl8Ckzun5BxlJSu7SNKPIe/9iJGm3KjXJwlZtnFyxO0jxtSsHnNgRK7uyqyiU
 96CS8mkZMNim+UeS/A1mbS+HbOh1cl2+13u50uLIN3s1+br4u+PFZRWDRLRua5nAzCBz
 Q7s6reBjXhoO/jIEo8K85dvVPzSdPx+sipvvT96NsdwemGt3YIRBfa+uBuotO20x/1dN
 nfog==
X-Gm-Message-State: AOAM530KLSULsmqd3ZOZi86T/lNoTpZTIuV9I5Z3fg/AyBwYhKNsl402
 6ylnLVBCRK1vWUvGGSogk8qHdlFrUa6XfAdBWyD/ow==
X-Google-Smtp-Source: ABdhPJw5MkFq8UxSrUjKLChZQOA3kh2aek7Niglg0YrY5Z592yyqMyuGw5kuIMEZSJNh1lQBO4g/snUreHdp++oeCCQ=
X-Received: by 2002:a17:902:7044:b0:14e:e1b1:bb0e with SMTP id
 h4-20020a170902704400b0014ee1b1bb0emr22504279plt.65.1646832243062; Wed, 09
 Mar 2022 05:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
 <20220308110615.2.I4485769d5b25a8096508e839b8fea12ce7b836d3@changeid>
In-Reply-To: <20220308110615.2.I4485769d5b25a8096508e839b8fea12ce7b836d3@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:23:52 +0100
Message-ID: <CAG3jFytkSsmN0H3N-ARqLJ16+ughHZqdas09Her_ZOkSTvCydw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add myself as a reviewer for the TI
 SN65DSI86 bridge chip
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Mar 2022 at 20:07, Douglas Anderson <dianders@chromium.org> wrote:
>
> I've spent quite a bit of time poking at this driver and it's used on
> several Chromebooks I'm involved with. I'd like to get notified about
> patches. Add myself as a reviewer. It's expected that changes will
> still be landed through drm-misc as they always have been.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a73179d55d00..7d25d0b4dccc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6284,6 +6284,11 @@ DRM DRIVER FOR TDFX VIDEO CARDS
>  S:     Orphan / Obsolete
>  F:     drivers/gpu/drm/tdfx/
>
> +DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
> +R:     Douglas Anderson <dianders@chromium.org>
> +F:     Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +F:     drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +
>  DRM DRIVER FOR TPO TPG110 PANELS
>  M:     Linus Walleij <linus.walleij@linaro.org>
>  S:     Maintained
> --
> 2.35.1.616.g0bdcbb4464-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
