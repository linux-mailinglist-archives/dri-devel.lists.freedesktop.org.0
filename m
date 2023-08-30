Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D378D524
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422CC88FAE;
	Wed, 30 Aug 2023 10:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721C10E4E9;
 Wed, 30 Aug 2023 10:35:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D5A4F6607236;
 Wed, 30 Aug 2023 11:35:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693391717;
 bh=KZarq9IFVHe9P2TumUzb/mQlXyao/cCu6/Rbx6Q3Nyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YfVsk8X7VNMGYXNgW/cDHU4E153/CP3CtOk45NFNGR65Vp6P/f9KXRLLj+nZmEFBc
 nBGdE7ACLkrM8cE+XKXAn0ek6I+GBHYMH+Ua0u5aVyC09rbxMBTPw9AM8b9rkOZMYc
 p6u1CLmYyj5kku4TXSNU5M+RkOAVh/HYcXmDieg7U8QRi6UX1lE2li+Sy0N9JQqE9r
 jkzu79p+Lc8F+jNomNnX8LhNACanNZ2RVbFFkOEipWzXKXK1phr8xmcbRYZ5NzWkra
 9xd2KqLzpK6AUY/vfv6UY0i5pcL3XjzAXPrl+OgTHKNnCCebBtbz2EKgdW8zqov7F1
 QiFeHv1OnQgjg==
Date: Wed, 30 Aug 2023 12:35:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v2 1/6] drm/panfrost: Add cycle count GPU register
 definitions
Message-ID: <20230830123514.28c0180f@collabora.com>
In-Reply-To: <20230824013604.466224-2-adrian.larumbe@collabora.com>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023 02:34:44 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> These GPU registers will be used when programming the cycle counter, which
> we need for providing accurate fdinfo drm-cycles values to user space.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_regs.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/p=
anfrost/panfrost_regs.h
> index 919f44ac853d..55ec807550b3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -46,6 +46,8 @@
>  #define   GPU_CMD_SOFT_RESET		0x01
>  #define   GPU_CMD_PERFCNT_CLEAR		0x03
>  #define   GPU_CMD_PERFCNT_SAMPLE	0x04
> +#define   GPU_CMD_CYCLE_COUNT_START	0x05
> +#define   GPU_CMD_CYCLE_COUNT_STOP	0x06
>  #define   GPU_CMD_CLEAN_CACHES		0x07
>  #define   GPU_CMD_CLEAN_INV_CACHES	0x08
>  #define GPU_STATUS			0x34
> @@ -73,6 +75,9 @@
>  #define GPU_PRFCNT_TILER_EN		0x74
>  #define GPU_PRFCNT_MMU_L2_EN		0x7c
> =20
> +#define GPU_CYCLE_COUNT_LO		0x90
> +#define GPU_CYCLE_COUNT_HI		0x94
> +
>  #define GPU_THREAD_MAX_THREADS		0x0A0	/* (RO) Maximum number of threads =
per core */
>  #define GPU_THREAD_MAX_WORKGROUP_SIZE	0x0A4	/* (RO) Maximum workgroup si=
ze */
>  #define GPU_THREAD_MAX_BARRIER_SIZE	0x0A8	/* (RO) Maximum threads waitin=
g at a barrier */

