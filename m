Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F4EC161B1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750A10E61A;
	Tue, 28 Oct 2025 17:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WZB0Vgti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C9710E61A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:19:49 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD405E77;
 Tue, 28 Oct 2025 18:17:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761671879;
 bh=rozXxNS8mX4eTCpT7j98yacmLPk7DwfKXcRX3sfR5PM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WZB0VgtiNGkPrxGJpfeVBVjh7KA5MR8+mCecfG3KN7Oq+oIHwgHP4zVDK2FOjjRXY
 hDqcv1hwV66Wzsz8aWwegEyrtwoYZeC0PJ4gZx7EiLAkELVVSu4iuYCifkka8iOoeG
 lh/5TG2dGEcUGXH2ToO86zydSocK+Rk+98CxKSnQ=
Message-ID: <af50732c-07d1-4f03-a9d4-dcbf4bbf6582@ideasonboard.com>
Date: Tue, 28 Oct 2025 19:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] drm/rcar-du: dsi: Document PHTR TESTDOUT as
 bitfield
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-4-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251005030355.202242-4-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 05/10/2025 06:02, Marek Vasut wrote:
> The register PHTR bitfield TESTDOUT is not a single bit, but a
> bitfield. Add a MASK macro and a _TEST bitfield value, which is
> used by the driver to poll for completion. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V3: New patch
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 4 ++--
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 5c73a513f678e..c24721a1eddf2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -316,8 +316,8 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
>  		WRITE_PHTW(0x01020100, 0x00000180);
>  
>  		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> -					status & PHTR_TEST, 2000, 10000, false,
> -					dsi, PHTR);
> +					status & PHTR_TESTDOUT_TEST,
> +					2000, 10000, false, dsi, PHTR);
>  		if (ret < 0) {
>  			dev_err(dsi->dev, "failed to test PHTR\n");
>  			return ret;
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index b8a719a13c006..90e8e3de3e580 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -293,7 +293,8 @@
>  #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
>  
>  #define PHTR				0x1038
> -#define PHTR_TEST			(1 << 16)
> +#define PHTW_TESTDOUT			(0xff << 16)

Should this be PHTR_TESTDOUT?

> +#define PHTR_TESTDOUT_TEST		(1 << 16)
>  
>  #define PHTC				0x103c
>  #define PHTC_TESTCLR			(1 << 0)

