Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BABA10A41
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFC810E380;
	Tue, 14 Jan 2025 15:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="D2PDOnwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BD210E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:04:42 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so1049038466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 07:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736867081; x=1737471881; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JlzFzz9CnL3cnQzM4bidxHHVsjw7x7xEwR/iZezcWCU=;
 b=D2PDOnwgQa4VZqxj27qQpu8UKovC0EYlH8IhBwwXN7o5F4V53GFPxNjwI94db92+tA
 m5C/ei9fujvyQS5G82g3TbfcShV9uVjAyNY5KeGK+vn3SXmXdXbZGh1Oo65hqv0sobMp
 xa6iIyJehCw34I/fN8wMjwwdCGMSWilCzF9lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736867081; x=1737471881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlzFzz9CnL3cnQzM4bidxHHVsjw7x7xEwR/iZezcWCU=;
 b=aiShcUQvLjbKub6J3iWrHlxvLS5IaSCCULjGL9ZAgtZqCoy7iqrgJn0Fyi1mrq9JYT
 jD6LREIgiwzcuWvXLUToF7KOmYWKgDZ5QvleS4Hai8pdyBB7LL1d4Qpi7GiSm/9HsFGV
 prmmL9ccTnsyWAk20hbLlnHxjn3O0Aeo+MjuKJs5QUz7sOB22YcGVlnxMcR75fbryl3U
 8LmImVtqMsp1XV2QrbS6ttfbEPmOP5sdciT31LK5fTn1JAdMlKRWnN0mFfZJM1RmQNLS
 5JHSdFtIOYA70rdkX3UWaJAu7VcnBb11WfFg39Q28sCSTr6HBafce/hZ5gXJ7ZEmjPib
 jGRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwzKOLkrn7tb+hewAHWKDA2nW7Iwd9xYd3l584ctb/l1HyCRZZORQZfpku/bsG4Fb321j43gtx6Zc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMwvP+hWsLPayJRaZLMBfxJITlV5FMavcoUgikHE82cHW1Bc5S
 GS4K6NiX4hUHyJYqs4HOG4Ijg39uKCsH4s1MYHyFIYYY0ePKeNuWeZT+/kovIoc=
X-Gm-Gg: ASbGncvMphqgKASZIZzxRLcT2UNuy09gRHhxhqEjjZPB0qwKPy0d7m/4SfMahQ8p08b
 FbxMUqMiKy7gqq7+kaE3imw5C5cCCoiOqAgEiJd56jZebmJlR/P6IwbXjlzs4lZtesvejZhoTGh
 u4b0lxw3EfoXLoAFz3GvJx4QNAMzGEE11RVF0BEkdytqqYSZ7yrZtFZ3ESFTWR5BPoK1dOmEuQ6
 yzgSh/Q93M62a55R8o9oTxDynequSUsrgjt2XQ5Wde6uzfF4NWGWHVinG5EWVWoFmEs
X-Google-Smtp-Source: AGHT+IH+UnsuMwr+XU0+iENq475M2f9Mz3g9fsBiqzqlUj2pYHNplby4nlIPDiPfP8/GQO+NFoPQDA==
X-Received: by 2002:a17:907:3f95:b0:aa6:8bb4:5030 with SMTP id
 a640c23a62f3a-ab2aad118aamr2488137166b.0.1736867079859; 
 Tue, 14 Jan 2025 07:04:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c96468afsm646952566b.170.2025.01.14.07.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:04:38 -0800 (PST)
Date: Tue, 14 Jan 2025 16:04:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 cgroups@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 4/4] doc/cgroup: Fix title underline length
Message-ID: <Z4Z9BENJm07M-mOO@phenom.ffwll.local>
References: <20250113092608.1349287-1-mripard@kernel.org>
 <20250113092608.1349287-4-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092608.1349287-4-mripard@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Mon, Jan 13, 2025 at 10:26:08AM +0100, Maxime Ripard wrote:
> Commit
> 
> Commit b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting
> cgroup") introduced a new documentation file, with a shorter than
> expected underline. This results in a documentation build warning. Fix
> that underline length.
> 
> Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20250113154611.624256bf@canb.auug.org.au/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

On the three doc patches:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  Documentation/core-api/cgroup.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-api/cgroup.rst
> index 8696e9513f51..734ea21e1e17 100644
> --- a/Documentation/core-api/cgroup.rst
> +++ b/Documentation/core-api/cgroup.rst
> @@ -1,9 +1,9 @@
>  ==================
>  Cgroup Kernel APIs
>  ==================
>  
>  Device Memory Cgroup API (dmemcg)
> -=========================
> +=================================
>  .. kernel-doc:: kernel/cgroup/dmem.c
>     :export:
>  
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
