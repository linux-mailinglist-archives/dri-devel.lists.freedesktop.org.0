Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD887AC65B7
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A20910E5A4;
	Wed, 28 May 2025 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GuD5QBgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8633F10E5BE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:22:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso34795075e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424168; x=1749028968; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JHaaGmjPUQxk+4uMo8wv5Wuk18Qr79/20T/yVeyPV2A=;
 b=GuD5QBgxktFpXC91QqMV/7aoCMwkvTgU6LjenHIAM5Cn58yxpEIXWa0VcBRRfwqGud
 I4ioL4rZg6hpEMN6Ha5xCWGpqn32PvD46wDNG5YlCeabRvmG9W6L21b6bcalGk+1gsYv
 uO6JZImpRiPcwVH1C5s4Nm0h4VUAONLsRvO9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424168; x=1749028968;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JHaaGmjPUQxk+4uMo8wv5Wuk18Qr79/20T/yVeyPV2A=;
 b=t3BP0IcJ24979NE+hWLmzPxgnMYGZ0B+7ET5DqNBqfs15OzvRrunYksJpfaBfzofUn
 U4dEJmJxf0iAXWm2eFJFvp34S1C9SfGoD7jpICrInrZIXvfKzdYr/gHPBQsUxE/zADR2
 ZjGsgDHIGprPbAp0gF/8s9ENyUrGeqv05TV8RHCcy7jNye7H/+doIiV1/aVdwXyptwTK
 5fbhBuetnhesHj/PAHOcj3zUiXjLcvfhQLk6pJHK++Ex79ch2wIRF4QrQ+FfpLUrK76p
 GNNEqAIGOqAbQcpza0A/fg8cPkLPOluMpjfsV0Nn205BI/nF1U/TmQJwM7wm7/R/xUSq
 t3lA==
X-Gm-Message-State: AOJu0Yy7Nrl9PKJlxEVV010OzDDueiZruH2WqRzXAlljFRGtcPL+pFn/
 5DAyD74gHus1lJbtu62avgNyUjb/mHQj5hK883Ojv8gdSroJnKWzK9zbnS29Frf2fqseyc6BCdz
 atRoi
X-Gm-Gg: ASbGncsaXvx1QixAvQcn0DywdNRYQllyHrj5NbsFh2cxgS3Ks/RPl7JkYTtW2G+C//n
 GpNVBH9TmsszJjnftJIhdcC5eQp6Loluf5U/zCSRFIG55de0wbJy/vetNV8n0zL23pW1WJu0gkl
 y59xZ09Ygt/SEDT53fRQRySi09UAUdorhbH8iIo+LA4OtzagYlSdKjt89Z9KvFGitlmK0lOmfna
 ONNx1Yq/Wp2dOWyD5UyukLBZuCQ8p4HJBMeWIB2nKy6deOCV30iMFkBjicZGjmn4lgi8ULlGcaT
 4DC+ksqvCd9JbN1ftWOYHTFEzW6HymGmS29o5FLnY84OPXPC2Wkm9y+riWW6lXnvjlK1B1XjZw=
 =
X-Google-Smtp-Source: AGHT+IFwsctj0py8YOJiG22VOXIUNJUZTaCnjKHN1KQGMhbKocksVyqtSww8b97N8UmjhzaDKloNbw==
X-Received: by 2002:a05:600c:1d84:b0:43c:eea9:f45d with SMTP id
 5b1f17b1804b1-44c939c11bdmr162259025e9.18.1748424167960; 
 Wed, 28 May 2025 02:22:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450787d418dsm11425455e9.40.2025.05.28.02.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:22:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:22:45 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Frank Min <Frank.Min@amd.com>,
 Kent Russell <kent.russell@amd.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 6/8] drm/amdgpu: Add comments about drm_file.object_idr
 issues
Message-ID: <aDbV5QEuEsYOxBQa@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-7-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091307.1894940-7-simona.vetter@ffwll.ch>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 11:13:04AM +0200, Simona Vetter wrote:
> idr_for_each_entry() is fine, but will prematurely terminate on
> transient NULL entries. It should be switched over to idr_for_each,
> which allows you to handle this explicitly.
> 
> Note that transient NULL pointers in drm_file.object_idr have been a
> thing since f6cd7daecff5 ("drm: Release driver references to handle
> before making it available again"), this is a really old issue.
> 
> Since it's just a premature loop terminate the impact should be fairly
> benign, at least for any debugfs or fdinfo code.

Misread idr_get_next and I now think it should be fine as-is. Please
disregard this one.
-Sima

> 
> Aside: amdgpu_gem_force_release() looks questionable and should
> probably be revisited in the light of the revised hotunplug design
> we're aiming for. But that's an entirely separate can of worms.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Arvind Yadav <Arvind.Yadav@amd.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Yunxiang Li <Yunxiang.Li@amd.com>
> Cc: Frank Min <Frank.Min@amd.com>
> Cc: Kent Russell <kent.russell@amd.com>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 2c68118fe9fd..90723b13fa7d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -249,6 +249,7 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
>  
>  		WARN_ONCE(1, "Still active user space clients!\n");
>  		spin_lock(&file->table_lock);
> +		/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  		idr_for_each_entry(&file->object_idr, gobj, handle) {
>  			WARN_ONCE(1, "And also active allocations!\n");
>  			drm_gem_object_put(gobj);
> @@ -1167,6 +1168,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  		rcu_read_unlock();
>  
>  		spin_lock(&file->table_lock);
> +		/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  		idr_for_each_entry(&file->object_idr, gobj, id) {
>  			struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
>  
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
