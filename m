Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9977AE7EA3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C2810E6BB;
	Wed, 25 Jun 2025 10:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WduhGsBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A790310E6BB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:10:36 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e740a09eb00so5008528276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750846236; x=1751451036; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NyqCTrWRH38g5oBlyqrDfAPMaqAjSD4w/gNXRimf4zI=;
 b=WduhGsBXHiXY6wL2Ub7+rLwQqJpJeT32AncDbaDzGOkxt+M0KR7n2lUnXIbKn2+ysJ
 3UNyb7/YXJ7CGDeeftaUveTnLpxWHzzHQGHlw7x/nebHh0Bgn6qnuzsaJxyWqWn6daHr
 +agulCHXuQhM8fSoe4CqCCUQ7OJBmirpyL1UiIT1bJB1PrYs7tiU+YEzB+SeN34HBQmW
 cvqSEAr34mZniThHqr5/DcBLea3Brc4BQ5nWCvSaCUQN3jxtS8Elr6LalJLj2tqBDmoP
 JPmeOFkyWzLyZA9Avub0u1TJMugeePMxjx84g0JYIFeEV6VFqi1kVlePgAFRlOOkrTxP
 v1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750846236; x=1751451036;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyqCTrWRH38g5oBlyqrDfAPMaqAjSD4w/gNXRimf4zI=;
 b=lncZsvPyb//HBWz3xhqYDd8H8Ch59Hmmf5+ncr4lfIMXghGxK+JXUuVf56V8LbGeyS
 rNy2qnIHTeKXqH0sdJMx4c0orp6zggOLD3qapINorpvGmSt82DSXuBqiNDv5cBofwGl4
 mb5FqlESvHYwy7Kl5z6i9552ZgWBjP4M1SGKxzyyKo3AIVHRxunRml/NTuIgdk2Gg8k2
 4dPV6nHwsfhc+/Ylh55u6wCuCmcVx6SK70QB+hCJZfAGuno1ON0t5Lt5PQ+ZvGjN7ROd
 WGQU3KRi6LNvwFpu9IcUESNKcavj3NqLvEVAoOvCFFTCvP/FVgrwFLLlQ7sLbzmSH0W6
 cbBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxTvRw5CVX/DhMBvivDsDB/MLH9K89r1wlhMRDGFDArkXr1X0zMcK2QZpnwJduPdXmAxogWIC88mA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKtcKkMVgzgHdCwrm6eEIRNoHBB1E8k3Ci/Mh4MBtePk+BKk9N
 g7PlBnrIWgnEmuWPjWAbCEsmiWjPvqc+UfJ0S0hzL29ZFYljlX2BpTJi0Grv1st6C1dclW8MP/t
 rO33rOo9qp6U1IVCKg+YlP+Q7CB9ppbBaGIPOB3eqnH85fjGpCczl
X-Gm-Gg: ASbGncuQ4MIuJcSW9w3wWBGBtElhMLlgG9s0xngdfptLlAQzg9e3LcVC7gO0zlp8Gg8
 CrmSrLi3SsXBwEW1N59xGtAYsKFSIu1d+UOy6zafY4wELUGh/rBaPp2fAhtlnUhY+C7eiJUkUC+
 kIwQx00xMtwYTF82F21diYRCGzz9CTXCLSWugkzzN2DGM=
X-Google-Smtp-Source: AGHT+IGe9cdom9zPx5u2qPQ0tKYQR48QY3X3hjRnSL5OJURAbiiA4qXISjJMreIIdvqnR03DBzmyaEkxFKrpD5ccSCA=
X-Received: by 2002:a05:6902:1703:b0:e81:9aa9:88d0 with SMTP id
 3f1490d57ef6-e86018ef2f7mr2666888276.40.1750846235599; Wed, 25 Jun 2025
 03:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:09:59 +0200
X-Gm-Features: AX0GCFuzRfZFQhIpkvF03Pc7_qxAuJk_yHypckCZgiSZSQVUDRcV_4FwsCAnQX0
Message-ID: <CAPDyKFrCeYxtqscX8Vr165HMOcSof_d62PMtRwt_yDyZ4ujSDQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add TH1520 GPU support with power sequencing
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Mon, 23 Jun 2025 at 13:44, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
>
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
>
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
>
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.
>
> The series is structured as follows:
>
> Patch 1: Introduces the pwrseq-thead-gpu auxiliary driver to manage the
>          GPU's power-on/off sequence.
> Patch 2: Adds device tree bindings for the gpu-clkgen reset to the
>          existing thead,th1520-aon binding.
> Patch 3: Extends the pm-domains driver to detect the gpu-clkgen reset
>          and spawn the pwrseq-thead-gpu auxiliary driver.
> Patch 4: Updates the Imagination DRM driver to utilize the pwrseq
>          framework for TH1520 GPU power management.
> Patch 5: Adds the thead,th1520-gpu compatible string to the PowerVR GPU
>          device tree bindings.
> Patch 6: Adds the gpu-clkgen reset property to the aon node in the
>          TH1520 device tree source.
> Patch 7: Adds the device tree node for the IMG BXM-4-64 GPU and its
>          required fixed-clock.
> Patch 8: Enables compilation of the Imagination PowerVR driver on the
>          RISC-V architecture.
>
> This patchset finishes the work started in bigger series [2] by adding
> all remaining GPU power sequencing piece. After this patchset the GPU
> probes correctly.
>
> This series supersedes the previous genpd based approach. Testing on
> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
> correctly.

I have applied patch2 and patch3 for next via the pmdomain tree, thanks!

Note that, the DT patch (patch2) is also available on the immutable dt
branch, if it needs to be pulled into some other tree.

[...]

Kind regards
Uffe
