Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD770F426
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA12810E34C;
	Wed, 24 May 2023 10:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C588810E34C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:27:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0457D632ED
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBEBC4339E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684924048;
 bh=Ru0fWfqqlX6KQv5nM4MMh2953U7nWaI2cFpOL79ZxOU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ou3dXMmmPknNr2EpgEOhpDzxeenu+FqECpv0vDlyeCIAqxkkvc8omfRowZI9qL48y
 qNboz4BBDS0oAYCxUfsAjuUpmemUoTPXEe4GkBjgypmE3BTYcgI2CvjvOIpvX5PV+j
 JcdFpPZhd58XXhMkyxR4poMWU0nEkvRzm7yrIZ3/2LAzZoOnGAB30mjep9cIH4lz0x
 DwNb/vZTUGgA44zsH8NtXvrLWGDSeUyPbrb4CkFeUE9oKfS4yHu6pFV4i9nMHIf8Cs
 uNTd7+kDg2Txb8WPRjbfDLH+dnxZBEu5pmUV3H7f9zDLUxWvV9S/dZih7PQoDz4PpF
 gXGrI5yvj9X9g==
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-561d5a16be0so10462387b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 03:27:28 -0700 (PDT)
X-Gm-Message-State: AC+VfDxC3PSOwC+NbhdAOkWwuvo8XZQRs1i2C+8Y2NnA/hH82XO+PE2q
 VHulu+mgu9Ws/Oa1GGUaE6KQAhfUGE8ZVJL7SgE=
X-Google-Smtp-Source: ACHHUZ5blUe2/ANdrbIUSBlAoc9jfa/cZWRA1ZwikgWcjIP8zS77ACL+X48iAferYBWCpvxnTrwKVSnp1f7b/AK/qBY=
X-Received: by 2002:a0d:fa82:0:b0:55a:18c0:daba with SMTP id
 k124-20020a0dfa82000000b0055a18c0dabamr17616723ywf.50.1684924047318; Wed, 24
 May 2023 03:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230517145237.295461-1-abailon@baylibre.com>
 <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
 <7ha5xud3m7.fsf@baylibre.com>
In-Reply-To: <7ha5xud3m7.fsf@baylibre.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 24 May 2023 13:27:00 +0300
X-Gmail-Original-Message-ID: <CAFCwf10hNjGtEYDi24LREnMLRGT7mRECvqQMdZWv=-uA7YELYg@mail.gmail.com>
Message-ID: <CAFCwf10hNjGtEYDi24LREnMLRGT7mRECvqQMdZWv=-uA7YELYg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
To: Kevin Hilman <khilman@baylibre.com>
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
Cc: dri-devel@lists.freedesktop.org, Alexandre Bailon <abailon@baylibre.com>,
 krzysztof.kozlowski+dt@linaro.org, sumit.semwal@linaro.org, bero@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linaro-mm-sig@lists.linaro.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jstephan@baylibre.com, nbelin@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 2:34=E2=80=AFAM Kevin Hilman <khilman@baylibre.com>=
 wrote:
>
> Jeffrey Hugo <quic_jhugo@quicinc.com> writes:
>
> > On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
> >> This adds a DRM driver that implements communication between the CPU a=
nd an
> >> APU. The driver target embedded device that usually run inference usin=
g some
> >> prebuilt models. The goal is to provide common infrastructure that cou=
ld be
> >> re-used to support many accelerators. Both kernel, userspace and firmw=
are tries
> >> to use standard and existing to leverage the development and maintenan=
ce effort.
> >> The series implements two platform drivers, one for simulation and ano=
ther one for
> >> the mt8183 (compatible with mt8365).
> >
> > This looks like the 3 existing Accel drivers.  Why is this in DRM?
>
> Yes, this belongs in accel.  I think Alex had some issues around the
> infra in accel with device nodes not appearing/opening properly, but
> I'll let him comment there.  But either way, the right approach should
> be to fix any issues in accel and move it there.
>
> [...]
>
> >>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
> >>   drivers/gpu/drm/Kconfig                       |   2 +
> >>   drivers/gpu/drm/Makefile                      |   1 +
> >>   drivers/gpu/drm/apu/Kconfig                   |  22 +
> >>   drivers/gpu/drm/apu/Makefile                  |  10 +
> >>   drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
> >>   drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
> >>   drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
> >>   drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++=
++
> >>   drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
> >>   include/uapi/drm/apu_drm.h                    |  81 +++
> >
> > "apu" seems too generic.  We already have 3 "AI processing units" over
> > in drivers/accel already...
>
> Indeed, it is generic, but that's kind of the point for this driver
> since it's targetted at generalizing the interface with "AI processing
> units" on a growing number of embedded SoCs (ARM, RISC-V, etc.)  In
> addition, the generic naming is intentional because the goal is bigger
> than the kernel and is working towards a generic, shared "libAPU"
> userspace[1], but also common firmware for DSP-style inference engines
> (e.g. analgous Sound Open Firmware for audio DSPs.)
>
> As usual, the various SoC vendors use different names (APU, NPU, NN
> unit, etc.)  but we'd like a generic name for the class of devices
> targetted by this driver.  And unfortunately, it looks like the equally
> generic "Versatile processing unit" is already taken Intel's
> drivers/accel/ivpu. :)
>
> Maybe since this is more about generalizing the interface between the
> CPU running linux and the APU, what about the name apu_if?  But I guess
> that applies to the other 3 drivers in drivers/accell also.  Hmmm...
>
> Naming things is hard[2], so we're definitly open to other ideas.  Any
> suggestions?
Maybe model it according to the tiny driver in drm display ? You can
then call it tiny_apu :-)
Disclosure: It was Daniel's suggestion, he can chime in with more
details on the tiny driver concept.
Oded

>
> Kevin
>
> [1] https://gitlab.baylibre.com/baylibre/libapu/libapu
>
> [2]
> "There are 2 hard problems in computer science: cache invalidation,
>  naming things and off-by-1 errors."
>  -- https://twitter.com/secretGeek/status/7269997868
>
