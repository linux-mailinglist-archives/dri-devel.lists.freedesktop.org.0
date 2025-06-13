Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335EAD89B0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 12:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5408410E985;
	Fri, 13 Jun 2025 10:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o3SFeoqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0A410E985
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 10:41:17 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-553b165c80cso531126e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 03:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749811275; x=1750416075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfKzLlzdg8/hxOQ/sfQWUfeF7cK8hBoGCPK1f9nwKuY=;
 b=o3SFeoqd5EBdyq6wJQj8yr+hx1DvtbuSotPmDwVEytqWO1WBj4vYyd9z0jDZaHnkbJ
 PKQBkdjkiA+XVAQrOjV/XA6Fynmi4QsRHE5ObO3Uz36Lr2uCwic2K41J3s0Nq18K6zmm
 Tm13GkIGZrNWa6Cy3z34nYkFhoNJEdtAl7PkavKAdJ3ClqBeTZ8w8vFmT28xlSy3LKD6
 G2VQnfQMGdmNGulIaZ/JC0zMVs0/F8A2Uzw8Ot0KcMrONRfapN0ztaNn341icXe/Pw30
 riTCooFNnwkHWMCYAEuhK0nGTHXsH6JzmIdGudMhidB1M2zO5DpGIFBq1YJEXVp4+Tct
 BOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749811275; x=1750416075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfKzLlzdg8/hxOQ/sfQWUfeF7cK8hBoGCPK1f9nwKuY=;
 b=G8RwZYLGE20SruIBNf3zpTto7s5vHwlAEiqtOvfMoZFZZ6U+VLF1byb3b8tJijzgsq
 PoOcP0SKu/1Lbx6fumD9fLu1uffoq4XQtNi802fcpr6RPs/CWwbjVYE6W+In68QbCC9N
 CXNfue5UC7neaUMEIwWq9atANwArNHo9wMXm9dMtCK67Z1F3LIOhZPzXzYz4fhpjtG0A
 nClMM0rBs7YvYRcvuv2ifn6cw70rXRTUrmExwl8Hc18aEKV1r/1vOEgPhgYr96emiEH5
 ebjPQEmfPyXZ9VkE1/0WEhoolGaU/96HV9SLpLX+csAky+eXvBXrhmb1CZJ9UYy/yqMZ
 dyGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkjPQxPoP7/e+eByquwJEyz7FZ0skW3Uh+nOejcGx9UIsEeoJ8ykrWSThUsXTb3oqsUGeGpyIfWqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpHOgh4uAJ0DPxKNc/mqLsn1DiaSVxYsgKWCHL+tqzr6H1pM3h
 38FoT1H0EG5Gtt+Y4wM+9hjDmMc0gc4/VWdJAcJbqcf2ku3PnO7cx+l1wjYy0mkK9qTa9mzmn2Y
 zjT4UvGM+02AjRqCGfvwebpQ4GW2XuCO6FrgWphnNYw==
X-Gm-Gg: ASbGnctCI7GZlvLOiK5ln5WBC4ifQfGHTsuGpvaN0k22F4QWRQOrRDeO5rmvkzz4kpe
 5eKo7ZtBVvGt5GqkVjDB+DXGEqqdf6CNjttoDfosIR2f+THdGzpRGErEwkGOPFwNC8AlJrTX2T6
 bjqhxq195UgMZGtB5brlc5mlLPGS52Iiq8XaFdczor81CcTSCukOY++u/CSxA+UeCyWWPpsjJN/
 QtNEA==
X-Google-Smtp-Source: AGHT+IEI5iVUc0DEPqOvU7NFkvOz7nMKRic8C5LUBBmjPtqE1B4qvCBRzNWQvX+CVfpF9MF2KnGVP2FIuyqsGVeSles=
X-Received: by 2002:a05:6512:2250:b0:553:23f9:bb37 with SMTP id
 2adb3069b0e04-553af9a5b4cmr656368e87.40.1749811275263; Fri, 13 Jun 2025
 03:41:15 -0700 (PDT)
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
 <59cc6827-1602-402a-9279-96ad6285cff4@kernel.org>
 <e5d3d3b3-7ada-476f-9558-328d3d316088@samsung.com>
In-Reply-To: <e5d3d3b3-7ada-476f-9558-328d3d316088@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 13 Jun 2025 12:41:02 +0200
X-Gm-Features: AX0GCFuR8VJK4btiZ7nnnlSFNivWr2LgUYbi6S3FuFypHNtbVFAa-18d5mDtat4
Message-ID: <CAMRc=MeVopfshe02MmYQQ5jS9oUKif4nR97WU68-nsVgCLG36A@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

On Fri, Jun 13, 2025 at 10:25=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> > Why? You have specific compatible for executing such quirks only for
> > given platform.
>
> This is due to how the pwrseq API works; it constructs a bus on which
> provider devices may appear at any time. With the current API, there is
> no way to express that a provider for a specific target will never
> appear. ('gpu-power' is the generic target name, and of course, more
> specific binding is handled in the provider's .match callback - based on
> the compatible and the node phandle like discussed previously).
>

This is by design and also the reason why we don't expose a
pwrseq_get_optional(). If the driver calls pwrseq_get() at all then it
expects the provider to eventually appear or will fail to initialize.

That still doesn't answer the question: why can't you have a callback
in your match data which - for this mode only - would call
pwrseq_get()/power_on()/power_off()?

> For all other supported SoCs, no such provider will ever appear on the
> bus, and the current pwrseq API doesn't allow a generic consumer to know
> this.
>
> However, your suggestion of handling this with a platform specific
> driver is a good path forward. It would still require a minimal addition
> to the pwrseq API to work. For example, a new SoC specific driver for
> "thead,th1520" could call a new function like
> pwrseq_enable_optional_target("gpu-power") during its probe. This would
> signal to the pwrseq core that this target is expected on the platform.
> Therefore, when the Imagination driver later calls pwrseq_get() on a
> TH1520, it would correctly result in either a match or a deferral.
>

I don't want to use the word optional. I think what you're thinking of
is a kind of "deferred" get where you get a valid handle, use it and
then, the provider eventually arrives it will get attached and its
state aligned with the current state of all the existing handles. I'm
not against it, it sounds quite elegant but there's an issue of error
reporting in this case. We'd need a notifier of some kind so that
consumers could subscribe and be notified about errors happening
behind the scenes.

Bart
