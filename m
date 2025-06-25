Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F4AE7E78
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61A610E20B;
	Wed, 25 Jun 2025 10:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U5StkcWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881E210E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:05:20 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e84207a8aa3so3994206276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750845920; x=1751450720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
 b=U5StkcWyoRb5rnc/kH0TacNUCHviefnQby0+4SiYFjGAfUGJjK0JdVUWP3jGP9Y1EG
 4v1udXAtDcy4xkvf1TRD01puss7clp+XjyVO3W4ZNg/Pin/h1UP93fPfnpxdhKbco7ii
 LS0FUwtHqarVO74DA13aggEvJdcpjG3reO3gZ6CYk5YTcdNy8TQufhxCppP4MbJd52iu
 YiK0+6JmWlBCzXuCWvNKKUPmfAiYt8wUD9yNYVyAJWFaM5qJro4gZAhT2nyBK8uzI9AU
 EhvAVAYKY7fmWBUYy2p6QuLV2T4/cIvzoNiy85qiRzxrQ7ymEHqbDT1JnxkeJhFmlJsd
 kg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750845920; x=1751450720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
 b=iuo37jPuvyYPM1iye6EtFevwletJ1tgD+pubfAvmeOTqkBrZNEb+V8I3hZm3akf1gg
 WMzckEonfC9Rz9AqM5JexGAW2e0Fdh+SPi/82Ct9I+qHmIvXpfE2BX//2vAIFUefn/L7
 lZ9z5PHmki+EnEwV6mjJnN3JbPzNbQO2VuWmbnZBVi3C0vszfJmMfS76AMpG4vZGC92K
 P8nYfyInDBOJ1uNA0kU8j1QbtrWDXzlT5afnBUzr9uUYV14nObkviaix5He7FgLSntUi
 4SYqY43leas31PqnCcMF0bHSfBTksW7mDuXxEGXYajmziGR7NgZ6BLg4q4nEd/EFQxVn
 OT8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCURC9kdqUL5sVyNXhghpraxgSQTVf5y/007bKOsAyfsVlXW9dx6nxIzYrwqvKNpcJGl4jkV1FrWvRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcNzKtGjJJkvN0QtMj8ki7Kcipm/3RVk519ALdAywwDHFzeahI
 lwxTnRanditsyH25pFTuw0dNLuuzWWo7fYC9mINkOl1naTMivnjd4qFnPsU4X0tyrvotEJ+7iv2
 VhMVa+X6j2X59iCnw5sbsud90LhYVc3pQNoRNpLSvag==
X-Gm-Gg: ASbGncvD4j3sk2kPojd9A/WKpONVa0m8NuNnZw+QbPhHnvOaLBAMubRKu1FkSrtZGG7
 kJ1lN7Lcu9sQv3Eyn9vWsmMuiub9kofnENJj35X8YKs/AnmU5giNNJeGlSaOx0q2N3tBs4FpMWd
 MsaGQklwa6p8oegE72P/BRcjOwWnGzhyhKyGFzCsreXYc=
X-Google-Smtp-Source: AGHT+IEJrS2tphZ7UMREypIClsxlSmABIBla9pP6cK7b0bEY7VGBFV8Zh4V9DmKzTV5zBXNgMqCqlhwI6mHWvsv490U=
X-Received: by 2002:a05:6902:1703:b0:e81:9aa9:88d0 with SMTP id
 3f1490d57ef6-e86018ef2f7mr2643332276.40.1750845919338; Wed, 25 Jun 2025
 03:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250624141013.81358-1-brgl@bgdev.pl>
 <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
In-Reply-To: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:04:42 +0200
X-Gm-Features: AX0GCFtiYC7fRWb7mfaCIbLmQje2hb4McQcP0uGJDzj7bHa1BymRJdIDLbPQ_rE
Message-ID: <CAPDyKFq5G1CDL+VJxuzWZahZwUM0mVQJwU_WYYqNuDMDE3H5TA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
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
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, 24 Jun 2025 at 16:40, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jun 24, 2025 at 4:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Here's an immutable tag containing the thead 1520 power sequencing driv=
er
> > for the drm and pmdomain trees to pull from.
> >
> > Best Regards,
> > Bartosz Golaszewski
>
> Just an FYI - there don't seem to be any actual build-time
> dependencies between this driver and the rest of the code that uses it
> (thanks to the aux bus usage etc.) so Michal, Ulf et al: you can
> probably skip the pull if you can rely on this being available in
> linux-next for run-time testing.

Good point, I am not pulling the tag then!

Kind regards
Uffe
