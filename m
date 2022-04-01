Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29724EEA67
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 11:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCA410E34D;
	Fri,  1 Apr 2022 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D2410E34D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 09:28:31 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id w7so2090433pfu.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8RKpTKiU1sA+7C2AXK6LSzJS1T3BxhshmU+w3cvHKQE=;
 b=hbGgPbq6pQGw/A55t8ZmzRWISJG+M6aJtIcqQtKX5min6lmTgeuXmjBJeqe9nF+MEe
 h7ItB0pjbqm/2Pa6/vx2ng7HguhrxxwdVqa/GLFFWZzwSWKP/KzfL5nIFqWBXXPP2qOq
 430aI6WerwZw7bEE3lBbQF5gQrnlzS/iGSnXcT4qE04dvslp1d3fAQ30vKWQ58r4EVm7
 BnzU5/b2L7nBnkG59Iv7scs7dsfqZGvVWGr3tNJoqKHWjj5SMKwA5DHMpyTFo92pcWHw
 t8G5QzTZSvYl5GjxTQ6WeodkZbfbvit+lui3HXSFbD1g7WPKkHqgnl2sgrbpvWHGzWZz
 txGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8RKpTKiU1sA+7C2AXK6LSzJS1T3BxhshmU+w3cvHKQE=;
 b=sTP1KxMe3MVann5872aGiQafGhhrdal01Xpgeoht19mP93Oj1PzgWFLiVJCGyi3TkD
 0oiPt7QoPT+VAT33E7Df6ksdyPzbYMkbt4yy/34mGBT0SAfDdmiqiuHkTEgDyGUaE2FL
 m9kCy7CiXVDvDqgjRxSvJjP23xUDr21EYxuUcqFci15GMOjvgRQDzPWl6Yzi+C1iocri
 4xys0yB34mg9INyoWRA/GHNOTMzX9Op/g/aU7u89xatKbcV5x5yN6Gy1dX6QTshQfCzW
 jorKrOMy+cpsJvVnfNH3XkEAWnMLu16B68arvXOTGHFXIZ8SrtJzBL6p0JIXpcueSUzO
 mI8w==
X-Gm-Message-State: AOAM530arYUoA+ILGf3b/U7Aapo+VCff/KVqvB6rMYPAZTa/Bi1929Su
 s7oHIhC59GwpL4nDl7QIZ4tGZ1IG2qP5lkytHTo=
X-Google-Smtp-Source: ABdhPJyHPYoEK2lUGZ2g9xEATWdlsalFZ6pHObcpGc3pFWALJ9ZXzC91NvqVV80Rlfcz4xqlRvdwzmoB+xhHjMov5WE=
X-Received: by 2002:a05:6a00:c85:b0:4fa:f806:10f5 with SMTP id
 a5-20020a056a000c8500b004faf80610f5mr9890996pfv.43.1648805311158; Fri, 01 Apr
 2022 02:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
 <20220330120246.25580-3-xiam0nd.tong@gmail.com>
In-Reply-To: <20220330120246.25580-3-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 1 Apr 2022 11:28:19 +0200
Message-ID: <CAMeQTsbZ4u=3pzu5p-4tt+kAiwmL2m+ZrCfzzv1vCMFeDAbDhQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] gma500: fix a missing break in cdv_intel_crtc_mode_set
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
> could lead to a invalid reference to 'ddi_select' after the loop, and
> could lead to multiple 'is_*' flags being set with true mistakely, too.
>
> The invalid reference to 'ddi_select' is here:
>         cdv_dpll_set_clock_cdv(dev, crtc, &clock, is_lvds, ddi_select);
>
> To fix this, when found the entry, add a break after the switch statement.
>
> Fixes: d66760962d75 ("gma500: Program the DPLL lane based on the selected digitial port")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Hi, this one is also already fixed in:

commit b1a7d0ddb169774c3db5afe9e64124daea7fdd9f
Author: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Tue Mar 22 14:17:38 2022 +0100

    drm/gma500: Make use of the drm connector iterator

> ---
>  drivers/gpu/drm/gma500/cdv_intel_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
> index 94ebc48a4349..3e93019b17cb 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> @@ -616,6 +616,8 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
>                         DRM_ERROR("invalid output type.\n");
>                         return 0;
>                 }
> +
> +               break;
>         }
>
>         if (dev_priv->dplla_96mhz)
> --
> 2.17.1
>
