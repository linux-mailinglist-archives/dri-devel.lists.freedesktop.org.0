Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798859D55B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A7F10E519;
	Thu, 21 Nov 2024 22:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kr6Sfjel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB7210E425
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 22:47:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 115855C1AC4;
 Thu, 21 Nov 2024 22:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7F0C4CED1;
 Thu, 21 Nov 2024 22:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732229267;
 bh=7Rh3LO8bqPl+/ohAPK4jPsOy54AsIdEjBGcFAnaoX30=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=kr6SfjelJOok2BAk5NttJJeRSCSP9LIRA2nnQ6AIHRy40vBdokk4vG6cYfgaqxbm1
 /MvRM9u5364nRdRVDJQaBD11YvDTsQYU/Pyyk2+EeFByqxKGKVDSMoykEKD231zHBM
 fo7tjbm//Zc7Gu9o2EJQ8qiCath8hV9t3mwFKxWqSuKL2GvK+U/dt/A1wtfEZ9dZH8
 WQTSNdC/6Uq9wXdPju688Tf/uYkojnK8xHJpEkrht9O42ZfzO0ij/BkfytoGXDUmHK
 86a2Mc/cDMw2tnH7MDV2wflzWpm41FYJZnjN+RiJj1TiNZI60IteAjvPPw86k7CgSp
 MyiJ1i/fYzykg==
Message-ID: <1cbb46bd59a85c0eb0b2e8319bb7ec63.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023-drm-vc4-2712-support-v1-34-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-34-1cc2d5594907@raspberrypi.com>
Subject: Re: [PATCH 34/37] clk: bcm: rpi: Add disp clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Date: Thu, 21 Nov 2024 14:47:45 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Dave Stevenson (2024-10-23 09:50:31)
> From: Maxime Ripard <mripard@kernel.org>
>=20
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
