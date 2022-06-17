Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0F54F185
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10311A782;
	Fri, 17 Jun 2022 07:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C0A11A782;
 Fri, 17 Jun 2022 07:09:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n10so7053520ejk.5;
 Fri, 17 Jun 2022 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ET42+PIkHyJeROb1M/lDUMRwuEfiuiZz6VZaVzGCdr4=;
 b=hDjYrLYFfRqU9IOY8hzkClfmh4QXIopxPXNF2LSc/qissBbBc4/VdKOECIPhy+zvl9
 mj8a4GiynZKjyZBswBmY/k4c2qlF57bCKAV4ggCZqc3fbHqiqxamwR5DtGOLRJ1toRpn
 dmZLcQ5J9DY0EQMYMtDFtpnrfFpiMYEwy2/LSlFp5LW9Rfdyrs3R9L/qx0F/EQLLorUH
 Hi7DN3nZfl/JdDTfcyq0HWIXlRR9jCfcHg9CKd7+lGTzZpe+02JvusTzpusso/CADwJB
 fiwqzN6ZfI6SRDynOhadT8M+YXgpC6nLK/ztf5b1H8+tr6XZeI6y4APq62V6F+eokKr5
 d3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ET42+PIkHyJeROb1M/lDUMRwuEfiuiZz6VZaVzGCdr4=;
 b=YOBka/br6Gzt3SVQwjKQN+fwIMm71GsOqhSdOaBxp9ap7NSCmdAfIfRcofyz68gG8P
 3+NvR3PdIyIizvrRHuxSv/SBbCScOoLYsiHLXSh48OjBXfxrj4gHfu8PADu+jPuwV8Vj
 MNb2gLdKNdIJLm7eJAp0eecVfGX8Vn6yifXedqX2GH8Y2M70U//EUb5eFkWT6dN6rSi6
 ouJnVhCXFPA+29X0UesMAgtcTbaHGBoimmWR32ee5k8CSi4WUu7MQFXEfcQknDPA7eL3
 /IHVnGl6bV0+0W/GAPQv5aJCiHnhH2XnOcmXm0vf7t2XJwvpOdKVsnEF6CgpymaBks+3
 RMaw==
X-Gm-Message-State: AJIora8EzwQCF05DEJIFAfy86GPwJGe7apCTc73CoTvJ1QGa4RFYW9CF
 1sVB7sx+u/Z0qRRwAfNdeJE=
X-Google-Smtp-Source: AGRyM1vKnh1Z1tbBLb1AJjizub0CkvhoD1To1aJGhMDzGCN3CoPxwO9zMGv5clC8T66F2WoMuvyA1w==
X-Received: by 2002:a17:907:8330:b0:711:cfc4:3a3e with SMTP id
 mq48-20020a170907833000b00711cfc43a3emr7768373ejc.483.1655449775997; 
 Fri, 17 Jun 2022 00:09:35 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:b1f8:cf55:95c3:a816?
 ([2a02:908:1256:79a0:b1f8:cf55:95c3:a816])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a17090665c600b006feb6dee4absm1786192ejn.137.2022.06.17.00.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 00:09:35 -0700 (PDT)
Message-ID: <17df80c3-8dc0-d176-48c6-227ba9bc6ed3@gmail.com>
Date: Fri, 17 Jun 2022 09:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amdgpu/display: drop set but unused variable
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220616203538.649041-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220616203538.649041-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 16.06.22 um 22:35 schrieb Alex Deucher:
> Fixes:
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9143:27: warning: variable 'abo' set but not used [-Wunused-but-set-variable]
>
> Fixes: 047de3f17a83 ("drm/amdgpu: switch DM to atomic fence helpers v2")
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 33cd7a3d4ecb..33d575bcf964 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9140,7 +9140,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
>   	int planes_count = 0, vpos, hpos;
>   	unsigned long flags;
> -	struct amdgpu_bo *abo;
>   	uint32_t target_vblank, last_flip_vblank;
>   	bool vrr_active = amdgpu_dm_vrr_active(acrtc_state);
>   	bool pflip_present = false;
> @@ -9212,7 +9211,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   			continue;
>   		}
>   
> -		abo = gem_to_amdgpu_bo(fb->obj[0]);
>   		fill_dc_plane_info_and_addr(
>   			dm->adev, new_plane_state,
>   			afb->tiling_flags,

