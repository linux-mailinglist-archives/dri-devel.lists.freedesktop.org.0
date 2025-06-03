Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD626ACC674
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9810E690;
	Tue,  3 Jun 2025 12:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="enwutzNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A120B10E690
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 12:25:42 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e740a09eae0so4799314276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748953541; x=1749558341; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
 b=enwutzNwX6nSKFTrlJzvB5xFey/3j7PwX8IivORCT872lNI58yOLGC5HGcy5Wwf4J/
 TV4VuhngrlvvnXD2ufhf6M3LoOE3LfGzR2Zb+xcGAiJKIvJSjHw6MA7OxlzRjU7XrftS
 VfwuDyvsxfbLBnmHhjwh355fu4G912TKGai9wOgEdC5gMBv4+B+7gbQzuQy3w4fkLVfv
 yNLIgqm13nAv+e5wVBz8K9p2PCnzEKbVhR8N98GVDOVrQEDCxO99qOegQcEGqduRFK+G
 Ry6btk71xpByaRfpMKoMviqho0JfA4chB4niNCOdhw/FWGsfVxRpp4g5bJxDxEVNOczW
 MaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748953541; x=1749558341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
 b=QoxM92E76OMO2kb3a/l1X/AOcScprVIYI0y4Igv6JbRgC13WFxsfgYUeHyUwchK8A+
 x4LXhqWXZzkUDFC/ReQ9S2oSco95I7dNpiGC0+MPDnY+SHyMaRnovzv/MQhTpE4MOVRn
 RlUuF5U005jiA8nzyIht91PLivxJjDACR2D/4Le3J2LmAho1nKAbOmDVO+diXspUhl2w
 j2/UF2sj8u0EgaIG49Q6kS5iWIEdLKpvL9vQ9NNJ80VDHAUPkMkCW8YySlzgqxC0xmAd
 Jd56Nifgqz6uSYmsVYPSIDjDAv4XHP53DaujVUZeW0tZJrG7NqvIA0FKZ6yRtOcapNNQ
 gKqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU857sDhloqe+9IJzuRO90VdPh+Ms/7sbZiQ9gC3FsxVXch1zMt883RyIBLwaCtMAhhJgmfgn7Yw6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4M5EPK1kkzCjHU89T8D9nI6SFBoMIjWjDUmA9Av24SXLsrl29
 LPjvBr4p/wra9VtFSX6JiLw0eJxRgOCPacka+oZU66Zc4aVz1ZCequSm0bZOpxSnoxKkI6rebVX
 5S6g3fsUfJ6GQMXP/3Y07bqayB4yRo53yTfVtHAqaCA==
X-Gm-Gg: ASbGncv6ml7JGQkyuE0N6OCsCTQMQfQD/uJNAu2yfUbg+E3W0IHAVsGULRnwKH+DXb0
 Ymgj5CULtXhI8cEYYwZ3zUCcmskRdgUK67OicW2XL6DpEUwMrs5X0kCRZZgfv1gwHlZ71iJk5aK
 kc95aTTrTvSkPXY+VoQETG/P5yuhq+cu1M
X-Google-Smtp-Source: AGHT+IEJrWfxa9Bh6hqeqnweQzaVkjYvLD0ahWEYQ41oZGruPcsUvZuu97cItSkDZzbw9aGHdeGYbXtGb/PCj/51Oeg=
X-Received: by 2002:a05:6902:2b04:b0:e7d:988e:e7be with SMTP id
 3f1490d57ef6-e7f821a3acbmr24109793276.43.1748953541373; Tue, 03 Jun 2025
 05:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:25:04 +0200
X-Gm-Features: AX0GCFtQed31aP5hPCNMM0HA628iK-r2BM1mtBEnivi2Jm8ggPrVV8N_s24C_LE
Message-ID: <CAPDyKFqL9Xpau1BDnaa828s066zj=aVOAQOy1tCS=ztKN0ZsfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
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
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Fri, 30 May 2025 at 00:24, Michal Wilczynski
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

Just wanted to share my view. I have looked through the series and to
me this seems like the correct approach, nice work!

Feel free to add my Reviewed-by tag for the series, even if I think
there may be some comments to address from Bartosz etc.

[...]

Kind regards
Uffe
