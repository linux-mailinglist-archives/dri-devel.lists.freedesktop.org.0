Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1629577940
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 03:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269958BBCA;
	Mon, 18 Jul 2022 01:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E00B14BBD0;
 Mon, 18 Jul 2022 01:25:21 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10c0430e27dso20423982fac.4; 
 Sun, 17 Jul 2022 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:reply-to:from:in-reply-to:content-transfer-encoding;
 bh=78EPkjb3iB7JJv7xb3uhC1CDw6+us4UQkGhLurmewqo=;
 b=BgShHSETKTgcsj9HsglNYdBwPdGIgpiWeqFWUvfTxjkdSfMv1MXOF3B3ihOy0wXQnq
 o/ojGs+77U6kFby9GtEpf3aw3ERQR/GRatZBWx8e9DG1zW7HU0xLhROpCEGLnNgEaF68
 I+xsAnQQuaqcMxyRZb5+KBpZdbaUCbrkTRRfU0niFDz2MQDfKXPGsHt4z4yUMecckQLb
 pJBYTqT+rOapOoI2ckufxz+ehn8t2NeTE7+ZSfpeENbLpDyeEcnquhl37osd09vVj+SF
 8bUR4XOESRW+s2DwV7sG2jtKXHAmmMdhqnHLty313dQcKtAqHGV0LxhMIcbdYPC5F5kt
 3beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:reply-to:from:in-reply-to
 :content-transfer-encoding;
 bh=78EPkjb3iB7JJv7xb3uhC1CDw6+us4UQkGhLurmewqo=;
 b=zHni5ONsDlkUSPgds83Y9L5dsZEjyrD2pei72fiv/gME1UOb4N1X4n0Snv7TsBb4ex
 d1h2xXHjtrEaZqx4U4BoTf8re93qHVsr0ZkMtzQaS8jPRBgPvVxaNpZawHgx9sFI/ouG
 dmDaPhnoyfhljA4I0grTAhkS0gqwStM1G8HvBMVgOq/sZD7QcgB/aj11ZEEd34ll77gX
 5ulgSpmaumL3LG75xBDAF/EuIzIaIfizqD9yAU534CAsXQrxXnFm2c8XNDrsG0gYCH+t
 g0+6rstfTCtLpvEqrHFS7MgYCV3z4AKl0pOg/V8F4DaFgI+nSuajsY2tXaUWtxqIoiNL
 ml0Q==
X-Gm-Message-State: AJIora/1qVqU3CGRxVJ3xWOfJdMC/dPyTB4pk71nJwa38MySATxrgFPu
 mn9QxUJgsUR+uHuUYjn2zu0=
X-Google-Smtp-Source: AGRyM1uXOSznd5CDKPRjWt19pf4jv6sYwl8sPU+e83vDASTwLLYOSUiQc3X0aSx4SQ+hz1xtAtEw8Q==
X-Received: by 2002:a05:6808:2008:b0:33a:623f:1d41 with SMTP id
 q8-20020a056808200800b0033a623f1d41mr3753347oiw.124.1658107520002; 
 Sun, 17 Jul 2022 18:25:20 -0700 (PDT)
Received: from ?IPV6:2804:14c:4c2:8202::1003? ([2804:14c:4c2:8202::1003])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a544e8c000000b0033a0ef748a8sm3883031oiy.54.2022.07.17.18.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 18:25:19 -0700 (PDT)
Message-ID: <26ceed85-c9f8-4b01-58e1-f6f1b4250f09@gmail.com>
Date: Sun, 17 Jul 2022 22:25:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] drm/amd/display: add doc entries for MPC blending
 configuration
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-4-mwen@igalia.com>
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
In-Reply-To: <20220716222529.421115-4-mwen@igalia.com>
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
Reply-To: 20220716222529.421115-4-mwen@igalia.com
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/07/2022 19:25, Melissa Wen wrote:
> Describe structs and enums used to set blend mode properties to MPC
> blocks. Some pieces of information are already available as code
> comments, and were just formatted. Others were collected and summarised
> from discusssions on AMD issue tracker[1][2].

Typo in the commit message: discusssions -> discussions

> 
> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/1734
> [2] https://gitlab.freedesktop.org/drm/amd/-/issues/1769
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 91 +++++++++++++++++----
>   1 file changed, 77 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 5097037e3962..cf28b841c42d 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -22,6 +22,16 @@
>    *
>    */
>   
> +/**
> + * DOC: mpc-overview
> + *
> + * Multiple Pipe/Plane Combined (MPC) is a component in the hardware pipeline
> + * that performs blending of multiple planes, using global and per-pixel alpha.
> + * It also performs post-blending color correction operations according to the
> + * hardware capabilities, such as color transformation matrix and gamma 1D and
> + * 3D LUT.
> + */
> +
>   #ifndef __DC_MPCC_H__
>   #define __DC_MPCC_H__
>   
> @@ -48,14 +58,39 @@ enum mpcc_blend_mode {
>   	MPCC_BLEND_MODE_TOP_BOT_BLENDING
>   };
>   
> +/**
> + * enum mpcc_alpha_blend_mode - define the alpha blend mode regarding pixel
> + * alpha and plane alpha values
> + */
>   enum mpcc_alpha_blend_mode {
> +	/**
> +	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA: per pixel alpha using DPP
> +	 * alpha value
> +	 */
>   	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA,
> +	/**
> +	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN: per
> +	 * pixel alpha using DPP alpha value multiplied by a global gain (plane
> +	 * alpha)
> +	 */
>   	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN,
> +	/**
> +	 * @MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA: global alpha value, ignores
> +	 * pixel alpha and consider only plane alpha
> +	 */
>   	MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA
>   };
>   
> -/*
> - * MPCC blending configuration
> +/**
> + * struct mpcc_blnd_cfg - MPCC blending configuration
> + *
> + * @black_color: background color
> + * @alpha_mode: alpha blend mode (MPCC_ALPHA_BLND_MODE)
> + * @pre_multiplied_alpha: whether pixel color values were pre-multiplied by the
> + * alpha channel (MPCC_ALPHA_MULTIPLIED_MODE)
> + * @global_gain: used when blend mode considers both pixel alpha and plane
> + * alpha value and assumes the global alpha value.
> + * @global_alpha: plane alpha value

There's quite a few members missing definition. After reading the 4th 
patch may I conclude that they weren't relevant for what's being 
described about alpha blending?

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function 
parameter or member 'overlap_only' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function 
parameter or member 'bottom_gain_mode' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function 
parameter or member 'background_color_bpc' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function 
parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function 
parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function 
parameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'

>    */
>   struct mpcc_blnd_cfg {
>   	struct tg_color black_color;	/* background color */
> @@ -107,8 +142,15 @@ struct mpc_dwb_flow_control {
>   	int flow_ctrl_cnt1;
>   };
>   
> -/*
> - * MPCC connection and blending configuration for a single MPCC instance.
> +/**
> + * struct mpcc - MPCC connection and blending configuration for a single MPCC instance.

Might be worth writing the definition of the abbreviation, if not here, 
in the glossary... I couldn't find what the last "C" stands for, my 
guess would be "context". hehehe

> + * @mpcc_id: MPCC physical instance
> + * @dpp_id: DPP input to this MPCC
> + * @mpcc_bot: pointer to bottom layer MPCC. NULL when not connected.
> + * @blnd_cfg: the blending configuration for this MPCC
> + * @sm_cfg: stereo mix setting for this MPCC
> + * @shared_bottom: if MPCC output to both OPP and DWB endpoints, true. Othewise, false.

Typo Othewise -> Otherwise

> + *
>    * This struct is used as a node in an MPC tree.
>    */
>   struct mpcc {
> @@ -120,8 +162,12 @@ struct mpcc {
>   	bool shared_bottom;		/* TRUE if MPCC output to both OPP and DWB endpoints, else FALSE */
>   };
>   
> -/*
> - * MPC tree represents all MPCC connections for a pipe.
> +/**
> + * struct mpc_tree - MPC tree represents all MPCC connections for a pipe.
> + *
> + * @opp_id: the OPP instance that owns this MPC tree
> + * @opp_list: the top MPCC layer of the MPC tree that outputs to OPP endpoint
> + *
>    */
>   struct mpc_tree {
>   	int opp_id;			/* The OPP instance that owns this MPC tree */
> @@ -149,13 +195,18 @@ struct mpcc_state {
>   	uint32_t busy;
>   };
>   
> +/**
> + * struct mpc_funcs - funcs
> + */
>   struct mpc_funcs {
>   	void (*read_mpcc_state)(
>   			struct mpc *mpc,
>   			int mpcc_inst,
>   			struct mpcc_state *s);
>   
> -	/*
> +	/**
> +	 * @insert_plane:
> +	 *
>   	 * Insert DPP into MPC tree based on specified blending position.
>   	 * Only used for planes that are part of blending chain for OPP output
>   	 *
> @@ -180,7 +231,9 @@ struct mpc_funcs {
>   			int dpp_id,
>   			int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @remove_mpcc:
> +	 *
>   	 * Remove a specified MPCC from the MPC tree.
>   	 *
>   	 * Parameters:
> @@ -195,7 +248,9 @@ struct mpc_funcs {
>   			struct mpc_tree *tree,
>   			struct mpcc *mpcc);
>   
> -	/*
> +	/**
> +	 * @mpc_init:
> +	 *
>   	 * Reset the MPCC HW status by disconnecting all muxes.
>   	 *
>   	 * Parameters:
> @@ -208,7 +263,9 @@ struct mpc_funcs {
>   			struct mpc *mpc,
>   			unsigned int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @update_blending:
> +	 *
>   	 * Update the blending configuration for a specified MPCC.
>   	 *
>   	 * Parameters:
> @@ -223,7 +280,9 @@ struct mpc_funcs {
>   		struct mpcc_blnd_cfg *blnd_cfg,
>   		int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @cursor_lock:
> +	 *
>   	 * Lock cursor updates for the specified OPP.
>   	 * OPP defines the set of MPCC that are locked together for cursor.
>   	 *
> @@ -239,8 +298,10 @@ struct mpc_funcs {
>   			int opp_id,
>   			bool lock);
>   
> -	/*
> -	 * Add DPP into 'secondary' MPC tree based on specified blending position.
> +	/**
> +	 * @insert_plane_to_secondary:
> +	 *
> +	 * Add DPP into secondary MPC tree based on specified blending position.
>   	 * Only used for planes that are part of blending chain for DWB output
>   	 *
>   	 * Parameters:
> @@ -264,7 +325,9 @@ struct mpc_funcs {
>   			int dpp_id,
>   			int mpcc_id);
>   
> -	/*
> +	/**
> +	 * @remove_mpcc_from_secondary:
> +	 *
>   	 * Remove a specified DPP from the 'secondary' MPC tree.
>   	 *
>   	 * Parameters:

Thanks for the patch,
Tales Aparecida
