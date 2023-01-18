Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D76710A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4210E637;
	Wed, 18 Jan 2023 02:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A34310E633
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:27 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt14so20933157ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLOiM6AzwpgYa1Gps0o2b4LGU2cihDfkk8wIckZ2dtw=;
 b=KADHcLXS1rTHYf1hPvKS/I4cvnDIE//3GCae//1L3Dv1aAKc92WBlmE65fxo3qf/R3
 suvOD9B39tKF3oi9kp1MzbnEbXupp/m7Rn0Q5GVg5SRpV07HA9tYECpwLDPoSsc9zfUb
 DAdYFlO+HWNeFtbpb+8YT3geFRg5CQyGip9uXiQWblDm8GK3wJHYnKvqffHWwxRb9lxE
 oCE17UFBF6aEkxfK74c+D6IyXOi65a2oNhTdyB6G0lPrBHhRYbdut1m0g/5OmxkCoizW
 qQbga8MaiaBKEFlG/7MMKC0OsNErEtAnN9lkIJahY4qOuhelDXYJYrOdW7pmc9w/SyKd
 PNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLOiM6AzwpgYa1Gps0o2b4LGU2cihDfkk8wIckZ2dtw=;
 b=PD0EfbhnwUy5VjoBvioyp+FcxLLknUf+uR1G+wA2TJluyamSMQk/KFELAC1hTZSKrm
 d53TyIy63GNtO30jJ7N9TPRJBxayh9CkKHXjeJ+Vl1ZAWMn/NcgzwedfskuoTqT0E+K6
 E4MB1JY45Sy2LU2BlYTW+i6jr+AW3+ZaXU9tDx/Zd9WBFen2mv3Ta/qdsvOHzDk92LL4
 YJDCHNiLc6WMiV9+BcgCoaGri6Bf5euQx5Cy03c8AJ0hI42sYBwAlGYBUjAtot3RoOh5
 tKytHl7geMVxkdpTqrHRDqPKhZcft17D6TjeFhuamZd4Fn9c55XnU8QZ/eeSrdrpCS23
 zWEw==
X-Gm-Message-State: AFqh2krx2s4BG3mGeLquzwxGPvsoUW9K15Nb1C5hzO23aUNfmvAvItav
 u6ZlmkqlvlC3S7BI0B65l6VmaA==
X-Google-Smtp-Source: AMrXdXsB+KcYxTvDBzvXoXaGBtw21/snKAs7oxT55WhZm+hCVlsUhTl0IsRn3cg06+yrXXbXrBXjEw==
X-Received: by 2002:a17:906:1c81:b0:86f:d1c4:ed08 with SMTP id
 g1-20020a1709061c8100b0086fd1c4ed08mr5038984ejh.69.1674007586915; 
 Tue, 17 Jan 2023 18:06:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
Date: Wed, 18 Jan 2023 04:06:09 +0200
Message-Id: <167400670535.1683873.1092572126944377205.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
References: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 05:44:35 +0200, Dmitry Baryshkov wrote:
> According to the vendor dts files, both sc7180 and sc7280 support the
> source split mode (using two LMs for a single output). Change these two
> platforms to use MIXER_SDM845_MASK, which includes
> DPU_MIXER_SOURCESPLIT. Rename MIXER_SC7180_MASK to MIXER_QCM2290_MASK,
> since this platform doesn't seem to support source split mode.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/00feff8f1274

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
