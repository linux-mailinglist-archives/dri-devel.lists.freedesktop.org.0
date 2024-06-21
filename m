Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B63911F7F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 10:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44810F0DC;
	Fri, 21 Jun 2024 08:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dz3eJVdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C209110F0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718960136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZxfbjVDFLZ8q4+IcR6ygghLj1wY/E9B1wkW/5ajlvI=;
 b=dz3eJVdrhk3xvCfPXJTt+w1/Nt5ZrLKlIx/30M2r5qRDU7RhavgC4Hx+A7P5ZQViWgdD98
 gvuJgE4wLkbCoUNGXwjGl6JR0eAV+o5q9jV5S6Au8MrPAChO0xEUg7y5Ny0D+WMpA3TXaI
 Xo2EUv1Vz56yf4st7ZbRy3zZiSO/BrQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-N1OLiON3M_ajIksz-SzhIg-1; Fri, 21 Jun 2024 04:55:35 -0400
X-MC-Unique: N1OLiON3M_ajIksz-SzhIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4227e29cd39so9704715e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 01:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718960134; x=1719564934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HZxfbjVDFLZ8q4+IcR6ygghLj1wY/E9B1wkW/5ajlvI=;
 b=MICLS1RYNinbQy2DRy9tF4LorqQtKGjpkpMx86WLyLPOj+Uju720GWtEkvfkaU/7EW
 09ZsWcPn47BQ8okVLZ7IscBl3ov2bSkbt9oXVotLWBcjy00pBG9RjNkUI2WOWkPWrJxh
 WY1GYpq+0W+p0WLsd2yy5Fd3qTK4DgLPZahzVKetKT/zIdZXK5jSne3ymvz//LAJhMm2
 dw3a0uSMtLbzHqOw48VXect3HOv5LlVitM9BK7w9Z08zpPro4XSWfx39AcXxOQ7ftbDL
 jZndC7oyg8QHkkDrxekqFGtB69bCApgM5O94b6TjA+aw18pOFPopinPMVHLYAcrSbyHd
 3sIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdYZYSKUEvP2M+TAlgYplVC7UNwmtWOZPKbB9jQnYw3NAGgEXLSOzgLPGdOwRQtIYhV8xSWjlLH+vGtB3r3a8bU2vQIV7HobiLGpi+MD/a
X-Gm-Message-State: AOJu0Yz6/NHsWiM/WIUMdQI8CDu5PQjf+gq9w8GC3yCAgR3Xr6murJr5
 P7k/s6yd9MRJpuUY7/fE7BQbqtI/fptOPklP+z94PBsQtYvwkgo4mDA99bMl8yDYABp+L5rrn5X
 LCzzeJ/QzaRNQqIuum7ibOu3g8DFBnaBsdh3dhXLVokxG9lC5weU3VdAGeNNwkgrvyg==
X-Received: by 2002:a05:600c:3b96:b0:421:3b74:9c02 with SMTP id
 5b1f17b1804b1-424752ac00fmr57877715e9.41.1718960133948; 
 Fri, 21 Jun 2024 01:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkCronDs3rd4uDL011azLUJoQX0z7Z/tK6nKcBDkViAJOlmHlF1yWy1e0FG6LHPQxZY7mBOA==
X-Received: by 2002:a05:600c:3b96:b0:421:3b74:9c02 with SMTP id
 5b1f17b1804b1-424752ac00fmr57877585e9.41.1718960133568; 
 Fri, 21 Jun 2024 01:55:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0b6402sm54371555e9.10.2024.06.21.01.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 01:55:33 -0700 (PDT)
Message-ID: <b4caed34-bed4-4b72-9bb0-353ef63fe867@redhat.com>
Date: Fri, 21 Jun 2024 10:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/panic: Fixes and graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

I want to push at least the first patch that is an important fix.
But if there are no objections, I can push the whole series except patch 
5 "drm/panic: Convert to drm_fb_clip_offset()" which causes some build 
issue.

Best regards,

-- 

Jocelyn

On 13/06/2024 21:17, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> If drm/panic is enabled, a user-friendly message is shown on screen when
> a kernel panic occurs, together with an ASCII art penguin logo.
> Of course we can do better ;-)
> Hence this patch series extends drm/panic to draw the monochrome
> graphical boot logo, when available, preceded by the customary fixes.
> 
> Changes compared to v1:
>    - Rebase against today's drm-misc-next, where drm_panic is broken on
>      all current drivers due to an uninitialized pointer dereference.
>      Presumably this was only tested with an out-of-tree driver change?
>    - New fixes [1/7], [3/7], and [4/7],
>    - New cleanup [5/7],
>    - Inline trivial draw_logo_mono().
> 
> This has been tested with rcar-du.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (7):
>    drm/panic: Fix uninitialized drm_scanout_buffer.set_pixel() crash
>    drm/panic: Fix off-by-one logo size checks
>    lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
>    drm/panic: Spelling s/formater/formatter/
>    drm/panic: Convert to drm_fb_clip_offset()
>    drm/panic: Rename logo to logo_ascii
>    drm/panic: Add support for drawing a monochrome graphical logo
> 
>   drivers/gpu/drm/Kconfig     |  2 +-
>   drivers/gpu/drm/drm_panic.c | 74 +++++++++++++++++++++++++++++++------
>   drivers/video/logo/Kconfig  |  2 +
>   lib/fonts/Kconfig           |  6 ++-
>   4 files changed, 70 insertions(+), 14 deletions(-)
> 

