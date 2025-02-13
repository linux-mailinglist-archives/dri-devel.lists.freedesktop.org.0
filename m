Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F8BA34971
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A2610E460;
	Thu, 13 Feb 2025 16:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oYggOvEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1310E460
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:17:53 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so1082213e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739463472; x=1740068272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KDyhBZMln1bycs64uQnjujYs7wjZ1a8hAKD4vRr/hAU=;
 b=oYggOvEq1ulwELUs7u0mNPYv2uelMNl1uVsU/qn6T0eg/gXfX2n1BEC/vwcYF6GWwE
 +S1vPlEDHh9UxKJWYW7ldNfXMnx7JLiaJzzQ86aff/rPYzKV72Fr6agfUK6YVgTHFkv6
 M+UG3iswfjNMVDoWgeLZ2gW2jSVrW0WC5odAGwKRd9FG3s66EViZlIo1SBgWfK+jchIh
 RGs826v96SMCJJTiB4paNIUPY8DLvtgHvNEilrSlBXq1qHeIgPODsMg+LmVOp817JrOK
 pdHfXg+JtkbDeh7OUeYVmlDfQ8nZ/Vvlad6NbLxgTmxobEZfMrPdjSrQsNpjRB+2s9cv
 Pcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739463472; x=1740068272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDyhBZMln1bycs64uQnjujYs7wjZ1a8hAKD4vRr/hAU=;
 b=RA3qY5ftLQmYNw0UHz/oK70bQKejlRxjhMC+gaINiGgvlokt9aeNSHq79uqrw79M4H
 F6pKNo0817rJGGDiZJ/3sQgq6amIAo2hFkcO4vjOX1KW2PHXvZLq0ub17Wz7j2APqbqs
 lG175ZyUvjdys/rbaCFHravMfZ5x7XLammPpX5E10uhAXkri8vg91306N0KR2icFWC6w
 YtJsQYEqDYqnj2aHw3u9+uVYaXXZV34f5Pu0fs0bYsvobj2K+Ytr+TLvCj0A/9BiddZr
 xXKwxVMJX5I1r3JWfUL1lwAsECHi2LLzPZHnF5tZFXKijNyPPu8WILpx+ruUeCDqDMPc
 fUow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJADbq/b20ckTEEvGNoDKr8pmGSMZF94suVe2wa+T4Lox6XFuUOgX86vCF25uNc8pf3c18ZqetHVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ5FxQRBIqL/1rhxbnXaZMM/lkzt3feu5t1Fshpuq4z5+zjt3P
 gdl4H/9qI2NKIfxkoyTAUF92Tmsonm9ylAoVLklMhehkGlKe3WiWzmW7wABOrPY=
X-Gm-Gg: ASbGncvLEkTxe4TQAs1VfTjiU0Ribahuvb4yJ8Y98RJudM3X/Xrefffmc3HY9cAc/4e
 hLvtL1Y+7wvv15Kple3cnJHeWyMOpDi2vUB4+GJrMy+f4BHPNkXD9rZINBVvR4YSLkoyQx71hVr
 k60qSOXUrg7Ug3TnyxX1mEeKkrh+2SZklnd9xM3NRI6u63qasIGPeasV/d89DPuCa+spL3QkY4K
 gjVozBQ/MedYtrSDN/t0vZas11T7TejOiXWk1V5htURb5Q/Dbcr7SiqINWmPP3U2OQU67L2jvOI
 sc+gZNiep9eRg69a9+jeETxIYV6lDOI8iMzqKaIR5vvSodiwkrXC53govJYJAK7m4zaoHDE=
X-Google-Smtp-Source: AGHT+IHN3tJKBCB+UaH1+WiBe+MXFHV+FlApLTdlK08d+t7mvXHf0yH9bADDvOWtecgwSkRMdcmKWA==
X-Received: by 2002:a05:6512:128a:b0:545:1182:183f with SMTP id
 2adb3069b0e04-5451dfc1418mr1293963e87.4.1739463471653; 
 Thu, 13 Feb 2025 08:17:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105d08sm209001e87.134.2025.02.13.08.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:17:51 -0800 (PST)
Date: Thu, 13 Feb 2025 18:17:48 +0200
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
Subject: Re: [PATCH v3 13/37] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_post_disable()
Message-ID: <s5fsxzk4kkaxv4fqtrjggvjvvaaln3eavyb7lwy7m2l2q6huwy@blttne5ir4rf>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-13-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-13-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:32PM +0100, Maxime Ripard wrote:
> drm_atomic_bridge_chain_post_disable() disables all bridges affected by
> a new commit. It takes the drm_atomic_state being committed as a
> parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
