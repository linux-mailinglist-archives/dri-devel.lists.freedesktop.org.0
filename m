Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAfZH+TEqWknEgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:01:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A655216B74
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2F10E2D0;
	Thu,  5 Mar 2026 18:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DPzCFkE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878210E0F8;
 Thu,  5 Mar 2026 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YUr1+sWEO9j5kitoHz+vNz4j+awsJ1fwf/poatsFNbU=; b=DPzCFkE0MC874adOXYhljT3y3s
 1r4WzOqbGBJUT1HrX43ZOiB35t7xvcy21s7NgHX8freBwrlCwrPbE9B8RhEuG4rzc1laiHDMyVixZ
 gSbR9wAk9tp9p/lCQ+m8IyJDgKlhA/29iJX7WLvGMVXKw7xo+AHiSk3NC25kOGhiBDvn7L5qutJx3
 +9AuuHd8ScbmTcYOxBC+m17yRBb1AlgTKDxAqwfWBd7wwzJMrO3EKKim1NbT0vTxQ5xirUYTRW7X6
 M/JQ+dmICa+pLHgEBlHHSZaIQB+8c7bDavGbkdmlQumc5F07SPUuqnzM5wE8RgSHJXfwM2vDf3gz5
 IXcTiHyA==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vyD0G-009Tnn-Kz; Thu, 05 Mar 2026 19:00:52 +0100
Message-ID: <ae12b964-de1a-475c-9ea6-811ee541d146@igalia.com>
Date: Thu, 5 Mar 2026 15:00:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] drm/amdgpu: Fix kernel-doc comments for some
 LUT properties
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Hung <alex.hung@amd.com>
References: <20260305-amdgpu-fix-kdoc-lut-v2-1-37947aca68e8@collabora.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260305-amdgpu-fix-kdoc-lut-v2-1-37947aca68e8@collabora.com>
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
X-Rspamd-Queue-Id: 2A655216B74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.321];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

+ cc: Alex Hung

Hi Alex H.,

Can you apply this patch?

Thanks,

Melissa

On 05/03/2026 08:16, Cristian Ciocaltea wrote:
> The following members of struct amdgpu_mode_info do not have valid
> references in the related kernel-doc sections:
>
>   - plane_shaper_lut_property
>   - plane_shaper_lut_size_property,
>   - plane_lut3d_size_property
>
> Correct all affected comment blocks.
>
> Fixes: f545d82479b4 ("drm/amd/display: add plane shaper LUT and TF driver-specific properties")
> Fixes: 671994e3bf33 ("drm/amd/display: add plane 3D LUT driver-specific properties")
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Collected R-b tag from Melissa
> - Rebased onto latest drm-misc-next
> - Link to v1: https://lore.kernel.org/r/20250823-amdgpu-fix-kdoc-lut-v1-1-306bcad41267@collabora.com
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index dc8d2f52c7d6..e244c12ceb23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -368,15 +368,15 @@ struct amdgpu_mode_info {
>   
>   	struct drm_property *plane_ctm_property;
>   	/**
> -	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
> -	 * that converts color content before 3D LUT. If
> -	 * plane_shaper_tf_property != Identity TF, AMD color module will
> +	 * @plane_shaper_lut_property: Plane property to set pre-blending
> +	 * shaper LUT that converts color content before 3D LUT.
> +	 * If plane_shaper_tf_property != Identity TF, AMD color module will
>   	 * combine the user LUT values with pre-defined TF into the LUT
>   	 * parameters to be programmed.
>   	 */
>   	struct drm_property *plane_shaper_lut_property;
>   	/**
> -	 * @shaper_lut_size_property: Plane property for the size of
> +	 * @plane_shaper_lut_size_property: Plane property for the size of
>   	 * pre-blending shaper LUT as supported by the driver (read-only).
>   	 */
>   	struct drm_property *plane_shaper_lut_size_property;
> @@ -400,10 +400,10 @@ struct amdgpu_mode_info {
>   	 */
>   	struct drm_property *plane_lut3d_property;
>   	/**
> -	 * @plane_degamma_lut_size_property: Plane property to define the max
> -	 * size of 3D LUT as supported by the driver (read-only). The max size
> -	 * is the max size of one dimension and, therefore, the max number of
> -	 * entries for 3D LUT array is the 3D LUT size cubed;
> +	 * @plane_lut3d_size_property: Plane property to define the max size
> +	 * of 3D LUT as supported by the driver (read-only). The max size is
> +	 * the max size of one dimension and, therefore, the max number of
> +	 * entries for 3D LUT array is the 3D LUT size cubed.
>   	 */
>   	struct drm_property *plane_lut3d_size_property;
>   	/**
>
> ---
> base-commit: be4cd2a13a31496c7fb9e46a244c4391b8b7cf31
> change-id: 20250823-amdgpu-fix-kdoc-lut-357db8b57fee

