Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516144EEABF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 11:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E90110E2B2;
	Fri,  1 Apr 2022 09:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4710E2B2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 09:53:51 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id h19so2202002pfv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXRCPy6kZ1U55kW3/L29N2LaMZY83OqdS8sA1Zw35oA=;
 b=Iy5jo3ds2czZEHQCq5QfZphcqniK1eyOtLJ/HVzCsYUvuXTgVn1h58NLWofu4vwJS6
 DNZU83riPfc9OEjqmyhHk9YXaIiwMSU0YAkOZfy/p9FSZURuX59f+LjHYliW/Kwo7DIy
 1fI0htzBSYNVClUMdG5oeO3V/5t0o8IOuDY0inB72uCtv/T4VUedHmZkeRznocXc8Xo8
 Oil9pzaIdp+FUpJGfZoOMuRDFaPhxlClS6RYKbV+WxaAdouJsJSjr33tMYP1r89oLXAw
 uISnW6F2O58NMaBwKVCXXQoyiBrrNlZjYto1XEbi8fJwKW0mLT285VaSiNdg6Ti6EAr5
 R4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXRCPy6kZ1U55kW3/L29N2LaMZY83OqdS8sA1Zw35oA=;
 b=l2+GOIZsctlQ+CKMriUnlNOKE96XYsM00V9NeLStJL5ukbFhMQk7TDiKv2F60E+bmH
 XsL7Eyip6xzO11tLN+M02H74sM7qwP0bODVKXbiAS05ZkVGSvulsQ8YRdTCLlgLGm/PV
 EPablRQ2Em+eS4Arhetc8/FPlbGeicztXsa0EvM+6bn5sdhg9S66dMXwhyk8zZiq90g4
 9cWFTjjfR8IVuQKHwdo/ZPOXJ8gDGFnreopk8cUHGzUkhHUzutzxdUWT0zVxGwsaZ0Rh
 EgM+ZXp0n/zG57ghxk+uc7Pl95ka2ZjNIsMD0KEqdWh0MTd2tCSMqmC2HLsTVZAMTdJE
 uVfw==
X-Gm-Message-State: AOAM5334B+N2X6kgBhEijJAaKuhKTyo9OrdgZuyCHhTkllWTzKaGiLk8
 LSYEiAtMeszEnrubK5YWC0HtVViOD/YZbtDeUc0=
X-Google-Smtp-Source: ABdhPJz8u3z3XfeUwNuVJQKS77kFNu8ObLRgS9bK4lFm7SIkzHMzygA/3PYqdU/R7H4SaHBcuvQlwFyGzFe4NP5LPwY=
X-Received: by 2002:a63:e20:0:b0:385:fe08:52f9 with SMTP id
 d32-20020a630e20000000b00385fe0852f9mr14458684pgl.99.1648806831267; Fri, 01
 Apr 2022 02:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
 <20220330120246.25580-4-xiam0nd.tong@gmail.com>
In-Reply-To: <20220330120246.25580-4-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 1 Apr 2022 11:53:40 +0200
Message-ID: <CAMeQTsZnNy2ToRNTBisxVwBnj8Hsdz7+zdgcW=yr8C=zbAJZhA@mail.gmail.com>
Subject: Re: [PATCH 3/5] gma500: fix a missing break in psb_intel_crtc_mode_set
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Zhao Yakui <yakui.zhao@intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 2:03 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. It
> could result in multiple 'is_*' flags being set with true mistakely.
>
> To fix this, when found the entry, add a break after the switch
> statement.
>
> Fixes: 89c78134cc54d (" gma500: Add Poulsbo support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

This patch doesn't apply for me and needs to be rebased on top of
drm-misc-next or drm-tip.

On Poulsbo there should only be one encoder per crtc so this is only a
theoretical issue. But it is good practice to exit the loop early if
we can so the patch still makes sense.

Also, please use the correct subject prefix: drm/gma500: instead of
just gma500:.

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/psb_intel_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> index 42d1a733e124..85fc61bf333a 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -134,6 +134,8 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
>                         is_tv = true;
>                         break;
>                 }
> +
> +               break;
>         }
>
>         refclk = 96000;
> --
> 2.17.1
>
