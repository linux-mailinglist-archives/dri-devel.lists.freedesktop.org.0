Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E225337FA19
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 16:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A93C6ED14;
	Thu, 13 May 2021 14:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFC06ED14
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 14:55:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id c22so12168000ejd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8vd2SAwTdt88nX11VE63bL19uYaNF7maDv4yIT9Ok4=;
 b=OdlYf21e3GAV7+fJtPuYd/MZ2x4Q9Ktm+p6MDIKe45eorVK0EItJBVTUhfRpEn1FKy
 wzScKBxoIgLTaEF0kfXWfKAsWcuCcWa3kZRhrmZnRtT3Y8Kyv3BIut7KInyGQK/Q7+82
 S+MS6SQbce1OEAMhTpVs41rMza/m9fge+6nrVnaUWhQe7KfXS7z/YvfOYIzMysYwE9CT
 CqdFxylTupNIeHkP1Nqfg4LyMqQGMfcdVkBmNLsTXbZlq6CrAH7kDom2FjfWzECS5b0S
 mZvicBNTg4i76IA8Udo6EWsXsKvSB93DSIKbcwksVrNZgJEzPIXioVdLDVMMsyH/nVJw
 M1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8vd2SAwTdt88nX11VE63bL19uYaNF7maDv4yIT9Ok4=;
 b=ZOl1q/ILG6gJX3rsJ+lzlZA5QNkAqfoPXlLkknV7n6XL0PCULFubGxgFkTyFFUt/4d
 Xj/QQS2PHvZfgpx3HZEgcKKW0rWLhKgUM/8RdCaTcM/UUeN0eBjx6UBxvA3q0mIgd/sx
 cxgtf88sNmL2nVlq4MlcHO+hKq/ajwUPqFjfImGn9euW5O+P8aII5Fo27+/JbuXxnRyz
 xW6fku38+4Ub0GYyIvBBhCheEWAH5KlvIXhRygp3ksJRcQ2/KErAoMRgfz/J1gGmwzkC
 68kYVbqJvKgE5wV/6KNihbAqjY45Wp4xKdSkUTBpIXpRyRlydXcS4MNtomWvGQwmyQIk
 5bEw==
X-Gm-Message-State: AOAM5317iehYVxjti+mVw27EYvI59kOisxzzpPeQ4UtfQdRp5UJXbT5A
 EmZPKvl5DFAjpN8Ft++gV7JWkDXgiw7R+4I5L+4AAA==
X-Google-Smtp-Source: ABdhPJzyUVhAWAlVMgDV04Iqsca9WuX0WFa9WkM+n0Abvzy901iwOodylHjwZuY3UIH9Xp68bXI9dnwIoJZkQnfZBmk=
X-Received: by 2002:a17:906:13db:: with SMTP id
 g27mr468360ejc.88.1620917718561; 
 Thu, 13 May 2021 07:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
In-Reply-To: <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 13 May 2021 11:55:06 -0300
Message-ID: <CAAEAJfD3i+L4w1NuE5pUkMuH=R3CfBztDn-ZLcYR=onkcZ4Gxg@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 fshao@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 hoegsberg@chromium.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Mon, 26 Apr 2021 at 06:59, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 21/04/2021 07:28, Nicolas Boichat wrote:
> > Hi!
> >
> > This is just a rebase of the v11, untested (but it seems like
> > Neil Armstrong recently tested it), with small changes in
> > binding and dts. v11 cover follows:
> >
> > Follow-up on the v5 [1], things have gotten significantly
> > better in the last year, thanks to the efforts on Bifrost
> > support by the Collabora team (and probably others I'm not
> > aware of).
> >
> > I've been testing this series on a MT8183/kukui device, with a
> > chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
> > mesa 20.3.2 (lots of artifacts though).
> >
> > devfreq is currently not supported, as we'll need:
> >  - Clock core support for switching the GPU core clock (see 2/4).
> >  - Platform-specific handling of the 2-regulator (see 3/4).
> >
> > Since the latter is easy to detect, patch 3/4 just disables
> > devfreq if the more than one regulator is specified in the
> > compatible matching table.
> >
> > [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
> > [2] https://crrev.com/c/2608070
> >
> > Changes in v13:
> >  - devfreq: Fix conflict resolution mistake when rebasing, didn't
> >    even compile. Oops.
> >
> > Changes in v12:
> >  - binding: Fix min/maxItems logic (Rob Herring)
> >  - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).
> >
> > Changes in v11:
> >  - binding: power-domain-names not power-domainS-names
> >  - mt8183*.dts: remove incorrect supply-names
> >
> > Changes in v10:
> >  - Fix the binding to make sure sram-supply property can be provided.
> >
> > Changes in v9:
> >  - Explain why devfreq needs to be disabled for GPUs with >1
> >    regulators.
> >
> > Changes in v8:
> >  - Use DRM_DEV_INFO instead of ERROR
> >
> > Changes in v7:
> >  - Fix GPU ID in commit message
> >  - Fix GPU ID in commit message
> >
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >  - Add gpu regulators to kukui dtsi as well.
> >  - Power domains are now attached to spm, not scpsys
> >  - Drop R-B.
> >  - devfreq: New change
> >  - Context conflicts, reflow the code.
> >  - Use ARRAY_SIZE for power domains too.
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >  - Rename "2d" power domain to "core2" (keep R-B again).
> >  - Change power domain name from 2d to core2.
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >  - Add power-domain-names to describe the 3 domains.
> >    (kept Alyssa's reviewed-by as the change is minor)
> >  - Add power domain names.
> >
> > Changes in v3:
> >  - Match mt8183-mali instead of bifrost, as we require special
> >    handling for the 2 regulators and 3 power domains.
> >
> > Changes in v2:
> >  - Use sram instead of mali_sram as SRAM supply name.
> >  - Rename mali@ to gpu@.
> >
> > Nicolas Boichat (4):
> >   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
> >   arm64: dts: mt8183: Add node for the Mali GPU
> >   drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
> >   drm/panfrost: Add mt8183-mali compatible string
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        |  30 ++++-
> >  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
> >  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
> >  .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
> >  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
> >  drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
> >  7 files changed, 168 insertions(+), 1 deletion(-)
> >
>
> Seems this version is ready to be applied if we get a review on the DT ?
>
> Mathias ? could you have a look ?
>

Given Rob has Acked the DT bindings, I think it's OK to apply patches
1, 3 and 4 via drm-misc, letting Mediatek people sort out the DT changes.

My two unsolicited cents :-)

Ezequiel
