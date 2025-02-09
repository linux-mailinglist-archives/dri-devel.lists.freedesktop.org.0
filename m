Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F3A2DA20
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 02:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B38C10E084;
	Sun,  9 Feb 2025 01:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lGI962OW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208910E084
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 01:20:59 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-307e4e72ef3so22236301fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739064057; x=1739668857; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L1xFKvBTExFhCQASwzsuUzGTNrXZOyD7hG5DLI836F0=;
 b=lGI962OWyGVczm47vqOmHwrucONlp+XlDiyKyBIXGbZ/kC/0NffqzaomDzd8bbaVwQ
 STifmesyS3/yIYEqd3SGRD0E0F9b3la+Lrcy4Mm8mOgHs2r84dRbp8DjTprhRTcoqSWD
 vCCb3i88w2Ul6Gmx8DiMFuWn2H1O105QWW6z2s0b14LYgtLIxNfKRjRSY+liCtQPWv3O
 m2ceS0K9ttIwhlYtCtDIpv7DYjUgDULuuZw0Atdy+MJRTvgkYaettECZlFJ3rkY0hIwr
 fKsNlhcc4gbg4SJhPmkcnk5dXhkX+b6BzkYAhqOi5xVHqVVRJMwHzIJcl8Mr+1q+/EaS
 hIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739064057; x=1739668857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1xFKvBTExFhCQASwzsuUzGTNrXZOyD7hG5DLI836F0=;
 b=bciSvnkQRHoUMgipvwjH1GH/IOHaD0NyyDGasTPwby/O85VN7lDSe3kzjPl1nekepm
 4zN9BWvb4y1RdxgBGYsiENZEMNagyGPdBXGx1UCBZonBJuIThNjjFafBIsUk8v/DdFIC
 6Z58n20c9AEstks8bI0M+VKt3iuD9knsvXtn19De2UXxkWW/2/2uBA9BgDEVBno1xDq5
 byDZqRqHH1JG1VlPDJai07vXoWFN1M1bAlhk8mjvVsGyp25T16bML+YRvCb0u2hp01E9
 reAb/4cUqMgRkGs5+Pahjz9s3xltLBsBJvxjywBEaZnu/pzatxOnZWkBQky5kKSt9Z8X
 FG2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP0y6sQkrJutj+qfPtFR/z1YivFrMZdk1qfQsCNSem/2Y2T5Sdh48ytjEq4a7qS/XTPiohYin7P/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+rw9uB/auex93xaSbzOzP3czqGjEjM/FEySXacLvI4EHd00nj
 m+8FcMsh74hiCI313DtkO13qGSkPmH2fiLPh9UH7yxEtuaK3XZAZVpMpSIgMVSE=
X-Gm-Gg: ASbGncvk/rNQljwOe1JchOiYId7LOYOLvZ+L53meEbwSlrehfBJkXntsVRwo7LZ2HxS
 9wjUY8ixbioxCsmhb47JKszkbvDp5/LOx5cxj70lFBU4SAWbfQ0OJoIDU2S05byCrCWBjq/OmPr
 oy/s1lFH7KpxIUNZFSXbQfuLpJBiGSbqtWYD70y8aokH1HbbF2Ennl/HjU/8uCZdlnTofBO35B7
 4HlaxlKVo45m2btaBo9cqP2juTbkHa8OYV/KTeLxZLKW5ydlGghCXobP51tBCrgCE56hBnsXlM0
 z7y5UHH6jkM8BnZqREke23edtnBaIJI5p5zXYCUWBFJl9IVmVuzcDyH+Bvgly0xGGMc3iHI=
X-Google-Smtp-Source: AGHT+IEqf9njH57lPjDoguVBxyuYhVfWY6eG4RAwezPlVjJ1Ry1UmV8BlTHnLNi8bXe5ky8c13pKww==
X-Received: by 2002:a05:651c:98a:b0:302:3e14:34c8 with SMTP id
 38308e7fff4ca-307e583df86mr32501471fa.22.1739064057189; 
 Sat, 08 Feb 2025 17:20:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2dc241sm8608341fa.97.2025.02.08.17.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 17:20:55 -0800 (PST)
Date: Sun, 9 Feb 2025 03:20:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/35] drm/atomic-helper: Fix commit_tail state
 variable name
Message-ID: <52relusmwrcg6dmzs7yl22kbsmzjdgx2sltpelo657jx3slhz6@6bdhzrjjbq4p>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-6-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-6-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:34PM +0100, Maxime Ripard wrote:
> Even though the commit_tail () drm_atomic_state parameter is called
> old_state, it's actually the state being committed which is confusing.
> 
> It's even more confusing since the atomic_commit_tail hook being called
> by commit_tail() parameter is called state.
> 
> Let's rename the variable from old_state to state to make it less
> confusing.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
