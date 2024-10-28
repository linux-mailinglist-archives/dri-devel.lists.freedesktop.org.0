Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A579B3584
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9382210E50A;
	Mon, 28 Oct 2024 15:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4DB10E50A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:58:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t5S83-0004iB-5W; Mon, 28 Oct 2024 16:58:03 +0100
Message-ID: <3ee89e2d2263836de587e41c74370f6eb38de174.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Drop the 'struct
 etnaviv_iommu_global::pta_lock' data member
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 16:58:02 +0100
In-Reply-To: <20241025175136.414054-1-sui.jingfeng@linux.dev>
References: <20241025175136.414054-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Samstag, dem 26.10.2024 um 01:51 +0800 schrieb Sui Jingfeng:
> Because it is not get used, drop it.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Thanks, applied to etnaviv/next.

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.h
> index c01a147f0dfd..7f8ac0178547 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
> @@ -61,7 +61,6 @@ struct etnaviv_iommu_global {
>  			/* P(age) T(able) A(rray) */
>  			u64 *pta_cpu;
>  			dma_addr_t pta_dma;
> -			struct spinlock pta_lock;
>  			DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
>  		} v2;
>  	};

