Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C974186F478
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 11:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E584A10F97B;
	Sun,  3 Mar 2024 10:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UFyFfzd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5184810EC4B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:39:28 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60925c4235eso19436567b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 01:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1709285967; x=1709890767;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T4FReK8go5B+QNMImpm5GNB78mbfotA8iWW7uG0MwSU=;
 b=UFyFfzd8v54lsVwdyyQijTJrHi+WV/7tYkmdjtzgPd2Dv8Q/ucS6G/AtZwTz3nfLps
 YRP9L4VBGlPidBj7KU4wvJJRISfdMCRPktbLNTXv5Et4hqgTyHrOQhVJHVyc1gG6MCS/
 +9Ji5whjZGlIpfIRgJ7GvM4ZKaL2LcJMpw3XCq4YxSNFsGKEzhcimPXh1cqBrp+n3RVt
 qGb2iRmZbeuXCw4ozMV30647o1qo5wLDwNthK+KiENio6Xh1G4LFXQiI255FkarYAgJA
 /QRhSkOmsNMtIQz0f9BuhLE/6O5q1diU6j+2jT22B5e/Om9FQpjKM53lkc75Qx1sxSpI
 GNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709285967; x=1709890767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4FReK8go5B+QNMImpm5GNB78mbfotA8iWW7uG0MwSU=;
 b=vvuHDg2elKA9wkmVmprsfE+4P6JsTdF8X5Wsyx5gWoF4NBUFJflNhNYceJHL5sof4v
 rBZEOBxcyoLcoOrmVG4yQkbEzbUO9Rqu1Juti+i/11UsBC/LDkNNCJj/IJ8atBI/lDlP
 aG21DL1zgM5V1ukpNhgp/KQ9KeZKz7csDQ5kHO7BjyRJz3Xw1g24ZFCuQvZTAe3nw/1t
 WAFd36fzPG4GeGV9yuVkInUqEj4Jc+dkTbSfD15RrapBujp3CZDj2Zknws69FCEMqgrj
 /WpA43AzA0uruVdBGh/NkIwCXoW9tDnFGf+2LzKOgxWQffhjXoRuxCvbYTOwESwFJXur
 331w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXrGWz9XOuKsOEfrqzlHupEkFNn3XbyL3YrBSjGsEittFp13h4bC2j26Vqen1vvuRoYVtwsm7TZKAoFVT6Gi6sJBadTRlENDzR7qoGeYFo
X-Gm-Message-State: AOJu0Yzl292A290QVuv6uwccnfXb8Xwpg4Yfb2fUAMmeKLt6M+1M5OHD
 cEoaWZEye7HrRIq5N/U/ZlBNv3L3aPo8mfGba9+MCiLdiWWdy2hKbr4LevufZCTh6ERWuBMscvT
 TsijMUoTkoyAVxus70Q0s5OJEuYZGTJW0WCuJ7w==
X-Google-Smtp-Source: AGHT+IHBJlVslNQf72z5nYstBMHq1r6NEyZlI3Q+57WJ6N+cTDUWeKdD7ZbOQA3tq8oZz2pmh/Zc/ze9767bOaC8j2U=
X-Received: by 2002:a81:4c44:0:b0:607:cb4e:eb41 with SMTP id
 z65-20020a814c44000000b00607cb4eeb41mr1042777ywa.35.1709285967144; Fri, 01
 Mar 2024 01:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 1 Mar 2024 09:38:51 +0000
Message-ID: <CAEmqJPpKWsRr=qZS=V8YQPHPye7BQZuG2BWO96qvRxqVO3+mXw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 03 Mar 2024 10:45:57 +0000
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

Hi Jacopo,

Thank you for this patch.

On Mon, 26 Feb 2024 at 13:26, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Add FourCC definitions for the 48-bit RGB/BGR formats to the
> DRM/KMS uapi.
>
> The format will be used by the Raspberry Pi PiSP Back End,
> supported by a V4L2 driver in kernel space and by libcamera in
> userspace, which uses the DRM FourCC identifiers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

All the fields look reasonable to me, so:

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
>  include/uapi/drm/drm_fourcc.h | 4 ++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 193cf8ed7912..908f20b96fd5 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -210,6 +210,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
>                 { .format = DRM_FORMAT_ABGR2101010,     .depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_RGBA1010102,     .depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_BGRA1010102,     .depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> +               { .format = DRM_FORMAT_RGB161616,       .depth = 0,
> +                 .num_planes = 1, .char_per_block = { 6, 0, 0 },
> +                 .block_w = { 1, 0, 0 }, .block_h = { 1, 0, 0 },
> +                 .hsub = 1, .vsub = 1, .has_alpha = false },
> +               { .format = DRM_FORMAT_BGR161616,       .depth = 0,
> +                 .num_planes = 1, .char_per_block = { 6, 0, 0 },
> +                 .block_w = { 1, 0, 0 }, .block_h = { 1, 0, 0 },
> +                 .hsub = 1, .vsub = 1, .has_alpha = false },
>                 { .format = DRM_FORMAT_ARGB8888,        .depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_ABGR8888,        .depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>                 { .format = DRM_FORMAT_RGBA8888,        .depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 84d502e42961..00db00083175 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -210,6 +210,10 @@ extern "C" {
>  #define DRM_FORMAT_RGBA1010102 fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
>  #define DRM_FORMAT_BGRA1010102 fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
>
> +/* 48 bpp RGB */
> +#define DRM_FORMAT_RGB161616 fourcc_code('R', 'G', '4', '8') /* [47:0] R:G:B 16:16:16 little endian */
> +#define DRM_FORMAT_BGR161616 fourcc_code('B', 'G', '4', '8') /* [47:0] B:G:R 16:16:16 little endian */
> +
>  /* 64 bpp RGB */
>  #define DRM_FORMAT_XRGB16161616        fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
>  #define DRM_FORMAT_XBGR16161616        fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
> --
> 2.43.0
>
