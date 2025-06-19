Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0EAE05DD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C540310EA17;
	Thu, 19 Jun 2025 12:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I+5P7cin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA3610EA17
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:31:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54b10594812so741013e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750336304; x=1750941104;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMcCgVRWuLovCnQmwobA6BOzc9WI8fy/gQWq8E19Azw=;
 b=I+5P7cinUcKlFfpQTTUS8xE1wRwe1B52RBE+1wuvj3cuyRUzBOTBHJLUipmY/1DoHE
 lYGYYruqxYluAxLuxAeWcgFESysKp6xjfekDrh7Kmyfrw0UxLEnpNQnNNOQ0dcI1JbWJ
 h08sdFq3KsMaB1TD0TldfH5zXyUIk+A15kfp5eVdt1MjmRhwyxTdQS3MS5zNMsJ2B9HC
 Mnfx5NH7UXAOvJ9VpnJFwQje1+X5lSCwCZ/cjyJqHHeYOgHxpWHyMtyD98x03HDXC4Lz
 CqDlKcwF7rJqUiYao2EIKYbsl95kCi9526GLkSdob72sQG3p7QkG153ugkzjK3jkTTk6
 hfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750336304; x=1750941104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tMcCgVRWuLovCnQmwobA6BOzc9WI8fy/gQWq8E19Azw=;
 b=d/AmlhmMLg8+uJLWKIFaSnSTPRiTy+6RpTkUquZjUJTsi1XIsyrPpGnX9eq5KYTYYC
 Xcq/u/P3744ZdxEHyjbA90+a2qHjTPbdnjVMXRrbNh2Bc706sFs42XjkSaxATVoXsuS8
 ZaWEstTlp45HIU3K7/obqqV3fPU2MGGb0Nddccf4uOrpoqWNlPfpt6QrvCgrdLI7a9u9
 Cxze5VDLLGu3+qngD1DU6GF7jSzxWhQjA4KkWG85633Sd5PBzpRLVA+BK3ziQQY23AXS
 uGpjWYBgQcMoOCWbXkNO5OVw/ihwEwxfk+s9oNU/TwgXfnIV59QSkjTS9iAt1HbhkOZl
 Fl4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0BcWObCvEgQ8+JFBLncAU3bI7A/nDW4EXfHVEZSgJzwy7NE1uTB3pfSo/768RrJr5CHsjm2wDZDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxc02oUOUmiYmN75y7xsMZKQdfTQkZE90d2YRL1BensrgctZ9h
 4lzd/sBF27WbIZsOyWXg+UbzeW+LwoGpIzEPwAKCNQLjf2wpJjdgCUP1Yazq+mW61pRuzKJmIbP
 obJR4wZoQ5z1ZOf7xmcdNRNC+jxHo3B515c1NrbD+tw==
X-Gm-Gg: ASbGnctzYN+BS8yjWsnm3lZ7v9s3MQ4I9zjXKbU9XpLoq3BnP3vgTyWOgIxOdu7ibkN
 GzTSywn7nVdM+Cv+setorNjB/kyc4sNJ1xT/sTXkbjtN51jZFgnLuMiVOc+dkJWGr0A8NjXkP2Z
 SYL1Kobw1f2jIErO8JuN7u0VvKh6qtFPZMB5Sz0BHl/GmKGCwh+S6VJFtcDcdgRWdJdi12qSVaN
 mk=
X-Google-Smtp-Source: AGHT+IHnuVpyxaUGV1/CRhQuo9bKehpcx5lRIL+L/i/s21Xafs+bJVvPVmoWpCvGx60h0BZ9+f65HqFMJzZRubWTK2s=
X-Received: by 2002:a05:6512:3a92:b0:553:26a7:70ec with SMTP id
 2adb3069b0e04-553b6d9eb20mr5867264e87.0.1750336303504; Thu, 19 Jun 2025
 05:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
 <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
In-Reply-To: <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 14:31:32 +0200
X-Gm-Features: AX0GCFvVV9T1_PzhkFci_vmPMYmYNx0pAplO5ttJMtFBTyUJUhAUxypAYMCTkw8
Message-ID: <CAMRc=Mf+o524rewPrtZGJhE11Gwp6v8A2V6zjGr3e1PmQq7aJw@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Ulf Hansson <ulf.hansson@linaro.org>
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

On Thu, Jun 19, 2025 at 12:25=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
>
> On Wed, 18 Jun 2025 at 12:22, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
> >
> > In order to support the complex power sequencing required by the TH1520
> > GPU, the AON power domain driver must be responsible for initiating the
> > corresponding sequencer driver. This functionality is specific to
> > platforms where the GPU power sequencing hardware is controlled by the
> > AON block.
> >
> > Extend the AON power domain driver to check for the presence of the
> > "gpu-clkgen" reset in its own device tree node.
> >
> > If the property is found, create and register a new auxiliary device.
> > This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu=
`
> > auxiliary driver to bind and take control of the sequencing logic.
> >
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> It looks like there is another re-spin needed, but thinking of the
> merge-strategy I could potentially take patch1->patch3 via my pmdomain
> tree, as it seems reasonable to keep those changes together. Unless
> Bartosz sees any problem with that, of course.
>

I have another change planned for the pwrseq API for this cycle.
Nothing major but it still will require patch 1/8 to be in my tree so
if you don't mind, I'll take it hrough the pwrseq tree and provide you
an immutable tag to pull before you apply the rest?

Bart
