Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6FCF8DAA
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 15:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AAB10E50B;
	Tue,  6 Jan 2026 14:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1888B10E0DA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 14:48:04 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5e55bd6f5bbso608166137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767710883; x=1768315683;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJJUInj/XbYBOmFssNzAphx4WQGD5E9g7yIXL8sfIgU=;
 b=gaEWJpE/mQXrZssHzN5F/XzSZvx9EkR3N5R3fwBfRUh0KPEiDgEKbMyWhGrIO8je6O
 9z87yiVuemmlXI4cjcaEV5tNrfzvehhKncFp7uyj/LYpDmwE5vEFGN3TXrypCRiqpKqs
 TzWo6sSV5YzM4ni2kKFRs9CVErJOswovH9oZHj6cKNDvh/s7SOYEMlhoANP4lZ0BYFwR
 ghQPPnzQ1iktUbWL4Mi3FJ8Lv5YWggsY7D1a6ybZVBSbrjQYVL5BfMah1nKqQl9QWL9I
 zKD8Mw/9rJXHleO5xP3C1D6Fe/YIM67B1Cx8bQkl6ZGaXAokQ+9qL7KNA86aNdeioUzw
 VcvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4jgDPUCu4NdUCj+0nhEPIdU0BjXmUZqYX5+6jmfvJi5mz6CqKq470upJUHAef9d3Qxn2VUdxBchM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbSUq+eZwnowD0AePszOWXB5ubTkSWo7urvtpyhwKYvodf6r7f
 gJke1ySnZ9rSYvieJRBLTFLcbuQ7Ni2swylDlNa98vUyFizBKYImqNzMtopQlf8P
X-Gm-Gg: AY/fxX4ptk+Oj1K0YSRiHIeO5/5Xpgq3fwveaYCKV9cP0ePFmjoo0KKz+jb/YTEIKnt
 ufsgjgtftyr5pUhtP7K+EyBpKalPeeyP9B/6PfCNC3STdpuXSXPIdgv6bw5JtU6vHNkxEtO7Fv8
 fr6mG+/yLpU3YDDeO4u7uz+Iu/bRdiKruyUGlCaIQPTMTloRfwzjzTohKuEQb1SP7XpN1cHW3wD
 btYRCcoDqMOEZ4HYAVcb2bAZ3com64I4ruSG+fMGqTZklBQ6DxQxcRpPxL4w8Jfr+VbglezMylX
 nB2YXYwQW3ivMaJfomPMkMOEWJ/FmM7OA2qgSxL+0R9dOBq2TBPi/luITYLyMxip/2u+nFWZovo
 eNVhYbzJJOG2mcYy5ltMNYVPzGjPN516Sf7YjKfkv9s7CrpW+0vgVjFsHWDkD6reLCOhO8xY7VA
 tIU0xr3SqvfoqcNXJs9HgXax2I7x+ls7SAIy7DSSTt0rLddtM7
X-Google-Smtp-Source: AGHT+IFsbYWhThknqOagUq+qgyoSabU/BMWkC8qRIEY5IIDwOpCkmgwnHrh+kiZAJEPaPT48kBI16A==
X-Received: by 2002:a05:6102:4247:b0:5db:d7a5:ba1d with SMTP id
 ada2fe7eead31-5ec7436e432mr996221137.16.1767710882362; 
 Tue, 06 Jan 2026 06:48:02 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77004098sm667318137.1.2026.01.06.06.48.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 06:48:02 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-5e55bd6f5bbso608139137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 06:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsIO+Vg++DZOVH6ZG0n4tSwdVBQD4KnHSS4ms+WTpMbSsxvNkgUdBOf8R2CB0gw9k/IZ4/VsRSURI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1623:b0:5df:bddd:b590 with SMTP id
 ada2fe7eead31-5ec7451df5fmr1123054137.34.1767710880890; Tue, 06 Jan 2026
 06:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
In-Reply-To: <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 15:47:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
X-Gm-Features: AQt7F2qsB5hg2NX_ZI18pHFrsB3JeydqfV6kNAMxXv_CqeMBbwVEPLSuyAomQME
Message-ID: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org
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

Hi Franceso,

On Tue, 6 Jan 2026 at 15:26, Francesco Valla <francesco@valla.it> wrote:
> Add a DRM client that draws a simple splash, with possibility to show:
>
>   - a colored background;
>   - a static BMP image (loaded as firmware);
>   - the logo provided by EFI BGRT.
>
> The client is not meant to replace a full-featured bootsplash, but
> rather to remove some complexity (and hopefully boot time) on small
> embedded platforms or on systems with a limited scope (e.g: recovery
> or manufacturing images).
>
> The background color can be set either at build time from a dedicated
> config option or at runtime through the drm_client_lib.splash_color
> command line parameter. Any color in RGB888 format can be used.
>
> If enabled, the static BMP image is loaded using the kernel firmware
> infrastructure; a valid BMP image with 24bpp color and no compression
> is expected. The name of the image can be set through the
> drm_client_lib.splash_bmp kernel command line parameter, with the
> default being 'drm_splash.bmp'.
>
> Just like the existing DRM clients, the splash can be enabled from the
> kernel command line using drm_client_lib.active=splash.
>
> Signed-off-by: Francesco Valla <francesco@valla.it>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/clients/drm_splash.c

> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)

There is no need to protect this block with #if, as it does not generate
any code.

> +#define BMP_FILE_MAGIC_ID 0x4d42
> +
> +/* BMP header structures copied from drivers/video/fbdev/efifb.c */
> +struct bmp_file_header {
> +       u16 id;
> +       u32 file_size;
> +       u32 reserved;
> +       u32 bitmap_offset;
> +} __packed;
> +
> +struct bmp_dib_header {
> +       u32 dib_header_size;
> +       s32 width;
> +       s32 height;
> +       u16 planes;
> +       u16 bpp;
> +       u32 compression;
> +       u32 bitmap_size;
> +       u32 horz_resolution;
> +       u32 vert_resolution;
> +       u32 colors_used;
> +       u32 colors_important;
> +} __packed;
> +#endif // CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT

As per [1], all these values are little-endian.  Hence they should
be declared as such using le16 or le32, and accessed using
get_unalined_le{16,32}().

[1] https://en.wikipedia.org/wiki/BMP_file_format#File_structure

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
