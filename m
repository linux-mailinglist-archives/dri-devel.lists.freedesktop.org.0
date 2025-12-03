Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567DC9E753
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD7F10E11F;
	Wed,  3 Dec 2025 09:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SL7hIz6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7559410E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:25:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 48DFC4405F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A77DC116B1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764753901;
 bh=5cQoZpxXJzGLGcDuGVHuzwpNUqJ1VJI8wGDmQJMjGLI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SL7hIz6UipAnpMLsmTBfauhq3ESkZYG+TAd3NSg6QWzpKaDv17JCWRaEJHBNvMUSD
 4zC3BZCvp0DN72cM8I7PkTsJUKIBcyfkVqlLjTzdf8WGJFsxbUNPKcIFRlWcFIPX9v
 bKXBD1i8E3O013+lXOoaVIxyItFs/BHoMv4AsQhwZjhxUKXtfVPySlU81SAJ2dNT4C
 qzdPaDP0oxy6melPZA1M6SClJF9anpiMb414dU1SzmhGXU+5fbqPcrjJU3NK0m0eBC
 2k1lFeRQGgmG/K/FpsZZyouuuUoP7F49ogD1sCkGM4wtyai8dmcbvpU544r5xuyTU8
 3UdMp0LWugyPA==
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59445ee9738so5244871e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 01:25:01 -0800 (PST)
X-Gm-Message-State: AOJu0YzS8/01upVWqG6G2fSfFMVij64uOoc7BLo9T/VZgdzayoj3gB4+
 eIboouZwCfqsyOAPV7g8EzYzy+lrunAG9lDYWSRFGV6O8JMXZ6su7zGoY+dp1h9TZahhWCI6KNR
 N0nprwURC60Hezs0Na/mNctFebswd8P8=
X-Google-Smtp-Source: AGHT+IFUbFPZkRMHj2S1PXyiHO3cOXOvhIvDv5bYE0J9aAY+JiOdXG5FhZFjbaahnOKR7FFqFseH404EH0QCN7gWjV0=
X-Received: by 2002:a05:6512:3056:b0:594:55a3:c191 with SMTP id
 2adb3069b0e04-597d3f234d8mr656196e87.14.1764753899534; Wed, 03 Dec 2025
 01:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
 <20251203090706.53778-5-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251203090706.53778-5-tvrtko.ursulin@igalia.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Dec 2025 10:24:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHKAo-kspA73DPYMhrDtqFAQNMVCqRa4nbEGzrf_WBR2g@mail.gmail.com>
X-Gm-Features: AWmQ_bkpPZGAIs3QlRVhpm1kUYO97u4UYkzmVKBIAJTGNV3gFzrV0rAmH2swZ4c
Message-ID: <CAMj1kXHKAo-kspA73DPYMhrDtqFAQNMVCqRa4nbEGzrf_WBR2g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on
 Valve Steam Deck
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 linux-efi@vger.kernel.org
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

On Wed, 3 Dec 2025 at 10:07, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>
> Valve Steam Deck has a 800x1280 portrait screen installed in a landscape
> orientation. The firmware offers a software rotated 1280x800 mode which
> GRUB can be made to switch to when displaying a boot menu. If this mode
> was selected frame buffer drivers will see this fake mode and fbcon
> rendering will be corrupted.
>
> Lets therefore add a selective quirk inside the current "swap with and
> height" handling, which will detect this exact mode and fix it up back to
> the native one.
>
> This will allow the DRM based frame buffer drivers to detect the correct
> mode and, apply the existing panel orientation quirk, and render the
> console in landscape mode with no corruption.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: linux-efi@vger.kernel.org
> ---
>  drivers/firmware/efi/sysfb_efi.c | 56 +++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 5 deletions(-)
>

Thanks for respinning this. But seeing the result, I think we can
simplify this substantially by using two separate callbacks for the
two cases.

> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index eacf9a50eab2..566492e67798 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -231,16 +231,42 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
>         {},
>  };
>
> +struct efifb_mode_fixup {
> +       unsigned int width;
> +       unsigned int height;
> +       unsigned int linelength;
> +};
> +
>  static int __init efifb_swap_width_height(const struct dmi_system_id *id)
>  {

Leave this one alone, and add

static int __init efifb_check_and_swap_width_height(const struct
dmi_system_id *id)
{
        const struct efifb_mode_fixup *data = id->driver_data;

        if (data->width == screen_info.lfb_width &&
            data->height == screen_info.lfb_height) {
                swap(screen_info.lfb_width, screen_info.lfb_height);
                screen_info.lfb_linelength = data->linelength;
                screen_info.lfb_size = data->linelength * data->width;
        }
        return 1;
}

Note that we should always return 1 here, given that there is no point
in trying other matches, even if the width/height check fails.

And please make efifb_steamdeck_mode_fixup __initconst as well
