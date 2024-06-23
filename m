Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A459913E89
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7B810E327;
	Sun, 23 Jun 2024 21:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nJNjN8ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6D610E32A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:27:35 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec10324791so43332661fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719178053; x=1719782853; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rNE32rpEcd64zunRnTjqX7aU8YPuo7H9EUSUmHlSCLk=;
 b=nJNjN8ui9+FhJ6+zQLqQD/l/hG8jOztuvl+DzY6mN39gaXDuIDhytWStbR9Vckqlb1
 cuLCRcNQiVwtSsAsZyY5XYe5gygW5zA9odrwGdISGRZPo5PEUODDsGgmHUmbtahrLgSw
 qU2gYYzt/rx1ATqJk62YxSfABcBRl/6CUA5ah9pxFjDQz3pgDqU6nuSUYEXbiihWxleC
 F9Ncd4b8sEL1enrIDfCXRLXlBieEdPIetHbQTtYx4QcErbK3FFT7woDtF+1pa5k0gpfK
 qwPgqbt2adwZzwpny27rCuJq+6Q4dsc20+iCCbDrVFdTY1okp28jcaC575naoPCQYj6s
 W8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719178053; x=1719782853;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rNE32rpEcd64zunRnTjqX7aU8YPuo7H9EUSUmHlSCLk=;
 b=GWl3kw3OB3m7TlSjbFCEez+O5TnTuZ3mMOkH68MhNxoxu7gWo+f6T5IBe1HDDHfCWv
 hOWqm0i1UZOLomFAJYevgvNO5Mbe/H4xaq4ayZoDgmSOlGuN4QZ+8JmVa5Pbnq0DV18J
 EMgX+Fc5CXSvcY+ZW7AkG/nARkQzZZi8HAHskp9cGYbgzYoIbSBAA3zF86cZ71Fhdnll
 sTCxPnxCQBGzA6lNpgwo2VQNTK4RWZj2Ylv+qNW8jrAEB4YcIRq276AyDZi0ZMolYpRz
 YA2ZixjwkpMONKz1JV46t36mvv+psEUC3bAJRFGgWaQ6O1343jv9xXiYS/0DuT9Bf1YO
 v6TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVH+0K1v69VsYLS259CJ6JF2E45zrKzPwNt1hPWU4HVltkdqwl+cPtRLNj5aODDk7gmpg+JUMA8Th+8yVtZVfdIn1XhZ1M0xe2Tca9V7oK
X-Gm-Message-State: AOJu0YxHa2QxYmWXshrvWPU1AmGfoZeMiLpr6yev9dSFiNkr+Btub7cd
 YYKr2yG72uVLrMRFftLkhCmzmd/Xdbop2d/MBvq1yKSKiQjRkv7L87xJW5B5V0w=
X-Google-Smtp-Source: AGHT+IF/oAb9bDIV7Xq+wDnZQlYyl5KMqCSgJrrR6Xs0F6Q80XAOcNHdPbUBXLkjSn8CcIowI3qwNg==
X-Received: by 2002:a2e:3a13:0:b0:2ec:57c7:c740 with SMTP id
 38308e7fff4ca-2ec5b2dd3a3mr15689171fa.39.1719178053155; 
 Sun, 23 Jun 2024 14:27:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d787ed2sm8287631fa.130.2024.06.23.14.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:27:32 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:27:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
Message-ID: <53cpusdumqfqecfcbci7kfb5fmg56gacmlu44rwpe4acdftbcy@pw4wdxrcq366>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
 <20240623-dsi-v2-2-a0ca70fb4846@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240623-dsi-v2-2-a0ca70fb4846@gmail.com>
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

On Sun, Jun 23, 2024 at 10:30:37PM GMT, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 88 ++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
