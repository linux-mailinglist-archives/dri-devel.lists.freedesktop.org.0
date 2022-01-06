Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD2485DCD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 02:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930A810E5BB;
	Thu,  6 Jan 2022 01:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE35710E5BB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 01:03:06 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y11so1239382iod.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 17:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LnAubQ94PDCRwQNOSUL7oWBc6st8xuAGeyidhQSqpxM=;
 b=L+KKy1dIZAwAdNTOVd0qKOKt+iqom+ZV4roHbjm+6kadMtLGIIVBSiOOCpx34AcihH
 0O6o2MNxPd0Y4mb8rb6+/dBn+2ajW6we7n+Nvt1v8DST7b+3zYtGiNC4A1jVWzbSaLHP
 YeeKuKQBkCpeABG0hXzBrLpv1VFCNMOe5GVBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LnAubQ94PDCRwQNOSUL7oWBc6st8xuAGeyidhQSqpxM=;
 b=MBFXADHeUcPKUMu9Jy7ZHYDyOI4od36jR4p4lQS8ZW+hhB702VrFC9544w/NfOn7wt
 lxePLuJBCP0rsWfWyVcS64X9PKxl+IVwsoYBrb+qceKkyl12a6ps1ZgRRk7fwFI4ufc6
 1Yi2Kls0b9WekEDFGNZ8wjsyxkZho4hB261k/hSAzntpw6LpeYb1gBaZPke3IGy3Weva
 vzX8OL2FH3ATcakrLCsBkD524u6sKnrdWE5K9FrtVd8fp74QvLJkHrjw4ABE6rP07DDX
 fwf+e0ojn8P8s2psT201mkTSb7xj1YR/23qpon7nNaVdiAzip893X7RltOtiJAR+ac3K
 4Y5Q==
X-Gm-Message-State: AOAM533FH/Ieal3VrK2JE04/ChxaOwHFRj3f11orzmeAUFlmErtDEHWq
 5GmQjzT7Z5PobPHMWMlvA/7pM6+KTG9T4g==
X-Google-Smtp-Source: ABdhPJx0zqdwEZ7Rev1w4I9tkAlzNgttQkiTK9jh8CTBc7wlxQsc2n1CMz6lrftlPAMllkPVohoCyQ==
X-Received: by 2002:a05:6638:a8d:: with SMTP id
 13mr18245225jas.68.1641430985978; 
 Wed, 05 Jan 2022 17:03:05 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id u14sm260692ilv.66.2022.01.05.17.03.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 17:03:05 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id 19so1248990ioz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 17:03:05 -0800 (PST)
X-Received: by 2002:a05:6602:2c83:: with SMTP id
 i3mr25918868iow.128.1641430985233; 
 Wed, 05 Jan 2022 17:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-2-thierry.reding@gmail.com>
In-Reply-To: <20211220104855.428290-2-thierry.reding@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Jan 2022 17:02:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeN=rODkhO3gYNZ5rFW1iabirHopR0Ra5UFAKLNn1zYA@mail.gmail.com>
Message-ID: <CAD=FV=VeN=rODkhO3gYNZ5rFW1iabirHopR0Ra5UFAKLNn1zYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: dpaux: Populate AUX bus
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 20, 2021 at 2:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The DPAUX hardware block exposes an DP AUX interface that provides
> access to an AUX bus and the devices on that bus. Use the DP AUX bus
> infrastructure that was recently introduced to probe devices on this
> bus from DT.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  drivers/gpu/drm/tegra/dpaux.c | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 8cf5aeb9db6c..201f5175ecfe 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -5,6 +5,7 @@ config DRM_TEGRA
>         depends on COMMON_CLK
>         depends on DRM
>         depends on OF
> +       select DRM_DP_AUX_BUS
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 1f96e416fa08..9da1edcdc835 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -18,6 +18,7 @@
>  #include <linux/reset.h>
>  #include <linux/workqueue.h>
>
> +#include <drm/drm_dp_aux_bus.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_panel.h>
>
> @@ -570,6 +571,12 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>         list_add_tail(&dpaux->list, &dpaux_list);
>         mutex_unlock(&dpaux_lock);
>
> +       err = devm_of_dp_aux_populate_ep_devices(&dpaux->aux);
> +       if (err < 0) {
> +               dev_err(dpaux->dev, "failed to populate AUX bus: %d\n", err);
> +               return err;

nit:

if (err < 0)
  return dev_err_probe(dpaux->dev, err, "failed to populate AUX bus\n");

That's more concise and gives the pretty formatting for the error code
(not that devm_of_dp_aux_populate_ep_devices() currently returns
anything other than 0).

> +       }

I think you need to use of_dp_aux_populate_ep_devices() and then
depopulate in your remove, right? Otherwise the ordering won't be
right. Either that or fully transition your probe to devm (and get rid
of your remove) by adding some devm_add_action_or_reset() helpers...

Hrm, I guess looking closer it's also a little concerning that if
devm_of_dp_aux_populate_ep_devices() returns an error then you'll
totally skip all the things that tegra_dpaux_remove() is supposed to
handle. I guess that's a pre-existing bug (earlier error cases in the
probe don't, for instance, undo the pm_runtime state) but this makes
it worse.


-Doug
