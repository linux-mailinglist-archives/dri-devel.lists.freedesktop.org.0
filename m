Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1354856590
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 15:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42E10E89A;
	Thu, 15 Feb 2024 14:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BU+vdCnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA2210E510;
 Thu, 15 Feb 2024 14:12:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so7147335e9.2; 
 Thu, 15 Feb 2024 06:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708006336; x=1708611136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aJPJk45tJ35CmV12mY4raCzYYj4R+MOk7Y0UwY06CoE=;
 b=BU+vdCnSedCh0u/61UOkQ0vHvD4XFlomoZmC6wmAG9D41gJ+YsKXDWpmrFbtjkoCmv
 ViJpQnCgoXE/JNt8HtAyXxeD57EsWn9F5Lh6VSe4AYZSsvz/tbu17Puoj/J+HVL+QJo1
 8fnS5yhK/RpE6raDZu831kUInIidF8p9f2vAezzTqZYqtfL39aihIxPSE5Juvj933jHj
 RqgcYU6N9W2GwgTBKDd3jrMYAp9Y+wdImzmoc2L4Ruk22p8vu/cSh+GdhhsIEZlMp71p
 8V+HcWF/Z+6EVXPgf6HF8nnE6r0WrCQxKT6sEgMNPK8129iUwzykih36dzCUKoqE4TlJ
 wGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708006336; x=1708611136;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aJPJk45tJ35CmV12mY4raCzYYj4R+MOk7Y0UwY06CoE=;
 b=K+9KeIaBtg4RyXU3X67Tz0TVqY5mwnVVa7zi1SoA3cg15sNa4owzmpvJ7V0oWav/b3
 7nzsz1FQeAdjlYokvXlj99h/xoZDXc+7akwMv7TnYcsyUrBwuYiEL7ZgGJQlxKD/IpXj
 T+LD8/HF8b2/HHJSMsLgB4SgoLQDh6w13uFj9E2e5B+nXO26Jiwg0k+jsqYlo85libBz
 e9CRHoopLg5KhF0B4mRn9lnE2Cag5znq+oryWl2xG+A92ABEmjIH9GQwzonmUQo7eBxE
 8hy6aeQd1XOiZ5gUlYQNWMCdbub0rsxetaVU6mmpPWIg/xg1vJPwl/5xbFK/9UVJdmyZ
 9aLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4KmRjdSSVvV2Qw36x2+gm1yvFzA7e7RfHgHirIkWhzo0Elh5tLjdaqO3UVwAqNwp1Bw9PH4uf4L461UgSWPbvte6ftgIlzSuILNLSuRsqkcQYvHlaya+DU7p8D82M9mHRg4wlY5PRZuIOOTvIAnL5kguZ/mbtnDtDE9a/cDNMMfl/uGQiRsLrakDljkAKDpIZ9/1wshBz4iYWg/w/A+/jrDxXfq1zbQvdtNjaSwbh
X-Gm-Message-State: AOJu0YxMXeULGqGDVyeJMl+3xqRosB0BHvyRl3lifGk7cbRRX61JHIKf
 xJg75bJEpWzmgYO/O5pdjiXOdNTdHKIFPZCAy/1VvpSfG7UdHrcF
X-Google-Smtp-Source: AGHT+IEUQXrc03AB98JvC7aCV3+SdG3He79Gs0UiygBwzJFzC+FfbbPwMdzR5HFdXsTxIDvppMeKhA==
X-Received: by 2002:a05:600c:1f87:b0:411:fc3f:c620 with SMTP id
 je7-20020a05600c1f8700b00411fc3fc620mr1497530wmb.20.1708006336297; 
 Thu, 15 Feb 2024 06:12:16 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 je14-20020a05600c1f8e00b00411ee1dd5afsm2190696wmb.16.2024.02.15.06.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 06:12:15 -0800 (PST)
Message-ID: <b883e82e-9042-4656-b152-065ed31a81de@gmail.com>
Date: Thu, 15 Feb 2024 15:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6 V4] fdinfo shared stats
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 daniel@ffwll.ch
References: <20240212210428.851952-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
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

Am 12.02.24 um 22:04 schrieb Alex Deucher:
> We had a request to add shared buffer stats to fdinfo for amdgpu and
> while implementing that, Christian mentioned that just looking at
> the GEM handle count doesn't take into account buffers shared with other
> subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
> doesn't really matter from a GPU top perspective, but it's more
> correct if you actually want to see shared buffers.
>
> After further discussions, add a helper and update all fdinfo
> implementations to use that helper for consistency.
>
> v4: switch drm_gem_object_is_shared_for_memory_stats() to an inline function

I'm still not sure if looking at the actual handle count is the right 
approach, but it's certainly better than before.

So Reviewed-by: Christian König <christian.koenig@amd.com> for the 
entire series.

Should I take this through drm-misc-next?

Regards,
Christian.

>
> Alex Deucher (6):
>    Documentation/gpu: Update documentation on drm-shared-*
>    drm: add drm_gem_object_is_shared_for_memory_stats() helper
>    drm: update drm_show_memory_stats() for dma-bufs
>    drm/amdgpu: add shared fdinfo stats
>    drm/i915: Update shared stats to use the new gem helper
>    drm/xe: Update shared stats to use the new gem helper
>
>   Documentation/gpu/drm-usage-stats.rst      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>   drivers/gpu/drm/drm_file.c                 |  2 +-
>   drivers/gpu/drm/i915/i915_drm_client.c     |  2 +-
>   drivers/gpu/drm/xe/xe_drm_client.c         |  2 +-
>   include/drm/drm_gem.h                      | 13 +++++++++++++
>   8 files changed, 38 insertions(+), 4 deletions(-)
>

