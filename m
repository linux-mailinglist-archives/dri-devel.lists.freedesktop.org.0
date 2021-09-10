Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA87406D03
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8DA89C1E;
	Fri, 10 Sep 2021 13:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9916E9FA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:41:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t18so2754755wrb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tElTZdHI5T146W7hCaCXSxp7E94vIOowSRQY7QlyOTY=;
 b=kOvDvjqqAABxvXeognRn+Dzb8Qs9i5wTQ1A/PQZM1gPvuSglaz/QuV19uMLwSiRVCM
 NAC1DkcUnEutxWm1gv7ecNSJc7Ukw+sjw/yGmg2MsM1mNh5DZSCk1BEfAXwwHlt9ZtMo
 LNFQlRejZfbGXm10T84fx0mRz4BK2OAHgDBM0ZT9y0Z07Gd9OszI6gMwcInH8Sbtr57g
 tLVdem9yRWUl3JifVFDJgS2LSzGTSZoue4J0e4XuvqYXWR5NmN2M7eH5Q7Gcw7+DDAW9
 6B5CqTFBymgqVUq9kmWx37VRLM2bPgHc9u5N8GTmzmIVTP3j6Pno5Grbkcj/u8CzlPbC
 4CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tElTZdHI5T146W7hCaCXSxp7E94vIOowSRQY7QlyOTY=;
 b=J3LRpxbQ1Tr/+5rOAxz1p2M3MkEz2CCmyOH/gx/ErOzZ3w6xynYMGeI886EMiq45ax
 /nQA2djMMBLRhq5s7+QuGK3dXVeSynhfqL+lp03Bt89vizcAb7locOsiZD25knJameJQ
 5C3vtDA3Pawn0h4W9lygKiF0l7py62gyRA61BR6dZ2//s/O1ia30vHM4v7maiEtlgYhI
 zREGWThbFfxzpUNbSRAlewW8EtuyDRs8/ygidgXG4I17Q14bnR1svQX29l91fYU+Eevy
 88CyO9oeZW9IDL/I6m2uwNyNWGrRVoYeKt6P+kUywW2Jr9Mv856L5oyjakTOS9fZnz6p
 Ndzg==
X-Gm-Message-State: AOAM533wekvVTFUcKWPVzFFbclTIzlUGoqAoquAGI+J4MBpP4oa3ndZK
 FDtETqCLu9/J3XiqrXFBcFpJ44KWszznHFSqvFobfA==
X-Google-Smtp-Source: ABdhPJxbV+eFELG/s55NtP5QgqAPbdSA76pWek7KXYrr6/CIq7K31JWHhhdzQK3F80ZWA96KTJ5AMxC+AoXP1n8Mmjk=
X-Received: by 2002:a05:6000:362:: with SMTP id
 f2mr9980116wrf.197.1631281285055; 
 Fri, 10 Sep 2021 06:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210819140753.930751-1-maxime@cerno.tech>
In-Reply-To: <20210819140753.930751-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 10 Sep 2021 14:41:08 +0100
Message-ID: <CAPY8ntCoT+dU0P_doAVjY4YyvooFkDCByxZnxJ4Yx5vsA1VaAA@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Remove unused struct
To: Maxime Ripard <maxime@cerno.tech>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Phil Elwell <phil@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 kernel test robot <lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Aug 2021 at 15:08, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commitc7d30623540b ("drm/vc4: hdmi: Remove unused struct") removed the
> references to the vc4_hdmi_audio_widgets and vc4_hdmi_audio_routes
> structures, but not the structures themselves resulting in two warnings.
> Remove it.
>
> Fixes: c7d30623540b ("drm/vc4: hdmi: Remove unused struct")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index b7dc32a0c9bb..1e2d976e8736 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1403,14 +1403,6 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
>         return 0;
>  }
>
> -static const struct snd_soc_dapm_widget vc4_hdmi_audio_widgets[] = {
> -       SND_SOC_DAPM_OUTPUT("TX"),
> -};
> -
> -static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
> -       { "TX", NULL, "Playback" },
> -};
> -
>  static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
>         .name = "vc4-hdmi-cpu-dai-component",
>  };
> --
> 2.31.1
>
