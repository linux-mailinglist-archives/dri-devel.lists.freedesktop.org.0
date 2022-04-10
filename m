Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228344FAFD3
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 21:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47210F820;
	Sun, 10 Apr 2022 19:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C0D10F820
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 19:36:47 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so16463471pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 12:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nB5ENHQGS8KY2/OLlsEuoI/3asQ07ZG7H3vfdY5dmNA=;
 b=FQLkBNozs4/zB3PtDYJb30oZtKsl2zh+p9OILgJ2EubuUROUfSmiFp9EPNuRbwpwam
 +goowpD2srssE5Epnz9YF++Vxk0xjTW7xXDVRmnHZx8Iyut21iKFG2+IMphe8ZavebMh
 RYsw2j0S7JRUeRNbZyGKcmn5tPJRTzH6wEjZ3qBIiGP4LFkqkXLyHYvmvAf3S/VlozLh
 433iP7S0Jccajby3WzPg/wfaQd36m2zqB1/0BRZd6J11Qw+L4vJuyREO62TsulcG+4U/
 DtuebXYMW6Z5LrvoRlOJbil2KudecOtRsCSobPPFBn7znfEXCotIqwUDCAYKRBU2sZ1e
 YfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nB5ENHQGS8KY2/OLlsEuoI/3asQ07ZG7H3vfdY5dmNA=;
 b=R08pwVSqGm7jsQoBJlRkwUoh42Qdi9/hZxmGGr3WGExhuxrDo1H7Qd/puNC3TwyuSL
 tn1yumJ0tnjOLXKRO5yJHefknCdqj06n6jty63hVwzOL/docgu8YVH2AtiY3qW6im19P
 h+Bc0edK7PrXPshzpzO15MugtXsUVWbUimydC2RVJkjdMn/BnbwFeONE3JXDdjUGVb+t
 rqFMGqK+B0TO6QuKnMU8xOgevn5srn4x9jlI4AfLVbv1ad4TtXQZQbPbRQr52HK0SD/2
 xGWc/P/e0D1YRH/ps/T33beijn8NR6cwxWhDNQ23UcpyyXDprYv/+wMBf4bFJwYbDCIN
 n04Q==
X-Gm-Message-State: AOAM532Yza4TmH+NnqHsZJnb+5HVgSHe7QzI5846gg3C/+uIASKhmWHy
 6NPex8bHjZvvyoCquzv+WQsaBmW8dYf6frfBpfk=
X-Google-Smtp-Source: ABdhPJwh9azmPl4AAFBOfdgkJtS0Fad5CegTaWOl1giYU+A+qcd1io8t9LpwO/NFebB14sNaJJOmEnkJxBYNkjmyu5E=
X-Received: by 2002:a17:902:eb81:b0:156:febe:7e74 with SMTP id
 q1-20020a170902eb8100b00156febe7e74mr19860231plg.6.1649619406921; Sun, 10 Apr
 2022 12:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
In-Reply-To: <20220409042321.3184493-1-james.hilliard1@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 10 Apr 2022 21:36:35 +0200
Message-ID: <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: James Hilliard <james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> Select the efi framebuffer if efi is enabled.
>
> This appears to be needed for video output to function correctly.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Hi James,
EFI_FB is its own driver and not needed by gma500 to drive its
hardware. What makes you think it's required?

-Patrik

> ---
> Changes v2 -> v3:
>   - select EFI_FB instead of depending on it
> Changes v1 -> v2:
>   - use depends instead of select
> ---
>  drivers/gpu/drm/gma500/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index 0cff20265f97..a422fa84d53b 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -2,11 +2,13 @@
>  config DRM_GMA500
>         tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
>         depends on DRM && PCI && X86 && MMU
> +       depends on FB
>         select DRM_KMS_HELPER
>         # GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
>         select ACPI_VIDEO if ACPI
>         select BACKLIGHT_CLASS_DEVICE if ACPI
>         select INPUT if ACPI
> +       select FB_EFI if EFI
>         help
>           Say yes for an experimental 2D KMS framebuffer driver for the
>           Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
> --
> 2.25.1
>
