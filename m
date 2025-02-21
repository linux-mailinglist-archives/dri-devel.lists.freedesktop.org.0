Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE2A3F11E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980AB10E224;
	Fri, 21 Feb 2025 09:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAA710E194;
 Fri, 21 Feb 2025 09:57:50 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4bd367926easo604227137.3; 
 Fri, 21 Feb 2025 01:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740131867; x=1740736667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VRmDUg88sJqiPwLbbhmS638djtZJpa1TX+xwhTJhivE=;
 b=kU956xlF2fPg1/NYUwK0RNylO+w8SiOvUIyeFK2f/K2EL8KDjjWH6v2cL0cPMkB1nd
 V1ePrB7dC8AkVRBBiEyJXhA6ru2czicRtPf3hjVQsFQ0Hmkf6HFKPMUjJEUg/2+1SpyQ
 54hSGVRSyXckBtCwQ2cqRGmctD7C1V/BjiAlubzAWpInDIUqfdjWKzeOqu/Jf6KHH1W8
 Oe+MvLLBBYFqEOdgZ0TN3lZpyTBhCt2cvxMrgLuWUAcYMCQjPm7CtFRv4gYKsINmoFvm
 wjZG5GHsUSa1yXp17fw1/NpJFgWOJeAn1fTzd6bZ8PbvBT6wLC3ZVgVHbfaVBmwnwj25
 UL5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNzHnwI+3xCz2ERhxMhz74m9VXHtfMernoxx60zN1JpkeE6h1sKNS81KuLubN0rOphBSwszVsgdw==@lists.freedesktop.org,
 AJvYcCUtJC5gHCUbDX7XjvUu6+rj8Y988/Mi0wYupErHxeWkP4Y5NJiHD/0Hv1Ku6pSFTYx+RcRXgGvsHZIL@lists.freedesktop.org,
 AJvYcCWLNfAbzTSGfUy7pVebXwBT22eNXISgZ2HDS2T1sms4wehkKvS6QydnCospqrpzYgkBksfspBmqbBc=@lists.freedesktop.org,
 AJvYcCWzSWoO+GcmpBSzTMR8KWiDbUhZgOIqXmJjBjMuHVzqPUvcLrZRro2yER9hgIXM/fdYesljNFKUuiWP4Gk=@lists.freedesktop.org,
 AJvYcCXC6O3zXFg95PMBkYLkcwQ7DCbpyN9adllpRISM4Jaqy3Im//GE385AnL/HZ+jcknf0W5AxxrHEaUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdgQZZ/2U72WIJCgL34XgTMzi2UC4tbUyVj6QLnwrudOf0LOhW
 daCBPijKD3Oz7Q4HV0WFIW0N+2kSnq850ZkeoGk4ULtXbUn3rYHpuq4IDKtw
X-Gm-Gg: ASbGncv0FeP8uUDwZc/4SvdlPbqx2xqcJBMaNU3iwBfarPIu8JfTwDHjb/TltE9Eokj
 f4lq5RRQb4WBzKC0xp/JmW18h7ShwC8JN9kqYCuhEt5sGKflzHU9NeTw6/ag11ZduCrF0/SmnEu
 gi9tiAEZAWR979aZHcZcpEO6QkWK/+K0IcYmw2A2upk+Rop9/+7jH5y2qXZQnHlZkgj8wLYyewF
 HJBGtSEQNWpDpwWkuuWfcN5A23QXEjcWjrAZXBn//vMJNtVPJYFqDMMHr6NvYig0aJkYhi8IkJD
 xGqw/fQu8Nv5lpzDgfB2dXFYJ0N5kaRUhFoVMLe7PrWifcc7sVfrfpl5+E56rR5i
X-Google-Smtp-Source: AGHT+IE4iiAxFIVhYyW53yqN9m7n/po0JEbbfutvinoSDe4Ypif/jYiyr2KXV0osNfcgWCWnk9Mhug==
X-Received: by 2002:a05:6102:442c:b0:4b2:9eeb:518f with SMTP id
 ada2fe7eead31-4bfc00c0415mr1501438137.10.1740131866931; 
 Fri, 21 Feb 2025 01:57:46 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4bd6ca871a4sm2870583137.5.2025.02.21.01.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 01:57:46 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-86949b5b5b1so494810241.3; 
 Fri, 21 Feb 2025 01:57:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHYzRwOKtazQa5AV2glhbHNiM84nVjr/1smcploz4haGIyjwaRR9QkWNZz40+MNVSvgkKYVZzxoB0=@lists.freedesktop.org,
 AJvYcCW0k5TbVfQjAgRZifJpHrdrcdacWCgWeU7MYHuyLBPOtkDkm4e52TqfyRB9kKukLVd+iQ9hv9/9KAkN@lists.freedesktop.org,
 AJvYcCWppNz5Dg9MajQ0z6BKUI0+shoyPrFb+R/KJHEtGc1NN71GJKi3gruuq+MrDs3wCcetw5YpgMbrCdXDrNs=@lists.freedesktop.org,
 AJvYcCWqAK8OvZrzCtx4h21d5A1NueGDm0IgYJo4/5xZbA8SfF6gzpOGOe3pAy44xHxliJU6kntv6l+s8GI=@lists.freedesktop.org,
 AJvYcCXhMdZXijsm5yytJNTo8zAWkbZ3a6xc6ftQaHl27qSXZUjZafAZcfuNMkpSLwlAkSKWcGzZM1r+Uw==@lists.freedesktop.org
X-Received: by 2002:a05:6102:441c:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bfc0277734mr1360564137.22.1740131865660; Fri, 21 Feb 2025
 01:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com>
 <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com>
 <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
In-Reply-To: <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2025 10:57:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
X-Gm-Features: AWEUYZnV-ULUCYHgs2rYqHTa6wPlfKvTAAqMyxRQ0em_d1IVN8Mw0n8NQD9eWqI
Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Hi Thomas,

On Fri, 21 Feb 2025 at 10:19, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
> > This change also first calls the drm_driver_color_mode_format(), which
> > could change the behavior even more, but afaics at the moment does not.
>
> Because currently each driver does its own thing, it can be hard to
> write user space that reliably allocates on all drivers. That's why it's
> important that parameters are not just raw numbers, but have
> well-defined semantics. The raw bpp is meaningless; it's also important
> to know which formats are associated with each value. Otherwise, you
> might get a dumb buffer with a bpp of 15, but it will be displayed
> incorrectly. This patch series finally implements this and clearly
> documents the assumptions behind the interfaces. The assumptions
> themselves have always existed.
>
> The color modes in drm_driver_color_mode_format() are set in stone and
> will not change incompatibly. It's already a user interface. I've taken
> care that the results do not change incompatibly compared to what the
> dumb-buffer ioctl currently assumes. (C1-C4 are special, see below.)
>
> > Although, maybe some platform does width * DIV_ROUND_UP(bpp, 8) even
> > for bpp < 8, and then this series changes it for 1, 2 and 4 bpps (but
> > not for 3, 5, 6, 7, if I'm not mistaken).
>
> True. 1, 2 and 4 would currently over-allocate significantly on some
> drivers and the series will reduce this to actual requirements. Yet our
> most common memory managers, gem-dma and gem-shmem, compute the sizes
> correctly.
>
> But there are currently no drivers that support C4, C2 or C1 formats;
> hence there's likely no user space either. I know that Geert is
> interested in making a driver that uses these formats on very low-end
> hardware (something Atari or Amiga IIRC). Over-allocating on such
> hardware is likely not an option.

Note that the gud and ssd130x drivers do support R1, and I believe
work is underway to add grayscale formats to ssd130x.

> The other values (3, 5, 6, 7) have no meaning I know of. 6 could be
> XRGB2222, but I not aware of anything using that. We don't even have a
> format constant for this.

Yeah, e.g. Amiga supports 3, 5, 6, and 7 bpp, but that is using
bitplanes.  There is already some sort of consensus to not expose
bitplanes to userspace in DRM, so limiting to 1, 2, 4, and 8 bpp
(which can be converted from C[1248]) is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
