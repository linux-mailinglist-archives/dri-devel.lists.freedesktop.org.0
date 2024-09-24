Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971D984EE1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A2C10E90D;
	Tue, 24 Sep 2024 23:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iqI4xbBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF36A10E90C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:20:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so6478571e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727220053; x=1727824853; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BWzfcf6swf5UXV9ORSGTxQB8gm3cbeVNaurYZQU93RQ=;
 b=iqI4xbBMPtSGhlyBBV/9KoS1GHR9d2pyA8qpzXu2ezV+sAmQBkmQ7sxC0Qv/GW//vF
 YM1A7y/y26bBK4w3gnaigQc+5Wulq9JVK/9tmI+iwatMUHIK6hybMW6+QFLmIhWuaKZf
 TuuEZ8gj5Nr+EBQpkeTIqGWY+pcyu2AMcQqqMqJ+Qt5mLD5g1Cgw4Yq4JJaMJBidJox1
 TkqbC740Sr3fm2whAkNmRIJsrGHCh8n8Eijd6ypH+Q6Th8tFtkSxXZjEJt4pjHabSguX
 gk5p6pPVS724jNVFOEbvzC6YSgT3MFDlWsKFr89R5yKjG56JamoXy3kkdmFCMY0bNw/O
 AXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727220053; x=1727824853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWzfcf6swf5UXV9ORSGTxQB8gm3cbeVNaurYZQU93RQ=;
 b=m92wA2POvjHG/1uwnr5EyWZ7fMrtWlaCpojAPrj6rar2t8V9m6DeGEl09Ozh2nr+nC
 RmJkpRTPPvCmU9YXYSM6hAk4LDkVABih3QmzoFA7+IJG+bxK//wf18sz3wDYS6YZ4YVv
 v8EXHw8VSUi9kvUtrBbX95k2R60l6mNz/9OiFGkBOrn1QkeTqdVl64SvBJfk0HH5Lam/
 CuGvLNnWUZfPgUIA8QJoP8daWUo3fihb4m/gO3oWrVqZGuN1oDv5PaeSe+A3aAYevnBo
 DtU3bN3grpHHy4CwwZiQ4Mu4SVD/R1GpAHOZXJd5zozihv0ViG+BThejUQFk3KX2SgmF
 E/CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX83kSAYleAhYeFUiYtBtAQVPZut0xkkLBpgfoxYwK6XsRcX2X4kK5KyZlxhPm2k26Bi4zSq686Rnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3XCbghpZXd0S/ePSQAsL2I2YeCJD2rPurPSygyVUm9SKEm+2b
 P7eyrfubM5wpFsVgkh0+zLM7oRz6hfedY3Sq+bKOULv55oY+8u2dwpOWUMnU6UA=
X-Google-Smtp-Source: AGHT+IESGsMzP3PiA/3G8ZUYZ/H/NJt4oS6oNv8s7w5wDXiDCuL/i1Jv8EVQQsMqXIZrtQBGpouHtw==
X-Received: by 2002:a05:6512:158d:b0:535:6d34:5cd7 with SMTP id
 2adb3069b0e04-5387048b99fmr414470e87.11.1727220052701; 
 Tue, 24 Sep 2024 16:20:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8648ba6sm351603e87.209.2024.09.24.16.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:20:52 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 12/22] drm/msm/dpu: Add RM support for allocating CWB
Message-ID: <rfow6h3s4phb7hukdlpaivxd5ytb2dj2gh5otejwyqghlw5zmd@efediqayw7gp>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-12-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-12-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:28PM GMT, Jessica Zhang wrote:
> Add support for allocating the concurrent writeback mux as part of the
> WB allocation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>  2 files changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
