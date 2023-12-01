Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A7380180B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5EF10E9A5;
	Fri,  1 Dec 2023 23:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C210E9A5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:48:17 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9c4df1287so36416731fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 15:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474496; x=1702079296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MJVF1ZrmInpC3Gvm7OoxUYxrkOmo0ZmH7AoQY/EPSs0=;
 b=hmm0sCk+Ts2BHqB0nE71Y5IzABplVUgIcgVXsnOiWm9fzBRJO0SV4EAZJmn1v0eEdf
 9vUNLcSZ9EMQACobEkxHwKJELfIGBcfsvSfsx6YaHxrWLL7yWE72KoZSMHTGax++bPHG
 hIkPvV/c3cE8l9uyWtGdpwYLOe72YOFP4/bF93WfHkq/OmleZNzZ6RvfNtHQaj4iWub2
 b2xb8Wi91WfsXpmuwkPRHVpnTt7sCr7sRt3EEnFLNR40HeGgBdWugRq74VFnEQF6BvER
 z0dM5QmBsHgm7ZqQUtPRb7eafAgc43p9m5BaBVyj9gh9PumCWIaEi3dVIt/IN2qn+g9v
 KMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474496; x=1702079296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJVF1ZrmInpC3Gvm7OoxUYxrkOmo0ZmH7AoQY/EPSs0=;
 b=VKqlxsmFmPvxz2VYhzKUEzMvz+aqu8VzQUharvRMVcAtsxajZv0ajEyM//QRqzCTpP
 UmAA2YlHpRRt/oxCmXeQn4Nu1kqpvA8w915RECSIsbh1SUp0r1Cx5WTgZ6opk33BZjIw
 6AwZVfSXjBCdu+qjzNkPLENbcOlgCJ5goawSNl/N1MPCdJylQmtE1/iaA9OBQUcrtN8Y
 U+Z/kVZFdJYYTBuBcO8Wvnh82kR/mEfgzhBxk+EaWL8A5uNUhK3feiFu8EYi9jDsQZSZ
 aonVO+Oxd/ZOAUK2xdXVvZq3UWJjdoYR9Dv7RT9QG0M4k8b2/CK221wQlwHw5aZxEDc7
 sRSg==
X-Gm-Message-State: AOJu0YwPkM176ywiLwuMYpLWgdCO1Xx6w12kA8FnQOmbnrKEyvgAmZHa
 1arQcW7AvZMtBzBIUurchxxd+g==
X-Google-Smtp-Source: AGHT+IHTNUQKLLhXANUvRoFzT3r6DBEs/yUnPcAE4JI0ahtu6IrjM/fQLRF3nClcM2LwCY50wd2GhA==
X-Received: by 2002:a2e:991a:0:b0:2c9:b8c6:1a3f with SMTP id
 v26-20020a2e991a000000b002c9b8c61a3fmr1491188lji.46.1701474496154; 
 Fri, 01 Dec 2023 15:48:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05651c131000b002c9e7c4a7c0sm118565lja.33.2023.12.01.15.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 15:48:15 -0800 (PST)
Message-ID: <e380c8c6-59eb-46c2-8b62-e9cbc4e90752@linaro.org>
Date: Sat, 2 Dec 2023 01:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: add QMP dependency
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20231016200415.791090-1-arnd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On 16/10/2023 23:04, Arnd Bergmann wrote:
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
>   drivers/gpu/drm/msm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

