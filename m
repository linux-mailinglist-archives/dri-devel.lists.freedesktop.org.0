Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388329F241A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 14:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3E610E21F;
	Sun, 15 Dec 2024 13:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vLgvXn63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0C410E389
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso3584330e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268253; x=1734873053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6RCpuSvue4hpoUhHcSyfcYpwTRHbw1RA0jucyvWPrY=;
 b=vLgvXn63QrSHIAK3FMlEOprwQikKHmRzBpfqtezuIXkxzSWlyuHYj5wuboqMamodln
 uo6j6k5zZ5W6+qlGmAWvGrt0rspSaGp2mE/KUjN1fqTuZ3N63Gl1ZpsyRnvrc8uuIap5
 Wr2C3ZoATyNjCDry9c0lO8vVrsGkddo4vZnY4lbLt0eqwcoYcgiTAFdx7KQpAtbhUn6H
 AY6CoBjglJyC9k9mIWqkD8nwydvkCahG1fIOiK3tmOqzDj2acQkvytDx/h7oYaBenuW1
 zVRpPYC2YBjv200IqH+7Uenc+G1dZxLC5MgFbhvRHeUgneXyK2NRXGn5LIPLrr4CfTDF
 gkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268253; x=1734873053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6RCpuSvue4hpoUhHcSyfcYpwTRHbw1RA0jucyvWPrY=;
 b=KUSzpmPRQl3hgI08fToXeMcdaCgXNGvLTo0gLdZeZn8k8tHni3/UAh/9zRBF2WpfIP
 GStaaQ7+zrhZkdS/uxlt+2A8or0W+MNxpCKBDjB0DAa6qTuzgsJ73LMRO0D8cXOCiorr
 HEMterKTDkAXgFtUus8GaWBSVFxK6tV/9g0vEw7Knw02oI4l/Css8+lscL4Y7nc+REkt
 w329n0Ge1bKPHa0l5/avp5esGJtT4VNUzW2/o4lqqsftLXiYgJE5ACaAgndKZDW67RKT
 wc3ZOq1/qSobEZbfw+czgGfDjABukRzpolUIjb1D61QeAOT//5ObtHgPRh5B3/s8WEqA
 N+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxYEe9lj7ptJ26TsSRLsz50EdJPBENcG34tRX/+Zby5kKF6Y95hlnmLWf8/aQPFRwhkFIQdrOOKFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNtlZYiBlUuq8st4z9sCAFIOmg/SZoAHRyNBjsFtUovnNkf5nd
 dlL3jxucaqiF7h7RB7kpmIZsJ8a7MmVh1MBJszSlKqfRCDAeqPaneZglNpF5x88=
X-Gm-Gg: ASbGnctFjTSSP3qwxGeUh4mktmU19DVCCfeAX7f+6QJ0YRGKTkt9DDGwqa9tBnAMRxw
 PDJIvjYQH63sWc8cVVCdpkQ7WdbzKJW+0LVKi9hwzxQaTQ30EgrgLW5TVSdUdUFdPyoL08nhzzI
 TLslGbXAQ2x0jEXcEtJi7I5IZfF6k00tYrKhTCQ6g4vnC5uGVzb5kbVrsvT60rjOpHUuFkM6gUL
 Z43IzP4VRPX8P8tuYN8BasdIojvopNzNK2hePEle2b3zSeY8DnQJZKDvjfK5ajzfopXobsY
X-Google-Smtp-Source: AGHT+IFU6V2+HMrRfVLaoWmqetk6W+EYxrP0DXnFOAt11x2SZ8DShJ5hEQO+8CJ4IDumWl61VcxjJw==
X-Received: by 2002:a05:6512:308f:b0:540:1b2d:8ef3 with SMTP id
 2adb3069b0e04-54099b6d7c4mr2590910e87.52.1734268252758; 
 Sun, 15 Dec 2024 05:10:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>,
 Fange Zhang <quic_fangez@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/9] Add display support for QCS615 platform
Date: Sun, 15 Dec 2024 15:10:42 +0200
Message-Id: <173426667308.2196979.11322859869026651489.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
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


On Tue, 10 Dec 2024 14:53:51 +0800, Fange Zhang wrote:
> This series aims to enable display on the QCS615 platform
> 
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display/msm: Add SM6150 DSI phy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5902cd2212eb
[2/9] dt-bindings: display/msm: dsi-controller-main: Document SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e9280f124b3c
[3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/701da2861cbc
[4/9] drm/msm: mdss: Add SM6150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b8871563eb96
[5/9] drm/msm/dpu: Add SM6150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cb2f9144693b
[6/9] drm/msm/dsi: Add dsi phy support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fbf937a89ad2
[7/9] drm/msm/dsi: Add support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8a570c93fb67

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
