Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1224A789E9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3700410E6E6;
	Wed,  2 Apr 2025 08:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YJEUFseb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4721610E6E6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:31:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A02C643459;
 Wed,  2 Apr 2025 08:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6619CC4CEEA;
 Wed,  2 Apr 2025 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743582686;
 bh=L/MG90LSJ63Q/bHuOmvwjbAM0LR8ukk15/QEHxyHjfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJEUFsebw3XsOSdgpyf0TrUNgfNEDlVXFosqQHAbwd5W95A0cFfwwJ1+OdUnFXffT
 FMvVjIOoAr/bFZEFIbjGk+FFL1IFF84vF+2FkKB0ITM2dSYyzs21UEDgpimEHm2v68
 Ay/Rphwg/wf+wfdpgq7E0gebtIBlEVWrIjEHeKQEPwsXO8LpUKoUOAsXxZyPAUJP8a
 Mx5Y+Kz8KS5tB66W+T2BA+DoSX2dQsEmpHZU1FEjZgjlk7RSnSmVQfbtKvXbzIvd6l
 bCo0pMrdZyx+8DrK0+ukqIkYlqh0MwpHDZojN+FTz+sGPEQvCyXYEzpBZagqNYUS/y
 6z/pOt3h/SiVg==
Date: Wed, 2 Apr 2025 10:31:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Message-ID: <20250402-sambar-of-holistic-efficiency-f778b1@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
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

On Wed, Apr 02, 2025 at 08:12:10AM +0200, Marcus Folkesson wrote:
> +        display@3f {
> +          compatible = "sitronix,st7571-i2c";
> +          reg = <0x3f>;
> +
> +          reset-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;


so RST or RST_N?

Best regards,
Krzysztof

