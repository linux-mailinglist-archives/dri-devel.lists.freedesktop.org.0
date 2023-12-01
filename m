Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4852801B28
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 08:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CEF10E074;
	Sat,  2 Dec 2023 07:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 91088 seconds by postgrey-1.36 at gabe;
 Sat, 02 Dec 2023 07:31:48 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BF610E074
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 07:31:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B16DSK5082436;
 Fri, 1 Dec 2023 00:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1701411208;
 bh=rB1XmTGzoDJq5odP3oGC6AWHoMG4DmhTDFrwngnRKbo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=xmxsdO2X8yuSU30NV85rSXkx/XiVAW+559cW8D+MqgEVi1Qz+rsgZ/te1Bp+johuz
 Ybqb1pEVFOD897GraRJycluBy8j6M0jm2VpWeBpFbeQBTmJBEL88F/6YwO7egfNTAO
 ojXMQhmSR6+LeMIrUp+QikplcI8MeYfpW9CXbi9Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B16DSLh075933
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Dec 2023 00:13:28 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Dec 2023 00:13:27 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Dec 2023 00:13:27 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B16DR0l084648;
 Fri, 1 Dec 2023 00:13:27 -0600
Date: Fri, 1 Dec 2023 00:13:27 -0600
From: Nishanth Menon <nm@ti.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Message-ID: <20231201061327.mfadiwejp5akmlal@properly>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19:29-20231128, Geert Uytterhoeven wrote:
> The Imagination Technologies PowerVR Series 6 GPU is currently only
> supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependency on
> ARCH_K3, to prevent asking the user about this driver when configuring a
> kernel without Texas Instruments K3 Multicore SoC support.
> 
> Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR driver")

Minor nitpick here - 12 char sha.. otherwise:

Reviewed-by: Nishanth Menon <nm@ti.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/imagination/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
> index 3bfa2ac212dccb73..af492dbd9afd4ed9 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -6,6 +6,7 @@ config DRM_POWERVR
>  	depends on ARM64
>  	depends on DRM
>  	depends on PM
> +	depends on ARCH_K3 || COMPILE_TEST
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_SCHED
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
