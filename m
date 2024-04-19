Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187BF8AB13C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 17:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3877310E417;
	Fri, 19 Apr 2024 15:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zibTBwUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4810E405
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 15:03:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-518b9527c60so2408764e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713538991; x=1714143791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vJfnYZByoznqV4E5LwTYL8ExQfIwOVzSYp6IyIU3pkk=;
 b=zibTBwUTyTXu0qf0yJCW5lh0yV7Kz1AmKcBSa7IDclH4IJHx5yNuRZOJDAYPHdm2ya
 j3wHMecQoU7oeK3LiImF2NyVVoDlcbBXN4QSwSCbcjR00WTiGWjyds35JqodWzmWgf8w
 wBGKNlDILgPGfxIfLcWWuSOvLZ4K+KNLeWpmZiI+hxwG0N+j1ihx0YzW4t8bhHKtv4mg
 mfCNyDsPs/vujTgwgW8LbhVbqJQ1bGI/QD74DdJzuy0a3qTbUwWTyCuYqVDvG+ss11ac
 tVfgQESmjsCW/a0FvflvZ5fYO3RjRmwy4Q4BRRQIho4hLjudFAr7KD2nzVznxJYAhwMc
 iRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713538991; x=1714143791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJfnYZByoznqV4E5LwTYL8ExQfIwOVzSYp6IyIU3pkk=;
 b=VjmLpVb8BVbUIdA8PyE/D64EbV4gG34VPAeW6ZLsmRvwvD1Bwn9VeAYgBqKMNpZ0B+
 1b4P2/4gOm9cQwQ8i377bpuZDPTQHLMc8y/E2nrz4MLx7l4U0GKUSMbhson07MTVbmwG
 FR2egh3s6wEA2etx0lc1SxxxruFephRmurAtmEIZU0bKKgnh12lC3iRbLGip94I+h4Y2
 TDWLZfKeo8d4ZJ53xXhFMi7eswnChZIWteGpkK8B3ZFshGL7bbvmtzMmeVawWE6gTqcW
 /qO/AEEDRwTtb6as2bb5+0mxL2f1iBnFGaySC0ez915oxKug9heh9jLNKVR28lMrLgPJ
 DhAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMMXwt0k0iEV94D+2E7BWHAukP1cqZL8tMUjMdjDBHCgCvGrP21HgevELQpe3UMcd9QWFaGh6mz1YXdGaeHLWNR/Rmma/p+DP5/S96gbuJ
X-Gm-Message-State: AOJu0YwzNY/SJo1qhBK6ZWDdUpterLUSm8xhZUWFnAVHkb+MxlV8KSfu
 clL5JCOuY2OsuOOS3rX+/YeYMxOA/6TY2P5Ec1WW/y2rEYadKeAyTjLHI4MvBbY=
X-Google-Smtp-Source: AGHT+IHwq2o3uW4PSBY4kcgDT3W2C9YBTiK8FKFdrI3qyLtn31Z5RjDG0xyVaYRX8cnMM1wh1zOKMg==
X-Received: by 2002:ac2:52bb:0:b0:515:ab7f:b13e with SMTP id
 r27-20020ac252bb000000b00515ab7fb13emr1993365lfm.33.1713538990549; 
 Fri, 19 Apr 2024 08:03:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b00516c077a312sm735082lfk.308.2024.04.19.08.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 08:03:10 -0700 (PDT)
Date: Fri, 19 Apr 2024 18:03:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for older python3 versions
Message-ID: <ggnnlu67nsc7szqj2ndvmwtrbuyk3by2ja6ytcsr45q3tswvio@ehgbpnyxmvyz>
References: <20240412165407.42163-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412165407.42163-1-jonathanh@nvidia.com>
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

On Fri, Apr 12, 2024 at 05:54:07PM +0100, Jon Hunter wrote:
> The gen_header.py script is failing for older versions of python3 such
> as python 3.5. Two issues observed with python 3.5 are ...
> 
>  1. Python 3 versions prior to 3.6 do not support the f-string format.
>  2. Early python 3 versions do not support the 'required' argument for
>     the argparse add_subparsers().
> 
> Fix both of the above so that older versions of python 3 still work.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
