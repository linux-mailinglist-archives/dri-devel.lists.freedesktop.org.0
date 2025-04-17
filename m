Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164BA91EA4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9450A10E2C2;
	Thu, 17 Apr 2025 13:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ry0s/2yU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421D210E2C2;
 Thu, 17 Apr 2025 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qo1UigW28vjx1P4NVHvxe7hJQAq9sBYWQp4YgTNcpSU=; b=Ry0s/2yUqVDrvMCCIAduJGbEuC
 Y19QUTvEpFMrFAHxPX6bHmY0yGBlM6F6aeXiym6YGlndXB1cncaQGxX22ac9oawqSKlQEdJQdN3/P
 ciJu42+nKrz3xmcHPUilCRyGxXexQPE4HKuuj2sANervYEDGmxIwD9dCrCySiWNFRPOcoaz/HBGu3
 To1uc1hzVJSNeycJfdueDSWckHJMem+j4+ZavRRKADHrluTtRHKSiHbvzaIw+5zs6WNNi7F+rPK5o
 n4FLmVpiIVpK+fmarGuO3wlpo45Eh+4FyDt/Z8SuJ8D2X1AipaScDdN82Kqn4eUkTL8bEds8Zj700
 SbUnmWhQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5PcR-000pT2-CG; Thu, 17 Apr 2025 15:49:31 +0200
Message-ID: <6507c6c2-e146-4e75-bed9-6ea6746d78b1@igalia.com>
Date: Thu, 17 Apr 2025 14:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] drm/amdgpu: change DRM_DBG_DRIVER to drm_dbg_driver
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
 <20250417123155.4002358-5-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417123155.4002358-5-sunil.khatri@amd.com>
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


On 17/04/2025 13:31, Sunil Khatri wrote:
> update the functions in amdgpu_userqueues.c from
> DRM_DBG_DRIVER to drm_dbg_driver so multi gpu instance
> can be logged in.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> index 4ef49179bbaf..4729425c04a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> @@ -227,7 +227,8 @@ amdgpu_userqueue_get_doorbell_index(struct amdgpu_userq_mgr *uq_mgr,
>   
>   	index = amdgpu_doorbell_index_on_bar(uq_mgr->adev, db_obj->obj,
>   					     db_info->doorbell_offset, db_size);
> -	DRM_DEBUG_DRIVER("[Usermode queues] doorbell index=%lld\n", index);
> +	drm_dbg_driver(adev_to_drm(uq_mgr->adev),
> +		       "[Usermode queues] doorbell index=%lld\n", index);
>   	amdgpu_bo_unreserve(db_obj->obj);
>   	return index;
>   
> @@ -254,7 +255,7 @@ amdgpu_userqueue_destroy(struct drm_file *filp, int queue_id)
>   
>   	queue = amdgpu_userqueue_find(uq_mgr, queue_id);
>   	if (!queue) {
> -		DRM_DEBUG_DRIVER("Invalid queue id to destroy\n");
> +		drm_dbg_driver(adev_to_drm(adev), "Invalid queue id to destroy\n");
>   		mutex_unlock(&uq_mgr->userq_mutex);
>   		return -EINVAL;
>   	}
> @@ -433,7 +434,8 @@ int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
>   		break;
>   
>   	default:
> -		DRM_DEBUG_DRIVER("Invalid user queue op specified: %d\n", args->in.op);
> +		drm_dbg_driver(dev, "Invalid user queue op specified: %d\n",
> +			       args->in.op);
>   		return -EINVAL;
>   	}
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

