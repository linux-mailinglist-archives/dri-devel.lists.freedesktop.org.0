Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17F3D8C60
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0FB6E920;
	Wed, 28 Jul 2021 11:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495226E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:01:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso4017145wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bocNcom+XM+jt/yaZntODE+ELWnSFxGY5QcrB5KsPUU=;
 b=EjbJeqOzTBHIOqmnkwnMCJkPUrOgbI1IDfEFz0L1gPOlX423R3Bt2ocdidAT+VWmPT
 Pi2Lel7fGN3o97T/7SLFfgO62PvpQElzqmVC4VVxfc90ZviBK8Y3b/znKbdkyoGwVkbY
 Acy9oYj8foz98GCWHzd0y4h+ToiiarJv0Z2h39nBAHAoPvbL68UNSEonqmvb573waTm4
 iX+1WpMTiOYXtCbdZ84DWQMpKEpnhXwhnStBidT7VjDBA4a4b73r8yFAavmn8jUAprpg
 Akkru7Qq9ywvQ3Hw4jcr5wJU+cCGnPBQ1PfAHxSvywxq5HkeHTxwvX30gf+Gc1umRfTa
 ELxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bocNcom+XM+jt/yaZntODE+ELWnSFxGY5QcrB5KsPUU=;
 b=I9OYcai51vxISgZpMx0tnXGrEFDe+rYE2rOY7lEyOUZA3HXYSOFcHbvoncDrZs91+5
 L2qKYkVEAlj/cItF1gSVd2CR3PillhU/E4BUzqVfmTDhno3HwAtUdehcBMY6oCDy/Hxx
 v9+kF8E86Yae8lrJrD6mMDHJWN44cLXE00Jl3P3f6Piq++71eD+qqVJoR6DO1jMZxMzz
 010cmTsS3jpczVnfmD9J0oT5aS7LvGItMvMq126vaRU7Jevz71JGnqvawMIWYM1FjohN
 7imZSnVkhigf6/pOd0SUTofQ3Dp5ajZkPOyipVD868trVNEWzuHmtX9ya/xbmBVlqa2p
 lmIg==
X-Gm-Message-State: AOAM533CDiEtZ8/Xm/CEBfPtHWufG0ICsCPsHb1oL7xHCxScA1fVO7+j
 pN3f7aDaWQcoMFWp2NhviEPRlb2JY6AsMEeAJ3eSIg==
X-Google-Smtp-Source: ABdhPJyna0vcoiKE/wYRcEVB8vIZ5PlgxSOy1HdpZLPd4BVX7GO8vBxp7RFPT0UZjP63w4uRBWo3MPTdKXzHObWSVC0=
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr26212334wmg.183.1627470110734; 
 Wed, 28 Jul 2021 04:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210707093632.1468127-1-maxime@cerno.tech>
 <20210707093632.1468127-2-maxime@cerno.tech>
In-Reply-To: <20210707093632.1468127-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Jul 2021 12:01:34 +0100
Message-ID: <CAPY8ntAAE+N79T7Q15URHRkGf+N6f2DKNjtyp+74AFjNdb3Prg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Remove unused struct
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Jul 2021 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commit 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec") removed the
> references to the vc4_hdmi_audio_component_drv structure, but not the
> structure itself resulting in a warning. Remove it.
>
> Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 3165f39a4557..1bb06c872175 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1403,18 +1403,6 @@ static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
>         { "TX", NULL, "Playback" },
>  };
>
> -static const struct snd_soc_component_driver vc4_hdmi_audio_component_drv = {
> -       .name                   = "vc4-hdmi-codec-dai-component",
> -       .dapm_widgets           = vc4_hdmi_audio_widgets,
> -       .num_dapm_widgets       = ARRAY_SIZE(vc4_hdmi_audio_widgets),
> -       .dapm_routes            = vc4_hdmi_audio_routes,
> -       .num_dapm_routes        = ARRAY_SIZE(vc4_hdmi_audio_routes),
> -       .idle_bias_on           = 1,
> -       .use_pmdown_time        = 1,
> -       .endianness             = 1,
> -       .non_legacy_dai_naming  = 1,
> -};
> -
>  static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
>         .name = "vc4-hdmi-cpu-dai-component",
>  };
> --
> 2.31.1
>
