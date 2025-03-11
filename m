Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC1A5CEEB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621F10E1D5;
	Tue, 11 Mar 2025 19:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B4ihgk5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6AE10E1D5;
 Tue, 11 Mar 2025 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZpJRnn1LXAnOEJ2gkjYryDBL0uX3btNLboGFuEBlyb8=; b=B4ihgk5tmgZNc53TPUGvrN0jW7
 LbZa+sSAeV3xnXXMV7r9y+TfKY8xyDxRAMZTtkaAxglCySF4kw3mB0j6rofU2r21VC/Tpenc9cs/H
 DXNm/j7IMWGGBxPZ+ffhLqOUNAxfzmpPpi9/SCXu9gadG5QEo6Tco0l4hjGxQRbyvYzxMEPbIDtW8
 JfLE9rb8qsuPMYSTLNFfUZanA7w3DBkjftYuq6EYUpXIYoQvyjAhnMPZ29bEgnchaz0Q43Qhh+UyV
 Fr2KwMcli5HH/4m0w2RDmUv/aSaZ5F17ZVxM2a8tUO9I+bak53BM+VpgBFboL4KImYosbf5976X2P
 QuZmpd3Q==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14]
 helo=maloca.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ts4xr-007EvN-7S; Tue, 11 Mar 2025 20:08:37 +0100
Date: Tue, 11 Mar 2025 13:08:31 -0600
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 jun.lei@amd.com, aurabindo.pillai@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, Samson.Tam@amd.com, Navid.Assadian@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/display: Remove incorrect macro guard
Message-ID: <gsscppvh3sef4at3hzjzaj6x2felbhrekjzgqee7pqphjhfkvq@s4a7lbnok67k>
References: <20250311171017.3053891-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311171017.3053891-1-alex.hung@amd.com>
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

On 03/11, Alex Hung wrote:
> This macro guard "__cplusplus" is unnecessary and should not be there.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
> index 145961803a92..d621c42a237e 100644
> --- a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
> +++ b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
> @@ -17,9 +17,6 @@
>  #define SPL_EXPAND(a, b)          SPL_EXPAND2(a, b)
>  #define SPL_NAMESPACE(symbol)     SPL_EXPAND(SPL_PFX_, symbol)
>  
> -#ifdef __cplusplus
> -extern "C" {
> -#endif
>  
>  /* SPL interfaces */
>  
> -- 
> 2.43.0
> 

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>

-- 
Rodrigo Siqueira
