Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163FAA7A068
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 11:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D40910E983;
	Thu,  3 Apr 2025 09:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X1iyRanl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D6610E983
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 09:49:26 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51FF18FA;
 Thu,  3 Apr 2025 11:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743673651;
 bh=+5dvzEljs9PNks21D8dmV0hwjqMqGRIVi4aH21E58b0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X1iyRanl0mtpqsDh5lFOxHf2isqTL+7CQj2O6StvNUjxDoH2hitBEzitNI7KVuM/d
 yAdAq3o1QajTHybMDk5Zeaes2ap7R5BXE0+vFBLoNeD617aA1hhprU1rx/VR6bn2ew
 V4RofqsVbbrsKUh6b01yVZ88kFvILHMLDyyA+fpw=
Message-ID: <931a519e-605e-4f53-9a03-43b8d53ed987@ideasonboard.com>
Date: Thu, 3 Apr 2025 12:49:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 13/14] drm/bridge: Update the bridge enable/disable doc
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Dominik Haller <d.haller@phytec.de>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
 <20250329115333.72614-3-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250329115333.72614-3-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 29/03/2025 13:53, Aradhya Bhatia wrote:
> Now that the bridges get pre-enabled before the CRTC is enabled, and get
> post-disabled after the CRTC is disabled, update the function
> descriptions to accurately reflect the updated scenario.
> 
> The enable sequence for the display pipeline looks like:
> 
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
> 
> 	crtc_enable
> 	encoder_enable
> 
> 	bridge[1]_enable
> 	...
> 	bridge[n]_enable
> 
> And, the disable sequence for the display pipeline looks like:
> 
> 	bridge[n]_disable
> 	...
> 	bridge[1]_disable
> 
> 	encoder_disable
> 	crtc_disable
> 
> 	bridge[1]_post_disable
> 	...
> 	bridge[n]_post_disable
> 
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>   include/drm/drm_bridge.h | 216 +++++++++++++++++++++++++++------------
>   1 file changed, 150 insertions(+), 66 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index cdad3b78a195..fc126562733c 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -164,17 +164,28 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right before
> -	 * the preceding element in the display pipe is disabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @disable vfunc. If the preceding element is a &drm_encoder
> -	 * it's called right before the &drm_encoder_helper_funcs.disable,
> -	 * &drm_encoder_helper_funcs.prepare or &drm_encoder_helper_funcs.dpms
> -	 * hook.
> +	 * The @disable callback should disable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is still running when this callback is called.
>   	 *
> +	 * It is called right before the preceding element in the display pipe
> +	 * is disabled. If the preceding element is a &drm_bridge, then it's
> +	 * called before that bridge is disabled.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right before the encoder and the CRTC are disabled via the
> +	 * following hooks.
> +	 * &drm_encoder_helper_funcs.atomic_disable, or
> +	 * &drm_encoder_helper_funcs.prepare, or
> +	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
> +	 * hook for the encoder, and
> +	 * &drm_crtc_helper_funcs.prepare, or
> +	 * &drm_crtc_helper_funcs.atomic_disable, or
> +	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
> +	 * for the CRTC.
> +	 *

This is quite difficult to read. Maybe something like:

It is called right before the preceding element in the display pipe is
disabled.

If the preceding element is a &drm_bridge, then this is called before
that bridge is disabled via one of:

- &drm_bridge_funcs.disable
- &drm_bridge_funcs.atomic_disable

If the preceding element of the bridge is a display controller, then
this callback is called right before the encoder is disabled via one of:

- &drm_encoder_helper_funcs.atomic_disable
- &drm_encoder_helper_funcs.prepare
- &drm_encoder_helper_funcs.disable
- &drm_encoder_helper_funcs.dpms

and the CRTC are disabled via one of:

- &drm_crtc_helper_funcs.atomic_disable
- &drm_crtc_helper_funcs.prepare
- &drm_crtc_helper_funcs.disable
- &drm_crtc_helper_funcs.dpms hook

  Tomi

>   	 * The @disable callback is optional.
>   	 *
>   	 * NOTE:
> @@ -187,17 +198,30 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @post_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right after the
> -	 * preceding element in the display pipe is disabled. If the preceding
> -	 * element is a bridge this means it's called after that bridge's
> -	 * @post_disable function. If the preceding element is a &drm_encoder
> -	 * it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.disable, &drm_encoder_helper_funcs.prepare
> -	 * or &drm_encoder_helper_funcs.dpms hook.
> -	 *
>   	 * The bridge must assume that the display pipe (i.e. clocks and timing
> -	 * signals) feeding it is no longer running when this callback is
> -	 * called.
> +	 * signals) feeding this bridge is no longer running when the
> +	 * @post_disable is called.
> +	 *
> +	 * This callback should perform all the actions required by the hardware
> +	 * after it has stopped receiving signals from the preceding element.
> +	 *
> +	 * It is called right after the preceding element is post-disabled, and
> +	 * right before the following element gets post-disabled (given that the
> +	 * preceding and following elements are &drm_bridges), unless marked
> +	 * otherwise by the @pre_enable_prev_first flag.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right after the encoder and the CRTC are disabled via the
> +	 * following hooks.
> +	 * &drm_encoder_helper_funcs.atomic_disable, or
> +	 * &drm_encoder_helper_funcs.prepare, or
> +	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
> +	 * hook for the encoder, and
> +	 * &drm_crtc_helper_funcs.prepare, or
> +	 * &drm_crtc_helper_funcs.atomic_disable, or
> +	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
> +	 * for the CRTC.
>   	 *
>   	 * The @post_disable callback is optional.
>   	 *
> @@ -240,18 +264,26 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @pre_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right before
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @pre_enable function. If the preceding element is a
> -	 * &drm_encoder it's called right before the encoder's
> -	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
> -	 * &drm_encoder_helper_funcs.dpms hook.
> -	 *
>   	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> -	 * will not yet be running when this callback is called. The bridge must
> -	 * not enable the display link feeding the next bridge in the chain (if
> -	 * there is one) when this callback is called.
> +	 * will not yet be running when the @pre_enable is called.
> +	 *
> +	 * This callback should perform all the necessary actions to prepare the
> +	 * bridge to accept signals from the preceding element.
> +	 *
> +	 * It is called right after the following element is pre-enabled, and
> +	 * right before the preceding element gets pre-enabled (given that the
> +	 * following and preceding elements are &drm_bridges), unless marked
> +	 * otherwise by @pre_enable_prev_first flag.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right before the CRTC and the encoder are enabled via these
> +	 * hooks.
> +	 * &drm_crtc_helper_funcs.atomic_enable, or
> +	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
> +	 * &drm_encoder_helper_funcs.atomic_enable, or
> +	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
> +	 * hook for the encoder.
>   	 *
>   	 * The @pre_enable callback is optional.
>   	 *
> @@ -265,19 +297,27 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right after
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called after that
> -	 * bridge's @enable function. If the preceding element is a
> -	 * &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
> -	 * &drm_encoder_helper_funcs.dpms hook.
> +	 * The @enable callback should enable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is running when this callback is called. This
>   	 * callback must enable the display link feeding the next bridge in the
>   	 * chain if there is one.
>   	 *
> +	 * It is called right after the preceding element in the display pipe is
> +	 * enabled. If the preceding element is a &drm_bridge, then it's called
> +	 * after that bridge is enabled.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right after the CRTC and the encoder are enabled via these
> +	 * hooks.
> +	 * &drm_crtc_helper_funcs.atomic_enable, or
> +	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
> +	 * &drm_encoder_helper_funcs.atomic_enable, or
> +	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
> +	 * hook for the encoder.
> +	 *
>   	 * The @enable callback is optional.
>   	 *
>   	 * NOTE:
> @@ -290,17 +330,26 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_pre_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right before
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
> -	 * element is a &drm_encoder it's called right before the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_enable hook.
> -	 *
>   	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> -	 * will not yet be running when this callback is called. The bridge must
> -	 * not enable the display link feeding the next bridge in the chain (if
> -	 * there is one) when this callback is called.
> +	 * will not yet be running when the @atomic_pre_enable is called.
> +	 *
> +	 * This callback should perform all the necessary actions to prepare the
> +	 * bridge to accept signals from the preceding element.
> +	 *
> +	 * It is called right after the following element is pre-enabled, and
> +	 * right before the preceding element gets pre-enabled (given that the
> +	 * following and preceding elements are &drm_bridges), unless marked
> +	 * otherwise by @pre_enable_prev_first flag.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right before the CRTC and the encoder are enabled via these
> +	 * hooks.
> +	 * &drm_crtc_helper_funcs.atomic_enable, or
> +	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
> +	 * &drm_encoder_helper_funcs.atomic_enable, or
> +	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
> +	 * hook for the encoder.
>   	 *
>   	 * The @atomic_pre_enable callback is optional.
>   	 */
> @@ -310,18 +359,27 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right after
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called after that
> -	 * bridge's @atomic_enable or @enable function. If the preceding element
> -	 * is a &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_enable hook.
> +	 * The @atomic_enable callback should enable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is running when this callback is called. This
>   	 * callback must enable the display link feeding the next bridge in the
>   	 * chain if there is one.
>   	 *
> +	 * It is called right after the preceding element in the display pipe is
> +	 * enabled. If the preceding element is a &drm_bridge, then it's called
> +	 * after that bridge is enabled.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right after the CRTC and the encoder are enabled via these
> +	 * hooks.
> +	 * &drm_crtc_helper_funcs.atomic_enable, or
> +	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
> +	 * &drm_encoder_helper_funcs.atomic_enable, or
> +	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
> +	 * hook for the encoder.
> +	 *
>   	 * The @atomic_enable callback is optional.
>   	 */
>   	void (*atomic_enable)(struct drm_bridge *bridge,
> @@ -329,16 +387,28 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right before
> -	 * the preceding element in the display pipe is disabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
> -	 * is a &drm_encoder it's called right before the
> -	 * &drm_encoder_helper_funcs.atomic_disable hook.
> +	 * The @atomic_disable callback should disable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is still running when this callback is called.
>   	 *
> +	 * It is called right before the preceding element in the display pipe
> +	 * is disabled. If the preceding element is a &drm_bridge, then it's
> +	 * called before that bridge is disabled.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right before the encoder and the CRTC are disabled via the
> +	 * following hooks.
> +	 * &drm_encoder_helper_funcs.atomic_disable, or
> +	 * &drm_encoder_helper_funcs.prepare, or
> +	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
> +	 * hook for the encoder, and
> +	 * &drm_crtc_helper_funcs.prepare, or
> +	 * &drm_crtc_helper_funcs.atomic_disable, or
> +	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
> +	 * for the CRTC.
> +	 *
>   	 * The @atomic_disable callback is optional.
>   	 */
>   	void (*atomic_disable)(struct drm_bridge *bridge,
> @@ -347,16 +417,30 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_post_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right after the
> -	 * preceding element in the display pipe is disabled. If the preceding
> -	 * element is a bridge this means it's called after that bridge's
> -	 * @atomic_post_disable or @post_disable function. If the preceding
> -	 * element is a &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_disable hook.
> -	 *
>   	 * The bridge must assume that the display pipe (i.e. clocks and timing
> -	 * signals) feeding it is no longer running when this callback is
> -	 * called.
> +	 * signals) feeding this bridge is no longer running when the
> +	 * @atomic_post_disable is called.
> +	 *
> +	 * This callback should perform all the actions required by the hardware
> +	 * after it has stopped receiving signals from the preceding element.
> +	 *
> +	 * It is called right after the preceding element is post-disabled, and
> +	 * right before the following element gets post-disabled (given that the
> +	 * preceding and following elements are &drm_bridges), unless marked
> +	 * otherwise by the @pre_enable_prev_first flag.
> +	 *
> +	 * If the preceding element of the bridge is a display controller, which
> +	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
> +	 * called right after the encoder and the CRTC are disabled via the
> +	 * following hooks.
> +	 * &drm_encoder_helper_funcs.atomic_disable, or
> +	 * &drm_encoder_helper_funcs.prepare, or
> +	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
> +	 * hook for the encoder, and
> +	 * &drm_crtc_helper_funcs.prepare, or
> +	 * &drm_crtc_helper_funcs.atomic_disable, or
> +	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
> +	 * for the CRTC.
>   	 *
>   	 * The @atomic_post_disable callback is optional.
>   	 */

