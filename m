Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3994EAA99
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 11:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADD910E812;
	Tue, 29 Mar 2022 09:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C2510E813
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:36:27 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso2213401pjh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFEP+4MzWHajoB14yHUulSCyNblEw9o47q75qU5Tdek=;
 b=jbxChcH6l4E4+rE6SOYlHXS9Cprn1w9u+jMBk/N41JCaLIqM5klcHOBtUvIqHVkR/B
 IYTdf7iBrN+c3otifH3LJQMVngaRFUJyn+r3jjbj3QRTt8hhI1tzdp5J9cuF7H8U0JaE
 dO473oyPRq1h2XJevGdUsh4jMZ0WbWxdj0vVwjotTB/YmwNED6h0AmBkILACSj3dPtUD
 SUgraLli5FAw/AuvntHGDFHtXr249U1JgrM+8GfdhR1Q1AU6k2vUIt6szpZhJDahs9z4
 IFlFLg1jMTysTsEv469yZ44A1Nx2y8ZwGMFFFTvigku45af374VcpCEJ+Yu2bx3Y7eCa
 +Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFEP+4MzWHajoB14yHUulSCyNblEw9o47q75qU5Tdek=;
 b=G+lDmNvktd0lAOOmw45+beu3zDDfBekbWEl9f4VPD+UP4yLCXctS7CAssgeUUE9JpE
 ti+DdrKqy05FFAumhUQTGHVhyw22HVVaph2z8xHzzdUUAPrL6Y8wWAFpCMTz8/I8v4BB
 aUIbfT0Zsvfr3MSys+OFLX38mRl2BFfj+GMuCbIbHk6Frz5M8kUYdoR59FKMJoqOTd5K
 1TQ8fVqUOEXgH6rlvjDSEzKt5ilqhw37LaR7XLHSglNs7UaaHDeooIHEiLeiTZsmN8q5
 bbNsRDFAc8KpKsyRXr13GYS8QF9asC3uHEb4S4CmnH7Ch0hzwjyl0kSpfoHP0cNIgymV
 OgKQ==
X-Gm-Message-State: AOAM5328uHIfhtq7Iv1GjZ9lH8/WgVbJB/3gmWCRt9VaLBsNl+JYsGuT
 KPO/o8U0jUAcOzwid8BlWbm5P/6bPISOsnEH6Yc=
X-Google-Smtp-Source: ABdhPJyiiZjRrT2knI3JEfT8yuNbK5HSyhUBWSoBfyY6qYaKeeIQnfmm7TN4ToPJZQ830POk1h/Ri8E7uK+43J86QB8=
X-Received: by 2002:a17:90b:3850:b0:1c6:572e:f39a with SMTP id
 nl16-20020a17090b385000b001c6572ef39amr3630800pjb.233.1648546586563; Tue, 29
 Mar 2022 02:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220327052028.2013-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220327052028.2013-1-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 29 Mar 2022 11:36:15 +0200
Message-ID: <CAMeQTsboqXW-UeL9+E0vztTg_08w3WxvNhx-HqOdNc9yYJ4V+w@mail.gmail.com>
Subject: Re: [PATCH] gma500: fix an incorrect NULL check on list iterator
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 27, 2022 at 7:20 AM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> The bug is here:
>         return crtc;
>
> The list iterator value 'crtc' will *always* be set and non-NULL by
> list_for_each_entry(), so it is incorrect to assume that the iterator
> value will be NULL if the list is empty or no element is found.
>
> To fix the bug, return 'crtc' when found, otherwise return NULL.
>
> Cc: stable@vger.kernel.org
> fixes: 89c78134cc54d ("gma500: Add Poulsbo support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Thanks for the patch

Applied to drm-misc-next

-Patrik

> ---
>  drivers/gpu/drm/gma500/psb_intel_display.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> index d5f95212934e..42d1a733e124 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -535,14 +535,15 @@ void psb_intel_crtc_init(struct drm_device *dev, int pipe,
>
>  struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev, int pipe)
>  {
> -       struct drm_crtc *crtc = NULL;
> +       struct drm_crtc *crtc;
>
>         list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>                 struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
> +
>                 if (gma_crtc->pipe == pipe)
> -                       break;
> +                       return crtc;
>         }
> -       return crtc;
> +       return NULL;
>  }
>
>  int gma_connector_clones(struct drm_device *dev, int type_mask)
> --
> 2.17.1
>
