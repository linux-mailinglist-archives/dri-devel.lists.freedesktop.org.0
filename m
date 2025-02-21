Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2BA3FA55
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB5010EACA;
	Fri, 21 Feb 2025 16:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lrAEoiy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4619A10EAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:11:49 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30a303a656aso22839401fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740154307; x=1740759107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z+tgAjCj9MawDwVZ/hBSY+WAuy/JgEh3oVqbLFgO/vU=;
 b=lrAEoiy/ohxSvrjkTx5MhvbLUdgp7m+eWVvzMNRMBurwzWOAzXqrOD5N/gKOHmIfMl
 HVHAVT+C0Otnzfj1f5f0uV25qgv0++cIXG45eaQlGdA0zqhAwNxI7EaRD2X9NqNrUs7e
 0nBjtVKp4rozpR9hZ6lat6Cm9NP9aFEe+lUHrOIODZjBXAyWEWz71MIeZVbQEMQhi7wK
 9p4TuMDtvPTx6TNNkeCqh9KAGf2xoPBLAUWrnWNIB7mOowKWlToXU8lMH1f2RymHWmVt
 UjtqtJ1+OAU1exInBsGsoppWjl2nn/BAPPE6lmtJCHKBxNWXqo+tKr7XpyFnQaCkPj/a
 lLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154307; x=1740759107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+tgAjCj9MawDwVZ/hBSY+WAuy/JgEh3oVqbLFgO/vU=;
 b=f7Gf5c1J/+yRmM22H4nf2LEz6W5Ll4il2QOLvMs98H3wxjD75LQLhwTUKtsfVeFwfC
 WMJB+SnEuMYCeLz3Dg+yFBbymnst1fv/H111nRFFdczOQ/suT18DX2sSPag5YFxgllyL
 a6hPyeyw2DSYj4g2KC05wlqsIUIaQZWWl+d8/bYRQWuHxiLjQP043MruJDPF0I+AYVms
 003oj+ZjiO9XegZN2YQTMjg89QT7LvsEzNZ1E34HMrbYAzWxuKEvTFrte086w+dK8VhE
 QJ7Gs6UF04odVPlEXefGx4ZKlHIUR/RDb+12MzZ9Y0q7Q/Op5ImhuRespvEvAT9T1aN/
 0Q2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW65/qjSAL67AZVjxs+hiZXcLFzNaKA49uy48z9+gLu6xqIK0sNR1lTtOUgFCw4QtJOSAxWnOBW0V0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx92doLivHrwS90VFFeEIWmB9nP9BGlwjxro4zMFywHC85tjiJ6
 DDCKwgeqZFiaJsw9CGnbzK/5xWHZ5MhWltt031PvzyfekCs+IWdmsOISVlwJE6o=
X-Gm-Gg: ASbGncsJLZmkne++HuiXPrhjMd/SZ7i51GpLILuabYleyQCwpzdKOWMb+41mlfUeYOs
 nn5AQ/YCxKWAwZEva2bJZwq2m4gpL1WBZ0penoZdDX2vDMckWfA8YjTvLJH0gUd/PlwYkIgJOps
 iQq2EeHQN9zVU24ERyydM5fGfdWifQHhguCXv+T8xY2c6K0pQj+PIXW4PEGCijoX8WlIQxbhmzy
 xQQjQE5y/q9tFMQeMEYAVJbJYcEkGks4SGNPQczgHdM7QJIQ25RKZfea85CBzSW8cCzEpKRaoW/
 9mooEB7P4yrh3TXZw8Bys8msZHnLlOY/VOfC8jgJ636ymIpVLqrtXJpnQ/70/VwI2Dx1Dv7lVma
 G98qmfA==
X-Google-Smtp-Source: AGHT+IETyZBtso9u2xTJJhnVpTpjfbtC5aJNz6G9jWZcCAmcTZJGEkXDdGpqS0eQHNV8suEN6FsErA==
X-Received: by 2002:a2e:8854:0:b0:300:330d:a5c4 with SMTP id
 38308e7fff4ca-30a5b1829dbmr12028681fa.10.1740154307464; 
 Fri, 21 Feb 2025 08:11:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a4506729bsm8828231fa.108.2025.02.21.08.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:11:47 -0800 (PST)
Date: Fri, 21 Feb 2025 18:11:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 10/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
Message-ID: <k4ivqzdnvmllek4i4kmbqfhjcz3mohmromcfxyyn2jw6efkju5@mug3ndaptajs>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:20PM +0100, Krzysztof Kozlowski wrote:
> Resetting entire CTL path should also include resetting active fetch
> pipes.
> 
> Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
