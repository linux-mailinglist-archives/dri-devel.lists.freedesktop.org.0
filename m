Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA0A5A55E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9682010E32B;
	Mon, 10 Mar 2025 20:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s0QCqipB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02710E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:55:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so52734251fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741640139; x=1742244939; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VOWDQFfh/dqAVjze2LQJgK0R1nQSBQ+Z81JUBKH/8tY=;
 b=s0QCqipB14tm2mGbk83PN4McEXyKSn8dt9tZjqr9mtF49oHE7AEZY43q0vz/tdaOPh
 Zjp7hDT4ry5MZWL1/Jc0f4IAIrKckUwbiYS9V/oOaWYwDG0sjJbly93DVmDkcIMUj+Wl
 eeHbqQIV57je6ywYrQ1W8CkfbY8A68iADgNtZv+3/gwnRFc/nd8hunyWLJm6DwXuybqo
 DqrXgfbd9UER48EwNWEZSN/0Dt1gf7nTFIhBHmdJs+Vtc7C9FQ1luWoMXUXnN4MHctnM
 9SEO54nbpb16bX9l0mdbAiHzTI31Ezxqdtn4ClgdfTPA5j4Ekh2VeXLhOMM8jmcpstJJ
 m0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741640139; x=1742244939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOWDQFfh/dqAVjze2LQJgK0R1nQSBQ+Z81JUBKH/8tY=;
 b=StgIr/x0gozLcfUeE8bgrsrUqnT1jJG3T63N8cxpjU47mSwdKO0uv3XFXRQ9U8ARod
 +o8jkukf+yM3/+x08kjzdbS+bLhgJcUZZwMhyWGV4fbLINXlVP0jr+LivO9BbJd99KA3
 pYL5oWBUoHV4N5WFaHkcTiyWfHlDmavTXr+NxfV9uU7MAxcWl1LAqjTHvBfgRNJTUP6x
 nhHwI6beGvmQ0oV5LROE954C357bRYp+ZVvmNrSp1y9odl8IdMCB3zLeL9EKocGJBVG+
 STno+9YZBn/fNsXbt1TvPypquvtiGrrKwWONEqqu60EvoCU1AAaqamn6HL6PymX3h14B
 xLCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQEQufdM4In7ENu1/z4R+dQYe+UbDOktb2exGMrfXcZCgVdE1I9nzA28nQi2ejM4YBbznok4Jpozo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy2Fwd2hLEyNx2xJaECrxTdOtcrBmT3Vu/HJWb7oL+ITUZ9YMt
 Lx5bHfGg6BwxMuyYxO8ri2qQefBHYAJ45rY/auTfg1EZE8rEYW8nu+YJotEg0M4=
X-Gm-Gg: ASbGncvGUqsvhphpynNFPfjEgEExgT2y0/dEAxr5Zxu/SKAAx9redUrG2K25n8W41ft
 w+wohoMrm3UL+8hdqDgmA/nV/8/lx8CB4OU4ec1LmrXuptIoOgnw9nSYfhZ50f/S+xaF8aTdKJA
 kWR8J0PnDOBRDT2sbDXAM6mAVoIfADJG1wiqKY3GJaXy89DE5hF8WjuFrGuFAm2GxxCnnPX3XDC
 LBCAuO/6hbfly71tUwlcGH4zF5oYR603vUlR4D5TpfGPjjewQ4k/liK+tUjIqyJfe8qtJMN2hIv
 SMoKa7NZfR2/c+gBwXjSTkatC9WjTtLmCVU2m47ffruE3h53WIZBYLg3VHzU7uc7FGW1nUCqO7+
 xvk4lv1uXr8La7YmcXqk/Z/rm
X-Google-Smtp-Source: AGHT+IHubY+f/rhxrSBxiaa325h/nsC0f2kSD//bxK0bB6+HKDQJSbjODqNhRDdqPFgVEC8cmQYHNw==
X-Received: by 2002:a05:6512:224f:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54990e673e4mr5915381e87.30.1741640138654; 
 Mon, 10 Mar 2025 13:55:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae5f4d1sm1565991e87.103.2025.03.10.13.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:55:37 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:55:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 7/9] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <k4c72nwjyke62eyurj6v6ymfwmdgu3hoxwv6zx442c5afin5cy@scqalfe3kwo3>
References: <20250310040138.2025715-1-shiyongbang@huawei.com>
 <20250310040138.2025715-8-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310040138.2025715-8-shiyongbang@huawei.com>
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

On Mon, Mar 10, 2025 at 12:01:36PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add HPD interrupt enable functions in drm framework, and also add
> detect_ctx functions. Because of the debouncing when HPD pulled out,
> add 200 ms delay in detect_ctx(). Add link reset process to reset link
> status when a new connector pulgged in.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
