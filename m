Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF9B5334B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AA410EB2B;
	Thu, 11 Sep 2025 13:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wGU8VWUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2E810E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:10:55 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so139014866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757596253; x=1758201053; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fICK12mWNRBHNb8epgyR7UU//hrM63BrRhLGMx3EInI=;
 b=wGU8VWUkOqAQ2kDkVmm12af8KDAEbTyomhMMAe31mWZ0GtrhNmj9jhwjWIzpG4yqDo
 LJaZjToOFk+9PQOIe6h//A1zsfdL9c+eO4k6dzJ7qFqhsOSkFV/QphCWq47H/r3jjNJn
 L1FpvppwLnEZClFdQWj25cvZGsM20szDODnGHu7nGBMtsyKcpHQGuxq1qGkLrD+z8tr0
 QNfi7AWtIubXEJ17zWswMGnF7H46sim1QQTj1S8J7EekiWFzeXW6hDBTeaHSIIky7gdn
 0y6PKDyAYGgJWD6SJnl2fv0QNS1kwwr4ZnYPpKGVmZtztOizuuD+TrtjIlEkyvz4eTbW
 mgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757596253; x=1758201053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fICK12mWNRBHNb8epgyR7UU//hrM63BrRhLGMx3EInI=;
 b=lSRiqjrb9XkuLjFSKpVnewiDSpdmqzObd1N9Esjr8jtYSLRBiSJk5ghG+SUCaW2NJn
 ngE7QjYmCSzQX2u+AOnGZosZTnIVZdV2vwdk47pyWaqvjqvSDSNuyfxzxAuqp9kh9c7V
 a+MqOydX1gzL/xBR8Uxk0JIquzERPW7idCtdqdJmhw4jr+2CENSrf2ov3vkliAMzcyl+
 EuJNNVhvpRnk7fNyGtbEBveLrXT+uSqUbElEeIGlVckMithlgUmyUxKcEbPz9RlicusF
 8uWW50SLHglcNZrNMIM+8/5RzHKWPIVkHa7yiMsXdCjE1g1KWTm8PW0F90K+crJO9NJR
 OrAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjM+Twc7mvJTLE+cZ/uzZv3Lpiwkd+VORwKygFrihnztvj5WI5XYygPpDo9PFYVdiq91TNWfLmKt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhx2hb2ZWEbiKSAfFkhojUKLxX3r0UpBHuiQh4XuclnsqqGzhd
 2VZMbOSiF8LbbjM6qr2TSFJ5BEZKVl6xDcsZZef2TVe0tjGv9h1HyPN30Vm1ZqfgFcY=
X-Gm-Gg: ASbGncv5G5UymnoPemf2uS1g4KRpnbVnwzENtMCE7eheLNUexbVcd4tQWktgLmYxOGB
 F5XrVG7TjCNeE6np/llFCzcJeEmQAhUq48+M+g/8cRuL306p7eM8FZlyyYQiZfyZVJCje0TwOGR
 rSu5rNjXolMs0EB/96ijpSIpf6CyG/hA/x5B9W2V2foWbrR9wirJLwO9xMeL+o0bmF/GX/BZG2e
 BPTQJVStgJlxniw89SAcJ8bo0AIG6dWJMHaY5yBWb6hidXOvqwB7klyYoN2E3Eed6d2k5qRMHQ4
 mX5s6tqkaUKGL10qUN59U1GZlT/9mOAw27GStJqffiqMOihFkszAENoYS0YKuihVgmV82pLrYMc
 sXoEGuCUTTjdivRcGo4R27w==
X-Google-Smtp-Source: AGHT+IH66fznEUgFxllILMqdvheHS0RsLBD6Wse+F7QEzo8HkwTr8xnUsQ0CB7hpJuztOUV/n+dF7g==
X-Received: by 2002:a17:907:7205:b0:b04:3e43:eca2 with SMTP id
 a640c23a62f3a-b07a633d68emr423207366b.13.1757596252775; 
 Thu, 11 Sep 2025 06:10:52 -0700 (PDT)
Received: from linaro.org ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da250sm132121066b.9.2025.09.11.06.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:10:52 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:10:50 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <kasmte3rxr3ukz2eqbwlzbpeam2qq2qimzdqta5dl5xsthnokc@smvts77lhirb>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
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

On 25-09-11 16:02:40, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > version bump. Differences are mostly in the DPU IP blocks numbers and
> > their base offsets.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Abel Vesa (6):
> >       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
> >       dt-bindings: display: msm: Document the Glymur Display Processing Unit
> >       dt-bindings: display: msm: Document the Glymur DiplayPort controller
> >       drm/msm/mdss: Add Glymur device configuration
> >       drm/msm/dpu: Add support for Glymur
> >       drm/msm/dp: Add support for Glymur
> > 
> 
> This will not work without the UBWC config for this paltform. Please
> include it into the next submission.

Ofcourse it won't work, but wouldn't the UBWC be merged though a different tree?
I thought I should send it separately because of that.

I'll add it to this patchset in the next version.

Thanks.
