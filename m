Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59A886D15
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A67911248B;
	Fri, 22 Mar 2024 13:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PwQi4zPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCF211248A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 13:31:44 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so2246949276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711114304; x=1711719104; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RYiJWD0Ul0Tt3aXboOB5LN8lg6CYH26yRurRIi/6JpA=;
 b=PwQi4zPGRWngcWr7G2ERu1CkwfZRPM4a22geXAJWcgkD3zvGs/poGEQq261nKdeE/h
 K1fcmNxwwcwRvh9LGYU8KYeSwV3ET4yqLLhrbW67VlxwPNQz+GxzSmOERrL++9Yqb/3M
 cMqOhSSe/vJEb+niS1Hi7H8b3XKmo45+wGfCJLeup+L5YzfIkiiKJr1m1hpX1msNVWY9
 kSRiH1m5ymc2NqhN+x74HPk7crC/gBjvWh0vbGxgEALwMZnRdURR6EGHIpnyl/m4OfDK
 XpluYmq7Gtw5zh7lnduk6n2qM9bgHbwB+PIaCw0YsHZ2fLjzxz/Y5N5T2Je8Czr9cUld
 zCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711114304; x=1711719104;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYiJWD0Ul0Tt3aXboOB5LN8lg6CYH26yRurRIi/6JpA=;
 b=DdXLINI6LYvkGEeJ+3v82KFpg0m7CoXhJ3pXaiROLsZ3ZBL1Xzxgq2/eyhbu/28932
 TO/klUsDCQZn1AY9uIJxHmL5x5H1IL3DNR/p/k0GetwWOuxkbSEFvtSqSgFahCRAql+7
 Kv85iZzy27bv92JwWuoQShoX/o7gI+pynnWE+6+9bx3h62M/Ns1CD0mpjghEL91dumBr
 o0fVFSgoELg4a1Dmx+KEHL0wt60RQDPm70eKumAxcUoi+F0MEQtr9ziRywGoX8OmwJwO
 oC01EbMQ6oFGwLg+GGsksCow+mploy0/cXw3IePUCbQgL9h9VVHQxUboA/itkIbNUTkW
 nGHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlnsZ0abEZJmMmY+I6/+GL/9x+g06/QxpBrswIveIPpp+o/BikhbvSb9MfodxeD4+i8I0HPpmeP9a1B0jTvIULePRYUg2oPzLufcZ8Dvvm
X-Gm-Message-State: AOJu0Yz8zps6bhb5su6nUJhk1kUoXS1BWuUOvzs8igYd5HZbIOHLoMsh
 J9EAablPIHa5p0e3WSgeifUPE70Zgs0JjvgYufIaL51GFhpMZsAOBac2nqsEOkFoInh2fROsgJu
 qXAT79BHmvxys65/F+TK01TY3dgQA6ggRWKYH1A==
X-Google-Smtp-Source: AGHT+IHSXoHBI+Zx3QkDSlxZKvtx9N74kcEcV/jBAp/cCjwxO+4WHNHkjLOfHtiJnTJ2hbqDQdUPCSB4SW25TLNmrDU=
X-Received: by 2002:a25:83cd:0:b0:dc6:ff32:aae2 with SMTP id
 v13-20020a2583cd000000b00dc6ff32aae2mr1825871ybm.63.1711114303943; Fri, 22
 Mar 2024 06:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-2-af14c29af665@linaro.org>
In-Reply-To: <20240322-x1e80100-display-refactor-connector-v3-2-af14c29af665@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:31:32 +0200
Message-ID: <CAA8EJppwhaZhee63hxvfbEc3RLT3rvHr6j35G3u6qU+HFzb_aQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dp: Add support for the X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 DP descs and compatible. This platform will be using
> a single compatible for both eDP and DP mode. The actual mode will
> be set based on the presence of the panel node in DT.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

-
With best wishes
Dmitry
