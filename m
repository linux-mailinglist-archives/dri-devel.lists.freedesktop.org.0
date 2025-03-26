Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDBEA717CD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D003610E0BC;
	Wed, 26 Mar 2025 13:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CE810E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:52:27 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-86fea8329cdso1439482241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 06:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742997146; x=1743601946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pcKm5/tXdE/0WU8n3kR6lQGyuHWkdDdazDILzFNqfS0=;
 b=D95FMyQ0NL+M+qi7GW9ObexkRWYrALEHQ0Crg5J6CimriH7FjZaVAlCsfbnH7oN0TM
 oxLr8Q2BQe7f5+KYyTq0/cq1gn/3zez/OBPgkBx0P3rBy/hYIBfKb7jaNenCv5MmUn6s
 XrL87yIiNW1ruYJsiylWw224O6npNneO1yyI86TX8kD21agxM2P/XMt3PFVFrKARqOVd
 RbPUpBXhfXZMPsXel/OnjzDlgGscQPUZRUQQujm8nSg9872mUyE2ugqM0emeVCjK7+4Z
 guL+VlSeEOVfCe5qqpyaMMd2zwSzCKMRkotDQqVR02F+yGbcc8QY1J0MrZ8o62Zbqq/6
 Kz5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnzjg4Lv1mDYOrYC6iRxx0WPx/w2PVFBzmW3Gd6+WaXrK3Kt2fJCSZ50vdx4GPg4dKqP6E7k2P2OI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdC9jdPc1RZOwl2xL8qvZTDQy9c5l96jmHV6dB+awuqsSWY0cs
 Z7jZ2K8TRt1Jc10AyL4jk5rubWKcs/N49gqoCekSEXgZtQowKikdD0cQiuTG+lg=
X-Gm-Gg: ASbGncvquoOL9XymCjVhDWUYbswp4YWAJzY3bD3Ri4ctQklrlFJ6lnLJac+um8lAxr2
 o7MadpyTdd76CPpIJKa+EJCmdJz/q0tkVq/1qpkCcNSyhQvQrjfW94T+3zneFuJUp+dmjzOPv0J
 s4aCFDzJkZIMsgVOfpxyK+5Vr4GWUQRbzxb9QnJSAAQAu7wd42NguqpObBveh1FTApblsYLYoBH
 RrFzEkdEtf3ynsfecDrjrov24KA6MQegTLoFRRuf7rTGuRS1Y78yNu6BNAnnwEw6y7XJzVqLx6B
 ZSHMB08FikeQzTWW1AsuZTs8+l6+0s97HwMi8QK2k2yWoJ8ym0zRcDTOyHQAFTBMBwk7dDntRKK
 HmKJtoYU=
X-Google-Smtp-Source: AGHT+IG7bc5KiR61A06/qU3QkOqGOvZFwfd/8cpRe1Usm+58lPHHb8pkwFDAB2IQ2/acD/cmHgLVXg==
X-Received: by 2002:a05:6102:15a9:b0:4bb:e14a:9451 with SMTP id
 ada2fe7eead31-4c50d5e3701mr15867720137.20.1742997145470; 
 Wed, 26 Mar 2025 06:52:25 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4c50bd75e84sm2376787137.20.2025.03.26.06.52.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:52:25 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-86b9b1def28so6387728241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 06:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjoMWBf1+Pxpg/j9ZiWSFHAFQdl5gM35vOkTCTY0nKNkW5+o7PpimHWZK9DcXlNory2q51OhzDapI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3590:b0:4c3:2803:61c1 with SMTP id
 ada2fe7eead31-4c50d5e36edmr14466273137.18.1742997144422; Wed, 26 Mar 2025
 06:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Mar 2025 14:52:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
X-Gm-Features: AQ5f1JovrLSxq6Q_jny8lkH2G_0PglV4cgpMVVF5cOjinLTQjx6uJi6K2dpIvwc
Message-ID: <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi Tomi,

On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add greyscale Y8 format.
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for your patch!

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -405,6 +405,9 @@ extern "C" {
>  #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>
> +/* Greyscale formats */
> +
> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */

This format differs from e.g. DRM_FORMAT_R8, which encodes
the number of bits in the FOURCC format. What do you envision
for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
