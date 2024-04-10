Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7459E89EA57
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 08:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758BD10E20B;
	Wed, 10 Apr 2024 06:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="E7A2hrZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FF610E467
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 06:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iyv16hWRHZzEEz1F1Ju8eyH1IhWSZfvgpoNi9jnQC9g=; b=E7A2hrZpg3YQ88MCsNbFtsQolT
 5s1qNW1UjMhNjii/9Asa/qo8Xe5OOVTeAWMhcTCy1SpjOlNZydxIO/5IUj2+MEIbofyfMYI1GAFs0
 gm1Qoqqnck1QMkPOnALwURazRz2WwrNwi6P94HpN7iuD8H4GFVDUgRFdYsmAcihPT0oPQ3RWvat4g
 PaIKnwHiDVCXGdAl7YS/PJvWLIl51TQr7QoRBQ0gcadwcFixf09DL2vaFPVScOme+26nbpE9h+48Q
 LMUnoN+MaeWHsvwUjXHUuFKB1pUAgRoHCv7kGbgHXE8dvnwcwPAfphGhJUtTOAqBMvxCqG6Eg1loj
 jWAjze0Q==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sarha@kapsi.fi>) id 1ruR7G-002OAS-30;
 Wed, 10 Apr 2024 09:07:27 +0300
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 06:07:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <8ef8767d020d878c02aa9a834b57ba3f177a8804@kapsi.fi>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
References: undefined
 <20240408170426.9285-1-ville.syrjala@linux.intel.com>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH 12/21] drm/tilcdc: Allow build without __iowmb()
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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

April 8, 2024 at 8:04 PM, "Ville Syrjala" <ville.syrjala@linux.intel.com =
mailto:ville.syrjala@linux.intel.com?to=3D%22Ville%20Syrjala%22%20%3Cvill=
e.syrjala%40linux.intel.com%3E > wrote:

>=20
>=20From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
>=20__iowmb() isn't available on most architectures. Make
> its use optional so that the driver can be built on
> other architectures with COMPILE_TEST=3Dy.
>=20
>=20Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

Thanks,
Jyri

> ---
> drivers/gpu/drm/tilcdc/tilcdc_regs.h | 2 ++
> 1 file changed, 2 insertions(+)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/t=
ilcdc/tilcdc_regs.h
> index f90e2dc3457c..44e4ada30fba 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
> @@ -125,7 +125,9 @@ static inline void tilcdc_write64(struct drm_device=
 *dev, u32 reg, u64 data)
> #if defined(iowrite64) !defined(iowrite64_is_nonatomic)
>  iowrite64(data, addr);
> #else
> +#ifdef __iowmb
>  __iowmb();
> +#endif
>  /* This compiles to strd (=3D64-bit write) on ARM7 */
>  *(volatile u64 __force *)addr =3D __cpu_to_le64(data);
> #endif
> --=20
>=202.43.2
>
