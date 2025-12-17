Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9558CCC69CC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 09:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E431810E53E;
	Wed, 17 Dec 2025 08:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZGnkKpV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3674610E53E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 08:38:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D3DD6018C;
 Wed, 17 Dec 2025 08:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F371C4CEF5;
 Wed, 17 Dec 2025 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765960714;
 bh=SEK/Xv/Xpl1SB8LM/NKk5Oox72KsTiMyeOEPmpwl2Jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGnkKpV2D3o8VjP+EFMXDZJCBrR4/A1B7x+1gZzdquyGkCynph7xWWEcSoois7nEL
 N/Fpz80eBfX63qEt881a4/ji2jVta/Z1riZFlgfrsP8DXi9NwiXAYKS5VesBcLqzrU
 1Dg4eXua9UczMKDOqVOx/HBA35vs/uocPrDye3XcqyWPS87W4el6XmX9d2Sg8stedu
 NoAkDOSnMhz4RlEs/CdQsOtgo9UPdbdMI2hVCJJ3+JPgAc2frvMBEQWhHOVbR1lzfy
 1eqf+AhUjXpWJJeWttIYzGJVvzaRzF/zpNXsUltVP6QI1ShPtspIBj+4WjV2o4tiIJ
 aSf0kpmmtmRAQ==
Date: Wed, 17 Dec 2025 09:38:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dharma.b@microchip.com,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: atmel,hlcdc: Add sama7d65
 compatible string
Message-ID: <20251217-secret-beluga-of-patience-3ba530@quoll>
References: <20251215090639.346288-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215090639.346288-1-manikandan.m@microchip.com>
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

On Mon, Dec 15, 2025 at 02:36:38PM +0530, Manikandan Muralidharan wrote:
> Add LCD compatible string for sama7d65.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

