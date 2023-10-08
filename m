Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42F7BCEB1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3054910E15B;
	Sun,  8 Oct 2023 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6D810E15B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50305abe5f0so4895664e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773682; x=1697378482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoIMpHA56vFruwL7TA1WCypBUc6vcq1UqKu6g/6k+8s=;
 b=ai8DcbPvUa0Gbf8Q6KuiAQc3rIdaKrD9zytIgolQMFBSclRKX7IO3yI/oyOxAC9yOe
 GaHy2trgqO/nhCB1FXU+sigS9wC0S6zWCZwQ39FEUs7nf+/8AxNuA3/3/6vC2azD2Uu6
 GqSWoZTVxw/St4lQhXNyEczl5XFkzGY2PXKvb8fp2a+3xb+WMTJHNfSQOSGL6KqqO6rS
 9y1y+w0uhMYnnXRwO4Z0LpKxSi9RebWw2z65lqBXgD3q6AYEI7mgjrRJ7YRgmshNa3Lb
 3WwNxwmrbWGeBsBNuMgQBxZuGe1DWEa0tMeSJEmJoKhrQO+brQEuj8PR+FoMN0PJg2kl
 iAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773682; x=1697378482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PoIMpHA56vFruwL7TA1WCypBUc6vcq1UqKu6g/6k+8s=;
 b=l+5H9Yaf/gqUXO4hEEDAaFhMg3ao7Z1WSpNtXnHnXHB/yB0eNRMbrrEUfGxkGVHRCN
 jsqlYPxB3mBQSjpYrYymE8+JW6LPRhiPwFCkPvIkxhFJH4WXqeodP3NkNONNRO2n/wJs
 GtQYUVn4rTUbdARDivyQrzJv1w1DprFnrXOA2k/CppHhhv/4S0OZ5d1qR7Xu2Ko0SuJM
 74H8Qp3LJFuqOUlbcTJfrhDQfKulPfRoA4GFDxCJujdwygKds+EIW4mh/XECIMxnMtS5
 per/c2On14EZv8caThMnjpUvGTB17w49cEgiZUIV2Xzj3Zn7ytFMKGDRcqkNA6dElxsL
 zH3g==
X-Gm-Message-State: AOJu0YxUVg7VvMqIy8ENjPP/6aET3ei2DcKRdulJoAm1JtcYdvIvbiFV
 HPGcIVE64mVARiWTiWsA4xhVxQ==
X-Google-Smtp-Source: AGHT+IGNVaAG1fIEJ9vamgFxXU47R4fgVhcie2t8W0Nfu1ttbcfiPbHtC9X/HNM/wRWqsTuVuR694g==
X-Received: by 2002:a05:6512:1104:b0:505:6ede:20ab with SMTP id
 l4-20020a056512110400b005056ede20abmr13532044lfg.53.1696773682028; 
 Sun, 08 Oct 2023 07:01:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
Date: Sun,  8 Oct 2023 17:01:12 +0300
Message-Id: <169677306904.2570646.18328571573756710784.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
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


On Mon, 04 Sep 2023 01:24:32 +0300, Dmitry Baryshkov wrote:
> Read the downstream port info and set the subconnector type accordingly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: support setting the DP subconnector type
      https://gitlab.freedesktop.org/lumag/msm/-/commit/631557f9741b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
