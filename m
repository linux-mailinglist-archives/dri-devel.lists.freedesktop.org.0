Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FE74F1DE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CB610E3BB;
	Tue, 11 Jul 2023 14:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13E710E090
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:21:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b701e1ca63so91967001fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085316; x=1691677316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1lWCMAO2Wq+27Lr2YJJEVAhZ3/UlQd9TJnV/cIBk7w=;
 b=MsGp1EXbHVqWHWLLVbyk+sBlcLNyKF7J/bk9t5xUgVdzFOlvTuKs7vtMNNs2QM9h0y
 wHksnk4Ds7LgYJXiZebUqdT+bcR2oxUP3t2Z+8mzKT7JhYJxiN9jwJPIvhyy9X4GQ2Zo
 6CRdh3jxsXu6n2JnhgGxR4qEi2+sa/TrnzAWh3WHODrsbhCZirHA8XIWh/hFOiszjmHv
 CcY7W2NjgFmdhEoadtypB6x388K111/zGJc8whNG8mXA64heoRx1swNmoraRuGIHSQUt
 4AmeatQ3naBLzfTEKVNQJUezshdfkVtpM1sgej2yw0I5t4m13M8HYxvsNzZgP9ZeVw9E
 8B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085316; x=1691677316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1lWCMAO2Wq+27Lr2YJJEVAhZ3/UlQd9TJnV/cIBk7w=;
 b=FIN2olQtCj9HS2MGjVq1CT+nwavvb4+cTnA6N1+qvawVSHsQxwid3ulxGU25IoTT3l
 cmT7vK8lHlrkY2CTmD4T/05K/TUz2lloyx27Pw7hd62cIQm0MA6eLdq3KwnFly8Uwiwv
 HNN9K2Fbc+KoUkTjmQgPE5f+JU3iFkIpK/+CyXfPZj4KLGjvwi7B6wlmNJ3iwcSi0Zml
 vmxohbUxbZkD3rM/WqArf21K2L51nStykLOXvPFSfyo13Ky6pVCKu3M+kvk2j7RF5pno
 EDaCt4aXBuW7HvspleNP81byfSDsB6D/LE9luNApffTM080rDVjPPJihDxovhowNmTUZ
 PYtw==
X-Gm-Message-State: ABy/qLZEtRPe/tEEsUaj/eGl32qYrLAx2cG9CPfZKABMQg1iP4CC4IJK
 v07s00n50Zbm42h38pSgOomZFtCnT4qnJunvA4A=
X-Google-Smtp-Source: APBJJlGngHUJZ9X9GYWIvjdWd3jqvBIWvRNWDWxXwyK92PFumAsDADmQt1A6Inkp2+TAT78sTjaXzA==
X-Received: by 2002:a2e:780d:0:b0:2b6:d582:5a0 with SMTP id
 t13-20020a2e780d000000b002b6d58205a0mr13499829ljc.12.1689085316464; 
 Tue, 11 Jul 2023 07:21:56 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 00/19] drm/msm/dpu: another catalog rework
Date: Tue, 11 Jul 2023 17:21:45 +0300
Message-Id: <168908465043.1869384.8392019740973235368.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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


On Tue, 04 Jul 2023 05:21:17 +0300, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> [...]

Applied, thanks!

[01/19] drm/msm: enumerate DSI interfaces
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9400b149f89b
[02/19] drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2891e44f85a1
[03/19] drm/msm/dpu: simplify peer LM handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dec7b5b5f206
[04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d32b4e813596
[05/19] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ff96132b91f6
[06/19] drm/msm/dpu: expand .clk_ctrls definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/44db3665f6a3
[07/19] drm/msm/dpu: drop zero features from dpu_mdp_cfg data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f418c06d7735
[08/19] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/058cf8fe4a2e
[09/19] drm/msm/dpu: correct indentation for CTL definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/541f02d8f5c4
[10/19] drm/msm/dpu: inline SSPP_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/081a8df0fe38
[11/19] drm/msm/dpu: inline DSPP_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bf155602a3b5
[12/19] drm/msm/dpu: inline LM_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2041f2a307f2
[13/19] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0598333aa5be
[14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/87a5beebc074
[15/19] drm/msm/dpu: inline various PP_BLK_* macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f5b8272707e
[16/19] drm/msm/dpu: inline WB_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba0e5c846a62
[17/19] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e9350a906b8
[18/19] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4638039e5bcb
[19/19] drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9c9bc8551f27

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
