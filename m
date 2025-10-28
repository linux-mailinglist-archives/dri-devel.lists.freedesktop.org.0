Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B620C16126
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0025810E614;
	Tue, 28 Oct 2025 17:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="GiVAfAnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359510E614
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=7LWklCXBZ9rh4qRNHyKteNj5PyRzjPuuzm/a8ueDOZE=; t=1761671552;
 x=1762276352; b=GiVAfAnbOJPnQv3YAcIlyrqS/1UyKTvvRaOjosE3aTPrX3kxuLkjIstr0Vjo2
 EEHlnl2ZhArOs3x5f5zKDWDFONY06kW1jkQ9zCbszM7AJpHdw/6V0wZ6Iiv/DReX0MzBMwyTrzKc3
 /YQIuvBjltUihwKRTtYn8Pei+4vd57ADt0tGwCAgBwZaGkDlKqpR4FEChiUZkxsSaghYx4Xl5jhmZ
 MfYZxHmLzH5VPBfhF6BsoZEeh52xEpGpaTlle30QwGudOJeUI4C/W77ZJRQqoDMqetopwQ74ELQvU
 kCz0qvP7DLrmV7FOhC4K5CnKvTXP+Pwie6Ry2tXREyCAtGD7xw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vDnFE-000000039yM-05up; Tue, 28 Oct 2025 18:12:28 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.98)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vDnFD-00000003bUb-3CE6; Tue, 28 Oct 2025 18:12:27 +0100
Message-ID: <d2fc41710dcf9bac245303b51d0cdc7ea2186910.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] arch: sh: Include <linux/io.h> in dac.h
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, ysato@users.sourceforge.jp, 
 dalias@libc.org, lee@kernel.org, danielt@kernel.org, simona.vetter@ffwll.ch
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel test
 robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>, Artur Rojek
 <contact@artur-rojek.eu>
Date: Tue, 28 Oct 2025 18:12:26 +0100
In-Reply-To: <20251028170913.16711-1-tzimmermann@suse.de>
References: <20251028170913.16711-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
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

Hi Thomas,

On Tue, 2025-10-28 at 18:07 +0100, Thomas Zimmermann wrote:
> Include <linux/io.h> to avoid depending on <linux/backlight.h> for
> including it. Declares __raw_readb() and __raw_writeb().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-lkp@i=
ntel.com/
> Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header fi=
le")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
> This is fallout from a recent cleanup of the backlight header file. I don=
't
> have the option of building or testing this change, though.
> ---
>  arch/sh/include/cpu-sh3/cpu/dac.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/sh/include/cpu-sh3/cpu/dac.h b/arch/sh/include/cpu-sh3/=
cpu/dac.h
> index fd02331608a8..323ec8570bcd 100644
> --- a/arch/sh/include/cpu-sh3/cpu/dac.h
> +++ b/arch/sh/include/cpu-sh3/cpu/dac.h
> @@ -2,6 +2,8 @@
>  #ifndef __ASM_CPU_SH3_DAC_H
>  #define __ASM_CPU_SH3_DAC_H
> =20
> +#include <linux/io.h>
> +
>  /*
>   * Copyright (C) 2003  Andriy Skulysh
>   */

I'll perform a test build tomorrow. And I think I should be able to test it=
 on my
HP Jornada 680 which is based on a SH-3 CPU.

CC'ing Artur Rojek who's got the same model and previously worked on the SH=
-3 code.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
