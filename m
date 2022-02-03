Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0824A87AE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58110E879;
	Thu,  3 Feb 2022 15:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3E810E708
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:27:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 00aaacc0-8506-11ec-b20b-0050568c148b;
 Thu, 03 Feb 2022 15:28:56 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9B098194BA4;
 Thu,  3 Feb 2022 16:27:56 +0100 (CET)
Date: Thu, 3 Feb 2022 16:27:54 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: crtc: Fix redundant variable assignment
Message-ID: <Yfv0eq1vzLvCXfoN@ravnborg.org>
References: <20220203151151.1270461-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203151151.1270461-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 kernel test robot <yujie.liu@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 04:11:51PM +0100, Maxime Ripard wrote:
> The variable is assigned twice to the same value. Let's drop one.
> 
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 287dbc89ad64..e6cc47470e03 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -671,7 +671,6 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
>  		const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>  
> -		mode = &crtc_state->adjusted_mode;
>  		if (vc4_encoder->type == VC4_ENCODER_TYPE_HDMI0) {
>  			vc4_state->hvs_load = max(mode->clock * mode->hdisplay / mode->htotal + 1000,
>  						  mode->clock * 9 / 10) * 1000;
> -- 
> 2.34.1
