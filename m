Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E327BCEC8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E45210E1A0;
	Sun,  8 Oct 2023 14:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65C710E195
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5031ccf004cso4390202e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773688; x=1697378488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFG+HbWkCL5q3sRytHz2EUARFUhHTNpTPTS/2TGCkYs=;
 b=dd4vCyfvB3jASzr6tNS27EZgdQrHabxf0d103HCMmKddj6lHgYe55vDhFi8DBU3/tt
 GBXy7T+22/mae6O03eShOAPe/f+8k5h6aPef2VhPChRgIc34OJzXXDSH+adeC4Skv4fI
 iV896voutDyIunwwopAkDngxoOYUz9UbwToIdJPXFKArci5Fy9Rrvv4tN/f7dzURzalD
 vrH2XdVbFaM6pH6yiPGDI4dqXtxpRZkjPcUuANQoUmDaYPTp9iN9r+GxW4OlvHy4RrlN
 3qS3Vuk7M2TYKs9julkRtVautngWmkfmcjKgLA4XjCxmL9Dp0aTXLToimf9fitB/tRYO
 aKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773688; x=1697378488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFG+HbWkCL5q3sRytHz2EUARFUhHTNpTPTS/2TGCkYs=;
 b=luW9zml5zMmsNfJwJZCBZaHrNY75wwYLYbiymAodGpcsJB5flcFKh5hO1X7GwTck+l
 MV9ptIb/RJs3gsTj80rTAZKbExyu5fJHv+1C6eaBkgW+LwySuPBxBXS+gDOY1o6jMSCa
 lj4YpUvcWTHmvYzIgR3YAe0++g6vKRmZtr4W6FKFQX3kW+8Fo6Sx+BAWLuf51AdKFAxt
 E7UvtnTAVZg1ZOO8l4Q1VKu7WwXHKk4nf8YXoAaYOHHNTyJxiDq/z5kdJ10DWXkdbgjv
 cHvz47MKeJ4Yn4L5LcockYTjYEK0Chd6Ezf2rMpPX4drmm+2PNJQo2OQF0b85DeuR9Jb
 L+Ew==
X-Gm-Message-State: AOJu0Yy4xja7pHQphuwlwm55nzy0oSd1tjFUpplgyF6nh28OTiekocpB
 r0v4COc3bW9RcAP26pNNGlgfK1SLVXgWAuqpQdWiCA==
X-Google-Smtp-Source: AGHT+IF9SR2eKmWzelixific7kPQBmMahRChh7MHMDUtBo/o+iJKla32qvo/C/wtuhmKyiBSevln/w==
X-Received: by 2002:a05:6512:31d0:b0:4ff:a04c:8a5b with SMTP id
 j16-20020a05651231d000b004ffa04c8a5bmr13427692lfe.47.1696773688103; 
 Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 0/2] drm/msm/dp: More DPCD cleanups
Date: Sun,  8 Oct 2023 17:01:19 +0300
Message-Id: <169677306905.2570646.16231496941138431299.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230906181226.2198441-1-swboyd@chromium.org>
References: <20230906181226.2198441-1-swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 06 Sep 2023 11:12:24 -0700, Stephen Boyd wrote:
> This is a follow-on to this series[1]. I can resend the whole pile if
> desired.
> 
> [1] https://lore.kernel.org/r/20230829184735.2841739-1-swboyd@chromium.org
> 
> Stephen Boyd (2):
>   drm/msm/dp: Inline dp_display_is_sink_count_zero()
>   drm/msm/dp: Remove error message when downstream port not connected
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dp: Inline dp_display_is_sink_count_zero()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fb48250ca919
[2/2] drm/msm/dp: Remove error message when downstream port not connected
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e117fd68f973

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
