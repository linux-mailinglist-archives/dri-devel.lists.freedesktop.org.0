Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E4308990
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BF6EB4B;
	Fri, 29 Jan 2021 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779776EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:35:55 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u4so9166703ljh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NndlnaqBVSc/WIY+Wsn4yEeBCdXKrA9bnfrpnwxgao=;
 b=M/cHkKMpzoeCIjf+sfaMp83GKyvRnSwG/JXxnRRdVE6C8eoeK97ehy0WvvyTkeKcSB
 RQddgR+jRVkrsaJ/AwZEopa/IE2fXilupfCgDNnuTf0C/vVCpOobHfHbUcF27rDxrGjg
 zWoCD6AvkAmCxNaWU7tbIOIGzuPuz7O7g2jOEcL1r+xkKPmvjFZdr5CMCnnDZq+9bEUN
 J5ODGlCNf7GSMTm5Bh/GlUyu0W5MP4stdeZ1MXCWTjGlGojMvBj5M5z1lUU3KUqXAC70
 SZKkSqu6jmIoqe+IfnxXTbHG/DxQWW+CZPEkmRbYFfE9/JlB0R8v7BgUCxLmR/oEaphi
 q8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NndlnaqBVSc/WIY+Wsn4yEeBCdXKrA9bnfrpnwxgao=;
 b=gENHJ1fCexlaE0s6QTzHras25UGooi1g4aX6e34tXc4qvcyW3BgSiwk5rcp+a/dQqz
 /fGnFGcCdkenTLWjUc43s9gW9WTUZFrqFkmjaW1KUVbDvgNhFxZUDWWCOU9fOA2A8L2q
 jcALIlxZtfx1O6oJcyexpCAQdj/G1jEinIZq4R3yNTUI3NBd7Q7WZwt5OmWe1hvU8mid
 quo4jOyDODxv5MDYlUbngxsUslUQO/hdSjXLvi3Le2gVTVHW9huqOKFQJ/ejN/pD5mhK
 dbBeSqyFgBRUwaeC3wG9I980fAuVhahHywmABhNClXI20/IsQZ7qtOvDVVMB9dCVZviw
 9L6A==
X-Gm-Message-State: AOAM5335Wa7bQnHQ+ApkFZBId2I0Hxb0jsZhA6QD//SoXHMz5/s3iGPM
 Dnysz1vE26k3xh+3pQZtxJkrF9G0e7Yu2qqJlYo=
X-Google-Smtp-Source: ABdhPJzSK2c4aF5AKlmtDBqH6gdQQvVurq6eIIBJm26vhiqFg5wpONSLgTXDn+3EhThDfgml5aP60W4SUeojKeMGFd4=
X-Received: by 2002:a2e:3612:: with SMTP id d18mr2563111lja.211.1611930953854; 
 Fri, 29 Jan 2021 06:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-6-tzimmermann@suse.de>
In-Reply-To: <20210129095604.32423-6-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 15:35:42 +0100
Message-ID: <CAMeQTsa+csULd+eZ7uY398Z5avcxPHh==tWm_DtbkLY5EyL7Zg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/gma500: Remove dependency on TTM
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The gma500 driver does not use TTM.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index 02de5970d490..405f718b884c 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -3,7 +3,6 @@ config DRM_GMA500
>         tristate "Intel GMA500/3600/3650 KMS Framebuffer"
>         depends on DRM && PCI && X86 && MMU
>         select DRM_KMS_HELPER
> -       select DRM_TTM
>         # GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
>         select ACPI_VIDEO if ACPI
>         select BACKLIGHT_CLASS_DEVICE if ACPI
> --
> 2.30.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
