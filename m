Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2705841820
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 02:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EB2112C14;
	Tue, 30 Jan 2024 01:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12791112C13;
 Tue, 30 Jan 2024 01:08:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5110fae7af5so1805338e87.0; 
 Mon, 29 Jan 2024 17:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706576871; x=1707181671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XdaeecGW0oQf3cb0p/gxE71D3OQbZDICKx8BTb0+2M=;
 b=iNQ4QFnqsm1FpWikzTOLMIh++o6y7daiKUKg1ouBw+JebmtNklsBC10mprFfqq0OiV
 Pm6NeKZEPSUDz1kzQ+7Ajx8VTmf66P5Ir9U0/p5vE5TTjA10+yteebihqvBpwgE95N6q
 424YV4uPWIq37cW7Y0/qL75uKY3HD+LAPfxqv9e4SLjMHRON9ivqOHUVk0kr7dbIBaN4
 ueCii+3SbOpvTOG1wQCZZRFllW9/HaMxKAmp1vs7NCsaEo1dxswwCpvxhxG7snUKJaP/
 7E8t/4HqNzgIo5GLDQ9MIb9V9gHTlWINnSfcAbK3q03h3g72JmME11vxe/14I4oYI1RD
 Toyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706576871; x=1707181671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XdaeecGW0oQf3cb0p/gxE71D3OQbZDICKx8BTb0+2M=;
 b=PH5nwkN/cGv12mUimbT4L3Z5UdIltm/CsIfZ01YTcTDHOzKxQZX38/rMncbCLNCSBA
 dHti0c2V8JNsfgyoz4Tp2bOIks893jX6Saaop9DISoFYDnBBqlm5vUCgi/S0yU83EreB
 ooJpbbiA4L0LaFPDkpmlh+ocjmBP6tH47ViLpq/eMeu2IK7ZX45zSMPCQh9gNUxJ7hwv
 /ZYQTGM5i6/FjKi86zxTXwNz7+zjiT8n8CtWDlpt/XZYXtCpQ5xMy4U6rHdJrgoHNHvP
 EALLq4MXXO2EfnrPXT/xM4SmVwqCtMSiV/96iKbN1v4OuB8yw1+3+SIbrAlvRJg5ZB6c
 3hkQ==
X-Gm-Message-State: AOJu0Yzx/2Hx+LZFw6ocL1f5BHk/WVbRdOTlrmIBGH76CoKt8BWYlIlu
 5lvMb3eU5mBPflIwrjkU7ERPeR5d8p89HGbNg95ulzo7cb6ty74Df69ING+4iMxPtr/FAZh2uK0
 g0AGMYKRVcSp8EXYqazp6C+Xb4CM=
X-Google-Smtp-Source: AGHT+IFsgG9FObPN/wblpnKndRJFW5tL/xEfSRGC7qtD0er79TFifrki5HvcerMcno8no9tOL5ncD0ozhMFy2bX1eW4=
X-Received: by 2002:a2e:beab:0:b0:2d0:5925:75 with SMTP id
 a43-20020a2ebeab000000b002d059250075mr346788ljr.37.1706576870869; 
 Mon, 29 Jan 2024 17:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 30 Jan 2024 09:07:36 +0800
Message-ID: <CAKGbVbtAe5jnAwb7O8epq3g4FqLC-ggof3D=5gO9hJf5OuH0OQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] drm/lima: fixes and improvements to error recovery
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Serial is Reviewed-by: QIang Yu <yuq825@gmail.com>

On Wed, Jan 24, 2024 at 11:00=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
>
> v1 reference:
> https://patchwork.kernel.org/project/dri-devel/cover/20240117031212.11040=
34-1-nunes.erico@gmail.com/
>
> Changes v1 -> v2:
> - Dropped patch 1 which aimed to fix
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/8415 .
> That will require more testing and an actual fix to the irq/timeout
> handler race. It can be solved separately so I am deferring it to a
> followup patch and keeping that issue open.
>
> - Added patches 2 and 4 to cover "reset time out" and bus stop bit to
> hard reset in gp as well.
>
> - Added handling of all processors in synchronize_irq in patch 5 to
> cover multiple pp. Dropped unnecessary duplicate fence in patch 5.
>
> - Added patch 7 in v2. After some discussion in patch 4 (v1), it seems
> to be reasonable to bump our timeout value so that we further decrease
> the chance of users actually hitting any of these timeouts by default.
>
> - Reworked patch 8 in v2. Since I broadened the work to not only focus
> in pp anymore, I also included the change to the other blocks as well.
>
> - Collected some reviews and acks in unmodified patches.
>
>
> Erico Nunes (8):
>   drm/lima: reset async_reset on pp hard reset
>   drm/lima: reset async_reset on gp hard reset
>   drm/lima: set pp bus_stop bit before hard reset
>   drm/lima: set gp bus_stop bit before hard reset
>   drm/lima: handle spurious timeouts due to high irq latency
>   drm/lima: remove guilty drm_sched context handling
>   drm/lima: increase default job timeout to 10s
>   drm/lima: standardize debug messages by ip name
>
>  drivers/gpu/drm/lima/lima_ctx.c      |  2 +-
>  drivers/gpu/drm/lima/lima_ctx.h      |  1 -
>  drivers/gpu/drm/lima/lima_gp.c       | 39 +++++++++++++++++++++-------
>  drivers/gpu/drm/lima/lima_l2_cache.c |  6 +++--
>  drivers/gpu/drm/lima/lima_mmu.c      | 18 ++++++-------
>  drivers/gpu/drm/lima/lima_pmu.c      |  3 ++-
>  drivers/gpu/drm/lima/lima_pp.c       | 37 ++++++++++++++++++++------
>  drivers/gpu/drm/lima/lima_sched.c    | 38 ++++++++++++++++++++++-----
>  drivers/gpu/drm/lima/lima_sched.h    |  3 +--
>  9 files changed, 107 insertions(+), 40 deletions(-)
>
> --
> 2.43.0
>
