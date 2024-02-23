Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A48618C5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 18:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5C310E062;
	Fri, 23 Feb 2024 17:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mveeB0fM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380F610E062
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 17:04:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 85A83CE20F8;
 Fri, 23 Feb 2024 17:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9928EC433F1;
 Fri, 23 Feb 2024 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708707880;
 bh=mVR7nata20NPPlFX99/revGNTN4OGrTKvTgLLiNYWxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mveeB0fMIRAy+kb67KBw+HRe3t8G2jOt8w1u/8A5SunLiKrwN5X+Z1+QxQSRE+xwT
 ukPOU48Rbp3Bt93amFd8YQc2wCqTBtlI1fN5zEIHwHwJJcObNYtFb/BEW7P+Oo1NFF
 lfWTldeyCf1Giko5E61KyDzcgBO69T3Qg3ki+OJy1I1HpyIAnhwLC7rQr87kwA2BTB
 hzIGltTE4Wvg2NLaY+VdchHBJbnqWX80eDYJP2fFvZsa6j2Ud7ZJ6/Z1tOqD+CXAda
 S4/culQPBPruKmHy6t1wenwCesBYImXjwKhgJETFU+tB7pL+I3vw5Yd+2WUmwmPy85
 Xd1CKKyEXxhlA==
Date: Fri, 23 Feb 2024 17:04:33 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hari.PrasathGE@microchip.com, Balamanikandan.Gunasundar@microchip.com,
 Durai.ManickamKR@microchip.com, Nayabbasha.Sayed@microchip.com,
 Dharma.B@microchip.com, Varshini.Rajendran@microchip.com,
 Balakrishnan.S@microchip.com, Charan.Pedumuru@microchip.com
Subject: Re: [PATCH v8 2/7] drm: atmel-hlcdc: Define XLCDC specific registers
Message-ID: <20240223170433.GM1666215@google.com>
References: <20240221053531.12701-1-manikandan.m@microchip.com>
 <20240221053531.12701-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221053531.12701-3-manikandan.m@microchip.com>
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

On Wed, 21 Feb 2024, Manikandan Muralidharan wrote:

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

-- 
Lee Jones [李琼斯]
