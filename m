Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F4843FB4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 13:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F51113BB8;
	Wed, 31 Jan 2024 12:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CF510F9FD;
 Wed, 31 Jan 2024 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706705466; x=1738241466;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v5TP6WqDtLkRjvsn8AansuZuyiH5+KrqUBPR7V5bdvU=;
 b=Y1eEK2SMOL2iyWh0j9XUGWLFTlVTjRkcCZh8cN52npe6yfj8/SU8RZd1
 nDEVSW6+o+KgzLeuQc6EJELmBQ+Tldx3QAq3YUorRmCNgliNb24E9svOX
 7HcuMmobKciUis91LviM2GioX0BmTm5vNw4Mz5KumoTWToJTTC6lUW96F
 A6YrJYNQrWlpVDP2A+lvO41DtjiOzjUdDZIiQmTGqFSXW4Q02CIXPdj9S
 uvAXTgFF2OXDmuSykbciuTVTyW8/9/+RmKQl9YBwPEs6JXk7MSVNfFW9k
 LuvhbxrE46WnV5Q0EpTmhpQH04efug/smk8U5dIUeOSgFNtQQcNWIQaxK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10342701"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10342701"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822557714"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="822557714"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:51:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/nouveau/acr/ga102: remove unused but set variable
In-Reply-To: <4d9f62fa6963acfd8b7d8f623799ba3a516e347d.1704908087.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <4d9f62fa6963acfd8b7d8f623799ba3a516e347d.1704908087.git.jani.nikula@intel.com>
Date: Wed, 31 Jan 2024 14:50:59 +0200
Message-ID: <878r45is3w.fsf@intel.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-gfx@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Fix the W=1 warning -Wunused-but-set-variable.
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Ping?

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531..bd104a030243 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
>  		const struct firmware *hsbl;
>  		const struct nvfw_ls_hsbl_bin_hdr *hdr;
>  		const struct nvfw_ls_hsbl_hdr *hshdr;
> -		u32 loc, sig, cnt, *meta;
> +		u32 sig, cnt, *meta;
>  
>  		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
>  		if (ret)
> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
>  		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>  		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
>  		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
> -		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
>  		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
>  		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);

-- 
Jani Nikula, Intel
