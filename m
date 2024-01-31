Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6EE843965
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78E9113660;
	Wed, 31 Jan 2024 08:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3479D113660
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 08:43:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 16E82CE1E29;
 Wed, 31 Jan 2024 08:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4351C433F1;
 Wed, 31 Jan 2024 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706690600;
 bh=WJRAb5Q0qQXjV7SaWuZDaXL1s0bEk9w7Ko1XKjSZ4zY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ohMMVoObrAoUopRKLHd1DPwQaDRpZVNxDLVfBtIdTXFfvdyIyV4LN3GQ15t44s9As
 Ds08gmn31cX+Hnm96xNsNgv1XX9jXLZTEFsx0G1kYhUwN3fgyEI5j2uqbQeNTDmEpI
 I4B2yXNVQwqzxXsz909sid27LUSGqTnU7XA7/nqI5DwxwLKHgl8i/Bu+fRPdbm7YE3
 T9ZX2zcL7KlKzU0fJWbbsDKWMV9UkyWAVcDenzkSanN4H1CQtss5pB+4hhzsri8z42
 Js3MYyFnkWMgIDp9njQqfJqompl/m76OFGa6+WFdLCGBHBbirGSU5LyVuZkqC4e7XL
 SP0LCBz90yvRQ==
Date: Wed, 31 Jan 2024 08:43:13 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH RESEND v7 3/7] drm: atmel-hlcdc: Define SAM9X7 SoC XLCDC
 specific registers
Message-ID: <20240131084313.GC8551@google.com>
References: <20240129092319.199365-1-manikandan.m@microchip.com>
 <20240129092319.199365-4-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129092319.199365-4-manikandan.m@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 bbrezillon@kernel.org, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, nicolas.ferre@microchip.com,
 dri-devel@lists.freedesktop.org, claudiu.beznea@tuxon.dev,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, daniel@ffwll.ch, Hari.PrasathGE@microchip.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024, Manikandan Muralidharan wrote:

> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> The register address of the XLCDC IP used in SAM9X7 SoC family
> are different from the previous HLCDC. Defining those address
> space with valid macros.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> [manikandan.m@microchip.com: Remove unused macro definitions]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 42 ++++++++++++++++++++

>  include/linux/mfd/atmel-hlcdc.h              | 10 +++++

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 52 insertions(+)

-- 
Lee Jones [李琼斯]
