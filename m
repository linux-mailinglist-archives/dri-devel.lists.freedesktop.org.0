Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23747BABAE8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 08:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D63210E284;
	Tue, 30 Sep 2025 06:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DKgSCAt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67910E284
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 62B1D44DA0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A41AC116B1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759214454;
 bh=aY796e7ZjDJ3GpkqwDAOoDMWoCinINh6cbC/Z6IAkio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DKgSCAt1CIUjTAPD85phyC6/D/engFWoLogA9Yz5lqVjDmSESvd0ZOchbg0bW326x
 SW3YgAa4BKIk40LZ6tlKLlg0+2AmH9iEDSDkRkpUyTmOL/yMRy6+l1DvFG4sNq92g5
 sy/a90b1stw+87lspEOgUef61/I56Yjy0Gx9rS9WSeSmXvC14Dd7DfSTvudUdeHmvs
 hyf2tiiH4u7VKMaBdzQnBPsrh+0ulbD0H5T3ez6ZO2r1S0BXDt/Ie+UoPYrB2Y77Zw
 nJdGsBiHyj7wChYx6E02wVyxskB4mWT6pVJP8RRkE4qkvJfPssQ/OibpAGmtBcuzZ0
 my/RmbK0cZuXA==
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-27d2c35c459so44596705ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 23:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpgm0D11aisDtpfhC667Ww1flFjzaB2Mlv7YWUWGSm419B05cd8jjh8eE16siYQOdm2+HlOqecgbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP+Gzr0cy4u+wa/FRfileb0rZJHZRwR/8H6ASY1TLlvKcNnM0W
 NnlGirMX8wEsx64GV7/mQfDrlbISLDKUIfwL0kRJjEiCd8WOQYnBgtIcG0xiBq/YB1MP1Atj+Zv
 een/Fsry43d47Y/41QX0UM7ov856vHPg=
X-Google-Smtp-Source: AGHT+IFilulwB7yZKk8NWBisCkRd9EVIUP8wmRYd1pqL/aVk/i4cqOXK4Ip+OXNthJdD/mk9ed9ZzEkUxbiiEQK8Lsg=
X-Received: by 2002:a17:902:f68d:b0:276:842a:f9a7 with SMTP id
 d9443c01a7336-27ed4a5aab7mr219005735ad.57.1759214453755; Mon, 29 Sep 2025
 23:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba@epcas5p3.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com>
 <20250930040348.3702923-3-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-3-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 15:40:41 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc+ass6ftbxrodVzXVPFW+8rUYW=VyxsmGTU1wR_jBiAg@mail.gmail.com>
X-Gm-Features: AS18NWBGk7OJKwPJ5iy8_Rm-Qzpd87k2vQsijdmZj27-buhGtUmwdQhJcd2WDg0
Message-ID: <CAJKOXPc+ass6ftbxrodVzXVPFW+8rUYW=VyxsmGTU1wR_jBiAg@mail.gmail.com>
Subject: Re: [PATCH 02/29] arm64: dts: mfc: Add MFC device tree for Auto V920
 SoC
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
 ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Tue, 30 Sept 2025 at 12:55, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce the device=E2=80=91tree entries for the Samsung Exynos AUTO V92=
0
> multimedia=E2=80=91function controller (MFC). The patch defines:
> - Reserved memory regions for firmware and CMA buffers.
> - Core0 and Core1 memory mappings.
> - The main MFC node with basic properties (compatible, reg, interrupts,
>   clocks, DMA window, firmware name, debug mode, etc.).
> - Per=E2=80=91core sub=E2=80=91nodes (MFC=E2=80=910 and MFC=E2=80=911) wi=
th their own sysmmu,
>   firmware region, and configuration parameters.
> - Resource table listing supported codecs and their capabilities.
>
> Adds full support for the V920 MFC hardware to the mainline kernel
> device=E2=80=91tree, enabling proper memory allocation, interrupt handlin=
g and
> codec operation on this platform.
>
> Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
> Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
> ---
>  .../dts/exynos/exynosautov920-evt2-mfc.dtsi   | 187 ++++++++++++++++++

No, there are no such files. Don't push your downstream here.

>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |   1 +
>  2 files changed, 188 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dt=
si
>

This doesn't belong to media patchset, don't combine them.

Anyway, you completely disregarded DTS coding style and how we were
Samsung DTS. Please don't send us downstream code.

I won't be reviewing this, you need to start from scratch looming at
other recent code.

Remember also about Samsung maintainer profile, although with such
completely broken and non working bindings it's pointless now - this
code couldn't even be reliably tested with them.


Best regards,
Krzysztof
