Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6B8B952A
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3104D10ECEA;
	Thu,  2 May 2024 07:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MGcbvCrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BAF10ECEA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:21:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7277FCE1360;
 Thu,  2 May 2024 07:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD48C113CC;
 Thu,  2 May 2024 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714634493;
 bh=tX69CvEtAwgo4XZ4l/Uep5L3565GREJ/19F+uS2/KpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MGcbvCrQDirSeDnPM0TpNimb91ucNM+8g3bD+PgHyc9ntVB+g2zov+7PyIdYgkvsU
 jtz4hactVTRvJISbUNUhpKLI+BBX6iqpPrUpbDLCcpvjR7DDeFB0R05Ou0BZh5TP83
 zhNKgRAdqM3mz/ke21ppHndeEXLoUBxjXf3wJ0WzpkBfzGYq25aX6HVu2Dx5RVmTyI
 20/F1/pZ70UB763380hHv6L+yrovyv0fDZcNO0MbOeSBT8MK4gpXlYosj28jQEEjsd
 i8xKnp6Z1NSnVOYsRSYFSbcVk4KpQIdp2hl3cYk4nUdwg5CfvMIUB1wnDtVletoO01
 /tNAKvXRfu0xQ==
Date: Thu, 2 May 2024 08:21:26 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 19/19] const_structs.checkpatch: add lcd_ops
Message-ID: <20240502072126.GC5338@google.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
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

On Wed, 24 Apr 2024, Krzysztof Kozlowski wrote:

> 'struct lcd_ops' is not modified by core code.
> 
> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Patch making lcd_ops const in progress:
> https://lore.kernel.org/r/20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  scripts/const_structs.checkpatch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/const_structs.checkpatch b/scripts/const_structs.checkpatch
> index fa96cfd16e99..52e5bfb61fd0 100644
> --- a/scripts/const_structs.checkpatch
> +++ b/scripts/const_structs.checkpatch
> @@ -39,6 +39,7 @@ kgdb_arch
>  kgdb_io
>  kobj_type
>  kset_uevent_ops
> +lcd_ops

Acked-by: Lee Jones <lee@kernel.org>

>  lock_manager_operations
>  machine_desc
>  microcode_ops

-- 
Lee Jones [李琼斯]
