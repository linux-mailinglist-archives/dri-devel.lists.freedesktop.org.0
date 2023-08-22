Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DD783FCD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15EE10E321;
	Tue, 22 Aug 2023 11:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269EB10E322;
 Tue, 22 Aug 2023 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692704642; x=1724240642;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NhLbpMBB+lX2f+xyEl+B8376ASkcAco+ugMB0R+Q15o=;
 b=aFdNEgF+YKEt2EHZjXVEjKAsqALEMoSThCiSPrnUiQz5hLl9Plue4HeK
 zEBI54q/4n4xs1KlM7Va6pE1SqTJMV6iuAY8fjsz2fihRcQjrRwVXmfMu
 0v4WL2Ap+FfX+rct5Xusryp2t8j+rFv7iW+fJEZBBW03wT0PW9xh4bsSF
 ck8jccOScaLpWOBdlnjrdLbZfHDJF5TmqT/Veet6kbxQ1BoKTC/cDxBBH
 q0nGJVQJoOQDpXv/RH5bYFdbM8Aw2t+fkd5OxQbDlrBWCewtjUATlJWEo
 4qzP2sv6vtAx+u4pkktgBjbbepaIJT7BEyOVOi9hHYjIJuLQ3risYRvCq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372751660"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="372751660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 04:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850580730"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="850580730"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 04:43:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/amd/display: drop unused count variable in
 create_eml_sink()
In-Reply-To: <20230517183350.314082-3-hamza.mahfooz@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230517183350.314082-1-hamza.mahfooz@amd.com>
 <20230517183350.314082-3-hamza.mahfooz@amd.com>
Date: Tue, 22 Aug 2023 14:43:53 +0300
Message-ID: <87a5uj7152.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stylon Wang <stylon.wang@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>,
 kernel test robot <lkp@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Leon Huang <Leon.Huang1@amd.com>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Nasir Osman <nasir.osman@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 May 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> Since, we are only interested in having
> drm_edid_override_connector_update(), update the value of
> connector->edid_blob_ptr. We don't care about the return value of
> drm_edid_override_connector_update() here. So, drop count.
>
> Fixes: 068553e14f86 ("drm/amd/display: assign edid_blob_ptr with edid from debugfs")

The *real* problems with that commit are:

1) It uses drm_edid_override_connector_update() *at all*. Its
   documentation says:

	Only to be used from drm_helper_probe_single_connector_modes()
	as a fallback for when DDC probe failed during drm_get_edid()
	and caused the override/firmware EDID to be skipped.

2) It messes with edid_blob_ptr directly. All drivers should stop doing
   that. It just complicates all the logic in the overrides and the
   property updates.


BR,
Jani.


> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 14b296e1d0f6..5a2d04f47276 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6396,9 +6396,8 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  		/* if connector->edid_override valid, pass
>  		 * it to edid_override to edid_blob_ptr
>  		 */
> -		int count;
>  
> -		count = drm_edid_override_connector_update(&aconnector->base);
> +		drm_edid_override_connector_update(&aconnector->base);
>  
>  		if (!aconnector->base.edid_blob_ptr) {
>  			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",

-- 
Jani Nikula, Intel Open Source Graphics Center
