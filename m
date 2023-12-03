Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F218022E1
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205B10E283;
	Sun,  3 Dec 2023 11:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B7A10E279
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:45 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so8055871fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602803; x=1702207603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYIyCDkC/kqd/JcF0O3oBfyGO8lhYZEcVarBXABCrBw=;
 b=Xxt+1uegdhqxQpYQdum6HC/ugGLeVQCHNsZvEtUC6M5uCxI8XCAo3bKitkzBU1Ii/9
 +6AqvpsX3Qf9Gups5BnREd1EsYAdKYh363BimEtpNE/BeKOUzvQppwTga7r4X7FE3fo7
 b0qZV1fpzTr/0zwQog6Mn5bYKT3/WqDW/oCsbrLOE5+WP1S2PxyBc9jGmd34X+gyYVSg
 4fPgVwdaqa9XVQjJCF2BIbz+1klEclw43lurSCcsdMkN0B2XtzG6MTgKf2f0MxpF7QLs
 8RresKEt9d9NOQVZQrgVcWqyagpk6lqi5hNTMV7KCNPx6GV7zWQZnnnU82BHRX0oB03H
 YNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602803; x=1702207603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYIyCDkC/kqd/JcF0O3oBfyGO8lhYZEcVarBXABCrBw=;
 b=i9UOhtYZb0vdcejT5MMCv104S88Q9rRJQnOveI4OAvqwOoUevuBldJ4mR7PuxzK6sN
 0w7redCpFd7fxfeldt5ZZJPwnb4fBsq+WHhN3WFY6SpTWd9Oi6Rel47CJblhffsIjmaY
 ZDBbd/gs6i+UTrAqh/pU9OrDuDDVqBIflwQc6m+8r4UnGJMWgmCwyYDKiLBQ+54wEqf2
 m9zPzBZ46N/hhy5NyKrOxz7m3KRzuWr2OoLK0wfjuah5hsV6hKQUG7xAqazR4KJD8p5B
 bzpSriWUKfecFWS2EWkWbBHQKfBq6bNSep1D30J2sqHpdGtC/vd3C582NkYRAxTG6ZlT
 AGhw==
X-Gm-Message-State: AOJu0YwBLdkG+aCn8HapNa9xMs6zI1m4Afb5pESx+09Pyvtr+88ZZQJo
 d6OrI552FAP5BUHddl63KiUK3Q==
X-Google-Smtp-Source: AGHT+IGkd+42bCTta1PfLIbw2fWVI0/Gsi2Zxy2u8tGHbjUtLnbjt5NNhDwljHVNXb84baNOjl2LcQ==
X-Received: by 2002:a05:6512:23a1:b0:50b:d764:76ef with SMTP id
 c33-20020a05651223a100b0050bd76476efmr3048680lfv.126.1701602803553; 
 Sun, 03 Dec 2023 03:26:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
Date: Sun,  3 Dec 2023 14:26:28 +0300
Message-Id: <170160265538.1305159.8059575871895403270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 30 Nov 2023 16:35:01 -0800, Bjorn Andersson wrote:
> Similar to SC8280XP, the misconfigured SAFE logic causes rather
> significant delays in __arm_smmu_tlb_sync(), resulting in poor
> performance for things such as USB.
> 
> Introduce appropriate SAFE values for SC8180X to correct this.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7cc2621f16b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
