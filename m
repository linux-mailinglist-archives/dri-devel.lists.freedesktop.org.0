Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF01AAC06
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777586EA1D;
	Wed, 15 Apr 2020 15:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5E06EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:40:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BCE62D1;
 Wed, 15 Apr 2020 17:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586965212;
 bh=BMc0UjmXRz760BpBGzK5lNlt1pjOrdG2fEpiQi+Os7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DugdLxZ0613/Mqc867UaJNpk6wWeA0CQsZ724aCSEee3RBW/KTvwQQvEoceJfh3kD
 Pf03mlM5P2F9pm4qSnEe0O6UNoWwtxReFDUrB3OLxL3J0CFM//NOwhdHa/OZ+lLzzC
 eHPU91lFZH+Q+Ui1TUTfkHFi8lZxOyS+YrHwBvuk=
Date: Wed, 15 Apr 2020 18:39:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/omap: venc: remove unused variable
 'venc_config_pal_bdghi'
Message-ID: <20200415153959.GI4758@pendragon.ideasonboard.com>
References: <20200415132105.43636-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415132105.43636-1-yuehaibing@huawei.com>
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
Cc: airlied@linux.ie, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yue,

Thank you for the patch.

On Wed, Apr 15, 2020 at 09:21:05PM +0800, YueHaibing wrote:
> drivers/gpu/drm/omapdrm/dss/venc.c:211:33:
>  warning: 'venc_config_pal_bdghi' defined but not used [-Wunused-const-variable=]
>  static const struct venc_config venc_config_pal_bdghi = {
>                                  ^~~~~~~~~~~~~~~~~~~~~
> 
> It is never used, remove it.

Tomi, is this the right fix, or should we work on making use of this
structure ?

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/venc.c | 43 ------------------------------
>  1 file changed, 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 766553bb2f87..9701843ccf09 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -208,49 +208,6 @@ static const struct venc_config venc_config_ntsc_trm = {
>  	.gen_ctrl				= 0x00F90000,
>  };
>  
> -static const struct venc_config venc_config_pal_bdghi = {
> -	.f_control				= 0,
> -	.vidout_ctrl				= 0,
> -	.sync_ctrl				= 0,
> -	.hfltr_ctrl				= 0,
> -	.x_color				= 0,
> -	.line21					= 0,
> -	.ln_sel					= 21,
> -	.htrigger_vtrigger			= 0,
> -	.tvdetgp_int_start_stop_x		= 0x00140001,
> -	.tvdetgp_int_start_stop_y		= 0x00010001,
> -	.gen_ctrl				= 0x00FB0000,
> -
> -	.llen					= 864-1,
> -	.flens					= 625-1,
> -	.cc_carr_wss_carr			= 0x2F7625ED,
> -	.c_phase				= 0xDF,
> -	.gain_u					= 0x111,
> -	.gain_v					= 0x181,
> -	.gain_y					= 0x140,
> -	.black_level				= 0x3e,
> -	.blank_level				= 0x3e,
> -	.m_control				= 0<<2 | 1<<1,
> -	.bstamp_wss_data			= 0x42,
> -	.s_carr					= 0x2a098acb,
> -	.l21__wc_ctl				= 0<<13 | 0x16<<8 | 0<<0,
> -	.savid__eavid				= 0x06A70108,
> -	.flen__fal				= 23<<16 | 624<<0,
> -	.lal__phase_reset			= 2<<17 | 310<<0,
> -	.hs_int_start_stop_x			= 0x00920358,
> -	.hs_ext_start_stop_x			= 0x000F035F,
> -	.vs_int_start_x				= 0x1a7<<16,
> -	.vs_int_stop_x__vs_int_start_y		= 0x000601A7,
> -	.vs_int_stop_y__vs_ext_start_x		= 0x01AF0036,
> -	.vs_ext_stop_x__vs_ext_start_y		= 0x27101af,
> -	.vs_ext_stop_y				= 0x05,
> -	.avid_start_stop_x			= 0x03530082,
> -	.avid_start_stop_y			= 0x0270002E,
> -	.fid_int_start_x__fid_int_start_y	= 0x0005008A,
> -	.fid_int_offset_y__fid_ext_start_x	= 0x002E0138,
> -	.fid_ext_start_y__fid_ext_offset_y	= 0x01380005,
> -};
> -
>  enum venc_videomode {
>  	VENC_MODE_UNKNOWN,
>  	VENC_MODE_PAL,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
