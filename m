Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MXeMKX0oWkwxgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:46:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314731BD0BD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5113710E1A0;
	Fri, 27 Feb 2026 19:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fD52oyPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D1110E1A0;
 Fri, 27 Feb 2026 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1KoQc9MvIGOyc6u5CzQpM9KN1npTTONtQXz0YohcajY=; b=fD52oyPMExuINgE1ewZ8stlE6T
 WFV5J4/c6OuNEV/GH83LPHpZnlTwD1dFkNsklxD2/m7GC6CVXZQIhkBAYOFQc43jX9vtyym5yovGu
 8sioyab6rqjsI/B78SJye3Zb7qp2uCafDU5Fc1ycs6JLrNi0/kXnTKGb1vMy+2qIzgdLDBDMUM/Od
 AlVTNe6j7tZeVI6k5f0Y0nqnKHpcooYGb/J0jD4BfuaqiIMg7GchTArjjj6E3f8zKgEKXw1NGlYGS
 jSwqh8Wq06kjfz3Rw5lZnnSqoEO+qCr8Bju3Mia6CUlq9K+WoT9If9XISAnodcxnP2Iam60U2WWn6
 unHCqyOQ==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vw3nI-006fKr-Jh; Fri, 27 Feb 2026 20:46:36 +0100
Message-ID: <18243ee4-7187-4441-89f5-826b30b3ec3b@igalia.com>
Date: Fri, 27 Feb 2026 16:46:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Enable DEGAMMA and reject
 COLOR_PIPELINE+DEGAMMA_LUT
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, contact@emersion.fr, ivan.lipski@amd.com,
 kenneth.feng@amd.com, chiahsuan.chung@amd.com, mdaenzer@redhat.com,
 Jerry.Zuo@amd.com, timur.kristof@gmail.com, david.rosca@amd.com,
 daniels@collabora.com, Alvin.Lee2@amd.com, bold.zone2373@fastmail.com,
 dmitry.baryshkov@oss.qualcomm.com, ville.syrjala@linux.intel.com,
 Matthew.Stewart2@amd.com, chaitanya.kumar.borah@intel.com
References: <20260227193038.1377643-1-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260227193038.1377643-1-alex.hung@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,emersion.fr,redhat.com,collabora.com,fastmail.com,oss.qualcomm.com,linux.intel.com,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 314731BD0BD
X-Rspamd-Action: no action



On 27/02/2026 16:30, Alex Hung wrote:
> [WHAT]
> Create DEGAMMA properties even if color pipeline is enabled, and enforce
> the mutual exclusion in atomic check by rejecting any commit that
> attempts to enable both COLOR_PIPELINE on the plane and DEGAMMA_LUT on
> the CRTC simultaneously.
>
> Fixes: 18a4127e9315 ("drm/amd/display: Disable CRTC degamma when color pipeline is enabled")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 16 ++++++++--------
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c  |  8 ++++++++
>   2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 130190e8a1b2..304437c2284d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -765,15 +765,15 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>   	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
>   
>   	/* Don't enable DRM CRTC degamma property for
> -	 * 1. Degamma is replaced by color pipeline.
> -	 * 2. DCE since it doesn't support programmable degamma anywhere.
> -	 * 3. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
> +	 * 1. DCE since it doesn't support programmable degamma anywhere.
> +	 * 2. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
> +	 * Note: DEGAMMA properties are created even if the primary plane has the
> +	 * COLOR_PIPELINE property. User space can use either the DEGAMMA properties
> +	 * or the COLOR_PIPELINE property. An atomic commit which attempts to enable
> +	 * both is rejected.
>   	 */
> -	if (plane->color_pipeline_property)
> -		has_degamma = false;
> -	else
> -		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
> -			      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
> +	has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
> +		      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
>   
>   	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
>   				   true, MAX_COLOR_LUT_ENTRIES);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 70587e5a8d46..127207e18dcb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1256,6 +1256,14 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
>   	if (ret)
>   		return ret;
>   
> +	/* Reject commits that attempt to use both COLOR_PIPELINE and CRTC DEGAMMA_LUT */
> +	if (new_plane_state->color_pipeline && new_crtc_state->degamma_lut) {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] COLOR_PIPELINE and CRTC DEGAMMA_LUT cannot be enabled simultaneously\n",
> +			       plane->base.id, plane->name);
> +		return -EINVAL;
> +	}
> +
LGTM.

Reviewed-by: Melissa Wen <mwen@igalia.com>
>   	ret = amdgpu_dm_plane_fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
>   	if (ret)
>   		return ret;

