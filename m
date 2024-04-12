Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F28A30CA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 16:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AC210EB98;
	Fri, 12 Apr 2024 14:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SM0Yc61g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3415210EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 14:36:26 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-36b08fc1913so1546835ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712932585; x=1713537385;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2x9UwbhzDy8tkqnICdNJDOQ2Cubf3fd/vmwCX5jJGo=;
 b=SM0Yc61g19rtG3lBH1IN6N22SrlEkGH4jvH/KOqBwOXhmfUh2qaHcGvcidXa95m9GV
 8pJFIbP/J7+UnUkHTD7VVASzKy5z+3A+ZE3sOdFd+8z0cwfHmQRxcD5x1T+ROtQfcvUw
 kdQYWL97kDcOMhU3MXVbu8k2k6baiG2jC15nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712932585; x=1713537385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2x9UwbhzDy8tkqnICdNJDOQ2Cubf3fd/vmwCX5jJGo=;
 b=NTTTh/1HAM2h4xPlIZbowuWN/JLRPv4j8ozoqR1Z/5PwGEHj6+dEkTGj+C3gTf/wod
 WmLdnRsaFOla/TLdnaf8840vdGS22miB4DwwZW18exodtBz7wPIsdZBt62cw2g7YB9qN
 Rk67n0BZtrQy4QR3BAbCZF4tNBkLYuOPf0wewAx0av29ZTuYh24GcO3uo8manaFHJ4hX
 xK1tlG2eITyhOSdwrcb+Q/n3EEZCZPXaGnqVlj6gaY3jhCtJCyUu0WIHyyk8uRWLLJa3
 ZmPfAYk7u8tc4dSsH4HAcQmyd8UCuO+ftrKheL3zu4AgYNFuA7/ojZGe3kTnusmTa1/U
 my9g==
X-Gm-Message-State: AOJu0YxftgMnS0tO9erADxXd/i4xE3H2ZbxnOxcDQqSyEZqVNQ06HVSz
 fU2M+wSrbQkmVbO9ZHUCzfrHkfOGFXRo5VatFziH1zNhb9jBt3PAX/zKJi+PK3XBGqPQf9TaUzo
 3iLQYG358vSeZ3BIB4am6XpqHgr040FtuSTo2
X-Google-Smtp-Source: AGHT+IE/1fguKSsYVm3eoTbwtuM8++Wl3CSF6uw+U/1lEtKk8BJQjy4BdBIaeoK6awunOSLSM/x532Kpv75DDyAAzJo=
X-Received: by 2002:a92:cc0b:0:b0:36a:28a8:ca5 with SMTP id
 s11-20020a92cc0b000000b0036a28a80ca5mr4303512ilp.7.1712932585231; Fri, 12 Apr
 2024 07:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240412025511.78553-1-zack.rusin@broadcom.com>
In-Reply-To: <20240412025511.78553-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Fri, 12 Apr 2024 17:36:14 +0300
Message-ID: <CAKLwHdUwjD57nKfOME+CUZeBi7XV6j1+c-z2adW9XtETB49iWg@mail.gmail.com>
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

On Fri, Apr 12, 2024 at 5:55=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> vmwgfx didn't have support for vblank or crc generation which made it
> impossible to use a large number of IGT tests to properly test DRM
> functionality in the driver.
>
> This series add virtual vblank and crc generation support, which allows
> running most of IGT and immediately helped fix a number of kms issues
> in the driver.
>
> v2: Fix misspelled comment header found by the kernel test robot, a style
> fix spotted by Martin and improve commit message in 5/5 as suggested
> by Pekka.
>
> Zack Rusin (5):
>   drm/vmwgfx: Implement virtual kms
>   drm/vmwgfx: Implement virtual crc generation
>   drm/vmwgfx: Fix prime import/export
>   drm/vmwgfx: Fix crtc's atomic check conditional
>   drm/vmwgfx: Sort primary plane formats by order of preference
>
>  drivers/gpu/drm/vmwgfx/Makefile            |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  35 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |   7 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |   5 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |   7 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        |  32 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  51 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  26 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  39 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  15 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  32 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  28 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  42 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  44 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       | 632 +++++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h       |  75 +++
>  17 files changed, 965 insertions(+), 109 deletions(-)
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
>
> --
> 2.40.1
>

LGTM to the series.

Signed-off-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
