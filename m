Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1F8022D9
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B9F10E27A;
	Sun,  3 Dec 2023 11:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6C210E13C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ca0288ebc5so151211fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602797; x=1702207597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYGb31/GvDPJsBFOKGrOafxuEsUy0gUvwyHcMJDnEIw=;
 b=WwaCUMA4GUUxiQLtjMQjqWLuHFD+ja3n8YYPcHRYcVcuxwp8ySL56vZgLY1/olfrRy
 HP69ra7a3hX1xIF8aSVXGmZEcB7+i12qzCqXMUv4lfLxH3TFwbrGwB7iUt0uwFYB7TUd
 iHBtq9+R1HJBI6KSO4lb0DzmHHTURVMmj7D/hVLOurTOB8K7qk3SRC0cRVct07frH8Ag
 dSbJqCGU4MhbJUw96z2ZwJT6zJvJFWV5niHQ3VDm0IM8w3s+ss2meyqomU+QjxfklmU6
 fvUEGLWowMDbvRdAFE5cUarbfdRPgpamgaZ2toCU+zvZJOH/WsnlGoDPu46UrKq/HwrT
 q9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602797; x=1702207597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYGb31/GvDPJsBFOKGrOafxuEsUy0gUvwyHcMJDnEIw=;
 b=FszlvIKsLI5xbcmhDeS8lsg9mZLGmzcn7FEQzxMYZqOUcmm8RFHeCBlhsJWiwkyH4I
 ZR3azO2JgGhjW+ha8768DTr6I0QqUyDxDkA4NiWM5wXp2RUe5PIoulqkgpfmRSvvY8fL
 oyjA7A2aOZ4tBXOKVgoYWlbIxyYGkqhUZ5Hh3VMymgTRWIeo/297U4es7Fi1do/rwEmu
 EblVQQnvD3R7cr74uzIw+oRGAK/9f8t+2BKI9ECWwJEJZLMR9SRw4dc43JoXescoXblM
 3o42KEQ71OveIMn40vEpKZGxJxWutQMa+U3trUvcTt/oaTlrise1i7ut01ZtRl7mses0
 eFPA==
X-Gm-Message-State: AOJu0YyzWxjcvt38k+zbN3NxFBHTztDQF4T9ChdxSsKeDwgNj81GAiL2
 9RPeKlTDU6aE4xnQKFgsP9a/Fg==
X-Google-Smtp-Source: AGHT+IEizxhWQJi3VQazccosbJ0mirj6XMMfi7nH6/rfvt2MEcHPNTAfYO5Vehd0QrtjXGShm8OT5g==
X-Received: by 2002:a19:ad4b:0:b0:50b:d336:3170 with SMTP id
 s11-20020a19ad4b000000b0050bd3363170mr1969173lfd.12.1701602797619; 
 Sun, 03 Dec 2023 03:26:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 0/2] DSIPHY RPM
Date: Sun,  3 Dec 2023 14:26:22 +0300
Message-Id: <170160265537.1305159.8541320986435504084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
> Some recent SoCs use power rails that we model as GENPDs to power the
> DSIPHY. This series attempts to make such configurations suspendable.
> 
> Tested on SM6375.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d07a411b4fa
[2/2] drm/msm/dsi: Enable runtime PM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6ab502bc1cf3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
