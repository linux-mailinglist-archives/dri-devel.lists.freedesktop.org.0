Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63BB44A54
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26A10E289;
	Thu,  4 Sep 2025 23:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BMl3sm7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4693F10E289
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:18:46 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e96e5535fcdso2760748276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757027925; x=1757632725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQWcOYSvoGf6CKIlQ65uFWfm+cKJc0xdhOAmhKddvzI=;
 b=BMl3sm7HaHHVNqs/T7h6zKr/YQL4XDDvjLQJev/DBVpSgGVB7uR+wFBfcv9jz+dg9C
 g23uDKQsH9ldug3ue3rp8qADLoVTfSBM75s0LH/HaKKROHLlPRqmeT6XAAoGATjcR0nt
 asPLWfdbrdL8qoeQbxDnt5pIkbLq1oXS0Cpcleop61MbYOqcZ0XgFlKEm/nlqgF+AKLg
 EXonLEufOvmWAX6+BL6gysYGCx+hH6llT1nzoRovE12z7dT/myjI+HDCXiTBTZcxMEYt
 wHSrujSRM4TFBls+ci/bgfXz9k0mo0IVp5vnNdlIDhgw2PXr1DmEW3NwQgu95WlsG6ek
 Y3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027925; x=1757632725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQWcOYSvoGf6CKIlQ65uFWfm+cKJc0xdhOAmhKddvzI=;
 b=ORcGhg2dfgpK71fe7e2lduaSIy+5QDPopj4hXYluyzudf3gAiv1NrUsoIJ4+GU7J2C
 BE8/GKhb2VDhrqFGy3tlORfjATtu5NJtYwDhncZJAGhfFdCNmT6ZMgyHlvTeK8YyOb+i
 Wx9mtEMlJPXYu9fmPVoTgiNcJVcUrZ9LAC6epX8adisSDdf5UK5RZnQsjGDCkDHH95cI
 mjz6Ech7iFWm1V4ITvoDAC9jSZkOiad7/Q5CdiOx0ZVSihfx4MH1NFC9Mj11oC7ZrvDq
 Tgp0o7aSEHiFAxxLLvgF7roZR0fzYdSE8x5lO0cXPCSxrsqpkmlJBiqPoDrZkqq1aJ+x
 M4Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoytqGEePxN5b/H5lx8B25zVe7Ur6bMIQxbpCyJA3D1WiLa7L1QSLBlV618VUiIfVPLi9kEFaHOrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/ckPx7ytcch3iqfwjejKKyXhGAWqte7zRWsT24QJFMORoARqW
 iA8IlJErCK6Dh31w/Jp359gd96BDNO7Z1L7184nwnLmBpKrBu84FiI8hluUlIhPsygzLJNrXmOf
 2ouM/ps0ULt5URQkp7bDnT8FT3YROBZY=
X-Gm-Gg: ASbGncveEMmHc65gRRGXXQLjufXUIUKyAc18pdGUYwrQRh9D36fbz6vjXEmg7J6Myog
 OPF39jj8QuHcU/2xS6vDUveTvD72BWVAxq5JxCItl1NuMxH8vEUciOIxTtGUMY3IrswngMbViyB
 X5ZmtM5wL1rXuUHZe5p84NL3JEV12ay69PoEf20sSb+QqAnEYarURDcwVMssSwmgvGsWBnp1hpW
 nZ7qi6JwM5Z+FqxC3sULlEzl5+DWgBA/TGkleyImC4Y5m6dpjS4RMEWZFmkR9AgjpmNnwQF
X-Google-Smtp-Source: AGHT+IHQpd6ZtxKh9UtLqej1FEwyk9wicyHA+rk6YLUxpDSr/eJRGonEqV6c9kpMfG14F2QX3PUE82AqC4KP582Ijug=
X-Received: by 2002:a05:690e:682:b0:605:8820:1400 with SMTP id
 956f58d0204a3-60b6663acb9mr1153046d50.6.1757027924783; Thu, 04 Sep 2025
 16:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <5820885.GXAFRqVoOG@workhorse>
In-Reply-To: <5820885.GXAFRqVoOG@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Sep 2025 16:18:34 -0700
X-Gm-Features: Ac12FXxTh1_T9lA63L4EOYeuqGn1KZXof6RHOWwp-aPirUkUxtnZTJ9xkSu8gmQ
Message-ID: <CAPaKu7RpgQiomxSWp8V=8S9QJxapcNNWquLU5XE+_jpzOue44A@mail.gmail.com>
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Thu, Sep 4, 2025 at 4:20=E2=80=AFAM Nicolas Frattaroli
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
That's very true :)

>
> My solution adds a small mailbox driver for the GPUEB, and also adds
> a new module that lives in the panthor tree and registers itself with
> panthor's devfreq stuff to be a "devfreq provider". The motivation
> for making it devfreq instead of a clock+regulator provider is that
> the GPUEB seems to have several quite devfreq-like parts to it that
> I am not yet using, namely setting a job completion target time and
> several methods of limiting performance.
Yeah, gpueb can do dvfs autonomously which is more similar to how
desktop gpus handle dvfs.  We have yet to verify that on our devices.
I also tend to trust devfreq more, but that might be partly because it
is very hard to navigate through the downstream drivers.

Look forward to seeing what you got!

>
> As it stands it can set the OPP, but boosting above 1.43 GHz does
> not seem to stick. The boosting stuff may be done by the four or
> five other ways it has to set some frequency target.
>
> I'm hoping I can send this in maybe next week or the week after. If
> things remain blocked by then it'll be compile-tested in its current
> form only and lack some clock stuff.
>
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
