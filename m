Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE29577950
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 03:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A5D9EA9C;
	Mon, 18 Jul 2022 01:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5CB8D0BE;
 Mon, 18 Jul 2022 01:39:51 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so20428783fac.9; 
 Sun, 17 Jul 2022 18:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:reply-to:in-reply-to:content-transfer-encoding;
 bh=G6oPn5agB4emSjkTmopAHDW9JokPQZpwGyo8krCZiyo=;
 b=C0/Cnpn+3Fz67jwnDPsYZSuavc+UcnRbLRqi/9Yxqv6/spEgV9vraRpQdy+lOZY6/r
 KXQ/GpY3pFDexI2dzNERPrwdB5QbUb8Ls3taTxHptuhqqECpF9gGpnaI07jfhFyDsygj
 J4YBIRt+wJxba893BKvET8wCTh2RMwqgjy1JZvdXAbRoJgSzD3o2OTrI49tBBxS2NEAC
 WS8dEqt9CEqguLNWyWzqkAu2SkKPRUtkafurMYsvUZD2cdAJ/UFZDgC2mIYDBfM/dQDN
 /T3P2A4W9z/PJr7Lsya9RCq7ql1ENSCyzmfu4gmRX7ctFnzjfw4PgZ+OpyTy1ygtLdVI
 Y6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:reply-to:in-reply-to
 :content-transfer-encoding;
 bh=G6oPn5agB4emSjkTmopAHDW9JokPQZpwGyo8krCZiyo=;
 b=EbRSBjrgZn966DaB1P/8RePbLumcUiKIeYySfqEYc83FKiuDYYb9ND+XfR28hktD2Y
 n2DFSyY8knSAKzz3DDlf2mCsKNGt2oPIon1aUdmotr57/5VC6HLHU5T47R3/lteY/bVZ
 DhpVWN2gr2tVsRFy3K+vkqnDLlIeFnqFWIANNcmTdNVzh8bQ+vNzaq+244hanagyAC/d
 dWp2TVWyS0nakFnUgIkc8/eGHwNu6KdfEwEjale1jObB787akfAcxKQuv9hgs0I/lUvn
 gphYZFfJlYEUvmBAjeVFgycptzNn5ZmdSl3+j0WGWuGpKI6ayNlXDOKSzO7YTmvl1/Ag
 paIQ==
X-Gm-Message-State: AJIora9Oh1IoDpu9pSyw/JtmlCIIB1HJWX2exZAK+iEE1NwZYI1cIhql
 0nZ4ucjW9PNWbRTMbLFU/HyY3pRAu68x8oHS
X-Google-Smtp-Source: AGRyM1vzZdivde3sWl9OZCBM9YtnSKn+jUr+e4cEWyE3bx0kZSKcvO11ekZ49MrX58CHiG4z6V0/5w==
X-Received: by 2002:a05:6870:c1cb:b0:10b:f2d0:e0bf with SMTP id
 i11-20020a056870c1cb00b0010bf2d0e0bfmr15199558oad.143.1658108391137; 
 Sun, 17 Jul 2022 18:39:51 -0700 (PDT)
Received: from ?IPV6:2804:14c:4c2:8202::1003? ([2804:14c:4c2:8202::1003])
 by smtp.gmail.com with ESMTPSA id
 z29-20020a4a655d000000b004279be23ed4sm4372750oog.41.2022.07.17.18.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 18:39:50 -0700 (PDT)
Message-ID: <6078df20-348d-e690-6189-8d5c7b0b98f1@gmail.com>
Date: Sun, 17 Jul 2022 22:39:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for
 pixel blend mode
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-5-mwen@igalia.com>
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
In-Reply-To: <20220716222529.421115-5-mwen@igalia.com>
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
Reply-To: 20220716222529.421115-5-mwen@igalia.com
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/07/2022 19:25, Melissa Wen wrote:
> AMD GPU display manager (DM) maps DRM pixel blend modes (None,
> Pre-multiplied, Coverage) to MPC hw blocks through blend configuration
> options. Describe relevant elements and how to set and test them to get
> the expected DRM blend mode on DCN hw.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/amdgpu/display/display-manager.rst    | 98 +++++++++++++++++++
>   Documentation/gpu/drm-kms.rst                 |  2 +
>   2 files changed, 100 insertions(+)
> 
> diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
> index 8960a5f1fa66..7a495ed1f69e 100644
> --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> @@ -84,3 +84,101 @@ families below.
>   **DCN 3.0 family color caps and mapping**
>   
>   .. kernel-figure:: dcn3_cm_drm_current.svg
> +
> +Blend Mode Properties
> +=====================
> +
> +Pixel blend mode is a DRM plane composition property of :c:type:`drm_plane` used to
> +describes how pixels from a foreground plane (fg) are composited with the
> +background plane (bg). Here, we present main concepts of DRM blend mode to help
> +to understand how this property is mapped to AMD DC interface. See more about
> +this DRM property and the alpha blending equations in :ref:`DRM Plane
> +Composition Properties <plane_composition_properties>`.
> +
> +Basically, a blend mode sets the alpha blending equation for plane
> +composition that fits the mode in which the alpha channel affects the state of
> +pixel color values and, therefore, the resulted pixel color. For
> +example, consider the following elements of the alpha blending equation:
> +
> +- *fg.rgb*: Each of the RGB component values from the foreground's pixel.
> +- *fg.alpha*: Alpha component value from the foreground's pixel.
> +- *bg.rgb*: Each of the RGB component values from the background.
> +- *plane_alpha*: Plane alpha value set by the **plane "alpha" property**, see
> +  more in `DRM Plane Composition Properties <plane_composition_properties>`.

You forgot to use :ref: in here.

> +
> +in the basic alpha blending equation::
> +
> +   out.rgb = alpha * fg.rgb + (1 - alpha) * bg.rgb
> +
> +the alpha channel value of each pixel in a plane is ignored and only the plane
> +alpha affects the resulted pixel color values.
> +
> +DRM has three blend mode to define the blend formula in the plane composition:
> +
> +* **None**: Blend formula that ignores the pixel alpha.
> +
> +* **Pre-multiplied**: Blend formula that assumes the pixel color values in a
> +  plane was already pre-multiplied by its own alpha channel before storage.
> +
> +* **Coverage**: Blend formula that assumes the pixel color values were not
> +  pre-multiplied with the alpha channel values.
> +
> +and pre-multiplied is the default pixel blend mode, that means, when no blend
> +mode property is created or defined, DRM considers the plane's pixels has
> +pre-multiplied color values. On IGT GPU tools, the kms_plane_alpha_blend test
> +provides a set of subtests to verify plane alpha and blend mode properties.
> +
> +The DRM blend mode and its elements are then mapped by AMDGPU display manager
> +(DM) to program the blending configuration of the Multiple Pipe/Plane Combined
> +(MPC), as follows:
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +   :doc: mpc-overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +   :functions: mpcc_blnd_cfg
> +
> +Therefore, the blending configuration for a single MPCC instance on the MPC
> +tree is defined by :c:type:`mpcc_blnd_cfg`, where
> +:c:type:`pre_multiplied_alpha` is the alpha pre-multiplied mode flag used to
> +set :c:type:`MPCC_ALPHA_MULTIPLIED_MODE`. It controls whether alpha is
> +multiplied (true/false), being only true for DRM pre-multiplied blend mode.
> +:c:type:`mpcc_alpha_blend_mode` defines the alpha blend mode regarding pixel
> +alpha and plane alpha values. It sets one of the three modes for
> +:c:type:`MPCC_ALPHA_BLND_MODE`, as described below.
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +   :functions: mpcc_alpha_blend_mode
> +
> +DM then maps the elements of `enum mpcc_alpha_blend_mode` to those in the DRM
> +blend formula, as follows:
> +
> +* *MPC pixel alpha* matches *DRM fg.alpha* as the alpha component value
> +  from the plane's pixel
> +* *MPC global alpha* matches *DRM plane_alpha* when the pixel alpha should
> +  be ignored and, therefore, pixel values are not pre-multiplied
> +* *MPC global gain* assumes *MPC global alpha* value when both *DRM
> +  fg.alpha* and *DRM plane_alpha* participate in the blend equation
> +
> +In short, *fg.alpha* is ignored by selecting
> +:c:type:`MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA`. On the other hand, (plane_alpha *
> +fg.alpha) component becomes available by selecting
> +:c:type:`MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN`. And the
> +:c:type:`MPCC_ALPHA_MULTIPLIED_MODE` defines if the pixel color values are
> +pre-multiplied by alpha or not.
> +
> +Blend configuration flow
> +------------------------
> +
> +The alpha blending equation is configured from DRM to DC interface by the
> +following path:
> +
> +1. When updating a :c:type:`drm_plane_state <drm_plane_state>`, DM calls
> +   :c:type:`fill_blending_from_plane_state()` that maps
> +   :c:type:`drm_plane_state <drm_plane_state>` attributes to
> +   :c:type:`dc_plane_info <dc_plane_info>` struct to be handled in the
> +   OS-agnostic component (DC).
> +
> +2. On DC interface, :c:type:`struct mpcc_blnd_cfg <mpcc_blnd_cfg>` programs the
> +   MPCC blend configuration considering the :c:type:`dc_plane_info
> +   <dc_plane_info>` input from DPP.
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index d14bf1c35d7e..7ec9dbe18b65 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -532,6 +532,8 @@ Standard Plane Properties
>   .. kernel-doc:: drivers/gpu/drm/drm_plane.c
>      :doc: standard plane properties
>   
> +.. _plane_composition_properties:
> +
>   Plane Composition Properties
>   ----------------------------
>   

 From a beginner's perspective, the changes from this series are 
readable, but I cannot tell if there are any technical mistakes. So,
regarding readability and rendering htmldocs, apart from the nits I've 
raised, this whole series is

Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>

Thanks for the patch series, Melissa,
Tales Aparecida
