Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D737AC775
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 12:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A288610E117;
	Sun, 24 Sep 2023 10:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3347C10E113
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 10:09:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3231d6504e1so1013429f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695550195; x=1696154995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d2UMVpz+yvvkwATkXQokHfFZzHF3TmawiwpTGEMOBpQ=;
 b=vWxV6wZGC1HX98m4ILNjvtKGjBebatYokeN8p/nvUGLrzyHz8+2498SdXywyvIOjuc
 uXDmlH+2aF9cFAS/acqOX6km2iVMSrnz+LnHhJd1zo44F7+Ast2clIjcT/BY+l+rKSHO
 Rg9Jb9s5W1cYMO3ss1BpBxVeZeuc2pEMT0hBMPOpFihXrbeXaFZ7fDfntYh25zaMcYK+
 HMBWRWp6whUco2in5pIqyqajdw1Vu/bgMJ410wKewH+Z1vZo+miFRZjuuwSDGyOvLnnG
 botbQY47V4j7INPW+8zR6KO14ltFPkxlKPJfdKhks0VqLopdHhQeE06/xpZGDjf/ji+u
 4/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695550195; x=1696154995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2UMVpz+yvvkwATkXQokHfFZzHF3TmawiwpTGEMOBpQ=;
 b=cm7khKeUy5F0HhDquxV9yJzG6WIDWX4TtOS7iTmoqQxHeSl32zzkmvq7G21JAsCSrH
 rdJpXNTzU2rS5s5R6V/wOjSVcjGFjX/n+76daRbMyBk6vSb9OcxGVZ/NHJK16epsDtS0
 1ahJiI7+ddtlCHhXuyNc7ze55mChIw/3WKp7HTFS/hHHU5NwgfD0CSaG5sxrDFYjuv6z
 TAauU2FdNRxXmht5ZPW6ZBBN2YU+rQjEliTNbMNTtfmhQfovQP1N/lhGD++PyVM2tMDm
 t1uRdtreJis78WEJgOEddVTCIXGIwq33XPzKUxqG0uFKW82cdiDQKC/FAr9wuU20UwcS
 56Mw==
X-Gm-Message-State: AOJu0Yzneh1HWaXuFBDCP6st9/2NndnQy1tpDZWv2X9AROt2OiNDU9Pp
 iaPYzEb3/wtWDQscsJmClF2KGw==
X-Google-Smtp-Source: AGHT+IHDjtkitMT/+apVHnmsEYPtq5T343OoIdxluv9GvpNWnmlfEU8l0VAIXXFUrKjCoPD+hWx8cw==
X-Received: by 2002:adf:cd81:0:b0:321:61c1:7879 with SMTP id
 q1-20020adfcd81000000b0032161c17879mr3556577wrj.30.1695550195694; 
 Sun, 24 Sep 2023 03:09:55 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfed8c000000b0032179c4a46dsm8886160wro.100.2023.09.24.03.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:09:55 -0700 (PDT)
Message-ID: <7e230ebf-7c12-4809-b6a0-285eab805a1a@linaro.org>
Date: Sun, 24 Sep 2023 13:09:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/10] drm/atomic: Add solid fill data to plane
 state dump
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-5-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230828-solid-fill-v6-5-a820efcce852@quicinc.com>
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 03:05, Jessica Zhang wrote:
> Add solid_fill property data to the atomic plane state dump.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 4 ++++
>   drivers/gpu/drm/drm_plane.c  | 8 ++++++++
>   include/drm/drm_plane.h      | 3 +++
>   3 files changed, 15 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

