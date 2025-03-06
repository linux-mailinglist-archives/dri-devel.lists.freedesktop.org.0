Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E270FA54309
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B510E909;
	Thu,  6 Mar 2025 06:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KiQL8tUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DA710E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 06:48:12 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54954fa61c9so372091e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741243690; x=1741848490; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xHCquTSEunjfj+1YUVoUpApaUr1w2znED2tG1DEgAQk=;
 b=KiQL8tUtzaTizjfADh1Y5vp/N25cTJhtihpWy0FJQPnUkK8SP67Ldrcrd12dpDOU8Y
 NKYUHcc3qWOFbIY76E89Pah1Y61p2UW6wdR+YNSG5qiBCKQZxfT5KMf01mswiJ+d2kwJ
 gR5VHw5YaG3u8Aex3YAGj7pOYfvjxSy3+ZskjEd3JqcxCkqOdNr6hbnwiqu7FcMosn1G
 VqsednwO0y+EoywUgf8cXgrARKMohWbka3BSj0zyUD5x+DX/DRC023S08zpRxzQsnM1z
 8uFrfQv8x7DXGZXF8CGvwXexFrYjZIFNk8IjLjZvZh9KLq5oH8Gd7ze7yP0q4rXwEGaz
 Hh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243690; x=1741848490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHCquTSEunjfj+1YUVoUpApaUr1w2znED2tG1DEgAQk=;
 b=m6ey5D47HA4kj8twtkLoNNGqVl+eLgAFj71cZfQq72oYMxT9IKjbgMv3wHP7fyZsM2
 smgTHfB2GkFVcEDmGVFPYl8E7hQWRPijGc56QtQbwTkMG0vuTfml1LTf4sA2vqi4OaUu
 cICwngsXXLrBj05NHVkvz717+GedLBKf8lIgACUWICjuwC3Pjpn2urjMNe3uTZf9oyPf
 la1Z53aw0Qm9LLE0QeERCCSOoXYs6SFZI37oI925caM51bp8RBYTfapo/W4yXGTYblfi
 Gz2Lazty2oZHvOaDsOFQzrkpFFUEbVXymHGluKHK+LRjUU0iOP7bchXcFemxE95ONmD4
 Av8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxe/ttQsHEJ/L/NWMpz2xgy5GQdvJJ6/E0Q3192LnwHeMTguEFHkDRB9Ly3e+iXHuQnhRzgzAcYEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/9tqk2fltPbeGg/U+dFYO9zWnfzv5PHaB3ifbuWP4d6ErcF7k
 ygJywipTP+WpE+DWNB+Tj/FQVtruREAFjegkWr+rII4Nt6HqZkAqWcFTB97zqzs=
X-Gm-Gg: ASbGncs6/wdhJTj1lyF9X/erblh6tOqIX/8cH4BOmNRJ/DjD2s2pXYyXWa87hAzv8Cx
 dbMfuy6sldUC51iJ955Bum9jYAH7Ez2ngqUTEVxdyapPSLW19/NTodHQIREBwBxCvHx5kDtLGMJ
 ozsGi4Apv4B2h1uz5xBQkrsLKIi7dLZR36d3mKbuhn+U7MXBlIaLHORvw5zOasR8tytbFrJusXg
 YC7LRcQ4vsd7jCONZRgeodBFSjATITULGJjmOvdj5WwQPQkMtyPsVSJB8+mcuNJrDDQQezDTBPG
 cVxptT8mYakhf/8yVBMZgn8nVO+PRJKslo3PXmoZitrXFKvikwqmfAuczI39bAJxnGUnGoalYzH
 RLKNvt7j+L52eqdvXmhFRuuSs
X-Google-Smtp-Source: AGHT+IEt5G9y3ap+/DKUieOPRr2JaSqOwkMlnv51oikQmKDmuT5f9uColn4O0tNHRZ5UaMTYsN27/Q==
X-Received: by 2002:a05:6512:2827:b0:549:4e7b:dcf7 with SMTP id
 2adb3069b0e04-5497d331b17mr2846180e87.3.1741243690579; 
 Wed, 05 Mar 2025 22:48:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae58079sm83858e87.68.2025.03.05.22.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:48:09 -0800 (PST)
Date: Thu, 6 Mar 2025 08:48:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
Message-ID: <jwvctczoypux3pdjzb7ozslqc566nmvb7kfeujjhyqhr3bbbcv@sgiaeqowzb5b>
References: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>
 <d1162f8d-5977-42f6-931b-266a2f25049f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1162f8d-5977-42f6-931b-266a2f25049f@quicinc.com>
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

On Wed, Mar 05, 2025 at 09:06:08PM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/5/2025 7:15 PM, Jessica Zhang wrote:
> > Now that CDM_0 has been enabled for DPU 5.x+, add support for YUV formats
> > on writeback
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
> >   12 files changed, 24 insertions(+), 24 deletions(-)
> > 
> 
> Good catch!
> 
> Fixes: 15f2825defeb ("drm/msm/dpu: enable CDM_0 for DPUs 5.x+")

Again, this adds new feature, it's not a fix. There is nothing wrong
with the current tree.

For the patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
