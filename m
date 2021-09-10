Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72932406CFF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2926E9FE;
	Fri, 10 Sep 2021 13:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4966E9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:40:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id y132so1256893wmc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKwtRtKNyEyFl+XAEvxUUNMg7xrC4MkTfnM9O1k3TxQ=;
 b=jH27HIhR8WhZDVXGOYs9KRNebu2udlkPRXFZcpL9BbD7ozinsJxt0p1lKjSYaxIVK8
 3bY6gvm1SOJHdIH0+CPG72bgvTJiSaVI283VDLUr1pB5joB90k9WoHG3bsLxl0yvtN4Q
 nrPrejbPCqVCi0Q36dnEdVsz0BmxajGkiN0PQ6BDvYNiNRZNn1ms5HMYMUmgCZgjGuGL
 p7PbIscEPCanXrEvq/a5f6MUy9fdZC6dzTpGZBjg7Fc6Zuk8dFLiGGhein1CXJQlyOZN
 XOd7uMgaFKmrQwn7/2mx9UgUlmtIqtnVi1sysDCXj08ADAkDrNXA9ajBwcg/UR9rixvH
 mi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKwtRtKNyEyFl+XAEvxUUNMg7xrC4MkTfnM9O1k3TxQ=;
 b=jSuYmN0lXDp8cadLtufBv9KUQO9WTgJpSB7KSdQOkMg/O1oBs2DTNMWQqlOnDCdc/3
 pLUNfLA2z17Zni/CLOLAL1rBhk5zCudeqwpZXfrwr0BPG/s+E4OWyQI2ef+m3eoHjAoF
 34F175EWkIGEEKNquR8zHzF60srSinW/fbD3r9APrymx4rHMNXz5zVkKBP+EDw8MW9dh
 qyclAnm8C1GsrKEMMFEn3FklchyQLjpwCFf1FtDtUwfKc29VHxwe0wH52rGTJMTRshIb
 MqCPiANee5eKj43Cy8e/2y/MAAz3QL/snEqEEZJ30rQkKdowtuzzLxJidLEP6m6Uobp8
 2qjw==
X-Gm-Message-State: AOAM5310kp4l+KWK9++4jfdLRSY7VCkrs6QR1xcAWLIpaE41YOZKFNgp
 OJQf9xzSxNk2SwZ1oLf+pr23hoARYWT+fGeft2Yzcw==
X-Google-Smtp-Source: ABdhPJw7NGEmYtNIhEfy2wqXmK5HfyPQZXZ26xfT+WnZ4GispoLQzC0KdaH4Yu+MVieI/6yY29CDOYiEFDAtPkcWHY8=
X-Received: by 2002:a1c:a747:: with SMTP id q68mr8504905wme.180.1631281228234; 
 Fri, 10 Sep 2021 06:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
In-Reply-To: <20210819135931.895976-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 10 Sep 2021 14:40:12 +0100
Message-ID: <CAPY8ntAohBfUXhiQix9qd8434J0D1h66kNFJ1a=_aHYAWmo9DQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/vc4: select PM
To: Maxime Ripard <maxime@cerno.tech>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 LKML <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
 Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, bcm-kernel-feedback-list@broadcom.com,
 Emma Anholt <emma@anholt.net>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
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

On Thu, 19 Aug 2021 at 14:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> We already depend on runtime PM to get the power domains and clocks for
> most of the devices supported by the vc4 driver, so let's just select it
> to make sure it's there, and remove the ifdef.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/Kconfig    | 1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index 118e8a426b1a..f774ab340863 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -9,6 +9,7 @@ config DRM_VC4
>         select DRM_KMS_CMA_HELPER
>         select DRM_GEM_CMA_HELPER
>         select DRM_PANEL_BRIDGE
> +       select PM
>         select SND_PCM
>         select SND_PCM_ELD
>         select SND_SOC_GENERIC_DMAENGINE_PCM
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index c2876731ee2d..602203b2d8e1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2107,7 +2107,6 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM
>  static int vc4_hdmi_runtime_suspend(struct device *dev)
>  {
>         struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> @@ -2128,7 +2127,6 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>
>         return 0;
>  }
> -#endif
>
>  static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  {
> --
> 2.31.1
>
