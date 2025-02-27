Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984EA4749C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50D310EA2C;
	Thu, 27 Feb 2025 04:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VDAxqtn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAFB10EA37
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:56 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so530396e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631075; x=1741235875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6XslM7pJXykrnKKkRhn2NSz+JQLPJqLzjVxpIMfxMM=;
 b=VDAxqtn/nETYlLZrghRrth44UM6vJoX3Nm6KDkTFhOXh3imQdasOhDZwlUih9sXTzH
 JnJPagfdRQbv6SwmsP0ktxl1SSBgp83kqbffnqJQZH58if+P94xfUW/DC0QC1MnhPbaY
 NJbxXRbw2PuIi+R087tFwRGlGCV78/yZEk3TnKh3lPTaLCjOZS2J4L1sPhO//P4zqKmB
 kC6zREUaGUNuxnjOFdG03jW2XW74kdGdgUV2zss5ZpytcQeuRmDFTeMqJAmRL3eFY5z7
 EOLxJCqSY3FZNuFQhlybKIVvJO7oL+Mt3RVT+pGgb5QtrzBUurFoaDKng5AlAYNMp7l4
 c9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631075; x=1741235875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6XslM7pJXykrnKKkRhn2NSz+JQLPJqLzjVxpIMfxMM=;
 b=V5hvSZ7tqYu+VPfeRbarDPWyDc5EI4fDZaC61VjSmxrC6vsNs373wtuAN4qoqxvAES
 Siq0gqlnpXpXYMwGW/Q2wX+TnMoLVHEKujl6sruzaq/vui/lL/M/pjb9tQ7Y/CZdT3Sr
 j2Te7/lbNGxR/i6mitihS838uGpyxpjNJepAiAaVg9i6tVcReEIw1ojeN30clKFtY6sE
 kQUiNFUpQP2GQZktZyM9iCobAZkbyFC+M9AyBugk+ePuK0C/dSyyoW5xDFUdY4tQYfXt
 W4j3iqZdDikTcEOyI1HwSe7YqCRWLmqMJXXceo4pQevAtOMiBkyw36rhTQWzo9xLPSvc
 MNhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURLwUfzeyyKe2f1tUKvB+eYrkpy4m/WTrr5phvSOUYQB0qeBQIbqQxHLW9c1Hb3IumoPJaI3KxoX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgeXONLvZaHR6uhQuTpT5kh0ZrbFKBCDmFgGEZOrOG3/N5X+DT
 dM6r/KJZ8IHluX8wYuYUvKfqkw7Jzy9Yu/UGVjPp+1p1IGS3z8euZLWWu8bc88Y=
X-Gm-Gg: ASbGncsWoZAtYyqZFHRKYFmOib1nXFDycYHoNZA78TUXppbAlmLIvTWyh3z4CEWUGKx
 x8lhGaLLEfqmci/qmS8IKzaw76aUSCFVwUP+G/cDwlf9fvM3lYcbeVr33I8PewLC0s2u7y9eXLT
 O+QN2y86UJiBlot37wtI7eO2qwoZAbL1ar3FZX2lSTuGfIimZl7RLYm10vVVZfWIex0uB7k/bXU
 /nhYgjeBdTDL1fha5w3D55rkyCL+JT4/GFDQ4NdkZfquMo7rUb25eUi7jIhNPpJgFRBV6nXOzyo
 BN+ZyKaRotMJdpmid4+9+IRq9Qm52e+bU8gQ6Ypb/Q==
X-Google-Smtp-Source: AGHT+IG/y3BiL2mYCdzvxaR3HQ4vcwVJ7Z9hxPTuLMNoKwnf+P+hPCClI8k7cx+mmtTgSswFFHqxIA==
X-Received: by 2002:a05:6512:39c9:b0:545:fad:a747 with SMTP id
 2adb3069b0e04-5493c56f259mr3879927e87.5.1740631075092; 
 Wed, 26 Feb 2025 20:37:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/msm/dsi: Minor cleanups
Date: Thu, 27 Feb 2025 06:37:29 +0200
Message-Id: <174063096231.3733075.12973526206464749561.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 14 Feb 2025 14:17:43 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #2: Update commit msg
> - Tags
> - Link to v1: https://lore.kernel.org/r/20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org
> 
> Few minor improvements/cleanups why browsing the code.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/709cc0620107
[2/4] drm/msm/dsi: Simplify with dev_err_probe()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5bc3c3389d7
[3/4] drm/msm/dsi: Minor whitespace and style cleanup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cce156257ed3
[4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b39e7014ed31

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
