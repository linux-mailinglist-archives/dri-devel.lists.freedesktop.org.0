Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8864AD5596
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B287210E64B;
	Wed, 11 Jun 2025 12:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MbG0DtBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07BC10E64B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:32:43 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5534edc6493so7185070e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749645162; x=1750249962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4eXrHCbMUpvseqHiUwrqUO6dsPuBIHyzS/SjLxH5/I=;
 b=MbG0DtBXrmsDAv5LJR7T7gIVyA/TKDRb8XNAkfoI+qsa4KOc0ki+8HIm7+ES4eDsO/
 Zo05f2zS0BlBqDi2WWetPMDtTnIngaOzdRTKVVbxr70PGh4FL8322GybDm4siwx3FYKj
 0kv0jNNiFH3KDTCWcHGAgDWotLfN0pdn152WHxvnCEz2L1UCYrp4LzyRctJJNVzJevEI
 ssxvw9sFJx3DhLblutv8LI43yKkBiDdL2tzLkC1SesHdHQiX60eDHv/4JHP8TaPd8YsK
 wfv08Zq66+SHGRaPLA8FSBfLJSiZVCAapv/pUjPC8dUfpuG8ZZvdDYBort/zwZ+A54vg
 +1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749645162; x=1750249962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4eXrHCbMUpvseqHiUwrqUO6dsPuBIHyzS/SjLxH5/I=;
 b=OCGXtrg6WfuZGA+YP1MkqlOTCrrZAuNQAgwddo3fvpu0we4jO6ecMfHoMEV9uXyLTL
 o4yIvPQVxRlQxErjSp0TLuZCNtAIm5O3P8RT90jgbRpYn6Ac0nqXbthQJZ4CLiw4Smd6
 Z6AB1lwZicxct8motLCAhV5388BlqT0KYJrFHFPrAY10RqDj51eDIQoi/HknYIrZ8pO4
 hWPoI7lQMplhVtY6ojhIJX+fFU0egEFlcUoCTboWGqnBg41F9ZUmO11vcdIXQBdGP9cV
 wzVFz4lpiNTqifJjOvXIsPTiSFs0dVSexsqoeHJEYFlhoVP8K5WjQTymf213UkitkcO+
 v/ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW/aQ4WahYE+WIFCYx8r/qyb+ef0uGGOYQpGMSRUW/5eAZTQRt6WXrIvUQjpiVTmZhI7dgB38dLC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPQ8y9g+moeVp4T69nv6F1CbjGE5at8TJcqxghAQjr5ARn3o2U
 sRDxLI0gH4+z7SXYrfDpMlbCqTFbTm2S124HeBVoLcSKRA6BkAruPOXNAI9mlby4mQyVeFWNkMR
 wwDXsYu5YDwGinK/zJ9VtvV0ykjB/tCN2675Y2X4PFQ==
X-Gm-Gg: ASbGncvCbtbaN4bnlLgpeZ4UETuIpb1kk4wU3HmsipIUxu/XMpAC/iBCR+gDK/lIB1k
 mUI98CBBNjveiUOsAyixbfa3YToII/bgVcyyB6z4esDwtRmtjMR0+5BUpTAjHIywSyxzXLeIIDu
 sLhl6aSq2XV3ranXmz0Q8/nOrrmb4dSyILOYLluzwssQkd+WOxbH4wnO69P+KMiicdkHt8srP5U
 hU=
X-Google-Smtp-Source: AGHT+IGHMHwNzsM1NGuL0PQD0BmZr0UKvInuP5DveCugPa5juDjAvW16u7yGz9UDUBFrQBYvdjud91JIeJHyUc/U894=
X-Received: by 2002:a05:6512:3e04:b0:553:202e:a41c with SMTP id
 2adb3069b0e04-5539d512675mr774155e87.28.1749645161860; Wed, 11 Jun 2025
 05:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
 <20250603-whispering-jaybird-of-thunder-f87867@kuoka>
 <d42a8c49-7ad2-49ef-bd9c-1e3d9981b58e@samsung.com>
 <e5a0bee2-ff74-47cf-ad2c-0c78b57ae6cf@kernel.org>
 <a6a29e58-8613-47f0-9e5c-d125da7ddb49@samsung.com>
 <cc4dbf7c-e023-403c-88be-4691f97a0ff0@kernel.org>
 <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
 <CAMRc=Mexq9ThfG6jZUbs3wYDA9UZN-+pHnX_Y-7WO4ubXvEuCw@mail.gmail.com>
 <ad6981eb-f53a-4a7b-90bd-2e2705bd0297@samsung.com>
In-Reply-To: <ad6981eb-f53a-4a7b-90bd-2e2705bd0297@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 14:32:30 +0200
X-Gm-Features: AX0GCFvj4H5bToMmKo6XfJpjuApNPLc8odnzcZbmwop3IjuZPwQzBjR3OK3gp6k
Message-ID: <CAMRc=Mfv9n3dioCz2ZAeoU=Q6tY+UxCiNV0wkmLHK36qKTTitQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matt Coster <matt.coster@imgtec.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 11, 2025 at 2:01=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/5/25 10:10, Bartosz Golaszewski wrote:
> > On Thu, Jun 5, 2025 at 9:47=E2=80=AFAM Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >>
> >>
> >> On 6/4/25 14:07, Krzysztof Kozlowski wrote:
> >>> On 04/06/2025 13:53, Michal Wilczynski wrote:
> >>>>>>
> >>>>>> The GPU node will depend on the AON node, which will be the sole
> >>>>>> provider for the 'gpu-power' sequencer (based on the discussion in=
 patch
> >>>>>> 1).
> >>>>>>
> >>>>>> Therefore, if the AON/pwrseq driver has already completed its prob=
e, and
> >>>>>> devm_pwrseq_get() in the GPU driver subsequently returns -EPROBE_D=
EFER
> >>>>>> (because pwrseq_get found 'no match' on the bus for 'gpu-power'), =
the
> >>>>>> interpretation is that the AON driver did not register this option=
al
> >>>>>> sequencer. Since AON is the only anticipated source, it implies th=
e
> >>>>>> sequencer won't become available later from its designated provide=
r.
> >>>>>
> >>>>> I don't understand why you made this assumption. AON could be a mod=
ule
> >>>>> and this driver built-in. AON will likely probe later.
> >>>>
> >>>> You're absolutely right that AON could be a module and would general=
ly
> >>>> probe later in that scenario. However, the GPU device also has a
> >>>> 'power-domains =3D <&aon TH1520_GPU_PD>' dependency. If the AON driv=
er (as
> >>>> the PM domain provider) were a late probing module, the GPU driver's
> >>>> probe would hit -EPROBE_DEFER when its power domain is requested
> >>>> which happens before attempting to get other resources like a power
> >>>> sequencer.
> >>>
> >>> Huh, so basically you imply certain hardware design and certain DTS
> >>> description in your driver code. Well, that's clearly fragile design =
to
> >>> me, because you should not rely how hardware properties are presented=
 in
> >>> DTS. Will work here on th1520 with this DTS, won't work with somethin=
g else.
> >>>
> >>> Especially that this looks like generic Imagination GPU code, common =
to
> >>> multiple devices, not TH1520 only specific.
> >>>
> >>>>
> >>>> So, if the GPU driver's code does reach the devm_pwrseq_get(dev,
> >>>> "gpu-power") call, it strongly implies the AON driver has already
> >>>> successfully probed.
> >>>>
> >>>> This leads to the core challenge with the optional 'gpu-power'
> >>>> sequencer: Even if the AON driver has already probed, if it then cho=
oses
> >>>> not to register the "gpu-power" sequence (because it's an optional
> >>>> feature), pwrseq_get() will still find "no device matched" on the
> >>>> pwrseq_bus and return EPROBE_DEFER.
> >>>>
> >>>> If the GPU driver defers here, as it normally should for -EPROBE_DEF=
ER,
> >>>> it could wait indefinitely for an optional sequence that its
> >>>> already probed AON provider will not supply.
> >>>>
> >>>> Anyway I think you're right, that this is probably confusing and we
> >>>> shouldn't rely on this behavior.
> >>>>
> >>>> To solve this, and to allow the GPU driver to correctly handle
> >>>> -EPROBE_DEFER when a sequencer is genuinely expected, I propose usin=
g a
> >>>> boolean property on the GPU's DT node, e.g.
> >>>> img,gpu-expects-power-sequencer. If the GPU node provides this prope=
rty
> >>>> it means the pwrseq 'gpu-power' is required.
> >>>
> >>> No, that would be driver design in DTS.
> >>>
> >>> I think the main problem is the pwrseq API: you should get via phandl=
e,
> >>> not name of the pwrseq controller. That's how all producer-consumer
> >>> relationships are done in OF platforms.
> >>
> >> Bart,
> >> Given Krzysztof's valid concerns about the current name based
> >> lookup in pwrseq_get() and the benefits of phandle based resource
> >> linking in OF platforms: Would you be open to a proposal for extending
> >> the pwrseq API to allow consumers to obtain a sequencer (or a specific
> >> target sequence) via a phandle defined in their Device Tree node? For
> >> instance, a consumer device could specify power-sequencer =3D
> >> <&aon> and a new API variant could resolve this.
> >>
> >
> > I can be open to it all I want, but I bet Krzysztof won't be open to
> > introducing anything like a power-sequencer device property in DT
> > bindings. Simply because there's no such thing in the physical world.
> > The concept behind the power sequencing framework was to bind
> > providers to consumers based on existing links modelling real device
> > properties (which a "power-sequencer" is not). I commented on it under
> > another email saying that you already have a link here - the
> > power-domains property taking the aon phandle. In your pwrseq
> > provider's match() callback you can parse and resolve it back to the
> > aon node thus making sure you're matching the consumer with the
> > correct provider.
> >
> > Please take a look at the existing wcn pwrseq driver which does a
> > similar thing but parses the regulator properties of the power
> > management unit (in the pwrseq_qcom_wcn_match() function).
> >
> > We've tried to do something like what you're proposing for years and
> > it always got stuck on the fact that DT must not make up bogus
> > properties only to satisfy the driver implementation. We've done it in
> > the past, that's true, but just because we didn't know any better and
> > DT maintainers are currently much stricter as to what kind of
> > properties to allow.
>
> Hi Bartosz, Krzysztof, Matt
>
> Thanks for the detailed explanation. I understand and agree with your
> point about using existing device tree links. The pwrseq framework's
> design makes perfect sense, and matching via the power-domains property
> is the right way forward for the provider.
>
> Just to clarify, my intention is to add the power-domains check to my
> existing .match() function, which already validates the consumer's
> compatible ("thead,th1520-gpu"). Combining these two checks will create
> an even stronger, more specific match. I will proceed with this change.
>
> However, this leads me back to a fundamental issue with the
> consumer side implementation in the generic pvr_device.c driver. The
> current fallback code is:
>
> /*
>  * If the error is -EPROBE_DEFER, it's because the
>  * optional sequencer provider is not present
>  * and it's safe to fall back on manual power-up.
>  */
> if (pwrseq_err =3D=3D -EPROBE_DEFER)
>         pvr_dev->pwrseq =3D NULL;
>
> As Krzysztof noted, simply ignoring -EPROBE_DEFER is not ideal. But if I
> change this to a standard deferred probe, the pvr_device.c driver will
> break on all other supported SoCs. It would wait indefinitely for a
> pwrseq-thead-gpu provider that will never appear on those platforms.
>
> The core of the problem is that any solution within the provider's
> .match() function cannot help here. On other SoCs, the
> pwrseq-thead-gpu.c driver is not even compiled, so its .match() function
> will never be executed. The generic consumer driver needs a way to know
> whether it should even attempt to get a sequencer.
>
> This brings me back to the idea of a DT property, and I'd like to frame
> it from a different perspective. A property like needs-power-sequencer
> (perhaps vendor-prefixed as thead,needs-power-sequencer) isn't meant to
> describe driver behavior, but rather to describe a physical integration
> requirement of the hardware.
>
> For the TH1520, the SoC integrators made a design choice that mandates a
> specific software driven power on sequence. On other supported SoCs, as
> noted by the Imagination developers [1], this sequencing is handled by
> the hardware itself. Describing this platform specific requirement this
> hardware quirk in the DT seems to be the most accurate way to model the
> physical reality.
>

Krzysztof, this sounds a bit like the qcom,controlled-remotely and
qcom,powered-remotely boolean properties we have for the BAM DMA nodes
on Qualcomm platforms, doesn't it? They too, tell the driver to not
enable certain resources as it's the TrustZone that will do it. Maybe
it is a valid use-case for something more generic? And if not, then
something like thead,hlos-controlled for this particular use-case.

Bartosz

> What would be the recommended way to proceed? The generic consumer
> driver needs a way to know if it should expect a sequencer for a
> particular platform, and the DT seems like the most appropriate place to
> describe this hardware specific need.
>
> If a DT property remains unacceptable, the only other path I can see is
> a minimal change to the core pwrseq API itself, perhaps by adding a
> non deferring devm_pwrseq_try_get() function.
>
> [1] - https://lore.kernel.org/all/fd46f443-b1f9-4f82-8d73-117cda093315@im=
gtec.com/
>
> >
> > Bartosz
> >
>
> Best regards,
> --
> Michal Wilczynski <m.wilczynski@samsung.com>
