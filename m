Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6CB0540F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D4910E1B0;
	Tue, 15 Jul 2025 08:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CbY5k/mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC1810E1B0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:05:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6BA74537D;
 Tue, 15 Jul 2025 08:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CA7C4CEE3;
 Tue, 15 Jul 2025 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752566745;
 bh=MBMCjmOb5fj8zMDCgliqcGGqoewJCvAhNjmYPBNeRhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbY5k/mFKHNxUx9FsZkfPBww8cbSGuiqP9S/dSgJGDqlI9zaA8FUhbSytz7sbYGd9
 ZOWsNMvi1EjIhBPRXf9isDCfSO1T6Uk98xuNgvjNNiVbNfEAABu1FhelaevIzCoPL8
 3keyYQ4+5bKHPgULHBEKUthghtHI0vHyUa9mlOGfoHcHaK47B8M8EsUmtKtAxh59nr
 xqf/iB7c8rAMW6MCchQR+W9OFSMBGwZVMzijE4UeuVv2fXkLDi7ooW/B2Ao0k98luB
 s3o0pGlbaqovrM5w4fc0oyACA/sW65fDOsbavt+hVSHu8GI7gxOWV/tl3CEwSbDGws
 b7xeMo9yCNKrw==
Date: Tue, 15 Jul 2025 10:05:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Yao <richard@scandent.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akshay Athalye <akshay@scandent.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>, 
 Junhao Xie <bigfoot@classfun.cn>, Caleb James DeLisle <cjd@cjdns.fr>, 
 Kever Yang <kever.yang@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/3] drm/panel: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0
Message-ID: <20250715-loutish-pearl-cockle-252fca@krzk-bin>
References: <20250714221804.25691-1-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714221804.25691-1-richard@scandent.com>
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

On Mon, Jul 14, 2025 at 06:17:58PM -0400, Richard Yao wrote:
> Hello,
> 
> This series adds support for the Tianxianwei TWX700100S0 panel. The
> first patch adds the Tianxianwei vendor to the vendor prefixes yaml
> file.  The second patch documents the DT binding. The third patch makes
> fairly standard changes to the ili9881c driver.
> 
> Runtime testing and validation was done using a patched rpi-6.12.36-v8
> kernel on a CM4 using a custom carrier board designed by Scandent.
> 
> I have confirmed in writing with Tianxianwei that this patch series may
> be released under the GPL after sending them an early draft for review.
> This should be superfluous given my signed-off, but I want to make it
> clear that I did not assume fair use when providing signed-off.
> 
> Changes in v3:
>   - Fixed squash artifact in the third patch's commit message.
>   - Changed v1 link to use lkml.org to address mailing list rejection
>     due to "HTML part".
>   - Link to v2: https://lkml.org/lkml/2025/7/14/1504

Please use lore links. b4 does it for you, BTW, so recommended way to
send patchset is to use b4.

Best regards,
Krzysztof

