Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1ABAB16FC
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6558A10E0CB;
	Fri,  9 May 2025 14:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85B0E10E0CB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 14:14:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A2A61595;
 Fri,  9 May 2025 07:14:44 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B3413F5A1;
 Fri,  9 May 2025 07:14:52 -0700 (PDT)
Date: Fri, 9 May 2025 15:14:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ryan@testtoast.com,
 macromorgan@hotmail.com, p.zabel@pengutronix.de, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com,
 wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
Message-ID: <20250509151448.3191a3d8@donnerap.manchester.arm.com>
In-Reply-To: <20250507201943.330111-3-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250507201943.330111-3-macroalpha82@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed,  7 May 2025 15:19:21 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi,

despite the slightly ill fate of this series, I was wondering if we could
get the non-controversial clock parts for instance already merged, to
reduce the number of patches and mitigate the churn with dependencies?

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the required LVDS reset for the LCD TCON. Note that while this
> reset is exposed for the T507, H616, and H700 only the H700 has
> an LCD controller.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Matches the T507 manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index daa462c7d477..955c614830fa 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_ccu_resets[] = {
>  	[RST_BUS_TCON_LCD1]	= { 0xb7c, BIT(17) },
>  	[RST_BUS_TCON_TV0]	= { 0xb9c, BIT(16) },
>  	[RST_BUS_TCON_TV1]	= { 0xb9c, BIT(17) },
> +	[RST_BUS_LVDS]		= { 0xbac, BIT(16) },
>  	[RST_BUS_TVE_TOP]	= { 0xbbc, BIT(16) },
>  	[RST_BUS_TVE0]		= { 0xbbc, BIT(17) },
>  	[RST_BUS_HDCP]		= { 0xc4c, BIT(16) },

