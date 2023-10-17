Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74B7CC315
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2591F10E2D9;
	Tue, 17 Oct 2023 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051D10E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:24:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40836ea8cbaso2568445e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697545497; x=1698150297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ozeZwgkp+vRFcuajR4h9TKlzl5D3KSTpbDUYKL1UCt8=;
 b=ANBiaAmsbUERZxcG8T+ecFlGMaBIcn7UYG+uOzqc8e5h5HJQxEuEOB5pXF4B1bgn2l
 FwqAiyj4bkHqW5c46i61kDxH35L1iLkEyHbDu2mKfllA8u5KWvuqKgRSSjRscazy9TS9
 VdJOTKhe2rFSsW357SPyPU8mW9rj48/kSeGqLl0wmH5GwyExpekYI3rXjE0k/20onzyQ
 sfgbN9nCOUurjcLwUSu+bmYsZtW5+GA9aaYNtErnuRF0Ijp+cXCVgGAeJC+X5hTa0F77
 XMdhRkLljpjtg0A8pksz1fLFoGx5C8CCOeGYUxpciTPRqLoKaJERsqwmCvShaoSLLoip
 Np/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697545497; x=1698150297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ozeZwgkp+vRFcuajR4h9TKlzl5D3KSTpbDUYKL1UCt8=;
 b=GbyxXh4eUkC/7gIP7xWhCAzK/PxbbaXoGRx+Gg4DCfKFq/yUnQRtU4/QY1md4ooKo5
 z0dwAHR820xNefhmU3/gJwE0gUNFcOBqo/tYeMgPiZNw3k3PFIoy2KnDLB5y+Fv4N6vb
 vNAr9o2md0h8voTm5TgxLIafl46YsR/4AH8WEVExytLAhmcEDvg0Fkj8Xv51dyaJslco
 i5y8V8iTRd8evrfao9XQg2QzRx38cQGaE6CKBmWp7tRoTkSo9tlD9pdsrArrA7Si/EkF
 B7XMxJjok4DimMKT7/bMQ3tW57MtDVP5Ybpz5EgzWzVPdLuT7cfrUgcHllw6Goxndqs4
 z/AQ==
X-Gm-Message-State: AOJu0Yw6jQ48ATK6PD0cj5/AtBkYgLmsbo+Pr8gFcIG0Au9+3OjJelcH
 AktfpRNGAKGvYBmjvwx9U20+Bw==
X-Google-Smtp-Source: AGHT+IGg8znu0XL6hiUsVG49mOqvM7r3dSunSyWodgCmDxfSgN22OeXYgLx8CiI3+rLp2k9Kcu3OFg==
X-Received: by 2002:a05:600c:1990:b0:401:c338:ab94 with SMTP id
 t16-20020a05600c199000b00401c338ab94mr1531267wmq.29.1697545497386; 
 Tue, 17 Oct 2023 05:24:57 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b004063c9f68f2sm1524491wmo.26.2023.10.17.05.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 05:24:56 -0700 (PDT)
Message-ID: <044c2493-1294-4760-8e33-51f631265d59@linaro.org>
Date: Tue, 17 Oct 2023 14:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: add QMP dependency
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231016200415.791090-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016200415.791090-1-arnd@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/16/23 22:04, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When QMP is in a loadable module, the A6xx GPU driver fails to link
> as built-in:
> 
> x86_64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
> a6xx_gmu.c:(.text+0xd62): undefined reference to `qmp_send'
> 
> Add the usual dependency that still allows compiling without QMP but
> otherwise avoids the broken combination of options.
> 
> Fixes: 88a0997f2f949 ("drm/msm/a6xx: Send ACD state to QMP at GMU resume")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Right, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
