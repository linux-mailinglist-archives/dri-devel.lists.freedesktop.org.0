Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D301AB45F81
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 19:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A466B10E305;
	Fri,  5 Sep 2025 17:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iDYQHU2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32910E305
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 17:02:35 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-71d60501806so23599177b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757091754; x=1757696554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8NjjCeXReyzcgLbvsACK7P63HLhNpR34lPrzMuu3eQ=;
 b=iDYQHU2Knca2pgvjFEVsIWjNWNE1pOkQR68MMuUDLeuieUJqoN+ZEV+f5ytb7PXQrT
 WbWmsxphR8G1vZ0HOkE1sKgnDMv04UzoqFt79+K4goRvFwDlpcfXsE7i9DRP7rUUaTrZ
 6hu26e1aolVbuywo6jWwqd/jM/2R5bHRhURpd0zJ4M5VAEZKfJxeRl6Dt/AAHxnRtifV
 en56Q8pHoq8GoKzQJWJWp7nSbrQyAXDzPZX+wfjD0XpvrG4g827InAMeVYK3Gvom8WoA
 GRFHfY26biUz6nQwj+x7KGf1OMebWzGWy199Wu50Ck/VCpF7yZ8Ly8VJFPs9HYxBSQmk
 bjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757091754; x=1757696554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8NjjCeXReyzcgLbvsACK7P63HLhNpR34lPrzMuu3eQ=;
 b=mbNDUtV5aFDq5hu0W23UBItuR9MunEDnZUtFr4nG+CkgqXsO3aUhTxOh1geL6buYxP
 XO0ZrT+omwheCWWaBNu9EVU5Qi7jSGeGz3qWyWjLTcHhzqNYfxelqPvZnWmvrjql1svu
 R7eqK/L1JI4gLqUQlngiBT1jKka23gP/FCTMbLFoky4YnhpHH9ETLEJLkaVut8IC/IA2
 IzFv0rlInEXeY/I0VOe1eqGrGjZXEaDc6oxTKokCvnc33FA3MZMPs7uvS4J1DyEGY0iO
 AN9k2j2XOdh1kXv450eipDyoCJ13m9uN0BaitveakFocdk+RzBZzoL36qdKzOBfiIdjd
 bTQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV630T3uheuwkbKtgYJmezN6DfjcTnun5NEEOd8T7fWDSaYm/W8bIH566vsbt96KevmnoCtTRRJVcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3JnEeY0uT9/p7XZ0zaiHDEHbAh/15GWJFKx186Lz9YrPpfU6K
 8nhhObJ8J42VN09+bOGlr4b7Q5AgL95t6r7QIsDrhtir7Anb4Nn5XsJp/1SbHN1oYffSZDxCtYb
 34+eHRQQG4p5UNqDmvCr43rSOt+YEICA=
X-Gm-Gg: ASbGnct0PWZeq5iE6EjZHoDfDi3I4pBlJFc17wZBzzuwvw+CuIEPzmIB3NmgeCReulS
 tTiuQR5AZzc+AP57/LLPbdMI0wX11kuhMPIxTVmALs4eD6EYPtIScdGhDq9WTqpBgGx4In1fT6N
 4LceYwspKRLu/pPoIMJf1Y5ji5YN6Z+Jyr/gZd5UmqFEEg4+tcpM2VN9FiRpnPz6ZDzZK+satn5
 XIAzZ/JGMzJTP3+6AxlCK8EUuv/r9MccsvLIv40SIbv0h1Z7X2h1BqZujqFMl+rio0+agGvBVCs
 V6HHXQ==
X-Google-Smtp-Source: AGHT+IHqV8s7u/gMm8e8T5OVb1+2lpSpU6gKPsZXfcRfbCdMQe3sy75wOj/QBNZIdintoDq0GMgoSv3igicKxfByJtQ=
X-Received: by 2002:a05:690c:3383:b0:726:3f4b:8ee6 with SMTP id
 00721157ae682-7263f4b992emr26133807b3.45.1757091753895; Fri, 05 Sep 2025
 10:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-3-olvaffe@gmail.com>
 <20250904080239.779b5e24@fedora>
 <CAPaKu7RdpEtwqDHrjt4HJOJVYeRjUa38Sk70=6dD9WmXYtf_jw@mail.gmail.com>
 <39d3363d-dd49-43a3-b42e-a434ab6c347e@arm.com>
In-Reply-To: <39d3363d-dd49-43a3-b42e-a434ab6c347e@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 5 Sep 2025 10:02:23 -0700
X-Gm-Features: Ac12FXy0j2cggFX5ZVGDIXj0e4sNH-RhuO4KH_5mCNlFv0UkwEqWaYYEDOfSPLs
Message-ID: <CAPaKu7SU5P-SkJj6aHi3ERekM4nnrv1p1joi1ZZ-pq0ZxytP8w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
To: Florent Tomasin <florent.tomasin@arm.com>
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

On Fri, Sep 5, 2025 at 2:18=E2=80=AFAM Florent Tomasin <florent.tomasin@arm=
.com> wrote:
>
>
>
> On 05/09/2025 00:06, Chia-I Wu wrote:
> > On Wed, Sep 3, 2025 at 11:02=E2=80=AFPM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> >>
> >> On Wed,  3 Sep 2025 15:55:04 -0700
> >> Chia-I Wu <olvaffe@gmail.com> wrote:
> >>
> >>> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panth=
or/Makefile
> >>> index 02db21748c125..75e92c461304b 100644
> >>> --- a/drivers/gpu/drm/panthor/Makefile
> >>> +++ b/drivers/gpu/drm/panthor/Makefile
> >>> @@ -12,4 +12,6 @@ panthor-y :=3D \
> >>>       panthor_mmu.o \
> >>>       panthor_sched.o
> >>>
> >>> +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) +=3D panthor_soc_mt8196.o
> >>
> >> Based on the stuff you describe (ASN hash, core mask read from an nvme=
m
> >> cell, extra clks/regulators?), I don't think we need per-soc source
> >> files and per-soc config options. If it becomes too HW specific (no
> >> abstraction to make it SoC-agnostic), we can reconsider the per-SoC
> >> file approach, but I believe it can all live in panthor_drv.c for now.
> > That's about right except no extra clk/regulator is needed.
> >
> > gpueb on mt8196 is yet another mcu running on its own fw.  It can
> > provide clk/regulator to panthor and no change is needed from panthor.
> > But it can also do dvfs autonomously, in which case panthor needs to
> > be modified to make clk/regulator/devfreq optional.  I think the
> > latter is where Nicolas Frattaroli is going and requires more invasive
> > integration.
>
> Hi Chia-I Wu,
>
> I beleive the changes your are proposing need to be treated as 3
> different features:
>
> 1. Handling of ASN hash
> 2. clk/regulator registration
> 3. Core Mask control in Panthor
>
> * For 1. since it is a GPU HW property, have you considered
> handling it in the DTB as HW quirk?
>
> Pass the value of the register from the DTB, then Panthor
> driver applies a mask to filter the bits and then configre the HW regs
It is a soc-specific quirk and was suggested to be dealt with using
compatible string

  https://lore.kernel.org/lkml/ac4838eb-7613-4642-a007-577a9f665984@arm.com=
/

>
> > The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> > be cleaned up and upstreamed separately.
>
> * For 2. Have you considered making the GPUEB MTK driver act as
> a clock/regulator supplier?
That's what the linked commit does

  https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54=
b32872c59cf5c77779

>
> Without a clocks, the driver won't be able to support
> instrumenation.
>
> And without a regulator or clock, how will system/runtime PM
> suspend/resume be handled in the driver?
>
> * For 3. I think this is a more complex topic and other vendors may
> have different needs.
>
> At first glance, `panthor_soc_data` does not seem to be sufficient
> to cope with other vendors.
>
> What would be the protocole used to communicate wth MCU?
> Can the MCU update the core mask on its own?
> Will the core mask change at runtime?
>
> If the core mask is static, what about adding a DTB entry?
AFAICT, gpueb reads the shader core mask from efuse and writes it to
an memory address (together with other info) specified by the gpueb
driver.  How the gpueb driver makes the mask available to panthor is
tbd, but it should be a very small change to panthor (unless we want
the gpueb driver to be a part of pantor).

I was told by the vendor that the shader core mask does not change
after boot, but can vary in unspecified ways.


>
> Kind regards,
> Florent
