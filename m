Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4328CBFB772
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F13710E041;
	Wed, 22 Oct 2025 10:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XsI1NHz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6E010E041
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:51:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4710ff3ae81so24716335e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761130314; x=1761735114; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wj0NZFWJVRGALI2+fvxHBDNu33Sev5bvshrkRXRWHmY=;
 b=XsI1NHz70GANzW2HEftzbXwL1LQHbJC5FJUpU9bMxDLRfGZt7dHVxm3iAMO7eKP7Jp
 F2jsDuXNHUMIDxQKcgEQ6s1E5QCP5EF8xrIeLxq/t7f89kg49IrCAw9VeHHpnLd4bHyk
 0Ixj+CGOJ+LTRqszLPdM/+aOt0Z2RSqonNTvLzafmV+lbv/8ehgfC2DBMUq/porvIqUi
 fcvyYAw1hY1PNDfy0NxCfT3y1cm0hy5/H/7ipdtXeAg7gGe2cLDgHhdGVbmOP3t7sr3P
 O9monoXevAx/b01L9NC8zqfRhkNoby9k+DS4yT9uwAJnrkrfscOV/h5kIfEvo25gAFiq
 fzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761130314; x=1761735114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wj0NZFWJVRGALI2+fvxHBDNu33Sev5bvshrkRXRWHmY=;
 b=q4i0Dyk0GtWDKZzGw4e9XZd3y1KdO2a4y2lcuaM02TBRby9sFLcBsJWdlFw1KS12ul
 FC5nrDDCd8riGQdLwzzDdX933PVfKqzx9Rim+kdUIGdU63d8m6AE3IGjjdhmnasTllqL
 tfc+8Svo2Ci88UYyAoiGxfAMPA0Ycl2emVWzjj1y/vEzmrmCnJJ07S3C54iowhnioe4/
 keMqIFis9/F1Nf3QMXN5zXY/QShWz+Tr9PCx+WcFm3UpjaSsrQxmC7eWYg21YzaAqoUM
 U47Pn/pEKMkHwGhj3QgKFbsPMVNbNG7uf88Yk5nErCL48m5sGtE0SYwrt3Dm4CRYgOTG
 Wrrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa7CXG8swyR3ze4CLRkSHS8XmnOqjBZRwR0t+dIrdaitlxabGTmjq5NiMwGJMHB4ILKxlXD5IUc/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIcKkhShvjeeJQEv92LEHRWXgAX7ZxxeEWlZR4nkAhTKyAZE51
 H2ef1fAfNg/fhhedVlLyue5qo/7KHjFF+JOA08V3tz5vwIbkQWcL9+TmYJiwPX9IJzU=
X-Gm-Gg: ASbGncszScPMB0twk8E7+xWxJ5b5yUE7Cs9YYCVBlfQR1LC9XEJ/qi76FtqtZnXOSLW
 5BDBxDItXhWp+poMK45gJucMHe9GIkwYAcJxe0CcQsAPsufJCcU3muxxwcaaK55/PO9pGbBdwvf
 T4AlXJpzYExoMQAsJ3IVLaT1xIdEtLWEOThULh/E1HJ8JafJtT7AE5aP1tWnWJAKd3Zp7QpUvi8
 AAwjEbbh4e6dSXLSPUUAoGwO3OOU8YOctFszoVTZrBJVB6lGsiO1xsoMGHvgDG/PWfoWPHnxldh
 NCJiCeZobricq59lEGI7qR8A38JetpiIOolWpaYfQqKfcQunSbcBPyIraa+aGcWZsgljiv66WT0
 ivyN4pIXA+Mq7kjhkBmemGZp0Hn5+n04gDLlQcU0mwUAXmF47GA1DeAHv3M5dX23Pzzn52pGV
X-Google-Smtp-Source: AGHT+IFqoTQ2HPqFhE+xoTH5Tzl+i0vK7I5FUuawS0A8siSroPNadoWtujMORQ1HXcf2sw7QAqJLcA==
X-Received: by 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id
 5b1f17b1804b1-47117925db7mr136759365e9.39.1761130313599; 
 Wed, 22 Oct 2025 03:51:53 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342373sm43403635e9.12.2025.10.22.03.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 03:51:52 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:51:50 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Message-ID: <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
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

On 25-10-20 12:40:24, Krzysztof Kozlowski wrote:
> On Tue, Oct 14, 2025 at 03:38:25PM +0300, Abel Vesa wrote:
> > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > version bump. Differences are mostly in the DPU IP blocks numbers.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> >  - Picked-up Krzysztof's and Dmitry's R-b tags.
> >  - Fixed the bindings check reported by Rob.
> >  - Fixed indentation reported by Krzysztof.
> >  - Re-worded the commits to better explain the incompatibility
> >    with previous platforms.
> >  - Add the UBWC config patch, as suggested by Dmitry.
> 
> Where are lore links? b4 provides them automatically.
> 

This patchset was enrolled with b4 due to logistical reasons
which lead to losing initial kernel tree.

I thought the b4 prep -e should be the one to use in this case,
but now I realized that has a different purpose. My bad.

Will make sure links are there in the next version.

Thanks for reviewing.
