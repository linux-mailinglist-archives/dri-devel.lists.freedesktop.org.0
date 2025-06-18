Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDCBADEE2E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907810E839;
	Wed, 18 Jun 2025 13:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B+mKDaeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE5110E839
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:43:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-553cf020383so1814804e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254214; x=1750859014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DH2TdO4qlgMmdVZuOlcVSevdsjnZbtIfQYEMA25f/cg=;
 b=B+mKDaeZlfs39os/Hgfa6fbB9wwsoMQ3mhC3lYmq3pgFiQx7znVsdA4UBNpASmMaYm
 vuQVopMmonLzJ5QdL2hY6b4st8sAXhO1gcwaty1Wssdde1vmGIHxPuiZ1ss6NU0kGMEb
 F/QQ2eL1BHGyyz9aoM1wVGcHh6aYEnZ3vFwiY0yrv0P4S8l8onDxwDO2FpuAobOasbNI
 e7pdMq3FHCGJB6+GM1Qj0aKm4d/tbUGRV4uLqeMneOsAEkyHof4qiw4dmoX44jtn1tzq
 DlsBRLDt5YlGs+Z9Iq2VMeml+yEL29/0Okyd/6Lm1EFJFUsC6LLYtXEEVCtdoE5bQOsM
 /ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254214; x=1750859014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DH2TdO4qlgMmdVZuOlcVSevdsjnZbtIfQYEMA25f/cg=;
 b=Lz4BtHjwDnw4uJBmfNBQ+JFgRDECUFSB/9AKXPERRDf6URfjVIKZ1Sen4iEJvErZaP
 tooA+Bk84sLTeylcycx5hRZCt6QWJ9cjB9TbIavJ0wARIbN/09XIMmIpg8L3Ym26hbYS
 kTWI9BztUOuktEtswYO0gNah5q0EzKD1DVz+wbYJFWr7q7ufFjQN07ikcziOsLpwY9av
 N8+Vh3yxxsDpJ8BKaxYUZlvjN4CCedzeVidHYcAtuAlMmwoGjR55Qas3OfzyXddTBU+O
 UbjZZD4dJ5R2jwR23IZC6BflBlR7Cja5r+dt+9Pe3QSbLjRTgM5+sk0CBQuG5UgF19jM
 f0eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1YxINL0Tsy1Kpi1GDnEGkYtzQn3iqzkHqNF49ezNg80eFXdLqsDngZJ05+HEEO/S1jFU3VevogKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHcABH73J8kV/NPU4rxwvfXHEG7GOBGIL0Rf3+pCrrVikRH8Sl
 xRtIJQuFQwxHMsGetuztQW7uyDj336uln/cum7IKmNjG/GtA2YYS4NjjJZR3Dn36hgC3OXYgL5B
 PJqFXc/7W0T88dItOdGZi+zD260KLR1BWZbEib/EBFA==
X-Gm-Gg: ASbGncvh1jOjztQB7tVWxWuIIerfIt8iRIgIe3kMuMwl9ySxyvsG09UwjWND2ZXCZwA
 oZ5xDez8qoM77iJFNhB8T4NAI/0HZ0ISoD63ruEJX7EZyQuLW0G1yo2rsUif1vxb64jsd7k1qXh
 Sc0qNKw2YyFUdR3pWrJd2tbMlyLGrOA4qNNhokrAAuL59fH06gYEm32zAC/2f2oav60XbG792Wq
 w==
X-Google-Smtp-Source: AGHT+IHftNw+Eih04FWqkzxlxHZa0pUq9QbEcwUOmlySQIbB01O/3QL4rt3xwi2A6yMgr8Es7P1LaWGFLlQxbE/YI0U=
X-Received: by 2002:a05:6512:39cc:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-553b6f42a3fmr4662087e87.47.1750254213943; Wed, 18 Jun 2025
 06:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:43:23 +0200
X-Gm-Features: AX0GCFsy7p_bfVyodl4lMK_1wlqkCV9i-ffK-YbNgbQ1QgrzZEcf4YhKpp98eDM
Message-ID: <CAMRc=McvK2Og1kxDmN-5YW0UHxe-EEXPg88zh=oVEvSvCZ+-EA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> the GPU using the drm/imagination driver.
>
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
>
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> controlled programatically.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
