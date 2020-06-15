Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587131FA2EA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049A46E513;
	Mon, 15 Jun 2020 21:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E9C6E513;
 Mon, 15 Jun 2020 21:35:32 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id v6so6191564uam.10;
 Mon, 15 Jun 2020 14:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QwVVY3tdJKh9dRxGnHRaOKopt/UtRa3GpwxCJ/Y+F0=;
 b=k6/CpZEruyooMN64TIe/UJmnFxw/yHrAjJKHYcUN+/cpmQGNZ6IkYYo94InyjN1OaD
 Q96ix8oRUrursor+4/j6odK3XkIXlY9UO9TjCCMNg6EBfHITEOOJaRogw+ipR1AmbfZD
 eg4hnpIxeRakqtYn4rUOyqw67+ujDJZxgeNcOHtAE3WOyNvlWyMAzpG9mBeVmmIdSlZO
 AC37U1SW26OIX06/HFJtMxsT7rSd24mT6DPWQZSeqEq/OtOFxEVbh/0D/HjP8h58Rbx6
 zdRI8xTs/UD0mfAnwSGNg6SeN4GTkfz6QcDzCbmZGQ5J2hek7cZXFl8qPiPorEZ0B81T
 P/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QwVVY3tdJKh9dRxGnHRaOKopt/UtRa3GpwxCJ/Y+F0=;
 b=cjKgR6EUk773eC5Ciiypl2gED3NT6kv3UaIXDhRDLy6YYrWTAb7j0bs0UFCfVeM6H1
 wPs+oJniwVPgM856Te/PkCzx0kqQqOFaBPQNJYJw48ixMdNKIvFpmgw8dIp19cVr9FpE
 DjCPX6kMlm9Ba/N5xAgPVvJc6GHzxGWoi047emIVHlbCtYSUdTNL5wr75856oTAUIfax
 ME/qmfa+p/uxjCmNO3VmfG6znQRxEjPg4uUNjnPDmImVcKVmJGBxV6EL+UY8MEgI+mEo
 SI2+UNzV3aQ2pe1XZ8xrY8h8vprWOJ037+GVBZOP+o1HRFhgKYX+ca7A4KJ+Uak5W1UH
 2jSQ==
X-Gm-Message-State: AOAM53204Hpqo6YXbRNtUVpL7z8+UQeLv9JMRiJ6+2nMDgvmCIHVU3YH
 K6ch9zQeZ9IqPdgTFpvwKDs2NAoyjILqHNLLf9Td2g==
X-Google-Smtp-Source: ABdhPJwT5jYc/IIYrGzUDVmiMlPc57eJBM1NXCklPo9e+Vvncdu/UdFDse9TC2bOP3FbgnecAO9Ttn7g8gaEE87A/fI=
X-Received: by 2002:ab0:2758:: with SMTP id c24mr20774112uap.64.1592256931213; 
 Mon, 15 Jun 2020 14:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 22:31:50 +0100
Message-ID: <CACvgo51AVVOxhGK2Uin=ZLgPpihJiEsnc6pvAyKqFKPvLdOzLA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/mipi-dbi: Remove ->enabled
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Fri, 12 Jun 2020 at 17:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> The atomic helpers try really hard to not lose track of things,
> duplicating enabled tracking in the driver is at best confusing.
> Double-enabling or disabling is a bug in atomic helpers.
>
> In the fb_dirty function we can just assume that the fb always exists,
> simple display pipe helpers guarantee that the crtc is only enabled
> together with the output, so we always have a primary plane around.
>
> Now in the update function we need to be a notch more careful, since
> that can also get called when the crtc is off. And we don't want to
> upload frames when that's the case, so filter that out too.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Lechner <david@lechnology.com>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 16 ++++++----------
>  drivers/gpu/drm/tiny/ili9225.c | 12 +++---------
>  drivers/gpu/drm/tiny/st7586.c  | 11 +++--------
>  include/drm/drm_mipi_dbi.h     |  5 -----
>  4 files changed, 12 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index fd8d672972a9..79532b9a324a 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -268,7 +268,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
>         bool full;
>         void *tr;
>
> -       if (!dbidev->enabled)
> +       if (WARN_ON(!fb))
>                 return;
>
AFAICT no other driver has such WARN_ON. Let's drop that - it is
pretty confusing and misleading as-is.

With that, patches 7/8 and 8/8 are:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
