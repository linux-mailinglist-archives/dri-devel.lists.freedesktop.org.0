Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B838391DF09
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 14:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3E310E3E8;
	Mon,  1 Jul 2024 12:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="KPMXnxyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74810E3E8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 12:23:20 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7f649f7868dso13423739f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719836599; x=1720441399;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fue0Tv92IFzeqttRzqKdi3GkQifgKDzF/2EWUnqQBC0=;
 b=KPMXnxytr82hIOQYP5NrXdc7vlMNKsf1yFdSWWdxbMr26qYYjxBcQI+hHeROZMXKxY
 VORpIgcZcJ9Z+uVQmYJoUx//mND/5Y+/5rsEAy73u0LY9O85pKCq1tt1+zY8heO7oPeM
 WHPx6xPaDlhF9XV4SrUtVwXKJSAafDsX/YLSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719836599; x=1720441399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fue0Tv92IFzeqttRzqKdi3GkQifgKDzF/2EWUnqQBC0=;
 b=P/UOEVUzaktWIMCSCjygwXPORlv4J1kbXvEzZHgN8ZvZGgU2IP+sYJBD8UbRXVqBaU
 OxaSRer7clpAI/+Echf5g8zW1awOcy5U4xvDu3GzVYUhL3uRsyhCtFu+KZu40WnaWa6e
 ukfs0ZEvQxSy2T/68zxF/8oZpWF8uer8Eq+eH8ajqNetP8NATW6e/wN2ZAFQYW/04TmD
 3ex4PqPUM0KRVk++gpH1tAy5H/CSiD+uLrJAmmPpNqM+p+5QBKfNHXfzWJVm7xVQzqEW
 d2zFpIxWCBwmLkrYoZHL3esjo1oSqK9lursxrYNW8zgfUUG2VuvX/m16+XvVx/DNHY7D
 hEkA==
X-Gm-Message-State: AOJu0YwkYGLmNb4bRZq88kUTa53AecGC5ww/NmO0eTkj6iBvIa1SWYrm
 m5v6T782T2rd5LdN9WLC5n7x7FL3hhw3w84NW18vZhRrOuqVKP48/sR7xjnPuJGkyXl5K7WF9Cw
 gcKU5qoxndAF0Du27qBQgo4YlP1hRbo4ECS+a
X-Google-Smtp-Source: AGHT+IHmOisOayl3Bg1aP4Dv+/dv7zT8nCPfFaxqgYXrt1fPN+9KVh82cPsm+6h1tgTS6UVpdgt6eVP1hPoB9dqzHhE=
X-Received: by 2002:a6b:6b10:0:b0:7eb:db06:e067 with SMTP id
 ca18e2360f4ac-7f62ee169eemr587815439f.9.1719836599332; Mon, 01 Jul 2024
 05:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240628200729.754669-1-zack.rusin@broadcom.com>
In-Reply-To: <20240628200729.754669-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 1 Jul 2024 15:23:08 +0300
Message-ID: <CAKLwHdXRn26FQaER0RsXJ193n+9FpcxCtudjv3dYrkLU4yt8=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix various buffer mapping/import issues
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
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

On Fri, Jun 28, 2024 at 11:07=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> This small series fixes all known prime/dumb_buffer/buffer dirty
> tracking issues. Fixing of dumb-buffers turned out to be a lot more
> complex than I wanted it to be. There's not much that can be done
> there because the driver has to support old userspace (our Xorg driver
> expects those to not be gem buffers and special cases a bunch of
> functionality) and new userspace (which expects the handles to be
> gem buffers, at least to issue GEM_CLOSE).
>
> The third patch deals with it by making the objects returned from
> dumb-buffers both (raw buffers and surfaces referenced by the same
> handle), which always works and doesn't require any changes in userspace.
>
> This fixes the known KDE (KWin's) buffer rendering issues.
>
> v2: Fix compute_crc in the second patch, as spotted by Martin
>
> Zack Rusin (4):
>   drm/vmwgfx: Fix a deadlock in dma buf fence polling
>   drm/vmwgfx: Make sure the screen surface is ref counted
>   drm/vmwgfx: Fix handling of dumb buffers
>   drm/vmwgfx: Add basic support for external buffers
>
>  drivers/gpu/drm/vmwgfx/vmw_surface_cache.h |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 127 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  15 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  40 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      |  26 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        |  62 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 453 +++++++--------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  17 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  14 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  32 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  27 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  33 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       | 145 +++----
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 277 ++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       |  40 +-
>  15 files changed, 788 insertions(+), 530 deletions(-)
>
> --
> 2.40.1
>

To the series:
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
