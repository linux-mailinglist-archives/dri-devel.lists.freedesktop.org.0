Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19680C19E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 08:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0C510E14D;
	Mon, 11 Dec 2023 07:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AF310E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:02:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1rCaJ9-0000gN-3W; Mon, 11 Dec 2023 08:02:27 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1rCaJ6-00F2lD-2c; Mon, 11 Dec 2023 08:02:24 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1rCaJ5-006Q6S-WA; Mon, 11 Dec 2023 08:02:24 +0100
Date: Mon, 11 Dec 2023 08:02:23 +0100
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v4 13/17] drm/rockchip: vop2: rename
 VOP_FEATURE_OUTPUT_10BIT to VOP2_VP_FEATURE_OUTPUT_10BIT
Message-ID: <20231211070223.GE1318922@pengutronix.de>
References: <20231207075906.651771-1-andyshrk@163.com>
 <20231207080210.652594-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207080210.652594-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 04:02:10PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> VOP2 has multiple independent video ports with different
> feature, so rename VOP_FEATURE_OUTPUT_10BIT to
> VOP2_VP_FEATURE_OUTPUT_10BIT for more clearly meaning.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> (no changes since v1)
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index edca7723335f..2b996f1a25ad 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1995,7 +1995,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  		return;
>  
>  	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
> -	    !(vp_data->feature & VOP_FEATURE_OUTPUT_10BIT))
> +	    !(vp_data->feature & VOP2_VP_FEATURE_OUTPUT_10BIT))
>  		out_mode = ROCKCHIP_OUT_MODE_P888;
>  	else
>  		out_mode = vcstate->output_mode;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index 2763e54350a9..615a16196aff 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -11,7 +11,7 @@
>  #include <drm/drm_modes.h>
>  #include "rockchip_drm_vop.h"
>  
> -#define VOP_FEATURE_OUTPUT_10BIT        BIT(0)
> +#define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)
>  
>  #define VOP2_FEATURE_HAS_SYS_GRF	BIT(0)
>  #define VOP2_FEATURE_HAS_VO0_GRF	BIT(1)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 275d265891db..48170694ac6b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -136,7 +136,7 @@ static const uint64_t format_modifiers_afbc[] = {
>  static const struct vop2_video_port_data rk3568_vop_video_ports[] = {
>  	{
>  		.id = 0,
> -		.feature = VOP_FEATURE_OUTPUT_10BIT,
> +		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
>  		.gamma_lut_len = 1024,
>  		.cubic_lut_len = 9 * 9 * 9,
>  		.max_output = { 4096, 2304 },
> @@ -263,7 +263,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
>  	{
>  		.id = 0,
> -		.feature = VOP_FEATURE_OUTPUT_10BIT,
> +		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
>  		.gamma_lut_len = 1024,
>  		.cubic_lut_len = 9 * 9 * 9, /* 9x9x9 */
>  		.max_output = { 4096, 2304 },
> @@ -272,7 +272,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
>  		.offset = 0xc00,
>  	}, {
>  		.id = 1,
> -		.feature = VOP_FEATURE_OUTPUT_10BIT,
> +		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
>  		.gamma_lut_len = 1024,
>  		.cubic_lut_len = 729, /* 9x9x9 */
>  		.max_output = { 4096, 2304 },
> @@ -280,7 +280,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
>  		.offset = 0xd00,
>  	}, {
>  		.id = 2,
> -		.feature = VOP_FEATURE_OUTPUT_10BIT,
> +		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
>  		.gamma_lut_len = 1024,
>  		.cubic_lut_len = 17 * 17 * 17, /* 17x17x17 */
>  		.max_output = { 4096, 2304 },
> -- 
> 2.34.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
