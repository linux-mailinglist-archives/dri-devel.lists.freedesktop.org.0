Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D9752285E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4571F10E6AA;
	Wed, 11 May 2022 00:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167C010E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:20:47 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2fb965b34easo3998597b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vpXpw5XZq/WrbDVmy+tJWQcUF77jv1N0UbvJAonvnU=;
 b=w7tblpXNjCpAdHrXR8Vsnj84FjFr91Zp7XFGp6hW6GdlcUctB8YZYvWN7+FqJhUsWp
 Lfa9hz5DunLQMwkY2ijmdSDjEK+cvJE4bQLfuudysuE6TGFtxDwybpYoyjbSd0rfiLCB
 ysPvqVgG3peWvDc+qujiXzaPwuf10GS1B55GhkPDJucFdnHiVI5R7+wLSoL9lW8bnBVP
 z7GHP9+5NduIv82dOfKwrJYFFZZiOkMLJfZCowmQJFAVpkHmm0div0lp7B2unJ4Af4v5
 bQnCGd3mcPkUpVgnxRgKCOIeTv14KQTG8EzBpPW8feDLdK1iMlzNYQcSBnRl3CzFdszT
 yvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vpXpw5XZq/WrbDVmy+tJWQcUF77jv1N0UbvJAonvnU=;
 b=h3hK+NsptsYfhMxTsRIru8nnUJbNGmE/yWyaiZmHt2LEcyPtyVCBzdAOdPgqSANUnW
 7Xf+c4bLKV6eS4DLWszrqiBcqTmpQ0ygO+nOXI6tLgBQmPlZp3ZBeQij9aUOo3zaUiTh
 QvMCebL7KZopmUhKUo4eF5hOK+6JybVne8looMsqVwBQdHgqzW0ZACC9MnRnNBa/JHSj
 Bh7HqlG7tGVfXZnCTBhBlWP03f/0QH5u1aPKpYE84KPwMBeqjG2VGXUy8EzKJ7YGeUI0
 RAMGviye5tNudCpr2dlg2ZX9ko0q3Am9AqzvotaDcMyMxnVWSnatsAqwVx9uF+sRlqXg
 a82g==
X-Gm-Message-State: AOAM533QKlTXtYb2jpAt7ztrCPH2DlbrSUuhxRLQsPRKijubF/aAmdZX
 HSXW9td9GB6ILbsHb1uQleEebWvq4QXULc43Gt16nw==
X-Google-Smtp-Source: ABdhPJxvhAkk2Km4fbuCctbq2xFMtEja6/plgDD2L2i2wt+jmqVRruARk+Pto0kZ1tDyHEnHY8br6RxGTF6LJx15PkY=
X-Received: by 2002:a0d:db8f:0:b0:2fb:958c:594f with SMTP id
 d137-20020a0ddb8f000000b002fb958c594fmr1290258ywe.490.1652228446267; Tue, 10
 May 2022 17:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
In-Reply-To: <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 May 2022 03:20:35 +0300
Message-ID: <CAA8EJpoWA3sFDpAESp7XoZ279uTk25cxTcr9Chjp=0vrBaNmtA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Export symbol / kerneldoc fixes for DP AUX
 bus
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022 at 22:29, Douglas Anderson <dianders@chromium.org> wrote:
>
> While working on the DP AUX bus code I found a few small things that
> should be fixed. Namely the non-devm version of
> of_dp_aux_populate_ep_devices() was missing an export. There was also
> an extra blank line in a kerneldoc and a kerneldoc that incorrectly
> documented a return value. Fix these.
>
> Fixes: aeb33699fc2c ("drm: Introduce the DP AUX bus")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> None of these seem critical, so my plan is to land this in
> drm-misc-next and not drm-misc-fixes. This will avoid merge conflicts
> with future patches.
>
> Changes in v3:
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
>
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index dccf3e2ea323..552f949cff59 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -66,7 +66,6 @@ static int dp_aux_ep_probe(struct device *dev)
>   * @dev: The device to remove.
>   *
>   * Calls through to the endpoint driver remove.
> - *
>   */
>  static void dp_aux_ep_remove(struct device *dev)
>  {
> @@ -120,8 +119,6 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
>  /**
>   * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
>   * @dev: The device to free.
> - *
> - * Return: 0 if no error or negative error code.
>   */
>  static void dp_aux_ep_dev_release(struct device *dev)
>  {
> @@ -256,6 +253,7 @@ int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
>
>  static void of_dp_aux_depopulate_ep_devices_void(void *data)
>  {
> --
> 2.36.0.550.gb090851708-goog
>


-- 
With best wishes
Dmitry
