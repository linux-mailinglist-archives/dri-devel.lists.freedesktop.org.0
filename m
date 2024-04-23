Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304E8AE62D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 14:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05DE11336C;
	Tue, 23 Apr 2024 12:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cLAytuRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E2B113146
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 12:36:00 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2dd6a7ae2dcso39084321fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 05:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713875759; x=1714480559; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nUm4YW1UwAedF7qs6RwnQnQDlQCeY2lio1mQAuIl2hA=;
 b=cLAytuRkbzqHLshDThUPjpzQiGVJGAQlhEcyPJHgs/1lo9WK5vzf3+yNwvRWnvhR92
 37m8NY7Knqg5wKD45N5SIsNb0u/KFomcS+PUB+YhA011s0bncDZtVFjsnD0ACuFtelmd
 YpZIipAQAXz1xAGz7m0wcvRkVY6ZOTcA5nIohzkHE0sGsHJeW3rpG6b4eBTz6wvqggjL
 JZRPGF+T/WLakJRPQbZXjptUsJXgX8y4jUrd36cpK4ZtM49Qoid5byPaO0xvDR/hE5x9
 RjY5qxaHnq0GggY9NKe3ee2Ku581Dis0ud+Ru3pTMKkRATWekUkw23aa432QtwM8oqAZ
 C7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713875759; x=1714480559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUm4YW1UwAedF7qs6RwnQnQDlQCeY2lio1mQAuIl2hA=;
 b=ICeMN2uouHu3+Mau1eh9kjDJ8siuLU9AX45c7KwZpO1uXLWAF/npP7PegzOr+K/iCn
 z4EDq+dP8RUCMKIqr+kHVohQcJEQVP1dUjGOA4fvspgXvv9akC6ZsKEGgDgTk8IlBho7
 JngeXE2UJrkiDwrZoSClamvxn6bwe7AaNzFHh1E3cQ4YYIy14X3PXWhadgLjdodWLPN1
 6PjejWic7TMhUCblsKTmUSj0c+Y4tnqEnVlOuZ5m7KTFYjK8L1e+G2Dp7FhfxI4h4nrc
 7YIfxpvi2ETe79zfVHzXwSXBWCuO8fbPAim/ZiWascdgjCN7B1KB14TaWznKyVMicQ+x
 aeNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFsdDo5LqbT5JMGAhs5JVlXGuIE9042MmlfNdn4fb3P/n9iYXnJaH5iUw3fLpA5+lLYr+9Pz1u56X8CCgZSTfI3J5b+Uzcbn3t6CQQdyU0
X-Gm-Message-State: AOJu0Yx1yuMuet7vmjaB8UpNP4vj+WiojYkLk3XC9NrgXrE32mJWedtu
 6Tx7PjVpz7Q3koMFhTKz6xLCXEuZhB3VxDGDCC8zwffWvuuPiqpQxG1zQB42IPg=
X-Google-Smtp-Source: AGHT+IEjshmlgcGx5nklIUdU+NXP1sYIs4i4QNvD/BiRJQIPm+n+8UatxQVPrvg7Lboi3hBwptw75w==
X-Received: by 2002:a05:651c:2214:b0:2d8:5af9:90c5 with SMTP id
 y20-20020a05651c221400b002d85af990c5mr13373645ljq.39.1713875758967; 
 Tue, 23 Apr 2024 05:35:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a2e9b57000000b002d46df91965sm1711649ljj.80.2024.04.23.05.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 05:35:58 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi: Remove dsi_phy_read/write()
Message-ID: <njceeizdk2pea3oqni3qpzl323dwrjtdin4cd4hqqewyrg6y74@pkpi42gvrv74>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
 <20240423-topic-msm_cleanup-v1-1-b30f39f43b90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423-topic-msm_cleanup-v1-1-b30f39f43b90@linaro.org>
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

On Tue, Apr 23, 2024 at 12:36:59AM +0200, Konrad Dybcio wrote:
> These are dummy wrappers that do literally nothing interesting.
> Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 273 +++++++++-----------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 215 ++++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 109 ++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 224 ++++++++---------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 205 +++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 320 ++++++++++++------------
>  7 files changed, 645 insertions(+), 703 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
