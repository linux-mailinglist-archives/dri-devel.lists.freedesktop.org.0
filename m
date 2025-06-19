Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12FDAE0838
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 16:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A1410E090;
	Thu, 19 Jun 2025 14:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qgCf3/gD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B10F10E090
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 14:05:42 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e733cd55f9eso745732276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750341941; x=1750946741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKg0ba0YiDbucRJJP0q5rGzXl3UtGTSrIi2K7UJJiDI=;
 b=qgCf3/gDysFI/4HoDuDsp8Bj6C5V1d+USspQ0NjIjO2278wzhrufnifOZ3P+7CmVJ8
 NPsk0w2Q2mGvEw1wBBL+Um9N3/mHHCKflWqiXFRB9cvaiHmKG9Zm7tLRJRDzFgiUT0Bj
 Jd6p2UReh4r14rgNhMScJHhVIuf1B1SMcSyjm9YpEZsDLX/M+DQTG+alWVXKr3UeK41T
 N7d5P6pS24g/g0LzZM/Hl0QRE6a5XsfJwkm895ySXN/wuEnTySizgypgs4V55LA9Vg3D
 jvMBb6JkrfvlI+bqEtflKtIxmMfWrC5bdLnEGkThN0tHutYn8SWuskITiqCfFWsXHG9K
 7i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341941; x=1750946741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKg0ba0YiDbucRJJP0q5rGzXl3UtGTSrIi2K7UJJiDI=;
 b=XrtLkdNaXTFJqJw4oRMLQWTSmTyar0whKSHIB+e1x2cdy1hFgjO+/4yINQOzLUEKMK
 odqggZk1a74TAmcrkSIRQjGoXdO53GamHbvkoVpNHa47z3Lp0p2k0PLWtUFGZj9uMuCq
 hicaOnSbFf/yTJczBYmg9x7t9n5t3lCdjyD/uALTATRCnyLoCS+dxfshegPf2YB32WIl
 PPx0aXiwqrNcrc1NXCJsn4SBH6RXIWXc5QqF4LHpjYXXSs2VFZeCLnf6FRtRibTJ3MFk
 F+ZbbGP4oJcCn0IKM1kRhVyiIel9mSCxkDG0pG+g3+Lar+U+sZgFjC1a4rQzNGVXEF2Q
 JYaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKIM1vAKjtpPLkgATGb7biwsKlwUA3rRPDf+byiW4tg/5jTR/FtBcbC1qyjn/SXXBd9cGAYaAFV/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU531ogTZSrqIqEeMLZCeWHKmgSWBYvpwXWyrYciFhbUl7Sqru
 1TZ3jZJDJCA8KQ6eBSqBBoMYBx14ESgBEBFqX9vtsdIKWlJGIiSxEs7/jaR/3pdQcU6Io/zEEaE
 sL1156yh+OzzTon5LDtd3Q3C1yjgzZ4ykvCbgug50hA==
X-Gm-Gg: ASbGncvsbo0AIwDVLpZU2qACJdTXQn6KX6+ftL48IQb/khbxTeuOu9xq0ylDe3XTADD
 yvRxVgTBXxLuHkfqMYt95oRLOWHtr9pRLPBXSufGNwbtWGhZ3jEHl5y8hElZtt17APR0VfCYMkr
 EF6NNiUTTOemEiD4yTa1BAYGKQe9KIdWkrK6047v38QHXS
X-Google-Smtp-Source: AGHT+IH0AH5eQCmkoaKuxJOOgz4lFGdC1+XDKcfPC3cVk26SzauKoptzIDMdTxuXWb+pjp6Y/soe1VeW59yNxFQhyjU=
X-Received: by 2002:a05:6902:1a49:b0:e7d:a4a7:439b with SMTP id
 3f1490d57ef6-e822ad08e62mr28105508276.48.1750341940771; Thu, 19 Jun 2025
 07:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
 <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
 <CAMRc=Mf+o524rewPrtZGJhE11Gwp6v8A2V6zjGr3e1PmQq7aJw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf+o524rewPrtZGJhE11Gwp6v8A2V6zjGr3e1PmQq7aJw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 16:05:03 +0200
X-Gm-Features: AX0GCFv2RIICzft_XZewOUAZZhSSWv8Je60KaQi8kC_SyLtOZnxRamWoHqyfp3U
Message-ID: <CAPDyKFpsq6qaRaP4YDMkB=JrW+o3obKoirfHrdmost-kV4ct0Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,
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
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Thu, 19 Jun 2025 at 14:31, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Jun 19, 2025 at 12:25=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> >
> > On Wed, 18 Jun 2025 at 12:22, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> > >
> > > In order to support the complex power sequencing required by the TH15=
20
> > > GPU, the AON power domain driver must be responsible for initiating t=
he
> > > corresponding sequencer driver. This functionality is specific to
> > > platforms where the GPU power sequencing hardware is controlled by th=
e
> > > AON block.
> > >
> > > Extend the AON power domain driver to check for the presence of the
> > > "gpu-clkgen" reset in its own device tree node.
> > >
> > > If the property is found, create and register a new auxiliary device.
> > > This device acts as a proxy that allows the dedicated `pwrseq-thead-g=
pu`
> > > auxiliary driver to bind and take control of the sequencing logic.
> > >
> > > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > It looks like there is another re-spin needed, but thinking of the
> > merge-strategy I could potentially take patch1->patch3 via my pmdomain
> > tree, as it seems reasonable to keep those changes together. Unless
> > Bartosz sees any problem with that, of course.
> >
>
> I have another change planned for the pwrseq API for this cycle.
> Nothing major but it still will require patch 1/8 to be in my tree so
> if you don't mind, I'll take it hrough the pwrseq tree and provide you
> an immutable tag to pull before you apply the rest?

Right, that works perfectly fine too. I will wait for you to give me
the branch then, before applying anything.

Kind regards
Uffe
