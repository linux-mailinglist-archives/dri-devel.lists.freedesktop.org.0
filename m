Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267068A49BF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 10:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD0810F03B;
	Mon, 15 Apr 2024 08:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WTCYdlT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F29610F03B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:04:42 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7d5d7d570dcso136573239f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1713168281; x=1713773081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EyCySIvqzDGWsYj7p95CBIjM6BJBCedFGZcAGmBktc=;
 b=WTCYdlT9d2xMBk0O+9Gnn5cqFHt5v0dTjdAs2Nd0jVoe3Z5sIznAgyOgFxWZ7bwbjJ
 BUC4zGnCeetD+MdM8pJHbSqgcyZx6gwpnTqySBDwGZSKqUoXXxdYkidBPjs/KRd1ddvS
 IZ8iWfeIiTFtqnXG94+x69T0LlZdInzr9J2l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713168281; x=1713773081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EyCySIvqzDGWsYj7p95CBIjM6BJBCedFGZcAGmBktc=;
 b=Q0mlBjG2G14hVbHZSLKEiKY+Arbm+jtnZwCLwoCoiTZ/t4Qo2NVzcxs5yWVzIoQPB6
 rAIplDwoMd/JJwjWaqkcYILl+oJkn7ePjKJHukeClHcOPY3oMp/hR2Dlf2CnGz9WI7GH
 Gu0SGGgN13xW3lvT5JzIQQEXd+FgY6sWxsSoyt4kzTcmUszmL1yVB1Mk27mGhq7S5RCb
 T+rl2eLT+p/WF2HqKEZhmhy6qagH9fP6hbZLIOl1mz1v3hZJoNRKYxwzagePYC1/u0NL
 AkvZNrqXu9B+b0fiKeaCTVYpbQ2/hzyUeGM/PVIrGm39Fibau4kcwfVfRSKRQptMbomQ
 i84A==
X-Gm-Message-State: AOJu0Yw7Ivs2ETvVAfjo3mK5uPFeq8HpTDImRsbZuqaS8rDrWEVXzbpX
 CqGjKNldjnqyPM9FjkNhVLw6lboJXBL37se+3zKBu+H9OvINoiIWBgC1jFbmY4OecfoDs79Tttc
 v/o0LvA/Hsjg3FpXmXCewZC0UXHlTDsGBiwy1
X-Google-Smtp-Source: AGHT+IFtdhh5PDb/z1fz5V5AWviAaHeRMW5hLRs+DgNQUQc1+g+t/vW98eCuqdmcTZv+S82D609u6W2K7SjrYRapY+4=
X-Received: by 2002:a05:6602:4743:b0:7d5:ef76:a541 with SMTP id
 dy3-20020a056602474300b007d5ef76a541mr13621809iob.16.1713168281355; Mon, 15
 Apr 2024 01:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240412025511.78553-1-zack.rusin@broadcom.com>
 <CAKLwHdUwjD57nKfOME+CUZeBi7XV6j1+c-z2adW9XtETB49iWg@mail.gmail.com>
In-Reply-To: <CAKLwHdUwjD57nKfOME+CUZeBi7XV6j1+c-z2adW9XtETB49iWg@mail.gmail.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 15 Apr 2024 11:04:30 +0300
Message-ID: <CAKLwHdU-sFniq0EuHchOznh2uvr_YkiFhc1VsVKkKMYBe2WVcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/vmwgfx: vblank and crc generation support
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

On Fri, Apr 12, 2024 at 5:36=E2=80=AFPM Martin Krastev
<martin.krastev@broadcom.com> wrote:
>
> On Fri, Apr 12, 2024 at 5:55=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.c=
om> wrote:
> >
> > vmwgfx didn't have support for vblank or crc generation which made it
> > impossible to use a large number of IGT tests to properly test DRM
> > functionality in the driver.
> >
> > This series add virtual vblank and crc generation support, which allows
> > running most of IGT and immediately helped fix a number of kms issues
> > in the driver.
> >
> > v2: Fix misspelled comment header found by the kernel test robot, a sty=
le
> > fix spotted by Martin and improve commit message in 5/5 as suggested
> > by Pekka.
> >
> > Zack Rusin (5):
> >   drm/vmwgfx: Implement virtual kms
> >   drm/vmwgfx: Implement virtual crc generation
> >   drm/vmwgfx: Fix prime import/export
> >   drm/vmwgfx: Fix crtc's atomic check conditional
> >   drm/vmwgfx: Sort primary plane formats by order of preference
> >
> >  drivers/gpu/drm/vmwgfx/Makefile            |   2 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  35 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |   7 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |   2 +
> >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |   5 +
> >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |   7 +
> >  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        |  32 ++
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  51 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  26 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  39 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  15 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  32 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  28 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  42 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  44 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       | 632 +++++++++++++++++++++
> >  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h       |  75 +++
> >  17 files changed, 965 insertions(+), 109 deletions(-)
> >  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> >  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
> >
> > --
> > 2.40.1
> >
>
> LGTM to the series.
>
> Signed-off-by: Martin Krastev <martin.krastev@broadcom.com>
>
> Regards,
> Martin

Sorry, pasted the wrong clipboard.

Acked-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
