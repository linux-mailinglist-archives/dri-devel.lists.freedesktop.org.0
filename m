Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D2ACEB7D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DDA10E807;
	Thu,  5 Jun 2025 08:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MLE6kj5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16BA10E807
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 08:10:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso773234e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749111025; x=1749715825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EnW/yxpvBpxax3gx1shRrGfyOQX14oH8W/BcrsAWl4=;
 b=MLE6kj5l5g7KfW7gwep2/IgSkfbwk3aLSlkmX1cRNmjRYE0wEO/3WxhOBWKk3xqNvd
 loUqSAwI/Zi69JtGuP44xjmXdr1h61SAH/2xiEKyXmZnRy+loOF5wZsmmf3RFSGNb1aA
 eaZuIBt1KaXvnqMU0JveeW/ObV2N71wmElKKnEzvOM15spb5SCIfB/ptL5ipsCjaZPgg
 lS/9btUEfmD/6OiP+yp90HVOiY+lWU9tQ047Rwpq9Bo8J7S4CxFl/WzKapoulkCBq61q
 Cg3ojTW4SKhWYw+J2PEoHdv7MxrLfNeXJ/H/d3Xt/5if9PioH44gE0cbFSJvguabRRbZ
 gfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749111025; x=1749715825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1EnW/yxpvBpxax3gx1shRrGfyOQX14oH8W/BcrsAWl4=;
 b=U3gHOdHLYupHA6FUjMOtVuP80MgKgYYSioJM5/BAyxqO31CGaGIb3gpSIdrm1sO8SO
 sbK6vQpCScaE1990ImhyO3otMfTOPUHylC7ABt3hfPPPyI5kKqKzW16qa+Eab4W0pptw
 URW/FK7hbqlz+Aqmrk4jcl/OZtOwiK4DXQ8jsafRyJ4BthfPzAizEI9nqdToEaclXX1R
 GxZxCe/m84SW5VDxU0llvW/N2H13wGHzUmwjQRXgW8gMueTmdJPHsnIif3cSjCxA0NG5
 /lMDzlxl1UQY1Sy3HtIIcVySy2Ilemx2VBY8PtgKGdRe+b7JQMa6CQjgtAwZIYKLDWLm
 DS8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXYRdNlsEqatoS24EmuahuU8KeqJKOzaONLEFdi6+oEzrGWSGO8xzNLAivPPGJEpaBvq74X89FYwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP7X8ClaO1RZnG+Linl3on2a1rfVZthBO6pYYeijmp/3zJU3vK
 VkDozQIWrX8QR9DYZ66NOQAqg1mIJpH/7QbVEm/TqykSVBp4V8YaCvJYsG66Vi9Ea6BfwPaOn4x
 AYr2GdniTtBWMtcy3tv1ciUIGfnk1wc7RTL5WlIGyOQ==
X-Gm-Gg: ASbGncv/PqHrLkPJYvHdJVozYZOWjKNMIw8nhy+M/wPCQCMSOSt4J5uBSm/eFZfh25f
 KVJ/naCgxg+nKrinGG2Pwpks/52Ln9FCnEsNiVJAYPUqTMTHq/y5BFDeB8ULzAnfCetJQtaglfE
 uYy5snftFiSnk51b/0ypNLOYuD/cP6WNkblnetudZB6bTKrGt8k7zXH3LhHy88ub8=
X-Google-Smtp-Source: AGHT+IFmvaUxKM2YmSDzUPFoymenSB08cxuJBJYeqTxsL+DsKne2xe1WD05RHO30V66uoOomO/WhoKlJDKAjJemViv0=
X-Received: by 2002:a05:6512:1101:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-55356df2b3cmr1838173e87.57.1749111024615; Thu, 05 Jun 2025
 01:10:24 -0700 (PDT)
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
In-Reply-To: <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 10:10:12 +0200
X-Gm-Features: AX0GCFvEjcOAzs8GqTAWhoTL8unWEk1FSQC7E_ts2kCxQpL9-TEmMcPX7FYfnJE
Message-ID: <CAMRc=Mexq9ThfG6jZUbs3wYDA9UZN-+pHnX_Y-7WO4ubXvEuCw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
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

On Thu, Jun 5, 2025 at 9:47=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/4/25 14:07, Krzysztof Kozlowski wrote:
> > On 04/06/2025 13:53, Michal Wilczynski wrote:
> >>>>
> >>>> The GPU node will depend on the AON node, which will be the sole
> >>>> provider for the 'gpu-power' sequencer (based on the discussion in p=
atch
> >>>> 1).
> >>>>
> >>>> Therefore, if the AON/pwrseq driver has already completed its probe,=
 and
> >>>> devm_pwrseq_get() in the GPU driver subsequently returns -EPROBE_DEF=
ER
> >>>> (because pwrseq_get found 'no match' on the bus for 'gpu-power'), th=
e
> >>>> interpretation is that the AON driver did not register this optional
> >>>> sequencer. Since AON is the only anticipated source, it implies the
> >>>> sequencer won't become available later from its designated provider.
> >>>
> >>> I don't understand why you made this assumption. AON could be a modul=
e
> >>> and this driver built-in. AON will likely probe later.
> >>
> >> You're absolutely right that AON could be a module and would generally
> >> probe later in that scenario. However, the GPU device also has a
> >> 'power-domains =3D <&aon TH1520_GPU_PD>' dependency. If the AON driver=
 (as
> >> the PM domain provider) were a late probing module, the GPU driver's
> >> probe would hit -EPROBE_DEFER when its power domain is requested
> >> which happens before attempting to get other resources like a power
> >> sequencer.
> >
> > Huh, so basically you imply certain hardware design and certain DTS
> > description in your driver code. Well, that's clearly fragile design to
> > me, because you should not rely how hardware properties are presented i=
n
> > DTS. Will work here on th1520 with this DTS, won't work with something =
else.
> >
> > Especially that this looks like generic Imagination GPU code, common to
> > multiple devices, not TH1520 only specific.
> >
> >>
> >> So, if the GPU driver's code does reach the devm_pwrseq_get(dev,
> >> "gpu-power") call, it strongly implies the AON driver has already
> >> successfully probed.
> >>
> >> This leads to the core challenge with the optional 'gpu-power'
> >> sequencer: Even if the AON driver has already probed, if it then choos=
es
> >> not to register the "gpu-power" sequence (because it's an optional
> >> feature), pwrseq_get() will still find "no device matched" on the
> >> pwrseq_bus and return EPROBE_DEFER.
> >>
> >> If the GPU driver defers here, as it normally should for -EPROBE_DEFER=
,
> >> it could wait indefinitely for an optional sequence that its
> >> already probed AON provider will not supply.
> >>
> >> Anyway I think you're right, that this is probably confusing and we
> >> shouldn't rely on this behavior.
> >>
> >> To solve this, and to allow the GPU driver to correctly handle
> >> -EPROBE_DEFER when a sequencer is genuinely expected, I propose using =
a
> >> boolean property on the GPU's DT node, e.g.
> >> img,gpu-expects-power-sequencer. If the GPU node provides this propert=
y
> >> it means the pwrseq 'gpu-power' is required.
> >
> > No, that would be driver design in DTS.
> >
> > I think the main problem is the pwrseq API: you should get via phandle,
> > not name of the pwrseq controller. That's how all producer-consumer
> > relationships are done in OF platforms.
>
> Bart,
> Given Krzysztof's valid concerns about the current name based
> lookup in pwrseq_get() and the benefits of phandle based resource
> linking in OF platforms: Would you be open to a proposal for extending
> the pwrseq API to allow consumers to obtain a sequencer (or a specific
> target sequence) via a phandle defined in their Device Tree node? For
> instance, a consumer device could specify power-sequencer =3D
> <&aon> and a new API variant could resolve this.
>

I can be open to it all I want, but I bet Krzysztof won't be open to
introducing anything like a power-sequencer device property in DT
bindings. Simply because there's no such thing in the physical world.
The concept behind the power sequencing framework was to bind
providers to consumers based on existing links modelling real device
properties (which a "power-sequencer" is not). I commented on it under
another email saying that you already have a link here - the
power-domains property taking the aon phandle. In your pwrseq
provider's match() callback you can parse and resolve it back to the
aon node thus making sure you're matching the consumer with the
correct provider.

Please take a look at the existing wcn pwrseq driver which does a
similar thing but parses the regulator properties of the power
management unit (in the pwrseq_qcom_wcn_match() function).

We've tried to do something like what you're proposing for years and
it always got stuck on the fact that DT must not make up bogus
properties only to satisfy the driver implementation. We've done it in
the past, that's true, but just because we didn't know any better and
DT maintainers are currently much stricter as to what kind of
properties to allow.

Bartosz
