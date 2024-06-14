Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91814908B39
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 14:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7323510E05E;
	Fri, 14 Jun 2024 12:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37FC10E05E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 12:04:25 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6325b04c275so4374777b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 05:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718366664; x=1718971464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ovNrKBz6SE0Xp6qLyWrHKke2Z46ajqO3lSt7jQEreM=;
 b=e2Gua27kxBeQdPAqmfcJHRLYRxksiSDee4fJAsDeu5J0NCdFmVR7ntTOTdX4F1xuaX
 LqUEAa1HqQEmiVIr2W+oH4Xc7M6OG8GAVWbCUlRZ5ew1kjY/Kx9NEJrLQXqtRhcqcEXV
 KAE+JBRYB2EPFmqkeLhySRi+QgllMkQeeCkMrk7NW3uFyyo79+jqfnGXevRGn60Dql24
 mROwN22TqHkrfZ1XSW8xT/Zb0K/D6LUIR1ZOxsBuuvnuQMWaaEUEKk8ObJmOx0nvoz06
 LnAaGHf54ocEjEAcYJf68mwtPQYs69KWATOZwDgwL3Fcbav515ShBZD5tr2iRANuje8+
 /XDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfvLjBnrkyiGwCMl23y+1+bPUnlZVLxR3dBshjD2mRZ7yu6thMq2YQnm8D7GXOuufuWoo3kxItKgGLvxo83RLk+Q255jysv6jSh+xTOVSb
X-Gm-Message-State: AOJu0YyaTIBgBV0iZQSv1DK9H6L0InektHMemEgpxLaJyScazVIbQi+/
 +oe8FRIw02T4fPtzbyGeTcEadCaL9qFb6B9gzAzVJHaHD4pOzppOy+0nKe/8
X-Google-Smtp-Source: AGHT+IHcS7qt0k/rOgM+E/0dn0pfJtiIPzhroOI7uTUPkT/K14x5HDGlIgD5S7AaIrm7sVoPNPFblQ==
X-Received: by 2002:a05:690c:806:b0:627:f592:f1ca with SMTP id
 00721157ae682-63224419cf6mr22195247b3.48.1718366663680; 
 Fri, 14 Jun 2024 05:04:23 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6311a446a72sm4328837b3.76.2024.06.14.05.04.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 05:04:22 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-630640c1e14so26442577b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 05:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV25cEm77XViBQRiSxgkL/MwsdMDDn60pcMe2gPCgFtIKiyuFTdyuGH9BYL0qMh/Ec5Jh9P9+F+oo8nNO/C2Bj9Yb6LPt3LNwa3alNQA8CU
X-Received: by 2002:a0d:c304:0:b0:61b:349c:817 with SMTP id
 00721157ae682-63222560c71mr22278067b3.12.1718366662348; Fri, 14 Jun 2024
 05:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
 <f2c00c97-4d2d-4cb8-aa9b-e9c458ca9e65@redhat.com>
In-Reply-To: <f2c00c97-4d2d-4cb8-aa9b-e9c458ca9e65@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 14:04:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWR=XgMi_9-K_FxJ9wUForvrNLG-QH0K7DvCOJsRGD7Q@mail.gmail.com>
Message-ID: <CAMuHMdVWR=XgMi_9-K_FxJ9wUForvrNLG-QH0K7DvCOJsRGD7Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Jocelyn,

On Fri, Jun 14, 2024 at 11:55=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> > Re-use the existing support for boot-up logos to draw a monochrome
> > graphical logo in the DRM panic handler.  When no suitable graphical
> > logo is available, the code falls back to the ASCII art penguin logo.
> >
> > Note that all graphical boot-up logos are freed during late kernel
> > initialization, hence a copy must be made for later use.
>
> Would it be possible to have the logo not in the __init section if
> DRM_PANIC is set ?

That would be rather complicated.  The C source files for the logos
(there can be multiple) are generated by drivers/video/logo/pnmtologo.c.

> The patch looks good to me anyway.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
