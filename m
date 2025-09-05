Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9FB44C1C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 05:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABE810EB10;
	Fri,  5 Sep 2025 03:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fYr2ufq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2899710EB14
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 03:08:13 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-336ce4a8bfcso14348941fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757041691; x=1757646491;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=;
 b=fYr2ufq/mc/GKzAfyhKdR1lAwnlgI9O+b2yHbUuaTP30HfCal/Nq/U6d69ZAb8yPv6
 t0uvMYRht2YaG07hshT0w4+hbKH4+ko4orsykuXh4VoU0Q9AafGSIs08Hp4dLyLq/YSQ
 putUQdLT4Efxir8/fJ9k+VXu15D2cBZ5SETTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757041691; x=1757646491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=;
 b=g4jDhAMFf+IpQ8A+qLTCkOhvhJD3zCHvnpzAFlDjqlCTabzikuXXKfdFyFUeDkHMOQ
 RSzfvlMS6D+7fDY412SChfhtsrQPDqf53p/MOXsAykbUHD1ydPyFKMAMUDT9DdSwnSSU
 LQVNlE0a+2HgWoh6pTJlmrGD6JM3OvZd7MO7w4YpZ3WQ8Cyoy1uMZEPEeFpJ79UxL27e
 qnrkjyPy3uComzEmR7kh9ftCZ8xdWweY4DyqfFg7cJUMKqNTTHxfTy6n1qQRDw43KC/F
 0CxnCbh2mFPjgO9GLFhK3CR9cxJY8IraDVsG6n7Xc/qLI8EFb96NrTzXEeaSvgY0WWb9
 QzVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHRChtmNBhJO++0VUmeHqkmyJJPyWRHFm8oIJMxCTFlKIy729cJ7x2UYKfqROtBtQbQCgt3V+Vsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFcud1pues+rGo8iT8By1p+Nb90AilAjG8UpkLDRBiTaHoFJGE
 p+1tsVCzsucj+DntPL7HOT5f0Lxrsvp0kzDJlDd7gGxfWn7WkMy2dYrsUnGa6kyAMdLyhs3b0Ar
 pFT8ONo9B/jXWrPT1NCLmO2a6jWCC8UE7JHKpwmgJ
X-Gm-Gg: ASbGnctyv2Z6wAJCNQEK12zAv6aMadN3EmVOlCXerGTaLxhtmh1G9GgldtK8En9jnfo
 aCELuYlJyYPFfrwRVub6zJ+X4GoLHCB4TXvCjf1042au3W72hjE97SuULhPnwruYSAiwUH9iy/Y
 Z1/8u/K9/xZpoQpM4Gq15n4DoHKyiv1IWmNBn4/KVeXCGr7uUbKx6VCSPMTAl9djXAGK3OmDVFn
 U7HNkw6hUlprWVo/LT/MYi4IE3mq9s28gkuO3goQE35nfLK
X-Google-Smtp-Source: AGHT+IGldyHuDYkPWivf90sba85mlu8jLhfEVWhM+CRAtZ5kcPdD6IcKM+CLluf3aDGmO4+qEneV9QzpuYa7Bir4LF8=
X-Received: by 2002:a05:651c:1107:10b0:338:5ec:1dda with SMTP id
 38308e7fff4ca-33805ec1e2cmr23475841fa.9.1757041691297; Thu, 04 Sep 2025
 20:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <5820885.GXAFRqVoOG@workhorse>
In-Reply-To: <5820885.GXAFRqVoOG@workhorse>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 11:08:00 +0800
X-Gm-Features: Ac12FXw182raft1JJYOZIoO33KVRrFPcguj33C1FCebFdDsYEFHlJ4j0UxQM7o4
Message-ID: <CAGXv+5EbEDG3sZjo9BDv_8-HhLNNTH4DLZ3ibvdcsULXgkzjYg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] drm/panthor: initial mt8196 support
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Chia-I Wu <olvaffe@gmail.com>
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

On Thu, Sep 4, 2025 at 7:20=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Hi,
>
> On Thursday, 4 September 2025 00:55:02 Central European Summer Time Chia-=
I Wu wrote:
> > MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
> > support recently. But the soc also requires custom ASN hash to be
> > enabled. This series introduces panthor_soc_data for per-soc data and
> > uses it to enable custom ASN hash on MT8196.
> >
> > The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> > be cleaned up and upstreamed separately.
>
> I'm currently working on this, I'm at a functional 800 LoC driver vs the
> more than 30k LoC of the downstream... thing. I intend to send it in as
> an RFC once the clock stuff lands, and I get some responses wrt to
> figuring out what's still missing from linux-next aside from the DT to
> get basic boot working so that I don't send in something that I
> accidentally shredded during a rebase without noticing.
>
> Cleaning up the downstream driver is a fool's errand, it's like 6?
> separate drivers, with lots of global state (and no locking), without
> using the common clock framework, and relying on abusing -supply DT
> properties to force a certain probe order to make all the race
> conditions it would otherwise have turn out fine. A lot of it is
> code that seems dead, or wrappers wrapping wrappers that have nothing
> to do with how the hardware actually works.
>
> My solution adds a small mailbox driver for the GPUEB, and also adds
> a new module that lives in the panthor tree and registers itself with
> panthor's devfreq stuff to be a "devfreq provider". The motivation
> for making it devfreq instead of a clock+regulator provider is that
> the GPUEB seems to have several quite devfreq-like parts to it that
> I am not yet using, namely setting a job completion target time and
> several methods of limiting performance.
>
> As it stands it can set the OPP, but boosting above 1.43 GHz does
> not seem to stick. The boosting stuff may be done by the four or
> five other ways it has to set some frequency target.
>
> I'm hoping I can send this in maybe next week or the week after. If
> things remain blocked by then it'll be compile-tested in its current
> form only and lack some clock stuff.

I suggest posting them when you think they are ready, and not wait for
the clk patches to land. The review is going a bit slower than I expected
and Stephen usually just picks up the patches towards the end of the
cycles anyway.

ChenYu

> Kind regards,
> Nicolas Frattaroli
>
> >
> > This initial support also lacks support for some hw configs. On some
> > configs, panthor is expected to query a mask from efuse to mask out
> > unavailable shader cores from ptdev->gpu_info.shader_present. This
> > requires extending panthor_soc_data with a callback to read the mask.
> >
> > This is an RFC because the dependent drivers are not ready yet. But I
> > would like to gather opinions on having panthor_soc_data for
> > soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
> > soc-specific code.
> >
> > [1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc9=
0bde54b32872c59cf5c77779
> >
> > Chia-I Wu (2):
> >   dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
> >   drm/panthor: add initial mt8196 support
> >
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
> >  drivers/gpu/drm/panthor/Kconfig               |  6 +++++
> >  drivers/gpu/drm/panthor/Makefile              |  2 ++
> >  drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
> >  drivers/gpu/drm/panthor/panthor_device.h      |  4 +++
> >  drivers/gpu/drm/panthor/panthor_drv.c         |  4 +++
> >  drivers/gpu/drm/panthor/panthor_gpu.c         | 26 ++++++++++++++++++-
> >  drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
> >  drivers/gpu/drm/panthor/panthor_soc.h         | 26 +++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_soc_mt8196.c  |  9 +++++++
> >  10 files changed, 83 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_soc.h
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_soc_mt8196.c
> >
> >
>
>
>
>
