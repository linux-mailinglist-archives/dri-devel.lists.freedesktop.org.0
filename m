Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8918022F3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F6A10E290;
	Sun,  3 Dec 2023 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B7210E272
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:46 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50be0f13aa6so1490370e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602804; x=1702207604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CutiCj2Gbdjhjf4p8E3J7URGYQoAelVBh1hnzF3CKz4=;
 b=hB/i/nTLy4N/CHTHtg63Zvg3uYMTQvvcY6j4IAyyD9xVpdYiGlHSHlugql4ofUPaPe
 VYLpT0UySydL5OU/AvYLFwf2Cb3q/b6SWuBtNNaujpjGi3M3Q3AyMfmxGHbiSr1FkBFw
 yPTPMY+QHFCmwnyRn26j0EVt214cDnWGWzAtqiM7Svx3c5qk0fEzYJzpofNe2dtZESf5
 P9HeTp/ck6yAqWBIRH4GPsxiUD5iC+4XGGoiuObzBdZDUQ4ft8OJkkqsKyWJG7GDJ7EQ
 QK9BBbhFjkez5ZvKDz2VZo5xFvxwPUxtWkcRFLmmirHV4gkkqf5yZzd2mDVwk8vGsuzr
 tHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602804; x=1702207604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CutiCj2Gbdjhjf4p8E3J7URGYQoAelVBh1hnzF3CKz4=;
 b=ECoopcl0jzzjHEPtDsdHKFQa+rGzLVZKEhcctaw1+674Ib+EiF2QNU/mPILIpRSyJp
 UjDZUuiC+ovbO0FZwYGnHZzc9aEz3J9vfqdkRjewudL5BXHCzBmt3q4SLaiT6TVuzBso
 YEeAxspXHrbQVRf9wVpoU79QfTmRqlfciLIbqjleCGI3uzpoahaZTylJk4kNno4NY21a
 csb57hpoBKLlGWcde9moFKahLtofKABaij5b2BcfORjz+O6FxIr0hW2NNFO4Zi7wLFyI
 Rygtrp0izHLKkTB7VanMxL3dSLRTSO0wLP2Pcs85fqGPTjExSriz7IjkxbNEwNg9LC6a
 Sd+w==
X-Gm-Message-State: AOJu0YyKjFHm/rZpA1lDk300g/zYXFtW06TmDeuwWKR0uttEgvInylEq
 BDQw9PVrKxYefpwdFWGT/iwxgeydZ8At0xVdD+A=
X-Google-Smtp-Source: AGHT+IELMw8begnWYh1JEtImLoAtELXxBFAf/X/9fgbdLPplqzXs4SKOzVzWMZ7fy3T1VGTk+k7SVg==
X-Received: by 2002:a05:6512:3189:b0:50b:e6e0:cae9 with SMTP id
 i9-20020a056512318900b0050be6e0cae9mr1168768lfe.26.1701602804382; 
 Sun, 03 Dec 2023 03:26:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v9 0/7] incorporate pm runtime framework and eDP clean up
Date: Sun,  3 Dec 2023 14:26:29 +0300
Message-Id: <170160265539.1305159.10276635989020703494.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
References: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 01 Dec 2023 15:19:42 -0800, Kuogee Hsieh wrote:
> The purpose of this patch series is to incorporate pm runtime framework
> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> driver during system probe time. During incorporating procedure, original
> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> are bound at system probe time too.
> 
> [...]

Applied, thanks!

[1/7] drm/msm/dp: tie dp_display_irq_handler() with dp driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/82c2a5751227
[2/7] drm/msm/dp: rename is_connected with link_ready
      https://gitlab.freedesktop.org/lumag/msm/-/commit/aa1131204e58
[3/7] drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e467e0bde881
[4/7] drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9179fd9596a4
[5/7] drm/msm/dp: incorporate pm_runtime framework into DP driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5814b8bf086a
[6/7] drm/msm/dp: delete EV_HPD_INIT_SETUP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2b3aabc9caa2
[7/7] drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e2969ee30252

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
