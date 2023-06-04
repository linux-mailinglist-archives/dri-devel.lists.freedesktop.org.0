Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168B721450
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880C410E217;
	Sun,  4 Jun 2023 03:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436410E0DC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f624daccd1so256992e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847703; x=1688439703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4JfXikkMKanDCzgpf1+Ce6ZYTjTAFBs7io/Q5LFwuI=;
 b=yrEofRfbu3dzVN4kOUdLEcwuRepp0hlMduUb/t28RAk6id2fV0Ihre54GXl7W98fzl
 4ONqa0yH2b9gDEmiSncUu4i0ysoOzsbjiuz71hjWEyf+j+mNXe/R3e3W0mmjeg/g5X3+
 1qpIhFV8e4knPsUqXakaHluID3ka7e6d2ysONSjRMaP2u07pxKSIgSO/RBUoz89zA5Qd
 4sGzhjx8E3snKVMvkpAhqJxVYP3Y7j9lTM2yqkdlzK9LEj7Qau43+9lM8hA6i0mkz2Qn
 D9DOZ2uNoVIBbRphPT/Fc9H+Dm37BvPcFUzEzxOY4JA76Bb4eNpMftlTiE91HuINen5S
 F8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847703; x=1688439703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4JfXikkMKanDCzgpf1+Ce6ZYTjTAFBs7io/Q5LFwuI=;
 b=J2b56NJcnWrFp7TAWjlAcI1pkkH6j7KLD4/hCmeGuTOSwvKVSof+yKg9oA6hKLQOMS
 zK6SOsmCBr7PTK3BikRJtF/3yr81E9c5T+AJlFZHntZ8K2PhTetDdOzBopaAIhokoRyn
 JAcxI/f/j2vW9DX+QL84qcWenBghrQ6nSRkjNB/sSXOgu6e6nMzvXZlQ7K82KQtZeXlo
 Hq4T9n8RXv6kj83ouGg4hl0vrsv+HBlN/Kxzh4fuljnyBe2Y4JmkxxXHqH4utFzRwn+n
 H+PSiAuU+QDjFJNsbkPyP+w8rR5rBsAqpV6QJUFtXQQNURJqh2REkn/0gevNdsN84+DE
 CBxA==
X-Gm-Message-State: AC+VfDwt8WPl1lajPIYQRTUr5udGbtSn1T5l763gNN+2xFndJYs5AiCe
 w9eces6iMImCqOGqb92JB+tV/Q==
X-Google-Smtp-Source: ACHHUZ6VQnUAgekbOeBmv5OPbjpVHhR6iZZYiH0sZcYIkuFguqVUe9jewQJtkb9oxjoR8+v6SnxgDw==
X-Received: by 2002:ac2:4245:0:b0:4f1:3d9f:1b4f with SMTP id
 m5-20020ac24245000000b004f13d9f1b4fmr3616341lfl.49.1685847703457; 
 Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/msm/dpu: simplify DPU encoder init
Date: Sun,  4 Jun 2023 06:01:31 +0300
Message-Id: <168584750426.890410.3227550430081173245.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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


On Thu, 01 Jun 2023 20:22:29 +0300, Dmitry Baryshkov wrote:
> Rework dpu_encoder initialization code, simplifying calling sequences
> and separating common init parts.
> 
> Changes since v2:
> - Rebased on top of msm-next-lumag branch
> 
> Changes since v1:
> - Withdrawn two pathes for a later consideration
> - Changed dpu_encoder_phys_init() to return void (Abhinav)
> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>   dpu_encoder_phys_wb_init()
> 
> [...]

Applied, thanks!

[1/7] drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b930f14e530
[2/7] drm/msm/dpu: separate common function to init physical encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7731ee3b06c1
[3/7] drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8ea432b8428e
[4/7] drm/msm/dpu: inline dpu_encoder_get_wb()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/04ada3d8380a
[5/7] drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/004be38657f4
[6/7] drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed02d3dd18dc
[7/7] drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5d1227d1c7a3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
