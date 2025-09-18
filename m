Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A45B8593F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A61010E1F7;
	Thu, 18 Sep 2025 15:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W6lG9u22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374210E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:27:21 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-71d5fb5e34cso11529327b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758209240; x=1758814040; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ohjdE7vsdp2mFA+MExTFcCWgNEkrk5a/T8KfjfgAz0o=;
 b=W6lG9u22khbj13CogMLFwUa+ziaoNjvwIgIsGO7cfMEVs8TjGKwCJkM2XZksXiPz23
 3vCvheClP0y69RnXeRBVCHSNk9tki9NNNUAYJjJ7ZBSsd9KHarSqGDB8/DdcdrRRUNnu
 nnqoLRPkVsUUasmaW3JuV4QtDjiGhLaluvJJUFbnLr2UXyXzHixEJUvAE35gPyzDjPfv
 8OyMnw2w6jZxMyMvL243y9sxUYvoM1bpQENUfolXYQcKDnkhwWvNqGJ46wq0UMlyXJhJ
 n9mnjLfCEGWNdOOOHhPnBdBu5L3NtY6H0eMQwyf3HvL4ZHwiDnTW3oiNVrEn7FxbhfkE
 SmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209240; x=1758814040;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohjdE7vsdp2mFA+MExTFcCWgNEkrk5a/T8KfjfgAz0o=;
 b=Z4lUliOxrnQOukZsd44wMhxnqkTUClTBMk9deetaOzWvfoGB7t+kVae7JO6FHq9QCg
 8kKShMytOHUt5RE1HmR9AaKdypqJPkMAxOYrmwma5FPh01F9D5aWGdjocJOxlGLicqeH
 He+b4YdqdYKpLPLuBAXvwv783N5TWR4KTmhYHCLiTCiAuDvDnR5yAOCLUDb1AqH49mfs
 HzwRUYESOzngJEQTeMQxH05KtMZf4RyG2anH0qfOLZTDSpgGLYO+Ob8KgyoCMVoZmcur
 L3wlHLFcsl3AmLRRuowxIxmXYi0AS+X4EFM0my+AxrrgASjEEME8yYbtbtBwp99E9mng
 PBZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzz3TltFCn5ZYr5H/tGmZ/esPWyBqKywsmcOg1hShdHh6cciyFTnPT2vnVsCIhYoKBLz2PPBBRW34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS/b5KdVk8UCZFBcPtf7dhs9CjREw+hTN+AJIcY9A2Pu8BfqUN
 rxcf3Uc7RHKjAIl5iE+iHwSwsJD2MAAIFgPuZ2O3JKgGAZulSwCIRpBU798TfH292HBMWVzHKPi
 1RSSHrS3DR2eBqdrDTLG6jLC/I+AIB6BLoFti3VKbJQ==
X-Gm-Gg: ASbGnctZh2FicFd/8zrsIiTbuyBNhRtF8lu+j9BpQUpdVg3OB0fi6nW0Nu60gN3Asz0
 hkokhpmu37Zh0ltCrvD/Lbu7y+iqf7+VksjAvUSwN4Y2B6f8ONOVy6v5knoxOJEtzXjpM/4kfWx
 VgBWQJcYWdidNmR634wkKEhzgCPDV0ndhKXkieszl+PJ+793SWNuRIQrdkoSbfl6TVmKFEVGvbx
 V+KEpgvCY5kU/rOeRsxHkp/VWY=
X-Google-Smtp-Source: AGHT+IEQCrv2rBD0HZ5Ef3kA7d83Z57qpN7uwi/iH7ea1Nc2x95VmWRF+4zmzOqyCpcnKa543iKVkH+EZRR/L9nuveg=
X-Received: by 2002:a05:690c:6588:b0:734:61f:2b1b with SMTP id
 00721157ae682-7396eafa4acmr29231447b3.0.1758209239669; Thu, 18 Sep 2025
 08:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <CAPDyKFoi9KcsP5k84cSxuXNuMHmcf3a8emfOc6hMjGm_0FMk8w@mail.gmail.com>
 <2162077.CQOukoFCf9@workhorse>
In-Reply-To: <2162077.CQOukoFCf9@workhorse>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:26:43 +0200
X-Gm-Features: AS18NWAglY0uDqlAxTVI2SesnRFzqdlGAX0p_bWMYckBiLfd4yldGayxKumI5X4
Message-ID: <CAPDyKFqXVt5rF++GGTRxv6+S-2FevvdMVmJefvfqXkZ2iam1Rg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] MT8196 GPU Frequency/Power Control Support
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Sept 2025 at 17:45, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 17 September 2025 15:28:59 Central European Summer Time Ulf Hansson wrote:
> > On Wed, 17 Sept 2025 at 14:23, Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > This series introduces two new drivers to accomplish controlling the
> > > frequency and power of the Mali GPU on MediaTek MT8196 SoCs.
> > >
> > > The reason why it's not as straightforward as with other SoCs is that
> > > the MT8196 has quite complex glue logic in order to squeeze the maximum
> > > amount of performance possible out of the silicon. There's an additional
> > > MCU running a specialised firmware, which communicates with the
> > > application processor through a mailbox and some SRAM, and is in charge
> > > of controlling the regulators, the PLL clocks, and the power gating of
> > > the GPU, all while also being in charge of any DVFS control.
> > >
> > > This set of drivers is enough to communicate desired OPP index limits to
> > > the aforementioned MCU, referred to as "GPUEB" from here on out. The
> > > GPUEB is still free to lower the effective frequency if the GPU has no
> > > jobs going on at all, even when a higher OPP is set. There's also
> > > several more powerful OPPs it seemingly refuses to apply. The downstream
> > > chromeos kernel also doesn't reach the frequencies of those OPPs, so we
> > > assume this is expected.
> > >
> > > The frequency control driver lives in panthor's subdirectory, as it
> > > needs to pass panthor some data. I've kept the tie-in parts generic
> > > enough however to not make this a complete hack; mediatek_mfg (the
> > > frequency control driver) registers itself as a "devfreq provider" with
> > > panthor, and panthor picks it up during its probe function (or defers if
> > > mediatek_mfg is not ready yet, after adding a device link first).
> > >
> > > It's now generic enough to where I'll ponder about moving the devfreq
> > > provider stuff into a header in include/, and moving mediatek_mfg into
> > > the drivers/soc/ subdirectory, but there were enough changes so far to
> > > warrant a v3 without a move or further struct renames added, so that I
> > > can get feedback on this approach.
> > >
> > > The mailbox driver is a fairly bog-standard common mailbox framework
> > > driver, just specific to the firmware that runs on the GPUEB.
> >
> > I had a brief look at the series and it seems to me that the devfreq
> > thing here, may not be the perfect fit.
> >
> > Rather than using a new binding  (#performance-domain-cells) to model
> > a performance domain provider using devfreq, I think it could be more
> > straightforward to model this using the common #power-domain-cells
> > binding instead. As a power-domain provider then, which would be
> > capable of scaling performance too. Both genpd and the OPP core
> > already support this, though via performance-states (as indexes).
> >
> > In fact, this looks very similar to what we have implemented for the
> > Arm SCMI performance domain.
> >
> > If you have a look at the below, I think it should give you an idea of
> > the pieces.
> > drivers/pmdomain/arm/scmi_perf_domain.c
> > drivers/firmware/arm_scmi/perf.c
> > Documentation/devicetree/bindings/firmware/arm,scmi.yaml (protocol@13
> > is the performance protocol).
> >
> > That said, I don't have a strong opinion, but just wanted to share my
> > thoughts on your approach.
>
> Yeah, I found out about the pmdomain set_performance_state callback
> a few days ago. I've not looked into it much so far because not
> unlike a veterinarian on a cattle ranch, I was elbow-deep in v3's
> guts already and didn't want to pivot to something different before
> pushing it out, but I'll look into it more seriously now.

:-)

>
> Even if it means I have to get rid of my fun array binary search
> and rely on the opp core to do its linear time linked list
> traversal. :'( (But moving OPP core to use XArrays instead is a
> concern for the future.)

Sure!

>
> I've also been avoiding it because I didn't know how much
> additional functionality we'll add later, but I've talked with
> Angelo about it an hour ago and he agrees that I should go down
> the pmdomain route for the current functionality.
>
> Thank you for the hints!

Np! I am glad to help!

I will try my best to continue to review/comment on these things, if
you need it.

Kind regards
Uffe
