Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D501829887
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8610E5B8;
	Wed, 10 Jan 2024 11:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0F310E571
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:16:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cc7d2c1ff0so45648041fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704885392; x=1705490192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xvNu0hS2gtTrfUSQddmhew5sv0RLzAxZIW7xh6bWghI=;
 b=LxeabVw5qBn+0SvE/rSX304JT3sXePolIZYL6OPOHuMh9OfcZxJfg4kluDCJr6IpKT
 k5ZSoHHVoWb52sa0ybaPpG4YzpjX5XehZgVCqbAO5kgf3ahwnn/xvMoM0VXsoILeuWXb
 x4nd5w+BwMt6nMNraHVywKG2JfS7lKTwz6XtHoioxmKRLYmK/sGYDyE2t7ZdjyikSF4G
 /Tsi4Nj2ETuMcSipZsNMBX66hKTidB9NMklYrENAqpdnCziNp3E751txRz4XfSQNELFN
 TVVssItDd5w4EgPnWw5cSC+ECGCwmgcsQ6U/5QJ95K+6Q7jGL9kAcmC6UEwOedObXAkl
 JMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885392; x=1705490192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvNu0hS2gtTrfUSQddmhew5sv0RLzAxZIW7xh6bWghI=;
 b=uFKwR79B+fMqilz1YGRpqAgclOB9tqhoJ71sD+4ztqA4cKguz0xe9LHesrG4aP/Bo2
 jwnXqc6BWK2rPaEHqlJ8PSYZ5vPXmT8sQYQZDRIE6o8ImKAviogHxmatLSSP/bakW/zk
 3HvsdZW8gUQDP3YNTSGWTfXD62SytotGdQa3YNj47HJDmwtu9McuVKYAHce5Cp2LuEVX
 z051KM68FvJ27VXBSnXTue6a8pkZ69KnjqnHyjDyyOJQMkaT4WlpcwV7J0VDrhc2svWD
 IDDpaC4U18pdJXpOpM4PcNUpLMWUE/jowoaG8wjGitdEtZeS957KLIX/ToyJImJZy7xk
 ZPpA==
X-Gm-Message-State: AOJu0YwUmrRF0frY1aUadPPBzoP51zXVKqrO4igYDvWSYBrJGj1e3HNz
 V2oeTxZjpmX4z7epi3XyvTRiOzkVyMgYXw==
X-Google-Smtp-Source: AGHT+IGhgUfZ43c/+WfGHdbLhaKwjKuq51//bDK18QsXvhYG7HJGBLp8/XCMO+4qjzFpQ/vjsFQQ4w==
X-Received: by 2002:a2e:9dd9:0:b0:2ca:30f5:7e02 with SMTP id
 x25-20020a2e9dd9000000b002ca30f57e02mr495554ljj.78.1704885392183; 
 Wed, 10 Jan 2024 03:16:32 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 7-20020a2e1547000000b002cd187bb0f1sm766479ljv.49.2024.01.10.03.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:16:31 -0800 (PST)
Message-ID: <7904dd33-6b6e-45af-b1bd-9d14301dba33@linaro.org>
Date: Wed, 10 Jan 2024 12:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] drm/msm/dp: move phy_configure_opts to dp_ctrl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-9-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-9-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> There is little point in sharing phy configuration structure between
> several modules. Move it to dp_ctrl, which becomes the only submodule
> re-configuring the PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
